testthat::test_that("grafico_temperatura_mensual works correctly", {
  # Crear un conjunto de datos de ejemplo
  datos_ejemplo <- data.frame(
    fecha = seq(as.Date("2023-01-01"), as.Date("2023-12-31"), by = "month"),
    temperatura = c(15, 16, 18, 20, 22, 25, 27, 26, 24, 20, 18, 16)
  )

  # Crear un objeto de clase 'estacion_meteorologica'
  estacion_ejemplo <- list(datos = datos_ejemplo)
  class(estacion_ejemplo) <- "estacion_meteorologica"

  # Generar el gráfico
  grafico <- grafico_temperatura_mensual(estacion_ejemplo)

  # Verificar que el gráfico es un objeto ggplot
  testthat::expect_s3_class(grafico, "ggplot")

  # Verificar que el gráfico tiene los ejes correctos
  testthat::expect_equal(grafico$labels$x, "Mes")
  testthat::expect_equal(grafico$labels$y, "Temperatura Promedio (°C)")
})
