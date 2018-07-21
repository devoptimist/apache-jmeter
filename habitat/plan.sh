pkg_name=apache-jmeter
pkg_description="JMeter: Java performance testing"
pkg_origin=devoptimist
pkg_version="4.0"
pkg_maintainer="Steve Brown <sbrown@chef.io>"
pkg_license=('Apache-2.0')
pkg_deps=(core/jre8 core/gawk core/busybox-static)
pkg_source="http://mirror.ox.ac.uk/sites/rsync.apache.org/jmeter/binaries/${pkg_name}-${pkg_version}.zip"
pkg_bin_dirs=("bin")
pkg_shasum="5474567e9daf28a21e936f08450819cc69f985f32e8090ec5829c6261ec8c1d8"

do_build()
{
  return 0
}

do_install()
{
  mkdir -p ${PREFIX}/jm
  cp -r ${HAB_CACHE_SRC_PATH}/${pkg_name}-${pkg_version}/* ${PREFIX}/jm
  wrap_bin
}

wrap_bin() {
  local bin="${pkg_prefix}/bin/${pkg_name}"
  local real_bin_path="${pkg_prefix}/jm/bin"
  build_line "Adding wrapper bin"
  cat <<EOF > "${bin}"
#!$(pkg_path_for busybox-static)/bin/sh
set -e
export JAVA_HOME=$(pkg_path_for core/jre8)
exec ${real_bin_path}/\$@
EOF
  chmod -v 755 "${bin}"
}
