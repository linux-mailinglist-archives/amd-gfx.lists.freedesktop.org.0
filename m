Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GB5kHxQ5i2kKRwAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Feb 2026 14:56:36 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D65E11B964
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Feb 2026 14:56:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E2210E588;
	Tue, 10 Feb 2026 13:56:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IcyKwzwX";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012009.outbound.protection.outlook.com [52.101.43.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882A610E588
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Feb 2026 13:56:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IIYTQRNlEqQeBrWzJsg7z2aAOj2gXwmEv2SPcmSRHeG7D7WpC5w/BYv0ust+E1wNp0SKFPx1u6Hvhl2+fmAOHNuKCzmMgFtvtfVjUG42hNCc47e/DS8PGus957pav9a2ujzlzv+pVPFmTklTssGycxmFt/wnZBY5sbemT/659YYynrhgfZLYrOzvSaMrGzkjKd6MyPrMTBFM9V3xiFAOLVpANqPwEziWDv7YigsGwBVyUAzOhNMGHBPkr8QhP9XBgbgPnQ653G2Ahq62Bi5XY21U+cOvc/Ckp/btvYSCm1T+Emy/b0jrvtyUYBUdxdm3W7Nxidu7sD2zoh3w8Ca5xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMszr9jsHW/Nd6ljqFbkfOrUYzp+iydBkph9KkiyJMM=;
 b=MrhSi0Ep7QawiPXQSPFhErTq/6IXveuBTckqJfV9QgGBs0N28h5COWXhzv4RdEyiebv+6HGpa+o2bXzK52lsOkPpcuxq0GtaEzfJR9SVhs1coOA7FAvMi9ue/3LVdgu+ls12vmMGOdq1UIy7oqsLx33Zg5A+TfYzbr+qnPb35Wp6jK1d4x5nmXyr7ys8vrqD2l9EMzBGDUjHciM3/4pUha/cihX0wRV8/gFBfFNXZ40oYGQNzZIgSiQ08J20SPc1N5VqNhsCidH8dvYGb833Dru4EUGZzsS1lvido0iXPAP6+mRdj9mVNTE+faQJbQJr8Ht/kxkXRHF0LwKPcJmpyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMszr9jsHW/Nd6ljqFbkfOrUYzp+iydBkph9KkiyJMM=;
 b=IcyKwzwXUi+1MlDtzajMULVyCk2fK6uc6xIR4VNJzud5Wl1mRlU75HCBKM6HtmgFJi6IvnAvjaQqnZSQ5ZexKfCMYS4hzzuoFwmF3re3gRCe9KtFkqlhQYji/yiGtYp5YygvxOHQDNz41qFTAbQRluIy3RECq7bErvvMbksDPdM=
