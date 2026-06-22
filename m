Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i6vxKmVNOWoqqQcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2026 16:57:41 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A22A6B08AA
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2026 16:57:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=EXAnSVi2;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8803410E740;
	Mon, 22 Jun 2026 14:57:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010047.outbound.protection.outlook.com [52.101.46.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4959E10E73D
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jun 2026 14:57:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQ7ifNUvLhy1zhZ6TD+ULbGRlHZT/hACQZIN+Ue9bNIOBkhA+AyqoIjtatTjTIVWWPUPAi4QCsFpTpNtzBFfr3hDgvvaCpTripGRGQ/z98+w6l4BVl1+aoIb81A16lQYCbyQ0XkL13nm0iAZt7IWEo2Lkh+kqzAqj8dNeC9pMAkutD/BoQlrQ9sV/LxZ/E8Bjlbjrs41GCVBmfxYhZS9in38hq1WQt7FzhaFFGpjOfUc1Dvefw6vIRGUJDjWulA5c3foP4d6u3TeMeIgF5KQnBDm6Tyxgd8p/KjuOKR4s2lAJoHM5TupnpEY5xe4eUCBgJc6p+6PP+/a7QUtAf+CRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSUHz9n1rBX64HWDLYvcOb2MQB+LuWmAOhDwgAs7Anw=;
 b=gi/xppaCWzbDv0PMwPRj5jDt57/IaHUnsw9BzltaKjVksGKmRcKYHURy5L1fxqCptCzXPYLt3uZFcqQxQ1hB66MqT6NpqUoWEp8il88MpwNZOSTScXpLcidnbfuoxbSp1Ok8UAdf4kiWwhs6QcqNlrJUrUTbH4UydSM80yM9x1nkIy+LsmBYOKDXNgUt284f8Bw+OwZR70qD3A2R/eocUX5D4pp5E7BC69WAVde/vEWTtW/Ck5LDrS75fDXwOoZNt7CCbQc8DiJm1h1UyAEhvpdxyYWN+pDechmFRYR5wkDmRs6tTh4uTq5C2LVt0uFP+hUJzjpXSM37F6zudxlQ1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSUHz9n1rBX64HWDLYvcOb2MQB+LuWmAOhDwgAs7Anw=;
 b=EXAnSVi2A54+VxHuwltUishPYczp+z4hJ2AyZKzKUXEHrdrc8RgMGHD3Wprl2f+ghKZ8TmTUHCdndGV5sQeEaa+YmqBjVgYRozFLy8sS6KkX3u7hV6X+FVtXC5gHK3xOcDAhLk0dvJWhHVQmxYFEAnYEBZRj/zvLkpGLbwKCAok=
Received: from PH7P220CA0083.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32c::19)
 by MW6PR12MB7072.namprd12.prod.outlook.com (2603:10b6:303:238::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.21; Mon, 22 Jun
 2026 14:57:30 +0000
Received: from CY4PEPF0000E9D4.namprd03.prod.outlook.com
 (2603:10b6:510:32c:cafe::52) by PH7P220CA0083.outlook.office365.com
 (2603:10b6:510:32c::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.14 via Frontend Transport; Mon,
 22 Jun 2026 14:57:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D4.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 14:57:28 +0000
Received: from mlse-blrlinux-ll.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 22 Jun
 2026 09:57:24 -0500
From: Lijo Lazar <lijo.lazar@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Hawking.Zhang@amd.com>, <Alexander.Deucher@amd.com>
Subject: [PATCH 3/5] drm/amdgpu: bounds check VBIOS string search
Date: Mon, 22 Jun 2026 20:27:04 +0530
Message-ID: <20260622145706.1382846-3-lijo.lazar@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260622145706.1382846-1-lijo.lazar@amd.com>
References: <20260622145706.1382846-1-lijo.lazar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D4:EE_|MW6PR12MB7072:EE_
X-MS-Office365-Filtering-Correlation-Id: f2583a87-564f-4820-aab8-08ded06e9411
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 1XHlQwfmeJMDwl+VmJSkqZ4X8pqdX82Pin/kipH0KyPmLCbSlwFu3clKEDTgfprkGXzj9Nz4KZi4W2UKsM8qMKAfukjV5o+/8R17Jlw0DkgTYmmNRQ5xFhqZ0LKgCJquwyjfWfJNwvzFpxtIoPYiNH2Uf5R2MJnz4+qzfnJnpyqizhpRoIcB9kUObeqQUrwr2SBm0BEiWiVhOCyLtZTIvHSkku7QX9iziD5am1Hv9uJavQS6DoNgR+WyLwtfIoqkJhA+9Q9K7kLjkE3u5miukNCHWvg4pBDSHgWOl3UhVR11SJSoQHhitnsIfef0QHsEyDrygbVBthORoX7F6sXxFqniaFVEFpOO5z4bKU5aJFL+lzOsroYbUAqQd54FXuh9xKHhItE2c1JthII9c/BRePYZ/ntEl5JkZyYNtyPP9b4Xw8HxDuwWZZbyUo3jGPSl/KwkeLvallsaIkWXo6cnqMTFbGt6eHzWL+aqOSEbV/5XCYdJfiadG7q4DJPwKu8OdMQ0j0H6Y5s2UFLxXVg6i66TmRYoKKXcZktBhElX+g9C5FTRRZIUOsTDF8xtHFH16whPD9MVl5JlPSyh0QcLUVNcMzuFiu42JT17rzoj/h/aLX+lWgil91iNxRznyaYd1l31MAG5kRGJgObCK5txYuIEqb4HbvMErjfWpjei5a3N822upItEYa0dqQmy/7xOUkzoYJ491d/IIFE2xO+Lvw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZdY9+hdbtwiiQ/25cRkwMZmP9jFQavD7V+qnSOlRSjOAz8lL8uE7V4M+xcA1Tgns/DsJNWCuLnGOHu7wH8AK7lb6wNTHbF4isPDpxix1GTgj4i62ybPKkYaMFndglNKd0wFF0d0qwzbHXGs0zKU5IvgQiz3R/6S52+VcVjS0/OvfTvjAXxDGrA4Ur7V1+NSXshEJN23eR/vVWNlaMSGK4dNg8QvxXqBpVHJw17zrcq3HM9SoJpPQquFnT5sv9UvqvI5tIbu3nMoUZGf3NGqnUy7lX1o/mx4GwUL2B7TjDnGdF3cdHZ+1INMzRSVTF/ZXY3roK1P0YU1jnvTuyr3BckTepdV/EsPKyyqBvA6Z0iDx6cNfk6Kpk6zP9eesDzz6fU1KSRZEHI+EMgygjoC9aq/YYXLL/npKotcMtJSaye4GYJWQyNFZVXKbJuYxps44
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 14:57:28.1480 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2583a87-564f-4820-aab8-08ded06e9411
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7072
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
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lijo.lazar@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_FIVE(0.00)[6];
	HAS_XOIP(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5A22A6B08AA

Bound atom_find_str_in_rom() by the BIOS size to avoid out-of-bounds reads.

Signed-off-by: Lijo Lazar <lijo.lazar@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/atom.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c b/drivers/gpu/drm/amd/amdgpu/atom.c
index d18e46422520..07a33f94ed6a 100644
--- a/drivers/gpu/drm/amd/amdgpu/atom.c
+++ b/drivers/gpu/drm/amd/amdgpu/atom.c
@@ -1449,8 +1449,8 @@ static void atom_get_vbios_date(struct atom_context *ctx)
 	ctx->date[16] = '\0';
 }
 
-static unsigned char *atom_find_str_in_rom(struct atom_context *ctx, char *str, int start,
-					   int end, int maxlen)
+static unsigned char *atom_find_str_in_rom(struct atom_context *ctx, char *str, u32 start,
+					   u32 end, int maxlen)
 {
 	unsigned long str_off;
 	unsigned char *p_rom;
@@ -1460,6 +1460,9 @@ static unsigned char *atom_find_str_in_rom(struct atom_context *ctx, char *str,
 	str_len = strnlen(str, maxlen);
 	p_rom = ctx->bios;
 
+	if (end + str_len > ctx->bios_size)
+		return NULL;
+
 	for (; start <= end; ++start) {
 		for (str_off = 0; str_off < str_len; ++str_off) {
 			if (str[str_off] != *(p_rom + start + str_off))
-- 
2.49.0

