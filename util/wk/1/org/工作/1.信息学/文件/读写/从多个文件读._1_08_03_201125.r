#
function( fp, ...) {
  .wk[[ 'with_tempFile']]({
    for( fp1 in fp) {
      .wk[[ 'say0']](
        if( file.exists( fp1)) .wk[[ 'sys_cat_text']]( fp1) else fp1,
        file = fp2, append = TRUE)}
    .wk[[ 'dt_fread']]( cmd = paste( 'bash', fp2), ...)})}
