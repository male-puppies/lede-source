#
# Copyright (C) 2006-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=mergerfs
PKG_VERSION:=2.24.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/trapexit/mergerfs/releases/download/$(PKG_VERSION)/$(PKG_SOURCE)
PKG_MD5SUM:=029780e09f72ee8e6d735363edfc17a6

PKG_LICENSE:=LGPLv2.1 GPLv2

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/mergerfs/Default
  TITLE:=MERGERFS
  URL:=https://github.com/trapexit/mergerfs
endef

define Package/mergerfs/Default/description
 MERGERFS (Filesystem in UserSpacE)
endef

define Package/mergerfs-utils
$(call Package/mergerfs/Default)
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libfuse
  TITLE+= (utilities)
  SUBMENU:=Filesystem
endef

define Package/mergerfs-utils/description
$(call Package/mergerfs/Default/description)
 This package contains the MERGERFS utilities.
 - mergerfs
endef

# generic args
define Build/Compile
	$(call Build/Compile/Default, CONFIGURE_ARGS="$(CONFIGURE_ARGS)")
endef
define Package/mergerfs-utils/install
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/local/bin/mergerfs $(1)/sbin
endef

$(eval $(call BuildPackage,mergerfs-utils))
