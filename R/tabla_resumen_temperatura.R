#' Title Tabla Resumen de Temperatura
#'
#' @param datos el nombre del dataframe con las columnas id, temperatura_abrigo_150cm_maxima, temperatura_abrigo_150cm_minima
#'
#' @returns dataframe con la temperatura media, desviacion estandar, maximo y minimo por id
#' @export
#'
#' @examples
#'  tabla_resumen_temperatura(NH0046)
tabla_resumen_temperatura <- function(datos) {
  datos |>
    dplyr::select(id, temperatura_abrigo_150cm_maxima, temperatura_abrigo_150cm_minima) |>
    tidyr::pivot_longer(cols = c(temperatura_abrigo_150cm_maxima, temperatura_abrigo_150cm_minima),
                 names_to = "tipo",
                 values_to = "valor") |>
    dplyr::group_by(id) |>
    dplyr::summarise(
      media = mean(valor, na.rm = TRUE),
      desvio = stats::sd(valor, na.rm = TRUE),
      maximo = max(valor, na.rm = TRUE),
      minimo = min(valor, na.rm = TRUE))|>
    tidyr::pivot_longer(cols = c(media, desvio, maximo, minimo),
                 names_to = "estadistica",
                 values_to = "valor") |>
    tidyr::pivot_wider(names_from = id, values_from = valor)
}

