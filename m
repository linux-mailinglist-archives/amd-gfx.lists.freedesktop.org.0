Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D94C2C027
	for <lists+amd-gfx@lfdr.de>; Tue, 28 May 2019 09:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BECFC89BFD;
	Tue, 28 May 2019 07:38:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810075.outbound.protection.outlook.com [40.107.81.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4119489BFD
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 May 2019 07:38:09 +0000 (UTC)
Received: from MWHPR12MB1326.namprd12.prod.outlook.com (10.169.205.19) by
 MWHPR12MB1872.namprd12.prod.outlook.com (10.175.52.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Tue, 28 May 2019 07:38:06 +0000
Received: from MWHPR12MB1326.namprd12.prod.outlook.com
 ([fe80::2c1a:62f0:b1bd:74d7]) by MWHPR12MB1326.namprd12.prod.outlook.com
 ([fe80::2c1a:62f0:b1bd:74d7%2]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 07:38:06 +0000
From: "Deng, Emily" <Emily.Deng@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Quan, Evan"
 <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: Don't need to call csb_vram_unpin
Thread-Topic: [PATCH] drm/amdgpu: Don't need to call csb_vram_unpin
Thread-Index: AQHVFGf/fWnzFgt6lEuyAmxs5+HV9KZ+zoCAgAD13wCAAFnBAIAACV4A
Date: Tue, 28 May 2019 07:38:06 +0000
Message-ID: <MWHPR12MB132646027A5B99282AB6557A8F1E0@MWHPR12MB1326.namprd12.prod.outlook.com>
References: <1558946487-18034-1-git-send-email-Emily.Deng@amd.com>
 <e15ac75c-fb1a-2a05-b857-d3761f5c905e@gmail.com>
 <MN2PR12MB3344714A52B709FCE058F48DE41E0@MN2PR12MB3344.namprd12.prod.outlook.com>
 <82dfcb34-109c-b7d6-c511-404008589869@amd.com>
In-Reply-To: <82dfcb34-109c-b7d6-c511-404008589869@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5db50947-5b44-4f79-fc65-08d6e33f6ce5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1872; 
x-ms-traffictypediagnostic: MWHPR12MB1872:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <MWHPR12MB1872E7B2B974393D1DD847DD8F1E0@MWHPR12MB1872.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(376002)(346002)(396003)(39860400002)(189003)(199004)(13464003)(14454004)(6436002)(966005)(68736007)(478600001)(73956011)(72206003)(9686003)(6116002)(55016002)(66476007)(66556008)(64756008)(66446008)(76116006)(66946007)(33656002)(53936002)(6246003)(3846002)(6306002)(256004)(14444005)(66066001)(71200400001)(71190400001)(25786009)(229853002)(316002)(2906002)(86362001)(7696005)(2501003)(76176011)(305945005)(7736002)(99286004)(186003)(26005)(102836004)(6506007)(53546011)(8936002)(8676002)(81156014)(81166006)(110136005)(5660300002)(11346002)(446003)(486006)(74316002)(52536014)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1872;
 H:MWHPR12MB1326.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8XdAzdBWZvGVZTl7KlmjrcblNdE7BXIxNwzL92fxU/ubJ18fyrgyzU8hURabCGXK6gPLNv/p4ynu4hnWZ7NNGVb0OWd7VSiwk3Pni7s/n71Fi5JYsH1iA2di7RVoUaMYyFAysegMyUhZu++Q4drjglGFUnYRNsqL5YfAt/NZfHPSo0k2DdRcwkMHFzLYSKrPKe9J/XXWBdlU2MhHZRAuyQUjP1e/W+3yCUo9BIe3UFocAs85XbjEkiGvNG85Qe6NqKuBWcDuTkzYAV0eEF9arlMZoNvVM7YEDdxAUzRfnZbdFAySQqIqJlMeAz5lYdHoaSvbHBHE/5N5NLgRXZtC0jzLxuj1PzKzU5/EaC/9UPDi+8QwQcP3Wjbat3yJmhpyrKIFMI+uJZnvwyvqN0IlnQv3rNI2RKzPuseDaCxi72A=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db50947-5b44-4f79-fc65-08d6e33f6ce5
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 07:38:06.7339 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jqdeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1872
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u50Mrz/F22j4k2b7e8RJEO7sPm3zH85prZztcEz2bEg=;
 b=wOYPKBWBGLIjS//2xsXQNYpoqPMjZz5BScWAILVdyjcTSGupAHCYFwLSUcdGBd17cfUdWaMdAfa7vQkRl97BnqoY54eR/96obUGrzHl6blV0t90zEdhBwJlhw+sjinhZP9bxBsZZQTtMRueE/gtiTGR8wIdhWCMZHyr+x0May10=
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
cmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4NCj5TZW50OiBUdWVzZGF5LCBNYXkgMjgsIDIwMTkgMzow
NCBQTQ0KPlRvOiBRdWFuLCBFdmFuIDxFdmFuLlF1YW5AYW1kLmNvbT47IERlbmcsIEVtaWx5DQo+
PEVtaWx5LkRlbmdAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+U3Vi
amVjdDogUmU6IFtQQVRDSF0gZHJtL2FtZGdwdTogRG9uJ3QgbmVlZCB0byBjYWxsIGNzYl92cmFt
X3VucGluDQo+DQo+T2sgaW4gdGhpcyBjYXNlIHRoZSBwYXRjaCBpcyBhIE5BSy4NCj4NCj5UaGUg
Y29ycmVjdCBzb2x1dGlvbiBpcyB0byBzdG9wIHVzaW5nIGFtZGdwdV9ib19mcmVlX2tlcm5lbCBp
bg0KPmdmeF92OV8wX3N3X2ZpbmkuDQpTbyB3ZSBqdXN0IGxlYWQgdGhlIG1lbW9yeSBsZWFrIGhl
cmUgYW5kIG5vdCBkZXN0cm95IHRoZSBibz8gSSBkb24ndCB0aGluayBpdCBpcyBjb3JyZWN0Lg0K
Pg0KPkJUVzogQXJlIHdlIHVzaW5nIHRoZSBrZXJuZWwgcG9pbnRlciBzb21ld2hlcmU/IENhdXNl
IHRoYXQgb25lIGJlY2FtZQ0KPmNvbXBsZXRlbHkgaW52YWxpZCBiZWNhdXNlIG9mIHBhdGNoICJk
cm0vYW1kZ3B1OiBwaW4gdGhlIGNzYiBidWZmZXIgb24gaHcNCj5pbml0Ii4NCj4NCj5DaHJpc3Rp
YW4uDQo+DQo+QW0gMjguMDUuMTkgdW0gMDM6NDIgc2NocmllYiBRdWFuLCBFdmFuOg0KPj4gVGhl
IG9yaWdpbmFsIHVucGluIGluIGh3X2Zpbmkgd2FzIGludHJvZHVjZWQgYnkNCj4+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2FtZC1nZngvMjAxOC1KdWx5LzAyMzY4MS5o
dG1sDQo+Pg0KPj4gRXZhbg0KPj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+Pj4gRnJv
bTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVo
YWxmIE9mDQo+Pj4gQ2hyaXN0aWFuIEs/bmlnDQo+Pj4gU2VudDogTW9uZGF5LCBNYXkgMjcsIDIw
MTkgNzowMiBQTQ0KPj4+IFRvOiBEZW5nLCBFbWlseSA8RW1pbHkuRGVuZ0BhbWQuY29tPjsgYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+PiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0v
YW1kZ3B1OiBEb24ndCBuZWVkIHRvIGNhbGwgY3NiX3ZyYW1fdW5waW4NCj4+Pg0KPj4+IEFtIDI3
LjA1LjE5IHVtIDEwOjQxIHNjaHJpZWIgRW1pbHkgRGVuZzoNCj4+Pj4gQXMgaXQgd2lsbCBkZXN0
cm95IGNsZWFyX3N0YXRlX29iaiwgYW5kIGFsc28gd2lsbCB1bnBpbiBpdCBpbiB0aGUNCj4+Pj4g
Z2Z4X3Y5XzBfc3dfZmluaSwgc28gZG9uJ3QgbmVlZCB0byBjYWxsIGNzYl92cmFtIHVucGluIGlu
DQo+Pj4+IGdmeF92OV8wX2h3X2ZpbmksIG9yIGl0IHdpbGwgaGF2ZSB1bnBpbiB3YXJuaW5nLg0K
Pj4+Pg0KPj4+PiB2MjogRm9yIHN1c3BlbmQsIHN0aWxsIG5lZWQgdG8gZG8gdW5waW4NCj4+Pj4N
Cj4+Pj4gU2lnbmVkLW9mZi1ieTogRW1pbHkgRGVuZyA8RW1pbHkuRGVuZ0BhbWQuY29tPg0KPj4+
PiAtLS0NCj4+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyB8IDMg
KystDQo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkNCj4+Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dm
eF92OV8wLmMNCj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jDQo+
Pj4+IGluZGV4IDVlYjcwZTguLjViMWZmNDggMTAwNjQ0DQo+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMNCj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3Y5XzAuYw0KPj4+PiBAQCAtMzM5NSw3ICszMzk1LDggQEAgc3RhdGljIGlu
dCBnZnhfdjlfMF9od19maW5pKHZvaWQgKmhhbmRsZSkNCj4+Pj4gICAgCWdmeF92OV8wX2NwX2Vu
YWJsZShhZGV2LCBmYWxzZSk7DQo+Pj4+ICAgIAlhZGV2LT5nZngucmxjLmZ1bmNzLT5zdG9wKGFk
ZXYpOw0KPj4+Pg0KPj4+PiAtCWdmeF92OV8wX2NzYl92cmFtX3VucGluKGFkZXYpOw0KPj4+PiAr
CWlmIChhZGV2LT5pbl9zdXNwZW5kKQ0KPj4+PiArCQlnZnhfdjlfMF9jc2JfdnJhbV91bnBpbihh
ZGV2KTsNCj4+PiBUaGF0IGRvZXNuJ3QgbG9va3MgbGlrZSBhIGdvb2QgaWRlYSB0byBtZS4NCj4+
Pg0KPj4+IFdoeSBkbyB3ZSBoYXZlIHVucGluIGJvdGggaW4gdGhlIHN3X2ZpbmkgYXMgd2VsbCBh
cyB0aGUgaHdfZmluaSBjb2RlDQo+cGF0aHM/DQo+Pj4NCj4+PiBSZWdhcmRzLA0KPj4+IENocmlz
dGlhbi4NCj4+Pg0KPj4+PiAgICAJcmV0dXJuIDA7DQo+Pj4+ICAgIH0NCj4+PiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPj4+IGFtZC1nZnggbWFpbGlu
ZyBsaXN0DQo+Pj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+PiBodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
