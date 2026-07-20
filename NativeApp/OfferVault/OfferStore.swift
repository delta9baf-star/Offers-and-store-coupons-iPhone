import Foundation

@MainActor
final class OfferStore: ObservableObject {
    @Published private(set) var offers: [Offer] = []

    private let fileURL: URL

    init(fileManager: FileManager = .default) {
        let base = fileManager.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!
        let folder = base.appendingPathComponent("OfferVault", isDirectory: true)
        try? fileManager.createDirectory(at: folder, withIntermediateDirectories: true)
        fileURL = folder.appendingPathComponent("offers.json")
        load()
    }

    func add(_ offer: Offer) {
        offers.append(offer)
        sortAndSave()
    }

    func update(_ offer: Offer) {
        guard let index = offers.firstIndex(where: { $0.id == offer.id }) else { return }
        offers[index] = offer
        sortAndSave()
    }

    func delete(at offsets: IndexSet) {
        offers.remove(atOffsets: offsets)
        save()
    }

    func markRedeemed(_ offer: Offer) {
        var updated = offer
        updated.redeemed.toggle()
        update(updated)
    }

    var activeOffers: [Offer] {
        offers.filter { !$0.redeemed && $0.expirationDate >= Calendar.current.startOfDay(for: .now) }
    }

    var expiringSoon: [Offer] {
        let now = Calendar.current.startOfDay(for: .now)
        let end = Calendar.current.date(byAdding: .day, value: 7, to: now) ?? now
        return activeOffers.filter { $0.expirationDate <= end }
    }

    private func sortAndSave() {
        offers.sort { $0.expirationDate < $1.expirationDate }
        save()
    }

    private func load() {
        guard let data = try? Data(contentsOf: fileURL) else { return }
        do {
            offers = try JSONDecoder().decode([Offer].self, from: data)
            offers.sort { $0.expirationDate < $1.expirationDate }
        } catch {
            print("Offer Vault load error: \(error)")
        }
    }

    private func save() {
        do {
            let data = try JSONEncoder().encode(offers)
            try data.write(to: fileURL, options: .atomic)
        } catch {
            print("Offer Vault save error: \(error)")
        }
    }
}

actor OfferIntentRepository {
    static let shared = OfferIntentRepository()

    private let fileURL: URL

    init(fileManager: FileManager = .default) {
        let base = fileManager.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!
        let folder = base.appendingPathComponent("OfferVault", isDirectory: true)
        try? fileManager.createDirectory(at: folder, withIntermediateDirectories: true)
        fileURL = folder.appendingPathComponent("offers.json")
    }

    func add(_ offer: Offer) throws {
        var offers: [Offer] = []
        if let data = try? Data(contentsOf: fileURL) {
            offers = (try? JSONDecoder().decode([Offer].self, from: data)) ?? []
        }
        offers.append(offer)
        offers.sort { $0.expirationDate < $1.expirationDate }
        let data = try JSONEncoder().encode(offers)
        try data.write(to: fileURL, options: .atomic)
    }
}
