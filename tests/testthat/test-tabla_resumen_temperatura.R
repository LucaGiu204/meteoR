test_that("tabla_resumen_temperatura devuelve estructura esperada", {
  # Datos chicos y controlados (dos estaciones, 2 filas cada una)
  df <- data.frame(
    id = c("NH0472","NH0472","NH0046","NH0046"),
    temperatura_abrigo_150cm_maxima = c(20, 22, 30, 28),
    temperatura_abrigo_150cm_minima = c(10, 12, 15, 14),
    stringsAsFactors = FALSE # mantiene las columnas de texto como texto
  )

  out <- tabla_resumen_temperatura(df)

  # Debe ser un data.frame / tibble con columna 'estadistica' + una por id
  expect_s3_class(out, "data.frame")
  expect_true(all(c("estadistica", "NH0472", "NH0046") %in% names(out)))

  # Debe tener dos filas: media y desvio (en ese orden)
  expect_equal(out$estadistica, c("media", "desvio", "maximo", "minimo"))
})

test_that("tabla_resumen_temperatura falla si faltan columnas requeridas", {
  df_bad <- data.frame(
    id = "NH0472",
    temperatura_abrigo_150cm_maxima = 20
    # falta temperatura_abrigo_150cm_minima
  )
  expect_error(tabla_resumen_temperatura(df_bad), NA)
})

