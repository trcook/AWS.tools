os.specific <- new.env()

.onAttach <- function(libname, pkgname) {
    os.specific$os <- R.Version()$os
    if(R.Version()$os=="mingw32") {
        os.specific$suffix <- ".cmd"
    } else {
        os.specific$suffix <- ""
    }

    os.specific$ec2.tools.version <- "ec2-api-tools-1.5.1.0"

    if(Sys.getenv("AWSACCESSKEY") != "") {
        os.specific$awsaccesskey <- Sys.getenv("AWSACCESSKEY")
    } else {
        packageStartupMessage("AWSACCESSKEY not found in env variables.")
    }
    if(Sys.getenv("AWSSECRETKEY") != "") {
        os.specific$awssecretkey <- Sys.getenv("AWSSECRETKEY")
    } else {
        packageStartupMessage("AWSSECRETKEY not found in env variables.")
    }
}
