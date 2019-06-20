Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD2A4DAB2
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2019 21:51:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A0786E519;
	Thu, 20 Jun 2019 19:51:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780052.outbound.protection.outlook.com [40.107.78.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361CE6E519
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 Jun 2019 19:51:25 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2531.namprd12.prod.outlook.com (52.132.11.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.13; Thu, 20 Jun 2019 19:51:22 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::991:7474:933e:d61]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::991:7474:933e:d61%4]) with mapi id 15.20.1987.014; Thu, 20 Jun 2019
 19:51:22 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/1] drm/amdkfd: Print a warning when the runlist becomes
 oversubscribed
Thread-Topic: [PATCH 1/1] drm/amdkfd: Print a warning when the runlist becomes
 oversubscribed
Thread-Index: AQHVJ6Bu8AHyw8lXiEi/31pwu70W9qak87mg
Date: Thu, 20 Jun 2019 19:51:22 +0000
Message-ID: <BL0PR12MB25805C64CAB8BA6D5E420F9780E40@BL0PR12MB2580.namprd12.prod.outlook.com>
References: <20190620194309.11148-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190620194309.11148-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.228.209.96]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8233aede-8bff-4bf1-f5b2-08d6f5b8abb9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2531; 
x-ms-traffictypediagnostic: BL0PR12MB2531:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BL0PR12MB253114F7442FF1833C4335A880E40@BL0PR12MB2531.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(136003)(396003)(366004)(376002)(13464003)(199004)(189003)(71200400001)(68736007)(9686003)(55016002)(6246003)(6436002)(66066001)(74316002)(26005)(71190400001)(186003)(305945005)(86362001)(7696005)(99286004)(6506007)(53546011)(6306002)(102836004)(76176011)(8936002)(2906002)(33656002)(229853002)(7736002)(446003)(81166006)(81156014)(2501003)(486006)(11346002)(66476007)(476003)(25786009)(8676002)(64756008)(66556008)(66946007)(73956011)(66446008)(52536014)(76116006)(966005)(5660300002)(110136005)(72206003)(6116002)(3846002)(478600001)(14454004)(4326008)(316002)(14444005)(256004)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2531;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: t7zpOOhOtaEOcpH0hQfHyX45VbfQeWMcCvxH8Rg+XPzeq2sP1Q6H0z4/GvmIkkGEwEqIkrXVFVTTWAKlI9yFX9+Q1faIXYOn3HPnSW/SN52XTjvobdiy9iuot3nSorHGyoDG6jaN5PYe0/V+9ALhyRrwTXdlJy14OWm6YnJiQcabscDLoddK632Ju9s7WeVF2/uZXfEHecajaBdzzFRhrHGyU0pdtklSLqhrReZNwHcxoa3Et8ue6oBR4ONaaAEgD6Vb7wfYRU/J80KpW8ZQkxH5x0xJRdXuFTBK7auUJ/Eh9TFnucAy5BTgwYFKwilM/a4qo5J1samNiMe7zx6XK67XRfePzAESgucN9C9r+xy0VDDN1WVhLbr9wzUsvHhC/H7lnBvpLYpE0ntfK4crAGKVq6vB6CXPIaT+OF5ij/4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8233aede-8bff-4bf1-f5b2-08d6f5b8abb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 19:51:22.1663 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2531
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e8FL53+fdS36PZnPY6U0JWPsiAMlhwIpf5wDp+9n7V4=;
 b=qxBIit3jCd1oHPWpiGgoKCixRBHi0i8tMMABc8/xg/CzKybgV+08D+CvM+/fQpx/65NeJ7tcL9sTDAujPsy87u5KZulSdi9IAKQHzkBBdCAoVLqfAyj/O6Prz5BM0tI//szyF5KsyOYbPNXXBPbRFPKZX8AYYHPelKIZONkZciA=
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IE9hayBaZW5nIDxPYWsuWmVuZ0BhbWQuY29tPg0KDQpSZWdhcmRzLA0KT2Fr
DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgS3VlaGxpbmcsIEZlbGl4
DQpTZW50OiBUaHVyc2RheSwgSnVuZSAyMCwgMjAxOSAzOjQzIFBNDQpUbzogYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBLdWVobGluZywgRmVsaXggPEZlbGl4Lkt1ZWhsaW5nQGFt
ZC5jb20+DQpTdWJqZWN0OiBbUEFUQ0ggMS8xXSBkcm0vYW1ka2ZkOiBQcmludCBhIHdhcm5pbmcg
d2hlbiB0aGUgcnVubGlzdCBiZWNvbWVzIG92ZXJzdWJzY3JpYmVkDQoNCk92ZXJzdWJzY3JpcHRp
b24gb2YgcXVldWVzIG9yIHByb2Nlc3NlcyByZXN1bHRzIGluIHBvb3IgcGVyZm9ybWFuY2UgbW9z
dGx5IGJlY2F1c2UgSFdTIGJsaW5ibHkgc2NoZWR1bGVzIGJ1c3kgYW5kIGlkbGUgcXVldWVzLCBy
ZXN1bHRpbmcgaW4gcG9vciBvY2N1cGFuY3kgaWYgbWFueSBxdWV1ZXMgYXJlIGlkbGUuDQoNCkxl
dCB1c2VycyBrbm93IHdpdGggYSB3YXJuaW5nIG1lc3NhZ2Ugd2hlbiB0cmFuc2l0aW9uaW5nIGZy
b20gYSBub24tb3ZlcnN1YnNjcmliZWQgdG8gYW4gb3ZlcnN1YnNjcmliZWQgcnVubGlzdC4NCg0K
U2lnbmVkLW9mZi1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQot
LS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcGFja2V0X21hbmFnZXIuYyB8IDYg
KysrKystDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaCAgICAgICAgICAg
fCAxICsNCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0K
DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3BhY2tldF9tYW5h
Z2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcGFja2V0X21hbmFnZXIuYw0K
aW5kZXggYzcyYzhmNWZkNTRjLi5jY2Y2YjIzMTAzMTYgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfcGFja2V0X21hbmFnZXIuYw0KKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX3BhY2tldF9tYW5hZ2VyLmMNCkBAIC0yMDMsMTEgKzIwMywxNSBA
QCBzdGF0aWMgaW50IHBtX2NyZWF0ZV9ydW5saXN0X2liKHN0cnVjdCBwYWNrZXRfbWFuYWdlciAq
cG0sDQogDQogCXByX2RlYnVnKCJGaW5pc2hlZCBtYXAgcHJvY2VzcyBhbmQgcXVldWVzIHRvIHJ1
bmxpc3RcbiIpOw0KIA0KLQlpZiAoaXNfb3Zlcl9zdWJzY3JpcHRpb24pDQorCWlmIChpc19vdmVy
X3N1YnNjcmlwdGlvbikgew0KKwkJaWYgKCFwbS0+aXNfb3Zlcl9zdWJzY3JpcHRpb24pDQorCQkJ
cHJfd2FybigiUnVubGlzdCBpcyBnZXR0aW5nIG92ZXJzdWJzY3JpYmVkLiBFeHBlY3QgcmVkdWNl
ZCBST0NtIA0KK3BlcmZvcm1hbmNlLlxuIik7DQogCQlyZXR2YWwgPSBwbS0+cG1mLT5ydW5saXN0
KHBtLCAmcmxfYnVmZmVyW3JsX3dwdHJdLA0KIAkJCQkJKnJsX2dwdV9hZGRyLA0KIAkJCQkJYWxs
b2Nfc2l6ZV9ieXRlcyAvIHNpemVvZih1aW50MzJfdCksDQogCQkJCQl0cnVlKTsNCisJfQ0KKwlw
bS0+aXNfb3Zlcl9zdWJzY3JpcHRpb24gPSBpc19vdmVyX3N1YnNjcmlwdGlvbjsNCiANCiAJZm9y
IChpID0gMDsgaSA8IGFsbG9jX3NpemVfYnl0ZXMgLyBzaXplb2YodWludDMyX3QpOyBpKyspDQog
CQlwcl9kZWJ1ZygiMHglMlggIiwgcmxfYnVmZmVyW2ldKTsNCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX3ByaXYuaA0KaW5kZXggNDA3MGU2ZDI0ZWY3Li5kNGJiYTAxMjRkMjkgMTAwNjQ0DQot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oDQorKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oDQpAQCAtOTM3LDYgKzkzNyw3IEBAIHN0cnVj
dCBwYWNrZXRfbWFuYWdlciB7DQogCWJvb2wgYWxsb2NhdGVkOw0KIAlzdHJ1Y3Qga2ZkX21lbV9v
YmogKmliX2J1ZmZlcl9vYmo7DQogCXVuc2lnbmVkIGludCBpYl9zaXplX2J5dGVzOw0KKwlib29s
IGlzX292ZXJfc3Vic2NyaXB0aW9uOw0KIA0KIAljb25zdCBzdHJ1Y3QgcGFja2V0X21hbmFnZXJf
ZnVuY3MgKnBtZjsgIH07DQotLQ0KMi4xNy4xDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0KYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
