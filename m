Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDXHEZfpAmpKygEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 12 May 2026 10:49:27 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C0551D050
	for <lists+amd-gfx@lfdr.de>; Tue, 12 May 2026 10:49:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A0810E9C7;
	Tue, 12 May 2026 08:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pptL6FkN";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011061.outbound.protection.outlook.com [40.107.208.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A3A410E9C7
 for <amd-gfx@lists.freedesktop.org>; Tue, 12 May 2026 08:49:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p6/Il8DaI2uRQuERelaJqpmkPli/878BCjVzH+zouk3878VqAR5n/00Rl6SGM02VCB9e+hgTHRvR/wDOI8OEz6SGRwPx90C9w5cNkNCzsLP1OJFLsTaj1DYlQpgmvUKxh3/VWjoIovuXRXomAnhDWZO98CUEQsV2HzHoFA8vWNHJZ8UsIqODRoRRv56aLWFTZrbtP3yZT7Iex2e3dj+N8ykpunQTDzE5+uG0SknKIgKT/wrP41xsb5iHHSOwFKz+LN1fZ9pb6DP9zixoPnTV7bJ6rc97oj52f4UWkiJrjQv+RVbPnojsAw3vvlQUHMDFLY2/dqf1HOP/meIJ7fVaew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pXrZv7g2fYiVJIJK/MKBFqs03TJ5SEcHgjkZwkDTcp8=;
 b=PKPH7PZ8f94ERZdfWI9GvbpIWjV611trEdcZ5ZJUOZU+/SRK9yCnBhchlgbt0H9bAKjRx0zqvJaQPVlqTx7VZYlWw/HgGRoeEIswHk5RShT1/c7RYBO6gQchOqFJ3FFDwyZNuAswE0VPffq6uZ5OWnqMMj7yF4AHoF/iYG/5G9dFUwi5jWVi1ItgmxRVpn7VsvBCtQaV7KT2EJRCbrTuKIlAyuLfzpLrP71coTApemhtWOgjPGTGeSmVPCky1Y8FtqeP/gjtlqA9K8A50byWQ38XgDIFmRTknIU5ZYwYHq/2CV6gBEF9B6Gjd04YyfebgoJXDzY+oeOOeBkdNqdvfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXrZv7g2fYiVJIJK/MKBFqs03TJ5SEcHgjkZwkDTcp8=;
 b=pptL6FkNIEYCV+OYDusQ89Gt3sirnhteRUPnCDLcpW9vlWCwHjK5hmPz/oaTEOp5dnM5HtDT9K34WpGzQ6Ugy5F8Ua4OFjIFoLD412K0G96aSFlqFaFX+H27t/v1/1VcLGI24UnQaFeenwxNSI7F/4x9tWkKG/HGyhbc6DhUKvY=
