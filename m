Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66276A629F
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 09:36:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03633894E3;
	Tue,  3 Sep 2019 07:36:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740080.outbound.protection.outlook.com [40.107.74.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF07894E3
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Sep 2019 07:36:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LL4zXZXTXmIxF+gCHdyF4PPdIImoc+sIm+eBu9PW3P4kjbGXfSmm7cEQE1rBpw9b6TK8IfMuFcVAV9HwYkq8/2kT+uu4Qnb3V5/3g7kmeHQ4J/idrb43OKf9j6+9xtbdEMaMoN85SDHWLVBvCA5zrrvBlHu7bqJuORQYBUTLRWXoKtxp2ziiyrR0MoSqgYw9ntj7DvUq4u+mqbcGgJb1z3VQIGc4eRJP8xLyHP4DAI9SQGKyU8qX3o8yRE8Zp198InuxbidR7BsKs3cSSkKT5qF1UqbhNvK5PjJwdVh0Flm8eboeWtBeMUJFIwKLQNbhdFqf9DgPpVXxM0vPF/zlDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lw8GA+P3//AA7njj2oJdXAR9uBCb5Vmoosk0Gy87QgI=;
 b=XrhWn5YG4jVVE/gp11XXjMnAUiCFTCTOJ9NGRaV8EIb2RtYP4+8wxBAlwWffDfd2Jeesgqkf00fj/zr6kvxkWHdUlgUl39hBQjFCPHNPzZpmmVdkqM814mRoN5BC9LQUj07VyP7/xW6d7kIe1yZMzFi5DnhckwyBXvmzJ3GWtMyOogQXvX/oL4+MSAtjP4VtSYrId4JrRt9fB6AzHJ7Ad1fcyRiZZKs2ZygfRFv6w7MpkeNg1/FwhDBe7JE+bkuzKms3DXqcU/ur9jx1Ber+cQf8XvNg0YB+qWspg/n/ApisaUAH6qV8EHQvGQTDqeIPzMHLdx8U7Ybw8Vb2s8m9/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB2943.namprd12.prod.outlook.com (20.179.81.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.22; Tue, 3 Sep 2019 07:36:45 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2220.020; Tue, 3 Sep 2019
 07:36:45 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Chen, Guchun" <Guchun.Chen@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH 01/10] drm/amdgpu: set ip specific ras interface pointer
 to NULL after free it
Thread-Topic: [PATCH 01/10] drm/amdgpu: set ip specific ras interface pointer
 to NULL after free it
Thread-Index: AQHVYerEDDbCWdC5u06uAX0gtHgPmKcZg2fw
Date: Tue, 3 Sep 2019 07:36:45 +0000
Message-ID: <MN2PR12MB305466264C773391D249E000B0B90@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <1567468894-11852-1-git-send-email-Hawking.Zhang@amd.com>
In-Reply-To: <1567468894-11852-1-git-send-email-Hawking.Zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 94cafc10-2322-4c95-34a4-08d7304178c6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2943; 
x-ms-traffictypediagnostic: MN2PR12MB2943:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2943DAE053AB885C01226F7DB0B90@MN2PR12MB2943.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(136003)(346002)(376002)(396003)(13464003)(189003)(199004)(66446008)(66476007)(64756008)(66556008)(229853002)(86362001)(76116006)(66946007)(25786009)(478600001)(53936002)(14444005)(52536014)(5660300002)(81156014)(8676002)(6636002)(81166006)(316002)(2501003)(14454004)(99286004)(76176011)(6436002)(6506007)(26005)(7736002)(9686003)(305945005)(55016002)(66066001)(486006)(11346002)(8936002)(7696005)(6246003)(110136005)(102836004)(256004)(446003)(2906002)(3846002)(53546011)(71200400001)(71190400001)(6116002)(186003)(476003)(33656002)(74316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2943;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Yq0qrL8I4bA92TpkcBS2s7smIimNJxkKUryxAkWMSKOWbL79mJRLa77sasmasOvdAxzcGskOLHcPdl8kM6y+yaKhMiJG/PCxrPfmFq0VOevuNyripoa+YgHN2MoOQNV8H1tkWGYyBk3LmByYMCx+YDPSHMZMAT4QAbOfR+FEEnyuXVXTFqc7vkJ2QKi4m/bA1pg31MqdEdrqOFiyQh83iflmZbcuVQqaGAqmzHmdfeD+T5SyEKqHi3G0c5gTIU+JOiEBDgAdGLluZiNNpyzsON6F0T/mu7qK/nT1yYcwEOmxLNyS3POllSZmdqubUx+B0R898mCnX33uX5YkUqdHqMiThcvPsML0SS7H+CtxXrDsffTJBydOXY3fKVJQi6v9e0b56HRlBSJXwx79V6GYUVuO1aG4HRghenKs1YyHBhY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94cafc10-2322-4c95-34a4-08d7304178c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 07:36:45.1078 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DGG0+/N6XIGnR9c7LGVstPINANDqr0B1By0gMi7wGa2CtreZwHHrNJDeVlU+wqzU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2943
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lw8GA+P3//AA7njj2oJdXAR9uBCb5Vmoosk0Gy87QgI=;
 b=WQRVOfAHvh0+icf/16r/Zs16sHEUkIHCHMibcKYYTQ37lGcNasm0pnOh8rJCQsHsGMaSimoz19pU631A4TV84S841BaGh5ck4OFhCX+gTSWbtKr/tUbj6QP4PBb2xnhMGt6ULdBGSbtbKaKCGA4UYeqp2BEjtMwSarrL/ksgDHc=
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

SSB0aGluayBlY2NfaXJxIGFuZCBwcm9jZXNzX3Jhc19kYXRhX2NiIGZ1bmN0aW9ucyBjb3VsZCBi
ZSBhbHNvIG1vdmVkIHRvIGdlbmVyaWMgbW9kdWxlIGZpbGVzLCBidXQgd2UgY2FuIGRvIGl0IGlu
IG5ldyBwYXRjaGVzLg0KDQpBbm90aGVyIGlzc3VlIGlzIGFtZGdwdSBpbml0IHdpbGwgZmFpbCBp
ZiB2YmlvcyBlbmFibGVzIHJhcyBidXQgcHNwIHJhcyB0YSBpcyBub3QgcmVhZHkgb24gQXJjdHVy
dXMuIElmIHZiaW9zIGFuZCBwc3AgdGEgZm9yIHJhcyB3aWxsIGJlIHJlbGVhc2VkIGF0IHRoZSBz
YW1lIHRpbWUsIHRoZSBzZXJpZXMgaXM6DQoNClJldmlld2VkLWJ5OiBUYW8gWmhvdSA8dGFvLnpo
b3UxQGFtZC5jb20+DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWmhh
bmcsIEhhd2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NCj4gU2VudDogMjAxOeW5tDnmnIgz
5pelIDg6MDINCj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBaaG91MSwgVGFv
IDxUYW8uWmhvdTFAYW1kLmNvbT47DQo+IENoZW4sIEd1Y2h1biA8R3VjaHVuLkNoZW5AYW1kLmNv
bT47IERldWNoZXIsIEFsZXhhbmRlcg0KPiA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT4NCj4g
Q2M6IFpoYW5nLCBIYXdraW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+DQo+IFN1YmplY3Q6IFtQ
QVRDSCAwMS8xMF0gZHJtL2FtZGdwdTogc2V0IGlwIHNwZWNpZmljIHJhcyBpbnRlcmZhY2UgcG9p
bnRlciB0bw0KPiBOVUxMIGFmdGVyIGZyZWUgaXQNCj4gDQo+IHRvIHByZXZlbnQgYWNjZXNzIHRv
IGRhbmdsaW5nIHBvaW50ZXJzDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBIYXdraW5nIFpoYW5nIDxI
YXdraW5nLlpoYW5nQGFtZC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4X3Y5XzAuYyAgIHwgNyArKysrKy0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nbWNfdjlfMC5jICAgfCA4ICsrKysrKy0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9tbWh1Yl92MV8wLmMgfCA0ICsrKy0NCj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmJp
b192N180LmMgIHwgNCArKysrDQo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRf
MC5jICB8IDggKysrKysrLS0NCj4gIDUgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwg
NyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nZnhfdjlfMC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAu
Yw0KPiBpbmRleCBjYjhkOGI2Li5jOTAyODg1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dmeF92OV8wLmMNCj4gQEAgLTQ0MzEsMTQgKzQ0MzEsMTcgQEAgc3RhdGljIGludCBnZnhf
djlfMF9lY2NfbGF0ZV9pbml0KHZvaWQgKmhhbmRsZSkNCj4gIAkJciA9IGFtZGdwdV9pcnFfZ2V0
KGFkZXYsICZhZGV2LT5nZnguY3BfZWNjX2Vycm9yX2lycSwgMCk7DQo+ICAJCWlmIChyKQ0KPiAg
CQkJZ290byBsYXRlX2Zpbmk7DQo+IC0JfSBlbHNlDQo+IC0JCWtmcmVlKGFkZXYtPmdmeC5yYXNf
aWYpOw0KPiArCX0gZWxzZSB7DQo+ICsJCXIgPSAwOw0KPiArCQlnb3RvIGZyZWU7DQo+ICsJfQ0K
PiANCj4gIAlyZXR1cm4gMDsNCj4gIGxhdGVfZmluaToNCj4gIAlhbWRncHVfcmFzX2xhdGVfZmlu
aShhZGV2LCBhZGV2LT5nZngucmFzX2lmLCAmaWhfaW5mbyk7DQo+ICBmcmVlOg0KPiAgCWtmcmVl
KGFkZXYtPmdmeC5yYXNfaWYpOw0KPiArCWFkZXYtPmdmeC5yYXNfaWYgPSBOVUxMOw0KPiAgCXJl
dHVybiByOw0KPiAgfQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dtY192OV8wLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5j
DQo+IGluZGV4IGFmMDY5YTQuLjc0NDgzYTcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2dtY192OV8wLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ21jX3Y5XzAuYw0KPiBAQCAtNzkzLDggKzc5MywxMSBAQCBzdGF0aWMgaW50IGdtY192OV8w
X2VjY19sYXRlX2luaXQodm9pZCAqaGFuZGxlKQ0KPiAgCQlyID0gYW1kZ3B1X2lycV9nZXQoYWRl
diwgJmFkZXYtPmdtYy5lY2NfaXJxLCAwKTsNCj4gIAkJaWYgKHIpDQo+ICAJCQlnb3RvIHVtY19s
YXRlX2Zpbmk7DQo+IC0JfSBlbHNlDQo+IC0JCWtmcmVlKGFkZXYtPmdtYy51bWNfcmFzX2lmKTsN
Cj4gKwl9IGVsc2Ugew0KPiArCQkvKiBmcmVlIHVtYyByYXNfaWYgaWYgdW1jIHJhcyBpcyBub3Qg
c3VwcG9ydGVkICovDQo+ICsJCXIgPSAwOw0KPiArCQlnb3RvIGZyZWU7DQo+ICsJfQ0KPiANCj4g
IAlpZiAoYWRldi0+bW1odWJfZnVuY3MgJiYgYWRldi0+bW1odWJfZnVuY3MtPnJhc19sYXRlX2lu
aXQpIHsNCj4gIAkJciA9IGFkZXYtPm1taHViX2Z1bmNzLT5yYXNfbGF0ZV9pbml0KGFkZXYpOw0K
PiBAQCAtODA2LDYgKzgwOSw3IEBAIHN0YXRpYyBpbnQgZ21jX3Y5XzBfZWNjX2xhdGVfaW5pdCh2
b2lkICpoYW5kbGUpDQo+ICAJYW1kZ3B1X3Jhc19sYXRlX2ZpbmkoYWRldiwgYWRldi0+Z21jLnVt
Y19yYXNfaWYsICZ1bWNfaWhfaW5mbyk7DQo+ICBmcmVlOg0KPiAgCWtmcmVlKGFkZXYtPmdtYy51
bWNfcmFzX2lmKTsNCj4gKwlhZGV2LT5nbWMudW1jX3Jhc19pZiA9IE5VTEw7DQo+ICAJcmV0dXJu
IHI7DQo+ICB9DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
bW1odWJfdjFfMC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjFfMC5j
DQo+IGluZGV4IGFiNjU1OWEuLjk5MTZhMzMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L21taHViX3YxXzAuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9tbWh1Yl92MV8wLmMNCj4gQEAgLTYzOSw4ICs2MzksMTAgQEAgc3RhdGljIGludCBtbWh1
Yl92MV8wX3Jhc19sYXRlX2luaXQoc3RydWN0DQo+IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+ICAJ
bW1odWJfaWhfaW5mby5oZWFkID0gbW1odWJfZnNfaW5mby5oZWFkID0gKmFkZXYtDQo+ID5nbWMu
bW1odWJfcmFzX2lmOw0KPiAgCXIgPSBhbWRncHVfcmFzX2xhdGVfaW5pdChhZGV2LCBhZGV2LT5n
bWMubW1odWJfcmFzX2lmLA0KPiAgCQkJCSAmbW1odWJfZnNfaW5mbywgJm1taHViX2loX2luZm8p
Ow0KPiAtCWlmIChyIHx8ICFhbWRncHVfcmFzX2lzX3N1cHBvcnRlZChhZGV2LCBhZGV2LT5nbWMu
bW1odWJfcmFzX2lmLQ0KPiA+YmxvY2spKQ0KPiArCWlmIChyIHx8ICFhbWRncHVfcmFzX2lzX3N1
cHBvcnRlZChhZGV2LA0KPiArYWRldi0+Z21jLm1taHViX3Jhc19pZi0+YmxvY2spKSB7DQo+ICAJ
CWtmcmVlKGFkZXYtPmdtYy5tbWh1Yl9yYXNfaWYpOw0KPiArCQlhZGV2LT5nbWMubW1odWJfcmFz
X2lmID0gTlVMTDsNCj4gKwl9DQo+ICAJcmV0dXJuIHI7DQo+ICB9DQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmJpb192N180LmMNCj4gYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9uYmlvX3Y3XzQuYw0KPiBpbmRleCA1ZTc4NGJiLi43NmMwMDI5IDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYmlvX3Y3XzQuYw0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYmlvX3Y3XzQuYw0KPiBAQCAtNTAyLDYg
KzUwMiw5IEBAIHN0YXRpYyBpbnQgbmJpb192N180X3Jhc19sYXRlX2luaXQoc3RydWN0DQo+IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpDQo+ICAJCXIgPSBhbWRncHVfaXJxX2dldChhZGV2LCAmYWRldi0N
Cj4gPm5iaW8ucmFzX2Vycl9ldmVudF9hdGh1Yl9pcnEsIDApOw0KPiAgCQlpZiAocikNCj4gIAkJ
CWdvdG8gbGF0ZV9maW5pOw0KPiArCX0gZWxzZSB7DQo+ICsJCXIgPSAwOw0KPiArCQlnb3RvIGZy
ZWU7DQo+ICAJfQ0KPiANCj4gIAlyZXR1cm4gMDsNCj4gQEAgLTUwOSw2ICs1MTIsNyBAQCBzdGF0
aWMgaW50IG5iaW9fdjdfNF9yYXNfbGF0ZV9pbml0KHN0cnVjdA0KPiBhbWRncHVfZGV2aWNlICph
ZGV2KQ0KPiAgCWFtZGdwdV9yYXNfbGF0ZV9maW5pKGFkZXYsIGFkZXYtPm5iaW8ucmFzX2lmLCAm
aWhfaW5mbyk7DQo+ICBmcmVlOg0KPiAgCWtmcmVlKGFkZXYtPm5iaW8ucmFzX2lmKTsNCj4gKwlh
ZGV2LT5uYmlvLnJhc19pZiA9IE5VTEw7DQo+ICAJcmV0dXJuIHI7DQo+ICB9DQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMNCj4gYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYw0KPiBpbmRleCBkZjJmYjFmLi5lOTcx
ZTg2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAu
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYw0KPiBAQCAt
MTcyNSwxNCArMTcyNSwxOCBAQCBzdGF0aWMgaW50IHNkbWFfdjRfMF9sYXRlX2luaXQodm9pZCAq
aGFuZGxlKQ0KPiAgCQkJaWYgKHIpDQo+ICAJCQkJZ290byBsYXRlX2Zpbmk7DQo+ICAJCX0NCj4g
LQl9IGVsc2UNCj4gLQkJa2ZyZWUoYWRldi0+c2RtYS5yYXNfaWYpOw0KPiArCX0gZWxzZSB7DQo+
ICsJCS8qIGZyZWUgc2RtYSByYXNfaWYgaWYgc2RtYSByYXMgaXMgbm90IHN1cHBvcnRlZCAqLw0K
PiArCQlyID0gMDsNCj4gKwkJZ290byBmcmVlOw0KPiArCX0NCj4gDQo+ICAgICAgICAgIHJldHVy
biAwOw0KPiAgbGF0ZV9maW5pOg0KPiAgCWFtZGdwdV9yYXNfbGF0ZV9maW5pKGFkZXYsIGFkZXYt
PnNkbWEucmFzX2lmLCAmaWhfaW5mbyk7DQo+ICBmcmVlOg0KPiAgCWtmcmVlKGFkZXYtPnNkbWEu
cmFzX2lmKTsNCj4gKwlhZGV2LT5zZG1hLnJhc19pZiA9IE5VTEw7DQo+ICAJcmV0dXJuIHI7DQo+
ICB9DQo+IA0KPiAtLQ0KPiAyLjcuNA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
