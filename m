Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id idyQN+bjimnTOgAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Feb 2026 08:53:10 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 344811180ED
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Feb 2026 08:53:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869D288284;
	Tue, 10 Feb 2026 07:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HSh4yiA8";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011012.outbound.protection.outlook.com
 [40.93.194.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515B210E050
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Feb 2026 07:53:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vgc/EOXkrn2hQvIdm5+gD8827xgin+ONeIcKLrY4n9qrysRRAzsmHd/g0UhPmf4/ClXKRPykH/AaaaH5+qgSOBYpPbW2dboNW/as4c1nKRZnLAnjk0eih1dThhhVVw8d7OdpVESxGg7vNPbtcxRqSrIQyNDhgKXHef4Xi/DCXY1hrv40pY1rGW7wY2rSAW8vQPou6fPpASMJ5o5s9lxsZNuDaBlqg+yCKKqoRQ9pPUGlvX9PoKxMpKLp0ftlxrI3mPO0YKD3XULRPEQ1A54rGQ0adpRp7PrMN3FozNxudurpB8RuyD6qe6HQ3YNr6tfHE/nJbA+WRH0gH8s6VhhKig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dh2BKdAEWtXaAsVQSHabYuRZ5CUsEvU3JzMr8jmlRgc=;
 b=XwXqbht1fYQ6h0McxIocvuYuCzPnl/SarjNIJj5efxrZGJF5ozwpDpk++DBuMVMeSyNvYrU6teUw0ja2O3TdhyWb1JH6oEDH24oprQb8YfJPPIydFOYaXpN1i6y09i3tD0dxfJLM+9nqcALFlKpv9gllnmF+PAwU/JlPy622izMyZaNplV+H1XwDPMg4xR89vdJcdEvR2pCeyOXJ/9WxbTUoN+vN8EFC6psQMBX9oh8DlJl/k7Fz35cDVtK9nH8WSW/JbpRUYzT15lXC585s2USnYdBtleVFz0yEoRZ5W7m8u02CskBy31bzrF3VOZRjdoUhqmGeS7PHGdwaB5eIvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dh2BKdAEWtXaAsVQSHabYuRZ5CUsEvU3JzMr8jmlRgc=;
 b=HSh4yiA842k9ZHgFQrCvaXp9cQveaYkjFENtXxWBN9Lb2mRtU86JI03n+Jsel5zqEFEIxkdMTsPKcDpA9KeOL2BQPr0XvV3ALkJCSVwm4Caf8kpeX4sPpx3mcSfExjw45CVgilnwRxoD0qL0JX8SYF0Oz6L0jotucwJb7588jK0=
Received: from BYAPR05CA0048.namprd05.prod.outlook.com (2603:10b6:a03:74::25)
 by DS0PR12MB7533.namprd12.prod.outlook.com (2603:10b6:8:132::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.8; Tue, 10 Feb
 2026 07:52:59 +0000
Received: from SJ1PEPF000023CC.namprd02.prod.outlook.com
 (2603:10b6:a03:74:cafe::58) by BYAPR05CA0048.outlook.office365.com
 (2603:10b6:a03:74::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 07:52:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023CC.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 07:52:58 +0000
Received: from sunce-mlse-vm.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 10 Feb
 2026 01:52:56 -0600
From: Ce Sun <cesun102@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Lijo.Lazar@amd.com>, Ce Sun <cesun102@amd.com>
Subject: [PATCH] amdgpu/psp: Adjust usleep_range in fence wait
Date: Tue, 10 Feb 2026 15:52:48 +0800
Message-ID: <20260210075248.3017892-1-cesun102@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CC:EE_|DS0PR12MB7533:EE_
X-MS-Office365-Filtering-Correlation-Id: b7f78f25-d652-4ff5-089f-08de68796897
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tCbsvSXRkrWTswceYYB2J0cjxfjCOzIjG7EYO+oBUYEX35BDb38GbfaA7MBx?=
 =?us-ascii?Q?PJM/pGO3UD9AjatceSx989SdVp8/DV9xv0H/81rxZ6EJqUij7Q7g8V7UNoIs?=
 =?us-ascii?Q?qRViy2PixH77v1JvkL8w+dvkh/rEIQAxX8ZlYPiJc1jaZc7ybfgZfii4pyJ/?=
 =?us-ascii?Q?C1RPjiDWbu1FOIoqnsVtkOYKc3jJ/aBn7GhWarWjgpUfA8l1kV9ifVMXMGCn?=
 =?us-ascii?Q?+0DQL9mr4toB9Mepni46CoOhKTrK5+NSAWLIfeJX8qaLlfNSHvVIaozjz+cd?=
 =?us-ascii?Q?1VPW1mvHNdsepxSAEm/JvBIYoSiWXwy2UX81t37F0CSfgRJrYpgln3xTRCEM?=
 =?us-ascii?Q?362clhxC7Y+u18mf0x3Xlho9L6TrOq7XruyJOU9tK9W7A2hJDX+3BQSP9RPd?=
 =?us-ascii?Q?osI0wLZiGezqFEhQwGBUjdt5YZyMkczcSTm2JwsV4jFo5/+xp8d9OmnkS7sE?=
 =?us-ascii?Q?nsoV4oqwGTgYDtYu6Gr1TR7OurWl7uxhTfajYSlR4AeN9FeEy83fNT93r/H/?=
 =?us-ascii?Q?cKseu3HlyGof0VMI3Swgxl9bj4jTMCF7fKDvK/K1+/BYleZmkW6ih13syfIl?=
 =?us-ascii?Q?pqzCRdeo/6zNHMH+UFxtXO8MiAjDE8hsaaECDkqiLX2vqDLZcIMYYnSpL+0A?=
 =?us-ascii?Q?IrebJzdaCe8nfcmmUbo6fnKvqUC1qkvSYmq4aDSqqUP/t/Hj+M9HISuRXWbg?=
 =?us-ascii?Q?6HUXNpSF2d3QwoOIFE2+mS01Ce06yE5fEz6KvPKgCP4SZF94F56lT9tQmzal?=
 =?us-ascii?Q?3WQTzrCxPddfO6vENTV5PNsu/IP2G9KOF4XUfMxJaKkmXp4ATXixNcb/k2iD?=
 =?us-ascii?Q?8CrwptMI10ZBsmTU6jqo7dlv5Z5W31zKc5GWRKXK//Q2rHBFMoliMPmbkfW3?=
 =?us-ascii?Q?RwDPG/x1K1N2DUtOzNGNsjEqhhf9urM8HDR6OjVD6spS3iLnwcoLZi8h9PQZ?=
 =?us-ascii?Q?hwUk6tvBKHVh6XGbjt5NphHU927SqIa60cPvm9TayrA0MYX0A0Gv83x7d6Pd?=
 =?us-ascii?Q?HDFwnIV0qk/4D41B9DUr0iIzwVAAgRDCcBy2BuJGZT3B7ktoWkeHLLwA6sju?=
 =?us-ascii?Q?fqQQlQGOucayW8WETbfNqV1WfL5G91U5an+EgMAcCY5xDqpYaz3Eh0JUfFmj?=
 =?us-ascii?Q?ceXHdcX3+Rlmcoq0Bsokt/vhETVYh8DwltAdJ451k4sMu2Td2Xfd+y6GFHIu?=
 =?us-ascii?Q?GCsU9b2O16yeQtfqOl0sKfR7cFbRT5FRznTtk5T4g7hb8RLmhYNqbZ/NMOVd?=
 =?us-ascii?Q?3LNJOsVC7KOXU+xFtGGaffUyN9RjWTBJKpBjtpI+goR/gZJwRwEzcXjKArPn?=
 =?us-ascii?Q?IBXLr4IQ3pL61dyul++Ax2lXabNlW1fL+cQMx5+UYdMP/TQ6vDB2UGfKAY0z?=
 =?us-ascii?Q?93v8ebZOmxkUjsWBpzJH30NZeFq97gxjgPGf7bmos16AA6OgfiKVF6F3XSva?=
 =?us-ascii?Q?GS2I+giSXcP+xnG5Gk4c2j01uC8P/qwAaaOmDhfcjB6kBZlL1R7fx1Ehn8K/?=
 =?us-ascii?Q?lkYVP28HHPfJ0VIKMc69pmq9y09El18XJtonxw271eGr6KjDUwqjD8uVzh/G?=
 =?us-ascii?Q?tajYwdg+GeNrTBsFgAPyZAH9nkT+XjEvy5WTFcovJiGe4qJoVRQx+llWOHq0?=
 =?us-ascii?Q?sXgYoiONrJTGvv/z5V48BlkhZTwegpM/biDkpRrEElU2+ONXZa1uFuBYdgdJ?=
 =?us-ascii?Q?RjfDdw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 35Pxk67QBzhsiLp6mvCm7TyhAyORyYn7TDoOPIs1HR7NruosOR2l+IlFHTABVdwBCvO8AWY/mEo2WjD1QBq7RxlHxDTX9f/9JLJCZBO9+yGj71agW14Ea9NzxS+DpJjWfDAco7mH9k+u7N2yhghDsP0pOm6+y+Jruk3J8OwKvkM5K1Pd3mM8zz50nKb3g7X3d2J1aAVC5d/wdIIZDorq48Gm6rllG04U6Mpt0lvps/Jel2Nt9Ng+zUn5UjXazKai/lxLTDwMtSEZoKAqJ4Whs4aJXQz7IPQmfQI8zS2BhRRPOdGjYDTj9L8t8UJ2/KXoXVfLSi8nU19hg4X7oMjoQDC0TzkACywoRW5RjHFpa3f1CwHYgHdxOC9CtQnVXMbs1g0JMSxc4UatgenTN1CmvOk7JsVDtpm1GUh+9arq0bSIcU1O84Ig74omeqcHJgfO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 07:52:58.6965 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7f78f25-d652-4ff5-089f-08de68796897
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7533
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[cesun102@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	HAS_XOIP(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 344811180ED
X-Rspamd-Action: no action

Tune the sleep interval in the PSP fence wait loop from 10-100us to 30-100us.
This adjustment results in an overall wait window of 600ms (30us * 20000 iterations)
to 2 seconds (100us * 20000 iterations), which guarantees that we can retrieve
the correct fence value

Signed-off-by: Ce Sun <cesun102@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index b0540b009e84..b08a57a07331 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -735,7 +735,7 @@ psp_cmd_submit_buf(struct psp_context *psp,
 		ras_intr = amdgpu_ras_intr_triggered();
 		if (ras_intr)
 			break;
-		usleep_range(10, 100);
+		usleep_range(30, 100);
 		amdgpu_device_invalidate_hdp(psp->adev, NULL);
 	}
 
-- 
2.34.1

