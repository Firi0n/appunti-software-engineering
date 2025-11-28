# :rocket: MkDocs Setup

This repository provides a basic setup for [MkDocs](https://www.mkdocs.org/) with a simple
[Docker](https://www.docker.com/) setup and includes a GitHub Action for automatic deployment to GitHub Pages.

## :pushpin: MkDocs Configuration

This setup uses the [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/) theme.

The content is written in **Markdown**, with support for:

-   :writing_hand: **LaTeX** for mathematical equations
-   :bar_chart: **Mermaid and D2** for diagrams and flowcharts
-   :computer: **Syntax highlighting** for code blocks

## :sparkles: Enhancements

This setup includes two key improvements:

-   :white_check_mark: **Justified text alignment**: Ensures a cleaner and more professional look across all pages.
-   :repeat: **Sequential navigation buttons**: Automatically added at the bottom of each page, allowing users to move
    forward and backward between chapters effortlessly.

## :hammer_and_wrench: Basic Functionality

-   :page_facing_up: Add new documentation pages by creating `.md` files inside the `docs/` folder.

-   :wrench: Customize your site by editing the mkdocs.yml configuration file:
    -   Set your site name.
    -   Define the navigation structure by listing your pages in the SUMMARY.md file under the nav section.

```md
    # Documentation
    -   [home](index.md)
```

The path should be relative to the `docs/` directory.

### :open_file_folder: Folder Structure

The `docs/` folder contains the documentation files, organized as follows:

```
docs/
│-- index.md  # Home page
|-- SUMMARY.md # Nav
|-- overrides/
|   |-- main.html
|   |-- main.css
│-- src/  # Folder for images and other resources
```

Each `.md` file represents a documentation page. You can structure the content as needed by adding subfolders and
additional Markdown files.

The `src/` folder is intended for storing images and other resource files that may be referenced within the
documentation.

## :trophy: Best Practices

To ensure a high-quality documentation experience, follow these best practices:

-   :memo: **Write clear and concise content**: Keep sentences short and avoid unnecessary complexity.
-   :mag: **Use consistent formatting**: Headers, bullet points, and code blocks should follow a uniform style.
-   :link: **Use internal links**: Connect related pages using Markdown links to enhance navigation.
-   :framed_picture: **Optimize images**: Keep image sizes reasonable and use compressed formats to improve loading
    times.
-   :book: **Organize content logically**: Structure sections and pages in a way that makes sense for users.
-   :white_check_mark: **Test locally before deploying**: Run `mkdocs serve` to preview changes before pushing them
    live.

## :gear: Advanced Customization

For advanced customization, refer to the
[Material for MkDocs documentation](https://squidfunk.github.io/mkdocs-material/creating-your-site/#advanced-configuration).

## :rocket: GitHub Pages Deployment

To deploy your site using GitHub Pages:

1. **Create a new repository using this template**:

    - Click the **"Use this template"** button at the top of this repository.
    - Name your new repository.

2. **Enable GitHub Pages** in the repository settings by selecting `GitHub Actions` as the source:
    - Go to **Settings > Pages**
    - Under **Build and deployment**, select **GitHub Actions**
    - Save the settings

Once set up, GitHub Actions will automatically deploy your site from the `main` branch.  
Your site will be available at:  
:point_right: `https://<your-username>.github.io/<repository-name>/`

## :repeat: Template Sync Workflow

This template includes a **manual sync workflow** that automatically pulls the latest updates from the original template
repository:

1. Go to the **Actions** tab in your repository
2. Select **":repeat: Sync Template Updates"**
3. Click **"Run workflow"** → :white_check_mark: All files updated!
4. **Auto-deploy** triggers → Site live with latest features

**Keeps your repo always up-to-date** with zero manual copying! :rocket:

## :inbox_tray: Installation

In all cases first steps are:

```sh
# Clone the repository
git clone https://github.com/Firi0n/MKDocs-setup.git

# Enter it
cd MKDocs-setup
```

### :desktop_computer: Local setup

Before proceeding, ensure you have Python, pip and d2 installed on your system. You can check by running:

```sh
python --version
pip --version
d2 --version
```

If not installed, refer to the official:

-   [Python installation guide](https://www.python.org/downloads/)
-   [d2 installation guide](https://d2lang.com/tour/install/)

to set them up.

```sh
# Install dependencies
pip install -r requirements.txt

# Start the local server
mkdocs serve
```

### :whale: Docker setup

```sh
# Build the Docker image
docker build -t mkdocs-site .

# Run the container
docker run -p 8000:8000 mkdocs-site
```

### :globe_with_meridians: Access the Site

Open your browser and go to `http://localhost:8000`
