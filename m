Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F69190BA3
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Mar 2020 11:59:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B89889D2F;
	Tue, 24 Mar 2020 10:59:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332F68987C
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Mar 2020 10:59:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QgfTrwmMeNVRDN0GXQgIySirHa2mcWO+hHMKX++32lgFIFPcebEPuc/gVoP/N4Z35/9gaHLGVB82G0jRgRQ91+B791PcPW6ic1fkNe0TaqbKvBggX/lHSX85o7LhVYmyut8gSeidJWDZ0WPaohh79XlojpdsXNHtjkIs9q1lodPk4X5f9d9WN7hnP+pIXACr0tTwNHwnnIuOmzSctFuCwVka6CI6wmTVw9jT9AV9gtJ8ewkqlK/h+exQHBUZS1UzVKWVQcjwAgLA9VOtBFAGFw630+4CLs5PuMVEt6H6847Ro2mOEz56vs6yD7aCpOMR9OvK1uTz5ieURF/fYW94Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQsilcrJoRED9/q/DtRfvsxheyhewPQxs0uJw7xKz04=;
 b=RQzU+jBjrdotjFQ+cW2s85BSYr7Jz/EorsLadd7CE/ikQpmWHCtWuh/RGtne8GrKGzBNiQ7wthMNlBdYThmxCNg7xEgqKc/YgPvhCf8Sxve6NrlGUEfxE81VJvrB1STIT3TzrB3fjLZxThr9ZsRlalgQxdirD7BoYb6AAZO70GJh5QGx3GAmfEmbbBzEWXOcd6NpbKC8+bHHfUIr5xk0bt7wKi4ZUGoCM6BzQLM+97gwOmWCEsfhueLQl57BdUxrIk1cZ1g62ct/gu/1bsKf+Tv/2EBtmXxj1Eg/bUtXGa7vdYE5m79pnojg/hWDo+nReXSs8S0ElhfGW1VnB9Prvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQsilcrJoRED9/q/DtRfvsxheyhewPQxs0uJw7xKz04=;
 b=Tuw9s+ITcIM7BhGHQLTmdU3QLiT0uleuVH4193r5aruAXGIoQwCWPrqhWSw8pSdPEAeP5FsKMOi8HwaokGti1F24rH7GvmEG94iqTw9XJRjbXNIZjEtQOAR+99tuA72277RQLJuBwr5ulfFeFzmZStRkTSDE9UK5g9+25Q4U7Ec=
Received: from MWHPR11CA0028.namprd11.prod.outlook.com (2603:10b6:300:115::14)
 by DM5PR12MB1241.namprd12.prod.outlook.com (2603:10b6:3:72::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Tue, 24 Mar
 2020 10:59:01 +0000
Received: from CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:115:cafe::20) by MWHPR11CA0028.outlook.office365.com
 (2603:10b6:300:115::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.18 via Frontend
 Transport; Tue, 24 Mar 2020 10:59:01 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM11FT058.mail.protection.outlook.com (10.13.174.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2814.13 via Frontend Transport; Tue, 24 Mar 2020 10:59:00 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 24 Mar
 2020 05:58:59 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 24 Mar
 2020 05:58:59 -0500
Received: from monk-build.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Tue, 24 Mar 2020 05:58:58 -0500
From: Monk Liu <Monk.Liu@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 4/4] drm/amdgpu: cleanup all virtualization detection routine
Date: Tue, 24 Mar 2020 18:58:53 +0800
Message-ID: <1585047533-10966-4-git-send-email-Monk.Liu@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585047533-10966-1-git-send-email-Monk.Liu@amd.com>
References: <1585047533-10966-1-git-send-email-Monk.Liu@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(39860400002)(396003)(428003)(46966005)(8936002)(8676002)(70206006)(70586007)(81166006)(81156014)(86362001)(36756003)(7696005)(47076004)(4326008)(26005)(2616005)(2906002)(6916009)(30864003)(336012)(426003)(6666004)(356004)(186003)(5660300002)(478600001)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1241; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c82fa6e-5ab9-4594-8e4a-08d7cfe25c07
X-MS-TrafficTypeDiagnostic: DM5PR12MB1241:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1241838FB4C9FC50D3BA042684F10@DM5PR12MB1241.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 03524FBD26
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tZWlluUEqsMBy6H0sZco9V04oPItjgfBQgSTCNn/+gCrL/3JuXte5eWT69+5BIE7WGM34AILVCvI8SIcIsOjZ141v7XXrW7ndoyfWFBc1MxixNUM7qeCBL/J+6WgpwSiHV36yi9FT39KxH7rX55Dp+zuCEbk5BE/Swqt8SdAZFVnLQV1kGDAGOT52e9rBBrlGFBVOkFsLXUgLSg4KBMklvJgSlxXqa7dtNcqr51wcWsD8rEt/XIEvCPbgr6GldyuYEbnFzHm9HZQRUwpmkG/iIxLeVmEEGRuSv9AiJqRjmxXvCjYfX9GFk48pzbYmhFK0m3StcohHbmMcNYIbAfRqOQj9QXN45GtXHEhqbOoAUxZBaqOmpr3dhYh8se/wMyyxcexiXA//xc1JACKZMR/wLba3chxj5eefNodGpZh2XuyaDAkgQQ2H0fkABzX1PfEzyNCvXKhEaUTzdZeRHL8PxZUBO1kk1YB+C/STGJ/nGgXVSvS5iMb5p+aGIbFw/IUVX3IzlNEGMZoEtQeZRYGXQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2020 10:59:00.8083 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c82fa6e-5ab9-4594-8e4a-08d7cfe25c07
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1241
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
Cc: Monk Liu <Monk.Liu@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

we need to move virt detection much earlier because:
1) HW team confirms us that RCC_IOV_FUNC_IDENTIFIER will always
be at DE5 (dw) mmio offset from vega10, this way there is no
need to implement detect_hw_virt() routine in each nbio/chip file.
for VI SRIOV chip (tonga & fiji), the BIF_IOV_FUNC_IDENTIFIER is at
0x1503

