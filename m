Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D835D99097
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 12:20:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7744F6EAEF;
	Thu, 22 Aug 2019 10:20:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720046.outbound.protection.outlook.com [40.107.72.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A606EAEF
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 10:20:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=POFYh6Grka0UzAluoy+LVZ0Ch9tVUBPj1W6YQSNvC8br7PAB0wlBr+N9RdR7vFEAC6Np0q5WuCDahlbPg8Xq2JiT3G70gAs9uemHWStEUSNKwmF25PsjKp8YgX7JXUiYerKLjVMdMv5BGQ6iq5UPktaMa1OP88X3aPzthftaJnpAQEiL4bE0EBDS0VUPNVorB+9QgFo2F5nI8cq87fd5kUMGANWT/TrMCjAvFYoGQX1DkQNSWU85AXQDs73ndW9e/xbDRRPSL0e8S/INTwrPnggH4QggU1w5++EzGUA+V2uBZt7EiX/BEiT6p+BzHoYZ7g+l5KhXSaliLIeMbqr3ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XEF0rWPtbb22zO17FAj6dHA+NvqKsnDLlpq1HSCHiJ8=;
 b=EyAHXMG89bqV5QY4sqkElq+T50hWgst0uOZ+asLz/7hRpj59pMrxEFjKCET5AY4zmKDewuQ2/y08V3TzKMv4D8m2EZWxHo9LTn4n3bsS4/wsziX+NgC+MPa0aUAPRfkhAkxXTlX7h6KAqxv/JLhIkdDOLyS0z/ZQNvSQR3E+Nbgvo0gkVx3EOk1mwmd1135q4P1hp5+4LZ2HxNqCZ7YceHZuDxtqIE3Y5PYryxYizSnLY+P5HNBYGaqc2j4kop6xX7Trr+AMU3vYtiEeKvgHviRLDK7TFl9DMFWp8q1p11DiSoJCzZiedSbvmHg15Jr+qdIrLsjT0ruaqU1mNIaVzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2SPR01MB0018.namprd12.prod.outlook.com (52.132.175.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Thu, 22 Aug 2019 10:20:40 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::6cae:3314:7799:3077]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::6cae:3314:7799:3077%6]) with mapi id 15.20.2178.020; Thu, 22 Aug 2019
 10:20:40 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: update cached feature enablement status
Thread-Topic: [PATCH] drm/amd/powerplay: update cached feature enablement
 status
Thread-Index: AQHVWAI5zahOJmEF6027wehCYZZXx6cFe5YAgAFteJA=
Date: Thu, 22 Aug 2019 10:20:40 +0000
Message-ID: <MN2PR12MB3344188028981DA0FA321A39E4A50@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190821092413.27155-1-evan.quan@amd.com>
 <861ead73-5ce2-ea37-746d-bc82b79d9b88@amd.com>
In-Reply-To: <861ead73-5ce2-ea37-746d-bc82b79d9b88@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b0038e1-2125-405b-52fb-08d726ea61f3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2SPR01MB0018; 
x-ms-traffictypediagnostic: MN2SPR01MB0018:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2SPR01MB0018625393CA1577FCC1E97FE4A50@MN2SPR01MB0018.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:419;
x-forefront-prvs: 01371B902F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(396003)(39860400002)(366004)(13464003)(199004)(189003)(446003)(76176011)(52536014)(11346002)(110136005)(229853002)(316002)(478600001)(14454004)(66066001)(86362001)(6436002)(33656002)(6306002)(9686003)(7696005)(53546011)(966005)(71200400001)(71190400001)(55016002)(99286004)(26005)(186003)(102836004)(6506007)(74316002)(256004)(14444005)(305945005)(476003)(6246003)(8676002)(2906002)(25786009)(6116002)(53936002)(3846002)(15650500001)(81166006)(2501003)(76116006)(66476007)(66946007)(64756008)(486006)(66556008)(66446008)(7736002)(5660300002)(81156014)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2SPR01MB0018;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dJeJhKnkf9/sjxXe9sVAx/sVwRz37JP6u7pLxqFOm9QIb4HmlvUDyVHIHftc9fJDKwJWbZNyr+TP5t8CA/V+8WXh2Oys0utqOmuhhPyKv/0nE526eeHfhI+S/3ZkvkhYQ8OiyVpvMoI3H7vEGBi03G76y+7LPfvNpre2s7GnOf8eD+nhvC3HRTHDCqv3+ct98AO+gtEJeROcjR12NTnMbo455ggPtNChZ2oFKOwWMmD2KbQf/rZSqozdWHgOfNvYk9mkfFhs0eOJBd4matHTXdjGzMBExa9Jt9MTn7DY0hyg2h+NGwclQp68Maky+Yd3vQyipwvnZq4+sZdeL/3bKAr9OI/xetoyMoGKi157BySVGfVUNzto+R8484wh+Q54DRuYkKPwmL/o9ukQpJoyVz3QLWmGvgSGNEo+nSwCkzs=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b0038e1-2125-405b-52fb-08d726ea61f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2019 10:20:40.1245 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g4u7nTk50j7d1VtjhkccjH9b3GbJsE0d5uYyGurNui7WpbiDt3mKEuyGbpjIkSZm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2SPR01MB0018
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XEF0rWPtbb22zO17FAj6dHA+NvqKsnDLlpq1HSCHiJ8=;
 b=p6BZw92B83N+3dz6T/G8FIZ/LW+OKNAdH1+bXCxDGMwkwDgYosqRzdEO9GwNvvzHBgTqc98DPIK4DpWABDn3gUZGA50sY90k442VCtCIbVZtvl6IAaBVOhHqHzuaYC9B/PgXYw+QWnn2tnqcswUaGeTvmEZ3RC1zyYD3rIRmPhk=
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

