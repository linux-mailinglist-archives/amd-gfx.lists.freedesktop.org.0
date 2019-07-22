Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F20FF6F7D3
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jul 2019 05:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A2B899E8;
	Mon, 22 Jul 2019 03:16:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810044.outbound.protection.outlook.com [40.107.81.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2EA9899E8
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jul 2019 03:16:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJJgGDWxnV+9Yfd6g3up17M3ndzg8byw06Tsj621lZ5nioDrB5OU3/J/i6zGWYeIn4hxaSTb6cMrOtzdyRVSR2M9p5/OURw3kYUfn9v2+BL/WR5vBMizr1uQQtpSbynrCKFORQ2zYm55+ykPEe0fmjrqtM9rolheDog+E0LSe7kLqJZRx6wIbhlEa8WlBYwJQDKztdEHh3SK/VQJoYzujPuj8bG4s4TD8/H59NGIMXdoBGQYKg+9XwDx0CxHxlrFTDViuhAmmD0eZSRt7WZSmZkrKh/7Gm1op8peXatOpmbw9RAnqa9nUkgvyPTqLFdyJOHY7p+GniNY1UpBW9PRGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=We6IMJ4wvd4KJgdb7AHzGkLYx1jQuozZkseNQBJ6fgU=;
 b=iH1mlJHcjB/nKbx6a28KQDnOZBOlVUQz9SvkEELPpuKUhMHeRHp44T2HR4+QtITEml1ywHPiGNzRbQDje48YUAfRLyzodhMfSPmKaXfQs3Ews0WE8CSJQwZL/memzMX4wIfKsZN7TqvFhfobC/O1L6CRkoVJT9V4Xrhh5aWvnnjjHqc2Q+pk9kYSpCZ2kUobWfivIN1r/gF+/k+h57d6nnQWMtoadZL3AZADyBGz1frFL8j2FoNtVzm4H1B5KvuO+CtLytGEVyj1vsik8+nDznbiPi3CgCjgV7cbWIVuvKtZYxJANCngJdIlWeAyWvwqCM750+P9WCGN6XWZD/Y3sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from BN4PR12CA0010.namprd12.prod.outlook.com (2603:10b6:403:2::20)
 by BN6PR12MB1297.namprd12.prod.outlook.com (2603:10b6:404:14::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16; Mon, 22 Jul
 2019 03:16:11 +0000
Received: from DM3NAM03FT061.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::205) by BN4PR12CA0010.outlook.office365.com
 (2603:10b6:403:2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.15 via Frontend
 Transport; Mon, 22 Jul 2019 03:16:11 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT061.mail.protection.outlook.com (10.152.83.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 22 Jul 2019 03:16:10 +0000
Received: from equan-buildpc.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Sun, 21 Jul 2019
 22:16:01 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 4/5] drm/amd/powerplay: correct Navi10 VCN powergate control
Date: Mon, 22 Jul 2019 11:15:30 +0800
Message-ID: <20190722031531.23437-5-evan.quan@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190722031531.23437-1-evan.quan@amd.com>
References: <20190722031531.23437-1-evan.quan@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(346002)(136003)(2980300002)(428003)(189003)(199004)(5660300002)(426003)(305945005)(1076003)(70206006)(50226002)(53936002)(2616005)(48376002)(50466002)(81166006)(81156014)(70586007)(126002)(26005)(476003)(186003)(8936002)(446003)(36756003)(356004)(11346002)(6666004)(336012)(7696005)(76176011)(2351001)(486006)(44832011)(478600001)(6916009)(2870700001)(8676002)(86362001)(51416003)(47776003)(2906002)(68736007)(316002)(4326008)(53416004)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1297; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6323a2c0-df61-4bff-d8e6-08d70e52f225
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1297; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1297:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1297DB169094A631E7BBFC90E4C40@BN6PR12MB1297.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-Forefront-PRVS: 01068D0A20
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: gl1Il44/QtYtT3rSptN3ldQXn6BhBuCnyJyCQmprgfhpa5fCCtMamPbjQhLp5yfd8DFPfm7hB/BYmV5Yi4oaUYv1GhuobjWwG53AJDRt/PUUpx0d8dqazHHYlkE9k3VCHPBGPx7uoZkuyzCAKIJNIDULjFM74EBlI5dZur+vtIzyJiymD8bLnwwM9igcmBUuDaSr58lE9ROMwwaqVt0kUPX4SeNrvpSodJ2MZTzp7ks26HHwQ0S1zNCDabu8scgElTmHD6xgPt1yN+D1fV/md1KKd6+2rl2l3kzTVuJzfZfukyYr2WS7fe9ji9HlMOcOS13mis4igr+6teiqG7sy2h20eEMOR52PqYO1QrlZnUPDUbiKdCETJ0Hmy7QJFOWMVt3PNTMpj399cPKUrOGLSp3hFKCMhD0xd9+m+ivvYK4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2019 03:16:10.4835 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6323a2c0-df61-4bff-d8e6-08d70e52f225
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1297
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=We6IMJ4wvd4KJgdb7AHzGkLYx1jQuozZkseNQBJ6fgU=;
 b=errclh58Y0lPNmwIna21XKeszqTUFc7ird26mQc1tdcDbHWxUAzOn/GGm/Yqw5IH8qhNfGQijQ6ORElqk9uBioPQY+X+KrBUt94IjBLy5vsGnc7mavr79fxbNWP8dhbeTQ+WqgzDfQpDjHFeelyB2bjaTDYYO4We0c1WmFaXQ7c=
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
Cc: Alexander.Deucher@amd.com, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Tm8gVkNOIERQTSBiaXQgY2hlY2sgYXMgdGhhdCdzIGRpZmZlcmVudCBmcm9tIFZDTiBQRy4gQWxz
bwpubyBleHRyYSBjaGVjayBmb3IgcG9zc2libGUgZG91YmxlIGVuYWJsZW1lbnQvZGlzYWJsZW1l
bnQKYXMgdGhhdCdzIGFscmVhZHkgZG9uZSBieSBWQ04uCgpDaGFuZ2UtSWQ6IEk1OWM2MzgyOWNm
NGRjYjgwOTNmZGUxY2E4MjQ1YjYxM2FiMmQ5MGRmClNpZ25lZC1vZmYtYnk6IEV2YW4gUXVhbiA8
ZXZhbi5xdWFuQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2
aTEwX3BwdC5jIHwgMjYgKysrKysrKystLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkg
aW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvbmF2aTEwX3BwdC5jCmluZGV4IGM4Y2U5YmJhZTI3Ni4uMjE5OGQzNzNkMzhjIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCkBAIC01OTEsMjcgKzU5
MSwxOSBAQCBzdGF0aWMgaW50IG5hdmkxMF9zZXRfZGVmYXVsdF9kcG1fdGFibGUoc3RydWN0IHNt
dV9jb250ZXh0ICpzbXUpCiBzdGF0aWMgaW50IG5hdmkxMF9kcG1fc2V0X3V2ZF9lbmFibGUoc3Ry
dWN0IHNtdV9jb250ZXh0ICpzbXUsIGJvb2wgZW5hYmxlKQogewogCWludCByZXQgPSAwOwotCXN0
cnVjdCBzbXVfcG93ZXJfY29udGV4dCAqc211X3Bvd2VyID0gJnNtdS0+c211X3Bvd2VyOwotCXN0
cnVjdCBzbXVfcG93ZXJfZ2F0ZSAqcG93ZXJfZ2F0ZSA9ICZzbXVfcG93ZXItPnBvd2VyX2dhdGU7
CiAKLQlpZiAoZW5hYmxlICYmIHBvd2VyX2dhdGUtPnV2ZF9nYXRlZCkgewotCQlpZiAoc211X2Zl
YXR1cmVfaXNfZW5hYmxlZChzbXUsIFNNVV9GRUFUVVJFX0RQTV9VVkRfQklUKSkgewotCQkJcmV0
ID0gc211X3NlbmRfc21jX21zZ193aXRoX3BhcmFtKHNtdSwgU01VX01TR19Qb3dlclVwVmNuLCAx
KTsKLQkJCWlmIChyZXQpCi0JCQkJcmV0dXJuIHJldDsKLQkJfQotCQlwb3dlcl9nYXRlLT51dmRf
Z2F0ZWQgPSBmYWxzZTsKKwlpZiAoZW5hYmxlKSB7CisJCXJldCA9IHNtdV9zZW5kX3NtY19tc2df
d2l0aF9wYXJhbShzbXUsIFNNVV9NU0dfUG93ZXJVcFZjbiwgMSk7CisJCWlmIChyZXQpCisJCQly
ZXR1cm4gcmV0OwogCX0gZWxzZSB7Ci0JCWlmICghZW5hYmxlICYmICFwb3dlcl9nYXRlLT51dmRf
Z2F0ZWQpIHsKLQkJCWlmIChzbXVfZmVhdHVyZV9pc19lbmFibGVkKHNtdSwgU01VX0ZFQVRVUkVf
RFBNX1VWRF9CSVQpKSB7Ci0JCQkJcmV0ID0gc211X3NlbmRfc21jX21zZyhzbXUsIFNNVV9NU0df
UG93ZXJEb3duVmNuKTsKLQkJCQlpZiAocmV0KQotCQkJCQlyZXR1cm4gcmV0OwotCQkJfQotCQkJ
cG93ZXJfZ2F0ZS0+dXZkX2dhdGVkID0gdHJ1ZTsKLQkJfQorCQlyZXQgPSBzbXVfc2VuZF9zbWNf
bXNnKHNtdSwgU01VX01TR19Qb3dlckRvd25WY24pOworCQlpZiAocmV0KQorCQkJcmV0dXJuIHJl
dDsKIAl9CiAKKwlzbXVfZmVhdHVyZV9zZXRfZW5hYmxlZChzbXUsIFNNVV9GRUFUVVJFX1ZDTl9Q
R19CSVQsIGVuYWJsZSk7CisKIAlyZXR1cm4gMDsKIH0KIAotLSAKMi4yMi4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
