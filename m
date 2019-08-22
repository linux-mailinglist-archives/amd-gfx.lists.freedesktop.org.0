Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D389991E
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 18:25:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55B4D6E4ED;
	Thu, 22 Aug 2019 16:25:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770053.outbound.protection.outlook.com [40.107.77.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74DD56E4ED
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 16:25:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jUymREBZdQi+ddDn9qQhrkofXier7KP5iWMayW+1o41rGstIQT3766JSBxGWtdl7GHMas2GlsZIO6InU4o+NFJ3/zE4Dsw4ETkXoQHsvucm+GVhgUjp3ek8nDswQPhvL6u+DEW/Tg/IaovWTX5f9Gr0Ojn3wxOEVRcym0Q71zqk8yDz8NdvDj2I3OTeU3BIqPAVcBXO+z772cr1BNZ0kstWN86m9kClVbLhwA3aWappO7NKJ6tS7gEr3AeI8f4/BSfnza2JiPJVrHIvB6tUo4/GyGkoXdZ3aCN5xMQgxl2NWENtzIAoYJUX8f4Kw1PJahDbRcKLZVgWyyvwgXIP3hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZb6HgavsvvZbV0sB2mMaPo9LQwvspYFtacprA0mMyw=;
 b=cWUQvnAT6qIRozzeaAWMh/L2QSQ+d48Qj/jHZK+0OrmexajQPjxmh6eY2Yne620QuP1pByhIb9G5yJ8mCeOkdKUjaZPqjpMDyy0+kUHO8P36CLhxGpZNo6gvcaM4KFNjAAM6YHtaHnGg3tadi3KV9juP0pSHZdPBYJrlxhhw6ZNI5J+m4duYOjcCOcqaliHrq4n/H7RMawDoOeEZO5yd58sjOQYvsNvwZs0/Hs+auN7C2dKkbtXdlwgwBIhcATo4k5Udc+i7pDgHfwhIlTQjH3zoXGrNRR2aB7ZUNMqlfUiguSuo9dtVunFWUrPNTL4cpSmgCMx9rcwvPSobgvy1UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB2853.namprd12.prod.outlook.com (20.179.90.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.20; Thu, 22 Aug 2019 16:25:49 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::d594:85f1:65da:dd82]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::d594:85f1:65da:dd82%5]) with mapi id 15.20.2178.018; Thu, 22 Aug 2019
 16:25:49 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/amd/display: update bw_calcs to take pipe sync
 into account (v2)
Thread-Topic: [PATCH 3/3] drm/amd/display: update bw_calcs to take pipe sync
 into account (v2)
Thread-Index: AQHVWP9y3tMU8IgIm0OVQzclyRV6pqcHWoKA
Date: Thu, 22 Aug 2019 16:25:49 +0000
Message-ID: <6c011b85-27c8-4ff5-12b5-4d034878c916@amd.com>
References: <20190822153645.3296-1-alexander.deucher@amd.com>
 <20190822153645.3296-4-alexander.deucher@amd.com>
