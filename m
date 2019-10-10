Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8281D1E0E
	for <lists+amd-gfx@lfdr.de>; Thu, 10 Oct 2019 03:36:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54CD46E31E;
	Thu, 10 Oct 2019 01:36:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810057.outbound.protection.outlook.com [40.107.81.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E726E31E
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 01:36:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SHbQYBYNZJpFVosoXJegA4DK6hGogoveoRA59gFsf8ecS2ORlv3FcZc/VVkk9WHj5eUrD89SnEDrAOEkArDDVqmuQiepGVN3tUppQ6Pd29gbSBpSKQMc+rvH0POAI0dq7KYOrRbJIDesuMjwlmkuKNqnLGcv+OYDdhVJeE3KWG7WgSb+hcDYWkLpR+DPoVmFcYUuz064aRp3YdjotP4YsGHgN8MeI2orIOPf/Cbl1lh+izflkjjuIqfG5NLcuwmUHklJzlZ1IfuZ+h0mqmOh/1ePlOttqqn8cnHkmiuQc3RYsB6srFNnzK+HuLBcMZ3XDs63mwH+PqqBNnadYTX5Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQqjzY+XcFUjmH2s8PyVgNxyXVUCoHq16pr8c4K6FKs=;
 b=Q3pCLVgn5aiZsJMXipuqK7Y+IFYpRs6hzfJziFlt/S/kdHW/KoUvyKpzuM1tPJ9sIYs0ujyHC+l38EdB4M7+XYR5647346wiP19141NZFa2Wua0hX5d6DJvl/mL8oK2SijIsMHCViMQ31/zBa3+CgiRYPfDRnZ8uAxSJA7li222VMY4QlnBi6ySba4gH7JpGsgoy5cA/nAxacr9SF+/JASlAXSgJ7/Aroh58vsXDc6Drl+p3+YP7j89tMojPXJK/k1jfnOlEIdXMnHXx2dvG4Y8tvJ0x2yoTxce+DdcSyxO2HTHjszUd6GlfpvTwl9vGW8jBcMRQG9hJjXg0mv1tzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3919.namprd12.prod.outlook.com (10.255.238.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Thu, 10 Oct 2019 01:36:48 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::435:bdca:bac1:a26d]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::435:bdca:bac1:a26d%5]) with mapi id 15.20.2327.025; Thu, 10 Oct 2019
 01:36:48 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu/swSMU/navi: add feature toggles for more things
Thread-Topic: [PATCH] drm/amdgpu/swSMU/navi: add feature toggles for more
 things
