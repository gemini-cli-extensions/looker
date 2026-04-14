# Looker Agent Skills

> [!NOTE]
> Currently in beta (pre-v1.0), and may see breaking changes until the first stable release (v1.0).

This repository provides a set of agent skills to interact with [Looker](https://cloud.google.com/looker). These skills can be used with various AI agents, including [Gemini CLI](https://google-gemini.github.io/gemini-cli/), Claude Code, and Codex, to explore data, manage dashboards, and develop LookML using natural language prompts.

> [!IMPORTANT]
> **We Want Your Feedback!**
> Please share your thoughts with us by filling out our feedback [form][form].
> Your input is invaluable and helps us improve the project for everyone.

[form]: https://docs.google.com/forms/d/e/1FAIpQLSfEGmLR46iipyNTgwTmIDJqzkAwDPXxbocpXpUbHXydiN1RTw/viewform?usp=pp_url&entry.157487=looker

## Table of Contents

- [Why Use Looker Agent Skills?](#why-use-looker-agent-skills)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
  - [Configuration](#configuration)
  - [Installation & Usage](#installation--usage)
    - [Gemini CLI](#gemini-cli)
    - [Claude Code](#claude-code)
    - [Codex](#codex)
    - [Antigravity](#antigravity)
- [Usage Examples](#usage-examples)
- [Supported Skills](#supported-skills)
- [Troubleshooting](#troubleshooting)

## Why Use Looker Agent Skills?

- **Seamless Workflow:** Integrates seamlessly into your AI agent's environment. No need to constantly switch contexts for common Looker tasks.
- **Natural Language Queries:** Stop wrestling with complex UI or LookML. Explore data and create content by describing what you want in plain English.
- **Full Lifecycle Control:** Manage your Looker environment, from exploring models to creating dashboards and authoring LookML.
- **Accelerate Development:** Speed up LookML development by asking your agent to generate or update files based on your requirements.

## Prerequisites

Before you begin, ensure you have the following:

- One of these AI agents installed
  - [Gemini CLI](https://github.com/google-gemini/gemini-cli) version **v0.6.0** or higher
  - [Claude Code](https://claude.com/product/claude-code) version **v2.1.94** or higher
  - [Codex](https://developers.openai.com/codex) **v0.117.0** or higher
  - [Antigravity](https://antigravity.google) **v1.14.2** or higher
- A Looker instance and API credentials (Client ID and Client Secret).

## Getting Started

### Configuration

Please keep these env vars handy during the installation process:

- `LOOKER_BASE_URL`: The base URL of your Looker instance.
- `LOOKER_CLIENT_ID`: The Looker API client ID.
- `LOOKER_CLIENT_SECRET`: The Looker API client secret.
- `LOOKER_VERIFY_SSL`: (Optional) Whether to verify SSL certificates. Defaults to `true`.
- `LOOKER_SHOW_HIDDEN_MODELS`: (Optional) Whether to show models that are hidden in the UI. Defaults to `true`.
- `LOOKER_SHOW_HIDDEN_EXPLORES`: (Optional) Whether to show explores that are hidden in the UI. Defaults to `true`.
- `LOOKER_SHOW_HIDDEN_FIELDS`: (Optional) Whether to show fields that are hidden in the UI. Defaults to `true`.

### Installation & Usage

To start interacting with Looker, install the skills for your preferred AI agent, then launch the agent and use natural language to ask questions or perform tasks.

For the latest version, check the [releases page][releases].

[releases]: https://github.com/gemini-cli-extensions/looker/releases

<!-- {x-release-please-start-version} -->

<details open>
<summary id="gemini-cli">Gemini CLI</summary>

**1. Install the extension:**

```bash
gemini extensions install https://github.com/gemini-cli-extensions/looker
```

During the installation, enter your environment vars as described in the [configuration section](#configuration).

**2. (Optional) Manage Configuration:**
To view or update your configuration in Gemini CLI:

- Terminal: `gemini extensions config looker [setting name] [--scope <scope>]`
- Gemini CLI: `/extensions list`

**3. Start the agent:**

```bash
gemini
```

_(Tip: Run `/extensions list` to verify your configuration and active extensions.)_

</details>

<details>
<summary id="claude-code">Claude Code</summary>

**1. Set env vars:**
In your terminal, set your environment vars as described in the [configuration section](#configuration).

**2. Start the agent:**

```bash
claude
```

**3. Add the marketplace:**

```bash
/plugin marketplace add https://github.com/gemini-cli-extensions/looker.git#0.3.0
```

**4. Install the plugin:**

```bash
/plugin install looker@looker-marketplace
```

_(Tip: Run `/plugin list` inside Claude Code to verify the plugin is active, or `/reload-plugins` if you just installed it.)_

</details>

<details>
<summary id="codex">Codex</summary>

**1. Clone the Repo:**

```bash
git clone --branch 0.3.0 git@github.com:gemini-cli-extensions/looker.git
```

**2. Install the plugin:**

```bash
mkdir -p ~/.codex/plugins
cp -R /absolute/path/to/looker ~/.codex/plugins/looker
```

**3. Set env vars:**
Enter your environment vars as described in the [configuration section](#configuration).

**4. Create or update marketplace.json:**
`~/.agents/plugins/marketplace.json`

```json
{
  "name": "my-data-cloud-google-marketplace",
  "interface": {
    "displayName": "Google Data Cloud Skills"
  },
  "plugins": [
    {
      "name": "looker",
      "source": {
        "source": "local",
        "path": "./plugins/looker"
      },
      "policy": {
        "installation": "AVAILABLE",
        "authentication": "ON_INSTALL"
      },
      "category": "Data Analytics"
    }
  ]
}
```

_(Tip: Run `codex plugin list` or use the `/plugins` interactive menu to verify your installed plugins.)_

</details>

<details>
<summary id="antigravity">Antigravity</summary>

**1. Clone the Repo:**

```bash
git clone --branch 0.3.0 https://github.com/gemini-cli-extensions/looker.git
```

**2. Install the skills:**

Choose a location for the skills:
- **Global (all workspaces):** `~/.gemini/antigravity/skills/`
- **Workspace-specific:** `<workspace-root>/.agents/skills/`

Copy the skill folders from the cloned repository's `skills/` directory to your chosen location:

```bash
cp -R looker/skills/* ~/.gemini/antigravity/skills/
```

**3. Set env vars:**
Set your environment vars as described in the [configuration section](#configuration).

_(Tip: Antigravity automatically discovers skills in these directories at the start of a session.)_

</details>

<!-- {x-release-please-end} -->

## Usage Examples

Interact with Looker using natural language:

- **Explore Data:**
  - "Show me the top 10 products by sales in the last month."
  - "What is the average order value by region?"
- **Manage Content:**
  - "Create a new dashboard titled 'Executive Overview' with tiles for revenue and user growth."
  - "Find all dashboards related to 'Marketing' and list their tiles."
- **Develop LookML:**
  - "Create a new view for the 'users' table in the 'e-commerce' project."
  - "Add a new measure 'total_revenue' to the 'orders' view."

## Supported Skills

The following skills are available in this repository:

- [Looker](./skills/looker/SKILL.md) - These skills are designed for data discovery and business intelligence.
- [Looker Development](./skills/looker-dev/SKILL.md) - These skills are built for LookML developers, data engineers, and administrators who manage the backbone of Looker.

## Troubleshooting

Use the debug mode of your agent (e.g., `gemini --debug`) to enable debugging.

Common issues:

- "failed to find default credentials": Ensure your Looker API credentials are set correctly.
- "✖ MCP ERROR: Error: spawn .../toolbox ENOENT": The Toolbox binary did not download correctly. Ensure you are using the latest version of your agent.
