Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE477D8DB2
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Oct 2023 06:04:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 438AF10E913;
	Fri, 27 Oct 2023 04:04:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2074.outbound.protection.outlook.com [40.107.237.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4648910E913
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Oct 2023 04:03:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A68d7hviLirN91dFzKhw49SJBPilFBNDrm2/+dYwLJ/cQbJD63iw7TPZ8UdJ/JeVc9sPj39O8iuh6EH4FBkqhTN1Rv2sqRXZGJ/9Y5oXol/EAKeNCouQAbyiZAjvb3cLQcOHHnIU98vHpTidDD0jfOVtsiSh69yWVm5X+q5mZm59ZNMPMIXz2M68Vyjyj1zs2jURooCBWTahecufhf6Kyq6ofa6xYURitcnZ0mevK1w23Fi0X9nXLFyahGT8kKrztCoxMo05Z9LyGKtyNoUra2d5mUiCrmRQadXX0cQ6/YlHTATqXC2by+iYh6170OVMdGut8FLcU/GqB8QuYRkTRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FschyKZ/YzMIQsxqRBjUXR9ua04itFfVXlw21X0xtz4=;
 b=jpsNwyjgY9hKi60vtlCmwVCtxJ2R42ACH29ZOa26/+HpVt8N79jK/sTJI5nIfrbjSIZ06PofYC4nFv1JwKzo068F3JelBoEtLhYgBlPRP3+5MXRiQlw3QgYQxPICV3nvK4MSPL4E2zpMCMvThNR/IIliULbN9STDcSZ7CRaxmQvCr0b0ttu0Qeo0vnLn22ZdfcRVfi6WnValZEhHPUKsG3RJfQY96vkxFtCoOXJNQ7k8sk5S0A3Hpeo01Uesyfnw9tF4d0NJXAmJ3nf3mrbrdBSorFuBe3i57mLpxB+GsyEXrgfvsfJR2FuXlJLBZAC3U2ODMyRQNM/VPJQEzisfEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FschyKZ/YzMIQsxqRBjUXR9ua04itFfVXlw21X0xtz4=;
 b=1CE8fk+2fsXHRMh7nBiXBSSPjFx6/ScJO8RSEKmX7OJxptbPX+Sx4GDLmGqt9r3nohazBXrDV0gBnJL8k6sHBr6j2dnUvIUNXnliMlMNWQj5y3r/nrJL2cHnI+W+/JguJImBojd6rLD1zvJ9WeiwumhwHThHyrArDyjqwVL3zpA=
Received: from DS7PR03CA0260.namprd03.prod.outlook.com (2603:10b6:5:3b3::25)
 by CO6PR12MB5473.namprd12.prod.outlook.com (2603:10b6:303:13e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.23; Fri, 27 Oct
 2023 04:03:55 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:5:3b3:cafe::87) by DS7PR03CA0260.outlook.office365.com
 (2603:10b6:5:3b3::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.36 via Frontend
 Transport; Fri, 27 Oct 2023 04:03:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Fri, 27 Oct 2023 04:03:55 +0000
Received: from taozhou1u2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 26 Oct
 2023 23:03:54 -0500
From: Tao Zhou <tao.zhou1@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: use mode-2 reset for RAS poison consumption
Date: Fri, 27 Oct 2023 12:03:45 +0800
Message-ID: <20231027040345.29495-1-tao.zhou1@amd.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|CO6PR12MB5473:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f6413ea-08d9-4c77-5380-08dbd6a1bd3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dhdqrE+55ENBH5OIEeFJzWCE7RGPeIIG2FlWiuxu28YkGMWsHHuSJid/jcsezV+RpvBUtoGtw5Xr8+Hw8seL/1PaLFwyOIR2Ez1gnXJZGlfLC1s94NS/U54pBQuFkFv0Gjkzt3enmm1wdZxepnAjzkmJx/0chd8P2vSWnelWJGZ3T13LLCF0cyDzA/J10yusOoTXTevpXfASxfzfzo+UJvI9rA4Vkr3p9eTAx1Z05xx251cujhu4zJ0B8vqNFpaDBoBQiQQCPRpmyrwGDJ599jAex+xPtgwuB5GEnpSup9OY+eV581EkuyyuI/dbwbvzRVikAtjwQWvr/6Smlmuv0QMi/dB71YmRYmyDggYhxKmsJeB2BJFuQF9EPoXw96ZMNLpFcIKz44bgznVR240ZLRUHMv6CvxEcNoySzUqQykQrfqxb1yOcf7X/X5/0bWRsycS5EJBqL6l7xevGo4Rb1qiu65iEhAE69pxp4PN1C1S+qaeDy7M6iKIrNnhKfc1zu4yGMEUzp3uiDtXz92xkhtCIQ8ZZZLOEo21mDExCg26kZDzCc2SjPytjBVjTqkKAXb1TSY22pVLMUVdFTqbWOQuzaDlpsWFEA1VKE2I/of6YTpm8oCvZv+O7qX0Q7kZ3tiEokq9yI69wRkSpNAFc3MFX1oBoqlTdr1vZ7tZ53m1dd/7rnmXunfc9hmMOAZ2kU+znFm1O34UsrHOnd0IOaOaZEx8RzQ6W3/SYtLB9fneGiP2L+oiomkysRmywa3HBietuchfDMBTcLkBKIKsPVA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(346002)(376002)(136003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(82310400011)(64100799003)(40470700004)(36840700001)(46966006)(5660300002)(316002)(6916009)(70586007)(70206006)(2616005)(1076003)(4744005)(2906002)(41300700001)(8676002)(8936002)(4326008)(478600001)(6666004)(40480700001)(40460700003)(7696005)(36860700001)(356005)(83380400001)(81166007)(47076005)(36756003)(26005)(426003)(336012)(16526019)(86362001)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 04:03:55.4355 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f6413ea-08d9-4c77-5380-08dbd6a1bd3b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5473
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
Cc: Tao Zhou <tao.zhou1@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Switch from mode-1 reset to mode-2 for poison consumption.

Signed-off-by: Tao Zhou <tao.zhou1@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c
index f74347cc087a..d65e21914d8c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c
@@ -166,8 +166,12 @@ static int amdgpu_umc_do_page_retirement(struct amdgpu_device *adev,
 			}
 		}
 
-		if (reset)
+		if (reset) {
+			/* use mode-2 reset for poison consumption */
+			if (!entry)
+				con->gpu_reset_flags |= AMDGPU_RAS_GPU_RESET_MODE2_RESET;
 			amdgpu_ras_reset_gpu(adev);
+		}
 	}
 
 	kfree(err_data->err_addr);
-- 
2.35.1

