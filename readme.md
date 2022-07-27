# UIowa Thesis Class

A modern LaTeX class file for typesetting a thesis at the University of Iowa.
There is an [overleaf
template](https://www.overleaf.com/latex/templates/uiowa-thesis/nspcwqkmvcnq)
alternatively see [the release
page](https://github.com/uiowa-mgb/uiowa-thesis/releases) to download a working
example to base your thesis on. If you have any questions the [faq](faq.md) may
contain the answer you are looking for.

The example thesis was looked over by the graduate college and appears to meet
all the requirements. If when submitting your thesis there is something wrong
feel free to [open an
issue](https://github.com/uiowa-mgb/uiowa-thesis/issues/new) (or even better
submit a pull request) so we can fix the class for future students.

## About

The goal of this package is to implement the bare minimum needed to typeset a
thesis at the university of Iowa. In theory, you should be able to just
`\documentclass{uiowa-thesis}` and carry on as if you were writing any other TeX
document. We follow the requirements outlined
[here](https://grad.uiowa.edu/academics/thesis-and-dissertation/preparing-formatting)
([archived link](https://web.archive.org/web/20210518195321/https://grad.uiowa.edu/academics/thesis-and-dissertation/preparing-formatting)).
It aims to be minimal in both features it supplies and code it takes to do so.
To this end we build on the [`memoir`](https://www.ctan.org/pkg/memoir) document
class: it is highly customizable, has a track record of being used to implement
theses, and emulates many of the popular packages we would otherwise need to
pull in to make this all work. On top of that we did need to import two other
packages: [`etoolbox`](https://www.ctan.org/pkg/etoolbox), to process lists
for the committee, and [`biblatex`](https://www.ctan.org/pkg/biblatex) as we
need to hijack the definition of the bibliography to fix the spacing of the
bibliography. (Because for *some* reason the bibliography is the only thing to
be typeset single spaced) Other than that we do not pull in any packages.

If you wish to help out or just play with the codebase please see
[the development notes](#development-notes) for what's what.

## Other templates
There is at least one other thesis template maintained by the CS department
[here](https://github.com/qianjzhang/Uiowa-Thesis-Template).

## Implemented

We have not implemented all the optional pages. If you implement one for your
thesis that feel free to open an issue or send a pull request, we would love to
add it. For now here's a list of everything we have implemented:

- Page Numbering (Required)
  - [x] Preliminary page numbers begin with a lower-case Roman numeral ii on
        the first page following the Title Page, or the Copyright Page should
        you choose to include one.  Center these page numbers in the footer,
        ½ to 1 inch above the bottom of the page.
  - [x] Manuscript text page numbers must be in Arabic with a 1 on the first
        page of your first chapter. They may be located in the upper or lower
        right-hand corner or the bottom center of the page and must be
        consistent throughout the manuscript.
- Title Page (Required)
  - [x] List your degree as it appears on MyUI. If you have an official
        sub-track, you may include it in parentheses after your degree.
  - [x] List the correct month and year of your graduation.
  - [x] List the names of your committee members.  Your thesis supervisor
        should be listed first, followed by a comma and the phrase “Thesis
        Supervisor.”
  - [x] There is no page number on the Title Page
- Abstracts (Required)
  - [x] Text should be top-aligned, double-spaced, and with each paragraph
        indented.
  - [x] These pages require lower-case Roman numeral page numbers, at the
        bottom center of the page.
- Bibliography (Required)
  - [x] The References heading should be treated as a major heading and
        included in the Table of Contents.
  - [x] References should be single-spaced, and indenting conventions should be
        consistent.
  - [x] There may be a single- or double-space between entries.
  - [x] References may be placed at the end of each chapter or at the end of
        the manuscript.
  - [ ] Entries should not break across a page. Pretty sure this won't happen,
        but I haven't been able to confirm.
- Margins (Required)
  - [x] Margins must be a minimum of 1 inch on all sides and on all pages,
        including the Preliminary Pages.
  - [x] Margins should be consistent throughout the entire text.
- Line spacing (Required)
  - [x] Line spacing may be either 1.5 or double-spaced. Line spacing should be
        consistent throughout.
- Font Size (Required)
  - [x] Use 10–12-point font for the body of the manuscript.  Font smaller
        than 8-point is not allowed.
  - [x] You may use 12-point font for major headings.  Font larger than this
        may be used sparingly, if at all.
  - [x] A range of font styles is acceptable, but font styles and sizes should
        be professional in appearance.
- Copyright Page (Optional)
  - [x] The copyright date is the year of graduation. (Technically we do the
        year in which the document was prepared)
  - [x] There is no page number on the Copyright Page.
- Epigraph (Optional)
  - [x] Text should be single-spaced and centered on the page, both
        horizontally and vertically.
  - [x] This page requires a lower-case Roman numeral page number, at the 
        bottom center of the page.
- Acknowledgments (Optional)
  - [x] Text should be top-aligned, double-spaced, and with each paragraph
        indented.
  - [x] This page requires a lower-case Roman numeral page number, at the
        bottom center of the page.
- Appendices (Optional)
  - [x] Treat Appendix headings (Appendix A, B, etc.) as major headings and
        include them in the Table of Contents.
  - [x] If more than one Appendix is included, identify them as Appendix A,
        Appendix B, and so on. Lettering is unnecessary when there is only one
        Appendix.

## Development Notes

The repo is structured to be relatively easy to build on a standard Linux
installation. Running `make help` shows what the build targets do. To run
everything the following is required:
- scons
- biber
- inotifytools (only for `make watch`)
