Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XKW8BmmRMGohUgUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jun 2026 01:57:29 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DBC68AB72
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jun 2026 01:57:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=0UiEudfo;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A4610E785;
	Mon, 15 Jun 2026 23:57:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012046.outbound.protection.outlook.com [40.107.209.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACCA010E77F
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jun 2026 23:57:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dawMPepDoYo7E5rbhMhDE6Bl8GG+n/YZtJ3Y+MBJwom5A+YDJNSCdrnuBbMD/+3M3R6/gDKRoUmlZEGBpjj7elUAj6qcy2Hzh+/OQi24PJrtIRBSOLfIrO1CgTmt5GNA4UDNuRxK19KnJN6Jx6MbTbKB1nBmrPZgKACR4rbDeXCnzyoiedsvXjWA7bRxaOjCogvYkBiOYAxq7WwCY6LeQ8BlLJwvbgL3blls+1W9YSvHvo1b7LBqyq0Tk3+VOzrW72oYsuxgUzg7j5eAyuQJaLeemNGEhkflCuCNbAdAjOKqPQN3fv5sgW/Btd4BCXkOEzTha1Gmbbgk1Wl3FW7rSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TrQppUAqt19OoBIDTxTP6rLCzjy+OvPX/HM3ao7w3Ew=;
 b=GJ6Jq0smxbAvExWFXlFJzkkZ2Hh0l7/aaHGNaM8Pr/oEwRulc/+vPI1evTnc7+QgpdX/Vi7+qp6FaFA2yAi52FWGBUIlxbNUXuqr+MfIyLRTTgNM2wiQwTqVxPwIokKoDm1tXXcvXodBvLixo08XMswVNlA9Tq9gnRf2NClup2cJFU/cZCEbLuxxSToOyoFEimairF24tj5gkBuc3f6XGVrE1Ey0GxSIC1AZSiRHmKRwXsLN1//FT6ZJVyZ9bbGtQ7bR4VTbbUaExFg0LJ8qfnxeFLHNpBMOWcb+Wy2EcJqc3UStIhs0HeYsWa3t81txRsmYoqH1TCdwFTADcr4PHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TrQppUAqt19OoBIDTxTP6rLCzjy+OvPX/HM3ao7w3Ew=;
 b=0UiEudfogNi+rk6WGaUXnbf8MBQfiZLerx/LHEwIR2kJQssOE9wGU+7J0YzMM3cz8Eo6q50/twL/930E1Wb8knKatic5QNNuepfc8O7j40m/jJGtMxebw9ctVFmfIBks6HwU8F1pnz5FpdStmzf7Y3RsIblsXD7LDU6pmThrbNY=
Received: from SA9PR13CA0039.namprd13.prod.outlook.com (2603:10b6:806:22::14)
 by DS0PR12MB9424.namprd12.prod.outlook.com (2603:10b6:8:1b4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 23:57:12 +0000
Received: from SA2PEPF00003AE5.namprd02.prod.outlook.com
 (2603:10b6:806:22:cafe::67) by SA9PR13CA0039.outlook.office365.com
 (2603:10b6:806:22::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.6 via Frontend Transport; Mon, 15
 Jun 2026 23:57:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003AE5.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 15 Jun 2026 23:57:10 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 15 Jun
 2026 18:57:06 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 15 Jun
 2026 16:57:06 -0700
Received: from p8.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 15 Jun 2026 18:57:05 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 26/43] drm/amdgpu/imu11: WARN() rather than BUG()
Date: Mon, 15 Jun 2026 19:56:28 -0400
Message-ID: <20260615235645.737189-26-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615235645.737189-1-alexander.deucher@amd.com>
References: <20260615235645.737189-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE5:EE_|DS0PR12MB9424:EE_
X-MS-Office365-Filtering-Correlation-Id: c619ebd2-f648-40e0-5f7a-08decb39d0cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: VC9+pnnEQTDrGlLMZ7HmL7S5BuuhuPkKu5Bl+BmekKzpogA/T0r0LEy4kZqEhmdDV9WRfS2GNFYod78D/lx29ESxJPPoZihhDGubnnH8f0LNx15/fyhslDg6yvUJPHikq2N1dL5ZNBzVeuKUOik49Ye+qKc7PzYRD8V7jha52fgmSOIr7w7qG2vTUmgl13mCy0wXcypOQRmETYEZTxsvecW/N9FK2gtVjcdk1N8twv9wKSQSW1QTQ+EZoUOaZCKG0pQLlG7jnDzbTBx9dzhU9sBJgptLndpvfWpiRAl1yO7OG4nD7RA/84xcFudkjo+TSgs3beb1ejZnbaDbvzxtXFbJ+QZ+Yb5oV8zzSQlAwmELuYimDNfyUe0pn/kBZ+vDzD8pkr287VBifUaab7lU0oEN9mGy0cNO7i6lznQ6NqLXRj/vViiIzKXoumQ5GPDI/6ZbPcWhTcNy6AwNIzbuRecsfHGJRseg8VGKXI7pJNa3mCsN9oJz5twNoieSlHMKxqJ1WdHvZRm8RG2PKMquvXwM5jYs7fj/4a0M7LnUiadf9iPgirS7LC8stmxpPpUNnj/Te60h6VUqePfqzqN6POh33ZsQWR5Qe0LMYZnL56Kq3Lm2CG/g6c4ka7Gepa8+z2MOpnBMcfctEtykY/b9t9PX+sQDWHQOj4/wmbov79DDskNsxf/v8Nq87JsWdDr3NDpISWUkgXvSnBfjbzW+z3HpIT2Qkwn4nd92gjccv78=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6EKJ5XsUr97FxX7wagMKHzDerq6UKiOf4sTf0IYIoH716LRzftpiR6adP0c4Kn4nR+pH2zuQPKi6f92MOIyzRIODlO2Yi2mi0oHPVUthBF+e4oabUbQQTaSYExVI01hajH54mBBHrxkxWlB6kDqljo2kaYR4VrymIZpIPvA1SknVWXAUdDg05FscjHOWfglTkQ2Q6mO/Mzvp0Mx9V1wV/74oBtqvwqq0rETKv3nEVXxlxWLQiSH2VPIWUaQJiUN2SDSC7F0olV/IDJTCNBkW9Z+9E110R9STZAJe2i7bkw8zM6LaS14FV6xroe9TuRKpSUllJnffLRK1K+hn7M2DYmf9CSTct6r9bHaCAkAdXBESqXTNeVXGYLYmCxp3FHvG8NUEU7/VQerps4ddC6Cq4+VvT4j8jGwvs5H6fu2la7VKgdF7aT1d5ktqNggwEKJL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 23:57:10.9272 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c619ebd2-f648-40e0-5f7a-08decb39d0cd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9424
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B9DBC68AB72

There's no need to crash the kernel for this case.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/imu_v11_0.c b/drivers/gpu/drm/amd/amdgpu/imu_v11_0.c
index f5927c3553ce8..90fe54b39aaf0 100644
--- a/drivers/gpu/drm/amd/amdgpu/imu_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/imu_v11_0.c
@@ -375,7 +375,8 @@ static void imu_v11_0_program_rlc_ram(struct amdgpu_device *adev)
 		imu_v11_0_3_program_rlc_ram(adev);
 		break;
 	default:
-		BUG();
+		WARN(1, "Invalid GFX/IMU IP version 0x%08x\n",
+		     amdgpu_ip_version(adev, GC_HWIP, 0));
 		break;
 	}
 
-- 
2.54.0

