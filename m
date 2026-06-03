Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /9NVEZ1XIGo01gAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 03 Jun 2026 18:34:37 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D34639C83
	for <lists+amd-gfx@lfdr.de>; Wed, 03 Jun 2026 18:34:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=Lz1paBtw;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8594A1120CE;
	Wed,  3 Jun 2026 16:34:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012009.outbound.protection.outlook.com
 [40.93.195.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88551120CE
 for <amd-gfx@lists.freedesktop.org>; Wed,  3 Jun 2026 16:34:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PbIuuQ/kg3s/NF/ODCDDrwH7VKKtEV1Lgz94F4SOMhWusw9+mtdVgwfw4armAjg48o5QUN/e1OklernMZx6fUQ7iAVJTvPmhB9jOH3Jp+fkLEpwiRhGdVug4Eevesy2IYKcjSZZuSPpZZC0a63WOmIiyxmKgKZPL/6kl9cs5r5qHKrd6y6kXc+JRaz/0tKLOfmhw3Biw3rmb9qzqlIIIXyEpL/VaUFX5HGDQcCBINtG2N4FBvmTa5+r3ajR960/fd+Nr+gDna2nHyxdeyPoQ6N5NiM+iBiOzbM9ZwNQB/h4RcfIGYohXcDFUeF26yLkvkaxADFN0JeAWxaBHs5EhRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QhFxdkQ3nOih/OLv71S9YOppbk8Vbd+9/86ZmqFjvOs=;
 b=hSuFAQkG4GhofoOtSVrHQNeenfNJvuizCQKMBw4fzZDoL2ZqBMQ1azQYihe40XQy0JxBqqOAD9Ad4/j3jhXVUoCPOhMMqsFDhzHEy+ca7GtJUuT1Qqg1XCU1pBN+hoBXUicxfOZIzTJnkUmioMk9coev51EUTc/MuJkWlKy98puEhxVMOpFiXx1dOpNdcXTZngS3BtW44I5kBULhlk9/yDhP2EB41Ty9ePz5b6tRq8erIKqpIIRjbiNIB4JWILsusOQ7Ec/uejH6J+EkItsp5h0TUTfvxoJLkuJbAxMojFszUuGnrlPz48aeA5W5XlhlYSZ9c58eVpLf83WffgShfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QhFxdkQ3nOih/OLv71S9YOppbk8Vbd+9/86ZmqFjvOs=;
 b=Lz1paBtw62FAsEg3x0Y4uAOt+Lno6T4njebPkfSYJDZaWT1fEhAsIM7+waPffsqNiS9TbpfK29bXSAZyzmZbrzQ9btAEC78H8FUEhAlmQlmpx2c7ymXTpFRkCgo9IBxFepwNmiS26vdcwaiA3i8YUL0RHEGU8OXczQatZuxSNHc=
Received: from MN2PR03CA0028.namprd03.prod.outlook.com (2603:10b6:208:23a::33)
 by CY5PR12MB6036.namprd12.prod.outlook.com (2603:10b6:930:2c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 16:34:27 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:23a:cafe::56) by MN2PR03CA0028.outlook.office365.com
 (2603:10b6:208:23a::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 16:34:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Wed, 3 Jun 2026 16:34:27 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.41; Wed, 3 Jun 2026 11:34:25 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>
Subject: [PATCH v9 11/11] drm/amdgpu: Signal SCRATCH eventfds
Date: Wed, 3 Jun 2026 22:03:50 +0530
Message-ID: <20260603163350.2678309-12-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260603163350.2678309-1-srinivasan.shanmugam@amd.com>
References: <20260603163350.2678309-1-srinivasan.shanmugam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|CY5PR12MB6036:EE_
X-MS-Office365-Filtering-Correlation-Id: 525bba09-e19d-44f6-4b66-08dec18dfaa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700016|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ldKdxF8qHg7QgKLrd8k6Z8z+uE9SmytNAtKSviaMSID8tgDmQu0MjQhkJDMlaBcYlDvA/i1a9CHjH6ycC0lNk+GC74We1hj4fLNKTB8MLQDXb1DeYqXNZmzOTRczAuRI0mn9viKnKjL4sP1oNfLmyvbg1xJpcegSi0qwhQR54xanzhi9BaMN8ccibGLwr1Xk9hnGT4C5Y6TDP3D4neNauh67uUDVw3LSkUReUdMHmemSyKo1zR3LNfPr58D6qnjnfmk497o8vC3UcsXhksWW6Txf1fuS8Up+ah0gSCUrCC3VGmMaTwFhAMV0H/0J0G2bH021vUkPneX8dtl7jHp+GroOxlQW1AXnZrYVO5LTD3Y2+Vtnot+34kultj0q8o5HYtXQnxmH+90ajHplmMpTdxtTYAn2jzxksYnFzZ16r1cZ3vS2Frip5CGIASSNNQgIl1mRgszNYMWQp9NtTNkVfboOSzDDvbEB0ehhPwT1vbTxG89K/67fn7zLfwV5qGVOR9iAtziyxLbPMnZJ0F45xjlg7H1xmlXwfZQ8ag8ryHQa8KnNlRWIjK4K2aJICKuumSh+rN80j9WI+kbEfpAK5b2lLuP2IEHJozmn6oZmmygwW/ZUIZg4n9N4G/Ejt2lprULJLn1DetQpSEkMX5MjD0t3GHz8+GdUdRt1bYiBBHwJZTiMbk2U3Q59uynuLtnHjQKasmASrtBLiU/BsRGXRIjCMXmD6Q+j6nZ+V1pbqVg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: addWIPNamopZpdQ9J87m5OIExMJ+Atgdf3loD5KQmFkEgcVJZCMrjU/SJc3sJM+izlcqDBjOVIdVo/laIdWnUmS0lg+QBDBK9l82UFnZxj9k//rK7xResxDdBP1riMvS7XskWZ39tixKuEWygxyTmxD3PFGC1wU0Xv1sHQGX9Hbe3PTYLn5SXqVXqKd9K2SSwBjzmDrUsabc09ZkgRmfSuPKbMXx2oRV7BIYNwfHE1VmLoS8uT6MirWs5tTK65jKv0/A5GP21xS4cZ1kYMNBLcnQKpXoFtTg/vbui4tM2OqUZGyn3Y2SGpj7fW5cmuJ9/dn3X0cyK98NOEjZokQqCKF54IxMrciTTtNGibL7YveLsrC1FXeimes4psuwxcmjcZoapGbXGPC2Q0umw0zLgIN2gwYX4iAs6J8RZXz8EB7xEgSMvgKR+64f3WTUhIKS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 16:34:27.2445 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 525bba09-e19d-44f6-4b66-08dec18dfaa5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6036
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:from_mime,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E6D34639C83

Signal SCRATCH EVENTFD subscriptions when user queue restore detects
missing VA mappings.

The INVALID_VA queue state is set when user queue restore finds that
required VA mappings are no longer present. Reuse this point to signal
queue-scoped SCRATCH eventfd subscriptions keyed by doorbell index.

EVENTFD remains notification-only.

Changes in v8:
- Use queue->qid instead of doorbell_index for queue-scoped event
  handling (Alex)

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index d5ea69e7a67c..5c2d8151cfb6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -888,6 +888,14 @@ amdgpu_userq_restore_all(struct amdgpu_userq_mgr *uq_mgr)
 			drm_file_err(uq_mgr->file,
 				     "trying restore queue without va mapping\n");
 			queue->state = AMDGPU_USERQ_STATE_INVALID_VA;
+
+			if (queue->userq_mgr &&
+			    queue->userq_mgr->eventfd_mgr)
+				amdgpu_eventfd_signal(
+					queue->userq_mgr->eventfd_mgr,
+					DRM_AMDGPU_EVENT_TYPE_SCRATCH,
+					queue->qid);
+
 			continue;
 		}
 
-- 
2.34.1

