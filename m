Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B54D52C3F3
	for <lists+amd-gfx@lfdr.de>; Tue, 28 May 2019 12:08:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC0F89D02;
	Tue, 28 May 2019 10:08:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720052.outbound.protection.outlook.com [40.107.72.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D973789D02
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 May 2019 10:08:31 +0000 (UTC)
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3806.namprd12.prod.outlook.com (10.255.237.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Tue, 28 May 2019 10:08:30 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::5558:8fd7:ffbc:262b]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::5558:8fd7:ffbc:262b%4]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 10:08:30 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "Cui, Flora" <Flora.Cui@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: reserve stollen vram for raven series
Thread-Topic: [PATCH] drm/amdgpu: reserve stollen vram for raven series
Thread-Index: AQHVFSqxiuBcAVbo4kOeyP/Q1u3rlKaAT9ng
Date: Tue, 28 May 2019 10:08:29 +0000
Message-ID: <MN2PR12MB3309F34FAEEE8C7471B50BF6EC1E0@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <1559030095-19673-1-git-send-email-flora.cui@amd.com>
In-Reply-To: <1559030095-19673-1-git-send-email-flora.cui@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 01bcec26-16a9-46e7-2c28-08d6e3546f27
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3806; 
x-ms-traffictypediagnostic: MN2PR12MB3806:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3806793EE16AE49E2CAE7319EC1E0@MN2PR12MB3806.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:663;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(346002)(396003)(366004)(136003)(199004)(189003)(13464003)(476003)(486006)(446003)(6246003)(11346002)(66946007)(2501003)(25786009)(76116006)(2906002)(66446008)(52536014)(74316002)(68736007)(110136005)(33656002)(66476007)(305945005)(66556008)(7736002)(5660300002)(73956011)(64756008)(3846002)(6116002)(4326008)(86362001)(316002)(81166006)(7696005)(81156014)(76176011)(72206003)(26005)(66066001)(8676002)(8936002)(99286004)(478600001)(14454004)(6436002)(55016002)(256004)(229853002)(9686003)(6306002)(71190400001)(71200400001)(102836004)(966005)(6506007)(53936002)(186003)(53546011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3806;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ahyi/VVoO1JsBaN2uwHM6sXit976JbCu1bMrEVaP9LDJQD6GHP+8oK7CcCMULDPySmL/2OLOFkiLBJ7z2uSC2vD7rTBI3JAwK5JeCECEadng7v0aZCsiGYNFQMK3e2w0mnQphUm5OIre0wVTupsOBRxV4OSBZ7rOBOsHb8/KHE85c+lAFGRzHuMdylIOsHdOcscvucMqjecucnD/PfnYnqDYpDRXejnjgL3yDW6qiNNELgq6B/N8ZD1J6ZjG4ikw5jJ/HJKGg96jU2rCx946lmPurrcQGtyMLf/Slk6fIchHPE7c0Z2uBnpFXXF2Q36pSv25di4WfyzqxyBfgQSufY1dBCM+3QaWNWrXslOnVS2gM5s84TpAbgiQrHIIE0x0E3ndJ0NwwBUTxjFljxL+JPMQH6hmzICXaOo6thaQnvg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01bcec26-16a9-46e7-2c28-08d6e3546f27
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 10:08:29.9840 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ruihuang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3806
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WpIsA/ptZzaWjOUOTTBwAQX3C3OWpGXbfcIfG3rig00=;
 b=XeSZHYQ0BmqGCZKEzbnLq5SSLaX2JQamuD3dkH2vPVeL8R4ZIW4TBHY3CxOla6Ty5AmQoDU8ydYagXbTHZElRGGjr1VyZ52DivUr7SjpNazXhR6xYCDGYvdui1rMyVVEUGodw9f6R9R7zB1ogtAn/Njx9JfFtuECU5zrAjlMbLo=
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
Cc: "Cui, Flora" <Flora.Cui@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgQ3VpLA0KPiBGbG9yYQ0K
PiBTZW50OiBUdWVzZGF5LCBNYXkgMjgsIDIwMTkgMzo1NSBQTQ0KPiBUbzogYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEN1aSwgRmxvcmEgPEZsb3JhLkN1aUBhbWQuY29tPg0K
PiBTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHU6IHJlc2VydmUgc3RvbGxlbiB2cmFtIGZvciBy
YXZlbiBzZXJpZXMNCj4gDQo+IHRvIGF2b2lkIHNjcmVlbiBjb3JydXB0aW9uIGR1cmluZyBtb2Rw
cm9iZS4NCj4gDQo+IENoYW5nZS1JZDogSTg2NzFkZTZlZDQ2Mjg1NTg1ZGJlODY2ODMyYzZkMmI4
MzVjYTM3ZjMNCj4gU2lnbmVkLW9mZi1ieTogRmxvcmEgQ3VpIDxmbG9yYS5jdWlAYW1kLmNvbT4N
Cg0KVGhhbmtzLiBZZXMuIEluIHJhdmVuIHNlcmllcywgd2Ugc3RpbGwgZm91bmQgY29ycnVwdGlv
biBhdCB0aGUgc3RhcnQgb2YgdnJhbS4NCg0KUmV2aWV3ZWQtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1
YW5nQGFtZC5jb20+DQoNCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNf
djlfMC5jIHwgMyArLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxl
dGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
bWNfdjlfMC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYw0KPiBp
bmRleCA2MDI1OTNiLi5kYmM4M2ExIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nbWNfdjlfMC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dt
Y192OV8wLmMNCj4gQEAgLTYyNCw5ICs2MjQsOCBAQCBzdGF0aWMgYm9vbCBnbWNfdjlfMF9rZWVw
X3N0b2xlbl9tZW1vcnkoc3RydWN0DQo+IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+ICAJICovDQo+
ICAJc3dpdGNoIChhZGV2LT5hc2ljX3R5cGUpIHsNCj4gIAljYXNlIENISVBfVkVHQTEwOg0KPiAt
CQlyZXR1cm4gdHJ1ZTsNCj4gIAljYXNlIENISVBfUkFWRU46DQo+IC0JCXJldHVybiAoYWRldi0+
cGRldi0+ZGV2aWNlID09IDB4MTVkOCk7DQo+ICsJCXJldHVybiB0cnVlOw0KPiAgCWNhc2UgQ0hJ
UF9WRUdBMTI6DQo+ICAJY2FzZSBDSElQX1ZFR0EyMDoNCj4gIAlkZWZhdWx0Og0KPiAtLQ0KPiAy
LjcuNA0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18NCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
