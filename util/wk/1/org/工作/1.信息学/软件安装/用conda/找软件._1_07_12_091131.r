#
#1
local({
  make_env_all <- function( conda) {
    env_info <- .wk[['sys']]( c( conda, 'env list'), intern = 1)

    # 去掉表头
    env_info <- tail( env_info, -2)

    # 去掉第一列之前的空格
    i <- min( regexpr( '[^ ]', env_info))
    env_info <- substring( env_info, i)

    # 保留有名称的环境
    env_info <- .wk[['grepV']]( env_info, '^[^ ]+')

    env <- .wk[[ 're']]( env_info, '^[^ ]+')

    # 去掉环境名
    a <- regexpr( '^[^ ]+', env_info)
    env_info <- substring( env_info, max( attr( a, 'match.length')) + 1)

    # 去掉第一列之前的空格
    i <- min( regexpr( '[^ ]', env_info))
    env_info <- substring( env_info, i)

    # 把当前环境放到第一个
    i <- which( substr( env_info, 1, 1) == '*') # 当前环境
    if( ! length( i)) .wk[[ 'base_browser']]( '_1_08_03_102346')
    i <- union( i, seq_along( env))
    env <- env[ i]
    env_info <- env_info[ i]

    # 环境路径
    env_path <- {
      env_info <- substring( env_info, 2)
      .wk[['str_trim']]( env_info)
    }

    .wk[[ 'add_name']]( env, file.path( env_path, 'bin'))
  }
  env_find_bin <- function( env, bin, conda) {
    env1_bin_fp <- file.path( .wk[['sys']]( c( conda, 'run -n', env1, 'bash -c', shQuote( 'echo $CONDA_PREFIX')), intern = 1), 'bin')
    bin_fp <- file.path( env1_bin_fp, bin)
  }
  function( bin, env, conda = 'micromamba') {

    env_all <- make_env_all( conda)
    if( missing( env)) { # @_1_08_18_221229@
      env <- names( env_all)
    }
    for( env1 in env) {
      bin_fp <- file.path( env_all[ env1], bin)
      if( file.exists( bin_fp))
        return( bin_fp)
    }

    stop( '[_1_07_12_095000]还没安装', bin)

    bin_db_fp <- .wk[['file_handy']]( '_1_07_12_104526', extension = 'tsv.gz') # 第一列是环境名称，第二列是文件路径
    if( ! file.exists( bin_db_fp)) local({
      
    })
    bin_db <- .wk[['dt_fread']]( bin_db_fp, cn = 0)

    # 若找到过，则返回找到的
    a <- bin_db[[ bin]]
    if( length( a) && file.exists( a)) return( a)

    # 有哪些环境？
    if( missing( env))
      env <- env_all()

    for( env1 in env) {
      .wk[['hs.msg']]( env1)
      bin_fp <- .wk[['sys']](
        c( conda, 'run -n', env1, 'which', bin),
        intern = 1)
      if( length( bin_fp)) {
        bin_db[[ bin]] <<- bin_fp
        return( bin_fp)
      }
    }
  }
})
if(0){
  .wk[['get_fun']]( '用conda/找软件._1_07_12_091131')( 'bedtools')
  .wk[['get_fun']]( '用conda/找软件._1_07_12_091131')( 'samtools')
  .wk[[ 'sys_bash']]()
  environment( .wk[['get_fun']]( '找软件._1_07_12_091131'))[['bin_db']]
  .wk[['sys']]( 'micromamba run -n genomics which bedtools', intern = 1)
  .wk[['sys']]( 'micromamba run -n genomics which bedtool', intern = 1)
}
