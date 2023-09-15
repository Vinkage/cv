\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[Sept 2023 custom cv class]
\RequirePackage{titlesec}
\RequirePackage{tabularx}
\RequirePackage{pgffor}
\RequirePackage{pbox}
\RequirePackage{geometry}

% lengths and orientation
\setlength{\parindent}{0ex} % Remove indent
\setlength{\parskip}{0ex}
\geometry{letterpaper, portrait, margin=1in}

\titleformat{\section}
{\Large\scshape\raggedright}
{}{0em}
{}
[\titlerule]

\titlespacing*{\section}{0pt}{1.6ex}{2.5ex}

\titleformat{\subsection}
{\large\bfseries\raggedright}
{}{0em}
{}

\newcommand{\contact}[5]{
  #1\newline
  #2\newline
  #3\newline
  \href{mailto:#4}{#4}\newline
  \href{https://#5}{#5}
}

\newcommand{\experience}[5]{
  #1 #2, #3, #4,
  \begin{itemize}
    #5
  \end{itemize}
}

\newcommand{\talk}[4]{
  \textit{#1}. #2, #3, #4.
}

% Command to produce a paper:
%	#1 (optional) joint authors
% #2 title
%	#3 status - in preparation, submitted, accepted by..., to appear in..., etc.
%	#4 Anything else, e.g. links
\newcommand{\paper}[4][\@nil]{%
  \def\tmp{#1}%

  \ifx\tmp\@nnil
    \textbf{#2}. #3. #4
  \else
    \textbf{#2} (joint with #1). #3. #4
  \fi
}
