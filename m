Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8747168294
	for <lists+amd-gfx@lfdr.de>; Fri, 21 Feb 2020 17:03:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931026F49A;
	Fri, 21 Feb 2020 16:03:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::614])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D80776F498
 for <amd-gfx@lists.freedesktop.org>; Fri, 21 Feb 2020 16:03:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=isa7GZY+E4EXlFeEeWCLcqh9DGWZSsVIDkTVQwVQbD7YfT+zg/+zcJqc50mt+SW6H9edbalwOnwE4Hi2vHQGb4lbuC6mY/06Wf1YWfxJQOXjFP6k2JZiqZ6pVhSHBA7Zm7PZ6jZdvZtf7j1+TckghFlsOxJIQHkXwc//qWMfNWF5xhLbR+dwWWrebXWgrgf2uI7Wvt1rSU4Majxxb6Rn2rkA2Xh3pEwfK6QJOx6+Z5E2uSg8jKzP3816B/vfS/tWFBa3ZRRpsV+jZgJOElEUL5in1iCUeQMJKjAWOltQjGn8iFdOvZt9fF5H+kdEYTE2QAiliG1G5yjQ9MYuCDdVIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iKTZaPrqMCnsh7kcleO9plfhxWAYwpBKpGODcBuQ8BU=;
 b=jS///TmvRClnOHycFIOmF3ty3tMKeHuAtphQg22B8JWSbfbGkxOQ5lUZtuW5JlAELJ3ccw7wreZhN4r6NyrapEFF0gUwOFieBTurLPMmET/SCHpWLAxHPkELhsalPNt/cicITmch/9YzRAsSzKPzB9hVMJ42xtZM5ngDVz/xWZQRZbbvp7eTvXh7YfCRiIe34MVwIV289am8IPUd5bS4hSkUi7//WDVFbN58MaeE7EcZKmxS7QdLELuAFmAE/rWDA5exHbbALgGlXWoX8uN7OVkX3YmVnC6oNHbmBp8LK9oSjs+u7demP3ctfe9KLSeXSBQ4muUYn1YS3nTts8Fesw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iKTZaPrqMCnsh7kcleO9plfhxWAYwpBKpGODcBuQ8BU=;
 b=x3cZt57LjoECzMg2Je+XbGqybPdAYFKeaSZ3NykyV7+f9eGyGjFEQSdVewpbw4Rv5KVM0JRg4nK7lU066AqjFTtTJJHnC+pCdmuVcndgHhiA5ORpD1knEvsP1m43AeyxBV8CxdQNTCTmhEp54WAVA3+fNEuGKgdD6ZU1KflNoe8=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Rodrigo.Siqueira@amd.com; 
Received: from MW2PR12MB2524.namprd12.prod.outlook.com (2603:10b6:907:9::27)
 by MW2PR12MB2572.namprd12.prod.outlook.com (2603:10b6:907:6::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Fri, 21 Feb
 2020 16:03:47 +0000
Received: from MW2PR12MB2524.namprd12.prod.outlook.com
 ([fe80::b8ff:6893:5820:420f]) by MW2PR12MB2524.namprd12.prod.outlook.com
 ([fe80::b8ff:6893:5820:420f%6]) with mapi id 15.20.2729.033; Fri, 21 Feb 2020
 16:03:47 +0000
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 02/35] drm/amd/display: update scaling filters
Date: Fri, 21 Feb 2020 11:02:51 -0500
Message-Id: <20200221160324.2969975-3-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200221160324.2969975-1-Rodrigo.Siqueira@amd.com>
References: <20200221160324.2969975-1-Rodrigo.Siqueira@amd.com>
X-ClientProxiedBy: YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::21) To MW2PR12MB2524.namprd12.prod.outlook.com
 (2603:10b6:907:9::27)
MIME-Version: 1.0
Received: from atma2.amd.com (165.204.55.250) by
 YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.18 via Frontend
 Transport; Fri, 21 Feb 2020 16:03:43 +0000
