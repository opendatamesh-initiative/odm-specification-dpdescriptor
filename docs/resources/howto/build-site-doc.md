# How to build this site

This site is made with <a href="https://www.mkdocs.org/" target="_blank">MkDocs:octicons-link-external-24:</a> and in particular with its extension <a href="https://squidfunk.github.io/mkdocs-material/" target="_blank">Material for MkDocs:octicons-link-external-24:</a>.

Both are great tools that build a static site starting from simple markdown documentation.

They provide many amazing features, perfectly documented in their websites, with step-by-step tutorials to create a new site from scratch.

However, we would like to explain here all the prerequisites needed to build this very site and an overview of the principal customizations implemented.

## Setup

The first thing to do in order to be able to build this site is to install <a href="https://squidfunk.github.io/mkdocs-material/" target="_blank">Material for MkDocs:octicons-link-external-24:</a>, it will also install all dependencies: <a href="https://www.mkdocs.org/" target="_blank">MkDocs:octicons-link-external-24:</a>, <a href="https://python-markdown.github.io/" target="_blank">Markdown:octicons-link-external-24:</a>, <a href="https://pygments.org/" target="_blank">Pygments:octicons-link-external-24:</a> and <a href="https://facelessuser.github.io/pymdown-extensions/" target="_blank">Python Markdown Extensions:octicons-link-external-24:</a>.:

```shell
pip install mkdocs-material
```

In order to add the date of the last update and creation of a document at the bottom of each page, we enabled the git-revision-date-localized plugin, which can be installed with pip:

```shell
pip install mkdocs-git-revision-date-localized-plugin
```

Finally, two Python libraries must be installed to generate the social preview images, both of which are based on <a href="https://www.cairographics.org/" target="_blank">Cairo Graphics:octicons-link-external-24:</a> – <a href="https://pillow.readthedocs.io/" target="_blank">Pillow:octicons-link-external-24:</a> and <a href="https://cairosvg.org/" target="_blank">CairoSVG:octicons-link-external-24:</a>.

Install `pillow` and `cairosvg` with pip:

```shell
pip install pillow cairosvg
```

Install the other dependencies depending on your system:


=== ":material-linux: Linux"

    There are several package managers for Linux with varying availability per
    distribution.

    === ":material-ubuntu: Ubuntu"

        ```
        apt-get install libcairo2-dev libfreetype6-dev libffi-dev libjpeg-dev libpng-dev libz-dev
        ```

    === ":material-fedora: Fedora"

        ```
        yum install cairo-devel freetype-devel libffi-devel libjpeg-devel libpng-devel zlib-devel
        ```

    === ":fontawesome-brands-suse: openSUSE"

        ```
        zypper install cairo-devel freetype-devel libffi-devel libjpeg-devel libpng-devel zlib-devel
        ```

=== ":fontawesome-brands-windows: Windows"

    The easiest way to get up and running
    with the Cairo Graphics library on Windows is by installing [GTK+] since
    it has Cairo as a dependency. You can also download and install a
    precompiled [GTK runtime].

=== ":material-apple: macOS"

    Make sure [Homebrew] is installed, which is a modern package manager for
    macOS. Next, use the following command to install all necessary
    dependencies.

    ```
    brew install cairo freetype libffi libjpeg libpng zlib
    ```
  [Homebrew]: https://brew.sh/
  [GTK+]: https://www.gtk.org/docs/installations/windows/
  [GTK runtime]: https://github.com/tschoonj/GTK-for-Windows-Runtime-Environment-Installer/releases

!!! tip 

    If you are on Ubuntu you can directly launch the `setup.sh` script located in `script` folder!

    It contains all the previously described steps.

## Building

In order to build the site, the following command must be launched in the root directory:

```shell
mkdocs build
```

It is not necessary to explicitly build the site before serving or publishing but it can be useful to inspect the `site` folder it creates to verify resource paths.

It is also useful for sites published without the aid of <a href="https://pages.github.com/" target="_blank">GitHub Pages:octicons-link-external-24:</a> since the `site` folder is the deployment unit.

## Serving

In order to locally test the site it is possible to launch the following command in the root directory:

```shell
mkdocs serve
```

The site will be hosted at the address configured in `mkdcos.yml` and almost any change in the `docs` folder will trigger an automatic republish.

## Publishing

If the site is published through <a href="https://pages.github.com/" target="_blank">GitHub Pages:octicons-link-external-24:</a>, as it is in our case, it can be easily deployed with a single command:

```shell
mkdocs gh-deploy --force
```
The site will soon appear at '<username>.github.io/<repository>'.

If you wish to publish the site using GitHub pages but on a custom domain, <a href="https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site" target="_blank">this guide:octicons-link-external-24:</a> contains all the available possibilities.

If you don't want to use GitHub pages, you can always build your site as explained before and upload the content of the `site` folder to your hosting provider.

## Notable Configurations and Customizations

### mkdocs.yml

Most of the configurations reside in the `mkdcos.yml` file, located in the root folder.

The `site_*` and `repo` properties configure website and repository locations and meta tags for the website.

The `nav` section defines the structure of the site and the location of each markdown document published.

The `theme`, `markdown_extensions` and `plugins` sections contain all the Material for MkDocs configurations currently used and the extensions required to make them work.

The `analytics` and `consent` sections configure the usage of Google Analytics and govern cookie consent.

The `social` and `copyright` sections define the content of the footer, copyright and social icons.

### extra.css

The few CSS customizations we use can be found in `docs>stylesheets>extra.css`.

It contains the color palette we picked and a slight increase in the width of the pages.

### home.html

The homepage is written directly in HTML since we wanted it to be different from the rest of the site.

It can be found in `docs>override` and has its own customized style embedded.

