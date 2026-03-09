Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KnlJL/frmmeJgIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 09 Mar 2026 15:57:03 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C6023B148
	for <lists+amd-gfx@lfdr.de>; Mon, 09 Mar 2026 15:57:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEEA010E516;
	Mon,  9 Mar 2026 14:57:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QQir7tyh";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013060.outbound.protection.outlook.com
 [40.93.196.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0031110E51F
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 Mar 2026 14:57:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RtGiTiCV+pIqHNG2O9CGVnfbH04zrDzFl8PVOSGbv5vajTd61S/ppHU+0P34eIqWRnP7y6ODCYXMkTubpk9Z0lh0NGpKdiFqA1W8PEH9A/iGNyhN9iJ/r6vqfclD/CH/QOky6mQjzZhFYh6cqquTx8KCv7XfWP+2sTNarGMxsJZc21k8/ys00kIeNfkIIsOXoyqyLJS6JRKQRwQnIv+mwBCvZm/M/vjN0zwjsvCpvuPytOTJC/UYrkM8NKvtGJeRhcKhC2jwhHSICGTZ126QbHjmaH9nLcvMVHsk3HlrZUPss9vFooNh57YWc4ohAwaJQPz98CvdDAi4sQJY0IGkvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q28cTXEIJl23a88UjPdUGS8uBRABi0t6ON0Rw4QYFnI=;
 b=Q41MSNWrAI/fIomVsnP9qCD+M2HGHXaSP8P3y9cJKvVcr64jKUZNzs0xaG5vRvZpaWdovRvOczHMv3RN6nJ3pW8fche9ehIOf9+V5MuOtp3AiCUzeyJkiYacXjPgfNxY/BPKc03VPfXU3KukTy7Hl424zGVYqIaoMwLJpsJ3FWJdEU0oola8nB86llPa76BJb4GeYwnMNPcpZvXK23eEFNe0Hz+sSTWCMSCcikKDoyu5NMTthwwlKcT/3VZs/GC+BnCkRuf+pYE57CKQojn0tbkASrSot9ZfrQZxGmrUsJoeGelzooU/zd1eCNqRnHF+B2++psT1veqj6Lzcp4jlFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q28cTXEIJl23a88UjPdUGS8uBRABi0t6ON0Rw4QYFnI=;
 b=QQir7tyh9ymmbYBVhO8afwo53dIR4rmdWINFXAlMCpx5PkeL38J1Xn473rDYxPrCwkBQBEoY9uVHO2VyoKdMsS378pzFcBU2gdDcGBAxI23t3jeED15HPnrCIhUjykqZH+Sce3AN94vU9C5WSwCbomorNx8aD3IM9BlBq1n6Y/0=
Received: from SJ0PR03CA0377.namprd03.prod.outlook.com (2603:10b6:a03:3a1::22)
 by IA1PR12MB8540.namprd12.prod.outlook.com (2603:10b6:208:454::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.10; Mon, 9 Mar
 2026 14:56:57 +0000
Received: from CO1PEPF000066EB.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::e2) by SJ0PR03CA0377.outlook.office365.com
 (2603:10b6:a03:3a1::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Mon,
 9 Mar 2026 14:56:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000066EB.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 14:56:56 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 9 Mar
 2026 09:56:45 -0500
Received: from p8.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 9 Mar 2026 09:56:45 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Hawking Zhang <Hawking.Zhang@amd.com>, Le Ma <le.ma@amd.com>, Feifei Xu
 <Feifei.Xu@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH] drm/amdgpu/gmc12: Bypass FB resize on A + A platform
Date: Mon, 9 Mar 2026 10:56:19 -0400
Message-ID: <20260309145629.2844495-9-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309145629.2844495-1-alexander.deucher@amd.com>
References: <20260309145629.2844495-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EB:EE_|IA1PR12MB8540:EE_
X-MS-Office365-Filtering-Correlation-Id: fd2d83ca-8b27-40e2-05b8-08de7dec1c0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700016; 
X-Microsoft-Antispam-Message-Info: RUhsRg95NdEPxdQdA3UauTcYZph8vbKs/kvqzJdYR6GetBdPc6NLD95UIhCovlNw8hqPxWwSgWjQYRC/xPrRXUo1j0lj0fUdwRmJfvqXf5JzZPrarnHBS8rUvg7HvxzA9GEFeewkHCVJNX0N79PpYn1545zxFhETsk/Zv8Y4fq7YwpQkaRxMfb6ILldkmPAESq6cDjKz9lYmNU/AalWzmfznrRhnfB4hhwhR+p73CLtB36KmIAEaeTVasM1vX7bKTN0JizVXo2BfwB6AIZ/6LT/6xdLkhA253qVh0NT+Y0MULcx8cOorNVyVnPMO5ZJx8jXWCW6E5YBIsI+ZpQE+4CgrUN/esE6jc+ygba+IN6uPM/O3NUox6q6sXjrGaHBrXQ7Pytq/Xm0OTmazN7OaMo7vt/IO8oiHziPIcx9avb58KVbzAiSeKwBUJi2TSfgiH/BX5fEvwDwKA+zpfgZCwyPM6elUMQvMh3MX4iUfzeD8bBrfAujdGryy+5XJxtkSxi8Ixxn/RryeH2JHQOodGNaDlRkQqzng42p/qK8gQMkO8DE1TbKNpOSRraMxZ9PhQqtahhIhGKLoA9dB6GTAyH+ZOE6lPYzDIVFgMEKn07Mmmhv2v0Dj1K/L8KCwyzbfo4Ki8p9EC8UmTdJxCt93VZEp+bQ5uhg0Q4ZLUmfPTVa7oEVevoQM9Q6ZNA7hwVrgd9ein/UUZ1v3grETQZ7jf61QbcYp9j86XBd7osbv+abcobE+vk/ZxTKUwuHhJ541h2QVT9gi/wgZPH98t0XdBw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: NzNMU/VzFrATYHKCdKebaaMNVAZeW4ega0+AZNV2EQnk5sThrPjAc98tYUBZ6HX+j1YXQeoQZHSeZ8mXJKbXgYdGgchzXsrG00VSHxe2jSGrlsBVqySnQ1bAPOxTOPtZdp+EIcIuhNCwB2xu2mOP+LSHCk/x2kkPik2YvHE4+Zy3wqv9YEuzOiDpxoF4+jLFy352iQvov+4AgfjI7ai4XhZZzf4MwogfIfj9c1ApNZma6FChnC2HKWuW1Zp5oCY1M1SwMTjn3uLcI3u3cH+SC7aa+2R5YvGdFL/QkkIiYEKe6kdoT7bJvfBPLgdPdnI2FWz/Ni6tcA6+ZgWUwh7QjCKHwzG+jzIEIqBPblZvz3otPepmHRpB27YPPTjgtiqNmbepB0SPBCIQxtnjT7G3Uun5YX1+ptq8SZ/iDcMqtreFVd5JGjTp0tJyLKHpiMZQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 14:56:56.8066 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd2d83ca-8b27-40e2-05b8-08de7dec1c0b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8540
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
X-Rspamd-Queue-Id: 46C6023B148
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[alexander.deucher@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:dkim,amd.com:email,amd.com:mid];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Hawking Zhang <Hawking.Zhang@amd.com>

Resizing fb bar is not needed/supported on A + A
platform.

Signed-off-by: Hawking Zhang <Hawking.Zhang@amd.com>
Reviewed-by: Le Ma <le.ma@amd.com>
Reviewed-by: Feifei Xu <Feifei.Xu@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
index 654c1c7adfae4..2bbd63ffe7105 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
@@ -725,7 +725,8 @@ static int gmc_v12_0_mc_init(struct amdgpu_device *adev)
 		adev->nbio.funcs->get_memsize(adev) * 1024ULL * 1024ULL;
 	adev->gmc.real_vram_size = adev->gmc.mc_vram_size;
 
-	if (!(adev->flags & AMD_IS_APU)) {
+	if (!(adev->flags & AMD_IS_APU) &&
+	    !adev->gmc.xgmi.connected_to_cpu) {
 		r = amdgpu_device_resize_fb_bar(adev);
 		if (r)
 			return r;
-- 
2.53.0

