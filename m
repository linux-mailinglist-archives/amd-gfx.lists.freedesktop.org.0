Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D44663B710
	for <lists+amd-gfx@lfdr.de>; Mon, 10 Jun 2019 16:16:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68FE489137;
	Mon, 10 Jun 2019 14:16:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780073.outbound.protection.outlook.com [40.107.78.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E0089137
 for <amd-gfx@lists.freedesktop.org>; Mon, 10 Jun 2019 14:16:20 +0000 (UTC)
Received: from CY4PR1201MB0102.namprd12.prod.outlook.com (10.172.77.148) by
 CY4PR1201MB0072.namprd12.prod.outlook.com (10.172.77.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.17; Mon, 10 Jun 2019 14:16:18 +0000
Received: from CY4PR1201MB0102.namprd12.prod.outlook.com
 ([fe80::318f:bfcc:e4d2:1af9]) by CY4PR1201MB0102.namprd12.prod.outlook.com
 ([fe80::318f:bfcc:e4d2:1af9%8]) with mapi id 15.20.1965.017; Mon, 10 Jun 2019
 14:16:18 +0000
From: James Zhu <jamesz@amd.com>
To: "Shamis, Leonid" <Leonid.Shamis@amd.com>, "Zhu, James"
 <James.Zhu@amd.com>, Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Add GDS clearing workaround in later init for
 gfx9
Thread-Topic: [PATCH] drm/amdgpu: Add GDS clearing workaround in later init
 for gfx9
Thread-Index: AQHVHU9fi+Ptg8J/EEmosJ0MSRUp9KaQf4CAgAAP5oCAAAgmgP//xoqAgASVa4A=
Date: Mon, 10 Jun 2019 14:16:17 +0000
Message-ID: <a321a5ab-5341-c348-2d97-a4bc50888949@amd.com>
References: <1559925472-20077-1-git-send-email-James.Zhu@amd.com>
 <CADnq5_NBWcUtXsBbQP5uBvaOFgWXw3Lhj=ZOisVyTctqZph=xQ@mail.gmail.com>
 <19203faa-970e-732b-a0e0-d2d1fe69ce30@amd.com>
 <65266293-ac7a-c3ef-752b-1691299b1f28@amd.com>
 <3598A781-7AF5-4DDE-83AE-8835E85573D3@amd.com>
In-Reply-To: <3598A781-7AF5-4DDE-83AE-8835E85573D3@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0052.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::29) To CY4PR1201MB0102.namprd12.prod.outlook.com
 (2603:10b6:910:1b::20)
x-originating-ip: [165.204.55.251]
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ffe4dee3-d96e-4634-3263-08d6edae3449
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0072; 
x-ms-traffictypediagnostic: CY4PR1201MB0072:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CY4PR1201MB007278B8D93B5C706E241AF8E4130@CY4PR1201MB0072.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0064B3273C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(376002)(39860400002)(346002)(136003)(199004)(189003)(8676002)(71190400001)(71200400001)(478600001)(81156014)(81166006)(6486002)(305945005)(25786009)(31696002)(14444005)(476003)(2906002)(6246003)(11346002)(54906003)(486006)(66066001)(2616005)(256004)(53936002)(316002)(110136005)(66946007)(73956011)(66476007)(72206003)(31686004)(68736007)(36756003)(186003)(966005)(4326008)(66446008)(64756008)(66556008)(26005)(446003)(6116002)(76176011)(6506007)(53546011)(3846002)(102836004)(6436002)(14454004)(6512007)(99286004)(229853002)(6306002)(7736002)(386003)(52116002)(8936002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0072;
 H:CY4PR1201MB0102.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Gu7n7eHH8dgtt8WxA7OYoRrrppqNSbng5ju9D/Y03DPgDsDM8JZfnMwQ9Idq0x5beoU6d4smeN0lCrco23U648xtS1CoXTwIeNeVagG2MRG2zGiVqmcyrJINV8qirObQ3AnOF5oVwllz8NL/HkvrkljKV9hw2fTsCZ/E7z1O8jEJ59TNJTVDiHzvmRK3pAmeqeYtma4+j3zClmTej4mezNt3FaTsbvtFz/iX/SIfvfEXuRbyGtuAy6yx6Qc4ICSSCD200/jG/u/+xjpNs81YhcyFDasvdSRivSIjyPdASS3HAf+tJxNzXQKUVcbJ5jJfZjecehhGdwzrgcTq4X4liqT1O3LziHzi5xcwL2t+Fu7N2QF4xYPSHV/zBARX4JE8u5JcR/unhkh2Bu8MTlqqUv7wDWi75RXS+Pmv5hhFXRo=
Content-ID: <2280D8D54E30B64492868B548160595D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffe4dee3-d96e-4634-3263-08d6edae3449
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2019 14:16:18.0071 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jamesz@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0072
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tnz72J+VwNj9Ohsvsk15G9j9yZ095IDTiAwQqmrUsIU=;
 b=q9/kX3y8ohWWcTUVhcmwJ01OGRTpp5vgcCr6N8ynP/Kh+oUCTDUHLQEFPSPoFtyE/I+plWCK4wbI+c3KC5fStHYpPxqNfwvpKZZWkGe1PRbnWG+T4pRDjCzVurgP0yREnCmDJg5E7HOvl75xZyrpyOXLXts9Kk1ulRjo70B2bJk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=James.Zhu@amd.com; 
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
Cc: "Gabra, Maroun" <Maroun.Gabra@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Liu,
 Shaoyun" <Shaoyun.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQpPbiAyMDE5LTA2LTA3IDQ6MTYgcC5tLiwgU2hhbWlzLCBMZW9uaWQgd3JvdGU6DQo+IEphbWVz
LA0KPg0KPiBEbyB5b3Ugc2V0IEdEU19WTUlEMF9CQVNFIHRvIDA/Li4gSSBkb24ndCBzZWUgaXQg
aW4geW91ciBwYXRjaC4NCg0Kc3VyZSBJIHdpbGwgYWRkIGl0Lg0KDQpKQW1lcw0KDQo+DQo+IFJl
Z2FyZHMsDQo+IExlb25pZA0KPg0KPiDvu79PbiAyMDE5LTA2LTA3LCAxNTo0MiwgIlpodSwgSmFt
ZXMiIDxKYW1lcy5aaHVAYW1kLmNvbT4gd3JvdGU6DQo+DQo+ICAgICAgDQo+ICAgICAgT24gMjAx
OS0wNi0wNyAzOjEyIHAubS4sIFpodSwgSmFtZXMgd3JvdGU6DQo+ICAgICAgPiBPbiAyMDE5LTA2
LTA3IDI6MTYgcC5tLiwgQWxleCBEZXVjaGVyIHdyb3RlOg0KPiAgICAgID4+IE9uIEZyaSwgSnVu
IDcsIDIwMTkgYXQgMTI6MzggUE0gWmh1LCBKYW1lcyA8SmFtZXMuWmh1QGFtZC5jb20+IHdyb3Rl
Og0KPiAgICAgID4+PiBTaW5jZSBIYXJkd2FyZSBidWcsIEdEUyBleGlzdCBFQ0MgZXJyb3IgYWZ0
ZXIgY29sZCBib290IHVwLA0KPiAgICAgID4+PiBhZGRpbmcgR0RTIGNsZWFyaW5nIHdvcmthcm91
bmQgaW4gbGF0ZXIgaW5pdCBmb3IgZ2Z4OS4NCj4gICAgICA+Pj4NCj4gICAgICA+Pj4gU2lnbmVk
LW9mZi1ieTogSmFtZXMgWmh1IDxKYW1lcy5aaHVAYW1kLmNvbT4NCj4gICAgICA+Pj4gLS0tDQo+
ICAgICAgPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgfCA0OCAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgICAgID4+PiAgICAxIGZpbGUg
Y2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKQ0KPiAgICAgID4+Pg0KPiAgICAgID4+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMNCj4gICAgICA+Pj4gaW5kZXggNzY3MjJmYy4uODFm
NmJhOCAxMDA2NDQNCj4gICAgICA+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z2Z4X3Y5XzAuYw0KPiAgICAgID4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
ZnhfdjlfMC5jDQo+ICAgICAgPj4+IEBAIC0zNjM0LDYgKzM2MzQsNTAgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBzb2MxNV9yZWdfZW50cnkgc2VjX2RlZF9jb3VudGVyX3JlZ2lzdGVyc1tdID0gew0K
PiAgICAgID4+PiAgICAgICB7IFNPQzE1X1JFR19FTlRSWShHQywgMCwgbW1TUUNfRURDX0NOVDMp
LCAwLCA0LCA2fSwNCj4gICAgICA+Pj4gICAgfTsNCj4gICAgICA+Pj4NCj4gICAgICA+Pj4gKw0K
PiAgICAgID4+PiArc3RhdGljIGludCBnZnhfdjlfMF9kb19lZGNfZ2RzX3dvcmthcm91bmRzKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPiAgICAgID4+PiArew0KPiAgICAgID4+PiArICAg
ICAgIHN0cnVjdCBhbWRncHVfcmluZyAqcmluZyA9ICZhZGV2LT5nZnguY29tcHV0ZV9yaW5nWzBd
Ow0KPiAgICAgID4+PiArICAgICAgIGludCByOw0KPiAgICAgID4+PiArDQo+ICAgICAgPj4+ICsg
ICAgICAgciA9IGFtZGdwdV9yaW5nX2FsbG9jKHJpbmcsIDE3KTsNCj4gICAgICA+Pj4gKyAgICAg
ICBpZiAocikgew0KPiAgICAgID4+PiArICAgICAgICAgICAgICAgRFJNX0VSUk9SKCJhbWRncHU6
IEdEUyB3b3JrYXJvdW5kcyBmYWlsZWQgdG8gbG9jayByaW5nICVzICglZCkuXG4iLA0KPiAgICAg
ID4+PiArICAgICAgICAgICAgICAgICAgICAgICByaW5nLT5uYW1lLCByKTsNCj4gICAgICA+Pj4g
KyAgICAgICAgICAgICAgIHJldHVybiByOw0KPiAgICAgID4+PiArICAgICAgIH0NCj4gICAgICA+
Pj4gKw0KPiAgICAgID4+PiArICAgICAgIGFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFBBQ0tFVDMo
UEFDS0VUM19XUklURV9EQVRBLCAzKSk7DQo+ICAgICAgPj4+ICsgICAgICAgYW1kZ3B1X3Jpbmdf
d3JpdGUocmluZywgV1JJVEVfREFUQV9FTkdJTkVfU0VMKDApIHwNCj4gICAgICA+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgV1JJVEVfREFUQV9EU1RfU0VMKDApKTsNCj4gICAgICA+Pj4g
KyAgICAgICBhbWRncHVfcmluZ193cml0ZShyaW5nLCBTT0MxNV9SRUdfT0ZGU0VUKEdDLCAwLCBt
bUdEU19WTUlEMF9TSVpFKSk7DQo+ICAgICAgPj4+ICsgICAgICAgYW1kZ3B1X3Jpbmdfd3JpdGUo
cmluZywgMCk7DQo+ICAgICAgPj4+ICsgICAgICAgYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgMHgx
MDAwMCk7DQo+ICAgICAgPj4gaGFyZGNvZGVkIHNpemUsIHBsZWFzZSB1c2UgdGhlIHNpemUgZnJv
bSB0aGUgZHJpdmVyLg0KPiAgICAgID4+DQo+ICAgICAgPj4+ICsNCj4gICAgICA+Pj4gKyAgICAg
ICBhbWRncHVfcmluZ193cml0ZShyaW5nLCBQQUNLRVQzKFBBQ0tFVDNfRE1BX0RBVEEsIDUpKTsN
Cj4gICAgICA+Pj4gKyAgICAgICBhbWRncHVfcmluZ193cml0ZShyaW5nLCAoUEFDS0VUM19ETUFf
REFUQV9DUF9TWU5DIHwNCj4gICAgICA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBQQUNLRVQzX0RNQV9EQVRBX0RTVF9TRUwoMSkgfA0KPiAgICAgID4+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFBBQ0tFVDNfRE1BX0RBVEFfU1JDX1NFTCgyKSB8DQo+ICAgICAg
Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUEFDS0VUM19ETUFfREFUQV9FTkdJ
TkUoMCkpKTsNCj4gICAgICA+Pj4gKyAgICAgICBhbWRncHVfcmluZ193cml0ZShyaW5nLCAwKTsN
Cj4gICAgICA+Pj4gKyAgICAgICBhbWRncHVfcmluZ193cml0ZShyaW5nLCAwKTsNCj4gICAgICA+
Pj4gKyAgICAgICBhbWRncHVfcmluZ193cml0ZShyaW5nLCAwKTsNCj4gICAgICA+Pj4gKyAgICAg
ICBhbWRncHVfcmluZ193cml0ZShyaW5nLCAwKTsNCj4gICAgICA+Pj4gKyAgICAgICBhbWRncHVf
cmluZ193cml0ZShyaW5nLCBQQUNLRVQzX0RNQV9EQVRBX0NNRF9SQVdfV0FJVCB8IDB4MTAwMDAp
Ow0KPiAgICAgID4+IEluc3RlYWQgb2YgaGFyZGNvZGluZyB0aGUgc2l6ZSwgY2FuIHlvdSB1c2Ug
dGhlIGdkcyBzaXplIGZyb20gdGhlDQo+ICAgICAgPj4gZHJpdmVyIChhZGV2LT5nZHMuZ2RzX3Np
emUpLg0KPiAgICAgID4gSGkgQWxleCwNCj4gICAgICA+DQo+ICAgICAgPiBEbyB5b3UgbWVhbiBh
ZGV2LT5nZHMubWVtLnRvdGFsX3NpemU/DQo+ICAgICAgPg0KPiAgICAgID4gQnV0IEkgc2VlIGJl
bG93IG9wZXJhdGlvbiBpbiBnZnhfdjlfMF9uZ2dfaW5pdC4NCj4gICAgICA+DQo+ICAgICAgPiBh
ZGV2LT5nZHMubWVtLnRvdGFsX3NpemUgLT0gLi4uLg0KPiAgICAgID4NCj4gICAgICA+IE9yIHlv
dSB3YW50IG1lIHRvIGFkZCBnZHNfc2l6ZSBpbiBzdHJ1Y3QgYW1kZ3B1X2dkcz8NCj4gICAgICA+
DQo+ICAgICAgPiBKYW1lcw0KPiAgICAgIA0KPiAgICAgIFllYWgsIFRoZSBhbWQtc3RhZ2luZy1k
cm0tbmV4dCBicmFuY2ggaGFzIGFkZXYtPmdkcy5nZHNfc2l6ZS4NCj4gICAgICANCj4gICAgICBK
YW1lcw0KPiAgICAgIA0KPiAgICAgID4NCj4gICAgICA+PiBXaXRoIHRoYXQgZml4ZWQ6DQo+ICAg
ICAgPj4gUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNv
bT4NCj4gICAgICA+Pg0KPiAgICAgID4+PiArDQo+ICAgICAgPj4+ICsgICAgICAgYW1kZ3B1X3Jp
bmdfd3JpdGUocmluZywgUEFDS0VUMyhQQUNLRVQzX1dSSVRFX0RBVEEsIDMpKTsNCj4gICAgICA+
Pj4gKyAgICAgICBhbWRncHVfcmluZ193cml0ZShyaW5nLCBXUklURV9EQVRBX0VOR0lORV9TRUwo
MCkgfA0KPiAgICAgID4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFdSSVRFX0RB
VEFfRFNUX1NFTCgwKSk7DQo+ICAgICAgPj4+ICsgICAgICAgYW1kZ3B1X3Jpbmdfd3JpdGUocmlu
ZywgU09DMTVfUkVHX09GRlNFVChHQywgMCwgbW1HRFNfVk1JRDBfU0laRSkpOw0KPiAgICAgID4+
PiArICAgICAgIGFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIDApOw0KPiAgICAgID4+PiArICAgICAg
IGFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIDB4MCk7DQo+ICAgICAgPj4+ICsNCj4gICAgICA+Pj4g
KyAgICAgICBhbWRncHVfcmluZ19jb21taXQocmluZyk7DQo+ICAgICAgPj4+ICsNCj4gICAgICA+
Pj4gKyAgICAgICByZXR1cm4gMDsNCj4gICAgICA+Pj4gK30NCj4gICAgICA+Pj4gKw0KPiAgICAg
ID4+PiArDQo+ICAgICAgPj4+ICAgIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfZG9fZWRjX2dwcl93b3Jr
YXJvdW5kcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4gICAgICA+Pj4gICAgew0KPiAg
ICAgID4+PiAgICAgICAgICAgc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nID0gJmFkZXYtPmdmeC5j
b21wdXRlX3JpbmdbMF07DQo+ICAgICAgPj4+IEBAIC0zODEwLDYgKzM4NTQsMTAgQEAgc3RhdGlj
IGludCBnZnhfdjlfMF9lY2NfbGF0ZV9pbml0KHZvaWQgKmhhbmRsZSkNCj4gICAgICA+Pj4gICAg
ICAgICAgICAgICAgICAgcmV0dXJuIDA7DQo+ICAgICAgPj4+ICAgICAgICAgICB9DQo+ICAgICAg
Pj4+DQo+ICAgICAgPj4+ICsgICAgICAgciA9IGdmeF92OV8wX2RvX2VkY19nZHNfd29ya2Fyb3Vu
ZHMoYWRldik7DQo+ICAgICAgPj4+ICsgICAgICAgaWYgKHIpDQo+ICAgICAgPj4+ICsgICAgICAg
ICAgICAgICByZXR1cm4gcjsNCj4gICAgICA+Pj4gKw0KPiAgICAgID4+PiAgICAgICAgICAgLyog
cmVxdWlyZXMgSUJzIHNvIGRvIGluIGxhdGUgaW5pdCBhZnRlciBJQiBwb29sIGlzIGluaXRpYWxp
emVkICovDQo+ICAgICAgPj4+ICAgICAgICAgICByID0gZ2Z4X3Y5XzBfZG9fZWRjX2dwcl93b3Jr
YXJvdW5kcyhhZGV2KTsNCj4gICAgICA+Pj4gICAgICAgICAgIGlmIChyKQ0KPiAgICAgID4+PiAt
LQ0KPiAgICAgID4+PiAyLjcuNA0KPiAgICAgID4+Pg0KPiAgICAgID4+PiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiAgICAgID4+PiBhbWQtZ2Z4IG1h
aWxpbmcgbGlzdA0KPiAgICAgID4+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiAg
ICAgID4+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZngNCj4gICAgICANCj4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
