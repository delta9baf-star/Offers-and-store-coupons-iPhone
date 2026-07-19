# Offers and Store Coupons iPhone

An iPhone-first, offline-capable receipt and coupon tracker.

## Current features

- Take or upload a receipt photo
- Save store, offer, expiration date, estimated savings and notes
- Mark whether the original receipt is required
- View active offers, offers expiring today, offers expiring within 7 days and redeemed offers
- Track monthly and all-time savings
- Export data as CSV
- Create a JSON backup
- Export an Apple Calendar event with a two-day alert
- Install from Safari as a Home Screen web app
- Continue working offline after the first successful load

## Deploy with GitHub Pages

1. Open the repository on GitHub.
2. Open **Settings > Pages**.
3. Under **Build and deployment**, choose **Deploy from a branch**.
4. Select **main** and **/(root)**.
5. Save and wait for GitHub Pages to publish.

Expected site address:

`https://delta9baf-star.github.io/Offers-and-store-coupons-iPhone/`

## Install on iPhone

1. Open the published site in Safari.
2. Tap **Share**.
3. Tap **Add to Home Screen**.
4. Name it **Offer Vault** and tap **Add**.

## Daily use

1. Open Offer Vault.
2. Tap **+**.
3. Photograph or select the receipt.
4. Enter the store, offer and expiration date.
5. Add the estimated savings and restrictions.
6. Save the offer.
7. Use **Calendar** when you want an Apple Calendar expiration alert.

## Apple Live Text

Open the receipt in Photos, use Live Text to copy the printed terms, then paste them into the Notes field. This keeps receipt reading mostly on-device.

## Privacy

Offer records and receipt images are stored in Safari IndexedDB on the device. They are not committed to GitHub. Clearing Safari website data can erase local records, so use **Backup JSON** regularly.

## Planned improvements

- Automatic receipt text extraction and offer parsing
- Search and store filters
- Custom warning intervals
- Restore from JSON backup
- Share Sheet and Siri Shortcut workflow
- Better iPhone photo compression
- Optional iCloud or private sync
