Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2694D22A
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2019 17:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107256E5C5;
	Thu, 20 Jun 2019 15:29:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790074.outbound.protection.outlook.com [40.107.79.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60DC66E5C5
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 Jun 2019 15:29:48 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3675.namprd12.prod.outlook.com (10.255.76.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Thu, 20 Jun 2019 15:29:46 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1987.014; Thu, 20 Jun 2019
 15:29:46 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "Kim, Jonathan"
 <Jonathan.Kim@amd.com>
Subject: Re: [PATCH] drm/amdgpu: early merge post fix to df_v3_6 for xgmi
Thread-Topic: [PATCH] drm/amdgpu: early merge post fix to df_v3_6 for xgmi
Thread-Index: AQHVJ3uTGJ1SMJyIrEeGRdaJ1XpLY6akqomAgAAAeYA=
Date: Thu, 20 Jun 2019 15:29:46 +0000
Message-ID: <93a28cd9-b869-30cb-ea8a-e6d84308e1dd@amd.com>
References: <20190620151924.86234-1-jonathan.kim@amd.com>
 <CADnq5_MRS_oT1fC45eEqJ3CTdNYc6eKuu2Fu-KTLJ3hbaUUfAw@mail.gmail.com>
In-Reply-To: <CADnq5_MRS_oT1fC45eEqJ3CTdNYc6eKuu2Fu-KTLJ3hbaUUfAw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-clientproxiedby: YTBPR01CA0007.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::20) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a0b7b798-b1c6-4fae-d0e8-08d6f594203b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB3675; 
x-ms-traffictypediagnostic: DM6PR12MB3675:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB36759029A073818F2821BD4192E40@DM6PR12MB3675.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(39860400002)(136003)(376002)(396003)(346002)(199004)(189003)(58126008)(25786009)(64126003)(7736002)(305945005)(36756003)(229853002)(6512007)(4326008)(6306002)(53546011)(68736007)(6506007)(386003)(6486002)(3846002)(6116002)(102836004)(6246003)(2906002)(76176011)(52116002)(26005)(8676002)(8936002)(64756008)(73956011)(66556008)(186003)(99286004)(53936002)(476003)(2616005)(446003)(11346002)(66446008)(486006)(66476007)(66946007)(81166006)(81156014)(65956001)(65806001)(110136005)(66066001)(6436002)(71190400001)(71200400001)(86362001)(31696002)(31686004)(478600001)(14454004)(6636002)(65826007)(72206003)(966005)(5660300002)(256004)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3675;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 16NRZvs8cGr/ye2rtryrIlBWBWiGZllUV6I12GBq6JMK8K2QzKP7FoiHGw85ih39Hz5K2Q83KRa0/Q/FHx8qd2clakZUfQKIwi8WONy0aJyyyk74xtH9bOO1U/xLjL0gwJHxoQ2CSk5Yg5WDgI45+8IKnfcn2utgNQZcakprkIJfUhX65pCi/q5fXp/JAm32qhUuZQEMsUeARIW5rwmmMX8SpnpgDgOrV9xcDuzB5whVqvahsTQBjvGpIhCOtBCXLkg3OCVYhk1LP1a3Rc6MxXggsoJkFgErU7cz1b4ZRlqwfnn+gI6Wv0Z6AFtHudM9gpF5L178MAnsyVKkaUd3VoHz89qW8AtiMrrgV5Ww5+/qJvTS+mUV0ZLhadACW+Oy9chx6HbFUBTTNbz3riw/G0wHVPksGO4xpv+o4YLnYP4=
Content-ID: <6A69D536AE6A264B8CC73B928E126949@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0b7b798-b1c6-4fae-d0e8-08d6f594203b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 15:29:46.6948 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3675
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jTUZakLINaCLdHRWnAF9/116L/vwYcsbCHcCAHIU4xU=;
 b=CCcwIJyxGAkKC3xzY6K++L2MMkDWG2fOz5TmWyhTm2Rra0SDX/uCM6Gml9/4HBUajkwnP9f1gA49IbmiH407ickuJxNw7s2DrEyr2HjKYeBV1aKBWTT0M4MZYExHMAmHbq/6j+R/UB/NBGeLEpLT1onD+3fir+zXQbw9kDqwg/g=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNi0yMCAxMToyOCBhLm0uLCBBbGV4IERldWNoZXIgd3JvdGU6DQo+IE9uIFRodSwg
SnVuIDIwLCAyMDE5IGF0IDExOjE5IEFNIEtpbSwgSm9uYXRoYW4gPEpvbmF0aGFuLktpbUBhbWQu
Y29tPiB3cm90ZToNCj4+IGZpeGVkIGRmIHBlcm1vbiB0byA0DQo+PiByZW1vdmVkIHVucmVxdWly
ZWQgcmV0IGluIHNvYzE1DQo+PiByZW5hbWVkIGRmIGluaXQgdG8gZGYgc3cgaW5pdCBhbmQgbW92
ZWQgY2FsbGJhY2sgZnJvbSBzb2MxNSBodyBpbml0IHRvDQo+PiBzb2MxNSBzdyBpbml0DQo+Pg0K
Pj4gQ2hhbmdlLUlkOiBJYTk4OTc2MTI5MzdlNjUyZTdmOGEwOWMxZDIzYmIxYzBlNmYzZDhmNw0K
Pj4gU2lnbmVkLW9mZi1ieTogSm9uYXRoYW4gS2ltIDxKb25hdGhhbi5LaW1AYW1kLmNvbT4NCj4+
IC0tLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCAgfCAyICstDQo+
PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYuYyB8IDQgKystLQ0KPj4gICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jICAgfCA1ICsrLS0tDQo+PiAgIDMgZmls
ZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oDQo+PiBpbmRleCBiMjI3Yzk1NmI4YTkuLmMzZWQwOWNk
MjY3OCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5o
DQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaA0KPj4gQEAgLTcz
Miw3ICs3MzIsNyBAQCBzdHJ1Y3QgYW1kX3Bvd2VycGxheSB7DQo+PiAgIH07DQo+Pg0KPj4gICAj
ZGVmaW5lIEFNREdQVV9SRVNFVF9NQUdJQ19OVU0gNjQNCj4+IC0jZGVmaW5lIEFNREdQVV9NQVhf
REZfUEVSRk1PTlMgMTYNCj4+ICsjZGVmaW5lIEFNREdQVV9NQVhfREZfUEVSRk1PTlMgNA0KPj4g
ICBzdHJ1Y3QgYW1kZ3B1X2RldmljZSB7DQo+PiAgICAgICAgICBzdHJ1Y3QgZGV2aWNlICAgICAg
ICAgICAgICAgICAgICpkZXY7DQo+PiAgICAgICAgICBzdHJ1Y3QgZHJtX2RldmljZSAgICAgICAg
ICAgICAgICpkZGV2Ow0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2RmX3YzXzYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYuYw0KPj4gaW5k
ZXggMTJlM2U2NzAxM2Q5Li5jNjUxNGM2MDlhZTYgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2RmX3YzXzYuYw0KPj4gQEAgLTExOCw3ICsxMTgsNyBAQCBzdGF0aWMgc3NpemVfdCBk
Zl92M182X2dldF9kZl9jbnRyX2F2YWlsKHN0cnVjdCBkZXZpY2UgKmRldiwNCj4+ICAgc3RhdGlj
IERFVklDRV9BVFRSKGRmX2NudHJfYXZhaWwsIFNfSVJVR08sIGRmX3YzXzZfZ2V0X2RmX2NudHJf
YXZhaWwsIE5VTEwpOw0KPj4NCj4+ICAgLyogaW5pdCBwZXJmbW9ucyAqLw0KPj4gLXN0YXRpYyB2
b2lkIGRmX3YzXzZfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4+ICtzdGF0aWMg
dm9pZCBkZl92M182X3N3X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+PiAgIHsN
Cj4+ICAgICAgICAgIGludCBpLCByZXQ7DQo+Pg0KPj4gQEAgLTQ5MCw3ICs0OTAsNyBAQCBzdGF0
aWMgdm9pZCBkZl92M182X3BtY19nZXRfY291bnQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYs
DQo+PiAgIH0NCj4+DQo+PiAgIGNvbnN0IHN0cnVjdCBhbWRncHVfZGZfZnVuY3MgZGZfdjNfNl9m
dW5jcyA9IHsNCj4+IC0gICAgICAgLmluaXQgPSBkZl92M182X2luaXQsDQo+PiArICAgICAgIC5p
bml0ID0gZGZfdjNfNl9zd19pbml0LA0KPiBXYXNuJ3QgdGhlcmUgYSBmaW5pIGNhbGxiYWNrIGFz
IHdlbGwgdG8gdGVhciBzdHVmZiBkb3duPyAgV2hhdA0KPiBoYXBwZW5lZCB0byB0aGF0PyAgQXBv
bG9naWVzIGlmIEkgbWlzc2VkIHNvbWUgb2YgdGhlIGRpc2N1c3Npb24sIEknbQ0KPiBzdGlsbCBj
YXRjaGluZyB1cC4NCg0KVGhlIGZpbmkgY2FsbGJhY2sgYmVjYW1lIHVubmVjZXNzYXJ5IHdoZW4g
d2UgcmVtb3ZlZCBkeW5hbWljIGFsbG9jYXRpb24gDQpvZiBtZW1vcnkgaW4gdGhlIGluaXQgZnVu
Y3Rpb24uIFNvIGl0IHdhc24ndCBpbiB0aGUgZmluYWwgdmVyc2lvbiBvZiB0aGUgDQpwYXRjaC4N
Cg0KUmVnYXJkcywNCiDCoCBGZWxpeA0KDQoNCj4NCj4gQWxleA0KPg0KPj4gICAgICAgICAgLmVu
YWJsZV9icm9hZGNhc3RfbW9kZSA9IGRmX3YzXzZfZW5hYmxlX2Jyb2FkY2FzdF9tb2RlLA0KPj4g
ICAgICAgICAgLmdldF9mYl9jaGFubmVsX251bWJlciA9IGRmX3YzXzZfZ2V0X2ZiX2NoYW5uZWxf
bnVtYmVyLA0KPj4gICAgICAgICAgLmdldF9oYm1fY2hhbm5lbF9udW1iZXIgPSBkZl92M182X2dl
dF9oYm1fY2hhbm5lbF9udW1iZXIsDQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvc29jMTUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMNCj4+
IGluZGV4IDBhZmJjYzgwZWE2MS4uZDFlN2Y2MjNlZWE4IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvc29jMTUuYw0KPj4gQEAgLTEwMzQsNiArMTAzNCw4IEBAIHN0YXRpYyBpbnQgc29j
MTVfY29tbW9uX3N3X2luaXQodm9pZCAqaGFuZGxlKQ0KPj4gICAgICAgICAgaWYgKGFtZGdwdV9z
cmlvdl92ZihhZGV2KSkNCj4+ICAgICAgICAgICAgICAgICAgeGdwdV9haV9tYWlsYm94X2FkZF9p
cnFfaWQoYWRldik7DQo+Pg0KPj4gKyAgICAgICBhZGV2LT5kZl9mdW5jcy0+aW5pdChhZGV2KTsN
Cj4+ICsNCj4+ICAgICAgICAgIHJldHVybiAwOw0KPj4gICB9DQo+Pg0KPj4gQEAgLTEwNjcsNyAr
MTA2OSw2IEBAIHN0YXRpYyB2b2lkIHNvYzE1X2Rvb3JiZWxsX3JhbmdlX2luaXQoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpDQo+PiAgIHN0YXRpYyBpbnQgc29jMTVfY29tbW9uX2h3X2luaXQo
dm9pZCAqaGFuZGxlKQ0KPj4gICB7DQo+PiAgICAgICAgICBzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiA9IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqKWhhbmRsZTsNCj4+IC0gICAgICAgaW50IHJl
dDsNCj4+DQo+PiAgICAgICAgICAvKiBlbmFibGUgcGNpZSBnZW4yLzMgbGluayAqLw0KPj4gICAg
ICAgICAgc29jMTVfcGNpZV9nZW4zX2VuYWJsZShhZGV2KTsNCj4+IEBAIC0xMDgyLDggKzEwODMs
NiBAQCBzdGF0aWMgaW50IHNvYzE1X2NvbW1vbl9od19pbml0KHZvaWQgKmhhbmRsZSkNCj4+ICAg
ICAgICAgIGlmIChhZGV2LT5uYmlvX2Z1bmNzLT5yZW1hcF9oZHBfcmVnaXN0ZXJzKQ0KPj4gICAg
ICAgICAgICAgICAgICBhZGV2LT5uYmlvX2Z1bmNzLT5yZW1hcF9oZHBfcmVnaXN0ZXJzKGFkZXYp
Ow0KPj4NCj4+IC0gICAgICAgYWRldi0+ZGZfZnVuY3MtPmluaXQoYWRldik7DQo+PiAtDQo+PiAg
ICAgICAgICAvKiBlbmFibGUgdGhlIGRvb3JiZWxsIGFwZXJ0dXJlICovDQo+PiAgICAgICAgICBz
b2MxNV9lbmFibGVfZG9vcmJlbGxfYXBlcnR1cmUoYWRldiwgdHJ1ZSk7DQo+PiAgICAgICAgICAv
KiBIVyBkb29yYmVsbCByb3V0aW5nIHBvbGljeTogZG9vcmJlbGwgd3JpdGluZyBub3QNCj4+IC0t
DQo+PiAyLjE3LjENCj4+DQo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXw0KPj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4+IGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnDQo+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZngNCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18NCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
