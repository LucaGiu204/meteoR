testthat::test_that("leer_datos works correctly", {
  # Create a temporary CSV file for testing
  temp_file <- tempfile(fileext = ".csv")
  write.csv(data.frame(
    fecha = c("2023-01-01", "2023-01-02"),
    temperatura = c(15, 20),
    humedad = c(80, 75)
  ), temp_file, row.names = FALSE)

  # Test reading the data
  datos <- leer_datos(temp_file)

  # Check that the data is read correctly
  testthat::expect_equal(nrow(datos), 2)
  testthat::expect_equal(colnames(datos), c("fecha", "temperatura", "humedad"))
  testthat::expect_equal(datos$temperatura, c(15, 20))
  testthat::expect_equal(datos$humedad, c(80, 75))

  # Clean up
  unlink(temp_file)
})
