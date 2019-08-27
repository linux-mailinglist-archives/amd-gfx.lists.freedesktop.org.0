Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE029DE98
	for <lists+amd-gfx@lfdr.de>; Tue, 27 Aug 2019 09:20:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21FBB8957B;
	Tue, 27 Aug 2019 07:20:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760055.outbound.protection.outlook.com [40.107.76.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A71A0894C1
 for <amd-gfx@lists.freedesktop.org>; Tue, 27 Aug 2019 07:20:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bz0OFFe/XnFfe3NmiVD1dAK0cU49qrbECG3RbGspyStrC4ZXzmxKy45uX1G+WQE9ybRk8ezrxu1+Erqrrt5nvTeB21cvJixK6daCxOPJ+glQ4Qtp/P9Mx9jeqrHo8lGwWG+lgP/rfvdy/RgqUAA1Kauv79ZU1yndBrkH4yurBWEca9jBvgyzvNrF0yMdtylzgDB1unfgj0M8XOMDL4k1RAoFp7kR8CqP8fqPntemYNJufecrQBXrOE3ojVlMwE3HiycSuq8heHUVfKuPYSLSsgDiLP/OLGyoQYStZFlcD4+KIK383EVD4Uii71eFy4bRF5s7zrpxCt5G/Bydo8qEpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPn5jlyg5h3VsQXKN4avYxpUSOLdyKMaei+dPv1INeE=;
 b=YToa17Y3/0KM2UGcq01CPGrbbbuCzIqRFSDkpJfDjPe5Y7UEyOM0PxCXAuzUE0hq3Bs1E0FWmy+r4ExKTXCumlnn9p1EJ/VrHSzp1m7LFnQFnj4maVtX8QXEdFrhuOAvsIvxB7UADzPn5eFh44WqpOWLjmQEZGkzbEvYV7LM0JwBVy7dn1VnVNs3UaG+CDNyfUtxkJBP9ZeAKE+j1mIjhUVIQuEexTLjWqjgYlo507cI7kleNMoQIp6Q4nSNnGxScBZsqsK/lClHsGop6XpcrNDPQGH3mwrfe3y/Q4jynICE3o6qfQV9i8o7cY194ira52D8OlnDXC3AXrdOs2OoRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3601.namprd12.prod.outlook.com (20.178.211.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Tue, 27 Aug 2019 07:20:15 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::acf1:c2b4:2a91:c12]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::acf1:c2b4:2a91:c12%6]) with mapi id 15.20.2199.021; Tue, 27 Aug 2019
 07:20:15 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/amd/powerplay: enable jpeg powergating for navi1x
