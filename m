Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE3B567CB
	for <lists+amd-gfx@lfdr.de>; Wed, 26 Jun 2019 13:38:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AFA66E395;
	Wed, 26 Jun 2019 11:38:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690056.outbound.protection.outlook.com [40.107.69.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C84D56E391
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 Jun 2019 11:38:34 +0000 (UTC)
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB2927.namprd12.prod.outlook.com (20.179.82.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Wed, 26 Jun 2019 11:38:33 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::2c36:7d1c:2e3f:55fd]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::2c36:7d1c:2e3f:55fd%3]) with mapi id 15.20.2008.017; Wed, 26 Jun 2019
 11:38:33 +0000
From: Kevin Wang <kevwa@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/amdgpu/powerplay: FEATURE_MASK is 64 bit so use
 ULL
Thread-Topic: [PATCH 1/2] drm/amdgpu/powerplay: FEATURE_MASK is 64 bit so use
 ULL
Thread-Index: AQHVLA0k9rU1dujd3UyDBVYIZlStQaatzzsA
Date: Wed, 26 Jun 2019 11:38:33 +0000
Message-ID: <aeb4d956-4f0b-f243-ce54-75bb0350220e@amd.com>
References: <20190625135830.26173-1-alexander.deucher@amd.com>
In-Reply-To: <20190625135830.26173-1-alexander.deucher@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR01CA0045.apcprd01.prod.exchangelabs.com
 (2603:1096:203:3e::33) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d755e72-dce9-47b8-6af8-08d6fa2ad195
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2927; 
x-ms-traffictypediagnostic: MN2PR12MB2927:
x-microsoft-antispam-prvs: <MN2PR12MB29279289BEF33DD477A4C854A2E20@MN2PR12MB2927.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-forefront-prvs: 00808B16F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(376002)(396003)(346002)(366004)(189003)(199004)(53546011)(256004)(66446008)(64756008)(66476007)(36756003)(478600001)(66574012)(68736007)(73956011)(11346002)(66946007)(476003)(2616005)(316002)(71200400001)(6486002)(229853002)(446003)(2501003)(66556008)(486006)(5660300002)(71190400001)(110136005)(14454004)(305945005)(3846002)(99286004)(72206003)(26005)(6506007)(66066001)(25786009)(6116002)(4326008)(31696002)(76176011)(6436002)(2906002)(7736002)(8936002)(81156014)(8676002)(102836004)(6246003)(186003)(31686004)(386003)(52116002)(81166006)(6512007)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2927;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LhpK5YcEAarvtjFW4+h484kCKoCTYu2e6QwTmsWyZGuXilbyzwlVFp7DHlNVHFbvdN6HzLZ31YoIFPkkmsISUMVq3uFAG8f+npDOdJiky0/AWPmG0sR3tZ9xd9MO8U9yNvQqL/vmth634tocc2YqaFAn9qQSdYy1FQh2lgkiXrbBS9bYUp8/78wHFYp3T4LwD3WvhdW0WtXDq5Kr/2pJIOOKkqeuG3ZWBn9EQBMruKMbDAxWsTPmq/i7a7DRv3MbAyjbsUSQBxSWUH4+YU8JuAbjAqxO8ui8KLXH8jWXpwzg1JH7+wFtbQgyy3OTQTSzUX2qIVDm3k7WaCixIAkCYxLe1uyKG1Dchb/5K4w2/7/JAeAVNgPl2TdjrCRcg0MF+Fu6C/xX25FhmvMD1ghhrEtXJo73Cf6SjoTXaP59CbE=
Content-ID: <9BD0F6B1A42F1444A6909733C2FC2153@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d755e72-dce9-47b8-6af8-08d6fa2ad195
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2019 11:38:33.4522 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2927
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rzp+zp/72ib3KNq0hrZnYanKqEjK62/eufqiwus2r2o=;
 b=mrfiql35d7ydmQjNBMQHE2Wk4ffGKbx01tJyp5u+lnzv2jrditlnBbuYWZPl19pziw75IG0TUhwF9Wq1seoiYaUSW5vt6atEWYNlKi7iIE3nqXby4Ibf802+GgVjlGurzSRQPYbmbgs8oZREAdf6VsKvsv0frqmGeMDrZKAIiII=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEtldmluIFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+DQoNCkJlc3QgUmVn
YXJkcywNCktldmluDQoNCk9uIDYvMjUvMTkgOTo1OCBQTSwgQWxleCBEZXVjaGVyIHdyb3RlOg0K
PiBVTEwgaXMgbmVlZGVkIGZvciAzMiBiaXQgYXJjaGVzLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyB8IDIgKy0NCj4gICBkcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMgfCAyICstDQo+ICAgMiBmaWxlcyBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMNCj4gaW5kZXggOTliMjBmZWQzNDdhLi4y
ZDQzZTNkYzc5ZjYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L25hdmkxMF9wcHQuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZp
MTBfcHB0LmMNCj4gQEAgLTM3LDcgKzM3LDcgQEANCj4gICANCj4gICAjaW5jbHVkZSAiYXNpY19y
ZWcvbXAvbXBfMTFfMF9zaF9tYXNrLmgiDQo+ICAgDQo+IC0jZGVmaW5lIEZFQVRVUkVfTUFTSyhm
ZWF0dXJlKSAoMVVMIDw8IGZlYXR1cmUpDQo+ICsjZGVmaW5lIEZFQVRVUkVfTUFTSyhmZWF0dXJl
KSAoMVVMTCA8PCBmZWF0dXJlKQ0KPiAgICNkZWZpbmUgU01DX0RQTV9GRUFUVVJFICggXA0KPiAg
IAlGRUFUVVJFX01BU0soRkVBVFVSRV9EUE1fUFJFRkVUQ0hFUl9CSVQpIHwgXA0KPiAgIAlGRUFU
VVJFX01BU0soRkVBVFVSRV9EUE1fR0ZYQ0xLX0JJVCkJIHwgXA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jDQo+IGluZGV4IDJmYzRlMmE2ZmQ4Mi4uMGYxNGZl
MTRlY2Q4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdh
MjBfcHB0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3Bw
dC5jDQo+IEBAIC01NzYsNyArNTc2LDcgQEAgc3RhdGljIGludCB2ZWdhMjBfcnVuX2J0Y19hZmxs
KHN0cnVjdCBzbXVfY29udGV4dCAqc211KQ0KPiAgIAlyZXR1cm4gc211X3NlbmRfc21jX21zZyhz
bXUsIFNNVV9NU0dfUnVuQWZsbEJ0Yyk7DQo+ICAgfQ0KPiAgIA0KPiAtI2RlZmluZSBGRUFUVVJF
X01BU0soZmVhdHVyZSkgKDFVTCA8PCBmZWF0dXJlKQ0KPiArI2RlZmluZSBGRUFUVVJFX01BU0so
ZmVhdHVyZSkgKDFVTEwgPDwgZmVhdHVyZSkNCj4gICBzdGF0aWMgaW50DQo+ICAgdmVnYTIwX2dl
dF9hbGxvd2VkX2ZlYXR1cmVfbWFzayhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwNCj4gICAJCQkJ
ICB1aW50MzJfdCAqZmVhdHVyZV9tYXNrLCB1aW50MzJfdCBudW0pDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
