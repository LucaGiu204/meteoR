test_that("leer estacion funciona", {
  ruta_temp <- file.path(tempdir(), "NH0472.csv")

  datos <- leer_estacion("NH0472", ruta_temp)

  expect_s3_class(datos, "data.frame")
  expect_true(all(c("fecha", "id") %in% colnames(datos)))

  expect_true(nrow(datos) > 0)
})
