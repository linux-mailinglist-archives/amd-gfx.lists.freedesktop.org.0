Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB088D4AEA
	for <lists+amd-gfx@lfdr.de>; Sat, 12 Oct 2019 01:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9A46ECA3;
	Fri, 11 Oct 2019 23:23:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770048.outbound.protection.outlook.com [40.107.77.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 920016ECA3
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 23:23:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xao4sK55Pi7dinBYE0MBDUNbteGvdCncQTauVUxW1dm4FsxZbtF4G+8CGDBt35yG8kRAHHnuLPfVsI45l2fASfNEtKL+BGSNrrJfSPkEaPSc87A+YKP/ydTkdXQsAX7ukQbQbNraxza/1We/jkePs5GTYXGUhlQF3vazH2/3bRPOhl3tCfJDN9fPZKxesR5vd1StBncN8DwQdEKsYHow/b8q1YARIsqls0JrwQ7NRt4Ks1kpEzpKSA5LYFoFHd8D53lfNePLGEG5D5hPPOlamXKk6JEvQHNm3LDffxdTfmk+ioos1bslzwNfd3nC78DirDML1PvFb2ZL2/1+yYbp1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2AEFYW54Lr0GnNJm7r4bpKY2G81E5LlnMpEpCO6ACI=;
 b=hu7tNehlxVqY/+CJSJJdAFCl5niR+/kl3AVeVtYqMBEe0XW/jOcdoItvt8bcfgaOmHgDfqaiFuDhOEYHPFcx1zyt0muvePhQ/O8vh0s8YQa1F3Emn0DLmWPmJ8vbYBlD1e3GA8LMd0mqLlb9+obCM7RgU36xxvFgL37fzghMh3w5u3gcrZooVCnDPP9ddi7p0TrSiG9RC816jxC1Emh/7vgAp/vZBpO3IRi6MqQN1kLXp99pPUW6GQLFIlLJReyYKXMBfjuABU1ppmURAZ6saewB9OT0o8BzOLb0S4MjdThVG7XZexxRJR8yMxFbpeqP5AMzUuUE7g8RswkmaQYO+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BY5PR12MB4146.namprd12.prod.outlook.com (52.135.55.88) by
 BY5PR12MB3954.namprd12.prod.outlook.com (10.255.139.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Fri, 11 Oct 2019 23:23:45 +0000
Received: from BY5PR12MB4146.namprd12.prod.outlook.com
 ([fe80::915:89b2:7fad:ccfc]) by BY5PR12MB4146.namprd12.prod.outlook.com
 ([fe80::915:89b2:7fad:ccfc%7]) with mapi id 15.20.2347.016; Fri, 11 Oct 2019
 23:23:45 +0000
From: "Tuikov, Luben" <Luben.Tuikov@amd.com>
To: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 7/8] drm/amdgpu: reserve vram for memory training
Thread-Topic: [PATCH 7/8] drm/amdgpu: reserve vram for memory training
Thread-Index: AQHVf+ci7+8ZuG1qz0CMGsnl0wyJe6dWFggA
Date: Fri, 11 Oct 2019 23:23:44 +0000
Message-ID: <9084e67e-adc2-b512-b593-ca218c17a366@amd.com>
References: <20191011035033.24935-1-tianci.yin@amd.com>
 <20191011035033.24935-7-tianci.yin@amd.com>
In-Reply-To: <20191011035033.24935-7-tianci.yin@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0019.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::32) To BY5PR12MB4146.namprd12.prod.outlook.com
 (2603:10b6:a03:20d::24)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dbc9c480-eb7c-4896-b911-08d74ea20f6c
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BY5PR12MB3954:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB3954428BC024BDEEC45DF20599970@BY5PR12MB3954.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(136003)(346002)(366004)(199004)(189003)(8676002)(52116002)(71200400001)(66946007)(5660300002)(298455003)(6436002)(31686004)(6512007)(54906003)(8936002)(110136005)(36756003)(102836004)(316002)(71190400001)(6506007)(81156014)(53546011)(386003)(478600001)(81166006)(2501003)(6116002)(229853002)(256004)(64756008)(2906002)(446003)(4326008)(11346002)(66476007)(2616005)(6486002)(66556008)(66446008)(3846002)(31696002)(66066001)(99286004)(6246003)(4001150100001)(14454004)(186003)(7736002)(25786009)(476003)(76176011)(86362001)(26005)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB3954;
 H:BY5PR12MB4146.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ob2WgpqeFszZDwvxzgHPJ0ZqeQTKeS7PYwTgGshtxZX+n8RtmuZaOxfRkKrceZZUrwL3zqmmFIaWkM+8XUjwtmqyQZoDnzQ+CM7PK3uEQ6R6dkbhPzEfacPH3cbZoeOQEHjOKg9l5beXRTzklShK56CrT1krVGQqucqxuqTjRFm97KD8V5Ele3f4htmt1rnAcIz1NPeGJ6DT4CAqcVZtaJeFrXPMQ8Tjf3DCM5IbtLz08HuCHNbGTDUDsZWA0WqqQscHKB6S13Oym8E/5a+TDWFxbg3UQfollyfXYMiQ57yTSTLilgUqVdaPREPAM4vOcX3vERlRtQBoVza0QRn20Z20g+TxbORgIT7t+mcTSv6DqCZtneqfyEkd1/D9YYZIPAGCh/wcOhqqRX2e+Fa1AURmKs07fMsDJ65T8/uROeM=
