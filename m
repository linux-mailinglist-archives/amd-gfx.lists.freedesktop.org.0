Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D57B35F7E
	for <lists+amd-gfx@lfdr.de>; Wed,  5 Jun 2019 16:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C881889C07;
	Wed,  5 Jun 2019 14:44:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740073.outbound.protection.outlook.com [40.107.74.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 012BE89C07
 for <amd-gfx@lists.freedesktop.org>; Wed,  5 Jun 2019 14:44:19 +0000 (UTC)
Received: from MN2PR12MB3933.namprd12.prod.outlook.com (10.255.238.94) by
 MN2PR12MB3326.namprd12.prod.outlook.com (20.178.242.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Wed, 5 Jun 2019 14:44:18 +0000
Received: from MN2PR12MB3933.namprd12.prod.outlook.com
 ([fe80::1c86:c8e7:b7e:ae61]) by MN2PR12MB3933.namprd12.prod.outlook.com
 ([fe80::1c86:c8e7:b7e:ae61%6]) with mapi id 15.20.1965.011; Wed, 5 Jun 2019
 14:44:18 +0000
From: "Liu, Monk" <Monk.Liu@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: FW: [PATCH] drm/ttm: fix ttm client driver (e.g. amdgpu) reload
 issue
Thread-Topic: FW: [PATCH] drm/ttm: fix ttm client driver (e.g. amdgpu) reload
 issue
Thread-Index: AQHVG2oudZY69HM9mkCE8kosxqR2paaMqc8AgAA95QCAADukUA==
Date: Wed, 5 Jun 2019 14:44:17 +0000
Message-ID: <MN2PR12MB39334AC8143DDBC1AA7587E884160@MN2PR12MB3933.namprd12.prod.outlook.com>
References: <1559717076-25471-1-git-send-email-Monk.Liu@amd.com>
 <MN2PR12MB393308FE408E9E41EF0D615184160@MN2PR12MB3933.namprd12.prod.outlook.com>
 <8dbf96e5-056f-b2bb-b0d3-9376b92b0140@amd.com>
In-Reply-To: <8dbf96e5-056f-b2bb-b0d3-9376b92b0140@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [101.86.207.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 15d602aa-132c-479a-1cad-08d6e9c449e4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3326; 
x-ms-traffictypediagnostic: MN2PR12MB3326:
x-microsoft-antispam-prvs: <MN2PR12MB3326269174BE2307D21F5FD484160@MN2PR12MB3326.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(346002)(136003)(396003)(39860400002)(376002)(199004)(189003)(13464003)(73956011)(316002)(53936002)(14444005)(7696005)(256004)(486006)(2501003)(6436002)(11346002)(71190400001)(446003)(8936002)(68736007)(64756008)(102836004)(6246003)(53546011)(110136005)(66066001)(33656002)(186003)(6506007)(74316002)(26005)(8676002)(66946007)(81166006)(14454004)(66476007)(76176011)(476003)(66446008)(3846002)(66556008)(71200400001)(76116006)(72206003)(99286004)(52536014)(25786009)(305945005)(7736002)(81156014)(86362001)(5660300002)(55016002)(9686003)(478600001)(2906002)(229853002)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3326;
 H:MN2PR12MB3933.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fYj4l2KOWIjWFk2hxtUr0KFf73Yt48kS1TMZjqmv7GrvBrgc6dSmUhIsZ8eLvFnCyOzwS8sqCNNZ2K02G1ORi8iP/TLCxFW7/+k4EP1g47GtMdHFENPJsrYyEytEctDmRCcN9U+ada8AgmnX+7fYUS59cWJumuGOONKOvJm1UDMCEb6acgAG2FIWFDUIYGjfdCfkdgFOcW2LnzdzOLd2sxTdKTYM0YFWOtSwpOavjdrTTWDUj1hKVP+zZlMHklEMkW+7SmnEdzAFB4nzndM9JP40t2B7McxB51bEQ+QHXF8CuLTmZRh1RTMAKaq0C/HkypBYVJFDoO/gQkkdXmLho//Qk2RcunuA3SfjFOA9jVSKwNryzkkIFqKYbRv58YiUS3M+IuMoriwVBhGKlVN/YgkiqgFjp5a1KMtqjHwTmNc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15d602aa-132c-479a-1cad-08d6e9c449e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 14:44:18.1442 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jyliu@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3326
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhJEbW95JniQwpqpHoMa5Y21Utqk6FoIegJysbfXpQs=;
 b=WkcpaPqvLBdLC+BQ/rFJ/DyYgTdbYg5hHFyBTcpaqWAAQsqJlXp6W5HJUZ+EEU6DHP2bxGvB+mZLe2w/vtb+ld3tlCKNnngZPMKs35LwSc0IXCagjejByKVAYZ9rKqnv3C4In4a0Rhc7gKNRbWlC3U1T7QrWfwjiNxk7E3HABOQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Monk.Liu@amd.com; 
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

U3RyYW5nZSwgSSBnZXQgdGhlIGxhdGVzdCAiZHJtLW5leHQiIGJyYW5jaCBhbmQgZGlkbid0IHNl
ZSB0aGUgY2hhbmdlIGxhbmRlZCAuLi4uDQoNCi9Nb25rDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQpGcm9tOiBLb2VuaWcsIENocmlzdGlhbiANClNlbnQ6IFdlZG5lc2RheSwgSnVuZSA1
LCAyMDE5IDc6MTEgUE0NClRvOiBMaXUsIE1vbmsgPE1vbmsuTGl1QGFtZC5jb20+OyBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KU3ViamVjdDogUmU6IEZXOiBbUEFUQ0hdIGRybS90dG06
IGZpeCB0dG0gY2xpZW50IGRyaXZlciAoZS5nLiBhbWRncHUpIHJlbG9hZCBpc3N1ZQ0KDQpUaGlz
IHNob3VsZCBhbHJlYWR5IGJlIGZpeGVkIGJ5IHBhdGNoICJkcm0vdHRtOiBmaXggcmUtaW5pdCBv
ZiBnbG9iYWwgc3RydWN0dXJlcyIuDQoNCkNocmlzdGlhbi4NCg0KQW0gMDUuMDYuMTkgdW0gMDk6
Mjkgc2NocmllYiBMaXUsIE1vbms6DQo+DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
IEZyb206IE1vbmsgTGl1IDxNb25rLkxpdUBhbWQuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEp1
bmUgNSwgMjAxOSAyOjQ1IFBNDQo+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
PiBDYzogTGl1LCBNb25rIDxNb25rLkxpdUBhbWQuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0hdIGRy
bS90dG06IGZpeCB0dG0gY2xpZW50IGRyaXZlciAoZS5nLiBhbWRncHUpIHJlbG9hZCANCj4gaXNz
dWUNCj4NCj4gbmVlZCB0byBjbGVhciBibyBnbG9iIGFuZCBtZW0gZ2xvYiBkdXJpbmcgdGhlaXIg
cmVsZWFzZSBvdGhlcndpc2UgdGhlaXIgbWVtYmVyIHZhbHVlIHdvdWxkIGJlIHdyb25nbHkgdXNl
ZCBpbiB0aGUgbmV4dCBnbG9iIGluaXQgc3RhZ2UgYW5kIGxlYWQgdG8gd2lsZCBwb2ludGVyIGFj
Y2VzcyBwcm9ibGVtczoNCj4NCj4gMSkga29iai5zdGF0ZV9pbml0aWFsaXplZCBpcyAxDQo+IDIp
IHR0bV9ib19nbG9iLmJvX2NvdW50IGlzbid0IGNsZWFyZWQgYW5kIHJlZmVyZW5jZWQgdmlhIGl0
DQo+ICAgICBvbiBtZW1iZXIgInN3YXBfbHJ1IiB3b3VsZCBoaXQgb3V0IG9mIGJvdW5kIGFycmF5
IGFjY2Vzc2luZw0KPiAgICAgYnVnDQo+DQo+IFNpZ25lZC1vZmYtYnk6IE1vbmsgTGl1IDxNb25r
LkxpdUBhbWQuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jICAg
ICB8IDIgKysNCj4gICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9tZW1vcnkuYyB8IDggKysrKysr
KysNCj4gICAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgDQo+IGIvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm8uYyBpbmRleCBjN2RlNjY3Li42NDM0ZWFjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vdHRtL3R0bV9iby5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Jv
LmMNCj4gQEAgLTE2MDQsNiArMTYwNCw4IEBAIHN0YXRpYyB2b2lkIHR0bV9ib19nbG9iYWxfa29i
al9yZWxlYXNlKHN0cnVjdCBrb2JqZWN0ICprb2JqKQ0KPiAgIAkJY29udGFpbmVyX29mKGtvYmos
IHN0cnVjdCB0dG1fYm9fZ2xvYmFsLCBrb2JqKTsNCj4gICANCj4gICAJX19mcmVlX3BhZ2UoZ2xv
Yi0+ZHVtbXlfcmVhZF9wYWdlKTsNCj4gKw0KPiArCW1lbXNldChnbG9iLCAwLCBzaXplb2YoKmds
b2IpKTsNCj4gICB9DQo+ICAgDQo+ICAgc3RhdGljIHZvaWQgdHRtX2JvX2dsb2JhbF9yZWxlYXNl
KHZvaWQpIGRpZmYgLS1naXQgDQo+IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fbWVtb3J5LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9tZW1vcnkuYw0KPiBpbmRleCA4NjE3OTU4Li43MTI4
YmJmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9tZW1vcnkuYw0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9tZW1vcnkuYw0KPiBAQCAtMjI5LDkgKzIyOSwx
NyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHN5c2ZzX29wcyB0dG1fbWVtX2dsb2JhbF9vcHMgPSB7
DQo+ICAgCS5zdG9yZSA9ICZ0dG1fbWVtX2dsb2JhbF9zdG9yZSwNCj4gICB9Ow0KPiAgIA0KPiAr
dm9pZCB0dG1fbWVtX2dsb2Jfa29ial9yZWxlYXNlKHN0cnVjdCBrb2JqZWN0ICprb2JqKSB7DQo+
ICsJc3RydWN0IHR0bV9tZW1fZ2xvYmFsICpnbG9iID0gY29udGFpbmVyX29mKGtvYmosIHN0cnVj
dCANCj4gK3R0bV9tZW1fZ2xvYmFsLCBrb2JqKTsNCj4gKw0KPiArCW1lbXNldChnbG9iLCAwLCBz
aXplb2YoKmdsb2IpKTsNCj4gK30NCj4gKw0KPiAgIHN0YXRpYyBzdHJ1Y3Qga29ial90eXBlIHR0
bV9tZW1fZ2xvYl9rb2JqX3R5cGUgPSB7DQo+ICAgCS5zeXNmc19vcHMgPSAmdHRtX21lbV9nbG9i
YWxfb3BzLA0KPiAgIAkuZGVmYXVsdF9hdHRycyA9IHR0bV9tZW1fZ2xvYmFsX2F0dHJzLA0KPiAr
CS5yZWxlYXNlID0gdHRtX21lbV9nbG9iX2tvYmpfcmVsZWFzZSwNCj4gICB9Ow0KPiAgIA0KPiAg
IHN0YXRpYyBib29sIHR0bV96b25lc19hYm92ZV9zd2FwX3RhcmdldChzdHJ1Y3QgdHRtX21lbV9n
bG9iYWwgKmdsb2IsDQo+IC0tDQo+IDIuNy40DQo+DQoNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
