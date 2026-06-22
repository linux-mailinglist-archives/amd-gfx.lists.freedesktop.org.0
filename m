Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q2RUEWG9OGpnhQcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2026 06:43:13 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E630A6AC986
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2026 06:43:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=5E7JmyPH;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01CE110E483;
	Mon, 22 Jun 2026 04:43:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010039.outbound.protection.outlook.com [52.101.56.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 149F210E47F
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jun 2026 04:43:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=boLGUdGOJBP6q/9XoQvyjCDKtGk9iZAY9KGL4rWrHANHLK/njpukJrmQF4AlF17/OgzO2u0DhmVSDdvYtSDAlpgsPnJYqoJ7NM3w0I5/kSdMjcH9ibhpZ+xdUZrB9moil3BIuQ2ya6o3Pus+TYWwuKOw5fHyOtyeradXY62H1PTkhSybwqMrWnWk7FVXuU8OlZWs0PHdBh8zT3RbmzHCslQ/VmxEDsryv79M97n7X7RLkMaVFK5ZCDyNvoUSAI74XLqr3agUlKPDGvryHi2kF8JKwo69NAL3GrU+4iTbXn4AyKboHuRW8lC/BjesN6DY6w6ECr61GJHLXrfeVir/pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i6GPD/4IYbow1VonjwO7dKq9hmdDuZKHI8CDoUneL6U=;
 b=GM8zyoAUMmz073su9gYOojiN/Xbd1MVPEuR9igGxLjJS91nCn6VqHwAf4dsWrOJ4Xh2GybG/cwOkOW8Y6KDxnhpwDEx6qmiZTkvwEpv9OPO/no8W/H8ZEL0mSBpA4uLBAzKtYpN6EQSK3cbeMndVt2QblnJWGAK5HHaVaCBp6M9kigbuvlFin7yquBFoJblwwX9dNHU8zw6DwGxTATXuFzgLjjTsLgeLMIbZ/rIvp4vMAEP1eivVzYvLT6qQffBkdQbq5cX1yCI17j/K9Z7Hfuv0Vi2jit7fnFZQZKvMyoV+iVEvIC+p1xESe9e3YgKNjV62dY67OeCgnBFVVdGGLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i6GPD/4IYbow1VonjwO7dKq9hmdDuZKHI8CDoUneL6U=;
 b=5E7JmyPHryMKE/dSgnglhUGzH6/RZwQgYe9Wu8GCreeqFeDoqhdRlZO0B7mcB7ZXDa3ED0MpnqrNbGTTi3bepuB8OldmqUybSd3mR131Ity303GiA1F609hjz9r9XNxATeb5nwyCFcyGPa6D9iAQCQlrcBlDiV0tZonNDKxpTRY=
Received: from IA4P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:558::13)
 by SA0PR12MB4414.namprd12.prod.outlook.com (2603:10b6:806:9a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 04:43:05 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:208:558:cafe::30) by IA4P220CA0002.outlook.office365.com
 (2603:10b6:208:558::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.19 via Frontend Transport; Mon,
 22 Jun 2026 04:43:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 04:43:05 +0000
Received: from sunce-mlse-vm.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 21 Jun
 2026 23:43:03 -0500
From: Ce Sun <cesun102@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Hawking.Zhang@amd.com>, <YiPeng.Chai@amd.com>, <Tao.Zhou1@amd.com>, "Ce
 Sun" <cesun102@amd.com>
Subject: [PATCH v1 34/48] drm/amdgpu: retire legacy MCA IPID parse global
 interface
Date: Mon, 22 Jun 2026 12:40:23 +0800
Message-ID: <19efb27fefcf5dd29a5b2f90ff6b6ae3c31615fd.1782103074.git.cesun102@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|SA0PR12MB4414:EE_
X-MS-Office365-Filtering-Correlation-Id: f14189f2-058c-4d9d-055b-08ded018c014
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|36860700016|82310400026|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: hhHYPXUs9QhaTyahV+3mMloC80z44VgNTKcrD+gTdbvGc0YK3IzX/Rp2fm2q9nEoUMH//hjTLFSqvnqy0ORLBXGACbIHzF/NpBTXlVIJPMLT2mSSHT6KK69mR2a8Sc+BTr+IV78AFiuYJGt9Q9pfdgQVo6awo6lZptzH1MgB1EIYZOg0/4KDdrinhDzAt9dLYsUocYyJ8lA9sYxNMjlS5SDGu99B7bz7Qj9fmmQJ2kyv4xd2uww6Gtb8MmstwA8Dkr3S98lzxrpIpjxzhaEsOWRV3QYRtKHM52lgXMTMjp3BPge39VdAAkkZaWAzIRrHDSBbJZQ55gsdx/Oi4ChqXjsIwC+9e9uqvzldfvCc/p3B6TgyzxMQRhV9iFZAw5PTVrKBu43F5OF2mGdo6BZV/UGQ9ItoyB0iqsN77sbZeOYItLheS/E+ARqqDz3cVKxROaJFYvrRdOeEDVK2L8ZOKOzNIIQTZx+1VFc1BAUQ/wH89rgYxnrPhuOLym1j1aN7hEK/+kdO/RR/j6thOVxGOgsQwu8Fc7vaEL6HrcTRtvEGw95BbmX5fpEtHsL4x45Llni049G9Wu3n6g4acn77QulpmMV+AUjYp0TvNQzL8lY5TLoSKkWyiUmXHNQzvVFikVmTMPYq3uzkaeerw14gs7Zy6npghiwagpfu4kDliX3uNz1lDINRpXgd+aMrgcYCwd+DJKo7HZpwymOoLiFbpw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(36860700016)(82310400026)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: kpAvtFeNoD8EuCrbXreko91AfYHeFr6b84lSvzCPouIg8vIb9ScS1K+5WuoxtEEBGznsnQwLAZtZR/Tskvynq8gemNf4EGuuy3AanKkwTm+3d/c/9WsJJkP/WzLKIujGzno2cJC1L5bQ2Jtr+X8eHey0JgRkfu8/q+mcYHAEbZVYjrKxhGmGka40s+be04s3GLHqWzyXySBF6lsqYtsKKK5Jil3kGfpINxHlRHbjtmCYuR+OPyPfkzMEE2buANP3e1a2cOMUUKJlMMq3uvl3obBU0mrlWDW5H+SgG4XGihy3B/zTWcWDiJb2WIpBhKMUPBWu+Gqf+1xYYpu/IJ3h9CTffPVtrtrs+r+i8N+LN5blN+NL9QW/I7kJdXocDOJ9kFsJS7N+CJoYjOztCmc60gOrxn0u/v/x+qmdPwE6qP6c+PnwMu1lKJIex5rkuvaq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 04:43:05.3086 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f14189f2-058c-4d9d-055b-08ded018c014
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4414
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
X-Rspamd-Queue-Id: E630A6AC986

Remove the legacy global MCA IPID parse interface

Signed-off-by: Ce Sun <cesun102@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h |  2 --
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.c  | 14 --------------
 2 files changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h
index cdaee4a049c3..cf06d5f856f9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h
@@ -104,8 +104,6 @@ struct amdgpu_umc_ras {
 	bool (*check_ecc_err_status)(struct amdgpu_device *adev,
 			enum amdgpu_mca_error_type type, void *ras_error_status);
 	void (*get_retire_flip_bits)(struct amdgpu_device *adev);
-	void (*mca_ipid_parse)(struct amdgpu_device *adev, uint64_t ipid,
-			uint32_t *did, uint32_t *ch, uint32_t *umc_inst, uint32_t *sid);
 };
 
 struct amdgpu_umc_funcs {
diff --git a/drivers/gpu/drm/amd/amdgpu/umc_v12_0.c b/drivers/gpu/drm/amd/amdgpu/umc_v12_0.c
index beb89b0f9f3e..67bdf7303e6b 100644
--- a/drivers/gpu/drm/amd/amdgpu/umc_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/umc_v12_0.c
@@ -197,25 +197,11 @@ static bool umc_v12_0_check_ecc_err_status(struct amdgpu_device *adev,
 	return false;
 }
 
-static void umc_v12_0_mca_ipid_parse(struct amdgpu_device *adev, uint64_t ipid,
-		uint32_t *did, uint32_t *ch, uint32_t *umc_inst, uint32_t *sid)
-{
-	if (did)
-		*did = MCA_IPID_2_DIE_ID(ipid);
-	if (ch)
-		*ch = MCA_IPID_2_UMC_CH(ipid);
-	if (umc_inst)
-		*umc_inst = MCA_IPID_2_UMC_INST(ipid);
-	if (sid)
-		*sid = MCA_IPID_2_SOCKET_ID(ipid);
-}
-
 struct amdgpu_umc_ras umc_v12_0_ras = {
 	.ras_block = {
 		.hw_ops = NULL,
 	},
 	.check_ecc_err_status = umc_v12_0_check_ecc_err_status,
 	.get_retire_flip_bits = umc_v12_0_get_retire_flip_bits,
-	.mca_ipid_parse = umc_v12_0_mca_ipid_parse,
 };
 
-- 
2.34.1

