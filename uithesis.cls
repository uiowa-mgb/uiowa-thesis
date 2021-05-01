\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uithesis}[2021/04/30]

\RequirePackage{etoolbox}

\LoadClass[openany]{memoir}

% Fix the numbering of the front matter (start from page ii)
\let\old@frontmatter\frontmatter
\renewcommand*{\frontmatter}{%
\old@frontmatter
\addtocounter{page}{1}
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
}
