\LoadClass{article}

%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{00aced}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{boldcolor}{darkgray}
\colorlet{headercolor}{blue}

\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX]{unicode-math}

\usepackage{fontspec}
\setmainfont{Georgia}

%%%

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}
\newcommand{\rhead}[5]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
    
    
    \node [anchor=center] (name) at (box.center) {
      \fontsize{20pt}{72pt}\color{header}
     \LARGE{ #2} { #3}
    };
    \node [anchor=east] (picture) at (name.west) {%
       #1%
    };    
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{24pt}\color{header}%
       #4 
    };
    \node [anchor=west, text=header, align=center] at (name.east) {%
      \fontsize{14pt}{24pt} %\color{header}
       #5
    };
  \end{tikzpicture}
  \vspace{2.5cm}
  \vspace{-1\parskip}
}

%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        blue\or%
        blue\or%
        blue\or%
        blue\or%
        blue\else%
        headercolor\fi%
    }
     #1%#2#3%
  }%
  \stepcounter{colorCounter}%
}

\def\@customBold#1{%
      \textcolor{boldcolor} {\textbf {#1}}
}

\renewcommand{\section}[1]{
\large
  \par\vspace{\parskip}
   \textcolor {blue}{#1} 
  % {%
  %   \large%
  %   \@sectioncolor #1%
  % }
  \par\vspace{0.5\parskip}
}

\newcommand{\sectiontwo}[1]{%
\large
  \par\vspace{\parskip}
   \textcolor {blue}{#1} 
  }
  
\pagestyle{empty}

%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}

%\renewcommand{\bfseries}{ \color{boldcolor}}

\newcommand{\entry}[4]{%
  \normalsize
  #1&\parbox[t]{11.8cm}{%
    \@customBold {#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
      \small #4\vspace{1\parsep }%
  }\\}
  
  \newcommand{\entrytwo}[4]{%
    \normalsize
    #1&\parbox[t]{11.8cm}{%
      \@customBold {#2}%
      \hfill%
      {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
        \small #4\vspace{1\parsep }%
    }\\}
    
  %%%%%%%%%%%%%%
  % Side block %
  %%%%%%%%%%%%%%

  \RequirePackage[absolute,overlay]{textpos}
  \setlength{\TPHorizModule}{1cm}
  \setlength{\TPVertModule}{1cm}
  \newenvironment{aside}{%
    \let\oldsection\section
    \renewcommand{\section}[1]{
      \par\vspace{\baselineskip}{\large\color{headercolor} #1}
    }
    \begin{textblock}{3.6}(1.5, 4.33)
    \begin{flushright}
    \obeycr
  }{%
    \restorecr
    \end{flushright}
    \end{textblock}
    \let\section\oldsection
  }
  
  

\usepackage[a4paper, total={6in, 8in}, nofoot]{geometry}

% \RequirePackage[left=6.1cm,top=0cm,right=0cm,bottom=0cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}
