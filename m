Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8293D324666
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Feb 2021 23:20:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67306EB4E;
	Wed, 24 Feb 2021 22:20:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F616EB4A
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Feb 2021 22:20:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XMzj32pS5bvDlJ9wViH8eSjI7Vd/X8oexfRWqkBXKssEACZp9Q4K2NY41QU98i0P746d6a3er8oGh6jg/LUd+UE98EqOPrLNV4YCgRiLb04fWBB04yA+iPs8Pb4HTW6XZ+ZtaAbvmxYuk+4ZjnijDonUYz52CQ1AvF7FbHq/4oOTSNpNEfDMj66e+vmu2ZNZcoPpICt2HsLH+9QkcJXFXfUGzX9Ncm+H/7dozsBEI59IxEa49hoF90pakldWro3+hQ1Os6x9pE8F7f0ZtaXw6pIgnunPLAYnZAyxSIO5QWlTAwl352K+8V3PQGuI1tGBq6wjNIl8vcqNTksJ3cN59Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jZXxVqSsKGQaSHAAhl353urbr5vsyWpmfTtoKAer0Y=;
 b=B9PlIErZquTPu49PKOJ9ejCGuZamEnUcPChGz8A8n8jmLy0kFPtZya22USUuHjC5ei1lgNZMlODUY/Sw8Kp0E63CL9Voy28hrFpm81mLTJcCx1xmnQ2w4KqPYPtlmqvz+uuu+nw/DOWruDsWXaYtylTBCzCnVKdKLBjHjNZBYcxDCsmW8susuHTkgpheDcOWwP8ZfKenUvtVZRV9o2ffdQNGkzn26bLbb5+g2ZChEc9rOuRr+IbccQUwsnn4Grny3HnGnGLatJW36/M37bHBgHp9mvHIOvHXSFFf6bZJ/QeohS+M8CKuAzPkmkvzJNMVJFT5NSKt7BRLcvtWbGo2wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jZXxVqSsKGQaSHAAhl353urbr5vsyWpmfTtoKAer0Y=;
 b=I2O6SYlSYVQ7C+643AqGfhX0Oa0+zcAeGv/R3McqPFtt3K1RuTyIAkKvHShEHq3j7O927WALjHCf9IlmwYUh7F7MQFKzIwDnjalorKTlV8+Tv5rHbEFm0I0pf7jOgpAMS8APUv2ae7YhobJTqKrz7P6X/T7zhmCyu3NeI1Gyro4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by MN2PR12MB4175.namprd12.prod.outlook.com (2603:10b6:208:1d3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Wed, 24 Feb
 2021 22:20:26 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::b0c4:9a8b:4c4c:76af]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::b0c4:9a8b:4c4c:76af%7]) with mapi id 15.20.3868.033; Wed, 24 Feb 2021
 22:20:26 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 060/159] drm/amd/swsmu: add aldebaran smu13 ip support (v3)
