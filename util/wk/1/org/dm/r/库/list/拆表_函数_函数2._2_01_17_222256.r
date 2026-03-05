#
function( L, fun, fun2 = any) {
  # 【功能】拆表，应用fun，分组应用fun2
  a <- fun( unlist( L, recursive = FALSE, use.names = FALSE))
  g <- rep( seq_along( L), sapply( L, length))
  tapply( a, g, fun2)
}
fun1 <- function( L, fun, fun2 = any) {
  dt1 <- data.table::data.table( fun( unlist( L, recursive = FALSE, use.names = FALSE)))
  dt1[, 'V2' := rep( seq_along( L), sapply( L, length))]
  dt1[, fun2( V1), by = 'V2'][, V1]
}
