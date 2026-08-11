```markdown
# 3-Doc Context System

**A lightweight, AI-friendly project memory system.**

Keep decisions, ideas, and next actions organized across long conversations — without losing context when chats reset.

---

## Why This Exists

Most AI chats have no persistent memory.  
You re-explain the same decisions, lose track of next steps, and watch good ideas disappear.

The **3-Doc Context System** solves that with three simple Markdown files and a clear update ritual:

| File                  | Purpose                                      |
|-----------------------|----------------------------------------------|
| `PROJECT_MEMORY.md`   | Core decisions, stack, status, and scripts   |
| `INSIGHTS_LOG.md`     | Ideas, observations, and parked thoughts     |
| `NEXT_ACTIONS.md`     | Clear, bite-sized next steps                 |

It is deliberately minimal so it stays usable even when focus is low.

---

## Features

- Clean separation of **facts**, **ideas**, and **actions**
- `<!-- === AUTO-UPDATE START === -->` markers for precise AI updates
- Date tracking (`Last Updated` + `Original Session`)
- One-command update script (`quick_update.sh`)
- Works with any AI (Grok, Claude, ChatGPT, local models, etc.)
- Multi-project support via symlinks
- Automatic backups on every update
- Compatible with Nextcloud, Git, Obsidian, VS Code, and plain folders

---

## Folder Structure

```text
3_Doc_System/                     # Central tools (shared)
├── quick_update.sh
├── README.md
└── session_starter.txt           # Optional

Your_Project/
├── quick_update.sh               # Symlink to central script
└── docs/
    ├── PROJECT_MEMORY.md
    ├── INSIGHTS_LOG.md
    ├── NEXT_ACTIONS.md
    └── archives/                 # Automatic dated backups
```

---

## Quick Start

### 1. Create the central tools folder

```bash
mkdir -p ~/3_Doc_System
cd ~/3_Doc_System
```

### 2. Add the update script

```bash
curl -O https://raw.githubusercontent.com/YOUR_USERNAME/3-doc-system/main/quick_update.sh
chmod +x quick_update.sh
```

*(Or copy the script from this repository.)*

### 3. Create a new project

```bash
mkdir -p ~/Projects/MyProject/docs
ln -s ~/3_Doc_System/quick_update.sh ~/Projects/MyProject/quick_update.sh
cd ~/Projects/MyProject
```

### 4. Create the three starter documents

```bash
# PROJECT_MEMORY.md
cat > docs/PROJECT_MEMORY.md << 'EOF'
# Project Memory
**Key Decisions & Scripts**

**Last Updated:** 
**Original Session:** 

## Core Facts & Decisions
<!-- === AUTO-UPDATE START ===

=== AUTO-UPDATE END === -->

## Scripts Placeholder
| Script Name | Path | Status | Notes |
|-------------|------|--------|-------|
<!-- === AUTO-UPDATE START ===

=== AUTO-UPDATE END === -->
EOF

# INSIGHTS_LOG.md
cat > docs/INSIGHTS_LOG.md << 'EOF'
# Insights Log
**Wild Ideas from Our Chats**

**Last Updated:** 
**Original Session:** 

<!-- === AUTO-UPDATE START ===

=== AUTO-UPDATE END === -->
EOF

# NEXT_ACTIONS.md
cat > docs/NEXT_ACTIONS.md << 'EOF'
# Next Actions
**Bite-Size Steps to Completion**

**Last Updated:** 
**Original Session:** 

<!-- === AUTO-UPDATE START ===

=== AUTO-UPDATE END === -->
EOF
```

---

## How to Use with AI

### At the **start** of a chat

Paste this (and include the current content of your three docs if needed):

```text
Here are my current 3 docs. Update only the content between the AUTO-UPDATE markers. 
Keep the rest of the structure unchanged.

Also update the "Last Updated" date to today’s date. 
Only change "Original Session" if this is a summary of an older conversation.

Output the three files using this exact format:

===== PROJECT_MEMORY.md =====
(full content)

===== INSIGHTS_LOG.md =====
(full content)

===== NEXT_ACTIONS.md =====
(full content)
```

### At the **end** of a chat

```text
Update my 3-doc system with everything important from this conversation.
Use the exact ===== format.
```

### Apply the update

```bash
cd ~/Projects/MyProject
./quick_update.sh
```

Paste the AI’s full reply, then press `Ctrl + D`.

The script will:
- Update the three documents
- Create a dated backup in `docs/archives/`

---

## Multi-Project Workflow

Keep one central copy of `quick_update.sh` and symlink it into every project:

```bash
ln -s ~/3_Doc_System/quick_update.sh ~/Projects/AnotherProject/quick_update.sh
```

Each project keeps its own independent `docs/` folder.

---

## Tips

- Always leave the `<!-- === AUTO-UPDATE ... === -->` markers in place.
- Keep entries short and concrete.
- Review `NEXT_ACTIONS.md` at the start of every work session.
- Use the `Scripts Placeholder` table to track deployment and helper scripts.
- Commit the `docs/` folder to Git if you want version history across devices.

---

## License

MIT — do whatever you want with it.

---

**Built for clarity, not complexity.**
```

You can copy the entire block above into a new `README.md` in your GitHub repository.
