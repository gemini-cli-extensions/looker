# DEVELOPER.md

This document provides instructions for setting up your development environment
and contributing to the Looker Agent skills project.

## Prerequisites

Before you begin, ensure you have the following:

1.  **Gemini CLI:** Install the Gemini CLI version v0.6.0 or above. Installation
    instructions can be found on the official Gemini CLI documentation. You can
    verify your version by running `gemini --version`.
2.  **Looker Instance:** For testing, you will need access to an active Looker instance. See [Looker source](https://mcp-toolbox.dev/integrations/looker/source/) for more info.

## Developing the Extension

### Running from Local Source

1.  **Clone the Repository:**

    ```bash
    git clone https://github.com/gemini-cli-extensions/looker.git
    cd looker
    ```

2.  **Install the Extension Locally:** Use the Gemini CLI to install the
    extension from your local directory.

    ```bash
    gemini extensions install .
    ```
    The CLI will prompt you to confirm the installation. Accept it to proceed.

3.  **Testing Changes:** After installation, start the Gemini CLI (`gemini`).
    You can now interact with the `looker` skills to manually test your changes.

## Testing

### Automated Presubmit Checks

A GitHub Actions workflow (`.github/workflows/presubmit-tests.yml`) is triggered
for every pull request. This workflow primarily verifies that the extension can
be successfully installed by the Gemini CLI.

The skills themselves are validated using the `skills-validate.yml` workflow.

### Other GitHub Checks

*   **License Header Check:** A workflow ensures all necessary files contain the
    proper license header.
*   **Conventional Commits:** This repository uses
    [Release Please](https://github.com/googleapis/release-please) to manage
    releases. Your commit messages must adhere to the
    [Conventional Commits](https://www.conventionalcommits.org/) specification.
*   **Dependency Updates:** [Renovate](https://github.com/apps/forking-renovate)
    is configured to automatically create pull requests for dependency updates.

## Maintainer Information

### Team

The primary maintainers for this repository are defined in the
[`.github/CODEOWNERS`](.github/CODEOWNERS) file:

*   `@gemini-cli-extensions/senseai-eco`

### Releasing

The release process is automated using `release-please`. It consists of an automated changelog preparation step followed by the manual merging of a Release PR.

#### Release Process

1.  **Release PR:** When commits with conventional commit headers (e.g., `feat:`,
    `fix:`) are merged into the `main` branch, `release-please` will
    automatically create or update a "Release PR".
2.  **Merge Release PR:** A maintainer approves and merges the Release PR. This
    action triggers `release-please` to create a new GitHub tag and a
    corresponding GitHub Release.
