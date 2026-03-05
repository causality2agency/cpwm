#
function( bin_fp) {
  if( basename( bin_fp) %in% c( 'bedtools', 'R', 'fimo')) {
    paste( .wk[['sys']]( c( bin_fp, '--version'), intern = 1), collapse = '\n')
  } else
    browser( '_1_07_13_214910')
}
.wk[['get_fun']]( '软件版本._1_07_13_214657')( .env_wengkai[['get_fun']]( '用conda/找软件._1_07_12_091131')( 'R'))

