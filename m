Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id USW5IFstH2qviQAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 02 Jun 2026 21:22:03 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4176315DC
	for <lists+amd-gfx@lfdr.de>; Tue, 02 Jun 2026 21:22:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=Bo1oaKo+;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7517210F2D0;
	Tue,  2 Jun 2026 19:22:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010056.outbound.protection.outlook.com [52.101.201.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB4910F2D0
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jun 2026 19:22:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xNC2KZyKw9XIvvfv8TNby6aUEU54YCc6fWKxWlF5HBmJidMRMFVVfxXB9/2fXcY+RniGEfzc1KEOQCn+GHzs+OpdXgqjevWITjZSAcv6pqWcFE0bXw+s6uuZ69OkpwMsZlQ0PqXBGMvjXiDsSPcjMIRWVAljYKFpFJBs4GkBy6OLmygQYg7L0hVoVPP2ryeXBpGzp86zrSCV+Fq5Q7MOLDcbKDborZoGMcWxAO9tlHIn2NiCi0tnPZx3hAsGvmllfHhYZ0BZDlWJE05vj4/gFuSOLHtIx0X3YsuEBZCl5JhWnYkLw4lDy5/3PNA03CeH6VDrxGmyytrPcZ0lXH9GqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9q3zh4uOi74blXpEmcXboTzgpSEkEpQ/rHmdJbnYcQY=;
 b=Y9A0wYHX2uyCy/AFXeOAKGSV73pQU6bD0ZSASsz+CJJOiieA9qgoGJVQlG7E67Mdok8IEH+ZeaioK6fyLnX5WanGe9h07yFdzRyqpOAi7Cm5/qYT9yGfYdn4kOP27qWnFiLqtIS/xorWQ0XGeQSKGo6lqSInA+7gZzuiQhIC7tM3SHLoFGIWc2SqNXdjWccJ8/oM6/fWka8USP+aBzH3v/qEVhkQVakXTn8zsZObQbiieJoBMPxtdFsXvcKpRPlFbj+nbcfMQvBQ8Dwd8TVGIUm592ovQpdNIFRSW/m0svwJu3LX/gTGX37puZZPAjVU8J6ml9Ui+wokgC/3Zqj+JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9q3zh4uOi74blXpEmcXboTzgpSEkEpQ/rHmdJbnYcQY=;
 b=Bo1oaKo+fdcg9osFc+JTVbQBQQd49EhxlVQ4hr2JvAj6X9mYlAVa7tt6akto8gRhySYIXYsa9CBfKbHQ2On44ss7SklfxmEFX7QkvTjLNahtCXU8ZlZJPbkEVq3lZ2+Pvr/eDMJl+1YH04BW2aGxH9AVjq5GkeGNH07nbhUTFZ0=
Received: from PH7P221CA0009.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::28)
 by IA1PR12MB6139.namprd12.prod.outlook.com (2603:10b6:208:3e9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 19:21:54 +0000
Received: from CY4PEPF0000EDD5.namprd03.prod.outlook.com
 (2603:10b6:510:32a:cafe::82) by PH7P221CA0009.outlook.office365.com
 (2603:10b6:510:32a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Tue, 2
 Jun 2026 19:21:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD5.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 19:21:54 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 2 Jun
 2026 14:21:53 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 2 Jun
 2026 14:21:53 -0500
Received: from aaurabin-tumbleweed.king-squeaker.ts.net (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41
 via Frontend Transport; Tue, 2 Jun 2026 14:21:52 -0500
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <alex.hung@amd.com>, <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, <aurabindo.pillai@amd.com>
Subject: [PATCH 2/2] drm/amd/display: use unsigned types for local pipe and
 REG_GET counters
Date: Tue, 2 Jun 2026 15:21:52 -0400
Message-ID: <20260602192152.4173277-2-aurabindo.pillai@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602192152.4173277-1-aurabindo.pillai@amd.com>
References: <20260602192152.4173277-1-aurabindo.pillai@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD5:EE_|IA1PR12MB6139:EE_
X-MS-Office365-Filtering-Correlation-Id: 6403cd61-18e9-42d5-5dfe-08dec0dc34af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|82310400026|376014|56012099006|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: wUSkXhLx7L4yCev/6aU9IdTHXdKeXlZZeKfL12D2Cd6e+48lO03hsiuuZtGxnyTvrPIA8cZzq1n7SIOT7gh95J02edbeBYbt81QhGe1mwfdRCocm6f+cG2pHMkxZTFOls3qQTAm7c8SZX0zplNDHBW32oF2SQ8lAkDwf8/HBQrUUBHQ6jvqt5XVUOEJEshMyUzn+XOqHBNaz06k5TE6T/QevmHBpRz8a9CRXgkILODWmNqo3C4lrSa51lCeRAeiza1QNDFhaJukA2u7TpRA1sWtk9zjITRKKKmhth5hVsVf5JGwFEM80sX6Rfq42YZzEGZLOlcSFnWJKKHqBciZ+CN3J8jTAz2fyTvYTinfC+5YF0/BrF7cQc0/ac9bGMxpkJYya6V79w9nLiStZLJxLLtzvznhi1LcyghhYxRJlyTOdCRKnOYjfKcBeMb5s9+wyxjdVcodY4Gs4FaB6TyTrY/DHAX/mYUAsIwuuITp8TH2TeWILdYyTh74PUuzHdmW3OM/G91RvQniE8sPmn03ZNhDYVS1WJfAy4IoP295qdOWxcbzpaWo7OQan1CZS3weje5t8m4bDq0vRXa8ja2IlZ07QzzEFtEPyRKtLP3ySgtkx/qyuH+DkUk3ciP6MsQPG1DH4q9Ba9tADTdosjyqt+/OqNf6+z3trTwIH0huaensmuA15u7NJMP/kQa8W8KYfGDmV5omUfzzQFhQOGPieF6m6o9hj7OJfxqsny/ztbkI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(56012099006)(11063799006)(3023799007)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: M+GcdElncthoSa3dYoAU07KAOPIgggz8TfjVSFDh3euyglVh9pnGUmNXovak4AIXJcft8rr/BRgAxHwiAflqKqnT0sZiy4KefIMIETE2uBKT7R+evMnavlXRybGJ3xaJAaXyEm+iUe/nFIWqRc94SH5r7QY2PpK9grd3LQqdY4ZNli2XXIl9ob+UAC+qMGVMqjTUTb8VHXAtgs86KymxESrfp9rlmlfIib8IwnfPbFB8bsUElwxMHttkZoX45YxIqGaegskoWaLyTi6FM5RMMhhw/9SsoSxSoe7BiWqIdcCHHgSTQo8JPipHCwG7fsFtXlTGEhIMlDcMHWmjUcMCTAq1hqamzW6DkT+kggKc3Zu5Lzjg9KUJ7a0LoZRFUenpVJ318Oj56+rQ+OFWwzgd65SEsnL5LCk67W3k2AeelknYuhZO7d/CYP4Woek6fDQ2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 19:21:54.1569 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6403cd61-18e9-42d5-5dfe-08dec0dc34af
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6139
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
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alex.hung@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:alexander.deucher@amd.com,m:aurabindo.pillai@amd.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[aurabindo.pillai@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aurabindo.pillai@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DC4176315DC

Two small type fixes that match how the values are actually consumed:

- decide_zstate_support() iterates from 0 to pipe_count, which is
  unsigned. Make the loop index unsigned int.

- hpo_enc401_read_state() reads HDMI_PIXEL_ENCODING and
  HDMI_DEEP_COLOR_DEPTH via REG_GET_2(), which internally casts the
  output pointer to (uint32_t *). Passing the address of an int is a
  strict-aliasing wart even when the sizes match. Declare the locals
  as uint32_t.

No behavioural change since the values are only compared against small
non-negative constants.

Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c          | 2 +-
 .../amd/display/dc/hpo/dcn401/dcn401_hpo_frl_stream_encoder.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
index 5f088d113b9f..38c79239004c 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
@@ -1060,7 +1060,7 @@ static bool is_dtbclk_required(struct dc *dc, struct dc_state *context)
 static enum dcn_zstate_support_state  decide_zstate_support(struct dc *dc, struct dc_state *context)
 {
 	int plane_count;
-	int i;
+	unsigned int i;
 
 	plane_count = 0;
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
diff --git a/drivers/gpu/drm/amd/display/dc/hpo/dcn401/dcn401_hpo_frl_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/hpo/dcn401/dcn401_hpo_frl_stream_encoder.c
index 28cb14dc87b0..85b7a44c0a11 100644
--- a/drivers/gpu/drm/amd/display/dc/hpo/dcn401/dcn401_hpo_frl_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/hpo/dcn401/dcn401_hpo_frl_stream_encoder.c
@@ -143,8 +143,8 @@ void hpo_enc401_read_state(
 	struct hpo_frl_stream_encoder *enc,
 	struct hpo_frl_stream_encoder_state *state)
 {
-	int pixel_encoding;
-	int color_depth;
+	uint32_t pixel_encoding;
+	uint32_t color_depth;
 //	int odm_combine;
 	struct dcn401_hpo_frl_stream_encoder *enc401 = DCN401_HPO_FRL_STRENC_FROM_HPO_FRL_STRENC(enc);
 
-- 
2.54.0

