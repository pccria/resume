%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Medium Length Professional CV
% LaTeX Class
% Version 3.0 (December 17, 2022)
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
%
% Original header:
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved. This file is offered as-is,
% without any warranty.
%
% Created by Trey Hunner and modified by www.LaTeXTemplates.com
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
%	CLASS CONFIGURATION
%----------------------------------------------------------------------------------------

\ProvidesClass{resume}[2022/12/17 v3.0 Resume class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}} % Pass through any options to the base class
\ProcessOptions\relax % Process given options

\LoadClass{article} % Load the base class

% Enable Unicode glyph mapping for clean ATS / pdftotext extraction
\input{glyphtounicode}
\pdfglyphtounicode{uniFB00}{0066 0066}
\pdfglyphtounicode{uniFB01}{0066 0069}
\pdfglyphtounicode{uniFB02}{0066 006C}
\pdfglyphtounicode{uniFB03}{0066 0066 0069}
\pdfglyphtounicode{uniFB04}{0066 0066 006C}
\pdfgentounicode=1

%----------------------------------------------------------------------------------------
%	REQUIRED PACKAGES AND MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------

\usepackage[parfill]{parskip} % Remove paragraph indentation

\usepackage{array} % Required for bold tabular columns

\usepackage{ifthen} % Required for ifthenelse statements

\usepackage{graphicx} % Required for including images


\usepackage{lmodern}
\usepackage[sfdefault]{roboto}
\usepackage[T1]{fontenc}
\usepackage{microtype}
\DisableLigatures[f]{encoding = *}
\usepackage{fontawesome}

