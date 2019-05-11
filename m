Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 258741A99A
	for <lists+amd-gfx@lfdr.de>; Sat, 11 May 2019 23:28:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC7789C03;
	Sat, 11 May 2019 21:28:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750078.outbound.protection.outlook.com [40.107.75.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA90689C03
 for <amd-gfx@lists.freedesktop.org>; Sat, 11 May 2019 21:28:39 +0000 (UTC)
Received: from BN6PR12MB1364.namprd12.prod.outlook.com (10.168.228.22) by
 BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Sat, 11 May 2019 21:28:35 +0000
Received: from BN6PR12MB1364.namprd12.prod.outlook.com
 ([fe80::304c:e454:c739:254a]) by BN6PR12MB1364.namprd12.prod.outlook.com
 ([fe80::304c:e454:c739:254a%11]) with mapi id 15.20.1878.022; Sat, 11 May
 2019 21:28:35 +0000
From: "Lin, Amber" <Amber.Lin@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, Alex Deucher
 <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu/psp: move psp version specific function
 pointers to early_init
Thread-Topic: [PATCH] drm/amdgpu/psp: move psp version specific function
 pointers to early_init
Thread-Index: AQHVBnLS4vwiRGuIX0W6qnlm6FcU16Zi2TSAgANdbXA=
Date: Sat, 11 May 2019 21:28:35 +0000
Message-ID: <BN6PR12MB136457D42BBD18A4DA9B9CE1E10D0@BN6PR12MB1364.namprd12.prod.outlook.com>
References: <20190509142334.24760-1-alexander.deucher@amd.com>
 <054e9ddd-c373-8908-ba8f-cced87b61813@gmail.com>
In-Reply-To: <054e9ddd-c373-8908-ba8f-cced87b61813@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.54.211]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 056a5bbb-975a-4ef6-1b6b-08d6d657a032
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1809; 
x-ms-traffictypediagnostic: BN6PR12MB1809:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB1809BD57047CEC3CCD6C7B0AE10D0@BN6PR12MB1809.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 00342DD5BC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(376002)(396003)(39860400002)(366004)(13464003)(199004)(189003)(6506007)(4326008)(66066001)(102836004)(53546011)(53936002)(26005)(486006)(11346002)(25786009)(966005)(476003)(72206003)(446003)(186003)(6246003)(71190400001)(14454004)(8936002)(71200400001)(6116002)(5660300002)(86362001)(68736007)(3846002)(55016002)(9686003)(6306002)(229853002)(2501003)(81156014)(7736002)(81166006)(99286004)(76176011)(305945005)(33656002)(7696005)(8676002)(76116006)(66476007)(66446008)(73956011)(66946007)(478600001)(66556008)(6436002)(2906002)(64756008)(52536014)(256004)(110136005)(316002)(74316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1809;
 H:BN6PR12MB1364.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uiekhsikMMWvH3AN4xL+/23BUJwASAwC9DFiJSHiafiSXDcpyCiFQlnkWSN+Y3ZnWA9/3xaW28qkiYfjqpYqnS7/BMUclsWfo2UJs8cg1nrY2kyX/n4L//WnVSF+bwTFVNNM3qQlpVAdesu9s3L6U5rgHJ93dLc07ubiBNyd0tsN+fkKJMBmmNcAhz+h3QckqdvMUnU0725oVYSrVASWRr35xX7TUBukBnj/W3wpe20FeZjSfkz7sTONrTrQG7aiLvlp7D/6RwkyHvrvly8w/VxvWny3r7kQepPZfdzbX/G/rMV9Na0RCwLTFtMZWThgATur3QbQF/24BbOTfbaIygIzUdUGoN0pgPMPXT/DAo7MVNjun1dUGXx19j6CeGj92WR+o21XdvFV9iDwfrUct0nkC879W2YdcOWVb81uIsE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 056a5bbb-975a-4ef6-1b6b-08d6d657a032
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2019 21:28:35.5779 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1809
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+uxIUpHztNB2sZmMtNBPkkTEvKfMnD+3zWm1gbIFbWE=;
 b=mHyCqQn9HnJq0vXlij52IMvZx3mpOCX+Hy5RSyVY+2M5coKh8wx5JkUxUun9WCubtOLerCSSJwzNBt4AlhjFp/r+2YP5bV6gosBn1BHbynVvInBhs2XBD+cBzq3CPpjA8nNbGEBstErEcLjzCqPGxOq1dkR4W8g9oUF2uIB3qK0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Amber.Lin@amd.com; 
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

UmV2aWV3ZWQtYnk6IEFtYmVyIExpbiA8QW1iZXIuTGluQGFtZC5jb20+DQoNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgQ2hyaXN0aWFuIEvDtm5pZw0KU2VudDogVGh1cnNk
YXksIE1heSA5LCAyMDE5IDEwOjI1IEFNDQpUbzogQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBn
bWFpbC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IERldWNoZXIsIEFs
ZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT4NClN1YmplY3Q6IFJlOiBbUEFUQ0hd
IGRybS9hbWRncHUvcHNwOiBtb3ZlIHBzcCB2ZXJzaW9uIHNwZWNpZmljIGZ1bmN0aW9uIHBvaW50
ZXJzIHRvIGVhcmx5X2luaXQNCg0KQW0gMDkuMDUuMTkgdW0gMTY6MjMgc2NocmllYiBBbGV4IERl
dWNoZXI6DQo+IEluIGNhc2Ugd2UgbmVlZCB0byB1c2UgdGhlbSBmb3IgR1BVIHJlc2V0IHByaW9y
IGluaXRpYWxpemluZyB0aGUgYXNpYy4gIA0KPiBGaXhlcyBhIGNyYXNoIGlmIHRoZSBkcml2ZXIg
YXR0ZW1wdHMgdG8gcmVzZXQgdGhlIEdQVSBhdCBkcml2ZXIgbG9hZCANCj4gdGltZS4NCj4NCj4g
U2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0K
DQpBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0K
DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYyB8IDE5
ICsrKysrKysrKystLS0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygr
KSwgOSBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9wc3AuYyANCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcHNwLmMNCj4gaW5kZXggOTA1Y2NlMTgxNGYzLi4wNTg5N2IwNTc2NmIgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYw0KPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMNCj4gQEAgLTM4LDE4ICszOCwxMCBA
QCBzdGF0aWMgdm9pZCBwc3Bfc2V0X2Z1bmNzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsN
Cj4gICBzdGF0aWMgaW50IHBzcF9lYXJseV9pbml0KHZvaWQgKmhhbmRsZSkNCj4gICB7DQo+ICAg
ICAgIHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNlICop
aGFuZGxlOw0KPiArICAgICBzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCA9ICZhZGV2LT5wc3A7DQo+
DQo+ICAgICAgIHBzcF9zZXRfZnVuY3MoYWRldik7DQo+DQo+IC0gICAgIHJldHVybiAwOw0KPiAt
fQ0KPiAtDQo+IC1zdGF0aWMgaW50IHBzcF9zd19pbml0KHZvaWQgKmhhbmRsZSkNCj4gLXsNCj4g
LSAgICAgc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KiloYW5kbGU7DQo+IC0gICAgIHN0cnVjdCBwc3BfY29udGV4dCAqcHNwID0gJmFkZXYtPnBzcDsN
Cj4gLSAgICAgaW50IHJldDsNCj4gLQ0KPiAgICAgICBzd2l0Y2ggKGFkZXYtPmFzaWNfdHlwZSkg
ew0KPiAgICAgICBjYXNlIENISVBfVkVHQTEwOg0KPiAgICAgICBjYXNlIENISVBfVkVHQTEyOg0K
PiBAQCAtNjcsNiArNTksMTUgQEAgc3RhdGljIGludCBwc3Bfc3dfaW5pdCh2b2lkICpoYW5kbGUp
DQo+DQo+ICAgICAgIHBzcC0+YWRldiA9IGFkZXY7DQo+DQo+ICsgICAgIHJldHVybiAwOw0KPiAr
fQ0KPiArDQo+ICtzdGF0aWMgaW50IHBzcF9zd19pbml0KHZvaWQgKmhhbmRsZSkNCj4gK3sNCj4g
KyAgICAgc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KiloYW5kbGU7DQo+ICsgICAgIHN0cnVjdCBwc3BfY29udGV4dCAqcHNwID0gJmFkZXYtPnBzcDsN
Cj4gKyAgICAgaW50IHJldDsNCj4gKw0KPiAgICAgICByZXQgPSBwc3BfaW5pdF9taWNyb2NvZGUo
cHNwKTsNCj4gICAgICAgaWYgKHJldCkgew0KPiAgICAgICAgICAgICAgIERSTV9FUlJPUigiRmFp
bGVkIHRvIGxvYWQgcHNwIGZpcm13YXJlIVxuIik7DQoNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0KYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
