Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 424AF9EBE60
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Dec 2024 23:54:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B85410E9D8;
	Tue, 10 Dec 2024 22:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vAmm7DiS";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2085.outbound.protection.outlook.com [40.107.212.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 118B810E9CE
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Dec 2024 22:54:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SqcptVJGrYNp6Xw0FWmG5D01YgoFK/g0hgd4Zw/tHpQw7jvkvdloEWQSH5Jz78zN772Z22u+7mIZFzMPC03t5L5QuMgD+thzQn+1DptojYoCWYqn7c4cWWARQ3ksNRBDZCKjuuufDeV5Mi4hPWbk10FD1Et1xc2GyDWmMu0lY3gGy0LhE0rB3Y45oJWeCn32gNxvbICuHpnMp0VOoc/cPwKZstZLWUFeflgtJDeXOV3JR/AZ9eqnrjzLMojPh2iFbAXeYgiB8RQNHKdsuq0y3Fh5NAiL0mM2HJqTKMq4QLJCMszKxfHgbiu1BfDVWXMJxC+A1K/c0dv3yNkKMHEZoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bG+XMPSMbIbYdtHq504mrTMVOj+imVl70a/91gS1FEE=;
 b=CdgqqQUIdLN8RVCnJ9ZFZt5nD6DnrB51NMBN52qI7XySX4vI6XWkU+xm6z552FT6zhwVoMbt2T1ejcqpffRKAu2jWrZjkFZdGshT3IIGTsaZvWnqHkwPYSO49Uxvlq4ktP4KOeinwVgelBob1le7vc6LFLmGIGQl8aEmMaLdXFmpa8f+WZ+Q9rSpeXEegGgW/JE/jXCqRhfvY/+BgSh569spDnZub3+QqbpAl0/Fx7tQaiTtg5fNuVfeq0Ow5qslBU+hnoUu2Kp9m+TMh3MxalvOAe47gL+ZHyCPNjujSv5lG7fWMpOyPg3uKv29yOtV5kcHUFFPc+xIQL/UxyoDYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bG+XMPSMbIbYdtHq504mrTMVOj+imVl70a/91gS1FEE=;
 b=vAmm7DiS3C4GMsEnGt/Dgr6tqW3nMRyOpJHLJDnY2m8id1sxaiaAOPXqXZT1VCwtsFU5pXXCxgf71jGa0iNDfM+yq9xoGujIdiWVNoKAqjFLwn3ZbPplS+/++bMA5sK8YsXFMRQzApZy7UiD3hqz0fxrS0IJigjLz1d7AKIVgLU=
