define KernelPackage/linkstation-poweroff
  SUBMENU:=$(OTHER_MENU)
  DEPENDS:=@TARGET_mvebu
  TITLE:=Buffalo LinkStation power off driver
  KCONFIG:=CONFIG_POWER_RESET_LINKSTATION
  FILES:=$(LINUX_DIR)/drivers/power/reset/linkstation-poweroff.ko
  AUTOLOAD:=$(call AutoLoad,31,linkstation-poweroff,1)
endef

define KernelPackage/linkstation-poweroff/description
  This driver supports turning off some Buffalo LinkStations by
  setting an output pin at the ethernet PHY to the correct state.
  It also makes the device compatible with the WoL function.
  Say Y here if you have a Buffalo LinkStation LS421D/E.
endef

$(eval $(call KernelPackage,linkstation-poweroff))

define KernelPackage/leds-aw2013
  SUBMENU:=$(LEDS_MENU)
  DEPENDS:=@TARGET_mvebu_cortexa53_DEVICE_catdrive_c1 @!LINUX_5_4 @GPIO_SUPPORT
  TITLE:=aw2013 led support
  KCONFIG:=CONFIG_LEDS_AW2013
  FILES:=$(LINUX_DIR)/drivers/leds/leds-aw2013.ko
  AUTOLOAD:=$(call AutoLoad,60,leds-aw2013,1)
endef

define KernelPackage/leds-aw2013/description
  Catdirve C1's 3 channle led controller driver
endef

$(eval $(call KernelPackage,leds-aw2013))