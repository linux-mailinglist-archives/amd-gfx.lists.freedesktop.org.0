Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FCA3D308
	for <lists+amd-gfx@lfdr.de>; Tue, 11 Jun 2019 18:54:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D5389157;
	Tue, 11 Jun 2019 16:54:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780047.outbound.protection.outlook.com [40.107.78.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B3D89157
 for <amd-gfx@lists.freedesktop.org>; Tue, 11 Jun 2019 16:54:54 +0000 (UTC)
Received: from MWHPR12MB1311.namprd12.prod.outlook.com (10.169.206.148) by
 MWHPR12MB1246.namprd12.prod.outlook.com (10.169.204.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.10; Tue, 11 Jun 2019 16:54:53 +0000
Received: from MWHPR12MB1311.namprd12.prod.outlook.com
 ([fe80::d9ab:90d0:c292:60a8]) by MWHPR12MB1311.namprd12.prod.outlook.com
 ([fe80::d9ab:90d0:c292:60a8%8]) with mapi id 15.20.1987.010; Tue, 11 Jun 2019
 16:54:53 +0000
From: "StDenis, Tom" <Tom.StDenis@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/amdgpu: Bail out of BO node creation if not enough
 VRAM (v2)
Thread-Topic: [PATCH] drm/amd/amdgpu: Bail out of BO node creation if not
 enough VRAM (v2)
Thread-Index: AQHVIHZjQzUW3pGZP0Ci9JSqJPoAVA==
Date: Tue, 11 Jun 2019 16:54:52 +0000
Message-ID: <20190611165444.17841-1-tom.stdenis@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN4PR13CA0005.namprd13.prod.outlook.com
 (2603:10b6:403:3::15) To MWHPR12MB1311.namprd12.prod.outlook.com
 (2603:10b6:300:13::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.21.0
x-originating-ip: [165.204.84.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3b197ab3-349c-4bd6-64a0-08d6ee8d85f9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1246; 
x-ms-traffictypediagnostic: MWHPR12MB1246:
x-microsoft-antispam-prvs: <MWHPR12MB12465FA17B61244E062EEF1FF7ED0@MWHPR12MB1246.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(39860400002)(396003)(136003)(346002)(376002)(199004)(189003)(486006)(71190400001)(66556008)(66476007)(2501003)(71200400001)(476003)(316002)(1076003)(2616005)(72206003)(2351001)(5660300002)(86362001)(478600001)(14454004)(256004)(14444005)(50226002)(102836004)(2906002)(186003)(6916009)(26005)(7736002)(53936002)(66066001)(81166006)(8936002)(81156014)(6116002)(68736007)(99286004)(3846002)(8676002)(64756008)(66446008)(4326008)(25786009)(52116002)(36756003)(6512007)(305945005)(6506007)(5640700003)(66946007)(386003)(6486002)(6436002)(73956011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1246;
 H:MWHPR12MB1311.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /XNs/564HlNx11FsB1m2p1pPkanPnsQIPEkkso0ughF8n1IOXNoQnhBqBBXlIPLS4LSUO0JmyDdkO8BFtl60kzJtgyH7UBRXyivbm015X6mogQFTFQ1lM1//YtRQSpdQeOhRwDqG0mZIXpspZ+nHK4IlBwi+iWlNAQkLZQxgBJrzXvQLbEd5Si6Fcg2QNLvud2hsugm+9rT5FvfGnvipEzBSQbbI7GnXLOb6MlFPUL12GcbT3ocPUQqnETiSurhf7fhVyrwH/pKmxAKcnBtPOIEPI6Kj/SmxZWuOZHxxY3xR2t/omv0EpKcLLfy2UtpLOI4iE3tRGF79WZyZfXME+j0w+jynh+WoVoUzNaoj2VkURWlWZAfgxrIX+rSakjnH5N2x2FvDlAa/KEOx8VsLObTMxzoHCAP7+cS+cNzR9k4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b197ab3-349c-4bd6-64a0-08d6ee8d85f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 16:54:52.8700 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tstdenis@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1246
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oGO6GFEjdO25xWPCQ9ECqtQBehK1kkx3peaaEbPPfM=;
 b=0CdAcALM8oGuDMZo1DQx8FDhkdO/B2LWODZXrALHnQYfuFx6yt4nQls0WA5hAprP+WBv1bGhuLs1MZDtegqS6sYsxKXhp94QiQIm0PFsuXwfbDyDhumRrl45tj6rPXpeyceSTrFiLGoX3oP4Y3GEoxhd+kBopdC0V9DLlZf9RR0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tom.StDenis@amd.com; 
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
Cc: "StDenis, Tom" <Tom.StDenis@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

KHYyKTogUmV0dXJuIDAgYW5kIHNldCBtZW0tPm1tX25vZGUgdG8gTlVMTC4NCg0KU2lnbmVkLW9m
Zi1ieTogVG9tIFN0IERlbmlzIDx0b20uc3RkZW5pc0BhbWQuY29tPg0KLS0tDQogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMgfCAxOCArKysrKysrKysrKysrLS0t
LS0NCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCg0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMNCmluZGV4IDhh
ZWEyZjIxYjIwMi4uYzI3MzBlNWMxMDgxIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV92cmFtX21nci5jDQpAQCAtMjc2LDcgKzI3Niw3IEBAIHN0YXRpYyBpbnQgYW1k
Z3B1X3ZyYW1fbWdyX25ldyhzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiwNCiAJc3Ry
dWN0IGRybV9tbV9ub2RlICpub2RlczsNCiAJZW51bSBkcm1fbW1faW5zZXJ0X21vZGUgbW9kZTsN
CiAJdW5zaWduZWQgbG9uZyBscGZuLCBudW1fbm9kZXMsIHBhZ2VzX3Blcl9ub2RlLCBwYWdlc19s
ZWZ0Ow0KLQl1aW50NjRfdCB1c2FnZSA9IDAsIHZpc191c2FnZSA9IDA7DQorCXVpbnQ2NF90IHZp
c191c2FnZSA9IDA7DQogCXVuc2lnbmVkIGk7DQogCWludCByOw0KIA0KQEAgLTI4NCw2ICsyODQs
MTQgQEAgc3RhdGljIGludCBhbWRncHVfdnJhbV9tZ3JfbmV3KHN0cnVjdCB0dG1fbWVtX3R5cGVf
bWFuYWdlciAqbWFuLA0KIAlpZiAoIWxwZm4pDQogCQlscGZuID0gbWFuLT5zaXplOw0KIA0KKwkv
KiBiYWlsIG91dCBxdWlja2x5IGlmIHRoZXJlJ3MgbGlrZWx5IG5vdCBlbm91Z2ggVlJBTSBmb3Ig
dGhpcyBCTyAqLw0KKwlhdG9taWM2NF9hZGQobWVtLT5udW1fcGFnZXMgPDwgUEFHRV9TSElGVCwg
Jm1nci0+dXNhZ2UpOw0KKwlpZiAoYXRvbWljNjRfcmVhZCgmbWdyLT51c2FnZSkgPiBhZGV2LT5n
bWMubWNfdnJhbV9zaXplKSB7DQorCQlhdG9taWM2NF9zdWIobWVtLT5udW1fcGFnZXMgPDwgUEFH
RV9TSElGVCwgJm1nci0+dXNhZ2UpOw0KKwkJbWVtLT5tbV9ub2RlID0gTlVMTDsNCisJCXJldHVy
biAwOw0KKwl9DQorDQogCWlmIChwbGFjZS0+ZmxhZ3MgJiBUVE1fUExfRkxBR19DT05USUdVT1VT
KSB7DQogCQlwYWdlc19wZXJfbm9kZSA9IH4wdWw7DQogCQludW1fbm9kZXMgPSAxOw0KQEAgLTMw
MCw4ICszMDgsMTAgQEAgc3RhdGljIGludCBhbWRncHVfdnJhbV9tZ3JfbmV3KHN0cnVjdCB0dG1f
bWVtX3R5cGVfbWFuYWdlciAqbWFuLA0KIA0KIAlub2RlcyA9IGt2bWFsbG9jX2FycmF5KCh1aW50
MzJfdCludW1fbm9kZXMsIHNpemVvZigqbm9kZXMpLA0KIAkJCSAgICAgICBHRlBfS0VSTkVMIHwg
X19HRlBfWkVSTyk7DQotCWlmICghbm9kZXMpDQorCWlmICghbm9kZXMpIHsNCisJCWF0b21pYzY0
X3N1YihtZW0tPm51bV9wYWdlcyA8PCBQQUdFX1NISUZULCAmbWdyLT51c2FnZSk7DQogCQlyZXR1
cm4gLUVOT01FTTsNCisJfQ0KIA0KIAltb2RlID0gRFJNX01NX0lOU0VSVF9CRVNUOw0KIAlpZiAo
cGxhY2UtPmZsYWdzICYgVFRNX1BMX0ZMQUdfVE9QRE9XTikNCkBAIC0zMjEsNyArMzMxLDYgQEAg
c3RhdGljIGludCBhbWRncHVfdnJhbV9tZ3JfbmV3KHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdl
ciAqbWFuLA0KIAkJaWYgKHVubGlrZWx5KHIpKQ0KIAkJCWJyZWFrOw0KIA0KLQkJdXNhZ2UgKz0g
bm9kZXNbaV0uc2l6ZSA8PCBQQUdFX1NISUZUOw0KIAkJdmlzX3VzYWdlICs9IGFtZGdwdV92cmFt
X21ncl92aXNfc2l6ZShhZGV2LCAmbm9kZXNbaV0pOw0KIAkJYW1kZ3B1X3ZyYW1fbWdyX3ZpcnRf
c3RhcnQobWVtLCAmbm9kZXNbaV0pOw0KIAkJcGFnZXNfbGVmdCAtPSBwYWdlczsNCkBAIC0zNDEs
MTQgKzM1MCwxMiBAQCBzdGF0aWMgaW50IGFtZGdwdV92cmFtX21ncl9uZXcoc3RydWN0IHR0bV9t
ZW1fdHlwZV9tYW5hZ2VyICptYW4sDQogCQlpZiAodW5saWtlbHkocikpDQogCQkJZ290byBlcnJv
cjsNCiANCi0JCXVzYWdlICs9IG5vZGVzW2ldLnNpemUgPDwgUEFHRV9TSElGVDsNCiAJCXZpc191
c2FnZSArPSBhbWRncHVfdnJhbV9tZ3JfdmlzX3NpemUoYWRldiwgJm5vZGVzW2ldKTsNCiAJCWFt
ZGdwdV92cmFtX21ncl92aXJ0X3N0YXJ0KG1lbSwgJm5vZGVzW2ldKTsNCiAJCXBhZ2VzX2xlZnQg
LT0gcGFnZXM7DQogCX0NCiAJc3Bpbl91bmxvY2soJm1nci0+bG9jayk7DQogDQotCWF0b21pYzY0
X2FkZCh1c2FnZSwgJm1nci0+dXNhZ2UpOw0KIAlhdG9taWM2NF9hZGQodmlzX3VzYWdlLCAmbWdy
LT52aXNfdXNhZ2UpOw0KIA0KIAltZW0tPm1tX25vZGUgPSBub2RlczsNCkBAIC0zNTksNiArMzY2
LDcgQEAgc3RhdGljIGludCBhbWRncHVfdnJhbV9tZ3JfbmV3KHN0cnVjdCB0dG1fbWVtX3R5cGVf
bWFuYWdlciAqbWFuLA0KIAl3aGlsZSAoaS0tKQ0KIAkJZHJtX21tX3JlbW92ZV9ub2RlKCZub2Rl
c1tpXSk7DQogCXNwaW5fdW5sb2NrKCZtZ3ItPmxvY2spOw0KKwlhdG9taWM2NF9zdWIobWVtLT5u
dW1fcGFnZXMgPDwgUEFHRV9TSElGVCwgJm1nci0+dXNhZ2UpOw0KIA0KIAlrdmZyZWUobm9kZXMp
Ow0KIAlyZXR1cm4gciA9PSAtRU5PU1BDID8gMCA6IHI7DQotLSANCjIuMjEuMA0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
