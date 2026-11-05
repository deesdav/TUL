%\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tulpresentation}[2025/04/28 TUL presentation class version 2.2]
% Licence: CC BY

\newcommand{\TUL@baseclass}{beamer}

% Předej všechny volby beameru
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\TUL@baseclass}}
\ProcessOptions\relax

\newif\ifTUL@handout
\TUL@handoutfalse

\newif\ifTUL@extlogo
\TUL@extlogofalse

\newcommand{\TUL@aspectratio}{t} % Default: t = standardní 4:3 poměr stran

\newif\ifTUL@extlogo
\TUL@extlogofalse


% --- Zpracování voleb ---
\DeclareOption{handout}{\TUL@handouttrue\PassOptionsToClass{handout}{\TUL@baseclass}}

\DeclareOption{aspect169}{\renewcommand{\TUL@aspectratio}{aspectratio=169,t}}
\DeclareOption{aspect43}{\renewcommand{\TUL@aspectratio}{t}}

\DeclareOption{extlogo}{\TUL@extlogotrue}

\DeclareOption{EN}{\PassOptionsToPackage{\CurrentOption}{EN}}

\DeclareOption{FS}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{FT}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{FP}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{EF}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{FA}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{FM}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{FZS}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{UZS}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{CXI}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{bwtitles}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{bw}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{fonts}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{handout}{\TUL@handouttrue\PassOptionsToClass{handout}{\TUL@baseclass}}
\ProcessOptions\relax

% --- Načtení základní třídy ---
\LoadClass[\TUL@aspectratio]{\TUL@baseclass}

\ifTUL@handout
  \RequirePackage{pgfpages}
  \pgfpagesuselayout{2 on 1}[letterpaper, border shrink=5mm]
\fi

\usepackage{polyglossia}
\setdefaultlanguage{czech}
% \setdefaultlanguage{english}

% FONTY
\usefonttheme[onlymath]{serif} %sazba matematiky jako v article módu, ale malá mezera u mocnin

% sazba matematiky pomocí Fira Math fontu, ale...
% při aplikaci problém s definicí odsazení výčtových prostředí
% při aplikaci nutné upravit matematickou sazbu např. místo \bf dát \symbf
%\usepackage{amsmath} 
%\usepackage[mathrm=sym]{unicode-math}
%\setmathfont{Fira Math}

\setsansfont{Inter}[Mapping=tex-text,BoldFont={* Bold}]
\newfontfamily\TULmono{TULMono-Bold.otf} %{TUL Mono Bold} %když je TUL Mono nainstalován lokálně
\newfontfamily\TULmonoScale[Scale=0.9]{TULMono-Bold.otf}%{TUL Mono Bold} %když je TUL Mono nainstalován lokálně
\renewcommand{\verbatim@font}{\large\bf\ttfamily} %změna strojopisného fontu

\RequirePackage{graphbox}
\RequirePackage{ifthen}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{tikz}