In-Reply-To: <20190822153645.3296-4-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::42) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f337bd9-7116-4ed3-24d6-08d7271d64c7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BYAPR12MB2853; 
x-ms-traffictypediagnostic: BYAPR12MB2853:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2853431E692E36160970613DECA50@BYAPR12MB2853.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01371B902F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(189003)(199004)(86362001)(386003)(6486002)(2616005)(446003)(476003)(6512007)(53546011)(26005)(7736002)(102836004)(110136005)(11346002)(76176011)(53936002)(8936002)(52116002)(6506007)(66446008)(486006)(6246003)(6436002)(5660300002)(25786009)(66476007)(66556008)(478600001)(64756008)(66946007)(8676002)(305945005)(71190400001)(3846002)(6116002)(71200400001)(256004)(99286004)(81156014)(81166006)(4326008)(186003)(2906002)(229853002)(36756003)(66066001)(14454004)(316002)(2501003)(31686004)(31696002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2853;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ljz6ov8Y/P12xrTxHN3TEfcK6a5pCI18ykk+BNM/zCBfQTUC71pIditP9JJGrL4NJ9AO3BxLRhEnopksYhG1V/WJvk7bHJ+TLuACnlrh4aV3eL4qPPKaJOfVn4sjalqthYm9K0XLcVVINIFUOuP7rTU/OqGyG1z3Vv/t2hWZQBSNtk3s5wBMeIiSeLHsxPgo0qvNDkv96Wp8Iw+2FIwyMDDbHfWAtWLTS8rCmzL6gtNsEnTNFizfpSBBrjAaRZ6kKtTXqEMMHm/hRH6JGnaBUOZKVelY0c5KK3tlJ8HHCrIPA9Cs9rUjzQJZl6dNc72zqXNj2TxqHf7tryr9DbTSLjpxv6VoSUm7GDbIDmkUfGXFn8i6jxszXyY5Gd3pYeAJL3eF/oJRJKJlOl6iyR1fBSiZTihvc2W3yikS8i4SHZU=
Content-ID: <E8CE56969451BD499506FCFFFFA1C289@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f337bd9-7116-4ed3-24d6-08d7271d64c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2019 16:25:49.6630 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K5/PrUMICiNa7BVaf85YmsJb6MMkXL713poNa4BGb5Xs5azDju1Fmr5E3oQU+RnXTGMuXylBlvUS4uVKSmRCuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2853
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZb6HgavsvvZbV0sB2mMaPo9LQwvspYFtacprA0mMyw=;
 b=yOJnbfEy6jCleP960mubEldLdDhArBmV+Gk5tZniZsUqk2GlnvGwRXqGZgAWY0nZ9uD1Om30UbegUSb/ruySsgXLDUuyCAVa4TNvcfrT9tij2Ay1RhiSEzyR2NabdqrdFwF5ND4gs27rAcqM2tBViuridfTk9GPE4FyfFThEHXY=
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

T24gOC8yMi8xOSAxMTozNiBBTSwgQWxleCBEZXVjaGVyIHdyb3RlOg0KPiBQcm9wZXJseSBzZXQg
YWxsX2Rpc3BsYXlzX2luX3N5bmMgc28gdGhhdCB3aGVuIHRoZSBkYXRhIGlzDQo+IHByb3BhZ2F0
ZWQgdG8gcG93ZXJwbGF5LCBpdCdzIHNldCBwcm9wZXJseSBhbmQgd2UgY2FuIGVuYWJsZQ0KPiBt
Y2xrIHN3aXRjaGluZyB3aGVuIGFsbCBtb25pdG9ycyBhcmUgaW4gc3luYy4NCj4gDQo+IHYyOiBm
aXggbG9naWMsIGNsZWFuIHVwDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQo+IC0tLQ0KPiAgIC4uLi9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2NhbGNzL2RjZV9jYWxjcy5jICB8IDQ5ICsrKysrKysrKysrKysrKysrKy0NCj4gICAx
IGZpbGUgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2FsY3MvZGNlX2NhbGNz
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2FsY3MvZGNlX2NhbGNzLmMNCj4g
aW5kZXggOWYxMmUyMWY4YjliLi44ZDkwNDY0N2ZiMGYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY2VfY2FsY3MuYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2FsY3MvZGNlX2NhbGNzLmMNCj4gQEAgLTI1LDYgKzI1
LDcgQEANCj4gICANCj4gICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPg0KPiAgIA0KPiArI2luY2x1
ZGUgInJlc291cmNlLmgiDQo+ICAgI2luY2x1ZGUgImRtX3NlcnZpY2VzLmgiDQo+ICAgI2luY2x1
ZGUgImRjZV9jYWxjcy5oIg0KPiAgICNpbmNsdWRlICJkYy5oIg0KPiBAQCAtMjk3Nyw2ICsyOTc4
LDUwIEBAIHN0YXRpYyB2b2lkIHBvcHVsYXRlX2luaXRpYWxfZGF0YSgNCj4gICAJZGF0YS0+bnVt
YmVyX29mX2Rpc3BsYXlzID0gbnVtX2Rpc3BsYXlzOw0KPiAgIH0NCj4gICANCj4gK3N0YXRpYyBi
b29sIGFsbF9kaXNwbGF5c19pbl9zeW5jKGNvbnN0IHN0cnVjdCBwaXBlX2N0eCBwaXBlW10sDQo+
ICsJCQkJIGludCBwaXBlX2NvdW50LA0KPiArCQkJCSB1aW50MzJfdCBudW1iZXJfb2ZfZGlzcGxh
eXMpDQo+ICt7DQo+ICsJY29uc3Qgc3RydWN0IHBpcGVfY3R4ICp1bnN5bmNlZF9waXBlc1tNQVhf
UElQRVNdID0geyBOVUxMIH07DQo+ICsJaW50IGdyb3VwX3NpemUgPSAxOw0KPiArCWludCBpLCBq
Ow0KPiArDQo+ICsJZm9yIChpID0gMDsgaSA8IHBpcGVfY291bnQ7IGkrKykgew0KPiArCQlpZiAo
IXBpcGVbaV0uc3RyZWFtKQ0KDQpUaGlzIGJpdCBkaWZmZXJzIGZyb20gcHJvZ3JhbV90aW1pbmdf
c3luYywgYnV0IHNpbmNlIHRoaXMgaXMgZm9yIGRjZSBhbmQgDQp3ZSBkb24ndCBkbyBwaXBlIHNw
bGl0IG9yIE1QTyBJIHRoaW5rIGl0J3MgcHJvYmFibHkgZmluZSB0aGF0IHlvdSdyZSBub3QgDQpj
aGVja2luZyB0b3BfcGlwZSBoZXJlLg0KDQpXb3VsZG4ndCBodXJ0IHRvIGhhdmUgdGhhdCBsb2dp
YyBoZXJlIHRob3VnaC4NCg0KPiArCQkJY29udGludWU7DQo+ICsNCj4gKwkJdW5zeW5jZWRfcGlw
ZXNbaV0gPSAmcGlwZVtpXTsNCj4gKwl9DQo+ICsNCj4gKwlmb3IgKGkgPSAwOyBpIDwgcGlwZV9j
b3VudDsgaSsrKSB7DQo+ICsJCWNvbnN0IHN0cnVjdCBwaXBlX2N0eCAqcGlwZV9zZXRbTUFYX1BJ
UEVTXTsNCj4gKw0KPiArCQlpZiAoIXVuc3luY2VkX3BpcGVzW2ldKQ0KPiArCQkJY29udGludWU7
DQo+ICsNCj4gKwkJcGlwZV9zZXRbMF0gPSB1bnN5bmNlZF9waXBlc1tpXTsNCj4gKwkJdW5zeW5j
ZWRfcGlwZXNbaV0gPSBOVUxMOw0KPiArDQo+ICsJCS8qIEFkZCB0ZyB0byB0aGUgc2V0LCBzZWFy
Y2ggcmVzdCBvZiB0aGUgdGcncyBmb3Igb25lcyB3aXRoDQo+ICsJCSAqIHNhbWUgdGltaW5nLCBh
ZGQgYWxsIHRncyB3aXRoIHNhbWUgdGltaW5nIHRvIHRoZSBncm91cA0KPiArCQkgKi8NCj4gKwkJ
Zm9yIChqID0gaSArIDE7IGogPCBwaXBlX2NvdW50OyBqKyspIHsNCj4gKwkJCWlmICghdW5zeW5j
ZWRfcGlwZXNbal0pDQo+ICsJCQkJY29udGludWU7DQo+ICsNCj4gKwkJCWlmIChyZXNvdXJjZV9h
cmVfc3RyZWFtc190aW1pbmdfc3luY2hyb25pemFibGUoDQo+ICsJCQkJCXVuc3luY2VkX3BpcGVz
W2pdLT5zdHJlYW0sDQo+ICsJCQkJCXBpcGVfc2V0WzBdLT5zdHJlYW0pKSB7DQo+ICsJCQkJcGlw
ZV9zZXRbZ3JvdXBfc2l6ZV0gPSB1bnN5bmNlZF9waXBlc1tqXTsNCj4gKwkJCQl1bnN5bmNlZF9w
aXBlc1tqXSA9IE5VTEw7DQo+ICsJCQkJZ3JvdXBfc2l6ZSsrOw0KPiArCQkJfQ0KPiArCQl9DQo+
ICsJfQ0KPiArDQo+ICsJcmV0dXJuIChncm91cF9zaXplID09IG51bWJlcl9vZl9kaXNwbGF5cykg
PyB0cnVlIDogZmFsc2U7DQoNCkkgdGhpbmsgdGhpcyBsb2dpYyBpcyBmdW5jdGlvbmFsIGJ1dCBp
dCBsb29rcyBpbmNvcnJlY3QgYXQgZmlyc3QgZ2xhbmNlIA0KYmVjYXVzZSBncm91cF9zaXplIGRv
ZXNuJ3QgZ2V0IHJlc2V0LiBXaGF0IGVuZHMgdXAgaGFwcGVuaW5nIGlzIHRoZSANCmZpcnN0IHBp
cGUgb2YgZWFjaCBncm91cCBkb2Vzbid0IGdldCBhZGRlZCB0byBncm91cF9zaXplLg0KDQpJIGZl
ZWwgdGhhdCB0aGlzIHdvdWxkIGJlIG1vcmUgY2xlYXIgYXM6DQoNCnN0YXRpYyBib29sIGFsbF9k
aXNwbGF5c19pbl9zeW5jKGNvbnN0IHN0cnVjdCBwaXBlX2N0eCBwaXBlW10sIGludCANCnBpcGVf
Y291bnQpDQp7DQoJY29uc3Qgc3RydWN0IHBpcGVfY3R4ICphY3RpdmVfcGlwZXNbTUFYX1BJUEVT
XTsNCglpbnQgaSwgbnVtX2FjdGl2ZV9waXBlcyA9IDA7DQoNCglmb3IgKGkgPSAwOyBpIDwgcGlw
ZV9jb3VudDsgaSsrKSB7DQoJCWlmICghcGlwZVtpXS5zdHJlYW0gfHwgcGlwZVtpXS50b3BfcGlw
ZSkNCgkJCWNvbnRpbnVlOw0KDQoJCWFjdGl2ZV9waXBlc1tudW1fYWN0aXZlX3BpcGVzKytdID0g
JnBpcGVbaV07DQoJfQ0KDQoJaWYgKCFudW1fYWN0aXZlX3BpcGVzKQ0KCQlyZXR1cm4gZmFsc2U7
DQoNCglmb3IgKGkgPSAxOyBpIDwgbnVtX2FjdGl2ZV9waXBlczsgKytpKQ0KCQlpZiAoIXJlc291
cmNlX2FyZV9zdHJlYW1zX3RpbWluZ19zeW5jaHJvbml6YWJsZSgNCgkJCSAgICBhY3RpdmVfcGlw
ZXNbMF0tPnN0cmVhbSwgYWN0aXZlX3BpcGVzW2ldLT5zdHJlYW0pKQ0KCQkJcmV0dXJuIGZhbHNl
Ow0KDQoJcmV0dXJuIHRydWU7DQp9DQoNCkJ1dCBJIGhhdmVuJ3QgdGVzdGVkIHRoaXMuDQoNCk5p
Y2hvbGFzIEthemxhdXNrYXMNCg0KDQo+ICt9DQo+ICsNCj4gICAvKioNCj4gICAgKiBSZXR1cm46
DQo+ICAgICoJdHJ1ZSAtCURpc3BsYXkocykgY29uZmlndXJhdGlvbiBzdXBwb3J0ZWQuDQo+IEBA
IC0yOTk4LDggKzMwNDMsOCBAQCBib29sIGJ3X2NhbGNzKHN0cnVjdCBkY19jb250ZXh0ICpjdHgs
DQo+ICAgDQo+ICAgCXBvcHVsYXRlX2luaXRpYWxfZGF0YShwaXBlLCBwaXBlX2NvdW50LCBkYXRh
KTsNCj4gICANCj4gLQkvKlRPRE86IHRoaXMgc2hvdWxkIGJlIHRha2VuIG91dCBjYWxjcyBvdXRw
dXQgYW5kIGFzc2lnbmVkIGR1cmluZyB0aW1pbmcgc3luYyBmb3IgcHBsaWIgdXNlKi8NCj4gLQlj
YWxjc19vdXRwdXQtPmFsbF9kaXNwbGF5c19pbl9zeW5jID0gZmFsc2U7DQo+ICsJY2FsY3Nfb3V0
cHV0LT5hbGxfZGlzcGxheXNfaW5fc3luYyA9IGFsbF9kaXNwbGF5c19pbl9zeW5jKHBpcGUsIHBp
cGVfY291bnQsDQo+ICsJCQkJCQkJCSAgZGF0YS0+bnVtYmVyX29mX2Rpc3BsYXlzKTsNCj4gICAN
Cj4gICAJaWYgKGRhdGEtPm51bWJlcl9vZl9kaXNwbGF5cyAhPSAwKSB7DQo+ICAgCQl1aW50OF90
IHljbGtfbHZsLCBzY2xrX2x2bDsNCj4gDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
