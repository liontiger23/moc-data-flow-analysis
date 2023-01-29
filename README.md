# Presentation template

Sample template to get you started with Pandoc + Beamer presentations.

Fork this repository to bootstrap your presentation.

Main source: [pres.md](pres.md)  
Result: [publish/pres.pdf](publish/pres.pdf)

## Building

Following command builds your presentation into `pres.pdf`:

```
make
```

## Publishing

To "publish" the final `.pdf` you can use the following command which builds and copies `pres.pdf` into [publish/pres.pdf](publish/pres.pdf) which can then be committed to the repo:

```
make publish
```
