#
# 1
function( ot = 'n') {
  wd <- .wk[[ 'task_folder']]( '_1_08_12_130108')

  org_v <- .wk[[ 'get_fun']]( '物种._1_06_24_214742')()
  fp2_fun <- function( org) paste0( org, '.txt.gz')

  .wk[[ 'with_target']]( fp2_fun( org_v), where = wd, {

    gene_folder <- .wk[[ 'get_fun']]( '基因/_1_06_22_155510')() # <<_1_08_07_211952>>

    # 同源基因
    org_orth <- local({
      orth_fp <- file.path( gene_folder, 'genefamily_data.ORTHOFAM.csv.gz')
      orth_fp_con <- pipe( .wk[['sys_cat_skip']]( orth_fp), 'r')
      r <- .wk[[ 'get_fun']]( '1.信息学/文件/读写/提取/表格的子集.38_09_10_214239')( v1 = org_v, fp = orth_fp_con, ci1 = 2)
      .wk[[ 'dt_setnames']]( r, c( 'orth_grp', 'org', 'gene'))
      r[, 'gene' := tolower( gene)]
    })
    
    for( i in seq_along( org_v)) {
      org1 <- org_v[ i]
      fp2 <- fp2_fun( org1)
      if( file.exists( fp2)) next
      .wk[[ 'with_msg']]( org1, {
        a <- .wk[[ 'get_fun']]( '1.信息学/文件/读写/提取/表格的子集.38_09_10_214239')( v1 = 'gene', file.path( gene_folder, paste0( 'annotation.all_transcripts.all_features.', org1, '.gff3.gz')), ci1 = 3, ci2 = 9)
        a[, 'gene' := .wk[[ 're']]( V9, '(?<=gene_id=)[^;]+')]
        r <- .wk[[ 'with']]( a[[ 'gene']], tolower( x1), x1[ !( x2 %in% org_orth[[ 'gene']])])
        .wk[[ 'dt_fwrite']]( list( r), fp2)
      })
    }
  })

  fp2 <- .wk[[ 'pipe1']]( org_v, .wk[[ 'add_name']]( x, file.path( wd, fp2_fun( x))))
  file.size( fp2)
  .wk[[ 'sys_ls']]( fp2[ 'cpa'])
  sapply( fp2, function( fp1) {
    .wk[[ 'sys']]( c( .wk[[ 'sys_cat_skip']]( fp1), '| wc -l'), intern = 1)
  })
  switch(
    ot,
    'n' = {
      a <- sapply( fp2, function( fp1) {
        .wk[[ 'sys']]( c( .wk[[ 'sys_cat_skip']]( fp1), '| wc -l'), intern = 1)
      })
      .wk[[ 'add_name']]( org_v, as.numeric( a))
    },
    'fp' = fp2
  )
}
