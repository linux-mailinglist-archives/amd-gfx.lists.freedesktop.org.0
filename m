Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A610953B8
	for <lists+amd-gfx@lfdr.de>; Tue, 20 Aug 2019 03:47:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED4CB6E5A0;
	Tue, 20 Aug 2019 01:47:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810081.outbound.protection.outlook.com [40.107.81.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D3A16E5A0
 for <amd-gfx@lists.freedesktop.org>; Tue, 20 Aug 2019 01:47:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dRAw30uVRecqG39iEf08jJKOkLJH2AbX2v86YVA4s2zbU03jDYHZW3A7if/lD5EL3p7EWeNGJvXWkKCVjP6JrxKCNrWuxX42wj2eNp+H4k9ZxX2tHcAW1GS4RayQoqayK6bYN4uCL5jv8wPrMjQBiib6HO57do23SojNFi64rKJ4xd/qoPMiyGgQVKL4R5Bsn+2zwBh5RiWAQ1ED3GdRVfB43LpILGOxmd18A4A/tEdASVvyA0a7+hotv+cLq4f2uf2LXtqME3y5WSVAm+PiHVAJITl/GzyP7osDU0F4QV0OFzlWVfMl5X4PszT1B186F6k1vFzNFTbUWEOq2SIKKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uw6gTGC/cpB37Gyjvv27o+f/P6F2wzHox9CTAX//xJE=;
 b=SXVyksRyFGw4N7SbLgr//LChKH/oDi4dQh3c1aaZwd7OaCRy2hqxIe/oTZIHH/ENQKEE/zzfU6h0Q/8yWVjm1jJwpPnfpQFkHVn+O/iubHwIGkw4cDnwQCD3/q5jAHW3hgfcbcgRGEOOdhT2JegNdg1b4f2KgfhwneVNInmRME6zSRWPsEMFm0RRxgXuxQLyGGnFITrvn9nlK7GgFQLzMUPtNSarhtd9teE7iIeKmrQK62H8amBDFDi78VBg6sCWi6ZeL41ndi0jHAwd1auEmRo+SI4ax1UMsE82Ewy0RbBVQuDD9nk4Qb8oqXIJDPwjezGIanxm3vm9K7dXCeopGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB4254.namprd12.prod.outlook.com (10.255.224.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Tue, 20 Aug 2019 01:47:11 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::6cae:3314:7799:3077]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::6cae:3314:7799:3077%6]) with mapi id 15.20.2157.024; Tue, 20 Aug 2019
 01:47:11 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: fix variable type errors in
 smu_v11_0_setup_pptable
Thread-Topic: [PATCH] drm/amd/powerplay: fix variable type errors in
 smu_v11_0_setup_pptable
Thread-Index: AQHVVqVkbw9TL9+6GkiVUFYVeD8gwKcDRGIA
Date: Tue, 20 Aug 2019 01:47:11 +0000
Message-ID: <MN2PR12MB3344F8CDC3052AA0DC872E1CE4AB0@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190819154701.17647-1-kevin1.wang@amd.com>
In-Reply-To: <20190819154701.17647-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1fb12d2-0a29-41ff-8299-08d7251051c5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4254; 
x-ms-traffictypediagnostic: MN2PR12MB4254:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4254E88C0833CD0C78EC82E9E4AB0@MN2PR12MB4254.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 013568035E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(13464003)(199004)(189003)(64756008)(486006)(478600001)(7736002)(305945005)(6306002)(11346002)(476003)(966005)(74316002)(55016002)(6436002)(9686003)(446003)(52536014)(54906003)(33656002)(5660300002)(110136005)(14454004)(25786009)(4326008)(6246003)(229853002)(99286004)(66476007)(66556008)(2501003)(8676002)(66946007)(53936002)(76176011)(81166006)(53546011)(71200400001)(71190400001)(26005)(7696005)(3846002)(102836004)(14444005)(316002)(186003)(256004)(8936002)(66066001)(86362001)(6506007)(6116002)(81156014)(76116006)(66446008)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4254;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kCIDTi9H82HgKt7YE9ZdqdcLFHnjvPnc40WRgLYhgVfTxuINBErH1D3KrdEmoekShi0lykdN3y8fGUwyC6q7ak8GMvzpEr2sgHCOD0tSV1QKGiRolJcFOXbrmKwYd7uoPb+7+LSrcXuL0ey6wOIdMMmTQTbv5NGRfP9EOdSXO5GqE6RN52o41yoM338wO1mB7o7NlWYDKguZEpvHHlISRIKxT6yR+LWnf16xTTsBEo08KQkV+b0xiBMW6Wr4kLJcvSu1ri7qpyeJCU2ol0rREpjM5xwBCIjJjFoHRlCSIy6BlBafjrLQWDVKvFYSy2eLjt/7oCpwwFCD0NvOQHhZF96jxEykl5Tieyy62o3AStA2w8ZDBb+DOSzUKKd0bBaNng1ty3op5gDk1uYRcd7w7th8DOYO8805uDYXmmY3cV4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1fb12d2-0a29-41ff-8299-08d7251051c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2019 01:47:11.6058 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lAlAzTMUGxazNVTGT90e/fY5XChL9eNC8teuzulFvSV9I6Q26CZZns6+FcNK0eIq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4254
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uw6gTGC/cpB37Gyjvv27o+f/P6F2wzHox9CTAX//xJE=;
 b=KdtJNfIQXiZil2yCQDqZy0Nmy2/nfiZp8dB8jlyyMTuDIHe303ToqfnpJS9JK/uPYwLXDM4svyELqBYn9TKhU4hhYrBg0ULtFX+kuPsJFHHM58B3lDrK3BANioPy0YbjgyYg7RKl+TEOE0BN9qvkLMOq8I+EzmatTl0KbmeZqvM=
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
Cc: "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>,
 "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGxlYXNlIGFkZCB0aGUgZm9sbG93aW5ncyB0byB0aGUgZGVzY3JpcHRpb24gcGFydC4gV2l0aCB0
aGF0IGFkZGVkLCB0aGUgcGF0Y2ggaXMgUmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFu
QGFtZC5jb20+DQoiDQpUaGlzIGZpeGVzIHRoZSBmb2xsb3dpbmcgc3RhdGljIGNoZWNrZXIgd2Fy
bmluZy4NCiAgICAgICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG93ZXJwbGF5L3Nt
dV92MTFfMC5jOjM5MCBzbXVfdjExXzBfc2V0dXBfcHB0YWJsZSgpDQogICAgICAgIHdhcm46IHBh
c3NpbmcgY2FzdGVkIHBvaW50ZXIgJyZzaXplJyB0byAnc211X2dldF9hdG9tX2RhdGFfdGFibGUo
KScgMzIgdnMgMTYuDQoiDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
YW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxm
IE9mDQo+IFdhbmcsIEtldmluKFlhbmcpDQo+IFNlbnQ6IE1vbmRheSwgQXVndXN0IDE5LCAyMDE5
IDExOjQ3IFBNDQo+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogV2Fu
ZywgS2V2aW4oWWFuZykgPEtldmluMS5XYW5nQGFtZC5jb20+Ow0KPiBkYW4uY2FycGVudGVyQG9y
YWNsZS5jb20NCj4gU3ViamVjdDogW1BBVENIXSBkcm0vYW1kL3Bvd2VycGxheTogZml4IHZhcmlh
YmxlIHR5cGUgZXJyb3JzIGluDQo+IHNtdV92MTFfMF9zZXR1cF9wcHRhYmxlDQo+IA0KPiBmaXgg
c2l6ZSB0eXBlIGVycm9ycywgZnJvbSB1aW50MzJfdCB0byB1aW50MTZfdC4NCj4gaXQgd2lsbCBj
YXVzZSBvbmx5IGluaXRpYWxpemVzIHRoZSBoaWdoZXN0IDE2IGJpdHMgaW4NCj4gc211X2dldF9h
dG9tX2RhdGFfdGFibGUgZnVuY3Rpb24uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBLZXZpbiBXYW5n
IDxrZXZpbjEud2FuZ0BhbWQuY29tPg0KPiBSZXBvcnRlZC1ieTogRGFuIENhcnBlbnRlciA8ZGFu
LmNhcnBlbnRlckBvcmFjbGUuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L3NtdV92MTFfMC5jIHwgNCArKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9zbXVfdjExXzAuYw0KPiBpbmRleCBiNjk2MzJmZTg1NmIuLmU5YTAyMjQ0N2FjMSAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMNCj4gQEAgLTM2
OCw2ICszNjgsNyBAQCBzdGF0aWMgaW50IHNtdV92MTFfMF9zZXR1cF9wcHRhYmxlKHN0cnVjdA0K
PiBzbXVfY29udGV4dCAqc211KQ0KPiAgCWNvbnN0IHN0cnVjdCBzbWNfZmlybXdhcmVfaGVhZGVy
X3YxXzAgKmhkcjsNCj4gIAlpbnQgcmV0LCBpbmRleDsNCj4gIAl1aW50MzJfdCBzaXplOw0KPiAr
CXVpbnQxNl90IGF0b21fdGFibGVfc2l6ZTsNCj4gIAl1aW50OF90IGZyZXYsIGNyZXY7DQo+ICAJ
dm9pZCAqdGFibGU7DQo+ICAJdWludDE2X3QgdmVyc2lvbl9tYWpvciwgdmVyc2lvbl9taW5vcjsN
Cj4gQEAgLTM5NSwxMCArMzk2LDExIEBAIHN0YXRpYyBpbnQgc211X3YxMV8wX3NldHVwX3BwdGFi
bGUoc3RydWN0DQo+IHNtdV9jb250ZXh0ICpzbXUpDQo+ICAJCWluZGV4ID0NCj4gZ2V0X2luZGV4
X2ludG9fbWFzdGVyX3RhYmxlKGF0b21fbWFzdGVyX2xpc3Rfb2ZfZGF0YV90YWJsZXNfdjJfMSwN
Cj4gIAkJCQkJCSAgICBwb3dlcnBsYXlpbmZvKTsNCj4gDQo+IC0JCXJldCA9IHNtdV9nZXRfYXRv
bV9kYXRhX3RhYmxlKHNtdSwgaW5kZXgsICh1aW50MTZfdA0KPiAqKSZzaXplLCAmZnJldiwgJmNy
ZXYsDQo+ICsJCXJldCA9IHNtdV9nZXRfYXRvbV9kYXRhX3RhYmxlKHNtdSwgaW5kZXgsDQo+ICZh
dG9tX3RhYmxlX3NpemUsICZmcmV2LCAmY3JldiwNCj4gIAkJCQkJICAgICAgKHVpbnQ4X3QgKiop
JnRhYmxlKTsNCj4gIAkJaWYgKHJldCkNCj4gIAkJCXJldHVybiByZXQ7DQo+ICsJCXNpemUgPSBh
dG9tX3RhYmxlX3NpemU7DQo+ICAJfQ0KPiANCj4gIAlpZiAoIXNtdS0+c211X3RhYmxlLnBvd2Vy
X3BsYXlfdGFibGUpDQo+IC0tDQo+IDIuMjIuMA0KPiANCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4gYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
