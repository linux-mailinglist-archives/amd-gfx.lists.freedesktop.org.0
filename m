Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 771BA1CA1B
	for <lists+amd-gfx@lfdr.de>; Tue, 14 May 2019 16:17:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0874F891DB;
	Tue, 14 May 2019 14:17:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750053.outbound.protection.outlook.com [40.107.75.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE18891DB
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 May 2019 14:17:08 +0000 (UTC)
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1875.namprd12.prod.outlook.com (10.175.99.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.25; Tue, 14 May 2019 14:17:07 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::bc5b:de68:25b7:d853]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::bc5b:de68:25b7:d853%12]) with mapi id 15.20.1878.024; Tue, 14 May
 2019 14:17:07 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Zhou, Tiecheng"
 <Tiecheng.Zhou@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu/sriov: Need to initialize the
 HDP_NONSURFACE_BAStE
Thread-Topic: [PATCH] drm/amdgpu/sriov: Need to initialize the
 HDP_NONSURFACE_BAStE
Thread-Index: AQHVCj9RiE3gcfzq9kKWUvmfGXRD/6ZqbHoAgAA+QxA=
Date: Tue, 14 May 2019 14:17:06 +0000
Message-ID: <BN6PR12MB18097D7DEE6724FDE331FC68F7080@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <1557829492-5991-1-git-send-email-Tiecheng.Zhou@amd.com>
 <8cca3031-e258-785c-331c-6c6d32421ed0@gmail.com>
