#
# Copyright (C) 2016 Mudfish Networks <contact@loxch.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mudfish-pi

PKG_VERSION:=2.1.14
PKG_RELEASE:=5

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_INSTALL:=1
PKG_FIXUP:=autoreconf
PKG_BUILD_PARALLEL:=1
PKG_LICENSE:=BSD-3c
PKG_USE_MIPS16:=0

include $(INCLUDE_DIR)/package.mk

define Package/mudfish-pi/Default
  TITLE:=Mudfish VPN Services for embedded devices
  SECTION:=net
  CATEGORY:=Network
  URL:=http://mudfish.net
  SUBMENU:=VPN
  MENU:=1
  DEPENDS:=+ip +kmod-tun +libopenssl +libpthread +librt +ubox +uci
  MAINTAINER:=Weongyo Jeong <weongyo@gmail.com>
endef

Package/mudfish-pi=$(call Package/mudfish-pi/Default)

define Package/mudfish-pi/config/Default
	source "$(SOURCE)/Config.in"
endef

Package/mudfish-pi/config=$(call Package/mudfish-pi/config/Default)

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

define Package/mudfish-pi/conffiles
/etc/mudfish-pi/openvpn
endef

MUD_INSTALL_DIR=$(PKG_INSTALL_DIR)/opt/$(PKG_NAME)/$(PKG_VERSION)

define Package/mudfish-pi/install
	$(INSTALL_DIR) \
	    $(1)/opt/$(PKG_NAME)/$(PKG_VERSION)/bin \
	    $(1)/opt/$(PKG_NAME)/$(PKG_VERSION)/var \
	    $(1)/etc/init.d \
	    $(1)/etc/config \
	    $(1)/etc/mudfish-pi \
	    $(1)/lib/upgrade/keep.d
	$(RM) $(1)/opt/$(PKG_NAME)/current
	$(LN) /opt/$(PKG_NAME)/$(PKG_VERSION) $(1)/opt/$(PKG_NAME)/current
	$(INSTALL_BIN) \
	    $(MUD_INSTALL_DIR)/bin/mudadm \
	    $(1)/opt/$(PKG_NAME)/$(PKG_VERSION)/bin/
	$(INSTALL_BIN) \
	    $(MUD_INSTALL_DIR)/bin/muddiag \
	    $(1)/opt/$(PKG_NAME)/$(PKG_VERSION)/bin/
	$(INSTALL_BIN) \
	    $(MUD_INSTALL_DIR)/bin/muddnsc \
	    $(1)/opt/$(PKG_NAME)/$(PKG_VERSION)/bin/
	$(INSTALL_BIN) \
	    $(MUD_INSTALL_DIR)/bin/mudfish \
	    $(1)/opt/$(PKG_NAME)/$(PKG_VERSION)/bin/
	$(INSTALL_BIN) \
	    $(MUD_INSTALL_DIR)/bin/mudflow \
	    $(1)/opt/$(PKG_NAME)/$(PKG_VERSION)/bin/
	$(INSTALL_BIN) \
	    $(MUD_INSTALL_DIR)/bin/mudhttpc \
	    $(1)/opt/$(PKG_NAME)/$(PKG_VERSION)/bin/
	$(INSTALL_BIN) \
	    $(MUD_INSTALL_DIR)/bin/mudlog \
	    $(1)/opt/$(PKG_NAME)/$(PKG_VERSION)/bin/
	$(INSTALL_BIN) \
	    $(MUD_INSTALL_DIR)/bin/mudrun \
	    $(1)/opt/$(PKG_NAME)/$(PKG_VERSION)/bin/
	$(INSTALL_BIN) \
	    $(MUD_INSTALL_DIR)/bin/mudsupport \
	    $(1)/opt/$(PKG_NAME)/$(PKG_VERSION)/bin/
	$(INSTALL_BIN) files/mudfish-pi.init.d $(1)/etc/init.d/mudfish-pi
	$(INSTALL_CONF) files/mudfish-pi.config $(1)/etc/config/mudfish-pi
	$(INSTALL_BIN) files/dhcp.script $(1)/etc/mudfish-pi/dhcp.script
	$(INSTALL_BIN) files/mudfish.fullvpn.down.sh \
	    $(1)/etc/mudfish-pi/mudfish.fullvpn.down.sh
	$(INSTALL_BIN) files/mudfish.fullvpn.up.sh \
	    $(1)/etc/mudfish-pi/mudfish.fullvpn.up.sh
	$(INSTALL_DATA) files/version $(1)/etc/mudfish-pi/version
	$(INSTALL_DATA) files/mudfish-pi.upgrade \
	    $(1)/lib/upgrade/keep.d/mudfish-pi
endef

$(eval $(call BuildPackage,mudfish-pi,+libopenssl))
