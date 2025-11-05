#' Estación NH0472 — datos meteorológicos de ejemplo
#'
#' Subconjunto de observaciones horarias para la estación NH0472.
#'
#' @format Un data frame (tibble) con columnas típicas como:
#' \describe{
#'   \item{fecha}{Fecha/hora (Date o POSIXct)}
#'   \item{id}{Identificador de estación (chr)}
#'   \item{temperatura_abrigo_150cm}{Temperatura a 1.5 m en °C (dbl)}
#'   \item{temperatura_abrigo_150cm_maxima}{Máxima diaria en °C (dbl), si aplica}
#'   \item{temperatura_abrigo_150cm_minima}{Mínima diaria en °C (dbl), si aplica}
#'   \item{...}{Otras variables disponibles según el CSV}
#' }
#' @source \url{https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0472.csv}
#' @usage data(NH0472, package = "meteoR")
#' @examples
#' \dontrun{
#' data(NH0472, package = "meteoR")
#' head(NH0472)
#' }
"NH0472"

#' Estación NH0046 — datos meteorológicos de ejemplo
#'
#' Subconjunto de observaciones horarias para la estación NH0046.
#' @format Ver \code{\link{NH0472}}.
#' @source \url{https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0046.csv}
#' @usage data(NH0046, package = "meteoR")
"NH0046"

#' Estación NH0910 — datos meteorológicos de ejemplo
#'
#' Subconjunto de observaciones horarias para la estación NH0910.
#' @format Ver \code{\link{NH0472}}.
#' @source \url{https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0910.csv}
#' @usage data(NH0910, package = "meteoR")
"NH0910"
