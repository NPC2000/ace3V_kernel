load(":target_variants.bzl", "la_variants")
load(":msm_kernel_la.bzl", "define_msm_la")
load(":image_opts.bzl", "boot_image_opts")

target_name = "sdmsteppeauto"

def define_sdmsteppeauto():
    _sdmsteppeauto_in_tree_modules = [
        # keep sorted
        "drivers/bus/mhi/devices/mhi_dev_uci.ko",
        "drivers/bus/mhi/host/mhi.ko",
        "drivers/clk/qcom/camcc-sm6150.ko",
        "drivers/clk/qcom/clk-dummy.ko",
        "drivers/clk/qcom/clk-qcom.ko",
        "drivers/clk/qcom/clk-rpmh.ko",
        "drivers/clk/qcom/clk-spmi-pmic-div.ko",
        "drivers/clk/qcom/debugcc-sm6150.ko",
        "drivers/clk/qcom/dispcc-sm6150.ko",
        "drivers/clk/qcom/gcc-sm6150.ko",
        "drivers/clk/qcom/gdsc-regulator.ko",
        "drivers/clk/qcom/gpucc-sm6150.ko",
        "drivers/clk/qcom/scc-sm6150.ko",
        "drivers/clk/qcom/videocc-sm6150.ko",
        "drivers/cpufreq/cpufreq_ondemand.ko",
        "drivers/cpufreq/qcom-cpufreq-hw.ko",
        "drivers/cpuidle/governors/qcom_lpm.ko",
        "drivers/dma-buf/heaps/qcom_dma_heaps.ko",
        "drivers/extcon/extcon-usb-gpio.ko",
        "drivers/firmware/qcom-scm.ko",
        "drivers/gpu/drm/bridge/analogix/anx7625.ko",
        "drivers/gpu/drm/display/drm_display_helper.ko",
        "drivers/gpu/drm/display/drm_dp_aux_bus.ko",
        "drivers/hwspinlock/qcom_hwspinlock.ko",
        "drivers/hwtracing/coresight/coresight.ko",
        "drivers/hwtracing/coresight/coresight-csr.ko",
        "drivers/hwtracing/coresight/coresight-cti.ko",
        "drivers/hwtracing/coresight/coresight-dummy.ko",
        "drivers/hwtracing/coresight/coresight-etm4x.ko",
        "drivers/hwtracing/coresight/coresight-funnel.ko",
        "drivers/hwtracing/coresight/coresight-hwevent.ko",
        "drivers/hwtracing/coresight/coresight-remote-etm.ko",
        "drivers/hwtracing/coresight/coresight-replicator.ko",
        "drivers/hwtracing/coresight/coresight-stm.ko",
        "drivers/hwtracing/coresight/coresight-tgu.ko",
        "drivers/hwtracing/coresight/coresight-tmc.ko",
        "drivers/hwtracing/coresight/coresight-tmc-sec.ko",
        "drivers/hwtracing/coresight/coresight-tpda.ko",
        "drivers/hwtracing/coresight/coresight-tpdm.ko",
        "drivers/hwtracing/stm/stm_console.ko",
        "drivers/hwtracing/stm/stm_core.ko",
        "drivers/hwtracing/stm/stm_ftrace.ko",
        "drivers/hwtracing/stm/stm_p_basic.ko",
        "drivers/hwtracing/stm/stm_p_ost.ko",
        "drivers/i2c/busses/i2c-msm-geni.ko",
        "drivers/i2c/i2c-dev.ko",
        "drivers/i2c/i2c-mux.ko",
        "drivers/i2c/muxes/i2c-mux-pca954x.ko",
        "drivers/iio/adc/qcom-spmi-adc5.ko",
        "drivers/iio/adc/qcom-vadc-common.ko",
        "drivers/input/misc/pm8941-pwrkey.ko",
        "drivers/interconnect/icc-test.ko",
        "drivers/interconnect/qcom/icc-bcm-voter.ko",
        "drivers/interconnect/qcom/icc-debug.ko",
        "drivers/interconnect/qcom/icc-rpmh.ko",
        "drivers/interconnect/qcom/qnoc-qos.ko",
        "drivers/interconnect/qcom/qnoc-sm6150.ko",
        "drivers/iommu/arm/arm-smmu/arm_smmu.ko",
        "drivers/iommu/iommu-logger.ko",
        "drivers/iommu/msm_dma_iommu_mapping.ko",
        "drivers/iommu/qcom_iommu_util.ko",
        "drivers/irqchip/msm_show_resume_irq.ko",
        "drivers/irqchip/qcom-pdc.ko",
        "drivers/mailbox/msm_qmp.ko",
        "drivers/mailbox/qcom-apcs-ipc-mailbox.ko",
        "drivers/mfd/qcom-spmi-pmic.ko",
        "drivers/misc/qseecom_proxy.ko",
        "drivers/mmc/host/cqhci.ko",
        "drivers/mmc/host/sdhci-msm.ko",
        "drivers/mmc/host/sdhci-msm-scaling.ko",
        "drivers/nvmem/nvmem_qcom-spmi-sdam.ko",
        "drivers/nvmem/nvmem_qfprom.ko",
        "drivers/pci/controller/pci-msm-drv.ko",
        "drivers/perf/qcom_llcc_pmu.ko",
        "drivers/phy/qualcomm/phy-qcom-ufs.ko",
        "drivers/phy/qualcomm/phy-qcom-ufs-qmp-v3-660.ko",
        "drivers/phy/qualcomm/phy-qcom-ufs-qmp-v4.ko",
        "drivers/pinctrl/pinctrl-sx150x.ko",
        "drivers/pinctrl/qcom/pinctrl-msm.ko",
        "drivers/pinctrl/qcom/pinctrl-slpi.ko",
        "drivers/pinctrl/qcom/pinctrl-sm6150.ko",
        "drivers/pinctrl/qcom/pinctrl-spmi-gpio.ko",
        "drivers/pinctrl/qcom/pinctrl-spmi-mpp.ko",
        "drivers/power/reset/qcom-dload-mode.ko",
        "drivers/power/reset/qcom-pon.ko",
        "drivers/power/reset/qcom-reboot-reason.ko",
        "drivers/power/reset/reboot-mode.ko",
        "drivers/regulator/proxy-consumer.ko",
        "drivers/regulator/qcom-rpmh-regulator.ko",
        "drivers/regulator/rpmh-regulator.ko",
        "drivers/regulator/stub-regulator.ko",
        "drivers/remoteproc/qcom_pil_info.ko",
        "drivers/remoteproc/qcom_q6v5.ko",
        "drivers/remoteproc/qcom_q6v5_pas.ko",
        "drivers/remoteproc/qcom_spss.ko",
        "drivers/remoteproc/qcom_sysmon.ko",
        "drivers/remoteproc/rproc_qcom_common.ko",
        "drivers/rpmsg/glink_pkt.ko",
        "drivers/rpmsg/qcom_glink.ko",
        "drivers/rpmsg/qcom_glink_smem.ko",
        "drivers/rpmsg/qcom_glink_spss.ko",
        "drivers/rpmsg/qcom_smd.ko",
        "drivers/rtc/rtc-pm8xxx.ko",
        "drivers/soc/qcom/boot_stats.ko",
        "drivers/soc/qcom/cdsprm.ko",
        "drivers/soc/qcom/cmd-db.ko",
        "drivers/soc/qcom/core_hang_detect.ko",
        "drivers/soc/qcom/crypto-qti.ko",
        "drivers/soc/qcom/dcc_v2.ko",
        "drivers/soc/qcom/dcvs/bwmon.ko",
        "drivers/soc/qcom/dcvs/dcvs_fp.ko",
        "drivers/soc/qcom/dcvs/memlat.ko",
        "drivers/soc/qcom/dcvs/qcom-dcvs.ko",
        "drivers/soc/qcom/dcvs/qcom-pmu-lib.ko",
        "drivers/soc/qcom/debug_symbol.ko",
        "drivers/soc/qcom/glink_probe.ko",
        "drivers/soc/qcom/llcc-qcom.ko",
        "drivers/soc/qcom/mdt_loader.ko",
        "drivers/soc/qcom/mem_buf/mem_buf.ko",
        "drivers/soc/qcom/mem_buf/mem_buf_dev.ko",
        "drivers/soc/qcom/mem_buf/mem_buf_msgq.ko",
        "drivers/soc/qcom/memory_dump_v2.ko",
        "drivers/soc/qcom/minidump.ko",
        "drivers/soc/qcom/msm_performance.ko",
        "drivers/soc/qcom/pdr_interface.ko",
        "drivers/soc/qcom/qcom_aoss.ko",
        "drivers/soc/qcom/qcom_cpu_vendor_hooks.ko",
        "drivers/soc/qcom/qcom_hib.ko",
        "drivers/soc/qcom/qcom_ramdump.ko",
        "drivers/soc/qcom/qcom_rpmh.ko",
        "drivers/soc/qcom/qcom_secure_hibernation.ko",
        "drivers/soc/qcom/qcom_soc_wdt.ko",
        "drivers/soc/qcom/qcom_stats.ko",
        "drivers/soc/qcom/qcom_wdt_core.ko",
        "drivers/soc/qcom/qmi_helpers.ko",
        "drivers/soc/qcom/qsee_ipc_irq_bridge.ko",
        "drivers/soc/qcom/rpmhpd.ko",
        "drivers/soc/qcom/secure_buffer.ko",
        "drivers/soc/qcom/smem.ko",
        "drivers/soc/qcom/smp2p.ko",
        "drivers/soc/qcom/smp2p_sleepstate.ko",
        "drivers/soc/qcom/socinfo.ko",
        "drivers/spi/spi-msm-geni.ko",
        "drivers/spi/spidev.ko",
        "drivers/spmi/spmi-pmic-arb.ko",
        "drivers/thermal/qcom/qcom-spmi-temp-alarm.ko",
        "drivers/tty/serial/msm_geni_serial.ko",
        "drivers/ufs/host/ufs_qcom.ko",
        "drivers/ufs/host/ufshcd-crypto-qti.ko",
        "drivers/usb/dwc3/dwc3-msm.ko",
        "drivers/usb/gadget/function/f_fs_ipc_log.ko",
        "drivers/usb/gadget/function/usb_f_cdev.ko",
        "drivers/usb/gadget/function/usb_f_diag.ko",
        "drivers/usb/gadget/function/usb_f_qdss.ko",
        "drivers/usb/misc/ehset.ko",
        "drivers/usb/phy/phy-generic.ko",
        "drivers/usb/phy/phy-msm-qusb.ko",
        "drivers/usb/phy/phy-msm-qusb-v2.ko",
        "drivers/usb/phy/phy-msm-ssusb-qmp.ko",
        "drivers/usb/phy/phy-qcom-emu.ko",
        "drivers/virt/gunyah/gh_msgq.ko",
        "drivers/virt/gunyah/gh_rm_drv.ko",
        "kernel/trace/qcom_ipc_logging.ko",
        "net/mac80211/mac80211.ko",
        "net/qrtr/qrtr.ko",
        "net/qrtr/qrtr-mhi.ko",
        "net/qrtr/qrtr-smd.ko",
        "net/wireless/cfg80211.ko",
    ]

    _sdmsteppeauto_consolidate_in_tree_modules = _sdmsteppeauto_in_tree_modules + [
        # keep sorted
        "drivers/misc/lkdtm/lkdtm.ko",
        "kernel/locking/locktorture.ko",
        "kernel/rcu/rcutorture.ko",
        "kernel/torture.ko",
        "lib/atomic64_test.ko",
        "lib/test_user_copy.ko",
    ]

    for variant in la_variants:
        if variant == "consolidate":
            mod_list = _sdmsteppeauto_consolidate_in_tree_modules
        else:
            mod_list = _sdmsteppeauto_in_tree_modules

        define_msm_la(
            msm_target = target_name,
            variant = variant,
            in_tree_module_list = mod_list,
            boot_image_opts = boot_image_opts(
                earlycon_addr = "qcom_geni,0x880000",
                kernel_vendor_cmdline_extras = [
                    # do not sort
                    "console=ttyMSM0,115200n8",
                    "qcom_geni_serial.con_enabled=1",
                    "androidboot.first_stage_console=1",
                    "nokaslr",
                    "bootconfig",
                ],
            ),
        )