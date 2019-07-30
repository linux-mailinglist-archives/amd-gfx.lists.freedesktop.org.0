Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7334879ED2
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jul 2019 04:43:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A493B6E2E9;
	Tue, 30 Jul 2019 02:43:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740088.outbound.protection.outlook.com [40.107.74.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0DF06E2E9
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Jul 2019 02:43:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=argtuW4Fy9UMsXR0Nd7rWRlWf6309wRtkPdezwV8wyQySQyXIrHP5tmBx/dENEz3N47jHHGc9ASS9+tK+fxipRc1uK5tw1ozKR5ccbyQiVL/bO46TASmglWPv0Xx2UJlf5GD7tuVQETdRtyKoYDkDuk413UFx4+GP1yYTLJUNNMieJtqqPgZbT1sumcoMA+FOo0eoafptW1mXHNOysQYMydNut+Qg4YyRKidx2cPzj9QZI260UDfKWLpLVfot5o4l5ftPDRIb8Do8Q44pykprXfn3mPKM2w+goFWQeWBsVLa+N+RRK89VT/ufcX6QivfbKBUVb0fyZwfzs/tn95pAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+gL/Q1/X4HiQqvMw4yrBuQ2nFXymIRtECRySaeWgLI=;
 b=iG8gkv0uwzTarI5RO4Ma3+ioDkTKuAImQXMZpX4oVo2WP046ZlSBqoq+lim1TnTZ7iT7sbtjshmaty46Jxv93dK1wZUp74movz8sbhMAUBK2xqLRh7ILInT4eXwvNijxtTA5ZBk5vOMrbwhEEabzCb7lik0aCPeZ2rGgQARLvXY/oIOSDXEz+4W3aioNz0nVCbphT2hbQCH2IZwx/+ZuUbLh+Ipn8DLgGe78Kb5LhIKysugIIcirIsI1APO61n+fDHxjDgP74Cr4UcwWx4JA2VVidaI+Y7TI529zNxoa05gpbeBh2zb+WNR4X0Zk+rqHyhf8pLzD9mDx6B2HVO+vNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB4127.namprd12.prod.outlook.com (52.135.48.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Tue, 30 Jul 2019 02:43:27 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f%6]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 02:43:27 +0000
From: Kevin Wang <kevwa@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 18/30] drm/amd/powerplay: init arcturus SMU metrics table
 on bootup
Thread-Topic: [PATCH 18/30] drm/amd/powerplay: init arcturus SMU metrics table
 on bootup
Thread-Index: AQHVRkpjwKSawrLMwUi+TV1l3fnKbKbidIKA
Date: Tue, 30 Jul 2019 02:43:26 +0000
Message-ID: <9594f6ed-de3d-71ac-aefe-e20e4d4f83f4@amd.com>
References: <20190729201508.16136-1-alexander.deucher@amd.com>
 <20190729201508.16136-19-alexander.deucher@amd.com>
In-Reply-To: <20190729201508.16136-19-alexander.deucher@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0162.apcprd02.prod.outlook.com
 (2603:1096:201:1f::22) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ac0bb47-d121-4272-64eb-08d71497b2a8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4127; 
x-ms-traffictypediagnostic: MN2PR12MB4127:
x-microsoft-antispam-prvs: <MN2PR12MB41272E8958D709A5EAD0795DA2DC0@MN2PR12MB4127.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:378;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(189003)(199004)(5660300002)(6116002)(3846002)(4326008)(6246003)(316002)(81156014)(81166006)(305945005)(110136005)(68736007)(229853002)(31696002)(478600001)(25786009)(7736002)(186003)(2906002)(36756003)(26005)(6486002)(256004)(486006)(66066001)(6436002)(2616005)(31686004)(8676002)(54906003)(71190400001)(53936002)(386003)(11346002)(66476007)(2501003)(52116002)(99286004)(76176011)(71200400001)(6512007)(446003)(6506007)(14454004)(102836004)(53546011)(8936002)(66946007)(66446008)(64756008)(66556008)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4127;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wc51hkYzl/YlZUiy0slRW55JUjNH2Ih2cLDyiV8rU+uJl58v6TRW1qZAzLHB4OzFx9T5SPU2ZvXhTw+B3rmupLjCUPl5pmf40sF6Rteq6zn2d65zxZ5NYlWKB+C/yGaGoyr1nSwlXrcveW1wA/bb2gKJkOEsPpcLsZPJ7W7Z0T4HcUcrF5HKpPMN2XSl6syFuTx9cZkTIgjzKFw60R2SZIJQjegncdwgFNIxQSIkqzCqQvbJef5H4ir+hxjwzPil7+a7XEpMmh/JhsXfPQaiNANoGr5ruJHaZMTF2X9kysehRwJ+5jk4SpX2I10eJC8j09pN02HrgwdemPTObCOY47kxqJcgjrWoTg2Stdm303oHakJqkRoYdFk7cMvZzbPMgXGW26SXcXOk48tJ2RtT9uJBuAFbkKPyx89ZONARddc=
Content-ID: <17D0A56939380E4FA4703E05A05393AD@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ac0bb47-d121-4272-64eb-08d71497b2a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 02:43:26.9670 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4127
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+gL/Q1/X4HiQqvMw4yrBuQ2nFXymIRtECRySaeWgLI=;
 b=u1Fln7LDX6q8uP21pSehLOrPaQhfQOpK5gfp0Y/o27jWoS9NiUgeDRVlXSYBC6JtNBfC3Va6yISRliV7iZziUtb37jXCwHhRAkzCi1q6xp6V/xQl5kw9Sx/rSrSbcNaWTzuwYh9MtoCaim4tR9GFPwYPSHSpXBMU2KrUYhV8NW0=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Quan,
 Evan" <Evan.Quan@amd.com>, "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQpPbiA3LzMwLzE5IDQ6MTQgQU0sIEFsZXggRGV1Y2hlciB3cm90ZToNCj4gRnJvbTogRXZhbiBR
