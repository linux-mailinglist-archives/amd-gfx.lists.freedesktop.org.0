Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 439F65F1B6
	for <lists+amd-gfx@lfdr.de>; Thu,  4 Jul 2019 05:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E9F6E21B;
	Thu,  4 Jul 2019 03:08:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710082.outbound.protection.outlook.com [40.107.71.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C71906E21B
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Jul 2019 03:08:45 +0000 (UTC)
Received: from MN2PR12MB3312.namprd12.prod.outlook.com (20.179.83.160) by
 MN2PR12MB3264.namprd12.prod.outlook.com (20.179.83.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Thu, 4 Jul 2019 03:08:43 +0000
Received: from MN2PR12MB3312.namprd12.prod.outlook.com
 ([fe80::b475:24f4:8515:731]) by MN2PR12MB3312.namprd12.prod.outlook.com
 ([fe80::b475:24f4:8515:731%4]) with mapi id 15.20.2032.019; Thu, 4 Jul 2019
 03:08:43 +0000
From: "Cui, Flora" <Flora.Cui@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v4] drm/amdgpu: fix scheduler timeout calc
Thread-Topic: [PATCH v4] drm/amdgpu: fix scheduler timeout calc
Thread-Index: AQHVL75DJwZOErPEzU6MjZqJYrnFlaa5zAyw
Date: Thu, 4 Jul 2019 03:08:43 +0000
Message-ID: <MN2PR12MB331205B8AD6A1389A7519A04FAFA0@MN2PR12MB3312.namprd12.prod.outlook.com>
References: <1561952220-5526-1-git-send-email-flora.cui@amd.com>
In-Reply-To: <1561952220-5526-1-git-send-email-flora.cui@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cceaf3e3-e6d7-4763-d5e4-08d7002cec10
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3264; 
x-ms-traffictypediagnostic: MN2PR12MB3264:
x-microsoft-antispam-prvs: <MN2PR12MB326422FFC4EDBA652FB49B0EFAFA0@MN2PR12MB3264.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(189003)(199004)(13464003)(6916009)(66066001)(256004)(486006)(2906002)(86362001)(476003)(53936002)(5640700003)(6436002)(6246003)(25786009)(5660300002)(72206003)(55016002)(229853002)(9686003)(2351001)(305945005)(7696005)(8936002)(7736002)(74316002)(316002)(8676002)(99286004)(81156014)(81166006)(64756008)(478600001)(6116002)(66946007)(3846002)(66556008)(66476007)(71200400001)(71190400001)(14454004)(66446008)(76176011)(6506007)(53546011)(76116006)(102836004)(186003)(11346002)(52536014)(446003)(26005)(33656002)(68736007)(2501003)(73956011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3264;
 H:MN2PR12MB3312.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kc1kuR0WBIZY4+xhYk3erHg6sL+JrqjviYEVdIWVQs7O+eTxRCtjy0WhjlnJkig8rISHH1VZVdK8PYPJslGWiLFerKgEgBNzNyHCpdLjjLp4B9NFrTfIMmyr1U4UcHWgSDA2w5M8M8DlEkhYrC0O2mnHVJfkqdRmRWcxw8vDkWgeVksnbTgDbAmIXkcWdgjz9lhDlF8nVcYur4KmJXq5w6k8zfSo73v34k+h56uF5rKhHLIOhxltncDky6ZDnNz9M7k2g41ELDoDuOAGFTofdYWF/871mAGWGtq1sT/sTrOjGnTdI7G8AbnXp6kHDR/hqLSP4paFlOznS1tyhoByNb9DnVsdEq28Bo0LOOeDwS4j72DZ/pP+21cNIEh2XBQAi9kW9wPFKmLcv8DDRlW7YdO6LLo4XD4XyyWOr2Xg+ME=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cceaf3e3-e6d7-4763-d5e4-08d7002cec10
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 03:08:43.2843 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fcui@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3264
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUmfFA4lvACfayq7qA+uffVkrX291HN+JThS71kRhBI=;
 b=SHDFh5lfxsWoI9sL/CrJ/iZSGN2GHOXwJKVQJL/KLiq68OpFdstvkB6PnflfcraG3ngLGavPKk4Lq8li6wiC6hRUfjj423x6Q3Sq3J5l8tdoqYjKGMjeoOBRj9oK5UGp7gR+DVEfzJQGGqpxrUP/06uf7j6YJndr1tgTNVaJzJ8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Flora.Cui@amd.com; 
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

UGluZy4uLg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQ3VpLCBGbG9yYSA8
RmxvcmEuQ3VpQGFtZC5jb20+IA0KU2VudDogTW9uZGF5LCBKdWx5IDEsIDIwMTkgMTE6MzcgQU0N
ClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IEN1aSwgRmxvcmEgPEZsb3Jh
LkN1aUBhbWQuY29tPg0KU3ViamVjdDogW1BBVENIIHY0XSBkcm0vYW1kZ3B1OiBmaXggc2NoZWR1
bGVyIHRpbWVvdXQgY2FsYw0KDQpzY2hlZHVsZXIgdGltZW91dCBpcyBpbiBqaWZmaWVzDQp2Mjog
bW92ZSB0aW1lb3V0IGNoZWNrIHRvIGFtZGdwdV9kZXZpY2VfZ2V0X2pvYl90aW1lb3V0X3NldHRp
bmdzIGFmdGVyIHBhcnNpbmcgdGhlIHZhbHVlDQp2MzogYWRkIGxvY2t1cF90aW1lb3V0IHBhcmFt
IGNoZWNrLiAwOiBrZWVwIGRlZmF1bHQgdmFsdWUuIG5lZ2F0aXZlOg0KaW5maW5pdHkgdGltZW91
dC4NCnY0OiByZWZhY3RvciBjb2Rlcy4NCg0KQ2hhbmdlLUlkOiBJMjY3MDhjMTYzZGI5NDNmZjhk
OTMwZGQ4MWJjYWI0YjRiOWQ4NGViMg0KU2lnbmVkLW9mZi1ieTogRmxvcmEgQ3VpIDxmbG9yYS5j
dWlAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYu
YyB8IDEzICsrKysrKysrKy0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jDQpp
bmRleCBlNzRhMTc1Li5lNDQ4ZjhlIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2Rydi5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZHJ2LmMNCkBAIC0yNDUsNyArMjQ1LDggQEAgbW9kdWxlX3BhcmFtX25hbWVkKG1zaSwgYW1k
Z3B1X21zaSwgaW50LCAwNDQ0KTsNCiAgKiBCeSBkZWZhdWx0KHdpdGggbm8gbG9ja3VwX3RpbWVv
dXQgc2V0dGluZ3MpLCB0aGUgdGltZW91dCBmb3IgYWxsIG5vbi1jb21wdXRlKEdGWCwgU0RNQSBh
bmQgVmlkZW8pDQogICogam9icyBpcyAxMDAwMC4gQW5kIHRoZXJlIGlzIG5vIHRpbWVvdXQgZW5m
b3JjZWQgb24gY29tcHV0ZSBqb2JzLg0KICAqLw0KLU1PRFVMRV9QQVJNX0RFU0MobG9ja3VwX3Rp
bWVvdXQsICJHUFUgbG9ja3VwIHRpbWVvdXQgaW4gbXMgKGRlZmF1bHQ6IDEwMDAwIGZvciBub24t
Y29tcHV0ZSBqb2JzIGFuZCBubyB0aW1lb3V0IGZvciBjb21wdXRlIGpvYnMpLCAiDQorTU9EVUxF
X1BBUk1fREVTQyhsb2NrdXBfdGltZW91dCwgIkdQVSBsb2NrdXAgdGltZW91dCBpbiBtcyAoZGVm
YXVsdDogMTAwMDAgZm9yIG5vbi1jb21wdXRlIGpvYnMgYW5kIGluZmluaXR5IHRpbWVvdXQgZm9y
IGNvbXB1dGUgam9icy4iDQorCQkiIDA6IGtlZXAgZGVmYXVsdCB2YWx1ZS4gbmVnYXRpdmU6IGlu
ZmluaXR5IHRpbWVvdXQpLCAiDQogCQkiZm9ybWF0IGlzIFtOb24tQ29tcHV0ZV0gb3IgW0dGWCxD
b21wdXRlLFNETUEsVmlkZW9dIik7ICBtb2R1bGVfcGFyYW1fc3RyaW5nKGxvY2t1cF90aW1lb3V0
LCBhbWRncHVfbG9ja3VwX3RpbWVvdXQsIHNpemVvZihhbWRncHVfbG9ja3VwX3RpbWVvdXQpLCAw
NDQ0KTsNCiANCkBAIC0xMzAwLDcgKzEzMDEsOCBAQCBpbnQgYW1kZ3B1X2RldmljZV9nZXRfam9i
X3RpbWVvdXRfc2V0dGluZ3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQogCSAqIEJ5IGRl
ZmF1bHQgdGltZW91dCBmb3Igbm9uIGNvbXB1dGUgam9icyBpcyAxMDAwMC4NCiAJICogQW5kIHRo
ZXJlIGlzIG5vIHRpbWVvdXQgZW5mb3JjZWQgb24gY29tcHV0ZSBqb2JzLg0KIAkgKi8NCi0JYWRl
di0+Z2Z4X3RpbWVvdXQgPSBhZGV2LT5zZG1hX3RpbWVvdXQgPSBhZGV2LT52aWRlb190aW1lb3V0
ID0gMTAwMDA7DQorCWFkZXYtPmdmeF90aW1lb3V0ID0gbXNlY3NfdG9famlmZmllcygxMDAwMCk7
DQorCWFkZXYtPnNkbWFfdGltZW91dCA9IGFkZXYtPnZpZGVvX3RpbWVvdXQgPSBhZGV2LT5nZnhf
dGltZW91dDsNCiAJYWRldi0+Y29tcHV0ZV90aW1lb3V0ID0gTUFYX1NDSEVEVUxFX1RJTUVPVVQ7
DQogDQogCWlmIChzdHJubGVuKGlucHV0LCBBTURHUFVfTUFYX1RJTUVPVVRfUEFSQU1fTEVOVEgp
KSB7IEBAIC0xMzEwLDEwICsxMzEyLDEzIEBAIGludCBhbWRncHVfZGV2aWNlX2dldF9qb2JfdGlt
ZW91dF9zZXR0aW5ncyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCiAJCQlpZiAocmV0KQ0K
IAkJCQlyZXR1cm4gcmV0Ow0KIA0KLQkJCS8qIEludmFsaWRhdGUgMCBhbmQgbmVnYXRpdmUgdmFs
dWVzICovDQotCQkJaWYgKHRpbWVvdXQgPD0gMCkgew0KKwkJCWlmICh0aW1lb3V0ID09IDApIHsN
CiAJCQkJaW5kZXgrKzsNCiAJCQkJY29udGludWU7DQorCQkJfSBlbHNlIGlmICh0aW1lb3V0IDwg
MCkgew0KKwkJCQl0aW1lb3V0ID0gTUFYX1NDSEVEVUxFX1RJTUVPVVQ7DQorCQkJfSBlbHNlIHsN
CisJCQkJdGltZW91dCA9IG1zZWNzX3RvX2ppZmZpZXModGltZW91dCk7DQogCQkJfQ0KIA0KIAkJ
CXN3aXRjaCAoaW5kZXgrKykgew0KLS0NCjIuNy40DQoNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
