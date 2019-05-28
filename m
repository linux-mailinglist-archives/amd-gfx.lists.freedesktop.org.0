Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA9C2C08F
	for <lists+amd-gfx@lfdr.de>; Tue, 28 May 2019 09:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A22389BFF;
	Tue, 28 May 2019 07:48:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740054.outbound.protection.outlook.com [40.107.74.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8F589BFF
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 May 2019 07:48:37 +0000 (UTC)
Received: from MWHPR12MB1326.namprd12.prod.outlook.com (10.169.205.19) by
 MWHPR12MB1421.namprd12.prod.outlook.com (10.169.206.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.17; Tue, 28 May 2019 07:48:35 +0000
Received: from MWHPR12MB1326.namprd12.prod.outlook.com
 ([fe80::2c1a:62f0:b1bd:74d7]) by MWHPR12MB1326.namprd12.prod.outlook.com
 ([fe80::2c1a:62f0:b1bd:74d7%2]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 07:48:35 +0000
From: "Deng, Emily" <Emily.Deng@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Quan, Evan"
 <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: Don't need to call csb_vram_unpin
Thread-Topic: [PATCH] drm/amdgpu: Don't need to call csb_vram_unpin
Thread-Index: AQHVFGf/fWnzFgt6lEuyAmxs5+HV9KZ+zoCAgAD13wCAAFnBAIAACV4AgAABxICAAABnkA==
Date: Tue, 28 May 2019 07:48:35 +0000
Message-ID: <MWHPR12MB1326DF5AE0D6F1C02F643D328F1E0@MWHPR12MB1326.namprd12.prod.outlook.com>
References: <1558946487-18034-1-git-send-email-Emily.Deng@amd.com>
 <e15ac75c-fb1a-2a05-b857-d3761f5c905e@gmail.com>
 <MN2PR12MB3344714A52B709FCE058F48DE41E0@MN2PR12MB3344.namprd12.prod.outlook.com>
 <82dfcb34-109c-b7d6-c511-404008589869@amd.com>
 <MWHPR12MB132646027A5B99282AB6557A8F1E0@MWHPR12MB1326.namprd12.prod.outlook.com>
 <daf490f4-49fd-3688-84ff-5dc47eaa535c@amd.com>
In-Reply-To: <daf490f4-49fd-3688-84ff-5dc47eaa535c@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e1c5214f-5ff1-4b1d-7e62-08d6e340e382
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1421; 
x-ms-traffictypediagnostic: MWHPR12MB1421:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <MWHPR12MB14212521730DA4174E0AB7A48F1E0@MWHPR12MB1421.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(346002)(136003)(376002)(366004)(13464003)(189003)(199004)(110136005)(25786009)(5660300002)(68736007)(26005)(486006)(6246003)(256004)(52536014)(9686003)(33656002)(6436002)(186003)(2501003)(6306002)(229853002)(11346002)(55016002)(446003)(14444005)(305945005)(14454004)(81156014)(6506007)(81166006)(76176011)(316002)(8676002)(53546011)(71190400001)(71200400001)(7736002)(99286004)(966005)(102836004)(72206003)(478600001)(74316002)(8936002)(2906002)(66066001)(86362001)(476003)(53936002)(3846002)(6116002)(7696005)(76116006)(66946007)(64756008)(73956011)(66556008)(66476007)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1421;
 H:MWHPR12MB1326.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Cs5XXHQLC3FxiYKXTop3Eb3l9SaqQtEGKzSaUKFEHh2tUy/LbijGA2yko3Rmo65ece3jcPxwP+g1apK6AQEfTt/2kC1TcfJZR0uDqyU4VdHYbiAJNfBaYkht8tNDGjK4Ud5DoWfYfi1/586WG+lkuPOnDt8wE5BXB08Si0crvhBO1U+22zyUEQ0oSr45nSf98OUcUEr2uF8gnj/zwEbjU6wy7rWm2tp0k455YqwSf6EWt+0qBM8dO/hh3amQf6DOAnFY8BC+tDCVHiJlM1NbPAujmI2E7mzUAbM7yiXJX174lh9fQsMG7DmYv/VTwrwdzFJumqvvQGH2hm1tdWFMkkg5n4h/oOymjbVAtjNun7QBipbEWCpYlW4aD7rdatU+dEPWePL/utIgk3DLBtgAHV3mVbfXFUWQ5J8xZxFC8xw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c5214f-5ff1-4b1d-7e62-08d6e340e382
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 07:48:35.1724 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jqdeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1421
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QYfhmQ4ivNpBeORkrVRaO3czLL6UhqvtomoMGCFX6J0=;
 b=R14D7nwV8wg0LdRgwELuUjRweNmFRohiqgxL/m0CMOPJZfy1n8CFMRjAY372NgIa5qIpiyQ3vRSZgtdBVamephtM5pcrozxAj23R2Erz4gyoO7TQGeelzZ0xvWpk6xoahpcchY9WpmstZX9P4D7NBsbRfqxL3eOjfr4mFuMPS8Y=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Emily.Deng@amd.com; 
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

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogS29lbmlnLCBDaHJpc3RpYW4gPENo
cmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4NCj5TZW50OiBUdWVzZGF5LCBNYXkgMjgsIDIwMTkgMzo0
MyBQTQ0KPlRvOiBEZW5nLCBFbWlseSA8RW1pbHkuRGVuZ0BhbWQuY29tPjsgUXVhbiwgRXZhbg0K
PjxFdmFuLlF1YW5AYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+U3Vi
amVjdDogUmU6IFtQQVRDSF0gZHJtL2FtZGdwdTogRG9uJ3QgbmVlZCB0byBjYWxsIGNzYl92cmFt
X3VucGluDQo+DQo+QW0gMjguMDUuMTkgdW0gMDk6Mzggc2NocmllYiBEZW5nLCBFbWlseToNCj4+
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4+IEZyb206IEtvZW5pZywgQ2hyaXN0aWFu
IDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+DQo+Pj4gU2VudDogVHVlc2RheSwgTWF5IDI4LCAy
MDE5IDM6MDQgUE0NCj4+PiBUbzogUXVhbiwgRXZhbiA8RXZhbi5RdWFuQGFtZC5jb20+OyBEZW5n
LCBFbWlseQ0KPjxFbWlseS5EZW5nQGFtZC5jb20+Ow0KPj4+IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQo+Pj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2FtZGdwdTogRG9uJ3QgbmVl
ZCB0byBjYWxsIGNzYl92cmFtX3VucGluDQo+Pj4NCj4+PiBPayBpbiB0aGlzIGNhc2UgdGhlIHBh
dGNoIGlzIGEgTkFLLg0KPj4+DQo+Pj4gVGhlIGNvcnJlY3Qgc29sdXRpb24gaXMgdG8gc3RvcCB1
c2luZyBhbWRncHVfYm9fZnJlZV9rZXJuZWwgaW4NCj4+PiBnZnhfdjlfMF9zd19maW5pLg0KPj4g
U28gd2UganVzdCBsZWFkIHRoZSBtZW1vcnkgbGVhayBoZXJlIGFuZCBub3QgZGVzdHJveSB0aGUg
Ym8/IEkgZG9uJ3QgdGhpbmsNCj5pdCBpcyBjb3JyZWN0Lg0KPg0KPk9oLCBuby4gVGhhdCdzIG5v
dCB3aGF0IEkgbWVhbnQuDQo+DQo+V2Ugc2hvdWxkIHN0b3AgdXNpbmcgYW1kZ3B1X2JvX2ZyZWVf
a2VybmVsIGFuZCBpbnN0ZWFkIHVzZQ0KPmFtZGdwdV9ib19mcmVlIQ0KDQo+U29ycnkgZm9yIG5v
dCBiZWluZyBjbGVhciBoZXJlLA0KPkNocmlzdGlhbi4NClRoYW5rcyBmb3IgeW91ciBnb29kIHN1
Z2dlc3Rpb24uICBXaWxsIHJldmVydCB0aGlzIHBhdGNoLCBhbmQgc3VibWl0IGFub3RoZXIgcGF0
Y2guDQoNCkJlc3Qgd2lzaGVzDQpFbWlseSBEZW5nDQo+DQo+Pj4gQlRXOiBBcmUgd2UgdXNpbmcg
dGhlIGtlcm5lbCBwb2ludGVyIHNvbWV3aGVyZT8gQ2F1c2UgdGhhdCBvbmUNCj5iZWNhbWUNCj4+
PiBjb21wbGV0ZWx5IGludmFsaWQgYmVjYXVzZSBvZiBwYXRjaCAiZHJtL2FtZGdwdTogcGluIHRo
ZSBjc2IgYnVmZmVyDQo+Pj4gb24gaHcgaW5pdCIuDQo+Pj4NCj4+PiBDaHJpc3RpYW4uDQo+Pj4N
Cj4+PiBBbSAyOC4wNS4xOSB1bSAwMzo0MiBzY2hyaWViIFF1YW4sIEV2YW46DQo+Pj4+IFRoZSBv
cmlnaW5hbCB1bnBpbiBpbiBod19maW5pIHdhcyBpbnRyb2R1Y2VkIGJ5DQo+Pj4+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2FtZC1nZngvMjAxOC1KdWx5LzAyMzY4MS5o
dG1sDQo+Pj4+DQo+Pj4+IEV2YW4NCj4+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
Pj4+PiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
PiBPbiBCZWhhbGYgT2YNCj4+Pj4+IENocmlzdGlhbiBLP25pZw0KPj4+Pj4gU2VudDogTW9uZGF5
LCBNYXkgMjcsIDIwMTkgNzowMiBQTQ0KPj4+Pj4gVG86IERlbmcsIEVtaWx5IDxFbWlseS5EZW5n
QGFtZC5jb20+OyBhbWQtDQo+Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4+Pj4gU3ViamVj
dDogUmU6IFtQQVRDSF0gZHJtL2FtZGdwdTogRG9uJ3QgbmVlZCB0byBjYWxsIGNzYl92cmFtX3Vu
cGluDQo+Pj4+Pg0KPj4+Pj4gQW0gMjcuMDUuMTkgdW0gMTA6NDEgc2NocmllYiBFbWlseSBEZW5n
Og0KPj4+Pj4+IEFzIGl0IHdpbGwgZGVzdHJveSBjbGVhcl9zdGF0ZV9vYmosIGFuZCBhbHNvIHdp
bGwgdW5waW4gaXQgaW4gdGhlDQo+Pj4+Pj4gZ2Z4X3Y5XzBfc3dfZmluaSwgc28gZG9uJ3QgbmVl
ZCB0byBjYWxsIGNzYl92cmFtIHVucGluIGluDQo+Pj4+Pj4gZ2Z4X3Y5XzBfaHdfZmluaSwgb3Ig
aXQgd2lsbCBoYXZlIHVucGluIHdhcm5pbmcuDQo+Pj4+Pj4NCj4+Pj4+PiB2MjogRm9yIHN1c3Bl
bmQsIHN0aWxsIG5lZWQgdG8gZG8gdW5waW4NCj4+Pj4+Pg0KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6
IEVtaWx5IERlbmcgPEVtaWx5LkRlbmdAYW1kLmNvbT4NCj4+Pj4+PiAtLS0NCj4+Pj4+PiAgICAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyB8IDMgKystDQo+Pj4+Pj4gICAg
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+Pj4+Pg0K
Pj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5j
DQo+Pj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jDQo+Pj4+Pj4g
aW5kZXggNWViNzBlOC4uNWIxZmY0OCAxMDA2NDQNCj4+Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jDQo+Pj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3Y5XzAuYw0KPj4+Pj4+IEBAIC0zMzk1LDcgKzMzOTUsOCBAQCBzdGF0aWMg
aW50IGdmeF92OV8wX2h3X2Zpbmkodm9pZCAqaGFuZGxlKQ0KPj4+Pj4+ICAgICAJZ2Z4X3Y5XzBf
Y3BfZW5hYmxlKGFkZXYsIGZhbHNlKTsNCj4+Pj4+PiAgICAgCWFkZXYtPmdmeC5ybGMuZnVuY3Mt
PnN0b3AoYWRldik7DQo+Pj4+Pj4NCj4+Pj4+PiAtCWdmeF92OV8wX2NzYl92cmFtX3VucGluKGFk
ZXYpOw0KPj4+Pj4+ICsJaWYgKGFkZXYtPmluX3N1c3BlbmQpDQo+Pj4+Pj4gKwkJZ2Z4X3Y5XzBf
Y3NiX3ZyYW1fdW5waW4oYWRldik7DQo+Pj4+PiBUaGF0IGRvZXNuJ3QgbG9va3MgbGlrZSBhIGdv
b2QgaWRlYSB0byBtZS4NCj4+Pj4+DQo+Pj4+PiBXaHkgZG8gd2UgaGF2ZSB1bnBpbiBib3RoIGlu
IHRoZSBzd19maW5pIGFzIHdlbGwgYXMgdGhlIGh3X2ZpbmkNCj4+Pj4+IGNvZGUNCj4+PiBwYXRo
cz8NCj4+Pj4+IFJlZ2FyZHMsDQo+Pj4+PiBDaHJpc3RpYW4uDQo+Pj4+Pg0KPj4+Pj4+ICAgICAJ
cmV0dXJuIDA7DQo+Pj4+Pj4gICAgIH0NCj4+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fDQo+Pj4+PiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0KPj4+Pj4g
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+Pj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
