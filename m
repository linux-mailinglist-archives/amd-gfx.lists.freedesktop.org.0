Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCBAC1DA6
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Sep 2019 11:06:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D486E067;
	Mon, 30 Sep 2019 09:06:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720053.outbound.protection.outlook.com [40.107.72.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C2D6E067
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Sep 2019 09:06:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T9f3nUXIMqMNHem8xAdMEbSTErLaLMzOvBJQ7QWLEUQDByZClPUf5BWma23wyR3H2jQ8HkBUu6q6i3woh+v8/vzWb8Sb6gX/W+Azt08/6N5w9St8ZxxiL7Ged2zEAZ/EhwsSMCiLF7gn6AGzOKw4Ydqyxnl6DbU4WFBmvsInIhS7vE20QF5YBCvQ6QUxZbumc5xZuYpQ7UD9IB8/i283YNi3E9pyDtZ7lh3CK/STJw5hSr3rwTX65TXBdATltmccGWkZRG+6MYg+YXYX0wRfUKPneZq+fIh275/ewfT1Or6KxUWGjP3r3UWmqBy3dkI8yYKU9W4dflOKsvcEx5YZiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2eUUOo7JRjRV68aMt9Iy5Hg0NDudS6ashVZMaKFJ8o8=;
 b=XGWKLFqkDlO0M5+eXrGwOXaNolKBPzwyaLJCWQVI9wZhaU11AGu3Ocpx/TCcWy6Cf5exZ+k/E6YAIxTBalD/dDobPcdobXTBe/TqczKKCa7kjDNtxtfMqCE+JXxbrFEXHD90+6IDLoLMqNwYVbOPwERTEWHRENLVXHWCU7SljwVwungXAiJiHgFeGkHwSrgJiRkzq0Odn1eb1w3Dsxtnm/WrfsAEql196p1Zpga+6TUf2YMUC6fjL2Sd1dNOmydrL9PgScHo97Ip6sek1IpquztVldJ/QbdnoHKfgYE76NpGjBc3EEdVoQQGdayqLQM4Kl6KzPsY/tyr03u1UwS6fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3998.namprd12.prod.outlook.com (10.255.239.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.16; Mon, 30 Sep 2019 09:06:55 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::a404:dfd4:47a9:497]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::a404:dfd4:47a9:497%7]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 09:06:55 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Grodzovsky, 
 Andrey" <Andrey.Grodzovsky@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>,
 "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: RE: [PATCH 1/3] drm/amdgpu: recreate retired page's bo if vram get
 lost in gpu reset
Thread-Topic: [PATCH 1/3] drm/amdgpu: recreate retired page's bo if vram get
 lost in gpu reset
Thread-Index: AQHVdz3uGX/LW6ISLEmATDYlQvboS6dD5YmAgAAEuRA=
Date: Mon, 30 Sep 2019 09:06:55 +0000
Message-ID: <MN2PR12MB305489541BCEF7B758412C6AB0820@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <20190930031938.10982-1-tao.zhou1@amd.com>
 <5baa91ba-73b9-6d49-4a03-51c4acb2505c@gmail.com>