X-Mailer: git-send-email 2.25.0
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a6cf9b42-271e-49f2-7a96-08d7b6e7a08e
X-MS-TrafficTypeDiagnostic: MW2PR12MB2572:|MW2PR12MB2572:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR12MB25727E09C79855090DFC945598120@MW2PR12MB2572.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 0320B28BE1
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(189003)(199004)(1076003)(15650500001)(5660300002)(36756003)(2906002)(8936002)(86362001)(30864003)(8676002)(6486002)(81156014)(81166006)(7696005)(52116002)(4326008)(6666004)(316002)(186003)(26005)(6916009)(16526019)(54906003)(2616005)(66476007)(66556008)(66946007)(956004)(478600001)(559001)(569007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR12MB2572;
 H:MW2PR12MB2524.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OowYP7VCf/ocaPt3WPvgkyYgES2gvywYm1vnoaJhpVGGeYiL16QKTD7wG/Fu/VRKGiSJiB3jPldmZfWIBlhabLHxLXLuxWiuTluQvEmApF3jswLLGkpgVJHSD2DG2qI6H43y0tz0vNmFEX6AJU8xS0Ox79377cl6JlhZxHustAZp46xJJ3w3yv/lfUJIi5I/Fj1Hkfiq6Dtnd2UBdcjL4vGVJlfF3rUsHAEF/m8ekHWpTgGUZSXrCt/T0ZVT4MMWdyOiSceJ0XP1fhofdKakHevrnW0zqTlznbvKF9c4/KuBulbrZ8GXcian7SVF6RskNu3DvBw+TLw6/+ZNzU15n3DuMDy7xcpEPQxOoWqWhPExEKfCkXAFtl8Vmm76fozPeZ9cPjxvQzFD/THZ+d9dkEk9A505CbO9cipkuGDXeZy9LDOtJsiX70JHAVTOnbHGtK/UnRWDV6WVXaQUnmIKhpw52RjAZijfeplibZ3Udfg=
X-MS-Exchange-AntiSpam-MessageData: v/cCUBqIg6s7rLmcs/FT3SjPA3giPRxVuvZNoya8XAIzLg4zVKV9fff9Wct6dq8ooyr9pCCykPSaZIIbOv2Wovrtpd3axllwbDtUxPRsDfjbZkjVnabldCNwav9aJfWhptUhSt7PRlilkv46qVSyDw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6cf9b42-271e-49f2-7a96-08d7b6e7a08e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2020 16:03:44.6385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xd0jBxyuslhX4E3ymrjCU3yUUQ+aPt5IvZhq5+7fr0Za1tql+EzEductA6mN+snseKnwBIp08n9DM1d5vOoHDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2572
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
Cc: Sunpeng.Li@amd.com, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo.Siqueira@amd.com, Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Jun Lei <Jun.Lei@amd.com>, Bhawanpreet.Lakha@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>

Currently there is a minor error in scaling filter coefficients
caused by truncation to fit the HW registers.This error accummulates
with increased taps, but has gone unnoticed due to vast majority of
scaling being done with only 4 taps.

Scaling filters are now updated using HW team's filter generator
which has quantization error minimization built in.

Signed-off-by: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Reviewed-by: Jun Lei <Jun.Lei@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Acked-by: Harry Wentland <harry.wentland@amd.com>
---
 .../drm/amd/display/dc/dce/dce_scl_filters.c  | 2204 ++++++++++-------
 .../amd/display/dc/dce/dce_scl_filters_old.c  |   25 +
 2 files changed, 1290 insertions(+), 939 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dce/dce_scl_filters_old.c

diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_scl_filters.c b/drivers/gpu/drm/amd/display/dc/dce/dce_scl_filters.c
index 48862bebf29e..7311f312369f 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_scl_filters.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_scl_filters.c
@@ -22,1004 +22,1330 @@
  * Authors: AMD
  *
  */
-
 #include "transform.h"
 
+//=========================================
+// <num_taps>    = 2
+// <num_phases>  = 16
+// <scale_ratio> = 0.833333 (input/output)
+// <sharpness>   = 0
+// <CoefType>    = ModifiedLanczos
+// <CoefQuant>   = s1.10
+// <CoefOut>     = s1.12
+//=========================================
 static const uint16_t filter_2tap_16p[18] = {
-	4096, 0,
-	3840, 256,
-	3584, 512,
-	3328, 768,
-	3072, 1024,
-	2816, 1280,
-	2560, 1536,
-	2304, 1792,
-	2048, 2048
+		0x1000, 0x0000,
+		0x0FF0, 0x0010,
+		0x0FB0, 0x0050,
+		0x0F34, 0x00CC,
+		0x0E68, 0x0198,
+		0x0D44, 0x02BC,
+		0x0BC4, 0x043C,
+		0x09FC, 0x0604,
+		0x0800, 0x0800
 };
 
+//=========================================
+// <num_taps>    = 3
+// <num_phases>  = 16
+// <scale_ratio> = 0.83333 (input/output)
+// <sharpness>   = 0
+// <CoefType>    = ModifiedLanczos
+// <CoefQuant>   = 1.10
+// <CoefOut>     = 1.12
+//=========================================
 static const uint16_t filter_3tap_16p_upscale[27] = {
-	2048, 2048, 0,
-	1708, 2424, 16348,
-	1372, 2796, 16308,
-	1056, 3148, 16272,
-	768, 3464, 16244,
-	512, 3728, 16236,
-	296, 3928, 16252,
-	124, 4052, 16296,
-	0, 4096, 0
+		0x0804, 0x07FC, 0x0000,
+		0x06AC, 0x0978, 0x3FDC,
+		0x055C, 0x0AF0, 0x3FB4,
+		0x0420, 0x0C50, 0x3F90,
+		0x0300, 0x0D88, 0x3F78,
+		0x0200, 0x0E90, 0x3F70,
+		0x0128, 0x0F5C, 0x3F7C,
+		0x007C, 0x0FD8, 0x3FAC,
+		0x0000, 0x1000, 0x0000
 };
 
-static const uint16_t filter_3tap_16p_117[27] = {
-	2048, 2048, 0,
-	1824, 2276, 16376,
-	1600, 2496, 16380,
-	1376, 2700, 16,
-	1156, 2880, 52,
-	948, 3032, 108,
-	756, 3144, 192,
-	580, 3212, 296,
-	428, 3236, 428
+//=========================================
+// <num_taps>    = 3
+// <num_phases>  = 16
+// <scale_ratio> = 1.16666 (input/output)
+// <sharpness>   = 0
+// <CoefType>    = ModifiedLanczos
+// <CoefQuant>   = 1.10
+// <CoefOut>     = 1.12
+//=========================================
+static const uint16_t filter_3tap_16p_116[27] = {
+		0x0804, 0x07FC, 0x0000,
+		0x0700, 0x0914, 0x3FEC,
+		0x0604, 0x0A1C, 0x3FE0,
+		0x050C, 0x0B14, 0x3FE0,
+		0x041C, 0x0BF4, 0x3FF0,
+		0x0340, 0x0CB0, 0x0010,
+		0x0274, 0x0D3C, 0x0050,
+		0x01C0, 0x0D94, 0x00AC,
+		0x0128, 0x0DB4, 0x0124
 };
 
-static const uint16_t filter_3tap_16p_150[27] = {
-	2048, 2048, 0,
-	1872, 2184, 36,
-	1692, 2308, 88,
-	1516, 2420, 156,
-	1340, 2516, 236,
-	1168, 2592, 328,
-	1004, 2648, 440,
-	844, 2684, 560,
-	696, 2696, 696
+//=========================================
+// <num_taps>    = 3
+// <num_phases>  = 16
+// <scale_ratio> = 1.49999 (input/output)
+// <sharpness>   = 0
+// <CoefType>    = ModifiedLanczos
+// <CoefQuant>   = 1.10
+// <CoefOut>     = 1.12
+//=========================================
+static const uint16_t filter_3tap_16p_149[27] = {
+		0x0804, 0x07FC, 0x0000,
+		0x0730, 0x08CC, 0x0004,
+		0x0660, 0x098C, 0x0014,
+		0x0590, 0x0A3C, 0x0034,
+		0x04C4, 0x0AD4, 0x0068,
+		0x0400, 0x0B54, 0x00AC,
+		0x0348, 0x0BB0, 0x0108,
+		0x029C, 0x0BEC, 0x0178,
+		0x0200, 0x0C00, 0x0200
 };
 
+//=========================================
+// <num_taps>    = 3
+// <num_phases>  = 16
+// <scale_ratio> = 1.83332 (input/output)
+// <sharpness>   = 0
+// <CoefType>    = ModifiedLanczos
+// <CoefQuant>   = 1.10
+// <CoefOut>     = 1.12
+//=========================================
 static const uint16_t filter_3tap_16p_183[27] = {
-	2048, 2048, 0,
-	1892, 2104, 92,
-	1744, 2152, 196,
-	1592, 2196, 300,
-	1448, 2232, 412,
-	1304, 2256, 528,
-	1168, 2276, 648,
-	1032, 2288, 772,
-	900, 2292, 900
+		0x0804, 0x07FC, 0x0000,
+		0x0754, 0x0880, 0x002C,
+		0x06A8, 0x08F0, 0x0068,
+		0x05FC, 0x0954, 0x00B0,
+		0x0550, 0x09AC, 0x0104,
+		0x04A8, 0x09F0, 0x0168,
+		0x0408, 0x0A20, 0x01D8,
+		0x036C, 0x0A40, 0x0254,
+		0x02DC, 0x0A48, 0x02DC
 };
 
+//=========================================
+// <num_taps>    = 4
+// <num_phases>  = 16
+// <scale_ratio> = 0.83333 (input/output)
+// <sharpness>   = 0
+// <CoefType>    = ModifiedLanczos
+// <CoefQuant>   = 1.10
+// <CoefOut>     = 1.12
+//=========================================
 static const uint16_t filter_4tap_16p_upscale[36] = {
-	0, 4096, 0, 0,
-	16240, 4056, 180, 16380,
-	16136, 3952, 404, 16364,
-	16072, 3780, 664, 16344,
-	16040, 3556, 952, 16312,
-	16036, 3284, 1268, 16272,
-	16052, 2980, 1604, 16224,
-	16084, 2648, 1952, 16176,
-	16128, 2304, 2304, 16128
+		0x0000, 0x1000, 0x0000, 0x0000,
+		0x3F74, 0x0FDC, 0x00B4, 0x3FFC,
+		0x3F0C, 0x0F70, 0x0194, 0x3FF0,
+		0x3ECC, 0x0EC4, 0x0298, 0x3FD8,
+		0x3EAC, 0x0DE4, 0x03B8, 0x3FB8,
+		0x3EA4, 0x0CD8, 0x04F4, 0x3F90,
+		0x3EB8, 0x0BA0, 0x0644, 0x3F64,
+		0x3ED8, 0x0A54, 0x07A0, 0x3F34,
+		0x3F00, 0x08FC, 0x0900, 0x3F04
 };
 
-static const uint16_t filter_4tap_16p_117[36] = {
-	428, 3236, 428, 0,
-	276, 3232, 604, 16364,
-	148, 3184, 800, 16340,
-	44, 3104, 1016, 16312,
-	16344, 2984, 1244, 16284,
-	16284, 2832, 1488, 16256,
-	16244, 2648, 1732, 16236,
-	16220, 2440, 1976, 16220,
-	16212, 2216, 2216, 16212
+//=========================================
+// <num_taps>    = 4
+// <num_phases>  = 16
+// <scale_ratio> = 1.16666 (input/output)
+// <sharpness>   = 0
+// <CoefType>    = ModifiedLanczos
+// <CoefQuant>   = 1.10
+// <CoefOut>     = 1.12
+//=========================================
+static const uint16_t filter_4tap_16p_116[36] = {
+		0x01A8, 0x0CB4, 0x01A4, 0x0000,
+		0x0110, 0x0CB0, 0x0254, 0x3FEC,
+		0x0090, 0x0C80, 0x031C, 0x3FD4,
+		0x0024, 0x0C2C, 0x03F4, 0x3FBC,
+		0x3FD8, 0x0BAC, 0x04DC, 0x3FA0,
+		0x3F9C, 0x0B14, 0x05CC, 0x3F84,
+		0x3F70, 0x0A60, 0x06C4, 0x3F6C,
+		0x3F5C, 0x098C, 0x07BC, 0x3F5C,
+		0x3F54, 0x08AC, 0x08AC, 0x3F54
 };
 
-static const uint16_t filter_4tap_16p_150[36] = {
-	696, 2700, 696, 0,
-	560, 2700, 848, 16364,
-	436, 2676, 1008, 16348,
-	328, 2628, 1180, 16336,
-	232, 2556, 1356, 16328,
-	152, 2460, 1536, 16328,
-	84, 2344, 1716, 16332,
-	28, 2208, 1888, 16348,
-	16376, 2052, 2052, 16376
+//=========================================
+// <num_taps>    = 4
+// <num_phases>  = 16
+// <scale_ratio> = 1.49999 (input/output)
+// <sharpness>   = 0
+// <CoefType>    = ModifiedLanczos
+// <CoefQuant>   = 1.10
+// <CoefOut>     = 1.12
+//=========================================
+static const uint16_t filter_4tap_16p_149[36] = {
+		0x02B8, 0x0A90, 0x02B8, 0x0000,
+		0x0230, 0x0A90, 0x0350, 0x3FF0,
+		0x01B8, 0x0A78, 0x03F0, 0x3FE0,
+		0x0148, 0x0A48, 0x049C, 0x3FD4,
+		0x00E8, 0x0A00, 0x054C, 0x3FCC,
+		0x0098, 0x09A0, 0x0600, 0x3FC8,
+		0x0054, 0x0928, 0x06B4, 0x3FD0,
+		0x001C, 0x08A4, 0x0760, 0x3FE0,
+		0x3FFC, 0x0804, 0x0804, 0x3FFC
 };
 
+//=========================================
+// <num_taps>    = 4
+// <num_phases>  = 16
+// <scale_ratio> = 1.83332 (input/output)
+// <sharpness>   = 0
+// <CoefType>    = ModifiedLanczos
+// <CoefQuant>   = 1.10
+// <CoefOut>     = 1.12
+//=========================================
 static const uint16_t filter_4tap_16p_183[36] = {
-	940, 2208, 940, 0,
-	832, 2200, 1052, 4,
-	728, 2180, 1164, 16,
-	628, 2148, 1280, 36,
-	536, 2100, 1392, 60,
-	448, 2044, 1504, 92,
-	368, 1976, 1612, 132,
-	296, 1900, 1716, 176,
-	232, 1812, 1812, 232
+		0x03B0, 0x08A0, 0x03B0, 0x0000,
+		0x0348, 0x0898, 0x041C, 0x0004,
+		0x02DC, 0x0884, 0x0490, 0x0010,
+		0x0278, 0x0864, 0x0500, 0x0024,
+		0x021C, 0x0838, 0x0570, 0x003C,
+		0x01C8, 0x07FC, 0x05E0, 0x005C,
+		0x0178, 0x07B8, 0x064C, 0x0084,
+		0x0130, 0x076C, 0x06B0, 0x00B4,
+		0x00F0, 0x0714, 0x0710, 0x00EC
 };
 
+//=========================================
+// <num_taps>    = 2
+// <num_phases>  = 64
+// <scale_ratio> = 0.833333 (input/output)
+// <sharpness>   = 0
+// <CoefType> = ModifiedLanczos
+// <CoefQuant> = s1.10
+// <CoefOut> = s1.12
+//=========================================
 static const uint16_t filter_2tap_64p[66] = {
-	4096, 0,
-	4032, 64,
-	3968, 128,
-	3904, 192,
-	3840, 256,
-	3776, 320,
-	3712, 384,
-	3648, 448,
-	3584, 512,
-	3520, 576,
-	3456, 640,
-	3392, 704,
-	3328, 768,
-	3264, 832,
-	3200, 896,
-	3136, 960,
-	3072, 1024,
-	3008, 1088,
-	2944, 1152,
-	2880, 1216,
-	2816, 1280,
-	2752, 1344,
-	2688, 1408,
-	2624, 1472,
-	2560, 1536,
-	2496, 1600,
-	2432, 1664,
-	2368, 1728,
-	2304, 1792,
-	2240, 1856,
-	2176, 1920,
-	2112, 1984,
-	2048, 2048 };
+		0x1000, 0x0000,
+		0x1000, 0x0000,
+		0x0FFC, 0x0004,
+		0x0FF8, 0x0008,
+		0x0FF0, 0x0010,
+		0x0FE4, 0x001C,
+		0x0FD8, 0x0028,
+		0x0FC4, 0x003C,
+		0x0FB0, 0x0050,
+		0x0F98, 0x0068,
+		0x0F7C, 0x0084,
+		0x0F58, 0x00A8,
+		0x0F34, 0x00CC,
+		0x0F08, 0x00F8,
+		0x0ED8, 0x0128,
+		0x0EA4, 0x015C,
+		0x0E68, 0x0198,
+		0x0E28, 0x01D8,
+		0x0DE4, 0x021C,
+		0x0D98, 0x0268,
+		0x0D44, 0x02BC,
+		0x0CEC, 0x0314,
+		0x0C90, 0x0370,
+		0x0C2C, 0x03D4,
+		0x0BC4, 0x043C,
+		0x0B58, 0x04A8,
+		0x0AE8, 0x0518,
+		0x0A74, 0x058C,
+		0x09FC, 0x0604,
+		0x0980, 0x0680,
+		0x0900, 0x0700,
+		0x0880, 0x0780,
+		0x0800, 0x0800
+};
 
+//=========================================
+// <num_taps>    = 3
+// <num_phases>  = 64
+// <scale_ratio> = 0.83333 (input/output)
+// <sharpness>   = 0
+// <CoefType>    = ModifiedLanczos
+// <CoefQuant>   = 1.10
+// <CoefOut>     = 1.12
+//=========================================
 static const uint16_t filter_3tap_64p_upscale[99] = {
-	2048, 2048, 0,
-	1960, 2140, 16376,
-	1876, 2236, 16364,
-	1792, 2328, 16356,
-	1708, 2424, 16348,
-	1620, 2516, 16336,
-	1540, 2612, 16328,
-	1456, 2704, 16316,
-	1372, 2796, 16308,
-	1292, 2884, 16296,
-	1212, 2976, 16288,
-	1136, 3060, 16280,
-	1056, 3148, 16272,
-	984, 3228, 16264,
-	908, 3312, 16256,
-	836, 3388, 16248,
-	768, 3464, 16244,
-	700, 3536, 16240,
-	636, 3604, 16236,
-	572, 3668, 16236,
-	512, 3728, 16236,
-	456, 3784, 16236,
-	400, 3836, 16240,
-	348, 3884, 16244,
-	296, 3928, 16252,
-	252, 3964, 16260,
-	204, 4000, 16268,
-	164, 4028, 16284,
-	124, 4052, 16296,
-	88, 4072, 16316,
-	56, 4084, 16336,
-	24, 4092, 16356,
-	0, 4096, 0
+		0x0804, 0x07FC, 0x0000,
+		0x07A8, 0x0860, 0x3FF8,
+		0x0754, 0x08BC, 0x3FF0,
+		0x0700, 0x0918, 0x3FE8,
+		0x06AC, 0x0978, 0x3FDC,
+		0x0654, 0x09D8, 0x3FD4,
+		0x0604, 0x0A34, 0x3FC8,
+		0x05B0, 0x0A90, 0x3FC0,
+		0x055C, 0x0AF0, 0x3FB4,
+		0x050C, 0x0B48, 0x3FAC,
+		0x04BC, 0x0BA0, 0x3FA4,
+		0x0470, 0x0BF4, 0x3F9C,
+		0x0420, 0x0C50, 0x3F90,
+		0x03D8, 0x0C9C, 0x3F8C,
+		0x038C, 0x0CF0, 0x3F84,
+		0x0344, 0x0D40, 0x3F7C,
+		0x0300, 0x0D88, 0x3F78,
+		0x02BC, 0x0DD0, 0x3F74,
+		0x027C, 0x0E14, 0x3F70,
+		0x023C, 0x0E54, 0x3F70,
+		0x0200, 0x0E90, 0x3F70,
+		0x01C8, 0x0EC8, 0x3F70,
+		0x0190, 0x0EFC, 0x3F74,
+		0x015C, 0x0F2C, 0x3F78,
+		0x0128, 0x0F5C, 0x3F7C,
+		0x00FC, 0x0F7C, 0x3F88,
+		0x00CC, 0x0FA4, 0x3F90,
+		0x00A4, 0x0FC0, 0x3F9C,
+		0x007C, 0x0FD8, 0x3FAC,
+		0x0058, 0x0FE8, 0x3FC0,
+		0x0038, 0x0FF4, 0x3FD4,
+		0x0018, 0x1000, 0x3FE8,
+		0x0000, 0x1000, 0x0000
 };
 
-static const uint16_t filter_3tap_64p_117[99] = {
-	2048, 2048, 0,
-	1992, 2104, 16380,
-	1936, 2160, 16380,
-	1880, 2220, 16376,
-	1824, 2276, 16376,
-	1768, 2332, 16376,
-	1712, 2388, 16376,
-	1656, 2444, 16376,
-	1600, 2496, 16380,
-	1544, 2548, 0,
-	1488, 2600, 4,
-	1432, 2652, 8,
-	1376, 2700, 16,
-	1320, 2748, 20,
-	1264, 2796, 32,
-	1212, 2840, 40,
-	1156, 2880, 52,
-	1104, 2920, 64,
-	1052, 2960, 80,
-	1000, 2996, 92,
-	948, 3032, 108,
-	900, 3060, 128,
-	852, 3092, 148,
-	804, 3120, 168,
-	756, 3144, 192,
-	712, 3164, 216,
-	668, 3184, 240,
-	624, 3200, 268,
-	580, 3212, 296,
-	540, 3220, 328,
-	500, 3228, 360,
-	464, 3232, 392,
-	428, 3236, 428
+//=========================================
+// <num_taps>    = 3
+// <num_phases>  = 64
+// <scale_ratio> = 1.16666 (input/output)
+// <sharpness>   = 0
+// <CoefType>    = ModifiedLanczos
+// <CoefQuant>   = 1.10
+// <CoefOut>     = 1.12
+//=========================================
+static const uint16_t filter_3tap_64p_116[99] = {
+		0x0804, 0x07FC, 0x0000,
+		0x07C0, 0x0844, 0x3FFC,
+		0x0780, 0x0888, 0x3FF8,
+		0x0740, 0x08D0, 0x3FF0,
+		0x0700, 0x0914, 0x3FEC,
+		0x06C0, 0x0958, 0x3FE8,
+		0x0684, 0x0998, 0x3FE4,
+		0x0644, 0x09DC, 0x3FE0,
+		0x0604, 0x0A1C, 0x3FE0,
+		0x05C4, 0x0A5C, 0x3FE0,
+		0x0588, 0x0A9C, 0x3FDC,
+		0x0548, 0x0ADC, 0x3FDC,
+		0x050C, 0x0B14, 0x3FE0,
+		0x04CC, 0x0B54, 0x3FE0,
+		0x0490, 0x0B8C, 0x3FE4,
+		0x0458, 0x0BC0, 0x3FE8,
+		0x041C, 0x0BF4, 0x3FF0,
+		0x03E0, 0x0C28, 0x3FF8,
+		0x03A8, 0x0C58, 0x0000,
+		0x0374, 0x0C88, 0x0004,
+		0x0340, 0x0CB0, 0x0010,
+		0x0308, 0x0CD8, 0x0020,
+		0x02D8, 0x0CFC, 0x002C,
+		0x02A0, 0x0D20, 0x0040,
+		0x0274, 0x0D3C, 0x0050,
+		0x0244, 0x0D58, 0x0064,
+		0x0214, 0x0D70, 0x007C,
+		0x01E8, 0x0D84, 0x0094,
+		0x01C0, 0x0D94, 0x00AC,
+		0x0198, 0x0DA0, 0x00C8,
+		0x0170, 0x0DAC, 0x00E4,
+		0x014C, 0x0DB0, 0x0104,
+		0x0128, 0x0DB4, 0x0124
 };
 
-static const uint16_t filter_3tap_64p_150[99] = {
-	2048, 2048, 0,
-	2004, 2080, 8,
-	1960, 2116, 16,
-	1916, 2148, 28,
-	1872, 2184, 36,
-	1824, 2216, 48,
-	1780, 2248, 60,
-	1736, 2280, 76,
-	1692, 2308, 88,
-	1648, 2336, 104,
-	1604, 2368, 120,
-	1560, 2392, 136,
-	1516, 2420, 156,
-	1472, 2444, 172,
-	1428, 2472, 192,
-	1384, 2492, 212,
-	1340, 2516, 236,
-	1296, 2536, 256,
-	1252, 2556, 280,
-	1212, 2576, 304,
-	1168, 2592, 328,
-	1124, 2608, 356,
-	1084, 2624, 384,
-	1044, 2636, 412,
-	1004, 2648, 440,
-	964, 2660, 468,
-	924, 2668, 500,
-	884, 2676, 528,
-	844, 2684, 560,
-	808, 2688, 596,
-	768, 2692, 628,
-	732, 2696, 664,
-	696, 2696, 696
+//=========================================
+// <num_taps>    = 3
+// <num_phases>  = 64
+// <scale_ratio> = 1.49999 (input/output)
+// <sharpness>   = 0
+// <CoefType>    = ModifiedLanczos
+// <CoefQuant>   = 1.10
+// <CoefOut>     = 1.12
+//=========================================
+static const uint16_t filter_3tap_64p_149[99] = {
+		0x0804, 0x07FC, 0x0000,
+		0x07CC, 0x0834, 0x0000,
+		0x0798, 0x0868, 0x0000,
+		0x0764, 0x089C, 0x0000,
+		0x0730, 0x08CC, 0x0004,
+		0x0700, 0x08FC, 0x0004,
+		0x06CC, 0x092C, 0x0008,
+		0x0698, 0x095C, 0x000C,
+		0x0660, 0x098C, 0x0014,
+		0x062C, 0x09B8, 0x001C,
+		0x05FC, 0x09E4, 0x0020,
+		0x05C4, 0x0A10, 0x002C,
+		0x0590, 0x0A3C, 0x0034,
+		0x055C, 0x0A64, 0x0040,
+		0x0528, 0x0A8C, 0x004C,
+		0x04F8, 0x0AB0, 0x0058,
+		0x04C4, 0x0AD4, 0x0068,
+		0x0490, 0x0AF8, 0x0078,
+		0x0460, 0x0B18, 0x0088,
+		0x0430, 0x0B38, 0x0098,
+		0x0400, 0x0B54, 0x00AC,
+		0x03D0, 0x0B6C, 0x00C4,
+		0x03A0, 0x0B88, 0x00D8,
+		0x0374, 0x0B9C, 0x00F0,
+		0x0348, 0x0BB0, 0x0108,
+		0x0318, 0x0BC4, 0x0124,
+		0x02EC, 0x0BD4, 0x0140,
+		0x02C4, 0x0BE0, 0x015C,
+		0x029C, 0x0BEC, 0x0178,
+		0x0274, 0x0BF4, 0x0198,
+		0x024C, 0x0BFC, 0x01B8,
+		0x0228, 0x0BFC, 0x01DC,
+		0x0200, 0x0C00, 0x0200
 };
 
+//=========================================
+// <num_taps>    = 3
+// <num_phases>  = 64
+// <scale_ratio> = 1.83332 (input/output)
+// <sharpness>   = 0
+// <CoefType>    = ModifiedLanczos
+// <CoefQuant>   = 1.10
+// <CoefOut>     = 1.12
+//=========================================
 static const uint16_t filter_3tap_64p_183[99] = {
-	2048, 2048, 0,
-	2008, 2060, 20,
-	1968, 2076, 44,
-	1932, 2088, 68,
-	1892, 2104, 92,
-	1856, 2116, 120,
-	1816, 2128, 144,
-	1780, 2140, 168,
-	1744, 2152, 196,
-	1704, 2164, 220,
-	1668, 2176, 248,
-	1632, 2188, 272,
-	1592, 2196, 300,
-	1556, 2204, 328,
-	1520, 2216, 356,
-	1484, 2224, 384,
-	1448, 2232, 412,
-	1412, 2240, 440,
-	1376, 2244, 468,
-	1340, 2252, 496,
-	1304, 2256, 528,
-	1272, 2264, 556,
-	1236, 2268, 584,
-	1200, 2272, 616,
-	1168, 2276, 648,
-	1132, 2280, 676,
-	1100, 2284, 708,
-	1064, 2288, 740,
-	1032, 2288, 772,
-	996, 2292, 800,
-	964, 2292, 832,
-	932, 2292, 868,
-	900, 2292, 900
+		0x0804, 0x07FC, 0x0000,
+		0x07D4, 0x0824, 0x0008,
+		0x07AC, 0x0840, 0x0014,
+		0x0780, 0x0860, 0x0020,
+		0x0754, 0x0880, 0x002C,
+		0x0728, 0x089C, 0x003C,
+		0x0700, 0x08B8, 0x0048,
+		0x06D4, 0x08D4, 0x0058,
+		0x06A8, 0x08F0, 0x0068,
+		0x067C, 0x090C, 0x0078,
+		0x0650, 0x0924, 0x008C,
+		0x0628, 0x093C, 0x009C,
+		0x05FC, 0x0954, 0x00B0,
+		0x05D0, 0x096C, 0x00C4,
+		0x05A8, 0x0980, 0x00D8,
+		0x0578, 0x0998, 0x00F0,
+		0x0550, 0x09AC, 0x0104,
+		0x0528, 0x09BC, 0x011C,
+		0x04FC, 0x09D0, 0x0134,
+		0x04D4, 0x09E0, 0x014C,
+		0x04A8, 0x09F0, 0x0168,
+		0x0480, 0x09FC, 0x0184,
+		0x045C, 0x0A08, 0x019C,
+		0x0434, 0x0A14, 0x01B8,
+		0x0408, 0x0A20, 0x01D8,
+		0x03E0, 0x0A2C, 0x01F4,
+		0x03B8, 0x0A34, 0x0214,
+		0x0394, 0x0A38, 0x0234,
+		0x036C, 0x0A40, 0x0254,
+		0x0348, 0x0A44, 0x0274,
+		0x0324, 0x0A48, 0x0294,
+		0x0300, 0x0A48, 0x02B8,
+		0x02DC, 0x0A48, 0x02DC
 };
 
+//=========================================
+// <num_taps>    = 4
+// <num_phases>  = 64
+// <scale_ratio> = 0.83333 (input/output)
+// <sharpness>   = 0
+// <CoefType>    = ModifiedLanczos
+// <CoefQuant>   = 1.10
+// <CoefOut>     = 1.12
+//=========================================
 static const uint16_t filter_4tap_64p_upscale[132] = {
-	0, 4096, 0, 0,
-	16344, 4092, 40, 0,
-	16308, 4084, 84, 16380,
-	16272, 4072, 132, 16380,
-	16240, 4056, 180, 16380,
-	16212, 4036, 232, 16376,
-	16184, 4012, 288, 16372,
-	16160, 3984, 344, 16368,
-	16136, 3952, 404, 16364,
-	16116, 3916, 464, 16360,
-	16100, 3872, 528, 16356,
-	16084, 3828, 596, 16348,
-	16072, 3780, 664, 16344,
-	16060, 3728, 732, 16336,
-	16052, 3676, 804, 16328,
-	16044, 3616, 876, 16320,
-	16040, 3556, 952, 16312,
-	16036, 3492, 1028, 16300,
-	16032, 3424, 1108, 16292,
-	16032, 3356, 1188, 16280,
-	16036, 3284, 1268, 16272,
-	16036, 3212, 1352, 16260,
-	16040, 3136, 1436, 16248,
-	16044, 3056, 1520, 16236,
-	16052, 2980, 1604, 16224,
-	16060, 2896, 1688, 16212,
-	16064, 2816, 1776, 16200,
-	16076, 2732, 1864, 16188,
-	16084, 2648, 1952, 16176,
-	16092, 2564, 2040, 16164,
-	16104, 2476, 2128, 16152,
-	16116, 2388, 2216, 16140,
-	16128, 2304, 2304, 16128 };
+		0x0000, 0x1000, 0x0000, 0x0000,
+		0x3FDC, 0x0FFC, 0x0028, 0x0000,
+		0x3FB4, 0x0FF8, 0x0054, 0x0000,
+		0x3F94, 0x0FE8, 0x0084, 0x0000,
+		0x3F74, 0x0FDC, 0x00B4, 0x3FFC,
+		0x3F58, 0x0FC4, 0x00E8, 0x3FFC,
+		0x3F3C, 0x0FAC, 0x0120, 0x3FF8,
+		0x3F24, 0x0F90, 0x0158, 0x3FF4,
+		0x3F0C, 0x0F70, 0x0194, 0x3FF0,
+		0x3EF8, 0x0F4C, 0x01D0, 0x3FEC,
+		0x3EE8, 0x0F20, 0x0210, 0x3FE8,
+		0x3ED8, 0x0EF4, 0x0254, 0x3FE0,
+		0x3ECC, 0x0EC4, 0x0298, 0x3FD8,
+		0x3EC0, 0x0E90, 0x02DC, 0x3FD4,
+		0x3EB8, 0x0E58, 0x0324, 0x3FCC,
+		0x3EB0, 0x0E20, 0x036C, 0x3FC4,
+		0x3EAC, 0x0DE4, 0x03B8, 0x3FB8,
+		0x3EA8, 0x0DA4, 0x0404, 0x3FB0,
+		0x3EA4, 0x0D60, 0x0454, 0x3FA8,
+		0x3EA4, 0x0D1C, 0x04A4, 0x3F9C,
+		0x3EA4, 0x0CD8, 0x04F4, 0x3F90,
+		0x3EA8, 0x0C88, 0x0548, 0x3F88,
+		0x3EAC, 0x0C3C, 0x059C, 0x3F7C,
+		0x3EB0, 0x0BF0, 0x05F0, 0x3F70,
+		0x3EB8, 0x0BA0, 0x0644, 0x3F64,
+		0x3EBC, 0x0B54, 0x0698, 0x3F58,
+		0x3EC4, 0x0B00, 0x06F0, 0x3F4C,
+		0x3ECC, 0x0AAC, 0x0748, 0x3F40,
+		0x3ED8, 0x0A54, 0x07A0, 0x3F34,
+		0x3EE0, 0x0A04, 0x07F8, 0x3F24,
+		0x3EEC, 0x09AC, 0x0850, 0x3F18,
+		0x3EF8, 0x0954, 0x08A8, 0x3F0C,
+		0x3F00, 0x08FC, 0x0900, 0x3F04
+};
 
-static const uint16_t filter_4tap_64p_117[132] = {
-	420, 3248, 420, 0,
-	380, 3248, 464, 16380,
-	344, 3248, 508, 16372,
-	308, 3248, 552, 16368,
-	272, 3240, 596, 16364,
-	236, 3236, 644, 16356,
-	204, 3224, 692, 16352,
-	172, 3212, 744, 16344,
-	144, 3196, 796, 16340,
-	116, 3180, 848, 16332,
-	88, 3160, 900, 16324,
-	60, 3136, 956, 16320,
-	36, 3112, 1012, 16312,
-	16, 3084, 1068, 16304,
-	16380, 3056, 1124, 16296,
-	16360, 3024, 1184, 16292,
-	16340, 2992, 1244, 16284,
-	16324, 2956, 1304, 16276,
-	16308, 2920, 1364, 16268,
-	16292, 2880, 1424, 16264,
-	16280, 2836, 1484, 16256,
-	16268, 2792, 1548, 16252,
-	16256, 2748, 1608, 16244,
-	16248, 2700, 1668, 16240,
-	16240, 2652, 1732, 16232,
-	16232, 2604, 1792, 16228,
-	16228, 2552, 1856, 16224,
-	16220, 2500, 1916, 16220,
-	16216, 2444, 1980, 16216,
-	16216, 2388, 2040, 16216,
-	16212, 2332, 2100, 16212,
-	16212, 2276, 2160, 16212,
-	16212, 2220, 2220, 16212 };
+//=========================================
+// <num_taps>    = 4
+// <num_phases>  = 64
+// <scale_ratio> = 1.16666 (input/output)
+// <sharpness>   = 0
+// <CoefType>    = ModifiedLanczos
+// <CoefQuant>   = 1.10
+// <CoefOut>     = 1.12
+//=========================================
+static const uint16_t filter_4tap_64p_116[132] = {
+		0x01A8, 0x0CB4, 0x01A4, 0x0000,
+		0x017C, 0x0CB8, 0x01D0, 0x3FFC,
+		0x0158, 0x0CB8, 0x01F8, 0x3FF8,
+		0x0130, 0x0CB4, 0x0228, 0x3FF4,
+		0x0110, 0x0CB0, 0x0254, 0x3FEC,
+		0x00EC, 0x0CA8, 0x0284, 0x3FE8,
+		0x00CC, 0x0C9C, 0x02B4, 0x3FE4,
+		0x00AC, 0x0C90, 0x02E8, 0x3FDC,
+		0x0090, 0x0C80, 0x031C, 0x3FD4,
+		0x0070, 0x0C70, 0x0350, 0x3FD0,
+		0x0058, 0x0C5C, 0x0384, 0x3FC8,
+		0x003C, 0x0C48, 0x03BC, 0x3FC0,
+		0x0024, 0x0C2C, 0x03F4, 0x3FBC,
+		0x0010, 0x0C10, 0x042C, 0x3FB4,
+		0x3FFC, 0x0BF4, 0x0464, 0x3FAC,
+		0x3FE8, 0x0BD4, 0x04A0, 0x3FA4,
+		0x3FD8, 0x0BAC, 0x04DC, 0x3FA0,
+		0x3FC4, 0x0B8C, 0x0518, 0x3F98,
+		0x3FB4, 0x0B68, 0x0554, 0x3F90,
+		0x3FA8, 0x0B40, 0x0590, 0x3F88,
+		0x3F9C, 0x0B14, 0x05CC, 0x3F84,
+		0x3F90, 0x0AEC, 0x0608, 0x3F7C,
+		0x3F84, 0x0ABC, 0x0648, 0x3F78,
+		0x3F7C, 0x0A90, 0x0684, 0x3F70,
+		0x3F70, 0x0A60, 0x06C4, 0x3F6C,
+		0x3F6C, 0x0A2C, 0x0700, 0x3F68,
+		0x3F64, 0x09F8, 0x0740, 0x3F64,
+		0x3F60, 0x09C4, 0x077C, 0x3F60,
+		0x3F5C, 0x098C, 0x07BC, 0x3F5C,
+		0x3F58, 0x0958, 0x07F8, 0x3F58,
+		0x3F58, 0x091C, 0x0834, 0x3F58,
+		0x3F54, 0x08E4, 0x0870, 0x3F58,
+		0x3F54, 0x08AC, 0x08AC, 0x3F54
+};
 
-static const uint16_t filter_4tap_64p_150[132] = {
-	696, 2700, 696, 0,
-	660, 2704, 732, 16380,
-	628, 2704, 768, 16376,
-	596, 2704, 804, 16372,
-	564, 2700, 844, 16364,
-	532, 2696, 884, 16360,
-	500, 2692, 924, 16356,
-	472, 2684, 964, 16352,
-	440, 2676, 1004, 16352,
-	412, 2668, 1044, 16348,
-	384, 2656, 1088, 16344,
-	360, 2644, 1128, 16340,
-	332, 2632, 1172, 16336,
-	308, 2616, 1216, 16336,
-	284, 2600, 1260, 16332,
-	260, 2580, 1304, 16332,
-	236, 2560, 1348, 16328,
-	216, 2540, 1392, 16328,
-	196, 2516, 1436, 16328,
-	176, 2492, 1480, 16324,
-	156, 2468, 1524, 16324,
-	136, 2440, 1568, 16328,
-	120, 2412, 1612, 16328,
-	104, 2384, 1656, 16328,
-	88, 2352, 1700, 16332,
-	72, 2324, 1744, 16332,
-	60, 2288, 1788, 16336,
-	48, 2256, 1828, 16340,
-	36, 2220, 1872, 16344,
-	24, 2184, 1912, 16352,
-	12, 2148, 1952, 16356,
-	4, 2112, 1996, 16364,
-	16380, 2072, 2036, 16372 };
+//=========================================
+// <num_taps>    = 4
+// <num_phases>  = 64
+// <scale_ratio> = 1.49999 (input/output)
+// <sharpness>   = 0
+// <CoefType>    = ModifiedLanczos
+// <CoefQuant>   = 1.10
+// <CoefOut>     = 1.12
+//=========================================
+static const uint16_t filter_4tap_64p_149[132] = {
+		0x02B8, 0x0A90, 0x02B8, 0x0000,
+		0x0294, 0x0A94, 0x02DC, 0x3FFC,
+		0x0274, 0x0A94, 0x0300, 0x3FF8,
+		0x0250, 0x0A94, 0x0328, 0x3FF4,
+		0x0230, 0x0A90, 0x0350, 0x3FF0,
+		0x0214, 0x0A8C, 0x0374, 0x3FEC,
+		0x01F0, 0x0A88, 0x03A0, 0x3FE8,
+		0x01D4, 0x0A80, 0x03C8, 0x3FE4,
+		0x01B8, 0x0A78, 0x03F0, 0x3FE0,
+		0x0198, 0x0A70, 0x041C, 0x3FDC,
+		0x0180, 0x0A64, 0x0444, 0x3FD8,
+		0x0164, 0x0A54, 0x0470, 0x3FD8,
+		0x0148, 0x0A48, 0x049C, 0x3FD4,
+		0x0130, 0x0A38, 0x04C8, 0x3FD0,
+		0x0118, 0x0A24, 0x04F4, 0x3FD0,
+		0x0100, 0x0A14, 0x0520, 0x3FCC,
+		0x00E8, 0x0A00, 0x054C, 0x3FCC,
+		0x00D4, 0x09E8, 0x057C, 0x3FC8,
+		0x00C0, 0x09D0, 0x05A8, 0x3FC8,
+		0x00AC, 0x09B8, 0x05D4, 0x3FC8,
+		0x0098, 0x09A0, 0x0600, 0x3FC8,
+		0x0084, 0x0984, 0x0630, 0x3FC8,
+		0x0074, 0x0964, 0x065C, 0x3FCC,
+		0x0064, 0x0948, 0x0688, 0x3FCC,
+		0x0054, 0x0928, 0x06B4, 0x3FD0,
+		0x0044, 0x0908, 0x06E0, 0x3FD4,
+		0x0038, 0x08E8, 0x070C, 0x3FD4,
+		0x002C, 0x08C4, 0x0738, 0x3FD8,
+		0x001C, 0x08A4, 0x0760, 0x3FE0,
+		0x0014, 0x087C, 0x078C, 0x3FE4,
+		0x0008, 0x0858, 0x07B4, 0x3FEC,
+		0x0000, 0x0830, 0x07DC, 0x3FF4,
+		0x3FFC, 0x0804, 0x0804, 0x3FFC
+};
 
+//=========================================
+// <num_taps>    = 4
+// <num_phases>  = 64
+// <scale_ratio> = 1.83332 (input/output)
+// <sharpness>   = 0
+// <CoefType>    = ModifiedLanczos
+// <CoefQuant>   = 1.10
+// <CoefOut>     = 1.12
+//=========================================
 static const uint16_t filter_4tap_64p_183[132] = {
-	944, 2204, 944, 0,
-	916, 2204, 972, 0,
-	888, 2200, 996, 0,
-	860, 2200, 1024, 4,
-	832, 2196, 1052, 4,
-	808, 2192, 1080, 8,
-	780, 2188, 1108, 12,
-	756, 2180, 1140, 12,
-	728, 2176, 1168, 16,
-	704, 2168, 1196, 20,
-	680, 2160, 1224, 24,
-	656, 2152, 1252, 28,
-	632, 2144, 1280, 36,
-	608, 2132, 1308, 40,
-	584, 2120, 1336, 48,
-	560, 2112, 1364, 52,
-	536, 2096, 1392, 60,
-	516, 2084, 1420, 68,
-	492, 2072, 1448, 76,
-	472, 2056, 1476, 84,
-	452, 2040, 1504, 92,
-	428, 2024, 1532, 100,
-	408, 2008, 1560, 112,
-	392, 1992, 1584, 120,
-	372, 1972, 1612, 132,
-	352, 1956, 1636, 144,
-	336, 1936, 1664, 156,
-	316, 1916, 1688, 168,
-	300, 1896, 1712, 180,
-	284, 1876, 1736, 192,
-	268, 1852, 1760, 208,
-	252, 1832, 1784, 220,
-	236, 1808, 1808, 236 };
+		0x03B0, 0x08A0, 0x03B0, 0x0000,
+		0x0394, 0x08A0, 0x03CC, 0x0000,
+		0x037C, 0x089C, 0x03E8, 0x0000,
+		0x0360, 0x089C, 0x0400, 0x0004,
+		0x0348, 0x0898, 0x041C, 0x0004,
+		0x032C, 0x0894, 0x0438, 0x0008,
+		0x0310, 0x0890, 0x0454, 0x000C,
+		0x02F8, 0x0888, 0x0474, 0x000C,
+		0x02DC, 0x0884, 0x0490, 0x0010,
+		0x02C4, 0x087C, 0x04AC, 0x0014,
+		0x02AC, 0x0874, 0x04C8, 0x0018,
+		0x0290, 0x086C, 0x04E4, 0x0020,
+		0x0278, 0x0864, 0x0500, 0x0024,
+		0x0264, 0x0858, 0x051C, 0x0028,
+		0x024C, 0x084C, 0x0538, 0x0030,
+		0x0234, 0x0844, 0x0554, 0x0034,
+		0x021C, 0x0838, 0x0570, 0x003C,
+		0x0208, 0x0828, 0x058C, 0x0044,
+		0x01F0, 0x081C, 0x05A8, 0x004C,
+		0x01DC, 0x080C, 0x05C4, 0x0054,
+		0x01C8, 0x07FC, 0x05E0, 0x005C,
+		0x01B4, 0x07EC, 0x05FC, 0x0064,
+		0x019C, 0x07DC, 0x0618, 0x0070,
+		0x018C, 0x07CC, 0x0630, 0x0078,
+		0x0178, 0x07B8, 0x064C, 0x0084,
+		0x0164, 0x07A8, 0x0664, 0x0090,
+		0x0150, 0x0794, 0x0680, 0x009C,
+		0x0140, 0x0780, 0x0698, 0x00A8,
+		0x0130, 0x076C, 0x06B0, 0x00B4,
+		0x0120, 0x0758, 0x06C8, 0x00C0,
+		0x0110, 0x0740, 0x06E0, 0x00D0,
+		0x0100, 0x072C, 0x06F8, 0x00DC,
+		0x00F0, 0x0714, 0x0710, 0x00EC
+};
 
+//=========================================
+// <num_taps>    = 5
+// <num_phases>  = 64
+// <scale_ratio> = 0.83333 (input/output)
+// <sharpness>   = 0
+// <CoefType>    = ModifiedLanczos
+// <CoefQuant>   = 1.10
+// <CoefOut>     = 1.12
+//=========================================
 static const uint16_t filter_5tap_64p_upscale[165] = {
-	15936, 2496, 2496, 15936, 0,
-	15948, 2404, 2580, 15924, 0,
-	15960, 2312, 2664, 15912, 4,
-	15976, 2220, 2748, 15904, 8,
-	15992, 2128, 2832, 15896, 12,
-	16004, 2036, 2912, 15888, 16,
-	16020, 1944, 2992, 15880, 20,
-	16036, 1852, 3068, 15876, 20,
-	16056, 1760, 3140, 15876, 24,
-	16072, 1668, 3216, 15872, 28,
-	16088, 1580, 3284, 15872, 32,
-	16104, 1492, 3352, 15876, 32,
-	16120, 1404, 3420, 15876, 36,
-	16140, 1316, 3480, 15884, 40,
-	16156, 1228, 3540, 15892, 40,
-	16172, 1144, 3600, 15900, 40,
-	16188, 1060, 3652, 15908, 44,
-	16204, 980, 3704, 15924, 44,
-	16220, 900, 3756, 15936, 44,
-	16236, 824, 3800, 15956, 44,
-	16248, 744, 3844, 15972, 44,
-	16264, 672, 3884, 15996, 44,
-	16276, 600, 3920, 16020, 44,
-	16292, 528, 3952, 16044, 40,
-	16304, 460, 3980, 16072, 40,
-	16316, 396, 4008, 16104, 36,
-	16328, 332, 4032, 16136, 32,
-	16336, 272, 4048, 16172, 28,
-	16348, 212, 4064, 16208, 24,
-	16356, 156, 4080, 16248, 16,
-	16368, 100, 4088, 16292, 12,
-	16376, 48, 4092, 16336, 4,
-	0, 0, 4096, 0, 0 };
+		0x3E40, 0x09C0, 0x09C0, 0x3E40, 0x0000,
+		0x3E50, 0x0964, 0x0A18, 0x3E34, 0x0000,
+		0x3E5C, 0x0908, 0x0A6C, 0x3E2C, 0x0004,
+		0x3E6C, 0x08AC, 0x0AC0, 0x3E20, 0x0008,
+		0x3E78, 0x0850, 0x0B14, 0x3E18, 0x000C,
+		0x3E88, 0x07F4, 0x0B60, 0x3E14, 0x0010,
+		0x3E98, 0x0798, 0x0BB0, 0x3E0C, 0x0014,
+		0x3EA8, 0x073C, 0x0C00, 0x3E08, 0x0014,
+		0x3EB8, 0x06E4, 0x0C48, 0x3E04, 0x0018,
+		0x3ECC, 0x0684, 0x0C90, 0x3E04, 0x001C,
+		0x3EDC, 0x062C, 0x0CD4, 0x3E04, 0x0020,
+		0x3EEC, 0x05D4, 0x0D1C, 0x3E04, 0x0020,
+		0x3EFC, 0x057C, 0x0D5C, 0x3E08, 0x0024,
+		0x3F0C, 0x0524, 0x0D98, 0x3E10, 0x0028,
+		0x3F20, 0x04CC, 0x0DD8, 0x3E14, 0x0028,
+		0x3F30, 0x0478, 0x0E14, 0x3E1C, 0x0028,
+		0x3F40, 0x0424, 0x0E48, 0x3E28, 0x002C,
+		0x3F50, 0x03D4, 0x0E7C, 0x3E34, 0x002C,
+		0x3F60, 0x0384, 0x0EAC, 0x3E44, 0x002C,
+		0x3F6C, 0x0338, 0x0EDC, 0x3E54, 0x002C,
+		0x3F7C, 0x02E8, 0x0F08, 0x3E68, 0x002C,
+		0x3F8C, 0x02A0, 0x0F2C, 0x3E7C, 0x002C,
+		0x3F98, 0x0258, 0x0F50, 0x3E94, 0x002C,
+		0x3FA4, 0x0210, 0x0F74, 0x3EB0, 0x0028,
+		0x3FB0, 0x01CC, 0x0F90, 0x3ECC, 0x0028,
+		0x3FC0, 0x018C, 0x0FA8, 0x3EE8, 0x0024,
+		0x3FC8, 0x014C, 0x0FC0, 0x3F0C, 0x0020,
+		0x3FD4, 0x0110, 0x0FD4, 0x3F2C, 0x001C,
+		0x3FE0, 0x00D4, 0x0FE0, 0x3F54, 0x0018,
+		0x3FE8, 0x009C, 0x0FF0, 0x3F7C, 0x0010,
+		0x3FF0, 0x0064, 0x0FFC, 0x3FA4, 0x000C,
+		0x3FFC, 0x0030, 0x0FFC, 0x3FD4, 0x0004,
+		0x0000, 0x0000, 0x1000, 0x0000, 0x0000
+};
 
-static const uint16_t filter_5tap_64p_117[165] = {
-	16056, 2372, 2372, 16056, 0,
-	16052, 2312, 2432, 16060, 0,
-	16052, 2252, 2488, 16064, 0,
-	16052, 2188, 2548, 16072, 0,
-	16052, 2124, 2600, 16076, 0,
-	16052, 2064, 2656, 16088, 0,
-	16052, 2000, 2708, 16096, 0,
-	16056, 1932, 2760, 16108, 0,
-	16060, 1868, 2808, 16120, 0,
-	16064, 1804, 2856, 16132, 0,
-	16068, 1740, 2904, 16148, 16380,
-	16076, 1676, 2948, 16164, 16380,
-	16080, 1612, 2992, 16180, 16376,
-	16088, 1544, 3032, 16200, 16372,
-	16096, 1480, 3072, 16220, 16372,
-	16104, 1420, 3108, 16244, 16368,
-	16112, 1356, 3144, 16268, 16364,
-	16120, 1292, 3180, 16292, 16360,
-	16128, 1232, 3212, 16320, 16356,
-	16136, 1168, 3240, 16344, 16352,
-	16144, 1108, 3268, 16376, 16344,
-	16156, 1048, 3292, 20, 16340,
-	16164, 988, 3316, 52, 16332,
-	16172, 932, 3336, 88, 16328,
-	16184, 872, 3356, 124, 16320,
-	16192, 816, 3372, 160, 16316,
-	16204, 760, 3388, 196, 16308,
-	16212, 708, 3400, 236, 16300,
-	16220, 656, 3412, 276, 16292,
-	16232, 604, 3420, 320, 16284,
-	16240, 552, 3424, 364, 16276,
-	16248, 504, 3428, 408, 16268,
-	16256, 456, 3428, 456, 16256 };
+//=========================================
+// <num_taps>    = 5
+// <num_phases>  = 64
+// <scale_ratio> = 1.16666 (input/output)
+// <sharpness>   = 0
+// <CoefType>    = ModifiedLanczos
+// <CoefQuant>   = 1.10
+// <CoefOut>     = 1.12
+//=========================================
+static const uint16_t filter_5tap_64p_116[165] = {
+		0x3EDC, 0x0924, 0x0924, 0x3EDC, 0x0000,
+		0x3ED8, 0x08EC, 0x095C, 0x3EE0, 0x0000,
+		0x3ED4, 0x08B0, 0x0994, 0x3EE8, 0x0000,
+		0x3ED0, 0x0878, 0x09C8, 0x3EF0, 0x0000,
+		0x3ED0, 0x083C, 0x09FC, 0x3EF8, 0x0000,
+		0x3ED0, 0x0800, 0x0A2C, 0x3F04, 0x0000,
+		0x3ED0, 0x07C4, 0x0A5C, 0x3F10, 0x0000,
+		0x3ED0, 0x0788, 0x0A8C, 0x3F1C, 0x0000,
+		0x3ED0, 0x074C, 0x0AC0, 0x3F28, 0x3FFC,
+		0x3ED4, 0x0710, 0x0AE8, 0x3F38, 0x3FFC,
+		0x3ED8, 0x06D0, 0x0B18, 0x3F48, 0x3FF8,
+		0x3EDC, 0x0694, 0x0B3C, 0x3F5C, 0x3FF8,
+		0x3EE0, 0x0658, 0x0B68, 0x3F6C, 0x3FF4,
+		0x3EE4, 0x061C, 0x0B90, 0x3F80, 0x3FF0,
+		0x3EEC, 0x05DC, 0x0BB4, 0x3F98, 0x3FEC,
+		0x3EF0, 0x05A0, 0x0BD8, 0x3FB0, 0x3FE8,
+		0x3EF8, 0x0564, 0x0BF8, 0x3FC8, 0x3FE4,
+		0x3EFC, 0x0528, 0x0C1C, 0x3FE0, 0x3FE0,
+		0x3F04, 0x04EC, 0x0C38, 0x3FFC, 0x3FDC,
+		0x3F0C, 0x04B4, 0x0C54, 0x0014, 0x3FD8,
+		0x3F14, 0x047C, 0x0C70, 0x0030, 0x3FD0,
+		0x3F1C, 0x0440, 0x0C88, 0x0050, 0x3FCC,
+		0x3F24, 0x0408, 0x0CA0, 0x0070, 0x3FC4,
+		0x3F2C, 0x03D0, 0x0CB0, 0x0094, 0x3FC0,
+		0x3F34, 0x0398, 0x0CC4, 0x00B8, 0x3FB8,
+		0x3F3C, 0x0364, 0x0CD4, 0x00DC, 0x3FB0,
+		0x3F48, 0x032C, 0x0CE0, 0x0100, 0x3FAC,
+		0x3F50, 0x02F8, 0x0CEC, 0x0128, 0x3FA4,
+		0x3F58, 0x02C4, 0x0CF8, 0x0150, 0x3F9C,
+		0x3F60, 0x0290, 0x0D00, 0x017C, 0x3F94,
+		0x3F68, 0x0260, 0x0D04, 0x01A8, 0x3F8C,
+		0x3F74, 0x0230, 0x0D04, 0x01D4, 0x3F84,
+		0x3F7C, 0x0200, 0x0D08, 0x0200, 0x3F7C
+};
 
-static const uint16_t filter_5tap_64p_150[165] = {
-	16368, 2064, 2064, 16368, 0,
-	16352, 2028, 2100, 16380, 16380,
-	16340, 1996, 2132, 12, 16376,
-	16328, 1960, 2168, 24, 16376,
-	16316, 1924, 2204, 44, 16372,
-	16308, 1888, 2236, 60, 16368,
-	16296, 1848, 2268, 76, 16364,
-	16288, 1812, 2300, 96, 16360,
-	16280, 1772, 2328, 116, 16356,
-	16272, 1736, 2360, 136, 16352,
-	16268, 1696, 2388, 160, 16348,
-	16260, 1656, 2416, 180, 16344,
-	16256, 1616, 2440, 204, 16340,
-	16248, 1576, 2464, 228, 16336,
-	16244, 1536, 2492, 252, 16332,
-	16240, 1496, 2512, 276, 16324,
-	16240, 1456, 2536, 304, 16320,
-	16236, 1416, 2556, 332, 16316,
-	16232, 1376, 2576, 360, 16312,
-	16232, 1336, 2592, 388, 16308,
-	16232, 1296, 2612, 416, 16300,
-	16232, 1256, 2628, 448, 16296,
-	16232, 1216, 2640, 480, 16292,
-	16232, 1172, 2652, 512, 16288,
-	16232, 1132, 2664, 544, 16284,
-	16232, 1092, 2676, 576, 16280,
-	16236, 1056, 2684, 608, 16272,
-	16236, 1016, 2692, 644, 16268,
-	16240, 976, 2700, 680, 16264,
-	16240, 936, 2704, 712, 16260,
-	16244, 900, 2708, 748, 16256,
-	16248, 860, 2708, 788, 16252,
-	16248, 824, 2708, 824, 16248 };
+//=========================================
+// <num_taps>    = 5
+// <num_phases>  = 64
+// <scale_ratio> = 1.49999 (input/output)
+// <sharpness>   = 0
+// <CoefType>    = ModifiedLanczos
+// <CoefQuant>   = 1.10
+// <CoefOut>     = 1.12
+//=========================================
+static const uint16_t filter_5tap_64p_149[165] = {
+		0x3FF4, 0x080C, 0x080C, 0x3FF4, 0x0000,
+		0x3FE8, 0x07E8, 0x0830, 0x0000, 0x0000,
+		0x3FDC, 0x07C8, 0x0850, 0x0010, 0x3FFC,
+		0x3FD0, 0x07A4, 0x0878, 0x001C, 0x3FF8,
+		0x3FC4, 0x0780, 0x0898, 0x0030, 0x3FF4,
+		0x3FB8, 0x075C, 0x08B8, 0x0040, 0x3FF4,
+		0x3FB0, 0x0738, 0x08D8, 0x0050, 0x3FF0,
+		0x3FA8, 0x0710, 0x08F8, 0x0064, 0x3FEC,
+		0x3FA0, 0x06EC, 0x0914, 0x0078, 0x3FE8,
+		0x3F98, 0x06C4, 0x0934, 0x008C, 0x3FE4,
+		0x3F90, 0x06A0, 0x094C, 0x00A4, 0x3FE0,
+		0x3F8C, 0x0678, 0x0968, 0x00B8, 0x3FDC,
+		0x3F84, 0x0650, 0x0984, 0x00D0, 0x3FD8,
+		0x3F80, 0x0628, 0x099C, 0x00E8, 0x3FD4,
+		0x3F7C, 0x0600, 0x09B8, 0x0100, 0x3FCC,
+		0x3F78, 0x05D8, 0x09D0, 0x0118, 0x3FC8,
+		0x3F74, 0x05B0, 0x09E4, 0x0134, 0x3FC4,
+		0x3F70, 0x0588, 0x09F8, 0x0150, 0x3FC0,
+		0x3F70, 0x0560, 0x0A08, 0x016C, 0x3FBC,
+		0x3F6C, 0x0538, 0x0A20, 0x0188, 0x3FB4,
+		0x3F6C, 0x0510, 0x0A30, 0x01A4, 0x3FB0,
+		0x3F6C, 0x04E8, 0x0A3C, 0x01C4, 0x3FAC,
+		0x3F6C, 0x04C0, 0x0A48, 0x01E4, 0x3FA8,
+		0x3F6C, 0x0498, 0x0A58, 0x0200, 0x3FA4,
+		0x3F6C, 0x0470, 0x0A60, 0x0224, 0x3FA0,
+		0x3F6C, 0x0448, 0x0A70, 0x0244, 0x3F98,
+		0x3F70, 0x0420, 0x0A78, 0x0264, 0x3F94,
+		0x3F70, 0x03F8, 0x0A80, 0x0288, 0x3F90,
+		0x3F74, 0x03D4, 0x0A84, 0x02A8, 0x3F8C,
+		0x3F74, 0x03AC, 0x0A8C, 0x02CC, 0x3F88,
+		0x3F78, 0x0384, 0x0A90, 0x02F0, 0x3F84,
+		0x3F7C, 0x0360, 0x0A90, 0x0314, 0x3F80,
+		0x3F7C, 0x033C, 0x0A90, 0x033C, 0x3F7C
+};
 
+//=========================================
+// <num_taps>    = 5
+// <num_phases>  = 64
+// <scale_ratio> = 1.83332 (input/output)
+// <sharpness>   = 0
+// <CoefType>    = ModifiedLanczos
+// <CoefQuant>   = 1.10
+// <CoefOut>     = 1.12
+//=========================================
 static const uint16_t filter_5tap_64p_183[165] = {
-	228, 1816, 1816, 228, 0,
-	216, 1792, 1836, 248, 16380,
-	200, 1772, 1860, 264, 16376,
-	184, 1748, 1884, 280, 16376,
-	168, 1728, 1904, 300, 16372,
-	156, 1704, 1928, 316, 16368,
-	144, 1680, 1948, 336, 16364,
-	128, 1656, 1968, 356, 16364,
-	116, 1632, 1988, 376, 16360,
-	104, 1604, 2008, 396, 16356,
-	96, 1580, 2024, 416, 16356,
-	84, 1556, 2044, 440, 16352,
-	72, 1528, 2060, 460, 16348,
-	64, 1504, 2076, 484, 16348,
-	52, 1476, 2092, 504, 16344,
-	44, 1448, 2104, 528, 16344,
-	36, 1424, 2120, 552, 16340,
-	28, 1396, 2132, 576, 16340,
-	20, 1368, 2144, 600, 16340,
-	12, 1340, 2156, 624, 16336,
-	4, 1312, 2168, 652, 16336,
-	0, 1284, 2180, 676, 16336,
-	16376, 1256, 2188, 700, 16332,
-	16372, 1228, 2196, 728, 16332,
-	16368, 1200, 2204, 752, 16332,
-	16364, 1172, 2212, 780, 16332,
-	16356, 1144, 2216, 808, 16332,
-	16352, 1116, 2220, 836, 16332,
-	16352, 1084, 2224, 860, 16332,
-	16348, 1056, 2228, 888, 16336,
-	16344, 1028, 2232, 916, 16336,
-	16340, 1000, 2232, 944, 16336,
-	16340, 972, 2232, 972, 16340 };
+		0x0168, 0x069C, 0x0698, 0x0164, 0x0000,
+		0x0154, 0x068C, 0x06AC, 0x0174, 0x0000,
+		0x0144, 0x0674, 0x06C0, 0x0188, 0x0000,
+		0x0138, 0x0664, 0x06D0, 0x0198, 0x3FFC,
+		0x0128, 0x0654, 0x06E0, 0x01A8, 0x3FFC,
+		0x0118, 0x0640, 0x06F0, 0x01BC, 0x3FFC,
+		0x010C, 0x0630, 0x0700, 0x01CC, 0x3FF8,
+		0x00FC, 0x061C, 0x0710, 0x01E0, 0x3FF8,
+		0x00F0, 0x060C, 0x071C, 0x01F0, 0x3FF8,
+		0x00E4, 0x05F4, 0x072C, 0x0204, 0x3FF8,
+		0x00D8, 0x05E4, 0x0738, 0x0218, 0x3FF4,
+		0x00CC, 0x05D0, 0x0744, 0x022C, 0x3FF4,
+		0x00C0, 0x05B8, 0x0754, 0x0240, 0x3FF4,
+		0x00B4, 0x05A4, 0x0760, 0x0254, 0x3FF4,
+		0x00A8, 0x0590, 0x076C, 0x0268, 0x3FF4,
+		0x009C, 0x057C, 0x0778, 0x027C, 0x3FF4,
+		0x0094, 0x0564, 0x0780, 0x0294, 0x3FF4,
+		0x0088, 0x0550, 0x0788, 0x02A8, 0x3FF8,
+		0x0080, 0x0538, 0x0794, 0x02BC, 0x3FF8,
+		0x0074, 0x0524, 0x079C, 0x02D4, 0x3FF8,
+		0x006C, 0x0510, 0x07A4, 0x02E8, 0x3FF8,
+		0x0064, 0x04F4, 0x07AC, 0x0300, 0x3FFC,
+		0x005C, 0x04E4, 0x07B0, 0x0314, 0x3FFC,
+		0x0054, 0x04C8, 0x07B8, 0x032C, 0x0000,
+		0x004C, 0x04B4, 0x07C0, 0x0340, 0x0000,
+		0x0044, 0x04A0, 0x07C4, 0x0358, 0x0000,
+		0x003C, 0x0488, 0x07C8, 0x0370, 0x0004,
+		0x0038, 0x0470, 0x07CC, 0x0384, 0x0008,
+		0x0030, 0x045C, 0x07D0, 0x039C, 0x0008,
+		0x002C, 0x0444, 0x07D0, 0x03B4, 0x000C,
+		0x0024, 0x042C, 0x07D4, 0x03CC, 0x0010,
+		0x0020, 0x0414, 0x07D4, 0x03E0, 0x0018,
+		0x001C, 0x03FC, 0x07D4, 0x03F8, 0x001C
+};
 
+//=========================================
+// <num_taps>    = 6
+// <num_phases>  = 64
+// <scale_ratio> = 0.83333 (input/output)
+// <sharpness>   = 0
+// <CoefType>    = ModifiedLanczos
+// <CoefQuant>   = 1.10
+// <CoefOut>     = 1.12
+//=========================================
 static const uint16_t filter_6tap_64p_upscale[198] = {
-	0, 0, 4092, 0, 0, 0,
-	12, 16332, 4092, 52, 16368, 0,
-	24, 16280, 4088, 108, 16356, 0,
-	36, 16236, 4080, 168, 16340, 0,
-	44, 16188, 4064, 228, 16324, 0,
-	56, 16148, 4052, 292, 16308, 0,
-	64, 16108, 4032, 356, 16292, 4,
-	72, 16072, 4008, 424, 16276, 4,
-	80, 16036, 3980, 492, 16256, 4,
-	88, 16004, 3952, 564, 16240, 8,
-	96, 15972, 3920, 636, 16220, 8,
-	100, 15944, 3884, 712, 16204, 12,
-	108, 15916, 3844, 788, 16184, 16,
-	112, 15896, 3800, 864, 16164, 20,
-	116, 15872, 3756, 944, 16144, 20,
-	120, 15852, 3708, 1024, 16124, 24,
-	120, 15836, 3656, 1108, 16104, 28,
-	124, 15824, 3600, 1192, 16084, 32,
-	124, 15808, 3544, 1276, 16064, 36,
-	124, 15800, 3484, 1360, 16044, 40,
-	128, 15792, 3420, 1448, 16024, 44,
-	128, 15784, 3352, 1536, 16004, 48,
-	124, 15780, 3288, 1624, 15988, 52,
-	124, 15776, 3216, 1712, 15968, 56,
-	124, 15776, 3144, 1800, 15948, 64,
-	120, 15776, 3068, 1888, 15932, 68,
-	120, 15780, 2992, 1976, 15912, 72,
-	116, 15784, 2916, 2064, 15896, 76,
-	112, 15792, 2836, 2152, 15880, 80,
-	108, 15796, 2752, 2244, 15868, 84,
-	104, 15804, 2672, 2328, 15852, 88,
-	104, 15816, 2588, 2416, 15840, 92,
-	100, 15828, 2504, 2504, 15828, 100 };
+		0x0000, 0x0000, 0x1000, 0x0000, 0x0000, 0x0000,
+		0x000C, 0x3FD0, 0x0FFC, 0x0034, 0x3FF4, 0x0000,
+		0x0018, 0x3F9C, 0x0FF8, 0x006C, 0x3FE8, 0x0000,
+		0x0024, 0x3F6C, 0x0FF0, 0x00A8, 0x3FD8, 0x0000,
+		0x002C, 0x3F44, 0x0FE4, 0x00E4, 0x3FC8, 0x0000,
+		0x0038, 0x3F18, 0x0FD4, 0x0124, 0x3FB8, 0x0000,
+		0x0040, 0x3EF0, 0x0FC0, 0x0164, 0x3FA8, 0x0004,
+		0x0048, 0x3EC8, 0x0FAC, 0x01A8, 0x3F98, 0x0004,
+		0x0050, 0x3EA8, 0x0F94, 0x01EC, 0x3F84, 0x0004,
+		0x0058, 0x3E84, 0x0F74, 0x0234, 0x3F74, 0x0008,
+		0x0060, 0x3E68, 0x0F54, 0x027C, 0x3F60, 0x0008,
+		0x0064, 0x3E4C, 0x0F30, 0x02C8, 0x3F4C, 0x000C,
+		0x006C, 0x3E30, 0x0F04, 0x0314, 0x3F3C, 0x0010,
+		0x0070, 0x3E18, 0x0EDC, 0x0360, 0x3F28, 0x0014,
+		0x0074, 0x3E04, 0x0EB0, 0x03B0, 0x3F14, 0x0014,
+		0x0078, 0x3DF0, 0x0E80, 0x0400, 0x3F00, 0x0018,
+		0x0078, 0x3DE0, 0x0E4C, 0x0454, 0x3EEC, 0x001C,
+		0x007C, 0x3DD0, 0x0E14, 0x04A8, 0x3ED8, 0x0020,
+		0x007C, 0x3DC4, 0x0DDC, 0x04FC, 0x3EC4, 0x0024,
+		0x007C, 0x3DBC, 0x0DA0, 0x0550, 0x3EB0, 0x0028,
+		0x0080, 0x3DB4, 0x0D5C, 0x05A8, 0x3E9C, 0x002C,
+		0x0080, 0x3DAC, 0x0D1C, 0x0600, 0x3E88, 0x0030,
+		0x007C, 0x3DA8, 0x0CDC, 0x0658, 0x3E74, 0x0034,
+		0x007C, 0x3DA4, 0x0C94, 0x06B0, 0x3E64, 0x0038,
+		0x007C, 0x3DA4, 0x0C48, 0x0708, 0x3E50, 0x0040,
+		0x0078, 0x3DA4, 0x0C00, 0x0760, 0x3E40, 0x0044,
+		0x0078, 0x3DA8, 0x0BB4, 0x07B8, 0x3E2C, 0x0048,
+		0x0074, 0x3DAC, 0x0B68, 0x0810, 0x3E1C, 0x004C,
+		0x0070, 0x3DB4, 0x0B18, 0x0868, 0x3E0C, 0x0050,
+		0x006C, 0x3DBC, 0x0AC4, 0x08C4, 0x3DFC, 0x0054,
+		0x0068, 0x3DC4, 0x0A74, 0x0918, 0x3DF0, 0x0058,
+		0x0068, 0x3DCC, 0x0A20, 0x0970, 0x3DE0, 0x005C,
+		0x0064, 0x3DD4, 0x09C8, 0x09C8, 0x3DD4, 0x0064
+};
 
-static const uint16_t filter_6tap_64p_117[198] = {
-	16168, 476, 3568, 476, 16168, 0,
-	16180, 428, 3564, 528, 16156, 0,
-	16192, 376, 3556, 584, 16144, 4,
-	16204, 328, 3548, 636, 16128, 4,
-	16216, 280, 3540, 692, 16116, 8,
-	16228, 232, 3524, 748, 16104, 12,
-	16240, 188, 3512, 808, 16092, 12,
-	16252, 148, 3492, 864, 16080, 16,
-	16264, 104, 3472, 924, 16068, 16,
-	16276, 64, 3452, 984, 16056, 20,
-	16284, 28, 3428, 1044, 16048, 24,
-	16296, 16376, 3400, 1108, 16036, 24,
-	16304, 16340, 3372, 1168, 16024, 28,
-	16316, 16304, 3340, 1232, 16016, 32,
-	16324, 16272, 3308, 1296, 16004, 32,
-	16332, 16244, 3272, 1360, 15996, 36,
-	16344, 16212, 3236, 1424, 15988, 36,
-	16352, 16188, 3200, 1488, 15980, 40,
-	16360, 16160, 3160, 1552, 15972, 40,
-	16368, 16136, 3116, 1616, 15964, 40,
-	16372, 16112, 3072, 1680, 15956, 44,
-	16380, 16092, 3028, 1744, 15952, 44,
-	0, 16072, 2980, 1808, 15948, 44,
-	8, 16052, 2932, 1872, 15944, 48,
-	12, 16036, 2880, 1936, 15940, 48,
-	16, 16020, 2828, 2000, 15936, 48,
-	20, 16008, 2776, 2064, 15936, 48,
-	24, 15996, 2724, 2128, 15936, 48,
-	28, 15984, 2668, 2192, 15936, 48,
-	32, 15972, 2612, 2252, 15940, 44,
-	36, 15964, 2552, 2316, 15940, 44,
-	40, 15956, 2496, 2376, 15944, 44,
-	40, 15952, 2436, 2436, 15952, 40 };
+//=========================================
+// <num_taps>    = 6
+// <num_phases>  = 64
+// <scale_ratio> = 1.16666 (input/output)
+// <sharpness>   = 0
+// <CoefType>    = ModifiedLanczos
+// <CoefQuant>   = 1.10
+// <CoefOut>     = 1.12
+//=========================================
+static const uint16_t filter_6tap_64p_116[198] = {
+		0x3F0C, 0x0240, 0x0D68, 0x0240, 0x3F0C, 0x0000,
+		0x3F18, 0x0210, 0x0D64, 0x0274, 0x3F00, 0x0000,
+		0x3F24, 0x01E0, 0x0D58, 0x02A8, 0x3EF8, 0x0004,
+		0x3F2C, 0x01B0, 0x0D58, 0x02DC, 0x3EEC, 0x0004,
+		0x3F38, 0x0180, 0x0D50, 0x0310, 0x3EE0, 0x0008,
+		0x3F44, 0x0154, 0x0D40, 0x0348, 0x3ED8, 0x0008,
+		0x3F50, 0x0128, 0x0D34, 0x037C, 0x3ECC, 0x000C,
+		0x3F5C, 0x00FC, 0x0D20, 0x03B4, 0x3EC4, 0x0010,
+		0x3F64, 0x00D4, 0x0D14, 0x03EC, 0x3EB8, 0x0010,
+		0x3F70, 0x00AC, 0x0CFC, 0x0424, 0x3EB0, 0x0014,
+		0x3F78, 0x0084, 0x0CE8, 0x0460, 0x3EA8, 0x0014,
+		0x3F84, 0x0060, 0x0CCC, 0x0498, 0x3EA0, 0x0018,
+		0x3F90, 0x003C, 0x0CB4, 0x04D0, 0x3E98, 0x0018,
+		0x3F98, 0x0018, 0x0C9C, 0x050C, 0x3E90, 0x0018,
+		0x3FA0, 0x3FFC, 0x0C78, 0x0548, 0x3E88, 0x001C,
+		0x3FAC, 0x3FDC, 0x0C54, 0x0584, 0x3E84, 0x001C,
+		0x3FB4, 0x3FBC, 0x0C3C, 0x05BC, 0x3E7C, 0x001C,
+		0x3FBC, 0x3FA0, 0x0C14, 0x05F8, 0x3E78, 0x0020,
+		0x3FC4, 0x3F84, 0x0BF0, 0x0634, 0x3E74, 0x0020,
+		0x3FCC, 0x3F68, 0x0BCC, 0x0670, 0x3E70, 0x0020,
+		0x3FD4, 0x3F50, 0x0BA4, 0x06AC, 0x3E6C, 0x0020,
+		0x3FDC, 0x3F38, 0x0B78, 0x06E8, 0x3E6C, 0x0020,
+		0x3FE0, 0x3F24, 0x0B50, 0x0724, 0x3E68, 0x0020,
+		0x3FE8, 0x3F0C, 0x0B24, 0x0760, 0x3E68, 0x0020,
+		0x3FF0, 0x3EFC, 0x0AF4, 0x0798, 0x3E68, 0x0020,
+		0x3FF4, 0x3EE8, 0x0AC8, 0x07D4, 0x3E68, 0x0020,
+		0x3FFC, 0x3ED8, 0x0A94, 0x0810, 0x3E6C, 0x001C,
+		0x0000, 0x3EC8, 0x0A64, 0x0848, 0x3E70, 0x001C,
+		0x0000, 0x3EB8, 0x0A38, 0x0880, 0x3E74, 0x001C,
+		0x0004, 0x3EAC, 0x0A04, 0x08BC, 0x3E78, 0x0018,
+		0x0008, 0x3EA4, 0x09D0, 0x08F4, 0x3E7C, 0x0014,
+		0x000C, 0x3E98, 0x0998, 0x092C, 0x3E84, 0x0014,
+		0x0010, 0x3E90, 0x0964, 0x0960, 0x3E8C, 0x0010
+};
 
-static const uint16_t filter_6tap_64p_150[198] = {
-	16148, 920, 2724, 920, 16148, 0,
-	16152, 880, 2724, 956, 16148, 0,
-	16152, 844, 2720, 996, 16144, 0,
-	16156, 804, 2716, 1032, 16144, 0,
-	16156, 768, 2712, 1072, 16144, 0,
-	16160, 732, 2708, 1112, 16144, 16380,
-	16164, 696, 2700, 1152, 16144, 16380,
-	16168, 660, 2692, 1192, 16148, 16380,
-	16172, 628, 2684, 1232, 16148, 16380,
-	16176, 592, 2672, 1272, 16152, 16376,
-	16180, 560, 2660, 1312, 16152, 16376,
-	16184, 524, 2648, 1348, 16156, 16376,
-	16192, 492, 2632, 1388, 16160, 16372,
-	16196, 460, 2616, 1428, 16164, 16372,
-	16200, 432, 2600, 1468, 16168, 16368,
-	16204, 400, 2584, 1508, 16176, 16364,
-	16212, 368, 2564, 1548, 16180, 16364,
-	16216, 340, 2544, 1588, 16188, 16360,
-	16220, 312, 2524, 1628, 16196, 16356,
-	16228, 284, 2504, 1668, 16204, 16356,
-	16232, 256, 2480, 1704, 16212, 16352,
-	16240, 232, 2456, 1744, 16224, 16348,
-	16244, 204, 2432, 1780, 16232, 16344,
-	16248, 180, 2408, 1820, 16244, 16340,
-	16256, 156, 2380, 1856, 16256, 16336,
-	16260, 132, 2352, 1896, 16268, 16332,
-	16268, 108, 2324, 1932, 16280, 16328,
-	16272, 88, 2296, 1968, 16292, 16324,
-	16276, 64, 2268, 2004, 16308, 16320,
-	16284, 44, 2236, 2036, 16324, 16312,
-	16288, 24, 2204, 2072, 16340, 16308,
-	16292, 8, 2172, 2108, 16356, 16304,
-	16300, 16372, 2140, 2140, 16372, 16300 };
+//=========================================
+// <num_taps>    = 6
+// <num_phases>  = 64
+// <scale_ratio> = 1.49999 (input/output)
+// <sharpness>   = 0
+// <CoefType>    = ModifiedLanczos
+// <CoefQuant>   = 1.10
+// <CoefOut>     = 1.12
+//=========================================
+static const uint16_t filter_6tap_64p_149[198] = {
+		0x3F14, 0x0394, 0x0AB0, 0x0394, 0x3F14, 0x0000,
+		0x3F18, 0x036C, 0x0AB0, 0x03B8, 0x3F14, 0x0000,
+		0x3F18, 0x0348, 0x0AAC, 0x03E0, 0x3F14, 0x0000,
+		0x3F1C, 0x0320, 0x0AAC, 0x0408, 0x3F10, 0x0000,
+		0x3F20, 0x02FC, 0x0AA8, 0x042C, 0x3F10, 0x0000,
+		0x3F24, 0x02D8, 0x0AA0, 0x0454, 0x3F10, 0x0000,
+		0x3F28, 0x02B4, 0x0A98, 0x047C, 0x3F10, 0x0000,
+		0x3F28, 0x0290, 0x0A90, 0x04A4, 0x3F14, 0x0000,
+		0x3F30, 0x026C, 0x0A84, 0x04CC, 0x3F14, 0x0000,
+		0x3F34, 0x024C, 0x0A7C, 0x04F4, 0x3F14, 0x3FFC,
+		0x3F38, 0x0228, 0x0A70, 0x051C, 0x3F18, 0x3FFC,
+		0x3F3C, 0x0208, 0x0A64, 0x0544, 0x3F1C, 0x3FF8,
+		0x3F40, 0x01E8, 0x0A54, 0x056C, 0x3F20, 0x3FF8,
+		0x3F44, 0x01C8, 0x0A48, 0x0594, 0x3F24, 0x3FF4,
+		0x3F4C, 0x01A8, 0x0A34, 0x05BC, 0x3F28, 0x3FF4,
+		0x3F50, 0x0188, 0x0A28, 0x05E4, 0x3F2C, 0x3FF0,
+		0x3F54, 0x016C, 0x0A10, 0x060C, 0x3F34, 0x3FF0,
+		0x3F5C, 0x014C, 0x09FC, 0x0634, 0x3F3C, 0x3FEC,
+		0x3F60, 0x0130, 0x09EC, 0x065C, 0x3F40, 0x3FE8,
+		0x3F68, 0x0114, 0x09D0, 0x0684, 0x3F48, 0x3FE8,
+		0x3F6C, 0x00F8, 0x09B8, 0x06AC, 0x3F54, 0x3FE4,
+		0x3F74, 0x00E0, 0x09A0, 0x06D0, 0x3F5C, 0x3FE0,
+		0x3F78, 0x00C4, 0x098C, 0x06F8, 0x3F64, 0x3FDC,
+		0x3F7C, 0x00AC, 0x0970, 0x0720, 0x3F70, 0x3FD8,
+		0x3F84, 0x0094, 0x0954, 0x0744, 0x3F7C, 0x3FD4,
+		0x3F88, 0x007C, 0x093C, 0x0768, 0x3F88, 0x3FD0,
+		0x3F90, 0x0064, 0x091C, 0x0790, 0x3F94, 0x3FCC,
+		0x3F94, 0x0050, 0x08FC, 0x07B4, 0x3FA4, 0x3FC8,
+		0x3F98, 0x003C, 0x08E0, 0x07D8, 0x3FB0, 0x3FC4,
+		0x3FA0, 0x0024, 0x08C0, 0x07FC, 0x3FC0, 0x3FC0,
+		0x3FA4, 0x0014, 0x08A4, 0x081C, 0x3FD0, 0x3FB8,
+		0x3FAC, 0x0000, 0x0880, 0x0840, 0x3FE0, 0x3FB4,
+		0x3FB0, 0x3FF0, 0x0860, 0x0860, 0x3FF0, 0x3FB0
+};
 
+//=========================================
+// <num_taps>    = 6
+// <num_phases>  = 64
+// <scale_ratio> = 1.83332 (input/output)
+// <sharpness>   = 0
+// <CoefType>    = ModifiedLanczos
+// <CoefQuant>   = 1.10
+// <CoefOut>     = 1.12
+//=========================================
 static const uint16_t filter_6tap_64p_183[198] = {
-	16296, 1032, 2196, 1032, 16296, 0,
-	16292, 1004, 2200, 1060, 16304, 16380,
-	16288, 976, 2200, 1088, 16308, 16380,
-	16284, 952, 2196, 1116, 16312, 16376,
-	16284, 924, 2196, 1144, 16320, 16376,
-	16280, 900, 2192, 1172, 16324, 16372,
-	16276, 872, 2192, 1200, 16332, 16368,
-	16276, 848, 2188, 1228, 16340, 16368,
-	16272, 820, 2180, 1256, 16348, 16364,
-	16272, 796, 2176, 1280, 16356, 16360,
-	16268, 768, 2168, 1308, 16364, 16360,
-	16268, 744, 2164, 1336, 16372, 16356,
-	16268, 716, 2156, 1364, 16380, 16352,
-	16264, 692, 2148, 1392, 4, 16352,
-	16264, 668, 2136, 1420, 16, 16348,
-	16264, 644, 2128, 1448, 28, 16344,
-	16264, 620, 2116, 1472, 36, 16340,
-	16264, 596, 2108, 1500, 48, 16340,
-	16268, 572, 2096, 1524, 60, 16336,
-	16268, 548, 2080, 1552, 72, 16332,
-	16268, 524, 2068, 1576, 88, 16328,
-	16268, 504, 2056, 1604, 100, 16324,
-	16272, 480, 2040, 1628, 112, 16324,
-	16272, 456, 2024, 1652, 128, 16320,
-	16272, 436, 2008, 1680, 144, 16316,
-	16276, 416, 1992, 1704, 156, 16312,
-	16276, 392, 1976, 1724, 172, 16308,
-	16280, 372, 1956, 1748, 188, 16308,
-	16280, 352, 1940, 1772, 204, 16304,
-	16284, 332, 1920, 1796, 224, 16300,
-	16288, 312, 1900, 1816, 240, 16296,
-	16288, 296, 1880, 1840, 256, 16296,
-	16292, 276, 1860, 1860, 276, 16292 };
+		0x002C, 0x0420, 0x076C, 0x041C, 0x002C, 0x0000,
+		0x0028, 0x040C, 0x0768, 0x0430, 0x0034, 0x0000,
+		0x0020, 0x03F8, 0x0768, 0x0448, 0x003C, 0x3FFC,
+		0x0018, 0x03E4, 0x0768, 0x045C, 0x0044, 0x3FFC,
+		0x0014, 0x03D0, 0x0768, 0x0470, 0x004C, 0x3FF8,
+		0x000C, 0x03BC, 0x0764, 0x0484, 0x0058, 0x3FF8,
+		0x0008, 0x03A4, 0x0764, 0x049C, 0x0060, 0x3FF4,
+		0x0004, 0x0390, 0x0760, 0x04B0, 0x0068, 0x3FF4,
+		0x0000, 0x037C, 0x0760, 0x04C4, 0x0070, 0x3FF0,
+		0x3FFC, 0x0364, 0x075C, 0x04D8, 0x007C, 0x3FF0,
+		0x3FF8, 0x0350, 0x0758, 0x04F0, 0x0084, 0x3FEC,
+		0x3FF4, 0x033C, 0x0750, 0x0504, 0x0090, 0x3FEC,
+		0x3FF0, 0x0328, 0x074C, 0x0518, 0x009C, 0x3FE8,
+		0x3FEC, 0x0314, 0x0744, 0x052C, 0x00A8, 0x3FE8,
+		0x3FE8, 0x0304, 0x0740, 0x0540, 0x00B0, 0x3FE4,
+		0x3FE4, 0x02EC, 0x073C, 0x0554, 0x00BC, 0x3FE4,
+		0x3FE0, 0x02DC, 0x0734, 0x0568, 0x00C8, 0x3FE0,
+		0x3FE0, 0x02C4, 0x072C, 0x057C, 0x00D4, 0x3FE0,
+		0x3FDC, 0x02B4, 0x0724, 0x058C, 0x00E4, 0x3FDC,
+		0x3FDC, 0x02A0, 0x0718, 0x05A0, 0x00F0, 0x3FDC,
+		0x3FD8, 0x028C, 0x0714, 0x05B4, 0x00FC, 0x3FD8,
+		0x3FD8, 0x0278, 0x0704, 0x05C8, 0x010C, 0x3FD8,
+		0x3FD4, 0x0264, 0x0700, 0x05D8, 0x0118, 0x3FD8,
+		0x3FD4, 0x0254, 0x06F0, 0x05EC, 0x0128, 0x3FD4,
+		0x3FD0, 0x0244, 0x06E8, 0x05FC, 0x0134, 0x3FD4,
+		0x3FD0, 0x0230, 0x06DC, 0x060C, 0x0144, 0x3FD4,
+		0x3FD0, 0x021C, 0x06D0, 0x0620, 0x0154, 0x3FD0,
+		0x3FD0, 0x0208, 0x06C4, 0x0630, 0x0164, 0x3FD0,
+		0x3FD0, 0x01F8, 0x06B8, 0x0640, 0x0170, 0x3FD0,
+		0x3FCC, 0x01E8, 0x06AC, 0x0650, 0x0180, 0x3FD0,
+		0x3FCC, 0x01D8, 0x069C, 0x0660, 0x0190, 0x3FD0,
+		0x3FCC, 0x01C4, 0x068C, 0x0670, 0x01A4, 0x3FD0,
+		0x3FCC, 0x01B8, 0x0680, 0x067C, 0x01B4, 0x3FCC
+};
 
