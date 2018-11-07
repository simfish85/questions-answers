$pkg_name="questions-answers"
$pkg_origin="simfish85"
$pkg_version="0.1.0"
$pkg_maintainer="Simon Fisher <simfish85@googlemail.com>"
$pkg_license=@("Apache-2.0")
$pkg_build_deps=@("core/visual-build-tools-2017", "core/nuget")

function Invoke-Download {
    $Destination = "$HAB_CACHE_SRC_PATH/$pkg_name"
    If((Test-Path $Destination) -eq $true) {
        Remove-Item -Recurse -Path $Destination
    }
    New-Item -ItemType Directory -Path $Destination
    Copy-Item -Force $PLAN_CONTEXT/../src/* $Destination -recurse
}

function Invoke-Verify {
    return 0
}

function Invoke-Build {
    $solutionPath = "$HAB_CACHE_SRC_PATH/$pkg_name/ModuleZeroSampleProject.sln"
    MSBuild.exe $solutionPath /p:VisualStudioVersion=14.0 /p:PublishProfile=Release /p:DeployOnBuild=true
}
# $pkg_filename="$pkg_name-$pkg_version.zip"
# $pkg_shasum="TODO"
# $pkg_deps=@()
# $pkg_build_deps=@()
# $pkg_lib_dirs=@("lib")
# $pkg_include_dirs=@("include")
# $pkg_bin_dirs=@("bin")
# $pkg_svc_run="MyBinary.exe"
# $pkg_exports=@{
#   host="srv.address"
#   port="srv.port"
#   ssl-port="srv.ssl.port"
# }
# $pkg_exposes=@("port", "ssl-port")
# $pkg_binds=@{
#   database="port host"
# }
# $pkg_binds_optional=@{
#   storage="port host"
# }
# $pkg_description="Some description."
# $pkg_upstream_url="http://example.com/project-name"
