Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D71C2A91B
	for <lists+amd-gfx@lfdr.de>; Mon, 03 Nov 2025 09:28:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567EC10E179;
	Mon,  3 Nov 2025 08:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="a8zjfcY9";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012013.outbound.protection.outlook.com [40.107.209.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E00DE10E179
 for <amd-gfx@lists.freedesktop.org>; Mon,  3 Nov 2025 08:28:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RaNFIgYeOoychfmVJiwMrvPDAvWTGMA58zY1k8+p5ksvLQyopfTKC6jScYTPuyAovUWGT12snVq8uouswQSX90JBsVY6Gi6yuBUiyCm+CyRXBX7iAbf9woPqq4qOYD3lY1JDE9UXXmRr+wXkNkTjE1Xv8RymG1JVeJLNSopspq8e/GbJ5UVFbos1TxcserMmV568NsIFJ7bnSl3zB/IIO/TyN60kP1iApiupl0vrugDdPepkRnq8nnUiwHw8YTWGEZ+uFnXzvmV6pkHafybKLwiHlB4dXv0Y1OR1D9cggnZyqykxqwPWScIDJKVzcVsPgGXd0p/3d77QTz9H6kktpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e6D+k8/T6gIfnMBkzwooqB67rWM/JaA5UBMJ7+AjvkQ=;
 b=hmhAJgxGPK/h53F2SZuOWNUZlj8PiEzayVN5ktTe96iZKxP0S53XV1I+B0rBfHk22dRGzXLmJFIHweswsEJWHiLEL0Tsa8onn0VqCIPaRWNP+b9pYsIVW3oVWkrgfUoEqlhUR/TaZ3SfjzYfwKVTEDRcS1S0DGxSyRm3RUrPvxkYYMePvuVDhWPAxE18yu5/7xBzOfNCGT4cQIAsut76TuYYEgmUCYEe22nUooLqMtyHI+W+DolEFpvMtahi56QXLh08WBQAhTFbfuI/vwvgbAszeiJA+tB1Sk9Kmy4fT9eaK5NMrVuwIxf/33Mj8m2aut+PjrMvbvbPlk+IeLDjwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e6D+k8/T6gIfnMBkzwooqB67rWM/JaA5UBMJ7+AjvkQ=;
 b=a8zjfcY9eHftj6FnzWTAVROFnUBCn1ttDxvIwLD7nbyn7vSE1NJ+wmPTRXwpACz1m0Yq3hQYkqH70ZZVEEzqZoTBpSR91WJa/XGHIvUavGnQsh67pwWX8z21bWcqL3f0dwIeWdvaWRX5oPDyBfE30hxRR7/s3HnMs1H+FDlWcL0=
Received: from BN9PR03CA0420.namprd03.prod.outlook.com (2603:10b6:408:111::35)
 by SA5PPF50009C446.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8c8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 08:28:12 +0000
Received: from BN2PEPF000044AA.namprd04.prod.outlook.com
 (2603:10b6:408:111:cafe::23) by BN9PR03CA0420.outlook.office365.com
 (2603:10b6:408:111::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Mon,
 3 Nov 2025 08:28:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044AA.mail.protection.outlook.com (10.167.243.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Mon, 3 Nov 2025 08:28:11 +0000
Received: from amd-02.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 3 Nov
 2025 00:28:08 -0800
From: YiPeng Chai <YiPeng.Chai@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Hawking.Zhang@amd.com>, <Tao.Zhou1@amd.com>, <Candice.Li@amd.com>,
 <Stanley.Yang@amd.com>, <Jinzhou.Su@amd.com>, YiPeng Chai
 <YiPeng.Chai@amd.com>, Tao Zhou <tao.zhou1@amd.com>
Subject: [PATCH] drm/amdgpu: suspend ras module before gpu reset
Date: Mon, 3 Nov 2025 16:27:33 +0800
Message-ID: <20251103082733.2671013-1-YiPeng.Chai@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AA:EE_|SA5PPF50009C446:EE_
X-MS-Office365-Filtering-Correlation-Id: 49f483b8-d6f0-41cb-b073-08de1ab2ed04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iPQJ06XZZuvNf2kJ4ZI3K4zZfXU6Fxy1ueew+o3WXw/fZEtSClq7rPBSQqP5?=
 =?us-ascii?Q?6OSp0UuS7gU5pCBsoigdR2zvn91Xdsv8ULeqvHwtyGV1qlY6/AjIaIc7nIO3?=
 =?us-ascii?Q?z0wPSV2UqLUyswf5zNZSjPnVk19mNwytnSJDlGj0U9lXXXEG7OfL/xs5OvgO?=
 =?us-ascii?Q?A6x/NDjNEn/ynhdJpxQ13LwrknULJKm9lERalCGjwjIW6TBJldbuS1CS28i3?=
 =?us-ascii?Q?huE/lM9Y4UO3T0HHOd20DrYS0n7+VW9Ooyml0Uz1ELXnqyXQbQ3XBBxm5YWI?=
 =?us-ascii?Q?zp9y4XLIfsejUUz4ICkx4NY9x7VrFZDaNHj9ycZjcdmdc6Pl7OeL/HBIIxWb?=
 =?us-ascii?Q?fs5qC7o1kkiG67TYhzij9cIAdIuEbpEnURtp16Gcm4LMXUTj3wC8TYvRAR9V?=
 =?us-ascii?Q?h+RxojKZWbRRp1ztHCqyqkkdCRO38bkWeHSStkpoLa11BwxUuN0N/MW0/rlw?=
 =?us-ascii?Q?pN3RytdANyEU9qSYzWYEaYNj5HEd2aI9BgNzMW/3+1KviKNysXYIFAjjU2Zr?=
 =?us-ascii?Q?21eXVvjXccc4Hf4kcNAc3ZkdmlvY2YTXsRc55cXR29zFb0XAk2e2Bkxo+mNe?=
 =?us-ascii?Q?U5rnYqfkl0i/6hr5gdp0Y0cOm0KuL19VqUy3yc/C0dHEZyke6HOui6ibE7E9?=
 =?us-ascii?Q?b6qlMKJ8wiNYyF7Jtv1DEG4FMdIuCbjwni9bM8MSTGI3IYGoVLSqrCOPykNa?=
 =?us-ascii?Q?T0rynyn/tm8Xh5nnAQsYuCbqTA8VEKBNPtoljXTPGi8otYE+TiinJt0sT3+s?=
 =?us-ascii?Q?wKppq7uLaEaQU+Si9egVinTFQM3gUU5dxOLxcM7l1oXqXLRhRPXUdAiS3hN0?=
 =?us-ascii?Q?wg3lreZ/wT3ebstm9DFVIf5zubYAgHlUXri/lZvaZAQnc57p1ddNMr6VdLVt?=
 =?us-ascii?Q?ZGBxqp8fnRpspmac+pEoVzcnkHFoJ6fRxpBOjflZTh5cW5PhUqw1ORiIP7X1?=
 =?us-ascii?Q?pkXtwwTU5hS3WnjbvaP8owhQMO2kmrejlXu0WliAWiBco9IFwShYrOlA0j9t?=
 =?us-ascii?Q?1VZ85daKAROpnHsTxUAHevzv6O1UpGaQsi5Oby3f8SZXaXismwmeqJ4BFv/D?=
 =?us-ascii?Q?r27vvK7xEmI6OzJxvnYhlk+Fm5WoIEa0/TsbtN8HOOKQM6rbBkmmoMbIt9ok?=
 =?us-ascii?Q?TyE7DN5kucFdsxK3LS1VocMMsKyQqoxZ/mAwbRNA+1JZTw07j9y3Y+1psBTc?=
 =?us-ascii?Q?1V6cgf1fdL5Dkq7IyZXLHYRkqv+uvAmVonQFUulNZ6F/54Si1gWP7x0EvPVF?=
 =?us-ascii?Q?tfD2RxdMhllxmfRNmTqKGmCxuBDJ1qZ/K+Fa6x4ENrGnRqVD53kYvYgf4Abe?=
 =?us-ascii?Q?5LWNuiOASC5ThouQjC6NYF7PEdVCybEnbSyUc8xRb9fTTCPgW6YHc+tIkSCe?=
 =?us-ascii?Q?0/tkZhDKQNWzot9FpQrpDQrOhGT/ArxDn9NOXdwSF7yBP9PDl0GkDyF6D9nT?=
 =?us-ascii?Q?0JiueK7AAw6tT4SXNLs0XYuF3Ve4t1mGnPO/3WsJu+i2SygfI0Du5Kw8xePd?=
 =?us-ascii?Q?Unmap0JSH3OYgXdIsw3ChIeuPNukz3BAB7OKKwEsPznzR6+9Fik94Iuy5zSU?=
 =?us-ascii?Q?XmFptOmgORS1BGFOehU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 08:28:11.5774 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49f483b8-d6f0-41cb-b073-08de1ab2ed04
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044AA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF50009C446
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

During gpu reset, all GPU-related resources are
inaccessible. To avoid affecting ras functionality,
suspend ras module before gpu reset and resume
it after gpu reset is complete.

V2:
  Rename functions to avoid misunderstanding.

V3:
  Move flush_delayed_work to amdgpu_ras_process_pause,
  Move schedule_delayed_work to amdgpu_ras_process_unpause.

V4:
  Rename functions.

Signed-off-by: YiPeng Chai <YiPeng.Chai@amd.com>
Reviewed-by: Tao Zhou <tao.zhou1@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 26 ++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c       |  8 ++-
 .../gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.c  | 22 +++++++
 .../gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.h  |  5 ++
 .../drm/amd/ras/ras_mgr/amdgpu_ras_process.c  | 64 +++++++++++++++++++
 .../drm/amd/ras/ras_mgr/amdgpu_ras_process.h  |  4 ++
 .../gpu/drm/amd/ras/ras_mgr/amdgpu_ras_sys.c  |  6 ++
 drivers/gpu/drm/amd/ras/rascore/ras.h         |  2 +
 drivers/gpu/drm/amd/ras/rascore/ras_process.c |  7 ++
 9 files changed, 142 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index cc6e59208cac..9e8802ccc75e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -71,6 +71,7 @@
 
 #include "amdgpu_xgmi.h"
 #include "amdgpu_ras.h"
+#include "amdgpu_ras_mgr.h"
 #include "amdgpu_pmu.h"
 #include "amdgpu_fru_eeprom.h"
 #include "amdgpu_reset.h"
@@ -6586,6 +6587,27 @@ static void amdgpu_device_gpu_resume(struct amdgpu_device *adev,
 	}
 }
 
+static void amdgpu_ras_pre_reset(struct amdgpu_device *adev,
+					  struct list_head *device_list)
+{
+	struct amdgpu_device *tmp_adev = NULL;
+
+	list_for_each_entry(tmp_adev, device_list, reset_list) {
+		if (amdgpu_uniras_enabled(tmp_adev))
+			amdgpu_ras_mgr_pre_reset(tmp_adev);
+	}
+}
+
+static void amdgpu_ras_post_reset(struct amdgpu_device *adev,
+					  struct list_head *device_list)
+{
+	struct amdgpu_device *tmp_adev = NULL;
+
+	list_for_each_entry(tmp_adev, device_list, reset_list) {
+		if (amdgpu_uniras_enabled(tmp_adev))
+			amdgpu_ras_mgr_post_reset(tmp_adev);
+	}
+}
 
 /**
  * amdgpu_device_gpu_recover - reset the asic and recover scheduler
@@ -6660,6 +6682,9 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 			goto end_reset;
 	}
 
+	/* Cannot be called after locking reset domain */
+	amdgpu_ras_pre_reset(adev, &device_list);
+
 	/* We need to lock reset domain only once both for XGMI and single device */
 	amdgpu_device_recovery_get_reset_lock(adev, &device_list);
 
@@ -6691,6 +6716,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 reset_unlock:
 	amdgpu_device_recovery_put_reset_lock(adev, &device_list);
 end_reset:
+	amdgpu_ras_post_reset(adev, &device_list);
 	if (hive) {
 		mutex_unlock(&hive->hive_lock);
 		amdgpu_put_xgmi_hive(hive);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 5377cde0c55d..cb4f4b5668ab 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -2921,8 +2921,12 @@ static void amdgpu_ras_do_recovery(struct work_struct *work)
 		type = amdgpu_ras_get_fatal_error_event(adev);
 		list_for_each_entry(remote_adev,
 				device_list_handle, gmc.xgmi.head) {
-			amdgpu_ras_query_err_status(remote_adev);
-			amdgpu_ras_log_on_err_counter(remote_adev, type);
+			if (amdgpu_uniras_enabled(remote_adev)) {
+				amdgpu_ras_mgr_update_ras_ecc(remote_adev);
+			} else {
+				amdgpu_ras_query_err_status(remote_adev);
+				amdgpu_ras_log_on_err_counter(remote_adev, type);
+			}
 		}
 
 	}
diff --git a/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.c b/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.c
index f8ec0f26a9e7..36c665c3ee48 100644
--- a/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.c
+++ b/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.c
@@ -622,3 +622,25 @@ int amdgpu_ras_mgr_handle_ras_cmd(struct amdgpu_device *adev,
 
 	return ret;
 }
+
+int amdgpu_ras_mgr_pre_reset(struct amdgpu_device *adev)
+{
+	if (!amdgpu_ras_mgr_is_ready(adev)) {
+		RAS_DEV_ERR(adev, "Invalid ras suspend!\n");
+		return -EPERM;
+	}
+
+	amdgpu_ras_process_pre_reset(adev);
+	return 0;
+}
+
+int amdgpu_ras_mgr_post_reset(struct amdgpu_device *adev)
+{
+	if (!amdgpu_ras_mgr_is_ready(adev)) {
+		RAS_DEV_ERR(adev, "Invalid ras resume!\n");
+		return -EPERM;
+	}
+
+	amdgpu_ras_process_post_reset(adev);
+	return 0;
+}
diff --git a/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.h b/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.h
index 42f190a8feb9..8fb7eb4b8f13 100644
--- a/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.h
+++ b/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.h
@@ -52,6 +52,9 @@ struct amdgpu_ras_mgr {
 	struct ras_event_manager ras_event_mgr;
 	uint64_t last_poison_consumption_seqno;
 	bool ras_is_ready;
+
+	bool is_paused;
+	struct completion ras_event_done;
 };
 
 extern const struct amdgpu_ip_block_version ras_v1_0_ip_block;
@@ -75,4 +78,6 @@ bool amdgpu_ras_mgr_is_rma(struct amdgpu_device *adev);
 int amdgpu_ras_mgr_handle_ras_cmd(struct amdgpu_device *adev,
 		uint32_t cmd_id, void *input, uint32_t input_size,
 		void *output, uint32_t out_size);
+int amdgpu_ras_mgr_pre_reset(struct amdgpu_device *adev);
+int amdgpu_ras_mgr_post_reset(struct amdgpu_device *adev);
 #endif
diff --git a/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_process.c b/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_process.c
index 6727fc9a2b9b..5782c007de71 100644
--- a/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_process.c
+++ b/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_process.c
@@ -29,6 +29,7 @@
 #include "amdgpu_ras_process.h"
 
 #define RAS_MGR_RETIRE_PAGE_INTERVAL  100
+#define RAS_EVENT_PROCESS_TIMEOUT  1200
 
 static void ras_process_retire_page_dwork(struct work_struct *work)
 {
@@ -57,6 +58,9 @@ int amdgpu_ras_process_init(struct amdgpu_device *adev)
 {
 	struct amdgpu_ras_mgr *ras_mgr = amdgpu_ras_mgr_get_context(adev);
 
+	ras_mgr->is_paused = false;
+	init_completion(&ras_mgr->ras_event_done);
+
 	INIT_DELAYED_WORK(&ras_mgr->retire_page_dwork, ras_process_retire_page_dwork);
 
 	return 0;
@@ -66,6 +70,7 @@ int amdgpu_ras_process_fini(struct amdgpu_device *adev)
 {
 	struct amdgpu_ras_mgr *ras_mgr = amdgpu_ras_mgr_get_context(adev);
 
+	ras_mgr->is_paused = false;
 	/* Save all cached bad pages to eeprom */
 	flush_delayed_work(&ras_mgr->retire_page_dwork);
 	cancel_delayed_work_sync(&ras_mgr->retire_page_dwork);
@@ -124,3 +129,62 @@ int amdgpu_ras_process_handle_consumption_interrupt(struct amdgpu_device *adev,
 
 	return ras_process_add_interrupt_req(ras_mgr->ras_core, &req, false);
 }
+
+int amdgpu_ras_process_begin(struct amdgpu_device *adev)
+{
+	struct amdgpu_ras_mgr *ras_mgr = amdgpu_ras_mgr_get_context(adev);
+
+	if (ras_mgr->is_paused)
+		return -EAGAIN;
+
+	reinit_completion(&ras_mgr->ras_event_done);
+	return 0;
+}
+
+int amdgpu_ras_process_end(struct amdgpu_device *adev)
+{
+	struct amdgpu_ras_mgr *ras_mgr = amdgpu_ras_mgr_get_context(adev);
+
+	complete(&ras_mgr->ras_event_done);
+	return 0;
+}
+
+int amdgpu_ras_process_pre_reset(struct amdgpu_device *adev)
+{
+	struct amdgpu_ras_mgr *ras_mgr = amdgpu_ras_mgr_get_context(adev);
+	long rc;
+
+	if (!ras_mgr || !ras_mgr->ras_core)
+		return -EINVAL;
+
+	if (!ras_mgr->ras_core->is_initialized)
+		return -EPERM;
+
+	ras_mgr->is_paused = true;
+
+	/* Wait for RAS event processing to complete */
+	rc = wait_for_completion_interruptible_timeout(&ras_mgr->ras_event_done,
+			msecs_to_jiffies(RAS_EVENT_PROCESS_TIMEOUT));
+	if (rc <= 0)
+		RAS_DEV_WARN(adev, "Waiting for ras process to complete %s\n",
+			 rc ? "interrupted" : "timeout");
+
+	flush_delayed_work(&ras_mgr->retire_page_dwork);
+	return 0;
+}
+
+int amdgpu_ras_process_post_reset(struct amdgpu_device *adev)
+{
+	struct amdgpu_ras_mgr *ras_mgr = amdgpu_ras_mgr_get_context(adev);
+
+	if (!ras_mgr || !ras_mgr->ras_core)
+		return -EINVAL;
+
+	if (!ras_mgr->ras_core->is_initialized)
+		return -EPERM;
+
+	ras_mgr->is_paused = false;
+
+	schedule_delayed_work(&ras_mgr->retire_page_dwork, 0);
+	return 0;
+}
diff --git a/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_process.h b/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_process.h
index b9502bd21beb..d55cdaeac441 100644
--- a/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_process.h
+++ b/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_process.h
@@ -34,4 +34,8 @@ int amdgpu_ras_process_handle_unexpected_interrupt(struct amdgpu_device *adev,
 		void *data);
 int amdgpu_ras_process_handle_consumption_interrupt(struct amdgpu_device *adev,
 		void *data);
+int amdgpu_ras_process_begin(struct amdgpu_device *adev);
+int amdgpu_ras_process_end(struct amdgpu_device *adev);
+int amdgpu_ras_process_pre_reset(struct amdgpu_device *adev);
+int amdgpu_ras_process_post_reset(struct amdgpu_device *adev);
 #endif
diff --git a/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_sys.c b/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_sys.c
index f21cd55a25be..45ed8c3b5563 100644
--- a/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_sys.c
+++ b/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_sys.c
@@ -142,6 +142,12 @@ static int amdgpu_ras_sys_event_notifier(struct ras_core_context *ras_core,
 	case RAS_EVENT_ID__RESET_GPU:
 		ret = amdgpu_ras_mgr_reset_gpu(ras_core->dev, *(uint32_t *)data);
 		break;
+	case RAS_EVENT_ID__RAS_EVENT_PROC_BEGIN:
+		ret = amdgpu_ras_process_begin(ras_core->dev);
+		break;
+	case RAS_EVENT_ID__RAS_EVENT_PROC_END:
+		ret = amdgpu_ras_process_end(ras_core->dev);
+		break;
 	default:
 		RAS_DEV_WARN(ras_core->dev, "Invalid ras notify event:%d\n", event_id);
 		break;
diff --git a/drivers/gpu/drm/amd/ras/rascore/ras.h b/drivers/gpu/drm/amd/ras/rascore/ras.h
index fa224b36e3f2..3396b2e0949d 100644
--- a/drivers/gpu/drm/amd/ras/rascore/ras.h
+++ b/drivers/gpu/drm/amd/ras/rascore/ras.h
@@ -115,6 +115,8 @@ enum ras_notify_event {
 	RAS_EVENT_ID__FATAL_ERROR_DETECTED,
 	RAS_EVENT_ID__RESET_GPU,
 	RAS_EVENT_ID__RESET_VF,
+	RAS_EVENT_ID__RAS_EVENT_PROC_BEGIN,
+	RAS_EVENT_ID__RAS_EVENT_PROC_END,
 };
 
 enum ras_gpu_status {
diff --git a/drivers/gpu/drm/amd/ras/rascore/ras_process.c b/drivers/gpu/drm/amd/ras/rascore/ras_process.c
index 02f0657f78a3..3267dcdb169c 100644
--- a/drivers/gpu/drm/amd/ras/rascore/ras_process.c
+++ b/drivers/gpu/drm/amd/ras/rascore/ras_process.c
@@ -162,6 +162,11 @@ int ras_process_handle_ras_event(struct ras_core_context *ras_core)
 	uint32_t umc_event_count;
 	int ret;
 
+	ret = ras_core_event_notify(ras_core,
+			RAS_EVENT_ID__RAS_EVENT_PROC_BEGIN, NULL);
+	if (ret)
+		return ret;
+
 	ras_aca_clear_fatal_flag(ras_core);
 	ras_umc_log_pending_bad_bank(ras_core);
 
@@ -185,6 +190,8 @@ int ras_process_handle_ras_event(struct ras_core_context *ras_core)
 		atomic_set(&ras_proc->umc_interrupt_count, 0);
 	}
 
+	ras_core_event_notify(ras_core,
+			RAS_EVENT_ID__RAS_EVENT_PROC_END, NULL);
 	return ret;
 }
 
-- 
2.34.1

