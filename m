Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D4D2BAE4
	for <lists+amd-gfx@lfdr.de>; Mon, 27 May 2019 21:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D55589A77;
	Mon, 27 May 2019 19:52:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780049.outbound.protection.outlook.com [40.107.78.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBEEC89A20
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2019 19:52:08 +0000 (UTC)
Received: from DM3PR12CA0110.namprd12.prod.outlook.com (2603:10b6:0:55::30) by
 BN7PR12MB2658.namprd12.prod.outlook.com (2603:10b6:408:29::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.17; Mon, 27 May 2019 19:52:05 +0000
Received: from CO1NAM03FT006.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::203) by DM3PR12CA0110.outlook.office365.com
 (2603:10b6:0:55::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.15 via Frontend
 Transport; Mon, 27 May 2019 19:52:05 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT006.mail.protection.outlook.com (10.152.80.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Mon, 27 May 2019 19:52:04 +0000
Received: from leodev.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 27 May 2019
 14:51:57 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 13/26] drm/amd/display: 3.2.32
Date: Mon, 27 May 2019 15:50:52 -0400
Message-ID: <1558986665-12964-14-git-send-email-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558986665-12964-1-git-send-email-sunpeng.li@amd.com>
References: <1558986665-12964-1-git-send-email-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(346002)(376002)(136003)(39860400002)(2980300002)(428003)(189003)(199004)(76176011)(8936002)(51416003)(81166006)(81156014)(8676002)(356004)(50226002)(2351001)(7696005)(2906002)(72206003)(478600001)(70586007)(36756003)(70206006)(4326008)(53936002)(16586007)(53416004)(2876002)(50466002)(48376002)(426003)(5660300002)(486006)(336012)(476003)(186003)(126002)(2616005)(77096007)(26005)(316002)(86362001)(6666004)(86152003)(6916009)(305945005)(47776003)(446003)(68736007)(4744005)(14444005)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2658; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a116c001-cb9c-4663-21bd-08d6e2dccb57
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:BN7PR12MB2658; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2658:
X-Microsoft-Antispam-PRVS: <BN7PR12MB265865A75A74CD855B2BFF98821D0@BN7PR12MB2658.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 0050CEFE70
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 0UwbhMJwrIuiStu0kNPJC0KEabFYCS/I2FYhpJ0OhgTdhBFOhNXcHxvW/9u3r34F6PCoCKYm5nmePcRUs67++2hyXfxFUIHNtY0W+0en3w3Wr0FQAoYuDvQyu9vr0yvIlFtz4qNgPLceo2scCeErb8+k+JixGz+aqlYi6wHumD8nIh4MVARRhKgaGEJceVZAXN2mcHnaGKYipm4g7tlU4NDmTBMDVFb4PlAmEL8chXoALR+uL2sfDX5a8Ik32ZxuLbjhmiYiPp2vjMsLr/6/h4lfxUaKS49mTuoqSiioRUk0t/vdrJiYbftRbBN1wAfe54IWCnREp7FO/dwj4SaEAKyGIGAeuXMxVKFZw9TRdY72VUQ656ht3SL2wLWpB6keLh51qjWkKWZzvGUcQhrtf53QZMQONYjqKz+Vv+4EmjU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2019 19:52:04.8707 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a116c001-cb9c-4663-21bd-08d6e2dccb57
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2658
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3w/Kp70HQhSU6v8YOQG/HhHoq6GG6ftzt1V0zf3OYjQ=;
 b=TOILk67ROd/lt2yaHwFnD3XgGkuebNE26am/jWNgXM2t0iF3kE7kcwhUFTTMyvV0+cSjcqsQRftHeOOjpI3vw5nS7HCtYAJ5SECwEuRc8g4A6UiZYpn90C7oSp/z4JzmCpzbI2OAJsP0xTiP9r8GL/vJUh6i3nkVmbraXctoq30=
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
Cc: Aric Cyr <aric.cyr@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQXJpYyBDeXIgPGFyaWMuY3lyQGFtZC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBBcmljIEN5
ciA8YXJpYy5jeXJAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFyaWMgQ3lyIDxBcmljLkN5ckBhbWQu
Y29tPgpBY2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmggfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGMuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oCmlu
ZGV4IDdhYzBlYTguLjdlYzY4ODQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kYy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oCkBA
IC0zOSw3ICszOSw3IEBACiAjaW5jbHVkZSAiaW5jL2h3L2RtY3UuaCIKICNpbmNsdWRlICJkbWwv
ZGlzcGxheV9tb2RlX2xpYi5oIgogCi0jZGVmaW5lIERDX1ZFUiAiMy4yLjMxIgorI2RlZmluZSBE
Q19WRVIgIjMuMi4zMiIKIAogI2RlZmluZSBNQVhfU1VSRkFDRVMgMwogI2RlZmluZSBNQVhfUExB
TkVTIDYKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
