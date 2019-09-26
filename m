Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5797BEAFB
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 05:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF8C36EC78;
	Thu, 26 Sep 2019 03:50:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750080.outbound.protection.outlook.com [40.107.75.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335C76EC78
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 03:50:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DkXohNjU1h15P7hIB1On384FTH+vZ9ZRL/pNrL+FC1Mdb5fTYEgRIdi09LpbRRxmFHxpLGaw2oD6GubgrjK9G6XszBZqwtTp8lt41cNSL5r4WRnymb9Ss1tWyu5XgbVE+HwxVypqJUwoSOx2zSunvS8w0txKAy/Q6gSuuLJkL8q/JSS5UlT6VSyI+vX1n0NvzNCmNqgv0Uuj7ycf8xKz6Nzna0AW8BP7cSVvuika1rOmIMD75Hs7s7SPcclP0aAGFatK11szRMcgjgx/DaOvnP0jV7p6saOClRE7x7Utw8mjb2FLq074bC+t0G3O4Vf5Tg8itr3TzTT3wX+cISCncQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aluJqJC+l2pnAcsy6V8E26/HHfK0pW1c8tdCLbRyWoU=;
 b=OcnOZXgZIE3LHYLfLiPBo8eIQMZtM59G9Uce9JCLmb2hayUzcMrVxmspLhf591GVMo2mACR+vjRnvG184MrOQRdvCegkbfeEC64H3M+bwfHLDL3/nVBpQ+FhNIz/YDCXwc0U1x0YvWhQJ1W4xgMri3gE5yyk0lJKD6xMHK7XxdqdVT9rlxaXEyq2LsXskYA9wJBXspOvjDjjmi2gnPvmpdv6NgNq/MebTy8G6gZ9iZ0w0oVcljR4GtkiS7/Cz5nv64m1g/ihYMhGoW/wACqtAPEtl8UFX5IRVo3YzxWII03tmp6cQyKNiZsbgvA2k5gh4LnXmtAvPeeth42YkC0iAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3536.namprd12.prod.outlook.com (20.179.83.19) by
 MN2PR12MB3469.namprd12.prod.outlook.com (20.178.242.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.23; Thu, 26 Sep 2019 03:50:01 +0000
Received: from MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41]) by MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41%7]) with mapi id 15.20.2305.017; Thu, 26 Sep 2019
 03:50:01 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/8] drm/amd/powerplay: bypass dpm_context null pointer check
 guard for some smu series
Thread-Topic: [PATCH 1/8] drm/amd/powerplay: bypass dpm_context null pointer
 check guard for some smu series
Thread-Index: AQHVdB15isSZ3/dIYUW43+FascG2RQ==
Date: Thu, 26 Sep 2019 03:50:01 +0000
Message-ID: <1569469774-16813-1-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR03CA0048.apcprd03.prod.outlook.com
 (2603:1096:202:17::18) To MN2PR12MB3536.namprd12.prod.outlook.com
 (2603:10b6:208:104::19)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a138a95-e612-4e4a-93c8-08d742349b8f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3469; 
