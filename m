Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B91477F10D
	for <lists+amd-gfx@lfdr.de>; Fri,  2 Aug 2019 11:35:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E136ED8A;
	Fri,  2 Aug 2019 09:35:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760075.outbound.protection.outlook.com [40.107.76.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC3006ED8A
 for <amd-gfx@lists.freedesktop.org>; Fri,  2 Aug 2019 09:35:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kfHECR1DDB40JNDIz/R/XjPsvLES6wItY8O1/CXXXHw71EXRI5AQ/7Ffzl4dwN4DO1TVFAzRp29Enas+9gADEU7joI3HKZcl80DyWF3vk1w7VCy4lEcd3o7G70bFLvLsjLB8b3A0IAw2seRMOZmEN274ZUAXFVg8A+nl7XjaGeQyTQ2/kw1LSLcvcFMGV0tvr7IbSRIHU9miAYoMqPH6AZx3uyU05gxluFo443oD3/kj4Zt/kURpo6JNriT50c1xvlw00Lth3qHFD1izfvSSGWMupk/4irgf07rs7UGKmQDW9Zi/iPhyffynT0KtwJYEwlbUuvxVJwYCW1jkiUW8kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0YmvwYdmd7gM405wbdPzpSQgRgcvIEw5M9pXDN3QUNQ=;
 b=JLSywXDpZYdg/PrqNvE3ebcCpV4N+Lhn2EZE0my/C92VWIcCCwZnlcemiJMvPA4DpX7Gz44bgXivl+qxIosuT9zRpzRRV3oQYjpIIHlknBQ/wzFBmBtBaXlLZ9/GLAq8iZ85XyMHl89xujShtDj0Oxs2/ZLQVXnoPe9oP3BUYk+jdvbU9br5Ts4V9TdT5alLKQ+1K7O0gDyvrNM17mTVY7eo9YFjh2TkNWNfMVvbwIoWgMAIHRnsJmjqeo06ir5V+w23FEDX8opQz6bFqNh0uwa8FfZaiJyir68dl3S2VEK/CIp1WVgworbGGFo6aTHet3S0U7GLlEuLBHff+WyLLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3101.namprd12.prod.outlook.com (20.178.241.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Fri, 2 Aug 2019 09:35:42 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::f821:f3f7:3ee3:8c5e]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::f821:f3f7:3ee3:8c5e%7]) with mapi id 15.20.2136.010; Fri, 2 Aug 2019
 09:35:42 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>, "Gao, Likun" <Likun.Gao@amd.com>, 
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: remove unpin clear_state_obj for gfx v8
Thread-Topic: [PATCH] drm/amdgpu: remove unpin clear_state_obj for gfx v8
Thread-Index: AQHVSPJs/01IFPD9uky9Yh1oWzJcnqbnYIWAgAA4P0A=
Date: Fri, 2 Aug 2019 09:35:41 +0000
Message-ID: <MN2PR12MB3309BB83CBB215AA393EDEF7ECD90@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <1564723334-18375-1-git-send-email-likun.gao@amd.com>
 <BN8PR12MB3602D2293EFA72B3A3545EE389D90@BN8PR12MB3602.namprd12.prod.outlook.com>
