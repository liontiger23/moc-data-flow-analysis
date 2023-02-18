---
title: Потоковый анализ
subtitle: (Data-flow analysis)
---

# Потоковый анализ

::::::: columns
::::: {.column width=48%}

## Потоковый анализ (Data flow analysis)

\up
- Статический
- Глобальный (весь CFG)
- Зависит от потока управления
- Вычисление свойств исполнения программы
- Единая формальная модель и теория

## Примеры

\up
- Reaching definitions (use-def links)
- Liveness analysis
- Constant propagation
- Constant subexpression elimination
- Dead code elimination

:::::
\vline
::::: {.column width=48%}

## \centering CFG

:::::
:::::::

# Пример

::::::: columns
::::: {.column width=48%}

```{=latex}
\uncover<+->{
```

# Окружение потокового анализа

- Потоковый граф $G = \langle V, E \rangle$

```{=latex}
\uncover<+->{
```

# TODO

- TODO


```{=latex}
}
```

```{=latex}
}
```

:::::
\vline
::::: {.column width=48%}


```{=latex}
\centering
\begin{tikzpicture}[
    ->,>=latex,anchor=center,
    every node/.style={inner sep=0.2em,font=\footnotesize},
    base/.style={minimum width={1em -\pgflinewidth},minimum height={1em - \pgflinewidth},inner sep=0,outer sep=auto},
    n/.style={base,draw,solid},
    block/.style={n,circle},
    cold/.style={fill=googlecyan},
    hot/.style={fill=googlemagenta},
    sibling distance=3em,
    level distance=3em,
    every matrix/.style={row sep=1.5em,column sep=0.5em,ampersand replacement=\&,every node/.style={block}},
    selected on/.style={alt=####1{thick}{}},
    entry/.style={selected on=<{.(2),.(4),.(10)}>},
    magenta source/.style={magenta,selected on=<{.(2),.(6),.(12)}>,
      background fill=magenta!50,fill on=<.(3)->},
    cyan source/.style={cyan,selected on=<{.(4),.(6),.(8),.(10),.(12)}>,
      alt=<.(1)-.(10)>{background fill=cyan!50}{background fill=green!50},fill on=<.(5)->},
    magenta cyan target/.style={selected on=<{.(6),.(14)}>,
      alt=<.(1)-.(12)>{background fill=blue!50}{background fill=black!50},fill on=<.(7)->},
    yellow source/.style={yellow,selected on=<{.(4),.(8),.(10),.(14)}>,
      alt=<.(1)-.(8)>{background fill=yellow!50}{background fill=green!50},fill on=<.(9)->},
    exit/.style={selected on=<{.(14)}>,
      background fill=black!50,fill on=<.(15)>},
  ]

  \matrix {
  \& \node [entry] (entry) {}; \& \\
  \node [magenta source] (magenta source) {}; \&  \& \node [cyan source] (cyan source) {}; \\
  \node [magenta cyan target] (magenta cyan target) {}; \&  \& \node [yellow source] (yellow source) {}; \\
  \& \node [exit] (exit) {}; \& \\
  };
  \graph [use existing nodes] {
    entry               -> [selected on=<{.(2)}>] magenta source;
    entry               -> [selected on=<{.(4),.(10)}>] cyan source;
    magenta source      -> [selected on=<{.(6),.(12)}>] magenta cyan target;
    cyan source         -> [selected on=<{.(6),.(12)}>] magenta cyan target;
    cyan source         -> [selected on=<{.(8)}>] yellow source;
    magenta cyan target -> [selected on=<{.(14)}>] exit;
    yellow source       -> [selected on=<{.(14)}>] exit;
  };


  \path [selected on=<{.(4),.(10)}>,out=-45,in=45,distance=3em] (yellow source) edge (cyan source);
  \invisible<0->{\path [selected on=<{0-}>,out=-45,in=45,distance=3em] (yellow source) edge (cyan source);}
  \node [left=0 of magenta source] (M) {M};
  \node [right=0 of cyan source] (C) {C};
  \node [right=0 of yellow source] (Y) {Y};

\end{tikzpicture}
```