+//=========================================
+// <num_taps>    = 7
+// <num_phases>  = 64
+// <scale_ratio> = 0.83333 (input/output)
+// <sharpness>   = 0
+// <CoefType>    = ModifiedLanczos
+// <CoefQuant>   = 1.10
+// <CoefOut>     = 1.12
+//=========================================
 static const uint16_t filter_7tap_64p_upscale[231] = {
-	176, 15760, 2488, 2488, 15760, 176, 0,
-	172, 15772, 2404, 2572, 15752, 180, 16380,
-	168, 15784, 2324, 2656, 15740, 184, 16380,
-	164, 15800, 2240, 2736, 15732, 188, 16376,
-	160, 15812, 2152, 2816, 15728, 192, 16376,
-	152, 15828, 2068, 2896, 15724, 192, 16376,
-	148, 15848, 1984, 2972, 15720, 196, 16372,
-	140, 15864, 1896, 3048, 15720, 196, 16372,
-	136, 15884, 1812, 3124, 15720, 196, 16368,
-	128, 15900, 1724, 3196, 15720, 196, 16368,
-	120, 15920, 1640, 3268, 15724, 196, 16368,
-	116, 15940, 1552, 3336, 15732, 196, 16364,
-	108, 15964, 1468, 3400, 15740, 196, 16364,
-	104, 15984, 1384, 3464, 15748, 192, 16364,
-	96, 16004, 1300, 3524, 15760, 188, 16364,
-	88, 16028, 1216, 3584, 15776, 184, 16364,
-	84, 16048, 1132, 3640, 15792, 180, 16360,
-	76, 16072, 1048, 3692, 15812, 176, 16360,
-	68, 16092, 968, 3744, 15832, 168, 16360,
-	64, 16116, 888, 3788, 15856, 160, 16360,
-	56, 16140, 812, 3832, 15884, 152, 16360,
-	52, 16160, 732, 3876, 15912, 144, 16360,
-	44, 16184, 656, 3912, 15944, 136, 16364,
-	40, 16204, 584, 3944, 15976, 124, 16364,
-	32, 16228, 512, 3976, 16012, 116, 16364,
-	28, 16248, 440, 4004, 16048, 104, 16364,
-	24, 16268, 372, 4028, 16092, 88, 16368,
-	20, 16288, 304, 4048, 16132, 76, 16368,
-	12, 16308, 240, 4064, 16180, 60, 16372,
-	8, 16328, 176, 4076, 16228, 48, 16372,
-	4, 16348, 112, 4088, 16276, 32, 16376,
-	0, 16364, 56, 4092, 16328, 16, 16380,
-	0, 0, 0, 4096, 0, 0, 0 };
+		0x00B0, 0x3D98, 0x09BC, 0x09B8, 0x3D94, 0x00B0, 0x0000,
+		0x00AC, 0x3DA0, 0x0968, 0x0A10, 0x3D88, 0x00B4, 0x0000,
+		0x00A8, 0x3DAC, 0x0914, 0x0A60, 0x3D80, 0x00B8, 0x0000,
+		0x00A4, 0x3DB8, 0x08C0, 0x0AB4, 0x3D78, 0x00BC, 0x3FFC,
+		0x00A0, 0x3DC8, 0x0868, 0x0B00, 0x3D74, 0x00C0, 0x3FFC,
+		0x0098, 0x3DD8, 0x0818, 0x0B54, 0x3D6C, 0x00C0, 0x3FF8,
+		0x0094, 0x3DE8, 0x07C0, 0x0B9C, 0x3D6C, 0x00C4, 0x3FF8,
+		0x008C, 0x3DFC, 0x0768, 0x0BEC, 0x3D68, 0x00C4, 0x3FF8,
+		0x0088, 0x3E0C, 0x0714, 0x0C38, 0x3D68, 0x00C4, 0x3FF4,
+		0x0080, 0x3E20, 0x06BC, 0x0C80, 0x3D6C, 0x00C4, 0x3FF4,
+		0x0078, 0x3E34, 0x0668, 0x0CC4, 0x3D70, 0x00C4, 0x3FF4,
+		0x0074, 0x3E48, 0x0610, 0x0D08, 0x3D78, 0x00C4, 0x3FF0,
+		0x006C, 0x3E5C, 0x05BC, 0x0D48, 0x3D80, 0x00C4, 0x3FF0,
+		0x0068, 0x3E74, 0x0568, 0x0D84, 0x3D88, 0x00C0, 0x3FF0,
+		0x0060, 0x3E88, 0x0514, 0x0DC8, 0x3D94, 0x00BC, 0x3FEC,
+		0x0058, 0x3E9C, 0x04C0, 0x0E04, 0x3DA4, 0x00B8, 0x3FEC,
+		0x0054, 0x3EB4, 0x046C, 0x0E38, 0x3DB4, 0x00B4, 0x3FEC,
+		0x004C, 0x3ECC, 0x0418, 0x0E6C, 0x3DC8, 0x00B0, 0x3FEC,
+		0x0044, 0x3EE0, 0x03C8, 0x0EA4, 0x3DDC, 0x00A8, 0x3FEC,
+		0x0040, 0x3EF8, 0x0378, 0x0ED0, 0x3DF4, 0x00A0, 0x3FEC,
+		0x0038, 0x3F0C, 0x032C, 0x0EFC, 0x3E10, 0x0098, 0x3FEC,
+		0x0034, 0x3F24, 0x02DC, 0x0F24, 0x3E2C, 0x0090, 0x3FEC,
+		0x002C, 0x3F38, 0x0294, 0x0F4C, 0x3E48, 0x0088, 0x3FEC,
+		0x0028, 0x3F50, 0x0248, 0x0F68, 0x3E6C, 0x007C, 0x3FF0,
+		0x0020, 0x3F64, 0x0200, 0x0F88, 0x3E90, 0x0074, 0x3FF0,
+		0x001C, 0x3F7C, 0x01B8, 0x0FA4, 0x3EB4, 0x0068, 0x3FF0,
+		0x0018, 0x3F90, 0x0174, 0x0FBC, 0x3EDC, 0x0058, 0x3FF4,
+		0x0014, 0x3FA4, 0x0130, 0x0FD0, 0x3F08, 0x004C, 0x3FF4,
+		0x000C, 0x3FB8, 0x00F0, 0x0FE4, 0x3F34, 0x003C, 0x3FF8,
+		0x0008, 0x3FCC, 0x00B0, 0x0FF0, 0x3F64, 0x0030, 0x3FF8,
+		0x0004, 0x3FDC, 0x0070, 0x0FFC, 0x3F98, 0x0020, 0x3FFC,
+		0x0000, 0x3FF0, 0x0038, 0x0FFC, 0x3FCC, 0x0010, 0x0000,
+		0x0000, 0x0000, 0x0000, 0x1000, 0x0000, 0x0000, 0x0000
+};
 
