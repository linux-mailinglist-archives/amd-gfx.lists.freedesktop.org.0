Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFC74C0F9
	for <lists+amd-gfx@lfdr.de>; Wed, 19 Jun 2019 20:43:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE266E456;
	Wed, 19 Jun 2019 18:43:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790040.outbound.protection.outlook.com [40.107.79.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F5A36E456
 for <amd-gfx@lists.freedesktop.org>; Wed, 19 Jun 2019 18:43:11 +0000 (UTC)
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB3285.namprd12.prod.outlook.com (20.179.93.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Wed, 19 Jun 2019 18:43:09 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::54fa:fc7d:555f:c9ba]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::54fa:fc7d:555f:c9ba%3]) with mapi id 15.20.1987.013; Wed, 19 Jun 2019
 18:43:08 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: "Li, Roman" <Roman.Li@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/display: Fix null-deref on vega20 with xgmi
Thread-Topic: [PATCH] drm/amd/display: Fix null-deref on vega20 with xgmi
Thread-Index: AQHVJs5NagqxVA4NKUel7EPhYbb7aKajUAyA
Date: Wed, 19 Jun 2019 18:43:08 +0000
Message-ID: <d8ddd12e-1a1c-4c12-1e31-b3f7b5718ddd@amd.com>
References: <1560969526-9400-1-git-send-email-Roman.Li@amd.com>
In-Reply-To: <1560969526-9400-1-git-send-email-Roman.Li@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::34) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6413c522-92b5-4fc3-1ed2-08d6f4e5f8c9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3285; 
x-ms-traffictypediagnostic: BYAPR12MB3285:
x-microsoft-antispam-prvs: <BYAPR12MB32858DC4142E6EBF5AACFB2BECE50@BYAPR12MB3285.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0073BFEF03
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(346002)(136003)(39860400002)(376002)(396003)(199004)(189003)(31696002)(81166006)(68736007)(8676002)(8936002)(54906003)(81156014)(71200400001)(53546011)(6486002)(52116002)(110136005)(76176011)(316002)(386003)(446003)(66066001)(71190400001)(36756003)(31686004)(11346002)(476003)(26005)(7736002)(186003)(229853002)(2616005)(486006)(102836004)(66476007)(305945005)(5660300002)(4326008)(99286004)(73956011)(6506007)(66946007)(64756008)(66556008)(2906002)(66446008)(6246003)(72206003)(256004)(478600001)(6116002)(3846002)(6436002)(53936002)(14454004)(25786009)(2501003)(86362001)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3285;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: y+qjr1gcW+v0+BN28rpzN9Frz20ToQtB1vcQaU/vVQN40IWE3HKomjeUG+wgJgal9MgcOtV1w5gPd0Eoys1gkVdTj/hSecgiU0EXffENyS/vVhP7SICHJO9it7M5YmtvT4mxLfbQq31x0MQ2Aaw+yvqDG6sUM6grU5OgBX4fLXty2Cotib3TiwlU0f1zwwZL29t9kMIqDH8I7qmvNM7ecs9ZaGN9vqX8JsaKjOCUv8hlvxLvHGCK/+CcaBADjLgSCMNrWsSxIRFBdqYA8+fyd8CdqclP542OUHKwJTtTp67cn64C8Yd2jquAM5ef7BLo4MN0BERlmdp+5U9+eaLx8UWrKxpc0r2gNwYOGA+hLy5mTIY0WmOJ/uwc/XlAJKT+9mb4e/66+XVhJE0FWmmGGZMJ2D1kJh6TwpIsFNLJMDg=
Content-ID: <7E86026D30DD2349B2078D386608AA0F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6413c522-92b5-4fc3-1ed2-08d6f4e5f8c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2019 18:43:08.8146 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nkazlaus@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3285
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I31ozjzq+t4K6rX5fFFSnSuWb40rcA5ESDQfj68bJ/g=;
 b=Nlxo7ZWmBUONZtLTYo/QtZmkfJviNZUrfrH8WEcyN5DPXxs1mO8sruPpX8A/9vK6Rxe9+6qtLCbp1Nd+dqqHCKov+lWiIfaaNuL6nxEeRi6S7r6BnomlYgWlT7LC3m/SllFOqs38GS5dn3+XFKeL5B0/OToG4l8X6bquUbg9y/E=
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, "Yang, Eric" <Eric.Yang2@amd.com>, "Liu,
 Shaoyun" <Shaoyun.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gNi8xOS8xOSAyOjM4IFBNLCBSb21hbi5MaUBhbWQuY29tIHdyb3RlOg0KPiBGcm9tOiBSb21h
