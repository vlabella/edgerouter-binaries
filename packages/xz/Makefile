#
# -- Makefile for xz build for EdgeRouter
#
THIS_MAKEFILE := $(lastword $(MAKEFILE_LIST))
THIS_DIR      := $(dir $(THIS_MAKEFILE))
include $(THIS_DIR)/../../common/config.mak

VERSION        := 5.8.2
BIN_NAME       := xz
ZIP_FILE_SRC   := $(BIN_NAME)-$(VERSION).tar.gz
D              := $(BIN_NAME)-$(VERSION)
CMAKE_OPTS     := -DCMAKE_INSTALL_PREFIX="$(D)/stage/__TAG__" -DBUILD_SHARED_LIBS=OFF
BINARIES       := $(BIN_NAME) xzdec lzmadec lzmainfo
SCRIPTS        := xzdiff xzgrep xzless xzmore
TARGET_FOLDER  := $(BIN_NAME)-$(VERSION)
PACKAGE_32     := $(TARGET_FOLDER)-$(ER)-$(MIPS32_TAG).tar.gz
PACKAGE_64     := $(TARGET_FOLDER)-$(ER)-$(MIPS64_TAG).tar.gz

all:
	echo noop

download:
	curl -L -o $(ZIP_FILE_SRC) https://tukaani.org/xz/$(ZIP_FILE_SRC)

install:
	$(UNTAR) $(ZIP_FILE_SRC)

init-build:
	cmake -S $(D) -B $(D)/$(BMBE32) -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=$(TOOLCHAIN_FILE_MIPS32) $(subst __TAG__,$(MIPS32_TAG),$(CMAKE_OPTS))
	cmake -S $(D) -B $(D)/$(BM64)   -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=$(TOOLCHAIN_FILE_MIPS64) $(subst __TAG__,$(MIPS64_TAG),$(CMAKE_OPTS))

build:
	cmake --build $(D)/$(BMBE32)
	cmake --build $(D)/$(BM64)

strip:
	cd $(D)/$(BM64) ; $(MUSL_64)/bin/$(STRIP_MIPS64) -s $(BINARIES)
	cd $(D)/$(BMBE32) ; $(MUSL_32)/bin/$(STRIP_MIPS32) -s $(BINARIES)

stage:
	cd $(D)/$(BMBE32) ; make install
	cd $(D)/$(BM64) ; make install

pack:
	tar -czf $(PACKAGE_64) -C $(D)/stage/$(MIPS64_TAG) .
	tar -czf $(PACKAGE_32) -C $(D)/stage/$(MIPS32_TAG) .

store:
	-mkdir -p $(PREBUILT_LOC)/$(MIPS32_TAG)/$(BIN_NAME)
	cp $(PACKAGE_32) $(PREBUILT_LOC)/$(MIPS32_TAG)/$(BIN_NAME)
	-mkdir -p $(PREBUILT_LOC)/$(MIPS64_TAG)/$(BIN_NAME)
	cp $(PACKAGE_64) $(PREBUILT_LOC)/$(MIPS64_TAG)/$(BIN_NAME)

stage-destroy:
	-rm -rf $(D)/stage

build-destroy:
	-rm -rf $(D)/$(BM64)
	-rm -rf $(D)/$(BMBE32)

destroy:
	-rm -rf $(D)
	-rm $(ZIP_FILE_SRC) $(PACKAGE_32) $(PACKAGE_64)

init: download install init-build build strip stage pack store

redo: destroy init