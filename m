Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9671356AD
	for <lists+amd-gfx@lfdr.de>; Thu,  9 Jan 2020 11:17:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC0C66E8EE;
	Thu,  9 Jan 2020 10:17:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::609])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F716E8EE
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 Jan 2020 10:17:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJrOcg6BWoyj4y4FrFjwgJT0M7qbtiXhuiSlI+JOvxS4Fm2srscW6A0gulQfia8tSk++zFEmThpUh2sxqoonNHnavM3eFSEiJk5LQRmiKKV/rIhlFvWsf01dixuA2ySve1zJnLmzQYK8v28JI5j2WOWmD7xasgz9zqtGzzu517BazHmBE8jqe065wx2XHWTng24dNayahKEV6NRS36JlkjM4z7Movdipn/CAOXynyuTk2V6zcoRoTBcPRiPRnJILp/g9rNPqlU1eGhYK+M5jQ5/11a3W7sqftJj99j/kElOyd0UyUzHQQq/xDZvMAR4iJuOqJPmBchu5aGKwlA/5bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rK8BjgN//ZGNnpqsFxBgjMWN4vvKHBMgLU9hfyEf110=;
 b=cUSxTBkF9WBM2n86sgffIZEL41Q1T2zoLh0tT7i4XScdjRdRU0m7PvpWwcfKEkymWKLwsyR66Z/QCA0pk5Y1ylLYWncjRignU+8wR9tPDm388oQKXC4+UpHKmU7hKfgvlUCpCxgIUIJsJxX9oDRS2wy7l4ps3/TovmnwAIV15tM+bdZX6SUmgPjx7q4rISmtX8dYi3VMWz5G4D6w+3iiYWhtlFzwBPg1GkZndBxLOpp1XMM1uRWI2kSS3EeMWd1vTuKzToIwnUmdioAIYix/a5y83KSASX2E/g1mFmwOqz30E18urABu3d32UxnSn0EIQc7ZxwgXnjCZTnXNWmELzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rK8BjgN//ZGNnpqsFxBgjMWN4vvKHBMgLU9hfyEf110=;
 b=ekoKbvzFajF9xHz6d4lgGn1bxOlmGp2gtJZNEGwLOaJ78TBsBF0NH0Qt4J2svecbC89/kV3tVJDWQoBoN3mXsNE1BJ867kRBJUtKE3USoLodmnwevSfgupsnpRc6IneN68MdsuwHS8neGLUIgg9GOgSkYci7pVlGeftlQL/JSn8=
