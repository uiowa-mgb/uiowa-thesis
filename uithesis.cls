\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uithesis}[2021/04/30]

\RequirePackage{etoolbox}

\LoadClass[openany]{memoir}


\newcommand{\thecommittee}{The Committee}
\newcommand{\committee}[1]{\renewcommand{\thecommittee}{#1}}

\titlingpageend{\clearforchapter}{\clearforchapter}

\newcommand{\committeelist}{
}

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
   \expandafter\docsvlist{\thecommittee}
  \end{itemize}
\end{titlingpage}%
}