```{=latex}
\uncover<1->{
\begin{tikzpicture}[remember picture,overlay]
  \node [shift={(-1.2cm,1.2cm)}] at (current page.south east) {

    \begin{tikzpicture}[scale=0.2,remember picture,overlay]
      % Source: https://texample.net/tikz/examples/rgb-color-mixing/
      % Adapted for CMYK

      % Draw three spotlights of the primary colors cyan, magenta and yellow
      % (they are primary in a subtractive colorspace where inks are mixed)
      \draw [draw=none, fill=cyan!75] (90:1.5) circle (2);
      \draw [draw=none, fill=yellow!75] (-30:1.5) circle (2);
      \draw [draw=none, fill=magenta!75] (210:1.5) circle (2);

      % Draw areas where two of the three primary colors are overlapping.
      % These areas are the secondary colors red, green and blue.
      \begin{scope} % cyan + yellow = green
        \clip (90:1.5) circle(2);
        \draw [draw=none, fill=green!75] (-30:1.5) circle (2);
      \end{scope} % magenta + cyan = blue
      \begin{scope}
        \clip (210:1.5) circle(2);
        \draw [draw=none, fill=blue!75] (90:1.5) circle (2);
      \end{scope}
      \begin{scope} % yellow + magenta = red
        \clip (-30:1.5) circle(2);
        \draw [draw=none, fill=red!75] (210:1.5) circle (2);
      \end{scope}

      % Draw the center area which consists of all the primary colors.
      \begin{scope} % cyan + magenta + yellow = black
        \clip (90:1.5) circle(2);
        \clip (210:1.5) circle(2);
        \draw [draw=none, fill=black!75] (-30:1.5) circle (2);	
      \end{scope}
      % Draw main color letters
      \node at ( 90:2) {\footnotesize C};
      \node at (-30:2) {\footnotesize Y};
      \node at (210:2) {\footnotesize M};
    \end{tikzpicture}

  };
\end{tikzpicture}
}
```

:::::
:::::::


<!--
Describe idea of the algorithm
- programs are graphs
- some properties are simple to calculate (reachable nodes)
- some require transfer of properties down the flow of the graph
- gen/kill definitions
-->

<!--
## Формальная модель потокового анализа
-->

# Полурешетка свойств $\langle L, \wedge \rangle$

::: columns
:::: {.column width=50%}

## Полурешетка $\langle L, \wedge \rangle$

Бинарная операция $\wedge$ (*meet*): $\forall x,y,z \in L$

\up
- $x \wedge x = x$ (*идемпотентность*);
- $x \wedge y = y \wedge x$ (*коммутативность*);
- $(x \wedge y) \wedge z = x \wedge (y \wedge z)$ (*ассоциативность*).

## Частичный порядок $\langle L, \leq \rangle$: `\uncover<1>{\footnote<1>[frame]{
Выполняются ли свойства частичного порядка при таком определении $\leq$ через $\wedge$?
} \footnote<1>[frame]{
Можно ли восстановить полурешетку $\langle L, \wedge \rangle$
имея только частичный порядок $\langle L, \leq \rangle$?
}}`{=latex}

$\forall x,y \in L$

\up
- $x \leq y \Leftrightarrow_{def} x \wedge y = x$;
- $x < y \Leftrightarrow_{def} x \wedge y = x\ \&\ x \neq y$.

## Свойства полурешеток

\up
- Обрыв убывающих цепей: $\forall x_1 > x_2 > \dots \exists k : \nexists y \in L : x_k > y$
- Ограниченность: 


\vspace{1em}

::::
\vline
:::: {.column width=48%}

```{=latex}
\only<2->{
```

:::::{.block}

## \centering Примеры

- Множество подмножеств $S$  
  $L = 2^S, \wedge = \cap$ (или $\cup$)
- Натуральные числа  
  $L = \mathbb{N}, x \wedge y = min(x, y)$
- Константые целочисленные значения  
  $L = \mathbb{Z} \cup \{\top, \bot\}, \bot < \mathbb{Z} < \top$
- Иерархия типов в программе  
  $L = Types, x \leq y = x <: y$ (*subtype*)

:::::

```{=latex}
}
```

::::
:::

# Потоковые функции

## Монотонность

## Монотонность на полурешетке

## Дистрибутивность

# Задача потокового анализа

- Потоковый граф
- Полурешетка свойств
- Начальная разметка
- Преобразователи свойств
  - Семейство монотонных функций

<!--
На примере reaching definitions
-->

# Решение задачи потокового анализа

- MOP
- MFP
  - $\exists MFP$
  - $\exists! MFP$
  - $MFP \leq MOP$
- Теорема Килдалла
  - дистрибутивность преобразователей $\Rightarrow MFP = MOP$
- Неразрешимость

<!--
Привести контрпримеры
-->

# Оценка сложности

Topsort ??

# {.plain}

\vspace{.7\textheight}
\begin{beamercolorbox}[ht=4ex,dp=2ex,center]{title}
\large Спасибо за внимание
\end{beamercolorbox}