Date: Wed, 24 Feb 2021 17:17:20 -0500
Message-Id: <20210224221859.3068810-53-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210224221859.3068810-1-alexander.deucher@amd.com>
References: <20210224221859.3068810-1-alexander.deucher@amd.com>
X-Originating-IP: [192.161.79.246]
X-ClientProxiedBy: BLAPR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:208:32b::32) To MN2PR12MB4488.namprd12.prod.outlook.com
 (2603:10b6:208:24e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (192.161.79.246) by
 BLAPR03CA0027.namprd03.prod.outlook.com (2603:10b6:208:32b::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Wed, 24 Feb 2021 22:20:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: af88a63d-f156-4ba0-5890-08d8d9125405
X-MS-TrafficTypeDiagnostic: MN2PR12MB4175:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB41757737239BDDD6E246560FF79F9@MN2PR12MB4175.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LAYZyxKma4luZO77O8/lU9FLOLuF3mExmi06a42DAMw+NMao0gs3SpnSWPV6MusV+6HZgVgN+T6mo+4U25tJRx3e5fCLFB0BLg6VsrmOUpcY2LkIgzqSgakqlk1n5o0wFwy91N/33TkYFJXEjfGTdddvSwNf2Fwe0mGjASOJdu805VLsFDvhWn4nCs9w5NTjGP1RnLuJKJFmInUVDCGVLak33+IgtNe0Ou60hd0CmAWKlhfrAkEpPGtw8X/W2j3VTKdXDNy5c1XC55oHlWTkHMZMkeBVzaM2n0SoyEJkzgtTGiUbZ2SN/PVoOetCuZmog8Mp1LoeRHVXw2nSGbCI1LdRdD0xKjnk2m5mRe7w6SbnP8JzkNtsVzCU26t+2EKSK5jlGWkip0kaDatOWEQ7U7rrxoQzrJFvBvCmyKjFDfzqnzMV3LIN9dN5hNd5qFsVTzHyMl6fHiUqWZjfGQ2re3lOe7U6Vx7F5Mxq22WXAcdjdz538lgA0lfit5H0C7e0tb3+7Y4XuHm6cLgRgdnKxP5yZtr9DFGiRkTsfDclUUW3DGjeN7xqDL3HiEo3w4OeGkhe8CqhORSQxXFHeWJNsg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(346002)(396003)(376002)(66946007)(5660300002)(4326008)(6512007)(66476007)(6916009)(26005)(36756003)(66556008)(2616005)(19627235002)(186003)(956004)(16526019)(478600001)(8936002)(6506007)(2906002)(69590400012)(86362001)(1076003)(54906003)(6666004)(83380400001)(66574015)(52116002)(8676002)(6486002)(316002)(30864003)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Q6ZGd5TH3/usd+Y0zyaBIuPquI9M5q5qpORaKASbQ91Q728rd64BRa77lZNQ?=
 =?us-ascii?Q?HOBRX59j5lOoS62HH8BjEX7QLt2nu82I9aZaQqdnX3adpSnMW32elarW5Jg/?=
 =?us-ascii?Q?v0vJdOp1prk+veQ2dR2Rld1jETWSAHO1Ftv5JBMXBTpw3HA0OXLC6Nw9osuJ?=
 =?us-ascii?Q?xwX2/YB498lOZ6i8OSef8jN8UGCqPbZH9+smMQTvtOxW8WIR9pOATBkiqEDD?=
 =?us-ascii?Q?bIQ9lddB9hUNW0eHUzYau0dxY04wKWyolJCWZxZoWcrxn9YvF5GyMBn6Vvj0?=
 =?us-ascii?Q?kcHfgZID66pzIwAAIeWPIJX6QgRkuqwRv/BAIJZUFy/dEkUDmZg5y6Vgfwwd?=
 =?us-ascii?Q?Rw+KD8gv9NMwqlqUoSkAD+o4PUBYLRcvgD3HNMpPEddX2ZXYimQFvj9nT1mj?=
 =?us-ascii?Q?WdYmI4+Axlz2X7lWwaOpcA4zaZQzblDtAJGS5lZxp0wftroQz3LTvPRzz2dh?=
 =?us-ascii?Q?G9NoFUuQuasco/RY/IXvkSNok72aa36yBK4oVie1B4eC/YqT1QUol8wrSh7d?=
 =?us-ascii?Q?vvYSFGOaLVUP4MTSOGakyOCYI2z72ya9WVRe12BrLXaooBgxoD9+aAcynKj+?=
 =?us-ascii?Q?/lnfeBlML8a1RFn1zQP8N5DPoZWuvbJz6oZhLZ5eVgmUhwdeDfOuHVpwLxCU?=
 =?us-ascii?Q?FElPjwcbEf1Xesnv02JLkADH0r4W4iHFYwBEQ6Kn7AD7bCM7I5NuCafrRrZn?=
 =?us-ascii?Q?0xCQr81GK48rpXIHBg/F7+m8PIDwtBDzgPXub4BU/zsbV12+uwkVWB0coh3f?=
 =?us-ascii?Q?NFIb7T37n+vLaSu8C+kV6mghytIM3K7CA5SfiZkWn2KDkp23QTy8vAxmGia/?=
 =?us-ascii?Q?zn5jG1drm7KxWCK6uQ0+rgnruliRaNepCQyIOeabRKKaypNT5eY4J20YrRG6?=
 =?us-ascii?Q?WBHO/nB/i/47URGJdIav88rD+/Xeo5NqWctU8LEwDdKs5yQLMcwwzUJSs8TT?=
 =?us-ascii?Q?7R2lxrXNpEcfB7KWsGxNEuo7VN86TJlYuR+sc7E8GDkxUmMk6hBlR+S9z2m8?=
 =?us-ascii?Q?rZJJ64T71nACHqFX7FBsCUq/mCp0puBggIwVbl0gA6WCCAU+PU5SREehZuh1?=
 =?us-ascii?Q?IVc24YV3aJWoMbzMOdMvLTZ/l/1/fSVuvp6s5OzvW1ZLR7vNUhf/dNpxvwWk?=
 =?us-ascii?Q?amuy6yhjoo365j2/DUzuRSCCEM1vkQ2AdLNTtceIcZ7gUS7tQeWW6NwLNi4n?=
 =?us-ascii?Q?Ym5hI3D/0NH6kpzlOtPmiivHotDnVf4wxLEJ2I4Z+i2syoWNvWgm55Y2jFFw?=
 =?us-ascii?Q?kDyca2R0ZYsFjv4qYr7RtSflYmC2BQaEf8bU+7EdZmvRAxM2//5pypHRR3at?=
 =?us-ascii?Q?YJxbGj+BYDOJvKpYywaYo+BZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af88a63d-f156-4ba0-5890-08d8d9125405
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 22:20:02.2010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DP+d6VADKsUUaqjCPtq9sfIGUNUGymFjGj5NMfRLoYxoaTpuUQmckEVWwnVyIcvNqLKFR+SRnX2EWHOV2oU2sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4175
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Kevin Wang <kevin1.wang@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Kevin Wang <kevin1.wang@amd.com>

Add initial swSMU support.

v1: add smu13 ip support for aldebaran asic (Kevin/Kenneth)
v2: switch to thm/mp v13_0 ip headers (Hawking)
v3: squash in updates (Alex)

Signed-off-by: Kevin Wang <kevin1.wang@amd.com>
Signed-off-by: Kenneth Feng <kenneth.feng@amd.com>
Reviewed-by: Kenneth Feng <kenneth.feng@amd.com>
Signed-off-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/pm/Makefile               |    1 +
 drivers/gpu/drm/amd/pm/inc/aldebaran_ppsmc.h  |  109 +
 drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h       |    1 +
 drivers/gpu/drm/amd/pm/inc/smu_types.h        |   27 +-
 drivers/gpu/drm/amd/pm/inc/smu_v13_0.h        |  273 +++
 .../gpu/drm/amd/pm/inc/smu_v13_0_pptable.h    |  165 ++
 drivers/gpu/drm/amd/pm/swsmu/Makefile         |    2 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     |   15 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile   |   30 +
 .../drm/amd/pm/swsmu/smu13/aldebaran_ppt.c    | 1317 ++++++++++++
 .../drm/amd/pm/swsmu/smu13/aldebaran_ppt.h    |   72 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c    | 1790 +++++++++++++++++
 12 files changed, 3797 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/pm/inc/aldebaran_ppsmc.h
 create mode 100644 drivers/gpu/drm/amd/pm/inc/smu_v13_0.h
 create mode 100644 drivers/gpu/drm/amd/pm/inc/smu_v13_0_pptable.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c

diff --git a/drivers/gpu/drm/amd/pm/Makefile b/drivers/gpu/drm/amd/pm/Makefile
index f01e86030cd1..8cf6eff1ea93 100644
--- a/drivers/gpu/drm/amd/pm/Makefile
+++ b/drivers/gpu/drm/amd/pm/Makefile
@@ -27,6 +27,7 @@ subdir-ccflags-y += \
 		-I$(FULL_AMD_PATH)/pm/swsmu \
 		-I$(FULL_AMD_PATH)/pm/swsmu/smu11 \
 		-I$(FULL_AMD_PATH)/pm/swsmu/smu12 \
+		-I$(FULL_AMD_PATH)/pm/swsmu/smu13 \
 		-I$(FULL_AMD_PATH)/pm/powerplay \
 		-I$(FULL_AMD_PATH)/pm/powerplay/smumgr\
 		-I$(FULL_AMD_PATH)/pm/powerplay/hwmgr
diff --git a/drivers/gpu/drm/amd/pm/inc/aldebaran_ppsmc.h b/drivers/gpu/drm/amd/pm/inc/aldebaran_ppsmc.h
new file mode 100644
index 000000000000..302888376c7c
--- /dev/null
+++ b/drivers/gpu/drm/amd/pm/inc/aldebaran_ppsmc.h
@@ -0,0 +1,109 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
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
+#ifndef ALDEBARAN_PP_SMC_H
+#define ALDEBARAN_PP_SMC_H
+
+#pragma pack(push, 1)
+
+// SMU Response Codes:
+#define PPSMC_Result_OK                    0x1
+#define PPSMC_Result_Failed                0xFF
+#define PPSMC_Result_UnknownCmd            0xFE
+#define PPSMC_Result_CmdRejectedPrereq     0xFD
+#define PPSMC_Result_CmdRejectedBusy       0xFC
+
+// Message Definitions:
+#define PPSMC_MSG_TestMessage                    0x1
+#define PPSMC_MSG_GetSmuVersion                  0x2
+#define PPSMC_MSG_Mode1Reset                     0x3
+#define PPSMC_MSG_GetDriverIfVersion             0x4
+#define PPSMC_MSG_spare1                         0x5
+#define PPSMC_MSG_spare2                         0x6
+#define PPSMC_MSG_EnableAllSmuFeatures           0x7
+#define PPSMC_MSG_DisableAllSmuFeatures          0x8
+#define PPSMC_MSG_spare3                         0x9
+#define PPSMC_MSG_spare4                         0xA
+#define PPSMC_MSG_spare5                         0xB
+#define PPSMC_MSG_spare6                         0xC
+#define PPSMC_MSG_GetEnabledSmuFeaturesLow       0xD
+#define PPSMC_MSG_GetEnabledSmuFeaturesHigh      0xE
+#define PPSMC_MSG_SetDriverDramAddrHigh          0xF
+#define PPSMC_MSG_SetDriverDramAddrLow           0x10
+#define PPSMC_MSG_SetToolsDramAddrHigh           0x11
+#define PPSMC_MSG_SetToolsDramAddrLow            0x12
+#define PPSMC_MSG_TransferTableSmu2Dram          0x13
+#define PPSMC_MSG_TransferTableDram2Smu          0x14
+#define PPSMC_MSG_UseDefaultPPTable              0x15
+#define PPSMC_MSG_SetSystemVirtualDramAddrHigh   0x16
+#define PPSMC_MSG_SetSystemVirtualDramAddrLow    0x17
+#define PPSMC_MSG_SetSoftMinByFreq               0x18
+#define PPSMC_MSG_SetSoftMaxByFreq               0x19
+#define PPSMC_MSG_SetHardMinByFreq               0x1A
+#define PPSMC_MSG_SetHardMaxByFreq               0x1B
+#define PPSMC_MSG_GetMinDpmFreq                  0x1C
+#define PPSMC_MSG_GetMaxDpmFreq                  0x1D
+#define PPSMC_MSG_GetDpmFreqByIndex              0x1E
+#define PPSMC_MSG_SetWorkloadMask                0x1F
+#define PPSMC_MSG_GetVoltageByDpm                0x20
+#define PPSMC_MSG_GetVoltageByDpmOverdrive       0x21
+#define PPSMC_MSG_SetPptLimit                    0x22
+#define PPSMC_MSG_GetPptLimit                    0x23
+#define PPSMC_MSG_PrepareMp1ForUnload            0x24
+#define PPSMC_MSG_PrepareMp1ForReset             0x25
+#define PPSMC_MSG_SoftReset                      0x26
+#define PPSMC_MSG_RunDcBtc                       0x27
+#define PPSMC_MSG_DramLogSetDramAddrHigh         0x28
+#define PPSMC_MSG_DramLogSetDramAddrLow          0x29
+#define PPSMC_MSG_DramLogSetDramSize             0x2A
+#define PPSMC_MSG_GetDebugData                   0x2B
+#define PPSMC_MSG_WaflTest                       0x2C
+#define PPSMC_MSG_spare7                         0x2D
+#define PPSMC_MSG_SetMemoryChannelEnable         0x2E
+#define PPSMC_MSG_SetNumBadHbmPagesRetired       0x2F
+#define PPSMC_MSG_DFCstateControl                0x32
+#define PPSMC_MSG_GetGmiPwrDnHyst                0x33
+#define PPSMC_MSG_SetGmiPwrDnHyst                0x34
+#define PPSMC_MSG_GmiPwrDnControl                0x35
+#define PPSMC_MSG_EnterGfxoff                    0x36
+#define PPSMC_MSG_ExitGfxoff                     0x37
+#define PPSMC_MSG_SetExecuteDMATest              0x38
+#define PPSMC_MSG_EnableDeterminism              0x39
+#define PPSMC_MSG_DisableDeterminism             0x3A
+#define PPSMC_MSG_SetUclkDpmMode                 0x3B
+
+#define PPSMC_Message_Count                      0x3C
+
+typedef enum {
+  GFXOFF_ERROR_NO_ERROR,
+  GFXOFF_ERROR_DISALLOWED,
+  GFXOFF_ERROR_GFX_BUSY,
+  GFXOFF_ERROR_GFX_OFF,
+  GFXOFF_ERROR_GFX_ON,
+} GFXOFF_ERROR_e;
+
+typedef uint32_t PPSMC_Result;
+typedef uint32_t PPSMC_Msg;
+#pragma pack(pop)
+
+#endif
diff --git a/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h
index 83147b7d836e..a78c8c9220fd 100644
--- a/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h
@@ -1288,6 +1288,7 @@ extern const struct amd_ip_funcs smu_ip_funcs;
 
 extern const struct amdgpu_ip_block_version smu_v11_0_ip_block;
 extern const struct amdgpu_ip_block_version smu_v12_0_ip_block;
+extern const struct amdgpu_ip_block_version smu_v13_0_ip_block;
 
 bool is_support_sw_smu(struct amdgpu_device *adev);
 bool is_support_cclk_dpm(struct amdgpu_device *adev);
diff --git a/drivers/gpu/drm/amd/pm/inc/smu_types.h b/drivers/gpu/drm/amd/pm/inc/smu_types.h
index aa4822202587..e9a0bda98fd7 100644
--- a/drivers/gpu/drm/amd/pm/inc/smu_types.h
+++ b/drivers/gpu/drm/amd/pm/inc/smu_types.h
@@ -168,9 +168,16 @@
 	__SMU_DUMMY_MAP(PowerGateAtHub),              \
 	__SMU_DUMMY_MAP(SetSoftMinJpeg),              \
 	__SMU_DUMMY_MAP(SetHardMinFclkByFreq),        \
-	__SMU_DUMMY_MAP(DFCstateControl),             \
-	__SMU_DUMMY_MAP(GmiPwrDnControl),              \
-	__SMU_DUMMY_MAP(DAL_DISABLE_DUMMY_PSTATE_CHANGE),\
+	__SMU_DUMMY_MAP(DFCstateControl), \
+	__SMU_DUMMY_MAP(GmiPwrDnControl), \
+	__SMU_DUMMY_MAP(spare), \
+	__SMU_DUMMY_MAP(SetNumBadHbmPagesRetired), \
+	__SMU_DUMMY_MAP(GetGmiPwrDnHyst), \
+	__SMU_DUMMY_MAP(SetGmiPwrDnHyst), \
+	__SMU_DUMMY_MAP(EnterGfxoff), \
+	__SMU_DUMMY_MAP(ExitGfxoff), \
+	__SMU_DUMMY_MAP(SetExecuteDMATest), \
+	__SMU_DUMMY_MAP(DAL_DISABLE_DUMMY_PSTATE_CHANGE), \
 	__SMU_DUMMY_MAP(DAL_ENABLE_DUMMY_PSTATE_CHANGE), \
 	__SMU_DUMMY_MAP(SET_DRIVER_DUMMY_TABLE_DRAM_ADDR_HIGH), \
 	__SMU_DUMMY_MAP(SET_DRIVER_DUMMY_TABLE_DRAM_ADDR_LOW), \
@@ -214,6 +221,9 @@
        __SMU_DUMMY_MAP(SetSlowPPTLimit),                \
        __SMU_DUMMY_MAP(GetFastPPTLimit),                \
        __SMU_DUMMY_MAP(GetSlowPPTLimit),                \
+	__SMU_DUMMY_MAP(EnableDeterminism),		\
+	__SMU_DUMMY_MAP(DisableDeterminism),		\
+	__SMU_DUMMY_MAP(SetUclkDpmMode),		\
 
 #undef __SMU_DUMMY_MAP
 #define __SMU_DUMMY_MAP(type)	SMU_MSG_##type
@@ -239,6 +249,7 @@ enum smu_clk_type {
 	SMU_SCLK,
 	SMU_MCLK,
 	SMU_PCIE,
+	SMU_LCLK,
 	SMU_OD_CCLK,
 	SMU_OD_SCLK,
 	SMU_OD_MCLK,
@@ -255,6 +266,7 @@ enum smu_clk_type {
        __SMU_DUMMY_MAP(DPM_SOCCLK),                    	\
        __SMU_DUMMY_MAP(DPM_UVD),                       	\
        __SMU_DUMMY_MAP(DPM_VCE),                       	\
+       __SMU_DUMMY_MAP(DPM_LCLK),                       \
        __SMU_DUMMY_MAP(ULV),                           	\
        __SMU_DUMMY_MAP(DPM_MP0CLK),                    	\
        __SMU_DUMMY_MAP(DPM_LINK),                      	\
@@ -283,6 +295,7 @@ enum smu_clk_type {
        __SMU_DUMMY_MAP(DS_MP1CLK),                     	\
        __SMU_DUMMY_MAP(DS_MP0CLK),                     	\
        __SMU_DUMMY_MAP(XGMI),                          	\
+       __SMU_DUMMY_MAP(XGMI_PER_LINK_PWR_DWN),          \
        __SMU_DUMMY_MAP(DPM_GFX_PACE),                  	\
        __SMU_DUMMY_MAP(MEM_VDDCI_SCALING),             	\
        __SMU_DUMMY_MAP(MEM_MVDD_SCALING),              	\
@@ -304,6 +317,7 @@ enum smu_clk_type {
        __SMU_DUMMY_MAP(MMHUB_PG),                      	\
        __SMU_DUMMY_MAP(ATHUB_PG),                      	\
        __SMU_DUMMY_MAP(APCC_DFLL),                     	\
+       __SMU_DUMMY_MAP(DF_CSTATE),                     	\
        __SMU_DUMMY_MAP(DPM_GFX_GPO),                    \
        __SMU_DUMMY_MAP(WAFL_CG),                        \
        __SMU_DUMMY_MAP(CCLK_DPM),                     	\
@@ -335,7 +349,12 @@ enum smu_clk_type {
        __SMU_DUMMY_MAP(ISP_DPM),                        \
        __SMU_DUMMY_MAP(A55_DPM),                        \
        __SMU_DUMMY_MAP(CVIP_DSP_DPM),                   \
-       __SMU_DUMMY_MAP(MSMU_LOW_POWER),
+       __SMU_DUMMY_MAP(MSMU_LOW_POWER),			\
+       __SMU_DUMMY_MAP(FUSE_CG),			\
+       __SMU_DUMMY_MAP(MP1_CG),				\
+       __SMU_DUMMY_MAP(SMUIO_CG),			\
+       __SMU_DUMMY_MAP(THM_CG),				\
+       __SMU_DUMMY_MAP(CLK_CG),				\
 
 #undef __SMU_DUMMY_MAP
 #define __SMU_DUMMY_MAP(feature)	SMU_FEATURE_##feature##_BIT
diff --git a/drivers/gpu/drm/amd/pm/inc/smu_v13_0.h b/drivers/gpu/drm/amd/pm/inc/smu_v13_0.h
new file mode 100644
index 000000000000..699b656bbd71
--- /dev/null
+++ b/drivers/gpu/drm/amd/pm/inc/smu_v13_0.h
@@ -0,0 +1,273 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
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
+#ifndef __SMU_V13_0_H__
+#define __SMU_V13_0_H__
+
+#include "amdgpu_smu.h"
+
+#define SMU13_DRIVER_IF_VERSION_INV 0xFFFFFFFF
+#define SMU13_DRIVER_IF_VERSION_ALDE 0x5
+
+/* MP Apertures */
+#define MP0_Public			0x03800000
+#define MP0_SRAM			0x03900000
+#define MP1_Public			0x03b00000
+#define MP1_SRAM			0x03c00004
+
+/* address block */
+#define smnMP1_FIRMWARE_FLAGS		0x3010024
+#define smnMP0_FW_INTF			0x30101c0
+#define smnMP1_PUB_CTRL			0x3010b14
+
+#define TEMP_RANGE_MIN			(0)
+#define TEMP_RANGE_MAX			(80 * 1000)
+
+#define SMU13_TOOL_SIZE			0x19000
+
+#define MAX_DPM_LEVELS 16
+#define MAX_PCIE_CONF 2
+
+#define CTF_OFFSET_EDGE			5
+#define CTF_OFFSET_HOTSPOT		5
+#define CTF_OFFSET_MEM			5
+
+static const struct smu_temperature_range smu13_thermal_policy[] =
+{
+	{-273150,  99000, 99000, -273150, 99000, 99000, -273150, 99000, 99000},
+	{ 120000, 120000, 120000, 120000, 120000, 120000, 120000, 120000, 120000},
+};
+
+struct smu_13_0_max_sustainable_clocks {
+	uint32_t display_clock;
+	uint32_t phy_clock;
+	uint32_t pixel_clock;
+	uint32_t uclock;
+	uint32_t dcef_clock;
+	uint32_t soc_clock;
+};
+
+struct smu_13_0_dpm_clk_level {
+	bool				enabled;
+	uint32_t			value;
+};
+
+struct smu_13_0_dpm_table {
+	uint32_t			min;        /* MHz */
+	uint32_t			max;        /* MHz */
+	uint32_t			count;
+	struct smu_13_0_dpm_clk_level	dpm_levels[MAX_DPM_LEVELS];
+};
+
+struct smu_13_0_pcie_table {
+	uint8_t  pcie_gen[MAX_PCIE_CONF];
+	uint8_t  pcie_lane[MAX_PCIE_CONF];
+};
+
+struct smu_13_0_dpm_tables {
+	struct smu_13_0_dpm_table        soc_table;
+	struct smu_13_0_dpm_table        gfx_table;
+	struct smu_13_0_dpm_table        uclk_table;
+	struct smu_13_0_dpm_table        eclk_table;
+	struct smu_13_0_dpm_table        vclk_table;
+	struct smu_13_0_dpm_table        dclk_table;
+	struct smu_13_0_dpm_table        dcef_table;
+	struct smu_13_0_dpm_table        pixel_table;
+	struct smu_13_0_dpm_table        display_table;
+	struct smu_13_0_dpm_table        phy_table;
+	struct smu_13_0_dpm_table        fclk_table;
+	struct smu_13_0_pcie_table       pcie_table;
+};
+
+struct smu_13_0_dpm_context {
+	struct smu_13_0_dpm_tables  dpm_tables;
+	uint32_t                    workload_policy_mask;
+	uint32_t                    dcef_min_ds_clk;
+};
+
+enum smu_13_0_power_state {
+	SMU_13_0_POWER_STATE__D0 = 0,
+	SMU_13_0_POWER_STATE__D1,
+	SMU_13_0_POWER_STATE__D3, /* Sleep*/
+	SMU_13_0_POWER_STATE__D4, /* Hibernate*/
+	SMU_13_0_POWER_STATE__D5, /* Power off*/
+};
+
+struct smu_13_0_power_context {
+	uint32_t	power_source;
+	uint8_t		in_power_limit_boost_mode;
+	enum smu_13_0_power_state power_state;
+};
+
+enum smu_v13_0_baco_seq {
+	BACO_SEQ_BACO = 0,
+	BACO_SEQ_MSR,
+	BACO_SEQ_BAMACO,
+	BACO_SEQ_ULPS,
+	BACO_SEQ_COUNT,
+};
+
+#if defined(SWSMU_CODE_LAYER_L2) || defined(SWSMU_CODE_LAYER_L3)
+
+int smu_v13_0_init_microcode(struct smu_context *smu);
+
+void smu_v13_0_fini_microcode(struct smu_context *smu);
+
+int smu_v13_0_load_microcode(struct smu_context *smu);
+
+int smu_v13_0_init_smc_tables(struct smu_context *smu);
+
+int smu_v13_0_fini_smc_tables(struct smu_context *smu);
+
+int smu_v13_0_init_power(struct smu_context *smu);
+
+int smu_v13_0_fini_power(struct smu_context *smu);
+
+int smu_v13_0_check_fw_status(struct smu_context *smu);
+
+int smu_v13_0_setup_pptable(struct smu_context *smu);
+
+int smu_v13_0_get_vbios_bootup_values(struct smu_context *smu);
+
+int smu_v13_0_check_fw_version(struct smu_context *smu);
+
+int smu_v13_0_set_driver_table_location(struct smu_context *smu);
+
+int smu_v13_0_set_tool_table_location(struct smu_context *smu);
+
+int smu_v13_0_notify_memory_pool_location(struct smu_context *smu);
+
+int smu_v13_0_system_features_control(struct smu_context *smu,
+				      bool en);
+
+int smu_v13_0_init_display_count(struct smu_context *smu, uint32_t count);
+
+int smu_v13_0_set_allowed_mask(struct smu_context *smu);
+
+int smu_v13_0_notify_display_change(struct smu_context *smu);
+
+int smu_v13_0_get_current_power_limit(struct smu_context *smu,
+				      uint32_t *power_limit);
+
+int smu_v13_0_set_power_limit(struct smu_context *smu, uint32_t n);
+
+int smu_v13_0_init_max_sustainable_clocks(struct smu_context *smu);
+
+int smu_v13_0_enable_thermal_alert(struct smu_context *smu);
+
+int smu_v13_0_disable_thermal_alert(struct smu_context *smu);
+
+int smu_v13_0_get_gfx_vdd(struct smu_context *smu, uint32_t *value);
+
+int smu_v13_0_set_min_deep_sleep_dcefclk(struct smu_context *smu, uint32_t clk);
+
+int
+smu_v13_0_display_clock_voltage_request(struct smu_context *smu,
+					struct pp_display_clock_request
+					*clock_req);
+
+uint32_t
+smu_v13_0_get_fan_control_mode(struct smu_context *smu);
+
+int
+smu_v13_0_set_fan_control_mode(struct smu_context *smu,
+			       uint32_t mode);
+
+int
+smu_v13_0_set_fan_speed_percent(struct smu_context *smu, uint32_t speed);
+
+int smu_v13_0_set_fan_speed_rpm(struct smu_context *smu,
+				uint32_t speed);
+
+int smu_v13_0_set_xgmi_pstate(struct smu_context *smu,
+			      uint32_t pstate);
+
+int smu_v13_0_gfx_off_control(struct smu_context *smu, bool enable);
+
+int smu_v13_0_register_irq_handler(struct smu_context *smu);
+
+int smu_v13_0_set_azalia_d3_pme(struct smu_context *smu);
+
+int smu_v13_0_get_max_sustainable_clocks_by_dc(struct smu_context *smu,
+					       struct pp_smu_nv_clock_table *max_clocks);
+
+bool smu_v13_0_baco_is_support(struct smu_context *smu);
+
+enum smu_baco_state smu_v13_0_baco_get_state(struct smu_context *smu);
+
+int smu_v13_0_baco_set_state(struct smu_context *smu, enum smu_baco_state state);
+
+int smu_v13_0_baco_enter(struct smu_context *smu);
+int smu_v13_0_baco_exit(struct smu_context *smu);
+
+int smu_v13_0_mode1_reset(struct smu_context *smu);
+
+int smu_v13_0_get_dpm_ultimate_freq(struct smu_context *smu, enum smu_clk_type clk_type,
+				    uint32_t *min, uint32_t *max);
+
+int smu_v13_0_set_soft_freq_limited_range(struct smu_context *smu, enum smu_clk_type clk_type,
+					  uint32_t min, uint32_t max);
+
+int smu_v13_0_set_hard_freq_limited_range(struct smu_context *smu,
+					  enum smu_clk_type clk_type,
+					  uint32_t min,
+					  uint32_t max);
+
+int smu_v13_0_set_performance_level(struct smu_context *smu,
+				    enum amd_dpm_forced_level level);
+
+int smu_v13_0_set_power_source(struct smu_context *smu,
+			       enum smu_power_src_type power_src);
+
+int smu_v13_0_get_dpm_freq_by_index(struct smu_context *smu,
+				    enum smu_clk_type clk_type,
+				    uint16_t level,
+				    uint32_t *value);
+
+int smu_v13_0_get_dpm_level_count(struct smu_context *smu,
+				  enum smu_clk_type clk_type,
+				  uint32_t *value);
+
+int smu_v13_0_set_single_dpm_table(struct smu_context *smu,
+				   enum smu_clk_type clk_type,
+				   struct smu_13_0_dpm_table *single_dpm_table);
+
+int smu_v13_0_get_dpm_level_range(struct smu_context *smu,
+				  enum smu_clk_type clk_type,
+				  uint32_t *min_value,
+				  uint32_t *max_value);
+
+int smu_v13_0_get_current_pcie_link_width_level(struct smu_context *smu);
+
+int smu_v13_0_get_current_pcie_link_width(struct smu_context *smu);
+
+int smu_v13_0_get_current_pcie_link_speed_level(struct smu_context *smu);
+
+int smu_v13_0_get_current_pcie_link_speed(struct smu_context *smu);
+
+void smu_v13_0_init_gpu_metrics_v1_0(struct gpu_metrics_v1_0 *gpu_metrics);
+
+int smu_v13_0_gfx_ulv_control(struct smu_context *smu,
+			      bool enablement);
+
+#endif
+#endif
diff --git a/drivers/gpu/drm/amd/pm/inc/smu_v13_0_pptable.h b/drivers/gpu/drm/amd/pm/inc/smu_v13_0_pptable.h
new file mode 100644
index 000000000000..1f311396b706
--- /dev/null
+++ b/drivers/gpu/drm/amd/pm/inc/smu_v13_0_pptable.h
@@ -0,0 +1,165 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
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
+ */
+#ifndef SMU_13_0_PPTABLE_H
+#define SMU_13_0_PPTABLE_H
+
+#define SMU_13_0_TABLE_FORMAT_REVISION                  1
+
+//// POWERPLAYTABLE::ulPlatformCaps
+#define SMU_13_0_PP_PLATFORM_CAP_POWERPLAY              0x1
+#define SMU_13_0_PP_PLATFORM_CAP_SBIOSPOWERSOURCE       0x2
+#define SMU_13_0_PP_PLATFORM_CAP_HARDWAREDC             0x4
+#define SMU_13_0_PP_PLATFORM_CAP_BACO                   0x8
+#define SMU_13_0_PP_PLATFORM_CAP_MACO                   0x10
+#define SMU_13_0_PP_PLATFORM_CAP_SHADOWPSTATE           0x20
+
+// SMU_13_0_PP_THERMALCONTROLLER - Thermal Controller Type
+#define SMU_13_0_PP_THERMALCONTROLLER_NONE              0
+
+#define SMU_13_0_PP_OVERDRIVE_VERSION                   0x0800
+#define SMU_13_0_PP_POWERSAVINGCLOCK_VERSION            0x0100
+
+enum SMU_13_0_ODFEATURE_CAP {
+	SMU_13_0_ODCAP_GFXCLK_LIMITS = 0,
+	SMU_13_0_ODCAP_GFXCLK_CURVE,
+	SMU_13_0_ODCAP_UCLK_MAX,
+	SMU_13_0_ODCAP_POWER_LIMIT,
+	SMU_13_0_ODCAP_FAN_ACOUSTIC_LIMIT,
+	SMU_13_0_ODCAP_FAN_SPEED_MIN,
+	SMU_13_0_ODCAP_TEMPERATURE_FAN,
+	SMU_13_0_ODCAP_TEMPERATURE_SYSTEM,
+	SMU_13_0_ODCAP_MEMORY_TIMING_TUNE,
+	SMU_13_0_ODCAP_FAN_ZERO_RPM_CONTROL,
+	SMU_13_0_ODCAP_AUTO_UV_ENGINE,
+	SMU_13_0_ODCAP_AUTO_OC_ENGINE,
+	SMU_13_0_ODCAP_AUTO_OC_MEMORY,
+	SMU_13_0_ODCAP_FAN_CURVE,
+	SMU_13_0_ODCAP_COUNT,
+};
+
+enum SMU_13_0_ODFEATURE_ID {
+	SMU_13_0_ODFEATURE_GFXCLK_LIMITS        = 1 << SMU_13_0_ODCAP_GFXCLK_LIMITS,            //GFXCLK Limit feature
+	SMU_13_0_ODFEATURE_GFXCLK_CURVE         = 1 << SMU_13_0_ODCAP_GFXCLK_CURVE,             //GFXCLK Curve feature
+	SMU_13_0_ODFEATURE_UCLK_MAX             = 1 << SMU_13_0_ODCAP_UCLK_MAX,                 //UCLK Limit feature
+	SMU_13_0_ODFEATURE_POWER_LIMIT          = 1 << SMU_13_0_ODCAP_POWER_LIMIT,              //Power Limit feature
+	SMU_13_0_ODFEATURE_FAN_ACOUSTIC_LIMIT   = 1 << SMU_13_0_ODCAP_FAN_ACOUSTIC_LIMIT,       //Fan Acoustic RPM feature
+	SMU_13_0_ODFEATURE_FAN_SPEED_MIN        = 1 << SMU_13_0_ODCAP_FAN_SPEED_MIN,            //Minimum Fan Speed feature
+	SMU_13_0_ODFEATURE_TEMPERATURE_FAN      = 1 << SMU_13_0_ODCAP_TEMPERATURE_FAN,          //Fan Target Temperature Limit feature
+	SMU_13_0_ODFEATURE_TEMPERATURE_SYSTEM   = 1 << SMU_13_0_ODCAP_TEMPERATURE_SYSTEM,       //Operating Temperature Limit feature
+	SMU_13_0_ODFEATURE_MEMORY_TIMING_TUNE   = 1 << SMU_13_0_ODCAP_MEMORY_TIMING_TUNE,       //AC Timing Tuning feature
+	SMU_13_0_ODFEATURE_FAN_ZERO_RPM_CONTROL = 1 << SMU_13_0_ODCAP_FAN_ZERO_RPM_CONTROL,     //Zero RPM feature
+	SMU_13_0_ODFEATURE_AUTO_UV_ENGINE       = 1 << SMU_13_0_ODCAP_AUTO_UV_ENGINE,           //Auto Under Volt GFXCLK feature
+	SMU_13_0_ODFEATURE_AUTO_OC_ENGINE       = 1 << SMU_13_0_ODCAP_AUTO_OC_ENGINE,           //Auto Over Clock GFXCLK feature
+	SMU_13_0_ODFEATURE_AUTO_OC_MEMORY       = 1 << SMU_13_0_ODCAP_AUTO_OC_MEMORY,           //Auto Over Clock MCLK feature
+	SMU_13_0_ODFEATURE_FAN_CURVE            = 1 << SMU_13_0_ODCAP_FAN_CURVE,                //Fan Curve feature
+	SMU_13_0_ODFEATURE_COUNT                = 14,
+};
+
+#define SMU_13_0_MAX_ODFEATURE    32          //Maximum Number of OD Features
+
+enum SMU_13_0_ODSETTING_ID {
+	SMU_13_0_ODSETTING_GFXCLKFMAX = 0,
+	SMU_13_0_ODSETTING_GFXCLKFMIN,
+	SMU_13_0_ODSETTING_VDDGFXCURVEFREQ_P1,
+	SMU_13_0_ODSETTING_VDDGFXCURVEVOLTAGE_P1,
+	SMU_13_0_ODSETTING_VDDGFXCURVEFREQ_P2,
+	SMU_13_0_ODSETTING_VDDGFXCURVEVOLTAGE_P2,
+	SMU_13_0_ODSETTING_VDDGFXCURVEFREQ_P3,
+	SMU_13_0_ODSETTING_VDDGFXCURVEVOLTAGE_P3,
+	SMU_13_0_ODSETTING_UCLKFMAX,
+	SMU_13_0_ODSETTING_POWERPERCENTAGE,
+	SMU_13_0_ODSETTING_FANRPMMIN,
+	SMU_13_0_ODSETTING_FANRPMACOUSTICLIMIT,
+	SMU_13_0_ODSETTING_FANTARGETTEMPERATURE,
+	SMU_13_0_ODSETTING_OPERATINGTEMPMAX,
+	SMU_13_0_ODSETTING_ACTIMING,
+	SMU_13_0_ODSETTING_FAN_ZERO_RPM_CONTROL,
+	SMU_13_0_ODSETTING_AUTOUVENGINE,
+	SMU_13_0_ODSETTING_AUTOOCENGINE,
+	SMU_13_0_ODSETTING_AUTOOCMEMORY,
+	SMU_13_0_ODSETTING_COUNT,
+};
+
+#define SMU_13_0_MAX_ODSETTING    32          //Maximum Number of ODSettings
+
+struct smu_13_0_overdrive_table {
+	uint8_t  revision;                                        //Revision = SMU_11_0_PP_OVERDRIVE_VERSION
+	uint8_t  reserve[3];                                      //Zero filled field reserved for future use
+	uint32_t feature_count;                                   //Total number of supported features
+	uint32_t setting_count;                                   //Total number of supported settings
+	uint8_t  cap[SMU_13_0_MAX_ODFEATURE];                     //OD feature support flags
+	uint32_t max[SMU_13_0_MAX_ODSETTING];                     //default maximum settings
+	uint32_t min[SMU_13_0_MAX_ODSETTING];                     //default minimum settings
+} __attribute__((packed));
+
+enum SMU_13_0_PPCLOCK_ID {
+	SMU_13_0_PPCLOCK_GFXCLK = 0,
+	SMU_13_0_PPCLOCK_VCLK,
+	SMU_13_0_PPCLOCK_DCLK,
+	SMU_13_0_PPCLOCK_ECLK,
+	SMU_13_0_PPCLOCK_SOCCLK,
+	SMU_13_0_PPCLOCK_UCLK,
+	SMU_13_0_PPCLOCK_DCEFCLK,
+	SMU_13_0_PPCLOCK_DISPCLK,
+	SMU_13_0_PPCLOCK_PIXCLK,
+	SMU_13_0_PPCLOCK_PHYCLK,
+	SMU_13_0_PPCLOCK_COUNT,
+};
+#define SMU_13_0_MAX_PPCLOCK      16          //Maximum Number of PP Clocks
+
+struct smu_13_0_power_saving_clock_table {
+	uint8_t  revision;                                        //Revision = SMU_11_0_PP_POWERSAVINGCLOCK_VERSION
+	uint8_t  reserve[3];                                      //Zero filled field reserved for future use
+	uint32_t count;                                           //power_saving_clock_count = SMU_11_0_PPCLOCK_COUNT
+	uint32_t max[SMU_13_0_MAX_PPCLOCK];                       //PowerSavingClock Mode Clock Maximum array In MHz
+	uint32_t min[SMU_13_0_MAX_PPCLOCK];                       //PowerSavingClock Mode Clock Minimum array In MHz
+} __attribute__((packed));
+
+struct smu_13_0_powerplay_table {
+	struct atom_common_table_header header;
+	uint8_t  table_revision;
+	uint16_t table_size;                          //Driver portion table size. The offset to smc_pptable including header size
+	uint32_t golden_pp_id;
+	uint32_t golden_revision;
+	uint16_t format_id;
+	uint32_t platform_caps;                       //POWERPLAYABLE::ulPlatformCaps
+
+	uint8_t  thermal_controller_type;             //one of SMU_13_0_PP_THERMALCONTROLLER
+
+	uint16_t small_power_limit1;
+	uint16_t small_power_limit2;
+	uint16_t boost_power_limit;
+	uint16_t od_turbo_power_limit;                //Power limit setting for Turbo mode in Performance UI Tuning.
+	uint16_t od_power_save_power_limit;           //Power limit setting for PowerSave/Optimal mode in Performance UI Tuning.
+	uint16_t software_shutdown_temp;
+
+	uint16_t reserve[6];                          //Zero filled field reserved for future use
+
+	struct smu_13_0_power_saving_clock_table      power_saving_clock;
+	struct smu_13_0_overdrive_table               overdrive_table;
+
+#ifndef SMU_13_0_PARTIAL_PPTABLE
+	PPTable_t smc_pptable;                        //PPTable_t in driver_if.h
+#endif
+} __attribute__((packed));
+
+#endif
diff --git a/drivers/gpu/drm/amd/pm/swsmu/Makefile b/drivers/gpu/drm/amd/pm/swsmu/Makefile
index 6f281990b7b4..7987c6cf849d 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/Makefile
+++ b/drivers/gpu/drm/amd/pm/swsmu/Makefile
@@ -22,7 +22,7 @@
 
 AMD_SWSMU_PATH = ../pm/swsmu
 
-SWSMU_LIBS = smu11 smu12
+SWSMU_LIBS = smu11 smu12 smu13
 
 AMD_SWSMU = $(addsuffix /Makefile,$(addprefix $(FULL_AMD_PATH)/pm/swsmu/,$(SWSMU_LIBS)))
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index d143ef1b460b..b1c30a6cb16e 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -34,6 +34,7 @@
 #include "sienna_cichlid_ppt.h"
 #include "renoir_ppt.h"
 #include "vangogh_ppt.h"
+#include "aldebaran_ppt.h"
 #include "amd_pcie.h"
 
 /*
@@ -527,6 +528,11 @@ static int smu_set_funcs(struct amdgpu_device *adev)
 	case CHIP_DIMGREY_CAVEFISH:
 		sienna_cichlid_set_ppt_funcs(smu);
 		break;
+	case CHIP_ALDEBARAN:
+		aldebaran_set_ppt_funcs(smu);
+		/* OD is not supported on Aldebaran */
+		smu->od_enabled = false;
+		break;
 	case CHIP_RENOIR:
 		renoir_set_ppt_funcs(smu);
 		break;
@@ -1972,6 +1978,15 @@ const struct amdgpu_ip_block_version smu_v12_0_ip_block =
 	.funcs = &smu_ip_funcs,
 };
 
+const struct amdgpu_ip_block_version smu_v13_0_ip_block =
+{
+	.type = AMD_IP_BLOCK_TYPE_SMC,
+	.major = 13,
+	.minor = 0,
+	.rev = 0,
+	.funcs = &smu_ip_funcs,
+};
+
 int smu_load_microcode(struct smu_context *smu)
 {
 	int ret = 0;
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile b/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile
new file mode 100644
index 000000000000..652b4e554378
--- /dev/null
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile
@@ -0,0 +1,30 @@
+#
+# Copyright 2020 Advanced Micro Devices, Inc.
+#
+# Permission is hereby granted, free of charge, to any person obtaining a
+# copy of this software and associated documentation files (the "Software"),
+# to deal in the Software without restriction, including without limitation
+# the rights to use, copy, modify, merge, publish, distribute, sublicense,
+# and/or sell copies of the Software, and to permit persons to whom the
+# Software is furnished to do so, subject to the following conditions:
+#
+# The above copyright notice and this permission notice shall be included in
+# all copies or substantial portions of the Software.
+#
+# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+# THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+# OTHER DEALINGS IN THE SOFTWARE.
+#
+#
+# Makefile for the 'smu manager' sub-component of powerplay.
+# It provides the smu management services for the driver.
+
+SMU13_MGR = smu_v13_0.o aldebaran_ppt.o
+
+AMD_SWSMU_SMU13MGR = $(addprefix $(AMD_SWSMU_PATH)/smu13/,$(SMU13_MGR))
+
+AMD_POWERPLAY_FILES += $(AMD_SWSMU_SMU13MGR)
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
new file mode 100644
index 000000000000..bdefb9078847
--- /dev/null
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
@@ -0,0 +1,1317 @@
+/*
+ * Copyright 2019 Advanced Micro Devices, Inc.
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
+#define SWSMU_CODE_LAYER_L2
+
+#include <linux/firmware.h>
+#include "amdgpu.h"
+#include "amdgpu_smu.h"
+#include "atomfirmware.h"
+#include "amdgpu_atomfirmware.h"
+#include "amdgpu_atombios.h"
+#include "smu_v13_0.h"
+#include "smu13_driver_if_aldebaran.h"
+#include "soc15_common.h"
+#include "atom.h"
+#include "power_state.h"
+#include "aldebaran_ppt.h"
+#include "smu_v13_0_pptable.h"
+#include "aldebaran_ppsmc.h"
+#include "nbio/nbio_7_4_offset.h"
+#include "nbio/nbio_7_4_sh_mask.h"
+#include "thm/thm_11_0_2_offset.h"
+#include "thm/thm_11_0_2_sh_mask.h"
+#include "amdgpu_xgmi.h"
+#include <linux/pci.h>
+#include "amdgpu_ras.h"
+#include "smu_cmn.h"
+
+/*
+ * DO NOT use these for err/warn/info/debug messages.
+ * Use dev_err, dev_warn, dev_info and dev_dbg instead.
+ * They are more MGPU friendly.
+ */
+#undef pr_err
+#undef pr_warn
+#undef pr_info
+#undef pr_debug
+
+#define to_amdgpu_device(x) (container_of(x, struct amdgpu_device, pm.smu_i2c))
+
+#define ALDEBARAN_FEA_MAP(smu_feature, aldebaran_feature) \
+	[smu_feature] = {1, (aldebaran_feature)}
+
+#define FEATURE_MASK(feature) (1ULL << feature)
+#define SMC_DPM_FEATURE ( \
+			  FEATURE_MASK(FEATURE_DATA_CALCULATIONS) | \
+			  FEATURE_MASK(FEATURE_DPM_GFXCLK_BIT)	| \
+			  FEATURE_MASK(FEATURE_DPM_UCLK_BIT)	| \
+			  FEATURE_MASK(FEATURE_DPM_SOCCLK_BIT)	| \
+			  FEATURE_MASK(FEATURE_DPM_FCLK_BIT)	| \
+			  FEATURE_MASK(FEATURE_DPM_LCLK_BIT)	| \
+			  FEATURE_MASK(FEATURE_DPM_XGMI_BIT)	| \
+			  FEATURE_MASK(FEATURE_DPM_VCN_BIT))
+
+/* possible frequency drift (1Mhz) */
+#define EPSILON				1
+
+#define smnPCIE_ESM_CTRL			0x111003D0
+
+static const struct cmn2asic_msg_mapping aldebaran_message_map[SMU_MSG_MAX_COUNT] = {
+	MSG_MAP(TestMessage,			     PPSMC_MSG_TestMessage,			0),
+	MSG_MAP(GetSmuVersion,			     PPSMC_MSG_GetSmuVersion,			1),
+	MSG_MAP(GetDriverIfVersion,		     PPSMC_MSG_GetDriverIfVersion,		1),
+	MSG_MAP(EnableAllSmuFeatures,		     PPSMC_MSG_EnableAllSmuFeatures,		0),
+	MSG_MAP(DisableAllSmuFeatures,		     PPSMC_MSG_DisableAllSmuFeatures,		0),
+	MSG_MAP(GetEnabledSmuFeaturesLow,	     PPSMC_MSG_GetEnabledSmuFeaturesLow,	0),
+	MSG_MAP(GetEnabledSmuFeaturesHigh,	     PPSMC_MSG_GetEnabledSmuFeaturesHigh,	0),
+	MSG_MAP(SetDriverDramAddrHigh,		     PPSMC_MSG_SetDriverDramAddrHigh,		1),
+	MSG_MAP(SetDriverDramAddrLow,		     PPSMC_MSG_SetDriverDramAddrLow,		1),
+	MSG_MAP(SetToolsDramAddrHigh,		     PPSMC_MSG_SetToolsDramAddrHigh,		0),
+	MSG_MAP(SetToolsDramAddrLow,		     PPSMC_MSG_SetToolsDramAddrLow,		0),
+	MSG_MAP(TransferTableSmu2Dram,		     PPSMC_MSG_TransferTableSmu2Dram,		1),
+	MSG_MAP(TransferTableDram2Smu,		     PPSMC_MSG_TransferTableDram2Smu,		0),
+	MSG_MAP(UseDefaultPPTable,		     PPSMC_MSG_UseDefaultPPTable,		0),
+	MSG_MAP(SetSystemVirtualDramAddrHigh,	     PPSMC_MSG_SetSystemVirtualDramAddrHigh,	0),
+	MSG_MAP(SetSystemVirtualDramAddrLow,	     PPSMC_MSG_SetSystemVirtualDramAddrLow,	0),
+	MSG_MAP(SetSoftMinByFreq,		     PPSMC_MSG_SetSoftMinByFreq,		0),
+	MSG_MAP(SetSoftMaxByFreq,		     PPSMC_MSG_SetSoftMaxByFreq,		0),
+	MSG_MAP(SetHardMinByFreq,		     PPSMC_MSG_SetHardMinByFreq,		0),
+	MSG_MAP(SetHardMaxByFreq,		     PPSMC_MSG_SetHardMaxByFreq,		0),
+	MSG_MAP(GetMinDpmFreq,			     PPSMC_MSG_GetMinDpmFreq,			0),
+	MSG_MAP(GetMaxDpmFreq,			     PPSMC_MSG_GetMaxDpmFreq,			0),
+	MSG_MAP(GetDpmFreqByIndex,		     PPSMC_MSG_GetDpmFreqByIndex,		1),
+	MSG_MAP(SetWorkloadMask,		     PPSMC_MSG_SetWorkloadMask,			1),
+	MSG_MAP(GetVoltageByDpm,		     PPSMC_MSG_GetVoltageByDpm,			0),
+	MSG_MAP(GetVoltageByDpmOverdrive,	     PPSMC_MSG_GetVoltageByDpmOverdrive,	0),
+	MSG_MAP(SetPptLimit,			     PPSMC_MSG_SetPptLimit,			0),
+	MSG_MAP(GetPptLimit,			     PPSMC_MSG_GetPptLimit,			1),
+	MSG_MAP(PrepareMp1ForUnload,		     PPSMC_MSG_PrepareMp1ForUnload,		0),
+	MSG_MAP(PrepareMp1ForReset,		     PPSMC_MSG_PrepareMp1ForReset,		0),
+	MSG_MAP(Mode1Reset,			     PPSMC_MSG_Mode1Reset,			0),
+	MSG_MAP(SoftReset,			     PPSMC_MSG_SoftReset,			0),
+	MSG_MAP(RunDcBtc,			     PPSMC_MSG_RunDcBtc,			0),
+	MSG_MAP(DramLogSetDramAddrHigh,		     PPSMC_MSG_DramLogSetDramAddrHigh,		0),
+	MSG_MAP(DramLogSetDramAddrLow,		     PPSMC_MSG_DramLogSetDramAddrLow,		0),
+	MSG_MAP(DramLogSetDramSize,		     PPSMC_MSG_DramLogSetDramSize,		0),
+	MSG_MAP(GetDebugData,			     PPSMC_MSG_GetDebugData,			0),
+	MSG_MAP(WaflTest,			     PPSMC_MSG_WaflTest,			0),
+	MSG_MAP(SetMemoryChannelEnable,		     PPSMC_MSG_SetMemoryChannelEnable,		0),
+	MSG_MAP(SetNumBadHbmPagesRetired,	     PPSMC_MSG_SetNumBadHbmPagesRetired,	0),
+	MSG_MAP(DFCstateControl,		     PPSMC_MSG_DFCstateControl,			0),
+	MSG_MAP(GetGmiPwrDnHyst,		     PPSMC_MSG_GetGmiPwrDnHyst,			0),
+	MSG_MAP(SetGmiPwrDnHyst,		     PPSMC_MSG_SetGmiPwrDnHyst,			0),
+	MSG_MAP(GmiPwrDnControl,		     PPSMC_MSG_GmiPwrDnControl,			0),
+	MSG_MAP(EnterGfxoff,			     PPSMC_MSG_EnterGfxoff,			0),
+	MSG_MAP(ExitGfxoff,			     PPSMC_MSG_ExitGfxoff,			0),
+	MSG_MAP(SetExecuteDMATest,		     PPSMC_MSG_SetExecuteDMATest,		0),
+	MSG_MAP(EnableDeterminism,		     PPSMC_MSG_EnableDeterminism,		0),
+	MSG_MAP(DisableDeterminism,		     PPSMC_MSG_DisableDeterminism,		0),
+	MSG_MAP(SetUclkDpmMode,				 PPSMC_MSG_SetUclkDpmMode,		0),
+};
+
+static const struct cmn2asic_mapping aldebaran_clk_map[SMU_CLK_COUNT] = {
+	CLK_MAP(GFXCLK, PPCLK_GFXCLK),
+	CLK_MAP(SCLK,	PPCLK_GFXCLK),
+	CLK_MAP(SOCCLK, PPCLK_SOCCLK),
+	CLK_MAP(FCLK, PPCLK_FCLK),
+	CLK_MAP(UCLK, PPCLK_UCLK),
+	CLK_MAP(MCLK, PPCLK_UCLK),
+	CLK_MAP(DCLK, PPCLK_DCLK),
+	CLK_MAP(VCLK, PPCLK_VCLK),
+	CLK_MAP(LCLK, 	PPCLK_LCLK),
+};
+
+static const struct cmn2asic_mapping aldebaran_feature_mask_map[SMU_FEATURE_COUNT] = {
+	ALDEBARAN_FEA_MAP(SMU_FEATURE_DPM_PREFETCHER_BIT, 		FEATURE_DATA_CALCULATIONS),
+	ALDEBARAN_FEA_MAP(SMU_FEATURE_DPM_GFXCLK_BIT, 			FEATURE_DPM_GFXCLK_BIT),
+	ALDEBARAN_FEA_MAP(SMU_FEATURE_DPM_UCLK_BIT, 			FEATURE_DPM_UCLK_BIT),
+	ALDEBARAN_FEA_MAP(SMU_FEATURE_DPM_SOCCLK_BIT, 			FEATURE_DPM_SOCCLK_BIT),
+	ALDEBARAN_FEA_MAP(SMU_FEATURE_DPM_FCLK_BIT, 			FEATURE_DPM_FCLK_BIT),
+	ALDEBARAN_FEA_MAP(SMU_FEATURE_DPM_LCLK_BIT, 			FEATURE_DPM_LCLK_BIT),
+	ALDEBARAN_FEA_MAP(SMU_FEATURE_XGMI_BIT, 				FEATURE_DPM_XGMI_BIT),
+	ALDEBARAN_FEA_MAP(SMU_FEATURE_DS_GFXCLK_BIT, 			FEATURE_DS_GFXCLK_BIT),
+	ALDEBARAN_FEA_MAP(SMU_FEATURE_DS_SOCCLK_BIT, 			FEATURE_DS_SOCCLK_BIT),
+	ALDEBARAN_FEA_MAP(SMU_FEATURE_DS_LCLK_BIT, 				FEATURE_DS_LCLK_BIT),
+	ALDEBARAN_FEA_MAP(SMU_FEATURE_DS_FCLK_BIT, 				FEATURE_DS_FCLK_BIT),
+	ALDEBARAN_FEA_MAP(SMU_FEATURE_DS_UCLK_BIT,				FEATURE_DS_UCLK_BIT),
+	ALDEBARAN_FEA_MAP(SMU_FEATURE_GFX_SS_BIT, 				FEATURE_GFX_SS_BIT),
+	ALDEBARAN_FEA_MAP(SMU_FEATURE_VCN_PG_BIT, 				FEATURE_DPM_VCN_BIT),
+	ALDEBARAN_FEA_MAP(SMU_FEATURE_RSMU_SMN_CG_BIT, 			FEATURE_RSMU_SMN_CG_BIT),
+	ALDEBARAN_FEA_MAP(SMU_FEATURE_WAFL_CG_BIT, 				FEATURE_WAFL_CG_BIT),
+	ALDEBARAN_FEA_MAP(SMU_FEATURE_PPT_BIT, 					FEATURE_PPT_BIT),
+	ALDEBARAN_FEA_MAP(SMU_FEATURE_TDC_BIT, 					FEATURE_TDC_BIT),
+	ALDEBARAN_FEA_MAP(SMU_FEATURE_APCC_PLUS_BIT, 			FEATURE_APCC_PLUS_BIT),
+	ALDEBARAN_FEA_MAP(SMU_FEATURE_APCC_DFLL_BIT, 			FEATURE_APCC_DFLL_BIT),
+	ALDEBARAN_FEA_MAP(SMU_FEATURE_FUSE_CG_BIT, 				FEATURE_FUSE_CG_BIT),
+	ALDEBARAN_FEA_MAP(SMU_FEATURE_MP1_CG_BIT, 				FEATURE_MP1_CG_BIT),
+	ALDEBARAN_FEA_MAP(SMU_FEATURE_SMUIO_CG_BIT, 			FEATURE_SMUIO_CG_BIT),
+	ALDEBARAN_FEA_MAP(SMU_FEATURE_THM_CG_BIT, 				FEATURE_THM_CG_BIT),
+	ALDEBARAN_FEA_MAP(SMU_FEATURE_CLK_CG_BIT, 				FEATURE_CLK_CG_BIT),
+	ALDEBARAN_FEA_MAP(SMU_FEATURE_FW_CTF_BIT, 				FEATURE_FW_CTF_BIT),
+	ALDEBARAN_FEA_MAP(SMU_FEATURE_THERMAL_BIT, 				FEATURE_THERMAL_BIT),
+	ALDEBARAN_FEA_MAP(SMU_FEATURE_OUT_OF_BAND_MONITOR_BIT, 	FEATURE_OUT_OF_BAND_MONITOR_BIT),
+	ALDEBARAN_FEA_MAP(SMU_FEATURE_XGMI_PER_LINK_PWR_DWN_BIT,FEATURE_XGMI_PER_LINK_PWR_DWN),
+	ALDEBARAN_FEA_MAP(SMU_FEATURE_DF_CSTATE_BIT, 			FEATURE_DF_CSTATE),
+};
+
+static const struct cmn2asic_mapping aldebaran_table_map[SMU_TABLE_COUNT] = {
+	TAB_MAP(PPTABLE),
+	TAB_MAP(AVFS_PSM_DEBUG),
+	TAB_MAP(AVFS_FUSE_OVERRIDE),
+	TAB_MAP(PMSTATUSLOG),
+	TAB_MAP(SMU_METRICS),
+	TAB_MAP(DRIVER_SMU_CONFIG),
+	TAB_MAP(I2C_COMMANDS),
+};
+
+static int aldebaran_tables_init(struct smu_context *smu)
+{
+	struct smu_table_context *smu_table = &smu->smu_table;
+	struct smu_table *tables = smu_table->tables;
+
+	SMU_TABLE_INIT(tables, SMU_TABLE_PPTABLE, sizeof(PPTable_t),
+		       PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
+
+	SMU_TABLE_INIT(tables, SMU_TABLE_PMSTATUSLOG, SMU13_TOOL_SIZE,
+		       PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
+
+	SMU_TABLE_INIT(tables, SMU_TABLE_SMU_METRICS, sizeof(SmuMetrics_t),
+		       PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
+
+	SMU_TABLE_INIT(tables, SMU_TABLE_I2C_COMMANDS, sizeof(SwI2cRequest_t),
+		       PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
+
+	smu_table->metrics_table = kzalloc(sizeof(SmuMetrics_t), GFP_KERNEL);
+	if (!smu_table->metrics_table)
+		return -ENOMEM;
+	smu_table->metrics_time = 0;
+
+	smu_table->gpu_metrics_table_size = sizeof(struct gpu_metrics_v1_0);
+	smu_table->gpu_metrics_table = kzalloc(smu_table->gpu_metrics_table_size, GFP_KERNEL);
+	if (!smu_table->gpu_metrics_table) {
+		kfree(smu_table->metrics_table);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int aldebaran_allocate_dpm_context(struct smu_context *smu)
+{
+	struct smu_dpm_context *smu_dpm = &smu->smu_dpm;
+
+	smu_dpm->dpm_context = kzalloc(sizeof(struct smu_13_0_dpm_context),
+				       GFP_KERNEL);
+	if (!smu_dpm->dpm_context)
+		return -ENOMEM;
+	smu_dpm->dpm_context_size = sizeof(struct smu_13_0_dpm_context);
+
+	smu_dpm->dpm_current_power_state = kzalloc(sizeof(struct smu_power_state),
+						   GFP_KERNEL);
+	if (!smu_dpm->dpm_current_power_state)
+		return -ENOMEM;
+
+	smu_dpm->dpm_request_power_state = kzalloc(sizeof(struct smu_power_state),
+						   GFP_KERNEL);
+	if (!smu_dpm->dpm_request_power_state)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static int aldebaran_init_smc_tables(struct smu_context *smu)
+{
+	int ret = 0;
+
+	ret = aldebaran_tables_init(smu);
+	if (ret)
+		return ret;
+
+	ret = aldebaran_allocate_dpm_context(smu);
+	if (ret)
+		return ret;
+
+	return smu_v13_0_init_smc_tables(smu);
+}
+
+static int aldebaran_get_allowed_feature_mask(struct smu_context *smu,
+					      uint32_t *feature_mask, uint32_t num)
+{
+	if (num > 2)
+		return -EINVAL;
+
+	/* pptable will handle the features to enable */
+	memset(feature_mask, 0xFF, sizeof(uint32_t) * num);
+
+	return 0;
+}
+
+static int aldebaran_set_default_dpm_table(struct smu_context *smu)
+{
+	struct smu_13_0_dpm_context *dpm_context = smu->smu_dpm.dpm_context;
+	struct smu_13_0_dpm_table *dpm_table = NULL;
+	PPTable_t *pptable = smu->smu_table.driver_pptable;
+	int ret = 0;
+
+	/* socclk dpm table setup */
+	dpm_table = &dpm_context->dpm_tables.soc_table;
+	if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_SOCCLK_BIT)) {
+		ret = smu_v13_0_set_single_dpm_table(smu,
+						     SMU_SOCCLK,
+						     dpm_table);
+		if (ret)
+			return ret;
+	} else {
+		dpm_table->count = 1;
+		dpm_table->dpm_levels[0].value = smu->smu_table.boot_values.socclk / 100;
+		dpm_table->dpm_levels[0].enabled = true;
+		dpm_table->min = dpm_table->dpm_levels[0].value;
+		dpm_table->max = dpm_table->dpm_levels[0].value;
+	}
+
+	/* gfxclk dpm table setup */
+	dpm_table = &dpm_context->dpm_tables.gfx_table;
+	if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_GFXCLK_BIT)) {
+		/* in the case of gfxclk, only fine-grained dpm is honored */
+		dpm_table->count = 2;
+		dpm_table->dpm_levels[0].value = pptable->GfxclkFmin;
+		dpm_table->dpm_levels[0].enabled = true;
+		dpm_table->dpm_levels[1].value = pptable->GfxclkFmax;
+		dpm_table->dpm_levels[1].enabled = true;
+		dpm_table->min = dpm_table->dpm_levels[0].value;
+		dpm_table->max = dpm_table->dpm_levels[1].value;
+	} else {
+		dpm_table->count = 1;
+		dpm_table->dpm_levels[0].value = smu->smu_table.boot_values.gfxclk / 100;
+		dpm_table->dpm_levels[0].enabled = true;
+		dpm_table->min = dpm_table->dpm_levels[0].value;
+		dpm_table->max = dpm_table->dpm_levels[0].value;
+	}
+
+	/* memclk dpm table setup */
+	dpm_table = &dpm_context->dpm_tables.uclk_table;
+	if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_UCLK_BIT)) {
+		ret = smu_v13_0_set_single_dpm_table(smu,
+						     SMU_UCLK,
+						     dpm_table);
+		if (ret)
+			return ret;
+	} else {
+		dpm_table->count = 1;
+		dpm_table->dpm_levels[0].value = smu->smu_table.boot_values.uclk / 100;
+		dpm_table->dpm_levels[0].enabled = true;
+		dpm_table->min = dpm_table->dpm_levels[0].value;
+		dpm_table->max = dpm_table->dpm_levels[0].value;
+	}
+
+	/* fclk dpm table setup */
+	dpm_table = &dpm_context->dpm_tables.fclk_table;
+	if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_FCLK_BIT)) {
+		ret = smu_v13_0_set_single_dpm_table(smu,
+						     SMU_FCLK,
+						     dpm_table);
+		if (ret)
+			return ret;
+	} else {
+		dpm_table->count = 1;
+		dpm_table->dpm_levels[0].value = smu->smu_table.boot_values.fclk / 100;
+		dpm_table->dpm_levels[0].enabled = true;
+		dpm_table->min = dpm_table->dpm_levels[0].value;
+		dpm_table->max = dpm_table->dpm_levels[0].value;
+	}
+
+	return 0;
+}
+
+static int aldebaran_check_powerplay_table(struct smu_context *smu)
+{
+	struct smu_table_context *table_context = &smu->smu_table;
+	struct smu_13_0_powerplay_table *powerplay_table =
+		table_context->power_play_table;
+	struct smu_baco_context *smu_baco = &smu->smu_baco;
+
+	mutex_lock(&smu_baco->mutex);
+	if (powerplay_table->platform_caps & SMU_13_0_PP_PLATFORM_CAP_BACO ||
+	    powerplay_table->platform_caps & SMU_13_0_PP_PLATFORM_CAP_MACO)
+		smu_baco->platform_support = true;
+	mutex_unlock(&smu_baco->mutex);
+
+	table_context->thermal_controller_type =
+		powerplay_table->thermal_controller_type;
+
+	return 0;
+}
+
+static int aldebaran_store_powerplay_table(struct smu_context *smu)
+{
+	struct smu_table_context *table_context = &smu->smu_table;
+	struct smu_13_0_powerplay_table *powerplay_table =
+		table_context->power_play_table;
+	memcpy(table_context->driver_pptable, &powerplay_table->smc_pptable,
+	       sizeof(PPTable_t));
+
+	return 0;
+}
+
+static int aldebaran_append_powerplay_table(struct smu_context *smu)
+{
+	return 0;
+}
+
+static int aldebaran_setup_pptable(struct smu_context *smu)
+{
+	int ret = 0;
+
+	ret = smu_v13_0_setup_pptable(smu);
+	if (ret)
+		return ret;
+
+	ret = aldebaran_store_powerplay_table(smu);
+	if (ret)
+		return ret;
+
+	ret = aldebaran_append_powerplay_table(smu);
+	if (ret)
+		return ret;
+
+	ret = aldebaran_check_powerplay_table(smu);
+	if (ret)
+		return ret;
+
+	return ret;
+}
+
+static int aldebaran_run_btc(struct smu_context *smu)
+{
+	/* int ret = 0; */
+
+	/* ret = smu_cmn_send_smc_msg(smu, SMU_MSG_RunAfllBtc, NULL); */
+	/* if (ret) { */
+	/* dev_err(smu->adev->dev, "RunAfllBtc failed!\n"); */
+	/* return ret; */
+	/* } */
+
+	/* return smu_cmn_send_smc_msg(smu, SMU_MSG_RunDcBtc, NULL); */
+	return 0;
+}
+
+static int aldebaran_populate_umd_state_clk(struct smu_context *smu)
+{
+	struct smu_13_0_dpm_context *dpm_context =
+		smu->smu_dpm.dpm_context;
+	struct smu_13_0_dpm_table *gfx_table =
+		&dpm_context->dpm_tables.gfx_table;
+	struct smu_13_0_dpm_table *mem_table =
+		&dpm_context->dpm_tables.uclk_table;
+	struct smu_13_0_dpm_table *soc_table =
+		&dpm_context->dpm_tables.soc_table;
+	struct smu_umd_pstate_table *pstate_table =
+		&smu->pstate_table;
+
+	pstate_table->gfxclk_pstate.min = gfx_table->min;
+	pstate_table->gfxclk_pstate.peak = gfx_table->max;
+
+	pstate_table->uclk_pstate.min = mem_table->min;
+	pstate_table->uclk_pstate.peak = mem_table->max;
+
+	pstate_table->socclk_pstate.min = soc_table->min;
+	pstate_table->socclk_pstate.peak = soc_table->max;
+
+	if (gfx_table->count > ALDEBARAN_UMD_PSTATE_GFXCLK_LEVEL &&
+	    mem_table->count > ALDEBARAN_UMD_PSTATE_MCLK_LEVEL &&
+	    soc_table->count > ALDEBARAN_UMD_PSTATE_SOCCLK_LEVEL) {
+		pstate_table->gfxclk_pstate.standard =
+			gfx_table->dpm_levels[ALDEBARAN_UMD_PSTATE_GFXCLK_LEVEL].value;
+		pstate_table->uclk_pstate.standard =
+			mem_table->dpm_levels[ALDEBARAN_UMD_PSTATE_MCLK_LEVEL].value;
+		pstate_table->socclk_pstate.standard =
+			soc_table->dpm_levels[ALDEBARAN_UMD_PSTATE_SOCCLK_LEVEL].value;
+	} else {
+		pstate_table->gfxclk_pstate.standard =
+			pstate_table->gfxclk_pstate.min;
+		pstate_table->uclk_pstate.standard =
+			pstate_table->uclk_pstate.min;
+		pstate_table->socclk_pstate.standard =
+			pstate_table->socclk_pstate.min;
+	}
+
+	return 0;
+}
+
+static int aldebaran_get_clk_table(struct smu_context *smu,
+				   struct pp_clock_levels_with_latency *clocks,
+				   struct smu_13_0_dpm_table *dpm_table)
+{
+	int i, count;
+
+	count = (dpm_table->count > MAX_NUM_CLOCKS) ? MAX_NUM_CLOCKS : dpm_table->count;
+	clocks->num_levels = count;
+
+	for (i = 0; i < count; i++) {
+		clocks->data[i].clocks_in_khz =
+			dpm_table->dpm_levels[i].value * 1000;
+		clocks->data[i].latency_in_us = 0;
+	}
+
+	return 0;
+}
+
+static int aldebaran_freqs_in_same_level(int32_t frequency1,
+					 int32_t frequency2)
+{
+	return (abs(frequency1 - frequency2) <= EPSILON);
+}
+
+static int aldebaran_get_smu_metrics_data(struct smu_context *smu,
+					  MetricsMember_t member,
+					  uint32_t *value)
+{
+	struct smu_table_context *smu_table= &smu->smu_table;
+	SmuMetrics_t *metrics = (SmuMetrics_t *)smu_table->metrics_table;
+	int ret = 0;
+
+	mutex_lock(&smu->metrics_lock);
+
+	ret = smu_cmn_get_metrics_table_locked(smu,
+					       NULL,
+					       false);
+	if (ret) {
+		mutex_unlock(&smu->metrics_lock);
+		return ret;
+	}
+
+	switch (member) {
+	case METRICS_CURR_GFXCLK:
+		*value = metrics->CurrClock[PPCLK_GFXCLK];
+		break;
+	case METRICS_CURR_SOCCLK:
+		*value = metrics->CurrClock[PPCLK_SOCCLK];
+		break;
+	case METRICS_CURR_UCLK:
+		*value = metrics->CurrClock[PPCLK_UCLK];
+		break;
+	case METRICS_CURR_VCLK:
+		*value = metrics->CurrClock[PPCLK_VCLK];
+		break;
+	case METRICS_CURR_DCLK:
+		*value = metrics->CurrClock[PPCLK_DCLK];
+		break;
+	case METRICS_CURR_FCLK:
+		*value = metrics->CurrClock[PPCLK_FCLK];
+		break;
+	case METRICS_AVERAGE_GFXCLK:
+		*value = metrics->AverageGfxclkFrequency;
+		break;
+	case METRICS_AVERAGE_SOCCLK:
+		*value = metrics->AverageSocclkFrequency;
+		break;
+	case METRICS_AVERAGE_UCLK:
+		*value = metrics->AverageUclkFrequency;
+		break;
+	case METRICS_AVERAGE_GFXACTIVITY:
+		*value = metrics->AverageGfxActivity;
+		break;
+	case METRICS_AVERAGE_MEMACTIVITY:
+		*value = metrics->AverageUclkActivity;
+		break;
+	case METRICS_AVERAGE_SOCKETPOWER:
+		*value = metrics->AverageSocketPower << 8;
+		break;
+	case METRICS_TEMPERATURE_EDGE:
+		*value = metrics->TemperatureEdge *
+			SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
+		break;
+	case METRICS_TEMPERATURE_HOTSPOT:
+		*value = metrics->TemperatureHotspot *
+			SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
+		break;
+	case METRICS_TEMPERATURE_MEM:
+		*value = metrics->TemperatureHBM *
+			SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
+		break;
+	case METRICS_TEMPERATURE_VRGFX:
+		*value = metrics->TemperatureVrGfx *
+			SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
+		break;
+	case METRICS_TEMPERATURE_VRSOC:
+		*value = metrics->TemperatureVrSoc *
+			SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
+		break;
+	case METRICS_TEMPERATURE_VRMEM:
+		*value = metrics->TemperatureVrMem *
+			SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
+		break;
+	case METRICS_THROTTLER_STATUS:
+		*value = metrics->ThrottlerStatus;
+		break;
+	default:
+		*value = UINT_MAX;
+		break;
+	}
+
+	mutex_unlock(&smu->metrics_lock);
+
+	return ret;
+}
+
+static int aldebaran_get_current_clk_freq_by_table(struct smu_context *smu,
+						   enum smu_clk_type clk_type,
+						   uint32_t *value)
+{
+	MetricsMember_t member_type;
+	int clk_id = 0;
+
+	if (!value)
+		return -EINVAL;
+
+	clk_id = smu_cmn_to_asic_specific_index(smu,
+						CMN2ASIC_MAPPING_CLK,
+						clk_type);
+	if (clk_id < 0)
+		return -EINVAL;
+
+	switch (clk_id) {
+	case PPCLK_GFXCLK:
+		/*
+		 * CurrClock[clk_id] can provide accurate
+		 *   output only when the dpm feature is enabled.
+		 * We can use Average_* for dpm disabled case.
+		 *   But this is available for gfxclk/uclk/socclk/vclk/dclk.
+		 */
+		if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_GFXCLK_BIT))
+			member_type = METRICS_CURR_GFXCLK;
+		else
+			member_type = METRICS_AVERAGE_GFXCLK;
+		break;
+	case PPCLK_UCLK:
+		if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_UCLK_BIT))
+			member_type = METRICS_CURR_UCLK;
+		else
+			member_type = METRICS_AVERAGE_UCLK;
+		break;
+	case PPCLK_SOCCLK:
+		if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_SOCCLK_BIT))
+			member_type = METRICS_CURR_SOCCLK;
+		else
+			member_type = METRICS_AVERAGE_SOCCLK;
+		break;
+	case PPCLK_VCLK:
+		if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_VCN_PG_BIT))
+			member_type = METRICS_CURR_VCLK;
+		else
+			member_type = METRICS_AVERAGE_VCLK;
+		break;
+	case PPCLK_DCLK:
+		if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_VCN_PG_BIT))
+			member_type = METRICS_CURR_DCLK;
+		else
+			member_type = METRICS_AVERAGE_DCLK;
+		break;
+	case PPCLK_FCLK:
+		member_type = METRICS_CURR_FCLK;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return aldebaran_get_smu_metrics_data(smu,
+					      member_type,
+					      value);
+}
+
+static int aldebaran_print_clk_levels(struct smu_context *smu,
+				      enum smu_clk_type type, char *buf)
+{
+	int i, now, size = 0;
+	int ret = 0;
+	struct pp_clock_levels_with_latency clocks;
+	struct smu_13_0_dpm_table *single_dpm_table;
+	struct smu_dpm_context *smu_dpm = &smu->smu_dpm;
+	struct smu_13_0_dpm_context *dpm_context = NULL;
+	uint32_t display_levels;
+	uint32_t freq_values[3] = {0};
+
+	if (amdgpu_ras_intr_triggered())
+		return snprintf(buf, PAGE_SIZE, "unavailable\n");
+
+	dpm_context = smu_dpm->dpm_context;
+
+	switch (type) {
+	case SMU_SCLK:
+		ret = aldebaran_get_current_clk_freq_by_table(smu, SMU_GFXCLK, &now);
+		if (ret) {
+			dev_err(smu->adev->dev, "Attempt to get current gfx clk Failed!");
+			return ret;
+		}
+
+		single_dpm_table = &(dpm_context->dpm_tables.gfx_table);
+		ret = aldebaran_get_clk_table(smu, &clocks, single_dpm_table);
+		if (ret) {
+			dev_err(smu->adev->dev, "Attempt to get gfx clk levels Failed!");
+			return ret;
+		}
+
+		display_levels = clocks.num_levels;
+
+		/* fine-grained dpm has only 2 levels */
+		if (now > single_dpm_table->dpm_levels[0].value &&
+				now < single_dpm_table->dpm_levels[1].value) {
+			display_levels = clocks.num_levels + 1;
+			freq_values[0] = single_dpm_table->dpm_levels[0].value;
+			freq_values[2] = single_dpm_table->dpm_levels[1].value;
+			freq_values[1] = now;
+		}
+
+		/*
+		 * For DPM disabled case, there will be only one clock level.
+		 * And it's safe to assume that is always the current clock.
+		 */
+		if (display_levels == clocks.num_levels) {
+			for (i = 0; i < clocks.num_levels; i++)
+				size += sprintf(buf + size, "%d: %uMhz %s\n", i,
+						clocks.data[i].clocks_in_khz / 1000,
+						(clocks.num_levels == 1) ? "*" :
+						(aldebaran_freqs_in_same_level(
+								       clocks.data[i].clocks_in_khz / 1000,
+								       now) ? "*" : ""));
+		} else {
+			for (i = 0; i < display_levels; i++)
+				size += sprintf(buf + size, "%d: %uMhz %s\n", i,
+						freq_values[i], i == 1 ? "*" : "");
+		}
+
+		break;
+
+	case SMU_MCLK:
+		ret = aldebaran_get_current_clk_freq_by_table(smu, SMU_UCLK, &now);
+		if (ret) {
+			dev_err(smu->adev->dev, "Attempt to get current mclk Failed!");
+			return ret;
+		}
+
+		single_dpm_table = &(dpm_context->dpm_tables.uclk_table);
+		ret = aldebaran_get_clk_table(smu, &clocks, single_dpm_table);
+		if (ret) {
+			dev_err(smu->adev->dev, "Attempt to get memory clk levels Failed!");
+			return ret;
+		}
+
+		for (i = 0; i < clocks.num_levels; i++)
+			size += sprintf(buf + size, "%d: %uMhz %s\n",
+					i, clocks.data[i].clocks_in_khz / 1000,
+					(clocks.num_levels == 1) ? "*" :
+					(aldebaran_freqs_in_same_level(
+								       clocks.data[i].clocks_in_khz / 1000,
+								       now) ? "*" : ""));
+		break;
+
+	case SMU_SOCCLK:
+		ret = aldebaran_get_current_clk_freq_by_table(smu, SMU_SOCCLK, &now);
+		if (ret) {
+			dev_err(smu->adev->dev, "Attempt to get current socclk Failed!");
+			return ret;
+		}
+
+		single_dpm_table = &(dpm_context->dpm_tables.soc_table);
+		ret = aldebaran_get_clk_table(smu, &clocks, single_dpm_table);
+		if (ret) {
+			dev_err(smu->adev->dev, "Attempt to get socclk levels Failed!");
+			return ret;
+		}
+
+		for (i = 0; i < clocks.num_levels; i++)
+			size += sprintf(buf + size, "%d: %uMhz %s\n",
+					i, clocks.data[i].clocks_in_khz / 1000,
+					(clocks.num_levels == 1) ? "*" :
+					(aldebaran_freqs_in_same_level(
+								       clocks.data[i].clocks_in_khz / 1000,
+								       now) ? "*" : ""));
+		break;
+
+	case SMU_FCLK:
+		ret = aldebaran_get_current_clk_freq_by_table(smu, SMU_FCLK, &now);
+		if (ret) {
+			dev_err(smu->adev->dev, "Attempt to get current fclk Failed!");
+			return ret;
+		}
+
+		single_dpm_table = &(dpm_context->dpm_tables.fclk_table);
+		ret = aldebaran_get_clk_table(smu, &clocks, single_dpm_table);
+		if (ret) {
+			dev_err(smu->adev->dev, "Attempt to get fclk levels Failed!");
+			return ret;
+		}
+
+		for (i = 0; i < single_dpm_table->count; i++)
+			size += sprintf(buf + size, "%d: %uMhz %s\n",
+					i, single_dpm_table->dpm_levels[i].value,
+					(clocks.num_levels == 1) ? "*" :
+					(aldebaran_freqs_in_same_level(
+								       clocks.data[i].clocks_in_khz / 1000,
+								       now) ? "*" : ""));
+		break;
+
+	default:
+		break;
+	}
+
+	return size;
+}
+
+static int aldebaran_upload_dpm_level(struct smu_context *smu,
+				      bool max,
+				      uint32_t feature_mask,
+				      uint32_t level)
+{
+	struct smu_13_0_dpm_context *dpm_context =
+		smu->smu_dpm.dpm_context;
+	uint32_t freq;
+	int ret = 0;
+
+	if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_GFXCLK_BIT) &&
+	    (feature_mask & FEATURE_MASK(FEATURE_DPM_GFXCLK_BIT))) {
+		freq = dpm_context->dpm_tables.gfx_table.dpm_levels[level].value;
+		ret = smu_cmn_send_smc_msg_with_param(smu,
+						      (max ? SMU_MSG_SetSoftMaxByFreq : SMU_MSG_SetSoftMinByFreq),
+						      (PPCLK_GFXCLK << 16) | (freq & 0xffff),
+						      NULL);
+		if (ret) {
+			dev_err(smu->adev->dev, "Failed to set soft %s gfxclk !\n",
+				max ? "max" : "min");
+			return ret;
+		}
+	}
+
+	if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_UCLK_BIT) &&
+	    (feature_mask & FEATURE_MASK(FEATURE_DPM_UCLK_BIT))) {
+		freq = dpm_context->dpm_tables.uclk_table.dpm_levels[level].value;
+		ret = smu_cmn_send_smc_msg_with_param(smu,
+						      (max ? SMU_MSG_SetSoftMaxByFreq : SMU_MSG_SetSoftMinByFreq),
+						      (PPCLK_UCLK << 16) | (freq & 0xffff),
+						      NULL);
+		if (ret) {
+			dev_err(smu->adev->dev, "Failed to set soft %s memclk !\n",
+				max ? "max" : "min");
+			return ret;
+		}
+	}
+
+	if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_SOCCLK_BIT) &&
+	    (feature_mask & FEATURE_MASK(FEATURE_DPM_SOCCLK_BIT))) {
+		freq = dpm_context->dpm_tables.soc_table.dpm_levels[level].value;
+		ret = smu_cmn_send_smc_msg_with_param(smu,
+						      (max ? SMU_MSG_SetSoftMaxByFreq : SMU_MSG_SetSoftMinByFreq),
+						      (PPCLK_SOCCLK << 16) | (freq & 0xffff),
+						      NULL);
+		if (ret) {
+			dev_err(smu->adev->dev, "Failed to set soft %s socclk !\n",
+				max ? "max" : "min");
+			return ret;
+		}
+	}
+
+	return ret;
+}
+
+static int aldebaran_force_clk_levels(struct smu_context *smu,
+				      enum smu_clk_type type, uint32_t mask)
+{
+	struct smu_13_0_dpm_context *dpm_context = smu->smu_dpm.dpm_context;
+	struct smu_13_0_dpm_table *single_dpm_table = NULL;
+	uint32_t soft_min_level, soft_max_level;
+	int ret = 0;
+
+	soft_min_level = mask ? (ffs(mask) - 1) : 0;
+	soft_max_level = mask ? (fls(mask) - 1) : 0;
+
+	switch (type) {
+	case SMU_SCLK:
+		single_dpm_table = &(dpm_context->dpm_tables.gfx_table);
+		if (soft_max_level >= single_dpm_table->count) {
+			dev_err(smu->adev->dev, "Clock level specified %d is over max allowed %d\n",
+				soft_max_level, single_dpm_table->count - 1);
+			ret = -EINVAL;
+			break;
+		}
+
+		ret = aldebaran_upload_dpm_level(smu,
+						 false,
+						 FEATURE_MASK(FEATURE_DPM_GFXCLK_BIT),
+						 soft_min_level);
+		if (ret) {
+			dev_err(smu->adev->dev, "Failed to upload boot level to lowest!\n");
+			break;
+		}
+
+		ret = aldebaran_upload_dpm_level(smu,
+						 true,
+						 FEATURE_MASK(FEATURE_DPM_GFXCLK_BIT),
+						 soft_max_level);
+		if (ret)
+			dev_err(smu->adev->dev, "Failed to upload dpm max level to highest!\n");
+
+		break;
+
+	case SMU_MCLK:
+	case SMU_SOCCLK:
+	case SMU_FCLK:
+		/*
+		 * Should not arrive here since aldebaran does not
+		 * support mclk/socclk/fclk softmin/softmax settings
+		 */
+		ret = -EINVAL;
+		break;
+
+	default:
+		break;
+	}
+
+	return ret;
+}
+
+static int aldebaran_get_thermal_temperature_range(struct smu_context *smu,
+						   struct smu_temperature_range *range)
+{
+	struct smu_table_context *table_context = &smu->smu_table;
+	struct smu_13_0_powerplay_table *powerplay_table =
+		table_context->power_play_table;
+	PPTable_t *pptable = smu->smu_table.driver_pptable;
+
+	if (!range)
+		return -EINVAL;
+
+	memcpy(range, &smu13_thermal_policy[0], sizeof(struct smu_temperature_range));
+
+	range->hotspot_crit_max = pptable->ThotspotLimit *
+		SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
+	range->hotspot_emergency_max = (pptable->ThotspotLimit + CTF_OFFSET_HOTSPOT) *
+		SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
+	range->mem_crit_max = pptable->TmemLimit *
+		SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
+	range->mem_emergency_max = (pptable->TmemLimit + CTF_OFFSET_MEM)*
+		SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
+	range->software_shutdown_temp = powerplay_table->software_shutdown_temp;
+
+	return 0;
+}
+
+static int aldebaran_get_current_activity_percent(struct smu_context *smu,
+						  enum amd_pp_sensors sensor,
+						  uint32_t *value)
+{
+	int ret = 0;
+
+	if (!value)
+		return -EINVAL;
+
+	switch (sensor) {
+	case AMDGPU_PP_SENSOR_GPU_LOAD:
+		ret = aldebaran_get_smu_metrics_data(smu,
+						     METRICS_AVERAGE_GFXACTIVITY,
+						     value);
+		break;
+	case AMDGPU_PP_SENSOR_MEM_LOAD:
+		ret = aldebaran_get_smu_metrics_data(smu,
+						     METRICS_AVERAGE_MEMACTIVITY,
+						     value);
+		break;
+	default:
+		dev_err(smu->adev->dev, "Invalid sensor for retrieving clock activity\n");
+		return -EINVAL;
+	}
+
+	return ret;
+}
+
+static int aldebaran_get_gpu_power(struct smu_context *smu, uint32_t *value)
+{
+	if (!value)
+		return -EINVAL;
+
+	return aldebaran_get_smu_metrics_data(smu,
+					      METRICS_AVERAGE_SOCKETPOWER,
+					      value);
+}
+
+static int aldebaran_thermal_get_temperature(struct smu_context *smu,
+					     enum amd_pp_sensors sensor,
+					     uint32_t *value)
+{
+	int ret = 0;
+
+	if (!value)
+		return -EINVAL;
+
+	switch (sensor) {
+	case AMDGPU_PP_SENSOR_HOTSPOT_TEMP:
+		ret = aldebaran_get_smu_metrics_data(smu,
+						     METRICS_TEMPERATURE_HOTSPOT,
+						     value);
+		break;
+	case AMDGPU_PP_SENSOR_EDGE_TEMP:
+		ret = aldebaran_get_smu_metrics_data(smu,
+						     METRICS_TEMPERATURE_EDGE,
+						     value);
+		break;
+	case AMDGPU_PP_SENSOR_MEM_TEMP:
+		ret = aldebaran_get_smu_metrics_data(smu,
+						     METRICS_TEMPERATURE_MEM,
+						     value);
+		break;
+	default:
+		dev_err(smu->adev->dev, "Invalid sensor for retrieving temp\n");
+		return -EINVAL;
+	}
+
+	return ret;
+}
+
+static int aldebaran_read_sensor(struct smu_context *smu,
+				 enum amd_pp_sensors sensor,
+				 void *data, uint32_t *size)
+{
+	int ret = 0;
+
+	if (amdgpu_ras_intr_triggered())
+		return 0;
+
+	if (!data || !size)
+		return -EINVAL;
+
+	mutex_lock(&smu->sensor_lock);
+	switch (sensor) {
+	case AMDGPU_PP_SENSOR_MEM_LOAD:
+	case AMDGPU_PP_SENSOR_GPU_LOAD:
+		ret = aldebaran_get_current_activity_percent(smu,
+							     sensor,
+							     (uint32_t *)data);
+		*size = 4;
+		break;
+	case AMDGPU_PP_SENSOR_GPU_POWER:
+		ret = aldebaran_get_gpu_power(smu, (uint32_t *)data);
+		*size = 4;
+		break;
+	case AMDGPU_PP_SENSOR_HOTSPOT_TEMP:
+	case AMDGPU_PP_SENSOR_EDGE_TEMP:
+	case AMDGPU_PP_SENSOR_MEM_TEMP:
+		ret = aldebaran_thermal_get_temperature(smu, sensor,
+							(uint32_t *)data);
+		*size = 4;
+		break;
+	case AMDGPU_PP_SENSOR_GFX_MCLK:
+		ret = aldebaran_get_current_clk_freq_by_table(smu, SMU_UCLK, (uint32_t *)data);
+		/* the output clock frequency in 10K unit */
+		*(uint32_t *)data *= 100;
+		*size = 4;
+		break;
+	case AMDGPU_PP_SENSOR_GFX_SCLK:
+		ret = aldebaran_get_current_clk_freq_by_table(smu, SMU_GFXCLK, (uint32_t *)data);
+		*(uint32_t *)data *= 100;
+		*size = 4;
+		break;
+	case AMDGPU_PP_SENSOR_VDDGFX:
+		ret = smu_v13_0_get_gfx_vdd(smu, (uint32_t *)data);
+		*size = 4;
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+		break;
+	}
+	mutex_unlock(&smu->sensor_lock);
+
+	return ret;
+}
+
+static int aldebaran_get_power_limit(struct smu_context *smu)
+{
+	struct smu_13_0_powerplay_table *powerplay_table =
+		(struct smu_13_0_powerplay_table *)smu->smu_table.power_play_table;
+	PPTable_t *pptable = smu->smu_table.driver_pptable;
+	uint32_t power_limit, od_percent;
+
+	if (smu_v13_0_get_current_power_limit(smu, &power_limit)) {
+		/* the last hope to figure out the ppt limit */
+		if (!pptable) {
+			dev_err(smu->adev->dev, "Cannot get PPT limit due to pptable missing!");
+			return -EINVAL;
+		}
+	}
+	smu->current_power_limit = power_limit;
+
+	if (smu->od_enabled) {
+		od_percent = le32_to_cpu(powerplay_table->overdrive_table.max[SMU_13_0_ODSETTING_POWERPERCENTAGE]);
+
+
+		dev_dbg(smu->adev->dev, "ODSETTING_POWERPERCENTAGE: %d (default: %d)\n", od_percent, power_limit);
+
+		power_limit *= (100 + od_percent);
+		power_limit /= 100;
+	}
+	smu->max_power_limit = power_limit;
+
+	return 0;
+}
+
+static int aldebaran_set_performance_level(struct smu_context *smu,
+					   enum amd_dpm_forced_level level)
+{
+	switch (level) {
+	case AMD_DPM_FORCED_LEVEL_HIGH:
+	case AMD_DPM_FORCED_LEVEL_LOW:
+	case AMD_DPM_FORCED_LEVEL_PROFILE_STANDARD:
+	case AMD_DPM_FORCED_LEVEL_PROFILE_MIN_SCLK:
+	case AMD_DPM_FORCED_LEVEL_PROFILE_MIN_MCLK:
+	case AMD_DPM_FORCED_LEVEL_PROFILE_PEAK:
+	default:
+		break;
+	}
+
+	return smu_v13_0_set_performance_level(smu, level);
+}
+
+static bool aldebaran_is_dpm_running(struct smu_context *smu)
+{
+	int ret = 0;
+	uint32_t feature_mask[2];
+	unsigned long feature_enabled;
+	ret = smu_cmn_get_enabled_mask(smu, feature_mask, 2);
+	feature_enabled = (unsigned long)((uint64_t)feature_mask[0] |
+					  ((uint64_t)feature_mask[1] << 32));
+	return !!(feature_enabled & SMC_DPM_FEATURE);
+}
+
+static void aldebaran_get_unique_id(struct smu_context *smu)
+{
+	struct amdgpu_device *adev = smu->adev;
+	uint32_t top32 = 0, bottom32 = 0;
+	uint64_t id;
+
+	/* Get the SN to turn into a Unique ID */
+	smu_cmn_send_smc_msg(smu, SMU_MSG_ReadSerialNumTop32, &top32);
+	smu_cmn_send_smc_msg(smu, SMU_MSG_ReadSerialNumBottom32, &bottom32);
+
+	id = ((uint64_t)bottom32 << 32) | top32;
+	adev->unique_id = id;
+	/* For aldebaran-and-later, unique_id == serial_number, so convert it to a
+	 * 16-digit HEX string for convenience and backwards-compatibility
+	 */
+	sprintf(adev->serial, "%llx", id);
+}
+
+static bool aldebaran_is_baco_supported(struct smu_context *smu)
+{
+	/* aldebaran is not support baco */
+
+	return false;
+}
+
+static int aldebaran_set_df_cstate(struct smu_context *smu,
+				   enum pp_df_cstate state)
+{
+	return smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_DFCstateControl, state, NULL);
+}
+
+static int aldebaran_allow_xgmi_power_down(struct smu_context *smu, bool en)
+{
+	return smu_cmn_send_smc_msg_with_param(smu,
+					       SMU_MSG_GmiPwrDnControl,
+					       en ? 1 : 0,
+					       NULL);
+}
+
+static const struct throttling_logging_label {
+	uint32_t feature_mask;
+	const char *label;
+} logging_label[] = {
+	{(1U << THROTTLER_TEMP_MEM_BIT), "HBM"},
+	{(1U << THROTTLER_TEMP_VR_GFX_BIT), "VR of GFX rail"},
+	{(1U << THROTTLER_TEMP_VR_MEM_BIT), "VR of HBM rail"},
+	{(1U << THROTTLER_TEMP_VR_SOC_BIT), "VR of SOC rail"},
+};
+static void aldebaran_log_thermal_throttling_event(struct smu_context *smu)
+{
+	int ret;
+	int throttler_idx, throtting_events = 0, buf_idx = 0;
+	struct amdgpu_device *adev = smu->adev;
+	uint32_t throttler_status;
+	char log_buf[256];
+
+	ret = aldebaran_get_smu_metrics_data(smu,
+					     METRICS_THROTTLER_STATUS,
+					     &throttler_status);
+	if (ret)
+		return;
+
+	memset(log_buf, 0, sizeof(log_buf));
+	for (throttler_idx = 0; throttler_idx < ARRAY_SIZE(logging_label);
+	     throttler_idx++) {
+		if (throttler_status & logging_label[throttler_idx].feature_mask) {
+			throtting_events++;
+			buf_idx += snprintf(log_buf + buf_idx,
+					    sizeof(log_buf) - buf_idx,
+					    "%s%s",
+					    throtting_events > 1 ? " and " : "",
+					    logging_label[throttler_idx].label);
+			if (buf_idx >= sizeof(log_buf)) {
+				dev_err(adev->dev, "buffer overflow!\n");
+				log_buf[sizeof(log_buf) - 1] = '\0';
+				break;
+			}
+		}
+	}
+
+	dev_warn(adev->dev, "WARN: GPU thermal throttling temperature reached, expect performance decrease. %s.\n",
+		 log_buf);
+	kgd2kfd_smi_event_throttle(smu->adev->kfd.dev, throttler_status);
+}
+
+static int aldebaran_get_current_pcie_link_speed(struct smu_context *smu)
+{
+	struct amdgpu_device *adev = smu->adev;
+	uint32_t esm_ctrl;
+
+	/* TODO: confirm this on real target */
+	esm_ctrl = RREG32_PCIE(smnPCIE_ESM_CTRL);
+	if ((esm_ctrl >> 15) & 0x1FFFF)
+		return (((esm_ctrl >> 8) & 0x3F) + 128);
+
+	return smu_v13_0_get_current_pcie_link_speed(smu);
+}
+
+static ssize_t aldebaran_get_gpu_metrics(struct smu_context *smu,
+					 void **table)
+{
+	struct smu_table_context *smu_table = &smu->smu_table;
+	struct gpu_metrics_v1_0 *gpu_metrics =
+		(struct gpu_metrics_v1_0 *)smu_table->gpu_metrics_table;
+	SmuMetrics_t metrics;
+	int ret = 0;
+
+	ret = smu_cmn_get_metrics_table(smu,
+					&metrics,
+					true);
+	if (ret)
+		return ret;
+
+	smu_v13_0_init_gpu_metrics_v1_0(gpu_metrics);
+
+	gpu_metrics->temperature_edge = metrics.TemperatureEdge;
+	gpu_metrics->temperature_hotspot = metrics.TemperatureHotspot;
+	gpu_metrics->temperature_mem = metrics.TemperatureHBM;
+	gpu_metrics->temperature_vrgfx = metrics.TemperatureVrGfx;
+	gpu_metrics->temperature_vrsoc = metrics.TemperatureVrSoc;
+	gpu_metrics->temperature_vrmem = metrics.TemperatureVrMem;
+
+	gpu_metrics->average_gfx_activity = metrics.AverageGfxActivity;
+	gpu_metrics->average_umc_activity = metrics.AverageUclkActivity;
+
+	gpu_metrics->average_socket_power = metrics.AverageSocketPower;
+
+	gpu_metrics->average_gfxclk_frequency = metrics.AverageGfxclkFrequency;
+	gpu_metrics->average_socclk_frequency = metrics.AverageSocclkFrequency;
+	gpu_metrics->average_uclk_frequency = metrics.AverageUclkFrequency;
+
+	gpu_metrics->current_gfxclk = metrics.CurrClock[PPCLK_GFXCLK];
+	gpu_metrics->current_socclk = metrics.CurrClock[PPCLK_SOCCLK];
+	gpu_metrics->current_uclk = metrics.CurrClock[PPCLK_UCLK];
+	gpu_metrics->current_vclk0 = metrics.CurrClock[PPCLK_VCLK];
+	gpu_metrics->current_dclk0 = metrics.CurrClock[PPCLK_DCLK];
+
+	gpu_metrics->throttle_status = metrics.ThrottlerStatus;
+
+	gpu_metrics->pcie_link_width =
+		smu_v13_0_get_current_pcie_link_width(smu);
+	gpu_metrics->pcie_link_speed =
+		aldebaran_get_current_pcie_link_speed(smu);
+
+	*table = (void *)gpu_metrics;
+
+	return sizeof(struct gpu_metrics_v1_0);
+}
+
+static const struct pptable_funcs aldebaran_ppt_funcs = {
+	/* init dpm */
+	.get_allowed_feature_mask = aldebaran_get_allowed_feature_mask,
+	/* btc */
+	.run_btc = aldebaran_run_btc,
+	/* dpm/clk tables */
+	.set_default_dpm_table = aldebaran_set_default_dpm_table,
+	.populate_umd_state_clk = aldebaran_populate_umd_state_clk,
+	.get_thermal_temperature_range = aldebaran_get_thermal_temperature_range,
+	.print_clk_levels = aldebaran_print_clk_levels,
+	.force_clk_levels = aldebaran_force_clk_levels,
+	.read_sensor = aldebaran_read_sensor,
+	.set_performance_level = aldebaran_set_performance_level,
+	.get_power_limit = aldebaran_get_power_limit,
+	.is_dpm_running = aldebaran_is_dpm_running,
+	.get_unique_id = aldebaran_get_unique_id,
+	.init_microcode = smu_v13_0_init_microcode,
+	.load_microcode = smu_v13_0_load_microcode,
+	.fini_microcode = smu_v13_0_fini_microcode,
+	.init_smc_tables = aldebaran_init_smc_tables,
+	.fini_smc_tables = smu_v13_0_fini_smc_tables,
+	.init_power = smu_v13_0_init_power,
+	.fini_power = smu_v13_0_fini_power,
+	.check_fw_status = smu_v13_0_check_fw_status,
+	/* pptable related */
+	.setup_pptable = aldebaran_setup_pptable,
+	.get_vbios_bootup_values = smu_v13_0_get_vbios_bootup_values,
+	.check_fw_version = smu_v13_0_check_fw_version,
+	.write_pptable = smu_cmn_write_pptable,
+	.set_driver_table_location = smu_v13_0_set_driver_table_location,
+	.set_tool_table_location = smu_v13_0_set_tool_table_location,
+	.notify_memory_pool_location = smu_v13_0_notify_memory_pool_location,
+	.system_features_control = smu_v13_0_system_features_control,
+	.send_smc_msg_with_param = smu_cmn_send_smc_msg_with_param,
+	.send_smc_msg = smu_cmn_send_smc_msg,
+	.get_enabled_mask = smu_cmn_get_enabled_mask,
+	.feature_is_enabled = smu_cmn_feature_is_enabled,
+	.disable_all_features_with_exception = smu_cmn_disable_all_features_with_exception,
+	.set_power_limit = smu_v13_0_set_power_limit,
+	.init_max_sustainable_clocks = smu_v13_0_init_max_sustainable_clocks,
+	.enable_thermal_alert = smu_v13_0_enable_thermal_alert,
+	.disable_thermal_alert = smu_v13_0_disable_thermal_alert,
+	.set_xgmi_pstate = smu_v13_0_set_xgmi_pstate,
+	.register_irq_handler = smu_v13_0_register_irq_handler,
+	.set_azalia_d3_pme = smu_v13_0_set_azalia_d3_pme,
+	.get_max_sustainable_clocks_by_dc = smu_v13_0_get_max_sustainable_clocks_by_dc,
+	.baco_is_support= aldebaran_is_baco_supported,
+	.get_dpm_ultimate_freq = smu_v13_0_get_dpm_ultimate_freq,
+	.set_soft_freq_limited_range = smu_v13_0_set_soft_freq_limited_range,
+	.set_df_cstate = aldebaran_set_df_cstate,
+	.allow_xgmi_power_down = aldebaran_allow_xgmi_power_down,
+	.log_thermal_throttling_event = aldebaran_log_thermal_throttling_event,
+	.get_pp_feature_mask = smu_cmn_get_pp_feature_mask,
+	.set_pp_feature_mask = smu_cmn_set_pp_feature_mask,
+	.get_gpu_metrics = aldebaran_get_gpu_metrics,
+};
+
+void aldebaran_set_ppt_funcs(struct smu_context *smu)
+{
+	smu->ppt_funcs = &aldebaran_ppt_funcs;
+	smu->message_map = aldebaran_message_map;
+	smu->clock_map = aldebaran_clk_map;
+	smu->feature_map = aldebaran_feature_mask_map;
+	smu->table_map = aldebaran_table_map;
+}
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.h b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.h
new file mode 100644
index 000000000000..33a85d57cf15
--- /dev/null
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.h
@@ -0,0 +1,72 @@
+/*
+ * Copyright 2019 Advanced Micro Devices, Inc.
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
+#ifndef __ALDEBARAN_PPT_H__
+#define __ALDEBARAN_PPT_H__
+
+#define ALDEBARAN_UMD_PSTATE_GFXCLK_LEVEL         0x3
+#define ALDEBARAN_UMD_PSTATE_SOCCLK_LEVEL         0x3
+#define ALDEBARAN_UMD_PSTATE_MCLK_LEVEL           0x2
+
+#define MAX_DPM_NUMBER 16
+#define MAX_PCIE_CONF 2
+
+struct aldebaran_dpm_level {
+	bool            enabled;
+	uint32_t        value;
+	uint32_t        param1;
+};
+
+struct aldebaran_dpm_state {
+	uint32_t  soft_min_level;
+	uint32_t  soft_max_level;
+	uint32_t  hard_min_level;
+	uint32_t  hard_max_level;
+};
+
+struct aldebaran_single_dpm_table {
+	uint32_t                count;
+	struct aldebaran_dpm_state dpm_state;
+	struct aldebaran_dpm_level dpm_levels[MAX_DPM_NUMBER];
+};
+
+struct aldebaran_pcie_table {
+	uint16_t count;
+	uint8_t  pcie_gen[MAX_PCIE_CONF];
+	uint8_t  pcie_lane[MAX_PCIE_CONF];
+	uint32_t lclk[MAX_PCIE_CONF];
+};
+
+struct aldebaran_dpm_table {
+	struct aldebaran_single_dpm_table  soc_table;
+	struct aldebaran_single_dpm_table  gfx_table;
+	struct aldebaran_single_dpm_table  mem_table;
+	struct aldebaran_single_dpm_table  eclk_table;
+	struct aldebaran_single_dpm_table  vclk_table;
+	struct aldebaran_single_dpm_table  dclk_table;
+	struct aldebaran_single_dpm_table  fclk_table;
+	struct aldebaran_pcie_table        pcie_table;
+};
+
+extern void aldebaran_set_ppt_funcs(struct smu_context *smu);
+
+#endif
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
new file mode 100644
index 000000000000..20fff2fda13f
--- /dev/null
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
@@ -0,0 +1,1790 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
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
+ */
+
+#include <linux/firmware.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/reboot.h>
+
+#define SMU_13_0_PARTIAL_PPTABLE
+#define SWSMU_CODE_LAYER_L3
+
+#include "amdgpu.h"
+#include "amdgpu_smu.h"
+#include "atomfirmware.h"
+#include "amdgpu_atomfirmware.h"
+#include "amdgpu_atombios.h"
+#include "smu_v13_0.h"
+#include "soc15_common.h"
+#include "atom.h"
+#include "amdgpu_ras.h"
+#include "smu_cmn.h"
+
+#include "asic_reg/thm/thm_13_0_2_offset.h"
+#include "asic_reg/thm/thm_13_0_2_sh_mask.h"
+#include "asic_reg/mp/mp_13_0_2_offset.h"
+#include "asic_reg/mp/mp_13_0_2_sh_mask.h"
+#include "asic_reg/smuio/smuio_13_0_2_offset.h"
+#include "asic_reg/smuio/smuio_13_0_2_sh_mask.h"
+
+/*
+ * DO NOT use these for err/warn/info/debug messages.
+ * Use dev_err, dev_warn, dev_info and dev_dbg instead.
+ * They are more MGPU friendly.
+ */
+#undef pr_err
+#undef pr_warn
+#undef pr_info
+#undef pr_debug
+
+MODULE_FIRMWARE("amdgpu/aldebaran_smc.bin");
+
+#define SMU13_VOLTAGE_SCALE 4
+
+#define SMU13_MODE1_RESET_WAIT_TIME_IN_MS 500  //500ms
+
+#define LINK_WIDTH_MAX				6
+#define LINK_SPEED_MAX				3
+
+#define smnPCIE_LC_LINK_WIDTH_CNTL		0x11140288
+#define PCIE_LC_LINK_WIDTH_CNTL__LC_LINK_WIDTH_RD_MASK 0x00000070L
+#define PCIE_LC_LINK_WIDTH_CNTL__LC_LINK_WIDTH_RD__SHIFT 0x4
+#define smnPCIE_LC_SPEED_CNTL			0x11140290
+#define PCIE_LC_SPEED_CNTL__LC_CURRENT_DATA_RATE_MASK 0xC000
+#define PCIE_LC_SPEED_CNTL__LC_CURRENT_DATA_RATE__SHIFT 0xE
+
+static int link_width[] = {0, 1, 2, 4, 8, 12, 16};
+static int link_speed[] = {25, 50, 80, 160};
+
+int smu_v13_0_init_microcode(struct smu_context *smu)
+{
+	struct amdgpu_device *adev = smu->adev;
+	const char *chip_name;
+	char fw_name[30];
+	int err = 0;
+	const struct smc_firmware_header_v1_0 *hdr;
+	const struct common_firmware_header *header;
+	struct amdgpu_firmware_info *ucode = NULL;
+
+	switch (adev->asic_type) {
+	case CHIP_ALDEBARAN:
+		chip_name = "aldebaran";
+		break;
+	default:
+		dev_err(adev->dev, "Unsupported ASIC type %d\n", adev->asic_type);
+		return -EINVAL;
+	}
+
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_smc.bin", chip_name);
+
+	err = request_firmware(&adev->pm.fw, fw_name, adev->dev);
+	if (err)
+		goto out;
+	err = amdgpu_ucode_validate(adev->pm.fw);
+	if (err)
+		goto out;
+
+	hdr = (const struct smc_firmware_header_v1_0 *) adev->pm.fw->data;
+	amdgpu_ucode_print_smc_hdr(&hdr->header);
+	adev->pm.fw_version = le32_to_cpu(hdr->header.ucode_version);
+
+	if (adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) {
+		ucode = &adev->firmware.ucode[AMDGPU_UCODE_ID_SMC];
+		ucode->ucode_id = AMDGPU_UCODE_ID_SMC;
+		ucode->fw = adev->pm.fw;
+		header = (const struct common_firmware_header *)ucode->fw->data;
+		adev->firmware.fw_size +=
+			ALIGN(le32_to_cpu(header->ucode_size_bytes), PAGE_SIZE);
+	}
+
+out:
+	if (err) {
+		DRM_ERROR("smu_v13_0: Failed to load firmware \"%s\"\n",
+			  fw_name);
+		release_firmware(adev->pm.fw);
+		adev->pm.fw = NULL;
+	}
+	return err;
+}
+
+void smu_v13_0_fini_microcode(struct smu_context *smu)
+{
+	struct amdgpu_device *adev = smu->adev;
+
+	release_firmware(adev->pm.fw);
+	adev->pm.fw = NULL;
+	adev->pm.fw_version = 0;
+}
+
+int smu_v13_0_load_microcode(struct smu_context *smu)
+{
+#if 0
+	struct amdgpu_device *adev = smu->adev;
+	const uint32_t *src;
+	const struct smc_firmware_header_v1_0 *hdr;
+	uint32_t addr_start = MP1_SRAM;
+	uint32_t i;
+	uint32_t smc_fw_size;
+	uint32_t mp1_fw_flags;
+
+	hdr = (const struct smc_firmware_header_v1_0 *) adev->pm.fw->data;
+	src = (const uint32_t *)(adev->pm.fw->data +
+				 le32_to_cpu(hdr->header.ucode_array_offset_bytes));
+	smc_fw_size = hdr->header.ucode_size_bytes;
+
+	for (i = 1; i < smc_fw_size/4 - 1; i++) {
+		WREG32_PCIE(addr_start, src[i]);
+		addr_start += 4;
+	}
+
+	WREG32_PCIE(MP1_Public | (smnMP1_PUB_CTRL & 0xffffffff),
+		    1 & MP1_SMN_PUB_CTRL__RESET_MASK);
+	WREG32_PCIE(MP1_Public | (smnMP1_PUB_CTRL & 0xffffffff),
+		    1 & ~MP1_SMN_PUB_CTRL__RESET_MASK);
+
+	for (i = 0; i < adev->usec_timeout; i++) {
+		mp1_fw_flags = RREG32_PCIE(MP1_Public |
+					   (smnMP1_FIRMWARE_FLAGS & 0xffffffff));
+		if ((mp1_fw_flags & MP1_FIRMWARE_FLAGS__INTERRUPTS_ENABLED_MASK) >>
+		    MP1_FIRMWARE_FLAGS__INTERRUPTS_ENABLED__SHIFT)
+			break;
+		udelay(1);
+	}
+
+	if (i == adev->usec_timeout)
+		return -ETIME;
+#endif
+	return 0;
+}
+
+int smu_v13_0_check_fw_status(struct smu_context *smu)
+{
+	struct amdgpu_device *adev = smu->adev;
+	uint32_t mp1_fw_flags;
+
+	mp1_fw_flags = RREG32_PCIE(MP1_Public |
+				   (smnMP1_FIRMWARE_FLAGS & 0xffffffff));
+
+	if ((mp1_fw_flags & MP1_FIRMWARE_FLAGS__INTERRUPTS_ENABLED_MASK) >>
+	    MP1_FIRMWARE_FLAGS__INTERRUPTS_ENABLED__SHIFT)
+		return 0;
+
+	return -EIO;
+}
+
+int smu_v13_0_check_fw_version(struct smu_context *smu)
+{
+	uint32_t if_version = 0xff, smu_version = 0xff;
+	uint16_t smu_major;
+	uint8_t smu_minor, smu_debug;
+	int ret = 0;
+
+	ret = smu_cmn_get_smc_version(smu, &if_version, &smu_version);
+	if (ret)
+		return ret;
+
+	smu_major = (smu_version >> 16) & 0xffff;
+	smu_minor = (smu_version >> 8) & 0xff;
+	smu_debug = (smu_version >> 0) & 0xff;
+
+	switch (smu->adev->asic_type) {
+	case CHIP_ALDEBARAN:
+		smu->smc_driver_if_version = SMU13_DRIVER_IF_VERSION_ALDE;
+		break;
+	default:
+		dev_err(smu->adev->dev, "smu unsupported asic type:%d.\n", smu->adev->asic_type);
+		smu->smc_driver_if_version = SMU13_DRIVER_IF_VERSION_INV;
+		break;
+	}
+
+	/*
+	 * 1. if_version mismatch is not critical as our fw is designed
+	 * to be backward compatible.
+	 * 2. New fw usually brings some optimizations. But that's visible
+	 * only on the paired driver.
+	 * Considering above, we just leave user a warning message instead
+	 * of halt driver loading.
+	 */
+	if (if_version != smu->smc_driver_if_version) {
+		dev_info(smu->adev->dev, "smu driver if version = 0x%08x, smu fw if version = 0x%08x, "
+			 "smu fw version = 0x%08x (%d.%d.%d)\n",
+			 smu->smc_driver_if_version, if_version,
+			 smu_version, smu_major, smu_minor, smu_debug);
+		dev_warn(smu->adev->dev, "SMU driver if version not matched\n");
+	}
+
+	return ret;
+}
+
+static int smu_v13_0_set_pptable_v2_1(struct smu_context *smu, void **table,
+				      uint32_t *size, uint32_t pptable_id)
+{
+	struct amdgpu_device *adev = smu->adev;
+	const struct smc_firmware_header_v2_1 *v2_1;
+	struct smc_soft_pptable_entry *entries;
+	uint32_t pptable_count = 0;
+	int i = 0;
+
+	v2_1 = (const struct smc_firmware_header_v2_1 *) adev->pm.fw->data;
+	entries = (struct smc_soft_pptable_entry *)
+		((uint8_t *)v2_1 + le32_to_cpu(v2_1->pptable_entry_offset));
+	pptable_count = le32_to_cpu(v2_1->pptable_count);
+	for (i = 0; i < pptable_count; i++) {
+		if (le32_to_cpu(entries[i].id) == pptable_id) {
+			*table = ((uint8_t *)v2_1 + le32_to_cpu(entries[i].ppt_offset_bytes));
+			*size = le32_to_cpu(entries[i].ppt_size_bytes);
+			break;
+		}
+	}
+
+	if (i == pptable_count)
+		return -EINVAL;
+
+	return 0;
+}
+
+int smu_v13_0_setup_pptable(struct smu_context *smu)
+{
+	struct amdgpu_device *adev = smu->adev;
+	const struct smc_firmware_header_v1_0 *hdr;
+	int ret, index;
+	uint32_t size = 0;
+	uint16_t atom_table_size;
+	uint8_t frev, crev;
+	void *table;
+	uint16_t version_major, version_minor;
+
+	/* temporarily hardcode */
+	smu->smu_table.boot_values.pp_table_id = 3000;
+
+	hdr = (const struct smc_firmware_header_v1_0 *) adev->pm.fw->data;
+	version_major = le16_to_cpu(hdr->header.header_version_major);
+	version_minor = le16_to_cpu(hdr->header.header_version_minor);
+	if (version_major == 2 && smu->smu_table.boot_values.pp_table_id > 0) {
+		dev_info(adev->dev, "use driver provided pptable %d\n", smu->smu_table.boot_values.pp_table_id);
+		switch (version_minor) {
+		case 1:
+			ret = smu_v13_0_set_pptable_v2_1(smu, &table, &size,
+							 smu->smu_table.boot_values.pp_table_id);
+			break;
+		default:
+			ret = -EINVAL;
+			break;
+		}
+		if (ret)
+			return ret;
+
+	} else {
+		dev_info(adev->dev, "use vbios provided pptable\n");
+		index = get_index_into_master_table(atom_master_list_of_data_tables_v2_1,
+						    powerplayinfo);
+
+		ret = amdgpu_atombios_get_data_table(adev, index, &atom_table_size, &frev, &crev,
+						     (uint8_t **)&table);
+		if (ret)
+			return ret;
+		size = atom_table_size;
+	}
+
+	if (!smu->smu_table.power_play_table)
+		smu->smu_table.power_play_table = table;
+	if (!smu->smu_table.power_play_table_size)
+		smu->smu_table.power_play_table_size = size;
+
+	return 0;
+}
+
+int smu_v13_0_init_smc_tables(struct smu_context *smu)
+{
+	struct smu_table_context *smu_table = &smu->smu_table;
+	struct smu_table *tables = smu_table->tables;
+	int ret = 0;
+
+	smu_table->driver_pptable =
+		kzalloc(tables[SMU_TABLE_PPTABLE].size, GFP_KERNEL);
+	if (!smu_table->driver_pptable) {
+		ret = -ENOMEM;
+		goto err0_out;
+	}
+
+	smu_table->max_sustainable_clocks =
+		kzalloc(sizeof(struct smu_13_0_max_sustainable_clocks), GFP_KERNEL);
+	if (!smu_table->max_sustainable_clocks) {
+		ret = -ENOMEM;
+		goto err1_out;
+	}
+
+	/* Aldebaran does not support OVERDRIVE */
+	if (tables[SMU_TABLE_OVERDRIVE].size) {
+		smu_table->overdrive_table =
+			kzalloc(tables[SMU_TABLE_OVERDRIVE].size, GFP_KERNEL);
+		if (!smu_table->overdrive_table) {
+			ret = -ENOMEM;
+			goto err2_out;
+		}
+
+		smu_table->boot_overdrive_table =
+			kzalloc(tables[SMU_TABLE_OVERDRIVE].size, GFP_KERNEL);
+		if (!smu_table->boot_overdrive_table) {
+			ret = -ENOMEM;
+			goto err3_out;
+		}
+	}
+
+	return 0;
+
+err3_out:
+	kfree(smu_table->overdrive_table);
+err2_out:
+	kfree(smu_table->max_sustainable_clocks);
+err1_out:
+	kfree(smu_table->driver_pptable);
+err0_out:
+	return ret;
+}
+
+int smu_v13_0_fini_smc_tables(struct smu_context *smu)
+{
+	struct smu_table_context *smu_table = &smu->smu_table;
+	struct smu_dpm_context *smu_dpm = &smu->smu_dpm;
+
+	kfree(smu_table->gpu_metrics_table);
+	kfree(smu_table->boot_overdrive_table);
+	kfree(smu_table->overdrive_table);
+	kfree(smu_table->max_sustainable_clocks);
+	kfree(smu_table->driver_pptable);
+	smu_table->gpu_metrics_table = NULL;
+	smu_table->boot_overdrive_table = NULL;
+	smu_table->overdrive_table = NULL;
+	smu_table->max_sustainable_clocks = NULL;
+	smu_table->driver_pptable = NULL;
+	kfree(smu_table->hardcode_pptable);
+	smu_table->hardcode_pptable = NULL;
+
+	kfree(smu_table->metrics_table);
+	kfree(smu_table->watermarks_table);
+	smu_table->metrics_table = NULL;
+	smu_table->watermarks_table = NULL;
+	smu_table->metrics_time = 0;
+
+	kfree(smu_dpm->dpm_context);
+	kfree(smu_dpm->golden_dpm_context);
+	kfree(smu_dpm->dpm_current_power_state);
+	kfree(smu_dpm->dpm_request_power_state);
+	smu_dpm->dpm_context = NULL;
+	smu_dpm->golden_dpm_context = NULL;
+	smu_dpm->dpm_context_size = 0;
+	smu_dpm->dpm_current_power_state = NULL;
+	smu_dpm->dpm_request_power_state = NULL;
+
+	return 0;
+}
+
+int smu_v13_0_init_power(struct smu_context *smu)
+{
+	struct smu_power_context *smu_power = &smu->smu_power;
+
+	if (smu_power->power_context || smu_power->power_context_size != 0)
+		return -EINVAL;
+
+	smu_power->power_context = kzalloc(sizeof(struct smu_13_0_dpm_context),
+					   GFP_KERNEL);
+	if (!smu_power->power_context)
+		return -ENOMEM;
+	smu_power->power_context_size = sizeof(struct smu_13_0_dpm_context);
+
+	return 0;
+}
+
+int smu_v13_0_fini_power(struct smu_context *smu)
+{
+	struct smu_power_context *smu_power = &smu->smu_power;
+
+	if (!smu_power->power_context || smu_power->power_context_size == 0)
+		return -EINVAL;
+
+	kfree(smu_power->power_context);
+	smu_power->power_context = NULL;
+	smu_power->power_context_size = 0;
+
+	return 0;
+}
+
+static int smu_v13_0_atom_get_smu_clockinfo(struct amdgpu_device *adev,
+					    uint8_t clk_id,
+					    uint8_t syspll_id,
+					    uint32_t *clk_freq)
+{
+	struct atom_get_smu_clock_info_parameters_v3_1 input = {0};
+	struct atom_get_smu_clock_info_output_parameters_v3_1 *output;
+	int ret, index;
+
+	input.clk_id = clk_id;
+	input.syspll_id = syspll_id;
+	input.command = GET_SMU_CLOCK_INFO_V3_1_GET_CLOCK_FREQ;
+	index = get_index_into_master_table(atom_master_list_of_command_functions_v2_1,
+					    getsmuclockinfo);
+
+	ret = amdgpu_atom_execute_table(adev->mode_info.atom_context, index,
+					(uint32_t *)&input);
+	if (ret)
+		return -EINVAL;
+
+	output = (struct atom_get_smu_clock_info_output_parameters_v3_1 *)&input;
+	*clk_freq = le32_to_cpu(output->atom_smu_outputclkfreq.smu_clock_freq_hz) / 10000;
+
+	return 0;
+}
+
+int smu_v13_0_get_vbios_bootup_values(struct smu_context *smu)
+{
+	int ret, index;
+	uint16_t size;
+	uint8_t frev, crev;
+	struct atom_common_table_header *header;
+	struct atom_firmware_info_v3_3 *v_3_3;
+	struct atom_firmware_info_v3_1 *v_3_1;
+
+	index = get_index_into_master_table(atom_master_list_of_data_tables_v2_1,
+					    firmwareinfo);
+
+	ret = amdgpu_atombios_get_data_table(smu->adev, index, &size, &frev, &crev,
+					     (uint8_t **)&header);
+	if (ret)
+		return ret;
+
+	if (header->format_revision != 3) {
+		dev_err(smu->adev->dev, "unknown atom_firmware_info version! for smu13\n");
+		return -EINVAL;
+	}
+
+	switch (header->content_revision) {
+	case 0:
+	case 1:
+	case 2:
+		v_3_1 = (struct atom_firmware_info_v3_1 *)header;
+		smu->smu_table.boot_values.revision = v_3_1->firmware_revision;
+		smu->smu_table.boot_values.gfxclk = v_3_1->bootup_sclk_in10khz;
+		smu->smu_table.boot_values.uclk = v_3_1->bootup_mclk_in10khz;
+		smu->smu_table.boot_values.socclk = 0;
+		smu->smu_table.boot_values.dcefclk = 0;
+		smu->smu_table.boot_values.vddc = v_3_1->bootup_vddc_mv;
+		smu->smu_table.boot_values.vddci = v_3_1->bootup_vddci_mv;
+		smu->smu_table.boot_values.mvddc = v_3_1->bootup_mvddc_mv;
+		smu->smu_table.boot_values.vdd_gfx = v_3_1->bootup_vddgfx_mv;
+		smu->smu_table.boot_values.cooling_id = v_3_1->coolingsolution_id;
+		smu->smu_table.boot_values.pp_table_id = 0;
+		break;
+	case 3:
+	default:
+		v_3_3 = (struct atom_firmware_info_v3_3 *)header;
+		smu->smu_table.boot_values.revision = v_3_3->firmware_revision;
+		smu->smu_table.boot_values.gfxclk = v_3_3->bootup_sclk_in10khz;
+		smu->smu_table.boot_values.uclk = v_3_3->bootup_mclk_in10khz;
+		smu->smu_table.boot_values.socclk = 0;
+		smu->smu_table.boot_values.dcefclk = 0;
+		smu->smu_table.boot_values.vddc = v_3_3->bootup_vddc_mv;
+		smu->smu_table.boot_values.vddci = v_3_3->bootup_vddci_mv;
+		smu->smu_table.boot_values.mvddc = v_3_3->bootup_mvddc_mv;
+		smu->smu_table.boot_values.vdd_gfx = v_3_3->bootup_vddgfx_mv;
+		smu->smu_table.boot_values.cooling_id = v_3_3->coolingsolution_id;
+		smu->smu_table.boot_values.pp_table_id = v_3_3->pplib_pptable_id;
+	}
+
+	smu->smu_table.boot_values.format_revision = header->format_revision;
+	smu->smu_table.boot_values.content_revision = header->content_revision;
+
+	smu_v13_0_atom_get_smu_clockinfo(smu->adev,
+					 (uint8_t)SMU11_SYSPLL0_SOCCLK_ID,
+					 (uint8_t)0,
+					 &smu->smu_table.boot_values.socclk);
+
+	smu_v13_0_atom_get_smu_clockinfo(smu->adev,
+					 (uint8_t)SMU11_SYSPLL0_DCEFCLK_ID,
+					 (uint8_t)0,
+					 &smu->smu_table.boot_values.dcefclk);
+
+	smu_v13_0_atom_get_smu_clockinfo(smu->adev,
+					 (uint8_t)SMU11_SYSPLL0_ECLK_ID,
+					 (uint8_t)0,
+					 &smu->smu_table.boot_values.eclk);
+
+	smu_v13_0_atom_get_smu_clockinfo(smu->adev,
+					 (uint8_t)SMU11_SYSPLL0_VCLK_ID,
+					 (uint8_t)0,
+					 &smu->smu_table.boot_values.vclk);
+
+	smu_v13_0_atom_get_smu_clockinfo(smu->adev,
+					 (uint8_t)SMU11_SYSPLL0_DCLK_ID,
+					 (uint8_t)0,
+					 &smu->smu_table.boot_values.dclk);
+
+	if ((smu->smu_table.boot_values.format_revision == 3) &&
+	    (smu->smu_table.boot_values.content_revision >= 2))
+		smu_v13_0_atom_get_smu_clockinfo(smu->adev,
+						 (uint8_t)SMU11_SYSPLL1_0_FCLK_ID,
+						 (uint8_t)SMU11_SYSPLL1_2_ID,
+						 &smu->smu_table.boot_values.fclk);
+
+	return 0;
+}
+
+int smu_v13_0_notify_memory_pool_location(struct smu_context *smu)
+{
+	struct smu_table_context *smu_table = &smu->smu_table;
+	struct smu_table *memory_pool = &smu_table->memory_pool;
+	int ret = 0;
+	uint64_t address;
+	uint32_t address_low, address_high;
+
+	if (memory_pool->size == 0 || memory_pool->cpu_addr == NULL)
+		return ret;
+
+	address = (uintptr_t)memory_pool->cpu_addr;
+	address_high = (uint32_t)upper_32_bits(address);
+	address_low  = (uint32_t)lower_32_bits(address);
+
+	ret = smu_cmn_send_smc_msg_with_param(smu,
+					      SMU_MSG_SetSystemVirtualDramAddrHigh,
+					      address_high,
+					      NULL);
+	if (ret)
+		return ret;
+	ret = smu_cmn_send_smc_msg_with_param(smu,
+					      SMU_MSG_SetSystemVirtualDramAddrLow,
+					      address_low,
+					      NULL);
+	if (ret)
+		return ret;
+
+	address = memory_pool->mc_address;
+	address_high = (uint32_t)upper_32_bits(address);
+	address_low  = (uint32_t)lower_32_bits(address);
+
+	ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_DramLogSetDramAddrHigh,
+					      address_high, NULL);
+	if (ret)
+		return ret;
+	ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_DramLogSetDramAddrLow,
+					      address_low, NULL);
+	if (ret)
+		return ret;
+	ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_DramLogSetDramSize,
+					      (uint32_t)memory_pool->size, NULL);
+	if (ret)
+		return ret;
+
+	return ret;
+}
+
+int smu_v13_0_set_min_deep_sleep_dcefclk(struct smu_context *smu, uint32_t clk)
+{
+	int ret;
+
+	ret = smu_cmn_send_smc_msg_with_param(smu,
+					      SMU_MSG_SetMinDeepSleepDcefclk, clk, NULL);
+	if (ret)
+		dev_err(smu->adev->dev, "SMU13 attempt to set divider for DCEFCLK Failed!");
+
+	return ret;
+}
+
+int smu_v13_0_set_driver_table_location(struct smu_context *smu)
+{
+	struct smu_table *driver_table = &smu->smu_table.driver_table;
+	int ret = 0;
+
+	if (driver_table->mc_address) {
+		ret = smu_cmn_send_smc_msg_with_param(smu,
+						      SMU_MSG_SetDriverDramAddrHigh,
+						      upper_32_bits(driver_table->mc_address),
+						      NULL);
+		if (!ret)
+			ret = smu_cmn_send_smc_msg_with_param(smu,
+							      SMU_MSG_SetDriverDramAddrLow,
+							      lower_32_bits(driver_table->mc_address),
+							      NULL);
+	}
+
+	return ret;
+}
+
+int smu_v13_0_set_tool_table_location(struct smu_context *smu)
+{
+	int ret = 0;
+	struct smu_table *tool_table = &smu->smu_table.tables[SMU_TABLE_PMSTATUSLOG];
+
+	if (tool_table->mc_address) {
+		ret = smu_cmn_send_smc_msg_with_param(smu,
+						      SMU_MSG_SetToolsDramAddrHigh,
+						      upper_32_bits(tool_table->mc_address),
+						      NULL);
+		if (!ret)
+			ret = smu_cmn_send_smc_msg_with_param(smu,
+							      SMU_MSG_SetToolsDramAddrLow,
+							      lower_32_bits(tool_table->mc_address),
+							      NULL);
+	}
+
+	return ret;
+}
+
+int smu_v13_0_init_display_count(struct smu_context *smu, uint32_t count)
+{
+	int ret = 0;
+
+	if (!smu->pm_enabled)
+		return ret;
+
+	ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_NumOfDisplays, count, NULL);
+
+	return ret;
+}
+
+
+int smu_v13_0_set_allowed_mask(struct smu_context *smu)
+{
+	struct smu_feature *feature = &smu->smu_feature;
+	int ret = 0;
+	uint32_t feature_mask[2];
+
+	mutex_lock(&feature->mutex);
+	if (bitmap_empty(feature->allowed, SMU_FEATURE_MAX) || feature->feature_num < 64)
+		goto failed;
+
+	bitmap_copy((unsigned long *)feature_mask, feature->allowed, 64);
+
+	ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_SetAllowedFeaturesMaskHigh,
+					      feature_mask[1], NULL);
+	if (ret)
+		goto failed;
+
+	ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_SetAllowedFeaturesMaskLow,
+					      feature_mask[0], NULL);
+	if (ret)
+		goto failed;
+
+failed:
+	mutex_unlock(&feature->mutex);
+	return ret;
+}
+
+int smu_v13_0_system_features_control(struct smu_context *smu,
+				      bool en)
+{
+	struct smu_feature *feature = &smu->smu_feature;
+	uint32_t feature_mask[2];
+	int ret = 0;
+
+	ret = smu_cmn_send_smc_msg(smu, (en ? SMU_MSG_EnableAllSmuFeatures :
+					 SMU_MSG_DisableAllSmuFeatures), NULL);
+	if (ret)
+		return ret;
+
+	bitmap_zero(feature->enabled, feature->feature_num);
+	bitmap_zero(feature->supported, feature->feature_num);
+
+	if (en) {
+		ret = smu_cmn_get_enabled_mask(smu, feature_mask, 2);
+		if (ret)
+			return ret;
+
+		bitmap_copy(feature->enabled, (unsigned long *)&feature_mask,
+			    feature->feature_num);
+		bitmap_copy(feature->supported, (unsigned long *)&feature_mask,
+			    feature->feature_num);
+	}
+
+	return ret;
+}
+
+int smu_v13_0_notify_display_change(struct smu_context *smu)
+{
+	int ret = 0;
+
+	if (!smu->pm_enabled)
+		return ret;
+
+	if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_UCLK_BIT) &&
+	    smu->adev->gmc.vram_type == AMDGPU_VRAM_TYPE_HBM)
+		ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_SetUclkFastSwitch, 1, NULL);
+
+	return ret;
+}
+
+	static int
+smu_v13_0_get_max_sustainable_clock(struct smu_context *smu, uint32_t *clock,
+				    enum smu_clk_type clock_select)
+{
+	int ret = 0;
+	int clk_id;
+
+	if ((smu_cmn_to_asic_specific_index(smu, CMN2ASIC_MAPPING_MSG, SMU_MSG_GetDcModeMaxDpmFreq) < 0) ||
+	    (smu_cmn_to_asic_specific_index(smu, CMN2ASIC_MAPPING_MSG, SMU_MSG_GetMaxDpmFreq) < 0))
+		return 0;
+
+	clk_id = smu_cmn_to_asic_specific_index(smu,
+						CMN2ASIC_MAPPING_CLK,
+						clock_select);
+	if (clk_id < 0)
+		return -EINVAL;
+
+	ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_GetDcModeMaxDpmFreq,
+					      clk_id << 16, clock);
+	if (ret) {
+		dev_err(smu->adev->dev, "[GetMaxSustainableClock] Failed to get max DC clock from SMC!");
+		return ret;
+	}
+
+	if (*clock != 0)
+		return 0;
+
+	/* if DC limit is zero, return AC limit */
+	ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_GetMaxDpmFreq,
+					      clk_id << 16, clock);
+	if (ret) {
+		dev_err(smu->adev->dev, "[GetMaxSustainableClock] failed to get max AC clock from SMC!");
+		return ret;
+	}
+
+	return 0;
+}
+
+int smu_v13_0_init_max_sustainable_clocks(struct smu_context *smu)
+{
+	struct smu_13_0_max_sustainable_clocks *max_sustainable_clocks =
+		smu->smu_table.max_sustainable_clocks;
+	int ret = 0;
+
+	max_sustainable_clocks->uclock = smu->smu_table.boot_values.uclk / 100;
+	max_sustainable_clocks->soc_clock = smu->smu_table.boot_values.socclk / 100;
+	max_sustainable_clocks->dcef_clock = smu->smu_table.boot_values.dcefclk / 100;
+	max_sustainable_clocks->display_clock = 0xFFFFFFFF;
+	max_sustainable_clocks->phy_clock = 0xFFFFFFFF;
+	max_sustainable_clocks->pixel_clock = 0xFFFFFFFF;
+
+	if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_UCLK_BIT)) {
+		ret = smu_v13_0_get_max_sustainable_clock(smu,
+							  &(max_sustainable_clocks->uclock),
+							  SMU_UCLK);
+		if (ret) {
+			dev_err(smu->adev->dev, "[%s] failed to get max UCLK from SMC!",
+				__func__);
+			return ret;
+		}
+	}
+
+	if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_SOCCLK_BIT)) {
+		ret = smu_v13_0_get_max_sustainable_clock(smu,
+							  &(max_sustainable_clocks->soc_clock),
+							  SMU_SOCCLK);
+		if (ret) {
+			dev_err(smu->adev->dev, "[%s] failed to get max SOCCLK from SMC!",
+				__func__);
+			return ret;
+		}
+	}
+
+	if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_DCEFCLK_BIT)) {
+		ret = smu_v13_0_get_max_sustainable_clock(smu,
+							  &(max_sustainable_clocks->dcef_clock),
+							  SMU_DCEFCLK);
+		if (ret) {
+			dev_err(smu->adev->dev, "[%s] failed to get max DCEFCLK from SMC!",
+				__func__);
+			return ret;
+		}
+
+		ret = smu_v13_0_get_max_sustainable_clock(smu,
+							  &(max_sustainable_clocks->display_clock),
+							  SMU_DISPCLK);
+		if (ret) {
+			dev_err(smu->adev->dev, "[%s] failed to get max DISPCLK from SMC!",
+				__func__);
+			return ret;
+		}
+		ret = smu_v13_0_get_max_sustainable_clock(smu,
+							  &(max_sustainable_clocks->phy_clock),
+							  SMU_PHYCLK);
+		if (ret) {
+			dev_err(smu->adev->dev, "[%s] failed to get max PHYCLK from SMC!",
+				__func__);
+			return ret;
+		}
+		ret = smu_v13_0_get_max_sustainable_clock(smu,
+							  &(max_sustainable_clocks->pixel_clock),
+							  SMU_PIXCLK);
+		if (ret) {
+			dev_err(smu->adev->dev, "[%s] failed to get max PIXCLK from SMC!",
+				__func__);
+			return ret;
+		}
+	}
+
+	if (max_sustainable_clocks->soc_clock < max_sustainable_clocks->uclock)
+		max_sustainable_clocks->uclock = max_sustainable_clocks->soc_clock;
+
+	return 0;
+}
+
+int smu_v13_0_get_current_power_limit(struct smu_context *smu,
+				      uint32_t *power_limit)
+{
+	int power_src;
+	int ret = 0;
+
+	if (!smu_cmn_feature_is_enabled(smu, SMU_FEATURE_PPT_BIT))
+		return -EINVAL;
+
+	power_src = smu_cmn_to_asic_specific_index(smu,
+						   CMN2ASIC_MAPPING_PWR,
+						   smu->adev->pm.ac_power ?
+						   SMU_POWER_SOURCE_AC :
+						   SMU_POWER_SOURCE_DC);
+	if (power_src < 0)
+		return -EINVAL;
+
+	ret = smu_cmn_send_smc_msg_with_param(smu,
+					      SMU_MSG_GetPptLimit,
+					      power_src << 16,
+					      power_limit);
+	if (ret)
+		dev_err(smu->adev->dev, "[%s] get PPT limit failed!", __func__);
+
+	return ret;
+}
+
+int smu_v13_0_set_power_limit(struct smu_context *smu, uint32_t n)
+{
+	int ret = 0;
+
+	if (!smu_cmn_feature_is_enabled(smu, SMU_FEATURE_PPT_BIT)) {
+		dev_err(smu->adev->dev, "Setting new power limit is not supported!\n");
+		return -EOPNOTSUPP;
+	}
+
+	ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_SetPptLimit, n, NULL);
+	if (ret) {
+		dev_err(smu->adev->dev, "[%s] Set power limit Failed!\n", __func__);
+		return ret;
+	}
+
+	smu->current_power_limit = n;
+
+	return 0;
+}
+
+int smu_v13_0_enable_thermal_alert(struct smu_context *smu)
+{
+	if (smu->smu_table.thermal_controller_type)
+		return amdgpu_irq_get(smu->adev, &smu->irq_source, 0);
+
+	return 0;
+}
+
+int smu_v13_0_disable_thermal_alert(struct smu_context *smu)
+{
+	return amdgpu_irq_put(smu->adev, &smu->irq_source, 0);
+}
+
+static uint16_t convert_to_vddc(uint8_t vid)
+{
+	return (uint16_t) ((6200 - (vid * 25)) / SMU13_VOLTAGE_SCALE);
+}
+
+int smu_v13_0_get_gfx_vdd(struct smu_context *smu, uint32_t *value)
+{
+	struct amdgpu_device *adev = smu->adev;
+	uint32_t vdd = 0, val_vid = 0;
+
+	if (!value)
+		return -EINVAL;
+	val_vid = (RREG32_SOC15(SMUIO, 0, regSMUSVI0_TEL_PLANE0) &
+		   SMUSVI0_TEL_PLANE0__SVI0_PLANE0_VDDCOR_MASK) >>
+		SMUSVI0_TEL_PLANE0__SVI0_PLANE0_VDDCOR__SHIFT;
+
+	vdd = (uint32_t)convert_to_vddc((uint8_t)val_vid);
+
+	*value = vdd;
+
+	return 0;
+
+}
+
+int
+smu_v13_0_display_clock_voltage_request(struct smu_context *smu,
+					struct pp_display_clock_request
+					*clock_req)
+{
+	enum amd_pp_clock_type clk_type = clock_req->clock_type;
+	int ret = 0;
+	enum smu_clk_type clk_select = 0;
+	uint32_t clk_freq = clock_req->clock_freq_in_khz / 1000;
+
+	if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_DCEFCLK_BIT) ||
+	    smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_UCLK_BIT)) {
+		switch (clk_type) {
+		case amd_pp_dcef_clock:
+			clk_select = SMU_DCEFCLK;
+			break;
+		case amd_pp_disp_clock:
+			clk_select = SMU_DISPCLK;
+			break;
+		case amd_pp_pixel_clock:
+			clk_select = SMU_PIXCLK;
+			break;
+		case amd_pp_phy_clock:
+			clk_select = SMU_PHYCLK;
+			break;
+		case amd_pp_mem_clock:
+			clk_select = SMU_UCLK;
+			break;
+		default:
+			dev_info(smu->adev->dev, "[%s] Invalid Clock Type!", __func__);
+			ret = -EINVAL;
+			break;
+		}
+
+		if (ret)
+			goto failed;
+
+		if (clk_select == SMU_UCLK && smu->disable_uclk_switch)
+			return 0;
+
+		ret = smu_v13_0_set_hard_freq_limited_range(smu, clk_select, clk_freq, 0);
+
+		if(clk_select == SMU_UCLK)
+			smu->hard_min_uclk_req_from_dal = clk_freq;
+	}
+
+failed:
+	return ret;
+}
+
+uint32_t smu_v13_0_get_fan_control_mode(struct smu_context *smu)
+{
+	if (!smu_cmn_feature_is_enabled(smu, SMU_FEATURE_FAN_CONTROL_BIT))
+		return AMD_FAN_CTRL_MANUAL;
+	else
+		return AMD_FAN_CTRL_AUTO;
+}
+
+	static int
+smu_v13_0_auto_fan_control(struct smu_context *smu, bool auto_fan_control)
+{
+	int ret = 0;
+
+	if (!smu_cmn_feature_is_supported(smu, SMU_FEATURE_FAN_CONTROL_BIT))
+		return 0;
+
+	ret = smu_cmn_feature_set_enabled(smu, SMU_FEATURE_FAN_CONTROL_BIT, auto_fan_control);
+	if (ret)
+		dev_err(smu->adev->dev, "[%s]%s smc FAN CONTROL feature failed!",
+			__func__, (auto_fan_control ? "Start" : "Stop"));
+
+	return ret;
+}
+
+	static int
+smu_v13_0_set_fan_static_mode(struct smu_context *smu, uint32_t mode)
+{
+	struct amdgpu_device *adev = smu->adev;
+
+	WREG32_SOC15(THM, 0, regCG_FDO_CTRL2,
+		     REG_SET_FIELD(RREG32_SOC15(THM, 0, regCG_FDO_CTRL2),
+				   CG_FDO_CTRL2, TMIN, 0));
+	WREG32_SOC15(THM, 0, regCG_FDO_CTRL2,
+		     REG_SET_FIELD(RREG32_SOC15(THM, 0, regCG_FDO_CTRL2),
+				   CG_FDO_CTRL2, FDO_PWM_MODE, mode));
+
+	return 0;
+}
+
+	int
+smu_v13_0_set_fan_speed_percent(struct smu_context *smu, uint32_t speed)
+{
+	struct amdgpu_device *adev = smu->adev;
+	uint32_t duty100, duty;
+	uint64_t tmp64;
+
+	if (speed > 100)
+		speed = 100;
+
+	if (smu_v13_0_auto_fan_control(smu, 0))
+		return -EINVAL;
+
+	duty100 = REG_GET_FIELD(RREG32_SOC15(THM, 0, regCG_FDO_CTRL1),
+				CG_FDO_CTRL1, FMAX_DUTY100);
+	if (!duty100)
+		return -EINVAL;
+
+	tmp64 = (uint64_t)speed * duty100;
+	do_div(tmp64, 100);
+	duty = (uint32_t)tmp64;
+
+	WREG32_SOC15(THM, 0, regCG_FDO_CTRL0,
+		     REG_SET_FIELD(RREG32_SOC15(THM, 0, regCG_FDO_CTRL0),
+				   CG_FDO_CTRL0, FDO_STATIC_DUTY, duty));
+
+	return smu_v13_0_set_fan_static_mode(smu, FDO_PWM_MODE_STATIC);
+}
+
+	int
+smu_v13_0_set_fan_control_mode(struct smu_context *smu,
+			       uint32_t mode)
+{
+	int ret = 0;
+
+	switch (mode) {
+	case AMD_FAN_CTRL_NONE:
+		ret = smu_v13_0_set_fan_speed_percent(smu, 100);
+		break;
+	case AMD_FAN_CTRL_MANUAL:
+		ret = smu_v13_0_auto_fan_control(smu, 0);
+		break;
+	case AMD_FAN_CTRL_AUTO:
+		ret = smu_v13_0_auto_fan_control(smu, 1);
+		break;
+	default:
+		break;
+	}
+
+	if (ret) {
+		dev_err(smu->adev->dev, "[%s]Set fan control mode failed!", __func__);
+		return -EINVAL;
+	}
+
+	return ret;
+}
+
+int smu_v13_0_set_fan_speed_rpm(struct smu_context *smu,
+				uint32_t speed)
+{
+	struct amdgpu_device *adev = smu->adev;
+	int ret;
+	uint32_t tach_period, crystal_clock_freq;
+
+	if (!speed)
+		return -EINVAL;
+
+	ret = smu_v13_0_auto_fan_control(smu, 0);
+	if (ret)
+		return ret;
+
+	crystal_clock_freq = amdgpu_asic_get_xclk(adev);
+	tach_period = 60 * crystal_clock_freq * 10000 / (8 * speed);
+	WREG32_SOC15(THM, 0, regCG_TACH_CTRL,
+		     REG_SET_FIELD(RREG32_SOC15(THM, 0, regCG_TACH_CTRL),
+				   CG_TACH_CTRL, TARGET_PERIOD,
+				   tach_period));
+
+	ret = smu_v13_0_set_fan_static_mode(smu, FDO_PWM_MODE_STATIC_RPM);
+
+	return ret;
+}
+
+int smu_v13_0_set_xgmi_pstate(struct smu_context *smu,
+			      uint32_t pstate)
+{
+	int ret = 0;
+	ret = smu_cmn_send_smc_msg_with_param(smu,
+					      SMU_MSG_SetXgmiMode,
+					      pstate ? XGMI_MODE_PSTATE_D0 : XGMI_MODE_PSTATE_D3,
+					      NULL);
+	return ret;
+}
+
+static int smu_v13_0_set_irq_state(struct amdgpu_device *adev,
+				   struct amdgpu_irq_src *source,
+				   unsigned tyep,
+				   enum amdgpu_interrupt_state state)
+{
+	struct smu_context *smu = &adev->smu;
+	uint32_t low, high;
+	uint32_t val = 0;
+
+	switch (state) {
+	case AMDGPU_IRQ_STATE_DISABLE:
+		/* For THM irqs */
+		val = RREG32_SOC15(THM, 0, regTHM_THERMAL_INT_CTRL);
+		val = REG_SET_FIELD(val, THM_THERMAL_INT_CTRL, THERM_INTH_MASK, 1);
+		val = REG_SET_FIELD(val, THM_THERMAL_INT_CTRL, THERM_INTL_MASK, 1);
+		WREG32_SOC15(THM, 0, regTHM_THERMAL_INT_CTRL, val);
+
+		WREG32_SOC15(THM, 0, regTHM_THERMAL_INT_ENA, 0);
+
+		/* For MP1 SW irqs */
+		val = RREG32_SOC15(MP1, 0, regMP1_SMN_IH_SW_INT_CTRL);
+		val = REG_SET_FIELD(val, MP1_SMN_IH_SW_INT_CTRL, INT_MASK, 1);
+		WREG32_SOC15(MP1, 0, regMP1_SMN_IH_SW_INT_CTRL, val);
+
+		break;
+	case AMDGPU_IRQ_STATE_ENABLE:
+		/* For THM irqs */
+		low = max(SMU_THERMAL_MINIMUM_ALERT_TEMP,
+			  smu->thermal_range.min / SMU_TEMPERATURE_UNITS_PER_CENTIGRADES);
+		high = min(SMU_THERMAL_MAXIMUM_ALERT_TEMP,
+			   smu->thermal_range.software_shutdown_temp);
+
+		val = RREG32_SOC15(THM, 0, regTHM_THERMAL_INT_CTRL);
+		val = REG_SET_FIELD(val, THM_THERMAL_INT_CTRL, MAX_IH_CREDIT, 5);
+		val = REG_SET_FIELD(val, THM_THERMAL_INT_CTRL, THERM_IH_HW_ENA, 1);
+		val = REG_SET_FIELD(val, THM_THERMAL_INT_CTRL, THERM_INTH_MASK, 0);
+		val = REG_SET_FIELD(val, THM_THERMAL_INT_CTRL, THERM_INTL_MASK, 0);
+		val = REG_SET_FIELD(val, THM_THERMAL_INT_CTRL, DIG_THERM_INTH, (high & 0xff));
+		val = REG_SET_FIELD(val, THM_THERMAL_INT_CTRL, DIG_THERM_INTL, (low & 0xff));
+		val = val & (~THM_THERMAL_INT_CTRL__THERM_TRIGGER_MASK_MASK);
+		WREG32_SOC15(THM, 0, regTHM_THERMAL_INT_CTRL, val);
+
+		val = (1 << THM_THERMAL_INT_ENA__THERM_INTH_CLR__SHIFT);
+		val |= (1 << THM_THERMAL_INT_ENA__THERM_INTL_CLR__SHIFT);
+		val |= (1 << THM_THERMAL_INT_ENA__THERM_TRIGGER_CLR__SHIFT);
+		WREG32_SOC15(THM, 0, regTHM_THERMAL_INT_ENA, val);
+
+		/* For MP1 SW irqs */
+		val = RREG32_SOC15(MP1, 0, regMP1_SMN_IH_SW_INT);
+		val = REG_SET_FIELD(val, MP1_SMN_IH_SW_INT, ID, 0xFE);
+		val = REG_SET_FIELD(val, MP1_SMN_IH_SW_INT, VALID, 0);
+		WREG32_SOC15(MP1, 0, regMP1_SMN_IH_SW_INT, val);
+
+		val = RREG32_SOC15(MP1, 0, regMP1_SMN_IH_SW_INT_CTRL);
+		val = REG_SET_FIELD(val, MP1_SMN_IH_SW_INT_CTRL, INT_MASK, 0);
+		WREG32_SOC15(MP1, 0, regMP1_SMN_IH_SW_INT_CTRL, val);
+
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int smu_v13_0_ack_ac_dc_interrupt(struct smu_context *smu)
+{
+	return smu_cmn_send_smc_msg(smu,
+				    SMU_MSG_ReenableAcDcInterrupt,
+				    NULL);
+}
+
+#define THM_11_0__SRCID__THM_DIG_THERM_L2H		0		/* ASIC_TEMP > CG_THERMAL_INT.DIG_THERM_INTH  */
+#define THM_11_0__SRCID__THM_DIG_THERM_H2L		1		/* ASIC_TEMP < CG_THERMAL_INT.DIG_THERM_INTL  */
+#define SMUIO_11_0__SRCID__SMUIO_GPIO19			83
+
+static int smu_v13_0_irq_process(struct amdgpu_device *adev,
+				 struct amdgpu_irq_src *source,
+				 struct amdgpu_iv_entry *entry)
+{
+	struct smu_context *smu = &adev->smu;
+	uint32_t client_id = entry->client_id;
+	uint32_t src_id = entry->src_id;
+	/*
+	 * ctxid is used to distinguish different
+	 * events for SMCToHost interrupt.
+	 */
+	uint32_t ctxid = entry->src_data[0];
+	uint32_t data;
+
+	if (client_id == SOC15_IH_CLIENTID_THM) {
+		switch (src_id) {
+		case THM_11_0__SRCID__THM_DIG_THERM_L2H:
+			dev_emerg(adev->dev, "ERROR: GPU over temperature range(SW CTF) detected!\n");
+			/*
+			 * SW CTF just occurred.
+			 * Try to do a graceful shutdown to prevent further damage.
+			 */
+			dev_emerg(adev->dev, "ERROR: System is going to shutdown due to GPU SW CTF!\n");
+			orderly_poweroff(true);
+			break;
+		case THM_11_0__SRCID__THM_DIG_THERM_H2L:
+			dev_emerg(adev->dev, "ERROR: GPU under temperature range detected\n");
+			break;
+		default:
+			dev_emerg(adev->dev, "ERROR: GPU under temperature range unknown src id (%d)\n",
+				  src_id);
+			break;
+		}
+	} else if (client_id == SOC15_IH_CLIENTID_ROM_SMUIO) {
+		dev_emerg(adev->dev, "ERROR: GPU HW Critical Temperature Fault(aka CTF) detected!\n");
+		/*
+		 * HW CTF just occurred. Shutdown to prevent further damage.
+		 */
+		dev_emerg(adev->dev, "ERROR: System is going to shutdown due to GPU HW CTF!\n");
+		orderly_poweroff(true);
+	} else if (client_id == SOC15_IH_CLIENTID_MP1) {
+		if (src_id == 0xfe) {
+			/* ACK SMUToHost interrupt */
+			data = RREG32_SOC15(MP1, 0, regMP1_SMN_IH_SW_INT_CTRL);
+			data = REG_SET_FIELD(data, MP1_SMN_IH_SW_INT_CTRL, INT_ACK, 1);
+			WREG32_SOC15(MP1, 0, regMP1_SMN_IH_SW_INT_CTRL, data);
+
+			switch (ctxid) {
+			case 0x3:
+				dev_dbg(adev->dev, "Switched to AC mode!\n");
+				smu_v13_0_ack_ac_dc_interrupt(&adev->smu);
+				break;
+			case 0x4:
+				dev_dbg(adev->dev, "Switched to DC mode!\n");
+				smu_v13_0_ack_ac_dc_interrupt(&adev->smu);
+				break;
+			case 0x7:
+				/*
+				 * Increment the throttle interrupt counter
+				 */
+				atomic64_inc(&smu->throttle_int_counter);
+
+				if (!atomic_read(&adev->throttling_logging_enabled))
+					return 0;
+
+				if (__ratelimit(&adev->throttling_logging_rs))
+					schedule_work(&smu->throttling_logging_work);
+
+				break;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static const struct amdgpu_irq_src_funcs smu_v13_0_irq_funcs =
+{
+	.set = smu_v13_0_set_irq_state,
+	.process = smu_v13_0_irq_process,
+};
+
+int smu_v13_0_register_irq_handler(struct smu_context *smu)
+{
+	struct amdgpu_device *adev = smu->adev;
+	struct amdgpu_irq_src *irq_src = &smu->irq_source;
+	int ret = 0;
+
+	irq_src->num_types = 1;
+	irq_src->funcs = &smu_v13_0_irq_funcs;
+
+	ret = amdgpu_irq_add_id(adev, SOC15_IH_CLIENTID_THM,
+				THM_11_0__SRCID__THM_DIG_THERM_L2H,
+				irq_src);
+	if (ret)
+		return ret;
+
+	ret = amdgpu_irq_add_id(adev, SOC15_IH_CLIENTID_THM,
+				THM_11_0__SRCID__THM_DIG_THERM_H2L,
+				irq_src);
+	if (ret)
+		return ret;
+
+	/* Register CTF(GPIO_19) interrupt */
+	ret = amdgpu_irq_add_id(adev, SOC15_IH_CLIENTID_ROM_SMUIO,
+				SMUIO_11_0__SRCID__SMUIO_GPIO19,
+				irq_src);
+	if (ret)
+		return ret;
+
+	ret = amdgpu_irq_add_id(adev, SOC15_IH_CLIENTID_MP1,
+				0xfe,
+				irq_src);
+	if (ret)
+		return ret;
+
+	return ret;
+}
+
+int smu_v13_0_get_max_sustainable_clocks_by_dc(struct smu_context *smu,
+					       struct pp_smu_nv_clock_table *max_clocks)
+{
+	struct smu_table_context *table_context = &smu->smu_table;
+	struct smu_13_0_max_sustainable_clocks *sustainable_clocks = NULL;
+
+	if (!max_clocks || !table_context->max_sustainable_clocks)
+		return -EINVAL;
+
+	sustainable_clocks = table_context->max_sustainable_clocks;
+
+	max_clocks->dcfClockInKhz =
+		(unsigned int) sustainable_clocks->dcef_clock * 1000;
+	max_clocks->displayClockInKhz =
+		(unsigned int) sustainable_clocks->display_clock * 1000;
+	max_clocks->phyClockInKhz =
+		(unsigned int) sustainable_clocks->phy_clock * 1000;
+	max_clocks->pixelClockInKhz =
+		(unsigned int) sustainable_clocks->pixel_clock * 1000;
+	max_clocks->uClockInKhz =
+		(unsigned int) sustainable_clocks->uclock * 1000;
+	max_clocks->socClockInKhz =
+		(unsigned int) sustainable_clocks->soc_clock * 1000;
+	max_clocks->dscClockInKhz = 0;
+	max_clocks->dppClockInKhz = 0;
+	max_clocks->fabricClockInKhz = 0;
+
+	return 0;
+}
+
+int smu_v13_0_set_azalia_d3_pme(struct smu_context *smu)
+{
+	int ret = 0;
+
+	ret = smu_cmn_send_smc_msg(smu, SMU_MSG_BacoAudioD3PME, NULL);
+
+	return ret;
+}
+
+int smu_v13_0_mode1_reset(struct smu_context *smu)
+{
+	int ret = 0;
+
+	ret = smu_cmn_send_smc_msg(smu, SMU_MSG_Mode1Reset, NULL);
+	if (!ret)
+		msleep(SMU13_MODE1_RESET_WAIT_TIME_IN_MS);
+
+	return ret;
+}
+
+int smu_v13_0_get_dpm_ultimate_freq(struct smu_context *smu, enum smu_clk_type clk_type,
+				    uint32_t *min, uint32_t *max)
+{
+	int ret = 0, clk_id = 0;
+	uint32_t param = 0;
+	uint32_t clock_limit;
+
+	if (!smu_cmn_clk_dpm_is_enabled(smu, clk_type)) {
+		switch (clk_type) {
+		case SMU_MCLK:
+		case SMU_UCLK:
+			clock_limit = smu->smu_table.boot_values.uclk;
+			break;
+		case SMU_GFXCLK:
+		case SMU_SCLK:
+			clock_limit = smu->smu_table.boot_values.gfxclk;
+			break;
+		case SMU_SOCCLK:
+			clock_limit = smu->smu_table.boot_values.socclk;
+			break;
+		default:
+			clock_limit = 0;
+			break;
+		}
+
+		/* clock in Mhz unit */
+		if (min)
+			*min = clock_limit / 100;
+		if (max)
+			*max = clock_limit / 100;
+
+		return 0;
+	}
+
+	clk_id = smu_cmn_to_asic_specific_index(smu,
+						CMN2ASIC_MAPPING_CLK,
+						clk_type);
+	if (clk_id < 0) {
+		ret = -EINVAL;
+		goto failed;
+	}
+	param = (clk_id & 0xffff) << 16;
+
+	if (max) {
+		ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_GetMaxDpmFreq, param, max);
+		if (ret)
+			goto failed;
+	}
+
+	if (min) {
+		ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_GetMinDpmFreq, param, min);
+		if (ret)
+			goto failed;
+	}
+
+failed:
+	return ret;
+}
+
+int smu_v13_0_set_soft_freq_limited_range(struct smu_context *smu,
+					  enum smu_clk_type clk_type,
+					  uint32_t min,
+					  uint32_t max)
+{
+	struct amdgpu_device *adev = smu->adev;
+	int ret = 0, clk_id = 0;
+	uint32_t param;
+
+	if (!smu_cmn_clk_dpm_is_enabled(smu, clk_type))
+		return 0;
+
+	clk_id = smu_cmn_to_asic_specific_index(smu,
+						CMN2ASIC_MAPPING_CLK,
+						clk_type);
+	if (clk_id < 0)
+		return clk_id;
+
+	if (clk_type == SMU_GFXCLK)
+		amdgpu_gfx_off_ctrl(adev, false);
+
+	if (max > 0) {
+		param = (uint32_t)((clk_id << 16) | (max & 0xffff));
+		ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_SetSoftMaxByFreq,
+						      param, NULL);
+		if (ret)
+			goto out;
+	}
+
+	if (min > 0) {
+		param = (uint32_t)((clk_id << 16) | (min & 0xffff));
+		ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_SetSoftMinByFreq,
+						      param, NULL);
+		if (ret)
+			goto out;
+	}
+
+out:
+	if (clk_type == SMU_GFXCLK)
+		amdgpu_gfx_off_ctrl(adev, true);
+
+	return ret;
+}
+
+int smu_v13_0_set_hard_freq_limited_range(struct smu_context *smu,
+					  enum smu_clk_type clk_type,
+					  uint32_t min,
+					  uint32_t max)
+{
+	int ret = 0, clk_id = 0;
+	uint32_t param;
+
+	if (min <= 0 && max <= 0)
+		return -EINVAL;
+
+	if (!smu_cmn_clk_dpm_is_enabled(smu, clk_type))
+		return 0;
+
+	clk_id = smu_cmn_to_asic_specific_index(smu,
+						CMN2ASIC_MAPPING_CLK,
+						clk_type);
+	if (clk_id < 0)
+		return clk_id;
+
+	if (max > 0) {
+		param = (uint32_t)((clk_id << 16) | (max & 0xffff));
+		ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_SetHardMaxByFreq,
+						      param, NULL);
+		if (ret)
+			return ret;
+	}
+
+	if (min > 0) {
+		param = (uint32_t)((clk_id << 16) | (min & 0xffff));
+		ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_SetHardMinByFreq,
+						      param, NULL);
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
+int smu_v13_0_set_performance_level(struct smu_context *smu,
+				    enum amd_dpm_forced_level level)
+{
+	struct smu_13_0_dpm_context *dpm_context =
+		smu->smu_dpm.dpm_context;
+	struct smu_13_0_dpm_table *gfx_table =
+		&dpm_context->dpm_tables.gfx_table;
+	struct smu_13_0_dpm_table *mem_table =
+		&dpm_context->dpm_tables.uclk_table;
+	struct smu_13_0_dpm_table *soc_table =
+		&dpm_context->dpm_tables.soc_table;
+	struct smu_umd_pstate_table *pstate_table =
+		&smu->pstate_table;
+	struct amdgpu_device *adev = smu->adev;
+	uint32_t sclk_min = 0, sclk_max = 0;
+	uint32_t mclk_min = 0, mclk_max = 0;
+	uint32_t socclk_min = 0, socclk_max = 0;
+	int ret = 0;
+
+	switch (level) {
+	case AMD_DPM_FORCED_LEVEL_HIGH:
+		sclk_min = sclk_max = gfx_table->max;
+		mclk_min = mclk_max = mem_table->max;
+		socclk_min = socclk_max = soc_table->max;
+		break;
+	case AMD_DPM_FORCED_LEVEL_LOW:
+		sclk_min = sclk_max = gfx_table->min;
+		mclk_min = mclk_max = mem_table->min;
+		socclk_min = socclk_max = soc_table->min;
+		break;
+	case AMD_DPM_FORCED_LEVEL_AUTO:
+		sclk_min = gfx_table->min;
+		sclk_max = gfx_table->max;
+		mclk_min = mem_table->min;
+		mclk_max = mem_table->max;
+		socclk_min = soc_table->min;
+		socclk_max = soc_table->max;
+		break;
+	case AMD_DPM_FORCED_LEVEL_PROFILE_STANDARD:
+		sclk_min = sclk_max = pstate_table->gfxclk_pstate.standard;
+		mclk_min = mclk_max = pstate_table->uclk_pstate.standard;
+		socclk_min = socclk_max = pstate_table->socclk_pstate.standard;
+		break;
+	case AMD_DPM_FORCED_LEVEL_PROFILE_MIN_SCLK:
+		sclk_min = sclk_max = pstate_table->gfxclk_pstate.min;
+		break;
+	case AMD_DPM_FORCED_LEVEL_PROFILE_MIN_MCLK:
+		mclk_min = mclk_max = pstate_table->uclk_pstate.min;
+		break;
+	case AMD_DPM_FORCED_LEVEL_PROFILE_PEAK:
+		sclk_min = sclk_max = pstate_table->gfxclk_pstate.peak;
+		mclk_min = mclk_max = pstate_table->uclk_pstate.peak;
+		socclk_min = socclk_max = pstate_table->socclk_pstate.peak;
+		break;
+	case AMD_DPM_FORCED_LEVEL_MANUAL:
+	case AMD_DPM_FORCED_LEVEL_PROFILE_EXIT:
+		return 0;
+	default:
+		dev_err(adev->dev, "Invalid performance level %d\n", level);
+		return -EINVAL;
+	}
+
+	mclk_min = mclk_max = 0;
+	socclk_min = socclk_max = 0;
+
+	if (sclk_min && sclk_max) {
+		ret = smu_v13_0_set_soft_freq_limited_range(smu,
+							    SMU_GFXCLK,
+							    sclk_min,
+							    sclk_max);
+		if (ret)
+			return ret;
+	}
+
+	if (mclk_min && mclk_max) {
+		ret = smu_v13_0_set_soft_freq_limited_range(smu,
+							    SMU_MCLK,
+							    mclk_min,
+							    mclk_max);
+		if (ret)
+			return ret;
+	}
+
+	if (socclk_min && socclk_max) {
+		ret = smu_v13_0_set_soft_freq_limited_range(smu,
+							    SMU_SOCCLK,
+							    socclk_min,
+							    socclk_max);
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
+int smu_v13_0_set_power_source(struct smu_context *smu,
+			       enum smu_power_src_type power_src)
+{
+	int pwr_source;
+
+	pwr_source = smu_cmn_to_asic_specific_index(smu,
+						    CMN2ASIC_MAPPING_PWR,
+						    (uint32_t)power_src);
+	if (pwr_source < 0)
+		return -EINVAL;
+
+	return smu_cmn_send_smc_msg_with_param(smu,
+					       SMU_MSG_NotifyPowerSource,
+					       pwr_source,
+					       NULL);
+}
+
+int smu_v13_0_get_dpm_freq_by_index(struct smu_context *smu,
+				    enum smu_clk_type clk_type,
+				    uint16_t level,
+				    uint32_t *value)
+{
+	int ret = 0, clk_id = 0;
+	uint32_t param;
+
+	if (!value)
+		return -EINVAL;
+
+	if (!smu_cmn_clk_dpm_is_enabled(smu, clk_type))
+		return 0;
+
+	clk_id = smu_cmn_to_asic_specific_index(smu,
+						CMN2ASIC_MAPPING_CLK,
+						clk_type);
+	if (clk_id < 0)
+		return clk_id;
+
+	param = (uint32_t)(((clk_id & 0xffff) << 16) | (level & 0xffff));
+
+	ret = smu_cmn_send_smc_msg_with_param(smu,
+					      SMU_MSG_GetDpmFreqByIndex,
+					      param,
+					      value);
+	if (ret)
+		return ret;
+
+	/*
+	 * BIT31:  0 - Fine grained DPM, 1 - Dicrete DPM
+	 * now, we un-support it
+	 */
+	*value = *value & 0x7fffffff;
+
+	return ret;
+}
+
+int smu_v13_0_get_dpm_level_count(struct smu_context *smu,
+				  enum smu_clk_type clk_type,
+				  uint32_t *value)
+{
+	return smu_v13_0_get_dpm_freq_by_index(smu,
+					       clk_type,
+					       0xff,
+					       value);
+}
+
+int smu_v13_0_set_single_dpm_table(struct smu_context *smu,
+				   enum smu_clk_type clk_type,
+				   struct smu_13_0_dpm_table *single_dpm_table)
+{
+	int ret = 0;
+	uint32_t clk;
+	int i;
+
+	ret = smu_v13_0_get_dpm_level_count(smu,
+					    clk_type,
+					    &single_dpm_table->count);
+	if (ret) {
+		dev_err(smu->adev->dev, "[%s] failed to get dpm levels!\n", __func__);
+		return ret;
+	}
+
+	for (i = 0; i < single_dpm_table->count; i++) {
+		ret = smu_v13_0_get_dpm_freq_by_index(smu,
+						      clk_type,
+						      i,
+						      &clk);
+		if (ret) {
+			dev_err(smu->adev->dev, "[%s] failed to get dpm freq by index!\n", __func__);
+			return ret;
+		}
+
+		single_dpm_table->dpm_levels[i].value = clk;
+		single_dpm_table->dpm_levels[i].enabled = true;
+
+		if (i == 0)
+			single_dpm_table->min = clk;
+		else if (i == single_dpm_table->count - 1)
+			single_dpm_table->max = clk;
+	}
+
+	return 0;
+}
+
+int smu_v13_0_get_dpm_level_range(struct smu_context *smu,
+				  enum smu_clk_type clk_type,
+				  uint32_t *min_value,
+				  uint32_t *max_value)
+{
+	uint32_t level_count = 0;
+	int ret = 0;
+
+	if (!min_value && !max_value)
+		return -EINVAL;
+
+	if (min_value) {
+		/* by default, level 0 clock value as min value */
+		ret = smu_v13_0_get_dpm_freq_by_index(smu,
+						      clk_type,
+						      0,
+						      min_value);
+		if (ret)
+			return ret;
+	}
+
+	if (max_value) {
+		ret = smu_v13_0_get_dpm_level_count(smu,
+						    clk_type,
+						    &level_count);
+		if (ret)
+			return ret;
+
+		ret = smu_v13_0_get_dpm_freq_by_index(smu,
+						      clk_type,
+						      level_count - 1,
+						      max_value);
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
+int smu_v13_0_get_current_pcie_link_width_level(struct smu_context *smu)
+{
+	struct amdgpu_device *adev = smu->adev;
+
+	return (RREG32_PCIE(smnPCIE_LC_LINK_WIDTH_CNTL) &
+		PCIE_LC_LINK_WIDTH_CNTL__LC_LINK_WIDTH_RD_MASK)
+		>> PCIE_LC_LINK_WIDTH_CNTL__LC_LINK_WIDTH_RD__SHIFT;
+}
+
+int smu_v13_0_get_current_pcie_link_width(struct smu_context *smu)
+{
+	uint32_t width_level;
+
+	width_level = smu_v13_0_get_current_pcie_link_width_level(smu);
+	if (width_level > LINK_WIDTH_MAX)
+		width_level = 0;
+
+	return link_width[width_level];
+}
+
+int smu_v13_0_get_current_pcie_link_speed_level(struct smu_context *smu)
+{
+	struct amdgpu_device *adev = smu->adev;
+
+	return (RREG32_PCIE(smnPCIE_LC_SPEED_CNTL) &
+		PCIE_LC_SPEED_CNTL__LC_CURRENT_DATA_RATE_MASK)
+		>> PCIE_LC_SPEED_CNTL__LC_CURRENT_DATA_RATE__SHIFT;
+}
+
+int smu_v13_0_get_current_pcie_link_speed(struct smu_context *smu)
+{
+	uint32_t speed_level;
+
+	speed_level = smu_v13_0_get_current_pcie_link_speed_level(smu);
+	if (speed_level > LINK_SPEED_MAX)
+		speed_level = 0;
+
+	return link_speed[speed_level];
+}
+
+void smu_v13_0_init_gpu_metrics_v1_0(struct gpu_metrics_v1_0 *gpu_metrics)
+{
+	memset(gpu_metrics, 0xFF, sizeof(struct gpu_metrics_v1_0));
+
+	gpu_metrics->common_header.structure_size =
+		sizeof(struct gpu_metrics_v1_0);
+	gpu_metrics->common_header.format_revision = 1;
+	gpu_metrics->common_header.content_revision = 0;
+
+	gpu_metrics->system_clock_counter = ktime_get_boottime_ns();
+}
-- 
2.29.2

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
