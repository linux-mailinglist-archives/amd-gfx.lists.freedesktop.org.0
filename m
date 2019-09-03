Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 113D9A61CE
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 08:52:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50358945A;
	Tue,  3 Sep 2019 06:52:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680056.outbound.protection.outlook.com [40.107.68.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 513288945A
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Sep 2019 06:52:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQnv4NbkzJpZ5rMrEYJuyYBnKheYKNx8vJCR5hhMe6bTUDsrXgDZg5d2/nyBMrprpaKPHPoNlseXrtRFHo896E0yxlktNefm76wtCtK2KuJ9P73gmG19xygCh2e3KZq/F57Jz0YRqLTofdn9qGXBqmuqSNudMiKxG8d7Ibqd/cqdwXEY0WXMxu4RDDFBxFKuJFacthaf3GSC4V2EWrqGB4vhdDPpbYJ2JGmilkHlYtYyI+0ZwoJcUD09Pi0PnwipGK4JpTNrBdLcW+f8nuwF0gw8Xnq/nw4529866SmhH4IBJSHr1r6LArvlXdvuS5gQ57w6JqJAg7Q9ku1d37RMTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=up8sw4MKdmScUdkcR/0YFPUIa01MGX+ahg2/C2px/4k=;
 b=In28ik5E+GyYlKo1xeivvb2RQW1MJsDRh90+jBtMKusNiYuixA/3eq1J+ls6pFVLw2Yc4E5eqqD/iGtCXo4IHr6fuwb/lnUTSzA87DdBNau0WmxzYtnDAxACaWmlaKg7bez43VypH/KIQZzHALX0F9dtV5qPJ22Z5Q2dvOe+eFP/NQiZKIH6+mineqNSlBeiAiWJVfUw2ZE2ldOAM17pFOsrmblVQarOS2rLgJ08AvRp7vY3i3J47B2nWgT/UohRalc+ajxBrnJIlhmbULiQcyzYu5vez1JG5vmeCJr1IdlvGyHECc8M4X7TQwuEvVmlcHFSuLTe/hbch59mr4SG7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2910.namprd12.prod.outlook.com (20.179.81.219) by
 MN2PR12MB3103.namprd12.prod.outlook.com (20.178.241.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Tue, 3 Sep 2019 06:52:05 +0000
Received: from MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::79c0:d856:da12:c4b2]) by MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::79c0:d856:da12:c4b2%2]) with mapi id 15.20.2220.021; Tue, 3 Sep 2019
 06:52:05 +0000
From: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/3] drm/amdgpu: reserve at least 4MB of VRAM for page
 tables
Thread-Topic: [PATCH 2/3] drm/amdgpu: reserve at least 4MB of VRAM for page
 tables
Thread-Index: AQHVYXyDg3FIKz8Rp0SY7lNYAZ3xX6cZhR4w
Date: Tue, 3 Sep 2019 06:52:05 +0000
Message-ID: <MN2PR12MB29104DDA4EBB320F67988981B4B90@MN2PR12MB2910.namprd12.prod.outlook.com>
References: <20190902105219.2813-1-christian.koenig@amd.com>
 <20190902105219.2813-2-christian.koenig@amd.com>
