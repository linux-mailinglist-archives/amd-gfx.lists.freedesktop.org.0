Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AAADF1C0
	for <lists+amd-gfx@lfdr.de>; Mon, 21 Oct 2019 17:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57389894C9;
	Mon, 21 Oct 2019 15:40:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690040.outbound.protection.outlook.com [40.107.69.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20DBC894C9
 for <amd-gfx@lists.freedesktop.org>; Mon, 21 Oct 2019 15:40:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K2XX7CSC8LHdtMx15BD/jRF6deGFtNHIPOjmEXcuzoA3Wq4+Qe6mvGU/IsWd2dxfB6h/zaBICRCkuOEuKC0EW2+/t3CASg0iJvEPvmW9U776xulQyxkY3PI5q1LfK65CdPvYXAFNAR/5muubsFo2VSy8mf4UDelypUEMDaU+rV38GpZwVh/fPm6E5ovuFn9xM2YYzrFktzBqJcAB1fRcIf87qg5e2zEAWlovFUXKXKhLS5Yc+hsDPvrfcCIAB1ye9cB9mNhNzRaN8KP0IZ4i6wrvBA46own2FvOW5wImsxfDLa46O8fTMlxKztydDNostyS/FyIVfBHpIV4ujdjwBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iu71rH5c4Y0hi20jZz2QmeH29fzJDfd3i/AFrEFGUl4=;
 b=Y+R7zFqCEnnEbup556CmXFEgpUDGqv3DEJd9RdLRKBeyTfE7QTmBnEl1paCLqwli8vruvuA43h9UGx5/Rm1NPJMMNKoHzIeiPGXJ2q4SFcfe1DAf3uSJyP2T8kum7qmLbHxb4qLh2BMo0XthB3ZAJzZ3U/g2uwXYv2QImqnouPk5wdpWrfnQvgDtF74K2h9b2czZv1B3R08rkMPQtsyP2NDDCTyOgG5RChZYlDmXxNM74bU3m1xx5iwOWJMjPlA6kJxBgaMoMmtPrdgiGnHc2qoMp59l5HtAu8iT3LvkOfrk+3RrbA+8Hwmgsn+hftN0bzE3P/Viwyyu/q9/EsB8Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Mon, 21 Oct 2019 15:40:53 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::f16d:2fda:9e18:a554]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::f16d:2fda:9e18:a554%12]) with mapi id 15.20.2347.029; Mon, 21 Oct
 2019 15:40:53 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Chen, Guchun" <Guchun.Chen@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>, "Li,
 Dennis" <Dennis.Li@amd.com>, "Grodzovsky, Andrey"
 <Andrey.Grodzovsky@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>
