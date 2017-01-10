% Kampprogramma-class voor Vierkant voor Wiskunde
% Copyright 2000-2012: M.P. Alberts, M. Hendriks,
%                      O.P. Kind, J.C.C. Langeveld, W.J. Palenstijn.
% Voor commentaar of vragen: latex@vierkantvoorwiskunde.nl

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{kampprogramma}[2012/06/01 Vierkant voor Wiskunde kampprogramma class]

\newif\if@deelnemer
\@deelnemerfalse
\newif\if@begeleider
\@begeleiderfalse
\newif\if@isdraft
\@isdrafttrue
\newif\if@grafischprogramma
\@grafischprogrammafalse
\newif\if@kampA
\@kampAfalse
\newif\if@antwoordruimte
\@antwoordruimtefalse
\newif\if@oudeopties
\@oudeoptiesfalse

\DeclareOption{begeleider}{\@isdraftfalse\@begeleidertrue}
\DeclareOption{deelnemer}{\@isdraftfalse\@deelnemertrue}
\DeclareOption{grafisch}{\@grafischprogrammatrue}
\DeclareOption{kampA}{\@kampAtrue}

% backward compatibility:
\DeclareOption{beperklegenda}{}
\DeclareOption{geendatum}{\@oudeoptiestrue\@isdraftfalse}
\DeclareOption{geenantwoorden}{\@oudeoptiestrue\@deelnemertrue}
% Zonder 'antwoordruimte' worden lijnregels weggelaten.
\DeclareOption{antwoordruimte}{\@antwoordruimtetrue}

\ProcessOptions\relax

\if@begeleider
 \if@deelnemer
  \errmessage{Je kan 'deelnemer' en 'begeleider' niet beide als opties gebruiken.}
 \fi
\fi

% meer backward compatibility
\if@oudeopties
 \if@isdraft
 \else
  \if@deelnemer
  \else
   \@begeleidertrue
  \fi
 \fi
\fi

% deelnemers krijgen geen antwoorden
\if@deelnemer
  \PassOptionsToPackage{geenantwoorden}{opgave}
\fi

% opgavestijl: ingesprongen
\if@antwoordruimte
\else
  \PassOptionsToPackage{ingesprongen}{opgave}
\fi

% Speciale opties voor kamp A
\if@kampA
  % Geen hoofdstuknummers in opgavelabels
  \PassOptionsToPackage{plattenummering}{opgave}

  % Een checkbox bij elke opgave
  \newcommand{\@vastekantlijn}{\checkbox}
\fi

% Overerven van class book. De optie openany zorgt dat hoofdstukken
% niet per se op de linker- of per se op de rechterpagina beginnen.
\LoadClass[twoside,12pt,openany,a4paper]{book}

% Laad een aantal pakketten.
\RequirePackage{a4wide}
\RequirePackage[T1]{fontenc} % Het font instellen
\RequirePackage{amssymb} % (met extra symbolen)
\RequirePackage{mathptmx} % op Times-New Roman
\RequirePackage[dutch]{babel}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx} % Voor het vierkantlogo (en andere PS-plaatjes).
\RequirePackage{url}
\RequirePackage{opgave}

\newif\if@usestreet
\IfFileExists{font-streetplain.sty}{\@usestreettrue}{\@usestreetfalse}
\if@usestreet
 \RequirePackage{font-streetplain}
\else
 \newcommand{\streetplainfamily}{}
\fi

% Speciale opties voor kamp A
\if@kampA
  \kantlijnsymbool{checkbox}{\ensuremath\Box}{is een hokje waar je een kruisje in moet zetten wanneer je de opgave gemaakt hebt.}
\fi


\setlength{\parskip}{12pt plus 2pt}
\setlength{\parindent}{0pt}

