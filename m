Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFKtL5xjGGpEjggAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 28 May 2026 17:47:40 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4145F49B0
	for <lists+amd-gfx@lfdr.de>; Thu, 28 May 2026 17:47:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC8BF10F3CE;
	Thu, 28 May 2026 15:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OaOxKbH2";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010016.outbound.protection.outlook.com [52.101.46.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B234C10F3D0
 for <amd-gfx@lists.freedesktop.org>; Thu, 28 May 2026 15:47:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a+52kwaVW+sn7myswEtuqQyANDDGNZBePfJdfHWAg/7g3GIoEFEq2K2tj2m4e5gP+ectIj5if+uJWGuKfpWjfFYUjEyCpbs2ZYrpI51BCWay67RP8BwMyv6BMiz9IFrvEQ1hHmzG7wwquZYiY0xEjo9xSByIz/biDR0e7X7mWAKfhp3vLAS1MHUPly1jPgP8UQWgWVR6/JjbDK1ADRy2E/++U2t1A1sjSQnoctkKW3shqmwYnRK091hvkou4WwA7dpu9YFujSvoLqpCc8cRQ4vw6PiklnO6/fuOJgAeYZfAH70m1r86KIimxJcv98S6gIWEsclMdfT2LSukeow1AxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cXM77qVLFYfSacCLGb9LaqQp1XCd6f30DCA1WEMUvSk=;
 b=mfxNRt3nXzK9VwFk3zWQVRfbLL05ZfVcXMA7HDvprRigN6UDEwEK4RGr5Xd9ETCGo0kEDDXBqZP89xpGzbAwccO0hTed/QWY0ENyOwAJsyRS60e7axr6xG+KK4EpbLtUVs6GxtyDNgNzO5NbT7TG0lHyJA7hB2ewhYsHo+qu/avceocWlSx1GtFq+36r3cp6MEC2FlyNrHlXh8a+BZCzOq/ZsIfQmgc3OeSXIn3KsiFT/nqNAjr+LBc7ULAcaslFFASh3NgbOiSJOKWjxvgInmlzAx89LinXqvtwJweoiIvBsM6xMtPc8VpFbdci1Epdjz9RyHzi6Ilot+zNuvcofA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXM77qVLFYfSacCLGb9LaqQp1XCd6f30DCA1WEMUvSk=;
 b=OaOxKbH2GMUd9Egg+L2OBpAzyr72XkNI11XgNxSL/Big9D53e8ypuxtEgxQDQMTxfodBJ5XtlFON8NAqzxlP+3kP9wHxPfND40b6uCwlmPUYQgeyG2vMtEdYHC/8u8ituNj/2SdlGLr/KM+i4zFmuuid33S3CXfZzIRXuMZ81DQ=
