# UIowa Thesis Class

An attempt at defining a modern LaTeX class file which satisfies the requirements
laid out by the University of Iowa [here](https://grad.uiowa.edu/academics/thesis-and-dissertation/preparing-formatting)

I believe we may already meet all the requirments. Currently things have been 
kind of slapped together to make it work so things may not look the best and the
optional sections are currently not implemented.

## About
The goal of this pacakge is to implement the bare minimum needed to typeset a 
thesis at the university of Iowa. It aims to be minimal in both features it
supplies and code it takes to do so. To this end we build on the `memoir`
document class as it is highly customizable, has a track record of being used to
implement theses, and emulates many of the popular packages we would otherwise
need to pull in to make this all work. On top of that we did need to import two
other packages: etoolbox, to do list processing for the committee, and biblatex
as we need to hijack the definition of the bibliography to fix the spacing of
the bibliography. (Because for *some* reason the bibliography is the only thing
to be typeset single spaced) Other than that we do not pull in any packages.

## Building
On the dev branch I include a buildscript to build the example document. On 
linux all one needs installed is `scons`, `make`, and `biber`. To use `make
watch` it is also required that you have `inotifytools` installed.

## TODO
- [x] Clean up the title page
- [ ] Implement a more complete example thesis
- [ ] Check with Erin if this is good
- [ ] Implement optional pages
  - [x] Copyright
  - [ ] Epigraph
  - [x] Acknowledgments
  - [ ] List of symbols
  - [ ] List of abbreviations
  - [ ] Preface

## Requirements

### Page Numbering (Required)
- [x] Preliminary page numbers begin with a lower-case Roman numeral ii on the first page following the Title Page, or the Copyright Page should you choose to include one.  Center these page numbers in the footer, 1/2 to 1 inch above the bottom of the page.
- [x] Manuscript text page numbers must be in Arabic with a 1 on the first page of your first chapter. They may be located in the upper or lower right-hand corner or the bottom center of the page and must be consistent throughout the manuscript.

### Title Page (Required)
- [x] List your degree as it appears on MyUI.  If you have an official sub-track, you may include it in parentheses after your degree.
- [x] List the correct month and year of your graduation.
- [x] List the names of your committee members.  Your thesis supervisor should be listed first, followed by a comma and the phrase “Thesis Supervisor.”
- [x] There is no page number on the Title Page

### Abstracts (Required)
- [x] Text should be top-aligned, double-spaced, and with each paragraph indented.
- [x] These pages require lower-case Roman numeral page numbers, at the bottom center of the page.

### Bibliography (Required)
- [x] The References heading should be treated as a major heading and included in the Table of Contents.
- [x] References should be single-spaced, and indenting conventions should be consistent.
- [x] There may be a single- or double-space between entries.
- [x] References may be placed at the end of each chapter or at the end of the manuscript.
- [ ] Entries should not break across a page.

### Margins (Required)
- [x] Margins must be a minimum of 1 inch on all sides and on all pages, including the Preliminary Pages.
- [?] Margins should be consistent throughout the entire text. (It is currenlty unclear to me if this allows for alternating margins)

### Linespacing (Required)
- [x] Line spacing may be either 1.5 or double-spaced. Line spacing should be consistent throughout.

### Font Size (Required)
- [x] Use 10–12-point font for the body of the manuscript.  Font smaller than 8-point is not allowed.
- [x] You may use 12-point font for major headings.  Font larger than this may be used sparingly, if at all. (Chapter headings are currenlty larger than 12pt, is that sparingly?)
- [x] A range of font styles is acceptable, but font styles and sizes should be professional in appearance.
