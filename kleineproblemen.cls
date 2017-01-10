% kleineproblemen class voor Vierkant voor Wiskunde
% Copyright 2002-2005: M.P. Alberts, M. Hendriks,
%                      J.C.C. Langeveld, W.J. Palenstijn.
% Voor commentaar of vragen: latex@vierkantvoorwiskunde.nl

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{kleineproblemen}
              [2011/12/31 Vierkant voor Wiskunde kleineproblemen class]

\LoadClass[12pt,a4paper]{article}

\RequirePackage{a4wide}
\RequirePackage[T1]{fontenc} % Het font instellen
\RequirePackage{amssymb} % (met extra symbolen)
\RequirePackage{mathptmx} % op Times-New Roman
\RequirePackage[dutch]{babel}
\RequirePackage{multirow}
\RequirePackage{graphicx}
\RequirePackage{opgave}
\RequirePackage{tabularx}

\setlength{\parskip}{\baselineskip}
\setlength{\parindent}{0pt}

\pagestyle{empty}

\newcolumntype{C}{>{\centering}X}

\newcommand{\problemenAlgemeen}[2]{%
\clearpage \ifodd\c@page\else\hbox{}\newpage\fi %unconditional cleardoublepage
\begin{tabularx}{\textwidth}{lCr}
\multirow{3}{15mm}{\resizebox{15mm}{!}{\includegraphics{vierkantlogo}}} &
Vierkant voor Wiskunde &
\multirow{3}{15mm}{\resizebox{15mm}{!}{\includegraphics{vierkantlogo}}} \\
&  & \\
& #1 & \\
\end{tabularx}

\vspace{5mm}

\begin{center}
\begin{Huge}
#2
\end{Huge}
\end{center}
\hrule
\vspace{5mm}
}

\newcommand{\@kamp}{}
\newcommand{\kamp}[1]{\renewcommand{\@kamp}{#1}}

\newcommand{\kleineproblemen}[1]{%
\problemenAlgemeen{Zomerkamp \@kamp, kleine problemen}{#1}%
\renewcommand{\Currentlabel}{#1.\arabic{opgaveteller}}%
\setcounter{opgaveteller}{0}%
}

\renewcommand{\toonantwoorden}{%
\Closesolutionfile{antwoordfile}%
\if@antwoorden%
 \if@antwoordengebruikt%
  \problemenAlgemeen{Zomerkamp \@kamp, kleine problemen}{Uitwerkingen}%
  \input{vk_antwoorden}%
 \fi%
\fi%
}

\startantwoorden
