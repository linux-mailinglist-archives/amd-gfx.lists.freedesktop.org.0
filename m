Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A35146D1A
	for <lists+amd-gfx@lfdr.de>; Thu, 23 Jan 2020 16:39:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED74C6FD87;
	Thu, 23 Jan 2020 15:39:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11olkn2102.outbound.protection.outlook.com [40.92.18.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B986FD87
 for <amd-gfx@lists.freedesktop.org>; Thu, 23 Jan 2020 15:39:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRefewe6h0l8W+Ze4xVDHDYwPCDgDakWHCuJvXVdlECqo5hHmZPRMQrYdg0WJ+BuDStsL63R4BrzR4713UmE8vyofINnE7XWs8fg5dvs79iIpihnh1SN0/ikNKzg0vgL4I/bbXvYK1iDEjCsU0plIgva9YXcyIKQufc9qVUAwRLASXihULOBIZLXEZMptcUEklHJhKANTdt0jRW6mHaJI56WZiAw2whEvw5mVIl+yz9OwI/mx9f+GQCZhdnPGNFDqZWxUB4iu7GRZfuuYVNE0TKPugP5PQjHVJsAigUcRshtx704R+xyDnnryD33r7lX+l7mJFWTdE5vTDPuEqnpHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=puNkQQseSLiAvY3x2wjJtdGZkJEgoBkdK6b6KCUnMqs=;
 b=TD6BCqtTsytyVRIQZXIQmtLYGN00GqNi/ELUcIBE9BW9jdOBXyb8ONl7iPwvdU3FKqdIPPWYAOHelzCdp+p2e6yv1EHW5JxFxRPRHGpPGSpq0Fw+xRaSZQsmTQoNSnit6TUp5AVR0p/iFDb9y802ZLVLSiytb/T1w6OMlz12GOcIxAAFXDzhotfRHroa7iC0+R6lfGVZXZRBplmCVYPL58JVYDkzfT/329mDb+q+Hd/cNXgb623+UGENRybTGI7jonIlyONi43U4h3kr2CDSxK0zsydO7/lusKYeMQiV2wjuht8vzzLRJ5ORojiWWsTbtZVDnRtkFMjdfs99YpmOCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=puNkQQseSLiAvY3x2wjJtdGZkJEgoBkdK6b6KCUnMqs=;
 b=P6wyrE/taRnQJODJeDESVFYSH6RQOlNCnwRFFrxLuA7VOT2IAy1b20LZoTJL6RpBtT4EecxnV9PZfOoif7Jv2wYION8EWLtXPeIsonhZPAiqBxR+v7qX3ouHn9Mhoh5Z3+klI258v/WsGssFJm4PjJeVKIFPPpQ3d83OnIEvZsoBdk09aG458DRfUTfsRlnYARHOoDP/rkVF7Mg7VxN9DWPkGx9OoSef+4Wg9IuY87u5VpY71q1Q9uh7xXuXy/vA1C8PtyGvkJdpEN+El2C8AiN47G9esd1Cp0v8PWCNCRNPTFMM6ptrPiXsqb0RD40n+ww/Sd8HTQExScfOwT2WbQ==
Received: from DM6NAM11FT049.eop-nam11.prod.protection.outlook.com
 (10.13.172.53) by DM6NAM11HT033.eop-nam11.prod.protection.outlook.com
 (10.13.173.190) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.19; Thu, 23 Jan
 2020 15:39:06 +0000
Received: from MW2PR02MB3788.namprd02.prod.outlook.com (10.13.172.59) by
 DM6NAM11FT049.mail.protection.outlook.com (10.13.172.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.19 via Frontend Transport; Thu, 23 Jan 2020 15:39:06 +0000
Received: from MW2PR02MB3788.namprd02.prod.outlook.com
 ([fe80::9165:dafc:39fe:6a5c]) by MW2PR02MB3788.namprd02.prod.outlook.com
 ([fe80::9165:dafc:39fe:6a5c%7]) with mapi id 15.20.2644.027; Thu, 23 Jan 2020
 15:39:06 +0000
Received: from [50.202.157.72] (50.202.157.72) by
 DM5PR20CA0041.namprd20.prod.outlook.com (2603:10b6:3:13d::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.20 via Frontend Transport; Thu, 23 Jan 2020 15:39:04 +0000
From: William Lewis <minutemaidpark@hotmail.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 4/4] drm/amdgpu: rework synchronization of VM updates v3
Thread-Topic: [PATCH 4/4] drm/amdgpu: rework synchronization of VM updates v3
Thread-Index: AQHV0fhquHMy+5ksn0ieVxVK102fv6f4YoSA
Date: Thu, 23 Jan 2020 15:39:05 +0000
Message-ID: <MW2PR02MB3788564AC9B2EB78B1B7BA1BC80F0@MW2PR02MB3788.namprd02.prod.outlook.com>
References: <20200123142122.4084-1-christian.koenig@amd.com>
 <20200123142122.4084-4-christian.koenig@amd.com>
In-Reply-To: <20200123142122.4084-4-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DM5PR20CA0041.namprd20.prod.outlook.com
 (2603:10b6:3:13d::27) To MW2PR02MB3788.namprd02.prod.outlook.com
 (2603:10b6:907:a::22)
x-incomingtopheadermarker: OriginalChecksum:498DE770BAD0A59D7578A2464D1D673290F63C9CA9D583169EF345BDC82CF41E;
 UpperCasedChecksum:C7DD443660737735361605D57F5CC3AAE08F429CCB4A2789122842A62F43F50C;
 SizeAsReceived:7560; Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [7alG4Lb2u4EdQncNoeU/5qZJbncbc2dm]
x-microsoft-original-message-id: <e1e8a82b-436f-ac0b-351a-501ccbe09533@hotmail.com>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: afcf65ba-77a6-4e5f-e420-08d7a01a60d1
x-ms-traffictypediagnostic: DM6NAM11HT033:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 30BFjkNancXQl5ADrivOPz2aP/6qu7bT4AqFANm+wCxO9wRv/ZR1jA7DnRT2Weljrmh4ngnIdbwJY1MY5C2bfFLapHzVjR+D/e08KQWondjaOvqxDMp2cdFLztBVDkdAvDZNiIb9etaQKgCvPF/D9yDK5gtwSKe/+dszZB5IpiYS+FUcE2Q6zGnVdikVpdjB
x-ms-exchange-transport-forked: True
Content-ID: <361B2B4297E8DF46801B330405BCA4D4@namprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: afcf65ba-77a6-4e5f-e420-08d7a01a60d1
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2020 15:39:05.9960 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM11HT033
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

V2FzIHRoZSBjaGFuZ2UgdG8gdHJ1ZSBmcm9tIHRoZSBvbmx5IHVzZSBvZiBpbnRyIGluIA0KYW1k
Z3B1X2JvX3N5bmNfd2FpdF9yZXN2IGludGVudGlvbmFsP8KgIElmIHNvLCB3b3VsZCBpdCBub3Qg
bWFrZSBzZW5zZSB0byANCnJlbW92ZSB0aGUgYXJndW1lbnQgZnJvbSB0aGUgZnVuY3Rpb24gc2ln
bmF0dXJlIHdoaWxlIHRoZSBBUEkgaXMgY2hhbmdpbmc/DQoNCk9uIDEvMjMvMjAgODoyMSBBTSwg
Q2hyaXN0aWFuIEvDtm5pZyB3cm90ZToNCj4gSWYgcHJvdmlkZWQgd2Ugb25seSBzeW5jIHRvIHRo
ZSBCT3MgcmVzZXJ2YXRpb24NCj4gb2JqZWN0IGFuZCBubyBsb25nZXIgdG8gdGhlIHJvb3QgUEQu
DQo+DQo+IHYyOiB1cGRhdGUgY29tbWVudCwgY2xlYW51cCBhbWRncHVfYm9fc3luY193YWl0X3Jl
c3YNCj4gdjM6IHVzZSBjb3JyZWN0IHJlc2VydmF0aW9uIG9iamVjdCB3aGlsZSBjbGVhcmluZw0K
Pg0KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmpl
Y3QuYyAgfCAzNyArKysrKysrKysrKysrKysrKysrKy0tLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuaCAgfCAgMyArKysNCj4gICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfc3luYy5jICAgIHwgIDcgLS0tLS0NCj4gICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyAgICAgIHwgNDEgKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uaCAg
ICAgIHwgIDQgKy0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtX2Nw
dS5jICB8IDIyICsrKystLS0tLS0tLS0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdm1fc2RtYS5jIHwgMTUgKysrLS0tLS0tLS0NCj4gICA3IGZpbGVzIGNoYW5nZWQs
IDY3IGluc2VydGlvbnMoKyksIDYyIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jDQo+IGluZGV4IDQ2Yzc2ZTJlMTI4MS4uYzcwYmJk
ZGEwNzhjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
b2JqZWN0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVj
dC5jDQo+IEBAIC0xNDAzLDMwICsxNDAzLDUxIEBAIHZvaWQgYW1kZ3B1X2JvX2ZlbmNlKHN0cnVj
dCBhbWRncHVfYm8gKmJvLCBzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSwNCj4gICB9DQo+ICAgDQo+
ICAgLyoqDQo+IC0gKiBhbWRncHVfc3luY193YWl0X3Jlc3YgLSBXYWl0IGZvciBCTyByZXNlcnZh
dGlvbiBmZW5jZXMNCj4gKyAqIGFtZGdwdV9ib19zeW5jX3dhaXRfcmVzdiAtIFdhaXQgZm9yIEJP
IHJlc2VydmF0aW9uIGZlbmNlcw0KPiAgICAqDQo+IC0gKiBAYm86IGJ1ZmZlciBvYmplY3QNCj4g
KyAqIEBhZGV2OiBhbWRncHUgZGV2aWNlIHBvaW50ZXINCj4gKyAqIEByZXN2OiByZXNlcnZhdGlv
biBvYmplY3QgdG8gc3luYyB0bw0KPiArICogQHN5bmNfbW9kZTogc3luY2hyb25pemF0aW9uIG1v
ZGUNCj4gICAgKiBAb3duZXI6IGZlbmNlIG93bmVyDQo+ICAgICogQGludHI6IFdoZXRoZXIgdGhl
IHdhaXQgaXMgaW50ZXJydXB0aWJsZQ0KPiAgICAqDQo+ICsgKiBFeHRyYWN0IHRoZSBmZW5jZXMg
ZnJvbSB0aGUgcmVzZXJ2YXRpb24gb2JqZWN0IGFuZCB3YWl0cyBmb3IgdGhlbSB0byBmaW5pc2gu
DQo+ICsgKg0KPiAgICAqIFJldHVybnM6DQo+ICAgICogMCBvbiBzdWNjZXNzLCBlcnJubyBvdGhl
cndpc2UuDQo+ICAgICovDQo+IC1pbnQgYW1kZ3B1X2JvX3N5bmNfd2FpdChzdHJ1Y3QgYW1kZ3B1
X2JvICpibywgdm9pZCAqb3duZXIsIGJvb2wgaW50cikNCj4gK2ludCBhbWRncHVfYm9fc3luY193
YWl0X3Jlc3Yoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHN0cnVjdCBkbWFfcmVzdiAqcmVz
diwNCj4gKwkJCSAgICAgZW51bSBhbWRncHVfc3luY19tb2RlIHN5bmNfbW9kZSwgdm9pZCAqb3du
ZXIsDQo+ICsJCQkgICAgIGJvb2wgaW50cikNCj4gICB7DQo+IC0Jc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYgPSBhbWRncHVfdHRtX2FkZXYoYm8tPnRiby5iZGV2KTsNCj4gICAJc3RydWN0IGFt
ZGdwdV9zeW5jIHN5bmM7DQo+ICAgCWludCByOw0KPiAgIA0KPiAgIAlhbWRncHVfc3luY19jcmVh
dGUoJnN5bmMpOw0KPiAtCWFtZGdwdV9zeW5jX3Jlc3YoYWRldiwgJnN5bmMsIGJvLT50Ym8uYmFz
ZS5yZXN2LA0KPiAtCQkJIEFNREdQVV9TWU5DX05FX09XTkVSLCBvd25lcik7DQo+IC0JciA9IGFt
ZGdwdV9zeW5jX3dhaXQoJnN5bmMsIGludHIpOw0KPiArCWFtZGdwdV9zeW5jX3Jlc3YoYWRldiwg
JnN5bmMsIHJlc3YsIHN5bmNfbW9kZSwgb3duZXIpOw0KPiArCXIgPSBhbWRncHVfc3luY193YWl0
KCZzeW5jLCB0cnVlKTsNCj4gICAJYW1kZ3B1X3N5bmNfZnJlZSgmc3luYyk7DQo+IC0NCj4gICAJ
cmV0dXJuIHI7DQo+ICAgfQ0KPiAgIA0KPiArLyoqDQo+ICsgKiBhbWRncHVfYm9fc3luY193YWl0
IC0gV3JhcHBlciBmb3IgYW1kZ3B1X2JvX3N5bmNfd2FpdF9yZXN2DQo+ICsgKiBAYm86IGJ1ZmZl
ciBvYmplY3QgdG8gd2FpdCBmb3INCj4gKyAqIEBvd25lcjogZmVuY2Ugb3duZXINCj4gKyAqIEBp
bnRyOiBXaGV0aGVyIHRoZSB3YWl0IGlzIGludGVycnVwdGlibGUNCj4gKyAqDQo+ICsgKiBXcmFw
cGVyIHRvIHdhaXQgZm9yIGZlbmNlcyBpbiBhIEJPLg0KPiArICogUmV0dXJuczoNCj4gKyAqIDAg
b24gc3VjY2VzcywgZXJybm8gb3RoZXJ3aXNlLg0KPiArICovDQo+ICtpbnQgYW1kZ3B1X2JvX3N5
bmNfd2FpdChzdHJ1Y3QgYW1kZ3B1X2JvICpibywgdm9pZCAqb3duZXIsIGJvb2wgaW50cikNCj4g
K3sNCj4gKwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IGFtZGdwdV90dG1fYWRldihiby0+
dGJvLmJkZXYpOw0KPiArDQo+ICsJcmV0dXJuIGFtZGdwdV9ib19zeW5jX3dhaXRfcmVzdihhZGV2
LCBiby0+dGJvLmJhc2UucmVzdiwNCj4gKwkJCQkJQU1ER1BVX1NZTkNfTkVfT1dORVIsIG93bmVy
LCBpbnRyKTsNCj4gK30NCj4gKw0KPiAgIC8qKg0KPiAgICAqIGFtZGdwdV9ib19ncHVfb2Zmc2V0
IC0gcmV0dXJuIEdQVSBvZmZzZXQgb2YgYm8NCj4gICAgKiBAYm86CWFtZGdwdSBvYmplY3QgZm9y
IHdoaWNoIHdlIHF1ZXJ5IHRoZSBvZmZzZXQNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9vYmplY3QuaA0KPiBpbmRleCAyZWVhZmM3N2M5YzEuLjk2ZDgwNTg4OWU4ZCAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuaA0KPiBAQCAt
MjgzLDYgKzI4Myw5IEBAIHZvaWQgYW1kZ3B1X2JvX3JlbGVhc2Vfbm90aWZ5KHN0cnVjdCB0dG1f
YnVmZmVyX29iamVjdCAqYm8pOw0KPiAgIGludCBhbWRncHVfYm9fZmF1bHRfcmVzZXJ2ZV9ub3Rp
Znkoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibyk7DQo+ICAgdm9pZCBhbWRncHVfYm9fZmVu
Y2Uoc3RydWN0IGFtZGdwdV9ibyAqYm8sIHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlLA0KPiAgIAkJ
ICAgICBib29sIHNoYXJlZCk7DQo+ICtpbnQgYW1kZ3B1X2JvX3N5bmNfd2FpdF9yZXN2KHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2LCBzdHJ1Y3QgZG1hX3Jlc3YgKnJlc3YsDQo+ICsJCQkgICAg
IGVudW0gYW1kZ3B1X3N5bmNfbW9kZSBzeW5jX21vZGUsIHZvaWQgKm93bmVyLA0KPiArCQkJICAg
ICBib29sIGludHIpOw0KPiAgIGludCBhbWRncHVfYm9fc3luY193YWl0KHN0cnVjdCBhbWRncHVf
Ym8gKmJvLCB2b2lkICpvd25lciwgYm9vbCBpbnRyKTsNCj4gICB1NjQgYW1kZ3B1X2JvX2dwdV9v
ZmZzZXQoc3RydWN0IGFtZGdwdV9ibyAqYm8pOw0KPiAgIGludCBhbWRncHVfYm9fdmFsaWRhdGUo
c3RydWN0IGFtZGdwdV9ibyAqYm8pOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3N5bmMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9zeW5jLmMNCj4gaW5kZXggOWY0MjAzMjY3NmRhLi5iODYzOTIyNTM2OTYgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9zeW5jLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3N5bmMuYw0KPiBAQCAtMjQ5LDEzICsyNDks
NiBAQCBpbnQgYW1kZ3B1X3N5bmNfcmVzdihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgc3Ry
dWN0IGFtZGdwdV9zeW5jICpzeW5jLA0KPiAgIAkJICAgIG93bmVyICE9IEFNREdQVV9GRU5DRV9P
V05FUl9VTkRFRklORUQpDQo+ICAgCQkJY29udGludWU7DQo+ICAgDQo+IC0JCS8qIFZNIHVwZGF0
ZXMgb25seSBzeW5jIHdpdGggbW92ZXMgYnV0IG5vdCB3aXRoIHVzZXINCj4gLQkJICogY29tbWFu
ZCBzdWJtaXNzaW9ucyBvciBLRkQgZXZpY3Rpb25zIGZlbmNlcw0KPiAtCQkgKi8NCj4gLQkJaWYg
KGZlbmNlX293bmVyICE9IEFNREdQVV9GRU5DRV9PV05FUl9VTkRFRklORUQgJiYNCj4gLQkJICAg
IG93bmVyID09IEFNREdQVV9GRU5DRV9PV05FUl9WTSkNCj4gLQkJCWNvbnRpbnVlOw0KPiAtDQo+
ICAgCQkvKiBJZ25vcmUgZmVuY2VzIGRlcGVuZGluZyBvbiB0aGUgc3luYyBtb2RlICovDQo+ICAg
CQlzd2l0Y2ggKG1vZGUpIHsNCj4gICAJCWNhc2UgQU1ER1BVX1NZTkNfQUxXQVlTOg0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYw0KPiBpbmRleCAwZjc5YzE3MTE4YmYuLmMy
NjhhYTE0MzgxZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3ZtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMN
Cj4gQEAgLTc5Nyw3ICs3OTcsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV92bV9jbGVhcl9ibyhzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gICAJcGFyYW1zLnZtID0gdm07DQo+ICAgCXBhcmFt
cy5kaXJlY3QgPSBkaXJlY3Q7DQo+ICAgDQo+IC0JciA9IHZtLT51cGRhdGVfZnVuY3MtPnByZXBh
cmUoJnBhcmFtcywgQU1ER1BVX0ZFTkNFX09XTkVSX0tGRCwgTlVMTCk7DQo+ICsJciA9IHZtLT51
cGRhdGVfZnVuY3MtPnByZXBhcmUoJnBhcmFtcywgTlVMTCwgQU1ER1BVX1NZTkNfRVhQTElDSVQp
Ow0KPiAgIAlpZiAocikNCj4gICAJCXJldHVybiByOw0KPiAgIA0KPiBAQCAtMTI5Myw3ICsxMjkz
LDcgQEAgaW50IGFtZGdwdV92bV91cGRhdGVfcGRlcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diwNCj4gICAJcGFyYW1zLnZtID0gdm07DQo+ICAgCXBhcmFtcy5kaXJlY3QgPSBkaXJlY3Q7DQo+
ICAgDQo+IC0JciA9IHZtLT51cGRhdGVfZnVuY3MtPnByZXBhcmUoJnBhcmFtcywgQU1ER1BVX0ZF
TkNFX09XTkVSX1ZNLCBOVUxMKTsNCj4gKwlyID0gdm0tPnVwZGF0ZV9mdW5jcy0+cHJlcGFyZSgm
cGFyYW1zLCBOVUxMLCBBTURHUFVfU1lOQ19FWFBMSUNJVCk7DQo+ICAgCWlmIChyKQ0KPiAgIAkJ
cmV0dXJuIHI7DQo+ICAgDQo+IEBAIC0xNTUyLDcgKzE1NTIsNyBAQCBzdGF0aWMgaW50IGFtZGdw
dV92bV91cGRhdGVfcHRlcyhzdHJ1Y3QgYW1kZ3B1X3ZtX3VwZGF0ZV9wYXJhbXMgKnBhcmFtcywN
Cj4gICAgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyDQo+ICAgICogQHZtOiByZXF1ZXN0
ZWQgdm0NCj4gICAgKiBAZGlyZWN0OiBkaXJlY3Qgc3VibWlzc2lvbiBpbiBhIHBhZ2UgZmF1bHQN
Cj4gLSAqIEBleGNsdXNpdmU6IGZlbmNlIHdlIG5lZWQgdG8gc3luYyB0bw0KPiArICogQHJlc3Y6
IGZlbmNlcyB3ZSBuZWVkIHRvIHN5bmMgdG8NCj4gICAgKiBAc3RhcnQ6IHN0YXJ0IG9mIG1hcHBl
ZCByYW5nZQ0KPiAgICAqIEBsYXN0OiBsYXN0IG1hcHBlZCBlbnRyeQ0KPiAgICAqIEBmbGFnczog
ZmxhZ3MgZm9yIHRoZSBlbnRyaWVzDQo+IEBAIC0xNTY3LDE0ICsxNTY3LDE0IEBAIHN0YXRpYyBp
bnQgYW1kZ3B1X3ZtX3VwZGF0ZV9wdGVzKHN0cnVjdCBhbWRncHVfdm1fdXBkYXRlX3BhcmFtcyAq
cGFyYW1zLA0KPiAgICAqLw0KPiAgIHN0YXRpYyBpbnQgYW1kZ3B1X3ZtX2JvX3VwZGF0ZV9tYXBw
aW5nKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiAgIAkJCQkgICAgICAgc3RydWN0IGFt
ZGdwdV92bSAqdm0sIGJvb2wgZGlyZWN0LA0KPiAtCQkJCSAgICAgICBzdHJ1Y3QgZG1hX2ZlbmNl
ICpleGNsdXNpdmUsDQo+ICsJCQkJICAgICAgIHN0cnVjdCBkbWFfcmVzdiAqcmVzdiwNCj4gICAJ
CQkJICAgICAgIHVpbnQ2NF90IHN0YXJ0LCB1aW50NjRfdCBsYXN0LA0KPiAgIAkJCQkgICAgICAg
dWludDY0X3QgZmxhZ3MsIHVpbnQ2NF90IGFkZHIsDQo+ICAgCQkJCSAgICAgICBkbWFfYWRkcl90
ICpwYWdlc19hZGRyLA0KPiAgIAkJCQkgICAgICAgc3RydWN0IGRtYV9mZW5jZSAqKmZlbmNlKQ0K
PiAgIHsNCj4gICAJc3RydWN0IGFtZGdwdV92bV91cGRhdGVfcGFyYW1zIHBhcmFtczsNCj4gLQl2
b2lkICpvd25lciA9IEFNREdQVV9GRU5DRV9PV05FUl9WTTsNCj4gKwllbnVtIGFtZGdwdV9zeW5j
X21vZGUgc3luY19tb2RlOw0KPiAgIAlpbnQgcjsNCj4gICANCj4gICAJbWVtc2V0KCZwYXJhbXMs
IDAsIHNpemVvZihwYXJhbXMpKTsNCj4gQEAgLTE1ODMsOSArMTU4MywxMyBAQCBzdGF0aWMgaW50
IGFtZGdwdV92bV9ib191cGRhdGVfbWFwcGluZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwN
Cj4gICAJcGFyYW1zLmRpcmVjdCA9IGRpcmVjdDsNCj4gICAJcGFyYW1zLnBhZ2VzX2FkZHIgPSBw
YWdlc19hZGRyOw0KPiAgIA0KPiAtCS8qIHN5bmMgdG8gZXZlcnl0aGluZyBleGNlcHQgZXZpY3Rp
b24gZmVuY2VzIG9uIHVubWFwcGluZyAqLw0KPiArCS8qIEltcGxpY2l0bHkgc3luYyB0byBjb21t
YW5kIHN1Ym1pc3Npb25zIGluIHRoZSBzYW1lIFZNIGJlZm9yZQ0KPiArCSAqIHVubWFwcGluZy4g
U3luYyB0byBtb3ZpbmcgZmVuY2VzIGJlZm9yZSBtYXBwaW5nLg0KPiArCSAqLw0KPiAgIAlpZiAo
IShmbGFncyAmIEFNREdQVV9QVEVfVkFMSUQpKQ0KPiAtCQlvd25lciA9IEFNREdQVV9GRU5DRV9P
V05FUl9LRkQ7DQo+ICsJCXN5bmNfbW9kZSA9IEFNREdQVV9TWU5DX0VRX09XTkVSOw0KPiArCWVs
c2UNCj4gKwkJc3luY19tb2RlID0gQU1ER1BVX1NZTkNfRVhQTElDSVQ7DQo+ICAgDQo+ICAgCWFt
ZGdwdV92bV9ldmljdGlvbl9sb2NrKHZtKTsNCj4gICAJaWYgKHZtLT5ldmljdGluZykgew0KPiBA
QCAtMTU5Myw3ICsxNTk3LDcgQEAgc3RhdGljIGludCBhbWRncHVfdm1fYm9fdXBkYXRlX21hcHBp
bmcoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICAgCQlnb3RvIGVycm9yX3VubG9jazsN
Cj4gICAJfQ0KPiAgIA0KPiAtCXIgPSB2bS0+dXBkYXRlX2Z1bmNzLT5wcmVwYXJlKCZwYXJhbXMs
IG93bmVyLCBleGNsdXNpdmUpOw0KPiArCXIgPSB2bS0+dXBkYXRlX2Z1bmNzLT5wcmVwYXJlKCZw
YXJhbXMsIHJlc3YsIHN5bmNfbW9kZSk7DQo+ICAgCWlmIChyKQ0KPiAgIAkJZ290byBlcnJvcl91
bmxvY2s7DQo+ICAgDQo+IEBAIC0xNjEyLDcgKzE2MTYsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV92
bV9ib191cGRhdGVfbWFwcGluZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gICAgKiBh
bWRncHVfdm1fYm9fc3BsaXRfbWFwcGluZyAtIHNwbGl0IGEgbWFwcGluZyBpbnRvIHNtYWxsZXIg
Y2h1bmtzDQo+ICAgICoNCj4gICAgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyDQo+IC0g
KiBAZXhjbHVzaXZlOiBmZW5jZSB3ZSBuZWVkIHRvIHN5bmMgdG8NCj4gKyAqIEByZXN2OiBmZW5j
ZXMgd2UgbmVlZCB0byBzeW5jIHRvDQo+ICAgICogQHBhZ2VzX2FkZHI6IERNQSBhZGRyZXNzZXMg
dG8gdXNlIGZvciBtYXBwaW5nDQo+ICAgICogQHZtOiByZXF1ZXN0ZWQgdm0NCj4gICAgKiBAbWFw
cGluZzogbWFwcGVkIHJhbmdlIGFuZCBmbGFncyB0byB1c2UgZm9yIHRoZSB1cGRhdGUNCj4gQEAg
LTE2MjgsNyArMTYzMiw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3ZtX2JvX3VwZGF0ZV9tYXBwaW5n
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiAgICAqIDAgZm9yIHN1Y2Nlc3MsIC1FSU5W
QUwgZm9yIGZhaWx1cmUuDQo+ICAgICovDQo+ICAgc3RhdGljIGludCBhbWRncHVfdm1fYm9fc3Bs
aXRfbWFwcGluZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gLQkJCQkgICAgICBzdHJ1
Y3QgZG1hX2ZlbmNlICpleGNsdXNpdmUsDQo+ICsJCQkJICAgICAgc3RydWN0IGRtYV9yZXN2ICpy
ZXN2LA0KPiAgIAkJCQkgICAgICBkbWFfYWRkcl90ICpwYWdlc19hZGRyLA0KPiAgIAkJCQkgICAg
ICBzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSwNCj4gICAJCQkJICAgICAgc3RydWN0IGFtZGdwdV9ib192
YV9tYXBwaW5nICptYXBwaW5nLA0KPiBAQCAtMTcwNCw3ICsxNzA4LDcgQEAgc3RhdGljIGludCBh
bWRncHVfdm1fYm9fc3BsaXRfbWFwcGluZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4g
ICAJCX0NCj4gICANCj4gICAJCWxhc3QgPSBtaW4oKHVpbnQ2NF90KW1hcHBpbmctPmxhc3QsIHN0
YXJ0ICsgbWF4X2VudHJpZXMgLSAxKTsNCj4gLQkJciA9IGFtZGdwdV92bV9ib191cGRhdGVfbWFw
cGluZyhhZGV2LCB2bSwgZmFsc2UsIGV4Y2x1c2l2ZSwNCj4gKwkJciA9IGFtZGdwdV92bV9ib191
cGRhdGVfbWFwcGluZyhhZGV2LCB2bSwgZmFsc2UsIHJlc3YsDQo+ICAgCQkJCQkJc3RhcnQsIGxh
c3QsIGZsYWdzLCBhZGRyLA0KPiAgIAkJCQkJCWRtYV9hZGRyLCBmZW5jZSk7DQo+ICAgCQlpZiAo
cikNCj4gQEAgLTE3NDMsNyArMTc0Nyw4IEBAIGludCBhbWRncHVfdm1fYm9fdXBkYXRlKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2LCBzdHJ1Y3QgYW1kZ3B1X2JvX3ZhICpib192YSwNCj4gICAJ
ZG1hX2FkZHJfdCAqcGFnZXNfYWRkciA9IE5VTEw7DQo+ICAgCXN0cnVjdCB0dG1fbWVtX3JlZyAq
bWVtOw0KPiAgIAlzdHJ1Y3QgZHJtX21tX25vZGUgKm5vZGVzOw0KPiAtCXN0cnVjdCBkbWFfZmVu
Y2UgKmV4Y2x1c2l2ZSwgKipsYXN0X3VwZGF0ZTsNCj4gKwlzdHJ1Y3QgZG1hX2ZlbmNlICoqbGFz
dF91cGRhdGU7DQo+ICsJc3RydWN0IGRtYV9yZXN2ICpyZXN2Ow0KPiAgIAl1aW50NjRfdCBmbGFn
czsNCj4gICAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmJvX2FkZXYgPSBhZGV2Ow0KPiAgIAlpbnQg
cjsNCj4gQEAgLTE3NTEsNyArMTc1Niw3IEBAIGludCBhbWRncHVfdm1fYm9fdXBkYXRlKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2LCBzdHJ1Y3QgYW1kZ3B1X2JvX3ZhICpib192YSwNCj4gICAJ
aWYgKGNsZWFyIHx8ICFibykgew0KPiAgIAkJbWVtID0gTlVMTDsNCj4gICAJCW5vZGVzID0gTlVM
TDsNCj4gLQkJZXhjbHVzaXZlID0gTlVMTDsNCj4gKwkJcmVzdiA9IHZtLT5yb290LmJhc2UuYm8t
PnRiby5iYXNlLnJlc3Y7DQo+ICAgCX0gZWxzZSB7DQo+ICAgCQlzdHJ1Y3QgdHRtX2RtYV90dCAq
dHRtOw0KPiAgIA0KPiBAQCAtMTc2MSw3ICsxNzY2LDcgQEAgaW50IGFtZGdwdV92bV9ib191cGRh
dGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHN0cnVjdCBhbWRncHVfYm9fdmEgKmJvX3Zh
LA0KPiAgIAkJCXR0bSA9IGNvbnRhaW5lcl9vZihiby0+dGJvLnR0bSwgc3RydWN0IHR0bV9kbWFf
dHQsIHR0bSk7DQo+ICAgCQkJcGFnZXNfYWRkciA9IHR0bS0+ZG1hX2FkZHJlc3M7DQo+ICAgCQl9
DQo+IC0JCWV4Y2x1c2l2ZSA9IGJvLT50Ym8ubW92aW5nOw0KPiArCQlyZXN2ID0gYm8tPnRiby5i
YXNlLnJlc3Y7DQo+ICAgCX0NCj4gICANCj4gICAJaWYgKGJvKSB7DQo+IEBAIC0xNzc1LDcgKzE3
ODAsOCBAQCBpbnQgYW1kZ3B1X3ZtX2JvX3VwZGF0ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diwgc3RydWN0IGFtZGdwdV9ib192YSAqYm9fdmEsDQo+ICAgCQlmbGFncyA9IDB4MDsNCj4gICAJ
fQ0KPiAgIA0KPiAtCWlmIChjbGVhciB8fCAoYm8gJiYgYm8tPnRiby5iYXNlLnJlc3YgPT0gdm0t
PnJvb3QuYmFzZS5iby0+dGJvLmJhc2UucmVzdikpDQo+ICsJaWYgKGNsZWFyIHx8IChibyAmJiBi
by0+dGJvLmJhc2UucmVzdiA9PQ0KPiArCQkgICAgICB2bS0+cm9vdC5iYXNlLmJvLT50Ym8uYmFz
ZS5yZXN2KSkNCj4gICAJCWxhc3RfdXBkYXRlID0gJnZtLT5sYXN0X3VwZGF0ZTsNCj4gICAJZWxz
ZQ0KPiAgIAkJbGFzdF91cGRhdGUgPSAmYm9fdmEtPmxhc3RfcHRfdXBkYXRlOw0KPiBAQCAtMTc4
OSw3ICsxNzk1LDcgQEAgaW50IGFtZGdwdV92bV9ib191cGRhdGUoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsIHN0cnVjdCBhbWRncHVfYm9fdmEgKmJvX3ZhLA0KPiAgIAl9DQo+ICAgDQo+ICAg
CWxpc3RfZm9yX2VhY2hfZW50cnkobWFwcGluZywgJmJvX3ZhLT5pbnZhbGlkcywgbGlzdCkgew0K
PiAtCQlyID0gYW1kZ3B1X3ZtX2JvX3NwbGl0X21hcHBpbmcoYWRldiwgZXhjbHVzaXZlLCBwYWdl
c19hZGRyLCB2bSwNCj4gKwkJciA9IGFtZGdwdV92bV9ib19zcGxpdF9tYXBwaW5nKGFkZXYsIHJl
c3YsIHBhZ2VzX2FkZHIsIHZtLA0KPiAgIAkJCQkJICAgICAgIG1hcHBpbmcsIGZsYWdzLCBib19h
ZGV2LCBub2RlcywNCj4gICAJCQkJCSAgICAgICBsYXN0X3VwZGF0ZSk7DQo+ICAgCQlpZiAocikN
Cj4gQEAgLTE5ODQsNiArMTk5MCw3IEBAIGludCBhbWRncHVfdm1fY2xlYXJfZnJlZWQoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICAgCQkJICBzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSwNCj4g
ICAJCQkgIHN0cnVjdCBkbWFfZmVuY2UgKipmZW5jZSkNCj4gICB7DQo+ICsJc3RydWN0IGRtYV9y
ZXN2ICpyZXN2ID0gdm0tPnJvb3QuYmFzZS5iby0+dGJvLmJhc2UucmVzdjsNCj4gICAJc3RydWN0
IGFtZGdwdV9ib192YV9tYXBwaW5nICptYXBwaW5nOw0KPiAgIAl1aW50NjRfdCBpbml0X3B0ZV92
YWx1ZSA9IDA7DQo+ICAgCXN0cnVjdCBkbWFfZmVuY2UgKmYgPSBOVUxMOw0KPiBAQCAtMTk5OCw3
ICsyMDA1LDcgQEAgaW50IGFtZGdwdV92bV9jbGVhcl9mcmVlZChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwNCj4gICAJCSAgICBtYXBwaW5nLT5zdGFydCA8IEFNREdQVV9HTUNfSE9MRV9TVEFS
VCkNCj4gICAJCQlpbml0X3B0ZV92YWx1ZSA9IEFNREdQVV9QVEVfREVGQVVMVF9BVEM7DQo+ICAg
DQo+IC0JCXIgPSBhbWRncHVfdm1fYm9fdXBkYXRlX21hcHBpbmcoYWRldiwgdm0sIGZhbHNlLCBO
VUxMLA0KPiArCQlyID0gYW1kZ3B1X3ZtX2JvX3VwZGF0ZV9tYXBwaW5nKGFkZXYsIHZtLCBmYWxz
ZSwgcmVzdiwNCj4gICAJCQkJCQltYXBwaW5nLT5zdGFydCwgbWFwcGluZy0+bGFzdCwNCj4gICAJ
CQkJCQlpbml0X3B0ZV92YWx1ZSwgMCwgTlVMTCwgJmYpOw0KPiAgIAkJYW1kZ3B1X3ZtX2ZyZWVf
bWFwcGluZyhhZGV2LCB2bSwgbWFwcGluZywgZik7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV92bS5oDQo+IGluZGV4IGMyMWEzNmJlYmMwYy4uYjU3MDVmY2ZjOTM1IDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uaA0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uaA0KPiBAQCAtMjMwLDggKzIzMCw4
IEBAIHN0cnVjdCBhbWRncHVfdm1fdXBkYXRlX3BhcmFtcyB7DQo+ICAgDQo+ICAgc3RydWN0IGFt
ZGdwdV92bV91cGRhdGVfZnVuY3Mgew0KPiAgIAlpbnQgKCptYXBfdGFibGUpKHN0cnVjdCBhbWRn
cHVfYm8gKmJvKTsNCj4gLQlpbnQgKCpwcmVwYXJlKShzdHJ1Y3QgYW1kZ3B1X3ZtX3VwZGF0ZV9w
YXJhbXMgKnAsIHZvaWQgKiBvd25lciwNCj4gLQkJICAgICAgIHN0cnVjdCBkbWFfZmVuY2UgKmV4
Y2x1c2l2ZSk7DQo+ICsJaW50ICgqcHJlcGFyZSkoc3RydWN0IGFtZGdwdV92bV91cGRhdGVfcGFy
YW1zICpwLCBzdHJ1Y3QgZG1hX3Jlc3YgKnJlc3YsDQo+ICsJCSAgICAgICBlbnVtIGFtZGdwdV9z
eW5jX21vZGUgc3luY19tb2RlKTsNCj4gICAJaW50ICgqdXBkYXRlKShzdHJ1Y3QgYW1kZ3B1X3Zt
X3VwZGF0ZV9wYXJhbXMgKnAsDQo+ICAgCQkgICAgICBzdHJ1Y3QgYW1kZ3B1X2JvICpibywgdWlu
dDY0X3QgcGUsIHVpbnQ2NF90IGFkZHIsDQo+ICAgCQkgICAgICB1bnNpZ25lZCBjb3VudCwgdWlu
dDMyX3QgaW5jciwgdWludDY0X3QgZmxhZ3MpOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtX2NwdS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3ZtX2NwdS5jDQo+IGluZGV4IDY4YjAxM2JlMzgzNy4uZTM4NTE2MzA0MDcwIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm1fY3B1LmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtX2NwdS5jDQo+IEBA
IC00NCwyNiArNDQsMTQgQEAgc3RhdGljIGludCBhbWRncHVfdm1fY3B1X21hcF90YWJsZShzdHJ1
Y3QgYW1kZ3B1X2JvICp0YWJsZSkNCj4gICAgKiBSZXR1cm5zOg0KPiAgICAqIE5lZ2F0aXYgZXJy
bm8sIDAgZm9yIHN1Y2Nlc3MuDQo+ICAgICovDQo+IC1zdGF0aWMgaW50IGFtZGdwdV92bV9jcHVf
cHJlcGFyZShzdHJ1Y3QgYW1kZ3B1X3ZtX3VwZGF0ZV9wYXJhbXMgKnAsIHZvaWQgKm93bmVyLA0K
PiAtCQkJCSBzdHJ1Y3QgZG1hX2ZlbmNlICpleGNsdXNpdmUpDQo+ICtzdGF0aWMgaW50IGFtZGdw
dV92bV9jcHVfcHJlcGFyZShzdHJ1Y3QgYW1kZ3B1X3ZtX3VwZGF0ZV9wYXJhbXMgKnAsDQo+ICsJ
CQkJIHN0cnVjdCBkbWFfcmVzdiAqcmVzdiwNCj4gKwkJCQkgZW51bSBhbWRncHVfc3luY19tb2Rl
IHN5bmNfbW9kZSkNCj4gICB7DQo+IC0JaW50IHI7DQo+IC0NCj4gLQkvKiBXYWl0IGZvciBhbnkg
Qk8gbW92ZSB0byBiZSBjb21wbGV0ZWQgKi8NCj4gLQlpZiAoZXhjbHVzaXZlKSB7DQo+IC0JCXIg
PSBkbWFfZmVuY2Vfd2FpdChleGNsdXNpdmUsIHRydWUpOw0KPiAtCQlpZiAodW5saWtlbHkocikp
DQo+IC0JCQlyZXR1cm4gcjsNCj4gLQl9DQo+IC0NCj4gLQkvKiBEb24ndCB3YWl0IGZvciBzdWJt
aXNzaW9ucyBkdXJpbmcgcGFnZSBmYXVsdCAqLw0KPiAtCWlmIChwLT5kaXJlY3QpDQo+ICsJaWYg
KCFyZXN2KQ0KPiAgIAkJcmV0dXJuIDA7DQo+ICAgDQo+IC0JLyogV2FpdCBmb3IgUFQgQk9zIHRv
IGJlIGlkbGUuIFBUcyBzaGFyZSB0aGUgc2FtZSByZXN2LiBvYmplY3QNCj4gLQkgKiBhcyB0aGUg
cm9vdCBQRCBCTw0KPiAtCSAqLw0KPiAtCXJldHVybiBhbWRncHVfYm9fc3luY193YWl0KHAtPnZt
LT5yb290LmJhc2UuYm8sIG93bmVyLCB0cnVlKTsNCj4gKwlyZXR1cm4gYW1kZ3B1X2JvX3N5bmNf
d2FpdF9yZXN2KHAtPmFkZXYsIHJlc3YsIHN5bmNfbW9kZSwgcC0+dm0sIHRydWUpOw0KPiAgIH0N
Cj4gICANCj4gICAvKioNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV92bV9zZG1hLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm1f
c2RtYS5jDQo+IGluZGV4IGFiNjQ4MTc1MTc2My4uNGNjNzg4MWY0MzhjIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm1fc2RtYS5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bV9zZG1hLmMNCj4gQEAgLTU4LDkgKzU4
LDkgQEAgc3RhdGljIGludCBhbWRncHVfdm1fc2RtYV9tYXBfdGFibGUoc3RydWN0IGFtZGdwdV9i
byAqdGFibGUpDQo+ICAgICogTmVnYXRpdiBlcnJubywgMCBmb3Igc3VjY2Vzcy4NCj4gICAgKi8N
Cj4gICBzdGF0aWMgaW50IGFtZGdwdV92bV9zZG1hX3ByZXBhcmUoc3RydWN0IGFtZGdwdV92bV91
cGRhdGVfcGFyYW1zICpwLA0KPiAtCQkJCSAgdm9pZCAqb3duZXIsIHN0cnVjdCBkbWFfZmVuY2Ug
KmV4Y2x1c2l2ZSkNCj4gKwkJCQkgIHN0cnVjdCBkbWFfcmVzdiAqcmVzdiwNCj4gKwkJCQkgIGVu
dW0gYW1kZ3B1X3N5bmNfbW9kZSBzeW5jX21vZGUpDQo+ICAgew0KPiAtCXN0cnVjdCBhbWRncHVf
Ym8gKnJvb3QgPSBwLT52bS0+cm9vdC5iYXNlLmJvOw0KPiAgIAl1bnNpZ25lZCBpbnQgbmR3ID0g
QU1ER1BVX1ZNX1NETUFfTUlOX05VTV9EVzsNCj4gICAJaW50IHI7DQo+ICAgDQo+IEBAIC03MCwx
NyArNzAsMTAgQEAgc3RhdGljIGludCBhbWRncHVfdm1fc2RtYV9wcmVwYXJlKHN0cnVjdCBhbWRn
cHVfdm1fdXBkYXRlX3BhcmFtcyAqcCwNCj4gICANCj4gICAJcC0+bnVtX2R3X2xlZnQgPSBuZHc7
DQo+ICAgDQo+IC0JLyogV2FpdCBmb3IgbW92ZXMgdG8gYmUgY29tcGxldGVkICovDQo+IC0JciA9
IGFtZGdwdV9zeW5jX2ZlbmNlKCZwLT5qb2ItPnN5bmMsIGV4Y2x1c2l2ZSwgZmFsc2UpOw0KPiAt
CWlmIChyKQ0KPiAtCQlyZXR1cm4gcjsNCj4gLQ0KPiAtCS8qIERvbid0IHdhaXQgZm9yIGFueSBz
dWJtaXNzaW9ucyBkdXJpbmcgcGFnZSBmYXVsdCBoYW5kbGluZyAqLw0KPiAtCWlmIChwLT5kaXJl
Y3QpDQo+ICsJaWYgKCFyZXN2KQ0KPiAgIAkJcmV0dXJuIDA7DQo+ICAgDQo+IC0JcmV0dXJuIGFt
ZGdwdV9zeW5jX3Jlc3YocC0+YWRldiwgJnAtPmpvYi0+c3luYywgcm9vdC0+dGJvLmJhc2UucmVz
diwNCj4gLQkJCQlBTURHUFVfU1lOQ19ORV9PV05FUiwgb3duZXIpOw0KPiArCXJldHVybiBhbWRn
cHVfc3luY19yZXN2KHAtPmFkZXYsICZwLT5qb2ItPnN5bmMsIHJlc3YsIHN5bmNfbW9kZSwgcC0+
dm0pOw0KPiAgIH0NCj4gICANCj4gICAvKioNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeAo=