% Mask decorative FontAwesome icons from PDF text extractors (ATS / pdftotext)
\newcommand{\faClean}[1]{\pdfliteral direct{/Span<</ActualText()>>BDC}{\upshape #1}\pdfliteral direct{EMC}}


%----------------------------------------------------------------------------------------
%	SHARED DESIGN TOKENS (Margins, Palette, TikZ)
%----------------------------------------------------------------------------------------

\input{resume-tokens.def}

%----------------------------------------------------------------------------------------
%	HYPERLINKS
%----------------------------------------------------------------------------------------

\usepackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=bluegray,
    filecolor=bluegray,      
    urlcolor=bluegray,
    pdftitle={Pooria Askari Moqaddam - Senior Cross-Platform \& Systems Engineer},
    pdfauthor={Pooria Askari Moqaddam},
    pdfsubject={Resume / CV - Senior Cross-Platform \& Systems Engineer},
    pdfpagemode=UseNone,
}

%----------------------------------------------------------------------------------------
%	SHAPES
%----------------------------------------------------------------------------------------

% Define a new command to create a chip-like shape with text inside a colored box
\newcommand{\chip}[2][bluegray]{%
    \tikz[baseline]{%
        \node[rounded corners=4pt, fill=#1!70, inner sep=3.5pt] {\footnotesize \textcolor{white}{\textbf{#2}}};%
    }\hspace{3pt}%
}
% Define a new command to create a bigger chip-like shape with text inside a colored box
\newcommand{\bigChip}[2][bluegray]{%
    \tikz[baseline]{%
        \node[minimum height=7mm, rounded corners=10pt, fill=#1!70, inner sep=5pt] {\textcolor{white}{\small\textbf{#2}}};%
    }\hspace{5pt}%
}


%----------------------------------------------------------------------------------------
%	NAME AND INFO COMMANDS
%----------------------------------------------------------------------------------------

\newcommand{\name}[1]{\renewcommand{\name}{#1}} % Defines the \name command to set the user's name

\newcommand{\subtitle}[1]   {\def \@subtitle{#1}}
\newcommand{\email}[1]      {\def \@email{#1}}
\newcommand{\phone}[1]      {\def \@phone{#1}}
\newcommand{\website}[1]    {\def \@website{#1}}
\newcommand{\address}[1]    {\def \@address{#1}}
\newcommand{\linkedin}[1]   {\def \@linkedin{#1}}
\newcommand{\github}[1]     {\def \@github{#1}}
\newcommand{\langlink}[2]   {\def \@langlinkurl{#1}\def \@langlinktext{#2}}

% \makeheader renders the unified letterhead block as body content on page 1.
% Layout:
%   Row 1 (identity) : name (Large) left  ·  subtitle + langlink right
%   Row 2 (contact)  : phone left  ·  website center  ·  email right
%   Row 3 (profiles) : linkedin left  ·  address center  ·  github right
% Followed by a pantonegray separator rule.
\newcommand{\makeheader}{%
  \begingroup
  \leftskip=0pt\rightskip=0pt\parindent=0pt\parfillskip=0pt
  % Identity row: Name — Subtitle at start, translation link at end
  \begin{tabular*}{\textwidth}{@{} l @{\extracolsep{\fill}} r @{}}
    \textcolor{pantonegray}{%
      {\MakeUppercase{\Large\bfseries\name}}%
      \hspace{8pt}\textbf{\textemdash}\hspace{8pt}%
      {\MakeUppercase{\small\bfseries\@subtitle}}%
    } &
    \ifthenelse{\isundefined{\@langlinkurl}}{}{%
      \textcolor{bluegray}{\footnotesize\href{\@langlinkurl}{\faClean{\faLanguage}\hspace{3pt}\@langlinktext}}%
    } \\
  \end{tabular*}\par\vspace{2pt}%
  % Contact rows (3 balanced columns: left, true center, right)
  {\color{bluegray}\footnotesize%
  \par\vspace{2pt}\noindent
  \makebox[150pt][l]{\faClean{\faPhone}\hspace{3pt}\@phone}%
  \makebox[\dimexpr\textwidth-300pt\relax][c]{\ifthenelse{\isundefined{\@website}}{}{\faClean{\faGlobe}\hspace{3pt}\@website}}%
  \makebox[150pt][r]{\@email\hspace{3pt}\faClean{\faEnvelope}}%
  \par\vspace{2pt}\noindent
  \makebox[150pt][l]{\faClean{\faLinkedin}\hspace{3pt}\@linkedin}%
  \makebox[\dimexpr\textwidth-300pt\relax][c]{\@address}%
  \makebox[150pt][r]{\@github\hspace{3pt}\faClean{\faGithubAlt}}%
  \par
  }%
  \vspace{5pt}%
  {\color{pantonegray}\hrule height 0.4pt}%
  \vspace{8pt}%
  \endgroup
}

%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

% Defines the rSection environment for the major sections within the CV
\newenvironment{rSection}[1]{ % The single parameter is for the section title
	\vskip 1pt % Vertical whitespace
	\MakeUppercase{\textbf{#1}} % Section title
	\vskip 1pt % Vertical whitespace
	\hrule % Horizontal rule
	\begin{list}{}{ % List to indent the entire content of the section
		\setlength{\leftmargin}{12pt}
		% \setlength{\rightmargin}{8pt}
	}
 
	\item[] % Empty list item to enable indentation
}{
	\end{list}
}

%----------------------------------------------------------------------------------------
%	WORK EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

\newenvironment{rSubsection}[4]{ % 4 parameters: company name, year(s) employed, job title and location
	\textbf{#1} \hfill {#2} % Bold company name and date to the right
	\ifthenelse{\equal{#3}{}}{}{ % If the third parameter is empty, don't output the job title and location line
		\\ % Job title and location on a new line
		\textit{#3} \hfill \textit{#4} % Output job title and location
	}%
	\vskip 1pt % Vertical whitespace
	\begin{list}
        {\pdot}
        {\leftmargin=16pt}
		      \setlength{\itemsep}{-0.6em} \vspace{-0.6em} % Reduce vertical spacing between items in the list for a tighter look
    }{  
	   \end{list}
	   \vskip 0pt % Vertical whitespace after the end of the list  
    }