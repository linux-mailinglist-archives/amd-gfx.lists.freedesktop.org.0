Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7DB45E717
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Nov 2021 06:17:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40BD86E524;
	Fri, 26 Nov 2021 05:16:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2083.outbound.protection.outlook.com [40.107.94.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D65E56E524
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Nov 2021 05:16:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G+ixUY5QcMGE1wLnwHluGkda9WIVIBYwiMmUx5ly0GEh8ATHZtAgh2f3GLk1InzHbEP64domIIvwnDgs2ywsAxERNwzaI1pRJ2cik89jC6FaxLdpUdZDay0chTTGhzJZloDVKQwW8G1ZgjdAZT58H6Iu/eKJqL+PbnLmLsgXi+AgiZtQ9EEkrzyWgcTUKY53LZQSYl4GWZTEHgyUB7pVX827JW4yKWlYrFwcpSepG1oVRJ/jTA7ZnD2Mt6VI1coLTi04wmjB7coT9PiYzI598p8ZQzW4mkfUVsjXqPI59ojWhhBWCgTx+cME+bOrvRPAM3WQAwo3I1BghdlQVsvlGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v7vHV2vGwjwXh0DeJOjcvKpeOkyal9bqMhGZ7FsZ94Q=;
 b=KDyK8Q89MNAsOf+fYehysha50vcf4FK8VgAIJsUi1x/K/rWFehwjnhE+XmUsWVmD/vm0ld6t0nQWiTuu1JvLiZsBNjO9HsyekWXoQH+sfkcchWFb186fGKCroESPzNi9xqcoCUmxUtO3GaK/R4Wsvioo45qjwJYhNdsTEqpSdfTwSMV9KhH7vtrhkz3wLYTTf95+Nd0uZDkf57hy9HrCG8Pvm4VgiGyuMtwn//EdZSVujNffDWRkR3KAnz8wBcJhLYmda+NG1LENiPS3sKnyXKQvVpUBZ0770e87l1Y313BnE+6f3abWvbegRZRM9R4l0Iij5vn53HGQXoxV8uq9Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v7vHV2vGwjwXh0DeJOjcvKpeOkyal9bqMhGZ7FsZ94Q=;
 b=PMXA5OlxvKcXtZ5U2fpzdWYCMd4kUhn9Ru7j3oAj0uCzX3MF092cL0LYzd6jPAXnU1Pw3m4szaxKmTfELElt84uUO2KttoJxqthPV855BVylRewm8AjNWk3WNV+nwlWGT3xhlMNWpoUfotAqTua3TgK8mfyVCpDN851KK3n/J7g=
Received: from MW4PR03CA0026.namprd03.prod.outlook.com (2603:10b6:303:8f::31)
 by DM5PR12MB1948.namprd12.prod.outlook.com (2603:10b6:3:10d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.20; Fri, 26 Nov
 2021 05:16:57 +0000
Received: from CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8f:cafe::3b) by MW4PR03CA0026.outlook.office365.com
 (2603:10b6:303:8f::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20 via Frontend
 Transport; Fri, 26 Nov 2021 05:16:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT030.mail.protection.outlook.com (10.13.174.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4734.22 via Frontend Transport; Fri, 26 Nov 2021 05:16:56 +0000
Received: from guchchen-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 25 Nov 2021 23:16:53 -0600
From: Guchun Chen <guchun.chen@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <xinhui.pan@amd.com>, <John.Clements@amd.com>
Subject: [PATCH] drm/amdgpu: declare static function to fix compiler warning
Date: Fri, 26 Nov 2021 13:16:39 +0800
Message-ID: <20211126051639.25554-1-guchun.chen@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af288691-57f5-445d-8bfc-08d9b09bf730
X-MS-TrafficTypeDiagnostic: DM5PR12MB1948:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1948A5D633DF299C122754A6F1639@DM5PR12MB1948.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pdwRms7NkzFCxrN9E0AphY9NCykd5Wkbk5SL9mhdFzpn6h7oQvlf8A1ykvcuBentCc+xMjQVr4k+aWQ+m/rsX7PHQMgcyKAGlnu4mjffepxNLuxg6uzp38kFrW8gb4kDtf5qF4dtkW5YfGQcZy/+43BELPFziH3ECckEmUCR+TujFT894b9kqoFaI5JCIpQmiMXi8yS53II76+gTK0uG00e97fh5eeQjd/8gCjMD3dVtjjGxJ0/vmId5++Hp5V5gqQVKzPOnCWgHu4BqdnHbrwEnqTwPttver6J4ZXf/fOtWT79fGIZV1ZBLBu2oJ64WBW+g4Dd1QfuDlKhm6/bHRVtlvygCnIrVgsBKFzsJGHbsauPMg6GvV0u8ap5b+uREoCv1HslkOD1nvHrgeOt5aKlzsqmGwxezLDm0tvqwgu5b4W9Hbtxl7wYT/SxlTgrSS2MsZzQkr0UNdkD9atv57tPI7d+wGo/ETkj8fyyASYELMEHKkcN9O7AMVi3MDPm+xsNHZodEeWvLWMxso786be289In+QIGHACbAUC5vYp2ZGOB5cV/YSQKdq+VD2iXKpws2xaPH1h2Q5HvNn2e7H253xhPgRovTgq6/LuZuMjeSX07FKo2V7CFTacDXfdDGDGiZco8ic4JUFKOfvxgTdCe9iJj6oMzUOSn3osuouxCNNim9gNoO0UknpHEtQI9TMMDrRYb1tvcDVY92+jq+Fuh65R/Qgojd3UlCpcuCOq00Y/1pWi38HNKGI1sgdgCf
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(110136005)(26005)(508600001)(2616005)(44832011)(47076005)(81166007)(86362001)(2906002)(36756003)(8676002)(426003)(336012)(316002)(186003)(16526019)(5660300002)(83380400001)(82310400004)(6666004)(4326008)(6636002)(36860700001)(8936002)(1076003)(7696005)(356005)(70206006)(70586007)(2101003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 05:16:56.1480 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af288691-57f5-445d-8bfc-08d9b09bf730
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1948
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
Cc: Guchun Chen <guchun.chen@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

>> drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:503:6: warning: no previous prototype for function 'release_psp_cmd_buf' [-Wmissing-prototypes]
   void release_psp_cmd_buf(struct psp_context *psp)
        ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:503:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void release_psp_cmd_buf(struct psp_context *psp)
   ^
   static
   1 warning generated.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Guchun Chen <guchun.chen@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index c641f84649d6..b48d68d30d80 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -518,7 +518,7 @@ static struct psp_gfx_cmd_resp *acquire_psp_cmd_buf(struct psp_context *psp)
 	return cmd;
 }
 
-void release_psp_cmd_buf(struct psp_context *psp)
+static void release_psp_cmd_buf(struct psp_context *psp)
 {
 	mutex_unlock(&psp->mutex);
 }
-- 
2.17.1

