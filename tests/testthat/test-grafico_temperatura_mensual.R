test_that("grafico_temperatura_mensual devuelve un objeto ggplot válido", {
  df <- data.frame(
    fecha = as.Date(c("2024-01-10", "2024-02-15", "2024-03-20", "2024-01-12")),
    id = c("NH0472", "NH0472", "NH0472", "NH0046"),
    temperatura_abrigo_150cm = c(20, 22, 21, 19)
  )

  # No debería tirar warnings
  expect_warning(
    p <- grafico_temperatura_mensual(df),
    NA
  )

  # Es un ggplot
  expect_s3_class(p, "ggplot")

  # Tiene al menos una capa geométrica (la línea)
  expect_true(length(p$layers) >= 1)

  # Título correcto
  expect_equal(p$labels$title, "Temperatura Promedio Mensual")
})

test_that("grafico_temperatura_mensual tiene los mapeos esperados", {
  df <- data.frame(
    fecha = as.Date(c("2024-01-10","2024-02-10","2024-01-15","2024-02-15")),
    id = c("NH0472","NH0472","NH0046","NH0046"),
    temperatura_abrigo_150cm = c(20,22,19,21)
  )

  p <- grafico_temperatura_mensual(df)

  # Los tres mapeos existen
  expect_true(all(c("x","y","colour") %in% names(p$mapping)))

  # Convertir quosures -> texto
  mx <- rlang::as_label(p$mapping$x)
  my <- rlang::as_label(p$mapping$y)
  mc <- rlang::as_label(p$mapping$colour)

  expect_equal(mx, "mes")
  expect_equal(my, "promedio")
  expect_equal(mc, "id")
})


test_that("usa la paleta manual fija (blue, red)", {
  df <- data.frame(
    fecha = as.Date(c("2024-01-10","2024-02-10","2024-01-15","2024-02-15")),
    id = c("NH0472","NH0472","NH0046","NH0046"),
    temperatura_abrigo_150cm = c(20,22,19,21)
  )

  p <- grafico_temperatura_mensual(df)

  # Verifica que la escala manual se haya aplicado
  expect_true(any(vapply(p$scales$scales, function(s) inherits(s, "ScaleDiscrete"), logical(1))))
  expect_equal(p$scales$scales[[1]]$palette(2), c("blue","red"))
})

test_that("falla si falta temperatura_abrigo_150cm", {
  df_bad <- data.frame(
    fecha = as.Date("2024-01-10"),
    id = "NH0472"
  )

  expect_error(
    grafico_temperatura_mensual(df_bad),
    "object 'temperatura_abrigo_150cm' not found"
  )
})
