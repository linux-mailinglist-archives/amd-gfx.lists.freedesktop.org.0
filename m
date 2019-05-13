Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE091B01C
	for <lists+amd-gfx@lfdr.de>; Mon, 13 May 2019 08:02:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBBBD894FE;
	Mon, 13 May 2019 06:02:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790079.outbound.protection.outlook.com [40.107.79.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59169894FE
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 May 2019 06:02:30 +0000 (UTC)
Received: from BYAPR12MB3301.namprd12.prod.outlook.com (20.179.93.222) by
 BYAPR12MB3590.namprd12.prod.outlook.com (20.178.197.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.25; Mon, 13 May 2019 06:02:27 +0000
Received: from BYAPR12MB3301.namprd12.prod.outlook.com
 ([fe80::d957:9d48:579a:a40f]) by BYAPR12MB3301.namprd12.prod.outlook.com
 ([fe80::d957:9d48:579a:a40f%7]) with mapi id 15.20.1878.024; Mon, 13 May 2019
 06:02:27 +0000
From: "Liu, Monk" <Monk.Liu@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: avoid duplicated tmo report on same job
Thread-Topic: [PATCH] drm/amdgpu: avoid duplicated tmo report on same job
Thread-Index: AQHVBwCBOnzmYyYee0WGkzqcROAC1aZj8yGAgAAbpoCAABFFgIAAI64AgARQ//A=
Date: Mon, 13 May 2019 06:02:27 +0000
Message-ID: <BYAPR12MB3301F003D9E55B3DE929E7AE840F0@BYAPR12MB3301.namprd12.prod.outlook.com>
References: <1557472668-12462-1-git-send-email-Monk.Liu@amd.com>
 <DM6PR12MB3305DCE921FE18B7C909C3C5840C0@DM6PR12MB3305.namprd12.prod.outlook.com>
 <c1c9ec0a-6d11-849b-80a3-5d0d35b06dcd@amd.com>
 <DM6PR12MB3305BCB914F1A80B99AFC6CD840C0@DM6PR12MB3305.namprd12.prod.outlook.com>
 <2b8853fc-23ca-a766-275f-ec1706e86c16@amd.com>
In-Reply-To: <2b8853fc-23ca-a766-275f-ec1706e86c16@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50d41ac7-51ca-4c37-ecae-08d6d7689394
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3590; 
x-ms-traffictypediagnostic: BYAPR12MB3590:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BYAPR12MB3590C243A85A820393C0C000840F0@BYAPR12MB3590.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:854;
x-forefront-prvs: 0036736630
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(136003)(366004)(396003)(376002)(39860400002)(13464003)(189003)(199004)(966005)(66066001)(72206003)(6116002)(68736007)(33656002)(3846002)(6436002)(305945005)(6246003)(7736002)(186003)(53936002)(478600001)(26005)(486006)(74316002)(446003)(55016002)(6306002)(11346002)(476003)(9686003)(5660300002)(7696005)(99286004)(316002)(25786009)(110136005)(8936002)(6506007)(53546011)(76176011)(102836004)(71190400001)(71200400001)(73956011)(256004)(8676002)(81156014)(86362001)(66946007)(229853002)(81166006)(14444005)(2501003)(2906002)(52536014)(14454004)(76116006)(64756008)(66446008)(66476007)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3590;
 H:BYAPR12MB3301.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2aS4hhR1wl7VIRyTzE7QtjxJV1ya2JVMRTXKC2PGUAK9NuZ2ZDO2UPC4xHPXgkQx+M4l1jRP9Cufsafa9IjDh+F3PspEPn/pyQJqRTkbN79qQDUO2e1DxvU4WNpPHKaT1855psnV67Xgkxygtn8QeA/znJnkeEB3GgC/iKvFimYHI0pSSkBMz6fZICkwQKBvVFdwhTST3ZP35W9qfGd4BBwb9xz4Kde31I8xojAhPSti/NzwntP1jJei4MksZDgoyUj4ndgnXoyb879MJ/f0Atp2oIFZOyA33p1ARknEg69H6ILk2mezGiFqa8qwgLObnYakJ+NDzf40XodyldbNh584NqWD2MAQ8RAQ39bAGV2Ztq0hTLqTFlI78TPiraLc8/Iqp0ytdOYtfbA1DkfnDUaQAGLUIWk5AoPRKkuOhJA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50d41ac7-51ca-4c37-ecae-08d6d7689394
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2019 06:02:27.0955 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3590
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hOFd+c1v2PcIk6UZXt6mAYo9hnVnrnxN6fH14Ggzm4M=;
 b=Oz18egK0VIXHP5KFASuuVkp9tJlue2d45SBtGAv9/miXV43pYAei2MkJstl7NLq8Oo5X5LK4HsLWyqZCqQw15FPQsE/P/TMYE9o/xXHsoDcBQUiuL7vVSDuFh9NwTeyYDeKX1B13Hc6X0IA8GvsDn4O2/PGZm1Z6MWvGDQHwW1I=
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

SSB0aGluayBpdCdzIGEgbmVhdCBhcHByb2FjaCwgdGhhbmtzICENCg0KL01vbmsNCg0KLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEtvZW5pZywgQ2hyaXN0aWFuIA0KU2VudDogRnJp
ZGF5LCBNYXkgMTAsIDIwMTkgODowNyBQTQ0KVG86IExpdSwgTW9uayA8TW9uay5MaXVAYW1kLmNv
bT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpTdWJqZWN0OiBSZTogW1BBVENIXSBk
cm0vYW1kZ3B1OiBhdm9pZCBkdXBsaWNhdGVkIHRtbyByZXBvcnQgb24gc2FtZSBqb2INCg0KWWVh
aCwgdGhhdCdzIGluZGVlZCBhIGJpdCBwcm9ibGVtYXRpYy4gSG93IGFib3V0IGNhbGxpbmcNCmRy
bV9zY2hlZF9zdXNwZW5kX3RpbWVvdXQoKSB0aGVuPw0KDQpPbiB0aGUgb3RoZXIgaGFuZCBqdXN0
IHN1cHByZXNzaW5nIHRoZSBsb2dnaW5nIGlzIGZpbmUgd2l0aCBtZSBhcyB3ZWxsLg0KDQpDaHJp
c3RpYW4uDQoNCkFtIDEwLjA1LjE5IHVtIDEyOjAxIHNjaHJpZWIgTGl1LCBNb25rOg0KPiBDaHJp
c3RpYW4sDQo+DQo+IFdvdWxkIHlvdXIgYXBwcm9hY2ggbGVhdmUgdGhlIGdsb2JhbCBxdWV1ZSAo
d2hpY2ggaG9sZHMgVERSIHdvcmspIHN0dWNrIHRoZXJlIGFuZCBvdGhlciB3b3JrIGl0ZW0gbmV2
ZXIgZ2V0IGhhbmRsZWQgPw0KPg0KPiAvTW9uaw0KPg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiBGcm9tOiBLb2VuaWcsIENocmlzdGlhbg0KPiBTZW50OiBGcmlkYXksIE1heSAxMCwg
MjAxOSA0OjU4IFBNDQo+IFRvOiBMaXUsIE1vbmsgPE1vbmsuTGl1QGFtZC5jb20+OyBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vYW1kZ3B1
OiBhdm9pZCBkdXBsaWNhdGVkIHRtbyByZXBvcnQgb24gc2FtZSANCj4gam9iDQo+DQo+IEhpIE1v
bmssDQo+DQo+IHllYWgsIHRoYXQncyBtdWNoIGNsb3NlciB0byB3aGF0IEkgaGFkIGluIG1pbmQu
IEJ1dCB5b3VyIGNvbW1lbnRzIGdvdCBtZSB0aGlua2luZyBtb3JlIGFib3V0IHRoaXMuDQo+DQo+
IFdoYXQgZG8geW91IHRoaW5rIGFib3V0IGNoYW5naW5nIGFtZGdwdV9qb2JfdGltZWRvdXQoKSBs
aWtlIHRoaXM6DQo+ICAgwqDCoMKgwqDCoMKgwqAgaWYgKGFtZGdwdV9kZXZpY2Vfc2hvdWxkX3Jl
Y292ZXJfZ3B1KHJpbmctPmFkZXYpKQ0KPiAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBhbWRncHVfZGV2aWNlX2dwdV9yZWNvdmVyKHJpbmctPmFkZXYsIGpvYik7DQo+ICvCoMKgwqDC
oCBlbHNlDQo+ICvCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCBkbWFfZmVuY2Vfd2FpdChzX2pvYi0+
c19mZW5jZS0+cGFyZW50KTsNCj4NCj4NCj4gVGhpcyB3YXkgd2Ugd291bGQgYmxvY2sgdGhlIHRp
bWVvdXQgd29ya2VyIHVudGlsIHdlIGFyZSBlaXRoZXIgbWFudWFsbHkgcmVzZXR0aW5nIHVzaW5n
IGRlYnVnZnMgb3IgdW5sb2FkaW5nIHRoZSBkcml2ZXIuDQo+DQo+IFJlZ2FyZHMsDQo+IENocmlz
dGlhbi4NCj4NCj4gQW0gMTAuMDUuMTkgdW0gMDk6MTkgc2NocmllYiBMaXUsIE1vbms6DQo+PiBI
aSBDaHJpc3RpYW4sDQo+Pg0KPj4gV2hhdCBhYm91dCB0aGlzIG9uZSwgbm8gdGltZXIgbG9naWMg
Y2hhbmdlIG9uIHNjaGVkdWxlciBwYXJ0LCBvbmx5IA0KPj4gdGhlIGR1cGxpY2F0ZWQgdG1vIHJl
cG9ydCBpcyBtdXRlZA0KPj4NCj4+IC9Nb25rDQo+Pg0KPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4+IEZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3Rv
cC5vcmc+IE9uIEJlaGFsZiBPZiANCj4+IE1vbmsgTGl1DQo+PiBTZW50OiBGcmlkYXksIE1heSAx
MCwgMjAxOSAzOjE4IFBNDQo+PiBUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+
IENjOiBMaXUsIE1vbmsgPE1vbmsuTGl1QGFtZC5jb20+DQo+PiBTdWJqZWN0OiBbUEFUQ0hdIGRy
bS9hbWRncHU6IGF2b2lkIGR1cGxpY2F0ZWQgdG1vIHJlcG9ydCBvbiBzYW1lIGpvYg0KPj4NCj4+
IFtDQVVUSU9OOiBFeHRlcm5hbCBFbWFpbF0NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBNb25rIExp
dSA8TW9uay5MaXVAYW1kLmNvbT4NCj4+IC0tLQ0KPj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2RldmljZS5jIHwgIDMgKy0tDQo+PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfam9iLmMgICAgfCAxMiArKysrKysrKysrKy0NCj4+ICAgIGluY2x1ZGUv
ZHJtL2dwdV9zY2hlZHVsZXIuaCAgICAgICAgICAgICAgICB8ICAxICsNCj4+ICAgIDMgZmlsZXMg
Y2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQo+PiBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYw0KPj4gaW5kZXggZDYyODZl
ZC4uZjFkYzBiYSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kZXZpY2UuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2RldmljZS5jDQo+PiBAQCAtMzM1Niw4ICszMzU2LDcgQEAgYm9vbCBhbWRncHVfZGV2aWNlX3No
b3VsZF9yZWNvdmVyX2dwdShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4+ICAgICAgICAg
ICByZXR1cm4gdHJ1ZTsNCj4+DQo+PiAgICBkaXNhYmxlZDoNCj4+IC0gICAgICAgICAgICAgICBE
Uk1fSU5GTygiR1BVIHJlY292ZXJ5IGRpc2FibGVkLlxuIik7DQo+PiAtICAgICAgICAgICAgICAg
cmV0dXJuIGZhbHNlOw0KPj4gKyAgICAgICByZXR1cm4gZmFsc2U7DQo+PiAgICB9DQo+Pg0KPj4N
Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmMN
Cj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5jDQo+PiBpbmRleCAx
Mzk3OTQyLi5jYTYyMjUzIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2pvYi5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfam9iLmMNCj4+IEBAIC0zMyw2ICszMyw3IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9qb2JfdGlt
ZWRvdXQoc3RydWN0IGRybV9zY2hlZF9qb2IgKnNfam9iKQ0KPj4gICAgICAgICAgIHN0cnVjdCBh
bWRncHVfcmluZyAqcmluZyA9IHRvX2FtZGdwdV9yaW5nKHNfam9iLT5zY2hlZCk7DQo+PiAgICAg
ICAgICAgc3RydWN0IGFtZGdwdV9qb2IgKmpvYiA9IHRvX2FtZGdwdV9qb2Ioc19qb2IpOw0KPj4g
ICAgICAgICAgIHN0cnVjdCBhbWRncHVfdGFza19pbmZvIHRpOw0KPj4gKyAgICAgICBib29sIHJl
Y292ZXI7DQo+Pg0KPj4gICAgICAgICAgIG1lbXNldCgmdGksIDAsIHNpemVvZihzdHJ1Y3QgYW1k
Z3B1X3Rhc2tfaW5mbykpOw0KPj4NCj4+IEBAIC00Miw2ICs0MywxMSBAQCBzdGF0aWMgdm9pZCBh
bWRncHVfam9iX3RpbWVkb3V0KHN0cnVjdCBkcm1fc2NoZWRfam9iICpzX2pvYikNCj4+ICAgICAg
ICAgICAgICAgICAgIHJldHVybjsNCj4+ICAgICAgICAgICB9DQo+Pg0KPj4gKyAgICAgICByZWNv
dmVyID0gYW1kZ3B1X2RldmljZV9zaG91bGRfcmVjb3Zlcl9ncHUocmluZy0+YWRldik7DQo+PiAr
ICAgICAgIGlmIChzX2pvYi0+c2NoZWQtPmxhc3RfdG1vX2lkID09IHNfam9iLT5pZCkNCj4+ICsg
ICAgICAgICAgICAgICBnb3RvIHNraXBfcmVwb3J0Ow0KPj4gKw0KPj4gKyAgICAgICBzX2pvYi0+
c2NoZWQtPmxhc3RfdG1vX2lkID0gc19qb2ItPmlkOw0KPj4gICAgICAgICAgIGFtZGdwdV92bV9n
ZXRfdGFza19pbmZvKHJpbmctPmFkZXYsIGpvYi0+cGFzaWQsICZ0aSk7DQo+PiAgICAgICAgICAg
RFJNX0VSUk9SKCJyaW5nICVzIHRpbWVvdXQsIHNpZ25hbGVkIHNlcT0ldSwgZW1pdHRlZCBzZXE9
JXVcbiIsDQo+PiAgICAgICAgICAgICAgICAgICAgIGpvYi0+YmFzZS5zY2hlZC0+bmFtZSwgDQo+
PiBhdG9taWNfcmVhZCgmcmluZy0+ZmVuY2VfZHJ2Lmxhc3Rfc2VxKSwNCj4+IEBAIC00OSw3ICs1
NSwxMSBAQCBzdGF0aWMgdm9pZCBhbWRncHVfam9iX3RpbWVkb3V0KHN0cnVjdCBkcm1fc2NoZWRf
am9iICpzX2pvYikNCj4+ICAgICAgICAgICBEUk1fRVJST1IoIlByb2Nlc3MgaW5mb3JtYXRpb246
IHByb2Nlc3MgJXMgcGlkICVkIHRocmVhZCAlcyBwaWQgJWRcbiIsDQo+PiAgICAgICAgICAgICAg
ICAgICAgIHRpLnByb2Nlc3NfbmFtZSwgdGkudGdpZCwgdGkudGFza19uYW1lLCB0aS5waWQpOw0K
Pj4NCj4+IC0gICAgICAgaWYgKGFtZGdwdV9kZXZpY2Vfc2hvdWxkX3JlY292ZXJfZ3B1KHJpbmct
PmFkZXYpKQ0KPj4gKyAgICAgICBpZiAoIXJlY292ZXIpDQo+PiArICAgICAgICAgICAgICAgRFJN
X0lORk8oIkdQVSByZWNvdmVyeSBkaXNhYmxlZC5cbiIpOw0KPj4gKw0KPj4gK3NraXBfcmVwb3J0
Og0KPj4gKyAgICAgICBpZiAocmVjb3ZlcikNCj4+ICAgICAgICAgICAgICAgICAgIGFtZGdwdV9k
ZXZpY2VfZ3B1X3JlY292ZXIocmluZy0+YWRldiwgam9iKTsgIH0NCj4+DQo+PiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9kcm0vZ3B1X3NjaGVkdWxlci5oIA0KPj4gYi9pbmNsdWRlL2RybS9ncHVfc2No
ZWR1bGVyLmggaW5kZXggOWMyYTk1Ny4uMTk0NGQyNyAxMDA2NDQNCj4+IC0tLSBhL2luY2x1ZGUv
ZHJtL2dwdV9zY2hlZHVsZXIuaA0KPj4gKysrIGIvaW5jbHVkZS9kcm0vZ3B1X3NjaGVkdWxlci5o
DQo+PiBAQCAtMjgyLDYgKzI4Miw3IEBAIHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciB7DQo+PiAg
ICAgICAgICAgaW50ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBoYW5nX2xpbWl0Ow0KPj4g
ICAgICAgICAgIGF0b21pY190ICAgICAgICAgICAgICAgICAgICAgICAgbnVtX2pvYnM7DQo+PiAg
ICAgICAgICAgYm9vbCAgICAgICAgICAgICAgICAgICAgcmVhZHk7DQo+PiArICAgICAgIHVpbnQ2
NF90IGxhc3RfdG1vX2lkOw0KPj4gICAgfTsNCj4+DQo+PiAgICBpbnQgZHJtX3NjaGVkX2luaXQo
c3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICpzY2hlZCwNCj4+IC0tDQo+PiAyLjcuNA0KPj4NCj4+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+PiBhbWQt
Z2Z4IG1haWxpbmcgbGlzdA0KPj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