Content-ID: <E66818B8202067438DED2FF0D274659E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbc9c480-eb7c-4896-b911-08d74ea20f6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 23:23:44.8398 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mmsU3w2FRVLACFQhE11w9HHI2pv/ZluPHyDjQ44ub/+Xkql+sc7zrLAZ8FPn3k0g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3954
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2AEFYW54Lr0GnNJm7r4bpKY2G81E5LlnMpEpCO6ACI=;
 b=kHlTVJQRozwGZyZUrGMPPeJKRfWuljuBCF2RPm25+aWqlHW6vukk6kxPWpecXYH4WmKplaQ0DwAs+ZO97c2/+/ht0KZwApFd19kFprF7ve61rOnHD10O2R6oOBOW9iDRW1+aMTt3u0EpRB82u8wbyAPjhfqranHjvCQ+5mw65Dk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Luben.Tuikov@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0xMCAxMTo1MCBwLm0uLCBUaWFuY2kgWWluIHdyb3RlOg0KPiBGcm9tOiAiVGlh
bmNpLllpbiIgPHRpYW5jaS55aW5AYW1kLmNvbT4NCj4gDQo+IG1lbW9yeSB0cmFpbmluZyB1c2lu
ZyBzcGVjaWZpYyBmaXhlZCB2cmFtIHNlZ21lbnQsIHJlc2VydmUgdGhlc2UNCj4gc2VnbWVudHMg
YmVmb3JlIGFueW9uZSBtYXkgYWxsb2NhdGUgaXQuDQo+IA0KPiBDaGFuZ2UtSWQ6IEkxNDM2NzU1
ODEzYTU2NTYwOGEyODU3YTY4M2Y1MzUzNzc2MjBhNjM3DQo+IFJldmlld2VkLWJ5OiBBbGV4IERl
dWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFRpYW5j
aS5ZaW4gPHRpYW5jaS55aW5AYW1kLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdHRtLmMgfCA5NiArKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAx
IGZpbGUgY2hhbmdlZCwgOTYgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV90dG0uYw0KPiBpbmRleCA5ZGE2MzUwYTRiYTIuLjQyZDBmY2I5ODM4MiAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYw0KPiBAQCAtMTY2
Nyw2ICsxNjY3LDkzIEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3R0bV9md19yZXNlcnZlX3ZyYW1faW5p
dChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4gIAkJCQkJICAmYWRldi0+ZndfdnJhbV91
c2FnZS52YSk7DQo+ICB9DQo+ICANCj4gKy8qDQo+ICsgKiBNZW1veSB0cmFpbmluZyByZXNlcnZh
dGlvbiBmdW5jdGlvbnMNCj4gKyAqLw0KPiArDQo+ICsvKioNCj4gKyAqIGFtZGdwdV90dG1fdHJh
aW5pbmdfcmVzZXJ2ZV92cmFtX2ZpbmkgLSBmcmVlIG1lbW9yeSB0cmFpbmluZyByZXNlcnZlZCB2
cmFtDQo+ICsgKg0KPiArICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcg0KPiArICoNCj4g
KyAqIGZyZWUgbWVtb3J5IHRyYWluaW5nIHJlc2VydmVkIHZyYW0gaWYgaXQgaGFzIGJlZW4gcmVz
ZXJ2ZWQuDQo+ICsgKi8NCj4gK3N0YXRpYyBpbnQgYW1kZ3B1X3R0bV90cmFpbmluZ19yZXNlcnZl
X3ZyYW1fZmluaShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4gK3sNCj4gKwlzdHJ1Y3Qg
cHNwX21lbW9yeV90cmFpbmluZ19jb250ZXh0ICpjdHggPSAmYWRldi0+cHNwLm1lbV90cmFpbl9j
dHg7DQo+ICsNCj4gKwljdHgtPmluaXQgPSBQU1BfTUVNX1RSQUlOX05PVF9TVVBQT1JUOw0KPiAr
CWlmIChjdHgtPmMycF9ibykgew0KPiArCQlhbWRncHVfYm9fZnJlZV9rZXJuZWwoJmN0eC0+YzJw
X2JvLCBOVUxMLCBOVUxMKTsNCj4gKwkJY3R4LT5jMnBfYm8gPSBOVUxMOw0KPiArCX0NCg0KR2Vu
ZXJhbGx5IGl0IGlzIGEgZ29vZCBpZGVhIHRvIHBhcmFncmFwaCB5b3VyIGNvZGUuDQpTbyBhbiBl
bXB0eSBsaW5lIGJldHdlZW4gaWYtc3RhdGVtZW50cyBpcyBhIGdvb2QgaWRlYS4NCkhvd2V2ZXIs
IHRoZXJlIGlzIG5vIG5lZWQgaW46DQoNCnJldCA9IGYoeCk7DQppZiAocmV0KSB7DQoJPGJvZHkg
b2YgY29kZT4NCn0NCg0KaWYgKGJsYWgpIHsNCgk8Ym9keSBvZiBjb2RlPg0KfQ0KDQpUaGUgYWJv
dmUgYXJlIHR3byAoMikgd2VsbC1mb3JtZWQgcGFyYWdyYXBocy4NCg0KPiArCWlmIChjdHgtPnAy
Y19ibykgew0KPiArCQlhbWRncHVfYm9fZnJlZV9rZXJuZWwoJmN0eC0+cDJjX2JvLCBOVUxMLCBO
VUxMKTsNCj4gKwkJY3R4LT5wMmNfYm8gPSBOVUxMOw0KPiArCX0NCj4gKw0KPiArCXJldHVybiAw
Ow0KPiArfQ0KPiArDQo+ICsvKioNCj4gKyAqIGFtZGdwdV90dG1fdHJhaW5pbmdfcmVzZXJ2ZV92
cmFtX2luaXQgLSBjcmVhdGUgYm8gdnJhbSByZXNlcnZhdGlvbiBmcm9tIG1lbW9yeSB0cmFpbmlu
Zw0KPiArICoNCj4gKyAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50ZXINCj4gKyAqDQo+ICsg
KiBjcmVhdGUgYm8gdnJhbSByZXNlcnZhdGlvbiBmcm9tIG1lbW9yeSB0cmFpbmluZy4NCj4gKyAq
Lw0KPiArc3RhdGljIGludCBhbWRncHVfdHRtX3RyYWluaW5nX3Jlc2VydmVfdnJhbV9pbml0KHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPiArew0KPiArCWludCByZXQ7DQo+ICsJc3RydWN0
IHBzcF9tZW1vcnlfdHJhaW5pbmdfY29udGV4dCAqY3R4ID0gJmFkZXYtPnBzcC5tZW1fdHJhaW5f
Y3R4Ow0KPiArDQo+ICsJbWVtc2V0KGN0eCwgMCwgc2l6ZW9mKCpjdHgpKTsNCj4gKwlpZiAoIWFk
ZXYtPmZ3X3ZyYW1fdXNhZ2UubWVtX3RyYWluX3N1cHBvcnQpIHsNCj4gKwkJRFJNX0RFQlVHKCJt
ZW1vcnkgdHJhaW5pbmcgZG9lcyBub3Qgc3VwcG9ydCFcbiIpOw0KPiArCQlyZXR1cm4gMDsNCj4g
Kwl9DQo+ICsNCj4gKwljdHgtPmMycF90cmFpbl9kYXRhX29mZnNldCA9IGFkZXYtPmZ3X3ZyYW1f
dXNhZ2UubWVtX3RyYWluX2ZiX2xvYzsNCj4gKwljdHgtPnAyY190cmFpbl9kYXRhX29mZnNldCA9
IChhZGV2LT5nbWMubWNfdnJhbV9zaXplIC0gR0REUjZfTUVNX1RSQUlOSU5HX09GRlNFVCk7DQo+
ICsJY3R4LT50cmFpbl9kYXRhX3NpemUgPSBHRERSNl9NRU1fVFJBSU5JTkdfREFUQV9TSVpFX0lO
X0JZVEVTOw0KPiArDQo+ICsJRFJNX0RFQlVHKCJ0cmFpbl9kYXRhX3NpemU6JWxseCxwMmNfdHJh
aW5fZGF0YV9vZmZzZXQ6JWxseCxjMnBfdHJhaW5fZGF0YV9vZmZzZXQ6JWxseC5cbiIsDQo+ICsJ
CSAgY3R4LT50cmFpbl9kYXRhX3NpemUsDQo+ICsJCSAgY3R4LT5wMmNfdHJhaW5fZGF0YV9vZmZz
ZXQsDQo+ICsJCSAgY3R4LT5jMnBfdHJhaW5fZGF0YV9vZmZzZXQpOw0KPiArDQo+ICsJcmV0ID0g
YW1kZ3B1X2JvX2NyZWF0ZV9rZXJuZWxfYXQoYWRldiwNCj4gKwkJCQkJIGN0eC0+cDJjX3RyYWlu
X2RhdGFfb2Zmc2V0LA0KPiArCQkJCQkgY3R4LT50cmFpbl9kYXRhX3NpemUsDQo+ICsJCQkJCSBB
TURHUFVfR0VNX0RPTUFJTl9WUkFNLA0KPiArCQkJCQkgJmN0eC0+cDJjX2JvLA0KPiArCQkJCQkg
TlVMTCk7DQo+ICsJaWYgKHJldCkgew0KPiArCQlEUk1fRVJST1IoImFsbG9jIHAyY19ibyBmYWls
ZWQoJWQpIVxuIiwgcmV0KTsNCj4gKwkJcmV0ID0gLUVOT01FTTsNCj4gKwkJZ290byBlcnJfb3V0
Ow0KPiArCX0NCg0KTkFLIQ0KV2h5IGFyZSB5b3UgcmUtd3JpdGluZyB0aGUgZXJyb3IgY29kZSBm
cm9tICJhbWRncHVfYm9fY3JlYXRlX2tlbnJlbF9hdCgpIj8NClBhc3MgdGhlIGVycm9yIGFzIGlz
Lg0KDQo+ICsNCj4gKwlyZXQgPSBhbWRncHVfYm9fY3JlYXRlX2tlcm5lbF9hdChhZGV2LA0KPiAr
CQkJCQkgY3R4LT5jMnBfdHJhaW5fZGF0YV9vZmZzZXQsDQo+ICsJCQkJCSBjdHgtPnRyYWluX2Rh
dGFfc2l6ZSwNCj4gKwkJCQkJIEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0sDQo+ICsJCQkJCSAmY3R4
LT5jMnBfYm8sDQo+ICsJCQkJCSBOVUxMKTsNCj4gKwlpZiAocmV0KSB7DQo+ICsJCURSTV9FUlJP
UigiYWxsb2MgYzJwX2JvIGZhaWxlZCglZCkhXG4iLCByZXQpOw0KPiArCQlyZXQgPSAtRU5PTUVN
Ow0KPiArCQlnb3RvIGVycl9vdXQ7DQo+ICsJfQ0KDQpOQUshDQpXaHkgYXJlIHlvdSByZS13cml0
aW5nIHRoZSBlcnJvciBjb2RlIGZyb20gImFtZGdwdV9ib19jcmVhdGVfa2VucmVsX2F0KCkiPw0K
UGFzcyB0aGUgZXJyb3IgYXMgaXMuDQoNCj4gKw0KPiArCWN0eC0+aW5pdCA9IFBTUF9NRU1fVFJB
SU5fUkVTRVJWRV9TVUNDRVNTOw0KPiArCXJldHVybiAwOw0KPiArDQo+ICtlcnJfb3V0Og0KDQpZ
ZXMuLi4gd2VsbCAiZXJyX291dCIgY291bGQgYmUgYW55IGlkZW50aWZpZXIsIGluY2x1ZGluZw0K
YSB2YXJpYWJsZSwgYXMgb3VyIHZhcmlhYmxlcyBmb2xsb3cgc25ha2Utbm90YXRpb24sIGFsbCBs
b3dlcmNhc2UuDQoNCkJhY2sgYXQgdGhlIHR1cm4gb2YgdGhpcyBjZW50dXJ5LCBMaW51eCBmb2xs
b3dlZCBjYXBpdGFsaXplZA0KZ290byBsYWJlbHMgdG8gZGlzdGluZ3Vpc2ggdGhlbSBmcm9tIGFu
eXRoaW5nIGVsc2UgYXJvdW5kDQppbiB0aGUga2VybmVsIGNvZGU6DQoNCglnb3RvIEJhZF9lcnI7
DQoJLi4uDQoNCglyZXR1cm4gMDsNCkJhZF9lcnI6DQoJcmV0dXJuIGJhZF9naWZ0Ow0KfQ0KDQpU
byBkaXN0aW5ndWlzaCB0aGF0IGEgY2FwaXRhbGl6ZWQgaWRlbnRpZmllciBpcyBhIGdvdG8gbGFi
ZWwsDQoiQmFkX2VyciIgYW5kIGFsbCBsb3dlci1jYXNlIGxhYmVsIGlzIGp1c3QgYW5vdGhlciB2
YXJpYWJsZQ0Kb3IgZnVuY3Rpb24gaWRlbnRpZmllciwgImJhZF9naWZ0Ii4NCg0KUmVnYXJkcywN
Ckx1YmVuDQoNCj4gKwlhbWRncHVfdHRtX3RyYWluaW5nX3Jlc2VydmVfdnJhbV9maW5pKGFkZXYp
Ow0KPiArCXJldHVybiByZXQ7DQo+ICt9DQo+ICsNCj4gIC8qKg0KPiAgICogYW1kZ3B1X3R0bV9p
bml0IC0gSW5pdCB0aGUgbWVtb3J5IG1hbmFnZW1lbnQgKHR0bSkgYXMgd2VsbCBhcyB2YXJpb3Vz
DQo+ICAgKiBndHQvdnJhbSByZWxhdGVkIGZpZWxkcy4NCj4gQEAgLTE3NDAsNiArMTgyNywxNCBA
QCBpbnQgYW1kZ3B1X3R0bV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPiAgCQly
ZXR1cm4gcjsNCj4gIAl9DQo+ICANCj4gKwkvKg0KPiArCSAqVGhlIHJlc2VydmVkIHZyYW0gZm9y
IG1lbW9yeSB0cmFpbmluZyBtdXN0IGJlIHBpbm5lZCB0byB0aGUgc3BlY2lmaWVkDQo+ICsJICpw
bGFjZSBvbiB0aGUgVlJBTSwgc28gcmVzZXJ2ZSBpdCBlYXJseS4NCj4gKwkgKi8NCj4gKwlyID0g
YW1kZ3B1X3R0bV90cmFpbmluZ19yZXNlcnZlX3ZyYW1faW5pdChhZGV2KTsNCj4gKwlpZiAocikN
Cj4gKwkJcmV0dXJuIHI7DQo+ICsNCj4gIAkvKiBhbGxvY2F0ZSBtZW1vcnkgYXMgcmVxdWlyZWQg
Zm9yIFZHQQ0KPiAgCSAqIFRoaXMgaXMgdXNlZCBmb3IgVkdBIGVtdWxhdGlvbiBhbmQgcHJlLU9T
IHNjYW5vdXQgYnVmZmVycyB0bw0KPiAgCSAqIGF2b2lkIGRpc3BsYXkgYXJ0aWZhY3RzIHdoaWxl
IHRyYW5zaXRpb25pbmcgYmV0d2VlbiBwcmUtT1MNCj4gQEAgLTE4MjUsNiArMTkyMCw3IEBAIHZv
aWQgYW1kZ3B1X3R0bV9maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPiAgCQlyZXR1
cm47DQo+ICANCj4gIAlhbWRncHVfdHRtX2RlYnVnZnNfZmluaShhZGV2KTsNCj4gKwlhbWRncHVf
dHRtX3RyYWluaW5nX3Jlc2VydmVfdnJhbV9maW5pKGFkZXYpOw0KPiAgCWFtZGdwdV90dG1fZndf
cmVzZXJ2ZV92cmFtX2ZpbmkoYWRldik7DQo+ICAJaWYgKGFkZXYtPm1tYW4uYXBlcl9iYXNlX2th
ZGRyKQ0KPiAgCQlpb3VubWFwKGFkZXYtPm1tYW4uYXBlcl9iYXNlX2thZGRyKTsNCj4gDQoNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
