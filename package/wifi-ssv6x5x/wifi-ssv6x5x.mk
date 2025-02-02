WIFI_SSV6X5X_SITE_METHOD = git
WIFI_SSV6X5X_SITE = https://github.com/openipc/ssv6x5x
WIFI_SSV6X5X_SITE_BRANCH = master
WIFI_SSV6X5X_VERSION = 6ff6317c7029cd8e5ae1571b4ce81b588a821950
# $(shell git ls-remote $(WIFI_SSV6X5X_SITE) $(WIFI_SSV6X5X_SITE_BRANCH) | head -1 | cut -f1)

WIFI_SSV6X5X_LICENSE = GPL-2.0
WIFI_SSV6X5X_LICENSE_FILES = COPYING

WIFI_SSV6X5X_MODULE_MAKE_OPTS = \
	KSRC=$(LINUX_DIR)

define WIFI_SSV6X5X_LINUX_CONFIG_FIXUPS
	$(call KCONFIG_ENABLE_OPT,CONFIG_WLAN)
	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS_EXT)
	$(call KCONFIG_ENABLE_OPT,CONFIG_WEXT_CORE)
	$(call KCONFIG_ENABLE_OPT,CONFIG_WEXT_PROC)
	$(call KCONFIG_ENABLE_OPT,CONFIG_WEXT_PRIV)
	$(call KCONFIG_SET_OPT,CONFIG_CFG80211,y)
	$(call KCONFIG_SET_OPT,CONFIG_MAC80211,y)
	$(call KCONFIG_ENABLE_OPT,CONFIG_MAC80211_RC_MINSTREL)
	$(call KCONFIG_ENABLE_OPT,CONFIG_MAC80211_RC_MINSTREL_HT)
	$(call KCONFIG_ENABLE_OPT,CONFIG_MAC80211_RC_DEFAULT_MINSTREL)
	$(call KCONFIG_SET_OPT,CONFIG_MAC80211_RC_DEFAULT,"minstrel_ht")
endef

$(eval $(kernel-module))
$(eval $(generic-package))
