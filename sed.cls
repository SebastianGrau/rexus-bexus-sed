% kate: word-wrap off
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sed}[2018/01/22 Standard REXUS/BEXUS Student Experiment
Documentation (SED) report class]


% base class
\LoadClass[
 headings = small,
 fontsize = 12pt,
 parskip = half-,
 DIV = calc,
%  bibliography = totoc,
%  index = totoc
]{scrreprt}


% required packages
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[american,ngerman]{babel}

% \PrerenderUnicode{ä}
% \PrerenderUnicode{ö}
% \PrerenderUnicode{ü}
%
% \PrerenderUnicode{Ä}
% \PrerenderUnicode{Ö}
% \PrerenderUnicode{Ü}

% \RequirePackage{cmap}
% \RequirePackage{microtype}
\RequirePackage{lmodern}
% \RequirePackage{helvet}


%% page setup
\KOMAoptions{
 paper = A4,
 pagesize,
 headlines = 1.1,
 headsepline,
 DIV = last
}
\typearea[8mm]{15}


%% graphics and colors
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{colortbl}


% tables
\RequirePackage{booktabs}
\RequirePackage{tabularx}
\RequirePackage{multirow}
\RequirePackage{ragged2e}

\newcolumntype{L}{>{\RaggedRight\hspace{0pt}}X}
\newcolumntype{R}{>{\RaggedLeft\hspace{0pt}}X}
\newcolumntype{C}{>{\centering\arraybackslash}X}
\newcolumntype{P}[1]{>{\RaggedRight\hspace{0pt}}p{#1}}

%% bibliography
\RequirePackage{csquotes}
\RequirePackage[
  style = ieee,
  backend = biber
]{biblatex}[2016/05/08] % ver. 3.4

% siunitx
\RequirePackage{siunitx}[2016/03/01] % ver. 2.6q
\sisetup{
 binary-units = true,
 detect-all,
 detect-display-math,
 group-digits = true,
 group-minimum-digits = 4,
%  group-separator = {.},
%  locale = US, % this option should be linked somehow to the useage of babel
%  locale = DE, % this option should be linked somehow to the useage of babel
 per-mode = symbol,
 range-phrase = {--},
 range-units=single,
 retain-explicit-plus
}

\RequirePackage{tikz}

\RequirePackage[
 colorlinks = true,
 linkcolor  = ,
 linktoc    = all,
 urlcolor   =
]{hyperref}

\RequirePackage[xindy, acronym, symbols, shortcuts, numberedsection]{glossaries}


%% font family: sans serif
\renewcommand{\familydefault}{\sfdefault}


%% head and foot
\RequirePackage{lastpage}
\RequirePackage[
 automark,
 headsepline,
 nouppercase,
 komastyle
]{scrpage2}

\RequirePackage[nameinlink]{cleveref}

\RequirePackage{ifthen}

%% page style
\pagestyle{scrheadings}

\ohead[]{\makeatletter\@title\makeatother}
\ihead[]{\headmark}
\chead[]{}
\ofoot[\pagemark/\pageref{LastPage}]{\pagemark/\pageref{LastPage}}
\ifoot[\@identifier]{\@identifier}
\cfoot[]{}

\setkomafont{pageheadfoot}{\small\usekomafont{pagenumber}}

\renewcommand*{\titlepagestyle}{empty}
\renewcommand*{\partpagestyle}{empty}
\renewcommand*{\chapterpagestyle}{scrheadings}
\renewcommand*{\indexpagestyle}{empty}


%% captions
\setkomafont{captionlabel}{\sffamily\bfseries}
\setcapindent{0em}


%% penalties
\clubpenalty 10000
\widowpenalty 10000
\displaywidowpenalty 10000


%% floats
\renewcommand{\topfraction}{.95}
\renewcommand{\bottomfraction}{.95}
\renewcommand{\textfraction}{.05}


%% new commands
\def\@type{Type}
\newcommand{\type}[1]{
  \def\@type{#1}
}

\def\@version{0}
\newcommand{\version}[1]{
  \def\@version{#1}
}

\def\@issuedate{2000-01-01}
\newcommand{\issuedate}[1]{
  \def\@issuedate{#1}
}

\def\@validdate{2000-01-01}
\newcommand{\validdate}[1]{
  \def\@validdate{#1}
}

\def\@identifier{RXBX_SED_v0-0_01Jan00}
\newcommand{\identifier}[1]{
  \def\@identifier{#1}
}

\def\@mission{REXUS 00}
\newcommand{\mission}[1]{
  \def\@mission{#1}
}

\def\@team{Team}
\newcommand{\team}[1]{
  \def\@team{#1}
}

\def\@teamlogo{}
\newcommand{\teamlogo}[1]{
  \def\@teamlogo{#1}
}

\def\@experiment{Experiment}
\newcommand{\experiment}[1]{
  \def\@experiment{#1}
}

\def\@teammembers{team-members.tex}
\newcommand{\teammembers}[1]{
  \def\@teammembers{#1}
}

\def\@creatorname{John Doe}
\def\@creatorrole{Deer}
\newcommand{\creator}[2]{
  \def\@creatorname{#1}
  \def\@creatorrole{#2}
}

\def\@examinername{John Doe}
\def\@examinerrole{Deer}
\newcommand{\examiner}[2]{
  \def\@examinername{#1}
  \def\@examinerrole{#2}
}

\def\@releasename{John Doe}
\def\@releaserole{Deer}
\newcommand{\release}[2]{
  \def\@releasename{#1}
  \def\@releaserole{#2}
}


%% title page
\renewcommand{\maketitle}{
 \thispagestyle{\titlepagestyle}
 \hfill\includegraphics[height = 50mm]{logo-rexus-bexus}
 \ifthenelse{\equal{\@teamlogo}{}}{}{\\
 \hspace*{\fill}\includegraphics[height = 50mm]{\@teamlogo}\vspace*{-50mm}}

 \vspace*{0mm}
 {\LARGE\textbf{\@title}}\\
 \textbf{Student Experiment Documentation}

 \vspace*{14.4pt}
 {%
 \fontsize{10}{12}\selectfont%
 Document ID: \@identifier%
 }

 \vspace*{28.8pt}
 \textbf{Mission: \@mission}

 \vspace*{14.4pt}
 {%
 \fontsize{16}{19.2}\selectfont%
 \textbf{Team Name: \@team}%
 }

 \vspace*{14.4pt}
 Experiment Title: \@experiment%

 \vspace*{14.4pt}
 \input{\@teammembers}

 \vspace*{28.8pt}
 \begin{longtabu}[]{@{}lX[1,l]X[1,l]X[1,l]@{}}
  Version: & Issue Date: & Document Type: & Valid From: \\
  \textbf{\@version} & \textbf{\@issuedate} & \textbf{\@type} & \textbf{\@validdate} \\
 \end{longtabu}

 \vspace*{14.4pt}
 {\fontsize{10}{12}\selectfont Issued by:}

 \vspace*{14.4pt}
 \textbf{Experiment Scientist}

 \vspace*{14.4pt}
 {\fontsize{10}{12}\selectfont Approved by:}

 \vspace*{14.4pt}
 \textbf{Payload Manager}
 \newpage
 \cleardoubleemptypage
}


%% signature page
\newcommand{\makesignatures}{
 \vspace*{\fill}
 \begin{tabularx}{\textwidth}{@{}llcC@{}}
  Erstellt: & \@creatorname & & \\
  \midrule
  & (\@creatorrole) & Datum & Unterschrift \\
  & & & \\
  & & & \\
  & & & \\
  Gepr\"uft: & \@examinername & & \\
  \midrule
  & (\@examinerrole) & Datum & Unterschrift \\
  & & & \\
  & & & \\
  & & & \\
  Genehmigt: & \@releasename & & \\
  \midrule
  & (\@releaserole) & Datum & Unterschrift \\
 \end{tabularx}
 \newpage
 \cleardoubleemptypage
}


%% contact page
\newcommand{\makecontact}{
 \textbf{Kontaktadresse}

 Technische Universit\"at Berlin \\
 Fakult\"at Transport- und Maschinensysteme \\
 Institut f\"ur Luft- und Raumfahrt \\
 Fachgebiet Raumfahrttechnik

 Marchstra{\ss}e 12 - 14 \\
 10587 Berlin \\
 Deutschland

 Telefon: +49 (0)30 314-21305 \\
 Telefax: +49 (0)30 314-21306

 \url{http://www.raumfahrttechnik.tu-berlin.de}
 \newpage
 \cleardoubleemptypage
}
