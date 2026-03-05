library(util.wk20302153618)

environment(.wk[["get_fun"]])[["code_base"]] <- dirname(dirname("/path/to/this/file"))

# modify the file '文件夹._1_06_24_215116.r' so that calling the function in it would return the folder path that you wish to put all the result in, like this:
function () 
{
    "/path/to/the/root/of/project/result"
}
# the folder structure of result would copy that of code_base
