Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43775BB2D3
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 13:33:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C866E88F;
	Mon, 23 Sep 2019 11:33:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810084.outbound.protection.outlook.com [40.107.81.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 412AA6E88F
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 11:33:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QC6kIwCniZvdubuhCvettrGicUzNOfDPQ1bl5wyVvxb6fmLyux4L07TKbfzr8WhwymP2PVPygs21qWNQT/M2eqRJseBl41pb3lsA8XcRghhwKAtD3DbcIxdJ12HN8KEQ3LRx7QVfRxX721c8I+6vU9FeMxjRl3fDBXZPrMDHrlkCrb7O97H8cw8hH93sUAI1+kN4/EKWW3os8PuXgjwxIocFdQ6+zAC9EhLomuHhplzufezZI8/bBUehvSePZ2EqUNJSWOj+l2goBbpXk68iTD4C6rk7gFGiQE+kMT4ys0aD9Gk527KUni7NaZOm1b+HdqebTXCj6rfDXxzHYH2grQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJhXMQdGxOJEuUg9AP1qd35KmiJyUY5fEKyZK3hZQfU=;
 b=RREcJie1TWhnontS2rN7eBMT8oWp0gBMVqLCCee7QHTvpdHgvqX+gZbZTl6bxilmsw5/vxeQ67S6DgNFuAqVPS0fPMVCYy3honEcLceHC79ftD/W053W5kj/xek5X151BJWVHQZVCrwpK0TRPOdqiBSunKhQoI2rfjrfMBEpqet6Y2mxuIdIO6suHxV/iixlCkqI035RVs/0WdM1inzKqtkx/pdkCQlFvjBbD1FJVmEuI2Ju/fUcH820t2sRAXx6ug9xIDNPuYX4wSWCk+KV9IQj9A8qfXORQG6hJ4+Skrb6ZOKTBdFka3qqczNUI4rjG33DUEWElxM5PddO6l+Owg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3167.namprd12.prod.outlook.com (20.179.80.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.25; Mon, 23 Sep 2019 11:32:56 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 11:32:56 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Chen, Guchun" <Guchun.Chen@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: RE: [PATCH 11/21] drm/amdgpu: add common gfx_ras_fini function
Thread-Topic: [PATCH 11/21] drm/amdgpu: add common gfx_ras_fini function
Thread-Index: AQHVbrmnsWdXo21mYEuIaZV8FiS/j6czCpiAgAYcJkA=
Date: Mon, 23 Sep 2019 11:32:55 +0000
Message-ID: <MN2PR12MB305448C7EEB0FD3B0C66B374B0850@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <20190919071115.16552-1-tao.zhou1@amd.com>
 <20190919071115.16552-12-tao.zhou1@amd.com>
 <BYAPR12MB280656252D3E47587A1563B8F1890@BYAPR12MB2806.namprd12.prod.outlook.com>
In-Reply-To: <BYAPR12MB280656252D3E47587A1563B8F1890@BYAPR12MB2806.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 58ecdaf4-fc77-4dc1-36d2-08d74019c780
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3167; 
x-ms-traffictypediagnostic: MN2PR12MB3167:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB31676BB20FE7662DEB56D7AFB0850@MN2PR12MB3167.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(366004)(346002)(376002)(396003)(13464003)(189003)(199004)(6436002)(9686003)(55016002)(26005)(5660300002)(81166006)(81156014)(8676002)(229853002)(256004)(99286004)(74316002)(66066001)(102836004)(478600001)(8936002)(76176011)(305945005)(186003)(7696005)(7736002)(25786009)(14454004)(316002)(33656002)(53546011)(6506007)(66946007)(66556008)(66476007)(52536014)(76116006)(6246003)(66446008)(64756008)(71200400001)(71190400001)(446003)(6636002)(2501003)(2906002)(486006)(86362001)(3846002)(476003)(11346002)(6116002)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3167;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 56yh3i1u58Kf1Jg2EymfdKPURXYTcoDRShoShyhtDg87hheeit2BFmT7nmxPf2Cir03O6hdEaSLjZzh5SzdbCtQm0CQ92neOGvNIzBdU09rFGWXT/iTOskzCRtKQ4e0UUX2+xmBluaC+pr6fqWkpMBFWKJTfxf7Yo9EuGcCMbfwO8RiFrvJoM9r51Mlf69VZiZhbUsubGMIATR1CKjtPnWFH84CaXlYHEI7UZ/aznB8//1FSwJCJ465Dmglm/XICkqNYkWtwwg0IZJs9zSzMNwx1d51yRi2dpX7LcwrFADZ5QW/I71uKDNh4tZH9Fbs7eSt1HSYT/P6dlMiabYHF2iVB6CYsVMhZ8zcpyqqXj4tgtp7VbG9KDXU3k79T3L+RQIm8zpn9C25FPt2EKinZpgDKLBgUVdBXC7BRZ9WwM3M=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ecdaf4-fc77-4dc1-36d2-08d74019c780
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 11:32:56.0353 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RV+1fsjC2FV9QmWiLPugOJNETLdub5p9FKmJs6+qiHJfc3QRiNHBPiEhmb5IGpQo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3167
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJhXMQdGxOJEuUg9AP1qd35KmiJyUY5fEKyZK3hZQfU=;
 b=Gm8UrLBUUzaovA9SgU2g9FGN+hZQNGVC6jARtw/pxV0IXDVWF+8Ech5oO6qCKiGeH4S+lm0QNW0WemvAHKgHNk0mRoqgGb+F11N5N8Tij+5cQCXr4D9jUVdmGSJRFFKO0KosdXnDus5ubS91SB6kuiT62ZMaGY/7Y0Ht0/UzOAk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tao.Zhou1@amd.com; 
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2hlbiwgR3VjaHVuIDxH
dWNodW4uQ2hlbkBhbWQuY29tPg0KPiBTZW50OiAyMDE55bm0OeaciDE55pelIDIyOjExDQo+IFRv
OiBaaG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnOw0KPiBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KPiBTdWJq
ZWN0OiBSRTogW1BBVENIIDExLzIxXSBkcm0vYW1kZ3B1OiBhZGQgY29tbW9uIGdmeF9yYXNfZmlu
aSBmdW5jdGlvbg0KPiANCj4gDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IFpob3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgU2VwdGVt
YmVyIDE5LCAyMDE5IDM6MTMgUE0NCj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
OyBDaGVuLCBHdWNodW4NCj4gPEd1Y2h1bi5DaGVuQGFtZC5jb20+OyBaaGFuZywgSGF3a2luZyA8
SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KPiBDYzogWmhvdTEsIFRhbyA8VGFvLlpob3UxQGFtZC5j
b20+DQo+IFN1YmplY3Q6IFtQQVRDSCAxMS8yMV0gZHJtL2FtZGdwdTogYWRkIGNvbW1vbiBnZnhf
cmFzX2ZpbmkgZnVuY3Rpb24NCj4gDQo+IGdmeF9yYXNfZmluaSBjYW4gYmUgc2hhcmVkIGFtb25n
IGFsbCBnZW5lcmF0aW9ucyBvZiBnZngNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFRhbyBaaG91IDx0
YW8uemhvdTFAYW1kLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZ2Z4LmMgfCAxNSArKysrKysrKysrKysrKysNCj4gZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2dmeC5oIHwgIDEgKw0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z2Z4X3Y5XzAuYyAgIHwgMTQgKy0tLS0tLS0tLS0tLS0NCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTcg
aW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2dmeC5jDQo+IGluZGV4IGU3ZDg3ZjcxNzczNy4uNGY2MzVmMjhlYjM0
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5jDQo+IEBAIC02
NTEsMyArNjUxLDE4IEBAIGludCBhbWRncHVfZ2Z4X2NwX2VjY19lcnJvcl9pcnEoc3RydWN0DQo+
IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICAJYW1kZ3B1X3Jhc19pbnRlcnJ1cHRfZGlzcGF0Y2go
YWRldiwgJmloX2RhdGEpOw0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiArDQo+ICt2b2lkIGFtZGdw
dV9nZnhfcmFzX2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpIHsNCj4gKwlpZiAoYW1k
Z3B1X3Jhc19pc19zdXBwb3J0ZWQoYWRldiwgQU1ER1BVX1JBU19CTE9DS19fR0ZYKSAmJg0KPiAr
CQkJYWRldi0+Z2Z4LnJhc19pZikgew0KPiArCQlzdHJ1Y3QgcmFzX2NvbW1vbl9pZiAqcmFzX2lm
ID0gYWRldi0+Z2Z4LnJhc19pZjsNCj4gKwkJc3RydWN0IHJhc19paF9pZiBpaF9pbmZvID0gew0K
PiArCQkJLmhlYWQgPSAqcmFzX2lmLA0KPiArCQkJLmNiID0gYW1kZ3B1X2dmeF9wcm9jZXNzX3Jh
c19kYXRhX2NiLA0KPiBbR3VjaHVuXUkgYmVsaWV2ZSBnZnggcmFzIGNiIGhhcyBiZWVuIHNwZWNp
ZmllZCBpbiBnZnggcmFzIGluaXQgc2VxdWVuY2UuIFRoZW4NCj4gdGhlIGNhdXNlIHNldCB0d2lj
ZSBoZXJlIGlzIHRvIGVuc3VyZSB0aGUgaW50ZXJydXB0IHJlbW92YWwgY2FuIGJlIGRvbmUNCj4g
Y29ycmVjdGw/DQpbVGFvXSBZZXMsIGloX2luZm8gaXMgbm90IGEgZ2xvYmFsIHZhcmlhYmxlLCB0
aGUgc2V0dGluZyBvZiBjYiBpcyBvbmx5IHRvIGZvcmNlIHJhc19sYXRlX2ZpbmkgdG8gZXhlY3V0
ZSByYXNfaW50ZXJydXB0X3JlbW92ZV9oYW5kbGVyLg0KDQo+ICsJCX07DQo+ICsNCj4gKwkJYW1k
Z3B1X3Jhc19sYXRlX2ZpbmkoYWRldiwgcmFzX2lmLCAmaWhfaW5mbyk7DQo+ICsJCWtmcmVlKHJh
c19pZik7DQo+ICsJfQ0KPiArfQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2dmeC5oDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2dmeC5oDQo+IGluZGV4IDYwMDU5OTE4MTYyMC4uOGYyZDEzN2Y0ZDIwIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmgNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5oDQo+IEBAIC0zOTEsNCArMzkxLDUgQEAg
aW50IGFtZGdwdV9nZnhfcHJvY2Vzc19yYXNfZGF0YV9jYihzdHJ1Y3QNCj4gYW1kZ3B1X2Rldmlj
ZSAqYWRldiwgIGludCBhbWRncHVfZ2Z4X2NwX2VjY19lcnJvcl9pcnEoc3RydWN0DQo+IGFtZGdw
dV9kZXZpY2UgKmFkZXYsDQo+ICAJCQkJICBzdHJ1Y3QgYW1kZ3B1X2lycV9zcmMgKnNvdXJjZSwN
Cj4gIAkJCQkgIHN0cnVjdCBhbWRncHVfaXZfZW50cnkgKmVudHJ5KTsNCj4gK3ZvaWQgYW1kZ3B1
X2dmeF9yYXNfZmluaShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7DQo+ICAjZW5kaWYNCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMNCj4gYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jDQo+IGluZGV4IDA4YjgwMTU3ZGYz
YS4uYWJkYmQ2OTM5NGU2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nZnhfdjlfMC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8w
LmMNCj4gQEAgLTIzMTcsMTkgKzIzMTcsNyBAQCBzdGF0aWMgaW50IGdmeF92OV8wX3N3X2Zpbmko
dm9pZCAqaGFuZGxlKQ0KPiAgCWludCBpOw0KPiAgCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNlICopaGFuZGxlOw0KPiANCj4gLQlpZiAoYW1kZ3B1X3Jh
c19pc19zdXBwb3J0ZWQoYWRldiwgQU1ER1BVX1JBU19CTE9DS19fR0ZYKSAmJg0KPiAtCQkJYWRl
di0+Z2Z4LnJhc19pZikgew0KPiAtCQlzdHJ1Y3QgcmFzX2NvbW1vbl9pZiAqcmFzX2lmID0gYWRl
di0+Z2Z4LnJhc19pZjsNCj4gLQkJc3RydWN0IHJhc19paF9pZiBpaF9pbmZvID0gew0KPiAtCQkJ
LmhlYWQgPSAqcmFzX2lmLA0KPiAtCQl9Ow0KPiAtDQo+IC0JCWFtZGdwdV9yYXNfZGVidWdmc19y
ZW1vdmUoYWRldiwgcmFzX2lmKTsNCj4gLQkJYW1kZ3B1X3Jhc19zeXNmc19yZW1vdmUoYWRldiwg
cmFzX2lmKTsNCj4gLQkJYW1kZ3B1X3Jhc19pbnRlcnJ1cHRfcmVtb3ZlX2hhbmRsZXIoYWRldiwg
ICZpaF9pbmZvKTsNCj4gLQkJYW1kZ3B1X3Jhc19mZWF0dXJlX2VuYWJsZShhZGV2LCByYXNfaWYs
IDApOw0KPiAtCQlrZnJlZShyYXNfaWYpOw0KPiAtCX0NCj4gKwlhbWRncHVfZ2Z4X3Jhc19maW5p
KGFkZXYpOw0KPiANCj4gIAlmb3IgKGkgPSAwOyBpIDwgYWRldi0+Z2Z4Lm51bV9nZnhfcmluZ3M7
IGkrKykNCj4gIAkJYW1kZ3B1X3JpbmdfZmluaSgmYWRldi0+Z2Z4LmdmeF9yaW5nW2ldKTsNCj4g
LS0NCj4gMi4xNy4xDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
