Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE4FBB2D5
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 13:33:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CBAF6E892;
	Mon, 23 Sep 2019 11:33:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790058.outbound.protection.outlook.com [40.107.79.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C396E890
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 11:33:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SK2aqPoL6cX5/p+PIj12ytHyWRYVdKSiA8j9Gegz10DCzzOGHrESwuj+XIfoXg/APbxVWMc/plOKZQ4+Y3ttl0VjwMjWYK5ewAnP/7AIEdDKN9r392ORhyAK+YWCZgYL+zJAYdf/7tqIXoTShD+nyoBfC6krkExlAn2tTNTfUzVxqu92XSgd8vI3INxNgIrgBKS9+MTaDpJmIlnpBeIdHzGercQvaMp2qlzLf4BjalRR5223CWZcKxRiPGHapEZRBft3K+QP3QF6o4hQmcs+HAVrQbYj0Xz2wznZ9s9UJR5CltjYLPo866aX2uGQzeSdi5GFXfdedJKWNpM6xhqw5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oA3RkHELvRXyLAh0xwOUAHQPkK4w9r/mSbUPewlFX9M=;
 b=Veoo1NXi6Z3T2EOYXyd1WL5hOFS2dgJJPeI0PfzWAiJNz+RKslCi4hvGTEXXo2kz/s3z2zs3bmC9yQzhg7q6L4H/4+FbNf3PF0IYS2hulW80lX4PhE2546MPao5qbYbCk9pTuzfDh2wDMZuhsArk92qJdJLaKdiQJYhIjYNxuwj85t4oxBxs5lvFafmiobMrjPxT//ED1ohA1CkzN7hTbm6w1ONKZlBTa3dL+4RGMq4MusGfZdS1lPiosmUl10BDTS2Gshzat0wCqMR6p+aRHEpOYGullWN/GkLSTB7GbqRBx9fgwrL4sT18tjIcL4QamA/ECC1DBsH27RqxWabefA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB4333.namprd12.prod.outlook.com (52.135.48.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.23; Mon, 23 Sep 2019 11:33:36 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 11:33:36 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Chen, Guchun" <Guchun.Chen@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: RE: [PATCH 05/21] drm/amdgpu: refine sdma4 ras_data_cb
Thread-Topic: [PATCH 05/21] drm/amdgpu: refine sdma4 ras_data_cb
Thread-Index: AQHVbrmfh65heiGeKkKEN1nt4WVKzaczB1SAgAYgj2A=
Date: Mon, 23 Sep 2019 11:33:36 +0000
Message-ID: <MN2PR12MB3054A430D6059E35737B649EB0850@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <20190919071115.16552-1-tao.zhou1@amd.com>
 <20190919071115.16552-6-tao.zhou1@amd.com>
 <BYAPR12MB280631BB2C0981BAFE4FE991F1890@BYAPR12MB2806.namprd12.prod.outlook.com>
In-Reply-To: <BYAPR12MB280631BB2C0981BAFE4FE991F1890@BYAPR12MB2806.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 978ca364-bf23-4a1f-ae86-08d74019dfc2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4333; 
x-ms-traffictypediagnostic: MN2PR12MB4333:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB43338EB13D4C95FBC3E9F862B0850@MN2PR12MB4333.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1443;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(189003)(199004)(13464003)(66066001)(33656002)(81166006)(305945005)(316002)(66476007)(99286004)(66556008)(64756008)(66446008)(71190400001)(71200400001)(102836004)(66946007)(76116006)(6636002)(6246003)(52536014)(186003)(76176011)(110136005)(26005)(74316002)(486006)(256004)(446003)(476003)(2501003)(6436002)(229853002)(5660300002)(6506007)(2906002)(14454004)(11346002)(55016002)(53546011)(7696005)(86362001)(25786009)(81156014)(3846002)(8936002)(6116002)(478600001)(7736002)(8676002)(9686003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4333;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zY44WaX+YakuHg0ZG6No9K0VkMEUPmbvAYS+II+k45TXg/hKh0VfGtNqvMIHf2skKbgAmOFbOhZGjDsCE5B+pHKFBRL9m3XX+3Rmugoly+ckBAf5GqR19NIsAgS9vX+JSfdaPfH97JHJHH+mUsKcwWTN/HL1DeGi0qYU8jPMKlTxgEybiZV3/4XSm2zzV83u7Su09PWhIj7NXOrdJfEHBGXE66MOcWig/UpjiEHfDOaCvu/IG260QEqxfPo3cwTr9csBdj+15i/BBMQttI6+NbyDiMgMgpLgZgp4ybtL2m5OZszh+r8JSVdyyjAjLBzGpwdh0rU6WGk8AX8KwWwY0yvvgq2Er5xXf1KTetsJIhnVcro20J2BpoxTZ7kBtgJvyvpo3gi5CZqC8uqq/Db/DzXp028t8IT8wnOxW8MOyf4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 978ca364-bf23-4a1f-ae86-08d74019dfc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 11:33:36.7543 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: erZEk2Vpybq3igvt1czAiSTGM1c1a7xii5ZoB7T+uyfknyAxfkkPvoNJ0937+Mu1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4333
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oA3RkHELvRXyLAh0xwOUAHQPkK4w9r/mSbUPewlFX9M=;
 b=HPzTPE89UZU81wgiP4FbyZVB2PcdaIlH+9Yo5R/Ak5QCUYfrpTOwhln1kyFFipix72nC3MJ3+DIE9ePWjPzGU58EW8vLd+tXnwdlkd6hKFgp9AKOOmXiwywaWiO1vTCHqzAF/88J+oKf/MYkYzghEXC4D46/6/iyT4WihlMKUkc=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2hlbiwgR3VjaHVuIDxH
dWNodW4uQ2hlbkBhbWQuY29tPg0KPiBTZW50OiAyMDE55bm0OeaciDE55pelIDIxOjU5DQo+IFRv
OiBaaG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnOw0KPiBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KPiBTdWJq
ZWN0OiBSRTogW1BBVENIIDA1LzIxXSBkcm0vYW1kZ3B1OiByZWZpbmUgc2RtYTQgcmFzX2RhdGFf
Y2INCj4gDQo+IA0KPiANCj4gDQo+IFJlZ2FyZHMsDQo+IEd1Y2h1bg0KPiANCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWmhvdTEsIFRhbyA8VGFvLlpob3UxQGFtZC5jb20+
DQo+IFNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgMTksIDIwMTkgMzoxMyBQTQ0KPiBUbzogYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IENoZW4sIEd1Y2h1bg0KPiA8R3VjaHVuLkNoZW5A
YW1kLmNvbT47IFpoYW5nLCBIYXdraW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+DQo+IENjOiBa
aG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIDA1LzIxXSBk
cm0vYW1kZ3B1OiByZWZpbmUgc2RtYTQgcmFzX2RhdGFfY2INCj4gDQo+IHNpbXBsaWZ5IGNvZGUg
bG9naWMgYW5kIHJlZmluZSByZXR1cm4gdmFsdWUNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFRhbyBa
aG91IDx0YW8uemhvdTFAYW1kLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9zZG1hX3Y0XzAuYyB8IDMyICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0tDQo+ICAxIGZp
bGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMNCj4gYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYw0KPiBpbmRleCBhOGU0YjdkODgwZmUu
LmY2ODVhMjM3NzYxNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
c2RtYV92NF8wLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8w
LmMNCj4gQEAgLTE5NDIsMjUgKzE5NDIsMjcgQEAgc3RhdGljIGludA0KPiBzZG1hX3Y0XzBfcHJv
Y2Vzc19yYXNfZGF0YV9jYihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gIAl1aW50MzJf
dCBlcnJfc291cmNlOw0KPiAgCWludCBpbnN0YW5jZTsNCj4gDQo+IC0JaWYgKCFhbWRncHVfcmFz
X2lzX3N1cHBvcnRlZChhZGV2LCBBTURHUFVfUkFTX0JMT0NLX19HRlgpKSB7DQo+IC0JCWluc3Rh
bmNlID0gc2RtYV92NF8wX2lycV9pZF90b19zZXEoZW50cnktPmNsaWVudF9pZCk7DQo+IC0JCWlm
IChpbnN0YW5jZSA8IDApDQo+IC0JCQlyZXR1cm4gMDsNCj4gKwlpZiAoYW1kZ3B1X3Jhc19pc19z
dXBwb3J0ZWQoYWRldiwgQU1ER1BVX1JBU19CTE9DS19fR0ZYKSkNCj4gKwkJZ290byBvdXQ7DQo+
IA0KPiAtCQlzd2l0Y2ggKGVudHJ5LT5zcmNfaWQpIHsNCj4gLQkJY2FzZSBTRE1BMF80XzBfX1NS
Q0lEX19TRE1BX1NSQU1fRUNDOg0KPiAtCQkJZXJyX3NvdXJjZSA9IDA7DQo+IC0JCQlicmVhazsN
Cj4gLQkJY2FzZSBTRE1BMF80XzBfX1NSQ0lEX19TRE1BX0VDQzoNCj4gLQkJCWVycl9zb3VyY2Ug
PSAxOw0KPiAtCQkJYnJlYWs7DQo+IC0JCWRlZmF1bHQ6DQo+IC0JCQlyZXR1cm4gMDsNCj4gLQkJ
fQ0KPiArCWluc3RhbmNlID0gc2RtYV92NF8wX2lycV9pZF90b19zZXEoZW50cnktPmNsaWVudF9p
ZCk7DQo+ICsJaWYgKGluc3RhbmNlIDwgMCkNCj4gKwkJZ290byBvdXQ7DQo+IA0KPiAtCQlhbWRn
cHVfc2RtYV9wcm9jZXNzX3Jhc19kYXRhX2NiKGFkZXYsIGVycl9kYXRhLCBlbnRyeSk7DQo+ICsJ
c3dpdGNoIChlbnRyeS0+c3JjX2lkKSB7DQo+ICsJY2FzZSBTRE1BMF80XzBfX1NSQ0lEX19TRE1B
X1NSQU1fRUNDOg0KPiArCQllcnJfc291cmNlID0gMDsNCj4gW0d1Y2h1bl1Mb29rcyBubyBvbmUg
dXNlcyB0aGlzIHZhcmlhYmxlLiBDYW4gd2UgcmVtb3ZlIGl0IGRpcmVjdGx5PyBJIGFtIG5vdA0K
PiBzdXJlIHdoeSB3ZSBhZGRlZCBvbmUgc3dpdGNoIGNhc2UgaGVyZS4NCltUYW9dIE9LLCBJJ2xs
IHJlbW92ZSBpdC4NCg0KPiANCj4gKwkJYnJlYWs7DQo+ICsJY2FzZSBTRE1BMF80XzBfX1NSQ0lE
X19TRE1BX0VDQzoNCj4gKwkJZXJyX3NvdXJjZSA9IDE7DQo+ICsJCWJyZWFrOw0KPiArCWRlZmF1
bHQ6DQo+ICsJCWdvdG8gb3V0Ow0KPiAgCX0NCj4gDQo+ICsJYW1kZ3B1X3NkbWFfcHJvY2Vzc19y
YXNfZGF0YV9jYihhZGV2LCBlcnJfZGF0YSwgZW50cnkpOw0KPiArDQo+ICtvdXQ6DQo+ICAJcmV0
dXJuIEFNREdQVV9SQVNfU1VDQ0VTUzsNCj4gIH0NCj4gDQo+IC0tDQo+IDIuMTcuMQ0KDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
