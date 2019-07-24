Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF82723B9
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 03:31:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A80BE6E419;
	Wed, 24 Jul 2019 01:31:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680040.outbound.protection.outlook.com [40.107.68.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D2C16E419
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 01:31:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IIibv4VKWMXsYhZ0FEiAJJRrXy9l8rseJurFSrI98hXuyPn8/cqwdpUjs+u5V6bAc+pVfnTG5U9/KaYYiYeafMxwoQbYNz5Q2WQ7Cv1MxGWYvjZYO9M1gac3nwC6Ikshb71nTLdZDY71zBZYDk4wd5/URpgB18jugzPPcoGsNLk8PZq9HoNQ04eRPrNywMIkpEwx+VGZ2y+8nj9CxzoJ6iqVZLHkh27EZGaTFAYwQHchrEjM/8sQAPQhExUsYv22dFia+52K1e0gVxwZnzp0hqJm+ZQ0O6mxIh7Oob99dxMRdnmgRiD27XkPJtXWScq6iyfS7Emf8fjrCmmBjvu1qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3UB1lO2dnqHjBgSABuFgbPjS8RgJ/Bc05+ySyiiMI78=;
 b=Razy1OQAuCka7JSB+FvjgY3XRMpUfIFm0p+Zb1WC7XHBAfIvK6B2F5G6liVL0jVkrFvgl2KIAP8a6Iq1zgM/itBprWvHNU1mRAF5pXunlzZgXairvY1MfVamEOIosxb2+tLbn6Rsk2cGEXqzDh5WQqsGnQCX2qGPcy2mLCMw4kCyH0BikyAs/Lr5IRQRciokyub6CqhDbhPDw4RIRtHmQuHswbdTJqyl/3DO6iqHxihEPCvAbQt1TEAaO6AEBNd5ogM6gStwOPvkfKT5ctj3YxlLSGaaYA5o0VUfKvZpv/LQwnUXesyALHTyQ1G76l1jD9UcjrJwOd/VgpoSuZm6Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3328.namprd12.prod.outlook.com (20.178.240.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Wed, 24 Jul 2019 01:31:49 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::bd9b:19ce:ef42:ab26]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::bd9b:19ce:ef42:ab26%7]) with mapi id 15.20.2115.005; Wed, 24 Jul 2019
 01:31:49 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, Alex Deucher
 <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 3/3] drm/amdgpu/powerplay/vega12: call PrepareMp1ForUnload
 in power_off_asic
Thread-Topic: [PATCH 3/3] drm/amdgpu/powerplay/vega12: call
 PrepareMp1ForUnload in power_off_asic
Thread-Index: AQHVQXg4sWRazS1gqkGdE4YPhQQvwKbYn7yAgABcNNA=
Date: Wed, 24 Jul 2019 01:31:49 +0000
Message-ID: <MN2PR12MB33441259E471BD6780DB6975E4C60@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190723170049.9143-1-alexander.deucher@amd.com>
 <20190723170049.9143-3-alexander.deucher@amd.com>
 <bda866af-42f0-d40d-baf3-ffbfcb2867e2@amd.com>
In-Reply-To: <bda866af-42f0-d40d-baf3-ffbfcb2867e2@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7258c539-edf4-4d32-e293-08d70fd6b2a7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3328; 
x-ms-traffictypediagnostic: MN2PR12MB3328:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB332809433EA85F8F723D31CFE4C60@MN2PR12MB3328.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:751;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(376002)(366004)(39860400002)(136003)(13464003)(189003)(199004)(478600001)(71200400001)(186003)(71190400001)(102836004)(26005)(256004)(966005)(7696005)(53546011)(3846002)(6116002)(53936002)(8676002)(76176011)(6246003)(9686003)(6506007)(55016002)(486006)(68736007)(66066001)(6306002)(305945005)(7736002)(33656002)(74316002)(446003)(11346002)(476003)(66946007)(110136005)(19627235002)(86362001)(81166006)(66556008)(81156014)(6436002)(5660300002)(76116006)(64756008)(66446008)(14454004)(25786009)(66476007)(8936002)(4326008)(52536014)(99286004)(2501003)(2906002)(316002)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3328;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZGYferEzkOZxWIdEHelc9v9W8eFMTcqVNJplAtr2jOwvdcH7IBCmlwfulCrgvSpAe9esG1TL/WKzNtsGoUIzYLTezx/F2XIYqSmkKkjQLTGZ2Yg+h10PugvOBkB6deSfyoRRHgX3wzZcNucYKZmIUDOxSaVMBJ+dvJsi/B3rU+ulhCGanIH8EY1y/+4lNBY5j4/CJxOO9ZAryMThRvHwnjqstf0XUHcoWlLwpnCmwKTiYe8aIqLn2L1Ofe7PhmlOK9TiH8+Is0Ua77RyBM1Ifmhflpk0fYglbqBT69lVFFG6l+ptXfkFOxIsCRzvHLYpgrrAVPwDj6k0bzU1nGMQbu+xD8xK9x77Lz2e05YSA7BVqT6g73aniJQSmfPucoLLYeo7DnuTTAAuJXZ4nvm3/vtRYgQ6fbwArbjcF4wS7/c=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7258c539-edf4-4d32-e293-08d70fd6b2a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 01:31:49.0419 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3328
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3UB1lO2dnqHjBgSABuFgbPjS8RgJ/Bc05+ySyiiMI78=;
 b=sujSlgzoD0TTSCObEBZxABhzgKvF+3+ww54yaOl+WobbaGnLv0GOjsNv6Sl/dy4CopmVdUrTDqGACO3o4vN3CxbjdnTjIFvpLm8Fl09QCWSp8KJTOtqgYZaZmNnfUYCFBraF02r7qSewccnSLsszRL+4ErhblIPtEJ1NSc4dd0s=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Tm8uIEhvbGQgb24uIExldCBtZSBkaXNjdXNzIHRoaXMgaW50ZXJuYWxseS4NCg0KUmVnYXJkcywN