Received: from BN9PR03CA0225.namprd03.prod.outlook.com (2603:10b6:408:f8::20)
 by CY8PR12MB7218.namprd12.prod.outlook.com (2603:10b6:930:5a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Tue, 10 Dec
 2024 22:54:02 +0000
Received: from BN2PEPF000055DA.namprd21.prod.outlook.com
 (2603:10b6:408:f8:cafe::40) by BN9PR03CA0225.outlook.office365.com
 (2603:10b6:408:f8::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.18 via Frontend Transport; Tue,
 10 Dec 2024 22:54:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DA.mail.protection.outlook.com (10.167.245.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8272.0 via Frontend Transport; Tue, 10 Dec 2024 22:54:01 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Dec
 2024 16:53:58 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 11/48] drm/amdgpu/vcn: switch vcn helpers to be instance based
Date: Tue, 10 Dec 2024 17:53:00 -0500
Message-ID: <20241210225337.75394-12-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241210225337.75394-1-alexander.deucher@amd.com>
References: <20241210225337.75394-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DA:EE_|CY8PR12MB7218:EE_
X-MS-Office365-Filtering-Correlation-Id: e33d804a-bffc-418d-466b-08dd196d8a26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?m3f+Yzeeuc6aVWRKsZufdH0XZrphbYAP8F8zG5UK8o7gQ0R6tZuZnrA0YlM0?=
 =?us-ascii?Q?9ajGOas9p2r8vSFsHj7XRZmzKJcRBd/MtwhatiAf3O873YrlDee7W9GKrygG?=
 =?us-ascii?Q?jR1lklTNf6JXJQQW4AEADLWKsUAna8GrxIy1334063VuCvHGGGbbfofKxBHF?=
 =?us-ascii?Q?h+HDsfJtNaS0++5K/QFRrOR4MHoMcADfdbV3STQR2aQaOE9fRvkhNOzcQ2lK?=
 =?us-ascii?Q?31ERGTP9QHhIGL17XEnnw9rCyWaQww0fFtqOBjG8iN+sYbMGCxPyUUfQQwcP?=
 =?us-ascii?Q?hMnKir3aNMtIY8lk5fsL1S90r/DcK94bp0DZaiqMwMcDmzrk9RHwZKUZCGMO?=
 =?us-ascii?Q?gUwQQ5xxkfrmS0I1NLyBQ1UCi+Cd0S+2uh3ZiYis0BaIzfoD5sCPslvS5p9q?=
 =?us-ascii?Q?YDN6t6HCuikb81RuhPYL8i7/MGP0SttAetUZ7O5Ha3pch26UCbM1cMZYSrKW?=
 =?us-ascii?Q?8OytaAus2upoaeuNoBwryPFVbkiPcml7IWgwrOK9Tw43YZKx25zduUURuPnF?=
 =?us-ascii?Q?rTppAOrw2hHGI6sHbRYRFYUdl5mxu0jkzkNMrO0MeIjKMitCuL2gR/6ftABo?=
 =?us-ascii?Q?g+QdM8wQVdI2scBZaYmjJjLc2W8ypWmjzHDpxXvYhS5GA/ZRBOJ72t2LsGTT?=
 =?us-ascii?Q?QPlWIqrpTpbi9y+QGO9k1LQ4eFFXvIHVQ81TlJ7l5UU7yXWTX0P5v/wRMigK?=
 =?us-ascii?Q?P4VF2+yg2gX+Jt6UT2Tpil+K8hC4FwWQP/R0MgQf4cc9mwj+X/+z8FALSQQ7?=
 =?us-ascii?Q?GrEdRBuyTkhqx4+Vn6o/pbvqqSJCefCEUZNStm37vIwlyW5LA4mSJk+G9Z10?=
 =?us-ascii?Q?YoCCYyVYN/7RbGkMS3LEoTxHrKco0V9jbBxDAusIcA4rtMV7S2TJAyQE6+ix?=
 =?us-ascii?Q?t25VP8Q+9qNG0Fk2/EGhrSBZXF8Th5R2cdwBPC1gm3Pob18wIxJeEavEBBa8?=
 =?us-ascii?Q?U53kUgbG9/KXE7EBSZp+W89jcnvEUkgMLlpeCCJCjlWO5TviMCvUe+Mayt5P?=
 =?us-ascii?Q?lDk7JXqz6MCv4ZeLN5MTNRdHQXp+svjGaaInps/t+5LFyp4PB9/Af7p0afE+?=
 =?us-ascii?Q?dybkxHfx+282WQmZh88sqskr+h6QnGkFWp8b7LM9QEpsdY8oD+6DOJ2OFmQ6?=
 =?us-ascii?Q?Qh+zgl6fha6uFx42Y16RDlEzsxo5P3xE14xB+iqdTorexRxmAXwK5TXqMpL3?=
 =?us-ascii?Q?jMPcLtnuq7uLQnu7dWqjYoqWx6rfzW3ueDq9mnVefgL2e3yu+Klr1JX8b7UQ?=
 =?us-ascii?Q?qnjjRkVlfaC+c9S2OVgHQb+aUNCn8RG82OBJ0T7YX1/74BmK3FspGrs4n4gp?=
 =?us-ascii?Q?ZAoTPVcEl7dNoCZFLnvhWnFhg3GvvJnkOEUd1+OyYDEnRgjYTylJ7rqq8g9l?=
 =?us-ascii?Q?yrn0JYgliJtGpfsvC6XVYJzRnEc/ag9jMq4lcWBYuisNfMdDIA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 22:54:01.5747 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e33d804a-bffc-418d-466b-08dd196d8a26
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7218
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Pass the instance to the helpers.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 437 ++++++++++++------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h |  12 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c   |  16 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c   |  16 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c   |  71 ++--
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c   |  65 ++--
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c   |  69 ++--
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c |  70 ++--
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c |  63 ++--
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c |  67 ++--
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c |  64 ++--
 11 files changed, 541 insertions(+), 409 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
index c9c12654cc418..cfa46e2e0b8f8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
@@ -93,192 +93,186 @@ MODULE_FIRMWARE(FIRMWARE_VCN5_0_1);
 
 static void amdgpu_vcn_idle_work_handler(struct work_struct *work);
 
-int amdgpu_vcn_early_init(struct amdgpu_device *adev)
+int amdgpu_vcn_early_init(struct amdgpu_device *adev, int i)
 {
 	char ucode_prefix[25];
-	int r, i;
+	int r;
 
+	adev->vcn.inst[i].adev = adev;
+	adev->vcn.inst[i].inst = i;
 	amdgpu_ucode_ip_version_decode(adev, UVD_HWIP, ucode_prefix, sizeof(ucode_prefix));
-	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
-		adev->vcn.inst[i].adev = adev;
-		adev->vcn.inst[i].inst = i;
-
-		if (i == 1 && amdgpu_ip_version(adev, UVD_HWIP, 0) ==  IP_VERSION(4, 0, 6))
-			r = amdgpu_ucode_request(adev, &adev->vcn.inst[i].fw,
-						 AMDGPU_UCODE_REQUIRED,
-						 "amdgpu/%s_%d.bin", ucode_prefix, i);
-		else
-			r = amdgpu_ucode_request(adev, &adev->vcn.inst[i].fw,
-						 AMDGPU_UCODE_REQUIRED,
-						 "amdgpu/%s.bin", ucode_prefix);
-		if (r) {
-			amdgpu_ucode_release(&adev->vcn.inst[i].fw);
-			return r;
-		}
+
+	if (i == 1 && amdgpu_ip_version(adev, UVD_HWIP, 0) ==  IP_VERSION(4, 0, 6))
+		r = amdgpu_ucode_request(adev, &adev->vcn.inst[i].fw,
+					 AMDGPU_UCODE_REQUIRED,
+					 "amdgpu/%s_%d.bin", ucode_prefix, i);
+	else
+		r = amdgpu_ucode_request(adev, &adev->vcn.inst[i].fw,
+					 AMDGPU_UCODE_REQUIRED,
+					 "amdgpu/%s.bin", ucode_prefix);
+	if (r) {
+		amdgpu_ucode_release(&adev->vcn.inst[i].fw);
+		return r;
 	}
 	return r;
 }
 
-int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
+int amdgpu_vcn_sw_init(struct amdgpu_device *adev, int i)
 {
 	unsigned long bo_size;
 	const struct common_firmware_header *hdr;
 	unsigned char fw_check;
 	unsigned int fw_shared_size, log_offset;
-	int i, r;
+	int r;
 
-	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
-		mutex_init(&adev->vcn.inst[i].vcn1_jpeg1_workaround);
-		mutex_init(&adev->vcn.inst[i].vcn_pg_lock);
-		atomic_set(&adev->vcn.inst[i].total_submission_cnt, 0);
-		INIT_DELAYED_WORK(&adev->vcn.inst[i].idle_work, amdgpu_vcn_idle_work_handler);
-		atomic_set(&adev->vcn.inst[i].dpg_enc_submission_cnt, 0);
-		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
-		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
-			adev->vcn.inst[i].indirect_sram = true;
-
-		/*
-		 * Some Steam Deck's BIOS versions are incompatible with the
-		 * indirect SRAM mode, leading to amdgpu being unable to get
-		 * properly probed (and even potentially crashing the kernel).
-		 * Hence, check for these versions here - notice this is
-		 * restricted to Vangogh (Deck's APU).
-		 */
-		if (amdgpu_ip_version(adev, UVD_HWIP, 0) == IP_VERSION(3, 0, 2)) {
-			const char *bios_ver = dmi_get_system_info(DMI_BIOS_VERSION);
-
-			if (bios_ver && (!strncmp("F7A0113", bios_ver, 7) ||
-					 !strncmp("F7A0114", bios_ver, 7))) {
-				adev->vcn.inst[i].indirect_sram = false;
-				dev_info(adev->dev,
-					 "Steam Deck quirk: indirect SRAM disabled on BIOS %s\n", bios_ver);
-			}
+	mutex_init(&adev->vcn.inst[i].vcn1_jpeg1_workaround);
+	mutex_init(&adev->vcn.inst[i].vcn_pg_lock);
+	atomic_set(&adev->vcn.inst[i].total_submission_cnt, 0);
+	INIT_DELAYED_WORK(&adev->vcn.inst[i].idle_work, amdgpu_vcn_idle_work_handler);
+	atomic_set(&adev->vcn.inst[i].dpg_enc_submission_cnt, 0);
+	if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
+	    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
+		adev->vcn.inst[i].indirect_sram = true;
+
+	/*
+	 * Some Steam Deck's BIOS versions are incompatible with the
+	 * indirect SRAM mode, leading to amdgpu being unable to get
+	 * properly probed (and even potentially crashing the kernel).
+	 * Hence, check for these versions here - notice this is
+	 * restricted to Vangogh (Deck's APU).
+	 */
+	if (amdgpu_ip_version(adev, UVD_HWIP, 0) == IP_VERSION(3, 0, 2)) {
+		const char *bios_ver = dmi_get_system_info(DMI_BIOS_VERSION);
+
+		if (bios_ver && (!strncmp("F7A0113", bios_ver, 7) ||
+				 !strncmp("F7A0114", bios_ver, 7))) {
+			adev->vcn.inst[i].indirect_sram = false;
+			dev_info(adev->dev,
+				 "Steam Deck quirk: indirect SRAM disabled on BIOS %s\n", bios_ver);
 		}
+	}
 
-		/* from vcn4 and above, only unified queue is used */
-		adev->vcn.inst[i].using_unified_queue =
-			amdgpu_ip_version(adev, UVD_HWIP, 0) >= IP_VERSION(4, 0, 0);
+	/* from vcn4 and above, only unified queue is used */
+	adev->vcn.inst[i].using_unified_queue =
+		amdgpu_ip_version(adev, UVD_HWIP, 0) >= IP_VERSION(4, 0, 0);
+
+	hdr = (const struct common_firmware_header *)adev->vcn.inst[i].fw->data;
+	adev->vcn.inst[i].fw_version = le32_to_cpu(hdr->ucode_version);
+	adev->vcn.fw_version = le32_to_cpu(hdr->ucode_version);
+
+	/* Bit 20-23, it is encode major and non-zero for new naming convention.
+	 * This field is part of version minor and DRM_DISABLED_FLAG in old naming
+	 * convention. Since the l:wq!atest version minor is 0x5B and DRM_DISABLED_FLAG
+	 * is zero in old naming convention, this field is always zero so far.
+	 * These four bits are used to tell which naming convention is present.
+	 */
+	fw_check = (le32_to_cpu(hdr->ucode_version) >> 20) & 0xf;
+	if (fw_check) {
+		unsigned int dec_ver, enc_major, enc_minor, vep, fw_rev;
+
+		fw_rev = le32_to_cpu(hdr->ucode_version) & 0xfff;
+		enc_minor = (le32_to_cpu(hdr->ucode_version) >> 12) & 0xff;
+		enc_major = fw_check;
+		dec_ver = (le32_to_cpu(hdr->ucode_version) >> 24) & 0xf;
+		vep = (le32_to_cpu(hdr->ucode_version) >> 28) & 0xf;
+		DRM_INFO("Found VCN firmware Version ENC: %u.%u DEC: %u VEP: %u Revision: %u\n",
+			 enc_major, enc_minor, dec_ver, vep, fw_rev);
+	} else {
+		unsigned int version_major, version_minor, family_id;
 
-		hdr = (const struct common_firmware_header *)adev->vcn.inst[i].fw->data;
-		adev->vcn.inst[i].fw_version = le32_to_cpu(hdr->ucode_version);
-		adev->vcn.fw_version = le32_to_cpu(hdr->ucode_version);
-
-		/* Bit 20-23, it is encode major and non-zero for new naming convention.
-		 * This field is part of version minor and DRM_DISABLED_FLAG in old naming
-		 * convention. Since the l:wq!atest version minor is 0x5B and DRM_DISABLED_FLAG
-		 * is zero in old naming convention, this field is always zero so far.
-		 * These four bits are used to tell which naming convention is present.
-		 */
-		fw_check = (le32_to_cpu(hdr->ucode_version) >> 20) & 0xf;
-		if (fw_check) {
-			unsigned int dec_ver, enc_major, enc_minor, vep, fw_rev;
-
-			fw_rev = le32_to_cpu(hdr->ucode_version) & 0xfff;
-			enc_minor = (le32_to_cpu(hdr->ucode_version) >> 12) & 0xff;
-			enc_major = fw_check;
-			dec_ver = (le32_to_cpu(hdr->ucode_version) >> 24) & 0xf;
-			vep = (le32_to_cpu(hdr->ucode_version) >> 28) & 0xf;
-			DRM_INFO("Found VCN firmware Version ENC: %u.%u DEC: %u VEP: %u Revision: %u\n",
-				 enc_major, enc_minor, dec_ver, vep, fw_rev);
-		} else {
-			unsigned int version_major, version_minor, family_id;
+		family_id = le32_to_cpu(hdr->ucode_version) & 0xff;
+		version_major = (le32_to_cpu(hdr->ucode_version) >> 24) & 0xff;
+		version_minor = (le32_to_cpu(hdr->ucode_version) >> 8) & 0xff;
+		DRM_INFO("Found VCN firmware Version: %u.%u Family ID: %u\n",
+			 version_major, version_minor, family_id);
+	}
 
-			family_id = le32_to_cpu(hdr->ucode_version) & 0xff;
-			version_major = (le32_to_cpu(hdr->ucode_version) >> 24) & 0xff;
-			version_minor = (le32_to_cpu(hdr->ucode_version) >> 8) & 0xff;
-			DRM_INFO("Found VCN firmware Version: %u.%u Family ID: %u\n",
-				 version_major, version_minor, family_id);
-		}
+	bo_size = AMDGPU_VCN_STACK_SIZE + AMDGPU_VCN_CONTEXT_SIZE;
+	if (adev->firmware.load_type != AMDGPU_FW_LOAD_PSP)
+		bo_size += AMDGPU_GPU_PAGE_ALIGN(le32_to_cpu(hdr->ucode_size_bytes) + 8);
 
-		bo_size = AMDGPU_VCN_STACK_SIZE + AMDGPU_VCN_CONTEXT_SIZE;
-		if (adev->firmware.load_type != AMDGPU_FW_LOAD_PSP)
-			bo_size += AMDGPU_GPU_PAGE_ALIGN(le32_to_cpu(hdr->ucode_size_bytes) + 8);
+	if (amdgpu_ip_version(adev, UVD_HWIP, 0) >= IP_VERSION(5, 0, 0)) {
+		fw_shared_size = AMDGPU_GPU_PAGE_ALIGN(sizeof(struct amdgpu_vcn5_fw_shared));
+		log_offset = offsetof(struct amdgpu_vcn5_fw_shared, fw_log);
+	} else if (amdgpu_ip_version(adev, UVD_HWIP, 0) >= IP_VERSION(4, 0, 0)) {
+		fw_shared_size = AMDGPU_GPU_PAGE_ALIGN(sizeof(struct amdgpu_vcn4_fw_shared));
+		log_offset = offsetof(struct amdgpu_vcn4_fw_shared, fw_log);
+	} else {
+		fw_shared_size = AMDGPU_GPU_PAGE_ALIGN(sizeof(struct amdgpu_fw_shared));
+		log_offset = offsetof(struct amdgpu_fw_shared, fw_log);
+	}
 
-		if (amdgpu_ip_version(adev, UVD_HWIP, 0) >= IP_VERSION(5, 0, 0)) {
-			fw_shared_size = AMDGPU_GPU_PAGE_ALIGN(sizeof(struct amdgpu_vcn5_fw_shared));
-			log_offset = offsetof(struct amdgpu_vcn5_fw_shared, fw_log);
-		} else if (amdgpu_ip_version(adev, UVD_HWIP, 0) >= IP_VERSION(4, 0, 0)) {
-			fw_shared_size = AMDGPU_GPU_PAGE_ALIGN(sizeof(struct amdgpu_vcn4_fw_shared));
-			log_offset = offsetof(struct amdgpu_vcn4_fw_shared, fw_log);
-		} else {
-			fw_shared_size = AMDGPU_GPU_PAGE_ALIGN(sizeof(struct amdgpu_fw_shared));
-			log_offset = offsetof(struct amdgpu_fw_shared, fw_log);
-		}
+	bo_size += fw_shared_size;
+
+	if (amdgpu_vcnfw_log)
+		bo_size += AMDGPU_VCNFW_LOG_SIZE;
+
+	r = amdgpu_bo_create_kernel(adev, bo_size, PAGE_SIZE,
+				    AMDGPU_GEM_DOMAIN_VRAM |
+				    AMDGPU_GEM_DOMAIN_GTT,
+				    &adev->vcn.inst[i].vcpu_bo,
+				    &adev->vcn.inst[i].gpu_addr,
+				    &adev->vcn.inst[i].cpu_addr);
+	if (r) {
+		dev_err(adev->dev, "(%d) failed to allocate vcn bo\n", r);
+		return r;
+	}
 
-		bo_size += fw_shared_size;
+	adev->vcn.inst[i].fw_shared.cpu_addr = adev->vcn.inst[i].cpu_addr +
+		bo_size - fw_shared_size;
+	adev->vcn.inst[i].fw_shared.gpu_addr = adev->vcn.inst[i].gpu_addr +
+		bo_size - fw_shared_size;
 
-		if (amdgpu_vcnfw_log)
-			bo_size += AMDGPU_VCNFW_LOG_SIZE;
+	adev->vcn.inst[i].fw_shared.mem_size = fw_shared_size;
 
-		r = amdgpu_bo_create_kernel(adev, bo_size, PAGE_SIZE,
+	if (amdgpu_vcnfw_log) {
+		adev->vcn.inst[i].fw_shared.cpu_addr -= AMDGPU_VCNFW_LOG_SIZE;
+		adev->vcn.inst[i].fw_shared.gpu_addr -= AMDGPU_VCNFW_LOG_SIZE;
+		adev->vcn.inst[i].fw_shared.log_offset = log_offset;
+	}
+
+	if (adev->vcn.inst[i].indirect_sram) {
+		r = amdgpu_bo_create_kernel(adev, 64 * 2 * 4, PAGE_SIZE,
 					    AMDGPU_GEM_DOMAIN_VRAM |
 					    AMDGPU_GEM_DOMAIN_GTT,
-					    &adev->vcn.inst[i].vcpu_bo,
-					    &adev->vcn.inst[i].gpu_addr,
-					    &adev->vcn.inst[i].cpu_addr);
+					    &adev->vcn.inst[i].dpg_sram_bo,
+					    &adev->vcn.inst[i].dpg_sram_gpu_addr,
+					    &adev->vcn.inst[i].dpg_sram_cpu_addr);
 		if (r) {
-			dev_err(adev->dev, "(%d) failed to allocate vcn bo\n", r);
+			dev_err(adev->dev, "VCN %d (%d) failed to allocate DPG bo\n", i, r);
 			return r;
 		}
-
-		adev->vcn.inst[i].fw_shared.cpu_addr = adev->vcn.inst[i].cpu_addr +
-				bo_size - fw_shared_size;
-		adev->vcn.inst[i].fw_shared.gpu_addr = adev->vcn.inst[i].gpu_addr +
-				bo_size - fw_shared_size;
-
-		adev->vcn.inst[i].fw_shared.mem_size = fw_shared_size;
-
-		if (amdgpu_vcnfw_log) {
-			adev->vcn.inst[i].fw_shared.cpu_addr -= AMDGPU_VCNFW_LOG_SIZE;
-			adev->vcn.inst[i].fw_shared.gpu_addr -= AMDGPU_VCNFW_LOG_SIZE;
-			adev->vcn.inst[i].fw_shared.log_offset = log_offset;
-		}
-
-		if (adev->vcn.inst[i].indirect_sram) {
-			r = amdgpu_bo_create_kernel(adev, 64 * 2 * 4, PAGE_SIZE,
-					AMDGPU_GEM_DOMAIN_VRAM |
-					AMDGPU_GEM_DOMAIN_GTT,
-					&adev->vcn.inst[i].dpg_sram_bo,
-					&adev->vcn.inst[i].dpg_sram_gpu_addr,
-					&adev->vcn.inst[i].dpg_sram_cpu_addr);
-			if (r) {
-				dev_err(adev->dev, "VCN %d (%d) failed to allocate DPG bo\n", i, r);
-				return r;
-			}
-		}
 	}
 
 	return 0;
 }
 
-int amdgpu_vcn_sw_fini(struct amdgpu_device *adev)
+int amdgpu_vcn_sw_fini(struct amdgpu_device *adev, int i)
 {
-	int i, j;
+	int j;
 
-	for (j = 0; j < adev->vcn.num_vcn_inst; ++j) {
-		if (adev->vcn.harvest_config & (1 << j))
-			continue;
+	if (adev->vcn.harvest_config & (1 << i))
+		return 0;
 
-		amdgpu_bo_free_kernel(
-			&adev->vcn.inst[j].dpg_sram_bo,
-			&adev->vcn.inst[j].dpg_sram_gpu_addr,
-			(void **)&adev->vcn.inst[j].dpg_sram_cpu_addr);
+	amdgpu_bo_free_kernel(
+		&adev->vcn.inst[i].dpg_sram_bo,
+		&adev->vcn.inst[i].dpg_sram_gpu_addr,
+		(void **)&adev->vcn.inst[i].dpg_sram_cpu_addr);
 
-		kvfree(adev->vcn.inst[j].saved_bo);
+	kvfree(adev->vcn.inst[i].saved_bo);
 
-		amdgpu_bo_free_kernel(&adev->vcn.inst[j].vcpu_bo,
-					  &adev->vcn.inst[j].gpu_addr,
-					  (void **)&adev->vcn.inst[j].cpu_addr);
+	amdgpu_bo_free_kernel(&adev->vcn.inst[i].vcpu_bo,
+			      &adev->vcn.inst[i].gpu_addr,
+			      (void **)&adev->vcn.inst[i].cpu_addr);
 
-		amdgpu_ring_fini(&adev->vcn.inst[j].ring_dec);
+	amdgpu_ring_fini(&adev->vcn.inst[i].ring_dec);
 
-		for (i = 0; i < adev->vcn.inst[j].num_enc_rings; ++i)
-			amdgpu_ring_fini(&adev->vcn.inst[j].ring_enc[i]);
+	for (j = 0; j < adev->vcn.inst[i].num_enc_rings; ++j)
+		amdgpu_ring_fini(&adev->vcn.inst[i].ring_enc[j]);
 
-		amdgpu_ucode_release(&adev->vcn.inst[j].fw);
-		mutex_destroy(&adev->vcn.inst[j].vcn_pg_lock);
-		mutex_destroy(&adev->vcn.inst[j].vcn1_jpeg1_workaround);
-	}
+	amdgpu_ucode_release(&adev->vcn.inst[i].fw);
+	mutex_destroy(&adev->vcn.inst[i].vcn_pg_lock);
+	mutex_destroy(&adev->vcn.inst[i].vcn1_jpeg1_workaround);
 
 	return 0;
 }
@@ -298,91 +292,102 @@ bool amdgpu_vcn_is_disabled_vcn(struct amdgpu_device *adev, enum vcn_ring_type t
 	return ret;
 }
 
-int amdgpu_vcn_save_vcpu_bo(struct amdgpu_device *adev)
+static int amdgpu_vcn_save_vcpu_bo_inst(struct amdgpu_device *adev, int i)
 {
 	unsigned int size;
 	void *ptr;
-	int i, idx;
+	int idx;
 
-	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
-		if (adev->vcn.harvest_config & (1 << i))
-			continue;
-		if (adev->vcn.inst[i].vcpu_bo == NULL)
-			return 0;
+	if (adev->vcn.harvest_config & (1 << i))
+		return 0;
+	if (adev->vcn.inst[i].vcpu_bo == NULL)
+		return 0;
 
-		size = amdgpu_bo_size(adev->vcn.inst[i].vcpu_bo);
-		ptr = adev->vcn.inst[i].cpu_addr;
+	size = amdgpu_bo_size(adev->vcn.inst[i].vcpu_bo);
+	ptr = adev->vcn.inst[i].cpu_addr;
 
-		adev->vcn.inst[i].saved_bo = kvmalloc(size, GFP_KERNEL);
-		if (!adev->vcn.inst[i].saved_bo)
-			return -ENOMEM;
+	adev->vcn.inst[i].saved_bo = kvmalloc(size, GFP_KERNEL);
+	if (!adev->vcn.inst[i].saved_bo)
+		return -ENOMEM;
 
-		if (drm_dev_enter(adev_to_drm(adev), &idx)) {
-			memcpy_fromio(adev->vcn.inst[i].saved_bo, ptr, size);
-			drm_dev_exit(idx);
-		}
+	if (drm_dev_enter(adev_to_drm(adev), &idx)) {
+		memcpy_fromio(adev->vcn.inst[i].saved_bo, ptr, size);
+		drm_dev_exit(idx);
+	}
+
+	return 0;
+}
+
+int amdgpu_vcn_save_vcpu_bo(struct amdgpu_device *adev)
+{
+	int ret, i;
+
+	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
+		ret = amdgpu_vcn_save_vcpu_bo_inst(adev, i);
+		if (ret)
+			return ret;
 	}
 
 	return 0;
 }
 
-int amdgpu_vcn_suspend(struct amdgpu_device *adev)
+int amdgpu_vcn_suspend(struct amdgpu_device *adev, int i)
 {
 	bool in_ras_intr = amdgpu_ras_intr_triggered();
-	int i;
 
-	for (i = 0; i < adev->vcn.num_vcn_inst; ++i)
-		cancel_delayed_work_sync(&adev->vcn.inst[i].idle_work);
+	if (adev->vcn.harvest_config & (1 << i))
+		return 0;
+
+	cancel_delayed_work_sync(&adev->vcn.inst[i].idle_work);
 
 	/* err_event_athub will corrupt VCPU buffer, so we need to
 	 * restore fw data and clear buffer in amdgpu_vcn_resume() */
 	if (in_ras_intr)
 		return 0;
 
-	return amdgpu_vcn_save_vcpu_bo(adev);
+	return amdgpu_vcn_save_vcpu_bo_inst(adev, i);
 }
 
-int amdgpu_vcn_resume(struct amdgpu_device *adev)
+int amdgpu_vcn_resume(struct amdgpu_device *adev, int i)
 {
 	unsigned int size;
 	void *ptr;
-	int i, idx;
+	int idx;
 
-	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
-		if (adev->vcn.harvest_config & (1 << i))
-			continue;
-		if (adev->vcn.inst[i].vcpu_bo == NULL)
-			return -EINVAL;
+	if (adev->vcn.harvest_config & (1 << i))
+		return 0;
+	if (adev->vcn.inst[i].vcpu_bo == NULL)
+		return -EINVAL;
+
+	size = amdgpu_bo_size(adev->vcn.inst[i].vcpu_bo);
+	ptr = adev->vcn.inst[i].cpu_addr;
 
-		size = amdgpu_bo_size(adev->vcn.inst[i].vcpu_bo);
-		ptr = adev->vcn.inst[i].cpu_addr;
+	if (adev->vcn.inst[i].saved_bo != NULL) {
+		if (drm_dev_enter(adev_to_drm(adev), &idx)) {
+			memcpy_toio(ptr, adev->vcn.inst[i].saved_bo, size);
+			drm_dev_exit(idx);
+		}
+		kvfree(adev->vcn.inst[i].saved_bo);
+		adev->vcn.inst[i].saved_bo = NULL;
+	} else {
+		const struct common_firmware_header *hdr;
+		unsigned int offset;
 
-		if (adev->vcn.inst[i].saved_bo != NULL) {
+		hdr = (const struct common_firmware_header *)adev->vcn.inst[i].fw->data;
+		if (adev->firmware.load_type != AMDGPU_FW_LOAD_PSP) {
+			offset = le32_to_cpu(hdr->ucode_array_offset_bytes);
 			if (drm_dev_enter(adev_to_drm(adev), &idx)) {
-				memcpy_toio(ptr, adev->vcn.inst[i].saved_bo, size);
+				memcpy_toio(adev->vcn.inst[i].cpu_addr,
+					    adev->vcn.inst[i].fw->data + offset,
+					    le32_to_cpu(hdr->ucode_size_bytes));
 				drm_dev_exit(idx);
 			}
-			kvfree(adev->vcn.inst[i].saved_bo);
-			adev->vcn.inst[i].saved_bo = NULL;
-		} else {
-			const struct common_firmware_header *hdr;
-			unsigned int offset;
-
-			hdr = (const struct common_firmware_header *)adev->vcn.inst[i].fw->data;
-			if (adev->firmware.load_type != AMDGPU_FW_LOAD_PSP) {
-				offset = le32_to_cpu(hdr->ucode_array_offset_bytes);
-				if (drm_dev_enter(adev_to_drm(adev), &idx)) {
-					memcpy_toio(adev->vcn.inst[i].cpu_addr,
-						    adev->vcn.inst[i].fw->data + offset,
-						    le32_to_cpu(hdr->ucode_size_bytes));
-					drm_dev_exit(idx);
-				}
-				size -= le32_to_cpu(hdr->ucode_size_bytes);
-				ptr += le32_to_cpu(hdr->ucode_size_bytes);
-			}
-			memset_io(ptr, 0, size);
+			size -= le32_to_cpu(hdr->ucode_size_bytes);
+			ptr += le32_to_cpu(hdr->ucode_size_bytes);
 		}
+		memset_io(ptr, 0, size);
 	}
+
 	return 0;
 }
 
@@ -1058,36 +1063,32 @@ enum amdgpu_ring_priority_level amdgpu_vcn_get_enc_ring_prio(int ring)
 	}
 }
 
-void amdgpu_vcn_setup_ucode(struct amdgpu_device *adev)
+void amdgpu_vcn_setup_ucode(struct amdgpu_device *adev, int i)
 {
-	int i;
 	unsigned int idx;
 
 	if (adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) {
 		const struct common_firmware_header *hdr;
 
-		for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
-			if (adev->vcn.harvest_config & (1 << i))
-				continue;
+		if (adev->vcn.harvest_config & (1 << i))
+			return;
 
-			hdr = (const struct common_firmware_header *)adev->vcn.inst[i].fw->data;
-			/* currently only support 2 FW instances */
-			if (i >= 2) {
-				dev_info(adev->dev, "More then 2 VCN FW instances!\n");
-				break;
-			}
-			idx = AMDGPU_UCODE_ID_VCN + i;
-			adev->firmware.ucode[idx].ucode_id = idx;
-			adev->firmware.ucode[idx].fw = adev->vcn.inst[i].fw;
-			adev->firmware.fw_size +=
-				ALIGN(le32_to_cpu(hdr->ucode_size_bytes), PAGE_SIZE);
-
-			if (amdgpu_ip_version(adev, UVD_HWIP, 0) ==
-			    IP_VERSION(4, 0, 3) ||
-			    amdgpu_ip_version(adev, UVD_HWIP, 0) ==
-			    IP_VERSION(5, 0, 1))
-				break;
+		if ((amdgpu_ip_version(adev, UVD_HWIP, 0) == IP_VERSION(4, 0, 3) ||
+		     amdgpu_ip_version(adev, UVD_HWIP, 0) == IP_VERSION(5, 0, 1))
+		    && (i > 0))
+			return;
+
+		hdr = (const struct common_firmware_header *)adev->vcn.inst[i].fw->data;
+		/* currently only support 2 FW instances */
+		if (i >= 2) {
+			dev_info(adev->dev, "More then 2 VCN FW instances!\n");
+			return;
 		}
+		idx = AMDGPU_UCODE_ID_VCN + i;
+		adev->firmware.ucode[idx].ucode_id = idx;
+		adev->firmware.ucode[idx].fw = adev->vcn.inst[i].fw;
+		adev->firmware.fw_size +=
+			ALIGN(le32_to_cpu(hdr->ucode_size_bytes), PAGE_SIZE);
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
index a5256769f8ccd..a54031aae013a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
@@ -496,11 +496,11 @@ enum vcn_ring_type {
 	VCN_UNIFIED_RING,
 };
 
-int amdgpu_vcn_early_init(struct amdgpu_device *adev);
-int amdgpu_vcn_sw_init(struct amdgpu_device *adev);
-int amdgpu_vcn_sw_fini(struct amdgpu_device *adev);
-int amdgpu_vcn_suspend(struct amdgpu_device *adev);
-int amdgpu_vcn_resume(struct amdgpu_device *adev);
+int amdgpu_vcn_early_init(struct amdgpu_device *adev, int i);
+int amdgpu_vcn_sw_init(struct amdgpu_device *adev, int i);
+int amdgpu_vcn_sw_fini(struct amdgpu_device *adev, int i);
+int amdgpu_vcn_suspend(struct amdgpu_device *adev, int i);
+int amdgpu_vcn_resume(struct amdgpu_device *adev, int i);
 void amdgpu_vcn_ring_begin_use(struct amdgpu_ring *ring);
 void amdgpu_vcn_ring_end_use(struct amdgpu_ring *ring);
 
@@ -518,7 +518,7 @@ int amdgpu_vcn_enc_ring_test_ib(struct amdgpu_ring *ring, long timeout);
 
 enum amdgpu_ring_priority_level amdgpu_vcn_get_enc_ring_prio(int ring);
 
-void amdgpu_vcn_setup_ucode(struct amdgpu_device *adev);
+void amdgpu_vcn_setup_ucode(struct amdgpu_device *adev, int i);
 
 void amdgpu_vcn_fwlog_init(struct amdgpu_vcn_inst *vcn);
 void amdgpu_debugfs_vcn_fwlog_init(struct amdgpu_device *adev,
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
index 1bc027b2f6d5a..346f465624443 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
@@ -113,7 +113,7 @@ static int vcn_v1_0_early_init(struct amdgpu_ip_block *ip_block)
 
 	jpeg_v1_0_early_init(ip_block);
 
-	return amdgpu_vcn_early_init(adev);
+	return amdgpu_vcn_early_init(adev, 0);
 }
 
 /**
@@ -145,16 +145,16 @@ static int vcn_v1_0_sw_init(struct amdgpu_ip_block *ip_block)
 			return r;
 	}
 
-	r = amdgpu_vcn_sw_init(adev);
+	r = amdgpu_vcn_sw_init(adev, 0);
 	if (r)
 		return r;
 
 	/* Override the work func */
 	adev->vcn.inst->idle_work.work.func = vcn_v1_0_idle_work_handler;
 
-	amdgpu_vcn_setup_ucode(adev);
+	amdgpu_vcn_setup_ucode(adev, 0);
 
-	r = amdgpu_vcn_resume(adev);
+	r = amdgpu_vcn_resume(adev, 0);
 	if (r)
 		return r;
 
@@ -223,13 +223,13 @@ static int vcn_v1_0_sw_fini(struct amdgpu_ip_block *ip_block)
 	int r;
 	struct amdgpu_device *adev = ip_block->adev;
 
-	r = amdgpu_vcn_suspend(adev);
+	r = amdgpu_vcn_suspend(adev, 0);
 	if (r)
 		return r;
 
 	jpeg_v1_0_sw_fini(ip_block);
 
-	r = amdgpu_vcn_sw_fini(adev);
+	r = amdgpu_vcn_sw_fini(adev, 0);
 
 	kfree(adev->vcn.ip_dump);
 
@@ -311,7 +311,7 @@ static int vcn_v1_0_suspend(struct amdgpu_ip_block *ip_block)
 	if (r)
 		return r;
 
-	r = amdgpu_vcn_suspend(adev);
+	r = amdgpu_vcn_suspend(adev, 0);
 
 	return r;
 }
@@ -327,7 +327,7 @@ static int vcn_v1_0_resume(struct amdgpu_ip_block *ip_block)
 {
 	int r;
 
-	r = amdgpu_vcn_resume(ip_block->adev);
+	r = amdgpu_vcn_resume(ip_block->adev, 0);
 	if (r)
 		return r;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
index 9f408f466851c..3902e0d239d8d 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
@@ -118,7 +118,7 @@ static int vcn_v2_0_early_init(struct amdgpu_ip_block *ip_block)
 	vcn_v2_0_set_enc_ring_funcs(adev);
 	vcn_v2_0_set_irq_funcs(adev);
 
-	return amdgpu_vcn_early_init(adev);
+	return amdgpu_vcn_early_init(adev, 0);
 }
 
 /**
@@ -153,13 +153,13 @@ static int vcn_v2_0_sw_init(struct amdgpu_ip_block *ip_block)
 			return r;
 	}
 
-	r = amdgpu_vcn_sw_init(adev);
+	r = amdgpu_vcn_sw_init(adev, 0);
 	if (r)
 		return r;
 
-	amdgpu_vcn_setup_ucode(adev);
+	amdgpu_vcn_setup_ucode(adev, 0);
 
-	r = amdgpu_vcn_resume(adev);
+	r = amdgpu_vcn_resume(adev, 0);
 	if (r)
 		return r;
 
@@ -254,11 +254,11 @@ static int vcn_v2_0_sw_fini(struct amdgpu_ip_block *ip_block)
 
 	amdgpu_virt_free_mm_table(adev);
 
-	r = amdgpu_vcn_suspend(adev);
+	r = amdgpu_vcn_suspend(adev, 0);
 	if (r)
 		return r;
 
-	r = amdgpu_vcn_sw_fini(adev);
+	r = amdgpu_vcn_sw_fini(adev, 0);
 
 	kfree(adev->vcn.ip_dump);
 
@@ -338,7 +338,7 @@ static int vcn_v2_0_suspend(struct amdgpu_ip_block *ip_block)
 	if (r)
 		return r;
 
-	r = amdgpu_vcn_suspend(ip_block->adev);
+	r = amdgpu_vcn_suspend(ip_block->adev, 0);
 
 	return r;
 }
@@ -354,7 +354,7 @@ static int vcn_v2_0_resume(struct amdgpu_ip_block *ip_block)
 {
 	int r;
 
-	r = amdgpu_vcn_resume(ip_block->adev);
+	r = amdgpu_vcn_resume(ip_block->adev, 0);
 	if (r)
 		return r;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
index a3bac39e4c9db..4f9f3de023ffd 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
@@ -121,7 +121,7 @@ static int amdgpu_ih_clientid_vcns[] = {
 static int vcn_v2_5_early_init(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
-	int i;
+	int i, r;
 
 	if (amdgpu_sriov_vf(adev)) {
 		adev->vcn.num_vcn_inst = 2;
@@ -139,7 +139,7 @@ static int vcn_v2_5_early_init(struct amdgpu_ip_block *ip_block)
 			adev->vcn.inst[i].num_enc_rings = 2;
 		}
 		if (adev->vcn.harvest_config == (AMDGPU_VCN_HARVEST_VCN0 |
-					AMDGPU_VCN_HARVEST_VCN1))
+						 AMDGPU_VCN_HARVEST_VCN1))
 			/* both instances are harvested, disable the block */
 			return -ENOENT;
 	}
@@ -149,7 +149,13 @@ static int vcn_v2_5_early_init(struct amdgpu_ip_block *ip_block)
 	vcn_v2_5_set_irq_funcs(adev);
 	vcn_v2_5_set_ras_funcs(adev);
 
-	return amdgpu_vcn_early_init(adev);
+	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
+		r = amdgpu_vcn_early_init(adev, i);
+		if (r)
+			return r;
+	}
+
+	return 0;
 }
 
 /**
@@ -168,6 +174,8 @@ static int vcn_v2_5_sw_init(struct amdgpu_ip_block *ip_block)
 	struct amdgpu_device *adev = ip_block->adev;
 
 	for (j = 0; j < adev->vcn.num_vcn_inst; j++) {
+		volatile struct amdgpu_fw_shared *fw_shared;
+
 		if (adev->vcn.harvest_config & (1 << j))
 			continue;
 		/* VCN DEC TRAP */
