Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35443D59DF
	for <lists+amd-gfx@lfdr.de>; Mon, 14 Oct 2019 05:21:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B9706E1B5;
	Mon, 14 Oct 2019 03:21:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770074.outbound.protection.outlook.com [40.107.77.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D107E6E1B5
 for <amd-gfx@lists.freedesktop.org>; Mon, 14 Oct 2019 03:21:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ABl+01mAQq5yeC6Y2lqbPtXhYymMfYZ6rT1tgi/W0e6VG3ZX+NBYRlg1TO5n6+2/ZrNe9G1tt1QJ7peVVLOwIetCrFQJtLebOdPdQjliUKc4x8C3MjIKPIQ/545toN2yyyjjX1U9m218JzfeS/YYtgo0dFcp7jDmbukt4bMcR6M2lcKa1Jc6U06LDll6cNM5Nvxw25PzU3343MYHGhNGmRixDDGKJ3/2shMryi0RjXiCLBDFmDtTOqUbIdWkmLgxNIlHUIwk0h/09jCj9xtMDwug+NEs/KGYNbpatqncr0oQ5DgZDTiiCf6Qu2V9A32sq2UiebWm9qM3XtGCML/Zvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HsERg8eetYDw+ZejOnsh0GKigyDVbEZeH921fnkYZXw=;
 b=KZnhNAp+qHNQFtc2KOvPDX7noyDOsooy+DGYk/kaYgxi603Dl0wCm6BILRuroOCXF0M1EKS6NfQuYVjVhVYn50yyg4CZQEK1ZMtmzEyvTBU2Ac/vp+9wLWJIGz4cfWf7HmUD8TO+7+wVSnD3Mz+izKTfTtkEM/we29EnQf2WhKYQp7cCsoqAvlKBgJDslC0UIrXKDqfB1fbhoXEF12zVM1P/H/y+H760etKaKhHvDWgMUERIiaEsfZAPIqN9qc9SumOhwnd35gqZgftQ1oVZG9SBPV6AtwhXhXb7QzUEZE5Hg+RxxCjjBlVb0WTMimhA1M/7VMW2HiFB4pipcFSTNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0055.namprd12.prod.outlook.com (2603:10b6:3:103::17)
 by DM5PR12MB2405.namprd12.prod.outlook.com (2603:10b6:4:b2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Mon, 14 Oct
 2019 03:21:25 +0000
Received: from CO1NAM03FT054.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::203) by DM5PR12CA0055.outlook.office365.com
 (2603:10b6:3:103::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.17 via Frontend
 Transport; Mon, 14 Oct 2019 03:21:25 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM03FT054.mail.protection.outlook.com (10.152.81.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2347.21 via Frontend Transport; Mon, 14 Oct 2019 03:21:25 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sun, 13 Oct
 2019 22:21:24 -0500
Received: from rico-code.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Sun, 13 Oct 2019 22:21:23 -0500
From: Tianci Yin <tianci.yin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/8] drm/amdgpu: add a generic fb accessing helper function(v3)
Date: Mon, 14 Oct 2019 11:21:12 +0800
Message-ID: <20191014032118.14020-2-tianci.yin@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191014032118.14020-1-tianci.yin@amd.com>
References: <20191014032118.14020-1-tianci.yin@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(136003)(39860400002)(428003)(189003)(199004)(6666004)(356004)(50226002)(70206006)(70586007)(1076003)(4326008)(305945005)(81156014)(81166006)(8936002)(8676002)(50466002)(48376002)(36756003)(86362001)(186003)(16586007)(2351001)(6916009)(44832011)(476003)(26005)(126002)(2616005)(11346002)(14444005)(316002)(54906003)(76176011)(486006)(7696005)(51416003)(2906002)(426003)(5660300002)(336012)(446003)(47776003)(53416004)(478600001)(41533002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2405; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d5950e4-afc8-4c13-f6e8-08d75055982f
X-MS-TrafficTypeDiagnostic: DM5PR12MB2405:
X-Microsoft-Antispam-PRVS: <DM5PR12MB24057F6C304FAD430EBF14B595900@DM5PR12MB2405.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 01901B3451
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rrl7xrRITJh+0lrdyIthZic4psdLBDQSRWwtQ0sHD5Eejl+jLVP1Z+1Jc0YbA4a+bXdDqBKC2yNZkRM6XZWIFcvHwJgQJg9Bcjym3JL9jh8vABwnkc2h718riWXPuwY049G2Kdwvx7nsKpR0Q1cLIuTuQyPalKSW147c78FwPGYygwnHKVMc2uxTjFVzLVPE0gpgvKgMooZJYUSngjOjPaUNmLNbjwetOpewepPR25kc3TqpwtbpgBYGhha8ZLQgzzzmJY9p3FNdY7AC9Isqs1R5dSaCc+DSSlogIjbL6V2xg/WmKWt87GK4Ou41c4cjYW4kHuF4NiOJ+D8Kmq33mKhPVHypbUlmVaXwKaFia5eiQkG9MpS4mHKEjxEoJtWBksy9rFmMpAnycihBZZy6RGjbOtWWbL/2wjsMUowhub4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2019 03:21:25.0275 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d5950e4-afc8-4c13-f6e8-08d75055982f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2405
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HsERg8eetYDw+ZejOnsh0GKigyDVbEZeH921fnkYZXw=;
 b=ZwWXkZkJh5bDlpG0TKLXG9UrfrheZt7MjwuCdHgLFtZnvvHVOcYXhR8fIqreCFPvnQY52J28WuBJgKLbAjib67Wh7WVQQuFC/i3kYojx2L7yFpMUzYZZMksabidg2GM/c/aEOM6Fwoi2rXBgoxpgvNKXbz6JZocLfjlkAb64y6Y=
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
Cc: Deucher Alexander <Alexander.Deucher@amd.com>,
 Tuikov Luben <Luben.Tuikov@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Tianci Yin <tianci.yin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogIlRpYW5jaS5ZaW4iIDx0aWFuY2kueWluQGFtZC5jb20+CgphZGQgYSBnZW5lcmljIGhl
bHBlciBmdW5jdGlvbiBmb3IgYWNjZXNzaW5nIGZyYW1lYnVmZmVyIHZpYSBNTUlPCgpDaGFuZ2Ut
SWQ6IEk0YmFhMGFhNTNjOTNhOTRjMmVmZjk4YzYyMTFhNjFmMzY5MjM5OTgyClJldmlld2VkLWJ5
OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6
IFRpYW5jaS5ZaW4gPHRpYW5jaS55aW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHUuaCAgICAgICAgICAgfCAgMiArKwogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2RldmljZS5jICAgIHwgMzAgKysrKysrKysrKysrKysrKysrKwogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc2NvdmVyeS5jIHwgMTIgKy0tLS0tLS0KIDMg
ZmlsZXMgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmggYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHUuaAppbmRleCA3ZmE4ZTQzOGY2NzkuLjY0YTQzYjY1YTE5NyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKQEAgLTk5Miw2ICs5OTIsOCBAQCBpbnQg
YW1kZ3B1X2RldmljZV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogdm9pZCBhbWRn
cHVfZGV2aWNlX2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwogaW50IGFtZGdwdV9n
cHVfd2FpdF9mb3JfaWRsZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7CiAKK3ZvaWQgYW1k
Z3B1X2RldmljZV92cmFtX2FjY2VzcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgbG9mZl90
IHBvcywKKwkJCSAgICAgICB1aW50MzJfdCAqYnVmLCBzaXplX3Qgc2l6ZSwgYm9vbCB3cml0ZSk7
CiB1aW50MzJfdCBhbWRncHVfbW1fcnJlZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWlu
dDMyX3QgcmVnLAogCQkJdWludDMyX3QgYWNjX2ZsYWdzKTsKIHZvaWQgYW1kZ3B1X21tX3dyZWco
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90IHJlZywgdWludDMyX3QgdiwKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwppbmRleCA1OTgxNThlOTVl
YzEuLjEzY2MzYWE1MmI4ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
ZXZpY2UuYwpAQCAtMTU0LDYgKzE1NCwzNiBAQCBib29sIGFtZGdwdV9kZXZpY2VfaXNfcHgoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldikKIAlyZXR1cm4gZmFsc2U7CiB9CiAKKy8qKgorICogVlJBTSBh
Y2Nlc3MgaGVscGVyIGZ1bmN0aW9ucy4KKyAqCisgKiBhbWRncHVfZGV2aWNlX3ZyYW1fYWNjZXNz
IC0gcmVhZC93cml0ZSBhIGJ1ZmZlciBpbiB2cmFtCisgKgorICogQGFkZXY6IGFtZGdwdV9kZXZp
Y2UgcG9pbnRlcgorICogQHBvczogb2Zmc2V0IG9mIHRoZSBidWZmZXIgaW4gdnJhbQorICogQGJ1
ZjogdmlydHVhbCBhZGRyZXNzIG9mIHRoZSBidWZmZXIgaW4gc3lzdGVtIG1lbW9yeQorICogQHNp
emU6IHJlYWQvd3JpdGUgc2l6ZSwgc2l6ZW9mKEBidWYpIG11c3QgPiBAc2l6ZQorICogQHdyaXRl
OiB0cnVlIC0gd3JpdGUgdG8gdnJhbSwgb3RoZXJ3aXNlIC0gcmVhZCBmcm9tIHZyYW0KKyAqLwor
dm9pZCBhbWRncHVfZGV2aWNlX3ZyYW1fYWNjZXNzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
LCBsb2ZmX3QgcG9zLAorCQkJICAgICAgIHVpbnQzMl90ICpidWYsIHNpemVfdCBzaXplLCBib29s
IHdyaXRlKQoreworCXVpbnQ2NF90IGxhc3Q7CisJdW5zaWduZWQgbG9uZyBmbGFnczsKKworCWxh
c3QgPSBzaXplIC0gNDsKKwlmb3IgKGxhc3QgKz0gcG9zOyBwb3MgPD0gbGFzdDsgcG9zICs9IDQp
IHsKKwkJc3Bpbl9sb2NrX2lycXNhdmUoJmFkZXYtPm1taW9faWR4X2xvY2ssIGZsYWdzKTsKKwkJ
V1JFRzMyX05PX0tJUShtbU1NX0lOREVYLCAoKHVpbnQzMl90KXBvcykgfCAweDgwMDAwMDAwKTsK
KwkJV1JFRzMyX05PX0tJUShtbU1NX0lOREVYX0hJLCBwb3MgPj4gMzEpOworCQlpZiAod3JpdGUp
CisJCQlXUkVHMzJfTk9fS0lRKG1tTU1fREFUQSwgKmJ1ZisrKTsKKwkJZWxzZQorCQkJKmJ1Zisr
ID0gUlJFRzMyX05PX0tJUShtbU1NX0RBVEEpOworCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZh
ZGV2LT5tbWlvX2lkeF9sb2NrLCBmbGFncyk7CisJfQorfQorCiAvKgogICogTU1JTyByZWdpc3Rl
ciBhY2Nlc3MgaGVscGVyIGZ1bmN0aW9ucy4KICAqLwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc2NvdmVyeS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2Rpc2NvdmVyeS5jCmluZGV4IGRkZDgzNjQxMDJhMi4uZjk1MDkyNzQxYzM4
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzY292ZXJ5
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc2NvdmVyeS5jCkBA
IC0xMzQsMjAgKzEzNCwxMCBAQCBzdGF0aWMgaW50IGh3X2lkX21hcFtNQVhfSFdJUF0gPSB7CiAK
IHN0YXRpYyBpbnQgYW1kZ3B1X2Rpc2NvdmVyeV9yZWFkX2JpbmFyeShzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwgdWludDhfdCAqYmluYXJ5KQogewotCXVpbnQzMl90ICpwID0gKHVpbnQzMl90
ICopYmluYXJ5OwogCXVpbnQ2NF90IHZyYW1fc2l6ZSA9ICh1aW50NjRfdClSUkVHMzIobW1SQ0Nf
Q09ORklHX01FTVNJWkUpIDw8IDIwOwogCXVpbnQ2NF90IHBvcyA9IHZyYW1fc2l6ZSAtIERJU0NP
VkVSWV9UTVJfU0laRTsKLQl1bnNpZ25lZCBsb25nIGZsYWdzOwotCi0Jd2hpbGUgKHBvcyA8IHZy
YW1fc2l6ZSkgewotCQlzcGluX2xvY2tfaXJxc2F2ZSgmYWRldi0+bW1pb19pZHhfbG9jaywgZmxh
Z3MpOwotCQlXUkVHMzJfTk9fS0lRKG1tTU1fSU5ERVgsICgodWludDMyX3QpcG9zKSB8IDB4ODAw
MDAwMDApOwotCQlXUkVHMzJfTk9fS0lRKG1tTU1fSU5ERVhfSEksIHBvcyA+PiAzMSk7Ci0JCSpw
KysgPSBSUkVHMzJfTk9fS0lRKG1tTU1fREFUQSk7Ci0JCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUo
JmFkZXYtPm1taW9faWR4X2xvY2ssIGZsYWdzKTsKLQkJcG9zICs9IDQ7Ci0JfQogCisJYW1kZ3B1
X2RldmljZV92cmFtX2FjY2VzcyhhZGV2LCBwb3MsICh1aW50MzJfdCAqKWJpbmFyeSwgRElTQ09W
RVJZX1RNUl9TSVpFLCBmYWxzZSk7CiAJcmV0dXJuIDA7CiB9CiAKLS0gCjIuMTcuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