Thread-Topic: [PATCH 3/3] drm/amd/powerplay: enable jpeg powergating for navi1x
Thread-Index: AQHVXKffw0LS1dVWEU+u4NTBrSQOxA==
Date: Tue, 27 Aug 2019 07:20:15 +0000
Message-ID: <20190827071941.23862-3-xiaojie.yuan@amd.com>
References: <20190827071941.23862-1-xiaojie.yuan@amd.com>
In-Reply-To: <20190827071941.23862-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0105.apcprd03.prod.outlook.com
 (2603:1096:203:b0::21) To BN8PR12MB3602.namprd12.prod.outlook.com
 (2603:10b6:408:49::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc0bda70-12eb-4a20-eb5d-08d72abf0167
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3601; 
x-ms-traffictypediagnostic: BN8PR12MB3601:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB3601AAFCAD7161BCECBF494C89A00@BN8PR12MB3601.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:389;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(136003)(346002)(396003)(376002)(189003)(199004)(66446008)(102836004)(14444005)(81156014)(26005)(3846002)(2906002)(6436002)(6116002)(4326008)(25786009)(6916009)(2616005)(486006)(66066001)(76176011)(6486002)(5660300002)(52116002)(50226002)(11346002)(99286004)(5640700003)(6512007)(53936002)(14454004)(476003)(86362001)(256004)(305945005)(36756003)(2351001)(66946007)(446003)(54906003)(316002)(71200400001)(71190400001)(7736002)(8676002)(2501003)(4744005)(8936002)(6506007)(386003)(186003)(64756008)(1076003)(478600001)(66556008)(66476007)(81166006)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3601;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XFeMyaabD7fEM2kLVrXdskoDO4LH3m6fA+e+cwk+RWFTf2K8Uw+C3bRsbhtwF1e62aGNM1YCtmnoizE4rQMTcG6ixkJQmX1YJB/ufzdcJEihVJF5o7sC1B3BmizHyR1frzvXEqb7ZKghtHTiOgKhU+SgOA2xSHG2YebRmzoXUn8hLYNXoqOHLyawLhRacwRHBEAZVX8lAhlhDHE8DVkmD8kn1qoHmWon4SK4mTIcI0l/zVaf3vqxR9Nn5U/X/iNyb9aWcuJcRd11gbIV0i1v5+4sYdQXoZjbsKaZaRwSVNUKrcakFn+q8TYdszpx79orSpAIrJoQWXpMoWz4s4iNCRX9p5uzxOrgIpLnhQwkPGWoSZcDa8uEBDVUIUyYVCTypvSKOQNvWKPS64ZyIe055IBTIZCWxD76exvR3MCiL/M=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc0bda70-12eb-4a20-eb5d-08d72abf0167
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 07:20:15.2329 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i2Ey5crp4QF7XsVJfhpFs/44O21yWoHA6fyQ73Hv4ew/LhivTdKVrBEDAyQ+VR8m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3601
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPn5jlyg5h3VsQXKN4avYxpUSOLdyKMaei+dPv1INeE=;
 b=LC1YyLkmP2gvbEv4UA3Lfh6Sr5RGGJ5LGkhKPcLVg8+NRcCaq5XqiCuviFAD9+HVprkJPxwHC42IWEmNcrVR1k8AUcLoeuW9rCQA0IsY/rrVkyKfBo2TFQhUfQN2FHKrxGID7aeabPYR9ud8WWFxknsailkZOqYtCSdw3b+Khxw=
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Wang,
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Quan, Evan" <Evan.Quan@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

anBlZyBwZyBkZXBlbmRzIG9uIHZjbiBwZwoKU2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4
aWFvamllLnl1YW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9u
YXZpMTBfcHB0LmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25h
dmkxMF9wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwpp
bmRleCAyZDkwOGFmYmY1MjUuLjE5NzA4NDNmMjI1ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L25hdmkxMF9wcHQuYwpAQCAtMzY4LDcgKzM2OCw4IEBAIG5hdmkxMF9nZXRfYWxs
b3dlZF9mZWF0dXJlX21hc2soc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCiAJCSoodWludDY0X3Qg
KilmZWF0dXJlX21hc2sgfD0gRkVBVFVSRV9NQVNLKEZFQVRVUkVfQVRIVUJfUEdfQklUKTsKIAog
CWlmIChzbXUtPmFkZXYtPnBnX2ZsYWdzICYgQU1EX1BHX1NVUFBPUlRfVkNOKQotCQkqKHVpbnQ2
NF90ICopZmVhdHVyZV9tYXNrIHw9IEZFQVRVUkVfTUFTSyhGRUFUVVJFX1ZDTl9QR19CSVQpOwor
CQkqKHVpbnQ2NF90ICopZmVhdHVyZV9tYXNrIHw9IEZFQVRVUkVfTUFTSyhGRUFUVVJFX1ZDTl9Q
R19CSVQpCisJCQkJfCBGRUFUVVJFX01BU0soRkVBVFVSRV9KUEVHX1BHX0JJVCk7CiAKIAkvKiBk
aXNhYmxlIERQTSBVQ0xLIGFuZCBEUyBTT0NDTEsgb24gbmF2aTEwIEEwIHNlY3VyZSBib2FyZCAq
LwogCWlmIChpc19hc2ljX3NlY3VyZShzbXUpKSB7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