@@ -189,23 +197,17 @@ static int vcn_v2_5_sw_init(struct amdgpu_ip_block *ip_block)
 			VCN_2_6__SRCID_UVD_POISON, &adev->vcn.inst[j].ras_poison_irq);
 		if (r)
 			return r;
-	}
-
-	r = amdgpu_vcn_sw_init(adev);
-	if (r)
-		return r;
 
-	amdgpu_vcn_setup_ucode(adev);
+		r = amdgpu_vcn_sw_init(adev, j);
+		if (r)
+			return r;
 
-	r = amdgpu_vcn_resume(adev);
-	if (r)
-		return r;
+		amdgpu_vcn_setup_ucode(adev, j);
 
-	for (j = 0; j < adev->vcn.num_vcn_inst; j++) {
-		volatile struct amdgpu_fw_shared *fw_shared;
+		r = amdgpu_vcn_resume(adev, j);
+		if (r)
+			return r;
 
-		if (adev->vcn.harvest_config & (1 << j))
-			continue;
 		adev->vcn.inst[j].internal.context_id = mmUVD_CONTEXT_ID_INTERNAL_OFFSET;
 		adev->vcn.inst[j].internal.ib_vmid = mmUVD_LMI_RBC_IB_VMID_INTERNAL_OFFSET;
 		adev->vcn.inst[j].internal.ib_bar_low = mmUVD_LMI_RBC_IB_64BIT_BAR_LOW_INTERNAL_OFFSET;
@@ -323,15 +325,18 @@ static int vcn_v2_5_sw_fini(struct amdgpu_ip_block *ip_block)
 	if (amdgpu_sriov_vf(adev))
 		amdgpu_virt_free_mm_table(adev);
 
-	r = amdgpu_vcn_suspend(adev);
-	if (r)
-		return r;
-
-	r = amdgpu_vcn_sw_fini(adev);
+	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
+		r = amdgpu_vcn_suspend(adev, i);
+		if (r)
+			return r;
+		r = amdgpu_vcn_sw_fini(adev, i);
+		if (r)
+			return r;
+	}
 
 	kfree(adev->vcn.ip_dump);
 
