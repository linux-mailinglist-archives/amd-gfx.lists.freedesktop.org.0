Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3584AE3C2
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 08:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64BA689F6F;
	Tue, 10 Sep 2019 06:31:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820070.outbound.protection.outlook.com [40.107.82.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B501F89F6F
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 06:31:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ab9AhDn6fW4FBF18xx8zHGWU3o2p8S2rsczEBjGMAd+0EBvxRUwicqA7zGybU9LN+2pNGeIKflJ5fgh8cIBUag2/A298S7VSr046FyOuszheIEX5BgFL93h3fxn4KZ4mcY8lGxeAeQCJaKCgguWp5Nkj7NyiaY44QuRqbjhO4zqGo7G86mYdIOMeNNcy7Ea+QYF1PL9MTPDAY0CWfbD336PuISo3Ig6jk5WH52Dmt+VV6qJ3QQKK/R1RsH0o7+TWgq3+eTiE1vgsJP0+5thvqrAVVR2FbDYEtF/I9njTWxpQB31/2OlBKNlpzUhcksdNvZaP7YERWrRyS7lfoDeyLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vC4AmfxzLKBde4ljnHZmrNjvHP1fsgrcYc5vbLqpFvM=;
 b=gf+/whPlxaEE/y4qg70Mes5vP6ELFqzT624oZsaY1h2WYDvcVic6ZZ/PMPzCiKbbC36yxf5qvCMNUeoJJYJdObd1udqgQEX8l5QYNW/xoO6TeGeU448tM6EIDP6xHmdhlzZRwH31uf0Td9ZE/O2Xr5rgwRaMk4jKtnJZlr/3ZqY+LtmL8oy7zWFETEwthxGjIcZpO+7qi1nM2zcXgbuqUyGbkOUUJJFP8AaM4Tqtuag0PZ2/UEZmdTVOehH+JwOP+lmPB3HGaeZEWkJq2SeJMrEELFR/2BcMeinpJbbmPs9NkhvWv6RXwUoFS0BfQihdi1nK9Ox7hVzfl9B1SfuLAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3389.namprd12.prod.outlook.com (20.178.242.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.14; Tue, 10 Sep 2019 06:31:22 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2241.018; Tue, 10 Sep 2019
 06:31:22 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>
Subject: [PATCH 2/3] drm/amdgpu: move umc ras init to umc block
Thread-Topic: [PATCH 2/3] drm/amdgpu: move umc ras init to umc block
Thread-Index: AQHVZ6FddfIb1KHA+kKkfw3qAz+W7Q==
Date: Tue, 10 Sep 2019 06:31:22 +0000
Message-ID: <20190910063103.14099-2-tao.zhou1@amd.com>
References: <20190910063103.14099-1-tao.zhou1@amd.com>
In-Reply-To: <20190910063103.14099-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0061.apcprd03.prod.outlook.com
 (2603:1096:203:52::25) To MN2PR12MB3054.namprd12.prod.outlook.com
 (2603:10b6:208:d1::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 147966eb-bf0b-49d1-0133-08d735b87f4b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3389; 
x-ms-traffictypediagnostic: MN2PR12MB3389:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB33897B5ADA41D81E8C999BA2B0B60@MN2PR12MB3389.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(366004)(39860400002)(376002)(199004)(189003)(52116002)(316002)(76176011)(256004)(4326008)(6636002)(25786009)(6512007)(102836004)(36756003)(186003)(2906002)(6486002)(71190400001)(71200400001)(6116002)(5660300002)(66066001)(6436002)(3846002)(53936002)(66556008)(66476007)(66946007)(66446008)(64756008)(486006)(50226002)(478600001)(2501003)(86362001)(1076003)(446003)(11346002)(476003)(2616005)(81166006)(8936002)(8676002)(26005)(81156014)(110136005)(7736002)(6506007)(386003)(14454004)(305945005)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3389;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Yj10ADNPEhCRebnwSakCg26Oh7Azpa6GNn8ptpAu6akbr3QpHafseQEFDFG9ohbUdhzHOAix8n9wM5AyAbkBJjwyTK7AlmCU8+vC/1Cyt/v83onbrvpsj1PHHMrVf/bMVV3QXbuHLhi/NXS8DJRc4dtJSVMcVtoUk1oSSExMP+mpe0/hrhVsA/dRBTZBJNDV6b0w7WoKKfVHa1wEiqfnKkCG7TfymEdV7ukp5ctOf4Z2ibjY/t19SGPA9ChwrEcgC2vQWnf6avRIecbIWRaFwo467ZZDgj+ZzMqozHi+EDD+NOcbaCmpy+avhUAjDYtSuM4lbwIFRenw5GfhrXZDS7K4F90qmS/Gwlr90uK3UjYMCIXbwzAmONZ9iAjUOQEOew4iQoKjT9+3kPguqRTRB+3DUBI96vXZUHiUpecikgY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 147966eb-bf0b-49d1-0133-08d735b87f4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 06:31:22.7527 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ctcbJObiECPjaFO4NpMPAL2cVmjqTh4NEnFcMKQol1phBwso1tSr0PNbsHYZjdoo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3389
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vC4AmfxzLKBde4ljnHZmrNjvHP1fsgrcYc5vbLqpFvM=;
 b=X+QFriFhq87oDaHsT0fpgKXZeGwCXJA7LJ20rV8mDA5QyJ5Sulk3b9IOoCkMCrTSmL0eAfUTV8f93YqYCXId0ccOATVMJBlxAZN7wWQvxWjkD/17fyq4d+TkGHHMBGyKCJ0UuguJjeCKTmKh4/z6+QGUrgAM5Yg5WChV1C4NuvM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tao.Zhou1@amd.com; 
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
Cc: "Zhou1, Tao" <Tao.Zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

bW92ZSB1bWMgcmFzIGluaXQgZnJvbSByYXMgbW9kdWxlIHRvIHVtYyBibG9jaywgZ2VuZXJpYyBy
YXMgbW9kdWxlCnNob3VsZCBwYXkgbGVzcyBhdHRlbnRpb24gdG8gc3BlY2lmaWMgcmFzIGJsb2Nr
LgoKU2lnbmVkLW9mZi1ieTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyB8IDQgLS0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5jIHwgNCArKysrCiAyIGZpbGVzIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcmFzLmMKaW5kZXggMTE5YmVkYzk4MDJhLi5hOWFiYTA2Yzk0NTIgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKQEAgLTE2NTMsMTAgKzE2NTMsNiBAQCBpbnQg
YW1kZ3B1X3Jhc19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCWlmIChhbWRncHVf
cmFzX2ZzX2luaXQoYWRldikpCiAJCWdvdG8gZnNfb3V0OwogCi0JLyogcmFzIGluaXQgZm9yIGVh
Y2ggcmFzIGJsb2NrICovCi0JaWYgKGFkZXYtPnVtYy5mdW5jcy0+cmFzX2luaXQpCi0JCWFkZXYt
PnVtYy5mdW5jcy0+cmFzX2luaXQoYWRldik7Ci0KIAlEUk1fSU5GTygiUkFTIElORk86IHJhcyBp
bml0aWFsaXplZCBzdWNjZXNzZnVsbHksICIKIAkJCSJoYXJkd2FyZSBhYmlsaXR5WyV4XSByYXNf
bWFza1sleF1cbiIsCiAJCQljb24tPmh3X3N1cHBvcnRlZCwgY29uLT5zdXBwb3J0ZWQpOwpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5jCmluZGV4IGM4ZGUxMjcwOTdhYi4uNTY4
M2M1MTcxMGFhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dW1jLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5jCkBAIC02
Miw2ICs2MiwxMCBAQCBpbnQgYW1kZ3B1X3VtY19yYXNfbGF0ZV9pbml0KHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2LCB2b2lkICpyYXNfaWhfaW5mbykKIAkJZ290byBmcmVlOwogCX0KIAorCS8q
IHJhcyBpbml0IG9mIHNwZWNpZmljIHVtYyB2ZXJzaW9uICovCisJaWYgKGFkZXYtPnVtYy5mdW5j
cyAmJiBhZGV2LT51bWMuZnVuY3MtPnJhc19pbml0KQorCQlhZGV2LT51bWMuZnVuY3MtPnJhc19p
bml0KGFkZXYpOworCiAJcmV0dXJuIDA7CiAKIGxhdGVfZmluaToKLS0gCjIuMTcuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