In-Reply-To: <5baa91ba-73b9-6d49-4a03-51c4acb2505c@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 525b779b-ca56-4d10-0e44-08d745858aba
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB3998:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB39986440C740B6FCD0CA2BEAB0820@MN2PR12MB3998.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(39860400002)(366004)(376002)(136003)(13464003)(199004)(189003)(110136005)(8936002)(76116006)(6506007)(53546011)(52536014)(102836004)(3846002)(6636002)(316002)(2906002)(256004)(478600001)(25786009)(6116002)(14454004)(5660300002)(7736002)(305945005)(74316002)(81166006)(81156014)(8676002)(486006)(229853002)(6246003)(7696005)(33656002)(66066001)(11346002)(66446008)(446003)(186003)(66556008)(64756008)(6436002)(14444005)(476003)(71190400001)(71200400001)(66946007)(66476007)(76176011)(99286004)(86362001)(9686003)(26005)(55016002)(2501003)(66574012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3998;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8wAkWoKa5uSVLdYKoDy7uy8/UiJtwTGx5otPSHAtIrjV/LY1ijiqHhrl+FdqzQHCZkmo9FFKmZqyt7Fzyg+8R3cn3aaAW/22x4suaADceb3zTbLo0DX6+/FmSTKLIYnVHYDUPMq4FFb8q8Uq13uqpRTJwCjq/7Q7ltnKes8vFQu7w4OjBi3XzHDKve05Nc/OMv8FT30MstLoAFMkHX9N8d8ZMdkI84Tzrh785uoAgQb6ooHPqZHWnLHzBQXBOIsO4oIvIRt1fSMLfNhVN7ZWOvmCQmKPCohs5mFHm1BXxoLeMXPjZl40H1nZMaVUcdtfvBiVKq6I1rJ3Vq+lO131Ehj/a4IUpPGQ+f03ncfmf/Kq7BG7FxfYbptOg7yt1vr/m4Hq+2SuYDJ6sPEz6ddgge4JLXoaegEOIoxA+tpsW2o=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 525b779b-ca56-4d10-0e44-08d745858aba
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 09:06:55.3612 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /IAM1cPaqEayEPFzRTb9ITsP4iLwdFtD9oXiSYHCcPb+frr33uQjYEdA6Qcae220
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3998
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2eUUOo7JRjRV68aMt9Iy5Hg0NDudS6ashVZMaKFJ8o8=;
 b=BuMEtqR12WhbEvaAcwLZPlXSPnlRFP0txZMy+NQApwCiW0dhUIw7KwKN6FUOomz4rxq2Hp2Hkp59/4pwwig2wrBc09COicKpxZoWbN8BOiDFPiGTIOoWKZmuL75PbOe2nYcaTk+YBMfSUBuVbQALyaFQg/3UgUCAnnNCRacBmdg=
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

SGkgQ2hyaXN0aWFuOg0KDQpTbyB0aGUgYWxsb2NhdGlvbiBpbmZvcm1hdGlvbiBvZiBhIGJvJ3Mg
dnJhbSBwYWdlIGNvdWxkIGJlIHJlc2VydmVkIGFmdGVyIHZyYW0gbG9zdD8NCkluIGZhY3QsIHRo
aXMgc2VyaWVzIGNvdWxkIGJlIGRyb3BwZWQgaWYgdGhlIHJlc3VsdCBvZiBhbWRncHVfYm9fY3Jl
YXRlX3Jlc2VydmVkIGlzIGd1YXJhbnRlZWQgdG8gYmUgZmFpbGVkIGFmdGVyIHZyYW0gbG9zdCAo
cHJvdGVjdCBiYWQgcGFnZXMgZnJvbSByZWFsbG9jYXRpbmcpLg0KDQpIaSBBbmRyZXk6DQoNCkEg
YmFkIHBhZ2UncyBhbGxvY2F0aW9uIGluZm9ybWF0aW9uIHdpbGwgbm90IGJlIGxvc3QgaW4gZ3B1
IHJlc2V0IGFjY29yZGluZyB0byBDaHJpc3RpYW4ncyBjb21tZW50cy4gRG8geW91IGhhdmUgYW55
IG90aGVyIGNvbmNlcm4/DQoNClJlZ2FyZHMsDQpUYW8NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiBGcm9tOiBDaHJpc3RpYW4gS8O2bmlnIDxja29lbmlnLmxlaWNodHp1bWVya2Vu
QGdtYWlsLmNvbT4NCj4gU2VudDogMjAxOeW5tDnmnIgzMOaXpSAxNjozNQ0KPiBUbzogWmhvdTEs
IFRhbyA8VGFvLlpob3UxQGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsN
Cj4gR3JvZHpvdnNreSwgQW5kcmV5IDxBbmRyZXkuR3JvZHpvdnNreUBhbWQuY29tPjsgQ2hlbiwg
R3VjaHVuDQo+IDxHdWNodW4uQ2hlbkBhbWQuY29tPjsgWmhhbmcsIEhhd2tpbmcgPEhhd2tpbmcu
WmhhbmdAYW1kLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzNdIGRybS9hbWRncHU6IHJl
Y3JlYXRlIHJldGlyZWQgcGFnZSdzIGJvIGlmIHZyYW0gZ2V0DQo+IGxvc3QgaW4gZ3B1IHJlc2V0
DQo+IA0KPiBBbSAzMC4wOS4xOSB1bSAwNToxOSBzY2hyaWViIFpob3UxLCBUYW86DQo+ID4gdGhl
IGluZm8gb2YgcmV0aXJlZCBwYWdlJ3MgYm8gbWF5IGJlIGxvc3QgaWYgdnJhbSBsb3N0IGlzIGVu
Y291bnRlcmVkDQo+ID4gaW4gZ3B1IHJlc2V0IChncHUgcGFnZSB0YWJsZSBpbiB2cmFtIG1heSBi
ZSBsb3N0KSwgZm9yY2UgdG8gcmVjcmVhdGUNCj4gPiBhbGwgYm9zDQo+ID4NCj4gPiB2Mjogc2lt
cGxpZnkgTlVMTCBwb2ludGVyIGNoZWNrDQo+ID4gICAgICBhZGQgbW9yZSBjb21tZW50cw0KPiAN
Cj4gUmVwZWF0aW5nIG9uIHRoZSB2MiBvZiB0aGUgcGF0Y2ggc2V0LCB0aGlzIGlzIGNvbXBsZXRl
IG5vbnNlbnNlLg0KPiANCj4gV2hlbiBWUkFNIGlzIGxvc3QgdGhlIEJPcyBhbmQgdGhlaXIgcmVz
ZXJ2YXRpb24gc3RpbGwgZXhpdHMsIG9ubHkgdGhlIGNvbnRlbnQNCj4gaXMgbG9zdCBiZWNhdXNl
IHRoZSBNQyBpcyBoYXMgYmVlbiByZXNldHRlZC4NCj4gDQo+IFJlZ2FyZHMsDQo+IENocmlzdGlh
bi4NCj4gDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBUYW8gWmhvdSA8dGFvLnpob3UxQGFtZC5j
b20+DQo+ID4gU3VnZ2VzdGVkLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zz
a3lAYW1kLmNvbT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kZXZpY2UuYyB8ICAxICsNCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9yYXMuYyAgICB8IDQ4DQo+ICsrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaCAgICB8ICAxICsNCj4gPiAgIDMgZmls
ZXMgY2hhbmdlZCwgNTAgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYw0KPiA+IGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQo+ID4gaW5kZXggNjI5NTUxNTY2NTNjLi5h
ODlmNmQwNTNiM2YgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2RldmljZS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2RldmljZS5jDQo+ID4gQEAgLTM2NzUsNiArMzY3NSw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1
X2RvX2FzaWNfcmVzZXQoc3RydWN0DQo+IGFtZGdwdV9oaXZlX2luZm8gKmhpdmUsDQo+ID4gICAJ
CQkJaWYgKHZyYW1fbG9zdCkgew0KPiA+ICAgCQkJCQlEUk1fSU5GTygiVlJBTSBpcyBsb3N0IGR1
ZSB0byBHUFUNCj4gcmVzZXQhXG4iKTsNCj4gPiAgIAkJCQkJYW1kZ3B1X2luY192cmFtX2xvc3Qo
dG1wX2FkZXYpOw0KPiA+ICsNCj4gCWFtZGdwdV9yYXNfcmVjb3ZlcnlfcmVzZXQodG1wX2FkZXYp
Ow0KPiA+ICAgCQkJCX0NCj4gPg0KPiA+ICAgCQkJCXIgPSBhbWRncHVfZ3R0X21ncl9yZWNvdmVy
KA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFz
LmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYw0KPiA+IGlu
ZGV4IDQ4NjU2OGRlZDZkNi4uM2YyYTJmMTNlNGM2IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYw0KPiA+IEBAIC0xNTczLDYgKzE1NzMsNTQgQEAgc3Rh
dGljIGludCBhbWRncHVfcmFzX3JlY292ZXJ5X2Zpbmkoc3RydWN0DQo+ID4gYW1kZ3B1X2Rldmlj
ZSAqYWRldikNCj4gPg0KPiA+ICAgCXJldHVybiAwOw0KPiA+ICAgfQ0KPiA+ICsNCj4gPiArLyoN
Cj4gPiArICogdGhlIGluZm8gb2YgcmV0aXJlZCBwYWdlJ3MgYm8gbWF5IGJlIGxvc3QgaWYgdnJh
bSBsb3N0IGlzDQo+ID4gK2VuY291bnRlcmVkDQo+ID4gKyAqIGluIGdwdSByZXNldCAoZ3B1IHBh
Z2UgdGFibGUgaW4gdnJhbSBtYXkgYmUgbG9zdCksIGZvcmNlIHRvDQo+ID4gK3JlY3JlYXRlDQo+
ID4gKyAqIGFsbCBib3MNCj4gPiArICovDQo+ID4gK3ZvaWQgYW1kZ3B1X3Jhc19yZWNvdmVyeV9y
ZXNldChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikgew0KPiA+ICsJc3RydWN0IGFtZGdwdV9y
YXMgKmNvbiA9IGFtZGdwdV9yYXNfZ2V0X2NvbnRleHQoYWRldik7DQo+ID4gKwlzdHJ1Y3QgcmFz
X2Vycl9oYW5kbGVyX2RhdGEgKmRhdGE7DQo+ID4gKwl1aW50NjRfdCBicDsNCj4gPiArCXN0cnVj
dCBhbWRncHVfYm8gKmJvID0gTlVMTDsNCj4gPiArCWludCBpOw0KPiA+ICsNCj4gPiArCWlmICgh
Y29uIHx8ICFjb24tPmVoX2RhdGEpDQo+ID4gKwkJcmV0dXJuOw0KPiA+ICsNCj4gPiArCS8qIE5v
dGU6IEl0J3MgY2FsbGVkIGluIGdwdSByZXNldCwgcmVjb3ZlcnlfbG9jayBtYXkgYmUgYWNxdWly
ZWQNCj4gYmVmb3JlDQo+ID4gKwkgKiBncHUgcmVzZXQuIFRoZSBmb2xsb3dpbmcgY29kZSBpcyBv
dXQgb2YgcHJvdGVjdCBvZiBjb24tDQo+ID5yZWNvdmVyeV9sb2NrDQo+ID4gKwkgKiBpbiBjYXNl
IG9mIGRlYWRsb2NrIGFuZCBicHNfYm8gc2hvdWxkIGJlIHJlY3JlYXRlZCAoaWYgc3VjY2Vzc2Z1
bGx5KQ0KPiA+ICsJICogd2hldGhlciByZWNvdmVyeV9sb2NrIGlzIGxvY2tlZCBvciBub3QuDQo+
ID4gKwkgKiBXZSBhc3N1bWUgdGhlcmUgaXMgbm8gb3RoZXIgcmFzIHJlY292ZXJ5IG9wZXJhdGlv
biBzaW11bHRhbmVvdXMNCj4gZHVyaW5nDQo+ID4gKwkgKiBncHUgcmVzZXQuDQo+ID4gKwkgKi8N
Cj4gPiArCWRhdGEgPSBjb24tPmVoX2RhdGE7DQo+ID4gKwkvKiBmb3JjZSB0byByZXNlcnZlIGFs
bCByZXRpcmVkIHBhZ2UgYWdhaW4gKi8NCj4gPiArCWRhdGEtPmxhc3RfcmVzZXJ2ZWQgPSAwOw0K
PiA+ICsNCj4gPiArCWZvciAoaSA9IGRhdGEtPmxhc3RfcmVzZXJ2ZWQ7IGkgPCBkYXRhLT5jb3Vu
dDsgaSsrKSB7DQo+ID4gKwkJYnAgPSBkYXRhLT5icHNbaV0ucmV0aXJlZF9wYWdlOw0KPiA+ICsN
Cj4gPiArCQkvKiBUaGVyZSBhcmUgdGhyZWUgY2FzZXMgb2YgcmVzZXJ2ZSBlcnJvciBzaG91bGQg
YmUgaWdub3JlZDoNCj4gPiArCQkgKiAxKSBhIHJhcyBiYWQgcGFnZSBoYXMgYmVlbiBhbGxvY2F0
ZWQgKHVzZWQgYnkgc29tZW9uZSk7DQo+ID4gKwkJICogMikgYSByYXMgYmFkIHBhZ2UgaGFzIGJl
ZW4gcmVzZXJ2ZWQgKGR1cGxpY2F0ZSBlcnJvcg0KPiBpbmplY3Rpb24NCj4gPiArCQkgKiAgICBm
b3Igb25lIHBhZ2UpOw0KPiA+ICsJCSAqIDMpIGJvIGluZm8gaXNuJ3QgbG9zdCBpbiBncHUgcmVz
ZXQNCj4gPiArCQkgKi8NCj4gPiArCQlpZiAoYW1kZ3B1X2JvX2NyZWF0ZV9rZXJuZWxfYXQoYWRl
diwgYnAgPDwNCj4gQU1ER1BVX0dQVV9QQUdFX1NISUZULA0KPiA+ICsJCQkJCSAgICAgICBBTURH
UFVfR1BVX1BBR0VfU0laRSwNCj4gPiArCQkJCQkgICAgICAgQU1ER1BVX0dFTV9ET01BSU5fVlJB
TSwNCj4gPiArCQkJCQkgICAgICAgJmJvLCBOVUxMKSkNCj4gPiArCQkJRFJNX05PVEUoIlJBUyBO
T1RFOiByZWNyZWF0ZSBibyBmb3IgcmV0aXJlZCBwYWdlDQo+IDB4JWxseCBmYWlsXG4iLCBicCk7
DQo+ID4gKwkJZWxzZQ0KPiA+ICsJCQlkYXRhLT5icHNfYm9baV0gPSBibzsNCj4gPiArCQlkYXRh
LT5sYXN0X3Jlc2VydmVkID0gaSArIDE7DQo+ID4gKwkJYm8gPSBOVUxMOw0KPiA+ICsJfQ0KPiA+
ICt9DQo+ID4gICAvKiByZWNvdmVyeSBlbmQgKi8NCj4gPg0KPiA+ICAgLyogcmV0dXJuIDAgaWYg
cmFzIHdpbGwgcmVzZXQgZ3B1IGFuZCByZXBvc3QuKi8gZGlmZiAtLWdpdA0KPiA+IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcmFzLmgNCj4gPiBpbmRleCBmODBmZDM0MjhjOTguLjdhNjA2ZDNi
ZTgwNiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
cmFzLmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmgN
Cj4gPiBAQCAtNDc5LDYgKzQ3OSw3IEBAIHN0YXRpYyBpbmxpbmUgaW50IGFtZGdwdV9yYXNfaXNf
c3VwcG9ydGVkKHN0cnVjdA0KPiBhbWRncHVfZGV2aWNlICphZGV2LA0KPiA+ICAgfQ0KPiA+DQo+
ID4gICBpbnQgYW1kZ3B1X3Jhc19yZWNvdmVyeV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KTsNCj4gPiArdm9pZCBhbWRncHVfcmFzX3JlY292ZXJ5X3Jlc2V0KHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KTsNCj4gPiAgIGludCBhbWRncHVfcmFzX3JlcXVlc3RfcmVzZXRfb25fYm9v
dChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gPiAgIAkJdW5zaWduZWQgaW50IGJsb2Nr
KTsNCj4gPg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
