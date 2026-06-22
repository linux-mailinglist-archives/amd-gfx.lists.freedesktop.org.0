Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ihawK1pNOWoiqQcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2026 16:57:30 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA916B089A
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2026 16:57:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=cfTW5t3T;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969A910E72E;
	Mon, 22 Jun 2026 14:57:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012010.outbound.protection.outlook.com
 [40.93.195.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 626B010E72E
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jun 2026 14:57:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mSISq/VJq5USYtFz/tQz44PgUewwF+5abXoZK9xNwUjxUMc3lZwxh9IiKBp9NhUgCJvo1AdQ+phh0ws6LIv8ZOWAAAyE6kZ5QzjnkDJSHiKgfvo2ieV8iaqqR7UHd5PoMCzCTK9L4QXD8gWes/E/yMJYoHQLngUCSAON9TjIzWqNBj5VvzA+59128LFxweHTD76s6Jqg2xqZ+pGX91wdeyqXFfaaPlcOMO+4/wjokmgmq9caSVua4W0KDSWeUuBtEkghKmVAAih+Rm7Q+mj8dqToCbdtfld13tvJ3KOMoVgyL2+VcVMFyDKKDTZfrc7D1fCLMay3AyytpUFLIEs3Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FEDhIUXtnCh3WDYInco4bsYJt3fUD1d2wG1M9prylrU=;
 b=Dee8dPMOvFbPTUOq4huWOG4GBUU/lEXYo/3oPANphe8BMpjuR7YSfiV7dLFkdgzc1MD7U+sYq/rovIqNjylfOmvTYG1jl82Rmto5l3Vk66V3XYdpzCNjlZ0jG2ogskVtK8RPhqFTGTnw1ifvUQsxk6QyWzus7d/k6wSkrhR6sb0Ta+qPGXi4Ql6xxzFvxOt70WUd9oayJVY8nfn6E5ZYgLm3ZzGkWSiyNSFx6uOMQrIt9zhoxQaCi6Y+U3Kr+ixvZ0sKx61lOdzCzv9DRJ6h6eZ64FlbITl6Od/4f7hE0YV8+zNOexDfT7YOd5L6KMzb0gKhl7ocSI3ERTsID6xuZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FEDhIUXtnCh3WDYInco4bsYJt3fUD1d2wG1M9prylrU=;
 b=cfTW5t3TXmWLrr2WlIG/NM8BcXUWUKm74PkjTVzXo2zgycq1NlQum4sLVeOkAEp9jxFKqZZn2rIydfqz31k3wEh7gIu0Z1yFBN/2AvHfLIBAALr/ME/f43OyqAsWINHgEXZyPv3JAU9JxfP/32JkTqboTQ/Nyval1dJZ0WEqgfA=
Received: from PH7P220CA0063.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32c::30)
 by SA3PR12MB9090.namprd12.prod.outlook.com (2603:10b6:806:397::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 14:57:24 +0000
Received: from CY4PEPF0000E9D4.namprd03.prod.outlook.com
 (2603:10b6:510:32c:cafe::95) by PH7P220CA0063.outlook.office365.com
 (2603:10b6:510:32c::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.13 via Frontend Transport; Mon,
 22 Jun 2026 14:57:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D4.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 14:57:23 +0000
Received: from mlse-blrlinux-ll.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 22 Jun
 2026 09:57:22 -0500
From: Lijo Lazar <lijo.lazar@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Hawking.Zhang@amd.com>, <Alexander.Deucher@amd.com>
Subject: [PATCH 1/5] drm/amdgpu: bounds check VBIOS part number extraction
Date: Mon, 22 Jun 2026 20:27:02 +0530
Message-ID: <20260622145706.1382846-1-lijo.lazar@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D4:EE_|SA3PR12MB9090:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a06cf13-4b4b-424c-fb05-08ded06e9174
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: VYH18rC7BdAJ8IdN0Fz9k85rZ/UZrFYCuc94eokC3EkXWEd5K31N6JqkytvUDzeWVutyXbKwZKGxNJslq0t1CFbfd551CzqY0E8ckPaW91EejG8nJxU71LXp+2SbR86shPntXdmD5o2VXHGgEtzaUnIPjHArbyfiLW9ycjXamXLXu6Fyu50WMELtHK3RA9U1biyU8fkDNW78el7TDAUgXKdTlW/l10YevVsuQLE474Qo8W39mp4f2w/u+K7sdQ80bVSOrOfyyi4AAV9T57tfLPM8vgGO898L3TJr6NUewK38gFXCi+7Vz3y/SKyRqx0FZDObHq6PdrQNiA9ywYZX2CUloGrIkac5+TbM/jUuXye3Tg1oKSN25F5c5bpC74ZaGzJQkwParu9uV+wJ/v+Dg9UzP74eDYH7e0O2WOOtbHY0W652vyisSthY/r25lDFWj7IhgyS8X3C7w2qzx2Ox2XHRp5kFFsWK8ejL4Djj2Jx8mMRsWUl6ssgOcJIcaGwoUVZyLhOhqeqqxqyBa0VGpTmdf9ISvS+JagpTE5QjbIaXwMmSVnEWXtKrxwRq8Ck/zFFY+FvPECYDusXfEzatfnBF5lcSNUjFf0Hnua5SES+kUWfZH8YMCQ5Yb2aGVZrIAsX10uHFe+lp8YmkzQgtBY1DT9dsiiewJYmATpFJG7evavaMSnMD3Gia1AwMfIeQPZPbgRJtC536OlHF/Ao54Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: CZLXwGJobr0Z3YVFnfHV0+5swIy7TC0tT4gAojt3/eMyx15tnratp+J4EDTRuiNT3GzX8K6ob6JlUsLL9fe/HkyLbYs+iE/TdxlnZMidSRrn2ifIJvSlVPZ7Y+okvkh8nKMG3S0SSssbAawPohzh/4iSQ5zbbroQf0bC/grgJFW99hdCOOCsuD8BUEhlQFIo+d8qefJNjfLAQG+A5Ok5qakPrN/Z3/zv99cs299XHAOumSuGW+AkmFnls+JhMyABA2GNfiOHLPu5UhzjMyRtatHF1X9dbWpWBz1OI59g1UHZJFHozMr0rpAdr5HCNF5DT758NlMHfeFtfxcTh3PhmmE4VQGqTWApu294oR15FxnMQVVvFiTwJ2Zp6UwD8ZCK2rljlL+lq4Mf/uoQe9OyIi6X8/KqAqZI8rOBU+Lt0+nvb0lOsPaWfC66YUJ4ZLd9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 14:57:23.7615 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a06cf13-4b4b-424c-fb05-08ded06e9174
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9090
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0EA916B089A

Bound atom_get_vbios_pn() by the BIOS size to avoid out-of-bounds reads.

Signed-off-by: Lijo Lazar <lijo.lazar@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/atom.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c b/drivers/gpu/drm/amd/amdgpu/atom.c
index ebb4ac279393..5a4b06dfd096 100644
--- a/drivers/gpu/drm/amd/amdgpu/atom.c
+++ b/drivers/gpu/drm/amd/amdgpu/atom.c
@@ -1467,12 +1467,17 @@ static unsigned char *atom_find_str_in_rom(struct atom_context *ctx, char *str,
 static void atom_get_vbios_pn(struct atom_context *ctx)
 {
 	unsigned char *p_rom;
+	unsigned char *p_end;
 	unsigned short off_to_vbios_str;
 	unsigned char *vbios_str;
 	int count;
 
 	off_to_vbios_str = 0;
 	p_rom = ctx->bios;
+	p_end = p_rom + ctx->bios_size;
+
+	if (p_rom + OFFSET_TO_GET_ATOMBIOS_STRING_START + 1 >= p_end)
+		return;
 
 	if (*(p_rom + OFFSET_TO_GET_ATOMBIOS_NUMBER_OF_STRINGS) != 0) {
 		off_to_vbios_str =
@@ -1483,19 +1488,22 @@ static void atom_get_vbios_pn(struct atom_context *ctx)
 		vbios_str = p_rom + OFFSET_TO_VBIOS_PART_NUMBER;
 	}
 
+	if (vbios_str >= p_end)
+		return;
+
 	if (*vbios_str == 0) {
 		vbios_str = atom_find_str_in_rom(ctx, BIOS_ATOM_PREFIX, 3, 1024, 64);
 		if (vbios_str == NULL)
 			vbios_str += sizeof(BIOS_ATOM_PREFIX) - 1;
 	}
 	OPTIMIZER_HIDE_VAR(vbios_str);
-	if (vbios_str != NULL && *vbios_str == 0)
+	if (vbios_str != NULL && vbios_str < p_end && *vbios_str == 0)
 		vbios_str++;
 
-	if (vbios_str != NULL) {
+	if (vbios_str != NULL && vbios_str < p_end) {
 		count = 0;
-		while ((count < BIOS_STRING_LENGTH) && vbios_str[count] >= ' ' &&
-		       vbios_str[count] <= 'z') {
+		while ((count < BIOS_STRING_LENGTH) && &vbios_str[count] < p_end &&
+		       vbios_str[count] >= ' ' && vbios_str[count] <= 'z') {
 			ctx->vbios_pn[count] = vbios_str[count];
 			count++;
 		}
-- 
2.49.0

