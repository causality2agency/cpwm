#
# 4
function() {
  wd <- .wk[['task_folder']]( '_1_06_21_171640')
  .wk[['with_wd']]( wd, {
    for( org1 in c( 'gma', 'vmu', 'lal', 'ath', 'cpa', 'mdo', 'ptr', 'fve', 'mtr', 'lja', 'tca', 'mes', 'vvi', 'osa')) {
      fp1 <- file.path( wd, paste0( org1, '.fasta.gz'))
      for( ext1 in c( '', '.fai', '.gzi')) {
        url1 <- file.path( 'https://ftp.psb.ugent.be/pub/plaza/plaza_public_dicots_05/Genomes', paste0( org1, '.fasta.gz', ext1))
        .wk[['with_msg']](
          url1,
          .wk[['sys_wget']]( url1))
      }
    }
  })
  wd
}
if(0){
  a=.wk[['get_fun']]( '基因组/_1_06_21_171640')()
  .wk[[ 'pipe1']]( .wk[[ 'list_file']]( a), x[ file.size( x) == 0])
  .wk[[ 'pipe1']]( .wk[[ 'list_file']]( a), x[ file.size( x) == 0], unlink( x))
  file.size(a)
  .wk[['sys_ls']](a)
}
