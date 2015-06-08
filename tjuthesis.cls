%# -*- coding: utf-8-unix -*-
%==================================================
%% TJUthesis.cls for TJU Master Thesis
%% Based on https://github.com/weijianwen/SJTUThesis
%%==================================================


\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{tjuthesis}[2015/06/07 v0.1 Shanghai Tongji University Template]
\def\version{v0.1}
\newif\iftju@bachelor\tju@bachelorfalse
\newif\iftju@master\tju@masterfalse
\newif\iftju@doctor\tju@doctorfalse
\newif\iftju@review\tju@reviewfalse
\newif\iftju@submit\tju@submitfalse
\DeclareOption{bachelor}{\tju@bachelortrue}
\DeclareOption{master}{\tju@mastertrue}
\DeclareOption{doctor}{\tju@doctortrue}
\DeclareOption{review}{\tju@reviewtrue}
\DeclareOption{submit}{\tju@submittrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
\LoadClass[a4paper,fancyhdr,fntef,UTF8]{ctexbook}
\iftju@bachelor\relax\else
  \iftju@master\relax\else
    \iftju@doctor\relax\else
      \ClassError{tjuthesis}%
      		{You have to specify one of thesis options: bachelor, master or doctor.}{}
    \fi
  \fi
\fi

%% tjuthesis.cls segments
% 0. Import tjuthesis.cfg
% 1. Import and configure LaTeX packages.
% 2. Define general-purpose LaTeX commands. 
% 3. Configure the imported packages, also extend LaTeX command in tjuthesis
% 4. Draw the tjuthesis

%==========
% Segment 0. Import tjuthesis.cfg 
%==========

%% 导入 tjuthesis.cfg 文件
\AtEndOfClass{\input{tjuthesis.cfg}}


%==========
% Segment 1. Import LaTeX packages.
%==========

\RequirePackage[centering,a4paper,body={16cm,22cm}]{geometry} %设置版面
\RequirePackage{lastpage}
\RequirePackage{fontspec}
\RequirePackage{metalogo,doc}
\RequirePackage{threeparttable}
\RequirePackage{dcolumn}
\RequirePackage{multirow}
\RequirePackage{booktabs}
\RequirePackage{mathtools,amsthm,amsfonts,amssymb,bm,mathrsfs} 
\RequirePackage{upgreek}
\RequirePackage{graphicx}
\RequirePackage{subfigure}
\RequirePackage{ccaption}
\RequirePackage[backend=biber, style=caspervector,utf8, bibencoding=utf8, sorting=none]{biblatex}
\RequirePackage{xcolor}
\RequirePackage{wasysym}
\RequirePackage{listings}
\RequirePackage[xetex, bookmarksnumbered, colorlinks, urlcolor=black, linkcolor=black, citecolor=black, plainpages=false, pdfstartview=FitH]{hyperref}
\RequirePackage{longtable}
\RequirePackage[perpage, bottom]{footmisc}
\RequirePackage{enumitem}
\RequirePackage{pdfpages}
\RequirePackage{calc}
\RequirePackage{algorithm, algorithmic}

%==========
% Segment 2. Define general-purpose LaTeX commands.
%==========

\setcounter{secnumdepth}{4}  % 章节编号深度 (part 对应 -1)
\setcounter{tocdepth}{2}     % 目录深度 (part 对应 -1)
    
% User defined command list
%% \me \mi \mj \dif \cleardoublepage \cndash \CJKLaTeX

% A new column type
\newcolumntype{d}[1]{D{.}{.}{#1}}% or D{.}{,}{#1} or D{.}{\cdot}{#1}

% upper math letter
\newcommand{\me}{\mathrm{e}} 
\newcommand{\mi}{\mathrm{i}}
\newcommand{\mj}{\mathrm{j}}
\newcommand{\dif}{\mathrm{d}}

\def\cleardoublepage{\clearpage%
	\if@openright%
	  \ifodd
	    \c@page%
	  \else%
  	    \thispagestyle{empty}%
  	    \hbox{}%
	    \newpage%
	  \fi%
	\fi}

% CJK-LaTeX Logo \CJKLaTeX
\newcommand{\CJKLaTeX}{CJK--\LaTeX} 

% cndash
\newcommand{\cndash}{\rule{0.0em}{0pt}\rule[0.35em]{1.4em}{0.05em}\rule{0.2em}{0pt}}

%==========
% Segment 3. Configure the imported packages, also extend LaTeX command in tjuthesis
%==========

% Set the mainfont
\setmainfont[Path=./fonts/]{texgyrepagella-regular.otf}

%% 行距缩放因子
\linespread{1.3}

%% CTeX Settings
% 名称：目录、表格索引、插图索引、算法、算法索引、代码
\CTEXoptions[contentsname={\tju@contentsname}]
\CTEXoptions[listfigurename={\tju@listfigurename}]
\CTEXoptions[listtablename={\tju@listtablename}]
\floatname{algorithm}{\tju@label@algo}
\renewcommand{\listalgorithmname}{\tju@listalgorithmname}
\renewcommand{\lstlistingname}{\tju@value@listingname}
% Title Settings at the chapter Level
\CTEXsetup[nameformat={\Large\bfseries}]{chapter}
\CTEXsetup[titleformat={\Large\bfseries}]{chapter}
\CTEXsetup[beforeskip={15\p@}]{chapter}
\CTEXsetup[afterskip={12\p@}]{chapter}
% Title Settings at the section Level
\CTEXsetup[format={\large\bfseries}]{section}
\CTEXsetup[beforeskip={-3ex \@plus -1ex \@minus -.2ex}]{section}
\CTEXsetup[afterskip={1.0ex \@plus .2ex}]{section}
% Title Settings at the subection Level
\CTEXsetup[format={\bfseries\normalsize}]{subsection}
\CTEXsetup[indent={0\ccwd}]{subsection}
\CTEXsetup[beforeskip={-2.5ex \@plus -1ex \@minus -.2ex}]{subsection}
\CTEXsetup[afterskip={1.0ex \@plus .2ex}]{subsection}
% Title Settings at the subsubection Level
\CTEXsetup[format={\normalfont\normalsize}]{subsubsection}
\CTEXsetup[indent={0\ccwd}]{subsubsection}
\CTEXsetup[beforeskip={-2ex \@plus -1ex \@minus -.2ex}]{subsubsection}
\CTEXsetup[afterskip={1.0ex \@plus .2ex}]{subsubsection}

% bullets in the item
\renewcommand{\labelitemi}{\ensuremath{\bullet}}

%% Graphic path & file extension
\graphicspath{{fig/}{figure/}{figures/}{logo/}{logos/}{graph/}{graphs}}
\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.jpeg}

% Caption setting in ccaption pacakge
\captiondelim{\ }
\captionnamefont{\kaishu\small}
\captiontitlefont{\kaishu\small}

% Floating parameters
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}

% 定公式、图、表、算法的编号为"3-1"的形式，即分隔符由.变为短杠
\renewcommand{\theequation}{\arabic{chapter}--\arabic{equation}}
\renewcommand{\thefigure}{\arabic{chapter}--\arabic{figure}}
\renewcommand{\thetable}{\arabic{chapter}--\arabic{table}}
\renewcommand{\thealgorithm}{\arabic{chapter}--\arabic{algorithm}}

% Setting Package listings/lstlistings
\lstset{tabsize=4, %
  frame=shadowbox, %把代码用带有阴影的框圈起来
  commentstyle=\color{red!50!green!50!blue!50},%浅灰色的注释
  rulesepcolor=\color{red!20!green!20!blue!20},%代码块边框为淡青色
  keywordstyle=\color{blue!90}\bfseries, %代码关键字的颜色为蓝色，粗体
  showstringspaces=false,%不显示代码字符串中间的空格标记
  stringstyle=\ttfamily, % 代码字符串的特殊格式
  keepspaces=true, %
  breakindent=22pt, %
  numbers=left,%左侧显示行号
  stepnumber=1,%
  numberstyle=\tiny, %行号字体用小号
  basicstyle=\footnotesize, %
  showspaces=false, %
  flexiblecolumns=true, %
  breaklines=true, %对过长的代码自动换行
  breakautoindent=true,%
  breakindent=4em, %
  aboveskip=1em, %代码块边框
  %% added by http://bbs.ctex.org/viewthread.php?tid=53451
  fontadjust,
  captionpos=t,
  framextopmargin=2pt,framexbottommargin=2pt,abovecaptionskip=-3pt,belowcaptionskip=3pt,
  xleftmargin=4em,xrightmargin=4em, % 设定listing左右的空白
  texcl=true,
  % 设定中文冲突，断行，列模式，数学环境输入，listing数字的样式
  extendedchars=false,columns=flexible,mathescape=true
  numbersep=-1em
}

% 定理环境
\theoremstyle{plain}
  \newtheorem{algo}{\tju@label@algo~}[chapter]
  \newtheorem{thm}{\tju@label@thm~}[chapter]
  \newtheorem{lem}[thm]{\tju@label@lem~}
  \newtheorem{prop}[thm]{\tju@label@prop~}
  \newtheorem{cor}[thm]{\tju@label@cor~}
\theoremstyle{definition}
  \newtheorem{defn}{\tju@label@defn~}[chapter]
  \newtheorem{conj}{\tju@label@conj~}[chapter]
  \newtheorem{exmp}{\tju@label@exmp~}[chapter]
  \newtheorem{rem}{\tju@label@rem~}
  \newtheorem{case}{\tju@label@case~}
\theoremstyle{break}
  \newtheorem{bthm}[thm]{\tju@label@thm~}
  \newtheorem{blem}[thm]{\tju@label@lem~}
  \newtheorem{bprop}[thm]{\tju@label@prop~}
  \newtheorem{bcor}[thm]{\tju@label@cor~}
  \renewcommand{\proofname}{\bf\tju@label@proof}
\newtheoremstyle{break}% name
  {}%      Space above, empty = `usual value'
  {}%      Space below
  {\itshape}% Body font
  {}%         Indent amount (empty = no indent, \parindent = para indent)
  {\bfseries}% Thm head font
  {.}%        Punctuation after thm head
  {\newline}% Space after thm head: \newline = linebreak
  {}%         Thm head spec

%==========
% Segment 4. Draw the tjuthesis
%==========

\newcommand\classification[1]{\def\tju@value@classification{#1}}
\newcommand\studentnumber[1]{\def\tju@value@studentnumber{#1}}
\newcommand\confidential[1]{\def\tju@value@confidential{#1}}
\newcommand\school[1]{\def\tju@value@school{#1}}
\newcommand\degree[1]{\def\tju@value@degree{#1}}
\renewcommand\title[2][\tju@value@title]{%
  \def\tju@value@title{#2}
  \def\tju@value@titlemark{\MakeUppercase{#1}}}
\renewcommand\author[1]{\def\tju@value@author{#1}}
\newcommand\advisor[1]{\def\tju@value@advisor{#1}}
\newcommand\coadvisor[1]{\def\tju@value@coadvisor{#1}}
\newcommand\major[1]{\def\tju@value@major{#1}}
\newcommand\submitdate[1]{\def\tju@value@submitdate{#1}}
\newcommand\defenddate[1]{\def\tju@value@defenddate{#1}}
\newcommand\institute[1]{\def\tju@value@institute{#1}}
\newcommand\chairman[1]{\def\tju@value@chairman{#1}}

% “绘制”tju中文标题页
\renewcommand\maketitle[1]{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
  {\songti\zihao{-3}\tju@label@statement}
  \vskip\stretch{1}
  {\heiti\zihao{3}\tju@value@title}
  \vskip\stretch{1}
  {\fangsong\zihao{4}}
  \def\tabcolsep{1pt}
  \def\arraystretch{1.5}
  \begin{tabular}{rl}
    \iftju@review
      \begin{CJKfilltwosides}{4em}\heiti\tju@label@author\end{CJKfilltwosides} & \underline{\makebox[150pt]{}}\\
      \begin{CJKfilltwosides}{4em}\heiti\tju@label@studentnumber\end{CJKfilltwosides} & \underline{\makebox[150pt]{}} \\
      \begin{CJKfilltwosides}{4em}\heiti\tju@label@advisor\end{CJKfilltwosides}  & \underline{\makebox[150pt]{}} \\ 
      \ifx\tju@value@coadvisor\undefined\else
        \begin{CJKfilltwosides}{4em}\heiti\tju@label@coadvisor\end{CJKfilltwosides} & \underline{\makebox[150pt]{}} \\ 
      \fi
    \else
      \begin{CJKfilltwosides}{4em}\heiti\tju@label@author\end{CJKfilltwosides}	& \underline{\makebox[150pt]{\tju@value@author}} \\
      \begin{CJKfilltwosides}{4em}\heiti\tju@label@studentnumber\end{CJKfilltwosides} & \underline{\makebox[150pt]{\tju@value@studentnumber}} \\
      \begin{CJKfilltwosides}{4em}\heiti\tju@label@advisor\end{CJKfilltwosides} 	 & \underline{\makebox[150pt]{\tju@value@advisor}} \\ 
      \ifx\tju@value@coadvisor\undefined\else
        \begin{CJKfilltwosides}{4em}\heiti\tju@label@coadvisor\end{CJKfilltwosides} 	 & \underline{\makebox[150pt]{\tju@value@coadvisor}} \\ 
      \fi
    \fi
      \begin{CJKfilltwosides}{4em}\heiti\tju@label@major\end{CJKfilltwosides} 	 & \underline{\makebox[150pt]{\tju@value@major}} \\
      \begin{CJKfilltwosides}{4em}\heiti\tju@label@defenddate\end{CJKfilltwosides} 	 & \underline{\makebox[150pt]{\tju@value@defenddate}}
  \end{tabular}
  \end{center}
  \vskip \stretch{0.5}
  \cleardoublepage
}


% English Title Page
\newcommand\englishtitle[1]{\def\tju@value@englishtitle{#1}}
\newcommand\englishauthor[1]{\def\tju@value@englishauthor{#1}}
\newcommand\englishadvisor[1]{\def\tju@value@englishadvisor{#1}}
\newcommand\englishcoadvisor[1]{\def\tju@value@englishcoadvisor{#1}}
\newcommand\englishschool[1]{\def\tju@value@englishschool{#1}}
\newcommand\englishinstitute[1]{\def\tju@value@englishinstitute{#1}}
\newcommand\englishdate[1]{\def\tju@value@englishdate{#1}}
\newcommand\englishdegree[1]{\def\tju@value@englishdegree{#1}}
\newcommand\englishmajor[1]{\def\tju@value@englishmajor{#1}}
% "绘制"英文标题页
\newcommand\makeenglishtitle[1]{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
      {\normalfont\zihao{4} \tju@label@englishstatement} 
      \vspace{20pt} \vskip\stretch{1}
      {\huge\tju@value@englishtitle} 
      \vskip \stretch{1}
    \iftju@review
      \vskip \stretch{1}
      \vskip 3pt
      \vskip \stretch{2}
    \else
      {\normalfont\zihao{4}\tju@value@englishauthor} 
      \vskip \stretch{1}
      {\normalfont\zihao{4}\tju@label@englishadvisor} 
      \vskip 2pt
      {\normalfont\zihao{4}\tju@value@englishadvisor} 
      \vskip 5pt
      \ifx\tju@value@englishcoadvisor\undefined\else
        {\normalfont\zihao{4}\tju@label@englishcoadvisor} 
        \vskip 2pt
        {\normalfont\zihao{4}\tju@value@englishcoadvisor} 
        \vskip \stretch{2}
      \fi
    \fi 
    \normalfont\tju@value@englishinstitute \vskip 30pt
    \normalfont\tju@value@englishdate \vskip 20pt
  \end{center}
  \cleardoublepage
}

% 原创性声明
\newcommand\makeDeclareOriginal{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
  	{\bf\zihao{3} \tju@value@school}\\
  	{\bf\zihao{3} \tju@label@original}
  \end{center}
  \vskip 10pt
  {\par\zihao{-4}\tju@label@originalcontent\par}
  \vskip 60pt
  \hspace{13em}\tju@label@authorsign\hrulefill\hspace{1.5em}
  \vskip 15pt
  \hspace{16em}\tju@label@originalDate\hspace{1em}
  \cleardoublepage
}


% 授权声明
\newcommand\makeDeclareAuthorization{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
  	{\bf\zihao{3} \tju@value@school}\\
  	{\bf\zihao{3} \tju@label@authorization}
  \end{center}
  \vskip 10pt
  {\par\zihao{-4}\tju@label@authorizationcontent\par}
  \vskip 60pt
  \tju@label@authorsign\hrulefill\hspace{3em}\tju@label@Supervisorsign\hrulefill
  \vskip 15pt
  \tju@label@originalDate\hfill\hspace{3em}\tju@label@originalDate
  \cleardoublepage
}

% fancyhdr页眉页脚设置
\iftju@bachelor
	% 本科学位论文页眉页脚设置
	%% 正文页眉页脚
	\fancypagestyle{main}{
	  \fancyhf{}
	  \fancyhead[L]{\includegraphics[width=0.22\textwidth]{figure/tjubanner}}
	  \fancyhead[R]{\nouppercase{\small\kaishu\tju@value@titlemark}}
	  \fancyfoot[C]{\small 第~{\bfseries\thepage}~页\,共~{\bfseries\pageref{LastPage}}~页}
	  \renewcommand{\headheight}{32pt}
	}
	%% 开章页页眉页脚
	\fancypagestyle{plain}{% 设置开章页页眉页脚风格(只有页码作为页脚)
	  \fancyhf{}%
	  \fancyhead[L]{\nouppercase{\small\kaishu\includegraphics[width=0.22\textwidth]{figure/tjubanner}}}
	  \fancyhead[R]{\nouppercase{\small\kaishu\tju@value@titlemark}}
	  \fancyfoot[C]{\small 第~{\bf\thepage}~页\,共~{\bf\pageref{LastPage}}~页}
	  \renewcommand{\headheight}{32pt}
	}
\else
	% 研究生学位论文页眉页脚设置
	\if@twoside
	  %% 正文页眉页脚
	  \fancypagestyle{main}{
	    \fancyhead[LO, RE]{\small\kaishu\tju@value@school\tju@value@degree\tju@label@thesis}
	    \fancyhead[RO]{\nouppercase{\small\kaishu\leftmark}}
	    \fancyhead[LE]{\nouppercase{\small\kaishu\tju@value@titlemark}}
	    \fancyfoot[C]{\small ---~{\bfseries\thepage}~---}
	    \renewcommand{\headheight}{32pt}
	  }
	  %% 开章页页眉页脚
	  \fancypagestyle{plain}{
	    \fancyhf{}
	    \fancyhead[LO,RE]{\nouppercase{\small\kaishu\tju@value@school\tju@value@degree\tju@label@thesis}}
	    \fancyhead[RO]{\nouppercase{\small\kaishu\leftmark}}
	    \fancyhead[LE]{\nouppercase{\small\kaishu\tju@value@titlemark}}
	    \fancyfoot[C]{\small ---~{\bf\thepage}~---}
	    \renewcommand{\headheight}{32pt}
	  }
	\else
	%% 正文页
	\fancypagestyle{main}{
	  \fancyhead[L]{\small\kaishu\tju@value@school\tju@value@degree\tju@label@thesis}
	  \fancyhead[R]{\nouppercase{\small\kaishu\leftmark}}
	  \fancyfoot[C]{\small ---~{\bf\thepage}~---}
	  \renewcommand{\headheight}{32pt}
	}
	\fancypagestyle{plain}{
	  \fancyhf{}
	  \fancyhead[L]{\nouppercase{\small\kaishu\tju@value@school\tju@value@degree\tju@label@thesis}}
	  \fancyhead[R]{\nouppercase{\small\kaishu\leftmark}}
	  % \fancyhead[L]{\small {\it\tju@value@titlemark}}
	  \fancyfoot[C]{\small ---~{\bf\thepage}~---}
	  \renewcommand{\headheight}{32pt}
	}
	\fi
\fi

% 中英文摘要
\newenvironment{abstract}{\chapter*{\tju@value@title\vskip 20pt\tju@label@abstract}\markboth{\tju@label@abstract}{}}{}
\newcommand\keywords[1]{\vspace{2ex}\noindent{\bf\large \tju@label@keywords} #1}
\newenvironment{englishabstract}{\chapter*{\tju@value@englishtitle\vskip 20pt\bfseries \tju@label@englishabstract}\markboth{\tju@label@englishabstract}{}}{}
\newcommand\englishkeywords[1]{\vspace{2ex}\noindent{\bf\large \tju@label@englishkeywords} #1}

\renewcommand\tableofcontents{%
  \chapter*{\contentsname}
  \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}%
  \@starttoc{toc}%
}

\addtocontents{toc}{\let\string\CTEX@spaceChar\relax}

\newenvironment{publications}[1]
     {\chapter{\tju@label@publications}%
      \@mkboth{\MakeUppercase\tju@label@publications}
              {\MakeUppercase\tju@label@publications}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `publications' environment}}%
      \endlist}

\newenvironment{patents}[1]
     {\chapter{\tju@label@patents}%
      \@mkboth{\MakeUppercase\tju@label@patents}
              {\MakeUppercase\tju@label@patents}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `patents' environment}}%
      \endlist}

\newenvironment{projects}[1]
     {\chapter{\tju@label@projects}%
      \@mkboth{\MakeUppercase\tju@label@projects}
              {\MakeUppercase\tju@label@projects}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `projects' environment}}%
      \endlist}

\newenvironment{resume}
  {\chapter{\tju@label@resume}}
  {}
  
\newenvironment{resumesection}[1]
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 2\ccwd}
   \item\relax}
   {\endlist}
   
\newenvironment{resumelist}[1]
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 4\ccwd
           \itemindent -2\ccwd
           \listparindent\itemindent}
   \item\relax}
   {\endlist}
   
\renewenvironment{thanks}
  {\chapter{\tju@label@thanks}}
  {}

\newenvironment{summary}
{\chapter*{\tju@label@summary\markboth{\tju@label@summary}{}}\addcontentsline{toc}{chapter}{\tju@label@summary}
}{}

\newenvironment{symbolnote}{\chapter{\tju@label@symbolnote}}{} 

\endinput

%%
%% End of file `tjuthesis.cls'.
