Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F9D84312
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2019 05:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2712589CB2;
	Wed,  7 Aug 2019 03:59:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730046.outbound.protection.outlook.com [40.107.73.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D08E389B0D
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Aug 2019 03:59:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oDBX3nCx8Df55N14ceYD1yiRPTAJsRlZlJ1D112F8hWCePg+2s/NkVqgVYskOigNjArdcX3+CXPlM7TPqTQr57e3/MFBiGcpDZb0sCLlsntCGmzNoQvfESJr/uVFfIYLZkRS4YS2fnoAXs30fU3L4trp1wGyHO3axcqaW3ucSwbmA0DGfPFMzx/8SmdaBqVFdR//UIRyyR/HgETSR6vCyo6/c8Tyj2ivXBnoiFtaRhcbpiFWnXu5bp/YRZasQvJKLT3rywk8roDR2E7kRjH9QMxDJ9peQ60WAkTw3tftd7kc1nIX9OeTvIZSBtbWS8PqOwjfrl094MDkS244RcuA9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5KNXuUV0Z2UCCxCQ5S800fdscHMo7XbGuQ315urfdM=;
 b=m93u2dtp9YlVrQhQrKZGlVPXlYaCOAKMWfs9k35wwPmlhQttR3wULxt25ITq3bMytRPCZsqKmYXrvaDUI8dTsXZB/R7zxddVdAx7XW7aIgShR1tfbwAaDSzulil55L5YL+ISsWif8bOg6mgchYcXucyEdmUMvH269MVeqHRg1dQSVk/Ka/BauI1pErUBeyL7ASJrox7ygsdxRhvwh1DBBmbUM8K+IWKgVELvKIrXp0H8t41kYoMQHBwLSobOhlDLhsPovniEQYeMdlrVJ9z6JaHlUykTgbFVaZ0r7czVGWjdQYVEi6WHrx3xxuAA+6f+vauhBJhJCL/c9PTGfTEDcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB4314.namprd12.prod.outlook.com (10.141.184.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Wed, 7 Aug 2019 03:59:26 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::1c82:54e7:589b:539c]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::1c82:54e7:589b:539c%5]) with mapi id 15.20.2157.011; Wed, 7 Aug 2019
 03:59:26 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zeng, Oak" <Oak.Zeng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/5] drm/amdgpu: Support new arcturus mtype
