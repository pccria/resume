%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Medium Length Professional CV - Persian Edition
% LaTeX Class for XeLaTeX & XePersian
% author: Pooria Askari Moqaddam
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
%	CLASS CONFIGURATION
%----------------------------------------------------------------------------------------

\ProvidesClass{resume_fa}[2026/11/20 v1.0 Persian Resume class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass{article}

%----------------------------------------------------------------------------------------
%	REQUIRED PACKAGES AND MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------

\usepackage[parfill]{parskip}
\usepackage{array}
\usepackage{ifthen}
\usepackage{graphicx}
\usepackage{fontawesome}

% Mask decorative FontAwesome icons from PDF text extractors (ATS / pdftotext)
\newcommand{\faClean}[1]{{\upshape #1}}

%----------------------------------------------------------------------------------------
%	SHARED DESIGN TOKENS (Margins, Palette, TikZ)
%----------------------------------------------------------------------------------------

\input{resume-tokens.def}

%----------------------------------------------------------------------------------------
%	HYPERLINKS
%----------------------------------------------------------------------------------------

\usepackage{hyperref}
\hypersetup{
    unicode=true,
    colorlinks=true,
    linkcolor=bluegray,
    filecolor=bluegray,      
    urlcolor=bluegray,
    pdfpagemode=UseNone,
}

%----------------------------------------------------------------------------------------
%	CHIPS & VISUAL BADGES
%----------------------------------------------------------------------------------------

% Chip shape with white text inside a colored rounded rectangle
% Wrapped in \lr to ensure Latin technology tags render left-to-right properly
\newcommand{\chip}[2][bluegray]{%
    \tikz[baseline]{%
        \node[rounded corners=4pt, fill=#1!70, inner sep=3.5pt] {\footnotesize \textcolor{white}{\lr{\textbf{#2}}}};%
    }\hspace{3pt}%
}

\newcommand{\bigChip}[2][bluegray]{%
    \tikz[baseline]{%
        \node[minimum height=7mm, rounded corners=10pt, fill=#1!70, inner sep=5pt] {\textcolor{white}{\small\lr{\textbf{#2}}}};%
    }\hspace{5pt}%
}

%----------------------------------------------------------------------------------------
%	NAME AND INFO COMMANDS
%----------------------------------------------------------------------------------------

\newcommand{\name}[1]{\renewcommand{\name}{#1}}
\newcommand{\subtitle}[1]{\def \@subtitle{#1}}
\newcommand{\email}[1]{\def \@email{#1}}
\newcommand{\phone}[1]{\def \@phone{#1}}
\newcommand{\website}[1]{\def \@website{#1}}
\newcommand{\address}[1]{\def \@address{#1}}
\newcommand{\linkedin}[1]{\def \@linkedin{#1}}
\newcommand{\github}[1]{\def \@github{#1}}
\newcommand{\langlink}[2]{\def \@langlinkurl{#1}\def \@langlinktext{#2}}

% \makeheader renders the unified letterhead block in RTL:
%   Row 1 (identity): Name right  ·  Subtitle + langlink left
%   Row 2 (contact) : Phone right  ·  Website center  ·  Email left
%   Row 3 (profiles): LinkedIn right  ·  Address center  ·  GitHub left
% Followed by a pantonegray separator rule.
\newcommand{\makeheader}{%
  \begingroup
  \leftskip=0pt\rightskip=0pt\parindent=0pt\parfillskip=0pt
  % Identity row: Name — Subtitle at start, translation link at end
  \begin{tabular*}{\textwidth}{@{} r @{\extracolsep{\fill}} l @{}}
    \textcolor{pantonegray}{%
      {\Large\bfseries\name}%
      \hspace{8pt}\textbf{\textemdash}\hspace{8pt}%
      {\normalsize\bfseries\@subtitle}%
    } &
    \ifthenelse{\isundefined{\@langlinkurl}}{}{%
      \textcolor{bluegray}{\footnotesize\href{\@langlinkurl}{\faClean{\faLanguage}\hspace{3pt}\@langlinktext}}%
    } \\
  \end{tabular*}\par\vspace{2pt}%
  % Contact rows (3 balanced columns: right, true center, left)
  {\color{bluegray}\footnotesize%
  \par\vspace{2pt}\noindent
  \makebox[150pt][r]{\faClean{\faPhone}\hspace{3pt}\lr{\@phone}}%
  \makebox[\dimexpr\textwidth-300pt\relax][c]{\ifthenelse{\isundefined{\@website}}{}{\lr{\faClean{\faGlobe}\hspace{3pt}\@website}}}%
  \makebox[150pt][l]{\lr{\@email}\hspace{3pt}\faClean{\faEnvelope}}%
  \par\vspace{2pt}\noindent
  \makebox[150pt][r]{\faClean{\faLinkedin}\hspace{3pt}\lr{\@linkedin}}%
  \makebox[\dimexpr\textwidth-300pt\relax][c]{\@address}%
  \makebox[150pt][l]{\lr{\@github}\hspace{3pt}\faClean{\faGithubAlt}}%
  \par
  }%
  \vspace{5pt}%
  {\color{pantonegray}\hrule height 0.4pt}%
  \vspace{8pt}%
  \endgroup
}

%----------------------------------------------------------------------------------------
%	SECTION FORMATTING (RTL)
%----------------------------------------------------------------------------------------

\newenvironment{rSection}[1]{%
	\vskip 1pt%
	\textbf{#1}%
	\vskip 1pt%
	\hrule%
	\begin{list}{}{%
		\setlength{\rightmargin}{12pt}%
	}%
	\item[]%
}{%
	\end{list}%
}

%----------------------------------------------------------------------------------------
%	WORK EXPERIENCE / PROJECT ITEM FORMATTING (RTL)
%----------------------------------------------------------------------------------------

\newenvironment{rSubsection}[4]{%
	\textbf{#1} \hfill \beginL #2 \endL%
	\ifthenelse{\equal{#3}{}}{}{%
		\\%
		\textsl{#3} \hfill \textit{#4}%
	}%
	\vskip 1pt%
	\begin{list}%
        {\pdot}%
        {\rightmargin=16pt}%
		\setlength{\itemsep}{-0.6em} \vspace{-0.6em}%
    }{%
	\end{list}%
	\vskip 0pt%
}

%----------------------------------------------------------------------------------------
%	XEPARSIAN & FONTS (MUST BE LOADED LAST)
%----------------------------------------------------------------------------------------

\usepackage{xepersian}

% Primary Persian Text Font (Vazirmatn)
\settextfont[
    Path = fonts/,
    Extension = .ttf,
    BoldFont = Vazirmatn-Bold,
]{Vazirmatn-Regular}

% Latin Font for embedded English text, chips and URLs (Roboto)
\setlatintextfont[
    Path = fonts/,
    Extension = .ttf,
    BoldFont = Roboto-Bold,
]{Roboto-Regular}
