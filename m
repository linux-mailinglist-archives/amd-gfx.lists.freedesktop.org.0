Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFDA228800
	for <lists+amd-gfx@lfdr.de>; Tue, 21 Jul 2020 20:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 296E56E426;
	Tue, 21 Jul 2020 18:09:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C656E426
 for <amd-gfx@lists.freedesktop.org>; Tue, 21 Jul 2020 18:09:20 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id x69so7708969qkb.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 21 Jul 2020 11:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QuGVsDpM/PiY30tVtdZFXOZLYjr5hy8UmhNqW0ij9BQ=;
 b=TMyAwG4kWcwCK63mjFVpAEAmIx2Q9fDW+EKjoeJLnIyYOyF3SnrP+aIoZaz9F5ZtfD
 pZh1HGLFbp8TtYw9GQQurmtGBjs25HE28JwyfLT/ZVyYNtflW97MhG5wtANbbV12wrW4
 lG868pTEHb+aYzGLKxkEZ174M+eQGAvSI9fY5asSxTY/T2O8Xwb45NTu1YZ/GuhHGZC3
 RvTuTdWOi1h9kow1l48CeKdilFptdNy50GvPgHm/QYDk5xPEB/8rAZisFMT+T6DEIIhG
 OCYGFC2udKMK+JWAxyrkULpSVCe78D7uVaHBvtXln5fetJSNvRz1USrX7nZ/fwWYj43v
 0ybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QuGVsDpM/PiY30tVtdZFXOZLYjr5hy8UmhNqW0ij9BQ=;
 b=a/vxkIz0NBu4fdiCgLRQ8cyv+5lS9aOzi6DABN+ICiq0B8B+XhElpSBZIL676weG2m
 kBhpjfUmbrhYThMtCkjoE9jXiinQ3aH5Rd/c0Vcgc1saslaLnfj6V0/WNZZkYrRO3WjC
 SljpSOqBlByEJYQ/Nfd8XK1oQlc5DnRGYaL6BUEq54TF8ZFZcm9vrPdXPP3mWcG73+ZU
 rBmOShbL72UlfNSS7mvLjCycuncd/Z8LbHPbyLZEc/QYClbW2+ArhirAHKzZ7cEVfLnw
 YAMNF7bL1WOqaZ/uX2InGWBJJNWXWUhQJ7MIwGfiIJEfGSBlavAFbumEyRPffH3S4Lav
 7Hpg==
X-Gm-Message-State: AOAM533UF9DSRkQ+GM0DNbLQtuoGrmf1wrAteGckSmWik2ZuN5IOHk/G
 RinfYlkT91MP7D2Dwhn7rfgOsVnp
X-Google-Smtp-Source: ABdhPJwmTReTGmft2F3ucbORvl9JH9Y/iEuuRGwzEE5dq1DzTsT6rBEYUp78aV3AOrVE/pjK3Yveug==
X-Received: by 2002:a37:a906:: with SMTP id s6mr4093970qke.320.1595354955487; 
 Tue, 21 Jul 2020 11:09:15 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id t65sm2957284qkf.119.2020.07.21.11.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 11:09:14 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 5/6] drm/amdgpu/navi1x: add SMU i2c support (v2)
Date: Tue, 21 Jul 2020 14:08:49 -0400
Message-Id: <20200721180850.813406-5-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200721180850.813406-1-alexander.deucher@amd.com>
References: <20200721180850.813406-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Enable SMU i2c bus access for navi1x asics.

v2: add missing implementation

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 239 +++++++++++++++++++++
 1 file changed, 239 insertions(+)

diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
index ead135f39c7e..0bcbcdd90e40 100644
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
@@ -23,6 +23,7 @@
 
 #include <linux/firmware.h>
 #include <linux/pci.h>
+#include <linux/i2c.h>
 #include "amdgpu.h"
 #include "amdgpu_smu.h"
 #include "smu_internal.h"
@@ -52,6 +53,8 @@
 #undef pr_info
 #undef pr_debug
 
+#define to_amdgpu_device(x) (container_of(x, struct amdgpu_device, pm.smu_i2c))
+
 #define FEATURE_MASK(feature) (1ULL << feature)
 #define SMC_DPM_FEATURE ( \
 	FEATURE_MASK(FEATURE_DPM_PREFETCHER_BIT) | \
