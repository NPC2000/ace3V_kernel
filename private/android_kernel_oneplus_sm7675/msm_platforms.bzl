load(":gen3auto.bzl", "define_gen3auto")
load(":autogvm.bzl", "define_autogvm")
load(":autoghgvm.bzl", "define_autoghgvm")
load(":autogvm_lxc.bzl", "define_autogvm_lxc")
load(":gen4auto_lxc.bzl", "define_gen4auto_lxc")
load(":sdmsteppeauto.bzl", "define_sdmsteppeauto")
load(":pineapple.bzl", "define_pineapple")
load(":niobe.bzl", "define_niobe")
load(":pineapple_tuivm.bzl", "define_pineapple_tuivm")
load(":pineapple_oemvm.bzl", "define_pineapple_oemvm")
load(":pineapple_vms.bzl", "define_pineapple_vms")
load(":pineapple_allyes.bzl", "define_pineapple_allyes")
load(":msm_common.bzl", "define_signing_keys")
load("//build:msm_kernel_extensions.bzl", "define_top_level_rules")
load(":blair.bzl", "define_blair")
load(":pitti.bzl", "define_pitti")

def define_msm_platforms():
    define_top_level_rules()
    define_signing_keys()
    define_gen3auto()
    define_autogvm()
    define_autoghgvm()
    define_autogvm_lxc()
    define_gen4auto_lxc()
    define_sdmsteppeauto()
    define_pineapple()
    define_niobe()
    define_pineapple_tuivm()
    define_pineapple_oemvm()
    define_pineapple_allyes()
    define_pineapple_vms()
    define_blair()
    define_pitti()