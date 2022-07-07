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
