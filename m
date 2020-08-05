Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AE423CBC3
	for <lists+amd-gfx@lfdr.de>; Wed,  5 Aug 2020 17:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E3556E81E;
	Wed,  5 Aug 2020 15:39:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 440 seconds by postgrey-1.36 at gabe;
 Wed, 05 Aug 2020 15:39:52 UTC
Received: from svt-ETHLX-2.amd.com (unknown [165.204.55.250])
 by gabe.freedesktop.org (Postfix) with ESMTP id 916EF6E81E
 for <amd-gfx@lists.freedesktop.org>; Wed,  5 Aug 2020 15:39:52 +0000 (UTC)
Received: by svt-ETHLX-2.amd.com (Postfix, from userid 0)
 id 87D61184010C; Wed,  5 Aug 2020 11:32:31 -0400 (EDT)
From: Bokun Zhang <Bokun.Zhang@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] SWDEV-220451 - Query guest's information by VF2PF message -
 Guest side - part 1
Date: Wed,  5 Aug 2020 11:32:21 -0400
Message-Id: <20200805153222.33202-1-Bokun.Zhang@amd.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Bokun Zhang <Bokun.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

- Add guest side change to support VF2PF message
- Fix coding style

Change-Id: I82e5518cb10ec0b19fecaba7e05b02f4b7f2b409
Signed-off-by: Bokun Zhang <Bokun.Zhang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h    |  29 +-
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h | 276 ++++++++++++++++++++
 2 files changed, 285 insertions(+), 20 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
index b0b2bdc750df..ad2b2628ab67 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
@@ -24,6 +24,8 @@
 #ifndef AMDGPU_VIRT_H
 #define AMDGPU_VIRT_H
 
+#include "amdgv_sriovmsg.h"
+
 #define AMDGPU_SRIOV_CAPS_SRIOV_VBIOS  (1 << 0) /* vBIOS is sr-iov ready */
 #define AMDGPU_SRIOV_CAPS_ENABLE_IOV   (1 << 1) /* sr-iov is enabled on this GPU */
 #define AMDGPU_SRIOV_CAPS_IS_VF        (1 << 2) /* this GPU is a virtual function */
@@ -69,7 +71,10 @@ struct amdgpu_virt_fw_reserve {
 	struct amd_sriov_msg_vf2pf_info_header *p_vf2pf;
 	unsigned int checksum_key;
 };
+
 /*
+ * Legacy GIM header
+ *
  * Defination between PF and VF
  * Structures forcibly aligned to 4 to keep the same style as PF.
  */
@@ -89,15 +94,7 @@ enum AMDGIM_FEATURE_FLAG {
 	AMDGIM_FEATURE_HW_PERF_SIMULATION = (1 << 3),
 };
 
