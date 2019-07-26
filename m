Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9328F75EB3
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jul 2019 08:02:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF6FF6E885;
	Fri, 26 Jul 2019 06:02:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700054.outbound.protection.outlook.com [40.107.70.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C106E885
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 06:02:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pm2Gt7Dt1tEHuS1T+1fItli9oPO+tWjWbtLodB1NpApIcVmoL+TUL/YAC/P8HezB+7RHvLHbm+Jge/SvCHfOmwvqIh/SEjuf6VaVAnEPn+YNT2fvY1IjvzHsbXeU00KYCt5QEeTItLVPvyIzwxz66INEpWUFzJx9upE49ramXlxSOxIGewUeOn0ZYb+8Z9hTm5yJEIJb5pcisL26Q7ROH3oGmjHTJkpCQ4tfFIxZ08ekmCgQSlkfG0oOTsS48olQiR5bzq22zgtG/6EneHQiGBvy+6ycCckuKQnhI1esuKAuN5u02awtb9Q6IQXEborKE8DoPmLcJouZzp60qgChdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x84l1DLsSKYqPXmYPbxtxj7Nr7ANAyNkEqE10XSxQ+s=;
 b=g38aoKoSz2QAt4Gn6kMZJx8+dS/qwAZe0Xw/EBypz501YrZ9t78lWAQiALdqkifpzEI30w5cBFmkNFkdryORAs1eBikbhENhDOTMByukvM9BHkGssnFTyAY9w6Tbli9l1YD/5M/9EGTHmeBVx3Y4gkUp14DJlrgNRXPkh8qGYXxJwur2HWKyBwKIUifVP6PK76SMMnMUX8so9+8LUO8PSPaacov0PdWYTGt3NrUsgvAVZpxTeRM/ptFo2WZDNzveusWYh9TSpRudRrniI0u/828ElwDfVr+BhSmd5qLo4He5rppYU5TPqMf9dxLsfVd9+8xpZHkdpLaBbBGOZTg/MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3070.namprd12.prod.outlook.com (20.178.240.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Fri, 26 Jul 2019 06:02:08 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::bd9b:19ce:ef42:ab26]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::bd9b:19ce:ef42:ab26%7]) with mapi id 15.20.2115.005; Fri, 26 Jul 2019
 06:02:08 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 11/11] drm/amdgpu: put the SMC into the proper state on
 reset/unload
Thread-Topic: [PATCH 11/11] drm/amdgpu: put the SMC into the proper state on
 reset/unload
Thread-Index: AQHVQ2FTbA4pK+s5kESmbZRh83QtHqbcZ0pw
Date: Fri, 26 Jul 2019 06:02:08 +0000
Message-ID: <MN2PR12MB33443691211DC67DFF24A81AE4C00@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190726032146.3187-1-alexander.deucher@amd.com>
 <20190726032146.3187-11-alexander.deucher@amd.com>
