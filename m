Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C39716C8
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 13:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B3286E178;
	Tue, 23 Jul 2019 11:16:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790047.outbound.protection.outlook.com [40.107.79.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 751A16E188
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 11:16:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dfZoElw39nrhs+zOKlwv19INH635f6kxVJBxzO0QgahcEERxCv5xKi6Csc8DwbbXaCe7t0VIlcFIpgJpdD3PZXSUUj2bV3UtY80UtWDDxLLoj64Gx05kC69Iw4sdlCklwVjz3olcM/Mzl30PXwRR/tbVZumfbBH0A6GpigMFsEhNgXwV0G8pErSNOxUVnKcvoHx5mrcSiPRPulvaAtloR22chfoQwI5t/RiYhPhlF1x/CdnYWvAKLHXsfZ0CCOr7srKCKkkBX6zXXPZLnl02GDaykcQRgQ4qrafSvklegFvakaaFzS0fg91QiQa+SVkBuX+opJh7ozii3ty309DAFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qN/IS3+hzrBHdxGWhaxDj002p7psfTT3XN8WSoRkNoM=;
 b=Om8jfMC5tseGX7eGac/S39AJ5Ernypmh5uQqUsa8JpI5ZA/+ih3CuOdrPDN0KLZr9ctkYgTRxNATV/PxcUzhK2xxp1KaT8fKN0h2FHP6u0aEZe0QogptY6IWzie5+0QET33ofyDDcKEihDEDypUneEy/Tm5in0DvavpJ8V8+sI6c0Sx/LUYgoQKLxyRSwVVytFNt7137DPbFwOJkOF8ypJ/gnp0+bGhlA7nFsB6djzKJWiuc6DpARAfRDxZ1SoRhBxnbsSULssjb9kBssHvRdL2HFUURG4m0/SvF8ZkhnLeE7RaOFsMY0CQs9Ny16fjZhaXzAhZf5S8hZseewAA9Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN8PR12MB3329.namprd12.prod.outlook.com (20.178.210.206) by
 BN8PR12MB2930.namprd12.prod.outlook.com (20.179.66.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Tue, 23 Jul 2019 11:15:59 +0000
Received: from BN8PR12MB3329.namprd12.prod.outlook.com
 ([fe80::347f:8a8d:c0d4:823c]) by BN8PR12MB3329.namprd12.prod.outlook.com
 ([fe80::347f:8a8d:c0d4:823c%7]) with mapi id 15.20.2094.017; Tue, 23 Jul 2019
 11:15:59 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: RE: [PATCH] drm/amd/powerplay: add callback function of
 get_thermal_temperature_range
Thread-Topic: [PATCH] drm/amd/powerplay: add callback function of
 get_thermal_temperature_range
Thread-Index: AQHVQTlyjZ5kvroa60KvH7CerObgK6bYDG9A
Date: Tue, 23 Jul 2019 11:15:59 +0000
Message-ID: <BN8PR12MB33290D4E7F1743C60EA4CCB4E4C70@BN8PR12MB3329.namprd12.prod.outlook.com>
References: <20190723093109.2701-1-kevin1.wang@amd.com>
In-Reply-To: <20190723093109.2701-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-Mentions: Alexander.Deucher@amd.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ce57f66-1c21-4e35-2ce6-08d70f5f23df
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB2930; 
x-ms-traffictypediagnostic: BN8PR12MB2930:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN8PR12MB29303602DC420A437018DE81E4C70@BN8PR12MB2930.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(199004)(189003)(13464003)(33656002)(66066001)(486006)(66476007)(76116006)(66556008)(64756008)(66446008)(76176011)(66946007)(7696005)(6436002)(6506007)(6306002)(53546011)(68736007)(9686003)(99286004)(102836004)(86362001)(71200400001)(55016002)(71190400001)(26005)(229853002)(478600001)(6246003)(74316002)(81156014)(305945005)(3846002)(54906003)(81166006)(25786009)(2906002)(110136005)(256004)(316002)(14444005)(6116002)(4326008)(53936002)(52536014)(446003)(6636002)(476003)(966005)(2501003)(7736002)(11346002)(14454004)(8936002)(5660300002)(186003)(8676002)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB2930;
 H:BN8PR12MB3329.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bqSDJavK4km0VcmvZbdK6pj+P8oBWPSwKEfdmfJ6ejesRQ5JKfphIkLIuEJyomDBsqhhMDUBFculIuf0jqgk+MpwLkjHVtHwHvzfxdfVOPQuWOvsEtSYEP868qcdGVsFR8uhpZjS4T2bdPv8JIN6PnnBmeT1Fw9x9BJ9ZKqmgUfGj7Mq1oVt/S06XG5sSHqSwckTwGfNP2XbHoJ9PVpxQFfVxHTf2ncuiP6JO3UpqK/J/RlBKCbw1avAgEU3gi0fvrBsqy9B3ZAHFwi1ZtbVAWu7JlRaz249Aj/qqBj/xCuE76iopYeKpLnatlNAuHHA9FjcRNF81iTA6vEDqQj6eHxZlpVdNDCuCwPk4rf3t4eJ4ouoWV+w+e6K/m8Jy6LZ94pVgJAFm2KLBS1iOU7t411GQ+yCpfRg61Wesvz4O7I=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ce57f66-1c21-4e35-2ce6-08d70f5f23df
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 11:15:59.2663 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2930
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qN/IS3+hzrBHdxGWhaxDj002p7psfTT3XN8WSoRkNoM=;
 b=LqJxdGR33zHmuzM8AEv00LML5nDkBYmbtepLUlKRTMPtu9+AEajS1mBrMs1lM71RGWUl18jxj5N7p5p2Q/nV8DhFtFCgceRCuMuNtqTMLoQe1jd/La7wsWHK2DM7yyZBHhrBAN8VaIKd7ai8KqkpnnYUIHjD8fL/0zuEDZCX6Vg=
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGxlYXNlIGRvIG5vdCBjaGFuZ2UgdGhlIG91dHB1dCB0ZW1wZXJhdHVyZSBncmFudWxhcml0eS4N
CkFsdGhvdWdoIGl0IHNlZW1zIGEgbGl0dGxlIHdlaXJkLiBJdCdzIHJlcXVpcmVkIGJ5IGh3bW9u
IGludGVyZmFjZXMgZGVzaWduICBhbmQgaGFzIHRvIGJlIGluIG1pbGxpZGVncmVlcyBDZWxzaXVz
IChARGV1Y2hlciwgQWxleGFuZGVyLCByaWdodD8pLg0KDQoqIGh3bW9uIGludGVyZmFjZXMgZm9y
IEdQVSB0ZW1wZXJhdHVyZToNCiAqDQogKiAtIHRlbXBbMS0zXV9pbnB1dDogdGhlIG9uIGRpZSBH
UFUgdGVtcGVyYXR1cmUgaW4gbWlsbGlkZWdyZWVzIENlbHNpdXMNCiAqICAgLSB0ZW1wMl9pbnB1
dCBhbmQgdGVtcDNfaW5wdXQgYXJlIHN1cHBvcnRlZCBvbiBTT0MxNSBkR1BVcyBvbmx5DQogKg0K
ICogLSB0ZW1wWzEtM11fbGFiZWw6IHRlbXBlcmF0dXJlIGNoYW5uZWwgbGFiZWwNCiAqICAgLSB0
ZW1wMl9sYWJlbCBhbmQgdGVtcDNfbGFiZWwgYXJlIHN1cHBvcnRlZCBvbiBTT0MxNSBkR1BVcyBv
bmx5DQogKg0KICogLSB0ZW1wWzEtM11fY3JpdDogdGVtcGVyYXR1cmUgY3JpdGljYWwgbWF4IHZh
bHVlIGluIG1pbGxpZGVncmVlcyBDZWxzaXVzDQogKiAgIC0gdGVtcDJfY3JpdCBhbmQgdGVtcDNf
Y3JpdCBhcmUgc3VwcG9ydGVkIG9uIFNPQzE1IGRHUFVzIG9ubHkNCiAqDQogKiAtIHRlbXBbMS0z
XV9jcml0X2h5c3Q6IHRlbXBlcmF0dXJlIGh5c3RlcmVzaXMgZm9yIGNyaXRpY2FsIGxpbWl0IGlu
IG1pbGxpZGVncmVlcyBDZWxzaXVzDQogKiAgIC0gdGVtcDJfY3JpdF9oeXN0IGFuZCB0ZW1wM19j
cml0X2h5c3QgYXJlIHN1cHBvcnRlZCBvbiBTT0MxNSBkR1BVcyBvbmx5DQogKg0KICogLSB0ZW1w
WzEtM11fZW1lcmdlbmN5OiB0ZW1wZXJhdHVyZSBlbWVyZ2VuY3kgbWF4IHZhbHVlKGFzaWMgc2h1
dGRvd24pIGluIG1pbGxpZGVncmVlcyBDZWxzaXVzDQogKiAgIC0gdGhlc2UgYXJlIHN1cHBvcnRl
ZCBvbiBTT0MxNSBkR1BVcyBvbmx5DQoNClJlZ2FyZHMsDQpFdmFuDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVl
ZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPiBXYW5nLCBLZXZpbihZYW5nKQ0KPiBTZW50OiBU
dWVzZGF5LCBKdWx5IDIzLCAyMDE5IDU6MzIgUE0NCj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQo+IENjOiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEZlbmcsIEtl
bm5ldGgNCj4gPEtlbm5ldGguRmVuZ0BhbWQuY29tPjsgV2FuZywgS2V2aW4oWWFuZykgPEtldmlu
MS5XYW5nQGFtZC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZC9wb3dlcnBsYXk6IGFk
ZCBjYWxsYmFjayBmdW5jdGlvbiBvZg0KPiBnZXRfdGhlcm1hbF90ZW1wZXJhdHVyZV9yYW5nZQ0K
PiANCj4gMS4gdGhlIHRoZXJtYWwgdGVtcGVyYXR1cmUgaXMgYXNpYyByZWxhdGVkIGRhdGEsIG1v
dmUgdGhlIGNvZGUgbG9naWMgdG8NCj4geHh4X3BwdC5jLg0KPiAyLiByZXBsYWNlIGRhdGEgc3Ry
dWN0dXJlIFBQX1RlbXBlcmF0dXJlUmFuZ2Ugd2l0aA0KPiBzbXVfdGVtcGVyYXR1cmVfcmFuZ2Uu
DQo+IDMuIGNoYW5nZSB0ZW1wZXJhdHVyZSB1aW50IGZyb20gdGVtcCoxMDAwIHRvIHRlbXAgKHRl
bXBlcmF0dXJlIHVpbnQpLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogS2V2aW4gV2FuZyA8a2V2aW4x
LndhbmdAYW1kLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogS2VubmV0aCBGZW5nIDxrZW5uZXRoLmZl
bmdAYW1kLmNvbT4NCj4gQWNrZWQtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+DQo+
IC0tLQ0KPiAgLi4uL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oICAgIHwg
IDEgLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jICAgIHwg
MTcgKysrKysrKysrKw0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8w
LmMgICAgIHwgMTggKysrKysrLS0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
dmVnYTIwX3BwdC5jICAgIHwgMzQgKysrKysrLS0tLS0tLS0tLS0tLQ0KPiAgNCBmaWxlcyBjaGFu
Z2VkLCA0MCBpbnNlcnRpb25zKCspLCAzMCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oDQo+IGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaA0KPiBpbmRleCAzNDA5
M2RkY2ExMDUuLjcxMDVmODA0MTA4OCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oDQo+IEBAIC00MzksNyArNDM5LDYgQEAgc3RydWN0
IHNtdV90YWJsZV9jb250ZXh0DQo+ICAJc3RydWN0IHNtdV90YWJsZQkJKnRhYmxlczsNCj4gIAl1
aW50MzJfdAkJCXRhYmxlX2NvdW50Ow0KPiAgCXN0cnVjdCBzbXVfdGFibGUJCW1lbW9yeV9wb29s
Ow0KPiAtCXVpbnQxNl90ICAgICAgICAgICAgICAgICAgICAgICAgc29mdHdhcmVfc2h1dGRvd25f
dGVtcDsNCj4gIAl1aW50OF90ICAgICAgICAgICAgICAgICAgICAgICAgIHRoZXJtYWxfY29udHJv
bGxlcl90eXBlOw0KPiAgCXVpbnQxNl90CQkJVERQT0RMaW1pdDsNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMNCj4gYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMNCj4gaW5kZXggNDZlMjkxM2U0YWY0
Li5hNGM0ZDQ5OTcxODkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L25hdmkxMF9wcHQuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9u
YXZpMTBfcHB0LmMNCj4gQEAgLTE2MzgsNiArMTYzOCwyMiBAQCBzdGF0aWMgaW50IG5hdmkxMF9z
ZXRfcGVyZm9ybWFuY2VfbGV2ZWwoc3RydWN0DQo+IHNtdV9jb250ZXh0ICpzbXUsIGVudW0gYW1k
X2RwbV9mbw0KPiAgCXJldHVybiByZXQ7DQo+ICB9DQo+IA0KPiArc3RhdGljIGludCBuYXZpMTBf
Z2V0X3RoZXJtYWxfdGVtcGVyYXR1cmVfcmFuZ2Uoc3RydWN0IHNtdV9jb250ZXh0DQo+ICpzbXUs
DQo+ICsJCQkJCQlzdHJ1Y3QNCj4gc211X3RlbXBlcmF0dXJlX3JhbmdlICpyYW5nZSkgew0KPiAr
CXN0cnVjdCBzbXVfdGFibGVfY29udGV4dCAqdGFibGVfY29udGV4dCA9ICZzbXUtPnNtdV90YWJs
ZTsNCj4gKwlzdHJ1Y3Qgc211XzExXzBfcG93ZXJwbGF5X3RhYmxlICpwb3dlcnBsYXlfdGFibGUg
PQ0KPiArdGFibGVfY29udGV4dC0+cG93ZXJfcGxheV90YWJsZTsNCj4gKw0KPiArCWlmICghcmFu
Z2UgfHwgIXBvd2VycGxheV90YWJsZSkNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsNCj4gKwkv
KiBUaGUgdW5pdCBpcyB0ZW1wZXJhdHVyZSAqLw0KPiArCXJhbmdlLT5taW4gPSAwOw0KPiArCXJh
bmdlLT5tYXggPSBwb3dlcnBsYXlfdGFibGUtPnNvZnR3YXJlX3NodXRkb3duX3RlbXA7DQo+ICsN
Cj4gKwlyZXR1cm4gMDsNCj4gK30NCj4gKw0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBwcHRhYmxl
X2Z1bmNzIG5hdmkxMF9wcHRfZnVuY3MgPSB7DQo+ICAJLnRhYmxlc19pbml0ID0gbmF2aTEwX3Rh
Ymxlc19pbml0LA0KPiAgCS5hbGxvY19kcG1fY29udGV4dCA9IG5hdmkxMF9hbGxvY2F0ZV9kcG1f
Y29udGV4dCwgQEAgLTE2NzQsNg0KPiArMTY5MCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcHB0
YWJsZV9mdW5jcyBuYXZpMTBfcHB0X2Z1bmNzID0gew0KPiAgCS5nZXRfcHBmZWF0dXJlX3N0YXR1
cyA9IG5hdmkxMF9nZXRfcHBmZWF0dXJlX3N0YXR1cywNCj4gIAkuc2V0X3BwZmVhdHVyZV9zdGF0
dXMgPSBuYXZpMTBfc2V0X3BwZmVhdHVyZV9zdGF0dXMsDQo+ICAJLnNldF9wZXJmb3JtYW5jZV9s
ZXZlbCA9IG5hdmkxMF9zZXRfcGVyZm9ybWFuY2VfbGV2ZWwsDQo+ICsJLmdldF90aGVybWFsX3Rl
bXBlcmF0dXJlX3JhbmdlID0NCj4gbmF2aTEwX2dldF90aGVybWFsX3RlbXBlcmF0dXJlX3Jhbmdl
LA0KPiAgfTsNCj4gDQo+ICB2b2lkIG5hdmkxMF9zZXRfcHB0X2Z1bmNzKHN0cnVjdCBzbXVfY29u
dGV4dCAqc211KSBkaWZmIC0tZ2l0DQo+IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
c211X3YxMV8wLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAu
Yw0KPiBpbmRleCA3NmJjMTU3NTI1ZDAuLjRhZDllMGM1YTYzNyAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMNCj4gQEAgLTExNDcsMTAgKzExNDcsOCBA
QCBzdGF0aWMgaW50IHNtdV92MTFfMF9zZXRfdGhlcm1hbF9yYW5nZShzdHJ1Y3QNCj4gc211X2Nv
bnRleHQgKnNtdSwNCj4gIAkJCQkgICAgICAgc3RydWN0IHNtdV90ZW1wZXJhdHVyZV9yYW5nZSAq
cmFuZ2UpICB7DQo+ICAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBzbXUtPmFkZXY7DQo+
IC0JaW50IGxvdyA9IFNNVV9USEVSTUFMX01JTklNVU1fQUxFUlRfVEVNUCAqDQo+IC0JCVNNVV9U
RU1QRVJBVFVSRV9VTklUU19QRVJfQ0VOVElHUkFERVM7DQo+IC0JaW50IGhpZ2ggPSBTTVVfVEhF
Uk1BTF9NQVhJTVVNX0FMRVJUX1RFTVAgKg0KPiAtCQlTTVVfVEVNUEVSQVRVUkVfVU5JVFNfUEVS
X0NFTlRJR1JBREVTOw0KPiArCWludCBsb3cgPSBTTVVfVEhFUk1BTF9NSU5JTVVNX0FMRVJUX1RF
TVA7DQo+ICsJaW50IGhpZ2ggPSBTTVVfVEhFUk1BTF9NQVhJTVVNX0FMRVJUX1RFTVA7DQo+ICAJ
dWludDMyX3QgdmFsOw0KPiANCj4gIAlpZiAoIXJhbmdlKQ0KPiBAQCAtMTE2MSw2ICsxMTU5LDkg
QEAgc3RhdGljIGludCBzbXVfdjExXzBfc2V0X3RoZXJtYWxfcmFuZ2Uoc3RydWN0DQo+IHNtdV9j
b250ZXh0ICpzbXUsDQo+ICAJaWYgKGhpZ2ggPiByYW5nZS0+bWF4KQ0KPiAgCQloaWdoID0gcmFu
Z2UtPm1heDsNCj4gDQo+ICsJbG93ID0gbWF4KFNNVV9USEVSTUFMX01JTklNVU1fQUxFUlRfVEVN
UCwgcmFuZ2UtPm1pbik7DQo+ICsJaGlnaCA9IG1pbihTTVVfVEhFUk1BTF9NQVhJTVVNX0FMRVJU
X1RFTVAsIHJhbmdlLT5tYXgpOw0KPiArDQo+ICAJaWYgKGxvdyA+IGhpZ2gpDQo+ICAJCXJldHVy
biAtRUlOVkFMOw0KPiANCj4gQEAgLTExNjksOCArMTE3MCw4IEBAIHN0YXRpYyBpbnQgc211X3Yx
MV8wX3NldF90aGVybWFsX3JhbmdlKHN0cnVjdA0KPiBzbXVfY29udGV4dCAqc211LA0KPiAgCXZh
bCA9IFJFR19TRVRfRklFTEQodmFsLCBUSE1fVEhFUk1BTF9JTlRfQ1RSTCwNCj4gVEhFUk1fSUhf
SFdfRU5BLCAxKTsNCj4gIAl2YWwgPSBSRUdfU0VUX0ZJRUxEKHZhbCwgVEhNX1RIRVJNQUxfSU5U
X0NUUkwsDQo+IFRIRVJNX0lOVEhfTUFTSywgMCk7DQo+ICAJdmFsID0gUkVHX1NFVF9GSUVMRCh2
YWwsIFRITV9USEVSTUFMX0lOVF9DVFJMLA0KPiBUSEVSTV9JTlRMX01BU0ssIDApOw0KPiAtCXZh
bCA9IFJFR19TRVRfRklFTEQodmFsLCBUSE1fVEhFUk1BTF9JTlRfQ1RSTCwNCj4gRElHX1RIRVJN
X0lOVEgsIChoaWdoIC8NCj4gU01VX1RFTVBFUkFUVVJFX1VOSVRTX1BFUl9DRU5USUdSQURFUykp
Ow0KPiAtCXZhbCA9IFJFR19TRVRfRklFTEQodmFsLCBUSE1fVEhFUk1BTF9JTlRfQ1RSTCwNCj4g
RElHX1RIRVJNX0lOVEwsIChsb3cgLyBTTVVfVEVNUEVSQVRVUkVfVU5JVFNfUEVSX0NFTlRJR1JB
REVTKSk7DQo+ICsJdmFsID0gUkVHX1NFVF9GSUVMRCh2YWwsIFRITV9USEVSTUFMX0lOVF9DVFJM
LA0KPiBESUdfVEhFUk1fSU5USCwgKGhpZ2ggJiAweGZmKSk7DQo+ICsJdmFsID0gUkVHX1NFVF9G
SUVMRCh2YWwsIFRITV9USEVSTUFMX0lOVF9DVFJMLA0KPiBESUdfVEhFUk1fSU5UTCwgKGxvdyAm
DQo+ICsweGZmKSk7DQo+ICAJdmFsID0gdmFsICYNCj4gKH5USE1fVEhFUk1BTF9JTlRfQ1RSTF9f
VEhFUk1fVFJJR0dFUl9NQVNLX01BU0spOw0KPiANCj4gIAlXUkVHMzJfU09DMTUoVEhNLCAwLCBt
bVRITV9USEVSTUFMX0lOVF9DVFJMLCB2YWwpOyBAQCAtDQo+IDEyMDksNyArMTIxMCwxMCBAQCBz
dGF0aWMgaW50IHNtdV92MTFfMF9zdGFydF90aGVybWFsX2NvbnRyb2woc3RydWN0DQo+IHNtdV9j
b250ZXh0ICpzbXUpDQo+IA0KPiAgCWlmICghc211LT5wbV9lbmFibGVkKQ0KPiAgCQlyZXR1cm4g
cmV0Ow0KPiArDQo+ICAJcmV0ID0gc211X2dldF90aGVybWFsX3RlbXBlcmF0dXJlX3JhbmdlKHNt
dSwgJnJhbmdlKTsNCj4gKwlpZiAocmV0KQ0KPiArCQlyZXR1cm4gcmV0Ow0KPiANCj4gIAlpZiAo
c211LT5zbXVfdGFibGUudGhlcm1hbF9jb250cm9sbGVyX3R5cGUpIHsNCj4gIAkJcmV0ID0gc211
X3YxMV8wX3NldF90aGVybWFsX3JhbmdlKHNtdSwgJnJhbmdlKTsgQEAgLQ0KPiAxMjM0LDYgKzEy
MzgsOCBAQCBzdGF0aWMgaW50IHNtdV92MTFfMF9zdGFydF90aGVybWFsX2NvbnRyb2woc3RydWN0
DQo+IHNtdV9jb250ZXh0ICpzbXUpDQo+ICAJYWRldi0+cG0uZHBtLnRoZXJtYWwubWluX21lbV90
ZW1wID0gcmFuZ2UubWVtX21pbjsNCj4gIAlhZGV2LT5wbS5kcG0udGhlcm1hbC5tYXhfbWVtX2Ny
aXRfdGVtcCA9DQo+IHJhbmdlLm1lbV9jcml0X21heDsNCj4gIAlhZGV2LT5wbS5kcG0udGhlcm1h
bC5tYXhfbWVtX2VtZXJnZW5jeV90ZW1wID0NCj4gcmFuZ2UubWVtX2VtZXJnZW5jeV9tYXg7DQo+
ICsJYWRldi0+cG0uZHBtLnRoZXJtYWwubWluX3RlbXAgPSByYW5nZS5taW4gKg0KPiBTTVVfVEVN
UEVSQVRVUkVfVU5JVFNfUEVSX0NFTlRJR1JBREVTOw0KPiArCWFkZXYtPnBtLmRwbS50aGVybWFs
Lm1heF90ZW1wID0gcmFuZ2UubWF4ICoNCj4gK1NNVV9URU1QRVJBVFVSRV9VTklUU19QRVJfQ0VO
VElHUkFERVM7DQo+IA0KPiAgCXJldHVybiByZXQ7DQo+ICB9DQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMNCj4gYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMNCj4gaW5kZXggYmNkMGVmYWY3YmJkLi5kZWIx
MDJmZmVkYzIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Zl
Z2EyMF9wcHQuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBf
cHB0LmMNCj4gQEAgLTQ2Myw3ICs0NjMsNiBAQCBzdGF0aWMgaW50IHZlZ2EyMF9zdG9yZV9wb3dl
cnBsYXlfdGFibGUoc3RydWN0DQo+IHNtdV9jb250ZXh0ICpzbXUpDQo+ICAJbWVtY3B5KHRhYmxl
X2NvbnRleHQtPmRyaXZlcl9wcHRhYmxlLCAmcG93ZXJwbGF5X3RhYmxlLQ0KPiA+c21jUFBUYWJs
ZSwNCj4gIAkgICAgICAgc2l6ZW9mKFBQVGFibGVfdCkpOw0KPiANCj4gLQl0YWJsZV9jb250ZXh0
LT5zb2Z0d2FyZV9zaHV0ZG93bl90ZW1wID0gcG93ZXJwbGF5X3RhYmxlLQ0KPiA+dXNTb2Z0d2Fy
ZVNodXRkb3duVGVtcDsNCj4gIAl0YWJsZV9jb250ZXh0LT50aGVybWFsX2NvbnRyb2xsZXJfdHlw
ZSA9IHBvd2VycGxheV90YWJsZS0NCj4gPnVjVGhlcm1hbENvbnRyb2xsZXJUeXBlOw0KPiAgCXRh
YmxlX2NvbnRleHQtPlREUE9ETGltaXQgPSBsZTMyX3RvX2NwdShwb3dlcnBsYXlfdGFibGUtDQo+
ID5PdmVyRHJpdmU4VGFibGUuT0RTZXR0aW5nc01heFtBVE9NX1ZFR0EyMF9PRFNFVFRJTkdfUE9X
RVJQRVINCj4gQ0VOVEFHRV0pOw0KPiANCj4gQEAgLTMyMzUsMzUgKzMyMzQsMjQgQEAgc3RhdGlj
IGludCB2ZWdhMjBfc2V0X3dhdGVybWFya3NfdGFibGUoc3RydWN0DQo+IHNtdV9jb250ZXh0ICpz
bXUsDQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+IA0KPiAtc3RhdGljIGNvbnN0IHN0cnVjdCBzbXVf
dGVtcGVyYXR1cmVfcmFuZ2UgdmVnYTIwX3RoZXJtYWxfcG9saWN5W10gPSAtew0KPiAtCXstMjcz
MTUwLCAgOTkwMDAsIDk5MDAwLCAtMjczMTUwLCA5OTAwMCwgOTkwMDAsIC0yNzMxNTAsIDk5MDAw
LCA5OTAwMH0sDQo+IC0JeyAxMjAwMDAsIDEyMDAwMCwgMTIwMDAwLCAxMjAwMDAsIDEyMDAwMCwg
MTIwMDAwLCAxMjAwMDAsIDEyMDAwMCwNCj4gMTIwMDAwfSwNCj4gLX07DQo+IC0NCj4gIHN0YXRp
YyBpbnQgdmVnYTIwX2dldF90aGVybWFsX3RlbXBlcmF0dXJlX3JhbmdlKHN0cnVjdCBzbXVfY29u
dGV4dA0KPiAqc211LA0KPiAgCQkJCQkJc3RydWN0DQo+IHNtdV90ZW1wZXJhdHVyZV9yYW5nZSpy
YW5nZSkgIHsNCj4gLQ0KPiArCXN0cnVjdCBzbXVfdGFibGVfY29udGV4dCAqdGFibGVfY29udGV4
dCA9ICZzbXUtPnNtdV90YWJsZTsNCj4gKwlBVE9NX1ZlZ2EyMF9QT1dFUlBMQVlUQUJMRSAqcG93
ZXJwbGF5X3RhYmxlID0NCj4gK3RhYmxlX2NvbnRleHQtPnBvd2VyX3BsYXlfdGFibGU7DQo+ICAJ
UFBUYWJsZV90ICpwcHRhYmxlID0gc211LT5zbXVfdGFibGUuZHJpdmVyX3BwdGFibGU7DQo+IA0K
PiAtCWlmICghcmFuZ2UpDQo+ICsJaWYgKCFyYW5nZSB8fCAhcG93ZXJwbGF5X3RhYmxlKQ0KPiAg
CQlyZXR1cm4gLUVJTlZBTDsNCj4gDQo+IC0JbWVtY3B5KHJhbmdlLCAmdmVnYTIwX3RoZXJtYWxf
cG9saWN5WzBdLCBzaXplb2Yoc3RydWN0DQo+IHNtdV90ZW1wZXJhdHVyZV9yYW5nZSkpOw0KPiAt
DQo+IC0JcmFuZ2UtPm1heCA9IHBwdGFibGUtPlRlZGdlTGltaXQgKg0KPiAtCQlTTVVfVEVNUEVS
QVRVUkVfVU5JVFNfUEVSX0NFTlRJR1JBREVTOw0KPiAtCXJhbmdlLT5lZGdlX2VtZXJnZW5jeV9t
YXggPSAocHB0YWJsZS0+VGVkZ2VMaW1pdCArDQo+IENURl9PRkZTRVRfRURHRSkgKg0KPiAtCQlT
TVVfVEVNUEVSQVRVUkVfVU5JVFNfUEVSX0NFTlRJR1JBREVTOw0KPiAtCXJhbmdlLT5ob3RzcG90
X2NyaXRfbWF4ID0gcHB0YWJsZS0+VGhvdHNwb3RMaW1pdCAqDQo+IC0JCVNNVV9URU1QRVJBVFVS
RV9VTklUU19QRVJfQ0VOVElHUkFERVM7DQo+IC0JcmFuZ2UtPmhvdHNwb3RfZW1lcmdlbmN5X21h
eCA9IChwcHRhYmxlLT5UaG90c3BvdExpbWl0ICsNCj4gQ1RGX09GRlNFVF9IT1RTUE9UKSAqDQo+
IC0JCVNNVV9URU1QRVJBVFVSRV9VTklUU19QRVJfQ0VOVElHUkFERVM7DQo+IC0JcmFuZ2UtPm1l
bV9jcml0X21heCA9IHBwdGFibGUtPlRoYm1MaW1pdCAqDQo+IC0JCVNNVV9URU1QRVJBVFVSRV9V
TklUU19QRVJfQ0VOVElHUkFERVM7DQo+IC0JcmFuZ2UtPm1lbV9lbWVyZ2VuY3lfbWF4ID0gKHBw
dGFibGUtPlRoYm1MaW1pdCArDQo+IENURl9PRkZTRVRfSEJNKSoNCj4gLQkJU01VX1RFTVBFUkFU
VVJFX1VOSVRTX1BFUl9DRU5USUdSQURFUzsNCj4gKwkvKiBUaGUgdW5pdCBpcyB0ZW1wZXJhdHVy
ZSAqLw0KPiArCXJhbmdlLT5taW4gPSAwOw0KPiArCXJhbmdlLT5tYXggPSBwb3dlcnBsYXlfdGFi
bGUtPnVzU29mdHdhcmVTaHV0ZG93blRlbXA7DQo+ICsJcmFuZ2UtPmVkZ2VfZW1lcmdlbmN5X21h
eCA9IChwcHRhYmxlLT5UZWRnZUxpbWl0ICsNCj4gQ1RGX09GRlNFVF9FREdFKTsNCj4gKwlyYW5n
ZS0+aG90c3BvdF9jcml0X21heCA9IHBwdGFibGUtPlRob3RzcG90TGltaXQ7DQo+ICsJcmFuZ2Ut
PmhvdHNwb3RfZW1lcmdlbmN5X21heCA9IChwcHRhYmxlLT5UaG90c3BvdExpbWl0ICsNCj4gQ1RG
X09GRlNFVF9IT1RTUE9UKTsNCj4gKwlyYW5nZS0+bWVtX2NyaXRfbWF4ID0gcHB0YWJsZS0+VGhi
bUxpbWl0Ow0KPiArCXJhbmdlLT5tZW1fZW1lcmdlbmN5X21heCA9IChwcHRhYmxlLT5UaGJtTGlt
aXQgKw0KPiBDVEZfT0ZGU0VUX0hCTSk7DQo+IA0KPiANCj4gIAlyZXR1cm4gMDsNCj4gLS0NCj4g
Mi4yMi4wDQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXw0KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0KPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZw0KPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
