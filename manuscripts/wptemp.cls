% Author: Mehedi Hasan Oni
% Homepage: https://onimh.github.io
% Email: moni@uh.edu

% --- Class structure: identification part
\ProvidesClass{wptemp}[2021/03/16 v1.00 LaTeX Paper class]
\NeedsTeXFormat{LaTeX2e} 
\LoadClass[12pt]{article}
\RequirePackage{fouriernc}

%\RequirePackage{indentfirst}
\RequirePackage[margin=1in]{geometry}
\RequirePackage{amsfonts}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{mathtools}
\RequirePackage{mathrsfs}
\RequirePackage{amstext}
\RequirePackage{dsfont}
\RequirePackage{graphicx} 
\RequirePackage[utf8]{inputenc}
\RequirePackage[shortlabels,inline]{enumitem}
\setlist{nolistsep}
\RequirePackage{booktabs}
\RequirePackage{multicol}
\RequirePackage{multirow}
\RequirePackage{scalerel}
\RequirePackage{mathrsfs}
\RequirePackage{float}
\everymath{\displaystyle}
\RequirePackage[english]{babel}
\RequirePackage[autostyle]{csquotes}
\RequirePackage{etoolbox}
\RequirePackage{calc}
\RequirePackage{bold-extra}
\RequirePackage[doublespacing]{setspace}
%\RequirePackage{silence}
%\WarningFilter{latex}{Command} % silence the warning for \sectsty
\RequirePackage{sectsty}
\RequirePackage[norule,bottom]{footmisc}
\RequirePackage[justification=centering,textfont={sc},labelfont={rm}]{caption}

%-------------------------------------------------------------
\RequirePackage[dvipsnames]{xcolor}
\colorlet{navy}{green!15!black!30!blue}
\definecolor{winered}{rgb}{0.5,0,0}
%-------------------------------------------------------------

%-------------------------------------------------------------
\RequirePackage[colorlinks=true,allcolors=navy]{hyperref}
\RequirePackage[nameinlink,noabbrev]{cleveref}
%-------------------------------------------------------------

%-------------------------------------------------------------
%\renewcommand\title[1]\linespread{1}{{{\fontfamily{ptm}\selectfont{\Large{\MakeUppercase{#1}}}}}}
%-------------------------------------------------------------

%-------------------------------------------------------------
\newcommand\email[1]{\href{mailto:#1}{#1}}
%-------------------------------------------------------------

%-------------------------------------------------------------
\RequirePackage{abstract}
\renewcommand{\abstractnamefont}{\bfseries\scshape}
\renewcommand{\abstracttextfont}{\small\doublespacing\noindent\ignorespaces}
%-------------------------------------------------------------

%-------------------------------------------------------------
\newcommand{\keywords}[1]{\vskip 6ex\par\noindent        	\normalfont{\itshape Keywords: } #1}

\newcommand{\JEL}[1]{\vskip 2ex\par\noindent        	\normalfont{\itshape JEL Classifications: } #1}
%-------------------------------------------------------------

%-------------------------------------------------------------
\sectionfont{\fontsize{12pt}{20}\selectfont\scshape\centering} % change section font size \fontsize{<size>}{<bskip>}
\renewcommand{\thesection}{\Roman{section}}
\subsectionfont{\fontsize{12pt}{16}\selectfont\itshape}
\renewcommand{\thesubsection}{\thesection.\Alph{subsection}}
\subsubsectionfont{\fontsize{12pt}{14}\selectfont}
\renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}
\makeatletter
\renewcommand\@seccntformat[1]{\csname the#1\endcsname.\quad}
\makeatother
%-------------------------------------------------------------

%-------------------------------------------------------------
 \newtheoremstyle{xplain}
  {\topsep}   % ABOVESPACE
  {\topsep}   % BELOWSPACE
  {\itshape\doublespacing}  % BODYFONT
  {}               % INDENT (empty value is the same as 0pt)
  {\bfseries} % HEADFONT
  {.}             % HEADPUNCT
  {5pt plus 1pt minus 1pt} % HEADSPACE
  {}
 
  \theoremstyle{xplain}% default
  \newtheorem{theorem}{Theorem}%[section] %
  \newtheorem{lemma}[theorem]{Lemma} %
  \newtheorem{proposition}[theorem]{Proposition} %
  \newtheorem*{corollary}{Corollary} %
  \theoremstyle{definition} %
  \newtheorem{definition}{Definition}[section] %
  \newtheorem{conjecture}{Conjecture}%[section] %
  \newtheorem{example}{Example}[section] %
  \theoremstyle{remark} %
  \newtheorem*{remark}{Remark} %
  \newtheorem*{note}{Note} %
  \newtheorem{case}{Case} %
  
  \renewcommand*{\proof}{\normalfont\doublespacing\noindent{\itshape{Proof. }}}%
%-------------------------------------------------------------

%-------------------------------------------------------------
\captionsetup[table]{name=TABLE}
\renewcommand{\thetable}{\Roman{table}}
\captionsetup[table]{skip=3pt}
\RequirePackage{makecell}
\RequirePackage{longtable}
\RequirePackage{tabularx}
\renewcommand{\tabularxcolumn}{m}
\RequirePackage{threeparttable}
\RequirePackage{siunitx}

%\captionsetup[figure]{name=Figure}
%\renewcommand{\thefigure}{\Roman{figure}}
%\captionsetup[figure]{skip=3pt}
\RequirePackage[justification=centering,labelsep=newline]{caption}
\RequirePackage{subcaption}
\RequirePackage[font=footnotesize,labelfont={bf,sc}]{caption}
%-------------------------------------------------------------

%-------------------------------------------------------------
\makeatletter%
\newcommand\@mymakefnmark{\normalfont\@thefnmark.}
\renewcommand\@makefntext[1]{%
   %\parindent 1em%
    \noindent 
    \hb@xt@2.12em{\hss\@mymakefnmark} #1}
\makeatother
%-------------------------------------------------------------
%\RequirePackage{fancyvrb}

%\RequirePackage{hologo}
%-------------------------------------------------------------

\RequirePackage[authoryear,round]{natbib}
\bibliographystyle{chicago-bib} 
%\RequirePackage[natbib=true, style=authoryear, backend=biber]{biblatex}

%-------------------------------------------------------------

%-------------------------------------------------------------
\RequirePackage[title]{appendix}
\RequirePackage{titlesec}
\RequirePackage{chngcntr}
\AtBeginEnvironment{appendices}{%
\titleformat{\section}{\fontsize{12pt}{20}\selectfont\bfseries\scshape\centering}{\appendixname~\thesection:}{0.5em}{}%   \bfseries\scshape
\titleformat{\subsection}{\fontsize{12pt}{15}\selectfont\bfseries\itshape}{\thesubsection.}{0.5em}{}%
\renewcommand{\thesubsection}{\thesection.\arabic{subsection}}
\titleformat{\subsubsection}{\fontsize{12pt}{14}\selectfont\bfseries}{\thesubsubsection.}{0.5em}{}%
\renewcommand{\thesubsubsection}{\thesubsection.\Roman{subsubsection}}
\counterwithin{equation}{section}}
%-----------------------------
\RequirePackage{xpatch}
\xapptocmd\appendices{%
  \crefalias{section}{appendix}%
}{}{\PatchFailed}
%-----------------------------
%-------------------------------------------------------------






