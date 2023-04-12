# Frequently asked questions

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

## How do I change the settings for biblatex?

These need to be changed before calling `\documentclass`. This is done like
this:
```latex
\PassOptionsToPackage{maxbibnames=999,url=true}{biblatex}
\documentclass{uithesis}
```

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
