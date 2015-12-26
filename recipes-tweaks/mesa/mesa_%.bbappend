DEPENDS += "libxml2 python-lxml"

FILESEXTRAPATHS_prepend := "${THISDIR}/mesa:"
SRC_URI += "file://mesa-fstat.patch"

PACKAGECONFIG_x86-64 = " egl gles dri dri3 x11 xa r600 gallium gallium-llvm xvmc"

GALLIUMDRIVERS_LLVM33 = "${@bb.utils.contains('PACKAGECONFIG', 'r600', 'r600', '', d)}"

GALLIUMDRIVERS_append_armv7a = ",freedreno"
GALLIUMDRIVERS_append_aarch64 = ",freedreno"

PACKAGECONFIG_append_armv7a = " gallium \
                         ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xa', '', d)} \
                       "
PACKAGECONFIG_append_aarch64 = " gallium \
                         ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xa', '', d)} \
                       "

FILES_mesa-megadriver += "${libdir}/libXvMC*.so.*"
