Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C766A39560
	for <lists+amd-gfx@lfdr.de>; Fri,  7 Jun 2019 21:16:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C25E89E7C;
	Fri,  7 Jun 2019 19:16:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820085.outbound.protection.outlook.com [40.107.82.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 497BB89E7C
 for <amd-gfx@lists.freedesktop.org>; Fri,  7 Jun 2019 19:16:07 +0000 (UTC)
Received: from CY4PR1201MB0102.namprd12.prod.outlook.com (10.172.77.148) by
 CY4PR1201MB2502.namprd12.prod.outlook.com (10.172.121.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.14; Fri, 7 Jun 2019 19:12:58 +0000
Received: from CY4PR1201MB0102.namprd12.prod.outlook.com
 ([fe80::318f:bfcc:e4d2:1af9]) by CY4PR1201MB0102.namprd12.prod.outlook.com
 ([fe80::318f:bfcc:e4d2:1af9%8]) with mapi id 15.20.1943.018; Fri, 7 Jun 2019
 19:12:58 +0000
From: James Zhu <jamesz@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "Zhu, James" <James.Zhu@amd.com>
Subject: Re: [PATCH] drm/amdgpu: Add GDS clearing workaround in later init for
 gfx9
Thread-Topic: [PATCH] drm/amdgpu: Add GDS clearing workaround in later init
 for gfx9
Thread-Index: AQHVHU9fi+Ptg8J/EEmosJ0MSRUp9KaQf4CAgAAP5oA=
Date: Fri, 7 Jun 2019 19:12:57 +0000
Message-ID: <19203faa-970e-732b-a0e0-d2d1fe69ce30@amd.com>
References: <1559925472-20077-1-git-send-email-James.Zhu@amd.com>
 <CADnq5_NBWcUtXsBbQP5uBvaOFgWXw3Lhj=ZOisVyTctqZph=xQ@mail.gmail.com>
In-Reply-To: <CADnq5_NBWcUtXsBbQP5uBvaOFgWXw3Lhj=ZOisVyTctqZph=xQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0064.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::41) To CY4PR1201MB0102.namprd12.prod.outlook.com
 (2603:10b6:910:1b::20)
x-originating-ip: [165.204.55.251]
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 72eb24f0-7b50-4d2f-39a2-08d6eb7c2667
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB2502; 
x-ms-traffictypediagnostic: CY4PR1201MB2502:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CY4PR1201MB25026D3561B10182778E834FE4100@CY4PR1201MB2502.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0061C35778
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(396003)(136003)(376002)(366004)(189003)(199004)(966005)(2906002)(476003)(486006)(229853002)(8936002)(76176011)(72206003)(6436002)(256004)(14444005)(3846002)(71200400001)(68736007)(2616005)(71190400001)(6486002)(6116002)(6636002)(102836004)(53546011)(386003)(6506007)(5660300002)(4326008)(7736002)(110136005)(54906003)(6246003)(11346002)(316002)(446003)(6306002)(52116002)(6512007)(36756003)(25786009)(478600001)(8676002)(99286004)(305945005)(31686004)(31696002)(14454004)(81156014)(64756008)(186003)(26005)(66556008)(66446008)(73956011)(66476007)(66946007)(81166006)(53936002)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB2502;
 H:CY4PR1201MB0102.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: y5ekdTVsleupJcaMg7Zi3iAXeRlweZSJAkCrhoXUqpi+Zg0KySZcElXwwtNkyb5aRvCi0yHC7Ka65owsPc4WhnIdpDnN1t1tdbk7+HCHMTAK0Zuxzg/vfzkCayipzOV+9Q3soTR7sTfT2+QNVGlS+0Rc5Prj6tH/zsu6E0s2WiSusIvuJf3RtizYPBmu3wgvN6R3xuPZcoaUphDSIE5snibs6LgpkW7qctiJqfjKS5aYwFLdbdPHvrypSx4x1GjHlWj/BxqQDlQT8N+hilL2/KV/jkMxIUzPfxHxNcBo9p/Xeh8eorVLyJCVbI4zQFK5MxWIF9HYIgLxnklnHxFVhXXyxClHg1jR5eo5FAriS2K4yXqtBuqqVKCzyLhHQd4QIVn3yn7s6c+PJfkpeDPwsM78RoBGiUPS8NdMfMRyyBY=
Content-ID: <E0AF212BF0277E4EB5FBA579B98EFA6B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72eb24f0-7b50-4d2f-39a2-08d6eb7c2667
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2019 19:12:57.9100 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jamesz@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2502
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvXhcLmmHLBrNMZRHHIW1AzW6767s+AuFG3tv26eq40=;
 b=JP18qSNQsHOp1dKuSpyJ++KewNJAzmeS3HmgBjzo6yJVGCYLbgbf8GjA7HFj69I5tJhrHWIy7K2JUSsT3oOcYeGbLJqkUDuJYkOvn8VrSYABPjNTsD42xo3KDH7EqbzJ6vZSQfn5xyZKH4E91fJfle9a+HbEwAfmuNFY+VByYeE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=James.Zhu@amd.com; 
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
Cc: "Shamis,
 Leonid" <Leonid.Shamis@amd.com>, "Gabra, Maroun" <Maroun.Gabra@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Liu,
 Shaoyun" <Shaoyun.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQpPbiAyMDE5LTA2LTA3IDI6MTYgcC5tLiwgQWxleCBEZXVjaGVyIHdyb3RlOg0KPiBPbiBGcmks
IEp1biA3LCAyMDE5IGF0IDEyOjM4IFBNIFpodSwgSmFtZXMgPEphbWVzLlpodUBhbWQuY29tPiB3
cm90ZToNCj4+IFNpbmNlIEhhcmR3YXJlIGJ1ZywgR0RTIGV4aXN0IEVDQyBlcnJvciBhZnRlciBj
b2xkIGJvb3QgdXAsDQo+PiBhZGRpbmcgR0RTIGNsZWFyaW5nIHdvcmthcm91bmQgaW4gbGF0ZXIg
aW5pdCBmb3IgZ2Z4OS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBaaHUgPEphbWVzLlpo
dUBhbWQuY29tPg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92
OV8wLmMgfCA0OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4gICAxIGZp
bGUgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4X3Y5XzAuYw0KPj4gaW5kZXggNzY3MjJmYy4uODFmNmJhOCAxMDA2NDQNCj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMNCj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMNCj4+IEBAIC0zNjM0LDYgKzM2MzQsNTAgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBzb2MxNV9yZWdfZW50cnkgc2VjX2RlZF9jb3VudGVyX3JlZ2lz
dGVyc1tdID0gew0KPj4gICAgICB7IFNPQzE1X1JFR19FTlRSWShHQywgMCwgbW1TUUNfRURDX0NO
VDMpLCAwLCA0LCA2fSwNCj4+ICAgfTsNCj4+DQo+PiArDQo+PiArc3RhdGljIGludCBnZnhfdjlf
MF9kb19lZGNfZ2RzX3dvcmthcm91bmRzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPj4g
K3sNCj4+ICsgICAgICAgc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nID0gJmFkZXYtPmdmeC5jb21w
dXRlX3JpbmdbMF07DQo+PiArICAgICAgIGludCByOw0KPj4gKw0KPj4gKyAgICAgICByID0gYW1k
Z3B1X3JpbmdfYWxsb2MocmluZywgMTcpOw0KPj4gKyAgICAgICBpZiAocikgew0KPj4gKyAgICAg
ICAgICAgICAgIERSTV9FUlJPUigiYW1kZ3B1OiBHRFMgd29ya2Fyb3VuZHMgZmFpbGVkIHRvIGxv
Y2sgcmluZyAlcyAoJWQpLlxuIiwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIHJpbmctPm5h
bWUsIHIpOw0KPj4gKyAgICAgICAgICAgICAgIHJldHVybiByOw0KPj4gKyAgICAgICB9DQo+PiAr
DQo+PiArICAgICAgIGFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFBBQ0tFVDMoUEFDS0VUM19XUklU
RV9EQVRBLCAzKSk7DQo+PiArICAgICAgIGFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFdSSVRFX0RB
VEFfRU5HSU5FX1NFTCgwKSB8DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICBXUklURV9E
QVRBX0RTVF9TRUwoMCkpOw0KPj4gKyAgICAgICBhbWRncHVfcmluZ193cml0ZShyaW5nLCBTT0Mx
NV9SRUdfT0ZGU0VUKEdDLCAwLCBtbUdEU19WTUlEMF9TSVpFKSk7DQo+PiArICAgICAgIGFtZGdw
dV9yaW5nX3dyaXRlKHJpbmcsIDApOw0KPj4gKyAgICAgICBhbWRncHVfcmluZ193cml0ZShyaW5n
LCAweDEwMDAwKTsNCj4gaGFyZGNvZGVkIHNpemUsIHBsZWFzZSB1c2UgdGhlIHNpemUgZnJvbSB0
aGUgZHJpdmVyLg0KPg0KPj4gKw0KPj4gKyAgICAgICBhbWRncHVfcmluZ193cml0ZShyaW5nLCBQ
QUNLRVQzKFBBQ0tFVDNfRE1BX0RBVEEsIDUpKTsNCj4+ICsgICAgICAgYW1kZ3B1X3Jpbmdfd3Jp
dGUocmluZywgKFBBQ0tFVDNfRE1BX0RBVEFfQ1BfU1lOQyB8DQo+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFBBQ0tFVDNfRE1BX0RBVEFfRFNUX1NFTCgxKSB8DQo+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFBBQ0tFVDNfRE1BX0RBVEFfU1JDX1NFTCgyKSB8DQo+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBBQ0tFVDNfRE1BX0RBVEFfRU5HSU5F
KDApKSk7DQo+PiArICAgICAgIGFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIDApOw0KPj4gKyAgICAg
ICBhbWRncHVfcmluZ193cml0ZShyaW5nLCAwKTsNCj4+ICsgICAgICAgYW1kZ3B1X3Jpbmdfd3Jp
dGUocmluZywgMCk7DQo+PiArICAgICAgIGFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIDApOw0KPj4g
KyAgICAgICBhbWRncHVfcmluZ193cml0ZShyaW5nLCBQQUNLRVQzX0RNQV9EQVRBX0NNRF9SQVdf
V0FJVCB8IDB4MTAwMDApOw0KPiBJbnN0ZWFkIG9mIGhhcmRjb2RpbmcgdGhlIHNpemUsIGNhbiB5
b3UgdXNlIHRoZSBnZHMgc2l6ZSBmcm9tIHRoZQ0KPiBkcml2ZXIgKGFkZXYtPmdkcy5nZHNfc2l6
ZSkuDQoNCkhpIEFsZXgsDQoNCkRvIHlvdSBtZWFuIGFkZXYtPmdkcy5tZW0udG90YWxfc2l6ZT8N
Cg0KQnV0IEkgc2VlIGJlbG93IG9wZXJhdGlvbiBpbiBnZnhfdjlfMF9uZ2dfaW5pdC4NCg0KYWRl
di0+Z2RzLm1lbS50b3RhbF9zaXplIC09IC4uLi4NCg0KT3IgeW91IHdhbnQgbWUgdG8gYWRkIGdk
c19zaXplIGluIHN0cnVjdCBhbWRncHVfZ2RzPw0KDQpKYW1lcw0KDQo+DQo+IFdpdGggdGhhdCBm
aXhlZDoNCj4gUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4NCj4NCj4+ICsNCj4+ICsgICAgICAgYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgUEFDS0VU
MyhQQUNLRVQzX1dSSVRFX0RBVEEsIDMpKTsNCj4+ICsgICAgICAgYW1kZ3B1X3Jpbmdfd3JpdGUo
cmluZywgV1JJVEVfREFUQV9FTkdJTkVfU0VMKDApIHwNCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgV1JJVEVfREFUQV9EU1RfU0VMKDApKTsNCj4+ICsgICAgICAgYW1kZ3B1X3Jp
bmdfd3JpdGUocmluZywgU09DMTVfUkVHX09GRlNFVChHQywgMCwgbW1HRFNfVk1JRDBfU0laRSkp
Ow0KPj4gKyAgICAgICBhbWRncHVfcmluZ193cml0ZShyaW5nLCAwKTsNCj4+ICsgICAgICAgYW1k
Z3B1X3Jpbmdfd3JpdGUocmluZywgMHgwKTsNCj4+ICsNCj4+ICsgICAgICAgYW1kZ3B1X3Jpbmdf
Y29tbWl0KHJpbmcpOw0KPj4gKw0KPj4gKyAgICAgICByZXR1cm4gMDsNCj4+ICt9DQo+PiArDQo+
PiArDQo+PiAgIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfZG9fZWRjX2dwcl93b3JrYXJvdW5kcyhzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4+ICAgew0KPj4gICAgICAgICAgc3RydWN0IGFtZGdw
dV9yaW5nICpyaW5nID0gJmFkZXYtPmdmeC5jb21wdXRlX3JpbmdbMF07DQo+PiBAQCAtMzgxMCw2
ICszODU0LDEwIEBAIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfZWNjX2xhdGVfaW5pdCh2b2lkICpoYW5k
bGUpDQo+PiAgICAgICAgICAgICAgICAgIHJldHVybiAwOw0KPj4gICAgICAgICAgfQ0KPj4NCj4+
ICsgICAgICAgciA9IGdmeF92OV8wX2RvX2VkY19nZHNfd29ya2Fyb3VuZHMoYWRldik7DQo+PiAr
ICAgICAgIGlmIChyKQ0KPj4gKyAgICAgICAgICAgICAgIHJldHVybiByOw0KPj4gKw0KPj4gICAg
ICAgICAgLyogcmVxdWlyZXMgSUJzIHNvIGRvIGluIGxhdGUgaW5pdCBhZnRlciBJQiBwb29sIGlz
IGluaXRpYWxpemVkICovDQo+PiAgICAgICAgICByID0gZ2Z4X3Y5XzBfZG9fZWRjX2dwcl93b3Jr
YXJvdW5kcyhhZGV2KTsNCj4+ICAgICAgICAgIGlmIChyKQ0KPj4gLS0NCj4+IDIuNy40DQo+Pg0K
Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4+IGFt
ZC1nZnggbWFpbGluZyBsaXN0DQo+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4g
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
