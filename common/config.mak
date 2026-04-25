#
# -- config.mak  - shared info for all builds
#
HOST_64               := mips64-linux-musl
HOST_32               := mipsel-linux-musl
HOST_32BE             := mips32-linux-musl
MIPS32_TAG            := mips32
MIPS64_TAG            := mips64
ER                    := edgerouter
MUSL_64               := /opt/musl-toolchains/$(HOST_64)
MUSL_32               := /opt/musl-toolchains/$(HOST_32)
MUSL_32BE             := /opt/musl-toolchains/$(HOST_32BE)
CC                    := __HOST__-gcc
AR                    := __HOST__-ar
RANLIB                := __HOST__-ranlib
STRIP                 := __HOST__-strip
CFLAGS_64             := -pipe -march=octeon   -mabi=64 -Os -ffunction-sections -fdata-sections
CFLAGS_32             := -pipe -march=mips32r2 -mabi=32 -mfp32 -D_GNU_SOURCE -Os -ffunction-sections -fdata-sections
LDFLAGS               := -static -Wl,--gc-sections -pthread
TOOLCHAIN_FILE_MIPS64 := $(MUSL_64)/cmake/toolchain-mips64-musl.cmake
TOOLCHAIN_FILE_MIPS32 := $(MUSL_32)/cmake/toolchain-mipsel-musl.cmake
STRIP_MIPS32          := $(subst __HOST__,$(HOST_32),$(STRIP))
STRIP_MIPS64          := $(subst __HOST__,$(HOST_64),$(STRIP))
UNZIP                 := unzip -q
UN7ZIP                := 7z x -y -bd
UNXZIP                := 7z x -y -bd
UNTAR                 := tar -zxf
UNBZIP                := tar -xjf
UNGZIP                := tar -xzf
CMBUILD               := build
BM32                  := $(CMBUILD)-mipsel
BM64                  := $(CMBUILD)-mips64
BMBE32                := $(CMBUILD)-mips32
PREBUILT_LOC          := ../../prebuilt

