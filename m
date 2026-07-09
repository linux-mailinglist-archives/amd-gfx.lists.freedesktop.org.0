Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I/OnJy0TT2qJaAIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 09 Jul 2026 05:19:09 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 007D672C3CB
	for <lists+amd-gfx@lfdr.de>; Thu, 09 Jul 2026 05:19:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=LizX7eBL;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F8E10E0B6;
	Thu,  9 Jul 2026 03:19:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012001.outbound.protection.outlook.com [40.107.209.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC1810E0B6
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 Jul 2026 03:19:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TEmG6hbWs69Pna1rYGAmzLhh9t2AzRQmYEgmY9fuoq8+P2XiZXFdoAVx3VI0MCzOIxxExBYjgXoNPYT6CxpV51zLVs4SuHGParrl9fZ2RBr6n2Z0I0doHZ24nrgMal5qUSDldW8QVYqZuNOYtx/4nqrtXK63b/rM1RaY5U3VHTRY3UgCN7AqbfakR6MyJmGkjcxie6BBnB3n9yh3hso2VNqqzyP+YxKuKYKfqJt3pgPZ9vv8DANDlrQLSRi7UTNOhmG17As3GsOJhnmNPIpNtMq0ZkcPSPkynuwwQIdXD56d7qBbEI+F8IiYYnVoi7lC7ON7uf4f8Q7naO7vO2z7pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qHcp1jYjQqF8Gkyk8hfD4I3En8X5u2H2s7CQLZrQZH4=;
 b=SuwGW1wnl0lQ/VX7/dMkQuAInVFSLrypaYVbQz3KxAQQszUt5NJuXRtzy9nQuDVIydY0UNvpGL0RhgNp5VwcqeuLdlC/uPYpnLdZRyM+siMxSQ1pKj7c4uur71Ax01GWbXcg+7VkC3uW4U04DizJjSrYPjZkQZuJByt1B5T5t4GcenOA5XC8fFtc+JLfvrgmkrFBSMf5LxXzrtwIUEU+ZqkMPu1mFSSCTovNRdPjHVIGGNCa8VVfJeRidWA5dNli9M/9BCZZkUPiCbklYN1ikcSSHgDawDcbEjSTxDsHfhWNy8uPIXEqOaedBFFWakK0XBCEpxbdbVxNbuiMZuWRhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qHcp1jYjQqF8Gkyk8hfD4I3En8X5u2H2s7CQLZrQZH4=;
 b=LizX7eBLxjVG1QMsFiBiXKN7UxPaU4mJweiU/+RKt8s97rq2zjDuXBW0L2mEtqQrEKhBpIr+kMcLJ211TpYRnWCCQyvM5mEmQJQRb/foxjLCN0a/WXeesDi6eBexxvIy6tUmVm13Jb6910tN09dAqq6eOP0t+ThRz7bMwU1O/+I=
Received: from PH7P220CA0029.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:326::21)
 by PH7PR12MB7940.namprd12.prod.outlook.com (2603:10b6:510:275::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 9 Jul
 2026 03:19:00 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2603:10b6:510:326:cafe::20) by PH7P220CA0029.outlook.office365.com
 (2603:10b6:510:326::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.11 via Frontend Transport; Thu, 9
 Jul 2026 03:19:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 03:18:59 +0000
Received: from amd.com (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 22:18:56 -0500
From: Geoffrey McRae <geoffrey.mcrae@amd.com>
To: <alexander.deucher@amd.com>
CC: <christian.koenig@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <sunpeng.li@amd.com>, <Harry.Wentland@amd.com>, Geoffrey McRae
 <geoffrey.mcrae@amd.com>
Subject: [PATCH v2 0/2] drm/amd/display: Fix DM IRQ teardown races
Date: Thu, 9 Jul 2026 13:18:33 +1000
Message-ID: <20260709031835.3395558-1-geoffrey.mcrae@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|PH7PR12MB7940:EE_
X-MS-Office365-Filtering-Correlation-Id: 069ef355-89ac-42e6-0b5e-08dedd68d19b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: y1goUzvFBGfD619UpJBOe1BDc2SsAIGMwjLj0Xxc1En8ZH5bOte0HXj8y/q1Y//ihVOIGmr8I/vtZqDcdrOcYujAi08q+RFicbtChbEtGpVkxeFp8wdvcsNbl4jntAgwbFCxwXMdFT2+O3vWX+gqAQcuCeuK6po84urbJf01EY5ue4iHuuo9j8E0bpYrtOPkOTxxIj8OLvaup2scYrlX9Hwv0VF4CxWIHDf8ehuY8qhQeP5f+xo3XLwVgghHzi6Dvd9wlP0Hkj4g73twQnl9H98zVykgwZexS8lH/FP4xX4d8U252150G3yXd3fZYY5htTNK/UDUt4RT+ZtYR7oX4taJHDUtlQWcnUQmMCCei2Ky5kvjyCWFYXkasi6Dp5WYaJFdGEEAVwBt4TxEOtNAXkHaKpuzmcr0vwgDnfoRf9FTRCCcDBA/QpoGFDyf9Jtk1rNI2ZBiRUWSHbTMV0WB1eZFRHiWR4HUN6zASX4N/L6bLb3fFRURHIzSoiTikE3JIyo0407Gf4iJ+ltNnWiWXTC1b63BTjB8XWQg5ASJFQ6yhYUy9vYB3fQ15hMuDFM2qwVkgbqtzLUdG5VaSFcdwK7Ejym2OYfS9G4g+DI28Sq7Zfcb3U7DeOhImvtYYYzYfDlfCrnrJTKW/LSXBfA1T1lbBnaFbz3ZvPkNsZVb853cKzMhE2s/b5biEIPAB+iWqkS+Gzw6CHY5wFfyCgw86w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(56012099006)(11063799006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: BSeMvpd/d/CRpVqRLHNNsIwVMz3C2yEjNGVcJPG74wp763eL2uiWs76WW4xyy5qnSK1uhoVQKSW5PV10zYRavSrdPHG0AONXzH4MZ4QwqEpJIKxZ+R5y8oku/H0CLwCitZQeCMQ10kju8E2H1Xx3CQ4sZz/U1A9fACGeWxEEvH9Qre/qmuW4Ltuux/YBOe2bHzFYBEJk9OuSKwJtNdEcwFBtwWD2Q/H8qxWXzWx1ApgtlwYyWlmViMnBJsKbxi35+00Nb/Bk+0AWxgpqdV6yXTM4GHQxMZkcbN08HhRKrX05RhCZm90dfaH3hBcyDWPLpccy6AjKASw2nX7X6b2Ek3UH8m0NAoXqpNayEmbyrD3HOZ87z4riJX7m1I0yK5xJyDFCOkXRLYgth6FcYsVgnbSTSZ5h1/pRjwRXiYraPTRluvaHTN0xkLjen8G7ieNW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 03:18:59.5513 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 069ef355-89ac-42e6-0b5e-08dedd68d19b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7940
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:sunpeng.li@amd.com,m:Harry.Wentland@amd.com,m:geoffrey.mcrae@amd.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[geoffrey.mcrae@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geoffrey.mcrae@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:from_mime,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 007D672C3CB

Changes since v1:
 - Remove irq_fini_in_progress flag; the spinlock serialization and
   empty-list check are sufficient (Leo Li)
 - Remove redundant irq_wq != NULL check in amdgpu_dm_irq_schedule_work;
   amdgpu_dm_irq_init() already guarantees it is valid (Leo Li)

Geoffrey McRae (2):
  drm/amd/display: Fix DM IRQ teardown races
  drm/amd/display: Use unbound workqueues for deferred DM work

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   8 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   4 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c | 172 ++++++++++--------
 3 files changed, 102 insertions(+), 82 deletions(-)

-- 
2.43.0