-static const uint16_t filter_7tap_64p_117[231] = {
-	92, 15868, 2464, 2464, 15868, 92, 0,
-	96, 15864, 2404, 2528, 15876, 88, 0,
-	100, 15860, 2344, 2584, 15884, 84, 0,
-	104, 15856, 2280, 2644, 15892, 76, 0,
-	108, 15852, 2216, 2700, 15904, 72, 0,
-	108, 15852, 2152, 2756, 15916, 64, 0,
-	112, 15852, 2088, 2812, 15932, 60, 0,
-	112, 15852, 2024, 2864, 15948, 52, 0,
-	112, 15856, 1960, 2916, 15964, 44, 0,
-	116, 15860, 1892, 2964, 15984, 36, 0,
-	116, 15864, 1828, 3016, 16004, 24, 4,
-	116, 15868, 1760, 3060, 16024, 16, 4,
-	116, 15876, 1696, 3108, 16048, 8, 8,
-	116, 15884, 1628, 3152, 16072, 16380, 8,
-	112, 15892, 1564, 3192, 16100, 16372, 8,
-	112, 15900, 1496, 3232, 16124, 16360, 12,
-	112, 15908, 1428, 3268, 16156, 16348, 12,
-	108, 15920, 1364, 3304, 16188, 16336, 16,
-	108, 15928, 1300, 3340, 16220, 16324, 20,
-	104, 15940, 1232, 3372, 16252, 16312, 20,
-	104, 15952, 1168, 3400, 16288, 16300, 24,
-	100, 15964, 1104, 3428, 16328, 16284, 28,
-	96, 15980, 1040, 3452, 16364, 16272, 28,
-	96, 15992, 976, 3476, 20, 16256, 32,
-	92, 16004, 916, 3496, 64, 16244, 36,
-	88, 16020, 856, 3516, 108, 16228, 40,
-	84, 16032, 792, 3532, 152, 16216, 44,
-	80, 16048, 732, 3544, 200, 16200, 48,
-	80, 16064, 676, 3556, 248, 16184, 48,
-	76, 16080, 616, 3564, 296, 16168, 52,
-	72, 16092, 560, 3568, 344, 16156, 56,
-	68, 16108, 504, 3572, 396, 16140, 60,
-	64, 16124, 452, 3576, 452, 16124, 64 };
+//=========================================
+// <num_taps>    = 7
+// <num_phases>  = 64
+// <scale_ratio> = 1.16666 (input/output)
+// <sharpness>   = 0
+// <CoefType>    = ModifiedLanczos
+// <CoefQuant>   = 1.10
+// <CoefOut>     = 1.12
+//=========================================
+static const uint16_t filter_7tap_64p_116[231] = {
+		0x0020, 0x3E58, 0x0988, 0x0988, 0x3E58, 0x0020, 0x0000,
+		0x0024, 0x3E4C, 0x0954, 0x09C0, 0x3E64, 0x0018, 0x0000,
+		0x002C, 0x3E44, 0x091C, 0x09F4, 0x3E70, 0x0010, 0x0000,
+		0x0030, 0x3E3C, 0x08E8, 0x0A24, 0x3E80, 0x0008, 0x0000,
+		0x0034, 0x3E34, 0x08AC, 0x0A5C, 0x3E90, 0x0000, 0x0000,
+		0x003C, 0x3E30, 0x0870, 0x0A84, 0x3EA0, 0x3FFC, 0x0004,
+		0x0040, 0x3E28, 0x0838, 0x0AB4, 0x3EB4, 0x3FF4, 0x0004,
+		0x0044, 0x3E24, 0x07FC, 0x0AE4, 0x3EC8, 0x3FEC, 0x0004,
+		0x0048, 0x3E24, 0x07C4, 0x0B08, 0x3EDC, 0x3FE4, 0x0008,
+		0x0048, 0x3E20, 0x0788, 0x0B3C, 0x3EF4, 0x3FD8, 0x0008,
+		0x004C, 0x3E20, 0x074C, 0x0B60, 0x3F0C, 0x3FD0, 0x000C,
+		0x0050, 0x3E20, 0x0710, 0x0B8C, 0x3F24, 0x3FC4, 0x000C,
+		0x0050, 0x3E20, 0x06D4, 0x0BB0, 0x3F40, 0x3FBC, 0x0010,
+		0x0054, 0x3E24, 0x0698, 0x0BD4, 0x3F5C, 0x3FB0, 0x0010,
+		0x0054, 0x3E24, 0x065C, 0x0BFC, 0x3F78, 0x3FA4, 0x0014,
+		0x0054, 0x3E28, 0x0624, 0x0C1C, 0x3F98, 0x3F98, 0x0014,
+		0x0058, 0x3E2C, 0x05E4, 0x0C3C, 0x3FB8, 0x3F8C, 0x0018,
+		0x0058, 0x3E34, 0x05A8, 0x0C58, 0x3FD8, 0x3F80, 0x001C,
+		0x0058, 0x3E38, 0x0570, 0x0C78, 0x3FF8, 0x3F74, 0x001C,
+		0x0058, 0x3E40, 0x0534, 0x0C94, 0x0018, 0x3F68, 0x0020,
+		0x0058, 0x3E48, 0x04F4, 0x0CAC, 0x0040, 0x3F5C, 0x0024,
+		0x0058, 0x3E50, 0x04BC, 0x0CC4, 0x0064, 0x3F50, 0x0024,
+		0x0054, 0x3E58, 0x0484, 0x0CD8, 0x008C, 0x3F44, 0x0028,
+		0x0054, 0x3E60, 0x0448, 0x0CEC, 0x00B4, 0x3F38, 0x002C,
+		0x0054, 0x3E68, 0x0410, 0x0CFC, 0x00E0, 0x3F28, 0x0030,
+		0x0054, 0x3E74, 0x03D4, 0x0D0C, 0x010C, 0x3F1C, 0x0030,
+		0x0050, 0x3E7C, 0x03A0, 0x0D18, 0x0138, 0x3F10, 0x0034,
+		0x0050, 0x3E88, 0x0364, 0x0D24, 0x0164, 0x3F04, 0x0038,
+		0x004C, 0x3E94, 0x0330, 0x0D30, 0x0194, 0x3EF4, 0x0038,
+		0x004C, 0x3EA0, 0x02F8, 0x0D34, 0x01C4, 0x3EE8, 0x003C,
+		0x0048, 0x3EAC, 0x02C0, 0x0D3C, 0x01F4, 0x3EDC, 0x0040,
+		0x0048, 0x3EB8, 0x0290, 0x0D3C, 0x0224, 0x3ED0, 0x0040,
+		0x0044, 0x3EC4, 0x0258, 0x0D40, 0x0258, 0x3EC4, 0x0044
+};
 
