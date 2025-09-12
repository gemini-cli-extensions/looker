# Looker Extension

This document provides instructions for the Gemini agent to assist users with the Looker extension.

## Looker MCP Server (Data Plane: Connecting and Querying)

This section covers connecting to a Looker instance.

1.  **Verify Environment Variables**: Before attempting to connect, confirm with the user that the following environment variables are set in the extension configuration or their shell environment.

    *   `LOOKER_BASE_URL`: The base URL of your Looker instance.
    *   `LOOKER_CLIENT_ID`: The Looker API client ID.
    *   `LOOKER_CLIENT_SECRET`: The Looker API client secret.
    *   `LOOKER_VERIFY_SSL`: (Optional) Whether to verify SSL certificates. Defaults to `true`.

2.  **Handle Missing Variables**: If a command fails with an error message containing a placeholder like `${LOOKER_BASE_URL}`, it signifies a missing environment variable. Inform the user which variable is missing and instruct them to set it.

3.  **Handle Permission Errors**: If you encounter permission errors, ensure the user has the correct permissions in Looker to perform the requested actions.
