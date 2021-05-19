\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uithesis}[2021/04/30]

\RequirePackage{etoolbox}

% Check if the user specified a sidedness
\newtoggle{sidespecified}
\DeclareOption{oneside}{
  \toggletrue{sidespecified}
  \PassOptionsToClass{oneside}{memoir}
}
\DeclareOption{twoside}{
  \toggletrue{sidespecified}
  \PassOptionsToClass{twoside}{memoir}
}

% Check if the used specified a side to open
\newtoggle{openspecified}
\DeclareOption{openany}{
  \toggletrue{openspecified}
  \PassOptionsToClass{openany}{memoir}
}
\DeclareOption{openright}{
  \toggletrue{openspecified}
  \PassOptionsToClass{openright}{memoir}
}
\DeclareOption{openleft}{
  \toggletrue{openspecified}
  \PassOptionsToClass{openleft}{memoir}
}

% Pass everything else to memoir
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions

% If no sidedness was specified, default to oneside
\iftoggle{sidespecified}
  {}
  {\PassOptionsToClass{oneside}{memoir}}

% If no openside was specified, default to openany
\iftoggle{openspecified}
  {}
  {\PassOptionsToClass{openany}{memoir}}

\LoadClass{memoir}
\pagestyle{plain}
\OnehalfSpacing

\RequirePackage{biblatex}

% Defining a new chapter style 
\makechapterstyle{uichapters}{%
  \chapterstyle{thatcher}
  \renewcommand*{\chapnumfont}{\normalfont\scshape}
  \renewcommand*{\chaptitlefont}{\normalfont\bfseries}
}
\chapterstyle{uichapters}

% Don't want to include this in the chapter style, 
% because then it makes it much harder to change later. 
% But the default section header is too big to leave this out entirely.
\setsecheadstyle{\normalfont\bfseries}

% Fix the numbering of the front matter (start from page ii)
\let\old@frontmatter\frontmatter
\renewcommand*{\frontmatter}{%
\old@frontmatter
\addtocounter{page}{1}
}

% The abstract is: on it's own page, double spaced, and indents every paragraph
\renewenvironment{abstract}
  {
    \clearpage
    {
      \chapter*{Abstract}
      \par
    }
    \DoubleSpacing
  }
  {\clearpage}

\newenvironment{publicAbstract}
  {
    \clearpage
    {
      \chapter*{Public Abstract}
      \par
    }
    \DoubleSpacing
  }
  {\clearpage}

% A copyright page---centered, no page numbering
\newcommand{\copyrightPage}
  {
    \thispagestyle{empty}
    \begin{center}
    \vspace*{\fill}
    Copyright \copyright{} \the\year{}\\[0\baselineskip]
    \theauthor \\[0\baselineskip]
    All Rights Reserved
    \vspace*{\fill}
    \end{center}
  }

% Code to handle the committee
% The Committee is an etoolbox list
% ThesisSupervisor adds to the list while appending "Thesis Supervisor"
% CommitteeMember adds to the list
\newcommand{\thecommittee}{}
\newcommand{\ThesisSupervisor}[1]{\listadd{\thecommittee}{#1, Thesis Supervisor}}
\newcommand{\CommitteeMember}[1]{\listadd{\thecommittee}{#1}}

% Title page stuff

\newcommand{\thedegree}{\PackageError{uithesis}{Degree not specified}{Need to define the degree with \\degree}}
\newcommand{\theconcentration}{\PackageError{uithesis}{Concentration not specified}{Need to define the concentration with \\concentration}}

\newcommand{\degree}[1]{\def\thedegree{#1}}
\newcommand{\concentration}[1]{\def\theconcentration{#1}}

\newcommand{\titlepage}{%
\begin{titlingpage}
  \centering
  { \Huge \textsc{\thetitle} } 
  \par
  \vspace{\fill}
  {by}\\[0.6\baselineskip]{\theauthor\vspace{\fill}\\[0\baselineskip]
  A Thesis Submitted to the Graduate Faculty\\[0\baselineskip]
  of The University of Iowa in Partial Fulfillment\\[0\baselineskip]
  of the Requirements for the Degree of\\[0\baselineskip]
  \thedegree\\[0\baselineskip]
  in \theconcentration}\\[2.5\baselineskip]
  \thedate\\[2.5\baselineskip]
  \par

  % Including committee members
  \renewcommand*{\do}[1]{& ##1\\[0\baselineskip]}
  \begin{tabular}{r l}
    Thesis Committee:{} \dolistloop{\thecommittee}
  \end{tabular}

\end{titlingpage}%
}

\titlingpageend{\clearforchapter}{\clearforchapter}

% Enforce that the t.o.c. is not in the t.o.c.
\let\old@tableofcontents\tableofcontents
\renewcommand{\tableofcontents}{\old@tableofcontents*}

% List of Figures should be on a new page
\let\old@listoffigures\listoffigures
\renewcommand{\listoffigures}{\clearpage\old@listoffigures}

% For some reason the bibliography has to be single spaced
\let\old@printbibliography\printbibliography
\renewcommand{\printbibliography}{\SingleSpacing\old@printbibliography}

\newenvironment{acknowledgments}
  {
    \clearpage
    {
      \chapter*{Acknowledgments}
      \par
    }
    \DoubleSpacing
  }
  {\clearpage}

\newcommand{\iowaEpigraph}[2]{
    \clearpage
    \vspace*{\fill}
      \SingleSpacing
      \noindent{}#1

    \hfill-- #2
    \vspace*{\fill}
  }



