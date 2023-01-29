---
title: Presentation template
author: Ivan Trepakov
company: My company
---

# Sample slide

::: columns
:::: {.column width=48%}

## First column

- You can use all Markdown features and directly embed `\LaTeX`{=latex}
- `\uncover<2->{`{=latex} Beamer allows you to flexibly animate slides with `\uncover<X>` and `\only<X>` `}`{=latex}
- `\uncover<3->{`{=latex} For images it is better to use vector graphics, e.g. in `.svg` which is automatically converted into `.pdf` via `Makefile` magic `}`{=latex}
- `\uncover<4->{`{=latex} You can also use `.png` or `.jpg` but they usually look worse than `.svg`/`.pdf` `}`{=latex}
- `\uncover<5->{`{=latex} Or you can dive deep into Ti*k*Z `}`{=latex}

::::
\vline
:::: {.column width=2%}
::::
:::: {.column width=48%}

## Second column

```{=latex}
\only<1-2>{
```
- Markdown lists
- With beautiful math: $x^n + y^n = z^n$
- And *easy* **Markdown** `styles`
```{=latex}
}
```

```{=latex}
\only<3-4>{
\centering
```
![](images/Markdown-mark.pdf){ width=60% }
```{=latex}
}
```

```{=latex}
\only<4>{
\centering
```
![](images/Markdown-mark.svg.png){ width=60% }
```{=latex}
}
```

```{=latex}
\only<5>{
\centering
\begin{tikzpicture}
  \begin{scope}[blend group = soft light]
    \fill[red!30!white]   ( 90:1.2) circle (2);
    \fill[green!30!white] (210:1.2) circle (2);
    \fill[blue!30!white]  (330:1.2) circle (2);
  \end{scope}
  \node at ( 90:2)    {Typography};
  \node at ( 210:2)   {Design};
  \node at ( 330:2)   {Coding};
  \node [font=\Large] {\LaTeX};
\end{tikzpicture}
}
```

::::
:::

# Conclusion

::: columns
:::: {.column width=10%}
::::
:::: {.column width=75%}

## \centering Summary

- Pandoc = Markdown + `\LaTeX`{=latex}
- Please use this template and never open ~~Google Slides~~ PowerPoint ever again

::::
:::: {.column width=10%}
::::
:::

# {.plain}

\vspace{.7\textheight}
\begin{beamercolorbox}[ht=4ex,dp=2ex,center]{title}
\large Thank you for your attention
\end{beamercolorbox}

