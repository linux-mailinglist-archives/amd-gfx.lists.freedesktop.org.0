Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C80F389BE6
	for <lists+amd-gfx@lfdr.de>; Thu, 20 May 2021 05:33:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 523F06E835;
	Thu, 20 May 2021 03:33:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F506E832
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 May 2021 03:33:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mS0fa1AND/tDHuo/t4ACL89ySL46wMjqIm4Z7zy0a/OdGMxtRx+s/Ug0Na604GDVnHPlH0NXYsj9QVwNXCNNExF2G71yEVFT3/EqmJDELfDgJIX2gKT7wRp3y2AKJ6YqdRlmgRpaz2lnBYd4ghr59Ip3HnENy4ildDgPM+XvDIQeKeYHkwYz5hMr38qbxkeOq1+y831Jk113EEHZAK0W+O+GyxyYM4ep/VYRPN3uVz/xUHm2pqfQ+OWl/Gpi2L54i9BUSj9VIMH8j9RMO9Lo0z+t+LoXR9R1LPOGCdJQGp2sM0NdRKfkh3Ee4WsUC9D+gMDnngIhqJbvykScbON25g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c9B0mlOqXneiu2ju1CAOYgOaDFZ5zOUuhJzWqWSP/HY=;
 b=Oyr74pN2OyMT1J4PqCg7D0qotUREs4ICOjRDUqgMYcMIpRgythbtOGbt3pwK6wUXa/4o/P6LM3T3uSI42fkHZoPeUQ1LNgQVT+jPKZ1tBWM2ryM0yxjAox5lIXaGYkn0mJu1sSRJIIKovTGrKlX+tDfAKtf9YgTZ8aC9hU8pDr2TSajtM8CJjTO/WbxDdeRZLBkCeEaYiQoBS3dQhhjt70ZTq/qHQ22/s8LbEaZnS+ivRlb8ElrLIL5ViXoLDKgKV0cUhaqdeTBuN2Rn9sF7ML32g4OzAbST3xfCIoTB6LEhY+yDo0dcG0xiqvum1n4k1fXmhjQCYx6sAlFaq9hZxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=none sp=none pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c9B0mlOqXneiu2ju1CAOYgOaDFZ5zOUuhJzWqWSP/HY=;
 b=1JCT/QSRw1YIfpHjVjcrvmcfGkGlPhHVozqGHg1qqEElC5x8QoEtZ1neL+dlWSm7+G+zCkD50PuycIpWR+9OYMyrsyqRIbdBapnfBff/WNS7fH5WrlviRgr3hS07fd+uE4Qqbp0SP/X5Ey3z+SGki6pfY7zbawwOksRwPxdTXGQ=
