SHELL := /bin/bash
.DEFAULT_GOAL := build

ROOT := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
export CATBOOT_ROOT := $(ROOT)
export CATBOOT_JOBS ?= $(shell nproc 2>/dev/null || echo 2)
export KERNEL_VERSION ?= latest

.PHONY: all build check-deps toolchain kernel modules rootfs rootfs-dde initramfs iso qemu desktop desktop-test dde-target package-test package-build package-repo package-install-test package-rollback-test service-test hardware-test installer live windows meowbot browser clean rebuild test help

all build: toolchain kernel modules
	@./build/catboot-build.sh rootfs-dde
	@printf '\nCatBootOS build complete: %s\n' "$(CURDIR)/out"

check-deps:
	@./build/catboot-build.sh check-deps
toolchain:
	@./build/catboot-build.sh toolchain
kernel:
	@./build/catboot-build.sh kernel
modules:
	@./build/catboot-build.sh modules
rootfs:
	@./build/catboot-build.sh rootfs
rootfs-dde:
	@./build/catboot-build.sh rootfs-dde
initramfs:
	@./build/catboot-build.sh initramfs
iso:
	@./build/catboot-build.sh iso
qemu:
	@./build/catboot-build.sh qemu
desktop:
	@./build/catboot-build.sh desktop
desktop-test:
	@./build/catboot-build.sh desktop-test
dde-target:
	@./targets/catbootos-desktop/build-target.sh build
package-test:
	@./packages/catpkg.sh self-test
package-build:
	@./packages/catpkg.sh build $(SOURCE) $(NAME) $(VERSION)
package-repo:
	@./packages/catpkg.sh repo-index
package-install-test:
	@./packages/catpkg.sh self-test
package-rollback-test:
	@./packages/catpkg.sh self-test
service-test:
	@./services/catservicectl self-test
hardware-test:
	@./drivers/cat-hardware detect
installer:
	@./installer/catinstall.sh validate
live:
	@./build/catboot-build.sh iso
windows:
	@printf '%s\n' 'Windows handler architecture: packages/windows-handlers.conf'
meowbot:
	@printf '%s\n' 'MeowBot architecture: meowbot/README.md'
browser:
	@printf '%s\n' 'CatBrowser architecture: browser/README.md'
test:
	@./build/catboot-build.sh test
clean:
	@./build/catboot-build.sh clean
rebuild:
	@./build/catboot-build.sh clean
	@$(MAKE) build
help:
	@printf '%s\n' \
	  'build       build toolchain, kernel, modules, rootfs and initramfs' \
	  'kernel      download/configure/build the x86_64 Linux kernel' \
	  'modules     install kernel modules into the private rootfs' \
	  'rootfs      build the CatBootOS root filesystem' \
	  'initramfs   create the compressed boot image' \
	  'iso         create a bootable ISO when grub-mkrescue is installed' \
	  'check-deps  verify host tools and kernel build dependencies' \
	  'qemu        run the built image interactively under QEMU' \
	  'desktop     stage the minimal DDE component profile and CatBootOS theme' \
	  'desktop-test validate DDE session, compositor, shell and runtime metrics' \
	  'package-test validate native .catpkg transactions and rollback' \
	  'service-test validate the minimal service manager' \
	  'hardware-test detect CPU, RAM, GPU, storage, network, audio and display' \
	  'installer   validate the safe backend installer' \
	  'live        build the bootable CatBootOS live ISO' \
	  'test        build, validate and boot under QEMU in CI mode' \
	  'clean       remove generated output, preserving source and caches' \
	  'rebuild     clean and build from scratch'
