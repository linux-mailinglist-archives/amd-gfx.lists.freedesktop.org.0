Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B04B56C4AC
	for <lists+amd-gfx@lfdr.de>; Sat,  9 Jul 2022 01:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C0FA10ECA2;
	Fri,  8 Jul 2022 23:17:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85EE10E918
 for <amd-gfx@lists.freedesktop.org>; Fri,  8 Jul 2022 23:17:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hpWyC7KKBMLlG3huye8FhFWDxHU1eGw1Kbe09zlm8J/iBcYPaMklp8mDJPzaYFa3Pum+ir5S3tUwAwzi3wiS8UbHK+2Juw8zq2dMMtSCZUu7sptiPb1+uVddVUTT+RUiB7PbKgWsPGbIRMrp+wlpp3eKBK3ycvFnkLdVP2c+Rz3111cjrSKrabRIxkNcubANNBgm08jkLCVyUPUBd5h2VXPrrBHeiEE5tlJNpAOCjJK8D/60sIRl0qZ0OJOugNkzNbzJZ/1LDS3Zz/3eoBbrffte5WMom3N1e7HKisvVrfXDwuSkMfN+9lnPQWfOm9MlaLX4r2JIJn3RiX8GKiOL/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TWu9Lkv6mJl5Pc3k0quR5V5kQfxlAxVy+If4jvkMDJY=;
 b=GYIA1Cpfsjcs5WAK8oov9uz7zb6BN9fydPIwekK9guIMmrmfoSgRFLq+fkJ+Gp8oqA58aze/X5lZO5UGFcCVZ9LcfrRp6qEHHPDfkwPInaffbltr+yKQedHWE0ZJhygcb2WMpiEMGKT3/bW76VtakUfQGbDw4RBjkg29FqAlwgCEiH88lNB7UeURPJSco7nNr/ogyOHN4MxZJeUL/cuc1awXqaaRq55tfC6tG+qTvhOvASNgL31umyBaXUcE067qt6T/EqarfFwivr/5X7cG6QJ22jCiqgufJ9JF1AW7Y/lPEXKE1bIJUulM0kgMfLGJDtFE4++NhQmy3hmwBG+6aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TWu9Lkv6mJl5Pc3k0quR5V5kQfxlAxVy+If4jvkMDJY=;
 b=FrLUuX9KJh2fhioFlK6NuImSOWxMkwtw9KzZiHSepT7ZX9EiARbpiEGxYw+HHaICUYnvpnEMb/9haE2+OUsYv5Ab/L/q3DpP4duqnoTPWVpGCaUe+7OMFSJ9H15Dx/7ppg0q+sh4R8MDDm/IT5/fxIqjW2TfnrHp9sejCunLv6M=
