% ``notulen'' class voor Vierkant voor Wiskunde
% Copyright 2002-2003: M.P. Alberts, M. Hendriks,
%                      J.C.C. Langeveld, W.J. Palenstijn.
% Voor commentaar of vragen: latex@vierkantvoorwiskunde.nl

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Notulen}%
              [2003/02/19 Vierkant voor Wiskunde notulen class]

\LoadClass[11pt,a4paper]{article}

\RequirePackage{a4wide}
\RequirePackage[T1]{fontenc} % Het font instellen
\RequirePackage{amssymb} % (met extra symbolen)
\RequirePackage{mathptmx} % op Times-New Roman
\RequirePackage[dutch]{babel}
\RequirePackage{multirow}
\RequirePackage{graphicx}
\RequirePackage{tabularx}


\setlength{\parskip}{\baselineskip}
\setlength{\parindent}{0pt}

\pagestyle{empty}

\newcommand{\notulen}[4]{
\newcolumntype{C}{>{\centering}X}
\begin{tabularx}{\textwidth}{lCr}
\multirow{3}{15mm}{\resizebox{15mm}{!}{\includegraphics{vierkantlogo}}} & 
Notulen Vierkant voor Wiskunde Zomerkamp #2 #1 &
\multirow{3}{15mm}{\resizebox{15mm}{!}{\includegraphics{vierkantlogo}}} \\
& & \\
& #3 in #4 & \\
\end{tabularx}
\vspace{5mm}
\hrule
\vspace{5mm}
} 