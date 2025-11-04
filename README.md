
<!-- README.md is generated from README.Rmd. Please edit that file -->

# meteoR

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)

<!-- badges: end -->

## Autores: **Luca Giuffrida, Felipe Widmer**

El objetivo de meteoR es ofrecer un conjunto básico de herramientas para
la lectura, organización y visualización de datos meteorológicos, con
fines exclusivamente educativos.

## Installation

Podes instalar la version de desarrollo del paquete desde
[GitHub](https://github.com/) con:

``` r
# install.packages("pak")
pak::pak("LucaGiu204/meteoR")
```

## Example

Podes leer los datos de estaciones meteorológicas y guardarlas en una
ruta especifica con:

``` r
library(meteoR)
leer_estacion("NH0472", "data/NH0472.csv")
#> el archivo no existe en esa direccion, descargando...
#> archivo descargado correctamente
#> Rows: 20425 Columns: 35
#> ── Column specification ────────────────────────────────────────────────────────
#> Delimiter: ","
#> chr   (1): id
#> dbl  (18): temperatura_abrigo_150cm, temperatura_abrigo_150cm_maxima, temper...
#> lgl  (15): temperatura_suelo_5cm_media, temperatura_suelo_10cm_media, temper...
#> date  (1): fecha
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
#> archivo leido correctamente,
```
