Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAABD05D3
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 05:21:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 884A36E8CF;
	Wed,  9 Oct 2019 03:21:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800044.outbound.protection.outlook.com [40.107.80.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE116E8CF
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2019 03:21:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eAFIgXSAY3huOobPXnD8Cj4g+RpJhvLAgolf0IHMe6XPGmW1PkTKdGLZD4ba3CadoCUJddpl5jYXR5nDkrmlhqg4zPpZsvsDdZQxHy2mjgfPZWneRL4IL6MZRbYUVtpTBLrkoAkP3MPk4cG/H1cV1dD+c/DYVoE3YgF25FDQH8yCSLBsxAb64ypSGMQ1jC8lZ/oNpgRy+eQY1yRPb0CgiNQFSjtapaV/6uymKhUvdaOT/twtIvnQvAF1xkg6dwX9nzTZ9cAZFx96ReSd3Ogz14q3b/w4ZslLVj40wkXw/RS4BIT4qoU7AU0EeR8sgZOtQqFtXa+2pDeDrf0afgnWcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vQ50OYhny/1+t1rK9cbCcOzhsEfde6zK+AGuhDIPkQ=;
 b=jFNWKhE1QvOkktjmSRq48cUtoyMCXzD8FzWm6L9B9ctRtpdt6v3LjHv+qkt8nNTnRyHwAIZgd3x8ZF9PirQay5F/IK6cr2VzpVjqJ6l0fgOHsbtIuCFCI88H2OptLFZ01og18laocj5Ot4VFh4aTYsmqBF8XZavWMOGOU8rzmSh++y9uqE03du9ooEPFZb30aO4+UjtnuJD1obOsH+UMIYm5W6RZ4NA1UxkhSKjPrfjGTTDJGTcCmiltpWcO8nG+/2g6gwEMbnkXSjyuCvEfbGlMQIWmRTt30VmaEKQyt+wYSVrIHMNB/obSQNE+3oRUmz0NukI8AirKvUEjToQyWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB4152.namprd12.prod.outlook.com (20.180.6.72) by
 CH2PR12MB4183.namprd12.prod.outlook.com (20.180.17.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Wed, 9 Oct 2019 03:21:43 +0000
Received: from CH2PR12MB4152.namprd12.prod.outlook.com
 ([fe80::80b1:7ed1:2bd5:4bd4]) by CH2PR12MB4152.namprd12.prod.outlook.com
 ([fe80::80b1:7ed1:2bd5:4bd4%3]) with mapi id 15.20.2327.026; Wed, 9 Oct 2019
 03:21:43 +0000
From: "Tuikov, Luben" <Luben.Tuikov@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 3/8] drm/amdgpu: introduce psp_v11_0_is_sos_alive interface
Thread-Topic: [PATCH 3/8] drm/amdgpu: introduce psp_v11_0_is_sos_alive
 interface
Thread-Index: AQHVfg7Bak1tmTKqHU6PbfU/6uf6LKdRpTkA
Date: Wed, 9 Oct 2019 03:21:43 +0000
Message-ID: <4491c00e-b739-9982-e325-f4c1b76307fe@amd.com>
References: <20191008192934.5481-1-alexander.deucher@amd.com>
 <20191008192934.5481-4-alexander.deucher@amd.com>
In-Reply-To: <20191008192934.5481-4-alexander.deucher@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::29) To CH2PR12MB4152.namprd12.prod.outlook.com
 (2603:10b6:610:a7::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6919462d-1a11-403c-50bd-08d74c67cecb
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CH2PR12MB4183:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB418312C687D978DE05D3428D99950@CH2PR12MB4183.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 018577E36E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(199004)(189003)(4326008)(14454004)(71190400001)(6116002)(52116002)(6506007)(3846002)(76176011)(386003)(53546011)(14444005)(36756003)(316002)(110136005)(54906003)(31686004)(71200400001)(478600001)(25786009)(256004)(186003)(64756008)(66476007)(66446008)(66556008)(66946007)(86362001)(8936002)(81156014)(305945005)(6512007)(6436002)(2906002)(476003)(7736002)(8676002)(81166006)(31696002)(2501003)(66066001)(26005)(6246003)(2616005)(102836004)(99286004)(11346002)(446003)(229853002)(486006)(6486002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4183;
 H:CH2PR12MB4152.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MjGz9ntPZeQY5BW5+fRhSLoT0wN2vCtybt7q1P8AE9YlBkri350eycUyBks2us2eoTay1OVRLIf0YnXc7yv9NUNC5b+d8PMhDoBjBZozi2m6zQgCAjbo67/0vBxXwMgvX8UCI4Bs+xxedzGsbxBuaMk2tvGD8wh8XZjm/6l0cg1w/GAgpVa3ASkv3e9HM2AHTy9CQwbTH/QFzQ95CxgbqX1sDs/sCiYxxMups7wR8vlSCZhChtNs2mqbLIIv3DhBWKasl3vxzwO6LLTdOSnYfBRx5/B4cVx5Ao/ZXx5URLoRkgTfreps81Iuz9DhoXqnGkA5yuMShSB9vO6DrNdZTHRxUeqxiYl18A8ObsmuZDDbHFMIrlB0jIXhtyVtXnf6YX/ffrPtxLa3BMUTcGeDgn6W6YocChYdsAquDNki1pk=
Content-ID: <FB9B89934D64F643BDB580EC651C675B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6919462d-1a11-403c-50bd-08d74c67cecb
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2019 03:21:43.4940 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BNuHcOJN6CH9PplXsBf15sx+XlALCVpgZfqhsCuUS6/iavxocQX/5AjE8B/j3Vzp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4183
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vQ50OYhny/1+t1rK9cbCcOzhsEfde6zK+AGuhDIPkQ=;
 b=ZT67AlXWc4WNsFM63Q4f/GieD57jnZ9GEN3lt6qefceMuxsjaQlUgAtfkHL7c1DEevgSJro88Tzb93P5EkmL//obRIAX2qJdjiyCecoNKtd9qLvOqQ6tzJJkmqYx55Z9BWvUziRKp8nS56kh0LtwhjAI5U9PipXPVp6NbNClIfk=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Yin,
 Tianci \(Rico\)" <Tianci.Yin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0wOCAzOjI5IHAubS4sIEFsZXggRGV1Y2hlciB3cm90ZToNCj4gRnJvbTogIlRp
YW5jaS5ZaW4iIDx0aWFuY2kueWluQGFtZC5jb20+DQo+IA0KPiBpbnRyb2R1Y2UgcHNwX3YxMV8w
X2lzX3Nvc19hbGl2ZSBmdW5jIGZvciBjb21tb24gdXNlLg0KPiANCj4gQ2hhbmdlLUlkOiBJZWUw
YTZkZDkyNGQ2YTRiMTY0ZWI3NTFjMGJlYzQ5ZmNiN2Q3OTQ4Mw0KPiBSZXZpZXdlZC1ieTogQWxl
eCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBU
aWFuY2kuWWluIDx0aWFuY2kueWluQGFtZC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvcHNwX3YxMV8wLmMgfCAyMiArKysrKysrKysrKysrLS0tLS0tLS0tDQo+ICAx
IGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92MTFfMC5jDQo+IGluZGV4IDA0MzE4Y2ZkNTBhOC4u
ZTc0YTk1MmEzZjdjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9w
c3BfdjExXzAuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAu
Yw0KPiBAQCAtMjA2LDE4ICsyMDYsMjYgQEAgc3RhdGljIGludCBwc3BfdjExXzBfaW5pdF9taWNy
b2NvZGUoc3RydWN0IHBzcF9jb250ZXh0ICpwc3ApDQo+ICAJcmV0dXJuIGVycjsNCj4gIH0NCj4g
IA0KPiArc3RhdGljIGJvb2wgcHNwX3YxMV8wX2lzX3Nvc19hbGl2ZShzdHJ1Y3QgcHNwX2NvbnRl
eHQgKnBzcCkNCj4gK3sNCj4gKwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHBzcC0+YWRl
djsNCj4gKwl1aW50MzJfdCBzb2xfcmVnOw0KPiArDQo+ICsJc29sX3JlZyA9IFJSRUczMl9TT0Mx
NShNUDAsIDAsIG1tTVAwX1NNTl9DMlBNU0dfODEpOw0KPiArDQo+ICsJcmV0dXJuIChzb2xfcmVn
ICE9IDB4MCk7DQoNClBhcmVudGhlc2lzIGFyZSB1bm5lY2Vzc2FyeSBpbiB0aGUgcmV0dXJuIGFu
ZCBub3QgaW4gTEtDUy4NCg0KUmVnYXJkcywNCkx1YmVuDQoNCj4gK30NCj4gKw0KPiAgc3RhdGlj
IGludCBwc3BfdjExXzBfYm9vdGxvYWRlcl9sb2FkX2tkYihzdHJ1Y3QgcHNwX2NvbnRleHQgKnBz
cCkNCj4gIHsNCj4gIAlpbnQgcmV0Ow0KPiAgCXVpbnQzMl90IHBzcF9nZnhkcnZfY29tbWFuZF9y
ZWcgPSAwOw0KPiAgCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gcHNwLT5hZGV2Ow0KPiAt
CXVpbnQzMl90IHNvbF9yZWc7DQo+ICANCj4gIAkvKiBDaGVjayB0T1Mgc2lnbiBvZiBsaWZlIHJl
Z2lzdGVyIHRvIGNvbmZpcm0gc3lzIGRyaXZlciBhbmQgc09TDQo+ICAJICogYXJlIGFscmVhZHkg
YmVlbiBsb2FkZWQuDQo+ICAJICovDQo+IC0Jc29sX3JlZyA9IFJSRUczMl9TT0MxNShNUDAsIDAs
IG1tTVAwX1NNTl9DMlBNU0dfODEpOw0KPiAtCWlmIChzb2xfcmVnKSB7DQo+ICsJaWYgKHBzcF92
MTFfMF9pc19zb3NfYWxpdmUocHNwKSkgew0KPiAgCQlwc3AtPnNvc19md192ZXJzaW9uID0gUlJF
RzMyX1NPQzE1KE1QMCwgMCwgbW1NUDBfU01OX0MyUE1TR181OCk7DQo+ICAJCWRldl9pbmZvKGFk
ZXYtPmRldiwgInNvcyBmdyB2ZXJzaW9uID0gMHgleC5cbiIsIHBzcC0+c29zX2Z3X3ZlcnNpb24p
Ow0KPiAgCQlyZXR1cm4gMDsNCj4gQEAgLTI1MywxMyArMjYxLDExIEBAIHN0YXRpYyBpbnQgcHNw
X3YxMV8wX2Jvb3Rsb2FkZXJfbG9hZF9zeXNkcnYoc3RydWN0IHBzcF9jb250ZXh0ICpwc3ApDQo+
ICAJaW50IHJldDsNCj4gIAl1aW50MzJfdCBwc3BfZ2Z4ZHJ2X2NvbW1hbmRfcmVnID0gMDsNCj4g
IAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHBzcC0+YWRldjsNCj4gLQl1aW50MzJfdCBz
b2xfcmVnOw0KPiAgDQo+ICAJLyogQ2hlY2sgc09TIHNpZ24gb2YgbGlmZSByZWdpc3RlciB0byBj
b25maXJtIHN5cyBkcml2ZXIgYW5kIHNPUw0KPiAgCSAqIGFyZSBhbHJlYWR5IGJlZW4gbG9hZGVk
Lg0KPiAgCSAqLw0KPiAtCXNvbF9yZWcgPSBSUkVHMzJfU09DMTUoTVAwLCAwLCBtbU1QMF9TTU5f
QzJQTVNHXzgxKTsNCj4gLQlpZiAoc29sX3JlZykgew0KPiArCWlmIChwc3BfdjExXzBfaXNfc29z
X2FsaXZlKHBzcCkpIHsNCj4gIAkJcHNwLT5zb3NfZndfdmVyc2lvbiA9IFJSRUczMl9TT0MxNShN
UDAsIDAsIG1tTVAwX1NNTl9DMlBNU0dfNTgpOw0KPiAgCQlkZXZfaW5mbyhhZGV2LT5kZXYsICJz
b3MgZncgdmVyc2lvbiA9IDB4JXguXG4iLCBwc3AtPnNvc19md192ZXJzaW9uKTsNCj4gIAkJcmV0
dXJuIDA7DQo+IEBAIC0yOTcsMTMgKzMwMywxMSBAQCBzdGF0aWMgaW50IHBzcF92MTFfMF9ib290
bG9hZGVyX2xvYWRfc29zKHN0cnVjdCBwc3BfY29udGV4dCAqcHNwKQ0KPiAgCWludCByZXQ7DQo+
ICAJdW5zaWduZWQgaW50IHBzcF9nZnhkcnZfY29tbWFuZF9yZWcgPSAwOw0KPiAgCXN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2ID0gcHNwLT5hZGV2Ow0KPiAtCXVpbnQzMl90IHNvbF9yZWc7DQo+
ICANCj4gIAkvKiBDaGVjayBzT1Mgc2lnbiBvZiBsaWZlIHJlZ2lzdGVyIHRvIGNvbmZpcm0gc3lz
IGRyaXZlciBhbmQgc09TDQo+ICAJICogYXJlIGFscmVhZHkgYmVlbiBsb2FkZWQuDQo+ICAJICov
DQo+IC0Jc29sX3JlZyA9IFJSRUczMl9TT0MxNShNUDAsIDAsIG1tTVAwX1NNTl9DMlBNU0dfODEp
Ow0KPiAtCWlmIChzb2xfcmVnKQ0KPiArCWlmIChwc3BfdjExXzBfaXNfc29zX2FsaXZlKHBzcCkp
DQo+ICAJCXJldHVybiAwOw0KPiAgDQo+ICAJLyogV2FpdCBmb3IgYm9vdGxvYWRlciB0byBzaWdu
aWZ5IHRoYXQgaXMgcmVhZHkgaGF2aW5nIGJpdCAzMSBvZiBDMlBNU0dfMzUgc2V0IHRvIDEgKi8N
Cj4gDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
