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

```{=latex}
\centering
\begin{tikzpicture}
\end{tikzpicture}
```

:::::
:::::::

# Пример

::::::: columns
::::: {.column width=48%}

# 

:::::
\vline
::::: {.column width=48%}

#

```{=latex}
\only<2->{
\begin{tikzpicture}[remember picture,overlay]
  \node [shift={(-1.2cm,1.2cm)}] at (current page.south east) {

    \begin{tikzpicture}[scale=0.2,remember picture,overlay]
      % Source: https://texample.net/tikz/examples/rgb-color-mixing/

      % Draw three spotlights of the primary colors red, green and blue
      % (they are primary in an additive colorspace where light are mixed)
      \draw [draw=none, fill=red] (90:1.5) circle (2);
      \draw [draw=none, fill=green] (-30:1.5) circle (2);
      \draw [draw=none, fill=blue] (210:1.5) circle (2);

      % Draw areas where two of the three primary colors are overlapping.
      % These areas are the secondary colors yellow, cyan and magenta.
      \begin{scope} % red + green = yellow
        \clip (90:1.5) circle(2);
        \draw [draw=none, fill=yellow] (-30:1.5) circle (2);
      \end{scope} % blue + red = magenta
      \begin{scope}
        \clip (210:1.5) circle(2);
        \draw [draw=none, fill=magenta] (90:1.5) circle (2);
      \end{scope}
      \begin{scope} % green + blue = cyan
        \clip (-30:1.5) circle(2);
        \draw [draw=none, fill=cyan] (210:1.5) circle (2);
      \end{scope}

      % Draw the center area which consists of all the primary colors.
      \begin{scope} % red + green + blue = white
        \clip (90:1.5) circle(2);
        \clip (210:1.5) circle(2);
        \draw [draw=none, fill=white] (-30:1.5) circle (2);	
      \end{scope}
      % Draw main color letters
      \node at ( 90:2) {\footnotesize R};
      \node at (-30:2) {\footnotesize G};
      \node at (210:2) {\footnotesize B};
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

