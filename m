Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C247B8ECCF
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Sep 2025 04:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E293A10E37E;
	Mon, 22 Sep 2025 02:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PPB5uFOh";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012069.outbound.protection.outlook.com [40.107.209.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CCD710E383
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Sep 2025 02:39:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vz2O5XvdF1F2HLNx2DxlbX+hoFO05jqBNeQeAqlAvVz4jKxBuojn+Jo0PjpVaAv8w3rK6aOXCl1hP6MtgTa2zXYA6/i/NPgFgIzPy4HGQ6ncpZVM8XS9jkhXCZ//+oTD+jdK5KzjDaVt3fgEIit66FDWCtAMCtYQFVQ6MST6LIVqIQr5Z7h0cPK4AWsCvcE0Ml7qwnS7/B3yyGj2YaVehWzvUxECcAGLcUKDXfYSLzQQJMmb4RlgqjT38Q3J6WeF/sWGMZc6gDm4T72LnIKWi1waW6SQLGi8ccYerVgVL5HzFnQ0Z5OY6mOQjW+PyxATt8sKJBKN5OIP2jUY0j0SzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FFQ0oTm37X3DOLSan67bilUHHCjZPfLvv6K46vvp9ao=;
 b=QaacZjyw57SrFSuJIXlYGr0aINI2PfsB0BLI2hBQj4ykUq1MMF0K78V5ZaZDvIjR0dPEQq80cpW1yT18raNt4X2bIxUqxC3IXfGLxJ7XVX0O4TP87vc/iuS4nvsTJkhIc+ltF7EpVvarSLo4kbeTcJtbJzh3O2SuKnM/FJYSJoTScralqXgVHUaWJ2v6jndUskfFcrVPK9BXOnqRptmLBIUPOPu8jglcWIrNnw9A6Ytsr0vWRP515+A2hNC+opCFjtUuqTHKfDq/0VBVvYzqs84GmIow/s6kmjYtJ6w8yxC9xMp4HxX5ewXvPyd04dRHVIsF87/xktSDnqRyUs892A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFQ0oTm37X3DOLSan67bilUHHCjZPfLvv6K46vvp9ao=;
 b=PPB5uFOhK6sZfyUrBFcHC1HYuNJ9H9CwtHnDyyDI3EKBaa44ZEy0ngJtwGPm3v5Qz73zcTkreVL/JAKJLzVHcxXEGFp5DqTUKmRLuG/FYjIYojpMZ5gH9L5sYy/XqgmoRL3US3UjNbIU1P97gfgmcfN6HQVFVmmu7UxZY5e76yA=
