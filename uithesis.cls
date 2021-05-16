\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uithesis}[2021/04/30]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions
\LoadClass{memoir}
\pagestyle{plain}
\OnehalfSpacing

\RequirePackage{etoolbox}
\RequirePackage{biblatex}

% Fix the numbering of the front matter (start from page ii)
\let\old@frontmatter\frontmatter
\renewcommand*{\frontmatter}{%
\old@frontmatter
\addtocounter{page}{1}
}

% The Abstract should be on its own page
\let\old@abstract\abstract
\let\old@endabstract\endabstract
\renewenvironment{abstract}
  {\clearpage\old@abstract}
  {\old@endabstract\clearpage}

\newenvironment{publicAbstract}
  {
    \renewcommand{\abstractname}{Public Abstract}
    \begin{abstract}
  }
  {\end{abstract}\clearpage}

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

\titlingpageend{\clearforchapter}{\clearforchapter}

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
  Doctor of Philosophy\\[0\baselineskip]
  in Applied Mathematics \& Computational Sciences}\\[2.5\baselineskip]
  \thedate\\[2.5\baselineskip]
  \par

  % Including committee members
  \renewcommand*{\do}[1]{& ##1\\[0\baselineskip]}
  \begin{tabular}{r l}
    Thesis Committee:{} \dolistloop{\thecommittee}
  \end{tabular}

\end{titlingpage}%
}

% List of Figures should be on a new page
\let\old@listoffigures\listoffigures
\renewcommand{\listoffigures}{\clearpage\old@listoffigures}

% For some reason the bibliography has to be single spaced
\let\old@printbibliography\printbibliography
\renewcommand{\printbibliography}{\SingleSpacing\old@printbibliography}

\newcommand{\acknowledgments}
  {
    \clearpage
    {
      % This weirdness enforces that the first paragraph is indented
      % as per the requirments.
      \chapter*{Acknowledgments}
      \par
    }
  }

\newcommand{\iowaEpigraph}[2]{
    \clearpage
    \vspace*{\fill}
      \SingleSpacing
      \noindent{}#1

    \hfill-- #2
    \vspace*{\fill}
  }