In-Reply-To: <20190726032146.3187-11-alexander.deucher@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 17918e9b-f8e1-441c-d773-08d7118ecafd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3070; 
x-ms-traffictypediagnostic: MN2PR12MB3070:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB30705A66B80732EFE07D4CFBE4C00@MN2PR12MB3070.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(199004)(189003)(13464003)(102836004)(55016002)(66556008)(64756008)(2906002)(66476007)(5660300002)(66946007)(186003)(76176011)(9686003)(66446008)(6436002)(6506007)(229853002)(14454004)(7696005)(476003)(68736007)(52536014)(486006)(76116006)(4326008)(53936002)(8676002)(110136005)(8936002)(478600001)(74316002)(6116002)(3846002)(6306002)(305945005)(71190400001)(2501003)(81166006)(11346002)(66066001)(256004)(53546011)(71200400001)(7736002)(26005)(316002)(25786009)(33656002)(86362001)(81156014)(99286004)(14444005)(6246003)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3070;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: joGjg3m6S+PO2NMLlj4OpwOELWcpTDm9JsAuBoDIFr4hnHzGFChoYUtRlaqwuJpeCFEjGcSv+xaPL2liogw8UlG6XC+Vo/uc3vksC97ZHt/QlNNGuz3imyIzQwkCZwUGhJPBUifhvzc8guCqPiKyyKLWh9n1cS/uDVMQCLNA5JajXf2xSkowi9dDdlqnzKMV0RTzemQPFX2C3QyUJWw3k8jPK+uLzVOnXy7pKy3VrkwrYNMlXd8LjXMON0z3rQrkKEMw292Cd0svQ4qOcFRr0XBw45A5+WIpLm6Vi4omgiSQHffouffz6A/8MP50jSAeY7s0P6utnU0Hqh619L2XYhXyGM9PjL6zoUguVHzAkZOt+AqF1T79hesJaumWojyS0bNfPgV/5M15E7C6xDXQsQV7jppo0nIzURKwYKo6VyI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17918e9b-f8e1-441c-d773-08d7118ecafd
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 06:02:08.2607 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3070
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x84l1DLsSKYqPXmYPbxtxj7Nr7ANAyNkEqE10XSxQ+s=;
 b=kcIoEpOMkFUcA4HXRlH90biQx/vxy52fsWx7XUPFFHjT0L7JfuGpZOODyYb9n1lPljJ3vgNbRYjdYXKCZ71opNLnOuZjDHlnAcuMj0XSkdbESlDKvdK9FjSQ5b8S1eaORxW6X4pHOOOsN9rPnP7kXsQ0ryQItOZVLGJbeDvAT9g=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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