Received: from SN7P220CA0014.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::19)
 by PH7PR12MB5831.namprd12.prod.outlook.com (2603:10b6:510:1d6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 08:49:19 +0000
Received: from SN1PEPF00026369.namprd02.prod.outlook.com
 (2603:10b6:806:123:cafe::8a) by SN7P220CA0014.outlook.office365.com
 (2603:10b6:806:123::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 08:49:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00026369.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 08:49:18 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Tue, 12 May
 2026 03:49:18 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 May
 2026 03:49:17 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 12 May 2026 03:49:11 -0500
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Alexander.Deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>, 
 Jesse Zhang <Jesse.Zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH v2 5/5] drm/amdgpu/gfx12: Fall back to pipe reset if per-queue
 reset ring test fails
Date: Tue, 12 May 2026 16:46:18 +0800
Message-ID: <20260512084827.1630497-5-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260512084827.1630497-1-Jesse.Zhang@amd.com>
References: <20260512084827.1630497-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026369:EE_|PH7PR12MB5831:EE_
X-MS-Office365-Filtering-Correlation-Id: 632076d7-6ae5-43b4-34d3-08deb0035aa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|1800799024|82310400026|11063799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: YcsBkmbAHm8BU/kBxFkU8XfzbpnyH3gd/NKSd9AuSe7vah6WJMGNNr+23w/WNbIvGhLheIcRenLNkROO1Gy8YlfP7gOTx3IStDXePI3oSAjzKWK9owNtSBu8eWSRqNSt/+w8XK2oiCxiMkLD7lD3TlEwHmtq2gU6eK8VLpjJI3XbiLcmua0Wc6DcngD2u4kzJ21wJ91FqK2SibCaECW0zP5awYUg18jn5ySifQApDox3cJRJi135lCB/MAQvFubvOggDOpr0qy7ejJihQbLhNwXAeVnOCTpDt9vviE49cZJuGPlcDBQfSsJpYUIP9DsFHVticT5qwpIHBQH0HrDfrlkiZepDMDKaOfkFB24b0D2seWe1auwehZWnl638g/Xhefh8WNKXSuW6W5A0AlSiBV0+0TZVuJhSAAHL9Esjq55D0153PgK3cR4JsGv8412G4ORFt5i4eHbPvtjB8kv96m6Z9TTngMug1o2C9xlcmGJ8Y34r4tmInMMnQFEfijTP16Xq6btGzC2j6VN/0NGH3yMqYBuHnT5/H49kReApCXFwX9e7euXStJ60UXWM2f/nYBfQCwX1JBv6zd9Tu2bhetJyPTt7euPcMiH3NV7sIntmLaQLUiH+yGw0l0IS5kD18p3TwTyoHsWElj+ZV9u84U6fy7C3uU4eY9RxPiPjZrUiHEwCCVb1BHKPpI8IHKnfi1/yxAkm1BnTEXC8FbpwuqTr/tc6+YySn+AYrWepdDU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(11063799003)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: HxJ1diN1a8EtidblrS76QPljrxMDec9qAOaSPT0vXTW4v5vfC+eB3F9zdORpXWiYtGQukv52EC/nubyEoLgZ1FYWNX6K1IW32jMR9nLWU3abeNztb7kw6I5s8kc9Tqhv3r1vmj9j4HOy6xKVea8rir0s292q9+/wry38JBZsxGQFrryIfkJbcGHX5zXr7Q58JK11E/Ga3Nhgu30pvcswhXTicnCpA/ieQ8g/Am3pqnQcuTF6X/1FluDUHjO2fz15GGhDHatl4ZGw26SOheNh6a3YJtUwJ6VkZhSe8S0C7cB/0VgFDF3pVgGN0xADQSVqtMVnr+GtfwWYtWyYSrgbcjXNEAwfza5hpjsgz3IHQ6G9c/Td78aIKGwFzwxh775w3wDqWKu9ni3UhHe1urEGJ89OFZfC7gSVWbsL5XZmPcQN+I41DHuKIhJHtA+YhMJC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 08:49:18.5204 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 632076d7-6ae5-43b4-34d3-08deb0035aa8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026369.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5831
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
X-Rspamd-Queue-Id: D2C0551D050
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[Jesse.Zhang@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	NEURAL_HAM(-0.00)[-0.999];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

After a per-queue reset via MES, verify that the queue is functional by
performing a ring test. If the test fails, fall back to a full pipe reset
to ensure proper recovery.

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
index 265ffca70ca2..66dc8098428f 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
@@ -5428,13 +5428,16 @@ static int gfx_v12_0_reset_kcq(struct amdgpu_ring *ring,
 			       struct amdgpu_fence *timedout_fence)
 {
 	struct amdgpu_device *adev = ring->adev;
+	int reset_mode = AMDGPU_RESET_TYPE_PER_QUEUE;
 	int r;
 
 	amdgpu_ring_reset_helper_begin(ring, timedout_fence);
 
 	r = amdgpu_mes_reset_legacy_queue(ring->adev, ring, vmid, true, 0);
+pipe_reset:
 	if (r) {
 		dev_warn(adev->dev, "fail(%d) to reset kcq  and try pipe reset\n", r);
+		reset_mode = AMDGPU_RESET_TYPE_PER_PIPE;
 		amdgpu_gfx_mec_pre_pipe_reset(adev, ring);
 		r = gfx_v12_0_reset_compute_pipe(ring);
 		if (r) {
@@ -5455,6 +5458,13 @@ static int gfx_v12_0_reset_kcq(struct amdgpu_ring *ring,
 		return r;
 	}
 
+	if (reset_mode == AMDGPU_RESET_TYPE_PER_QUEUE) {
+		if (amdgpu_ring_reset_helper_end(ring, timedout_fence))
+			goto pipe_reset;
+		else
+			return 0;
+	}
+
 	return amdgpu_ring_reset_helper_end(ring, timedout_fence);
 }
 
-- 
2.49.0

