\ProvidesClass{jhps}[2020/07/06 v1]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass[a4paper,11pt]{article}

\usepackage[utf8]{inputenc}
\usepackage[usenames,dvipsnames,svgnames,table]{xcolor}
\usepackage[english]{babel}
\usepackage{geometry}
\newgeometry{left=3cm,bottom=2.5cm,right=2.5cm,top=2.5cm}

\usepackage[breakwords]{truncate}
\usepackage[cmex10]{amsmath}
\usepackage{titling}
\usepackage{hyperref}
\usepackage{graphicx}
\usepackage{cleveref}
\usepackage{fancyhdr}
\usepackage[table]{xcolor}
\usepackage{tikz}
\usepackage{floatrow}
\usepackage{colortbl}
\usepackage{listings}%utf8
\usepackage{chngcntr}
\usepackage{caption}
\usepackage{subcaption}
\usepackage{pgffor}
\usepackage{marvosym}

%%%% END packages

\newtoks\email
\newtoks\affiliation
\newtoks\JHPSissue
\newtoks\JHPSkeywords

\bibliographystyle{alpha}

\graphicspath{ {./assets/} }

\date{\today}

\definecolor{JHPSRed}{HTML}{ee2d24}
\definecolor{tblhead}{HTML}{cccccc}
\definecolor{JHPSGray}{HTML}{cccccc}
\definecolor{Blue2}{HTML}{006d9a}
\definecolor{Green1}{HTML}{9ac013}
\definecolor{Green2}{HTML}{007000}

\hypersetup{
    colorlinks,
    linkcolor={JHPSRed},
    citecolor={JHPSRed},
    filecolor={JHPSRed},
    urlcolor={JHPSRed},
    anchorcolor={JHPSRed}
}

\renewcommand\UrlFont{\color{JHPSRed}}

\lstset{postbreak=\raisebox{0ex}[0ex][0ex]{\ensuremath{\color{blue}\hookrightarrow\space}},
  basicstyle=\fontsize{9}{8}\ttfamily,        % the size of the fonts that are used for the code
  breakatwhitespace=false,         % sets if automatic breaks should only happen at whitespace
  breaklines=true,                 % sets automatic line breaking
  captionpos=b,                    % sets the caption-position to bottom
  %commentstyle=\color{mygreen},    % comment style
  %deletekeywords={...},            % if you want to delete keywords from the given language
  escapeinside={\%*}{*)},          % if you want to add LaTeX within your code
  extendedchars=false,              % if true, lets you use non-ASCII characters; for 8-bits encodings only, does not work with UTF-8
  frame={bt},	                     % adds a frame around the code frame={bt},
  keepspaces=true,                 % keeps spaces in text, useful for keeping indentation of code (possibly needs columns=flexible)
  keywordstyle=\bf\ttfamily,       % keyword style
  %language=C,                     % the language of the code
  %morekeywords={*,...},           % if you want to add more keywords to the set
  numbers=left,                    % where to put the line-numbers; possible values are (none, left, right)
  xleftmargin=4ex,
  numbersep=2.5ex,                   % how far the line-numbers are from the code
  numberstyle=\tiny\color{darkgray}, % the style that is used for the line-numbers
  rulecolor=\color{JHPSRed},         % if not set, the frame-color may be changed on line-breaks within not-black text (e.g. comments (green here))
  showspaces=false,                % show spaces everywhere adding particular underscores; it overrides 'showstringspaces'
  showstringspaces=false,          % underline spaces within strings only
  showtabs=false,                  % show tabs within strings adding particular underscores
  stepnumber=1,                    % the step between two line-numbers. If it's 1, each line will be numbered
  %stringstyle=\color{mymauve},     % string literal style
  tabsize=2,	                   % sets default tabsize to 2 spaces
  title=\lstname,%,
  %backgroundcolor=\color{JHPSGray}
  keywordstyle=\color{Green2}\ttfamily,
  stringstyle=\color{JHPSRed}\ttfamily,
  commentstyle=\color{Blue2}\ttfamily,
  morecomment=[l][\color{magenta}]{\#}
}

