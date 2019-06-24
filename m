Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E6651025
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 17:18:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A0A89C6A;
	Mon, 24 Jun 2019 15:18:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810072.outbound.protection.outlook.com [40.107.81.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC42489C6A
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 15:18:55 +0000 (UTC)
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB3191.namprd12.prod.outlook.com (20.179.92.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Mon, 24 Jun 2019 15:18:53 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::b134:9f:3a1e:2b5a]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::b134:9f:3a1e:2b5a%5]) with mapi id 15.20.2008.017; Mon, 24 Jun 2019
 15:18:53 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/display: drop ifdefs around comments
Thread-Topic: [PATCH] drm/amdgpu/display: drop ifdefs around comments
Thread-Index: AQHVKp/lAH/jAKGHskSUsaj7SMcB8qaq6wAA
Date: Mon, 24 Jun 2019 15:18:53 +0000
Message-ID: <b31cae0a-2725-20db-8c1d-92d6a4a8a6cc@amd.com>
References: <20190624151657.22959-1-alexander.deucher@amd.com>
In-Reply-To: <20190624151657.22959-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0023.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::36)
 To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a462226-09f9-424f-5344-08d6f8b74499
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3191; 
x-ms-traffictypediagnostic: BYAPR12MB3191:
x-microsoft-antispam-prvs: <BYAPR12MB3191292EF1A133E9BB94886AECE00@BYAPR12MB3191.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:765;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(346002)(366004)(39860400002)(376002)(199004)(189003)(8936002)(486006)(68736007)(6486002)(316002)(6512007)(31686004)(25786009)(6246003)(8676002)(14444005)(81156014)(81166006)(99286004)(64756008)(73956011)(66946007)(66556008)(66446008)(2616005)(14454004)(66476007)(476003)(72206003)(7736002)(53936002)(71190400001)(305945005)(36756003)(11346002)(446003)(2906002)(3846002)(6116002)(71200400001)(110136005)(102836004)(256004)(386003)(53546011)(6506007)(31696002)(186003)(478600001)(52116002)(6436002)(76176011)(86362001)(4326008)(26005)(2501003)(66066001)(5660300002)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3191;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GvBm5XfV16U2owhj5UoTKs3haLSR+PSuPHsFYPzSKtm8LN9M1cg4NLy8H9hMvt9Kd6Q8Jsyq3Qs+C24aK4kscDy0h61Ivc7Rh/A8fmGXmhUiwXT71uo4WosRkBkyuot3xhRufGmFfkhuHaMPnc0/KO/eTI6Vt+4LJFu5onE/Kuu/ER9B8cwKIW5+bR6abS+r1IMGHFAth2gsuzSMlv9w/kKqXVlX99hmpTAJGPqWhnrFXUNPup1mLUyx7c3CZSl6gVm0ojvIku/g+XDaGoKuG27ghlNfpfOjg8HJMviruOfN+VNX4k86ZK5iQxb6R3A+gIkHnaUQytTTdbRlr+4aPc6OWTgncUOfhR31P8ipgF0CbLnYIhh3eGWY7FCowbellF3SFDjaoGYw8UJYOHE4bg6SDw7LSLF6Mi7WZEQY788=
Content-ID: <494E178061844F4D811056926547F774@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a462226-09f9-424f-5344-08d6f8b74499
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 15:18:53.7334 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nkazlaus@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3191
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RYVPQdlGKsM45xvnqSUf1bLL8V0okf4vQOJrJyX4G2w=;
 b=rVsKuTRUpeq/CHvoO+GCQlRXUvr0A3PLRNNRPZCJRN0PTe0tO1KZXO6+kv9W0vFxV1m9k3nOOogxj4PTxRHQWStjUyJoEDqJfhIpox25PXuh33mH7IF8i0aA33ZlGg+WUVv9DWmi/2s9we4Va9cEk8rCFZNg6sFOIBQ8wH25YPE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
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

