# Introdução

<img src = "https://user-images.githubusercontent.com/31219283/132221933-bae19e03-f251-45d4-bbca-d4c662766ddf.png" align = "right" display = "block">

> Estudo da biblioteca `purrr::` - playwithcat

Este projeto tem como o objetivo o estudo das funções da biblioteca [purrr](https://purrr.tidyverse.org/index.html) para implementação de operações iterativa no lugar da função `for` da linguagem básica do R.

Além disto, será uma oportunidade de um primeiro contato com o [github](https://github.com/) e todas as funcionalidades de [controle de versionamento](https://pt.wikipedia.org/wiki/Sistema_de_controle_de_vers%C3%B5es) para os códigos, reprodutibilidade das implementações realizadas e armazenamento de material para futuras utilizações.

A biblioteca possui um [mapa de consulta das funções](https://github.com/rstudio/cheatsheets/blob/master/purrr.pdf) que será utilizado como base para as implementações dos códigos. Além disto, [Hadley Wickham](https://twitter.com/hadleywickham) escreveu um capítulo sobre [programação funcional](http://adv-r.had.co.nz/Functional-programming.html) do seu livro [Advanced R](http://adv-r.had.co.nz/) e um [vídeo no youtube](https://youtu.be/rz3_FDVt9eg) que apresenta a utilização desta biblioteca com exemplos.

# Funções

Todas as subseções abaixo serão utilizadas para registro dos estudos em relação a cada função da biblioteca. Para cada estudo de caso, foi gerado um arquivo .Rmd e .pdf com a finalidade de salvar as implementações realizadas. Cara relatório foi gerado da forma mais simples possível, de tal maneira que não haja necessidade de uma alto conhecimento prévio.

## purrr::map

Casos de estudo:

1. Como calcular uma matriz de correlação das variáveis numéricas dos conjunto de dados `base::iris` separadamente para cada espécies [link do exemplo](https://github.com/wyhirai/library_purrr/blob/main/ilustracao/version1.pdf).
