Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B75854BC07
	for <lists+amd-gfx@lfdr.de>; Wed, 19 Jun 2019 16:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E6B26E41F;
	Wed, 19 Jun 2019 14:49:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780057.outbound.protection.outlook.com [40.107.78.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B86E6E41D
 for <amd-gfx@lists.freedesktop.org>; Wed, 19 Jun 2019 14:49:44 +0000 (UTC)
Received: from BN6PR12MB1618.namprd12.prod.outlook.com (10.172.21.149) by
 BN6PR12MB1172.namprd12.prod.outlook.com (10.168.228.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Wed, 19 Jun 2019 14:49:43 +0000
Received: from BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::deb:c3c0:13cb:e332]) by BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::deb:c3c0:13cb:e332%7]) with mapi id 15.20.1987.014; Wed, 19 Jun 2019
 14:49:43 +0000
From: "Russell, Kent" <Kent.Russell@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdkfd: Add procfs-style information for KFD processes
Thread-Topic: [PATCH] drm/amdkfd: Add procfs-style information for KFD
 processes
Thread-Index: AQHVJqeHpfF/cPY4kkm6oFJfXQsaSKajAl2AgAAGTwCAAAJogIAAAOaQgAABxQCAAADYkA==
Date: Wed, 19 Jun 2019 14:49:43 +0000
Message-ID: <BN6PR12MB16184794893FF8ADED2165E585E50@BN6PR12MB1618.namprd12.prod.outlook.com>
References: <20190619140133.2060-1-kent.russell@amd.com>
 <8c26a707-4069-3bf5-d0aa-962a20245ec0@gmail.com>
 <BN6PR12MB161813FEBB800CA880A0EAC085E50@BN6PR12MB1618.namprd12.prod.outlook.com>
 <60c80a3c-efb7-9e86-7832-3d8c4509ed34@amd.com>
 <BN6PR12MB16184B05BBE7A83C6558D3A785E50@BN6PR12MB1618.namprd12.prod.outlook.com>
 <dada3f09-7dbe-1231-d732-b39917a3de43@amd.com>
In-Reply-To: <dada3f09-7dbe-1231-d732-b39917a3de43@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2607:fea8:1ca0:3f2:d9a9:e34f:d0bd:b54c]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7c658eaa-84bd-494f-20e2-08d6f4c55d6f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1172; 
x-ms-traffictypediagnostic: BN6PR12MB1172:
x-microsoft-antispam-prvs: <BN6PR12MB1172F54CAD69F36BC950D4B885E50@BN6PR12MB1172.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0073BFEF03
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(366004)(136003)(346002)(376002)(189003)(199004)(13464003)(71190400001)(5660300002)(2501003)(229853002)(186003)(52536014)(110136005)(486006)(102836004)(53546011)(46003)(316002)(25786009)(76176011)(6506007)(6116002)(11346002)(8936002)(6246003)(2906002)(476003)(446003)(7696005)(33656002)(14444005)(76116006)(73956011)(66476007)(256004)(74316002)(66556008)(14454004)(7736002)(478600001)(71200400001)(66574012)(99286004)(66946007)(6436002)(9686003)(53936002)(81156014)(68736007)(81166006)(64756008)(55016002)(86362001)(8676002)(72206003)(305945005)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1172;
 H:BN6PR12MB1618.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vd0ZxCBJDW4q/f5OMU4+g4n0m0X3jTgXDWbeMx0EA0hf+pbIn1T4iMiSvtwwUKCzPs5Stx2S7hXV8Qtcrr2Sl7+ZpS+gHTIkkvwKfGiAbdpDo9hs/IZ+mxB/ssllPK8mC2plrFcY8y96A629uGnA/7GL63oMsg1UlX+T6ygGvVlidIV6vLRfTlMpYOOK5jZfICSwhpSD4omAtAnpS+McfyiBC9ah73A7JArMLJ7Gd9NK0KdTM6BOLWP5oGf+yVaOffyoHgMkMoLP7A34OG45hmvIyg/Y68wXxFO9GWrb7nXz7G1S4uUW8D7Gv3ZNfmUyunfZVr1FDq/SKUFjfIWf3agdlXXzMtSxA6TWIKjQeH3haibDYYvmbybUj3dgCrlKvevJ9JPdwRI3AJtl0i25P3dnaagq7He8j0NxFLPMTDk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c658eaa-84bd-494f-20e2-08d6f4c55d6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2019 14:49:43.1111 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: krussell@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1172
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIRmaswlUzJHOx/eeiAxw4/YXv2TVNt5TqDgUvalALM=;
 b=NALSEKBDRWpd2NS3PMrtwhrhtfGOpG4Cw+TOuq0EoGWxA9cVrZTdK94RxHXiYICP+2RqcE5qj5jPQgiO/H5hINDuxlGDPD2526sc/0lGds3vymYqwUk/wlOBc50seZwmsebZGoS5suVXC33AupChdm9REtTOWUTKUCqyV8awrvk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kent.Russell@amd.com; 
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

