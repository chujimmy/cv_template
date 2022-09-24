# LaTeX and moderncv Docker container
Easy-to-use Docker application, based on LaTeX and a customised moderncv library to seamlessly generate CVs and cover letters.

This is a GitHub template repository, feel free to use it and adapt it to your use case.

### CV
[![CV](https://raw.githubusercontent.com/chujimmy/cv_template/main/example/cv_example.png)](https://raw.githubusercontent.com/chujimmy/cv_template/main/example/cv_example.pdf)

### Cover Letter
[![Cover Letter](https://raw.githubusercontent.com/chujimmy/cv_template/main/example/cover_letter_example.png)](https://raw.githubusercontent.com/chujimmy/cv_template/main/example/cover_letter_example.pdf)

# How to use
## Requirements
- Docker
- Optional: GitHub Settings App: https://probot.github.io/apps/settings/ 
- Optional: GitHub Stale App: https://github.com/apps/stale

## Getting started
- Use this template to create your own repository: https://github.com/chujimmy/cv_template/generate
- Checkout your newly created repository
- Update environment variables in the `docker-compose.yml` file accordingly
- Fill the CVs with your experiences
- Update notification settings (if needed)

## Run the container
`make start` will download and build the Docker image and then start the container. It will automatically find all `cv.tex` and `letter.tex` files located in the correct folders (respectively `./src/cv/lang/<lang>/cv.tex` and `./src/letter/lang/<lang>/letter.tex`), compile them to generate the pdf files and watch them, so they will be automatically recompiled on update.


## Usefull commands
- `make clean`: delete all LaTeX files generated during compilation
- `make clean-pdf`: delete all generated pdf files
- `make clean-all`: delete all generated pdf and LaTex files
- `make add-lang LANG=<lang>`: automatically creates a CV and a cover letter based on the templates cv and cover later and watch the new added `cv.tex` and `letter.tex` files, so they will be recompiled automatically on update. `make add-cv LANG=<lang>` or `make add-letter LANG=<lang>` can be used to to only add a cv or a cover letter.
- `make remove-lang LANG=<lang>` to delete the CV and cover letter based on the lang (it will delete the relevent folders)


# Structure
The project is structured to minimise duplicated code with several CVs (or cover letters) with different languages, so each newly addedd CV (with a new language) will not generate duplicated code.

```
📦 src
 ┣ 📂 common -- All things common for CVs and cover letters
 ┃ ┣ 📂 sections
 ┃ ┃ ┗ 📜 header.tex -- Basic info (name, address, email ...)
 ┃ ┗ 📂 style
 ┃ ┃ ┣ 📜 spacing.tex -- Defines LaTeX commands for spacing
 ┃ ┃ ┗ 📜 symbol.tex -- Defines LaTeX commands and overrides for style and icons
 ┣ 📂 cv
 ┃ ┣ 📂 common
 ┃ ┃ ┣ 📜 cv_common_main.tex -- File to be included in each localised CV
 ┃ ┃ ┣ 📜 cv_override.tex -- Defines LaTeX commands and overrides for style and icons for CVs
 ┃ ┃ ┗ 📜 package.tex -- Centralised places for all CV import
 ┃ ┣ 📂 lang
 ┃ ┃ ┣ 📂 <lang>
 ┃ ┃ ┃ ┣ 📂 sections -- Contains CV sub sections to be included in the cv.tex file
 ┃ ┃ ┃ ┃ ┗ 📜 [...]
 ┃ ┃ ┃ ┗ 📜 cv.tex -- Main CV LaTeX file 
 ┣ 📂 letter
 ┃ ┣ 📂 common
 ┃ ┃ ┣ 📜 letter_common_main.tex -- File to be included in each localised cover letter
 ┃ ┃ ┣ 📜 letter_override.tex -- Defines LaTeX commands and overrides for style for cover letters
 ┃ ┃ ┗ 📜 package.tex -- Centralised places for all cover letter import
 ┃ ┗ 📂 lang
 ┃ ┃ ┣ 📂 <lang>
 ┃ ┃ ┃ ┗ 📜 letter.tex -- Main cover letter LaTeX file 
 ┣ 📂 template -- Base template files used when adding a new localised CV / cover letter
 ┃ ┣ 📂 cv
 ┃ ┃ ┣ 📂 sections
 ┃ ┃ ┃ ┣ 📜 [...]
 ┃ ┃ ┗ 📜 cv.tex
 ┃ ┣ 📂 letter
 ┃ ┃ ┗ 📜 letter.tex
```

# Write CV and cover letter

Documentation for moderncv can be found online: https://ctan.org/pkg/moderncv. 

However some commands were overridden (to match my personal preference) and new commands were added in this repository. 

Comments were added in order to give more context and information about new or overridden commands.

# Usefull resources
- https://ctan.org/pkg/moderncv 
- https://mg.readthedocs.io/latexmk.html
