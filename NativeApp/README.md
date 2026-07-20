# Offer Vault Native iPhone App

This folder contains the Apple-native SwiftUI replacement for the earlier web-app approach.

## Goal

Install one native app and have its App Shortcuts appear automatically in Shortcuts, Siri, and Spotlight. The user does not manually assemble personal shortcuts.

## Included App Shortcuts

- Save Receipt Offer
- Add Offer
- Show Expiring Offers

## Included native source

- `OfferVault.xcodeproj`
- `OfferVault/OfferVaultApp.swift`
- `OfferVault/ContentView.swift`
- `OfferVault/Offer.swift`
- `OfferVault/OfferStore.swift`
- `OfferVault/OfferVaultIntents.swift`
- `OfferVault/Info.plist`

## Build requirements

- A Mac with a current version of Xcode
- An Apple ID added in Xcode
- The iPhone connected to the Mac or available for wireless development

Open `OfferVault.xcodeproj`, choose the OfferVault target, select a development team under Signing & Capabilities, select the iPhone, and press Run.

After installation, open Offer Vault once. The preconfigured App Shortcuts should then be discoverable in the Shortcuts app under Offer Vault, and through Siri and Spotlight.

## Current MVP

The first version stores offer records locally in the app's Application Support directory. It supports store name, offer title, expiration date, notes, category, estimated savings, receipt-required status, and redeemed status.

## Next implementation phase

1. Add receipt photo capture with PhotosUI or camera capture.
2. Add on-device text recognition with Vision.
3. Parse likely store names, dates, coupon terms, survey codes, and expiration dates.
4. Add EventKit integration for Reminders and Calendar alerts.
5. Add iCloud sync using Apple's native data frameworks.
6. Add app icon, tests, accessibility review, and TestFlight distribution.

## Important

The repository contains source code, not a signed iPhone application. Apple code signing must be performed through an Apple developer identity before the app can be installed on an iPhone.
