Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C080DE051C
	for <lists+amd-gfx@lfdr.de>; Tue, 22 Oct 2019 15:32:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DD76E7B5;
	Tue, 22 Oct 2019 13:32:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710077.outbound.protection.outlook.com [40.107.71.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9FE16E7B5
 for <amd-gfx@lists.freedesktop.org>; Tue, 22 Oct 2019 13:32:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KjhJh/YOHRMBEukV6Qg+mevFcD0T17KLRaz+zMWc4kJ6ZDJyS+O/72GQatNZD0jA43sh29Xbx5EArcbfWfejxBs2TtTBc3HiO3jE7HZFGx1Ns58l2yFej23K45tGPqZlh/N0mtPC7GD6lATSazl5TZZnzgkaAuuh6X2uzIdfSqAPcW3ca6G9i/ySC82CAiyaeaE42ou7o4kK9EX+wchtoR/za74aV9YAVuKDxUdOjES7JpUWpQKYJBAHXdTgry9LEXeYGIGHjl+wT+KOsZl3Z2+zQon11oHjmDGr0aOPzK0VX8hBf0qrVR8g3z0vf1Mx+2P0aAe9Ddl5CpeR7y9fCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVNURDmjKsSoDvdxCgkZKcHFGWez1TLJM9g9HcKYYGw=;
 b=WSeBnQqB8dse+/AXocpHTd9wNYAhB/RsBdjQ0+Q0wz7d+2ALUcN3gmBpZAFy2a3V+39IN8yKNt3mOh1DGdk6Yf4jPgRKKyIB+7l53L7u7lI5KbWLqa2gWre04kqraXZWVitbCSJ/un5OnkisoXO01jKRtAUKRopcmDEOqZtrfCYYyYMPYMkl9bd6lDUrAlunfbSS2HrPMaGP/mR+L/xOFaN/FCEoqpmLxAcp3gLa1TryLm1LlNOQf+MPbGDaMmuVIs3yLlefADkaxCP4XO2s9nFIxIVu7Pxb/FcwMJ1DIGzRuOon09xXfA9PphXZh7jMcBz6M/Xvc6neTPlWHttbPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1187.namprd12.prod.outlook.com (10.168.226.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Tue, 22 Oct 2019 13:32:03 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::f16d:2fda:9e18:a554]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::f16d:2fda:9e18:a554%12]) with mapi id 15.20.2347.029; Tue, 22 Oct
 2019 13:32:03 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Chen, Guchun" <Guchun.Chen@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>, "Li,
 Dennis" <Dennis.Li@amd.com>, "Grodzovsky, Andrey"
 <Andrey.Grodzovsky@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>
Subject: RE: [PATCH] drm/amdgpu: refine reboot debugfs operation in ras case
 (v3)
Thread-Topic: [PATCH] drm/amdgpu: refine reboot debugfs operation in ras case
 (v3)
