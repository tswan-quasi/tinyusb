DEPS_SUBMODULES += hw/mcu/nxp/lpcopen
SDK_DIR = hw/mcu/nxp/lpcopen/lpc43xx/lpc_chip_43xx

include ${TOP}/${BOARD_PATH}/board.mk
CPU_CORE ?= cortex-m4

CFLAGS += \
  -flto \
  -nostdlib \
  -DCORE_M4 \
  -D__USE_LPCOPEN \
  -DCFG_TUSB_MCU=OPT_MCU_LPC43XX

# mcu driver cause following warnings
CFLAGS += -Wno-error=unused-parameter -Wno-error=strict-prototypes  -Wno-error=cast-qual

SRC_C += \
	src/portable/chipidea/ci_hs/dcd_ci_hs.c \
	src/portable/chipidea/ci_hs/hcd_ci_hs.c \
	src/portable/ehci/ehci.c \
	${SDK_DIR}/../gcc/cr_startup_lpc43xx.c \
	${SDK_DIR}/src/chip_18xx_43xx.c \
	${SDK_DIR}/src/clock_18xx_43xx.c \
	${SDK_DIR}/src/gpio_18xx_43xx.c \
	${SDK_DIR}/src/sysinit_18xx_43xx.c \
	${SDK_DIR}/src/i2c_18xx_43xx.c \
	${SDK_DIR}/src/i2cm_18xx_43xx.c \
	${SDK_DIR}/src/uart_18xx_43xx.c \
	${SDK_DIR}/src/fpu_init.c

INC += \
  $(TOP)/$(BOARD_PATH) \
	${TOP}/${SDK_DIR}/inc \
	${TOP}/${SDK_DIR}/inc/config_43xx