In-Reply-To: <20190902105219.2813-2-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 00a77d8c-0753-477e-66f8-08d7303b3b7a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3103; 
x-ms-traffictypediagnostic: MN2PR12MB3103:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB31039A8AAF14F2DDABAF9468B4B90@MN2PR12MB3103.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(346002)(366004)(396003)(136003)(189003)(199004)(13464003)(81166006)(86362001)(476003)(66476007)(74316002)(76116006)(11346002)(81156014)(446003)(55016002)(66946007)(486006)(25786009)(8936002)(110136005)(316002)(8676002)(99286004)(14444005)(256004)(102836004)(33656002)(966005)(7736002)(305945005)(478600001)(14454004)(2906002)(66556008)(66066001)(26005)(7696005)(6116002)(3846002)(76176011)(53546011)(6506007)(52536014)(186003)(2501003)(53936002)(5660300002)(6436002)(6246003)(71190400001)(9686003)(66574012)(6306002)(71200400001)(229853002)(64756008)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3103;
 H:MN2PR12MB2910.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5Qj3EuKoBq8ESQzA+VpFwymxV99UV9WRFQMjqP26FRrmFR5J0mw0Xv+78iu1WW2B23NCXppHUJTjKDPG+jXNzs2qQlTlQsA8X5bCabvbUpjseqsG843G6SkbJpyy6ND8awYkwkJrPQot53SnYcxhzWhX5oou1nX9o5PO8R4RzaEVRm7mdCpQTt/1PDc6fCEEH9cQHqABlwl6SaF2Gif9iCsT4Cqo8L/r8X0rZ1qgZ5EKu71DbJ/FwDFY+O83U3ynD7hlj5Q/ckn1dogoTqs2dvTVvNPCmntvPuBcovlcG2C6ey6PHIQpynRzlAYVte6MH/dv5r5w+gjK3g3hR4wuHTf13m19nxnT0PTw5XDMLk6cPRXaJmvDJJgPS7iISDJNScc1CYnmGq6CkRtQ6EHavK3PPI32rvYNsQF8/WcHkKw=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00a77d8c-0753-477e-66f8-08d7303b3b7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 06:52:05.3127 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3hhSJ0kR/2gRNYulx49sljv3T1UDF1T7Ala6VufeBTcRKH6YYvB6DQeWxjqYUmPb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3103
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=up8sw4MKdmScUdkcR/0YFPUIa01MGX+ahg2/C2px/4k=;
 b=d4NDwRhiycaYkFGoCg0Nx7qlAvHURjbmA1n75cy61TuuzpfFglQdi8mdG7IzPovoasATABJc4NvyVPtxWMvECr19aC2/OceBohak4gNv64tEXeV69arPtkCdM/Hmj3jnutiae9pTA0suofrvd076oB3ni8S5l4AiQ6WoiYj9Qqk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=David1.Zhou@amd.com; 
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