In-Reply-To: <8cca3031-e258-785c-331c-6c6d32421ed0@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.11.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 72a839f8-c1d6-42ba-5a3c-08d6d876d8a1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1875; 
x-ms-traffictypediagnostic: BN6PR12MB1875:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB187512442AADB5E3924F1293F7080@BN6PR12MB1875.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 0037FD6480
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(136003)(346002)(39860400002)(366004)(396003)(13464003)(189003)(199004)(66066001)(7696005)(7736002)(68736007)(76116006)(73956011)(66476007)(66446008)(64756008)(66556008)(6506007)(76176011)(2501003)(99286004)(53546011)(256004)(5660300002)(86362001)(71190400001)(71200400001)(102836004)(66946007)(52536014)(3846002)(6116002)(14454004)(2906002)(55016002)(6306002)(316002)(186003)(229853002)(72206003)(966005)(476003)(26005)(486006)(33656002)(25786009)(4326008)(9686003)(74316002)(6246003)(478600001)(8936002)(110136005)(81156014)(8676002)(53936002)(305945005)(11346002)(446003)(6436002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1875;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4cmy6xIB7hRg+Xbm17bnDTvXfuz8Cqk1ivfiGBTkPIR46MCVsSNC5s1MyE5G6zjI4QRZMezzebPvVjSGao0LUicrPMIzR2We4z9c3pMLb8degkWpfrsH3+VZG0sAFh5O9feMWx3Br9SM9OeWQUHCc2MwerPLRBn9PultfwkJHiFULxpDHa34Mp/53fVdBOp+QDlQ0Ey67035BiRiOqydZ0DA1cFB/klCSE88QemULH/9AkwULc6A1YmWYfW3/1dlwy46tNcmfBMrBPABkf+sZGHeStEmXsCNJQpETMu5MSdhCj5WxWUJRq1PTku+SFch85e6YfVTeb6XEK+zDMap2VZiYz9/h/kG2lio/i99YMfkEg6xSjcKnE980kIulTVlKEX+4NH7pinA7OlEffSUqwvptLWc7PgZGo//vwT68CI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72a839f8-c1d6-42ba-5a3c-08d6d876d8a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2019 14:17:07.0216 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1875
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5GlNMP2USY0nrvEQ+lwjzYM58RkB+6zzQRrrNe9XRTw=;
 b=l6H0PbbVLcJKQHizSS9hM1OX0NL9Jscv1mvANCuIkSisAabvGJ9dQAriD8IShbtDeVVEMR6UkX8ktiNDqHGUUfUS9xsGUxo4QSKh/Yj5A22yG43oE78BVPfbKxKH8rDG+lyW1t7Is0QY1XFWH/v+eZebwL8/+HO7bsukWaRvJFA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Alexander.Deucher@amd.com; 
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
Cc: "Deng, Emily" <Emily.Deng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gQ2hyaXN0aWFuIEvD
tm5pZw0KPiBTZW50OiBUdWVzZGF5LCBNYXkgMTQsIDIwMTkgNjozNCBBTQ0KPiBUbzogWmhvdSwg
VGllY2hlbmcgPFRpZWNoZW5nLlpob3VAYW1kLmNvbT47IGFtZC0NCj4gZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KPiBDYzogRGVuZywgRW1pbHkgPEVtaWx5LkRlbmdAYW1kLmNvbT4NCj4gU3Vi
amVjdDogUmU6IFtQQVRDSF0gZHJtL2FtZGdwdS9zcmlvdjogTmVlZCB0byBpbml0aWFsaXplIHRo
ZQ0KPiBIRFBfTk9OU1VSRkFDRV9CQVN0RQ0KPiANCj4gW0NBVVRJT046IEV4dGVybmFsIEVtYWls
XQ0KPiANCj4gQW0gMTQuMDUuMTkgdW0gMTI6MjQgc2NocmllYiBUaWVjaGVuZyBaaG91Og0KPiA+
IGl0IHJlcXVpcmVzIHRvIGluaXRpYWxpemUgSERQX05PTlNVUkZBQ0VfQkFTRSwgc28gYXMgdG8g
YXZvaWQgdXNpbmcNCj4gPiB0aGUgdmFsdWUgbGVmdCBieSBhIHByZXZpb3VzIFZNIHVuZGVyIHNy
aW92IHNjZW5hcmlvLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogRW1pbHkgRGVuZyA8RW1pbHku
RGVuZ0BhbWQuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFRpZWNoZW5nIFpob3UgPFRpZWNoZW5n
Llpob3VAYW1kLmNvbT4NCj4gDQo+IFdvdWxkIGl0IGh1cnQgdXMgdG8gYWxzbyBkbyB0aGlzIG9u
IGJhcmUgbWV0YWw/DQo+IA0KDQpWYmlvcyBBc2ljX2luaXQgaGFuZGxlcyB0aGlzIGZvciB1cyBv
biBiYXJlIG1ldGFsLg0KDQpBbGV4DQoNCj4gQXBhcnQgZnJvbSB0aGF0IGxvb2tzIGdvb2QgdG8g
bWUsDQo+IENocmlzdGlhbi4NCj4gDQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nbWNfdjlfMC5jIHwgNSArKysrKw0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dtY192OV8wLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8w
LmMNCj4gPiBpbmRleCBiZTcyOWU3Li5lOTY2ODRlIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nbWNfdjlfMC5jDQo+ID4gQEAgLTExODEsNiArMTE4MSwxMSBAQCBzdGF0aWMg
aW50IGdtY192OV8wX2dhcnRfZW5hYmxlKHN0cnVjdA0KPiBhbWRncHVfZGV2aWNlICphZGV2KQ0K
PiA+ICAgICAgIHRtcCA9IFJSRUczMl9TT0MxNShIRFAsIDAsIG1tSERQX0hPU1RfUEFUSF9DTlRM
KTsNCj4gPiAgICAgICBXUkVHMzJfU09DMTUoSERQLCAwLCBtbUhEUF9IT1NUX1BBVEhfQ05UTCwg
dG1wKTsNCj4gPg0KPiA+ICsgICAgIGlmIChhbWRncHVfc3Jpb3ZfdmYoYWRldikpIHsNCj4gPiAr
ICAgICAgICAgICAgIFdSRUczMl9TT0MxNShIRFAsIDAsIG1tSERQX05PTlNVUkZBQ0VfQkFTRSwg
KGFkZXYtDQo+ID5nbWMudnJhbV9zdGFydCA+PiA4KSk7DQo+ID4gKyAgICAgICAgICAgICBXUkVH
MzJfU09DMTUoSERQLCAwLCBtbUhEUF9OT05TVVJGQUNFX0JBU0VfSEksIChhZGV2LQ0KPiA+Z21j
LnZyYW1fc3RhcnQgPj4gNDApKTsNCj4gPiArICAgICB9DQo+ID4gKw0KPiA+ICAgICAgIC8qIEFm
dGVyIEhEUCBpcyBpbml0aWFsaXplZCwgZmx1c2ggSERQLiovDQo+ID4gICAgICAgYWRldi0+bmJp
b19mdW5jcy0+aGRwX2ZsdXNoKGFkZXYsIE5VTEwpOw0KPiA+DQo+IA0KPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBhbWQtZ2Z4IG1haWxpbmcgbGlz
dA0KPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
