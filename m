Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FTKRH1q9OGpYhQcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2026 06:43:06 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A70F6AC96E
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2026 06:43:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=RT7Too4P;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B663310E47E;
	Mon, 22 Jun 2026 04:43:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011059.outbound.protection.outlook.com [52.101.62.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D9310E47E
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jun 2026 04:43:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aF/na69r8xWYRmWB/wU9ODqoalulB8klzsHRE6EBszXaenAlWroZV74VY6527uZp7+l8JsPjMbJzPmcyj5g8CBti5opmtM4r/NoM1Il5CGb8/sSjPIf3VZ/qUEoa0Ikazfkbd7DN+Xgeor4AytOj5UIAqnDjzXhDqW6FA3MmxMlbReG24HN5t8vUFIHZ42QkABKG6QhWMfO7NrhF8OTTGkbZIpo3fn4zDvDaBCwSZKb7JjLZCCJZdak45mCCm04dYx5xbg3UFzP1SYu7+neBKSGlOlTGBJGfBPZFxOeqYERf9vZzhqshr/phjZG2kB+DMX0kbaxsMFKhwaS44yXYPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pwq0Rlgaw/hiHkEm9PlrKIUn8HbZqmFPySc7ivaeuo4=;
 b=k4BZVuRHP1vLxatJ+DAKQBBRTmbLfDcZNTXJMbnkr5HL3b1yEFDwOLfpDvLCoLMbvggicgSTotQY342EgNQw3RmQ26zEzYLjtOq/vZj+udiKbCcGLQTFoXDk1Zw6GOmUx85zAFTTsWUe2Nv7p3Oapm2V1UhY4rZDqqTlONMKWNoVEUPvt/4P4jDjgpLpHu2uX0nKdDYJyXK+dCOiDitpV73Gy0clZH9PYQvogHspRew3QIKQdFFmiJtf7Nx/X0DWZEXMDS/SLgUiaj669AosSAw7VF0plaJPmCAPtaQP+oLhoAtSFVsCEb8jFIJvnXrbrV1u5I+r7nN5/ABwhFNkWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pwq0Rlgaw/hiHkEm9PlrKIUn8HbZqmFPySc7ivaeuo4=;
 b=RT7Too4P3l9maNd1dOiGWfFvxcfctleqQlTgK6UrHkq2/n+dIlDrKGvurGzePZVeFNycPQ2tF13A5Qrz/zG4ftaejg0cpU9XBLS3m4CVv7MYyF9K8MTZJNKv6kAibLrB+4R4fn2JF9B52CEqK0RjC6ho/SbEb/DPPT6W3JPvgjI=
Received: from IA4P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:558::8)
 by PH8PR12MB6961.namprd12.prod.outlook.com (2603:10b6:510:1bc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 04:43:00 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:208:558:cafe::13) by IA4P220CA0004.outlook.office365.com
 (2603:10b6:208:558::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.19 via Frontend Transport; Mon,
 22 Jun 2026 04:43:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 04:43:00 +0000
Received: from sunce-mlse-vm.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 21 Jun
 2026 23:42:58 -0500
From: Ce Sun <cesun102@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Hawking.Zhang@amd.com>, <YiPeng.Chai@amd.com>, <Tao.Zhou1@amd.com>, "Ce
 Sun" <cesun102@amd.com>
Subject: [PATCH v1 31/48] drm/amdgpu: retire legacy PMFW bad page loading in
 page
Date: Mon, 22 Jun 2026 12:40:20 +0800
Message-ID: <ee5d4f572f60cf4cd81fb8cad6a633fd8be607e2.1782103074.git.cesun102@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1782103073.git.cesun102@amd.com>
References: <cover.1782103073.git.cesun102@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|PH8PR12MB6961:EE_
X-MS-Office365-Filtering-Correlation-Id: 13dcca6d-66f0-4601-cf72-08ded018bcf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|376014|1800799024|23010399003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: nZgn3rwXOiacAsuJMR6qcjE/2XOpmIGi3KvdxU8sRdVCBE/qDLp+/rLrfukD9Jr5ST9W6yXvtqhEkY0qctAUfqPZcQH8HX6mwMjO9LVx3145otuwf59wlvzYhPkIAPKHH/te7qEn2IrJlANAUPn/ZGtSkQnMxz59u7KNMdemjxxU9q+hhZpIYQAHqLPy6Azj89ghX4etZQlDsuf3r5Q+SpmMN7emlbP6JQT+l1s6xuuHr3ejLPygxR1PqfiLmBEQrwUnelanGRKuVX9ljXvMh82DcUtML3Z91q4t9USBPdXmO8BlYYfztkT4lDeAr/q6qoZT4ZriiXsFnRPT1Xf+d6F9rzjJyA0en2HTTtGGH62Rvb5SL8ynDYKgnMVxQf8XrS4AuHLJss5KpwcJRAG70GwfRhV4UvciM53pabWxI6F+qT/VS9up1PTg9heLYRHLVxiMMkZ5tvBkBYkPREA9bdIlF/Kbu+8+6go6W2daN3TC967C1Wx9sHlrsCzBqCsGYTBUumxbi92cvlP5JlWpKJKK7H+7NJIS6h9R+WKIiX8sc/7sq3dVRN91MhCh5J6ZiFTQ5Xw0IcXYVqKYtzBpckoj2YSkKH5/h7PsUYKva81IYbv2EOsEViwSzzzO8dJjtkrqisH534e6ABpGnwB2uhWpaZQPuZfXQLOK6Ms9xKExs8kXkBjYQh4P3SU70HfH0uvoeIsWRF4Hvv8nOCEBzg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: QUHcL8Xrn8eTP/Es6k2ap/r9SMoR7HDI/lu3vz/acm5+atVu//O44ZmGtFXOK2l2ftZ0sPMloeMSecZWWh/hBILuC1ZrVEiPRae4STn48fDvBkWEueBm76hYnVzKZdmI1cwTQbU+fJKqmef4HocKUJmvOBaUvvQXYJc7ZqcCglIidjy0QNs0lEnZ6Bh4d2hCrpHfdgCVcI4Zee3lz1spgrVlkyK/FP1ew5CmC7PzivPWta1cNijsxgqukAQ/byVhbPJvRHbtKxI4NMFXX90nYWUm4J6kWyR5iHdebDjNIX+gtLeZJZie3WdEXnDLKK67uOTLzL4KzabvmZbI9SY/ZBkGTxjiFBX2s5HQjhedWXWfvfzOUc48JA+JpA6l5XGlw6pIsEVoWhgOqt1oxX/+sU2M1s3Mnp2VrDfbBcfOhfkypazi4yFwh2oVvXJwShqA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 04:43:00.0577 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13dcca6d-66f0-4601-cf72-08ded018bcf2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6961
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[cesun102@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2A70F6AC96E

Remove the legacy logic that loads RAS bad pages from PMFW during
page retirement

Signed-off-by: Ce Sun <cesun102@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c | 134 +++++++++++-------------
 2 files changed, 62 insertions(+), 79 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 69fca6aacdc7..996152dadd86 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -3045,12 +3045,7 @@ int amdgpu_ras_save_bad_pages(struct amdgpu_device *adev,
 	mutex_lock(&con->recovery_lock);
 	control = &con->eeprom_control;
 	data = con->eh_data;
-	if (amdgpu_ras_smu_eeprom_supported(adev))
-		unit_num = control->ras_num_recs -
-			control->ras_num_recs_old;
-	else
-		unit_num = data->count / adev->umc.retire_unit -
-			control->ras_num_recs;
+	unit_num = data->count / adev->umc.retire_unit - control->ras_num_recs;
 
 	save_count = con->bad_page_num - control->ras_num_bad_pages;
 	mutex_unlock(&con->recovery_lock);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c
index a99f1bae7a8f..eb8aff637eb1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c
@@ -97,7 +97,6 @@ void amdgpu_umc_handle_bad_pages(struct amdgpu_device *adev,
 {
 	struct ras_err_data *err_data = (struct ras_err_data *)ras_error_status;
 	struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
-	struct amdgpu_ras_eeprom_control *control = &con->eeprom_control;
 	unsigned int error_query_mode;
 	int ret = 0;
 	unsigned long err_count;
@@ -118,79 +117,68 @@ void amdgpu_umc_handle_bad_pages(struct amdgpu_device *adev,
 		err_data->err_addr_len = adev->umc.max_ras_err_cnt_per_query;
 
 	mutex_lock(&con->page_retirement_lock);
-	if (!amdgpu_ras_smu_eeprom_supported(adev)) {
-		ret = amdgpu_dpm_get_ecc_info(adev, (void *)&(con->umc_ecc));
-		if (ret == -EOPNOTSUPP &&
-		    error_query_mode == AMDGPU_RAS_DIRECT_ERROR_QUERY) {
-			if (adev->umc.ras && adev->umc.ras->ras_block.hw_ops &&
-			    adev->umc.ras->ras_block.hw_ops->query_ras_error_count)
-				adev->umc.ras->ras_block.hw_ops->query_ras_error_count(adev,
-								ras_error_status);
-
-			if (adev->umc.ras && adev->umc.ras->ras_block.hw_ops &&
-			    adev->umc.ras->ras_block.hw_ops->query_ras_error_address &&
-			    adev->umc.max_ras_err_cnt_per_query) {
-				kfree(err_data->err_addr);
-				err_data->err_addr =
-					kcalloc(adev->umc.max_ras_err_cnt_per_query,
-						sizeof(struct eeprom_table_record), GFP_KERNEL);
-
-				/* still call query_ras_error_address to clear error status
-				 * even NOMEM error is encountered
-				 */
-				if (!err_data->err_addr)
-					dev_warn(adev->dev,
-						"Failed to alloc memory for umc error address record!\n");
-				else
-					err_data->err_addr_len =
-						adev->umc.max_ras_err_cnt_per_query;
-
-				/* umc query_ras_error_address is also responsible for clearing
-				 * error status
-				 */
-				adev->umc.ras->ras_block.hw_ops->query_ras_error_address(adev,
-								ras_error_status);
-			}
-		} else if (error_query_mode == AMDGPU_RAS_FIRMWARE_ERROR_QUERY ||
-		    (!ret && error_query_mode == AMDGPU_RAS_DIRECT_ERROR_QUERY)) {
-			if (adev->umc.ras &&
-			    adev->umc.ras->ecc_info_query_ras_error_count)
-				adev->umc.ras->ecc_info_query_ras_error_count(adev,
-								ras_error_status);
-
-			if (adev->umc.ras &&
-			    adev->umc.ras->ecc_info_query_ras_error_address &&
-			    adev->umc.max_ras_err_cnt_per_query) {
-				kfree(err_data->err_addr);
-				err_data->err_addr =
-					kcalloc(adev->umc.max_ras_err_cnt_per_query,
-						sizeof(struct eeprom_table_record), GFP_KERNEL);
-
-				/* still call query_ras_error_address to clear error status
-				 * even NOMEM error is encountered
-				 */
-				if (!err_data->err_addr)
-					dev_warn(adev->dev,
-						"Failed to alloc memory for umc error address record!\n");
-				else
-					err_data->err_addr_len =
-						adev->umc.max_ras_err_cnt_per_query;
-
-				/* umc query_ras_error_address is also responsible for clearing
-				 * error status
-				 */
-				adev->umc.ras->ecc_info_query_ras_error_address(adev,
-								ras_error_status);
-			}
-		}
-	} else {
-		if (!amdgpu_ras_eeprom_update_record_num(control)) {
-			err_data->err_addr_cnt = err_data->de_count =
-				control->ras_num_recs -	control->ras_num_recs_old;
-			amdgpu_ras_eeprom_read_idx(control, err_data->err_addr,
-				control->ras_num_recs_old, err_data->de_count);
+	ret = amdgpu_dpm_get_ecc_info(adev, (void *)&(con->umc_ecc));
+	if (ret == -EOPNOTSUPP &&
+	    error_query_mode == AMDGPU_RAS_DIRECT_ERROR_QUERY) {
+		if (adev->umc.ras && adev->umc.ras->ras_block.hw_ops &&
+		    adev->umc.ras->ras_block.hw_ops->query_ras_error_count)
+			adev->umc.ras->ras_block.hw_ops->query_ras_error_count(adev,
+							ras_error_status);
+
+		if (adev->umc.ras && adev->umc.ras->ras_block.hw_ops &&
+		    adev->umc.ras->ras_block.hw_ops->query_ras_error_address &&
+		    adev->umc.max_ras_err_cnt_per_query) {
+			err_data->err_addr =
+				kcalloc(adev->umc.max_ras_err_cnt_per_query,
+					sizeof(struct eeprom_table_record), GFP_KERNEL);
+
+			/* still call query_ras_error_address to clear error status
+			 * even NOMEM error is encountered
+			 */
+			if (!err_data->err_addr)
+				dev_warn(adev->dev,
+					"Failed to alloc memory for umc error address record!\n");
+			else
+				err_data->err_addr_len =
+					adev->umc.max_ras_err_cnt_per_query;
+
+			/* umc query_ras_error_address is also responsible for clearing
+			 * error status
+			 */
+			adev->umc.ras->ras_block.hw_ops->query_ras_error_address(adev,
+							ras_error_status);
 		}
-	}
+	} else if (error_query_mode == AMDGPU_RAS_FIRMWARE_ERROR_QUERY ||
+	    (!ret && error_query_mode == AMDGPU_RAS_DIRECT_ERROR_QUERY)) {
+		if (adev->umc.ras &&
+		    adev->umc.ras->ecc_info_query_ras_error_count)
+			adev->umc.ras->ecc_info_query_ras_error_count(adev,
+							ras_error_status);
+
+		if (adev->umc.ras &&
+		    adev->umc.ras->ecc_info_query_ras_error_address &&
+		    adev->umc.max_ras_err_cnt_per_query) {
+			err_data->err_addr =
+				kcalloc(adev->umc.max_ras_err_cnt_per_query,
+					sizeof(struct eeprom_table_record), GFP_KERNEL);
+
+			/* still call query_ras_error_address to clear error status
+			 * even NOMEM error is encountered
+			 */
+			if (!err_data->err_addr)
+				dev_warn(adev->dev,
+					"Failed to alloc memory for umc error address record!\n");
+			else
+				err_data->err_addr_len =
+					adev->umc.max_ras_err_cnt_per_query;
+
+			/* umc query_ras_error_address is also responsible for clearing
+			 * error status
+			 */
+			adev->umc.ras->ecc_info_query_ras_error_address(adev,
+							ras_error_status);
+ 		}
+ 	}
 
 	/* only uncorrectable error needs gpu reset */
 	if (err_data->ue_count || err_data->de_count) {
-- 
2.34.1

