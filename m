Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEE92BAD7
	for <lists+amd-gfx@lfdr.de>; Mon, 27 May 2019 21:51:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8D9899B7;
	Mon, 27 May 2019 19:51:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690069.outbound.protection.outlook.com [40.107.69.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F168999E
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2019 19:51:55 +0000 (UTC)
Received: from DM3PR12CA0110.namprd12.prod.outlook.com (2603:10b6:0:55::30) by
 BYASPR01MB3.namprd12.prod.outlook.com (2603:10b6:a02:ce::31) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.15; Mon, 27 May 2019 19:51:52 +0000
Received: from CO1NAM03FT006.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::203) by DM3PR12CA0110.outlook.office365.com
 (2603:10b6:0:55::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.15 via Frontend
 Transport; Mon, 27 May 2019 19:51:52 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT006.mail.protection.outlook.com (10.152.80.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Mon, 27 May 2019 19:51:51 +0000
Received: from leodev.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 27 May 2019
 14:51:50 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 02/26] drm/amd/display: Don't use ROM for output TF if
 GAMMA_CS_TFM_1D
Date: Mon, 27 May 2019 15:50:41 -0400
Message-ID: <1558986665-12964-3-git-send-email-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558986665-12964-1-git-send-email-sunpeng.li@amd.com>
References: <1558986665-12964-1-git-send-email-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(396003)(376002)(39860400002)(346002)(2980300002)(428003)(189003)(199004)(186003)(86362001)(72206003)(6666004)(356004)(2876002)(316002)(2351001)(2870700001)(47776003)(6916009)(2906002)(70586007)(68736007)(70206006)(11346002)(305945005)(77096007)(5660300002)(446003)(2616005)(53936002)(4326008)(5820100001)(8936002)(476003)(486006)(86152003)(8676002)(81166006)(478600001)(14444005)(81156014)(76176011)(23676004)(7696005)(53416004)(426003)(50466002)(26005)(126002)(336012)(36756003)(50226002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYASPR01MB3; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f076806-1bbe-4037-20e8-08d6e2dcc372
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:BYASPR01MB3; 
X-MS-TrafficTypeDiagnostic: BYASPR01MB3:
X-Microsoft-Antispam-PRVS: <BYASPR01MB3F5D8BEFFE299B1A00C67821D0@BYASPR01MB3.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 0050CEFE70
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: YtqA2WTwzsnuh8V+3lFdy/sRddnagOmmzrkvjHuupspP1iHwfR0OTo4pqAU00D9zVgORT4NaRJ2Jgf226MrdfWqX5Ypmu+TMzFblawWxZCRYa6kDDPjs6WGocM37HV3fpMlYdWaIPR+CuoL867qPGNLs1LL5rbL+ILe4pulxSf6MgkoG/hl072Q69Aco81tFvGRpQPmE9A/tXDlRF9E3xrdktC0m5zFJkA6UDvkpqKLzJ9WLsMXZfe5QB9E/Ttnwz2zBOkLwM7KFf2sRW/oYAn6VAcclx4hKMirV5JhmjD72OVMfYIRozs010FTxZSOxs3k9OGZwEaMMTMi4n+RDJyIvwzGiUTCorGFtvhh52Ry1AtmwYurM7wkIt2fzJ4sLbkYPjIMtgvfOthfmmppB5xSA37rPEkfDcxO7MJUGilQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2019 19:51:51.7092 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f076806-1bbe-4037-20e8-08d6e2dcc372
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYASPR01MB3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NvGgA8B2vU2LqoKx86Uko3TOtNW1wGsdI8v1rAM3otg=;
 b=HfiR8WhykrUuM58Mc4e8C7mHuil5XZj+VOulTnpV4ZEjAu++gruBPdmK8q3NnxonyGBnufms7HoisFacvZSp9Zu0mymoqIvYammZSPnTJQcuCpFLJroGcQM3nGlSKeZLFccKKS/Tw4zFVCH9R+RnqUrMXSSfmcJEgYZWKg/AHqM=
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
Cc: Hugo Hu <hugo.hu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSHVnbyBIdSA8aHVnby5odUBhbWQuY29tPgoKV2UgY2Fu4oCZdCB1c2UgaGFyZGNvZGVk
IFNSR0IgUk9NIGZvciBvdXRwdXQgVEYgaWYgd2UgaGF2ZSBHQU1NQV9DU19URk1fMUQKKHVubGVz
cyB3ZSBrbm93IDFEIExVVCBpcyBpZGVudGl0eSksIHNvIHdlIG5ldmVyIHdhbnQgdG8gcmV0dXJu
IGhlcmUgZWFybHkuCldlIGFwcGx5IHRoZSBMVVQgcGFydCBvZiBDb2xvclRyYW5zZm9ybTN4NCBv
bmx5IGluIGFwcGx5X2x1dF8xZCgpIHdoaWNoIGlzCmNhbGxlZCBuZWFyIHRoZSBlbmQgb2YgdGhh
dCBmdW5jdGlvbi4KClNpZ25lZC1vZmYtYnk6IEh1Z28gSHUgPGh1Z28uaHVAYW1kLmNvbT4KUmV2
aWV3ZWQtYnk6IEtydW5vc2xhdiBLb3ZhYyA8S3J1bm9zbGF2LktvdmFjQGFtZC5jb20+CkFja2Vk
LWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvbW9kdWxlcy9jb2xvci9jb2xvcl9nYW1tYS5jIHwgMyArKy0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9jb2xvci9jb2xvcl9nYW1tYS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvY29sb3IvY29sb3JfZ2FtbWEuYwppbmRleCA4
NjAxZDM3Li4zNjlhODkwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
bW9kdWxlcy9jb2xvci9jb2xvcl9nYW1tYS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9tb2R1bGVzL2NvbG9yL2NvbG9yX2dhbW1hLmMKQEAgLTE1NjksNyArMTU2OSw4IEBAIGJv
b2wgbW9kX2NvbG9yX2NhbGN1bGF0ZV9yZWdhbW1hX3BhcmFtcyhzdHJ1Y3QgZGNfdHJhbnNmZXJf
ZnVuYyAqb3V0cHV0X3RmLAogCQkJb3V0cHV0X3RmLT50ZiA9PSBUUkFOU0ZFUl9GVU5DVElPTl9T
UkdCKSB7CiAJCWlmIChyYW1wID09IE5VTEwpCiAJCQlyZXR1cm4gdHJ1ZTsKLQkJaWYgKHJhbXAt
PmlzX2lkZW50aXR5IHx8ICghbWFwVXNlclJhbXAgJiYgcmFtcC0+dHlwZSA9PSBHQU1NQV9SR0Jf
MjU2KSkKKwkJaWYgKChyYW1wLT5pc19pZGVudGl0eSAmJiByYW1wLT50eXBlICE9IEdBTU1BX0NT
X1RGTV8xRCkgfHwKKwkJCQkoIW1hcFVzZXJSYW1wICYmIHJhbXAtPnR5cGUgPT0gR0FNTUFfUkdC
XzI1NikpCiAJCQlyZXR1cm4gdHJ1ZTsKIAl9CiAKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
