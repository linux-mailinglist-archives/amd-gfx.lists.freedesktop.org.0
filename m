Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 202B3600AD
	for <lists+amd-gfx@lfdr.de>; Fri,  5 Jul 2019 07:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35A86E40E;
	Fri,  5 Jul 2019 05:37:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800041.outbound.protection.outlook.com [40.107.80.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2186E40E
 for <amd-gfx@lists.freedesktop.org>; Fri,  5 Jul 2019 05:37:15 +0000 (UTC)
Received: from CH2PR12MB3767.namprd12.prod.outlook.com (52.132.244.213) by
 CH2PR12MB4165.namprd12.prod.outlook.com (20.180.5.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Fri, 5 Jul 2019 05:37:12 +0000
Received: from CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::6cc4:28bf:361f:d486]) by CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::6cc4:28bf:361f:d486%3]) with mapi id 15.20.2032.019; Fri, 5 Jul 2019
 05:37:12 +0000
From: "Xu, Feifei" <Feifei.Xu@amd.com>
To: "Cui, Flora" <Flora.Cui@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v4] drm/amdgpu: fix scheduler timeout calc
Thread-Topic: [PATCH v4] drm/amdgpu: fix scheduler timeout calc
Thread-Index: AQHVL75DJwZOErPEzU6MjZqJYrnFlaa7h8tw
Date: Fri, 5 Jul 2019 05:37:11 +0000
Message-ID: <CH2PR12MB3767D1E71B22B99D41ECAB20FEF50@CH2PR12MB3767.namprd12.prod.outlook.com>
References: <1561952220-5526-1-git-send-email-flora.cui@amd.com>
In-Reply-To: <1561952220-5526-1-git-send-email-flora.cui@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 21456f53-9465-4bd2-e968-08d7010ad45f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CH2PR12MB4165; 
x-ms-traffictypediagnostic: CH2PR12MB4165:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CH2PR12MB4165908FDE0BEBB480EEBFBAFEF50@CH2PR12MB4165.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 008960E8EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(366004)(376002)(136003)(13464003)(189003)(199004)(71200400001)(71190400001)(81166006)(81156014)(8936002)(8676002)(99286004)(110136005)(4326008)(66066001)(316002)(53546011)(25786009)(478600001)(7696005)(966005)(2906002)(72206003)(6506007)(14454004)(26005)(33656002)(76176011)(186003)(102836004)(7736002)(305945005)(9686003)(52536014)(6306002)(256004)(53936002)(11346002)(86362001)(446003)(74316002)(5660300002)(55016002)(6246003)(68736007)(66476007)(476003)(64756008)(2501003)(6116002)(229853002)(3846002)(73956011)(66556008)(76116006)(66946007)(486006)(6436002)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4165;
 H:CH2PR12MB3767.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VQ3eD6SECzf8uzKj+LzBXnsF4KaYzFHjhx9M0rMuRdoOD/cipDr7c44JPqIRfBe10zDCzT9+TyP2sdLlQ8KkyWiJFmGEIN/jHDNpPjVlL932OKzB4sKbD/kCV3J8JdgWssCfcOWjMqGhW8PupmcHb0nuklW/w8VJTrYEh8Mf9SzxUgjiU3LqHzQW3qXv6Oo2+cv8zKtwvYqvH4Xdbq3HCs8TI+cqc9eHVs/t55DvBIKo9NcasD5Weq97xenj5dLseyhxEpOyvZ/Co9/qVCWw+nb8G5KTDQFdv1hip4iEmbufUqyyljWFFI0ukY8Ksaxs9qt73EJtDElT5jIQuDz1BIi0/MDppu61rV2ZugRjnd6EFc7HFv0lTtdTj3ZssNXoKAstEssK2n4JabSDrDg7apoOShFNdwVeUIfr4MuF3LE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21456f53-9465-4bd2-e968-08d7010ad45f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2019 05:37:11.9131 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: feifxu@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4165
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bdpVa0h/BIstILH9Nv5Xkrz3PTTLbAcck2Z/vzPVF8E=;
 b=mLkdQOvHpmhRLHarYLtEb/oc/kxxLca/kukk4hoYtvD7UyCmTFNRTzJnnQAXlrFAnVHUEkM7tQp+utfhog4WV8cojVKG0kQ4wo8cdgc1GsJx6lxrnmrys9o4C6pcmkEMC1Poysa4qn/Uife7l6leZkA1a4qwZWSWU1ZhzqWvlHQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Feifei.Xu@amd.com; 
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
Cc: "Cui, Flora" <Flora.Cui@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEZlaWZlaS5YdUBhbWQuY29tDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
PiBPbiBCZWhhbGYgT2YgQ3VpLCBGbG9yYQ0KU2VudDogTW9uZGF5LCBKdWx5IDEsIDIwMTkgMTE6
MzcgQU0NClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IEN1aSwgRmxvcmEg
PEZsb3JhLkN1aUBhbWQuY29tPg0KU3ViamVjdDogW1BBVENIIHY0XSBkcm0vYW1kZ3B1OiBmaXgg
c2NoZWR1bGVyIHRpbWVvdXQgY2FsYw0KDQpzY2hlZHVsZXIgdGltZW91dCBpcyBpbiBqaWZmaWVz
DQp2MjogbW92ZSB0aW1lb3V0IGNoZWNrIHRvIGFtZGdwdV9kZXZpY2VfZ2V0X2pvYl90aW1lb3V0
X3NldHRpbmdzIGFmdGVyIHBhcnNpbmcgdGhlIHZhbHVlDQp2MzogYWRkIGxvY2t1cF90aW1lb3V0
IHBhcmFtIGNoZWNrLiAwOiBrZWVwIGRlZmF1bHQgdmFsdWUuIG5lZ2F0aXZlOg0KaW5maW5pdHkg
dGltZW91dC4NCnY0OiByZWZhY3RvciBjb2Rlcy4NCg0KQ2hhbmdlLUlkOiBJMjY3MDhjMTYzZGI5
NDNmZjhkOTMwZGQ4MWJjYWI0YjRiOWQ4NGViMg0KU2lnbmVkLW9mZi1ieTogRmxvcmEgQ3VpIDxm
bG9yYS5jdWlAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kcnYuYyB8IDEzICsrKysrKysrKy0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Ry
di5jDQppbmRleCBlNzRhMTc1Li5lNDQ4ZjhlIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZHJ2LmMNCkBAIC0yNDUsNyArMjQ1LDggQEAgbW9kdWxlX3BhcmFtX25hbWVkKG1z
aSwgYW1kZ3B1X21zaSwgaW50LCAwNDQ0KTsNCiAgKiBCeSBkZWZhdWx0KHdpdGggbm8gbG9ja3Vw
X3RpbWVvdXQgc2V0dGluZ3MpLCB0aGUgdGltZW91dCBmb3IgYWxsIG5vbi1jb21wdXRlKEdGWCwg
U0RNQSBhbmQgVmlkZW8pDQogICogam9icyBpcyAxMDAwMC4gQW5kIHRoZXJlIGlzIG5vIHRpbWVv
dXQgZW5mb3JjZWQgb24gY29tcHV0ZSBqb2JzLg0KICAqLw0KLU1PRFVMRV9QQVJNX0RFU0MobG9j
a3VwX3RpbWVvdXQsICJHUFUgbG9ja3VwIHRpbWVvdXQgaW4gbXMgKGRlZmF1bHQ6IDEwMDAwIGZv
ciBub24tY29tcHV0ZSBqb2JzIGFuZCBubyB0aW1lb3V0IGZvciBjb21wdXRlIGpvYnMpLCAiDQor
TU9EVUxFX1BBUk1fREVTQyhsb2NrdXBfdGltZW91dCwgIkdQVSBsb2NrdXAgdGltZW91dCBpbiBt
cyAoZGVmYXVsdDogMTAwMDAgZm9yIG5vbi1jb21wdXRlIGpvYnMgYW5kIGluZmluaXR5IHRpbWVv
dXQgZm9yIGNvbXB1dGUgam9icy4iDQorCQkiIDA6IGtlZXAgZGVmYXVsdCB2YWx1ZS4gbmVnYXRp
dmU6IGluZmluaXR5IHRpbWVvdXQpLCAiDQogCQkiZm9ybWF0IGlzIFtOb24tQ29tcHV0ZV0gb3Ig
W0dGWCxDb21wdXRlLFNETUEsVmlkZW9dIik7ICBtb2R1bGVfcGFyYW1fc3RyaW5nKGxvY2t1cF90
aW1lb3V0LCBhbWRncHVfbG9ja3VwX3RpbWVvdXQsIHNpemVvZihhbWRncHVfbG9ja3VwX3RpbWVv
dXQpLCAwNDQ0KTsNCiANCkBAIC0xMzAwLDcgKzEzMDEsOCBAQCBpbnQgYW1kZ3B1X2RldmljZV9n
ZXRfam9iX3RpbWVvdXRfc2V0dGluZ3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQogCSAq
IEJ5IGRlZmF1bHQgdGltZW91dCBmb3Igbm9uIGNvbXB1dGUgam9icyBpcyAxMDAwMC4NCiAJICog
QW5kIHRoZXJlIGlzIG5vIHRpbWVvdXQgZW5mb3JjZWQgb24gY29tcHV0ZSBqb2JzLg0KIAkgKi8N
Ci0JYWRldi0+Z2Z4X3RpbWVvdXQgPSBhZGV2LT5zZG1hX3RpbWVvdXQgPSBhZGV2LT52aWRlb190
aW1lb3V0ID0gMTAwMDA7DQorCWFkZXYtPmdmeF90aW1lb3V0ID0gbXNlY3NfdG9famlmZmllcygx
MDAwMCk7DQorCWFkZXYtPnNkbWFfdGltZW91dCA9IGFkZXYtPnZpZGVvX3RpbWVvdXQgPSBhZGV2
LT5nZnhfdGltZW91dDsNCiAJYWRldi0+Y29tcHV0ZV90aW1lb3V0ID0gTUFYX1NDSEVEVUxFX1RJ
TUVPVVQ7DQogDQogCWlmIChzdHJubGVuKGlucHV0LCBBTURHUFVfTUFYX1RJTUVPVVRfUEFSQU1f
TEVOVEgpKSB7IEBAIC0xMzEwLDEwICsxMzEyLDEzIEBAIGludCBhbWRncHVfZGV2aWNlX2dldF9q
b2JfdGltZW91dF9zZXR0aW5ncyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCiAJCQlpZiAo
cmV0KQ0KIAkJCQlyZXR1cm4gcmV0Ow0KIA0KLQkJCS8qIEludmFsaWRhdGUgMCBhbmQgbmVnYXRp
dmUgdmFsdWVzICovDQotCQkJaWYgKHRpbWVvdXQgPD0gMCkgew0KKwkJCWlmICh0aW1lb3V0ID09
IDApIHsNCiAJCQkJaW5kZXgrKzsNCiAJCQkJY29udGludWU7DQorCQkJfSBlbHNlIGlmICh0aW1l
b3V0IDwgMCkgew0KKwkJCQl0aW1lb3V0ID0gTUFYX1NDSEVEVUxFX1RJTUVPVVQ7DQorCQkJfSBl
bHNlIHsNCisJCQkJdGltZW91dCA9IG1zZWNzX3RvX2ppZmZpZXModGltZW91dCk7DQogCQkJfQ0K
IA0KIAkJCXN3aXRjaCAoaW5kZXgrKykgew0KLS0NCjIuNy40DQoNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0KYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
