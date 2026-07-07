Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t+gnC3IeTWqivQEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 07 Jul 2026 17:42:42 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CACA871D6B1
	for <lists+amd-gfx@lfdr.de>; Tue, 07 Jul 2026 17:42:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=LtCQLixf;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6021810EE15;
	Tue,  7 Jul 2026 15:42:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010035.outbound.protection.outlook.com [52.101.56.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B7310EE13
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 Jul 2026 15:42:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j0FbDcTWMSvp+FczhtY//GPF1eZT2lJongxDO0WW1nu655thZ4q9huBbFCKVjTiO+BWMJPyZxyRQGW3VrujrMLRPSffhKsmC0ETYOgZ6Y2nr0R4Tl7T5hTrbWis/GL1cz2H8isdkbMHEXW3x7MpEsJJa3ZKgAf722uWFNDDMOEVYFJQ21HQpOt5k/JFCEEC5aaCEqATLsQUrTWe2RNeB3QJ6R1kHr8YQUKz0ezjPzv8anY3roX6aDOJ6LJOqEHV+zFRiDi5kEEzcovB88h4q5k7fk680nPuDnukrJnyI5olpHJnEUfUaGJmQRXJPoreHGQnYRPFL2HG/ZwRn2Ks7MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13KeGLGFSRwdcG/Tvbs4fUhE596TkX/yzLSrI9FMMHs=;
 b=k4Y5epjS9uk758t0IUIrL+PwIQLc1SKTM/y/oJX18p8/FFHkqk2Euuf+iNUK/IcGkK34F7yMT08EwscQOmKN7x7dkD12eagY6s+5QwN1EnXtAHETLHgOG13ZNsugO81F+3QXSWJWvQe3AwcBrypim1+n3c4EVRiXbHSOG6qXvVfEPAf/65WbqpLF3KgVmWXNNQXgUoPlAuL3dzYK2r/p1zHyGYtWFUslXyHsHaYzOoVKWog275og+COp5rOFuSvw6JKrgNSPBz+qMMs4+PsU7SFI4/8Cz+e1D3hSybMO1Pt5xDSgCp7NUU8FBIz5U7ba+ORk77izJbXwh6F66oG97g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13KeGLGFSRwdcG/Tvbs4fUhE596TkX/yzLSrI9FMMHs=;
 b=LtCQLixfCvz1m+XtuDmYsMan2fXKPePVyI+Ch22YHa0wtfGce/vhlCYn0BNhkyOUeQuTZR6libKPgHlgXf8/MmUdY562qfpq/MCaMRR8ugpP6hk4NghfvdJLlxnOk5Cf6xc3Dt1s1RL9PBYdcpsKWUWX7iAtn1XZTU8ZnCknp+g=
Received: from PH7P220CA0051.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::13)
 by MN2PR12MB4456.namprd12.prod.outlook.com (2603:10b6:208:266::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.14; Tue, 7 Jul
 2026 15:42:33 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:510:32b:cafe::5c) by PH7P220CA0051.outlook.office365.com
 (2603:10b6:510:32b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Tue, 7
 Jul 2026 15:42:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 15:42:32 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 10:42:22 -0500
Received: from p8.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 7 Jul 2026 10:42:22 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 14/30] drm/amdgpu/imu12: WARN() rather than BUG()
Date: Tue, 7 Jul 2026 11:41:47 -0400
Message-ID: <20260707154203.2603209-14-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260707154203.2603209-1-alexander.deucher@amd.com>
References: <20260707154203.2603209-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|MN2PR12MB4456:EE_
X-MS-Office365-Filtering-Correlation-Id: f7ba01a2-1f67-46e7-5004-08dedc3e5c5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|82310400026|376014|1800799024|36860700016|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: jz5DcpQU/lo1H0dHEzidjghvDsIkaYyV+R+pfyJbMZeAEUtaBRnA0kG+ISiixfWGMeP59LXqrCAR2naPyGgTL6HDM7LmKIrsHMx1cgMif8QEHGvW7ZHX1GYLMdlCX+TqtNcVn4LQhswtIFPENZZlCbIMsw6orfNqsSw7iHqXuWb5LdqmdRHgwP2lCftVfefbdtbmWsugYPTgFFl7/WFcOKK3Y2d3otFDSOzhGCc8oY3AztkI4MK4fqBlOrnuiUOXiYgQw1kVg+3z13EL5f6igSTD8xDzj1Jz7rhWrNhtNmfaB3wjfopJpJ7XZgM/lhCM0XAdXBLbEffONT3UQPmjNzr3vB8HF/4ZZgQdGAruLyC3ob1Hy3pEcSjI00S7Gigx2IRc4+UAfBH17jmC+8AsHR341mRHNaPiCFpw5oE/Ufc07Pd0YvGh5KrJ6aGEQ0kqzsiDQXKw6rRs/P8JtOg9kckEidlJthphJ/qy9y9R79IPYC5sf4zfz7Alhi9FhKJ89WTUZO725n/sPh/D/pmsOuvOc9eLHXY7b/4zUXji9nzW0BDw60shwQBv4nvPIQ2TIPEuoGAq69gpop/7vqUFs2gIC2wWpJv+idpVnEtuHcPBMQyPH4LDtOFGIvax07JOxzjn0v5H5KEQ4LlpCCEkziugvaW0iAV3BNBZF5yvDHWTa5JKHtrU6A5O7LTdIFRL7bqwnF5W3ajlaSOKgri0jQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(82310400026)(376014)(1800799024)(36860700016)(18002099003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: o/wt5eXWeXf1tOT4lanbosxcnys2TQZYORQ3ZAg6U5UR0b8diydXsDcBGh2Tjv7MRI98viq/AbbGdaIGv6CDY1WvbTgHu4ur6sk+co0XdhZyVp30a/vIg08w7YHwwAFwv/j5aLQBF52RiKUEe9ViVWt6wfwGAvm315m6fYMTKHqKAZvuhfT4ENTCjD+KxdotLg0jy6DVTMIydOJhd+i2Sc2MWexjj2MTFnONdqNa6iYf1KEDDCsfZBSehVIOc4TgUbkbMwdfIb92QYbN/OjWsweoGWMoESTmdHhUonJrivs+CPqtnJeqXPVhRghL3+WW8EuLwNORnUcnsOjpfIEkloPOXM9wyZtZS0aCeRMvQlzbrEZPhnFDrxtnUP1T7HsxsZ+Is6SkKZ4FyOX7CExDD/FN0bN9gvRf0xZ73FjdeGOicNisdi9KMQpFFR5lXRC4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 15:42:32.8135 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7ba01a2-1f67-46e7-5004-08dedc3e5c5e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4456
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:from_mime,amd.com:email,amd.com:mid,amd.com:dkim,lists.freedesktop.org:from_smtp,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CACA871D6B1

There's no need to crash the kernel for this case.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/imu_v12_0.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/imu_v12_0.c b/drivers/gpu/drm/amd/amdgpu/imu_v12_0.c
index 58cd87db80619..2943ec9521eee 100644
--- a/drivers/gpu/drm/amd/amdgpu/imu_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/imu_v12_0.c
@@ -382,7 +382,8 @@ static void imu_v12_0_program_rlc_ram(struct amdgpu_device *adev)
 				(const u32)ARRAY_SIZE(imu_rlc_ram_golden_12_0_1));
 		break;
 	default:
-		BUG();
+		WARN(1, "Invalid GFX/IMU IP version 0x%08x\n",
+		     amdgpu_ip_version(adev, GC_HWIP, 0));
 		break;
 	}
 
-- 
2.55.0