Received: from CH0PR04CA0102.namprd04.prod.outlook.com (2603:10b6:610:75::17)
 by CH3PR12MB9316.namprd12.prod.outlook.com (2603:10b6:610:1ce::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 13:56:27 +0000
Received: from DS3PEPF0000C381.namprd04.prod.outlook.com
 (2603:10b6:610:75:cafe::25) by CH0PR04CA0102.outlook.office365.com
 (2603:10b6:610:75::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 13:56:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF0000C381.mail.protection.outlook.com (10.167.23.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 13:56:27 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 10 Feb
 2026 07:56:27 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 10 Feb
 2026 05:56:27 -0800
Received: from ray-Ubuntu.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 10 Feb 2026 07:56:18 -0600
From: Ray Wu <ray.wu@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Roman Li <roman.li@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Tom Chung <chiahsuan.chung@amd.com>, "Fangzhi
 Zuo" <jerry.zuo@amd.com>, Dan Wheeler <daniel.wheeler@amd.com>, Ray Wu
 <Ray.Wu@amd.com>, Ivan Lipski <ivan.lipski@amd.com>, Alex Hung
 <alex.hung@amd.com>, Charlene Liu <Charlene.Liu@amd.com>, Ovidiu Bunea
 <ovidiu.bunea@amd.com>, Ray Wu <ray.wu@amd.com>
Subject: [PATCH 15/18] drm/amd/display: Correct logic check error for fastboot
Date: Tue, 10 Feb 2026 21:50:08 +0800
Message-ID: <20260210135353.848421-16-ray.wu@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210135353.848421-1-ray.wu@amd.com>
References: <20260210135353.848421-1-ray.wu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C381:EE_|CH3PR12MB9316:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ed563ea-f154-4fb8-da42-08de68ac2fc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BkAfyB/cRhsVrqeFuOqbXCsEKYy96bCOPCKHxe/W2FdIlRnGs1Z+tnsOJrTQ?=
 =?us-ascii?Q?IGbpzXPNfHLEK9kb+yHXM1PrVdNMe6oNRBcAERSOF7XmW0N7oHCVLk6yp7iu?=
 =?us-ascii?Q?aVFqO+fIs65VU/vlNwEI/XiI7rf7kIDVe0C2zURizFuFoGoT+GKXVcEGbq3L?=
 =?us-ascii?Q?O5r/OJO4G1FWYrauTSt7FJVcLws40ghAS/LoDSIDFCHUS/pgD/Fm/RB8a/3g?=
 =?us-ascii?Q?FnGiigyuHb1IGnW2+ZwZt6skTVLvvQwrdpSwTN8OqnV7pvBz17TBOkped+v7?=
 =?us-ascii?Q?u//VYPKrDWtJW9f/nvWeMh8v1+Xh4XcTjQdK9jycKWp1MpVFXO05V14gxzzo?=
 =?us-ascii?Q?6nIj7+x73YAXR8BjGyRcmgeqag9nHHCcun7FNtNGkChHJzl3sytnwbBi9KZl?=
 =?us-ascii?Q?o5eXiuFHIFr55DOmgIsB7B8pvr+uOKIKzZ+G3lWSiGEMMcMLt638cRdWnYeK?=
 =?us-ascii?Q?fKwzZCBx/awhTFt2zKVrndPU9itOF8IlPr4BpVRF6uWWW8BeKoNE2UIX9f7W?=
 =?us-ascii?Q?q/bj92/aCXQqrn9jjUSurRvXiwROcKs9PlEek9wBG0dfoPduV9gcQ92+egRo?=
 =?us-ascii?Q?8SxrAS/UC4tQHbnwsz5VaDTPkN1rl+5T90vP5/VdaAJmmpDi4+tt7aF9CkN8?=
 =?us-ascii?Q?WgQlc10inpWsRvWnOqZebR9Z+0/LtXSbCxK97iZuDjZ5RKNLLuT5YdOIoPfA?=
 =?us-ascii?Q?vSAuSECUxJpe8f+vecx5xIMMDWeLOT5/Eo/Ar2giTZUYfE+T6eq68xRkGg2J?=
 =?us-ascii?Q?kwpVCMYTYF+KGaLgR+qSyN3VozzBcLn80afbbBG56Z0+VmLGn46K+WOKwb25?=
 =?us-ascii?Q?QF1jYfUyRCRmtTKss3UPNwgcYA3GCTFHJ0CJwxw+xR5sP9IamN6p+QakZ6I4?=
 =?us-ascii?Q?+AiM1XCYmUR5dZMluE5BGQKea9tHNtHzzEgLN3JGWypRXhC54mOUBolGVex6?=
 =?us-ascii?Q?wWNRRHnUX6xawfwSvVkkHNRfNPiukomWf3MLe+t4o3M1IKJLuBcgInROG1QN?=
 =?us-ascii?Q?q2EwOmy3CPd76EEAOBttgnHV85s5ZYKl/tDrM37IcdDxQgyYGkxpZai91V4o?=
 =?us-ascii?Q?8aLJi95xcA+CjrOfw8Ytm6tExXkLd17/kPfaQjdYxMHYszfAf4VZpZ3oJ1EF?=
 =?us-ascii?Q?Dk7B9zhOkul5SxYHBz3TdieH5tADY71yS7+C690KtNkC6i/U62opd8V+Dgt8?=
 =?us-ascii?Q?05EpKoZbeTDKNjSUsvbjIsghEYA3M8SZSKF/v7IdyUJgY8NR9axomWKZTnk6?=
 =?us-ascii?Q?vGOQb8hgROjuilFjVDP4S38d/97II551Ke3FEd9ESIilv8wO+iVIfQS9wtJ6?=
 =?us-ascii?Q?bzg5zpQNrPA2g4Em2vvNL1TZ/eg/xc8cSj2i0bjrSVGQQPZGfOdtY9EdjUPP?=
 =?us-ascii?Q?WCg29Ypp5ANG0D2ihdXwiX2yup6vaSKTkupgd/kWqEZ/g/qFiqbG3U37nygI?=
 =?us-ascii?Q?+ciIicbrDYYH9uQqlnl+QZWru/Rx1riepXgzYzaYB+/Zu3bsmv6WMEaJpWz1?=
 =?us-ascii?Q?r/3dXCa9nbdOIL+Y2I7gawfjJe4xNQtVP53IdNo1SI5USqmioVBR5UU/tFW2?=
 =?us-ascii?Q?IxhRHVeoor8IX5Tec3z2CTQthKPNqmNZs+r9yyuR1CBq4zGqtrEmv/eapi6Y?=
 =?us-ascii?Q?B2bIH4PbcJUJtxvs+nkGW38rcaKG31akBWIzhKlX24pTlL42jwW0C+NsdWkg?=
 =?us-ascii?Q?ioB5uA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0DE7RJ5Oi3hFy/ZPPK1xDcan/6tDE9z+u5TupMbmBPfo5Vp1HkgpD6DEJdl5x6Fzt0h/Jsjm8mb5HsIJX7SC4ADn0KmNR8Q0JdrWby88FBqIBevjFIlngutz42VMtxPFjBT7Ajm7haO/XltkI8sJukEaQVKbDu59WywcxrHzLwBa5UlJO9enPaUeVizC1xdMDXXUe7gMu98+P+eTrL3vrojeBTtm4Rdi3DejQSjAmRSAeeDIEwNoiaf927TsMeLl6Q5HTnlnxtRmk88m++jrKMz/5RLtJXiWemLFdsC00f9BJw8VCJ4QhDTSoArDP18VjSy6Z1lBZdn9+2Yz/nD9DzXqp/HMoOSlaWJf3api88MSfF2Q1dZZlhAzhCvezMAkQEjKFkQsceTQJ4wgjwMV3+ZAx/d+lIh+khoCCryYKGtpKyYaRrf3EUekZ/WZfydc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 13:56:27.7667 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ed563ea-f154-4fb8-da42-08de68ac2fc5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C381.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9316
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ray.wu@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email];
	TAGGED_RCPT(0.00)[amd-gfx];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1D65E11B964
X-Rspamd-Action: no action

From: Charlene Liu <Charlene.Liu@amd.com>

[Why]
Fix fastboot broken in driver.
This is caused by an open source backport change 7495962c.

from the comment, the intended check is to disable fastboot
for pre-DCN10. but the logic check is reversed, and causes
fastboot to be disabled on all DCN10 and after.

fastboot is for driver trying to pick up bios used hw setting
and bypass reprogramming the hw if dc_validate_boot_timing()
condition meets.

Reviewed-by: Ovidiu Bunea <ovidiu.bunea@amd.com>
Signed-off-by: Charlene Liu <Charlene.Liu@amd.com>
Signed-off-by: Ray Wu <ray.wu@amd.com>
---
 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
index 4659e1b489ba..4277b6761522 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
@@ -1964,8 +1964,8 @@ void dce110_enable_accelerated_mode(struct dc *dc, struct dc_state *context)
 
 	get_edp_streams(context, edp_streams, &edp_stream_num);
 
-	/* Check fastboot support, disable on DCE 6-8 because of blank screens */
-	if (edp_num && edp_stream_num && dc->ctx->dce_version < DCE_VERSION_10_0) {
+	/* Check fastboot support, disable on DCE 6-8-10 because of blank screens */
+	if (edp_num && edp_stream_num && dc->ctx->dce_version > DCE_VERSION_10_0) {
 		for (i = 0; i < edp_num; i++) {
 			edp_link = edp_links[i];
 			if (edp_link != edp_streams[0]->link)
-- 
2.43.0

