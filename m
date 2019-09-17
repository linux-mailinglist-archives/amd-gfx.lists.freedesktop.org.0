Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA40B4C7E
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Sep 2019 13:04:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE98894C9;
	Tue, 17 Sep 2019 11:04:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710063.outbound.protection.outlook.com [40.107.71.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3793894C9
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 11:04:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DTY1GbrPOmdQsA7ullZI7WcijMCmG5v/6bCtaWcv4+yPwhUjgwagzwqENmt6dD1aaHjlQiLLipfoEcoHue6s6U9ZIvPxiy/eCbDLdBmjJZPyCjALEkbmP84tyLQILhW+lhzRX+plzrOGSQ/4TXZJY050CXFfVjkZNnlt0qJY76sMGXzP+AzkF6b3hZ4PehiRWbCqys21w6rfY6RJpBH7yLKwRaj4DeTiBu6elOK/95G8zx/0E9B2fBoxA0pzVyt05RoN0S8DGtkygcxzVqdX6F4I3RM6vAo4bS2B19JkdPIcD/wJQHCBvnEQCNkRx7AiuaiG0UM5fCaZcSW2PaYHIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jiUl1owXw+27JH1Cxu2kBubHzqzKS5+FAfxnZ60tozA=;
 b=hIt73U4gbsgek41QmmTvD+enrRqU0/mRji+0SMTSVtZZaqQLW1iEvUvKkIBXQaR8brxiYNf9sj+J/dhYOps7TUy1XnAe0S6z6YDgQq29J4mO72VZBmnpTvOkUzdfTDRWVLHgwtP8ui4PCrD9fn4nc8Lrmq2y7wddnFDevBxHz19y7GPaVyMKbI0FedUA3zOThDtduJYnu1IaQjtsM0f3tMLNxF+U3k3LJ8WfGVvbh1C5Qak5jmCzbOWw57NjNDxn2qTmEGYMAH5jBsq/scd0M0DI6JtnhXnfrvTcFVOH+g7ofCOUyowA5YHhZGCNfx71aFl5gY3dzqYBJwYm7jKRhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3172.namprd12.prod.outlook.com (20.179.66.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.24; Tue, 17 Sep 2019 11:04:46 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::55d8:90a7:d1dc:e9e3]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::55d8:90a7:d1dc:e9e3%7]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 11:04:46 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/powerplay: add new mapping for APCC_DFLL feature
Thread-Topic: [PATCH] drm/amdgpu/powerplay: add new mapping for APCC_DFLL
 feature