-	return r;
+	return 0;
 }
 
 /**
@@ -421,15 +426,20 @@ static int vcn_v2_5_hw_fini(struct amdgpu_ip_block *ip_block)
  */
 static int vcn_v2_5_suspend(struct amdgpu_ip_block *ip_block)
 {
-	int r;
+	struct amdgpu_device *adev = ip_block->adev;
+	int r, i;
 
 	r = vcn_v2_5_hw_fini(ip_block);
 	if (r)
 		return r;
 
-	r = amdgpu_vcn_suspend(ip_block->adev);
+	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
+		r = amdgpu_vcn_suspend(ip_block->adev, i);
+		if (r)
+			return r;
+	}
 
-	return r;
+	return 0;
 }
 
 /**
@@ -441,11 +451,14 @@ static int vcn_v2_5_suspend(struct amdgpu_ip_block *ip_block)
  */
 static int vcn_v2_5_resume(struct amdgpu_ip_block *ip_block)
 {
-	int r;
+	struct amdgpu_device *adev = ip_block->adev;
+	int r, i;
 
-	r = amdgpu_vcn_resume(ip_block->adev);
-	if (r)
-		return r;
+	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
+		r = amdgpu_vcn_resume(ip_block->adev, i);
+		if (r)
+			return r;
+	}
 
 	r = vcn_v2_5_hw_init(ip_block);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