In-Reply-To: <BN8PR12MB3602D2293EFA72B3A3545EE389D90@BN8PR12MB3602.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 62b25af0-a316-4354-66fc-08d7172cc972
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3101; 
x-ms-traffictypediagnostic: MN2PR12MB3101:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB31019D3A5BE0596209ABC89FECD90@MN2PR12MB3101.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:862;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(189003)(199004)(13464003)(68736007)(66446008)(64756008)(55016002)(478600001)(2906002)(305945005)(26005)(76116006)(4326008)(66946007)(66556008)(66476007)(53936002)(7696005)(25786009)(76176011)(476003)(71200400001)(71190400001)(7736002)(33656002)(66066001)(229853002)(3846002)(256004)(14444005)(6116002)(6506007)(52536014)(6436002)(86362001)(102836004)(6246003)(110136005)(99286004)(11346002)(54906003)(446003)(14454004)(9686003)(6306002)(186003)(966005)(8936002)(81156014)(81166006)(486006)(74316002)(8676002)(5660300002)(53546011)(2501003)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3101;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TzX3K2LROwg9H99r3lKsKetA+0L/XwQtXJhBSWfvUuLgieoHgo1CzZkThsd2dc/Hoy2DfR89iBYIUUwxqGx23ZrhD9CLk2srpWzCYym+hpIHPd/trpRtgEEwbQe3/zQ84WimVE/rz4wqJCXqaMAUKmDtuctoOw1OZnHwB/Z6m5Cdi6wcktSlMZWSu+LAtOFA2IZcyFpCP/+wRR0L9wKKFgzcO1zHFR0VFxrtrvYnxH4wtexANbcPBsh0hCKDXeDBVR6o0CWQzlAnN0u7nmeFLHLdO7EpVLHrpHeJPhWOxoZkXnO+cfkRU46zjh/XfTW/tBkM8l7X06Av86i3uYkRSx0lMHhBbKfFq99IDjGAsoEobbafAItKsToLqIHtVgzejWzubvO2uNXB9dniNepiaSpxfjYqxz/X3Up+l/0TRyc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62b25af0-a316-4354-66fc-08d7172cc972
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 09:35:42.0233 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ruihuang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3101
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0YmvwYdmd7gM405wbdPzpSQgRgcvIEw5M9pXDN3QUNQ=;
 b=lsVbhZKe/5Tq2Qa2G6gs7yLk2EtNjraRJ9PoPa98qy+RET4XJ+s9R9RtB9g+KM/W6a2KGSeGN7ULjfcBDkC5M6HNIDiUv8zd0ZKMCgaQtLGgqxmEMdxF/ydNw/qtCGOasnyCMiqG7ZKDJPoP3XKpt4W/ChZPQeitYXXluPdBkuA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Paul Gover <pmw.gover@yahoo.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SXMgdGhlIGlzc3VlIHRyaWdnZXJlZCBvbiBBUFU/DQoNCkFjdHVhbGx5LCB3aGlsZSB3ZSBkbyBT
