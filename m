Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +1g6Fck+TWouxQEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 07 Jul 2026 20:00:41 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F315571E735
	for <lists+amd-gfx@lfdr.de>; Tue, 07 Jul 2026 20:00:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=cisOSxa2;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 575F010EE87;
	Tue,  7 Jul 2026 18:00:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010067.outbound.protection.outlook.com [52.101.56.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5909910E4EE
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 Jul 2026 18:00:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XYI+W5N7+iFiP+VDk/GhKrhGLxN6OiP24TAZ7dT0ZfY281cP6cBTrHZm6IkfrXLiGcZ01YVvg5TaWli+Y9z8RP6WyfZNKs/wpn5mqLVO5Pm+VJ/lroTW4SfcaM1TN+qM4kSxmO0FYndT6+8Cz56gxDYUwSrmwmYFxPBnwzF1iU2Iqkyd7nQ65xS8S7GF6eG4CdQk29QRQ791sahOFeuGGLaHodpSq+7jwEsBZkeygOkyvvku+8DVdIzQF0TWirbSoDtIZaIgjswt7avOEGWYNjiVttIKV8Y0QKLhe6Az5kjtJ3/nNRVraQAyVttddmEzOyKdeBcN/gH8FpKTrwA2VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eIeYG35ROMMAuQcCWapRfsjDxWtrS8IsXfwqgr/BX3k=;
 b=YyRnfYqCJftja/UJ2qeOJ+KUHZyWKQU5miff1dkqbkLkuUkKSx7g6aYzHO+sLmbEQR/2azR17S1pvoiQk9BxrYlvgh60hkqKhc/agWgp2ZS6MU3D3rKNdyRik1pQUjZOGZ5ftSfek+btrne/hAc9NN/ScSeChfSChtgMlyotu1BRAXQE73eN8rvzJqw0So+WlToAUBSbyL+zSVahb8+MdQPNcHok/ul0x7rWMvswXIrVjB/UadWTxmxLuKkDADrkukb37pre83Anzeb2XkOXdy7e9kqrduNv9Vv8zIoV2QbGD9dzG5VPu4BhgoJRY42ALSqvPkdv4W9VR8Ue/5dkzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eIeYG35ROMMAuQcCWapRfsjDxWtrS8IsXfwqgr/BX3k=;
 b=cisOSxa2F4hMpED4dQeIsathB7OoBwBnT1kumplc+3aopM47xmxfJS/mQcfi7fipTM2sUT47OX7WBBC0B/bGZgz/KpYfPKErAEqjn+s25ozINgaE2tURK47fFfnxf9YJxgkkoJb+SbABkzSlJq+88sByaH+u4NoQw6P7b1iWLzQ=
Received: from DS7P220CA0023.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:223::15) by
 SA0PR12MB4398.namprd12.prod.outlook.com (2603:10b6:806:9f::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.13; Tue, 7 Jul 2026 18:00:30 +0000
Received: from DS2PEPF000061C8.namprd02.prod.outlook.com
 (2603:10b6:8:223:cafe::1) by DS7P220CA0023.outlook.office365.com
 (2603:10b6:8:223::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Tue, 7
 Jul 2026 18:00:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS2PEPF000061C8.mail.protection.outlook.com (10.167.23.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 18:00:30 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 13:00:29 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 13:00:29 -0500
Received: from p8.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 7 Jul 2026 13:00:29 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 3/5] drm/amdgpu/gfx11: fix IP dump alloc ordering
Date: Tue, 7 Jul 2026 14:00:19 -0400
Message-ID: <20260707180021.2642432-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260707180021.2642432-1-alexander.deucher@amd.com>
References: <20260707180021.2642432-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C8:EE_|SA0PR12MB4398:EE_
X-MS-Office365-Filtering-Correlation-Id: c7acec6a-5712-442a-91a7-08dedc51a1ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700016|23010399003|82310400026|11063799006|56012099006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: V4rSSQpEpDtiTduIFQoFZP1qxU6AhjvPlqYmLQhZqy4OMfnbtGpbJpqQCMxgPtzx4F16/B1dtL2PoXF+UZImiRpIWQSCAIEHJbWBM0hCIt8Lmk/FixkRpMyFSO3MLnVY3fxtBV3BqBtfxyTEG599LAw5abkPgFaxN0bRvj7A3UrxmJnppVgr+gfyBwo8QkRjLxVg4v0AZl/ip656YZpfoySTaEKbe7EsPxJQy8bT+nQC3Vz1I8gsvspYcrF85ZzYAabHGnIYMb9rLzRHyJfIeLB6aTAe2epvC3yiLz22YNFAPz7j72KR23GkYHQTSYsFjF8r3rWghctsMYBDcNxPHx6+9nkWdlbmmJBDgiXdpY1Fyd5eOk0cjjO45gT1phjCxFijr+yjQI+IMgBUD2eybMMjnZajpYoteSQQorAFbgZxsLgDNihbA64yOIcQu3wBABY9sAuqp1nDfzpPnLgmMVzslRjW0x8ljC6gU8VPbamWhxRSEts59DlD8ZcybOlrK4OWOgcimECsVtOTnkloHUHcfnqKIcXm9EfF8lJ8hI8fmhcjIG4L+91PSjrJG8kH6wIADdzteUMFqExkJcngg4rzI9vOX6Otb4Bcp7w2X1k3IQ3gYNsko28RttN0W1iC44Wqz1LjBSqg7HijaVKmcIu3UMBM+cAfWixald6XrifkO0VqBckCyFgTx16f8JhwkWwmFUiZXOwKotrtKMQMbQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(11063799006)(56012099006)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: CfspL6TsVnB1Rvm2Sqt+/tLfMsqbBbleKirw3xGXE0AEKNAfYNTo7Ydx6XRdcH0A8B5gC2PsY8lmZ77hlHC9VVpjIMFlGMsVxrWNQu6/iiyVl5BRe+ORcAW40J/MuhUIsPfTuAQd3e+2A1r9AL43JGfmW1zOKsPv4tpNkKlDmX4RTlu5jpW8YigV+CTHcQjVm3a+ya5GuNtyxkJh4KhlMqs0ITRbMAzn2dMvnC5kBKxsexoZP3HSl7qOQCJxNgxX5HaVmU79vBVOiQen0zwU/ekhzuPaeIiZ+BTw0idGvYvVfXfmNKHGuVE7tw+FErtXAMuHvLptJC4Vt29ywAcQXHLZHb4cSpa5dW4Zt2fJBW0FeFOJi0wQB9jaE9lgdVa/8iuwLYixgLgLvcBbCrr8eqevikDmmhiv51swRwfCLqtkP+GJmWAxPacZvnT70Lff
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 18:00:30.0059 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7acec6a-5712-442a-91a7-08dedc51a1ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF000061C8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4398
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.deucher@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:from_mime,amd.com:email,amd.com:mid,amd.com:dkim];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F315571E735

If gfx sysfs init fails, we may leak the ip dump
allocations.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index c869f2da122d6..e7973ee4cb492 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -1919,12 +1919,12 @@ static int gfx_v11_0_sw_init(struct amdgpu_ip_block *ip_block)
 		return -EINVAL;
 	}
 
-	gfx_v11_0_alloc_ip_dump(adev);
-
 	r = amdgpu_gfx_sysfs_init(adev);
 	if (r)
 		return r;
 
+	gfx_v11_0_alloc_ip_dump(adev);
+
 	adev->gfx.me.use_mmio_for_reset = false;
 	adev->gfx.mec.use_mmio_for_reset = true;
 
-- 
2.55.0