Received: from MW4PR03CA0342.namprd03.prod.outlook.com (2603:10b6:303:dc::17)
 by PH0PR12MB5452.namprd12.prod.outlook.com (2603:10b6:510:d7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Fri, 8 Jul
 2022 23:17:11 +0000
Received: from CO1NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::16) by MW4PR03CA0342.outlook.office365.com
 (2603:10b6:303:dc::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.17 via Frontend
 Transport; Fri, 8 Jul 2022 23:17:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT014.mail.protection.outlook.com (10.13.175.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 23:17:10 +0000
Received: from RErrabolDevMach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 8 Jul
 2022 18:17:09 -0500
From: Ramesh Errabolu <Ramesh.Errabolu@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] x86/configs: Update defconfig with peer-to-peer configs
Date: Fri, 8 Jul 2022 18:17:01 -0500
Message-ID: <20220708231701.1522008-1-Ramesh.Errabolu@amd.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe2c2e53-211d-4529-8f2e-08da6137fc1f
X-MS-TrafficTypeDiagnostic: PH0PR12MB5452:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z39MkTuVypcg5p5TjG/adz4tL9d2X/O5TBxj17+8AbYYQ2li4CjuTyp5m8pzHq4g/bkSiWT5LsYnX7z+bKFQAnuWA2Glch5aEaWioDfwVYjpCJMpzpxwzOMtCg/x4loUqsY/wpm2JZTajVDTCCosGzFVr8SnOP9mYiV20DnOMfj0HbJTpslZfuVwWhsSCM9pHqgXQ80zp6fHv0ktqhB5Iu2QFtcklGLkV5TDdFqHI2bPRgYt7TePzo7vPikUR+qGK09YYdraWKqPsECGB3BIuCoetyBPgUpOEh6o0gOSmh+CMyJWEbFLTf1p+id6TxwPEdSHMndRdejmEPTvoFFkFHeR6mp58WFN/EntVeeDYO1M2/fLnFGIWmBREDUy7C4YW6jDsqu22Qui9yHMQTjtIoHHnR1IyVhW1CwmHAeSoxDy3bJ288mZrlNdvU4VeYFA82t2duInSxWRFWZCvksPEoPgIH9XbA94yyg3PRgcN2IoZdGl5HTf6+o+SHbtRl58I7FgXF9l5VXeotr0N3afCxGcHwjXOo9KTdqxpFajKjmplm6AaIuwATvYfKmARVOESy27sFadY6ta1g6siGu7H4xVxmyJ+ZXu21qFG269OlexYj2Ad8bx6RVJSAAAWfeRakkHXLzB2P68Ezp8f1dbrayLLRN8xerr9qti8nHWF7xhgLgL+C7hoZwP4S17kMU3/qP0GRQ5Dmqie0vElx9sN42gXuMkItnZNt+6oBKnKYrUNZPuJnJXXfRWix37UZmtZrheY8Ev1ZNj9WB/yHJ1yE77s/FbeI1lynNNlS/vA4N5XfUxL/fsfBW66HM299Rqt/yze8QHzPyGpW+DmQvUgzd85cW3twAPqjUjuGagHWUilwvRQFiT2WUDfA3Awzf3
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(396003)(39860400002)(136003)(46966006)(40470700004)(36840700001)(15650500001)(41300700001)(36756003)(2906002)(83380400001)(34020700004)(40480700001)(36860700001)(5660300002)(8936002)(1076003)(6666004)(7696005)(40460700003)(478600001)(336012)(70586007)(6916009)(4326008)(8676002)(81166007)(70206006)(426003)(47076005)(82740400003)(82310400005)(186003)(16526019)(356005)(26005)(2616005)(316002)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 23:17:10.5493 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe2c2e53-211d-4529-8f2e-08da6137fc1f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5452
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
Cc: Ramesh Errabolu <Ramesh.Errabolu@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

    - Update defconfig for PCI_P2PDMA
    - Update defconfig for DMABUF_MOVE_NOTIFY
    - Update defconfig for HSA_AMD_P2P
---

Notes:
    Following procedure was applied:
        make rock-dbg_defconfig
        make menuconfig
            Enable PCI_P2PDMA
            Enable DMABUF_MOVE_NOTIFY
            Enable HSA_AMD_P2P
        make savedefconfig
        cp defconfig rock-dbg_defconfig
        commit changes

 arch/x86/configs/rock-dbg_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/configs/rock-dbg_defconfig b/arch/x86/configs/rock-dbg_defconfig
index 406fdfaceb55..0ad80a8c8eab 100644
--- a/arch/x86/configs/rock-dbg_defconfig
+++ b/arch/x86/configs/rock-dbg_defconfig
@@ -303,6 +303,7 @@ CONFIG_PCIEAER=y
 CONFIG_PCI_REALLOC_ENABLE_AUTO=y
 CONFIG_PCI_STUB=y
 CONFIG_PCI_IOV=y
+CONFIG_PCI_P2PDMA=y
 CONFIG_HOTPLUG_PCI=y
 CONFIG_RAPIDIO=y
 CONFIG_RAPIDIO_DMA_ENGINE=y
@@ -417,6 +418,7 @@ CONFIG_DRM_AMDGPU=m
 CONFIG_DRM_AMDGPU_SI=y
 CONFIG_DRM_AMDGPU_CIK=y
 CONFIG_HSA_AMD=y
+CONFIG_HSA_AMD_P2P=y
 CONFIG_DRM_AST=m
 CONFIG_FB=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
@@ -453,6 +455,7 @@ CONFIG_LEDS_TRIGGERS=y
 CONFIG_RTC_CLASS=y
 # CONFIG_RTC_HCTOSYS is not set
 CONFIG_DMADEVICES=y
+CONFIG_DMABUF_MOVE_NOTIFY=y
 # CONFIG_X86_PLATFORM_DEVICES is not set
 CONFIG_AMD_IOMMU=y
 CONFIG_INTEL_IOMMU=y
-- 
2.35.1

