# this one is important
SET(CMAKE_SYSTEM_NAME Linux)
#this one not so much
SET(CMAKE_SYSTEM_VERSION 1)

# specify the cross compiler
SET(BUILDROOT_PATH           "/root/source")
SET(ENV{STAGING_DIR}         "${BUILDROOT_PATH}")
SET(TOOLCHAIN_NAME           "toolchain-mipsel_24kc_gcc-5.4.0_musl-1.1.16")
SET(TARGET_NAME              "target-mipsel_24kc_musl-1.1.16")
SET(STAGING_DIR_RELATIVE     "staging_dir")
SET(TOOLCHAIN_RELATIVE       "${STAGING_DIR_RELATIVE}/${TOOLCHAIN_NAME}")
SET(TARGET_RELATIVE          "${STAGING_DIR_RELATIVE}/${TARGET_NAME}")

SET(TOOLCHAIN                "${BUILDROOT_PATH}/${TOOLCHAIN_RELATIVE}")
SET(TOOLCHAIN_BIN            "${TOOLCHAIN}/bin")
SET(TOOLCHAIN_INCLUDE        "${BUILDROOT_PATH}/${TOOLCHAIN_RELATIVE}/include")
SET(TOOLCHAIN_LIB            "${BUILDROOT_PATH}/${TOOLCHAIN_RELATIVE}/lib")
SET(TOOLCHAIN_USR_INCLUDE    "${BUILDROOT_PATH}/${TOOLCHAIN_RELATIVE}/usr/include")
SET(TOOLCHAIN_USR_LIB        "${BUILDROOT_PATH}/${TOOLCHAIN_RELATIVE}/usr/lib")

SET(TARGET                   "${BUILDROOT_PATH}/${TARGET_RELATIVE}")
SET(TARGET_INCLUDE           "${BUILDROOT_PATH}/${TARGET_RELATIVE}/include")
SET(TARGET_LIB               "${BUILDROOT_PATH}/${TARGET_RELATIVE}/lib")
SET(TARGET_USR_INCLUDE       "${BUILDROOT_PATH}/${TARGET_RELATIVE}/usr/include")
SET(TARGET_USR_LIB           "${BUILDROOT_PATH}/${TARGET_RELATIVE}/usr/lib")

SET(TOOLCHAIN_CC             "${TOOLCHAIN_BIN}/mipsel-openwrt-linux-gcc")
SET(TOOLCHAIN_CXX            "${TOOLCHAIN_BIN}/mipsel-openwrt-linux-g++")
SET(TOOLCHAIN_AR             "${TOOLCHAIN_BIN}/mipsel-openwrt-linux-ar")
SET(TOOLCHAIN_RANLIB         "${TOOLCHAIN_BIN}/mipsel-openwrt-linux-ranlib")

SET(ALL_INCLUDES             "-I ${TOOLCHAIN_USR_INCLUDE} -I ${TOOLCHAIN_INCLUDE} -I ${TARGET_USR_INCLUDE} -I ${TARGET_INCLUDE}")
SET(TOOLCHAIN_CFLAGS         "-Os -pipe -mno-branch-likely -mips32r2 -mtune=24kc -fno-caller-saves -fno-plt -fhonour-copts -Wno-error=unused-but-set-variable -Wno-error=unused-result -msoft-float -mips16 -minterlink-mips16 -Wformat -Werror=format-security -fstack-protector -D_FORTIFY_SOURCE=1 -Wl,-z,now -Wl,-z,relro")
SET(TOOLCHAIN_CFLAGS         "${TOOLCHAIN_CFLAGS} ${ALL_INCLUDES}")
SET(TOOLCHAIN_CXXFLAGS       "${TOOLCHAIN_CFLAGS}")
SET(TOOLCHAIN_LDFLAGS        "-L${TOOLCHAIN_USR_LIB} -L${TOOLCHAIN_LIB} -L${TARGET_USR_LIB} -L${TARGET_LIB}")

SET(CMAKE_C_COMPILER         ${TOOLCHAIN_CC})
SET(CMAKE_CXX_COMPILER       ${TOOLCHAIN_CXX}) 
SET(CMAKE_AR                 ${TOOLCHAIN_AR})
SET(CMAKE_RANLIB             ${TOOLCHAIN_RANLIB})

# where is the target environment 
SET(CMAKE_FIND_ROOT_PATH     ${BUILDROOT_PATH}/${TOOLCHAIN_RELATIVE})
#SET(CMAKE_FIND_ROOT_PATH  /root/source/staging_dir/toolchain-mipsel_24kc_gcc-5.4.0_musl-1.1.16)

# search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY) 
