Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C189B3720E
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 12:51:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D2389304;
	Thu,  6 Jun 2019 10:51:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700064.outbound.protection.outlook.com [40.107.70.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD7589304
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2019 10:51:06 +0000 (UTC)
Received: from MWHPR12MB1311.namprd12.prod.outlook.com (10.169.206.148) by
 MWHPR12MB1487.namprd12.prod.outlook.com (10.172.49.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.14; Thu, 6 Jun 2019 10:51:05 +0000
Received: from MWHPR12MB1311.namprd12.prod.outlook.com
 ([fe80::d9ab:90d0:c292:60a8]) by MWHPR12MB1311.namprd12.prod.outlook.com
 ([fe80::d9ab:90d0:c292:60a8%8]) with mapi id 15.20.1965.011; Thu, 6 Jun 2019
 10:51:05 +0000
From: "StDenis, Tom" <Tom.StDenis@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/amdgpu: remove vram_page_split kernel option (v2)
Thread-Topic: [PATCH] drm/amd/amdgpu: remove vram_page_split kernel option (v2)
Thread-Index: AQHVGvkibtcSQ02iC0aN0XWY3egjt6aOcQ4AgAAEdYA=
Date: Thu, 6 Jun 2019 10:51:05 +0000
Message-ID: <3016cea5-4f9d-90cc-5baa-46a4397e1f36@amd.com>
References: <20190604171532.17816-1-tom.stdenis@amd.com>
 <53989f75-44bc-83be-3011-71f94f49ec87@gmail.com>
In-Reply-To: <53989f75-44bc-83be-3011-71f94f49ec87@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR01CA0025.prod.exchangelabs.com (2603:10b6:208:71::38)
 To MWHPR12MB1311.namprd12.prod.outlook.com
 (2603:10b6:300:13::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.84.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b2b4af7d-8f15-4c60-9552-08d6ea6cdfa5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MWHPR12MB1487; 
x-ms-traffictypediagnostic: MWHPR12MB1487:
x-microsoft-antispam-prvs: <MWHPR12MB14875D9037F5ECF4736C16C2F7170@MWHPR12MB1487.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 00603B7EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(376002)(396003)(346002)(39860400002)(189003)(199004)(14454004)(25786009)(110136005)(476003)(66066001)(316002)(2501003)(26005)(186003)(76176011)(446003)(11346002)(486006)(2616005)(73956011)(66476007)(66556008)(66946007)(64756008)(31686004)(66446008)(36756003)(305945005)(386003)(6506007)(53546011)(102836004)(6436002)(66574012)(7736002)(5660300002)(8936002)(52116002)(99286004)(81166006)(81156014)(8676002)(3846002)(6486002)(256004)(2906002)(68736007)(229853002)(53936002)(72206003)(6512007)(71200400001)(6116002)(31696002)(71190400001)(6246003)(478600001)(86362001)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1487;
 H:MWHPR12MB1311.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KCeItnVj1y7DLDc3k/KEeztAWdUCyx1SgNH9c/a6f7mzt11BiM0xL1fr7gewuMl+Cri6J0ftybJUVBhp0l/1ms/EoJq2AIVesunehvcFxCp3eInRKkplKO8xT+6D8Skd5Q3wnGb+c3xdZV/R+A+JCClY4QU2wrLQipARfD3s7DykUcnCwcnNIMONzCr96VXOaLwWUG10QzChgnpu+qASjgeGEbHmvLbZZrlNy196G0iWQdvZzn+h8rR5LUgzRnuiycRmcDPt2Ks1gpdSJf/ttVQ/i08N1F3mpdM/aecL9chx+QqfIGNYLR+fnnz22lNnlwhRDyerlN9hg9HNaaPctf+7J3qnUK2eRlqVMIuRMhxQZoqLdWqkLa0A/pPj4WwnRNGfpnFMyVKZv6SsBaBQieIo0SsDmxD4KoDVe8Y/lKs=
Content-ID: <68B847733CF65D4591E913D59C039FFF@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2b4af7d-8f15-4c60-9552-08d6ea6cdfa5
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2019 10:51:05.2865 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tstdenis@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1487
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZLPHCOc5ZR9V5qsxqYFD+Q/H2nKnIR/8cIWXCfojLU=;
 b=RBIwCA6WGBGwciiVUE1OonHJ+16+ta6YOzzmCiRgbigH3Rf8vxFOXPyJ2KdWWFp59PIEuzmI42KcXaRi8pYYwcuT/cS9OK++SjiNecdTJiP7CojzxtDML9ACDV3KGhWSLCBFZrS3NytuqMv8tDGCr19GjsGr35iKxBW/5m+vlm0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tom.StDenis@amd.com; 
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

QWggeWEgSSBtaXNyZWFkIHRoZSBvcmlnaW5hbCBkZWZhdWx0IGFzIE1pQiBpbnN0ZWFkIG9mIHBh
Z2VzLg0KDQoNClRvbQ0KDQpPbiAyMDE5LTA2LTA2IDY6MzUgYS5tLiwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToNCj4gQW0gMDQuMDYuMTkgdW0gMTk6MTUgc2NocmllYiBTdERlbmlzLCBUb206DQo+
PiBUaGlzIG9wdGlvbiBpcyBubyBsb25nZXIgbmVlZGVkLsKgIFRoZSBkZWZhdWx0IGNvZGUgcGF0
aHMNCj4+IGFyZSBub3cgdGhlIG9ubHkgb3B0aW9uLg0KPj4NCj4+IHYyOiBBZGQgSFBBR0Ugc3Vw
cG9ydCBhbmQgYSBkZWZhdWx0IGZvciBub24gY29udGlndW91cyBtYXBzDQo+Pg0KPj4gU2lnbmVk
LW9mZi1ieTogVG9tIFN0IERlbmlzIDx0b20uc3RkZW5pc0BhbWQuY29tPg0KPj4gLS0tDQo+PiDC
oCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaMKgwqDCoMKgwqDCoMKgwqDCoCB8
wqAgMSAtDQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmPC
oMKgIHzCoCA3IC0tLS0tLS0NCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kcnYuY8KgwqDCoMKgwqAgfMKgIDggLS0tLS0tLS0NCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jIHwgMTQgKysrKysrKysrLS0tLS0NCj4+IMKgIDQg
ZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkNCj4+DQo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmggDQo+PiBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oDQo+PiBpbmRleCAxOWEwMDI4MmUzNGMu
LmU1NGYzMTg2NWY2MCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdS5oDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaA0K
Pj4gQEAgLTE0Miw3ICsxNDIsNiBAQCBleHRlcm4gdWludCBhbWRncHVfc2RtYV9waGFzZV9xdWFu
dHVtOw0KPj4gwqAgZXh0ZXJuIGNoYXIgKmFtZGdwdV9kaXNhYmxlX2N1Ow0KPj4gwqAgZXh0ZXJu
IGNoYXIgKmFtZGdwdV92aXJ0dWFsX2Rpc3BsYXk7DQo+PiDCoCBleHRlcm4gdWludCBhbWRncHVf
cHBfZmVhdHVyZV9tYXNrOw0KPj4gLWV4dGVybiBpbnQgYW1kZ3B1X3ZyYW1fcGFnZV9zcGxpdDsN
Cj4+IMKgIGV4dGVybiBpbnQgYW1kZ3B1X25nZzsNCj4+IMKgIGV4dGVybiBpbnQgYW1kZ3B1X3By
aW1fYnVmX3Blcl9zZTsNCj4+IMKgIGV4dGVybiBpbnQgYW1kZ3B1X3Bvc19idWZfcGVyX3NlOw0K
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2Uu
YyANCj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQo+PiBp
bmRleCBkMDBmZDVkZDMwN2EuLmVmN2Q5OWViZTkyZCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQo+PiBAQCAtOTczLDEzICs5NzMsNiBAQCBz
dGF0aWMgaW50IGFtZGdwdV9kZXZpY2VfY2hlY2tfYXJndW1lbnRzKHN0cnVjdCANCj4+IGFtZGdw
dV9kZXZpY2UgKmFkZXYpDQo+PiDCoCDCoMKgwqDCoMKgIGFtZGdwdV9kZXZpY2VfY2hlY2tfYmxv
Y2tfc2l6ZShhZGV2KTsNCj4+IMKgIC3CoMKgwqAgaWYgKGFtZGdwdV92cmFtX3BhZ2Vfc3BsaXQg
IT0gLTEgJiYgKGFtZGdwdV92cmFtX3BhZ2Vfc3BsaXQgPCANCj4+IDE2IHx8DQo+PiAtwqDCoMKg
wqDCoMKgwqAgIWlzX3Bvd2VyX29mXzIoYW1kZ3B1X3ZyYW1fcGFnZV9zcGxpdCkpKSB7DQo+PiAt
wqDCoMKgwqDCoMKgwqAgZGV2X3dhcm4oYWRldi0+ZGV2LCAiaW52YWxpZCBWUkFNIHBhZ2Ugc3Bs
aXQgKCVkKVxuIiwNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYW1kZ3B1X3ZyYW1fcGFn
ZV9zcGxpdCk7DQo+PiAtwqDCoMKgwqDCoMKgwqAgYW1kZ3B1X3ZyYW1fcGFnZV9zcGxpdCA9IDEw
MjQ7DQo+PiAtwqDCoMKgIH0NCj4+IC0NCj4+IMKgwqDCoMKgwqAgcmV0ID0gYW1kZ3B1X2Rldmlj
ZV9nZXRfam9iX3RpbWVvdXRfc2V0dGluZ3MoYWRldik7DQo+PiDCoMKgwqDCoMKgIGlmIChyZXQp
IHsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGFkZXYtPmRldiwgImludmFsaWQgbG9j
a3VwX3RpbWVvdXQgcGFyYW1ldGVyIA0KPj4gc3ludGF4XG4iKTsNCj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgDQo+PiBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYw0KPj4gaW5kZXggMWYzOGQ2ZmMxZmUzLi5lZjIy
YTJhMjU0NDggMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZHJ2LmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYu
Yw0KPj4gQEAgLTEwOCw3ICsxMDgsNiBAQCBpbnQgYW1kZ3B1X3ZtX2ZyYWdtZW50X3NpemUgPSAt
MTsNCj4+IMKgIGludCBhbWRncHVfdm1fYmxvY2tfc2l6ZSA9IC0xOw0KPj4gwqAgaW50IGFtZGdw
dV92bV9mYXVsdF9zdG9wID0gMDsNCj4+IMKgIGludCBhbWRncHVfdm1fZGVidWcgPSAwOw0KPj4g
LWludCBhbWRncHVfdnJhbV9wYWdlX3NwbGl0ID0gNTEyOw0KPj4gwqAgaW50IGFtZGdwdV92bV91
cGRhdGVfbW9kZSA9IC0xOw0KPj4gwqAgaW50IGFtZGdwdV9leHBfaHdfc3VwcG9ydCA9IDA7DQo+
PiDCoCBpbnQgYW1kZ3B1X2RjID0gLTE7DQo+PiBAQCAtMzQyLDEzICszNDEsNiBAQCBtb2R1bGVf
cGFyYW1fbmFtZWQodm1fZGVidWcsIGFtZGdwdV92bV9kZWJ1ZywgDQo+PiBpbnQsIDA2NDQpOw0K
Pj4gwqAgTU9EVUxFX1BBUk1fREVTQyh2bV91cGRhdGVfbW9kZSwgIlZNIHVwZGF0ZSB1c2luZyBD
UFUgKDAgPSBuZXZlciANCj4+IChkZWZhdWx0IGV4Y2VwdCBmb3IgbGFyZ2UgQkFSKExCKSksIDEg
PSBHcmFwaGljcyBvbmx5LCAyID0gQ29tcHV0ZSANCj4+IG9ubHkgKGRlZmF1bHQgZm9yIExCKSwg
MyA9IEJvdGgiKTsNCj4+IMKgIG1vZHVsZV9wYXJhbV9uYW1lZCh2bV91cGRhdGVfbW9kZSwgYW1k
Z3B1X3ZtX3VwZGF0ZV9tb2RlLCBpbnQsIDA0NDQpOw0KPj4gwqAgLS8qKg0KPj4gLSAqIERPQzog
dnJhbV9wYWdlX3NwbGl0IChpbnQpDQo+PiAtICogT3ZlcnJpZGUgdGhlIG51bWJlciBvZiBwYWdl
cyBhZnRlciB3ZSBzcGxpdCBWUkFNIGFsbG9jYXRpb25zIA0KPj4gKGRlZmF1bHQgNTEyLCAtMSA9
IGRpc2FibGUpLiBUaGUgZGVmYXVsdCBpcyA1MTIuDQo+PiAtICovDQo+PiAtTU9EVUxFX1BBUk1f
REVTQyh2cmFtX3BhZ2Vfc3BsaXQsICJOdW1iZXIgb2YgcGFnZXMgYWZ0ZXIgd2Ugc3BsaXQgDQo+
PiBWUkFNIGFsbG9jYXRpb25zIChkZWZhdWx0IDUxMiwgLTEgPSBkaXNhYmxlKSIpOw0KPj4gLW1v
ZHVsZV9wYXJhbV9uYW1lZCh2cmFtX3BhZ2Vfc3BsaXQsIGFtZGdwdV92cmFtX3BhZ2Vfc3BsaXQs
IGludCwgMDQ0NCk7DQo+PiAtDQo+PiDCoCAvKioNCj4+IMKgwqAgKiBET0M6IGV4cF9od19zdXBw
b3J0IChpbnQpDQo+PiDCoMKgICogRW5hYmxlIGV4cGVyaW1lbnRhbCBodyBzdXBwb3J0ICgxID0g
ZW5hYmxlKS4gVGhlIGRlZmF1bHQgaXMgMCANCj4+IChkaXNhYmxlZCkuDQo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMgDQo+PiBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jDQo+PiBpbmRleCBlYzll
YTNmZGJiNGEuLjBiYzAxZTI1YTBiNCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYw0KPj4gQEAgLTI4NCwxNyArMjg0LDIxIEBAIHN0YXRp
YyBpbnQgYW1kZ3B1X3ZyYW1fbWdyX25ldyhzdHJ1Y3QgDQo+PiB0dG1fbWVtX3R5cGVfbWFuYWdl
ciAqbWFuLA0KPj4gwqDCoMKgwqDCoCBpZiAoIWxwZm4pDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
bHBmbiA9IG1hbi0+c2l6ZTsNCj4+IMKgIC3CoMKgwqAgaWYgKHBsYWNlLT5mbGFncyAmIFRUTV9Q
TF9GTEFHX0NPTlRJR1VPVVMgfHwNCj4+IC3CoMKgwqDCoMKgwqDCoCBhbWRncHVfdnJhbV9wYWdl
X3NwbGl0ID09IC0xKSB7DQo+PiArwqDCoMKgIGlmIChwbGFjZS0+ZmxhZ3MgJiBUVE1fUExfRkxB
R19DT05USUdVT1VTKSB7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcGFnZXNfcGVyX25vZGUgPSB+
MHVsOw0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIG51bV9ub2RlcyA9IDE7DQo+PiDCoMKgwqDCoMKg
IH0gZWxzZSB7DQo+PiAtwqDCoMKgwqDCoMKgwqAgcGFnZXNfcGVyX25vZGUgPSBtYXgoKHVpbnQz
Ml90KWFtZGdwdV92cmFtX3BhZ2Vfc3BsaXQsDQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBtZW0tPnBhZ2VfYWxpZ25tZW50KTsNCj4+ICsjaWZkZWYgQ09ORklH
X1RSQU5TUEFSRU5UX0hVR0VQQUdFDQo+PiArwqDCoMKgwqDCoMKgwqAgcGFnZXNfcGVyX25vZGUg
PSBIUEFHRV9QTURfTlI7DQo+PiArI2Vsc2UNCj4+ICvCoMKgwqDCoMKgwqDCoCAvKiBkZWZhdWx0
IHRvIDUxMk1CICovDQo+PiArwqDCoMKgwqDCoMKgwqAgcGFnZXNfcGVyX25vZGUgPSAoNTEyVUwg
PDwgKDIwVUwgLSBQQUdFX1NISUZUKSk7DQo+DQo+IFRoYXQgaXMgd2F5IHRvIGxhcmdlLCB0aGUg
ZmFsbGJhY2sgc2hvdWxkIGJlIG9ubHkgMk1CICg1MTIgcGFnZXMpLg0KPg0KPiBDaHJpc3RpYW4u
DQo+DQo+PiArI2VuZGlmDQo+PiArwqDCoMKgwqDCoMKgwqAgcGFnZXNfcGVyX25vZGUgPSBtYXgo
KHVpbnQzMl90KXBhZ2VzX3Blcl9ub2RlLCANCj4+IG1lbS0+cGFnZV9hbGlnbm1lbnQpOw0KPj4g
wqDCoMKgwqDCoMKgwqDCoMKgIG51bV9ub2RlcyA9IERJVl9ST1VORF9VUChtZW0tPm51bV9wYWdl
cywgcGFnZXNfcGVyX25vZGUpOw0KPj4gwqDCoMKgwqDCoCB9DQo+PiDCoCAtwqDCoMKgIG5vZGVz
ID0ga3ZtYWxsb2NfYXJyYXkobnVtX25vZGVzLCBzaXplb2YoKm5vZGVzKSwNCj4+ICvCoMKgwqAg
bm9kZXMgPSBrdm1hbGxvY19hcnJheSgodWludDMyX3QpbnVtX25vZGVzLCBzaXplb2YoKm5vZGVz
KSwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgR0ZQX0tFUk5F
TCB8IF9fR0ZQX1pFUk8pOw0KPj4gwqDCoMKgwqDCoCBpZiAoIW5vZGVzKQ0KPj4gwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiAtRU5PTUVNOw0KPg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