UGxlYXNlIGNoZWNrIFYyLg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFs
ZiBPZg0KPiBLZXZpbiBXYW5nDQo+IFNlbnQ6IFdlZG5lc2RheSwgQXVndXN0IDIxLCAyMDE5IDc6
NDUgUE0NCj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0hdIGRybS9hbWQvcG93ZXJwbGF5OiB1cGRhdGUgY2FjaGVkIGZlYXR1cmUNCj4gZW5h
YmxlbWVudCBzdGF0dXMNCj4gDQo+IEhpIEV2YW4sDQo+IA0KPiB0aGlzIGlzIGtub3cgaXNzdWUg
Zm9yIG1lLg0KPiBpIHRoaW5rIHdlIHNob3VsZCBhZGQgdXBkYXRlIGZlYXR1cmUgbWFzayBjYWNo
ZWQgb3BlcmF0aW9uIGludG8NCj4gc211X2ZlYXR1cmVfdXBkYXRlX2VuYWJsZV9zdGF0ZSBmdW5j
dGlvbi4NCj4gDQo+IEJlc3QgUmVnYXJkcywNCj4gS2V2aW4NCj4gDQo+IE9uIDgvMjEvMTkgNToy
NCBQTSwgRXZhbiBRdWFuIHdyb3RlOg0KPiA+IE5lZWQgdG8gdXBkYXRlIGluIGNhY2hlIGZlYXR1
cmUgZW5hYmxlbWVudCBzdGF0dXMgYWZ0ZXIgcHBfZmVhdHVyZQ0KPiA+IHNldHRpbmdzLiBBbm90
aGVyIGZpeCBmb3IgdGhlIGNvbW1pdCBiZWxvdzoNCj4gPiBkcm0vYW1kL3Bvd2VycGxheTogaW1w
bG1lbnQgc3lzZnMgZmVhdHVyZSBzdGF0dXMgZnVuY3Rpb24gaW4gc211DQo+ID4NCj4gPiBDaGFu
Z2UtSWQ6IEk5MGUyOWIwZDgzOWRmMjY4MjVkNTk5MzIxMmY2MDk3YzdhZDRiZWJmDQo+ID4gU2ln
bmVkLW9mZi1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4NCj4gPiAtLS0NCj4gPiAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyB8IDE2DQo+ICsrKysr
KysrKysrKysrKysNCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspDQo+ID4N
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3Nt
dS5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMNCj4g
PiBpbmRleCBjNjYzZDI1ZGI1YWIuLjA0ODY3Y2FmYjMyMiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMNCj4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMNCj4gPiBAQCAtOTYsMTEgKzk2LDEz
IEBAIHNpemVfdCBzbXVfc3lzX2dldF9wcF9mZWF0dXJlX21hc2soc3RydWN0DQo+ID4gc211X2Nv
bnRleHQgKnNtdSwgY2hhciAqYnVmKQ0KPiA+DQo+ID4gICBpbnQgc211X3N5c19zZXRfcHBfZmVh
dHVyZV9tYXNrKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCB1aW50NjRfdA0KPiBuZXdfbWFzaykN
Cj4gPiAgIHsNCj4gPiArCXN0cnVjdCBzbXVfZmVhdHVyZSAqZmVhdHVyZSA9ICZzbXUtPnNtdV9m
ZWF0dXJlOw0KPiA+ICAgCWludCByZXQgPSAwOw0KPiA+ICAgCXVpbnQzMl90IGZlYXR1cmVfbWFz
a1syXSA9IHsgMCB9Ow0KPiA+ICAgCXVpbnQ2NF90IGZlYXR1cmVfMl9lbmFibGVkID0gMDsNCj4g
PiAgIAl1aW50NjRfdCBmZWF0dXJlXzJfZGlzYWJsZWQgPSAwOw0KPiA+ICAgCXVpbnQ2NF90IGZl
YXR1cmVfZW5hYmxlcyA9IDA7DQo+ID4gKwl1aW50NjRfdCBmZWF0dXJlX2lkOw0KPiA+DQo+ID4g
ICAJcmV0ID0gc211X2ZlYXR1cmVfZ2V0X2VuYWJsZWRfbWFzayhzbXUsIGZlYXR1cmVfbWFzaywg
Mik7DQo+ID4gICAJaWYgKHJldCkNCj4gPiBAQCAtMTE1LDExICsxMTcsMjUgQEAgaW50IHNtdV9z
eXNfc2V0X3BwX2ZlYXR1cmVfbWFzayhzdHJ1Y3QNCj4gc211X2NvbnRleHQgKnNtdSwgdWludDY0
X3QgbmV3X21hc2spDQo+ID4gICAJCXJldCA9IHNtdV9mZWF0dXJlX3VwZGF0ZV9lbmFibGVfc3Rh
dGUoc211LA0KPiBmZWF0dXJlXzJfZW5hYmxlZCwgdHJ1ZSk7DQo+ID4gICAJCWlmIChyZXQpDQo+
ID4gICAJCQlyZXR1cm4gcmV0Ow0KPiA+ICsNCj4gPiArCQltdXRleF9sb2NrKCZmZWF0dXJlLT5t
dXRleCk7DQo+ID4gKwkJZm9yIChmZWF0dXJlX2lkID0gMDsgZmVhdHVyZV9pZCA8IDY0OyBmZWF0
dXJlX2lkKyspIHsNCj4gPiArCQkJaWYgKGZlYXR1cmVfMl9lbmFibGVkICYgKDFVTEwgPDwgZmVh
dHVyZV9pZCkpDQo+ID4gKwkJCQl0ZXN0X2FuZF9zZXRfYml0KGZlYXR1cmVfaWQsIGZlYXR1cmUt
DQo+ID5lbmFibGVkKTsNCj4gPiArCQl9DQo+ID4gKwkJbXV0ZXhfdW5sb2NrKCZmZWF0dXJlLT5t
dXRleCk7DQo+ID4gICAJfQ0KPiA+ICAgCWlmIChmZWF0dXJlXzJfZGlzYWJsZWQpIHsNCj4gPiAg
IAkJcmV0ID0gc211X2ZlYXR1cmVfdXBkYXRlX2VuYWJsZV9zdGF0ZShzbXUsDQo+IGZlYXR1cmVf
Ml9kaXNhYmxlZCwgZmFsc2UpOw0KPiA+ICAgCQlpZiAocmV0KQ0KPiA+ICAgCQkJcmV0dXJuIHJl
dDsNCj4gPiArDQo+ID4gKwkJbXV0ZXhfbG9jaygmZmVhdHVyZS0+bXV0ZXgpOw0KPiA+ICsJCWZv
ciAoZmVhdHVyZV9pZCA9IDA7IGZlYXR1cmVfaWQgPCA2NDsgZmVhdHVyZV9pZCsrKSB7DQo+ID4g
KwkJCWlmIChmZWF0dXJlXzJfZGlzYWJsZWQgJiAoMVVMTCA8PCBmZWF0dXJlX2lkKSkNCj4gPiAr
CQkJCXRlc3RfYW5kX2NsZWFyX2JpdChmZWF0dXJlX2lkLCBmZWF0dXJlLQ0KPiA+ZW5hYmxlZCk7
DQo+ID4gKwkJfQ0KPiA+ICsJCW11dGV4X3VubG9jaygmZmVhdHVyZS0+bXV0ZXgpOw0KPiA+ICAg
CX0NCj4gPg0KPiA+ICAgCXJldHVybiByZXQ7DQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fDQo+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+IGFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