-static const uint16_t filter_7tap_64p_150[231] = {
-	16224, 16380, 2208, 2208, 16380, 16224, 0,
-	16232, 16360, 2172, 2236, 16, 16216, 0,
-	16236, 16340, 2140, 2268, 40, 16212, 0,
-	16244, 16324, 2104, 2296, 60, 16204, 4,
-	16252, 16304, 2072, 2324, 84, 16196, 4,
-	16256, 16288, 2036, 2352, 108, 16192, 4,
-	16264, 16268, 2000, 2380, 132, 16184, 8,
-	16272, 16252, 1960, 2408, 160, 16176, 8,
-	16276, 16240, 1924, 2432, 184, 16172, 8,
-	16284, 16224, 1888, 2456, 212, 16164, 8,
-	16288, 16212, 1848, 2480, 240, 16160, 12,
-	16296, 16196, 1812, 2500, 268, 16152, 12,
-	16300, 16184, 1772, 2524, 296, 16144, 12,
-	16308, 16172, 1736, 2544, 324, 16140, 12,
-	16312, 16164, 1696, 2564, 356, 16136, 12,
-	16320, 16152, 1656, 2584, 388, 16128, 12,
-	16324, 16144, 1616, 2600, 416, 16124, 12,
-	16328, 16136, 1576, 2616, 448, 16116, 12,
-	16332, 16128, 1536, 2632, 480, 16112, 12,
-	16340, 16120, 1496, 2648, 516, 16108, 12,
-	16344, 16112, 1456, 2660, 548, 16104, 12,
-	16348, 16104, 1416, 2672, 580, 16100, 12,
-	16352, 16100, 1376, 2684, 616, 16096, 12,
-	16356, 16096, 1336, 2696, 652, 16092, 12,
-	16360, 16092, 1296, 2704, 688, 16088, 12,
-	16364, 16088, 1256, 2712, 720, 16084, 12,
-	16368, 16084, 1220, 2720, 760, 16084, 8,
-	16368, 16080, 1180, 2724, 796, 16080, 8,
-	16372, 16080, 1140, 2732, 832, 16080, 8,
-	16376, 16076, 1100, 2732, 868, 16076, 4,
-	16380, 16076, 1060, 2736, 908, 16076, 4,
-	16380, 16076, 1020, 2740, 944, 16076, 0,
-	0, 16076, 984, 2740, 984, 16076, 0 };
+//=========================================
+// <num_taps>    = 7
+// <num_phases>  = 64
+// <scale_ratio> = 1.49999 (input/output)
+// <sharpness>   = 0
+// <CoefType>    = ModifiedLanczos
+// <CoefQuant>   = 1.10
+// <CoefOut>     = 1.12
+//=========================================
+static const uint16_t filter_7tap_64p_149[231] = {
+		0x3F68, 0x3FEC, 0x08A8, 0x08AC, 0x3FF0, 0x3F68, 0x0000,
+		0x3F70, 0x3FDC, 0x0888, 0x08CC, 0x0000, 0x3F60, 0x0000,
+		0x3F74, 0x3FC8, 0x0868, 0x08F0, 0x0014, 0x3F58, 0x0000,
+		0x3F7C, 0x3FB4, 0x0844, 0x0908, 0x002C, 0x3F54, 0x0004,
+		0x3F84, 0x3FA4, 0x0820, 0x0924, 0x0044, 0x3F4C, 0x0004,
+		0x3F88, 0x3F90, 0x0800, 0x0944, 0x005C, 0x3F44, 0x0004,
+		0x3F90, 0x3F80, 0x07D8, 0x095C, 0x0074, 0x3F40, 0x0008,
+		0x3F98, 0x3F70, 0x07B0, 0x097C, 0x008C, 0x3F38, 0x0008,
+		0x3F9C, 0x3F60, 0x0790, 0x0994, 0x00A8, 0x3F30, 0x0008,
+		0x3FA4, 0x3F54, 0x0764, 0x09B0, 0x00C4, 0x3F28, 0x0008,
+		0x3FA8, 0x3F48, 0x0740, 0x09C4, 0x00DC, 0x3F24, 0x000C,
+		0x3FB0, 0x3F38, 0x0718, 0x09DC, 0x00FC, 0x3F1C, 0x000C,
+		0x3FB4, 0x3F2C, 0x06F0, 0x09F4, 0x0118, 0x3F18, 0x000C,
+		0x3FBC, 0x3F24, 0x06C8, 0x0A08, 0x0134, 0x3F10, 0x000C,
+		0x3FC0, 0x3F18, 0x06A0, 0x0A1C, 0x0154, 0x3F08, 0x0010,
+		0x3FC8, 0x3F10, 0x0678, 0x0A2C, 0x0170, 0x3F04, 0x0010,
+		0x3FCC, 0x3F04, 0x0650, 0x0A40, 0x0190, 0x3F00, 0x0010,
+		0x3FD0, 0x3EFC, 0x0628, 0x0A54, 0x01B0, 0x3EF8, 0x0010,
+		0x3FD4, 0x3EF4, 0x0600, 0x0A64, 0x01D0, 0x3EF4, 0x0010,
+		0x3FDC, 0x3EEC, 0x05D8, 0x0A6C, 0x01F4, 0x3EF0, 0x0010,
+		0x3FE0, 0x3EE8, 0x05B0, 0x0A7C, 0x0214, 0x3EE8, 0x0010,
+		0x3FE4, 0x3EE0, 0x0588, 0x0A88, 0x0238, 0x3EE4, 0x0010,
+		0x3FE8, 0x3EDC, 0x055C, 0x0A98, 0x0258, 0x3EE0, 0x0010,
+		0x3FEC, 0x3ED8, 0x0534, 0x0AA0, 0x027C, 0x3EDC, 0x0010,
+		0x3FF0, 0x3ED4, 0x050C, 0x0AAC, 0x02A0, 0x3ED8, 0x000C,
+		0x3FF4, 0x3ED0, 0x04E4, 0x0AB4, 0x02C4, 0x3ED4, 0x000C,
+		0x3FF4, 0x3ECC, 0x04C0, 0x0ABC, 0x02E8, 0x3ED0, 0x000C,
+		0x3FF8, 0x3ECC, 0x0494, 0x0AC0, 0x030C, 0x3ED0, 0x000C,
+		0x3FFC, 0x3EC8, 0x046C, 0x0AC8, 0x0334, 0x3ECC, 0x0008,
+		0x0000, 0x3EC8, 0x0444, 0x0AC8, 0x0358, 0x3ECC, 0x0008,
+		0x0000, 0x3EC8, 0x041C, 0x0ACC, 0x0380, 0x3EC8, 0x0008,
+		0x0000, 0x3EC8, 0x03F4, 0x0AD0, 0x03A8, 0x3EC8, 0x0004,
+		0x0004, 0x3EC8, 0x03CC, 0x0AD0, 0x03CC, 0x3EC8, 0x0004
+};
 
