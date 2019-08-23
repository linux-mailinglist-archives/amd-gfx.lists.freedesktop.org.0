Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6EA9B838
	for <lists+amd-gfx@lfdr.de>; Fri, 23 Aug 2019 23:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B2A76ED4C;
	Fri, 23 Aug 2019 21:33:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700083.outbound.protection.outlook.com [40.107.70.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B5576ED46
 for <amd-gfx@lists.freedesktop.org>; Fri, 23 Aug 2019 21:33:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IG1I9BQwYUUQGJ5dNOZLJLKm3VC3cawN5f05wlsq7nOu3wxgQpiSDPmCu0VZjP6+bUvJUiQIGCCN1it6h08hQfJ7vilxlcnBVxIDWJznCTx3OmDtVxB87ncWGjRkKh4xGsBx656PZfE6L48AKwJhQOhxEK/Maw/gD9uz9N8UolK57Y3Bu1gplGUCuAxh71JyKuEC6M6S6fIopUx6s+w52P06SzdSmr/2Hm7CXQGM6jtePegSrQy/ShkkRItoxQ5mYsBF/LVPGykNUQk9d0/SX9HxUV2BqLcJy9oQiYVkSBESmUU6tIPsP2SlMWiXDMlOQVRkSwg7ICYwpvglrDB9Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MY9M+lt50EfuZ788w5MrWk/vi33KuLjXQTvOMFOfa0s=;
 b=eUFAGJDVlr83zkdutYrsaxwizmNZj8Vj7fOFMSE4N8xBk/4kimXFwpQb8SFXNILBkimBrFcMwWPjuRarI0/FP+1EaHGE0lNPJWpeQM3PTi8b5kLALyK7drsCrqzh7m7JzEdiAbI3bu8wOdFQJsSrzD3cFfGPAGHwigL9UJLg5rXwhqbiw2nyL9TcwSJRpjMcG1IBdJA3U+fyB/m3sYrXnaKjh3oz4ccCojG/QOK68/aLabNFy1YFaO0AZlKJn8wXquOWIPZkgAdm8/1uwG2u2UYZefx7Hx2NUhfQ2ewxRq9tw1EzPq8FLmJulFIDulnwqix1bnPrKTIXM9Xx/lwN+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3644.namprd12.prod.outlook.com (20.178.199.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Fri, 23 Aug 2019 21:33:48 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::1c82:54e7:589b:539c]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::1c82:54e7:589b:539c%5]) with mapi id 15.20.2178.020; Fri, 23 Aug 2019
 21:33:48 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/4] drm/amdgpu: Support new arcturus mtype
Thread-Topic: [PATCH 2/4] drm/amdgpu: Support new arcturus mtype
Thread-Index: AQHVWfpyeJC2wez23kWgligSiuf+AA==
Date: Fri, 23 Aug 2019 21:33:46 +0000
Message-ID: <20190823213249.10749-3-Felix.Kuehling@amd.com>
References: <20190823213249.10749-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190823213249.10749-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YT1PR01CA0030.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::43)
 To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd5b8d84-6dc2-42c0-b6d7-08d728119465
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3644; 
x-ms-traffictypediagnostic: DM6PR12MB3644:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3644EC20AA064FBB5D78676892A40@DM6PR12MB3644.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:989;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(199004)(189003)(50226002)(478600001)(86362001)(2616005)(4326008)(26005)(446003)(486006)(186003)(386003)(5640700003)(52116002)(66066001)(25786009)(81156014)(2906002)(14454004)(11346002)(102836004)(76176011)(54906003)(6916009)(66476007)(7736002)(2501003)(66946007)(66446008)(5660300002)(36756003)(6506007)(8676002)(8936002)(81166006)(6436002)(53936002)(71190400001)(6512007)(316002)(3846002)(6116002)(6486002)(476003)(66556008)(64756008)(71200400001)(305945005)(1076003)(99286004)(2351001)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3644;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 85J7pFgJQald4slA3GYl/ofuN2fx8K2WjmFsvbm52UUx3S6uEvKi240FMZC4nnbgJexXmfdAHXnh92O1vv1h62RPAorrF+9NQSz51gV13bkbnWkYjdIiFMzjFcC69vEsKcaBJqFLQogYA4VyAWI+yhNp1D/60J1pucWBeMOruQtou67YlW8bAgMK4D1BjM7jkk8C4fYjaMlm8CCqNWiEJhXCT4Q2t82jRkLzFmEiRnf2bXQxZyLrd5OqZ5MMQr2fONdjT+scN/xT5qCa9HCtGZZ8dEKrRDLxNJWK4m2oYarbWw89TOmDV0aiEWC29lJK5T1mRBsm4jEPoW2SRTgWJsUm36Ug4VA0UtOlAgrMBiRZfk+n1crKiU7kt2WNGLbM6QfL5wVlEmIoJY2rRsBbovZIQRasa/k97PZd0pOw5f0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd5b8d84-6dc2-42c0-b6d7-08d728119465
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 21:33:46.7262 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ljrb2Qyy+uSoKmNqjqzGQIwZ2uQCK28oN+rfd2W/H0ZJYLiZd6ZDGCsKiDcRrMRRYt7dJXPNQzJNHQPl0nTf5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3644
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MY9M+lt50EfuZ788w5MrWk/vi33KuLjXQTvOMFOfa0s=;
 b=K4ZBRkt0ufiGUo7RBUO6Addkl9kdsGxXyb91s1o5O1OxAzrroN2miGtIrHGmQJp4VUKB5yWvdo9wjlWYnYanehdKqrBENYGd2x1Scc5+s816KexqdMfh/xu2WC0NJGbnMAZRvqimuldROw72qQgmPQj/af8791bgwXiu5okHzfA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Cc: "Zeng, Oak" <Oak.Zeng@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+CgpBcmN0dXJ1cyByZXB1cnBvc2VkIG10
