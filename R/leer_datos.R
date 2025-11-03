leer_estacion <- function(id, ruta){
  url <- glue::glue("https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/{id}.csv")

  if(!file.exists(ruta)){
    cli::cli_inform("el archivo no existe en esa direccion, descargando...")
    download.file(url, ruta, mode = "wb")
    cli::cli_inform("archivo descargado correctamente")
  } else {
    cli::cli_inform("el archivo ya existe en esa direccion, leyendo archivo...")
  }
  datos <- readr::read.csv(ruta)
  cli::cli_inform("archivo leido correctamente, el dataset tiene {nrow(datos)} filas y {ncol(datos)} columnas")
  }