dWFuIDxldmFuLnF1YW5AYW1kLmNvbT4NCj4NCj4gSW5pdGlhbGl6ZSBhcmN0dXJ1cyBTTVUgbWV0
cmljcyB0YWJsZS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1k
LmNvbT4NCj4gUmV2aWV3ZWQtYnk6IEtldmluIFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+DQo+
IFJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQo+
IFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4N
Cj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMg
fCA3ICsrKysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspDQo+DQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jDQo+IGluZGV4IGEw
NjQ0ZWYyNjdhOS4uNWY5MTFmMDkyMzExIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYw0KPiBAQCAtMjY3LDYgKzI2Nyw4IEBAIHN0YXRpYyBp
bnQgYXJjdHVydXNfZ2V0X3dvcmtsb2FkX3R5cGUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGVu
dW0gUFBfU01DX1BPV0VSDQo+ICAgDQo+ICAgc3RhdGljIGludCBhcmN0dXJ1c190YWJsZXNfaW5p
dChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgc3RydWN0IHNtdV90YWJsZSAqdGFibGVzKQ0KPiAg
IHsNCj4gKwlzdHJ1Y3Qgc211X3RhYmxlX2NvbnRleHQgKnNtdV90YWJsZSA9ICZzbXUtPnNtdV90
YWJsZTsNCj4gKw0KPiAgIAlTTVVfVEFCTEVfSU5JVCh0YWJsZXMsIFNNVV9UQUJMRV9QUFRBQkxF
LCBzaXplb2YoUFBUYWJsZV90KSwNCj4gICAJCSAgICAgICBQQUdFX1NJWkUsIEFNREdQVV9HRU1f
RE9NQUlOX1ZSQU0pOw0KPiAgIA0KPiBAQCAtMjc2LDYgKzI3OCwxMSBAQCBzdGF0aWMgaW50IGFy
Y3R1cnVzX3RhYmxlc19pbml0KHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBzdHJ1Y3Qgc211X3Rh
YmxlICp0YWJsZQ0KPiAgIAlTTVVfVEFCTEVfSU5JVCh0YWJsZXMsIFNNVV9UQUJMRV9TTVVfTUVU
UklDUywgc2l6ZW9mKFNtdU1ldHJpY3NfdCksDQo+ICAgCQkgICAgICAgUEFHRV9TSVpFLCBBTURH
UFVfR0VNX0RPTUFJTl9WUkFNKTsNCj4gICANCj4gKwlzbXVfdGFibGUtPm1ldHJpY3NfdGFibGUg
PSBremFsbG9jKHNpemVvZihTbXVNZXRyaWNzX3QpLCBHRlBfS0VSTkVMKTsNCj4gW2tldmluXTog
d2hlcmUgaXMgZG8gZnJlZSBvcGVyYXRpb24gaW4gZHJpdmVyIGNvZGUgPw0KPiArCWlmICghc211
X3RhYmxlLT5tZXRyaWNzX3RhYmxlKQ0KPiArCQlyZXR1cm4gLUVOT01FTTsNCj4gKwlzbXVfdGFi
bGUtPm1ldHJpY3NfdGltZSA9IDA7DQo+ICsNCj4gICAJcmV0dXJuIDA7DQo+ICAgfQ0KPiAgIA0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
