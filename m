Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1515E9D9C2
	for <lists+amd-gfx@lfdr.de>; Tue, 27 Aug 2019 01:07:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83AE8897E9;
	Mon, 26 Aug 2019 23:07:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820072.outbound.protection.outlook.com [40.107.82.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59577897E0
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Aug 2019 23:07:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ixpO/XJ6n/7dihseULJ0E7uzLgarEkksN1jQHNk+pl7MQHbgL/oxldOqvstz3jhvLFjhiIvsxkvSzlrv3mI6zdcsuSuTRvwN9Az+vrI+oGL97gpFbZ/ODlXtNO6EugL0HZkGhiO95FflwclD5mf8TbBW/qqRap+vIgz3r6ye25LaKqbT/YZEBRD39x8idANMawmaL7vi00s72a2nt39KjR+i0S+5iePtKGc8cCOgNOEyAZx940a1TYHeKqrvRXe79MDec1hCzHXVPYdNkCJmRMH4ISw/TBmtYv6x4Cd5BmmbCwIIOLFo92LzzZI7DKbdGt50lXlhZHRHvreA/04/KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDB70G3bWSDI6RIF0nSUa3xyWKmbhHdXPDxQJ6OrY0c=;
 b=LD+Y/ErSIrgACxL4IrBrHbsaJy8Wc+PwXFMB3ynsHh673uX4hJzMJx9HLpv4cIA/59FRfLS3WtZPMAs8WzKOtuHQc/wJDxFk7DxZnzAoEsNuJVJfpXlXseb2vez23izzNVpnUDnCilDXSk0ps3GjCuAgDUx6WVNUAz47Ma/FHlbTXWyX1PRA64z9ofYjpBdNn3YtykLSqCyld7S81QpIg8sgwdkGDb7sQV80PPulksVeoL1Nmny5JP0vgEv5DAJasztcMbdhbubvP+ZSE9ec5N8rtwTFt/znmUl43kXYXAtZ6aoSYIH7FQSLDJ0zRoIbUV5PNZnZ+OsrCx70bewXcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3419.namprd12.prod.outlook.com (20.178.198.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 23:07:12 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 23:07:12 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/4] drm/amdgpu: Support new arcturus mtype
Thread-Topic: [PATCH 2/4] drm/amdgpu: Support new arcturus mtype
Thread-Index: AQHVXGL+jBch7OoWtE2Mxpvfz7KToA==
Date: Mon, 26 Aug 2019 23:07:12 +0000
Message-ID: <20190826230355.25007-2-Felix.Kuehling@amd.com>
References: <20190826230355.25007-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190826230355.25007-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTXPR0101CA0053.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::30) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d1559b79-16e4-49be-cc06-08d72a7a2091
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3419; 
x-ms-traffictypediagnostic: DM6PR12MB3419:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3419D3C253F0B33E31222E5E92A10@DM6PR12MB3419.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:989;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(39860400002)(376002)(396003)(136003)(189003)(199004)(7736002)(305945005)(8676002)(6512007)(8936002)(81166006)(99286004)(76176011)(6506007)(386003)(1076003)(50226002)(316002)(102836004)(66476007)(6486002)(81156014)(6436002)(478600001)(2906002)(5660300002)(14454004)(5640700003)(4326008)(36756003)(71200400001)(256004)(71190400001)(54906003)(25786009)(3846002)(6116002)(66446008)(64756008)(53936002)(2501003)(66066001)(66946007)(486006)(86362001)(66556008)(11346002)(186003)(2351001)(446003)(6916009)(26005)(52116002)(476003)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3419;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: h9qFsizByc4LTj+3l8fG4vZKnxGxDJTz+Wdw2lPVtmBUlwcc+BllezbJ2XJWyFKL3FeVQdP6yPNonF9LqGAiESUIEEUAVyT+c7mGMulW4baHYQvfVakfq7sC2zAda5z7rIuvFjfvrRAbJDyV3tmKk8GSnOhkDm2K+0t8rGeuM+yP5hUoQsEGKUJLB05gpCesTJ55PQTjwi3jilsegqx+4ErtlRomILDK0P6Znks6vCKHcuYkqywp8Q9YyV1M212xDEYc3UrX93WsdYHBa8leUjslA34EfmCv+1oRqotS2YylqNUYvcT15SooPoShSX7TyGAFSCY/P7zepRqjRJbLxs6HskLHdQOeAE668DtVL4Faw+Qn9FasmgU9XxKZvbvP6j2WlbwlL45A+Ttxa+l3V/q+/HYBk2pf8eFMUXq3Arc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1559b79-16e4-49be-cc06-08d72a7a2091
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 23:07:12.5702 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Iol8Z9aOIChW7+K+2Qm/kusTmHi6U40/8snGOdLQzqEQE6kHSpvX57KDyGu/5gagq75QJ1Dt3JbE+Md/5W9Tcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3419
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDB70G3bWSDI6RIF0nSUa3xyWKmbhHdXPDxQJ6OrY0c=;
 b=Ovgc9Ag9g8314AgpJecmbFwaO2NA1GozqbUo2tSp7hDxwCxS/KGbCcOCnxJCrKBS+f/YDceHpitcG8U1I1UvfHEZLFROw4uE09zpvLjgnd6eLe3S0bkepDPkRIPXfxQsmmMJlGxr0tcIsseSh5QKQQxDBm7iQTz/E3A63/7c5PM=
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
XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKaW5kZXggZjc3MTM4
YmE0MWY2Li43YWEzNjVjZDhkMWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dtY192OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAu
YwpAQCAtNjAzLDYgKzYwMyw5IEBAIHN0YXRpYyB1aW50NjRfdCBnbWNfdjlfMF9nZXRfdm1fcHRl
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
