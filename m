Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7437EB04
	for <lists+amd-gfx@lfdr.de>; Fri,  2 Aug 2019 06:13:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A686E894;
	Fri,  2 Aug 2019 04:13:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760052.outbound.protection.outlook.com [40.107.76.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148106E894
 for <amd-gfx@lists.freedesktop.org>; Fri,  2 Aug 2019 04:13:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SFTvGR1RkZrhu93fycFRn4z6xmbeIrkyjwjSZsoounh+FgNZPl0yJvoSIcqM53hrNJeQSG0tswpVk42anjnBjrpxlBbPVlTL/cJhNTl/LwHLgTRwfSujLpePelE3a4aVeX8H3k8eDOFDPCP04s6qQUS5K7zBSfVNQhrUtj8pz/scmILxCUBGU57KYMkW0H8TnkLvufnXr6C9O5hT642OwXupHjCbJI535LdxETD4e+noQLYgxkVAKag7SkC9ycIUXHUUtERQvBjcopiIeogBDkli7nrifgDfJ73vmSr8/AQ/1MhoZS13Mw8fEQJiln/bO3SBpltb6iSF2cRLD6ssgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJISYiA7/dJnxlLiD93gYezUDz+c5z03SrKORlS2CxE=;
 b=kOfLrIU/MyfT3tQE7QFRd3RSuYQ21nsSBGScsWtU/hNN1idaIKq43AR9f0GZXE/kwwlpJUrLzCH8E32JNDfMKijtgQxbbxjBLaBAJ+tLad5RxeF2ECKWQDAIZttJDbcb6/uUhjgmTPbgUoUmIuXZIxZE2CTyvY0PpvJ/P8mGny6a1pE+fCVvdnf26QEyFGyGOdlU4f79o+i7eK2ObrO2w7JdTSzl+ACnGoXOEkxlZrSljPAR5Nlc6+B3Azz9MsiGrsG+HROepwlowF5Q3vFh4M7j6WUmoo5e8u/qKMVPP2Z4AjZOvsJvliXm0XgRKf7+9s6cGTL1hvBBE4k5/jIMAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB4224.namprd12.prod.outlook.com (52.135.51.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.12; Fri, 2 Aug 2019 04:13:39 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::b821:71b7:13f7:1a3c]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::b821:71b7:13f7:1a3c%7]) with mapi id 15.20.2136.010; Fri, 2 Aug 2019
 04:13:39 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: dl.srdc_lnx_nv10 <dl.srdc_lnx_nv10@amd.com>
Subject: [PATCH] drm/amd/powerplay: honor hw limit on fetching metrics data
 for navi10
Thread-Topic: [PATCH] drm/amd/powerplay: honor hw limit on fetching metrics
 data for navi10