biBMaSA8Um9tYW4uTGlAYW1kLmNvbT4NCj4gDQo+IFtXaHldDQo+IEFmdGVyIGNsa21nciByZXdv
cmsgaXQgZ2V0cyBpbml0aWFsaXplZCBhZnRlciByZXNvdXJjZSBwb29sLg0KPiBUaGUgY2xrbWdy
IGlzIHVzZWQgaW4gcmVzb3VyY2UgcG9vbCBpbml0IGZvciB4Z21pIHBhdGguDQo+IFRoYXQgY2F1
c2VzIGRyaXZlciBjcmFzaCBvbiBWZWdhMjAgd2l0aCB4Z21pIGR1ZSB0byBOVUxMIGRlcmVmLg0K
PiANCj4gW0hvd10NCj4gTW92ZSB4Z21pIGNvbXBlbnNhdGlvbiBjb2RlIHRvIGRjZTEyMV9jbGtf
bWdyX2NvbnN0cnVjdCgpDQo+IFRoYXQgYWxzbyBhbGxvd3MgdG8gbWFrZSBkY2UxMjFfY2xvY2tf
cGF0Y2hfeGdtaV9zc19pbmZvKCkNCj4gaW50ZXJuYWwgc3RhdGljIGZ1bmN0aW9uLg0KPiANCj4g
Q2hhbmdlLUlkOiBJZDNmYTQ0YmRlYjI5NzRiMzU4MGE1MzVjYzUwNjkyYmZhOGIwMWUyNw0KPiBT
aWduZWQtb2ZmLWJ5OiBSb21hbiBMaSA8Um9tYW4uTGlAYW1kLmNvbT4NCj4gLS0tDQoNClJldmll
d2VkLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb20+
DQoNCj4gICAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2RjZTEyMC9kY2UxMjBf
Y2xrX21nci5jIHwgMTQgKysrKysrKysrKystLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNlMTIwL2RjZTEyMF9yZXNvdXJjZS5jICAgIHwgMTAgLS0tLS0tLS0tLQ0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvY2xrX21nci5oICAgICAgICAg
ICAgfCAgMiAtLQ0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTUgZGVs
ZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2Nsa19tZ3IvZGNlMTIwL2RjZTEyMF9jbGtfbWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvY2xrX21nci9kY2UxMjAvZGNlMTIwX2Nsa19tZ3IuYw0KPiBpbmRleCAwOGYy
ZTI1Li45MDYzMTBjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY2xrX21nci9kY2UxMjAvZGNlMTIwX2Nsa19tZ3IuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvY2xrX21nci9kY2UxMjAvZGNlMTIwX2Nsa19tZ3IuYw0KPiBAQCAt
MzAsNiArMzAsNyBAQA0KPiAgICNpbmNsdWRlICJkY2UxMTAvZGNlMTEwX2Nsa19tZ3IuaCINCj4g
ICAjaW5jbHVkZSAiZGNlMTIwX2Nsa19tZ3IuaCINCj4gICAjaW5jbHVkZSAiZGNlMTAwL2RjZV9j
bGtfbWdyLmgiDQo+ICsjaW5jbHVkZSAiZGNlMTIwL2RjZTEyMF9od19zZXF1ZW5jZXIuaCINCj4g
ICANCj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IHN0YXRlX2RlcGVuZGVudF9jbG9ja3MgZGNlMTIw
X21heF9jbGtzX2J5X3N0YXRlW10gPSB7DQo+ICAgLypDbG9ja3NTdGF0ZUludmFsaWQgLSBzaG91
bGQgbm90IGJlIHVzZWQqLw0KPiBAQCAtNDUsMTYgKzQ2LDE1IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3Qgc3RhdGVfZGVwZW5kZW50X2Nsb2NrcyBkY2UxMjBfbWF4X2Nsa3NfYnlfc3RhdGVbXSA9IHsN
Cj4gICANCj4gICAvKioNCj4gICAgKiBkY2UxMjFfY2xvY2tfcGF0Y2hfeGdtaV9zc19pbmZvKCkg
LSBTYXZlIFhHTUkgc3ByZWFkIHNwZWN0cnVtIGluZm8NCj4gLSAqIEBjbGtfbWdyOiBjbG9jayBt
YW5hZ2VyIGJhc2Ugc3RydWN0dXJlDQo+ICsgKiBAY2xrX21ncl9kY2U6IGNsb2NrIG1hbmFnZXIg
aW50ZXJuYWwgc3RydWN0dXJlDQo+ICAgICoNCj4gICAgKiBSZWFkcyBmcm9tIFZCSU9TIHRoZSBY
R01JIHNwcmVhZCBzcGVjdHJ1bSBpbmZvIGFuZCBzYXZlcyBpdCB3aXRoaW4NCj4gICAgKiB0aGUg
ZGNlIGNsb2NrIG1hbmFnZXIuIFRoaXMgb3BlcmF0aW9uIHdpbGwgb3ZlcndyaXRlIHRoZSBleGlz
dGluZyBkcHJlZmNsaw0KPiAgICAqIFNTIHZhbHVlcyBpZiB0aGUgdkJJT1MgcXVlcnkgc3VjY2Vl
ZHMuIE90aGVyd2lzZSwgaXQgZG9lcyBub3RoaW5nLiBJdCBhbHNvDQo+ICAgICogc2V0cyB0aGUg
LT54Z21pX2VuYWJsZWQgZmxhZy4NCj4gICAgKi8NCj4gLXZvaWQgZGNlMTIxX2Nsb2NrX3BhdGNo
X3hnbWlfc3NfaW5mbyhzdHJ1Y3QgY2xrX21nciAqY2xrX21ncl9iYXNlKQ0KPiArc3RhdGljIHZv
aWQgZGNlMTIxX2Nsb2NrX3BhdGNoX3hnbWlfc3NfaW5mbyhzdHJ1Y3QgY2xrX21ncl9pbnRlcm5h
bCAqY2xrX21ncl9kY2UpDQo+ICAgew0KPiAtCXN0cnVjdCBjbGtfbWdyX2ludGVybmFsICpjbGtf
bWdyX2RjZSA9IFRPX0NMS19NR1JfSU5URVJOQUwoY2xrX21ncl9iYXNlKTsNCj4gICAJZW51bSBi
cF9yZXN1bHQgcmVzdWx0Ow0KPiAgIAlzdHJ1Y3Qgc3ByZWFkX3NwZWN0cnVtX2luZm8gaW5mbyA9
IHsgeyAwIH0gfTsNCj4gICAJc3RydWN0IGRjX2Jpb3MgKmJwID0gY2xrX21ncl9kY2UtPmJhc2Uu
Y3R4LT5kY19iaW9zOw0KPiBAQCAtMTQxLDUgKzE0MSwxMyBAQCB2b2lkIGRjZTEyMV9jbGtfbWdy
X2NvbnN0cnVjdChzdHJ1Y3QgZGNfY29udGV4dCAqY3R4LCBzdHJ1Y3QgY2xrX21ncl9pbnRlcm5h
bCAqYw0KPiAgIHsNCj4gICAJZGNlMTIwX2Nsa19tZ3JfY29uc3RydWN0KGN0eCwgY2xrX21ncik7
DQo+ICAgCWNsa19tZ3ItPmJhc2UuZHByZWZjbGtfa2h6ID0gNjI1MDAwOw0KPiArDQo+ICsJLyoN
Cj4gKwkgKiBUaGUgeEdNSSBlbmFibGVkIGluZm8gaXMgdXNlZCB0byBkZXRlcm1pbmUgaWYgYXVk
aW8gYW5kIGRpc3BsYXkNCj4gKwkgKiBjbG9ja3MgbmVlZCB0byBiZSBhZGp1c3RlZCB3aXRoIHRo
ZSBXQUZMIGxpbmsncyBTUyBpbmZvLg0KPiArCSAqLw0KPiArCWlmIChkY2UxMjFfeGdtaV9lbmFi
bGVkKGN0eC0+ZGMtPmh3c2VxKSkNCj4gKwkJZGNlMTIxX2Nsb2NrX3BhdGNoX3hnbWlfc3NfaW5m
byhjbGtfbWdyKTsNCj4gKw0KPiAgIH0NCj4gICANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMjAvZGNlMTIwX3Jlc291cmNlLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTIwL2RjZTEyMF9yZXNvdXJjZS5jDQo+IGluZGV4IGFm
YTFjNjAuLjcxOWMwMjAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY2UxMjAvZGNlMTIwX3Jlc291cmNlLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjZTEyMC9kY2UxMjBfcmVzb3VyY2UuYw0KPiBAQCAtMTE2MywxNiArMTE2
Myw2IEBAIHN0YXRpYyBib29sIGNvbnN0cnVjdCgNCj4gICAJaWYgKCFyZXNvdXJjZV9jb25zdHJ1
Y3QobnVtX3ZpcnR1YWxfbGlua3MsIGRjLCAmcG9vbC0+YmFzZSwgcmVzX2Z1bmNzKSkNCj4gICAJ
CWdvdG8gcmVzX2NyZWF0ZV9mYWlsOw0KPiAgIA0KPiAtCS8qDQo+IC0JICogVGhpcyBpcyBhIGJp
dCBvZiBhIGhhY2suIFRoZSB4R01JIGVuYWJsZWQgaW5mbyBpcyB1c2VkIHRvIGRldGVybWluZQ0K
PiAtCSAqIGlmIGF1ZGlvIGFuZCBkaXNwbGF5IGNsb2NrcyBuZWVkIHRvIGJlIGFkanVzdGVkIHdp
dGggdGhlIFdBRkwgbGluaydzDQo+IC0JICogU1MgaW5mby4gVGhpcyBpcyBhIHJlc3BvbnNpYmxp
dHkgb2YgdGhlIGNsa19tZ3IuIEJ1dCBzaW5jZSBNTUhVQiBpcw0KPiAtCSAqIHVuZGVyIGh3c2Vx
LCBhbmQgdGhlIHJlbGV2YW50IHJlZ2lzdGVyIGlzIGluIE1NSFVCLCB3ZSBoYXZlIHRvIGRvIGl0
DQo+IC0JICogaGVyZS4NCj4gLQkgKi8NCj4gLQlpZiAoaXNfdmcyMCAmJiBkY2UxMjFfeGdtaV9l
bmFibGVkKGRjLT5od3NlcSkpDQo+IC0JCWRjZTEyMV9jbG9ja19wYXRjaF94Z21pX3NzX2luZm8o
ZGMtPmNsa19tZ3IpOw0KPiAtDQo+ICAgCS8qIENyZWF0ZSBoYXJkd2FyZSBzZXF1ZW5jZXIgKi8N
Cj4gICAJaWYgKCFkY2UxMjBfaHdfc2VxdWVuY2VyX2NyZWF0ZShkYykpDQo+ICAgCQlnb3RvIGNv
bnRyb2xsZXJfY3JlYXRlX2ZhaWw7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvaW5jL2h3L2Nsa19tZ3IuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9pbmMvaHcvY2xrX21nci5oDQo+IGluZGV4IDcyMWUxMzEuLjM2ZWJkNWIgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvY2xrX21nci5oDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvY2xrX21nci5oDQo+
IEBAIC01Myw4ICs1Myw2IEBAIHN0cnVjdCBjbGtfbWdyX2Z1bmNzIHsNCj4gICAJdm9pZCAoKmVu
YWJsZV9wbWVfd2EpIChzdHJ1Y3QgY2xrX21nciAqY2xrX21ncik7DQo+ICAgfTsNCj4gICANCj4g
LXZvaWQgZGNlMTIxX2Nsb2NrX3BhdGNoX3hnbWlfc3NfaW5mbyhzdHJ1Y3QgY2xrX21nciAqY2xr
X21ncl9iYXNlKTsNCj4gLQ0KPiAgIHN0cnVjdCBjbGtfbWdyIHsNCj4gICAJc3RydWN0IGRjX2Nv
bnRleHQgKmN0eDsNCj4gICAJc3RydWN0IGNsa19tZ3JfZnVuY3MgKmZ1bmNzOw0KPiANCg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
