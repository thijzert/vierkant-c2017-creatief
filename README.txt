Dit is een korte uitleg bij de bestanden om Vierkant-kampprogramma's
en andere nuttige documenten te maken met LaTeX.


Inhoudsopgave:
* DE CLASS kampprogramma:
* DE COMMANDO'S
* DE BESTANDEN



DE CLASS kampprogramma:

Deze class is bedoeld om kampprogramma's een standaard stijl te geven.
Zie voorbeeld_kampprogramma.tex voor een template voor het gebruik ervan.

Deze class heeft verschillende modes: draft, deelnemer, begeleider:

\documentclass{kampprogramma}
\documentclass[deelnemer]{kampprogramma}
\documentclass[begeleider]{kampprogramma}

In de standaard draft-mode, staat er op de voorkant een datum.
In de deelnemer-mode worden de antwoorden weggelaten.
In de begeleider-mode staat er "Begeleidersversie" op de voorkant.


Er zijn ook drie mogelijke manieren om de opgaven weer te geven:

\documentclass{kampprogramma}
\documentclass[antwoordruimte]{kampprogramma}
\documentclass[antwoordruimte,grafisch]{kampprogramma}

In de standaardmode worden opgaven ruwweg als volgt getoond:

1.2  De tekst van een opgave die meerdere regels en ook meerdere
     alinea's kan beslaan. Deze tekst is in zijn geheel ingesprongen.


In de antwoordruimte-mode is er de mogelijkheid om lijntjes onder de
opgave neer te zetten om deelnemers in het kampprogramma zelf de antwoorden
op te laten schrijven. De hoeveelheid ruimte is per opgave aan te geven:
\begin{opgave}[3]
Dit geeft drie lijnen.
\end{opgave}

Opgave 1.2
De tekst van een opgave die meerdere regels en ook meerdere alinea's kan
beslaan. Deze tekst is niet ingesprongen, maar krijgt ruimte voor antwoorden:
____________________________________________________________________________
____________________________________________________________________________
____________________________________________________________________________



Er is ook de mogelijkheid om deze lijnen te vervangen door een omlijnd vak
voor grafisch getinte programma's waar antwoorden meestal uit een tekening
bestaan. Dit gaat door de combinatie van opties antwoordruimte,grafisch te
gebruiken. Het aantal lijnen wordt dan geinterpreteerd als de hoogte van
het antwoordvlak.

Zie de sectie hieronder voor commando's om handmatig lijnen en antwoordvlakken
in te voegen. Deze commando's zijn binnen kampprogramma's alleen functioneel
in de twee antwoordruimte-modes.



Er is ook een extra optie kampA:

\documentclass[kampA]{kampprogramma}

Deze laat opgavenummers doornummeren door het hele programma in plaats van
per hoofdstuk. Ook komt er een checkbox voor elke opgave die deelnemers
kunnen gebruiken om aan te geven welke opgaven ze al gemaakt hebben.



DE COMMANDO'S

Zelf kan je, behalve de standaard LaTeX-commando's, een aantal commando's 
gebruiken die we speciaal gemaakt hebben voor kampprogramma's:

- `\ster', `\vinger', `\schaar', `\gr' (Grafische Rekenmachine) en '\discussie'
produceren de symbolen die ze aangeven.
Een \ster staat voor een extra moeilijke opgave, een \vinger voor
een opgave met hint, een \schaar voor een 'doe'-opgave, een \gr
voor een opgave waarbij een grafische rekenmachine nodig is, en \discussie
voor een discussie-opgave.

- met de omgevingen `aanname', `bewijs', `definitie', `lemma',
`stelling' en `voorbeeld' kan je betreffende stukken zetten. Dit gaat met
\begin{...}
\end{...}

- met de `opgave' omgeving kan je opgaven maken. Dit gaat met
\begin{opgave}
Dit is een opgave.
\end{opgave}

Als er bij een opgave een symbool in de kantlijn moet, kan dat
door een optioneel argument:
\begin{opgave}[\vinger]
Dit is een opgave met een hint.
\end{opgave}

Ook kan je achter een opgave extra informatie tussen haakjes zetten:
\begin{opgave}[\ster](Laatste stelling van Fermat)
Bewijs $x^n + y^n \ne z^n$
\end{opgave}

- bij een opgave kan een hint worden gegeven. Deze komt dan in een apart
hoofdstuk. Je moet zelf een wijzende vinger voor de opgave zetten. De hint
voeg je als volgt toe, BINNEN de opgave omgeving:
\begin{opgave}
Dit is een pittige opgave.
\begin{hint} 
We geven toch maar een hint: denk na.
\end{hint}
\end{opgave}

- bij een kampprogramma kan een antwoord worden gegeven. (Deze antwoorden
zijn overigens alleen bedoeld voor de begeleiders, niet voor de
deelnemers.)
Het antwoord voeg je als volgt toe, BINNEN de opgave omgeving:
\begin{opgave}
Dit is een opgave met antwoord.
\begin{antwoord}
En dit is dan het antwoord
\end{antwoord}
\end{opgave}
(Overigens is het ook mogelijk zowel een hint als een antwoord te geven)

- Je kan bij een opgave ook lijntjes neerzetten als antwoord-ruimte:

\begin{opgave}[5]
Hieronder staan 5 lijntjes.
\end{opgave}

Dit gaat overigens als volgt samen met symbolen als \ster:
\begin{opgave}[\ster,5]
In de kantlijn staat een sterretje en hieronder staan 5 lijntjes.
\end{opgave}

Je kan ook handmatig een aantal lijntjes neerzetten:

- met `\lijnregels{n}' kan je n lijntjes neerzetten als antwoord-ruimte
voor een opgave. Gebruik het als volgt:
\begin{opgave}
Dit is een opgave.\\
\lijnregels{5}
\end{opgave}

