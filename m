Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BC16FE61E
	for <lists+amd-gfx@lfdr.de>; Wed, 10 May 2023 23:24:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1902A10E534;
	Wed, 10 May 2023 21:24:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342B510E52C
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 May 2023 21:23:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BdDxzD68CtL+p3zwjFX5ETHxklSl++28lwLd3shUrRqjVShA8r/ummd6zNXeyGt6tz2mVAKIV64+t7+oxDb9fzM4YJc0rwrrgFgsdObZl3u3FnpwF9oUs7NjEs4UiBtosQuGM0T+edY9ve8kS3RccCZ4Af0fLCWGPcgSXCcERYD9IwgH2JT6XA0fDdg2wq3WA3uKgml5GtowOeIjG33bw7YswNOa8cuVkLl4rg5UH+vhZdx3OJ9ltopTUwDT3rYKVHPxz9R9ncPbI/ZKV7j2jNkO631X/TP7oYIVlqaIqRKoa2Qdt28x7aAbgzRs7hLvKfo+vntHe2IHeHCebrdaEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1m/RAJ7hFFbANVMgKyrhaMNatY5IoFEdck4IJm8fyC4=;
 b=W93N8TmkbJxpen4P/A1JSvvLrzEreNDf+hA7C+fDQ9ynlBeaCVJb13Ks7omIWCArNLW5aurLBuLH+5JEILeBdn2YXTmJr6yjTWZX3Vn6UdfXbWLrdkxQCJvLpYNpD8omWM4fqlu3Kd2ucLYeXbGEkEJYTNtKI/SB+zDt8HYYNXIV3xTplBAv3TvU1bIzAtdLKeC1cjx+z3O07WaOsRNKcqq2ZmOeqJLOjFdTumNIGDazJogoJ9FwUwQ+LNV8gNVxhmcBaBjDuW6puNy6no1ATUAuS1CR+bWGqLmNMjT3e8WbGXHqlahnx2+0+20mk69age11AH3wQ5rlsN+GyNrRJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1m/RAJ7hFFbANVMgKyrhaMNatY5IoFEdck4IJm8fyC4=;
 b=d3/KFEZcXwlDwpf8tvy0YCnsVG+JEom7CMameaMdp4+PNNo/U7O4zG8G/jMdYI6cSrYJjI2+r96i+L55X04VPaszsl8uWbUm0BCnonL5bzXxnCZyPiO2K3/aaA3B83kEAEUK5wRTOVSBC/FrUFr0XR7D3xFdZT4SxcP2blFYIhc=