index fabe4d75a7f6b..724f36467b068 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
@@ -127,7 +127,7 @@ static void vcn_v3_0_enc_ring_set_wptr(struct amdgpu_ring *ring);
 static int vcn_v3_0_early_init(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
-	int i;
+	int i, r;
 
 	if (amdgpu_sriov_vf(adev)) {
 		adev->vcn.num_vcn_inst = VCN_INSTANCES_SIENNA_CICHLID;
@@ -154,7 +154,12 @@ static int vcn_v3_0_early_init(struct amdgpu_ip_block *ip_block)
 	vcn_v3_0_set_enc_ring_funcs(adev);
 	vcn_v3_0_set_irq_funcs(adev);
 
-	return amdgpu_vcn_early_init(adev);
+	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
+		r = amdgpu_vcn_early_init(adev, i);
+		if (r)
+			return r;
+	}
+	return 0;
 }
 
 /**
@@ -173,16 +178,6 @@ static int vcn_v3_0_sw_init(struct amdgpu_ip_block *ip_block)
 	uint32_t *ptr;
 	struct amdgpu_device *adev = ip_block->adev;
 
-	r = amdgpu_vcn_sw_init(adev);
-	if (r)
-		return r;
-
-	amdgpu_vcn_setup_ucode(adev);
-
-	r = amdgpu_vcn_resume(adev);
-	if (r)
-		return r;
-
 	/*
 	 * Note: doorbell assignment is fixed for SRIOV multiple VCN engines
 	 * Formula:
@@ -202,6 +197,16 @@ static int vcn_v3_0_sw_init(struct amdgpu_ip_block *ip_block)
 		if (adev->vcn.harvest_config & (1 << i))
 			continue;
 
+		r = amdgpu_vcn_sw_init(adev, i);
+		if (r)
+			return r;
+
+		amdgpu_vcn_setup_ucode(adev, i);
+
+		r = amdgpu_vcn_resume(adev, i);
+		if (r)
+			return r;
+
 		adev->vcn.inst[i].internal.context_id = mmUVD_CONTEXT_ID_INTERNAL_OFFSET;
 		adev->vcn.inst[i].internal.ib_vmid = mmUVD_LMI_RBC_IB_VMID_INTERNAL_OFFSET;
 		adev->vcn.inst[i].internal.ib_bar_low = mmUVD_LMI_RBC_IB_64BIT_BAR_LOW_INTERNAL_OFFSET;
@@ -333,14 +338,18 @@ static int vcn_v3_0_sw_fini(struct amdgpu_ip_block *ip_block)
 	if (amdgpu_sriov_vf(adev))
 		amdgpu_virt_free_mm_table(adev);
 
-	r = amdgpu_vcn_suspend(adev);
-	if (r)
-		return r;
+	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
+		r = amdgpu_vcn_suspend(adev, i);
+		if (r)
+			return r;
 
-	r = amdgpu_vcn_sw_fini(adev);
+		r = amdgpu_vcn_sw_fini(adev, i);
+		if (r)
+			return r;
+	}
 
 	kfree(adev->vcn.ip_dump);
-	return r;
+	return 0;
 }
 
 /**
@@ -459,15 +468,20 @@ static int vcn_v3_0_hw_fini(struct amdgpu_ip_block *ip_block)
  */
 static int vcn_v3_0_suspend(struct amdgpu_ip_block *ip_block)
 {
-	int r;
+	struct amdgpu_device *adev = ip_block->adev;
+	int r, i;
 
 	r = vcn_v3_0_hw_fini(ip_block);
 	if (r)
 		return r;
 
-	r = amdgpu_vcn_suspend(ip_block->adev);
+	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
+		r = amdgpu_vcn_suspend(ip_block->adev, i);
+		if (r)
+			return r;
+	}
 
