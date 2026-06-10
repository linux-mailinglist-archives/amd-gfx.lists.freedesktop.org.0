Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TakKC4j+KGpgOgMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Jun 2026 08:04:56 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF5466611B
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Jun 2026 08:04:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=uDy63dPq;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D8810E720;
	Wed, 10 Jun 2026 06:04:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012066.outbound.protection.outlook.com [52.101.53.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F6B310E71F
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jun 2026 06:04:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JFps4y7O6X52Q2ZsAn0SeWA9GXO/mrStQgautUz7fGg5F+Oo12JV5X9O5XVQiTg8rxRd4e2zrUUEoaAmYqa/tR8qT1cKaL3i4izounLR03dHiXJFeTzu7yK4nqOJ4CaqP7GduBLGa22yYS3OCiYCFC1ftQIZVY+d7sd0K8H9vVU49jGrX24g6mfPHVdOAQldvV0HP1FvJo3+QoEjoiX3ypd6sVhwj+MoDom0ZfuZrTa4W1cliy0fcZOOx1Bw7OLl37/xRvIsK3ZuAtip4Z1kOJ2rBXhJsEJJsfpjDUT/lOpMdI3g44PNNGqk2sYW75YiaOLmM5UAAGi7fug24GXaSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+aEvKOmA8Rzd0FwR0AbrFxhuzLauv/OowknUzsA2+VQ=;
 b=UHzNWMfUEnvAj5DLpVE8iNLCwu4Y16Sizk2xfFs/pkk+koi4Z3TyRXO5H4w1U6MpXH3blX/xl3Hn+2+oPnabH8FxCIwIXDKG1hcE03Lny8vS+0qe2FcbNtAe5Ame1KCKeXikTMvJ4A8MdLlemg1LMpVKYxgYnwcVB/8OvLcmTI/fdrCStk9O/xzXM+uv6KewN6z7b2nGm5PwWof49+8rDa7dFG5rLfJJOsHJBai71emvteVEpwVz6mzE10eiQQfm8mT+UV9/lEjUhEUO3N44LlYLT93XBQ4l+hLztnbiuuh8f9V/XVESI9N/QYH7R8gLAYmMxtE4PEYHnqXd1AH42A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+aEvKOmA8Rzd0FwR0AbrFxhuzLauv/OowknUzsA2+VQ=;
 b=uDy63dPqx2phQBObaTsKkecw7HKnVQUzo9bRDOGN6bCPkQ69pa96cRnm7khe1Ws5zDjJdXjIvAP094wNAFQtCNEykBM5nuDOfXXYttvEXeAz2BNR4qLD9ZUe2Dl7EmKCR59hvccNTrIjOdaoYWiNqQwEHoPXn9RnJKJMn+s1ZTo=
Received: from BL1P221CA0002.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::32)
 by SJ0PR12MB8138.namprd12.prod.outlook.com (2603:10b6:a03:4e0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 06:04:48 +0000
Received: from BL02EPF0001A0FC.namprd03.prod.outlook.com
 (2603:10b6:208:2c5:cafe::73) by BL1P221CA0002.outlook.office365.com
 (2603:10b6:208:2c5::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Wed,
 10 Jun 2026 06:04:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A0FC.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 06:04:47 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.41; Wed, 10 Jun 2026 01:04:45 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>
Subject: [PATCH v10 9/9] drm/amdgpu: Signal SCRATCH eventfds
Date: Wed, 10 Jun 2026 11:34:02 +0530
Message-ID: <20260610060402.2769642-10-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610060402.2769642-1-srinivasan.shanmugam@amd.com>
References: <20260610060402.2769642-1-srinivasan.shanmugam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FC:EE_|SJ0PR12MB8138:EE_
X-MS-Office365-Filtering-Correlation-Id: a2414a67-8574-4556-8274-08dec6b62d2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|23010399003|376014|82310400026|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: hnR8ru6Besdz0hh1OtyIXIx3ZNTeAPZzPM6doYu8ZaYEIsuh++er51ELIXCIlzTmSNLhWFXnvTXoV7U8DweIFuW136ujnLfg0Pb3v1LHwr4eovAvmOwWMXdYVTRMFz1RDIyXdnji5HyyAs6+WFJxrzalOJ3YEUn0dgmvVplWEMb+eNB61vHviOtQ7D1RO5eSC2Hc80MPG2QpRSmQXYQAIJONyoukeZB6+PEifzPBJDwzT7wUDNc5PDWYmVqT143NvMatY2zVs2NQvfDp2WZD0E9WBoAW/ti6zuEO/ng7nl0+/ZZcoNtPf0EMPEtw+/ibFapWwgu+XaUEgQ3TpBZ3whZ/Ad3mLvEkublg6NLYmzdtYnr0XijrwX/etluLy1of1epnQ/c2Bi0sfwM3et9cxJkpmPZ8ZLuoNXbEm2gULWfv0ZMJhByGzkNFu2Db98pN7ECNyWMShguhQQRJizEXNkRrXHvt7yrY3M2MOohrT06TwHT8dIPXw5Xnx1TlFRC8PL5jHphN/m3hhZbpLHO0TJIabMNxG0TGuY0uXXfxNX2aB3mDsElOpfpMGtZpsUU+oTGowNj0hXqqM69Rl1AQdzDmvbHWKJs+0B315K1+6iuu7pzuJsHeJOLnLq5/XgEwoM5olMBOeKT/h/HZZbemMZtgzZqkfz832fZbrWX9AyGqPZDd8XuNDOVNxg+sHGOaeyC7XmAdwjNmx7gPKV1GztB9dQFw4crkyaUgBObNj8o=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(23010399003)(376014)(82310400026)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: t8D7b5T8a7pw7smDVdOikULBWBkFM9y5EP0mJ/dWdq3rgGwI3BKgysdnT6o/EmCe7eFNsMGiIme3zrfQdbfZMaLEP7KocU/+7adLrEZ3Z3WZoAcnvyfaHCF/eae6JxwdNt0JeW9ksL8tsmXLjVYDpKHhmCP8xy495R9LvW3QNCPGV3LYrSni59EZaQHf5E0jAUQ6KCwS4EfcOqlLSen3vKNMQz7LpbHYzsVCHCiwdcSVIPRV2GrQjyNRNQYE29VdJh8WJfLdb1qBdISShho9Xggou/BTBzjWnCZJSK6DwSoAJ8/mxHDxPxXNR5lLXDkmwnCDb/ognUIndALb6FJcO4fJlZavU6WKd98C5LF9/02dVgRd5eKlK61HjQ1w59yc9Dm7cpVIgtvywaEXH+3d7xDbWGnhOnwzcJN/71LK50r+qVwvUoXDF2TFC2qlPE01
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 06:04:47.7074 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2414a67-8574-4556-8274-08dec6b62d2c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8138
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[srinivasan.shanmugam@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:alexander.deucher@amd.com,m:srinivasan.shanmugam@amd.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivasan.shanmugam@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CAF5466611B

Signal SCRATCH EVENTFD subscriptions when user queue restore detects
missing VA mappings.

The INVALID_VA queue state is set when user queue restore finds that
required VA mappings are no longer present.

Reuse this point to signal queue-scoped SCRATCH EVENTFD subscriptions
using the corresponding queue objects.

EVENTFD remains notification-only.

Changes in v10:
- Signal SCRATCH eventfds using the actual queue object instead of
  queue_id.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index 45981adbd7d3..7810d26bca17 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -904,6 +904,17 @@ amdgpu_userq_restore_all(struct amdgpu_userq_mgr *uq_mgr)
 			drm_file_err(uq_mgr->file,
 				     "trying restore queue without va mapping\n");
 			queue->state = AMDGPU_USERQ_STATE_INVALID_VA;
+
+			if (queue->userq_mgr) {
+				struct amdgpu_eventfd_mgr *eventfd_mgr;
+
+				eventfd_mgr = amdgpu_userq_eventfd_mgr(queue->userq_mgr);
+				if (eventfd_mgr)
+					amdgpu_eventfd_signal(eventfd_mgr,
+							      DRM_AMDGPU_EVENT_TYPE_SCRATCH,
+							      queue);
+			}
+
 			continue;
 		}
 
-- 
2.34.1