Thread-Index: AQHVfqPn42qfjnIvuUC5hn8N26LT9qdTGPRQ
Date: Thu, 10 Oct 2019 01:36:48 +0000
Message-ID: <MN2PR12MB33447EEEDD5A12F6C6D42155E4940@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20191009131714.24259-1-alexander.deucher@amd.com>
In-Reply-To: <20191009131714.24259-1-alexander.deucher@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 346da311-7a2e-43a6-d907-08d74d22515a
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB3919:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3919FA82F1E834212C401930E4940@MN2PR12MB3919.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 018632C080
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(366004)(376002)(346002)(136003)(13464003)(189003)(199004)(186003)(8936002)(66066001)(81156014)(256004)(81166006)(86362001)(229853002)(6436002)(6116002)(486006)(446003)(8676002)(11346002)(476003)(5660300002)(3846002)(2906002)(7696005)(305945005)(7736002)(2501003)(52536014)(66476007)(74316002)(76176011)(66556008)(53546011)(102836004)(26005)(6306002)(33656002)(64756008)(6506007)(76116006)(66446008)(4326008)(966005)(6246003)(316002)(110136005)(71200400001)(71190400001)(99286004)(25786009)(9686003)(478600001)(14454004)(66946007)(55016002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3919;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TRnQPtiMhKmhfV8lV/l8qezX6fDl1Gq9zCN7Dp1rB9URKmsEcZRBnZNjkTiAaHzlZH/QiGZeipeQnK58zntlPyqutEpnPWBxRu85u87OBPre4L3Uz7Lbyv12WqBo9T/O/Ah+Hvb2fl4hGS5k4XXj0UQWCm2ZTmF3Df0pztKK5YAmKw3u+tskXY+uZ0J8y0NcvJ+1RK3ThHFif2r1MaZU0PYk0ZB48zhyqRQTWmt4rRT1W5pIbTvpu20341SQXUND2/arHbnHXY8kgnVFpY19UtTxXBWk8y0KSTzQndYwfGqjxKzn6GBGLtOc+gA9dDAorTnDFf+naX1eUC7UexppJj/yJiZcST+8HDW1MsXnsnaw4HVadLvJlNaaE/DDtBwfAuQsbG3sEiVQznf+zxFs/haGDjxWJ54B9gZy8a4e0yrmVct6RfIhVfkMbYv0GqsuyqCJ5SBVL6MJK6NGKc/L6A==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 346da311-7a2e-43a6-d907-08d74d22515a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2019 01:36:48.3480 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gby8Wkp0iHBVZ1jjEOBtoIP2PM31apV3tpu98qQ/1EB7QuAP0AkiquKtMHIqfvFQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3919
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQqjzY+XcFUjmH2s8PyVgNxyXVUCoHq16pr8c4K6FKs=;
 b=1yMRbg3Sm42uWv2vcEHZOtwZ62CP1Z+jYInZQDSDcKx+sxWzLsJacT7I9XrhD5tqx0gnD1gP9Ce1BNiCzS8neU34D3pgMN2hbQU/AMaBHkZCxJhMDg4V6TzSQTPHHHFOUqZVIzNy4AZAGm4SX+9PJZ9c5ftdTvf9dKEvj60sC3s=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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

UmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQoNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgQWxleCBEZXVjaGVyDQpTZW50OiBXZWRuZXNkYXks
IE9jdG9iZXIgOSwgMjAxOSA5OjE3IFBNDQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCkNjOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+DQpT
dWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHUvc3dTTVUvbmF2aTogYWRkIGZlYXR1cmUgdG9nZ2xl
cyBmb3IgbW9yZSB0aGluZ3MNCg0KQWRkIHRvZ2dsZXMgZm9yIG1vcmUgcG93ZXIgZmVhdHVyZXMu
ICBIZWxwZnVsIGluIGRlYnVnZ2luZy4NCg0KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvbmF2aTEwX3BwdC5jIHwgMjQgKysrKysrKysrKysrKysrKy0tLS0tLQ0KIDEgZmlsZSBj
aGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jDQppbmRleCBhNTgzY2Y4N2I1MTQuLjhlMWYz
YmU4YmE2ZiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkx
MF9wcHQuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5j
DQpAQCAtMzI4LDExICszMjgsNyBAQCBuYXZpMTBfZ2V0X2FsbG93ZWRfZmVhdHVyZV9tYXNrKHN0
cnVjdCBzbXVfY29udGV4dCAqc211LA0KIAltZW1zZXQoZmVhdHVyZV9tYXNrLCAwLCBzaXplb2Yo
dWludDMyX3QpICogbnVtKTsNCiANCiAJKih1aW50NjRfdCAqKWZlYXR1cmVfbWFzayB8PSBGRUFU
VVJFX01BU0soRkVBVFVSRV9EUE1fUFJFRkVUQ0hFUl9CSVQpDQotCQkJCXwgRkVBVFVSRV9NQVNL
KEZFQVRVUkVfRFBNX0dGWENMS19CSVQpDQotCQkJCXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVfRFBN
X1NPQ0NMS19CSVQpDQogCQkJCXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVfRFBNX01QMENMS19CSVQp
DQotCQkJCXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVfRFBNX0xJTktfQklUKQ0KLQkJCQl8IEZFQVRV
UkVfTUFTSyhGRUFUVVJFX0dGWF9VTFZfQklUKQ0KIAkJCQl8IEZFQVRVUkVfTUFTSyhGRUFUVVJF
X1JTTVVfU01OX0NHX0JJVCkNCiAJCQkJfCBGRUFUVVJFX01BU0soRkVBVFVSRV9EU19TT0NDTEtf
QklUKQ0KIAkJCQl8IEZFQVRVUkVfTUFTSyhGRUFUVVJFX1BQVF9CSVQpDQpAQCAtMzQyLDggKzMz
OCw2IEBAIG5hdmkxMF9nZXRfYWxsb3dlZF9mZWF0dXJlX21hc2soc3RydWN0IHNtdV9jb250ZXh0
ICpzbXUsDQogCQkJCXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVfRkFOX0NPTlRST0xfQklUKQ0KIAkJ
CQl8IEZFQVRVUkVfTUFTSyhGRUFUVVJFX1RIRVJNQUxfQklUKQ0KIAkJCQl8IEZFQVRVUkVfTUFT
SyhGRUFUVVJFX0xFRF9ESVNQTEFZX0JJVCkNCi0JCQkJfCBGRUFUVVJFX01BU0soRkVBVFVSRV9E
UE1fRENFRkNMS19CSVQpDQotCQkJCXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVfRFNfR0ZYQ0xLX0JJ
VCkNCiAJCQkJfCBGRUFUVVJFX01BU0soRkVBVFVSRV9EU19EQ0VGQ0xLX0JJVCkNCiAJCQkJfCBG
RUFUVVJFX01BU0soRkVBVFVSRV9GV19EU1RBVEVfQklUKQ0KIAkJCQl8IEZFQVRVUkVfTUFTSyhG
RUFUVVJFX0JBQ09fQklUKQ0KQEAgLTM1MiwxMSArMzQ2LDI5IEBAIG5hdmkxMF9nZXRfYWxsb3dl
ZF9mZWF0dXJlX21hc2soc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsDQogCQkJCXwgRkVBVFVSRV9N
QVNLKEZFQVRVUkVfQVBDQ19ERkxMX0JJVCkNCiAJCQkJfCBGRUFUVVJFX01BU0soRkVBVFVSRV9G
V19DVEZfQklUKTsNCiANCisJaWYgKGFkZXYtPnBtLnBwX2ZlYXR1cmUgJiBQUF9TT0NDTEtfRFBN
X01BU0spDQorCQkqKHVpbnQ2NF90ICopZmVhdHVyZV9tYXNrIHw9IEZFQVRVUkVfTUFTSyhGRUFU
VVJFX0RQTV9TT0NDTEtfQklUKTsNCisNCisJaWYgKGFkZXYtPnBtLnBwX2ZlYXR1cmUgJiBQUF9T
Q0xLX0RQTV9NQVNLKQ0KKwkJKih1aW50NjRfdCAqKWZlYXR1cmVfbWFzayB8PSBGRUFUVVJFX01B
U0soRkVBVFVSRV9EUE1fR0ZYQ0xLX0JJVCk7DQorDQorCWlmIChhZGV2LT5wbS5wcF9mZWF0dXJl
ICYgUFBfUENJRV9EUE1fTUFTSykNCisJCSoodWludDY0X3QgKilmZWF0dXJlX21hc2sgfD0gRkVB
VFVSRV9NQVNLKEZFQVRVUkVfRFBNX0xJTktfQklUKTsNCisNCisJaWYgKGFkZXYtPnBtLnBwX2Zl
YXR1cmUgJiBQUF9EQ0VGQ0xLX0RQTV9NQVNLKQ0KKwkJKih1aW50NjRfdCAqKWZlYXR1cmVfbWFz
ayB8PSBGRUFUVVJFX01BU0soRkVBVFVSRV9EUE1fRENFRkNMS19CSVQpOw0KKw0KIAlpZiAoYWRl
di0+cG0ucHBfZmVhdHVyZSAmIFBQX01DTEtfRFBNX01BU0spDQogCQkqKHVpbnQ2NF90ICopZmVh
dHVyZV9tYXNrIHw9IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0RQTV9VQ0xLX0JJVCkNCiAJCQkJfCBG
RUFUVVJFX01BU0soRkVBVFVSRV9NRU1fVkREQ0lfU0NBTElOR19CSVQpDQogCQkJCXwgRkVBVFVS
RV9NQVNLKEZFQVRVUkVfTUVNX01WRERfU0NBTElOR19CSVQpOw0KIA0KKwlpZiAoYWRldi0+cG0u
cHBfZmVhdHVyZSAmIFBQX1VMVl9NQVNLKQ0KKwkJKih1aW50NjRfdCAqKWZlYXR1cmVfbWFzayB8
PSBGRUFUVVJFX01BU0soRkVBVFVSRV9HRlhfVUxWX0JJVCk7DQorDQorCWlmIChhZGV2LT5wbS5w
cF9mZWF0dXJlICYgUFBfU0NMS19ERUVQX1NMRUVQX01BU0spDQorCQkqKHVpbnQ2NF90ICopZmVh
dHVyZV9tYXNrIHw9IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0RTX0dGWENMS19CSVQpOw0KKw0KIAlp
ZiAoYWRldi0+cG0ucHBfZmVhdHVyZSAmIFBQX0dGWE9GRl9NQVNLKSB7DQogCQkqKHVpbnQ2NF90
ICopZmVhdHVyZV9tYXNrIHw9IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0dGWE9GRl9CSVQpOw0KIAkJ
LyogVE9ETzogcmVtb3ZlIGl0IG9uY2UgZncgZml4IHRoZSBidWcgKi8NCi0tIA0KMi4yMC4xDQoN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4
IG1haWxpbmcgbGlzdA0KYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