Thread-Index: AQHVbUe3IQsLZrI63E66gvUQs3E8WQ==
Date: Tue, 17 Sep 2019 11:04:46 +0000
Message-ID: <20190917110431.12559-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2P15301CA0011.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::21) To BN8PR12MB3602.namprd12.prod.outlook.com
 (2603:10b6:408:49::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3b7fe27b-70e3-42e4-500f-08d73b5ed972
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN8PR12MB3172; 
x-ms-traffictypediagnostic: BN8PR12MB3172:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB31728E9A1ACE40AD67BF7688898F0@BN8PR12MB3172.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(396003)(366004)(346002)(189003)(199004)(66476007)(71190400001)(2501003)(7736002)(486006)(81156014)(5660300002)(71200400001)(66066001)(36756003)(50226002)(8676002)(316002)(8936002)(81166006)(2906002)(52116002)(54906003)(6486002)(6436002)(6512007)(6916009)(99286004)(3846002)(305945005)(2351001)(2616005)(66946007)(476003)(66556008)(14454004)(66446008)(64756008)(1076003)(6116002)(25786009)(5640700003)(4326008)(6506007)(386003)(256004)(102836004)(186003)(26005)(478600001)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3172;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4PBrae0ObSrA6I3PzRyCCgaGm47oRd57EsP1D9zZorKONjCvFkXrk9HvHLlBeesuazEAkFwIeU9EGVw6LfAPgN4xB2dmDmQ6GlqFS4ZN663jO7Sqy5lFdxtuGJmjBPAXrAz6ZcCm9Cmh4XWKmkk4zBPJPvngcSyO9xfCrVELbkhLA8LfF8BT3BfRibDlCORS6GzFHNwVKyTUySQTZSUUMuTaUusnn4Y1+g6Mjjx1V1Yn5V/7zyGhbkdSx/trddDH46lAjhYZ5f61/IHaNzsHs+IEt6pU8FBt6tYbSs8Wppf/0cUxp5IgFeUB+R/JLXiCny083vGTi/8G6J94ouEQ0pYrUhSHahXBAUqqDL4qnb4c5d5lAswKl7ndCoqptCfceNg6cF7GkAbwg/nuMKHtM6B7UW8uO4qzTRIA2Xg9Apk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b7fe27b-70e3-42e4-500f-08d73b5ed972
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 11:04:46.1873 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zS8tyGBKBmdSRmOn5rvwKQdzf9XdAmDbi+nzIwHuzDM/z2wkTgEoJJPk3XLj3mlW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3172
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jiUl1owXw+27JH1Cxu2kBubHzqzKS5+FAfxnZ60tozA=;
 b=2/91Pc92WfRrS5v4qlTJHTsa6ViRL+Dyi2P/sFBXweFnfisCQfc2qZVG89ztH9W+7R1H8AcTXOqZvC4vIvAjcXz9bnv+LB4AN5bn5gTPyCmo8/3uMfvoL0X5Rdx+PyMp3/y8YRfXXQfYuKvvwU4KmI7Dy4FX8jTu8XUTh6D1xi8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xiaojie.Yuan@amd.com; 
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
Cc: "Quan, Evan" <Evan.Quan@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>, "Yuan,
 Xiaojie" <Xiaojie.Yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211X3R5cGVzLmggfCAxICsKIGRyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyAgICB8IDEgKwogMiBmaWxlcyBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9pbmMvc211X3R5cGVzLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9pbmMvc211X3R5cGVzLmgKaW5kZXggYWI4YzkyYTYwZmM0Li4xMmExZGU1NWNlM2MgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9zbXVfdHlwZXMuaAorKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211X3R5cGVzLmgKQEAgLTI1Miw2
ICsyNTIsNyBAQCBlbnVtIHNtdV9jbGtfdHlwZSB7CiAgICAgICAgX19TTVVfRFVNTVlfTUFQKFRF
TVBfREVQRU5ERU5UX1ZNSU4pLCAgICAgICAgICAgCVwKICAgICAgICBfX1NNVV9EVU1NWV9NQVAo
TU1IVUJfUEcpLCAgICAgICAgICAgICAgICAgICAgICAJXAogICAgICAgIF9fU01VX0RVTU1ZX01B
UChBVEhVQl9QRyksICAgICAgICAgICAgICAgICAgICAgIAlcCisgICAgICAgX19TTVVfRFVNTVlf
TUFQKEFQQ0NfREZMTCksICAgICAgICAgICAgICAgICAgICAgCVwKICAgICAgICBfX1NNVV9EVU1N
WV9NQVAoV0FGTF9DRyksCiAKICN1bmRlZiBfX1NNVV9EVU1NWV9NQVAKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwppbmRleCAxNjYzNGU2NTc1ODkuLjVhMzRkMDFm
N2Y3YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3Bw
dC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwpAQCAt
MTc2LDYgKzE3Niw3IEBAIHN0YXRpYyBzdHJ1Y3Qgc211XzExXzBfY21uMmFpc2NfbWFwcGluZyBu
YXZpMTBfZmVhdHVyZV9tYXNrX21hcFtTTVVfRkVBVFVSRV9DT1VOCiAJRkVBX01BUChURU1QX0RF
UEVOREVOVF9WTUlOKSwKIAlGRUFfTUFQKE1NSFVCX1BHKSwKIAlGRUFfTUFQKEFUSFVCX1BHKSwK
KwlGRUFfTUFQKEFQQ0NfREZMTCksCiB9OwogCiBzdGF0aWMgc3RydWN0IHNtdV8xMV8wX2NtbjJh
aXNjX21hcHBpbmcgbmF2aTEwX3RhYmxlX21hcFtTTVVfVEFCTEVfQ09VTlRdID0gewotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