\lstdefinelanguage{bibtex}{
    keywords={@article,@misc},
    sensitive=false,
    comment=[l]{\%}
}

\lstdefinelanguage{none}{
    morekeywords={},
    sensitive=false
}


\crefname{lstlisting}{listing}{listing}
\Crefname{lstlisting}{Listing}{Listing}

% Figure/Table placement
\def\fps@figure{!pb}
\def\fps@table{!pb}
\newfloat{lstfloat}{!pb}{lop}
\floatname{lstfloat}{Listing}
\def\lstfloatautorefname{Listing}

\setlength\headheight{18pt}



\makeatletter
\newcount\authorcount
\def\storedata#1#2{\edef\tmp{\string#1}\storedataA#2\end\advance\authorcount by-1}
\def\storedataA#1{\advance\authorcount by1
   \ifx\end#1
   \else
      \expandafter\def\csname data:\tmp:\the\authorcount\endcsname{#1}%
      \expandafter\storedataA
   \fi
}
\def\getdata[#1]#2{\csname data:\string#2:#1\endcsname}
\def\basiceval#1{\the\numexpr#1\relax}

\def\JHPSauthor#1#2#3#4{
  \storedata\Jauthor{{#1}}
  \storedata\Jauthor{{#2}}
  \storedata\Jauthor{{#3}}
  \storedata\Jauthor{{#4}}
}

\renewcommand*{\maketitle}{
  \pagestyle{plain}
  \thispagestyle{title}

  \ifnum\the\JHPSissue>0
  \else
    This manuscript is in the JHPS incubator and has \textbf{not been assigned an issue}. \\[0.2cm]
    %\begin{minipage}{11cm}
    %\tableofcontents
    %\end{minipage}
    \vspace*{-2cm}
  \fi

  \vskip 2em%
  \begin{center}%
    \begin{tikzpicture}
      \path [left color = JHPSRed!80, right color = JHPSRed!80]
        (0,0) rectangle (\hsize,0.25ex);
    \end{tikzpicture}
    {\huge \@title \par}%
    \begin{tikzpicture}
      \path [left color = JHPSRed!80, right color = JHPSRed!80]
        (0,0) rectangle (\hsize,0.25ex);
    \end{tikzpicture}

    \vspace*{-0.25cm}

    {\hfill\tiny \hyperref[sec:reviews]{Reviews}} % \framebox[4cm]{

    \vskip 1.2em%

    % authors
    \newcommand{\jauthorcount}{\basiceval{\the\authorcount/4}}
    \foreach\index in {1,...,\jauthorcount}{
    \def\val{\basiceval{12/\jauthorcount}}
    \ifnum \val>3
    \else \def\val{3.8}
    \fi
    %\fbox{ % for debuggin
    \begin{minipage}[t]{\val cm}
      \centering
      \href{\getdata[\basiceval{\index*4-1}]\Jauthor}{\textcolor{black}{\large \getdata[\basiceval{\index*4-3}]\Jauthor}} \par

      \smallskip

      \getdata[\basiceval{\index*4-2}]\Jauthor \par

      \def\val{\getdata[\basiceval{\index*4}]\Jauthor}
      \if \val
      \else \smallskip \Letter~\textit{\val}
      \fi
      \vspace*{1.5em}
    \end{minipage}
    }
    %}
  \end{center}%
}

\renewenvironment{abstract}{%
  \vspace*{-1.1cm}
    \small
    \null\vfil
    \begin{center}%
        {\bfseries \abstractname\vspace{-.5em}\vspace{0pt}}%
    \end{center}%
    \quotation
}
{\par \smallskip \textbf{Keywords}: \the\JHPSkeywords \endquotation\vfil\null \vspace*{-0.75cm}}

\newcommand{\fancyRulers}{
\renewcommand\footrule{\begin{minipage}{1\textwidth}
  \begin{tikzpicture}
    \path [left color = JHPSGray!100, right color = JHPSRed!80]
      (0,0) rectangle (\hsize,0.25ex);
  \end{tikzpicture}
\end{minipage}\par}%
\renewcommand\headrule{
\vspace*{-0.5em}
  \begin{tikzpicture}
    \path [left color = JHPSGray!100, right color = JHPSRed!80] (0,0) rectangle (\hsize,0.25ex);
  \end{tikzpicture}}%
}

\newcommand{\fancyFootRulers}{
\renewcommand\footrule{\begin{minipage}{1\textwidth}
  \begin{tikzpicture}
    \path [left color = JHPSGray!100, right color = JHPSRed!80]
      (0,0) rectangle (\hsize,0.25ex);
  \end{tikzpicture}
\end{minipage}\par}%
\renewcommand\headrule{}
}

% \makeatletter
% \global\let\tikz@ensure@dollar@catcode=\relax
% \makeatother

\fancypagestyle{plain}{
  \fancyRulers
  \fancyhead[L]{}
  \fancyhead[R]{\@date} %\leftmark
  \fancyhead[L]{\truncate{12cm}{\thetitle}}
  \fancyfoot[C]{}
  \fancyfoot[R]{\thepage/\pageref*{LastPage}}
  \fancyfoot[L]{\includegraphics[height=0.8em]{jhps-logo} This article \ifnum\the\JHPSissue>0 appeared in the \href{https://jhps.vi4io.org/issue/\the\JHPSissue}{Journal of High-Performance Storage, \the\JHPSissue}\else is in the incubator of the \href{https://jhps.vi4io.org/incubator/}{Journal of High-Performance Storage}\fi }
}

\fancypagestyle{title}{
  \fancyFootRulers
  \fancyhead[L]{}
  \fancyhead[R]{} %\leftmark
  \fancyhead[C]{}
  \fancyfoot[C]{}
  \fancyfoot[R]{\thepage/\pageref*{LastPage}}
  \fancyfoot[L]{\includegraphics[height=0.8em]{jhps-logo} This article \ifnum\the\JHPSissue>0 appeared in the \href{https://jhps.vi4io.org/issue/\the\JHPSissue}{Journal of High-Performance Storage, \the\JHPSissue}\else is in the incubator of the \href{https://jhps.vi4io.org/incubator/}{Journal of High-Performance Storage}\fi }
}

\fancypagestyle{reviews}{
  \fancyFootRulers
  \fancyhead[L]{}
  \fancyhead[R]{\@date} %\leftmark
  \fancyhead[L]{\truncate{12cm}{\thetitle}}
  \fancyfoot[C]{Reviews}
  \fancyfoot[R]{\thepage}
  \fancyfoot[L]{\includegraphics[height=0.8em]{jhps-logo}}
}

\fancypagestyle{empty}{
  \fancyFootRulers
  \fancyhead[L]{}
  \fancyhead[R]{}
  \fancyfoot[C]{}
  \fancyfoot[R]{}
  \fancyfoot[L]{}
}

\let\oldtabular\tabular
\let\endoldtabular\endtabular
\renewenvironment{tabular}{\rowcolors{2}{white}{lightgray!20!white}\oldtabular}{\endoldtabular}

\newcommand{\tab}{\hspace{9pt}}
\newcommand{\cellHeader}[0]{\cellcolor{JHPSRed}}

\newcommand{\ra}[1]{\renewcommand{\arraystretch}{#1}}
\newcolumntype{M}[1]{>{\centering\arraybackslash}m{#1}}


%% The review bottom
\newcommand{\reviews}{
  \label{LastPage}

  \clearpage
  \pagestyle{reviews}
  \section{Reviews}
  \label{sec:reviews}
  \textit{This section is optional for reviewers and shows their assessment that lead to the acceptance of the original manuscript. Reviewers may or may not update their review for a major update of the paper, the exact trail is available in GitHub repository of this article. The reviews are part of the article and validate the acceptance. Please check the details on the JHPS webpage.}

  \ifnum\the\JHPSissue>0
  \else
  Fine-grained comments and suggestions should be added directly to the manuscript in the Google Doc on the top using “Suggesting” mode (top right, underneath the blue share button).
  \fi
}


\endinput
