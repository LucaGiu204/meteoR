
<!-- README.md is generated from README.Rmd. Please edit that file -->

# meteoR

<!-- badges: start -->

<!-- badges: end -->

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
leer_estacion("NH0472", "data/estacion1.csv")
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

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
