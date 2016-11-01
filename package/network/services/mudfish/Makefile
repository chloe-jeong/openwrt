#
# Copyright (C) 2016 Mudfish Networks <contact@loxch.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mudfish

PKG_VERSION:=2.3.2
PKG_RELEASE:=5

PKG_SOURCE_URL:=http://mudfish.net/releases
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_MD5SUM:=6ca03fe0fd093e0d01601abee808835d

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_INSTALL:=1
PKG_FIXUP:=autoreconf
PKG_BUILD_PARALLEL:=1
PKG_LICENSE:=GPL-2.0

include $(INCLUDE_DIR)/package.mk

define Package/mudfish/Default
  TITLE:=Mudfish VPN Services
  SECTION:=net
  CATEGORY:=Network
  URL:=http://mudfish.net
  SUBMENU:=VPN
  MENU:=1
  DEPENDS:=+kmod-tun
  MAINTAINER:=Weongyo Jeong <weongyo@gmail.com>
endef

Package/mudfish=$(call Package/mudfish/Default)

define Package/mudfish/config/Default
	source "$(SOURCE)/Config.in"
endef

Package/mudfish/config=$(call Package/mudfish/config/Default)

CONFIG_MUDFISH:=y

CONFIGURE_VARS += \
	IFCONFIG=/sbin/ifconfig \
	ROUTE=/sbin/route \
	IPROUTE=/usr/sbin/ip \
	NETSTAT=/sbin/netstat

define Build/Configure
	$(call Build/Configure/Default, \
		--disable-selinux \
	)
endef

define Package/mudfish/conffiles
/etc/mudfish/openvpn
endef

define Package/mudfish/install
	$(INSTALL_DIR) \
		$(1)/usr/sbin \
		$(1)/etc/init.d \
		$(1)/etc/config \
		$(1)/etc/openvpn \
		$(1)/lib/upgrade/keep.d

	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/sbin/openvpn \
		$(1)/usr/sbin/

	$(INSTALL_BIN) \
		files/openvpn.init \
		$(1)/etc/init.d/openvpn

	$(INSTALL_CONF) files/openvpn.config \
		$(1)/etc/config/openvpn

	$(INSTALL_DATA) \
		files/openvpn.upgrade \
		$(1)/lib/upgrade/keep.d/openvpn
endef

$(eval $(call BuildPackage,mudfish))
