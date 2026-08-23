# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2017 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libaio"
PKG_VERSION="0.3.113"
PKG_SHA256="25f2835de4fe3db1472252a3e3ff572cfdbad291430f4ad14dc475fc4f28ab10"
PKG_LICENSE="LGPL-2.0-or-later"
PKG_SITE="https://pagure.io/libaio"
PKG_URL="https://github.com/yugabyte/${PKG_NAME}/archive/refs/tags/${PKG_NAME}-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="make:host gcc:host"
PKG_LONGDESC="Kernel Asynchronous I/O (AIO) Support for Linux."

make_target() {
  make -C src
}

makeinstall_target() {
  mkdir -p ${SYSROOT_PREFIX}/usr/lib
    cp -PR src/libaio.a ${SYSROOT_PREFIX}/usr/lib

  mkdir -p ${SYSROOT_PREFIX}/usr/include
    cp -PR src/libaio.h ${SYSROOT_PREFIX}/usr/include
}
