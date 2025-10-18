# 2024 UW-Madison Open Source Program Office Survey

In Spring 2024 the [Open Source Program Office at UW-Madison](https://ospo.wisc.edu/) distributed an open source survey to gauge the usage of open source tools among members of the university community, identify open source projects under development, and to collect feedback on improving the open source environment at UW-Madison. This repo is for a [Quarto site](https://quarto.org/) for summarizing and presenting results from the survey.

This site uses the [UW Quarto site template](https://github.com/UW-Madison-DSI/uw_quarto_site_template). University theming can be customized using the `custom.scss` and `setup.R` files. Plot theming is generally handled in `setup.R`. Other customizations, such as highlighting specific open source tools in response plots, are handled in the appropriate page files (such as `usage.qmd`).

### Building the Site On GitHub Pages

Quarto sites can be deployed to GitHub Pages either by 1) rendering the site locally and pushing the updated repo to GitHub with Pages set to deploy the site from the `docs` directory or 2) by using GitHub Actions to render the site when pushing updates to the repo. See [Quarto's documentation on deploying Quarto sites to GitHub Pages](https://quarto.org/docs/publishing/github-pages.html#publish-command) for more detail.

This repo is currently configured so that the deployment is done using GitHub Actions (the GitHub service). 
 It utilizes a GitHub Action from quarto-dev (specifically [`quarto-dev/quarto-actions/render`](https://github.com/quarto-dev/quarto-actions/tree/main/render)) and another action that GitHub defines as a "publishing source" (see  [publishing source for GitHub Pages][GitHub pages publishing source]).


[GitHub pages publishing source]: https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site#publishing-with-a-custom-github-actions-workflow

**Companion site (MyST, for python users):** [MyST site](https://uw-madison-dsi.github.io/open_source_survey_results_myst/)

## Citation

If you use this work, please cite us as
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.17379408.svg)](https://doi.org/10.5281/zenodo.17379408)


## Reproduce a PDF Report

Follow the steps below to generate the report in PDF format using our markdown.

1. Move report files to the project root
Locate all files from the latex-report/ directory and move them to the main project root so that Quarto can correctly detect and compile them.
2. Ensure supporting assets are accessible
Confirm that any required assets (e.g., images/, before-body.tex, or other .qmd files) are also located in the root directory or properly referenced in _quarto.yml.
3. Rename the Quarto configuration file
Rename the file _quarto_report.md to _quarto.yml (or _quarto.md if using a Markdown configuration).
This ensures Quarto recognizes your project configuration.
4. Render the PDF report
Open a terminal in the project directory and run:
```
quarto render --to pdf
```
Quarto will compile all chapters and assets into a single PDF, which will be saved in the project directory (or in _book/ if you are using a book-type project).