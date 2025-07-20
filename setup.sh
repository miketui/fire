#!/bin/bash

# setup.sh
# This script installs dependencies and generates the necessary project files.

echo "--- Installing Dependencies (Pandoc) ---"
# (Include Pandoc installation steps from the previous response if needed)
# Example for macOS: brew install pandoc
# Example for Ubuntu: sudo apt-get install pandoc
echo "--- Dependencies assumed to be present. ---"

# Create output directory
mkdir -p output

# Create a copy of the stylesheet in the output directory
cp style.css output/style.css

echo "--- Creating template.xhtml ---"
cat > template.xhtml <<'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
  <meta charset="UTF-8" />
  <title>$title$</title>
  <link rel="stylesheet" href="style.css" type="text/css" />
</head>
<body>
  <div class="chapter-container">
    <header>
      <h1>$title$</h1>
    </header>
    <main class="content">
      $body$
    </main>
  </div>
</body>
</html>
EOF

echo "--- Creating AGENTS.md for XHTML conversion ---"
cat > AGENTS.md <<'EOF'
# Agent Name: Fire 🔥

## Project Overview

The goal of this repository is to convert each individual chapter Markdown file into a separate, professionally formatted and styled XHTML file. The conversion will use Pandoc, a custom XHTML template, and an external CSS file to ensure consistency and a professional appearance without inline styles.

**Primary Goal**: For each `*_final.md` file, generate a corresponding `.xhtml` file in the `output/` directory.

---

## File Structure & Purpose

* `*_final.md`: The final, canonical versions of each book chapter. These are the source files for conversion. Each file should contain YAML frontmatter for its title.
* `*_edited.md`: Draft versions. **Ignore these for the conversion.**
* `book-map.yaml`: A list of the `_final.md` files to be processed.
* `template.xhtml`: A Pandoc template that defines the structure of the output XHTML.
* `style.css`: The external stylesheet for all generated XHTML files. It should be placed in the `output/` directory alongside the XHTML files.
* `setup.sh`: A script to install dependencies and create the necessary configuration files for the agent.

---

## Workflow for XHTML Generation

To convert the chapters, follow these steps precisely:

1.  **Place a copy of `style.css` into the `output/` directory.** The XHTML files will need to link to it from there.
2.  **Read the `book-map.yaml`** to get the list of `*_final.md` files to process.
3.  **Iterate through each Markdown file** from the list. For each file:
    * Execute a Pandoc command to convert it to XHTML.
    * The output filename should match the input, but with an `.xhtml` extension.
    * All output `.xhtml` files must be saved in the `output/` directory.
    * The conversion **must** use the `template.xhtml` file.

**Example Pandoc Command (for a single file):**
\`\`\`bash
pandoc "9-Chapter-I-Unveiling-Your-Creative-Odyssey_final.md" \
-s --from markdown --to html5 \
--template=template.xhtml \
-o "output/9-Chapter-I-Unveiling-Your-Creative-Odyssey_final.xhtml"
\`\`\`
EOF

echo "--- Project setup for XHTML conversion is complete. ---"