CkV2YW4NCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYW1kLWdmeCA8YW1k
LWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+IEdyb2R6
b3Zza3ksIEFuZHJleQ0KPiBTZW50OiBXZWRuZXNkYXksIEp1bHkgMjQsIDIwMTkgNDowMSBBTQ0K
PiBUbzogQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+OyBhbWQtDQo+IGdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVy
LkRldWNoZXJAYW1kLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAzLzNdIGRybS9hbWRncHUv
cG93ZXJwbGF5L3ZlZ2ExMjogY2FsbA0KPiBQcmVwYXJlTXAxRm9yVW5sb2FkIGluIHBvd2VyX29m
Zl9hc2ljDQo+IA0KPiBTZXJpZXMgaXMgQWNrZWQtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRy
ZXkuZ3JvZHpvdnNreUBhbWQuY29tPg0KPiANCj4gQW5kcmV5DQo+IA0KPiBPbiA3LzIzLzE5IDE6
MDAgUE0sIEFsZXggRGV1Y2hlciB3cm90ZToNCj4gPiBOZWVkZWQgdG8gbWFrZSBzdXJlIHRoZSBz
bXUgaXMgaWRsZSB3aGVuIHJlc2V0dGluZy4gVGhpcyBtYXkgZml4DQo+ID4gc3BvcmF0aWMgZmFp
bHVyZXMgd2l0aCBHUFUgcmVzZXQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMTJfaHdtZ3IuYyB8IDUgKysrKysNCj4gPiAg
IDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMTJfaHdtZ3IuYw0KPiA+IGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEyX2h3bWdyLmMNCj4gPiBp
bmRleCBlZmI2ZDM3NjJmZWIuLjNkMzUwNDQxMWI2MyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMTJfaHdtZ3IuYw0KPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMl9od21nci5jDQo+ID4gQEAg
LTI0NjgsNiArMjQ2OCwxMSBAQCBzdGF0aWMgaW50IHZlZ2ExMl9wb3dlcl9vZmZfYXNpYyhzdHJ1
Y3QNCj4gcHBfaHdtZ3IgKmh3bWdyKQ0KPiA+ICAgCQkJKTsNCj4gPiAgIAlkYXRhLT53YXRlcl9t
YXJrc19iaXRtYXAgJj0gfihXYXRlck1hcmtzTG9hZGVkKTsNCj4gPg0KPiA+ICsJUFBfQVNTRVJU
X1dJVEhfQ09ERSgocmVzdWx0ID0gc211bV9zZW5kX21zZ190b19zbWMoaHdtZ3IsDQo+ID4gKwkJ
CVBQU01DX01TR19QcmVwYXJlTXAxRm9yVW5sb2FkKSkgPT0gMCwNCj4gPiArCQkJIltQcmVwYXJl
TXAxRm9yVW5sb2FkXSBGYWlsZWQhIiwNCj4gPiArCQkJcmV0dXJuIHJlc3VsdCk7DQo+ID4gKw0K
PiA+ICAgCXJldHVybiByZXN1bHQ7DQo+ID4gICB9DQo+ID4NCj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4g
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
