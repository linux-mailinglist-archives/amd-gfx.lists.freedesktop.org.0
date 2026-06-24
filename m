Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KNi2B0kdPGpOkAgAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 20:09:13 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8DF6C0A28
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 20:09:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b="LF7YMZ0/";
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5721D10F081;
	Wed, 24 Jun 2026 18:09:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011022.outbound.protection.outlook.com [52.101.52.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A5210F081
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jun 2026 18:09:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e0D4ZVG3C1R2PAjlgxg8F6O3bF4bXMaH++imewKEsOR5lyKNTDkG/15xbIPGwVdy8ONV6URS1cEx3M0lO3jdOzdhTczCB87xip8uxUdpY+GRYPvocnCJjiQre2QZcfDjumErpro2qYnVuPYu9nQ0LrhdWsBvISd1R3vMiLMimsv3iqJqhxZK7K8nWq0K8bSu+UVF06Pyvihc+G9sMwJEib+L2d8QadhLfQbbnf27BNWT7WsHklRZWIbEYOTlHVuwMmzNZSbcxV66fx+J2TAo/4V4oJURYG2Ac+JhUBagQCtHr1LNBH1sgWLQWVZSjgfYCIkz7xw0p08X3U6hzXDPwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+wJLVdO6ks4EoCCKS9lCChbvZSEiBtQTcVMPW1fxdaE=;
 b=uPGkPuknkH8y7ZUGOwLUOg9L7ScILWyem2IYokwL9xGCueU0hMkPeKGyuwpl52034r/XqGhfDO6ikpr95wFp12FZInO2RXKjYcN1q5PL4iXPs6fl/6bq8R5Ktiq+pvXkx+MsIBNDZIhwxFJWCpFSkhq1JZeuUMDmn1NUXW3SUnF7zk7kcUfxw/IAtLgBp4/bnc1vvk4ViWI/Rwb2c+iJBE8myQwHfTJmJWYengbt7eP8hDLdvNfZKFWIRxWcvBpz7ruWMq9Fb4/2EOcfs8olVCpcxlhho/miJUBPkb7WTpNFLSSZ7UeZTh0AxmMOqHHRmgjkBC0toILwZInAbKTS0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wJLVdO6ks4EoCCKS9lCChbvZSEiBtQTcVMPW1fxdaE=;
 b=LF7YMZ0/sYq1NYhGicWsi914bXeoGNeDNMJ4Kctu2ma58m0kOiEBF7latw1+iobKdixBmzt4Y2Xxn8VQy1Ke0zI+/JWg3BDGQGfBguUZR8u/AJtrjKZ85kdBtrVPNncmVrR+6gtNDCIUTSsO7eWVQV7/IbxnvTtE43tPhkWJbLQ=
Received: from SJ0PR05CA0204.namprd05.prod.outlook.com (2603:10b6:a03:330::29)
 by DS0PR12MB9324.namprd12.prod.outlook.com (2603:10b6:8:1b6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 24 Jun
 2026 18:09:05 +0000
Received: from SJ5PEPF000001CB.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::a7) by SJ0PR05CA0204.outlook.office365.com
 (2603:10b6:a03:330::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.5 via Frontend Transport; Wed, 24
 Jun 2026 18:09:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001CB.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 24 Jun 2026 18:09:05 +0000
Received: from MKMGEORZHAN02.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 24 Jun
 2026 13:09:03 -0500
From: George Zhang <george.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Roman Li <roman.li@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Tom Chung <chiahsuan.chung@amd.com>, "Fangzhi
 Zuo" <jerry.zuo@amd.com>, Dan Wheeler <daniel.wheeler@amd.com>, Ray Wu
 <Ray.Wu@amd.com>, Ivan Lipski <ivan.lipski@amd.com>, Alex Hung
 <alex.hung@amd.com>, James Lin <PingLei.Lin@amd.com>, Chenyu Chen
 <Chen-Yu.Chen@amd.com>, Relja Vojvodic <Relja.Vojvodic@amd.com>, Wenjing Liu
 <wenjing.liu@amd.com>, George Zhang <george.zhang@amd.com>
Subject: [PATCH 01/28] drm/amd/display: Update link bw
Date: Wed, 24 Jun 2026 14:02:59 -0400
Message-ID: <20260624180829.4775-2-george.zhang@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624180829.4775-1-george.zhang@amd.com>
References: <20260624180829.4775-1-george.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CB:EE_|DS0PR12MB9324:EE_
X-MS-Office365-Filtering-Correlation-Id: b33461d6-e443-4187-cce8-08ded21bada0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|3023799007|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: AXKrhR2MlDxkaI+0rUVHxhQeVsUxxNZk6Yv31vWQArMTE3kymgNuHlD9yp7O/VbZNSxt/ue5jqSwK+YV/ZpwxwFUwW3NgXCcLuX7FnmfqaX4n6zm5HfsxA7yevpZqHK1dmtpIu0hvs6wKlCSQX7ZyqdTKnwlV6Hu29HFWGBbWukSgl5INTpA7HbgREC0/vGXgnt54gP+62RkSjhg4cnB1S5ewjolwEjtIqjIQ/Ewonv8njPvIG0hjh3bvmfkVwbWwA/JZxklQdgqwryltH32HIrkNHFP+VrbPgleocVb8HW77eb2mJjVlUcIWZe7g+tY9R9xGXDbSPXVvNRQ7HYvkeQnQHXwUdkqXAjDSeNcNwkG8e/DUxmOwT70sJ+mSZDQZjIl+20m6elwMWEYdY6e1jcgcQb2LOKev1pjYMFY7hjEWbwra3/WEAslz7u7LOPeylR1IcX2ABWip2kxn1P/h67hMA7HOJqP4CnoxneoSlNJvEkF85X0zc/m7Elj71Khf0jYbEFeGfWfqKVuv1XlCIYJRjKhg7h7Clh1kbzeZGY5Dbb0eurHmOP4G8i9SG4EGXWlm374+Kf5pC/dJSDHAlZDkdi6XqMsSgU/EW9BBlwnl7j4naCLexgS3fwIye9k1eyoPg903SzPbpI2W6G+ohWhBg6vMW3rqcE36pIkfdlfL4FycnabncwXyhJ9my2jrmI/r/jgPZKKQb1KPJgYgA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: EqVI2GpIf5sfqQe2JcN95/rb5GqGml8uIrUicObloN4e91NgObMUPYpx8bWTY2nK2JQ/ygtFjrzBIncMDzRqpEcXGt3nfGzjZE3HzjLXoRvbZrxZ6WC1K0Bt8cEJvmU0DfScZ7b2OiRm+Vx05xARrTkyo5ddd9OpfVbWUfZtwJtHWqR6SicKU5tCPb4jlA2NlAahFa/L+/ukGapNjw0u+VE1d2+cYpmuswJZZ9qAOeEHQn2UBD9KHqCTqxfKxn9jUuuMzLQmNfoB8L5NfFQWTmpNky3BGvVvZzY1wHbMiPE+eYr0r0paDzeAOVovkrGa7+tRS8ZXeY2xRcTyWBLXdRfoVRW3GjicJ6F3BkVYzdp0gbrKPyk0Jd6Jc9Dr9CUiqERx2bypYyGJmrRZcF8tU8h6Y/Hkz+1YMmlX/4WwamjOnJhy9gHhbiT0Div+1emt
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 18:09:05.1039 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b33461d6-e443-4187-cce8-08ded21bada0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9324
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
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[george.zhang@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BB8DF6C0A28

From: Relja Vojvodic <Relja.Vojvodic@amd.com>

[Why & How]
 - Added link bw to switch case

Reviewed-by: Wenjing Liu <wenjing.liu@amd.com>
Signed-off-by: Relja Vojvodic <Relja.Vojvodic@amd.com>
Signed-off-by: George Zhang <george.zhang@amd.com>
---
 .../drm/amd/display/dc/link/protocols/link_dp_capability.c  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
index d47aefecfc2d..3f185ba2846f 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
@@ -181,6 +181,12 @@ uint32_t link_bw_kbps_from_raw_frl_link_rate_data(uint8_t bw)
 		return 40000000;
 	case 0b110:
 		return 48000000;
+	case 0b111:
+		return 64000000;
+	case 0b1000:
+		return 80000000;
+	case 0b1001:
+		return 96000000;
 	}
 
 	return 0;
-- 
2.53.0

