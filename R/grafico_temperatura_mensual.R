grafico_temperatura_mensual <- function(datos, colores, titulo = "Temperatura") {
  datos %>%
    mutate(mes = month(fecha)) %>%
    group_by(estacion, mes) %>%
    summarise(promedio = mean(temperatura_abrigo_150cm, na.rm = TRUE)) %>%
    ggplot::ggplot(aes(x = mes, y = promedio, color = estacion)) +
    geom_line() +
    scale_color_manual(values = colores) +
    labs(title = titulo)
}

grafico_temperatura_mensual(datos_estaciones, colores = c("NH0437" = "blue", "NH0046" = "red"))
