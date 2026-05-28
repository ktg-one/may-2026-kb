# Raw Research: 3CX Google Workspace Integration Discrepancies
**Source**: User Perplexity Query  
**Date**: 2026-05-26  
**Status**: Immutable Source Input  

---

The runbook is **largely accurate but contains several important discrepancies** against the live 3CX official docs (last updated 19 Feb 2025). Here's a precise breakdown: https://www.3cx.com/docs/manual/google-workspace/

***

## Verified Correct

- **Version gate**: V20 U5 required for Google Workspace integration https://www.3cx.com/blog/releases/v20u5-google-workspace/
- **Super Admin requirement**: Signing-in user must have Super Admin role in Google Admin Console Directory Users Admin roles and privileges https://www.3cx.com/docs/manual/google-workspace/
- **Billing Account Administrator**: Required only for Cloud Storage and Transcription, not for contact sync alone https://www.3cx.com/docs/manual/google-workspace/
- **Navigation path**: 3CX Admin Console Integrations Google Configure https://www.3cx.com/docs/manual/google-workspace/
- **User sync**: One-way (Google -> 3CX), runs immediately on save then nightly https://www.3cx.com/docs/manual/google-workspace/
- **Contact sync is personal only**: 3CX only syncs each user's personal Google Contacts to their 3CX personal phonebook. Confirmed in official docs and listed under Limitations as "Company contacts do not exist" https://www.3cx.com/docs/manual/google-workspace/
- **Match digits = 7**: Confirmed in phonebook docs as the recommended default https://www.3cx.com/docs/manual/phonebook/
- **Failure mode "Permission denied" during OAuth**: Super Admin role missing. Verified https://www.3cx.com/docs/manual/google-workspace/
- **Failure mode contact in Google but not 3CX**: Must be in personal contacts (My Contacts), not shared-only https://www.3cx.com/docs/manual/google-workspace/

***

## Legacy / Outdated / Inaccurate

**Step 3 OAuth flow is wrong in one key area:**

The runbook says clicking *Configure* redirects you to `https://integrations.3cx.com`, where you click *Connect*. **The actual current flow is different.** The real process is: https://www.3cx.com/docs/manual/google-workspace/
1. Admin Console Integrations Google Configure
2. You are shown an **integration page where you select features** (users, contacts, calendar, storage, etc.) **first**, then click *Connect*
3. You authenticate with the Super Admin Google account
4. After auth, a **Client ID is generated** and you must manually go to Google Admin Security API Controls Domain-wide Delegation to add the Client ID and OAuth scopes
5. The wizard **does not automatically create a GWS app** - there is a manual domain-wide delegation step that the runbook omits entirely

The runbook's line *"The 3CX wizard creates an app in your Google Workspace and returns you to the 3CX Admin Console showing the Project ID"* is **misleading** - you must manually authorize the Client ID in Google Admin Console's API Clients section. https://www.3cx.com/docs/manual/google-workspace/

**Step 4 "Google tab" in Users:**

Accurate in substance, but the path is `Admin Console Users Google` (click the Google button), which matches. https://www.3cx.com/docs/manual/google-workspace/

**Step 5 Contact sync toggle location:**

The runbook says to enable personal contact sync in the "Google Workspace integration panel." The official path is: **Admin Console Users Google Sync Options enable "Sync Personal Contacts"** - it's within the user sync configuration, not a separate integration panel. https://www.3cx.com/docs/manual/google-workspace/

**Step 5 Sync frequency:**

The runbook says contact sync is "daily (overnight) - hard limitation, not configurable." This is **confirmed correct**, but importantly the docs note this is because *"There is no way to listen to changes in personal contacts"* - it's a Google API limitation, not a 3CX design choice. https://www.3cx.com/docs/manual/google-workspace/

**"Consent on behalf of your organisation" checkbox:**

This specific UI element is **not mentioned in the current official docs** and likely refers to older OAuth UX or the `integrations.3cx.com` portal flow from a previous version. The current flow uses domain-wide delegation via Google Admin Console API Clients, not a consent checkbox during OAuth. https://www.3cx.com/docs/manual/google-workspace/

***

## Missing from the Runbook

One **critical step** the runbook omits that will cause the integration to fail silently:

> **After OAuth, you must manually add the Client ID to Domain-wide Delegation in Google Admin Console:**
> - Copy the generated Client ID from the 3CX integration page
> - Go to `admin.google.com` Security Access and data control API controls Domain-wide delegation Add new
> - Paste the Client ID and paste in all the OAuth scopes listed on the 3CX page
> - Click Authorize

This is required for 3CX to access user data org-wide. Skipping it is the likely root cause of community threads reporting "integration completes but nothing syncs". https://www.3cx.com/community/threads/cannot-connect-3cx-phone-system-to-google-workspace.134940/
