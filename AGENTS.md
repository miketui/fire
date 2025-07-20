# Agent Name: Fire 🔥

## Project Overview

The goal of this repository is to convert each individual chapter Markdown file into a separate, professionally formatted and styled XHTML file. The conversion will use Pandoc, a custom XHTML template, and an external CSS file to ensure consistency and a professional appearance without inline styles.

**Primary Goal**: For each `*_final.md` file, generate a corresponding `.xhtml` file in the `output/` directory.

---

## File Structure & Purpose

* `*_final.md`: The final, canonical versions of each book chapter. These are the source files for conversion. Each file should contain YAML frontmatter for its title (e.g., `title: "Chapter I: Unveiling Your Creative Odyssey"`).
* `*_edited.md`: Draft versions. **Ignore these for the conversion.**
* `book-map.yaml`: A list of the `_final.md` files to be processed. This ensures we only convert the intended chapters.
* `template.xhtml`: **Crucial file.** A Pandoc template that defines the structure of the output XHTML. It ensures each file has the correct `DOCTYPE`, `head`, and links the stylesheet properly.
* `style.css`: The external stylesheet for all generated XHTML files. This single file controls the visual appearance (fonts, headings, spacing) of all chapters. It should be placed in the `output/` directory alongside the XHTML files.
* `setup.sh`: A script to install dependencies and create the necessary configuration files for the agent.

---

## Workflow for XHTML Generation

To convert the chapters, follow these steps precisely:

1.  **Place a copy of `style.css` into the `output/` directory.** The XHTML files will need to link to it from there.
2.  **Read the `book-map.yaml`** to get the list of `*_final.md` files to process.
3.  **Iterate through each Markdown file** from the list. For each file:
    * Execute a Pandoc command to convert it to XHTML.
    * The output filename should match the input, but with an `.xhtml` extension (e.g., `9-Chapter-I..._final.md` -> `9-Chapter-I..._final.xhtml`).
    * All output `.xhtml` files must be saved in the `output/` directory.
    * The conversion **must** use the `template.xhtml` file.

**Example Pandoc Command (for a single file):**
```bash
pandoc "9-Chapter-I-Unveiling-Your-Creative-Odyssey_final.md" \
-s --from markdown --to html5 \
--template=template.xhtml \
-o "output/9-Chapter-I-Unveiling-Your-Creative-Odyssey_final.xhtml"
