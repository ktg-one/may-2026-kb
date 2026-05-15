# PROJECT CONTEXT: Kismet CRM Migration & Data Cleaning

## 1. THE MISSION
We are migrating legacy client data from a chaotic, color-coded Excel/Google Sheet into a structured, relational AppSheet database (Kismet OS v1).

## 2. THE CORE CHALLENGES
1.  **Hidden Data:** Statuses are currently stored as *Cell Background Colors*, not text. We must extract hex codes and map them to text fields.
2.  **Combined Identities:** Many rows contain "John & Sally Smith". These must be split into **two** distinct Contact records, linked by a `Partner_ID`.
3.  **Dirty Formats:** Phone numbers vary (04xx, +61, 4xx). Dates are inconsistent.

## 3. THE "COLOR LEGEND" LOGIC
*Crucial: The extraction script must map these approximate Hex colors to these exact Data Fields.*

| Visual Color | Meaning | **TARGET FIELD: Developer** | **TARGET FIELD: Stage** | **TARGET FIELD: Tags** |
| :--- | :--- | :--- | :--- | :--- |
| **Aqua / Cyan** | Active Antini Client | `Antini` | `Active Deal` | - |
| **Magenta / Pink** | SJS Client | `SJS` | `Active Deal` | - |
| **Green** | Settled | - | `Settled` | - |
| **Red** | Cancelled / Lost | - | `Lost` | - |
| **Orange / Brown** | Warm Lead | - | `Contacted` | - |
| **Purple** | Accounting / Refi | - | - | `Accounting` |
| **Dark Blue** | Long Term Nurture | - | `Nurture` | - |

## 4. THE "PARTNER SPLIT" LOGIC
If a Name cell contains `&`, ` and `, or `/`:
1.  **Primary Record:** Create Contact A (e.g., "John"). Generate `Contact_ID_A`.
2.  **Secondary Record:** Create Contact B (e.g., "Sally"). Generate `Contact_ID_B`.
3.  **Linking:** Set Contact A's `Partner_ID` = `Contact_ID_B`. Set Contact B's `Partner_ID` = `Contact_ID_A`.
4.  **Shared Data:** Copy Address, Suburb, and Deal Stage to both.
5.  **Unique Data:** Attempt to assign Mobile 1 to A and Mobile 2 to B (if discernible).

## 5. TARGET SCHEMA (Contacts Table)
The script output must align with these AppSheet columns:
* `Contact_ID` (Key, UNIQUEID)
* `First_Name`
* `Last_Name`
* `Partner_ID` (Ref)
* `Mobile`
* `Email`
* `Developer_Name` (Extracted from color)
* `Stage` (Extracted from color)
* `Legacy_Original_Row` (For audit trail)