# Frequently asked questions

## My bibliography is not rendering how I want.

You can not call biblatex the normal way, you have to pass options to it before
calling `\documentclass`[^1]. For example, if you would normally call biblatex
like this:
```latex
\usepackage[maxbibnames=999,url=true]{biblatex}
```
you should instead call it like this:
```latex
\PassOptionsToPackage{maxbibnames=999,url=true}{biblatex}
\documentclass{uithesis}
```

## Can I change the margins?
Sure! Just consult the requirements and keep in mind that long lines of text are
harder to read.

> Experiments have shown that the number of characters in a line of single
> column text on a page should be in the range 60 to 70 for ease of reading.
> The range may be as much as 45 to 75 characters but 66 characters is often
> considered to be the ideal number. Much shorter and the eye is dashing back
> and forth between each line. Much longer and it is hard to pick up the start
> of the next line if the eye has to jump back too far — the same line may be
> read twice or the following line may be inadvertently jumped over.
>
> Peter Wilson (The Memoir Class)

At the end of the day it's your thesis however; add the lines:
```latex
\setlrmarginsandblock{1in}{1in}{*}
\checkandfixthelayout 
```
in the preamble (before `\begin{document}`) your thesis will have 1in margins.
Change 1in to your preferred margins.

## Sublime text is not rendering the bibliography

This does not work out of the box for some reason on windows. It appears that
sublime's LaTeXTools plugin does not support biber out of the box when using
miktex. The following steps help rectify the problem.
1. Ensure biber and latexmk are installed with the [miktex console](https://miktex.org/howto/miktex-console)
2. Install [strawberry perl](https://strawberryperl.com/) (May I suggest using something like [scoop](https://scoop.sh/))
3. In sublime text go to `Preferences > Package Settings > LaTeXTools >
   Settings -- User` there should be a line which says `"builder": "something
   or other"` change that line to say `"builder": "basic"` then change
   `"distro": "whatever"` to say `"distro": "texlive"`
If this doesn't work feel free to open an issue.

## My subsections aren't being numbered

By default the template stops numbering at sections, you can change this with
`\setsecnumdepth` for example:
```latex
% number subsections
\setsecnumdepth{subsection}
% number subsubsections
\setsecnumdepth{subsubsection}
% stop numbering at chapters
\setsecnumdepth{chapter}

[^1]: Due to the thesis requirements we have to import biblatex to fix the
    spacing to be single space while the rest of the document is double spaced.
    This causes issues if you try to import the package later as you can only
    import each package once in latex.
