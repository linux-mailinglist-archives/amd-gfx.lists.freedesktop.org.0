Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF56316A3
	for <lists+amd-gfx@lfdr.de>; Fri, 31 May 2019 23:32:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5D1B89A35;
	Fri, 31 May 2019 21:32:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on0600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F40A689A35
 for <amd-gfx@lists.freedesktop.org>; Fri, 31 May 2019 21:32:31 +0000 (UTC)
Received: from DM5PR1201MB0155.namprd12.prod.outlook.com (10.174.106.148) by
 DM5PR1201MB2475.namprd12.prod.outlook.com (10.172.89.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.17; Fri, 31 May 2019 21:32:30 +0000
Received: from DM5PR1201MB0155.namprd12.prod.outlook.com
 ([fe80::dde4:7ea4:1b9b:45ae]) by DM5PR1201MB0155.namprd12.prod.outlook.com
 ([fe80::dde4:7ea4:1b9b:45ae%9]) with mapi id 15.20.1922.021; Fri, 31 May 2019
 21:32:30 +0000
From: "Yang, Philip" <Philip.Yang@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: use new HMM APIs and helpers
Thread-Topic: [PATCH] drm/amdgpu: use new HMM APIs and helpers
Thread-Index: AQHVFvW7FwLiVzA03k2ytJmujZXksaaEQkeAgAE8UICAACWJgIAAHqUA
Date: Fri, 31 May 2019 21:32:30 +0000
Message-ID: <9ae26883-4326-c60f-9a8e-d95d0d458e31@amd.com>
References: <20190530144049.1996-1-Philip.Yang@amd.com>
 <704410a5-be01-f423-11ef-01a640cd469c@amd.com>
 <bd8f1fd6-f6c4-66fc-c0b9-c8ed36cd6027@amd.com>
 <befbe7fa-0bd3-ffcf-d2eb-36f15053d1a5@amd.com>
In-Reply-To: <befbe7fa-0bd3-ffcf-d2eb-36f15053d1a5@amd.com>
Accept-Language: en-ZA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0053.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::30) To DM5PR1201MB0155.namprd12.prod.outlook.com
 (2603:10b6:4:55::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 57a410d6-4952-4dc1-d5d4-08d6e60f7c55
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR1201MB2475; 
x-ms-traffictypediagnostic: DM5PR1201MB2475:
x-microsoft-antispam-prvs: <DM5PR1201MB2475CC28AA9B33AB23FB123BE6190@DM5PR1201MB2475.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:466;
x-forefront-prvs: 00540983E2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(346002)(366004)(136003)(376002)(199004)(189003)(8936002)(86362001)(6246003)(7736002)(305945005)(81156014)(14444005)(8676002)(81166006)(6512007)(256004)(110136005)(229853002)(31696002)(6436002)(316002)(71200400001)(478600001)(6486002)(486006)(14454004)(72206003)(3846002)(71190400001)(2616005)(36756003)(476003)(446003)(31686004)(11346002)(66946007)(73956011)(66476007)(66556008)(64756008)(66446008)(2501003)(25786009)(66066001)(53546011)(6506007)(386003)(26005)(6116002)(102836004)(76176011)(99286004)(186003)(5660300002)(2906002)(53936002)(52116002)(68736007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB2475;
 H:DM5PR1201MB0155.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gFYKs7feeRloH69BDrkesZ7qrOZhx2whsFQYkyVuHxeyMHH8rGeUX26MxpkFl2fzBnwXfYYERExp+0JK/Z38EFUucFs/e/Epa5+XNIzd7RBxVFSagxOIKrV/h7sFeESuLZcJVMG18vuK4s5Nycd5IB2LQ71yW+bl1kVm9n+jgbxLtuWdOn1aymwL1UwDSFooNiTjsPKx0NclGVZ4peKZpl5+xGP2YuIg09ex5t2imjss54UsH/CtunLkllZKqQALWLxpJKhjKF5w4LT+kW7xaRdUvrYcgd4BD2KLXrbaV8WZRX74wbSfx5rha44p1mS0G1WKtsVOgfS0655yQrslnYMJ2n021HR4ny2cK6253jj8Xl0Nq1oq8aifbpz/5Gf1M9mhZxIg9/runGsEI95+owPPUOFZs0JfblJJX8mN6es=
Content-ID: <3BC16B5F1C1CE1478B66BB2074A972C0@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57a410d6-4952-4dc1-d5d4-08d6e60f7c55
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2019 21:32:30.8225 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yangp@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2475
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+HjQ3Tf6TrzUcgAUPCwQPEZs8Ngfs0gE019xS08O+E=;
 b=bxaAHYI40VuqsjCrACqxlzv/9d3ThX97N7m9s43cGJCs7djWHiACkl2QPiZN53fqMMQk6ukkybjpmxZhH6s5VnjzbTDHCMnIwp9gTwGyUSDMrkmbbAq45nygQYFuZOvHVqwo1TAHrTCXq66f22pFoOd/UlaG4FtigBx/xYgNODw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Philip.Yang@amd.com; 
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

DQoNCk9uIDIwMTktMDUtMzEgMzo0MiBwLm0uLCBLdWVobGluZywgRmVsaXggd3JvdGU6DQo+IE9u
IDIwMTktMDUtMzEgMToyOCBwLm0uLCBZYW5nLCBQaGlsaXAgd3JvdGU6DQo+Pg0KPj4gT24gMjAx
OS0wNS0zMCA2OjM2IHAubS4sIEt1ZWhsaW5nLCBGZWxpeCB3cm90ZToNCj4+Pj4gICAgICANCj4+
Pj4gICAgICAjaWYgSVNfRU5BQkxFRChDT05GSUdfRFJNX0FNREdQVV9VU0VSUFRSKQ0KPj4+PiAt
CWlmIChndHQtPnJhbmdlcyAmJg0KPj4+PiAtCSAgICB0dG0tPnBhZ2VzWzBdID09IGhtbV9wZm5f
dG9fcGFnZSgmZ3R0LT5yYW5nZXNbMF0sDQo+Pj4+IC0JCQkJCSAgICAgZ3R0LT5yYW5nZXNbMF0u
cGZuc1swXSkpDQo+Pj4+ICsJaWYgKGd0dC0+cmFuZ2UgJiYNCj4+Pj4gKwkgICAgdHRtLT5wYWdl
c1swXSA9PSBobW1fZGV2aWNlX2VudHJ5X3RvX3BhZ2UoZ3R0LT5yYW5nZSwNCj4+Pj4gKwkJCQkJ
CSAgICAgIGd0dC0+cmFuZ2UtPnBmbnNbMF0pKQ0KPj4+IEkgdGhpbmsganVzdCBjaGVja2luZyBn
dHQtPnJhbmdlIGhlcmUgaXMgZW5vdWdoLiBJZiBndHQtPnJhbmdlIGlzIG5vdA0KPj4+IE5VTEwg
aGVyZSwgd2UncmUgbGVha2luZyBtZW1vcnkuDQo+Pj4NCj4+IElmIGp1c3QgY2hlY2tpbmcgZ3R0
LT5yYW5nZSwgdGhlcmUgaXMgYSBmYWxzZSB3YXJuaW5nIGluIGFtZGdwdV90ZXN0DQo+PiB1c2Vy
cHRyIGNhc2UgaW4gYW1kZ3B1X2NzX2xpc3RfdmFsaWRhdGUgcGF0aC4gSWYgdXNlcnB0ciBpcyBp
bnZhbGlkYXRlZCwNCj4+IHRoZW4gdHRtLT5wYWdlc1swXSBpcyBvdXRkYXRlZCBwYWdlcywgbG9i
ai0+dXNlcl9wYWdlcyBpcyBuZXcgcGFnZXMsIGl0DQo+PiBnb2VzIHRvIHR0bV90dF91bmJpbmQg
Zmlyc3QgdG8gdW5waW4gb2xkIHBhZ2VzICh0aGlzIGNhdXNlcyBmYWxzZQ0KPj4gd2FybmluZykg
dGhlbiBjYWxsIGFtZGdwdV90dG1fdHRfc2V0X3VzZXJfcGFnZXMuDQo+IA0KPiBCdXQgZG9lc24n
dCB0aGF0IG1lYW4gd2UncmUgbGVha2luZyB0aGUgZ3R0LT5yYW5nZSBzb21ld2hlcmU/DQo+IA0K
dHRtX3R0X3VuYmluZCBpcyBjYWxsZWQgZnJvbSB0dG1fdHRfZGVzdHJveSBhbmQgYW1kZ3B1X2Nz
X2xpc3RfdmFsaWRhdGUsIA0KdGhlIGxhdGVyIG9uZSBjYXVzZXMgZmFsc2Ugd2FybmluZy4gdHRt
X3R0bV9kZXN0b3J5IHBhdGggaXMgZmluZSB0byBvbmx5IA0KY2hlY2sgZ3R0LT5yYW5nZS4NCg0K
RG91YmxlIGNoZWNrZWQsIGFtZGdwdV90dG1fdHRfZ2V0X3VzZXJfcGFnZXMgYW5kIA0KYW1kZ3B1
X3R0bV90dF9nZXRfdXNlcl9wYWdlc19kb25lIGFsd2F5cyBtYXRjaCBpbiBib3RoIHBhdGhzLCBz
byBubyBsZWFrIA0KZ3R0LT5yYW5nZS4NCg0KMS4gYW1kZ3B1X2dlbV91c2VycHRyX2lvY3RsDQog
ICAgICAgYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlcw0KICAgICAgICAgICB0dG0tPnBhZ2Vz
IGZvciB1c2VycHRyIHBhZ2VzDQogICAgICAgYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlc19k
b25lDQoNCjIuIGFtZGdwdV9jc19pb2N0bA0KICAgICAgIGFtZGdwdV9jc19wYXJzZXJfYm9zDQog
ICAgICAgICAgIGFtZGdwdV90dG1fdHRfZ2V0X3VzZXJfcGFnZXMNCiAgICAgICAgICAgaWYgKHVz
ZXJwYWdlX2ludmFsaWRhdGVkKQ0KICAgICAgICAgICAgICAgZS0+dXNlcl9wYWdlcyBmb3IgbmV3
IHBhZ2VzDQogICAgICAgICAgIGFtZGdwdV9jc19saXN0X3ZhbGlkYXRlDQogICAgICAgICAgICAg
ICBpZiAodXNlcnBhZ2VfaW52YWxpZGF0ZWQpDQogICAgICAgICAgICAgICAgICB0dG1fdHRfdW5i
aW5kIHR0bS0+cGFnZXMgLy8gdGhpcyBjYXVzZXMgd2FybmluZw0KICAgICAgICAgICAgICAgICAg
YW1kZ3B1X3R0bV90dF9zZXRfdXNlcl9wYWdlcyh0dG0tPnBhZ2VzLCBlLT51c2VyX3BhZ2VzKQ0K
ICAgICAgIGFtZGdwdV9jc19zdWJtaXQNCiAgICAgICAgICAgYW1kZ3B1X3R0bV90dF9nZXRfdXNl
cl9wYWdlc19kb25lDQoNCj4gUmVnYXJkcywNCj4gICDCoCBGZWxpeA0KPiANCj4gDQo+Pg0KDQo+
PiBJIHdpbGwgc3VibWl0IHBhdGNoIHYyLCB0byBhZGQgcmV0cnkgaWYgaG1tX3JhbmdlX2ZhdWx0
IHJldHVybnMgLUVBR0FJTi4NCj4+IHVzZSBremFsbG9jIHRvIGFsbG9jYXRlIHNtYWxsIHNpemUg
cmFuZ2UuDQo+Pg0KPj4gVGhhbmtzLA0KPj4gUGhpbGlwDQo+Pg0KPj4+IFJlZ2FyZHMsDQo+Pj4g
ICAgIMKgIEZlbGl4DQo+Pj4NCj4+Pg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