+//=========================================
+// <num_taps>    = 7
+// <num_phases>  = 64
+// <scale_ratio> = 1.83332 (input/output)
+// <sharpness>   = 0
+// <CoefType>    = ModifiedLanczos
+// <CoefQuant>   = 1.10
+// <CoefOut>     = 1.12
+//=========================================
 static const uint16_t filter_7tap_64p_183[231] = {
-	16216, 324, 1884, 1884, 324, 16216, 0,
-	16220, 304, 1864, 1904, 344, 16216, 0,
-	16224, 284, 1844, 1924, 364, 16216, 0,
-	16224, 264, 1824, 1944, 384, 16212, 16380,
-	16228, 248, 1804, 1960, 408, 16212, 16380,
-	16228, 228, 1784, 1976, 428, 16208, 16380,
-	16232, 212, 1760, 1996, 452, 16208, 16380,
-	16236, 192, 1740, 2012, 472, 16208, 16376,
-	16240, 176, 1716, 2028, 496, 16208, 16376,
-	16240, 160, 1696, 2040, 516, 16208, 16376,
-	16244, 144, 1672, 2056, 540, 16208, 16376,
-	16248, 128, 1648, 2068, 564, 16208, 16372,
-	16252, 112, 1624, 2084, 588, 16208, 16372,
-	16256, 96, 1600, 2096, 612, 16208, 16368,
-	16256, 84, 1576, 2108, 636, 16208, 16368,
-	16260, 68, 1552, 2120, 660, 16208, 16368,
-	16264, 56, 1524, 2132, 684, 16212, 16364,
-	16268, 40, 1500, 2140, 712, 16212, 16364,
-	16272, 28, 1476, 2152, 736, 16216, 16360,
-	16276, 16, 1448, 2160, 760, 16216, 16356,
-	16280, 4, 1424, 2168, 788, 16220, 16356,
-	16284, 16376, 1396, 2176, 812, 16224, 16352,
-	16288, 16368, 1372, 2184, 840, 16224, 16352,
-	16292, 16356, 1344, 2188, 864, 16228, 16348,
-	16292, 16344, 1320, 2196, 892, 16232, 16344,
-	16296, 16336, 1292, 2200, 916, 16236, 16344,
-	16300, 16324, 1264, 2204, 944, 16240, 16340,
-	16304, 16316, 1240, 2208, 972, 16248, 16336,
-	16308, 16308, 1212, 2212, 996, 16252, 16332,
-	16312, 16300, 1184, 2216, 1024, 16256, 16332,
-	16316, 16292, 1160, 2216, 1052, 16264, 16328,
-	16316, 16284, 1132, 2216, 1076, 16268, 16324,
-	16320, 16276, 1104, 2216, 1104, 16276, 16320 };
+		0x3FA4, 0x01E8, 0x0674, 0x0674, 0x01E8, 0x3FA4, 0x0000,
+		0x3FA4, 0x01D4, 0x0668, 0x0684, 0x01F8, 0x3FA4, 0x0000,
+		0x3FA4, 0x01C4, 0x0658, 0x0690, 0x0208, 0x3FA8, 0x0000,
+		0x3FA0, 0x01B4, 0x064C, 0x06A0, 0x021C, 0x3FA8, 0x3FFC,
+		0x3FA0, 0x01A4, 0x063C, 0x06AC, 0x022C, 0x3FAC, 0x3FFC,
+		0x3FA0, 0x0194, 0x0630, 0x06B4, 0x0240, 0x3FAC, 0x3FFC,
+		0x3FA0, 0x0184, 0x0620, 0x06C4, 0x0250, 0x3FB0, 0x3FF8,
+		0x3FA0, 0x0174, 0x0614, 0x06CC, 0x0264, 0x3FB0, 0x3FF8,
+		0x3FA0, 0x0164, 0x0604, 0x06D8, 0x0278, 0x3FB4, 0x3FF4,
+		0x3FA0, 0x0154, 0x05F4, 0x06E4, 0x0288, 0x3FB8, 0x3FF4,
+		0x3FA0, 0x0148, 0x05E4, 0x06EC, 0x029C, 0x3FBC, 0x3FF0,
+		0x3FA0, 0x0138, 0x05D4, 0x06F4, 0x02B0, 0x3FC0, 0x3FF0,
+		0x3FA0, 0x0128, 0x05C4, 0x0704, 0x02C4, 0x3FC0, 0x3FEC,
+		0x3FA0, 0x011C, 0x05B4, 0x0708, 0x02D8, 0x3FC4, 0x3FEC,
+		0x3FA4, 0x010C, 0x05A4, 0x0714, 0x02E8, 0x3FC8, 0x3FE8,
+		0x3FA4, 0x0100, 0x0590, 0x0718, 0x02FC, 0x3FD0, 0x3FE8,
+		0x3FA4, 0x00F0, 0x0580, 0x0724, 0x0310, 0x3FD4, 0x3FE4,
+		0x3FA4, 0x00E4, 0x056C, 0x072C, 0x0324, 0x3FD8, 0x3FE4,
+		0x3FA8, 0x00D8, 0x055C, 0x0730, 0x0338, 0x3FDC, 0x3FE0,
+		0x3FA8, 0x00CC, 0x0548, 0x0738, 0x034C, 0x3FE4, 0x3FDC,
+		0x3FA8, 0x00BC, 0x0538, 0x0740, 0x0360, 0x3FE8, 0x3FDC,
+		0x3FAC, 0x00B0, 0x0528, 0x0744, 0x0374, 0x3FEC, 0x3FD8,
+		0x3FAC, 0x00A4, 0x0514, 0x0748, 0x0388, 0x3FF4, 0x3FD8,
+		0x3FB0, 0x0098, 0x0500, 0x074C, 0x039C, 0x3FFC, 0x3FD4,
+		0x3FB0, 0x0090, 0x04EC, 0x0750, 0x03B0, 0x0000, 0x3FD4,
+		0x3FB0, 0x0084, 0x04DC, 0x0758, 0x03C4, 0x0004, 0x3FD0,
+		0x3FB4, 0x0078, 0x04CC, 0x0758, 0x03D8, 0x000C, 0x3FCC,
+		0x3FB4, 0x006C, 0x04B8, 0x075C, 0x03EC, 0x0014, 0x3FCC,
+		0x3FB8, 0x0064, 0x04A0, 0x0760, 0x0400, 0x001C, 0x3FC8,
+		0x3FB8, 0x0058, 0x0490, 0x0760, 0x0414, 0x0024, 0x3FC8,
+		0x3FBC, 0x0050, 0x047C, 0x0760, 0x0428, 0x002C, 0x3FC4,
+		0x3FBC, 0x0048, 0x0464, 0x0764, 0x043C, 0x0034, 0x3FC4,
+		0x3FC0, 0x003C, 0x0454, 0x0764, 0x0450, 0x003C, 0x3FC0
+};
 