Received: from MN2PR12CA0020.namprd12.prod.outlook.com (2603:10b6:208:a8::33)
 by DM5PR12MB2406.namprd12.prod.outlook.com (2603:10b6:4:b7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.13; Thu, 9 Jan
 2020 10:17:18 +0000
Received: from CO1NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::209) by MN2PR12CA0020.outlook.office365.com
 (2603:10b6:208:a8::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.9 via Frontend
 Transport; Thu, 9 Jan 2020 10:17:18 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT026.mail.protection.outlook.com (10.13.175.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2623.9 via Frontend Transport; Thu, 9 Jan 2020 10:17:18 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 9 Jan 2020
 04:17:16 -0600
Received: from rico-code.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 9 Jan 2020 04:17:13 -0600
From: Tianci Yin <tianci.yin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: fix modprobe failure of the secondary GPU when
 GDDR6 training enabled(V2)
Date: Thu, 9 Jan 2020 18:17:10 +0800
Message-ID: <20200109101710.16945-1-tianci.yin@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(346002)(396003)(428003)(189003)(199004)(478600001)(316002)(81166006)(2616005)(2906002)(70206006)(70586007)(54906003)(81156014)(336012)(426003)(1076003)(36756003)(86362001)(4326008)(186003)(7696005)(356004)(6916009)(8676002)(44832011)(8936002)(5660300002)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2406; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 867c5305-258a-4a50-cd4a-08d794ed1b40
X-MS-TrafficTypeDiagnostic: DM5PR12MB2406:
X-Microsoft-Antispam-PRVS: <DM5PR12MB2406ADEF2C9F5F67C969552995390@DM5PR12MB2406.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-Forefront-PRVS: 02778BF158
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VokzfztNKVC5mNV5nqEAjM2HrAvJZTRE9yGBddwHbuwYeeHWk0PAdccG4s6Ss3LbDADzRcpWQaDrEl/e7mJEzsvVh/HCXIBJmANRFq+bsn/TpsJq5OOkrN7TULlIeIAFgZxaU+kAYI7geYHTKYsPfQbpxohdC5HbmIIFfc0oroWULxgwXlR23UItnUAkiAVKM7vXN/XKLj95ud/wfHZWMwDk0D8io65yM/tmgb4MjXX59y1VxEK1TFpiGXCt19lM1NjfqCWw8Nho5OB0EO0A99PaAc3RqwRJVZSC/B/hFZfetDHKUco+6+8TvBVGXSenUX5F3aImUjsDsV2wNFjPWmS7dlgKls+KMoPt9WuoDuXqjMChpivtywpPGgeD+BAPNS10ATeHT++osumRivltt31ffuTp0HHdlTaHBXF6g+nUGTBcAN9CmVefLaAESl4g
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2020 10:17:18.0034 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 867c5305-258a-4a50-cd4a-08d794ed1b40
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2406
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
Cc: Long Gang <Gang.Long@amd.com>, Tianci Yin <tianci.yin@amd.com>,
 Feifei Xu <Feifei.Xu@amd.com>, Kevin Wang <Kevin1.Wang@amd.com>,
 Tuikov Luben <Luben.Tuikov@amd.com>,
 Deucher Alexander <Alexander.Deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: "Tianci.Yin" <tianci.yin@amd.com>

[why]
In dual GPUs scenario, stolen_size is assigned to zero on the secondary GPU,
since there is no pre-OS console using that memory. Then the bottom region of
VRAM was allocated as GTT, unfortunately a small region of bottom VRAM was
encroached by UMC firmware during GDDR6 BIST training, this cause page fault.

[how]
Forcing stolen_size to 3MB, then the bottom region of VRAM was
allocated as stolen memory, GTT corruption avoid.

Change-Id: I310a72ba0402994defbe50839842a8edb025a868
Signed-off-by: Tianci.Yin <tianci.yin@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h |  5 +++++
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c  | 28 +++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
index c91dd602d5f1..e4b2f9bcaeb7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
@@ -60,6 +60,11 @@
  */
 #define AMDGPU_GMC_FAULT_TIMEOUT	5000ULL
 
+/*
+ * Default stolen memory size, 1024 * 768 * 4
+ */
+#define AMDGPU_STOLEN_VGA_DEFAULT_SIZE	0x300000ULL
+
 struct firmware;
 
 /*
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
index 7dc8c068c62a..0e0fdf7596eb 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -566,6 +566,13 @@ static int gmc_v10_0_late_init(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 	int r;
 
+	/*
+	 * Can't free the stolen VGA memory when it might be used for memory
+	 * training again.
+	 */
+	if (!adev->fw_vram_usage.mem_train_support)
+		amdgpu_bo_late_init(adev);
+
 	r = amdgpu_gmc_allocate_vm_inv_eng(adev);
 	if (r)
 		return r;
@@ -757,6 +764,19 @@ static int gmc_v10_0_sw_init(void *handle)
 
 	adev->gmc.stolen_size = gmc_v10_0_get_vbios_fb_size(adev);
 
+	/*
+	 * In dual GPUs scenario, stolen_size is assigned to zero on the
+	 * secondary GPU, since there is no pre-OS console using that memory.
+	 * Then the bottom region of VRAM was allocated as GTT, unfortunately a
+	 * small region of bottom VRAM was encroached by UMC firmware during
+	 * GDDR6 BIST training, this cause page fault.
+	 * The page fault can be fixed by forcing stolen_size to 3MB, then the
+	 * bottom region of VRAM was allocated as stolen memory, GTT corruption
+	 * avoid.
+	 */
+	adev->gmc.stolen_size = max(adev->gmc.stolen_size,
+				    AMDGPU_STOLEN_VGA_DEFAULT_SIZE);
+
 	/* Memory manager */
 	r = amdgpu_bo_init(adev);
 	if (r)
@@ -796,6 +816,14 @@ static void gmc_v10_0_gart_fini(struct amdgpu_device *adev)
 static int gmc_v10_0_sw_fini(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	void *stolen_vga_buf;
+
+	/*
+	 * Free the stolen VGA memory when it might be used for memory training.
+	 */
+	if (adev->fw_vram_usage.mem_train_support)
+		amdgpu_bo_free_kernel(&adev->stolen_vga_memory, NULL,
+				      &stolen_vga_buf);
 
 	amdgpu_vm_manager_fini(adev);
 	gmc_v10_0_gart_fini(adev);
-- 
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
