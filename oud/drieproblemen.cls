% ``3 problemen'' class voor Vierkant voor Wiskunde
% Copyright 2002-2003: M.P. Alberts, M. Hendriks,
%                      J.C.C. Langeveld, W.J. Palenstijn.
% Voor commentaar of vragen: latex@vierkantvoorwiskunde.nl

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{drieproblemen}%
              [2003/02/19 Vierkant voor Wiskunde drie problemen class]

\LoadClass[11pt,a4paper]{article}

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

\newcommand{\drieproblemen}[3]{%
\begin{center}
\begin{tabular}{ccc}
\multirow{3}{15mm}{\resizebox{15mm}{!}{\includegraphics{vierkantlogo}}} &
\hphantom{blablablabla} Vierkant voor Wiskunde \hphantom{blablablabla} &
\multirow{3}{15mm}{\resizebox{15mm}{!}{\includegraphics{vierkantlogo}}} \\
&  & \\
& Zomerkamp #2, #1, Drie problemen & \\
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