+//=========================================
+// <num_taps>    = 8
+// <num_phases>  = 64
+// <scale_ratio> = 0.83333 (input/output)
+// <sharpness>   = 0
+// <CoefType>    = ModifiedLanczos
+// <CoefQuant>   = 1.10
+// <CoefOut>     = 1.12
+//=========================================
 static const uint16_t filter_8tap_64p_upscale[264] = {
-	0, 0, 0, 4096, 0, 0, 0, 0,
-	16376, 20, 16328, 4092, 56, 16364, 4, 0,
-	16372, 36, 16272, 4088, 116, 16340, 12, 0,
-	16364, 56, 16220, 4080, 180, 16320, 20, 0,
-	16360, 76, 16172, 4064, 244, 16296, 24, 16380,
-	16356, 92, 16124, 4048, 312, 16276, 32, 16380,
-	16352, 108, 16080, 4032, 380, 16252, 40, 16380,
-	16344, 124, 16036, 4008, 452, 16228, 48, 16380,
-	16340, 136, 15996, 3980, 524, 16204, 56, 16380,
-	16340, 152, 15956, 3952, 600, 16180, 64, 16376,
-	16336, 164, 15920, 3920, 672, 16156, 76, 16376,
-	16332, 176, 15888, 3884, 752, 16132, 84, 16376,
-	16328, 188, 15860, 3844, 828, 16104, 92, 16372,
-	16328, 200, 15828, 3800, 908, 16080, 100, 16372,
-	16324, 208, 15804, 3756, 992, 16056, 108, 16372,
-	16324, 216, 15780, 3708, 1072, 16032, 120, 16368,
-	16320, 224, 15760, 3656, 1156, 16008, 128, 16368,
-	16320, 232, 15740, 3604, 1240, 15984, 136, 16364,
-	16320, 240, 15724, 3548, 1324, 15960, 144, 16364,
-	16320, 244, 15708, 3488, 1412, 15936, 152, 16360,
-	16320, 248, 15696, 3428, 1496, 15912, 160, 16360,
-	16320, 252, 15688, 3364, 1584, 15892, 172, 16356,
-	16320, 256, 15680, 3296, 1672, 15868, 180, 16352,
-	16320, 256, 15672, 3228, 1756, 15848, 188, 16352,
-	16320, 256, 15668, 3156, 1844, 15828, 192, 16348,
-	16320, 260, 15668, 3084, 1932, 15808, 200, 16348,
-	16320, 256, 15668, 3012, 2020, 15792, 208, 16344,
-	16324, 256, 15668, 2936, 2108, 15772, 216, 16344,
-	16324, 256, 15672, 2856, 2192, 15756, 220, 16340,
-	16324, 252, 15676, 2776, 2280, 15740, 228, 16336,
-	16328, 252, 15684, 2696, 2364, 15728, 232, 16336,
-	16328, 248, 15692, 2616, 2448, 15716, 240, 16332,
-	16332, 244, 15704, 2532, 2532, 15704, 244, 16332 };
+		0x0000, 0x0000, 0x0000, 0x1000, 0x0000, 0x0000, 0x0000, 0x0000,
+		0x3FFC, 0x0014, 0x3FC8, 0x1000, 0x0038, 0x3FEC, 0x0004, 0x0000,
+		0x3FF4, 0x0024, 0x3F94, 0x0FFC, 0x0074, 0x3FD8, 0x000C, 0x0000,
+		0x3FF0, 0x0038, 0x3F60, 0x0FEC, 0x00B4, 0x3FC4, 0x0014, 0x0000,
+		0x3FEC, 0x004C, 0x3F2C, 0x0FE4, 0x00F4, 0x3FAC, 0x0018, 0x0000,
+		0x3FE4, 0x005C, 0x3F00, 0x0FD4, 0x0138, 0x3F94, 0x0020, 0x0000,
+		0x3FE0, 0x006C, 0x3ED0, 0x0FC4, 0x017C, 0x3F7C, 0x0028, 0x0000,
+		0x3FDC, 0x007C, 0x3EA8, 0x0FA4, 0x01C4, 0x3F68, 0x0030, 0x0000,
+		0x3FD8, 0x0088, 0x3E80, 0x0F90, 0x020C, 0x3F50, 0x0038, 0x3FFC,
+		0x3FD4, 0x0098, 0x3E58, 0x0F70, 0x0258, 0x3F38, 0x0040, 0x3FFC,
+		0x3FD0, 0x00A4, 0x3E34, 0x0F54, 0x02A0, 0x3F1C, 0x004C, 0x3FFC,
+		0x3FD0, 0x00B0, 0x3E14, 0x0F28, 0x02F0, 0x3F04, 0x0054, 0x3FFC,
+		0x3FCC, 0x00BC, 0x3DF4, 0x0F08, 0x033C, 0x3EEC, 0x005C, 0x3FF8,
+		0x3FC8, 0x00C8, 0x3DD8, 0x0EDC, 0x038C, 0x3ED4, 0x0064, 0x3FF8,
+		0x3FC8, 0x00D0, 0x3DC0, 0x0EAC, 0x03E0, 0x3EBC, 0x006C, 0x3FF4,
+		0x3FC4, 0x00D8, 0x3DA8, 0x0E7C, 0x0430, 0x3EA4, 0x0078, 0x3FF4,
+		0x3FC4, 0x00E0, 0x3D94, 0x0E48, 0x0484, 0x3E8C, 0x0080, 0x3FF0,
+		0x3FC4, 0x00E8, 0x3D80, 0x0E10, 0x04D8, 0x3E74, 0x0088, 0x3FF0,
+		0x3FC4, 0x00F0, 0x3D70, 0x0DD8, 0x052C, 0x3E5C, 0x0090, 0x3FEC,
+		0x3FC0, 0x00F4, 0x3D60, 0x0DA0, 0x0584, 0x3E44, 0x0098, 0x3FEC,
+		0x3FC0, 0x00F8, 0x3D54, 0x0D68, 0x05D8, 0x3E2C, 0x00A0, 0x3FE8,
+		0x3FC0, 0x00FC, 0x3D48, 0x0D20, 0x0630, 0x3E18, 0x00AC, 0x3FE8,
+		0x3FC0, 0x0100, 0x3D40, 0x0CE0, 0x0688, 0x3E00, 0x00B4, 0x3FE4,
+		0x3FC4, 0x0100, 0x3D3C, 0x0C98, 0x06DC, 0x3DEC, 0x00BC, 0x3FE4,
+		0x3FC4, 0x0100, 0x3D38, 0x0C58, 0x0734, 0x3DD8, 0x00C0, 0x3FE0,
+		0x3FC4, 0x0104, 0x3D38, 0x0C0C, 0x078C, 0x3DC4, 0x00C8, 0x3FDC,
+		0x3FC4, 0x0100, 0x3D38, 0x0BC4, 0x07E4, 0x3DB0, 0x00D0, 0x3FDC,
+		0x3FC4, 0x0100, 0x3D38, 0x0B78, 0x083C, 0x3DA0, 0x00D8, 0x3FD8,
+		0x3FC8, 0x0100, 0x3D3C, 0x0B28, 0x0890, 0x3D90, 0x00DC, 0x3FD8,
+		0x3FC8, 0x00FC, 0x3D40, 0x0ADC, 0x08E8, 0x3D80, 0x00E4, 0x3FD4,
+		0x3FCC, 0x00FC, 0x3D48, 0x0A84, 0x093C, 0x3D74, 0x00E8, 0x3FD4,
+		0x3FCC, 0x00F8, 0x3D50, 0x0A38, 0x0990, 0x3D64, 0x00F0, 0x3FD0,
+		0x3FD0, 0x00F4, 0x3D58, 0x09E0, 0x09E4, 0x3D5C, 0x00F4, 0x3FD0
+};
 
-static const uint16_t filter_8tap_64p_117[264] = {
-	116, 16100, 428, 3564, 428, 16100, 116, 0,
-	112, 16116, 376, 3564, 484, 16084, 120, 16380,
-	104, 16136, 324, 3560, 540, 16064, 124, 16380,
-	100, 16152, 272, 3556, 600, 16048, 128, 16380,
-	96, 16168, 220, 3548, 656, 16032, 136, 16376,
-	88, 16188, 172, 3540, 716, 16016, 140, 16376,
-	84, 16204, 124, 3528, 780, 16000, 144, 16376,
-	80, 16220, 76, 3512, 840, 15984, 148, 16372,
-	76, 16236, 32, 3496, 904, 15968, 152, 16372,
-	68, 16252, 16376, 3480, 968, 15952, 156, 16372,
-	64, 16268, 16332, 3456, 1032, 15936, 160, 16372,
-	60, 16284, 16292, 3432, 1096, 15920, 164, 16368,
-	56, 16300, 16252, 3408, 1164, 15908, 164, 16368,
-	48, 16316, 16216, 3380, 1228, 15892, 168, 16368,
-	44, 16332, 16180, 3348, 1296, 15880, 168, 16368,
-	40, 16348, 16148, 3316, 1364, 15868, 172, 16364,
-	36, 16360, 16116, 3284, 1428, 15856, 172, 16364,
-	32, 16376, 16084, 3248, 1496, 15848, 176, 16364,
-	28, 4, 16052, 3208, 1564, 15836, 176, 16364,
-	24, 16, 16028, 3168, 1632, 15828, 176, 16364,
-	20, 28, 16000, 3124, 1700, 15820, 176, 16364,
-	16, 40, 15976, 3080, 1768, 15812, 176, 16364,
-	12, 52, 15952, 3036, 1836, 15808, 176, 16364,
-	8, 64, 15932, 2988, 1904, 15800, 176, 16364,
-	4, 76, 15912, 2940, 1972, 15800, 172, 16364,
-	4, 84, 15892, 2888, 2040, 15796, 172, 16364,
-	0, 96, 15876, 2836, 2104, 15792, 168, 16364,
-	16380, 104, 15864, 2780, 2172, 15792, 164, 16364,
-	16380, 112, 15848, 2724, 2236, 15792, 160, 16364,
-	16376, 120, 15836, 2668, 2300, 15796, 156, 16368,
-	16376, 128, 15828, 2608, 2364, 15800, 152, 16368,
-	16372, 136, 15816, 2548, 2428, 15804, 148, 16368,
-	16372, 140, 15812, 2488, 2488, 15812, 140, 16372 };
+//=========================================
+// <num_taps>    = 8
+// <num_phases>  = 64
+// <scale_ratio> = 1.16666 (input/output)
+// <sharpness>   = 0
+// <CoefType>    = ModifiedLanczos
+// <CoefQuant>   = 1.10
+// <CoefOut>     = 1.12
+//=========================================
+static const uint16_t filter_8tap_64p_116[264] = {
+		0x0080, 0x3E90, 0x0268, 0x0D14, 0x0264, 0x3E90, 0x0080, 0x0000,
+		0x007C, 0x3E9C, 0x0238, 0x0D14, 0x0298, 0x3E84, 0x0080, 0x0000,
+		0x0078, 0x3EAC, 0x0200, 0x0D10, 0x02D0, 0x3E78, 0x0084, 0x0000,
+		0x0078, 0x3EB8, 0x01D0, 0x0D0C, 0x0304, 0x3E6C, 0x0084, 0x0000,
+		0x0074, 0x3EC8, 0x01A0, 0x0D00, 0x033C, 0x3E60, 0x0088, 0x0000,
+		0x0070, 0x3ED4, 0x0170, 0x0D00, 0x0374, 0x3E54, 0x0088, 0x3FFC,
+		0x006C, 0x3EE4, 0x0140, 0x0CF8, 0x03AC, 0x3E48, 0x0088, 0x3FFC,
+		0x006C, 0x3EF0, 0x0114, 0x0CE8, 0x03E4, 0x3E3C, 0x008C, 0x3FFC,
+		0x0068, 0x3F00, 0x00E8, 0x0CD8, 0x041C, 0x3E34, 0x008C, 0x3FFC,
+		0x0064, 0x3F10, 0x00BC, 0x0CCC, 0x0454, 0x3E28, 0x008C, 0x3FFC,
+		0x0060, 0x3F1C, 0x0090, 0x0CBC, 0x0490, 0x3E20, 0x008C, 0x3FFC,
+		0x005C, 0x3F2C, 0x0068, 0x0CA4, 0x04CC, 0x3E18, 0x008C, 0x3FFC,
+		0x0058, 0x3F38, 0x0040, 0x0C94, 0x0504, 0x3E10, 0x008C, 0x3FFC,
+		0x0054, 0x3F48, 0x001C, 0x0C7C, 0x0540, 0x3E08, 0x0088, 0x3FFC,
+		0x0050, 0x3F54, 0x3FF8, 0x0C60, 0x057C, 0x3E04, 0x0088, 0x3FFC,
+		0x004C, 0x3F64, 0x3FD4, 0x0C44, 0x05B8, 0x3DFC, 0x0088, 0x3FFC,
+		0x0048, 0x3F70, 0x3FB4, 0x0C28, 0x05F4, 0x3DF8, 0x0084, 0x3FFC,
+		0x0044, 0x3F80, 0x3F90, 0x0C0C, 0x0630, 0x3DF4, 0x0080, 0x3FFC,
+		0x0040, 0x3F8C, 0x3F70, 0x0BE8, 0x066C, 0x3DF4, 0x0080, 0x3FFC,
+		0x003C, 0x3F9C, 0x3F50, 0x0BC8, 0x06A8, 0x3DF0, 0x007C, 0x3FFC,
+		0x0038, 0x3FA8, 0x3F34, 0x0BA0, 0x06E4, 0x3DF0, 0x0078, 0x0000,
+		0x0034, 0x3FB4, 0x3F18, 0x0B80, 0x071C, 0x3DF0, 0x0074, 0x0000,
+		0x0030, 0x3FC0, 0x3EFC, 0x0B5C, 0x0758, 0x3DF0, 0x0070, 0x0000,
+		0x002C, 0x3FCC, 0x3EE4, 0x0B34, 0x0794, 0x3DF4, 0x0068, 0x0000,
+		0x002C, 0x3FDC, 0x3ECC, 0x0B08, 0x07CC, 0x3DF4, 0x0064, 0x0000,
+		0x0028, 0x3FE4, 0x3EB4, 0x0AE0, 0x0808, 0x3DF8, 0x0060, 0x0000,
+		0x0024, 0x3FF0, 0x3EA0, 0x0AB0, 0x0840, 0x3E00, 0x0058, 0x0004,
+		0x0020, 0x3FFC, 0x3E90, 0x0A84, 0x0878, 0x3E04, 0x0050, 0x0004,
+		0x001C, 0x0004, 0x3E7C, 0x0A54, 0x08B0, 0x3E0C, 0x004C, 0x0008,
+		0x0018, 0x000C, 0x3E68, 0x0A28, 0x08E8, 0x3E18, 0x0044, 0x0008,
+		0x0018, 0x0018, 0x3E54, 0x09F4, 0x0920, 0x3E20, 0x003C, 0x000C,
+		0x0014, 0x0020, 0x3E48, 0x09C0, 0x0954, 0x3E2C, 0x0034, 0x0010,
+		0x0010, 0x002C, 0x3E3C, 0x098C, 0x0988, 0x3E38, 0x002C, 0x0010
+};
 