Thread-Topic: [PATCH 2/5] drm/amdgpu: Support new arcturus mtype
Thread-Index: AQHVTMgtUR+zaEbF3EaJqrxpNYSbk6bvD28A
Date: Wed, 7 Aug 2019 03:59:26 +0000
Message-ID: <25245180-579a-dd16-2f8f-49008342eddc@amd.com>
References: <1565145062-16674-1-git-send-email-Oak.Zeng@amd.com>
 <1565145062-16674-2-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1565145062-16674-2-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.54.211]
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTXPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::38) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7fac7619-7bf2-407a-f0c9-08d71aeba3b8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB4314; 
x-ms-traffictypediagnostic: DM6PR12MB4314:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB4314387055F2F81D3332290892D40@DM6PR12MB4314.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39860400002)(366004)(376002)(346002)(199004)(189003)(6512007)(65826007)(36756003)(26005)(186003)(53546011)(6506007)(386003)(102836004)(3846002)(65806001)(6116002)(76176011)(65956001)(66066001)(25786009)(53936002)(6246003)(11346002)(6436002)(99286004)(446003)(5660300002)(4326008)(486006)(229853002)(2616005)(6486002)(31686004)(52116002)(476003)(66446008)(66556008)(66476007)(64756008)(66946007)(71190400001)(71200400001)(305945005)(7736002)(31696002)(478600001)(86362001)(14454004)(68736007)(2501003)(54906003)(110136005)(58126008)(316002)(8676002)(2906002)(64126003)(14444005)(256004)(81156014)(81166006)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4314;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4WW/IqwWa42ahA6a1gVCiOeSpHj5nheP3mKBq5S66gD484DXgzlBfosX1njFLGmKxxgd5qwIx9K/yaJ6UICSRvi6D0k/ajpbXNXTHXM1LwWivnjeNc+iImLqyISYK9YY9A1QQoQTlrdVtiT+20CdYORJwONbJ8zLaEyYTBKkOHXSqdzs7Wa/dsP9sH9r8FNUotRaSCzf9tUht3xIg27yfSj6rdjagUwb+R1TVIJtn5h0RE2OkJ26xpKSehEXDEOrA+2lcBfhxm/OHFAsyORLd7jQ9jKyO8K8JVQdcKv7LN72lJ10JtWwM/JvYlLiX3fHQwfOOQ9q2LrfZ8BLtgfEP3zrkfPJ4I+Zmg79mop62EkhOurNW/BR1SXhANaoc0bwPf5pzOVZGaEpwjf3WNmEH7njaWva+LrqcWvJ0lk1B+w=
Content-ID: <3815DBE8F8C344448BC89421E297BC45@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fac7619-7bf2-407a-f0c9-08d71aeba3b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 03:59:26.4756 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WcL4IVFwl10pdz8ahxwhjywzta7Fb8e8SABHL++QpUXsrmCz+mEBfBdX77KQPvxQSRiAJeYevu0RBQnaYe/xGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4314
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5KNXuUV0Z2UCCxCQ5S800fdscHMo7XbGuQ315urfdM=;
 b=hE0u6cyWjM3XASfpp9WL8zhGmtcp0aeJnflxBah4mcbb+k66pUGu/+KYE1148Azdswbt7sY9seW1rnkK26OrLzbnv/jUUnbOteuDI5SbFS9WLWvZmOcScIEy34agcdUvUYoJL1LsH7kNiEX2RrajetiBmGRWAipjZ0VQeiyHCKI=
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
Cc: "Keely, Sean" <Sean.Keely@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wOC0wNiAyMjozMSwgWmVuZywgT2FrIHdyb3RlOg0KPiBBcmN0dXJ1cyByZXB1cnBv
c2VkIG10eXBlIFdDIHRvIFJXLiBNb2RpZnkgZ21jIGZ1bmN0aW9ucw0KPiB0byBzdXBwb3J0IHRo
ZSBuZXcgbXR5cGUNCj4NCj4gQ2hhbmdlLUlkOiBJZGMzMzhlNTM4NmE1NzAyMGY0NTI2MjAyNWUy
NjY0YWI0YmE5ZjI5MQ0KPiBTaWduZWQtb2ZmLWJ5OiBPYWsgWmVuZyA8T2FrLlplbmdAYW1kLmNv
bT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyAgICAg
fCA2MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+ICAgZHJpdmVycy9ncHUvZHJt
L2FtZC9pbmNsdWRlL3ZlZ2ExMF9lbnVtLmggfCAgNyArKysrDQo+ICAgMiBmaWxlcyBjaGFuZ2Vk
LCA2NyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ21jX3Y5XzAuYw0KPiBpbmRleCBhMmFhMzVlLi44OTA2NGQ5IDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMNCj4gQEAgLTU5OSw2ICs1OTksNTAgQEAgc3Rh
dGljIHVpbnQ2NF90IGdtY192OV8wX2dldF92bV9wdGVfZmxhZ3Moc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsDQo+ICAgCXJldHVybiBwdGVfZmxhZzsNCj4gICB9DQo+ICAgDQo+ICtzdGF0aWMg
dWludDY0X3QgZ21jX3Y5XzBfYXJjdHVydXNfZ2V0X3ZtX3B0ZV9mbGFncyhzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiwNCj4gKwkJCQkJCXVpbnQzMl90IGZsYWdzKQ0KPiArDQo+ICt7DQo+ICsJ
dWludDY0X3QgcHRlX2ZsYWcgPSAwOw0KPiArDQo+ICsJaWYgKGZsYWdzICYgQU1ER1BVX1ZNX1BB
R0VfRVhFQ1VUQUJMRSkNCj4gKwkJcHRlX2ZsYWcgfD0gQU1ER1BVX1BURV9FWEVDVVRBQkxFOw0K
PiArCWlmIChmbGFncyAmIEFNREdQVV9WTV9QQUdFX1JFQURBQkxFKQ0KPiArCQlwdGVfZmxhZyB8
PSBBTURHUFVfUFRFX1JFQURBQkxFOw0KPiArCWlmIChmbGFncyAmIEFNREdQVV9WTV9QQUdFX1dS
SVRFQUJMRSkNCj4gKwkJcHRlX2ZsYWcgfD0gQU1ER1BVX1BURV9XUklURUFCTEU7DQo+ICsNCj4g
KwlpZiAoYWRldi0+Z21jLnpmYl9zaXplID4gMCkNCj4gKwkJcHRlX2ZsYWcgfD0gQU1ER1BVX1BU
RV9TWVNURU07DQo+ICsNCj4gKwlzd2l0Y2ggKGZsYWdzICYgQU1ER1BVX1ZNX01UWVBFX01BU0sp
IHsNCj4gKwljYXNlIEFNREdQVV9WTV9NVFlQRV9ERUZBVUxUOg0KPiArCQlwdGVfZmxhZyB8PSBB
TURHUFVfUFRFX01UWVBFX1ZHMTAoTVRZUEVfQVJDVFVSVVNfTkMpOw0KPiArCQlicmVhazsNCj4g
KwljYXNlIEFNREdQVV9WTV9NVFlQRV9OQzoNCj4gKwkJcHRlX2ZsYWcgfD0gQU1ER1BVX1BURV9N
VFlQRV9WRzEwKE1UWVBFX0FSQ1RVUlVTX05DKTsNCj4gKwkJYnJlYWs7DQo+ICsJY2FzZSBBTURH
UFVfVk1fTVRZUEVfUlc6DQo+ICsJCXB0ZV9mbGFnIHw9IEFNREdQVV9QVEVfTVRZUEVfVkcxMChN
VFlQRV9BUkNUVVJVU19SVyk7DQo+ICsJCWJyZWFrOw0KPiArCWNhc2UgQU1ER1BVX1ZNX01UWVBF
X0NDOg0KPiArCQlwdGVfZmxhZyB8PSBBTURHUFVfUFRFX01UWVBFX1ZHMTAoTVRZUEVfQVJDVFVS
VVNfQ0MpOw0KPiArCQlicmVhazsNCj4gKwljYXNlIEFNREdQVV9WTV9NVFlQRV9VQzoNCj4gKwkJ
cHRlX2ZsYWcgfD0gQU1ER1BVX1BURV9NVFlQRV9WRzEwKE1UWVBFX0FSQ1RVUlVTX1VDKTsNCj4g
KwkJYnJlYWs7DQo+ICsJZGVmYXVsdDoNCj4gKwkJcHRlX2ZsYWcgfD0gQU1ER1BVX1BURV9NVFlQ
RV9WRzEwKE1UWVBFX0FSQ1RVUlVTX05DKTsNCj4gKwkJYnJlYWs7DQo+ICsJfQ0KPiArDQo+ICsJ
aWYgKGZsYWdzICYgQU1ER1BVX1ZNX1BBR0VfUFJUKQ0KPiArCQlwdGVfZmxhZyB8PSBBTURHUFVf
UFRFX1BSVDsNCj4gKw0KPiArCXJldHVybiBwdGVfZmxhZzsNCj4gK30NCg0KQWRkaW5nIGEgd2hv
bGUgbmV3IGZ1bmN0aW9uIGZvciBBcmN0dXJ1cyBpcyBvdmVya2lsbC4gSnVzdCBhZGQgTVRZUEVf
UlcgDQp0byB0aGUgZXhpc3RpbmcgZnVuY3Rpb24uDQoNCiDCoMKgwqAgwqDCoMKgIHN3aXRjaChm
bGFncyAmIEFNREdQVV9WTV9NVFlQRV9NQVNLKSB7DQogwqDCoMKgIMKgwqDCoCAuLi4NCiDCoMKg
wqDCoMKgwqDCoCBjYXNlIEFNREdQVV9WTV9NVFlQRV9XQzoNCiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcHRlX2ZsYWcgfD0gQU1ER1BVX1BURV9NVFlQRV9WRzEwKE1UWVBFX1dDKTsN
CiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQogwqDCoMKgwqDCoMKgwqAg
Y2FzZSBBTURHUFVfVk1fTVRZUEVfUlc6DQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHB0ZV9mbGFnIHw9IEFNREdQVV9QVEVfTVRZUEVfVkcxMChNVFlQRV9SVyk7DQogwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOw0KIMKgwqDCoCDCoMKgwqAgLi4uDQogwqDCoMKg
IMKgwqDCoCB9DQoNClRoZSBmYWN0IHRoYXQgV0MgaXNuJ3QgdmFsaWQgb24gQXJjdHVydXMgYW5k
IFJXIGlzbid0IHZhbGlkIG9uIG90aGVyIA0KVmVnYSBHUFVzIGNvdWxkIGJlIGhhbmRsZWQgaW4g
aGlnaGVyIGxldmVsIGNvZGUuDQoNCg0KPiArDQo+ICsNCj4gICBzdGF0aWMgdm9pZCBnbWNfdjlf
MF9nZXRfdm1fcGRlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBpbnQgbGV2ZWwsDQo+ICAg
CQkJCXVpbnQ2NF90ICphZGRyLCB1aW50NjRfdCAqZmxhZ3MpDQo+ICAgew0KPiBAQCAtNjMxLDkg
KzY3NSwyNCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9nbWNfZnVuY3MgZ21jX3Y5XzBf
Z21jX2Z1bmNzID0gew0KPiAgIAkuZ2V0X3ZtX3BkZSA9IGdtY192OV8wX2dldF92bV9wZGUNCj4g
ICB9Ow0KPiAgIA0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfZ21jX2Z1bmNzIGdtY192
OV8wX2FyY3R1cnVzX2dtY19mdW5jcyA9IHsNCj4gKwkuZmx1c2hfZ3B1X3RsYiA9IGdtY192OV8w
X2ZsdXNoX2dwdV90bGIsDQo+ICsJLmVtaXRfZmx1c2hfZ3B1X3RsYiA9IGdtY192OV8wX2VtaXRf
Zmx1c2hfZ3B1X3RsYiwNCj4gKwkuZW1pdF9wYXNpZF9tYXBwaW5nID0gZ21jX3Y5XzBfZW1pdF9w
YXNpZF9tYXBwaW5nLA0KPiArCS5nZXRfdm1fcHRlX2ZsYWdzID0gZ21jX3Y5XzBfYXJjdHVydXNf
Z2V0X3ZtX3B0ZV9mbGFncywNCj4gKwkuZ2V0X3ZtX3BkZSA9IGdtY192OV8wX2dldF92bV9wZGUN
Cj4gK307DQo+ICsNCj4gICBzdGF0aWMgdm9pZCBnbWNfdjlfMF9zZXRfZ21jX2Z1bmNzKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPiAgIHsNCj4gLQlhZGV2LT5nbWMuZ21jX2Z1bmNzID0g
JmdtY192OV8wX2dtY19mdW5jczsNCj4gKwlzd2l0Y2ggKGFkZXYtPmFzaWNfdHlwZSkgew0KPiAr
CWNhc2UgQ0hJUF9BUkNUVVJVUzoNCj4gKwkJYWRldi0+Z21jLmdtY19mdW5jcyA9ICZnbWNfdjlf
MF9hcmN0dXJ1c19nbWNfZnVuY3M7DQo+ICsJCWJyZWFrOw0KPiArCWRlZmF1bHQ6DQo+ICsJCWFk
ZXYtPmdtYy5nbWNfZnVuY3MgPSAmZ21jX3Y5XzBfZ21jX2Z1bmNzOw0KPiArCQlicmVhazsNCj4g
Kwl9DQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRpYyB2b2lkIGdtY192OV8wX3NldF91bWNfZnVuY3Mo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2luY2x1ZGUvdmVnYTEwX2VudW0uaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVk
ZS92ZWdhMTBfZW51bS5oDQo+IGluZGV4IGMxNGJhNjUuLjBkNmQ5N2QgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS92ZWdhMTBfZW51bS5oDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvaW5jbHVkZS92ZWdhMTBfZW51bS5oDQo+IEBAIC0xMDQxLDYgKzEwNDEs
MTMgQEAgTVRZUEVfQ0MgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA9IDB4MDAwMDAw
MDIsDQo+ICAgTVRZUEVfVUMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA9IDB4MDAw
MDAwMDMsDQo+ICAgfSBNVFlQRTsNCj4gICANCj4gK3R5cGVkZWYgZW51bSBNVFlQRV9BUkNUVVJV
UyB7DQo+ICtNVFlQRV9BUkNUVVJVU19OQyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ID0gMHgwMDAwMDAwMCwNCj4gK01UWVBFX0FSQ1RVUlVTX1JXICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgPSAweDAwMDAwMDAxLA0KPiArTVRZUEVfQVJDVFVSVVNfQ0MgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICA9IDB4MDAwMDAwMDIsDQo+ICtNVFlQRV9BUkNUVVJVU19V
QyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID0gMHgwMDAwMDAwMywNCj4gK30gTVRZ
UEVfQVJDVFVSVVM7DQoNClRoaXMgaXMgb3ZlcmtpbGwuIE1vc3Qgb2YgdGhlIE1UWVBFcyBhcmUg
dGhlIHNhbWUgb24gQXJjdHVydXMuIFlvdSBjYW4gDQpqdXN0IGRlZmluZSBNVFlQRV9SVyBhcyBh
biBhbGlhcyBvZiBNVFlQRV9XQzoNCg0KdHlwZWRlZiBlbnVtIE1UWVBFIHsNCk1UWVBFX05DwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCA9IDB4MDAwMDAwMDAsDQpNVFlQRV9XQ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPSAweDAwMDAwMDAxLA0KTVRZUEVf
UlcgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgPSAweDAwMDAwMDAxLCAvKiBBcmN0dXJ1cyAqLw0KTVRZUEVfQ0PCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgID0g
MHgwMDAwMDAwMiwNCk1UWVBFX1VDwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA9IDB4MDAwMDAwMDMsDQp9IE1UWVBFOw0KDQpS
ZWdhcmRzLA0KIMKgIEZlbGl4DQoNCg0KPiArDQo+ICAgLyoNCj4gICAgKiBSTUlfQ0lEIGVudW0N
Cj4gICAgKi8NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