Subject: RE: [PATCH] drm/amdgpu: refine reboot debugfs operation in ras case
Thread-Topic: [PATCH] drm/amdgpu: refine reboot debugfs operation in ras case
Thread-Index: AQHVh/KKgBKsqoknkku6xUwTjLtcV6dlO9Lg
Date: Mon, 21 Oct 2019 15:40:52 +0000
Message-ID: <BN6PR12MB18090F5D406FEC27FF168726F7690@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20191021093245.28945-1-guchun.chen@amd.com>
In-Reply-To: <20191021093245.28945-1-guchun.chen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8608de4b-7ab6-401a-a83b-08d7563d0e76
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN6PR12MB1809:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB180907B476D5DCB5767405BFF7690@BN6PR12MB1809.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:284;
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(346002)(366004)(39860400002)(189003)(199004)(13464003)(54906003)(486006)(86362001)(25786009)(6636002)(256004)(74316002)(33656002)(55016002)(6306002)(9686003)(52536014)(7736002)(305945005)(8936002)(110136005)(11346002)(476003)(102836004)(2906002)(5660300002)(6506007)(53546011)(478600001)(316002)(66066001)(26005)(446003)(186003)(71200400001)(71190400001)(4326008)(81156014)(81166006)(8676002)(6116002)(14454004)(3846002)(66476007)(66556008)(229853002)(6436002)(966005)(66446008)(64756008)(76116006)(66946007)(6246003)(7696005)(76176011)(2501003)(99286004)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1809;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FeMsi+9x1gKbfPItBELB+eNu2nWqSGoqMjvJYIrcmdx4vg4nLKgvZYaKoGvxHSkop5IsblLm5aSMSmBXQGWm5DCu+VoehyzS4Ri/P4dTx4gPU0WMx3noeETDpW5VkvKuDzz6ryIVeEFMYxNzB2FKyaAOTDAlodRguVkajuVK6hH4f+jd78v+0TIyVz9ITxtAoNZLOfR9o/Q2/oAdhpqbUh5GphM+t6TmwB4Rq58jtBnTDoHcu7IrTc9K5NqxsLms5NdwOyVN+B6QVJmJvT/8m+fMtr/WGhjQ9rB0f8G6zK6WPkJYo5d+FnnIvsuhY30wWYShv8VEVD5u/zVFGm2jz5K5xLS5HF8xxO6PCjloMZy5YJmhAMsr8Sa8M02nTIYt2bsJyEmISl7Naleo/Q8PluTZ4RGA56VhdQE0WkzbhD/LwuEbU9go7GM4KKOcMzbLjzqbXbomykwEqv9xlE8c4DIvyqPclw7DlvXq+QrcLuk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8608de4b-7ab6-401a-a83b-08d7563d0e76
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2019 15:40:52.9956 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5vI/rYSYGdhoQ0uZt5dfJCrScQcVHJJuZJXv2YCtc3Lq03E1s6ev5w4PyQXEUHQEj8RHUuKEPCXEwe1nOXIvIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1809
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iu71rH5c4Y0hi20jZz2QmeH29fzJDfd3i/AFrEFGUl4=;
 b=D1JH6pJuCes9y05bbS/DUGonHnneKPSEbusk4zvdSHukpbcxMgQLawIX2zkhyoE06AGlrR7c7pqavYpbt6XkffWcdxze+awJWNB2HCBml9V+/j7EIEjsjNNDGwdnDDuufm+Y3zR1Hl9ARjPI4fJlOhBf2/Hf2I//TZVc31pi+Ko=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Alexander.Deucher@amd.com; 
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
Cc: "Li, Candice" <Candice.Li@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gQ2hlbiwgR3VjaHVu
DQo+IFNlbnQ6IE1vbmRheSwgT2N0b2JlciAyMSwgMjAxOSA1OjMzIEFNDQo+IFRvOiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgS29lbmlnLCBDaHJpc3RpYW4NCj4gPENocmlzdGlhbi5L
b2VuaWdAYW1kLmNvbT47IFpoYW5nLCBIYXdraW5nDQo+IDxIYXdraW5nLlpoYW5nQGFtZC5jb20+
OyBMaSwgRGVubmlzIDxEZW5uaXMuTGlAYW1kLmNvbT47DQo+IEdyb2R6b3Zza3ksIEFuZHJleSA8
QW5kcmV5Lkdyb2R6b3Zza3lAYW1kLmNvbT47IFpob3UxLCBUYW8NCj4gPFRhby5aaG91MUBhbWQu
Y29tPg0KPiBDYzogTGksIENhbmRpY2UgPENhbmRpY2UuTGlAYW1kLmNvbT47IENoZW4sIEd1Y2h1
bg0KPiA8R3VjaHVuLkNoZW5AYW1kLmNvbT4NCj4gU3ViamVjdDogW1BBVENIXSBkcm0vYW1kZ3B1
OiByZWZpbmUgcmVib290IGRlYnVnZnMgb3BlcmF0aW9uIGluIHJhcyBjYXNlDQo+IA0KPiBSYXMg
cmVib290IGRlYnVnZnMgbm9kZSBhbGxvd3MgdXNlciBvbmUgZWFzeSBjb250cm9sIHRvIGF2b2lk
IGdwdSByZWNvdmVyeQ0KPiBoYW5nIHByb2JsZW0gYW5kIGRpcmVjdGx5IHJlYm9vdCBzeXN0ZW0g
cGVyIGNhcmQgYmFzaXMsIGFmdGVyIHJhcw0KPiB1bmNvcnJlY3RhYmxlIGVycm9yIGhhcHBlbnMu
IEhvd2V2ZXIsIGl0IGlzIG9uZSBjb21tb24gZW50cnksIHdoaWNoDQo+IHNob3VsZCBnZXQgcmlk
IG9mIHJhc19jdHJsIG5vZGUgYW5kIHJlbW92ZSBpcCBkZXBlbmRlbmNlIHdoZW4gaW5wdXR0aW5n
IGJ5DQo+IHVzZXIuIFNvIGFkZCBvbmUgbmV3IGF1dG9fcmVib290IG5vZGUgaW4gcmFzIGRlYnVn
ZnMgZGlyIHRvIGFjaGlldmUgdGhpcy4NCj4gDQo+IHYyOiBpbiBjb21taXQgbXNzYWdlLCBhZGQg
anVzdGlmaWNhdGlvbiB3aHkgcmFzIHJlYm9vdCBkZWJ1Z2ZzIG5vZGUgaXMNCj4gbmVlZGVkLg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogR3VjaHVuIENoZW4gPGd1Y2h1bi5jaGVuQGFtZC5jb20+DQoN
ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQoN
Cj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgfCA1Nw0K
PiArKysrKysrKysrKysrKysrKysrKysrLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNTAgaW5zZXJ0
aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcmFzLmMNCj4gaW5kZXggNjIyMDM5NDUyMWU0Li42NDUwMDY1Yjg4ZGUgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYw0KPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMNCj4gQEAgLTE1Myw4ICsx
NTMsNiBAQCBzdGF0aWMgaW50DQo+IGFtZGdwdV9yYXNfZGVidWdmc19jdHJsX3BhcnNlX2RhdGEo
c3RydWN0IGZpbGUgKmYsDQo+ICAJCW9wID0gMTsNCj4gIAllbHNlIGlmIChzc2NhbmYoc3RyLCAi
aW5qZWN0ICUzMnMgJThzIiwgYmxvY2tfbmFtZSwgZXJyKSA9PSAyKQ0KPiAgCQlvcCA9IDI7DQo+
IC0JZWxzZSBpZiAoc3NjYW5mKHN0ciwgInJlYm9vdCAlMzJzIiwgYmxvY2tfbmFtZSkgPT0gMSkN
Cj4gLQkJb3AgPSAzOw0KPiAgCWVsc2UgaWYgKHN0clswXSAmJiBzdHJbMV0gJiYgc3RyWzJdICYm
IHN0clszXSkNCj4gIAkJLyogYXNjaWkgc3RyaW5nLCBidXQgY29tbWFuZHMgYXJlIG5vdCBtYXRj
aGVkLiAqLw0KPiAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gQEAgLTIxOCwxMiArMjE2LDExIEBAIHN0
YXRpYyBzdHJ1Y3QgcmFzX21hbmFnZXINCj4gKmFtZGdwdV9yYXNfZmluZF9vYmooc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICAgKiB2YWx1ZSB0byB0aGUgYWRkcmVzcy4NCj4gICAqDQo+
ICAgKiBTZWNvbmQgbWVtYmVyOiBzdHJ1Y3QgcmFzX2RlYnVnX2lmOjpvcC4NCj4gLSAqIEl0IGhh
cyBmb3VyIGtpbmRzIG9mIG9wZXJhdGlvbnMuDQo+ICsgKiBJdCBoYXMgdGhyZWUga2luZHMgb2Yg
b3BlcmF0aW9ucy4NCj4gICAqDQo+ICAgKiAtIDA6IGRpc2FibGUgUkFTIG9uIHRoZSBibG9jay4g
VGFrZSA6OmhlYWQgYXMgaXRzIGRhdGEuDQo+ICAgKiAtIDE6IGVuYWJsZSBSQVMgb24gdGhlIGJs
b2NrLiBUYWtlIDo6aGVhZCBhcyBpdHMgZGF0YS4NCj4gICAqIC0gMjogaW5qZWN0IGVycm9ycyBv
biB0aGUgYmxvY2suIFRha2UgOjppbmplY3QgYXMgaXRzIGRhdGEuDQo+IC0gKiAtIDM6IHJlYm9v
dCBvbiB1bnJlY292ZXJhYmxlIGVycm9yDQo+ICAgKg0KPiAgICogSG93IHRvIHVzZSB0aGUgaW50
ZXJmYWNlPw0KPiAgICogcHJvZ3JhbXM6DQo+IEBAIC0zMDUsOSArMzAyLDYgQEAgc3RhdGljIHNz
aXplX3QgYW1kZ3B1X3Jhc19kZWJ1Z2ZzX2N0cmxfd3JpdGUoc3RydWN0DQo+IGZpbGUgKmYsIGNv
bnN0IGNoYXIgX191c2VyICoNCj4gIAkJLyogZGF0YS5pbmplY3QuYWRkcmVzcyBpcyBvZmZzZXQg
aW5zdGVhZCBvZiBhYnNvbHV0ZSBncHUNCj4gYWRkcmVzcyAqLw0KPiAgCQlyZXQgPSBhbWRncHVf
cmFzX2Vycm9yX2luamVjdChhZGV2LCAmZGF0YS5pbmplY3QpOw0KPiAgCQlicmVhazsNCj4gLQlj
YXNlIDM6DQo+IC0JCWFtZGdwdV9yYXNfZ2V0X2NvbnRleHQoYWRldiktPnJlYm9vdCA9IHRydWU7
DQo+IC0JCWJyZWFrOw0KPiAgCWRlZmF1bHQ6DQo+ICAJCXJldCA9IC1FSU5WQUw7DQo+ICAJCWJy
ZWFrOw0KPiBAQCAtMzQ2LDYgKzM0MCw0NiBAQCBzdGF0aWMgc3NpemVfdA0KPiBhbWRncHVfcmFz
X2RlYnVnZnNfZWVwcm9tX3dyaXRlKHN0cnVjdCBmaWxlICpmLCBjb25zdCBjaGFyIF9fdXNlcg0K
PiAgCXJldHVybiByZXQgPT0gMSA/IHNpemUgOiAtRUlPOw0KPiAgfQ0KPiANCj4gKy8qKg0KPiAr
ICogRE9DOiBBTURHUFUgUkFTIGRlYnVnZnMgYXV0byByZWJvb3QgaW50ZXJmYWNlDQo+ICsgKg0K
PiArICogQWZ0ZXIgb25lIHVuY29ycmVjdGFibGUgZXJyb3IgaGFwcGVucywgR1BVIHJlY292ZXJ5
IHdpbGwgYmUgc2NoZWR1bGVkLg0KPiArICogRHVlIHRvIHRoZSBrbm93biBwcm9ibGVtIGluIEdQ
VSByZWNvdmVyeSBmYWlsaW5nIHRvIGJyaW5nIEdQVSBiYWNrLA0KPiArdGhpcw0KPiArICogaW50
ZXJmYWNlIHByb3ZpZGVzIG9uZSBkaXJlY3Qgd2F5IHRvIHVzZXIgdG8gcmVib290IHN5c3RlbQ0K
PiArYXV0b21hdGljYWxseQ0KPiArICogaW4gc3VjaCBjYXNlIHdpdGhpbiBFUlJFVkVOVF9BVEhV
Ql9JTlRFUlJVUFQgZ2VuZXJhdGVkLiBOb3JtYWwNCj4gR1BVDQo+ICtyZWNvdmVyeQ0KPiArICog
cm91dGluZSB3aWxsIG5ldmVyIGJlIGNhbGxlZC4NCj4gKyAqDQo+ICsgKiBFbmFibGUgYXV0b19y
ZWJvb3Q6DQo+ICsgKg0KPiArICoJZWNobyAxID4gL3N5cy9rZXJuZWwvZGVidWcvZHJpL3gvcmFz
L2F1dG9fcmVib290DQo+ICsgKg0KPiArICogUmV2ZXJ0IGF1dG9fcmVib290Og0KPiArICoNCj4g
KyAqIAllY2hvIDAgPiAvc3lzL2tlcm5lbC9kZWJ1Zy9kcmkveC9yYXMvYXV0b19yZWJvb3QNCj4g
KyAqDQo+ICsgKi8NCj4gK3N0YXRpYyBzc2l6ZV90IGFtZGdwdV9yYXNfZGVidWdmc19yZWJvb3Rf
d3JpdGUoc3RydWN0IGZpbGUgKmYsDQo+ICsJY29uc3QgY2hhciBfX3VzZXIgKmJ1Ziwgc2l6ZV90
IHNpemUsIGxvZmZfdCAqcG9zKSB7DQo+ICsJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPQ0K
PiArCQkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKilmaWxlX2lub2RlKGYpLT5pX3ByaXZhdGU7DQo+
ICsJY2hhciB0bXBbOF0gPSB7MH07DQo+ICsJaW50IHZhbHVlID0gLTE7DQo+ICsNCj4gKwlpZiAo
c2l6ZSAhPSBzaW1wbGVfd3JpdGVfdG9fYnVmZmVyKHRtcCwgc2l6ZW9mKHRtcCksIHBvcywgYnVm
LCBzaXplKSkNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsNCj4gKwlpZiAoa3N0cnRvaW50KHRt
cCwgMTAsICZ2YWx1ZSkpDQo+ICsJCXJldHVybiAtRUlOVkFMOw0KPiArDQo+ICsJaWYgKHZhbHVl
ID09IDEpDQo+ICsJCWFtZGdwdV9yYXNfZ2V0X2NvbnRleHQoYWRldiktPnJlYm9vdCA9IHRydWU7
DQo+ICsJZWxzZSBpZiAodmFsdWUgPT0gMCkNCj4gKwkJYW1kZ3B1X3Jhc19nZXRfY29udGV4dChh
ZGV2KS0+cmVib290ID0gZmFsc2U7DQo+ICsNCj4gKwlyZXR1cm4gc2l6ZTsNCj4gK30NCj4gKw0K
PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlvbnMgYW1kZ3B1X3Jhc19kZWJ1Z2Zz
X2N0cmxfb3BzID0gew0KPiAgCS5vd25lciA9IFRISVNfTU9EVUxFLA0KPiAgCS5yZWFkID0gTlVM
TCwNCj4gQEAgLTM2MCw2ICszOTQsMTMgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJh
dGlvbnMNCj4gYW1kZ3B1X3Jhc19kZWJ1Z2ZzX2VlcHJvbV9vcHMgPSB7DQo+ICAJLmxsc2VlayA9
IGRlZmF1bHRfbGxzZWVrDQo+ICB9Ow0KPiANCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9v
cGVyYXRpb25zIGFtZGdwdV9yYXNfZGVidWdmc19yZWJvb3Rfb3BzID0gew0KPiArCS5vd25lciA9
IFRISVNfTU9EVUxFLA0KPiArCS5yZWFkID0gTlVMTCwNCj4gKwkud3JpdGUgPSBhbWRncHVfcmFz
X2RlYnVnZnNfcmVib290X3dyaXRlLA0KPiArCS5sbHNlZWsgPSBkZWZhdWx0X2xsc2Vlaw0KPiAr
fTsNCj4gKw0KPiAgLyoqDQo+ICAgKiBET0M6IEFNREdQVSBSQVMgc3lzZnMgRXJyb3IgQ291bnQg
SW50ZXJmYWNlDQo+ICAgKg0KPiBAQCAtMTAzNyw2ICsxMDc4LDggQEAgc3RhdGljIHZvaWQNCj4g
YW1kZ3B1X3Jhc19kZWJ1Z2ZzX2NyZWF0ZV9jdHJsX25vZGUoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpDQo+ICAJCQkJYWRldiwgJmFtZGdwdV9yYXNfZGVidWdmc19jdHJsX29wcyk7DQo+ICAJ
ZGVidWdmc19jcmVhdGVfZmlsZSgicmFzX2VlcHJvbV9yZXNldCIsIFNfSVdVR08gfCBTX0lSVUdP
LA0KPiBjb24tPmRpciwNCj4gIAkJCQlhZGV2LCAmYW1kZ3B1X3Jhc19kZWJ1Z2ZzX2VlcHJvbV9v
cHMpOw0KPiArCWRlYnVnZnNfY3JlYXRlX2ZpbGUoImF1dG9fcmVib290IiwgU19JV1VHTyB8IFNf
SVJVR08sIGNvbi0+ZGlyLA0KPiArCQkJCWFkZXYsICZhbWRncHVfcmFzX2RlYnVnZnNfcmVib290
X29wcyk7DQo+ICB9DQo+IA0KPiAgdm9pZCBhbWRncHVfcmFzX2RlYnVnZnNfY3JlYXRlKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiAtLQ0KPiAyLjE3LjENCj4gDQo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGFtZC1nZnggbWFpbGluZyBs
aXN0DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
