Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D57BD36312
	for <lists+amd-gfx@lfdr.de>; Wed,  5 Jun 2019 20:03:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E55893DB;
	Wed,  5 Jun 2019 18:03:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710050.outbound.protection.outlook.com [40.107.71.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51283893DB
 for <amd-gfx@lists.freedesktop.org>; Wed,  5 Jun 2019 18:03:54 +0000 (UTC)
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB3271.namprd12.prod.outlook.com (20.179.93.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Wed, 5 Jun 2019 18:03:51 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::e07e:24e5:eb8f:199e]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::e07e:24e5:eb8f:199e%6]) with mapi id 15.20.1943.023; Wed, 5 Jun 2019
 18:03:51 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/display: Use current connector state if NULL when
 checking bpc
Thread-Topic: [PATCH] drm/amd/display: Use current connector state if NULL
 when checking bpc
Thread-Index: AQHVG7yAwn+OnGItLkeRKTTma6WNY6aNUUAAgAAJVIA=
Date: Wed, 5 Jun 2019 18:03:51 +0000
Message-ID: <431afde8-3210-b5b3-b0ec-b8a414ed5026@amd.com>
References: <20190605163359.19422-1-nicholas.kazlauskas@amd.com>
 <BN6PR12MB1809805E1DE3D37B38E23F92F7160@BN6PR12MB1809.namprd12.prod.outlook.com>
