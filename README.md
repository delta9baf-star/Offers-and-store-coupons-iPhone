# Offers and Store Coupons iPhone

An Apple-native receipt, coupon, survey, rebate, fuel-point and return-window system for iPhone 17 Pro.

## Project rule

This project uses only apps and services built into iPhone and the Apple ecosystem. No third-party apps, browser databases, external OCR services or outside automation platforms.

## Native app stack

- **Shortcuts** — automation engine
- **Reminders** — master offer database and expiration alerts
- **Photos** — receipt image archive and Live Text
- **Calendar** — important expiration and return-window events
- **Notes** — long terms, codes and supporting details
- **Files / iCloud Drive** — exported PDFs, receipts and backups
- **Siri** — voice capture and lookup
- **Spotlight** — system-wide search
- **Action Button** — one-press receipt capture
- **Widgets** — expiring-offer dashboard
- **Mail** — emailed receipts and order confirmations
- **Wallet** — supported loyalty cards, tickets and passes

## Primary workflow

1. Press the iPhone Action Button or say **“Siri, save receipt offer.”**
2. Photograph the receipt.
3. Shortcuts saves the image to the **Offers & Coupons** Photos album.
4. Live Text extracts receipt text on-device.
5. The shortcut asks for or confirms the store, offer, expiration date, value and whether the original receipt is required.
6. A reminder is created in the **Offers & Coupons** list with the receipt image, tags and alerts.
7. High-value or long-window items can also be added to Calendar and Files.

## Recommended Reminders structure

Create a list named **Offers & Coupons** and use these tags:

- `#Coupon`
- `#Survey`
- `#FuelPoints`
- `#Rebate`
- `#Return`
- `#Warranty`
- `#ReceiptRequired`
- `#Restaurant`
- `#Retail`

Recommended Smart Lists:

- Expiring Today
- Expiring in 3 Days
- Expiring in 7 Days
- Receipt Required
- Restaurant Surveys
- Fuel Points
- Returns and Rebates

## Project documents

- [Apple-native setup guide](docs/APPLE_NATIVE_SETUP.md)
- [Save Receipt Offer shortcut specification](docs/SAVE_RECEIPT_OFFER_SHORTCUT.md)

## Privacy

Receipt photos, extracted text and reminders remain inside Apple apps and iCloud according to the user's Apple settings. The system does not require third-party accounts or external receipt-processing services.

## Status

The earlier web-app prototype is retired as the primary design. Future work will prioritize Apple-native automation, minimal typing and fast capture from the Action Button, Siri and the Share Sheet.