2) we need to acknowledged we are SRIOV VF before we do IP discovery because
the IP discovery content will be updated by host everytime after it recieved
a new coming "REQ_GPU_INIT_DATA" request from guest (there will be patches
for this new handshake soon).

Signed-off-by: Monk Liu <Monk.Liu@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  3 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h           |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           | 33 ++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |  6 ++++
 drivers/gpu/drm/amd/amdgpu/cik.c                   |  8 ------
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c             | 18 ------------
 drivers/gpu/drm/amd/amdgpu/nbio_v6_1.c             | 18 ------------
 drivers/gpu/drm/amd/amdgpu/nbio_v7_0.c             |  7 -----
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             | 18 ------------
 drivers/gpu/drm/amd/amdgpu/nv.c                    |  2 --
 drivers/gpu/drm/amd/amdgpu/si.c                    |  8 ------
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |  1 -
 drivers/gpu/drm/amd/amdgpu/vi.c                    | 24 ----------------
 .../amd/include/asic_reg/nbif/nbif_6_1_offset.h    |  2 ++
 .../amd/include/asic_reg/nbio/nbio_7_0_offset.h    |  2 ++
 .../amd/include/asic_reg/nbio/nbio_7_4_offset.h    |  2 ++
 16 files changed, 48 insertions(+), 105 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index e55dbcd..ca609b6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3057,6 +3057,9 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	if (amdgpu_mes && adev->asic_type >= CHIP_NAVI10)
 		adev->enable_mes = true;
 
+	/* detect hw virtualization here */
+	amdgpu_detect_virtualization(adev);
+
 	if (amdgpu_discovery && adev->asic_type >= CHIP_NAVI10) {
 		r = amdgpu_discovery_init(adev);
 		if (r) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h
index 919bd56..edaac24 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h
@@ -77,7 +77,6 @@ struct amdgpu_nbio_funcs {
 				      u32 *flags);
 	void (*ih_control)(struct amdgpu_device *adev);
 	void (*init_registers)(struct amdgpu_device *adev);
-	void (*detect_hw_virt)(struct amdgpu_device *adev);
 	void (*remap_hdp_registers)(struct amdgpu_device *adev);
 	void (*handle_ras_controller_intr_no_bifring)(struct amdgpu_device *adev);
 	void (*handle_ras_err_event_athub_intr_no_bifring)(struct amdgpu_device *adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
index adc813c..43a1ee3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
@@ -287,3 +287,36 @@ void amdgpu_virt_init_data_exchange(struct amdgpu_device *adev)
 		}
 	}
 }
