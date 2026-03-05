#
function() {
  wd <- .wk[[ 'task_folder']]( '_1_06_22_155510')
  wd1 <- .wk[[ 'get_fun']]( '基因组/_1_06_21_171640')()
  org <- {
    a <- .wk[[ 'pipe1']]( .wk[[ 'list_file']]( wd1, '\\.gz$'), x[ file.size( x) > 0], basename( x))
    .wk[[ 'sub']]( a, '(?i)\\.fasta\\.gz$')
  }
  .wk[[ 'with_wd']]( wd, {
    for( org1 in org) {
      for( url1 in
        c( file.path( 'https://ftp.psb.ugent.be/pub/plaza/plaza_public_dicots_05/GFF', org1, base::paste0( 'annotation.all_transcripts.all_features.', org1, '.gff3.gz')),
          file.path( 'https://ftp.psb.ugent.be/pub/plaza/plaza_public_dicots_05/GFF', org1, base::paste0( 'annotation.selected_transcript.all_features.', org1, '.gff3.gz')),
          paste0( 'https://ftp.psb.ugent.be/pub/plaza/plaza_public_dicots_05/Annotation/annotation.all_transcripts.', org1, '.csv.gz'),
          paste0( 'https://ftp.psb.ugent.be/pub/plaza/plaza_public_dicots_05/TranscriptMapping/transcript_mapping.all_transcripts.', org1, '.csv.gz'),
          paste0( 'https://ftp.psb.ugent.be/pub/plaza/plaza_public_dicots_05/IdConversion/id_conversion.', org1, '.csv.gz'),
          paste0( 'https://ftp.psb.ugent.be/pub/plaza/plaza_public_dicots_05/IntegrativeOrthologySpecies/integrative_orthology.', org1, '.tsv.gz')))
      {
        .wk[[ 'with_msg']]( url1, .wk[[ 'sys_wget']]( url1))
      }
    }
    for( a in c( 'HOM', 'ORTHO')) { # 同源
      url1 <- paste0( 'https://ftp.psb.ugent.be/pub/plaza/plaza_public_dicots_05/GeneFamilies/genefamily_data.', a, 'FAM.csv.gz')
      .wk[[ 'with_msg']](
        url1,
        .wk[[ 'sys_wget']]( url1))
    }
  })
  wd
}
if(0){
  wd=.wk[['get_fun']]( '基因/_1_06_22_155510')()
  .wk[['sys_ls']](wd)
  .wk[['sys_bash']](wd)
  .wk[[ 'sys_less']](file.path(wd,'integrative_orthology.gma.tsv.gz'))
  .wk[['sys_less']](.wk[['list_file']]( a, 'gff3\\.gz$')[ 1])
}
