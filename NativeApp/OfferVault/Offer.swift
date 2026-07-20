import Foundation

struct Offer: Identifiable, Codable, Hashable, Sendable {
    let id: UUID
    var store: String
    var title: String
    var expirationDate: Date
    var notes: String
    var category: OfferCategory
    var estimatedSavings: Decimal
    var receiptRequired: Bool
    var redeemed: Bool
    var createdAt: Date

    init(
        id: UUID = UUID(),
        store: String,
        title: String,
        expirationDate: Date,
        notes: String = "",
        category: OfferCategory = .coupon,
        estimatedSavings: Decimal = 0,
        receiptRequired: Bool = false,
        redeemed: Bool = false,
        createdAt: Date = .now
    ) {
        self.id = id
        self.store = store
        self.title = title
        self.expirationDate = expirationDate
        self.notes = notes
        self.category = category
        self.estimatedSavings = estimatedSavings
        self.receiptRequired = receiptRequired
        self.redeemed = redeemed
        self.createdAt = createdAt
    }
}

enum OfferCategory: String, Codable, CaseIterable, Identifiable, Sendable {
    case coupon = "Coupon"
    case survey = "Survey"
    case fuel = "Fuel Points"
    case rebate = "Rebate"
    case returnDeadline = "Return"
    case warranty = "Warranty"

    var id: String { rawValue }
}