Received: from BN9PR03CA0040.namprd03.prod.outlook.com (2603:10b6:408:fb::15)
 by IA1PR12MB8079.namprd12.prod.outlook.com (2603:10b6:208:3fb::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 15:47:31 +0000
Received: from BN3PEPF0000B06E.namprd21.prod.outlook.com
 (2603:10b6:408:fb:cafe::16) by BN9PR03CA0040.outlook.office365.com
 (2603:10b6:408:fb::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Thu, 28
 May 2026 15:47:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B06E.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.0 via Frontend Transport; Thu, 28 May 2026 15:47:30 +0000
Received: from atitest-Rembrandt.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.41; Thu, 28 May 2026 10:47:26 -0500
From: <boyuan.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, <leo.liu@amd.com>, Boyuan Zhang
 <boyuan.zhang@amd.com>
Subject: [PATCH] drm/amdgpu/vce: fix integer overflow in image size
Date: Thu, 28 May 2026 11:47:07 -0400
Message-ID: <20260528154709.824142-1-boyuan.zhang@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06E:EE_|IA1PR12MB8079:EE_
X-MS-Office365-Filtering-Correlation-Id: c9653726-679f-4ddc-dabe-08debcd06d55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700016|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: KtGYnZNu4MCQG60eVKPJ3juO1IGSynmFhZnDij9s0dYLoFpK+JtosE65zmhcvgAS94Gmp+j6U7TqKkNKZwb13GVVEz+1Bh/zKym8Rzh822LB583nwbNdc/Lhvci8PFtusUm81TtVQ/EwdTEoyzzPXwPW8TElRE9z54eLZkjygIpmBC40eoG0D+OuNxWsxnUE5QvMW+qyukeUeMSV+7/a6igQvzfJyzy9svT8QkuVB5kpnwIVvFIfJFMI9OoTiMc3hyXsDry40FdU1vJCBanxlMVviIxaB1GqlrJ2htefWWKOFcXdHiT0Tj3dLnWeTArz1/qCJ4rmQ4RxWe1D5rpoRhkPC5KHWwmr7olnL06JZ3jbCBy9SAq1990HbZ0WVbJfEQU/tSEkNDSgYx2115IYezd0CVCwReDNQjRExH7SRjqZCjSVVK29CHr4dM/dXKIshLY1fsPejd4LgXIA6LujBFqo+Ghyyb6NMF4SjITAfjY+zRajY+L9ZL5jydx5INqSrcwrNAkQaikW+4q+EE4IYF3NdvQGaelWtAJj9FnDEqb2nboKKW0wS6XUcKK6VZfSvNKPfQSCgxHqMYOdlijAkawrrAuZLmG8IqUSuADL07P6tMfCH2mGV5PWQSh8gN5l3UPTjrrrvA/93mjx677H9l9ZHBBMek9IOFSuY6Ul2fhVtPs/dT+R4xydMSOGaTiTrgbYj8v15pnPRONIxF+l0+uynNmkrm8ejMLxEkf15hw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dSoXTtkov5EoWx1pZNz7hCaJBVfkw6frGTfZtrLztiLQhdJy1fSTqdkuygG1BM3hvUVkQiuL8pvgUIFZ9qORMWJ0X6FFhd0DC4xUuvpj/3GIfcJUR5K+xm1UVyxRECeNgfmHZo/D1D0oDLU/ZA64E4vT+iTATU8oVBi6MbQRRqb/Lg4jf1hn6wTYrE+qcaIhbwm8ZOJY0mJuYIjMYh6IdBsBVq6TIH0Tc6l/uNv2GRmn0ZecIjcaMhQbexSI5PxwM1qMBKtjCuG2HT5Azp6LFQcA0yVLCcRcUvUWHbqE/YOwob/h8AnTz/rQeSqfL+cfZSU3mxxxYBmbFRtPzSMBoTYGb2HpH75HqJSINC2K3bcTitXACr/HL1AysVbHnMeA8zHeFcPE+bl9UHYi8uBDm+8cFP4dPnVW9ghZr59HPEBqvR5mspBpEOF92LBtjzU3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 15:47:30.6323 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9653726-679f-4ddc-dabe-08debcd06d55
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8079
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boyuan.zhang@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 2E4145F49B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Boyuan Zhang <boyuan.zhang@amd.com>

Fix a security vulnerability where malicious VCE command streams
with oversized dimensions (e.g. 65536×65536) cause 32-bit integer
overflow, wrapping the calculated buffer size to 0. This bypasses
validation and allows GPU firmware to perform out-of-bound memory
access.

The fix uses 64-bit arithmetic to detect overflow and rejects
invalid dimensions before they reach the hardware.

V2: remove redundant check
V3: modify max height value
V4: remove size64

Signed-off-by: Boyuan Zhang <boyuan.zhang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
index efdebd9c0a1f..d2f1a9a1d338 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
@@ -877,9 +877,19 @@ int amdgpu_vce_ring_parse_cs(struct amdgpu_cs_parser *p,
 				goto out;
 			}
 
-			*size = amdgpu_ib_get_value(ib, idx + 8) *
-				amdgpu_ib_get_value(ib, idx + 10) *
-				8 * 3 / 2;
+			uint32_t width = amdgpu_ib_get_value(ib, idx + 8);
+			uint32_t height = amdgpu_ib_get_value(ib, idx + 10);
+
+			if (width == 0 || height == 0 ||
+			    width > 4096 || height > 2304) {
+				DRM_ERROR("invalid VCE image size: %ux%u\n",
+					  width, height);
+				r = -EINVAL;
+				goto out;
+			}
+
+			*size = width * height * 8 * 3 / 2;
+
 			break;
 
 		case 0x04000001: /* config extension */
-- 
2.43.0