Received: from BYAPR01CA0041.prod.exchangelabs.com (2603:10b6:a03:94::18) by
 CY5PR12MB6273.namprd12.prod.outlook.com (2603:10b6:930:22::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.19; Mon, 22 Sep 2025 02:39:47 +0000
Received: from CO1PEPF000044FA.namprd21.prod.outlook.com
 (2603:10b6:a03:94:cafe::98) by BYAPR01CA0041.outlook.office365.com
 (2603:10b6:a03:94::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Mon,
 22 Sep 2025 02:40:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000044FA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.0 via Frontend Transport; Mon, 22 Sep 2025 02:39:47 +0000
Received: from amd-02.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 21 Sep
 2025 19:39:45 -0700
From: YiPeng Chai <YiPeng.Chai@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <yipechai@amd.com>, <Hawking.Zhang@amd.com>, <Tao.Zhou1@amd.com>,
 <Stanley.Yang@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>, Tao Zhou
 <tao.zhou1@amd.com>
Subject: [PATCH V5 12/20] drm/amd/ras: Add eeprom ras functions
Date: Mon, 22 Sep 2025 10:38:36 +0800
Message-ID: <20250922023844.3108065-12-YiPeng.Chai@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250922023844.3108065-1-YiPeng.Chai@amd.com>
References: <20250922023844.3108065-1-YiPeng.Chai@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FA:EE_|CY5PR12MB6273:EE_
X-MS-Office365-Filtering-Correlation-Id: c494a5a1-05f0-4962-8d3b-08ddf9814bf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0ZLTk02MWUweHlSWXp3ano4TnBXRS9ydytmamF1clVRK2QybFZaeG9DYy9X?=
 =?utf-8?B?M0hpeTBXSFF6Z085bGlicGh4bjlOM1h4M3l2YUdUbG5mdXlHNVp2Nm0xZ2k1?=
 =?utf-8?B?Uk1zbWs1MFB6Vzh2L01IMmkxNHdxTzFJSDJMRTk4V25vV2RCY3UyWG0wVWFm?=
 =?utf-8?B?ZVBVRk1RVU55eGF0UGkzTE1BMklobmxuTzdMZ2lVVWtqMkNQak84dnBHUjBI?=
 =?utf-8?B?SEdXOXlObEtwNkFlaG5zb0hMVHFjMm9qQUwzSmt1dDZoR0psNjlyRlFhM2N1?=
 =?utf-8?B?cmErWDNXUXd2ZVhzY0h2a1pXSHJleXVXaE93ZThPaVZNR1o3aEpZYThFaXdW?=
 =?utf-8?B?NitLalVya3A2TElkdGhaTWo3bmUxcjU4bjlvOW5aTGtoa3U0cmlpVDNOc2cw?=
 =?utf-8?B?WTdPdzFUckI0RHkzcDRKRVNzTDFwWXE4RXdTSDZ3K3hvSFgzKzY1WjBzeHd1?=
 =?utf-8?B?SzJHKy9SR2hwMUZxbGMvTkJ4MERhWEoyYkFSbUFkNy9WQS8vOVRzTlhoQ2VZ?=
 =?utf-8?B?R2xrbWZlc1FKbEoyR2t3dTczNkVhTnpDZytaS1RCbU9NUlBLS1VxZkFFUXU5?=
 =?utf-8?B?SlB4WWh2ejVFbkZ1WVlnZ2FUZkJKRFZ6ZTB1SkJLYllXYXNLWWsvQkR0YXM3?=
 =?utf-8?B?ZFAvL3VUWm4yRWlzMFVDU25aTnI1b2xMRzBjK3U1VmE4SUJHZDVDcnl4dDFn?=
 =?utf-8?B?NHZxUjZCeWJhT3BZUDJYRUxZWitUQmNucTV4c0VHUXk0R0JyREZlTkxlTW4z?=
 =?utf-8?B?cGIyR1BLK083NXg3ZFN6SmVmMm9vTWN4UEJmTkQ5S1JITkpEbDZVREFETnlL?=
 =?utf-8?B?czlXeGpLUjhoTE9ta3I5U1BWb2ZmQ3Vab2MwYThRbEVZZWl1T0t1YUJET29l?=
 =?utf-8?B?K2xlay9KMitWWmRVT0kveXUwZGpFQit6bTlsVmRoQnlUS01VWmZYQ1FlclM1?=
 =?utf-8?B?ejBDU3YyR2trRk5XWk96NG5mdU9sNXBLeUhnQStlOFpobUFzZWxZSjlYci9l?=
 =?utf-8?B?T1hZVDcvNHJNYk1qNG9iZElqOUs4UVJGL2wvb09HN3BhNWxSeC9mR1lnNU43?=
 =?utf-8?B?ODRBVDdyWmg1bTM0STVlL2hETXFpV2ZPamdsbGxHSTRRQkdUbDNVYWhwMjFn?=
 =?utf-8?B?MW9ncFhHeVl6VEtFeUhtT2VuV3NPQ005WklsdlJUYnpHUndlc1JteGVxVlhH?=
 =?utf-8?B?K2NLeGlIYTJGWjlOMzlkUSs4UkFoYS9acjdqQW4yNEhjSXFPVWJGVnJYMnlr?=
 =?utf-8?B?ZExRaFZuWnhRY0Y3U2lXaTRIRmNqRlpXdnZub0RRemc5NUhhdFk4UktKdFlo?=
 =?utf-8?B?RXB5Z0JMQzJMalBlakVFd2JqS0FUdVdmR0JPcVU4SmRXY0dwMVpqYWNkOVpC?=
 =?utf-8?B?ZGVsR0RRNFIyL2NGemQrQjBvQnhzU0oxaGdtdEU0UUlkaE80NWZuTk9ydHox?=
 =?utf-8?B?NTlKUGdpNUs5RUpSd2tsdTlXS25Ncmt6eXBzcFdvSFJKcDI5Y2p3QjEzQXZN?=
 =?utf-8?B?OTVLM25lRjd3VUJZZXBFczA3MzgrWTdoTGxDS09vQXZNaGJFYkEzcTUrOXhX?=
 =?utf-8?B?cUwwcVRaMGMvaFBpZ0EyN2FHd2U0SHdkT3g2VlBSNW9wVTJKV01BM1lubXk3?=
 =?utf-8?B?VDBqakYyczRPM1VPTzc1RGhRMUdkS05jcWViMTRLcjB2MlRpUnNUZmNDWUQz?=
 =?utf-8?B?WFhFOEV3ZWEyQjU3Q0RwUFJwZm5WZnNsaythcWp0YldDclJ2UElvbFBzdWJa?=
 =?utf-8?B?OFRiU1hhZ2N3a0Z2ZnN4QlJ2UDNzQUp5WU1yWXd2OWwwS28zNitJRFVzRlAy?=
 =?utf-8?B?MTR0NHY2R0VxZm9TZ1N5dVB4bTE3TmlycnBwenJqNWVzSzNHZER3dzArOUY4?=
 =?utf-8?B?T2V0UzNEZWdpelBIcnFSNTg1dUY2ZXk1b29Dc0MraTI5SmQvODhlMVU2RDd0?=
 =?utf-8?B?QTVUbkZzNHNhQmQ5ZkIraFoxYXFkNXVRT1ZYd1dKMlRjK1liQ1dvVGViZzI0?=
 =?utf-8?B?UXRkait4VGVoVzdrWEphYzB2NXorMUhaMHZQREgyTit4U2UwWGxNOVFORFZs?=
 =?utf-8?Q?DSmbKl?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 02:39:47.5555 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c494a5a1-05f0-4962-8d3b-08ddf9814bf4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044FA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6273
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

Add eeprom ras functions.

V5:
  Remove duplicate data structure definition.

Signed-off-by: YiPeng Chai <YiPeng.Chai@amd.com>
Reviewed-by: Tao Zhou <tao.zhou1@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
---
 drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c | 1368 ++++++++++++++++++
 drivers/gpu/drm/amd/ras/rascore/ras_eeprom.h |  197 +++
 2 files changed, 1565 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_eeprom.h

diff --git a/drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c b/drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c
new file mode 100644
index 000000000000..9e0a4f605db0
--- /dev/null
+++ b/drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c
@@ -0,0 +1,1368 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2025 Advanced Micro Devices, Inc.
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
+#include "ras_eeprom.h"
+#include "ras.h"
+
+/* These are memory addresses as would be seen by one or more EEPROM
+ * chips strung on the I2C bus, usually by manipulating pins 1-3 of a
+ * set of EEPROM devices. They form a continuous memory space.
+ *
+ * The I2C device address includes the device type identifier, 1010b,
+ * which is a reserved value and indicates that this is an I2C EEPROM
+ * device. It also includes the top 3 bits of the 19 bit EEPROM memory
+ * address, namely bits 18, 17, and 16. This makes up the 7 bit
+ * address sent on the I2C bus with bit 0 being the direction bit,
+ * which is not represented here, and sent by the hardware directly.
+ *
+ * For instance,
+ *   50h = 1010000b => device type identifier 1010b, bits 18:16 = 000b, address 0.
+ *   54h = 1010100b => --"--, bits 18:16 = 100b, address 40000h.
+ *   56h = 1010110b => --"--, bits 18:16 = 110b, address 60000h.
+ * Depending on the size of the I2C EEPROM device(s), bits 18:16 may
+ * address memory in a device or a device on the I2C bus, depending on
+ * the status of pins 1-3.
+ *
+ * The RAS table lives either at address 0 or address 40000h of EEPROM.
+ */
+#define EEPROM_I2C_MADDR_0      0x0
+#define EEPROM_I2C_MADDR_4      0x40000
+
+#define EEPROM_PAGE_BITS   8
+#define EEPROM_PAGE_SIZE   (1U << EEPROM_PAGE_BITS)
+#define EEPROM_PAGE_MASK   (EEPROM_PAGE_SIZE - 1)
+
+#define EEPROM_OFFSET_SIZE 2
+#define MAKE_I2C_ADDR(_aa) ((0xA << 3) | (((_aa) >> 16) & 0xF))
+
+/*
+ * The 2 macros bellow represent the actual size in bytes that
+ * those entities occupy in the EEPROM memory.
+ * RAS_TABLE_RECORD_SIZE is different than sizeof(eeprom_umc_record) which
+ * uses uint64 to store 6b fields such as retired_page.
+ */
+#define RAS_TABLE_HEADER_SIZE   20
+#define RAS_TABLE_RECORD_SIZE   24
+
+/* Table hdr is 'AMDR' */
+#define RAS_TABLE_HDR_VAL       0x414d4452
+
+/* Bad GPU tag ‘BADG’ */
+#define RAS_TABLE_HDR_BAD       0x42414447
+
+/*
+ * EEPROM Table structure v1
+ * ---------------------------------
+ * |                               |
+ * |     EEPROM TABLE HEADER       |
+ * |      ( size 20 Bytes )        |
+ * |                               |
+ * ---------------------------------
+ * |                               |
+ * |    BAD PAGE RECORD AREA       |
+ * |                               |
+ * ---------------------------------
+ */
+
+/* Assume 2-Mbit size EEPROM and take up the whole space. */
+#define RAS_TBL_SIZE_BYTES      (256 * 1024)
+#define RAS_TABLE_START         0
+#define RAS_HDR_START           RAS_TABLE_START
+#define RAS_RECORD_START        (RAS_HDR_START + RAS_TABLE_HEADER_SIZE)
+#define RAS_MAX_RECORD_COUNT    ((RAS_TBL_SIZE_BYTES - RAS_TABLE_HEADER_SIZE) \
+				 / RAS_TABLE_RECORD_SIZE)
+
+/*
+ * EEPROM Table structrue v2.1
+ * ---------------------------------
+ * |                               |
+ * |     EEPROM TABLE HEADER       |
+ * |      ( size 20 Bytes )        |
+ * |                               |
+ * ---------------------------------
+ * |                               |
+ * |     EEPROM TABLE RAS INFO     |
+ * | (available info size 4 Bytes) |
+ * |  ( reserved size 252 Bytes )  |
+ * |                               |
+ * ---------------------------------
+ * |                               |
+ * |     BAD PAGE RECORD AREA      |
+ * |                               |
+ * ---------------------------------
+ */
+
+/* EEPROM Table V2_1 */
+#define RAS_TABLE_V2_1_INFO_SIZE       256
+#define RAS_TABLE_V2_1_INFO_START      RAS_TABLE_HEADER_SIZE
+#define RAS_RECORD_START_V2_1          (RAS_HDR_START + RAS_TABLE_HEADER_SIZE + \
+					RAS_TABLE_V2_1_INFO_SIZE)
+#define RAS_MAX_RECORD_COUNT_V2_1      ((RAS_TBL_SIZE_BYTES - RAS_TABLE_HEADER_SIZE - \
+					RAS_TABLE_V2_1_INFO_SIZE) \
+					/ RAS_TABLE_RECORD_SIZE)
+
+/* Given a zero-based index of an EEPROM RAS record, yields the EEPROM
+ * offset off of RAS_TABLE_START.  That is, this is something you can
+ * add to control->i2c_address, and then tell I2C layer to read
+ * from/write to there. _N is the so called absolute index,
+ * because it starts right after the table header.
+ */
+#define RAS_INDEX_TO_OFFSET(_C, _N) ((_C)->ras_record_offset + \
+				     (_N) * RAS_TABLE_RECORD_SIZE)
+
+#define RAS_OFFSET_TO_INDEX(_C, _O) (((_O) - \
+				      (_C)->ras_record_offset) / RAS_TABLE_RECORD_SIZE)
+
+/* Given a 0-based relative record index, 0, 1, 2, ..., etc., off
+ * of "fri", return the absolute record index off of the end of
+ * the table header.
+ */
+#define RAS_RI_TO_AI(_C, _I) (((_I) + (_C)->ras_fri) % \
+			      (_C)->ras_max_record_count)
+
+#define RAS_NUM_RECS(_tbl_hdr)  (((_tbl_hdr)->tbl_size - \
+				  RAS_TABLE_HEADER_SIZE) / RAS_TABLE_RECORD_SIZE)
+
+#define RAS_NUM_RECS_V2_1(_tbl_hdr)  (((_tbl_hdr)->tbl_size - \
+				       RAS_TABLE_HEADER_SIZE - \
+				       RAS_TABLE_V2_1_INFO_SIZE) / RAS_TABLE_RECORD_SIZE)
+
+#define to_ras_core_context(x) (container_of(x, struct ras_core_context, ras_eeprom))
+
+static bool __is_ras_eeprom_supported(struct ras_core_context *ras_core)
+{
+	return ras_core->ras_eeprom_supported;
+}
+
+static bool __get_eeprom_i2c_addr(struct ras_core_context *ras_core,
+				  struct ras_eeprom_control *control)
+{
+	int ret = -EINVAL;
+
+	if (control->sys_func &&
+		control->sys_func->update_eeprom_i2c_config)
+		ret = control->sys_func->update_eeprom_i2c_config(ras_core);
+	else
+		RAS_DEV_WARN(ras_core->dev,
+			"No eeprom i2c system config!\n");
+
+	return !ret ? true : false;
+}
+
+static int __ras_eeprom_xfer(struct ras_core_context *ras_core, u32 eeprom_addr,
+				u8 *eeprom_buf, u32 buf_size, bool read)
+{
+	struct ras_eeprom_control *control = &ras_core->ras_eeprom;
+	int ret;
+
+	if (control->sys_func && control->sys_func->eeprom_i2c_xfer) {
+		ret = control->sys_func->eeprom_i2c_xfer(ras_core,
+				eeprom_addr, eeprom_buf, buf_size, read);
+
+		if ((ret > 0) && !read) {
+			/* According to EEPROM specs the length of the
+			 * self-writing cycle, tWR (tW), is 10 ms.
+			 *
+			 * TODO: Use polling on ACK, aka Acknowledge
+			 * Polling, to minimize waiting for the
+			 * internal write cycle to complete, as it is
+			 * usually smaller than tWR (tW).
+			 */
+			msleep(10);
+		}
+
+		return ret;
+	}
+
+	RAS_DEV_ERR(ras_core->dev, "Error: No eeprom i2c system xfer function!\n");
+	return -EINVAL;
+}
+
+
+/**
+ * __eeprom_xfer -- Read/write from/to an I2C EEPROM device
+ * @i2c_adap: pointer to the I2C adapter to use
+ * @eeprom_addr: EEPROM address from which to read/write
+ * @eeprom_buf: pointer to data buffer to read into/write from
+ * @buf_size: the size of @eeprom_buf
+ * @read: True if reading from the EEPROM, false if writing
+ *
+ * Returns the number of bytes read/written; -errno on error.
+ */
+static int __eeprom_xfer(struct ras_core_context *ras_core, u32 eeprom_addr,
+			      u8 *eeprom_buf, u32 buf_size, bool read)
+{
+	u16 limit;
+	u16 ps; /* Partial size */
+	int res = 0, r;
+
+	if (read)
+		limit = ras_core->ras_eeprom.max_read_len;
+	else
+		limit = ras_core->ras_eeprom.max_write_len;
+
+	if (limit && (limit <= EEPROM_OFFSET_SIZE)) {
+		RAS_DEV_ERR(ras_core->dev,
+				"maddr:0x%04X size:0x%02X:quirk max_%s_len must be > %d",
+				eeprom_addr, buf_size,
+				read ? "read" : "write", EEPROM_OFFSET_SIZE);
+		return -EINVAL;
+	}
+
+	ras_core_down_gpu_reset_lock(ras_core);
+
+	if (limit == 0) {
+		res = __ras_eeprom_xfer(ras_core, eeprom_addr,
+					eeprom_buf, buf_size, read);
+	} else {
+		/* The "limit" includes all data bytes sent/received,
+		 * which would include the EEPROM_OFFSET_SIZE bytes.
+		 * Account for them here.
+		 */
+		limit -= EEPROM_OFFSET_SIZE;
+		for ( ; buf_size > 0;
+			buf_size -= ps, eeprom_addr += ps, eeprom_buf += ps) {
+			ps = (buf_size < limit) ? buf_size : limit;
+
+			r = __ras_eeprom_xfer(ras_core, eeprom_addr,
+						eeprom_buf, ps, read);
+			if (r < 0)
+				break;
+
+			res += r;
+		}
+	}
+
+	ras_core_up_gpu_reset_lock(ras_core);
+
+	return res;
+}
+
+static int __eeprom_read(struct ras_core_context *ras_core,
+			      u32 eeprom_addr, u8 *eeprom_buf, u32 bytes)
+{
+	return __eeprom_xfer(ras_core, eeprom_addr,
+			   eeprom_buf, bytes, true);
+}
+
+static int __eeprom_write(struct ras_core_context *ras_core,
+			       u32 eeprom_addr, u8 *eeprom_buf, u32 bytes)
+{
+	return __eeprom_xfer(ras_core, eeprom_addr,
+			   eeprom_buf, bytes, false);
+}
+
+static void
+__encode_table_header_to_buf(struct ras_eeprom_table_header *hdr,
+			     unsigned char *buf)
+{
+	u32 *pp = (uint32_t *)buf;
+
+	pp[0] = cpu_to_le32(hdr->header);
+	pp[1] = cpu_to_le32(hdr->version);
+	pp[2] = cpu_to_le32(hdr->first_rec_offset);
+	pp[3] = cpu_to_le32(hdr->tbl_size);
+	pp[4] = cpu_to_le32(hdr->checksum);
+}
+
+static void
+__decode_table_header_from_buf(struct ras_eeprom_table_header *hdr,
+			       unsigned char *buf)
+{
+	u32 *pp = (uint32_t *)buf;
+
+	hdr->header	      = le32_to_cpu(pp[0]);
+	hdr->version	      = le32_to_cpu(pp[1]);
+	hdr->first_rec_offset = le32_to_cpu(pp[2]);
+	hdr->tbl_size	      = le32_to_cpu(pp[3]);
+	hdr->checksum	      = le32_to_cpu(pp[4]);
+}
+
+static int __write_table_header(struct ras_eeprom_control *control)
+{
+	u8 buf[RAS_TABLE_HEADER_SIZE];
+	struct ras_core_context *ras_core = to_ras_core_context(control);
+	int res;
+
+	memset(buf, 0, sizeof(buf));
+	__encode_table_header_to_buf(&control->tbl_hdr, buf);
+
+	/* i2c may be unstable in gpu reset */
+	res = __eeprom_write(ras_core,
+				  control->i2c_address +
+				  control->ras_header_offset,
+				  buf, RAS_TABLE_HEADER_SIZE);
+
+	if (res < 0) {
+		RAS_DEV_ERR(ras_core->dev,
+			"Failed to write EEPROM table header:%d\n", res);
+	} else if (res < RAS_TABLE_HEADER_SIZE) {
+		RAS_DEV_ERR(ras_core->dev,
+			"Short write:%d out of %d\n", res, RAS_TABLE_HEADER_SIZE);
+		res = -EIO;
+	} else {
+		res = 0;
+	}
+
+	return res;
+}
+
+static void
+__encode_table_ras_info_to_buf(struct ras_eeprom_table_ras_info *rai,
+			       unsigned char *buf)
+{
+	u32 *pp = (uint32_t *)buf;
+	u32 tmp;
+
+	tmp = ((uint32_t)(rai->rma_status) & 0xFF) |
+	      (((uint32_t)(rai->health_percent) << 8) & 0xFF00) |
+	      (((uint32_t)(rai->ecc_page_threshold) << 16) & 0xFFFF0000);
+	pp[0] = cpu_to_le32(tmp);
+}
+
+static void
+__decode_table_ras_info_from_buf(struct ras_eeprom_table_ras_info *rai,
+				 unsigned char *buf)
+{
+	u32 *pp = (uint32_t *)buf;
+	u32 tmp;
+
+	tmp = le32_to_cpu(pp[0]);
+	rai->rma_status = tmp & 0xFF;
+	rai->health_percent = (tmp >> 8) & 0xFF;
+	rai->ecc_page_threshold = (tmp >> 16) & 0xFFFF;
+}
+
+static int __write_table_ras_info(struct ras_eeprom_control *control)
+{
+	struct ras_core_context *ras_core = to_ras_core_context(control);
+	u8 *buf;
+	int res;
+
+	buf = kzalloc(RAS_TABLE_V2_1_INFO_SIZE, GFP_KERNEL);
+	if (!buf) {
+		RAS_DEV_ERR(ras_core->dev,
+			"Failed to alloc buf to write table ras info\n");
+		return -ENOMEM;
+	}
+
+	__encode_table_ras_info_to_buf(&control->tbl_rai, buf);
+
+	/* i2c may be unstable in gpu reset */
+	res = __eeprom_write(ras_core,
+				  control->i2c_address +
+				  control->ras_info_offset,
+				  buf, RAS_TABLE_V2_1_INFO_SIZE);
+
+	if (res < 0) {
+		RAS_DEV_ERR(ras_core->dev,
+			"Failed to write EEPROM table ras info:%d\n", res);
+	} else if (res < RAS_TABLE_V2_1_INFO_SIZE) {
+		RAS_DEV_ERR(ras_core->dev,
+			"Short write:%d out of %d\n", res, RAS_TABLE_V2_1_INFO_SIZE);
+		res = -EIO;
+	} else {
+		res = 0;
+	}
+
+	kfree(buf);
+
+	return res;
+}
+
+static u8 __calc_hdr_byte_sum(const struct ras_eeprom_control *control)
+{
+	int ii;
+	u8  *pp, csum;
+	u32 sz;
+
+	/* Header checksum, skip checksum field in the calculation */
+	sz = sizeof(control->tbl_hdr) - sizeof(control->tbl_hdr.checksum);
+	pp = (u8 *) &control->tbl_hdr;
+	csum = 0;
+	for (ii = 0; ii < sz; ii++, pp++)
+		csum += *pp;
+
+	return csum;
+}
+
+static u8 __calc_ras_info_byte_sum(const struct ras_eeprom_control *control)
+{
+	int ii;
+	u8  *pp, csum;
+	u32 sz;
+
+	sz = sizeof(control->tbl_rai);
+	pp = (u8 *) &control->tbl_rai;
+	csum = 0;
+	for (ii = 0; ii < sz; ii++, pp++)
+		csum += *pp;
+
+	return csum;
+}
+
+static int ras_eeprom_correct_header_tag(
+	struct ras_eeprom_control *control,
+	uint32_t header)
+{
+	struct ras_eeprom_table_header *hdr = &control->tbl_hdr;
+	u8 *hh;
+	int res;
+	u8 csum;
+
+	csum = -hdr->checksum;
+
+	hh = (void *) &hdr->header;
+	csum -= (hh[0] + hh[1] + hh[2] + hh[3]);
+	hh = (void *) &header;
+	csum += hh[0] + hh[1] + hh[2] + hh[3];
+	csum = -csum;
+	mutex_lock(&control->ras_tbl_mutex);
+	hdr->header = header;
+	hdr->checksum = csum;
+	res = __write_table_header(control);
+	mutex_unlock(&control->ras_tbl_mutex);
+
+	return res;
+}
+
+static void ras_set_eeprom_table_version(struct ras_eeprom_control *control)
+{
+	struct ras_eeprom_table_header *hdr = &control->tbl_hdr;
+
+	hdr->version = RAS_TABLE_VER_V3;
+}
+
+/**
+ * ras_eeprom_reset_table -- Reset the RAS EEPROM table
+ * @control: pointer to control structure
+ *
+ * Reset the contents of the header of the RAS EEPROM table.
+ * Return 0 on success, -errno on error.
+ */
+int ras_eeprom_reset_table(struct ras_core_context *ras_core)
+{
+	struct ras_eeprom_control *control = &ras_core->ras_eeprom;
+	struct ras_eeprom_table_header *hdr = &control->tbl_hdr;
+	struct ras_eeprom_table_ras_info *rai = &control->tbl_rai;
+	u8 csum;
+	int res;
+
+	mutex_lock(&control->ras_tbl_mutex);
+
+	hdr->header = RAS_TABLE_HDR_VAL;
+	ras_set_eeprom_table_version(control);
+
+	if (hdr->version >= RAS_TABLE_VER_V2_1) {
+		hdr->first_rec_offset = RAS_RECORD_START_V2_1;
+		hdr->tbl_size = RAS_TABLE_HEADER_SIZE +
+				RAS_TABLE_V2_1_INFO_SIZE;
+		rai->rma_status = RAS_GPU_HEALTH_USABLE;
+		/**
+		 * GPU health represented as a percentage.
+		 * 0 means worst health, 100 means fully health.
+		 */
+		rai->health_percent = 100;
+		/* ecc_page_threshold = 0 means disable bad page retirement */
+		rai->ecc_page_threshold = control->record_threshold_count;
+	} else {
+		hdr->first_rec_offset = RAS_RECORD_START;
+		hdr->tbl_size = RAS_TABLE_HEADER_SIZE;
+	}
+
+	csum = __calc_hdr_byte_sum(control);
+	if (hdr->version >= RAS_TABLE_VER_V2_1)
+		csum += __calc_ras_info_byte_sum(control);
+	csum = -csum;
+	hdr->checksum = csum;
+	res = __write_table_header(control);
+	if (!res && hdr->version > RAS_TABLE_VER_V1)
+		res = __write_table_ras_info(control);
+
+	control->ras_num_recs = 0;
+	control->ras_fri = 0;
+
+	control->bad_channel_bitmap = 0;
+	ras_core_event_notify(ras_core, RAS_EVENT_ID__UPDATE_BAD_PAGE_NUM,
+		&control->ras_num_recs);
+	ras_core_event_notify(ras_core, RAS_EVENT_ID__UPDATE_BAD_CHANNEL_BITMAP,
+		&control->bad_channel_bitmap);
+	control->update_channel_flag = false;
+
+	mutex_unlock(&control->ras_tbl_mutex);
+
+	return res;
+}
+
+static void
+__encode_table_record_to_buf(struct ras_eeprom_control *control,
+			     struct eeprom_umc_record *record,
+			     unsigned char *buf)
+{
+	__le64 tmp = 0;
+	int i = 0;
+
+	/* Next are all record fields according to EEPROM page spec in LE foramt */
+	buf[i++] = record->err_type;
+
+	buf[i++] = record->bank;
+
+	tmp = cpu_to_le64(record->ts);
+	memcpy(buf + i, &tmp, 8);
+	i += 8;
+
+	tmp = cpu_to_le64((record->offset & 0xffffffffffff));
+	memcpy(buf + i, &tmp, 6);
+	i += 6;
+
+	buf[i++] = record->mem_channel;
+	buf[i++] = record->mcumc_id;
+
+	tmp = cpu_to_le64((record->retired_row_pfn & 0xffffffffffff));
+	memcpy(buf + i, &tmp, 6);
+}
+
+static void
+__decode_table_record_from_buf(struct ras_eeprom_control *control,
+			       struct eeprom_umc_record *record,
+			       unsigned char *buf)
+{
+	__le64 tmp = 0;
+	int i =  0;
+
+	/* Next are all record fields according to EEPROM page spec in LE foramt */
+	record->err_type = buf[i++];
+
+	record->bank = buf[i++];
+
+	memcpy(&tmp, buf + i, 8);
+	record->ts = le64_to_cpu(tmp);
+	i += 8;
+
+	memcpy(&tmp, buf + i, 6);
+	record->offset = (le64_to_cpu(tmp) & 0xffffffffffff);
+	i += 6;
+
+	record->mem_channel = buf[i++];
+	record->mcumc_id = buf[i++];
+
+	memcpy(&tmp, buf + i,  6);
+	record->retired_row_pfn = (le64_to_cpu(tmp) & 0xffffffffffff);
+}
+
+bool ras_eeprom_check_safety_watermark(struct ras_core_context *ras_core)
+{
+	struct ras_eeprom_control *control = &ras_core->ras_eeprom;
+	bool ret = false;
+	int bad_page_count;
+
+	if (!__is_ras_eeprom_supported(ras_core) ||
+	    !control->record_threshold_config)
+		return false;
+
+	bad_page_count = ras_umc_get_badpage_count(ras_core);
+	if (control->tbl_hdr.header == RAS_TABLE_HDR_BAD) {
+		if (bad_page_count > control->record_threshold_count)
+			RAS_DEV_WARN(ras_core->dev, "RAS records:%d exceed threshold:%d",
+				bad_page_count, control->record_threshold_count);
+
+		if ((control->record_threshold_config == WARN_NONSTOP_OVER_THRESHOLD) ||
+			(control->record_threshold_config == NONSTOP_OVER_THRESHOLD)) {
+			RAS_DEV_WARN(ras_core->dev,
+				"Please consult AMD Service Action Guide (SAG) for appropriate service procedures.\n");
+			ret = false;
+		} else {
+			ras_core->is_rma = true;
+			RAS_DEV_WARN(ras_core->dev,
+				"Please consider adjusting the customized threshold.\n");
+			ret = true;
+		}
+	}
+
+	return ret;
+}
+
+/**
+ * __ras_eeprom_write -- write indexed from buffer to EEPROM
+ * @control: pointer to control structure
+ * @buf: pointer to buffer containing data to write
+ * @fri: start writing at this index
+ * @num: number of records to write
+ *
+ * The caller must hold the table mutex in @control.
+ * Return 0 on success, -errno otherwise.
+ */
+static int __ras_eeprom_write(struct ras_eeprom_control *control,
+			      u8 *buf, const u32 fri, const u32 num)
+{
+	struct ras_core_context *ras_core = to_ras_core_context(control);
+	u32 buf_size;
+	int res;
+
+	/* i2c may be unstable in gpu reset */
+	buf_size = num * RAS_TABLE_RECORD_SIZE;
+	res = __eeprom_write(ras_core,
+			       control->i2c_address + RAS_INDEX_TO_OFFSET(control, fri),
+			       buf, buf_size);
+	if (res < 0) {
+		RAS_DEV_ERR(ras_core->dev,
+			"Writing %d EEPROM table records error:%d\n", num, res);
+	} else if (res < buf_size) {
+		/* Short write, return error.*/
+		RAS_DEV_ERR(ras_core->dev,
+			"Wrote %d records out of %d\n",
+			(res/RAS_TABLE_RECORD_SIZE), num);
+		res = -EIO;
+	} else {
+		res = 0;
+	}
+
+	return res;
+}
+
+static int ras_eeprom_append_table(struct ras_eeprom_control *control,
+				   struct eeprom_umc_record *record,
+				   const u32 num)
+{
+	u32 a, b, i;
+	u8 *buf, *pp;
+	int res;
+
+	buf = kcalloc(num, RAS_TABLE_RECORD_SIZE, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	/* Encode all of them in one go.
+	 */
+	pp = buf;
+	for (i = 0; i < num; i++, pp += RAS_TABLE_RECORD_SIZE) {
+		__encode_table_record_to_buf(control, &record[i], pp);
+
+		/* update bad channel bitmap */
+		if ((record[i].mem_channel < BITS_PER_TYPE(control->bad_channel_bitmap)) &&
+		    !(control->bad_channel_bitmap & (1 << record[i].mem_channel))) {
+			control->bad_channel_bitmap |= 1 << record[i].mem_channel;
+			control->update_channel_flag = true;
+		}
+	}
+
+	/* a, first record index to write into.
+	 * b, last record index to write into.
+	 * a = first index to read (fri) + number of records in the table,
+	 * b = a + @num - 1.
+	 * Let N = control->ras_max_num_record_count, then we have,
+	 * case 0: 0 <= a <= b < N,
+	 *   just append @num records starting at a;
+	 * case 1: 0 <= a < N <= b,
+	 *   append (N - a) records starting at a, and
+	 *   append the remainder,  b % N + 1, starting at 0.
+	 * case 2: 0 <= fri < N <= a <= b, then modulo N we get two subcases,
+	 * case 2a: 0 <= a <= b < N
+	 *   append num records starting at a; and fix fri if b overwrote it,
+	 *   and since a <= b, if b overwrote it then a must've also,
+	 *   and if b didn't overwrite it, then a didn't also.
+	 * case 2b: 0 <= b < a < N
+	 *   write num records starting at a, which wraps around 0=N
+	 *   and overwrite fri unconditionally. Now from case 2a,
+	 *   this means that b eclipsed fri to overwrite it and wrap
+	 *   around 0 again, i.e. b = 2N+r pre modulo N, so we unconditionally
+	 *   set fri = b + 1 (mod N).
+	 * Now, since fri is updated in every case, except the trivial case 0,
+	 * the number of records present in the table after writing, is,
+	 * num_recs - 1 = b - fri (mod N), and we take the positive value,
+	 * by adding an arbitrary multiple of N before taking the modulo N
+	 * as shown below.
+	 */
+	a = control->ras_fri + control->ras_num_recs;
+	b = a + num  - 1;
+	if (b < control->ras_max_record_count) {
+		res = __ras_eeprom_write(control, buf, a, num);
+	} else if (a < control->ras_max_record_count) {
+		u32 g0, g1;
+
+		g0 = control->ras_max_record_count - a;
+		g1 = b % control->ras_max_record_count + 1;
+		res = __ras_eeprom_write(control, buf, a, g0);
+		if (res)
+			goto Out;
+		res = __ras_eeprom_write(control,
+						buf + g0 * RAS_TABLE_RECORD_SIZE,
+						0, g1);
+		if (res)
+			goto Out;
+		if (g1 > control->ras_fri)
+			control->ras_fri = g1 % control->ras_max_record_count;
+	} else {
+		a %= control->ras_max_record_count;
+		b %= control->ras_max_record_count;
+
+		if (a <= b) {
+			/* Note that, b - a + 1 = num. */
+			res = __ras_eeprom_write(control, buf, a, num);
+			if (res)
+				goto Out;
+			if (b >= control->ras_fri)
+				control->ras_fri = (b + 1) % control->ras_max_record_count;
+		} else {
+			u32 g0, g1;
+
+			/* b < a, which means, we write from
+			 * a to the end of the table, and from
+			 * the start of the table to b.
+			 */
+			g0 = control->ras_max_record_count - a;
+			g1 = b + 1;
+			res = __ras_eeprom_write(control, buf, a, g0);
+			if (res)
+				goto Out;
+			res = __ras_eeprom_write(control,
+						 buf + g0 * RAS_TABLE_RECORD_SIZE, 0, g1);
+			if (res)
+				goto Out;
+			control->ras_fri = g1 % control->ras_max_record_count;
+		}
+	}
+	control->ras_num_recs = 1 +
+		(control->ras_max_record_count + b - control->ras_fri)
+		% control->ras_max_record_count;
+Out:
+	kfree(buf);
+	return res;
+}
+
+static int ras_eeprom_update_header(struct ras_eeprom_control *control)
+{
+	struct ras_core_context *ras_core = to_ras_core_context(control);
+	int threshold_config = control->record_threshold_config;
+	u8 *buf, *pp, csum;
+	u32 buf_size;
+	int bad_page_count;
+	int res;
+
+	bad_page_count = ras_umc_get_badpage_count(ras_core);
+	/* Modify the header if it exceeds.
+	 */
+	if (threshold_config != 0 &&
+		bad_page_count > control->record_threshold_count) {
+		RAS_DEV_WARN(ras_core->dev,
+			"Saved bad pages %d reaches threshold value %d\n",
+			bad_page_count, control->record_threshold_count);
+		control->tbl_hdr.header = RAS_TABLE_HDR_BAD;
+		if (control->tbl_hdr.version >= RAS_TABLE_VER_V2_1) {
+			control->tbl_rai.rma_status = RAS_GPU_RETIRED__ECC_REACH_THRESHOLD;
+			control->tbl_rai.health_percent = 0;
+		}
+
+		if ((threshold_config != WARN_NONSTOP_OVER_THRESHOLD) &&
+			(threshold_config != NONSTOP_OVER_THRESHOLD))
+			ras_core->is_rma = true;
+
+		/* ignore the -ENOTSUPP return value */
+		ras_core_event_notify(ras_core, RAS_EVENT_ID__DEVICE_RMA, NULL);
+	}
+
+	if (control->tbl_hdr.version >= RAS_TABLE_VER_V2_1)
+		control->tbl_hdr.tbl_size = RAS_TABLE_HEADER_SIZE +
+					    RAS_TABLE_V2_1_INFO_SIZE +
+					    control->ras_num_recs * RAS_TABLE_RECORD_SIZE;
+	else
+		control->tbl_hdr.tbl_size = RAS_TABLE_HEADER_SIZE +
+					    control->ras_num_recs * RAS_TABLE_RECORD_SIZE;
+	control->tbl_hdr.checksum = 0;
+
+	buf_size = control->ras_num_recs * RAS_TABLE_RECORD_SIZE;
+	buf = kcalloc(control->ras_num_recs, RAS_TABLE_RECORD_SIZE, GFP_KERNEL);
+	if (!buf) {
+		RAS_DEV_ERR(ras_core->dev,
+			"allocating memory for table of size %d bytes failed\n",
+			control->tbl_hdr.tbl_size);
+		res = -ENOMEM;
+		goto Out;
+	}
+
+	res = __eeprom_read(ras_core,
+			      control->i2c_address +
+			      control->ras_record_offset,
+			      buf, buf_size);
+	if (res < 0) {
+		RAS_DEV_ERR(ras_core->dev,
+			"EEPROM failed reading records:%d\n", res);
+		goto Out;
+	} else if (res < buf_size) {
+		RAS_DEV_ERR(ras_core->dev,
+			"EEPROM read %d out of %d bytes\n", res, buf_size);
+		res = -EIO;
+		goto Out;
+	}
+
+	/**
+	 * bad page records have been stored in eeprom,
+	 * now calculate gpu health percent
+	 */
+	if (threshold_config != 0 &&
+	    control->tbl_hdr.version >= RAS_TABLE_VER_V2_1 &&
+	    bad_page_count <= control->record_threshold_count)
+		control->tbl_rai.health_percent = ((control->record_threshold_count -
+			bad_page_count) * 100) / control->record_threshold_count;
+
+	/* Recalc the checksum.
+	 */
+	csum = 0;
+	for (pp = buf; pp < buf + buf_size; pp++)
+		csum += *pp;
+
+	csum += __calc_hdr_byte_sum(control);
+	if (control->tbl_hdr.version >= RAS_TABLE_VER_V2_1)
+		csum += __calc_ras_info_byte_sum(control);
+	/* avoid sign extension when assigning to "checksum" */
+	csum = -csum;
+	control->tbl_hdr.checksum = csum;
+	res = __write_table_header(control);
+	if (!res && control->tbl_hdr.version > RAS_TABLE_VER_V1)
+		res = __write_table_ras_info(control);
+Out:
+	kfree(buf);
+	return res;
+}
+
+/**
+ * ras_core_eeprom_append -- append records to the EEPROM RAS table
+ * @control: pointer to control structure
+ * @record: array of records to append
+ * @num: number of records in @record array
+ *
+ * Append @num records to the table, calculate the checksum and write
+ * the table back to EEPROM. The maximum number of records that
+ * can be appended is between 1 and control->ras_max_record_count,
+ * regardless of how many records are already stored in the table.
+ *
+ * Return 0 on success or if EEPROM is not supported, -errno on error.
+ */
+int ras_eeprom_append(struct ras_core_context *ras_core,
+			   struct eeprom_umc_record *record, const u32 num)
+{
+	struct ras_eeprom_control *control = &ras_core->ras_eeprom;
+	int res;
+
+	if (!__is_ras_eeprom_supported(ras_core))
+		return 0;
+
+	if (num == 0) {
+		RAS_DEV_ERR(ras_core->dev, "will not append 0 records\n");
+		return -EINVAL;
+	} else if ((num + control->ras_num_recs) > control->ras_max_record_count) {
+		RAS_DEV_ERR(ras_core->dev,
+			"cannot append %d records than the size of table %d\n",
+			num, control->ras_max_record_count);
+		return -EINVAL;
+	}
+
+	mutex_lock(&control->ras_tbl_mutex);
+	res = ras_eeprom_append_table(control, record, num);
+	if (!res)
+		res = ras_eeprom_update_header(control);
+
+	mutex_unlock(&control->ras_tbl_mutex);
+
+	return res;
+}
+
+/**
+ * __ras_eeprom_read -- read indexed from EEPROM into buffer
+ * @control: pointer to control structure
+ * @buf: pointer to buffer to read into
+ * @fri: first record index, start reading at this index, absolute index
+ * @num: number of records to read
+ *
+ * The caller must hold the table mutex in @control.
+ * Return 0 on success, -errno otherwise.
+ */
+static int __ras_eeprom_read(struct ras_eeprom_control *control,
+			     u8 *buf, const u32 fri, const u32 num)
+{
+	struct ras_core_context *ras_core = to_ras_core_context(control);
+	u32 buf_size;
+	int res;
+
+	/* i2c may be unstable in gpu reset */
+	buf_size = num * RAS_TABLE_RECORD_SIZE;
+	res = __eeprom_read(ras_core,
+			      control->i2c_address +
+			      RAS_INDEX_TO_OFFSET(control, fri),
+			      buf, buf_size);
+	if (res < 0) {
+		RAS_DEV_ERR(ras_core->dev,
+			"Reading %d EEPROM table records error:%d\n", num, res);
+	} else if (res < buf_size) {
+		/* Short read, return error.
+		 */
+		RAS_DEV_ERR(ras_core->dev,
+			"Read %d records out of %d\n",
+			(res/RAS_TABLE_RECORD_SIZE), num);
+		res = -EIO;
+	} else {
+		res = 0;
+	}
+
+	return res;
+}
+
+/**
+ * ras_eeprom_read -- read EEPROM
+ * @control: pointer to control structure
+ * @record: array of records to read into
+ * @num: number of records in @record
+ *
+ * Reads num records from the RAS table in EEPROM and
+ * writes the data into @record array.
+ *
+ * Returns 0 on success, -errno on error.
+ */
+int ras_eeprom_read(struct ras_core_context *ras_core,
+			 struct eeprom_umc_record *record, const u32 num)
+{
+	struct ras_eeprom_control *control = &ras_core->ras_eeprom;
+	int i, res;
+	u8 *buf, *pp;
+	u32 g0, g1;
+
+	if (!__is_ras_eeprom_supported(ras_core))
+		return 0;
+
+	if (num == 0) {
+		RAS_DEV_ERR(ras_core->dev, "will not read 0 records\n");
+		return -EINVAL;
+	} else if (num > control->ras_num_recs) {
+		RAS_DEV_ERR(ras_core->dev,
+			"too many records to read:%d available:%d\n",
+			num, control->ras_num_recs);
+		return -EINVAL;
+	}
+
+	buf = kcalloc(num, RAS_TABLE_RECORD_SIZE, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	/* Determine how many records to read, from the first record
+	 * index, fri, to the end of the table, and from the beginning
+	 * of the table, such that the total number of records is
+	 * @num, and we handle wrap around when fri > 0 and
+	 * fri + num > RAS_MAX_RECORD_COUNT.
+	 *
+	 * First we compute the index of the last element
+	 * which would be fetched from each region,
+	 * g0 is in [fri, fri + num - 1], and
+	 * g1 is in [0, RAS_MAX_RECORD_COUNT - 1].
+	 * Then, if g0 < RAS_MAX_RECORD_COUNT, the index of
+	 * the last element to fetch, we set g0 to _the number_
+	 * of elements to fetch, @num, since we know that the last
+	 * indexed to be fetched does not exceed the table.
+	 *
+	 * If, however, g0 >= RAS_MAX_RECORD_COUNT, then
+	 * we set g0 to the number of elements to read
+	 * until the end of the table, and g1 to the number of
+	 * elements to read from the beginning of the table.
+	 */
+	g0 = control->ras_fri + num - 1;
+	g1 = g0 % control->ras_max_record_count;
+	if (g0 < control->ras_max_record_count) {
+		g0 = num;
+		g1 = 0;
+	} else {
+		g0 = control->ras_max_record_count - control->ras_fri;
+		g1 += 1;
+	}
+
+	mutex_lock(&control->ras_tbl_mutex);
+	res = __ras_eeprom_read(control, buf, control->ras_fri, g0);
+	if (res)
+		goto Out;
+	if (g1) {
+		res = __ras_eeprom_read(control,
+					buf + g0 * RAS_TABLE_RECORD_SIZE, 0, g1);
+		if (res)
+			goto Out;
+	}
+
+	res = 0;
+
+	/* Read up everything? Then transform.
+	 */
+	pp = buf;
+	for (i = 0; i < num; i++, pp += RAS_TABLE_RECORD_SIZE) {
+		__decode_table_record_from_buf(control, &record[i], pp);
+
+		/* update bad channel bitmap */
+		if ((record[i].mem_channel < BITS_PER_TYPE(control->bad_channel_bitmap)) &&
+		    !(control->bad_channel_bitmap & (1 << record[i].mem_channel))) {
+			control->bad_channel_bitmap |= 1 << record[i].mem_channel;
+			control->update_channel_flag = true;
+		}
+	}
+Out:
+	kfree(buf);
+	mutex_unlock(&control->ras_tbl_mutex);
+
+	return res;
+}
+
+uint32_t ras_eeprom_max_record_count(struct ras_core_context *ras_core)
+{
+	struct ras_eeprom_control *control = &ras_core->ras_eeprom;
+
+	/* get available eeprom table version first before eeprom table init */
+	ras_set_eeprom_table_version(control);
+
+	if (control->tbl_hdr.version >= RAS_TABLE_VER_V2_1)
+		return RAS_MAX_RECORD_COUNT_V2_1;
+	else
+		return RAS_MAX_RECORD_COUNT;
+}
+
+/**
+ * __verify_ras_table_checksum -- verify the RAS EEPROM table checksum
+ * @control: pointer to control structure
+ *
+ * Check the checksum of the stored in EEPROM RAS table.
+ *
+ * Return 0 if the checksum is correct,
+ * positive if it is not correct, and
+ * -errno on I/O error.
+ */
+static int __verify_ras_table_checksum(struct ras_eeprom_control *control)
+{
+	struct ras_core_context *ras_core = to_ras_core_context(control);
+	int buf_size, res;
+	u8  csum, *buf, *pp;
+
+	if (control->tbl_hdr.version >= RAS_TABLE_VER_V2_1)
+		buf_size = RAS_TABLE_HEADER_SIZE +
+			   RAS_TABLE_V2_1_INFO_SIZE +
+			   control->ras_num_recs * RAS_TABLE_RECORD_SIZE;
+	else
+		buf_size = RAS_TABLE_HEADER_SIZE +
+			   control->ras_num_recs * RAS_TABLE_RECORD_SIZE;
+
+	buf = kzalloc(buf_size, GFP_KERNEL);
+	if (!buf) {
+		RAS_DEV_ERR(ras_core->dev,
+			"Out of memory checking RAS table checksum.\n");
+		return -ENOMEM;
+	}
+
+	res = __eeprom_read(ras_core,
+				 control->i2c_address +
+				 control->ras_header_offset,
+				 buf, buf_size);
+	if (res < buf_size) {
+		RAS_DEV_ERR(ras_core->dev,
+			"Partial read for checksum, res:%d\n", res);
+		/* On partial reads, return -EIO.
+		 */
+		if (res >= 0)
+			res = -EIO;
+		goto Out;
+	}
+
+	csum = 0;
+	for (pp = buf; pp < buf + buf_size; pp++)
+		csum += *pp;
+Out:
+	kfree(buf);
+	return res < 0 ? res : csum;
+}
+
+static int __read_table_ras_info(struct ras_eeprom_control *control)
+{
+	struct ras_eeprom_table_ras_info *rai = &control->tbl_rai;
+	struct ras_core_context *ras_core = to_ras_core_context(control);
+	unsigned char *buf;
+	int res;
+
+	buf = kzalloc(RAS_TABLE_V2_1_INFO_SIZE, GFP_KERNEL);
+	if (!buf) {
+		RAS_DEV_ERR(ras_core->dev,
+			"Failed to alloc buf to read EEPROM table ras info\n");
+		return -ENOMEM;
+	}
+
+	/**
+	 * EEPROM table V2_1 supports ras info,
+	 * read EEPROM table ras info
+	 */
+	res = __eeprom_read(ras_core,
+			      control->i2c_address + control->ras_info_offset,
+			      buf, RAS_TABLE_V2_1_INFO_SIZE);
+	if (res < RAS_TABLE_V2_1_INFO_SIZE) {
+		RAS_DEV_ERR(ras_core->dev,
+			"Failed to read EEPROM table ras info, res:%d\n", res);
+		res = res >= 0 ? -EIO : res;
+		goto Out;
+	}
+
+	__decode_table_ras_info_from_buf(rai, buf);
+
+Out:
+	kfree(buf);
+	return res == RAS_TABLE_V2_1_INFO_SIZE ? 0 : res;
+}
+
+static int __check_ras_table_status(struct ras_core_context *ras_core)
+{
+	struct ras_eeprom_control *control = &ras_core->ras_eeprom;
+	unsigned char buf[RAS_TABLE_HEADER_SIZE] = { 0 };
+	struct ras_eeprom_table_header *hdr;
+	int res;
+
+	hdr = &control->tbl_hdr;
+
+	if (!__is_ras_eeprom_supported(ras_core))
+		return 0;
+
+	if (!__get_eeprom_i2c_addr(ras_core, control))
+		return -EINVAL;
+
+	control->ras_header_offset = RAS_HDR_START;
+	control->ras_info_offset = RAS_TABLE_V2_1_INFO_START;
+	mutex_init(&control->ras_tbl_mutex);
+
+	/* Read the table header from EEPROM address */
+	res = __eeprom_read(ras_core,
+			      control->i2c_address + control->ras_header_offset,
+			      buf, RAS_TABLE_HEADER_SIZE);
+	if (res < RAS_TABLE_HEADER_SIZE) {
+		RAS_DEV_ERR(ras_core->dev,
+			"Failed to read EEPROM table header, res:%d\n", res);
+		return res >= 0 ? -EIO : res;
+	}
+
+	__decode_table_header_from_buf(hdr, buf);
+
+	if (hdr->header != RAS_TABLE_HDR_VAL &&
+	    hdr->header != RAS_TABLE_HDR_BAD) {
+		RAS_DEV_INFO(ras_core->dev, "Creating a new EEPROM table");
+		return ras_eeprom_reset_table(ras_core);
+	}
+
+	switch (hdr->version) {
+	case RAS_TABLE_VER_V2_1:
+	case RAS_TABLE_VER_V3:
+		control->ras_num_recs = RAS_NUM_RECS_V2_1(hdr);
+		control->ras_record_offset = RAS_RECORD_START_V2_1;
+		control->ras_max_record_count = RAS_MAX_RECORD_COUNT_V2_1;
+		break;
+	case RAS_TABLE_VER_V1:
+		control->ras_num_recs = RAS_NUM_RECS(hdr);
+		control->ras_record_offset = RAS_RECORD_START;
+		control->ras_max_record_count = RAS_MAX_RECORD_COUNT;
+		break;
+	default:
+		RAS_DEV_ERR(ras_core->dev,
+			"RAS header invalid, unsupported version: %u",
+			hdr->version);
+		return -EINVAL;
+	}
+
+	if (control->ras_num_recs > control->ras_max_record_count) {
+		RAS_DEV_ERR(ras_core->dev,
+			"RAS header invalid, records in header: %u max allowed :%u",
+			control->ras_num_recs, control->ras_max_record_count);
+		return -EINVAL;
+	}
+
+	control->ras_fri = RAS_OFFSET_TO_INDEX(control, hdr->first_rec_offset);
+
+	return 0;
+}
+
+int ras_eeprom_check_storage_status(struct ras_core_context *ras_core)
+{
+	struct ras_eeprom_control *control = &ras_core->ras_eeprom;
+	struct ras_eeprom_table_header *hdr;
+	int bad_page_count;
+	int res = 0;
+
+	if (!__is_ras_eeprom_supported(ras_core))
+		return 0;
+
+	if (!__get_eeprom_i2c_addr(ras_core, control))
+		return -EINVAL;
+
+	hdr = &control->tbl_hdr;
+
+	bad_page_count = ras_umc_get_badpage_count(ras_core);
+	if (hdr->header == RAS_TABLE_HDR_VAL) {
+		RAS_DEV_INFO(ras_core->dev,
+			"Found existing EEPROM table with %d records\n",
+			bad_page_count);
+
+		if (hdr->version >= RAS_TABLE_VER_V2_1) {
+			res = __read_table_ras_info(control);
+			if (res)
+				return res;
+		}
+
+		res = __verify_ras_table_checksum(control);
+		if (res)
+			RAS_DEV_ERR(ras_core->dev,
+				"RAS table incorrect checksum or error:%d\n", res);
+
+		/* Warn if we are at 90% of the threshold or above
+		 */
+		if (10 * bad_page_count >= 9 * control->record_threshold_count)
+			RAS_DEV_WARN(ras_core->dev,
+				"RAS records:%u exceeds 90%% of threshold:%d\n",
+				bad_page_count,
+				control->record_threshold_count);
+
+	} else if (hdr->header == RAS_TABLE_HDR_BAD &&
+		   control->record_threshold_config != 0) {
+		if (hdr->version >= RAS_TABLE_VER_V2_1) {
+			res = __read_table_ras_info(control);
+			if (res)
+				return res;
+		}
+
+		res = __verify_ras_table_checksum(control);
+		if (res)
+			RAS_DEV_ERR(ras_core->dev,
+				"RAS Table incorrect checksum or error:%d\n", res);
+
+		if (control->record_threshold_count >= bad_page_count) {
+			/* This means that, the threshold was increased since
+			 * the last time the system was booted, and now,
+			 * ras->record_threshold_count - control->num_recs > 0,
+			 * so that at least one more record can be saved,
+			 * before the page count threshold is reached.
+			 */
+			RAS_DEV_INFO(ras_core->dev,
+				"records:%d threshold:%d, resetting RAS table header signature",
+				bad_page_count,
+				control->record_threshold_count);
+			res = ras_eeprom_correct_header_tag(control, RAS_TABLE_HDR_VAL);
+		} else {
+			RAS_DEV_ERR(ras_core->dev, "RAS records:%d exceed threshold:%d",
+				bad_page_count, control->record_threshold_count);
+			if ((control->record_threshold_config == WARN_NONSTOP_OVER_THRESHOLD) ||
+				(control->record_threshold_config == NONSTOP_OVER_THRESHOLD)) {
+				RAS_DEV_WARN(ras_core->dev,
+				"Please consult AMD Service Action Guide (SAG) for appropriate service procedures\n");
+				res = 0;
+			} else {
+				ras_core->is_rma = true;
+				RAS_DEV_ERR(ras_core->dev,
+				"User defined threshold is set, runtime service will be halt when threshold is reached\n");
+			}
+		}
+	}
+
+	return res < 0 ? res : 0;
+}
+
+int ras_eeprom_hw_init(struct ras_core_context *ras_core)
+{
+	struct ras_eeprom_control *control;
+	struct ras_eeprom_config *eeprom_cfg;
+
+	if (!ras_core)
+		return -EINVAL;
+
+	ras_core->is_rma = false;
+
+	control = &ras_core->ras_eeprom;
+
+	memset(control, 0, sizeof(*control));
+
+	eeprom_cfg = &ras_core->config->eeprom_cfg;
+	control->record_threshold_config =
+		eeprom_cfg->eeprom_record_threshold_config;
+
+	control->record_threshold_count = ras_eeprom_max_record_count(ras_core);
+	if (eeprom_cfg->eeprom_record_threshold_count <
+		control->record_threshold_count)
+		control->record_threshold_count =
+			eeprom_cfg->eeprom_record_threshold_count;
+
+	control->sys_func = eeprom_cfg->eeprom_sys_fn;
+	control->max_read_len = eeprom_cfg->max_i2c_read_len;
+	control->max_write_len = eeprom_cfg->max_i2c_write_len;
+	control->i2c_adapter = eeprom_cfg->eeprom_i2c_adapter;
+	control->i2c_port = eeprom_cfg->eeprom_i2c_port;
+	control->i2c_address = eeprom_cfg->eeprom_i2c_addr;
+
+	control->update_channel_flag = false;
+
+	return __check_ras_table_status(ras_core);
+}
+
+int ras_eeprom_hw_fini(struct ras_core_context *ras_core)
+{
+	struct ras_eeprom_control *control;
+
+	if (!ras_core)
+		return -EINVAL;
+
+	control = &ras_core->ras_eeprom;
+	mutex_destroy(&control->ras_tbl_mutex);
+
+	return 0;
+}
+
+uint32_t ras_eeprom_get_record_count(struct ras_core_context *ras_core)
+{
+	if (!ras_core)
+		return 0;
+
+	return ras_core->ras_eeprom.ras_num_recs;
+}
+
+void ras_eeprom_sync_info(struct ras_core_context *ras_core)
+{
+	struct ras_eeprom_control *control;
+
+	if (!ras_core)
+		return;
+
+	control = &ras_core->ras_eeprom;
+	ras_core_event_notify(ras_core, RAS_EVENT_ID__UPDATE_BAD_PAGE_NUM,
+		&control->ras_num_recs);
+	ras_core_event_notify(ras_core, RAS_EVENT_ID__UPDATE_BAD_CHANNEL_BITMAP,
+		&control->bad_channel_bitmap);
+}
+
+enum ras_gpu_health_status
+	ras_eeprom_check_gpu_status(struct ras_core_context *ras_core)
+{
+	struct ras_eeprom_control *control = &ras_core->ras_eeprom;
+	struct ras_eeprom_table_ras_info *rai = &control->tbl_rai;
+
+	if (!__is_ras_eeprom_supported(ras_core) ||
+	    !control->record_threshold_config)
+		return RAS_GPU_HEALTH_NONE;
+
+	if (control->tbl_hdr.header == RAS_TABLE_HDR_BAD)
+		return RAS_GPU_IN_BAD_STATUS;
+
+	return rai->rma_status;
+}
diff --git a/drivers/gpu/drm/amd/ras/rascore/ras_eeprom.h b/drivers/gpu/drm/amd/ras/rascore/ras_eeprom.h
new file mode 100644
index 000000000000..2abe566c18b6
--- /dev/null
+++ b/drivers/gpu/drm/amd/ras/rascore/ras_eeprom.h
@@ -0,0 +1,197 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright 2025 Advanced Micro Devices, Inc.
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
+#ifndef __RAS_EEPROM_H__
+#define __RAS_EEPROM_H__
+#include "ras_sys.h"
+
+#define RAS_TABLE_VER_V1           0x00010000
+#define RAS_TABLE_VER_V2_1         0x00021000
+#define RAS_TABLE_VER_V3           0x00030000
+
+#define NONSTOP_OVER_THRESHOLD              -2
+#define WARN_NONSTOP_OVER_THRESHOLD         -1
+#define DISABLE_RETIRE_PAGE                 0
+
+/*
+ * Bad address pfn : eeprom_umc_record.retired_row_pfn[39:0],
+ * nps mode: eeprom_umc_record.retired_row_pfn[47:40]
+ */
+#define EEPROM_RECORD_UMC_ADDR_MASK 0xFFFFFFFFFFULL
+#define EEPROM_RECORD_UMC_NPS_MASK  0xFF0000000000ULL
+#define EEPROM_RECORD_UMC_NPS_SHIFT 40
+
+#define EEPROM_RECORD_UMC_NPS_MODE(RECORD) \
+	(((RECORD)->retired_row_pfn & EEPROM_RECORD_UMC_NPS_MASK) >> \
+		EEPROM_RECORD_UMC_NPS_SHIFT)
+
+#define EEPROM_RECORD_UMC_ADDR_PFN(RECORD) \
+	((RECORD)->retired_row_pfn & EEPROM_RECORD_UMC_ADDR_MASK)
+
+#define EEPROM_RECORD_SETUP_UMC_ADDR_AND_NPS(RECORD, ADDR, NPS) \
+do { \
+	uint64_t tmp = (NPS); \
+	tmp = ((tmp << EEPROM_RECORD_UMC_NPS_SHIFT) & EEPROM_RECORD_UMC_NPS_MASK); \
+	tmp |= (ADDR) & EEPROM_RECORD_UMC_ADDR_MASK; \
+	(RECORD)->retired_row_pfn = tmp; \
+} while (0)
+
+enum ras_gpu_health_status {
+	RAS_GPU_HEALTH_NONE = 0,
+	RAS_GPU_HEALTH_USABLE = 1,
+	RAS_GPU_RETIRED__ECC_REACH_THRESHOLD = 2,
+	RAS_GPU_IN_BAD_STATUS = 3,
+};
+
+enum ras_eeprom_err_type {
+	RAS_EEPROM_ERR_NA,
+	RAS_EEPROM_ERR_RECOVERABLE,
+	RAS_EEPROM_ERR_NON_RECOVERABLE,
+	RAS_EEPROM_ERR_COUNT,
+};
+
+struct ras_eeprom_table_header {
+	uint32_t header;
+	uint32_t version;
+	uint32_t first_rec_offset;
+	uint32_t tbl_size;
+	uint32_t checksum;
+} __packed;
+
+struct ras_eeprom_table_ras_info {
+	u8  rma_status;
+	u8  health_percent;
+	u16 ecc_page_threshold;
+	u32 padding[64 - 1];
+} __packed;
+
+struct ras_eeprom_control {
+	struct ras_eeprom_table_header tbl_hdr;
+	struct ras_eeprom_table_ras_info tbl_rai;
+
+	/* record threshold */
+	int record_threshold_config;
+	uint32_t record_threshold_count;
+	bool update_channel_flag;
+
+	const struct ras_eeprom_sys_func *sys_func;
+	void *i2c_adapter;
+	u32 i2c_port;
+	u16 max_read_len;
+	u16 max_write_len;
+
+	/* Base I2C EEPPROM 19-bit memory address,
+	 * where the table is located. For more information,
+	 * see top of amdgpu_eeprom.c.
+	 */
+	u32 i2c_address;
+
+	/* The byte offset off of @i2c_address
+	 * where the table header is found,
+	 * and where the records start--always
+	 * right after the header.
+	 */
+	u32 ras_header_offset;
+	u32 ras_info_offset;
+	u32 ras_record_offset;
+
+	/* Number of records in the table.
+	 */
+	u32 ras_num_recs;
+
+	/* First record index to read, 0-based.
+	 * Range is [0, num_recs-1]. This is
+	 * an absolute index, starting right after
+	 * the table header.
+	 */
+	u32 ras_fri;
+
+	/* Maximum possible number of records
+	 * we could store, i.e. the maximum capacity
+	 * of the table.
+	 */
+	u32 ras_max_record_count;
+
+	/* Protect table access via this mutex.
+	 */
+	struct mutex ras_tbl_mutex;
+
+	/* Record channel info which occurred bad pages
+	 */
+	u32 bad_channel_bitmap;
+};
+
+/*
+ * Represents single table record. Packed to be easily serialized into byte
+ * stream.
+ */
+struct eeprom_umc_record {
+
+	union {
+		uint64_t address;
+		uint64_t offset;
+	};
+
+	uint64_t retired_row_pfn;
+	uint64_t ts;
+
+	enum ras_eeprom_err_type err_type;
+
+	union {
+		unsigned char bank;
+		unsigned char cu;
+	};
+
+	unsigned char mem_channel;
+	unsigned char mcumc_id;
+
+	/* The following variables will not be saved to eeprom.
+	 */
+	uint64_t cur_nps_retired_row_pfn;
+	uint32_t cur_nps_bank;
+	uint32_t cur_nps;
+};
+
+struct ras_core_context;
+int ras_eeprom_hw_init(struct ras_core_context *ras_core);
+int ras_eeprom_hw_fini(struct ras_core_context *ras_core);
+
+int ras_eeprom_reset_table(struct ras_core_context *ras_core);
+
+bool ras_eeprom_check_safety_watermark(struct ras_core_context *ras_core);
+
+int ras_eeprom_read(struct ras_core_context *ras_core,
+			 struct eeprom_umc_record *records, const u32 num);
+
+int ras_eeprom_append(struct ras_core_context *ras_core,
+			   struct eeprom_umc_record *records, const u32 num);
+
+uint32_t ras_eeprom_max_record_count(struct ras_core_context *ras_core);
+uint32_t ras_eeprom_get_record_count(struct ras_core_context *ras_core);
+void ras_eeprom_sync_info(struct ras_core_context *ras_core);
+
+int ras_eeprom_check_storage_status(struct ras_core_context *ras_core);
+enum ras_gpu_health_status
+	ras_eeprom_check_gpu_status(struct ras_core_context *ras_core);
+#endif
-- 
2.34.1

