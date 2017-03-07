%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%	-------------------- UoMthesis.cls --------------------	%%%%%
%%%%%	Modified by P. Ashcroft. 07/2015.												%%%%%
%%%%%	File is modified from an existing class available at						%%%%%
%%%%%	studentnet.cs.manchester.ac.uk/resources/latex/MUThesis/		%%%%%
%%%%%																										%%%%%
%%%%%	Complies with UoM Thesis guidelines dated June 2014.				%%%%%
%%%%%	These are available at																	%%%%%
%%%%%	documents.manchester.ac.uk/display.aspx?DocID=7420		 	%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%	Automatically generates:																%%%%%
%%%%%	Title Page																						%%%%%
%%%%%	Table of Contents																		%%%%%
%%%%%	List of Tables																				%%%%%
%%%%%	List of Figures																				%%%%%
%%%%%	Abstract Page																				%%%%%
%%%%%	Lay abstract Page																			%%%%%
%%%%%	Declaration																					%%%%%
%%%%%	Copyright																						%%%%%
%%%%%	Acknowledgements																		%%%%%
%%%%%																										%%%%%	
%%%%% References are output in the order they are cited, and are       	%%%%%
%%%%% labeled [1],[2], etc.                                                                   	%%%%%
%%%%% MU thesis guidelines do not specify a bib style,                        	%%%%%
%%%%% but this works well.                                                                  	%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{UoMthesis}[2015/07/31 UoM Thesis Class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions

\LoadClass[a4paper]{report}

% Provides the option to add lines after Chapter headings, because why not...
\usepackage{titlesec}



% Documentation:
% The \preface command creates the title page, table of contents,
% lists of tables and figures, abstract, lay abstract, declaration,
% copyright page, and acknowledgements
%
%
% The following commands determine sections are displayed in the front matter:
% (all true by default)
% \titlepagetrue -or- \titlepagefalse
% \contentspagetrue -or- \contentspagefalse
% \tablespagetrue -or- \tablespagefalse
% \figurespagetrue -or- \figurespagefalse
% \abstractpagetrue -or- \abstractpagefalse
% \layabstractpagetrue -or- \layabstractpagefalse
% \declarationpagetrue -or- \declarationpagefalse
% \copyrightpagetrue -or- \copyrightpagefalse
% \acknowledgementspagetrue -or- \acknowledgementspagefalse
%
%
% Additional sections can be added using the \prefacesection{sec name} command.
%
%
% The following commands can control the content of the front matter:
% material:
% \title{thesis title}
% \author{author's name}
% \degreetitle{probably Doctor of Philosophy}
% \school{author's School}
% \faculty{author's Faculty}
% \university{author's Univeristy} %incase this leaves Manchester...
% \wordcount{}
% \abstracttext{}
% \layabstracttext{}
% \acknowledgementstext{}
%
%
% This style uses interline spacing that is 1.6 times normal (about double
% spaced), except in the float and footnote environments where normal spacing
% is used.
% Linespacing is adjusted using the command:
%    \renewcommand{\baselinestretch}{1.6}
% Unfortunately, that command probably won't take effect unless it comes
% before the \begin{document} or after something like \small \normalsize.
%
%% End of documentation
%%--------------------------------------------------------------------%%
%%--------------------------------------------------------------------%%



%%------------------DEFINE LENGTHS/SPACINGS---------------------------%%

%% PAGE DIMENSIONS
% We need >15mm margins except on the binding edge, where it is >40mm.
% Pagewidth is 210 mm, Pageheight is 297mm
\textwidth 154mm
\textheight 240mm
\oddsidemargin 15mm
\evensidemargin -8mm
\marginparwidth 0mm
\marginparsep 0mm
\topmargin -5mm
\headsep 7mm
\footskip 10mm


%% INDENTS AND LINE SPACING
\setlength{\parindent}{6mm}

\def\stretch{1.6} % Deafult line-spacing
\def\baselinestretch{\stretch}\normalsize
\def\contentstretch{1.47}
\def\bibstretch{1.05}

\brokenpenalty=10000


%%-------------------CHAPTER/FLOAT FORMAT---------------------------%%
% Preface Chapter titles
\titleformat{name=\chapter,numberless}[hang]{\bfseries\Huge}{}{0mm}{}[\vspace{2mm}\titlerule]
\titlespacing*{name=\chapter,numberless}{0mm}{-50pt}{10mm}

% Main text chapter titles
\titleformat{name=\chapter}[display]{\bfseries\Huge}{\Large Chapter \thechapter}{0mm}{}[\vspace{2mm}\titlerule]
\titlespacing*{name=\chapter}{0mm}{100pt}{10mm}

% Redefine the macro used for floats (including figures and tables) so that single spacing is used.
\let\latex@xfloat=\@xfloat
\def\@xfloat #1[#2]{
	\latex@xfloat #1[#2]
	\def\baselinestretch{1}
	\@normalsize \normalsize
}

%% Redefine the macro used for footnotes to use single spacing
\long\def\@footnotetext#1{\insert\footins{\def\baselinestretch{1}\footnotesize
	\interlinepenalty\interfootnotelinepenalty
	\splittopskip\footnotesep
	\splitmaxdepth \dp\strutbox \floatingpenalty \@MM
	\hsize\columnwidth \@parboxrestore
	\edef\@currentlabel{\csname p@footnote\endcsname\@thefnmark}\@makefntext
	{\rule{\z@}{\footnotesep}\ignorespaces
	#1\strut}}
}


%%-------------------------DEFINITIONS--------------------------------%%

%% \author, \title are defined in report; here are the rest of the
%% front matter defining macros
\def\degreetitle#1{\gdef\@degreetitle{#1}}
\def\school#1{\gdef\@school{#1}}
\def\faculty#1{\gdef\@faculty{#1}}
\def\university#1{\gdef\@university{#1}}
\def\submitdate#1{\gdef\@submitdate{#1}}
\def\wordcount#1{\gdef\@wordcount{#1}}
\long\def\abstracttext#1{\gdef\@abstracttext{#1}}
\long\def\layabstracttext#1{\gdef\@layabstracttext{#1}}
\long\def\acknowledgementstext#1{\gdef\@acknowledgementstext{#1}}
%
%
%
\def\@title{}
\def\@author{}
\def\@degreetitle{}
\def\@school{}
\def\@faculty{}
\def\@univeristy{}
\def\@submitdate{\number\the\year}
\def\@wordcount{}
\long\def\@abstracttext{}
\long\def\@layabstracttext{}
\long\def\@acknowledgementstext{}


% Options for including Preface sections
\newif\iftitlepage
\newif\ifcontentspage
\newif\iftablespage
\newif\iffigurespage
\newif\ifabstractpage
\newif\iflayabstractpage
\newif\ifdeclarationpage
\newif\ifcopyrightpage
\newif\ifacknowledgementspage

%Default values
\titlepagetrue
\contentspagetrue
\tablespagetrue
\figurespagetrue
\abstractpagetrue
\layabstractpagetrue
\declarationpagetrue
\copyrightpagetrue
\acknowledgementspagetrue




%%--------------------------------------------------------------------%%
%%-------------------------Title Page Style------------------------------%%
%%--------------------------------------------------------------------%%

\def\thetitlepage{%
	\thispagestyle{empty}%
	\null\vskip1in%
	% title
	\begin{center}
		% Title large and in capitals
		\Huge\uppercase\expandafter{\@title}
	\end{center}
	\vfill
	\begin{center}
	% Statement in small caps (\sc)
		\sc A thesis submitted to \expandafter{\@university}\\
		for the degree of \expandafter{\@degreetitle}\\
		in the Faculty of \expandafter{\@faculty}
	\end{center}
	\vfill
	% Submit date
	\begin{center}
		\@submitdate
	\end{center}
	\vfill
	% Author and school
	\begin{center}
		% Author in bold
		{\bf \@author}\\
		\ifx\@empty\@school
		\else
			School of \expandafter{\@school}
		\fi
	\end{center}
	\vskip.5in%
}
%%--------------------------------------------------------------------%%




%%--------------------------------------------------------------------%%
%%----------------------Contents Page Definition-------------------------%%
%%--------------------------------------------------------------------%%

\def\thecontentspage{%
	% 1 just displays chapter and section, 2 adds subsection, 3 adds subsubsection
	\setcounter{tocdepth}{1}
	%	
	\def\baselinestretch{\contentstretch}\normalsize
	\tableofcontents
	\def\baselinestretch{\stretch}\normalsize
	\vfill
	\hfill Word count: \@wordcount
}
%%--------------------------------------------------------------------%%


%%--------------------------------------------------------------------%%
%%------------------------Abstract Definition----------------------------%%
%%--------------------------------------------------------------------%%
\def\theabstractpage{%
	\prefacesection{Abstract}
	% Spacing of header text
	\def\baselinestretch{1.1}\normalsize
	% Abstract must contain Univeristy, degree title, thesis title and author's name.
	\uppercase\expandafter{\@university}\\
	\noindent \expandafter{\@degreetitle}\\
	\noindent{\bf\@title} by \@author, \@submitdate
	\par \vspace{1em}
	% Single space for abstract text
	\def\baselinestretch{1}\normalsize
	%
	\expandafter{\@abstracttext}
	%
	\par
	%
	\def\baselinestretch{\stretch}\normalsize
}
%%--------------------------------------------------------------------%%




%%--------------------------------------------------------------------%%
%%-----------------------Lay Abstract Definition--------------------------%%
%%--------------------------------------------------------------------%%
\def\thelayabstractpage{%
	\prefacesection{Lay abstract}
	% Single spaced header text
	\def\baselinestretch{1.1}\normalsize
	% Abstract must contain Univeristy, degree title, thesis title and author's name.
	\uppercase\expandafter{\@university}\\
	\noindent \expandafter{\@degreetitle}\\
	\noindent{\bf\@title} by \@author, \@submitdate
	\par \vspace{1em}
	% Single space lay abstract text
	\def\baselinestretch{1}\normalsize
	%
	\expandafter{\@layabstracttext}
	%	
	\par
	%
	\def\baselinestretch{\stretch}\normalsize
}
%%--------------------------------------------------------------------%%






%%--------------------------------------------------------------------%%
%%-------------------------Declaration Definition-------------------------%%
%%--------------------------------------------------------------------%%

% Statement from UoM guidlines dated June 2014
\def\thedeclarationpage{%
	\prefacesection{Declaration}
	\begin{center}
		\begin{minipage}{4in}
			No portion of the work referred to in this thesis has been submitted in support of an application for another degree or qualification of this or any other university or other institute of learning.
		\end{minipage}%
\end{center}%
\vfill
}
%%--------------------------------------------------------------------%%




%%--------------------------------------------------------------------%%
%%---------------------Copyright Statement Definition---------------------%%
%%--------------------------------------------------------------------%%
\def\thecopyrightpage{%
	\prefacesection{Copyright}
	\def\baselinestretch{1.5}\normalsize % Spacing adjusted to fit on one page

	% List copied from UoM guidelines dated June 2014
	\begin{list}{\labelitemi}{\leftmargin=15mm}
		\item[(i)] The author of this thesis (including any appendices and/or schedules to this thesis) owns certain copyright or related rights in it (the ``Copyright'') and s/he has given \expandafter{\@university} certain rights to use such Copyright, including for administrative purposes.
		%
		\item[(ii)] Copies of this thesis, either in full or in extracts and whether in hard or electronic copy, may be made {\bf only} in accordance with the Copyright, Designs and Patents Act 1988 (as amended) and regulations issued under it or, where appropriate, in accordance with licensing agreements which the University has from time to time. This page must form part of any such copies made.
		%
		\item[(iii)] The ownership of certain Copyright, patents, designs, trade marks and other intellectual property (the ``Intellectual Property'') and any reproductions of copyright works in the thesis, for example graphs and tables (``Reproductions''), which may be described in this thesis, may not be owned by the author and may be owned by third parties. Such Intellectual Property and Reproductions cannot and must not be made available for use without the prior written permission of the owner(s) of the relevant Intellectual Property and/or Reproductions.
		%
		\item[(iv)] Further information on the conditions under which disclosure, publication and commercialisation of this thesis, the Copyright and any Intellectual Property and/or Reproductions described in it may take place is available in the University IP Policy (see \texttt{http://documents.manchester.ac.uk/DocuInfo. aspx?DocID=487}), in any relevant Thesis restriction declarations deposited in the University Library, The University Library's regulations (see \texttt{http://www. manchester.ac.uk/library/aboutus/regulations}) and in The University's policy on Presentation of Theses.
	\end{list}
	\vfill%
	%
	\def\baselinestretch{\stretch}\normalsize
}
%%--------------------------------------------------------------------%%



%%--------------------------------------------------------------------%%
%%---------------------Acknowledgemens Definition-----------------------%%
%%--------------------------------------------------------------------%%
\def\theacknowledgementspage{%
	\prefacesection{Acknowledgements}
	\noindent 
	\begin{minipage}{\textwidth}
		\vspace{1em}	
		\parindent=2em
		\expandafter{\@acknowledgementstext}
		%THANK YOU
		\par
	\end{minipage}
}
%%--------------------------------------------------------------------%%





%%--------------------------------------------------------------------%%
%%-----------------------	-Aditional preface sections----------------------%%
%%--------------------------------------------------------------------%%

% Further preface sections include Acknowledgments, Publication lists, `The Author', etc.
\def\prefacesection#1{%
	\chapter*{#1}       
	\addcontentsline{toc}{chapter}{#1}
}
%%--------------------------------------------------------------------%%






%%--------------------------------------------------------------------%%
%%-------------------------------Preface-------------------------------%%
%%--------------------------------------------------------------------%%

% Adds title page table of contents, list of tables, list of figures, and abstract (and lay abstract)

\def\preface{
	\pagenumbering{arabic}
	\pagestyle{plain}
	\csname @openrightfalse\endcsname
	%
	% title page
	\iftitlepage
		\thetitlepage
		\newpage
	\fi
	%
	% contents
	\ifcontentspage
		\thecontentspage		
		\newpage
	\fi
	%
	% list of tables
	\iftablespage
		\def\baselinestretch{\contentstretch}\normalsize
		\listoftables
		\def\baselinestretch{\stretch}\normalsize
		\newpage
	\fi
	%
	% list of figures
	\iffigurespage
		\def\baselinestretch{\contentstretch}\normalsize
		\listoffigures
		\def\baselinestretch{\stretch}\normalsize
		\newpage
	\fi
	%
	% abstract
	\ifabstractpage
		\theabstractpage
		\newpage
	\fi
	%
	% lay abstract
	\iflayabstractpage
		\thelayabstractpage
		\newpage
	\fi
	%
	% declaration
	\ifdeclarationpage
		\thedeclarationpage
		\newpage
	\fi
	%
	% copyright
	\ifcopyrightpage
		\thecopyrightpage
		\newpage
	\fi
	%
	%acknowledgments
	\ifacknowledgementspage
		\theacknowledgementspage
		\newpage
	\fi
	%
	%
}
%%--------------------------------------------------------------------%%




%%--------------------------------------------------------------------%%
%%----------------------After preface, main text format--------------------%%
%%--------------------------------------------------------------------%%
%% This produces the chapter title at the top of each page. It can be
%% changed in the obvious way, e.g., \pagestyle{empty} or \pagestyle{plain}
%% P. Ashcroft aslo added the open right commands
\def\startthesis{
	\pagestyle{headings}
	%
	% open chapters on right page only
	\csname @openrighttrue\endcsname
	% clear headers on blank page
	\makeatletter
	\renewcommand*{\cleardoublepage}{\clearpage\if@twoside \ifodd\c@page\else
	\hbox{}%
	\thispagestyle{plain}%
	\newpage%
	\if@twocolumn\hbox{}\newpage\fi\fi\fi}
	\makeatother
}
%%--------------------------------------------------------------------%%



%%--------------------------------------------------------------------%%
%%-----------------------------Bibliography-----------------------------%%
%%--------------------------------------------------------------------%%
\def\thebibliography#1{
	\chapter*{\bibname\@mkboth{\uppercase{\bibname}}{\uppercase{\bibname}}}%
	\addcontentsline{toc}{chapter}{\bibname}%
	\def\baselinestretch{\bibstretch}\normalsize% adjust line spacing
	\list
	{\@biblabel{\arabic{enumiv}}}{\settowidth\labelwidth{\@biblabel{#1}}%
	\leftmargin\labelwidth
	\advance\leftmargin\labelsep
	\usecounter{enumiv}%
	\let\p@enumiv\@empty
	\def\theenumiv{\arabic{enumiv}}}%
	\def\newblock{\hskip .11em plus.33em minus.07em}%
	\sloppy\clubpenalty4000\widowpenalty4000
	\sfcode`\.=\@m
}

\def\endthebibliography{%
	\def\@noitemerr{\@warning{Empty `thebibliography' environment}}%
	\endlist
}
%%--------------------------------------------------------------------%%
%fin