% Stel de paginastijl in voor gewone pagina's en eerste pagina's van
% een hoofdstuk.
\addtolength{\headheight}{7pt}
\fancypagestyle{vierkant}{%
\renewcommand{\headrulewidth}{0.4pt}
\fancyhead[LE,RO]{\bfseries\thepage}
\fancyhead[LO,RE]{\includegraphics[width=0.5cm]{vierkantlogo}}
\fancyhead[CE]{\bfseries\leftmark}
\if@isdraft
  \fancyhead[CO]{\bfseries versie van \today}
\else
  \fancyhead[CO]{\bfseries\leftmark}
\fi
\fancyfoot{}
}
\fancypagestyle{vierkanthoofdstuk}{%
\renewcommand{\headrulewidth}{0pt}
\fancyhead{}
\fancyfoot[CO,CE]{\bfseries\thepage}
}

\newcommand{\setchapterpagestyle}{\thispagestyle{vierkanthoofdstuk}}

% Het zetten van hoofdstuktitels willen we op onze eigen manier.
\renewcommand{\chapter}{%
    \setcounter{section}{0}%
    \newpage\setchapterpagestyle%
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

% Het stukje uitleg over tekens in de kantlijn.
\newcommand{\legenda}{%
\if@legenda
\section*{Uitleg van de gebruikte symbolen:}
In de kantlijn staat een aantal speciale symbolen. Deze hebben de
volgende betekenis:

\@legendasymbolen

\fi
} % Einde legenda


% Inhoudsopgave + pagestyle erna
\newcommand{\inhoudsopgave}{
% we willen geen paginanummer onder het inhoudsopgave-hoofdstuk
\renewcommand{\setchapterpagestyle}{\pagestyle{empty}}
\tableofcontents
\renewcommand{\setchapterpagestyle}{\thispagestyle{vierkanthoofdstuk}}
\pagestyle{empty}
\cleardoublepage

\pagestyle{vierkant}
\pagenumbering{arabic}
}

\newcommand{\voorwoord}{
\cleardoublepage
\chapter*{Voorwoord}
\thispagestyle{empty}
}

\newif\if@illustratie
\@illustratiefalse
\newcommand{\@illustratie}{}
\newcommand{\@titel}{Titel}
\newcommand{\@auteurs}{Auteurs}
\newcommand{\@kamp}{}

\newcommand{\illustratie}[1]{\@illustratietrue\renewcommand{\@illustratie}{#1}}
\newcommand{\titel}[1]{\renewcommand{\@titel}{#1}}
\newcommand{\auteurs}[1]{\renewcommand{\@auteurs}{#1}}
\newcommand{\kamp}[1]{\renewcommand{\@kamp}{#1}}

\newcommand{\voorpagina}{
\pagestyle{empty}
\enlargethispage{2.5cm}
\streetplainfamily
\begin{center}
%\vspace*{2cm}
\fontsize{45}{30}\selectfont
\@titel\par
\vspace*{\stretch{1}}
\fontsize{18}{18}\selectfont
\begin{tabular}{c}
\@auteurs
\end{tabular}\par
\vspace*{\stretch{1}}
\if@illustratie
\mbox{\includegraphics[width=10cm,height=10cm,keepaspectratio]{\@illustratie}}\par
\else
\vspace*{10cm}
\fi
\if@isdraft
Versie van \today\par
\else
 \if@begeleider
  Begeleidersversie\par
 \fi
\fi
\vspace*{\stretch{3}}
\fontsize{24}{24}\selectfont
\begin{tabular}{ccc}
\includegraphics[width=2cm]{vierkantlogo} &
\begin{tabular}{c}
Vierkant voor Wiskunde\\
\@kamp\\
\\
\end{tabular}
\includegraphics[width=2cm]{vierkantlogo}
\end{tabular}
%\vspace*{-5mm}
\end{center}
\rmfamily
}




\startantwoorden
\starthints

% al gebeurd; voor backward compatibility blijven de commandos bestaan
\renewcommand{\startantwoorden}{}
\renewcommand{\starthints}{}

% pagestyle voor eerste pagina
\pagestyle{vierkant}



% Status output:

\typeout{------}
\if@isdraft
 \typeout{Vierkant programma: proefversie}
\else
 \if@begeleider
  \typeout{Vierkant programma: begeleidersversie}
 \else
  \typeout{Vierkant programma: deelnemersversie}
 \fi
\fi
\if@usestreet
 \typeout{Inclusief Street font}
\else
 \typeout{Zonder Street font voor de voorpagina}
\fi
\typeout{------}
