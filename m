Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A696CECD1
	for <lists+amd-gfx@lfdr.de>; Wed, 29 Mar 2023 17:26:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7FF610EB41;
	Wed, 29 Mar 2023 15:26:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E25110EB34
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 Mar 2023 15:25:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NHa5VZwx8YcPyFFDb5LG/0S7cLQtwPCTjttuMhruG1DlFPy9ASRPhajeHLjuD1+gbwQTaeU+7Sh22oCEdtR3DRznmSalHymFy2ACRvUguIyjmCbI2ppaV8s1tvYaeevZKFWhUWmjCfJw3iuI7uGOSJkX5G4rrVAF3zhWY9HCvSzFU72Jvd/BG9VJikGqNGrOzuFIOEG4Be5bY9s1ILpveKCMsQoRH1ULF6armr97x8rPxMilriX+v0+7RUuSMcAO9OtTni5DU8KH2/Hpe7Z/fD5vkqCCS9V3A2l6cR5fphcpq9QlVMWbCo0167wfGc8vADTlC+Wb8L6GI4ykB1Y4Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOlxoABgz9GDmYj9v8tfEwidZU8qCYNRSAeftkCdNVY=;
 b=gR/O46hjlyKYgQRzFN28yZ/ijvqMtgLGKDMX740m5vnJB7ORaD+BpJwufSjMraHowCkL/ASMNi1nBltLcCW4X3apcFTXJ4911O8IEVNz46ihpNq86JBl2Y6K0szQAwDLrHGkbvvl6IR0KtrgCNIkJPb+TowOfjjYuedXFVtLx15KNyT9xAggin5tz/9x5IGhTRP28jSIZEMbjE8Vze6lUq47+guw/WrRvIH3qUPi0adlCAgoUgHU26VNXvQw4n+2RVUzp1wtfh9f9l2vttCghYIS9feFHo2pPYbGD7jxRX10rqY2XF0aDI1RFc275MG/SNmCXH+hTeEcSdKlJu9Fxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOlxoABgz9GDmYj9v8tfEwidZU8qCYNRSAeftkCdNVY=;
 b=wORhKb1r18u4zZni9fxbZUg9+Qd0uPSbGnFum5I8u4JwV/hZ998/TyfVXpS5rT+EYxXbB2zTtsgFsAw67bWToTbr7n5o8skHKjxWalFATTxEbmQ7zrGqck3d+TY/MdHhag49ywtG5q0isrXzhHTrebrBqeXY6MpmHfZmtljSlOI=
Received: from BL0PR02CA0138.namprd02.prod.outlook.com (2603:10b6:208:35::43)
 by CH2PR12MB4937.namprd12.prod.outlook.com (2603:10b6:610:64::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Wed, 29 Mar
 2023 15:25:38 +0000
Received: from BL02EPF0000C402.namprd05.prod.outlook.com
 (2603:10b6:208:35:cafe::9d) by BL0PR02CA0138.outlook.office365.com
 (2603:10b6:208:35::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.20 via Frontend
 Transport; Wed, 29 Mar 2023 15:25:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000C402.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Wed, 29 Mar 2023 15:25:38 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 29 Mar
 2023 10:25:37 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 07/13] drm/amdgpu: add UAPI to query GFX shadow sizes
Date: Wed, 29 Mar 2023 11:25:15 -0400
Message-ID: <20230329152521.1980681-8-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329152521.1980681-1-alexander.deucher@amd.com>
References: <20230329152521.1980681-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C402:EE_|CH2PR12MB4937:EE_
X-MS-Office365-Filtering-Correlation-Id: 54102777-d184-4de6-0103-08db3069d9a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZjDMkZu1Kg/M/n+Ebq692P5AaNtJpPIdJ0egRMYTuGCaliM6sxVbSae0VZtmfNC0SC6bOGB6Bbm7YteQriJb2txkvOHj2pNO6l7kgm9N5FVKfbG2ucfKJtYLdPBuuxTMyYNpeWHLOkKAd5UlSumUkPkXbS419+JXhPBKHanHlH0ylvVAsfRA3Gk2O1dCHlfnIShSaV/GBoXhWSM9NGMpjVgHzDoIHJozfV1MOtXVSZ0d788tGm9/f1z1/jfxEFDtpQDrF8pj83gsLzZ5KQv0J0RMj9qpK1ar/XsuJ/0j7JZOxESNSLirBVyK9R4SzRqzxGONNyDZMcKQVj+eyNfCmu9on7spQyMxInhU4ZfbKZXsOa11tOJS4DoLzPEF+s1QJrhMiXXVtstLa5QxlP0BMXAcsO5PZhP32UhNfpNEl+QLADbMsJ4u9/AbAXreG+U946B7VxvQqWuh69hSGL2G/2GVDqYJTBI5hs7/EDH0EK1lnnxCG4fFbSZOzlInecsulK0lVOjE0FII/6ktLHK+GQ2Ca8v/hklqEv7KtT62Sel4/j2FnQ31jHWNrgp3NOJmh+Js1+kR+Q9yDDyn26O3A+YPe7F8s22mKM2a+Q+l0pPnIJFe0qgIJQgTZ0i0XGv8tfgB1gnjDUmC2ChTxPa3cbBj8H8FiumFN5wFxxkg3Ewp0k+JSCyUFdihmBhklx9er33xv5Xp4fJAcOu/ANf6JHHsFTSPxPwsIBQiMgf1cC0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(39860400002)(396003)(346002)(451199021)(40470700004)(46966006)(36840700001)(336012)(47076005)(426003)(8676002)(41300700001)(6916009)(356005)(81166007)(82740400003)(40480700001)(82310400005)(36756003)(40460700003)(4326008)(8936002)(7696005)(6666004)(70586007)(83380400001)(70206006)(316002)(36860700001)(2906002)(186003)(5660300002)(478600001)(16526019)(86362001)(54906003)(1076003)(2616005)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 15:25:38.3495 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54102777-d184-4de6-0103-08db3069d9a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000C402.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4937
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Add UAPI to query the GFX shadow buffer requirements
for preemption on GFX11.  UMDs need to specify the shadow
areas for preemption.

v2: move into existing asic info query
    drop GDS as its use is determined by the UMD (Marek)
v3: Update comments to note that alignment is base
    virtual alignment (Alex)

Reviewed-by: Marek Olšák <marek.olsak@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 include/uapi/drm/amdgpu_drm.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
index 3d9474af6566..72041a51cc27 100644
--- a/include/uapi/drm/amdgpu_drm.h
+++ b/include/uapi/drm/amdgpu_drm.h
@@ -1136,6 +1136,14 @@ struct drm_amdgpu_info_device {
 	__u64 mall_size;            /* AKA infinity cache */
 	/* high 32 bits of the rb pipes mask */
 	__u32 enabled_rb_pipes_mask_hi;
+	/* shadow area size for gfx11 */
+	__u32 shadow_size;
+	/* shadow area base virtual alignment for gfx11 */
+	__u32 shadow_alignment;
+	/* context save area size for gfx11 */
+	__u32 csa_size;
+	/* context save area base virtual alignment for gfx11 */
+	__u32 csa_alignment;
 };
 
 struct drm_amdgpu_info_hw_ip {
-- 
2.39.2

