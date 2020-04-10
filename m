Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 569241A3FA5
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Apr 2020 05:55:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8503F6EC4B;
	Fri, 10 Apr 2020 03:55:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33E96EC4B
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 Apr 2020 03:55:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ca8Rz0dLLGfIxke5qmNuuAMShUGtrIYcSS3fbiS23IuJ0pcvaN677iEY//JO/xN++zMc+z87fHJ79+hYXhk8LYc/wJNXCkEMquEjdvM6kWFXtHrY8eaY9u9sx0FbSlxa9ls/D4F80pbrhhcpQy1jBUZQUOhUjVRIU3G7flkRI4LNIATh8s6PCvBd0an3PbYu87/uRRRzTepzIne9+zNM43Bzjde7BeKEOtpCAESHEfq2D18DJtRa1OnOks9I8lsqezlO8MRPVSyVHnzsVO52a3LZ+8FwXaf3jb4W72jUUgMGXPw5ux4flO+TC+Jga2+DbZwYkzkIS2kbG1wNaH6E5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NMP6gTpte9wT/alVDw3X0yrn5zZMphl35bTUatOogA4=;
 b=SOE1M3ou2A+2BZu5FwTBpeG+KI4tWx78wQOxEPwQYjbBcS9AjXmkBx0itLfR5hQO6B+D6tWKySF39xQ2bXjwlRFFWNgWowFqtAzLLtqmjRzvlAmVB9aITOfugwrkKcdCzDSBQEaaa8jpVIiIK/euf0zToH7L0K+jL6zhevikxGElYb6ytXmKuxMIfgOwbBJKNdH4HguQJyJR2S1rPLFqr29lX9aMzaoLfHLnYTHINXyuLoaEI/u6gTPyfoaxIbdqXPjkPBMqwH5o0XWa68MBMkREPEYd3JdyCQYK+0IN3k81rWmecDMnWRFBobcrUTXq4g9PU11bygt3ZT958+pMCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NMP6gTpte9wT/alVDw3X0yrn5zZMphl35bTUatOogA4=;
 b=KtBATgHzUp7GQd6GPaKpwhnqgCWsmA+OWKDkMJF1sLSOcNtBZt8j8qZuuqWMo3fMg0xQbxuFpEghGIkjmeZwh4GaLcBgMczX1cXqMw20D3nCBOD369p+cPUjJfWQgRQ6bCXTpp3WtZVvjRbvQyEkRxcPscI/I+0IxJNdpoB0Xz4=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
Received: from BN6PR12MB1283.namprd12.prod.outlook.com (2603:10b6:404:19::8)
 by BN6PR12MB1523.namprd12.prod.outlook.com (2603:10b6:405:10::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16; Fri, 10 Apr
 2020 03:55:48 +0000
Received: from BN6PR12MB1283.namprd12.prod.outlook.com
 ([fe80::60b6:8e56:2853:614a]) by BN6PR12MB1283.namprd12.prod.outlook.com
 ([fe80::60b6:8e56:2853:614a%5]) with mapi id 15.20.2878.022; Fri, 10 Apr 2020
 03:55:47 +0000
From: Guchun Chen <guchun.chen@amd.com>
To: amd-gfx@lists.freedesktop.org, Hawking.Zhang@amd.com, Dennis.Li@amd.com,
 Tao.Zhou1@amd.com, John.Clements@amd.com
Subject: [PATCH] drm/amdgpu: add uncorrectable error count print in UMC ecc
 irq cb
Date: Fri, 10 Apr 2020 11:55:28 +0800
Message-Id: <20200410035528.27347-1-guchun.chen@amd.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: HK2PR04CA0065.apcprd04.prod.outlook.com
 (2603:1096:202:14::33) To BN6PR12MB1283.namprd12.prod.outlook.com
 (2603:10b6:404:19::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from guchchen-System-Product-Name.amd.com (180.167.199.189) by
 HK2PR04CA0065.apcprd04.prod.outlook.com (2603:1096:202:14::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.17 via Frontend Transport; Fri, 10 Apr 2020 03:55:45 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [180.167.199.189]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 571c7cea-d8b6-4c6c-6283-08d7dd030d30
X-MS-TrafficTypeDiagnostic: BN6PR12MB1523:|BN6PR12MB1523:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR12MB1523638A59D0D3B953FB7160F1DE0@BN6PR12MB1523.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 0369E8196C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR12MB1283.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(81156014)(8936002)(2616005)(44832011)(956004)(66946007)(4326008)(52116002)(1076003)(66556008)(66476007)(316002)(86362001)(16526019)(186003)(8676002)(7696005)(6666004)(5660300002)(26005)(478600001)(36756003)(2906002)(6636002)(6486002);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bcEcKJu5R9bypI5c5m0XxIbWZHX1rqT27YBYJOpQamIqRx0YzUISVdu0rYxes0j8MbViue/ZHVTai60svCjXb8l+uuWp+HMj9Z/WiZFYGc4HzmOrbqgqmvq7Hjc7IJxPDzdBNC71aLtvWrVQAv4pD02V2nyyZhgQxwL3WxMuQ9W6xI5xS4WQCPp8gOFYBMFgl3fJiq1Qv4KaOXSA5KHS/gALpvn5SnFaL8i3XPq9GS44YhPXFVnSY3jLFrB6F2a1sx6qzaivJSnzJ7AcvPi5uWNHa7pVsrOm8ImiWMGFUZTSejxq/Ku8uacG2DZaZFO3bQx8MBVZB5kzYZUZO0tJ0dI2HMfMqMwk0os6V39fbA8WQv/bApxO+dObMUN5N8MB80EjDvqI09O4O92GOqRBdYKZzVMkPlE8OlN3n3HPEbkXkfN10paK7zMOAyZyteNG
X-MS-Exchange-AntiSpam-MessageData: zHMycNFlaMrBKVkZR46UG3A97Y0f2rrqJo9ODtvY1h8GAFzZgbEIgwGfpm4YMPY/6GklDs3A4f3OHBAVYikVvI/qT3K0VvV6BEI4QMO+IIuajYUXJwwrHt5asUzy3ycR+UuPYex9Llt07/3BcfhxSQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 571c7cea-d8b6-4c6c-6283-08d7dd030d30
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2020 03:55:47.7637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lAtlMfGqc2eBXzPbkbyo806qV7TVij1qTkl+3Ov0NNrqJiZ/K62FhweuA3dwvR70zkvcTIJoa+i/29MiPG1xVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1523
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

Uncorrectable error count printing is missed when issuing UMC
UE injection. When going to the error count log function in GPU
recover work thread, there is no chance to get correct error count
value by last error injection and print, because the error status
register is automatically cleared after reading in UMC ecc irq
callback. So add such message printing in UMC ecc irq cb to be
consistent with other RAS error interrupt cases.

Signed-off-by: Guchun Chen <guchun.chen@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c
index f4d40855147b..267f7c30f4dd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c
@@ -121,6 +121,9 @@ int amdgpu_umc_process_ras_data_cb(struct amdgpu_device *adev,
 
 	/* only uncorrectable error needs gpu reset */
 	if (err_data->ue_count) {
+		dev_info(adev->dev, "%ld uncorrectable errors detected in UMC block\n",
+			err_data->ue_count);
+
 		if (err_data->err_addr_cnt &&
 		    amdgpu_ras_add_bad_pages(adev, err_data->err_addr,
 						err_data->err_addr_cnt))
-- 
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
