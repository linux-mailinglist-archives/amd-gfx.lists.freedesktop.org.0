Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2rqjLnCRMGoqUgUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jun 2026 01:57:36 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 696BA68AB98
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jun 2026 01:57:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b="FPlfikV/";
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D466710E790;
	Mon, 15 Jun 2026 23:57:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011010.outbound.protection.outlook.com [52.101.62.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6494D10E77F
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jun 2026 23:57:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MG43p6tUEiybHcxGCZUwPrRZKLbA+CTRzaBcDsUOUFQwXHotjf+RHn6Umm+0PJ71PjH6UtJHO/zwKzVc23A5cCGRWH1ADyd8Rbmac66Du9rMlbpI85bQGGgBmjiResPhFzlhBJGKlPo2aHs/8ic81RpXnIeW3ma2iqodfihYxRKpcuvtxdVQ1T+zSGNSqG2TvEReEnn0SmkRYI60mkQl1DtDiYXl/lcNw1KqAr6Jyw9KDWHAs9Ab+xLh/SLBfpe6w/KlGBd1t0IDyeQYKzcoRIX5yw6yfvERAsHsr/t/4olVKYb54uNu1sYd0huIRXf8myK6pyuMF0vekjUaZ5nVkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n2SDti4CQllACHPNcjDpn3a3j/76Sjup95e+2oJH5BE=;
 b=EOUQykvJPBcVbjUHMJPEt4iIDuqGp0WZyRKttb5rvqC8NvbQVqRkVba3BoYxTuzfCXpFotanALLja0F1UVl1lXoCjfoPL58MrZOv8VmjcKTK5CueNBuSbyrdJoS237nBG6qvI8iaXRNpt/naraS5iu5vgVyUhotL4ePeIVmKkevYghDOZpw/j/csJpjCjZvXa6yevezdsqIKronjI0NqgYMjHO0/js8KR5cQPzKR+b17/8hMtfFbReb7cWRjbFDTGDTmLJqlc8upxOUYauUZ+Upjnqyzuk3w2dsD4s2NCkhvZFWblRtWlL9KKr05xdHP2lKA7gDNIAn0jCTCOp5kow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n2SDti4CQllACHPNcjDpn3a3j/76Sjup95e+2oJH5BE=;
 b=FPlfikV/5jkShUY/snPICtrBzxR1SNmEeBtJia3dHMg3YiGeHdI9qydAEqaqyXhre9FNW/p7mi3vSxJ3Xb+Xh4aH9PNBSHmsX+zGsTaTVi3UKKOhy0hz0l5tn6qTMNRDF6epbfsBXtWigEuMZ0Cnq8EOoAE/68pOx1JXcsHfutI=
Received: from CY5PR22CA0038.namprd22.prod.outlook.com (2603:10b6:930:1d::6)
 by IA0PPFDDA81179A.namprd12.prod.outlook.com (2603:10b6:20f:fc04::be9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 23:57:15 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:930:1d:cafe::38) by CY5PR22CA0038.outlook.office365.com
 (2603:10b6:930:1d::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 15 Jun 2026 23:57:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 15 Jun 2026 23:57:15 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 15 Jun
 2026 18:57:10 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 15 Jun
 2026 16:57:10 -0700
Received: from p8.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 15 Jun 2026 18:57:09 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 34/43] drm/amdgpu/psp14: replace BUG() with an error
Date: Mon, 15 Jun 2026 19:56:36 -0400
Message-ID: <20260615235645.737189-34-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615235645.737189-1-alexander.deucher@amd.com>
References: <20260615235645.737189-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|IA0PPFDDA81179A:EE_
X-MS-Office365-Filtering-Correlation-Id: 810beb1c-9851-423d-e7be-08decb39d35e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|23010399003|1800799024|36860700016|376014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: sv2mEWEJcjCgdzC9zZrZIr1g317giqdGhnnrl9iiNcxAk5QbHn/AxE14NZp3FOxlIMhDNw1My6t4+yoJZXb+BsMohGeH/H0eniMdjDPAHSo1dVSxmRiySlBAsSDqFz7/DF7fc8dClKHeZYEN3okTN1fR1MNuKl3AuYUBZ3Bl3UJvz8dMVnZrw6MxbRb9hDHEqRhCB+bYgyloxKHVUukfFgW7Z48AoRAXiTesrKpnlm6d7PLc5hR2c8OgrgWs8ZdXJ0flijgYsFfKArUsAEHvIFeYzaN3HXF9ZmHttIpS875GEmwIJwc11ZiT1pMFzOkQrl8IPcpI/BkuHI0hWxEttq0iy6egpIS+7iCzFYUtS4l0DFVvldA5RFRLF/Rlh0WfgWiZUohEHvhjju3l84aJFGZnmi4MHZvGArmJthN9f1xnG2MdZFXE02DZLu8Txhn0co6sy7Z04i7iE0QOYGm5WbXNaEqO07IoP4kTO+oHMgR0YLVr4r0IuUw+ykC/2p1jV1MD7vYm2h9ocqzV7GhXHMvPhZcS+OYzV+CTdS2WnvICr6WiGowZ2qnCrSswLj0aCCEIIR2jpu3y9lYLRibCSF5aML2qtWZS9c29igjzwWkdf5h3go1XisD8S87izKP1duyfwgTeJ5bXsT2tKjrmrN3Bi7hPpwcshdII8BXMFE3iD/o+rEjMtrped8vcrOFYwmyV9x5VRGjHW4qZwwnHzU/ZtUtf4KuOlsfvBnalzus=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(23010399003)(1800799024)(36860700016)(376014)(22082099003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4V5z6J3yronsmr+/R3xfrUO1F5Bb/7eptlx20SzryZrxx0X9onu+qsXO7ky4y5Wt7iUAJh9lzuNw3+dGtyB6KdbiDMLfWS3ZUQhqRCC1NiuQzl0CZV5cUvarTIQ5HUh4CpXH6jyFzE/147tBxez/aecJFVBwxYB+wmFqgVfq6c6rdmwES5Q9bCOjN7YSvxIT1YEvneg9AKlfpdTdESLxsov+5ucc0y8F/5vQNKhWpSNN8V37cMPluEUdAhbYG2SUcxnzyTJszWEj0TA+unyLnqtVRlv6gpuFOCmy796Ze4TElt4/I2csQffq8xRMy6NlSHjkCpikb8bUyeR97WXO12+ZN++j+zODNJtb9Ka5kYUQE0GuMmovyLpXw8VO8KSGIdBnwB/+oFuTe77rAdyh3MSKdfPB+3BjtEbsQDcm/E/hpqQ99xH2GFAVUuB8attx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 23:57:15.2440 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 810beb1c-9851-423d-e7be-08decb39d35e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFDDA81179A
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 696BA68AB98

There's no need to crash the kernel for this case.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/psp_v14_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v14_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v14_0.c
index 040a61aefa866..7ed5f41969330 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v14_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v14_0.c
@@ -85,7 +85,7 @@ static int psp_v14_0_init_microcode(struct psp_context *psp)
 			return err;
 		break;
 	default:
-		BUG();
+		return -EINVAL;
 	}
 
 	return 0;
-- 
2.54.0

