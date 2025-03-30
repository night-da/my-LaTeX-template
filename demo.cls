\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{demo}[2024/03/21 v1.0 Demo Template]

% 基于 ctexart 文档类
\LoadClass[a4paper, 12pt]{ctexart}

%----------------------------------------------------------------------------------------
%	REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

% 1. 基础包
\RequirePackage{
    amsmath,    % 数学公式
    mathtools,  % 数学工具扩展
    breqn,      % 行内公式自动换行
    textcomp,   % 文本符号
    upgreek,    % 直立希腊字母
    csquotes,   % 引号处理
    graphicx,   % 图片处理
    fontspec,   % 字体设置
    setspace    % 行距设置
}

% 2. 页面布局
\RequirePackage{geometry}
\geometry{
    top=2.5cm,
    bottom=2.5cm,
    left=2cm,
    right=2cm,
    headheight=12pt,
    headsep=20pt
}

% 3. 文档结构包
\RequirePackage{
    enumitem,   % 列表环境
    longtable,  % 长表格
    booktabs,   % 表格线
    tabularx,   % 表格列宽
    multirow,   % 表格合并
    caption,    % 标题设置
    subcaption, % 子标题
    silence,    % 警告控制
    fancyhdr,   % 页眉页脚
    hyperref    % 超链接（最后加载）
}

%----------------------------------------------------------------------------------------
%	WARNING FILTERS
%----------------------------------------------------------------------------------------

% 禁用编译警告
\WarningFilter{fancyhdr}{\headheight is too small}
\WarningFilter{hyperref}{The anchor of a bookmark}
\WarningFilter{hyperref}{Token not allowed in a PDF string}

%----------------------------------------------------------------------------------------
%	DOCUMENT SETTINGS
%----------------------------------------------------------------------------------------

% 1. 基础设置
\setmainfont{Times New Roman}
\setstretch{1.35}
\zihao{-4}
\graphicspath{{./figures/}}

% 2. 行内公式设置
\setlength{\mathindent}{0pt}
\setlength{\linewidth}{\textwidth}
\allowdisplaybreaks[4]
\everymath{\displaystyle}

% 3. 超链接设置
\hypersetup{
    hidelinks,
    colorlinks=false
}

% 4. 页眉页脚
\fancypagestyle{plain}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{1pt}
    \fancyhead[C]{\zihao{5}\songti\bfseries\CJKfontspec[AutoFakeBold=2]{SimSun} 添加内容}
    \fancyfoot[C]{-\thepage-}
}
\pagestyle{plain}

% 5. 环境设置
\setlist[enumerate]{
    leftmargin=2em,
    itemsep=0pt,
    parsep=0pt,
    topsep=0pt,
    partopsep=0pt
}

% 6. 表格设置
\renewcommand{\arraystretch}{1.35}
\setlength{\LTpre}{0pt}
\setlength{\LTpost}{5.5pt}

% 7. 数学和标题设置
\newcommand{\T}[1]{\text{#1}}
\DeclareCaptionFormat{myformat}{
    {\fontsize{11pt}{13.2pt}\selectfont\bfseries #1#2#3}
}
\captionsetup{
    format=myformat,
    belowskip=-5pt
}

% 8. 脚注设置
\RequirePackage{footmisc}
\renewcommand{\thefootnote}{\arabic{footnote}}
\renewcommand{\footnoterule}{
    \vspace*{-3pt}
    \hrule width 0.3\textwidth height 0.4pt
    \vspace*{2.6pt}
}
\setlength{\footnotesep}{12pt}
\setlength{\skip\footins}{20pt}

%----------------------------------------------------------------------------------------
%	CUSTOM COMMANDS
%----------------------------------------------------------------------------------------

% 1. 引用命令
\makeatletter
\newcommand{\citep}[1]{\textsuperscript{\ref{#1}}}
\makeatother

% 2. 标题和摘要
\renewenvironment{maketitle}[1]{
    \begin{center}
        {\zihao{3}\heiti\bfseries\CJKfontspec[AutoFakeBold=2]{SimHei} #1 \normalfont}
    \end{center}
}

\renewenvironment{abstract}[1]{
    \begin{center}
        {\zihao{-3}\heiti\bfseries\CJKfontspec[AutoFakeBold=2]{SimHei} 摘要 \normalfont}
    \end{center}
    \vspace{-1pt}
    \addcontentsline{toc}{section}{摘要}
    \normalfont 
    \par\setlength{\parindent}{2em}
    #1
}

\newcommand{\keywords}[1]{
    \zihao{-4}
    {\heiti\bfseries\CJKfontspec[AutoFakeBold=2]{SimHei}
    \noindent 关键词：\normalfont} #1
}

% 3. 章节命令
\renewcommand{\section}[1]{
    \vspace{-6pt}
    \stepcounter{section}
    \begin{center}
        \zihao{-3}
        {\heiti\bfseries\CJKfontspec[AutoFakeBold=2]{SimHei} \chinese{section}、#1 \normalfont}
    \end{center}
    \addcontentsline{toc}{section}{\chinese{section}、#1}
    \vspace{-4pt}
    \zihao{-4}
}

\renewcommand{\subsection}[1]{
    \vspace{3.75pt}
    \stepcounter{subsection}
    \noindent
    \zihao{4}
    {\heiti\bfseries\CJKfontspec[AutoFakeBold=2]{SimHei} \thesection.\arabic{subsection}\, #1 \normalfont}
    \addcontentsline{toc}{subsection}{\thesection.\arabic{subsection}\quad #1}
    \vspace{3.25pt}
    \zihao{-4}
}

\renewcommand{\subsubsection}[1]{
    \stepcounter{subsubsection}
    \noindent
    \zihao{-4}
    {\heiti\bfseries\CJKfontspec[AutoFakeBold=2]{SimHei} \thesection.\arabic{subsection}.\arabic{subsubsection}\, #1 \normalfont}
    \addcontentsline{toc}{subsubsection}{\thesection.\arabic{subsection}.\arabic{subsubsection}\quad #1}
}

% 4. 其他命令
\newcommand{\references}{
    \begin{center}
        \zihao{-3}
        {\heiti\bfseries\CJKfontspec[AutoFakeBold=2]{SimHei} 参考文献 \normalfont}
    \end{center}
    \vspace{-8pt}
    \addcontentsline{toc}{section}{参考文献}
    \zihao{-4}
}

\newcommand{\songbold}[1]{
    \begin{center}
        {\zihao{4}\songti\bfseries\CJKfontspec[AutoFakeBold=2]{SimSun}#1\normalfont}
    \end{center}
}

\endinput