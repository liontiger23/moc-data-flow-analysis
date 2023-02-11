---
title: Потоковый анализ
subtitle: (Data-flow analysis)
---

# Потоковый анализ

## Достижимые присваивания (Reaching definitions)

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

\vspace{-0.5em}
- $x \wedge x = x$ (*идемпотентность*);
- $x \wedge y = y \wedge x$ (*коммутативность*);
- $(x \wedge y) \wedge z = x \wedge (y \wedge z)$ (*ассоциативность*).

\vspace{-1em}
## Частичный порядок $\langle L, \leq \rangle$: `\uncover<1>{\footnote<1>[frame]{
Выполняются ли свойства частичного порядка при таком определении $\leq$ через $\wedge$?
} \footnote<1>[frame]{
Можно ли восстановить полурешетку $\langle L, \wedge \rangle$
имея только частичный порядок $\langle L, \leq \rangle$?
}}`{=latex}

$\forall x,y \in L$

\vspace{-0.5em}
- $x \leq y \Leftrightarrow_{def} x \wedge y = x$;
- $x < y \Leftrightarrow_{def} x \wedge y = x\ \&\ x \neq y$.

\vspace{-1em}
## Свойства полурешеток

\vspace{-0.5em}
- Обрыв убывающих цепей: $\forall x_1 > x_2 > \dots \exists k : \nexists y \in L : x_k > y$
- Ограниченность: 


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

