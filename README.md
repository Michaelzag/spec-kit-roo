<div align="center">
    <img src="./media/logo_small.webp"/>
    <h1>🌱 Spec Kit Roo</h1>
    <h3><em>Enhanced Spec-Driven Development with Roo Code</em></h3>
</div>

<p align="center">
    <strong>An intelligent toolkit that integrates Roo Code's advanced modes with the proven Spec-Driven Development methodology to build high-quality software faster.</strong>
</p>

[![Release](https://github.com/Michaelzag/spec-kit-roo/actions/workflows/release.yml/badge.svg)](https://github.com/Michaelzag/spec-kit-roo/actions/workflows/release.yml)

---

## Table of Contents

- [🤔 What is Spec-Driven Development?](#-what-is-spec-driven-development)
- [⚡ Get started](#-get-started)
- [📽️ Video Overview](#️-video-overview)
- [🔧 Specify CLI Reference](#-specify-cli-reference)
- [📚 Core philosophy](#-core-philosophy)
- [🌟 Development phases](#-development-phases)
- [🎯 Roo Code integration](#-roo-code-integration)
- [🔧 Prerequisites](#-prerequisites)
- [📖 Learn more](#-learn-more)
- [📋 Detailed process](#-detailed-process)
- [🔍 Troubleshooting](#-troubleshooting)
- [👥 Maintainers](#-maintainers)
- [💬 Support](#-support)
- [🙏 Acknowledgements](#-acknowledgements)
- [📄 License](#-license)

## 🤔 What is Spec-Driven Development?

Spec-Driven Development **flips the script** on traditional software development. For decades, code has been king — specifications were just scaffolding we built and discarded once the "real work" of coding began. Spec-Driven Development changes this: **specifications become executable**, directly generating working implementations rather than just guiding them.

With **Spec-Kit-Roo**, we've enhanced this methodology with **Roo Code's intelligent modes**:
- **Spec Writer** mode for comprehensive specification creation
- **Plan Architect** mode for strategic implementation planning
- **Task Orchestrator** mode for precise task execution
- **Constitution Guardian** mode for continuous compliance

## ⚡ Get started

### 1. Install Specify

Initialize your project optimized for Roo Code:

```bash
# Roo Code integration (recommended)
uvx --from git+https://github.com/Michaelzag/spec-kit-roo.git specify init <PROJECT_NAME> --ai roo
```

Or initialize in current directory:
```bash
uvx --from git+https://github.com/Michaelzag/spec-kit-roo.git specify init --here --ai roo
```

### 2. Create the spec

Use Roo Code's **Spec Writer** mode or the `/specify` command to describe what you want to build. Focus on the **what** and **why**, not the tech stack.

```bash
/specify Build an application that can help me organize my photos in separate photo albums. Albums are grouped by date and can be re-organized by dragging and dropping on the main page. Albums are never in other nested albums. Within each album, photos are previewed in a tile-like interface.
```

### 3. Create a technical implementation plan

Use Roo Code's **Plan Architect** mode or the `/plan` command to provide your tech stack and architecture choices.

```bash
/plan The application uses Vite with minimal number of libraries. Use vanilla HTML, CSS, and JavaScript as much as possible. Images are not uploaded anywhere and metadata is stored in a local SQLite database.
```

### 4. Break down and implement

Use Roo Code's **Task Orchestrator** mode or `/tasks` to create an actionable task list, then implement features systematically.

For detailed step-by-step instructions, see our [comprehensive guide](./spec-driven.md).

## 📽️ Video Overview

Want to see Spec Kit in action? Watch our [video overview](https://www.youtube.com/watch?v=a9eR1xsfvHg&pp=0gcJCckJAYcqIYzv)!

[![Spec Kit video header](/media/spec-kit-video-header.jpg)](https://www.youtube.com/watch?v=a9eR1xsfvHg&pp=0gcJCckJAYcqIYzv)

## 🔧 Specify CLI Reference

The `specify` command supports the following options:

### Commands

| Command     | Description                                                    |
|-------------|----------------------------------------------------------------|
| `init`      | Initialize a new Specify project from the latest template      |
| `check`     | Check for installed tools (`git`, `claude`, `gemini`, `code`/`code-insiders`, `cursor-agent`) |

### `specify init` Arguments & Options

| Argument/Option        | Type     | Description                                                                  |
|------------------------|----------|------------------------------------------------------------------------------|
| `<project-name>`       | Argument | Name for your new project directory (optional if using `--here`)            |
| `--ai`                 | Option   | AI assistant to use: `claude`, `gemini`, `copilot`, or `cursor`             |
| `--script`             | Option   | Script variant to use: `sh` (bash/zsh) or `ps` (PowerShell)                 |
| `--ignore-agent-tools` | Flag     | Skip checks for AI agent tools like Claude Code                             |
| `--no-git`             | Flag     | Skip git repository initialization                                          |
| `--here`               | Flag     | Initialize project in the current directory instead of creating a new one   |
| `--skip-tls`           | Flag     | Skip SSL/TLS verification (not recommended)                                 |
| `--debug`              | Flag     | Enable detailed debug output for troubleshooting                            |

### Examples

```bash
# Basic project initialization
specify init my-project

# Initialize with specific AI assistant
specify init my-project --ai claude

# Initialize with Cursor support
specify init my-project --ai cursor

# Initialize with PowerShell scripts (Windows/cross-platform)
specify init my-project --ai copilot --script ps

# Initialize in current directory
specify init --here --ai copilot

# Skip git initialization
specify init my-project --ai gemini --no-git

# Enable debug output for troubleshooting
specify init my-project --ai claude --debug

# Check system requirements
specify check
```

## 📚 Core philosophy

Spec-Driven Development with Roo Code integration is a structured process that emphasizes:

- **Intent-driven development** where specifications define the "_what_" before the "_how_"
- **Intelligent mode orchestration** using Roo Code's specialized modes for each development phase
- **Rich specification creation** using guardrails and organizational principles
- **Multi-step refinement** rather than one-shot code generation from prompts
- **Constitutional awareness** ensuring compliance throughout the development lifecycle
- **Heavy reliance** on advanced AI model capabilities for specification interpretation

## 🌟 Development phases

| Phase | Roo Mode | Focus | Key Activities |
|-------|----------|-------|----------------|
| **0-to-1 Development** ("Greenfield") | Spec Writer → Plan Architect → Task Orchestrator | Generate from scratch | <ul><li>Start with high-level requirements</li><li>Generate specifications using Specification templates</li><li>Plan implementation steps with Plan Architect guidance</li><li>Build production-ready applications</li></ul> |
| **Creative Exploration** | Constitution Guardian | Parallel implementations | <ul><li>Explore diverse solutions with constitutional compliance</li><li>Support multiple technology stacks & architectures</li><li>Experiment with UX patterns</li></ul> |
| **Iterative Enhancement** ("Brownfield") | Task Orchestrator | Brownfield modernization | <ul><li>Add features iteratively with task coordination</li><li>Modernize legacy systems</li><li>Adapt processes with mode orchestration</li></ul> |

## 🎯 Roo Code integration

**Spec-Kit-Roo** leverages Roo Code's powerful mode system to create a seamless spec-driven development experience:

### Core Modes

#### 🔧 Spec Writer
- **Purpose**: Create detailed feature specifications and user stories
- **When to use**: First phase of development, specification creation
- **Capabilities**: Comprehensive requirement gathering, team culture alignment, constitutional compliance validation

#### 🏗️ Plan Architect
- **Purpose**: Generate strategic implementation plans and technical decisions
- **When to use**: Second phase, after specifications are complete
- **Capabilities**: Research generation, data model design, contract creation, and technical documentation

#### 📋 Task Orchestrator
- **Purpose**: Break down plans into executable tasks with precise coordination
- **When to use**: Third phase, after plans are created
- **Capabilities**: Parallel task execution, dependency management, and progress tracking

#### ⚖️ Constitution Guardian
- **Purpose**: Ensure ongoing compliance with project principles and constraints
- **When to use**: Throughout development lifecycle for constitutional validation
- **Capabilities**: Continuous compliance monitoring and proactive guidance

### Features
- **Intelligent Context Sharing**: Seamless information flow between modes
- **Constitutional Awareness**: Built-in compliance with project principles
- **Mode Orchestration**: Automatic coordination between development phases
- **Progressive Refinement**: Iterative enhancement based on user feedback
- **User-Centric Delivery**: Build applications for different user cohorts and preferences
- **Flexible Development Approaches**: Support workflows from vibe-coding to AI-native development

### Creative & iterative processes

- Validate the concept of parallel implementation exploration
- Provide robust iterative feature development workflows
- Extend processes to handle upgrades and modernization tasks

## 🔧 Prerequisites

- **Linux/macOS** (or WSL2 on Windows)
- [Roo Code extension](https://github.com/roocode/roocode) for VS Code (primary agent)
- Optional AI coding agents: [Claude Code](https://www.anthropic.com/claude-code), [GitHub Copilot](https://code.visualstudio.com/), [Gemini CLI](https://github.com/google-gemini/gemini-cli), or [Cursor](https://cursor.sh/)
- [uv](https://docs.astral.sh/uv/) for package management
- [Python 3.11+](https://www.python.org/downloads/)
- [Git](https://git-scm.com/downloads)

### Roo Code Setup

1. **Install the Roo Code extension** in VS Code
2. **Enable Experimental → Run Slash Command** in Roo settings
3. **Use the integrated modes** through VS Code's command palette

## 📖 Learn more

- **[Complete Spec-Driven Development Methodology](./spec-driven.md)** - Deep dive into the full process
- **[Detailed Walkthrough](#-detailed-process)** - Step-by-step implementation guide
- **[Roo Code Modes Reference](./templates/roo/modes.yml)** - Complete mode definitions and capabilities

---

## 📋 Detailed process

<details>
<summary>Click to expand the detailed step-by-step walkthrough</summary>

You can use the Specify CLI to bootstrap your project, which will bring in the required artifacts in your environment. Run:

```bash
specify init <project_name> --ai roo
```

Or initialize in the current directory:
```bash
specify init --here --ai roo
```

![Specify CLI bootstrapping a new project in the terminal](./media/specify_cli.gif)

You will be prompted to select the AI agent you are using. For Roo Code optimized setup:

```bash
# Roo Code with full integration
specify init <project_name> --ai roo
# Or in current directory:
specify init --here --ai roo
```

The CLI will set up Roo Code specific configurations and copy the required templates and rules.

### **STEP 1:** Bootstrap the project

Open your project in VS Code with the **Roo Code extension installed**. Ensure the following settings are configured:

- **Enable Experimental → Run Slash Command** in Roo settings
- **Roo version that supports custom modes**

When properly configured, you should see the `/specify`, `/plan`, and `/tasks` commands available in the command palette.

The first step should be creating a new project scaffolding. Use the **Spec Writer** mode or `/specify` command and then provide the concrete requirements for the project you want to develop.

>[!IMPORTANT]
>Be as explicit as possible about _what_ you are trying to build and _why_. **Do not focus on the tech stack at this point**.

An example prompt:

```text
Develop Taskify, a team productivity platform. It should allow users to create projects, add team members,
assign tasks, comment and move tasks between boards in Kanban style. In this initial phase for this feature,
let's call it "Create Taskify," let's have multiple users but the users will be declared ahead of time, predefined.
I want five users in two different categories, one product manager and four engineers. Let's create three
different sample projects. Let's have the standard Kanban columns for the status of each task, such as "To Do,"
"In Progress," "In Review," and "Done." There will be no login for this application as this is just the very
first testing thing to ensure that our basic features are set up. For each task in the UI for a task card,
you should be able to change the current status of the task between the different columns in the Kanban work board.
You should be able to leave an unlimited number of comments for a particular card. You should be able to, from that task
card, assign one of the valid users. When you first launch Taskify, it's going to give you a list of the five users to pick
from. There will be no password required. When you click on a user, you go into the main view, which displays the list of
projects. When you click on a project, you open the Kanban board for that project. You're going to see the columns.
You'll be able to drag and drop cards back and forth between different columns. You will see any cards that are
assigned to you, the currently logged in user, in a different color from all the other ones, so you can quickly
see yours. You can edit any comments that you make, but you can't edit comments that other people made. You can
delete any comments that you made, but you can't delete comments anybody else made.
```

After this prompt is entered, Roo Code will kick off the planning and spec drafting process using the **Spec Writer** mode. Roo Code will also trigger some of the built-in scripts to set up the repository.

Once this step is completed, you should have a new branch created (e.g., `001-create-taskify`), as well as a new specification in the `specs/001-create-taskify` directory.

The produced specification should contain a set of user stories and functional requirements, as defined in the template.

At this stage, your project folder contents should resemble the following:

```text
├── memory
│	 ├── constitution.md
│	 └── constitution_update_checklist.md
├── scripts
│	 ├── check-task-prerequisites.sh
│	 ├── common.sh
│	 ├── create-new-feature.sh
│	 ├── get-feature-paths.sh
│	 ├── setup-plan.sh
│	 └── update-agent-context.sh
├── specs
│	 └── 001-create-taskify
│	     └── spec.md
├── templates
│	 ├── plan-template.md
│	 ├── spec-template.md
│	 ├── tasks-template.md
│	 └── roo/
├── .roo
│	 ├── commands/
│	 └── rules-*/
└── AGENTS.md
```

### **STEP 2:** Functional specification clarification

With the baseline specification created, you can go ahead and clarify any of the requirements that were not captured properly within the first shot attempt. For example, you could use a prompt like this within the same Roo Code session:

```text
For each sample project or project that you create there should be a variable number of tasks between 5 and 15
tasks for each one randomly distributed into different states of completion. Make sure that there's at least
one task in each stage of completion.
```

You should also ask Roo Code to validate the **Review & Acceptance Checklist**, checking off the things that are validated/pass the requirements, and leave the ones that are not unchecked. The following prompt can be used:

```text
Read the review and acceptance checklist, and check off each item in the checklist if the feature spec meets the criteria. Leave it empty if it does not.
```

It's important to use the interaction with Roo Code as an opportunity to clarify and ask questions around the specification - **do not treat its first attempt as final**.

### **STEP 3:** Generate a plan

You can now be specific about the tech stack and other technical requirements. Use the **Plan Architect** mode or the `/plan` command with a prompt like this:

```text
We are going to generate this using .NET Aspire, using Postgres as the database. The frontend should use
Blazor server with drag-and-drop task boards, real-time updates. There should be a REST API created with a projects API,
tasks API, and a notifications API.
```

The output of this step will include a number of implementation detail documents, with your directory tree resembling this:

```text
.
├── AGENTS.md
├── memory
│	 ├── constitution.md
│	 └── constitution_update_checklist.md
├── scripts
│	 ├── check-task-prerequisites.sh
│	 ├── common.sh
│	 ├── create-new-feature.sh
│	 ├── get-feature-paths.sh
│	 ├── setup-plan.sh
│	 └── update-agent-context.sh
├── specs
│	 └── 001-create-taskify
│	     ├── contracts
│	     │	 ├── api-spec.json
│	     │	 └── signalr-spec.md
│	     ├── data-model.md
│	     ├── plan.md
│	     ├── quickstart.md
│	     ├── research.md
│	     └── spec.md
├── templates
│	 ├── roo/
│	 └── tasks-template.md
└── .roo
```

Check the `research.md` document to ensure that the right tech stack is used, based on your instructions. You can ask Roo Code to refine it if any of the components stand out, or even have it check the locally-installed version of the platform/framework you want to use (e.g., .NET).

Additionally, you might want to ask Roo Code to research details about the chosen tech stack if it's something that is rapidly changing (e.g., .NET Aspire, JS frameworks), with a prompt like this:

```text
I want you to go through the implementation plan and implementation details, looking for areas that could
benefit from additional research as .NET Aspire is a rapidly changing library. For those areas that you identify that
require further research, I want you to update the research document with additional details about the specific
versions that we are going to be using in this Taskify application and spawn parallel research tasks to clarify
any details using research from the web.
```

During this process, you might find that Roo Code gets stuck researching the wrong thing - you can help nudge it in the right direction with a prompt like this:

```text
I think we need to break this down into a series of steps. First, identify a list of tasks
that you would need to do during implementation that you're not sure of or would benefit
from further research. Write down a list of those tasks. And then for each one of these tasks,
I want you to spin up a separate research task so that the research is highly targeted
to the specific needs you have. Research the correct .NET Aspire versions and
specific implementation patterns for Taskify.
```

>[!NOTE]
>Roo Code might be over-eager and add components that you did not ask for. Ask it to clarify the rationale and the source of the change.

### **STEP 4:** Have Roo Code validate the plan

With the plan in place, you should have Roo Code run through it to make sure that there are no missing pieces. You can use a prompt like this:

```text
Now I want you to go and audit the implementation plan and the implementation detail files.
Read through it with an eye on determining whether or not there is a sequence of tasks that you need
to be doing that are obvious from reading this. Because I don't know if there's enough here. For example,
when I look at the core implementation, it would be useful to reference the appropriate places in the implementation
details where it can find the information as it walks through each step in the core implementation or in the refinement.
```

This helps refine the implementation plan and helps you avoid potential blind spots that Roo Code missed in its planning cycle. Once the initial refinement pass is complete, ask Roo Code to go through the checklist once more before you can get to the implementation.

You can also ask Roo Code (if you have the [GitHub CLI](https://docs.github.com/en/github-cli/github-cli) installed) to go ahead and create a pull request from your current branch to `main` with a detailed description, to make sure that the effort is properly tracked.

>[!NOTE]
>Before you have the agent implement it, it's also worth prompting Roo Code to cross-check the details to see if there are any over-engineered pieces (remember - it can be over-eager). If over-engineered components or decisions exist, you can ask Roo Code to resolve them. Ensure that Roo Code follows the [constitution](./memory/constitution.md) as the foundational piece that it must adhere to when establishing the plan.

### STEP 5: Implementation

Once ready, use the **Task Orchestrator** mode or `/tasks` to break down and execute:

```text
/tasks Break down the plan in specs/001-create-taskify/plan.md into executable tasks
```

Roo Code will spring into action and will start creating the implementation, coordinating between modes as needed.

>[!IMPORTANT]
>Roo Code will execute local CLI commands (such as `dotnet`) - make sure you have them installed on your machine.

Once the implementation step is done, ask Roo Code to try to run the application and resolve any emerging build errors. If the application runs, but there are _runtime errors_ that are not directly available to Roo Code through CLI logs (e.g., errors rendered in browser logs), copy and paste the error in Roo Code and have it attempt to resolve it.

</details>

---

## 🔍 Troubleshooting

### Git Credential Manager on Linux

If you're having issues with Git authentication on Linux, you can install Git Credential Manager:

```bash
#!/usr/bin/env bash
set -e
echo "Downloading Git Credential Manager v2.6.1..."
wget https://github.com/git-ecosystem/git-credential-manager/releases/download/v2.6.1/gcm-linux_amd64.2.6.1.deb
echo "Installing Git Credential Manager..."
sudo dpkg -i gcm-linux_amd64.2.6.1.deb
echo "Configuring Git to use GCM..."
git config --global credential.helper manager
echo "Cleaning up..."
rm gcm-linux_amd64.2.6.1.deb
```

## 👥 Maintainers

- Michael Zag ([@Michaelzag](https://github.com/Michaelzag))
- Original Spec-Kit Contributors

## 💬 Support

For support, please open a [GitHub issue](https://github.com/Michaelzag/spec-kit-roo/issues/new). We welcome bug reports, feature requests, and questions about using Spec-Driven Development with Roo Code.

## 🙏 Acknowledgements

This project builds upon the original **Spec-Kit** project from GitHub and is inspired by the work of **John Lam**. Enhanced with **Roo Code** integration developed by **Michael Zag**.

## 📄 License

This project is licensed under the terms of the MIT open source license. Please refer to the [LICENSE](./LICENSE) file for the full terms.
