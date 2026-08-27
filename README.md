# Looker

> [!NOTE]
> Currently in beta (pre-v1.0), and may see breaking changes until the first stable release (v1.0).

This repository packages [MCP Toolbox](https://github.com/googleapis/mcp-toolbox)'s prebuilt `looker` server as a plugin/extension to interact with [Looker](https://cloud.google.com/looker). It can be used with various AI agents, including [Antigravity](https://antigravity.google/), [Claude Code](https://claude.com/product/claude-code) and [Codex](https://developers.openai.com/codex), to explore data, manage dashboards, and develop LookML using natural language prompts.

> [!IMPORTANT]
> **We Want Your Feedback!**
> Please share your thoughts with us by filling out our feedback [form][form].
> Your input is invaluable and helps us improve the project for everyone.

[form]: https://docs.google.com/forms/d/e/1FAIpQLSfEGmLR46iipyNTgwTmIDJqzkAwDPXxbocpXpUbHXydiN1RTw/viewform?usp=pp_url&entry.157487=looker

## Table of Contents

- [Why Use Looker?](#why-use-looker)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
  - [Configuration](#configuration)
  - [Installation & Usage](#installation--usage)
    - [Antigravity](#antigravity)
    - [Claude Code](#claude-code)
    - [Codex](#codex)
- [Installing via a compatible Agent Plugins client](#installing-via-a-compatible-agent-plugins-client)
- [Usage Examples](#usage-examples)
- [Available Tools](#available-tools)
- [Generating Skills Instead](#generating-skills-instead)
- [Troubleshooting](#troubleshooting)

## Why Use Looker?

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

To start interacting with your database, install the extension for your preferred AI agent, then launch the agent and use natural language to ask questions or perform tasks.

For the latest version, check the [releases page][releases].

[releases]: https://github.com/gemini-cli-extensions/looker/releases

<!-- {x-release-please-start-version} -->

<details open>
<summary id="antigravity">Antigravity</summary>

You can use either of these two agents for Antigravity:
- [Antigravity CLI](https://github.com/google-gemini/gemini-cli) version **v1.6.0** or higher
- [Antigravity 2.0](https://antigravity.google/product/antigravity-2) version **v2.0.0** or higher.

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

**1. Install the plugin:**

Install the plugin directly from the remote GitHub repository:

```bash
agy plugin install https://github.com/gemini-cli-extensions/looker
```

**2. Set env vars:**
Set your environment vars as described in the [configuration section](#configuration).

_(Tip: You can verify the MCP server is active by running the `/mcp` command in your active session.)_

#### Antigravity CLI

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

_(Tip: Run `/plugin list` inside Claude Code to verify the plugin is active, or `/reload-plugins` if you just installed it.)
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

## Installing via a compatible Agent Plugins client
## Installing via a compatible Agent Plugins client

This repository is a valid [Agent Plugins](https://github.com/agentplugins/agent-plugins-spec) (v1) plugin. Any [Agent Plugins–compatible client](https://agent-plugins.org/compatible-clients) can install it directly using its own built-in plugin command — no extra tooling required — by pointing at this repository:

```
https://github.com/gemini-cli-extensions/looker
```

Beyond harnesses covered by the native install above, compatible clients include VS Code, Cursor, GitHub Copilot, and Kiro. See your agent's documentation for its exact install command.

**Set env vars:**
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

## Available Tools

The tools come from MCP Toolbox's prebuilt `looker` server, grouped into toolsets:

- **looker_tools** - These skills are designed for data discovery and business intelligence.

For the full, up-to-date list, see the [`looker` prebuilt config](https://github.com/googleapis/mcp-toolbox/blob/main/internal/prebuiltconfigs/tools/looker.yaml)
in the MCP Toolbox repository.

## Generating Skills Instead

The tool-backed skills this plugin used to ship were generated from the same prebuilt
toolsets. If your agent lacks deferred tool loading, or you prefer skills, regenerate
them with the script in this repository:

```bash
VERSION=<toolbox version> ./.github/scripts/generate_skills.sh
```

Use the toolbox version pinned in [`mcp.json`](./mcp.json). A single toolset, without
the script:

```bash
npx @toolbox-sdk/server@<toolbox version> --prebuilt looker skills-generate \
  --name "<skill name>" \
  --toolset "<toolset>" \
  --description "<what it is for>"
```

The generated scripts call the toolbox through `npx`, so no binary download is needed.
See [Generate Agent Skills](https://github.com/googleapis/mcp-toolbox#generate-agent-skills)
in the MCP Toolbox repository.

## Troubleshooting

Use the debug mode of your agent (e.g., `gemini --debug`) to enable debugging.

Common issues:

* "✖ Error during discovery for server: MCP error -32000: Connection closed": The database connection has not been established. Ensure your configuration is set via environment variables.
* "✖ MCP ERROR: Error: spawn /Users/USER/.gemini/extensions/cloud-sql-sqlserver/toolbox ENOENT": The Toolbox binary did not download correctly. Ensure you are using Gemini CLI v0.6.0+.
* "cannot execute binary file": The Toolbox binary did not download correctly. Ensure the correct binary for your OS/Architecture has been downloaded. See [Installing the server](https://mcp-toolbox.dev/documentation/introduction/#install-toolbox) for more information.
