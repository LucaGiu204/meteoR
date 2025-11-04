#' Title Grafico de Temperatura Promedio Mensual
#'
#' @param datos dataframe con las columnas fecha, id y temperatura_abrigo_150cm
#' @param colores colores de las lineas del grafico
#' @param titulo titulo del grafico
#'
#' @returns grafico de lineas con la temperatura promedio mensual por id
#' @export
#'
#' @examples
#'   grafico_temperatura_mensual(NH0046)
grafico_temperatura_mensual <- function(datos, colores = c("blue", "red"), titulo = "Temperatura Promedio Mensual") {
  datos |>
    dplyr::mutate(mes = lubridate::month(fecha)) |>
    dplyr::group_by(id, mes) |>
    dplyr::summarise(promedio = mean(temperatura_abrigo_150cm, na.rm = TRUE), .groups = "drop") |>
    ggplot2::ggplot(ggplot2::aes(x = mes, y = promedio, color = id)) +
    ggplot2::geom_line() +
    ggplot2::scale_color_manual(values = colores) +
    ggplot2::labs(title = titulo)
}
