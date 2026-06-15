Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jP4RLNtrMGqMSwUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jun 2026 23:17:15 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EE768A221
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jun 2026 23:17:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=rvIVJiWm;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3CA10E657;
	Mon, 15 Jun 2026 21:17:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011045.outbound.protection.outlook.com [52.101.62.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A10110E657
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jun 2026 21:17:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+BYAXFsZ4u+pZi8EHuUJEWk6oIEk2M3l4dKYMrIoTqsQ4Dfm/7fTL4KXBmoBStPC/pUZ6h5cViNt8tqx9bNSlUEfuAKfD48J6MkvgvgY52O+A+w7G4SOSwnm1nkuT/Q7mj4z4KWxmgWQLmGqeQQfpPlgsQr/0n5oNiwIDwnzIGpU+MrySQUrLgCDjuJHvMTeAik7NDMFxbv+nCO75bMmSi3PsF6pPDx3ne4BxyoMphcDcmkGTGOctifQI2oFDw3n4IV3z9ThfSk+1Y54fOV5rpyDu+AP6VL+Yi8t9b7A/Lw8rgsDJKG5IJnqD+Ewqp5UZSn2Kku8+nM8u7JfKGIAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gFj7Jgqlb+fwjetheUoH+jkqlA48+yD/GD+2tt3FU7k=;
 b=nsNkFv6ddMGNiuL5Kw+LYGeuAm6KCVFUCgH9yDGOGWJy+krOhEhZTtPnv2lecxcqjavsM9L+rfGq1x2pib6y1zqJsjFBCmlZSDrPuvpKGwvezwmMEaclyW3A0vopt9XemENJhVYb/U6u8bymy0sHLbBFVTlZHJlplY23y9g8eE9aB1HuYD8IRM24FudNliZhILcQhZlZ8+zwhAtB6ixT2nyONAyIEuMbU6kHWNXP0zeZF8UbAyTJVfMQiXnBJHbNdJ79pVrWaUSIWEzTOfds2IUYOLc+TpFeqSDuYDs2RuDe0aJ/SlG6cVOJbO5eGrm0ZpMbsdDwsgkOv4dRCN+Udw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gFj7Jgqlb+fwjetheUoH+jkqlA48+yD/GD+2tt3FU7k=;
 b=rvIVJiWmII/iOChUaLli0HHGT7rzIgZIac8O9z+cDDTQExfFINHdhwGkurN8FWb50YpCR+2mON5ZzrVZhCsfZRhQVX5M2YvYroHhLTKfGPMXGZjz7opbKZXWg0DrB1xIp+lMMpo5FD0/++/zcNg/ldWwmsHivNR9GX2PNpIeRl8=
Received: from DS1PR02CA0020.namprd02.prod.outlook.com (2603:10b6:8:44a::14)
 by DS0PR12MB8246.namprd12.prod.outlook.com (2603:10b6:8:de::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 21:17:08 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:8:44a:cafe::c) by DS1PR02CA0020.outlook.office365.com
 (2603:10b6:8:44a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 15 Jun 2026 21:17:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 15 Jun 2026 21:17:07 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 15 Jun
 2026 16:17:07 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 15 Jun
 2026 16:17:06 -0500
Received: from p8.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 15 Jun 2026 16:17:06 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Kent.Russell@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 1/9] drm/amdgpu/jpeg: add flags for disabling KQs/UQs
Date: Mon, 15 Jun 2026 17:16:46 -0400
Message-ID: <20260615211654.676386-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|DS0PR12MB8246:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f332bdd-deb2-4fb9-47ab-08decb2374ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|6133799003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: ZvYMCbNZ+ZvNrXA3vq16BRYlBjpFgixKfckwSJyvPCA7X51l8XVDoDPqk9F714v2s8PYSVYSi5NleutrDyQozBZpJHZu4Ok7Wh5WaaJjcyAFlQ+xlo/YNej0IERZZPvcosdwCSt1p6uYxzefCKEoWEi3Sr39PWLiN1dsXnqhilqpFWU7vlMji2CYUcN3j14jgmLed1P5ay6v5pqjgJ4rPK+I58k0XiflKeUTYM5YEWTw0r3iI7MSjlaFVrHChPSDryM+MBIk98rYPEMkidb6zuD7hZ30mdf8hBa3+DJr2KwsZXvS3IVZKVPLkHxZSqcA45J0CGB7EQ9fwGfDLrOguyDZoAV2U3PtPPmMd5kHqGMXQ/fMuuuN+JrVUa7al5SAxwUhjIQNSXQmoJGjxXKcvBRk3S+zO0TF98NrTu6vDUhpB8vy828HZInFsqQJ1veXiUY7TtkzT9vNHr2gaqt8Z4egG6rA/E9rYb+HfHipKkuaoqaVM53RlVCHNS/vPk0MeNNg1XqGU5KnJzQjHRfIERjwcgKBCOcnfKk86ajf50/LKk+QwgJ98ythCWp8GZ5Qd2o5BGXqWbhuPKIuN4tdCpFS6upY316BEkhH011vm/74C5ysRAAc/mPZutJhGczD3qm91jRVzM+umFsVUlVMYZyV0J9amiMG9OqlYWmgCVVqLqaqrH4l/xYfGCvELh3I5zofeNj5TBfyBm9uHrLRev+iayaP+P1qoWoYJSrq7Mg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(6133799003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8kYAbczcsNb2dERZfM/8yfcqbJ5Ibw3CMJaFWM8ymX47cswapVdhUYIp8wUuf5KKFL+aThCaQW6pd+DQ4ZP1h/PIUsJD7OqUP2+XZsXen/VTPT+jbzbf2GAsc0c1n+yqG1zJENiEC+/V0X4ok3okQdeWJdiJljhcRM3FP75XFtbc6UxDcgxYBI6hIlr9T/u0qNZC0/x5U2O6Ei6u1cCFMB0jQ/4s17dCK5KGd/k9v7qvuxtWCLBHMFOxYfJ+q1IJtzpFnumjYSC2wKkkV2LaGbAC/AvWOKENoLq2IxGsGzgKp4AiW4P95S2bI2txePKcwDQABcdCpTfR7DZB8tVriKxMuNBn9FPpyADBKaWQpqCcUDo5tjjve3PqC9CrTyMq6hsFvdpLkjzIAqau9a29h/2R7frjPv5uP2DhHcj07Tp2mykV+pQH91nXDq6WSKag
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 21:17:07.6501 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f332bdd-deb2-4fb9-47ab-08decb2374ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8246
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
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.deucher@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 92EE768A221

Add flags for handling disabling of kernel queues or
user queues.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.h
index 346ae0ab09d33..fe95d9188713b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.h
@@ -149,6 +149,9 @@ struct amdgpu_jpeg {
 	u32 *ip_dump;
 	u32 reg_count;
 	const struct amdgpu_hwip_reg_entry *reg_list;
+
+	bool disable_uq;
+	bool disable_kq;
 };
 
 int amdgpu_jpeg_sw_init(struct amdgpu_device *adev);
-- 
2.54.0

