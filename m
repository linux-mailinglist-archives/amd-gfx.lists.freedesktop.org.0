Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B91BA2EF5
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Aug 2019 07:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957AF6E231;
	Fri, 30 Aug 2019 05:33:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820084.outbound.protection.outlook.com [40.107.82.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 808FC6E231
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Aug 2019 05:33:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FoQ8dTbIqh6oiOzetKuyM27vhEbTMuO5xx00wOM5D1bEs343Hl6Pbzix47JUPEBdkrTzHl3JwjxCydZyWwDlJ92so/Tf9hl9X1g/wjET1Dk4ibuwyw1D342djKwH91XIhQbiqR42LmCg4hmG60jDXVRUtV72RyE3yFTs/663HIkM9CQ8ALXCy3iEP4/LRjhlmf8aWD2L34KsEpRjyEW9OJIr5RhnF4Ym0KDpzwMschNjz0U1ydaNexEhY6mDhA2X6Qgae1TGKI1HRp4BzOrYhlS91/FS7kZbTkutpgchtH/y8LQVpDsT6duNNRUCPVqDWrJ998bL4YLHhDTdFzAnhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DVw1VEZOSRA+YwTEhrjk5b4DARqK8EzDkYzgMu3biJM=;
 b=Ypi/fR4qFEUdBB7/zb4HZihLr7NxQ7nk8ppqiiFcpCjh6aQVZpmi4KPNK/DS+i4smAsuHI/kShrxZdXT46l0poOgTV4KTjum3yo86gkYzfB8hBJ1SG3SPt77eVpuZc70O3ItW3LmbIDkqLMknQ2cYGujFTr9ZXYBeFfouWT8C063ra0T6fDxUqbhqmtExwxCB0tHAGmEyRBCYTZ98TW5qznccC+L8CTKnFV1tlt5KjJvk3T6Q4nG8Fv1NErVM2aGnroZtVV5snK1Z087jGs1Wd6bSiLHSJoidz9GaIYvX90bN4WrlC3xptSXf0Lgi1e2EAP4rSm3LIakPVEjTZcc/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN4PR12CA0002.namprd12.prod.outlook.com (2603:10b6:403:2::12)
 by MWHPR1201MB0126.namprd12.prod.outlook.com (2603:10b6:301:57::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.18; Fri, 30 Aug
 2019 05:33:27 +0000
Received: from DM3NAM03FT021.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::200) by BN4PR12CA0002.outlook.office365.com
 (2603:10b6:403:2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.19 via Frontend
 Transport; Fri, 30 Aug 2019 05:33:27 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT021.mail.protection.outlook.com (10.152.82.187) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Fri, 30 Aug 2019 05:33:26 +0000
Received: from lnx-aaliu.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 30 Aug 2019
 00:33:25 -0500
From: Aaron Liu <aaron.liu@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amdgpu: update IH_CHICKEN in oss 4.0 IP header for
 VG/RV series
Date: Fri, 30 Aug 2019 13:33:14 +0800
Message-ID: <1567143195-22090-1-git-send-email-aaron.liu@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------2.7.4"
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(346002)(136003)(2980300002)(428003)(199004)(189003)(8676002)(478600001)(2906002)(26005)(426003)(33964004)(2616005)(14444005)(54906003)(53936002)(2476003)(4326008)(305945005)(316002)(5024004)(16586007)(336012)(186003)(568964002)(66616009)(8936002)(70206006)(50226002)(2351001)(70586007)(6916009)(126002)(235185007)(71190400001)(476003)(44832011)(486006)(5660300002)(7696005)(356004)(6666004)(15650500001)(5000100001)(53416004)(81156014)(81166006)(86362001)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR1201MB0126; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 082546d4-5438-4460-c2cc-08d72d0b9562
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(49563074);
 SRVR:MWHPR1201MB0126; 
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0126:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB01269630676763080C8602BDF0BD0@MWHPR1201MB0126.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:428;
X-Forefront-PRVS: 0145758B1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: h/FyfMdSylc7q1EWkg2HQXQG5gyNsAbLefkSUfcp0SAu7BHjmggVxuIQRMlN6YdyOq7zgPdbuI64n5qUlhTCZPZALCrPgYD3lh0f+d3UpAAVsn+JbXgIeMH2MvRFyviP6uWgsvz2wvQ+vA7LiEGEUB5EnuJa5CbXEbR1+QpJufDjEhcLni4acSsUj9/jPGrXeGqt3x9HfDx1VyGiP9JnGgtL9UOEF8R7cdh0PPLkNZnlWs31Un2sNljKfn6SeuDn4FTY0YNfCuCifm5j06uyjPD+k+KXO7OjakCJUGWjfHNWnGEbelh2Duo8la8exW3jUzqW+bf9nCDVoSjMhapKR0pbmicdk5dih/HEyw8h8SAGkLjySBfPO0+kCVUwm5qw9To64vpyz7K8OB/osyj9au9ZL1n3XZIMYfqnwYe+pvw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2019 05:33:26.8470 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 082546d4-5438-4460-c2cc-08d72d0b9562
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0126
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DVw1VEZOSRA+YwTEhrjk5b4DARqK8EzDkYzgMu3biJM=;
 b=FxnpPIzalxUqJ7dy1p2cWB6nms5MMNjFaLYb8EcJKSewLVdnseYB3zYhDADhiYxstv59BS/r3g+1sndod5vP3fK9LS/L1erONRy7ynrrrWEyAz4+9sSlHmTe9G8Wi+hF2EpaR8zsCLar3JcOaU6qbLqBpHtsMR1l/0xyMr+s84s=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Deucher <alexander.deucher@amd.com>, Ray.Huang@amd.com,
 Aaron Liu <aaron.liu@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--------------2.7.4
Content-Type: text/plain; charset="UTF-8"; format=fixed
Content-Transfer-Encoding: 8bit


In Renoir's emulator, those chicken bits need to be programmed.

Signed-off-by: Aaron Liu <aaron.liu@amd.com>
Reviewed-by: Huang Rui <ray.huang@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/include/asic_reg/oss/osssys_4_0_sh_mask.h | 4 ++++
 1 file changed, 4 insertions(+)


--------------2.7.4
Content-Type: text/x-patch;
	name="0001-drm-amdgpu-update-IH_CHICKEN-in-oss-4.0-IP-header-fo.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
	filename="0001-drm-amdgpu-update-IH_CHICKEN-in-oss-4.0-IP-header-fo.patch"

diff --git a/drivers/gpu/drm/amd/include/asic_reg/oss/osssys_4_0_sh_mask.h b/drivers/gpu/drm/amd/include/asic_reg/oss/osssys_4_0_sh_mask.h
index 1ee3a23..dc9895a 100644
--- a/drivers/gpu/drm/amd/include/asic_reg/oss/osssys_4_0_sh_mask.h
+++ b/drivers/gpu/drm/amd/include/asic_reg/oss/osssys_4_0_sh_mask.h
@@ -1109,7 +1109,11 @@
 #define IH_CID_REMAP_DATA__CLIENT_ID_REMAP_MASK                                                               0x00FF0000L
 //IH_CHICKEN
 #define IH_CHICKEN__ACTIVE_FCN_ID_PROT_ENABLE__SHIFT                                                          0x0
+#define IH_CHICKEN__MC_SPACE_FBPA_ENABLE__SHIFT                                                               0x3
+#define IH_CHICKEN__MC_SPACE_GPA_ENABLE__SHIFT                                                                0x4
 #define IH_CHICKEN__ACTIVE_FCN_ID_PROT_ENABLE_MASK                                                            0x00000001L
+#define IH_CHICKEN__MC_SPACE_FBPA_ENABLE_MASK                                                                 0x00000008L
+#define IH_CHICKEN__MC_SPACE_GPA_ENABLE_MASK                                                                  0x00000010L
 //IH_MMHUB_CNTL
 #define IH_MMHUB_CNTL__UNITID__SHIFT                                                                          0x0
 #define IH_MMHUB_CNTL__IV_TLVL__SHIFT                                                                         0x8

--------------2.7.4
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--------------2.7.4--
