import AppIntents
import Foundation

struct OpenOfferCaptureIntent: AppIntent {
    static let title: LocalizedStringResource = "Save Receipt Offer"
    static let description = IntentDescription("Open Offer Vault directly to the new-offer form.")
    static let openAppWhenRun = true

    func perform() async throws -> some IntentResult & OpensIntent {
        .result(opensIntent: OpenURLIntent(URL(string: "offervault://new")!))
    }
}

struct AddOfferIntent: AppIntent {
    static let title: LocalizedStringResource = "Add Offer"
    static let description = IntentDescription("Save a coupon, survey, fuel reward, rebate, return deadline, or warranty without building a personal shortcut.")

    @Parameter(title: "Store")
    var store: String

    @Parameter(title: "Offer")
    var offerTitle: String

    @Parameter(title: "Expiration Date")
    var expirationDate: Date

    @Parameter(title: "Notes", default: "")
    var notes: String

    @Parameter(title: "Receipt Required", default: false)
    var receiptRequired: Bool

    static var parameterSummary: some ParameterSummary {
        Summary("Add \(.$offerTitle) from \(.$store) expiring \(.$expirationDate)") {
            \.$notes
            \.$receiptRequired
        }
    }

    func perform() async throws -> some IntentResult & ProvidesDialog {
        let offer = Offer(
            store: store.trimmingCharacters(in: .whitespacesAndNewlines),
            title: offerTitle.trimmingCharacters(in: .whitespacesAndNewlines),
            expirationDate: expirationDate,
            notes: notes,
            receiptRequired: receiptRequired
        )
        try await OfferIntentRepository.shared.add(offer)
        return .result(dialog: "Saved \(offer.title) from \(offer.store).")
    }
}

struct ShowExpiringOffersIntent: AppIntent {
    static let title: LocalizedStringResource = "Show Expiring Offers"
    static let description = IntentDescription("Open Offer Vault to review active offers and upcoming deadlines.")
    static let openAppWhenRun = true

    func perform() async throws -> some IntentResult {
        .result()
    }
}

struct OfferVaultShortcuts: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: OpenOfferCaptureIntent(),
            phrases: [
                "Save a receipt offer in \(.applicationName)",
                "Add a coupon in \(.applicationName)",
                "Scan a receipt in \(.applicationName)"
            ],
            shortTitle: "Save Receipt Offer",
            systemImageName: "doc.viewfinder"
        )

        AppShortcut(
            intent: AddOfferIntent(),
            phrases: [
                "Add an offer in \(.applicationName)",
                "Save a coupon with \(.applicationName)"
            ],
            shortTitle: "Add Offer",
            systemImageName: "ticket"
        )

        AppShortcut(
            intent: ShowExpiringOffersIntent(),
            phrases: [
                "Show expiring offers in \(.applicationName)",
                "What coupons expire soon in \(.applicationName)"
            ],
            shortTitle: "Expiring Offers",
            systemImageName: "calendar.badge.exclamationmark"
        )
    }

    static var shortcutTileColor: ShortcutTileColor { .purple }
}
