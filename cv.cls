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

\RequirePackage[bottom=10mm,top=10mm,right=10mm,left=10mm,a4paper,dvips]{geometry}

\pagestyle{empty}

\newlength{\titleoffset}
\setlength{\titleoffset}{8em}
% Format of section
\titleformat{\section}{}{}{0em}{\bf\Large\MakeUppercase}
\titlespacing{\section}{\titleoffset}{1em}{1em}

% Block environment
\newlength{\cvblockmargin}
\setlength{\cvblockmargin}{3em}
\newlength{\cvblocktitlewidth}
\setlength{\cvblocktitlewidth}{0.21\textwidth}
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
		}{%
	\end{minipage}
	\vspace{1em}
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
			{\textbf{#1}}\\
		\fi
		\def\temp{#2}\ifx\temp\empty
			\else
			{\small#2}\\
		\fi
		\def\temp{#3}\ifx\temp\empty
		\else
			\textit{#3}\\
		\fi
		\def\temp{#4}\ifx\temp\empty
			\else
			{\small#4}\\
		\fi
	\end{spacing}%
}

% Heading
\newcommand{\cvheadingtitle}[1]{%
	\begin{center}
		{
			\color{Maroon}
			\Huge
			\so{\MakeUppercase{#1}}
			\vspace{0.7em}
		}
	\end{center}
}

% 1st argument is Title
% 2nd argument is Picture
% 3rd argument is Info block
\newsavebox{\headimgbox}
\newcommand{\cvheading}[3]{%
	\sbox{\headimgbox}{%
		\hspace{1cm}
		#2
	}

	\noindent
	\begin{minipage}{\dimexpr \wd\headimgbox}
		\usebox{\headimgbox}
	\end{minipage}
	\begin{minipage}{\dimexpr \textwidth-\wd\headimgbox-\columnsep}
		\cvheadingtitle{#1}

		\begin{center}
			#3
		\end{center}
	\end{minipage}
}

% Entry
\newcommand{\entry}[2]{%
	\begin{minipage}{1.5em}
		\begin{center}
			#1
		\end{center}
	\end{minipage}
	\begin{minipage}{20em}
		#2
	\end{minipage}
	\vspace{0.5em}
}

\newenvironment{cvpersonal}
{%
	\begin{center}
		\begin{minipage}{0.5\textwidth}
			}{%
		\end{minipage}
	\end{center}
}