RG8geW91IG5lZWQgdXBkYXRlIHRoZSB2cmFtIHNpemUgcmVwb3J0ZWQgdG8gVU1EID8NCg0KLURh
dmlkDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4
LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgQ2hyaXN0aWFuIEvD
tm5pZw0KU2VudDogTW9uZGF5LCBTZXB0ZW1iZXIgMiwgMjAxOSA2OjUyIFBNDQpUbzogYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNClN1YmplY3Q6IFtQQVRDSCAyLzNdIGRybS9hbWRncHU6
IHJlc2VydmUgYXQgbGVhc3QgNE1CIG9mIFZSQU0gZm9yIHBhZ2UgdGFibGVzDQoNClRoaXMgaG9w
ZWZ1bGx5IGhlbHBzIHJlZHVjZSB0aGUgY29udGVudGlvbiBmb3IgcGFnZSB0YWJsZXMuDQoNClNp
Z25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4N
Ci0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oICAgICAgIHwgMyAr
KysNCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYyB8IDkgKysr
KysrKy0tDQogMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmgg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uaA0KaW5kZXggMmVkYTNhOGMz
MzBkLi4zMzUyYTg3YjgyMmUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdm0uaA0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zt
LmgNCkBAIC05OSw2ICs5OSw5IEBAIHN0cnVjdCBhbWRncHVfYm9fbGlzdF9lbnRyeTsNCiAjZGVm
aW5lIEFNREdQVV9WTV9GQVVMVF9TVE9QX0ZJUlNUCTENCiAjZGVmaW5lIEFNREdQVV9WTV9GQVVM
VF9TVE9QX0FMV0FZUwkyDQogDQorLyogUmVzZXJ2ZSA0TUIgVlJBTSBmb3IgcGFnZSB0YWJsZXMg
Ki8NCisjZGVmaW5lIEFNREdQVV9WTV9SRVNFUlZFRF9WUkFNCQkoNFVMTCA8PCAyMCkNCisNCiAv
KiBtYXggbnVtYmVyIG9mIFZNSFVCICovDQogI2RlZmluZSBBTURHUFVfTUFYX1ZNSFVCUwkJCTMN
CiAjZGVmaW5lIEFNREdQVV9HRlhIVUJfMAkJCQkwDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdnJhbV9tZ3IuYw0KaW5kZXggMTE1MGUzNGJjMjhmLi41OTQ0MGY3MWQzMDQg
MTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3Iu
Yw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMNCkBA
IC0yNCw2ICsyNCw3IEBADQogDQogI2luY2x1ZGUgPGRybS9kcm1QLmg+DQogI2luY2x1ZGUgImFt
ZGdwdS5oIg0KKyNpbmNsdWRlICJhbWRncHVfdm0uaCINCiANCiBzdHJ1Y3QgYW1kZ3B1X3ZyYW1f
bWdyIHsNCiAJc3RydWN0IGRybV9tbSBtbTsNCkBAIC0yNzYsNyArMjc3LDcgQEAgc3RhdGljIGlu
dCBhbWRncHVfdnJhbV9tZ3JfbmV3KHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuLA0K
IAlzdHJ1Y3QgZHJtX21tX25vZGUgKm5vZGVzOw0KIAllbnVtIGRybV9tbV9pbnNlcnRfbW9kZSBt
b2RlOw0KIAl1bnNpZ25lZCBsb25nIGxwZm4sIG51bV9ub2RlcywgcGFnZXNfcGVyX25vZGUsIHBh
Z2VzX2xlZnQ7DQotCXVpbnQ2NF90IHZpc191c2FnZSA9IDAsIG1lbV9ieXRlczsNCisJdWludDY0
X3QgdmlzX3VzYWdlID0gMCwgbWVtX2J5dGVzLCBtYXhfYnl0ZXM7DQogCXVuc2lnbmVkIGk7DQog
CWludCByOw0KIA0KQEAgLTI4NCw5ICsyODUsMTMgQEAgc3RhdGljIGludCBhbWRncHVfdnJhbV9t
Z3JfbmV3KHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuLA0KIAlpZiAoIWxwZm4pDQog
CQlscGZuID0gbWFuLT5zaXplOw0KIA0KKwltYXhfYnl0ZXMgPSBhZGV2LT5nbWMubWNfdnJhbV9z
aXplOw0KKwlpZiAodGJvLT50eXBlICE9IHR0bV9ib190eXBlX2tlcm5lbCkNCisJCW1heF9ieXRl
cyAtPSBBTURHUFVfVk1fUkVTRVJWRURfVlJBTTsNCisNCiAJLyogYmFpbCBvdXQgcXVpY2tseSBp
ZiB0aGVyZSdzIGxpa2VseSBub3QgZW5vdWdoIFZSQU0gZm9yIHRoaXMgQk8gKi8NCiAJbWVtX2J5
dGVzID0gKHU2NCltZW0tPm51bV9wYWdlcyA8PCBQQUdFX1NISUZUOw0KLQlpZiAoYXRvbWljNjRf
YWRkX3JldHVybihtZW1fYnl0ZXMsICZtZ3ItPnVzYWdlKSA+IGFkZXYtPmdtYy5tY192cmFtX3Np
emUpIHsNCisJaWYgKGF0b21pYzY0X2FkZF9yZXR1cm4obWVtX2J5dGVzLCAmbWdyLT51c2FnZSkg
PiBtYXhfYnl0ZXMpIHsNCiAJCWF0b21pYzY0X3N1YihtZW1fYnl0ZXMsICZtZ3ItPnVzYWdlKTsN
CiAJCW1lbS0+bW1fbm9kZSA9IE5VTEw7DQogCQlyZXR1cm4gMDsNCi0tIA0KMi4xNy4xDQoNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1h
aWxpbmcgbGlzdA0KYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
