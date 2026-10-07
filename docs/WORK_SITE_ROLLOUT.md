# Rolling out to the Retail inMotion sites

Retail inMotion System Alert is its own Forge app, so a site that ran the Marketplace app moves
over once.

## One-off setup

1. Add the repository secrets `FORGE_EMAIL` and `FORGE_API_TOKEN`.
2. Actions → **Register Forge app** → Run (with the Developer Space id if the run asks for one). It
   registers this app with Forge and commits the new app id to `manifest.yml`.

## Work site (retailinmotion.atlassian.net)

1. Actions → **Deploy to Retail inMotion work site** (type `DEPLOY`). It deploys the Forge
   `production` environment. Both apps can be installed side by side while you move over.
2. In the old app (Jira settings → Apps → System Alert Manager), **Backup & restore → Download
   backup**. The file holds settings, templates, branding, history and contacts (names, emails and
   mobile numbers), so keep it somewhere safe.
3. In the new app's admin page: **Restore** → choose the file → **Restore this backup**, then reload.
4. Enter the email, SMS and Microsoft provider keys again (they are never in a backup) and
   reconnect Microsoft if it was used, then click **Save** on the settings once: saving publishes
   the project and priorities that show the **Send System Alert** action.
5. Send a test, then uninstall the old app (Manage apps) so only one app runs the monthly test.

## Sandbox (retailinmotion-sandbox1.atlassian.net)

The same steps, deploying the Forge `development` environment to the sandbox.
