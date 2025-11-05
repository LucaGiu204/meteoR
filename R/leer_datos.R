#' Leer datos de una estacion meteorologica
#'
#' @param id El id de la estacion a leer
#' @param ruta Ruta donde se descargan o leen los datos
#'
#' @returns Un dataframe con los datos de la estacion en la ruta indicada
#' @export
#'
#' @examples
#'   ruta_tmp <- file.path(tempdir(), "NH0472.csv")
#'   df <- leer_estacion("NH0472", ruta_tmp)
#'   head(df)
#'
leer_estacion <- function(id, ruta){
  url <- glue::glue("https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/{id}.csv")

  if(!file.exists(ruta)){
    cli::cli_inform("el archivo no existe en esa direccion, descargando...")
    utils::download.file(url, ruta, mode = "wb")
    cli::cli_inform("archivo descargado correctamente")
  } else {
    cli::cli_inform("el archivo ya existe en esa direccion, leyendo archivo...")
  }
  datos <- readr::read_csv(ruta)
  cli::cli_inform("archivo leido correctamente,")
  return(datos)
  }

