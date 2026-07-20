# 01 — Save Receipt Offer

Version: 1.0
Target: iPhone 17 Pro, iOS 26.5.2
Apps used: Shortcuts, Camera, Photos, Reminders, Calendar
Third-party apps: None

## Purpose

Capture a receipt photo, collect the offer details, save the photo in Photos, create a reminder with an expiration alert, and optionally create a calendar event.

## One-time setup

Create these items before building the shortcut:

- Photos album: `Offers & Coupons`
- Reminders list: `Offers & Coupons`
- Calendar: use your preferred iCloud calendar

Recommended Reminders tags:

`#Coupon` `#Survey` `#FuelPoints` `#Rebate` `#Return` `#Warranty` `#ReceiptRequired`

## Shortcut settings

Name: `Save Receipt Offer`
Icon suggestion: receipt or ticket
Color: any
Show in Share Sheet: Off for version 1.0
Receive: Nothing

## Actions — exact build order

### 1. Take the receipt photo

1. Add action: `Take Photo`
2. Camera: Back
3. Show Camera Preview: On
4. Save result as variable: `Receipt Photo`

### 2. Save to the receipt album

5. Add action: `Save to Photo Album`
6. Input: `Receipt Photo`
7. Album: `Offers & Coupons`

### 3. Ask for store name

8. Add action: `Ask for Input`
9. Prompt: `Store name`
10. Input Type: Text
11. Save result as variable: `Store`

### 4. Ask for offer description

12. Add action: `Ask for Input`
13. Prompt: `What is the offer, coupon, survey, reward, return, or warranty?`
14. Input Type: Text
15. Save result as variable: `Offer`

### 5. Ask for expiration date

16. Add action: `Ask for Input`
17. Prompt: `Expiration or deadline date`
18. Input Type: Date
19. Save result as variable: `Expiration Date`

### 6. Ask for offer type

20. Add action: `Choose from Menu`
21. Prompt: `Offer type`
22. Menu items:
   - Coupon
   - Survey
   - Fuel Points
   - Rebate
   - Return
   - Warranty
   - Other
23. In each menu branch, add a `Text` action containing the matching tag:
   - Coupon → `#Coupon`
   - Survey → `#Survey`
   - Fuel Points → `#FuelPoints`
   - Rebate → `#Rebate`
   - Return → `#Return`
   - Warranty → `#Warranty`
   - Other → `#Other`
24. After the menu, save its output as variable: `Offer Tag`

### 7. Ask whether the paper receipt is required

25. Add action: `Choose from Menu`
26. Prompt: `Is the original receipt required?`
27. Menu items:
   - Yes
   - No
28. Yes branch: add `Text` with `#ReceiptRequired`
29. No branch: add `Text` with a blank value
30. Save menu result as variable: `Receipt Tag`

### 8. Ask for estimated savings

31. Add action: `Ask for Input`
32. Prompt: `Estimated savings in dollars — enter 0 if unknown`
33. Input Type: Number
34. Save result as variable: `Savings`

### 9. Ask for notes

35. Add action: `Ask for Input`
36. Prompt: `Restrictions, code, survey number, or notes`
37. Input Type: Text
38. Allow Multiple Lines: On
39. Save result as variable: `Notes`

### 10. Build the reminder title

40. Add action: `Text`
41. Text content:

`[Store] — [Offer]`

Insert the `Store` and `Offer` variables using the variable picker.
42. Save as variable: `Reminder Title`

### 11. Build the reminder notes

43. Add action: `Text`
44. Text content:

```text
Offer: [Offer]
Store: [Store]
Expires: [Expiration Date]
Estimated savings: $[Savings]
[Offer Tag] [Receipt Tag]

Notes:
[Notes]

Receipt photo saved in Photos album: Offers & Coupons
```

Insert variables with the variable picker.
45. Save as variable: `Reminder Notes`

### 12. Create the reminder

46. Add action: `Add New Reminder`
47. Title: `Reminder Title`
48. List: `Offers & Coupons`
49. Notes: `Reminder Notes`
50. Date: `Expiration Date`
51. Time: 9:00 AM
52. Priority: Medium

### 13. Optional calendar event

53. Add action: `Choose from Menu`
54. Prompt: `Also add to Calendar?`
55. Menu items:
   - Yes
   - No
56. Yes branch:
   - Add action: `Add New Event`
   - Title: `Expires: [Store] — [Offer]`
   - Start Date: `Expiration Date` at 9:00 AM
   - End Date: `Expiration Date` at 9:15 AM
   - Calendar: your chosen iCloud calendar
   - Notes: `Reminder Notes`
   - Alert: 1 day before
57. No branch: no action

### 14. Confirmation

58. Add action: `Show Notification`
59. Title: `Offer saved`
60. Body: `[Store] — expires [Expiration Date]`

## Recommended permissions

The first run may ask for access to:

- Camera
- Photos
- Reminders
- Calendar
- Notifications

Choose Allow for each.

## Test procedure

Use a sample receipt and enter:

- Store: Test Store
- Offer: $5 off next purchase
- Expiration: tomorrow
- Type: Coupon
- Receipt required: Yes
- Savings: 5
- Notes: Minimum purchase $25

Confirm:

- Photo appears in `Offers & Coupons`
- Reminder appears in `Offers & Coupons`
- Due date is correct
- Tags appear in the reminder notes
- Calendar event appears only when Yes was selected
- Notification confirms success

## Version 1.1 planned improvements

- Extract text from the receipt image
- Suggest the store name automatically
- Detect likely expiration dates
- Skip questions when values are confidently detected
- Accept an existing receipt image from the Share Sheet
