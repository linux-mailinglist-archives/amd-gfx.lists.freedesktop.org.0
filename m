Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7E1BFF79
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Sep 2019 08:58:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE526EE53;
	Fri, 27 Sep 2019 06:58:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780053.outbound.protection.outlook.com [40.107.78.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7BF26EE4D
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Sep 2019 06:57:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kaTivtD6VghsiEtxCeuRHopN8YtixZmnaI4vNOly82a0vdpyXjBxRueiG/p1K+4aRSi9JMffPzDwm+WuOwphbL7zRVBhKGb9/+Hjxej9MQtLuNpXp/PBfOc5dztUH5ndOUtMJEmek0rYbQEqnC7AFWefO9Ju/OouMhlfW9Hvx9UQIMZc1uHF6e+ORkVM1prMpHKSkuhpwv1iR9ohMPZXeiAGtGvk4l6A+j0UDeDmenZO2tMNIWqVhaJJwCys0hXDgiCLI0G0xGUjU5G6iGVSP9V8Y+CflF2xFTb0obs6yer/FfBqfm95fpVO9bFL2VOOahWWYGquvD7is2Prb95GMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dRj50A7w/YxmM5CO7M0bbk0JVlmmtMjiBzB24nexduI=;
 b=TWuU4dWgqbnie009vn+Aw5c15LzFK0k1e+rphJOrbp34fAI00itDQjFgFR5m9vdwEKEykhuBH/GBwplUCqGjg0iAKwIK8+eDTWV4PmlgetAnkz4j/qofAIA/hwyUgE8Z7qOwjHDbVKwCG91StlpttDIE4PSzcoTIwgo42YHPRYBzh3Sl9LLxDbFHWFiJ3tTnHhXtJHJH1AAv1w5t0I6C8N5WlNaRxKYCCVjUsbI/LqyR3ODqbZJXWjcrdr653kDNneIOfIxMf65+vacVeUuM1K4hLoBiJa0oaGBNkeDliZLAg9GKg9TXri30a2sc7w/4T1flIWCa0pkDlmSDPB3YhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3406.namprd12.prod.outlook.com (20.178.242.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Fri, 27 Sep 2019 06:57:57 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911%7]) with mapi id 15.20.2284.028; Fri, 27 Sep 2019
 06:57:57 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: initlialize smu->is_apu is false by default
Thread-Topic: [PATCH] drm/amd/powerplay: initlialize smu->is_apu is false by
 default
Thread-Index: AQHVdQDkhkSWJCcgM0qXIIQnUawYFg==
Date: Fri, 27 Sep 2019 06:57:56 +0000
Message-ID: <20190927065727.22272-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR06CA0022.apcprd06.prod.outlook.com
 (2603:1096:202:2e::34) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e799d95c-6977-4c60-f2d7-08d743180684
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3406; 
x-ms-traffictypediagnostic: MN2PR12MB3406:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3406A0EBBD896682DA863649A2810@MN2PR12MB3406.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(136003)(396003)(346002)(376002)(189003)(199004)(64756008)(50226002)(81156014)(81166006)(5660300002)(6486002)(478600001)(2501003)(7736002)(305945005)(5640700003)(6512007)(6436002)(99286004)(3846002)(6116002)(71200400001)(256004)(4744005)(2906002)(14454004)(1076003)(54906003)(4326008)(52116002)(71190400001)(2351001)(316002)(36756003)(6916009)(6506007)(486006)(66066001)(66946007)(102836004)(8936002)(2616005)(26005)(186003)(476003)(66446008)(8676002)(25786009)(66556008)(66476007)(386003)(86362001)(309714004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3406;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: c0POk8LbsEs/OW4Pi3KRKVUcjEkpoBiZKjLgMdbRlnwEEXr0BOnjVTdCo42iVf2bGyjVpU8ywThnYJhUYTfqPcm2o7tRWBKPZEkCSK8z1ykslYEGcFGK8xQlEtDoTDRIh2GqQo5x4CYJusXKTFVkYBXRAc5z3OyKnQ7xbR1suo4PPYXqy3H3Gnvvkt1KNaoo/iJXciqvkIgdjRCYPB5252TGfen8hU40n2isUNLNrPmRZ56ARRH/dsnnxfVJAhFWZ6h3fFmp04qm0KXfDkXiQE0hagzMcPIsaqrXNhTys2XV4D1XZyQeDrANnf2SacIy/pGDboWBuoMm/obyiWJRl/CDg6HxhleaeLD1LoJycDTSswaw/5DNiILf20Ul+nxofY9JGJWum13XB+U4BirWiZ6Agoztrvr+GN/3CAS5Ewg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e799d95c-6977-4c60-f2d7-08d743180684
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 06:57:56.9053 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bZPDjJLbSlFfrS9s/1LL5SaqMCfG2rvSypySEUyZAwvoTYEsFWbGzXXNBtDg5Ys1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3406
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dRj50A7w/YxmM5CO7M0bbk0JVlmmtMjiBzB24nexduI=;
 b=YpJlHe40NTLf0rw1os1oafbZz/fKBJON4p1IoUI6baN9QbBHJVQ0pQvdO7V3O0btHUZcQ+nerZodbI4buT5NDxOvOkt3IaQEcV6p0b/e0CN4BuKBQG7du6IRvOOPk45Lr5wuayo773ep6pdIbpzGzJDEbqV2Q4pIHMLoTCCuBvs=
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
Cc: "Liang, Prike" <Prike.Liang@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 "Feng, Kenneth" <Kenneth.Feng@amd.com>, "Wang,
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

dGhlIG1lbWJlciBvZiBpc19hcHUgaW4gc211X2NvbnRleHQgbmVlZCB0byBpbml0bGlhbGl6ZSBi
eSBkZWZhdWx0LgoKc2V0IGRlZmF1bHQgdmFsdWUgaXMgZmFsc2UgKGRHUFUpCgpmb3IgcGF0Y2g6
Cglkcm0vYW1kL3Bvd2VycGxheTogYnlwYXNzIGRwbV9jb250ZXh0IG51bGwgcG9pbnRlciBjaGVj
ayBndWFyZAoJZm9yIHNvbWUgc211IHNlcmllcwoKU2lnbmVkLW9mZi1ieTogS2V2aW4gV2FuZyA8
a2V2aW4xLndhbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9h
bWRncHVfc211LmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwppbmRleCA3Yjk5NWIwODM0ZWIu
LjZhNjRmNzY1ZmNkNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
YW1kZ3B1X3NtdS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9z
bXUuYwpAQCAtNzEyLDYgKzcxMiw3IEBAIHN0YXRpYyBpbnQgc211X2Vhcmx5X2luaXQodm9pZCAq
aGFuZGxlKQogCiAJc211LT5hZGV2ID0gYWRldjsKIAlzbXUtPnBtX2VuYWJsZWQgPSAhIWFtZGdw
dV9kcG07CisJc211LT5pc19hcHUgPSBmYWxzZTsKIAltdXRleF9pbml0KCZzbXUtPm11dGV4KTsK
IAogCXJldHVybiBzbXVfc2V0X2Z1bmNzKGFkZXYpOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
