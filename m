Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5252534170
	for <lists+amd-gfx@lfdr.de>; Wed, 25 May 2022 18:22:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E9E10F933;
	Wed, 25 May 2022 16:22:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2055.outbound.protection.outlook.com [40.107.243.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7492210E677
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 May 2022 16:20:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VgEBn6VbklBI2Fo1kKzMbKnI3vhPF3rduotF32144JJkrTc59W7wSIVx3veVMUCs2Txb1dAge+IL6soOQsuC/PoiwwkaMPbrHeHpQx/MWxmo8+d0FqHx8kHCmxbCtl6i1GuhACRERj7VRX7jT/ZMFVYQphFff4kVAZu+OjJeVuWlc+Z20pn8kRKGmGYMz3afPSmK6CsNu3LVQWAG9wCkRRuGaFnGxgp1effrnyhqYiddmqJ59CQDhpRdgEVKX+tWDdgyre7FZc8kfRn6XpbV/L320WjL85tbM2FrMmAvkIKayh43eRZAh4eXR4fJLn6rBPok80GiErk1TOjpp913Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gyxeTZWsrJnwKPfKdsESU/lo6NFN9sVHP19yCx1nPJ0=;
 b=ktFuw3HjV+iSfGMCb5nrQ1HoToKpAGvdq2rXerXdqgP4WzSJhYhIN/ULlNnE3oQUebbD775FHMaHwGGRZBJo6T8EpaD0bewHfH7NBJRSNo0CLb1F151bn970/Xt7vzaakj2KrkREeREAV5cZDoQNtgj+EoKh1O+5uosjw5U8zwBTn+Sei7l2/eHY4+7SS04uE0bWY1NbwAe6BX01p3uW1ytHMlL+AEmD6rUUP+yS/Dw79AOzR3e7a9WMaiZgBJfBNlhe8mYXYPBoPK6fG4OUHjTbAgOviWXl648mNCERDS8NC9kQYsLG1RF/1ze53LL5vXE6R5ZD2WZU4jKazllMdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyxeTZWsrJnwKPfKdsESU/lo6NFN9sVHP19yCx1nPJ0=;
 b=i+xxzOaf+IsZTsxYUktZhmfGfesOapv2QwAEkefK1kTmlqTgkHRq+Ri3Hv626ZWiVwqZtAd8yCqKNxQLEGV9TMcWsDPKzr4pZrucSNGk54wJg8Wz+8TR7ohI8ZIxhoexUNrsyEgfaX0tD+KVorny5JN3T3XfUhBKPe/c71OAR2s=
Received: from DM6PR08CA0004.namprd08.prod.outlook.com (2603:10b6:5:80::17) by
 DM4PR12MB6639.namprd12.prod.outlook.com (2603:10b6:8:be::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13; Wed, 25 May 2022 16:20:05 +0000
Received: from DM6NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:80:cafe::32) by DM6PR08CA0004.outlook.office365.com
 (2603:10b6:5:80::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Wed, 25 May 2022 16:20:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT019.mail.protection.outlook.com (10.13.172.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Wed, 25 May 2022 16:20:05 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 25 May
 2022 11:20:02 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 08/43] drm/amd/display: DML changes for DCN32/321
Date: Wed, 25 May 2022 12:19:06 -0400
Message-ID: <20220525161941.2544055-8-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220525161941.2544055-1-alexander.deucher@amd.com>
References: <20220525161941.2544055-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c827c31c-c21b-4249-1cd4-08da3e6a6dcf
X-MS-TrafficTypeDiagnostic: DM4PR12MB6639:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB663970DE17AA627B225B585FF7D69@DM4PR12MB6639.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ETqP9QVtqVZNVATjk3mmcqeBt762JuyKbNL9IEt6s9TJ5tXBn5QhUgDGhywEmpso/q0lEtBO2ZblcT5yd9hgz0tw8DzCbfwKz/5TSXfCf7M3p6K9QZjX7ycqywnjvPXcKofERMUNklPbx4QeOdO7Ko5Tq9Y6lUOwGbQMX21vsj8poAfBqDCTtCQWijEodxSrOfP/3gfzcn9Afk13w1DCNJG0HI8FgYSqo4YNmUX03zmCAuBUvckzZZlT9mJMRnPrVWAY1j2o77b+upgdePGml9NKeTeu36d1yM/PRJsxjv2jGhm06dTcfZzj6PUzUoeUjxAwcnllseV7K26fpVR0evQkuFoi0FodLCrZwIzB2F+y5Ovk4/okeaaAxafHfkjPSqsGglMZH6xsAmg3mumla+A3nAj0XNpWzV35BfV6Z/7dWsg0navUpmiYpe24FwmI/duqxlge036Vx8p2gbXGjkkPY88WKcK4rXmV0nvci4mRZq8ccu+YPIKrmox4tfWcztUMJxXQFReBQ5K9GA0TRRQXYFNnaLSlXwWRxVDkHCC55DhKn8pK0I8iuroQ3kNnuh45huT8cZE/PrNqvYigPsrXSGR/LBFzF2lIGkNnaGQBnSC8QeFHeiJpzGxA/Xgr60kAQT8+wJX7rlpnZNlwtRCY72B0wnBK3zY/vWtY4Nb/9ds6NTHJGYSY/sYzNOTRoGmpSS7zOFUlupdNpi/u0zaDbNvut47LARMXZCWzcpPZZFhLkkZMS0hmK5FtzHrYKazRIs/0Ys3lK7+VzJmI3A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(8676002)(4326008)(70206006)(40460700003)(36860700001)(83380400001)(426003)(70586007)(356005)(336012)(47076005)(54906003)(6916009)(19627235002)(36756003)(316002)(81166007)(5660300002)(1076003)(82310400005)(45954011)(26005)(508600001)(86362001)(186003)(16526019)(8936002)(30864003)(2616005)(2906002)(7696005)(36900700001)(559001)(579004)(309714004)(44824005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 16:20:05.4998 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c827c31c-c21b-4249-1cd4-08da3e6a6dcf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6639
X-Mailman-Approved-At: Wed, 25 May 2022 16:22:56 +0000
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Aurabindo Pillai <aurabindo.pillai@amd.com>

DML is required for display configuration modelling for things like
bandwidth management and validation.

Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dml/Makefile   |    7 +
 .../dc/dml/dcn30/display_mode_vba_30.c        |    8 +-
 .../dc/dml/dcn31/display_mode_vba_31.c        |    2 +-
 .../dc/dml/dcn32/display_mode_vba_32.c        | 3835 ++++++++++
 .../dc/dml/dcn32/display_mode_vba_32.h        |   57 +
 .../dc/dml/dcn32/display_mode_vba_util_32.c   | 6254 +++++++++++++++++
 .../dc/dml/dcn32/display_mode_vba_util_32.h   | 1175 ++++
 .../dc/dml/dcn32/display_rq_dlg_calc_32.c     |  616 ++
 .../dc/dml/dcn32/display_rq_dlg_calc_32.h     |   70 +
 .../amd/display/dc/dml/display_mode_enums.h   |   88 +-
 .../drm/amd/display/dc/dml/display_mode_lib.c |   12 +
 .../drm/amd/display/dc/dml/display_mode_lib.h |   15 +
 .../amd/display/dc/dml/display_mode_structs.h |  132 +
 .../drm/amd/display/dc/dml/display_mode_vba.c |  171 +
 .../drm/amd/display/dc/dml/display_mode_vba.h |  242 +-
 .../gpu/drm/amd/display/dc/dml/dml_wrapper.c  |   71 +-
 16 files changed, 12710 insertions(+), 45 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.h

diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
index a64b88ca01a9..c48688cdd7f7 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
@@ -72,6 +72,9 @@ CFLAGS_$(AMDDALPATH)/dc/dml/dcn30/display_rq_dlg_calc_30.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn31/display_mode_vba_31.o := $(dml_ccflags) $(frame_warn_flag)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn31/display_rq_dlg_calc_31.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn30/dcn30_fpu.o := $(dml_ccflags)
+CFLAGS_$(AMDDALPATH)/dc/dml/dcn32/display_mode_vba_32.o := $(dml_ccflags) $(frame_warn_flag)
+CFLAGS_$(AMDDALPATH)/dc/dml/dcn32/display_rq_dlg_calc_32.o := $(dml_ccflags)
+CFLAGS_$(AMDDALPATH)/dc/dml/dcn32/display_mode_vba_util_32.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn31/dcn31_fpu.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn301/dcn301_fpu.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn302/dcn302_fpu.o := $(dml_ccflags)
@@ -93,6 +96,9 @@ CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn30/display_mode_vba_30.o := $(dml_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn30/display_rq_dlg_calc_30.o := $(dml_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn31/display_mode_vba_31.o := $(dml_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn31/display_rq_dlg_calc_31.o := $(dml_rcflags)
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn32/display_mode_vba_32.o := $(dml_rcflags)
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn32/display_rq_dlg_calc_32.o := $(dml_rcflags)
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn32/display_mode_vba_util_32.o := $(dml_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn301/dcn301_fpu.o := $(dml_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/display_mode_lib.o := $(dml_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dsc/rc_calc_fpu.o  := $(dml_rcflags)
@@ -116,6 +122,7 @@ DML += dcn20/display_rq_dlg_calc_20v2.o dcn20/display_mode_vba_20v2.o
 DML += dcn21/display_rq_dlg_calc_21.o dcn21/display_mode_vba_21.o
 DML += dcn30/dcn30_fpu.o dcn30/display_mode_vba_30.o dcn30/display_rq_dlg_calc_30.o
 DML += dcn31/display_mode_vba_31.o dcn31/display_rq_dlg_calc_31.o
+DML += dcn32/display_mode_vba_32.o dcn32/display_rq_dlg_calc_32.o dcn32/display_mode_vba_util_32.o
 DML += dcn31/dcn31_fpu.o
 DML += dcn301/dcn301_fpu.o
 DML += dcn302/dcn302_fpu.o
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
index f47d82da115c..fb4aa4c800bf 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
@@ -438,8 +438,8 @@ static void UseMinimumDCFCLK(
 		int dpte_group_bytes[],
 		double PrefetchLinesY[][2][DC__NUM_DPP__MAX],
 		double PrefetchLinesC[][2][DC__NUM_DPP__MAX],
-		int swath_width_luma_ub_all_states[][2][DC__NUM_DPP__MAX],
-		int swath_width_chroma_ub_all_states[][2][DC__NUM_DPP__MAX],
+		unsigned int swath_width_luma_ub_all_states[][2][DC__NUM_DPP__MAX],
+		unsigned int swath_width_chroma_ub_all_states[][2][DC__NUM_DPP__MAX],
 		int BytePerPixelY[],
 		int BytePerPixelC[],
 		int HTotal[],
@@ -6696,8 +6696,8 @@ static void UseMinimumDCFCLK(
 		int dpte_group_bytes[],
 		double PrefetchLinesY[][2][DC__NUM_DPP__MAX],
 		double PrefetchLinesC[][2][DC__NUM_DPP__MAX],
-		int swath_width_luma_ub_all_states[][2][DC__NUM_DPP__MAX],
-		int swath_width_chroma_ub_all_states[][2][DC__NUM_DPP__MAX],
+		unsigned int swath_width_luma_ub_all_states[][2][DC__NUM_DPP__MAX],
+		unsigned int swath_width_chroma_ub_all_states[][2][DC__NUM_DPP__MAX],
 		int BytePerPixelY[],
 		int BytePerPixelC[],
 		int HTotal[],
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
index e4b9fd31223c..448fbbcdf88a 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
@@ -2996,7 +2996,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 				v->ImmediateFlipSupported)) ? true : false;
 #ifdef __DML_VBA_DEBUG__
 		dml_print("DML::%s: PrefetchModeSupported %d\n", __func__, v->PrefetchModeSupported);
-		dml_print("DML::%s: ImmediateFlipRequirement %d\n", __func__, v->ImmediateFlipRequirement == dm_immediate_flip_required);
+		dml_print("DML::%s: ImmediateFlipRequirement[0] %d\n", __func__, v->ImmediateFlipRequirement[0] == dm_immediate_flip_required);
 		dml_print("DML::%s: ImmediateFlipSupported %d\n", __func__, v->ImmediateFlipSupported);
 		dml_print("DML::%s: ImmediateFlipSupport %d\n", __func__, v->ImmediateFlipSupport);
 		dml_print("DML::%s: HostVMEnable %d\n", __func__, v->HostVMEnable);
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
new file mode 100644
index 000000000000..b77a1ae792d1
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
@@ -0,0 +1,3835 @@
+/*
+ * Copyright 2022 Advanced Micro Devices, Inc. All rights reserved.
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
+ * Authors: AMD
+ *
+ */
+
+#include "dc.h"
+#include "dc_link.h"
+#include "../display_mode_lib.h"
+#include "display_mode_vba_32.h"
+#include "../dml_inline_defs.h"
+#include "display_mode_vba_util_32.h"
+
+static const unsigned int NumberOfStates = DC__VOLTAGE_STATES;
+
+void dml32_recalculate(struct display_mode_lib *mode_lib);
+static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation(
+		struct display_mode_lib *mode_lib);
+void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib);
+
+void dml32_recalculate(struct display_mode_lib *mode_lib)
+{
+	ModeSupportAndSystemConfiguration(mode_lib);
+
+	dml32_CalculateMaxDETAndMinCompressedBufferSize(mode_lib->vba.ConfigReturnBufferSizeInKByte,
+			mode_lib->vba.ROBBufferSizeInKByte,
+			DC__NUM_DPP,
+			false, //mode_lib->vba.override_setting.nomDETInKByteOverrideEnable,
+			0, //mode_lib->vba.override_setting.nomDETInKByteOverrideValue,
+
+			/* Output */
+			&mode_lib->vba.MaxTotalDETInKByte, &mode_lib->vba.nomDETInKByte,
+			&mode_lib->vba.MinCompressedBufferSizeInKByte);
+
+	PixelClockAdjustmentForProgressiveToInterlaceUnit(mode_lib);
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: Calling DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation\n", __func__);
+#endif
+	DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation(mode_lib);
+}
+
+static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation(
+		struct display_mode_lib *mode_lib)
+{
+	struct vba_vars_st *v = &mode_lib->vba;
+	unsigned int j, k;
+	bool ImmediateFlipRequirementFinal;
+	int iteration;
+	double MaxTotalRDBandwidth;
+	unsigned int NextPrefetchMode;
+
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: --- START ---\n", __func__);
+	dml_print("DML::%s: mode_lib->vba.PrefetchMode = %d\n", __func__, mode_lib->vba.PrefetchMode);
+	dml_print("DML::%s: mode_lib->vba.ImmediateFlipSupport = %d\n", __func__, mode_lib->vba.ImmediateFlipSupport);
+	dml_print("DML::%s: mode_lib->vba.VoltageLevel = %d\n", __func__, mode_lib->vba.VoltageLevel);
+#endif
+
+	v->WritebackDISPCLK = 0.0;
+	v->GlobalDPPCLK = 0.0;
+
+	// DISPCLK and DPPCLK Calculation
+	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+		if (mode_lib->vba.WritebackEnable[k]) {
+			v->WritebackDISPCLK = dml_max(v->WritebackDISPCLK,
+					dml32_CalculateWriteBackDISPCLK(
+							mode_lib->vba.WritebackPixelFormat[k],
+							mode_lib->vba.PixelClock[k], mode_lib->vba.WritebackHRatio[k],
+							mode_lib->vba.WritebackVRatio[k],
+							mode_lib->vba.WritebackHTaps[k],
+							mode_lib->vba.WritebackVTaps[k],
+							mode_lib->vba.WritebackSourceWidth[k],
+							mode_lib->vba.WritebackDestinationWidth[k],
+							mode_lib->vba.HTotal[k], mode_lib->vba.WritebackLineBufferSize,
+							mode_lib->vba.DISPCLKDPPCLKVCOSpeed));
+		}
+	}
+
+	v->DISPCLK_calculated = v->WritebackDISPCLK;
+
+	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+		if (mode_lib->vba.BlendingAndTiming[k] == k) {
+			v->DISPCLK_calculated = dml_max(v->DISPCLK_calculated,
+					dml32_CalculateRequiredDispclk(
+							mode_lib->vba.ODMCombineEnabled[k],
+							mode_lib->vba.PixelClock[k],
+							mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading,
+							mode_lib->vba.DISPCLKRampingMargin,
+							mode_lib->vba.DISPCLKDPPCLKVCOSpeed,
+							mode_lib->vba.MaxDppclk[v->soc.num_states - 1]));
+		}
+	}
+
+	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+		dml32_CalculateSinglePipeDPPCLKAndSCLThroughput(mode_lib->vba.HRatio[k],
+				mode_lib->vba.HRatioChroma[k],
+				mode_lib->vba.VRatio[k],
+				mode_lib->vba.VRatioChroma[k],
+				mode_lib->vba.MaxDCHUBToPSCLThroughput,
+				mode_lib->vba.MaxPSCLToLBThroughput,
+				mode_lib->vba.PixelClock[k],
+				mode_lib->vba.SourcePixelFormat[k],
+				mode_lib->vba.htaps[k],
+				mode_lib->vba.HTAPsChroma[k],
+				mode_lib->vba.vtaps[k],
+				mode_lib->vba.VTAPsChroma[k],
+
+				/* Output */
+				&v->PSCL_THROUGHPUT_LUMA[k], &v->PSCL_THROUGHPUT_CHROMA[k],
+				&v->DPPCLKUsingSingleDPP[k]);
+	}
+
+	dml32_CalculateDPPCLK(mode_lib->vba.NumberOfActiveSurfaces, mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading,
+			mode_lib->vba.DISPCLKDPPCLKVCOSpeed, v->DPPCLKUsingSingleDPP, mode_lib->vba.DPPPerPlane,
+			/* Output */
+			&v->GlobalDPPCLK, v->DPPCLK);
+
+	for (k = 0; k < v->NumberOfActiveSurfaces; ++k) {
+		v->DPPCLK_calculated[k] = v->DPPCLK[k];
+	}
+
+	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+		dml32_CalculateBytePerPixelAndBlockSizes(
+				mode_lib->vba.SourcePixelFormat[k],
+				mode_lib->vba.SurfaceTiling[k],
+
+				/* Output */
+				&v->BytePerPixelY[k],
+				&v->BytePerPixelC[k],
+				&v->BytePerPixelDETY[k],
+				&v->BytePerPixelDETC[k],
+				&v->BlockHeight256BytesY[k],
+				&v->BlockHeight256BytesC[k],
+				&v->BlockWidth256BytesY[k],
+				&v->BlockWidth256BytesC[k],
+				&v->BlockHeightY[k],
+				&v->BlockHeightC[k],
+				&v->BlockWidthY[k],
+				&v->BlockWidthC[k]);
+	}
+
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: %d\n", __func__, __LINE__);
+#endif
+	dml32_CalculateSwathWidth(
+			false,  // ForceSingleDPP
+			mode_lib->vba.NumberOfActiveSurfaces,
+			mode_lib->vba.SourcePixelFormat,
+			mode_lib->vba.SourceRotation,
+			mode_lib->vba.ViewportStationary,
+			mode_lib->vba.ViewportWidth,
+			mode_lib->vba.ViewportHeight,
+			mode_lib->vba.ViewportXStartY,
+			mode_lib->vba.ViewportYStartY,
+			mode_lib->vba.ViewportXStartC,
+			mode_lib->vba.ViewportYStartC,
+			mode_lib->vba.SurfaceWidthY,
+			mode_lib->vba.SurfaceWidthC,
+			mode_lib->vba.SurfaceHeightY,
+			mode_lib->vba.SurfaceHeightC,
+			mode_lib->vba.ODMCombineEnabled,
+			v->BytePerPixelY,
+			v->BytePerPixelC,
+			v->BlockHeight256BytesY,
+			v->BlockHeight256BytesC,
+			v->BlockWidth256BytesY,
+			v->BlockWidth256BytesC,
+			mode_lib->vba.BlendingAndTiming,
+			mode_lib->vba.HActive,
+			mode_lib->vba.HRatio,
+			mode_lib->vba.DPPPerPlane,
+
+			/* Output */
+			v->SwathWidthSingleDPPY, v->SwathWidthSingleDPPC, v->SwathWidthY, v->SwathWidthC,
+			v->dummy_vars
+				.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
+				.dummy_integer_array[0], // Integer             MaximumSwathHeightY[]
+			v->dummy_vars
+				.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
+				.dummy_integer_array[1], // Integer             MaximumSwathHeightC[]
+			v->swath_width_luma_ub, v->swath_width_chroma_ub);
+
+	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+		v->ReadBandwidthSurfaceLuma[k] = v->SwathWidthSingleDPPY[k] * v->BytePerPixelY[k]
+				/ (mode_lib->vba.HTotal[k] / mode_lib->vba.PixelClock[k]) * mode_lib->vba.VRatio[k];
+		v->ReadBandwidthSurfaceChroma[k] = v->SwathWidthSingleDPPC[k] * v->BytePerPixelC[k]
+				/ (mode_lib->vba.HTotal[k] / mode_lib->vba.PixelClock[k])
+				* mode_lib->vba.VRatioChroma[k];
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML::%s: ReadBandwidthSurfaceLuma[%i] = %fBps\n",
+				__func__, k, v->ReadBandwidthSurfaceLuma[k]);
+		dml_print("DML::%s: ReadBandwidthSurfaceChroma[%i] = %fBps\n",
+				__func__, k, v->ReadBandwidthSurfaceChroma[k]);
+#endif
+	}
+
+	{
+		// VBA_DELTA
+		// Calculate DET size, swath height
+		dml32_CalculateSwathAndDETConfiguration(
+				mode_lib->vba.DETSizeOverride,
+				mode_lib->vba.UsesMALLForPStateChange,
+				mode_lib->vba.ConfigReturnBufferSizeInKByte,
+				mode_lib->vba.MaxTotalDETInKByte,
+				mode_lib->vba.MinCompressedBufferSizeInKByte,
+				false, /* ForceSingleDPP */
+				mode_lib->vba.NumberOfActiveSurfaces,
+				mode_lib->vba.nomDETInKByte,
+				mode_lib->vba.UseUnboundedRequesting,
+				mode_lib->vba.CompressedBufferSegmentSizeInkByteFinal,
+				v->dummy_vars
+					.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
+					.dummy_output_encoder_array, /* output_encoder_class Output[] */
+				v->ReadBandwidthSurfaceLuma,
+				v->ReadBandwidthSurfaceChroma,
+				v->dummy_vars
+					.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
+					.dummy_single_array[0], /* Single MaximumSwathWidthLuma[] */
+				v->dummy_vars
+					.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
+					.dummy_single_array[1], /* Single MaximumSwathWidthChroma[] */
+				mode_lib->vba.SourceRotation,
+				mode_lib->vba.ViewportStationary,
+				mode_lib->vba.SourcePixelFormat,
+				mode_lib->vba.SurfaceTiling,
+				mode_lib->vba.ViewportWidth,
+				mode_lib->vba.ViewportHeight,
+				mode_lib->vba.ViewportXStartY,
+				mode_lib->vba.ViewportYStartY,
+				mode_lib->vba.ViewportXStartC,
+				mode_lib->vba.ViewportYStartC,
+				mode_lib->vba.SurfaceWidthY,
+				mode_lib->vba.SurfaceWidthC,
+				mode_lib->vba.SurfaceHeightY,
+				mode_lib->vba.SurfaceHeightC,
+				v->BlockHeight256BytesY,
+				v->BlockHeight256BytesC,
+				v->BlockWidth256BytesY,
+				v->BlockWidth256BytesC,
+				mode_lib->vba.ODMCombineEnabled,
+				mode_lib->vba.BlendingAndTiming,
+				v->BytePerPixelY,
+				v->BytePerPixelC,
+				v->BytePerPixelDETY,
+				v->BytePerPixelDETC,
+				mode_lib->vba.HActive,
+				mode_lib->vba.HRatio,
+				mode_lib->vba.HRatioChroma,
+				mode_lib->vba.DPPPerPlane,
+
+				/* Output */
+				v->dummy_vars
+					.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
+					.dummy_long_array[0], /* Long swath_width_luma_ub[] */
+				v->dummy_vars
+					.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
+					.dummy_long_array[1], /* Long swath_width_chroma_ub[] */
+				v->dummy_vars
+					.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
+					.dummy_double_array[0], /* Long SwathWidth[] */
+				v->dummy_vars
+					.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
+					.dummy_double_array[1], /* Long SwathWidthChroma[] */
+				mode_lib->vba.SwathHeightY,
+				mode_lib->vba.SwathHeightC,
+				mode_lib->vba.DETBufferSizeInKByte,
+				mode_lib->vba.DETBufferSizeY,
+				mode_lib->vba.DETBufferSizeC,
+				&v->UnboundedRequestEnabled,
+				&v->CompressedBufferSizeInkByte,
+				v->dummy_vars
+					.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
+					.dummy_boolean_array, /* bool ViewportSizeSupportPerSurface[] */
+				&v->dummy_vars
+					 .DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
+					 .dummy_boolean); /* bool *ViewportSizeSupport */
+	}
+
+	// DCFCLK Deep Sleep
+	dml32_CalculateDCFCLKDeepSleep(
+			mode_lib->vba.NumberOfActiveSurfaces,
+			v->BytePerPixelY,
+			v->BytePerPixelC,
+			mode_lib->vba.VRatio,
+			mode_lib->vba.VRatioChroma,
+			v->SwathWidthY,
+			v->SwathWidthC,
+			mode_lib->vba.DPPPerPlane,
+			mode_lib->vba.HRatio,
+			mode_lib->vba.HRatioChroma,
+			mode_lib->vba.PixelClock,
+			v->PSCL_THROUGHPUT_LUMA,
+			v->PSCL_THROUGHPUT_CHROMA,
+			mode_lib->vba.DPPCLK,
+			v->ReadBandwidthSurfaceLuma,
+			v->ReadBandwidthSurfaceChroma,
+			mode_lib->vba.ReturnBusWidth,
+
+			/* Output */
+			&v->DCFCLKDeepSleep);
+
+	// DSCCLK
+	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+		if ((mode_lib->vba.BlendingAndTiming[k] != k) || !mode_lib->vba.DSCEnabled[k]) {
+			v->DSCCLK_calculated[k] = 0.0;
+		} else {
+			if (mode_lib->vba.OutputFormat[k] == dm_420)
+				mode_lib->vba.DSCFormatFactor = 2;
+			else if (mode_lib->vba.OutputFormat[k] == dm_444)
+				mode_lib->vba.DSCFormatFactor = 1;
+			else if (mode_lib->vba.OutputFormat[k] == dm_n422)
+				mode_lib->vba.DSCFormatFactor = 2;
+			else
+				mode_lib->vba.DSCFormatFactor = 1;
+			if (mode_lib->vba.ODMCombineEnabled[k] == dm_odm_combine_mode_4to1)
+				v->DSCCLK_calculated[k] = mode_lib->vba.PixelClockBackEnd[k] / 12
+						/ mode_lib->vba.DSCFormatFactor
+						/ (1 - mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading / 100);
+			else if (mode_lib->vba.ODMCombineEnabled[k] == dm_odm_combine_mode_2to1)
+				v->DSCCLK_calculated[k] = mode_lib->vba.PixelClockBackEnd[k] / 6
+						/ mode_lib->vba.DSCFormatFactor
+						/ (1 - mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading / 100);
+			else
+				v->DSCCLK_calculated[k] = mode_lib->vba.PixelClockBackEnd[k] / 3
+						/ mode_lib->vba.DSCFormatFactor
+						/ (1 - mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading / 100);
+		}
+	}
+
+	// DSC Delay
+	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+		v->DSCDelay[k] = dml32_DSCDelayRequirement(mode_lib->vba.DSCEnabled[k],
+				mode_lib->vba.ODMCombineEnabled[k], mode_lib->vba.DSCInputBitPerComponent[k],
+				mode_lib->vba.OutputBpp[k], mode_lib->vba.HActive[k], mode_lib->vba.HTotal[k],
+				mode_lib->vba.NumberOfDSCSlices[k], mode_lib->vba.OutputFormat[k],
+				mode_lib->vba.Output[k], mode_lib->vba.PixelClock[k],
+				mode_lib->vba.PixelClockBackEnd[k]);
+	}
+
+	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k)
+		for (j = 0; j < mode_lib->vba.NumberOfActiveSurfaces; ++j) // NumberOfSurfaces
+			if (j != k && mode_lib->vba.BlendingAndTiming[k] == j && mode_lib->vba.DSCEnabled[j])
+				v->DSCDelay[k] = v->DSCDelay[j];
+
+	//Immediate Flip
+	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+		v->ImmediateFlipSupportedSurface[k] = mode_lib->vba.ImmediateFlipSupport
+				&& (mode_lib->vba.ImmediateFlipRequirement[k] != dm_immediate_flip_not_required);
+	}
+
+	// Prefetch
+	dml32_CalculateSurfaceSizeInMall(
+				mode_lib->vba.NumberOfActiveSurfaces,
+				mode_lib->vba.MALLAllocatedForDCNFinal,
+				mode_lib->vba.UseMALLForStaticScreen,
+				mode_lib->vba.DCCEnable,
+				mode_lib->vba.ViewportStationary,
+				mode_lib->vba.ViewportXStartY,
+				mode_lib->vba.ViewportYStartY,
+				mode_lib->vba.ViewportXStartC,
+				mode_lib->vba.ViewportYStartC,
+				mode_lib->vba.ViewportWidth,
+				mode_lib->vba.ViewportHeight,
+				v->BytePerPixelY,
+				mode_lib->vba.ViewportWidthChroma,
+				mode_lib->vba.ViewportHeightChroma,
+				v->BytePerPixelC,
+				mode_lib->vba.SurfaceWidthY,
+				mode_lib->vba.SurfaceWidthC,
+				mode_lib->vba.SurfaceHeightY,
+				mode_lib->vba.SurfaceHeightC,
+				v->BlockWidth256BytesY,
+				v->BlockWidth256BytesC,
+				v->BlockHeight256BytesY,
+				v->BlockHeight256BytesC,
+				v->BlockWidthY,
+				v->BlockWidthC,
+				v->BlockHeightY,
+				v->BlockHeightC,
+
+				/* Output */
+				v->SurfaceSizeInMALL,
+				&v->dummy_vars.
+				DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
+				.dummy_boolean2); /* Boolean *ExceededMALLSize */
+
+	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.SurfaceParameters[k].PixelClock = mode_lib->vba.PixelClock[k];
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.SurfaceParameters[k].DPPPerSurface = mode_lib->vba.DPPPerPlane[k];
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.SurfaceParameters[k].SourceRotation = mode_lib->vba.SourceRotation[k];
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.SurfaceParameters[k].ViewportHeight = mode_lib->vba.ViewportHeight[k];
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.SurfaceParameters[k].ViewportHeightChroma = mode_lib->vba.ViewportHeightChroma[k];
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.SurfaceParameters[k].BlockWidth256BytesY = v->BlockWidth256BytesY[k];
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.SurfaceParameters[k].BlockHeight256BytesY = v->BlockHeight256BytesY[k];
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.SurfaceParameters[k].BlockWidth256BytesC = v->BlockWidth256BytesC[k];
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.SurfaceParameters[k].BlockHeight256BytesC = v->BlockHeight256BytesC[k];
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.SurfaceParameters[k].BlockWidthY = v->BlockWidthY[k];
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.SurfaceParameters[k].BlockHeightY = v->BlockHeightY[k];
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.SurfaceParameters[k].BlockWidthC = v->BlockWidthC[k];
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.SurfaceParameters[k].BlockHeightC = v->BlockHeightC[k];
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.SurfaceParameters[k].InterlaceEnable = mode_lib->vba.Interlace[k];
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.SurfaceParameters[k].HTotal = mode_lib->vba.HTotal[k];
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.SurfaceParameters[k].DCCEnable = mode_lib->vba.DCCEnable[k];
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.SurfaceParameters[k].SourcePixelFormat = mode_lib->vba.SourcePixelFormat[k];
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.SurfaceParameters[k].SurfaceTiling = mode_lib->vba.SurfaceTiling[k];
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.SurfaceParameters[k].BytePerPixelY = v->BytePerPixelY[k];
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.SurfaceParameters[k].BytePerPixelC = v->BytePerPixelC[k];
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.SurfaceParameters[k].ProgressiveToInterlaceUnitInOPP = mode_lib->vba.ProgressiveToInterlaceUnitInOPP;
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.SurfaceParameters[k].VRatio = mode_lib->vba.VRatio[k];
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.SurfaceParameters[k].VRatioChroma = mode_lib->vba.VRatioChroma[k];
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.SurfaceParameters[k].VTaps = mode_lib->vba.vtaps[k];
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.SurfaceParameters[k].VTapsChroma = mode_lib->vba.VTAPsChroma[k];
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.SurfaceParameters[k].PitchY = mode_lib->vba.PitchY[k];
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.SurfaceParameters[k].DCCMetaPitchY = mode_lib->vba.DCCMetaPitchY[k];
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.SurfaceParameters[k].PitchC = mode_lib->vba.PitchC[k];
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.SurfaceParameters[k].DCCMetaPitchC = mode_lib->vba.DCCMetaPitchC[k];
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.SurfaceParameters[k].ViewportStationary = mode_lib->vba.ViewportStationary[k];
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.SurfaceParameters[k].ViewportXStart = mode_lib->vba.ViewportXStartY[k];
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.SurfaceParameters[k].ViewportYStart = mode_lib->vba.ViewportYStartY[k];
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.SurfaceParameters[k].ViewportXStartC = mode_lib->vba.ViewportXStartC[k];
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.SurfaceParameters[k].ViewportYStartC = mode_lib->vba.ViewportYStartC[k];
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.SurfaceParameters[k].FORCE_ONE_ROW_FOR_FRAME = mode_lib->vba.ForceOneRowForFrame[k];
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.SurfaceParameters[k].SwathHeightY = mode_lib->vba.SwathHeightY[k];
+		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.SurfaceParameters[k].SwathHeightC = mode_lib->vba.SwathHeightC[k];
+	}
+
+	{
+
+		dml32_CalculateVMRowAndSwath(
+				mode_lib->vba.NumberOfActiveSurfaces,
+				v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.SurfaceParameters,
+				v->SurfaceSizeInMALL,
+				mode_lib->vba.PTEBufferSizeInRequestsLuma,
+				mode_lib->vba.PTEBufferSizeInRequestsChroma,
+				mode_lib->vba.DCCMetaBufferSizeBytes,
+				mode_lib->vba.UseMALLForStaticScreen,
+				mode_lib->vba.UsesMALLForPStateChange,
+				mode_lib->vba.MALLAllocatedForDCNFinal,
+				v->SwathWidthY,
+				v->SwathWidthC,
+				mode_lib->vba.GPUVMEnable,
+				mode_lib->vba.HostVMEnable,
+				mode_lib->vba.HostVMMaxNonCachedPageTableLevels,
+				mode_lib->vba.GPUVMMaxPageTableLevels,
+				mode_lib->vba.GPUVMMinPageSizeKBytes,
+				mode_lib->vba.HostVMMinPageSize,
+
+				/* Output */
+				v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_boolean_array2[0],  // Boolean PTEBufferSizeNotExceeded[]
+				v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_boolean_array2[1],  // Boolean DCCMetaBufferSizeNotExceeded[]
+				v->dpte_row_width_luma_ub,
+				v->dpte_row_width_chroma_ub,
+				v->dpte_row_height,
+				v->dpte_row_height_chroma,
+				v->dpte_row_height_linear,
+				v->dpte_row_height_linear_chroma,
+				v->meta_req_width,
+				v->meta_req_width_chroma,
+				v->meta_req_height,
+				v->meta_req_height_chroma,
+				v->meta_row_width,
+				v->meta_row_width_chroma,
+				v->meta_row_height,
+				v->meta_row_height_chroma,
+				v->vm_group_bytes,
+				v->dpte_group_bytes,
+				v->PixelPTEReqWidthY,
+				v->PixelPTEReqHeightY,
+				v->PTERequestSizeY,
+				v->PixelPTEReqWidthC,
+				v->PixelPTEReqHeightC,
+				v->PTERequestSizeC,
+				v->dpde0_bytes_per_frame_ub_l,
+				v->meta_pte_bytes_per_frame_ub_l,
+				v->dpde0_bytes_per_frame_ub_c,
+				v->meta_pte_bytes_per_frame_ub_c,
+				v->PrefetchSourceLinesY,
+				v->PrefetchSourceLinesC,
+				v->VInitPreFillY, v->VInitPreFillC,
+				v->MaxNumSwathY,
+				v->MaxNumSwathC,
+				v->meta_row_bw,
+				v->dpte_row_bw,
+				v->PixelPTEBytesPerRow,
+				v->PDEAndMetaPTEBytesFrame,
+				v->MetaRowByte,
+				v->Use_One_Row_For_Frame,
+				v->Use_One_Row_For_Frame_Flip,
+				v->UsesMALLForStaticScreen,
+				v->PTE_BUFFER_MODE,
+				v->BIGK_FRAGMENT_SIZE);
+	}
+
+
+	v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.ReorderBytes = mode_lib->vba.NumberOfChannels
+			* dml_max3(mode_lib->vba.UrgentOutOfOrderReturnPerChannelPixelDataOnly,
+					mode_lib->vba.UrgentOutOfOrderReturnPerChannelPixelMixedWithVMData,
+					mode_lib->vba.UrgentOutOfOrderReturnPerChannelVMDataOnly);
+
+	v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.VMDataOnlyReturnBW = dml32_get_return_bw_mbps_vm_only(
+			&mode_lib->vba.soc,
+			mode_lib->vba.VoltageLevel,
+			mode_lib->vba.DCFCLK,
+			mode_lib->vba.FabricClock,
+			mode_lib->vba.DRAMSpeed);
+
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: mode_lib->vba.ReturnBusWidth = %f\n", __func__, mode_lib->vba.ReturnBusWidth);
+	dml_print("DML::%s: mode_lib->vba.DCFCLK = %f\n", __func__, mode_lib->vba.DCFCLK);
+	dml_print("DML::%s: mode_lib->vba.FabricClock = %f\n", __func__, mode_lib->vba.FabricClock);
+	dml_print("DML::%s: mode_lib->vba.FabricDatapathToDCNDataReturn = %f\n", __func__,
+			mode_lib->vba.FabricDatapathToDCNDataReturn);
+	dml_print("DML::%s: mode_lib->vba.PercentOfIdealSDPPortBWReceivedAfterUrgLatency = %f\n",
+			__func__, mode_lib->vba.PercentOfIdealSDPPortBWReceivedAfterUrgLatency);
+	dml_print("DML::%s: mode_lib->vba.DRAMSpeed = %f\n", __func__, mode_lib->vba.DRAMSpeed);
+	dml_print("DML::%s: mode_lib->vba.NumberOfChannels = %f\n", __func__, mode_lib->vba.NumberOfChannels);
+	dml_print("DML::%s: mode_lib->vba.DRAMChannelWidth = %f\n", __func__, mode_lib->vba.DRAMChannelWidth);
+	dml_print("DML::%s: mode_lib->vba.PercentOfIdealDRAMBWReceivedAfterUrgLatencyVMDataOnly = %f\n",
+			__func__, mode_lib->vba.PercentOfIdealDRAMBWReceivedAfterUrgLatencyVMDataOnly);
+	dml_print("DML::%s: VMDataOnlyReturnBW = %f\n", __func__, VMDataOnlyReturnBW);
+	dml_print("DML::%s: ReturnBW = %f\n", __func__, mode_lib->vba.ReturnBW);
+#endif
+
+	v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.HostVMInefficiencyFactor = 1.0;
+
+	if (mode_lib->vba.GPUVMEnable && mode_lib->vba.HostVMEnable)
+		v->dummy_vars
+			.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
+			.HostVMInefficiencyFactor =
+			mode_lib->vba.ReturnBW / v->dummy_vars
+				.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
+				.VMDataOnlyReturnBW;
+
+	mode_lib->vba.TotalDCCActiveDPP = 0;
+	mode_lib->vba.TotalActiveDPP = 0;
+	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+		mode_lib->vba.TotalActiveDPP = mode_lib->vba.TotalActiveDPP + mode_lib->vba.DPPPerPlane[k];
+		if (mode_lib->vba.DCCEnable[k])
+			mode_lib->vba.TotalDCCActiveDPP = mode_lib->vba.TotalDCCActiveDPP
+					+ mode_lib->vba.DPPPerPlane[k];
+	}
+
+	v->UrgentExtraLatency = dml32_CalculateExtraLatency(
+			mode_lib->vba.RoundTripPingLatencyCycles,
+			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.ReorderBytes,
+			mode_lib->vba.DCFCLK,
+			mode_lib->vba.TotalActiveDPP,
+			mode_lib->vba.PixelChunkSizeInKByte,
+			mode_lib->vba.TotalDCCActiveDPP,
+			mode_lib->vba.MetaChunkSize,
+			mode_lib->vba.ReturnBW,
+			mode_lib->vba.GPUVMEnable,
+			mode_lib->vba.HostVMEnable,
+			mode_lib->vba.NumberOfActiveSurfaces,
+			mode_lib->vba.DPPPerPlane,
+			v->dpte_group_bytes,
+			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.HostVMInefficiencyFactor,
+			mode_lib->vba.HostVMMinPageSize,
+			mode_lib->vba.HostVMMaxNonCachedPageTableLevels);
+
+	mode_lib->vba.TCalc = 24.0 / v->DCFCLKDeepSleep;
+
+	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+		if (mode_lib->vba.BlendingAndTiming[k] == k) {
+			if (mode_lib->vba.WritebackEnable[k] == true) {
+				v->WritebackDelay[mode_lib->vba.VoltageLevel][k] = mode_lib->vba.WritebackLatency
+						+ dml32_CalculateWriteBackDelay(
+								mode_lib->vba.WritebackPixelFormat[k],
+								mode_lib->vba.WritebackHRatio[k],
+								mode_lib->vba.WritebackVRatio[k],
+								mode_lib->vba.WritebackVTaps[k],
+								mode_lib->vba.WritebackDestinationWidth[k],
+								mode_lib->vba.WritebackDestinationHeight[k],
+								mode_lib->vba.WritebackSourceHeight[k],
+								mode_lib->vba.HTotal[k]) / mode_lib->vba.DISPCLK;
+			} else
+				v->WritebackDelay[mode_lib->vba.VoltageLevel][k] = 0;
+			for (j = 0; j < mode_lib->vba.NumberOfActiveSurfaces; ++j) {
+				if (mode_lib->vba.BlendingAndTiming[j] == k &&
+					mode_lib->vba.WritebackEnable[j] == true) {
+					v->WritebackDelay[mode_lib->vba.VoltageLevel][k] =
+						dml_max(v->WritebackDelay[mode_lib->vba.VoltageLevel][k],
+						mode_lib->vba.WritebackLatency +
+						dml32_CalculateWriteBackDelay(
+								mode_lib->vba.WritebackPixelFormat[j],
+								mode_lib->vba.WritebackHRatio[j],
+								mode_lib->vba.WritebackVRatio[j],
+								mode_lib->vba.WritebackVTaps[j],
+								mode_lib->vba.WritebackDestinationWidth[j],
+								mode_lib->vba.WritebackDestinationHeight[j],
+								mode_lib->vba.WritebackSourceHeight[j],
+								mode_lib->vba.HTotal[k]) / mode_lib->vba.DISPCLK);
+				}
+			}
+		}
+	}
+
+	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k)
+		for (j = 0; j < mode_lib->vba.NumberOfActiveSurfaces; ++j)
+			if (mode_lib->vba.BlendingAndTiming[k] == j)
+				v->WritebackDelay[mode_lib->vba.VoltageLevel][k] =
+						v->WritebackDelay[mode_lib->vba.VoltageLevel][j];
+
+	v->UrgentLatency = dml32_CalculateUrgentLatency(mode_lib->vba.UrgentLatencyPixelDataOnly,
+			mode_lib->vba.UrgentLatencyPixelMixedWithVMData,
+			mode_lib->vba.UrgentLatencyVMDataOnly,
+			mode_lib->vba.DoUrgentLatencyAdjustment,
+			mode_lib->vba.UrgentLatencyAdjustmentFabricClockComponent,
+			mode_lib->vba.UrgentLatencyAdjustmentFabricClockReference,
+			mode_lib->vba.FabricClock);
+
+	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+		dml32_CalculateUrgentBurstFactor(mode_lib->vba.UsesMALLForPStateChange[k],
+				v->swath_width_luma_ub[k],
+				v->swath_width_chroma_ub[k],
+				mode_lib->vba.SwathHeightY[k],
+				mode_lib->vba.SwathHeightC[k],
+				mode_lib->vba.HTotal[k] / mode_lib->vba.PixelClock[k],
+				v->UrgentLatency,
+				mode_lib->vba.CursorBufferSize,
+				mode_lib->vba.CursorWidth[k][0],
+				mode_lib->vba.CursorBPP[k][0],
+				mode_lib->vba.VRatio[k],
+				mode_lib->vba.VRatioChroma[k],
+				v->BytePerPixelDETY[k],
+				v->BytePerPixelDETC[k],
+				mode_lib->vba.DETBufferSizeY[k],
+				mode_lib->vba.DETBufferSizeC[k],
+
+				/* output */
+				&v->UrgBurstFactorCursor[k],
+				&v->UrgBurstFactorLuma[k],
+				&v->UrgBurstFactorChroma[k],
+				&v->NoUrgentLatencyHiding[k]);
+
+		v->cursor_bw[k] = mode_lib->vba.NumberOfCursors[k] * mode_lib->vba.CursorWidth[k][0] * mode_lib->vba.CursorBPP[k][0] / 8 / (mode_lib->vba.HTotal[k] / mode_lib->vba.PixelClock[k]) * mode_lib->vba.VRatio[k];
+	}
+
+	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+		v->MaxVStartupLines[k] = ((mode_lib->vba.Interlace[k] &&
+				!mode_lib->vba.ProgressiveToInterlaceUnitInOPP) ?
+				dml_floor((mode_lib->vba.VTotal[k] - mode_lib->vba.VActive[k]) / 2.0, 1.0) :
+				mode_lib->vba.VTotal[k] - mode_lib->vba.VActive[k]) - dml_max(1.0,
+				dml_ceil((double) v->WritebackDelay[mode_lib->vba.VoltageLevel][k]
+				/ (mode_lib->vba.HTotal[k] / mode_lib->vba.PixelClock[k]), 1));
+
+	// Clamp to max OTG vstartup register limit
+	if (v->MaxVStartupLines[k] > 1023)
+		v->MaxVStartupLines[k] = 1023;
+
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML::%s: k=%d MaxVStartupLines = %d\n", __func__, k, v->MaxVStartupLines[k]);
+		dml_print("DML::%s: k=%d VoltageLevel = %d\n", __func__, k, mode_lib->vba.VoltageLevel);
+		dml_print("DML::%s: k=%d WritebackDelay = %f\n", __func__,
+				k, v->WritebackDelay[mode_lib->vba.VoltageLevel][k]);
+#endif
+	}
+
+	v->MaximumMaxVStartupLines = 0;
+	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k)
+		v->MaximumMaxVStartupLines = dml_max(v->MaximumMaxVStartupLines, v->MaxVStartupLines[k]);
+
+	ImmediateFlipRequirementFinal = false;
+
+	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+		ImmediateFlipRequirementFinal = ImmediateFlipRequirementFinal
+				|| (mode_lib->vba.ImmediateFlipRequirement[k] == dm_immediate_flip_required);
+	}
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: ImmediateFlipRequirementFinal = %d\n", __func__, ImmediateFlipRequirementFinal);
+#endif
+	// ModeProgramming will not repeat the schedule calculation using different prefetch mode,
+	//it is just calcualated once with given prefetch mode
+	dml32_CalculateMinAndMaxPrefetchMode(
+			mode_lib->vba.AllowForPStateChangeOrStutterInVBlankFinal,
+			&mode_lib->vba.MinPrefetchMode,
+			&mode_lib->vba.MaxPrefetchMode);
+
+	v->VStartupLines = __DML_VBA_MIN_VSTARTUP__;
+
+	iteration = 0;
+	MaxTotalRDBandwidth = 0;
+	NextPrefetchMode = mode_lib->vba.PrefetchModePerState[mode_lib->vba.VoltageLevel][mode_lib->vba.maxMpcComb];
+
+	do {
+		double MaxTotalRDBandwidthNoUrgentBurst = 0.0;
+		bool DestinationLineTimesForPrefetchLessThan2 = false;
+		bool VRatioPrefetchMoreThanMax = false;
+		double dummy_unit_vector[DC__NUM_DPP__MAX];
+
+		MaxTotalRDBandwidth = 0;
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML::%s: Start loop: VStartup = %d\n", __func__, mode_lib->vba.VStartupLines);
+#endif
+		for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+			/* NOTE PerfetchMode variable is invalid in DAL as per the input received.
+			 * Hence the direction is to use PrefetchModePerState.
+			 */
+			double TWait = dml32_CalculateTWait(
+					mode_lib->vba.PrefetchModePerState[mode_lib->vba.VoltageLevel][mode_lib->vba.maxMpcComb],
+					mode_lib->vba.UsesMALLForPStateChange[k],
+					mode_lib->vba.SynchronizeDRRDisplaysForUCLKPStateChangeFinal,
+					mode_lib->vba.DRRDisplay[k],
+					mode_lib->vba.DRAMClockChangeLatency,
+					mode_lib->vba.FCLKChangeLatency, v->UrgentLatency,
+					mode_lib->vba.SREnterPlusExitTime);
+
+			DmlPipe myPipe;
+
+			myPipe.Dppclk = mode_lib->vba.DPPCLK[k];
+			myPipe.Dispclk = mode_lib->vba.DISPCLK;
+			myPipe.PixelClock = mode_lib->vba.PixelClock[k];
+			myPipe.DCFClkDeepSleep = v->DCFCLKDeepSleep;
+			myPipe.DPPPerSurface = mode_lib->vba.DPPPerPlane[k];
+			myPipe.ScalerEnabled = mode_lib->vba.ScalerEnabled[k];
+			myPipe.SourceRotation = mode_lib->vba.SourceRotation[k];
+			myPipe.BlockWidth256BytesY = v->BlockWidth256BytesY[k];
+			myPipe.BlockHeight256BytesY = v->BlockHeight256BytesY[k];
+			myPipe.BlockWidth256BytesC = v->BlockWidth256BytesC[k];
+			myPipe.BlockHeight256BytesC = v->BlockHeight256BytesC[k];
+			myPipe.InterlaceEnable = mode_lib->vba.Interlace[k];
+			myPipe.NumberOfCursors = mode_lib->vba.NumberOfCursors[k];
+			myPipe.VBlank = mode_lib->vba.VTotal[k] - mode_lib->vba.VActive[k];
+			myPipe.HTotal = mode_lib->vba.HTotal[k];
+			myPipe.HActive = mode_lib->vba.HActive[k];
+			myPipe.DCCEnable = mode_lib->vba.DCCEnable[k];
+			myPipe.ODMMode = mode_lib->vba.ODMCombineEnabled[k];
+			myPipe.SourcePixelFormat = mode_lib->vba.SourcePixelFormat[k];
+			myPipe.BytePerPixelY = v->BytePerPixelY[k];
+			myPipe.BytePerPixelC = v->BytePerPixelC[k];
+			myPipe.ProgressiveToInterlaceUnitInOPP = mode_lib->vba.ProgressiveToInterlaceUnitInOPP;
+			v->ErrorResult[k] = dml32_CalculatePrefetchSchedule(v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.HostVMInefficiencyFactor,
+					&myPipe, v->DSCDelay[k],
+					mode_lib->vba.DPPCLKDelaySubtotal + mode_lib->vba.DPPCLKDelayCNVCFormater,
+					mode_lib->vba.DPPCLKDelaySCL,
+					mode_lib->vba.DPPCLKDelaySCLLBOnly,
+					mode_lib->vba.DPPCLKDelayCNVCCursor,
+					mode_lib->vba.DISPCLKDelaySubtotal,
+					(unsigned int) (v->SwathWidthY[k] / mode_lib->vba.HRatio[k]),
+					mode_lib->vba.OutputFormat[k],
+					mode_lib->vba.MaxInterDCNTileRepeaters,
+					dml_min(v->VStartupLines, v->MaxVStartupLines[k]),
+					v->MaxVStartupLines[k],
+					mode_lib->vba.GPUVMMaxPageTableLevels,
+					mode_lib->vba.GPUVMEnable,
+					mode_lib->vba.HostVMEnable,
+					mode_lib->vba.HostVMMaxNonCachedPageTableLevels,
+					mode_lib->vba.HostVMMinPageSize,
+					mode_lib->vba.DynamicMetadataEnable[k],
+					mode_lib->vba.DynamicMetadataVMEnabled,
+					mode_lib->vba.DynamicMetadataLinesBeforeActiveRequired[k],
+					mode_lib->vba.DynamicMetadataTransmittedBytes[k],
+					v->UrgentLatency,
+					v->UrgentExtraLatency,
+					mode_lib->vba.TCalc,
+					v->PDEAndMetaPTEBytesFrame[k],
+					v->MetaRowByte[k],
+					v->PixelPTEBytesPerRow[k],
+					v->PrefetchSourceLinesY[k],
+					v->SwathWidthY[k],
+					v->VInitPreFillY[k],
+					v->MaxNumSwathY[k],
+					v->PrefetchSourceLinesC[k],
+					v->SwathWidthC[k],
+					v->VInitPreFillC[k],
+					v->MaxNumSwathC[k],
+					v->swath_width_luma_ub[k],
+					v->swath_width_chroma_ub[k],
+					mode_lib->vba.SwathHeightY[k],
+					mode_lib->vba.SwathHeightC[k],
+					TWait,
+					/* Output */
+					&v->DSTXAfterScaler[k],
+					&v->DSTYAfterScaler[k],
+					&v->DestinationLinesForPrefetch[k],
+					&v->PrefetchBandwidth[k],
+					&v->DestinationLinesToRequestVMInVBlank[k],
+					&v->DestinationLinesToRequestRowInVBlank[k],
+					&v->VRatioPrefetchY[k],
+					&v->VRatioPrefetchC[k],
+					&v->RequiredPrefetchPixDataBWLuma[k],
+					&v->RequiredPrefetchPixDataBWChroma[k],
+					&v->NotEnoughTimeForDynamicMetadata[k],
+					&v->Tno_bw[k], &v->prefetch_vmrow_bw[k],
+					&v->Tdmdl_vm[k],
+					&v->Tdmdl[k],
+					&v->TSetup[k],
+					&v->VUpdateOffsetPix[k],
+					&v->VUpdateWidthPix[k],
+					&v->VReadyOffsetPix[k]);
+
+#ifdef __DML_VBA_DEBUG__
+			dml_print("DML::%s: k=%0d Prefetch calculation errResult=%0d\n",
+					__func__, k, mode_lib->vba.ErrorResult[k]);
+#endif
+			v->VStartup[k] = dml_min(v->VStartupLines, v->MaxVStartupLines[k]);
+		}
+
+		for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+			dml32_CalculateUrgentBurstFactor(mode_lib->vba.UsesMALLForPStateChange[k],
+					v->swath_width_luma_ub[k],
+					v->swath_width_chroma_ub[k],
+					mode_lib->vba.SwathHeightY[k],
+					mode_lib->vba.SwathHeightC[k],
+					mode_lib->vba.HTotal[k] / mode_lib->vba.PixelClock[k],
+					v->UrgentLatency,
+					mode_lib->vba.CursorBufferSize,
+					mode_lib->vba.CursorWidth[k][0],
+					mode_lib->vba.CursorBPP[k][0],
+					v->VRatioPrefetchY[k],
+					v->VRatioPrefetchC[k],
+					v->BytePerPixelDETY[k],
+					v->BytePerPixelDETC[k],
+					mode_lib->vba.DETBufferSizeY[k],
+					mode_lib->vba.DETBufferSizeC[k],
+					/* Output */
+					&v->UrgBurstFactorCursorPre[k],
+					&v->UrgBurstFactorLumaPre[k],
+					&v->UrgBurstFactorChromaPre[k],
+					&v->NoUrgentLatencyHidingPre[k]);
+
+			v->cursor_bw_pre[k] = mode_lib->vba.NumberOfCursors[k] * mode_lib->vba.CursorWidth[k][0] * mode_lib->vba.CursorBPP[k][0] /
+					8.0 / (mode_lib->vba.HTotal[k] / mode_lib->vba.PixelClock[k]) * v->VRatioPrefetchY[k];
+
+#ifdef __DML_VBA_DEBUG__
+			dml_print("DML::%s: k=%0d DPPPerSurface=%d\n", __func__, k, mode_lib->vba.DPPPerPlane[k]);
+			dml_print("DML::%s: k=%0d UrgBurstFactorLuma=%f\n", __func__, k, v->UrgBurstFactorLuma[k]);
+			dml_print("DML::%s: k=%0d UrgBurstFactorChroma=%f\n", __func__, k, v->UrgBurstFactorChroma[k]);
+			dml_print("DML::%s: k=%0d UrgBurstFactorLumaPre=%f\n", __func__, k,
+					v->UrgBurstFactorLumaPre[k]);
+			dml_print("DML::%s: k=%0d UrgBurstFactorChromaPre=%f\n", __func__, k,
+					v->UrgBurstFactorChromaPre[k]);
+
+			dml_print("DML::%s: k=%0d VRatioPrefetchY=%f\n", __func__, k, v->VRatioPrefetchY[k]);
+			dml_print("DML::%s: k=%0d VRatioY=%f\n", __func__, k, mode_lib->vba.VRatio[k]);
+
+			dml_print("DML::%s: k=%0d prefetch_vmrow_bw=%f\n", __func__, k, v->prefetch_vmrow_bw[k]);
+			dml_print("DML::%s: k=%0d ReadBandwidthSurfaceLuma=%f\n", __func__, k,
+					v->ReadBandwidthSurfaceLuma[k]);
+			dml_print("DML::%s: k=%0d ReadBandwidthSurfaceChroma=%f\n", __func__, k,
+					v->ReadBandwidthSurfaceChroma[k]);
+			dml_print("DML::%s: k=%0d cursor_bw=%f\n", __func__, k, v->cursor_bw[k]);
+			dml_print("DML::%s: k=%0d meta_row_bw=%f\n", __func__, k, v->meta_row_bw[k]);
+			dml_print("DML::%s: k=%0d dpte_row_bw=%f\n", __func__, k, v->dpte_row_bw[k]);
+			dml_print("DML::%s: k=%0d RequiredPrefetchPixDataBWLuma=%f\n", __func__, k,
+					v->RequiredPrefetchPixDataBWLuma[k]);
+			dml_print("DML::%s: k=%0d RequiredPrefetchPixDataBWChroma=%f\n", __func__, k,
+					v->RequiredPrefetchPixDataBWChroma[k]);
+			dml_print("DML::%s: k=%0d cursor_bw_pre=%f\n", __func__, k, v->cursor_bw_pre[k]);
+			dml_print("DML::%s: k=%0d MaxTotalRDBandwidthNoUrgentBurst=%f\n", __func__, k,
+					MaxTotalRDBandwidthNoUrgentBurst);
+#endif
+			if (v->DestinationLinesForPrefetch[k] < 2)
+				DestinationLineTimesForPrefetchLessThan2 = true;
+
+			if (v->VRatioPrefetchY[k] > __DML_MAX_VRATIO_PRE__
+					|| v->VRatioPrefetchC[k] > __DML_MAX_VRATIO_PRE__)
+				VRatioPrefetchMoreThanMax = true;
+
+			//bool DestinationLinesToRequestVMInVBlankEqualOrMoreThan32 = false;
+			//bool DestinationLinesToRequestRowInVBlankEqualOrMoreThan16 = false;
+			//if (v->DestinationLinesToRequestVMInVBlank[k] >= 32) {
+			//    DestinationLinesToRequestVMInVBlankEqualOrMoreThan32 = true;
+			//}
+
+			//if (v->DestinationLinesToRequestRowInVBlank[k] >= 16) {
+			//    DestinationLinesToRequestRowInVBlankEqualOrMoreThan16 = true;
+			//}
+		}
+
+		v->FractionOfUrgentBandwidth = MaxTotalRDBandwidthNoUrgentBurst / mode_lib->vba.ReturnBW;
+
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML::%s: MaxTotalRDBandwidthNoUrgentBurst=%f\n",
+				__func__, MaxTotalRDBandwidthNoUrgentBurst);
+		dml_print("DML::%s: ReturnBW=%f\n", __func__, mode_lib->vba.ReturnBW);
+		dml_print("DML::%s: FractionOfUrgentBandwidth=%f\n",
+				__func__, mode_lib->vba.FractionOfUrgentBandwidth);
+#endif
+
+		{
+			double dummy_single[1];
+
+			dml32_CalculatePrefetchBandwithSupport(
+					mode_lib->vba.NumberOfActiveSurfaces,
+					mode_lib->vba.ReturnBW,
+					v->NoUrgentLatencyHidingPre,
+					v->ReadBandwidthSurfaceLuma,
+					v->ReadBandwidthSurfaceChroma,
+					v->RequiredPrefetchPixDataBWLuma,
+					v->RequiredPrefetchPixDataBWChroma,
+					v->cursor_bw,
+					v->meta_row_bw,
+					v->dpte_row_bw,
+					v->cursor_bw_pre,
+					v->prefetch_vmrow_bw,
+					mode_lib->vba.DPPPerPlane,
+					v->UrgBurstFactorLuma,
+					v->UrgBurstFactorChroma,
+					v->UrgBurstFactorCursor,
+					v->UrgBurstFactorLumaPre,
+					v->UrgBurstFactorChromaPre,
+					v->UrgBurstFactorCursorPre,
+
+					/* output */
+					&MaxTotalRDBandwidth,
+					&dummy_single[0],
+					&v->PrefetchModeSupported);
+		}
+
+		for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k)
+			dummy_unit_vector[k] = 1.0;
+
+		{
+			double  dummy_single[1];
+			bool dummy_boolean[1];
+			dml32_CalculatePrefetchBandwithSupport(mode_lib->vba.NumberOfActiveSurfaces,
+					mode_lib->vba.ReturnBW,
+					v->NoUrgentLatencyHidingPre,
+					v->ReadBandwidthSurfaceLuma,
+					v->ReadBandwidthSurfaceChroma,
+					v->RequiredPrefetchPixDataBWLuma,
+					v->RequiredPrefetchPixDataBWChroma,
+					v->cursor_bw,
+					v->meta_row_bw,
+					v->dpte_row_bw,
+					v->cursor_bw_pre,
+					v->prefetch_vmrow_bw,
+					mode_lib->vba.DPPPerPlane,
+					dummy_unit_vector,
+					dummy_unit_vector,
+					dummy_unit_vector,
+					dummy_unit_vector,
+					dummy_unit_vector,
+					dummy_unit_vector,
+
+					/* output */
+					&dummy_single[0],
+					&v->FractionOfUrgentBandwidth,
+					&dummy_boolean[0]);
+		}
+
+		if (VRatioPrefetchMoreThanMax != false || DestinationLineTimesForPrefetchLessThan2 != false) {
+			v->PrefetchModeSupported = false;
+		}
+
+		for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+			if (v->ErrorResult[k] == true || v->NotEnoughTimeForDynamicMetadata[k]) {
+				v->PrefetchModeSupported = false;
+			}
+		}
+
+		if (v->PrefetchModeSupported == true && mode_lib->vba.ImmediateFlipSupport == true) {
+			mode_lib->vba.BandwidthAvailableForImmediateFlip = dml32_CalculateBandwidthAvailableForImmediateFlip(
+					mode_lib->vba.NumberOfActiveSurfaces,
+					mode_lib->vba.ReturnBW,
+					v->ReadBandwidthSurfaceLuma,
+					v->ReadBandwidthSurfaceChroma,
+					v->RequiredPrefetchPixDataBWLuma,
+					v->RequiredPrefetchPixDataBWChroma,
+					v->cursor_bw,
+					v->cursor_bw_pre,
+					mode_lib->vba.DPPPerPlane,
+					v->UrgBurstFactorLuma,
+					v->UrgBurstFactorChroma,
+					v->UrgBurstFactorCursor,
+					v->UrgBurstFactorLumaPre,
+					v->UrgBurstFactorChromaPre,
+					v->UrgBurstFactorCursorPre);
+
+			mode_lib->vba.TotImmediateFlipBytes = 0;
+			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+				if (mode_lib->vba.ImmediateFlipRequirement[k] != dm_immediate_flip_not_required) {
+					mode_lib->vba.TotImmediateFlipBytes = mode_lib->vba.TotImmediateFlipBytes
+							+ mode_lib->vba.DPPPerPlane[k]
+									* (v->PDEAndMetaPTEBytesFrame[k]
+											+ v->MetaRowByte[k]);
+					if (v->use_one_row_for_frame_flip[k]) {
+						mode_lib->vba.TotImmediateFlipBytes =
+								mode_lib->vba.TotImmediateFlipBytes
+										+ 2 * v->PixelPTEBytesPerRow[k];
+					} else {
+						mode_lib->vba.TotImmediateFlipBytes =
+								mode_lib->vba.TotImmediateFlipBytes
+										+ v->PixelPTEBytesPerRow[k];
+					}
+				}
+			}
+			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+				dml32_CalculateFlipSchedule(v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.HostVMInefficiencyFactor,
+						v->UrgentExtraLatency,
+						v->UrgentLatency,
+						mode_lib->vba.GPUVMMaxPageTableLevels,
+						mode_lib->vba.HostVMEnable,
+						mode_lib->vba.HostVMMaxNonCachedPageTableLevels,
+						mode_lib->vba.GPUVMEnable,
+						mode_lib->vba.HostVMMinPageSize,
+						v->PDEAndMetaPTEBytesFrame[k],
+						v->MetaRowByte[k],
+						v->PixelPTEBytesPerRow[k],
+						mode_lib->vba.BandwidthAvailableForImmediateFlip,
+						mode_lib->vba.TotImmediateFlipBytes,
+						mode_lib->vba.SourcePixelFormat[k],
+						mode_lib->vba.HTotal[k] / mode_lib->vba.PixelClock[k],
+						mode_lib->vba.VRatio[k],
+						mode_lib->vba.VRatioChroma[k],
+						v->Tno_bw[k],
+						mode_lib->vba.DCCEnable[k],
+						v->dpte_row_height[k],
+						v->meta_row_height[k],
+						v->dpte_row_height_chroma[k],
+						v->meta_row_height_chroma[k],
+						v->Use_One_Row_For_Frame_Flip[k],
+
+						/* Output */
+						&v->DestinationLinesToRequestVMInImmediateFlip[k],
+						&v->DestinationLinesToRequestRowInImmediateFlip[k],
+						&v->final_flip_bw[k],
+						&v->ImmediateFlipSupportedForPipe[k]);
+			}
+
+			{
+				double  dummy_single[2];
+				bool dummy_boolean[1];
+				dml32_CalculateImmediateFlipBandwithSupport(mode_lib->vba.NumberOfActiveSurfaces,
+						mode_lib->vba.ReturnBW,
+						mode_lib->vba.ImmediateFlipRequirement,
+						v->final_flip_bw,
+						v->ReadBandwidthSurfaceLuma,
+						v->ReadBandwidthSurfaceChroma,
+						v->RequiredPrefetchPixDataBWLuma,
+						v->RequiredPrefetchPixDataBWChroma,
+						v->cursor_bw,
+						v->meta_row_bw,
+						v->dpte_row_bw,
+						v->cursor_bw_pre,
+						v->prefetch_vmrow_bw,
+						mode_lib->vba.DPPPerPlane,
+						v->UrgBurstFactorLuma,
+						v->UrgBurstFactorChroma,
+						v->UrgBurstFactorCursor,
+						v->UrgBurstFactorLumaPre,
+						v->UrgBurstFactorChromaPre,
+						v->UrgBurstFactorCursorPre,
+
+						/* output */
+						&v->total_dcn_read_bw_with_flip,    // Single  *TotalBandwidth
+						&dummy_single[0],                        // Single  *FractionOfUrgentBandwidth
+						&v->ImmediateFlipSupported);        // Boolean *ImmediateFlipBandwidthSupport
+
+				dml32_CalculateImmediateFlipBandwithSupport(mode_lib->vba.NumberOfActiveSurfaces,
+						mode_lib->vba.ReturnBW,
+						mode_lib->vba.ImmediateFlipRequirement,
+						v->final_flip_bw,
+						v->ReadBandwidthSurfaceLuma,
+						v->ReadBandwidthSurfaceChroma,
+						v->RequiredPrefetchPixDataBWLuma,
+						v->RequiredPrefetchPixDataBWChroma,
+						v->cursor_bw,
+						v->meta_row_bw,
+						v->dpte_row_bw,
+						v->cursor_bw_pre,
+						v->prefetch_vmrow_bw,
+						mode_lib->vba.DPPPerPlane,
+						dummy_unit_vector,
+						dummy_unit_vector,
+						dummy_unit_vector,
+						dummy_unit_vector,
+						dummy_unit_vector,
+						dummy_unit_vector,
+
+						/* output */
+						&dummy_single[1],                                // Single  *TotalBandwidth
+						&v->FractionOfUrgentBandwidthImmediateFlip, // Single  *FractionOfUrgentBandwidth
+						&dummy_boolean[0]);                              // Boolean *ImmediateFlipBandwidthSupport
+			}
+
+			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+				if (mode_lib->vba.ImmediateFlipRequirement[k] != dm_immediate_flip_not_required && v->ImmediateFlipSupportedForPipe[k] == false) {
+					v->ImmediateFlipSupported = false;
+#ifdef __DML_VBA_DEBUG__
+					dml_print("DML::%s: Pipe %0d not supporing iflip\n", __func__, k);
+#endif
+				}
+			}
+		} else {
+			v->ImmediateFlipSupported = false;
+		}
+
+		/* consider flip support is okay if the flip bw is ok or (when user does't require a iflip and there is no host vm) */
+		v->PrefetchAndImmediateFlipSupported = (v->PrefetchModeSupported == true &&
+				((!mode_lib->vba.ImmediateFlipSupport && !mode_lib->vba.HostVMEnable && !ImmediateFlipRequirementFinal) ||
+						v->ImmediateFlipSupported)) ? true : false;
+
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML::%s: PrefetchModeSupported = %d\n", __func__, locals->PrefetchModeSupported);
+		for (uint k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k)
+			dml_print("DML::%s: ImmediateFlipRequirement[%d] = %d\n", __func__, k,  mode_lib->vba.ImmediateFlipRequirement[k] == dm_immediate_flip_required);
+		dml_print("DML::%s: ImmediateFlipSupported = %d\n", __func__, locals->ImmediateFlipSupported);
+		dml_print("DML::%s: ImmediateFlipSupport = %d\n", __func__, mode_lib->vba.ImmediateFlipSupport);
+		dml_print("DML::%s: HostVMEnable = %d\n", __func__, mode_lib->vba.HostVMEnable);
+		dml_print("DML::%s: PrefetchAndImmediateFlipSupported = %d\n", __func__, locals->PrefetchAndImmediateFlipSupported);
+		dml_print("DML::%s: Done loop: Vstartup=%d, Max Vstartup=%d\n", __func__, locals->VStartupLines, locals->MaximumMaxVStartupLines);
+#endif
+
+		v->VStartupLines = v->VStartupLines + 1;
+
+		if (v->VStartupLines > v->MaximumMaxVStartupLines) {
+#ifdef __DML_VBA_DEBUG__
+			dml_print("DML::%s: Vstartup exceeds max vstartup, exiting loop\n", __func__);
+#endif
+			break; // VBA_DELTA: Implementation divergence! Gabe is *still* iterating across prefetch modes which we don't care to do
+		}
+		iteration++;
+		if (iteration > 2500) {
+#ifdef __DML_VBA_DEBUG__
+			dml_print("DML::%s: too many errors, exit now\n", __func__);
+			assert(0);
+#endif
+		}
+	} while (!(v->PrefetchAndImmediateFlipSupported || NextPrefetchMode > mode_lib->vba.MaxPrefetchMode));
+
+
+	if (v->VStartupLines <= v->MaximumMaxVStartupLines) {
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML::%s: Good, Prefetch and flip scheduling found solution at VStartupLines=%d\n", __func__, locals->VStartupLines-1);
+#endif
+	}
+
+
+	//Watermarks and NB P-State/DRAM Clock Change Support
+	{
+		SOCParametersList mmSOCParameters;
+		enum clock_change_support dummy_dramchange_support;
+		enum dm_fclock_change_support dummy_fclkchange_support;
+		bool dummy_USRRetrainingSupport;
+
+		mmSOCParameters.UrgentLatency = v->UrgentLatency;
+		mmSOCParameters.ExtraLatency = v->UrgentExtraLatency;
+		mmSOCParameters.WritebackLatency = mode_lib->vba.WritebackLatency;
+		mmSOCParameters.DRAMClockChangeLatency = mode_lib->vba.DRAMClockChangeLatency;
+		mmSOCParameters.FCLKChangeLatency = mode_lib->vba.FCLKChangeLatency;
+		mmSOCParameters.SRExitTime = mode_lib->vba.SRExitTime;
+		mmSOCParameters.SREnterPlusExitTime = mode_lib->vba.SREnterPlusExitTime;
+		mmSOCParameters.SRExitZ8Time = mode_lib->vba.SRExitZ8Time;
+		mmSOCParameters.SREnterPlusExitZ8Time = mode_lib->vba.SREnterPlusExitZ8Time;
+		mmSOCParameters.USRRetrainingLatency = mode_lib->vba.USRRetrainingLatency;
+		mmSOCParameters.SMNLatency = mode_lib->vba.SMNLatency;
+
+		dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
+			mode_lib->vba.USRRetrainingRequiredFinal,
+			mode_lib->vba.UsesMALLForPStateChange,
+			mode_lib->vba.PrefetchModePerState[mode_lib->vba.VoltageLevel][mode_lib->vba.maxMpcComb],
+			mode_lib->vba.NumberOfActiveSurfaces,
+			mode_lib->vba.MaxLineBufferLines,
+			mode_lib->vba.LineBufferSizeFinal,
+			mode_lib->vba.WritebackInterfaceBufferSize,
+			mode_lib->vba.DCFCLK,
+			mode_lib->vba.ReturnBW,
+			mode_lib->vba.SynchronizeTimingsFinal,
+			mode_lib->vba.SynchronizeDRRDisplaysForUCLKPStateChangeFinal,
+			mode_lib->vba.DRRDisplay,
+			v->dpte_group_bytes,
+			v->meta_row_height,
+			v->meta_row_height_chroma,
+			mmSOCParameters,
+			mode_lib->vba.WritebackChunkSize,
+			mode_lib->vba.SOCCLK,
+			v->DCFCLKDeepSleep,
+			mode_lib->vba.DETBufferSizeY,
+			mode_lib->vba.DETBufferSizeC,
+			mode_lib->vba.SwathHeightY,
+			mode_lib->vba.SwathHeightC,
+			mode_lib->vba.LBBitPerPixel,
+			v->SwathWidthY,
+			v->SwathWidthC,
+			mode_lib->vba.HRatio,
+			mode_lib->vba.HRatioChroma,
+			mode_lib->vba.vtaps,
+			mode_lib->vba.VTAPsChroma,
+			mode_lib->vba.VRatio,
+			mode_lib->vba.VRatioChroma,
+			mode_lib->vba.HTotal,
+			mode_lib->vba.VTotal,
+			mode_lib->vba.VActive,
+			mode_lib->vba.PixelClock,
+			mode_lib->vba.BlendingAndTiming,
+			mode_lib->vba.DPPPerPlane,
+			v->BytePerPixelDETY,
+			v->BytePerPixelDETC,
+			v->DSTXAfterScaler,
+			v->DSTYAfterScaler,
+			mode_lib->vba.WritebackEnable,
+			mode_lib->vba.WritebackPixelFormat,
+			mode_lib->vba.WritebackDestinationWidth,
+			mode_lib->vba.WritebackDestinationHeight,
+			mode_lib->vba.WritebackSourceHeight,
+			v->UnboundedRequestEnabled,
+			v->CompressedBufferSizeInkByte,
+
+			/* Output */
+			&v->Watermark,
+			&dummy_dramchange_support,
+			v->MaxActiveDRAMClockChangeLatencySupported,
+			v->SubViewportLinesNeededInMALL,
+			&dummy_fclkchange_support,
+			&v->MinActiveFCLKChangeLatencySupported,
+			&dummy_USRRetrainingSupport,
+			mode_lib->vba.ActiveDRAMClockChangeLatencyMargin);
+
+		/* DCN32 has a new struct Watermarks (typedef) which is used to store
+		 * calculated WM values. Copy over values from struct to vba varaibles
+		 * to ensure that the DCN32 getters return the correct value.
+		 */
+		v->UrgentWatermark = v->Watermark.UrgentWatermark;
+		v->WritebackUrgentWatermark = v->Watermark.WritebackUrgentWatermark;
+		v->DRAMClockChangeWatermark = v->Watermark.DRAMClockChangeWatermark;
+		v->WritebackDRAMClockChangeWatermark = v->Watermark.WritebackDRAMClockChangeWatermark;
+		v->StutterExitWatermark = v->Watermark.StutterExitWatermark;
+		v->StutterEnterPlusExitWatermark = v->Watermark.StutterEnterPlusExitWatermark;
+		v->Z8StutterExitWatermark = v->Watermark.Z8StutterExitWatermark;
+		v->Z8StutterEnterPlusExitWatermark = v->Watermark.Z8StutterEnterPlusExitWatermark;
+
+		for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+			if (mode_lib->vba.WritebackEnable[k] == true) {
+				v->WritebackAllowDRAMClockChangeEndPosition[k] = dml_max(0,
+						v->VStartup[k] * mode_lib->vba.HTotal[k] / mode_lib->vba.PixelClock[k]
+								- v->Watermark.WritebackDRAMClockChangeWatermark);
+				v->WritebackAllowFCLKChangeEndPosition[k] = dml_max(0,
+						v->VStartup[k] * mode_lib->vba.HTotal[k] / mode_lib->vba.PixelClock[k]
+								- v->Watermark.WritebackFCLKChangeWatermark);
+			} else {
+				v->WritebackAllowDRAMClockChangeEndPosition[k] = 0;
+				v->WritebackAllowFCLKChangeEndPosition[k] = 0;
+			}
+		}
+	}
+
+	//Display Pipeline Delivery Time in Prefetch, Groups
+	dml32_CalculatePixelDeliveryTimes(
+			mode_lib->vba.NumberOfActiveSurfaces,
+			mode_lib->vba.VRatio,
+			mode_lib->vba.VRatioChroma,
+			v->VRatioPrefetchY,
+			v->VRatioPrefetchC,
+			v->swath_width_luma_ub,
+			v->swath_width_chroma_ub,
+			mode_lib->vba.DPPPerPlane,
+			mode_lib->vba.HRatio,
+			mode_lib->vba.HRatioChroma,
+			mode_lib->vba.PixelClock,
+			v->PSCL_THROUGHPUT_LUMA,
+			v->PSCL_THROUGHPUT_CHROMA,
+			mode_lib->vba.DPPCLK,
+			v->BytePerPixelC,
+			mode_lib->vba.SourceRotation,
+			mode_lib->vba.NumberOfCursors,
+			mode_lib->vba.CursorWidth,
+			mode_lib->vba.CursorBPP,
+			v->BlockWidth256BytesY,
+			v->BlockHeight256BytesY,
+			v->BlockWidth256BytesC,
+			v->BlockHeight256BytesC,
+
+			/* Output */
+			v->DisplayPipeLineDeliveryTimeLuma,
+			v->DisplayPipeLineDeliveryTimeChroma,
+			v->DisplayPipeLineDeliveryTimeLumaPrefetch,
+			v->DisplayPipeLineDeliveryTimeChromaPrefetch,
+			v->DisplayPipeRequestDeliveryTimeLuma,
+			v->DisplayPipeRequestDeliveryTimeChroma,
+			v->DisplayPipeRequestDeliveryTimeLumaPrefetch,
+			v->DisplayPipeRequestDeliveryTimeChromaPrefetch,
+			v->CursorRequestDeliveryTime,
+			v->CursorRequestDeliveryTimePrefetch);
+
+	dml32_CalculateMetaAndPTETimes(v->Use_One_Row_For_Frame,
+			mode_lib->vba.NumberOfActiveSurfaces,
+			mode_lib->vba.GPUVMEnable,
+			mode_lib->vba.MetaChunkSize,
+			mode_lib->vba.MinMetaChunkSizeBytes,
+			mode_lib->vba.HTotal,
+			mode_lib->vba.VRatio,
+			mode_lib->vba.VRatioChroma,
+			v->DestinationLinesToRequestRowInVBlank,
+			v->DestinationLinesToRequestRowInImmediateFlip,
+			mode_lib->vba.DCCEnable,
+			mode_lib->vba.PixelClock,
+			v->BytePerPixelY,
+			v->BytePerPixelC,
+			mode_lib->vba.SourceRotation,
+			v->dpte_row_height,
+			v->dpte_row_height_chroma,
+			v->meta_row_width,
+			v->meta_row_width_chroma,
+			v->meta_row_height,
+			v->meta_row_height_chroma,
+			v->meta_req_width,
+			v->meta_req_width_chroma,
+			v->meta_req_height,
+			v->meta_req_height_chroma,
+			v->dpte_group_bytes,
+			v->PTERequestSizeY,
+			v->PTERequestSizeC,
+			v->PixelPTEReqWidthY,
+			v->PixelPTEReqHeightY,
+			v->PixelPTEReqWidthC,
+			v->PixelPTEReqHeightC,
+			v->dpte_row_width_luma_ub,
+			v->dpte_row_width_chroma_ub,
+
+			/* Output */
+			v->DST_Y_PER_PTE_ROW_NOM_L,
+			v->DST_Y_PER_PTE_ROW_NOM_C,
+			v->DST_Y_PER_META_ROW_NOM_L,
+			v->DST_Y_PER_META_ROW_NOM_C,
+			v->TimePerMetaChunkNominal,
+			v->TimePerChromaMetaChunkNominal,
+			v->TimePerMetaChunkVBlank,
+			v->TimePerChromaMetaChunkVBlank,
+			v->TimePerMetaChunkFlip,
+			v->TimePerChromaMetaChunkFlip,
+			v->time_per_pte_group_nom_luma,
+			v->time_per_pte_group_vblank_luma,
+			v->time_per_pte_group_flip_luma,
+			v->time_per_pte_group_nom_chroma,
+			v->time_per_pte_group_vblank_chroma,
+			v->time_per_pte_group_flip_chroma);
+
+	dml32_CalculateVMGroupAndRequestTimes(
+			mode_lib->vba.NumberOfActiveSurfaces,
+			mode_lib->vba.GPUVMEnable,
+			mode_lib->vba.GPUVMMaxPageTableLevels,
+			mode_lib->vba.HTotal,
+			v->BytePerPixelC,
+			v->DestinationLinesToRequestVMInVBlank,
+			v->DestinationLinesToRequestVMInImmediateFlip,
+			mode_lib->vba.DCCEnable,
+			mode_lib->vba.PixelClock,
+			v->dpte_row_width_luma_ub,
+			v->dpte_row_width_chroma_ub,
+			v->vm_group_bytes,
+			v->dpde0_bytes_per_frame_ub_l,
+			v->dpde0_bytes_per_frame_ub_c,
+			v->meta_pte_bytes_per_frame_ub_l,
+			v->meta_pte_bytes_per_frame_ub_c,
+
+			/* Output */
+			v->TimePerVMGroupVBlank,
+			v->TimePerVMGroupFlip,
+			v->TimePerVMRequestVBlank,
+			v->TimePerVMRequestFlip);
+
+	// Min TTUVBlank
+	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+		if (mode_lib->vba.PrefetchModePerState[mode_lib->vba.VoltageLevel][mode_lib->vba.maxMpcComb] == 0) {
+			v->MinTTUVBlank[k] = dml_max4(v->Watermark.DRAMClockChangeWatermark,
+					v->Watermark.FCLKChangeWatermark, v->Watermark.StutterEnterPlusExitWatermark,
+					v->Watermark.UrgentWatermark);
+		} else if (mode_lib->vba.PrefetchModePerState[mode_lib->vba.VoltageLevel][mode_lib->vba.maxMpcComb]
+				== 1) {
+			v->MinTTUVBlank[k] = dml_max3(v->Watermark.FCLKChangeWatermark,
+					v->Watermark.StutterEnterPlusExitWatermark, v->Watermark.UrgentWatermark);
+		} else if (mode_lib->vba.PrefetchModePerState[mode_lib->vba.VoltageLevel][mode_lib->vba.maxMpcComb]
+				== 2) {
+			v->MinTTUVBlank[k] = dml_max(v->Watermark.StutterEnterPlusExitWatermark,
+					v->Watermark.UrgentWatermark);
+		} else {
+			v->MinTTUVBlank[k] = v->Watermark.UrgentWatermark;
+		}
+		if (!mode_lib->vba.DynamicMetadataEnable[k])
+			v->MinTTUVBlank[k] = mode_lib->vba.TCalc + v->MinTTUVBlank[k];
+	}
+
+	// DCC Configuration
+	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML::%s: Calculate DCC configuration for surface k=%d\n", __func__, k);
+#endif
+		dml32_CalculateDCCConfiguration(
+				mode_lib->vba.DCCEnable[k],
+				mode_lib->vba.DCCProgrammingAssumesScanDirectionUnknownFinal,
+				mode_lib->vba.SourcePixelFormat[k], mode_lib->vba.SurfaceWidthY[k],
+				mode_lib->vba.SurfaceWidthC[k],
+				mode_lib->vba.SurfaceHeightY[k],
+				mode_lib->vba.SurfaceHeightC[k],
+				mode_lib->vba.nomDETInKByte,
+				v->BlockHeight256BytesY[k],
+				v->BlockHeight256BytesC[k],
+				mode_lib->vba.SurfaceTiling[k],
+				v->BytePerPixelY[k],
+				v->BytePerPixelC[k],
+				v->BytePerPixelDETY[k],
+				v->BytePerPixelDETC[k],
+				mode_lib->vba.SourceScan[k],
+				/* Output */
+				&v->DCCYMaxUncompressedBlock[k],
+				&v->DCCCMaxUncompressedBlock[k],
+				&v->DCCYMaxCompressedBlock[k],
+				&v->DCCCMaxCompressedBlock[k],
+				&v->DCCYIndependentBlock[k],
+				&v->DCCCIndependentBlock[k]);
+	}
+
+	// VStartup Adjustment
+	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+		bool isInterlaceTiming;
+		double Tvstartup_margin = (v->MaxVStartupLines[k] - v->VStartup[k]) * mode_lib->vba.HTotal[k]
+				/ mode_lib->vba.PixelClock[k];
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML::%s: k=%d, MinTTUVBlank = %f (before vstartup margin)\n", __func__, k,
+				v->MinTTUVBlank[k]);
+#endif
+
+		v->MinTTUVBlank[k] = v->MinTTUVBlank[k] + Tvstartup_margin;
+
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML::%s: k=%d, Tvstartup_margin = %f\n", __func__, k, Tvstartup_margin);
+		dml_print("DML::%s: k=%d, MaxVStartupLines = %d\n", __func__, k, v->MaxVStartupLines[k]);
+		dml_print("DML::%s: k=%d, VStartup = %d\n", __func__, k, v->VStartup[k]);
+		dml_print("DML::%s: k=%d, MinTTUVBlank = %f\n", __func__, k, v->MinTTUVBlank[k]);
+#endif
+
+		v->Tdmdl[k] = v->Tdmdl[k] + Tvstartup_margin;
+		if (mode_lib->vba.DynamicMetadataEnable[k] && mode_lib->vba.DynamicMetadataVMEnabled)
+			v->Tdmdl_vm[k] = v->Tdmdl_vm[k] + Tvstartup_margin;
+
+		isInterlaceTiming = (mode_lib->vba.Interlace[k] &&
+				!mode_lib->vba.ProgressiveToInterlaceUnitInOPP);
+
+		v->MIN_DST_Y_NEXT_START[k] = ((isInterlaceTiming ? dml_floor((mode_lib->vba.VTotal[k] -
+						mode_lib->vba.VFrontPorch[k]) / 2.0, 1.0) :
+						mode_lib->vba.VTotal[k]) - mode_lib->vba.VFrontPorch[k])
+						+ dml_max(1.0,
+						dml_ceil(v->WritebackDelay[mode_lib->vba.VoltageLevel][k]
+						/ (mode_lib->vba.HTotal[k] / mode_lib->vba.PixelClock[k]), 1.0))
+						+ dml_floor(4.0 * v->TSetup[k] / (mode_lib->vba.HTotal[k]
+						/ mode_lib->vba.PixelClock[k]), 1.0) / 4.0;
+
+		v->VStartup[k] = (isInterlaceTiming ? (2 * v->MaxVStartupLines[k]) : v->MaxVStartupLines[k]);
+
+		if (((v->VUpdateOffsetPix[k] + v->VUpdateWidthPix[k] + v->VReadyOffsetPix[k])
+			/ mode_lib->vba.HTotal[k]) <= (isInterlaceTiming ? dml_floor((mode_lib->vba.VTotal[k]
+			- mode_lib->vba.VActive[k] - mode_lib->vba.VFrontPorch[k] - v->VStartup[k]) / 2.0, 1.0) :
+			(int) (mode_lib->vba.VTotal[k] - mode_lib->vba.VActive[k]
+		       - mode_lib->vba.VFrontPorch[k] - v->VStartup[k]))) {
+			v->VREADY_AT_OR_AFTER_VSYNC[k] = true;
+		} else {
+			v->VREADY_AT_OR_AFTER_VSYNC[k] = false;
+		}
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML::%s: k=%d, VStartup = %d (max)\n", __func__, k, v->VStartup[k]);
+		dml_print("DML::%s: k=%d, VUpdateOffsetPix = %d\n", __func__, k, v->VUpdateOffsetPix[k]);
+		dml_print("DML::%s: k=%d, VUpdateWidthPix = %d\n", __func__, k, v->VUpdateWidthPix[k]);
+		dml_print("DML::%s: k=%d, VReadyOffsetPix = %d\n", __func__, k, v->VReadyOffsetPix[k]);
+		dml_print("DML::%s: k=%d, HTotal = %d\n", __func__, k, mode_lib->vba.HTotal[k]);
+		dml_print("DML::%s: k=%d, VTotal = %d\n", __func__, k, mode_lib->vba.VTotal[k]);
+		dml_print("DML::%s: k=%d, VActive = %d\n", __func__, k, mode_lib->vba.VActive[k]);
+		dml_print("DML::%s: k=%d, VFrontPorch = %d\n", __func__, k, mode_lib->vba.VFrontPorch[k]);
+		dml_print("DML::%s: k=%d, VStartup = %d\n", __func__, k, v->VStartup[k]);
+		dml_print("DML::%s: k=%d, TSetup = %f\n", __func__, k, v->TSetup[k]);
+		dml_print("DML::%s: k=%d, MIN_DST_Y_NEXT_START = %f\n", __func__, k, v->MIN_DST_Y_NEXT_START[k]);
+		dml_print("DML::%s: k=%d, VREADY_AT_OR_AFTER_VSYNC = %d\n", __func__, k,
+				v->VREADY_AT_OR_AFTER_VSYNC[k]);
+#endif
+	}
+
+	{
+		//Maximum Bandwidth Used
+		double TotalWRBandwidth = 0;
+		double WRBandwidth = 0;
+
+		for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+			if (mode_lib->vba.WritebackEnable[k] == true
+					&& mode_lib->vba.WritebackPixelFormat[k] == dm_444_32) {
+				WRBandwidth = mode_lib->vba.WritebackDestinationWidth[k]
+						* mode_lib->vba.WritebackDestinationHeight[k]
+						/ (mode_lib->vba.HTotal[k] * mode_lib->vba.WritebackSourceHeight[k]
+								/ mode_lib->vba.PixelClock[k]) * 4;
+			} else if (mode_lib->vba.WritebackEnable[k] == true) {
+				WRBandwidth = mode_lib->vba.WritebackDestinationWidth[k]
+						* mode_lib->vba.WritebackDestinationHeight[k]
+						/ (mode_lib->vba.HTotal[k] * mode_lib->vba.WritebackSourceHeight[k]
+								/ mode_lib->vba.PixelClock[k]) * 8;
+			}
+			TotalWRBandwidth = TotalWRBandwidth + WRBandwidth;
+		}
+
+		v->TotalDataReadBandwidth = 0;
+		for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+			v->TotalDataReadBandwidth = v->TotalDataReadBandwidth + v->ReadBandwidthSurfaceLuma[k]
+					+ v->ReadBandwidthSurfaceChroma[k];
+#ifdef __DML_VBA_DEBUG__
+			dml_print("DML::%s: k=%d, TotalDataReadBandwidth = %f\n",
+					__func__, k, v->TotalDataReadBandwidth);
+			dml_print("DML::%s: k=%d, ReadBandwidthSurfaceLuma = %f\n",
+					__func__, k, v->ReadBandwidthSurfaceLuma[k]);
+			dml_print("DML::%s: k=%d, ReadBandwidthSurfaceChroma = %f\n",
+					__func__, k, v->ReadBandwidthSurfaceChroma[k]);
+#endif
+		}
+	}
+
+	// Stutter Efficiency
+	dml32_CalculateStutterEfficiency(v->CompressedBufferSizeInkByte,
+			mode_lib->vba.UsesMALLForPStateChange,
+			v->UnboundedRequestEnabled,
+			mode_lib->vba.MetaFIFOSizeInKEntries,
+			mode_lib->vba.ZeroSizeBufferEntries,
+			mode_lib->vba.PixelChunkSizeInKByte,
+			mode_lib->vba.NumberOfActiveSurfaces,
+			mode_lib->vba.ROBBufferSizeInKByte,
+			v->TotalDataReadBandwidth,
+			mode_lib->vba.DCFCLK,
+			mode_lib->vba.ReturnBW,
+			mode_lib->vba.CompbufReservedSpace64B,
+			mode_lib->vba.CompbufReservedSpaceZs,
+			mode_lib->vba.SRExitTime,
+			mode_lib->vba.SRExitZ8Time,
+			mode_lib->vba.SynchronizeTimingsFinal,
+			mode_lib->vba.BlendingAndTiming,
+			v->Watermark.StutterEnterPlusExitWatermark,
+			v->Watermark.Z8StutterEnterPlusExitWatermark,
+			mode_lib->vba.ProgressiveToInterlaceUnitInOPP,
+			mode_lib->vba.Interlace,
+			v->MinTTUVBlank, mode_lib->vba.DPPPerPlane,
+			mode_lib->vba.DETBufferSizeY,
+			v->BytePerPixelY,
+			v->BytePerPixelDETY,
+			v->SwathWidthY,
+			mode_lib->vba.SwathHeightY,
+			mode_lib->vba.SwathHeightC,
+			mode_lib->vba.DCCRateLuma,
+			mode_lib->vba.DCCRateChroma,
+			mode_lib->vba.DCCFractionOfZeroSizeRequestsLuma,
+			mode_lib->vba.DCCFractionOfZeroSizeRequestsChroma,
+			mode_lib->vba.HTotal, mode_lib->vba.VTotal,
+			mode_lib->vba.PixelClock,
+			mode_lib->vba.VRatio,
+			mode_lib->vba.SourceRotation,
+			v->BlockHeight256BytesY,
+			v->BlockWidth256BytesY,
+			v->BlockHeight256BytesC,
+			v->BlockWidth256BytesC,
+			v->DCCYMaxUncompressedBlock,
+			v->DCCCMaxUncompressedBlock,
+			mode_lib->vba.VActive,
+			mode_lib->vba.DCCEnable,
+			mode_lib->vba.WritebackEnable,
+			v->ReadBandwidthSurfaceLuma,
+			v->ReadBandwidthSurfaceChroma,
+			v->meta_row_bw,
+			v->dpte_row_bw,
+			/* Output */
+			&v->StutterEfficiencyNotIncludingVBlank,
+			&v->StutterEfficiency,
+			&v->NumberOfStutterBurstsPerFrame,
+			&v->Z8StutterEfficiencyNotIncludingVBlank,
+			&v->Z8StutterEfficiency,
+			&v->Z8NumberOfStutterBurstsPerFrame,
+			&v->StutterPeriod,
+			&v->DCHUBBUB_ARB_CSTATE_MAX_CAP_MODE);
+
+#ifdef __DML_VBA_ALLOW_DELTA__
+	{
+		double dummy_single[2];
+		unsigned int dummy_integer[1];
+		bool dummy_boolean[1];
+
+		// Calculate z8 stutter eff assuming 0 reserved space
+		dml32_CalculateStutterEfficiency(v->CompressedBufferSizeInkByte,
+				mode_lib->vba.UsesMALLForPStateChange,
+				v->UnboundedRequestEnabled,
+				mode_lib->vba.MetaFIFOSizeInKEntries,
+				mode_lib->vba.ZeroSizeBufferEntries,
+				mode_lib->vba.PixelChunkSizeInKByte,
+				mode_lib->vba.NumberOfActiveSurfaces,
+				mode_lib->vba.ROBBufferSizeInKByte,
+				v->TotalDataReadBandwidth,
+				mode_lib->vba.DCFCLK,
+				mode_lib->vba.ReturnBW,
+				0, //mode_lib->vba.CompbufReservedSpace64B,
+				0, //mode_lib->vba.CompbufReservedSpaceZs,
+				mode_lib->vba.SRExitTime,
+				mode_lib->vba.SRExitZ8Time,
+				mode_lib->vba.SynchronizeTimingsFinal,
+				mode_lib->vba.BlendingAndTiming,
+				v->Watermark.StutterEnterPlusExitWatermark,
+				v->Watermark.Z8StutterEnterPlusExitWatermark,
+				mode_lib->vba.ProgressiveToInterlaceUnitInOPP,
+				mode_lib->vba.Interlace,
+				v->MinTTUVBlank,
+				mode_lib->vba.DPPPerPlane,
+				mode_lib->vba.DETBufferSizeY,
+				v->BytePerPixelY, v->BytePerPixelDETY,
+				v->SwathWidthY, mode_lib->vba.SwathHeightY,
+				mode_lib->vba.SwathHeightC,
+				mode_lib->vba.DCCRateLuma,
+				mode_lib->vba.DCCRateChroma,
+				mode_lib->vba.DCCFractionOfZeroSizeRequestsLuma,
+				mode_lib->vba.DCCFractionOfZeroSizeRequestsChroma,
+				mode_lib->vba.HTotal,
+				mode_lib->vba.VTotal,
+				mode_lib->vba.PixelClock,
+				mode_lib->vba.VRatio,
+				mode_lib->vba.SourceRotation,
+				v->BlockHeight256BytesY,
+				v->BlockWidth256BytesY,
+				v->BlockHeight256BytesC,
+				v->BlockWidth256BytesC,
+				v->DCCYMaxUncompressedBlock,
+				v->DCCCMaxUncompressedBlock,
+				mode_lib->vba.VActive,
+				mode_lib->vba.DCCEnable,
+				mode_lib->vba.WritebackEnable,
+				v->ReadBandwidthSurfaceLuma,
+				v->ReadBandwidthSurfaceChroma,
+				v->meta_row_bw, v->dpte_row_bw,
+
+				/* Output */
+				&dummy_single[0],
+				&dummy_single[1],
+				&dummy_integer[0],
+				&v->Z8StutterEfficiencyNotIncludingVBlankBestCase,
+				&v->Z8StutterEfficiencyBestCase,
+				&v->Z8NumberOfStutterBurstsPerFrameBestCase,
+				&v->StutterPeriodBestCase,
+				&dummy_boolean[0]);
+	}
+#else
+	v->Z8StutterEfficiencyNotIncludingVBlankBestCase = v->Z8StutterEfficiencyNotIncludingVBlank;
+	v->Z8StutterEfficiencyBestCase = v->Z8StutterEfficiency;
+	v->Z8NumberOfStutterBurstsPerFrameBestCase = v->Z8NumberOfStutterBurstsPerFrame;
+	v->StutterPeriodBestCase = v->StutterPeriod;
+#endif
+
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: --- END ---\n", __func__);
+#endif
+}
+
+void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
+{
+	bool dummy_boolean[2];
+	unsigned int dummy_integer[1];
+	bool MPCCombineMethodAsNeededForPStateChangeAndVoltage;
+	bool MPCCombineMethodAsPossible;
+	enum odm_combine_mode dummy_odm_mode[DC__NUM_DPP__MAX];
+	unsigned int TotalNumberOfActiveOTG;
+	unsigned int TotalNumberOfActiveHDMIFRL;
+	unsigned int TotalNumberOfActiveDP2p0;
+	unsigned int TotalNumberOfActiveDP2p0Outputs;
+	unsigned int TotalDSCUnitsRequired;
+	unsigned int m;
+	unsigned int ReorderingBytes;
+	bool FullFrameMALLPStateMethod;
+	bool SubViewportMALLPStateMethod;
+	bool PhantomPipeMALLPStateMethod;
+	double MaxTotalVActiveRDBandwidth;
+	double DSTYAfterScaler[DC__NUM_DPP__MAX];
+	double DSTXAfterScaler[DC__NUM_DPP__MAX];
+	unsigned int MaximumMPCCombine;
+
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: called\n", __func__);
+#endif
+	struct vba_vars_st *v = &mode_lib->vba;
+
+	int i, j;
+	unsigned int k;
+
+	/*MODE SUPPORT, VOLTAGE STATE AND SOC CONFIGURATION*/
+
+	/*Scale Ratio, taps Support Check*/
+
+	mode_lib->vba.ScaleRatioAndTapsSupport = true;
+	for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
+		if (mode_lib->vba.ScalerEnabled[k] == false
+				&& ((mode_lib->vba.SourcePixelFormat[k] != dm_444_64
+						&& mode_lib->vba.SourcePixelFormat[k] != dm_444_32
+						&& mode_lib->vba.SourcePixelFormat[k] != dm_444_16
+						&& mode_lib->vba.SourcePixelFormat[k] != dm_mono_16
+						&& mode_lib->vba.SourcePixelFormat[k] != dm_mono_8
+						&& mode_lib->vba.SourcePixelFormat[k] != dm_rgbe
+						&& mode_lib->vba.SourcePixelFormat[k] != dm_rgbe_alpha)
+						|| mode_lib->vba.HRatio[k] != 1.0 || mode_lib->vba.htaps[k] != 1.0
+						|| mode_lib->vba.VRatio[k] != 1.0 || mode_lib->vba.vtaps[k] != 1.0)) {
+			mode_lib->vba.ScaleRatioAndTapsSupport = false;
+		} else if (mode_lib->vba.vtaps[k] < 1.0 || mode_lib->vba.vtaps[k] > 8.0 || mode_lib->vba.htaps[k] < 1.0
+				|| mode_lib->vba.htaps[k] > 8.0
+				|| (mode_lib->vba.htaps[k] > 1.0 && (mode_lib->vba.htaps[k] % 2) == 1)
+				|| mode_lib->vba.HRatio[k] > mode_lib->vba.MaxHSCLRatio
+				|| mode_lib->vba.VRatio[k] > mode_lib->vba.MaxVSCLRatio
+				|| mode_lib->vba.HRatio[k] > mode_lib->vba.htaps[k]
+				|| mode_lib->vba.VRatio[k] > mode_lib->vba.vtaps[k]
+				|| (mode_lib->vba.SourcePixelFormat[k] != dm_444_64
+						&& mode_lib->vba.SourcePixelFormat[k] != dm_444_32
+						&& mode_lib->vba.SourcePixelFormat[k] != dm_444_16
+						&& mode_lib->vba.SourcePixelFormat[k] != dm_mono_16
+						&& mode_lib->vba.SourcePixelFormat[k] != dm_mono_8
+						&& mode_lib->vba.SourcePixelFormat[k] != dm_rgbe
+						&& (mode_lib->vba.VTAPsChroma[k] < 1
+								|| mode_lib->vba.VTAPsChroma[k] > 8
+								|| mode_lib->vba.HTAPsChroma[k] < 1
+								|| mode_lib->vba.HTAPsChroma[k] > 8
+								|| (mode_lib->vba.HTAPsChroma[k] > 1
+										&& mode_lib->vba.HTAPsChroma[k] % 2
+												== 1)
+								|| mode_lib->vba.HRatioChroma[k]
+										> mode_lib->vba.MaxHSCLRatio
+								|| mode_lib->vba.VRatioChroma[k]
+										> mode_lib->vba.MaxVSCLRatio
+								|| mode_lib->vba.HRatioChroma[k]
+										> mode_lib->vba.HTAPsChroma[k]
+								|| mode_lib->vba.VRatioChroma[k]
+										> mode_lib->vba.VTAPsChroma[k]))) {
+			mode_lib->vba.ScaleRatioAndTapsSupport = false;
+		}
+	}
+
+	/*Source Format, Pixel Format and Scan Support Check*/
+	mode_lib->vba.SourceFormatPixelAndScanSupport = true;
+	for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
+		if (mode_lib->vba.SurfaceTiling[k] == dm_sw_linear
+			&& (!(!IsVertical(mode_lib->vba.SourceScan[k])) || mode_lib->vba.DCCEnable[k] == true)) {
+			mode_lib->vba.SourceFormatPixelAndScanSupport = false;
+		}
+	}
+
+	for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
+		dml32_CalculateBytePerPixelAndBlockSizes(
+				mode_lib->vba.SourcePixelFormat[k],
+				mode_lib->vba.SurfaceTiling[k],
+
+				/* Output */
+				&mode_lib->vba.BytePerPixelY[k],
+				&mode_lib->vba.BytePerPixelC[k],
+				&mode_lib->vba.BytePerPixelInDETY[k],
+				&mode_lib->vba.BytePerPixelInDETC[k],
+				&mode_lib->vba.Read256BlockHeightY[k],
+				&mode_lib->vba.Read256BlockHeightC[k],
+				&mode_lib->vba.Read256BlockWidthY[k],
+				&mode_lib->vba.Read256BlockWidthC[k],
+				&mode_lib->vba.MicroTileHeightY[k],
+				&mode_lib->vba.MicroTileHeightC[k],
+				&mode_lib->vba.MicroTileWidthY[k],
+				&mode_lib->vba.MicroTileWidthC[k]);
+	}
+
+	/*Bandwidth Support Check*/
+	for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
+		if (!IsVertical(mode_lib->vba.SourceRotation[k])) {
+			v->SwathWidthYSingleDPP[k] = mode_lib->vba.ViewportWidth[k];
+			v->SwathWidthCSingleDPP[k] = mode_lib->vba.ViewportWidthChroma[k];
+		} else {
+			v->SwathWidthYSingleDPP[k] = mode_lib->vba.ViewportHeight[k];
+			v->SwathWidthCSingleDPP[k] = mode_lib->vba.ViewportHeightChroma[k];
+		}
+	}
+	for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
+		v->ReadBandwidthLuma[k] = v->SwathWidthYSingleDPP[k] * dml_ceil(v->BytePerPixelInDETY[k], 1.0)
+				/ (mode_lib->vba.HTotal[k] / mode_lib->vba.PixelClock[k]) * mode_lib->vba.VRatio[k];
+		v->ReadBandwidthChroma[k] = v->SwathWidthYSingleDPP[k] / 2 * dml_ceil(v->BytePerPixelInDETC[k], 2.0)
+				/ (mode_lib->vba.HTotal[k] / mode_lib->vba.PixelClock[k]) * mode_lib->vba.VRatio[k]
+				/ 2.0;
+	}
+	for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
+		if (mode_lib->vba.WritebackEnable[k] == true && mode_lib->vba.WritebackPixelFormat[k] == dm_444_64) {
+			v->WriteBandwidth[k] = mode_lib->vba.WritebackDestinationWidth[k]
+					* mode_lib->vba.WritebackDestinationHeight[k]
+					/ (mode_lib->vba.WritebackSourceHeight[k] * mode_lib->vba.HTotal[k]
+							/ mode_lib->vba.PixelClock[k]) * 8.0;
+		} else if (mode_lib->vba.WritebackEnable[k] == true) {
+			v->WriteBandwidth[k] = mode_lib->vba.WritebackDestinationWidth[k]
+					* mode_lib->vba.WritebackDestinationHeight[k]
+					/ (mode_lib->vba.WritebackSourceHeight[k] * mode_lib->vba.HTotal[k]
+							/ mode_lib->vba.PixelClock[k]) * 4.0;
+		} else {
+			v->WriteBandwidth[k] = 0.0;
+		}
+	}
+
+	/*Writeback Latency support check*/
+
+	mode_lib->vba.WritebackLatencySupport = true;
+	for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
+		if (mode_lib->vba.WritebackEnable[k] == true
+				&& (v->WriteBandwidth[k]
+						> mode_lib->vba.WritebackInterfaceBufferSize * 1024
+								/ mode_lib->vba.WritebackLatency)) {
+			mode_lib->vba.WritebackLatencySupport = false;
+		}
+	}
+
+	/*Writeback Mode Support Check*/
+	mode_lib->vba.EnoughWritebackUnits = true;
+	mode_lib->vba.TotalNumberOfActiveWriteback = 0;
+	for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
+		if (mode_lib->vba.WritebackEnable[k] == true)
+			mode_lib->vba.TotalNumberOfActiveWriteback = mode_lib->vba.TotalNumberOfActiveWriteback + 1;
+	}
+
+	if (mode_lib->vba.TotalNumberOfActiveWriteback > mode_lib->vba.MaxNumWriteback)
+		mode_lib->vba.EnoughWritebackUnits = false;
+
+	/*Writeback Scale Ratio and Taps Support Check*/
+	mode_lib->vba.WritebackScaleRatioAndTapsSupport = true;
+	for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
+		if (mode_lib->vba.WritebackEnable[k] == true) {
+			if (mode_lib->vba.WritebackHRatio[k] > mode_lib->vba.WritebackMaxHSCLRatio
+					|| mode_lib->vba.WritebackVRatio[k] > mode_lib->vba.WritebackMaxVSCLRatio
+					|| mode_lib->vba.WritebackHRatio[k] < mode_lib->vba.WritebackMinHSCLRatio
+					|| mode_lib->vba.WritebackVRatio[k] < mode_lib->vba.WritebackMinVSCLRatio
+					|| mode_lib->vba.WritebackHTaps[k] > mode_lib->vba.WritebackMaxHSCLTaps
+					|| mode_lib->vba.WritebackVTaps[k] > mode_lib->vba.WritebackMaxVSCLTaps
+					|| mode_lib->vba.WritebackHRatio[k] > mode_lib->vba.WritebackHTaps[k]
+					|| mode_lib->vba.WritebackVRatio[k] > mode_lib->vba.WritebackVTaps[k]
+					|| (mode_lib->vba.WritebackHTaps[k] > 2.0
+							&& ((mode_lib->vba.WritebackHTaps[k] % 2) == 1))) {
+				mode_lib->vba.WritebackScaleRatioAndTapsSupport = false;
+			}
+			if (2.0 * mode_lib->vba.WritebackDestinationWidth[k] * (mode_lib->vba.WritebackVTaps[k] - 1)
+					* 57 > mode_lib->vba.WritebackLineBufferSize) {
+				mode_lib->vba.WritebackScaleRatioAndTapsSupport = false;
+			}
+		}
+	}
+
+	for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
+		dml32_CalculateSinglePipeDPPCLKAndSCLThroughput(mode_lib->vba.HRatio[k], mode_lib->vba.HRatioChroma[k],
+				mode_lib->vba.VRatio[k], mode_lib->vba.VRatioChroma[k],
+				mode_lib->vba.MaxDCHUBToPSCLThroughput, mode_lib->vba.MaxPSCLToLBThroughput,
+				mode_lib->vba.PixelClock[k], mode_lib->vba.SourcePixelFormat[k],
+				mode_lib->vba.htaps[k], mode_lib->vba.HTAPsChroma[k], mode_lib->vba.vtaps[k],
+				mode_lib->vba.VTAPsChroma[k],
+				/* Output */
+				&mode_lib->vba.PSCL_FACTOR[k], &mode_lib->vba.PSCL_FACTOR_CHROMA[k],
+				&mode_lib->vba.MinDPPCLKUsingSingleDPP[k]);
+	}
+
+	for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
+
+		if (mode_lib->vba.SurfaceTiling[k] == dm_sw_linear) {
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MaximumSwathWidthSupportLuma = 8192;
+		} else if (!IsVertical(mode_lib->vba.SourceRotation[k]) && v->BytePerPixelC[k] > 0
+				&& mode_lib->vba.SourcePixelFormat[k] != dm_rgbe_alpha) {
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MaximumSwathWidthSupportLuma = 7680;
+		} else if (IsVertical(mode_lib->vba.SourceRotation[k]) && v->BytePerPixelC[k] > 0
+				&& mode_lib->vba.SourcePixelFormat[k] != dm_rgbe_alpha) {
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MaximumSwathWidthSupportLuma = 4320;
+		} else if (mode_lib->vba.SourcePixelFormat[k] == dm_rgbe_alpha) {
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MaximumSwathWidthSupportLuma = 3840;
+		} else if (IsVertical(mode_lib->vba.SourceRotation[k]) && v->BytePerPixelY[k] == 8 &&
+				mode_lib->vba.DCCEnable[k] == true) {
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MaximumSwathWidthSupportLuma = 3072;
+		} else {
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MaximumSwathWidthSupportLuma = 6144;
+		}
+
+		if (mode_lib->vba.SourcePixelFormat[k] == dm_420_8 || mode_lib->vba.SourcePixelFormat[k] == dm_420_10
+				|| mode_lib->vba.SourcePixelFormat[k] == dm_420_12) {
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MaximumSwathWidthSupportChroma = v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MaximumSwathWidthSupportLuma / 2.0;
+		} else {
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MaximumSwathWidthSupportChroma = v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MaximumSwathWidthSupportLuma;
+		}
+		v->MaximumSwathWidthInLineBufferLuma = mode_lib->vba.LineBufferSizeFinal
+				* dml_max(mode_lib->vba.HRatio[k], 1.0) / mode_lib->vba.LBBitPerPixel[k]
+				/ (mode_lib->vba.vtaps[k] + dml_max(dml_ceil(mode_lib->vba.VRatio[k], 1.0) - 2, 0.0));
+		if (v->BytePerPixelC[k] == 0.0) {
+			v->MaximumSwathWidthInLineBufferChroma = 0;
+		} else {
+			v->MaximumSwathWidthInLineBufferChroma = mode_lib->vba.LineBufferSizeFinal
+					* dml_max(mode_lib->vba.HRatioChroma[k], 1.0) / mode_lib->vba.LBBitPerPixel[k]
+					/ (mode_lib->vba.VTAPsChroma[k]
+							+ dml_max(dml_ceil(mode_lib->vba.VRatioChroma[k], 1.0) - 2,
+									0.0));
+		}
+		v->MaximumSwathWidthLuma[k] = dml_min(v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MaximumSwathWidthSupportLuma,
+				v->MaximumSwathWidthInLineBufferLuma);
+		v->MaximumSwathWidthChroma[k] = dml_min(v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MaximumSwathWidthSupportChroma,
+				v->MaximumSwathWidthInLineBufferChroma);
+	}
+
+	/*Number Of DSC Slices*/
+	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+		if (mode_lib->vba.BlendingAndTiming[k] == k) {
+			if (mode_lib->vba.PixelClockBackEnd[k] > 4800) {
+				mode_lib->vba.NumberOfDSCSlices[k] = dml_ceil(mode_lib->vba.PixelClockBackEnd[k] / 600,
+						4);
+			} else if (mode_lib->vba.PixelClockBackEnd[k] > 2400) {
+				mode_lib->vba.NumberOfDSCSlices[k] = 8;
+			} else if (mode_lib->vba.PixelClockBackEnd[k] > 1200) {
+				mode_lib->vba.NumberOfDSCSlices[k] = 4;
+			} else if (mode_lib->vba.PixelClockBackEnd[k] > 340) {
+				mode_lib->vba.NumberOfDSCSlices[k] = 2;
+			} else {
+				mode_lib->vba.NumberOfDSCSlices[k] = 1;
+			}
+		} else {
+			mode_lib->vba.NumberOfDSCSlices[k] = 0;
+		}
+	}
+
+	dml32_CalculateSwathAndDETConfiguration(
+			mode_lib->vba.DETSizeOverride,
+			mode_lib->vba.UsesMALLForPStateChange,
+			mode_lib->vba.ConfigReturnBufferSizeInKByte,
+			mode_lib->vba.MaxTotalDETInKByte,
+			mode_lib->vba.MinCompressedBufferSizeInKByte,
+			1, /* ForceSingleDPP */
+			mode_lib->vba.NumberOfActiveSurfaces,
+			mode_lib->vba.nomDETInKByte,
+			mode_lib->vba.UseUnboundedRequesting,
+			mode_lib->vba.CompressedBufferSegmentSizeInkByteFinal,
+			mode_lib->vba.Output,
+			mode_lib->vba.ReadBandwidthLuma,
+			mode_lib->vba.ReadBandwidthChroma,
+			mode_lib->vba.MaximumSwathWidthLuma,
+			mode_lib->vba.MaximumSwathWidthChroma,
+			mode_lib->vba.SourceRotation,
+			mode_lib->vba.ViewportStationary,
+			mode_lib->vba.SourcePixelFormat,
+			mode_lib->vba.SurfaceTiling,
+			mode_lib->vba.ViewportWidth,
+			mode_lib->vba.ViewportHeight,
+			mode_lib->vba.ViewportXStartY,
+			mode_lib->vba.ViewportYStartY,
+			mode_lib->vba.ViewportXStartC,
+			mode_lib->vba.ViewportYStartC,
+			mode_lib->vba.SurfaceWidthY,
+			mode_lib->vba.SurfaceWidthC,
+			mode_lib->vba.SurfaceHeightY,
+			mode_lib->vba.SurfaceHeightC,
+			mode_lib->vba.Read256BlockHeightY,
+			mode_lib->vba.Read256BlockHeightC,
+			mode_lib->vba.Read256BlockWidthY,
+			mode_lib->vba.Read256BlockWidthC,
+			dummy_odm_mode,
+			mode_lib->vba.BlendingAndTiming,
+			mode_lib->vba.BytePerPixelY,
+			mode_lib->vba.BytePerPixelC,
+			mode_lib->vba.BytePerPixelInDETY,
+			mode_lib->vba.BytePerPixelInDETC,
+			mode_lib->vba.HActive,
+			mode_lib->vba.HRatio,
+			mode_lib->vba.HRatioChroma,
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[0], /*  Integer DPPPerSurface[] */
+
+			/* Output */
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[1], /* Long            swath_width_luma_ub[] */
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[2], /* Long            swath_width_chroma_ub[]  */
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_double_array[0], /* Long            SwathWidth[]  */
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_double_array[1], /* Long            SwathWidthChroma[]  */
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[3], /* Integer         SwathHeightY[]  */
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[4], /* Integer         SwathHeightC[]  */
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[5], /* Long            DETBufferSizeInKByte[]  */
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[6], /* Long            DETBufferSizeY[]  */
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[7], /* Long            DETBufferSizeC[]  */
+			&dummy_boolean[0], /* bool           *UnboundedRequestEnabled  */
+			&dummy_integer[0], /* Long           *CompressedBufferSizeInkByte  */
+			mode_lib->vba.SingleDPPViewportSizeSupportPerSurface,/* bool ViewportSizeSupportPerSurface[] */
+			&dummy_boolean[1]); /* bool           *ViewportSizeSupport */
+
+	MPCCombineMethodAsNeededForPStateChangeAndVoltage = false;
+	MPCCombineMethodAsPossible = false;
+
+	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+		if (mode_lib->vba.MPCCombineUse[k] == dm_mpc_reduce_voltage_and_clocks)
+			MPCCombineMethodAsNeededForPStateChangeAndVoltage = true;
+		if (mode_lib->vba.MPCCombineUse[k] == dm_mpc_always_when_possible)
+			MPCCombineMethodAsPossible = true;
+	}
+	mode_lib->vba.MPCCombineMethodIncompatible = MPCCombineMethodAsNeededForPStateChangeAndVoltage
+			&& MPCCombineMethodAsPossible;
+
+	for (i = 0; i < v->soc.num_states; i++) {
+		for (j = 0; j < 2; j++) {
+			bool NoChroma;
+			mode_lib->vba.TotalNumberOfActiveDPP[i][j] = 0;
+			mode_lib->vba.TotalAvailablePipesSupport[i][j] = true;
+
+			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+
+				bool TotalAvailablePipesSupportNoDSC;
+				unsigned int NumberOfDPPNoDSC;
+				enum odm_combine_mode ODMModeNoDSC = dm_odm_combine_mode_disabled;
+				double RequiredDISPCLKPerSurfaceNoDSC;
+				bool TotalAvailablePipesSupportDSC;
+				unsigned int NumberOfDPPDSC;
+				enum odm_combine_mode ODMModeDSC = dm_odm_combine_mode_disabled;
+				double RequiredDISPCLKPerSurfaceDSC;
+
+				dml32_CalculateODMMode(
+						mode_lib->vba.MaximumPixelsPerLinePerDSCUnit,
+						mode_lib->vba.HActive[k],
+						mode_lib->vba.Output[k],
+						mode_lib->vba.ODMUse[k],
+						mode_lib->vba.MaxDispclk[i],
+						mode_lib->vba.MaxDispclk[v->soc.num_states - 1],
+						false,
+						mode_lib->vba.TotalNumberOfActiveDPP[i][j],
+						mode_lib->vba.MaxNumDPP,
+						mode_lib->vba.PixelClock[k],
+						mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading,
+						mode_lib->vba.DISPCLKRampingMargin,
+						mode_lib->vba.DISPCLKDPPCLKVCOSpeed,
+
+						/* Output */
+						&TotalAvailablePipesSupportNoDSC,
+						&NumberOfDPPNoDSC,
+						&ODMModeNoDSC,
+						&RequiredDISPCLKPerSurfaceNoDSC);
+
+				dml32_CalculateODMMode(
+						mode_lib->vba.MaximumPixelsPerLinePerDSCUnit,
+						mode_lib->vba.HActive[k],
+						mode_lib->vba.Output[k],
+						mode_lib->vba.ODMUse[k],
+						mode_lib->vba.MaxDispclk[i],
+						mode_lib->vba.MaxDispclk[v->soc.num_states - 1],
+						true,
+						mode_lib->vba.TotalNumberOfActiveDPP[i][j],
+						mode_lib->vba.MaxNumDPP,
+						mode_lib->vba.PixelClock[k],
+						mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading,
+						mode_lib->vba.DISPCLKRampingMargin,
+						mode_lib->vba.DISPCLKDPPCLKVCOSpeed,
+
+						/* Output */
+						&TotalAvailablePipesSupportDSC,
+						&NumberOfDPPDSC,
+						&ODMModeDSC,
+						&RequiredDISPCLKPerSurfaceDSC);
+
+				dml32_CalculateOutputLink(
+						mode_lib->vba.PHYCLKPerState[i],
+						mode_lib->vba.PHYCLKD18PerState[i],
+						mode_lib->vba.PHYCLKD32PerState[i],
+						mode_lib->vba.Downspreading,
+						(mode_lib->vba.BlendingAndTiming[k] == k),
+						mode_lib->vba.Output[k],
+						mode_lib->vba.OutputFormat[k],
+						mode_lib->vba.HTotal[k],
+						mode_lib->vba.HActive[k],
+						mode_lib->vba.PixelClockBackEnd[k],
+						mode_lib->vba.ForcedOutputLinkBPP[k],
+						mode_lib->vba.DSCInputBitPerComponent[k],
+						mode_lib->vba.NumberOfDSCSlices[k],
+						mode_lib->vba.AudioSampleRate[k],
+						mode_lib->vba.AudioSampleLayout[k],
+						ODMModeNoDSC,
+						ODMModeDSC,
+						mode_lib->vba.DSCEnable[k],
+						mode_lib->vba.OutputLinkDPLanes[k],
+						mode_lib->vba.OutputLinkDPRate[k],
+
+						/* Output */
+						&mode_lib->vba.RequiresDSC[i][k],
+						&mode_lib->vba.RequiresFEC[i][k],
+						&mode_lib->vba.OutputBppPerState[i][k],
+						&mode_lib->vba.OutputTypePerState[i][k],
+						&mode_lib->vba.OutputRatePerState[i][k],
+						&mode_lib->vba.RequiredSlots[i][k]);
+
+				if (mode_lib->vba.RequiresDSC[i][k] == false) {
+					mode_lib->vba.ODMCombineEnablePerState[i][k] = ODMModeNoDSC;
+					mode_lib->vba.RequiredDISPCLKPerSurface[i][j][k] =
+							RequiredDISPCLKPerSurfaceNoDSC;
+					if (!TotalAvailablePipesSupportNoDSC)
+						mode_lib->vba.TotalAvailablePipesSupport[i][j] = false;
+					mode_lib->vba.TotalNumberOfActiveDPP[i][j] =
+							mode_lib->vba.TotalNumberOfActiveDPP[i][j] + NumberOfDPPNoDSC;
+				} else {
+					mode_lib->vba.ODMCombineEnablePerState[i][k] = ODMModeDSC;
+					mode_lib->vba.RequiredDISPCLKPerSurface[i][j][k] =
+							RequiredDISPCLKPerSurfaceDSC;
+					if (!TotalAvailablePipesSupportDSC)
+						mode_lib->vba.TotalAvailablePipesSupport[i][j] = false;
+					mode_lib->vba.TotalNumberOfActiveDPP[i][j] =
+							mode_lib->vba.TotalNumberOfActiveDPP[i][j] + NumberOfDPPDSC;
+				}
+			}
+
+			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+				if (mode_lib->vba.ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_4to1) {
+					mode_lib->vba.MPCCombine[i][j][k] = false;
+					mode_lib->vba.NoOfDPP[i][j][k] = 4;
+				} else if (mode_lib->vba.ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_2to1) {
+					mode_lib->vba.MPCCombine[i][j][k] = false;
+					mode_lib->vba.NoOfDPP[i][j][k] = 2;
+				} else if (mode_lib->vba.MPCCombineUse[k] == dm_mpc_never) {
+					mode_lib->vba.MPCCombine[i][j][k] = false;
+					mode_lib->vba.NoOfDPP[i][j][k] = 1;
+				} else if (dml32_RoundToDFSGranularity(
+						mode_lib->vba.MinDPPCLKUsingSingleDPP[k]
+								* (1 + mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading
+												/ 100), 1,
+						mode_lib->vba.DISPCLKDPPCLKVCOSpeed) <= mode_lib->vba.MaxDppclk[i] &&
+				mode_lib->vba.SingleDPPViewportSizeSupportPerSurface[k] == true) {
+					mode_lib->vba.MPCCombine[i][j][k] = false;
+					mode_lib->vba.NoOfDPP[i][j][k] = 1;
+				} else if (mode_lib->vba.TotalNumberOfActiveDPP[i][j] < mode_lib->vba.MaxNumDPP) {
+					mode_lib->vba.MPCCombine[i][j][k] = true;
+					mode_lib->vba.NoOfDPP[i][j][k] = 2;
+					mode_lib->vba.TotalNumberOfActiveDPP[i][j] =
+							mode_lib->vba.TotalNumberOfActiveDPP[i][j] + 1;
+				} else {
+					mode_lib->vba.MPCCombine[i][j][k] = false;
+					mode_lib->vba.NoOfDPP[i][j][k] = 1;
+					mode_lib->vba.TotalAvailablePipesSupport[i][j] = false;
+				}
+			}
+
+			mode_lib->vba.TotalNumberOfSingleDPPSurfaces[i][j] = 0;
+			NoChroma = true;
+
+			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+				if (mode_lib->vba.NoOfDPP[i][j][k] == 1)
+					mode_lib->vba.TotalNumberOfSingleDPPSurfaces[i][j] =
+							mode_lib->vba.TotalNumberOfSingleDPPSurfaces[i][j] + 1;
+				if (mode_lib->vba.SourcePixelFormat[k] == dm_420_8
+						|| mode_lib->vba.SourcePixelFormat[k] == dm_420_10
+						|| mode_lib->vba.SourcePixelFormat[k] == dm_420_12
+						|| mode_lib->vba.SourcePixelFormat[k] == dm_rgbe_alpha) {
+					NoChroma = false;
+				}
+			}
+
+			if (j == 1 && !dml32_UnboundedRequest(mode_lib->vba.UseUnboundedRequesting,
+							mode_lib->vba.TotalNumberOfActiveDPP[i][j], NoChroma,
+							mode_lib->vba.Output[0])) {
+				while (!(mode_lib->vba.TotalNumberOfActiveDPP[i][j] >= mode_lib->vba.MaxNumDPP
+						|| mode_lib->vba.TotalNumberOfSingleDPPSurfaces[i][j] == 0)) {
+					double BWOfNonCombinedSurfaceOfMaximumBandwidth = 0;
+					unsigned int NumberOfNonCombinedSurfaceOfMaximumBandwidth = 0;
+
+					for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+						if (mode_lib->vba.MPCCombineUse[k]
+							!= dm_mpc_never &&
+							mode_lib->vba.MPCCombineUse[k] != dm_mpc_reduce_voltage &&
+							mode_lib->vba.ReadBandwidthLuma[k] +
+							mode_lib->vba.ReadBandwidthChroma[k] >
+							BWOfNonCombinedSurfaceOfMaximumBandwidth &&
+							(mode_lib->vba.ODMCombineEnablePerState[i][k] !=
+							dm_odm_combine_mode_2to1 &&
+							mode_lib->vba.ODMCombineEnablePerState[i][k] !=
+							dm_odm_combine_mode_4to1) &&
+								mode_lib->vba.MPCCombine[i][j][k] == false) {
+							BWOfNonCombinedSurfaceOfMaximumBandwidth =
+								mode_lib->vba.ReadBandwidthLuma[k]
+								+ mode_lib->vba.ReadBandwidthChroma[k];
+							NumberOfNonCombinedSurfaceOfMaximumBandwidth = k;
+						}
+					}
+					mode_lib->vba.MPCCombine[i][j][NumberOfNonCombinedSurfaceOfMaximumBandwidth] =
+							true;
+					mode_lib->vba.NoOfDPP[i][j][NumberOfNonCombinedSurfaceOfMaximumBandwidth] = 2;
+					mode_lib->vba.TotalNumberOfActiveDPP[i][j] =
+							mode_lib->vba.TotalNumberOfActiveDPP[i][j] + 1;
+					mode_lib->vba.TotalNumberOfSingleDPPSurfaces[i][j] =
+							mode_lib->vba.TotalNumberOfSingleDPPSurfaces[i][j] - 1;
+				}
+			}
+
+			//DISPCLK/DPPCLK
+			mode_lib->vba.WritebackRequiredDISPCLK = 0;
+			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+				if (mode_lib->vba.WritebackEnable[k]) {
+					mode_lib->vba.WritebackRequiredDISPCLK = dml_max(
+							mode_lib->vba.WritebackRequiredDISPCLK,
+							dml32_CalculateWriteBackDISPCLK(
+									mode_lib->vba.WritebackPixelFormat[k],
+									mode_lib->vba.PixelClock[k],
+									mode_lib->vba.WritebackHRatio[k],
+									mode_lib->vba.WritebackVRatio[k],
+									mode_lib->vba.WritebackHTaps[k],
+									mode_lib->vba.WritebackVTaps[k],
+									mode_lib->vba.WritebackSourceWidth[k],
+									mode_lib->vba.WritebackDestinationWidth[k],
+									mode_lib->vba.HTotal[k],
+									mode_lib->vba.WritebackLineBufferSize,
+									mode_lib->vba.DISPCLKDPPCLKVCOSpeed));
+				}
+			}
+
+			mode_lib->vba.RequiredDISPCLK[i][j] = mode_lib->vba.WritebackRequiredDISPCLK;
+			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+				mode_lib->vba.RequiredDISPCLK[i][j] = dml_max(mode_lib->vba.RequiredDISPCLK[i][j],
+						mode_lib->vba.RequiredDISPCLKPerSurface[i][j][k]);
+			}
+
+			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k)
+				mode_lib->vba.NoOfDPPThisState[k] = mode_lib->vba.NoOfDPP[i][j][k];
+
+			dml32_CalculateDPPCLK(mode_lib->vba.NumberOfActiveSurfaces,
+					mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading,
+					mode_lib->vba.DISPCLKDPPCLKVCOSpeed, mode_lib->vba.MinDPPCLKUsingSingleDPP,
+					mode_lib->vba.NoOfDPPThisState,
+					/* Output */
+					&mode_lib->vba.GlobalDPPCLK, mode_lib->vba.RequiredDPPCLKThisState);
+
+			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k)
+				mode_lib->vba.RequiredDPPCLK[i][j][k] = mode_lib->vba.RequiredDPPCLKThisState[k];
+
+			mode_lib->vba.DISPCLK_DPPCLK_Support[i][j] = !((mode_lib->vba.RequiredDISPCLK[i][j]
+					> mode_lib->vba.MaxDispclk[i])
+					|| (mode_lib->vba.GlobalDPPCLK > mode_lib->vba.MaxDppclk[i]));
+
+			if (mode_lib->vba.TotalNumberOfActiveDPP[i][j] > mode_lib->vba.MaxNumDPP)
+				mode_lib->vba.TotalAvailablePipesSupport[i][j] = false;
+		} // j
+	} // i (VOLTAGE_STATE)
+
+	/* Total Available OTG, HDMIFRL, DP Support Check */
+	TotalNumberOfActiveOTG = 0;
+	TotalNumberOfActiveHDMIFRL = 0;
+	TotalNumberOfActiveDP2p0 = 0;
+	TotalNumberOfActiveDP2p0Outputs = 0;
+
+	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+		if (mode_lib->vba.BlendingAndTiming[k] == k) {
+			TotalNumberOfActiveOTG = TotalNumberOfActiveOTG + 1;
+			if (mode_lib->vba.Output[k] == dm_dp2p0) {
+				TotalNumberOfActiveDP2p0 = TotalNumberOfActiveDP2p0 + 1;
+				if (mode_lib->vba.OutputMultistreamId[k]
+						== k || mode_lib->vba.OutputMultistreamEn[k] == false) {
+					TotalNumberOfActiveDP2p0Outputs = TotalNumberOfActiveDP2p0Outputs + 1;
+				}
+			}
+		}
+	}
+
+	mode_lib->vba.NumberOfOTGSupport = (TotalNumberOfActiveOTG <= mode_lib->vba.MaxNumOTG);
+	mode_lib->vba.NumberOfHDMIFRLSupport = (TotalNumberOfActiveHDMIFRL <= mode_lib->vba.MaxNumHDMIFRLOutputs);
+	mode_lib->vba.NumberOfDP2p0Support = (TotalNumberOfActiveDP2p0 <= mode_lib->vba.MaxNumDP2p0Streams
+			&& TotalNumberOfActiveDP2p0Outputs <= mode_lib->vba.MaxNumDP2p0Outputs);
+
+	/* Display IO and DSC Support Check */
+	mode_lib->vba.NonsupportedDSCInputBPC = false;
+	for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
+		if (!(mode_lib->vba.DSCInputBitPerComponent[k] == 12.0
+				|| mode_lib->vba.DSCInputBitPerComponent[k] == 10.0
+				|| mode_lib->vba.DSCInputBitPerComponent[k] == 8.0
+				|| mode_lib->vba.DSCInputBitPerComponent[k] >
+				mode_lib->vba.MaximumDSCBitsPerComponent)) {
+			mode_lib->vba.NonsupportedDSCInputBPC = true;
+		}
+	}
+
+	for (i = 0; i < v->soc.num_states; ++i) {
+		unsigned int TotalSlots;
+
+		mode_lib->vba.ExceededMultistreamSlots[i] = false;
+		for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+			if (mode_lib->vba.OutputMultistreamEn[k] == true && mode_lib->vba.OutputMultistreamId[k] == k) {
+				TotalSlots = mode_lib->vba.RequiredSlots[i][k];
+				for (j = 0; j < mode_lib->vba.NumberOfActiveSurfaces; ++j) {
+					if (mode_lib->vba.OutputMultistreamId[j] == k)
+						TotalSlots = TotalSlots + mode_lib->vba.RequiredSlots[i][j];
+				}
+				if (mode_lib->vba.Output[k] == dm_dp && TotalSlots > 63)
+					mode_lib->vba.ExceededMultistreamSlots[i] = true;
+				if (mode_lib->vba.Output[k] == dm_dp2p0 && TotalSlots > 64)
+					mode_lib->vba.ExceededMultistreamSlots[i] = true;
+			}
+		}
+		mode_lib->vba.LinkCapacitySupport[i] = true;
+		for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+			if (mode_lib->vba.BlendingAndTiming[k] == k
+					&& (mode_lib->vba.Output[k] == dm_dp || mode_lib->vba.Output[k] == dm_dp2p0
+							|| mode_lib->vba.Output[k] == dm_edp
+							|| mode_lib->vba.Output[k] == dm_hdmi)
+					&& mode_lib->vba.OutputBppPerState[i][k] == 0) {
+				mode_lib->vba.LinkCapacitySupport[i] = false;
+			}
+		}
+	}
+
+	mode_lib->vba.P2IWith420 = false;
+	mode_lib->vba.DSCOnlyIfNecessaryWithBPP = false;
+	mode_lib->vba.DSC422NativeNotSupported = false;
+	mode_lib->vba.LinkRateDoesNotMatchDPVersion = false;
+	mode_lib->vba.LinkRateForMultistreamNotIndicated = false;
+	mode_lib->vba.BPPForMultistreamNotIndicated = false;
+	mode_lib->vba.MultistreamWithHDMIOreDP = false;
+	mode_lib->vba.MSOOrODMSplitWithNonDPLink = false;
+	mode_lib->vba.NotEnoughLanesForMSO = false;
+
+	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+		if (mode_lib->vba.BlendingAndTiming[k] == k
+				&& (mode_lib->vba.Output[k] == dm_dp || mode_lib->vba.Output[k] == dm_dp2p0
+						|| mode_lib->vba.Output[k] == dm_edp
+						|| mode_lib->vba.Output[k] == dm_hdmi)) {
+			if (mode_lib->vba.OutputFormat[k]
+					== dm_420 && mode_lib->vba.Interlace[k] == 1 &&
+					mode_lib->vba.ProgressiveToInterlaceUnitInOPP == true)
+				mode_lib->vba.P2IWith420 = true;
+
+			if (mode_lib->vba.DSCEnable[k] && mode_lib->vba.ForcedOutputLinkBPP[k] != 0)
+				mode_lib->vba.DSCOnlyIfNecessaryWithBPP = true;
+			if ((mode_lib->vba.DSCEnable[k] || mode_lib->vba.DSCEnable[k])
+					&& mode_lib->vba.OutputFormat[k] == dm_n422
+					&& !mode_lib->vba.DSC422NativeSupport)
+				mode_lib->vba.DSC422NativeNotSupported = true;
+
+			if (((mode_lib->vba.OutputLinkDPRate[k] == dm_dp_rate_hbr
+					|| mode_lib->vba.OutputLinkDPRate[k] == dm_dp_rate_hbr2
+					|| mode_lib->vba.OutputLinkDPRate[k] == dm_dp_rate_hbr3)
+					&& mode_lib->vba.Output[k] != dm_dp && mode_lib->vba.Output[k] != dm_edp)
+					|| ((mode_lib->vba.OutputLinkDPRate[k] == dm_dp_rate_uhbr10
+							|| mode_lib->vba.OutputLinkDPRate[k] == dm_dp_rate_uhbr13p5
+							|| mode_lib->vba.OutputLinkDPRate[k] == dm_dp_rate_uhbr20)
+							&& mode_lib->vba.Output[k] != dm_dp2p0))
+				mode_lib->vba.LinkRateDoesNotMatchDPVersion = true;
+
+			if (mode_lib->vba.OutputMultistreamEn[k] == true) {
+				if (mode_lib->vba.OutputMultistreamId[k] == k
+					&& mode_lib->vba.OutputLinkDPRate[k] == dm_dp_rate_na)
+					mode_lib->vba.LinkRateForMultistreamNotIndicated = true;
+				if (mode_lib->vba.OutputMultistreamId[k] == k && mode_lib->vba.ForcedOutputLinkBPP[k] == 0)
+					mode_lib->vba.BPPForMultistreamNotIndicated = true;
+				for (j = 0; j < mode_lib->vba.NumberOfActiveSurfaces; ++j) {
+					if (mode_lib->vba.OutputMultistreamId[k] == j && mode_lib->vba.OutputMultistreamEn[k]
+						&& mode_lib->vba.ForcedOutputLinkBPP[k] == 0)
+						mode_lib->vba.BPPForMultistreamNotIndicated = true;
+				}
+			}
+
+			if ((mode_lib->vba.Output[k] == dm_edp || mode_lib->vba.Output[k] == dm_hdmi)) {
+				if (mode_lib->vba.OutputMultistreamId[k] == k && mode_lib->vba.OutputMultistreamEn[k])
+					mode_lib->vba.MultistreamWithHDMIOreDP = true;
+
+				for (j = 0; j < mode_lib->vba.NumberOfActiveSurfaces; ++j) {
+					if (mode_lib->vba.OutputMultistreamEn[k] == true && mode_lib->vba.OutputMultistreamId[k] == j)
+						mode_lib->vba.MultistreamWithHDMIOreDP = true;
+				}
+			}
+
+			if (mode_lib->vba.Output[k] != dm_dp
+					&& (mode_lib->vba.ODMUse[k] == dm_odm_split_policy_1to2
+							|| mode_lib->vba.ODMUse[k] == dm_odm_mso_policy_1to2
+							|| mode_lib->vba.ODMUse[k] == dm_odm_mso_policy_1to4))
+				mode_lib->vba.MSOOrODMSplitWithNonDPLink = true;
+
+			if ((mode_lib->vba.ODMUse[k] == dm_odm_mso_policy_1to2
+					&& mode_lib->vba.OutputLinkDPLanes[k] < 2)
+					|| (mode_lib->vba.ODMUse[k] == dm_odm_mso_policy_1to4
+							&& mode_lib->vba.OutputLinkDPLanes[k] < 4))
+				mode_lib->vba.NotEnoughLanesForMSO = true;
+		}
+	}
+
+	for (i = 0; i < v->soc.num_states; ++i) {
+		mode_lib->vba.DTBCLKRequiredMoreThanSupported[i] = false;
+		for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+			if (mode_lib->vba.BlendingAndTiming[k] == k
+					&& dml32_RequiredDTBCLK(mode_lib->vba.RequiresDSC[i][k],
+							mode_lib->vba.PixelClockBackEnd[k],
+							mode_lib->vba.OutputFormat[k],
+							mode_lib->vba.OutputBppPerState[i][k],
+							mode_lib->vba.NumberOfDSCSlices[k], mode_lib->vba.HTotal[k],
+							mode_lib->vba.HActive[k], mode_lib->vba.AudioSampleRate[k],
+							mode_lib->vba.AudioSampleLayout[k])
+							> mode_lib->vba.DTBCLKPerState[i]) {
+				mode_lib->vba.DTBCLKRequiredMoreThanSupported[i] = true;
+			}
+		}
+	}
+
+	for (i = 0; i < v->soc.num_states; ++i) {
+		mode_lib->vba.ODMCombine2To1SupportCheckOK[i] = true;
+		mode_lib->vba.ODMCombine4To1SupportCheckOK[i] = true;
+		for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+			if (mode_lib->vba.BlendingAndTiming[k] == k
+					&& mode_lib->vba.ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_2to1
+					&& mode_lib->vba.Output[k] == dm_hdmi) {
+				mode_lib->vba.ODMCombine2To1SupportCheckOK[i] = false;
+			}
+			if (mode_lib->vba.BlendingAndTiming[k] == k
+					&& mode_lib->vba.ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_4to1
+					&& (mode_lib->vba.Output[k] == dm_dp || mode_lib->vba.Output[k] == dm_edp
+							|| mode_lib->vba.Output[k] == dm_hdmi)) {
+				mode_lib->vba.ODMCombine4To1SupportCheckOK[i] = false;
+			}
+		}
+	}
+
+	for (i = 0; i < v->soc.num_states; i++) {
+		mode_lib->vba.DSCCLKRequiredMoreThanSupported[i] = false;
+		for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
+			if (mode_lib->vba.BlendingAndTiming[k] == k) {
+				if (mode_lib->vba.Output[k] == dm_dp || mode_lib->vba.Output[k] == dm_dp2p0
+						|| mode_lib->vba.Output[k] == dm_edp) {
+					if (mode_lib->vba.OutputFormat[k] == dm_420) {
+						mode_lib->vba.DSCFormatFactor = 2;
+					} else if (mode_lib->vba.OutputFormat[k] == dm_444) {
+						mode_lib->vba.DSCFormatFactor = 1;
+					} else if (mode_lib->vba.OutputFormat[k] == dm_n422) {
+						mode_lib->vba.DSCFormatFactor = 2;
+					} else {
+						mode_lib->vba.DSCFormatFactor = 1;
+					}
+					if (mode_lib->vba.RequiresDSC[i][k] == true) {
+						if (mode_lib->vba.ODMCombineEnablePerState[i][k]
+								== dm_odm_combine_mode_4to1) {
+							if (mode_lib->vba.PixelClockBackEnd[k] / 12.0 / mode_lib->vba.DSCFormatFactor > (1.0 - mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading / 100.0) * mode_lib->vba.MaxDSCCLK[i])
+								mode_lib->vba.DSCCLKRequiredMoreThanSupported[i] = true;
+						} else if (mode_lib->vba.ODMCombineEnablePerState[i][k]
+								== dm_odm_combine_mode_2to1) {
+							if (mode_lib->vba.PixelClockBackEnd[k] / 6.0 / mode_lib->vba.DSCFormatFactor > (1.0 - mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading / 100.0) * mode_lib->vba.MaxDSCCLK[i])
+								mode_lib->vba.DSCCLKRequiredMoreThanSupported[i] = true;
+						} else {
+							if (mode_lib->vba.PixelClockBackEnd[k] / 3.0 / mode_lib->vba.DSCFormatFactor > (1.0 - mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading / 100.0) * mode_lib->vba.MaxDSCCLK[i])
+								mode_lib->vba.DSCCLKRequiredMoreThanSupported[i] = true;
+						}
+					}
+				}
+			}
+		}
+	}
+
+	/* Check DSC Unit and Slices Support */
+	TotalDSCUnitsRequired = 0;
+
+	for (i = 0; i < v->soc.num_states; ++i) {
+		mode_lib->vba.NotEnoughDSCUnits[i] = false;
+		mode_lib->vba.NotEnoughDSCSlices[i] = false;
+		TotalDSCUnitsRequired = 0;
+		mode_lib->vba.PixelsPerLinePerDSCUnitSupport[i] = true;
+		for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+			if (mode_lib->vba.RequiresDSC[i][k] == true) {
+				if (mode_lib->vba.ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_4to1) {
+					if (mode_lib->vba.HActive[k]
+							> 4 * mode_lib->vba.MaximumPixelsPerLinePerDSCUnit)
+						mode_lib->vba.PixelsPerLinePerDSCUnitSupport[i] = false;
+					TotalDSCUnitsRequired = TotalDSCUnitsRequired + 4;
+					if (mode_lib->vba.NumberOfDSCSlices[k] > 16)
+						mode_lib->vba.NotEnoughDSCSlices[i] = true;
+				} else if (mode_lib->vba.ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_2to1) {
+					if (mode_lib->vba.HActive[k]
+							> 2 * mode_lib->vba.MaximumPixelsPerLinePerDSCUnit)
+						mode_lib->vba.PixelsPerLinePerDSCUnitSupport[i] = false;
+					TotalDSCUnitsRequired = TotalDSCUnitsRequired + 2;
+					if (mode_lib->vba.NumberOfDSCSlices[k] > 8)
+						mode_lib->vba.NotEnoughDSCSlices[i] = true;
+				} else {
+					if (mode_lib->vba.HActive[k] > mode_lib->vba.MaximumPixelsPerLinePerDSCUnit)
+						mode_lib->vba.PixelsPerLinePerDSCUnitSupport[i] = false;
+					TotalDSCUnitsRequired = TotalDSCUnitsRequired + 1;
+					if (mode_lib->vba.NumberOfDSCSlices[k] > 4)
+						mode_lib->vba.NotEnoughDSCSlices[i] = true;
+				}
+			}
+		}
+		if (TotalDSCUnitsRequired > mode_lib->vba.NumberOfDSC)
+			mode_lib->vba.NotEnoughDSCUnits[i] = true;
+	}
+
+	/*DSC Delay per state*/
+	for (i = 0; i < v->soc.num_states; ++i) {
+		unsigned int m;
+
+		for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+			mode_lib->vba.DSCDelayPerState[i][k] = dml32_DSCDelayRequirement(
+					mode_lib->vba.RequiresDSC[i][k], mode_lib->vba.ODMCombineEnablePerState[i][k],
+					mode_lib->vba.DSCInputBitPerComponent[k],
+					mode_lib->vba.OutputBppPerState[i][k], mode_lib->vba.HActive[k],
+					mode_lib->vba.HTotal[k], mode_lib->vba.NumberOfDSCSlices[k],
+					mode_lib->vba.OutputFormat[k], mode_lib->vba.Output[k],
+					mode_lib->vba.PixelClock[k], mode_lib->vba.PixelClockBackEnd[k]);
+		}
+
+		m = 0;
+
+		for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
+			for (m = 0; m <= mode_lib->vba.NumberOfActiveSurfaces - 1; m++) {
+				for (j = 0; j <= mode_lib->vba.NumberOfActiveSurfaces - 1; j++) {
+					if (mode_lib->vba.BlendingAndTiming[k] == m &&
+							mode_lib->vba.RequiresDSC[i][m] == true) {
+						mode_lib->vba.DSCDelayPerState[i][k] =
+							mode_lib->vba.DSCDelayPerState[i][m];
+					}
+				}
+			}
+		}
+	}
+
+	//Calculate Swath, DET Configuration, DCFCLKDeepSleep
+	//
+	for (i = 0; i < (int) v->soc.num_states; ++i) {
+		for (j = 0; j <= 1; ++j) {
+			bool dummy_boolean_array[1][DC__NUM_DPP__MAX];
+			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+				mode_lib->vba.RequiredDPPCLKThisState[k] = mode_lib->vba.RequiredDPPCLK[i][j][k];
+				mode_lib->vba.NoOfDPPThisState[k] = mode_lib->vba.NoOfDPP[i][j][k];
+				mode_lib->vba.ODMCombineEnableThisState[k] =
+						mode_lib->vba.ODMCombineEnablePerState[i][k];
+			}
+
+			dml32_CalculateSwathAndDETConfiguration(
+					mode_lib->vba.DETSizeOverride,
+					mode_lib->vba.UsesMALLForPStateChange,
+					mode_lib->vba.ConfigReturnBufferSizeInKByte,
+					mode_lib->vba.MaxTotalDETInKByte,
+					mode_lib->vba.MinCompressedBufferSizeInKByte,
+					false, /* ForceSingleDPP */
+					mode_lib->vba.NumberOfActiveSurfaces,
+					mode_lib->vba.nomDETInKByte,
+					mode_lib->vba.UseUnboundedRequesting,
+					mode_lib->vba.CompressedBufferSegmentSizeInkByteFinal,
+					mode_lib->vba.Output,
+					mode_lib->vba.ReadBandwidthLuma,
+					mode_lib->vba.ReadBandwidthChroma,
+					mode_lib->vba.MaximumSwathWidthLuma,
+					mode_lib->vba.MaximumSwathWidthChroma,
+					mode_lib->vba.SourceRotation,
+					mode_lib->vba.ViewportStationary,
+					mode_lib->vba.SourcePixelFormat,
+					mode_lib->vba.SurfaceTiling,
+					mode_lib->vba.ViewportWidth,
+					mode_lib->vba.ViewportHeight,
+					mode_lib->vba.ViewportXStartY,
+					mode_lib->vba.ViewportYStartY,
+					mode_lib->vba.ViewportXStartC,
+					mode_lib->vba.ViewportYStartC,
+					mode_lib->vba.SurfaceWidthY,
+					mode_lib->vba.SurfaceWidthC,
+					mode_lib->vba.SurfaceHeightY,
+					mode_lib->vba.SurfaceHeightC,
+					mode_lib->vba.Read256BlockHeightY,
+					mode_lib->vba.Read256BlockHeightC,
+					mode_lib->vba.Read256BlockWidthY,
+					mode_lib->vba.Read256BlockWidthC,
+					mode_lib->vba.ODMCombineEnableThisState,
+					mode_lib->vba.BlendingAndTiming,
+					mode_lib->vba.BytePerPixelY,
+					mode_lib->vba.BytePerPixelC,
+					mode_lib->vba.BytePerPixelInDETY,
+					mode_lib->vba.BytePerPixelInDETC,
+					mode_lib->vba.HActive,
+					mode_lib->vba.HRatio,
+					mode_lib->vba.HRatioChroma,
+					mode_lib->vba.NoOfDPPThisState,
+					/* Output */
+					mode_lib->vba.swath_width_luma_ub_this_state,
+					mode_lib->vba.swath_width_chroma_ub_this_state,
+					mode_lib->vba.SwathWidthYThisState,
+					mode_lib->vba.SwathWidthCThisState,
+					mode_lib->vba.SwathHeightYThisState,
+					mode_lib->vba.SwathHeightCThisState,
+					mode_lib->vba.DETBufferSizeInKByteThisState,
+					mode_lib->vba.DETBufferSizeYThisState,
+					mode_lib->vba.DETBufferSizeCThisState,
+					&mode_lib->vba.UnboundedRequestEnabledThisState,
+					&mode_lib->vba.CompressedBufferSizeInkByteThisState,
+					dummy_boolean_array[0],
+					&mode_lib->vba.ViewportSizeSupport[i][j]);
+
+			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+				mode_lib->vba.swath_width_luma_ub_all_states[i][j][k] =
+						mode_lib->vba.swath_width_luma_ub_this_state[k];
+				mode_lib->vba.swath_width_chroma_ub_all_states[i][j][k] =
+						mode_lib->vba.swath_width_chroma_ub_this_state[k];
+				mode_lib->vba.SwathWidthYAllStates[i][j][k] = mode_lib->vba.SwathWidthYThisState[k];
+				mode_lib->vba.SwathWidthCAllStates[i][j][k] = mode_lib->vba.SwathWidthCThisState[k];
+				mode_lib->vba.SwathHeightYAllStates[i][j][k] = mode_lib->vba.SwathHeightYThisState[k];
+				mode_lib->vba.SwathHeightCAllStates[i][j][k] = mode_lib->vba.SwathHeightCThisState[k];
+				mode_lib->vba.UnboundedRequestEnabledAllStates[i][j] =
+						mode_lib->vba.UnboundedRequestEnabledThisState;
+				mode_lib->vba.CompressedBufferSizeInkByteAllStates[i][j] =
+						mode_lib->vba.CompressedBufferSizeInkByteThisState;
+				mode_lib->vba.DETBufferSizeInKByteAllStates[i][j][k] =
+						mode_lib->vba.DETBufferSizeInKByteThisState[k];
+				mode_lib->vba.DETBufferSizeYAllStates[i][j][k] =
+						mode_lib->vba.DETBufferSizeYThisState[k];
+				mode_lib->vba.DETBufferSizeCAllStates[i][j][k] =
+						mode_lib->vba.DETBufferSizeCThisState[k];
+			}
+		}
+	}
+
+	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+		mode_lib->vba.cursor_bw[k] = mode_lib->vba.NumberOfCursors[k] * mode_lib->vba.CursorWidth[k][0]
+				* mode_lib->vba.CursorBPP[k][0] / 8.0
+				/ (mode_lib->vba.HTotal[k] / mode_lib->vba.PixelClock[k]) * mode_lib->vba.VRatio[k];
+	}
+
+	dml32_CalculateSurfaceSizeInMall(
+			mode_lib->vba.NumberOfActiveSurfaces,
+			mode_lib->vba.MALLAllocatedForDCNFinal,
+			mode_lib->vba.UseMALLForStaticScreen,
+			mode_lib->vba.DCCEnable,
+			mode_lib->vba.ViewportStationary,
+			mode_lib->vba.ViewportXStartY,
+			mode_lib->vba.ViewportYStartY,
+			mode_lib->vba.ViewportXStartC,
+			mode_lib->vba.ViewportYStartC,
+			mode_lib->vba.ViewportWidth,
+			mode_lib->vba.ViewportHeight,
+			mode_lib->vba.BytePerPixelY,
+			mode_lib->vba.ViewportWidthChroma,
+			mode_lib->vba.ViewportHeightChroma,
+			mode_lib->vba.BytePerPixelC,
+			mode_lib->vba.SurfaceWidthY,
+			mode_lib->vba.SurfaceWidthC,
+			mode_lib->vba.SurfaceHeightY,
+			mode_lib->vba.SurfaceHeightC,
+			mode_lib->vba.Read256BlockWidthY,
+			mode_lib->vba.Read256BlockWidthC,
+			mode_lib->vba.Read256BlockHeightY,
+			mode_lib->vba.Read256BlockHeightC,
+			mode_lib->vba.MicroTileWidthY,
+			mode_lib->vba.MicroTileWidthC,
+			mode_lib->vba.MicroTileHeightY,
+			mode_lib->vba.MicroTileHeightC,
+
+			/* Output */
+			mode_lib->vba.SurfaceSizeInMALL,
+			&mode_lib->vba.ExceededMALLSize);
+
+	for (i = 0; i < v->soc.num_states; i++) {
+		for (j = 0; j < 2; j++) {
+			for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
+				mode_lib->vba.swath_width_luma_ub_this_state[k] =
+						mode_lib->vba.swath_width_luma_ub_all_states[i][j][k];
+				mode_lib->vba.swath_width_chroma_ub_this_state[k] =
+						mode_lib->vba.swath_width_chroma_ub_all_states[i][j][k];
+				mode_lib->vba.SwathWidthYThisState[k] = mode_lib->vba.SwathWidthYAllStates[i][j][k];
+				mode_lib->vba.SwathWidthCThisState[k] = mode_lib->vba.SwathWidthCAllStates[i][j][k];
+				mode_lib->vba.SwathHeightYThisState[k] = mode_lib->vba.SwathHeightYAllStates[i][j][k];
+				mode_lib->vba.SwathHeightCThisState[k] = mode_lib->vba.SwathHeightCAllStates[i][j][k];
+				mode_lib->vba.DETBufferSizeInKByteThisState[k] =
+						mode_lib->vba.DETBufferSizeInKByteAllStates[i][j][k];
+				mode_lib->vba.DETBufferSizeYThisState[k] =
+						mode_lib->vba.DETBufferSizeYAllStates[i][j][k];
+				mode_lib->vba.DETBufferSizeCThisState[k] =
+						mode_lib->vba.DETBufferSizeCAllStates[i][j][k];
+				mode_lib->vba.RequiredDPPCLKThisState[k] = mode_lib->vba.RequiredDPPCLK[i][j][k];
+				mode_lib->vba.NoOfDPPThisState[k] = mode_lib->vba.NoOfDPP[i][j][k];
+			}
+
+			mode_lib->vba.TotalNumberOfDCCActiveDPP[i][j] = 0;
+			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+				if (mode_lib->vba.DCCEnable[k] == true) {
+					mode_lib->vba.TotalNumberOfDCCActiveDPP[i][j] =
+							mode_lib->vba.TotalNumberOfDCCActiveDPP[i][j]
+									+ mode_lib->vba.NoOfDPP[i][j][k];
+				}
+			}
+
+
+			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].PixelClock = mode_lib->vba.PixelClock[k];
+				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].DPPPerSurface = mode_lib->vba.NoOfDPP[i][j][k];
+				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].SourceRotation = mode_lib->vba.SourceRotation[k];
+				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].ViewportHeight = mode_lib->vba.ViewportHeight[k];
+				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].ViewportHeightChroma = mode_lib->vba.ViewportHeightChroma[k];
+				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].BlockWidth256BytesY = mode_lib->vba.Read256BlockWidthY[k];
+				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].BlockHeight256BytesY = mode_lib->vba.Read256BlockHeightY[k];
+				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].BlockWidth256BytesC = mode_lib->vba.Read256BlockWidthC[k];
+				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].BlockHeight256BytesC = mode_lib->vba.Read256BlockHeightC[k];
+				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].BlockWidthY = mode_lib->vba.MicroTileWidthY[k];
+				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].BlockHeightY = mode_lib->vba.MicroTileHeightY[k];
+				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].BlockWidthC = mode_lib->vba.MicroTileWidthC[k];
+				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].BlockHeightC = mode_lib->vba.MicroTileHeightC[k];
+				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].InterlaceEnable = mode_lib->vba.Interlace[k];
+				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].HTotal = mode_lib->vba.HTotal[k];
+				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].DCCEnable = mode_lib->vba.DCCEnable[k];
+				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].SourcePixelFormat = mode_lib->vba.SourcePixelFormat[k];
+				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].SurfaceTiling = mode_lib->vba.SurfaceTiling[k];
+				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].BytePerPixelY = mode_lib->vba.BytePerPixelY[k];
+				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].BytePerPixelC = mode_lib->vba.BytePerPixelC[k];
+				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].ProgressiveToInterlaceUnitInOPP =
+				mode_lib->vba.ProgressiveToInterlaceUnitInOPP;
+				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].VRatio = mode_lib->vba.VRatio[k];
+				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].VRatioChroma = mode_lib->vba.VRatioChroma[k];
+				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].VTaps = mode_lib->vba.vtaps[k];
+				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].VTapsChroma = mode_lib->vba.VTAPsChroma[k];
+				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].PitchY = mode_lib->vba.PitchY[k];
+				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].DCCMetaPitchY = mode_lib->vba.DCCMetaPitchY[k];
+				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].PitchC = mode_lib->vba.PitchC[k];
+				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].DCCMetaPitchC = mode_lib->vba.DCCMetaPitchC[k];
+				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].ViewportStationary = mode_lib->vba.ViewportStationary[k];
+				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].ViewportXStart = mode_lib->vba.ViewportXStartY[k];
+				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].ViewportYStart = mode_lib->vba.ViewportYStartY[k];
+				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].ViewportXStartC = mode_lib->vba.ViewportXStartC[k];
+				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].ViewportYStartC = mode_lib->vba.ViewportYStartC[k];
+				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].FORCE_ONE_ROW_FOR_FRAME = mode_lib->vba.ForceOneRowForFrame[k];
+				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].SwathHeightY = mode_lib->vba.SwathHeightYThisState[k];
+				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].SwathHeightC = mode_lib->vba.SwathHeightCThisState[k];
+			}
+
+			{
+				bool dummy_boolean_array[2][DC__NUM_DPP__MAX];
+				unsigned int dummy_integer_array[22][DC__NUM_DPP__MAX];
+
+				dml32_CalculateVMRowAndSwath(
+						mode_lib->vba.NumberOfActiveSurfaces,
+						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters,
+						mode_lib->vba.SurfaceSizeInMALL,
+						mode_lib->vba.PTEBufferSizeInRequestsLuma,
+						mode_lib->vba.PTEBufferSizeInRequestsChroma,
+						mode_lib->vba.DCCMetaBufferSizeBytes,
+						mode_lib->vba.UseMALLForStaticScreen,
+						mode_lib->vba.UsesMALLForPStateChange,
+						mode_lib->vba.MALLAllocatedForDCNFinal,
+						mode_lib->vba.SwathWidthYThisState,
+						mode_lib->vba.SwathWidthCThisState,
+						mode_lib->vba.GPUVMEnable,
+						mode_lib->vba.HostVMEnable,
+						mode_lib->vba.HostVMMaxNonCachedPageTableLevels,
+						mode_lib->vba.GPUVMMaxPageTableLevels,
+						mode_lib->vba.GPUVMMinPageSizeKBytes,
+						mode_lib->vba.HostVMMinPageSize,
+
+						/* Output */
+						mode_lib->vba.PTEBufferSizeNotExceededPerState,
+						mode_lib->vba.DCCMetaBufferSizeNotExceededPerState,
+						dummy_integer_array[0],
+						dummy_integer_array[1],
+						mode_lib->vba.dpte_row_height,
+						mode_lib->vba.dpte_row_height_chroma,
+						dummy_integer_array[2],
+						dummy_integer_array[3],
+						dummy_integer_array[4],
+						dummy_integer_array[5],
+						dummy_integer_array[6],
+						dummy_integer_array[7],
+						dummy_integer_array[8],
+						dummy_integer_array[9],
+						mode_lib->vba.meta_row_height,
+						mode_lib->vba.meta_row_height_chroma,
+						dummy_integer_array[10],
+						mode_lib->vba.dpte_group_bytes,
+						dummy_integer_array[11],
+						dummy_integer_array[12],
+						dummy_integer_array[13],
+						dummy_integer_array[14],
+						dummy_integer_array[15],
+						dummy_integer_array[16],
+						dummy_integer_array[17],
+						dummy_integer_array[18],
+						dummy_integer_array[19],
+						dummy_integer_array[20],
+						mode_lib->vba.PrefetchLinesYThisState,
+						mode_lib->vba.PrefetchLinesCThisState,
+						mode_lib->vba.PrefillY,
+						mode_lib->vba.PrefillC,
+						mode_lib->vba.MaxNumSwY,
+						mode_lib->vba.MaxNumSwC,
+						mode_lib->vba.meta_row_bandwidth_this_state,
+						mode_lib->vba.dpte_row_bandwidth_this_state,
+						mode_lib->vba.DPTEBytesPerRowThisState,
+						mode_lib->vba.PDEAndMetaPTEBytesPerFrameThisState,
+						mode_lib->vba.MetaRowBytesThisState,
+						mode_lib->vba.use_one_row_for_frame_this_state,
+						mode_lib->vba.use_one_row_for_frame_flip_this_state,
+						dummy_boolean_array[0], // Boolean UsesMALLForStaticScreen[]
+						dummy_boolean_array[1], // Boolean PTE_BUFFER_MODE[]
+						dummy_integer_array[21]); // Long BIGK_FRAGMENT_SIZE[]
+			}
+
+			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+				mode_lib->vba.PrefetchLinesY[i][j][k] = mode_lib->vba.PrefetchLinesYThisState[k];
+				mode_lib->vba.PrefetchLinesC[i][j][k] = mode_lib->vba.PrefetchLinesCThisState[k];
+				mode_lib->vba.meta_row_bandwidth[i][j][k] =
+						mode_lib->vba.meta_row_bandwidth_this_state[k];
+				mode_lib->vba.dpte_row_bandwidth[i][j][k] =
+						mode_lib->vba.dpte_row_bandwidth_this_state[k];
+				mode_lib->vba.DPTEBytesPerRow[i][j][k] = mode_lib->vba.DPTEBytesPerRowThisState[k];
+				mode_lib->vba.PDEAndMetaPTEBytesPerFrame[i][j][k] =
+						mode_lib->vba.PDEAndMetaPTEBytesPerFrameThisState[k];
+				mode_lib->vba.MetaRowBytes[i][j][k] = mode_lib->vba.MetaRowBytesThisState[k];
+				mode_lib->vba.use_one_row_for_frame[i][j][k] =
+						mode_lib->vba.use_one_row_for_frame_this_state[k];
+				mode_lib->vba.use_one_row_for_frame_flip[i][j][k] =
+						mode_lib->vba.use_one_row_for_frame_flip_this_state[k];
+			}
+
+			mode_lib->vba.PTEBufferSizeNotExceeded[i][j] = true;
+			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+				if (mode_lib->vba.PTEBufferSizeNotExceededPerState[k] == false)
+					mode_lib->vba.PTEBufferSizeNotExceeded[i][j] = false;
+			}
+
+			mode_lib->vba.DCCMetaBufferSizeNotExceeded[i][j] = true;
+			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+				if (mode_lib->vba.DCCMetaBufferSizeNotExceededPerState[k] == false)
+					mode_lib->vba.DCCMetaBufferSizeNotExceeded[i][j] = false;
+			}
+
+			mode_lib->vba.UrgLatency[i] = dml32_CalculateUrgentLatency(
+					mode_lib->vba.UrgentLatencyPixelDataOnly,
+					mode_lib->vba.UrgentLatencyPixelMixedWithVMData,
+					mode_lib->vba.UrgentLatencyVMDataOnly, mode_lib->vba.DoUrgentLatencyAdjustment,
+					mode_lib->vba.UrgentLatencyAdjustmentFabricClockComponent,
+					mode_lib->vba.UrgentLatencyAdjustmentFabricClockReference,
+					mode_lib->vba.FabricClockPerState[i]);
+
+			//bool   NotUrgentLatencyHiding[DC__NUM_DPP__MAX];
+			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+				dml32_CalculateUrgentBurstFactor(
+						mode_lib->vba.UsesMALLForPStateChange[k],
+						mode_lib->vba.swath_width_luma_ub_this_state[k],
+						mode_lib->vba.swath_width_chroma_ub_this_state[k],
+						mode_lib->vba.SwathHeightYThisState[k],
+						mode_lib->vba.SwathHeightCThisState[k],
+						(double) mode_lib->vba.HTotal[k] / mode_lib->vba.PixelClock[k],
+						mode_lib->vba.UrgLatency[i],
+						mode_lib->vba.CursorBufferSize,
+						mode_lib->vba.CursorWidth[k][0],
+						mode_lib->vba.CursorBPP[k][0],
+						mode_lib->vba.VRatio[k],
+						mode_lib->vba.VRatioChroma[k],
+						mode_lib->vba.BytePerPixelInDETY[k],
+						mode_lib->vba.BytePerPixelInDETC[k],
+						mode_lib->vba.DETBufferSizeYThisState[k],
+						mode_lib->vba.DETBufferSizeCThisState[k],
+						/* Output */
+						&mode_lib->vba.UrgentBurstFactorCursor[k],
+						&mode_lib->vba.UrgentBurstFactorLuma[k],
+						&mode_lib->vba.UrgentBurstFactorChroma[k],
+						&mode_lib->vba.NoUrgentLatencyHiding[k]);
+			}
+
+			dml32_CalculateDCFCLKDeepSleep(
+					mode_lib->vba.NumberOfActiveSurfaces,
+					mode_lib->vba.BytePerPixelY,
+					mode_lib->vba.BytePerPixelC,
+					mode_lib->vba.VRatio,
+					mode_lib->vba.VRatioChroma,
+					mode_lib->vba.SwathWidthYThisState,
+					mode_lib->vba.SwathWidthCThisState,
+					mode_lib->vba.NoOfDPPThisState,
+					mode_lib->vba.HRatio,
+					mode_lib->vba.HRatioChroma,
+					mode_lib->vba.PixelClock,
+					mode_lib->vba.PSCL_FACTOR,
+					mode_lib->vba.PSCL_FACTOR_CHROMA,
+					mode_lib->vba.RequiredDPPCLKThisState,
+					mode_lib->vba.ReadBandwidthLuma,
+					mode_lib->vba.ReadBandwidthChroma,
+					mode_lib->vba.ReturnBusWidth,
+
+					/* Output */
+					&mode_lib->vba.ProjectedDCFCLKDeepSleep[i][j]);
+		}
+	}
+
+	m = 0;
+
+	//Calculate Return BW
+	for (i = 0; i < (int) v->soc.num_states; ++i) {
+		for (j = 0; j <= 1; ++j) {
+			for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
+				if (mode_lib->vba.BlendingAndTiming[k] == k) {
+					if (mode_lib->vba.WritebackEnable[k] == true) {
+						mode_lib->vba.WritebackDelayTime[k] =
+							mode_lib->vba.WritebackLatency
+						+ dml32_CalculateWriteBackDelay(
+							mode_lib->vba.WritebackPixelFormat[k],
+							mode_lib->vba.WritebackHRatio[k],
+							mode_lib->vba.WritebackVRatio[k],
+							mode_lib->vba.WritebackVTaps[k],
+							mode_lib->vba.WritebackDestinationWidth[k],
+							mode_lib->vba.WritebackDestinationHeight[k],
+							mode_lib->vba.WritebackSourceHeight[k],
+							mode_lib->vba.HTotal[k])
+							/ mode_lib->vba.RequiredDISPCLK[i][j];
+					} else {
+						mode_lib->vba.WritebackDelayTime[k] = 0.0;
+					}
+					for (m = 0; m <= mode_lib->vba.NumberOfActiveSurfaces - 1; m++) {
+						if (mode_lib->vba.BlendingAndTiming[m]
+								== k && mode_lib->vba.WritebackEnable[m] == true) {
+							mode_lib->vba.WritebackDelayTime[k] =
+								dml_max(mode_lib->vba.WritebackDelayTime[k],
+									mode_lib->vba.WritebackLatency
+								+ dml32_CalculateWriteBackDelay(
+									mode_lib->vba.WritebackPixelFormat[m],
+									mode_lib->vba.WritebackHRatio[m],
+									mode_lib->vba.WritebackVRatio[m],
+									mode_lib->vba.WritebackVTaps[m],
+									mode_lib->vba.WritebackDestinationWidth[m],
+									mode_lib->vba.WritebackDestinationHeight[m],
+									mode_lib->vba.WritebackSourceHeight[m],
+									mode_lib->vba.HTotal[m]) /
+									mode_lib->vba.RequiredDISPCLK[i][j]);
+						}
+					}
+				}
+			}
+			for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
+				for (m = 0; m <= mode_lib->vba.NumberOfActiveSurfaces - 1; m++) {
+					if (mode_lib->vba.BlendingAndTiming[k] == m) {
+						mode_lib->vba.WritebackDelayTime[k] =
+								mode_lib->vba.WritebackDelayTime[m];
+					}
+				}
+			}
+			mode_lib->vba.MaxMaxVStartup[i][j] = 0;
+			for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
+				mode_lib->vba.MaximumVStartup[i][j][k] = ((mode_lib->vba.Interlace[k] &&
+								!mode_lib->vba.ProgressiveToInterlaceUnitInOPP) ?
+								dml_floor((mode_lib->vba.VTotal[k] -
+									mode_lib->vba.VActive[k]) / 2.0, 1.0) :
+								mode_lib->vba.VTotal[k] - mode_lib->vba.VActive[k])
+								- dml_max(1.0, dml_ceil(1.0 *
+									mode_lib->vba.WritebackDelayTime[k] /
+									(mode_lib->vba.HTotal[k] /
+									mode_lib->vba.PixelClock[k]), 1.0));
+
+				// Clamp to max OTG vstartup register limit
+				if (mode_lib->vba.MaximumVStartup[i][j][k] > 1023)
+					mode_lib->vba.MaximumVStartup[i][j][k] = 1023;
+
+				mode_lib->vba.MaxMaxVStartup[i][j] = dml_max(mode_lib->vba.MaxMaxVStartup[i][j],
+						mode_lib->vba.MaximumVStartup[i][j][k]);
+			}
+		}
+	}
+
+	ReorderingBytes = mode_lib->vba.NumberOfChannels
+			* dml_max3(mode_lib->vba.UrgentOutOfOrderReturnPerChannelPixelDataOnly,
+					mode_lib->vba.UrgentOutOfOrderReturnPerChannelPixelMixedWithVMData,
+					mode_lib->vba.UrgentOutOfOrderReturnPerChannelVMDataOnly);
+
+	dml32_CalculateMinAndMaxPrefetchMode(mode_lib->vba.AllowForPStateChangeOrStutterInVBlankFinal,
+			&mode_lib->vba.MinPrefetchMode,
+			&mode_lib->vba.MaxPrefetchMode);
+
+	for (i = 0; i < (int) v->soc.num_states; ++i) {
+		for (j = 0; j <= 1; ++j)
+			mode_lib->vba.DCFCLKState[i][j] = mode_lib->vba.DCFCLKPerState[i];
+	}
+
+	/* Immediate Flip and MALL parameters */
+	mode_lib->vba.ImmediateFlipRequiredFinal = false;
+	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+		mode_lib->vba.ImmediateFlipRequiredFinal = mode_lib->vba.ImmediateFlipRequiredFinal
+				|| (mode_lib->vba.ImmediateFlipRequirement[k] == dm_immediate_flip_required);
+	}
+
+	mode_lib->vba.ImmediateFlipRequiredButTheRequirementForEachSurfaceIsNotSpecified = false;
+	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+		mode_lib->vba.ImmediateFlipRequiredButTheRequirementForEachSurfaceIsNotSpecified =
+				mode_lib->vba.ImmediateFlipRequiredButTheRequirementForEachSurfaceIsNotSpecified
+						|| ((mode_lib->vba.ImmediateFlipRequirement[k]
+								!= dm_immediate_flip_required)
+								&& (mode_lib->vba.ImmediateFlipRequirement[k]
+										!= dm_immediate_flip_not_required));
+	}
+	mode_lib->vba.ImmediateFlipRequiredButTheRequirementForEachSurfaceIsNotSpecified =
+			mode_lib->vba.ImmediateFlipRequiredButTheRequirementForEachSurfaceIsNotSpecified
+					&& mode_lib->vba.ImmediateFlipRequiredFinal;
+
+	mode_lib->vba.ImmediateFlipOrHostVMAndPStateWithMALLFullFrameOrPhantomPipe = false;
+	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+		mode_lib->vba.ImmediateFlipOrHostVMAndPStateWithMALLFullFrameOrPhantomPipe =
+			mode_lib->vba.ImmediateFlipOrHostVMAndPStateWithMALLFullFrameOrPhantomPipe ||
+			((mode_lib->vba.HostVMEnable == true || mode_lib->vba.ImmediateFlipRequirement[k] !=
+					dm_immediate_flip_not_required) &&
+			(mode_lib->vba.UsesMALLForPStateChange[k] == dm_use_mall_pstate_change_full_frame ||
+			mode_lib->vba.UsesMALLForPStateChange[k] == dm_use_mall_pstate_change_phantom_pipe));
+	}
+
+	mode_lib->vba.InvalidCombinationOfMALLUseForPStateAndStaticScreen = false;
+	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+		mode_lib->vba.InvalidCombinationOfMALLUseForPStateAndStaticScreen =
+			mode_lib->vba.InvalidCombinationOfMALLUseForPStateAndStaticScreen
+			|| ((mode_lib->vba.UseMALLForStaticScreen[k] == dm_use_mall_static_screen_enable
+			|| mode_lib->vba.UseMALLForStaticScreen[k] == dm_use_mall_static_screen_optimize)
+			&& (mode_lib->vba.UsesMALLForPStateChange[k] == dm_use_mall_pstate_change_phantom_pipe))
+			|| ((mode_lib->vba.UseMALLForStaticScreen[k] == dm_use_mall_static_screen_disable
+			|| mode_lib->vba.UseMALLForStaticScreen[k] == dm_use_mall_static_screen_optimize)
+			&& (mode_lib->vba.UsesMALLForPStateChange[k] == dm_use_mall_pstate_change_full_frame));
+	}
+
+	FullFrameMALLPStateMethod = false;
+	SubViewportMALLPStateMethod = false;
+	PhantomPipeMALLPStateMethod = false;
+
+	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+		if (mode_lib->vba.UsesMALLForPStateChange[k] == dm_use_mall_pstate_change_full_frame)
+			FullFrameMALLPStateMethod = true;
+		if (mode_lib->vba.UsesMALLForPStateChange[k] == dm_use_mall_pstate_change_sub_viewport)
+			SubViewportMALLPStateMethod = true;
+		if (mode_lib->vba.UsesMALLForPStateChange[k] == dm_use_mall_pstate_change_phantom_pipe)
+			PhantomPipeMALLPStateMethod = true;
+	}
+	mode_lib->vba.InvalidCombinationOfMALLUseForPState = (SubViewportMALLPStateMethod
+			!= PhantomPipeMALLPStateMethod) || (SubViewportMALLPStateMethod && FullFrameMALLPStateMethod);
+
+	if (mode_lib->vba.UseMinimumRequiredDCFCLK == true) {
+		dml32_UseMinimumDCFCLK(
+				mode_lib->vba.UsesMALLForPStateChange,
+				mode_lib->vba.DRRDisplay,
+				mode_lib->vba.SynchronizeDRRDisplaysForUCLKPStateChangeFinal,
+				mode_lib->vba.MaxInterDCNTileRepeaters,
+				mode_lib->vba.MaxPrefetchMode,
+				mode_lib->vba.DRAMClockChangeLatency,
+				mode_lib->vba.FCLKChangeLatency,
+				mode_lib->vba.SREnterPlusExitTime,
+				mode_lib->vba.ReturnBusWidth,
+				mode_lib->vba.RoundTripPingLatencyCycles,
+				ReorderingBytes,
+				mode_lib->vba.PixelChunkSizeInKByte,
+				mode_lib->vba.MetaChunkSize,
+				mode_lib->vba.GPUVMEnable,
+				mode_lib->vba.GPUVMMaxPageTableLevels,
+				mode_lib->vba.HostVMEnable,
+				mode_lib->vba.NumberOfActiveSurfaces,
+				mode_lib->vba.HostVMMinPageSize,
+				mode_lib->vba.HostVMMaxNonCachedPageTableLevels,
+				mode_lib->vba.DynamicMetadataVMEnabled,
+				mode_lib->vba.ImmediateFlipRequiredFinal,
+				mode_lib->vba.ProgressiveToInterlaceUnitInOPP,
+				mode_lib->vba.MaxAveragePercentOfIdealSDPPortBWDisplayCanUseInNormalSystemOperation,
+				mode_lib->vba.PercentOfIdealFabricAndSDPPortBWReceivedAfterUrgLatency,
+				mode_lib->vba.VTotal,
+				mode_lib->vba.VActive,
+				mode_lib->vba.DynamicMetadataTransmittedBytes,
+				mode_lib->vba.DynamicMetadataLinesBeforeActiveRequired,
+				mode_lib->vba.Interlace,
+				mode_lib->vba.RequiredDPPCLK,
+				mode_lib->vba.RequiredDISPCLK,
+				mode_lib->vba.UrgLatency,
+				mode_lib->vba.NoOfDPP,
+				mode_lib->vba.ProjectedDCFCLKDeepSleep,
+				mode_lib->vba.MaximumVStartup,
+				mode_lib->vba.TotalNumberOfActiveDPP,
+				mode_lib->vba.TotalNumberOfDCCActiveDPP,
+				mode_lib->vba.dpte_group_bytes,
+				mode_lib->vba.PrefetchLinesY,
+				mode_lib->vba.PrefetchLinesC,
+				mode_lib->vba.swath_width_luma_ub_all_states,
+				mode_lib->vba.swath_width_chroma_ub_all_states,
+				mode_lib->vba.BytePerPixelY,
+				mode_lib->vba.BytePerPixelC,
+				mode_lib->vba.HTotal,
+				mode_lib->vba.PixelClock,
+				mode_lib->vba.PDEAndMetaPTEBytesPerFrame,
+				mode_lib->vba.DPTEBytesPerRow,
+				mode_lib->vba.MetaRowBytes,
+				mode_lib->vba.DynamicMetadataEnable,
+				mode_lib->vba.ReadBandwidthLuma,
+				mode_lib->vba.ReadBandwidthChroma,
+				mode_lib->vba.DCFCLKPerState,
+
+				/* Output */
+				mode_lib->vba.DCFCLKState);
+	} // UseMinimumRequiredDCFCLK == true
+
+	for (i = 0; i < (int) v->soc.num_states; ++i) {
+		for (j = 0; j <= 1; ++j) {
+			mode_lib->vba.ReturnBWPerState[i][j] = dml32_get_return_bw_mbps(&mode_lib->vba.soc, i,
+					mode_lib->vba.HostVMEnable, mode_lib->vba.DCFCLKState[i][j],
+					mode_lib->vba.FabricClockPerState[i], mode_lib->vba.DRAMSpeedPerState[i]);
+		}
+	}
+
+	//Re-ordering Buffer Support Check
+	for (i = 0; i < (int) v->soc.num_states; ++i) {
+		for (j = 0; j <= 1; ++j) {
+			if ((mode_lib->vba.ROBBufferSizeInKByte - mode_lib->vba.PixelChunkSizeInKByte) * 1024
+					/ mode_lib->vba.ReturnBWPerState[i][j]
+					> (mode_lib->vba.RoundTripPingLatencyCycles + 32)
+							/ mode_lib->vba.DCFCLKState[i][j]
+							+ ReorderingBytes / mode_lib->vba.ReturnBWPerState[i][j]) {
+				mode_lib->vba.ROBSupport[i][j] = true;
+			} else {
+				mode_lib->vba.ROBSupport[i][j] = false;
+			}
+		}
+	}
+
+	//Vertical Active BW support check
+	MaxTotalVActiveRDBandwidth = 0;
+
+	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+		MaxTotalVActiveRDBandwidth = MaxTotalVActiveRDBandwidth + mode_lib->vba.ReadBandwidthLuma[k]
+				+ mode_lib->vba.ReadBandwidthChroma[k];
+	}
+
+	for (i = 0; i < (int) v->soc.num_states; ++i) {
+		for (j = 0; j <= 1; ++j) {
+			mode_lib->vba.MaxTotalVerticalActiveAvailableBandwidth[i][j] =
+				dml_min3(mode_lib->vba.ReturnBusWidth * mode_lib->vba.DCFCLKState[i][j]
+					* mode_lib->vba.MaxAveragePercentOfIdealSDPPortBWDisplayCanUseInNormalSystemOperation / 100,
+					mode_lib->vba.FabricClockPerState[i]
+					* mode_lib->vba.FabricDatapathToDCNDataReturn
+					* mode_lib->vba.MaxAveragePercentOfIdealFabricBWDisplayCanUseInNormalSystemOperation / 100,
+					mode_lib->vba.DRAMSpeedPerState[i]
+					* mode_lib->vba.NumberOfChannels
+					* mode_lib->vba.DRAMChannelWidth
+					* (i < 2 ? mode_lib->vba.MaxAveragePercentOfIdealDRAMBWDisplayCanUseInNormalSystemOperationSTROBE : mode_lib->vba.MaxAveragePercentOfIdealDRAMBWDisplayCanUseInNormalSystemOperation) / 100);
+
+			if (MaxTotalVActiveRDBandwidth
+					<= mode_lib->vba.MaxTotalVerticalActiveAvailableBandwidth[i][j]) {
+				mode_lib->vba.TotalVerticalActiveBandwidthSupport[i][j] = true;
+			} else {
+				mode_lib->vba.TotalVerticalActiveBandwidthSupport[i][j] = false;
+			}
+		}
+	}
+
+	/* Prefetch Check */
+
+	for (i = 0; i < (int) v->soc.num_states; ++i) {
+		for (j = 0; j <= 1; ++j) {
+			double VMDataOnlyReturnBWPerState;
+			double HostVMInefficiencyFactor;
+			unsigned int NextPrefetchModeState;
+
+			mode_lib->vba.TimeCalc = 24 / mode_lib->vba.ProjectedDCFCLKDeepSleep[i][j];
+
+			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+				mode_lib->vba.NoOfDPPThisState[k] = mode_lib->vba.NoOfDPP[i][j][k];
+				mode_lib->vba.swath_width_luma_ub_this_state[k] =
+						mode_lib->vba.swath_width_luma_ub_all_states[i][j][k];
+				mode_lib->vba.swath_width_chroma_ub_this_state[k] =
+						mode_lib->vba.swath_width_chroma_ub_all_states[i][j][k];
+				mode_lib->vba.SwathWidthYThisState[k] = mode_lib->vba.SwathWidthYAllStates[i][j][k];
+				mode_lib->vba.SwathWidthCThisState[k] = mode_lib->vba.SwathWidthCAllStates[i][j][k];
+				mode_lib->vba.SwathHeightYThisState[k] = mode_lib->vba.SwathHeightYAllStates[i][j][k];
+				mode_lib->vba.SwathHeightCThisState[k] = mode_lib->vba.SwathHeightCAllStates[i][j][k];
+				mode_lib->vba.UnboundedRequestEnabledThisState =
+						mode_lib->vba.UnboundedRequestEnabledAllStates[i][j];
+				mode_lib->vba.CompressedBufferSizeInkByteThisState =
+						mode_lib->vba.CompressedBufferSizeInkByteAllStates[i][j];
+				mode_lib->vba.DETBufferSizeInKByteThisState[k] =
+						mode_lib->vba.DETBufferSizeInKByteAllStates[i][j][k];
+				mode_lib->vba.DETBufferSizeYThisState[k] =
+						mode_lib->vba.DETBufferSizeYAllStates[i][j][k];
+				mode_lib->vba.DETBufferSizeCThisState[k] =
+						mode_lib->vba.DETBufferSizeCAllStates[i][j][k];
+			}
+
+			mode_lib->vba.VActiveBandwithSupport[i][j] = dml32_CalculateVActiveBandwithSupport(
+					mode_lib->vba.NumberOfActiveSurfaces,
+					mode_lib->vba.ReturnBWPerState[i][j],
+					mode_lib->vba.NoUrgentLatencyHiding,
+					mode_lib->vba.ReadBandwidthLuma,
+					mode_lib->vba.ReadBandwidthChroma,
+					mode_lib->vba.cursor_bw,
+					mode_lib->vba.meta_row_bandwidth_this_state,
+					mode_lib->vba.dpte_row_bandwidth_this_state,
+					mode_lib->vba.NoOfDPPThisState,
+					mode_lib->vba.UrgentBurstFactorLuma,
+					mode_lib->vba.UrgentBurstFactorChroma,
+					mode_lib->vba.UrgentBurstFactorCursor);
+
+			VMDataOnlyReturnBWPerState = dml32_get_return_bw_mbps_vm_only(&mode_lib->vba.soc, i,
+					mode_lib->vba.DCFCLKState[i][j], mode_lib->vba.FabricClockPerState[i],
+					mode_lib->vba.DRAMSpeedPerState[i]);
+			HostVMInefficiencyFactor = 1;
+
+			if (mode_lib->vba.GPUVMEnable && mode_lib->vba.HostVMEnable)
+				HostVMInefficiencyFactor = mode_lib->vba.ReturnBWPerState[i][j]
+						/ VMDataOnlyReturnBWPerState;
+
+			mode_lib->vba.ExtraLatency = dml32_CalculateExtraLatency(
+					mode_lib->vba.RoundTripPingLatencyCycles, ReorderingBytes,
+					mode_lib->vba.DCFCLKState[i][j], mode_lib->vba.TotalNumberOfActiveDPP[i][j],
+					mode_lib->vba.PixelChunkSizeInKByte,
+					mode_lib->vba.TotalNumberOfDCCActiveDPP[i][j], mode_lib->vba.MetaChunkSize,
+					mode_lib->vba.ReturnBWPerState[i][j], mode_lib->vba.GPUVMEnable,
+					mode_lib->vba.HostVMEnable, mode_lib->vba.NumberOfActiveSurfaces,
+					mode_lib->vba.NoOfDPPThisState, mode_lib->vba.dpte_group_bytes,
+					HostVMInefficiencyFactor, mode_lib->vba.HostVMMinPageSize,
+					mode_lib->vba.HostVMMaxNonCachedPageTableLevels);
+
+			NextPrefetchModeState = mode_lib->vba.MinPrefetchMode;
+
+			mode_lib->vba.NextMaxVStartup = mode_lib->vba.MaxMaxVStartup[i][j];
+
+			do {
+				mode_lib->vba.PrefetchModePerState[i][j] = NextPrefetchModeState;
+				mode_lib->vba.MaxVStartup = mode_lib->vba.NextMaxVStartup;
+
+				for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
+					DmlPipe myPipe;
+					unsigned int dummy_integer;
+
+					mode_lib->vba.TWait = dml32_CalculateTWait(
+							mode_lib->vba.PrefetchModePerState[i][j],
+							mode_lib->vba.UsesMALLForPStateChange[k],
+							mode_lib->vba.SynchronizeDRRDisplaysForUCLKPStateChangeFinal,
+							mode_lib->vba.DRRDisplay[k],
+							mode_lib->vba.DRAMClockChangeLatency,
+							mode_lib->vba.FCLKChangeLatency, mode_lib->vba.UrgLatency[i],
+							mode_lib->vba.SREnterPlusExitTime);
+
+					myPipe.Dppclk = mode_lib->vba.RequiredDPPCLK[i][j][k];
+					myPipe.Dispclk = mode_lib->vba.RequiredDISPCLK[i][j];
+					myPipe.PixelClock = mode_lib->vba.PixelClock[k];
+					myPipe.DCFClkDeepSleep = mode_lib->vba.ProjectedDCFCLKDeepSleep[i][j];
+					myPipe.DPPPerSurface = mode_lib->vba.NoOfDPP[i][j][k];
+					myPipe.ScalerEnabled = mode_lib->vba.ScalerEnabled[k];
+					myPipe.SourceRotation = mode_lib->vba.SourceRotation[k];
+					myPipe.BlockWidth256BytesY = mode_lib->vba.Read256BlockWidthY[k];
+					myPipe.BlockHeight256BytesY = mode_lib->vba.Read256BlockHeightY[k];
+					myPipe.BlockWidth256BytesC = mode_lib->vba.Read256BlockWidthC[k];
+					myPipe.BlockHeight256BytesC = mode_lib->vba.Read256BlockHeightC[k];
+					myPipe.InterlaceEnable = mode_lib->vba.Interlace[k];
+					myPipe.NumberOfCursors = mode_lib->vba.NumberOfCursors[k];
+					myPipe.VBlank = mode_lib->vba.VTotal[k] - mode_lib->vba.VActive[k];
+					myPipe.HTotal = mode_lib->vba.HTotal[k];
+					myPipe.HActive = mode_lib->vba.HActive[k];
+					myPipe.DCCEnable = mode_lib->vba.DCCEnable[k];
+					myPipe.ODMMode = mode_lib->vba.ODMCombineEnablePerState[i][k];
+					myPipe.SourcePixelFormat = mode_lib->vba.SourcePixelFormat[k];
+					myPipe.BytePerPixelY = mode_lib->vba.BytePerPixelY[k];
+					myPipe.BytePerPixelC = mode_lib->vba.BytePerPixelC[k];
+					myPipe.ProgressiveToInterlaceUnitInOPP =
+							mode_lib->vba.ProgressiveToInterlaceUnitInOPP;
+
+					mode_lib->vba.NoTimeForPrefetch[i][j][k] =
+						dml32_CalculatePrefetchSchedule(
+							HostVMInefficiencyFactor,
+							&myPipe,
+							mode_lib->vba.DSCDelayPerState[i][k],
+							mode_lib->vba.DPPCLKDelaySubtotal +
+								mode_lib->vba.DPPCLKDelayCNVCFormater,
+							mode_lib->vba.DPPCLKDelaySCL,
+							mode_lib->vba.DPPCLKDelaySCLLBOnly,
+							mode_lib->vba.DPPCLKDelayCNVCCursor,
+							mode_lib->vba.DISPCLKDelaySubtotal,
+							mode_lib->vba.SwathWidthYThisState[k] /
+								mode_lib->vba.HRatio[k],
+							mode_lib->vba.OutputFormat[k],
+							mode_lib->vba.MaxInterDCNTileRepeaters,
+							dml_min(mode_lib->vba.MaxVStartup,
+									mode_lib->vba.MaximumVStartup[i][j][k]),
+							mode_lib->vba.MaximumVStartup[i][j][k],
+							mode_lib->vba.GPUVMMaxPageTableLevels,
+							mode_lib->vba.GPUVMEnable, mode_lib->vba.HostVMEnable,
+							mode_lib->vba.HostVMMaxNonCachedPageTableLevels,
+							mode_lib->vba.HostVMMinPageSize,
+							mode_lib->vba.DynamicMetadataEnable[k],
+							mode_lib->vba.DynamicMetadataVMEnabled,
+							mode_lib->vba.DynamicMetadataLinesBeforeActiveRequired[k],
+							mode_lib->vba.DynamicMetadataTransmittedBytes[k],
+							mode_lib->vba.UrgLatency[i],
+							mode_lib->vba.ExtraLatency,
+							mode_lib->vba.TimeCalc,
+							mode_lib->vba.PDEAndMetaPTEBytesPerFrame[i][j][k],
+							mode_lib->vba.MetaRowBytes[i][j][k],
+							mode_lib->vba.DPTEBytesPerRow[i][j][k],
+							mode_lib->vba.PrefetchLinesY[i][j][k],
+							mode_lib->vba.SwathWidthYThisState[k],
+							mode_lib->vba.PrefillY[k],
+							mode_lib->vba.MaxNumSwY[k],
+							mode_lib->vba.PrefetchLinesC[i][j][k],
+							mode_lib->vba.SwathWidthCThisState[k],
+							mode_lib->vba.PrefillC[k],
+							mode_lib->vba.MaxNumSwC[k],
+							mode_lib->vba.swath_width_luma_ub_this_state[k],
+							mode_lib->vba.swath_width_chroma_ub_this_state[k],
+							mode_lib->vba.SwathHeightYThisState[k],
+							mode_lib->vba.SwathHeightCThisState[k], mode_lib->vba.TWait,
+
+							/* Output */
+							&DSTXAfterScaler[k],
+							&DSTYAfterScaler[k],
+							&mode_lib->vba.LineTimesForPrefetch[k],
+							&mode_lib->vba.PrefetchBW[k],
+							&mode_lib->vba.LinesForMetaPTE[k],
+							&mode_lib->vba.LinesForMetaAndDPTERow[k],
+							&mode_lib->vba.VRatioPreY[i][j][k],
+							&mode_lib->vba.VRatioPreC[i][j][k],
+							&mode_lib->vba.RequiredPrefetchPixelDataBWLuma[0][0][k],
+							&mode_lib->vba.RequiredPrefetchPixelDataBWChroma[0][0][k],
+							&mode_lib->vba.NoTimeForDynamicMetadata[i][j][k],
+							&mode_lib->vba.Tno_bw[k],
+							&mode_lib->vba.prefetch_vmrow_bw[k],
+							&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_single[0],         // double *Tdmdl_vm
+							&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_single[1],         // double *Tdmdl
+							&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_single[2],         // double *TSetup
+							&dummy_integer,         							    // unsigned int   *VUpdateOffsetPix
+							&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_single[3],         // unsigned int   *VUpdateWidthPix
+							&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_single[4]);        // unsigned int   *VReadyOffsetPix
+				}
+
+				for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
+					dml32_CalculateUrgentBurstFactor(
+							mode_lib->vba.UsesMALLForPStateChange[k],
+							mode_lib->vba.swath_width_luma_ub_this_state[k],
+							mode_lib->vba.swath_width_chroma_ub_this_state[k],
+							mode_lib->vba.SwathHeightYThisState[k],
+							mode_lib->vba.SwathHeightCThisState[k],
+							mode_lib->vba.HTotal[k] / mode_lib->vba.PixelClock[k],
+							mode_lib->vba.UrgLatency[i], mode_lib->vba.CursorBufferSize,
+							mode_lib->vba.CursorWidth[k][0], mode_lib->vba.CursorBPP[k][0],
+							mode_lib->vba.VRatioPreY[i][j][k],
+							mode_lib->vba.VRatioPreC[i][j][k],
+							mode_lib->vba.BytePerPixelInDETY[k],
+							mode_lib->vba.BytePerPixelInDETC[k],
+							mode_lib->vba.DETBufferSizeYThisState[k],
+							mode_lib->vba.DETBufferSizeCThisState[k],
+							/* Output */
+							&mode_lib->vba.UrgentBurstFactorCursorPre[k],
+							&mode_lib->vba.UrgentBurstFactorLumaPre[k],
+							&mode_lib->vba.UrgentBurstFactorChroma[k],
+							&mode_lib->vba.NotUrgentLatencyHidingPre[k]);
+				}
+
+				{
+					double dummy_single[2];
+					dml32_CalculatePrefetchBandwithSupport(
+							mode_lib->vba.NumberOfActiveSurfaces,
+							mode_lib->vba.ReturnBWPerState[i][j],
+							mode_lib->vba.NotUrgentLatencyHidingPre,
+							mode_lib->vba.ReadBandwidthLuma,
+							mode_lib->vba.ReadBandwidthChroma,
+							mode_lib->vba.RequiredPrefetchPixelDataBWLuma[0][0],
+							mode_lib->vba.RequiredPrefetchPixelDataBWChroma[0][0],
+							mode_lib->vba.cursor_bw,
+							mode_lib->vba.meta_row_bandwidth_this_state,
+							mode_lib->vba.dpte_row_bandwidth_this_state,
+							mode_lib->vba.cursor_bw_pre,
+							mode_lib->vba.prefetch_vmrow_bw,
+							mode_lib->vba.NoOfDPPThisState,
+							mode_lib->vba.UrgentBurstFactorLuma,
+							mode_lib->vba.UrgentBurstFactorChroma,
+							mode_lib->vba.UrgentBurstFactorCursor,
+							mode_lib->vba.UrgentBurstFactorLumaPre,
+							mode_lib->vba.UrgentBurstFactorChromaPre,
+							mode_lib->vba.UrgentBurstFactorCursorPre,
+
+							/* output */
+							&dummy_single[0],   // Single  *PrefetchBandwidth
+							&dummy_single[1],   // Single  *FractionOfUrgentBandwidth
+							&mode_lib->vba.PrefetchSupported[i][j]);
+				}
+
+				for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
+					if (mode_lib->vba.LineTimesForPrefetch[k]
+							< 2.0 || mode_lib->vba.LinesForMetaPTE[k] >= 32.0
+							|| mode_lib->vba.LinesForMetaAndDPTERow[k] >= 16.0
+							|| mode_lib->vba.NoTimeForPrefetch[i][j][k] == true) {
+						mode_lib->vba.PrefetchSupported[i][j] = false;
+					}
+				}
+
+				mode_lib->vba.DynamicMetadataSupported[i][j] = true;
+				for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+					if (mode_lib->vba.NoTimeForDynamicMetadata[i][j][k] == true)
+						mode_lib->vba.DynamicMetadataSupported[i][j] = false;
+				}
+
+				mode_lib->vba.VRatioInPrefetchSupported[i][j] = true;
+				for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
+					if (mode_lib->vba.VRatioPreY[i][j][k] > __DML_MAX_VRATIO_PRE__
+							|| mode_lib->vba.VRatioPreC[i][j][k] > __DML_MAX_VRATIO_PRE__
+							|| mode_lib->vba.NoTimeForPrefetch[i][j][k] == true) {
+						mode_lib->vba.VRatioInPrefetchSupported[i][j] = false;
+					}
+				}
+				mode_lib->vba.AnyLinesForVMOrRowTooLarge = false;
+				for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+					if (mode_lib->vba.LinesForMetaAndDPTERow[k] >= 16
+							|| mode_lib->vba.LinesForMetaPTE[k] >= 32) {
+						mode_lib->vba.AnyLinesForVMOrRowTooLarge = true;
+					}
+				}
+
+				if (mode_lib->vba.PrefetchSupported[i][j] == true
+						&& mode_lib->vba.VRatioInPrefetchSupported[i][j] == true) {
+					mode_lib->vba.BandwidthAvailableForImmediateFlip =
+							dml32_CalculateBandwidthAvailableForImmediateFlip(
+							mode_lib->vba.NumberOfActiveSurfaces,
+							mode_lib->vba.ReturnBWPerState[i][j],
+							mode_lib->vba.ReadBandwidthLuma,
+							mode_lib->vba.ReadBandwidthChroma,
+							mode_lib->vba.RequiredPrefetchPixelDataBWLuma[0][0],
+							mode_lib->vba.RequiredPrefetchPixelDataBWChroma[0][0],
+							mode_lib->vba.cursor_bw,
+							mode_lib->vba.cursor_bw_pre,
+							mode_lib->vba.NoOfDPPThisState,
+							mode_lib->vba.UrgentBurstFactorLuma,
+							mode_lib->vba.UrgentBurstFactorChroma,
+							mode_lib->vba.UrgentBurstFactorCursor,
+							mode_lib->vba.UrgentBurstFactorLumaPre,
+							mode_lib->vba.UrgentBurstFactorChromaPre,
+							mode_lib->vba.UrgentBurstFactorCursorPre);
+
+					mode_lib->vba.TotImmediateFlipBytes = 0.0;
+					for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
+						if (!(mode_lib->vba.ImmediateFlipRequirement[k] ==
+								dm_immediate_flip_not_required)) {
+							mode_lib->vba.TotImmediateFlipBytes =
+									mode_lib->vba.TotImmediateFlipBytes
+								+ mode_lib->vba.NoOfDPP[i][j][k]
+								* mode_lib->vba.PDEAndMetaPTEBytesPerFrame[i][j][k]
+								+ mode_lib->vba.MetaRowBytes[i][j][k];
+							if (mode_lib->vba.use_one_row_for_frame_flip[i][j][k]) {
+								mode_lib->vba.TotImmediateFlipBytes =
+									mode_lib->vba.TotImmediateFlipBytes + 2
+								* mode_lib->vba.DPTEBytesPerRow[i][j][k];
+							} else {
+								mode_lib->vba.TotImmediateFlipBytes =
+									mode_lib->vba.TotImmediateFlipBytes
+								+ mode_lib->vba.DPTEBytesPerRow[i][j][k];
+							}
+						}
+					}
+
+					for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
+						dml32_CalculateFlipSchedule(HostVMInefficiencyFactor,
+							mode_lib->vba.ExtraLatency,
+							mode_lib->vba.UrgLatency[i],
+							mode_lib->vba.GPUVMMaxPageTableLevels,
+							mode_lib->vba.HostVMEnable,
+							mode_lib->vba.HostVMMaxNonCachedPageTableLevels,
+							mode_lib->vba.GPUVMEnable,
+							mode_lib->vba.HostVMMinPageSize,
+							mode_lib->vba.PDEAndMetaPTEBytesPerFrame[i][j][k],
+							mode_lib->vba.MetaRowBytes[i][j][k],
+							mode_lib->vba.DPTEBytesPerRow[i][j][k],
+							mode_lib->vba.BandwidthAvailableForImmediateFlip,
+							mode_lib->vba.TotImmediateFlipBytes,
+							mode_lib->vba.SourcePixelFormat[k],
+							(mode_lib->vba.HTotal[k] / mode_lib->vba.PixelClock[k]),
+							mode_lib->vba.VRatio[k],
+							mode_lib->vba.VRatioChroma[k],
+							mode_lib->vba.Tno_bw[k],
+								mode_lib->vba.DCCEnable[k],
+							mode_lib->vba.dpte_row_height[k],
+							mode_lib->vba.meta_row_height[k],
+							mode_lib->vba.dpte_row_height_chroma[k],
+							mode_lib->vba.meta_row_height_chroma[k],
+							mode_lib->vba.use_one_row_for_frame_flip[i][j][k], // 24
+
+							/* Output */
+							&mode_lib->vba.DestinationLinesToRequestVMInImmediateFlip[k],
+							&mode_lib->vba.DestinationLinesToRequestRowInImmediateFlip[k],
+							&mode_lib->vba.final_flip_bw[k],
+							&mode_lib->vba.ImmediateFlipSupportedForPipe[k]);
+					}
+
+					{
+						double dummy_single[2];
+						dml32_CalculateImmediateFlipBandwithSupport(mode_lib->vba.NumberOfActiveSurfaces,
+								mode_lib->vba.ReturnBWPerState[i][j],
+								mode_lib->vba.ImmediateFlipRequirement,
+								mode_lib->vba.final_flip_bw,
+								mode_lib->vba.ReadBandwidthLuma,
+								mode_lib->vba.ReadBandwidthChroma,
+								mode_lib->vba.RequiredPrefetchPixelDataBWLuma[0][0],
+								mode_lib->vba.RequiredPrefetchPixelDataBWChroma[0][0],
+								mode_lib->vba.cursor_bw,
+								mode_lib->vba.meta_row_bandwidth_this_state,
+								mode_lib->vba.dpte_row_bandwidth_this_state,
+								mode_lib->vba.cursor_bw_pre,
+								mode_lib->vba.prefetch_vmrow_bw,
+								mode_lib->vba.DPPPerPlane,
+								mode_lib->vba.UrgentBurstFactorLuma,
+								mode_lib->vba.UrgentBurstFactorChroma,
+								mode_lib->vba.UrgentBurstFactorCursor,
+								mode_lib->vba.UrgentBurstFactorLumaPre,
+								mode_lib->vba.UrgentBurstFactorChromaPre,
+								mode_lib->vba.UrgentBurstFactorCursorPre,
+
+								/* output */
+								&dummy_single[0], //  Single  *TotalBandwidth
+								&dummy_single[1], //  Single  *FractionOfUrgentBandwidth
+								&mode_lib->vba.ImmediateFlipSupportedForState[i][j]); // Boolean *ImmediateFlipBandwidthSupport
+					}
+
+					for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
+						if (!(mode_lib->vba.ImmediateFlipRequirement[k]
+								== dm_immediate_flip_not_required)
+								&& (mode_lib->vba.ImmediateFlipSupportedForPipe[k]
+										== false))
+							mode_lib->vba.ImmediateFlipSupportedForState[i][j] = false;
+					}
+				} else { // if prefetch not support, assume iflip not supported
+					mode_lib->vba.ImmediateFlipSupportedForState[i][j] = false;
+				}
+
+				if (mode_lib->vba.MaxVStartup <= __DML_VBA_MIN_VSTARTUP__
+						|| mode_lib->vba.AnyLinesForVMOrRowTooLarge == false) {
+					mode_lib->vba.NextMaxVStartup = mode_lib->vba.MaxMaxVStartup[i][j];
+					NextPrefetchModeState = NextPrefetchModeState + 1;
+				} else {
+					mode_lib->vba.NextMaxVStartup = mode_lib->vba.NextMaxVStartup - 1;
+				}
+			} while (!((mode_lib->vba.PrefetchSupported[i][j] == true
+					&& mode_lib->vba.DynamicMetadataSupported[i][j] == true
+					&& mode_lib->vba.VRatioInPrefetchSupported[i][j] == true &&
+					// consider flip support is okay if when there is no hostvm and the
+					// user does't require a iflip OR the flip bw is ok
+					// If there is hostvm, DCN needs to support iflip for invalidation
+					((mode_lib->vba.HostVMEnable == false
+							&& !mode_lib->vba.ImmediateFlipRequiredFinal)
+							|| mode_lib->vba.ImmediateFlipSupportedForState[i][j] == true))
+					|| (mode_lib->vba.NextMaxVStartup == mode_lib->vba.MaxMaxVStartup[i][j]
+							&& NextPrefetchModeState > mode_lib->vba.MaxPrefetchMode)));
+
+			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
+				mode_lib->vba.use_one_row_for_frame_this_state[k] =
+						mode_lib->vba.use_one_row_for_frame[i][j][k];
+			}
+
+
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.mSOCParameters.UrgentLatency = mode_lib->vba.UrgLatency[i];
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.mSOCParameters.ExtraLatency = mode_lib->vba.ExtraLatency;
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.mSOCParameters.WritebackLatency = mode_lib->vba.WritebackLatency;
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.mSOCParameters.DRAMClockChangeLatency = mode_lib->vba.DRAMClockChangeLatency;
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.mSOCParameters.FCLKChangeLatency = mode_lib->vba.FCLKChangeLatency;
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.mSOCParameters.SRExitTime = mode_lib->vba.SRExitTime;
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.mSOCParameters.SREnterPlusExitTime = mode_lib->vba.SREnterPlusExitTime;
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.mSOCParameters.SRExitZ8Time = mode_lib->vba.SRExitZ8Time;
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.mSOCParameters.SREnterPlusExitZ8Time = mode_lib->vba.SREnterPlusExitZ8Time;
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.mSOCParameters.USRRetrainingLatency = mode_lib->vba.USRRetrainingLatency;
+			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.mSOCParameters.SMNLatency = mode_lib->vba.SMNLatency;
+
+			{
+				unsigned int dummy_integer[4];
+				dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
+						mode_lib->vba.USRRetrainingRequiredFinal,
+						mode_lib->vba.UsesMALLForPStateChange,
+						mode_lib->vba.PrefetchModePerState[i][j],
+						mode_lib->vba.NumberOfActiveSurfaces,
+						mode_lib->vba.MaxLineBufferLines,
+						mode_lib->vba.LineBufferSizeFinal,
+						mode_lib->vba.WritebackInterfaceBufferSize,
+						mode_lib->vba.DCFCLKState[i][j],
+						mode_lib->vba.ReturnBWPerState[i][j],
+						mode_lib->vba.SynchronizeTimingsFinal,
+						mode_lib->vba.SynchronizeDRRDisplaysForUCLKPStateChangeFinal,
+						mode_lib->vba.DRRDisplay,
+						mode_lib->vba.dpte_group_bytes,
+						mode_lib->vba.meta_row_height,
+						mode_lib->vba.meta_row_height_chroma,
+						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.mSOCParameters,
+						mode_lib->vba.WritebackChunkSize,
+						mode_lib->vba.SOCCLKPerState[i],
+						mode_lib->vba.ProjectedDCFCLKDeepSleep[i][j],
+						mode_lib->vba.DETBufferSizeYThisState,
+						mode_lib->vba.DETBufferSizeCThisState,
+						mode_lib->vba.SwathHeightYThisState,
+						mode_lib->vba.SwathHeightCThisState,
+						mode_lib->vba.LBBitPerPixel,
+						mode_lib->vba.SwathWidthYThisState, // 24
+						mode_lib->vba.SwathWidthCThisState,
+						mode_lib->vba.HRatio,
+						mode_lib->vba.HRatioChroma,
+						mode_lib->vba.vtaps,
+						mode_lib->vba.VTAPsChroma,
+						mode_lib->vba.VRatio,
+						mode_lib->vba.VRatioChroma,
+						mode_lib->vba.HTotal,
+						mode_lib->vba.VTotal,
+						mode_lib->vba.VActive,
+						mode_lib->vba.PixelClock,
+						mode_lib->vba.BlendingAndTiming,
+						mode_lib->vba.NoOfDPPThisState,
+						mode_lib->vba.BytePerPixelInDETY,
+						mode_lib->vba.BytePerPixelInDETC,
+						DSTXAfterScaler,
+						DSTYAfterScaler,
+						mode_lib->vba.WritebackEnable,
+						mode_lib->vba.WritebackPixelFormat,
+						mode_lib->vba.WritebackDestinationWidth,
+						mode_lib->vba.WritebackDestinationHeight,
+						mode_lib->vba.WritebackSourceHeight,
+						mode_lib->vba.UnboundedRequestEnabledThisState,
+						mode_lib->vba.CompressedBufferSizeInkByteThisState,
+
+						/* Output */
+						&mode_lib->vba.Watermark, // Store the values in vba
+						&mode_lib->vba.DRAMClockChangeSupport[i][j],
+						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_single2[0], // double *MaxActiveDRAMClockChangeLatencySupported
+						&dummy_integer[0], // Long SubViewportLinesNeededInMALL[]
+						&mode_lib->vba.FCLKChangeSupport[i][j],
+						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_single2[1], // double *MinActiveFCLKChangeLatencySupported
+						&mode_lib->vba.USRRetrainingSupport[i][j],
+						mode_lib->vba.ActiveDRAMClockChangeLatencyMargin);
+			}
+		}
+	} // End of Prefetch Check
+
+	/*Cursor Support Check*/
+	mode_lib->vba.CursorSupport = true;
+	for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
+		if (mode_lib->vba.CursorWidth[k][0] > 0.0) {
+			if (mode_lib->vba.CursorBPP[k][0] == 64 && mode_lib->vba.Cursor64BppSupport == false)
+				mode_lib->vba.CursorSupport = false;
+		}
+	}
+
+	/*Valid Pitch Check*/
+	mode_lib->vba.PitchSupport = true;
+	for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
+		mode_lib->vba.AlignedYPitch[k] = dml_ceil(
+				dml_max(mode_lib->vba.PitchY[k], mode_lib->vba.SurfaceWidthY[k]),
+				mode_lib->vba.MacroTileWidthY[k]);
+		if (mode_lib->vba.DCCEnable[k] == true) {
+			mode_lib->vba.AlignedDCCMetaPitchY[k] = dml_ceil(
+					dml_max(mode_lib->vba.DCCMetaPitchY[k], mode_lib->vba.SurfaceWidthY[k]),
+					64.0 * mode_lib->vba.Read256BlockWidthY[k]);
+		} else {
+			mode_lib->vba.AlignedDCCMetaPitchY[k] = mode_lib->vba.DCCMetaPitchY[k];
+		}
+		if (mode_lib->vba.SourcePixelFormat[k] != dm_444_64 && mode_lib->vba.SourcePixelFormat[k] != dm_444_32
+				&& mode_lib->vba.SourcePixelFormat[k] != dm_444_16
+				&& mode_lib->vba.SourcePixelFormat[k] != dm_mono_16
+				&& mode_lib->vba.SourcePixelFormat[k] != dm_rgbe
+				&& mode_lib->vba.SourcePixelFormat[k] != dm_mono_8) {
+			mode_lib->vba.AlignedCPitch[k] = dml_ceil(
+					dml_max(mode_lib->vba.PitchC[k], mode_lib->vba.SurfaceWidthC[k]),
+					mode_lib->vba.MacroTileWidthC[k]);
+			if (mode_lib->vba.DCCEnable[k] == true) {
+				mode_lib->vba.AlignedDCCMetaPitchC[k] = dml_ceil(
+						dml_max(mode_lib->vba.DCCMetaPitchC[k],
+								mode_lib->vba.SurfaceWidthC[k]),
+						64.0 * mode_lib->vba.Read256BlockWidthC[k]);
+			} else {
+				mode_lib->vba.AlignedDCCMetaPitchC[k] = mode_lib->vba.DCCMetaPitchC[k];
+			}
+		} else {
+			mode_lib->vba.AlignedCPitch[k] = mode_lib->vba.PitchC[k];
+			mode_lib->vba.AlignedDCCMetaPitchC[k] = mode_lib->vba.DCCMetaPitchC[k];
+		}
+		if (mode_lib->vba.AlignedYPitch[k] > mode_lib->vba.PitchY[k]
+				|| mode_lib->vba.AlignedCPitch[k] > mode_lib->vba.PitchC[k]
+				|| mode_lib->vba.AlignedDCCMetaPitchY[k] > mode_lib->vba.DCCMetaPitchY[k]
+				|| mode_lib->vba.AlignedDCCMetaPitchC[k] > mode_lib->vba.DCCMetaPitchC[k]) {
+			mode_lib->vba.PitchSupport = false;
+		}
+	}
+
+	mode_lib->vba.ViewportExceedsSurface = false;
+	for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
+		if (mode_lib->vba.ViewportWidth[k] > mode_lib->vba.SurfaceWidthY[k]
+				|| mode_lib->vba.ViewportHeight[k] > mode_lib->vba.SurfaceHeightY[k]) {
+			mode_lib->vba.ViewportExceedsSurface = true;
+			if (mode_lib->vba.SourcePixelFormat[k] != dm_444_64
+					&& mode_lib->vba.SourcePixelFormat[k] != dm_444_32
+					&& mode_lib->vba.SourcePixelFormat[k] != dm_444_16
+					&& mode_lib->vba.SourcePixelFormat[k] != dm_444_16
+					&& mode_lib->vba.SourcePixelFormat[k] != dm_444_8
+					&& mode_lib->vba.SourcePixelFormat[k] != dm_rgbe) {
+				if (mode_lib->vba.ViewportWidthChroma[k] > mode_lib->vba.SurfaceWidthC[k]
+						|| mode_lib->vba.ViewportHeightChroma[k]
+								> mode_lib->vba.SurfaceHeightC[k]) {
+					mode_lib->vba.ViewportExceedsSurface = true;
+				}
+			}
+		}
+	}
+
+	/*Mode Support, Voltage State and SOC Configuration*/
+	for (i = v->soc.num_states - 1; i >= 0; i--) {
+		for (j = 0; j < 2; j++) {
+			if (mode_lib->vba.ScaleRatioAndTapsSupport == true
+				&& mode_lib->vba.SourceFormatPixelAndScanSupport == true
+				&& mode_lib->vba.ViewportSizeSupport[i][j] == true
+				&& !mode_lib->vba.LinkRateDoesNotMatchDPVersion
+				&& !mode_lib->vba.LinkRateForMultistreamNotIndicated
+				&& !mode_lib->vba.BPPForMultistreamNotIndicated
+				&& !mode_lib->vba.MultistreamWithHDMIOreDP
+				&& !mode_lib->vba.ExceededMultistreamSlots[i]
+				&& !mode_lib->vba.MSOOrODMSplitWithNonDPLink
+				&& !mode_lib->vba.NotEnoughLanesForMSO
+				&& mode_lib->vba.LinkCapacitySupport[i] == true && !mode_lib->vba.P2IWith420
+				&& !mode_lib->vba.DSCOnlyIfNecessaryWithBPP
+				&& !mode_lib->vba.DSC422NativeNotSupported
+				&& !mode_lib->vba.MPCCombineMethodIncompatible
+				&& mode_lib->vba.ODMCombine2To1SupportCheckOK[i] == true
+				&& mode_lib->vba.ODMCombine4To1SupportCheckOK[i] == true
+				&& mode_lib->vba.NotEnoughDSCUnits[i] == false
+				&& !mode_lib->vba.NotEnoughDSCSlices[i]
+				&& !mode_lib->vba.ImmediateFlipOrHostVMAndPStateWithMALLFullFrameOrPhantomPipe
+				&& !mode_lib->vba.InvalidCombinationOfMALLUseForPStateAndStaticScreen
+				&& mode_lib->vba.DSCCLKRequiredMoreThanSupported[i] == false
+				&& mode_lib->vba.PixelsPerLinePerDSCUnitSupport[i]
+				&& mode_lib->vba.DTBCLKRequiredMoreThanSupported[i] == false
+				&& !mode_lib->vba.InvalidCombinationOfMALLUseForPState
+				&& !mode_lib->vba.ImmediateFlipRequiredButTheRequirementForEachSurfaceIsNotSpecified
+				&& mode_lib->vba.ROBSupport[i][j] == true
+				&& mode_lib->vba.DISPCLK_DPPCLK_Support[i][j] == true
+				&& mode_lib->vba.TotalAvailablePipesSupport[i][j] == true
+				&& mode_lib->vba.NumberOfOTGSupport == true
+				&& mode_lib->vba.NumberOfHDMIFRLSupport == true
+				&& mode_lib->vba.EnoughWritebackUnits == true
+				&& mode_lib->vba.WritebackLatencySupport == true
+				&& mode_lib->vba.WritebackScaleRatioAndTapsSupport == true
+				&& mode_lib->vba.CursorSupport == true && mode_lib->vba.PitchSupport == true
+				&& mode_lib->vba.ViewportExceedsSurface == false
+				&& mode_lib->vba.PrefetchSupported[i][j] == true
+				&& mode_lib->vba.VActiveBandwithSupport[i][j] == true
+				&& mode_lib->vba.DynamicMetadataSupported[i][j] == true
+				&& mode_lib->vba.TotalVerticalActiveBandwidthSupport[i][j] == true
+				&& mode_lib->vba.VRatioInPrefetchSupported[i][j] == true
+				&& mode_lib->vba.PTEBufferSizeNotExceeded[i][j] == true
+				&& mode_lib->vba.DCCMetaBufferSizeNotExceeded[i][j] == true
+				&& mode_lib->vba.NonsupportedDSCInputBPC == false
+				&& !mode_lib->vba.ExceededMALLSize
+				&& ((mode_lib->vba.HostVMEnable == false
+				&& !mode_lib->vba.ImmediateFlipRequiredFinal)
+				|| mode_lib->vba.ImmediateFlipSupportedForState[i][j])
+				&& (!mode_lib->vba.DRAMClockChangeRequirementFinal
+				|| i == v->soc.num_states - 1
+				|| mode_lib->vba.DRAMClockChangeSupport[i][j] != dm_dram_clock_change_unsupported)
+				&& (!mode_lib->vba.FCLKChangeRequirementFinal || i == v->soc.num_states - 1
+				|| mode_lib->vba.FCLKChangeSupport[i][j] != dm_fclock_change_unsupported)
+				&& (!mode_lib->vba.USRRetrainingRequiredFinal
+				|| &mode_lib->vba.USRRetrainingSupport[i][j])) {
+				mode_lib->vba.ModeSupport[i][j] = true;
+			} else {
+				mode_lib->vba.ModeSupport[i][j] = false;
+			}
+		}
+	}
+
+	MaximumMPCCombine = 0;
+
+	for (i = v->soc.num_states; i >= 0; i--) {
+		if (i == v->soc.num_states || mode_lib->vba.ModeSupport[i][0] == true ||
+				mode_lib->vba.ModeSupport[i][1] == true) {
+			mode_lib->vba.VoltageLevel = i;
+			mode_lib->vba.ModeIsSupported = mode_lib->vba.ModeSupport[i][0] == true
+					|| mode_lib->vba.ModeSupport[i][1] == true;
+
+			if ((mode_lib->vba.ModeSupport[i][0] == false && mode_lib->vba.ModeSupport[i][1] == true)
+				|| MPCCombineMethodAsPossible
+				|| (MPCCombineMethodAsNeededForPStateChangeAndVoltage
+				&& mode_lib->vba.DRAMClockChangeRequirementFinal
+				&& (((mode_lib->vba.DRAMClockChangeSupport[i][1] == dm_dram_clock_change_vactive
+				|| mode_lib->vba.DRAMClockChangeSupport[i][1] ==
+						dm_dram_clock_change_vactive_w_mall_full_frame
+				|| mode_lib->vba.DRAMClockChangeSupport[i][1] ==
+						dm_dram_clock_change_vactive_w_mall_sub_vp)
+				&& !(mode_lib->vba.DRAMClockChangeSupport[i][0] == dm_dram_clock_change_vactive
+				|| mode_lib->vba.DRAMClockChangeSupport[i][0] ==
+						dm_dram_clock_change_vactive_w_mall_full_frame
+				|| mode_lib->vba.DRAMClockChangeSupport[i][0] ==
+						dm_dram_clock_change_vactive_w_mall_sub_vp))
+				|| ((mode_lib->vba.DRAMClockChangeSupport[i][1] == dm_dram_clock_change_vblank
+				|| mode_lib->vba.DRAMClockChangeSupport[i][1] ==
+						dm_dram_clock_change_vblank_w_mall_full_frame
+				|| mode_lib->vba.DRAMClockChangeSupport[i][1] ==
+						dm_dram_clock_change_vblank_w_mall_sub_vp)
+				&& mode_lib->vba.DRAMClockChangeSupport[i][0] == dm_dram_clock_change_unsupported)))
+				|| (MPCCombineMethodAsNeededForPStateChangeAndVoltage &&
+				mode_lib->vba.FCLKChangeRequirementFinal
+				&& ((mode_lib->vba.FCLKChangeSupport[i][1] == dm_fclock_change_vactive
+				&& mode_lib->vba.FCLKChangeSupport[i][0] != dm_fclock_change_vactive)
+				|| (mode_lib->vba.FCLKChangeSupport[i][1] == dm_fclock_change_vblank
+				&& mode_lib->vba.FCLKChangeSupport[i][0] == dm_fclock_change_unsupported)))) {
+				MaximumMPCCombine = 1;
+			} else {
+				MaximumMPCCombine = 0;
+			}
+		}
+	}
+
+	mode_lib->vba.ImmediateFlipSupport =
+			mode_lib->vba.ImmediateFlipSupportedForState[mode_lib->vba.VoltageLevel][MaximumMPCCombine];
+	mode_lib->vba.UnboundedRequestEnabled =
+			mode_lib->vba.UnboundedRequestEnabledAllStates[mode_lib->vba.VoltageLevel][MaximumMPCCombine];
+	mode_lib->vba.CompressedBufferSizeInkByte =
+			mode_lib->vba.CompressedBufferSizeInkByteAllStates[mode_lib->vba.VoltageLevel][MaximumMPCCombine]; // Not used, informational
+
+	for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
+		mode_lib->vba.MPCCombineEnable[k] =
+				mode_lib->vba.MPCCombine[mode_lib->vba.VoltageLevel][MaximumMPCCombine][k];
+		mode_lib->vba.DPPPerPlane[k] = mode_lib->vba.NoOfDPP[mode_lib->vba.VoltageLevel][MaximumMPCCombine][k];
+		mode_lib->vba.SwathHeightY[k] =
+				mode_lib->vba.SwathHeightYAllStates[mode_lib->vba.VoltageLevel][MaximumMPCCombine][k];
+		mode_lib->vba.SwathHeightC[k] =
+				mode_lib->vba.SwathHeightCAllStates[mode_lib->vba.VoltageLevel][MaximumMPCCombine][k];
+		mode_lib->vba.DETBufferSizeInKByte[k] =
+			mode_lib->vba.DETBufferSizeInKByteAllStates[mode_lib->vba.VoltageLevel][MaximumMPCCombine][k];
+		mode_lib->vba.DETBufferSizeY[k] =
+				mode_lib->vba.DETBufferSizeYAllStates[mode_lib->vba.VoltageLevel][MaximumMPCCombine][k];
+		mode_lib->vba.DETBufferSizeC[k] =
+				mode_lib->vba.DETBufferSizeCAllStates[mode_lib->vba.VoltageLevel][MaximumMPCCombine][k];
+		mode_lib->vba.OutputType[k] = mode_lib->vba.OutputTypePerState[mode_lib->vba.VoltageLevel][k];
+		mode_lib->vba.OutputRate[k] = mode_lib->vba.OutputRatePerState[mode_lib->vba.VoltageLevel][k];
+	}
+
+	mode_lib->vba.DCFCLK = mode_lib->vba.DCFCLKState[mode_lib->vba.VoltageLevel][MaximumMPCCombine];
+	mode_lib->vba.DRAMSpeed = mode_lib->vba.DRAMSpeedPerState[mode_lib->vba.VoltageLevel];
+	mode_lib->vba.FabricClock = mode_lib->vba.FabricClockPerState[mode_lib->vba.VoltageLevel];
+	mode_lib->vba.SOCCLK = mode_lib->vba.SOCCLKPerState[mode_lib->vba.VoltageLevel];
+	mode_lib->vba.ReturnBW = mode_lib->vba.ReturnBWPerState[mode_lib->vba.VoltageLevel][MaximumMPCCombine];
+	mode_lib->vba.DISPCLK = mode_lib->vba.RequiredDISPCLK[mode_lib->vba.VoltageLevel][MaximumMPCCombine];
+	mode_lib->vba.maxMpcComb = MaximumMPCCombine;
+
+	for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
+		if (mode_lib->vba.BlendingAndTiming[k] == k) {
+			mode_lib->vba.ODMCombineEnabled[k] =
+					mode_lib->vba.ODMCombineEnablePerState[mode_lib->vba.VoltageLevel][k];
+		} else {
+			mode_lib->vba.ODMCombineEnabled[k] = dm_odm_combine_mode_disabled;
+		}
+
+		mode_lib->vba.DSCEnabled[k] = mode_lib->vba.RequiresDSC[mode_lib->vba.VoltageLevel][k];
+		mode_lib->vba.FECEnable[k] = mode_lib->vba.RequiresFEC[mode_lib->vba.VoltageLevel][k];
+		mode_lib->vba.OutputBpp[k] = mode_lib->vba.OutputBppPerState[mode_lib->vba.VoltageLevel][k];
+	}
+
+	mode_lib->vba.UrgentWatermark = mode_lib->vba.Watermark.UrgentWatermark;
+	mode_lib->vba.StutterEnterPlusExitWatermark = mode_lib->vba.Watermark.StutterEnterPlusExitWatermark;
+	mode_lib->vba.StutterExitWatermark = mode_lib->vba.Watermark.StutterExitWatermark;
+	mode_lib->vba.WritebackDRAMClockChangeWatermark = mode_lib->vba.Watermark.WritebackDRAMClockChangeWatermark;
+	mode_lib->vba.DRAMClockChangeWatermark = mode_lib->vba.Watermark.DRAMClockChangeWatermark;
+	mode_lib->vba.UrgentLatency = mode_lib->vba.UrgLatency[mode_lib->vba.VoltageLevel];
+	mode_lib->vba.DCFCLKDeepSleep = mode_lib->vba.ProjectedDCFCLKDeepSleep[mode_lib->vba.VoltageLevel][MaximumMPCCombine];
+
+	/* VBA has Error type to Error Msg output here, but not necessary for DML-C */
+} // ModeSupportAndSystemConfigurationFull
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.h b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.h
new file mode 100644
index 000000000000..c62e0991358b
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.h
@@ -0,0 +1,57 @@
+/*
+ * Copyright 2022 Advanced Micro Devices, Inc.
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
+ * Authors: AMD
+ *
+ */
+
+#ifndef __DML32_DISPLAY_MODE_VBA_H__
+#define __DML32_DISPLAY_MODE_VBA_H__
+
+#include "../display_mode_enums.h"
+
+// To enable a lot of debug msg
+//#define __DML_VBA_DEBUG__
+// For DML-C changes that hasn't been propagated to VBA yet
+//#define __DML_VBA_ALLOW_DELTA__
+
+// Move these to ip parameters/constant
+// At which vstartup the DML start to try if the mode can be supported
+#define __DML_VBA_MIN_VSTARTUP__    9
+
+// Delay in DCFCLK from ARB to DET (1st num is ARB to SDPIF, 2nd number is SDPIF to DET)
+#define __DML_ARB_TO_RET_DELAY__    7 + 95
+
+// fudge factor for min dcfclk calclation
+#define __DML_MIN_DCFCLK_FACTOR__   1.15
+
+// Prefetch schedule max vratio
+#define __DML_MAX_VRATIO_PRE__ 4.0
+
+#define BPP_INVALID 0
+#define BPP_BLENDED_PIPE 0xffffffff
+
+struct display_mode_lib;
+
+void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib);
+void dml32_recalculate(struct display_mode_lib *mode_lib);
+
+#endif
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
new file mode 100644
index 000000000000..6509a84eeb64
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
@@ -0,0 +1,6254 @@
+/*
+ * Copyright 2022 Advanced Micro Devices, Inc.
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
+ * Authors: AMD
+ *
+ */
+#include "display_mode_vba_util_32.h"
+#include "../dml_inline_defs.h"
+#include "display_mode_vba_32.h"
+#include "../display_mode_lib.h"
+
+unsigned int dml32_dscceComputeDelay(
+		unsigned int bpc,
+		double BPP,
+		unsigned int sliceWidth,
+		unsigned int numSlices,
+		enum output_format_class pixelFormat,
+		enum output_encoder_class Output)
+{
+	// valid bpc         = source bits per component in the set of {8, 10, 12}
+	// valid bpp         = increments of 1/16 of a bit
+	//                    min = 6/7/8 in N420/N422/444, respectively
+	//                    max = such that compression is 1:1
+	//valid sliceWidth  = number of pixels per slice line,
+	//	must be less than or equal to 5184/numSlices (or 4096/numSlices in 420 mode)
+	//valid numSlices   = number of slices in the horiziontal direction per DSC engine in the set of {1, 2, 3, 4}
+	//valid pixelFormat = pixel/color format in the set of {:N444_RGB, :S422, :N422, :N420}
+
+	// fixed value
+	unsigned int rcModelSize = 8192;
+
+	// N422/N420 operate at 2 pixels per clock
+	unsigned int pixelsPerClock, lstall, D, initalXmitDelay, w, s, ix, wx, p, l0, a, ax, L,
+	Delay, pixels;
+
+	if (pixelFormat == dm_420)
+		pixelsPerClock = 2;
+	else if (pixelFormat == dm_n422)
+		pixelsPerClock = 2;
+	// #all other modes operate at 1 pixel per clock
+	else
+		pixelsPerClock = 1;
+
+	//initial transmit delay as per PPS
+	initalXmitDelay = dml_round(rcModelSize / 2.0 / BPP / pixelsPerClock);
+
+	//compute ssm delay
+	if (bpc == 8)
+		D = 81;
+	else if (bpc == 10)
+		D = 89;
+	else
+		D = 113;
+
+	//divide by pixel per cycle to compute slice width as seen by DSC
+	w = sliceWidth / pixelsPerClock;
+
+	//422 mode has an additional cycle of delay
+	if (pixelFormat == dm_420 || pixelFormat == dm_444 || pixelFormat == dm_n422)
+		s = 0;
+	else
+		s = 1;
+
+	//main calculation for the dscce
+	ix = initalXmitDelay + 45;
+	wx = (w + 2) / 3;
+	p = 3 * wx - w;
+	l0 = ix / w;
+	a = ix + p * l0;
+	ax = (a + 2) / 3 + D + 6 + 1;
+	L = (ax + wx - 1) / wx;
+	if ((ix % w) == 0 && p != 0)
+		lstall = 1;
+	else
+		lstall = 0;
+	Delay = L * wx * (numSlices - 1) + ax + s + lstall + 22;
+
+	//dsc processes 3 pixel containers per cycle and a container can contain 1 or 2 pixels
+	pixels = Delay * 3 * pixelsPerClock;
+
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: bpc: %d\n", __func__, bpc);
+	dml_print("DML::%s: BPP: %f\n", __func__, BPP);
+	dml_print("DML::%s: sliceWidth: %d\n", __func__, sliceWidth);
+	dml_print("DML::%s: numSlices: %d\n", __func__, numSlices);
+	dml_print("DML::%s: pixelFormat: %d\n", __func__, pixelFormat);
+	dml_print("DML::%s: Output: %d\n", __func__, Output);
+	dml_print("DML::%s: pixels: %d\n", __func__, pixels);
+#endif
+
+	return pixels;
+}
+
+unsigned int dml32_dscComputeDelay(enum output_format_class pixelFormat, enum output_encoder_class Output)
+{
+	unsigned int Delay = 0;
+
+	if (pixelFormat == dm_420) {
+		//   sfr
+		Delay = Delay + 2;
+		//   dsccif
+		Delay = Delay + 0;
+		//   dscc - input deserializer
+		Delay = Delay + 3;
+		//   dscc gets pixels every other cycle
+		Delay = Delay + 2;
+		//   dscc - input cdc fifo
+		Delay = Delay + 12;
+		//   dscc gets pixels every other cycle
+		Delay = Delay + 13;
+		//   dscc - cdc uncertainty
+		Delay = Delay + 2;
+		//   dscc - output cdc fifo
+		Delay = Delay + 7;
+		//   dscc gets pixels every other cycle
+		Delay = Delay + 3;
+		//   dscc - cdc uncertainty
+		Delay = Delay + 2;
+		//   dscc - output serializer
+		Delay = Delay + 1;
+		//   sft
+		Delay = Delay + 1;
+	} else if (pixelFormat == dm_n422 || (pixelFormat != dm_444)) {
+		//   sfr
+		Delay = Delay + 2;
+		//   dsccif
+		Delay = Delay + 1;
+		//   dscc - input deserializer
+		Delay = Delay + 5;
+		//  dscc - input cdc fifo
+		Delay = Delay + 25;
+		//   dscc - cdc uncertainty
+		Delay = Delay + 2;
+		//   dscc - output cdc fifo
+		Delay = Delay + 10;
+		//   dscc - cdc uncertainty
+		Delay = Delay + 2;
+		//   dscc - output serializer
+		Delay = Delay + 1;
+		//   sft
+		Delay = Delay + 1;
+	} else {
+		//   sfr
+		Delay = Delay + 2;
+		//   dsccif
+		Delay = Delay + 0;
+		//   dscc - input deserializer
+		Delay = Delay + 3;
+		//   dscc - input cdc fifo
+		Delay = Delay + 12;
+		//   dscc - cdc uncertainty
+		Delay = Delay + 2;
+		//   dscc - output cdc fifo
+		Delay = Delay + 7;
+		//   dscc - output serializer
+		Delay = Delay + 1;
+		//   dscc - cdc uncertainty
+		Delay = Delay + 2;
+		//   sft
+		Delay = Delay + 1;
+	}
+
+	return Delay;
+}
+
+
+bool IsVertical(enum dm_rotation_angle Scan)
+{
+	bool is_vert = false;
+
+	if (Scan == dm_rotation_90 || Scan == dm_rotation_90m || Scan == dm_rotation_270 || Scan == dm_rotation_270m)
+		is_vert = true;
+	else
+		is_vert = false;
+	return is_vert;
+}
+
+void dml32_CalculateSinglePipeDPPCLKAndSCLThroughput(
+		double HRatio,
+		double HRatioChroma,
+		double VRatio,
+		double VRatioChroma,
+		double MaxDCHUBToPSCLThroughput,
+		double MaxPSCLToLBThroughput,
+		double PixelClock,
+		enum source_format_class SourcePixelFormat,
+		unsigned int HTaps,
+		unsigned int HTapsChroma,
+		unsigned int VTaps,
+		unsigned int VTapsChroma,
+
+		/* output */
+		double *PSCL_THROUGHPUT,
+		double *PSCL_THROUGHPUT_CHROMA,
+		double *DPPCLKUsingSingleDPP)
+{
+	double DPPCLKUsingSingleDPPLuma;
+	double DPPCLKUsingSingleDPPChroma;
+
+	if (HRatio > 1) {
+		*PSCL_THROUGHPUT = dml_min(MaxDCHUBToPSCLThroughput, MaxPSCLToLBThroughput * HRatio /
+				dml_ceil((double) HTaps / 6.0, 1.0));
+	} else {
+		*PSCL_THROUGHPUT = dml_min(MaxDCHUBToPSCLThroughput, MaxPSCLToLBThroughput);
+	}
+
+	DPPCLKUsingSingleDPPLuma = PixelClock * dml_max3(VTaps / 6 * dml_min(1, HRatio), HRatio * VRatio /
+			*PSCL_THROUGHPUT, 1);
+
+	if ((HTaps > 6 || VTaps > 6) && DPPCLKUsingSingleDPPLuma < 2 * PixelClock)
+		DPPCLKUsingSingleDPPLuma = 2 * PixelClock;
+
+	if ((SourcePixelFormat != dm_420_8 && SourcePixelFormat != dm_420_10 && SourcePixelFormat != dm_420_12 &&
+			SourcePixelFormat != dm_rgbe_alpha)) {
+		*PSCL_THROUGHPUT_CHROMA = 0;
+		*DPPCLKUsingSingleDPP = DPPCLKUsingSingleDPPLuma;
+	} else {
+		if (HRatioChroma > 1) {
+			*PSCL_THROUGHPUT_CHROMA = dml_min(MaxDCHUBToPSCLThroughput, MaxPSCLToLBThroughput *
+					HRatioChroma / dml_ceil((double) HTapsChroma / 6.0, 1.0));
+		} else {
+			*PSCL_THROUGHPUT_CHROMA = dml_min(MaxDCHUBToPSCLThroughput, MaxPSCLToLBThroughput);
+		}
+		DPPCLKUsingSingleDPPChroma = PixelClock * dml_max3(VTapsChroma / 6 * dml_min(1, HRatioChroma),
+				HRatioChroma * VRatioChroma / *PSCL_THROUGHPUT_CHROMA, 1);
+		if ((HTapsChroma > 6 || VTapsChroma > 6) && DPPCLKUsingSingleDPPChroma < 2 * PixelClock)
+			DPPCLKUsingSingleDPPChroma = 2 * PixelClock;
+		*DPPCLKUsingSingleDPP = dml_max(DPPCLKUsingSingleDPPLuma, DPPCLKUsingSingleDPPChroma);
+	}
+}
+
+void dml32_CalculateBytePerPixelAndBlockSizes(
+		enum source_format_class SourcePixelFormat,
+		enum dm_swizzle_mode SurfaceTiling,
+
+		/* Output */
+		unsigned int *BytePerPixelY,
+		unsigned int *BytePerPixelC,
+		double  *BytePerPixelDETY,
+		double  *BytePerPixelDETC,
+		unsigned int *BlockHeight256BytesY,
+		unsigned int *BlockHeight256BytesC,
+		unsigned int *BlockWidth256BytesY,
+		unsigned int *BlockWidth256BytesC,
+		unsigned int *MacroTileHeightY,
+		unsigned int *MacroTileHeightC,
+		unsigned int *MacroTileWidthY,
+		unsigned int *MacroTileWidthC)
+{
+	if (SourcePixelFormat == dm_444_64) {
+		*BytePerPixelDETY = 8;
+		*BytePerPixelDETC = 0;
+		*BytePerPixelY = 8;
+		*BytePerPixelC = 0;
+	} else if (SourcePixelFormat == dm_444_32 || SourcePixelFormat == dm_rgbe) {
+		*BytePerPixelDETY = 4;
+		*BytePerPixelDETC = 0;
+		*BytePerPixelY = 4;
+		*BytePerPixelC = 0;
+	} else if (SourcePixelFormat == dm_444_16 || SourcePixelFormat == dm_444_16) {
+		*BytePerPixelDETY = 2;
+		*BytePerPixelDETC = 0;
+		*BytePerPixelY = 2;
+		*BytePerPixelC = 0;
+	} else if (SourcePixelFormat == dm_444_8) {
+		*BytePerPixelDETY = 1;
+		*BytePerPixelDETC = 0;
+		*BytePerPixelY = 1;
+		*BytePerPixelC = 0;
+	} else if (SourcePixelFormat == dm_rgbe_alpha) {
+		*BytePerPixelDETY = 4;
+		*BytePerPixelDETC = 1;
+		*BytePerPixelY = 4;
+		*BytePerPixelC = 1;
+	} else if (SourcePixelFormat == dm_420_8) {
+		*BytePerPixelDETY = 1;
+		*BytePerPixelDETC = 2;
+		*BytePerPixelY = 1;
+		*BytePerPixelC = 2;
+	} else if (SourcePixelFormat == dm_420_12) {
+		*BytePerPixelDETY = 2;
+		*BytePerPixelDETC = 4;
+		*BytePerPixelY = 2;
+		*BytePerPixelC = 4;
+	} else {
+		*BytePerPixelDETY = 4.0 / 3;
+		*BytePerPixelDETC = 8.0 / 3;
+		*BytePerPixelY = 2;
+		*BytePerPixelC = 4;
+	}
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: SourcePixelFormat = %d\n", __func__, SourcePixelFormat);
+	dml_print("DML::%s: BytePerPixelDETY = %f\n", __func__, *BytePerPixelDETY);
+	dml_print("DML::%s: BytePerPixelDETC = %f\n", __func__, *BytePerPixelDETC);
+	dml_print("DML::%s: BytePerPixelY    = %d\n", __func__, *BytePerPixelY);
+	dml_print("DML::%s: BytePerPixelC    = %d\n", __func__, *BytePerPixelC);
+#endif
+	if ((SourcePixelFormat == dm_444_64 || SourcePixelFormat == dm_444_32
+			|| SourcePixelFormat == dm_444_16
+			|| SourcePixelFormat == dm_444_8
+			|| SourcePixelFormat == dm_mono_16
+			|| SourcePixelFormat == dm_mono_8
+			|| SourcePixelFormat == dm_rgbe)) {
+		if (SurfaceTiling == dm_sw_linear)
+			*BlockHeight256BytesY = 1;
+		else if (SourcePixelFormat == dm_444_64)
+			*BlockHeight256BytesY = 4;
+		else if (SourcePixelFormat == dm_444_8)
+			*BlockHeight256BytesY = 16;
+		else
+			*BlockHeight256BytesY = 8;
+
+		*BlockWidth256BytesY = 256U / *BytePerPixelY / *BlockHeight256BytesY;
+		*BlockHeight256BytesC = 0;
+		*BlockWidth256BytesC = 0;
+	} else {
+		if (SurfaceTiling == dm_sw_linear) {
+			*BlockHeight256BytesY = 1;
+			*BlockHeight256BytesC = 1;
+		} else if (SourcePixelFormat == dm_rgbe_alpha) {
+			*BlockHeight256BytesY = 8;
+			*BlockHeight256BytesC = 16;
+		} else if (SourcePixelFormat == dm_420_8) {
+			*BlockHeight256BytesY = 16;
+			*BlockHeight256BytesC = 8;
+		} else {
+			*BlockHeight256BytesY = 8;
+			*BlockHeight256BytesC = 8;
+		}
+		*BlockWidth256BytesY = 256U / *BytePerPixelY / *BlockHeight256BytesY;
+		*BlockWidth256BytesC = 256U / *BytePerPixelC / *BlockHeight256BytesC;
+	}
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: BlockWidth256BytesY  = %d\n", __func__, *BlockWidth256BytesY);
+	dml_print("DML::%s: BlockHeight256BytesY = %d\n", __func__, *BlockHeight256BytesY);
+	dml_print("DML::%s: BlockWidth256BytesC  = %d\n", __func__, *BlockWidth256BytesC);
+	dml_print("DML::%s: BlockHeight256BytesC = %d\n", __func__, *BlockHeight256BytesC);
+#endif
+
+	if (SurfaceTiling == dm_sw_linear) {
+		*MacroTileHeightY = *BlockHeight256BytesY;
+		*MacroTileWidthY = 256 / *BytePerPixelY / *MacroTileHeightY;
+		*MacroTileHeightC = *BlockHeight256BytesC;
+		if (*MacroTileHeightC == 0)
+			*MacroTileWidthC = 0;
+		else
+			*MacroTileWidthC = 256 / *BytePerPixelC / *MacroTileHeightC;
+	} else if (SurfaceTiling == dm_sw_64kb_d || SurfaceTiling == dm_sw_64kb_d_t ||
+			SurfaceTiling == dm_sw_64kb_d_x || SurfaceTiling == dm_sw_64kb_r_x) {
+		*MacroTileHeightY = 16 * *BlockHeight256BytesY;
+		*MacroTileWidthY = 65536 / *BytePerPixelY / *MacroTileHeightY;
+		*MacroTileHeightC = 16 * *BlockHeight256BytesC;
+		if (*MacroTileHeightC == 0)
+			*MacroTileWidthC = 0;
+		else
+			*MacroTileWidthC = 65536 / *BytePerPixelC / *MacroTileHeightC;
+	} else {
+		*MacroTileHeightY = 32 * *BlockHeight256BytesY;
+		*MacroTileWidthY = 65536 * 4 / *BytePerPixelY / *MacroTileHeightY;
+		*MacroTileHeightC = 32 * *BlockHeight256BytesC;
+		if (*MacroTileHeightC == 0)
+			*MacroTileWidthC = 0;
+		else
+			*MacroTileWidthC = 65536 * 4 / *BytePerPixelC / *MacroTileHeightC;
+	}
+
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: MacroTileWidthY  = %d\n", __func__, *MacroTileWidthY);
+	dml_print("DML::%s: MacroTileHeightY = %d\n", __func__, *MacroTileHeightY);
+	dml_print("DML::%s: MacroTileWidthC  = %d\n", __func__, *MacroTileWidthC);
+	dml_print("DML::%s: MacroTileHeightC = %d\n", __func__, *MacroTileHeightC);
+#endif
+} // CalculateBytePerPixelAndBlockSizes
+
+void dml32_CalculatedoublePipeDPPCLKAndSCLThroughput(
+		double HRatio,
+		double HRatioChroma,
+		double VRatio,
+		double VRatioChroma,
+		double MaxDCHUBToPSCLThroughput,
+		double MaxPSCLToLBThroughput,
+		double PixelClock,
+		enum source_format_class SourcePixelFormat,
+		unsigned int HTaps,
+		unsigned int HTapsChroma,
+		unsigned int VTaps,
+		unsigned int VTapsChroma,
+
+		/* output */
+		double *PSCL_THROUGHPUT,
+		double *PSCL_THROUGHPUT_CHROMA,
+		double *DPPCLKUsingdoubleDPP)
+{
+	double DPPCLKUsingdoubleDPPLuma;
+	double DPPCLKUsingdoubleDPPChroma;
+
+	if (HRatio > 1) {
+		*PSCL_THROUGHPUT = dml_min(MaxDCHUBToPSCLThroughput, MaxPSCLToLBThroughput * HRatio /
+				dml_ceil((double) HTaps / 6.0, 1.0));
+	} else {
+		*PSCL_THROUGHPUT = dml_min(MaxDCHUBToPSCLThroughput, MaxPSCLToLBThroughput);
+	}
+
+	DPPCLKUsingdoubleDPPLuma = PixelClock * dml_max3(VTaps / 6 * dml_min(1, HRatio), HRatio * VRatio /
+			*PSCL_THROUGHPUT, 1);
+
+	if ((HTaps > 6 || VTaps > 6) && DPPCLKUsingdoubleDPPLuma < 2 * PixelClock)
+		DPPCLKUsingdoubleDPPLuma = 2 * PixelClock;
+
+	if ((SourcePixelFormat != dm_420_8 && SourcePixelFormat != dm_420_10 && SourcePixelFormat != dm_420_12 &&
+			SourcePixelFormat != dm_rgbe_alpha)) {
+		*PSCL_THROUGHPUT_CHROMA = 0;
+		*DPPCLKUsingdoubleDPP = DPPCLKUsingdoubleDPPLuma;
+	} else {
+		if (HRatioChroma > 1) {
+			*PSCL_THROUGHPUT_CHROMA = dml_min(MaxDCHUBToPSCLThroughput, MaxPSCLToLBThroughput *
+					HRatioChroma / dml_ceil((double) HTapsChroma / 6.0, 1.0));
+		} else {
+			*PSCL_THROUGHPUT_CHROMA = dml_min(MaxDCHUBToPSCLThroughput, MaxPSCLToLBThroughput);
+		}
+		DPPCLKUsingdoubleDPPChroma = PixelClock * dml_max3(VTapsChroma / 6 * dml_min(1, HRatioChroma),
+				HRatioChroma * VRatioChroma / *PSCL_THROUGHPUT_CHROMA, 1);
+		if ((HTapsChroma > 6 || VTapsChroma > 6) && DPPCLKUsingdoubleDPPChroma < 2 * PixelClock)
+			DPPCLKUsingdoubleDPPChroma = 2 * PixelClock;
+		*DPPCLKUsingdoubleDPP = dml_max(DPPCLKUsingdoubleDPPLuma, DPPCLKUsingdoubleDPPChroma);
+	}
+}
+
+void dml32_CalculateSwathAndDETConfiguration(
+		unsigned int DETSizeOverride[],
+		enum dm_use_mall_for_pstate_change_mode UseMALLForPStateChange[],
+		unsigned int ConfigReturnBufferSizeInKByte,
+		unsigned int MaxTotalDETInKByte,
+		unsigned int MinCompressedBufferSizeInKByte,
+		double ForceSingleDPP,
+		unsigned int NumberOfActiveSurfaces,
+		unsigned int nomDETInKByte,
+		enum unbounded_requesting_policy UseUnboundedRequestingFinal,
+		unsigned int CompressedBufferSegmentSizeInkByteFinal,
+		enum output_encoder_class Output[],
+		double ReadBandwidthLuma[],
+		double ReadBandwidthChroma[],
+		double MaximumSwathWidthLuma[],
+		double MaximumSwathWidthChroma[],
+		enum dm_rotation_angle SourceRotation[],
+		bool ViewportStationary[],
+		enum source_format_class SourcePixelFormat[],
+		enum dm_swizzle_mode SurfaceTiling[],
+		unsigned int ViewportWidth[],
+		unsigned int ViewportHeight[],
+		unsigned int ViewportXStart[],
+		unsigned int ViewportYStart[],
+		unsigned int ViewportXStartC[],
+		unsigned int ViewportYStartC[],
+		unsigned int SurfaceWidthY[],
+		unsigned int SurfaceWidthC[],
+		unsigned int SurfaceHeightY[],
+		unsigned int SurfaceHeightC[],
+		unsigned int Read256BytesBlockHeightY[],
+		unsigned int Read256BytesBlockHeightC[],
+		unsigned int Read256BytesBlockWidthY[],
+		unsigned int Read256BytesBlockWidthC[],
+		enum odm_combine_mode ODMMode[],
+		unsigned int BlendingAndTiming[],
+		unsigned int BytePerPixY[],
+		unsigned int BytePerPixC[],
+		double BytePerPixDETY[],
+		double BytePerPixDETC[],
+		unsigned int HActive[],
+		double HRatio[],
+		double HRatioChroma[],
+		unsigned int DPPPerSurface[],
+
+		/* Output */
+		unsigned int swath_width_luma_ub[],
+		unsigned int swath_width_chroma_ub[],
+		double SwathWidth[],
+		double SwathWidthChroma[],
+		unsigned int SwathHeightY[],
+		unsigned int SwathHeightC[],
+		unsigned int DETBufferSizeInKByte[],
+		unsigned int DETBufferSizeY[],
+		unsigned int DETBufferSizeC[],
+		bool *UnboundedRequestEnabled,
+		unsigned int *CompressedBufferSizeInkByte,
+		bool ViewportSizeSupportPerSurface[],
+		bool *ViewportSizeSupport)
+{
+	unsigned int MaximumSwathHeightY[DC__NUM_DPP__MAX];
+	unsigned int MaximumSwathHeightC[DC__NUM_DPP__MAX];
+	unsigned int RoundedUpMaxSwathSizeBytesY[DC__NUM_DPP__MAX];
+	unsigned int RoundedUpMaxSwathSizeBytesC[DC__NUM_DPP__MAX];
+	unsigned int RoundedUpSwathSizeBytesY;
+	unsigned int RoundedUpSwathSizeBytesC;
+	double SwathWidthdoubleDPP[DC__NUM_DPP__MAX];
+	double SwathWidthdoubleDPPChroma[DC__NUM_DPP__MAX];
+	unsigned int k;
+	unsigned int TotalActiveDPP = 0;
+	bool NoChromaSurfaces = true;
+	unsigned int DETBufferSizeInKByteForSwathCalculation;
+
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: ForceSingleDPP = %d\n", __func__, ForceSingleDPP);
+#endif
+	dml32_CalculateSwathWidth(ForceSingleDPP,
+			NumberOfActiveSurfaces,
+			SourcePixelFormat,
+			SourceRotation,
+			ViewportStationary,
+			ViewportWidth,
+			ViewportHeight,
+			ViewportXStart,
+			ViewportYStart,
+			ViewportXStartC,
+			ViewportYStartC,
+			SurfaceWidthY,
+			SurfaceWidthC,
+			SurfaceHeightY,
+			SurfaceHeightC,
+			ODMMode,
+			BytePerPixY,
+			BytePerPixC,
+			Read256BytesBlockHeightY,
+			Read256BytesBlockHeightC,
+			Read256BytesBlockWidthY,
+			Read256BytesBlockWidthC,
+			BlendingAndTiming,
+			HActive,
+			HRatio,
+			DPPPerSurface,
+
+			/* Output */
+			SwathWidthdoubleDPP,
+			SwathWidthdoubleDPPChroma,
+			SwathWidth,
+			SwathWidthChroma,
+			MaximumSwathHeightY,
+			MaximumSwathHeightC,
+			swath_width_luma_ub,
+			swath_width_chroma_ub);
+
+	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+		RoundedUpMaxSwathSizeBytesY[k] = swath_width_luma_ub[k] * BytePerPixDETY[k] * MaximumSwathHeightY[k];
+		RoundedUpMaxSwathSizeBytesC[k] = swath_width_chroma_ub[k] * BytePerPixDETC[k] * MaximumSwathHeightC[k];
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML::%s: k=%0d DPPPerSurface = %d\n", __func__, k, DPPPerSurface[k]);
+		dml_print("DML::%s: k=%0d swath_width_luma_ub = %d\n", __func__, k, swath_width_luma_ub[k]);
+		dml_print("DML::%s: k=%0d BytePerPixDETY = %f\n", __func__, k, BytePerPixDETY[k]);
+		dml_print("DML::%s: k=%0d MaximumSwathHeightY = %d\n", __func__, k, MaximumSwathHeightY[k]);
+		dml_print("DML::%s: k=%0d RoundedUpMaxSwathSizeBytesY = %d\n", __func__, k,
+				RoundedUpMaxSwathSizeBytesY[k]);
+		dml_print("DML::%s: k=%0d swath_width_chroma_ub = %d\n", __func__, k, swath_width_chroma_ub[k]);
+		dml_print("DML::%s: k=%0d BytePerPixDETC = %f\n", __func__, k, BytePerPixDETC[k]);
+		dml_print("DML::%s: k=%0d MaximumSwathHeightC = %d\n", __func__, k, MaximumSwathHeightC[k]);
+		dml_print("DML::%s: k=%0d RoundedUpMaxSwathSizeBytesC = %d\n", __func__, k,
+				RoundedUpMaxSwathSizeBytesC[k]);
+#endif
+
+		if (SourcePixelFormat[k] == dm_420_10) {
+			RoundedUpMaxSwathSizeBytesY[k] = dml_ceil((unsigned int) RoundedUpMaxSwathSizeBytesY[k], 256);
+			RoundedUpMaxSwathSizeBytesC[k] = dml_ceil((unsigned int) RoundedUpMaxSwathSizeBytesC[k], 256);
+		}
+	}
+
+	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+		TotalActiveDPP = TotalActiveDPP + (ForceSingleDPP ? 1 : DPPPerSurface[k]);
+		if (SourcePixelFormat[k] == dm_420_8 || SourcePixelFormat[k] == dm_420_10 ||
+				SourcePixelFormat[k] == dm_420_12 || SourcePixelFormat[k] == dm_rgbe_alpha) {
+			NoChromaSurfaces = false;
+		}
+	}
+
+	*UnboundedRequestEnabled = dml32_UnboundedRequest(UseUnboundedRequestingFinal, TotalActiveDPP,
+			NoChromaSurfaces, Output[0]);
+
+	dml32_CalculateDETBufferSize(DETSizeOverride,
+			UseMALLForPStateChange,
+			ForceSingleDPP,
+			NumberOfActiveSurfaces,
+			*UnboundedRequestEnabled,
+			nomDETInKByte,
+			MaxTotalDETInKByte,
+			ConfigReturnBufferSizeInKByte,
+			MinCompressedBufferSizeInKByte,
+			CompressedBufferSegmentSizeInkByteFinal,
+			SourcePixelFormat,
+			ReadBandwidthLuma,
+			ReadBandwidthChroma,
+			RoundedUpMaxSwathSizeBytesY,
+			RoundedUpMaxSwathSizeBytesC,
+			DPPPerSurface,
+
+			/* Output */
+			DETBufferSizeInKByte,    // per hubp pipe
+			CompressedBufferSizeInkByte);
+
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: TotalActiveDPP = %d\n", __func__, TotalActiveDPP);
+	dml_print("DML::%s: nomDETInKByte = %d\n", __func__, nomDETInKByte);
+	dml_print("DML::%s: ConfigReturnBufferSizeInKByte = %d\n", __func__, ConfigReturnBufferSizeInKByte);
+	dml_print("DML::%s: UseUnboundedRequestingFinal = %d\n", __func__, UseUnboundedRequestingFinal);
+	dml_print("DML::%s: UnboundedRequestEnabled = %d\n", __func__, *UnboundedRequestEnabled);
+	dml_print("DML::%s: CompressedBufferSizeInkByte = %d\n", __func__, *CompressedBufferSizeInkByte);
+#endif
+
+	*ViewportSizeSupport = true;
+	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+
+		DETBufferSizeInKByteForSwathCalculation = (UseMALLForPStateChange[k] ==
+				dm_use_mall_pstate_change_phantom_pipe ? 1024 : DETBufferSizeInKByte[k]);
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML::%s: k=%0d DETBufferSizeInKByteForSwathCalculation = %d\n", __func__, k,
+				DETBufferSizeInKByteForSwathCalculation);
+#endif
+
+		if (RoundedUpMaxSwathSizeBytesY[k] + RoundedUpMaxSwathSizeBytesC[k] <=
+				DETBufferSizeInKByteForSwathCalculation * 1024 / 2) {
+			SwathHeightY[k] = MaximumSwathHeightY[k];
+			SwathHeightC[k] = MaximumSwathHeightC[k];
+			RoundedUpSwathSizeBytesY = RoundedUpMaxSwathSizeBytesY[k];
+			RoundedUpSwathSizeBytesC = RoundedUpMaxSwathSizeBytesC[k];
+		} else if (RoundedUpMaxSwathSizeBytesY[k] >= 1.5 * RoundedUpMaxSwathSizeBytesC[k] &&
+				RoundedUpMaxSwathSizeBytesY[k] / 2 + RoundedUpMaxSwathSizeBytesC[k] <=
+				DETBufferSizeInKByteForSwathCalculation * 1024 / 2) {
+			SwathHeightY[k] = MaximumSwathHeightY[k] / 2;
+			SwathHeightC[k] = MaximumSwathHeightC[k];
+			RoundedUpSwathSizeBytesY = RoundedUpMaxSwathSizeBytesY[k] / 2;
+			RoundedUpSwathSizeBytesC = RoundedUpMaxSwathSizeBytesC[k];
+		} else if (RoundedUpMaxSwathSizeBytesY[k] < 1.5 * RoundedUpMaxSwathSizeBytesC[k] &&
+				RoundedUpMaxSwathSizeBytesY[k] + RoundedUpMaxSwathSizeBytesC[k] / 2 <=
+				DETBufferSizeInKByteForSwathCalculation * 1024 / 2) {
+			SwathHeightY[k] = MaximumSwathHeightY[k];
+			SwathHeightC[k] = MaximumSwathHeightC[k] / 2;
+			RoundedUpSwathSizeBytesY = RoundedUpMaxSwathSizeBytesY[k];
+			RoundedUpSwathSizeBytesC = RoundedUpMaxSwathSizeBytesC[k] / 2;
+		} else {
+			SwathHeightY[k] = MaximumSwathHeightY[k] / 2;
+			SwathHeightC[k] = MaximumSwathHeightC[k] / 2;
+			RoundedUpSwathSizeBytesY = RoundedUpMaxSwathSizeBytesY[k] / 2;
+			RoundedUpSwathSizeBytesC = RoundedUpMaxSwathSizeBytesC[k] / 2;
+		}
+
+		if ((RoundedUpMaxSwathSizeBytesY[k] / 2 + RoundedUpMaxSwathSizeBytesC[k] / 2 >
+				DETBufferSizeInKByteForSwathCalculation * 1024 / 2)
+				|| SwathWidth[k] > MaximumSwathWidthLuma[k] || (SwathHeightC[k] > 0 &&
+						SwathWidthChroma[k] > MaximumSwathWidthChroma[k])) {
+			*ViewportSizeSupport = false;
+			ViewportSizeSupportPerSurface[k] = false;
+		} else {
+			ViewportSizeSupportPerSurface[k] = true;
+		}
+
+		if (SwathHeightC[k] == 0) {
+#ifdef __DML_VBA_DEBUG__
+			dml_print("DML::%s: k=%0d All DET for plane0\n", __func__, k);
+#endif
+			DETBufferSizeY[k] = DETBufferSizeInKByte[k] * 1024;
+			DETBufferSizeC[k] = 0;
+		} else if (RoundedUpSwathSizeBytesY <= 1.5 * RoundedUpSwathSizeBytesC) {
+#ifdef __DML_VBA_DEBUG__
+			dml_print("DML::%s: k=%0d Half DET for plane0, half for plane1\n", __func__, k);
+#endif
+			DETBufferSizeY[k] = DETBufferSizeInKByte[k] * 1024 / 2;
+			DETBufferSizeC[k] = DETBufferSizeInKByte[k] * 1024 / 2;
+		} else {
+#ifdef __DML_VBA_DEBUG__
+			dml_print("DML::%s: k=%0d 2/3 DET for plane0, 1/3 for plane1\n", __func__, k);
+#endif
+			DETBufferSizeY[k] = dml_floor(DETBufferSizeInKByte[k] * 1024 * 2 / 3, 1024);
+			DETBufferSizeC[k] = DETBufferSizeInKByte[k] * 1024 - DETBufferSizeY[k];
+		}
+
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML::%s: k=%0d SwathHeightY = %d\n", __func__, k, SwathHeightY[k]);
+		dml_print("DML::%s: k=%0d SwathHeightC = %d\n", __func__, k, SwathHeightC[k]);
+		dml_print("DML::%s: k=%0d RoundedUpMaxSwathSizeBytesY = %d\n", __func__,
+				k, RoundedUpMaxSwathSizeBytesY[k]);
+		dml_print("DML::%s: k=%0d RoundedUpMaxSwathSizeBytesC = %d\n", __func__,
+				k, RoundedUpMaxSwathSizeBytesC[k]);
+		dml_print("DML::%s: k=%0d RoundedUpSwathSizeBytesY = %d\n", __func__, k, RoundedUpSwathSizeBytesY);
+		dml_print("DML::%s: k=%0d RoundedUpSwathSizeBytesC = %d\n", __func__, k, RoundedUpSwathSizeBytesC);
+		dml_print("DML::%s: k=%0d DETBufferSizeInKByte = %d\n", __func__, k, DETBufferSizeInKByte[k]);
+		dml_print("DML::%s: k=%0d DETBufferSizeY = %d\n", __func__, k, DETBufferSizeY[k]);
+		dml_print("DML::%s: k=%0d DETBufferSizeC = %d\n", __func__, k, DETBufferSizeC[k]);
+		dml_print("DML::%s: k=%0d ViewportSizeSupportPerSurface = %d\n", __func__, k,
+				ViewportSizeSupportPerSurface[k]);
+#endif
+
+	}
+} // CalculateSwathAndDETConfiguration
+
+void dml32_CalculateSwathWidth(
+		bool				ForceSingleDPP,
+		unsigned int			NumberOfActiveSurfaces,
+		enum source_format_class	SourcePixelFormat[],
+		enum dm_rotation_angle		SourceRotation[],
+		bool				ViewportStationary[],
+		unsigned int			ViewportWidth[],
+		unsigned int			ViewportHeight[],
+		unsigned int			ViewportXStart[],
+		unsigned int			ViewportYStart[],
+		unsigned int			ViewportXStartC[],
+		unsigned int			ViewportYStartC[],
+		unsigned int			SurfaceWidthY[],
+		unsigned int			SurfaceWidthC[],
+		unsigned int			SurfaceHeightY[],
+		unsigned int			SurfaceHeightC[],
+		enum odm_combine_mode		ODMMode[],
+		unsigned int			BytePerPixY[],
+		unsigned int			BytePerPixC[],
+		unsigned int			Read256BytesBlockHeightY[],
+		unsigned int			Read256BytesBlockHeightC[],
+		unsigned int			Read256BytesBlockWidthY[],
+		unsigned int			Read256BytesBlockWidthC[],
+		unsigned int			BlendingAndTiming[],
+		unsigned int			HActive[],
+		double				HRatio[],
+		unsigned int			DPPPerSurface[],
+
+		/* Output */
+		double				SwathWidthdoubleDPPY[],
+		double				SwathWidthdoubleDPPC[],
+		double				SwathWidthY[], // per-pipe
+		double				SwathWidthC[], // per-pipe
+		unsigned int			MaximumSwathHeightY[],
+		unsigned int			MaximumSwathHeightC[],
+		unsigned int			swath_width_luma_ub[], // per-pipe
+		unsigned int			swath_width_chroma_ub[]) // per-pipe
+{
+	unsigned int k, j;
+	enum odm_combine_mode MainSurfaceODMMode;
+
+    unsigned int surface_width_ub_l;
+    unsigned int surface_height_ub_l;
+    unsigned int surface_width_ub_c;
+    unsigned int surface_height_ub_c;
+
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: ForceSingleDPP = %d\n", __func__, ForceSingleDPP);
+	dml_print("DML::%s: NumberOfActiveSurfaces = %d\n", __func__, NumberOfActiveSurfaces);
+#endif
+
+	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+		if (!IsVertical(SourceRotation[k]))
+			SwathWidthdoubleDPPY[k] = ViewportWidth[k];
+		else
+			SwathWidthdoubleDPPY[k] = ViewportHeight[k];
+
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML::%s: k=%d ViewportWidth=%d\n", __func__, k, ViewportWidth[k]);
+		dml_print("DML::%s: k=%d ViewportHeight=%d\n", __func__, k, ViewportHeight[k]);
+#endif
+
+		MainSurfaceODMMode = ODMMode[k];
+		for (j = 0; j < NumberOfActiveSurfaces; ++j) {
+			if (BlendingAndTiming[k] == j)
+				MainSurfaceODMMode = ODMMode[j];
+		}
+
+		if (ForceSingleDPP) {
+			SwathWidthY[k] = SwathWidthdoubleDPPY[k];
+		} else {
+			if (MainSurfaceODMMode == dm_odm_combine_mode_4to1) {
+				SwathWidthY[k] = dml_min(SwathWidthdoubleDPPY[k],
+						dml_round(HActive[k] / 4.0 * HRatio[k]));
+			} else if (MainSurfaceODMMode == dm_odm_combine_mode_2to1) {
+				SwathWidthY[k] = dml_min(SwathWidthdoubleDPPY[k],
+						dml_round(HActive[k] / 2.0 * HRatio[k]));
+			} else if (DPPPerSurface[k] == 2) {
+				SwathWidthY[k] = SwathWidthdoubleDPPY[k] / 2;
+			} else {
+				SwathWidthY[k] = SwathWidthdoubleDPPY[k];
+			}
+		}
+
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML::%s: k=%d HActive=%d\n", __func__, k, HActive[k]);
+		dml_print("DML::%s: k=%d HRatio=%f\n", __func__, k, HRatio[k]);
+		dml_print("DML::%s: k=%d MainSurfaceODMMode=%d\n", __func__, k, MainSurfaceODMMode);
+		dml_print("DML::%s: k=%d SwathWidthdoubleDPPY=%d\n", __func__, k, SwathWidthdoubleDPPY[k]);
+		dml_print("DML::%s: k=%d SwathWidthY=%d\n", __func__, k, SwathWidthY[k]);
+#endif
+
+		if (SourcePixelFormat[k] == dm_420_8 || SourcePixelFormat[k] == dm_420_10 ||
+				SourcePixelFormat[k] == dm_420_12) {
+			SwathWidthC[k] = SwathWidthY[k] / 2;
+			SwathWidthdoubleDPPC[k] = SwathWidthdoubleDPPY[k] / 2;
+		} else {
+			SwathWidthC[k] = SwathWidthY[k];
+			SwathWidthdoubleDPPC[k] = SwathWidthdoubleDPPY[k];
+		}
+
+		if (ForceSingleDPP == true) {
+			SwathWidthY[k] = SwathWidthdoubleDPPY[k];
+			SwathWidthC[k] = SwathWidthdoubleDPPC[k];
+		}
+
+		surface_width_ub_l  = dml_ceil(SurfaceWidthY[k], Read256BytesBlockWidthY[k]);
+		surface_height_ub_l = dml_ceil(SurfaceHeightY[k], Read256BytesBlockHeightY[k]);
+		surface_width_ub_c  = dml_ceil(SurfaceWidthC[k], Read256BytesBlockWidthC[k]);
+		surface_height_ub_c = dml_ceil(SurfaceHeightC[k], Read256BytesBlockHeightC[k]);
+
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML::%s: k=%d surface_width_ub_l=%0d\n", __func__, k, surface_width_ub_l);
+		dml_print("DML::%s: k=%d surface_height_ub_l=%0d\n", __func__, k, surface_height_ub_l);
+		dml_print("DML::%s: k=%d surface_width_ub_c=%0d\n", __func__, k, surface_width_ub_c);
+		dml_print("DML::%s: k=%d surface_height_ub_c=%0d\n", __func__, k, surface_height_ub_c);
+		dml_print("DML::%s: k=%d Read256BytesBlockWidthY=%0d\n", __func__, k, Read256BytesBlockWidthY[k]);
+		dml_print("DML::%s: k=%d Read256BytesBlockHeightY=%0d\n", __func__, k, Read256BytesBlockHeightY[k]);
+		dml_print("DML::%s: k=%d Read256BytesBlockWidthC=%0d\n", __func__, k, Read256BytesBlockWidthC[k]);
+		dml_print("DML::%s: k=%d Read256BytesBlockHeightC=%0d\n", __func__, k, Read256BytesBlockHeightC[k]);
+		dml_print("DML::%s: k=%d ViewportStationary=%0d\n", __func__, k, ViewportStationary[k]);
+		dml_print("DML::%s: k=%d DPPPerSurface=%0d\n", __func__, k, DPPPerSurface[k]);
+#endif
+
+		if (!IsVertical(SourceRotation[k])) {
+			MaximumSwathHeightY[k] = Read256BytesBlockHeightY[k];
+			MaximumSwathHeightC[k] = Read256BytesBlockHeightC[k];
+			if (ViewportStationary[k] && DPPPerSurface[k] == 1) {
+				swath_width_luma_ub[k] = dml_min(surface_width_ub_l,
+						dml_floor(ViewportXStart[k] +
+								SwathWidthY[k] +
+								Read256BytesBlockWidthY[k] - 1,
+								Read256BytesBlockWidthY[k]) -
+								dml_floor(ViewportXStart[k],
+								Read256BytesBlockWidthY[k]));
+			} else {
+				swath_width_luma_ub[k] = dml_min(surface_width_ub_l,
+						dml_ceil(SwathWidthY[k] - 1,
+								Read256BytesBlockWidthY[k]) +
+								Read256BytesBlockWidthY[k]);
+			}
+			if (BytePerPixC[k] > 0) {
+				if (ViewportStationary[k] && DPPPerSurface[k] == 1) {
+					swath_width_chroma_ub[k] = dml_min(surface_width_ub_c,
+							dml_floor(ViewportXStartC[k] + SwathWidthC[k] +
+									Read256BytesBlockWidthC[k] - 1,
+									Read256BytesBlockWidthC[k]) -
+									dml_floor(ViewportXStartC[k],
+									Read256BytesBlockWidthC[k]));
+				} else {
+					swath_width_chroma_ub[k] = dml_min(surface_width_ub_c,
+							dml_ceil(SwathWidthC[k] - 1,
+								Read256BytesBlockWidthC[k]) +
+								Read256BytesBlockWidthC[k]);
+				}
+			} else {
+				swath_width_chroma_ub[k] = 0;
+			}
+		} else {
+			MaximumSwathHeightY[k] = Read256BytesBlockWidthY[k];
+			MaximumSwathHeightC[k] = Read256BytesBlockWidthC[k];
+
+			if (ViewportStationary[k] && DPPPerSurface[k] == 1) {
+				swath_width_luma_ub[k] = dml_min(surface_height_ub_l, dml_floor(ViewportYStart[k] +
+						SwathWidthY[k] + Read256BytesBlockHeightY[k] - 1,
+						Read256BytesBlockHeightY[k]) -
+						dml_floor(ViewportYStart[k], Read256BytesBlockHeightY[k]));
+			} else {
+				swath_width_luma_ub[k] = dml_min(surface_height_ub_l, dml_ceil(SwathWidthY[k] - 1,
+						Read256BytesBlockHeightY[k]) + Read256BytesBlockHeightY[k]);
+			}
+			if (BytePerPixC[k] > 0) {
+				if (ViewportStationary[k] && DPPPerSurface[k] == 1) {
+					swath_width_chroma_ub[k] = dml_min(surface_height_ub_c,
+							dml_floor(ViewportYStartC[k] + SwathWidthC[k] +
+									Read256BytesBlockHeightC[k] - 1,
+									Read256BytesBlockHeightC[k]) -
+									dml_floor(ViewportYStartC[k],
+											Read256BytesBlockHeightC[k]));
+				} else {
+					swath_width_chroma_ub[k] = dml_min(surface_height_ub_c,
+							dml_ceil(SwathWidthC[k] - 1, Read256BytesBlockHeightC[k]) +
+							Read256BytesBlockHeightC[k]);
+				}
+			} else {
+				swath_width_chroma_ub[k] = 0;
+			}
+		}
+
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML::%s: k=%d swath_width_luma_ub=%0d\n", __func__, k, swath_width_luma_ub[k]);
+		dml_print("DML::%s: k=%d swath_width_chroma_ub=%0d\n", __func__, k, swath_width_chroma_ub[k]);
+		dml_print("DML::%s: k=%d MaximumSwathHeightY=%0d\n", __func__, k, MaximumSwathHeightY[k]);
+		dml_print("DML::%s: k=%d MaximumSwathHeightC=%0d\n", __func__, k, MaximumSwathHeightC[k]);
+#endif
+
+	}
+} // CalculateSwathWidth
+
+bool dml32_UnboundedRequest(enum unbounded_requesting_policy UseUnboundedRequestingFinal,
+		unsigned int TotalNumberOfActiveDPP,
+		bool NoChroma,
+		enum output_encoder_class Output)
+{
+	bool ret_val = false;
+
+	ret_val = (UseUnboundedRequestingFinal != dm_unbounded_requesting_disable &&
+			TotalNumberOfActiveDPP == 1 && NoChroma);
+	if (UseUnboundedRequestingFinal == dm_unbounded_requesting_edp_only && Output != dm_edp)
+		ret_val = false;
+	return ret_val;
+}
+
+void dml32_CalculateDETBufferSize(
+		unsigned int DETSizeOverride[],
+		enum dm_use_mall_for_pstate_change_mode UseMALLForPStateChange[],
+		bool ForceSingleDPP,
+		unsigned int NumberOfActiveSurfaces,
+		bool UnboundedRequestEnabled,
+		unsigned int nomDETInKByte,
+		unsigned int MaxTotalDETInKByte,
+		unsigned int ConfigReturnBufferSizeInKByte,
+		unsigned int MinCompressedBufferSizeInKByte,
+		unsigned int CompressedBufferSegmentSizeInkByteFinal,
+		enum source_format_class SourcePixelFormat[],
+		double ReadBandwidthLuma[],
+		double ReadBandwidthChroma[],
+		unsigned int RoundedUpMaxSwathSizeBytesY[],
+		unsigned int RoundedUpMaxSwathSizeBytesC[],
+		unsigned int DPPPerSurface[],
+		/* Output */
+		unsigned int DETBufferSizeInKByte[],
+		unsigned int *CompressedBufferSizeInkByte)
+{
+	unsigned int DETBufferSizePoolInKByte;
+	unsigned int NextDETBufferPieceInKByte;
+	bool DETPieceAssignedToThisSurfaceAlready[DC__NUM_DPP__MAX];
+	bool NextPotentialSurfaceToAssignDETPieceFound;
+	unsigned int NextSurfaceToAssignDETPiece;
+	double TotalBandwidth;
+	double BandwidthOfSurfacesNotAssignedDETPiece;
+	unsigned int max_minDET;
+	unsigned int minDET;
+	unsigned int minDET_pipe;
+	unsigned int j, k;
+
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: ForceSingleDPP = %d\n", __func__, ForceSingleDPP);
+	dml_print("DML::%s: nomDETInKByte = %d\n", __func__, nomDETInKByte);
+	dml_print("DML::%s: NumberOfActiveSurfaces = %d\n", __func__, NumberOfActiveSurfaces);
+	dml_print("DML::%s: UnboundedRequestEnabled = %d\n", __func__, UnboundedRequestEnabled);
+	dml_print("DML::%s: MaxTotalDETInKByte = %d\n", __func__, MaxTotalDETInKByte);
+	dml_print("DML::%s: ConfigReturnBufferSizeInKByte = %d\n", __func__, ConfigReturnBufferSizeInKByte);
+	dml_print("DML::%s: MinCompressedBufferSizeInKByte = %d\n", __func__, MinCompressedBufferSizeInKByte);
+	dml_print("DML::%s: CompressedBufferSegmentSizeInkByteFinal = %d\n", __func__,
+			CompressedBufferSegmentSizeInkByteFinal);
+#endif
+
+	// Note: Will use default det size if that fits 2 swaths
+	if (UnboundedRequestEnabled) {
+		if (DETSizeOverride[0] > 0) {
+			DETBufferSizeInKByte[0] = DETSizeOverride[0];
+		} else {
+			DETBufferSizeInKByte[0] = dml_max(nomDETInKByte, dml_ceil(2.0 *
+					((double) RoundedUpMaxSwathSizeBytesY[0] +
+							(double) RoundedUpMaxSwathSizeBytesC[0]) / 1024.0, 64.0));
+		}
+		*CompressedBufferSizeInkByte = ConfigReturnBufferSizeInKByte - DETBufferSizeInKByte[0];
+	} else {
+		DETBufferSizePoolInKByte = MaxTotalDETInKByte;
+		for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+			DETBufferSizeInKByte[k] = nomDETInKByte;
+			if (SourcePixelFormat[k] == dm_420_8 || SourcePixelFormat[k] == dm_420_10 ||
+					SourcePixelFormat[k] == dm_420_12) {
+				max_minDET = nomDETInKByte - 64;
+			} else {
+				max_minDET = nomDETInKByte;
+			}
+			minDET = 128;
+			minDET_pipe = 0;
+
+			// add DET resource until can hold 2 full swaths
+			while (minDET <= max_minDET && minDET_pipe == 0) {
+				if (2.0 * ((double) RoundedUpMaxSwathSizeBytesY[k] +
+						(double) RoundedUpMaxSwathSizeBytesC[k]) / 1024.0 <= minDET)
+					minDET_pipe = minDET;
+				minDET = minDET + 64;
+			}
+
+#ifdef __DML_VBA_DEBUG__
+			dml_print("DML::%s: k=%0d minDET        = %d\n", __func__, k, minDET);
+			dml_print("DML::%s: k=%0d max_minDET    = %d\n", __func__, k, max_minDET);
+			dml_print("DML::%s: k=%0d minDET_pipe   = %d\n", __func__, k, minDET_pipe);
+			dml_print("DML::%s: k=%0d RoundedUpMaxSwathSizeBytesY = %d\n", __func__, k,
+					RoundedUpMaxSwathSizeBytesY[k]);
+			dml_print("DML::%s: k=%0d RoundedUpMaxSwathSizeBytesC = %d\n", __func__, k,
+					RoundedUpMaxSwathSizeBytesC[k]);
+#endif
+
+			if (minDET_pipe == 0) {
+				minDET_pipe = dml_max(128, dml_ceil(((double)RoundedUpMaxSwathSizeBytesY[k] +
+						(double)RoundedUpMaxSwathSizeBytesC[k]) / 1024.0, 64));
+#ifdef __DML_VBA_DEBUG__
+				dml_print("DML::%s: k=%0d minDET_pipe = %d (assume each plane take half DET)\n",
+						__func__, k, minDET_pipe);
+#endif
+			}
+
+			if (UseMALLForPStateChange[k] == dm_use_mall_pstate_change_phantom_pipe) {
+				DETBufferSizeInKByte[k] = 0;
+			} else if (DETSizeOverride[k] > 0) {
+				DETBufferSizeInKByte[k] = DETSizeOverride[k];
+				DETBufferSizePoolInKByte = DETBufferSizePoolInKByte -
+						(ForceSingleDPP ? 1 : DPPPerSurface[k]) * DETSizeOverride[k];
+			} else if ((ForceSingleDPP ? 1 : DPPPerSurface[k]) * minDET_pipe <= DETBufferSizePoolInKByte) {
+				DETBufferSizeInKByte[k] = minDET_pipe;
+				DETBufferSizePoolInKByte = DETBufferSizePoolInKByte -
+						(ForceSingleDPP ? 1 : DPPPerSurface[k]) * minDET_pipe;
+			}
+
+#ifdef __DML_VBA_DEBUG__
+			dml_print("DML::%s: k=%d DPPPerSurface = %d\n", __func__, k, DPPPerSurface[k]);
+			dml_print("DML::%s: k=%d DETSizeOverride = %d\n", __func__, k, DETSizeOverride[k]);
+			dml_print("DML::%s: k=%d DETBufferSizeInKByte = %d\n", __func__, k, DETBufferSizeInKByte[k]);
+			dml_print("DML::%s: DETBufferSizePoolInKByte = %d\n", __func__, DETBufferSizePoolInKByte);
+#endif
+		}
+
+		TotalBandwidth = 0;
+		for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+			if (UseMALLForPStateChange[k] != dm_use_mall_pstate_change_phantom_pipe)
+				TotalBandwidth = TotalBandwidth + ReadBandwidthLuma[k] + ReadBandwidthChroma[k];
+		}
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML::%s: --- Before bandwidth adjustment ---\n", __func__);
+		for (uint k = 0; k < NumberOfActiveSurfaces; ++k)
+			dml_print("DML::%s: k=%d DETBufferSizeInKByte   = %d\n", __func__, k, DETBufferSizeInKByte[k]);
+		dml_print("DML::%s: --- DET allocation with bandwidth ---\n", __func__);
+		dml_print("DML::%s: TotalBandwidth = %f\n", __func__, TotalBandwidth);
+#endif
+		BandwidthOfSurfacesNotAssignedDETPiece = TotalBandwidth;
+		for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+
+			if (UseMALLForPStateChange[k] == dm_use_mall_pstate_change_phantom_pipe) {
+				DETPieceAssignedToThisSurfaceAlready[k] = true;
+			} else if (DETSizeOverride[k] > 0 || (((double) (ForceSingleDPP ? 1 : DPPPerSurface[k]) *
+					(double) DETBufferSizeInKByte[k] / (double) MaxTotalDETInKByte) >=
+					((ReadBandwidthLuma[k] + ReadBandwidthChroma[k]) / TotalBandwidth))) {
+				DETPieceAssignedToThisSurfaceAlready[k] = true;
+				BandwidthOfSurfacesNotAssignedDETPiece = BandwidthOfSurfacesNotAssignedDETPiece -
+						ReadBandwidthLuma[k] - ReadBandwidthChroma[k];
+			} else {
+				DETPieceAssignedToThisSurfaceAlready[k] = false;
+			}
+#ifdef __DML_VBA_DEBUG__
+			dml_print("DML::%s: k=%d DETPieceAssignedToThisSurfaceAlready = %d\n", __func__, k,
+					DETPieceAssignedToThisSurfaceAlready[k]);
+			dml_print("DML::%s: k=%d BandwidthOfSurfacesNotAssignedDETPiece = %f\n", __func__, k,
+					BandwidthOfSurfacesNotAssignedDETPiece);
+#endif
+		}
+
+		for (j = 0; j < NumberOfActiveSurfaces; ++j) {
+			NextPotentialSurfaceToAssignDETPieceFound = false;
+			NextSurfaceToAssignDETPiece = 0;
+
+			for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+#ifdef __DML_VBA_DEBUG__
+				dml_print("DML::%s: j=%d k=%d, ReadBandwidthLuma[k] = %f\n", __func__, j, k,
+						ReadBandwidthLuma[k]);
+				dml_print("DML::%s: j=%d k=%d, ReadBandwidthChroma[k] = %f\n", __func__, j, k,
+						ReadBandwidthChroma[k]);
+				dml_print("DML::%s: j=%d k=%d, ReadBandwidthLuma[Next] = %f\n", __func__, j, k,
+						ReadBandwidthLuma[NextSurfaceToAssignDETPiece]);
+				dml_print("DML::%s: j=%d k=%d, ReadBandwidthChroma[Next] = %f\n", __func__, j, k,
+						ReadBandwidthChroma[NextSurfaceToAssignDETPiece]);
+				dml_print("DML::%s: j=%d k=%d, NextSurfaceToAssignDETPiece = %d\n", __func__, j, k,
+						NextSurfaceToAssignDETPiece);
+#endif
+				if (!DETPieceAssignedToThisSurfaceAlready[k] &&
+						(!NextPotentialSurfaceToAssignDETPieceFound ||
+						ReadBandwidthLuma[k] + ReadBandwidthChroma[k] <
+						ReadBandwidthLuma[NextSurfaceToAssignDETPiece] +
+						ReadBandwidthChroma[NextSurfaceToAssignDETPiece])) {
+					NextSurfaceToAssignDETPiece = k;
+					NextPotentialSurfaceToAssignDETPieceFound = true;
+				}
+#ifdef __DML_VBA_DEBUG__
+				dml_print("DML::%s: j=%d k=%d, DETPieceAssignedToThisSurfaceAlready = %d\n",
+						__func__, j, k, DETPieceAssignedToThisSurfaceAlready[k]);
+				dml_print("DML::%s: j=%d k=%d, NextPotentialSurfaceToAssignDETPieceFound = %d\n",
+						__func__, j, k, NextPotentialSurfaceToAssignDETPieceFound);
+#endif
+			}
+
+			if (NextPotentialSurfaceToAssignDETPieceFound) {
+				// Note: To show the banker's rounding behavior in VBA and also the fact
+				// that the DET buffer size varies due to precision issue
+				//
+				//double tmp1 =  ((double) DETBufferSizePoolInKByte *
+				// (ReadBandwidthLuma[NextSurfaceToAssignDETPiece] +
+				// ReadBandwidthChroma[NextSurfaceToAssignDETPiece]) /
+				// BandwidthOfSurfacesNotAssignedDETPiece /
+				// ((ForceSingleDPP ? 1 : DPPPerSurface[NextSurfaceToAssignDETPiece]) * 64.0));
+				//double tmp2 =  dml_round((double) DETBufferSizePoolInKByte *
+				// (ReadBandwidthLuma[NextSurfaceToAssignDETPiece] +
+				// ReadBandwidthChroma[NextSurfaceToAssignDETPiece]) /
+				 //BandwidthOfSurfacesNotAssignedDETPiece /
+				// ((ForceSingleDPP ? 1 : DPPPerSurface[NextSurfaceToAssignDETPiece]) * 64.0));
+				//
+				//dml_print("DML::%s: j=%d, tmp1 = %f\n", __func__, j, tmp1);
+				//dml_print("DML::%s: j=%d, tmp2 = %f\n", __func__, j, tmp2);
+
+				NextDETBufferPieceInKByte = dml_min(
+					dml_round((double) DETBufferSizePoolInKByte *
+						(ReadBandwidthLuma[NextSurfaceToAssignDETPiece] +
+						ReadBandwidthChroma[NextSurfaceToAssignDETPiece]) /
+						BandwidthOfSurfacesNotAssignedDETPiece /
+						((ForceSingleDPP ? 1 :
+								DPPPerSurface[NextSurfaceToAssignDETPiece]) * 64.0)) *
+						(ForceSingleDPP ? 1 :
+								DPPPerSurface[NextSurfaceToAssignDETPiece]) * 64.0,
+						dml_floor((double) DETBufferSizePoolInKByte,
+						(ForceSingleDPP ? 1 :
+								DPPPerSurface[NextSurfaceToAssignDETPiece]) * 64.0));
+
+				// Above calculation can assign the entire DET buffer allocation to a single pipe.
+				// We should limit the per-pipe DET size to the nominal / max per pipe.
+				if (NextDETBufferPieceInKByte > nomDETInKByte * (ForceSingleDPP ? 1 : DPPPerSurface[k])) {
+					if (DETBufferSizeInKByte[NextSurfaceToAssignDETPiece] <
+							nomDETInKByte * (ForceSingleDPP ? 1 : DPPPerSurface[k])) {
+						NextDETBufferPieceInKByte = nomDETInKByte * (ForceSingleDPP ? 1 : DPPPerSurface[k]) -
+								DETBufferSizeInKByte[NextSurfaceToAssignDETPiece];
+					} else {
+						// Case where DETBufferSizeInKByte[NextSurfaceToAssignDETPiece]
+						// already has the max per-pipe value
+						NextDETBufferPieceInKByte = 0;
+					}
+				}
+
+#ifdef __DML_VBA_DEBUG__
+				dml_print("DML::%s: j=%0d, DETBufferSizePoolInKByte = %d\n", __func__, j,
+					DETBufferSizePoolInKByte);
+				dml_print("DML::%s: j=%0d, NextSurfaceToAssignDETPiece = %d\n", __func__, j,
+					NextSurfaceToAssignDETPiece);
+				dml_print("DML::%s: j=%0d, ReadBandwidthLuma[%0d] = %f\n", __func__, j,
+					NextSurfaceToAssignDETPiece, ReadBandwidthLuma[NextSurfaceToAssignDETPiece]);
+				dml_print("DML::%s: j=%0d, ReadBandwidthChroma[%0d] = %f\n", __func__, j,
+					NextSurfaceToAssignDETPiece, ReadBandwidthChroma[NextSurfaceToAssignDETPiece]);
+				dml_print("DML::%s: j=%0d, BandwidthOfSurfacesNotAssignedDETPiece = %f\n",
+					__func__, j, BandwidthOfSurfacesNotAssignedDETPiece);
+				dml_print("DML::%s: j=%0d, NextDETBufferPieceInKByte = %d\n", __func__, j,
+					NextDETBufferPieceInKByte);
+				dml_print("DML::%s: j=%0d, DETBufferSizeInKByte[%0d] increases from %0d ",
+					__func__, j, NextSurfaceToAssignDETPiece,
+					DETBufferSizeInKByte[NextSurfaceToAssignDETPiece]);
+#endif
+
+				DETBufferSizeInKByte[NextSurfaceToAssignDETPiece] =
+						DETBufferSizeInKByte[NextSurfaceToAssignDETPiece]
+						+ NextDETBufferPieceInKByte
+						/ (ForceSingleDPP ? 1 : DPPPerSurface[NextSurfaceToAssignDETPiece]);
+#ifdef __DML_VBA_DEBUG__
+				dml_print("to %0d\n", DETBufferSizeInKByte[NextSurfaceToAssignDETPiece]);
+#endif
+
+				DETBufferSizePoolInKByte = DETBufferSizePoolInKByte - NextDETBufferPieceInKByte;
+				DETPieceAssignedToThisSurfaceAlready[NextSurfaceToAssignDETPiece] = true;
+				BandwidthOfSurfacesNotAssignedDETPiece = BandwidthOfSurfacesNotAssignedDETPiece -
+						(ReadBandwidthLuma[NextSurfaceToAssignDETPiece] +
+								ReadBandwidthChroma[NextSurfaceToAssignDETPiece]);
+			}
+		}
+		*CompressedBufferSizeInkByte = MinCompressedBufferSizeInKByte;
+	}
+	*CompressedBufferSizeInkByte = *CompressedBufferSizeInkByte * CompressedBufferSegmentSizeInkByteFinal / 64;
+
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: --- After bandwidth adjustment ---\n", __func__);
+	dml_print("DML::%s: CompressedBufferSizeInkByte = %d\n", __func__, *CompressedBufferSizeInkByte);
+	for (uint k = 0; k < NumberOfActiveSurfaces; ++k) {
+		dml_print("DML::%s: k=%d DETBufferSizeInKByte = %d (TotalReadBandWidth=%f)\n",
+				__func__, k, DETBufferSizeInKByte[k], ReadBandwidthLuma[k] + ReadBandwidthChroma[k]);
+	}
+#endif
+} // CalculateDETBufferSize
+
+void dml32_CalculateODMMode(
+		unsigned int MaximumPixelsPerLinePerDSCUnit,
+		unsigned int HActive,
+		enum output_encoder_class Output,
+		enum odm_combine_policy ODMUse,
+		double StateDispclk,
+		double MaxDispclk,
+		bool DSCEnable,
+		unsigned int TotalNumberOfActiveDPP,
+		unsigned int MaxNumDPP,
+		double PixelClock,
+		double DISPCLKDPPCLKDSCCLKDownSpreading,
+		double DISPCLKRampingMargin,
+		double DISPCLKDPPCLKVCOSpeed,
+
+		/* Output */
+		bool *TotalAvailablePipesSupport,
+		unsigned int *NumberOfDPP,
+		enum odm_combine_mode *ODMMode,
+		double *RequiredDISPCLKPerSurface)
+{
+
+	double SurfaceRequiredDISPCLKWithoutODMCombine;
+	double SurfaceRequiredDISPCLKWithODMCombineTwoToOne;
+	double SurfaceRequiredDISPCLKWithODMCombineFourToOne;
+
+	SurfaceRequiredDISPCLKWithoutODMCombine = dml32_CalculateRequiredDispclk(dm_odm_combine_mode_disabled,
+			PixelClock, DISPCLKDPPCLKDSCCLKDownSpreading, DISPCLKRampingMargin, DISPCLKDPPCLKVCOSpeed,
+			MaxDispclk);
+	SurfaceRequiredDISPCLKWithODMCombineTwoToOne = dml32_CalculateRequiredDispclk(dm_odm_combine_mode_2to1,
+			PixelClock, DISPCLKDPPCLKDSCCLKDownSpreading, DISPCLKRampingMargin, DISPCLKDPPCLKVCOSpeed,
+			MaxDispclk);
+	SurfaceRequiredDISPCLKWithODMCombineFourToOne = dml32_CalculateRequiredDispclk(dm_odm_combine_mode_4to1,
+			PixelClock, DISPCLKDPPCLKDSCCLKDownSpreading, DISPCLKRampingMargin, DISPCLKDPPCLKVCOSpeed,
+			MaxDispclk);
+	*TotalAvailablePipesSupport = true;
+	*ODMMode = dm_odm_combine_mode_disabled; // initialize as disable
+
+	if (ODMUse == dm_odm_combine_policy_none)
+		*ODMMode = dm_odm_combine_mode_disabled;
+
+	*RequiredDISPCLKPerSurface = SurfaceRequiredDISPCLKWithoutODMCombine;
+	*NumberOfDPP = 0;
+
+	// FIXME check ODMUse == "" condition does it mean bypass or Gabriel means something like don't care??
+	// (ODMUse == "" || ODMUse == "CombineAsNeeded")
+
+	if (!(Output == dm_hdmi || Output == dm_dp || Output == dm_edp) && (ODMUse == dm_odm_combine_policy_4to1 ||
+			((SurfaceRequiredDISPCLKWithODMCombineTwoToOne > StateDispclk ||
+					(DSCEnable && (HActive > 2 * MaximumPixelsPerLinePerDSCUnit)))))) {
+		if (TotalNumberOfActiveDPP + 4 <= MaxNumDPP) {
+			*ODMMode = dm_odm_combine_mode_4to1;
+			*RequiredDISPCLKPerSurface = SurfaceRequiredDISPCLKWithODMCombineFourToOne;
+			*NumberOfDPP = 4;
+		} else {
+			*TotalAvailablePipesSupport = false;
+		}
+	} else if (Output != dm_hdmi && (ODMUse == dm_odm_combine_policy_2to1 ||
+			(((SurfaceRequiredDISPCLKWithoutODMCombine > StateDispclk &&
+					SurfaceRequiredDISPCLKWithODMCombineTwoToOne <= StateDispclk) ||
+					(DSCEnable && (HActive > MaximumPixelsPerLinePerDSCUnit)))))) {
+		if (TotalNumberOfActiveDPP + 2 <= MaxNumDPP) {
+			*ODMMode = dm_odm_combine_mode_2to1;
+			*RequiredDISPCLKPerSurface = SurfaceRequiredDISPCLKWithODMCombineTwoToOne;
+			*NumberOfDPP = 2;
+		} else {
+			*TotalAvailablePipesSupport = false;
+		}
+	} else {
+		if (TotalNumberOfActiveDPP + 1 <= MaxNumDPP)
+			*NumberOfDPP = 1;
+		else
+			*TotalAvailablePipesSupport = false;
+	}
+}
+
+double dml32_CalculateRequiredDispclk(
+		enum odm_combine_mode ODMMode,
+		double PixelClock,
+		double DISPCLKDPPCLKDSCCLKDownSpreading,
+		double DISPCLKRampingMargin,
+		double DISPCLKDPPCLKVCOSpeed,
+		double MaxDispclk)
+{
+	double RequiredDispclk = 0.;
+	double PixelClockAfterODM;
+	double DISPCLKWithRampingRoundedToDFSGranularity;
+	double DISPCLKWithoutRampingRoundedToDFSGranularity;
+	double MaxDispclkRoundedDownToDFSGranularity;
+
+	if (ODMMode == dm_odm_combine_mode_4to1)
+		PixelClockAfterODM = PixelClock / 4;
+	else if (ODMMode == dm_odm_combine_mode_2to1)
+		PixelClockAfterODM = PixelClock / 2;
+	else
+		PixelClockAfterODM = PixelClock;
+
+
+	DISPCLKWithRampingRoundedToDFSGranularity = dml32_RoundToDFSGranularity(
+			PixelClockAfterODM * (1 + DISPCLKDPPCLKDSCCLKDownSpreading / 100)
+					* (1 + DISPCLKRampingMargin / 100), 1, DISPCLKDPPCLKVCOSpeed);
+
+	DISPCLKWithoutRampingRoundedToDFSGranularity = dml32_RoundToDFSGranularity(
+			PixelClockAfterODM * (1 + DISPCLKDPPCLKDSCCLKDownSpreading / 100), 1, DISPCLKDPPCLKVCOSpeed);
+
+	MaxDispclkRoundedDownToDFSGranularity = dml32_RoundToDFSGranularity(MaxDispclk, 0, DISPCLKDPPCLKVCOSpeed);
+
+	if (DISPCLKWithoutRampingRoundedToDFSGranularity > MaxDispclkRoundedDownToDFSGranularity)
+		RequiredDispclk = DISPCLKWithoutRampingRoundedToDFSGranularity;
+	else if (DISPCLKWithRampingRoundedToDFSGranularity > MaxDispclkRoundedDownToDFSGranularity)
+		RequiredDispclk = MaxDispclkRoundedDownToDFSGranularity;
+	else
+		RequiredDispclk = DISPCLKWithRampingRoundedToDFSGranularity;
+
+	return RequiredDispclk;
+}
+
+double dml32_RoundToDFSGranularity(double Clock, bool round_up, double VCOSpeed)
+{
+	if (Clock <= 0.0)
+		return 0.0;
+
+	if (round_up)
+		return VCOSpeed * 4.0 / dml_floor(VCOSpeed * 4.0 / Clock, 1.0);
+	else
+		return VCOSpeed * 4.0 / dml_ceil(VCOSpeed * 4.0 / Clock, 1.0);
+}
+
+void dml32_CalculateOutputLink(
+		double PHYCLKPerState,
+		double PHYCLKD18PerState,
+		double PHYCLKD32PerState,
+		double Downspreading,
+		bool IsMainSurfaceUsingTheIndicatedTiming,
+		enum output_encoder_class Output,
+		enum output_format_class OutputFormat,
+		unsigned int HTotal,
+		unsigned int HActive,
+		double PixelClockBackEnd,
+		double ForcedOutputLinkBPP,
+		unsigned int DSCInputBitPerComponent,
+		unsigned int NumberOfDSCSlices,
+		double AudioSampleRate,
+		unsigned int AudioSampleLayout,
+		enum odm_combine_mode ODMModeNoDSC,
+		enum odm_combine_mode ODMModeDSC,
+		bool DSCEnable,
+		unsigned int OutputLinkDPLanes,
+		enum dm_output_link_dp_rate OutputLinkDPRate,
+
+		/* Output */
+		bool *RequiresDSC,
+		double *RequiresFEC,
+		double  *OutBpp,
+		enum dm_output_type *OutputType,
+		enum dm_output_rate *OutputRate,
+		unsigned int *RequiredSlots)
+{
+	bool LinkDSCEnable;
+	unsigned int dummy;
+	*RequiresDSC = false;
+	*RequiresFEC = false;
+	*OutBpp = 0;
+	*OutputType = dm_output_type_unknown;
+	*OutputRate = dm_output_rate_unknown;
+
+	if (IsMainSurfaceUsingTheIndicatedTiming) {
+		if (Output == dm_hdmi) {
+			*RequiresDSC = false;
+			*RequiresFEC = false;
+			*OutBpp = dml32_TruncToValidBPP(dml_min(600, PHYCLKPerState) * 10, 3, HTotal, HActive,
+					PixelClockBackEnd, ForcedOutputLinkBPP, false, Output, OutputFormat,
+					DSCInputBitPerComponent, NumberOfDSCSlices, AudioSampleRate, AudioSampleLayout,
+					ODMModeNoDSC, ODMModeDSC, &dummy);
+			//OutputTypeAndRate = "HDMI";
+			*OutputType = dm_output_type_hdmi;
+
+		} else if (Output == dm_dp || Output == dm_dp2p0 || Output == dm_edp) {
+			if (DSCEnable == true) {
+				*RequiresDSC = true;
+				LinkDSCEnable = true;
+				if (Output == dm_dp || Output == dm_dp2p0)
+					*RequiresFEC = true;
+				else
+					*RequiresFEC = false;
+			} else {
+				*RequiresDSC = false;
+				LinkDSCEnable = false;
+				if (Output == dm_dp2p0)
+					*RequiresFEC = true;
+				else
+					*RequiresFEC = false;
+			}
+			if (Output == dm_dp2p0) {
+				*OutBpp = 0;
+				if ((OutputLinkDPRate == dm_dp_rate_na || OutputLinkDPRate == dm_dp_rate_uhbr10) &&
+						PHYCLKD32PerState >= 10000 / 32) {
+					*OutBpp = dml32_TruncToValidBPP((1 - Downspreading / 100) * 10000,
+							OutputLinkDPLanes, HTotal, HActive, PixelClockBackEnd,
+							ForcedOutputLinkBPP, LinkDSCEnable, Output, OutputFormat,
+							DSCInputBitPerComponent, NumberOfDSCSlices, AudioSampleRate,
+							AudioSampleLayout, ODMModeNoDSC, ODMModeDSC, RequiredSlots);
+					if (*OutBpp == 0 && PHYCLKD32PerState < 13500 / 32 && DSCEnable == true &&
+							ForcedOutputLinkBPP == 0) {
+						*RequiresDSC = true;
+						LinkDSCEnable = true;
+						*OutBpp = dml32_TruncToValidBPP((1 - Downspreading / 100) * 10000,
+								OutputLinkDPLanes, HTotal, HActive, PixelClockBackEnd,
+								ForcedOutputLinkBPP, LinkDSCEnable, Output,
+								OutputFormat, DSCInputBitPerComponent,
+								NumberOfDSCSlices, AudioSampleRate, AudioSampleLayout,
+								ODMModeNoDSC, ODMModeDSC, RequiredSlots);
+					}
+					//OutputTypeAndRate = Output & " UHBR10";
+					*OutputType = dm_output_type_dp2p0;
+					*OutputRate = dm_output_rate_dp_rate_uhbr10;
+				}
+				if ((OutputLinkDPRate == dm_dp_rate_na || OutputLinkDPRate == dm_dp_rate_uhbr13p5) &&
+						*OutBpp == 0 && PHYCLKD32PerState >= 13500 / 32) {
+					*OutBpp = dml32_TruncToValidBPP((1 - Downspreading / 100) * 13500,
+							OutputLinkDPLanes, HTotal, HActive, PixelClockBackEnd,
+							ForcedOutputLinkBPP, LinkDSCEnable, Output, OutputFormat,
+							DSCInputBitPerComponent, NumberOfDSCSlices, AudioSampleRate,
+							AudioSampleLayout, ODMModeNoDSC, ODMModeDSC, RequiredSlots);
+
+					if (*OutBpp == 0 && PHYCLKD32PerState < 20000 / 32 && DSCEnable == true &&
+							ForcedOutputLinkBPP == 0) {
+						*RequiresDSC = true;
+						LinkDSCEnable = true;
+						*OutBpp = dml32_TruncToValidBPP((1 - Downspreading / 100) * 13500,
+								OutputLinkDPLanes, HTotal, HActive, PixelClockBackEnd,
+								ForcedOutputLinkBPP, LinkDSCEnable, Output,
+								OutputFormat, DSCInputBitPerComponent,
+								NumberOfDSCSlices, AudioSampleRate, AudioSampleLayout,
+								ODMModeNoDSC, ODMModeDSC, RequiredSlots);
+					}
+					//OutputTypeAndRate = Output & " UHBR13p5";
+					*OutputType = dm_output_type_dp2p0;
+					*OutputRate = dm_output_rate_dp_rate_uhbr13p5;
+				}
+				if ((OutputLinkDPRate == dm_dp_rate_na || OutputLinkDPRate == dm_dp_rate_uhbr20) &&
+						*OutBpp == 0 && PHYCLKD32PerState >= 20000 / 32) {
+					*OutBpp = dml32_TruncToValidBPP((1 - Downspreading / 100) * 20000,
+							OutputLinkDPLanes, HTotal, HActive, PixelClockBackEnd,
+							ForcedOutputLinkBPP, LinkDSCEnable, Output, OutputFormat,
+							DSCInputBitPerComponent, NumberOfDSCSlices, AudioSampleRate,
+							AudioSampleLayout, ODMModeNoDSC, ODMModeDSC, RequiredSlots);
+					if (*OutBpp == 0 && DSCEnable == true && ForcedOutputLinkBPP == 0) {
+						*RequiresDSC = true;
+						LinkDSCEnable = true;
+						*OutBpp = dml32_TruncToValidBPP((1 - Downspreading / 100) * 20000,
+								OutputLinkDPLanes, HTotal, HActive, PixelClockBackEnd,
+								ForcedOutputLinkBPP, LinkDSCEnable, Output,
+								OutputFormat, DSCInputBitPerComponent,
+								NumberOfDSCSlices, AudioSampleRate, AudioSampleLayout,
+								ODMModeNoDSC, ODMModeDSC, RequiredSlots);
+					}
+					//OutputTypeAndRate = Output & " UHBR20";
+					*OutputType = dm_output_type_dp2p0;
+					*OutputRate = dm_output_rate_dp_rate_uhbr20;
+				}
+			} else {
+				*OutBpp = 0;
+				if ((OutputLinkDPRate == dm_dp_rate_na || OutputLinkDPRate == dm_dp_rate_hbr) &&
+						PHYCLKPerState >= 270) {
+					*OutBpp = dml32_TruncToValidBPP((1 - Downspreading / 100) * 2700,
+							OutputLinkDPLanes, HTotal, HActive, PixelClockBackEnd,
+							ForcedOutputLinkBPP, LinkDSCEnable, Output, OutputFormat,
+							DSCInputBitPerComponent, NumberOfDSCSlices, AudioSampleRate,
+							AudioSampleLayout, ODMModeNoDSC, ODMModeDSC, RequiredSlots);
+					if (*OutBpp == 0 && PHYCLKPerState < 540 && DSCEnable == true &&
+							ForcedOutputLinkBPP == 0) {
+						*RequiresDSC = true;
+						LinkDSCEnable = true;
+						if (Output == dm_dp)
+							*RequiresFEC = true;
+						*OutBpp = dml32_TruncToValidBPP((1 - Downspreading / 100) * 2700,
+								OutputLinkDPLanes, HTotal, HActive, PixelClockBackEnd,
+								ForcedOutputLinkBPP, LinkDSCEnable, Output,
+								OutputFormat, DSCInputBitPerComponent,
+								NumberOfDSCSlices, AudioSampleRate, AudioSampleLayout,
+								ODMModeNoDSC, ODMModeDSC, RequiredSlots);
+					}
+					//OutputTypeAndRate = Output & " HBR";
+					*OutputType = (Output == dm_dp) ? dm_output_type_dp : dm_output_type_edp;
+					*OutputRate = dm_output_rate_dp_rate_hbr;
+				}
+				if ((OutputLinkDPRate == dm_dp_rate_na || OutputLinkDPRate == dm_dp_rate_hbr2) &&
+						*OutBpp == 0 && PHYCLKPerState >= 540) {
+					*OutBpp = dml32_TruncToValidBPP((1 - Downspreading / 100) * 5400,
+							OutputLinkDPLanes, HTotal, HActive, PixelClockBackEnd,
+							ForcedOutputLinkBPP, LinkDSCEnable, Output, OutputFormat,
+							DSCInputBitPerComponent, NumberOfDSCSlices, AudioSampleRate,
+							AudioSampleLayout, ODMModeNoDSC, ODMModeDSC, RequiredSlots);
+
+					if (*OutBpp == 0 && PHYCLKPerState < 810 && DSCEnable == true &&
+							ForcedOutputLinkBPP == 0) {
+						*RequiresDSC = true;
+						LinkDSCEnable = true;
+						if (Output == dm_dp)
+							*RequiresFEC = true;
+
+						*OutBpp = dml32_TruncToValidBPP((1 - Downspreading / 100) * 5400,
+								OutputLinkDPLanes, HTotal, HActive, PixelClockBackEnd,
+								ForcedOutputLinkBPP, LinkDSCEnable, Output,
+								OutputFormat, DSCInputBitPerComponent,
+								NumberOfDSCSlices, AudioSampleRate, AudioSampleLayout,
+								ODMModeNoDSC, ODMModeDSC, RequiredSlots);
+					}
+					//OutputTypeAndRate = Output & " HBR2";
+					*OutputType = (Output == dm_dp) ? dm_output_type_dp : dm_output_type_edp;
+					*OutputRate = dm_output_rate_dp_rate_hbr2;
+				}
+				if ((OutputLinkDPRate == dm_dp_rate_na || OutputLinkDPRate == dm_dp_rate_hbr3) && *OutBpp == 0 && PHYCLKPerState >= 810) {
+					*OutBpp = dml32_TruncToValidBPP((1 - Downspreading / 100) * 8100,
+							OutputLinkDPLanes, HTotal, HActive, PixelClockBackEnd,
+							ForcedOutputLinkBPP, LinkDSCEnable, Output,
+							OutputFormat, DSCInputBitPerComponent, NumberOfDSCSlices,
+							AudioSampleRate, AudioSampleLayout, ODMModeNoDSC, ODMModeDSC,
+							RequiredSlots);
+
+					if (*OutBpp == 0 && DSCEnable == true && ForcedOutputLinkBPP == 0) {
+						*RequiresDSC = true;
+						LinkDSCEnable = true;
+						if (Output == dm_dp)
+							*RequiresFEC = true;
+
+						*OutBpp = dml32_TruncToValidBPP((1 - Downspreading / 100) * 8100,
+								OutputLinkDPLanes, HTotal, HActive, PixelClockBackEnd,
+								ForcedOutputLinkBPP, LinkDSCEnable, Output,
+								OutputFormat, DSCInputBitPerComponent,
+								NumberOfDSCSlices, AudioSampleRate, AudioSampleLayout,
+								ODMModeNoDSC, ODMModeDSC, RequiredSlots);
+					}
+					//OutputTypeAndRate = Output & " HBR3";
+					*OutputType = (Output == dm_dp) ? dm_output_type_dp : dm_output_type_edp;
+					*OutputRate = dm_output_rate_dp_rate_hbr3;
+				}
+			}
+		}
+	}
+}
+
+void dml32_CalculateDPPCLK(
+		unsigned int NumberOfActiveSurfaces,
+		double DISPCLKDPPCLKDSCCLKDownSpreading,
+		double DISPCLKDPPCLKVCOSpeed,
+		double DPPCLKUsingSingleDPP[],
+		unsigned int DPPPerSurface[],
+
+		/* output */
+		double *GlobalDPPCLK,
+		double Dppclk[])
+{
+	unsigned int k;
+	*GlobalDPPCLK = 0;
+	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+		Dppclk[k] = DPPCLKUsingSingleDPP[k] / DPPPerSurface[k] * (1 + DISPCLKDPPCLKDSCCLKDownSpreading / 100);
+		*GlobalDPPCLK = dml_max(*GlobalDPPCLK, Dppclk[k]);
+	}
+	*GlobalDPPCLK = dml32_RoundToDFSGranularity(*GlobalDPPCLK, 1, DISPCLKDPPCLKVCOSpeed);
+	for (k = 0; k < NumberOfActiveSurfaces; ++k)
+		Dppclk[k] = *GlobalDPPCLK / 255 * dml_ceil(Dppclk[k] * 255.0 / *GlobalDPPCLK, 1.0);
+}
+
+double dml32_TruncToValidBPP(
+		double LinkBitRate,
+		unsigned int Lanes,
+		unsigned int HTotal,
+		unsigned int HActive,
+		double PixelClock,
+		double DesiredBPP,
+		bool DSCEnable,
+		enum output_encoder_class Output,
+		enum output_format_class Format,
+		unsigned int DSCInputBitPerComponent,
+		unsigned int DSCSlices,
+		unsigned int AudioRate,
+		unsigned int AudioLayout,
+		enum odm_combine_mode ODMModeNoDSC,
+		enum odm_combine_mode ODMModeDSC,
+		/* Output */
+		unsigned int *RequiredSlots)
+{
+	double    MaxLinkBPP;
+	unsigned int   MinDSCBPP;
+	double    MaxDSCBPP;
+	unsigned int   NonDSCBPP0;
+	unsigned int   NonDSCBPP1;
+	unsigned int   NonDSCBPP2;
+	unsigned int   NonDSCBPP3;
+
+	if (Format == dm_420) {
+		NonDSCBPP0 = 12;
+		NonDSCBPP1 = 15;
+		NonDSCBPP2 = 18;
+		MinDSCBPP = 6;
+		MaxDSCBPP = 1.5 * DSCInputBitPerComponent - 1 / 16;
+	} else if (Format == dm_444) {
+		NonDSCBPP0 = 18;
+		NonDSCBPP1 = 24;
+		NonDSCBPP2 = 30;
+		NonDSCBPP3 = 36;
+		MinDSCBPP = 8;
+		MaxDSCBPP = 3 * DSCInputBitPerComponent - 1.0 / 16;
+	} else {
+		if (Output == dm_hdmi) {
+			NonDSCBPP0 = 24;
+			NonDSCBPP1 = 24;
+			NonDSCBPP2 = 24;
+		} else {
+			NonDSCBPP0 = 16;
+			NonDSCBPP1 = 20;
+			NonDSCBPP2 = 24;
+		}
+		if (Format == dm_n422) {
+			MinDSCBPP = 7;
+			MaxDSCBPP = 2 * DSCInputBitPerComponent - 1.0 / 16.0;
+		} else {
+			MinDSCBPP = 8;
+			MaxDSCBPP = 3 * DSCInputBitPerComponent - 1.0 / 16.0;
+		}
+	}
+	if (Output == dm_dp2p0) {
+		MaxLinkBPP = LinkBitRate * Lanes / PixelClock * 128 / 132 * 383 / 384 * 65536 / 65540;
+	} else if (DSCEnable && Output == dm_dp) {
+		MaxLinkBPP = LinkBitRate / 10 * 8 * Lanes / PixelClock * (1 - 2.4 / 100);
+	} else {
+		MaxLinkBPP = LinkBitRate / 10 * 8 * Lanes / PixelClock;
+	}
+
+	if (DSCEnable) {
+		if (ODMModeDSC == dm_odm_combine_mode_4to1)
+			MaxLinkBPP = dml_min(MaxLinkBPP, 16);
+		else if (ODMModeDSC == dm_odm_combine_mode_2to1)
+			MaxLinkBPP = dml_min(MaxLinkBPP, 32);
+		else if (ODMModeDSC == dm_odm_split_mode_1to2)
+			MaxLinkBPP = 2 * MaxLinkBPP;
+	} else {
+		if (ODMModeNoDSC == dm_odm_combine_mode_4to1)
+			MaxLinkBPP = dml_min(MaxLinkBPP, 16);
+		else if (ODMModeNoDSC == dm_odm_combine_mode_2to1)
+			MaxLinkBPP = dml_min(MaxLinkBPP, 32);
+		else if (ODMModeNoDSC == dm_odm_split_mode_1to2)
+			MaxLinkBPP = 2 * MaxLinkBPP;
+	}
+
+	if (DesiredBPP == 0) {
+		if (DSCEnable) {
+			if (MaxLinkBPP < MinDSCBPP)
+				return BPP_INVALID;
+			else if (MaxLinkBPP >= MaxDSCBPP)
+				return MaxDSCBPP;
+			else
+				return dml_floor(16.0 * MaxLinkBPP, 1.0) / 16.0;
+		} else {
+			if (MaxLinkBPP >= NonDSCBPP3)
+				return NonDSCBPP3;
+			else if (MaxLinkBPP >= NonDSCBPP2)
+				return NonDSCBPP2;
+			else if (MaxLinkBPP >= NonDSCBPP1)
+				return NonDSCBPP1;
+			else if (MaxLinkBPP >= NonDSCBPP0)
+				return 16.0;
+			else
+				return BPP_INVALID;
+		}
+	} else {
+		if (!((DSCEnable == false && (DesiredBPP == NonDSCBPP2 || DesiredBPP == NonDSCBPP1 ||
+				DesiredBPP == NonDSCBPP0 || DesiredBPP == NonDSCBPP3)) ||
+				(DSCEnable && DesiredBPP >= MinDSCBPP && DesiredBPP <= MaxDSCBPP)))
+			return BPP_INVALID;
+		else
+			return DesiredBPP;
+	}
+
+	*RequiredSlots = dml_ceil(DesiredBPP / MaxLinkBPP * 64, 1);
+
+	return BPP_INVALID;
+} // TruncToValidBPP
+
+double dml32_RequiredDTBCLK(
+		bool              DSCEnable,
+		double               PixelClock,
+		enum output_format_class  OutputFormat,
+		double               OutputBpp,
+		unsigned int              DSCSlices,
+		unsigned int                 HTotal,
+		unsigned int                 HActive,
+		unsigned int              AudioRate,
+		unsigned int              AudioLayout)
+{
+	double PixelWordRate = PixelClock /  (OutputFormat == dm_444 ? 1 : 2);
+	double HCActive = dml_ceil(DSCSlices * dml_ceil(OutputBpp *
+			dml_ceil(HActive / DSCSlices, 1) / 8.0, 1) / 3.0, 1);
+	double HCBlank = 64 + 32 *
+			dml_ceil(AudioRate *  (AudioLayout == 1 ? 1 : 0.25) * HTotal / (PixelClock * 1000), 1);
+	double AverageTribyteRate = PixelWordRate * (HCActive + HCBlank) / HTotal;
+	double HActiveTribyteRate = PixelWordRate * HCActive / HActive;
+
+	if (DSCEnable != true)
+		return dml_max(PixelClock / 4.0 * OutputBpp / 24.0, 25.0);
+
+	return dml_max4(PixelWordRate / 4.0, AverageTribyteRate / 4.0, HActiveTribyteRate / 4.0, 25.0) * 1.002;
+}
+
+unsigned int dml32_DSCDelayRequirement(bool DSCEnabled,
+		enum odm_combine_mode ODMMode,
+		unsigned int DSCInputBitPerComponent,
+		double OutputBpp,
+		unsigned int HActive,
+		unsigned int HTotal,
+		unsigned int NumberOfDSCSlices,
+		enum output_format_class  OutputFormat,
+		enum output_encoder_class Output,
+		double PixelClock,
+		double PixelClockBackEnd)
+{
+	unsigned int DSCDelayRequirement_val;
+
+	if (DSCEnabled == true && OutputBpp != 0) {
+		if (ODMMode == dm_odm_combine_mode_4to1) {
+			DSCDelayRequirement_val = 4 * (dml32_dscceComputeDelay(DSCInputBitPerComponent, OutputBpp,
+					dml_ceil(HActive / NumberOfDSCSlices, 1), NumberOfDSCSlices / 4,
+					OutputFormat, Output) + dml32_dscComputeDelay(OutputFormat, Output));
+		} else if (ODMMode == dm_odm_combine_mode_2to1) {
+			DSCDelayRequirement_val = 2 * (dml32_dscceComputeDelay(DSCInputBitPerComponent, OutputBpp,
+					dml_ceil(HActive / NumberOfDSCSlices, 1), NumberOfDSCSlices / 2,
+					OutputFormat, Output) + dml32_dscComputeDelay(OutputFormat, Output));
+		} else {
+			DSCDelayRequirement_val = dml32_dscceComputeDelay(DSCInputBitPerComponent, OutputBpp,
+					dml_ceil(HActive / NumberOfDSCSlices, 1), NumberOfDSCSlices,
+					OutputFormat, Output) + dml32_dscComputeDelay(OutputFormat, Output);
+		}
+
+		DSCDelayRequirement_val = DSCDelayRequirement_val + (HTotal - HActive) *
+				dml_ceil(DSCDelayRequirement_val / HActive, 1);
+
+		DSCDelayRequirement_val = DSCDelayRequirement_val * PixelClock / PixelClockBackEnd;
+
+	} else {
+		DSCDelayRequirement_val = 0;
+	}
+
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: DSCEnabled              = %d\n", __func__, DSCEnabled);
+	dml_print("DML::%s: OutputBpp               = %f\n", __func__, OutputBpp);
+	dml_print("DML::%s: HActive                 = %d\n", __func__, HActive);
+	dml_print("DML::%s: OutputFormat            = %d\n", __func__, OutputFormat);
+	dml_print("DML::%s: DSCInputBitPerComponent = %d\n", __func__, DSCInputBitPerComponent);
+	dml_print("DML::%s: NumberOfDSCSlices       = %d\n", __func__, NumberOfDSCSlices);
+	dml_print("DML::%s: DSCDelayRequirement_val = %d\n", __func__, DSCDelayRequirement_val);
+#endif
+
+	return DSCDelayRequirement_val;
+}
+
+void dml32_CalculateSurfaceSizeInMall(
+		unsigned int NumberOfActiveSurfaces,
+		unsigned int MALLAllocatedForDCN,
+		enum dm_use_mall_for_static_screen_mode UseMALLForStaticScreen[],
+		bool DCCEnable[],
+		bool ViewportStationary[],
+		unsigned int ViewportXStartY[],
+		unsigned int ViewportYStartY[],
+		unsigned int ViewportXStartC[],
+		unsigned int ViewportYStartC[],
+		unsigned int ViewportWidthY[],
+		unsigned int ViewportHeightY[],
+		unsigned int BytesPerPixelY[],
+		unsigned int ViewportWidthC[],
+		unsigned int ViewportHeightC[],
+		unsigned int BytesPerPixelC[],
+		unsigned int SurfaceWidthY[],
+		unsigned int SurfaceWidthC[],
+		unsigned int SurfaceHeightY[],
+		unsigned int SurfaceHeightC[],
+		unsigned int Read256BytesBlockWidthY[],
+		unsigned int Read256BytesBlockWidthC[],
+		unsigned int Read256BytesBlockHeightY[],
+		unsigned int Read256BytesBlockHeightC[],
+		unsigned int ReadBlockWidthY[],
+		unsigned int ReadBlockWidthC[],
+		unsigned int ReadBlockHeightY[],
+		unsigned int ReadBlockHeightC[],
+
+		/* Output */
+		unsigned int    SurfaceSizeInMALL[],
+		bool *ExceededMALLSize)
+{
+	unsigned int TotalSurfaceSizeInMALL  = 0;
+	unsigned int k;
+
+	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+		if (ViewportStationary[k]) {
+			SurfaceSizeInMALL[k] = dml_min(dml_ceil(SurfaceWidthY[k], ReadBlockWidthY[k]),
+					dml_floor(ViewportXStartY[k] + ViewportWidthY[k] + ReadBlockWidthY[k] - 1,
+						ReadBlockWidthY[k]) - dml_floor(ViewportXStartY[k],
+						ReadBlockWidthY[k])) * dml_min(dml_ceil(SurfaceHeightY[k],
+						ReadBlockHeightY[k]), dml_floor(ViewportYStartY[k] +
+						ViewportHeightY[k] + ReadBlockHeightY[k] - 1, ReadBlockHeightY[k]) -
+						dml_floor(ViewportYStartY[k], ReadBlockHeightY[k])) * BytesPerPixelY[k];
+
+			if (ReadBlockWidthC[k] > 0) {
+				SurfaceSizeInMALL[k] = SurfaceSizeInMALL[k] +
+						dml_min(dml_ceil(SurfaceWidthC[k], ReadBlockWidthC[k]),
+							dml_floor(ViewportXStartC[k] + ViewportWidthC[k] +
+							ReadBlockWidthC[k] - 1, ReadBlockWidthC[k]) -
+							dml_floor(ViewportXStartC[k], ReadBlockWidthC[k])) *
+							dml_min(dml_ceil(SurfaceHeightC[k], ReadBlockHeightC[k]),
+							dml_floor(ViewportYStartC[k] + ViewportHeightC[k] +
+							ReadBlockHeightC[k] - 1, ReadBlockHeightC[k]) -
+							dml_floor(ViewportYStartC[k], ReadBlockHeightC[k])) *
+							BytesPerPixelC[k];
+			}
+			if (DCCEnable[k] == true) {
+				SurfaceSizeInMALL[k] = SurfaceSizeInMALL[k] +
+						dml_min(dml_ceil(SurfaceWidthY[k], 8 * Read256BytesBlockWidthY[k]),
+							dml_floor(ViewportXStartY[k] + ViewportWidthY[k] + 8 *
+							Read256BytesBlockWidthY[k] - 1, 8 * Read256BytesBlockWidthY[k])
+							- dml_floor(ViewportXStartY[k], 8 * Read256BytesBlockWidthY[k]))
+							* dml_min(dml_ceil(SurfaceHeightY[k], 8 *
+							Read256BytesBlockHeightY[k]), dml_floor(ViewportYStartY[k] +
+							ViewportHeightY[k] + 8 * Read256BytesBlockHeightY[k] - 1, 8 *
+							Read256BytesBlockHeightY[k]) - dml_floor(ViewportYStartY[k], 8
+							* Read256BytesBlockHeightY[k])) * BytesPerPixelY[k] / 256;
+				if (Read256BytesBlockWidthC[k] > 0) {
+					SurfaceSizeInMALL[k] = SurfaceSizeInMALL[k] +
+							dml_min(dml_ceil(SurfaceWidthC[k], 8 *
+								Read256BytesBlockWidthC[k]),
+								dml_floor(ViewportXStartC[k] + ViewportWidthC[k] + 8
+								* Read256BytesBlockWidthC[k] - 1, 8 *
+								Read256BytesBlockWidthC[k]) -
+								dml_floor(ViewportXStartC[k], 8 *
+								Read256BytesBlockWidthC[k])) *
+								dml_min(dml_ceil(SurfaceHeightC[k], 8 *
+								Read256BytesBlockHeightC[k]),
+								dml_floor(ViewportYStartC[k] + ViewportHeightC[k] +
+								8 * Read256BytesBlockHeightC[k] - 1, 8 *
+								Read256BytesBlockHeightC[k]) -
+								dml_floor(ViewportYStartC[k], 8 *
+								Read256BytesBlockHeightC[k])) *
+								BytesPerPixelC[k] / 256;
+				}
+			}
+		} else {
+			SurfaceSizeInMALL[k] = dml_ceil(dml_min(SurfaceWidthY[k], ViewportWidthY[k] +
+					ReadBlockWidthY[k] - 1), ReadBlockWidthY[k]) *
+					dml_ceil(dml_min(SurfaceHeightY[k], ViewportHeightY[k] +
+							ReadBlockHeightY[k] - 1), ReadBlockHeightY[k]) *
+							BytesPerPixelY[k];
+			if (ReadBlockWidthC[k] > 0) {
+				SurfaceSizeInMALL[k] = SurfaceSizeInMALL[k] +
+						dml_ceil(dml_min(SurfaceWidthC[k], ViewportWidthC[k] +
+								ReadBlockWidthC[k] - 1), ReadBlockWidthC[k]) *
+						dml_ceil(dml_min(SurfaceHeightC[k], ViewportHeightC[k] +
+								ReadBlockHeightC[k] - 1), ReadBlockHeightC[k]) *
+								BytesPerPixelC[k];
+			}
+			if (DCCEnable[k] == true) {
+				SurfaceSizeInMALL[k] = SurfaceSizeInMALL[k] +
+						dml_ceil(dml_min(SurfaceWidthY[k], ViewportWidthY[k] + 8 *
+								Read256BytesBlockWidthY[k] - 1), 8 *
+								Read256BytesBlockWidthY[k]) *
+						dml_ceil(dml_min(SurfaceHeightY[k], ViewportHeightY[k] + 8 *
+								Read256BytesBlockHeightY[k] - 1), 8 *
+								Read256BytesBlockHeightY[k]) * BytesPerPixelY[k] / 256;
+
+				if (Read256BytesBlockWidthC[k] > 0) {
+					SurfaceSizeInMALL[k] = SurfaceSizeInMALL[k] +
+							dml_ceil(dml_min(SurfaceWidthC[k], ViewportWidthC[k] + 8 *
+									Read256BytesBlockWidthC[k] - 1), 8 *
+									Read256BytesBlockWidthC[k]) *
+							dml_ceil(dml_min(SurfaceHeightC[k], ViewportHeightC[k] + 8 *
+									Read256BytesBlockHeightC[k] - 1), 8 *
+									Read256BytesBlockHeightC[k]) *
+									BytesPerPixelC[k] / 256;
+				}
+			}
+		}
+	}
+
+	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+		if (UseMALLForStaticScreen[k] == dm_use_mall_static_screen_enable)
+			TotalSurfaceSizeInMALL = TotalSurfaceSizeInMALL + SurfaceSizeInMALL[k];
+	}
+	*ExceededMALLSize =  (TotalSurfaceSizeInMALL <= MALLAllocatedForDCN * 1024 * 1024 ? false : true);
+} // CalculateSurfaceSizeInMall
+
+void dml32_CalculateVMRowAndSwath(
+		unsigned int NumberOfActiveSurfaces,
+		DmlPipe myPipe[],
+		unsigned int SurfaceSizeInMALL[],
+		unsigned int PTEBufferSizeInRequestsLuma,
+		unsigned int PTEBufferSizeInRequestsChroma,
+		unsigned int DCCMetaBufferSizeBytes,
+		enum dm_use_mall_for_static_screen_mode UseMALLForStaticScreen[],
+		enum dm_use_mall_for_pstate_change_mode UseMALLForPStateChange[],
+		unsigned int MALLAllocatedForDCN,
+		double SwathWidthY[],
+		double SwathWidthC[],
+		bool GPUVMEnable,
+		bool HostVMEnable,
+		unsigned int HostVMMaxNonCachedPageTableLevels,
+		unsigned int GPUVMMaxPageTableLevels,
+		unsigned int GPUVMMinPageSizeKBytes[],
+		unsigned int HostVMMinPageSize,
+
+		/* Output */
+		bool PTEBufferSizeNotExceeded[],
+		bool DCCMetaBufferSizeNotExceeded[],
+		unsigned int dpte_row_width_luma_ub[],
+		unsigned int dpte_row_width_chroma_ub[],
+		unsigned int dpte_row_height_luma[],
+		unsigned int dpte_row_height_chroma[],
+		unsigned int dpte_row_height_linear_luma[],     // VBA_DELTA
+		unsigned int dpte_row_height_linear_chroma[],   // VBA_DELTA
+		unsigned int meta_req_width[],
+		unsigned int meta_req_width_chroma[],
+		unsigned int meta_req_height[],
+		unsigned int meta_req_height_chroma[],
+		unsigned int meta_row_width[],
+		unsigned int meta_row_width_chroma[],
+		unsigned int meta_row_height[],
+		unsigned int meta_row_height_chroma[],
+		unsigned int vm_group_bytes[],
+		unsigned int dpte_group_bytes[],
+		unsigned int PixelPTEReqWidthY[],
+		unsigned int PixelPTEReqHeightY[],
+		unsigned int PTERequestSizeY[],
+		unsigned int PixelPTEReqWidthC[],
+		unsigned int PixelPTEReqHeightC[],
+		unsigned int PTERequestSizeC[],
+		unsigned int dpde0_bytes_per_frame_ub_l[],
+		unsigned int meta_pte_bytes_per_frame_ub_l[],
+		unsigned int dpde0_bytes_per_frame_ub_c[],
+		unsigned int meta_pte_bytes_per_frame_ub_c[],
+		double PrefetchSourceLinesY[],
+		double PrefetchSourceLinesC[],
+		double VInitPreFillY[],
+		double VInitPreFillC[],
+		unsigned int MaxNumSwathY[],
+		unsigned int MaxNumSwathC[],
+		double meta_row_bw[],
+		double dpte_row_bw[],
+		double PixelPTEBytesPerRow[],
+		double PDEAndMetaPTEBytesFrame[],
+		double MetaRowByte[],
+		bool use_one_row_for_frame[],
+		bool use_one_row_for_frame_flip[],
+		bool UsesMALLForStaticScreen[],
+		bool PTE_BUFFER_MODE[],
+		unsigned int BIGK_FRAGMENT_SIZE[])
+{
+	unsigned int k;
+	unsigned int PTEBufferSizeInRequestsForLuma[DC__NUM_DPP__MAX];
+	unsigned int PTEBufferSizeInRequestsForChroma[DC__NUM_DPP__MAX];
+	unsigned int PDEAndMetaPTEBytesFrameY;
+	unsigned int PDEAndMetaPTEBytesFrameC;
+	unsigned int MetaRowByteY[DC__NUM_DPP__MAX];
+	unsigned int MetaRowByteC[DC__NUM_DPP__MAX];
+	unsigned int PixelPTEBytesPerRowY[DC__NUM_DPP__MAX];
+	unsigned int PixelPTEBytesPerRowC[DC__NUM_DPP__MAX];
+	unsigned int PixelPTEBytesPerRowY_one_row_per_frame[DC__NUM_DPP__MAX];
+	unsigned int PixelPTEBytesPerRowC_one_row_per_frame[DC__NUM_DPP__MAX];
+	unsigned int dpte_row_width_luma_ub_one_row_per_frame[DC__NUM_DPP__MAX];
+	unsigned int dpte_row_height_luma_one_row_per_frame[DC__NUM_DPP__MAX];
+	unsigned int dpte_row_width_chroma_ub_one_row_per_frame[DC__NUM_DPP__MAX];
+	unsigned int dpte_row_height_chroma_one_row_per_frame[DC__NUM_DPP__MAX];
+	bool one_row_per_frame_fits_in_buffer[DC__NUM_DPP__MAX];
+
+	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+		if (HostVMEnable == true) {
+			vm_group_bytes[k] = 512;
+			dpte_group_bytes[k] = 512;
+		} else if (GPUVMEnable == true) {
+			vm_group_bytes[k] = 2048;
+			if (GPUVMMinPageSizeKBytes[k] >= 64 && IsVertical(myPipe[k].SourceRotation))
+				dpte_group_bytes[k] = 512;
+			else
+				dpte_group_bytes[k] = 2048;
+		} else {
+			vm_group_bytes[k] = 0;
+			dpte_group_bytes[k] = 0;
+		}
+
+		if (myPipe[k].SourcePixelFormat == dm_420_8 || myPipe[k].SourcePixelFormat == dm_420_10 ||
+				myPipe[k].SourcePixelFormat == dm_420_12 ||
+				myPipe[k].SourcePixelFormat == dm_rgbe_alpha) {
+			if ((myPipe[k].SourcePixelFormat == dm_420_10 || myPipe[k].SourcePixelFormat == dm_420_12) &&
+					!IsVertical(myPipe[k].SourceRotation)) {
+				PTEBufferSizeInRequestsForLuma[k] =
+						(PTEBufferSizeInRequestsLuma + PTEBufferSizeInRequestsChroma) / 2;
+				PTEBufferSizeInRequestsForChroma[k] = PTEBufferSizeInRequestsForLuma[k];
+			} else {
+				PTEBufferSizeInRequestsForLuma[k] = PTEBufferSizeInRequestsLuma;
+				PTEBufferSizeInRequestsForChroma[k] = PTEBufferSizeInRequestsChroma;
+			}
+
+			PDEAndMetaPTEBytesFrameC = dml32_CalculateVMAndRowBytes(
+					myPipe[k].ViewportStationary,
+					myPipe[k].DCCEnable,
+					myPipe[k].DPPPerSurface,
+					myPipe[k].BlockHeight256BytesC,
+					myPipe[k].BlockWidth256BytesC,
+					myPipe[k].SourcePixelFormat,
+					myPipe[k].SurfaceTiling,
+					myPipe[k].BytePerPixelC,
+					myPipe[k].SourceRotation,
+					SwathWidthC[k],
+					myPipe[k].ViewportHeightChroma,
+					myPipe[k].ViewportXStartC,
+					myPipe[k].ViewportYStartC,
+					GPUVMEnable,
+					HostVMEnable,
+					HostVMMaxNonCachedPageTableLevels,
+					GPUVMMaxPageTableLevels,
+					GPUVMMinPageSizeKBytes[k],
+					HostVMMinPageSize,
+					PTEBufferSizeInRequestsForChroma[k],
+					myPipe[k].PitchC,
+					myPipe[k].DCCMetaPitchC,
+					myPipe[k].BlockWidthC,
+					myPipe[k].BlockHeightC,
+
+					/* Output */
+					&MetaRowByteC[k],
+					&PixelPTEBytesPerRowC[k],
+					&dpte_row_width_chroma_ub[k],
+					&dpte_row_height_chroma[k],
+					&dpte_row_height_linear_chroma[k],
+					&PixelPTEBytesPerRowC_one_row_per_frame[k],
+					&dpte_row_width_chroma_ub_one_row_per_frame[k],
+					&dpte_row_height_chroma_one_row_per_frame[k],
+					&meta_req_width_chroma[k],
+					&meta_req_height_chroma[k],
+					&meta_row_width_chroma[k],
+					&meta_row_height_chroma[k],
+					&PixelPTEReqWidthC[k],
+					&PixelPTEReqHeightC[k],
+					&PTERequestSizeC[k],
+					&dpde0_bytes_per_frame_ub_c[k],
+					&meta_pte_bytes_per_frame_ub_c[k]);
+
+			PrefetchSourceLinesC[k] = dml32_CalculatePrefetchSourceLines(
+					myPipe[k].VRatioChroma,
+					myPipe[k].VTapsChroma,
+					myPipe[k].InterlaceEnable,
+					myPipe[k].ProgressiveToInterlaceUnitInOPP,
+					myPipe[k].SwathHeightC,
+					myPipe[k].SourceRotation,
+					myPipe[k].ViewportStationary,
+					SwathWidthC[k],
+					myPipe[k].ViewportHeightChroma,
+					myPipe[k].ViewportXStartC,
+					myPipe[k].ViewportYStartC,
+
+					/* Output */
+					&VInitPreFillC[k],
+					&MaxNumSwathC[k]);
+		} else {
+			PTEBufferSizeInRequestsForLuma[k] = PTEBufferSizeInRequestsLuma + PTEBufferSizeInRequestsChroma;
+			PTEBufferSizeInRequestsForChroma[k] = 0;
+			PixelPTEBytesPerRowC[k] = 0;
+			PDEAndMetaPTEBytesFrameC = 0;
+			MetaRowByteC[k] = 0;
+			MaxNumSwathC[k] = 0;
+			PrefetchSourceLinesC[k] = 0;
+			dpte_row_height_chroma_one_row_per_frame[k] = 0;
+			dpte_row_width_chroma_ub_one_row_per_frame[k] = 0;
+			PixelPTEBytesPerRowC_one_row_per_frame[k] = 0;
+		}
+
+		PDEAndMetaPTEBytesFrameY = dml32_CalculateVMAndRowBytes(
+				myPipe[k].ViewportStationary,
+				myPipe[k].DCCEnable,
+				myPipe[k].DPPPerSurface,
+				myPipe[k].BlockHeight256BytesY,
+				myPipe[k].BlockWidth256BytesY,
+				myPipe[k].SourcePixelFormat,
+				myPipe[k].SurfaceTiling,
+				myPipe[k].BytePerPixelY,
+				myPipe[k].SourceRotation,
+				SwathWidthY[k],
+				myPipe[k].ViewportHeight,
+				myPipe[k].ViewportXStart,
+				myPipe[k].ViewportYStart,
+				GPUVMEnable,
+				HostVMEnable,
+				HostVMMaxNonCachedPageTableLevels,
+				GPUVMMaxPageTableLevels,
+				GPUVMMinPageSizeKBytes[k],
+				HostVMMinPageSize,
+				PTEBufferSizeInRequestsForLuma[k],
+				myPipe[k].PitchY,
+				myPipe[k].DCCMetaPitchY,
+				myPipe[k].BlockWidthY,
+				myPipe[k].BlockHeightY,
+
+				/* Output */
+				&MetaRowByteY[k],
+				&PixelPTEBytesPerRowY[k],
+				&dpte_row_width_luma_ub[k],
+				&dpte_row_height_luma[k],
+				&dpte_row_height_linear_luma[k],
+				&PixelPTEBytesPerRowY_one_row_per_frame[k],
+				&dpte_row_width_luma_ub_one_row_per_frame[k],
+				&dpte_row_height_luma_one_row_per_frame[k],
+				&meta_req_width[k],
+				&meta_req_height[k],
+				&meta_row_width[k],
+				&meta_row_height[k],
+				&PixelPTEReqWidthY[k],
+				&PixelPTEReqHeightY[k],
+				&PTERequestSizeY[k],
+				&dpde0_bytes_per_frame_ub_l[k],
+				&meta_pte_bytes_per_frame_ub_l[k]);
+
+		PrefetchSourceLinesY[k] = dml32_CalculatePrefetchSourceLines(
+				myPipe[k].VRatio,
+				myPipe[k].VTaps,
+				myPipe[k].InterlaceEnable,
+				myPipe[k].ProgressiveToInterlaceUnitInOPP,
+				myPipe[k].SwathHeightY,
+				myPipe[k].SourceRotation,
+				myPipe[k].ViewportStationary,
+				SwathWidthY[k],
+				myPipe[k].ViewportHeight,
+				myPipe[k].ViewportXStart,
+				myPipe[k].ViewportYStart,
+
+				/* Output */
+				&VInitPreFillY[k],
+				&MaxNumSwathY[k]);
+
+		PDEAndMetaPTEBytesFrame[k] = PDEAndMetaPTEBytesFrameY + PDEAndMetaPTEBytesFrameC;
+		MetaRowByte[k] = MetaRowByteY[k] + MetaRowByteC[k];
+
+		if (PixelPTEBytesPerRowY[k] <= 64 * PTEBufferSizeInRequestsForLuma[k] &&
+				PixelPTEBytesPerRowC[k] <= 64 * PTEBufferSizeInRequestsForChroma[k]) {
+			PTEBufferSizeNotExceeded[k] = true;
+		} else {
+			PTEBufferSizeNotExceeded[k] = false;
+		}
+
+		one_row_per_frame_fits_in_buffer[k] = (PixelPTEBytesPerRowY_one_row_per_frame[k] <= 64 * 2 *
+			PTEBufferSizeInRequestsForLuma[k] &&
+			PixelPTEBytesPerRowC_one_row_per_frame[k] <= 64 * 2 * PTEBufferSizeInRequestsForChroma[k]);
+	}
+
+	dml32_CalculateMALLUseForStaticScreen(
+			NumberOfActiveSurfaces,
+			MALLAllocatedForDCN,
+			UseMALLForStaticScreen,   // mode
+			SurfaceSizeInMALL,
+			one_row_per_frame_fits_in_buffer,
+			/* Output */
+			UsesMALLForStaticScreen); // boolen
+
+	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+		PTE_BUFFER_MODE[k] = myPipe[k].FORCE_ONE_ROW_FOR_FRAME || UsesMALLForStaticScreen[k] ||
+				(UseMALLForPStateChange[k] == dm_use_mall_pstate_change_sub_viewport) ||
+				(UseMALLForPStateChange[k] == dm_use_mall_pstate_change_phantom_pipe) ||
+				(GPUVMMinPageSizeKBytes[k] > 64);
+		BIGK_FRAGMENT_SIZE[k] = dml_log2(GPUVMMinPageSizeKBytes[k] * 1024) - 12;
+	}
+
+	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML::%s: k=%d, SurfaceSizeInMALL = %d\n",  __func__, k, SurfaceSizeInMALL[k]);
+		dml_print("DML::%s: k=%d, UsesMALLForStaticScreen = %d\n",  __func__, k, UsesMALLForStaticScreen[k]);
+#endif
+		use_one_row_for_frame[k] = myPipe[k].FORCE_ONE_ROW_FOR_FRAME || UsesMALLForStaticScreen[k] ||
+				(UseMALLForPStateChange[k] == dm_use_mall_pstate_change_sub_viewport) ||
+				(UseMALLForPStateChange[k] == dm_use_mall_pstate_change_phantom_pipe) ||
+				(GPUVMMinPageSizeKBytes[k] > 64 && IsVertical(myPipe[k].SourceRotation));
+
+		use_one_row_for_frame_flip[k] = use_one_row_for_frame[k] &&
+				!(UseMALLForPStateChange[k] == dm_use_mall_pstate_change_full_frame);
+
+		if (use_one_row_for_frame[k]) {
+			dpte_row_height_luma[k] = dpte_row_height_luma_one_row_per_frame[k];
+			dpte_row_width_luma_ub[k] = dpte_row_width_luma_ub_one_row_per_frame[k];
+			PixelPTEBytesPerRowY[k] = PixelPTEBytesPerRowY_one_row_per_frame[k];
+			dpte_row_height_chroma[k] = dpte_row_height_chroma_one_row_per_frame[k];
+			dpte_row_width_chroma_ub[k] = dpte_row_width_chroma_ub_one_row_per_frame[k];
+			PixelPTEBytesPerRowC[k] = PixelPTEBytesPerRowC_one_row_per_frame[k];
+			PTEBufferSizeNotExceeded[k] = one_row_per_frame_fits_in_buffer[k];
+		}
+
+		if (MetaRowByte[k] <= DCCMetaBufferSizeBytes)
+			DCCMetaBufferSizeNotExceeded[k] = true;
+		else
+			DCCMetaBufferSizeNotExceeded[k] = false;
+
+		PixelPTEBytesPerRow[k] = PixelPTEBytesPerRowY[k] + PixelPTEBytesPerRowC[k];
+		if (use_one_row_for_frame[k])
+			PixelPTEBytesPerRow[k] = PixelPTEBytesPerRow[k] / 2;
+
+		dml32_CalculateRowBandwidth(
+				GPUVMEnable,
+				myPipe[k].SourcePixelFormat,
+				myPipe[k].VRatio,
+				myPipe[k].VRatioChroma,
+				myPipe[k].DCCEnable,
+				myPipe[k].HTotal / myPipe[k].PixelClock,
+				MetaRowByteY[k], MetaRowByteC[k],
+				meta_row_height[k],
+				meta_row_height_chroma[k],
+				PixelPTEBytesPerRowY[k],
+				PixelPTEBytesPerRowC[k],
+				dpte_row_height_luma[k],
+				dpte_row_height_chroma[k],
+
+				/* Output */
+				&meta_row_bw[k],
+				&dpte_row_bw[k]);
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML::%s: k=%d, use_one_row_for_frame        = %d\n",  __func__, k, use_one_row_for_frame[k]);
+		dml_print("DML::%s: k=%d, use_one_row_for_frame_flip   = %d\n",
+				__func__, k, use_one_row_for_frame_flip[k]);
+		dml_print("DML::%s: k=%d, UseMALLForPStateChange       = %d\n",
+				__func__, k, UseMALLForPStateChange[k]);
+		dml_print("DML::%s: k=%d, dpte_row_height_luma         = %d\n",  __func__, k, dpte_row_height_luma[k]);
+		dml_print("DML::%s: k=%d, dpte_row_width_luma_ub       = %d\n",
+				__func__, k, dpte_row_width_luma_ub[k]);
+		dml_print("DML::%s: k=%d, PixelPTEBytesPerRowY         = %d\n",  __func__, k, PixelPTEBytesPerRowY[k]);
+		dml_print("DML::%s: k=%d, dpte_row_height_chroma       = %d\n",
+				__func__, k, dpte_row_height_chroma[k]);
+		dml_print("DML::%s: k=%d, dpte_row_width_chroma_ub     = %d\n",
+				__func__, k, dpte_row_width_chroma_ub[k]);
+		dml_print("DML::%s: k=%d, PixelPTEBytesPerRowC         = %d\n",  __func__, k, PixelPTEBytesPerRowC[k]);
+		dml_print("DML::%s: k=%d, PixelPTEBytesPerRow          = %d\n",  __func__, k, PixelPTEBytesPerRow[k]);
+		dml_print("DML::%s: k=%d, PTEBufferSizeNotExceeded     = %d\n",
+				__func__, k, PTEBufferSizeNotExceeded[k]);
+		dml_print("DML::%s: k=%d, PTE_BUFFER_MODE              = %d\n", __func__, k, PTE_BUFFER_MODE[k]);
+		dml_print("DML::%s: k=%d, BIGK_FRAGMENT_SIZE           = %d\n", __func__, k, BIGK_FRAGMENT_SIZE[k]);
+#endif
+	}
+} // CalculateVMRowAndSwath
+
+unsigned int dml32_CalculateVMAndRowBytes(
+		bool ViewportStationary,
+		bool DCCEnable,
+		unsigned int NumberOfDPPs,
+		unsigned int BlockHeight256Bytes,
+		unsigned int BlockWidth256Bytes,
+		enum source_format_class SourcePixelFormat,
+		unsigned int SurfaceTiling,
+		unsigned int BytePerPixel,
+		enum dm_rotation_angle SourceRotation,
+		double SwathWidth,
+		unsigned int ViewportHeight,
+		unsigned int    ViewportXStart,
+		unsigned int    ViewportYStart,
+		bool GPUVMEnable,
+		bool HostVMEnable,
+		unsigned int HostVMMaxNonCachedPageTableLevels,
+		unsigned int GPUVMMaxPageTableLevels,
+		unsigned int GPUVMMinPageSizeKBytes,
+		unsigned int HostVMMinPageSize,
+		unsigned int PTEBufferSizeInRequests,
+		unsigned int Pitch,
+		unsigned int DCCMetaPitch,
+		unsigned int MacroTileWidth,
+		unsigned int MacroTileHeight,
+
+		/* Output */
+		unsigned int *MetaRowByte,
+		unsigned int *PixelPTEBytesPerRow,
+		unsigned int    *dpte_row_width_ub,
+		unsigned int *dpte_row_height,
+		unsigned int *dpte_row_height_linear,
+		unsigned int    *PixelPTEBytesPerRow_one_row_per_frame,
+		unsigned int    *dpte_row_width_ub_one_row_per_frame,
+		unsigned int    *dpte_row_height_one_row_per_frame,
+		unsigned int *MetaRequestWidth,
+		unsigned int *MetaRequestHeight,
+		unsigned int *meta_row_width,
+		unsigned int *meta_row_height,
+		unsigned int *PixelPTEReqWidth,
+		unsigned int *PixelPTEReqHeight,
+		unsigned int *PTERequestSize,
+		unsigned int    *DPDE0BytesFrame,
+		unsigned int    *MetaPTEBytesFrame)
+{
+	unsigned int MPDEBytesFrame;
+	unsigned int DCCMetaSurfaceBytes;
+	unsigned int ExtraDPDEBytesFrame;
+	unsigned int PDEAndMetaPTEBytesFrame;
+	unsigned int HostVMDynamicLevels = 0;
+	unsigned int    MacroTileSizeBytes;
+	unsigned int    vp_height_meta_ub;
+	unsigned int    vp_height_dpte_ub;
+	unsigned int PixelPTEReqWidth_linear = 0; // VBA_DELTA. VBA doesn't calculate this
+
+	if (GPUVMEnable == true && HostVMEnable == true) {
+		if (HostVMMinPageSize < 2048)
+			HostVMDynamicLevels = HostVMMaxNonCachedPageTableLevels;
+		else if (HostVMMinPageSize >= 2048 && HostVMMinPageSize < 1048576)
+			HostVMDynamicLevels = dml_max(0, (int) HostVMMaxNonCachedPageTableLevels - 1);
+		else
+			HostVMDynamicLevels = dml_max(0, (int) HostVMMaxNonCachedPageTableLevels - 2);
+	}
+
+	*MetaRequestHeight = 8 * BlockHeight256Bytes;
+	*MetaRequestWidth = 8 * BlockWidth256Bytes;
+	if (SurfaceTiling == dm_sw_linear) {
+		*meta_row_height = 32;
+		*meta_row_width = dml_floor(ViewportXStart + SwathWidth + *MetaRequestWidth - 1, *MetaRequestWidth)
+				- dml_floor(ViewportXStart, *MetaRequestWidth);
+	} else if (!IsVertical(SourceRotation)) {
+		*meta_row_height = *MetaRequestHeight;
+		if (ViewportStationary && NumberOfDPPs == 1) {
+			*meta_row_width = dml_floor(ViewportXStart + SwathWidth + *MetaRequestWidth - 1,
+					*MetaRequestWidth) - dml_floor(ViewportXStart, *MetaRequestWidth);
+		} else {
+			*meta_row_width = dml_ceil(SwathWidth - 1, *MetaRequestWidth) + *MetaRequestWidth;
+		}
+		*MetaRowByte = *meta_row_width * *MetaRequestHeight * BytePerPixel / 256.0;
+	} else {
+		*meta_row_height = *MetaRequestWidth;
+		if (ViewportStationary && NumberOfDPPs == 1) {
+			*meta_row_width = dml_floor(ViewportYStart + ViewportHeight + *MetaRequestHeight - 1,
+					*MetaRequestHeight) - dml_floor(ViewportYStart, *MetaRequestHeight);
+		} else {
+			*meta_row_width = dml_ceil(SwathWidth - 1, *MetaRequestHeight) + *MetaRequestHeight;
+		}
+		*MetaRowByte = *meta_row_width * *MetaRequestWidth * BytePerPixel / 256.0;
+	}
+
+	if (ViewportStationary && (NumberOfDPPs == 1 || !IsVertical(SourceRotation))) {
+		vp_height_meta_ub = dml_floor(ViewportYStart + ViewportHeight + 64 * BlockHeight256Bytes - 1,
+				64 * BlockHeight256Bytes) - dml_floor(ViewportYStart, 64 * BlockHeight256Bytes);
+	} else if (!IsVertical(SourceRotation)) {
+		vp_height_meta_ub = dml_ceil(ViewportHeight - 1, 64 * BlockHeight256Bytes) + 64 * BlockHeight256Bytes;
+	} else {
+		vp_height_meta_ub = dml_ceil(SwathWidth - 1, 64 * BlockHeight256Bytes) + 64 * BlockHeight256Bytes;
+	}
+
+	DCCMetaSurfaceBytes = DCCMetaPitch * vp_height_meta_ub * BytePerPixel / 256.0;
+
+	if (GPUVMEnable == true) {
+		*MetaPTEBytesFrame = (dml_ceil((double) (DCCMetaSurfaceBytes - 4.0 * 1024.0) /
+				(8 * 4.0 * 1024), 1) + 1) * 64;
+		MPDEBytesFrame = 128 * (GPUVMMaxPageTableLevels - 1);
+	} else {
+		*MetaPTEBytesFrame = 0;
+		MPDEBytesFrame = 0;
+	}
+
+	if (DCCEnable != true) {
+		*MetaPTEBytesFrame = 0;
+		MPDEBytesFrame = 0;
+		*MetaRowByte = 0;
+	}
+
+	MacroTileSizeBytes = MacroTileWidth * BytePerPixel * MacroTileHeight;
+
+	if (GPUVMEnable == true && GPUVMMaxPageTableLevels > 1) {
+		if (ViewportStationary && (NumberOfDPPs == 1 || !IsVertical(SourceRotation))) {
+			vp_height_dpte_ub = dml_floor(ViewportYStart + ViewportHeight +
+					MacroTileHeight - 1, MacroTileHeight) -
+					dml_floor(ViewportYStart, MacroTileHeight);
+		} else if (!IsVertical(SourceRotation)) {
+			vp_height_dpte_ub = dml_ceil(ViewportHeight - 1, MacroTileHeight) + MacroTileHeight;
+		} else {
+			vp_height_dpte_ub = dml_ceil(SwathWidth - 1, MacroTileHeight) + MacroTileHeight;
+		}
+		*DPDE0BytesFrame = 64 * (dml_ceil((Pitch * vp_height_dpte_ub * BytePerPixel - MacroTileSizeBytes) /
+				(8 * 2097152), 1) + 1);
+		ExtraDPDEBytesFrame = 128 * (GPUVMMaxPageTableLevels - 2);
+	} else {
+		*DPDE0BytesFrame = 0;
+		ExtraDPDEBytesFrame = 0;
+		vp_height_dpte_ub = 0;
+	}
+
+	PDEAndMetaPTEBytesFrame = *MetaPTEBytesFrame + MPDEBytesFrame + *DPDE0BytesFrame + ExtraDPDEBytesFrame;
+
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: DCCEnable = %d\n", __func__, DCCEnable);
+	dml_print("DML::%s: GPUVMEnable = %d\n", __func__, GPUVMEnable);
+	dml_print("DML::%s: SwModeLinear = %d\n", __func__, SurfaceTiling == dm_sw_linear);
+	dml_print("DML::%s: BytePerPixel = %d\n", __func__, BytePerPixel);
+	dml_print("DML::%s: GPUVMMaxPageTableLevels = %d\n", __func__, GPUVMMaxPageTableLevels);
+	dml_print("DML::%s: BlockHeight256Bytes = %d\n", __func__, BlockHeight256Bytes);
+	dml_print("DML::%s: BlockWidth256Bytes = %d\n", __func__, BlockWidth256Bytes);
+	dml_print("DML::%s: MacroTileHeight = %d\n", __func__, MacroTileHeight);
+	dml_print("DML::%s: MacroTileWidth = %d\n", __func__, MacroTileWidth);
+	dml_print("DML::%s: MetaPTEBytesFrame = %d\n", __func__, *MetaPTEBytesFrame);
+	dml_print("DML::%s: MPDEBytesFrame = %d\n", __func__, MPDEBytesFrame);
+	dml_print("DML::%s: DPDE0BytesFrame = %d\n", __func__, *DPDE0BytesFrame);
+	dml_print("DML::%s: ExtraDPDEBytesFrame= %d\n", __func__, ExtraDPDEBytesFrame);
+	dml_print("DML::%s: PDEAndMetaPTEBytesFrame = %d\n", __func__, PDEAndMetaPTEBytesFrame);
+	dml_print("DML::%s: ViewportHeight = %d\n", __func__, ViewportHeight);
+	dml_print("DML::%s: SwathWidth = %d\n", __func__, SwathWidth);
+	dml_print("DML::%s: vp_height_dpte_ub = %d\n", __func__, vp_height_dpte_ub);
+#endif
+
+	if (HostVMEnable == true)
+		PDEAndMetaPTEBytesFrame = PDEAndMetaPTEBytesFrame * (1 + 8 * HostVMDynamicLevels);
+
+	if (SurfaceTiling == dm_sw_linear) {
+		*PixelPTEReqHeight = 1;
+		*PixelPTEReqWidth = GPUVMMinPageSizeKBytes * 1024 * 8 / BytePerPixel;
+		PixelPTEReqWidth_linear = GPUVMMinPageSizeKBytes * 1024 * 8 / BytePerPixel;
+		*PTERequestSize = 64;
+	} else if (GPUVMMinPageSizeKBytes == 4) {
+		*PixelPTEReqHeight = 16 * BlockHeight256Bytes;
+		*PixelPTEReqWidth = 16 * BlockWidth256Bytes;
+		*PTERequestSize = 128;
+	} else {
+		*PixelPTEReqHeight = MacroTileHeight;
+		*PixelPTEReqWidth = 8 *  1024 * GPUVMMinPageSizeKBytes / (MacroTileHeight * BytePerPixel);
+		*PTERequestSize = 64;
+	}
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: GPUVMMinPageSizeKBytes = %d\n", __func__, GPUVMMinPageSizeKBytes);
+	dml_print("DML::%s: PDEAndMetaPTEBytesFrame = %d (after HostVM factor)\n", __func__, PDEAndMetaPTEBytesFrame);
+	dml_print("DML::%s: PixelPTEReqHeight = %d\n", __func__, *PixelPTEReqHeight);
+	dml_print("DML::%s: PixelPTEReqWidth = %d\n", __func__, *PixelPTEReqWidth);
+	dml_print("DML::%s: PixelPTEReqWidth_linear = %d\n", __func__, PixelPTEReqWidth_linear);
+	dml_print("DML::%s: PTERequestSize = %d\n", __func__, *PTERequestSize);
+	dml_print("DML::%s: Pitch = %d\n", __func__, Pitch);
+#endif
+
+	*dpte_row_height_one_row_per_frame = vp_height_dpte_ub;
+	*dpte_row_width_ub_one_row_per_frame = (dml_ceil(((double)Pitch * (double)*dpte_row_height_one_row_per_frame /
+			(double) *PixelPTEReqHeight - 1) / (double) *PixelPTEReqWidth, 1) + 1) *
+					(double) *PixelPTEReqWidth;
+	*PixelPTEBytesPerRow_one_row_per_frame = *dpte_row_width_ub_one_row_per_frame / *PixelPTEReqWidth *
+			*PTERequestSize;
+
+	if (SurfaceTiling == dm_sw_linear) {
+		*dpte_row_height = dml_min(128, 1 << (unsigned int) dml_floor(dml_log2(PTEBufferSizeInRequests *
+				*PixelPTEReqWidth / Pitch), 1));
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML::%s: dpte_row_height = %d (1)\n", __func__,
+				PTEBufferSizeInRequests * *PixelPTEReqWidth / Pitch);
+		dml_print("DML::%s: dpte_row_height = %f (2)\n", __func__,
+				dml_log2(PTEBufferSizeInRequests * *PixelPTEReqWidth / Pitch));
+		dml_print("DML::%s: dpte_row_height = %f (3)\n", __func__,
+				dml_floor(dml_log2(PTEBufferSizeInRequests * *PixelPTEReqWidth / Pitch), 1));
+		dml_print("DML::%s: dpte_row_height = %d (4)\n", __func__,
+				1 << (unsigned int) dml_floor(dml_log2(PTEBufferSizeInRequests *
+						*PixelPTEReqWidth / Pitch), 1));
+		dml_print("DML::%s: dpte_row_height = %d\n", __func__, *dpte_row_height);
+#endif
+		*dpte_row_width_ub = dml_ceil(((double) Pitch * (double) *dpte_row_height - 1),
+				(double) *PixelPTEReqWidth) + *PixelPTEReqWidth;
+		*PixelPTEBytesPerRow = *dpte_row_width_ub / (double)*PixelPTEReqWidth * (double)*PTERequestSize;
+
+		// VBA_DELTA, VBA doesn't have programming value for pte row height linear.
+		*dpte_row_height_linear = 1 << (unsigned int) dml_floor(dml_log2(PTEBufferSizeInRequests *
+				PixelPTEReqWidth_linear / Pitch), 1);
+		if (*dpte_row_height_linear > 128)
+			*dpte_row_height_linear = 128;
+
+	} else if (!IsVertical(SourceRotation)) {
+		*dpte_row_height = *PixelPTEReqHeight;
+
+		if (GPUVMMinPageSizeKBytes > 64) {
+			*dpte_row_width_ub = (dml_ceil((Pitch * *dpte_row_height / *PixelPTEReqHeight - 1) /
+					*PixelPTEReqWidth, 1) + 1) * *PixelPTEReqWidth;
+		} else if (ViewportStationary && (NumberOfDPPs == 1)) {
+			*dpte_row_width_ub = dml_floor(ViewportXStart + SwathWidth +
+					*PixelPTEReqWidth - 1, *PixelPTEReqWidth) -
+					dml_floor(ViewportXStart, *PixelPTEReqWidth);
+		} else {
+			*dpte_row_width_ub = (dml_ceil((SwathWidth - 1) / *PixelPTEReqWidth, 1) + 1) *
+					*PixelPTEReqWidth;
+		}
+
+		*PixelPTEBytesPerRow = *dpte_row_width_ub / *PixelPTEReqWidth * *PTERequestSize;
+	} else {
+		*dpte_row_height = dml_min(*PixelPTEReqWidth, MacroTileWidth);
+
+		if (ViewportStationary && (NumberOfDPPs == 1)) {
+			*dpte_row_width_ub = dml_floor(ViewportYStart + ViewportHeight + *PixelPTEReqHeight - 1,
+					*PixelPTEReqHeight) - dml_floor(ViewportYStart, *PixelPTEReqHeight);
+		} else {
+			*dpte_row_width_ub = (dml_ceil((SwathWidth - 1) / *PixelPTEReqHeight, 1) + 1)
+					* *PixelPTEReqHeight;
+		}
+
+		*PixelPTEBytesPerRow = *dpte_row_width_ub / *PixelPTEReqHeight * *PTERequestSize;
+	}
+
+	if (GPUVMEnable != true)
+		*PixelPTEBytesPerRow = 0;
+	if (HostVMEnable == true)
+		*PixelPTEBytesPerRow = *PixelPTEBytesPerRow * (1 + 8 * HostVMDynamicLevels);
+
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: GPUVMMinPageSizeKBytes = %d\n", __func__, GPUVMMinPageSizeKBytes);
+	dml_print("DML::%s: dpte_row_height = %d\n", __func__, *dpte_row_height);
+	dml_print("DML::%s: dpte_row_height_linear = %d\n", __func__, *dpte_row_height_linear);
+	dml_print("DML::%s: dpte_row_width_ub = %d\n", __func__, *dpte_row_width_ub);
+	dml_print("DML::%s: PixelPTEBytesPerRow = %d\n", __func__, *PixelPTEBytesPerRow);
+	dml_print("DML::%s: PTEBufferSizeInRequests = %d\n", __func__, PTEBufferSizeInRequests);
+	dml_print("DML::%s: dpte_row_height_one_row_per_frame = %d\n", __func__, *dpte_row_height_one_row_per_frame);
+	dml_print("DML::%s: dpte_row_width_ub_one_row_per_frame = %d\n",
+			__func__, *dpte_row_width_ub_one_row_per_frame);
+	dml_print("DML::%s: PixelPTEBytesPerRow_one_row_per_frame = %d\n",
+			__func__, *PixelPTEBytesPerRow_one_row_per_frame);
+	dml_print("DML: vm_bytes = meta_pte_bytes_per_frame (per_pipe) = MetaPTEBytesFrame = : %i\n",
+			*MetaPTEBytesFrame);
+#endif
+
+	return PDEAndMetaPTEBytesFrame;
+} // CalculateVMAndRowBytes
+
+double dml32_CalculatePrefetchSourceLines(
+		double VRatio,
+		unsigned int VTaps,
+		bool Interlace,
+		bool ProgressiveToInterlaceUnitInOPP,
+		unsigned int SwathHeight,
+		enum dm_rotation_angle SourceRotation,
+		bool ViewportStationary,
+		double SwathWidth,
+		unsigned int ViewportHeight,
+		unsigned int ViewportXStart,
+		unsigned int ViewportYStart,
+
+		/* Output */
+		double *VInitPreFill,
+		unsigned int *MaxNumSwath)
+{
+
+	unsigned int vp_start_rot;
+	unsigned int sw0_tmp;
+	unsigned int MaxPartialSwath;
+	double numLines;
+
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: VRatio = %f\n", __func__, VRatio);
+	dml_print("DML::%s: VTaps = %d\n", __func__, VTaps);
+	dml_print("DML::%s: ViewportXStart = %d\n", __func__, ViewportXStart);
+	dml_print("DML::%s: ViewportYStart = %d\n", __func__, ViewportYStart);
+	dml_print("DML::%s: ViewportStationary = %d\n", __func__, ViewportStationary);
+	dml_print("DML::%s: SwathHeight = %d\n", __func__, SwathHeight);
+#endif
+	if (ProgressiveToInterlaceUnitInOPP)
+		*VInitPreFill = dml_floor((VRatio + (double) VTaps + 1) / 2.0, 1);
+	else
+		*VInitPreFill = dml_floor((VRatio + (double) VTaps + 1 + Interlace * 0.5 * VRatio) / 2.0, 1);
+
+	if (ViewportStationary) {
+		if (SourceRotation == dm_rotation_180 || SourceRotation == dm_rotation_180m) {
+			vp_start_rot = SwathHeight -
+					(((unsigned int) (ViewportYStart + ViewportHeight - 1) % SwathHeight) + 1);
+		} else if (SourceRotation == dm_rotation_270 || SourceRotation == dm_rotation_90m) {
+			vp_start_rot = ViewportXStart;
+		} else if (SourceRotation == dm_rotation_90 || SourceRotation == dm_rotation_270m) {
+			vp_start_rot = SwathHeight -
+					(((unsigned int)(ViewportYStart + SwathWidth - 1) % SwathHeight) + 1);
+		} else {
+			vp_start_rot = ViewportYStart;
+		}
+		sw0_tmp = SwathHeight - (vp_start_rot % SwathHeight);
+		if (sw0_tmp < *VInitPreFill)
+			*MaxNumSwath = dml_ceil((*VInitPreFill - sw0_tmp) / SwathHeight, 1) + 1;
+		else
+			*MaxNumSwath = 1;
+		MaxPartialSwath = dml_max(1, (unsigned int) (vp_start_rot + *VInitPreFill - 1) % SwathHeight);
+	} else {
+		*MaxNumSwath = dml_ceil((*VInitPreFill - 1.0) / SwathHeight, 1) + 1;
+		if (*VInitPreFill > 1)
+			MaxPartialSwath = dml_max(1, (unsigned int) (*VInitPreFill - 2) % SwathHeight);
+		else
+			MaxPartialSwath = dml_max(1, (unsigned int) (*VInitPreFill + SwathHeight - 2) % SwathHeight);
+	}
+	numLines = *MaxNumSwath * SwathHeight + MaxPartialSwath;
+
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: vp_start_rot = %d\n", __func__, vp_start_rot);
+	dml_print("DML::%s: VInitPreFill = %d\n", __func__, *VInitPreFill);
+	dml_print("DML::%s: MaxPartialSwath = %d\n", __func__, MaxPartialSwath);
+	dml_print("DML::%s: MaxNumSwath = %d\n", __func__, *MaxNumSwath);
+	dml_print("DML::%s: Prefetch source lines = %3.2f\n", __func__, numLines);
+#endif
+	return numLines;
+
+} // CalculatePrefetchSourceLines
+
+void dml32_CalculateMALLUseForStaticScreen(
+		unsigned int NumberOfActiveSurfaces,
+		unsigned int MALLAllocatedForDCNFinal,
+		enum dm_use_mall_for_static_screen_mode *UseMALLForStaticScreen,
+		unsigned int SurfaceSizeInMALL[],
+		bool one_row_per_frame_fits_in_buffer[],
+
+		/* output */
+		bool UsesMALLForStaticScreen[])
+{
+	unsigned int k;
+	unsigned int SurfaceToAddToMALL;
+	bool CanAddAnotherSurfaceToMALL;
+	unsigned int TotalSurfaceSizeInMALL;
+
+	TotalSurfaceSizeInMALL = 0;
+	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+		UsesMALLForStaticScreen[k] = (UseMALLForStaticScreen[k] == dm_use_mall_static_screen_enable);
+		if (UsesMALLForStaticScreen[k])
+			TotalSurfaceSizeInMALL = TotalSurfaceSizeInMALL + SurfaceSizeInMALL[k];
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML::%s: k=%d, UsesMALLForStaticScreen = %d\n",  __func__, k, UsesMALLForStaticScreen[k]);
+		dml_print("DML::%s: k=%d, TotalSurfaceSizeInMALL = %d\n",  __func__, k, TotalSurfaceSizeInMALL);
+#endif
+	}
+
+	SurfaceToAddToMALL = 0;
+	CanAddAnotherSurfaceToMALL = true;
+	while (CanAddAnotherSurfaceToMALL) {
+		CanAddAnotherSurfaceToMALL = false;
+		for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+			if (TotalSurfaceSizeInMALL + SurfaceSizeInMALL[k] <= MALLAllocatedForDCNFinal * 1024 * 1024 &&
+					!UsesMALLForStaticScreen[k] &&
+					UseMALLForStaticScreen[k] != dm_use_mall_static_screen_disable &&
+					one_row_per_frame_fits_in_buffer[k] &&
+					(!CanAddAnotherSurfaceToMALL ||
+					SurfaceSizeInMALL[k] < SurfaceSizeInMALL[SurfaceToAddToMALL])) {
+				CanAddAnotherSurfaceToMALL = true;
+				SurfaceToAddToMALL = k;
+#ifdef __DML_VBA_DEBUG__
+				dml_print("DML::%s: k=%d, UseMALLForStaticScreen = %d (dis, en, optimize)\n",
+						__func__, k, UseMALLForStaticScreen[k]);
+#endif
+			}
+		}
+		if (CanAddAnotherSurfaceToMALL) {
+			UsesMALLForStaticScreen[SurfaceToAddToMALL] = true;
+			TotalSurfaceSizeInMALL = TotalSurfaceSizeInMALL + SurfaceSizeInMALL[SurfaceToAddToMALL];
+
+#ifdef __DML_VBA_DEBUG__
+			dml_print("DML::%s: SurfaceToAddToMALL       = %d\n",  __func__, SurfaceToAddToMALL);
+			dml_print("DML::%s: TotalSurfaceSizeInMALL   = %d\n",  __func__, TotalSurfaceSizeInMALL);
+#endif
+
+		}
+	}
+}
+
+void dml32_CalculateRowBandwidth(
+		bool GPUVMEnable,
+		enum source_format_class SourcePixelFormat,
+		double VRatio,
+		double VRatioChroma,
+		bool DCCEnable,
+		double LineTime,
+		unsigned int MetaRowByteLuma,
+		unsigned int MetaRowByteChroma,
+		unsigned int meta_row_height_luma,
+		unsigned int meta_row_height_chroma,
+		unsigned int PixelPTEBytesPerRowLuma,
+		unsigned int PixelPTEBytesPerRowChroma,
+		unsigned int dpte_row_height_luma,
+		unsigned int dpte_row_height_chroma,
+		/* Output */
+		double *meta_row_bw,
+		double *dpte_row_bw)
+{
+	if (DCCEnable != true) {
+		*meta_row_bw = 0;
+	} else if (SourcePixelFormat == dm_420_8 || SourcePixelFormat == dm_420_10 || SourcePixelFormat == dm_420_12 ||
+			SourcePixelFormat == dm_rgbe_alpha) {
+		*meta_row_bw = VRatio * MetaRowByteLuma / (meta_row_height_luma * LineTime) + VRatioChroma *
+				MetaRowByteChroma / (meta_row_height_chroma * LineTime);
+	} else {
+		*meta_row_bw = VRatio * MetaRowByteLuma / (meta_row_height_luma * LineTime);
+	}
+
+	if (GPUVMEnable != true) {
+		*dpte_row_bw = 0;
+	} else if (SourcePixelFormat == dm_420_8 || SourcePixelFormat == dm_420_10 || SourcePixelFormat == dm_420_12 ||
+			SourcePixelFormat == dm_rgbe_alpha) {
+		*dpte_row_bw = VRatio * PixelPTEBytesPerRowLuma / (dpte_row_height_luma * LineTime) +
+				VRatioChroma * PixelPTEBytesPerRowChroma / (dpte_row_height_chroma * LineTime);
+	} else {
+		*dpte_row_bw = VRatio * PixelPTEBytesPerRowLuma / (dpte_row_height_luma * LineTime);
+	}
+}
+
+double dml32_CalculateUrgentLatency(
+		double UrgentLatencyPixelDataOnly,
+		double UrgentLatencyPixelMixedWithVMData,
+		double UrgentLatencyVMDataOnly,
+		bool   DoUrgentLatencyAdjustment,
+		double UrgentLatencyAdjustmentFabricClockComponent,
+		double UrgentLatencyAdjustmentFabricClockReference,
+		double FabricClock)
+{
+	double   ret;
+
+	ret = dml_max3(UrgentLatencyPixelDataOnly, UrgentLatencyPixelMixedWithVMData, UrgentLatencyVMDataOnly);
+	if (DoUrgentLatencyAdjustment == true) {
+		ret = ret + UrgentLatencyAdjustmentFabricClockComponent *
+				(UrgentLatencyAdjustmentFabricClockReference / FabricClock - 1);
+	}
+	return ret;
+}
+
+void dml32_CalculateUrgentBurstFactor(
+		enum dm_use_mall_for_pstate_change_mode UseMALLForPStateChange,
+		unsigned int    swath_width_luma_ub,
+		unsigned int    swath_width_chroma_ub,
+		unsigned int SwathHeightY,
+		unsigned int SwathHeightC,
+		double  LineTime,
+		double  UrgentLatency,
+		double  CursorBufferSize,
+		unsigned int CursorWidth,
+		unsigned int CursorBPP,
+		double  VRatio,
+		double  VRatioC,
+		double  BytePerPixelInDETY,
+		double  BytePerPixelInDETC,
+		unsigned int    DETBufferSizeY,
+		unsigned int    DETBufferSizeC,
+		/* Output */
+		double *UrgentBurstFactorCursor,
+		double *UrgentBurstFactorLuma,
+		double *UrgentBurstFactorChroma,
+		bool   *NotEnoughUrgentLatencyHiding)
+{
+	double       LinesInDETLuma;
+	double       LinesInDETChroma;
+	unsigned int LinesInCursorBuffer;
+	double       CursorBufferSizeInTime;
+	double       DETBufferSizeInTimeLuma;
+	double       DETBufferSizeInTimeChroma;
+
+	*NotEnoughUrgentLatencyHiding = 0;
+
+	if (CursorWidth > 0) {
+		LinesInCursorBuffer = 1 << (unsigned int) dml_floor(dml_log2(CursorBufferSize * 1024.0 /
+				(CursorWidth * CursorBPP / 8.0)), 1.0);
+		if (VRatio > 0) {
+			CursorBufferSizeInTime = LinesInCursorBuffer * LineTime / VRatio;
+			if (CursorBufferSizeInTime - UrgentLatency <= 0) {
+				*NotEnoughUrgentLatencyHiding = 1;
+				*UrgentBurstFactorCursor = 0;
+			} else {
+				*UrgentBurstFactorCursor = CursorBufferSizeInTime /
+						(CursorBufferSizeInTime - UrgentLatency);
+			}
+		} else {
+			*UrgentBurstFactorCursor = 1;
+		}
+	}
+
+	LinesInDETLuma = (UseMALLForPStateChange == dm_use_mall_pstate_change_phantom_pipe ? 1024*1024 :
+			DETBufferSizeY) / BytePerPixelInDETY / swath_width_luma_ub;
+
+	if (VRatio > 0) {
+		DETBufferSizeInTimeLuma = dml_floor(LinesInDETLuma, SwathHeightY) * LineTime / VRatio;
+		if (DETBufferSizeInTimeLuma - UrgentLatency <= 0) {
+			*NotEnoughUrgentLatencyHiding = 1;
+			*UrgentBurstFactorLuma = 0;
+		} else {
+			*UrgentBurstFactorLuma = DETBufferSizeInTimeLuma / (DETBufferSizeInTimeLuma - UrgentLatency);
+		}
+	} else {
+		*UrgentBurstFactorLuma = 1;
+	}
+
+	if (BytePerPixelInDETC > 0) {
+		LinesInDETChroma = (UseMALLForPStateChange == dm_use_mall_pstate_change_phantom_pipe ?
+					1024 * 1024 : DETBufferSizeC) / BytePerPixelInDETC
+					/ swath_width_chroma_ub;
+
+		if (VRatio > 0) {
+			DETBufferSizeInTimeChroma = dml_floor(LinesInDETChroma, SwathHeightC) * LineTime / VRatio;
+			if (DETBufferSizeInTimeChroma - UrgentLatency <= 0) {
+				*NotEnoughUrgentLatencyHiding = 1;
+				*UrgentBurstFactorChroma = 0;
+			} else {
+				*UrgentBurstFactorChroma = DETBufferSizeInTimeChroma
+						/ (DETBufferSizeInTimeChroma - UrgentLatency);
+			}
+		} else {
+			*UrgentBurstFactorChroma = 1;
+		}
+	}
+} // CalculateUrgentBurstFactor
+
+void dml32_CalculateDCFCLKDeepSleep(
+		unsigned int NumberOfActiveSurfaces,
+		unsigned int BytePerPixelY[],
+		unsigned int BytePerPixelC[],
+		double VRatio[],
+		double VRatioChroma[],
+		double SwathWidthY[],
+		double SwathWidthC[],
+		unsigned int DPPPerSurface[],
+		double HRatio[],
+		double HRatioChroma[],
+		double PixelClock[],
+		double PSCL_THROUGHPUT[],
+		double PSCL_THROUGHPUT_CHROMA[],
+		double Dppclk[],
+		double ReadBandwidthLuma[],
+		double ReadBandwidthChroma[],
+		unsigned int ReturnBusWidth,
+
+		/* Output */
+		double *DCFClkDeepSleep)
+{
+	unsigned int k;
+	double   DisplayPipeLineDeliveryTimeLuma;
+	double   DisplayPipeLineDeliveryTimeChroma;
+	double   DCFClkDeepSleepPerSurface[DC__NUM_DPP__MAX];
+	double ReadBandwidth = 0.0;
+
+	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+
+		if (VRatio[k] <= 1) {
+			DisplayPipeLineDeliveryTimeLuma = SwathWidthY[k] * DPPPerSurface[k] / HRatio[k]
+					/ PixelClock[k];
+		} else {
+			DisplayPipeLineDeliveryTimeLuma = SwathWidthY[k] / PSCL_THROUGHPUT[k] / Dppclk[k];
+		}
+		if (BytePerPixelC[k] == 0) {
+			DisplayPipeLineDeliveryTimeChroma = 0;
+		} else {
+			if (VRatioChroma[k] <= 1) {
+				DisplayPipeLineDeliveryTimeChroma = SwathWidthC[k] *
+						DPPPerSurface[k] / HRatioChroma[k] / PixelClock[k];
+			} else {
+				DisplayPipeLineDeliveryTimeChroma = SwathWidthC[k] / PSCL_THROUGHPUT_CHROMA[k]
+						/ Dppclk[k];
+			}
+		}
+
+		if (BytePerPixelC[k] > 0) {
+			DCFClkDeepSleepPerSurface[k] = dml_max(__DML_MIN_DCFCLK_FACTOR__ * SwathWidthY[k] *
+					BytePerPixelY[k] / 32.0 / DisplayPipeLineDeliveryTimeLuma,
+					__DML_MIN_DCFCLK_FACTOR__ * SwathWidthC[k] * BytePerPixelC[k] /
+					32.0 / DisplayPipeLineDeliveryTimeChroma);
+		} else {
+			DCFClkDeepSleepPerSurface[k] = __DML_MIN_DCFCLK_FACTOR__ * SwathWidthY[k] * BytePerPixelY[k] /
+					64.0 / DisplayPipeLineDeliveryTimeLuma;
+		}
+		DCFClkDeepSleepPerSurface[k] = dml_max(DCFClkDeepSleepPerSurface[k], PixelClock[k] / 16);
+
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML::%s: k=%d, PixelClock = %f\n", __func__, k, PixelClock[k]);
+		dml_print("DML::%s: k=%d, DCFClkDeepSleepPerSurface = %f\n", __func__, k, DCFClkDeepSleepPerSurface[k]);
+#endif
+	}
+
+	for (k = 0; k < NumberOfActiveSurfaces; ++k)
+		ReadBandwidth = ReadBandwidth + ReadBandwidthLuma[k] + ReadBandwidthChroma[k];
+
+	*DCFClkDeepSleep = dml_max(8.0, __DML_MIN_DCFCLK_FACTOR__ * ReadBandwidth / (double) ReturnBusWidth);
+
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: __DML_MIN_DCFCLK_FACTOR__ = %f\n", __func__, __DML_MIN_DCFCLK_FACTOR__);
+	dml_print("DML::%s: ReadBandwidth = %f\n", __func__, ReadBandwidth);
+	dml_print("DML::%s: ReturnBusWidth = %d\n", __func__, ReturnBusWidth);
+	dml_print("DML::%s: DCFClkDeepSleep = %f\n", __func__, *DCFClkDeepSleep);
+#endif
+
+	for (k = 0; k < NumberOfActiveSurfaces; ++k)
+		*DCFClkDeepSleep = dml_max(*DCFClkDeepSleep, DCFClkDeepSleepPerSurface[k]);
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: DCFClkDeepSleep = %f (final)\n", __func__, *DCFClkDeepSleep);
+#endif
+} // CalculateDCFCLKDeepSleep
+
+double dml32_CalculateWriteBackDelay(
+		enum source_format_class WritebackPixelFormat,
+		double WritebackHRatio,
+		double WritebackVRatio,
+		unsigned int WritebackVTaps,
+		unsigned int         WritebackDestinationWidth,
+		unsigned int         WritebackDestinationHeight,
+		unsigned int         WritebackSourceHeight,
+		unsigned int HTotal)
+{
+	double CalculateWriteBackDelay;
+	double Line_length;
+	double Output_lines_last_notclamped;
+	double WritebackVInit;
+
+	WritebackVInit = (WritebackVRatio + WritebackVTaps + 1) / 2;
+	Line_length = dml_max((double) WritebackDestinationWidth,
+			dml_ceil((double)WritebackDestinationWidth / 6.0, 1.0) * WritebackVTaps);
+	Output_lines_last_notclamped = WritebackDestinationHeight - 1 -
+			dml_ceil(((double)WritebackSourceHeight -
+					(double) WritebackVInit) / (double)WritebackVRatio, 1.0);
+	if (Output_lines_last_notclamped < 0) {
+		CalculateWriteBackDelay = 0;
+	} else {
+		CalculateWriteBackDelay = Output_lines_last_notclamped * Line_length +
+				(HTotal - WritebackDestinationWidth) + 80;
+	}
+	return CalculateWriteBackDelay;
+}
+
+void dml32_UseMinimumDCFCLK(
+		enum dm_use_mall_for_pstate_change_mode UseMALLForPStateChange[],
+		bool DRRDisplay[],
+		bool SynchronizeDRRDisplaysForUCLKPStateChangeFinal,
+		unsigned int MaxInterDCNTileRepeaters,
+		unsigned int MaxPrefetchMode,
+		double DRAMClockChangeLatencyFinal,
+		double FCLKChangeLatency,
+		double SREnterPlusExitTime,
+		unsigned int ReturnBusWidth,
+		unsigned int RoundTripPingLatencyCycles,
+		unsigned int ReorderingBytes,
+		unsigned int PixelChunkSizeInKByte,
+		unsigned int MetaChunkSize,
+		bool GPUVMEnable,
+		unsigned int GPUVMMaxPageTableLevels,
+		bool HostVMEnable,
+		unsigned int NumberOfActiveSurfaces,
+		double HostVMMinPageSize,
+		unsigned int HostVMMaxNonCachedPageTableLevels,
+		bool DynamicMetadataVMEnabled,
+		bool ImmediateFlipRequirement,
+		bool ProgressiveToInterlaceUnitInOPP,
+		double MaxAveragePercentOfIdealSDPPortBWDisplayCanUseInNormalSystemOperation,
+		double PercentOfIdealSDPPortBWReceivedAfterUrgLatency,
+		unsigned int VTotal[],
+		unsigned int VActive[],
+		unsigned int DynamicMetadataTransmittedBytes[],
+		unsigned int DynamicMetadataLinesBeforeActiveRequired[],
+		bool Interlace[],
+		double RequiredDPPCLKPerSurface[][2][DC__NUM_DPP__MAX],
+		double RequiredDISPCLK[][2],
+		double UrgLatency[],
+		unsigned int NoOfDPP[][2][DC__NUM_DPP__MAX],
+		double ProjectedDCFClkDeepSleep[][2],
+		double MaximumVStartup[][2][DC__NUM_DPP__MAX],
+		unsigned int TotalNumberOfActiveDPP[][2],
+		unsigned int TotalNumberOfDCCActiveDPP[][2],
+		unsigned int dpte_group_bytes[],
+		double PrefetchLinesY[][2][DC__NUM_DPP__MAX],
+		double PrefetchLinesC[][2][DC__NUM_DPP__MAX],
+		unsigned int swath_width_luma_ub_all_states[][2][DC__NUM_DPP__MAX],
+		unsigned int swath_width_chroma_ub_all_states[][2][DC__NUM_DPP__MAX],
+		unsigned int BytePerPixelY[],
+		unsigned int BytePerPixelC[],
+		unsigned int HTotal[],
+		double PixelClock[],
+		double PDEAndMetaPTEBytesPerFrame[][2][DC__NUM_DPP__MAX],
+		double DPTEBytesPerRow[][2][DC__NUM_DPP__MAX],
+		double MetaRowBytes[][2][DC__NUM_DPP__MAX],
+		bool DynamicMetadataEnable[],
+		double ReadBandwidthLuma[],
+		double ReadBandwidthChroma[],
+		double DCFCLKPerState[],
+		/* Output */
+		double DCFCLKState[][2])
+{
+	unsigned int i, j, k;
+	unsigned int     dummy1;
+	double dummy2, dummy3;
+	double   NormalEfficiency;
+	double   TotalMaxPrefetchFlipDPTERowBandwidth[DC__VOLTAGE_STATES][2];
+
+	NormalEfficiency = PercentOfIdealSDPPortBWReceivedAfterUrgLatency / 100.0;
+	for  (i = 0; i < DC__VOLTAGE_STATES; ++i) {
+		for  (j = 0; j <= 1; ++j) {
+			double PixelDCFCLKCyclesRequiredInPrefetch[DC__NUM_DPP__MAX];
+			double PrefetchPixelLinesTime[DC__NUM_DPP__MAX];
+			double DCFCLKRequiredForPeakBandwidthPerSurface[DC__NUM_DPP__MAX];
+			double DynamicMetadataVMExtraLatency[DC__NUM_DPP__MAX];
+			double MinimumTWait = 0.0;
+			double DPTEBandwidth;
+			double DCFCLKRequiredForAverageBandwidth;
+			unsigned int ExtraLatencyBytes;
+			double ExtraLatencyCycles;
+			double DCFCLKRequiredForPeakBandwidth;
+			unsigned int NoOfDPPState[DC__NUM_DPP__MAX];
+			double MinimumTvmPlus2Tr0;
+
+			TotalMaxPrefetchFlipDPTERowBandwidth[i][j] = 0;
+			for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+				TotalMaxPrefetchFlipDPTERowBandwidth[i][j] = TotalMaxPrefetchFlipDPTERowBandwidth[i][j]
+						+ NoOfDPP[i][j][k] * DPTEBytesPerRow[i][j][k]
+								/ (15.75 * HTotal[k] / PixelClock[k]);
+			}
+
+			for (k = 0; k <= NumberOfActiveSurfaces - 1; ++k)
+				NoOfDPPState[k] = NoOfDPP[i][j][k];
+
+			DPTEBandwidth = TotalMaxPrefetchFlipDPTERowBandwidth[i][j];
+			DCFCLKRequiredForAverageBandwidth = dml_max(ProjectedDCFClkDeepSleep[i][j], DPTEBandwidth / NormalEfficiency / ReturnBusWidth);
+
+			ExtraLatencyBytes = dml32_CalculateExtraLatencyBytes(ReorderingBytes,
+					TotalNumberOfActiveDPP[i][j], PixelChunkSizeInKByte,
+					TotalNumberOfDCCActiveDPP[i][j], MetaChunkSize, GPUVMEnable, HostVMEnable,
+					NumberOfActiveSurfaces, NoOfDPPState, dpte_group_bytes, 1, HostVMMinPageSize,
+					HostVMMaxNonCachedPageTableLevels);
+			ExtraLatencyCycles = RoundTripPingLatencyCycles + __DML_ARB_TO_RET_DELAY__
+					+ ExtraLatencyBytes / NormalEfficiency / ReturnBusWidth;
+			for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+				double DCFCLKCyclesRequiredInPrefetch;
+				double PrefetchTime;
+
+				PixelDCFCLKCyclesRequiredInPrefetch[k] = (PrefetchLinesY[i][j][k]
+						* swath_width_luma_ub_all_states[i][j][k] * BytePerPixelY[k]
+						+ PrefetchLinesC[i][j][k] * swath_width_chroma_ub_all_states[i][j][k]
+								* BytePerPixelC[k]) / NormalEfficiency
+						/ ReturnBusWidth;
+				DCFCLKCyclesRequiredInPrefetch = 2 * ExtraLatencyCycles / NoOfDPPState[k]
+						+ PDEAndMetaPTEBytesPerFrame[i][j][k] / NormalEfficiency
+								/ NormalEfficiency / ReturnBusWidth
+								* (GPUVMMaxPageTableLevels > 2 ? 1 : 0)
+						+ 2 * DPTEBytesPerRow[i][j][k] / NormalEfficiency / NormalEfficiency
+								/ ReturnBusWidth
+						+ 2 * MetaRowBytes[i][j][k] / NormalEfficiency / ReturnBusWidth
+						+ PixelDCFCLKCyclesRequiredInPrefetch[k];
+				PrefetchPixelLinesTime[k] = dml_max(PrefetchLinesY[i][j][k], PrefetchLinesC[i][j][k])
+						* HTotal[k] / PixelClock[k];
+				DynamicMetadataVMExtraLatency[k] = (GPUVMEnable == true &&
+						DynamicMetadataEnable[k] == true && DynamicMetadataVMEnabled == true) ?
+						UrgLatency[i] * GPUVMMaxPageTableLevels *
+						(HostVMEnable == true ? HostVMMaxNonCachedPageTableLevels + 1 : 1) : 0;
+
+				MinimumTWait = dml32_CalculateTWait(MaxPrefetchMode,
+						UseMALLForPStateChange[k],
+						SynchronizeDRRDisplaysForUCLKPStateChangeFinal,
+						DRRDisplay[k],
+						DRAMClockChangeLatencyFinal,
+						FCLKChangeLatency,
+						UrgLatency[i],
+						SREnterPlusExitTime);
+
+				PrefetchTime = (MaximumVStartup[i][j][k] - 1) * HTotal[k] / PixelClock[k] -
+						MinimumTWait - UrgLatency[i] *
+						((GPUVMMaxPageTableLevels <= 2 ? GPUVMMaxPageTableLevels :
+						GPUVMMaxPageTableLevels - 2) *  (HostVMEnable == true ?
+						HostVMMaxNonCachedPageTableLevels + 1 : 1) - 1) -
+						DynamicMetadataVMExtraLatency[k];
+
+				if (PrefetchTime > 0) {
+					double ExpectedVRatioPrefetch;
+
+					ExpectedVRatioPrefetch = PrefetchPixelLinesTime[k] / (PrefetchTime *
+							PixelDCFCLKCyclesRequiredInPrefetch[k] /
+							DCFCLKCyclesRequiredInPrefetch);
+					DCFCLKRequiredForPeakBandwidthPerSurface[k] = NoOfDPPState[k] *
+							PixelDCFCLKCyclesRequiredInPrefetch[k] /
+							PrefetchPixelLinesTime[k] *
+							dml_max(1.0, ExpectedVRatioPrefetch) *
+							dml_max(1.0, ExpectedVRatioPrefetch / 4);
+					if (HostVMEnable == true || ImmediateFlipRequirement == true) {
+						DCFCLKRequiredForPeakBandwidthPerSurface[k] =
+								DCFCLKRequiredForPeakBandwidthPerSurface[k] +
+								NoOfDPPState[k] * DPTEBandwidth / NormalEfficiency /
+								NormalEfficiency / ReturnBusWidth;
+					}
+				} else {
+					DCFCLKRequiredForPeakBandwidthPerSurface[k] = DCFCLKPerState[i];
+				}
+				if (DynamicMetadataEnable[k] == true) {
+					double TSetupPipe;
+					double TdmbfPipe;
+					double TdmsksPipe;
+					double TdmecPipe;
+					double AllowedTimeForUrgentExtraLatency;
+
+					dml32_CalculateVUpdateAndDynamicMetadataParameters(
+							MaxInterDCNTileRepeaters,
+							RequiredDPPCLKPerSurface[i][j][k],
+							RequiredDISPCLK[i][j],
+							ProjectedDCFClkDeepSleep[i][j],
+							PixelClock[k],
+							HTotal[k],
+							VTotal[k] - VActive[k],
+							DynamicMetadataTransmittedBytes[k],
+							DynamicMetadataLinesBeforeActiveRequired[k],
+							Interlace[k],
+							ProgressiveToInterlaceUnitInOPP,
+
+							/* output */
+							&TSetupPipe,
+							&TdmbfPipe,
+							&TdmecPipe,
+							&TdmsksPipe,
+							&dummy1,
+							&dummy2,
+							&dummy3);
+					AllowedTimeForUrgentExtraLatency = MaximumVStartup[i][j][k] * HTotal[k] /
+							PixelClock[k] - MinimumTWait - TSetupPipe - TdmbfPipe -
+							TdmecPipe - TdmsksPipe - DynamicMetadataVMExtraLatency[k];
+					if (AllowedTimeForUrgentExtraLatency > 0)
+						DCFCLKRequiredForPeakBandwidthPerSurface[k] =
+								dml_max(DCFCLKRequiredForPeakBandwidthPerSurface[k],
+								ExtraLatencyCycles / AllowedTimeForUrgentExtraLatency);
+					else
+						DCFCLKRequiredForPeakBandwidthPerSurface[k] = DCFCLKPerState[i];
+				}
+			}
+			DCFCLKRequiredForPeakBandwidth = 0;
+			for (k = 0; k <= NumberOfActiveSurfaces - 1; ++k) {
+				DCFCLKRequiredForPeakBandwidth = DCFCLKRequiredForPeakBandwidth +
+						DCFCLKRequiredForPeakBandwidthPerSurface[k];
+			}
+			MinimumTvmPlus2Tr0 = UrgLatency[i] * (GPUVMEnable == true ?
+					(HostVMEnable == true ? (GPUVMMaxPageTableLevels + 2) *
+					(HostVMMaxNonCachedPageTableLevels + 1) - 1 : GPUVMMaxPageTableLevels + 1) : 0);
+			for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+				double MaximumTvmPlus2Tr0PlusTsw;
+
+				MaximumTvmPlus2Tr0PlusTsw = (MaximumVStartup[i][j][k] - 2) * HTotal[k] /
+						PixelClock[k] - MinimumTWait - DynamicMetadataVMExtraLatency[k];
+				if (MaximumTvmPlus2Tr0PlusTsw <= MinimumTvmPlus2Tr0 + PrefetchPixelLinesTime[k] / 4) {
+					DCFCLKRequiredForPeakBandwidth = DCFCLKPerState[i];
+				} else {
+					DCFCLKRequiredForPeakBandwidth = dml_max3(DCFCLKRequiredForPeakBandwidth,
+							2 * ExtraLatencyCycles / (MaximumTvmPlus2Tr0PlusTsw -
+								MinimumTvmPlus2Tr0 -
+								PrefetchPixelLinesTime[k] / 4),
+							(2 * ExtraLatencyCycles +
+								PixelDCFCLKCyclesRequiredInPrefetch[k]) /
+								(MaximumTvmPlus2Tr0PlusTsw - MinimumTvmPlus2Tr0));
+				}
+			}
+			DCFCLKState[i][j] = dml_min(DCFCLKPerState[i], 1.05 *
+					dml_max(DCFCLKRequiredForAverageBandwidth, DCFCLKRequiredForPeakBandwidth));
+		}
+	}
+}
+
+unsigned int dml32_CalculateExtraLatencyBytes(unsigned int ReorderingBytes,
+		unsigned int TotalNumberOfActiveDPP,
+		unsigned int PixelChunkSizeInKByte,
+		unsigned int TotalNumberOfDCCActiveDPP,
+		unsigned int MetaChunkSize,
+		bool GPUVMEnable,
+		bool HostVMEnable,
+		unsigned int NumberOfActiveSurfaces,
+		unsigned int NumberOfDPP[],
+		unsigned int dpte_group_bytes[],
+		double HostVMInefficiencyFactor,
+		double HostVMMinPageSize,
+		unsigned int HostVMMaxNonCachedPageTableLevels)
+{
+	unsigned int k;
+	double   ret;
+	unsigned int  HostVMDynamicLevels;
+
+	if (GPUVMEnable == true && HostVMEnable == true) {
+		if (HostVMMinPageSize < 2048)
+			HostVMDynamicLevels = HostVMMaxNonCachedPageTableLevels;
+		else if (HostVMMinPageSize >= 2048 && HostVMMinPageSize < 1048576)
+			HostVMDynamicLevels = dml_max(0, (int) HostVMMaxNonCachedPageTableLevels - 1);
+		else
+			HostVMDynamicLevels = dml_max(0, (int) HostVMMaxNonCachedPageTableLevels - 2);
+	} else {
+		HostVMDynamicLevels = 0;
+	}
+
+	ret = ReorderingBytes + (TotalNumberOfActiveDPP * PixelChunkSizeInKByte +
+			TotalNumberOfDCCActiveDPP * MetaChunkSize) * 1024.0;
+
+	if (GPUVMEnable == true) {
+		for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+			ret = ret + NumberOfDPP[k] * dpte_group_bytes[k] *
+					(1 + 8 * HostVMDynamicLevels) * HostVMInefficiencyFactor;
+		}
+	}
+	return ret;
+}
+
+void dml32_CalculateVUpdateAndDynamicMetadataParameters(
+		unsigned int MaxInterDCNTileRepeaters,
+		double Dppclk,
+		double Dispclk,
+		double DCFClkDeepSleep,
+		double PixelClock,
+		unsigned int HTotal,
+		unsigned int VBlank,
+		unsigned int DynamicMetadataTransmittedBytes,
+		unsigned int DynamicMetadataLinesBeforeActiveRequired,
+		unsigned int InterlaceEnable,
+		bool ProgressiveToInterlaceUnitInOPP,
+
+		/* output */
+		double *TSetup,
+		double *Tdmbf,
+		double *Tdmec,
+		double *Tdmsks,
+		unsigned int *VUpdateOffsetPix,
+		double *VUpdateWidthPix,
+		double *VReadyOffsetPix)
+{
+	double TotalRepeaterDelayTime;
+
+	TotalRepeaterDelayTime = MaxInterDCNTileRepeaters * (2 / Dppclk + 3 / Dispclk);
+	*VUpdateWidthPix  =
+			dml_ceil((14.0 / DCFClkDeepSleep + 12.0 / Dppclk + TotalRepeaterDelayTime) * PixelClock, 1.0);
+	*VReadyOffsetPix  = dml_ceil(dml_max(150.0 / Dppclk,
+			TotalRepeaterDelayTime + 20.0 / DCFClkDeepSleep + 10.0 / Dppclk) * PixelClock, 1.0);
+	*VUpdateOffsetPix = dml_ceil(HTotal / 4.0, 1.0);
+	*TSetup = (*VUpdateOffsetPix + *VUpdateWidthPix + *VReadyOffsetPix) / PixelClock;
+	*Tdmbf = DynamicMetadataTransmittedBytes / 4.0 / Dispclk;
+	*Tdmec = HTotal / PixelClock;
+
+	if (DynamicMetadataLinesBeforeActiveRequired == 0)
+		*Tdmsks = VBlank * HTotal / PixelClock / 2.0;
+	else
+		*Tdmsks = DynamicMetadataLinesBeforeActiveRequired * HTotal / PixelClock;
+
+	if (InterlaceEnable == 1 && ProgressiveToInterlaceUnitInOPP == false)
+		*Tdmsks = *Tdmsks / 2;
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: VUpdateWidthPix = %d\n", __func__, *VUpdateWidthPix);
+	dml_print("DML::%s: VReadyOffsetPix = %d\n", __func__, *VReadyOffsetPix);
+	dml_print("DML::%s: VUpdateOffsetPix = %d\n", __func__, *VUpdateOffsetPix);
+
+	dml_print("DML::%s: DynamicMetadataLinesBeforeActiveRequired = %d\n",
+			__func__, DynamicMetadataLinesBeforeActiveRequired);
+	dml_print("DML::%s: VBlank = %d\n", __func__, VBlank);
+	dml_print("DML::%s: HTotal = %d\n", __func__, HTotal);
+	dml_print("DML::%s: PixelClock = %f\n", __func__, PixelClock);
+	dml_print("DML::%s: Tdmsks = %f\n", __func__, *Tdmsks);
+#endif
+}
+
+double dml32_CalculateTWait(
+		unsigned int PrefetchMode,
+		enum dm_use_mall_for_pstate_change_mode UseMALLForPStateChange,
+		bool SynchronizeDRRDisplaysForUCLKPStateChangeFinal,
+		bool DRRDisplay,
+		double DRAMClockChangeLatency,
+		double FCLKChangeLatency,
+		double UrgentLatency,
+		double SREnterPlusExitTime)
+{
+	double TWait = 0.0;
+
+	if (PrefetchMode == 0 &&
+			!(UseMALLForPStateChange == dm_use_mall_pstate_change_full_frame) &&
+			!(UseMALLForPStateChange == dm_use_mall_pstate_change_sub_viewport) &&
+			!(UseMALLForPStateChange == dm_use_mall_pstate_change_phantom_pipe) &&
+			!(SynchronizeDRRDisplaysForUCLKPStateChangeFinal && DRRDisplay)) {
+		TWait = dml_max3(DRAMClockChangeLatency + UrgentLatency, SREnterPlusExitTime, UrgentLatency);
+	} else if (PrefetchMode <= 1 && !(UseMALLForPStateChange == dm_use_mall_pstate_change_phantom_pipe)) {
+		TWait = dml_max3(FCLKChangeLatency + UrgentLatency, SREnterPlusExitTime, UrgentLatency);
+	} else if (PrefetchMode <= 2 && !(UseMALLForPStateChange == dm_use_mall_pstate_change_phantom_pipe)) {
+		TWait = dml_max(SREnterPlusExitTime, UrgentLatency);
+	} else {
+		TWait = UrgentLatency;
+	}
+
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: PrefetchMode = %d\n", __func__, PrefetchMode);
+	dml_print("DML::%s: TWait = %f\n", __func__, TWait);
+#endif
+	return TWait;
+} // CalculateTWait
+
+// Function: get_return_bw_mbps
+// Megabyte per second
+double dml32_get_return_bw_mbps(const soc_bounding_box_st *soc,
+		const int VoltageLevel,
+		const bool HostVMEnable,
+		const double DCFCLK,
+		const double FabricClock,
+		const double DRAMSpeed)
+{
+	double ReturnBW = 0.;
+	double IdealSDPPortBandwidth    = soc->return_bus_width_bytes /*mode_lib->vba.ReturnBusWidth*/ * DCFCLK;
+	double IdealFabricBandwidth     = FabricClock * soc->fabric_datapath_to_dcn_data_return_bytes;
+	double IdealDRAMBandwidth       = DRAMSpeed * soc->num_chans * soc->dram_channel_width_bytes;
+	double PixelDataOnlyReturnBW    = dml_min3(IdealSDPPortBandwidth * soc->pct_ideal_sdp_bw_after_urgent / 100,
+			IdealFabricBandwidth * soc->pct_ideal_fabric_bw_after_urgent / 100,
+			IdealDRAMBandwidth * (VoltageLevel < 2 ? soc->pct_ideal_dram_bw_after_urgent_strobe  :
+					soc->pct_ideal_dram_sdp_bw_after_urgent_pixel_only) / 100);
+	double PixelMixedWithVMDataReturnBW = dml_min3(IdealSDPPortBandwidth * soc->pct_ideal_sdp_bw_after_urgent / 100,
+			IdealFabricBandwidth * soc->pct_ideal_fabric_bw_after_urgent / 100,
+			IdealDRAMBandwidth * (VoltageLevel < 2 ? soc->pct_ideal_dram_bw_after_urgent_strobe :
+					soc->pct_ideal_dram_sdp_bw_after_urgent_pixel_only) / 100);
+
+	if (HostVMEnable != true)
+		ReturnBW = PixelDataOnlyReturnBW;
+	else
+		ReturnBW = PixelMixedWithVMDataReturnBW;
+
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: VoltageLevel = %d\n", __func__, VoltageLevel);
+	dml_print("DML::%s: HostVMEnable = %d\n", __func__, HostVMEnable);
+	dml_print("DML::%s: DCFCLK       = %f\n", __func__, DCFCLK);
+	dml_print("DML::%s: FabricClock  = %f\n", __func__, FabricClock);
+	dml_print("DML::%s: DRAMSpeed    = %f\n", __func__, DRAMSpeed);
+	dml_print("DML::%s: IdealSDPPortBandwidth        = %f\n", __func__, IdealSDPPortBandwidth);
+	dml_print("DML::%s: IdealFabricBandwidth         = %f\n", __func__, IdealFabricBandwidth);
+	dml_print("DML::%s: IdealDRAMBandwidth           = %f\n", __func__, IdealDRAMBandwidth);
+	dml_print("DML::%s: PixelDataOnlyReturnBW        = %f\n", __func__, PixelDataOnlyReturnBW);
+	dml_print("DML::%s: PixelMixedWithVMDataReturnBW = %f\n", __func__, PixelMixedWithVMDataReturnBW);
+	dml_print("DML::%s: ReturnBW                     = %f MBps\n", __func__, ReturnBW);
+#endif
+	return ReturnBW;
+}
+
+// Function: get_return_bw_mbps_vm_only
+// Megabyte per second
+double dml32_get_return_bw_mbps_vm_only(const soc_bounding_box_st *soc,
+		const int VoltageLevel,
+		const double DCFCLK,
+		const double FabricClock,
+		const double DRAMSpeed)
+{
+	double VMDataOnlyReturnBW = dml_min3(
+			soc->return_bus_width_bytes * DCFCLK * soc->pct_ideal_sdp_bw_after_urgent / 100.0,
+			FabricClock * soc->fabric_datapath_to_dcn_data_return_bytes
+					* soc->pct_ideal_sdp_bw_after_urgent / 100.0,
+			DRAMSpeed * soc->num_chans * soc->dram_channel_width_bytes
+					* (VoltageLevel < 2 ?
+							soc->pct_ideal_dram_bw_after_urgent_strobe :
+							soc->pct_ideal_dram_sdp_bw_after_urgent_vm_only) / 100.0);
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: VoltageLevel = %d\n", __func__, VoltageLevel);
+	dml_print("DML::%s: DCFCLK       = %f\n", __func__, DCFCLK);
+	dml_print("DML::%s: FabricClock  = %f\n", __func__, FabricClock);
+	dml_print("DML::%s: DRAMSpeed    = %f\n", __func__, DRAMSpeed);
+	dml_print("DML::%s: VMDataOnlyReturnBW = %f\n", __func__, VMDataOnlyReturnBW);
+#endif
+	return VMDataOnlyReturnBW;
+}
+
+double dml32_CalculateExtraLatency(
+		unsigned int RoundTripPingLatencyCycles,
+		unsigned int ReorderingBytes,
+		double DCFCLK,
+		unsigned int TotalNumberOfActiveDPP,
+		unsigned int PixelChunkSizeInKByte,
+		unsigned int TotalNumberOfDCCActiveDPP,
+		unsigned int MetaChunkSize,
+		double ReturnBW,
+		bool GPUVMEnable,
+		bool HostVMEnable,
+		unsigned int NumberOfActiveSurfaces,
+		unsigned int NumberOfDPP[],
+		unsigned int dpte_group_bytes[],
+		double HostVMInefficiencyFactor,
+		double HostVMMinPageSize,
+		unsigned int HostVMMaxNonCachedPageTableLevels)
+{
+	double ExtraLatencyBytes;
+	double ExtraLatency;
+
+	ExtraLatencyBytes = dml32_CalculateExtraLatencyBytes(
+			ReorderingBytes,
+			TotalNumberOfActiveDPP,
+			PixelChunkSizeInKByte,
+			TotalNumberOfDCCActiveDPP,
+			MetaChunkSize,
+			GPUVMEnable,
+			HostVMEnable,
+			NumberOfActiveSurfaces,
+			NumberOfDPP,
+			dpte_group_bytes,
+			HostVMInefficiencyFactor,
+			HostVMMinPageSize,
+			HostVMMaxNonCachedPageTableLevels);
+
+	ExtraLatency = (RoundTripPingLatencyCycles + __DML_ARB_TO_RET_DELAY__) / DCFCLK + ExtraLatencyBytes / ReturnBW;
+
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: RoundTripPingLatencyCycles=%d\n", __func__, RoundTripPingLatencyCycles);
+	dml_print("DML::%s: DCFCLK=%f\n", __func__, DCFCLK);
+	dml_print("DML::%s: ExtraLatencyBytes=%f\n", __func__, ExtraLatencyBytes);
+	dml_print("DML::%s: ReturnBW=%f\n", __func__, ReturnBW);
+	dml_print("DML::%s: ExtraLatency=%f\n", __func__, ExtraLatency);
+#endif
+
+	return ExtraLatency;
+} // CalculateExtraLatency
+
+bool dml32_CalculatePrefetchSchedule(
+		double HostVMInefficiencyFactor,
+		DmlPipe *myPipe,
+		unsigned int DSCDelay,
+		double DPPCLKDelaySubtotalPlusCNVCFormater,
+		double DPPCLKDelaySCL,
+		double DPPCLKDelaySCLLBOnly,
+		double DPPCLKDelayCNVCCursor,
+		double DISPCLKDelaySubtotal,
+		unsigned int DPP_RECOUT_WIDTH,
+		enum output_format_class OutputFormat,
+		unsigned int MaxInterDCNTileRepeaters,
+		unsigned int VStartup,
+		unsigned int MaxVStartup,
+		unsigned int GPUVMPageTableLevels,
+		bool GPUVMEnable,
+		bool HostVMEnable,
+		unsigned int HostVMMaxNonCachedPageTableLevels,
+		double HostVMMinPageSize,
+		bool DynamicMetadataEnable,
+		bool DynamicMetadataVMEnabled,
+		int DynamicMetadataLinesBeforeActiveRequired,
+		unsigned int DynamicMetadataTransmittedBytes,
+		double UrgentLatency,
+		double UrgentExtraLatency,
+		double TCalc,
+		unsigned int PDEAndMetaPTEBytesFrame,
+		unsigned int MetaRowByte,
+		unsigned int PixelPTEBytesPerRow,
+		double PrefetchSourceLinesY,
+		unsigned int SwathWidthY,
+		unsigned int VInitPreFillY,
+		unsigned int MaxNumSwathY,
+		double PrefetchSourceLinesC,
+		unsigned int SwathWidthC,
+		unsigned int VInitPreFillC,
+		unsigned int MaxNumSwathC,
+		unsigned int swath_width_luma_ub,
+		unsigned int swath_width_chroma_ub,
+		unsigned int SwathHeightY,
+		unsigned int SwathHeightC,
+		double TWait,
+		/* Output */
+		double   *DSTXAfterScaler,
+		double   *DSTYAfterScaler,
+		double *DestinationLinesForPrefetch,
+		double *PrefetchBandwidth,
+		double *DestinationLinesToRequestVMInVBlank,
+		double *DestinationLinesToRequestRowInVBlank,
+		double *VRatioPrefetchY,
+		double *VRatioPrefetchC,
+		double *RequiredPrefetchPixDataBWLuma,
+		double *RequiredPrefetchPixDataBWChroma,
+		bool   *NotEnoughTimeForDynamicMetadata,
+		double *Tno_bw,
+		double *prefetch_vmrow_bw,
+		double *Tdmdl_vm,
+		double *Tdmdl,
+		double *TSetup,
+		unsigned int   *VUpdateOffsetPix,
+		double   *VUpdateWidthPix,
+		double   *VReadyOffsetPix)
+{
+	bool MyError = false;
+	unsigned int DPPCycles, DISPCLKCycles;
+	double DSTTotalPixelsAfterScaler;
+	double LineTime;
+	double dst_y_prefetch_equ;
+	double prefetch_bw_oto;
+	double Tvm_oto;
+	double Tr0_oto;
+	double Tvm_oto_lines;
+	double Tr0_oto_lines;
+	double dst_y_prefetch_oto;
+	double TimeForFetchingMetaPTE = 0;
+	double TimeForFetchingRowInVBlank = 0;
+	double LinesToRequestPrefetchPixelData = 0;
+	unsigned int HostVMDynamicLevelsTrips;
+	double  trip_to_mem;
+	double  Tvm_trips;
+	double  Tr0_trips;
+	double  Tvm_trips_rounded;
+	double  Tr0_trips_rounded;
+	double  Lsw_oto;
+	double  Tpre_rounded;
+	double  prefetch_bw_equ;
+	double  Tvm_equ;
+	double  Tr0_equ;
+	double  Tdmbf;
+	double  Tdmec;
+	double  Tdmsks;
+	double  prefetch_sw_bytes;
+	double  bytes_pp;
+	double  dep_bytes;
+	unsigned int max_vratio_pre = __DML_MAX_VRATIO_PRE__;
+	double  min_Lsw;
+	double  Tsw_est1 = 0;
+	double  Tsw_est3 = 0;
+
+	if (GPUVMEnable == true && HostVMEnable == true)
+		HostVMDynamicLevelsTrips = HostVMMaxNonCachedPageTableLevels;
+	else
+		HostVMDynamicLevelsTrips = 0;
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: GPUVMEnable = %d\n", __func__, GPUVMEnable);
+	dml_print("DML::%s: GPUVMPageTableLevels = %d\n", __func__, GPUVMPageTableLevels);
+	dml_print("DML::%s: DCCEnable = %d\n", __func__, myPipe->DCCEnable);
+	dml_print("DML::%s: HostVMEnable=%d HostVMInefficiencyFactor=%f\n",
+			__func__, HostVMEnable, HostVMInefficiencyFactor);
+#endif
+	dml32_CalculateVUpdateAndDynamicMetadataParameters(
+			MaxInterDCNTileRepeaters,
+			myPipe->Dppclk,
+			myPipe->Dispclk,
+			myPipe->DCFClkDeepSleep,
+			myPipe->PixelClock,
+			myPipe->HTotal,
+			myPipe->VBlank,
+			DynamicMetadataTransmittedBytes,
+			DynamicMetadataLinesBeforeActiveRequired,
+			myPipe->InterlaceEnable,
+			myPipe->ProgressiveToInterlaceUnitInOPP,
+			TSetup,
+
+			/* output */
+			&Tdmbf,
+			&Tdmec,
+			&Tdmsks,
+			VUpdateOffsetPix,
+			VUpdateWidthPix,
+			VReadyOffsetPix);
+
+	LineTime = myPipe->HTotal / myPipe->PixelClock;
+	trip_to_mem = UrgentLatency;
+	Tvm_trips = UrgentExtraLatency + trip_to_mem * (GPUVMPageTableLevels * (HostVMDynamicLevelsTrips + 1) - 1);
+
+	if (DynamicMetadataVMEnabled == true)
+		*Tdmdl = TWait + Tvm_trips + trip_to_mem;
+	else
+		*Tdmdl = TWait + UrgentExtraLatency;
+
+#ifdef __DML_VBA_ALLOW_DELTA__
+	if (DynamicMetadataEnable == false)
+		*Tdmdl = 0.0;
+#endif
+
+	if (DynamicMetadataEnable == true) {
+		if (VStartup * LineTime < *TSetup + *Tdmdl + Tdmbf + Tdmec + Tdmsks) {
+			*NotEnoughTimeForDynamicMetadata = true;
+#ifdef __DML_VBA_DEBUG__
+			dml_print("DML::%s: Not Enough Time for Dynamic Meta!\n", __func__);
+			dml_print("DML::%s: Tdmbf: %fus - time for dmd transfer from dchub to dio output buffer\n",
+					__func__, Tdmbf);
+			dml_print("DML::%s: Tdmec: %fus - time dio takes to transfer dmd\n", __func__, Tdmec);
+			dml_print("DML::%s: Tdmsks: %fus - time before active dmd must complete transmission at dio\n",
+					__func__, Tdmsks);
+			dml_print("DML::%s: Tdmdl: %fus - time for fabric to become ready and fetch dmd\n",
+					__func__, *Tdmdl);
+#endif
+		} else {
+			*NotEnoughTimeForDynamicMetadata = false;
+		}
+	} else {
+		*NotEnoughTimeForDynamicMetadata = false;
+	}
+
+	*Tdmdl_vm =  (DynamicMetadataEnable == true && DynamicMetadataVMEnabled == true &&
+			GPUVMEnable == true ? TWait + Tvm_trips : 0);
+
+	if (myPipe->ScalerEnabled)
+		DPPCycles = DPPCLKDelaySubtotalPlusCNVCFormater + DPPCLKDelaySCL;
+	else
+		DPPCycles = DPPCLKDelaySubtotalPlusCNVCFormater + DPPCLKDelaySCLLBOnly;
+
+	DPPCycles = DPPCycles + myPipe->NumberOfCursors * DPPCLKDelayCNVCCursor;
+
+	DISPCLKCycles = DISPCLKDelaySubtotal;
+
+	if (myPipe->Dppclk == 0.0 || myPipe->Dispclk == 0.0)
+		return true;
+
+	*DSTXAfterScaler = DPPCycles * myPipe->PixelClock / myPipe->Dppclk + DISPCLKCycles *
+			myPipe->PixelClock / myPipe->Dispclk + DSCDelay;
+
+	*DSTXAfterScaler = *DSTXAfterScaler + (myPipe->ODMMode != dm_odm_combine_mode_disabled ? 18 : 0)
+			+ (myPipe->DPPPerSurface - 1) * DPP_RECOUT_WIDTH
+			+ ((myPipe->ODMMode == dm_odm_split_mode_1to2 || myPipe->ODMMode == dm_odm_mode_mso_1to2) ?
+					myPipe->HActive / 2 : 0)
+			+ ((myPipe->ODMMode == dm_odm_mode_mso_1to4) ? myPipe->HActive * 3 / 4 : 0);
+
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: DPPCycles: %d\n", __func__, DPPCycles);
+	dml_print("DML::%s: PixelClock: %f\n", __func__, myPipe->PixelClock);
+	dml_print("DML::%s: Dppclk: %f\n", __func__, myPipe->Dppclk);
+	dml_print("DML::%s: DISPCLKCycles: %d\n", __func__, DISPCLKCycles);
+	dml_print("DML::%s: DISPCLK: %f\n", __func__,  myPipe->Dispclk);
+	dml_print("DML::%s: DSCDelay: %d\n", __func__,  DSCDelay);
+	dml_print("DML::%s: ODMMode: %d\n", __func__,  myPipe->ODMMode);
+	dml_print("DML::%s: DPP_RECOUT_WIDTH: %d\n", __func__, DPP_RECOUT_WIDTH);
+	dml_print("DML::%s: DSTXAfterScaler: %d\n", __func__,  *DSTXAfterScaler);
+#endif
+
+	if (OutputFormat == dm_420 || (myPipe->InterlaceEnable && myPipe->ProgressiveToInterlaceUnitInOPP))
+		*DSTYAfterScaler = 1;
+	else
+		*DSTYAfterScaler = 0;
+
+	DSTTotalPixelsAfterScaler = *DSTYAfterScaler * myPipe->HTotal + *DSTXAfterScaler;
+	*DSTYAfterScaler = dml_floor(DSTTotalPixelsAfterScaler / myPipe->HTotal, 1);
+	*DSTXAfterScaler = DSTTotalPixelsAfterScaler - ((double) (*DSTYAfterScaler * myPipe->HTotal));
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: DSTXAfterScaler: %d (final)\n", __func__,  *DSTXAfterScaler);
+	dml_print("DML::%s: DSTYAfterScaler: %d (final)\n", __func__, *DSTYAfterScaler);
+#endif
+
+	MyError = false;
+
+	Tr0_trips = trip_to_mem * (HostVMDynamicLevelsTrips + 1);
+
+	if (GPUVMEnable == true) {
+		Tvm_trips_rounded = dml_ceil(4.0 * Tvm_trips / LineTime, 1.0) / 4.0 * LineTime;
+		Tr0_trips_rounded = dml_ceil(4.0 * Tr0_trips / LineTime, 1.0) / 4.0 * LineTime;
+		if (GPUVMPageTableLevels >= 3) {
+			*Tno_bw = UrgentExtraLatency + trip_to_mem *
+					(double) ((GPUVMPageTableLevels - 2) * (HostVMDynamicLevelsTrips + 1) - 1);
+		} else if (GPUVMPageTableLevels == 1 && myPipe->DCCEnable != true) {
+			Tr0_trips_rounded = dml_ceil(4.0 * UrgentExtraLatency / LineTime, 1.0) /
+					4.0 * LineTime; // VBA_ERROR
+			*Tno_bw = UrgentExtraLatency;
+		} else {
+			*Tno_bw = 0;
+		}
+	} else if (myPipe->DCCEnable == true) {
+		Tvm_trips_rounded = LineTime / 4.0;
+		Tr0_trips_rounded = dml_ceil(4.0 * Tr0_trips / LineTime, 1.0) / 4.0 * LineTime;
+		*Tno_bw = 0;
+	} else {
+		Tvm_trips_rounded = LineTime / 4.0;
+		Tr0_trips_rounded = LineTime / 2.0;
+		*Tno_bw = 0;
+	}
+	Tvm_trips_rounded = dml_max(Tvm_trips_rounded, LineTime / 4.0);
+	Tr0_trips_rounded = dml_max(Tr0_trips_rounded, LineTime / 4.0);
+
+	if (myPipe->SourcePixelFormat == dm_420_8 || myPipe->SourcePixelFormat == dm_420_10
+			|| myPipe->SourcePixelFormat == dm_420_12) {
+		bytes_pp = myPipe->BytePerPixelY + myPipe->BytePerPixelC / 4;
+	} else {
+		bytes_pp = myPipe->BytePerPixelY + myPipe->BytePerPixelC;
+	}
+
+	prefetch_sw_bytes = PrefetchSourceLinesY * swath_width_luma_ub * myPipe->BytePerPixelY
+			+ PrefetchSourceLinesC * swath_width_chroma_ub * myPipe->BytePerPixelC;
+	prefetch_bw_oto = dml_max(bytes_pp * myPipe->PixelClock / myPipe->DPPPerSurface,
+			prefetch_sw_bytes / (dml_max(PrefetchSourceLinesY, PrefetchSourceLinesC) * LineTime));
+
+	min_Lsw = dml_max(PrefetchSourceLinesY, PrefetchSourceLinesC) / max_vratio_pre;
+	min_Lsw = dml_max(min_Lsw, 1.0);
+	Lsw_oto = dml_ceil(4.0 * dml_max(prefetch_sw_bytes / prefetch_bw_oto / LineTime, min_Lsw), 1.0) / 4.0;
+
+	if (GPUVMEnable == true) {
+		Tvm_oto = dml_max3(
+				Tvm_trips,
+				*Tno_bw + PDEAndMetaPTEBytesFrame * HostVMInefficiencyFactor / prefetch_bw_oto,
+				LineTime / 4.0);
+	} else
+		Tvm_oto = LineTime / 4.0;
+
+	if ((GPUVMEnable == true || myPipe->DCCEnable == true)) {
+		Tr0_oto = dml_max4(
+				Tr0_trips,
+				(MetaRowByte + PixelPTEBytesPerRow * HostVMInefficiencyFactor) / prefetch_bw_oto,
+				(LineTime - Tvm_oto)/2.0,
+				LineTime / 4.0);
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML::%s: Tr0_oto max0 = %f\n", __func__,
+				(MetaRowByte + PixelPTEBytesPerRow * HostVMInefficiencyFactor) / prefetch_bw_oto);
+		dml_print("DML::%s: Tr0_oto max1 = %f\n", __func__, Tr0_trips);
+		dml_print("DML::%s: Tr0_oto max2 = %f\n", __func__, LineTime - Tvm_oto);
+		dml_print("DML::%s: Tr0_oto max3 = %f\n", __func__, LineTime / 4);
+#endif
+	} else
+		Tr0_oto = (LineTime - Tvm_oto) / 2.0;
+
+	Tvm_oto_lines = dml_ceil(4.0 * Tvm_oto / LineTime, 1) / 4.0;
+	Tr0_oto_lines = dml_ceil(4.0 * Tr0_oto / LineTime, 1) / 4.0;
+	dst_y_prefetch_oto = Tvm_oto_lines + 2 * Tr0_oto_lines + Lsw_oto;
+
+	dst_y_prefetch_equ = VStartup - (*TSetup + dml_max(TWait + TCalc, *Tdmdl)) / LineTime -
+			(*DSTYAfterScaler + (double) *DSTXAfterScaler / (double) myPipe->HTotal);
+
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: HTotal = %d\n", __func__, myPipe->HTotal);
+	dml_print("DML::%s: min_Lsw = %f\n", __func__, min_Lsw);
+	dml_print("DML::%s: *Tno_bw = %f\n", __func__, *Tno_bw);
+	dml_print("DML::%s: UrgentExtraLatency = %f\n", __func__, UrgentExtraLatency);
+	dml_print("DML::%s: trip_to_mem = %f\n", __func__, trip_to_mem);
+	dml_print("DML::%s: BytePerPixelY = %d\n", __func__, myPipe->BytePerPixelY);
+	dml_print("DML::%s: PrefetchSourceLinesY = %f\n", __func__, PrefetchSourceLinesY);
+	dml_print("DML::%s: swath_width_luma_ub = %d\n", __func__, swath_width_luma_ub);
+	dml_print("DML::%s: BytePerPixelC = %d\n", __func__, myPipe->BytePerPixelC);
+	dml_print("DML::%s: PrefetchSourceLinesC = %f\n", __func__, PrefetchSourceLinesC);
+	dml_print("DML::%s: swath_width_chroma_ub = %d\n", __func__, swath_width_chroma_ub);
+	dml_print("DML::%s: prefetch_sw_bytes = %f\n", __func__, prefetch_sw_bytes);
+	dml_print("DML::%s: bytes_pp = %f\n", __func__, bytes_pp);
+	dml_print("DML::%s: PDEAndMetaPTEBytesFrame = %d\n", __func__, PDEAndMetaPTEBytesFrame);
+	dml_print("DML::%s: MetaRowByte = %d\n", __func__, MetaRowByte);
+	dml_print("DML::%s: PixelPTEBytesPerRow = %d\n", __func__, PixelPTEBytesPerRow);
+	dml_print("DML::%s: HostVMInefficiencyFactor = %f\n", __func__, HostVMInefficiencyFactor);
+	dml_print("DML::%s: Tvm_trips = %f\n", __func__, Tvm_trips);
+	dml_print("DML::%s: Tr0_trips = %f\n", __func__, Tr0_trips);
+	dml_print("DML::%s: prefetch_bw_oto = %f\n", __func__, prefetch_bw_oto);
+	dml_print("DML::%s: Tr0_oto = %f\n", __func__, Tr0_oto);
+	dml_print("DML::%s: Tvm_oto = %f\n", __func__, Tvm_oto);
+	dml_print("DML::%s: Tvm_oto_lines = %f\n", __func__, Tvm_oto_lines);
+	dml_print("DML::%s: Tr0_oto_lines = %f\n", __func__, Tr0_oto_lines);
+	dml_print("DML::%s: Lsw_oto = %f\n", __func__, Lsw_oto);
+	dml_print("DML::%s: dst_y_prefetch_oto = %f\n", __func__, dst_y_prefetch_oto);
+	dml_print("DML::%s: dst_y_prefetch_equ = %f\n", __func__, dst_y_prefetch_equ);
+#endif
+
+	dst_y_prefetch_equ = dml_floor(4.0 * (dst_y_prefetch_equ + 0.125), 1) / 4.0;
+	Tpre_rounded = dst_y_prefetch_equ * LineTime;
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: dst_y_prefetch_equ: %f (after round)\n", __func__, dst_y_prefetch_equ);
+	dml_print("DML::%s: LineTime: %f\n", __func__, LineTime);
+	dml_print("DML::%s: VStartup: %d\n", __func__, VStartup);
+	dml_print("DML::%s: Tvstartup: %fus - time between vstartup and first pixel of active\n",
+			__func__, VStartup * LineTime);
+	dml_print("DML::%s: TSetup: %fus - time from vstartup to vready\n", __func__, *TSetup);
+	dml_print("DML::%s: TCalc: %fus - time for calculations in dchub starting at vready\n", __func__, TCalc);
+	dml_print("DML::%s: Tdmbf: %fus - time for dmd transfer from dchub to dio output buffer\n", __func__, Tdmbf);
+	dml_print("DML::%s: Tdmec: %fus - time dio takes to transfer dmd\n", __func__, Tdmec);
+	dml_print("DML::%s: Tdmdl_vm: %fus - time for vm stages of dmd\n", __func__, *Tdmdl_vm);
+	dml_print("DML::%s: Tdmdl: %fus - time for fabric to become ready and fetch dmd\n", __func__, *Tdmdl);
+	dml_print("DML::%s: DSTYAfterScaler: %d lines - number of lines of pipeline and buffer delay after scaler\n",
+			__func__, *DSTYAfterScaler);
+#endif
+	dep_bytes = dml_max(PDEAndMetaPTEBytesFrame * HostVMInefficiencyFactor,
+			MetaRowByte + PixelPTEBytesPerRow * HostVMInefficiencyFactor);
+
+	if (prefetch_sw_bytes < dep_bytes)
+		prefetch_sw_bytes = 2 * dep_bytes;
+
+	*PrefetchBandwidth = 0;
+	*DestinationLinesToRequestVMInVBlank = 0;
+	*DestinationLinesToRequestRowInVBlank = 0;
+	*VRatioPrefetchY = 0;
+	*VRatioPrefetchC = 0;
+	*RequiredPrefetchPixDataBWLuma = 0;
+	if (dst_y_prefetch_equ > 1) {
+		double PrefetchBandwidth1;
+		double PrefetchBandwidth2;
+		double PrefetchBandwidth3;
+		double PrefetchBandwidth4;
+
+		if (Tpre_rounded - *Tno_bw > 0) {
+			PrefetchBandwidth1 = (PDEAndMetaPTEBytesFrame * HostVMInefficiencyFactor + 2 * MetaRowByte
+					+ 2 * PixelPTEBytesPerRow * HostVMInefficiencyFactor
+					+ prefetch_sw_bytes) / (Tpre_rounded - *Tno_bw);
+			Tsw_est1 = prefetch_sw_bytes / PrefetchBandwidth1;
+		} else
+			PrefetchBandwidth1 = 0;
+
+		if (VStartup == MaxVStartup && (Tsw_est1 / LineTime < min_Lsw)
+				&& Tpre_rounded - min_Lsw * LineTime - 0.75 * LineTime - *Tno_bw > 0) {
+			PrefetchBandwidth1 = (PDEAndMetaPTEBytesFrame * HostVMInefficiencyFactor + 2 * MetaRowByte
+					+ 2 * PixelPTEBytesPerRow * HostVMInefficiencyFactor)
+					/ (Tpre_rounded - min_Lsw * LineTime - 0.75 * LineTime - *Tno_bw);
+		}
+
+		if (Tpre_rounded - *Tno_bw - 2 * Tr0_trips_rounded > 0)
+			PrefetchBandwidth2 = (PDEAndMetaPTEBytesFrame * HostVMInefficiencyFactor + prefetch_sw_bytes) /
+			(Tpre_rounded - *Tno_bw - 2 * Tr0_trips_rounded);
+		else
+			PrefetchBandwidth2 = 0;
+
+		if (Tpre_rounded - Tvm_trips_rounded > 0) {
+			PrefetchBandwidth3 = (2 * MetaRowByte + 2 * PixelPTEBytesPerRow * HostVMInefficiencyFactor
+					+ prefetch_sw_bytes) / (Tpre_rounded - Tvm_trips_rounded);
+			Tsw_est3 = prefetch_sw_bytes / PrefetchBandwidth3;
+		} else
+			PrefetchBandwidth3 = 0;
+
+
+		if (VStartup == MaxVStartup &&
+				(Tsw_est3 / LineTime < min_Lsw) && Tpre_rounded - min_Lsw * LineTime - 0.75 *
+				LineTime - Tvm_trips_rounded > 0) {
+			PrefetchBandwidth3 = (2 * MetaRowByte + 2 * PixelPTEBytesPerRow * HostVMInefficiencyFactor)
+					/ (Tpre_rounded - min_Lsw * LineTime - 0.75 * LineTime - Tvm_trips_rounded);
+		}
+
+		if (Tpre_rounded - Tvm_trips_rounded - 2 * Tr0_trips_rounded > 0) {
+			PrefetchBandwidth4 = prefetch_sw_bytes /
+					(Tpre_rounded - Tvm_trips_rounded - 2 * Tr0_trips_rounded);
+		} else {
+			PrefetchBandwidth4 = 0;
+		}
+
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML::%s: Tpre_rounded: %f\n", __func__, Tpre_rounded);
+		dml_print("DML::%s: Tno_bw: %f\n", __func__, *Tno_bw);
+		dml_print("DML::%s: Tvm_trips_rounded: %f\n", __func__, Tvm_trips_rounded);
+		dml_print("DML::%s: Tsw_est1: %f\n", __func__, Tsw_est1);
+		dml_print("DML::%s: Tsw_est3: %f\n", __func__, Tsw_est3);
+		dml_print("DML::%s: PrefetchBandwidth1: %f\n", __func__, PrefetchBandwidth1);
+		dml_print("DML::%s: PrefetchBandwidth2: %f\n", __func__, PrefetchBandwidth2);
+		dml_print("DML::%s: PrefetchBandwidth3: %f\n", __func__, PrefetchBandwidth3);
+		dml_print("DML::%s: PrefetchBandwidth4: %f\n", __func__, PrefetchBandwidth4);
+#endif
+		{
+			bool Case1OK;
+			bool Case2OK;
+			bool Case3OK;
+
+			if (PrefetchBandwidth1 > 0) {
+				if (*Tno_bw + PDEAndMetaPTEBytesFrame * HostVMInefficiencyFactor / PrefetchBandwidth1
+						>= Tvm_trips_rounded
+						&& (MetaRowByte + PixelPTEBytesPerRow * HostVMInefficiencyFactor)
+								/ PrefetchBandwidth1 >= Tr0_trips_rounded) {
+					Case1OK = true;
+				} else {
+					Case1OK = false;
+				}
+			} else {
+				Case1OK = false;
+			}
+
+			if (PrefetchBandwidth2 > 0) {
+				if (*Tno_bw + PDEAndMetaPTEBytesFrame * HostVMInefficiencyFactor / PrefetchBandwidth2
+						>= Tvm_trips_rounded
+						&& (MetaRowByte + PixelPTEBytesPerRow * HostVMInefficiencyFactor)
+						/ PrefetchBandwidth2 < Tr0_trips_rounded) {
+					Case2OK = true;
+				} else {
+					Case2OK = false;
+				}
+			} else {
+				Case2OK = false;
+			}
+
+			if (PrefetchBandwidth3 > 0) {
+				if (*Tno_bw + PDEAndMetaPTEBytesFrame * HostVMInefficiencyFactor / PrefetchBandwidth3 <
+						Tvm_trips_rounded && (MetaRowByte + PixelPTEBytesPerRow *
+								HostVMInefficiencyFactor) / PrefetchBandwidth3 >=
+								Tr0_trips_rounded) {
+					Case3OK = true;
+				} else {
+					Case3OK = false;
+				}
+			} else {
+				Case3OK = false;
+			}
+
+			if (Case1OK)
+				prefetch_bw_equ = PrefetchBandwidth1;
+			else if (Case2OK)
+				prefetch_bw_equ = PrefetchBandwidth2;
+			else if (Case3OK)
+				prefetch_bw_equ = PrefetchBandwidth3;
+			else
+				prefetch_bw_equ = PrefetchBandwidth4;
+
+#ifdef __DML_VBA_DEBUG__
+			dml_print("DML::%s: Case1OK: %d\n", __func__, Case1OK);
+			dml_print("DML::%s: Case2OK: %d\n", __func__, Case2OK);
+			dml_print("DML::%s: Case3OK: %d\n", __func__, Case3OK);
+			dml_print("DML::%s: prefetch_bw_equ: %f\n", __func__, prefetch_bw_equ);
+#endif
+
+			if (prefetch_bw_equ > 0) {
+				if (GPUVMEnable == true) {
+					Tvm_equ = dml_max3(*Tno_bw + PDEAndMetaPTEBytesFrame *
+							HostVMInefficiencyFactor / prefetch_bw_equ,
+							Tvm_trips, LineTime / 4);
+				} else {
+					Tvm_equ = LineTime / 4;
+				}
+
+				if ((GPUVMEnable == true || myPipe->DCCEnable == true)) {
+					Tr0_equ = dml_max4((MetaRowByte + PixelPTEBytesPerRow *
+							HostVMInefficiencyFactor) / prefetch_bw_equ, Tr0_trips,
+							(LineTime - Tvm_equ) / 2, LineTime / 4);
+				} else {
+					Tr0_equ = (LineTime - Tvm_equ) / 2;
+				}
+			} else {
+				Tvm_equ = 0;
+				Tr0_equ = 0;
+#ifdef __DML_VBA_DEBUG__
+				dml_print("DML: prefetch_bw_equ equals 0! %s:%d\n", __FILE__, __LINE__);
+#endif
+			}
+		}
+
+		if (dst_y_prefetch_oto < dst_y_prefetch_equ) {
+			*DestinationLinesForPrefetch = dst_y_prefetch_oto;
+			TimeForFetchingMetaPTE = Tvm_oto;
+			TimeForFetchingRowInVBlank = Tr0_oto;
+			*PrefetchBandwidth = prefetch_bw_oto;
+		} else {
+			*DestinationLinesForPrefetch = dst_y_prefetch_equ;
+			TimeForFetchingMetaPTE = Tvm_equ;
+			TimeForFetchingRowInVBlank = Tr0_equ;
+			*PrefetchBandwidth = prefetch_bw_equ;
+		}
+
+		*DestinationLinesToRequestVMInVBlank = dml_ceil(4.0 * TimeForFetchingMetaPTE / LineTime, 1.0) / 4.0;
+
+		*DestinationLinesToRequestRowInVBlank =
+				dml_ceil(4.0 * TimeForFetchingRowInVBlank / LineTime, 1.0) / 4.0;
+
+		LinesToRequestPrefetchPixelData = *DestinationLinesForPrefetch -
+				*DestinationLinesToRequestVMInVBlank - 2 * *DestinationLinesToRequestRowInVBlank;
+
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML::%s: DestinationLinesForPrefetch = %f\n", __func__, *DestinationLinesForPrefetch);
+		dml_print("DML::%s: DestinationLinesToRequestVMInVBlank = %f\n",
+				__func__, *DestinationLinesToRequestVMInVBlank);
+		dml_print("DML::%s: TimeForFetchingRowInVBlank = %f\n", __func__, TimeForFetchingRowInVBlank);
+		dml_print("DML::%s: LineTime = %f\n", __func__, LineTime);
+		dml_print("DML::%s: DestinationLinesToRequestRowInVBlank = %f\n",
+				__func__, *DestinationLinesToRequestRowInVBlank);
+		dml_print("DML::%s: PrefetchSourceLinesY = %f\n", __func__, PrefetchSourceLinesY);
+		dml_print("DML::%s: LinesToRequestPrefetchPixelData = %f\n", __func__, LinesToRequestPrefetchPixelData);
+#endif
+
+		if (LinesToRequestPrefetchPixelData >= 1 && prefetch_bw_equ > 0) {
+			*VRatioPrefetchY = (double) PrefetchSourceLinesY / LinesToRequestPrefetchPixelData;
+			*VRatioPrefetchY = dml_max(*VRatioPrefetchY, 1.0);
+#ifdef __DML_VBA_DEBUG__
+			dml_print("DML::%s: VRatioPrefetchY = %f\n", __func__, *VRatioPrefetchY);
+			dml_print("DML::%s: SwathHeightY = %d\n", __func__, SwathHeightY);
+			dml_print("DML::%s: VInitPreFillY = %d\n", __func__, VInitPreFillY);
+#endif
+			if ((SwathHeightY > 4) && (VInitPreFillY > 3)) {
+				if (LinesToRequestPrefetchPixelData > (VInitPreFillY - 3.0) / 2.0) {
+					*VRatioPrefetchY =
+							dml_max((double) PrefetchSourceLinesY /
+									LinesToRequestPrefetchPixelData,
+									(double) MaxNumSwathY * SwathHeightY /
+									(LinesToRequestPrefetchPixelData -
+									(VInitPreFillY - 3.0) / 2.0));
+					*VRatioPrefetchY = dml_max(*VRatioPrefetchY, 1.0);
+				} else {
+					MyError = true;
+					*VRatioPrefetchY = 0;
+				}
+#ifdef __DML_VBA_DEBUG__
+				dml_print("DML::%s: VRatioPrefetchY = %f\n", __func__, *VRatioPrefetchY);
+				dml_print("DML::%s: PrefetchSourceLinesY = %f\n", __func__, PrefetchSourceLinesY);
+				dml_print("DML::%s: MaxNumSwathY = %d\n", __func__, MaxNumSwathY);
+#endif
+			}
+
+			*VRatioPrefetchC = (double) PrefetchSourceLinesC / LinesToRequestPrefetchPixelData;
+			*VRatioPrefetchC = dml_max(*VRatioPrefetchC, 1.0);
+
+#ifdef __DML_VBA_DEBUG__
+			dml_print("DML::%s: VRatioPrefetchC = %f\n", __func__, *VRatioPrefetchC);
+			dml_print("DML::%s: SwathHeightC = %d\n", __func__, SwathHeightC);
+			dml_print("DML::%s: VInitPreFillC = %d\n", __func__, VInitPreFillC);
+#endif
+			if ((SwathHeightC > 4)) {
+				if (LinesToRequestPrefetchPixelData > (VInitPreFillC - 3.0) / 2.0) {
+					*VRatioPrefetchC =
+						dml_max(*VRatioPrefetchC,
+							(double) MaxNumSwathC * SwathHeightC /
+							(LinesToRequestPrefetchPixelData -
+							(VInitPreFillC - 3.0) / 2.0));
+					*VRatioPrefetchC = dml_max(*VRatioPrefetchC, 1.0);
+				} else {
+					MyError = true;
+					*VRatioPrefetchC = 0;
+				}
+#ifdef __DML_VBA_DEBUG__
+				dml_print("DML::%s: VRatioPrefetchC = %f\n", __func__, *VRatioPrefetchC);
+				dml_print("DML::%s: PrefetchSourceLinesC = %f\n", __func__, PrefetchSourceLinesC);
+				dml_print("DML::%s: MaxNumSwathC = %d\n", __func__, MaxNumSwathC);
+#endif
+			}
+
+			*RequiredPrefetchPixDataBWLuma = (double) PrefetchSourceLinesY
+					/ LinesToRequestPrefetchPixelData * myPipe->BytePerPixelY * swath_width_luma_ub
+					/ LineTime;
+
+#ifdef __DML_VBA_DEBUG__
+			dml_print("DML::%s: BytePerPixelY = %d\n", __func__, myPipe->BytePerPixelY);
+			dml_print("DML::%s: swath_width_luma_ub = %d\n", __func__, swath_width_luma_ub);
+			dml_print("DML::%s: LineTime = %f\n", __func__, LineTime);
+			dml_print("DML::%s: RequiredPrefetchPixDataBWLuma = %f\n",
+					__func__, *RequiredPrefetchPixDataBWLuma);
+#endif
+			*RequiredPrefetchPixDataBWChroma = (double) PrefetchSourceLinesC /
+					LinesToRequestPrefetchPixelData
+					* myPipe->BytePerPixelC
+					* swath_width_chroma_ub / LineTime;
+		} else {
+			MyError = true;
+#ifdef __DML_VBA_DEBUG__
+			dml_print("DML:%s: MyErr set. LinesToRequestPrefetchPixelData: %f, should be > 0\n",
+					__func__, LinesToRequestPrefetchPixelData);
+#endif
+			*VRatioPrefetchY = 0;
+			*VRatioPrefetchC = 0;
+			*RequiredPrefetchPixDataBWLuma = 0;
+			*RequiredPrefetchPixDataBWChroma = 0;
+		}
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML: Tpre: %fus - sum of time to request meta pte, 2 x data pte + meta data, swaths\n",
+			(double)LinesToRequestPrefetchPixelData * LineTime +
+			2.0*TimeForFetchingRowInVBlank + TimeForFetchingMetaPTE);
+		dml_print("DML:  Tvm: %fus - time to fetch page tables for meta surface\n", TimeForFetchingMetaPTE);
+		dml_print("DML: To: %fus - time for propagation from scaler to optc\n",
+			(*DSTYAfterScaler + ((double) (*DSTXAfterScaler) / (double) myPipe->HTotal)) * LineTime);
+		dml_print("DML: Tvstartup - TSetup - Tcalc - Twait - Tpre - To > 0\n");
+		dml_print("DML: Tslack(pre): %fus - time left over in schedule\n", VStartup * LineTime -
+			TimeForFetchingMetaPTE - 2*TimeForFetchingRowInVBlank - (*DSTYAfterScaler +
+			((double) (*DSTXAfterScaler) / (double) myPipe->HTotal)) * LineTime - TWait - TCalc - *TSetup);
+		dml_print("DML: row_bytes = dpte_row_bytes (per_pipe) = PixelPTEBytesPerRow = : %d\n",
+				PixelPTEBytesPerRow);
+#endif
+	} else {
+		MyError = true;
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML::%s: MyErr set, dst_y_prefetch_equ = %f (should be > 1)\n",
+				__func__, dst_y_prefetch_equ);
+#endif
+	}
+
+	{
+		double prefetch_vm_bw;
+		double prefetch_row_bw;
+
+		if (PDEAndMetaPTEBytesFrame == 0) {
+			prefetch_vm_bw = 0;
+		} else if (*DestinationLinesToRequestVMInVBlank > 0) {
+#ifdef __DML_VBA_DEBUG__
+			dml_print("DML::%s: PDEAndMetaPTEBytesFrame = %d\n", __func__, PDEAndMetaPTEBytesFrame);
+			dml_print("DML::%s: HostVMInefficiencyFactor = %f\n", __func__, HostVMInefficiencyFactor);
+			dml_print("DML::%s: DestinationLinesToRequestVMInVBlank = %f\n",
+					__func__, *DestinationLinesToRequestVMInVBlank);
+			dml_print("DML::%s: LineTime = %f\n", __func__, LineTime);
+#endif
+			prefetch_vm_bw = PDEAndMetaPTEBytesFrame * HostVMInefficiencyFactor /
+					(*DestinationLinesToRequestVMInVBlank * LineTime);
+#ifdef __DML_VBA_DEBUG__
+			dml_print("DML::%s: prefetch_vm_bw = %f\n", __func__, prefetch_vm_bw);
+#endif
+		} else {
+			prefetch_vm_bw = 0;
+			MyError = true;
+#ifdef __DML_VBA_DEBUG__
+			dml_print("DML::%s: MyErr set. DestinationLinesToRequestVMInVBlank=%f (should be > 0)\n",
+					__func__, *DestinationLinesToRequestVMInVBlank);
+#endif
+		}
+
+		if (MetaRowByte + PixelPTEBytesPerRow == 0) {
+			prefetch_row_bw = 0;
+		} else if (*DestinationLinesToRequestRowInVBlank > 0) {
+			prefetch_row_bw = (MetaRowByte + PixelPTEBytesPerRow * HostVMInefficiencyFactor) /
+					(*DestinationLinesToRequestRowInVBlank * LineTime);
+
+#ifdef __DML_VBA_DEBUG__
+			dml_print("DML::%s: MetaRowByte = %d\n", __func__, MetaRowByte);
+			dml_print("DML::%s: PixelPTEBytesPerRow = %d\n", __func__, PixelPTEBytesPerRow);
+			dml_print("DML::%s: DestinationLinesToRequestRowInVBlank = %f\n",
+					__func__, *DestinationLinesToRequestRowInVBlank);
+			dml_print("DML::%s: prefetch_row_bw = %f\n", __func__, prefetch_row_bw);
+#endif
+		} else {
+			prefetch_row_bw = 0;
+			MyError = true;
+#ifdef __DML_VBA_DEBUG__
+			dml_print("DML::%s: MyErr set. DestinationLinesToRequestRowInVBlank=%f (should be > 0)\n",
+					__func__, *DestinationLinesToRequestRowInVBlank);
+#endif
+		}
+
+		*prefetch_vmrow_bw = dml_max(prefetch_vm_bw, prefetch_row_bw);
+	}
+
+	if (MyError) {
+		*PrefetchBandwidth = 0;
+		TimeForFetchingMetaPTE = 0;
+		TimeForFetchingRowInVBlank = 0;
+		*DestinationLinesToRequestVMInVBlank = 0;
+		*DestinationLinesToRequestRowInVBlank = 0;
+		*DestinationLinesForPrefetch = 0;
+		LinesToRequestPrefetchPixelData = 0;
+		*VRatioPrefetchY = 0;
+		*VRatioPrefetchC = 0;
+		*RequiredPrefetchPixDataBWLuma = 0;
+		*RequiredPrefetchPixDataBWChroma = 0;
+	}
+
+	return MyError;
+} // CalculatePrefetchSchedule
+
+void dml32_CalculateFlipSchedule(
+		double HostVMInefficiencyFactor,
+		double UrgentExtraLatency,
+		double UrgentLatency,
+		unsigned int GPUVMMaxPageTableLevels,
+		bool HostVMEnable,
+		unsigned int HostVMMaxNonCachedPageTableLevels,
+		bool GPUVMEnable,
+		double HostVMMinPageSize,
+		double PDEAndMetaPTEBytesPerFrame,
+		double MetaRowBytes,
+		double DPTEBytesPerRow,
+		double BandwidthAvailableForImmediateFlip,
+		unsigned int TotImmediateFlipBytes,
+		enum source_format_class SourcePixelFormat,
+		double LineTime,
+		double VRatio,
+		double VRatioChroma,
+		double Tno_bw,
+		bool DCCEnable,
+		unsigned int dpte_row_height,
+		unsigned int meta_row_height,
+		unsigned int dpte_row_height_chroma,
+		unsigned int meta_row_height_chroma,
+		bool    use_one_row_for_frame_flip,
+
+		/* Output */
+		double *DestinationLinesToRequestVMInImmediateFlip,
+		double *DestinationLinesToRequestRowInImmediateFlip,
+		double *final_flip_bw,
+		bool *ImmediateFlipSupportedForPipe)
+{
+	double min_row_time = 0.0;
+	unsigned int HostVMDynamicLevelsTrips;
+	double TimeForFetchingMetaPTEImmediateFlip;
+	double TimeForFetchingRowInVBlankImmediateFlip;
+	double ImmediateFlipBW;
+
+	if (GPUVMEnable == true && HostVMEnable == true)
+		HostVMDynamicLevelsTrips = HostVMMaxNonCachedPageTableLevels;
+	else
+		HostVMDynamicLevelsTrips = 0;
+
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: TotImmediateFlipBytes = %d\n", __func__, TotImmediateFlipBytes);
+	dml_print("DML::%s: BandwidthAvailableForImmediateFlip = %f\n", __func__, BandwidthAvailableForImmediateFlip);
+#endif
+
+	if (TotImmediateFlipBytes > 0) {
+		if (use_one_row_for_frame_flip) {
+			ImmediateFlipBW = (PDEAndMetaPTEBytesPerFrame + MetaRowBytes + 2 * DPTEBytesPerRow) *
+					BandwidthAvailableForImmediateFlip / TotImmediateFlipBytes;
+		} else {
+			ImmediateFlipBW = (PDEAndMetaPTEBytesPerFrame + MetaRowBytes + DPTEBytesPerRow) *
+					BandwidthAvailableForImmediateFlip / TotImmediateFlipBytes;
+		}
+		if (GPUVMEnable == true) {
+			TimeForFetchingMetaPTEImmediateFlip = dml_max3(Tno_bw + PDEAndMetaPTEBytesPerFrame *
+					HostVMInefficiencyFactor / ImmediateFlipBW,
+					UrgentExtraLatency + UrgentLatency *
+					(GPUVMMaxPageTableLevels * (HostVMDynamicLevelsTrips + 1) - 1),
+					LineTime / 4.0);
+		} else {
+			TimeForFetchingMetaPTEImmediateFlip = 0;
+		}
+		if ((GPUVMEnable == true || DCCEnable == true)) {
+			TimeForFetchingRowInVBlankImmediateFlip = dml_max3(
+					(MetaRowBytes + DPTEBytesPerRow * HostVMInefficiencyFactor) / ImmediateFlipBW,
+					UrgentLatency * (HostVMDynamicLevelsTrips + 1), LineTime / 4.0);
+		} else {
+			TimeForFetchingRowInVBlankImmediateFlip = 0;
+		}
+
+		*DestinationLinesToRequestVMInImmediateFlip =
+				dml_ceil(4.0 * (TimeForFetchingMetaPTEImmediateFlip / LineTime), 1.0) / 4.0;
+		*DestinationLinesToRequestRowInImmediateFlip =
+				dml_ceil(4.0 * (TimeForFetchingRowInVBlankImmediateFlip / LineTime), 1.0) / 4.0;
+
+		if (GPUVMEnable == true) {
+			*final_flip_bw = dml_max(PDEAndMetaPTEBytesPerFrame * HostVMInefficiencyFactor /
+					(*DestinationLinesToRequestVMInImmediateFlip * LineTime),
+					(MetaRowBytes + DPTEBytesPerRow * HostVMInefficiencyFactor) /
+					(*DestinationLinesToRequestRowInImmediateFlip * LineTime));
+		} else if ((GPUVMEnable == true || DCCEnable == true)) {
+			*final_flip_bw = (MetaRowBytes + DPTEBytesPerRow * HostVMInefficiencyFactor) /
+					(*DestinationLinesToRequestRowInImmediateFlip * LineTime);
+		} else {
+			*final_flip_bw = 0;
+		}
+	} else {
+		TimeForFetchingMetaPTEImmediateFlip = 0;
+		TimeForFetchingRowInVBlankImmediateFlip = 0;
+		*DestinationLinesToRequestVMInImmediateFlip = 0;
+		*DestinationLinesToRequestRowInImmediateFlip = 0;
+		*final_flip_bw = 0;
+	}
+
+	if (SourcePixelFormat == dm_420_8 || SourcePixelFormat == dm_420_10 || SourcePixelFormat == dm_rgbe_alpha) {
+		if (GPUVMEnable == true && DCCEnable != true) {
+			min_row_time = dml_min(dpte_row_height *
+					LineTime / VRatio, dpte_row_height_chroma * LineTime / VRatioChroma);
+		} else if (GPUVMEnable != true && DCCEnable == true) {
+			min_row_time = dml_min(meta_row_height *
+					LineTime / VRatio, meta_row_height_chroma * LineTime / VRatioChroma);
+		} else {
+			min_row_time = dml_min4(dpte_row_height * LineTime / VRatio, meta_row_height *
+					LineTime / VRatio, dpte_row_height_chroma * LineTime /
+					VRatioChroma, meta_row_height_chroma * LineTime / VRatioChroma);
+		}
+	} else {
+		if (GPUVMEnable == true && DCCEnable != true) {
+			min_row_time = dpte_row_height * LineTime / VRatio;
+		} else if (GPUVMEnable != true && DCCEnable == true) {
+			min_row_time = meta_row_height * LineTime / VRatio;
+		} else {
+			min_row_time =
+				dml_min(dpte_row_height * LineTime / VRatio, meta_row_height * LineTime / VRatio);
+		}
+	}
+
+	if (*DestinationLinesToRequestVMInImmediateFlip >= 32 || *DestinationLinesToRequestRowInImmediateFlip >= 16
+			|| TimeForFetchingMetaPTEImmediateFlip + 2 * TimeForFetchingRowInVBlankImmediateFlip
+					> min_row_time) {
+		*ImmediateFlipSupportedForPipe = false;
+	} else {
+		*ImmediateFlipSupportedForPipe = true;
+	}
+
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: GPUVMEnable = %d\n", __func__, GPUVMEnable);
+	dml_print("DML::%s: DCCEnable = %d\n", __func__, DCCEnable);
+	dml_print("DML::%s: DestinationLinesToRequestVMInImmediateFlip = %f\n",
+			__func__, *DestinationLinesToRequestVMInImmediateFlip);
+	dml_print("DML::%s: DestinationLinesToRequestRowInImmediateFlip = %f\n",
+			__func__, *DestinationLinesToRequestRowInImmediateFlip);
+	dml_print("DML::%s: TimeForFetchingMetaPTEImmediateFlip = %f\n", __func__, TimeForFetchingMetaPTEImmediateFlip);
+	dml_print("DML::%s: TimeForFetchingRowInVBlankImmediateFlip = %f\n",
+			__func__, TimeForFetchingRowInVBlankImmediateFlip);
+	dml_print("DML::%s: min_row_time = %f\n", __func__, min_row_time);
+	dml_print("DML::%s: ImmediateFlipSupportedForPipe = %d\n", __func__, *ImmediateFlipSupportedForPipe);
+#endif
+} // CalculateFlipSchedule
+
+void dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
+		bool USRRetrainingRequiredFinal,
+		enum dm_use_mall_for_pstate_change_mode UseMALLForPStateChange[],
+		unsigned int PrefetchMode,
+		unsigned int NumberOfActiveSurfaces,
+		unsigned int MaxLineBufferLines,
+		unsigned int LineBufferSize,
+		unsigned int WritebackInterfaceBufferSize,
+		double DCFCLK,
+		double ReturnBW,
+		bool SynchronizeTimingsFinal,
+		bool SynchronizeDRRDisplaysForUCLKPStateChangeFinal,
+		bool DRRDisplay[],
+		unsigned int dpte_group_bytes[],
+		unsigned int meta_row_height[],
+		unsigned int meta_row_height_chroma[],
+		SOCParametersList mmSOCParameters,
+		unsigned int WritebackChunkSize,
+		double SOCCLK,
+		double DCFClkDeepSleep,
+		unsigned int DETBufferSizeY[],
+		unsigned int DETBufferSizeC[],
+		unsigned int SwathHeightY[],
+		unsigned int SwathHeightC[],
+		unsigned int LBBitPerPixel[],
+		double SwathWidthY[],
+		double SwathWidthC[],
+		double HRatio[],
+		double HRatioChroma[],
+		unsigned int VTaps[],
+		unsigned int VTapsChroma[],
+		double VRatio[],
+		double VRatioChroma[],
+		unsigned int HTotal[],
+		unsigned int VTotal[],
+		unsigned int VActive[],
+		double PixelClock[],
+		unsigned int BlendingAndTiming[],
+		unsigned int DPPPerSurface[],
+		double BytePerPixelDETY[],
+		double BytePerPixelDETC[],
+		double DSTXAfterScaler[],
+		double DSTYAfterScaler[],
+		bool WritebackEnable[],
+		enum source_format_class WritebackPixelFormat[],
+		double WritebackDestinationWidth[],
+		double WritebackDestinationHeight[],
+		double WritebackSourceHeight[],
+		bool UnboundedRequestEnabled,
+		unsigned int CompressedBufferSizeInkByte,
+
+		/* Output */
+		Watermarks *Watermark,
+		enum clock_change_support *DRAMClockChangeSupport,
+		double MaxActiveDRAMClockChangeLatencySupported[],
+		unsigned int SubViewportLinesNeededInMALL[],
+		enum dm_fclock_change_support *FCLKChangeSupport,
+		double *MinActiveFCLKChangeLatencySupported,
+		bool *USRRetrainingSupport,
+		double ActiveDRAMClockChangeLatencyMargin[])
+{
+	unsigned int i, j, k;
+	unsigned int SurfaceWithMinActiveFCLKChangeMargin = 0;
+	unsigned int DRAMClockChangeSupportNumber = 0;
+	unsigned int LastSurfaceWithoutMargin;
+	unsigned int DRAMClockChangeMethod = 0;
+	bool FoundFirstSurfaceWithMinActiveFCLKChangeMargin = false;
+	double MinActiveFCLKChangeMargin = 0.;
+	double SecondMinActiveFCLKChangeMarginOneDisplayInVBLank = 0.;
+	double ActiveClockChangeLatencyHidingY;
+	double ActiveClockChangeLatencyHidingC;
+	double ActiveClockChangeLatencyHiding;
+    double EffectiveDETBufferSizeY;
+	double     ActiveFCLKChangeLatencyMargin[DC__NUM_DPP__MAX];
+	double     USRRetrainingLatencyMargin[DC__NUM_DPP__MAX];
+	double TotalPixelBW = 0.0;
+	bool    SynchronizedSurfaces[DC__NUM_DPP__MAX][DC__NUM_DPP__MAX];
+	double     EffectiveLBLatencyHidingY;
+	double     EffectiveLBLatencyHidingC;
+	double     LinesInDETY[DC__NUM_DPP__MAX];
+	double     LinesInDETC[DC__NUM_DPP__MAX];
+	unsigned int    LinesInDETYRoundedDownToSwath[DC__NUM_DPP__MAX];
+	unsigned int    LinesInDETCRoundedDownToSwath[DC__NUM_DPP__MAX];
+	double     FullDETBufferingTimeY;
+	double     FullDETBufferingTimeC;
+	double     WritebackDRAMClockChangeLatencyMargin;
+	double     WritebackFCLKChangeLatencyMargin;
+	double     WritebackLatencyHiding;
+	bool    SameTimingForFCLKChange;
+
+	unsigned int    TotalActiveWriteback = 0;
+	unsigned int LBLatencyHidingSourceLinesY[DC__NUM_DPP__MAX];
+	unsigned int LBLatencyHidingSourceLinesC[DC__NUM_DPP__MAX];
+
+	Watermark->UrgentWatermark = mmSOCParameters.UrgentLatency + mmSOCParameters.ExtraLatency;
+	Watermark->USRRetrainingWatermark = mmSOCParameters.UrgentLatency + mmSOCParameters.ExtraLatency
+			+ mmSOCParameters.USRRetrainingLatency + mmSOCParameters.SMNLatency;
+	Watermark->DRAMClockChangeWatermark = mmSOCParameters.DRAMClockChangeLatency + Watermark->UrgentWatermark;
+	Watermark->FCLKChangeWatermark = mmSOCParameters.FCLKChangeLatency + Watermark->UrgentWatermark;
+	Watermark->StutterExitWatermark = mmSOCParameters.SRExitTime + mmSOCParameters.ExtraLatency
+			+ 10 / DCFClkDeepSleep;
+	Watermark->StutterEnterPlusExitWatermark = mmSOCParameters.SREnterPlusExitTime + mmSOCParameters.ExtraLatency
+			+ 10 / DCFClkDeepSleep;
+	Watermark->Z8StutterExitWatermark = mmSOCParameters.SRExitZ8Time + mmSOCParameters.ExtraLatency
+			+ 10 / DCFClkDeepSleep;
+	Watermark->Z8StutterEnterPlusExitWatermark = mmSOCParameters.SREnterPlusExitZ8Time
+			+ mmSOCParameters.ExtraLatency + 10 / DCFClkDeepSleep;
+
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: UrgentLatency = %f\n", __func__, mmSOCParameters.UrgentLatency);
+	dml_print("DML::%s: ExtraLatency = %f\n", __func__, mmSOCParameters.ExtraLatency);
+	dml_print("DML::%s: DRAMClockChangeLatency = %f\n", __func__, mmSOCParameters.DRAMClockChangeLatency);
+	dml_print("DML::%s: UrgentWatermark = %f\n", __func__, Watermark->UrgentWatermark);
+	dml_print("DML::%s: USRRetrainingWatermark = %f\n", __func__, Watermark->USRRetrainingWatermark);
+	dml_print("DML::%s: DRAMClockChangeWatermark = %f\n", __func__, Watermark->DRAMClockChangeWatermark);
+	dml_print("DML::%s: FCLKChangeWatermark = %f\n", __func__, Watermark->FCLKChangeWatermark);
+	dml_print("DML::%s: StutterExitWatermark = %f\n", __func__, Watermark->StutterExitWatermark);
+	dml_print("DML::%s: StutterEnterPlusExitWatermark = %f\n", __func__, Watermark->StutterEnterPlusExitWatermark);
+	dml_print("DML::%s: Z8StutterExitWatermark = %f\n", __func__, Watermark->Z8StutterExitWatermark);
+	dml_print("DML::%s: Z8StutterEnterPlusExitWatermark = %f\n",
+			__func__, Watermark->Z8StutterEnterPlusExitWatermark);
+#endif
+
+
+	TotalActiveWriteback = 0;
+	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+		if (WritebackEnable[k] == true)
+			TotalActiveWriteback = TotalActiveWriteback + 1;
+	}
+
+	if (TotalActiveWriteback <= 1) {
+		Watermark->WritebackUrgentWatermark = mmSOCParameters.WritebackLatency;
+	} else {
+		Watermark->WritebackUrgentWatermark = mmSOCParameters.WritebackLatency
+				+ WritebackChunkSize * 1024.0 / 32.0 / SOCCLK;
+	}
+	if (USRRetrainingRequiredFinal)
+		Watermark->WritebackUrgentWatermark = Watermark->WritebackUrgentWatermark
+				+ mmSOCParameters.USRRetrainingLatency;
+
+	if (TotalActiveWriteback <= 1) {
+		Watermark->WritebackDRAMClockChangeWatermark = mmSOCParameters.DRAMClockChangeLatency
+				+ mmSOCParameters.WritebackLatency;
+		Watermark->WritebackFCLKChangeWatermark = mmSOCParameters.FCLKChangeLatency
+				+ mmSOCParameters.WritebackLatency;
+	} else {
+		Watermark->WritebackDRAMClockChangeWatermark = mmSOCParameters.DRAMClockChangeLatency
+				+ mmSOCParameters.WritebackLatency + WritebackChunkSize * 1024.0 / 32.0 / SOCCLK;
+		Watermark->WritebackFCLKChangeWatermark = mmSOCParameters.FCLKChangeLatency
+				+ mmSOCParameters.WritebackLatency + WritebackChunkSize * 1024 / 32 / SOCCLK;
+	}
+
+	if (USRRetrainingRequiredFinal)
+		Watermark->WritebackDRAMClockChangeWatermark = Watermark->WritebackDRAMClockChangeWatermark
+				+ mmSOCParameters.USRRetrainingLatency;
+
+	if (USRRetrainingRequiredFinal)
+		Watermark->WritebackFCLKChangeWatermark = Watermark->WritebackFCLKChangeWatermark
+				+ mmSOCParameters.USRRetrainingLatency;
+
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: WritebackDRAMClockChangeWatermark = %f\n",
+			__func__, Watermark->WritebackDRAMClockChangeWatermark);
+	dml_print("DML::%s: WritebackFCLKChangeWatermark = %f\n", __func__, Watermark->WritebackFCLKChangeWatermark);
+	dml_print("DML::%s: WritebackUrgentWatermark = %f\n", __func__, Watermark->WritebackUrgentWatermark);
+	dml_print("DML::%s: USRRetrainingRequiredFinal = %d\n", __func__, USRRetrainingRequiredFinal);
+	dml_print("DML::%s: USRRetrainingLatency = %f\n", __func__, mmSOCParameters.USRRetrainingLatency);
+#endif
+
+	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+		TotalPixelBW = TotalPixelBW + DPPPerSurface[k] * (SwathWidthY[k] * BytePerPixelDETY[k] * VRatio[k] +
+				SwathWidthC[k] * BytePerPixelDETC[k] * VRatioChroma[k]) / (HTotal[k] / PixelClock[k]);
+	}
+
+	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+
+		LBLatencyHidingSourceLinesY[k] = dml_min((double) MaxLineBufferLines, dml_floor(LineBufferSize / LBBitPerPixel[k] / (SwathWidthY[k] / dml_max(HRatio[k], 1.0)), 1)) - (VTaps[k] - 1);
+		LBLatencyHidingSourceLinesC[k] = dml_min((double) MaxLineBufferLines, dml_floor(LineBufferSize / LBBitPerPixel[k] / (SwathWidthC[k] / dml_max(HRatioChroma[k], 1.0)), 1)) - (VTapsChroma[k] - 1);
+
+
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML::%s: k=%d, MaxLineBufferLines = %d\n", __func__, k, MaxLineBufferLines);
+		dml_print("DML::%s: k=%d, LineBufferSize     = %d\n", __func__, k, LineBufferSize);
+		dml_print("DML::%s: k=%d, LBBitPerPixel      = %d\n", __func__, k, LBBitPerPixel[k]);
+		dml_print("DML::%s: k=%d, HRatio             = %f\n", __func__, k, HRatio[k]);
+		dml_print("DML::%s: k=%d, VTaps              = %d\n", __func__, k, VTaps[k]);
+#endif
+
+		EffectiveLBLatencyHidingY = LBLatencyHidingSourceLinesY[k] / VRatio[k] * (HTotal[k] / PixelClock[k]);
+		EffectiveLBLatencyHidingC = LBLatencyHidingSourceLinesC[k] / VRatioChroma[k] * (HTotal[k] / PixelClock[k]);
+		EffectiveDETBufferSizeY = DETBufferSizeY[k];
+
+		if (UnboundedRequestEnabled) {
+			EffectiveDETBufferSizeY = EffectiveDETBufferSizeY
+					+ CompressedBufferSizeInkByte * 1024
+							* (SwathWidthY[k] * BytePerPixelDETY[k] * VRatio[k])
+							/ (HTotal[k] / PixelClock[k]) / TotalPixelBW;
+		}
+
+		LinesInDETY[k] = (double) EffectiveDETBufferSizeY / BytePerPixelDETY[k] / SwathWidthY[k];
+		LinesInDETYRoundedDownToSwath[k] = dml_floor(LinesInDETY[k], SwathHeightY[k]);
+		FullDETBufferingTimeY = LinesInDETYRoundedDownToSwath[k] * (HTotal[k] / PixelClock[k]) / VRatio[k];
+
+		ActiveClockChangeLatencyHidingY = EffectiveLBLatencyHidingY + FullDETBufferingTimeY
+				- (DSTXAfterScaler[k] / HTotal[k] + DSTYAfterScaler[k]) * HTotal[k] / PixelClock[k];
+
+		if (NumberOfActiveSurfaces > 1) {
+			ActiveClockChangeLatencyHidingY = ActiveClockChangeLatencyHidingY
+					- (1 - 1 / NumberOfActiveSurfaces) * SwathHeightY[k] * HTotal[k]
+							/ PixelClock[k] / VRatio[k];
+		}
+
+		if (BytePerPixelDETC[k] > 0) {
+			LinesInDETC[k] = DETBufferSizeC[k] / BytePerPixelDETC[k] / SwathWidthC[k];
+			LinesInDETCRoundedDownToSwath[k] = dml_floor(LinesInDETC[k], SwathHeightC[k]);
+			FullDETBufferingTimeC = LinesInDETCRoundedDownToSwath[k] * (HTotal[k] / PixelClock[k])
+					/ VRatioChroma[k];
+			ActiveClockChangeLatencyHidingC = EffectiveLBLatencyHidingC + FullDETBufferingTimeC
+					- (DSTXAfterScaler[k] / HTotal[k] + DSTYAfterScaler[k]) * HTotal[k]
+							/ PixelClock[k];
+			if (NumberOfActiveSurfaces > 1) {
+				ActiveClockChangeLatencyHidingC = ActiveClockChangeLatencyHidingC
+						- (1 - 1 / NumberOfActiveSurfaces) * SwathHeightC[k] * HTotal[k]
+								/ PixelClock[k] / VRatioChroma[k];
+			}
+			ActiveClockChangeLatencyHiding = dml_min(ActiveClockChangeLatencyHidingY,
+					ActiveClockChangeLatencyHidingC);
+		} else {
+			ActiveClockChangeLatencyHiding = ActiveClockChangeLatencyHidingY;
+		}
+
+		ActiveDRAMClockChangeLatencyMargin[k] = ActiveClockChangeLatencyHiding - Watermark->UrgentWatermark
+				- Watermark->DRAMClockChangeWatermark;
+		ActiveFCLKChangeLatencyMargin[k] = ActiveClockChangeLatencyHiding - Watermark->UrgentWatermark
+				- Watermark->FCLKChangeWatermark;
+		USRRetrainingLatencyMargin[k] = ActiveClockChangeLatencyHiding - Watermark->USRRetrainingWatermark;
+
+		if (WritebackEnable[k]) {
+			WritebackLatencyHiding = WritebackInterfaceBufferSize * 1024
+					/ (WritebackDestinationWidth[k] * WritebackDestinationHeight[k]
+							/ (WritebackSourceHeight[k] * HTotal[k] / PixelClock[k]) * 4);
+			if (WritebackPixelFormat[k] == dm_444_64)
+				WritebackLatencyHiding = WritebackLatencyHiding / 2;
+
+			WritebackDRAMClockChangeLatencyMargin = WritebackLatencyHiding
+					- Watermark->WritebackDRAMClockChangeWatermark;
+
+			WritebackFCLKChangeLatencyMargin = WritebackLatencyHiding
+					- Watermark->WritebackFCLKChangeWatermark;
+
+			ActiveDRAMClockChangeLatencyMargin[k] = dml_min(ActiveDRAMClockChangeLatencyMargin[k],
+					WritebackFCLKChangeLatencyMargin);
+			ActiveFCLKChangeLatencyMargin[k] = dml_min(ActiveFCLKChangeLatencyMargin[k],
+					WritebackDRAMClockChangeLatencyMargin);
+		}
+		MaxActiveDRAMClockChangeLatencySupported[k] =
+				(UseMALLForPStateChange[k] == dm_use_mall_pstate_change_phantom_pipe) ?
+						0 :
+						(ActiveDRAMClockChangeLatencyMargin[k]
+								+ mmSOCParameters.DRAMClockChangeLatency);
+	}
+
+	for (i = 0; i < NumberOfActiveSurfaces; ++i) {
+		for (j = 0; j < NumberOfActiveSurfaces; ++j) {
+			if (i == j ||
+					(BlendingAndTiming[i] == i && BlendingAndTiming[j] == i) ||
+					(BlendingAndTiming[j] == j && BlendingAndTiming[i] == j) ||
+					(BlendingAndTiming[i] == BlendingAndTiming[j] && BlendingAndTiming[i] != i) ||
+					(SynchronizeTimingsFinal && PixelClock[i] == PixelClock[j] &&
+					HTotal[i] == HTotal[j] && VTotal[i] == VTotal[j] &&
+					VActive[i] == VActive[j]) || (SynchronizeDRRDisplaysForUCLKPStateChangeFinal &&
+					(DRRDisplay[i] || DRRDisplay[j]))) {
+				SynchronizedSurfaces[i][j] = true;
+			} else {
+				SynchronizedSurfaces[i][j] = false;
+			}
+		}
+	}
+
+	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+		if ((UseMALLForPStateChange[k] != dm_use_mall_pstate_change_phantom_pipe) &&
+				(!FoundFirstSurfaceWithMinActiveFCLKChangeMargin ||
+				ActiveFCLKChangeLatencyMargin[k] < MinActiveFCLKChangeMargin)) {
+			FoundFirstSurfaceWithMinActiveFCLKChangeMargin = true;
+			MinActiveFCLKChangeMargin = ActiveFCLKChangeLatencyMargin[k];
+			SurfaceWithMinActiveFCLKChangeMargin = k;
+		}
+	}
+
+	*MinActiveFCLKChangeLatencySupported = MinActiveFCLKChangeMargin + mmSOCParameters.FCLKChangeLatency;
+
+	SameTimingForFCLKChange = true;
+	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+		if (!SynchronizedSurfaces[k][SurfaceWithMinActiveFCLKChangeMargin]) {
+			if ((UseMALLForPStateChange[k] != dm_use_mall_pstate_change_phantom_pipe) &&
+					(SameTimingForFCLKChange ||
+					ActiveFCLKChangeLatencyMargin[k] <
+					SecondMinActiveFCLKChangeMarginOneDisplayInVBLank)) {
+				SecondMinActiveFCLKChangeMarginOneDisplayInVBLank = ActiveFCLKChangeLatencyMargin[k];
+			}
+			SameTimingForFCLKChange = false;
+		}
+	}
+
+	if (MinActiveFCLKChangeMargin > 0) {
+		*FCLKChangeSupport = dm_fclock_change_vactive;
+	} else if ((SameTimingForFCLKChange || SecondMinActiveFCLKChangeMarginOneDisplayInVBLank > 0) &&
+			(PrefetchMode <= 1)) {
+		*FCLKChangeSupport = dm_fclock_change_vblank;
+	} else {
+		*FCLKChangeSupport = dm_fclock_change_unsupported;
+	}
+
+	*USRRetrainingSupport = true;
+	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+		if ((UseMALLForPStateChange[k] != dm_use_mall_pstate_change_phantom_pipe) &&
+				(USRRetrainingLatencyMargin[k] < 0)) {
+			*USRRetrainingSupport = false;
+		}
+	}
+
+	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+		if (UseMALLForPStateChange[k] != dm_use_mall_pstate_change_full_frame &&
+				UseMALLForPStateChange[k] != dm_use_mall_pstate_change_sub_viewport &&
+				UseMALLForPStateChange[k] != dm_use_mall_pstate_change_phantom_pipe &&
+				ActiveDRAMClockChangeLatencyMargin[k] < 0) {
+			if (PrefetchMode > 0) {
+				DRAMClockChangeSupportNumber = 2;
+			} else if (DRAMClockChangeSupportNumber == 0) {
+				DRAMClockChangeSupportNumber = 1;
+				LastSurfaceWithoutMargin = k;
+			} else if (DRAMClockChangeSupportNumber == 1 &&
+					!SynchronizedSurfaces[LastSurfaceWithoutMargin][k]) {
+				DRAMClockChangeSupportNumber = 2;
+			}
+		}
+	}
+
+	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+		if (UseMALLForPStateChange[k] == dm_use_mall_pstate_change_full_frame)
+			DRAMClockChangeMethod = 1;
+		else if (UseMALLForPStateChange[k] == dm_use_mall_pstate_change_sub_viewport)
+			DRAMClockChangeMethod = 2;
+	}
+
+	if (DRAMClockChangeMethod == 0) {
+		if (DRAMClockChangeSupportNumber == 0)
+			*DRAMClockChangeSupport = dm_dram_clock_change_vactive;
+		else if (DRAMClockChangeSupportNumber == 1)
+			*DRAMClockChangeSupport = dm_dram_clock_change_vblank;
+		else
+			*DRAMClockChangeSupport = dm_dram_clock_change_unsupported;
+	} else if (DRAMClockChangeMethod == 1) {
+		if (DRAMClockChangeSupportNumber == 0)
+			*DRAMClockChangeSupport = dm_dram_clock_change_vactive_w_mall_full_frame;
+		else if (DRAMClockChangeSupportNumber == 1)
+			*DRAMClockChangeSupport = dm_dram_clock_change_vblank_w_mall_full_frame;
+		else
+			*DRAMClockChangeSupport = dm_dram_clock_change_unsupported;
+	} else {
+		if (DRAMClockChangeSupportNumber == 0)
+			*DRAMClockChangeSupport = dm_dram_clock_change_vactive_w_mall_sub_vp;
+		else if (DRAMClockChangeSupportNumber == 1)
+			*DRAMClockChangeSupport = dm_dram_clock_change_vblank_w_mall_sub_vp;
+		else
+			*DRAMClockChangeSupport = dm_dram_clock_change_unsupported;
+	}
+
+	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+		unsigned int dst_y_pstate;
+		unsigned int src_y_pstate_l;
+		unsigned int src_y_pstate_c;
+		unsigned int src_y_ahead_l, src_y_ahead_c, sub_vp_lines_l, sub_vp_lines_c;
+
+		dst_y_pstate = dml_ceil((mmSOCParameters.DRAMClockChangeLatency + mmSOCParameters.UrgentLatency) / (HTotal[k] / PixelClock[k]), 1);
+		src_y_pstate_l = dml_ceil(dst_y_pstate * VRatio[k], SwathHeightY[k]);
+		src_y_ahead_l = dml_floor(DETBufferSizeY[k] / BytePerPixelDETY[k] / SwathWidthY[k], SwathHeightY[k]) + LBLatencyHidingSourceLinesY[k];
+		sub_vp_lines_l = src_y_pstate_l + src_y_ahead_l + meta_row_height[k];
+
+#ifdef __DML_VBA_DEBUG__
+dml_print("DML::%s: k=%d, DETBufferSizeY               = %d\n", __func__, k, DETBufferSizeY[k]);
+dml_print("DML::%s: k=%d, BytePerPixelDETY             = %f\n", __func__, k, BytePerPixelDETY[k]);
+dml_print("DML::%s: k=%d, SwathWidthY                  = %d\n", __func__, k, SwathWidthY[k]);
+dml_print("DML::%s: k=%d, SwathHeightY                 = %d\n", __func__, k, SwathHeightY[k]);
+dml_print("DML::%s: k=%d, LBLatencyHidingSourceLinesY  = %d\n", __func__, k, LBLatencyHidingSourceLinesY[k]);
+dml_print("DML::%s: k=%d, dst_y_pstate      = %d\n", __func__, k, dst_y_pstate);
+dml_print("DML::%s: k=%d, src_y_pstate_l    = %d\n", __func__, k, src_y_pstate_l);
+dml_print("DML::%s: k=%d, src_y_ahead_l     = %d\n", __func__, k, src_y_ahead_l);
+dml_print("DML::%s: k=%d, meta_row_height   = %d\n", __func__, k, meta_row_height[k]);
+dml_print("DML::%s: k=%d, sub_vp_lines_l    = %d\n", __func__, k, sub_vp_lines_l);
+#endif
+		SubViewportLinesNeededInMALL[k] = sub_vp_lines_l;
+
+		if (BytePerPixelDETC[k] > 0) {
+			src_y_pstate_c = dml_ceil(dst_y_pstate * VRatioChroma[k], SwathHeightC[k]);
+			src_y_ahead_c = dml_floor(DETBufferSizeC[k] / BytePerPixelDETC[k] / SwathWidthC[k], SwathHeightC[k]) + LBLatencyHidingSourceLinesC[k];
+			sub_vp_lines_c = src_y_pstate_c + src_y_ahead_c + meta_row_height_chroma[k];
+			SubViewportLinesNeededInMALL[k] = dml_max(sub_vp_lines_l, sub_vp_lines_c);
+
+#ifdef __DML_VBA_DEBUG__
+dml_print("DML::%s: k=%d, src_y_pstate_c            = %d\n", __func__, k, src_y_pstate_c);
+dml_print("DML::%s: k=%d, src_y_ahead_c             = %d\n", __func__, k, src_y_ahead_c);
+dml_print("DML::%s: k=%d, meta_row_height_chroma    = %d\n", __func__, k, meta_row_height_chroma[k]);
+dml_print("DML::%s: k=%d, sub_vp_lines_c            = %d\n", __func__, k, sub_vp_lines_c);
+#endif
+		}
+	}
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: DRAMClockChangeSupport = %d\n", __func__, *DRAMClockChangeSupport);
+	dml_print("DML::%s: FCLKChangeSupport = %d\n", __func__, *FCLKChangeSupport);
+	dml_print("DML::%s: MinActiveFCLKChangeLatencySupported = %f\n",
+			__func__, *MinActiveFCLKChangeLatencySupported);
+	dml_print("DML::%s: USRRetrainingSupport = %d\n", __func__, *USRRetrainingSupport);
+#endif
+} // CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport
+
+double dml32_CalculateWriteBackDISPCLK(
+		enum source_format_class WritebackPixelFormat,
+		double PixelClock,
+		double WritebackHRatio,
+		double WritebackVRatio,
+		unsigned int WritebackHTaps,
+		unsigned int WritebackVTaps,
+		unsigned int   WritebackSourceWidth,
+		unsigned int   WritebackDestinationWidth,
+		unsigned int HTotal,
+		unsigned int WritebackLineBufferSize,
+		double DISPCLKDPPCLKVCOSpeed)
+{
+	double DISPCLK_H, DISPCLK_V, DISPCLK_HB;
+
+	DISPCLK_H = PixelClock * dml_ceil(WritebackHTaps / 8.0, 1) / WritebackHRatio;
+	DISPCLK_V = PixelClock * (WritebackVTaps * dml_ceil(WritebackDestinationWidth / 6.0, 1) + 8.0) / HTotal;
+	DISPCLK_HB = PixelClock * WritebackVTaps * (WritebackDestinationWidth *
+			WritebackVTaps - WritebackLineBufferSize / 57.0) / 6.0 / WritebackSourceWidth;
+	return dml32_RoundToDFSGranularity(dml_max3(DISPCLK_H, DISPCLK_V, DISPCLK_HB), 1, DISPCLKDPPCLKVCOSpeed);
+}
+
+void dml32_CalculateMinAndMaxPrefetchMode(
+		enum dm_prefetch_modes   AllowForPStateChangeOrStutterInVBlankFinal,
+		unsigned int             *MinPrefetchMode,
+		unsigned int             *MaxPrefetchMode)
+{
+	if (AllowForPStateChangeOrStutterInVBlankFinal == dm_prefetch_support_none) {
+		*MinPrefetchMode = 3;
+		*MaxPrefetchMode = 3;
+	} else if (AllowForPStateChangeOrStutterInVBlankFinal == dm_prefetch_support_stutter) {
+		*MinPrefetchMode = 2;
+		*MaxPrefetchMode = 2;
+	} else if (AllowForPStateChangeOrStutterInVBlankFinal == dm_prefetch_support_fclk_and_stutter) {
+		*MinPrefetchMode = 1;
+		*MaxPrefetchMode = 1;
+	} else if (AllowForPStateChangeOrStutterInVBlankFinal == dm_prefetch_support_uclk_fclk_and_stutter) {
+		*MinPrefetchMode = 0;
+		*MaxPrefetchMode = 0;
+	} else if (AllowForPStateChangeOrStutterInVBlankFinal ==
+			dm_prefetch_support_uclk_fclk_and_stutter_if_possible) {
+		*MinPrefetchMode = 0;
+		*MaxPrefetchMode = 3;
+	} else {
+		*MinPrefetchMode = 0;
+		*MaxPrefetchMode = 3;
+	}
+} // CalculateMinAndMaxPrefetchMode
+
+void dml32_CalculatePixelDeliveryTimes(
+		unsigned int             NumberOfActiveSurfaces,
+		double              VRatio[],
+		double              VRatioChroma[],
+		double              VRatioPrefetchY[],
+		double              VRatioPrefetchC[],
+		unsigned int             swath_width_luma_ub[],
+		unsigned int             swath_width_chroma_ub[],
+		unsigned int             DPPPerSurface[],
+		double              HRatio[],
+		double              HRatioChroma[],
+		double              PixelClock[],
+		double              PSCL_THROUGHPUT[],
+		double              PSCL_THROUGHPUT_CHROMA[],
+		double              Dppclk[],
+		unsigned int             BytePerPixelC[],
+		enum dm_rotation_angle   SourceRotation[],
+		unsigned int             NumberOfCursors[],
+		unsigned int             CursorWidth[][DC__NUM_CURSOR__MAX],
+		unsigned int             CursorBPP[][DC__NUM_CURSOR__MAX],
+		unsigned int             BlockWidth256BytesY[],
+		unsigned int             BlockHeight256BytesY[],
+		unsigned int             BlockWidth256BytesC[],
+		unsigned int             BlockHeight256BytesC[],
+
+		/* Output */
+		double              DisplayPipeLineDeliveryTimeLuma[],
+		double              DisplayPipeLineDeliveryTimeChroma[],
+		double              DisplayPipeLineDeliveryTimeLumaPrefetch[],
+		double              DisplayPipeLineDeliveryTimeChromaPrefetch[],
+		double              DisplayPipeRequestDeliveryTimeLuma[],
+		double              DisplayPipeRequestDeliveryTimeChroma[],
+		double              DisplayPipeRequestDeliveryTimeLumaPrefetch[],
+		double              DisplayPipeRequestDeliveryTimeChromaPrefetch[],
+		double              CursorRequestDeliveryTime[],
+		double              CursorRequestDeliveryTimePrefetch[])
+{
+	double   req_per_swath_ub;
+	unsigned int k;
+
+	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML::%s: k=%d : HRatio = %f\n", __func__, k, HRatio[k]);
+		dml_print("DML::%s: k=%d : VRatio = %f\n", __func__, k, VRatio[k]);
+		dml_print("DML::%s: k=%d : HRatioChroma = %f\n", __func__, k, HRatioChroma[k]);
+		dml_print("DML::%s: k=%d : VRatioChroma = %f\n", __func__, k, VRatioChroma[k]);
+		dml_print("DML::%s: k=%d : swath_width_luma_ub = %d\n", __func__, k, swath_width_luma_ub[k]);
+		dml_print("DML::%s: k=%d : swath_width_chroma_ub = %d\n", __func__, k, swath_width_chroma_ub[k]);
+		dml_print("DML::%s: k=%d : PSCL_THROUGHPUT = %f\n", __func__, k, PSCL_THROUGHPUT[k]);
+		dml_print("DML::%s: k=%d : PSCL_THROUGHPUT_CHROMA = %f\n", __func__, k, PSCL_THROUGHPUT_CHROMA[k]);
+		dml_print("DML::%s: k=%d : DPPPerSurface = %d\n", __func__, k, DPPPerSurface[k]);
+		dml_print("DML::%s: k=%d : PixelClock = %f\n", __func__, k, PixelClock[k]);
+		dml_print("DML::%s: k=%d : Dppclk = %f\n", __func__, k, Dppclk[k]);
+#endif
+
+		if (VRatio[k] <= 1) {
+			DisplayPipeLineDeliveryTimeLuma[k] =
+					swath_width_luma_ub[k] * DPPPerSurface[k] / HRatio[k] / PixelClock[k];
+		} else {
+			DisplayPipeLineDeliveryTimeLuma[k] = swath_width_luma_ub[k] / PSCL_THROUGHPUT[k] / Dppclk[k];
+		}
+
+		if (BytePerPixelC[k] == 0) {
+			DisplayPipeLineDeliveryTimeChroma[k] = 0;
+		} else {
+			if (VRatioChroma[k] <= 1) {
+				DisplayPipeLineDeliveryTimeChroma[k] =
+					swath_width_chroma_ub[k] * DPPPerSurface[k] / HRatioChroma[k] / PixelClock[k];
+			} else {
+				DisplayPipeLineDeliveryTimeChroma[k] =
+					swath_width_chroma_ub[k] / PSCL_THROUGHPUT_CHROMA[k] / Dppclk[k];
+			}
+		}
+
+		if (VRatioPrefetchY[k] <= 1) {
+			DisplayPipeLineDeliveryTimeLumaPrefetch[k] =
+					swath_width_luma_ub[k] * DPPPerSurface[k] / HRatio[k] / PixelClock[k];
+		} else {
+			DisplayPipeLineDeliveryTimeLumaPrefetch[k] =
+					swath_width_luma_ub[k] / PSCL_THROUGHPUT[k] / Dppclk[k];
+		}
+
+		if (BytePerPixelC[k] == 0) {
+			DisplayPipeLineDeliveryTimeChromaPrefetch[k] = 0;
+		} else {
+			if (VRatioPrefetchC[k] <= 1) {
+				DisplayPipeLineDeliveryTimeChromaPrefetch[k] = swath_width_chroma_ub[k] *
+						DPPPerSurface[k] / HRatioChroma[k] / PixelClock[k];
+			} else {
+				DisplayPipeLineDeliveryTimeChromaPrefetch[k] =
+						swath_width_chroma_ub[k] / PSCL_THROUGHPUT_CHROMA[k] / Dppclk[k];
+			}
+		}
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML::%s: k=%d : DisplayPipeLineDeliveryTimeLuma = %f\n",
+				__func__, k, DisplayPipeLineDeliveryTimeLuma[k]);
+		dml_print("DML::%s: k=%d : DisplayPipeLineDeliveryTimeLumaPrefetch = %f\n",
+				__func__, k, DisplayPipeLineDeliveryTimeLumaPrefetch[k]);
+		dml_print("DML::%s: k=%d : DisplayPipeLineDeliveryTimeChroma = %f\n",
+				__func__, k, DisplayPipeLineDeliveryTimeChroma[k]);
+		dml_print("DML::%s: k=%d : DisplayPipeLineDeliveryTimeChromaPrefetch = %f\n",
+				__func__, k, DisplayPipeLineDeliveryTimeChromaPrefetch[k]);
+#endif
+	}
+
+	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+		if (!IsVertical(SourceRotation[k]))
+			req_per_swath_ub = swath_width_luma_ub[k] / BlockWidth256BytesY[k];
+		else
+			req_per_swath_ub = swath_width_luma_ub[k] / BlockHeight256BytesY[k];
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML::%s: k=%d : req_per_swath_ub = %f (Luma)\n", __func__, k, req_per_swath_ub);
+#endif
+
+		DisplayPipeRequestDeliveryTimeLuma[k] = DisplayPipeLineDeliveryTimeLuma[k] / req_per_swath_ub;
+		DisplayPipeRequestDeliveryTimeLumaPrefetch[k] =
+				DisplayPipeLineDeliveryTimeLumaPrefetch[k] / req_per_swath_ub;
+		if (BytePerPixelC[k] == 0) {
+			DisplayPipeRequestDeliveryTimeChroma[k] = 0;
+			DisplayPipeRequestDeliveryTimeChromaPrefetch[k] = 0;
+		} else {
+			if (!IsVertical(SourceRotation[k]))
+				req_per_swath_ub = swath_width_chroma_ub[k] / BlockWidth256BytesC[k];
+			else
+				req_per_swath_ub = swath_width_chroma_ub[k] / BlockHeight256BytesC[k];
+#ifdef __DML_VBA_DEBUG__
+			dml_print("DML::%s: k=%d : req_per_swath_ub = %f (Chroma)\n", __func__, k, req_per_swath_ub);
+#endif
+			DisplayPipeRequestDeliveryTimeChroma[k] =
+					DisplayPipeLineDeliveryTimeChroma[k] / req_per_swath_ub;
+			DisplayPipeRequestDeliveryTimeChromaPrefetch[k] =
+					DisplayPipeLineDeliveryTimeChromaPrefetch[k] / req_per_swath_ub;
+		}
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML::%s: k=%d : DisplayPipeRequestDeliveryTimeLuma = %f\n",
+				__func__, k, DisplayPipeRequestDeliveryTimeLuma[k]);
+		dml_print("DML::%s: k=%d : DisplayPipeRequestDeliveryTimeLumaPrefetch = %f\n",
+				__func__, k, DisplayPipeRequestDeliveryTimeLumaPrefetch[k]);
+		dml_print("DML::%s: k=%d : DisplayPipeRequestDeliveryTimeChroma = %f\n",
+				__func__, k, DisplayPipeRequestDeliveryTimeChroma[k]);
+		dml_print("DML::%s: k=%d : DisplayPipeRequestDeliveryTimeChromaPrefetch = %f\n",
+				__func__, k, DisplayPipeRequestDeliveryTimeChromaPrefetch[k]);
+#endif
+	}
+
+	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+		unsigned int cursor_req_per_width;
+
+		cursor_req_per_width = dml_ceil((double) CursorWidth[k][0] * (double) CursorBPP[k][0] /
+				256.0 / 8.0, 1.0);
+		if (NumberOfCursors[k] > 0) {
+			if (VRatio[k] <= 1) {
+				CursorRequestDeliveryTime[k] = (double) CursorWidth[k][0] /
+						HRatio[k] / PixelClock[k] / cursor_req_per_width;
+			} else {
+				CursorRequestDeliveryTime[k] = (double) CursorWidth[k][0] /
+						PSCL_THROUGHPUT[k] / Dppclk[k] / cursor_req_per_width;
+			}
+			if (VRatioPrefetchY[k] <= 1) {
+				CursorRequestDeliveryTimePrefetch[k] = (double) CursorWidth[k][0] /
+						HRatio[k] / PixelClock[k] / cursor_req_per_width;
+			} else {
+				CursorRequestDeliveryTimePrefetch[k] = (double) CursorWidth[k][0] /
+						PSCL_THROUGHPUT[k] / Dppclk[k] / cursor_req_per_width;
+			}
+		} else {
+			CursorRequestDeliveryTime[k] = 0;
+			CursorRequestDeliveryTimePrefetch[k] = 0;
+		}
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML::%s: k=%d : NumberOfCursors = %d\n",
+				__func__, k, NumberOfCursors[k]);
+		dml_print("DML::%s: k=%d : CursorRequestDeliveryTime = %f\n",
+				__func__, k, CursorRequestDeliveryTime[k]);
+		dml_print("DML::%s: k=%d : CursorRequestDeliveryTimePrefetch = %f\n",
+				__func__, k, CursorRequestDeliveryTimePrefetch[k]);
+#endif
+	}
+} // CalculatePixelDeliveryTimes
+
+void dml32_CalculateMetaAndPTETimes(
+		bool use_one_row_for_frame[],
+		unsigned int NumberOfActiveSurfaces,
+		bool GPUVMEnable,
+		unsigned int MetaChunkSize,
+		unsigned int MinMetaChunkSizeBytes,
+		unsigned int    HTotal[],
+		double  VRatio[],
+		double  VRatioChroma[],
+		double  DestinationLinesToRequestRowInVBlank[],
+		double  DestinationLinesToRequestRowInImmediateFlip[],
+		bool DCCEnable[],
+		double  PixelClock[],
+		unsigned int BytePerPixelY[],
+		unsigned int BytePerPixelC[],
+		enum dm_rotation_angle SourceRotation[],
+		unsigned int dpte_row_height[],
+		unsigned int dpte_row_height_chroma[],
+		unsigned int meta_row_width[],
+		unsigned int meta_row_width_chroma[],
+		unsigned int meta_row_height[],
+		unsigned int meta_row_height_chroma[],
+		unsigned int meta_req_width[],
+		unsigned int meta_req_width_chroma[],
+		unsigned int meta_req_height[],
+		unsigned int meta_req_height_chroma[],
+		unsigned int dpte_group_bytes[],
+		unsigned int    PTERequestSizeY[],
+		unsigned int    PTERequestSizeC[],
+		unsigned int    PixelPTEReqWidthY[],
+		unsigned int    PixelPTEReqHeightY[],
+		unsigned int    PixelPTEReqWidthC[],
+		unsigned int    PixelPTEReqHeightC[],
+		unsigned int    dpte_row_width_luma_ub[],
+		unsigned int    dpte_row_width_chroma_ub[],
+
+		/* Output */
+		double DST_Y_PER_PTE_ROW_NOM_L[],
+		double DST_Y_PER_PTE_ROW_NOM_C[],
+		double DST_Y_PER_META_ROW_NOM_L[],
+		double DST_Y_PER_META_ROW_NOM_C[],
+		double TimePerMetaChunkNominal[],
+		double TimePerChromaMetaChunkNominal[],
+		double TimePerMetaChunkVBlank[],
+		double TimePerChromaMetaChunkVBlank[],
+		double TimePerMetaChunkFlip[],
+		double TimePerChromaMetaChunkFlip[],
+		double time_per_pte_group_nom_luma[],
+		double time_per_pte_group_vblank_luma[],
+		double time_per_pte_group_flip_luma[],
+		double time_per_pte_group_nom_chroma[],
+		double time_per_pte_group_vblank_chroma[],
+		double time_per_pte_group_flip_chroma[])
+{
+	unsigned int   meta_chunk_width;
+	unsigned int   min_meta_chunk_width;
+	unsigned int   meta_chunk_per_row_int;
+	unsigned int   meta_row_remainder;
+	unsigned int   meta_chunk_threshold;
+	unsigned int   meta_chunks_per_row_ub;
+	unsigned int   meta_chunk_width_chroma;
+	unsigned int   min_meta_chunk_width_chroma;
+	unsigned int   meta_chunk_per_row_int_chroma;
+	unsigned int   meta_row_remainder_chroma;
+	unsigned int   meta_chunk_threshold_chroma;
+	unsigned int   meta_chunks_per_row_ub_chroma;
+	unsigned int   dpte_group_width_luma;
+	unsigned int   dpte_groups_per_row_luma_ub;
+	unsigned int   dpte_group_width_chroma;
+	unsigned int   dpte_groups_per_row_chroma_ub;
+	unsigned int k;
+
+	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+		DST_Y_PER_PTE_ROW_NOM_L[k] = dpte_row_height[k] / VRatio[k];
+		if (BytePerPixelC[k] == 0)
+			DST_Y_PER_PTE_ROW_NOM_C[k] = 0;
+		else
+			DST_Y_PER_PTE_ROW_NOM_C[k] = dpte_row_height_chroma[k] / VRatioChroma[k];
+		DST_Y_PER_META_ROW_NOM_L[k] = meta_row_height[k] / VRatio[k];
+		if (BytePerPixelC[k] == 0)
+			DST_Y_PER_META_ROW_NOM_C[k] = 0;
+		else
+			DST_Y_PER_META_ROW_NOM_C[k] = meta_row_height_chroma[k] / VRatioChroma[k];
+	}
+
+	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+		if (DCCEnable[k] == true) {
+			meta_chunk_width = MetaChunkSize * 1024 * 256 / BytePerPixelY[k] / meta_row_height[k];
+			min_meta_chunk_width = MinMetaChunkSizeBytes * 256 / BytePerPixelY[k] / meta_row_height[k];
+			meta_chunk_per_row_int = meta_row_width[k] / meta_chunk_width;
+			meta_row_remainder = meta_row_width[k] % meta_chunk_width;
+			if (!IsVertical(SourceRotation[k]))
+				meta_chunk_threshold = 2 * min_meta_chunk_width - meta_req_width[k];
+			else
+				meta_chunk_threshold = 2 * min_meta_chunk_width - meta_req_height[k];
+
+			if (meta_row_remainder <= meta_chunk_threshold)
+				meta_chunks_per_row_ub = meta_chunk_per_row_int + 1;
+			else
+				meta_chunks_per_row_ub = meta_chunk_per_row_int + 2;
+
+			TimePerMetaChunkNominal[k] = meta_row_height[k] / VRatio[k] *
+					HTotal[k] / PixelClock[k] / meta_chunks_per_row_ub;
+			TimePerMetaChunkVBlank[k] = DestinationLinesToRequestRowInVBlank[k] *
+					HTotal[k] / PixelClock[k] / meta_chunks_per_row_ub;
+			TimePerMetaChunkFlip[k] = DestinationLinesToRequestRowInImmediateFlip[k] *
+					HTotal[k] / PixelClock[k] / meta_chunks_per_row_ub;
+			if (BytePerPixelC[k] == 0) {
+				TimePerChromaMetaChunkNominal[k] = 0;
+				TimePerChromaMetaChunkVBlank[k] = 0;
+				TimePerChromaMetaChunkFlip[k] = 0;
+			} else {
+				meta_chunk_width_chroma = MetaChunkSize * 1024 * 256 / BytePerPixelC[k] /
+						meta_row_height_chroma[k];
+				min_meta_chunk_width_chroma = MinMetaChunkSizeBytes * 256 / BytePerPixelC[k] /
+						meta_row_height_chroma[k];
+				meta_chunk_per_row_int_chroma = (double) meta_row_width_chroma[k] /
+						meta_chunk_width_chroma;
+				meta_row_remainder_chroma = meta_row_width_chroma[k] % meta_chunk_width_chroma;
+				if (!IsVertical(SourceRotation[k])) {
+					meta_chunk_threshold_chroma = 2 * min_meta_chunk_width_chroma -
+							meta_req_width_chroma[k];
+				} else {
+					meta_chunk_threshold_chroma = 2 * min_meta_chunk_width_chroma -
+							meta_req_height_chroma[k];
+				}
+				if (meta_row_remainder_chroma <= meta_chunk_threshold_chroma)
+					meta_chunks_per_row_ub_chroma = meta_chunk_per_row_int_chroma + 1;
+				else
+					meta_chunks_per_row_ub_chroma = meta_chunk_per_row_int_chroma + 2;
+
+				TimePerChromaMetaChunkNominal[k] = meta_row_height_chroma[k] / VRatioChroma[k] *
+						HTotal[k] / PixelClock[k] / meta_chunks_per_row_ub_chroma;
+				TimePerChromaMetaChunkVBlank[k] = DestinationLinesToRequestRowInVBlank[k] *
+						HTotal[k] / PixelClock[k] / meta_chunks_per_row_ub_chroma;
+				TimePerChromaMetaChunkFlip[k] = DestinationLinesToRequestRowInImmediateFlip[k] *
+						HTotal[k] / PixelClock[k] / meta_chunks_per_row_ub_chroma;
+			}
+		} else {
+			TimePerMetaChunkNominal[k] = 0;
+			TimePerMetaChunkVBlank[k] = 0;
+			TimePerMetaChunkFlip[k] = 0;
+			TimePerChromaMetaChunkNominal[k] = 0;
+			TimePerChromaMetaChunkVBlank[k] = 0;
+			TimePerChromaMetaChunkFlip[k] = 0;
+		}
+	}
+
+	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+		if (GPUVMEnable == true) {
+			if (!IsVertical(SourceRotation[k])) {
+				dpte_group_width_luma = (double) dpte_group_bytes[k] /
+						(double) PTERequestSizeY[k] * PixelPTEReqWidthY[k];
+			} else {
+				dpte_group_width_luma = (double) dpte_group_bytes[k] /
+						(double) PTERequestSizeY[k] * PixelPTEReqHeightY[k];
+			}
+
+			if (use_one_row_for_frame[k]) {
+				dpte_groups_per_row_luma_ub = dml_ceil((double) dpte_row_width_luma_ub[k] /
+						(double) dpte_group_width_luma / 2.0, 1.0);
+			} else {
+				dpte_groups_per_row_luma_ub = dml_ceil((double) dpte_row_width_luma_ub[k] /
+						(double) dpte_group_width_luma, 1.0);
+			}
+#ifdef __DML_VBA_DEBUG__
+			dml_print("DML::%s: k=%0d, use_one_row_for_frame        = %d\n",
+					__func__, k, use_one_row_for_frame[k]);
+			dml_print("DML::%s: k=%0d, dpte_group_bytes             = %d\n",
+					__func__, k, dpte_group_bytes[k]);
+			dml_print("DML::%s: k=%0d, PTERequestSizeY              = %d\n",
+					__func__, k, PTERequestSizeY[k]);
+			dml_print("DML::%s: k=%0d, PixelPTEReqWidthY            = %d\n",
+					__func__, k, PixelPTEReqWidthY[k]);
+			dml_print("DML::%s: k=%0d, PixelPTEReqHeightY           = %d\n",
+					__func__, k, PixelPTEReqHeightY[k]);
+			dml_print("DML::%s: k=%0d, dpte_row_width_luma_ub       = %d\n",
+					__func__, k, dpte_row_width_luma_ub[k]);
+			dml_print("DML::%s: k=%0d, dpte_group_width_luma        = %d\n",
+					__func__, k, dpte_group_width_luma);
+			dml_print("DML::%s: k=%0d, dpte_groups_per_row_luma_ub  = %d\n",
+					__func__, k, dpte_groups_per_row_luma_ub);
+#endif
+
+			time_per_pte_group_nom_luma[k] = DST_Y_PER_PTE_ROW_NOM_L[k] *
+					HTotal[k] / PixelClock[k] / dpte_groups_per_row_luma_ub;
+			time_per_pte_group_vblank_luma[k] = DestinationLinesToRequestRowInVBlank[k] *
+					HTotal[k] / PixelClock[k] / dpte_groups_per_row_luma_ub;
+			time_per_pte_group_flip_luma[k] = DestinationLinesToRequestRowInImmediateFlip[k] *
+					HTotal[k] / PixelClock[k] / dpte_groups_per_row_luma_ub;
+			if (BytePerPixelC[k] == 0) {
+				time_per_pte_group_nom_chroma[k] = 0;
+				time_per_pte_group_vblank_chroma[k] = 0;
+				time_per_pte_group_flip_chroma[k] = 0;
+			} else {
+				if (!IsVertical(SourceRotation[k])) {
+					dpte_group_width_chroma = (double) dpte_group_bytes[k] /
+							(double) PTERequestSizeC[k] * PixelPTEReqWidthC[k];
+				} else {
+					dpte_group_width_chroma = (double) dpte_group_bytes[k] /
+							(double) PTERequestSizeC[k] * PixelPTEReqHeightC[k];
+				}
+
+				if (use_one_row_for_frame[k]) {
+					dpte_groups_per_row_chroma_ub = dml_ceil((double) dpte_row_width_chroma_ub[k] /
+							(double) dpte_group_width_chroma / 2.0, 1.0);
+				} else {
+					dpte_groups_per_row_chroma_ub = dml_ceil((double) dpte_row_width_chroma_ub[k] /
+							(double) dpte_group_width_chroma, 1.0);
+				}
+#ifdef __DML_VBA_DEBUG__
+				dml_print("DML::%s: k=%0d, dpte_row_width_chroma_ub        = %d\n",
+						__func__, k, dpte_row_width_chroma_ub[k]);
+				dml_print("DML::%s: k=%0d, dpte_group_width_chroma        = %d\n",
+						__func__, k, dpte_group_width_chroma);
+				dml_print("DML::%s: k=%0d, dpte_groups_per_row_chroma_ub  = %d\n",
+						__func__, k, dpte_groups_per_row_chroma_ub);
+#endif
+				time_per_pte_group_nom_chroma[k] = DST_Y_PER_PTE_ROW_NOM_C[k] *
+						HTotal[k] / PixelClock[k] / dpte_groups_per_row_chroma_ub;
+				time_per_pte_group_vblank_chroma[k] = DestinationLinesToRequestRowInVBlank[k] *
+						HTotal[k] / PixelClock[k] / dpte_groups_per_row_chroma_ub;
+				time_per_pte_group_flip_chroma[k] = DestinationLinesToRequestRowInImmediateFlip[k] *
+						HTotal[k] / PixelClock[k] / dpte_groups_per_row_chroma_ub;
+			}
+		} else {
+			time_per_pte_group_nom_luma[k] = 0;
+			time_per_pte_group_vblank_luma[k] = 0;
+			time_per_pte_group_flip_luma[k] = 0;
+			time_per_pte_group_nom_chroma[k] = 0;
+			time_per_pte_group_vblank_chroma[k] = 0;
+			time_per_pte_group_flip_chroma[k] = 0;
+		}
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML::%s: k=%0d, DestinationLinesToRequestRowInVBlank         = %f\n",
+				__func__, k, DestinationLinesToRequestRowInVBlank[k]);
+		dml_print("DML::%s: k=%0d, DestinationLinesToRequestRowInImmediateFlip  = %f\n",
+				__func__, k, DestinationLinesToRequestRowInImmediateFlip[k]);
+		dml_print("DML::%s: k=%0d, DST_Y_PER_PTE_ROW_NOM_L                      = %f\n",
+				__func__, k, DST_Y_PER_PTE_ROW_NOM_L[k]);
+		dml_print("DML::%s: k=%0d, DST_Y_PER_PTE_ROW_NOM_C                      = %f\n",
+				__func__, k, DST_Y_PER_PTE_ROW_NOM_C[k]);
+		dml_print("DML::%s: k=%0d, DST_Y_PER_META_ROW_NOM_L                     = %f\n",
+				__func__, k, DST_Y_PER_META_ROW_NOM_L[k]);
+		dml_print("DML::%s: k=%0d, DST_Y_PER_META_ROW_NOM_C                     = %f\n",
+				__func__, k, DST_Y_PER_META_ROW_NOM_C[k]);
+		dml_print("DML::%s: k=%0d, TimePerMetaChunkNominal          = %f\n",
+				__func__, k, TimePerMetaChunkNominal[k]);
+		dml_print("DML::%s: k=%0d, TimePerMetaChunkVBlank           = %f\n",
+				__func__, k, TimePerMetaChunkVBlank[k]);
+		dml_print("DML::%s: k=%0d, TimePerMetaChunkFlip             = %f\n",
+				__func__, k, TimePerMetaChunkFlip[k]);
+		dml_print("DML::%s: k=%0d, TimePerChromaMetaChunkNominal    = %f\n",
+				__func__, k, TimePerChromaMetaChunkNominal[k]);
+		dml_print("DML::%s: k=%0d, TimePerChromaMetaChunkVBlank     = %f\n",
+				__func__, k, TimePerChromaMetaChunkVBlank[k]);
+		dml_print("DML::%s: k=%0d, TimePerChromaMetaChunkFlip       = %f\n",
+				__func__, k, TimePerChromaMetaChunkFlip[k]);
+		dml_print("DML::%s: k=%0d, time_per_pte_group_nom_luma      = %f\n",
+				__func__, k, time_per_pte_group_nom_luma[k]);
+		dml_print("DML::%s: k=%0d, time_per_pte_group_vblank_luma   = %f\n",
+				__func__, k, time_per_pte_group_vblank_luma[k]);
+		dml_print("DML::%s: k=%0d, time_per_pte_group_flip_luma     = %f\n",
+				__func__, k, time_per_pte_group_flip_luma[k]);
+		dml_print("DML::%s: k=%0d, time_per_pte_group_nom_chroma    = %f\n",
+				__func__, k, time_per_pte_group_nom_chroma[k]);
+		dml_print("DML::%s: k=%0d, time_per_pte_group_vblank_chroma = %f\n",
+				__func__, k, time_per_pte_group_vblank_chroma[k]);
+		dml_print("DML::%s: k=%0d, time_per_pte_group_flip_chroma   = %f\n",
+				__func__, k, time_per_pte_group_flip_chroma[k]);
+#endif
+	}
+} // CalculateMetaAndPTETimes
+
+void dml32_CalculateVMGroupAndRequestTimes(
+		unsigned int     NumberOfActiveSurfaces,
+		bool     GPUVMEnable,
+		unsigned int     GPUVMMaxPageTableLevels,
+		unsigned int     HTotal[],
+		unsigned int     BytePerPixelC[],
+		double      DestinationLinesToRequestVMInVBlank[],
+		double      DestinationLinesToRequestVMInImmediateFlip[],
+		bool     DCCEnable[],
+		double      PixelClock[],
+		unsigned int        dpte_row_width_luma_ub[],
+		unsigned int        dpte_row_width_chroma_ub[],
+		unsigned int     vm_group_bytes[],
+		unsigned int     dpde0_bytes_per_frame_ub_l[],
+		unsigned int     dpde0_bytes_per_frame_ub_c[],
+		unsigned int        meta_pte_bytes_per_frame_ub_l[],
+		unsigned int        meta_pte_bytes_per_frame_ub_c[],
+
+		/* Output */
+		double      TimePerVMGroupVBlank[],
+		double      TimePerVMGroupFlip[],
+		double      TimePerVMRequestVBlank[],
+		double      TimePerVMRequestFlip[])
+{
+	unsigned int k;
+	unsigned int   num_group_per_lower_vm_stage;
+	unsigned int   num_req_per_lower_vm_stage;
+
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: NumberOfActiveSurfaces = %d\n", __func__, NumberOfActiveSurfaces);
+	dml_print("DML::%s: GPUVMEnable = %d\n", __func__, GPUVMEnable);
+#endif
+	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML::%s: k=%0d, DCCEnable = %d\n", __func__, k, DCCEnable[k]);
+		dml_print("DML::%s: k=%0d, vm_group_bytes = %d\n", __func__, k, vm_group_bytes[k]);
+		dml_print("DML::%s: k=%0d, dpde0_bytes_per_frame_ub_l = %d\n",
+				__func__, k, dpde0_bytes_per_frame_ub_l[k]);
+		dml_print("DML::%s: k=%0d, dpde0_bytes_per_frame_ub_c = %d\n",
+				__func__, k, dpde0_bytes_per_frame_ub_c[k]);
+		dml_print("DML::%s: k=%0d, meta_pte_bytes_per_frame_ub_l = %d\n",
+				__func__, k, meta_pte_bytes_per_frame_ub_l[k]);
+		dml_print("DML::%s: k=%0d, meta_pte_bytes_per_frame_ub_c = %d\n",
+				__func__, k, meta_pte_bytes_per_frame_ub_c[k]);
+#endif
+
+		if (GPUVMEnable == true && (DCCEnable[k] == true || GPUVMMaxPageTableLevels > 1)) {
+			if (DCCEnable[k] == false) {
+				if (BytePerPixelC[k] > 0) {
+					num_group_per_lower_vm_stage = dml_ceil(
+							(double) (dpde0_bytes_per_frame_ub_l[k]) /
+							(double) (vm_group_bytes[k]), 1.0) +
+							dml_ceil((double) (dpde0_bytes_per_frame_ub_c[k]) /
+							(double) (vm_group_bytes[k]), 1.0);
+				} else {
+					num_group_per_lower_vm_stage = dml_ceil(
+							(double) (dpde0_bytes_per_frame_ub_l[k]) /
+							(double) (vm_group_bytes[k]), 1.0);
+				}
+			} else {
+				if (GPUVMMaxPageTableLevels == 1) {
+					if (BytePerPixelC[k] > 0) {
+						num_group_per_lower_vm_stage = dml_ceil(
+							(double) (meta_pte_bytes_per_frame_ub_l[k]) /
+							(double) (vm_group_bytes[k]), 1.0) +
+							dml_ceil((double) (meta_pte_bytes_per_frame_ub_c[k]) /
+							(double) (vm_group_bytes[k]), 1.0);
+					} else {
+						num_group_per_lower_vm_stage = dml_ceil(
+								(double) (meta_pte_bytes_per_frame_ub_l[k]) /
+								(double) (vm_group_bytes[k]), 1.0);
+					}
+				} else {
+					if (BytePerPixelC[k] > 0) {
+						num_group_per_lower_vm_stage = 2 + dml_ceil(
+							(double) (dpde0_bytes_per_frame_ub_l[k]) /
+							(double) (vm_group_bytes[k]), 1) +
+							dml_ceil((double) (dpde0_bytes_per_frame_ub_c[k]) /
+							(double) (vm_group_bytes[k]), 1) +
+							dml_ceil((double) (meta_pte_bytes_per_frame_ub_l[k]) /
+							(double) (vm_group_bytes[k]), 1) +
+							dml_ceil((double) (meta_pte_bytes_per_frame_ub_c[k]) /
+							(double) (vm_group_bytes[k]), 1);
+					} else {
+						num_group_per_lower_vm_stage = 1 + dml_ceil(
+							(double) (dpde0_bytes_per_frame_ub_l[k]) /
+							(double) (vm_group_bytes[k]), 1) + dml_ceil(
+							(double) (meta_pte_bytes_per_frame_ub_l[k]) /
+							(double) (vm_group_bytes[k]), 1);
+					}
+				}
+			}
+
+			if (DCCEnable[k] == false) {
+				if (BytePerPixelC[k] > 0) {
+					num_req_per_lower_vm_stage = dpde0_bytes_per_frame_ub_l[k] / 64 +
+							dpde0_bytes_per_frame_ub_c[k] / 64;
+				} else {
+					num_req_per_lower_vm_stage = dpde0_bytes_per_frame_ub_l[k] / 64;
+				}
+			} else {
+				if (GPUVMMaxPageTableLevels == 1) {
+					if (BytePerPixelC[k] > 0) {
+						num_req_per_lower_vm_stage = meta_pte_bytes_per_frame_ub_l[k] / 64 +
+								meta_pte_bytes_per_frame_ub_c[k] / 64;
+					} else {
+						num_req_per_lower_vm_stage = meta_pte_bytes_per_frame_ub_l[k] / 64;
+					}
+				} else {
+					if (BytePerPixelC[k] > 0) {
+						num_req_per_lower_vm_stage = dpde0_bytes_per_frame_ub_l[k] /
+								64 + dpde0_bytes_per_frame_ub_c[k] / 64 +
+								meta_pte_bytes_per_frame_ub_l[k] / 64 +
+								meta_pte_bytes_per_frame_ub_c[k] / 64;
+					} else {
+						num_req_per_lower_vm_stage = dpde0_bytes_per_frame_ub_l[k] /
+								64 + meta_pte_bytes_per_frame_ub_l[k] / 64;
+					}
+				}
+			}
+
+			TimePerVMGroupVBlank[k] = DestinationLinesToRequestVMInVBlank[k] *
+					HTotal[k] / PixelClock[k] / num_group_per_lower_vm_stage;
+			TimePerVMGroupFlip[k] = DestinationLinesToRequestVMInImmediateFlip[k] *
+					HTotal[k] / PixelClock[k] / num_group_per_lower_vm_stage;
+			TimePerVMRequestVBlank[k] = DestinationLinesToRequestVMInVBlank[k] *
+					HTotal[k] / PixelClock[k] / num_req_per_lower_vm_stage;
+			TimePerVMRequestFlip[k] = DestinationLinesToRequestVMInImmediateFlip[k] *
+					HTotal[k] / PixelClock[k] / num_req_per_lower_vm_stage;
+
+			if (GPUVMMaxPageTableLevels > 2) {
+				TimePerVMGroupVBlank[k]    = TimePerVMGroupVBlank[k] / 2;
+				TimePerVMGroupFlip[k]      = TimePerVMGroupFlip[k] / 2;
+				TimePerVMRequestVBlank[k]  = TimePerVMRequestVBlank[k] / 2;
+				TimePerVMRequestFlip[k]    = TimePerVMRequestFlip[k] / 2;
+			}
+
+		} else {
+			TimePerVMGroupVBlank[k] = 0;
+			TimePerVMGroupFlip[k] = 0;
+			TimePerVMRequestVBlank[k] = 0;
+			TimePerVMRequestFlip[k] = 0;
+		}
+
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML::%s: k=%0d, TimePerVMGroupVBlank = %f\n", __func__, k, TimePerVMGroupVBlank[k]);
+		dml_print("DML::%s: k=%0d, TimePerVMGroupFlip = %f\n", __func__, k, TimePerVMGroupFlip[k]);
+		dml_print("DML::%s: k=%0d, TimePerVMRequestVBlank = %f\n", __func__, k, TimePerVMRequestVBlank[k]);
+		dml_print("DML::%s: k=%0d, TimePerVMRequestFlip = %f\n", __func__, k, TimePerVMRequestFlip[k]);
+#endif
+	}
+} // CalculateVMGroupAndRequestTimes
+
+void dml32_CalculateDCCConfiguration(
+		bool             DCCEnabled,
+		bool             DCCProgrammingAssumesScanDirectionUnknown,
+		enum source_format_class SourcePixelFormat,
+		unsigned int             SurfaceWidthLuma,
+		unsigned int             SurfaceWidthChroma,
+		unsigned int             SurfaceHeightLuma,
+		unsigned int             SurfaceHeightChroma,
+		unsigned int                nomDETInKByte,
+		unsigned int             RequestHeight256ByteLuma,
+		unsigned int             RequestHeight256ByteChroma,
+		enum dm_swizzle_mode     TilingFormat,
+		unsigned int             BytePerPixelY,
+		unsigned int             BytePerPixelC,
+		double              BytePerPixelDETY,
+		double              BytePerPixelDETC,
+		enum dm_rotation_angle   SourceRotation,
+		/* Output */
+		unsigned int        *MaxUncompressedBlockLuma,
+		unsigned int        *MaxUncompressedBlockChroma,
+		unsigned int        *MaxCompressedBlockLuma,
+		unsigned int        *MaxCompressedBlockChroma,
+		unsigned int        *IndependentBlockLuma,
+		unsigned int        *IndependentBlockChroma)
+{
+
+	enum RequestType   RequestLuma;
+	enum RequestType   RequestChroma;
+
+	unsigned int   segment_order_horz_contiguous_luma;
+	unsigned int   segment_order_horz_contiguous_chroma;
+	unsigned int   segment_order_vert_contiguous_luma;
+	unsigned int   segment_order_vert_contiguous_chroma;
+	unsigned int req128_horz_wc_l;
+	unsigned int req128_horz_wc_c;
+	unsigned int req128_vert_wc_l;
+	unsigned int req128_vert_wc_c;
+	unsigned int MAS_vp_horz_limit;
+	unsigned int MAS_vp_vert_limit;
+	unsigned int max_vp_horz_width;
+	unsigned int max_vp_vert_height;
+	unsigned int eff_surf_width_l;
+	unsigned int eff_surf_width_c;
+	unsigned int eff_surf_height_l;
+	unsigned int eff_surf_height_c;
+	unsigned int full_swath_bytes_horz_wc_l;
+	unsigned int full_swath_bytes_horz_wc_c;
+	unsigned int full_swath_bytes_vert_wc_l;
+	unsigned int full_swath_bytes_vert_wc_c;
+	unsigned int DETBufferSizeForDCC = nomDETInKByte * 1024;
+
+	unsigned int   yuv420;
+	unsigned int   horz_div_l;
+	unsigned int   horz_div_c;
+	unsigned int   vert_div_l;
+	unsigned int   vert_div_c;
+
+	unsigned int     swath_buf_size;
+	double   detile_buf_vp_horz_limit;
+	double   detile_buf_vp_vert_limit;
+
+	typedef enum {
+		REQ_256Bytes,
+		REQ_128BytesNonContiguous,
+		REQ_128BytesContiguous,
+		REQ_NA
+	} RequestType;
+
+	yuv420 = ((SourcePixelFormat == dm_420_8 || SourcePixelFormat == dm_420_10 ||
+			SourcePixelFormat == dm_420_12) ? 1 : 0);
+	horz_div_l = 1;
+	horz_div_c = 1;
+	vert_div_l = 1;
+	vert_div_c = 1;
+
+	if (BytePerPixelY == 1)
+		vert_div_l = 0;
+	if (BytePerPixelC == 1)
+		vert_div_c = 0;
+
+	if (BytePerPixelC == 0) {
+		swath_buf_size = DETBufferSizeForDCC / 2 - 2 * 256;
+		detile_buf_vp_horz_limit = (double) swath_buf_size / ((double) RequestHeight256ByteLuma *
+				BytePerPixelY / (1 + horz_div_l));
+		detile_buf_vp_vert_limit = (double) swath_buf_size / (256.0 / RequestHeight256ByteLuma /
+				(1 + vert_div_l));
+	} else {
+		swath_buf_size = DETBufferSizeForDCC / 2 - 2 * 2 * 256;
+		detile_buf_vp_horz_limit = (double) swath_buf_size / ((double) RequestHeight256ByteLuma *
+				BytePerPixelY / (1 + horz_div_l) + (double) RequestHeight256ByteChroma *
+				BytePerPixelC / (1 + horz_div_c) / (1 + yuv420));
+		detile_buf_vp_vert_limit = (double) swath_buf_size / (256.0 / RequestHeight256ByteLuma /
+				(1 + vert_div_l) + 256.0 / RequestHeight256ByteChroma /
+				(1 + vert_div_c) / (1 + yuv420));
+	}
+
+	if (SourcePixelFormat == dm_420_10) {
+		detile_buf_vp_horz_limit = 1.5 * detile_buf_vp_horz_limit;
+		detile_buf_vp_vert_limit = 1.5 * detile_buf_vp_vert_limit;
+	}
+
+	detile_buf_vp_horz_limit = dml_floor(detile_buf_vp_horz_limit - 1, 16);
+	detile_buf_vp_vert_limit = dml_floor(detile_buf_vp_vert_limit - 1, 16);
+
+	MAS_vp_horz_limit = SourcePixelFormat == dm_rgbe_alpha ? 3840 : 6144;
+	MAS_vp_vert_limit = SourcePixelFormat == dm_rgbe_alpha ? 3840 : (BytePerPixelY == 8 ? 3072 : 6144);
+	max_vp_horz_width = dml_min((double) MAS_vp_horz_limit, detile_buf_vp_horz_limit);
+	max_vp_vert_height = dml_min((double) MAS_vp_vert_limit, detile_buf_vp_vert_limit);
+	eff_surf_width_l =  (SurfaceWidthLuma > max_vp_horz_width ? max_vp_horz_width : SurfaceWidthLuma);
+	eff_surf_width_c =  eff_surf_width_l / (1 + yuv420);
+	eff_surf_height_l =  (SurfaceHeightLuma > max_vp_vert_height ? max_vp_vert_height : SurfaceHeightLuma);
+	eff_surf_height_c =  eff_surf_height_l / (1 + yuv420);
+
+	full_swath_bytes_horz_wc_l = eff_surf_width_l * RequestHeight256ByteLuma * BytePerPixelY;
+	full_swath_bytes_vert_wc_l = eff_surf_height_l * 256 / RequestHeight256ByteLuma;
+	if (BytePerPixelC > 0) {
+		full_swath_bytes_horz_wc_c = eff_surf_width_c * RequestHeight256ByteChroma * BytePerPixelC;
+		full_swath_bytes_vert_wc_c = eff_surf_height_c * 256 / RequestHeight256ByteChroma;
+	} else {
+		full_swath_bytes_horz_wc_c = 0;
+		full_swath_bytes_vert_wc_c = 0;
+	}
+
+	if (SourcePixelFormat == dm_420_10) {
+		full_swath_bytes_horz_wc_l = dml_ceil((double) full_swath_bytes_horz_wc_l * 2.0 / 3.0, 256.0);
+		full_swath_bytes_horz_wc_c = dml_ceil((double) full_swath_bytes_horz_wc_c * 2.0 / 3.0, 256.0);
+		full_swath_bytes_vert_wc_l = dml_ceil((double) full_swath_bytes_vert_wc_l * 2.0 / 3.0, 256.0);
+		full_swath_bytes_vert_wc_c = dml_ceil((double) full_swath_bytes_vert_wc_c * 2.0 / 3.0, 256.0);
+	}
+
+	if (2 * full_swath_bytes_horz_wc_l + 2 * full_swath_bytes_horz_wc_c <= DETBufferSizeForDCC) {
+		req128_horz_wc_l = 0;
+		req128_horz_wc_c = 0;
+	} else if (full_swath_bytes_horz_wc_l < 1.5 * full_swath_bytes_horz_wc_c && 2 * full_swath_bytes_horz_wc_l +
+			full_swath_bytes_horz_wc_c <= DETBufferSizeForDCC) {
+		req128_horz_wc_l = 0;
+		req128_horz_wc_c = 1;
+	} else if (full_swath_bytes_horz_wc_l >= 1.5 * full_swath_bytes_horz_wc_c && full_swath_bytes_horz_wc_l + 2 *
+			full_swath_bytes_horz_wc_c <= DETBufferSizeForDCC) {
+		req128_horz_wc_l = 1;
+		req128_horz_wc_c = 0;
+	} else {
+		req128_horz_wc_l = 1;
+		req128_horz_wc_c = 1;
+	}
+
+	if (2 * full_swath_bytes_vert_wc_l + 2 * full_swath_bytes_vert_wc_c <= DETBufferSizeForDCC) {
+		req128_vert_wc_l = 0;
+		req128_vert_wc_c = 0;
+	} else if (full_swath_bytes_vert_wc_l < 1.5 * full_swath_bytes_vert_wc_c && 2 *
+			full_swath_bytes_vert_wc_l + full_swath_bytes_vert_wc_c <= DETBufferSizeForDCC) {
+		req128_vert_wc_l = 0;
+		req128_vert_wc_c = 1;
+	} else if (full_swath_bytes_vert_wc_l >= 1.5 * full_swath_bytes_vert_wc_c &&
+			full_swath_bytes_vert_wc_l + 2 * full_swath_bytes_vert_wc_c <= DETBufferSizeForDCC) {
+		req128_vert_wc_l = 1;
+		req128_vert_wc_c = 0;
+	} else {
+		req128_vert_wc_l = 1;
+		req128_vert_wc_c = 1;
+	}
+
+	if (BytePerPixelY == 2) {
+		segment_order_horz_contiguous_luma = 0;
+		segment_order_vert_contiguous_luma = 1;
+	} else {
+		segment_order_horz_contiguous_luma = 1;
+		segment_order_vert_contiguous_luma = 0;
+	}
+
+	if (BytePerPixelC == 2) {
+		segment_order_horz_contiguous_chroma = 0;
+		segment_order_vert_contiguous_chroma = 1;
+	} else {
+		segment_order_horz_contiguous_chroma = 1;
+		segment_order_vert_contiguous_chroma = 0;
+	}
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: DCCEnabled = %d\n", __func__, DCCEnabled);
+	dml_print("DML::%s: nomDETInKByte = %d\n", __func__, nomDETInKByte);
+	dml_print("DML::%s: DETBufferSizeForDCC = %d\n", __func__, DETBufferSizeForDCC);
+	dml_print("DML::%s: req128_horz_wc_l = %d\n", __func__, req128_horz_wc_l);
+	dml_print("DML::%s: req128_horz_wc_c = %d\n", __func__, req128_horz_wc_c);
+	dml_print("DML::%s: full_swath_bytes_horz_wc_l = %d\n", __func__, full_swath_bytes_horz_wc_l);
+	dml_print("DML::%s: full_swath_bytes_vert_wc_c = %d\n", __func__, full_swath_bytes_vert_wc_c);
+	dml_print("DML::%s: segment_order_horz_contiguous_luma = %d\n", __func__, segment_order_horz_contiguous_luma);
+	dml_print("DML::%s: segment_order_horz_contiguous_chroma = %d\n",
+			__func__, segment_order_horz_contiguous_chroma);
+#endif
+
+	if (DCCProgrammingAssumesScanDirectionUnknown == true) {
+		if (req128_horz_wc_l == 0 && req128_vert_wc_l == 0)
+			RequestLuma = REQ_256Bytes;
+		else if ((req128_horz_wc_l == 1 && segment_order_horz_contiguous_luma == 0) ||
+				(req128_vert_wc_l == 1 && segment_order_vert_contiguous_luma == 0))
+			RequestLuma = REQ_128BytesNonContiguous;
+		else
+			RequestLuma = REQ_128BytesContiguous;
+
+		if (req128_horz_wc_c == 0 && req128_vert_wc_c == 0)
+			RequestChroma = REQ_256Bytes;
+		else if ((req128_horz_wc_c == 1 && segment_order_horz_contiguous_chroma == 0) ||
+				(req128_vert_wc_c == 1 && segment_order_vert_contiguous_chroma == 0))
+			RequestChroma = REQ_128BytesNonContiguous;
+		else
+			RequestChroma = REQ_128BytesContiguous;
+
+	} else if (!IsVertical(SourceRotation)) {
+		if (req128_horz_wc_l == 0)
+			RequestLuma = REQ_256Bytes;
+		else if (segment_order_horz_contiguous_luma == 0)
+			RequestLuma = REQ_128BytesNonContiguous;
+		else
+			RequestLuma = REQ_128BytesContiguous;
+
+		if (req128_horz_wc_c == 0)
+			RequestChroma = REQ_256Bytes;
+		else if (segment_order_horz_contiguous_chroma == 0)
+			RequestChroma = REQ_128BytesNonContiguous;
+		else
+			RequestChroma = REQ_128BytesContiguous;
+
+	} else {
+		if (req128_vert_wc_l == 0)
+			RequestLuma = REQ_256Bytes;
+		else if (segment_order_vert_contiguous_luma == 0)
+			RequestLuma = REQ_128BytesNonContiguous;
+		else
+			RequestLuma = REQ_128BytesContiguous;
+
+		if (req128_vert_wc_c == 0)
+			RequestChroma = REQ_256Bytes;
+		else if (segment_order_vert_contiguous_chroma == 0)
+			RequestChroma = REQ_128BytesNonContiguous;
+		else
+			RequestChroma = REQ_128BytesContiguous;
+	}
+
+	if (RequestLuma == (enum RequestType) REQ_256Bytes) {
+		*MaxUncompressedBlockLuma = 256;
+		*MaxCompressedBlockLuma = 256;
+		*IndependentBlockLuma = 0;
+	} else if (RequestLuma == (enum RequestType) REQ_128BytesContiguous) {
+		*MaxUncompressedBlockLuma = 256;
+		*MaxCompressedBlockLuma = 128;
+		*IndependentBlockLuma = 128;
+	} else {
+		*MaxUncompressedBlockLuma = 256;
+		*MaxCompressedBlockLuma = 64;
+		*IndependentBlockLuma = 64;
+	}
+
+	if (RequestChroma == (enum RequestType) REQ_256Bytes) {
+		*MaxUncompressedBlockChroma = 256;
+		*MaxCompressedBlockChroma = 256;
+		*IndependentBlockChroma = 0;
+	} else if (RequestChroma == (enum RequestType) REQ_128BytesContiguous) {
+		*MaxUncompressedBlockChroma = 256;
+		*MaxCompressedBlockChroma = 128;
+		*IndependentBlockChroma = 128;
+	} else {
+		*MaxUncompressedBlockChroma = 256;
+		*MaxCompressedBlockChroma = 64;
+		*IndependentBlockChroma = 64;
+	}
+
+	if (DCCEnabled != true || BytePerPixelC == 0) {
+		*MaxUncompressedBlockChroma = 0;
+		*MaxCompressedBlockChroma = 0;
+		*IndependentBlockChroma = 0;
+	}
+
+	if (DCCEnabled != true) {
+		*MaxUncompressedBlockLuma = 0;
+		*MaxCompressedBlockLuma = 0;
+		*IndependentBlockLuma = 0;
+	}
+
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: MaxUncompressedBlockLuma = %d\n", __func__, *MaxUncompressedBlockLuma);
+	dml_print("DML::%s: MaxCompressedBlockLuma = %d\n", __func__, *MaxCompressedBlockLuma);
+	dml_print("DML::%s: IndependentBlockLuma = %d\n", __func__, *IndependentBlockLuma);
+	dml_print("DML::%s: MaxUncompressedBlockChroma = %d\n", __func__, *MaxUncompressedBlockChroma);
+	dml_print("DML::%s: MaxCompressedBlockChroma = %d\n", __func__, *MaxCompressedBlockChroma);
+	dml_print("DML::%s: IndependentBlockChroma = %d\n", __func__, *IndependentBlockChroma);
+#endif
+
+} // CalculateDCCConfiguration
+
+void dml32_CalculateStutterEfficiency(
+		unsigned int      CompressedBufferSizeInkByte,
+		enum dm_use_mall_for_pstate_change_mode UseMALLForPStateChange[],
+		bool   UnboundedRequestEnabled,
+		unsigned int      MetaFIFOSizeInKEntries,
+		unsigned int      ZeroSizeBufferEntries,
+		unsigned int      PixelChunkSizeInKByte,
+		unsigned int   NumberOfActiveSurfaces,
+		unsigned int      ROBBufferSizeInKByte,
+		double    TotalDataReadBandwidth,
+		double    DCFCLK,
+		double    ReturnBW,
+		unsigned int      CompbufReservedSpace64B,
+		unsigned int      CompbufReservedSpaceZs,
+		double    SRExitTime,
+		double    SRExitZ8Time,
+		bool   SynchronizeTimingsFinal,
+		unsigned int   BlendingAndTiming[],
+		double    StutterEnterPlusExitWatermark,
+		double    Z8StutterEnterPlusExitWatermark,
+		bool   ProgressiveToInterlaceUnitInOPP,
+		bool   Interlace[],
+		double    MinTTUVBlank[],
+		unsigned int   DPPPerSurface[],
+		unsigned int      DETBufferSizeY[],
+		unsigned int   BytePerPixelY[],
+		double    BytePerPixelDETY[],
+		double      SwathWidthY[],
+		unsigned int   SwathHeightY[],
+		unsigned int   SwathHeightC[],
+		double    NetDCCRateLuma[],
+		double    NetDCCRateChroma[],
+		double    DCCFractionOfZeroSizeRequestsLuma[],
+		double    DCCFractionOfZeroSizeRequestsChroma[],
+		unsigned int      HTotal[],
+		unsigned int      VTotal[],
+		double    PixelClock[],
+		double    VRatio[],
+		enum dm_rotation_angle SourceRotation[],
+		unsigned int   BlockHeight256BytesY[],
+		unsigned int   BlockWidth256BytesY[],
+		unsigned int   BlockHeight256BytesC[],
+		unsigned int   BlockWidth256BytesC[],
+		unsigned int   DCCYMaxUncompressedBlock[],
+		unsigned int   DCCCMaxUncompressedBlock[],
+		unsigned int      VActive[],
+		bool   DCCEnable[],
+		bool   WritebackEnable[],
+		double    ReadBandwidthSurfaceLuma[],
+		double    ReadBandwidthSurfaceChroma[],
+		double    meta_row_bw[],
+		double    dpte_row_bw[],
+
+		/* Output */
+		double   *StutterEfficiencyNotIncludingVBlank,
+		double   *StutterEfficiency,
+		unsigned int     *NumberOfStutterBurstsPerFrame,
+		double   *Z8StutterEfficiencyNotIncludingVBlank,
+		double   *Z8StutterEfficiency,
+		unsigned int     *Z8NumberOfStutterBurstsPerFrame,
+		double   *StutterPeriod,
+		bool  *DCHUBBUB_ARB_CSTATE_MAX_CAP_MODE)
+{
+
+	bool FoundCriticalSurface = false;
+	unsigned int SwathSizeCriticalSurface = 0;
+	unsigned int LastChunkOfSwathSize;
+	unsigned int MissingPartOfLastSwathOfDETSize;
+	double LastZ8StutterPeriod = 0.0;
+	double LastStutterPeriod = 0.0;
+	unsigned int TotalNumberOfActiveOTG = 0;
+	double doublePixelClock;
+	unsigned int doubleHTotal;
+	unsigned int doubleVTotal;
+	bool SameTiming = true;
+	double DETBufferingTimeY;
+	double SwathWidthYCriticalSurface = 0.0;
+	double SwathHeightYCriticalSurface = 0.0;
+	double VActiveTimeCriticalSurface = 0.0;
+	double FrameTimeCriticalSurface = 0.0;
+	unsigned int BytePerPixelYCriticalSurface = 0;
+	double LinesToFinishSwathTransferStutterCriticalSurface = 0.0;
+	unsigned int DETBufferSizeYCriticalSurface = 0;
+	double MinTTUVBlankCriticalSurface = 0.0;
+	unsigned int BlockWidth256BytesYCriticalSurface = 0;
+	bool doublePlaneCriticalSurface = 0;
+	bool doublePipeCriticalSurface = 0;
+	double TotalCompressedReadBandwidth;
+	double TotalRowReadBandwidth;
+	double AverageDCCCompressionRate;
+	double EffectiveCompressedBufferSize;
+	double PartOfUncompressedPixelBurstThatFitsInROBAndCompressedBuffer;
+	double StutterBurstTime;
+	unsigned int TotalActiveWriteback;
+	double LinesInDETY;
+	double LinesInDETYRoundedDownToSwath;
+	double MaximumEffectiveCompressionLuma;
+	double MaximumEffectiveCompressionChroma;
+	double TotalZeroSizeRequestReadBandwidth;
+	double TotalZeroSizeCompressedReadBandwidth;
+	double AverageDCCZeroSizeFraction;
+	double AverageZeroSizeCompressionRate;
+	unsigned int k;
+
+	TotalZeroSizeRequestReadBandwidth = 0;
+	TotalZeroSizeCompressedReadBandwidth = 0;
+	TotalRowReadBandwidth = 0;
+	TotalCompressedReadBandwidth = 0;
+
+	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+		if (UseMALLForPStateChange[k] != dm_use_mall_pstate_change_phantom_pipe) {
+			if (DCCEnable[k] == true) {
+				if ((IsVertical(SourceRotation[k]) && BlockWidth256BytesY[k] > SwathHeightY[k])
+						|| (!IsVertical(SourceRotation[k])
+								&& BlockHeight256BytesY[k] > SwathHeightY[k])
+						|| DCCYMaxUncompressedBlock[k] < 256) {
+					MaximumEffectiveCompressionLuma = 2;
+				} else {
+					MaximumEffectiveCompressionLuma = 4;
+				}
+				TotalCompressedReadBandwidth = TotalCompressedReadBandwidth
+						+ ReadBandwidthSurfaceLuma[k]
+								/ dml_min(NetDCCRateLuma[k],
+										MaximumEffectiveCompressionLuma);
+#ifdef __DML_VBA_DEBUG__
+				dml_print("DML::%s: k=%0d, ReadBandwidthSurfaceLuma = %f\n",
+						__func__, k, ReadBandwidthSurfaceLuma[k]);
+				dml_print("DML::%s: k=%0d, NetDCCRateLuma = %f\n",
+						__func__, k, NetDCCRateLuma[k]);
+				dml_print("DML::%s: k=%0d, MaximumEffectiveCompressionLuma = %f\n",
+						__func__, k, MaximumEffectiveCompressionLuma);
+#endif
+				TotalZeroSizeRequestReadBandwidth = TotalZeroSizeRequestReadBandwidth
+						+ ReadBandwidthSurfaceLuma[k] * DCCFractionOfZeroSizeRequestsLuma[k];
+				TotalZeroSizeCompressedReadBandwidth = TotalZeroSizeCompressedReadBandwidth
+						+ ReadBandwidthSurfaceLuma[k] * DCCFractionOfZeroSizeRequestsLuma[k]
+								/ MaximumEffectiveCompressionLuma;
+
+				if (ReadBandwidthSurfaceChroma[k] > 0) {
+					if ((IsVertical(SourceRotation[k]) && BlockWidth256BytesC[k] > SwathHeightC[k])
+							|| (!IsVertical(SourceRotation[k])
+									&& BlockHeight256BytesC[k] > SwathHeightC[k])
+							|| DCCCMaxUncompressedBlock[k] < 256) {
+						MaximumEffectiveCompressionChroma = 2;
+					} else {
+						MaximumEffectiveCompressionChroma = 4;
+					}
+					TotalCompressedReadBandwidth =
+							TotalCompressedReadBandwidth
+							+ ReadBandwidthSurfaceChroma[k]
+							/ dml_min(NetDCCRateChroma[k],
+							MaximumEffectiveCompressionChroma);
+#ifdef __DML_VBA_DEBUG__
+					dml_print("DML::%s: k=%0d, ReadBandwidthSurfaceChroma = %f\n",
+							__func__, k, ReadBandwidthSurfaceChroma[k]);
+					dml_print("DML::%s: k=%0d, NetDCCRateChroma = %f\n",
+							__func__, k, NetDCCRateChroma[k]);
+					dml_print("DML::%s: k=%0d, MaximumEffectiveCompressionChroma = %f\n",
+							__func__, k, MaximumEffectiveCompressionChroma);
+#endif
+					TotalZeroSizeRequestReadBandwidth = TotalZeroSizeRequestReadBandwidth
+							+ ReadBandwidthSurfaceChroma[k]
+									* DCCFractionOfZeroSizeRequestsChroma[k];
+					TotalZeroSizeCompressedReadBandwidth = TotalZeroSizeCompressedReadBandwidth
+							+ ReadBandwidthSurfaceChroma[k]
+									* DCCFractionOfZeroSizeRequestsChroma[k]
+									/ MaximumEffectiveCompressionChroma;
+				}
+			} else {
+				TotalCompressedReadBandwidth = TotalCompressedReadBandwidth
+						+ ReadBandwidthSurfaceLuma[k] + ReadBandwidthSurfaceChroma[k];
+			}
+			TotalRowReadBandwidth = TotalRowReadBandwidth
+					+ DPPPerSurface[k] * (meta_row_bw[k] + dpte_row_bw[k]);
+		}
+	}
+
+	AverageDCCCompressionRate = TotalDataReadBandwidth / TotalCompressedReadBandwidth;
+	AverageDCCZeroSizeFraction = TotalZeroSizeRequestReadBandwidth / TotalDataReadBandwidth;
+
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: UnboundedRequestEnabled = %d\n", __func__, UnboundedRequestEnabled);
+	dml_print("DML::%s: TotalCompressedReadBandwidth = %f\n", __func__, TotalCompressedReadBandwidth);
+	dml_print("DML::%s: TotalZeroSizeRequestReadBandwidth = %f\n", __func__, TotalZeroSizeRequestReadBandwidth);
+	dml_print("DML::%s: TotalZeroSizeCompressedReadBandwidth = %f\n",
+			__func__, TotalZeroSizeCompressedReadBandwidth);
+	dml_print("DML::%s: MaximumEffectiveCompressionLuma = %f\n", __func__, MaximumEffectiveCompressionLuma);
+	dml_print("DML::%s: MaximumEffectiveCompressionChroma = %f\n", __func__, MaximumEffectiveCompressionChroma);
+	dml_print("DML::%s: AverageDCCCompressionRate = %f\n", __func__, AverageDCCCompressionRate);
+	dml_print("DML::%s: AverageDCCZeroSizeFraction = %f\n", __func__, AverageDCCZeroSizeFraction);
+	dml_print("DML::%s: CompbufReservedSpace64B = %d\n", __func__, CompbufReservedSpace64B);
+	dml_print("DML::%s: CompbufReservedSpaceZs = %d\n", __func__, CompbufReservedSpaceZs);
+	dml_print("DML::%s: CompressedBufferSizeInkByte = %d\n", __func__, CompressedBufferSizeInkByte);
+#endif
+	if (AverageDCCZeroSizeFraction == 1) {
+		AverageZeroSizeCompressionRate = TotalZeroSizeRequestReadBandwidth
+				/ TotalZeroSizeCompressedReadBandwidth;
+		EffectiveCompressedBufferSize = (double) MetaFIFOSizeInKEntries * 1024 * 64
+				* AverageZeroSizeCompressionRate
+				+ ((double) ZeroSizeBufferEntries - CompbufReservedSpaceZs) * 64
+						* AverageZeroSizeCompressionRate;
+	} else if (AverageDCCZeroSizeFraction > 0) {
+		AverageZeroSizeCompressionRate = TotalZeroSizeRequestReadBandwidth
+				/ TotalZeroSizeCompressedReadBandwidth;
+		EffectiveCompressedBufferSize = dml_min(
+				(double) CompressedBufferSizeInkByte * 1024 * AverageDCCCompressionRate,
+				(double) MetaFIFOSizeInKEntries * 1024 * 64
+					/ (AverageDCCZeroSizeFraction / AverageZeroSizeCompressionRate
+					+ 1 / AverageDCCCompressionRate))
+					+ dml_min(((double) ROBBufferSizeInKByte * 1024 - CompbufReservedSpace64B * 64)
+					* AverageDCCCompressionRate,
+					((double) ZeroSizeBufferEntries - CompbufReservedSpaceZs) * 64
+					/ (AverageDCCZeroSizeFraction / AverageZeroSizeCompressionRate));
+
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML::%s: min 1 = %f\n", __func__,
+				CompressedBufferSizeInkByte * 1024 * AverageDCCCompressionRate);
+		dml_print("DML::%s: min 2 = %f\n", __func__, MetaFIFOSizeInKEntries * 1024 * 64 /
+				(AverageDCCZeroSizeFraction / AverageZeroSizeCompressionRate + 1 /
+						AverageDCCCompressionRate));
+		dml_print("DML::%s: min 3 = %f\n", __func__, (ROBBufferSizeInKByte * 1024 -
+				CompbufReservedSpace64B * 64) * AverageDCCCompressionRate);
+		dml_print("DML::%s: min 4 = %f\n", __func__, (ZeroSizeBufferEntries - CompbufReservedSpaceZs) * 64 /
+				(AverageDCCZeroSizeFraction / AverageZeroSizeCompressionRate));
+#endif
+	} else {
+		EffectiveCompressedBufferSize = dml_min(
+				(double) CompressedBufferSizeInkByte * 1024 * AverageDCCCompressionRate,
+				(double) MetaFIFOSizeInKEntries * 1024 * 64 * AverageDCCCompressionRate)
+				+ ((double) ROBBufferSizeInKByte * 1024 - CompbufReservedSpace64B * 64)
+						* AverageDCCCompressionRate;
+
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML::%s: min 1 = %f\n", __func__,
+				CompressedBufferSizeInkByte * 1024 * AverageDCCCompressionRate);
+		dml_print("DML::%s: min 2 = %f\n", __func__,
+				MetaFIFOSizeInKEntries * 1024 * 64 * AverageDCCCompressionRate);
+#endif
+	}
+
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: MetaFIFOSizeInKEntries = %d\n", __func__, MetaFIFOSizeInKEntries);
+	dml_print("DML::%s: AverageZeroSizeCompressionRate = %f\n", __func__, AverageZeroSizeCompressionRate);
+	dml_print("DML::%s: EffectiveCompressedBufferSize = %f\n", __func__, EffectiveCompressedBufferSize);
+#endif
+
+	*StutterPeriod = 0;
+
+	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+		if (UseMALLForPStateChange[k] != dm_use_mall_pstate_change_phantom_pipe) {
+			LinesInDETY = ((double) DETBufferSizeY[k]
+					+ (UnboundedRequestEnabled == true ? EffectiveCompressedBufferSize : 0)
+							* ReadBandwidthSurfaceLuma[k] / TotalDataReadBandwidth)
+					/ BytePerPixelDETY[k] / SwathWidthY[k];
+			LinesInDETYRoundedDownToSwath = dml_floor(LinesInDETY, SwathHeightY[k]);
+			DETBufferingTimeY = LinesInDETYRoundedDownToSwath * ((double) HTotal[k] / PixelClock[k])
+					/ VRatio[k];
+#ifdef __DML_VBA_DEBUG__
+			dml_print("DML::%s: k=%0d, DETBufferSizeY = %d\n", __func__, k, DETBufferSizeY[k]);
+			dml_print("DML::%s: k=%0d, BytePerPixelDETY = %f\n", __func__, k, BytePerPixelDETY[k]);
+			dml_print("DML::%s: k=%0d, SwathWidthY = %d\n", __func__, k, SwathWidthY[k]);
+			dml_print("DML::%s: k=%0d, ReadBandwidthSurfaceLuma = %f\n",
+					__func__, k, ReadBandwidthSurfaceLuma[k]);
+			dml_print("DML::%s: k=%0d, TotalDataReadBandwidth = %f\n", __func__, k, TotalDataReadBandwidth);
+			dml_print("DML::%s: k=%0d, LinesInDETY = %f\n", __func__, k, LinesInDETY);
+			dml_print("DML::%s: k=%0d, LinesInDETYRoundedDownToSwath = %f\n",
+					__func__, k, LinesInDETYRoundedDownToSwath);
+			dml_print("DML::%s: k=%0d, HTotal = %d\n", __func__, k, HTotal[k]);
+			dml_print("DML::%s: k=%0d, PixelClock = %f\n", __func__, k, PixelClock[k]);
+			dml_print("DML::%s: k=%0d, VRatio = %f\n", __func__, k, VRatio[k]);
+			dml_print("DML::%s: k=%0d, DETBufferingTimeY = %f\n", __func__, k, DETBufferingTimeY);
+			dml_print("DML::%s: k=%0d, PixelClock = %f\n", __func__, k, PixelClock[k]);
+#endif
+
+			if (!FoundCriticalSurface || DETBufferingTimeY < *StutterPeriod) {
+				bool isInterlaceTiming = Interlace[k] && !ProgressiveToInterlaceUnitInOPP;
+
+				FoundCriticalSurface = true;
+				*StutterPeriod = DETBufferingTimeY;
+				FrameTimeCriticalSurface = (
+						isInterlaceTiming ?
+								dml_floor((double) VTotal[k] / 2.0, 1.0) : VTotal[k])
+						* (double) HTotal[k] / PixelClock[k];
+				VActiveTimeCriticalSurface = (
+						isInterlaceTiming ?
+								dml_floor((double) VActive[k] / 2.0, 1.0) : VActive[k])
+						* (double) HTotal[k] / PixelClock[k];
+				BytePerPixelYCriticalSurface = BytePerPixelY[k];
+				SwathWidthYCriticalSurface = SwathWidthY[k];
+				SwathHeightYCriticalSurface = SwathHeightY[k];
+				BlockWidth256BytesYCriticalSurface = BlockWidth256BytesY[k];
+				LinesToFinishSwathTransferStutterCriticalSurface = SwathHeightY[k]
+						- (LinesInDETY - LinesInDETYRoundedDownToSwath);
+				DETBufferSizeYCriticalSurface = DETBufferSizeY[k];
+				MinTTUVBlankCriticalSurface = MinTTUVBlank[k];
+				doublePlaneCriticalSurface = (ReadBandwidthSurfaceChroma[k] == 0);
+				doublePipeCriticalSurface = (DPPPerSurface[k] == 1);
+
+#ifdef __DML_VBA_DEBUG__
+				dml_print("DML::%s: k=%0d, FoundCriticalSurface                = %d\n",
+						__func__, k, FoundCriticalSurface);
+				dml_print("DML::%s: k=%0d, StutterPeriod                       = %f\n",
+						__func__, k, *StutterPeriod);
+				dml_print("DML::%s: k=%0d, MinTTUVBlankCriticalSurface         = %f\n",
+						__func__, k, MinTTUVBlankCriticalSurface);
+				dml_print("DML::%s: k=%0d, FrameTimeCriticalSurface            = %f\n",
+						__func__, k, FrameTimeCriticalSurface);
+				dml_print("DML::%s: k=%0d, VActiveTimeCriticalSurface          = %f\n",
+						__func__, k, VActiveTimeCriticalSurface);
+				dml_print("DML::%s: k=%0d, BytePerPixelYCriticalSurface        = %d\n",
+						__func__, k, BytePerPixelYCriticalSurface);
+				dml_print("DML::%s: k=%0d, SwathWidthYCriticalSurface          = %f\n",
+						__func__, k, SwathWidthYCriticalSurface);
+				dml_print("DML::%s: k=%0d, SwathHeightYCriticalSurface         = %f\n",
+						__func__, k, SwathHeightYCriticalSurface);
+				dml_print("DML::%s: k=%0d, BlockWidth256BytesYCriticalSurface  = %d\n",
+						__func__, k, BlockWidth256BytesYCriticalSurface);
+				dml_print("DML::%s: k=%0d, doublePlaneCriticalSurface          = %d\n",
+						__func__, k, doublePlaneCriticalSurface);
+				dml_print("DML::%s: k=%0d, doublePipeCriticalSurface           = %d\n",
+						__func__, k, doublePipeCriticalSurface);
+				dml_print("DML::%s: k=%0d, LinesToFinishSwathTransferStutterCriticalSurface = %f\n",
+						__func__, k, LinesToFinishSwathTransferStutterCriticalSurface);
+#endif
+			}
+		}
+	}
+
+	PartOfUncompressedPixelBurstThatFitsInROBAndCompressedBuffer = dml_min(*StutterPeriod * TotalDataReadBandwidth,
+			EffectiveCompressedBufferSize);
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: ROBBufferSizeInKByte = %d\n", __func__, ROBBufferSizeInKByte);
+	dml_print("DML::%s: AverageDCCCompressionRate = %f\n", __func__, AverageDCCCompressionRate);
+	dml_print("DML::%s: StutterPeriod * TotalDataReadBandwidth = %f\n",
+			__func__, *StutterPeriod * TotalDataReadBandwidth);
+	dml_print("DML::%s: EffectiveCompressedBufferSize = %f\n", __func__, EffectiveCompressedBufferSize);
+	dml_print("DML::%s: PartOfUncompressedPixelBurstThatFitsInROBAndCompressedBuffer = %f\n", __func__,
+			PartOfUncompressedPixelBurstThatFitsInROBAndCompressedBuffer);
+	dml_print("DML::%s: ReturnBW = %f\n", __func__, ReturnBW);
+	dml_print("DML::%s: TotalDataReadBandwidth = %f\n", __func__, TotalDataReadBandwidth);
+	dml_print("DML::%s: TotalRowReadBandwidth = %f\n", __func__, TotalRowReadBandwidth);
+	dml_print("DML::%s: DCFCLK = %f\n", __func__, DCFCLK);
+#endif
+
+	StutterBurstTime = PartOfUncompressedPixelBurstThatFitsInROBAndCompressedBuffer / AverageDCCCompressionRate
+			/ ReturnBW
+			+ (*StutterPeriod * TotalDataReadBandwidth
+					- PartOfUncompressedPixelBurstThatFitsInROBAndCompressedBuffer) / (DCFCLK * 64)
+			+ *StutterPeriod * TotalRowReadBandwidth / ReturnBW;
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: Part 1 = %f\n", __func__, PartOfUncompressedPixelBurstThatFitsInROBAndCompressedBuffer /
+			AverageDCCCompressionRate / ReturnBW);
+	dml_print("DML::%s: StutterPeriod * TotalDataReadBandwidth = %f\n",
+			__func__, (*StutterPeriod * TotalDataReadBandwidth));
+	dml_print("DML::%s: Part 2 = %f\n", __func__, (*StutterPeriod * TotalDataReadBandwidth -
+			PartOfUncompressedPixelBurstThatFitsInROBAndCompressedBuffer) / (DCFCLK * 64));
+	dml_print("DML::%s: Part 3 = %f\n", __func__, *StutterPeriod * TotalRowReadBandwidth / ReturnBW);
+	dml_print("DML::%s: StutterBurstTime = %f\n", __func__, StutterBurstTime);
+#endif
+	StutterBurstTime = dml_max(StutterBurstTime,
+			LinesToFinishSwathTransferStutterCriticalSurface * BytePerPixelYCriticalSurface
+					* SwathWidthYCriticalSurface / ReturnBW);
+
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: Time to finish residue swath=%f\n",
+			__func__,
+			LinesToFinishSwathTransferStutterCriticalSurface *
+			BytePerPixelYCriticalSurface * SwathWidthYCriticalSurface / ReturnBW);
+#endif
+
+	TotalActiveWriteback = 0;
+	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+		if (WritebackEnable[k])
+			TotalActiveWriteback = TotalActiveWriteback + 1;
+	}
+
+	if (TotalActiveWriteback == 0) {
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML::%s: SRExitTime = %f\n", __func__, SRExitTime);
+		dml_print("DML::%s: SRExitZ8Time = %f\n", __func__, SRExitZ8Time);
+		dml_print("DML::%s: StutterBurstTime = %f (final)\n", __func__, StutterBurstTime);
+		dml_print("DML::%s: StutterPeriod = %f\n", __func__, *StutterPeriod);
+#endif
+		*StutterEfficiencyNotIncludingVBlank = dml_max(0.,
+				1 - (SRExitTime + StutterBurstTime) / *StutterPeriod) * 100;
+		*Z8StutterEfficiencyNotIncludingVBlank = dml_max(0.,
+				1 - (SRExitZ8Time + StutterBurstTime) / *StutterPeriod) * 100;
+		*NumberOfStutterBurstsPerFrame = (
+				*StutterEfficiencyNotIncludingVBlank > 0 ?
+						dml_ceil(VActiveTimeCriticalSurface / *StutterPeriod, 1) : 0);
+		*Z8NumberOfStutterBurstsPerFrame = (
+				*Z8StutterEfficiencyNotIncludingVBlank > 0 ?
+						dml_ceil(VActiveTimeCriticalSurface / *StutterPeriod, 1) : 0);
+	} else {
+		*StutterEfficiencyNotIncludingVBlank = 0.;
+		*Z8StutterEfficiencyNotIncludingVBlank = 0.;
+		*NumberOfStutterBurstsPerFrame = 0;
+		*Z8NumberOfStutterBurstsPerFrame = 0;
+	}
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: VActiveTimeCriticalSurface = %f\n", __func__, VActiveTimeCriticalSurface);
+	dml_print("DML::%s: StutterEfficiencyNotIncludingVBlank = %f\n",
+			__func__, *StutterEfficiencyNotIncludingVBlank);
+	dml_print("DML::%s: Z8StutterEfficiencyNotIncludingVBlank = %f\n",
+			__func__, *Z8StutterEfficiencyNotIncludingVBlank);
+	dml_print("DML::%s: NumberOfStutterBurstsPerFrame = %d\n", __func__, *NumberOfStutterBurstsPerFrame);
+	dml_print("DML::%s: Z8NumberOfStutterBurstsPerFrame = %d\n", __func__, *Z8NumberOfStutterBurstsPerFrame);
+#endif
+
+	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+		if (UseMALLForPStateChange[k] != dm_use_mall_pstate_change_phantom_pipe) {
+			if (BlendingAndTiming[k] == k) {
+				if (TotalNumberOfActiveOTG == 0) {
+					doublePixelClock = PixelClock[k];
+					doubleHTotal = HTotal[k];
+					doubleVTotal = VTotal[k];
+				} else if (doublePixelClock != PixelClock[k] || doubleHTotal != HTotal[k]
+						|| doubleVTotal != VTotal[k]) {
+					SameTiming = false;
+				}
+				TotalNumberOfActiveOTG = TotalNumberOfActiveOTG + 1;
+			}
+		}
+	}
+
+	if (*StutterEfficiencyNotIncludingVBlank > 0) {
+		LastStutterPeriod = VActiveTimeCriticalSurface - (*NumberOfStutterBurstsPerFrame - 1) * *StutterPeriod;
+
+		if ((SynchronizeTimingsFinal || TotalNumberOfActiveOTG == 1) && SameTiming
+				&& LastStutterPeriod + MinTTUVBlankCriticalSurface > StutterEnterPlusExitWatermark) {
+			*StutterEfficiency = (1 - (*NumberOfStutterBurstsPerFrame * SRExitTime
+						+ StutterBurstTime * VActiveTimeCriticalSurface
+						/ *StutterPeriod) / FrameTimeCriticalSurface) * 100;
+		} else {
+			*StutterEfficiency = *StutterEfficiencyNotIncludingVBlank;
+		}
+	} else {
+		*StutterEfficiency = 0;
+	}
+
+	if (*Z8StutterEfficiencyNotIncludingVBlank > 0) {
+		LastZ8StutterPeriod = VActiveTimeCriticalSurface
+				- (*NumberOfStutterBurstsPerFrame - 1) * *StutterPeriod;
+		if ((SynchronizeTimingsFinal || TotalNumberOfActiveOTG == 1) && SameTiming && LastZ8StutterPeriod +
+				MinTTUVBlankCriticalSurface > Z8StutterEnterPlusExitWatermark) {
+			*Z8StutterEfficiency = (1 - (*NumberOfStutterBurstsPerFrame * SRExitZ8Time + StutterBurstTime
+				* VActiveTimeCriticalSurface / *StutterPeriod) / FrameTimeCriticalSurface) * 100;
+		} else {
+			*Z8StutterEfficiency = *Z8StutterEfficiencyNotIncludingVBlank;
+		}
+	} else {
+		*Z8StutterEfficiency = 0.;
+	}
+
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: LastZ8StutterPeriod = %f\n", __func__, LastZ8StutterPeriod);
+	dml_print("DML::%s: Z8StutterEnterPlusExitWatermark = %f\n", __func__, Z8StutterEnterPlusExitWatermark);
+	dml_print("DML::%s: StutterBurstTime = %f\n", __func__, StutterBurstTime);
+	dml_print("DML::%s: StutterPeriod = %f\n", __func__, *StutterPeriod);
+	dml_print("DML::%s: StutterEfficiency = %f\n", __func__, *StutterEfficiency);
+	dml_print("DML::%s: Z8StutterEfficiency = %f\n", __func__, *Z8StutterEfficiency);
+	dml_print("DML::%s: StutterEfficiencyNotIncludingVBlank = %f\n",
+			__func__, *StutterEfficiencyNotIncludingVBlank);
+	dml_print("DML::%s: Z8NumberOfStutterBurstsPerFrame = %d\n", __func__, *Z8NumberOfStutterBurstsPerFrame);
+#endif
+
+	SwathSizeCriticalSurface = BytePerPixelYCriticalSurface * SwathHeightYCriticalSurface
+			* dml_ceil(SwathWidthYCriticalSurface, BlockWidth256BytesYCriticalSurface);
+	LastChunkOfSwathSize = SwathSizeCriticalSurface % (PixelChunkSizeInKByte * 1024);
+	MissingPartOfLastSwathOfDETSize = dml_ceil(DETBufferSizeYCriticalSurface, SwathSizeCriticalSurface)
+			- DETBufferSizeYCriticalSurface;
+
+	*DCHUBBUB_ARB_CSTATE_MAX_CAP_MODE = !(!UnboundedRequestEnabled && (NumberOfActiveSurfaces == 1)
+			&& doublePlaneCriticalSurface && doublePipeCriticalSurface && (LastChunkOfSwathSize > 0)
+			&& (LastChunkOfSwathSize <= 4096) && (MissingPartOfLastSwathOfDETSize > 0)
+			&& (MissingPartOfLastSwathOfDETSize <= LastChunkOfSwathSize));
+
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: SwathSizeCriticalSurface = %d\n", __func__, SwathSizeCriticalSurface);
+	dml_print("DML::%s: LastChunkOfSwathSize = %d\n", __func__, LastChunkOfSwathSize);
+	dml_print("DML::%s: MissingPartOfLastSwathOfDETSize = %d\n", __func__, MissingPartOfLastSwathOfDETSize);
+	dml_print("DML::%s: DCHUBBUB_ARB_CSTATE_MAX_CAP_MODE = %d\n", __func__, *DCHUBBUB_ARB_CSTATE_MAX_CAP_MODE);
+#endif
+} // CalculateStutterEfficiency
+
+void dml32_CalculateMaxDETAndMinCompressedBufferSize(
+		unsigned int    ConfigReturnBufferSizeInKByte,
+		unsigned int    ROBBufferSizeInKByte,
+		unsigned int MaxNumDPP,
+		bool nomDETInKByteOverrideEnable, // VBA_DELTA, allow DV to override default DET size
+		unsigned int nomDETInKByteOverrideValue,  // VBA_DELTA
+
+		/* Output */
+		unsigned int *MaxTotalDETInKByte,
+		unsigned int *nomDETInKByte,
+		unsigned int *MinCompressedBufferSizeInKByte)
+{
+	bool     det_buff_size_override_en  = nomDETInKByteOverrideEnable;
+	unsigned int        det_buff_size_override_val = nomDETInKByteOverrideValue;
+
+	*MaxTotalDETInKByte = dml_ceil(((double)ConfigReturnBufferSizeInKByte +
+			(double) ROBBufferSizeInKByte) * 4.0 / 5.0, 64);
+	*nomDETInKByte = dml_floor((double) *MaxTotalDETInKByte / (double) MaxNumDPP, 64);
+	*MinCompressedBufferSizeInKByte = ConfigReturnBufferSizeInKByte - *MaxTotalDETInKByte;
+
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: ConfigReturnBufferSizeInKByte = %0d\n", __func__, ConfigReturnBufferSizeInKByte);
+	dml_print("DML::%s: ROBBufferSizeInKByte = %0d\n", __func__, ROBBufferSizeInKByte);
+	dml_print("DML::%s: MaxNumDPP = %0d\n", __func__, MaxNumDPP);
+	dml_print("DML::%s: MaxTotalDETInKByte = %0d\n", __func__, *MaxTotalDETInKByte);
+	dml_print("DML::%s: nomDETInKByte = %0d\n", __func__, *nomDETInKByte);
+	dml_print("DML::%s: MinCompressedBufferSizeInKByte = %0d\n", __func__, *MinCompressedBufferSizeInKByte);
+#endif
+
+	if (det_buff_size_override_en) {
+		*nomDETInKByte = det_buff_size_override_val;
+#ifdef __DML_VBA_DEBUG__
+		dml_print("DML::%s: nomDETInKByte = %0d (override)\n", __func__, *nomDETInKByte);
+#endif
+	}
+} // CalculateMaxDETAndMinCompressedBufferSize
+
+bool dml32_CalculateVActiveBandwithSupport(unsigned int NumberOfActiveSurfaces,
+		double ReturnBW,
+		bool NotUrgentLatencyHiding[],
+		double ReadBandwidthLuma[],
+		double ReadBandwidthChroma[],
+		double cursor_bw[],
+		double meta_row_bandwidth[],
+		double dpte_row_bandwidth[],
+		unsigned int NumberOfDPP[],
+		double UrgentBurstFactorLuma[],
+		double UrgentBurstFactorChroma[],
+		double UrgentBurstFactorCursor[])
+{
+	unsigned int k;
+	bool NotEnoughUrgentLatencyHiding = false;
+	bool CalculateVActiveBandwithSupport_val = false;
+	double VActiveBandwith = 0;
+
+	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+		if (NotUrgentLatencyHiding[k]) {
+			NotEnoughUrgentLatencyHiding = true;
+		}
+	}
+
+	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+		VActiveBandwith = VActiveBandwith + ReadBandwidthLuma[k] * UrgentBurstFactorLuma[k] + ReadBandwidthChroma[k] * UrgentBurstFactorChroma[k] + cursor_bw[k] * UrgentBurstFactorCursor[k] + NumberOfDPP[k] * meta_row_bandwidth[k] + NumberOfDPP[k] * dpte_row_bandwidth[k];
+	}
+
+	CalculateVActiveBandwithSupport_val = (VActiveBandwith <= ReturnBW) && !NotEnoughUrgentLatencyHiding;
+
+#ifdef __DML_VBA_DEBUG__
+dml_print("DML::%s: NotEnoughUrgentLatencyHiding        = %d\n", __func__, NotEnoughUrgentLatencyHiding);
+dml_print("DML::%s: VActiveBandwith                     = %f\n", __func__, VActiveBandwith);
+dml_print("DML::%s: ReturnBW                            = %f\n", __func__, ReturnBW);
+dml_print("DML::%s: CalculateVActiveBandwithSupport_val = %d\n", __func__, CalculateVActiveBandwithSupport_val);
+#endif
+	return CalculateVActiveBandwithSupport_val;
+}
+
+void dml32_CalculatePrefetchBandwithSupport(unsigned int NumberOfActiveSurfaces,
+		double ReturnBW,
+		bool NotUrgentLatencyHiding[],
+		double ReadBandwidthLuma[],
+		double ReadBandwidthChroma[],
+		double PrefetchBandwidthLuma[],
+		double PrefetchBandwidthChroma[],
+		double cursor_bw[],
+		double meta_row_bandwidth[],
+		double dpte_row_bandwidth[],
+		double cursor_bw_pre[],
+		double prefetch_vmrow_bw[],
+		unsigned int NumberOfDPP[],
+		double UrgentBurstFactorLuma[],
+		double UrgentBurstFactorChroma[],
+		double UrgentBurstFactorCursor[],
+		double UrgentBurstFactorLumaPre[],
+		double UrgentBurstFactorChromaPre[],
+		double UrgentBurstFactorCursorPre[],
+
+		/* output */
+		double  *PrefetchBandwidth,
+		double  *FractionOfUrgentBandwidth,
+		bool *PrefetchBandwidthSupport)
+{
+	unsigned int k;
+	bool NotEnoughUrgentLatencyHiding = false;
+	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+		if (NotUrgentLatencyHiding[k]) {
+			NotEnoughUrgentLatencyHiding = true;
+		}
+	}
+
+	*PrefetchBandwidth = 0;
+	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+		*PrefetchBandwidth = *PrefetchBandwidth + dml_max3(NumberOfDPP[k] * prefetch_vmrow_bw[k],
+				ReadBandwidthLuma[k] * UrgentBurstFactorLuma[k] + ReadBandwidthChroma[k] * UrgentBurstFactorChroma[k] + cursor_bw[k] * UrgentBurstFactorCursor[k] + NumberOfDPP[k] * (meta_row_bandwidth[k] + dpte_row_bandwidth[k]),
+				NumberOfDPP[k] * (PrefetchBandwidthLuma[k] * UrgentBurstFactorLumaPre[k] + PrefetchBandwidthChroma[k] * UrgentBurstFactorChromaPre[k]) + cursor_bw_pre[k] * UrgentBurstFactorCursorPre[k]);
+	}
+
+	*PrefetchBandwidthSupport = (*PrefetchBandwidth <= ReturnBW) && !NotEnoughUrgentLatencyHiding;
+	*FractionOfUrgentBandwidth = *PrefetchBandwidth / ReturnBW;
+}
+
+double dml32_CalculateBandwidthAvailableForImmediateFlip(unsigned int NumberOfActiveSurfaces,
+		double ReturnBW,
+		double ReadBandwidthLuma[],
+		double ReadBandwidthChroma[],
+		double PrefetchBandwidthLuma[],
+		double PrefetchBandwidthChroma[],
+		double cursor_bw[],
+		double cursor_bw_pre[],
+		unsigned int NumberOfDPP[],
+		double UrgentBurstFactorLuma[],
+		double UrgentBurstFactorChroma[],
+		double UrgentBurstFactorCursor[],
+		double UrgentBurstFactorLumaPre[],
+		double UrgentBurstFactorChromaPre[],
+		double UrgentBurstFactorCursorPre[])
+{
+	unsigned int k;
+	double CalculateBandwidthAvailableForImmediateFlip_val = ReturnBW;
+
+	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+		CalculateBandwidthAvailableForImmediateFlip_val = CalculateBandwidthAvailableForImmediateFlip_val - dml_max(ReadBandwidthLuma[k] * UrgentBurstFactorLuma[k] + ReadBandwidthChroma[k] * UrgentBurstFactorChroma[k] + cursor_bw[k] * UrgentBurstFactorCursor[k],
+				NumberOfDPP[k] * (PrefetchBandwidthLuma[k] * UrgentBurstFactorLumaPre[k] + PrefetchBandwidthChroma[k] * UrgentBurstFactorChromaPre[k]) + cursor_bw_pre[k] * UrgentBurstFactorCursorPre[k]);
+	}
+
+	return CalculateBandwidthAvailableForImmediateFlip_val;
+}
+
+void dml32_CalculateImmediateFlipBandwithSupport(unsigned int NumberOfActiveSurfaces,
+		double ReturnBW,
+		enum immediate_flip_requirement ImmediateFlipRequirement[],
+		double final_flip_bw[],
+		double ReadBandwidthLuma[],
+		double ReadBandwidthChroma[],
+		double PrefetchBandwidthLuma[],
+		double PrefetchBandwidthChroma[],
+		double cursor_bw[],
+		double meta_row_bandwidth[],
+		double dpte_row_bandwidth[],
+		double cursor_bw_pre[],
+		double prefetch_vmrow_bw[],
+		unsigned int NumberOfDPP[],
+		double UrgentBurstFactorLuma[],
+		double UrgentBurstFactorChroma[],
+		double UrgentBurstFactorCursor[],
+		double UrgentBurstFactorLumaPre[],
+		double UrgentBurstFactorChromaPre[],
+		double UrgentBurstFactorCursorPre[],
+
+		/* output */
+		double  *TotalBandwidth,
+		double  *FractionOfUrgentBandwidth,
+		bool *ImmediateFlipBandwidthSupport)
+{
+	unsigned int k;
+	*TotalBandwidth = 0;
+	for (k = 0; k < NumberOfActiveSurfaces; ++k) {
+		if (ImmediateFlipRequirement[k] != dm_immediate_flip_not_required) {
+			*TotalBandwidth = *TotalBandwidth + dml_max3(NumberOfDPP[k] * prefetch_vmrow_bw[k],
+					NumberOfDPP[k] * final_flip_bw[k] + ReadBandwidthLuma[k] * UrgentBurstFactorLuma[k] + ReadBandwidthChroma[k] * UrgentBurstFactorChroma[k] + cursor_bw[k] * UrgentBurstFactorCursor[k],
+					NumberOfDPP[k] * (final_flip_bw[k] + PrefetchBandwidthLuma[k] * UrgentBurstFactorLumaPre[k] + PrefetchBandwidthChroma[k] * UrgentBurstFactorChromaPre[k]) + cursor_bw_pre[k] * UrgentBurstFactorCursorPre[k]);
+		} else {
+			*TotalBandwidth = *TotalBandwidth + dml_max3(NumberOfDPP[k] * prefetch_vmrow_bw[k],
+					NumberOfDPP[k] * (meta_row_bandwidth[k] + dpte_row_bandwidth[k]) + ReadBandwidthLuma[k] * UrgentBurstFactorLuma[k] + ReadBandwidthChroma[k] * UrgentBurstFactorChroma[k] + cursor_bw[k] * UrgentBurstFactorCursor[k],
+					NumberOfDPP[k] * (PrefetchBandwidthLuma[k] * UrgentBurstFactorLumaPre[k] + PrefetchBandwidthChroma[k] * UrgentBurstFactorChromaPre[k]) + cursor_bw_pre[k] * UrgentBurstFactorCursorPre[k]);
+		}
+	}
+	*ImmediateFlipBandwidthSupport = (*TotalBandwidth <= ReturnBW);
+	*FractionOfUrgentBandwidth = *TotalBandwidth / ReturnBW;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h
new file mode 100644
index 000000000000..72461b934ee0
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h
@@ -0,0 +1,1175 @@
+/*
+ * Copyright 2022 Advanced Micro Devices, Inc.
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
+ * Authors: AMD
+ *
+ */
+
+#ifndef __DML_DCN32_DISPLAY_MODE_VBA_UTIL_32_H__
+#define __DML_DCN32_DISPLAY_MODE_VBA_UTIL_32_H__
+
+#include "../display_mode_enums.h"
+#include "os_types.h"
+#include "../dc_features.h"
+#include "../display_mode_structs.h"
+
+unsigned int dml32_dscceComputeDelay(
+		unsigned int bpc,
+		double BPP,
+		unsigned int sliceWidth,
+		unsigned int numSlices,
+		enum output_format_class pixelFormat,
+		enum output_encoder_class Output);
+
+unsigned int dml32_dscComputeDelay(enum output_format_class pixelFormat, enum output_encoder_class Output);
+
+bool IsVertical(enum dm_rotation_angle Scan);
+
+void dml32_CalculateBytePerPixelAndBlockSizes(
+		enum source_format_class SourcePixelFormat,
+		enum dm_swizzle_mode SurfaceTiling,
+
+		/*Output*/
+		unsigned int *BytePerPixelY,
+		unsigned int *BytePerPixelC,
+		double           *BytePerPixelDETY,
+		double           *BytePerPixelDETC,
+		unsigned int *BlockHeight256BytesY,
+		unsigned int *BlockHeight256BytesC,
+		unsigned int *BlockWidth256BytesY,
+		unsigned int *BlockWidth256BytesC,
+		unsigned int *MacroTileHeightY,
+		unsigned int *MacroTileHeightC,
+		unsigned int *MacroTileWidthY,
+		unsigned int *MacroTileWidthC);
+
+void dml32_CalculateSinglePipeDPPCLKAndSCLThroughput(
+		double HRatio,
+		double HRatioChroma,
+		double VRatio,
+		double VRatioChroma,
+		double MaxDCHUBToPSCLThroughput,
+		double MaxPSCLToLBThroughput,
+		double PixelClock,
+		enum source_format_class SourcePixelFormat,
+		unsigned int HTaps,
+		unsigned int HTapsChroma,
+		unsigned int VTaps,
+		unsigned int VTapsChroma,
+
+		/* output */
+		double *PSCL_THROUGHPUT,
+		double *PSCL_THROUGHPUT_CHROMA,
+		double *DPPCLKUsingSingleDPP);
+
+void dml32_CalculateSwathAndDETConfiguration(
+		unsigned int DETSizeOverride[],
+		enum dm_use_mall_for_pstate_change_mode UseMALLForPStateChange[],
+		unsigned int ConfigReturnBufferSizeInKByte,
+		unsigned int MaxTotalDETInKByte,
+		unsigned int MinCompressedBufferSizeInKByte,
+		double ForceSingleDPP,
+		unsigned int NumberOfActiveSurfaces,
+		unsigned int nomDETInKByte,
+		enum unbounded_requesting_policy UseUnboundedRequestingFinal,
+		unsigned int CompressedBufferSegmentSizeInkByteFinal,
+		enum output_encoder_class Output[],
+		double ReadBandwidthLuma[],
+		double ReadBandwidthChroma[],
+		double MaximumSwathWidthLuma[],
+		double MaximumSwathWidthChroma[],
+		enum dm_rotation_angle SourceRotation[],
+		bool ViewportStationary[],
+		enum source_format_class SourcePixelFormat[],
+		enum dm_swizzle_mode SurfaceTiling[],
+		unsigned int ViewportWidth[],
+		unsigned int ViewportHeight[],
+		unsigned int ViewportXStart[],
+		unsigned int ViewportYStart[],
+		unsigned int ViewportXStartC[],
+		unsigned int ViewportYStartC[],
+		unsigned int SurfaceWidthY[],
+		unsigned int SurfaceWidthC[],
+		unsigned int SurfaceHeightY[],
+		unsigned int SurfaceHeightC[],
+		unsigned int Read256BytesBlockHeightY[],
+		unsigned int Read256BytesBlockHeightC[],
+		unsigned int Read256BytesBlockWidthY[],
+		unsigned int Read256BytesBlockWidthC[],
+		enum odm_combine_mode ODMMode[],
+		unsigned int BlendingAndTiming[],
+		unsigned int BytePerPixY[],
+		unsigned int BytePerPixC[],
+		double BytePerPixDETY[],
+		double BytePerPixDETC[],
+		unsigned int HActive[],
+		double HRatio[],
+		double HRatioChroma[],
+		unsigned int DPPPerSurface[],
+
+		/* Output */
+		unsigned int swath_width_luma_ub[],
+		unsigned int swath_width_chroma_ub[],
+		double SwathWidth[],
+		double SwathWidthChroma[],
+		unsigned int SwathHeightY[],
+		unsigned int SwathHeightC[],
+		unsigned int DETBufferSizeInKByte[],
+		unsigned int DETBufferSizeY[],
+		unsigned int DETBufferSizeC[],
+		bool *UnboundedRequestEnabled,
+		unsigned int *CompressedBufferSizeInkByte,
+		bool ViewportSizeSupportPerSurface[],
+		bool *ViewportSizeSupport);
+
+void dml32_CalculateSwathWidth(
+		bool ForceSingleDPP,
+		unsigned int NumberOfActiveSurfaces,
+		enum source_format_class SourcePixelFormat[],
+		enum dm_rotation_angle SourceScan[],
+		bool ViewportStationary[],
+		unsigned int ViewportWidth[],
+		unsigned int ViewportHeight[],
+		unsigned int ViewportXStart[],
+		unsigned int ViewportYStart[],
+		unsigned int ViewportXStartC[],
+		unsigned int ViewportYStartC[],
+		unsigned int SurfaceWidthY[],
+		unsigned int SurfaceWidthC[],
+		unsigned int SurfaceHeightY[],
+		unsigned int SurfaceHeightC[],
+		enum odm_combine_mode ODMMode[],
+		unsigned int BytePerPixY[],
+		unsigned int BytePerPixC[],
+		unsigned int Read256BytesBlockHeightY[],
+		unsigned int Read256BytesBlockHeightC[],
+		unsigned int Read256BytesBlockWidthY[],
+		unsigned int Read256BytesBlockWidthC[],
+		unsigned int BlendingAndTiming[],
+		unsigned int HActive[],
+		double HRatio[],
+		unsigned int DPPPerSurface[],
+
+		/* Output */
+		double SwathWidthdoubleDPPY[],
+		double SwathWidthdoubleDPPC[],
+		double SwathWidthY[], // per-pipe
+		double SwathWidthC[], // per-pipe
+		unsigned int MaximumSwathHeightY[],
+		unsigned int MaximumSwathHeightC[],
+		unsigned int swath_width_luma_ub[], // per-pipe
+		unsigned int swath_width_chroma_ub[]);
+
+bool dml32_UnboundedRequest(enum unbounded_requesting_policy UseUnboundedRequestingFinal,
+		unsigned int TotalNumberOfActiveDPP,
+		bool NoChroma,
+		enum output_encoder_class Output);
+
+void dml32_CalculateDETBufferSize(
+		unsigned int DETSizeOverride[],
+		enum dm_use_mall_for_pstate_change_mode UseMALLForPStateChange[],
+		bool ForceSingleDPP,
+		unsigned int NumberOfActiveSurfaces,
+		bool UnboundedRequestEnabled,
+		unsigned int nomDETInKByte,
+		unsigned int MaxTotalDETInKByte,
+		unsigned int ConfigReturnBufferSizeInKByte,
+		unsigned int MinCompressedBufferSizeInKByte,
+		unsigned int CompressedBufferSegmentSizeInkByteFinal,
+		enum source_format_class SourcePixelFormat[],
+		double ReadBandwidthLuma[],
+		double ReadBandwidthChroma[],
+		unsigned int RoundedUpMaxSwathSizeBytesY[],
+		unsigned int RoundedUpMaxSwathSizeBytesC[],
+		unsigned int DPPPerSurface[],
+		/* Output */
+		unsigned int DETBufferSizeInKByte[],
+		unsigned int *CompressedBufferSizeInkByte);
+
+void dml32_CalculateODMMode(
+		unsigned int MaximumPixelsPerLinePerDSCUnit,
+		unsigned int HActive,
+		enum output_encoder_class Output,
+		enum odm_combine_policy ODMUse,
+		double StateDispclk,
+		double MaxDispclk,
+		bool DSCEnable,
+		unsigned int TotalNumberOfActiveDPP,
+		unsigned int MaxNumDPP,
+		double PixelClock,
+		double DISPCLKDPPCLKDSCCLKDownSpreading,
+		double DISPCLKRampingMargin,
+		double DISPCLKDPPCLKVCOSpeed,
+
+		/* Output */
+		bool *TotalAvailablePipesSupport,
+		unsigned int *NumberOfDPP,
+		enum odm_combine_mode *ODMMode,
+		double *RequiredDISPCLKPerSurface);
+
+double dml32_CalculateRequiredDispclk(
+		enum odm_combine_mode ODMMode,
+		double PixelClock,
+		double DISPCLKDPPCLKDSCCLKDownSpreading,
+		double DISPCLKRampingMargin,
+		double DISPCLKDPPCLKVCOSpeed,
+		double MaxDispclk);
+
+double dml32_RoundToDFSGranularity(double Clock, bool round_up, double VCOSpeed);
+
+void dml32_CalculateOutputLink(
+		double PHYCLKPerState,
+		double PHYCLKD18PerState,
+		double PHYCLKD32PerState,
+		double Downspreading,
+		bool IsMainSurfaceUsingTheIndicatedTiming,
+		enum output_encoder_class Output,
+		enum output_format_class OutputFormat,
+		unsigned int HTotal,
+		unsigned int HActive,
+		double PixelClockBackEnd,
+		double ForcedOutputLinkBPP,
+		unsigned int DSCInputBitPerComponent,
+		unsigned int NumberOfDSCSlices,
+		double AudioSampleRate,
+		unsigned int AudioSampleLayout,
+		enum odm_combine_mode ODMModeNoDSC,
+		enum odm_combine_mode ODMModeDSC,
+		bool DSCEnable,
+		unsigned int OutputLinkDPLanes,
+		enum dm_output_link_dp_rate OutputLinkDPRate,
+
+		/* Output */
+		bool *RequiresDSC,
+		double *RequiresFEC,
+		double  *OutBpp,
+		enum dm_output_type *OutputType,
+		enum dm_output_rate *OutputRate,
+		unsigned int *RequiredSlots);
+
+void dml32_CalculateDPPCLK(
+		unsigned int NumberOfActiveSurfaces,
+		double DISPCLKDPPCLKDSCCLKDownSpreading,
+		double DISPCLKDPPCLKVCOSpeed,
+		double DPPCLKUsingSingleDPP[],
+		unsigned int DPPPerSurface[],
+
+		/* output */
+		double *GlobalDPPCLK,
+		double Dppclk[]);
+
+double dml32_TruncToValidBPP(
+		double LinkBitRate,
+		unsigned int Lanes,
+		unsigned int HTotal,
+		unsigned int HActive,
+		double PixelClock,
+		double DesiredBPP,
+		bool DSCEnable,
+		enum output_encoder_class Output,
+		enum output_format_class Format,
+		unsigned int DSCInputBitPerComponent,
+		unsigned int DSCSlices,
+		unsigned int AudioRate,
+		unsigned int AudioLayout,
+		enum odm_combine_mode ODMModeNoDSC,
+		enum odm_combine_mode ODMModeDSC,
+		/* Output */
+		unsigned int *RequiredSlots);
+
+double dml32_RequiredDTBCLK(
+		bool              DSCEnable,
+		double               PixelClock,
+		enum output_format_class  OutputFormat,
+		double               OutputBpp,
+		unsigned int              DSCSlices,
+		unsigned int                 HTotal,
+		unsigned int                 HActive,
+		unsigned int              AudioRate,
+		unsigned int              AudioLayout);
+
+unsigned int dml32_DSCDelayRequirement(bool DSCEnabled,
+		enum odm_combine_mode ODMMode,
+		unsigned int DSCInputBitPerComponent,
+		double OutputBpp,
+		unsigned int HActive,
+		unsigned int HTotal,
+		unsigned int NumberOfDSCSlices,
+		enum output_format_class  OutputFormat,
+		enum output_encoder_class Output,
+		double PixelClock,
+		double PixelClockBackEnd);
+
+void dml32_CalculateSurfaceSizeInMall(
+		unsigned int NumberOfActiveSurfaces,
+		unsigned int MALLAllocatedForDCN,
+		enum dm_use_mall_for_static_screen_mode UseMALLForStaticScreen[],
+		bool DCCEnable[],
+		bool ViewportStationary[],
+		unsigned int ViewportXStartY[],
+		unsigned int ViewportYStartY[],
+		unsigned int ViewportXStartC[],
+		unsigned int ViewportYStartC[],
+		unsigned int ViewportWidthY[],
+		unsigned int ViewportHeightY[],
+		unsigned int BytesPerPixelY[],
+		unsigned int ViewportWidthC[],
+		unsigned int ViewportHeightC[],
+		unsigned int BytesPerPixelC[],
+		unsigned int SurfaceWidthY[],
+		unsigned int SurfaceWidthC[],
+		unsigned int SurfaceHeightY[],
+		unsigned int SurfaceHeightC[],
+		unsigned int Read256BytesBlockWidthY[],
+		unsigned int Read256BytesBlockWidthC[],
+		unsigned int Read256BytesBlockHeightY[],
+		unsigned int Read256BytesBlockHeightC[],
+		unsigned int ReadBlockWidthY[],
+		unsigned int ReadBlockWidthC[],
+		unsigned int ReadBlockHeightY[],
+		unsigned int ReadBlockHeightC[],
+
+		/* Output */
+		unsigned int    SurfaceSizeInMALL[],
+		bool *ExceededMALLSize);
+
+void dml32_CalculateVMRowAndSwath(
+		unsigned int NumberOfActiveSurfaces,
+		DmlPipe myPipe[],
+		unsigned int SurfaceSizeInMALL[],
+		unsigned int PTEBufferSizeInRequestsLuma,
+		unsigned int PTEBufferSizeInRequestsChroma,
+		unsigned int DCCMetaBufferSizeBytes,
+		enum dm_use_mall_for_static_screen_mode UseMALLForStaticScreen[],
+		enum dm_use_mall_for_pstate_change_mode UseMALLForPStateChange[],
+		unsigned int MALLAllocatedForDCN,
+		double SwathWidthY[],
+		double SwathWidthC[],
+		bool GPUVMEnable,
+		bool HostVMEnable,
+		unsigned int HostVMMaxNonCachedPageTableLevels,
+		unsigned int GPUVMMaxPageTableLevels,
+		unsigned int GPUVMMinPageSizeKBytes[],
+		unsigned int HostVMMinPageSize,
+
+		/* Output */
+		bool PTEBufferSizeNotExceeded[],
+		bool DCCMetaBufferSizeNotExceeded[],
+		unsigned int dpte_row_width_luma_ub[],
+		unsigned int dpte_row_width_chroma_ub[],
+		unsigned int dpte_row_height_luma[],
+		unsigned int dpte_row_height_chroma[],
+		unsigned int dpte_row_height_linear_luma[],     // VBA_DELTA
+		unsigned int dpte_row_height_linear_chroma[],   // VBA_DELTA
+		unsigned int meta_req_width[],
+		unsigned int meta_req_width_chroma[],
+		unsigned int meta_req_height[],
+		unsigned int meta_req_height_chroma[],
+		unsigned int meta_row_width[],
+		unsigned int meta_row_width_chroma[],
+		unsigned int meta_row_height[],
+		unsigned int meta_row_height_chroma[],
+		unsigned int vm_group_bytes[],
+		unsigned int dpte_group_bytes[],
+		unsigned int PixelPTEReqWidthY[],
+		unsigned int PixelPTEReqHeightY[],
+		unsigned int PTERequestSizeY[],
+		unsigned int PixelPTEReqWidthC[],
+		unsigned int PixelPTEReqHeightC[],
+		unsigned int PTERequestSizeC[],
+		unsigned int dpde0_bytes_per_frame_ub_l[],
+		unsigned int meta_pte_bytes_per_frame_ub_l[],
+		unsigned int dpde0_bytes_per_frame_ub_c[],
+		unsigned int meta_pte_bytes_per_frame_ub_c[],
+		double PrefetchSourceLinesY[],
+		double PrefetchSourceLinesC[],
+		double VInitPreFillY[],
+		double VInitPreFillC[],
+		unsigned int MaxNumSwathY[],
+		unsigned int MaxNumSwathC[],
+		double meta_row_bw[],
+		double dpte_row_bw[],
+		double PixelPTEBytesPerRow[],
+		double PDEAndMetaPTEBytesFrame[],
+		double MetaRowByte[],
+		bool use_one_row_for_frame[],
+		bool use_one_row_for_frame_flip[],
+		bool UsesMALLForStaticScreen[],
+		bool PTE_BUFFER_MODE[],
+		unsigned int BIGK_FRAGMENT_SIZE[]);
+
+unsigned int dml32_CalculateVMAndRowBytes(
+		bool ViewportStationary,
+		bool DCCEnable,
+		unsigned int NumberOfDPPs,
+		unsigned int BlockHeight256Bytes,
+		unsigned int BlockWidth256Bytes,
+		enum source_format_class SourcePixelFormat,
+		unsigned int SurfaceTiling,
+		unsigned int BytePerPixel,
+		enum dm_rotation_angle SourceScan,
+		double SwathWidth,
+		unsigned int ViewportHeight,
+		unsigned int    ViewportXStart,
+		unsigned int    ViewportYStart,
+		bool GPUVMEnable,
+		bool HostVMEnable,
+		unsigned int HostVMMaxNonCachedPageTableLevels,
+		unsigned int GPUVMMaxPageTableLevels,
+		unsigned int GPUVMMinPageSizeKBytes,
+		unsigned int HostVMMinPageSize,
+		unsigned int PTEBufferSizeInRequests,
+		unsigned int Pitch,
+		unsigned int DCCMetaPitch,
+		unsigned int MacroTileWidth,
+		unsigned int MacroTileHeight,
+
+		/* Output */
+		unsigned int *MetaRowByte,
+		unsigned int *PixelPTEBytesPerRow,
+		unsigned int    *dpte_row_width_ub,
+		unsigned int *dpte_row_height,
+		unsigned int *dpte_row_height_linear,
+		unsigned int    *PixelPTEBytesPerRow_one_row_per_frame,
+		unsigned int    *dpte_row_width_ub_one_row_per_frame,
+		unsigned int    *dpte_row_height_one_row_per_frame,
+		unsigned int *MetaRequestWidth,
+		unsigned int *MetaRequestHeight,
+		unsigned int *meta_row_width,
+		unsigned int *meta_row_height,
+		unsigned int *PixelPTEReqWidth,
+		unsigned int *PixelPTEReqHeight,
+		unsigned int *PTERequestSize,
+		unsigned int    *DPDE0BytesFrame,
+		unsigned int    *MetaPTEBytesFrame);
+
+double dml32_CalculatePrefetchSourceLines(
+		double VRatio,
+		unsigned int VTaps,
+		bool Interlace,
+		bool ProgressiveToInterlaceUnitInOPP,
+		unsigned int SwathHeight,
+		enum dm_rotation_angle SourceRotation,
+		bool ViewportStationary,
+		double SwathWidth,
+		unsigned int ViewportHeight,
+		unsigned int ViewportXStart,
+		unsigned int ViewportYStart,
+
+		/* Output */
+		double *VInitPreFill,
+		unsigned int *MaxNumSwath);
+
+void dml32_CalculateMALLUseForStaticScreen(
+		unsigned int NumberOfActiveSurfaces,
+		unsigned int MALLAllocatedForDCNFinal,
+		enum dm_use_mall_for_static_screen_mode *UseMALLForStaticScreen,
+		unsigned int SurfaceSizeInMALL[],
+		bool one_row_per_frame_fits_in_buffer[],
+
+		/* output */
+		bool UsesMALLForStaticScreen[]);
+
+void dml32_CalculateRowBandwidth(
+		bool GPUVMEnable,
+		enum source_format_class SourcePixelFormat,
+		double VRatio,
+		double VRatioChroma,
+		bool DCCEnable,
+		double LineTime,
+		unsigned int MetaRowByteLuma,
+		unsigned int MetaRowByteChroma,
+		unsigned int meta_row_height_luma,
+		unsigned int meta_row_height_chroma,
+		unsigned int PixelPTEBytesPerRowLuma,
+		unsigned int PixelPTEBytesPerRowChroma,
+		unsigned int dpte_row_height_luma,
+		unsigned int dpte_row_height_chroma,
+		/* Output */
+		double *meta_row_bw,
+		double *dpte_row_bw);
+
+double dml32_CalculateUrgentLatency(
+		double UrgentLatencyPixelDataOnly,
+		double UrgentLatencyPixelMixedWithVMData,
+		double UrgentLatencyVMDataOnly,
+		bool   DoUrgentLatencyAdjustment,
+		double UrgentLatencyAdjustmentFabricClockComponent,
+		double UrgentLatencyAdjustmentFabricClockReference,
+		double FabricClock);
+
+void dml32_CalculateUrgentBurstFactor(
+		enum dm_use_mall_for_pstate_change_mode UseMALLForPStateChange,
+		unsigned int    swath_width_luma_ub,
+		unsigned int    swath_width_chroma_ub,
+		unsigned int SwathHeightY,
+		unsigned int SwathHeightC,
+		double  LineTime,
+		double  UrgentLatency,
+		double  CursorBufferSize,
+		unsigned int CursorWidth,
+		unsigned int CursorBPP,
+		double  VRatio,
+		double  VRatioC,
+		double  BytePerPixelInDETY,
+		double  BytePerPixelInDETC,
+		unsigned int    DETBufferSizeY,
+		unsigned int    DETBufferSizeC,
+		/* Output */
+		double *UrgentBurstFactorCursor,
+		double *UrgentBurstFactorLuma,
+		double *UrgentBurstFactorChroma,
+		bool   *NotEnoughUrgentLatencyHiding);
+
+void dml32_CalculateDCFCLKDeepSleep(
+		unsigned int NumberOfActiveSurfaces,
+		unsigned int BytePerPixelY[],
+		unsigned int BytePerPixelC[],
+		double VRatio[],
+		double VRatioChroma[],
+		double SwathWidthY[],
+		double SwathWidthC[],
+		unsigned int DPPPerSurface[],
+		double HRatio[],
+		double HRatioChroma[],
+		double PixelClock[],
+		double PSCL_THROUGHPUT[],
+		double PSCL_THROUGHPUT_CHROMA[],
+		double Dppclk[],
+		double ReadBandwidthLuma[],
+		double ReadBandwidthChroma[],
+		unsigned int ReturnBusWidth,
+
+		/* Output */
+		double *DCFClkDeepSleep);
+
+double dml32_CalculateWriteBackDelay(
+		enum source_format_class WritebackPixelFormat,
+		double WritebackHRatio,
+		double WritebackVRatio,
+		unsigned int WritebackVTaps,
+		unsigned int         WritebackDestinationWidth,
+		unsigned int         WritebackDestinationHeight,
+		unsigned int         WritebackSourceHeight,
+		unsigned int HTotal);
+
+void dml32_UseMinimumDCFCLK(
+		enum dm_use_mall_for_pstate_change_mode UseMALLForPStateChange[],
+		bool DRRDisplay[],
+		bool SynchronizeDRRDisplaysForUCLKPStateChangeFinal,
+		unsigned int MaxInterDCNTileRepeaters,
+		unsigned int MaxPrefetchMode,
+		double DRAMClockChangeLatencyFinal,
+		double FCLKChangeLatency,
+		double SREnterPlusExitTime,
+		unsigned int ReturnBusWidth,
+		unsigned int RoundTripPingLatencyCycles,
+		unsigned int ReorderingBytes,
+		unsigned int PixelChunkSizeInKByte,
+		unsigned int MetaChunkSize,
+		bool GPUVMEnable,
+		unsigned int GPUVMMaxPageTableLevels,
+		bool HostVMEnable,
+		unsigned int NumberOfActiveSurfaces,
+		double HostVMMinPageSize,
+		unsigned int HostVMMaxNonCachedPageTableLevels,
+		bool DynamicMetadataVMEnabled,
+		bool ImmediateFlipRequirement,
+		bool ProgressiveToInterlaceUnitInOPP,
+		double MaxAveragePercentOfIdealSDPPortBWDisplayCanUseInNormalSystemOperation,
+		double PercentOfIdealSDPPortBWReceivedAfterUrgLatency,
+		unsigned int VTotal[],
+		unsigned int VActive[],
+		unsigned int DynamicMetadataTransmittedBytes[],
+		unsigned int DynamicMetadataLinesBeforeActiveRequired[],
+		bool Interlace[],
+		double RequiredDPPCLKPerSurface[][2][DC__NUM_DPP__MAX],
+		double RequiredDISPCLK[][2],
+		double UrgLatency[],
+		unsigned int NoOfDPP[][2][DC__NUM_DPP__MAX],
+		double ProjectedDCFClkDeepSleep[][2],
+		double MaximumVStartup[][2][DC__NUM_DPP__MAX],
+		unsigned int TotalNumberOfActiveDPP[][2],
+		unsigned int TotalNumberOfDCCActiveDPP[][2],
+		unsigned int dpte_group_bytes[],
+		double PrefetchLinesY[][2][DC__NUM_DPP__MAX],
+		double PrefetchLinesC[][2][DC__NUM_DPP__MAX],
+		unsigned int swath_width_luma_ub_all_states[][2][DC__NUM_DPP__MAX],
+		unsigned int swath_width_chroma_ub_all_states[][2][DC__NUM_DPP__MAX],
+		unsigned int BytePerPixelY[],
+		unsigned int BytePerPixelC[],
+		unsigned int HTotal[],
+		double PixelClock[],
+		double PDEAndMetaPTEBytesPerFrame[][2][DC__NUM_DPP__MAX],
+		double DPTEBytesPerRow[][2][DC__NUM_DPP__MAX],
+		double MetaRowBytes[][2][DC__NUM_DPP__MAX],
+		bool DynamicMetadataEnable[],
+		double ReadBandwidthLuma[],
+		double ReadBandwidthChroma[],
+		double DCFCLKPerState[],
+		/* Output */
+		double DCFCLKState[][2]);
+
+unsigned int dml32_CalculateExtraLatencyBytes(unsigned int ReorderingBytes,
+		unsigned int TotalNumberOfActiveDPP,
+		unsigned int PixelChunkSizeInKByte,
+		unsigned int TotalNumberOfDCCActiveDPP,
+		unsigned int MetaChunkSize,
+		bool GPUVMEnable,
+		bool HostVMEnable,
+		unsigned int NumberOfActiveSurfaces,
+		unsigned int NumberOfDPP[],
+		unsigned int dpte_group_bytes[],
+		double HostVMInefficiencyFactor,
+		double HostVMMinPageSize,
+		unsigned int HostVMMaxNonCachedPageTableLevels);
+
+void dml32_CalculateVUpdateAndDynamicMetadataParameters(
+		unsigned int MaxInterDCNTileRepeaters,
+		double Dppclk,
+		double Dispclk,
+		double DCFClkDeepSleep,
+		double PixelClock,
+		unsigned int HTotal,
+		unsigned int VBlank,
+		unsigned int DynamicMetadataTransmittedBytes,
+		unsigned int DynamicMetadataLinesBeforeActiveRequired,
+		unsigned int InterlaceEnable,
+		bool ProgressiveToInterlaceUnitInOPP,
+		double *TSetup,
+		double *Tdmbf,
+		double *Tdmec,
+		double *Tdmsks,
+		unsigned int *VUpdateOffsetPix,
+		double *VUpdateWidthPix,
+		double *VReadyOffsetPix);
+
+double dml32_CalculateTWait(
+		unsigned int PrefetchMode,
+		enum dm_use_mall_for_pstate_change_mode UseMALLForPStateChange,
+		bool SynchronizeDRRDisplaysForUCLKPStateChangeFinal,
+		bool DRRDisplay,
+		double DRAMClockChangeLatency,
+		double FCLKChangeLatency,
+		double UrgentLatency,
+		double SREnterPlusExitTime);
+
+double dml32_get_return_bw_mbps(const soc_bounding_box_st *soc,
+		const int VoltageLevel,
+		const bool HostVMEnable,
+		const double DCFCLK,
+		const double FabricClock,
+		const double DRAMSpeed);
+
+double dml32_get_return_bw_mbps_vm_only(const soc_bounding_box_st *soc,
+		const int VoltageLevel,
+		const double DCFCLK,
+		const double FabricClock,
+		const double DRAMSpeed);
+
+double dml32_CalculateExtraLatency(
+		unsigned int RoundTripPingLatencyCycles,
+		unsigned int ReorderingBytes,
+		double DCFCLK,
+		unsigned int TotalNumberOfActiveDPP,
+		unsigned int PixelChunkSizeInKByte,
+		unsigned int TotalNumberOfDCCActiveDPP,
+		unsigned int MetaChunkSize,
+		double ReturnBW,
+		bool GPUVMEnable,
+		bool HostVMEnable,
+		unsigned int NumberOfActiveSurfaces,
+		unsigned int NumberOfDPP[],
+		unsigned int dpte_group_bytes[],
+		double HostVMInefficiencyFactor,
+		double HostVMMinPageSize,
+		unsigned int HostVMMaxNonCachedPageTableLevels);
+
+bool dml32_CalculatePrefetchSchedule(
+		double HostVMInefficiencyFactor,
+		DmlPipe *myPipe,
+		unsigned int DSCDelay,
+		double DPPCLKDelaySubtotalPlusCNVCFormater,
+		double DPPCLKDelaySCL,
+		double DPPCLKDelaySCLLBOnly,
+		double DPPCLKDelayCNVCCursor,
+		double DISPCLKDelaySubtotal,
+		unsigned int DPP_RECOUT_WIDTH,
+		enum output_format_class OutputFormat,
+		unsigned int MaxInterDCNTileRepeaters,
+		unsigned int VStartup,
+		unsigned int MaxVStartup,
+		unsigned int GPUVMPageTableLevels,
+		bool GPUVMEnable,
+		bool HostVMEnable,
+		unsigned int HostVMMaxNonCachedPageTableLevels,
+		double HostVMMinPageSize,
+		bool DynamicMetadataEnable,
+		bool DynamicMetadataVMEnabled,
+		int DynamicMetadataLinesBeforeActiveRequired,
+		unsigned int DynamicMetadataTransmittedBytes,
+		double UrgentLatency,
+		double UrgentExtraLatency,
+		double TCalc,
+		unsigned int PDEAndMetaPTEBytesFrame,
+		unsigned int MetaRowByte,
+		unsigned int PixelPTEBytesPerRow,
+		double PrefetchSourceLinesY,
+		unsigned int SwathWidthY,
+		unsigned int VInitPreFillY,
+		unsigned int MaxNumSwathY,
+		double PrefetchSourceLinesC,
+		unsigned int SwathWidthC,
+		unsigned int VInitPreFillC,
+		unsigned int MaxNumSwathC,
+		unsigned int swath_width_luma_ub,
+		unsigned int swath_width_chroma_ub,
+		unsigned int SwathHeightY,
+		unsigned int SwathHeightC,
+		double TWait,
+		/* Output */
+		double   *DSTXAfterScaler,
+		double   *DSTYAfterScaler,
+		double *DestinationLinesForPrefetch,
+		double *PrefetchBandwidth,
+		double *DestinationLinesToRequestVMInVBlank,
+		double *DestinationLinesToRequestRowInVBlank,
+		double *VRatioPrefetchY,
+		double *VRatioPrefetchC,
+		double *RequiredPrefetchPixDataBWLuma,
+		double *RequiredPrefetchPixDataBWChroma,
+		bool   *NotEnoughTimeForDynamicMetadata,
+		double *Tno_bw,
+		double *prefetch_vmrow_bw,
+		double *Tdmdl_vm,
+		double *Tdmdl,
+		double *TSetup,
+		unsigned int   *VUpdateOffsetPix,
+		double   *VUpdateWidthPix,
+		double   *VReadyOffsetPix);
+
+void dml32_CalculateFlipSchedule(
+		double HostVMInefficiencyFactor,
+		double UrgentExtraLatency,
+		double UrgentLatency,
+		unsigned int GPUVMMaxPageTableLevels,
+		bool HostVMEnable,
+		unsigned int HostVMMaxNonCachedPageTableLevels,
+		bool GPUVMEnable,
+		double HostVMMinPageSize,
+		double PDEAndMetaPTEBytesPerFrame,
+		double MetaRowBytes,
+		double DPTEBytesPerRow,
+		double BandwidthAvailableForImmediateFlip,
+		unsigned int TotImmediateFlipBytes,
+		enum source_format_class SourcePixelFormat,
+		double LineTime,
+		double VRatio,
+		double VRatioChroma,
+		double Tno_bw,
+		bool DCCEnable,
+		unsigned int dpte_row_height,
+		unsigned int meta_row_height,
+		unsigned int dpte_row_height_chroma,
+		unsigned int meta_row_height_chroma,
+		bool    use_one_row_for_frame_flip,
+
+		/* Output */
+		double *DestinationLinesToRequestVMInImmediateFlip,
+		double *DestinationLinesToRequestRowInImmediateFlip,
+		double *final_flip_bw,
+		bool *ImmediateFlipSupportedForPipe);
+
+void dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
+		bool USRRetrainingRequiredFinal,
+		enum dm_use_mall_for_pstate_change_mode UseMALLForPStateChange[],
+		unsigned int PrefetchMode,
+		unsigned int NumberOfActiveSurfaces,
+		unsigned int MaxLineBufferLines,
+		unsigned int LineBufferSize,
+		unsigned int WritebackInterfaceBufferSize,
+		double DCFCLK,
+		double ReturnBW,
+		bool SynchronizeTimingsFinal,
+		bool SynchronizeDRRDisplaysForUCLKPStateChangeFinal,
+		bool DRRDisplay[],
+		unsigned int dpte_group_bytes[],
+		unsigned int meta_row_height[],
+		unsigned int meta_row_height_chroma[],
+		SOCParametersList mmSOCParameters,
+		unsigned int WritebackChunkSize,
+		double SOCCLK,
+		double DCFClkDeepSleep,
+		unsigned int DETBufferSizeY[],
+		unsigned int DETBufferSizeC[],
+		unsigned int SwathHeightY[],
+		unsigned int SwathHeightC[],
+		unsigned int LBBitPerPixel[],
+		double SwathWidthY[],
+		double SwathWidthC[],
+		double HRatio[],
+		double HRatioChroma[],
+		unsigned int VTaps[],
+		unsigned int VTapsChroma[],
+		double VRatio[],
+		double VRatioChroma[],
+		unsigned int HTotal[],
+		unsigned int VTotal[],
+		unsigned int VActive[],
+		double PixelClock[],
+		unsigned int BlendingAndTiming[],
+		unsigned int DPPPerSurface[],
+		double BytePerPixelDETY[],
+		double BytePerPixelDETC[],
+		double DSTXAfterScaler[],
+		double DSTYAfterScaler[],
+		bool WritebackEnable[],
+		enum source_format_class WritebackPixelFormat[],
+		double WritebackDestinationWidth[],
+		double WritebackDestinationHeight[],
+		double WritebackSourceHeight[],
+		bool UnboundedRequestEnabled,
+		unsigned int CompressedBufferSizeInkByte,
+
+		/* Output */
+		Watermarks *Watermark,
+		enum clock_change_support *DRAMClockChangeSupport,
+		double MaxActiveDRAMClockChangeLatencySupported[],
+		unsigned int SubViewportLinesNeededInMALL[],
+		enum dm_fclock_change_support *FCLKChangeSupport,
+		double *MinActiveFCLKChangeLatencySupported,
+		bool *USRRetrainingSupport,
+		double ActiveDRAMClockChangeLatencyMargin[]);
+
+double dml32_CalculateWriteBackDISPCLK(
+		enum source_format_class WritebackPixelFormat,
+		double PixelClock,
+		double WritebackHRatio,
+		double WritebackVRatio,
+		unsigned int WritebackHTaps,
+		unsigned int WritebackVTaps,
+		unsigned int   WritebackSourceWidth,
+		unsigned int   WritebackDestinationWidth,
+		unsigned int HTotal,
+		unsigned int WritebackLineBufferSize,
+		double DISPCLKDPPCLKVCOSpeed);
+
+void dml32_CalculateMinAndMaxPrefetchMode(
+		enum dm_prefetch_modes   AllowForPStateChangeOrStutterInVBlankFinal,
+		unsigned int             *MinPrefetchMode,
+		unsigned int             *MaxPrefetchMode);
+
+void dml32_CalculatePixelDeliveryTimes(
+		unsigned int             NumberOfActiveSurfaces,
+		double              VRatio[],
+		double              VRatioChroma[],
+		double              VRatioPrefetchY[],
+		double              VRatioPrefetchC[],
+		unsigned int             swath_width_luma_ub[],
+		unsigned int             swath_width_chroma_ub[],
+		unsigned int             DPPPerSurface[],
+		double              HRatio[],
+		double              HRatioChroma[],
+		double              PixelClock[],
+		double              PSCL_THROUGHPUT[],
+		double              PSCL_THROUGHPUT_CHROMA[],
+		double              Dppclk[],
+		unsigned int             BytePerPixelC[],
+		enum dm_rotation_angle   SourceRotation[],
+		unsigned int             NumberOfCursors[],
+		unsigned int             CursorWidth[][DC__NUM_CURSOR__MAX],
+		unsigned int             CursorBPP[][DC__NUM_CURSOR__MAX],
+		unsigned int             BlockWidth256BytesY[],
+		unsigned int             BlockHeight256BytesY[],
+		unsigned int             BlockWidth256BytesC[],
+		unsigned int             BlockHeight256BytesC[],
+
+		/* Output */
+		double              DisplayPipeLineDeliveryTimeLuma[],
+		double              DisplayPipeLineDeliveryTimeChroma[],
+		double              DisplayPipeLineDeliveryTimeLumaPrefetch[],
+		double              DisplayPipeLineDeliveryTimeChromaPrefetch[],
+		double              DisplayPipeRequestDeliveryTimeLuma[],
+		double              DisplayPipeRequestDeliveryTimeChroma[],
+		double              DisplayPipeRequestDeliveryTimeLumaPrefetch[],
+		double              DisplayPipeRequestDeliveryTimeChromaPrefetch[],
+		double              CursorRequestDeliveryTime[],
+		double              CursorRequestDeliveryTimePrefetch[]);
+
+void dml32_CalculateMetaAndPTETimes(
+		bool use_one_row_for_frame[],
+		unsigned int NumberOfActiveSurfaces,
+		bool GPUVMEnable,
+		unsigned int MetaChunkSize,
+		unsigned int MinMetaChunkSizeBytes,
+		unsigned int    HTotal[],
+		double  VRatio[],
+		double  VRatioChroma[],
+		double  DestinationLinesToRequestRowInVBlank[],
+		double  DestinationLinesToRequestRowInImmediateFlip[],
+		bool DCCEnable[],
+		double  PixelClock[],
+		unsigned int BytePerPixelY[],
+		unsigned int BytePerPixelC[],
+		enum dm_rotation_angle SourceRotation[],
+		unsigned int dpte_row_height[],
+		unsigned int dpte_row_height_chroma[],
+		unsigned int meta_row_width[],
+		unsigned int meta_row_width_chroma[],
+		unsigned int meta_row_height[],
+		unsigned int meta_row_height_chroma[],
+		unsigned int meta_req_width[],
+		unsigned int meta_req_width_chroma[],
+		unsigned int meta_req_height[],
+		unsigned int meta_req_height_chroma[],
+		unsigned int dpte_group_bytes[],
+		unsigned int    PTERequestSizeY[],
+		unsigned int    PTERequestSizeC[],
+		unsigned int    PixelPTEReqWidthY[],
+		unsigned int    PixelPTEReqHeightY[],
+		unsigned int    PixelPTEReqWidthC[],
+		unsigned int    PixelPTEReqHeightC[],
+		unsigned int    dpte_row_width_luma_ub[],
+		unsigned int    dpte_row_width_chroma_ub[],
+
+		/* Output */
+		double DST_Y_PER_PTE_ROW_NOM_L[],
+		double DST_Y_PER_PTE_ROW_NOM_C[],
+		double DST_Y_PER_META_ROW_NOM_L[],
+		double DST_Y_PER_META_ROW_NOM_C[],
+		double TimePerMetaChunkNominal[],
+		double TimePerChromaMetaChunkNominal[],
+		double TimePerMetaChunkVBlank[],
+		double TimePerChromaMetaChunkVBlank[],
+		double TimePerMetaChunkFlip[],
+		double TimePerChromaMetaChunkFlip[],
+		double time_per_pte_group_nom_luma[],
+		double time_per_pte_group_vblank_luma[],
+		double time_per_pte_group_flip_luma[],
+		double time_per_pte_group_nom_chroma[],
+		double time_per_pte_group_vblank_chroma[],
+		double time_per_pte_group_flip_chroma[]);
+
+void dml32_CalculateVMGroupAndRequestTimes(
+		unsigned int     NumberOfActiveSurfaces,
+		bool     GPUVMEnable,
+		unsigned int     GPUVMMaxPageTableLevels,
+		unsigned int     HTotal[],
+		unsigned int     BytePerPixelC[],
+		double      DestinationLinesToRequestVMInVBlank[],
+		double      DestinationLinesToRequestVMInImmediateFlip[],
+		bool     DCCEnable[],
+		double      PixelClock[],
+		unsigned int        dpte_row_width_luma_ub[],
+		unsigned int        dpte_row_width_chroma_ub[],
+		unsigned int     vm_group_bytes[],
+		unsigned int     dpde0_bytes_per_frame_ub_l[],
+		unsigned int     dpde0_bytes_per_frame_ub_c[],
+		unsigned int        meta_pte_bytes_per_frame_ub_l[],
+		unsigned int        meta_pte_bytes_per_frame_ub_c[],
+
+		/* Output */
+		double      TimePerVMGroupVBlank[],
+		double      TimePerVMGroupFlip[],
+		double      TimePerVMRequestVBlank[],
+		double      TimePerVMRequestFlip[]);
+
+void dml32_CalculateDCCConfiguration(
+		bool             DCCEnabled,
+		bool             DCCProgrammingAssumesScanDirectionUnknown,
+		enum source_format_class SourcePixelFormat,
+		unsigned int             SurfaceWidthLuma,
+		unsigned int             SurfaceWidthChroma,
+		unsigned int             SurfaceHeightLuma,
+		unsigned int             SurfaceHeightChroma,
+		unsigned int                nomDETInKByte,
+		unsigned int             RequestHeight256ByteLuma,
+		unsigned int             RequestHeight256ByteChroma,
+		enum dm_swizzle_mode     TilingFormat,
+		unsigned int             BytePerPixelY,
+		unsigned int             BytePerPixelC,
+		double              BytePerPixelDETY,
+		double              BytePerPixelDETC,
+		enum dm_rotation_angle   SourceRotation,
+		/* Output */
+		unsigned int        *MaxUncompressedBlockLuma,
+		unsigned int        *MaxUncompressedBlockChroma,
+		unsigned int        *MaxCompressedBlockLuma,
+		unsigned int        *MaxCompressedBlockChroma,
+		unsigned int        *IndependentBlockLuma,
+		unsigned int        *IndependentBlockChroma);
+
+void dml32_CalculateStutterEfficiency(
+		unsigned int      CompressedBufferSizeInkByte,
+		enum dm_use_mall_for_pstate_change_mode UseMALLForPStateChange[],
+		bool   UnboundedRequestEnabled,
+		unsigned int      MetaFIFOSizeInKEntries,
+		unsigned int      ZeroSizeBufferEntries,
+		unsigned int      PixelChunkSizeInKByte,
+		unsigned int   NumberOfActiveSurfaces,
+		unsigned int      ROBBufferSizeInKByte,
+		double    TotalDataReadBandwidth,
+		double    DCFCLK,
+		double    ReturnBW,
+		unsigned int      CompbufReservedSpace64B,
+		unsigned int      CompbufReservedSpaceZs,
+		double    SRExitTime,
+		double    SRExitZ8Time,
+		bool   SynchronizeTimingsFinal,
+		unsigned int   BlendingAndTiming[],
+		double    StutterEnterPlusExitWatermark,
+		double    Z8StutterEnterPlusExitWatermark,
+		bool   ProgressiveToInterlaceUnitInOPP,
+		bool   Interlace[],
+		double    MinTTUVBlank[],
+		unsigned int   DPPPerSurface[],
+		unsigned int      DETBufferSizeY[],
+		unsigned int   BytePerPixelY[],
+		double    BytePerPixelDETY[],
+		double      SwathWidthY[],
+		unsigned int   SwathHeightY[],
+		unsigned int   SwathHeightC[],
+		double    NetDCCRateLuma[],
+		double    NetDCCRateChroma[],
+		double    DCCFractionOfZeroSizeRequestsLuma[],
+		double    DCCFractionOfZeroSizeRequestsChroma[],
+		unsigned int      HTotal[],
+		unsigned int      VTotal[],
+		double    PixelClock[],
+		double    VRatio[],
+		enum dm_rotation_angle SourceRotation[],
+		unsigned int   BlockHeight256BytesY[],
+		unsigned int   BlockWidth256BytesY[],
+		unsigned int   BlockHeight256BytesC[],
+		unsigned int   BlockWidth256BytesC[],
+		unsigned int   DCCYMaxUncompressedBlock[],
+		unsigned int   DCCCMaxUncompressedBlock[],
+		unsigned int      VActive[],
+		bool   DCCEnable[],
+		bool   WritebackEnable[],
+		double    ReadBandwidthSurfaceLuma[],
+		double    ReadBandwidthSurfaceChroma[],
+		double    meta_row_bw[],
+		double    dpte_row_bw[],
+
+		/* Output */
+		double   *StutterEfficiencyNotIncludingVBlank,
+		double   *StutterEfficiency,
+		unsigned int     *NumberOfStutterBurstsPerFrame,
+		double   *Z8StutterEfficiencyNotIncludingVBlank,
+		double   *Z8StutterEfficiency,
+		unsigned int     *Z8NumberOfStutterBurstsPerFrame,
+		double   *StutterPeriod,
+		bool  *DCHUBBUB_ARB_CSTATE_MAX_CAP_MODE);
+
+void dml32_CalculateMaxDETAndMinCompressedBufferSize(
+		unsigned int    ConfigReturnBufferSizeInKByte,
+		unsigned int    ROBBufferSizeInKByte,
+		unsigned int MaxNumDPP,
+		bool nomDETInKByteOverrideEnable, // VBA_DELTA, allow DV to override default DET size
+		unsigned int nomDETInKByteOverrideValue,  // VBA_DELTA
+
+		/* Output */
+		unsigned int *MaxTotalDETInKByte,
+		unsigned int *nomDETInKByte,
+		unsigned int *MinCompressedBufferSizeInKByte);
+
+bool dml32_CalculateVActiveBandwithSupport(unsigned int NumberOfActiveSurfaces,
+		double ReturnBW,
+		bool NotUrgentLatencyHiding[],
+		double ReadBandwidthLuma[],
+		double ReadBandwidthChroma[],
+		double cursor_bw[],
+		double meta_row_bandwidth[],
+		double dpte_row_bandwidth[],
+		unsigned int NumberOfDPP[],
+		double UrgentBurstFactorLuma[],
+		double UrgentBurstFactorChroma[],
+		double UrgentBurstFactorCursor[]);
+
+void dml32_CalculatePrefetchBandwithSupport(unsigned int NumberOfActiveSurfaces,
+		double ReturnBW,
+		bool NotUrgentLatencyHiding[],
+		double ReadBandwidthLuma[],
+		double ReadBandwidthChroma[],
+		double PrefetchBandwidthLuma[],
+		double PrefetchBandwidthChroma[],
+		double cursor_bw[],
+		double meta_row_bandwidth[],
+		double dpte_row_bandwidth[],
+		double cursor_bw_pre[],
+		double prefetch_vmrow_bw[],
+		unsigned int NumberOfDPP[],
+		double UrgentBurstFactorLuma[],
+		double UrgentBurstFactorChroma[],
+		double UrgentBurstFactorCursor[],
+		double UrgentBurstFactorLumaPre[],
+		double UrgentBurstFactorChromaPre[],
+		double UrgentBurstFactorCursorPre[],
+
+		/* output */
+		double  *PrefetchBandwidth,
+		double  *FractionOfUrgentBandwidth,
+		bool *PrefetchBandwidthSupport);
+
+double dml32_CalculateBandwidthAvailableForImmediateFlip(unsigned int NumberOfActiveSurfaces,
+		double ReturnBW,
+		double ReadBandwidthLuma[],
+		double ReadBandwidthChroma[],
+		double PrefetchBandwidthLuma[],
+		double PrefetchBandwidthChroma[],
+		double cursor_bw[],
+		double cursor_bw_pre[],
+		unsigned int NumberOfDPP[],
+		double UrgentBurstFactorLuma[],
+		double UrgentBurstFactorChroma[],
+		double UrgentBurstFactorCursor[],
+		double UrgentBurstFactorLumaPre[],
+		double UrgentBurstFactorChromaPre[],
+		double UrgentBurstFactorCursorPre[]);
+
+void dml32_CalculateImmediateFlipBandwithSupport(unsigned int NumberOfActiveSurfaces,
+		double ReturnBW,
+		enum immediate_flip_requirement ImmediateFlipRequirement[],
+		double final_flip_bw[],
+		double ReadBandwidthLuma[],
+		double ReadBandwidthChroma[],
+		double PrefetchBandwidthLuma[],
+		double PrefetchBandwidthChroma[],
+		double cursor_bw[],
+		double meta_row_bandwidth[],
+		double dpte_row_bandwidth[],
+		double cursor_bw_pre[],
+		double prefetch_vmrow_bw[],
+		unsigned int NumberOfDPP[],
+		double UrgentBurstFactorLuma[],
+		double UrgentBurstFactorChroma[],
+		double UrgentBurstFactorCursor[],
+		double UrgentBurstFactorLumaPre[],
+		double UrgentBurstFactorChromaPre[],
+		double UrgentBurstFactorCursorPre[],
+
+		/* output */
+		double  *TotalBandwidth,
+		double  *FractionOfUrgentBandwidth,
+		bool *ImmediateFlipBandwidthSupport);
+
+#endif
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.c
new file mode 100644
index 000000000000..269bdfc4bc40
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.c
@@ -0,0 +1,616 @@
+/*
+ * Copyright 2022 Advanced Micro Devices, Inc.
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
+ * Authors: AMD
+ *
+ */
+
+
+#include "../display_mode_lib.h"
+#include "../display_mode_vba.h"
+#include "../dml_inline_defs.h"
+#include "display_rq_dlg_calc_32.h"
+
+static bool is_dual_plane(enum source_format_class source_format)
+{
+	bool ret_val = 0;
+
+	if ((source_format == dm_420_12) || (source_format == dm_420_8) || (source_format == dm_420_10)
+		|| (source_format == dm_rgbe_alpha))
+		ret_val = 1;
+
+	return ret_val;
+}
+
+void dml32_rq_dlg_get_rq_reg(display_rq_regs_st *rq_regs,
+		struct display_mode_lib *mode_lib,
+		const display_e2e_pipe_params_st *e2e_pipe_param,
+		const unsigned int num_pipes,
+		const unsigned int pipe_idx)
+{
+	const display_pipe_source_params_st *src = &e2e_pipe_param[pipe_idx].pipe.src;
+	bool dual_plane = is_dual_plane((enum source_format_class) (src->source_format));
+    double stored_swath_l_bytes;
+    double stored_swath_c_bytes;
+    bool is_phantom_pipe;
+	uint32_t pixel_chunk_bytes = 0;
+	uint32_t min_pixel_chunk_bytes = 0;
+	uint32_t meta_chunk_bytes = 0;
+	uint32_t min_meta_chunk_bytes = 0;
+	uint32_t dpte_group_bytes = 0;
+	uint32_t mpte_group_bytes = 0;
+
+	uint32_t p1_pixel_chunk_bytes = 0;
+	uint32_t p1_min_pixel_chunk_bytes = 0;
+	uint32_t p1_meta_chunk_bytes = 0;
+	uint32_t p1_min_meta_chunk_bytes = 0;
+	uint32_t p1_dpte_group_bytes = 0;
+	uint32_t p1_mpte_group_bytes = 0;
+
+    unsigned int detile_buf_size_in_bytes;
+    unsigned int detile_buf_plane1_addr;
+    unsigned int pte_row_height_linear;
+
+	memset(rq_regs, 0, sizeof(*rq_regs));
+
+	dml_print("DML_DLG::%s: Calculation for pipe[%d] start, num_pipes=%d\n", __func__, pipe_idx, num_pipes);
+
+	pixel_chunk_bytes = get_pixel_chunk_size_in_kbyte(mode_lib, e2e_pipe_param, num_pipes) * 1024; // From VBA
+	min_pixel_chunk_bytes = get_min_pixel_chunk_size_in_byte(mode_lib, e2e_pipe_param, num_pipes); // From VBA
+
+	if (pixel_chunk_bytes == 64 * 1024)
+		min_pixel_chunk_bytes = 0;
+
+	meta_chunk_bytes = get_meta_chunk_size_in_kbyte(mode_lib, e2e_pipe_param, num_pipes) * 1024; // From VBA
+	min_meta_chunk_bytes = get_min_meta_chunk_size_in_byte(mode_lib, e2e_pipe_param, num_pipes); // From VBA
+
+	dpte_group_bytes = get_dpte_group_size_in_bytes(mode_lib, e2e_pipe_param, num_pipes, pipe_idx); // From VBA
+	mpte_group_bytes = get_vm_group_size_in_bytes(mode_lib, e2e_pipe_param, num_pipes, pipe_idx); // From VBA
+
+	p1_pixel_chunk_bytes = pixel_chunk_bytes;
+	p1_min_pixel_chunk_bytes = min_pixel_chunk_bytes;
+	p1_meta_chunk_bytes = meta_chunk_bytes;
+	p1_min_meta_chunk_bytes = min_meta_chunk_bytes;
+	p1_dpte_group_bytes = dpte_group_bytes;
+	p1_mpte_group_bytes = mpte_group_bytes;
+
+	if ((enum source_format_class) src->source_format == dm_rgbe_alpha)
+		p1_pixel_chunk_bytes = get_alpha_pixel_chunk_size_in_kbyte(mode_lib, e2e_pipe_param, num_pipes) * 1024;
+
+	rq_regs->rq_regs_l.chunk_size = dml_log2(pixel_chunk_bytes) - 10;
+	rq_regs->rq_regs_c.chunk_size = dml_log2(p1_pixel_chunk_bytes) - 10;
+
+	if (min_pixel_chunk_bytes == 0)
+		rq_regs->rq_regs_l.min_chunk_size = 0;
+	else
+		rq_regs->rq_regs_l.min_chunk_size = dml_log2(min_pixel_chunk_bytes) - 8 + 1;
+
+	if (p1_min_pixel_chunk_bytes == 0)
+		rq_regs->rq_regs_c.min_chunk_size = 0;
+	else
+		rq_regs->rq_regs_c.min_chunk_size = dml_log2(p1_min_pixel_chunk_bytes) - 8 + 1;
+
+	rq_regs->rq_regs_l.meta_chunk_size = dml_log2(meta_chunk_bytes) - 10;
+	rq_regs->rq_regs_c.meta_chunk_size = dml_log2(p1_meta_chunk_bytes) - 10;
+
+	if (min_meta_chunk_bytes == 0)
+		rq_regs->rq_regs_l.min_meta_chunk_size = 0;
+	else
+		rq_regs->rq_regs_l.min_meta_chunk_size = dml_log2(min_meta_chunk_bytes) - 6 + 1;
+
+	if (min_meta_chunk_bytes == 0)
+		rq_regs->rq_regs_c.min_meta_chunk_size = 0;
+	else
+		rq_regs->rq_regs_c.min_meta_chunk_size = dml_log2(p1_min_meta_chunk_bytes) - 6 + 1;
+
+	rq_regs->rq_regs_l.dpte_group_size = dml_log2(dpte_group_bytes) - 6;
+	rq_regs->rq_regs_l.mpte_group_size = dml_log2(mpte_group_bytes) - 6;
+	rq_regs->rq_regs_c.dpte_group_size = dml_log2(p1_dpte_group_bytes) - 6;
+	rq_regs->rq_regs_c.mpte_group_size = dml_log2(p1_mpte_group_bytes) - 6;
+
+	detile_buf_size_in_bytes = get_det_buffer_size_kbytes(mode_lib, e2e_pipe_param, num_pipes, pipe_idx) * 1024;
+	detile_buf_plane1_addr = 0;
+	pte_row_height_linear = get_dpte_row_height_linear_l(mode_lib, e2e_pipe_param, num_pipes,
+			pipe_idx);
+
+	if (src->sw_mode == dm_sw_linear)
+		ASSERT(pte_row_height_linear >= 8);
+
+	rq_regs->rq_regs_l.pte_row_height_linear = dml_floor(dml_log2(pte_row_height_linear), 1) - 3;
+
+	if (dual_plane) {
+		unsigned int p1_pte_row_height_linear = get_dpte_row_height_linear_c(mode_lib, e2e_pipe_param,
+				num_pipes, pipe_idx);
+		;
+		if (src->sw_mode == dm_sw_linear)
+			ASSERT(p1_pte_row_height_linear >= 8);
+
+		rq_regs->rq_regs_c.pte_row_height_linear = dml_floor(dml_log2(p1_pte_row_height_linear), 1) - 3;
+	}
+
+	rq_regs->rq_regs_l.swath_height = dml_log2(get_swath_height_l(mode_lib, e2e_pipe_param, num_pipes, pipe_idx));
+	rq_regs->rq_regs_c.swath_height = dml_log2(get_swath_height_c(mode_lib, e2e_pipe_param, num_pipes, pipe_idx));
+
+	// FIXME: take the max between luma, chroma chunk size?
+	// okay for now, as we are setting pixel_chunk_bytes to 8kb anyways
+	if (pixel_chunk_bytes >= 32 * 1024 || (dual_plane && p1_pixel_chunk_bytes >= 32 * 1024)) { //32kb
+		rq_regs->drq_expansion_mode = 0;
+	} else {
+		rq_regs->drq_expansion_mode = 2;
+	}
+	rq_regs->prq_expansion_mode = 1;
+	rq_regs->mrq_expansion_mode = 1;
+	rq_regs->crq_expansion_mode = 1;
+
+	stored_swath_l_bytes = get_det_stored_buffer_size_l_bytes(mode_lib, e2e_pipe_param, num_pipes,
+			pipe_idx);
+	stored_swath_c_bytes = get_det_stored_buffer_size_c_bytes(mode_lib, e2e_pipe_param, num_pipes,
+			pipe_idx);
+	is_phantom_pipe = get_is_phantom_pipe(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);
+
+	// Note: detile_buf_plane1_addr is in unit of 1KB
+	if (dual_plane) {
+		if (is_phantom_pipe) {
+			detile_buf_plane1_addr = ((1024.0 * 1024.0) / 2.0 / 1024.0); // half to chroma
+		} else {
+			if (stored_swath_l_bytes / stored_swath_c_bytes <= 1.5) {
+				detile_buf_plane1_addr = (detile_buf_size_in_bytes / 2.0 / 1024.0); // half to chroma
+#ifdef __DML_RQ_DLG_CALC_DEBUG__
+				dml_print("DML_DLG: %s: detile_buf_plane1_addr = %d (1/2 to chroma)\n",
+						__func__, detile_buf_plane1_addr);
+#endif
+			} else {
+				detile_buf_plane1_addr =
+						dml_round_to_multiple(
+								(unsigned int) ((2.0 * detile_buf_size_in_bytes) / 3.0),
+								1024, 0) / 1024.0; // 2/3 to luma
+#ifdef __DML_RQ_DLG_CALC_DEBUG__
+				dml_print("DML_DLG: %s: detile_buf_plane1_addr = %d (1/3 chroma)\n",
+						__func__, detile_buf_plane1_addr);
+#endif
+			}
+		}
+	}
+	rq_regs->plane1_base_address = detile_buf_plane1_addr;
+
+#ifdef __DML_RQ_DLG_CALC_DEBUG__
+	dml_print("DML_DLG: %s: is_phantom_pipe = %d\n", __func__, is_phantom_pipe);
+	dml_print("DML_DLG: %s: stored_swath_l_bytes = %f\n", __func__, stored_swath_l_bytes);
+	dml_print("DML_DLG: %s: stored_swath_c_bytes = %f\n", __func__, stored_swath_c_bytes);
+	dml_print("DML_DLG: %s: detile_buf_size_in_bytes = %d\n", __func__, detile_buf_size_in_bytes);
+	dml_print("DML_DLG: %s: detile_buf_plane1_addr = %d\n", __func__, detile_buf_plane1_addr);
+	dml_print("DML_DLG: %s: plane1_base_address = %d\n", __func__, rq_regs->plane1_base_address);
+#endif
+	print__rq_regs_st(mode_lib, rq_regs);
+	dml_print("DML_DLG::%s: Calculation for pipe[%d] done, num_pipes=%d\n", __func__, pipe_idx, num_pipes);
+}
+
+void dml32_rq_dlg_get_dlg_reg(struct display_mode_lib *mode_lib,
+		display_dlg_regs_st *dlg_regs,
+		display_ttu_regs_st *ttu_regs,
+		display_e2e_pipe_params_st *e2e_pipe_param,
+		const unsigned int num_pipes,
+		const unsigned int pipe_idx)
+{
+	const display_pipe_source_params_st *src = &e2e_pipe_param[pipe_idx].pipe.src;
+	const display_pipe_dest_params_st *dst = &e2e_pipe_param[pipe_idx].pipe.dest;
+	const display_clocks_and_cfg_st *clks = &e2e_pipe_param[pipe_idx].clks_cfg;
+	double refcyc_per_req_delivery_pre_cur0 = 0.;
+	double refcyc_per_req_delivery_cur0 = 0.;
+	double refcyc_per_req_delivery_pre_c = 0.;
+	double refcyc_per_req_delivery_c = 0.;
+    double refcyc_per_req_delivery_pre_l;
+    double refcyc_per_req_delivery_l;
+	double refcyc_per_line_delivery_pre_c = 0.;
+	double refcyc_per_line_delivery_c = 0.;
+    double refcyc_per_line_delivery_pre_l;
+    double refcyc_per_line_delivery_l;
+    double min_ttu_vblank;
+    double vratio_pre_l;
+    double vratio_pre_c;
+    unsigned int min_dst_y_next_start;
+	unsigned int htotal = dst->htotal;
+	unsigned int hblank_end = dst->hblank_end;
+	unsigned int vblank_end = dst->vblank_end;
+	bool interlaced = dst->interlaced;
+	double pclk_freq_in_mhz = dst->pixel_rate_mhz;
+    unsigned int vready_after_vcount0;
+	double refclk_freq_in_mhz = clks->refclk_mhz;
+	double ref_freq_to_pix_freq = refclk_freq_in_mhz / pclk_freq_in_mhz;
+	bool dual_plane = 0;
+	unsigned int pipe_index_in_combine[DC__NUM_PIPES__MAX];
+    int unsigned dst_x_after_scaler;
+    int unsigned dst_y_after_scaler;
+    double dst_y_prefetch;
+    double dst_y_per_vm_vblank;
+    double dst_y_per_row_vblank;
+    double dst_y_per_vm_flip;
+    double dst_y_per_row_flip;
+    double max_dst_y_per_vm_vblank = 32.0;
+    double max_dst_y_per_row_vblank = 16.0;
+
+    double dst_y_per_pte_row_nom_l;
+    double dst_y_per_pte_row_nom_c;
+    double dst_y_per_meta_row_nom_l;
+    double dst_y_per_meta_row_nom_c;
+    double refcyc_per_pte_group_nom_l;
+    double refcyc_per_pte_group_nom_c;
+    double refcyc_per_pte_group_vblank_l;
+    double refcyc_per_pte_group_vblank_c;
+    double refcyc_per_pte_group_flip_l; 
+    double refcyc_per_pte_group_flip_c; 
+    double refcyc_per_meta_chunk_nom_l;
+    double refcyc_per_meta_chunk_nom_c;
+    double refcyc_per_meta_chunk_vblank_l;
+    double refcyc_per_meta_chunk_vblank_c;
+    double refcyc_per_meta_chunk_flip_l;
+    double refcyc_per_meta_chunk_flip_c;
+
+	memset(dlg_regs, 0, sizeof(*dlg_regs));
+	memset(ttu_regs, 0, sizeof(*ttu_regs));
+	dml_print("DML_DLG::%s: Calculation for pipe[%d] starts, num_pipes=%d\n", __func__, pipe_idx, num_pipes);
+	dml_print("DML_DLG: %s: refclk_freq_in_mhz     = %3.2f\n", __func__, refclk_freq_in_mhz);
+	dml_print("DML_DLG: %s: pclk_freq_in_mhz = %3.2f\n", __func__, pclk_freq_in_mhz);
+	dml_print("DML_DLG: %s: ref_freq_to_pix_freq   = %3.2f\n", __func__, ref_freq_to_pix_freq);
+	dml_print("DML_DLG: %s: interlaced = %d\n", __func__, interlaced);
+	ASSERT(ref_freq_to_pix_freq < 4.0);
+
+	dlg_regs->ref_freq_to_pix_freq = (unsigned int) (ref_freq_to_pix_freq * dml_pow(2, 19));
+	dlg_regs->refcyc_per_htotal = (unsigned int) (ref_freq_to_pix_freq * (double) htotal * dml_pow(2, 8));
+	dlg_regs->dlg_vblank_end = interlaced ? (vblank_end / 2) : vblank_end; // 15 bits
+
+	min_ttu_vblank = get_min_ttu_vblank_in_us(mode_lib, e2e_pipe_param, num_pipes, pipe_idx); // From VBA
+	min_dst_y_next_start = get_min_dst_y_next_start(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);
+
+	dml_print("DML_DLG: %s: min_ttu_vblank (us)    = %3.2f\n", __func__, min_ttu_vblank);
+	dml_print("DML_DLG: %s: min_dst_y_next_start = %d\n", __func__, min_dst_y_next_start);
+	dml_print("DML_DLG: %s: ref_freq_to_pix_freq   = %3.2f\n", __func__, ref_freq_to_pix_freq);
+
+	dual_plane = is_dual_plane((enum source_format_class) (src->source_format));
+
+	vready_after_vcount0 = get_vready_at_or_after_vsync(mode_lib, e2e_pipe_param, num_pipes,
+			pipe_idx); // From VBA
+	dlg_regs->vready_after_vcount0 = vready_after_vcount0;
+
+	dml_print("DML_DLG: %s: vready_after_vcount0 = %d\n", __func__, dlg_regs->vready_after_vcount0);
+
+	dst_x_after_scaler = get_dst_x_after_scaler(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);
+	dst_y_after_scaler = get_dst_y_after_scaler(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);
+
+	// do some adjustment on the dst_after scaler to account for odm combine mode
+	dml_print("DML_DLG: %s: input dst_x_after_scaler   = %d\n", __func__, dst_x_after_scaler);
+	dml_print("DML_DLG: %s: input dst_y_after_scaler   = %d\n", __func__, dst_y_after_scaler);
+
+	// need to figure out which side of odm combine we're in
+	if (dst->odm_combine == dm_odm_combine_mode_2to1 || dst->odm_combine == dm_odm_combine_mode_4to1) {
+		// figure out which pipes go together
+		bool visited[DC__NUM_PIPES__MAX];
+		unsigned int i, j, k;
+
+		for (k = 0; k < num_pipes; ++k) {
+			visited[k] = false;
+			pipe_index_in_combine[k] = 0;
+		}
+
+		for (i = 0; i < num_pipes; i++) {
+			if (e2e_pipe_param[i].pipe.src.is_hsplit && !visited[i]) {
+
+				unsigned int grp = e2e_pipe_param[i].pipe.src.hsplit_grp;
+				unsigned int grp_idx = 0;
+
+				for (j = i; j < num_pipes; j++) {
+					if (e2e_pipe_param[j].pipe.src.hsplit_grp == grp
+						&& e2e_pipe_param[j].pipe.src.is_hsplit && !visited[j]) {
+						pipe_index_in_combine[j] = grp_idx;
+						dml_print("DML_DLG: %s: pipe[%d] is in grp %d idx %d\n",
+								__func__, j, grp, grp_idx);
+						grp_idx++;
+						visited[j] = true;
+					}
+				}
+			}
+		}
+	}
+
+	if (dst->odm_combine == dm_odm_combine_mode_disabled) {
+		// FIXME how about ODM split??
+		dlg_regs->refcyc_h_blank_end = (unsigned int) ((double) hblank_end * ref_freq_to_pix_freq);
+	} else {
+		if (dst->odm_combine == dm_odm_combine_mode_2to1 || dst->odm_combine == dm_odm_combine_mode_4to1) {
+			// TODO: We should really check that 4to1 is supported before setting it to 4
+			unsigned int odm_combine_factor = (dst->odm_combine == dm_odm_combine_mode_2to1 ? 2 : 4);
+			unsigned int odm_pipe_index = pipe_index_in_combine[pipe_idx];
+
+			dlg_regs->refcyc_h_blank_end = (unsigned int) (((double) hblank_end
+				+ odm_pipe_index * (double) dst->hactive / odm_combine_factor) * ref_freq_to_pix_freq);
+		}
+	}
+	ASSERT(dlg_regs->refcyc_h_blank_end < (unsigned int)dml_pow(2, 13));
+
+	dml_print("DML_DLG: %s: htotal= %d\n", __func__, htotal);
+	dml_print("DML_DLG: %s: dst_x_after_scaler[%d]= %d\n", __func__, pipe_idx, dst_x_after_scaler);
+	dml_print("DML_DLG: %s: dst_y_after_scaler[%d] = %d\n", __func__, pipe_idx, dst_y_after_scaler);
+
+	dst_y_prefetch = get_dst_y_prefetch(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);        // From VBA
+	// From VBA
+	dst_y_per_vm_vblank = get_dst_y_per_vm_vblank(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);
+	// From VBA
+	dst_y_per_row_vblank = get_dst_y_per_row_vblank(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);
+	dst_y_per_vm_flip = get_dst_y_per_vm_flip(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);    // From VBA
+	dst_y_per_row_flip = get_dst_y_per_row_flip(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);  // From VBA
+
+	// magic!
+	if (htotal <= 75) {
+		max_dst_y_per_vm_vblank = 100.0;
+		max_dst_y_per_row_vblank = 100.0;
+	}
+
+	dml_print("DML_DLG: %s: dst_y_prefetch (after rnd) = %3.2f\n", __func__, dst_y_prefetch);
+	dml_print("DML_DLG: %s: dst_y_per_vm_flip    = %3.2f\n", __func__, dst_y_per_vm_flip);
+	dml_print("DML_DLG: %s: dst_y_per_row_flip   = %3.2f\n", __func__, dst_y_per_row_flip);
+	dml_print("DML_DLG: %s: dst_y_per_vm_vblank  = %3.2f\n", __func__, dst_y_per_vm_vblank);
+	dml_print("DML_DLG: %s: dst_y_per_row_vblank = %3.2f\n", __func__, dst_y_per_row_vblank);
+
+	ASSERT(dst_y_per_vm_vblank < max_dst_y_per_vm_vblank);
+	ASSERT(dst_y_per_row_vblank < max_dst_y_per_row_vblank);
+	ASSERT(dst_y_prefetch > (dst_y_per_vm_vblank + dst_y_per_row_vblank));
+
+	vratio_pre_l = get_vratio_prefetch_l(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);    // From VBA
+	vratio_pre_c = get_vratio_prefetch_c(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);    // From VBA
+
+	dml_print("DML_DLG: %s: vratio_pre_l = %3.2f\n", __func__, vratio_pre_l);
+	dml_print("DML_DLG: %s: vratio_pre_c = %3.2f\n", __func__, vratio_pre_c);
+
+	// Active
+	refcyc_per_line_delivery_pre_l = get_refcyc_per_line_delivery_pre_l_in_us(mode_lib, e2e_pipe_param, num_pipes, pipe_idx) * refclk_freq_in_mhz;   // From VBA
+	refcyc_per_line_delivery_l = get_refcyc_per_line_delivery_l_in_us(mode_lib, e2e_pipe_param, num_pipes,
+			pipe_idx) * refclk_freq_in_mhz;       // From VBA
+
+	dml_print("DML_DLG: %s: refcyc_per_line_delivery_pre_l = %3.2f\n", __func__, refcyc_per_line_delivery_pre_l);
+	dml_print("DML_DLG: %s: refcyc_per_line_delivery_l     = %3.2f\n", __func__, refcyc_per_line_delivery_l);
+
+	if (dual_plane) {
+		refcyc_per_line_delivery_pre_c = get_refcyc_per_line_delivery_pre_c_in_us(mode_lib, e2e_pipe_param,
+				num_pipes, pipe_idx) * refclk_freq_in_mhz;     // From VBA
+		refcyc_per_line_delivery_c = get_refcyc_per_line_delivery_c_in_us(mode_lib, e2e_pipe_param, num_pipes,
+				pipe_idx) * refclk_freq_in_mhz; // From VBA
+
+		dml_print("DML_DLG: %s: refcyc_per_line_delivery_pre_c = %3.2f\n",
+				__func__, refcyc_per_line_delivery_pre_c);
+		dml_print("DML_DLG: %s: refcyc_per_line_delivery_c     = %3.2f\n",
+				__func__, refcyc_per_line_delivery_c);
+	}
+
+	if (src->dynamic_metadata_enable && src->gpuvm)
+		dlg_regs->refcyc_per_vm_dmdata = get_refcyc_per_vm_dmdata_in_us(mode_lib, e2e_pipe_param, num_pipes,
+				pipe_idx) * refclk_freq_in_mhz; // From VBA
+
+	dlg_regs->dmdata_dl_delta = get_dmdata_dl_delta_in_us(mode_lib, e2e_pipe_param, num_pipes, pipe_idx)
+		* refclk_freq_in_mhz; // From VBA
+
+	refcyc_per_req_delivery_pre_l = get_refcyc_per_req_delivery_pre_l_in_us(mode_lib, e2e_pipe_param, num_pipes, pipe_idx) * refclk_freq_in_mhz; // From VBA
+	refcyc_per_req_delivery_l = get_refcyc_per_req_delivery_l_in_us(mode_lib, e2e_pipe_param, num_pipes,
+			pipe_idx) * refclk_freq_in_mhz;     // From VBA
+
+	dml_print("DML_DLG: %s: refcyc_per_req_delivery_pre_l = %3.2f\n", __func__, refcyc_per_req_delivery_pre_l);
+	dml_print("DML_DLG: %s: refcyc_per_req_delivery_l     = %3.2f\n", __func__, refcyc_per_req_delivery_l);
+
+	if (dual_plane) {
+		refcyc_per_req_delivery_pre_c = get_refcyc_per_req_delivery_pre_c_in_us(mode_lib, e2e_pipe_param,
+				num_pipes, pipe_idx) * refclk_freq_in_mhz;  // From VBA
+		refcyc_per_req_delivery_c = get_refcyc_per_req_delivery_c_in_us(mode_lib, e2e_pipe_param, num_pipes,
+				pipe_idx) * refclk_freq_in_mhz;      // From VBA
+
+		dml_print("DML_DLG: %s: refcyc_per_req_delivery_pre_c = %3.2f\n",
+				__func__, refcyc_per_req_delivery_pre_c);
+		dml_print("DML_DLG: %s: refcyc_per_req_delivery_c     = %3.2f\n", __func__, refcyc_per_req_delivery_c);
+	}
+
+	// TTU - Cursor
+	ASSERT(src->num_cursors <= 1);
+	if (src->num_cursors > 0) {
+		refcyc_per_req_delivery_pre_cur0 = get_refcyc_per_cursor_req_delivery_pre_in_us(mode_lib,
+				e2e_pipe_param, num_pipes, pipe_idx) * refclk_freq_in_mhz;  // From VBA
+		refcyc_per_req_delivery_cur0 = get_refcyc_per_cursor_req_delivery_in_us(mode_lib, e2e_pipe_param,
+				num_pipes, pipe_idx) * refclk_freq_in_mhz;      // From VBA
+
+		dml_print("DML_DLG: %s: refcyc_per_req_delivery_pre_cur0 = %3.2f\n",
+				__func__, refcyc_per_req_delivery_pre_cur0);
+		dml_print("DML_DLG: %s: refcyc_per_req_delivery_cur0     = %3.2f\n",
+				__func__, refcyc_per_req_delivery_cur0);
+	}
+
+	// Assign to register structures
+	dlg_regs->min_dst_y_next_start = min_dst_y_next_start * dml_pow(2, 2);
+	ASSERT(dlg_regs->min_dst_y_next_start < (unsigned int)dml_pow(2, 18));
+
+	dlg_regs->dst_y_after_scaler = dst_y_after_scaler; // in terms of line
+	dlg_regs->refcyc_x_after_scaler = dst_x_after_scaler * ref_freq_to_pix_freq; // in terms of refclk
+	dlg_regs->dst_y_prefetch = (unsigned int) (dst_y_prefetch * dml_pow(2, 2));
+	dlg_regs->dst_y_per_vm_vblank = (unsigned int) (dst_y_per_vm_vblank * dml_pow(2, 2));
+	dlg_regs->dst_y_per_row_vblank = (unsigned int) (dst_y_per_row_vblank * dml_pow(2, 2));
+	dlg_regs->dst_y_per_vm_flip = (unsigned int) (dst_y_per_vm_flip * dml_pow(2, 2));
+	dlg_regs->dst_y_per_row_flip = (unsigned int) (dst_y_per_row_flip * dml_pow(2, 2));
+
+	dlg_regs->vratio_prefetch = (unsigned int) (vratio_pre_l * dml_pow(2, 19));
+	dlg_regs->vratio_prefetch_c = (unsigned int) (vratio_pre_c * dml_pow(2, 19));
+
+	dml_print("DML_DLG: %s: dlg_regs->dst_y_per_vm_vblank  = 0x%x\n", __func__, dlg_regs->dst_y_per_vm_vblank);
+	dml_print("DML_DLG: %s: dlg_regs->dst_y_per_row_vblank = 0x%x\n", __func__, dlg_regs->dst_y_per_row_vblank);
+	dml_print("DML_DLG: %s: dlg_regs->dst_y_per_vm_flip    = 0x%x\n", __func__, dlg_regs->dst_y_per_vm_flip);
+	dml_print("DML_DLG: %s: dlg_regs->dst_y_per_row_flip   = 0x%x\n", __func__, dlg_regs->dst_y_per_row_flip);
+
+	dlg_regs->refcyc_per_vm_group_vblank = get_refcyc_per_vm_group_vblank_in_us(mode_lib, e2e_pipe_param,
+			num_pipes, pipe_idx) * refclk_freq_in_mhz;               // From VBA
+	dlg_regs->refcyc_per_vm_group_flip = get_refcyc_per_vm_group_flip_in_us(mode_lib, e2e_pipe_param, num_pipes,
+			pipe_idx) * refclk_freq_in_mhz;                 // From VBA
+	dlg_regs->refcyc_per_vm_req_vblank = get_refcyc_per_vm_req_vblank_in_us(mode_lib, e2e_pipe_param, num_pipes,
+			pipe_idx) * refclk_freq_in_mhz * dml_pow(2, 10);                 // From VBA
+	dlg_regs->refcyc_per_vm_req_flip = get_refcyc_per_vm_req_flip_in_us(mode_lib, e2e_pipe_param, num_pipes,
+			pipe_idx) * refclk_freq_in_mhz * dml_pow(2, 10);  // From VBA
+
+	// From VBA
+	dst_y_per_pte_row_nom_l = get_dst_y_per_pte_row_nom_l(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);
+	// From VBA
+	dst_y_per_pte_row_nom_c = get_dst_y_per_pte_row_nom_c(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);
+	// From VBA
+	dst_y_per_meta_row_nom_l = get_dst_y_per_meta_row_nom_l(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);
+	// From VBA
+	dst_y_per_meta_row_nom_c = get_dst_y_per_meta_row_nom_c(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);
+
+	refcyc_per_pte_group_nom_l = get_refcyc_per_pte_group_nom_l_in_us(mode_lib, e2e_pipe_param, num_pipes,
+			pipe_idx) * refclk_freq_in_mhz;         // From VBA
+	refcyc_per_pte_group_nom_c = get_refcyc_per_pte_group_nom_c_in_us(mode_lib, e2e_pipe_param, num_pipes,
+			pipe_idx) * refclk_freq_in_mhz;         // From VBA
+	refcyc_per_pte_group_vblank_l = get_refcyc_per_pte_group_vblank_l_in_us(mode_lib, e2e_pipe_param,
+			num_pipes, pipe_idx) * refclk_freq_in_mhz;      // From VBA
+	refcyc_per_pte_group_vblank_c = get_refcyc_per_pte_group_vblank_c_in_us(mode_lib, e2e_pipe_param,
+			num_pipes, pipe_idx) * refclk_freq_in_mhz;      // From VBA
+	refcyc_per_pte_group_flip_l = get_refcyc_per_pte_group_flip_l_in_us(mode_lib, e2e_pipe_param, num_pipes,
+			pipe_idx) * refclk_freq_in_mhz;        // From VBA
+	refcyc_per_pte_group_flip_c = get_refcyc_per_pte_group_flip_c_in_us(mode_lib, e2e_pipe_param, num_pipes,
+			pipe_idx) * refclk_freq_in_mhz;        // From VBA
+
+	refcyc_per_meta_chunk_nom_l = get_refcyc_per_meta_chunk_nom_l_in_us(mode_lib, e2e_pipe_param, num_pipes,
+			pipe_idx) * refclk_freq_in_mhz;        // From VBA
+	refcyc_per_meta_chunk_nom_c = get_refcyc_per_meta_chunk_nom_c_in_us(mode_lib, e2e_pipe_param, num_pipes,
+			pipe_idx) * refclk_freq_in_mhz;        // From VBA
+	refcyc_per_meta_chunk_vblank_l = get_refcyc_per_meta_chunk_vblank_l_in_us(mode_lib, e2e_pipe_param,
+			num_pipes, pipe_idx) * refclk_freq_in_mhz;     // From VBA
+	refcyc_per_meta_chunk_vblank_c = get_refcyc_per_meta_chunk_vblank_c_in_us(mode_lib, e2e_pipe_param,
+			num_pipes, pipe_idx) * refclk_freq_in_mhz;     // From VBA
+	refcyc_per_meta_chunk_flip_l = get_refcyc_per_meta_chunk_flip_l_in_us(mode_lib, e2e_pipe_param,
+			num_pipes, pipe_idx) * refclk_freq_in_mhz;       // From VBA
+	refcyc_per_meta_chunk_flip_c = get_refcyc_per_meta_chunk_flip_c_in_us(mode_lib, e2e_pipe_param,
+			num_pipes, pipe_idx) * refclk_freq_in_mhz;       // From VBA
+
+	dlg_regs->dst_y_per_pte_row_nom_l = dst_y_per_pte_row_nom_l * dml_pow(2, 2);
+	dlg_regs->dst_y_per_pte_row_nom_c = dst_y_per_pte_row_nom_c * dml_pow(2, 2);
+	dlg_regs->dst_y_per_meta_row_nom_l = dst_y_per_meta_row_nom_l * dml_pow(2, 2);
+	dlg_regs->dst_y_per_meta_row_nom_c = dst_y_per_meta_row_nom_c * dml_pow(2, 2);
+	dlg_regs->refcyc_per_pte_group_nom_l = refcyc_per_pte_group_nom_l;
+	dlg_regs->refcyc_per_pte_group_nom_c = refcyc_per_pte_group_nom_c;
+	dlg_regs->refcyc_per_pte_group_vblank_l = refcyc_per_pte_group_vblank_l;
+	dlg_regs->refcyc_per_pte_group_vblank_c = refcyc_per_pte_group_vblank_c;
+	dlg_regs->refcyc_per_pte_group_flip_l = refcyc_per_pte_group_flip_l;
+	dlg_regs->refcyc_per_pte_group_flip_c = refcyc_per_pte_group_flip_c;
+	dlg_regs->refcyc_per_meta_chunk_nom_l = refcyc_per_meta_chunk_nom_l;
+	dlg_regs->refcyc_per_meta_chunk_nom_c = refcyc_per_meta_chunk_nom_c;
+	dlg_regs->refcyc_per_meta_chunk_vblank_l = refcyc_per_meta_chunk_vblank_l;
+	dlg_regs->refcyc_per_meta_chunk_vblank_c = refcyc_per_meta_chunk_vblank_c;
+	dlg_regs->refcyc_per_meta_chunk_flip_l = refcyc_per_meta_chunk_flip_l;
+	dlg_regs->refcyc_per_meta_chunk_flip_c = refcyc_per_meta_chunk_flip_c;
+	dlg_regs->refcyc_per_line_delivery_pre_l = (unsigned int) dml_floor(refcyc_per_line_delivery_pre_l, 1);
+	dlg_regs->refcyc_per_line_delivery_l = (unsigned int) dml_floor(refcyc_per_line_delivery_l, 1);
+	dlg_regs->refcyc_per_line_delivery_pre_c = (unsigned int) dml_floor(refcyc_per_line_delivery_pre_c, 1);
+	dlg_regs->refcyc_per_line_delivery_c = (unsigned int) dml_floor(refcyc_per_line_delivery_c, 1);
+
+	dlg_regs->chunk_hdl_adjust_cur0 = 3;
+	dlg_regs->dst_y_offset_cur0 = 0;
+	dlg_regs->chunk_hdl_adjust_cur1 = 3;
+	dlg_regs->dst_y_offset_cur1 = 0;
+
+	dlg_regs->dst_y_delta_drq_limit = 0x7fff; // off
+
+	ttu_regs->refcyc_per_req_delivery_pre_l = (unsigned int) (refcyc_per_req_delivery_pre_l * dml_pow(2, 10));
+	ttu_regs->refcyc_per_req_delivery_l = (unsigned int) (refcyc_per_req_delivery_l * dml_pow(2, 10));
+	ttu_regs->refcyc_per_req_delivery_pre_c = (unsigned int) (refcyc_per_req_delivery_pre_c * dml_pow(2, 10));
+	ttu_regs->refcyc_per_req_delivery_c = (unsigned int) (refcyc_per_req_delivery_c * dml_pow(2, 10));
+	ttu_regs->refcyc_per_req_delivery_pre_cur0 =
+			(unsigned int) (refcyc_per_req_delivery_pre_cur0 * dml_pow(2, 10));
+	ttu_regs->refcyc_per_req_delivery_cur0 = (unsigned int) (refcyc_per_req_delivery_cur0 * dml_pow(2, 10));
+	ttu_regs->refcyc_per_req_delivery_pre_cur1 = 0;
+	ttu_regs->refcyc_per_req_delivery_cur1 = 0;
+	ttu_regs->qos_level_low_wm = 0;
+
+	ttu_regs->qos_level_high_wm = (unsigned int) (4.0 * (double) htotal * ref_freq_to_pix_freq);
+
+	ttu_regs->qos_level_flip = 14;
+	ttu_regs->qos_level_fixed_l = 8;
+	ttu_regs->qos_level_fixed_c = 8;
+	ttu_regs->qos_level_fixed_cur0 = 8;
+	ttu_regs->qos_ramp_disable_l = 0;
+	ttu_regs->qos_ramp_disable_c = 0;
+	ttu_regs->qos_ramp_disable_cur0 = 0;
+	ttu_regs->min_ttu_vblank = min_ttu_vblank * refclk_freq_in_mhz;
+
+	// CHECK for HW registers' range, assert or clamp
+	ASSERT(refcyc_per_req_delivery_pre_l < dml_pow(2, 13));
+	ASSERT(refcyc_per_req_delivery_l < dml_pow(2, 13));
+	ASSERT(refcyc_per_req_delivery_pre_c < dml_pow(2, 13));
+	ASSERT(refcyc_per_req_delivery_c < dml_pow(2, 13));
+	if (dlg_regs->refcyc_per_vm_group_vblank >= (unsigned int) dml_pow(2, 23))
+		dlg_regs->refcyc_per_vm_group_vblank = dml_pow(2, 23) - 1;
+
+	if (dlg_regs->refcyc_per_vm_group_flip >= (unsigned int) dml_pow(2, 23))
+		dlg_regs->refcyc_per_vm_group_flip = dml_pow(2, 23) - 1;
+
+	if (dlg_regs->refcyc_per_vm_req_vblank >= (unsigned int) dml_pow(2, 23))
+		dlg_regs->refcyc_per_vm_req_vblank = dml_pow(2, 23) - 1;
+
+	if (dlg_regs->refcyc_per_vm_req_flip >= (unsigned int) dml_pow(2, 23))
+		dlg_regs->refcyc_per_vm_req_flip = dml_pow(2, 23) - 1;
+
+	ASSERT(dlg_regs->dst_y_after_scaler < (unsigned int) 8);
+	ASSERT(dlg_regs->refcyc_x_after_scaler < (unsigned int)dml_pow(2, 13));
+	ASSERT(dlg_regs->dst_y_per_pte_row_nom_l < (unsigned int)dml_pow(2, 17));
+	if (dual_plane) {
+		if (dlg_regs->dst_y_per_pte_row_nom_c >= (unsigned int) dml_pow(2, 17)) {
+			// FIXME what so special about chroma, can we just assert?
+			dml_print("DML_DLG: %s: Warning dst_y_per_pte_row_nom_c %u > register max U15.2 %u\n",
+					__func__, dlg_regs->dst_y_per_pte_row_nom_c, (unsigned int)dml_pow(2, 17) - 1);
+		}
+	}
+	ASSERT(dlg_regs->dst_y_per_meta_row_nom_l < (unsigned int)dml_pow(2, 17));
+	ASSERT(dlg_regs->dst_y_per_meta_row_nom_c < (unsigned int)dml_pow(2, 17));
+
+	if (dlg_regs->refcyc_per_pte_group_nom_l >= (unsigned int) dml_pow(2, 23))
+		dlg_regs->refcyc_per_pte_group_nom_l = dml_pow(2, 23) - 1;
+	if (dual_plane) {
+		if (dlg_regs->refcyc_per_pte_group_nom_c >= (unsigned int) dml_pow(2, 23))
+			dlg_regs->refcyc_per_pte_group_nom_c = dml_pow(2, 23) - 1;
+	}
+	ASSERT(dlg_regs->refcyc_per_pte_group_vblank_l < (unsigned int)dml_pow(2, 13));
+	if (dual_plane) {
+		ASSERT(dlg_regs->refcyc_per_pte_group_vblank_c < (unsigned int)dml_pow(2, 13));
+	}
+
+	if (dlg_regs->refcyc_per_meta_chunk_nom_l >= (unsigned int) dml_pow(2, 23))
+		dlg_regs->refcyc_per_meta_chunk_nom_l = dml_pow(2, 23) - 1;
+	if (dual_plane) {
+		if (dlg_regs->refcyc_per_meta_chunk_nom_c >= (unsigned int) dml_pow(2, 23))
+			dlg_regs->refcyc_per_meta_chunk_nom_c = dml_pow(2, 23) - 1;
+	}
+	ASSERT(dlg_regs->refcyc_per_meta_chunk_vblank_l < (unsigned int)dml_pow(2, 13));
+	ASSERT(dlg_regs->refcyc_per_meta_chunk_vblank_c < (unsigned int)dml_pow(2, 13));
+	ASSERT(dlg_regs->refcyc_per_line_delivery_pre_l < (unsigned int)dml_pow(2, 13));
+	ASSERT(dlg_regs->refcyc_per_line_delivery_l < (unsigned int)dml_pow(2, 13));
+	ASSERT(dlg_regs->refcyc_per_line_delivery_pre_c < (unsigned int)dml_pow(2, 13));
+	ASSERT(dlg_regs->refcyc_per_line_delivery_c < (unsigned int)dml_pow(2, 13));
+	ASSERT(ttu_regs->qos_level_low_wm < dml_pow(2, 14));
+	ASSERT(ttu_regs->qos_level_high_wm < dml_pow(2, 14));
+	ASSERT(ttu_regs->min_ttu_vblank < dml_pow(2, 24));
+
+	print__ttu_regs_st(mode_lib, ttu_regs);
+	print__dlg_regs_st(mode_lib, dlg_regs);
+	dml_print("DML_DLG::%s: Calculation for pipe[%d] done, num_pipes=%d\n", __func__, pipe_idx, num_pipes);
+}
+
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.h b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.h
new file mode 100644
index 000000000000..ebee365293cd
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.h
@@ -0,0 +1,70 @@
+/*
+ * Copyright 2022 Advanced Micro Devices, Inc.
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
+ * Authors: AMD
+ *
+ */
+
+#ifndef __DML32_DISPLAY_RQ_DLG_CALC_H__
+#define __DML32_DISPLAY_RQ_DLG_CALC_H__
+
+#include "../display_rq_dlg_helpers.h"
+
+struct display_mode_lib;
+
+/*
+* Function: dml_rq_dlg_get_rq_reg
+*  Main entry point for test to get the register values out of this DML class.
+*  This function calls <get_rq_param> and <extract_rq_regs> functions to calculate
+*  and then populate the rq_regs struct
+* Input:
+*  pipe_param - pipe source configuration (e.g. vp, pitch, scaling, dest, etc.)
+* Output:
+*  rq_regs - struct that holds all the RQ registers field value.
+*            See also: <display_rq_regs_st>
+*/
+void dml32_rq_dlg_get_rq_reg(display_rq_regs_st *rq_regs,
+		struct display_mode_lib *mode_lib,
+		const display_e2e_pipe_params_st *e2e_pipe_param,
+		const unsigned int num_pipes,
+		const unsigned int pipe_idx);
+
+/*
+* Function: dml_rq_dlg_get_dlg_reg
+*   Calculate and return DLG and TTU register struct given the system setting
+* Output:
+*  dlg_regs - output DLG register struct
+*  ttu_regs - output DLG TTU register struct
+* Input:
+*  e2e_pipe_param - "compacted" array of e2e pipe param struct
+*  num_pipes - num of active "pipe" or "route"
+*  pipe_idx - index that identifies the e2e_pipe_param that corresponding to this dlg
+*  cstate - 0: when calculate min_ttu_vblank it is assumed cstate is not required. 1: Normal mode, cstate is considered.
+*           Added for legacy or unrealistic timing tests.
+*/
+void dml32_rq_dlg_get_dlg_reg(struct display_mode_lib *mode_lib,
+		display_dlg_regs_st *dlg_regs,
+		display_ttu_regs_st *ttu_regs,
+		display_e2e_pipe_params_st *e2e_pipe_param,
+		const unsigned int num_pipes,
+		const unsigned int pipe_idx);
+
+#endif
diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_enums.h b/drivers/gpu/drm/amd/display/dc/dml/display_mode_enums.h
index edb9f7567d6d..f394b3f3922a 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_enums.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_enums.h
@@ -26,7 +26,11 @@
 #define __DISPLAY_MODE_ENUMS_H__
 
 enum output_encoder_class {
-	dm_dp = 0, dm_hdmi = 1, dm_wb = 2, dm_edp
+	dm_dp = 0,
+	dm_hdmi = 1,
+	dm_wb = 2,
+	dm_edp = 3,
+	dm_dp2p0 = 5,
 };
 enum output_format_class {
 	dm_444 = 0, dm_420 = 1, dm_n422, dm_s422
@@ -105,6 +109,10 @@ enum clock_change_support {
 	dm_dram_clock_change_uninitialized = 0,
 	dm_dram_clock_change_vactive,
 	dm_dram_clock_change_vblank,
+	dm_dram_clock_change_vactive_w_mall_full_frame,
+	dm_dram_clock_change_vactive_w_mall_sub_vp,
+	dm_dram_clock_change_vblank_w_mall_full_frame,
+	dm_dram_clock_change_vblank_w_mall_sub_vp,
 	dm_dram_clock_change_unsupported
 };
 
@@ -169,6 +177,9 @@ enum odm_combine_mode {
 	dm_odm_combine_mode_disabled,
 	dm_odm_combine_mode_2to1,
 	dm_odm_combine_mode_4to1,
+	dm_odm_split_mode_1to2,
+	dm_odm_mode_mso_1to2,
+	dm_odm_mode_mso_1to4
 };
 
 enum odm_combine_policy {
@@ -176,11 +187,15 @@ enum odm_combine_policy {
 	dm_odm_combine_policy_none,
 	dm_odm_combine_policy_2to1,
 	dm_odm_combine_policy_4to1,
+	dm_odm_split_policy_1to2,
+	dm_odm_mso_policy_1to2,
+	dm_odm_mso_policy_1to4,
 };
 
 enum immediate_flip_requirement {
 	dm_immediate_flip_not_required,
 	dm_immediate_flip_required,
+	dm_immediate_flip_opportunistic,
 };
 
 enum unbounded_requesting_policy {
@@ -189,4 +204,75 @@ enum unbounded_requesting_policy {
 	dm_unbounded_requesting_disable
 };
 
+enum dm_rotation_angle {
+	dm_rotation_0,
+	dm_rotation_90,
+	dm_rotation_180,
+	dm_rotation_270,
+	dm_rotation_0m,
+	dm_rotation_90m,
+	dm_rotation_180m,
+	dm_rotation_270m,
+};
+
+enum dm_use_mall_for_pstate_change_mode {
+	dm_use_mall_pstate_change_disable,
+	dm_use_mall_pstate_change_full_frame,
+	dm_use_mall_pstate_change_sub_viewport,
+	dm_use_mall_pstate_change_phantom_pipe
+};
+
+enum dm_use_mall_for_static_screen_mode {
+	dm_use_mall_static_screen_disable,
+	dm_use_mall_static_screen_optimize,
+	dm_use_mall_static_screen_enable,
+};
+
+enum dm_output_link_dp_rate {
+	dm_dp_rate_na,
+	dm_dp_rate_hbr,
+	dm_dp_rate_hbr2,
+	dm_dp_rate_hbr3,
+	dm_dp_rate_uhbr10,
+	dm_dp_rate_uhbr13p5,
+	dm_dp_rate_uhbr20,
+};
+
+enum dm_fclock_change_support {
+	dm_fclock_change_vactive,
+	dm_fclock_change_vblank,
+	dm_fclock_change_unsupported,
+};
+
+enum dm_prefetch_modes {
+	dm_prefetch_support_uclk_fclk_and_stutter_if_possible,
+	dm_prefetch_support_uclk_fclk_and_stutter,
+	dm_prefetch_support_fclk_and_stutter,
+	dm_prefetch_support_stutter,
+	dm_prefetch_support_none,
+};
+enum dm_output_type {
+	dm_output_type_unknown,
+	dm_output_type_dp,
+	dm_output_type_edp,
+	dm_output_type_dp2p0,
+	dm_output_type_hdmi,
+	dm_output_type_hdmifrl,
+};
+
+enum dm_output_rate {
+	dm_output_rate_unknown,
+	dm_output_rate_dp_rate_hbr,
+	dm_output_rate_dp_rate_hbr2,
+	dm_output_rate_dp_rate_hbr3,
+	dm_output_rate_dp_rate_uhbr10,
+	dm_output_rate_dp_rate_uhbr13p5,
+	dm_output_rate_dp_rate_uhbr20,
+	dm_output_rate_hdmi_rate_3x3,
+	dm_output_rate_hdmi_rate_6x3,
+	dm_output_rate_hdmi_rate_6x4,
+	dm_output_rate_hdmi_rate_8x4,
+	dm_output_rate_hdmi_rate_10x4,
+	dm_output_rate_hdmi_rate_12x4,
+};
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.c b/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.c
index 30db51fbd8cd..5d27ff0ebb5f 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.c
@@ -35,6 +35,8 @@
 #include "dcn30/display_rq_dlg_calc_30.h"
 #include "dcn31/display_mode_vba_31.h"
 #include "dcn31/display_rq_dlg_calc_31.h"
+#include "dcn32/display_mode_vba_32.h"
+#include "dcn32/display_rq_dlg_calc_32.h"
 #include "dml_logger.h"
 
 const struct dml_funcs dml20_funcs = {
@@ -72,6 +74,13 @@ const struct dml_funcs dml31_funcs = {
 	.rq_dlg_get_rq_reg = dml31_rq_dlg_get_rq_reg
 };
 
+const struct dml_funcs dml32_funcs = {
+	.validate = dml32_ModeSupportAndSystemConfigurationFull,
+    .recalculate = dml32_recalculate,
+	.rq_dlg_get_dlg_reg_v2 = dml32_rq_dlg_get_dlg_reg,
+	.rq_dlg_get_rq_reg_v2 = dml32_rq_dlg_get_rq_reg
+};
+
 void dml_init_instance(struct display_mode_lib *lib,
 		const struct _vcs_dpi_soc_bounding_box_st *soc_bb,
 		const struct _vcs_dpi_ip_params_st *ip_params,
@@ -98,6 +107,9 @@ void dml_init_instance(struct display_mode_lib *lib,
 	case DML_PROJECT_DCN31_FPGA:
 		lib->funcs = dml31_funcs;
 		break;
+	case DML_PROJECT_DCN32:
+		lib->funcs = dml32_funcs;
+		break;
 
 	default:
 		break;
diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.h b/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.h
index d76251fd1566..2bdd6ed22611 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.h
@@ -41,6 +41,7 @@ enum dml_project {
 	DML_PROJECT_DCN30,
 	DML_PROJECT_DCN31,
 	DML_PROJECT_DCN31_FPGA,
+	DML_PROJECT_DCN32,
 };
 
 struct display_mode_lib;
@@ -62,6 +63,20 @@ struct dml_funcs {
 		struct display_mode_lib *mode_lib,
 		display_rq_regs_st *rq_regs,
 		const display_pipe_params_st *pipe_param);
+	// DLG interfaces have different function parameters in DCN32.
+	// Create new function pointers to address the changes
+	void (*rq_dlg_get_dlg_reg_v2)(
+			struct display_mode_lib *mode_lib,
+			display_dlg_regs_st *dlg_regs,
+			display_ttu_regs_st *ttu_regs,
+			display_e2e_pipe_params_st *e2e_pipe_param,
+			const unsigned int num_pipes,
+			const unsigned int pipe_idx);
+	void (*rq_dlg_get_rq_reg_v2)(display_rq_regs_st *rq_regs,
+			struct display_mode_lib *mode_lib,
+			const display_e2e_pipe_params_st *e2e_pipe_param,
+			const unsigned int num_pipes,
+			const unsigned int pipe_idx);
 	void (*recalculate)(struct display_mode_lib *mode_lib);
 	void (*validate)(struct display_mode_lib *mode_lib);
 };
diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_structs.h b/drivers/gpu/drm/amd/display/dc/dml/display_mode_structs.h
index 2df660cd8801..967d3e1ce886 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_structs.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_structs.h
@@ -54,12 +54,102 @@ typedef struct _vcs_dpi_display_rq_regs_st display_rq_regs_st;
 typedef struct _vcs_dpi_display_dlg_sys_params_st display_dlg_sys_params_st;
 typedef struct _vcs_dpi_display_arb_params_st display_arb_params_st;
 
+typedef struct {
+	double UrgentWatermark;
+	double WritebackUrgentWatermark;
+	double DRAMClockChangeWatermark;
+	double FCLKChangeWatermark;
+	double WritebackDRAMClockChangeWatermark;
+	double WritebackFCLKChangeWatermark;
+	double StutterExitWatermark;
+	double StutterEnterPlusExitWatermark;
+	double Z8StutterExitWatermark;
+	double Z8StutterEnterPlusExitWatermark;
+	double USRRetrainingWatermark;
+} Watermarks;
+
+typedef struct {
+	double UrgentLatency;
+	double ExtraLatency;
+	double WritebackLatency;
+	double DRAMClockChangeLatency;
+	double FCLKChangeLatency;
+	double SRExitTime;
+	double SREnterPlusExitTime;
+	double SRExitZ8Time;
+	double SREnterPlusExitZ8Time;
+	double USRRetrainingLatencyPlusSMNLatency;
+} Latencies;
+
+typedef struct {
+	double Dppclk;
+	double Dispclk;
+	double PixelClock;
+	double DCFClkDeepSleep;
+	unsigned int DPPPerSurface;
+	bool ScalerEnabled;
+	enum dm_rotation_angle SourceRotation;
+	unsigned int ViewportHeight;
+	unsigned int ViewportHeightChroma;
+	unsigned int BlockWidth256BytesY;
+	unsigned int BlockHeight256BytesY;
+	unsigned int BlockWidth256BytesC;
+	unsigned int BlockHeight256BytesC;
+	unsigned int BlockWidthY;
+	unsigned int BlockHeightY;
+	unsigned int BlockWidthC;
+	unsigned int BlockHeightC;
+	unsigned int InterlaceEnable;
+	unsigned int NumberOfCursors;
+	unsigned int VBlank;
+	unsigned int HTotal;
+	unsigned int HActive;
+	bool DCCEnable;
+	enum odm_combine_mode ODMMode;
+	enum source_format_class SourcePixelFormat;
+	enum dm_swizzle_mode SurfaceTiling;
+	unsigned int BytePerPixelY;
+	unsigned int BytePerPixelC;
+	bool ProgressiveToInterlaceUnitInOPP;
+	double VRatio;
+	double VRatioChroma;
+	unsigned int VTaps;
+	unsigned int VTapsChroma;
+	unsigned int PitchY;
+	unsigned int DCCMetaPitchY;
+	unsigned int PitchC;
+	unsigned int DCCMetaPitchC;
+	bool ViewportStationary;
+	unsigned int ViewportXStart;
+	unsigned int ViewportYStart;
+	unsigned int ViewportXStartC;
+	unsigned int ViewportYStartC;
+	bool FORCE_ONE_ROW_FOR_FRAME;
+	unsigned int SwathHeightY;
+	unsigned int SwathHeightC;
+} DmlPipe;
+
+typedef struct {
+	double UrgentLatency;
+	double ExtraLatency;
+	double WritebackLatency;
+	double DRAMClockChangeLatency;
+	double FCLKChangeLatency;
+	double SRExitTime;
+	double SREnterPlusExitTime;
+	double SRExitZ8Time;
+	double SREnterPlusExitZ8Time;
+	double USRRetrainingLatency;
+	double SMNLatency;
+} SOCParametersList;
+
 struct _vcs_dpi_voltage_scaling_st {
 	int state;
 	double dscclk_mhz;
 	double dcfclk_mhz;
 	double socclk_mhz;
 	double phyclk_d18_mhz;
+	double phyclk_d32_mhz;
 	double dram_speed_mts;
 	double fabricclk_mhz;
 	double dispclk_mhz;
@@ -80,6 +170,15 @@ struct _vcs_dpi_soc_bounding_box_st {
 	double urgent_latency_pixel_data_only_us;
 	double urgent_latency_pixel_mixed_with_vm_data_us;
 	double urgent_latency_vm_data_only_us;
+	double usr_retraining_latency_us;
+	double smn_latency_us;
+	double fclk_change_latency_us;
+	double mall_allocated_for_dcn_mbytes;
+	double pct_ideal_fabric_bw_after_urgent;
+	double pct_ideal_dram_bw_after_urgent_strobe;
+	double max_avg_fabric_bw_use_normal_percent;
+	double max_avg_dram_bw_use_normal_strobe_percent;
+	enum dm_prefetch_modes allow_for_pstate_or_stutter_in_vblank_final;
 	double writeback_latency_us;
 	double ideal_dram_bw_after_urgent_percent;
 	double pct_ideal_dram_sdp_bw_after_urgent_pixel_only; // PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelDataOnly
@@ -148,6 +247,9 @@ struct _vcs_dpi_ip_params_st {
 	unsigned int dpp_output_buffer_pixels;
 	unsigned int opp_output_buffer_lines;
 	unsigned int pixel_chunk_size_kbytes;
+	unsigned int alpha_pixel_chunk_size_kbytes;
+	unsigned int min_pixel_chunk_size_bytes;
+	unsigned int dcc_meta_buffer_size_bytes;
 	unsigned char pte_enable;
 	unsigned int pte_chunk_size_kbytes;
 	unsigned int meta_chunk_size_kbytes;
@@ -168,6 +270,7 @@ struct _vcs_dpi_ip_params_st {
 	double writeback_min_hscl_ratio;
 	double writeback_min_vscl_ratio;
 	unsigned int maximum_dsc_bits_per_component;
+	unsigned int maximum_pixels_per_line_per_dsc_unit;
 	unsigned int writeback_max_hscl_taps;
 	unsigned int writeback_max_vscl_taps;
 	unsigned int writeback_line_buffer_luma_buffer_size;
@@ -224,6 +327,8 @@ struct _vcs_dpi_ip_params_st {
 	unsigned int can_vstartup_lines_exceed_vsync_plus_back_porch_lines_minus_one;
 	unsigned int bug_forcing_LC_req_same_size_fixed;
 	unsigned int number_of_cursors;
+	unsigned int max_num_dp2p0_outputs;
+	unsigned int max_num_dp2p0_streams;
 };
 
 struct _vcs_dpi_display_xfc_params_st {
@@ -250,6 +355,7 @@ struct _vcs_dpi_display_pipe_source_params_st {
 	bool hostvm_levels_force_en;
 	unsigned int hostvm_levels_force;
 	int source_scan;
+	int source_rotation; // new in dml32
 	int sw_mode;
 	int macro_tile_size;
 	unsigned int surface_width_y;
@@ -264,6 +370,15 @@ struct _vcs_dpi_display_pipe_source_params_st {
 	unsigned int viewport_height_c;
 	unsigned int viewport_width_max;
 	unsigned int viewport_height_max;
+	unsigned int viewport_x_y;
+	unsigned int viewport_x_c;
+	bool viewport_stationary;
+	unsigned int dcc_rate_luma;
+	unsigned int gpuvm_min_page_size_kbytes;
+	unsigned int use_mall_for_pstate_change;
+	unsigned int use_mall_for_static_screen;
+	bool force_one_row_for_frame;
+	bool pte_buffer_mode;
 	unsigned int data_pitch;
 	unsigned int data_pitch_c;
 	unsigned int meta_pitch;
@@ -296,10 +411,17 @@ struct writeback_st {
 	int wb_vtaps_luma;
 	int wb_htaps_chroma;
 	int wb_vtaps_chroma;
+	unsigned int wb_htaps;
+	unsigned int wb_vtaps;
 	double wb_hratio;
 	double wb_vratio;
 };
 
+struct display_audio_params_st {
+	unsigned int   audio_sample_rate_khz;
+	int    		   audio_sample_layout;
+};
+
 struct _vcs_dpi_display_output_params_st {
 	int dp_lanes;
 	double output_bpp;
@@ -313,6 +435,11 @@ struct _vcs_dpi_display_output_params_st {
 	int dsc_slices;
 	int max_audio_sample_rate;
 	struct writeback_st wb;
+	struct display_audio_params_st audio;
+	unsigned int output_bpc;
+	int dp_rate;
+	unsigned int dp_multistream_id;
+	bool dp_multistream_en;
 };
 
 struct _vcs_dpi_scaler_ratio_depth_st {
@@ -361,6 +488,8 @@ struct _vcs_dpi_display_pipe_dest_params_st {
 	unsigned char use_maximum_vstartup;
 	unsigned int vtotal_max;
 	unsigned int vtotal_min;
+	unsigned int refresh_rate;
+	bool synchronize_timings;
 };
 
 struct _vcs_dpi_display_pipe_params_st {
@@ -558,6 +687,9 @@ struct _vcs_dpi_display_arb_params_st {
 	int max_req_outstanding;
 	int min_req_outstanding;
 	int sat_level_us;
+	int hvm_min_req_outstand_commit_threshold;
+	int hvm_max_qos_commit_threshold;
+	int compbuf_reserved_space_kbytes;
 };
 
 #endif /*__DISPLAY_MODE_STRUCTS_H__*/
diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
index c0740dbdcc2e..2676710a5f2b 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
@@ -110,6 +110,15 @@ dml_get_attr_func(return_bw, mode_lib->vba.ReturnBW);
 dml_get_attr_func(tcalc, mode_lib->vba.TCalc);
 dml_get_attr_func(fraction_of_urgent_bandwidth, mode_lib->vba.FractionOfUrgentBandwidth);
 dml_get_attr_func(fraction_of_urgent_bandwidth_imm_flip, mode_lib->vba.FractionOfUrgentBandwidthImmediateFlip);
+dml_get_attr_func(cstate_max_cap_mode, mode_lib->vba.DCHUBBUB_ARB_CSTATE_MAX_CAP_MODE);
+dml_get_attr_func(comp_buffer_size_kbytes, mode_lib->vba.CompressedBufferSizeInkByte);
+dml_get_attr_func(pixel_chunk_size_in_kbyte, mode_lib->vba.PixelChunkSizeInKByte);
+dml_get_attr_func(alpha_pixel_chunk_size_in_kbyte, mode_lib->vba.AlphaPixelChunkSizeInKByte);
+dml_get_attr_func(meta_chunk_size_in_kbyte, mode_lib->vba.MetaChunkSize);
+dml_get_attr_func(min_pixel_chunk_size_in_byte, mode_lib->vba.MinPixelChunkSizeBytes);
+dml_get_attr_func(min_meta_chunk_size_in_byte, mode_lib->vba.MinMetaChunkSizeBytes);
+dml_get_attr_func(fclk_watermark, mode_lib->vba.Watermark.FCLKChangeWatermark);
+dml_get_attr_func(usr_retraining_watermark, mode_lib->vba.Watermark.USRRetrainingWatermark);
 
 #define dml_get_pipe_attr_func(attr, var)  double get_##attr(struct display_mode_lib *mode_lib, const display_e2e_pipe_params_st *pipes, unsigned int num_pipes, unsigned int which_pipe) \
 {\
@@ -165,6 +174,27 @@ dml_get_pipe_attr_func(vupdate_width, mode_lib->vba.VUpdateWidthPix);
 dml_get_pipe_attr_func(vready_offset, mode_lib->vba.VReadyOffsetPix);
 dml_get_pipe_attr_func(vready_at_or_after_vsync, mode_lib->vba.VREADY_AT_OR_AFTER_VSYNC);
 dml_get_pipe_attr_func(min_dst_y_next_start, mode_lib->vba.MIN_DST_Y_NEXT_START);
+dml_get_pipe_attr_func(dst_y_per_pte_row_nom_l, mode_lib->vba.DST_Y_PER_PTE_ROW_NOM_L);
+dml_get_pipe_attr_func(dst_y_per_pte_row_nom_c, mode_lib->vba.DST_Y_PER_PTE_ROW_NOM_C);
+dml_get_pipe_attr_func(dst_y_per_meta_row_nom_l, mode_lib->vba.DST_Y_PER_META_ROW_NOM_L);
+dml_get_pipe_attr_func(dst_y_per_meta_row_nom_c, mode_lib->vba.DST_Y_PER_META_ROW_NOM_C);
+dml_get_pipe_attr_func(refcyc_per_pte_group_nom_l_in_us, mode_lib->vba.time_per_pte_group_nom_luma);
+dml_get_pipe_attr_func(refcyc_per_pte_group_nom_c_in_us, mode_lib->vba.time_per_pte_group_nom_chroma);
+dml_get_pipe_attr_func(refcyc_per_pte_group_vblank_l_in_us, mode_lib->vba.time_per_pte_group_vblank_luma);
+dml_get_pipe_attr_func(refcyc_per_pte_group_vblank_c_in_us, mode_lib->vba.time_per_pte_group_vblank_chroma);
+dml_get_pipe_attr_func(refcyc_per_pte_group_flip_l_in_us, mode_lib->vba.time_per_pte_group_flip_luma);
+dml_get_pipe_attr_func(refcyc_per_pte_group_flip_c_in_us, mode_lib->vba.time_per_pte_group_flip_chroma);
+dml_get_pipe_attr_func(vstartup_calculated, mode_lib->vba.VStartup);
+dml_get_pipe_attr_func(dpte_row_height_linear_c, mode_lib->vba.dpte_row_height_linear_chroma);
+dml_get_pipe_attr_func(swath_height_l, mode_lib->vba.SwathHeightY);
+dml_get_pipe_attr_func(swath_height_c, mode_lib->vba.SwathHeightC);
+dml_get_pipe_attr_func(det_stored_buffer_size_l_bytes, mode_lib->vba.DETBufferSizeY);
+dml_get_pipe_attr_func(det_stored_buffer_size_c_bytes, mode_lib->vba.DETBufferSizeC);
+dml_get_pipe_attr_func(dpte_group_size_in_bytes, mode_lib->vba.dpte_group_bytes);
+dml_get_pipe_attr_func(vm_group_size_in_bytes, mode_lib->vba.vm_group_bytes);
+dml_get_pipe_attr_func(dpte_row_height_linear_l, mode_lib->vba.dpte_row_height_linear);
+dml_get_pipe_attr_func(pte_buffer_mode, mode_lib->vba.PTE_BUFFER_MODE);
+dml_get_pipe_attr_func(subviewport_lines_needed_in_mall, mode_lib->vba.SubViewportLinesNeededInMALL);
 
 double get_total_immediate_flip_bytes(
 		struct display_mode_lib *mode_lib,
@@ -202,6 +232,67 @@ double get_total_prefetch_bw(
 	return total_prefetch_bw;
 }
 
+unsigned int get_total_surface_size_in_mall_bytes(
+		struct display_mode_lib *mode_lib,
+		const display_e2e_pipe_params_st *pipes,
+		unsigned int num_pipes)
+{
+	unsigned int k;
+	unsigned int size = 0.0;
+	recalculate_params(mode_lib, pipes, num_pipes);
+	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k)
+		size += mode_lib->vba.SurfaceSizeInMALL[k];
+	return size;
+}
+
+unsigned int get_pipe_idx(struct display_mode_lib *mode_lib, unsigned int plane_idx)
+{
+	int pipe_idx = -1;
+	int i;
+
+	ASSERT(plane_idx < DC__NUM_DPP__MAX);
+
+	for (i = 0; i < DC__NUM_DPP__MAX ; i++) {
+		if (plane_idx == mode_lib->vba.pipe_plane[i]) {
+			pipe_idx = i;
+			break;
+		}
+	}
+	ASSERT(pipe_idx >= 0);
+
+	return pipe_idx;
+}
+
+
+double get_det_buffer_size_kbytes(struct display_mode_lib *mode_lib, const display_e2e_pipe_params_st *pipes,
+		unsigned int num_pipes, unsigned int pipe_idx)
+{
+	unsigned int plane_idx;
+	double det_buf_size_kbytes;
+
+	recalculate_params(mode_lib, pipes, num_pipes);
+	plane_idx = mode_lib->vba.pipe_plane[pipe_idx];
+
+	dml_print("DML::%s: num_pipes=%d pipe_idx=%d plane_idx=%0d\n", __func__, num_pipes, pipe_idx, plane_idx);
+	det_buf_size_kbytes = mode_lib->vba.DETBufferSizeInKByte[plane_idx]; // per hubp DET buffer size
+
+	dml_print("DML::%s: det_buf_size_kbytes=%3.2f\n", __func__, det_buf_size_kbytes);
+
+	return det_buf_size_kbytes;
+}
+
+bool get_is_phantom_pipe(struct display_mode_lib *mode_lib, const display_e2e_pipe_params_st *pipes,
+		unsigned int num_pipes, unsigned int pipe_idx)
+{
+	unsigned int plane_idx;
+
+	recalculate_params(mode_lib, pipes, num_pipes);
+	plane_idx = mode_lib->vba.pipe_plane[pipe_idx];
+	dml_print("DML::%s: num_pipes=%d pipe_idx=%d UseMALLForPStateChange=%0d\n", __func__, num_pipes, pipe_idx,
+			mode_lib->vba.UsesMALLForPStateChange[plane_idx]);
+	return (mode_lib->vba.UsesMALLForPStateChange[plane_idx] == dm_use_mall_pstate_change_phantom_pipe);
+}
+
 static void fetch_socbb_params(struct display_mode_lib *mode_lib)
 {
 	soc_bounding_box_st *soc = &mode_lib->vba.soc;
@@ -241,6 +332,22 @@ static void fetch_socbb_params(struct display_mode_lib *mode_lib)
 			soc->max_avg_sdp_bw_use_normal_percent;
 	mode_lib->vba.SRExitZ8Time = soc->sr_exit_z8_time_us;
 	mode_lib->vba.SREnterPlusExitZ8Time = soc->sr_enter_plus_exit_z8_time_us;
+	mode_lib->vba.FCLKChangeLatency = soc->fclk_change_latency_us;
+	mode_lib->vba.USRRetrainingLatency = soc->usr_retraining_latency_us;
+	mode_lib->vba.SMNLatency = soc->smn_latency_us;
+	mode_lib->vba.MALLAllocatedForDCNFinal = soc->mall_allocated_for_dcn_mbytes;
+
+	mode_lib->vba.PercentOfIdealDRAMBWReceivedAfterUrgLatencySTROBE = soc->pct_ideal_dram_bw_after_urgent_strobe;
+	mode_lib->vba.MaxAveragePercentOfIdealFabricBWDisplayCanUseInNormalSystemOperation =
+			soc->max_avg_fabric_bw_use_normal_percent;
+	mode_lib->vba.MaxAveragePercentOfIdealDRAMBWDisplayCanUseInNormalSystemOperationSTROBE =
+			soc->max_avg_dram_bw_use_normal_strobe_percent;
+
+	mode_lib->vba.DRAMClockChangeRequirementFinal = 1;
+	mode_lib->vba.FCLKChangeRequirementFinal = 1;
+	mode_lib->vba.USRRetrainingRequiredFinal = 1;
+	mode_lib->vba.ConfigurableDETSizeEnFinal = 0;
+	mode_lib->vba.AllowForPStateChangeOrStutterInVBlankFinal = soc->allow_for_pstate_or_stutter_in_vblank_final;
 	mode_lib->vba.DRAMClockChangeLatency = soc->dram_clock_change_latency_us;
 	mode_lib->vba.DummyPStateCheck = soc->dram_clock_change_latency_us == soc->dummy_pstate_latency_us;
 	mode_lib->vba.DRAMClockChangeSupportsVActive = !soc->disable_dram_clock_change_vactive_support ||
@@ -283,6 +390,7 @@ static void fetch_socbb_params(struct display_mode_lib *mode_lib)
 		mode_lib->vba.SOCCLKPerState[i] = soc->clock_limits[i].socclk_mhz;
 		mode_lib->vba.PHYCLKPerState[i] = soc->clock_limits[i].phyclk_mhz;
 		mode_lib->vba.PHYCLKD18PerState[i] = soc->clock_limits[i].phyclk_d18_mhz;
+		mode_lib->vba.PHYCLKD32PerState[i] = soc->clock_limits[i].phyclk_d32_mhz;
 		mode_lib->vba.MaxDppclk[i] = soc->clock_limits[i].dppclk_mhz;
 		mode_lib->vba.MaxDSCCLK[i] = soc->clock_limits[i].dscclk_mhz;
 		mode_lib->vba.DRAMSpeedPerState[i] = soc->clock_limits[i].dram_speed_mts;
@@ -325,6 +433,18 @@ static void fetch_ip_params(struct display_mode_lib *mode_lib)
 	mode_lib->vba.COMPBUF_RESERVED_SPACE_ZS = ip->compbuf_reserved_space_zs;
 	mode_lib->vba.MaximumDSCBitsPerComponent = ip->maximum_dsc_bits_per_component;
 	mode_lib->vba.DSC422NativeSupport = ip->dsc422_native_support;
+    /* In DCN3.2, nomDETInKByte should be initialized correctly. */
+	mode_lib->vba.nomDETInKByte = ip->det_buffer_size_kbytes;
+	mode_lib->vba.CompbufReservedSpace64B  = ip->compbuf_reserved_space_64b;
+	mode_lib->vba.CompbufReservedSpaceZs = ip->compbuf_reserved_space_zs;
+	mode_lib->vba.CompressedBufferSegmentSizeInkByteFinal = ip->compressed_buffer_segment_size_in_kbytes;
+	mode_lib->vba.LineBufferSizeFinal = ip->line_buffer_size_bits;
+	mode_lib->vba.AlphaPixelChunkSizeInKByte = ip->alpha_pixel_chunk_size_kbytes; // not ysed
+	mode_lib->vba.MinPixelChunkSizeBytes = ip->min_pixel_chunk_size_bytes; // not used
+	mode_lib->vba.MaximumPixelsPerLinePerDSCUnit = ip->maximum_pixels_per_line_per_dsc_unit;
+	mode_lib->vba.MaxNumDP2p0Outputs = ip->max_num_dp2p0_outputs;
+	mode_lib->vba.MaxNumDP2p0Streams = ip->max_num_dp2p0_streams;
+	mode_lib->vba.DCCMetaBufferSizeBytes = ip->dcc_meta_buffer_size_bytes;
 
 	mode_lib->vba.PixelChunkSizeInKByte = ip->pixel_chunk_size_kbytes;
 	mode_lib->vba.MetaChunkSize = ip->meta_chunk_size_kbytes;
@@ -399,6 +519,7 @@ static void fetch_pipe_params(struct display_mode_lib *mode_lib)
 		visited[k] = false;
 
 	mode_lib->vba.NumberOfActivePlanes = 0;
+	mode_lib->vba.NumberOfActiveSurfaces = 0;
 	mode_lib->vba.ImmediateFlipSupport = false;
 	for (j = 0; j < mode_lib->vba.cache_num_pipes; ++j) {
 		display_pipe_source_params_st *src = &pipes[j].pipe.src;
@@ -429,6 +550,21 @@ static void fetch_pipe_params(struct display_mode_lib *mode_lib)
 				src->viewport_y_y;
 		mode_lib->vba.ViewportYStartC[mode_lib->vba.NumberOfActivePlanes] =
 				src->viewport_y_c;
+		mode_lib->vba.SourceRotation[mode_lib->vba.NumberOfActiveSurfaces] = src->source_rotation;
+		mode_lib->vba.ViewportXStartY[mode_lib->vba.NumberOfActiveSurfaces] = src->viewport_x_y;
+		mode_lib->vba.ViewportXStartC[mode_lib->vba.NumberOfActiveSurfaces] = src->viewport_x_c;
+		// TODO: Assign correct value to viewport_stationary
+		mode_lib->vba.ViewportStationary[mode_lib->vba.NumberOfActivePlanes] =
+				src->viewport_stationary;
+		mode_lib->vba.UsesMALLForPStateChange[mode_lib->vba.NumberOfActivePlanes] = src->use_mall_for_pstate_change;
+		mode_lib->vba.UseMALLForStaticScreen[mode_lib->vba.NumberOfActivePlanes] = src->use_mall_for_static_screen;
+		mode_lib->vba.GPUVMMinPageSizeKBytes[mode_lib->vba.NumberOfActivePlanes] = src->gpuvm_min_page_size_kbytes;
+		mode_lib->vba.RefreshRate[mode_lib->vba.NumberOfActivePlanes] = dst->refresh_rate; //todo remove this
+		mode_lib->vba.OutputLinkDPRate[mode_lib->vba.NumberOfActivePlanes] = dout->dp_rate;
+		mode_lib->vba.ODMUse[mode_lib->vba.NumberOfActivePlanes] = dst->odm_combine;
+		//TODO: Need to assign correct values to dp_multistream vars
+		mode_lib->vba.OutputMultistreamEn[mode_lib->vba.NumberOfActiveSurfaces] = dout->dp_multistream_en;
+		mode_lib->vba.OutputMultistreamId[mode_lib->vba.NumberOfActiveSurfaces] = dout->dp_multistream_id;
 		mode_lib->vba.PitchY[mode_lib->vba.NumberOfActivePlanes] = src->data_pitch;
 		mode_lib->vba.SurfaceWidthY[mode_lib->vba.NumberOfActivePlanes] = src->surface_width_y;
 		mode_lib->vba.SurfaceHeightY[mode_lib->vba.NumberOfActivePlanes] = src->surface_height_y;
@@ -677,6 +813,7 @@ static void fetch_pipe_params(struct display_mode_lib *mode_lib)
 		}
 
 		mode_lib->vba.NumberOfActivePlanes++;
+		mode_lib->vba.NumberOfActiveSurfaces++;
 	}
 
 	// handle overlays through BlendingAndTiming
@@ -702,6 +839,8 @@ static void fetch_pipe_params(struct display_mode_lib *mode_lib)
 		}
 	}
 
+	mode_lib->vba.SynchronizeTimingsFinal = pipes[0].pipe.dest.synchronize_timings;
+	mode_lib->vba.DCCProgrammingAssumesScanDirectionUnknownFinal = false;
 	mode_lib->vba.UseUnboundedRequesting = dm_unbounded_requesting;
 	for (k = 0; k < mode_lib->vba.cache_num_pipes; ++k) {
 		if (pipes[k].pipe.src.unbounded_req_mode == 0)
@@ -745,6 +884,32 @@ static void fetch_pipe_params(struct display_mode_lib *mode_lib)
 
 	mode_lib->vba.GPUVMEnable = mode_lib->vba.GPUVMEnable && !!ip->gpuvm_enable;
 	mode_lib->vba.HostVMEnable = mode_lib->vba.HostVMEnable && !!ip->hostvm_enable;
+
+	for (k = 0; k < mode_lib->vba.cache_num_pipes; ++k) {
+		mode_lib->vba.ForceOneRowForFrame[k] = pipes[k].pipe.src.force_one_row_for_frame;
+		mode_lib->vba.PteBufferMode[k] = pipes[k].pipe.src.pte_buffer_mode;
+
+		if (mode_lib->vba.PteBufferMode[k] == 0 && mode_lib->vba.GPUVMEnable) {
+			if (mode_lib->vba.ForceOneRowForFrame[k] ||
+				(mode_lib->vba.GPUVMMinPageSizeKBytes[k] > 64*1024) ||
+				(mode_lib->vba.UsesMALLForPStateChange[k] != dm_use_mall_pstate_change_disable) ||
+				(mode_lib->vba.UseMALLForStaticScreen[k] != dm_use_mall_static_screen_disable)) {
+#ifdef __DML_VBA_DEBUG__
+				dml_print("DML::%s: ERROR: Invalid PteBufferMode=%d for plane %0d!\n",
+						__func__, mode_lib->vba.PteBufferMode[k], k);
+				dml_print("DML::%s:  -  ForceOneRowForFrame     = %d\n",
+						__func__, mode_lib->vba.ForceOneRowForFrame[k]);
+				dml_print("DML::%s:  -  GPUVMMinPageSizeKBytes  = %d\n",
+						__func__, mode_lib->vba.GPUVMMinPageSizeKBytes[k]);
+				dml_print("DML::%s:  -  UseMALLForPStateChange  = %d\n",
+						__func__, (int) mode_lib->vba.UsesMALLForPStateChange[k]);
+				dml_print("DML::%s:  -  UseMALLForStaticScreen  = %d\n",
+						__func__, (int) mode_lib->vba.UseMALLForStaticScreen[k]);
+#endif
+				ASSERT(0);
+			}
+		}
+	}
 }
 
 /**
@@ -896,6 +1061,7 @@ void ModeSupportAndSystemConfiguration(struct display_mode_lib *mode_lib)
 	soc_bounding_box_st *soc = &mode_lib->vba.soc;
 	unsigned int k;
 	unsigned int total_pipes = 0;
+	unsigned int pipe_idx = 0;
 
 	mode_lib->vba.VoltageLevel = mode_lib->vba.cache_pipes[0].clks_cfg.voltage;
 	mode_lib->vba.ReturnBW = mode_lib->vba.ReturnBWPerState[mode_lib->vba.VoltageLevel][mode_lib->vba.maxMpcComb];
@@ -917,6 +1083,11 @@ void ModeSupportAndSystemConfiguration(struct display_mode_lib *mode_lib)
 	// Total Available Pipes Support Check
 	for (k = 0; k < mode_lib->vba.NumberOfActivePlanes; ++k) {
 		total_pipes += mode_lib->vba.DPPPerPlane[k];
+		pipe_idx = get_pipe_idx(mode_lib, k);
+		if (mode_lib->vba.cache_pipes[pipe_idx].clks_cfg.dppclk_mhz > 0.0)
+			mode_lib->vba.DPPCLK[k] = mode_lib->vba.cache_pipes[pipe_idx].clks_cfg.dppclk_mhz;
+		else
+			mode_lib->vba.DPPCLK[k] = soc->clock_limits[mode_lib->vba.VoltageLevel].dppclk_mhz;
 	}
 	ASSERT(total_pipes <= DC__NUM_DPP__MAX);
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
index 0603b32971a6..ddf8b19c490e 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
@@ -58,6 +58,15 @@ dml_get_attr_decl(return_bw);
 dml_get_attr_decl(tcalc);
 dml_get_attr_decl(fraction_of_urgent_bandwidth);
 dml_get_attr_decl(fraction_of_urgent_bandwidth_imm_flip);
+dml_get_attr_decl(cstate_max_cap_mode);
+dml_get_attr_decl(comp_buffer_size_kbytes);
+dml_get_attr_decl(pixel_chunk_size_in_kbyte);
+dml_get_attr_decl(alpha_pixel_chunk_size_in_kbyte);
+dml_get_attr_decl(meta_chunk_size_in_kbyte);
+dml_get_attr_decl(min_pixel_chunk_size_in_byte);
+dml_get_attr_decl(min_meta_chunk_size_in_byte);
+dml_get_attr_decl(fclk_watermark);
+dml_get_attr_decl(usr_retraining_watermark);
 
 #define dml_get_pipe_attr_decl(attr) double get_##attr(struct display_mode_lib *mode_lib, const display_e2e_pipe_params_st *pipes, unsigned int num_pipes, unsigned int which_pipe)
 
@@ -75,6 +84,26 @@ dml_get_pipe_attr_decl(dst_y_per_row_vblank);
 dml_get_pipe_attr_decl(dst_y_prefetch);
 dml_get_pipe_attr_decl(dst_y_per_vm_flip);
 dml_get_pipe_attr_decl(dst_y_per_row_flip);
+dml_get_pipe_attr_decl(dst_y_per_pte_row_nom_l);
+dml_get_pipe_attr_decl(dst_y_per_pte_row_nom_c);
+dml_get_pipe_attr_decl(dst_y_per_meta_row_nom_l);
+dml_get_pipe_attr_decl(dst_y_per_meta_row_nom_c);
+dml_get_pipe_attr_decl(dpte_row_height_linear_c);
+dml_get_pipe_attr_decl(swath_height_l);
+dml_get_pipe_attr_decl(swath_height_c);
+dml_get_pipe_attr_decl(det_stored_buffer_size_l_bytes);
+dml_get_pipe_attr_decl(det_stored_buffer_size_c_bytes);
+dml_get_pipe_attr_decl(dpte_group_size_in_bytes);
+dml_get_pipe_attr_decl(vm_group_size_in_bytes);
+dml_get_pipe_attr_decl(det_buffer_size_kbytes);
+dml_get_pipe_attr_decl(dpte_row_height_linear_l);
+dml_get_pipe_attr_decl(refcyc_per_pte_group_nom_l_in_us);
+dml_get_pipe_attr_decl(refcyc_per_pte_group_nom_c_in_us);
+dml_get_pipe_attr_decl(refcyc_per_pte_group_vblank_l_in_us);
+dml_get_pipe_attr_decl(refcyc_per_pte_group_vblank_c_in_us);
+dml_get_pipe_attr_decl(refcyc_per_pte_group_flip_l_in_us);
+dml_get_pipe_attr_decl(refcyc_per_pte_group_flip_c_in_us);
+dml_get_pipe_attr_decl(pte_buffer_mode);
 dml_get_pipe_attr_decl(refcyc_per_vm_group_vblank);
 dml_get_pipe_attr_decl(refcyc_per_vm_group_flip);
 dml_get_pipe_attr_decl(refcyc_per_vm_req_vblank);
@@ -108,6 +137,8 @@ dml_get_pipe_attr_decl(vupdate_width);
 dml_get_pipe_attr_decl(vready_offset);
 dml_get_pipe_attr_decl(vready_at_or_after_vsync);
 dml_get_pipe_attr_decl(min_dst_y_next_start);
+dml_get_pipe_attr_decl(vstartup_calculated);
+dml_get_pipe_attr_decl(subviewport_lines_needed_in_mall);
 
 double get_total_immediate_flip_bytes(
 		struct display_mode_lib *mode_lib,
@@ -126,6 +157,16 @@ unsigned int dml_get_voltage_level(
 		const display_e2e_pipe_params_st *pipes,
 		unsigned int num_pipes);
 
+unsigned int get_total_surface_size_in_mall_bytes(
+		struct display_mode_lib *mode_lib,
+		const display_e2e_pipe_params_st *pipes,
+		unsigned int num_pipes);
+unsigned int get_pipe_idx(struct display_mode_lib *mode_lib, unsigned int plane_idx);
+
+bool get_is_phantom_pipe(struct display_mode_lib *mode_lib,
+		const display_e2e_pipe_params_st *pipes,
+		unsigned int num_pipes,
+		unsigned int pipe_idx);
 void PixelClockAdjustmentForProgressiveToInterlaceUnit(struct display_mode_lib *mode_lib);
 
 bool Calculate256BBlockSizes(
@@ -138,6 +179,39 @@ bool Calculate256BBlockSizes(
 		unsigned int *BlockWidth256BytesY,
 		unsigned int *BlockWidth256BytesC);
 
+struct DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation {
+	unsigned int dummy_integer_array[2][DC__NUM_DPP__MAX];
+	double dummy_single_array[2][DC__NUM_DPP__MAX];
+	unsigned int dummy_long_array[2][DC__NUM_DPP__MAX];
+	double dummy_double_array[2][DC__NUM_DPP__MAX];
+	bool dummy_boolean_array[DC__NUM_DPP__MAX];
+	bool dummy_boolean;
+	bool dummy_boolean2;
+	enum output_encoder_class dummy_output_encoder_array[DC__NUM_DPP__MAX];
+	DmlPipe SurfaceParameters[DC__NUM_DPP__MAX];
+	bool dummy_boolean_array2[2][DC__NUM_DPP__MAX];
+	unsigned int ReorderBytes;
+	unsigned int VMDataOnlyReturnBW;
+	double HostVMInefficiencyFactor;
+};
+
+struct dml32_ModeSupportAndSystemConfigurationFull {
+	unsigned int dummy_integer_array[8][DC__NUM_DPP__MAX];
+	double dummy_double_array[2][DC__NUM_DPP__MAX];
+	DmlPipe SurfParameters[DC__NUM_DPP__MAX];
+	double dummy_single[5];
+	double dummy_single2[5];
+	SOCParametersList mSOCParameters;
+	unsigned int MaximumSwathWidthSupportLuma;
+	unsigned int MaximumSwathWidthSupportChroma;
+};
+
+struct dummy_vars {
+	struct DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
+	DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation;
+	struct dml32_ModeSupportAndSystemConfigurationFull dml32_ModeSupportAndSystemConfigurationFull;
+};
+
 struct vba_vars_st {
 	ip_params_st ip;
 	soc_bounding_box_st soc;
@@ -154,6 +228,7 @@ struct vba_vars_st {
 	double DISPCLKWithRampingRoundedToDFSGranularity;
 	double DISPCLKWithoutRampingRoundedToDFSGranularity;
 	double MaxDispclkRoundedToDFSGranularity;
+	double MaxDppclkRoundedToDFSGranularity;
 	bool DCCEnabledAnyPlane;
 	double ReturnBandwidthToDCN;
 	unsigned int TotalActiveDPP;
@@ -169,6 +244,8 @@ struct vba_vars_st {
 	double NextMaxVStartup;
 	double VBlankTime;
 	double SmallestVBlank;
+	enum dm_prefetch_modes AllowForPStateChangeOrStutterInVBlankFinal; // Mode Support only
+	double DCFCLKDeepSleepPerSurface[DC__NUM_DPP__MAX];
 	double DCFCLKDeepSleepPerPlane[DC__NUM_DPP__MAX];
 	double EffectiveDETPlusLBLinesLuma;
 	double EffectiveDETPlusLBLinesChroma;
@@ -212,6 +289,14 @@ struct vba_vars_st {
 	double UrgentLatencyPixelMixedWithVMData;
 	double UrgentLatencyVMDataOnly;
 	double UrgentLatency; // max of the above three
+	double USRRetrainingLatency;
+	double SMNLatency;
+	double FCLKChangeLatency;
+	unsigned int MALLAllocatedForDCNFinal;
+	double DefaultGPUVMMinPageSizeKBytes; // Default for the project
+	double MaxAveragePercentOfIdealFabricBWDisplayCanUseInNormalSystemOperation;
+	double MaxAveragePercentOfIdealDRAMBWDisplayCanUseInNormalSystemOperationSTROBE;
+	double PercentOfIdealDRAMBWReceivedAfterUrgLatencySTROBE;
 	double WritebackLatency;
 	double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelDataOnly; // Mode Support
 	double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData; // Mode Support
@@ -284,6 +369,14 @@ struct vba_vars_st {
 	double DPPCLKDelayCNVCCursor;
 	double DISPCLKDelaySubtotal;
 	bool ProgressiveToInterlaceUnitInOPP;
+	unsigned int CompressedBufferSegmentSizeInkByteFinal;
+	unsigned int CompbufReservedSpace64B;
+	unsigned int CompbufReservedSpaceZs;
+	unsigned int LineBufferSizeFinal;
+	unsigned int MaximumPixelsPerLinePerDSCUnit;
+	unsigned int AlphaPixelChunkSizeInKByte;
+	double MinPixelChunkSizeBytes;
+	unsigned int DCCMetaBufferSizeBytes;
 	// Pipe/Plane Parameters
 	int VoltageLevel;
 	double FabricClock;
@@ -291,6 +384,23 @@ struct vba_vars_st {
 	double DISPCLK;
 	double SOCCLK;
 	double DCFCLK;
+	unsigned int MaxTotalDETInKByte;
+	unsigned int MinCompressedBufferSizeInKByte;
+	unsigned int NumberOfActiveSurfaces;
+	bool ViewportStationary[DC__NUM_DPP__MAX];
+	unsigned int RefreshRate[DC__NUM_DPP__MAX];
+	double       OutputBPP[DC__NUM_DPP__MAX];
+	unsigned int GPUVMMinPageSizeKBytes[DC__NUM_DPP__MAX];
+	bool SynchronizeTimingsFinal;
+	bool SynchronizeDRRDisplaysForUCLKPStateChangeFinal;
+	bool ForceOneRowForFrame[DC__NUM_DPP__MAX];
+	unsigned int ViewportXStartY[DC__NUM_DPP__MAX];
+	unsigned int ViewportXStartC[DC__NUM_DPP__MAX];
+	enum dm_rotation_angle SourceRotation[DC__NUM_DPP__MAX];
+	bool DRRDisplay[DC__NUM_DPP__MAX];
+	bool PteBufferMode[DC__NUM_DPP__MAX];
+	enum dm_output_type OutputType[DC__NUM_DPP__MAX];
+	enum dm_output_rate OutputRate[DC__NUM_DPP__MAX];
 
 	unsigned int NumberOfActivePlanes;
 	unsigned int NumberOfDSCSlices[DC__NUM_DPP__MAX];
@@ -392,6 +502,12 @@ struct vba_vars_st {
 	double StutterEfficiencyNotIncludingVBlank;
 	double NonUrgentLatencyTolerance;
 	double MinActiveDRAMClockChangeLatencySupported;
+	double Z8StutterEfficiencyBestCase;
+	unsigned int Z8NumberOfStutterBurstsPerFrameBestCase;
+	double Z8StutterEfficiencyNotIncludingVBlankBestCase;
+	double StutterPeriodBestCase;
+	Watermarks      Watermark;
+	bool DCHUBBUB_ARB_CSTATE_MAX_CAP_MODE;
 
 	// These are the clocks calcuated by the library but they are not actually
 	// used explicitly. They are fetched by tests and then possibly used. The
@@ -399,6 +515,10 @@ struct vba_vars_st {
 	double DISPCLK_calculated;
 	double DPPCLK_calculated[DC__NUM_DPP__MAX];
 
+	bool ImmediateFlipSupportedSurface[DC__NUM_DPP__MAX];
+
+	bool Use_One_Row_For_Frame[DC__NUM_DPP__MAX];
+	bool Use_One_Row_For_Frame_Flip[DC__NUM_DPP__MAX];
 	unsigned int VUpdateOffsetPix[DC__NUM_DPP__MAX];
 	double VUpdateWidthPix[DC__NUM_DPP__MAX];
 	double VReadyOffsetPix[DC__NUM_DPP__MAX];
@@ -429,6 +549,7 @@ struct vba_vars_st {
 	double DRAMSpeedPerState[DC__VOLTAGE_STATES];
 	double MaxDispclk[DC__VOLTAGE_STATES];
 	int VoltageOverrideLevel;
+	double PHYCLKD32PerState[DC__VOLTAGE_STATES];
 
 	/*outputs*/
 	bool ScaleRatioAndTapsSupport;
@@ -452,6 +573,51 @@ struct vba_vars_st {
 	bool PitchSupport;
 	enum dm_validation_status ValidationStatus[DC__VOLTAGE_STATES];
 
+	/* Mode Support Reason */
+	bool P2IWith420;
+	bool DSCOnlyIfNecessaryWithBPP;
+	bool DSC422NativeNotSupported;
+	bool LinkRateDoesNotMatchDPVersion;
+	bool LinkRateForMultistreamNotIndicated;
+	bool BPPForMultistreamNotIndicated;
+	bool MultistreamWithHDMIOreDP;
+	bool MSOOrODMSplitWithNonDPLink;
+	bool NotEnoughLanesForMSO;
+	bool ViewportExceedsSurface;
+
+	bool ImmediateFlipRequiredButTheRequirementForEachSurfaceIsNotSpecified;
+	bool ImmediateFlipOrHostVMAndPStateWithMALLFullFrameOrPhantomPipe;
+	bool InvalidCombinationOfMALLUseForPStateAndStaticScreen;
+	bool InvalidCombinationOfMALLUseForPState;
+
+	enum dm_output_link_dp_rate OutputLinkDPRate[DC__NUM_DPP__MAX];
+	double PrefetchLinesYThisState[DC__NUM_DPP__MAX];
+	double PrefetchLinesCThisState[DC__NUM_DPP__MAX];
+	double meta_row_bandwidth_this_state[DC__NUM_DPP__MAX];
+	double dpte_row_bandwidth_this_state[DC__NUM_DPP__MAX];
+	double DPTEBytesPerRowThisState[DC__NUM_DPP__MAX];
+	double PDEAndMetaPTEBytesPerFrameThisState[DC__NUM_DPP__MAX];
+	double MetaRowBytesThisState[DC__NUM_DPP__MAX];
+	bool use_one_row_for_frame[DC__VOLTAGE_STATES][2][DC__NUM_DPP__MAX];
+	bool use_one_row_for_frame_flip[DC__VOLTAGE_STATES][2][DC__NUM_DPP__MAX];
+	bool use_one_row_for_frame_this_state[DC__NUM_DPP__MAX];
+	bool use_one_row_for_frame_flip_this_state[DC__NUM_DPP__MAX];
+
+	unsigned int OutputTypeAndRatePerState[DC__VOLTAGE_STATES][DC__NUM_DPP__MAX];
+	double RequiredDISPCLKPerSurface[DC__VOLTAGE_STATES][2][DC__NUM_DPP__MAX];
+	unsigned int MicroTileHeightY[DC__NUM_DPP__MAX];
+	unsigned int MicroTileHeightC[DC__NUM_DPP__MAX];
+	unsigned int MicroTileWidthY[DC__NUM_DPP__MAX];
+	unsigned int MicroTileWidthC[DC__NUM_DPP__MAX];
+	bool ImmediateFlipRequiredFinal;
+	bool DCCProgrammingAssumesScanDirectionUnknownFinal;
+	bool EnoughWritebackUnits;
+	bool ODMCombine2To1SupportCheckOK[DC__VOLTAGE_STATES];
+	bool NumberOfDP2p0Support;
+	unsigned int MaxNumDP2p0Streams;
+	unsigned int MaxNumDP2p0Outputs;
+	enum dm_output_type OutputTypePerState[DC__VOLTAGE_STATES][DC__NUM_DPP__MAX];
+	enum dm_output_rate OutputRatePerState[DC__VOLTAGE_STATES][DC__NUM_DPP__MAX];
 	double WritebackLineBufferLumaBufferSize;
 	double WritebackLineBufferChromaBufferSize;
 	double WritebackMinHSCLRatio;
@@ -647,6 +813,7 @@ struct vba_vars_st {
 	double         dummy7[DC__NUM_DPP__MAX];
 	double         dummy8[DC__NUM_DPP__MAX];
 	double         dummy13[DC__NUM_DPP__MAX];
+	double         dummy_double_array[2][DC__NUM_DPP__MAX];
 	unsigned int        dummyinteger1ms[DC__NUM_DPP__MAX];
 	double        dummyinteger2ms[DC__NUM_DPP__MAX];
 	unsigned int        dummyinteger3[DC__NUM_DPP__MAX];
@@ -666,6 +833,9 @@ struct vba_vars_st {
 	unsigned int        dummyintegerarr2[DC__NUM_DPP__MAX];
 	unsigned int        dummyintegerarr3[DC__NUM_DPP__MAX];
 	unsigned int        dummyintegerarr4[DC__NUM_DPP__MAX];
+	unsigned int        dummy_integer_array[8][DC__NUM_DPP__MAX];
+	unsigned int        dummy_integer_array22[22][DC__NUM_DPP__MAX];
+
 	bool           dummysinglestring;
 	bool           SingleDPPViewportSizeSupportPerPlane[DC__NUM_DPP__MAX];
 	double         PlaneRequiredDISPCLKWithODMCombine2To1;
@@ -896,8 +1066,8 @@ struct vba_vars_st {
 	double meta_row_bandwidth[DC__VOLTAGE_STATES][2][DC__NUM_DPP__MAX];
 	double DETBufferSizeYAllStates[DC__VOLTAGE_STATES][2][DC__NUM_DPP__MAX];
 	double DETBufferSizeCAllStates[DC__VOLTAGE_STATES][2][DC__NUM_DPP__MAX];
-	int swath_width_luma_ub_all_states[DC__VOLTAGE_STATES][2][DC__NUM_DPP__MAX];
-	int swath_width_chroma_ub_all_states[DC__VOLTAGE_STATES][2][DC__NUM_DPP__MAX];
+	unsigned int swath_width_luma_ub_all_states[DC__VOLTAGE_STATES][2][DC__NUM_DPP__MAX];
+	unsigned int swath_width_chroma_ub_all_states[DC__VOLTAGE_STATES][2][DC__NUM_DPP__MAX];
 	bool NotUrgentLatencyHiding[DC__VOLTAGE_STATES][2];
 	unsigned int SwathHeightYAllStates[DC__VOLTAGE_STATES][2][DC__NUM_DPP__MAX];
 	unsigned int SwathHeightCAllStates[DC__VOLTAGE_STATES][2][DC__NUM_DPP__MAX];
@@ -972,6 +1142,74 @@ struct vba_vars_st {
 	int Z8NumberOfStutterBurstsPerFrame;
 	unsigned int MaximumDSCBitsPerComponent;
 	unsigned int NotEnoughUrgentLatencyHidingA[DC__VOLTAGE_STATES][2];
+	double UrgentLatencyWithUSRRetraining;
+	double UrgLatencyWithUSRRetraining[DC__VOLTAGE_STATES];
+	double ReadBandwidthSurfaceLuma[DC__NUM_DPP__MAX];
+	double ReadBandwidthSurfaceChroma[DC__NUM_DPP__MAX];
+	double SurfaceRequiredDISPCLKWithoutODMCombine;
+	double SurfaceRequiredDISPCLK;
+	double SurfaceRequiredDISPCLKWithODMCombine2To1;
+	double SurfaceRequiredDISPCLKWithODMCombine4To1;
+	double MinActiveFCLKChangeLatencySupported;
+	double dummy14;
+	double dummy15;
+	int MinVoltageLevel;
+	int MaxVoltageLevel;
+	unsigned int TotalNumberOfSingleDPPSurfaces[DC__VOLTAGE_STATES][2];
+	unsigned int CompressedBufferSizeInkByteAllStates[DC__VOLTAGE_STATES][2];
+	unsigned int DETBufferSizeInKByteAllStates[DC__VOLTAGE_STATES][2][DC__NUM_DPP__MAX];
+	unsigned int DETBufferSizeInKByteThisState[DC__NUM_DPP__MAX];
+	unsigned int SurfaceSizeInMALL[DC__NUM_DPP__MAX];
+	bool ExceededMALLSize;
+	bool PTE_BUFFER_MODE[DC__NUM_DPP__MAX];
+	unsigned int BIGK_FRAGMENT_SIZE[DC__NUM_DPP__MAX];
+	unsigned int dummyinteger33;
+	unsigned int CompressedBufferSizeInkByteThisState;
+	enum dm_fclock_change_support FCLKChangeSupport[DC__VOLTAGE_STATES][2];
+	Latencies myLatency;
+	Latencies mLatency;
+	Watermarks DummyWatermark;
+	bool USRRetrainingSupport[DC__VOLTAGE_STATES][2];
+	bool dummyBooleanvector1[DC__NUM_DPP__MAX];
+	bool dummyBooleanvector2[DC__NUM_DPP__MAX];
+	enum dm_use_mall_for_pstate_change_mode UsesMALLForPStateChange[DC__NUM_DPP__MAX];
+	bool NotEnoughUrgentLatencyHiding_dml32[DC__VOLTAGE_STATES][2];
+	bool UnboundedRequestEnabledAllStates[DC__VOLTAGE_STATES][2];
+	bool SingleDPPViewportSizeSupportPerSurface[DC__NUM_DPP__MAX];
+	enum dm_use_mall_for_static_screen_mode UseMALLForStaticScreen[DC__NUM_DPP__MAX];
+	bool UnboundedRequestEnabledThisState;
+	bool DRAMClockChangeRequirementFinal;
+	bool FCLKChangeRequirementFinal;
+	bool USRRetrainingRequiredFinal;
+	bool MALLUseFinal;
+	bool ConfigurableDETSizeEnFinal;
+	bool dummyboolean;
+	unsigned int DETSizeOverride[DC__NUM_DPP__MAX];
+	unsigned int nomDETInKByte;
+	enum mpc_combine_affinity  MPCCombineUse[DC__NUM_DPP__MAX];
+	bool MPCCombineMethodIncompatible;
+	unsigned int RequiredSlots[DC__VOLTAGE_STATES][DC__NUM_DPP__MAX];
+	bool ExceededMultistreamSlots[DC__VOLTAGE_STATES];
+	enum odm_combine_policy ODMUse[DC__NUM_DPP__MAX];
+	unsigned int OutputMultistreamId[DC__NUM_DPP__MAX];
+	bool OutputMultistreamEn[DC__NUM_DPP__MAX];
+	bool UsesMALLForStaticScreen[DC__NUM_DPP__MAX];
+	double MaxActiveDRAMClockChangeLatencySupported[DC__NUM_DPP__MAX];
+	double WritebackAllowFCLKChangeEndPosition[DC__NUM_DPP__MAX];
+	bool PTEBufferSizeNotExceededPerState[DC__NUM_DPP__MAX]; // new in DML32
+	bool DCCMetaBufferSizeNotExceededPerState[DC__NUM_DPP__MAX]; // new in DML32
+	bool NotEnoughDSCSlices[DC__VOLTAGE_STATES];
+	bool PixelsPerLinePerDSCUnitSupport[DC__VOLTAGE_STATES];
+	bool DCCMetaBufferSizeNotExceeded[DC__VOLTAGE_STATES][2];
+	unsigned int dpte_row_height_linear[DC__NUM_DPP__MAX];
+	unsigned int dpte_row_height_linear_chroma[DC__NUM_DPP__MAX];
+	unsigned int BlockHeightY[DC__NUM_DPP__MAX];
+	unsigned int BlockHeightC[DC__NUM_DPP__MAX];
+	unsigned int BlockWidthY[DC__NUM_DPP__MAX];
+	unsigned int BlockWidthC[DC__NUM_DPP__MAX];
+	unsigned int SubViewportLinesNeededInMALL[DC__NUM_DPP__MAX];
+	bool VActiveBandwithSupport[DC__VOLTAGE_STATES][2];
+	struct dummy_vars dummy_vars;
 };
 
 bool CalculateMinAndMaxPrefetchMode(
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dml_wrapper.c b/drivers/gpu/drm/amd/display/dc/dml/dml_wrapper.c
index d2273674e872..b4b51e51fc25 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dml_wrapper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dml_wrapper.c
@@ -23,7 +23,6 @@
  *
  */
 
-#include "dml_wrapper.h"
 #include "resource.h"
 #include "core_types.h"
 #include "dsc.h"
@@ -86,25 +85,6 @@ static void get_pixel_clock_parameters(
 
 }
 
-static enum dc_status build_pipe_hw_param(struct pipe_ctx *pipe_ctx)
-{
-	get_pixel_clock_parameters(pipe_ctx, &pipe_ctx->stream_res.pix_clk_params);
-
-	if (pipe_ctx->clock_source)
-		pipe_ctx->clock_source->funcs->get_pix_clk_dividers(
-			pipe_ctx->clock_source,
-			&pipe_ctx->stream_res.pix_clk_params,
-			&pipe_ctx->pll_settings);
-
-	pipe_ctx->stream->clamping.pixel_encoding = pipe_ctx->stream->timing.pixel_encoding;
-
-	resource_build_bit_depth_reduction_params(pipe_ctx->stream,
-					&pipe_ctx->stream->bit_depth_params);
-	build_clamping_params(pipe_ctx->stream);
-
-	return DC_OK;
-}
-
 static void resource_build_bit_depth_reduction_params(struct dc_stream_state *stream,
 		struct bit_depth_reduction_params *fmt_bit_depth)
 {
@@ -231,6 +211,30 @@ static void resource_build_bit_depth_reduction_params(struct dc_stream_state *st
 	fmt_bit_depth->pixel_encoding = pixel_encoding;
 }
 
+/* Move this after the above function as VS complains about
+ * declaration issues for resource_build_bit_depth_reduction_params.
+ */
+
+static enum dc_status build_pipe_hw_param(struct pipe_ctx *pipe_ctx)
+{
+
+	get_pixel_clock_parameters(pipe_ctx, &pipe_ctx->stream_res.pix_clk_params);
+
+	if (pipe_ctx->clock_source)
+		pipe_ctx->clock_source->funcs->get_pix_clk_dividers(
+			pipe_ctx->clock_source,
+			&pipe_ctx->stream_res.pix_clk_params,
+			&pipe_ctx->pll_settings);
+
+	pipe_ctx->stream->clamping.pixel_encoding = pipe_ctx->stream->timing.pixel_encoding;
+
+	resource_build_bit_depth_reduction_params(pipe_ctx->stream,
+		&pipe_ctx->stream->bit_depth_params);
+	build_clamping_params(pipe_ctx->stream);
+
+	return DC_OK;
+}
+
 bool dml_validate_dsc(struct dc *dc, struct dc_state *new_ctx)
 {
 	int i;
@@ -1130,7 +1134,7 @@ static int dml_populate_dml_pipes_from_context(
 {
 	int i, pipe_cnt;
 	struct resource_context *res_ctx = &context->res_ctx;
-	struct pipe_ctx *pipe;
+	struct pipe_ctx *pipe = NULL;	// Fix potentially uninitialized error from VS
 
 	populate_dml_pipes_from_context_base(dc, context, pipes, fast_validate);
 
@@ -1296,6 +1300,7 @@ static void dml_update_soc_for_wm_a(struct dc *dc, struct dc_state *context)
 		context->bw_ctx.dml.soc.dram_clock_change_latency_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_A].dml_input.pstate_latency_us;
 		context->bw_ctx.dml.soc.sr_enter_plus_exit_time_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_A].dml_input.sr_enter_plus_exit_time_us;
 		context->bw_ctx.dml.soc.sr_exit_time_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_A].dml_input.sr_exit_time_us;
+		context->bw_ctx.dml.soc.fclk_change_latency_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_A].dml_input.fclk_change_latency_us;
 	}
 }
 
@@ -1593,11 +1598,8 @@ static void dml_calculate_dlg_params(
 		context->bw_ctx.bw.dcn.clk.z9_support = DCN_Z9_SUPPORT_ALLOW;
 	*/
 	context->bw_ctx.bw.dcn.clk.dtbclk_en = is_dtbclk_required(dc, context);
-	/* TODO : Uncomment the below line and make changes
-	 * as per DML nomenclature once it is available.
-	 * context->bw_ctx.bw.dcn.clk.fclk_p_state_change_support = context->bw_ctx.dml.vba.fclk_pstate_support;
-	 */
-
+	context->bw_ctx.bw.dcn.clk.fclk_p_state_change_support =
+		context->bw_ctx.dml.vba.FCLKChangeSupport[vlevel][context->bw_ctx.dml.vba.maxMpcComb];
 	if (context->bw_ctx.bw.dcn.clk.dispclk_khz < dc->debug.min_disp_clk_khz)
 		context->bw_ctx.bw.dcn.clk.dispclk_khz = dc->debug.min_disp_clk_khz;
 
@@ -1699,12 +1701,11 @@ static void dml_calculate_wm_and_dlg(
 	context->bw_ctx.bw.dcn.watermarks.b.frac_urg_bw_nom = get_fraction_of_urgent_bandwidth(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
 	context->bw_ctx.bw.dcn.watermarks.b.frac_urg_bw_flip = get_fraction_of_urgent_bandwidth_imm_flip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
 	context->bw_ctx.bw.dcn.watermarks.b.urgent_latency_ns = get_urgent_latency(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-	//context->bw_ctx.bw.dcn.watermarks.b.cstate_pstate.fclk_pstate_change_ns = get_wm_fclk_pstate(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.b.cstate_pstate.fclk_pstate_change_ns = get_fclk_watermark(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
 	//context->bw_ctx.bw.dcn.watermarks.b.usr_retraining_ns = get_wm_usr_retraining(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
 
 	/* Temporary, to have some fclk_pstate_change_ns and usr_retraining_ns wm values until DML is implemented */
-	context->bw_ctx.bw.dcn.watermarks.b.cstate_pstate.fclk_pstate_change_ns = context->bw_ctx.bw.dcn.watermarks.b.cstate_pstate.pstate_change_ns / 4;
-	context->bw_ctx.bw.dcn.watermarks.b.usr_retraining_ns = context->bw_ctx.bw.dcn.watermarks.b.cstate_pstate.pstate_change_ns / 8;
+	//context->bw_ctx.bw.dcn.watermarks.b.usr_retraining = context->bw_ctx.bw.dcn.watermarks.b.cstate_pstate.pstate_change_ns / 8;
 
 	/* Set D:
 	 * All clocks min.
@@ -1736,13 +1737,11 @@ static void dml_calculate_wm_and_dlg(
 	context->bw_ctx.bw.dcn.watermarks.d.frac_urg_bw_nom = get_fraction_of_urgent_bandwidth(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
 	context->bw_ctx.bw.dcn.watermarks.d.frac_urg_bw_flip = get_fraction_of_urgent_bandwidth_imm_flip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
 	context->bw_ctx.bw.dcn.watermarks.d.urgent_latency_ns = get_urgent_latency(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-	//context->bw_ctx.bw.dcn.watermarks.d.cstate_pstate.fclk_pstate_change_ns = get_wm_fclk_pstate(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.d.cstate_pstate.fclk_pstate_change_ns = get_fclk_watermark(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
 	//context->bw_ctx.bw.dcn.watermarks.d.usr_retraining_ns = get_wm_usr_retraining(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
 
 	/* Temporary, to have some fclk_pstate_change_ns and usr_retraining_ns wm values until DML is implemented */
-	context->bw_ctx.bw.dcn.watermarks.d.cstate_pstate.fclk_pstate_change_ns = context->bw_ctx.bw.dcn.watermarks.d.cstate_pstate.pstate_change_ns / 4;
-	context->bw_ctx.bw.dcn.watermarks.d.usr_retraining_ns = context->bw_ctx.bw.dcn.watermarks.d.cstate_pstate.pstate_change_ns / 8;
-
+	//context->bw_ctx.bw.dcn.watermarks.d.usr_retraining = context->bw_ctx.bw.dcn.watermarks.d.cstate_pstate.pstate_change_ns / 8;
 	/* Set C, for Dummy P-State:
 	 * All clocks min.
 	 * DCFCLK: Min, as reported by PM FW, when available
@@ -1773,13 +1772,11 @@ static void dml_calculate_wm_and_dlg(
 	context->bw_ctx.bw.dcn.watermarks.c.frac_urg_bw_nom = get_fraction_of_urgent_bandwidth(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
 	context->bw_ctx.bw.dcn.watermarks.c.frac_urg_bw_flip = get_fraction_of_urgent_bandwidth_imm_flip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
 	context->bw_ctx.bw.dcn.watermarks.c.urgent_latency_ns = get_urgent_latency(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
-	//context->bw_ctx.bw.dcn.watermarks.c.cstate_pstate.fclk_pstate_change_ns = get_wm_fclk_pstate(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.c.cstate_pstate.fclk_pstate_change_ns = get_fclk_watermark(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
 	//context->bw_ctx.bw.dcn.watermarks.c.usr_retraining_ns = get_wm_usr_retraining(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
 
 	/* Temporary, to have some fclk_pstate_change_ns and usr_retraining_ns wm values until DML is implemented */
-	context->bw_ctx.bw.dcn.watermarks.c.cstate_pstate.fclk_pstate_change_ns = context->bw_ctx.bw.dcn.watermarks.c.cstate_pstate.pstate_change_ns / 4;
-	context->bw_ctx.bw.dcn.watermarks.c.usr_retraining_ns = context->bw_ctx.bw.dcn.watermarks.c.cstate_pstate.pstate_change_ns / 8;
-
+	//context->bw_ctx.bw.dcn.watermarks.c.usr_retraining = context->bw_ctx.bw.dcn.watermarks.c.cstate_pstate.pstate_change_ns / 8;
 	if ((!pstate_en) && (dc->clk_mgr->bw_params->wm_table.nv_entries[WM_C].valid)) {
 		/* The only difference between A and C is p-state latency, if p-state is not supported
 		 * with full p-state latency we want to calculate DLG based on dummy p-state latency,
-- 
2.35.3

