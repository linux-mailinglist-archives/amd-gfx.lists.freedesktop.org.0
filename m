Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id udVxIMzdO2q2eQgAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 15:38:20 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0496BEB15
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 15:38:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=1RTrcBgG;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7EF810EF24;
	Wed, 24 Jun 2026 13:38:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010065.outbound.protection.outlook.com [52.101.56.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B48110EF24
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jun 2026 13:38:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RVaUPv24sudmCnwMfMlABZhDDManfOkt1KjDyokd+FInzDH+Ps2zWuofJWF4ft1g/eGx2OiqStEu88uFLb6X6erU5ZC7JCYayoqsTwBcojQbUGIJQ5J/LKTBzUqjK4xFzYI06rTTzv6lYYt5UNvNpAQjH+yKot3IztXYGkMKgAkZUvy7oW9mW7gfIB25gWdxuAl3vtMEgECmJFd6R6Oz0TrajzJe5zbQn5qyChXeDu6PYxmEfuGsUkMHhAoHduG2Tdl67dVbWiJGCTNMMjAmpSRH0T2BANmZ3LDeZxIvOCXrLXJI+mMLJRWO3GvSHK6m6Mk2Zix5W6iYtGYIpSJnpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XOzVJTTpKxc6V0zME4CNaKeN7IRPoiVuP/wN3fOS+CA=;
 b=XWyLkLLdhUNhJ9nxJxQmwP8lKmeLM0CTu5Kgd1Exz5Sa5HvbOPFazMVd6AZ1tlTqQnwN0xrKE5uGFPtqSbeU1B0F4eudUo6k3Z9PBqbJSrw0HStwNq1e0XDj+yyLHnn8sWdrdqsTLily0TS/RLtuEN+U9uyTyChG9jQpDth0TfwgQmg3VYr6o5V2fFy3v8Qw7ysD8QN5mU9QTEncAbww4Z3JmgOf/L/CJBOJAoCyeGkX/9B7XElz9BhSJeZSzv1CxM56nA5KLIDHhvFDy5Nbs6rlnXiQER98uorkimyuJJr2rDhMNsfVAPADQlckpy4/YDTun7qhS013gWasUJ3siA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XOzVJTTpKxc6V0zME4CNaKeN7IRPoiVuP/wN3fOS+CA=;
 b=1RTrcBgGXP/Wr1pRc89U9Zrr5RVmblbcnk18qAorUBE0wGG42YT2xHmJ9OaWsk+c/Zh0izvfCHZCa1YyZSDfNUBGeyJbYNbzdRcNkk8/VTzRVbyr8FFto+ZLdyiu4DRU8PhpWG91cbc1QDBtyeWEuAQxo3fifpgGy8PlprZt2uc=
Received: from SJ0PR03CA0146.namprd03.prod.outlook.com (2603:10b6:a03:33c::31)
 by SA1PR12MB6917.namprd12.prod.outlook.com (2603:10b6:806:24c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Wed, 24 Jun
 2026 13:38:07 +0000
Received: from SJ5PEPF00000207.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::86) by SJ0PR03CA0146.outlook.office365.com
 (2603:10b6:a03:33c::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.20 via Frontend Transport; Wed,
 24 Jun 2026 13:38:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF00000207.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 13:38:07 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 24 Jun
 2026 08:38:06 -0500
Received: from fdavid-dev.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 24 Jun
 2026 06:38:06 -0700
From: David Francis <David.Francis@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: David Francis <David.Francis@amd.com>
Subject: [PATCH v2] drm/amdkfd: Check bounds in
 allocate_event_notification_slot
Date: Wed, 24 Jun 2026 09:37:47 -0400
Message-ID: <20260624133747.1645343-1-David.Francis@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000207:EE_|SA1PR12MB6917:EE_
X-MS-Office365-Filtering-Correlation-Id: 8541a5cf-0695-4516-9cbb-08ded1f5d338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: oG8WiryVED8OADN3Ap8P8RhspgRBfwgOw+TNUuT3kemuOC1p1cO1DnWW93nNu5HyhvbQ+7C9SUOhqu9KFQQjVP6862ip8Mu/65ARcIL2N3ci9J3Vx5kQHAWLpOMGyeMbV5IrjA6ks5QF+ZX3nsi0wAJqcGDl+ekW/+cW+9RylzM46yXTYzmGWOeJQSFiOFFrIkbePC/p79kYDisPE0UBgSd/Z1J2wNpLrjHEkNUwdZdkFPipP5Yc7Nv63UACLIdwyOjx7wcGSzFczHGiwAGq3vaAgD5IWl6liVSmeoCpYrbpQL6POgwA8Q+crPidePOQ5w1oJUWPSIYkaZMjLtyqOEpH4PFbfqypA2SG6BUPms+ONaowH2L2zSFD5bGHCTklxV4kzIUEJ1RxDXjYqSp5qnlKH+BmPnxFB5fbMOWWYN1IrGtmPyjN8CmbR4k238pSXfPzAqrWBOxOugxmQGpSYhW3473RQ0ceWuDo8mATOC31ZpqnDac6L/1X0jBUX1FbJcILnjJohUXSHMoQgpRb269HZyPG2248w/Ul2zoGqwL7LnRULggs9pYPrkdKCxnOsXYvozeJlfXV3X12XaUxkuaOVt30Nn8sTu3lrjrEot6XQwbWVMXQUtSpP52U13dUu0X1YYrWnlGzIIFq8Xsjj6w5iKfn6r588uuG8YhjEIm7DGUypzbFy2Ym3kCE146cElQGsErWm58s/CXvnp8Log==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(56012099006)(18002099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: cdOvSsm6yy24k8ox1bEUDP6Lzc+Er8wn5QNGDZ57Q1RYmm1bR5sWrHI+tXOsBsWBjZZlQGC9J/log2OgpUkHnU+Ln3yIh6m1NYjrFEVYVuXS7YVYIz5vpRgWLPznVVJuTEoHod2WGcV5gSpafRzYrg8SA6LaWamKfuoIDBPm2U7E6IPOyDDDPae2S3Taz07VsCcpl71vkgQbMaHrmWLIxhrHfg0FU6DRI8VbWITi4NgyyqCWL2mqi7jKICrMV2yFvWlFYyC0AVnEnfQdnFnM+ElGHrvnw0IFLRGQcb9UYoKeH6ZJEgO47h5rRbfwUx4hVH+rWmP77TUeMDAuBhUcGbBJ33R8lU+0CxvZV71giQajDg5tkMTAWjicZOA497ZBQcUFip+MtMl7PBmsU5a56LRW87+uNXpkqxguLQ9O6KC/gc9pzcO5D1acUkm3OsqO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 13:38:07.2814 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8541a5cf-0695-4516-9cbb-08ded1f5d338
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6917
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
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp];
	FROM_NEQ_ENVFROM(0.00)[David.Francis@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DD0496BEB15

The valid event ids go from 0 to KFD_SIGNAL_EVENT_LIMIT

allocate_event_notification_slot has an option to specify
an event id to allocate at, used by CRIU. We weren't checking
the bounds on that value.

Check them.

v2: Lower bounds check is unecessary because of idr_alloc
already rejecting negative numbers. Upper bounds check should
be KFD_SIGNAL_EVENT_LIMIT since the signal mode mappings might
not yet exist

Signed-off-by: David Francis <David.Francis@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_events.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
index e9be798c0a2b..850d6befeb6d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_events.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
@@ -107,6 +107,9 @@ static int allocate_event_notification_slot(struct kfd_process *p,
 	}
 
 	if (restore_id) {
+		if (*restore_id >= KFD_SIGNAL_EVENT_LIMIT)
+			return -EINVAL;
+
 		id = idr_alloc(&p->event_idr, ev, *restore_id, *restore_id + 1,
 				GFP_KERNEL);
 	} else {
-- 
2.34.1

