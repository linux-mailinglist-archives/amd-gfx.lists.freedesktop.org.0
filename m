Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA126A75E2
	for <lists+amd-gfx@lfdr.de>; Wed,  1 Mar 2023 22:09:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D956F10E331;
	Wed,  1 Mar 2023 21:09:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7981410E32E
 for <amd-gfx@lists.freedesktop.org>; Wed,  1 Mar 2023 21:09:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LEjlURWvvw6s5fJeaRcsNsTetNYFgUeW0U26RWKkrqlNw6AqI0y0DSkt7zp3ESEDZj8cICefCSXH0iokTHbhTszwFPM17QmmBPBsrSYVTR/5b7VeSuc2RGg4sHaJZyb4TUT9B34F3Ocvj86hNxQjY+AIxA6FqMgwUJXdrDTNuqiwA3r7I9v6PITwK4d47a8SySC0JjgnHVruAkXw4J+pl2Ih3ERtEvnGA7/fj90YkPPERlzR+c2j1eR69CeYz0DY2MlErVvkogxHnsRZbMm7Dn7JowymQ7tRQCgdClYvRgk4WfhBS84KawaIXN2eN4fZsy8aazvPnpcq8iz+d0OK9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+sfZEtKm8bRmQ0grTcnXdCb5LyUaUkdK7Vi7LezNhEw=;
 b=Lq0u4QcUFZwDSQntdj1NSh3LxlYLyE4MVDT/so/tgm82x5RTKeSavQVzgSHNqb1++DpwJi3UFCbpssXe9hoeVvZ2T9NyqCSqD/T+o8B5mvtbP+wvapgGNdzzDRaS+b3KOU9gTTAGlK3uELzlX3VZRoP3DPO6t7qQQCKbJY5MeBSOweVCTZVuQO+/EJXBjfcvjqJyojze1qbki7cVEJhH3JOip6JK06sIwMjHAdC0GwLVpmnpYrJg45RNAjQe9t4qQpoLAu1BouVBC5hH0hzguV2KRG7cXD2F1Up8T2d8+RdbFcOs7vsBSc5SVFe3vBFvhGLvu+AimH3CY1NEl/ZSkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+sfZEtKm8bRmQ0grTcnXdCb5LyUaUkdK7Vi7LezNhEw=;
 b=iujGvpijp2m2kR7WUlq6QC7VB64PM8HCFqY4lOuH6aWQ2+STd7zqRBhO65gj1dmO728Xxk67WmyoZY0tUZGvIrGPVkOASByrlKbgNIa4H3FZ0KPWeN9OoyLsVo4LPHlfwmcE7eyjYDIlBl4+Sx81xyZqZZ5zxWFh4kCjmuDqizM=
Received: from BN8PR04CA0032.namprd04.prod.outlook.com (2603:10b6:408:70::45)
 by DM4PR12MB6040.namprd12.prod.outlook.com (2603:10b6:8:af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.27; Wed, 1 Mar
 2023 21:09:22 +0000
Received: from BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:70:cafe::e) by BN8PR04CA0032.outlook.office365.com
 (2603:10b6:408:70::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18 via Frontend
 Transport; Wed, 1 Mar 2023 21:09:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT030.mail.protection.outlook.com (10.13.177.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6156.18 via Frontend Transport; Wed, 1 Mar 2023 21:09:22 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 1 Mar
 2023 15:09:18 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/amdgpu: add IH ip block for IH 4.4.2
Date: Wed, 1 Mar 2023 16:08:52 -0500
Message-ID: <20230301210852.2098388-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301210852.2098388-1-alexander.deucher@amd.com>
References: <20230301210852.2098388-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT030:EE_|DM4PR12MB6040:EE_
X-MS-Office365-Filtering-Correlation-Id: 63a617fc-ee67-4443-f123-08db1a993b04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3hufYVanHo+n8V/s/ZV92HYZvYnR5WgNOepJi+J0jaQBqOy2Xu22VYodKl+aOTHqZwDnhXDml6a99tuiMzGLD29gTF2G2dMbhvMj0tHkgw5V/vqI79HylsIfy1xBqBjBp6jND4hdmRp1upi14WZ3edRtieJ01rS938M5XwtTQ6U0xMU3t8UV7zEs0iQObnKN6NgoNYoa/KuYM4ZufB+7qvbC7k66UjG7B3IzFsNWSIq9AMR+8Ocxk+9xWFiuE6xscVcoed4mOM9sAlY9v8cm5A8HSDrtbvN/aFWsxKjJ6DMy7mhgHfHYKQvK886c9wGiWvplLh9aD2cJxqq+cvWUbPXZjHnsBRN6GK+md5VhBLYq5ULA5FwYrPdGJF7WrnxpP1u/rII2LgxwRNplheETjdnLo3fTaq0XoavkxO+2r24/gxaqQo18qQCDEKh2UnQoyfS+pPMPNnWzGC549TRtNh4WaQqOvD/pMyRZ1+PjWthDkah6q4Rnq3IkZw3CKF6UqOQQMYzxoQImfri0ovZ8yTRLj5EYXR3T9TwI6DdoKLJh98Ec20OJEnUuwR3K2Xz3ku/9nY2I8tsd1SUQScBT3CUoslnsy3KP8z9FEJxbm3RePCJhe2Jgr3hCBWIDA2uKjq5QuqxvUK5Q0vM4X0PHVeKV0fu501XKKdZY8oyBKVecmQLhXV7zmfvo+IObQrqq9hEq87WKp1r6e5qB6c0aa5ySxwSOeUlIagjNRbHHgQ8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(396003)(376002)(346002)(39860400002)(451199018)(46966006)(40470700004)(36840700001)(8676002)(8936002)(81166007)(54906003)(316002)(36756003)(336012)(16526019)(478600001)(4744005)(186003)(7696005)(26005)(86362001)(1076003)(2616005)(82310400005)(356005)(2906002)(40480700001)(6666004)(40460700003)(5660300002)(82740400003)(83380400001)(70586007)(70206006)(4326008)(6916009)(41300700001)(426003)(47076005)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 21:09:22.5086 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63a617fc-ee67-4443-f123-08db1a993b04
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6040
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <Le.Ma@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Hawking Zhang <Hawking.Zhang@amd.com>

Add IH IP handling for IH 4.4.2

Signed-off-by: Hawking Zhang <Hawking.Zhang@amd.com>
Reviewed-by: Le Ma <Le.Ma@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index ea040adb1f15..a610fc922df1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -1583,6 +1583,7 @@ static int amdgpu_discovery_set_ih_ip_blocks(struct amdgpu_device *adev)
 	case IP_VERSION(4, 2, 0):
 	case IP_VERSION(4, 2, 1):
 	case IP_VERSION(4, 4, 0):
+	case IP_VERSION(4, 4, 2):
 		amdgpu_device_ip_block_add(adev, &vega20_ih_ip_block);
 		break;
 	case IP_VERSION(5, 0, 0):
-- 
2.39.2

