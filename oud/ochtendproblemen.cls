% ochtendproblemen class voor Vierkant voor Wiskunde
% Copyright 2002-2005: M.P. Alberts, M. Hendriks,
%                      J.C.C. Langeveld, W.J. Palenstijn.
% Voor commentaar of vragen: latex@vierkantvoorwiskunde.nl

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ochtendproblemen}%
              [2005/06/05 Vierkant voor Wiskunde ochtendproblemen class]

\LoadClass[12pt,a4paper]{article}

\RequirePackage{a4wide}
\RequirePackage[T1]{fontenc} % Het font instellen
\RequirePackage{amssymb} % (met extra symbolen)
\RequirePackage{mathptmx} % op Times-New Roman
\RequirePackage[dutch]{babel}
\RequirePackage{multirow}
\RequirePackage{graphicx}

\setlength{\parskip}{\baselineskip}
\setlength{\parindent}{0pt}

\pagestyle{empty}

\newcommand{\ochtendproblemen}[3]{%
\begin{center}
\begin{tabular}{ccc}
\multirow{3}{15mm}{\resizebox{15mm}{!}{\includegraphics{vierkantlogo}}} &
\hphantom{blablablabla} Vierkant voor Wiskunde \hphantom{blablablabla} &
\multirow{3}{15mm}{\resizebox{15mm}{!}{\includegraphics{vierkantlogo}}} \\
&  & \\
& Zomerkamp #2, #1, Ochtendproblemen & \\
\end{tabular}
\end{center}

\vspace{5mm}

\begin{center}
\begin{Huge}
#3
\end{Huge}
\end{center}
\hrule
\vspace{5mm}
}