Thread-Index: AQHViIBvWcfkdVGdFkWgzEH1K6V/cqdmqRPw
Date: Tue, 22 Oct 2019 13:32:03 +0000
Message-ID: <BN6PR12MB18099E8CE4E27C376BB3D40CF7680@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20191022022810.10067-1-guchun.chen@amd.com>
In-Reply-To: <20191022022810.10067-1-guchun.chen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 37513165-31b8-44ab-ba14-08d756f439bc
x-ms-traffictypediagnostic: BN6PR12MB1187:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB1187FBE5AB652A842A3FA8CBF7680@BN6PR12MB1187.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1122;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(199004)(189003)(13464003)(74316002)(55016002)(7736002)(305945005)(256004)(86362001)(8936002)(66066001)(81166006)(6636002)(8676002)(81156014)(6436002)(316002)(3846002)(6116002)(6246003)(54906003)(110136005)(6306002)(9686003)(478600001)(33656002)(966005)(71200400001)(71190400001)(11346002)(446003)(53546011)(6506007)(76176011)(2906002)(7696005)(99286004)(102836004)(26005)(186003)(14454004)(4326008)(5660300002)(25786009)(486006)(76116006)(66476007)(52536014)(66946007)(64756008)(66556008)(66446008)(476003)(2501003)(229853002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1187;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EI8lLPLsLxhm1VUOQ8PgBqtY11YLxUn0f0PXcsz+xdOQFtGGAgNbq/8pW9FWpHTKAHa2ZeiDEFcqNKMAheNGAEMise5zjG1Y0yOcbuVWveBgMAhVWmUfrS3nCFl+o4i5nEhDFAOImU0EImddlldO3ZidKqPA/3r2ynBm+if2V1uuodEaPQLrnioO6V4VqpPfOF23vtrkE3CsoIdLwNssLdLfetxe3BYc4C3/NBaxpU/S2uhmxPhMiAKfgJ5nEFOnbbrZcDJMUnvw3skDhl6mNhiXeFPWodqAp6yGme5Ykdz7o7hiKyCC5Kwurs65WJvTd+D+oIMnImkUjw4MZzy0JNWbYJoPUcCxrn457S1u36ATaUXj4ZAdCQSHAiDhAVCkjrXlepMzwFSpmrFIwODjwtDgFxmRfxI5yOinhfbox4jCgN1Bhr953h0Fj9EqFWQU11iMruFw3fNciJ7sShZ/CUI9NTr4SzLNYL5u3h64Lzo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37513165-31b8-44ab-ba14-08d756f439bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 13:32:03.5953 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +S2Dy5ZEB2h5cVabrJj6rPEdt4GFT9y1WcsTzx+NTcjnI2NrYhq1TrXBjcr7J85IAel5z7yv2Osbv6kbcusStg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1187
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVNURDmjKsSoDvdxCgkZKcHFGWez1TLJM9g9HcKYYGw=;
 b=0rGRyD3fHTyXOBb8cGZG5Jpek8coFDH79zMfMxCJMLpqR62wxI+WJ8fscybrmErKgLBP1a8PXVSnLIdv0cly5yujIa3/IOgtEMKBQ6I5GJmaI5DSq6P4dCE4MxKvErhwK28yBLbS6aqCjWZc3VH7WylaxLw0v5M4ts2Q9As7Ujo=
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
DQo+IFNlbnQ6IE1vbmRheSwgT2N0b2JlciAyMSwgMjAxOSAxMDoyOSBQTQ0KPiBUbzogYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEtvZW5pZywgQ2hyaXN0aWFuDQo+IDxDaHJpc3RpYW4u
S29lbmlnQGFtZC5jb20+OyBaaGFuZywgSGF3a2luZw0KPiA8SGF3a2luZy5aaGFuZ0BhbWQuY29t
PjsgTGksIERlbm5pcyA8RGVubmlzLkxpQGFtZC5jb20+Ow0KPiBHcm9kem92c2t5LCBBbmRyZXkg
PEFuZHJleS5Hcm9kem92c2t5QGFtZC5jb20+OyBaaG91MSwgVGFvDQo+IDxUYW8uWmhvdTFAYW1k
LmNvbT4NCj4gQ2M6IExpLCBDYW5kaWNlIDxDYW5kaWNlLkxpQGFtZC5jb20+OyBDaGVuLCBHdWNo
dW4NCj4gPEd1Y2h1bi5DaGVuQGFtZC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZGdw
dTogcmVmaW5lIHJlYm9vdCBkZWJ1Z2ZzIG9wZXJhdGlvbiBpbiByYXMgY2FzZQ0KPiAodjMpDQo+
IA0KPiBSYXMgcmVib290IGRlYnVnZnMgbm9kZSBhbGxvd3MgdXNlciBvbmUgZWFzeSBjb250cm9s
IHRvIGF2b2lkIGdwdSByZWNvdmVyeQ0KPiBoYW5nIHByb2JsZW0gYW5kIGRpcmVjdGx5IHJlYm9v
dCBzeXN0ZW0gcGVyIGNhcmQgYmFzaXMsIGFmdGVyIHJhcw0KPiB1bmNvcnJlY3RhYmxlIGVycm9y
IGhhcHBlbnMuIEhvd2V2ZXIsIGl0IGlzIG9uZSBjb21tb24gZW50cnksIHdoaWNoDQo+IHNob3Vs
ZCBnZXQgcmlkIG9mIHJhc19jdHJsIG5vZGUgYW5kIHJlbW92ZSBpcCBkZXBlbmRlbmNlIHdoZW4g
aW5wdXR0aW5nIGJ5DQo+IHVzZXIuIFNvIGFkZCBvbmUgbmV3IGF1dG9fcmVib290IG5vZGUgaW4g
cmFzIGRlYnVnZnMgZGlyIHRvIGFjaGlldmUgdGhpcy4NCj4gDQo+IHYyOiBpbiBjb21taXQgbXNz
YWdlLCBhZGQganVzdGlmaWNhdGlvbiB3aHkgcmFzIHJlYm9vdCBkZWJ1Z2ZzIG5vZGUgaXMNCj4g
bmVlZGVkLg0KPiB2MzogdXNlIGRlYnVnZnNfY3JlYXRlX2Jvb2wgdG8gY3JlYXRlIGRlYnVnZnMg
ZmlsZSBmb3IgYm9vbGVhbiB2YWx1ZQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogR3VjaHVuIENoZW4g
PGd1Y2h1bi5jaGVuQGFtZC5jb20+DQoNClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+DQoNCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfcmFzLmMgfCAxOSArKysrKysrKysrKystLS0tLS0tDQo+ICAxIGZpbGUgY2hh
bmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMNCj4gYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMNCj4gaW5kZXggNjIyMDM5NDUyMWU0Li4yZDll
MTNkMmE3MWEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9yYXMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMN
Cj4gQEAgLTE1Myw4ICsxNTMsNiBAQCBzdGF0aWMgaW50DQo+IGFtZGdwdV9yYXNfZGVidWdmc19j
dHJsX3BhcnNlX2RhdGEoc3RydWN0IGZpbGUgKmYsDQo+ICAJCW9wID0gMTsNCj4gIAllbHNlIGlm
IChzc2NhbmYoc3RyLCAiaW5qZWN0ICUzMnMgJThzIiwgYmxvY2tfbmFtZSwgZXJyKSA9PSAyKQ0K
PiAgCQlvcCA9IDI7DQo+IC0JZWxzZSBpZiAoc3NjYW5mKHN0ciwgInJlYm9vdCAlMzJzIiwgYmxv
Y2tfbmFtZSkgPT0gMSkNCj4gLQkJb3AgPSAzOw0KPiAgCWVsc2UgaWYgKHN0clswXSAmJiBzdHJb
MV0gJiYgc3RyWzJdICYmIHN0clszXSkNCj4gIAkJLyogYXNjaWkgc3RyaW5nLCBidXQgY29tbWFu
ZHMgYXJlIG5vdCBtYXRjaGVkLiAqLw0KPiAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gQEAgLTIxOCwx
MiArMjE2LDExIEBAIHN0YXRpYyBzdHJ1Y3QgcmFzX21hbmFnZXINCj4gKmFtZGdwdV9yYXNfZmlu
ZF9vYmooc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICAgKiB2YWx1ZSB0byB0aGUgYWRk
cmVzcy4NCj4gICAqDQo+ICAgKiBTZWNvbmQgbWVtYmVyOiBzdHJ1Y3QgcmFzX2RlYnVnX2lmOjpv
cC4NCj4gLSAqIEl0IGhhcyBmb3VyIGtpbmRzIG9mIG9wZXJhdGlvbnMuDQo+ICsgKiBJdCBoYXMg
dGhyZWUga2luZHMgb2Ygb3BlcmF0aW9ucy4NCj4gICAqDQo+ICAgKiAtIDA6IGRpc2FibGUgUkFT
IG9uIHRoZSBibG9jay4gVGFrZSA6OmhlYWQgYXMgaXRzIGRhdGEuDQo+ICAgKiAtIDE6IGVuYWJs
ZSBSQVMgb24gdGhlIGJsb2NrLiBUYWtlIDo6aGVhZCBhcyBpdHMgZGF0YS4NCj4gICAqIC0gMjog
aW5qZWN0IGVycm9ycyBvbiB0aGUgYmxvY2suIFRha2UgOjppbmplY3QgYXMgaXRzIGRhdGEuDQo+
IC0gKiAtIDM6IHJlYm9vdCBvbiB1bnJlY292ZXJhYmxlIGVycm9yDQo+ICAgKg0KPiAgICogSG93
IHRvIHVzZSB0aGUgaW50ZXJmYWNlPw0KPiAgICogcHJvZ3JhbXM6DQo+IEBAIC0zMDUsOSArMzAy
LDYgQEAgc3RhdGljIHNzaXplX3QgYW1kZ3B1X3Jhc19kZWJ1Z2ZzX2N0cmxfd3JpdGUoc3RydWN0
DQo+IGZpbGUgKmYsIGNvbnN0IGNoYXIgX191c2VyICoNCj4gIAkJLyogZGF0YS5pbmplY3QuYWRk
cmVzcyBpcyBvZmZzZXQgaW5zdGVhZCBvZiBhYnNvbHV0ZSBncHUNCj4gYWRkcmVzcyAqLw0KPiAg
CQlyZXQgPSBhbWRncHVfcmFzX2Vycm9yX2luamVjdChhZGV2LCAmZGF0YS5pbmplY3QpOw0KPiAg
CQlicmVhazsNCj4gLQljYXNlIDM6DQo+IC0JCWFtZGdwdV9yYXNfZ2V0X2NvbnRleHQoYWRldikt
PnJlYm9vdCA9IHRydWU7DQo+IC0JCWJyZWFrOw0KPiAgCWRlZmF1bHQ6DQo+ICAJCXJldCA9IC1F
SU5WQUw7DQo+ICAJCWJyZWFrOw0KPiBAQCAtMTAzNyw2ICsxMDMxLDE3IEBAIHN0YXRpYyB2b2lk
DQo+IGFtZGdwdV9yYXNfZGVidWdmc19jcmVhdGVfY3RybF9ub2RlKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2KQ0KPiAgCQkJCWFkZXYsICZhbWRncHVfcmFzX2RlYnVnZnNfY3RybF9vcHMpOw0K
PiAgCWRlYnVnZnNfY3JlYXRlX2ZpbGUoInJhc19lZXByb21fcmVzZXQiLCBTX0lXVUdPIHwgU19J
UlVHTywNCj4gY29uLT5kaXIsDQo+ICAJCQkJYWRldiwgJmFtZGdwdV9yYXNfZGVidWdmc19lZXBy
b21fb3BzKTsNCj4gKw0KPiArCS8qDQo+ICsJICogQWZ0ZXIgb25lIHVuY29ycmVjdGFibGUgZXJy
b3IgaGFwcGVucywgdXN1YWxseSBHUFUgcmVjb3Zlcnkgd2lsbA0KPiArCSAqIGJlIHNjaGVkdWxl
ZC4gQnV0IGR1ZSB0byB0aGUga25vd24gcHJvYmxlbSBpbiBHUFUgcmVjb3ZlcnkNCj4gZmFpbGlu
Zw0KPiArCSAqIHRvIGJyaW5nIEdQVSBiYWNrLCBiZWxvdyBpbnRlcmZhY2UgcHJvdmlkZXMgb25l
IGRpcmVjdCB3YXkgdG8NCj4gKwkgKiB1c2VyIHRvIHJlYm9vdCBzeXN0ZW0gYXV0b21hdGljYWxs
eSBpbiBzdWNoIGNhc2Ugd2l0aGluDQo+ICsJICogRVJSRVZFTlRfQVRIVUJfSU5URVJSVVBUIGdl
bmVyYXRlZC4gTm9ybWFsIEdQVSByZWNvdmVyeQ0KPiByb3V0aW5lDQo+ICsJICogd2lsbCBuZXZl
ciBiZSBjYWxsZWQuDQo+ICsJICovDQo+ICsJZGVidWdmc19jcmVhdGVfYm9vbCgiYXV0b19yZWJv
b3QiLCBTX0lXVUdPIHwgU19JUlVHTywgY29uLQ0KPiA+ZGlyLA0KPiArCQkJCSZjb24tPnJlYm9v
dCk7DQo+ICB9DQo+IA0KPiAgdm9pZCBhbWRncHVfcmFzX2RlYnVnZnNfY3JlYXRlKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2LA0KPiAtLQ0KPiAyLjE3LjENCj4gDQo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGFtZC1nZnggbWFpbGluZyBsaXN0
DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