Thread-Index: AQHVSOip04KistZAF0mzSAX+5aGP6A==
Date: Fri, 2 Aug 2019 04:13:38 +0000
Message-ID: <20190802041326.23404-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR04CA0002.apcprd04.prod.outlook.com
 (2603:1096:203:36::14) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.22.0
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b9a2966e-67f1-46fb-0777-08d716ffcbc2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4224; 
x-ms-traffictypediagnostic: MN2PR12MB4224:
x-microsoft-antispam-prvs: <MN2PR12MB42247E8CD953F1D0D4CC736BA2D90@MN2PR12MB4224.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:510;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(39860400002)(136003)(366004)(376002)(199004)(189003)(5660300002)(81156014)(81166006)(305945005)(1076003)(7736002)(8936002)(71200400001)(71190400001)(86362001)(8676002)(66556008)(66476007)(64756008)(66946007)(66446008)(102836004)(50226002)(66066001)(68736007)(53936002)(99286004)(26005)(36756003)(386003)(6506007)(52116002)(6116002)(6862004)(14444005)(54906003)(256004)(186003)(14454004)(6636002)(316002)(37006003)(6486002)(4326008)(6512007)(3846002)(478600001)(25786009)(476003)(2906002)(486006)(6436002)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4224;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 293wARyRS6dAHizxOudyC7qYGOk78h5j4eOZY998KkX76hGGX1LiUgVdvprgidnnl5FUmOfkfDZcCQMshaGMlBRo9pNBgZlx2caiwWQMRaFKqlN2BiF8OJyD5ZGDk2s0eRkpaLA0EUQLXlaHHNK33IRImBaA1v7A/CjhVDJ7wunCrRr974MgJltbGub8bJOQMVkHwCXHNgULnPToevQN5q0wYtFdvCdu05GRr7ex7cAxLMsu2iOaJPswe2CRV4n3QV/G/BKhVukb7Oi+DsU/bbLEfNjYRLlKL/i3i8Nxv9R5eBbRoc2iUjPfngH/IM318i33546CVvtZnI+xFYE2AC+SRfpGQLt0h53GgL/FFAkxCBJ9hwppx801XwoZAgU6TnAw3R/6FayGJZX0PaJfRX643JY0CwDwnkXr1cL1mWY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9a2966e-67f1-46fb-0777-08d716ffcbc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 04:13:38.9495 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4224
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJISYiA7/dJnxlLiD93gYezUDz+c5z03SrKORlS2CxE=;
 b=jTXmUMEo+R8ezUvlSx3zLy9GqP64Iem42zzomZuIVwqqUmUzu+DxalzOBQ6bdNGfW9Rqdmb7QHdkDjayawrAwQQqaMQqBYlolIq5542rNdyQ7WnAlAe6jR7Cyz7IuEFqOrzX+ZBX2X3oXJxhig/zCAThXNpVJh2b1rk9Ju7Nn0o=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Cc: "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>, "Quan,
 Evan" <Evan.Quan@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