MywgdGhlIHZyYW0gYm8gd29uJ3QgYmUgY2xlYXJlZCBvbiBBUFUuIFRoaXMgcGF0Y2ggaXMgdG8g
Zml4IHRoZSB2cmFtIGJvIGNsZWFyaW5nIG9uIHRoZSBER1BVIHNpZGUuDQoNClRoYW5rcywNClJh
eQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGFtZC1nZnggPGFtZC1n
ZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPiBZdWFuLCBY
aWFvamllDQo+IFNlbnQ6IEZyaWRheSwgQXVndXN0IDAyLCAyMDE5IDI6MTIgUE0NCj4gVG86IEdh
bywgTGlrdW4gPExpa3VuLkdhb0BhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCj4gQ2M6IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47
IFBhdWwgR292ZXINCj4gPHBtdy5nb3ZlckB5YWhvby5jby51az4NCj4gU3ViamVjdDogUmU6IFtQ
QVRDSF0gZHJtL2FtZGdwdTogcmVtb3ZlIHVucGluIGNsZWFyX3N0YXRlX29iaiBmb3IgZ2Z4IHY4
DQo+IA0KPiBIaSBMaWt1biwNCj4gDQo+IExvb2tzIGxpa2UgeW91IGNhbiBwaW4gY3NiIGJ1ZmZl
ciBAZ2Z4X3Y4XzBfaHdfaW5pdCgpIGp1c3QgbGlrZSB3aGF0DQo+IGZvbGxvd2luZyBwYXRjaCBk
b2VzIGZvciBnZng5LCBzbyB0aGF0IHdlIGNhbiBzdGlsbCB1c2UgdGhlIGNvbW1vbiBmdW5jdGlv
bg0KPiBhbWRncHVfZ2Z4X3JsY19pbml0X2NzYigpOg0KPiANCj4gY29tbWl0IDEzN2RjNGI5MDYw
ZTk5YTIyZGNlNTliNDJjYTcxOTEyY2YwMTgwZjMNCj4gQXV0aG9yOiBFdmFuIFF1YW4gPGV2YW4u
cXVhbkBhbWQuY29tPg0KPiBEYXRlOiAgIFdlZCBKdWwgNCAxNjoyMTo1MiAyMDE4ICswODAwDQo+
IA0KPiAgICAgZHJtL2FtZGdwdTogcGluIHRoZSBjc2IgYnVmZmVyIG9uIGh3IGluaXQgdjINCj4g
DQo+ICAgICBXaXRob3V0IHRoaXMgcGluLCB0aGUgY3NiIGJ1ZmZlciB3aWxsIGJlIGZpbGxlZCB3
aXRoIGluY29uc2lzdGVudA0KPiAgICAgZGF0YSBhZnRlciBTMyByZXN1bWUuIEFuZCB0aGF0IHdp
bGwgY2F1c2VzIGdmeCBoYW5nIG9uIGdmeG9mZg0KPiAgICAgZXhpdCBzaW5jZSB0aGlzIGNzYiB3
aWxsIGJlIGV4ZWN1dGVkIHRoZW4uDQo+IA0KPiAgICAgdjI6IGZpdCBhbWRncHVfYm9fcGluIGNo
YW5nZSh0YWtlIG9uZSBsZXNzIGFyZ3VtZW50KQ0KPiANCj4gICAgIFNpZ25lZC1vZmYtYnk6IEV2
YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQo+ICAgICBSZXZpZXdlZC1ieTogSHVhbmcgUnVp
IDxyYXkuaHVhbmdAYW1kLmNvbT4NCj4gICAgIFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8
YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCj4gDQo+IEJSLA0KPiBYaWFvamllDQo+IA0KPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IEZyb206IGFtZC1nZngg
PGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IG9uIGJlaGFsZiBvZiBsaWt1
bg0KPiBHYW8gPGxpa3VuLmdhb0BhbWQuY29tPg0KPiBTZW50OiBGcmlkYXksIEF1Z3VzdCAyLCAy
MDE5IDE6MjIgUE0NCj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBE
ZXVjaGVyLCBBbGV4YW5kZXI7IEdhbywgTGlrdW47IFBhdWwgR292ZXINCj4gU3ViamVjdDogW1BB
VENIXSBkcm0vYW1kZ3B1OiByZW1vdmUgdW5waW4gY2xlYXJfc3RhdGVfb2JqIGZvciBnZnggdjgN
Cj4gDQo+IEZyb206IExpa3VuIEdhbyA8TGlrdW4uR2FvQGFtZC5jb20+DQo+IA0KPiBSZW1vdmUg
dW5waW4gcmxjIGNsZWFyX3N0YXRlX29iaiBmb3IgZ2Z4IHY4IHdoZW4gcmxjIGluaXQsIHdoaWNo
IHdpbGwgbWFrZQ0KPiBTdG9uZXkgcG1fc3VzcGVuZCBoYW5nLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogTGlrdW4gR2FvIDxMaWt1bi5HYW9AYW1kLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nZnhfdjhfMC5jIHwgMjIgKysrKysrKysrKysrKysrKysrKy0tLQ0KPiAg
MSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y4XzAuYw0KPiBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OF8wLmMNCj4gaW5kZXggZDI5MDcxOC4uMGI3
M2M2ZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y4XzAu
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjhfMC5jDQo+IEBAIC0x
MjkyLDYgKzEyOTIsOCBAQCBzdGF0aWMgaW50IGdmeF92OF8wX2NwX2p1bXBfdGFibGVfbnVtKHN0
cnVjdA0KPiBhbWRncHVfZGV2aWNlICphZGV2KQ0KPiANCj4gIHN0YXRpYyBpbnQgZ2Z4X3Y4XzBf
cmxjX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpICB7DQo+ICsgICAgICAgdm9sYXRp
bGUgdTMyICpkc3RfcHRyOw0KPiArICAgICAgIHUzMiBkd3M7DQo+ICAgICAgICAgY29uc3Qgc3Ry
dWN0IGNzX3NlY3Rpb25fZGVmICpjc19kYXRhOw0KPiAgICAgICAgIGludCByOw0KPiANCj4gQEAg
LTEzMDAsMTAgKzEzMDIsMjQgQEAgc3RhdGljIGludCBnZnhfdjhfMF9ybGNfaW5pdChzdHJ1Y3Qg
YW1kZ3B1X2RldmljZQ0KPiAqYWRldikNCj4gICAgICAgICBjc19kYXRhID0gYWRldi0+Z2Z4LnJs
Yy5jc19kYXRhOw0KPiANCj4gICAgICAgICBpZiAoY3NfZGF0YSkgew0KPiAtICAgICAgICAgICAg
ICAgLyogaW5pdCBjbGVhciBzdGF0ZSBibG9jayAqLw0KPiAtICAgICAgICAgICAgICAgciA9IGFt
ZGdwdV9nZnhfcmxjX2luaXRfY3NiKGFkZXYpOw0KPiAtICAgICAgICAgICAgICAgaWYgKHIpDQo+
ICsgICAgICAgICAgICAgICAvKiBjbGVhciBzdGF0ZSBibG9jayAqLw0KPiArICAgICAgICAgICAg
ICAgYWRldi0+Z2Z4LnJsYy5jbGVhcl9zdGF0ZV9zaXplID0gZHdzID0gYWRldi0+Z2Z4LnJsYy5m
dW5jcy0NCj4gPmdldF9jc2Jfc2l6ZShhZGV2KTsNCj4gKyAgICAgICAgICAgICAgIHIgPSBhbWRn
cHVfYm9fY3JlYXRlX3Jlc2VydmVkKGFkZXYsIGR3cyAqIDQsIFBBR0VfU0laRSwNCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEFNREdQVV9HRU1fRE9NQUlO
X1ZSQU0sDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAm
YWRldi0+Z2Z4LnJsYy5jbGVhcl9zdGF0ZV9vYmosDQo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAmYWRldi0+Z2Z4LnJsYy5jbGVhcl9zdGF0ZV9ncHVfYWRk
ciwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICh2b2lk
ICoqKSZhZGV2LT5nZngucmxjLmNzX3B0cik7DQo+ICsgICAgICAgICAgICAgICBpZiAocikgew0K
PiArICAgICAgICAgICAgICAgICAgICAgICBkZXZfd2FybihhZGV2LT5kZXYsICIoJWQpIGNyZWF0
ZSBSTEMgYyBibyBmYWlsZWRcbiIsIHIpOw0KPiArICAgICAgICAgICAgICAgICAgICAgICBhbWRn
cHVfZ2Z4X3JsY19maW5pKGFkZXYpOw0KPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4g
cjsNCj4gKyAgICAgICAgICAgICAgIH0NCj4gKw0KPiArICAgICAgICAgICAgICAgLyogc2V0IHVw
IHRoZSBjcyBidWZmZXIgKi8NCj4gKyAgICAgICAgICAgICAgIGRzdF9wdHIgPSBhZGV2LT5nZngu
cmxjLmNzX3B0cjsNCj4gKyAgICAgICAgICAgICAgIGFkZXYtPmdmeC5ybGMuZnVuY3MtPmdldF9j
c2JfYnVmZmVyKGFkZXYsIGRzdF9wdHIpOw0KPiArICAgICAgICAgICAgICAgYW1kZ3B1X2JvX2t1
bm1hcChhZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX29iaik7DQo+ICsgICAgICAgICAgICAgICBh
bWRncHVfYm9fdW5yZXNlcnZlKGFkZXYtPmdmeC5ybGMuY2xlYXJfc3RhdGVfb2JqKTsNCj4gICAg
ICAgICB9DQo+IA0KPiAgICAgICAgIGlmICgoYWRldi0+YXNpY190eXBlID09IENISVBfQ0FSUkla
TykgfHwNCj4gLS0NCj4gMi43LjQNCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQo+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXw0KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0KPiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
