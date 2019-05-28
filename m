Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B212BCEC
	for <lists+amd-gfx@lfdr.de>; Tue, 28 May 2019 03:42:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C52A89A57;
	Tue, 28 May 2019 01:42:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710070.outbound.protection.outlook.com [40.107.71.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED67589A57
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 May 2019 01:42:24 +0000 (UTC)
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3902.namprd12.prod.outlook.com (10.255.238.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.16; Tue, 28 May 2019 01:42:23 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::18c6:70fa:9f7e:7018]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::18c6:70fa:9f7e:7018%2]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 01:42:23 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Deng, Emily"
 <Emily.Deng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: Don't need to call csb_vram_unpin
Thread-Topic: [PATCH] drm/amdgpu: Don't need to call csb_vram_unpin
Thread-Index: AQHVFGgBi9fHbs1R+UCq4weXpQUTlqZ+zoCAgAD1l1A=
Date: Tue, 28 May 2019 01:42:22 +0000
Message-ID: <MN2PR12MB3344714A52B709FCE058F48DE41E0@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <1558946487-18034-1-git-send-email-Emily.Deng@amd.com>
 <e15ac75c-fb1a-2a05-b857-d3761f5c905e@gmail.com>
In-Reply-To: <e15ac75c-fb1a-2a05-b857-d3761f5c905e@gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2660a023-223e-4ea9-5fc2-08d6e30dbb01
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3902; 
x-ms-traffictypediagnostic: MN2PR12MB3902:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <MN2PR12MB39020548241F26BDF5436F7EE41E0@MN2PR12MB3902.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(376002)(39860400002)(346002)(366004)(396003)(13464003)(189003)(199004)(53546011)(6506007)(2906002)(476003)(102836004)(11346002)(14444005)(256004)(486006)(305945005)(6116002)(66066001)(7736002)(186003)(26005)(5660300002)(76176011)(3846002)(7696005)(316002)(99286004)(66476007)(66946007)(71200400001)(110136005)(71190400001)(76116006)(73956011)(66556008)(64756008)(66446008)(6246003)(9686003)(68736007)(8676002)(53936002)(229853002)(6436002)(446003)(81166006)(81156014)(14454004)(74316002)(966005)(8936002)(52536014)(6306002)(86362001)(25786009)(33656002)(2501003)(55016002)(72206003)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3902;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tya5tew8+A9CRvK9gcETh6o/QcSFUX3hevqIceHET7I4DaJ/np8Btb1yb9vbhoH2NOOz101GmrY8Yei7S8osJtMzqOBhlo3XwCvQXas3tJM5/DaaFv8OuqHlKoZ7YT8894aNfgd2nyyR6LA2dG7f/eLLKa0hbG/uCjswcVElPXQB683PR7EM2HA70O4VNbhqGKg0EhShcLScvjGT1+Vsx/DJux6qymOHbzMzmmuFdv43eQr9zH6iWsYe5jTSY+NFY69cmJqy0ARot3dI8q8bvhr5A40beTYkquWM4E4dJ2sZEuY3hswHXM05pmNaCZfWdcnmxgs738C4oEcOYLqxHx1PpJeeu58D3o8zyxyP5/dVfCyUbAFtGOPWcPK0Bapf4pC+Sx6BSqX5QOyFv3Nr1zwQgDQyJqsFnucbf4/n8WA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2660a023-223e-4ea9-5fc2-08d6e30dbb01
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 01:42:22.9883 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3902
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6VwW9DyYUt8aU6+xUYgUv7T/Nt0C4wd2awXArAp/p4Y=;
 b=rNtc80dEpw0j5mAT2tk/1hYUApWfluUZLTSbHQmnsH4WqQ6dJ24G0VgT/gHtLmAOiyiqUCUWu728DAKaN5+wHr1e5VnsL+1nQl5vrbQsm+YMNkSML4sWS4BcU3IekWI7m57Q6brRqQkREa3O7ZDukrkZP8eVak6EpcXM91PsM04=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIG9yaWdpbmFsIHVucGluIGluIGh3X2Zpbmkgd2FzIGludHJvZHVjZWQgYnkNCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2FtZC1nZngvMjAxOC1KdWx5LzAyMzY4MS5o
dG1sDQoNCkV2YW4NCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYW1kLWdm
eCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+
IENocmlzdGlhbiBLP25pZw0KPiBTZW50OiBNb25kYXksIE1heSAyNywgMjAxOSA3OjAyIFBNDQo+
IFRvOiBEZW5nLCBFbWlseSA8RW1pbHkuRGVuZ0BhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2FtZGdwdTogRG9uJ3QgbmVl
ZCB0byBjYWxsIGNzYl92cmFtX3VucGluDQo+IA0KPiBBbSAyNy4wNS4xOSB1bSAxMDo0MSBzY2hy
aWViIEVtaWx5IERlbmc6DQo+ID4gQXMgaXQgd2lsbCBkZXN0cm95IGNsZWFyX3N0YXRlX29iaiwg
YW5kIGFsc28gd2lsbCB1bnBpbiBpdCBpbiB0aGUNCj4gPiBnZnhfdjlfMF9zd19maW5pLCBzbyBk
b24ndCBuZWVkIHRvIGNhbGwgY3NiX3ZyYW0gdW5waW4gaW4NCj4gPiBnZnhfdjlfMF9od19maW5p
LCBvciBpdCB3aWxsIGhhdmUgdW5waW4gd2FybmluZy4NCj4gPg0KPiA+IHYyOiBGb3Igc3VzcGVu
ZCwgc3RpbGwgbmVlZCB0byBkbyB1bnBpbg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogRW1pbHkg
RGVuZyA8RW1pbHkuRGVuZ0BhbWQuY29tPg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyB8IDMgKystDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3Y5XzAuYw0KPiA+IGluZGV4IDVlYjcwZTguLjViMWZmNDggMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYw0KPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMNCj4gPiBAQCAtMzM5NSw3ICsz
Mzk1LDggQEAgc3RhdGljIGludCBnZnhfdjlfMF9od19maW5pKHZvaWQgKmhhbmRsZSkNCj4gPiAg
IAlnZnhfdjlfMF9jcF9lbmFibGUoYWRldiwgZmFsc2UpOw0KPiA+ICAgCWFkZXYtPmdmeC5ybGMu
ZnVuY3MtPnN0b3AoYWRldik7DQo+ID4NCj4gPiAtCWdmeF92OV8wX2NzYl92cmFtX3VucGluKGFk
ZXYpOw0KPiA+ICsJaWYgKGFkZXYtPmluX3N1c3BlbmQpDQo+ID4gKwkJZ2Z4X3Y5XzBfY3NiX3Zy
YW1fdW5waW4oYWRldik7DQo+IA0KPiBUaGF0IGRvZXNuJ3QgbG9va3MgbGlrZSBhIGdvb2QgaWRl
YSB0byBtZS4NCj4gDQo+IFdoeSBkbyB3ZSBoYXZlIHVucGluIGJvdGggaW4gdGhlIHN3X2Zpbmkg
YXMgd2VsbCBhcyB0aGUgaHdfZmluaSBjb2RlIHBhdGhzPw0KPiANCj4gUmVnYXJkcywNCj4gQ2hy
aXN0aWFuLg0KPiANCj4gPg0KPiA+ICAgCXJldHVybiAwOw0KPiA+ICAgfQ0KPiANCj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gYW1kLWdmeCBtYWls
aW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
