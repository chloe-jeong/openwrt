#
# Copyright (C) 2016 Mudfish Networks <contact@loxch.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mudfish

PKG_VERSION:=2.1.13
PKG_RELEASE:=5

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_INSTALL:=1
PKG_FIXUP:=autoreconf
PKG_BUILD_PARALLEL:=1
PKG_LICENSE:=BSD-3c

include $(INCLUDE_DIR)/package.mk

define Package/mudfish/Default
  TITLE:=Mudfish VPN Services
  SECTION:=net
  CATEGORY:=Network
  URL:=http://mudfish.net
  SUBMENU:=VPN
  MENU:=1
  DEPENDS:=+kmod-tun +libopenssl +libpthread +librt
  MAINTAINER:=Weongyo Jeong <weongyo@gmail.com>
endef

Package/mudfish=$(call Package/mudfish/Default)

define Package/mudfish/config/Default
	source "$(SOURCE)/Config.in"
endef

Package/mudfish/config=$(call Package/mudfish/config/Default)

CONFIG_MUDFISH:=y

CONFIGURE_PATH:=head/mudfish
CONFIGURE_PREFIX:=/opt/$(PKG_NAME)/$(PKG_VERSION)
CONFIGURE_VARS += \
	IFCONFIG=/sbin/ifconfig \
	ROUTE=/sbin/route \
	IPROUTE=/usr/sbin/ip \
	NETSTAT=/sbin/netstat

MAKE_PATH:=head/mudfish

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-developer-warnings \
		--enable-debugging-symbols \
		--enable-werror \
	)
endef

define Package/mudfish/conffiles
/etc/mudfish/openvpn
endef

define Package/mudfish/install
	$(INSTALL_DIR) \
		$(1)/opt/$(PKG_NAME)/$(PKG_VERSION)/bin \
		$(1)/etc/init.d \
		$(1)/etc/config \
		$(1)/etc/mudfish \
		$(1)/lib/upgrade/keep.d

	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/opt/$(PKG_NAME)/$(PKG_VERSION)/bin/mudadm \
		$(1)/opt/$(PKG_NAME)/$(PKG_VERSION)/bin/
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/opt/$(PKG_NAME)/$(PKG_VERSION)/bin/muddiag \
		$(1)/opt/$(PKG_NAME)/$(PKG_VERSION)/bin/
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/opt/$(PKG_NAME)/$(PKG_VERSION)/bin/muddnsc \
		$(1)/opt/$(PKG_NAME)/$(PKG_VERSION)/bin/
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/opt/$(PKG_NAME)/$(PKG_VERSION)/bin/mudfish \
		$(1)/opt/$(PKG_NAME)/$(PKG_VERSION)/bin/
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/opt/$(PKG_NAME)/$(PKG_VERSION)/bin/mudflow \
		$(1)/opt/$(PKG_NAME)/$(PKG_VERSION)/bin/
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/opt/$(PKG_NAME)/$(PKG_VERSION)/bin/mudhttpc \
		$(1)/opt/$(PKG_NAME)/$(PKG_VERSION)/bin/
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/opt/$(PKG_NAME)/$(PKG_VERSION)/bin/mudlog \
		$(1)/opt/$(PKG_NAME)/$(PKG_VERSION)/bin/
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/opt/$(PKG_NAME)/$(PKG_VERSION)/bin/mudrun \
		$(1)/opt/$(PKG_NAME)/$(PKG_VERSION)/bin/

	$(INSTALL_CONF) files/mudfish.config \
		$(1)/etc/config/mudfish

	$(INSTALL_DATA) \
		files/mudfish.upgrade \
		$(1)/lib/upgrade/keep.d/mudfish
endef

$(eval $(call BuildPackage,mudfish,+libopenssl))
