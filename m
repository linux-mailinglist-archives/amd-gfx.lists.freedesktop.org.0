Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A241B47D1
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Sep 2019 09:00:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 178C66E158;
	Tue, 17 Sep 2019 07:00:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750070.outbound.protection.outlook.com [40.107.75.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65AF96E158
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 07:00:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BcHL8N0iy8LAddZd3vG166MN/s763vslRgfqZt6C+c0MRQ7121KUjUc4dJId6dN4r2CVIw9hMebG6RsPgS2/my4XwOCzcAIhdnN6ZF6GcsjWERd3HNLaSVFQS3Pu4WiKoXefjQCTHhkUDKQtv4d2TEqzJ8waCFEaEe2z1yDIsdKVEXgUXXIsVYXAPuWC6nAmTPD03KrweZdsmUnwc+jveLphZqcS9NdBAdJAZT38r51lhO7cgFB6zmuVyXwmCO0Bpu/IEEezDmBiGio0dBAg1JR6krSkkWBm8m6wW6Gw3VoZrLP3NBLWJ5a+x5tNcpL+IbqJGFO0XYr+5QCcT3jpSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QGq5B8dCdppbFnVtWjCHe/kLZarE49YwqF4WYJRFevA=;
 b=DuWZVTSSP2f/jOqwXBSFec63UMC6RmqSgJsIm3RglU0DUOuYT13rUN82S6REPlOY/MDQpEYTHXzXI24CeWHaQXdVDYe4I3Ope/VlfYWNLgWRJ/C4Y9WfLF58ypupDjjjoPMxnBY6GH6Kf7PWO1ApvXsCEP228O6e1eGSUVZ81lFqqJhKDpTVCa7qATAoZCoIhGNBspCBHhqNTwYg3wJBjt61fi712daRTzTNfv30K12L0dNUbWNXp2Nk0ESADEvHaeNvsS5/Q+muLOnlK6B8a75ytporw+nLFF/hnqPGwDJNEd3weCWNXOeNWo6jDjXE/Bo4feuehnxNa3vpMuUy/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB4078.namprd12.prod.outlook.com (52.135.51.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Tue, 17 Sep 2019 07:00:34 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 07:00:34 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Chen, Guchun" <Guchun.Chen@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: RE: [PATCH] drm/amdgpu: replace DRM_ERROR with DRM_WARN in
 ras_reserve_bad_pages
Thread-Topic: [PATCH] drm/amdgpu: replace DRM_ERROR with DRM_WARN in
 ras_reserve_bad_pages
Thread-Index: AQHVbSCpRnXut+ezvEiOIBHKn2ZPqqcvbkKggAACPRA=
Date: Tue, 17 Sep 2019 07:00:34 +0000
Message-ID: <MN2PR12MB3054549648F8445590F7D41EB08F0@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <20190917062458.29589-1-tao.zhou1@amd.com>
 <BYAPR12MB28060C4BE2088D071875ABB1F18F0@BYAPR12MB2806.namprd12.prod.outlook.com>
In-Reply-To: <BYAPR12MB28060C4BE2088D071875ABB1F18F0@BYAPR12MB2806.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e69153e5-e581-452e-a8c1-08d73b3cbc84
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB4078; 
x-ms-traffictypediagnostic: MN2PR12MB4078:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB407897FAACBD4B232059C86DB08F0@MN2PR12MB4078.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(13464003)(199004)(189003)(66556008)(6436002)(66446008)(3846002)(86362001)(53546011)(186003)(6636002)(7696005)(26005)(71200400001)(2501003)(76176011)(6506007)(8676002)(14444005)(486006)(7736002)(446003)(102836004)(14454004)(11346002)(305945005)(71190400001)(498600001)(25786009)(5660300002)(74316002)(256004)(476003)(66066001)(66946007)(33656002)(6116002)(64756008)(52536014)(8936002)(99286004)(66476007)(81166006)(81156014)(2906002)(9686003)(6246003)(229853002)(55016002)(76116006)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4078;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pQJeg+CR34e5zuDmtOsgk1Q9hxVByRLojYSIakhIPgzN5dv12XJdnGcQxNgn1pkpqriWOQxmtSoiZn/m4R77t1BmjO4J67oAPglUEeQ/ijCSvckC8FUKnVteM7uUfBMLFPaOjZV2SfPMmdefF1fpCgxh8BPzF9mxuenEkFK2v5gJCXHVr1G3hSeOMFEQ5aGNZTA3qhOndEOmYSiQWhBQTeKZhAK1gqnlrTXY6y+/kTlszR3SPA6bMqOUzpPuqsFHo210ESEcSmagZZ0sMgvqaHq6AVAlTTpMtrnrOG5qRGACInmDBT1uoHZIbg6yhnBnTSjHnMiqOQ3ZWXKUamVhaRzUWyqJO9XWgsN+TaVfbwCpW/mLAI6Q1ZcxsMFOrHUO4iysSpd5Aib7DyDQzqE2q4DN6/zczZjEnxFnG5BqPfY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e69153e5-e581-452e-a8c1-08d73b3cbc84
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 07:00:34.1182 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D65QeviGOGuxDQH6Xs3sfRe30+trORkmLAoswQlAG0EOR2JioWPFoyDs8bcbKrl/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4078
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QGq5B8dCdppbFnVtWjCHe/kLZarE49YwqF4WYJRFevA=;
 b=Sg7+7oG5DxbmEjmN2BTUtOPfJA3kA9D6z8Q29FYz5YXzM6kSiSkDVhd5kfugtkFY4qi0Htzu+tD3VKv9NZeBuq8j8UTk3bAMmg1+uWZLUrIaeqpLmXyYU777dtIHFfLJU7jv71s2HESI/2i88ppoD6BqJlqAZG+68Qpp8r4bu4k=
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
dWNodW4uQ2hlbkBhbWQuY29tPg0KPiBTZW50OiAyMDE55bm0OeaciDE35pelIDE0OjUyDQo+IFRv
OiBaaG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnOw0KPiBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KPiBTdWJq
ZWN0OiBSRTogW1BBVENIXSBkcm0vYW1kZ3B1OiByZXBsYWNlIERSTV9FUlJPUiB3aXRoIERSTV9X
QVJOIGluDQo+IHJhc19yZXNlcnZlX2JhZF9wYWdlcw0KPiANCj4gDQo+IA0KPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBaaG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT4N
Cj4gU2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDE3LCAyMDE5IDI6MjUgUE0NCj4gVG86IGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBDaGVuLCBHdWNodW4NCj4gPEd1Y2h1bi5DaGVuQGFt
ZC5jb20+OyBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KPiBDYzogWmhv
dTEsIFRhbyA8VGFvLlpob3UxQGFtZC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZGdw
dTogcmVwbGFjZSBEUk1fRVJST1Igd2l0aCBEUk1fV0FSTiBpbg0KPiByYXNfcmVzZXJ2ZV9iYWRf
cGFnZXMNCj4gDQo+IFRoZXJlIGFyZSB0d28gY2FzZXMgb2YgcmVzZXJ2ZSBlcnJvciBzaG91bGQg
YmUgaWdub3JlZDoNCj4gMSkgYSByYXMgYmFkIHBhZ2UgaGFzIGJlZW4gYWxsb2NhdGVkICh1c2Vk
IGJ5IHNvbWVvbmUpOw0KPiAyKSBhIHJhcyBiYWQgcGFnZSBoYXMgYmVlbiByZXNlcnZlZCAoZHVw
bGljYXRlIGVycm9yIGluamVjdGlvbiBmb3Igb25lIHBhZ2UpOw0KPiANCj4gRFJNX0VSUk9SIGlz
IHVubmVjZXNzYXJ5IGZvciB0aGUgZmFpbHVyZSBvZiBiYWQgcGFnZSByZXNlcnZlDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBUYW8gWmhvdSA8dGFvLnpob3UxQGFtZC5jb20+DQo+IC0tLQ0KPiAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIHwgNyArKysrKystDQo+ICAxIGZp
bGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jDQo+IGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jDQo+IGluZGV4IDc5ZTVlNWJlOGIzNC4u
NWY2MjNkYWY1MDc4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcmFzLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jh
cy5jDQo+IEBAIC0xNDA5LDEwICsxNDA5LDE1IEBAIGludCBhbWRncHVfcmFzX3Jlc2VydmVfYmFk
X3BhZ2VzKHN0cnVjdA0KPiBhbWRncHVfZGV2aWNlICphZGV2KQ0KPiAgCWZvciAoaSA9IGRhdGEt
Pmxhc3RfcmVzZXJ2ZWQ7IGkgPCBkYXRhLT5jb3VudDsgaSsrKSB7DQo+ICAJCWJwID0gZGF0YS0+
YnBzW2ldLnJldGlyZWRfcGFnZTsNCj4gDQo+ICsJCS8qIFRoZXJlIGFyZSB0d28gY2FzZXMgb2Yg
cmVzZXJ2ZSBlcnJvciBzaG91bGQgYmUgaWdub3JlZDoNCj4gKwkJICogMSkgYSByYXMgYmFkIHBh
Z2UgaGFzIGJlZW4gYWxsb2NhdGVkICh1c2VkIGJ5IHNvbWVvbmUpOw0KPiArCQkgKiAyKSBhIHJh
cyBiYWQgcGFnZSBoYXMgYmVlbiByZXNlcnZlZCAoZHVwbGljYXRlIGVycm9yDQo+IGluamVjdGlv
bg0KPiArCQkgKiAgICBmb3Igb25lIHBhZ2UpOw0KPiArCQkgKi8NCj4gIAkJaWYgKGFtZGdwdV9i
b19jcmVhdGVfa2VybmVsX2F0KGFkZXYsIGJwIDw8IFBBR0VfU0hJRlQsDQo+IFBBR0VfU0laRSwN
Cj4gIAkJCQkJICAgICAgIEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0sDQo+ICAJCQkJCSAgICAgICAm
Ym8sIE5VTEwpKQ0KPiBbR3VjaHVuXURvIHdlIG5lZWQgdG8gY2hhbmdlIFBBR0VfU0hJRlQgdG8g
QU1ER1BVX0dQVV9QQUdFX1NISUZUDQo+IGhlcmU/DQpbVGFvXSBBbGV4IGhhcyBhbm90aGVyIHBh
dGNoIHRvIGZpeCBpdCwgeW91IGNhbiBmaW5kIGl0IGluIG1haWwgbGlzdC4NCg0KPiANCj4gLQkJ
CURSTV9FUlJPUigiUkFTIEVSUk9SOiByZXNlcnZlIHZyYW0gJWxseCBmYWlsXG4iLA0KPiBicCk7
DQo+ICsJCQlEUk1fV0FSTigiUkFTIFdBUk46IHJlc2VydmUgdnJhbSBmb3IgcmV0aXJlZA0KPiBw
YWdlICVsbHggZmFpbFxuIiwgYnApOw0KPiANCj4gIAkJZGF0YS0+YnBzX2JvW2ldID0gYm87DQo+
ICAJCWRhdGEtPmxhc3RfcmVzZXJ2ZWQgPSBpICsgMTsNCj4gLS0NCj4gMi4xNy4xDQoNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
