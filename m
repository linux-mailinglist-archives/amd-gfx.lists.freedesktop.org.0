Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D050E71F48
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 20:28:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E136F6E378;
	Tue, 23 Jul 2019 18:28:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790053.outbound.protection.outlook.com [40.107.79.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F496E378
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 18:28:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e2I0U9RUgYQYC1KHWGF6tDZQo9fPDI+7yLZ08Ry4dsH+XlDXQ+1vfZWR2DOb+RYxQzEkvqu0Y+KzUv5YBKaLNn7gF78taqlTv7gt8YHTMPJGNoa0xT6mfaxWfn3oyvz4mArw8aWrGDgFu3CyX8D4mM/uNcN2UQg03HIVruaTaKVCr7hhdltuXvoyLzagt2BHmGrx39fT0pY76Pj9fB9XSYDIXxpzxus6vIA8uyvLCwSvmwvS8rL76muVOVfEj2X4KvXe5A3OX1lDbPYia/9uQTGawMLZVsyjAUusQp0WWsTRI5Qvl+S4MV7vhTBvHp4ddZM5BWfv9C/vf86JZBPIhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APLs3cyWFaXUySeaZUXT5RthTfGvhZh2XsYfQKyolr0=;
 b=EA9fb3jbDHLeoXXufLb+0VJ7Edko2STcc/klYr5jixWPLqlpImOKEcFzS8fo8gvSOmhg5ekB3zRVh4rUC6o3e0LYhVEqi4+zLK9xmW9mrV+OBNC4RfVvenj7iU5XGHOMCKQ/Y3rGjqv5Mg2ixcl9Un66YYnGduOK32PVDeonH/elZ6PUOSRAvyDRYDjywLOywUUjgVTthlaE3ThIhBiW/hQUjpG+8GbAy+SPIpl0+Y4jiNW4z4AxMj7rKf/R5rEL8Sbi/JJBsGy2JLtzOQvElBDfoORS1uA5ESMJ97Tqxz7HjT40gZu/2qqX72z+ejaf+PZle96l72v54LSUx8SQ7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM3PR12CA0059.namprd12.prod.outlook.com (2603:10b6:0:56::27) by
 DM5PR1201MB2489.namprd12.prod.outlook.com (2603:10b6:3:e2::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Tue, 23 Jul 2019 18:28:17 +0000
Received: from BY2NAM03FT047.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::205) by DM3PR12CA0059.outlook.office365.com
 (2603:10b6:0:56::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.14 via Frontend
 Transport; Tue, 23 Jul 2019 18:28:17 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT047.mail.protection.outlook.com (10.152.85.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 23 Jul 2019 18:28:16 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Tue, 23 Jul 2019 13:28:15 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 2/2] drm/amd: enable S/G for RAVEN chip
Date: Tue, 23 Jul 2019 14:25:35 -0400
Message-ID: <1563906335-12949-3-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563906335-12949-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1563906335-12949-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(396003)(39860400002)(2980300002)(428003)(199004)(189003)(446003)(47776003)(11346002)(16586007)(86362001)(316002)(8676002)(2616005)(126002)(426003)(5660300002)(26005)(6916009)(486006)(305945005)(476003)(54906003)(44832011)(356004)(4326008)(70586007)(6666004)(70206006)(53936002)(81156014)(36756003)(68736007)(2351001)(81166006)(76176011)(2906002)(7696005)(50226002)(336012)(186003)(51416003)(478600001)(8936002)(53416004)(50466002)(48376002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB2489; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48fc7d62-cb99-4c4a-e2f4-08d70f9b87f3
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR1201MB2489; 
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2489:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB24895A09CDA6DEC9F422C942EAC70@DM5PR1201MB2489.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-Forefront-PRVS: 0107098B6C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 3J/BVOwmkoDOz9fgPg7yJy+5JXLHcK9xLuAWblxnSbWr9Slawq+HRaADJLL6v2LqCafQ0m/z80GnWvpVPR7ay6qWmDCBj6goeJNhrZy9qAqetjgGohk2oY5VNZnuKDFAcb0jFhvvisCXeXjk6qzDirx7dEkDZYh429ibPM3E+2tcTSeP9/ehU/lRLkaKdraowy5guob6FXhpdm/nY4IRKge8iKVzw3wg/jjDwgHW5zckTaF0gOqgttqZd04PctMd+S9a6UFNC6ZI6ax6oEI6PBNwohwwRjUbQUn/ktZqM28YvdvTvTP2nO5rJripZ1ovF+oViR77x58vcgEzr6dxWsWUByZrvrQuJARaoNimYuTAjaXrDWM6POlKloFRqSt+e+a29h0KMhSaS4Ul3wJbwtjER6XUbe3KZDQjwmVMzxU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2019 18:28:16.9918 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48fc7d62-cb99-4c4a-e2f4-08d70f9b87f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2489
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APLs3cyWFaXUySeaZUXT5RthTfGvhZh2XsYfQKyolr0=;
 b=0Ka3loPZpyfJPU9/nlNDy3vq1e2wdepom9MN0+z23DeSGb8sbXkTfBeSNZ1McpgBS+30sCVTZ8/hWuFpJkeRdlwC3YP4K7DJTAMDpDl5awXkP6G1wd2XlG94ke1zfYppMtl6GniJKeStVaiyBTWjdzGW5VN8bWdcgqSpB5m/+NA=
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
Cc: Alexander.Deucher@amd.com, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 hersenxs.wu@amd.com, Christian.Koenig@amd.com, shirish.s@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogU2hpcmlzaCBTIDxzaGlyaXNoLnNAYW1kLmNvbT4KCmVuYWJsZXMgZ3B1X3ZtX3N1cHBv
cnQgaW4gZG0gYW5kIGFkZHMKQU1ER1BVX0dFTV9ET01BSU5fR1RUIGFzIHN1cHBvcnRlZCBkb21h
aW4KCnYyOgpNb3ZlIEJPIHBsYWNlbWVudCBsb2dpYyBpbnRvIGFtZGdwdV9kaXNwbGF5X3N1cHBv
cnRlZF9kb21haW5zCgpDaGFuZ2UtSWQ6IElmMzQzMDBiZWFhNjBiZTJkMzYxNzBiN2I1YjA5NmVj
NjQ0NTAyYjIwClNpZ25lZC1vZmYtYnk6IFNoaXJpc2ggUyA8c2hpcmlzaC5zQGFtZC5jb20+ClNp
Z25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNwbGF5LmMgICAgICAg
fCAxMyArKysrKysrKysrKy0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbS5jIHwgIDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc3Bs
YXkuYwppbmRleCA3NjdlZTY5OS4uZTM0ZTJmMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2Rpc3BsYXkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGlzcGxheS5jCkBAIC0zNyw2ICszNyw3IEBACiAjaW5jbHVkZSA8ZHJtL2Ry
bV9lZGlkLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9nZW1fZnJhbWVidWZmZXJfaGVscGVyLmg+CiAj
aW5jbHVkZSA8ZHJtL2RybV9mYl9oZWxwZXIuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX2NhY2hlLmg+
CiAKIHN0YXRpYyB2b2lkIGFtZGdwdV9kaXNwbGF5X2ZsaXBfY2FsbGJhY2soc3RydWN0IGRtYV9m
ZW5jZSAqZiwKIAkJCQkJIHN0cnVjdCBkbWFfZmVuY2VfY2IgKmNiKQpAQCAtNDk4LDggKzQ5OSwx
NiBAQCB1aW50MzJfdCBhbWRncHVfZGlzcGxheV9zdXBwb3J0ZWRfZG9tYWlucyhzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldikKIAl1aW50MzJfdCBkb21haW4gPSBBTURHUFVfR0VNX0RPTUFJTl9W
UkFNOwogCiAjaWYgZGVmaW5lZChDT05GSUdfRFJNX0FNRF9EQykKLQlpZiAoYWRldi0+YXNpY190
eXBlID49IENISVBfQ0FSUklaTyAmJiBhZGV2LT5hc2ljX3R5cGUgPCBDSElQX1JBVkVOICYmCi0J
ICAgIGFkZXYtPmZsYWdzICYgQU1EX0lTX0FQVSAmJgorCS8qCisJICogaWYgZHJtX2FyY2hfY2Fu
X3djX21lbW9yeSByZXR1cm5zIGZhbHNlIGluIGFtZGdwdV9ib19kb19jcmVhdGUKKwkgKiBBTURH
UFVfR0VNX0NSRUFURV9DUFVfR1RUX1VTV0MgZmxhZyB3YXMgdW5zZXQgbWVhbmluZyB0aGF0IFVT
V0MgbWFwcGluZ3MKKwkgKiBpcyBub3Qgc3VwcG9ydGVkIGZvciB0aGlzIGJvYXJkLiBCdXQgdGhp
cyBtYXBwaW5nIGlzIHJlcXVpcmVkCisJICogdG8gYXZvaWQgaGFuZyBjYXVzZWQgYnkgcGxhY2Vt
ZW50IG9mIHNjYW5vdXQgQk8gaW4gR1RUIG9uIGNlcnRhaW4KKwkgKiBBUFVzLiBTbyBmb3JjZSB0
aGUgQk8gcGxhY2VtZW50IHRvIFZSQU0gaW4gY2FzZSB0aGlzIGFyY2hpdGVjdHVyZQorCSAqIHdp
bGwgbm90IGFsbG93IFVTV0MgbWFwcGluZ3MuCisJICovCisJaWYgKGFkZXYtPmFzaWNfdHlwZSA+
PSBDSElQX0NBUlJJWk8gJiYgYWRldi0+YXNpY190eXBlIDw9IENISVBfUkFWRU4gJiYKKwkgICAg
YWRldi0+ZmxhZ3MgJiBBTURfSVNfQVBVICYmIGRybV9hcmNoX2Nhbl93Y19tZW1vcnkoKSAmJgog
CSAgICBhbWRncHVfZGV2aWNlX2FzaWNfaGFzX2RjX3N1cHBvcnQoYWRldi0+YXNpY190eXBlKSkK
IAkJZG9tYWluIHw9IEFNREdQVV9HRU1fRE9NQUlOX0dUVDsKICNlbmRpZgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKaW5kZXggOWVmNzg1
NC4uZDUwZjMwOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1
X2RtL2FtZGdwdV9kbS5jCkBAIC02ODYsNyArNjg2LDcgQEAgc3RhdGljIGludCBhbWRncHVfZG1f
aW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkgKi8KIAlpZiAoYWRldi0+ZmxhZ3Mg
JiBBTURfSVNfQVBVICYmCiAJICAgIGFkZXYtPmFzaWNfdHlwZSA+PSBDSElQX0NBUlJJWk8gJiYK
LQkgICAgYWRldi0+YXNpY190eXBlIDwgQ0hJUF9SQVZFTikKKwkgICAgYWRldi0+YXNpY190eXBl
IDw9IENISVBfUkFWRU4pCiAJCWluaXRfZGF0YS5mbGFncy5ncHVfdm1fc3VwcG9ydCA9IHRydWU7
CiAKIAlpZiAoYW1kZ3B1X2RjX2ZlYXR1cmVfbWFzayAmIERDX0ZCQ19NQVNLKQotLSAKMi43LjQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
