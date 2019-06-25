Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBCB55295
	for <lists+amd-gfx@lfdr.de>; Tue, 25 Jun 2019 16:54:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 534A76E131;
	Tue, 25 Jun 2019 14:54:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790082.outbound.protection.outlook.com [40.107.79.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41DAA6E131
 for <amd-gfx@lists.freedesktop.org>; Tue, 25 Jun 2019 14:54:26 +0000 (UTC)
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB3479.namprd12.prod.outlook.com (20.178.196.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Tue, 25 Jun 2019 14:54:24 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::b134:9f:3a1e:2b5a]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::b134:9f:3a1e:2b5a%5]) with mapi id 15.20.2008.017; Tue, 25 Jun 2019
 14:54:24 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/amdgpu/powerplay: FEATURE_MASK is 64 bit so use
 ULL
Thread-Topic: [PATCH 1/2] drm/amdgpu/powerplay: FEATURE_MASK is 64 bit so use
 ULL
Thread-Index: AQHVK14c2Ie3/waS3kOw30/ATUBCbKasdQGA
Date: Tue, 25 Jun 2019 14:54:23 +0000
Message-ID: <9b9651aa-1007-35a6-b05d-f3099f5ea7b1@amd.com>
References: <20190625135830.26173-1-alexander.deucher@amd.com>
In-Reply-To: <20190625135830.26173-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::39) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8637e67a-acd8-46ee-188e-08d6f97d030f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3479; 
x-ms-traffictypediagnostic: BYAPR12MB3479:
x-microsoft-antispam-prvs: <BYAPR12MB34793532058166DAF77F448AECE30@BYAPR12MB3479.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:386;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(346002)(39860400002)(376002)(136003)(396003)(189003)(199004)(66946007)(2501003)(73956011)(86362001)(68736007)(478600001)(6246003)(229853002)(2616005)(6436002)(66574012)(64756008)(8676002)(66446008)(81156014)(8936002)(476003)(81166006)(66556008)(99286004)(66476007)(6116002)(3846002)(25786009)(14454004)(6486002)(53936002)(11346002)(66066001)(5660300002)(305945005)(76176011)(7736002)(386003)(6506007)(72206003)(446003)(102836004)(256004)(26005)(110136005)(186003)(31696002)(6512007)(31686004)(71190400001)(486006)(53546011)(4326008)(36756003)(2906002)(71200400001)(52116002)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3479;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: E1ehOALh9bjdDKOQIbJxbVPhVDz1ELO0b0c8A2Sn0+H50By59OAF7j+GJIx171jKtG0s3xivtt3+HwAddeFG3okeegw/1iAHc27P4dl2EGIOy2Ayu2x1de0KMySaEVdb6y5z2XqssQL8MZYQlLMPsaF2kNF4iza/ZJYjtdTyz4YumXOcpYGsmq7MBqJaUOaDrVRp49e1NT7iI1x3rlAnbzE7LdqGoWfDQkwoGrQ1rgFaZykcM0YkSVYaFVvu3IyqmcNlMwWszDEuPh2UfhmzUf09bYKWk0B3fF52mKVQw2y8+fJmJ7yzqg+nasj9w+7WJ4EzFSTld8K+xROuOeVqz1YApi2N6TM8+1tlzk1dKI2M3OGavSUpSSUmtiLVKgqEAdvzbBugYZwRbkj8XQbfjwrCrzCaHwaJnCwW1NJ61Xs=
Content-ID: <2B010CA0836F8E428710A644D9603439@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8637e67a-acd8-46ee-188e-08d6f97d030f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 14:54:23.8822 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nkazlaus@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3479
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pI/LEbjWdMa0HI5FbdxtPzO/gXF0mSG8NouGZ/ExwBQ=;
 b=dmqQONdGVfOs6bF2XNQPMAJQZXA31WT0WPARe2c8KfLD8pdmeCmVM7ZjYt1VPrjDA2i9LavJmRstnZEMuAIvqikM/0xX0C4HqZd32uzyQlDIEyuVdMxEDQsFChbplBM4+9dc7YOOjU+4lLUrNuNIycvFKChXZNztySIQAOK3+cU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
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

T24gNi8yNS8xOSA5OjU4IEFNLCBBbGV4IERldWNoZXIgd3JvdGU6DQo+IFVMTCBpcyBuZWVkZWQg
Zm9yIDMyIGJpdCBhcmNoZXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQoNClJldmlld2VkLWJ5OiBOaWNob2xhcyBLYXpsYXVz
a2FzIDxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb20+DQoNCj4gLS0tDQo+ICAgZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIHwgMiArLQ0KPiAgIGRyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYyB8IDIgKy0NCj4gICAyIGZpbGVzIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMNCj4gaW5kZXggOTliMjBmZWQzNDdhLi4yZDQz
ZTNkYzc5ZjYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25h
dmkxMF9wcHQuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBf
cHB0LmMNCj4gQEAgLTM3LDcgKzM3LDcgQEANCj4gICANCj4gICAjaW5jbHVkZSAiYXNpY19yZWcv
bXAvbXBfMTFfMF9zaF9tYXNrLmgiDQo+ICAgDQo+IC0jZGVmaW5lIEZFQVRVUkVfTUFTSyhmZWF0
dXJlKSAoMVVMIDw8IGZlYXR1cmUpDQo+ICsjZGVmaW5lIEZFQVRVUkVfTUFTSyhmZWF0dXJlKSAo
MVVMTCA8PCBmZWF0dXJlKQ0KPiAgICNkZWZpbmUgU01DX0RQTV9GRUFUVVJFICggXA0KPiAgIAlG
RUFUVVJFX01BU0soRkVBVFVSRV9EUE1fUFJFRkVUQ0hFUl9CSVQpIHwgXA0KPiAgIAlGRUFUVVJF
X01BU0soRkVBVFVSRV9EUE1fR0ZYQ0xLX0JJVCkJIHwgXA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jDQo+IGluZGV4IDJmYzRlMmE2ZmQ4Mi4uMGYxNGZlMTRl
Y2Q4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBf
cHB0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5j
DQo+IEBAIC01NzYsNyArNTc2LDcgQEAgc3RhdGljIGludCB2ZWdhMjBfcnVuX2J0Y19hZmxsKHN0
cnVjdCBzbXVfY29udGV4dCAqc211KQ0KPiAgIAlyZXR1cm4gc211X3NlbmRfc21jX21zZyhzbXUs
IFNNVV9NU0dfUnVuQWZsbEJ0Yyk7DQo+ICAgfQ0KPiAgIA0KPiAtI2RlZmluZSBGRUFUVVJFX01B
U0soZmVhdHVyZSkgKDFVTCA8PCBmZWF0dXJlKQ0KPiArI2RlZmluZSBGRUFUVVJFX01BU0soZmVh
dHVyZSkgKDFVTEwgPDwgZmVhdHVyZSkNCj4gICBzdGF0aWMgaW50DQo+ICAgdmVnYTIwX2dldF9h
bGxvd2VkX2ZlYXR1cmVfbWFzayhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwNCj4gICAJCQkJICB1
aW50MzJfdCAqZmVhdHVyZV9tYXNrLCB1aW50MzJfdCBudW0pDQo+IA0KDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