-struct amd_sriov_msg_pf2vf_info_header {
-	/* the total structure size in byte. */
-	uint32_t size;
-	/* version of this structure, written by the GIM */
-	uint32_t version;
-	/* reserved */
-	uint32_t reserved[2];
-} __aligned(4);
-struct  amdgim_pf2vf_info_v1 {
+struct amdgim_pf2vf_info_v1 {
 	/* header contains size and version */
 	struct amd_sriov_msg_pf2vf_info_header header;
 	/* max_width * max_height */
@@ -116,6 +113,7 @@ struct  amdgim_pf2vf_info_v1 {
 	unsigned int checksum;
 } __aligned(4);
 
+/* TODO: below struct is duplicated to amd_sriov_msg_pf2vf_info */
 struct  amdgim_pf2vf_info_v2 {
 	/* header contains size and version */
 	struct amd_sriov_msg_pf2vf_info_header header;
@@ -146,16 +144,6 @@ struct  amdgim_pf2vf_info_v2 {
 	uint32_t reserved[AMDGIM_GET_STRUCTURE_RESERVED_SIZE(256, 0, 0, (9 + sizeof(struct amd_sriov_msg_pf2vf_info_header)/sizeof(uint32_t)), 3)];
 } __aligned(4);
 
-
-struct amd_sriov_msg_vf2pf_info_header {
-	/* the total structure size in byte. */
-	uint32_t size;
-	/*version of this structure, written by the guest */
-	uint32_t version;
-	/* reserved */
-	uint32_t reserved[2];
-} __aligned(4);
-
 struct amdgim_vf2pf_info_v1 {
 	/* header contains size and version */
 	struct amd_sriov_msg_vf2pf_info_header header;
@@ -217,8 +205,9 @@ struct amdgim_vf2pf_info_v2 {
 	uint32_t reserved[AMDGIM_GET_STRUCTURE_RESERVED_SIZE(256, 64, 0, (12 + sizeof(struct amd_sriov_msg_vf2pf_info_header)/sizeof(uint32_t)), 0)];
 } __aligned(4);
 
+/* TODO: below macro and typedef will cause compile error, need to remove */
 #define AMDGPU_FW_VRAM_VF2PF_VER 2
-typedef struct amdgim_vf2pf_info_v2 amdgim_vf2pf_info ;
+typedef struct amd_sriov_msg_vf2pf_info amdgim_vf2pf_info;
 
 #define AMDGPU_FW_VRAM_VF2PF_WRITE(adev, field, val) \
 	do { \
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h b/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
new file mode 100644
index 000000000000..5355827ed0ae
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
@@ -0,0 +1,276 @@
+/*
+ * Copyright 2018-2019 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+
+#ifndef AMDGV_SRIOV_MSG__H_
+#define AMDGV_SRIOV_MSG__H_
+
+/* unit in kilobytes */
+#define AMD_SRIOV_MSG_VBIOS_OFFSET              0
+#define AMD_SRIOV_MSG_VBIOS_SIZE_KB             64
+#define AMD_SRIOV_MSG_DATAEXCHANGE_OFFSET_KB    AMD_SRIOV_MSG_VBIOS_SIZE_KB
+#define AMD_SRIOV_MSG_DATAEXCHANGE_SIZE_KB      4
+
+/*
+ * layout
+ * 0           64KB        65KB        66KB
+ * |   VBIOS   |   PF2VF   |   VF2PF   |   Bad Page   | ...
+ * |   64KB    |   1KB     |   1KB     |
+ */
+#define AMD_SRIOV_MSG_SIZE_KB                   1
+#define AMD_SRIOV_MSG_PF2VF_OFFSET_KB           AMD_SRIOV_MSG_DATAEXCHANGE_OFFSET_KB
+#define AMD_SRIOV_MSG_VF2PF_OFFSET_KB           (AMD_SRIOV_MSG_PF2VF_OFFSET_KB + AMD_SRIOV_MSG_SIZE_KB)
+#define AMD_SRIOV_MSG_BAD_PAGE_OFFSET_KB        (AMD_SRIOV_MSG_VF2PF_OFFSET_KB + AMD_SRIOV_MSG_SIZE_KB)
+
+/*
+ * PF2VF history log:
+ * v1 defined in amdgim
+ * v2 current
+ *
+ * VF2PF history log:
+ * v1 defined in amdgim
+ * v2 defined in amdgim
+ * v3 current
+ */
+#define AMD_SRIOV_MSG_FW_VRAM_PF2VF_VER			2
+#define AMD_SRIOV_MSG_FW_VRAM_VF2PF_VER			3
+
+#define AMD_SRIOV_MSG_RESERVE_UCODE		24
+
+enum amd_sriov_ucode_engine_id {
+	AMD_SRIOV_UCODE_ID_VCE = 0,
+	AMD_SRIOV_UCODE_ID_UVD,
+	AMD_SRIOV_UCODE_ID_MC,
+	AMD_SRIOV_UCODE_ID_ME,
+	AMD_SRIOV_UCODE_ID_PFP,
+	AMD_SRIOV_UCODE_ID_CE,
+	AMD_SRIOV_UCODE_ID_RLC,
+	AMD_SRIOV_UCODE_ID_RLC_SRLC,
+	AMD_SRIOV_UCODE_ID_RLC_SRLG,
+	AMD_SRIOV_UCODE_ID_RLC_SRLS,
+	AMD_SRIOV_UCODE_ID_MEC,
+	AMD_SRIOV_UCODE_ID_MEC2,
+	AMD_SRIOV_UCODE_ID_SOS,
+	AMD_SRIOV_UCODE_ID_ASD,
+	AMD_SRIOV_UCODE_ID_TA_RAS,
+	AMD_SRIOV_UCODE_ID_TA_XGMI,
+	AMD_SRIOV_UCODE_ID_SMC,
+	AMD_SRIOV_UCODE_ID_SDMA,
+	AMD_SRIOV_UCODE_ID_SDMA2,
+	AMD_SRIOV_UCODE_ID_VCN,
+	AMD_SRIOV_UCODE_ID_DMCU,
+	AMD_SRIOV_UCODE_ID__MAX
+};
+
+#pragma pack(push, 1) 	// PF2VF / VF2PF data areas are byte packed
+
+union amd_sriov_msg_feature_flags {
+	struct {
+		uint32_t  error_log_collect  : 1;
+		uint32_t  host_load_ucodes   : 1;
+		uint32_t  host_flr_vramlost  : 1;
+		uint32_t  mm_bw_management   : 1;
+		uint32_t  pp_one_vf_mode     : 1;
+		uint32_t  reserved           : 27;
+	} flags;
+	uint32_t      all;
+};
+
+union amd_sriov_msg_os_info {
+	struct {
+		uint32_t  windows            : 1;
+		uint32_t  reserved           : 31;
+	} info;
+	uint32_t      all;
+};
+
+struct amd_sriov_msg_pf2vf_info_header {
+	/* the total structure size in byte */
+	uint32_t size;
+	/* version of this structure, written by the HOST */
+	uint32_t version;
+	/* reserved */
+	uint32_t reserved[2];
+};
+
+struct amd_sriov_msg_pf2vf_info {
+	/* header contains size and version */
+	struct amd_sriov_msg_pf2vf_info_header header;
+	/* use private key from mailbox 2 to create checksum */
+	uint32_t checksum;
+	/* The features flags of the HOST driver supports */
+	union amd_sriov_msg_feature_flags feature_flags;
+	/* (max_width * max_height * fps) / (16 * 16) */
+	uint32_t hevc_enc_max_mb_per_second;
+	/* (max_width * max_height) / (16 * 16) */
+	uint32_t hevc_enc_max_mb_per_frame;
+	/* (max_width * max_height * fps) / (16 * 16) */
+	uint32_t avc_enc_max_mb_per_second;
+	/* (max_width * max_height) / (16 * 16) */
+	uint32_t avc_enc_max_mb_per_frame;
+	/* MEC FW position in BYTE from the start of VF visible frame buffer */
+	uint64_t mecfw_offset;
+	/* MEC FW size in BYTE */
+	uint32_t mecfw_size;
+	/* UVD FW position in BYTE from the start of VF visible frame buffer */
+	uint64_t uvdfw_offset;
+	/* UVD FW size in BYTE */
+	uint32_t uvdfw_size;
+	/* VCE FW position in BYTE from the start of VF visible frame buffer */
+	uint64_t vcefw_offset;
+	/* VCE FW size in BYTE */
+	uint32_t vcefw_size;
+	/* Bad pages block position in BYTE */
+	uint32_t bp_block_offset_low;
+	uint32_t bp_block_offset_high;
+	/* Bad pages block size in BYTE */
+	uint32_t bp_block_size;
+	/* frequency for VF to update the VF2PF area in msec, 0 = manual */
+	uint32_t vf2pf_update_interval_ms;
+	/* identification in ROCm SMI */
+	uint64_t uuid;
+	uint32_t fcn_idx;
+	/* reserved */
+	uint32_t reserved[256-26];
+};
+
+struct amd_sriov_msg_vf2pf_info_header {
+	/* the total structure size in byte */
+	uint32_t size;
+	/* version of this structure, written by the guest */
+	uint32_t version;
+	/* reserved */
+	uint32_t reserved[2];
+};
+
+struct amd_sriov_msg_vf2pf_info {
+	/* header contains size and version */
+	struct amd_sriov_msg_vf2pf_info_header header;
+	uint32_t checksum;
+	/* driver version */
+	uint8_t  driver_version[64];
+	/* driver certification, 1=WHQL, 0=None */
+	uint32_t driver_cert;
+	/* guest OS type and version */
+	union amd_sriov_msg_os_info os_info;
+	/* guest fb information in the unit of MB */
+	uint32_t fb_usage;
+	/* guest gfx engine usage percentage */
+	uint32_t gfx_usage;
+	/* guest gfx engine health percentage */
+	uint32_t gfx_health;
+	/* guest compute engine usage percentage */
+	uint32_t compute_usage;
+	/* guest compute engine health percentage */
+	uint32_t compute_health;
+	/* guest avc engine usage percentage. 0xffff means N/A */
+	uint32_t avc_enc_usage;
+	/* guest avc engine health percentage. 0xffff means N/A */
+	uint32_t avc_enc_health;
+	/* guest hevc engine usage percentage. 0xffff means N/A */
+	uint32_t hevc_enc_usage;
+	/* guest hevc engine usage percentage. 0xffff means N/A */
+	uint32_t hevc_enc_health;
+	/* combined encode/decode usage */
+	uint32_t encode_usage;
+	uint32_t decode_usage;
+	/* Version of PF2VF that VF understands */
+	uint32_t pf2vf_version_required;
+	/* additional FB usage */
+	uint32_t fb_vis_usage;
+	uint32_t fb_vis_size;
+	uint32_t fb_size;
+	/* guest ucode data, each one is 1.25 Dword */
+	struct {
+		uint8_t  id;
+		uint32_t version;
+	} ucode_info[AMD_SRIOV_MSG_RESERVE_UCODE];
+
+	/* reserved */
+	uint32_t reserved[256-68];
+};
+
+/* mailbox message send from guest to host  */
+enum amd_sriov_mailbox_request_message {
+	MB_REQ_MSG_REQ_GPU_INIT_ACCESS = 1,
+	MB_REQ_MSG_REL_GPU_INIT_ACCESS,
+	MB_REQ_MSG_REQ_GPU_FINI_ACCESS,
+	MB_REQ_MSG_REL_GPU_FINI_ACCESS,
+	MB_REQ_MSG_REQ_GPU_RESET_ACCESS,
+	MB_REQ_MSG_REQ_GPU_INIT_DATA,
+
+	MB_REQ_MSG_LOG_VF_ERROR       = 200,
+};
+
+/* mailbox message send from host to guest  */
+enum amd_sriov_mailbox_response_message {
+	MB_RES_MSG_CLR_MSG_BUF = 0,
+	MB_RES_MSG_READY_TO_ACCESS_GPU = 1,
+	MB_RES_MSG_FLR_NOTIFICATION,
+	MB_RES_MSG_FLR_NOTIFICATION_COMPLETION,
+	MB_RES_MSG_SUCCESS,
+	MB_RES_MSG_FAIL,
+	MB_RES_MSG_QUERY_ALIVE,
+	MB_RES_MSG_GPU_INIT_DATA_READY,
+
+	MB_RES_MSG_TEXT_MESSAGE = 255
+};
+
+/* version data stored in MAILBOX_MSGBUF_RCV_DW1 for future expansion */
+enum amd_sriov_gpu_init_data_version {
+	GPU_INIT_DATA_READY_V1 = 1,
+};
+
+#pragma pack(pop)	// Restore previous packing option
+
+/* checksum function between host and guest */
+unsigned int amd_sriov_msg_checksum(void *obj,
+				unsigned long obj_size,
+				unsigned int key,
+				unsigned int checksum);
+
+/* assertion at compile time */
+#ifdef __linux__
+#define stringification(s) _stringification(s)
+#define _stringification(s) #s
+
+_Static_assert(
+	sizeof(struct amd_sriov_msg_vf2pf_info) == AMD_SRIOV_MSG_SIZE_KB << 10,
+	"amd_sriov_msg_vf2pf_info must be " stringification(AMD_SRIOV_MSG_SIZE_KB) " KB");
+
+_Static_assert(
+	sizeof(struct amd_sriov_msg_pf2vf_info) == AMD_SRIOV_MSG_SIZE_KB << 10,
+	"amd_sriov_msg_pf2vf_info must be " stringification(AMD_SRIOV_MSG_SIZE_KB) " KB");
+
+_Static_assert(
+	AMD_SRIOV_MSG_RESERVE_UCODE % 4 == 0,
+	"AMD_SRIOV_MSG_RESERVE_UCODE must be multiple of 4");
+
+_Static_assert(
+	AMD_SRIOV_MSG_RESERVE_UCODE > AMD_SRIOV_UCODE_ID__MAX,
+	"AMD_SRIOV_MSG_RESERVE_UCODE must be bigger than AMD_SRIOV_UCODE_ID__MAX");
+
+#undef _stringification
+#undef stringification
+#endif
+
+#endif /* AMDGV_SRIOV_MSG__H_ */
-- 
2.20.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
