% nsfproposal.cls
%
% This is a LaTeX class for creating an NSF proposal.
%
% The class is based on the standard LaTeX article class.
%
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nsfproposal}[19/02/2020 NSF proposal class v0.1 ABB]

% Load some initial packages
\RequirePackage{calc}
\RequirePackage{ifthen}

% Load options and base class
\newboolean{@nsfsummary}
\setboolean{@nsfsummary}{false}
\newboolean{@nsfdescription}
\setboolean{@nsfdescription}{false}
\newboolean{@nsfreferences}
\setboolean{@nsfreferences}{false}
\newboolean{@nsfbio}
\setboolean{@nsfbio}{false}
\newboolean{@nsfbudgjust}
\setboolean{@nsfbudgjust}{false}
\newboolean{@nsfcurrentpending}
\setboolean{@nsfcurrentpending}{false}
\newboolean{@nsffacilities}
\setboolean{@nsffacilities}{false}
\newboolean{@nsfdata}
\setboolean{@nsfdata}{false}
\newboolean{@nsfpostdoc}
\setboolean{@nsfpostdoc}{false}

\DeclareOption{nsfsummary}{\setboolean{@nsfsummary}{true}}
\DeclareOption{nsfdescription}{\setboolean{@nsfdescription}{true}}
\DeclareOption{nsfreferences}{\setboolean{@nsfreferences}{true}}
\DeclareOption{nsfbio}{\setboolean{@nsfbio}{true}}
\DeclareOption{nsfbudgjust}{\setboolean{@nsfbudgjust}{true}}
\DeclareOption{nsfcurrentpending}{\setboolean{@nsfcurrentpending}{true}}
\DeclareOption{nsffacilities}{\setboolean{@nsffacilities}{true}}
\DeclareOption{nsfdata}{\setboolean{@nsfdata}{true}}
\DeclareOption{nsfpostdoc}{\setboolean{@nsfpostdoc}{true}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass[11pt]{article}

% Set page and text sizes
\setlength{\paperheight}{11in}
\setlength{\paperwidth}{8.5in}
\addtolength{\voffset}{-1in}
\addtolength{\hoffset}{-1in}
\setlength{\topmargin}{1in}
\setlength{\oddsidemargin}{1in}
\setlength{\evensidemargin}{1in}
\setlength{\textwidth}{\paperwidth - 2in}
\setlength{\textheight}{\paperheight - 2in}
\setlength{\footskip}{36pt}
\setlength{\marginparsep}{0.5cm}
\setlength{\marginparwidth}{1.5cm}
\setlength{\headheight}{0pt}
\setlength{\headsep}{0pt}

% Set spacing
\setlength{\parskip}{0.5\baselineskip}
\setlength{\parindent}{0em}

% Saving space in itemized and enumerated lists
\RequirePackage{paralist}

% Set up the fonts
\RequirePackage[full]{textcomp}
\RequirePackage{newtxtext}
\RequirePackage{newtxmath}
\RequirePackage{microtype}

% Typesetting mathematics
\RequirePackage{amsmath}

% Set up common headers
\RequirePackage{fancyhdr}
\pagestyle{fancyplain}
\renewcommand{\headrulewidth}{0pt}
\lhead{}
\chead{}
\rhead{}
\lfoot{}
\cfoot{\thepage}
\rfoot{}

% Dealing with graphics
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage{pgfgantt}
\RequirePackage{wrapfig}

% Tables
\RequirePackage{multirow}
\RequirePackage{floatrow}
\RequirePackage{tabularx}
\RequirePackage{ragged2e}

\newcolumntype{Y}{ >{\RaggedRight\arraybackslash}X}
\newcommand\T{\rule{0pt}{2.6ex}}
\newcommand\B{\rule[-1.2ex]{0pt}{0pt}}

% ToDo Notes and reminders
\RequirePackage{todonotes}
\setuptodonotes{color=red!40,size=\tiny}
%\newcommand{\abbcomment}[1]{\todo[color=red!40,size=\tiny]{#1}}

% Formatting figure and table captions
\RequirePackage[format=plain,indention=0cm,font=normalsize,font=sf,labelsep=colon,labelfont=bf]{caption}

% Spacing
  \RequirePackage[compact]{titlesec}
  \titlespacing\section{0pt}{4pt plus 2pt minus 2pt}{-6pt plus 1pt minus 1pt}
  \titlespacing\subsection{0pt}{4pt plus 2pt minus 2pt}{-6pt plus 1pt minus 1pt}
  \titlespacing\subsubsection{0pt}{4pt plus 2pt minus 2pt}{-6pt plus 1pt minus 1pt}


% Set up things for individual parts of the proposal 
\ifthenelse{\boolean{@nsfsummary}}{
  \setcounter{page}{1}
  \pagenumbering{arabic}
  \renewcommand{\thepage}{B--\arabic{page}}
}

\ifthenelse{\boolean{@nsfdescription}}{
  \RequirePackage{atbegshi}
  \setcounter{page}{1}
  \pagenumbering{arabic}
  \renewcommand{\thepage}{D--\arabic{page}}
}

\ifthenelse{\boolean{@nsfreferences}}{
  \setcounter{page}{1}
  \pagenumbering{arabic}
  \renewcommand{\thepage}{E--\arabic{page}}
}

\ifthenelse{\boolean{@nsfbio}}{
  \setcounter{page}{1}
  \pagenumbering{arabic}
  \renewcommand{\thepage}{F--\arabic{page}}
  \setcounter{subsection}{0}
  \renewcommand\thesubsection{(\alph{subsection})}
  \renewcommand\thesubsubsection{\textit{(\roman{subsubsection})}}
%  \RequirePackage[bibstyle=authoryear-comp,defernumbers=true,maxnames=20,firstinits=true,uniquename=init,dashed=false,doi=true,isbn=false,backend=biber]{biblatex}
  \RequirePackage[authordate,backend=biber]{biblatex-chicago}
  \renewbibmacro{in:}{%
     \ifentrytype{article}{}{%
     \printtext{\bibstring{in}\intitlepunct}}}
  \def\makebibcategory#1{\DeclareBibliographyCategory{#1}}
  \makebibcategory{relevant}
  \makebibcategory{other}
  \setlength{\bibitemsep}{2.5pt}
  \setlength{\bibhang}{.8cm}
%  \defbibenvironment{bibliography}
%  {\list{}
%    {\setlength{\leftmargin}{\bibhang}%
%     \setlength{\itemsep}{\bibitemsep}%
%     \setlength{\parsep}{\bibparsep}}}
%  {\endlist}
%  {\bibitem}
  \def\printbib#1{\printbibliography[category=#1,heading=none]}
  \renewcommand{\bibfont}{\normalfont\fontsize{11}{13.4}\rmfamily}
  \nocite{*}
}

\ifthenelse{\boolean{@nsfbudgjust}}{
  \setcounter{page}{1}
  \pagenumbering{arabic}
  \renewcommand{\thepage}{G--\arabic{page}}
}

\ifthenelse{\boolean{@nsfcurrentpending}}{
  \setcounter{page}{1}
  \pagenumbering{arabic}
  \renewcommand{\thepage}{H--\arabic{page}}
}

\ifthenelse{\boolean{@nsffacilities}}{
  \setcounter{page}{1}
  \pagenumbering{arabic}
  \renewcommand{\thepage}{I--\arabic{page}}
}

\ifthenelse{\boolean{@nsfdata}}{
  \RequirePackage{atbegshi}
  \setcounter{page}{1}
  \pagenumbering{arabic}
  \renewcommand{\thepage}{J--\arabic{page}}
}

\ifthenelse{\boolean{@nsfpostdoc}}{
  \setcounter{page}{1}
  \pagenumbering{arabic}
  \renewcommand{\thepage}{J--\arabic{page}}
}


% Set styles for floats
\renewcommand\floatpagefraction{.9}

% Some abbreviations and other commands
\newcommand{\Eqn}[1]{Equation~\ref{eq:#1}{}}
\newcommand{\Fig}[1]{Figure~\ref{fig:#1}{}}
\newcommand{\Tbl}[1]{Table~\ref{tbl:#1}{}}
\newcommand{\Sect}[1]{Section~\ref{sec:#1}{}}