@@ -553,6 +556,8 @@ static int navi10_tables_init(struct smu_context *smu, struct smu_table *tables)
 		       PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
 	SMU_TABLE_INIT(tables, SMU_TABLE_SMU_METRICS, sizeof(SmuMetrics_t),
 		       PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
+	SMU_TABLE_INIT(tables, SMU_TABLE_I2C_COMMANDS, sizeof(SwI2cRequest_t),
+		       PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
 	SMU_TABLE_INIT(tables, SMU_TABLE_OVERDRIVE, sizeof(OverDriveTable_t),
 		       PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
 	SMU_TABLE_INIT(tables, SMU_TABLE_PMSTATUSLOG, SMU11_TOOL_SIZE,
@@ -2340,6 +2345,238 @@ static int navi10_disable_umc_cdr_12gbps_workaround(struct smu_context *smu)
 	return navi10_dummy_pstate_control(smu, true);
 }
 
+static void navi10_fill_i2c_req(SwI2cRequest_t  *req, bool write,
+				  uint8_t address, uint32_t numbytes,
+				  uint8_t *data)
+{
+	int i;
+
+	BUG_ON(numbytes > MAX_SW_I2C_COMMANDS);
+
+	req->I2CcontrollerPort = 0;
+	req->I2CSpeed = 2;
+	req->SlaveAddress = address;
+	req->NumCmds = numbytes;
+
+	for (i = 0; i < numbytes; i++) {
+		SwI2cCmd_t *cmd =  &req->SwI2cCmds[i];
+
+		/* First 2 bytes are always write for lower 2b EEPROM address */
+		if (i < 2)
+			cmd->Cmd = 1;
+		else
+			cmd->Cmd = write;
+
+
+		/* Add RESTART for read  after address filled */
+		cmd->CmdConfig |= (i == 2 && !write) ? CMDCONFIG_RESTART_MASK : 0;
+
+		/* Add STOP in the end */
+		cmd->CmdConfig |= (i == (numbytes - 1)) ? CMDCONFIG_STOP_MASK : 0;
+
+		/* Fill with data regardless if read or write to simplify code */
+		cmd->RegisterAddr = data[i];
+	}
+}
+
+static int navi10_i2c_read_data(struct i2c_adapter *control,
+					       uint8_t address,
+					       uint8_t *data,
+					       uint32_t numbytes)
+{
+	uint32_t  i, ret = 0;
+	SwI2cRequest_t req;
+	struct amdgpu_device *adev = to_amdgpu_device(control);
+	struct smu_table_context *smu_table = &adev->smu.smu_table;
+	struct smu_table *table = &smu_table->driver_table;
+
+	memset(&req, 0, sizeof(req));
+	navi10_fill_i2c_req(&req, false, address, numbytes, data);
+
+	mutex_lock(&adev->smu.mutex);
+	/* Now read data starting with that address */
+	ret = smu_update_table(&adev->smu, SMU_TABLE_I2C_COMMANDS, 0, &req,
+					true);
+	mutex_unlock(&adev->smu.mutex);
+
+	if (!ret) {
+		SwI2cRequest_t *res = (SwI2cRequest_t *)table->cpu_addr;
+
+		/* Assume SMU  fills res.SwI2cCmds[i].Data with read bytes */
+		for (i = 0; i < numbytes; i++)
+			data[i] = res->SwI2cCmds[i].Data;
+
+		dev_dbg(adev->dev, "navi10_i2c_read_data, address = %x, bytes = %d, data :",
+				  (uint16_t)address, numbytes);
+
+		print_hex_dump(KERN_DEBUG, "data: ", DUMP_PREFIX_NONE,
+			       8, 1, data, numbytes, false);
+	} else
+		dev_err(adev->dev, "navi10_i2c_read_data - error occurred :%x", ret);
+
+	return ret;
+}
+
+static int navi10_i2c_write_data(struct i2c_adapter *control,
+						uint8_t address,
+						uint8_t *data,
+						uint32_t numbytes)
+{
+	uint32_t ret;
+	SwI2cRequest_t req;
+	struct amdgpu_device *adev = to_amdgpu_device(control);
+
+	memset(&req, 0, sizeof(req));
+	navi10_fill_i2c_req(&req, true, address, numbytes, data);
+
+	mutex_lock(&adev->smu.mutex);
+	ret = smu_update_table(&adev->smu, SMU_TABLE_I2C_COMMANDS, 0, &req, true);
+	mutex_unlock(&adev->smu.mutex);
+
+	if (!ret) {
+		dev_dbg(adev->dev, "navi10_i2c_write(), address = %x, bytes = %d , data: ",
+					 (uint16_t)address, numbytes);
+
+		print_hex_dump(KERN_DEBUG, "data: ", DUMP_PREFIX_NONE,
+			       8, 1, data, numbytes, false);
+		/*
+		 * According to EEPROM spec there is a MAX of 10 ms required for
+		 * EEPROM to flush internal RX buffer after STOP was issued at the
+		 * end of write transaction. During this time the EEPROM will not be
+		 * responsive to any more commands - so wait a bit more.
+		 */
+		msleep(10);
+
+	} else
+		dev_err(adev->dev, "navi10_i2c_write- error occurred :%x", ret);
+
+	return ret;
+}
+
+static int navi10_i2c_xfer(struct i2c_adapter *i2c_adap,
+			      struct i2c_msg *msgs, int num)
+{
+	uint32_t  i, j, ret, data_size, data_chunk_size, next_eeprom_addr = 0;
+	uint8_t *data_ptr, data_chunk[MAX_SW_I2C_COMMANDS] = { 0 };
+
+	for (i = 0; i < num; i++) {
+		/*
+		 * SMU interface allows at most MAX_SW_I2C_COMMANDS bytes of data at
+		 * once and hence the data needs to be spliced into chunks and sent each
+		 * chunk separately
+		 */
+		data_size = msgs[i].len - 2;
+		data_chunk_size = MAX_SW_I2C_COMMANDS - 2;
+		next_eeprom_addr = (msgs[i].buf[0] << 8 & 0xff00) | (msgs[i].buf[1] & 0xff);
+		data_ptr = msgs[i].buf + 2;
+
+		for (j = 0; j < data_size / data_chunk_size; j++) {
+			/* Insert the EEPROM dest addess, bits 0-15 */
+			data_chunk[0] = ((next_eeprom_addr >> 8) & 0xff);
+			data_chunk[1] = (next_eeprom_addr & 0xff);
+
+			if (msgs[i].flags & I2C_M_RD) {
+				ret = navi10_i2c_read_data(i2c_adap,
+							     (uint8_t)msgs[i].addr,
+							     data_chunk, MAX_SW_I2C_COMMANDS);
+
+				memcpy(data_ptr, data_chunk + 2, data_chunk_size);
+			} else {
+
+				memcpy(data_chunk + 2, data_ptr, data_chunk_size);
+
+				ret = navi10_i2c_write_data(i2c_adap,
+							      (uint8_t)msgs[i].addr,
+							      data_chunk, MAX_SW_I2C_COMMANDS);
+			}
+
+			if (ret) {
+				num = -EIO;
+				goto fail;
+			}
+
+			next_eeprom_addr += data_chunk_size;
+			data_ptr += data_chunk_size;
+		}
+
+		if (data_size % data_chunk_size) {
+			data_chunk[0] = ((next_eeprom_addr >> 8) & 0xff);
+			data_chunk[1] = (next_eeprom_addr & 0xff);
+
+			if (msgs[i].flags & I2C_M_RD) {
+				ret = navi10_i2c_read_data(i2c_adap,
+							     (uint8_t)msgs[i].addr,
+							     data_chunk, (data_size % data_chunk_size) + 2);
+
+				memcpy(data_ptr, data_chunk + 2, data_size % data_chunk_size);
+			} else {
+				memcpy(data_chunk + 2, data_ptr, data_size % data_chunk_size);
+
+				ret = navi10_i2c_write_data(i2c_adap,
+							      (uint8_t)msgs[i].addr,
+							      data_chunk, (data_size % data_chunk_size) + 2);
+			}
+
+			if (ret) {
+				num = -EIO;
+				goto fail;
+			}
+		}
+	}
+
+fail:
+	return num;
+}
+
+static u32 navi10_i2c_func(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
+}
+
+
+static const struct i2c_algorithm navi10_i2c_algo = {
+	.master_xfer = navi10_i2c_xfer,
+	.functionality = navi10_i2c_func,
+};
+
+static bool navi10_i2c_adapter_is_added(struct i2c_adapter *control)
+{
+	struct amdgpu_device *adev = to_amdgpu_device(control);
+
+	return control->dev.parent == &adev->pdev->dev;
+}
+
+static int navi10_i2c_control_init(struct smu_context *smu, struct i2c_adapter *control)
+{
+	struct amdgpu_device *adev = to_amdgpu_device(control);
+	int res;
+
+	/* smu_i2c_eeprom_init may be called twice in sriov */
+	if (navi10_i2c_adapter_is_added(control))
+		return 0;
+
+	control->owner = THIS_MODULE;
+	control->class = I2C_CLASS_SPD;
+	control->dev.parent = &adev->pdev->dev;
+	control->algo = &navi10_i2c_algo;
+	snprintf(control->name, sizeof(control->name), "AMDGPU SMU");
+
+	res = i2c_add_adapter(control);
+	if (res)
+		DRM_ERROR("Failed to register hw i2c, err: %d\n", res);
+
+	return res;
+}
+
+static void navi10_i2c_control_fini(struct smu_context *smu, struct i2c_adapter *control)
+{
+	if (!navi10_i2c_adapter_is_added(control))
+		return;
+
+	i2c_del_adapter(control);
+}
+
+
 static const struct pptable_funcs navi10_ppt_funcs = {
 	.tables_init = navi10_tables_init,
 	.alloc_dpm_context = navi10_allocate_dpm_context,
@@ -2353,6 +2590,8 @@ static const struct pptable_funcs navi10_ppt_funcs = {
 	.set_default_dpm_table = navi10_set_default_dpm_table,
 	.dpm_set_vcn_enable = navi10_dpm_set_vcn_enable,
 	.dpm_set_jpeg_enable = navi10_dpm_set_jpeg_enable,
+	.i2c_init = navi10_i2c_control_init,
+	.i2c_fini = navi10_i2c_control_fini,
 	.print_clk_levels = navi10_print_clk_levels,
 	.force_clk_levels = navi10_force_clk_levels,
 	.populate_umd_state_clk = navi10_populate_umd_state_clk,
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
