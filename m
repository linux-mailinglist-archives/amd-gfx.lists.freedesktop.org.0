Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Uj8cHEuzKmrKvQMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jun 2026 15:08:27 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A89672358
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jun 2026 15:08:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b="BKNC/YWy";
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A04310EF1A;
	Thu, 11 Jun 2026 13:08:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013040.outbound.protection.outlook.com
 [40.93.196.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693FA10EF35
 for <amd-gfx@lists.freedesktop.org>; Thu, 11 Jun 2026 13:08:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kmicb5qarxu9bBH8tWHKu9apjOj7RVFTF3dq05OsQoFOXj6A0v0AvSUdKP2RoLAx1J1FQ25Risx9eJTOVbVTN0gnsLLOibyTR60r681O4q8Ia7Vhlqf6Lx9xjOwHorgbFdNUK4un6LWROyb1Ddz353TZSHglNjBhB/No2VFv/1Cv09cww4uKTz47IOycnyK/L7sDss2Pmf5+1oOuQfqVkoyATS1429PuES98bYyRPI631fb9E1pZW4UjGOsqKk0JhDHrmUCwl6MzAbGtpzXxuiMNouKVC/HQQB8HucbrefrF51336lrEjn2HfU41YsFhMYnP16F37jSJHA012onEdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jEShaIsGOB/c7S5xZumSxLDAadiUHzR4H6Ly1BUErps=;
 b=Eux29/yduUdWITF/DnyDXdM5De1q0gG4wkjz7ryhXn618iBv4l7s0b7zWmAXYK+++u+I88U5ITWi5uUgdK9dr0gPM+ACCSZ1zneG6Dym1VIIQq9LZfyJEOwiqP2Q9EeUWi24BAYqzj+UTGfUlMEa0/Xm3oJdbBGUv5T+CTWG5E0OcjK29pzbvatelF+ed3h8nGXJm6mS1T2378zOqbJxPr/UkdncEnnx1CY3AttmjI+U+VWG2OJNh29gZ3BN40rEHfKLXN/L0nzDzeamHeuTwvhxiQysdI6TS0YWJqIUQCnb4+b4EoYjf6bW3bEhUwQXbdn44okWs7FSH+uHLeGRBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jEShaIsGOB/c7S5xZumSxLDAadiUHzR4H6Ly1BUErps=;
 b=BKNC/YWy/hyESKfVo9cifBwisLHVZDToNMLNvBI5bG8tXxShfVvwi0WDAjezdmmL0gvUbg/D0rRpHazh/x8bftu6GcRWST2jMMuwfbU97FM44D3i4H8cZDX9EaB6LC1KuwD/ap6Zkwcy799E/W0LlWrcfknwg87h5UlgaPan8YI=
Received: from DS7P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:1ca::17) by
 CH0PR12MB8508.namprd12.prod.outlook.com (2603:10b6:610:18c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 13:08:19 +0000
Received: from DS2PEPF00003445.namprd04.prod.outlook.com
 (2603:10b6:8:1ca:cafe::19) by DS7P220CA0003.outlook.office365.com
 (2603:10b6:8:1ca::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.14 via Frontend Transport; Thu,
 11 Jun 2026 13:08:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF00003445.mail.protection.outlook.com (10.167.17.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 13:08:19 +0000
Received: from sunce-mlse-vm.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 11 Jun
 2026 08:07:44 -0500
From: Ce Sun <cesun102@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Hawking.Zhang@amd.com>, <YiPeng.Chai@amd.com>, <Tao.Zhou1@amd.com>, "Ce
 Sun" <cesun102@amd.com>
Subject: [PATCH] drm/amdgpu/ras: Estimate RAS reservation when report capacity
Date: Thu, 11 Jun 2026 21:07:30 +0800
Message-ID: <20260611130730.622904-1-cesun102@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003445:EE_|CH0PR12MB8508:EE_
X-MS-Office365-Filtering-Correlation-Id: c6b08874-30a6-4e1f-db39-08dec7ba81ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: q54WkG/tpSRqWS3fzV8dFfMQSsp04qbUcIkAQ2pHi5ZIskB2pBwOW+2Mn6gu988LUyT/CqT8OwXMQzb9sm0TJajc7DAlGOIcNas3p9MssO636bQoVotgaAQiOErkYbQpBQhi2boovMv9R3TuFI40woMsRZZqTzWVEFQfGdZwcerAKppD7GIx/MVOLe0ubbebVbQ1IOtgqPRXyFXtnLfon/H+CNLlan8wIRw4vitrU9jSC6nXqjwQqzoKfZxw4NCj6GWN/EnFMzQV9Q0PTIji5ajDrIo009LdjjAi1njRBfFioc85PPYkHsU9D3BdREK2dcMX5a86VVwvRfEZFnkVQRkjQQvZIJbV+GCLn0vcoUf94he5URKEFXdPUFm5wWrc5bIODQHLu3xYUXROrig+O7hpFGpfvCiDWGdb3NeeBXo+G98G1nXlEy2FoRZXan622F4qmUtjfl4fRegKAJXqFWxsOJ7qi2WqiXb9xx76qiCmNUE3Csd5+WixSNdankWcUNGRu9g3h5PrZvCRKDGg1M1RGJaX6DBfpV83G0dgu0w5cVG8zgJvFnAwQhUb/zOXGrmFNmnaTN0mgbdmyVkaoIFINpBpwJubu8J4ljtfMFrUdDgKj2G3f9CMndxVcdcRERMHNNpJiA3zckxiYGHUOnDHehdjy92iZM1EQyrijVrX8VRxZIJmSz3jPQe/OHzcj+WnE/hXo5OJJHD4CG/GCF3j+ZA44E1ux0kMYcZsnts=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(11063799006)(56012099006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: tOhWAoYTh1JRZ5VQAWTylqMnnODCfPRawVP17RH07lGqG1fr/xBLJbPT0lxVe9ONzNSfGW6gNHLalN1i4uLdW1Ykymgcc3o7lcW4sbBCtShbfkZo7M2Ux2K2s01jftCO4C/aghiSpAlSrlfG2cnPQE4nc+FkeF9WwG6ZX6aN7Mf3DwMsv571JOm1w0QaCwBiXrkou+WOnqEGhfAhckC0ZGvpFp4AsEeJ6CM8EmIKX77VV/JbrubZ3RvxrSj7pEMh7TFci4193yefGWWavCthJ/TGTkHVKHEB3JRx+Ltp6oZSyzFRSDw+R41q3oFISYd3Ll8hRrxoT+v+cxg9JGHs5cq4uZOLFlfON98IAWUL9NfWIo07ZU3izJ6DQGTbuQnnuqGEPeJH0v1vSfiWIUfRVQpwNOc8fFQXuqsHiSN4/wxsPJ8XaKFxvv1IS9XAA6TU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 13:08:19.1567 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6b08874-30a6-4e1f-db39-08dec7ba81ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003445.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8508
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
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[cesun102@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B7A89672358

Add estimate of how much vram we need to reserve for RAS
when caculating the total available vram

Signed-off-by: Ce Sun <cesun102@amd.com>
---
 .../gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.c  | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.c b/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.c
index 26f554a80e1a..f627a97797ed 100644
--- a/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.c
+++ b/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.c
@@ -95,11 +95,35 @@ static int amdgpu_ras_mgr_init_aca_config(struct amdgpu_device *adev,
 	return 0;
 }
 
+static uint64_t amdgpu_ras_mgr_reserved_vram_size(struct amdgpu_device *adev)
+{
+	struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
+	uint64_t reserved_pages_in_bytes = 0;
+
+	if (!con || (adev->flags & AMD_IS_APU))
+		return 0;
+
+	switch (amdgpu_ip_version(adev, MP0_HWIP, 0)) {
+	case IP_VERSION(13, 0, 6):
+	case IP_VERSION(13, 0, 12):
+		reserved_pages_in_bytes = RAS_RESERVED_VRAM_SIZE_DEFAULT;
+		break;
+	case IP_VERSION(13, 0, 14):
+		reserved_pages_in_bytes = (RAS_RESERVED_VRAM_SIZE_DEFAULT << 1);
+		break;
+	default:
+		break;
+	}
+	return reserved_pages_in_bytes;
+}
+
 static int amdgpu_ras_mgr_init_eeprom_config(struct amdgpu_device *adev,
 		struct ras_core_config *config)
 {
 	struct ras_eeprom_config *eeprom_cfg = &config->eeprom_cfg;
+	uint64_t ras_reserved_vram_size;
 
+	ras_reserved_vram_size = amdgpu_ras_mgr_reserved_vram_size(adev);
 	eeprom_cfg->eeprom_sys_fn = &amdgpu_ras_eeprom_i2c_sys_func;
 	eeprom_cfg->eeprom_i2c_adapter = adev->pm.ras_eeprom_i2c_bus;
 	if (eeprom_cfg->eeprom_i2c_adapter) {
@@ -133,7 +157,7 @@ static int amdgpu_ras_mgr_init_eeprom_config(struct amdgpu_device *adev,
 			div64_u64(adev->gmc.mc_vram_size, TYPICAL_ECC_BAD_PAGE_RATE);
 	else if (amdgpu_bad_page_threshold == WARN_NONSTOP_OVER_THRESHOLD)
 		eeprom_cfg->eeprom_record_threshold_count =
-				COUNT_BAD_PAGE_THRESHOLD(RAS_RESERVED_VRAM_SIZE_DEFAULT);
+				COUNT_BAD_PAGE_THRESHOLD(ras_reserved_vram_size);
 	else
 		eeprom_cfg->eeprom_record_threshold_count = amdgpu_bad_page_threshold;
 
-- 
2.34.1