eXBlIFdDIHRvIFJXLiBNb2RpZnkgZ21jIGZ1bmN0aW9ucwp0byBzdXBwb3J0IHRoZSBuZXcgbXR5
cGUKCkNoYW5nZS1JZDogSWRjMzM4ZTUzODZhNTcwMjBmNDUyNjIwMjVlMjY2NGFiNGJhOWYyOTEK
U2lnbmVkLW9mZi1ieTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyAgICAgfCAzICsrKwogZHJpdmVycy9ncHUvZHJt
L2FtZC9pbmNsdWRlL3ZlZ2ExMF9lbnVtLmggfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5
XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKaW5kZXggNmNlMjk3
N2MzYzU5Li45YWFmY2RhNmM0ODggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dtY192OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAu
YwpAQCAtNTg3LDYgKzU4Nyw5IEBAIHN0YXRpYyB1aW50NjRfdCBnbWNfdjlfMF9nZXRfdm1fcHRl
X2ZsYWdzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCWNhc2UgQU1ER1BVX1ZNX01UWVBF
X1dDOgogCQlwdGVfZmxhZyB8PSBBTURHUFVfUFRFX01UWVBFX1ZHMTAoTVRZUEVfV0MpOwogCQli
cmVhazsKKwljYXNlIEFNREdQVV9WTV9NVFlQRV9SVzoKKwkJcHRlX2ZsYWcgfD0gQU1ER1BVX1BU
RV9NVFlQRV9WRzEwKE1UWVBFX1JXKTsKKwkJYnJlYWs7CiAJY2FzZSBBTURHUFVfVk1fTVRZUEVf
Q0M6CiAJCXB0ZV9mbGFnIHw9IEFNREdQVV9QVEVfTVRZUEVfVkcxMChNVFlQRV9DQyk7CiAJCWJy
ZWFrOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL3ZlZ2ExMF9lbnVt
LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvdmVnYTEwX2VudW0uaAppbmRleCBjMTRi
YTY1YTI0MTUuLmFkZjFiNzU0NjY2ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9p
bmNsdWRlL3ZlZ2ExMF9lbnVtLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL3Zl
Z2ExMF9lbnVtLmgKQEAgLTEwMzcsNiArMTAzNyw3IEBAIFRDQ19DQUNIRV9QT0xJQ1lfU1RSRUFN
ICAgICAgICAgICAgICAgICAgPSAweDAwMDAwMDAxLAogdHlwZWRlZiBlbnVtIE1UWVBFIHsKIE1U
WVBFX05DICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPSAweDAwMDAwMDAwLAogTVRZ
UEVfV0MgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA9IDB4MDAwMDAwMDEsCitNVFlQ
RV9SVyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID0gMHgwMDAwMDAwMSwKIE1UWVBF
X0NDICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPSAweDAwMDAwMDAyLAogTVRZUEVf
VUMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA9IDB4MDAwMDAwMDMsCiB9IE1UWVBF
OwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