-	return r;
+	return 0;
 }
 
 /**
@@ -479,11 +493,14 @@ static int vcn_v3_0_suspend(struct amdgpu_ip_block *ip_block)
  */
 static int vcn_v3_0_resume(struct amdgpu_ip_block *ip_block)
 {
-	int r;
+	struct amdgpu_device *adev = ip_block->adev;
+	int r, i;
 
-	r = amdgpu_vcn_resume(ip_block->adev);
-	if (r)
-		return r;
+	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
+		r = amdgpu_vcn_resume(ip_block->adev, i);
+		if (r)
+			return r;
+	}
 
 	r = vcn_v3_0_hw_init(ip_block);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
index ee87594fafa60..1200815b3eee8 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
@@ -117,7 +117,7 @@ static void vcn_v4_0_set_ras_funcs(struct amdgpu_device *adev);
 static int vcn_v4_0_early_init(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
-	int i;
+	int i, r;
 
 	if (amdgpu_sriov_vf(adev)) {
 		adev->vcn.harvest_config = VCN_HARVEST_MMSCH;
@@ -137,7 +137,13 @@ static int vcn_v4_0_early_init(struct amdgpu_ip_block *ip_block)
 	vcn_v4_0_set_irq_funcs(adev);
 	vcn_v4_0_set_ras_funcs(adev);
 
-	return amdgpu_vcn_early_init(adev);
+	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
+		r = amdgpu_vcn_early_init(adev, i);
+		if (r)
+			return r;
+	}
+
+	return 0;
 }
 
 static int vcn_v4_0_fw_shared_init(struct amdgpu_device *adev, int inst_idx)
@@ -180,20 +186,20 @@ static int vcn_v4_0_sw_init(struct amdgpu_ip_block *ip_block)
 	uint32_t reg_count = ARRAY_SIZE(vcn_reg_list_4_0);
 	uint32_t *ptr;
 
-	r = amdgpu_vcn_sw_init(adev);
-	if (r)
-		return r;
-
-	amdgpu_vcn_setup_ucode(adev);
-
-	r = amdgpu_vcn_resume(adev);
-	if (r)
-		return r;
-
 	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
 		if (adev->vcn.harvest_config & (1 << i))
 			continue;
 
+		r = amdgpu_vcn_sw_init(adev, i);
+		if (r)
+			return r;
+
+		amdgpu_vcn_setup_ucode(adev, i);
+
+		r = amdgpu_vcn_resume(adev, i);
+		if (r)
+			return r;
+
 		/* Init instance 0 sched_score to 1, so it's scheduled after other instances */
 		if (i == 0)
 			atomic_set(&adev->vcn.inst[i].sched_score, 1);
@@ -294,16 +300,23 @@ static int vcn_v4_0_sw_fini(struct amdgpu_ip_block *ip_block)
 	if (amdgpu_sriov_vf(adev))
 		amdgpu_virt_free_mm_table(adev);
 