-static const uint16_t filter_8tap_64p_150[264] = {
-	16380, 16020, 1032, 2756, 1032, 16020, 16380, 0,
-	0, 16020, 992, 2756, 1068, 16024, 16376, 0,
-	4, 16020, 952, 2752, 1108, 16024, 16372, 0,
-	8, 16020, 916, 2748, 1148, 16028, 16368, 0,
-	12, 16020, 876, 2744, 1184, 16032, 16364, 4,
-	16, 16020, 840, 2740, 1224, 16036, 16356, 4,
-	20, 16024, 800, 2732, 1264, 16040, 16352, 4,
-	20, 16024, 764, 2724, 1304, 16044, 16348, 8,
-	24, 16028, 728, 2716, 1344, 16052, 16340, 8,
-	28, 16028, 692, 2704, 1380, 16056, 16336, 12,
-	28, 16032, 656, 2696, 1420, 16064, 16328, 12,
-	32, 16036, 620, 2684, 1460, 16072, 16324, 12,
-	36, 16040, 584, 2668, 1500, 16080, 16316, 16,
-	36, 16044, 548, 2656, 1536, 16088, 16308, 16,
-	36, 16048, 516, 2640, 1576, 16096, 16304, 20,
-	40, 16052, 480, 2624, 1612, 16108, 16296, 20,
-	40, 16060, 448, 2608, 1652, 16120, 16288, 20,
-	44, 16064, 416, 2588, 1692, 16132, 16280, 24,
-	44, 16068, 384, 2568, 1728, 16144, 16276, 24,
-	44, 16076, 352, 2548, 1764, 16156, 16268, 28,
-	44, 16080, 320, 2528, 1804, 16168, 16260, 28,
-	44, 16088, 292, 2508, 1840, 16184, 16252, 28,
-	44, 16096, 264, 2484, 1876, 16200, 16244, 32,
-	48, 16100, 232, 2460, 1912, 16216, 16236, 32,
-	48, 16108, 204, 2436, 1948, 16232, 16228, 32,
-	48, 16116, 176, 2412, 1980, 16248, 16220, 36,
-	48, 16124, 152, 2384, 2016, 16264, 16216, 36,
-	44, 16128, 124, 2356, 2052, 16284, 16208, 36,
-	44, 16136, 100, 2328, 2084, 16304, 16200, 40,
-	44, 16144, 72, 2300, 2116, 16324, 16192, 40,
-	44, 16152, 48, 2272, 2148, 16344, 16184, 40,
-	44, 16160, 24, 2244, 2180, 16364, 16176, 40,
-	44, 16168, 4, 2212, 2212, 4, 16168, 44 };
+//=========================================
+// <num_taps>    = 8
+// <num_phases>  = 64
+// <scale_ratio> = 1.49999 (input/output)
+// <sharpness>   = 0
+// <CoefType>    = ModifiedLanczos
+// <CoefQuant>   = 1.10
+// <CoefOut>     = 1.12
+//=========================================
+static const uint16_t filter_8tap_64p_149[264] = {
+		0x0008, 0x3E8C, 0x03F8, 0x0AE8, 0x03F8, 0x3E8C, 0x0008, 0x0000,
+		0x000C, 0x3E8C, 0x03D0, 0x0AE8, 0x0420, 0x3E90, 0x0000, 0x0000,
+		0x000C, 0x3E8C, 0x03AC, 0x0AE8, 0x0444, 0x3E90, 0x0000, 0x0000,
+		0x0010, 0x3E90, 0x0384, 0x0AE0, 0x046C, 0x3E94, 0x3FFC, 0x0000,
+		0x0014, 0x3E90, 0x035C, 0x0ADC, 0x0494, 0x3E94, 0x3FF8, 0x0004,
+		0x0018, 0x3E90, 0x0334, 0x0AD8, 0x04BC, 0x3E98, 0x3FF4, 0x0004,
+		0x001C, 0x3E94, 0x0310, 0x0AD0, 0x04E4, 0x3E9C, 0x3FEC, 0x0004,
+		0x0020, 0x3E98, 0x02E8, 0x0AC4, 0x050C, 0x3EA0, 0x3FE8, 0x0008,
+		0x0020, 0x3E98, 0x02C4, 0x0AC0, 0x0534, 0x3EA4, 0x3FE4, 0x0008,
+		0x0024, 0x3E9C, 0x02A0, 0x0AB4, 0x055C, 0x3EAC, 0x3FDC, 0x0008,
+		0x0024, 0x3EA0, 0x027C, 0x0AA8, 0x0584, 0x3EB0, 0x3FD8, 0x000C,
+		0x0028, 0x3EA4, 0x0258, 0x0A9C, 0x05AC, 0x3EB8, 0x3FD0, 0x000C,
+		0x0028, 0x3EA8, 0x0234, 0x0A90, 0x05D4, 0x3EC0, 0x3FC8, 0x0010,
+		0x002C, 0x3EAC, 0x0210, 0x0A80, 0x05FC, 0x3EC8, 0x3FC4, 0x0010,
+		0x002C, 0x3EB4, 0x01F0, 0x0A70, 0x0624, 0x3ED0, 0x3FBC, 0x0010,
+		0x002C, 0x3EB8, 0x01CC, 0x0A60, 0x064C, 0x3EDC, 0x3FB4, 0x0014,
+		0x0030, 0x3EBC, 0x01A8, 0x0A50, 0x0674, 0x3EE4, 0x3FB0, 0x0014,
+		0x0030, 0x3EC4, 0x0188, 0x0A38, 0x069C, 0x3EF0, 0x3FA8, 0x0018,
+		0x0030, 0x3ECC, 0x0168, 0x0A28, 0x06C0, 0x3EFC, 0x3FA0, 0x0018,
+		0x0030, 0x3ED0, 0x0148, 0x0A14, 0x06E8, 0x3F08, 0x3F98, 0x001C,
+		0x0030, 0x3ED8, 0x012C, 0x0A00, 0x070C, 0x3F14, 0x3F90, 0x001C,
+		0x0034, 0x3EE0, 0x0108, 0x09E4, 0x0734, 0x3F24, 0x3F8C, 0x001C,
+		0x0034, 0x3EE4, 0x00EC, 0x09CC, 0x0758, 0x3F34, 0x3F84, 0x0020,
+		0x0034, 0x3EEC, 0x00D0, 0x09B8, 0x077C, 0x3F40, 0x3F7C, 0x0020,
+		0x0034, 0x3EF4, 0x00B4, 0x0998, 0x07A4, 0x3F50, 0x3F74, 0x0024,
+		0x0030, 0x3EFC, 0x0098, 0x0980, 0x07C8, 0x3F64, 0x3F6C, 0x0024,
+		0x0030, 0x3F04, 0x0080, 0x0968, 0x07E8, 0x3F74, 0x3F64, 0x0024,
+		0x0030, 0x3F0C, 0x0060, 0x094C, 0x080C, 0x3F88, 0x3F5C, 0x0028,
+		0x0030, 0x3F14, 0x0048, 0x0930, 0x0830, 0x3F98, 0x3F54, 0x0028,
+		0x0030, 0x3F1C, 0x0030, 0x0914, 0x0850, 0x3FAC, 0x3F4C, 0x0028,
+		0x0030, 0x3F24, 0x0018, 0x08F0, 0x0874, 0x3FC0, 0x3F44, 0x002C,
+		0x002C, 0x3F2C, 0x0000, 0x08D4, 0x0894, 0x3FD8, 0x3F3C, 0x002C,
+		0x002C, 0x3F34, 0x3FEC, 0x08B4, 0x08B4, 0x3FEC, 0x3F34, 0x002C
+};
 
+//=========================================
+// <num_taps>    = 8
+// <num_phases>  = 64
+// <scale_ratio> = 1.83332 (input/output)
+// <sharpness>   = 0
+// <CoefType>    = ModifiedLanczos
+// <CoefQuant>   = 1.10
+// <CoefOut>     = 1.12
+//=========================================
 static const uint16_t filter_8tap_64p_183[264] = {
-	16264, 16264, 1164, 2244, 1164, 16264, 16264, 0,
-	16268, 16256, 1136, 2240, 1188, 16272, 16260, 0,
-	16272, 16248, 1108, 2240, 1216, 16280, 16256, 0,
-	16276, 16240, 1080, 2236, 1240, 16292, 16252, 0,
-	16280, 16232, 1056, 2236, 1268, 16300, 16248, 0,
-	16284, 16224, 1028, 2232, 1292, 16312, 16244, 0,
-	16288, 16216, 1000, 2228, 1320, 16324, 16240, 0,
-	16292, 16212, 976, 2224, 1344, 16336, 16236, 0,
-	16296, 16204, 948, 2220, 1372, 16348, 16232, 0,
-	16300, 16200, 920, 2212, 1396, 16360, 16228, 4,
-	16304, 16196, 896, 2204, 1424, 16372, 16224, 4,
-	16308, 16188, 868, 2200, 1448, 0, 16220, 4,
-	16312, 16184, 844, 2192, 1472, 12, 16216, 4,
-	16316, 16180, 816, 2184, 1500, 28, 16212, 4,
-	16320, 16176, 792, 2172, 1524, 40, 16208, 4,
-	16324, 16172, 764, 2164, 1548, 56, 16204, 0,
-	16328, 16172, 740, 2156, 1572, 72, 16200, 0,
-	16328, 16168, 712, 2144, 1596, 88, 16196, 0,
-	16332, 16164, 688, 2132, 1620, 100, 16192, 0,
-	16336, 16164, 664, 2120, 1644, 120, 16192, 0,
-	16340, 16160, 640, 2108, 1668, 136, 16188, 0,
-	16344, 16160, 616, 2096, 1688, 152, 16184, 0,
-	16344, 16160, 592, 2080, 1712, 168, 16180, 0,
-	16348, 16156, 568, 2068, 1736, 188, 16176, 16380,
-	16352, 16156, 544, 2052, 1756, 204, 16176, 16380,
-	16352, 16156, 520, 2036, 1780, 224, 16172, 16380,
-	16356, 16156, 496, 2024, 1800, 244, 16172, 16380,
-	16360, 16156, 472, 2008, 1820, 260, 16168, 16376,
-	16360, 16156, 452, 1988, 1840, 280, 16164, 16376,
-	16364, 16156, 428, 1972, 1860, 300, 16164, 16376,
-	16364, 16156, 408, 1956, 1880, 320, 16164, 16372,
-	16368, 16160, 384, 1936, 1900, 344, 16160, 16372,
-	16368, 16160, 364, 1920, 1920, 364, 16160, 16368 };
+		0x3F88, 0x0048, 0x047C, 0x0768, 0x047C, 0x0048, 0x3F88, 0x0000,
+		0x3F88, 0x003C, 0x0468, 0x076C, 0x0490, 0x0054, 0x3F84, 0x0000,
+		0x3F8C, 0x0034, 0x0454, 0x0768, 0x04A4, 0x005C, 0x3F84, 0x0000,
+		0x3F8C, 0x0028, 0x0444, 0x076C, 0x04B4, 0x0068, 0x3F80, 0x0000,
+		0x3F90, 0x0020, 0x042C, 0x0768, 0x04C8, 0x0074, 0x3F80, 0x0000,
+		0x3F90, 0x0018, 0x041C, 0x0764, 0x04DC, 0x0080, 0x3F7C, 0x0000,
+		0x3F94, 0x0010, 0x0408, 0x075C, 0x04F0, 0x008C, 0x3F7C, 0x0000,
+		0x3F94, 0x0004, 0x03F8, 0x0760, 0x0500, 0x0098, 0x3F7C, 0x3FFC,
+		0x3F98, 0x0000, 0x03E0, 0x075C, 0x0514, 0x00A4, 0x3F78, 0x3FFC,
+		0x3F9C, 0x3FF8, 0x03CC, 0x0754, 0x0528, 0x00B0, 0x3F78, 0x3FFC,
+		0x3F9C, 0x3FF0, 0x03B8, 0x0754, 0x0538, 0x00BC, 0x3F78, 0x3FFC,
+		0x3FA0, 0x3FE8, 0x03A4, 0x0750, 0x054C, 0x00CC, 0x3F74, 0x3FF8,
+		0x3FA4, 0x3FE0, 0x0390, 0x074C, 0x055C, 0x00D8, 0x3F74, 0x3FF8,
+		0x3FA4, 0x3FDC, 0x037C, 0x0744, 0x0570, 0x00E4, 0x3F74, 0x3FF8,
+		0x3FA8, 0x3FD4, 0x0368, 0x0740, 0x0580, 0x00F4, 0x3F74, 0x3FF4,
+		0x3FA8, 0x3FCC, 0x0354, 0x073C, 0x0590, 0x0104, 0x3F74, 0x3FF4,
+		0x3FAC, 0x3FC8, 0x0340, 0x0730, 0x05A4, 0x0110, 0x3F74, 0x3FF4,
+		0x3FB0, 0x3FC0, 0x0330, 0x0728, 0x05B4, 0x0120, 0x3F74, 0x3FF0,
+		0x3FB0, 0x3FBC, 0x031C, 0x0724, 0x05C4, 0x0130, 0x3F70, 0x3FF0,
+		0x3FB4, 0x3FB4, 0x0308, 0x0720, 0x05D4, 0x013C, 0x3F70, 0x3FF0,
+		0x3FB8, 0x3FB0, 0x02F4, 0x0714, 0x05E4, 0x014C, 0x3F74, 0x3FEC,
+		0x3FB8, 0x3FAC, 0x02E0, 0x0708, 0x05F8, 0x015C, 0x3F74, 0x3FEC,
+		0x3FBC, 0x3FA8, 0x02CC, 0x0704, 0x0604, 0x016C, 0x3F74, 0x3FE8,
+		0x3FC0, 0x3FA0, 0x02BC, 0x06F8, 0x0614, 0x017C, 0x3F74, 0x3FE8,
+		0x3FC0, 0x3F9C, 0x02A8, 0x06F4, 0x0624, 0x018C, 0x3F74, 0x3FE4,
+		0x3FC4, 0x3F98, 0x0294, 0x06E8, 0x0634, 0x019C, 0x3F74, 0x3FE4,
+		0x3FC8, 0x3F94, 0x0284, 0x06D8, 0x0644, 0x01AC, 0x3F78, 0x3FE0,
+		0x3FC8, 0x3F90, 0x0270, 0x06D4, 0x0650, 0x01BC, 0x3F78, 0x3FE0,
+		0x3FCC, 0x3F8C, 0x025C, 0x06C8, 0x0660, 0x01D0, 0x3F78, 0x3FDC,
+		0x3FCC, 0x3F8C, 0x024C, 0x06B8, 0x066C, 0x01E0, 0x3F7C, 0x3FDC,
+		0x3FD0, 0x3F88, 0x0238, 0x06B0, 0x067C, 0x01F0, 0x3F7C, 0x3FD8,
+		0x3FD4, 0x3F84, 0x0228, 0x069C, 0x0688, 0x0204, 0x3F80, 0x3FD8,
+		0x3FD4, 0x3F84, 0x0214, 0x0694, 0x0694, 0x0214, 0x3F84, 0x3FD4
+};
 
 const uint16_t *get_filter_3tap_16p(struct fixed31_32 ratio)
 {
 	if (ratio.value < dc_fixpt_one.value)
 		return filter_3tap_16p_upscale;
 	else if (ratio.value < dc_fixpt_from_fraction(4, 3).value)
-		return filter_3tap_16p_117;
+		return filter_3tap_16p_116;
 	else if (ratio.value < dc_fixpt_from_fraction(5, 3).value)
-		return filter_3tap_16p_150;
+		return filter_3tap_16p_149;
 	else
 		return filter_3tap_16p_183;
 }
@@ -1029,9 +1355,9 @@ const uint16_t *get_filter_3tap_64p(struct fixed31_32 ratio)
 	if (ratio.value < dc_fixpt_one.value)
 		return filter_3tap_64p_upscale;
 	else if (ratio.value < dc_fixpt_from_fraction(4, 3).value)
-		return filter_3tap_64p_117;
+		return filter_3tap_64p_116;
 	else if (ratio.value < dc_fixpt_from_fraction(5, 3).value)
-		return filter_3tap_64p_150;
+		return filter_3tap_64p_149;
 	else
 		return filter_3tap_64p_183;
 }
@@ -1041,9 +1367,9 @@ const uint16_t *get_filter_4tap_16p(struct fixed31_32 ratio)
 	if (ratio.value < dc_fixpt_one.value)
 		return filter_4tap_16p_upscale;
 	else if (ratio.value < dc_fixpt_from_fraction(4, 3).value)
-		return filter_4tap_16p_117;
+		return filter_4tap_16p_116;
 	else if (ratio.value < dc_fixpt_from_fraction(5, 3).value)
-		return filter_4tap_16p_150;
+		return filter_4tap_16p_149;
 	else
 		return filter_4tap_16p_183;
 }
@@ -1053,9 +1379,9 @@ const uint16_t *get_filter_4tap_64p(struct fixed31_32 ratio)
 	if (ratio.value < dc_fixpt_one.value)
 		return filter_4tap_64p_upscale;
 	else if (ratio.value < dc_fixpt_from_fraction(4, 3).value)
-		return filter_4tap_64p_117;
+		return filter_4tap_64p_116;
 	else if (ratio.value < dc_fixpt_from_fraction(5, 3).value)
-		return filter_4tap_64p_150;
+		return filter_4tap_64p_149;
 	else
 		return filter_4tap_64p_183;
 }
@@ -1065,9 +1391,9 @@ const uint16_t *get_filter_5tap_64p(struct fixed31_32 ratio)
 	if (ratio.value < dc_fixpt_one.value)
 		return filter_5tap_64p_upscale;
 	else if (ratio.value < dc_fixpt_from_fraction(4, 3).value)
-		return filter_5tap_64p_117;
+		return filter_5tap_64p_116;
 	else if (ratio.value < dc_fixpt_from_fraction(5, 3).value)
-		return filter_5tap_64p_150;
+		return filter_5tap_64p_149;
 	else
 		return filter_5tap_64p_183;
 }
@@ -1077,9 +1403,9 @@ const uint16_t *get_filter_6tap_64p(struct fixed31_32 ratio)
 	if (ratio.value < dc_fixpt_one.value)
 		return filter_6tap_64p_upscale;
 	else if (ratio.value < dc_fixpt_from_fraction(4, 3).value)
-		return filter_6tap_64p_117;
+		return filter_6tap_64p_116;
 	else if (ratio.value < dc_fixpt_from_fraction(5, 3).value)
-		return filter_6tap_64p_150;
+		return filter_6tap_64p_149;
 	else
 		return filter_6tap_64p_183;
 }
@@ -1089,9 +1415,9 @@ const uint16_t *get_filter_7tap_64p(struct fixed31_32 ratio)
 	if (ratio.value < dc_fixpt_one.value)
 		return filter_7tap_64p_upscale;
 	else if (ratio.value < dc_fixpt_from_fraction(4, 3).value)
-		return filter_7tap_64p_117;
+		return filter_7tap_64p_116;
 	else if (ratio.value < dc_fixpt_from_fraction(5, 3).value)
-		return filter_7tap_64p_150;
+		return filter_7tap_64p_149;
 	else
 		return filter_7tap_64p_183;
 }
@@ -1101,9 +1427,9 @@ const uint16_t *get_filter_8tap_64p(struct fixed31_32 ratio)
 	if (ratio.value < dc_fixpt_one.value)
 		return filter_8tap_64p_upscale;
 	else if (ratio.value < dc_fixpt_from_fraction(4, 3).value)
-		return filter_8tap_64p_117;
+		return filter_8tap_64p_116;
 	else if (ratio.value < dc_fixpt_from_fraction(5, 3).value)
-		return filter_8tap_64p_150;
+		return filter_8tap_64p_149;
 	else
 		return filter_8tap_64p_183;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_scl_filters_old.c b/drivers/gpu/drm/amd/display/dc/dce/dce_scl_filters_old.c
new file mode 100644
index 000000000000..bb0e1b80ec3c
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_scl_filters_old.c
@@ -0,0 +1,25 @@
+/*
+ * Copyright 2012-16 Advanced Micro Devices, Inc.
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
-- 
2.25.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
