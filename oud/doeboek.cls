% Doeboek-class voor Doeboeken van Vierkant voor Wiskunde
% Copyright 2000-2006: M.P. Alberts, M. Hendriks,
%                      J.C.C. Langeveld, W.J. Palenstijn.
% Voor commentaar of vragen: latex@vierkantvoorwiskunde.nl

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{doeboek}[2006/01/25 Vierkant voor Wiskunde doeboek class]

% Overerven van class book. De optie openany zorgt dat hoofdstukken
% niet per se op de linker- of per se op de rechterpagina beginnen.
\LoadClass[twoside,12pt,openany,a4paper]{book}

\DeclareOption{beperklegenda}{}
\DeclareOption{geenantwoorden}{\PassOptionsToPackage{geenantwoorden}{opgave}}
\ProcessOptions\relax

% Laad een aantal pakketten.
\RequirePackage{a4wide}
\RequirePackage[T1]{fontenc} % Het font instellen
\RequirePackage{amssymb} % (met extra symbolen)
\RequirePackage{mathptmx} % op Times-New Roman
\RequirePackage[dutch]{babel}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx} % Voor het vierkantlogo (en andere PS-plaatjes).
\RequirePackage{fontsmpl}
\RequirePackage{font-streetplain} % Voor het 'street' font (titelpagina)
\RequirePackage{picinpar}
\RequirePackage{url}
\RequirePackage{opgave}

