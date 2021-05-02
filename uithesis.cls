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
  \large
  \par
  \vspace{0.6\baselineskip}
  {By}\\[0.6\baselineskip]{\theauthor\\[0.6\baselineskip]
  A Thesis Submitted to the Graduate\\[0.5\baselineskip]
  Faculty of The University of Iowa\\[0.5\baselineskip]
  in Partial Fulfillment of the\\[0.5\baselineskip]
  Requirements for the Degree of\\[0.5\baselineskip]Doctor of Philosophy\\[0.5\baselineskip]
  in Applied Mathematics}\\[0.5\baselineskip]
  \thedate
  \par

  \flushleft
  Thesis Committee:
  \begin{itemize}
    \renewcommand*{\do}[1]{\item ##1}
    \dolistloop{\thecommittee}
  \end{itemize}
\end{titlingpage}%

% List of Figures should be on a new page
\let\old@listoffigures\listoffigures
\renewcommand{\listoffigures}{\clearpage\old@listoffigures}
}

% For some reason the bibliography has to be single spaced
\let\old@printbibliography\printbibliography
\renewcommand{\printbibliography}{\SingleSpacing\old@printbibliography}
