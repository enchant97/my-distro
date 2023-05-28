TEMP_PATH=/tmp/custom-arch-build

PKG_BUILD_PATH=$(TEMP_PATH)/pkg-repo
PKG_SRC_PATH=$(TEMP_PATH)/pkg-src

ARCHISO_WORK_PATH=$(TEMP_PATH)/archiso
ARCHISO_OUT_PATH=./out

iso: clean mkiso
repo: build-aur add-repo-pkgs

clean:
	rm -rf $(ARCHISO_WORK_PATH)
	rm -rf $(PKG_SRC_PATH)

clean-all: clean
	rm -rf $(ARCHISO_OUT_PATH)
	rm -rf $(PKG_BUILD_PATH)

mkdir:
	mkdir -p $(ARCHISO_OUT_PATH) $(PKG_BUILD_PATH) $(PKG_SRC_PATH) $(ARCHISO_WORK_PATH)

build-aur: mkdir
	./package_build.sh $(PKG_BUILD_PATH) $(PKG_SRC_PATH)

add-repo-pkgs: mkdir
	mkdir -p $(PKG_BUILD_PATH)
	repo-add -R -n $(PKG_BUILD_PATH)/custom.db.tar.gz $(PKG_BUILD_PATH)/*.pkg.tar.zst

mkiso: mkdir
	mkarchiso -v -w $(ARCHISO_WORK_PATH) -o $(ARCHISO_OUT_PATH) .
