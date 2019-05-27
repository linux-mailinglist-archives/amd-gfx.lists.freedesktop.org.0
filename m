Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 670122B159
	for <lists+amd-gfx@lfdr.de>; Mon, 27 May 2019 11:32:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01998897F9;
	Mon, 27 May 2019 09:31:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710076.outbound.protection.outlook.com [40.107.71.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7368897F9
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2019 09:31:57 +0000 (UTC)
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3790.namprd12.prod.outlook.com (10.255.236.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.23; Mon, 27 May 2019 09:31:56 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::18c6:70fa:9f7e:7018]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::18c6:70fa:9f7e:7018%2]) with mapi id 15.20.1922.021; Mon, 27 May 2019
 09:31:56 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Deng, Emily" <Emily.Deng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: Don't need to call csb_vram_unpin
Thread-Topic: [PATCH] drm/amdgpu: Don't need to call csb_vram_unpin
Thread-Index: AQHVFGgBi9fHbs1R+UCq4weXpQUTlqZ+tR4g
Date: Mon, 27 May 2019 09:31:56 +0000
Message-ID: <MN2PR12MB334456A5C03DEADB6494C865E41D0@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <1558946487-18034-1-git-send-email-Emily.Deng@amd.com>
In-Reply-To: <1558946487-18034-1-git-send-email-Emily.Deng@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f37dc1d-401d-4445-2c66-08d6e2862939
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3790; 
x-ms-traffictypediagnostic: MN2PR12MB3790:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3790A4FF1926251A43120597E41D0@MN2PR12MB3790.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:628;
x-forefront-prvs: 0050CEFE70
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(376002)(346002)(39860400002)(396003)(199004)(13464003)(189003)(966005)(478600001)(72206003)(53936002)(14454004)(3846002)(6116002)(2906002)(81156014)(81166006)(8936002)(8676002)(2501003)(7736002)(6246003)(4326008)(6436002)(229853002)(25786009)(305945005)(74316002)(9686003)(33656002)(6306002)(55016002)(446003)(11346002)(110136005)(476003)(486006)(186003)(316002)(52536014)(5660300002)(71200400001)(256004)(14444005)(86362001)(99286004)(66446008)(64756008)(66946007)(76116006)(66476007)(73956011)(66556008)(6506007)(53546011)(102836004)(7696005)(76176011)(68736007)(66066001)(71190400001)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3790;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /f6bA646gu061UNW6RC9ZqIxI6Zgew3y+ymzFrn8+6XOWqVhVUaofDBxBzAM96eNcOdHqS0/MO+fz5Ar/I5YQSbW0BZfbQMw9C1YUno0ZBn4LZMmQkf0eCh7i2p1cZqWjJrg8yeSqfh7kY61MmSeuqt6Q82r+FSzQeSZmNC1aaNJFTeqFZdaoEFx33Z8USmfSEQ4r//2oO5c12hV0VZJkK4U8Y37J4AfABT6ZETGn618/mv5pHOm438WRcJ/m1zXbml2Xuy7PHHyFiWzBTV24KcM3DDtr4bsYIjZEE5Pc02sXp8T1AFESfOTDarWCK958nLEviYLJ+B0R2im+vxPo1I388p0rlLL+gGojLJi/CVAyNwA620yyxk5uXKMo4cGtz+mhoYIsjPC2vzd1SXiIFew0aPHSwQnEImjztvAbI0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f37dc1d-401d-4445-2c66-08d6e2862939
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2019 09:31:56.3342 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3790
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMCplyVg3mPSM8HJLOujJ+DnRVXv21FmwXmQ2nh0lfU=;
 b=ah5VCnfSrdGnHln2VUFiH9+hk/x+9xzUJjViqnDyhQ06ZaCXYJnO9OV9n0oOjCnV790LO3vhpetbAXvJCPYihPYijuqo54Cl93ASwoTTbo9aBtqtGx4bKHN8tiZ9RRBVgsivzVsMJjrSUu1KpQivGI9J1vK7lJVgpyJ5pMOdn7o=
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
Cc: "Deng, Emily" <Emily.Deng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQpSZXZpZXdlZC1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4NCg0KPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gRW1pbHkgRGVuZw0KPiBTZW50OiBN
b25kYXksIE1heSAyNywgMjAxOSA0OjQxIFBNDQo+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KPiBDYzogRGVuZywgRW1pbHkgPEVtaWx5LkRlbmdAYW1kLmNvbT4NCj4gU3ViamVj
dDogW1BBVENIXSBkcm0vYW1kZ3B1OiBEb24ndCBuZWVkIHRvIGNhbGwgY3NiX3ZyYW1fdW5waW4N
Cj4gDQo+IEFzIGl0IHdpbGwgZGVzdHJveSBjbGVhcl9zdGF0ZV9vYmosIGFuZCBhbHNvIHdpbGwg
dW5waW4gaXQgaW4gdGhlDQo+IGdmeF92OV8wX3N3X2ZpbmksIHNvIGRvbid0IG5lZWQgdG8gY2Fs
bCBjc2JfdnJhbSB1bnBpbiBpbiBnZnhfdjlfMF9od19maW5pLA0KPiBvciBpdCB3aWxsIGhhdmUg
dW5waW4gd2FybmluZy4NCj4gDQo+IHYyOiBGb3Igc3VzcGVuZCwgc3RpbGwgbmVlZCB0byBkbyB1
bnBpbg0KPiANCj4gU2lnbmVkLW9mZi1ieTogRW1pbHkgRGVuZyA8RW1pbHkuRGVuZ0BhbWQuY29t
Pg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgfCAzICsr
LQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMNCj4g
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jDQo+IGluZGV4IDVlYjcwZTgu
LjViMWZmNDggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92
OV8wLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYw0KPiBA
QCAtMzM5NSw3ICszMzk1LDggQEAgc3RhdGljIGludCBnZnhfdjlfMF9od19maW5pKHZvaWQgKmhh
bmRsZSkNCj4gIAlnZnhfdjlfMF9jcF9lbmFibGUoYWRldiwgZmFsc2UpOw0KPiAgCWFkZXYtPmdm
eC5ybGMuZnVuY3MtPnN0b3AoYWRldik7DQo+IA0KPiAtCWdmeF92OV8wX2NzYl92cmFtX3VucGlu
KGFkZXYpOw0KPiArCWlmIChhZGV2LT5pbl9zdXNwZW5kKQ0KPiArCQlnZnhfdjlfMF9jc2JfdnJh
bV91bnBpbihhZGV2KTsNCj4gDQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+IC0tDQo+IDIuNy40DQo+
IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBh
bWQtZ2Z4IG1haWxpbmcgbGlzdA0KPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