-	r = amdgpu_vcn_suspend(adev);
-	if (r)
-		return r;
+	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
+		r = amdgpu_vcn_suspend(adev, i);
+		if (r)
+			return r;
+	}
 
 	amdgpu_vcn_sysfs_reset_mask_fini(adev);
-	r = amdgpu_vcn_sw_fini(adev);
+
+	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
+		r = amdgpu_vcn_sw_fini(adev, i);
+		if (r)
+			return r;
+	}
 
 	kfree(adev->vcn.ip_dump);
 
-	return r;
+	return 0;
 }
 
 /**
@@ -394,15 +407,20 @@ static int vcn_v4_0_hw_fini(struct amdgpu_ip_block *ip_block)
  */
 static int vcn_v4_0_suspend(struct amdgpu_ip_block *ip_block)
 {
-	int r;
+	struct amdgpu_device *adev = ip_block->adev;
+	int r, i;
 
 	r = vcn_v4_0_hw_fini(ip_block);
 	if (r)
 		return r;
 
-	r = amdgpu_vcn_suspend(ip_block->adev);
+	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
+		r = amdgpu_vcn_suspend(ip_block->adev, i);
+		if (r)
+			return r;
+	}
 
-	return r;
+	return 0;
 }
 
 /**
@@ -414,11 +432,14 @@ static int vcn_v4_0_suspend(struct amdgpu_ip_block *ip_block)
  */
 static int vcn_v4_0_resume(struct amdgpu_ip_block *ip_block)
 {
-	int r;
+	struct amdgpu_device *adev = ip_block->adev;
+	int r, i;
 
-	r = amdgpu_vcn_resume(ip_block->adev);
-	if (r)
-		return r;
+	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
+		r = amdgpu_vcn_resume(ip_block->adev, i);
+		if (r)
+			return r;
+	}
 
 	r = vcn_v4_0_hw_init(ip_block);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
index 2d88f4c0537e0..3378dcd5ea545 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
@@ -115,7 +115,7 @@ static inline bool vcn_v4_0_3_normalizn_reqd(struct amdgpu_device *adev)
 static int vcn_v4_0_3_early_init(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
-	int i;
+	int i, r;
 
 	for (i = 0; i < adev->vcn.num_vcn_inst; ++i)
 		/* re-use enc ring as unified ring */
@@ -125,7 +125,13 @@ static int vcn_v4_0_3_early_init(struct amdgpu_ip_block *ip_block)
 	vcn_v4_0_3_set_irq_funcs(adev);
 	vcn_v4_0_3_set_ras_funcs(adev);
 
-	return amdgpu_vcn_early_init(adev);
+	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
+		r = amdgpu_vcn_early_init(adev, i);
+		if (r)
+			return r;
+	}
+
+	return 0;
 }
 
 static int vcn_v4_0_3_fw_shared_init(struct amdgpu_device *adev, int inst_idx)
@@ -157,16 +163,6 @@ static int vcn_v4_0_3_sw_init(struct amdgpu_ip_block *ip_block)
 	uint32_t reg_count = ARRAY_SIZE(vcn_reg_list_4_0_3);
 	uint32_t *ptr;
 
-	r = amdgpu_vcn_sw_init(adev);
-	if (r)
-		return r;
-
-	amdgpu_vcn_setup_ucode(adev);
-
-	r = amdgpu_vcn_resume(adev);
-	if (r)
-		return r;
-
 	/* VCN DEC TRAP */
 	r = amdgpu_irq_add_id(adev, SOC15_IH_CLIENTID_VCN,
 		VCN_4_0__SRCID__UVD_ENC_GENERAL_PURPOSE, &adev->vcn.inst->irq);
@@ -174,6 +170,17 @@ static int vcn_v4_0_3_sw_init(struct amdgpu_ip_block *ip_block)
 		return r;
 
 	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
+
+		r = amdgpu_vcn_sw_init(adev, i);
+		if (r)
+			return r;
+
+		amdgpu_vcn_setup_ucode(adev, i);
+
+		r = amdgpu_vcn_resume(adev, i);
+		if (r)
+			return r;
+
 		vcn_inst = GET_INST(VCN, i);
 
 		ring = &adev->vcn.inst[i].ring_enc[0];
@@ -262,16 +269,23 @@ static int vcn_v4_0_3_sw_fini(struct amdgpu_ip_block *ip_block)
 	if (amdgpu_sriov_vf(adev))
 		amdgpu_virt_free_mm_table(adev);
 
-	r = amdgpu_vcn_suspend(adev);
-	if (r)
-		return r;
+	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
+		r = amdgpu_vcn_suspend(adev, i);
+		if (r)
+			return r;
+	}
 
 	amdgpu_vcn_sysfs_reset_mask_fini(adev);
-	r = amdgpu_vcn_sw_fini(adev);
+
+	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
+		r = amdgpu_vcn_sw_fini(adev, i);
+		if (r)
+			return r;
+	}
 
 	kfree(adev->vcn.ip_dump);
 
-	return r;
+	return 0;
 }
 
 /**
@@ -371,15 +385,20 @@ static int vcn_v4_0_3_hw_fini(struct amdgpu_ip_block *ip_block)
  */
 static int vcn_v4_0_3_suspend(struct amdgpu_ip_block *ip_block)
 {
-	int r;
+	struct amdgpu_device *adev = ip_block->adev;
+	int r, i;
 
 	r = vcn_v4_0_3_hw_fini(ip_block);
 	if (r)
 		return r;
 
-	r = amdgpu_vcn_suspend(ip_block->adev);
+	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
+		r = amdgpu_vcn_suspend(adev, i);
+		if (r)
+			return r;
+	}
 
-	return r;
+	return 0;
 }
 
 /**
@@ -391,11 +410,14 @@ static int vcn_v4_0_3_suspend(struct amdgpu_ip_block *ip_block)
  */
 static int vcn_v4_0_3_resume(struct amdgpu_ip_block *ip_block)
 {
-	int r;
+	struct amdgpu_device *adev = ip_block->adev;
+	int r, i;
 
-	r = amdgpu_vcn_resume(ip_block->adev);
-	if (r)
-		return r;
+	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
+		r = amdgpu_vcn_resume(ip_block->adev, i);
+		if (r)
+			return r;
+	}
 
 	r = vcn_v4_0_3_hw_init(ip_block);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
index 0700a5f96084c..c3a2826a59631 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
@@ -115,7 +115,7 @@ static void vcn_v4_0_5_unified_ring_set_wptr(struct amdgpu_ring *ring);
 static int vcn_v4_0_5_early_init(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
-	int i;
+	int i, r;
 
 	for (i = 0; i < adev->vcn.num_vcn_inst; ++i)
 		/* re-use enc ring as unified ring */
@@ -123,7 +123,13 @@ static int vcn_v4_0_5_early_init(struct amdgpu_ip_block *ip_block)
 	vcn_v4_0_5_set_unified_ring_funcs(adev);
 	vcn_v4_0_5_set_irq_funcs(adev);
 
-	return amdgpu_vcn_early_init(adev);
+	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
+		r = amdgpu_vcn_early_init(adev, i);
+		if (r)
+			return r;
+	}
+
+	return 0;
 }
 
 /**
@@ -141,15 +147,6 @@ static int vcn_v4_0_5_sw_init(struct amdgpu_ip_block *ip_block)
 	uint32_t reg_count = ARRAY_SIZE(vcn_reg_list_4_0_5);
 	uint32_t *ptr;
 
-	r = amdgpu_vcn_sw_init(adev);
-	if (r)
-		return r;
-
-	amdgpu_vcn_setup_ucode(adev);
-
-	r = amdgpu_vcn_resume(adev);
-	if (r)
-		return r;
 
 	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
 		volatile struct amdgpu_vcn4_fw_shared *fw_shared;
@@ -157,6 +154,16 @@ static int vcn_v4_0_5_sw_init(struct amdgpu_ip_block *ip_block)
 		if (adev->vcn.harvest_config & (1 << i))
 			continue;
 
+		r = amdgpu_vcn_sw_init(adev, i);
+		if (r)
+			return r;
+
+		amdgpu_vcn_setup_ucode(adev, i);
+
+		r = amdgpu_vcn_resume(adev, i);
+		if (r)
+			return r;
+
 		atomic_set(&adev->vcn.inst[i].sched_score, 0);
 
 		/* VCN UNIFIED TRAP */
@@ -252,15 +259,19 @@ static int vcn_v4_0_5_sw_fini(struct amdgpu_ip_block *ip_block)
 	if (amdgpu_sriov_vf(adev))
 		amdgpu_virt_free_mm_table(adev);
 
-	r = amdgpu_vcn_suspend(adev);
-	if (r)
-		return r;
+	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
+		r = amdgpu_vcn_suspend(adev, i);
+		if (r)
+			return r;
 
-	r = amdgpu_vcn_sw_fini(adev);
+		r = amdgpu_vcn_sw_fini(adev, i);
+		if (r)
+			return r;
+	}
 
 	kfree(adev->vcn.ip_dump);
 
