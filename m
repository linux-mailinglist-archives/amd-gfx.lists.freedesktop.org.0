Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC9066473
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jul 2019 04:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BABB96E28C;
	Fri, 12 Jul 2019 02:34:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790051.outbound.protection.outlook.com [40.107.79.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F556E28C
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jul 2019 02:34:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jyE3GmMhaXHvW8eT5R3FNMD6BVBljgZx246cT+szLo1kmsLXgS7gRhNEBu97wLTCzTwyewlvvTFCqYeLcHBgU0YbKAok96RnG8Dx36FIoeBx0/Mck9Wca1KX9XmpJ37vEwvB+pMgOWsx0J1H0dwGJigdM8bjsKtMzDL9dxmancgg4UxYV+FqVqYOnxUQLnPaBUgqIuJ+T9DRNBk7wPTOhxnW2YmYIvDob3U+G5haNDPZtysFX6AMHFM/J9m/rI/qKxm9S6JXujGthVckWA+37tByi33a/B4/2CLBD2nyZjlLaV9LojINTgTeVDx/d7Gtspr0euqb3Nkp0eeJ+9DLmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2EHPFN+2T/q70Wd1V5g3UhG0u6eD8ItdZMbCmQP0ys=;
 b=jLtZcGqILVRcQV54YvaKFSvvCjmeSkdzcY4mo6emZFGdpE0wgRyAtt1clkD5Shc05VkxY2CDXAICW/HB5NdGlry5w9rkPN3qTywdP1LeNjs0HisO/JeY/O/5vuZNJRpmuQ5P6HVWus7GWLOXZEBxMzedH0+O6nBrng5CPcjLq2Q+3c8fQAM99Keoj3ix3hWD0Y+ftQbtgC8qTZafDkJF6OBkgqmDDGLLVTnQecxIgCqU0ISH7VyPLTHkk9AxUIB7NvzW3iswRo38GK9alosOpsiIEb0Uh7vkLMLRq9bN0zVMc39O61xV+szm45GGRhQlWx8IEpFBDQ2tfTLb1eGHwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from BN6PR1201CA0011.namprd12.prod.outlook.com
 (2603:10b6:405:4c::21) by BYAPR12MB2856.namprd12.prod.outlook.com
 (2603:10b6:a03:12c::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.11; Fri, 12 Jul
 2019 02:34:55 +0000
Received: from CO1NAM03FT005.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by BN6PR1201CA0011.outlook.office365.com
 (2603:10b6:405:4c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.10 via Frontend
 Transport; Fri, 12 Jul 2019 02:34:54 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT005.mail.protection.outlook.com (10.152.80.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Fri, 12 Jul 2019 02:34:53 +0000
Received: from build-machine.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 11 Jul 2019
 21:34:52 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: fix memory allocation failure check
Date: Fri, 12 Jul 2019 10:34:46 +0800
Message-ID: <20190712023446.8758-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(346002)(136003)(2980300002)(428003)(189003)(199004)(36756003)(2906002)(14444005)(47776003)(86362001)(1076003)(44832011)(4744005)(316002)(126002)(6666004)(2870700001)(486006)(356004)(4326008)(2616005)(476003)(5660300002)(6916009)(53936002)(186003)(8676002)(70586007)(70206006)(48376002)(336012)(478600001)(81156014)(50226002)(8936002)(53416004)(50466002)(7696005)(51416003)(68736007)(426003)(2351001)(81166006)(305945005)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2856; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af380d83-6939-4ba5-7dd5-08d7067185aa
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BYAPR12MB2856; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2856:
X-Microsoft-Antispam-PRVS: <BYAPR12MB285647135C9F2E6E7A2392C8E4F20@BYAPR12MB2856.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-Forefront-PRVS: 00963989E5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: nlD51jOfX4HKeHCT0hzMigzXd1i61HEq2UshTYevsmyuVeDR12Ivk1RKrLy3tf/Hz1vSiCTOKFTrmGrLbX5RbhqMPbhGxxMLMT3ncGujzaqLLj53VDJSKZzbFSShW4emWq9YzYrJHOY0QZXM+QIO3gZtKgowa4V7csjceatCuV7Jh0vPbcJcJaLt18buC3minbe2LCsujmLPFah2ant8m0RKkoxP6hQj/lAIBg0l6jMSz85NHuIhwLzDWJPEnMbEWh/ks5aBOOloCfrtBqdyXIDI8WaOq/J7CapqQxRk0df00nhiB0iLKi6BAPLNVE4pUR8qTohWejR9TryfCYh0Xz8cHbnQH+vuGcquS2Ac5j1dKQTD7z6tMUXi3mCcguO0gDM1PpU4a4e76V7UzxcgBT6Tycm3DWexa9pJG7BaJiI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2019 02:34:53.7787 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af380d83-6939-4ba5-7dd5-08d7067185aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2856
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2EHPFN+2T/q70Wd1V5g3UhG0u6eD8ItdZMbCmQP0ys=;
 b=s0uRC5wz5eZUGjRNJHgNHYJg7RTXJz5Fw6IeUVGCLZjLKjhR7E5f/qijUP8iWjhtjg0AGJIM0wfhjpmRqC59uuTtd9fiN2kM5z4FHnzghvR3ehnsoAbBaSKfbloYoVg+JrtQDWEX2CE1h3paLeXZKkI1cbSfNoWJupk1iFVEv20=
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
Cc: Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4IG1lbW9yeSBhbGxvY2F0aW9uIGZhaWx1cmUgY2hlY2suCgpDaGFuZ2UtSWQ6IEkwMTJiMDgy
YTdhMmI5Mjk3M2E3NmRiODAyOTg5N2ZiNGEzNDQxNjk0ClNpZ25lZC1vZmYtYnk6IEV2YW4gUXVh
biA8ZXZhbi5xdWFuQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
dmVnYTIwX3BwdC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVn
YTIwX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jCmlu
ZGV4IDFmYzM2NzMwN2FjMC4uOWUzZTczNzkyNmFhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvdmVnYTIwX3BwdC5jCkBAIC0zMTksNyArMzE5LDcgQEAgc3RhdGljIGludCB2ZWdh
MjBfdGFibGVzX2luaXQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIHN0cnVjdCBzbXVfdGFibGUg
KnRhYmxlcykKIAkgICAgICAgICAgICAgICBBTURHUFVfR0VNX0RPTUFJTl9WUkFNKTsKIAogCXNt
dV90YWJsZS0+bWV0cmljc190YWJsZSA9IGt6YWxsb2Moc2l6ZW9mKFNtdU1ldHJpY3NfdCksIEdG
UF9LRVJORUwpOwotCWlmIChzbXVfdGFibGUtPm1ldHJpY3NfdGFibGUpCisJaWYgKCFzbXVfdGFi
bGUtPm1ldHJpY3NfdGFibGUpCiAJCXJldHVybiAtRU5PTUVNOwogCXNtdV90YWJsZS0+bWV0cmlj
c190aW1lID0gMDsKIAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
