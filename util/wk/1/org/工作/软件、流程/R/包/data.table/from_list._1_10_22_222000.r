#
function( L, top_name = 'group') {

  l1 <- data.table::as.data.table( head( L[[ 1]]))
  if( top_name %in% names( l1)) stop( '[_1_10_22_232029]')
  if( anyDuplicated( names( l1))) stop( '[_1_10_22_232117]')

  L <- lapply( L, data.table::as.data.table)
  r <- data.table::rbindlist( L)
  v1 <- rep( names( L), sapply( L, '[', , .N))
  data.table::set( r, , top_name, v1)
  data.table::setcolorder( r, top_name)
  return( r)

  #r <- data.table::data.table( rep( names( L), sapply( L, length)))
  r <- data.table::data.table( vector( 'character', ))
  data.table::setnames( r, top_name)

  for( j in names( l1)) {
    data.table::set( r, , j, .wk[[ 'make_na']]( l1[[ j]]))
  }

  row_start <- 1
  j <- names( r)[ -1]
  lapply( seq_along( L), function( i) {
    x <- data.table::as.data.table( L[[ i]])
    row_end <- row_start + x[, .N - 1]
    data.table::set( r, seq.int( row_start, row_end), j, x)
    row_start <<- row_end + 1
    {}
  })

  r
}
if(0){
  L <- list( 'a' = 1:3, 'b' = 2:3)
  .wk[[ 'get_fun']]( 'from_list._1_10_22_222000')( L)
  ?data.table::data.table
  vector( 'character', sum( sapply( L, length)))
}
