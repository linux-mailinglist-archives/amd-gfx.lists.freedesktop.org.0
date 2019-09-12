Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CBAB0910
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Sep 2019 08:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 324016EB7C;
	Thu, 12 Sep 2019 06:58:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760058.outbound.protection.outlook.com [40.107.76.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 104106EB7C
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Sep 2019 06:58:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XINailKwtgNo1Po+HVLrO0e3ZHMHMG1VFxq5y9yL+Qt36EeAA2Z2M/cDMvsAfMDHy+D2n7fqwjbCUpM8PKODCs4s17mlw3SZs1f8stBz66NXRgoU2EVGsSx5MZyHenJprbHizKZYlLjje/93PRSPl2uKM1M6cybNQKoHk4TZrTnkNty1OYGJUTL9dKwZj8S0w231KMKDyi7Fq+HvxOd68iwkkH17nchqVy6I6cq67HGuJtubJkrNmK0akqOKYlARzOcE0VS3390gBMvg/MitgfddbgMbiYqr+sYdlKovXX/HdfQdRPeRx1xImj5GtCWZkbydrA5v4RTC7BlcImcg1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=54SUN3dRhJ+79DwwoyxqRFlLUohV341wkWXYf7J2jMk=;
 b=gSievHtGYCK/+dc5jBKRNUIsRv5cvhVs3LHbMXMPeAlr+0JL38RfuRZDoOVpybBbgoY7EbBkHTJnaGQwpi/aPQOF/B8QPVTUmp843/WDPIxHwR4dez9oDJk6Krs0fW6q7Jdn3teIqlZPa16PVftM+KOkpRWFzPwnmToNCQE0l8z0gtGetQh9Q7XcsYdfubH6H60PdA4yQH6tRIxKy9cLc2bY1uev5/6aySWCBlUFfEtBRNacLQQ8StABov45feaU5XFvjTGv4D+XH0EHJddSHXa7qRLIv3yXgOjulN+4oOUpiG3W/4x1d4uUPsoatUZ1fanr9DMy5Ml9EGzX+dVkFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3248.namprd12.prod.outlook.com (20.179.80.74) by
 MN2PR12MB3552.namprd12.prod.outlook.com (20.179.80.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.15; Thu, 12 Sep 2019 06:58:35 +0000
Received: from MN2PR12MB3248.namprd12.prod.outlook.com
 ([fe80::ad48:9c35:d74d:8e20]) by MN2PR12MB3248.namprd12.prod.outlook.com
 ([fe80::ad48:9c35:d74d:8e20%6]) with mapi id 15.20.2263.016; Thu, 12 Sep 2019
 06:58:35 +0000
From: "S, Shirish" <sshankar@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "S, Shirish"
 <Shirish.S@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Huang, Ray"
 <Ray.Huang@amd.com>
Subject: Re: [PATCH] drm/amdgpu: fix build error without CONFIG_HSA_AMD (V2)
Thread-Topic: [PATCH] drm/amdgpu: fix build error without CONFIG_HSA_AMD (V2)
Thread-Index: AQHVaG2HB6z7JcsTPE2B5uyPrFeG+acnB3KAgACXsAA=
Date: Thu, 12 Sep 2019 06:58:35 +0000
Message-ID: <d547a716-d749-7a33-b125-7c785cd9b953@amd.com>
References: <1568184761-20949-1-git-send-email-shirish.s@amd.com>
 <f78eeb5d-bc32-b72b-8d1b-3fdee9ea43db@amd.com>
In-Reply-To: <f78eeb5d-bc32-b72b-8d1b-3fdee9ea43db@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MA1PR01CA0151.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::21) To MN2PR12MB3248.namprd12.prod.outlook.com
 (2603:10b6:208:a9::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.157.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d81cc438-8e7c-4b9a-def2-08d7374ea17b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3552; 
x-ms-traffictypediagnostic: MN2PR12MB3552:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB35524D57423685B0028BB349F2B00@MN2PR12MB3552.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(346002)(136003)(396003)(39860400002)(189003)(199004)(26005)(64756008)(31686004)(66556008)(7736002)(110136005)(71200400001)(2906002)(14454004)(71190400001)(8676002)(3846002)(36756003)(256004)(305945005)(6116002)(6636002)(478600001)(81166006)(4326008)(8936002)(66946007)(81156014)(6512007)(6506007)(66476007)(386003)(53546011)(5660300002)(25786009)(316002)(66066001)(6246003)(446003)(102836004)(52116002)(66446008)(53936002)(31696002)(476003)(76176011)(2616005)(486006)(11346002)(186003)(6486002)(99286004)(229853002)(6436002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3552;
 H:MN2PR12MB3248.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XJEMm33JU7CC15Yznu7M1EwKBhGm2EVCdevCeQEDO7+zLMNogl6IHE2kC8wKnLHexaX3GzV4FJzFmsrCYW76015Wgt2dPOtA3j+0TAVW9bGfU5wyIY/iGna7PTDBm0fBppXGB3I5gNG2YCA3zH4eoOSmMfRo5yb6m8vVcxi8q0swaV43fRQBzktr8vN7Fo7hZ8ZGp+fgBpOG5SFvqD8gO8Od7tAws1Itz476EChLBI91OexP12D68ucEMViOqTNO4rkPLP2VldfYBtVzIG6AX+rXNTNRmqqXvldT/D748HX2omWL0uCKLFoOk6AAhvHPsFtewa55Pg4XS6gp1Mq8qJ4aaFZOf+RZ/1MYZG6Iw5G86Hqdohl15n5x/sHOC9/05QjvkZlySHM2mGYhQEU+0GUGQQvkVm7F9TMZRWf496c=
Content-ID: <F63372CABC06A54BAF1952EA9A14BB14@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d81cc438-8e7c-4b9a-def2-08d7374ea17b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 06:58:35.6009 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wONZU2EEMeV4xw4Fy+9bP3gsKX3aB6dhb5ij+ZAeuSN6R69TPg9ZynNHW3WetSCEb76lkKEFYEqdo7q8LF47Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3552
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=54SUN3dRhJ+79DwwoyxqRFlLUohV341wkWXYf7J2jMk=;
 b=hpZhjCH6zOxS78xffVkZIoGBmBmOSBjKEDpo+edR2ph5No/gm7A9uwwrW8yI2GGKwds2u/6ToPW9PNTzaPnhM2svGV7Sk9mKjqhOQFOiqOnhzTLHVw8lJ1Wc41SNJdE6NCoGfjyihjitHfetF1dWibkHCLcGgtKF7cal06os1Hw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Shirish.S@amd.com; 
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQpPbiA5LzEyLzIwMTkgMzoyOSBBTSwgS3VlaGxpbmcsIEZlbGl4IHdyb3RlOg0KPiBPbiAyMDE5
LTA5LTExIDI6NTIgYS5tLiwgUywgU2hpcmlzaCB3cm90ZToNCj4+IElmIENPTkZJR19IU0FfQU1E
IGlzIG5vdCBzZXQsIGJ1aWxkIGZhaWxzOg0KPj4NCj4+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kZXZpY2UubzogSW4gZnVuY3Rpb24gYGFtZGdwdV9kZXZpY2VfaXBfZWFybHlf
aW5pdCc6DQo+PiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmM6MTYy
NjogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgc2NoZWRfcG9saWN5Jw0KPj4NCj4+IFVzZSBDT05G
SUdfSFNBX0FNRCB0byBndWFyZCB0aGlzLg0KPj4NCj4+IEZpeGVzOiAxYWJiNjgwYWQzNzEgKCJk
cm0vYW1kZ3B1OiBkaXNhYmxlIGdmeG9mZiB3aGlsZSB1c2Ugbm8gSC9XIHNjaGVkdWxpbmcgcG9s
aWN5IikNCj4+DQo+PiBWMjogZGVjbGFyZSBzY2hlZF9wb2xpY3kgaW4gYW1kZ3B1LmggYW5kIHJl
bW92ZSBjaGFuZ2VzIGluIGFtZGdwdV9kZXZpY2UuYw0KPiBXaGljaCBicmFuY2ggaXMgdGhpcyBm
b3IuIFYxIG9mIHRoaXMgcGF0Y2ggd2FzIGFscmVhZHkgc3VibWl0dGVkIHRvDQo+IGFtZC1zdGFn
aW5nLWRybS1uZXh0LiBTbyB1bmxlc3MgeW91J3JlIHBsYW5uaW5nIHRvIHJldmVydCB2MSBhbmQg
c3VibWl0DQo+IHYyLCBJIHdhcyBleHBlY3RpbmcgdG8gc2VlIGEgY2hhbmdlIHRoYXQgZml4ZXMg
dXAgdGhlIHByZXZpb3VzIHBhdGNoLA0KPiByYXRoZXIgdGhhbiBhIHBhdGNoIHRoYXQgcmVwbGFj
ZXMgaXQuDQoNCkhhdmUgc2VudCBhIHBhdGNoIHRoYXQgZml4ZXMgdXAgcHJldmlvdXMgcGF0Y2gg
YXMgd2VsbC4NCg0KQXBwYXJlbnRseSwgSSBkaWQgbm90IHNlbmQgdGhlIHJldmVydCBidXQgbXkg
cGxhbiB3YXMgdG8gcmV2ZXJ0IGFuZCBvbmx5IA0KdGhlbiBzdWJtaXQgVjIuDQoNCkFueXdheXMg
Ym90aCB3b3JrIGZvciBtZSBhcyBsb25nIGFzIHRoZSBrZXJuZWwgYnVpbGRzLg0KDQpSZWdhcmRz
LA0KDQpTaGlyaXNoIFMNCg0KPiBSZWdhcmRzLA0KPiAgIMKgIEZlbGl4DQo+DQo+DQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBTaGlyaXNoIFMgPHNoaXJpc2guc0BhbWQuY29tPg0KPj4gLS0tDQo+PiAgICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCB8IDQgKysrKw0KPj4gICAgMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdS5oDQo+PiBpbmRleCAxMDMwY2IzLi42ZmYwMmJiIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdS5oDQo+PiBAQCAtMTY5LDcgKzE2OSwxMSBAQCBleHRlcm4gaW50IGFt
ZGdwdV9kaXNjb3Zlcnk7DQo+PiAgICBleHRlcm4gaW50IGFtZGdwdV9tZXM7DQo+PiAgICBleHRl
cm4gaW50IGFtZGdwdV9ub3JldHJ5Ow0KPj4gICAgZXh0ZXJuIGludCBhbWRncHVfZm9yY2VfYXNp
Y190eXBlOw0KPj4gKyNpZmRlZiBDT05GSUdfSFNBX0FNRA0KPj4gICAgZXh0ZXJuIGludCBzY2hl
ZF9wb2xpY3k7DQo+PiArI2Vsc2UNCj4+ICtzdGF0aWMgY29uc3QgaW50IHNjaGVkX3BvbGljeSA9
IEtGRF9TQ0hFRF9QT0xJQ1lfSFdTOw0KPj4gKyNlbmRpZg0KPj4gICAgDQo+PiAgICAjaWZkZWYg
Q09ORklHX0RSTV9BTURHUFVfU0kNCj4+ICAgIGV4dGVybiBpbnQgYW1kZ3B1X3NpX3N1cHBvcnQ7
DQoNCi0tIA0KUmVnYXJkcywNClNoaXJpc2ggUw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
