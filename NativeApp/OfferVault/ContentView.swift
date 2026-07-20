import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var store: OfferStore
    @State private var showingNewOffer = false

    var body: some View {
        NavigationStack {
            List {
                if !store.expiringSoon.isEmpty {
                    Section("Expiring within 7 days") {
                        ForEach(store.expiringSoon) { offer in
                            OfferRow(offer: offer)
                                .swipeActions {
                                    Button(offer.redeemed ? "Active" : "Redeemed") {
                                        store.markRedeemed(offer)
                                    }
                                    .tint(.green)
                                }
                        }
                    }
                }

                Section("Active offers") {
                    if store.activeOffers.isEmpty {
                        ContentUnavailableView(
                            "No Active Offers",
                            systemImage: "ticket",
                            description: Text("Use Add Offer or the Offer Vault App Shortcut.")
                        )
                    } else {
                        ForEach(store.activeOffers) { offer in
                            OfferRow(offer: offer)
                        }
                        .onDelete(perform: store.delete)
                    }
                }
            }
            .navigationTitle("Offer Vault")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        showingNewOffer = true
                    } label: {
                        Label("Add Offer", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingNewOffer) {
                NewOfferView()
                    .environmentObject(store)
            }
            .onReceive(NotificationCenter.default.publisher(for: .offerVaultCreateNewOffer)) { _ in
                showingNewOffer = true
            }
        }
    }
}

private struct OfferRow: View {
    let offer: Offer

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(offer.title)
                .font(.headline)
            Text(offer.store)
                .foregroundStyle(.secondary)
            Label(offer.expirationDate.formatted(date: .abbreviated, time: .omitted), systemImage: "calendar")
                .font(.caption)
            if offer.receiptRequired {
                Label("Receipt required", systemImage: "doc.text")
                    .font(.caption)
            }
        }
    }
}

private struct NewOfferView: View {
    @EnvironmentObject private var store: OfferStore
    @Environment(\.dismiss) private var dismiss

    @State private var storeName = ""
    @State private var title = ""
    @State private var expirationDate = Calendar.current.date(byAdding: .day, value: 7, to: .now) ?? .now
    @State private var notes = ""
    @State private var category: OfferCategory = .coupon
    @State private var estimatedSavings = 0.0
    @State private var receiptRequired = false

    var body: some View {
        NavigationStack {
            Form {
                Section("Offer") {
                    TextField("Store", text: $storeName)
                    TextField("Offer or benefit", text: $title)
                    Picker("Category", selection: $category) {
                        ForEach(OfferCategory.allCases) { item in
                            Text(item.rawValue).tag(item)
                        }
                    }
                    DatePicker("Expires", selection: $expirationDate, displayedComponents: .date)
                }

                Section("Details") {
                    TextField("Estimated savings", value: $estimatedSavings, format: .currency(code: "USD"))
                        .keyboardType(.decimalPad)
                    Toggle("Receipt required", isOn: $receiptRequired)
                    TextField("Notes", text: $notes, axis: .vertical)
                        .lineLimit(3...8)
                }
            }
            .navigationTitle("New Offer")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let offer = Offer(
                            store: storeName.trimmingCharacters(in: .whitespacesAndNewlines),
                            title: title.trimmingCharacters(in: .whitespacesAndNewlines),
                            expirationDate: expirationDate,
                            notes: notes,
                            category: category,
                            estimatedSavings: Decimal(estimatedSavings),
                            receiptRequired: receiptRequired
                        )
                        store.add(offer)
                        dismiss()
                    }
                    .disabled(storeName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
            }
        }
    }
}
