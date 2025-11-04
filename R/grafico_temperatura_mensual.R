grafico_temperatura_mensual <- function(datos, colores = c("blue", "red"), titulo = "Temperatura") {
  datos |>
    dplyr::mutate(mes = lubridate::month(fecha)) |>
    dplyr::group_by(estacion, mes) |>
    dplyr::summarise(promedio = mean(temperatura_abrigo_150cm, na.rm = TRUE), .groups = "drop") |>
    ggplot2::ggplot(ggplot2::aes(x = mes, y = promedio, color = estacion)) +
    ggplot2::geom_line() +
    ggplot2::scale_color_manual(values = colores) +
    ggplot2::labs(title = titulo)
}