VGhhbmtzISBJJ2xsIHdhaXQgdG8gbGV0IEZlbGl4L290aGVycyB3ZWlnaCBpbiBiZWZvcmUgcHVz
aGluZyBpdCBpbi4NCg0KIEtlbnQNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206
IEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+IA0KU2VudDogV2Vk
bmVzZGF5LCBKdW5lIDE5LCAyMDE5IDEwOjQ1IEFNDQpUbzogUnVzc2VsbCwgS2VudCA8S2VudC5S
dXNzZWxsQGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KU3ViamVjdDog
UmU6IFtQQVRDSF0gZHJtL2FtZGtmZDogQWRkIHByb2Nmcy1zdHlsZSBpbmZvcm1hdGlvbiBmb3Ig
S0ZEIHByb2Nlc3Nlcw0KDQpPaywgdGhhdCdzIHdoYXQgSSB3YW50ZWQgdG8ga25vdy4gRmVlbCBm
cmVlIHRvIGFkZCBteSBBY2tlZC1ieSB0byB0aGUgcGF0Y2guDQoNClRoYW5rcywNCkNocmlzdGlh
bi4NCg0KQW0gMTkuMDYuMTkgdW0gMTY6NDIgc2NocmllYiBSdXNzZWxsLCBLZW50Og0KPiBJJ2Qg
cmF0aGVyIGl0IGJlIGluIGRlYnVnZnMgdG9vLCBidXQgdGhlIHJlcXVpcmVtZW50cyBhcmUgdGhh
dCBpdCBiZSBleHBvc2VkIHRocm91Z2ggdGhlIFNNSS4gQW5kIHdoZW5ldmVyIHdlIGRvIGFueXRo
aW5nIHRoYXQgcmVxdWlyZXMgcm9vdCBmb3IgcmVhZGluZyBpbiB0aGUgU01JLCBwZW9wbGUgY29t
cGxhaW4gKHRoZXkgZXhwZWN0IHJvb3QgZm9yIHdyaXRpbmcsIGJ1dCBJIGhhZCBkb3plbnMgb2Yg
Y29tcGxhaW50cy9idWcgcmVwb3J0cyB3aGVuIHJlcG9ydGluZyB2b2x0YWdlIHZpYSBkZWJ1Z2Zz
IHJlcXVpcmVkIHJvb3QpLiBUaGF0J3Mgd2h5IHdlIGRpZCB0aGluZ3MgbGlrZSBtb3ZpbmcgdGhl
IHZvbHRhZ2UsIG1lbW9yeSB1c2FnZSwgZXRjIHRvIHN5c2ZzLg0KPg0KPiBTbyB1bmZvcnR1bmF0
ZWx5IGl0IGNhbid0IGdvIGluIGRlYnVnZnMsIGV2ZW4gdGhvdWdoIHRoYXQncyB3aGVyZSBJIHdv
dWxkIGhhdmUgcHJlZmVycmVkIGl0LiBJIGtub3cgdGhhdCBpdCBraW5kIG9mIGxvY2tzIHVzIGlu
IGludGVyZmFjZS13aXNlIHRob3VnaC4NCj4NCj4gICBLZW50DQo+DQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmln
QGFtZC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgSnVuZSAxOSwgMjAxOSAxMDozNSBBTQ0KPiBU
bzogUnVzc2VsbCwgS2VudCA8S2VudC5SdXNzZWxsQGFtZC5jb20+OyANCj4gYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2FtZGtmZDogQWRk
IHByb2Nmcy1zdHlsZSBpbmZvcm1hdGlvbiBmb3IgS0ZEIA0KPiBwcm9jZXNzZXMNCj4NCj4gRG8g
d2UgbmVlZCBhIHN0YWJsZSBpbnRlcmZhY2U/IFdvdWxkIGRlYnVnZnMgZG8gYXMgd2VsbD8NCj4N
Cj4gSSBtZWFuIGluIGdlbmVyYWwgbG9va3MgZ29vZCBmb3Igc3lzZnMgYXMgd2VsbCwganVzdCB3
YW50IHRvIGRvdWJsZSBjaGVjay4NCj4NCj4gQ2hyaXN0aWFuLg0KPg0KPiBBbSAxOS4wNi4xOSB1
bSAxNjoyOCBzY2hyaWViIFJ1c3NlbGwsIEtlbnQ6DQo+PiBSaWdodCBub3cgdGhlIHVzZSBjYXNl
IHdvdWxkIGJlIHRvIGxpc3Qgd2hpY2ggcHJvY2Vzc2VzIHdlcmUgY3JlYXRlZCBpbiBhIEtGRCBj
b250ZXh0LCBidXQgaXQgd291bGQgYWxsb3cgZm9yIGZ1cnRoZXIgZXhwYW5zaW9uIHRvIGluY2x1
ZGUgdGhpbmdzIGxpa2UgdGhlIEdQVSBhc3NvY2lhdGVkIHdpdGggdGhlIFBJRCwgbWVtb3J5IHVz
YWdlLCBldGMuIEZvciBub3csIHRoZSB1c2UgY2FzZSBpcyBsaXN0aW5nIEtGRC1yZWxhdGVkIFBJ
RHMsIGJ1dCB3aWxsIGJlIGV4cGFuZGVkIGxhdGVyIHRvIGluY2x1ZGUgbWVtb3J5IHVzYWdlIGZv
ciBzdXJlIChwbHVzIG90aGVyIHRoaW5ncyB0aGF0IEkgZXhwZWN0IHdpbGwgcmVxdWVzdGVkIGxh
dGVyIG9uKS4NCj4+ICAgIA0KPj4gICAgS2VudA0KPj4NCj4+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+PiBGcm9tOiBDaHJpc3RpYW4gS8O2bmlnIDxja29lbmlnLmxlaWNodHp1bWVya2Vu
QGdtYWlsLmNvbT4NCj4+IFNlbnQ6IFdlZG5lc2RheSwgSnVuZSAxOSwgMjAxOSAxMDowNCBBTQ0K
Pj4gVG86IFJ1c3NlbGwsIEtlbnQgPEtlbnQuUnVzc2VsbEBhbWQuY29tPjsgDQo+PiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2FtZGtm
ZDogQWRkIHByb2Nmcy1zdHlsZSBpbmZvcm1hdGlvbiBmb3IgS0ZEIA0KPj4gcHJvY2Vzc2VzDQo+
Pg0KPj4gQW0gMTkuMDYuMTkgdW0gMTY6MDEgc2NocmllYiBSdXNzZWxsLCBLZW50Og0KPj4+IEFk
ZCBhIGZvbGRlciBzdHJ1Y3R1cmUgdG8gL3N5cy9jbGFzcy9rZmQva2ZkLyBjYWxsZWQgcHJvYyB3
aGljaCANCj4+PiBjb250YWlucyBzdWJmb2xkZXJzLCBlYWNoIHJlcHJlc2VudGluZyBhbiBhY3Rp
dmUgS0ZEIHByb2Nlc3MnIFBJRCwgDQo+Pj4gY29udGFpbmluZyAxDQo+Pj4gZmlsZTogcGFzaWQu
DQo+PiBXaGF0IGlzIHRoZSB1c2UgY2FzZSBvZiB0aGF0IGluZm9ybWF0aW9uPyBJbiBvdGhlciB3
b3JkcyB3b3VsZCBpdCBiZSBtYXliZSBiZXR0ZXIgdG8gY3JlYXRlIGRlYnVnZnMgZW50cmllcyBp
bnN0ZWFkPw0KPj4NCj4+IENocmlzdGlhbi4NCj4+DQo+Pj4gQ2hhbmdlLUlkOiBJZDNkZmFiOGE2
MjUwMjY0NDM0YjM0Y2NkZGJjZGI0NTlkMWRhNzQ3OA0KPj4+IFNpZ25lZC1vZmYtYnk6IEtlbnQg
UnVzc2VsbCA8a2VudC5ydXNzZWxsQGFtZC5jb20+DQo+Pj4gLS0tDQo+Pj4gICAgIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9tb2R1bGUuYyAgfCAgIDYgKysNCj4+PiAgICAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaCAgICB8ICAgOSArKw0KPj4+ICAgICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzcy5jIHwgMTAwICsrKysrKysrKysrKysr
KysrKysrKystDQo+Pj4gICAgIDMgZmlsZXMgY2hhbmdlZCwgMTEzIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX21vZHVsZS5jDQo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRf
bW9kdWxlLmMNCj4+PiBpbmRleCA5MzIwMDdlYjkxNjguLjk4NmZmNTJkNTc1MCAxMDA2NDQNCj4+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfbW9kdWxlLmMNCj4+PiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfbW9kdWxlLmMNCj4+PiBAQCAtNTYsNiAr
NTYsMTEgQEAgc3RhdGljIGludCBrZmRfaW5pdCh2b2lkKQ0KPj4+ICAgICAJaWYgKGVyciA8IDAp
DQo+Pj4gICAgIAkJZ290byBlcnJfY3JlYXRlX3dxOw0KPj4+ICAgICANCj4+PiArCS8qIElnbm9y
ZSB0aGUgcmV0dXJuIHZhbHVlLCBzbyB0aGF0IHdlIGNhbiBjb250aW51ZQ0KPj4+ICsJICogdG8g
aW5pdCB0aGUgS0ZELCBldmVuIGlmIHByb2NmcyBpc24ndCBjcmFhdGVkDQo+Pj4gKwkgKi8NCj4+
PiArCWtmZF9wcm9jZnNfaW5pdCgpOw0KPj4+ICsNCj4+PiAgICAgCWtmZF9kZWJ1Z2ZzX2luaXQo
KTsNCj4+PiAgICAgDQo+Pj4gICAgIAlyZXR1cm4gMDsNCj4+PiBAQCAtNzIsNiArNzcsNyBAQCBz
dGF0aWMgdm9pZCBrZmRfZXhpdCh2b2lkKQ0KPj4+ICAgICB7DQo+Pj4gICAgIAlrZmRfZGVidWdm
c19maW5pKCk7DQo+Pj4gICAgIAlrZmRfcHJvY2Vzc19kZXN0cm95X3dxKCk7DQo+Pj4gKwlrZmRf
cHJvY2ZzX3NodXRkb3duKCk7DQo+Pj4gICAgIAlrZmRfdG9wb2xvZ3lfc2h1dGRvd24oKTsNCj4+
PiAgICAgCWtmZF9jaGFyZGV2X2V4aXQoKTsNCj4+PiAgICAgfQ0KPj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oDQo+Pj4gYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oDQo+Pj4gaW5kZXggZGE1ODllZTEzNjZjLi5iZDAxMzk2
YzhjZWEgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3By
aXYuaA0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmgNCj4+
PiBAQCAtMzUsNiArMzUsNyBAQA0KPj4+ICAgICAjaW5jbHVkZSA8bGludXgva2ZpZm8uaD4NCj4+
PiAgICAgI2luY2x1ZGUgPGxpbnV4L3NlcV9maWxlLmg+DQo+Pj4gICAgICNpbmNsdWRlIDxsaW51
eC9rcmVmLmg+DQo+Pj4gKyNpbmNsdWRlIDxsaW51eC9zeXNmcy5oPg0KPj4+ICAgICAjaW5jbHVk
ZSA8a2dkX2tmZF9pbnRlcmZhY2UuaD4NCj4+PiAgICAgDQo+Pj4gICAgICNpbmNsdWRlICJhbWRf
c2hhcmVkLmgiDQo+Pj4gQEAgLTcxOCw2ICs3MTksMTAgQEAgc3RydWN0IGtmZF9wcm9jZXNzIHsN
Cj4+PiAgICAgCSAqIHJlc3RvcmVkIGFmdGVyIGFuIGV2aWN0aW9uDQo+Pj4gICAgIAkgKi8NCj4+
PiAgICAgCXVuc2lnbmVkIGxvbmcgbGFzdF9yZXN0b3JlX3RpbWVzdGFtcDsNCj4+PiArDQo+Pj4g
KwkvKiBLb2JqIGZvciBvdXIgcHJvY2ZzICovDQo+Pj4gKwlzdHJ1Y3Qga29iamVjdCAqa29iajsN
Cj4+PiArCXN0cnVjdCBhdHRyaWJ1dGUgYXR0cl9wYXNpZDsNCj4+PiAgICAgfTsNCj4+PiAgICAg
DQo+Pj4gICAgICNkZWZpbmUgS0ZEX1BST0NFU1NfVEFCTEVfU0laRSA1IC8qIGJpdHM6IDMyIGVu
dHJpZXMgKi8gQEAgDQo+Pj4gLTgyMCw2DQo+Pj4gKzgyNSwxMCBAQCBpbnQga2ZkX2d0dF9zYV9m
cmVlKHN0cnVjdCBrZmRfZGV2ICprZmQsIHN0cnVjdCANCj4+PiAra2ZkX21lbV9vYmoNCj4+PiAq
bWVtX29iaik7DQo+Pj4gICAgIA0KPj4+ICAgICBleHRlcm4gc3RydWN0IGRldmljZSAqa2ZkX2Rl
dmljZTsNCj4+PiAgICAgDQo+Pj4gKy8qIEtGRCdzIHByb2NmcyAqLw0KPj4+ICt2b2lkIGtmZF9w
cm9jZnNfaW5pdCh2b2lkKTsNCj4+PiArdm9pZCBrZmRfcHJvY2ZzX3NodXRkb3duKHZvaWQpOw0K
Pj4+ICsNCj4+PiAgICAgLyogVG9wb2xvZ3kgKi8NCj4+PiAgICAgaW50IGtmZF90b3BvbG9neV9p
bml0KHZvaWQpOw0KPj4+ICAgICB2b2lkIGtmZF90b3BvbG9neV9zaHV0ZG93bih2b2lkKTsgZGlm
ZiAtLWdpdCANCj4+PiBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzLmMN
Cj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzLmMNCj4+PiBpbmRl
eCA0YmRhZTc4YmFiOGUuLmVkMmQ4M2Y5M2ZkOCAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzcy5jDQo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3MuYw0KPj4+IEBAIC02OCw2ICs2OCw2OCBAQCBzdGF0aWMg
c3RydWN0IGtmZF9wcm9jZXNzICpjcmVhdGVfcHJvY2Vzcyhjb25zdCBzdHJ1Y3QgdGFza19zdHJ1
Y3QgKnRocmVhZCwNCj4+PiAgICAgc3RhdGljIHZvaWQgZXZpY3RfcHJvY2Vzc193b3JrZXIoc3Ry
dWN0IHdvcmtfc3RydWN0ICp3b3JrKTsNCj4+PiAgICAgc3RhdGljIHZvaWQgcmVzdG9yZV9wcm9j
ZXNzX3dvcmtlcihzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspOw0KPj4+ICAgICANCj4+PiArc3Ry
dWN0IGtmZF9wcm9jZnNfdHJlZSB7DQo+Pj4gKwlzdHJ1Y3Qga29iamVjdCAqa29iajsNCj4+PiAr
fTsNCj4+PiArDQo+Pj4gK3N0YXRpYyBzdHJ1Y3Qga2ZkX3Byb2Nmc190cmVlIHByb2NmczsNCj4+
PiArDQo+Pj4gK3N0YXRpYyBzc2l6ZV90IGtmZF9wcm9jZnNfc2hvdyhzdHJ1Y3Qga29iamVjdCAq
a29iaiwgc3RydWN0IGF0dHJpYnV0ZSAqYXR0ciwNCj4+PiArCQkJICAgICAgIGNoYXIgKmJ1ZmZl
cikNCj4+PiArew0KPj4+ICsJaW50IHZhbCA9IDA7DQo+Pj4gKw0KPj4+ICsJaWYgKHN0cmNtcChh
dHRyLT5uYW1lLCAicGFzaWQiKSA9PSAwKSB7DQo+Pj4gKwkJc3RydWN0IGtmZF9wcm9jZXNzICpw
ID0gY29udGFpbmVyX29mKGF0dHIsIHN0cnVjdCBrZmRfcHJvY2VzcywNCj4+PiArCQkJCQkJICAg
ICBhdHRyX3Bhc2lkKTsNCj4+PiArCQl2YWwgPSBwLT5wYXNpZDsNCj4+PiArCX0gZWxzZSB7DQo+
Pj4gKwkJcHJfZXJyKCJJbnZhbGlkIGF0dHJpYnV0ZSIpOw0KPj4+ICsJCXJldHVybiAtRUlOVkFM
Ow0KPj4+ICsJfQ0KPj4+ICsNCj4+PiArCXJldHVybiBzbnByaW50ZihidWZmZXIsIFBBR0VfU0la
RSwgIiVkXG4iLCB2YWwpOyB9DQo+Pj4gKw0KPj4+ICtzdGF0aWMgdm9pZCBrZmRfcHJvY2ZzX2tv
YmpfcmVsZWFzZShzdHJ1Y3Qga29iamVjdCAqa29iaikgew0KPj4+ICsJa2ZyZWUoa29iaik7DQo+
Pj4gK30NCj4+PiArDQo+Pj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgc3lzZnNfb3BzIGtmZF9wcm9j
ZnNfb3BzID0gew0KPj4+ICsJLnNob3cgPSBrZmRfcHJvY2ZzX3Nob3csDQo+Pj4gK307DQo+Pj4g
Kw0KPj4+ICtzdGF0aWMgc3RydWN0IGtvYmpfdHlwZSBwcm9jZnNfdHlwZSA9IHsNCj4+PiArCS5y
ZWxlYXNlID0ga2ZkX3Byb2Nmc19rb2JqX3JlbGVhc2UsDQo+Pj4gKwkuc3lzZnNfb3BzID0gJmtm
ZF9wcm9jZnNfb3BzLA0KPj4+ICt9Ow0KPj4+ICsNCj4+PiArdm9pZCBrZmRfcHJvY2ZzX2luaXQo
dm9pZCkNCj4+PiArew0KPj4+ICsJaW50IHJldCA9IDA7DQo+Pj4gKw0KPj4+ICsJcHJvY2ZzLmtv
YmogPSBrZmRfYWxsb2Nfc3RydWN0KHByb2Nmcy5rb2JqKTsNCj4+PiArCWlmICghcHJvY2ZzLmtv
YmopDQo+Pj4gKwkJcmV0dXJuOw0KPj4+ICsNCj4+PiArCXJldCA9IGtvYmplY3RfaW5pdF9hbmRf
YWRkKHByb2Nmcy5rb2JqLCAmcHJvY2ZzX3R5cGUsDQo+Pj4gKwkJCQkgICAma2ZkX2RldmljZS0+
a29iaiwgInByb2MiKTsNCj4+PiArCWlmIChyZXQpIHsNCj4+PiArCQlwcl93YXJuKCJDb3VsZCBu
b3QgY3JlYXRlIHByb2NmcyBwcm9jIGZvbGRlciIpOw0KPj4+ICsJCS8qIElmIHdlIGZhaWwgdG8g
Y3JlYXRlIHRoZSBwcm9jZnMsIGNsZWFuIHVwICovDQo+Pj4gKwkJa2ZkX3Byb2Nmc19zaHV0ZG93
bigpOw0KPj4+ICsJfQ0KPj4+ICt9DQo+Pj4gKw0KPj4+ICt2b2lkIGtmZF9wcm9jZnNfc2h1dGRv
d24odm9pZCkNCj4+PiArew0KPj4+ICsJaWYgKHByb2Nmcy5rb2JqKSB7DQo+Pj4gKwkJa29iamVj
dF9kZWwocHJvY2ZzLmtvYmopOw0KPj4+ICsJCWtvYmplY3RfcHV0KHByb2Nmcy5rb2JqKTsNCj4+
PiArCQlwcm9jZnMua29iaiA9IE5VTEw7DQo+Pj4gKwl9DQo+Pj4gK30NCj4+PiAgICAgDQo+Pj4g
ICAgIGludCBrZmRfcHJvY2Vzc19jcmVhdGVfd3Eodm9pZCkNCj4+PiAgICAgew0KPj4+IEBAIC0y
MDYsNiArMjY4LDcgQEAgc3RydWN0IGtmZF9wcm9jZXNzICprZmRfY3JlYXRlX3Byb2Nlc3Moc3Ry
dWN0IGZpbGUgKmZpbGVwKQ0KPj4+ICAgICB7DQo+Pj4gICAgIAlzdHJ1Y3Qga2ZkX3Byb2Nlc3Mg
KnByb2Nlc3M7DQo+Pj4gICAgIAlzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRocmVhZCA9IGN1cnJlbnQ7
DQo+Pj4gKwlpbnQgcmV0Ow0KPj4+ICAgICANCj4+PiAgICAgCWlmICghdGhyZWFkLT5tbSkNCj4+
PiAgICAgCQlyZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsNCj4+PiBAQCAtMjIzLDExICsyODYsMzYg
QEAgc3RydWN0IGtmZF9wcm9jZXNzICprZmRfY3JlYXRlX3Byb2Nlc3Moc3RydWN0IA0KPj4+IGZp
bGUgKmZpbGVwKQ0KPj4+ICAgICANCj4+PiAgICAgCS8qIEEgcHJpb3Igb3BlbiBvZiAvZGV2L2tm
ZCBjb3VsZCBoYXZlIGFscmVhZHkgY3JlYXRlZCB0aGUgcHJvY2Vzcy4gKi8NCj4+PiAgICAgCXBy
b2Nlc3MgPSBmaW5kX3Byb2Nlc3ModGhyZWFkKTsNCj4+PiAtCWlmIChwcm9jZXNzKQ0KPj4+ICsJ
aWYgKHByb2Nlc3MpIHsNCj4+PiAgICAgCQlwcl9kZWJ1ZygiUHJvY2VzcyBhbHJlYWR5IGZvdW5k
XG4iKTsNCj4+PiAtCWVsc2UNCj4+PiArCX0gZWxzZSB7DQo+Pj4gICAgIAkJcHJvY2VzcyA9IGNy
ZWF0ZV9wcm9jZXNzKHRocmVhZCwgZmlsZXApOw0KPj4+ICAgICANCj4+PiArCQlpZiAoIXByb2Nm
cy5rb2JqKQ0KPj4+ICsJCQlnb3RvIG91dDsNCj4+PiArDQo+Pj4gKwkJcHJvY2Vzcy0+a29iaiA9
IGtmZF9hbGxvY19zdHJ1Y3QocHJvY2Vzcy0+a29iaik7DQo+Pj4gKwkJaWYgKCFwcm9jZXNzLT5r
b2JqKSB7DQo+Pj4gKwkJCXByX3dhcm4oIkNyZWF0aW5nIHByb2NmcyBrb2JqZWN0IGZhaWxlZCIp
Ow0KPj4+ICsJCQlnb3RvIG91dDsNCj4+PiArCQl9DQo+Pj4gKwkJcmV0ID0ga29iamVjdF9pbml0
X2FuZF9hZGQocHJvY2Vzcy0+a29iaiwgJnByb2Nmc190eXBlLA0KPj4+ICsJCQkJCSAgIHByb2Nm
cy5rb2JqLCAiJWQiLA0KPj4+ICsJCQkJCSAgIChpbnQpcHJvY2Vzcy0+bGVhZF90aHJlYWQtPnBp
ZCk7DQo+Pj4gKwkJaWYgKHJldCkgew0KPj4+ICsJCQlwcl93YXJuKCJDcmVhdGluZyBwcm9jZnMg
cGlkIGRpcmVjdG9yeSBmYWlsZWQiKTsNCj4+PiArCQkJZ290byBvdXQ7DQo+Pj4gKwkJfQ0KPj4+
ICsNCj4+PiArCQlwcm9jZXNzLT5hdHRyX3Bhc2lkLm5hbWUgPSAicGFzaWQiOw0KPj4+ICsJCXBy
b2Nlc3MtPmF0dHJfcGFzaWQubW9kZSA9IEtGRF9TWVNGU19GSUxFX01PREU7DQo+Pj4gKwkJc3lz
ZnNfYXR0cl9pbml0KCZwcm9jZXNzLT5hdHRyX3Bhc2lkKTsNCj4+PiArCQlyZXQgPSBzeXNmc19j
cmVhdGVfZmlsZShwcm9jZXNzLT5rb2JqLCAmcHJvY2Vzcy0+YXR0cl9wYXNpZCk7DQo+Pj4gKwkJ
aWYgKHJldCkNCj4+PiArCQkJcHJfd2FybigiQ3JlYXRpbmcgcGFzaWQgZm9yIHBpZCAlZCBmYWls
ZWQiLA0KPj4+ICsJCQkJCShpbnQpcHJvY2Vzcy0+bGVhZF90aHJlYWQtPnBpZCk7DQo+Pj4gKwl9
DQo+Pj4gK291dDoNCj4+PiAgICAgCW11dGV4X3VubG9jaygma2ZkX3Byb2Nlc3Nlc19tdXRleCk7
DQo+Pj4gICAgIA0KPj4+ICAgICAJcmV0dXJuIHByb2Nlc3M7DQo+Pj4gQEAgLTM1NSw2ICs0NDMs
MTQgQEAgc3RhdGljIHZvaWQga2ZkX3Byb2Nlc3Nfd3FfcmVsZWFzZShzdHJ1Y3Qgd29ya19zdHJ1
Y3QgKndvcmspDQo+Pj4gICAgIAlzdHJ1Y3Qga2ZkX3Byb2Nlc3MgKnAgPSBjb250YWluZXJfb2Yo
d29yaywgc3RydWN0IGtmZF9wcm9jZXNzLA0KPj4+ICAgICAJCQkJCSAgICAgcmVsZWFzZV93b3Jr
KTsNCj4+PiAgICAgDQo+Pj4gKwkvKiBSZW1vdmUgdGhlIHByb2NmcyBmaWxlcyAqLw0KPj4+ICsJ
aWYgKHAtPmtvYmopIHsNCj4+PiArCQlzeXNmc19yZW1vdmVfZmlsZShwLT5rb2JqLCAmcC0+YXR0
cl9wYXNpZCk7DQo+Pj4gKwkJa29iamVjdF9kZWwocC0+a29iaik7DQo+Pj4gKwkJa29iamVjdF9w
dXQocC0+a29iaik7DQo+Pj4gKwkJcC0+a29iaiA9IE5VTEw7DQo+Pj4gKwl9DQo+Pj4gKw0KPj4+
ICAgICAJa2ZkX2lvbW11X3VuYmluZF9wcm9jZXNzKHApOw0KPj4+ICAgICANCj4+PiAgICAgCWtm
ZF9wcm9jZXNzX2ZyZWVfb3V0c3RhbmRpbmdfa2ZkX2JvcyhwKTsNCg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
