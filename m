Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3304B741F59
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Jun 2023 06:42:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 405EA10E0FF;
	Thu, 29 Jun 2023 04:42:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2057.outbound.protection.outlook.com [40.107.223.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD3110E079
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Jun 2023 04:42:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kFu1Gr42EAL6WaP4SebJGbJA+oNYnYAB3V7qA+G3dTXmA/xB6Tgk14nfvCadPUXmx00JNqCgAGhrw0spCr95b776V8rFmLo7yG3vdQntfliVsnlK7Ppe3r9UbflYLeOxoDZ+xZmjRoxXno0jclFe5tae8dpFcaWbpf7ssXDhp2QeuIW4mnXGkawqp2tCyllpeCZ2pVFznfh5ByfDd/l3NCcEKHXQ3vbAyFjF+wTKjGioPZL8b1pRfIm1NK+h6/P1IJZesTtw7KJHnD1b1pZqXVvsbNTfQN8JVC07/kk1ohC3y/ERvjLoqnBSmsK7jq3B/l4fCRYvAVTi8lSmgubLAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDPbkZFl4YxoBCXeTwqAGw81bXSYCO46GyCKl9D9kpk=;
 b=MZiOLrMK0yredgieBQqRa3CtrspZbLQYBWmMBwyi7+WtdD5KCEdP//w4XuUSwgYm8F4vzgYhiqwf0TfWRuexPQSRuMaZZf88pGFc/p7RGvjQ50KL5auBB7LcW5F6vmYYXfNHkl58ij4ClDMFC1uNuuhUWUl6KICWjbmpC7KWimRN23rmzPB+ICNtoX+zcPnfkcJVmTYYZ/WtjFKYIhkEizi4WyGHooPkpFGGK61f8RgxbcYzRaG3j+E6sQCmE/MoVYRUGdui44jJzPezFKguaQh3gcAIdiOAy6Fevr3//Kzu+7WGwTbcd5Gj4TAGB5z/3aedD2yQ2vxaDpblbZiTLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDPbkZFl4YxoBCXeTwqAGw81bXSYCO46GyCKl9D9kpk=;
 b=WC4py3QQN9j9ysjzFMK3TMjiX7slTTyRzJOf+PIyZVJqp68/y2u2Rkj3uj020/YNLyAtaZUW2WgmGMKyF51zthT3A6ruO/7rh4V4YXYt85pi7x74fylvzoSPco5oEnvxfuEqm+I59z3eksYj71Rf6+ZAf+5oie26RwNHZc5sgpA=
Received: from BN9PR03CA0724.namprd03.prod.outlook.com (2603:10b6:408:110::9)
 by SN7PR12MB8772.namprd12.prod.outlook.com (2603:10b6:806:341::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 29 Jun
 2023 04:42:39 +0000
Received: from BN8NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:110:cafe::3e) by BN9PR03CA0724.outlook.office365.com
 (2603:10b6:408:110::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.20 via Frontend
 Transport; Thu, 29 Jun 2023 04:42:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT014.mail.protection.outlook.com (10.13.177.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.49 via Frontend Transport; Thu, 29 Jun 2023 04:42:39 +0000
Received: from TRX40-1.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 28 Jun
 2023 23:42:37 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: Aurabindo Pillai <aurabindo.pillai@amd.com>, Rodrigo Siqueira
 <Rodrigo.Siqueira@amd.com>, Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH 4/6] drm/amd/display: Fix warning about msleep in
 amdgpu_dm_helpers.c
Date: Thu, 29 Jun 2023 10:12:06 +0530
Message-ID: <20230629044208.2266584-5-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230629044208.2266584-1-srinivasan.shanmugam@amd.com>
References: <20230629044208.2266584-1-srinivasan.shanmugam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT014:EE_|SN7PR12MB8772:EE_
X-MS-Office365-Filtering-Correlation-Id: 78334414-f53e-45db-c3ed-08db785b44c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u3PbkdDYxDSz+folNch+fG+xD3rNJDtwl9MsCtME/6KaRA5g9LHFu+kIpjiQWVHXVLOy56pZOh2kP0ksqlWTl6DIIyPB12vZ2zElUi2eug3E6ULLVG0orwl19OT38qEcwWO7V1nOmyilNLkUC42b/4IHXOmif/YCkDeKMl25HksHEGjuLVFUrg2BEM2RcwHAN/f4k0q589iprVLxA5i37HhY+IHqFBs52eWdUsnUgmguHG13HIrqOYT/vVPuKTLM7Vaxflrz1s3BFh1D/7fUHHAmBtuUG+i5e1AYMs2Ujf5QCI8p50WnVREcGY0bobVLtYjfKPvpQZQGYFHPXDzNnVfs2arOPMWSaWYD71P888Jwm7/k0wkPcacIxoakfsV+/zHezrRvKU4LjU4gROydN4O45hgcRR3W3E4GcQEcNvoNlfJ4AP/wyudrBboBkhKzIvdZOVrik//hGVhubkVGUXatccuip9J/4LIbTK2drGMCzW6/eBRYyadERd9j3RPdGIXeNXe+b/pAzS3Wbj8tnhAMYF1lQX1MMotE7955W4tztFAJwFrelG0n5/2Puv2Ec3Ehgo/D8eKXYo2e2DfpkniMB/PdB22MhHKGJHzoah+u3EpqrBAgBUojCZQARbqtRhvl7P+fndhUkmF6QdGWXgBPuvGaS6BHAH2oxv5nlPg1vesw0NSgh/70s8cTbnsqVP+qW0QMyNIxJ1lhdsSRC0e0FNS6ipppNr6OMlbuRHT4Ez4Ni5Dfk4/6h1ZtROOIA6tedV7V3wQM4Rclh9A3BQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(136003)(346002)(376002)(451199021)(36840700001)(46966006)(40470700004)(36756003)(82310400005)(36860700001)(82740400003)(81166007)(70206006)(40460700003)(44832011)(356005)(86362001)(5660300002)(316002)(4326008)(41300700001)(8936002)(40480700001)(6636002)(8676002)(70586007)(47076005)(2906002)(4744005)(7696005)(478600001)(1076003)(186003)(16526019)(426003)(26005)(336012)(83380400001)(110136005)(54906003)(6666004)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 04:42:39.3731 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78334414-f53e-45db-c3ed-08db785b44c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8772
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
Cc: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 amd-gfx@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Fixes the following category of checkpatch warning:

WARNING: msleep < 20ms can sleep for up to 20ms; see Documentation/timers/timers-howto.rst
+               msleep(10);

Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index c13b70629be6..a6be04ad387f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -643,7 +643,7 @@ static bool execute_synaptics_rc_command(struct drm_dp_aux *aux,
 		if (rc_cmd == cmd)
 			// active is 0
 			break;
-		msleep(10);
+		msleep(20);
 	}
 
 	// read rc result
-- 
2.25.1

