# Codex Agent Instructions for MATLAB Toolbox Design

## Objective

This repository documents best practices for building MATLAB® toolboxes. The **AGENTS.md** file outlines a set of actionable instructions for a Codex‑powered agent responsible for generating and maintaining a toolbox that conforms to these practices. The goal is to ensure that any automatically generated toolbox is easy for users to install, understand, and contribute to, and that it follows MathWorks’ guidelines for structure, packaging, testing, and release.

---

## 1. Root folder configuration

- **Choose a valid root name** – Shorten the English name of your toolbox, drop the word “toolbox”, start the name with a letter and use only letters, numbers, or underscores.  
  _Example:_ “QuickerSim CFD Toolbox for MATLAB” → `quickerSimCFD`.

- **Create a README.md** – Include a user‑focused `README.md` summarizing what the toolbox does and providing installation instructions. Direct users to a `GettingStarted.mlx` file for detailed usage, and include sections for contributors.

- **Add a license.txt** – Include a license file describing how others may use and modify your code. Without this, potential users may be unsure if they can legally use or change the toolbox.

- **Store images in an `images/` folder** – Keep any screenshots or badges used in `README.md` in an `images/` sub‑folder to reduce clutter in the root folder.

- **Prepare for additional configuration files** – Place git configuration files (like `.gitignore` or `.gitattributes`) in the root. Build utilities (e.g., `buildfile.m`) live in a `buildUtilities` folder.

---

## 2. Toolbox folder layout

- **Toolbox folder** – The `toolbox/` folder contains all files that will be distributed to end‑users.

  - **Small toolboxes (<20 functions or classes)** – Place user‑visible functions and classes directly in `toolbox/`. Put internal helpers in a `private/` sub‑folder.

  - **Larger toolboxes** – Keep common functions at the top level, group specialized functionality into sub‑folders, and consider namespaces (package folders). Implementation details go into a `<toolboxname>.internal` namespace.

  - **Documentation and examples** – Include `doc/GettingStarted.mlx` and MATLAB live script examples in an `examples/` folder.

  - **Private functions** – Keep non‑public API functions in a `private/` folder.

  - **Applications and namespaces** – Place `.mlapp` files in an `apps/` folder and use package folders (e.g., `+describe`) to group related functions.

---

## 3. Enhancing user experience

- **Argument validation and tab completion** – Use MATLAB’s `arguments` block to define input types and sizes. Create `functionSignatures.json` for enhanced tab completion.

- **Namespaces** – Use `+packageName` folders to prevent name collisions and group related functions logically.

- **MATLAB apps** – Provide `.mlapp` files in an `apps/` folder and ensure they are included in packaging.

- **MEX functions** – For performance‑critical sections, use compiled MEX files. Follow the `MEX.md` guidelines (see section 6).

---

## 4. Packaging and releasing

- **Use the .mltbx format** – Package your toolbox into a `.mltbx` file so users can install it easily.

- **Project files for packaging** – From MATLAB R2025a, use the Package Toolbox task within MATLAB Projects; name the `.prj` file after the root folder.

- **Icon and release folder** – Store the toolbox icon in `images/` and place generated `.mltbx` files in a `release/` folder (do not commit it).

- **Include everything under toolbox/** – Ensure all relevant content is included in the packaging dialog.

- **Naming and versioning** – Use readable toolbox names and semantic versioning.

- **Release channels** – Release via GitHub, MATLAB File Exchange, or shared locations.

---

## 5. Making the toolbox robust

- **Tests** – Write unit tests in a `tests/` folder using the MATLAB testing framework. Configure GitHub Actions to run them automatically.

- **MATLAB projects** – Create a `.prj` file matching the root folder name and commit it to source control.

- **Source control hygiene** – Include `.gitignore` and `.gitattributes`, and exclude derived files.

- **Badges** – Add “Open in MATLAB Online” and “File Exchange” badges in your README.

---

## 6. MEX function integration

- **Project organisation** – Place all C/C++ source files in `cpp/`. Each MEX function should be in its own sub‑folder (e.g., `cpp/invertMex`).

- **Derived binaries** – Compile MEX files to `toolbox/derived/` and keep this on the MATLAB path.

- **Access through MATLAB functions** – Wrap MEX calls with MATLAB functions that perform input validation.

- **Platform‑specific considerations** – Use `mexext` to determine the correct binary extension and organize by platform.

- **Out‑of‑process execution** – For C++ MEX, use `mexhost` for isolation and reliability.

- **Automation with buildtool** – Define a `buildfile.m` using `MexTask` to automatically compile MEX functions.

- **File exchange restrictions** – Do **not** publish compiled MEX binaries on File Exchange; share only source code.

---

## 7. Security and vulnerability reporting

Include a `SECURITY.md` with instructions for vulnerability reporting (e.g., contact `security@mathworks.com` and link to MathWorks’ disclosure policy).

---

## 8. Final checklist for Codex

When generating or updating a MATLAB toolbox, the Codex agent should:

1. Set up the repository with `README.md`, `license.txt`, `images/`, `.gitignore`, and build utilities.
2. Populate `toolbox/` with public APIs, apps, examples, and docs; hide implementation details in `private/`.
3. Add validation, tab completion, apps, and MEX integration when needed.
4. Write unit tests in `tests/` and configure CI workflows.
5. Create a MATLAB project (`.prj`) and compile a `.mltbx` for release.
6. Tag and release on GitHub with semantic versioning; optionally link to File Exchange.
7. Follow MEX integration guidelines and exclude binaries from version control.
8. Provide `SECURITY.md` and badges for MATLAB Online and File Exchange.

---

**By following these instructions, the Codex agent will produce MATLAB toolboxes that are well‑structured, user‑friendly, and ready for distribution.**
