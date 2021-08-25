\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}

\renewcommand{\familydefault}{\sfdefault}

\LoadClass{article}
\RequirePackage{titlesec}
\RequirePackage{textcase}
\RequirePackage{etoolbox}
\RequirePackage{setspace}
\RequirePackage{ragged2e}
\RequirePackage{soul}
\RequirePackage{calc}
\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}

\RequirePackage{hyperref}
\hypersetup{colorlinks, breaklinks, urlcolor=Maroon, linkcolor=Maroon}

\RequirePackage[bottom=10mm,top=10mm,right=15mm,left=7mm,a4paper,dvips]
{geometry}

\pagestyle{empty}

% Format of section
\titleformat{\section}{}{}{0em}{\bf\Large\MakeUppercase}
\titlespacing{\section}{8em}{1em}{1em}

% Block environment
\newlength{\cvblockmargin}
\setlength{\cvblockmargin}{3em}
\newlength{\cvblocktitlewidth}
\setlength{\cvblocktitlewidth}{0.2\textwidth}
\newlength{\cvblockcontentwidth}
\setlength{\cvblockcontentwidth}{%
\textwidth - \cvblocktitlewidth - \cvblockmargin}

\newlength{\cvcontentmargin}
\setlength{\cvcontentmargin}{\cvblocktitlewidth + \cvblockmargin}

\newenvironment{cvblock}[1]
{%
\begin{minipage}[t]{\cvblocktitlewidth}
\begin{flushright}
\large{#1}
\end{flushright}
\end{minipage}
\hfill
\begin{minipage}[t]{\cvblockcontentwidth}%
}
{%
\end{minipage}
\vspace{0.5em}
}

% Block title helper
% 1st argument is Title
% 2nd argument is Location
% 3rd Position
% 4th argument is Time period

\newcommand{\blocktitle}[4]
{%
\begin{spacing}{1.3}
\large
\def\temp{#1}\ifx\temp\empty
\else
  #1\\
\fi
\def\temp{#2}\ifx\temp\empty
\else
  (#2)\\
\fi
\def\temp{#3}\ifx\temp\empty
\else
  \textit{#3}\\
\fi
\def\temp{#4}\ifx\temp\empty
\else
  {\normalsize#4}\\
\fi
\end{spacing}%
}

% Heading

\newcommand{\cvheading}[1]{%
{
\hspace{\cvcontentmargin}
\color{Maroon}
\Huge
\so{\MakeUppercase{#1}}
\vspace{1em}
}}

% Entry
\newcommand{\entry}[2]{%
\hspace{\cvcontentmargin}
\begin{minipage}{0.1\textwidth}
#1
\end{minipage}
#2
\vspace{0.5em}
}