\newcommand{\auteur}[1]{\renewcommand{\getauteur}{#1}}
\newcommand{\setcopyright}[1]{\renewcommand{\getcopyright}{#1}}
\newcommand{\titel}[1]{\renewcommand{\gettitel}{#1}}
\newcommand{\nummer}[1]{\renewcommand{\getnummer}{#1}}
\newcommand{\illustrator}[1]{\renewcommand{\getillustrator}{#1}}
\newcommand{\illustratie}[1]{\renewcommand{\getillustratie}{#1}}
\newcommand{\getauteur}{Auteur}
\newcommand{\getcopyright}{Auteur}
\newcommand{\gettitel}{Titel}
\newcommand{\getnummer}{99}
\newcommand{\getillustrator}{Illustrator}
\newcommand{\getillustratie}{vierkantlogo}

\setlength{\parskip}{\baselineskip}
\setlength{\parindent}{0pt}

% Stel de paginastijl in voor gewone pagina's en eerste pagina's van
% een hoofdstuk.
\addtolength{\headheight}{7pt}
\fancypagestyle{vierkant}{%
\renewcommand{\headrulewidth}{0.4pt}
\fancyhead[LE,RO]{\bfseries\thepage}
\fancyhead[LO,RE]{\includegraphics[width=0.5cm]{vierkantlogo}}
\fancyhead[CO,CE]{\bfseries\leftmark}
\fancyfoot{}
}
\fancypagestyle{vierkanthoofdstuk}{%
\renewcommand{\headrulewidth}{0pt}
\fancyhead{}
\fancyfoot[CO,CE]{\bfseries\thepage}
}

% Het zetten van hoofdstuktitels willen we op onze eigen manier.
\renewcommand{\chapter}{%
   \setcounter{section}{0}%
   \newpage\thispagestyle{vierkanthoofdstuk}%
               \secdef\Chapter\sChapter}
\newcommand{\Chapter}[2][?]{%
   % als we appendixname eerder proberen te zetten wordt dit door babel gereset
   \renewcommand{\appendixname}{Appendix}%
   \refstepcounter{chapter}%
   \markboth{#1}{}%
   \addcontentsline{toc}{chapter}%
       {\protect\numberline{\thechapter}#1}%
   {\LARGE\bfseries\@chapapp\       \thechapter\par\vspace{0.5\baselineskip}%
               \fontsize{35}{35}\bfseries#2\par}%
   \vspace{\baselineskip}}%
\newcommand{\sChapter}[1]{%
   \markboth{#1}{}%
   {\LARGE\bfseries#1\par}%
   \vspace{\baselineskip}}

% De omgevingen voor stellingen, lemmas, aannames, definities,
% voorbeelden en bewijzen.
\newtheorem{stelling}{Stelling}[chapter]
\newtheorem{lemma}[stelling]{Lemma}
\newtheorem{aanname}[stelling]{Aanname}
\newtheorem{definitie}[stelling]{Definitie}
\newenvironment{voorbeeld}{\par\noindent\textbf{Voorbeeld.}%
\begingroup\upshape\rm}{\endgroup\par}
\newenvironment{bewijs}{\par\noindent\begingroup\rmfamily\upshape%
\textbf{Bewijs.}}{\ensuremath{\hfill\Box}\endgroup\par}

% Voorpagina
\newcommand{\voorpagina}{
\enlargethispage{4cm}
\pagestyle{empty}
% Eerst het gedraaide stuk tekst en het logo.
\begin{minipage}{20mm}
\begin{center}
\includegraphics[width=2cm]{vierkantlogo}
\rotatebox{90}{%\resizebox{237mm}{!}{
\fontsize{41}{41}\streetplainfamily%\selectfont
Vierkant voor Wiskunde -- doeboek \getnummer } %}
\end{center}
\end{minipage}
% Vervolgens de titel, de auteurs en de illustratie.
\begin{minipage}[c][\textheight][s]{164mm}
\begin{center}
\vspace*{2cm}
\fontsize{35}{30}\streetplainfamily%\selectfont
\gettitel\par
\vspace*{\stretch{1}}
\fontsize{24}{24}\streetplainfamily%\selectfont
\begin{tabular}{c}\getauteur\end{tabular}\par
\vspace*{\stretch{1}}
\mbox{\includegraphics[width=12cm]{\getillustratie}\hspace{10mm}}\par
\vspace*{\stretch{2}}
\fontsize{24}{24}\streetplainfamily%\selectfont
Doeboek voor jongeren
\vspace*{5mm}
\end{center}
\end{minipage}
\newpage
}

\newcommand{\CWIinfo}{
\vfill
\fontsize{12}{14.5}\selectfont
\begin{window}[0,l,\includegraphics[width=3cm]{cwilogo},{}]
Het Centrum voor Wiskunde en Informatica te Amsterdam is het natio\-nale
onderzoeksinstituut voor wiskunde en informatica in Nederland. Het CWI
doet op deze vakgebieden grensverleggend onderzoek. Ook draagt het nieuwe
kennis hiervan over naar de maatschappij, in het bijzonder naar het
bedrijfsleven en de industrie.\\
Het CWI sponsort de doeboeken van Vierkant voor Wiskunde.
\end{window}
\rule{\textwidth}{1pt}
Doeboek \getnummer: \gettitel
\hfill\copyright \getcopyright\\
Tekening omslag: \getillustrator
\hfill Hoofdredactie: Wim Berkelmans\\
Uitgever: Stichting Vierkant voor Wiskunde, Leiden\\
Gedrukt door: Centrum voor Wiskunde en Informatica, Amsterdam\\
\rule{\textwidth}{1pt}
\newpage
}

% De titelpagina.
\newcommand{\titelpagina}{
\begin{center}
\vspace{2cm}
{\fontsize{35}{35}\selectfont \textstreetplain{\gettitel}}\par
\vspace*{\stretch{1}}
{\fontsize{24.88}{24}\selectfont \textstreetplain{
\begin{tabular}{c}\getauteur\end{tabular}}}\par
\vspace*{\stretch{2}}
\includegraphics[width=2cm]{vierkantlogo}\par
\vspace{0.5cm}
\fontsize{20}{20}\selectfont
\textstreetplain{Stichting Vierkant voor Wiskunde}
\end{center}
\newpage
}

% Het stukje uitleg over tekens in de kantlijn.
\newcommand{\legenda}{%
\if@legenda
\section*{Uitleg van de gebruikte symbolen:}
In de kantlijn staat een aantal speciale symbolen. Deze hebben de
volgende betekenis:

\@legendasymbolen

\fi
} % Einde legenda


% Uitleg over Vierkant
\newcommand{\vierkantuitleg}{
\cleardoublepage
\pagestyle{empty}
\enlargethispage{3cm}
\begin{center}
\includegraphics[width=1cm]{vierkantlogo}
\fontsize{35}{35}\selectfont
Vierkant voor Wiskunde
\includegraphics[width=1cm]{vierkantlogo}
\end{center}

De Stichting Vierkant voor Wiskunde wil voor jongeren mogelijkheden
cre\"eren om op een creatieve wijze met wiskunde om te gaan.
Hiertoe organiseert Vierkant wiskundeclubs, puzzelmarkten en zomerkampen.
Wiskunde kan voor jongeren een plezierige, intellectuele uitdaging zijn.
Zij kunnen genieten van hun ontdekkingen en oefenen spelenderwijs het
logisch en abstract denken. Vierkant richt zich met haar activiteiten
op jongeren vanaf 10 jaar.
} % Einde uitleg over Vierkant

\newcommand{\bestelinfo}{
Naast doeboeken geeft Vierkant ook een reeks wisschriften uit, speciaal
voor kinderen van 10 tot 13 jaar. De doeboeken en wisschriften kunnen
worden besteld via onze website of bij het secretariaat van Vierkant:

Stichting Vierkant voor Wiskunde\hfill Telefoon: 071 - 527 7129\\
Mathematisch Instituut\hfill E-mail: \url{info@vierkantvoorwiskunde.nl}\\
Universiteit Leiden\hfill Webpagina: \url{http://www.vierkantvoorwiskunde.nl}\\
Niels Bohrweg 1\\
2333 CA Leiden
}

% Definitie om de namen van auteurs klein en cursief achter
% de titels van de doe-boeken te zetten op de achterflap.
\newcommand{\aut}{\ \ \footnotesize\it}

\newcommand{\wistjedat}{%
\addtolength{\topmargin}{2.45cm}
\addtolength{\textheight}{-6cm}
\enlargethispage{-4cm}
\fontsize{20}{20}\selectfont
Wist je dat \ldots

\vspace{\baselineskip}

\fontsize{16}{16}\selectfont
}

\newcommand{\inhoudsopgave}{%
\tableofcontents
\pagestyle{empty}
\cleardoublepage
\pagestyle{vierkant}
\pagenumbering{arabic}
}

\newcommand{\voorwoord}{
\chapter*{Voorwoord}
\thispagestyle{empty}
}

\starthints
\startantwoorden
\renewcommand{\starthints}{} % voor backward-compatibility
\renewcommand{\startantwoorden}{}


\addtolength{\topmargin}{-2.45cm}
\addtolength{\textheight}{6cm}