-	return r;
+	return 0;
 }
 
 /**
@@ -332,13 +343,18 @@ static int vcn_v4_0_5_hw_fini(struct amdgpu_ip_block *ip_block)
  */
 static int vcn_v4_0_5_suspend(struct amdgpu_ip_block *ip_block)
 {
-	int r;
+	struct amdgpu_device *adev = ip_block->adev;
+	int r, i;
 
 	r = vcn_v4_0_5_hw_fini(ip_block);
 	if (r)
 		return r;
 
-	r = amdgpu_vcn_suspend(ip_block->adev);
+	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
+		r = amdgpu_vcn_suspend(ip_block->adev, i);
+		if (r)
+			return r;
+	}
 
 	return r;
 }
@@ -352,11 +368,14 @@ static int vcn_v4_0_5_suspend(struct amdgpu_ip_block *ip_block)
  */
 static int vcn_v4_0_5_resume(struct amdgpu_ip_block *ip_block)
 {
-	int r;
+	struct amdgpu_device *adev = ip_block->adev;
+	int r, i;
 
-	r = amdgpu_vcn_resume(ip_block->adev);
-	if (r)
-		return r;
+	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
+		r = amdgpu_vcn_resume(ip_block->adev, i);
+		if (r)
+			return r;
+	}
 
 	r = vcn_v4_0_5_hw_init(ip_block);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
index eeb3c9875ad50..d3e4d02c12a06 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
@@ -98,7 +98,7 @@ static void vcn_v5_0_0_unified_ring_set_wptr(struct amdgpu_ring *ring);
 static int vcn_v5_0_0_early_init(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
-	int i;
+	int i, r;
 
 	for (i = 0; i < adev->vcn.num_vcn_inst; ++i)
 		/* re-use enc ring as unified ring */
@@ -107,7 +107,13 @@ static int vcn_v5_0_0_early_init(struct amdgpu_ip_block *ip_block)
 	vcn_v5_0_0_set_unified_ring_funcs(adev);
 	vcn_v5_0_0_set_irq_funcs(adev);
 
-	return amdgpu_vcn_early_init(adev);
+	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
+		r = amdgpu_vcn_early_init(adev, i);
+		if (r)
+			return r;
+	}
+
+	return 0;
 }
 
 void vcn_v5_0_0_alloc_ip_dump(struct amdgpu_device *adev)
@@ -138,22 +144,22 @@ static int vcn_v5_0_0_sw_init(struct amdgpu_ip_block *ip_block)
 	struct amdgpu_device *adev = ip_block->adev;
 	int i, r;
 
-	r = amdgpu_vcn_sw_init(adev);
-	if (r)
-		return r;
-
-	amdgpu_vcn_setup_ucode(adev);
-
-	r = amdgpu_vcn_resume(adev);
-	if (r)
-		return r;
-
 	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
 		volatile struct amdgpu_vcn5_fw_shared *fw_shared;
 
 		if (adev->vcn.harvest_config & (1 << i))
 			continue;
 
+		r = amdgpu_vcn_sw_init(adev, i);
+		if (r)
+			return r;
+
+		amdgpu_vcn_setup_ucode(adev, i);
+
+		r = amdgpu_vcn_resume(adev, i);
+		if (r)
+			return r;
+
 		atomic_set(&adev->vcn.inst[i].sched_score, 0);
 
 		/* VCN UNIFIED TRAP */
@@ -231,16 +237,23 @@ static int vcn_v5_0_0_sw_fini(struct amdgpu_ip_block *ip_block)
 		drm_dev_exit(idx);
 	}
 
-	r = amdgpu_vcn_suspend(adev);
-	if (r)
-		return r;
+	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
+		r = amdgpu_vcn_suspend(adev, i);
+		if (r)
+			return r;
+	}
 
 	amdgpu_vcn_sysfs_reset_mask_fini(adev);
-	r = amdgpu_vcn_sw_fini(adev);
+
+	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
+		r = amdgpu_vcn_sw_fini(adev, i);
+		if (r)
+			return r;
+	}
 
 	kfree(adev->vcn.ip_dump);
 
-	return r;
+	return 0;
 }
 
 /**
@@ -312,13 +325,18 @@ static int vcn_v5_0_0_hw_fini(struct amdgpu_ip_block *ip_block)
  */
 static int vcn_v5_0_0_suspend(struct amdgpu_ip_block *ip_block)
 {
-	int r;
+	struct amdgpu_device *adev = ip_block->adev;
+	int r, i;
 
 	r = vcn_v5_0_0_hw_fini(ip_block);
 	if (r)
 		return r;
 
-	r = amdgpu_vcn_suspend(ip_block->adev);
+	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
+		r = amdgpu_vcn_suspend(ip_block->adev, i);
+		if (r)
+			return r;
+	}
 
 	return r;
 }
@@ -332,11 +350,14 @@ static int vcn_v5_0_0_suspend(struct amdgpu_ip_block *ip_block)
  */
 static int vcn_v5_0_0_resume(struct amdgpu_ip_block *ip_block)
 {
-	int r;
+	struct amdgpu_device *adev = ip_block->adev;
+	int r, i;
 
-	r = amdgpu_vcn_resume(ip_block->adev);
-	if (r)
-		return r;
+	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
+		r = amdgpu_vcn_resume(ip_block->adev, i);
+		if (r)
+			return r;
+	}
 
 	r = vcn_v5_0_0_hw_init(ip_block);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c
index 79ed4855c85a9..74c304855c6d3 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c
@@ -58,7 +58,7 @@ static void vcn_v5_0_1_unified_ring_set_wptr(struct amdgpu_ring *ring);
 static int vcn_v5_0_1_early_init(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
-	int i;
+	int i, r;
 
 	for (i = 0; i < adev->vcn.num_vcn_inst; ++i)
 		/* re-use enc ring as unified ring */
@@ -67,7 +67,13 @@ static int vcn_v5_0_1_early_init(struct amdgpu_ip_block *ip_block)
 	vcn_v5_0_1_set_unified_ring_funcs(adev);
 	vcn_v5_0_1_set_irq_funcs(adev);
 
-	return amdgpu_vcn_early_init(adev);
+	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
+		r = amdgpu_vcn_early_init(adev, i);
+		if (r)
+			return r;
+	}
+
+	return 0;
 }
 
 /**
@@ -83,16 +89,6 @@ static int vcn_v5_0_1_sw_init(struct amdgpu_ip_block *ip_block)
 	struct amdgpu_ring *ring;
 	int i, r, vcn_inst;
 
-	r = amdgpu_vcn_sw_init(adev);
-	if (r)
-		return r;
-
-	amdgpu_vcn_setup_ucode(adev);
-
-	r = amdgpu_vcn_resume(adev);
-	if (r)
-		return r;
-
 	/* VCN UNIFIED TRAP */
 	r = amdgpu_irq_add_id(adev, SOC15_IH_CLIENTID_VCN,
 		VCN_5_0__SRCID__UVD_ENC_GENERAL_PURPOSE, &adev->vcn.inst->irq);
@@ -104,6 +100,16 @@ static int vcn_v5_0_1_sw_init(struct amdgpu_ip_block *ip_block)
 
 		vcn_inst = GET_INST(VCN, i);
 
+		r = amdgpu_vcn_sw_init(adev, i);
+		if (r)
+			return r;
+
+		amdgpu_vcn_setup_ucode(adev, i);
+
+		r = amdgpu_vcn_resume(adev, i);
+		if (r)
+			return r;
+
 		ring = &adev->vcn.inst[i].ring_enc[0];
 		ring->use_doorbell = true;
 		ring->doorbell_index = (adev->doorbell_index.vcn.vcn_ring0_1 << 1) + 9 * vcn_inst;
@@ -161,17 +167,23 @@ static int vcn_v5_0_1_sw_fini(struct amdgpu_ip_block *ip_block)
 		drm_dev_exit(idx);
 	}
 
-	r = amdgpu_vcn_suspend(adev);
-	if (r)
-		return r;
+	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
+		r = amdgpu_vcn_suspend(adev, i);
+		if (r)
+			return r;
+	}
 
-	r = amdgpu_vcn_sw_fini(adev);
+	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
+		r = amdgpu_vcn_sw_fini(adev, i);
+		if (r)
+			return r;
+	}
 
 	amdgpu_vcn_sysfs_reset_mask_fini(adev);
 
 	kfree(adev->vcn.ip_dump);
 
-	return r;
+	return 0;
 }
 
 /**
@@ -233,13 +245,17 @@ static int vcn_v5_0_1_hw_fini(struct amdgpu_ip_block *ip_block)
 static int vcn_v5_0_1_suspend(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
-	int r;
+	int r, i;
 
 	r = vcn_v5_0_1_hw_fini(ip_block);
 	if (r)
 		return r;
 
-	r = amdgpu_vcn_suspend(adev);
+	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
+		r = amdgpu_vcn_suspend(ip_block->adev, i);
+		if (r)
+			return r;
+	}
 
 	return r;
 }
@@ -254,11 +270,13 @@ static int vcn_v5_0_1_suspend(struct amdgpu_ip_block *ip_block)
 static int vcn_v5_0_1_resume(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
-	int r;
+	int r, i;
 
-	r = amdgpu_vcn_resume(adev);
-	if (r)
-		return r;
+	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
+		r = amdgpu_vcn_resume(ip_block->adev, i);
+		if (r)
+			return r;
+	}
 
 	r = vcn_v5_0_1_hw_init(ip_block);
 
-- 
2.47.1

