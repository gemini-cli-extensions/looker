# Looker Agent Skills

> [!NOTE]
> Currently in beta (pre-v1.0), and may see breaking changes until the first stable release (v1.0).

This repository provides a set of agent skills to interact with [Looker](https://cloud.google.com/looker). These skills can be used with various AI agents, including [Antigravity](https://antigravity.google/), [Claude Code](https://claude.com/product/claude-code) and [Codex](https://developers.openai.com/codex), to explore data, manage dashboards, and develop LookML using natural language prompts.

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
    - [Antigravity](#antigravity)
    - [Claude Code](#claude-code)
    - [Codex](#codex)
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
  - Antigravity
     - [Antigravity CLI](https://github.com/google-gemini/gemini-cli) version **v1.6.0** or higher
     - [Antigravity 2.0](https://antigravity.google/product/antigravity-2) version **v2.0.0** or higher.
  - [Claude Code](https://claude.com/product/claude-code) version **v2.1.94** or higher.
  - [Codex](https://developers.openai.com/codex) **v0.117.0** or higher.
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
<summary id="antigravity">Antigravity</summary>

You can use either of these two agents for Antigravity:
- [Antigravity CLI](https://github.com/google-gemini/gemini-cli) version **v0.3.7** or higher
- [Antigravity 2.0](https://antigravity.google/product/antigravity-2) version **v0.3.7** or higher.

<blockquote>
💡 <strong>Tip — Migrating from Gemini CLI?</strong><br>
If you previously installed this extension with <code>gemini extensions install</code>, you can convert it to an Antigravity plugin instead of reinstalling from scratch:
<ul>
  <li><strong>On first launch of Antigravity CLI</strong>, accept the Migration Options prompt to automatically convert your installed Gemini CLI extensions to Antigravity plugins.</li>
  <li><strong>Or, from your terminal</strong>, run:
    <pre><code class="language-bash">agy plugin import gemini</code></pre>
  </li>
</ul>
See <a href="https://antigravity.google/docs/gcli-migration">Migrating from Gemini CLI</a> for details on plugins, context files (<code>GEMINI.md</code> / <code>AGENTS.md</code>), and MCP server config differences.
</blockquote>

#### Antigravity 2.0 (IDE)

**1. Clone the Repo:**

```bash
git clone --branch 0.3.7 https://github.com/gemini-cli-extensions/looker.git
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

_(Tip: Antigravity 2.0 automatically discovers skills in these directories at the start of a session. You can verify they are active by running the `/skills` command in your active session.)_

#### Antigravity CLI

**1. Clone the Repo:**

```bash
git clone --branch 0.3.7 https://github.com/gemini-cli-extensions/looker.git
```

**2. Install the skills:**
You can install plugins directly from a remote GitHub repository.

**1. Install the plugin:**

```bash
agy plugin install https://github.com/gemini-cli-extensions/looker
```

**2. Set env vars:**
Set your environment vars as described in the [configuration section](#configuration).

</details>

<details>
<summary id="claude-code">Claude Code</summary>

**1. Set env vars:**
In your terminal, set your environment vars as described in the [configuration section](#configuration).

**2. Start the agent:**

```bash
claude
```

**3. Install the plugin:**

```bash
/plugin install looker@claude-plugins-official
```

_(Tip: Run `/plugin list` inside Claude Code to verify the plugin is active, or `/reload-plugins` if you just installed it.)_

</details>

<details>
<summary id="codex">Codex</summary>

**1. Install marketplace:**

```bash
codex plugin marketplace add GoogleCloudPlatform/data-agent-kit

```

**2. Install the plugin:**

```bash
codex plugin add looker@data-agent-kit
```

**3. Set env vars:**
Enter your environment vars as described in the [configuration section](#configuration).

**4. (Optional) Update the marketplace:**
```sh
codex plugin marketplace upgrade data-agent-kit
```

</details>

## Installing using [open agent skills tool](https://github.com/vercel-labs/skills)

You can install skills using the `npx skills` command.

**1. Install the skills:**

Run the following command in your terminal to automatically download and register the skills:

```bash
npx skills add https://github.com/gemini-cli-extensions/looker/tree/0.3.7
```

For detailed info check out the [Skills npm package](https://www.npmjs.com/package/skills).

**2. Set env vars:**
Set your environment vars as described in the [configuration section](#configuration).

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

* "✖ Error during discovery for server: MCP error -32000: Connection closed": The database connection has not been established. Ensure your configuration is set via environment variables.
* "✖ MCP ERROR: Error: spawn /Users/USER/.gemini/extensions/cloud-sql-sqlserver/toolbox ENOENT": The Toolbox binary did not download correctly. Ensure you are using Gemini CLI v0.6.0+.
* "cannot execute binary file": The Toolbox binary did not download correctly. Ensure the correct binary for your OS/Architecture has been downloaded. See [Installing the server](https://mcp-toolbox.dev/documentation/introduction/#install-toolbox) for more information.
