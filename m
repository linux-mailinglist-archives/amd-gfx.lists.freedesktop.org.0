Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C72959DBA
	for <lists+amd-gfx@lfdr.de>; Fri, 28 Jun 2019 16:30:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAEC56E932;
	Fri, 28 Jun 2019 14:30:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690073.outbound.protection.outlook.com [40.107.69.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331296E932
 for <amd-gfx@lists.freedesktop.org>; Fri, 28 Jun 2019 14:30:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=Sub4PrxviNst496VrjFnbnM4ejwv8DKkIk9BtmBOu6W1JPxPnFjOa7pDXzLDNIyMD2BGk78DiAZkrMh9AAxi7izGktR4zPvNkdC7KlArPZQ8HAZxIQ8k1wFBZXXK1woZptdVm4ZkCmveKnvwfQgOBzf/ayl78nZ0xQK1axF5bVU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZT0vEo4ktrzwjjHZNJuxmMMPDEXDFfaVTzXgcr9qwY=;
 b=wXTaux6Jswp4LZZKYRacwHyiUnWxUX0yMZ6YQ4scqbe+OSLU1QoLRQGDR/eGHHzG52hdVh/S2QFoX4l+iLaUMBi4M2HqCwuM4OUXyDKF3sweyRYgVtQ95bNysVB2q1cuv3qHuJF5mmmPTa22+PzPMRsEN2vu28MIw3DCG0PAELg=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from MN2PR12MB2910.namprd12.prod.outlook.com (20.179.81.219) by
 MN2PR12MB3710.namprd12.prod.outlook.com (10.255.236.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Fri, 28 Jun 2019 14:30:05 +0000
Received: from MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::2025:cd1a:7ac0:edd9]) by MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::2025:cd1a:7ac0:edd9%7]) with mapi id 15.20.2008.018; Fri, 28 Jun 2019
 14:30:05 +0000
From: Chunming Zhou <zhoucm1@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/5] drm/amdgpu: allow direct submission in the VM backends
Thread-Topic: [PATCH 1/5] drm/amdgpu: allow direct submission in the VM
 backends