Received: from MW4PR03CA0065.namprd03.prod.outlook.com (2603:10b6:303:b6::10)
 by SN7PR12MB7155.namprd12.prod.outlook.com (2603:10b6:806:2a6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Wed, 10 May
 2023 21:23:56 +0000
Received: from CO1NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b6:cafe::5c) by MW4PR03CA0065.outlook.office365.com
 (2603:10b6:303:b6::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18 via Frontend
 Transport; Wed, 10 May 2023 21:23:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT014.mail.protection.outlook.com (10.13.175.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6387.21 via Frontend Transport; Wed, 10 May 2023 21:23:55 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 10 May
 2023 16:23:53 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 12/29] drm/amdgpu: Add memory partition id to amdgpu_vm
Date: Wed, 10 May 2023 17:23:16 -0400
Message-ID: <20230510212333.2071373-12-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230510212333.2071373-1-alexander.deucher@amd.com>
References: <20230510212333.2071373-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT014:EE_|SN7PR12MB7155:EE_
X-MS-Office365-Filtering-Correlation-Id: cbc9ecec-4863-4d82-4c56-08db519cdc92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t8GPlI377Ziv4cJXu9kCDxQSYl9KvpFBEmaj6ucLcBV2RMU59e3W88MfNT/S/uMD3Fnf/jjzXNTZlMmva+zLvV9ObDY17dPMPuWavEWuF62+L9ZSo43yk95eczE1KBTtR6w5GT+MwMlBUhHDAGhuTaWEPEgT7hskKLufDDXKfb7FYS3MEQs941UtSTaM1+kv90bhCTEr0WCMwXtkLuGSc47PJe85ZkYBC+IBaOa4zB7Hh57Xf1XhBLa8WN/DR1VTsCA4IkXTbUIVrnvSd3acCd1ldjwOHd3MriyNElLoai4IdNujXrvgN9lDapoNminrjnlVT6YToJLCtLPy+wdbW2aYkovHqWJrdTtWhpXAKRG2KkTlrqrJ5tfKUgRiZTo7u1cg033BWRE6CGccrpImbPdJzKDBzuhOg7a7dMm5y+Dxu5XKl81wUXwNgi2z6tvunsh2204UIMwgYsneOnE1H9Uk4kbRiXj21yJDu4RhbWBfkMZmIYHUxXmYOJNN60SE4nLJYZ4OMRiTJ3kcsqb168qoWyDmBJpWlotjwI9Yg76yFfTy45vxVYu4vJ+SlQPx7ip4ckB35B75YAQ5zUdr4VeNNDNb5ASS0S5mmhWCO3OLRPwkFt+6b/AF0P7e43CgU8YQQbCn+q9xWH9qwlJL6nZ36toRuzm2yFcjU7zJYVWRC6tGtRvnamB4t2qG25p50PJipvbmTLVPSjp67EdGmNAN3ia5hN55ihh8j7EurpI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(346002)(376002)(396003)(451199021)(36840700001)(40470700004)(46966006)(336012)(83380400001)(186003)(2616005)(16526019)(40460700003)(2906002)(426003)(36756003)(36860700001)(82310400005)(86362001)(81166007)(356005)(40480700001)(82740400003)(47076005)(6666004)(8936002)(8676002)(316002)(7696005)(41300700001)(5660300002)(54906003)(6916009)(70586007)(1076003)(478600001)(70206006)(4326008)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 21:23:55.8818 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbc9ecec-4863-4d82-4c56-08db519cdc92
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7155
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Philip Yang <Philip.Yang@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

If xcp_mgr is initialized, add mem_id to amdgpu_vm structure to store
memory partition number when creating amdgpu_vm for the xcp. The xcp
number is decided when opening the render device, for example
/dev/dri/renderD129 is xcp_id 0, /dev/dri/rederD130 is xcp_id 1.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 8 ++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  | 3 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c | 3 +++
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 879718598fa4..815098be4c2f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -1223,10 +1223,6 @@ int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
 		goto out_suspend;
 	}
 
-	r = amdgpu_xcp_open_device(adev, fpriv, file_priv);
-	if (r)
-		return r;
-
 	pasid = amdgpu_pasid_alloc(16);
 	if (pasid < 0) {
 		dev_warn(adev->dev, "No more PASIDs available!");
@@ -1237,6 +1233,10 @@ int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
 	if (r)
 		goto error_pasid;
 
+	r = amdgpu_xcp_open_device(adev, fpriv, file_priv);
+	if (r)
+		goto error_vm;
+
 	r = amdgpu_vm_set_pasid(adev, &fpriv->vm, pasid);
 	if (r)
 		goto error_vm;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index 2fdec4114627..d551fca1780e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -332,6 +332,9 @@ struct amdgpu_vm {
 	struct ttm_lru_bulk_move lru_bulk_move;
 	/* Flag to indicate if VM is used for compute */
 	bool			is_compute_context;
+
+	/* Memory partition number, -1 means any partition */
+	int8_t			mem_id;
 };
 
 struct amdgpu_vm_manager {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
index f2981d21d4e0..610c32c4f5af 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
@@ -364,6 +364,9 @@ int amdgpu_xcp_open_device(struct amdgpu_device *adev,
 			break;
 		}
 	}
+
+	fpriv->vm.mem_id = fpriv->xcp_id == ~0 ? -1 :
+				adev->xcp_mgr->xcp[fpriv->xcp_id].mem_id;
 	return 0;
 }
 
-- 
2.40.1

