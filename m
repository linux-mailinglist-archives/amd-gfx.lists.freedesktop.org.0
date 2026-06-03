Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id utl4CpxXIGoz1gAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 03 Jun 2026 18:34:36 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6AD639C80
	for <lists+amd-gfx@lfdr.de>; Wed, 03 Jun 2026 18:34:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=uglIqPlh;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E001120C9;
	Wed,  3 Jun 2026 16:34:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012061.outbound.protection.outlook.com [52.101.53.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCE411120C9
 for <amd-gfx@lists.freedesktop.org>; Wed,  3 Jun 2026 16:34:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=io5fYH4pHqXKFbwQU+w0OGS1hm9jVjbBRuGB+U4H3UQ2en12SI01kZIYK6KEC80HOG/vuomEcCgS/8Mfe6fOcA1cnpaX9oVuEwhhNCrMwf+bVzk1oAXnkk3s/IAjPV2JfDNi4WC3kuyd8K2AMth7guyGWvn7Oqxg7l77bLRWLYOWAgOrVS4bx3BRU0XWpNrrzEglNlDr1bFqH8bmxYor4fnmXpS1CtWjZHS3KG+vrSSuhRZOztlJQ6m9E3Jdxjq2XfkkGEsJvY3Qi5RmXJYOxkrr4CmDIFWrFPsHyPBzzV1B14wg+lAoFFh9NekFzymmV+BReBaULh+8FZhAkklz1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZXb7kAhTUijqE+6ZV6W4Y+TzBQ8YEqbvMDA0xt4ru7k=;
 b=fMWyYZ1MqfQbJNPhTj36+i8M+gtvjLOA+lFWB2BrxEnS9TMH5L+RGpra0NJh0NJKBLXmG0YcVHUe8rm2eaEraP0bCRzTNVi07sMTwyp7NSGpFvX8JJQ0f1exoqUthJv3AjX/0tJ7kj8yaCZFKmV8BaguRhwycaO6fMfwYMuDrMLB0xMWgOzhKPiqDmIMnv0EaAZTVO3bK2RbFE1+MC3H0aVmHLhDW6A4xAkswl8KyMKNNbbJTH6Wc7Mup4NPhIHjy99d7f/Q8KNCrvLppQJdEyJqPwrcNmhQXNtZcoxdoeY1x7T2GqEB6CWed0Pca273Wrd3sU8Ayd30ououaDdiCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXb7kAhTUijqE+6ZV6W4Y+TzBQ8YEqbvMDA0xt4ru7k=;
 b=uglIqPlhKpUC9HmaSg4zSUpqep9bmYChRWMYZEPz81TIUwts5paDg8wygJallP6C6OTcchZUiuRdj22s7bR4eXLROZ/VWbkDKELqhJJzeF7VEw7Fwv0Y/jkwxFFyWUeIeQeAM1098e1tEU43aUU8BMo1b5NpGoSE0tMRgN8thII=
Received: from BL1PR13CA0348.namprd13.prod.outlook.com (2603:10b6:208:2c6::23)
 by DS0PR12MB8071.namprd12.prod.outlook.com (2603:10b6:8:df::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.7; Wed, 3 Jun 2026 16:34:26 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:2c6:cafe::ab) by BL1PR13CA0348.outlook.office365.com
 (2603:10b6:208:2c6::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 16:34:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Wed, 3 Jun 2026 16:34:25 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.41; Wed, 3 Jun 2026 11:34:23 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>
Subject: [PATCH v9 10/11] drm/amdgpu: Signal MEMORY_EXCEPTION eventfds
Date: Wed, 3 Jun 2026 22:03:49 +0530
Message-ID: <20260603163350.2678309-11-srinivasan.shanmugam@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|DS0PR12MB8071:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ba1114d-ba3e-4c91-13eb-08dec18df9cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700016|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 6O/+eRyH8PrVaGyYLWAW/wj4aEQqxWxH8MlEEiEmjcmQ0EsQy7ZZ3YLXUgFLrU7PgtQKiwKU5/1fhwcHSpof8xF/AO0Kk2bwE00SvmNbdlQ4VDTFgvervzZq7ca07iJdCqq4q7PdhNcbZhBED+Xlk2zSEhWHArVbLlJnVAIEC3CWF5SEf/58mzNW8wcY5hkJfpxUKkjb39mWcbkfC8DBF24S+fG+wGVZB9GH+SmzmodmdTNxAC2Yad6hvTOtLobCPVd+O5vyIK1WePAIz4vT6x1AfmMIdTrriRnI85Xs34ePSqDzw38eDaM9gQyYEM+uj+wLrkFHgVkNwQuLsqiq5crHemEq7TdyAvsJWkdu7IKDuJOTYe+fbOkpimc4kAF+79ZGOCFFL2G9de/LQHiuVtEJxSi0iWENevxjtja8lyLmD0gZ5Cd7OX8ygyRqxBKIfilkREyW2joiv4EbAVJYSZi+kW0kXDaRx+tEY8d56zy3NL8HlPGzeRe8FdxF8EnlULriR4j/VQ1R4s/rNOYQPadrBEgKX8PavkfmTxIU+iVhLbTD4dDr40r4HT8/1L7ItkXAqK2u+7seDsFyOGqQr2oFBIZDrzn5JEJDsTh3sQN2AZ2JRWsktmF3oGzg5q+LtDl3ReLqZHKpjAyetHad6Mzx9rRuiimHI3cw9GDkyKA0V8/+v0SlmA4Qlw/tQkDV6mbaCCO+YkviXCj9g9DR077LnJqX1a6uW6JQMEoPQaA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: tjNN2TijAIUwf0kRzQ8YCU1GEkDVxPSjQif8TCON4GfEyZcBo/piljXfT0fVtaNkv7F3BFyROTIV624MVXGpgRaemdhyw0GNVa5l+zvEKaG2ZuSmzhR3fbg3OKajhLzpJC7vHkOS8kBhi81jymitPHQOcwFr7ETv39XjZUMzAoaNus3I1QC7vPj1uh4dKtW6nYW0KbkXtZ69QJaihikQXQ9Qbr0XWWhxfU1JREzhXGTDd1XwUvsF+vcRgjSrkL6PGC6WsGvgB2U9AVb+WYBvZAscvG0PAPXEINoxW9uNWl+1gdP1y/VLIzckyPkUh2oQvk0UwCBTG3AxruFhI+aFPzizIBzyBoPXnzTESrYS4j+9rqEfLQfRRlblVkd+dxzEqEK7KCMqV9paxfvbBQ0xr7DNNoMc+9UQJxPci64njS/Drgyyxbl+G2nrnMNC9Ny3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 16:34:25.8266 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ba1114d-ba3e-4c91-13eb-08dec18df9cd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8071
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
X-Rspamd-Queue-Id: 9A6AD639C80

Signal MEMORY_EXCEPTION EVENTFD subscriptions from the KGD-side VM fault
interrupt handler.

Reuse the existing VM fault interrupt handler which already decodes the
fault address and status. MEMORY_EXCEPTION subscriptions are currently
GPU-scoped, so eventfd signaling uses queue_id = 0.

EVENTFD remains notification-only.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
index 8eb9847d9e1e..15f9d259e2b5 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
@@ -135,6 +135,19 @@ static int gmc_v11_0_process_interrupt(struct amdgpu_device *adev,
 
 		amdgpu_vm_update_fault_cache(adev, entry->pasid, addr, status,
 					     entry->vmid_src ? AMDGPU_MMHUB0(0) : AMDGPU_GFXHUB(0));
+
+		if (adev_to_drm(adev)) {
+			struct drm_file *file;
+
+			list_for_each_entry(file, &adev_to_drm(adev)->filelist, lhead) {
+				struct amdgpu_fpriv *fpriv = file->driver_priv;
+
+				if (fpriv)
+					amdgpu_eventfd_signal(&fpriv->eventfd_mgr,
+							      DRM_AMDGPU_EVENT_TYPE_MEMORY_EXCEPTION,
+							      0);
+			}
+		}
 	}
 
 	if (printk_ratelimit()) {
-- 
2.34.1

