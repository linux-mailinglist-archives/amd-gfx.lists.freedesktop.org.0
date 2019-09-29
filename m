Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7697CC12B0
	for <lists+amd-gfx@lfdr.de>; Sun, 29 Sep 2019 03:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED76D6E127;
	Sun, 29 Sep 2019 01:31:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770071.outbound.protection.outlook.com [40.107.77.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE2E6E127
 for <amd-gfx@lists.freedesktop.org>; Sun, 29 Sep 2019 01:31:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WGOKY0Hnedami+RYtJCG0JLAYfKBIRkBbS+ppvGIOFAQuyOS1DtETCf4xYDZXEkORqmCgTvtBhU+MqF2/CL8Oy3pQFbgQw8LHuh1wEQlQb9pe4dgOalRjtZGae5u43dkTqJgeD/DB8bLxUnKECkk7wVSz0ZoT55tno2LkFHyQ2tvMNYwgxV1fV0+KiFnNvrNAwZ+GJSthpM2cPmJtyWX34qF8PkPkzKqZOK1t1HgGCOf84B6WDScTgNH1VVFgYydAmgu/wvH5WRg2w2niKKfECE7Fyba7xlNYyszIJFjjq/bLA1uOmg4uy797N4UdYxgtFbpqIYX/C3J/omc3u6E3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XhD+2fgccWqn8odT8/EgPIiSorUJrS9Evtmhe+K549k=;
 b=GjUdc9jr7omYg3XpmBtCUjJMaLrbFXcZjExM+sfwPmuzonDbm5GYEjTwPzLBB7xq4412OUSrMEgWtXergjkrpriP4LnBH7gjUWE8ylQZTiUraxOHdLOIP6Rct5VR8Qjl6pTyyUcvPIQfcmLTSS50TEyIPj8I1vyJNiRuxq41I8wXykBYCbHj2ZlJcNrq/I3ekEr2xL42syKHbzNL/psgspF8bVHdK7fcH0mtMXKnFyDIhfC1EYVPE//z0ikO4eO5903kmE7GgW0KFWKqZaBxwN2+kjIis9QPXUS2xS+aia9BwqPbBNNi0n7LKyAxCY5GKsVxn7fcgV4ud2K+t78eCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3663.namprd12.prod.outlook.com (10.255.239.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Sun, 29 Sep 2019 01:31:33 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed%6]) with mapi id 15.20.2284.028; Sun, 29 Sep 2019
 01:31:33 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Zhang, Zhexi (Jesse)" <Zhexi.Zhang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: Protect backend resource when unload
 driver
Thread-Topic: [PATCH] drm/amd/powerplay: Protect backend resource when unload
 driver
Thread-Index: AQHVdRuJjY4dXq19ZkKPORfZn5t/xKdB4KVA
Date: Sun, 29 Sep 2019 01:31:33 +0000
Message-ID: <MN2PR12MB3344771815C6B66E3C2F0DD4E4830@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <1569578864-4558-1-git-send-email-zhexi.zhang@amd.com>
In-Reply-To: <1569578864-4558-1-git-send-email-zhexi.zhang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 26bd01e0-c03c-4294-df51-08d7447cc30d
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB3663:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB36633D57520C957AD1365BA7E4830@MN2PR12MB3663.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 017589626D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(39860400002)(346002)(366004)(199004)(189003)(13464003)(7696005)(81156014)(81166006)(54906003)(11346002)(99286004)(25786009)(7736002)(8676002)(66556008)(26005)(2906002)(446003)(55016002)(76116006)(316002)(71200400001)(71190400001)(110136005)(66476007)(66446008)(64756008)(2501003)(14444005)(305945005)(256004)(476003)(486006)(66946007)(74316002)(33656002)(53546011)(5660300002)(66066001)(52536014)(6506007)(229853002)(966005)(3846002)(4326008)(102836004)(478600001)(6436002)(86362001)(6306002)(14454004)(6116002)(8936002)(186003)(9686003)(76176011)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3663;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8yExlzlySFOdWQwiOnGgI2QqBeNHgwEXaBn1NkdXqty0j+Pfhp1hVYlsgGJ5E9THQu9H5A+1Xnj67ryg7Ee35L5FX8pD11M3n3oLz273gQflU81SJo/KJbvwqyLPykgq0enE2dXOWSthRoOaMkqhsWxe3/Y/hbJiO7ETnqRj7J9hEIAPNmROwvhg49uCH2ZXl1mzKT+LJYvupsWvf7E8xWySKQOD42ISkyhNnYUmHEZly0f70ZnrAgXH5Jnv5Dv0VK2WADqZV92kjBQwatxb/7kNETUSa8feA1VeP1AdSiO8askQSnn2Evod+C6q6ezK83m25kmzLbp1By3ONup9+iWvqFYhDX6QOwGJF+tLCkuccLbNd3vu/74MiqRKVI9Ia0YPAwwuQ8v1TmfULlZKNsmJYaBBJbCz21PL+0r3+NTLBE2yXtm0B+zAJvsnqLKKiiAVxYoIyYTaoZ795JfR4g==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26bd01e0-c03c-4294-df51-08d7447cc30d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2019 01:31:33.3945 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w7U9n69+di7NAS7UJII19Gd1onnmj6Bi4D7bEaiUzy9Mn5x5d7vMMYwDg+P0SNza
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3663
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XhD+2fgccWqn8odT8/EgPIiSorUJrS9Evtmhe+K549k=;
 b=VgJq0z6xpOwK0Uiv2lZG1hF76BkKR2mnSjOLR+BrSgJG93R0iXHvF49HXRjmA0brDD0waUbmBhoR0TKV1OOIdFbKLdOIW2spZvyEkr6Z500JGHYy9zTzDAsBQVBJM7SHhm9AkBGMUcp1KUf0c9w0aBv0N5G06Ez5m1ALNNw5i3g=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Cc: root <root@debian.debian>, "Zhang, Zhexi \(Jesse\)" <Zhexi.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgSmVzc2UgWmhhbmcNClNl
bnQ6IEZyaWRheSwgU2VwdGVtYmVyIDI3LCAyMDE5IDY6MDggUE0NClRvOiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZw0KQ2M6IHJvb3QgPHJvb3RAZGViaWFuLmRlYmlhbj47IFpoYW5nLCBa
aGV4aSAoSmVzc2UpIDxaaGV4aS5aaGFuZ0BhbWQuY29tPg0KU3ViamVjdDogW1BBVENIXSBkcm0v
YW1kL3Bvd2VycGxheTogUHJvdGVjdCBiYWNrZW5kIHJlc291cmNlIHdoZW4gdW5sb2FkIGRyaXZl
cg0KDQpGcm9tOiByb290IDxyb290QGRlYmlhbi5kZWJpYW4+DQoNCkd1ZXN0IGRyaXZlciBjYW4g
YmUgdW5sb2FkZWQgd2hpbGUgZW5naW5lcyBzdGlsbCB1c2luZyBzb21lIGJhY2tlbmQgcmVzb3Vy
Y2VzLiBUaGF0IHdvdWxkIGxlYWQgdG8gdXNlIGFmdGVyIGZyZWUgYW5kIHRoZW4gY2F1c2UgZ3Vl
c3QgZHJpdmVyIGZhaWxlZC4NCg0KTmVlZCB0byBhZGQgbXV0ZXggbG9jayBiZWZvcmUgYmFja2Vu
ZCByZXNvdXJjZXMgZnJlZSB0byBtYWtlIHN1cmUgbm9ib2R5IGlzIHVzaW5nIGl0Lg0KDQpOZWVk
IHRvIGNoZWNrIGJhY2tlbmQgZGF0YSBhdmFpbGFibGlsaXR5IGJlZm9yZSBWQ0UvVVZEIGVudGVy
IHBvd2VyZ2F0aW5nIG1vZGUsIGlmIGJhY2tlbmQgcmVzb3VyY2VzIGhhdmUgYmVlbiBmcmVlLCB0
aGVuIHNraXAgZW50ZXJpbmcgcG93ZXJnYXRpbmcuDQoNCkNoYW5nZS1JZDogSWY3ZjkzMjIxZGRl
Y2M1Nzg4ODRkYzllOTlhNTJmMjJhNDNlMTZiMDcNClNpZ25lZC1vZmYtYnk6IEplc3NlIFpoYW5n
IDx6aGV4aS56aGFuZ0BhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvaHdtZ3IvdmVnYTEwX2h3bWdyLmMgfCAxNCArKysrKysrKysrLS0tLQ0KIDEgZmlsZSBjaGFu
Z2VkLCAxMCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX2h3bWdyLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMTBfaHdtZ3IuYw0KaW5kZXggZDA4NDkz
Yi4uYTkzMjBhNSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3
bWdyL3ZlZ2ExMF9od21nci5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9o
d21nci92ZWdhMTBfaHdtZ3IuYw0KQEAgLTgxMCw4ICs4MTAsMTAgQEAgc3RhdGljIGludCB2ZWdh
MTBfaHdtZ3JfYmFja2VuZF9maW5pKHN0cnVjdCBwcF9od21nciAqaHdtZ3IpDQogCWtmcmVlKGh3
bWdyLT5keW5fc3RhdGUudmRkY19kZXBfb25fZGFsX3B3cmwpOw0KIAlod21nci0+ZHluX3N0YXRl
LnZkZGNfZGVwX29uX2RhbF9wd3JsID0gTlVMTDsNCiANCisJbXV0ZXhfbG9jaygmaHdtZ3ItPnNt
dV9sb2NrKTsNCiAJa2ZyZWUoaHdtZ3ItPmJhY2tlbmQpOw0KIAlod21nci0+YmFja2VuZCA9IE5V
TEw7DQorCW11dGV4X3VubG9jaygmaHdtZ3ItPnNtdV9sb2NrKTsNCiANCltRdWFuLCBFdmFuXSBQ
bGVhc2UgbW92ZSB0aGlzIGxvY2sgcHJvdGVjdGlvbiB0byB1cHBlciBsYXllcihhbWRfcG93ZXJw
bGF5LmMpIHNpbmNlIHRoYXQncyB3aGVyZSBhbGwgdGhlIGxvY2tzIHNob3VsZCBiZS4NCiAJcmV0
dXJuIDA7DQogfQ0KQEAgLTQ2MTksMTYgKzQ2MjEsMjAgQEAgc3RhdGljIHZvaWQgdmVnYTEwX3Bv
d2VyX2dhdGVfdmNlKHN0cnVjdCBwcF9od21nciAqaHdtZ3IsIGJvb2wgYmdhdGUpICB7DQogCXN0
cnVjdCB2ZWdhMTBfaHdtZ3IgKmRhdGEgPSBod21nci0+YmFja2VuZDsNCiANCi0JZGF0YS0+dmNl
X3Bvd2VyX2dhdGVkID0gYmdhdGU7DQotCXZlZ2ExMF9lbmFibGVfZGlzYWJsZV92Y2VfZHBtKGh3
bWdyLCAhYmdhdGUpOw0KKwlpZihkYXRhKXsNCisJCWRhdGEtPnZjZV9wb3dlcl9nYXRlZCA9IGJn
YXRlOw0KKwkJdmVnYTEwX2VuYWJsZV9kaXNhYmxlX3ZjZV9kcG0oaHdtZ3IsICFiZ2F0ZSk7DQor
CX0NCiB9DQogDQogc3RhdGljIHZvaWQgdmVnYTEwX3Bvd2VyX2dhdGVfdXZkKHN0cnVjdCBwcF9o
d21nciAqaHdtZ3IsIGJvb2wgYmdhdGUpICB7DQogCXN0cnVjdCB2ZWdhMTBfaHdtZ3IgKmRhdGEg
PSBod21nci0+YmFja2VuZDsNCiANCi0JZGF0YS0+dXZkX3Bvd2VyX2dhdGVkID0gYmdhdGU7DQot
CXZlZ2ExMF9lbmFibGVfZGlzYWJsZV91dmRfZHBtKGh3bWdyLCAhYmdhdGUpOw0KKwlpZihkYXRh
KXsNCisJCWRhdGEtPnV2ZF9wb3dlcl9nYXRlZCA9IGJnYXRlOw0KKwkJdmVnYTEwX2VuYWJsZV9k
aXNhYmxlX3V2ZF9kcG0oaHdtZ3IsICFiZ2F0ZSk7DQorCX0NCiB9DQogDQogc3RhdGljIGlubGlu
ZSBib29sIHZlZ2ExMF9hcmVfcG93ZXJfbGV2ZWxzX2VxdWFsKA0KLS0NCjIuNy40DQoNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1haWxp
bmcgbGlzdA0KYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
