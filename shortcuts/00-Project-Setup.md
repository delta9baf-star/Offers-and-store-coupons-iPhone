# 00 — Apple-Native Project Setup

Target device: iPhone 17 Pro
Target OS: iOS 26.5.2
Apple Intelligence: Enabled
Shortcuts iCloud sync: Enabled

## Required native apps

- Shortcuts
- Photos
- Reminders
- Calendar
- Notes
- Files

No third-party apps are used.

## Create the core storage items

### Photos

Create album:

`Offers & Coupons`

### Reminders

Create list:

`Offers & Coupons`

Recommended tags:

- `#Coupon`
- `#Survey`
- `#FuelPoints`
- `#Rebate`
- `#Return`
- `#Warranty`
- `#ReceiptRequired`
- `#Restaurant`
- `#Retail`

### Files

In iCloud Drive, create:

```text
Offers & Coupons/
├── Backups/
├── Exports/
├── Receipts/
├── Returns/
└── Warranties/
```

The first shortcut version saves receipt images to Photos. Files folders are reserved for later PDF exports and backups.

## Recommended Reminders smart lists

Create smart lists using tags and dates:

- Expiring Today
- Expiring This Week
- Receipt Required
- Returns
- Warranties
- Surveys
- Fuel Points

## Build order

1. Save Receipt Offer
2. Find Expiring Offers
3. Weekly Offer Review
4. Return Deadline Tracker
5. Warranty Tracker
6. Restaurant Survey Tracker
7. Fuel Rewards Tracker
8. Monthly Savings Report
9. Backup Offers

## Privacy rule

Receipt images and offer data remain inside Apple-native apps and iCloud. Do not send receipt data to third-party services.