Thread-Index: AQHVLauT2bnqB1HMzkyGyY6kHyAlYaaxIIsA
Date: Fri, 28 Jun 2019 14:30:05 +0000
Message-ID: <58a7ff4f-47f2-42a6-f9af-ca28726535bf@amd.com>
References: <20190628121812.1400-1-christian.koenig@amd.com>
In-Reply-To: <20190628121812.1400-1-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR01CA0036.apcprd01.prod.exchangelabs.com
 (2603:1096:203:3e::24) To MN2PR12MB2910.namprd12.prod.outlook.com
 (2603:10b6:208:af::27)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [180.167.199.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c731a3e0-5a4e-4dce-4a94-08d6fbd51cdb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3710; 
x-ms-traffictypediagnostic: MN2PR12MB3710:
x-microsoft-antispam-prvs: <MN2PR12MB3710024E99046271A69C2CFAB4FC0@MN2PR12MB3710.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-forefront-prvs: 00826B6158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(346002)(366004)(376002)(189003)(199004)(43544003)(31696002)(446003)(2501003)(6436002)(11346002)(81156014)(2616005)(305945005)(99286004)(6486002)(14444005)(81166006)(76176011)(71200400001)(486006)(6512007)(2906002)(53936002)(3846002)(186003)(6506007)(386003)(8676002)(6116002)(476003)(316002)(110136005)(68736007)(31686004)(52116002)(7736002)(36756003)(66066001)(66446008)(5660300002)(66574012)(73956011)(14454004)(66476007)(66556008)(229853002)(64756008)(6246003)(478600001)(8936002)(4326008)(102836004)(71190400001)(72206003)(256004)(26005)(25786009)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3710;
 H:MN2PR12MB2910.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1KP9v05P7lkIvUtUHhCTopuhhT3Tps/uXrGMKd5V/3Cl8Jo6NlsTyDAd77563Xdm/ix0M6fqsTM4DrfwIccUSLNYe9rQx3Rvl4UpjJP3dLBgEait/NyfKqh/MRraNhQWT4Kigya1UhLes7JU2M7OYm5TSexOAHGUuJQZolSjfy34EPUi5QOjNaO8HQRpdQPriLUuU+padvqExzRT9VjTpN9wXD8q3cLRJUnlAGYuLS1bA5Q0aq+6NHN6bp58wPxQrh6jo0c4jFBzrBswclUdt6VfF4v96lCysRv7JfdR9yO3GXKJXCo8qL/k06Dr2hy/F4UCJFm0MCmIeON2h4nZdSxZoG+m4Xgv0BfUZL8s8vkffddkAiAtAnggvlj8kXyC5UHGmYPEaR7nuPopx+ofP9N1VAfQOwR/H8HYx+kbvV0=
Content-ID: <65B0FB1A498A60489873A4CDAECDC4CA@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c731a3e0-5a4e-4dce-4a94-08d6fbd51cdb
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2019 14:30:05.4630 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zhoucm1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3710
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZT0vEo4ktrzwjjHZNJuxmMMPDEXDFfaVTzXgcr9qwY=;
 b=IGQ8wp7MkFyJaUt+s4LiE+/RDlgvRRdj+JgIyCVe0r7hHRob9pphEwNSvRgQaujPKAgu7A05RzA1sGd273Rb7ad3uCRaw5aGJpm08XXYcQcyTXCuhrgjcK3GU/e958HOQE+rVn2JVQvFaEhNjxeh8kiJFQ7wC5F3HoLAcjGAVQo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=David1.Zhou@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQrlnKggMjAxOS82LzI4IDIwOjE4LCBDaHJpc3RpYW4gS8O2bmlnIOWGmemBkzoNCj4gVGhpcyBh
bGxvd3MgdXMgdG8gdXBkYXRlIHBhZ2UgdGFibGVzIGRpcmVjdGx5IHdoaWxlIGluIGEgcGFnZSBm
YXVsdC4NCj4NCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdm0uaCAgICAgIHwgIDUgKysrKw0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV92bV9jcHUuYyAgfCAgNCArKysNCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdm1fc2RtYS5jIHwgMjkgKysrKysrKysrKysrKy0tLS0tLS0tDQo+ICAgMyBmaWxlcyBj
aGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmgNCj4gaW5kZXggNDg5YTE2MmNhNjIwLi41OTQxYWNj
ZWEwNjEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92
bS5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oDQo+IEBA
IC0xOTcsNiArMTk3LDExIEBAIHN0cnVjdCBhbWRncHVfdm1fdXBkYXRlX3BhcmFtcyB7DQo+ICAg
CSAqLw0KPiAgIAlzdHJ1Y3QgYW1kZ3B1X3ZtICp2bTsNCj4gICANCj4gKwkvKioNCj4gKwkgKiBA
ZGlyZWN0OiBpZiBjaGFuZ2VzIHNob3VsZCBiZSBtYWRlIGRpcmVjdGx5DQo+ICsJICovDQo+ICsJ
Ym9vbCBkaXJlY3Q7DQo+ICsNCj4gICAJLyoqDQo+ICAgCSAqIEBwYWdlc19hZGRyOg0KPiAgIAkg
Kg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtX2Nw
dS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtX2NwdS5jDQo+IGluZGV4
IDUyMjJkMTY1YWJmYy4uZjk0ZTQ4OTYwNzljIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdm1fY3B1LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3ZtX2NwdS5jDQo+IEBAIC00OSw2ICs0OSwxMCBAQCBzdGF0aWMgaW50
IGFtZGdwdV92bV9jcHVfcHJlcGFyZShzdHJ1Y3QgYW1kZ3B1X3ZtX3VwZGF0ZV9wYXJhbXMgKnAs
IHZvaWQgKm93bmVyLA0KPiAgIHsNCj4gICAJaW50IHI7DQo+ICAgDQo+ICsJLyogRG9uJ3Qgd2Fp
dCBmb3IgYW55dGhpbmcgZHVyaW5nIHBhZ2UgZmF1bHQgKi8NCj4gKwlpZiAocC0+ZGlyZWN0KQ0K
PiArCQlyZXR1cm4gMDsNCj4gKw0KPiAgIAkvKiBXYWl0IGZvciBQVCBCT3MgdG8gYmUgaWRsZS4g
UFRzIHNoYXJlIHRoZSBzYW1lIHJlc3YuIG9iamVjdA0KPiAgIAkgKiBhcyB0aGUgcm9vdCBQRCBC
Tw0KPiAgIAkgKi8NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV92bV9zZG1hLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm1fc2Rt
YS5jDQo+IGluZGV4IGRkZDE4MWY1ZWQzNy4uODkxZDU5NzA2M2NiIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm1fc2RtYS5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bV9zZG1hLmMNCj4gQEAgLTY4LDE3ICs2OCwx
NyBAQCBzdGF0aWMgaW50IGFtZGdwdV92bV9zZG1hX3ByZXBhcmUoc3RydWN0IGFtZGdwdV92bV91
cGRhdGVfcGFyYW1zICpwLA0KPiAgIAlpZiAocikNCj4gICAJCXJldHVybiByOw0KPiAgIA0KPiAt
CXIgPSBhbWRncHVfc3luY19mZW5jZShwLT5hZGV2LCAmcC0+am9iLT5zeW5jLCBleGNsdXNpdmUs
IGZhbHNlKTsNCj4gLQlpZiAocikNCj4gLQkJcmV0dXJuIHI7DQo+ICsJcC0+bnVtX2R3X2xlZnQg
PSBuZHc7DQo+ICsNCj4gKwlpZiAocC0+ZGlyZWN0KQ0KPiArCQlyZXR1cm4gMDsNCj4gICANCj4g
LQlyID0gYW1kZ3B1X3N5bmNfcmVzdihwLT5hZGV2LCAmcC0+am9iLT5zeW5jLCByb290LT50Ym8u
cmVzdiwNCj4gLQkJCSAgICAgb3duZXIsIGZhbHNlKTsNCj4gKwlyID0gYW1kZ3B1X3N5bmNfZmVu
Y2UocC0+YWRldiwgJnAtPmpvYi0+c3luYywgZXhjbHVzaXZlLCBmYWxzZSk7DQo+ICAgCWlmIChy
KQ0KPiAgIAkJcmV0dXJuIHI7DQo+ICAgDQo+IC0JcC0+bnVtX2R3X2xlZnQgPSBuZHc7DQo+IC0J
cmV0dXJuIDA7DQo+ICsJcmV0dXJuIGFtZGdwdV9zeW5jX3Jlc3YocC0+YWRldiwgJnAtPmpvYi0+
c3luYywgcm9vdC0+dGJvLnJlc3YsDQo+ICsJCQkJb3duZXIsIGZhbHNlKTsNCj4gICB9DQo+ICAg
DQo+ICAgLyoqDQo+IEBAIC05OSwxMyArOTksMjEgQEAgc3RhdGljIGludCBhbWRncHVfdm1fc2Rt
YV9jb21taXQoc3RydWN0IGFtZGdwdV92bV91cGRhdGVfcGFyYW1zICpwLA0KPiAgIAlzdHJ1Y3Qg
ZG1hX2ZlbmNlICpmOw0KPiAgIAlpbnQgcjsNCj4gICANCj4gLQlyaW5nID0gY29udGFpbmVyX29m
KHAtPnZtLT5lbnRpdHkucnEtPnNjaGVkLCBzdHJ1Y3QgYW1kZ3B1X3JpbmcsIHNjaGVkKTsNCj4g
KwlpZiAocC0+ZGlyZWN0KQ0KPiArCQlyaW5nID0gcC0+YWRldi0+dm1fbWFuYWdlci5wYWdlX2Zh
dWx0Ow0KPiArCWVsc2UNCj4gKwkJcmluZyA9IGNvbnRhaW5lcl9vZihwLT52bS0+ZW50aXR5LnJx
LT5zY2hlZCwNCj4gKwkJCQkgICAgc3RydWN0IGFtZGdwdV9yaW5nLCBzY2hlZCk7DQo+ICAgDQo+
ICAgCVdBUk5fT04oaWItPmxlbmd0aF9kdyA9PSAwKTsNCj4gICAJYW1kZ3B1X3JpbmdfcGFkX2li
KHJpbmcsIGliKTsNCj4gICAJV0FSTl9PTihpYi0+bGVuZ3RoX2R3ID4gcC0+bnVtX2R3X2xlZnQp
Ow0KPiAtCXIgPSBhbWRncHVfam9iX3N1Ym1pdChwLT5qb2IsICZwLT52bS0+ZW50aXR5LA0KPiAt
CQkJICAgICAgQU1ER1BVX0ZFTkNFX09XTkVSX1ZNLCAmZik7DQo+ICsNCj4gKwlpZiAocC0+ZGly
ZWN0KQ0KPiArCQlyID0gYW1kZ3B1X2pvYl9zdWJtaXRfZGlyZWN0KHAtPmpvYiwgcmluZywgJmYp
Ow0KDQpXaGVuIHdlIHVzZSBkaXJlY3Qgc3VibWlzc2lvbiBhZnRlciBpbnRpYWxpemF0aW9uLCB3
ZSBuZWVkIHRvIHRha2UgY2FyZSANCm9mIHJpbmcgcmFjZSBjb25kaXNpb24sIGRvbid0IHdlPyBB
bSBJIG1pc3NpbmcgYW55dGhpbmc/DQoNCg0KLURhdmlkDQoNCj4gKwllbHNlDQo+ICsJCXIgPSBh
bWRncHVfam9iX3N1Ym1pdChwLT5qb2IsICZwLT52bS0+ZW50aXR5LA0KPiArCQkJCSAgICAgIEFN
REdQVV9GRU5DRV9PV05FUl9WTSwgJmYpOw0KPiAgIAlpZiAocikNCj4gICAJCWdvdG8gZXJyb3I7
DQo+ICAgDQo+IEBAIC0xMjAsNyArMTI4LDYgQEAgc3RhdGljIGludCBhbWRncHVfdm1fc2RtYV9j
b21taXQoc3RydWN0IGFtZGdwdV92bV91cGRhdGVfcGFyYW1zICpwLA0KPiAgIAlyZXR1cm4gcjsN
Cj4gICB9DQo+ICAgDQo+IC0NCj4gICAvKioNCj4gICAgKiBhbWRncHVfdm1fc2RtYV9jb3B5X3B0
ZXMgLSBjb3B5IHRoZSBQVEVzIGZyb20gbWFwcGluZw0KPiAgICAqDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