dG9vIGZyZXF1ZW50bHkgdG8gdXBkYXRlIG1lcnRyaWNzIHRhYmxlIHdpbGwgY2F1c2Ugc211IGlu
dGVybmFsIGVycm9yLgoKU2lnbmVkLW9mZi1ieTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgfCA1
NiArKysrKysrKysrKysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygr
KSwgMTggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvbmF2aTEwX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEw
X3BwdC5jCmluZGV4IGYzYWRiNzEzNzg0YS4uY2YyZTI2NDA5NWE3IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCkBAIC01MTUsNiArNTE1LDggQEAgc3RhdGlj
IGludCBuYXZpMTBfc3RvcmVfcG93ZXJwbGF5X3RhYmxlKHN0cnVjdCBzbXVfY29udGV4dCAqc211
KQogCiBzdGF0aWMgaW50IG5hdmkxMF90YWJsZXNfaW5pdChzdHJ1Y3Qgc211X2NvbnRleHQgKnNt
dSwgc3RydWN0IHNtdV90YWJsZSAqdGFibGVzKQogeworCXN0cnVjdCBzbXVfdGFibGVfY29udGV4
dCAqc211X3RhYmxlID0gJnNtdS0+c211X3RhYmxlOworCiAJU01VX1RBQkxFX0lOSVQodGFibGVz
LCBTTVVfVEFCTEVfUFBUQUJMRSwgc2l6ZW9mKFBQVGFibGVfdCksCiAJCSAgICAgICBQQUdFX1NJ
WkUsIEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0pOwogCVNNVV9UQUJMRV9JTklUKHRhYmxlcywgU01V
X1RBQkxFX1dBVEVSTUFSS1MsIHNpemVvZihXYXRlcm1hcmtzX3QpLApAQCAtNTI5LDkgKzUzMSwz
NSBAQCBzdGF0aWMgaW50IG5hdmkxMF90YWJsZXNfaW5pdChzdHJ1Y3Qgc211X2NvbnRleHQgKnNt
dSwgc3RydWN0IHNtdV90YWJsZSAqdGFibGVzKQogCQkgICAgICAgc2l6ZW9mKERwbUFjdGl2aXR5
TW9uaXRvckNvZWZmSW50X3QpLCBQQUdFX1NJWkUsCiAJICAgICAgICAgICAgICAgQU1ER1BVX0dF
TV9ET01BSU5fVlJBTSk7CiAKKwlzbXVfdGFibGUtPm1ldHJpY3NfdGFibGUgPSBremFsbG9jKHNp
emVvZihTbXVNZXRyaWNzX3QpLCBHRlBfS0VSTkVMKTsKKwlpZiAoIXNtdV90YWJsZS0+bWV0cmlj
c190YWJsZSkKKwkJcmV0dXJuIC1FTk9NRU07CisJc211X3RhYmxlLT5tZXRyaWNzX3RpbWUgPSAw
OworCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBpbnQgbmF2aTEwX2dldF9tZXRyaWNzX3RhYmxl
KHN0cnVjdCBzbXVfY29udGV4dCAqc211LAorCQkJCSAgICBTbXVNZXRyaWNzX3QgKm1ldHJpY3Nf
dGFibGUpCit7CisJc3RydWN0IHNtdV90YWJsZV9jb250ZXh0ICpzbXVfdGFibGU9ICZzbXUtPnNt
dV90YWJsZTsKKwlpbnQgcmV0ID0gMDsKKworCWlmICghc211X3RhYmxlLT5tZXRyaWNzX3RpbWUg
fHwgdGltZV9hZnRlcihqaWZmaWVzLCBzbXVfdGFibGUtPm1ldHJpY3NfdGltZSArIEhaIC8gMTAw
MCkpIHsKKwkJcmV0ID0gc211X3VwZGF0ZV90YWJsZShzbXUsIFNNVV9UQUJMRV9TTVVfTUVUUklD
UywgMCwKKwkJCQkodm9pZCAqKXNtdV90YWJsZS0+bWV0cmljc190YWJsZSwgZmFsc2UpOworCQlp
ZiAocmV0KSB7CisJCQlwcl9pbmZvKCJGYWlsZWQgdG8gZXhwb3J0IFNNVSBtZXRyaWNzIHRhYmxl
IVxuIik7CisJCQlyZXR1cm4gcmV0OworCQl9CisJCXNtdV90YWJsZS0+bWV0cmljc190aW1lID0g
amlmZmllczsKKwl9CisKKwltZW1jcHkobWV0cmljc190YWJsZSwgc211X3RhYmxlLT5tZXRyaWNz
X3RhYmxlLCBzaXplb2YoU211TWV0cmljc190KSk7CisKKwlyZXR1cm4gcmV0OworfQorCiBzdGF0
aWMgaW50IG5hdmkxMF9hbGxvY2F0ZV9kcG1fY29udGV4dChzdHJ1Y3Qgc211X2NvbnRleHQgKnNt
dSkKIHsKIAlzdHJ1Y3Qgc211X2RwbV9jb250ZXh0ICpzbXVfZHBtID0gJnNtdS0+c211X2RwbTsK
QEAgLTYxMSwxNSArNjM5LDEwIEBAIHN0YXRpYyBpbnQgbmF2aTEwX2dldF9jdXJyZW50X2Nsa19m
cmVxX2J5X3RhYmxlKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAogCQkJCSAgICAgICBlbnVtIHNt
dV9jbGtfdHlwZSBjbGtfdHlwZSwKIAkJCQkgICAgICAgdWludDMyX3QgKnZhbHVlKQogewotCXN0
YXRpYyBTbXVNZXRyaWNzX3QgbWV0cmljczsKIAlpbnQgcmV0ID0gMCwgY2xrX2lkID0gMDsKKwlT
bXVNZXRyaWNzX3QgbWV0cmljczsKIAotCWlmICghdmFsdWUpCi0JCXJldHVybiAtRUlOVkFMOwot
Ci0JbWVtc2V0KCZtZXRyaWNzLCAwLCBzaXplb2YobWV0cmljcykpOwotCi0JcmV0ID0gc211X3Vw
ZGF0ZV90YWJsZShzbXUsIFNNVV9UQUJMRV9TTVVfTUVUUklDUywgMCwgKHZvaWQgKikmbWV0cmlj
cywgZmFsc2UpOworCXJldCA9IG5hdmkxMF9nZXRfbWV0cmljc190YWJsZShzbXUsICZtZXRyaWNz
KTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCkBAIC05MDcsOCArOTMwLDkgQEAgc3RhdGlj
IGludCBuYXZpMTBfZ2V0X2dwdV9wb3dlcihzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgdWludDMy
X3QgKnZhbHVlKQogCWlmICghdmFsdWUpCiAJCXJldHVybiAtRUlOVkFMOwogCi0JcmV0ID0gc211
X3VwZGF0ZV90YWJsZShzbXUsIFNNVV9UQUJMRV9TTVVfTUVUUklDUywgMCwgKHZvaWQgKikmbWV0
cmljcywKLQkJCSAgICAgICBmYWxzZSk7CisJcmV0ID0gbmF2aTEwX2dldF9tZXRyaWNzX3RhYmxl
KHNtdSwgJm1ldHJpY3MpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CiAJaWYgKHJldCkKIAkJ
cmV0dXJuIHJldDsKIApAQCAtOTI3LDEwICs5NTEsNyBAQCBzdGF0aWMgaW50IG5hdmkxMF9nZXRf
Y3VycmVudF9hY3Rpdml0eV9wZXJjZW50KHN0cnVjdCBzbXVfY29udGV4dCAqc211LAogCWlmICgh
dmFsdWUpCiAJCXJldHVybiAtRUlOVkFMOwogCi0JbXNsZWVwKDEpOwotCi0JcmV0ID0gc211X3Vw
ZGF0ZV90YWJsZShzbXUsIFNNVV9UQUJMRV9TTVVfTUVUUklDUywgMCwKLQkJCSAgICAgICAodm9p
ZCAqKSZtZXRyaWNzLCBmYWxzZSk7CisJcmV0ID0gbmF2aTEwX2dldF9tZXRyaWNzX3RhYmxlKHNt
dSwgJm1ldHJpY3MpOwogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKQEAgLTk2OSwxMCArOTkw
LDkgQEAgc3RhdGljIGludCBuYXZpMTBfZ2V0X2Zhbl9zcGVlZF9ycG0oc3RydWN0IHNtdV9jb250
ZXh0ICpzbXUsCiAJaWYgKCFzcGVlZCkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKLQltZW1zZXQoJm1l
dHJpY3MsIDAsIHNpemVvZihtZXRyaWNzKSk7Ci0KLQlyZXQgPSBzbXVfdXBkYXRlX3RhYmxlKHNt
dSwgU01VX1RBQkxFX1NNVV9NRVRSSUNTLCAwLAotCQkJICAgICAgICh2b2lkICopJm1ldHJpY3Ms
IGZhbHNlKTsKKwlyZXQgPSBuYXZpMTBfZ2V0X21ldHJpY3NfdGFibGUoc211LCAmbWV0cmljcyk7
CisJaWYgKHJldCkKKwkJcmV0dXJuIHJldDsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCkBA
IC0xMzI1LDcgKzEzNDUsNyBAQCBzdGF0aWMgaW50IG5hdmkxMF90aGVybWFsX2dldF90ZW1wZXJh
dHVyZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIAlpZiAoIXZhbHVlKQogCQlyZXR1cm4gLUVJ
TlZBTDsKIAotCXJldCA9IHNtdV91cGRhdGVfdGFibGUoc211LCBTTVVfVEFCTEVfU01VX01FVFJJ
Q1MsIDAsICh2b2lkICopJm1ldHJpY3MsIGZhbHNlKTsKKwlyZXQgPSBuYXZpMTBfZ2V0X21ldHJp
Y3NfdGFibGUoc211LCAmbWV0cmljcyk7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAotLSAK
Mi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
