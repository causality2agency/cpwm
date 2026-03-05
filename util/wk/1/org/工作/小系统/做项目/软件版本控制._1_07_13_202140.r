#
local({
  b3sum_fp <- {}
  if(0)get_info <- \( fp) {
    column_1 <- .wk[['acc']]()
    column_2 <- .wk[['acc']]()

    # blake3sum
    if( ! length( b3sum_fp))
      b3sum_fp <<- .wk[['get_fun']]( '用conda/找软件._1_07_12_091131')( 'b3sum')
    column_1[[ 'add']]( 'blake3sum')
    column_2[[ 'add']]( .wk[['sys']]( c( .wk[['sys_safe_file_path']]( b3sum_fp), .wk[['sys_safe_file_path']]( fp)), intern = 1))

    # 版本
    column_1[[ 'add']]( '版本')
    column_2[[ 'add']]( .wk[['get_fun']]( '软件版本._1_07_13_214657')( fp))

    .wk[['dt']]( column_1[[ 'get']](), column_2[[ 'get']]())
  }
  get_info <- function( fp, get_version = 1) {
    r <- list()

    # blake3sum
    if( ! length( b3sum_fp))
      b3sum_fp <<- .wk[['get_fun']]( '用conda/找软件._1_07_12_091131')( 'b3sum')
    r[[ 'blake3sum']] <- .wk[['re']]( .wk[['sys']]( c( .wk[['sys_safe_file_path']]( b3sum_fp), .wk[['sys_safe_file_path']]( fp)), intern = 1), '[^ ]+')

    if( get_version) # 版本
      r[[ '版本']] <- .wk[['get_fun']]( '软件版本._1_07_13_214657')( fp)

    r
  }
  save_info <- function( info, fp) {
    # .wk[['dt_fwrite']]( info, .wk[['file_path']]( fp))
    .wk[[ 'cat2file']]( base::deparse( info), file = fp)
  }
  load_info <- function( fp)
    eval( parse( fp)) # .wk[['dt_fread']]( fp, cn = 0)
  info_dif <- function(info1, info2) {
    for( f1 in 'blake3sum')
      if( ! identical( info1[[ f1]], info2[[ f1]]))
        return( TRUE)
    FALSE
  }
  function( bin_fp, uid, act = 'stop', rm = 0, only_info = 0) {
    # 根据前后的'blake3sum'
    # [待办]r包的版本。备用函数：packageVersion，package_version
    info_fp <- paste0( .wk[['uid.file_path']]( uid, ._prj_folder), '.tsv.gz')
    if( rm)
      .wk[['file_rm']]( info_fp, rm_empty_upstream = 1)
    if( only_info)
      return( get_info( bin_fp))
    if( file.exists( info_fp)) {
      info_before <- load_info( info_fp)
      info_this <- get_info( bin_fp, get_version = 0)
      if( info_dif( info_this, info_before))
        switch(
          act,
          'stop' = stop( '[_1_07_13_205257]', bin_fp, '和之前用的不一样'),
          'warn' = warning( '[_1_07_13_205257]', bin_fp, '和之前用的不一样'),
          'replace' = save_info( get_info( bin_fp), fp = info_fp),
          browser( '_1_07_13_205404')
        )
    } else
      save_info( get_info( bin_fp), fp = .wk[[ 'file_path']]( info_fp))
  }
})

a=.wk[['get_fun']]( '软件版本控制._1_07_13_202140')(
  bin_fp = .wk[['get_fun']]( '用conda/找软件._1_07_12_091131')( 'bedtools'),
  uid = '_1_07_14_181524'
)
a <- local({
  a <- 2
  as.function( c( if( 0) alist( a =), alist( val = NULL), quote( a + 1)))
})
a()
a=do.call( as.function, list( c( alist( a =), alist( val = NULL), list( 1 + 1))))
typeof( alist( a =))
environment(a)[['a']]<-99
a=as.function( alist( message( '_1_07_14_203936')))
a=as.function( list({ bquote({ x <- .( a); x ^ 2})}))
