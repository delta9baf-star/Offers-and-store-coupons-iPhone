# Save Receipt Offer Shortcut

## Purpose

Capture a receipt with minimal typing and create a structured Apple Reminders entry using only native iPhone apps.

## Shortcut name

**Save Receipt Offer**

## Recommended shortcut actions

1. **Take Photo**
   - Use the back camera.
   - Show the camera preview.

2. **Save to Photo Album**
   - Album: **Offers & Coupons**

3. **Extract Text from Image**
   - Input: captured receipt photo

4. **Choose from Menu**
   - Coupon
   - Survey
   - Fuel Points
   - Rebate
   - Return
   - Warranty

5. **Ask for Input — Store**
   - Prompt: `Store name`
   - Default may be copied from detected receipt text when reliable.

6. **Ask for Input — Offer**
   - Prompt: `What is the offer or task?`
   - Example: `Complete survey for BOGO sandwich`

7. **Ask for Input — Expiration Date**
   - Input type: Date
   - Never guess an expiration when the receipt terms are unclear.

8. **Ask for Input — Estimated Value**
   - Input type: Number
   - Optional.

9. **Choose from Menu — Original Receipt Required?**
   - Yes
   - No

10. **Ask for Input — Notes**
    - Optional restrictions, survey code, validation code or copied Live Text.

11. **Build reminder title**

    Suggested format:

    ```text
    [Store] — [Offer]
    ```

12. **Build reminder notes**

    Suggested format:

    ```text
    Category: [Category]
    Estimated value: $[Value]
    Original receipt required: [Yes/No]

    Receipt text:
    [Extracted Text]

    Notes:
    [User Notes]
    ```

13. **Add New Reminder**
    - List: **Offers & Coupons**
    - Due date: selected expiration date
    - Priority: High when due within 3 days
    - Tags based on category
    - Add `#ReceiptRequired` when applicable

14. **Add Alert**
    - Primary alert: 9:00 AM on expiration day
    - For important items, also create a Calendar event with earlier alerts.

15. **Show Notification**

    ```text
    Offer saved for [Store]. Expires [Date].
    ```

## Optional branches

### Survey

Add a second reminder due 24 hours after purchase when the survey must be completed quickly.

### Return

Create a Calendar event with alerts 7, 3 and 1 day before the return deadline.

### Fuel Points

Add a location reminder for the preferred fuel station when useful.

### Warranty or rebate

Save a PDF or scanned receipt copy into the appropriate iCloud Drive folder.

## Action Button assignment

Assign this shortcut through:

**Settings → Action Button → Shortcut → Save Receipt Offer**

## Share Sheet version

Create a second shortcut named **Save Shared Receipt Offer** that accepts images from the Share Sheet. Replace **Take Photo** with **Receive Images from Share Sheet**, then reuse the remaining actions.

## Guardrails

- Do not rely on OCR alone for legal or financial deadlines.
- Always confirm the expiration date before saving.
- Keep original receipts when required.
- Use Calendar in addition to Reminders for costly returns, rebates or warranties.