In-Reply-To: <BN6PR12MB1809805E1DE3D37B38E23F92F7160@BN6PR12MB1809.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0010.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::23) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef91e91c-f0b2-4ff5-95ac-08d6e9e02a78
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BYAPR12MB3271; 
x-ms-traffictypediagnostic: BYAPR12MB3271:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BYAPR12MB32716457EBDE6DD547F09D9EEC160@BYAPR12MB3271.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(366004)(136003)(376002)(396003)(189003)(199004)(81166006)(6306002)(305945005)(76176011)(99286004)(6512007)(6436002)(386003)(66946007)(446003)(102836004)(2616005)(4326008)(229853002)(66476007)(66556008)(7736002)(11346002)(25786009)(6506007)(73956011)(8936002)(81156014)(53546011)(66446008)(110136005)(54906003)(52116002)(6486002)(8676002)(66066001)(68736007)(64756008)(26005)(316002)(2906002)(486006)(36756003)(6116002)(186003)(3846002)(476003)(31686004)(72206003)(478600001)(966005)(5660300002)(14454004)(2501003)(53936002)(6246003)(86362001)(256004)(71200400001)(31696002)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3271;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mrruJ2SWVWMiQ/NHsKIlPJoWKOxkGuGyhyvRTft/8DvsQTp/6YFPWvBBCbWtuRe1KoYAQ68CmkPErEzf5JXw4aLMRBD9ZazUvYXTg2/q0ltiT+T7s/0Pr7V++ldpiHCit6Pyobn7eAWz94LfgWfKXF23RuZjpsRcusaJX0wI45FCIrNbpxIMUIPWT67NSIRH3xhH2xOKd+takuVjhYRuAT46yGPleEOl4Y7mtOl/niL5MpbIgZ1duPwopFobLVhOZ9xR6GM/S9P0V4XqWCLB878UPdUgJh+AOHZTvjsKV0SDMQc7pEzrxPKtfHn+qknUlO96QUmZ84oG7QGxRDwXL+hO9PER+BoxnqYpHtMt1rP02fHqTTATcn08dHmwuQjMZcXfmyI+jnSuDO+myPfXRefoKug1t1XlEn6vTlUQXo0=
Content-ID: <C69A557C1D97E14A8E54564E34F9AF50@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef91e91c-f0b2-4ff5-95ac-08d6e9e02a78
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 18:03:51.7713 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nkazlaus@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3271
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqPm+ZG4/ps6DA2G5W7pCxlgnbxdkRDQIBDIlAQV6p4=;
 b=XWhztMkKAigaVAoOrzWSgQngFTA5Axhqdy5MoRxx6XyK9phA/LyEtl4Bye/i2n6j7faAblZbA+ekntPHfw0QuuC296jseDE3xytVb8VLMliUHPh/7DgJ8qZnlV6d8Vl2YkT3lHl4g9lxLMvfmEKps56Crwegey1d/++Jm0Z8oWg=
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gNi81LzE5IDE6MzAgUE0sIERldWNoZXIsIEFsZXhhbmRlciB3cm90ZToNCj4gTWF5YmUgYWRk
IGEgcmVmZXJlbmNlIHRvIHRoZSBidWcgcmVwb3J0Pw0KPiBBY2tlZC1ieTogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KDQpPaCByaWdodCwgSSBjYW4gYWRkIHRoZSBi
dWd6aWxsYSB3aGVuIHRoaXMgZ2V0cyByZXZpZXdlZCBhbmQgSSBwdXNoLiBUaGFua3MhDQoNCk5p
Y2hvbGFzIEthemxhdXNrYXMNCg0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gKkZyb206KiBhbWQtZ2Z4
IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBvbiBiZWhhbGYgb2YgDQo+
IE5pY2hvbGFzIEthemxhdXNrYXMgPG5pY2hvbGFzLmthemxhdXNrYXNAYW1kLmNvbT4NCj4gKlNl
bnQ6KiBXZWRuZXNkYXksIEp1bmUgNSwgMjAxOSAxMjozMyBQTQ0KPiAqVG86KiBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KPiAqQ2M6KiBMaSwgU3VuIHBlbmcgKExlbyk7IFdlbnRsYW5k
LCBIYXJyeTsgS2F6bGF1c2thcywgTmljaG9sYXMNCj4gKlN1YmplY3Q6KiBbUEFUQ0hdIGRybS9h
bWQvZGlzcGxheTogVXNlIGN1cnJlbnQgY29ubmVjdG9yIHN0YXRlIGlmIE5VTEwgDQo+IHdoZW4g
Y2hlY2tpbmcgYnBjDQo+IFtXaHldDQo+IFRoZSBvbGQgbG9naWMgZm9yIGNoZWNraW5nIHdoaWNo
IG91dHB1dCBkZXB0aCB0byB1c2UgcmVsaWVkIG9uIHVzaW5nDQo+IHRoZSBjdXJyZW50IGNvbm5l
Y3RvciBzdGF0ZSByYXRoZXIgdGhhbiB0aGUgbmV3IHByb3Bvc2VkIHN0YXRlLiBUaGlzDQo+IHdh
cyBhIHByb2JsZW0gd2hlbiBwZXJmb3JtaW5nIGF0b21pYyBjb21taXRzIHNpbmNlIHdlIHdlcmVu
J3QgdmVyaWZ5aW5nDQo+IGl0IGFnYWluc3QgdGhlIGluY29taW5nIG1heF9yZXF1ZXN0ZWRfYnBj
Lg0KPiANCj4gQnV0IHN3aXRjaGluZyB0aGlzIHRvIG9ubHkgdXNlIHRoZSBuZXcgc3RhdGUgYW5k
IG5vdCB0aGUgY3VycmVudCBzdGF0ZQ0KPiBicmVha3MgZmlsdGVyaW5nIG1vZGVzIC0gaXQnbGwg
YWx3YXlzIGFzc3VtZSB0aGF0IHRoZSBtYXhpbXVtIGJwYw0KPiBzdXBwb3J0ZWQgYnkgdGhlIGRp
c3BsYXkgaXMgaW4gdXNlLCB3aGljaCB3aWxsIGNhdXNlIGNlcnRhaW4gbW9kZXMNCj4gbGlrZSAx
NDQwcEAxNDRIeiB0byBiZSBmaWx0ZXJlZCBldmVuIHdoZW4gdXNpbmcgOGJwYy4NCj4gDQo+IFtI
b3ddDQo+IFN0aWxsIHVzZSB0aGUgY29ubmVjdG9yLT5zdGF0ZSBpZiB3ZSBhcmVuJ3QgcGFzc2Vk
IGFuIGV4cGxpY2l0IHN0YXRlLg0KPiBUaGlzIHdpbGwgcmVzcGVjdCB0aGUgbWF4X2JwYyB0aGUg
dXNlciBjdXJyZW50bHkgaGFzIHdoZW4gZmlsdGVyaW5nDQo+IG1vZGVzLg0KPiANCj4gQWxzbyBy
ZW1lbWJlciB0byByZXNldCB0aGUgZGVmYXVsdCBtYXhfcmVxdWVzdGVkX2JwYyB0byA4IHdoZW5l
dmVyDQo+IGNvbm5lY3RvciByZXNldCBpcyBjYWxsZWQgdG8gcmV0YWluIG9sZCBiZWhhdmlvciB3
aGVuIHVzaW5nIHRoZSBuZXcNCj4gcHJvcGVydHkuDQo+IA0KPiBDYzogSGFycnkgV2VudGxhbmQg
PGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+DQo+IENjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNv
bT4NCj4gU2lnbmVkLW9mZi1ieTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1
c2thc0BhbWQuY29tPg0KPiAtLS0NCj4gIMKgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG0uYyB8IDQgKysrKw0KPiAgwqAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG0uYyANCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbS5jDQo+IGluZGV4IGE2OThjOGYyNzJlZC4uZjYyN2MxN2ExMDM5
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtLmMNCj4gQEAgLTMwNDYsNiArMzA0Niw5IEBAIGNvbnZlcnRfY29sb3JfZGVwdGhf
ZnJvbV9kaXNwbGF5X2luZm8oY29uc3Qgc3RydWN0IA0KPiBkcm1fY29ubmVjdG9yICpjb25uZWN0
b3IsDQo+ICDCoHsNCj4gIMKgwqDCoMKgwqDCoMKgwqAgdWludDMyX3QgYnBjID0gY29ubmVjdG9y
LT5kaXNwbGF5X2luZm8uYnBjOw0KPiANCj4gK8KgwqDCoMKgwqDCoCBpZiAoIXN0YXRlKQ0KPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdGF0ZSA9IGNvbm5lY3Rvci0+c3RhdGU7DQo+
ICsNCj4gIMKgwqDCoMKgwqDCoMKgwqAgaWYgKHN0YXRlKSB7DQo+ICDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBicGMgPSBzdGF0ZS0+bWF4X2JwYzsNCj4gIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC8qIFJvdW5kIGRvd24gdG8gdGhlIG5lYXJlc3QgZXZlbiBudW1i
ZXIuICovDQo+IEBAIC0zODIwLDYgKzM4MjMsNyBAQCB2b2lkIGFtZGdwdV9kbV9jb25uZWN0b3Jf
ZnVuY3NfcmVzZXQoc3RydWN0IA0KPiBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpDQo+ICDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdGF0ZS0+dW5kZXJzY2FuX2VuYWJsZSA9IGZh
bHNlOw0KPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RhdGUtPnVuZGVyc2Nh
bl9oYm9yZGVyID0gMDsNCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0YXRl
LT51bmRlcnNjYW5fdmJvcmRlciA9IDA7DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHN0YXRlLT5iYXNlLm1heF9yZXF1ZXN0ZWRfYnBjID0gODsNCj4gDQo+ICDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBfX2RybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9yZXNldChj
b25uZWN0b3IsIA0KPiAmc3RhdGUtPmJhc2UpOw0KPiAgwqDCoMKgwqDCoMKgwqDCoCB9DQo+IC0t
IA0KPiAyLjE3LjENCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fDQo+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
