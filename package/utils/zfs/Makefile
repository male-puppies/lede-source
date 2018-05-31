#
# Copyright (C) 2006-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=zfs
PKG_VERSION:=0.7.9
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://gitlab.com/TenbayMCloud/zfs.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=928046b744a6d3f93f5ba1351a6d700a62535a00
PKG_LICENSE:=CDDL

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/zfs/Default
  TITLE:=ZFS
  URL:=http://zfsonlinux.org/
endef

define Package/zfs/Default/description
 ZFS on Linux is an advanced file system and volume manager which was originally
 developed for Solaris and is now maintained by the OpenZFS community.
endef

define Package/zfs
$(call Package/zfs/Default)
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE+= (utilities)
  SUBMENU:=Filesystem
endef

define Package/zfs/description
$(call Package/mergerfs/Default/description)
endef

define Build/Configure
        ( cd $(PKG_BUILD_DIR); ./autogen.sh )
        $(call Build/Configure/Default)
endef

# generic args
define Build/Compile
	$(call Build/Compile/Default)
endef
define Package/zfs/install
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/local/bin/mergerfs $(1)/sbin
	$(LN) mergerfs $(1)/sbin/mount.mergerfs
endef

$(eval $(call BuildPackage,zfs))
