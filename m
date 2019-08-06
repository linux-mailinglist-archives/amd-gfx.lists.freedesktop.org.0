Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A75C282D2E
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Aug 2019 09:54:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0CB46E31E;
	Tue,  6 Aug 2019 07:54:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720071.outbound.protection.outlook.com [40.107.72.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C468A6E2F3
 for <amd-gfx@lists.freedesktop.org>; Tue,  6 Aug 2019 07:54:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CdHxVWbxEZCJJmsjHlpVbCC+QdWlfT8XA81FAdBvkXFhwK1knhvC9F3M8sW7XyerF34JurE0TTRa3xCpf/SV+NysMZrITfh0sESJu3TGJ+7Lz7uYsrg1Aw85zVpt3Oaem4+r7boz1ZP7hQwie9NVGN8m2vnGEO4SBpC32I0K7JxQEqZTTXT8epD8JnVlKnyYyOI+ncPn7lzZz5SuhHjYnINKVPnG1Lk5Yj/kZrVujSc4PCesydihyvi8OeDDpN8qrqtfEJ/tcl/z1GLkDdn/JaHfYtDtCBAh0AMaQLkjXXQAGMWny+w5Twwgg6goNdC542O6u1m2A7XJy2GP80K6tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBaJSHahTQjEnsZ9/q4vwNRIzYfRzFUPD2jobqe4GGw=;
 b=EUXOrcRARMKLxHuHfEy5PhMza4AN0fdEsAadRlEJ0TZbCMN+eeqAsxzh3nxcwKNvkehAPsHDuZPMrexpN4RG6R3Qk0pXYm7p8X6x5nWDWbe3IGFcXvrTOCuPojLWVSKVZ7SomltTQDMKsEr7pIBGFE2DSgBPgevuv6wWPiQBHYl/JsGg+GfMshFjlwp/seudv1273pFhL2LlwRnGTn7kb4NObxuCTKtGXprckcZPYxIaQXPbNHcEb+y8M0eAxb4xL+181/C02UMjFPZdeoF2KZ8/BuGlw+gVNsIhhgKCTI+/6+TkPRh6pu7Qh04eOu50rPCPs8pTTnDYmE/5qmhauQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3072.namprd12.prod.outlook.com (20.178.240.93) by
 MN2PR12MB3680.namprd12.prod.outlook.com (10.255.86.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Tue, 6 Aug 2019 07:54:16 +0000
Received: from MN2PR12MB3072.namprd12.prod.outlook.com
 ([fe80::19d9:42de:5029:e15]) by MN2PR12MB3072.namprd12.prod.outlook.com
 ([fe80::19d9:42de:5029:e15%6]) with mapi id 15.20.2136.018; Tue, 6 Aug 2019
 07:54:16 +0000
From: "Ma, Le" <Le.Ma@amd.com>
To: =?utf-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] Revert "drm/amdgpu: fix transform feedback GDS hang on
 gfx10 (v2)"
Thread-Topic: [PATCH] Revert "drm/amdgpu: fix transform feedback GDS hang on
 gfx10 (v2)"
Thread-Index: AQHVSYFxkqfM/K/EU0+tVinltzk6YKbtxPhw
Date: Tue, 6 Aug 2019 07:54:16 +0000
Message-ID: <MN2PR12MB3072956109A63A1FE8DDAB92F6D50@MN2PR12MB3072.namprd12.prod.outlook.com>
References: <20190802222703.428-1-maraeo@gmail.com>
In-Reply-To: <20190802222703.428-1-maraeo@gmail.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0770b961-5625-44f8-3a29-08d71a4347f5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3680; 
x-ms-traffictypediagnostic: MN2PR12MB3680:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3680BC51AA8F63ED68FADDD9F6D50@MN2PR12MB3680.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:63;
x-forefront-prvs: 0121F24F22
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(136003)(366004)(39860400002)(189003)(199004)(52314003)(13464003)(52536014)(66476007)(64756008)(66556008)(76116006)(86362001)(66946007)(66446008)(71190400001)(71200400001)(110136005)(5660300002)(53546011)(102836004)(14454004)(316002)(76176011)(99286004)(6506007)(256004)(7696005)(26005)(81156014)(81166006)(8676002)(8936002)(3846002)(6116002)(2501003)(476003)(966005)(305945005)(229853002)(186003)(7736002)(11346002)(74316002)(25786009)(486006)(9686003)(33656002)(6306002)(478600001)(55016002)(2906002)(68736007)(446003)(6246003)(53936002)(66066001)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3680;
 H:MN2PR12MB3072.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hbBMw/uz8CKLi5k0NNPqUb8OQerYzopcWEfI5SAiaraOjOVn9aC0dMBxOde2+l3y1uIyP7YHCu45DtRNjjEzm4+JeIJ8UW2uFC+RH15wo8iEItmZUraDjGkQcT04zu73kiSPLZnoUb/F5rXTsCePIlZyFm0UVf2O9qAivAMnSePAJeScwWHkx2PnpmfIQpXzrcqa2cKL1lB7a/LxFi6SidOz5JyBBD5nmX3xjPx3wUkykcnhA4Ihzu+38D5kqYdsNzl4cFgSD53xGdK1GGqRRgQc1JzkXqNOnmCYSNH5LTU+adLUiX1ez90VhYva9uCJg09NeS6bf8/bFzuurJRO7rds24EVK5MwF8V8qBr7Nb+lzxiaCGlqHC2DXloHCc8qLku31MhG3MK/hUS3T9BoN8KVPOQOlVhsf0fjfmzJjq4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0770b961-5625-44f8-3a29-08d71a4347f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2019 07:54:16.7999 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lema1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3680
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBaJSHahTQjEnsZ9/q4vwNRIzYfRzFUPD2jobqe4GGw=;
 b=RCpCnzEWYUGqsS4qkNW+XLXteiJYkU+2H7hjG+WW6BACa0kEOM0/zF82Qul+FxLaddybtQDB/H0mLinanDJ3mB5BSXB5HzMFV6SwcHbELilKyyGje8Oj5fQQq1AEAZE8o5QS0yblLrYuTC90OD6XoQLDrPsMOwxvQoGLtUhzbhE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Le.Ma@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IExlIE1hIDxMZS5NYUBhbWQuY29tPg0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZz4gT24gQmVoYWxmIE9mIE1hcmVrIE9sP8Ohaw0KU2VudDogU2F0dXJkYXksIEF1Z3VzdCAw
MywgMjAxOSA2OjI3IEFNDQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNClN1Ympl
Y3Q6IFtQQVRDSF0gUmV2ZXJ0ICJkcm0vYW1kZ3B1OiBmaXggdHJhbnNmb3JtIGZlZWRiYWNrIEdE
UyBoYW5nIG9uIGdmeDEwICh2MikiDQoNCkZyb206IE1hcmVrIE9sxaHDoWsgPG1hcmVrLm9sc2Fr
QGFtZC5jb20+DQoNClRoaXMgcmV2ZXJ0cyBjb21taXQgYjQxMzM1YzZjMDMwM2QxMDBhYmU4OWM4
NDNlNTI2NDVkMTk3NGNkOS4NCg0KU0VUX0NPTkZJR19SRUcgd3JpdGVzIHRvIG1lbW9yeSBpZiBy
ZWdpc3RlciBzaGFkb3dpbmcgaXMgZW5hYmxlZCwgY2F1c2luZyBhIFZNIGZhdWx0Lg0KDQpOR0cg
c3RyZWFtb3V0IGlzIHVuc3RhYmxlIGFueXdheSwgc28gYWxsIFVNRHMgc2hvdWxkIHVzZSBsZWdh
Y3kgc3RyZWFtb3V0LiBJIHRoaW5rIE1lc2EgaXMgdGhlIG9ubHkgZHJpdmVyIHVzaW5nIE5HRyBz
dHJlYW1vdXQuDQoNClNpZ25lZC1vZmYtYnk6IE1hcmVrIE9sxaHDoWsgPG1hcmVrLm9sc2FrQGFt
ZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2RzLmggfCAg
MSAtICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYyAgfCAxMiArLS0tLS0t
LS0tLS0NCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxMiBkZWxldGlvbnMoLSkN
Cg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZHMuaCBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZHMuaA0KaW5kZXggZGY4YTIzNTU0
ODMxLi5mNmFjMWU5NTQ4ZjIgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZ2RzLmgNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9n
ZHMuaA0KQEAgLTI1LDIxICsyNSwyMCBAQA0KICNkZWZpbmUgX19BTURHUFVfR0RTX0hfXw0KIA0K
IHN0cnVjdCBhbWRncHVfcmluZzsNCiBzdHJ1Y3QgYW1kZ3B1X2JvOw0KIA0KIHN0cnVjdCBhbWRn
cHVfZ2RzIHsNCiAJdWludDMyX3QgZ2RzX3NpemU7DQogCXVpbnQzMl90IGd3c19zaXplOw0KIAl1
aW50MzJfdCBvYV9zaXplOw0KIAl1aW50MzJfdCBnZHNfY29tcHV0ZV9tYXhfd2F2ZV9pZDsNCi0J
dWludDMyX3Qgdmd0X2dzX21heF93YXZlX2lkOw0KIH07DQogDQogc3RydWN0IGFtZGdwdV9nZHNf
cmVnX29mZnNldCB7DQogCXVpbnQzMl90CW1lbV9iYXNlOw0KIAl1aW50MzJfdAltZW1fc2l6ZTsN
CiAJdWludDMyX3QJZ3dzOw0KIAl1aW50MzJfdAlvYTsNCiB9Ow0KIA0KICNlbmRpZiAvKiBfX0FN
REdQVV9HRFNfSF9fICovDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z2Z4X3YxMF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYw0KaW5k
ZXggNjE4MjkxZGY2NTliLi5lMzgyM2M4ZTk4NTAgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4X3YxMF8wLmMNCkBAIC00MjY5LDI5ICs0MjY5LDIwIEBAIHN0YXRpYyB2b2lkIGdmeF92
MTBfMF9yaW5nX2VtaXRfaGRwX2ZsdXNoKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZykgIH0NCiAN
CiBzdGF0aWMgdm9pZCBnZnhfdjEwXzBfcmluZ19lbWl0X2liX2dmeChzdHJ1Y3QgYW1kZ3B1X3Jp
bmcgKnJpbmcsDQogCQkJCSAgICAgICBzdHJ1Y3QgYW1kZ3B1X2pvYiAqam9iLA0KIAkJCQkgICAg
ICAgc3RydWN0IGFtZGdwdV9pYiAqaWIsDQogCQkJCSAgICAgICB1aW50MzJfdCBmbGFncykNCiB7
DQogCXVuc2lnbmVkIHZtaWQgPSBBTURHUFVfSk9CX0dFVF9WTUlEKGpvYik7DQogCXUzMiBoZWFk
ZXIsIGNvbnRyb2wgPSAwOw0KIA0KLQkvKiBQcmV2ZW50IGEgaHcgZGVhZGxvY2sgZHVlIHRvIGEg
d2F2ZSBJRCBtaXNtYXRjaCBiZXR3ZWVuIE1FIGFuZCBHRFMuDQotCSAqIFRoaXMgcmVzZXRzIHRo
ZSB3YXZlIElEIGNvdW50ZXJzLiAobmVlZGVkIGJ5IHRyYW5zZm9ybSBmZWVkYmFjaykNCi0JICog
VE9ETzogVGhpcyBtaWdodCBvbmx5IGJlIG5lZWRlZCBvbiBhIFZNSUQgc3dpdGNoIHdoZW4gd2Ug
Y2hhbmdlDQotCSAqICAgICAgIHRoZSBHRFMgT0EgbWFwcGluZywgbm90IHN1cmUuDQotCSAqLw0K
LQlhbWRncHVfcmluZ193cml0ZShyaW5nLCBQQUNLRVQzKFBBQ0tFVDNfU0VUX0NPTkZJR19SRUcs
IDEpKTsNCi0JYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgbW1WR1RfR1NfTUFYX1dBVkVfSUQpOw0K
LQlhbWRncHVfcmluZ193cml0ZShyaW5nLCByaW5nLT5hZGV2LT5nZHMudmd0X2dzX21heF93YXZl
X2lkKTsNCi0NCiAJaWYgKGliLT5mbGFncyAmIEFNREdQVV9JQl9GTEFHX0NFKQ0KIAkJaGVhZGVy
ID0gUEFDS0VUMyhQQUNLRVQzX0lORElSRUNUX0JVRkZFUl9DTlNULCAyKTsNCiAJZWxzZQ0KIAkJ
aGVhZGVyID0gUEFDS0VUMyhQQUNLRVQzX0lORElSRUNUX0JVRkZFUiwgMik7DQogDQogCWNvbnRy
b2wgfD0gaWItPmxlbmd0aF9kdyB8ICh2bWlkIDw8IDI0KTsNCiANCiAJaWYgKGFtZGdwdV9tY2Jw
ICYmIChpYi0+ZmxhZ3MgJiBBTURHUFVfSUJfRkxBR19QUkVFTVBUKSkgew0KIAkJY29udHJvbCB8
PSBJTkRJUkVDVF9CVUZGRVJfUFJFX0VOQigxKTsNCiANCkBAIC01MDIzLDIxICs1MDE0LDIxIEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X3JpbmdfZnVuY3MgZ2Z4X3YxMF8wX3JpbmdfZnVu
Y3NfZ2Z4ID0gew0KIAkJICAgICAqLw0KIAkJNSArIC8qIENPTkRfRVhFQyAqLw0KIAkJNyArIC8q
IEhEUF9mbHVzaCAqLw0KIAkJNCArIC8qIFZHVF9mbHVzaCAqLw0KIAkJMTQgKyAvKglDRV9NRVRB
ICovDQogCQkzMSArIC8qCURFX01FVEEgKi8NCiAJCTMgKyAvKiBDTlRYX0NUUkwgKi8NCiAJCTUg
KyAvKiBIRFBfSU5WTCAqLw0KIAkJOCArIDggKyAvKiBGRU5DRSB4MiAqLw0KIAkJMiwgLyogU1dJ
VENIX0JVRkZFUiAqLw0KLQkuZW1pdF9pYl9zaXplID0JNywgLyogZ2Z4X3YxMF8wX3JpbmdfZW1p
dF9pYl9nZnggKi8NCisJLmVtaXRfaWJfc2l6ZSA9CTQsIC8qIGdmeF92MTBfMF9yaW5nX2VtaXRf
aWJfZ2Z4ICovDQogCS5lbWl0X2liID0gZ2Z4X3YxMF8wX3JpbmdfZW1pdF9pYl9nZngsDQogCS5l
bWl0X2ZlbmNlID0gZ2Z4X3YxMF8wX3JpbmdfZW1pdF9mZW5jZSwNCiAJLmVtaXRfcGlwZWxpbmVf
c3luYyA9IGdmeF92MTBfMF9yaW5nX2VtaXRfcGlwZWxpbmVfc3luYywNCiAJLmVtaXRfdm1fZmx1
c2ggPSBnZnhfdjEwXzBfcmluZ19lbWl0X3ZtX2ZsdXNoLA0KIAkuZW1pdF9nZHNfc3dpdGNoID0g
Z2Z4X3YxMF8wX3JpbmdfZW1pdF9nZHNfc3dpdGNoLA0KIAkuZW1pdF9oZHBfZmx1c2ggPSBnZnhf
djEwXzBfcmluZ19lbWl0X2hkcF9mbHVzaCwNCiAJLnRlc3RfcmluZyA9IGdmeF92MTBfMF9yaW5n
X3Rlc3RfcmluZywNCiAJLnRlc3RfaWIgPSBnZnhfdjEwXzBfcmluZ190ZXN0X2liLA0KIAkuaW5z
ZXJ0X25vcCA9IGFtZGdwdV9yaW5nX2luc2VydF9ub3AsDQogCS5wYWRfaWIgPSBhbWRncHVfcmlu
Z19nZW5lcmljX3BhZF9pYiwNCkBAIC01MTc1LDIxICs1MTY2LDIwIEBAIHN0YXRpYyB2b2lkIGdm
eF92MTBfMF9zZXRfcmxjX2Z1bmNzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KSAgfQ0KIA0K
IHN0YXRpYyB2b2lkIGdmeF92MTBfMF9zZXRfZ2RzX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpICB7DQogCS8qIGluaXQgYXNpYyBnZHMgaW5mbyAqLw0KIAlzd2l0Y2ggKGFkZXYtPmFz
aWNfdHlwZSkgew0KIAljYXNlIENISVBfTkFWSTEwOg0KIAlkZWZhdWx0Og0KIAkJYWRldi0+Z2Rz
Lmdkc19zaXplID0gMHgxMDAwMDsNCiAJCWFkZXYtPmdkcy5nZHNfY29tcHV0ZV9tYXhfd2F2ZV9p
ZCA9IDB4NGZmOw0KLQkJYWRldi0+Z2RzLnZndF9nc19tYXhfd2F2ZV9pZCA9IDB4M2ZmOw0KIAkJ
YnJlYWs7DQogCX0NCiANCiAJYWRldi0+Z2RzLmd3c19zaXplID0gNjQ7DQogCWFkZXYtPmdkcy5v
YV9zaXplID0gMTY7DQogfQ0KIA0KIHN0YXRpYyB2b2lkIGdmeF92MTBfMF9zZXRfdXNlcl93Z3Bf
aW5hY3RpdmVfYml0bWFwX3Blcl9zaChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCiAJCQkJ
CQkJICB1MzIgYml0bWFwKQ0KIHsNCi0tDQoyLjE3LjENCg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18NCmFtZC1nZnggbWFpbGluZyBsaXN0DQphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
