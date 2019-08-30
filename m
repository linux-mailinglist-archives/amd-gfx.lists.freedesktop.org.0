Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C8AA2CE7
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Aug 2019 04:39:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD74B6E0EF;
	Fri, 30 Aug 2019 02:39:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810040.outbound.protection.outlook.com [40.107.81.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 999C06E0EF
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Aug 2019 02:39:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sb+mkW1fMu5ab9zTtZ2OYwIoPCD+fPvrXutBlngVhzQT+tXgslULELisX5Eiz+lJNofKkhPI7QAQLCETsqKMGzv9Jnc1R8clZlDRLmgGIjC7VXPN9OvJC7LssvUfROZt8/UvyCUgB565X+13s57ZR9y2iikb70ursJaOoii7u4OnFUuF2I7VgTN/fzUJrh7DBIZvRyLyyR3iXKbS++03F4f6d1pOJOULqwC+Tb8+kcmhwLwThnYCtElRUjqO+7xwgqPcXsAXfskHVOqWNuVNAfw2Knd/0I6cQda0iOekX5ppjaQQYMEkuRJdg+Pw7LdmwvbJykbZaor+XCmZI0cpAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7nfOGhCuY71L7RCN/iSuklT9FpkK3OV7T2f9IIt01Z4=;
 b=djycFXx29lkR6DUEyow79/uJXuEoLpOH3zT3o7IaboGy+6krqTB3QUvu6OKn68M2AQeuPSWumorVehVH/olX/XDViVvZpRpeYr+j51G4BCinH38LZxwQVo9b0VicjcxsfZSXGoahHX9HKg0BcOr95UE4AOwWt53kIz0TaBao4q0nJT+ASIgj6SvLn5nGGuBFSn94PUSbkGp/OX2yYitMGTvVChXYep+9WpCy8GO30A6n7pvATqw5iDyIqzfOA6zdwvG763X0jENwXnN5ojyBl1/XjHvKmTDGHNI5/tjL4DhgctPI4eY/oR5IIhvpnhENbSwMfhVqcxWrDPNYE+1AJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB2944.namprd12.prod.outlook.com (20.179.81.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Fri, 30 Aug 2019 02:39:20 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2199.021; Fri, 30 Aug 2019
 02:39:20 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>
Subject: RE: [PATCH 7/7] drm/amdgpu: switch to amdgpu_ras_late_init for nbio
 v7_4 (v2)
Thread-Topic: [PATCH 7/7] drm/amdgpu: switch to amdgpu_ras_late_init for nbio
 v7_4 (v2)
Thread-Index: AQHVXm4PdjOtcJHUbU2sGtcod4yCfKcS+ubg
Date: Fri, 30 Aug 2019 02:39:20 +0000
Message-ID: <MN2PR12MB305401BCB81469D161D6D89EB0BD0@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <1567085432-27452-1-git-send-email-Hawking.Zhang@amd.com>
 <1567085432-27452-7-git-send-email-Hawking.Zhang@amd.com>
In-Reply-To: <1567085432-27452-7-git-send-email-Hawking.Zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6d338275-815e-46d8-770e-08d72cf34286
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2944; 
x-ms-traffictypediagnostic: MN2PR12MB2944:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB29445E0B1C917B34B24E8FC8B0BD0@MN2PR12MB2944.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0145758B1D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(376002)(39860400002)(366004)(136003)(189003)(13464003)(199004)(7736002)(33656002)(86362001)(476003)(6246003)(486006)(74316002)(305945005)(446003)(4326008)(11346002)(6436002)(81156014)(9686003)(478600001)(8676002)(55016002)(81166006)(6306002)(76176011)(7696005)(8936002)(5660300002)(186003)(53936002)(76116006)(99286004)(14454004)(14444005)(966005)(26005)(53546011)(6506007)(256004)(6116002)(66946007)(3846002)(2906002)(229853002)(64756008)(66446008)(316002)(66556008)(66476007)(52536014)(66066001)(25786009)(71200400001)(71190400001)(102836004)(6636002)(2501003)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2944;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OXhqCllQ5U1YiWC0ZZNrKAnsDVglhWZw9KXYM7kxULHsxTcsNdIChjbcTFsATfKeXhuck1rdpQdIMfomtG55FZDlAtXoCD/xsGAyNxvu/LYKsXUyDQnyP0tWFJUWVDOE/OcjxmZ9r462bcDJci4AYPNdlv3IlD6uISN+7th1KDP0L6FuUIlHYv08/FXBq6DQAwwqMOBdMX2rsiK46ydXYmPuTvPcpDcuqRqQMFFns+XKD0LZkQbrwufTTpOWzLiCtqxMJZO87iHDtq8JspoFs4zDyVO+Nw7S4t8C3++5XSjN+PBCvTjunQPhy25Yx7LTwPCMr9+ZASIM8za13JqtD/zlamqNSfiHVBAb5X/xZkOnB1j5gvJEKE0vgDyco/dQ5m6ZO68vAz+rP93EjZc6kKJTDIxEC6n+vGJcmlN/Rfc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d338275-815e-46d8-770e-08d72cf34286
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2019 02:39:20.0288 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FI9R4oXC7hJcupM/pdZAftNn/9vg2YdU8x2rHu4zDR5n8MIPOAZmBA7Ttr4BvCqS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2944
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7nfOGhCuY71L7RCN/iSuklT9FpkK3OV7T2f9IIt01Z4=;
 b=PIAhUbz8UTMWUeHpgfxV2miCLp+3y8Qb8C/UVeTLDM19JupiMHr0u7F/3Zj/sfxDf/3/ic0cxJ/H9bpGoJxfC+MVTPkUCpRFst8gUfQsLwIbsmYtoHgsPRuwuGYSjcQRgB4qAerfLA5YQfBmUpxSURJ2b60dV+DV1UgpXTabNYk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tao.Zhou1@amd.com; 
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
Cc: "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2l0aCB0aGUgdHdvIHBvaW50cyBpbiBwYXRjaCAjMSBhbmQgcGF0Y2ggIzUgYXJlIGZpeGVkLCB0
aGUgc2VyaWVzIGlzOg0KDQpSZXZpZXdlZC1ieTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29t
Pg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGFtZC1nZnggPGFtZC1n
ZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPiBIYXdraW5n
IFpoYW5nDQo+IFNlbnQ6IDIwMTnlubQ45pyIMjnml6UgMjE6MzENCj4gVG86IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnOyBEZXVjaGVyLCBBbGV4YW5kZXINCj4gPEFsZXhhbmRlci5EZXVj
aGVyQGFtZC5jb20+OyBaaG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT47IENoZW4sDQo+IEd1
Y2h1biA8R3VjaHVuLkNoZW5AYW1kLmNvbT4NCj4gQ2M6IFpoYW5nLCBIYXdraW5nIDxIYXdraW5n
LlpoYW5nQGFtZC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCA3LzddIGRybS9hbWRncHU6IHN3aXRj
aCB0byBhbWRncHVfcmFzX2xhdGVfaW5pdCBmb3IgbmJpbw0KPiB2N180ICh2MikNCj4gDQo+IGNh
bGwgaGVscGVyIGZ1bmN0aW9uIGluIGxhdGUgaW5pdCBwaGFzZSB0byBoYW5kbGUgcmFzIGluaXQg
Zm9yIG5iaW8gaXAgYmxvY2sNCj4gDQo+IHYyOiBpbml0IGxvY2FsIHZhciByIHRvIDAgaW4gY2Fz
ZSB0aGUgZnVuY3Rpb24gcmV0dXJuIGZhaWx1cmUgb24gYXNpY3MgdGhhdCBkb24ndA0KPiBoYXZl
IHJhc19sYXRlX2luaXQgaW1wbGVtZW50YXRpb24NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhhd2tp
bmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9zb2MxNS5jIHwgMTMgKysrKysrKysrKysrLQ0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDEyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvc29jMTUuYw0KPiBpbmRleCBlNzkxYWMzLi5jNmZmMjI1YyAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jDQo+IEBAIC0xMjA4LDExICsxMjA4LDE1IEBAIHN0YXRp
YyBpbnQgc29jMTVfY29tbW9uX2Vhcmx5X2luaXQodm9pZA0KPiAqaGFuZGxlKSAgc3RhdGljIGlu
dCBzb2MxNV9jb21tb25fbGF0ZV9pbml0KHZvaWQgKmhhbmRsZSkgIHsNCj4gIAlzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqKWhhbmRsZTsNCj4gKwlp
bnQgciA9IDA7DQo+IA0KPiAgCWlmIChhbWRncHVfc3Jpb3ZfdmYoYWRldikpDQo+ICAJCXhncHVf
YWlfbWFpbGJveF9nZXRfaXJxKGFkZXYpOw0KPiANCj4gLQlyZXR1cm4gMDsNCj4gKwlpZiAoYWRl
di0+bmJpby5mdW5jcy0+cmFzX2xhdGVfaW5pdCkNCj4gKwkJciA9IGFkZXYtPm5iaW8uZnVuY3Mt
PnJhc19sYXRlX2luaXQoYWRldik7DQo+ICsNCj4gKwlyZXR1cm4gcjsNCj4gIH0NCj4gDQo+ICBz
dGF0aWMgaW50IHNvYzE1X2NvbW1vbl9zd19pbml0KHZvaWQgKmhhbmRsZSkgQEAgLTEyODksNiAr
MTI5MywxMyBAQA0KPiBzdGF0aWMgaW50IHNvYzE1X2NvbW1vbl9od19maW5pKHZvaWQgKmhhbmRs
ZSkNCj4gIAlpZiAoYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKQ0KPiAgCQl4Z3B1X2FpX21haWxib3hf
cHV0X2lycShhZGV2KTsNCj4gDQo+ICsJaWYgKGFtZGdwdV9yYXNfaXNfc3VwcG9ydGVkKGFkZXYs
IGFkZXYtPm5iaW8ucmFzX2lmLT5ibG9jaykpIHsNCj4gKwkJaWYgKGFkZXYtPm5iaW8uZnVuY3Mt
PmluaXRfcmFzX2NvbnRyb2xsZXJfaW50ZXJydXB0KQ0KPiArCQkJYW1kZ3B1X2lycV9wdXQoYWRl
diwgJmFkZXYtDQo+ID5uYmlvLnJhc19jb250cm9sbGVyX2lycSwgMCk7DQo+ICsJCWlmIChhZGV2
LT5uYmlvLmZ1bmNzLT5pbml0X3Jhc19lcnJfZXZlbnRfYXRodWJfaW50ZXJydXB0KQ0KPiArCQkJ
YW1kZ3B1X2lycV9wdXQoYWRldiwgJmFkZXYtDQo+ID5uYmlvLnJhc19lcnJfZXZlbnRfYXRodWJf
aXJxLCAwKTsNCj4gKwl9DQo+ICsNCj4gIAlyZXR1cm4gMDsNCj4gIH0NCj4gDQo+IC0tDQo+IDIu
Ny40DQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xw0KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0KPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zw0KPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
ZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