SSB0aGluayBpdCdzIE9LIHRvIGxlYXZlIHRoZSBTMyBhbmQgQkFDTyBhcyB0aGV5IHdlcmUgZm9y
IG5vdy4NClNlcmllcyBpcyByZXZpZXdlZC1ieSBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29t
Pg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGFtZC1nZnggPGFtZC1n
ZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBBbGV4DQo+IERl
dWNoZXINCj4gU2VudDogRnJpZGF5LCBKdWx5IDI2LCAyMDE5IDExOjIyIEFNDQo+IFRvOiBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4
YW5kZXIuRGV1Y2hlckBhbWQuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggMTEvMTFdIGRybS9hbWRn
cHU6IHB1dCB0aGUgU01DIGludG8gdGhlIHByb3BlciBzdGF0ZSBvbg0KPiByZXNldC91bmxvYWQN
Cj4gDQo+IFdoZW4gZG9pbmcgYSBHUFUgcmVzZXQgb3IgdW5sb2FkaW5nIHRoZSBkcml2ZXIsIHdl
IG5lZWQgdG8gcHV0IHRoZSBTTVUNCj4gaW50byB0aGUgYXBwcnByaWF0ZSBzdGF0ZSBmb3IgdGhl
IHJlLWluaXQgYWZ0ZXIgdGhlIHJlc2V0IG9yIHVubG9hZCB0byByZWxpYWJseQ0KPiB3b3JrLg0K
PiANCj4gSSBkb24ndCB0aGluayB0aGlzIGlzIG5lY2Vzc2FyeSBmb3IgQkFDTyBiZWNhdXNlIHRo
ZSBTTVUgYWN0dWFsbHkgY29udHJvbHMgdGhlDQo+IEJBQ08gc3RhdGUgdG8gaXQgbmVlZHMgdG8g
YmUgYWN0aXZlLg0KPiANCj4gRm9yIHN1c3BlbmQgKFMzKSwgdGhlIGFzaWMgaXMgcHV0IGludG8g
RDMgc28gdGhlIFNNVSB3b3VsZCBiZSBwb3dlcmVkIGRvd24NCj4gc28gSSBkb24ndCB0aGluayB3
ZSBuZWVkIHRvIHB1dCB0aGUgU01VIGludG8gYW55IHNwZWNpYWwgc3RhdGUuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQo+IC0t
LQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmggICAgICAgIHwgIDEgKw0K
PiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIHwgMjcNCj4gKysr
KysrKysrKysrKysrKysrKysrKw0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2Rydi5jICAgIHwgIDIgKysNCj4gIDMgZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oDQo+
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgNCj4gaW5kZXggZTY2MTQxN2Jh
OWRkLi4xMjFjYzU1NDRiMmIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdS5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5o
DQo+IEBAIC05OTMsNiArOTkzLDcgQEAgc3RydWN0IGFtZGdwdV9kZXZpY2Ugew0KPiAgCS8qIHJl
Y29yZCBsYXN0IG1tIGluZGV4IGJlaW5nIHdyaXR0ZW4gdGhyb3VnaCBXUkVHMzIqLw0KPiAgCXVu
c2lnbmVkIGxvbmcgbGFzdF9tbV9pbmRleDsNCj4gIAlib29sICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGluX2dwdV9yZXNldDsNCj4gKwllbnVtIHBwX21wMV9zdGF0ZSAgICAgICAgICAgICAg
IG1wMV9zdGF0ZTsNCj4gIAlzdHJ1Y3QgbXV0ZXggIGxvY2tfcmVzZXQ7DQo+ICAJc3RydWN0IGFt
ZGdwdV9kb29yYmVsbF9pbmRleCBkb29yYmVsbF9pbmRleDsNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMNCj4gYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMNCj4gaW5kZXggNDQyNWZmMDZlY2M0Li4x
MjdlZDAxZWQ4ZmQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kZXZpY2UuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZGV2aWNlLmMNCj4gQEAgLTIxNzQsNiArMjE3NCwyMSBAQCBzdGF0aWMgaW50DQo+IGFtZGdwdV9k
ZXZpY2VfaXBfc3VzcGVuZF9waGFzZTIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+ICAJ
CQlEUk1fRVJST1IoInN1c3BlbmQgb2YgSVAgYmxvY2sgPCVzPiBmYWlsZWQgJWRcbiIsDQo+ICAJ
CQkJICBhZGV2LT5pcF9ibG9ja3NbaV0udmVyc2lvbi0+ZnVuY3MtPm5hbWUsDQo+IHIpOw0KPiAg
CQl9DQo+ICsJCS8qIGhhbmRsZSBwdXR0aW5nIHRoZSBTTUMgaW4gdGhlIGFwcHJvcHJpYXRlIHN0
YXRlICovDQo+ICsJCWlmIChhZGV2LT5pcF9ibG9ja3NbaV0udmVyc2lvbi0+dHlwZSA9PQ0KPiBB
TURfSVBfQkxPQ0tfVFlQRV9TTUMpIHsNCj4gKwkJCWlmIChpc19zdXBwb3J0X3N3X3NtdShhZGV2
KSkgew0KPiArCQkJCS8qIHRvZG8gKi8NCj4gKwkJCX0gZWxzZSBpZiAoYWRldi0+cG93ZXJwbGF5
LnBwX2Z1bmNzICYmDQo+ICsJCQkJICAgYWRldi0+cG93ZXJwbGF5LnBwX2Z1bmNzLQ0KPiA+c2V0
X21wMV9zdGF0ZSkgew0KPiArCQkJCXIgPSBhZGV2LT5wb3dlcnBsYXkucHBfZnVuY3MtDQo+ID5z
ZXRfbXAxX3N0YXRlKA0KPiArCQkJCQlhZGV2LT5wb3dlcnBsYXkucHBfaGFuZGxlLA0KPiArCQkJ
CQlhZGV2LT5tcDFfc3RhdGUpOw0KPiArCQkJCWlmIChyKSB7DQo+ICsJCQkJCURSTV9FUlJPUigi
U01DIGZhaWxlZCB0byBzZXQgbXAxDQo+IHN0YXRlICVkLCAlZFxuIiwNCj4gKwkJCQkJCSAgYWRl
di0+bXAxX3N0YXRlLCByKTsNCj4gKwkJCQl9DQo+ICsJCQl9DQo+ICsJCX0NCj4gIAl9DQo+IA0K
PiAgCXJldHVybiAwOw0KPiBAQCAtMzYzOSw2ICszNjU0LDE3IEBAIHN0YXRpYyBib29sIGFtZGdw
dV9kZXZpY2VfbG9ja19hZGV2KHN0cnVjdA0KPiBhbWRncHVfZGV2aWNlICphZGV2LCBib29sIHRy
eWxvY2spDQo+IA0KPiAgCWF0b21pY19pbmMoJmFkZXYtPmdwdV9yZXNldF9jb3VudGVyKTsNCj4g
IAlhZGV2LT5pbl9ncHVfcmVzZXQgPSAxOw0KPiArCXN3aXRjaCAoYW1kZ3B1X2FzaWNfcmVzZXRf
bWV0aG9kKGFkZXYpKSB7DQo+ICsJY2FzZSBBTURfUkVTRVRfTUVUSE9EX01PREUxOg0KPiArCQlh
ZGV2LT5tcDFfc3RhdGUgPSBQUF9NUDFfU1RBVEVfU0hVVERPV047DQo+ICsJCWJyZWFrOw0KPiAr
CWNhc2UgQU1EX1JFU0VUX01FVEhPRF9NT0RFMjoNCj4gKwkJYWRldi0+bXAxX3N0YXRlID0gUFBf
TVAxX1NUQVRFX1JFU0VUOw0KPiArCQlicmVhazsNCj4gKwlkZWZhdWx0Og0KPiArCQlhZGV2LT5t
cDFfc3RhdGUgPSBQUF9NUDFfU1RBVEVfTk9ORTsNCj4gKwkJYnJlYWs7DQo+ICsJfQ0KPiAgCS8q
IEJsb2NrIGtmZDogU1JJT1Ygd291bGQgZG8gaXQgc2VwYXJhdGVseSAqLw0KPiAgCWlmICghYW1k
Z3B1X3NyaW92X3ZmKGFkZXYpKQ0KPiAgICAgICAgICAgICAgICAgIGFtZGdwdV9hbWRrZmRfcHJl
X3Jlc2V0KGFkZXYpOyBAQCAtMzY1Miw2ICszNjc4LDcgQEAgc3RhdGljDQo+IHZvaWQgYW1kZ3B1
X2RldmljZV91bmxvY2tfYWRldihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4gIAlpZiAo
IWFtZGdwdV9zcmlvdl92ZihhZGV2KSkNCj4gICAgICAgICAgICAgICAgICBhbWRncHVfYW1ka2Zk
X3Bvc3RfcmVzZXQoYWRldik7DQo+ICAJYW1kZ3B1X3ZmX2Vycm9yX3RyYW5zX2FsbChhZGV2KTsN
Cj4gKwlhZGV2LT5tcDFfc3RhdGUgPSBQUF9NUDFfU1RBVEVfTk9ORTsNCj4gIAlhZGV2LT5pbl9n
cHVfcmVzZXQgPSAwOw0KPiAgCW11dGV4X3VubG9jaygmYWRldi0+bG9ja19yZXNldCk7DQo+ICB9
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMN
Cj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMNCj4gaW5kZXggNDc0
MzgwMTM1N2M1Li44MDBkMGNlYjE0YjQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kcnYuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZHJ2LmMNCj4gQEAgLTEwOTQsNyArMTA5NCw5IEBAIGFtZGdwdV9wY2lfc2h1dGRv
d24oc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+ICAJICogdW5mb3J0dW5hdGVseSB3ZSBjYW4ndCBk
ZXRlY3QgY2VydGFpbg0KPiAgCSAqIGh5cGVydmlzb3JzIHNvIGp1c3QgZG8gdGhpcyBhbGwgdGhl
IHRpbWUuDQo+ICAJICovDQo+ICsJYWRldi0+bXAxX3N0YXRlID0gUFBfTVAxX1NUQVRFX1VOTE9B
RDsNCj4gIAlhbWRncHVfZGV2aWNlX2lwX3N1c3BlbmQoYWRldik7DQo+ICsJYWRldi0+bXAxX3N0
YXRlID0gUFBfTVAxX1NUQVRFX05PTkU7DQo+ICB9DQo+IA0KPiAgc3RhdGljIGludCBhbWRncHVf
cG1vcHNfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+IC0tDQo+IDIuMjAuMQ0KPiANCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gYW1kLWdm
eCBtYWlsaW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
