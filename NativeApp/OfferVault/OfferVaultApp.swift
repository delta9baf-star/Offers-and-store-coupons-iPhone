import SwiftUI
import AppIntents

@main
struct OfferVaultApp: App {
    @StateObject private var store = OfferStore()

    init() {
        OfferVaultShortcuts.updateAppShortcutParameters()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
                .onOpenURL { url in
                    guard url.scheme == "offervault" else { return }
                    if url.host == "new" {
                        NotificationCenter.default.post(name: .offerVaultCreateNewOffer, object: nil)
                    }
                }
        }
    }
}

extension Notification.Name {
    static let offerVaultCreateNewOffer = Notification.Name("OfferVaultCreateNewOffer")
}
