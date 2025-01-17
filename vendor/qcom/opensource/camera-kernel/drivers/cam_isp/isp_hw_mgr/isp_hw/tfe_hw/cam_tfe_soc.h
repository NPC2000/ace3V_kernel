/* SPDX-License-Identifier: GPL-2.0-only */
/*
 * Copyright (c) 2019-2021, The Linux Foundation. All rights reserved.
 * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
 */

#ifndef _CAM_TFE_SOC_H_
#define _CAM_TFE_SOC_H_

#include "cam_soc_util.h"
#include "cam_isp_hw.h"

#define CAM_TFE_DSP_CLK_NAME "tfe_dsp_clk"

enum cam_cpas_handle_id {
	CAM_CPAS_HANDLE_CAMIF,
	CAM_CPAS_HANDLE_RAW,
	CAM_CPAS_HANDLE_MAX,
};

/*
 * struct cam_tfe_soc_private:
 *
 * @Brief:                   Private SOC data specific to TFE HW Driver
 *
 * @cpas_handle:             Handle returned on registering with CPAS driver.
 *                           This handle is used for all further interface
 *                           with CPAS.
 * @cpas_version:            Has cpas version read from Hardware
 * @dsp_clk_index:           DSP clk index in optional clocks
 * @num_pid:                 number of pids of tfe
 * @pid:                     TFE pid value list
 * @is_tfe_lite:             Flag to indicate if it is TFE Lite HW
 */
struct cam_tfe_soc_private {
	uint32_t    cpas_handle;
	uint32_t    cpas_version;
	uint32_t    rt_wrapper_base;
	int32_t     dsp_clk_index;
	uint32_t    num_pid;
	uint32_t    pid[CAM_ISP_HW_MAX_PID_VAL];
	bool        is_tfe_lite;
};

/*
 * cam_tfe_init_soc_resources()
 *
 * @Brief:                   Initialize SOC resources including private data
 *
 * @soc_info:                Device soc information
 * @handler:                 Irq handler function pointer
 * @irq_data:                Irq handler function Callback data
 *
 * @Return:                  0: Success
 *                           Non-zero: Failure
 */
int cam_tfe_init_soc_resources(struct cam_hw_soc_info *soc_info,
	irq_handler_t tfe_irq_handler, void *irq_data);

/*
 * cam_tfe_deinit_soc_resources()
 *
 * @Brief:                   Deinitialize SOC resources including private data
 *
 * @soc_info:                Device soc information
 *
 * @Return:                  0: Success
 *                           Non-zero: Failure
 */
int cam_tfe_deinit_soc_resources(struct cam_hw_soc_info *soc_info);

/*
 * cam_tfe_enable_soc_resources()
 *
 * @brief:                   Enable regulator, irq resources, start CPAS
 *
 * @soc_info:                Device soc information
 *
 * @max_clk_rate:            Max clock rate value
 *
 * @Return:                  0: Success
 *                           Non-zero: Failure
 */
int cam_tfe_enable_soc_resources(struct cam_hw_soc_info *soc_info,
	unsigned long max_clk_rate);

/*
 * cam_tfe_disable_soc_resources()
 *
 * @brief:                   Disable regulator, irq resources, stop CPAS
 *
 * @soc_info:                Device soc information
 *
 * @Return:                  0: Success
 *                           Non-zero: Failure
 */
int cam_tfe_disable_soc_resources(struct cam_hw_soc_info *soc_info);

/*
 * cam_tfe_soc_enable_clk()
 *
 * @brief:                   Enable clock with given name
 *
 * @soc_info:                Device soc information
 * @clk_name:                Name of clock to enable
 *
 * @Return:                  0: Success
 *                           Non-zero: Failure
 */
int cam_tfe_soc_enable_clk(struct cam_hw_soc_info *soc_info,
	const char *clk_name);

/*
 * cam_tfe_soc_disable_dsp_clk()
 *
 * @brief:                   Disable clock with given name
 *
 * @soc_info:                Device soc information
 * @clk_name:                Name of clock to enable
 *
 * @Return:                  0: Success
 *                           Non-zero: Failure
 */
int cam_tfe_soc_disable_clk(struct cam_hw_soc_info *soc_info,
	const char *clk_name);

#endif /* _CAM_TFE_SOC_H_ */