Vergeet de \\ na de laatste regel van de opgave niet.
In een kampprogramma is dit commando alleen functioneel als je de
'antwoordruimte'-optie meegeeft aan de documentclass.

- met '\antwoordvlak{5}' kan je een omlijnde open ruimte neerzetten
In een kampprogramma is dit commando alleen functioneel als je de
'antwoordruimte'-optie meegeeft aan de documentclass.

- met `\kantlijn{...}' kan je het argument tussen accolades aan de
linkerkant in de kantlijn zetten. Dit is handig als bijvoorbeeld een
ster niet bij een hele opgave moet staan, maar alleen bij een onderdeel.
We krijgen dan bijvoorbeeld iets als:
\begin{opgave}
\begin{enumerate}
\item Dit is het makkelijke eerste onderdeel.
\item \kantlijn{\ster} Maar dit is het moeilijke tweede.
\end{enumerate}
\end{opgave}

- Opgaven zijn ook te bundelen in subopgaven:

In de standaard ingesprongen opgave-mode:

\begin{opgave}
Dit is een (optionele) introductie.
\begin{subopgave}
Dit is opgave a.
\end{subopgave}
\begin{subopgave}
En dit is opgave b.
\end{subopgave}
\end{opgave}


In de oude antwoordruimte-mode is het mogelijk om opgaven te groeperen
in subopgaven met hetzelfde nummer (met a, b, c, ... toegevoegd)

\begin{subopgaven}
\begin{opgave}
Dit is opgave a.
\end{opgave}
\begin{opgave}
Dit is opgave b.
\end{opgave}
\end{subopgaven}



DE BESTANDEN

Naast deze uitleg zijn als het goed is ook de volgende bestanden aanwezig
in dezelfde directory:

style-/class-bestanden:
kampprogramma.cls
kleineproblemen.cls
weekprobleem.cls
opgave.sty

voorbeelden:
voorbeeld_kampprogramma.tex
voorbeeld_opgave.tex
voorbeeld_weekprobleem.tex
voorbeeld_kleineproblemen.tex

hulpbestanden:
answers.sty (indien nodig, zie beneden. Met bronbestanden src/answers.ins/dtx)
enumitem.sty (indien nodig, zie beneden. Met bronbestanden src/enumitem.tex/sty)
discussie.eps
discussie.pdf
gr_icon.eps (met bronbestand src/gr_icon.fig)
gr_icon.pdf
vierkantlogo.eps
vierkantlogo.pdf


in de subdirectory org:
notulen.cls
takenlijst.cls
voorbeeld_notulen.tex
voorbeeld_takenlijst.tex
voorbeeld_weekprogramma.tex


in de subdirectory oud:
cwilogo.eps
cwilogo.pdf
doeboek.cls
doeboek_template.tex
drieproblemen.cls
ochtendproblemen.cls



answers.sty:
In veel LaTeX-distributies is dit macro-pakketje niet geinstalleerd.
Dan moet het (bijv.) in de directory van het LaTeX-bestand staan. Het
zorgt ervoor dat hints en antwoorden bij opgaven in de broncode bij een
opgave zelf geplaatst kunnen worden, maar in de output in een apart
hoofdstuk aan het eind worden neergezet.

enumitem.sty:
Veel LaTeX-distributies hebben een te oude versie van dit pakket, waarin
nog bugs zaten die voor problemen met layout van opgaven in kampprogramma's
zorgen. Deze meegeleverde nieuwe versie heeft die problemen niet meer.


kampprogramma.cls:
Dit class-bestand definieert de layout-standaard voor
kampprogramma's. Pas hiet niet zelf aan. Als je extra macros wilt
definieren, kan dat bovenaan het LaTeX-bestand van het
kampprogramma zelf.

voorbeeld_kampprogramma.tex:
Kopieer dit bestand naar een nieuw bestand zodat je het origineel
bewaart. Pas in de kopie op de aangegeven plekken het bestand aan.
(De titel, auteurs, kaft-illustratie, kamp, het voorwoord, de eigenlijke tekst)


weekprobleem.cls:
Dit class-bestand definieert de layout voor een weekprobleem.

voorbeeld_weekprobleem.tex:
Een voorbeeld voor het gebruik van weekprobleem.cls.


kleineproblemen.cls:
Dit class-bestand definieert de layout voor de dagelijkse kleine problemen.

voorbeeld_kleineproblemen.tex:
Een voorbeeld voor het gebruik van kleineproblemen.cls.


opgave.sty:
Dit package definieert een 'opgave' environment en enkele verwante
commando's. Het wordt gebruikt door de classes van vierkant,
maar je kan het ook zelf direct gebruiken.

voorbeeld_opgave.tex:
Een voorbeeld van gebruik van opgave.sty.


org:
In de subdirectory org staan een aantal bestanden die handig kunnen
zijn voor organisatorische taken.

oud:
In de subdirectory oud staan oude classes die niet meer gebruikt zouden
moeten worden, maar nog wel bewaard zijn om bestaande .tex-bestanden te kunnen
blijven gebruiken.





Stuur suggesties of vragen over deze macros naar
latex@vierkantvoorwiskunde.nl