% indikator, ktera fakulta/ustav je aktivni, hodnotu meni volby baliku
\newcommand{\sekce@TUL}{TUL}
% jazykova verze
\newcommand{\TUL@nguage}{CZ}
\newcommand{\CZTUL}{Technick\'a univerzita v~Liberci\&}
\newcommand{\ENTUL}{Technical university of Liberec\&}
\newcommand{\CZthank}{D\v{e}kuji za pozornost}
\newcommand{\ENthank}{Thank you for your attention}
\newcommand{\TUL}{\ifthenelse{\equal{\TUL@nguage}{EN}}{\ENTUL}{\CZTUL}}
\newcommand{\CZTULsoucast}{\CZTUL}
\newcommand{\ENTULsoucast}{\ENTUL}
\newcommand{\CZTULsoucastLine}{\CZTUL}
\newcommand{\ENTULsoucastLine}{\ENTUL}
\newcommand{\TULsoucast}{\ifthenelse{\equal{\TUL@nguage}{EN}}{\ENTULsoucast}{\CZTULsoucast}}
\newcommand{\TULsoucastLine}{\ifthenelse{\equal{\TUL@nguage}{EN}}{\ENTULsoucastLine}{\CZTULsoucastLine}}

\newcommand{\TULthank}{\ifthenelse{\equal{\TUL@nguage}{EN}}{\ENthank}{\CZthank}}

% barvy TUL a jednotlivych fakult
\definecolor{tul}{HTML}{5948AD}
\definecolor{tulgray}{cmyk}{0, 0, 0, 0.8}
\definecolor{tulFS}{HTML}{888B95}
\definecolor{tulFT}{HTML}{924C14}
\definecolor{tulFP}{HTML}{0076D5}
\definecolor{tulEF}{HTML}{65A812}
\definecolor{tulFUA}{HTML}{006443}
\definecolor{tulFM}{HTML}{EA7603}
\definecolor{tulFZS}{HTML}{00B0BE}
\definecolor{tulCXI}{HTML}{C20019}
\newcommand{\tulcolor}{tul}
\newcommand{\titlecolor}{tul}

% kontaktni informace
\newcommand{\TULkontakt@name}{}
\newcommand{\TULname}[1]{\renewcommand{\TULkontakt@name}{#1}}
\newcommand{\TULkontakt@pos}{}
\newcommand{\TULposition}[1]{\renewcommand{\TULkontakt@pos}{#1}}
\newcommand{\TULkontakt@mail}{info@tul.cz}
\newcommand{\TULmail}[1]{\renewcommand{\TULkontakt@mail}{#1}}
\newcommand{\TULkontakt@phone}{+420 485 351 111}
\newcommand{\TULphone}[1]{\renewcommand{\TULkontakt@phone}{#1}}
\newcommand{\TUL@URL}{www.tul.cz}
\newcommand{\TUL@adr}{{Studentsk\'a 1402/2, 461~17 Liberec~1\add@cz}}
\newcommand{\add@cz}{\ifthenelse{\equal{\TUL@nguage}{EN}}{, Czech Republic}{}}
\newcommand{\TULsekce@adr}{}

%tul.sty:
\newcommand{\symbolTULwh}{symbol-tul-wh}

% pisma - priprava
\newboolean{TULf@nts}
\setboolean{TULf@nts}{false}

% prepinac stylu: nazev fakulty/ustavu
\newcommand{\switchTULstyle}[1]{
  \renewcommand{\sekce@TUL}{#1}
  \renewcommand{\tulcolor}{tul#1}
  \renewcommand{\titlecolor}{tul#1}
}

% nastaveni jednotlivych fakult/ustavu: \TUL@<utvar>@setup

\newcommand{\TUL@FS@setup}{\switchTULstyle{FS}%
  \renewcommand{\ENTULsoucast}{Faculty of Mechanical Engineering TUL\&}%
  \renewcommand{\CZTULsoucast}{Fakulta strojn\'\i{} TUL\&}%
  \renewcommand{\ENTULsoucastLine}{\ENTULsoucast}%
  \renewcommand{\CZTULsoucastLine}{\CZTULsoucast}%
  \TULphone{+420 485 353 108}
  \renewcommand{\TUL@URL}{www.fs.tul.cz}
}

\newcommand{\TUL@FT@setup}{\switchTULstyle{FT}%
  \renewcommand{\ENTULsoucast}{Faculty of Textile Engineering TUL\&}%
  \renewcommand{\CZTULsoucast}{Fakulta textiln\'\i{} TUL\&}%
  \renewcommand{\ENTULsoucastLine}{\ENTULsoucast}%
  \renewcommand{\CZTULsoucastLine}{\CZTULsoucast}%
  \TULphone{+420 485 353 452}
  \renewcommand{\TUL@URL}{www.ft.tul.cz}
}

\newcommand{\TUL@FP@setup}{\switchTULstyle{FP}%
  \renewcommand{\ENTULsoucast}{Faculty of Sciences,\\ Humanities and\\ Education TUL\&}%
  \renewcommand{\ENTULsoucastLine}{Faculty of Sciences, Humanities and Education TUL\&}%
  \renewcommand{\CZTULsoucast}{Fakulta\\
    p\v r\'\i{}rodov\v edn\v e-humanitn\'\i{}\\ a pedagogick\'a TUL\&}%
  \renewcommand{\CZTULsoucastLine}{Fakulta
    p\v r\'\i{}rodov\v edn\v e-humanitn\'\i{} a pedagogick\'a TUL\&}%
  \TULphone{+420 485 352 815}
  \renewcommand{\TUL@URL}{www.fp.tul.cz}
  \renewcommand{\TUL@adr}{Univerzitn\'\i{} n\'am\v est\'\i{} 1410/1,
    461~17 Liberec~1\add@cz}
}

\newcommand{\TUL@EF@setup}{\switchTULstyle{EF}%
  \renewcommand{\ENTULsoucast}{Faculty of Economics TUL\&}%
  \renewcommand{\CZTULsoucast}{Ekonomick\'a fakulta TUL\&}%
  \renewcommand{\ENTULsoucastLine}{\ENTULsoucast}%
  \renewcommand{\CZTULsoucastLine}{\CZTULsoucast}%  
  \TULphone{+420 485 352 388}
  \renewcommand{\TUL@URL}{www.ef.tul.cz}
  \renewcommand{\TUL@adr}{Voron\v e\v zsk\'a 1329/13, 460~02 Liberec~2\add@cz}
}

\newcommand{\TUL@FE@setup}{\TUL@EF@setup}

\newcommand{\TUL@FUA@setup}{\switchTULstyle{FUA}%
  \renewcommand{\ENTULsoucast}{Faculty of Arts and Architecture TUL\&}%
  \renewcommand{\CZTULsoucast}{Fakulta um\v en\'\i{} a architektury TUL\&}%
  \renewcommand{\ENTULsoucastLine}{\ENTULsoucast}%
  \renewcommand{\CZTULsoucastLine}{\CZTULsoucast}%  
  \TULphone{+420 485 353 506}
  \TULmail{fua@tul.cz}
  \renewcommand{\TUL@URL}{www.fua.tul.cz}
}

\newcommand{\TUL@FM@setup}{\switchTULstyle{FM}%
  \renewcommand{\ENTULsoucast}{Faculty of Mechatronics,\\ Informatics
    and Interdisciplinary\\ Studies TUL\&}%
  \renewcommand{\ENTULsoucastLine}{Faculty of Mechatronics, Informatics
    and Interdisciplinary Studies TUL\&}%
  \renewcommand{\CZTULsoucast}{Fakulta mechatroniky,\\ informatiky
    a mezioborov\'ych\\ studi\'\i{} TUL\&}%
  \renewcommand{\CZTULsoucastLine}{Fakulta mechatroniky, informatiky
  a mezioborov\'ych studi\'\i{} TUL\&}%
  \TULphone{+420 485 353 757}
  \renewcommand{\TUL@URL}{www.fm.tul.cz}
}

\newcommand{\TUL@FZS@setup}{\switchTULstyle{FZS}%
  \renewcommand{\ENTULsoucast}{Faculty of Health Studies TUL\&}%
  \renewcommand{\CZTULsoucast}{Fakulta zdravotnick\'ych studi\'\i{} TUL\&}%
  \renewcommand{\ENTULsoucastLine}{\ENTULsoucast}%
  \renewcommand{\CZTULsoucastLine}{\CZTULsoucast}%  
  \TULphone{+420 485 353 593}
  \TULmail{fzs@tul.cz}
  \renewcommand{\TUL@URL}{www.fzs.tul.cz}
}

\newcommand{\TUL@CXI@setup}{\switchTULstyle{CXI}%
  \renewcommand{\ENTULsoucast}{Institute for Nanomaterials,\\
    Advanced Technologies\\ and Innovation TUL\&}%
  \renewcommand{\CZTULsoucast}{\'Ustav pro nanomateri\'aly,\\    
    pokro\v cil\'e technologie\\ a inovace TUL\&}%
  \renewcommand{\ENTULsoucastLine}{Institute for Nanomaterials,
    Advanced Technologies and Innovation TUL\&}%
  \renewcommand{\CZTULsoucastLine}{\'Ustav pro nanomateri\'aly,    
    pokro\v cil\'e technologie a inovace TUL\&}%
  \TULphone{+420 485 353 852}
  \TULmail{cxi@tul.cz}
  \renewcommand{\TUL@URL}{www.cxi.tul.cz}
}

% volby baliku
\DeclareOption{EN}{\renewcommand{\TUL@nguage}{EN}}

\DeclareOption{FS}{\TUL@FS@setup}
\DeclareOption{FT}{\TUL@FT@setup}
\DeclareOption{FP}{\TUL@FP@setup}
\DeclareOption{EF}{\TUL@EF@setup}
\DeclareOption{FE}{\TUL@EF@setup}   % nedokumentovana, pro pouziti s databazemi obsahujicimi FE
\DeclareOption{FUA}{\TUL@FUA@setup}
\DeclareOption{FA}{\TUL@FUA@setup}  % pro zpetnou kompatibilitu
\DeclareOption{FM}{\TUL@FM@setup}
\DeclareOption{FZS}{\TUL@FZS@setup}
\DeclareOption{CXI}{\TUL@CXI@setup}

\DeclareOption{bwtitles}{
  \renewcommand{\titlecolor}{black}
}

\DeclareOption{bw}{
%  \renewcommand{\tulcolor}{black!80}
  \renewcommand{\tulcolor}{black}  
  \renewcommand{\titlecolor}{black}
}

\ProcessOptions

\newcommand{\TULsoucastLogo}{\small{\TULmono}\textbf{\color{\tulcolor}\TULsoucast}\normalfont}

\newcommand{\TULsoucastLogoCZ}{\small{\TULmono}\color{\tulcolor}\textbf{\CZTULsoucast}\normalfont}

\newcommand{\TULsoucastLogoEN}{\small{\TULmono}\color{\tulcolor}\textbf{\ENTULsoucast}\normalfont}

\newcommand{\TULsoucastURL}{\TUL@URL}

\mode<presentation>
{
  \useinnertheme{circles}

  % VNĚJŠÍ BAREVNÉ TÉMA NADPISŮ    
  \usecolortheme{whale}  

  % VNITŘNÍ BAREVNÉ TÉMA VÝČTŮ, BLOKŮ ATD.  
  \usecolortheme{orchid} 
  
  \setbeamercolor{title}{fg=white,bg=\tulcolor}
  \setbeamercolor{titlelike}{parent=structure}
  \setbeamercolor{frametitle}{fg=\tulcolor}
  \setbeamercolor{item}{fg=\tulcolor} 
  \setbeamertemplate{navigation symbols}{}% [vertical] % potlačení navigačních symbolů
  \setbeamercolor{block title}{fg=white,bg=gray}%\tulcolor} % předefinování barvy zákl. bloku, při změně barvy na tulcolor by u některých součástí docházelo k problému v rozlišení alert/blok, např. CXI
  
  \setbeamercolor{caption name}{fg=\tulcolor}
  
  \setbeamercolor{bibliography entry author}{fg=black} % literatura černě a ne modře
  \setbeamercolor{bibliography entry title}{fg=black} % literatura černě a ne modře
  \setbeamercolor{bibliography entry journal}{fg=black} % literatura černě a ne modře
  \setbeamercolor{bibliography entry note}{fg=black} % literatura černě a ne modře
  \setbeamertemplate{bibliography item}{}
}

% tvorba loga a proporčního symbolu
\newlength{\mytextsize}
\makeatletter
\setlength{\mytextsize}{\f@size pt}
\makeatother

% Nastavení odsazení názvů slidů
\makeatletter
\setbeamertemplate{frametitle}{
  \ifbeamercolorempty[bg]{frametitle}{}{\nointerlineskip}%
  \@tempdima=\textwidth%
  \advance\@tempdima by\beamer@leftmargin%
  \advance\@tempdima by\beamer@rightmargin%
  \begin{beamercolorbox}[sep=10pt,wd=\the\@tempdima]{frametitle}
    \usebeamerfont{frametitle}%
    \vbox{}\vskip-1ex%
    \if@tempswa\else\csname beamer@ftecenter\endcsname\fi%
    \strut\textbf{\hspace*{-0.4pt}\insertframetitle}\strut\par%
    {%
      \ifx\insertframesubtitle\@empty%
      \else%
      {\usebeamerfont{framesubtitle}\usebeamercolor[fg]{framesubtitle}\textbf{\hspace*{-0.4pt}\insertframesubtitle}\strut\par}%
      \fi
    }%
    \vskip-1ex%
    \if@tempswa\else\vskip-.3cm\fi
  \end{beamercolorbox}%
}
\makeatother

\usepackage{changepage}

%============================================================================
% TITULNÍ STRANA
%============================================================================
\makeatletter
\def\TULtitleframe{
  \setbeamercolor{background canvas}{bg=\tulcolor}
  \begin{frame}[plain]
  \begin{tikzpicture}[remember picture,overlay]
    \node[below right,inner sep=10pt] at (current page.north west){
      \begin{minipage}[t]{\textwidth}
        \TULmonoScale \footnotesize\textbf{\color{white}\TULsoucast}
        \normalfont
      \end{minipage}
    };
    \node[below left,inner sep=10pt] at (current page.north east){
      \includegraphics[align=t,height=58.5pt]{\symbolTULwh}
    };
    \node[below right,inner xsep=20pt,inner ysep=0.34\paperheight] at (current page.north west){ 
      \begin{minipage}[t]{0.95\textwidth}
        \color{white}
        {\bf \Huge \inserttitle}
          
        \vspace*{0.07\textheight}                   
          
        \textbf{\LARGE\insertsubtitle}
      \end{minipage}   
    };    
    \node[above right,inner sep=20pt] at (current page.south west){  
      \begin{minipage}[t]{\textwidth}
        \color{white}
        \textbf{\insertauthor}
      
        \insertinstitute
        
        \vspace*{1em}
        \authorPhone
        
        \authorMail 
      \end{minipage}
    };
    \ifTUL@extlogo
   %    \node[above left,inner sep=10pt] at (current page.south east){
   %        \includegraphics[height=1cm]{\TULextlogofile}
  	% };
        \node[anchor=south east, inner sep=10pt] at (current page.south east) (main_node) {};
        \node[anchor=south east] at ([yshift=1.6cm,xshift=-5pt]main_node.south east) {\includegraphics[width=1.3cm]{cc-by-sa.pdf}};
        \node[anchor=south east] at ([yshift=5pt,xshift=-5pt]main_node.south east) {\includegraphics[height=1cm]{\TULextlogofile}};
    \fi
  \end{tikzpicture}
  \end{frame}
\setbeamercolor{background canvas}{bg=white}
}
\makeatother
%===============================================================================
% ZÁHLAVÍ KAŽDÉHO SLAJDU
%===============================================================================
\setbeamertemplate{headline}{
  \vspace*{5pt}
  \color{\tulcolor}
  ~\hspace{6.5pt}  \insertshorttitle
}
%===============================================================================
\setbeamertemplate{footline}{
  ~\hspace*{5pt}  
  \TULmono
  \tiny\color{\tulcolor}
  \hspace*{1pt}\textbf{\TULsoucastLine} ~\hfill \insertframenumber\,/\,\inserttotalframenumber \hspace*{5pt}~\vspace*{5pt}
  \normalfont
}
%===============================================================================
% ÚPRAVA BARVY TEXTU V OBSAHU 
%===============================================================================
\setbeamercolor{section in toc}{fg=black}
\setbeamercolor{subsection in toc}{fg=black}
\setbeamercolor{subsubsection in toc}{fg=black}
\setbeamercolor{button}{bg=\tulcolor}
\setbeamertemplate{subsection in toc}{%
  \leavevmode\leftskip=1em{\color{\tulcolor}$\bullet$}\hskip0.5em\inserttocsubsection\par
}
\setbeamertemplate{subsubsection in toc}{%
  \leavevmode\leftskip=2em{\color{\tulcolor}$\bullet$}\hskip0.5em\inserttocsubsubsection\par
}

\hypersetup{colorlinks,linkcolor=,citecolor=\tulcolor, urlcolor=\tulcolor}

%===============================================================================
% POSLEDNÍ STRANA PREZENTACE
%===============================================================================
\makeatletter
\def\TULendframe{
  \setbeamercolor{background canvas}{bg=\tulcolor}
  \begin{frame}[plain]
      \begin{tikzpicture}[remember picture,overlay]
        \node[below right,inner sep=10pt] at (current page.north west){
          \begin{minipage}[t]{\textwidth}
            \TULmono\footnotesize\textbf{\color{white}\TULsoucast}
            \normalfont
          \end{minipage}
        };
        \node[below left,inner sep=10pt] at (current page.north east){
          \includegraphics[align=t,height=58.5pt]{\symbolTULwh}
        };   
        \node[above right,inner sep=20pt] at (current page.south west){  
          \begin{minipage}[t]{\textwidth}
            \color{white}
            {\bf {\LARGE \TULthank}} \\
            \vspace*{5em}
            
            \textbf{\insertauthor}
            
            \insertinstitute
            
            \vspace*{1em}
            \authorPhone
            
            \authorMail 
          \end{minipage}
        };
      \end{tikzpicture}
    \end{frame}
  \setbeamercolor{background canvas}{bg=white}
}
\makeatother

\makeatletter
% Beamer margin
\setbeamersize
{
  text margin left=1em, %1.35em  nastavení je optimální zarovnání bloků, číslovaných výčtů a obsahu s názvem slajdu, které přesahují hranici textového pole
  text margin right=2em
%  sidebar width left = 1em,
%  sidebar width right=2em,
%  description width=2em
}
%\setlength{\leftmargini}{1em}
\settowidth{\leftmargini}{\usebeamertemplate{itemize item}}
\addtolength{\leftmargini}{0.9em}%{\labelsep}
\settowidth{\leftmarginii}{\usebeamertemplate{itemize item}}
\addtolength{\leftmarginii}{\labelsep}
\settowidth{\leftmarginiii}{\usebeamertemplate{itemize item}}
\addtolength{\leftmarginiii}{\labelsep}
\makeatother

% Change standard block width
% \addtobeamertemplate{block begin}{%
%  \setlength{\textwidth}{0.8\textwidth}
% \leftskip=20ex% HERE YOU SET THE DESIRED LEFT MARGIN
% %%\addtolength{\textwidth}{-\leftskip}%
% }{}
% Change alert block width
\addtobeamertemplate{block alerted begin}{%
%  \leftskip=0.5\textwidth\usebeamerfont{block body}
 \centering%
  \setlength{\textwidth}{1.0\textwidth}
% \leftskip=20ex% HERE YOU SET THE DESIRED LEFT MARGIN
%  \addtolength{\textwidth}{-\leftskip}%
}{}
% Change example block width
\addtobeamertemplate{block example begin}{%
  \setlength{\textwidth}{1.0\textwidth}
}{}

\defbeamertemplate{section in toc}{my toc}{%
  \leavevmode{\Large\color{\tulcolor}$\bullet$} { \inserttocsection}}

\setbeamertemplate{sections/subsections in toc}[my toc]