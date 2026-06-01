Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBHpEWi3HWrKdAkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 01 Jun 2026 18:46:32 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92837622C4F
	for <lists+amd-gfx@lfdr.de>; Mon, 01 Jun 2026 18:46:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7201135DA;
	Mon,  1 Jun 2026 16:46:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="p1sycWGy";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011005.outbound.protection.outlook.com [52.101.57.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 394141135DA
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2026 16:46:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gcPBdHVnkkwSBgwqSSiZBUbmbMJ8GmDzPpUY+nVAXanpTtiGY28eQEjlHVAiBUWjyu2x2dD0QE0am/dRDVoWseex91xLy86SjL75seeLS0Zv0gz6xdRJFH6WzM2kt8QuFytjiN0Fidj8qjGxVndNt9O4J5NS1RRTJYGGAyRTbB4pilsNXeBXxy5Dm+xJcoYrDgnj3p0zKKFL0OX+7GV6/8R5/pmmEQ53yCjn4ym788QSc2MnotCLWH9HGg6TMFctLeefQ4jZt5jiUUZp/GK5iyCvXz0JyZUYbioF/grOrtrI2irMjzHSLUg4i87L84OwB1bMS5eXAZDnhrEU8ZOF0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FsqgPS632hZsX8ELcGNxPvYezkBUz61RY0JLEVZOLo8=;
 b=AIIgsfHQR8DocV5huQtUXo0f3pP8CZVVQy3Ts2h6QIEPtOE/cai0oCHIW7A14R4VcTMgFN3KKev1qfdy0suSnJRGKqjAdqmk/kw8ehgZUKDX/31PwAvCptFDw3xGveLdWd09vzNayNOgw4NwErHraIgDyAWhNkzyMY79zEadJHpl0IP4QvBFbAc+Xb+ywhjK4E0KI1azvbNSoHDAvDL8SjlBdJ5YQ6WaZnN4+BWgxh/+RjEu1MUASJiGHCwWYQ6NLjdeevXkuW9DwkkazvqQ1l8UxChxeV4GhPC+LmEQg3YUBiv0iKfaL/CFDEYvWz70lQUHoTftWuMyw27kZgbJQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FsqgPS632hZsX8ELcGNxPvYezkBUz61RY0JLEVZOLo8=;
 b=p1sycWGyTr9ljRI0phAVrAjTs0OTSkY1MO2RT3AcyogguwozmL/yBqHbgoJmzxnWhjRJVl3nyzKESdVbGh9M4rAix5VhOsg4XqtZMI1W0JdLfuDvvbde//cXs1Rf8KDxtvOGa7p03DU9LcMd85+V5WVZKUa4HhChA14SY0P3EMg=
Received: from BY3PR04CA0019.namprd04.prod.outlook.com (2603:10b6:a03:217::24)
 by SA0PR12MB4477.namprd12.prod.outlook.com (2603:10b6:806:92::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Mon, 1 Jun 2026
 16:46:19 +0000
Received: from SJ5PEPF000001D1.namprd05.prod.outlook.com
 (2603:10b6:a03:217:cafe::9b) by BY3PR04CA0019.outlook.office365.com
 (2603:10b6:a03:217::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.16 via Frontend Transport; Mon, 1
 Jun 2026 16:46:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D1.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Mon, 1 Jun 2026 16:46:19 +0000
Received: from 0yonsun-linux-dev.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.41; Mon, 1 Jun 2026 11:46:18 -0500
From: Yongqiang Sun <Yongqiang.Sun@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Yongqiang Sun <Yongqiang.Sun@amd.com>
Subject: [PATCH] drm/amdkfd: fix SMI event cross-process information leak
Date: Mon, 1 Jun 2026 12:46:01 -0400
Message-ID: <20260601164601.71336-1-Yongqiang.Sun@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D1:EE_|SA0PR12MB4477:EE_
X-MS-Office365-Filtering-Correlation-Id: e85a2d09-815a-41cc-dd4c-08debffd4e16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|82310400026|376014|6133799003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: gbyA27WBu/P7X0l0ScG345hS8/whDnnCx5lBKfvh+MZDinJqMNDImAYK24PFLbcZohT097ik63mMaBAEzo6H7YrDzC1BJPlaRlz3eaXfKec4o9+m2LmP5bXjpvjeX4sBPNED3DM38sozArJ+HXwix5Riml5mXc5TobP90BhUwWTo8/5PFUIJCG+xpfvmMWTykVUGigIjwx4vuacOn4eUd4NwMX8eGG7HjCUl1gCJpCqlKFXohz29MC2veSdTXpci+0xveCYRJsmLJNeLCJRFpSq3jyRfiaT6bOfYE1DRBg92yKioilPa2czEGZPjKrSs+057e9+qD/rC/mcibMMs8/PRYSJz4uFKQATIrFkQsw26VlwdW+F5fgeHBpPArI8y8THmkVvKUqLuL9RjNG1Xz3YPe0W+uOzqPgUpaGm1SVFnnVSTmcVk9HDwr8GDjsBKXZqI6dB9GuGqSXFH6rVNhE5SDcsDdSZPS2ghWZv1LCvsJvkF1MW1KDL8ex6nwLLwYnCUSB5Q841AvNPhGHI/bb4sydvKKrAM0393NpuGRaG9Bhv+GSwvHedpPJBuy5IB2TrJkqureEew5gv/+ZXCiyJBW2fxinCVlROz5GWLhy2qU8ImcbpfUh8ceBR+96BYzKpH6EVQVSUi4wgYOihVTxaB9mdNvwup4WWzDGHzQyOCXl1R6wVn2ZZrlSiH5seFBhemdlSwtnGBOrZnSNuep4+yHVKQcpl3aqJiydqN/ws=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(6133799003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: R3Q4uK2lNBufUzEpy7QMXN/Q+ILPzWHm+jb4mAYgf0XaCbNwLcbBEzzrUkpRoEkrPoFDwWj7VUvnl10Bx9YkVZC0VUoIaFdeaWbVMBk2hJxwj4U1b+tpKTvl7rPvhp/lXSNqFno8O40R/opWhfnmQOFBgyBGvyxZG70etunTD3K2drgEm+TsCe+eJxDcDw9qaieWHn/OHWJ6TMOcPTtkNibX3f+lvkIKdAYh/lf/KPjWGO7J5RupmaHTv8h9uQjFtnbBAQAJyLKTknullEr7N2mAwH3e5ejhA8mnqsBv69SvIiqfnIv4LKIuY6K1ZawYpJUAOftYMF5IMKIC6AeOXxT0xyYjgIdjI2WKW43NguTVlhRR2W5CCCkub8/PHf8xxovDk4pNZUX5ekzcjri3mTXjjIn7xgGkOjk9ZciYM0kEZa3JVzpj7JMsgS1kck8R
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 16:46:19.0040 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e85a2d09-815a-41cc-dd4c-08debffd4e16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4477
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[Yongqiang.Sun@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 92837622C4F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

kfd_smi_ev_enabled() skips the suser privilege check when pid=0.
PROCESS_START, PROCESS_END, and VMFAULT events are emitted with
pid=0 while carrying another process's PID and command name, so any
/dev/kfd user in the render group can monitor all GPU workloads.

Pass the target process PID into kfd_smi_event_add() for these events
so the existing per-client filter restricts delivery to the owning
process or CAP_SYS_ADMIN subscribers.

Signed-off-by: Yongqiang Sun <Yongqiang.Sun@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
index d2bc169e84b0..fe4b93692385 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
@@ -254,8 +254,10 @@ void kfd_smi_event_update_vmfault(struct kfd_node *dev, uint16_t pasid)
 	if (task_info) {
 		/* Report VM faults from user applications, not retry from kernel */
 		if (task_info->task.pid)
-			kfd_smi_event_add(0, dev, KFD_SMI_EVENT_VMFAULT, KFD_EVENT_FMT_VMFAULT(
-					  task_info->task.pid, task_info->task.comm));
+			kfd_smi_event_add(task_info->tgid, dev,
+					  KFD_SMI_EVENT_VMFAULT,
+					  KFD_EVENT_FMT_VMFAULT(task_info->task.pid,
+								task_info->task.comm));
 		amdgpu_vm_put_task_info(task_info);
 	}
 }
@@ -356,7 +358,7 @@ void kfd_smi_event_process(struct kfd_process_device *pdd, bool start)
 	task_info = amdgpu_vm_get_task_info_vm(avm);
 
 	if (task_info) {
-		kfd_smi_event_add(0, pdd->dev,
+		kfd_smi_event_add(task_info->tgid, pdd->dev,
 				  start ? KFD_SMI_EVENT_PROCESS_START :
 				  KFD_SMI_EVENT_PROCESS_END,
 				  KFD_EVENT_FMT_PROCESS(task_info->task.pid,
-- 
2.43.0