x-ms-traffictypediagnostic: MN2PR12MB3469:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB34690650BB3E21BAA24450A3FB860@MN2PR12MB3469.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(199004)(189003)(316002)(256004)(2351001)(14444005)(476003)(7736002)(386003)(66556008)(64756008)(66946007)(305945005)(66476007)(478600001)(6486002)(86362001)(5640700003)(2906002)(6436002)(52116002)(5660300002)(8936002)(26005)(54906003)(81156014)(50226002)(486006)(8676002)(81166006)(66446008)(6506007)(102836004)(66066001)(71200400001)(6916009)(71190400001)(99286004)(3846002)(2616005)(4326008)(2501003)(6116002)(186003)(36756003)(14454004)(6512007)(25786009)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3469;
 H:MN2PR12MB3536.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sGAFXHyFxz9tVYaRgS9Zk8T7SKvnP2cgucjjnPxr8vTOmKfNiU0g6+zhL33Hr8rX67CHnbQj8bdbyvnSEhu0xd85inBHR9dyl90d/mGUyaTsUg+c1oiU94G6bmwFdaSveQ05AtZttLOGu3Qq1su8fPtiwXo1/D5GN7iE5kkK4xnwW6ScoUki7YNpWm2RFsuTt3qG6RdILZ2jJhn4DancOkssqLezOeekGdHGTXNqylUKsV2fhQvCADe1pIGelM8fp48dKaoFUVgpn615g9xOjKTMxTAMn83TZYrpoPm2iASW+89P61Gr4Tz67RZzSg1apD3y0YPjlSzV6EzDti+/z/BToNvyfElb2HOB+2zjgeskUGb/7zg2u3jFWEi9079RKrd9RLHp3ah9LUrFPfx4dn3L9/H7KR3sDwg6XOUAiRg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a138a95-e612-4e4a-93c8-08d742349b8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 03:50:01.4333 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LDIXV90R8ViT1RQs7NyOHdPwnvrcolALSYcrTUdD/H5acSIx9yBaDUea6ul6wBRx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3469
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aluJqJC+l2pnAcsy6V8E26/HHfK0pW1c8tdCLbRyWoU=;
 b=0TOBOY7sr1yu1cshc0HmcU049VydJQXEuCmqM+XTdrvYqt//7Z2B5fAiPxCY5q9VMjSFpxSnEPHyAChpFUxDspVFdO+n4JMafyMjjXPuIWBNVB15GoePoab9hQ6A+QOQR9XkPwlwOoDQ75z2ZLGIt6vPFTz9MU7G6Nj6kxA7bOE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Prike.Liang@amd.com; 
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
Cc: "Liang, Prike" <Prike.Liang@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>, "keneth.feng@amd.com" <keneth.feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rm9yIG5vdyBBUFUgaGFzIG5vIHNtdV9kcG1fY29udGV4dCBzdHJ1Y3R1cmUgZm9yIGNvbnRhaW5p
bmcgZGVmYXVsdC9jdXJyZW50IHJlbGF0ZWQgZHBtIHRhYmxlcywKdGh1cyB3aWxsIG5lZWRuJ3Qg
aW5pdGlhbGl6ZSBzbXVfZHBtX2NvbnRleHQgdG8gYXZpb2QgQVBVIG51bGwgcG9pbnRlciBpc3N1
ZS4KClNpZ25lZC1vZmYtYnk6IFByaWtlIExpYW5nIDxQcmlrZS5MaWFuZ0BhbWQuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyAgICAgfCA3ICsrKyst
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmggfCAxICsK
IGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Jlbm9pcl9wcHQuYyAgICAgfCAxICsKIDMg
ZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwppbmRleCAyMzI5M2UxLi5hZTRhODJl
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCkBAIC0xNTU3
LDcgKzE1NTcsOCBAQCBzdGF0aWMgaW50IHNtdV9lbmFibGVfdW1kX3BzdGF0ZSh2b2lkICpoYW5k
bGUsCiAKIAlzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSA9IChzdHJ1Y3Qgc211X2NvbnRleHQqKSho
YW5kbGUpOwogCXN0cnVjdCBzbXVfZHBtX2NvbnRleHQgKnNtdV9kcG1fY3R4ID0gJihzbXUtPnNt
dV9kcG0pOwotCWlmICghc211LT5wbV9lbmFibGVkIHx8ICFzbXVfZHBtX2N0eC0+ZHBtX2NvbnRl
eHQpCisKKwlpZiAoIXNtdS0+aXNfYXB1ICYmICghc211LT5wbV9lbmFibGVkIHx8ICFzbXVfZHBt
X2N0eC0+ZHBtX2NvbnRleHQpKQogCQlyZXR1cm4gLUVJTlZBTDsKIAogCWlmICghKHNtdV9kcG1f
Y3R4LT5kcG1fbGV2ZWwgJiBwcm9maWxlX21vZGVfbWFzaykpIHsKQEAgLTE3NTUsNyArMTc1Niw3
IEBAIGVudW0gYW1kX2RwbV9mb3JjZWRfbGV2ZWwgc211X2dldF9wZXJmb3JtYW5jZV9sZXZlbChz
dHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKIAlzdHJ1Y3Qgc211X2RwbV9jb250ZXh0ICpzbXVfZHBt
X2N0eCA9ICYoc211LT5zbXVfZHBtKTsKIAllbnVtIGFtZF9kcG1fZm9yY2VkX2xldmVsIGxldmVs
OwogCi0JaWYgKCFzbXVfZHBtX2N0eC0+ZHBtX2NvbnRleHQpCisJaWYgKCFzbXUtPmlzX2FwdSAm
JiAhc211X2RwbV9jdHgtPmRwbV9jb250ZXh0KQogCQlyZXR1cm4gLUVJTlZBTDsKIAogCW11dGV4
X2xvY2soJihzbXUtPm11dGV4KSk7CkBAIC0xNzcwLDcgKzE3NzEsNyBAQCBpbnQgc211X2ZvcmNl
X3BlcmZvcm1hbmNlX2xldmVsKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBlbnVtIGFtZF9kcG1f
Zm9yY2VkX2xldgogCXN0cnVjdCBzbXVfZHBtX2NvbnRleHQgKnNtdV9kcG1fY3R4ID0gJihzbXUt
PnNtdV9kcG0pOwogCWludCByZXQgPSAwOwogCi0JaWYgKCFzbXVfZHBtX2N0eC0+ZHBtX2NvbnRl
eHQpCisJaWYgKCFzbXUtPmlzX2FwdSAmJiAhc211X2RwbV9jdHgtPmRwbV9jb250ZXh0KQogCQly
ZXR1cm4gLUVJTlZBTDsKIAogCXJldCA9IHNtdV9lbmFibGVfdW1kX3BzdGF0ZShzbXUsICZsZXZl
bCk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1
X3NtdS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaApp
bmRleCA1Yzg5ODQ0Li5iZDFlNjIxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L2luYy9hbWRncHVfc211LmgKQEAgLTM4Nyw2ICszODcsNyBAQCBzdHJ1Y3Qgc211X2NvbnRl
eHQKIAl1aW50MzJfdCBwb3dlcl9wcm9maWxlX21vZGU7CiAJdWludDMyX3QgZGVmYXVsdF9wb3dl
cl9wcm9maWxlX21vZGU7CiAJYm9vbCBwbV9lbmFibGVkOworCWJvb2wgaXNfYXB1OwogCiAJdWlu
dDMyX3Qgc21jX2lmX3ZlcnNpb247CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L3Jlbm9pcl9wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Jl
bm9pcl9wcHQuYwppbmRleCA5MzExYjZhLi5hNGU0NGQzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvcmVub2lyX3BwdC5jCkBAIC0xNDEsNiArMTQxLDcgQEAgc3RhdGljIGludCBy
ZW5vaXJfZ2V0X3NtdV90YWJsZV9pbmRleChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtYywgdWludDMy
X3QgaW5kZXgpCiBzdGF0aWMgaW50IHJlbm9pcl90YWJsZXNfaW5pdChzdHJ1Y3Qgc211X2NvbnRl
eHQgKnNtdSwgc3RydWN0IHNtdV90YWJsZSAqdGFibGVzKQogewogCXN0cnVjdCBzbXVfdGFibGVf
Y29udGV4dCAqc211X3RhYmxlID0gJnNtdS0+c211X3RhYmxlOworCXNtdS0+aXNfYXB1ID0gdHJ1
ZTsKIAogCVNNVV9UQUJMRV9JTklUKHRhYmxlcywgU01VX1RBQkxFX1dBVEVSTUFSS1MsIHNpemVv
ZihXYXRlcm1hcmtzX3QpLAogCQlQQUdFX1NJWkUsIEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0pOwot
LSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