+
+void amdgpu_detect_virtualization(struct amdgpu_device *adev)
+{
+	uint32_t reg;
+
+	switch (adev->asic_type) {
+	case CHIP_TONGA:
+	case CHIP_FIJI:
+		reg = RREG32(mmBIF_IOV_FUNC_IDENTIFIER);
+		break;
+	case CHIP_VEGA10:
+	case CHIP_VEGA20:
+	case CHIP_NAVI10:
+	case CHIP_NAVI12:
+	case CHIP_ARCTURUS:
+		reg = RREG32(mmRCC_IOV_FUNC_IDENTIFIER);
+		break;
+	default: /* other chip doesn't support SRIOV */
+		reg = 0;
+		break;
+	}
+
+	if (reg & 1)
+		adev->virt.caps |= AMDGPU_SRIOV_CAPS_IS_VF;
+
+	if (reg & 0x80000000)
+		adev->virt.caps |= AMDGPU_SRIOV_CAPS_ENABLE_IOV;
+
+	if (!reg) {
+		if (is_virtual_machine())	/* passthrough mode exclus sriov mod */
+			adev->virt.caps |= AMDGPU_PASSTHROUGH_MODE;
+	}
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
index 0a95b13..74f9843 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
@@ -30,6 +30,11 @@
 #define AMDGPU_PASSTHROUGH_MODE        (1 << 3) /* thw whole GPU is pass through for VM */
 #define AMDGPU_SRIOV_CAPS_RUNTIME      (1 << 4) /* is out of full access mode */
 
+/* all asic after AI use this offset */
+#define mmRCC_IOV_FUNC_IDENTIFIER 0xDE5
+/* tonga/fiji use this offset */
+#define mmBIF_IOV_FUNC_IDENTIFIER 0x1503
+
 struct amdgpu_mm_table {
 	struct amdgpu_bo	*bo;
 	uint32_t		*cpu_addr;
@@ -305,4 +310,5 @@ int amdgpu_virt_fw_reserve_get_checksum(void *obj, unsigned long obj_size,
 					unsigned int key,
 					unsigned int chksum);
 void amdgpu_virt_init_data_exchange(struct amdgpu_device *adev);
+void amdgpu_detect_virtualization(struct amdgpu_device *adev);
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/cik.c b/drivers/gpu/drm/amd/amdgpu/cik.c
index 006f21e..db68ffa 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik.c
@@ -1811,12 +1811,6 @@ static uint32_t cik_get_rev_id(struct amdgpu_device *adev)
 		>> CC_DRM_ID_STRAPS__ATI_REV_ID__SHIFT;
 }
 
-static void cik_detect_hw_virtualization(struct amdgpu_device *adev)
-{
-	if (is_virtual_machine()) /* passthrough mode */
-		adev->virt.caps |= AMDGPU_PASSTHROUGH_MODE;
-}
-
 static void cik_flush_hdp(struct amdgpu_device *adev, struct amdgpu_ring *ring)
 {
 	if (!ring || !ring->funcs->emit_wreg) {
@@ -2179,8 +2173,6 @@ static const struct amdgpu_ip_block_version cik_common_ip_block =
 
 int cik_set_ip_blocks(struct amdgpu_device *adev)
 {
-	cik_detect_hw_virtualization(adev);
-
 	switch (adev->asic_type) {
 	case CHIP_BONAIRE:
 		amdgpu_device_ip_block_add(adev, &cik_common_ip_block);
diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c b/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c
index f3a3fe7..cbcf045 100644
--- a/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c
@@ -290,23 +290,6 @@ const struct nbio_hdp_flush_reg nbio_v2_3_hdp_flush_reg = {
 	.ref_and_mask_sdma1 = BIF_BX_PF_GPU_HDP_FLUSH_DONE__SDMA1_MASK,
 };
 
-static void nbio_v2_3_detect_hw_virt(struct amdgpu_device *adev)
-{
-	uint32_t reg;
-
-	reg = RREG32_SOC15(NBIO, 0, mmRCC_DEV0_EPF0_RCC_IOV_FUNC_IDENTIFIER);
-	if (reg & 1)
-		adev->virt.caps |= AMDGPU_SRIOV_CAPS_IS_VF;
-
-	if (reg & 0x80000000)
-		adev->virt.caps |= AMDGPU_SRIOV_CAPS_ENABLE_IOV;
-
-	if (!reg) {
-		if (is_virtual_machine())	/* passthrough mode exclus sriov mod */
-			adev->virt.caps |= AMDGPU_PASSTHROUGH_MODE;
-	}
-}
-
 static void nbio_v2_3_init_registers(struct amdgpu_device *adev)
 {
 	uint32_t def, data;
@@ -338,6 +321,5 @@ const struct amdgpu_nbio_funcs nbio_v2_3_funcs = {
 	.get_clockgating_state = nbio_v2_3_get_clockgating_state,
 	.ih_control = nbio_v2_3_ih_control,
 	.init_registers = nbio_v2_3_init_registers,
-	.detect_hw_virt = nbio_v2_3_detect_hw_virt,
 	.remap_hdp_registers = nbio_v2_3_remap_hdp_registers,
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v6_1.c b/drivers/gpu/drm/amd/amdgpu/nbio_v6_1.c
index 635d9e1..7b2fb05 100644
--- a/drivers/gpu/drm/amd/amdgpu/nbio_v6_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/nbio_v6_1.c
@@ -241,23 +241,6 @@ const struct nbio_hdp_flush_reg nbio_v6_1_hdp_flush_reg = {
 	.ref_and_mask_sdma1 = BIF_BX_PF0_GPU_HDP_FLUSH_DONE__SDMA1_MASK
 };
 
-static void nbio_v6_1_detect_hw_virt(struct amdgpu_device *adev)
-{
-	uint32_t reg;
-
-	reg = RREG32_SOC15(NBIO, 0, mmRCC_PF_0_0_RCC_IOV_FUNC_IDENTIFIER);
-	if (reg & 1)
-		adev->virt.caps |= AMDGPU_SRIOV_CAPS_IS_VF;
-
-	if (reg & 0x80000000)
-		adev->virt.caps |= AMDGPU_SRIOV_CAPS_ENABLE_IOV;
-
-	if (!reg) {
-		if (is_virtual_machine())	/* passthrough mode exclus sriov mod */
-			adev->virt.caps |= AMDGPU_PASSTHROUGH_MODE;
-	}
-}
-
 static void nbio_v6_1_init_registers(struct amdgpu_device *adev)
 {
 	uint32_t def, data;
@@ -294,5 +277,4 @@ const struct amdgpu_nbio_funcs nbio_v6_1_funcs = {
 	.get_clockgating_state = nbio_v6_1_get_clockgating_state,
 	.ih_control = nbio_v6_1_ih_control,
 	.init_registers = nbio_v6_1_init_registers,
-	.detect_hw_virt = nbio_v6_1_detect_hw_virt,
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v7_0.c b/drivers/gpu/drm/amd/amdgpu/nbio_v7_0.c
index d6cbf26..d34628e 100644
--- a/drivers/gpu/drm/amd/amdgpu/nbio_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/nbio_v7_0.c
@@ -280,12 +280,6 @@ const struct nbio_hdp_flush_reg nbio_v7_0_hdp_flush_reg = {
 	.ref_and_mask_sdma1 = GPU_HDP_FLUSH_DONE__SDMA1_MASK,
 };
 
-static void nbio_v7_0_detect_hw_virt(struct amdgpu_device *adev)
-{
-	if (is_virtual_machine())	/* passthrough mode exclus sriov mod */
-		adev->virt.caps |= AMDGPU_PASSTHROUGH_MODE;
-}
-
 static void nbio_v7_0_init_registers(struct amdgpu_device *adev)
 {
 
@@ -310,6 +304,5 @@ const struct amdgpu_nbio_funcs nbio_v7_0_funcs = {
 	.get_clockgating_state = nbio_v7_0_get_clockgating_state,
 	.ih_control = nbio_v7_0_ih_control,
 	.init_registers = nbio_v7_0_init_registers,
-	.detect_hw_virt = nbio_v7_0_detect_hw_virt,
 	.remap_hdp_registers = nbio_v7_0_remap_hdp_registers,
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c b/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c
index 149d386..41c53c1 100644
--- a/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c
@@ -292,23 +292,6 @@ const struct nbio_hdp_flush_reg nbio_v7_4_hdp_flush_reg = {
 	.ref_and_mask_sdma7 = GPU_HDP_FLUSH_DONE__RSVD_ENG5_MASK,
 };
 
-static void nbio_v7_4_detect_hw_virt(struct amdgpu_device *adev)
-{
-	uint32_t reg;
-
-	reg = RREG32_SOC15(NBIO, 0, mmRCC_IOV_FUNC_IDENTIFIER);
-	if (reg & 1)
-		adev->virt.caps |= AMDGPU_SRIOV_CAPS_IS_VF;
-
-	if (reg & 0x80000000)
-		adev->virt.caps |= AMDGPU_SRIOV_CAPS_ENABLE_IOV;
-
-	if (!reg) {
-		if (is_virtual_machine())	/* passthrough mode exclus sriov mod */
-			adev->virt.caps |= AMDGPU_PASSTHROUGH_MODE;
-	}
-}
-
 static void nbio_v7_4_init_registers(struct amdgpu_device *adev)
 {
 
@@ -561,7 +544,6 @@ const struct amdgpu_nbio_funcs nbio_v7_4_funcs = {
 	.get_clockgating_state = nbio_v7_4_get_clockgating_state,
 	.ih_control = nbio_v7_4_ih_control,
 	.init_registers = nbio_v7_4_init_registers,
-	.detect_hw_virt = nbio_v7_4_detect_hw_virt,
 	.remap_hdp_registers = nbio_v7_4_remap_hdp_registers,
 	.handle_ras_controller_intr_no_bifring = nbio_v7_4_handle_ras_controller_intr_no_bifring,
 	.handle_ras_err_event_athub_intr_no_bifring = nbio_v7_4_handle_ras_err_event_athub_intr_no_bifring,
diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index 033cbbc..a67d78d 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -465,8 +465,6 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)
 	adev->nbio.funcs = &nbio_v2_3_funcs;
 	adev->nbio.hdp_flush_reg = &nbio_v2_3_hdp_flush_reg;
 
-	adev->nbio.funcs->detect_hw_virt(adev);
-
 	if (amdgpu_sriov_vf(adev))
 		adev->virt.ops = &xgpu_nv_virt_ops;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/si.c b/drivers/gpu/drm/amd/amdgpu/si.c
index 4d415bf..153db3f 100644
--- a/drivers/gpu/drm/amd/amdgpu/si.c
+++ b/drivers/gpu/drm/amd/amdgpu/si.c
@@ -1249,12 +1249,6 @@ static int si_set_uvd_clocks(struct amdgpu_device *adev, u32 vclk, u32 dclk)
 	return 0;
 }
 
-static void si_detect_hw_virtualization(struct amdgpu_device *adev)
-{
-	if (is_virtual_machine()) /* passthrough mode */
-		adev->virt.caps |= AMDGPU_PASSTHROUGH_MODE;
-}
-
 static void si_flush_hdp(struct amdgpu_device *adev, struct amdgpu_ring *ring)
 {
 	if (!ring || !ring->funcs->emit_wreg) {
@@ -2165,8 +2159,6 @@ static const struct amdgpu_ip_block_version si_common_ip_block =
 
 int si_set_ip_blocks(struct amdgpu_device *adev)
 {
-	si_detect_hw_virtualization(adev);
-
 	switch (adev->asic_type) {
 	case CHIP_VERDE:
 	case CHIP_TAHITI:
diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgpu/soc15.c
index a40499d..a8c90d8 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -712,7 +712,6 @@ int soc15_set_ip_blocks(struct amdgpu_device *adev)
 		adev->df.funcs = &df_v1_7_funcs;
 
 	adev->rev_id = soc15_get_rev_id(adev);
-	adev->nbio.funcs->detect_hw_virt(adev);
 
 	if (amdgpu_sriov_vf(adev))
 		adev->virt.ops = &xgpu_ai_virt_ops;
diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu/vi.c
index 78b3590..0a90c29 100644
--- a/drivers/gpu/drm/amd/amdgpu/vi.c
+++ b/drivers/gpu/drm/amd/amdgpu/vi.c
@@ -448,27 +448,6 @@ static bool vi_read_bios_from_rom(struct amdgpu_device *adev,
 	return true;
 }
 
-static void vi_detect_hw_virtualization(struct amdgpu_device *adev)
-{
-	uint32_t reg = 0;
-
-	if (adev->asic_type == CHIP_TONGA ||
-	    adev->asic_type == CHIP_FIJI) {
-	       reg = RREG32(mmBIF_IOV_FUNC_IDENTIFIER);
-	       /* bit0: 0 means pf and 1 means vf */
-	       if (REG_GET_FIELD(reg, BIF_IOV_FUNC_IDENTIFIER, FUNC_IDENTIFIER))
-		       adev->virt.caps |= AMDGPU_SRIOV_CAPS_IS_VF;
-	       /* bit31: 0 means disable IOV and 1 means enable */
-	       if (REG_GET_FIELD(reg, BIF_IOV_FUNC_IDENTIFIER, IOV_ENABLE))
-		       adev->virt.caps |= AMDGPU_SRIOV_CAPS_ENABLE_IOV;
-	}
-
-	if (reg == 0) {
-		if (is_virtual_machine()) /* passthrough mode exclus sr-iov mode */
-			adev->virt.caps |= AMDGPU_PASSTHROUGH_MODE;
-	}
-}
-
 static const struct amdgpu_allowed_register_entry vi_allowed_read_registers[] = {
 	{mmGRBM_STATUS},
 	{mmGRBM_STATUS2},
@@ -1730,9 +1709,6 @@ static const struct amdgpu_ip_block_version vi_common_ip_block =
 
 int vi_set_ip_blocks(struct amdgpu_device *adev)
 {
-	/* in early init stage, vbios code won't work */
-	vi_detect_hw_virtualization(adev);
-
 	if (amdgpu_sriov_vf(adev))
 		adev->virt.ops = &xgpu_vi_virt_ops;
 
diff --git a/drivers/gpu/drm/amd/include/asic_reg/nbif/nbif_6_1_offset.h b/drivers/gpu/drm/amd/include/asic_reg/nbif/nbif_6_1_offset.h
index 68d0ffa..92fd27c 100644
--- a/drivers/gpu/drm/amd/include/asic_reg/nbif/nbif_6_1_offset.h
+++ b/drivers/gpu/drm/amd/include/asic_reg/nbif/nbif_6_1_offset.h
@@ -1162,8 +1162,10 @@
 #define mmRCC_CONFIG_MEMSIZE_BASE_IDX                                                                  0
 #define mmRCC_CONFIG_RESERVED                                                                          0x0de4 // duplicate 
 #define mmRCC_CONFIG_RESERVED_BASE_IDX                                                                 0
+#ifndef mmRCC_IOV_FUNC_IDENTIFIER
 #define mmRCC_IOV_FUNC_IDENTIFIER                                                                      0x0de5 // duplicate 
 #define mmRCC_IOV_FUNC_IDENTIFIER_BASE_IDX                                                             0
+#endif
 
 
 // addressBlock: syshub_mmreg_ind_syshubdec
diff --git a/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_0_offset.h b/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_0_offset.h
index 4354622..a7cd760 100644
--- a/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_0_offset.h
+++ b/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_0_offset.h
@@ -4251,8 +4251,10 @@
 #define mmRCC_CONFIG_MEMSIZE_BASE_IDX                                                                  2
 #define mmRCC_CONFIG_RESERVED                                                                          0x00c4
 #define mmRCC_CONFIG_RESERVED_BASE_IDX                                                                 2
+#ifndef mmRCC_IOV_FUNC_IDENTIFIER
 #define mmRCC_IOV_FUNC_IDENTIFIER                                                                      0x00c5
 #define mmRCC_IOV_FUNC_IDENTIFIER_BASE_IDX                                                             2
+#endif
 
 
 // addressBlock: nbio_nbif0_rcc_dev0_BIFDEC1
diff --git a/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_4_offset.h b/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_4_offset.h
index ce5830e..0c5a08b 100644
--- a/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_4_offset.h
+++ b/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_4_offset.h
@@ -2687,8 +2687,10 @@
 #define mmRCC_CONFIG_MEMSIZE_BASE_IDX                                                                  2
 #define mmRCC_CONFIG_RESERVED                                                                          0x00c4
 #define mmRCC_CONFIG_RESERVED_BASE_IDX                                                                 2
+#ifndef mmRCC_IOV_FUNC_IDENTIFIER
 #define mmRCC_IOV_FUNC_IDENTIFIER                                                                      0x00c5
 #define mmRCC_IOV_FUNC_IDENTIFIER_BASE_IDX                                                             2
+#endif
 
 
 // addressBlock: nbio_nbif0_rcc_dev0_BIFDEC1
-- 
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
