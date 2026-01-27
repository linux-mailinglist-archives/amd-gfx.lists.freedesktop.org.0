Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGdaK7xmeGnTpgEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 27 Jan 2026 08:18:20 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BBE90AB3
	for <lists+amd-gfx@lfdr.de>; Tue, 27 Jan 2026 08:18:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD5B110E0D3;
	Tue, 27 Jan 2026 07:18:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="AXmt6041";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012006.outbound.protection.outlook.com [52.101.43.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F6710E0D3
 for <amd-gfx@lists.freedesktop.org>; Tue, 27 Jan 2026 07:18:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TegRuqGCNMzCnu2HFkH2R7xA4K2AxZk4WNWczGy/seGVPBLizcCcmNO7GYvq6cAAqHrrDafQj12ZeLzzSY3Bz8+4HNQKX2XKuUc10rlAj/EoGW+sE73hbisKx0rjTcM1WxBmOFZE6FSKDJ1wlsMQAUZMlXddzwTxmMPTpuhT4NQj2M1wpxVBzxOl/DfyUnJSbRr/VrFXgPDvTs+BDFgRM/K0WVp9CDpegSuyHxoFt9WBZG2S0J69/fIvxV9TQRCKttUU6n3TxIBE3+Up2TVh04w8LY5zKGM9dpSkN9lxVjZaexastl7oNPOki0vnQtH0bXEvHUbyMxz7+wip/jcriA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cz5pKLw4QMBZpebUjaT3iojsG4Qp9gFrd82KneQNeY4=;
 b=ZvpoCEoZ7SdsuuVFWKtb9UTKYAxgfK2WVP+c1O/6erL/aCFj+dRZuaL+NWffH89+eA9iFY6DkYMUOUDEWNIdatwPOxiC79v50t337c19taoLxLFx/b9F81UZH6idtrpMtVrpXrYmjB8+5wNN+kCPAmD5C4UzrOQVB58lFJNk6ZpgUMc24wZEBfJsYemCFzpgSHUNP2wtkZTIPQezlNEarsWm1rjh5HnXu0JvveH8EVQI8HqbFPBKFnlMPwNdTxEEv63iaU1qBQO2ek3tioToALjBryTj6oHrEZYxD+ghuN/MdwIbMDxxSBwx/2XT6I2GuHOJ5lXQGUkrQj1TmA+hlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cz5pKLw4QMBZpebUjaT3iojsG4Qp9gFrd82KneQNeY4=;
 b=AXmt6041tyMQteu6eMvA7qoqTxo2axza8x2cib2lLDxUCPC/PEDberYjWWYELOjj/FVWFebVG2TymdTCsmQ8hRBTDXRFzNhaFSmP7XB3oTO5OYdyyBDe/PtDmm0jC+zNGJQFTSreylg8FOSjO/gvwSTluaThk8AsInZNk13eAnw=
Received: from MW4PR04CA0071.namprd04.prod.outlook.com (2603:10b6:303:6b::16)
 by PH7PR12MB6612.namprd12.prod.outlook.com (2603:10b6:510:210::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 27 Jan
 2026 07:18:14 +0000
Received: from MWH0EPF000971E5.namprd02.prod.outlook.com
 (2603:10b6:303:6b:cafe::f6) by MW4PR04CA0071.outlook.office365.com
 (2603:10b6:303:6b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Tue,
 27 Jan 2026 07:18:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000971E5.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Tue, 27 Jan 2026 07:18:13 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 27 Jan
 2026 01:18:13 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 26 Jan
 2026 23:18:12 -0800
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Mon, 26 Jan 2026 23:18:01 -0800
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Alexander.Deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>, 
 Jesse.Zhang <Jesse.Zhang@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH v3 1/6] drm/amdgpu: add mqd_update callback to AMDGPU user
 queue interface
Date: Tue, 27 Jan 2026 15:17:23 +0800
Message-ID: <20260127071800.2395621-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E5:EE_|PH7PR12MB6612:EE_
X-MS-Office365-Filtering-Correlation-Id: a6264c88-e1e3-4276-bceb-08de5d743c0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?66Dpa/u46jPO56pKIsJBlLvI67piSp1oJmFEijNYaOUP6VYnt4ETLyOx6Yc9?=
 =?us-ascii?Q?T64QcVNCJTut+pDJIwigb7gyL9Dts2lLAb5VeXTcQ1txdBfKcAimDfjwBUYz?=
 =?us-ascii?Q?t4iKjwP8gpxC4HbMCAp3vRN+LqkjexS3vyl2JUUU8DxpFN2H86B6FgorEH5E?=
 =?us-ascii?Q?jBfsnHXimfEowBoJX1Qga4nZW5WSu4PagQW/PFVRecANMfWj29ig7WjtImST?=
 =?us-ascii?Q?ljn/r/tzJAu9h/Tf2TOvn5ituUOnLctA+ZwhPYRGEcKdvhYUIKflINYXx21D?=
 =?us-ascii?Q?IvjvTywKA1WOH3cWB1eOaqlv+TyIWE4jcW5lwxTHVQo+nldxlb9y58MVCJ1H?=
 =?us-ascii?Q?8d84BljYBpKXlbV22ESxzWmywXmQ9Eqo38qz1MisJf5jkDNAXt7Wo7CRRlit?=
 =?us-ascii?Q?LQMFaL0Ck6vHwySdPvOpCVGb2RuR2t78LdJyYsTcB48+PCqYZ8/kxaDZYhLD?=
 =?us-ascii?Q?ARvQT0jE/Lyxa4FExwihF4JixJ78cg9kFJ0qRCoRf3VNU206mzwz6NhcTu3b?=
 =?us-ascii?Q?6c5LTfpqklmW7V/TXpJdxp5xh36rOklMApry85gqb85F0FgK7JfRQrs4B1JI?=
 =?us-ascii?Q?Stee41esfLYB07yzuFf+mKAGa1vD7O8wxuQ6IzwgqSbW3Mb6HsZ/7l4/d2pz?=
 =?us-ascii?Q?kU7StiX5bGWaMKjMJrgPbSP2vWQevuj24BdhqFJXUBx8fJSz0APuaPXXyfOy?=
 =?us-ascii?Q?VT8Jup3LRqJuiHnBOGm2VP4o8SgACgLRjXcNJY7HGBNybk55yFf2gFcUEUL9?=
 =?us-ascii?Q?jTz1jdlmBg37SgT+baIjd4VUj90SjHheCnZR5s0zhfDEngvPt9Gqw24rcNHi?=
 =?us-ascii?Q?YnFoYTxd6YPSp8ViF3vRiycBpQveQcfteyGcjScgOpjgzwTVQhxuKK+LWC2L?=
 =?us-ascii?Q?ZHnKJ8sSsFR1pOq2ASubOyMF+xHa4z90tynb1W5jmarn6JBlJPq+KJoKGQm0?=
 =?us-ascii?Q?ytgO0XvG2aL1ljE+4irfYcJ6SkKgg2TJYY91J6dHmO8wyDsSBQP54x/QNn1L?=
 =?us-ascii?Q?hjPkL13mloHYyjqm4P/U4BasaeIsD315gg0+oVt3X64DZ2kJbpeCYGHKvkIp?=
 =?us-ascii?Q?2iKuMJ4LcseppoB+wZWbTgdAinhXyPeixbGtvf7SOSXUWcoLgpNNXfIiTjof?=
 =?us-ascii?Q?1GkXbrlxaRaAW8woEXtvkhrZnrFW0Lv4wDu2AL16LacEOFl5Xulf6az1+ZGN?=
 =?us-ascii?Q?gLsdQ3VaLv6G9FdQ/T1rhKUJL3y+KTH14JitEDEt2w1No4BPZbDQurPgQWUq?=
 =?us-ascii?Q?QNQH7Ld3jVDHD0bo7vlf/JP/HOxL8Cu7UGbizpmMHqPISzTdCdZVJdSBoxv2?=
 =?us-ascii?Q?xVEfxLXfbnyOKlIaW87Vh4ctk+jGktbZSkl+4XPYALfnSP5FB1DdX2viziea?=
 =?us-ascii?Q?HsczDPqakpLXOzPEnzikiSGSnfZXOPGi5QqvanpKUdUo0jXr/30VQWd8mstx?=
 =?us-ascii?Q?4cY+v9RY0b9TFf46fnZ0oRoWiFyVRgJjJ5CmQuRDpa9pZd61hPbfBjqVa4kb?=
 =?us-ascii?Q?ncpgspbezHJeUvVWH/PWLtGN5VBCap4qh/uHESVsQcTcCzYJQNb12Seb56JE?=
 =?us-ascii?Q?eatDuURMV/PxSzOeXdZmcmFIUoZmSR1c0ZA2buoRM+U7fx/kpWja36SJwQRL?=
 =?us-ascii?Q?RSGcGGV2zujJc+cU7OAkPtJYLE9vPIL7nWYs1BNRssDZsqLSEj2OwBPjkNN8?=
 =?us-ascii?Q?bK3U8A=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 07:18:13.6770 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6264c88-e1e3-4276-bceb-08de5d743c0a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6612
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
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[Jesse.Zhang@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 19BBE90AB3
X-Rspamd-Action: no action

Extend the AMDGPU user queue function interface to support MQD
updates by adding an mqd_update callback.

v2: add the input paramter struct drm_amdgpu_userq_in in mqd_update

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h
index 95ace14e458c..833468b58603 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h
@@ -79,6 +79,8 @@ struct amdgpu_usermode_queue {
 struct amdgpu_userq_funcs {
 	int (*mqd_create)(struct amdgpu_usermode_queue *queue,
 			  struct drm_amdgpu_userq_in *args);
+	int (*mqd_update)(struct amdgpu_usermode_queue *queue,
+			  struct drm_amdgpu_userq_in *args);
 	void (*mqd_destroy)(struct amdgpu_usermode_queue *uq);
 	int (*unmap)(struct amdgpu_usermode_queue *queue);
 	int (*map)(struct amdgpu_usermode_queue *queue);
-- 
2.49.0

