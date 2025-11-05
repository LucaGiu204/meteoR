test_that("leer estacion funciona", {
  ruta_temp <- file.path(tempdir(), "NH0472.csv")

  datos <- leer_estacion("NH0472", ruta_temp)

  expect_s3_class(datos, "data.frame")
  expect_true(all(c("fecha", "id") %in% colnames(datos)))

  expect_true(nrow(datos) > 0)


test_that("leer_estacion lee un archivo existente sin descargar", {
    withr::local_tempdir()

    ruta <- file.path(tempdir(), "NH0472.csv")

    writeLines(
      c("fecha,id,temperatura_abrigo_150cm",
        "2024-01-01,NH0472,20"),
      ruta
    )


    expect_message(
      df <- leer_estacion("NH0472", ruta),
      "ya existe en esa direccion|ya existe en esa dirección",
      ignore.case = TRUE
    )

    expect_s3_class(df, "data.frame")
    expect_true(all(c("fecha","id","temperatura_abrigo_150cm") %in% names(df)))
    expect_equal(nrow(df), 1)
    expect_equal(df$id[1], "NH0472")
    expect_equal(df$temperatura_abrigo_150cm[1], 20)
  })

})
