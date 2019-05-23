Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AAA28D56
	for <lists+amd-gfx@lfdr.de>; Fri, 24 May 2019 00:41:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C4FF6E088;
	Thu, 23 May 2019 22:41:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780072.outbound.protection.outlook.com [40.107.78.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6376E091
 for <amd-gfx@lists.freedesktop.org>; Thu, 23 May 2019 22:41:22 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2451.namprd12.prod.outlook.com (52.132.11.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Thu, 23 May 2019 22:41:21 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1900.020; Thu, 23 May 2019
 22:41:21 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 8/8] drm/amdkfd: Use kfd fd to mmap mmio
Thread-Topic: [PATCH 8/8] drm/amdkfd: Use kfd fd to mmap mmio
Thread-Index: AQHVEbikTwCLs4lEkU+usHnh8NLTMw==
Date: Thu, 23 May 2019 22:41:20 +0000
Message-ID: <1558651263-3478-8-git-send-email-Oak.Zeng@amd.com>
References: <1558651263-3478-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1558651263-3478-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0047.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::24) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1bd3dde-8338-4cc3-a2eb-08d6dfcfc6ca
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2451; 
x-ms-traffictypediagnostic: BL0PR12MB2451:
x-microsoft-antispam-prvs: <BL0PR12MB24516E822551BB13FBBC209180010@BL0PR12MB2451.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:475;
x-forefront-prvs: 00462943DE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(136003)(39860400002)(366004)(376002)(396003)(199004)(189003)(66556008)(64756008)(71190400001)(66446008)(66476007)(71200400001)(446003)(73956011)(4326008)(478600001)(8676002)(25786009)(99286004)(2501003)(66946007)(66066001)(6436002)(6512007)(5640700003)(476003)(316002)(54906003)(6486002)(26005)(5660300002)(256004)(186003)(76176011)(486006)(102836004)(2616005)(11346002)(52116002)(386003)(6506007)(86362001)(68736007)(2906002)(6916009)(6116002)(3846002)(2351001)(305945005)(7736002)(14454004)(50226002)(53936002)(8936002)(81166006)(81156014)(36756003)(72206003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2451;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fwKllwdcChzwPefy0wYNU8xqASHrWisUWMFzTD3vg4xMNoQQdV8VSORYPddJYpz1gcZ86uS219I8xKvo1ZXiE640ISHllaCn3KwhpU5NyGNsqBS98d1Bh31OfJbR7kbdMpK+Sl5F9CyYkJe7p5RCLRM3Ggyl0mfBxG2fFYMakbsHgZrzeK0UShEt0WRtdDYXmNEWcFomALCgHSO/kuipg1oAbDFtsW6IwXMtG5AZqkiNkeMsVhS+sHmsMvt+FTXbwWJ9uXgHf8h4wsMJ18D1g0w60u0sIIjDmx+6lXORQsOmUWd4s/K8HN62X4rCUCSzaoWYfJu5sZ+4EgMxrt/m6j+fqNKOktMl+sDjfi/5mx1EQB+f3ulW9qA7SIk6fifILy1ew9P5HYPw5+GsKapB/xfLiSo2mCyQscrObHdPHEE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1bd3dde-8338-4cc3-a2eb-08d6dfcfc6ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2019 22:41:20.9255 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2451
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnKTQptDhjGeMk9QB1G/EBQr2n4kS+KpMd4x0zxj8ks=;
 b=zx1CO/qAehHOLov3sVJ0mY3wP8MkTIBQXORD9MFOie4RS2/InQeISRHoPe3thTB85Hz9Zp9zFeR2UAIC/UxvWJVNKn7g/4Iuw98w1y1s3UzjPn/roE4hmNMTSFoF9LD4hAJNfiW3HyRBzIYPuSORJOH4UL0LEysfzGbRZlgDxfA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Oak.Zeng@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Zeng,
 Oak" <Oak.Zeng@amd.com>, "Keely, Sean" <Sean.Keely@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VFRNIGRvZXNuJ3Qgc3VwcG9ydCBDUFUgbWFwcGluZyBvZiBzZyB0eXBlIGJvICh1bmRlciB3aGlj
aA0KbW1pbyBibyBpcyBjcmVhdGVkKS4gU3dpdGNoIG1tYXBpbmcgb2YgbW1pbyBwYWdlIHRvIGtm
ZA0KZGV2aWNlIGZpbGUuDQoNCkNoYW5nZS1JZDogSTFhMWEyNGYyYWMwNjYyYmUzNzgzZDQ2MGMx
Mzc3MzFhZGUwMDdiODMNClNpZ25lZC1vZmYtYnk6IE9hayBaZW5nIDxPYWsuWmVuZ0BhbWQuY29t
Pg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYuYyB8IDQ2ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX3ByaXYuaCAgICB8ICAxICsNCiAyIGZpbGVzIGNoYW5nZWQsIDQ3IGluc2VydGlvbnMo
KykNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5jDQppbmRleCA0NTVh
M2RiLi42N2QyNjliIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X2NoYXJkZXYuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYu
Yw0KQEAgLTEzMDksNiArMTMwOSwxNSBAQCBzdGF0aWMgaW50IGtmZF9pb2N0bF9hbGxvY19tZW1v
cnlfb2ZfZ3B1KHN0cnVjdCBmaWxlICpmaWxlcCwNCiAJYXJncy0+aGFuZGxlID0gTUFLRV9IQU5E
TEUoYXJncy0+Z3B1X2lkLCBpZHJfaGFuZGxlKTsNCiAJYXJncy0+bW1hcF9vZmZzZXQgPSBvZmZz
ZXQ7DQogDQorCS8qIE1NSU8gaXMgbWFwcGVkIHRocm91Z2gga2ZkIGRldmljZQ0KKwkgKiBHZW5l
cmF0ZSBhIGtmZCBtbWFwIG9mZnNldA0KKwkgKi8NCisJaWYgKGZsYWdzICYgS0ZEX0lPQ19BTExP
Q19NRU1fRkxBR1NfTU1JT19SRU1BUCkgew0KKwkJYXJncy0+bW1hcF9vZmZzZXQgPSBLRkRfTU1B
UF9UWVBFX01NSU8gfCBLRkRfTU1BUF9HUFVfSUQoYXJncy0+Z3B1X2lkKTsNCisJCWFyZ3MtPm1t
YXBfb2Zmc2V0IDw8PSBQQUdFX1NISUZUOw0KKwkJYXJncy0+bW1hcF9vZmZzZXQgfD0gYW1kZ3B1
X2FtZGtmZF9nZXRfbW1pb19yZW1hcF9waHlzX2FkZHIoZGV2LT5rZ2QpOw0KKwl9DQorDQogCXJl
dHVybiAwOw0KIA0KIGVycl9mcmVlOg0KQEAgLTE4ODAsNiArMTg4OSwzOSBAQCBzdGF0aWMgbG9u
ZyBrZmRfaW9jdGwoc3RydWN0IGZpbGUgKmZpbGVwLCB1bnNpZ25lZCBpbnQgY21kLCB1bnNpZ25l
ZCBsb25nIGFyZykNCiAJcmV0dXJuIHJldGNvZGU7DQogfQ0KIA0KK3N0YXRpYyBpbnQga2ZkX21t
aW9fbW1hcChzdHJ1Y3Qga2ZkX2RldiAqZGV2LCBzdHJ1Y3Qga2ZkX3Byb2Nlc3MgKnByb2Nlc3Ms
DQorCQkgICAgICBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkNCit7DQorCXBoeXNfYWRkcl90
IGFkZHJlc3M7DQorCWludCByZXQ7DQorDQorCWlmICh2bWEtPnZtX2VuZCAtIHZtYS0+dm1fc3Rh
cnQgIT0gUEFHRV9TSVpFKQ0KKwkJcmV0dXJuIC1FSU5WQUw7DQorDQorCWFkZHJlc3MgPSBhbWRn
cHVfYW1ka2ZkX2dldF9tbWlvX3JlbWFwX3BoeXNfYWRkcihkZXYtPmtnZCk7DQorDQorCXZtYS0+
dm1fZmxhZ3MgfD0gVk1fSU8gfCBWTV9ET05UQ09QWSB8IFZNX0RPTlRFWFBBTkQgfCBWTV9OT1JF
U0VSVkUgfA0KKwkJCQlWTV9ET05URFVNUCB8IFZNX1BGTk1BUDsNCisNCisJdm1hLT52bV9wYWdl
X3Byb3QgPSBwZ3Byb3Rfbm9uY2FjaGVkKHZtYS0+dm1fcGFnZV9wcm90KTsNCisNCisJcHJfZGVi
dWcoIlByb2Nlc3MgJWQgbWFwcGluZyBtbWlvIHBhZ2VcbiINCisJCSAiICAgICB0YXJnZXQgdXNl
ciBhZGRyZXNzID09IDB4JTA4bGxYXG4iDQorCQkgIiAgICAgcGh5c2ljYWwgYWRkcmVzcyAgICA9
PSAweCUwOGxsWFxuIg0KKwkJICIgICAgIHZtX2ZsYWdzICAgICAgICAgICAgPT0gMHglMDRsWFxu
Ig0KKwkJICIgICAgIHNpemUgICAgICAgICAgICAgICAgPT0gMHglMDRsWFxuIiwNCisJCSBwcm9j
ZXNzLT5wYXNpZCwgKHVuc2lnbmVkIGxvbmcgbG9uZykgdm1hLT52bV9zdGFydCwNCisJCSBhZGRy
ZXNzLCB2bWEtPnZtX2ZsYWdzLCBQQUdFX1NJWkUpOw0KKw0KKwlyZXQgPSBpb19yZW1hcF9wZm5f
cmFuZ2Uodm1hLA0KKwkJCQl2bWEtPnZtX3N0YXJ0LA0KKwkJCQlhZGRyZXNzID4+IFBBR0VfU0hJ
RlQsDQorCQkJCVBBR0VfU0laRSwNCisJCQkJdm1hLT52bV9wYWdlX3Byb3QpOw0KKwlyZXR1cm4g
cmV0Ow0KK30NCisNCisNCiBzdGF0aWMgaW50IGtmZF9tbWFwKHN0cnVjdCBmaWxlICpmaWxwLCBz
dHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkNCiB7DQogCXN0cnVjdCBrZmRfcHJvY2VzcyAqcHJv
Y2VzczsNCkBAIC0xOTEwLDYgKzE5NTIsMTAgQEAgc3RhdGljIGludCBrZmRfbW1hcChzdHJ1Y3Qg
ZmlsZSAqZmlscCwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpDQogCQlpZiAoIWRldikNCiAJ
CQlyZXR1cm4gLUVOT0RFVjsNCiAJCXJldHVybiBrZmRfcmVzZXJ2ZWRfbWVtX21tYXAoZGV2LCBw
cm9jZXNzLCB2bWEpOw0KKwljYXNlIEtGRF9NTUFQX1RZUEVfTU1JTzoNCisJCWlmICghZGV2KQ0K
KwkJCXJldHVybiAtRU5PREVWOw0KKwkJcmV0dXJuIGtmZF9tbWlvX21tYXAoZGV2LCBwcm9jZXNz
LCB2bWEpOw0KIAl9DQogDQogCXJldHVybiAtRUZBVUxUOw0KZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtm
ZC9rZmRfcHJpdi5oDQppbmRleCA0MGE1YzY3Li5iNjFkYzUzIDEwMDY0NA0KLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaA0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX3ByaXYuaA0KQEAgLTU5LDYgKzU5LDcgQEANCiAjZGVmaW5lIEtGRF9NTUFQ
X1RZUEVfRE9PUkJFTEwJKDB4M1VMTCA8PCBLRkRfTU1BUF9UWVBFX1NISUZUKQ0KICNkZWZpbmUg
S0ZEX01NQVBfVFlQRV9FVkVOVFMJKDB4MlVMTCA8PCBLRkRfTU1BUF9UWVBFX1NISUZUKQ0KICNk
ZWZpbmUgS0ZEX01NQVBfVFlQRV9SRVNFUlZFRF9NRU0JKDB4MVVMTCA8PCBLRkRfTU1BUF9UWVBF
X1NISUZUKQ0KKyNkZWZpbmUgS0ZEX01NQVBfVFlQRV9NTUlPCSgweDBVTEwgPDwgS0ZEX01NQVBf
VFlQRV9TSElGVCkNCiANCiAjZGVmaW5lIEtGRF9NTUFQX0dQVV9JRF9TSElGVCAoNDYgLSBQQUdF
X1NISUZUKQ0KICNkZWZpbmUgS0ZEX01NQVBfR1BVX0lEX01BU0sgKCgoMVVMTCA8PCBLRkRfR1BV
X0lEX0hBU0hfV0lEVEgpIC0gMSkgXA0KLS0gDQoyLjcuNA0KDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