Received: from BN9PR03CA0873.namprd03.prod.outlook.com (2603:10b6:408:13c::8)
 by DM4PR12MB5293.namprd12.prod.outlook.com (2603:10b6:5:39d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Thu, 20 May
 2021 03:33:07 +0000
Received: from BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13c:cafe::63) by BN9PR03CA0873.outlook.office365.com
 (2603:10b6:408:13c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend
 Transport; Thu, 20 May 2021 03:33:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT064.mail.protection.outlook.com (10.13.176.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4129.25 via Frontend Transport; Thu, 20 May 2021 03:33:07 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 19 May
 2021 22:33:06 -0500
Received: from willgu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Wed, 19 May 2021 22:33:05 -0500
From: Jiawei Gu <Jiawei.Gu@amd.com>
To: <tom.stdenis@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <david.nieto@amd.com>,
 <alexander.deucher@amd.com>
Subject: [PATCH] add vbios info query
Date: Thu, 20 May 2021 11:33:01 +0800
Message-ID: <20210520033301.11282-1-Jiawei.Gu@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b83cc5c-6770-4183-0291-08d91b3ffbf5
X-MS-TrafficTypeDiagnostic: DM4PR12MB5293:
X-Microsoft-Antispam-PRVS: <DM4PR12MB529354E76B64E82FB1E0F3D0F82A9@DM4PR12MB5293.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2/KeIWTh40Em/xp0BQGwblmo/hSFCxbWzOBZSBx/JpwzP+6ndlyStZAVsDNX09ayu1tDvvIG71leQtfQO1ILGME5hjVW/WRhl+y1Knn6iZ62JLBfLhE84Q24mHS+S/zXoQf77VrDNI+3J1rfI96X+/MaJyvj3nm5lybB0adMC96/UPjOvE3W5vpYF9nXPUHyZ9A10ERiBJ4YbBWlGxXUhk2Qo8GCCd1RlwsEVRnHxG+2A36uluIY6VzGpBOZmSgU9juZhE+306VcnoNiuGJkAlkoCVWmyZO2apD9nnjAtqQgvSR/j+5LlzaZc3bgCQnbsBoZ8y1WdknvrGBxwSDZpKieubWvv+05pj2EH9anQIMW1iHoAzgHxaS1Kj9PKSTLXW/pWlY0cq4rg7ZEigwkUT0dH6DxL1KYYO1X57SihuP6w51FF2HCEaJyiQxGOfXHvUtzUasUYtBNtl8I3Q7LWfCUVvyNSAaPNm7fsD7Y51AiVztCrN/Tq43RrtBhtdVUmrbW4Y0g/VEVJCjBkF+IVRY4AO641uBCIYHqsR1r9TlL9eMhTe6+EOO8gkW7U3gcxGDAcII4A2hKzHeaAzQZ1WT77OWMBC3q9LF7qYO6Ru3Vg8HE8ZStirSO/w0aC7/9MBo3JKvpjeLycAsFfODS4SIax7jVVws3Wzm+fJUIsZH0XV9fiEqZjsjRnZbyZjFx
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(376002)(39860400002)(36840700001)(46966006)(86362001)(82310400003)(6636002)(7696005)(26005)(478600001)(5660300002)(2906002)(426003)(8936002)(47076005)(83380400001)(110136005)(186003)(316002)(8676002)(336012)(54906003)(6666004)(1076003)(81166007)(2616005)(70206006)(36860700001)(70586007)(356005)(82740400003)(36756003)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 03:33:07.3223 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b83cc5c-6770-4183-0291-08d91b3ffbf5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5293
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
Cc: emily.deng@amd.com, Jiawei Gu <Jiawei.Gu@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Signed-off-by: Jiawei Gu <Jiawei.Gu@amd.com>
---
 src/app/CMakeLists.txt             |  1 +
 src/app/main.c                     |  8 +++++
 src/app/vbios.c                    | 53 ++++++++++++++++++++++++++++++
 src/lib/lowlevel/linux/query_drm.c | 11 +++++++
 src/umr.h                          | 11 +++++++
 src/umrapp.h                       |  1 +
 6 files changed, 85 insertions(+)
 create mode 100644 src/app/vbios.c

diff --git a/src/app/CMakeLists.txt b/src/app/CMakeLists.txt
index ca7d46b..462e4fc 100644
--- a/src/app/CMakeLists.txt
+++ b/src/app/CMakeLists.txt
@@ -35,6 +35,7 @@ add_library(umrapp STATIC
   pp_table.c
   navi10_ppt.c
   read_metrics.c
+  vbios.c
   ${GUI_SOURCE}
 )
 
diff --git a/src/app/main.c b/src/app/main.c
index 47ddb38..b484cf3 100644
--- a/src/app/main.c
+++ b/src/app/main.c
@@ -825,6 +825,11 @@ int main(int argc, char **argv)
 				asic = get_asic();
 			ih_self_test(asic);
 #endif
+		} else if (!strcmp(argv[i], "--vbios_info") || !strcmp(argv[i], "-vi")) {
+			if (!asic)
+				asic = get_asic();
+			if (umr_print_vbios_info(asic) != 0)
+				fprintf(stderr, "[ERROR]: Cannot print vbios info.\n");
 		} else if (!strcmp(argv[i], "--help") || !strcmp(argv[i], "-h")) {
 			printf("User Mode Register debugger v%s for AMDGPU devices (build: %s [%s]), Copyright (c) 2021, AMD Inc.\n"
 "\n*** Device Selection ***\n"
@@ -951,6 +956,9 @@ printf(
 	"\n\t\tPrint the GPU metrics table for the device."
 "\n\t--power, -p \n\t\tRead the conetent of clocks, temperature, gpu loading at runtime"
 	"\n\t\toptions 'use_colour' to colourize output \n");
+printf(
+"\n*** Video BIOS Information ***\n"
+"\n\t--vbios_info, -vi \n\t\tPrint Video BIOS information\n");
 
 #if UMR_GUI
 printf(
diff --git a/src/app/vbios.c b/src/app/vbios.c
new file mode 100644
index 0000000..fa0a3a3
--- /dev/null
+++ b/src/app/vbios.c
@@ -0,0 +1,53 @@
+/*
+ * Copyright 2021 Advanced Micro Devices, Inc.
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
+ * Authors: Tom St Denis <tom.stdenis@amd.com>
+ *
+ */
+#include "umrapp.h"
+
+#define AMDGPU_INFO_VBIOS			0x1B
+#define AMDGPU_INFO_VBIOS_INFO			0x3
+int umr_print_vbios_info(struct umr_asic *asic)
+{
+	char fname[64];
+	int r;
+	struct umr_vbios_info vbios_info;
+
+	if (asic->fd.drm < 0) {
+		snprintf(fname, sizeof(fname)-1, "/dev/dri/card%d", asic->instance);
+		asic->fd.drm = open(fname, O_RDWR);
+	}
+
+	r = umr_query_drm_vbios(asic, AMDGPU_INFO_VBIOS, AMDGPU_INFO_VBIOS_INFO,
+			&vbios_info, sizeof(vbios_info));
+	if (r)
+		return r;
+
+	printf("vbios name          : %s\n", vbios_info.name);
+	printf("vbios pn            : %s\n", vbios_info.vbios_pn);
+	printf("vbios version       : %d\n", vbios_info.version);
+	printf("vbios ver_str       : %s\n", vbios_info.vbios_ver_str);
+	printf("vbios date          : %s\n", vbios_info.date);
+
+	close(asic->fd.drm);
+	return 0;
+}
\ No newline at end of file
diff --git a/src/lib/lowlevel/linux/query_drm.c b/src/lib/lowlevel/linux/query_drm.c
index d0c82d4..f4ab709 100644
--- a/src/lib/lowlevel/linux/query_drm.c
+++ b/src/lib/lowlevel/linux/query_drm.c
@@ -49,7 +49,18 @@ int umr_query_drm(struct umr_asic *asic, int field, void *ret, int size)
 	inf.return_size = size;
 	inf.query = field;
 	return ioctl(asic->fd.drm, DRM_IOC(DRM_IOC_WRITE, DRM_IOCTL_BASE, DRM_COMMAND_BASE + DRM_AMDGPU_INFO, sizeof(inf)), &inf);
+}
 
+int umr_query_drm_vbios(struct umr_asic *asic, int field, int type, void *ret, int size)
+{
+	struct drm_amdgpu_info inf;
+
+	memset(&inf, 0, sizeof inf);
+	inf.return_pointer = (uintptr_t)ret;
+	inf.return_size = size;
+	inf.query = field;
+	inf.vbios_info.type = type;
+	return ioctl(asic->fd.drm, DRM_IOC(DRM_IOC_WRITE, DRM_IOCTL_BASE, DRM_COMMAND_BASE + DRM_AMDGPU_INFO, sizeof(inf)), &inf);
 }
 
 #else
diff --git a/src/umr.h b/src/umr.h
index 4e730e5..9b80987 100644
--- a/src/umr.h
+++ b/src/umr.h
@@ -973,6 +973,7 @@ void umr_free_asic(struct umr_asic *asic);
 void umr_free_maps(struct umr_asic *asic);
 void umr_close_asic(struct umr_asic *asic); // call this to close a fully open asic
 int umr_query_drm(struct umr_asic *asic, int field, void *ret, int size);
+int umr_query_drm_vbios(struct umr_asic *asic, int field, int type, void *ret, int size);
 void umr_enumerate_devices(void);
 int umr_update(struct umr_asic *asic, char *script);
 int umr_update_string(struct umr_asic *asic, char *sdata);
@@ -1349,6 +1350,16 @@ struct umr_soc15_database {
 	struct umr_soc15_database *next;
 };
 
+// vbios
+struct umr_vbios_info {
+	uint8_t name[64];
+	uint8_t vbios_pn[64];
+	uint32_t version;
+	uint32_t pad;
+	uint8_t vbios_ver_str[32];
+	uint8_t date[32];
+};
+
 FILE *umr_database_open(char *path, char *filename);
 struct umr_soc15_database *umr_database_read_soc15(char *path, char *filename);
 void umr_database_free_soc15(struct umr_soc15_database *soc15);
diff --git a/src/umrapp.h b/src/umrapp.h
index 14457fe..1336e07 100644
--- a/src/umrapp.h
+++ b/src/umrapp.h
@@ -57,5 +57,6 @@ void umr_clock_scan(struct umr_asic *asic, const char* clock_name);
 void umr_clock_manual(struct umr_asic *asic, const char* clock_name, void* value);
 int umr_print_pp_table(struct umr_asic *asic, const char* param);
 int umr_print_gpu_metrics(struct umr_asic *asic);
+int umr_print_vbios_info(struct umr_asic *asic);
 
 void run_server_loop(const char *url, struct umr_asic * asic);
-- 
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