T24gNi8yNC8xOSAxMToxNiBBTSwgQWxleCBEZXVjaGVyIHdyb3RlOg0KPiBObyBuZWVkIHRvIHBy
b3RlY3QgdGhlIGNvbW1lbnRzLiAgVGhlIERDTjFfMDEgY29uZmlnDQo+IHdhcyBkb3BwZWQgYW55
d2F5LiAgR290IGFjY2lkZW50bHkgYnJvdWdodCBiYWNrIHdpdGggdGhlDQo+IG5hdmkgbWVyZ2Uu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFt
ZC5jb20+DQoNClJldmlld2VkLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXps
YXVza2FzQGFtZC5jb20+DQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjbjEwL2RjbjEwX2h1YmJ1Yi5jIHwgNiAtLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwg
NiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNuMTAvZGNuMTBfaHViYnViLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNuMTAvZGNuMTBfaHViYnViLmMNCj4gaW5kZXggZGFhMjI5Yjk3ZmNmLi4wYWIzOTE0
NDZkM2QgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24x
MC9kY24xMF9odWJidWIuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNuMTAvZGNuMTBfaHViYnViLmMNCj4gQEAgLTE0NSw3ICsxNDUsNiBAQCBib29sIGh1YmJ1YjFf
dmVyaWZ5X2FsbG93X3BzdGF0ZV9jaGFuZ2VfaGlnaCgNCj4gICAJCWZvcmNlZF9wc3RhdGVfYWxs
b3cgPSBmYWxzZTsNCj4gICAJfQ0KPiAgIA0KPiAtI2lmZGVmIENPTkZJR19EUk1fQU1EX0RDX0RD
TjFfMDENCj4gICAJLyogUlYyOg0KPiAgIAkgKiBkY2h1YmJ1YmRlYnVnaW5kLCBhdDogMHhCDQo+
ICAgCSAqIGRlc2NyaXB0aW9uDQo+IEBAIC0xODIsOCArMTgxLDYgQEAgYm9vbCBodWJidWIxX3Zl
cmlmeV9hbGxvd19wc3RhdGVfY2hhbmdlX2hpZ2goDQo+ICAgCSAqIDMwOiAgICBBcmJpdGVyJ3Mg
YWxsb3dfcHN0YXRlX2NoYW5nZQ0KPiAgIAkgKiAzMTogICAgU09DIHBzdGF0ZSBjaGFuZ2UgcmVx
dWVzdCINCj4gICAJICovDQo+IC0jZWxzZQ0KPiAtI2lmZGVmIENPTkZJR19EUk1fQU1EX0RDX0RD
TjJfMA0KPiAgIAkvKkRDTjIueDoNCj4gICAJSFVCQlVCOkRDSFVCQlVCX1RFU1RfQVJCX0RFQlVH
MTAgRENIVUJCVUJERUJVR0lORDoweEINCj4gICAJMDogUGlwZTAgUGxhbmUwIEFsbG93IFAtc3Rh
dGUgQ2hhbmdlDQo+IEBAIC0yMTksNyArMjE2LDYgQEAgYm9vbCBodWJidWIxX3ZlcmlmeV9hbGxv
d19wc3RhdGVfY2hhbmdlX2hpZ2goDQo+ICAgCTMwOiBBcmJpdGVyYHMgQWxsb3cgUC1zdGF0ZSBD
aGFuZ2UNCj4gICAJMzE6IFNPQyBQLXN0YXRlIENoYW5nZSByZXF1ZXN0DQo+ICAgCSovDQo+IC0j
ZWxzZQ0KPiAgIAkvKiBSVjE6DQo+ICAgCSAqIGRjaHViYnViZGVidWdpbmQsIGF0OiAweDcNCj4g
ICAJICogZGVzY3JpcHRpb24gIjMtMDogICBQaXBlMCBjdXJzb3IwIFFPUw0KPiBAQCAtMjQzLDgg
KzIzOSw2IEBAIGJvb2wgaHViYnViMV92ZXJpZnlfYWxsb3dfcHN0YXRlX2NoYW5nZV9oaWdoKA0K
PiAgIAkgKiAzMDogICAgQXJiaXRlcidzIGFsbG93X3BzdGF0ZV9jaGFuZ2UNCj4gICAJICogMzE6
ICAgIFNPQyBwc3RhdGUgY2hhbmdlIHJlcXVlc3QNCj4gICAJICovDQo+IC0jZW5kaWYNCj4gLSNl
bmRpZg0KPiAgIA0KPiAgIAlSRUdfV1JJVEUoRENIVUJCVUJfVEVTVF9ERUJVR19JTkRFWCwgaHVi
YnViMS0+ZGVidWdfdGVzdF9pbmRleF9wc3RhdGUpOw0KPiAgIA0KPiANCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
