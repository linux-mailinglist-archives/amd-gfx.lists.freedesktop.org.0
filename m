Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F38E71EB579
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jun 2020 07:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD536E140;
	Tue,  2 Jun 2020 05:49:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2081.outbound.protection.outlook.com [40.107.236.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF54D6E140
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jun 2020 05:49:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nwrC+41NwsSK22l1m8Bmv4O4eTemsfjWc0SfQyvj2GWWIGCLiX/XpQEJxO7TZhoWFtEGOd6BzqYcM1lszaItzuJjO4zK3PeYJiX8nrOHdbsh3UaCeMvBWN8e5Yadz73lf48qUum4YSP/lLLt0bEqkRACYv3SoxlHBGqshTxdjGg5luVzlMPnvUek0cFtOW68YjkcQKeBMCzXiP8Ot03h/sgREw1cjHz5P6NLQADJMWOcPljSHmdjXyPNfNJhXov7rtnar/iOn31DYI6k/RgLdPfRm9N6bQatl0kVdXNxkRu3NFWy/TYErPa77q3UFlxiwp69O1kMXZ0GvxWWl9H0yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4dt+mkUY4UyL1boZ3OVDYKW3Wcntsl3K7tmF8YWTbk=;
 b=Eou8r+K1O84xGwNWh1XnE3OqgL0xy1xG/KLYZdrwzxrwth7VQDM/m7zuRwOs1UwPnWxW+j+GCaTRya5E6w+lT3/YV3LD1S6q9vR8r9JH3HE+tfASoWbsHrqST2dK2ejRK+VbbpaEIaNR/XJy5YkaUlSdWR4VPT+TJ39VL+HWKKtR1VfJx7uQDjLwetTpvG7piIDYsVk5t0sc0BJxk48a464cKQ00M/jOsnkULCQs8Bp5Ns1HoqOImaLzPSKGjRgKjwSxXOFAsm+tWDyvrUfSTs52OtIGCL/75EyvfAG4xxgJp5Ilh+OJtBzh8tCp51kDtMeDpB5Zkw4awoIWzmZWjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4dt+mkUY4UyL1boZ3OVDYKW3Wcntsl3K7tmF8YWTbk=;
 b=X1djH66FckIkAsk17beAVFBiG1ORCLNbWGUX9wKB0gUTAT8pjhDTZ4fJ92NLahS0xSp21ToDjhiWG+qqACAdo/DZlhbiQU7AJnnWqmJNgrHdYh3QXa5HNm6rTvhP6tZl4DByfFcHJ5I63c+HFxfR7vbnr8x6w5urg4yAfHDs0+s=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from CY4PR12MB1287.namprd12.prod.outlook.com (2603:10b6:903:40::8)
 by CY4PR12MB1525.namprd12.prod.outlook.com (2603:10b6:910:11::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Tue, 2 Jun
 2020 05:49:54 +0000
Received: from CY4PR12MB1287.namprd12.prod.outlook.com
 ([fe80::a8f9:dd91:3039:d3dc]) by CY4PR12MB1287.namprd12.prod.outlook.com
 ([fe80::a8f9:dd91:3039:d3dc%8]) with mapi id 15.20.3045.024; Tue, 2 Jun 2020
 05:49:54 +0000
From: Guchun Chen <guchun.chen@amd.com>
To: amd-gfx@lists.freedesktop.org,
	Hawking.Zhang@amd.com,
	Tao.Zhou1@amd.com
Subject: [PATCH] drm/amdgpu: fix RAS memory leak in error case
Date: Tue,  2 Jun 2020 13:49:36 +0800
Message-Id: <20200602054936.17387-1-guchun.chen@amd.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: HK2PR02CA0139.apcprd02.prod.outlook.com
 (2603:1096:202:16::23) To CY4PR12MB1287.namprd12.prod.outlook.com
 (2603:10b6:903:40::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from guchchen-System-Product-Name.amd.com (58.247.170.242) by
 HK2PR02CA0139.apcprd02.prod.outlook.com (2603:1096:202:16::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3045.21 via Frontend Transport; Tue, 2 Jun 2020 05:49:52 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [58.247.170.242]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 28103b8a-3608-4f81-99d2-08d806b8c5e0
X-MS-TrafficTypeDiagnostic: CY4PR12MB1525:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR12MB15252F6F08609EC25B5B9AB8F18B0@CY4PR12MB1525.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 0422860ED4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dc2Ulifw+w1uy6USS3Z4qiSlHz4KNaoDHmBCGYld4wYf9+uHHHgoiOA1cQMArscN5w0ul+W12iD4yJIat4IO7Mnk2YayxCI0vVDMBq1xmLG7KNHaZ3qVandY0g1/NCOabR04JrBbn3h1bPDcPicJBUfwTa2eQRNYYb13dAp486b/WdrSYfgdQG/zoWDL/Vk0EZweYKL1obXIZ6xvPWa5B6/eR5bet1EDR8mDcOKRGsVM8SSrjUUImJmOsgHIyXKwta87NFdOUQCxzIzCLp76xnk6wI5dZxhmyKR9jztdME3Ep4Zb0+3wVEYSaydEaKRHisU/rhYp6WHKwyF0f1MnfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1287.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(83380400001)(5660300002)(316002)(36756003)(4326008)(86362001)(6666004)(26005)(66556008)(6636002)(186003)(66476007)(16526019)(66946007)(6486002)(7696005)(478600001)(52116002)(44832011)(8936002)(2616005)(956004)(2906002)(1076003)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: wiOQwUdW/s+/xxzuuIr2qKyc7U8d6wbH2lO0jrGiLlt02ukR+UIyK4CcDHC8bHw1DDExgDD5i+QWGRZZ4O4JwXh7QRGQ4uUadB17FnAtP4UQ75vdLHI5MfnORVIUQ7hEHo0bn6DK87JQCArIaskw7HdL/L2Ex6JobjRQVt8e8aorr7EGB8UVuMeEp7RyOoNNcAuDPIXfcrVBSM3LWLzfgCLjE2FLmmXUAcLBOqm/7/krb47FWmIkr5NJAw9vnhx1PXtCIYPLWonUSB1LLU40AFhJbCy/Q3UEMZprenOWQfzAtWqjWm0B2ttTdOm1xr7Q75lDRfe4A+JOZA5a/dFZQ1vWdbPtw8zlBIAHPmDVnl9J4AS3EcQ9LgP1FY5ZwOa3UhLAUFUUkdRpPiTYlRqR94/1KaRTgU+7srKGGy3SCzhyAvg2mcZjzsDqn6Nc8iZl+DKixX1T9FXrf+q5B3schzAtxvej2ahd8h+PIGw+YLs=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28103b8a-3608-4f81-99d2-08d806b8c5e0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2020 05:49:53.8864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VVk+QqBl1cCuHT32bqGUjvu1zssNOeFgI3SSr26sAOhJPUEyplLubFwZ3CNa/Aw4uCPyJPsROHXtnpyrpxlbWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1525
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RAS context memory needs to freed in failure case.

Signed-off-by: Guchun Chen <guchun.chen@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 5c73f444eaef..79bb05d791bc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -1881,9 +1881,8 @@ int amdgpu_ras_init(struct amdgpu_device *adev)
 	amdgpu_ras_check_supported(adev, &con->hw_supported,
 			&con->supported);
 	if (!con->hw_supported) {
-		amdgpu_ras_set_context(adev, NULL);
-		kfree(con);
-		return 0;
+		r = 0;
+		goto err_out;
 	}
 
 	con->features = 0;
@@ -1894,29 +1893,31 @@ int amdgpu_ras_init(struct amdgpu_device *adev)
 	if (adev->nbio.funcs->init_ras_controller_interrupt) {
 		r = adev->nbio.funcs->init_ras_controller_interrupt(adev);
 		if (r)
-			return r;
+			goto err_out;
 	}
 
 	if (adev->nbio.funcs->init_ras_err_event_athub_interrupt) {
 		r = adev->nbio.funcs->init_ras_err_event_athub_interrupt(adev);
 		if (r)
-			return r;
+			goto err_out;
 	}
 
 	amdgpu_ras_mask &= AMDGPU_RAS_BLOCK_MASK;
 
-	if (amdgpu_ras_fs_init(adev))
-		goto fs_out;
+	if (amdgpu_ras_fs_init(adev)) {
+		r = -EINVAL;
+		goto err_out;
+	}
 
 	dev_info(adev->dev, "RAS INFO: ras initialized successfully, "
 			"hardware ability[%x] ras_mask[%x]\n",
 			con->hw_supported, con->supported);
 	return 0;
-fs_out:
+err_out:
 	amdgpu_ras_set_context(adev, NULL);
 	kfree(con);
 
-	return -EINVAL;
+	return r;
 }
 
 /* helper function to handle common stuff in ip late init phase */
-- 
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
