Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4868785B
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 13:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB3686ED99;
	Fri,  9 Aug 2019 11:27:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680075.outbound.protection.outlook.com [40.107.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7121D6ED99
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 11:27:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iutB5e4sY0XXbyp0Y6RNspT2oLI2obSZkReaYEI0MyYhLTJHif503zGNSNuxZJzR0qaiFdN7lHoKsPvnU8jMgZjv4R0DL+FGb5hwHTQ4pHmiUqjCmD+z0BgOFuJUnzA35b3/pGgSAVWDNhbOsCvG5KRiTF9cCEMFPuZlvGK+rEOZu8O6KFHuyi9rQdntudGfoWM71O1UBw2QBzc5W9vmAqmJdPM7GI9h6Xb0iIKCZ2gfmVtvMIGka7jblRyfHO65HMrIoRZm5frIT5JFttdQsSKXZ+mfRZJ4zPIZtmsJlCoUs1pQxWKoQsEFRhyl/xbRNiRcOOpHEqsxB3lYnUvBqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=acsgkCxALeJKdI/JyLz2lmhzMhPGgteomTOSOfN8HhY=;
 b=HSneHoLuwLfmTtgJIs5/C0FhplibHS2tzr5lO2NpFk4x6DgKXb2yMcO1eiv12d0vSME196vZEu6dI81urtljh6gQZRREzp1PU5cshNFohbxPdWWy1FyDsu31ogvPg5NSlSCu+YA0KgwzRJb1+P9zTmQFukITcrRyY18jOw6Za94WkF6Bnhk6SrWpI63J8vcmZIBsEp9ZtiAnPppTv3Z5OvE/T+PlcOx6azrS8qB+oQlxinbAfrjDaKxXK6kslKkriw4xoVzUa8GLOb+oKCpxZQp4/FkPpani88vdQeq850sTU8pE8FBf3gP2p9TkhYttF1Wsg1vZRnMdc6Cs9AcnnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM5PR12CA0049.namprd12.prod.outlook.com (2603:10b6:3:103::11)
 by SN6PR12MB2718.namprd12.prod.outlook.com (2603:10b6:805:70::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.12; Fri, 9 Aug
 2019 11:27:28 +0000
Received: from BY2NAM03FT040.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::207) by DM5PR12CA0049.outlook.office365.com
 (2603:10b6:3:103::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.18 via Frontend
 Transport; Fri, 9 Aug 2019 11:27:28 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT040.mail.protection.outlook.com (10.152.85.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Fri, 9 Aug 2019 11:27:27 +0000
Received: from localhost.localdomain (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 9 Aug 2019
 06:27:26 -0500
From: Le Ma <le.ma@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/1] drm/amdgpu/powerplay: update Arcturus smu version in new
 place
Date: Fri, 9 Aug 2019 19:27:23 +0800
Message-ID: <1565350043-7146-1-git-send-email-le.ma@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(396003)(2980300002)(428003)(189003)(199004)(316002)(305945005)(8676002)(81166006)(81156014)(70586007)(8936002)(50226002)(16586007)(2351001)(5660300002)(36756003)(70206006)(6666004)(356004)(476003)(186003)(126002)(2906002)(86362001)(44832011)(2616005)(478600001)(486006)(49486002)(426003)(336012)(47776003)(26005)(4326008)(48376002)(14444005)(51416003)(6916009)(53936002)(50466002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2718; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5b8d8b3-c012-435d-416a-08d71cbc8f3a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:SN6PR12MB2718; 
X-MS-TrafficTypeDiagnostic: SN6PR12MB2718:
X-Microsoft-Antispam-PRVS: <SN6PR12MB27185AEDCC628FFE56DB0060F6D60@SN6PR12MB2718.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-Forefront-PRVS: 01244308DF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: HQz1khn2gxg9XGJ/SC21RGbw4rWwwCdtq22a0v438uYrD2KzOFcBFZpYgHmCs3/WeDxxk3bTyFv47XJ/4ozorUgZwYHneayNBEJ0N3xkWVNgtfImjr9mWV5phCAfHozemYBQCxjAIDQBhmfD7acwR8GPyLdV9V0DI0/YtLqtiqKidvMRMv552N54P3cZJqsTamyyDbWwLzWXnEhR5Aa7snf4anHeQrjCr52JOyhPQolCgHhQEl3UNscVYK+KTQSdHvCIdhIpBI4AmvQ5n1SjpJtAHkw3tzsdQ31NLG/ijyDYj+WqGHpO1n5/7OxX4Gdwd5jfVIt3YRIu7eF2fXZqGuW6slnq20kEiMRcxsNodQtfQOK11VpILSAxktGIT2M3/GBBBqRDxb3TO4mnNxlhj1mnrDRWgBWv1+5G+VVfHEw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 11:27:27.6992 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b8d8b3-c012-435d-416a-08d71cbc8f3a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2718
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=acsgkCxALeJKdI/JyLz2lmhzMhPGgteomTOSOfN8HhY=;
 b=ZtYExcGlVFVFhtwiLgWRSlH8CiRcB4b6HO4zEkFONhFRljYEQ1bzf+fwrhat6F0tR+Js9GPDThNYT7KnL8eOVIJa0hufKGmLH0vDCIya8TtzqwdZnVMkiP0Xg7Cg5uWjAzFK9dymTFXEzfYgjAD1dL5TNJypc/ciX3rxlNEHk+8=
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
Cc: Le Ma <le.ma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rm9sbG93IHBhdGNoIGJlbG93OgogICAgZHJtL2FtZC9wb3dlcnBsYXk6IHJlLWRlZmluZSBzbXUg
aW50ZXJmYWNlIHZlcnNpb24gZm9yIHNtdSB2MTEKCkNoYW5nZS1JZDogSWQ3ODY1MTIwOWFkYzdh
MDk0ZjRjMTliYTk2NWRjZGVkMzdkZDNiYTcKU2lnbmVkLW9mZi1ieTogTGUgTWEgPGxlLm1hQGFt
ZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMg
ICAgICAgICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMv
c211MTFfZHJpdmVyX2lmX2FyY3R1cnVzLmggfCAyICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9pbmMvc211X3YxMV8wLmggICAgICAgICAgICAgICAgfCAxICsKIGRyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jICAgICAgICAgICAgICAgICAgICB8IDMgKysr
CiA0IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jCmluZGV4IGNmZjM3Nzcu
LmU2ZmNiZGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1
cnVzX3BwdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3Bw
dC5jCkBAIC0xOTE4LDYgKzE5MTgsNSBAQCB2b2lkIGFyY3R1cnVzX3NldF9wcHRfZnVuY3Moc3Ry
dWN0IHNtdV9jb250ZXh0ICpzbXUpCiAJc3RydWN0IHNtdV90YWJsZV9jb250ZXh0ICpzbXVfdGFi
bGUgPSAmc211LT5zbXVfdGFibGU7CiAKIAlzbXUtPnBwdF9mdW5jcyA9ICZhcmN0dXJ1c19wcHRf
ZnVuY3M7Ci0Jc211LT5zbWNfaWZfdmVyc2lvbiA9IFNNVTExX0RSSVZFUl9JRl9WRVJTSU9OOwog
CXNtdV90YWJsZS0+dGFibGVfY291bnQgPSBUQUJMRV9DT1VOVDsKIH0KZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9zbXUxMV9kcml2ZXJfaWZfYXJjdHVydXMu
aCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9zbXUxMV9kcml2ZXJfaWZfYXJj
dHVydXMuaAppbmRleCBjN2E3OTUzLi5iOTllOThjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9pbmMvc211MTFfZHJpdmVyX2lmX2FyY3R1cnVzLmgKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdTExX2RyaXZlcl9pZl9hcmN0dXJ1cy5o
CkBAIC0yNyw3ICsyNyw3IEBACiAvLyAqKiogSU1QT1JUQU5UICoqKgogLy8gU01VIFRFQU06IEFs
d2F5cyBpbmNyZW1lbnQgdGhlIGludGVyZmFjZSB2ZXJzaW9uIGlmCiAvLyBhbnkgc3RydWN0dXJl
IGlzIGNoYW5nZWQgaW4gdGhpcyBmaWxlCi0jZGVmaW5lIFNNVTExX0RSSVZFUl9JRl9WRVJTSU9O
IDB4MDgKKy8vI2RlZmluZSBTTVUxMV9EUklWRVJfSUZfVkVSU0lPTiAweDA4CiAKICNkZWZpbmUg
UFBUQUJMRV9BUkNUVVJVU19TTVVfVkVSU0lPTiA0CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L2luYy9zbXVfdjExXzAuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2luYy9zbXVfdjExXzAuaAppbmRleCBlZTg1NDJkLi5hY2JiODNkIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211X3YxMV8wLmgKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdV92MTFfMC5oCkBAIC0yNyw2ICsy
Nyw3IEBACiAKICNkZWZpbmUgU01VMTFfRFJJVkVSX0lGX1ZFUlNJT05fSU5WIDB4RkZGRkZGRkYK
ICNkZWZpbmUgU01VMTFfRFJJVkVSX0lGX1ZFUlNJT05fVkcyMCAweDEzCisjZGVmaW5lIFNNVTEx
X0RSSVZFUl9JRl9WRVJTSU9OX0FSQ1QgMHgwOAogI2RlZmluZSBTTVUxMV9EUklWRVJfSUZfVkVS
U0lPTl9OVjEwIDB4MzMKICNkZWZpbmUgU01VMTFfRFJJVkVSX0lGX1ZFUlNJT05fTlYxNCAweDM0
CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMKaW5kZXggOTFkZmFl
MS4uM2I4ZTU4ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211
X3YxMV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMK
QEAgLTI3NSw2ICsyNzUsOSBAQCBzdGF0aWMgaW50IHNtdV92MTFfMF9jaGVja19md192ZXJzaW9u
KHN0cnVjdCBzbXVfY29udGV4dCAqc211KQogCWNhc2UgQ0hJUF9WRUdBMjA6CiAJCXNtdS0+c21j
X2lmX3ZlcnNpb24gPSBTTVUxMV9EUklWRVJfSUZfVkVSU0lPTl9WRzIwOwogCQlicmVhazsKKwlj
YXNlIENISVBfQVJDVFVSVVM6CisJCXNtdS0+c21jX2lmX3ZlcnNpb24gPSBTTVUxMV9EUklWRVJf
SUZfVkVSU0lPTl9BUkNUOworCQlicmVhazsKIAljYXNlIENISVBfTkFWSTEwOgogCQlzbXUtPnNt
Y19pZl92ZXJzaW9uID0gU01VMTFfRFJJVkVSX0lGX1ZFUlNJT05fTlYxMDsKIAkJYnJlYWs7Ci0t
IAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
