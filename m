Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LHJoNuMMMWpfawUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jun 2026 10:44:19 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8DE68D435
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jun 2026 10:44:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=v3TOJEJr;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C818C10E907;
	Tue, 16 Jun 2026 08:44:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010010.outbound.protection.outlook.com [52.101.201.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B868910E889
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jun 2026 08:44:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSv53gRbNnyW6ye3dhty+Hxfz+Y4HxRH6Yx+0Hnw0GBlskuRCyNi/f34J0l8YPHXM3Gz3egnBkk59Pp9qVwC7ugN7N7BYp4DVue6nDX9DywEfpJdQ2JIUaoEqY3vIWbV8wwTRw9dJBVI80OLB2FY22nN7w7fISFcpxs+atmHb4ap9azjdc0yPQeOjUxHmiQ4F/KUmyM/CScSmk6l5UoqSPWxgMAYH/StgIoI0Bbpv1LMyKK4WsTYVfxkBf5GMNFbaKFKMk0Wu1TaT0GGGPUU5PpdbmDOus+x09U+X7RsMUYIBLVqa/vm5n3yWiOgDxn9d/uZUwCCz7ukOPuIBd4QhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5EjtlNtmA3XmN4sQxRVl+/7XlcmgP9e1oG7wX2w3Fwc=;
 b=uJLUt2ADY1Sk7TV6JOuNWQY7PRrKYg4k+9z0oSPnHIaLKcVc19eqGAKqBoI6vmm2QBYcsPPu2BVx9bcgDjWs/LYkSRdAn2I6KDZVDaRN2D403NMRXZTV0efK1M7KrJpeFqSy1lYV63z9HVnintFltPLuGaMkfa4GGoIPRYAV5V9tE40FOKYLgSfxmwQCkjqeVHuZUmU+OmkV+IBJX4xMIMz6pBvt4sIOMsdPrWFG/avIlyPSlChGtqGgjBn/Q01siQh3se9is0CspxqxntuSvlBgdmJukVOMnwQMXtz6Gl1sSuWK00PXcrtie8Ut1xUdsxDEQKzzV6Ot6JBiYbgn+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5EjtlNtmA3XmN4sQxRVl+/7XlcmgP9e1oG7wX2w3Fwc=;
 b=v3TOJEJrtxAEX2pnOEypsqd6H1kbnNzseDv0uijEstVkm49hGRggSYP7oBjVzkVLfmrY07y+W+YeSzWoSB/8fPimjq/cydyX8xLI8K5rZBU3cR6S5f/TX11aFnOEzfPWjAphMYOyWMIWuUiu/C+ihgWNyQuOuwJuEWkK/WJBdf0=
Received: from BN0PR04CA0090.namprd04.prod.outlook.com (2603:10b6:408:ea::35)
 by SJ5PPF4D350AC80.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::993) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 08:44:13 +0000
Received: from BN2PEPF000044AA.namprd04.prod.outlook.com
 (2603:10b6:408:ea:cafe::39) by BN0PR04CA0090.outlook.office365.com
 (2603:10b6:408:ea::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Tue,
 16 Jun 2026 08:44:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044AA.mail.protection.outlook.com (10.167.243.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Tue, 16 Jun 2026 08:44:11 +0000
Received: from amd-03.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 16 Jun
 2026 03:44:09 -0500
From: YiPeng Chai <YiPeng.Chai@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Hawking.Zhang@amd.com>, <Tao.Zhou1@amd.com>, <Candice.Li@amd.com>,
 "YiPeng Chai" <YiPeng.Chai@amd.com>
Subject: [PATCH 1/2] drm/amdgpu: add bounds check to prevent array overflow
Date: Tue, 16 Jun 2026 16:43:39 +0800
Message-ID: <20260616084340.4128985-1-YiPeng.Chai@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AA:EE_|SJ5PPF4D350AC80:EE_
X-MS-Office365-Filtering-Correlation-Id: 19e8e12a-2128-48d7-f2af-08decb836fee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: EocO3/uVB5B+oLb//9NYS1l+jeTzQ3ymv14n02F0iH7ItQ5Z911L2Ddl2jHyvDqgmvPx3vbC3kVygfdsZBMAhb4qAptkwKhcpepP0jdSs9nHqLdv2bHnWzpqst9XT1D/6ClanW0AxKPd1aeN+u44Fcy0Mf9leMFBQCAcHSV08Q+9yr5qQ9ygHcy7+xcC338f98OGV6bjCxbb91lXrPguRDDkgQVPkG/ZuaCPlw14j0xUMGob+oVMvoiqjW6hevrStHGvAaU/ep91ljT/6OFgPBdqf+z/ws4ssRloEOoZaHxmNaZyKJJ+X1ByutZ5BlX6YO7NyWeFqP1vNBGwrSkfNNaVxYvY8NguWBf5P94Kmhs6FQiTnTRNYp3QX3rXyW3bGN76RZb166gFQpoAFyZfA0Buf1VYRG01YB5VXFLFYXtI74A56XgWcB3UkQz2G0oR7n9NiGmEipD+eU/58wSUe0wD9MYABzOQpAS6OD46ZjVAOK83wt2NyjLAF17o83SP+jr2qQYBCdH1g0EcF4hq2edyQ3ZmQNglgAgVfYSeQaLmeBmMlX7wCWjW2RjtF9bKjcCqOvcuGphwVB+l7Pso0Zbh8Z7PLKjurbozVseWIolFPSDZ6Sug+oNZM6ATTVnJUv9/LbAIHJTuTXzIvmY8elcrCmKjpMehuLOycmWrMBCBXL7JoKnAilFmapy0vh+sFN2/Di5ABCjwO27Ikxee03QxaeSOFw5IqVforL7/3bk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9N2c36K59Er8F1K69gFoBuvRsbnahH/swAwAuwZ8iEL+mZF0h4qLp1j2RnUeVyTSZbcmp0ie371OV1vU9A/WeO0/GHOxeD2sERAhs2qoNN0Z3eKvXQeeWfR5YsoAFIWvCh/BtMAjsKhbLlTgoxOHv9If16QT+I/oWyh7cMKfsGHjEYVhfL5sWpux3XhjA3Vw7M47npuW6tdLJxuZKrQ896T6TRIXZWkvSkezN/iG1aqSMJN46ONrtKarCeDYXEQFfoPG4L/HEc261i9HV8rDUjH1ptqPUmRKJtKgBNiiVu+qa1xUFYM3QHB+2qWqozx93broo6dBsDscCkZ0kdv75DaBzkEdPVNag8ny3MPqdukIMXnJ5OwiTfuqgK08ch1cUKF+inuJ4c3pe9CTFwQ09SXxp3YHZEJveHpPSOioeSlcoMXcY/4HTfq0/Giunio8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 08:44:11.1852 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19e8e12a-2128-48d7-f2af-08decb836fee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044AA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF4D350AC80
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
	FROM_NEQ_ENVFROM(0.00)[YiPeng.Chai@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3E8DE68D435

Add bounds check to prevent array overflow.

Signed-off-by: YiPeng Chai <YiPeng.Chai@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 94ddb8b98abf..0a2136668b68 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -5064,6 +5064,9 @@ static void amdgpu_register_bad_pages_mca_notifier(struct amdgpu_device *adev)
 	 * Use this list instead of mgpu_info to find the amdgpu
 	 * device on which the UMC error was reported.
 	 */
+	if (mce_adev_list.num_gpu >= MAX_GPU_INSTANCE)
+		return;
+
 	mce_adev_list.devs[mce_adev_list.num_gpu++] = adev;
 
 	/*
-- 
2.43.0

