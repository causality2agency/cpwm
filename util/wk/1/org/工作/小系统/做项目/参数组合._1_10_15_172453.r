#
# 1
function( ...) {
  L <- list( ...)
  if( '' %in% names( L)) {
    i <- which( names( L) == '')
    names( L)[ i] <- sapply( as.list( substitute( c( ...)))[ -1][ i], paste)
  }
  d <- sapply( L, length)
  array( vector( 'list', prod( d)), dim = d, dimnames = L)
}
