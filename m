Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8018DB0DD2
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Sep 2019 13:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CED16ECCE;
	Thu, 12 Sep 2019 11:31:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690046.outbound.protection.outlook.com [40.107.69.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D61D6ECCE
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Sep 2019 11:31:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ltsY9JP2UeIlLEvb//c/CAThEPLh1ZZ4YyajBzXPcdWo+hK7yW3GhU3wLZonLlbhXJZI+Bi0NLqI5GGqz8g4c8PRdgRm4g0FTC/ORVvZKegJs+SKzx31sCmS06V61txwYlWRMllA2j1OU4SRP19nACLIs5ZXTKLNrbT1Yt3Kt8Dw4NFVTub2KC6ZAgC+LXxbSxJZrZfIvFjajWZ9iMeBxyFnx8DdJ+q/AmEENKd+/g/FceM9Mq9levlpL+xmW56Zh8Zz33VP46E52+EDsQG0lFwFRDegUKTqBVsoBvABvWejyKibOZpHggrt6zg+BtSIgOziKCjcRt4R+1TaZotKlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VL2MGTHd5JV5lmt++bQ5ww7ZcXU+JLi6hi9NkbOMNwA=;
 b=PdvyFnIpdyqHr5jQkYVu3jjEoHAk5lxN5lqhszdE+8aTKn58RbJN40vWrQcaqcJNlsPQxtlxt60WSKprp1D1dojoO1C19pe6Ia2QOZn9wbfj92A110dEVvel3bf2gKQtsCfB13vq+t6g9jrYb3uDWlEd3qNNcsXbpfEy83fNewlpMtSc8jceAasiFWs7GH45PdSgdZC8mm0FsN2Hw1BFfF0gKBSyBKhZQ8tWE7P4NRLkTTHVJR+16iYfg3VamV6j+c4cR+tCqfr5ZydiNhbr9Pruda3nuB49oqZA4qTgLyPDx7DTjq7yu9ECnFk/W281cNFLu/R5uVcRkWPzC64mOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3629.namprd12.prod.outlook.com (20.178.242.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Thu, 12 Sep 2019 11:31:14 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2241.018; Thu, 12 Sep 2019
 11:31:13 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: [PATCH] drm/amdgpu: replace DRM_ERROR with DRM_WARN in
 ras_reserve_bad_pages
Thread-Topic: [PATCH] drm/amdgpu: replace DRM_ERROR with DRM_WARN in
 ras_reserve_bad_pages
Thread-Index: AQHVaV2VEhPUOSKq6UabSvqO3T+WGg==
Date: Thu, 12 Sep 2019 11:31:13 +0000
Message-ID: <20190912113049.29913-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0162.apcprd02.prod.outlook.com
 (2603:1096:201:1f::22) To MN2PR12MB3054.namprd12.prod.outlook.com
 (2603:10b6:208:d1::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 618b5764-cc3d-467f-3270-08d73774b75d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3629; 
x-ms-traffictypediagnostic: MN2PR12MB3629:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB36292738EDF0940BF16E5892B0B00@MN2PR12MB3629.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(346002)(396003)(366004)(39850400004)(189003)(199004)(386003)(6436002)(6506007)(81156014)(53936002)(71190400001)(14444005)(52116002)(71200400001)(1076003)(305945005)(478600001)(25786009)(7736002)(5660300002)(110136005)(6116002)(66066001)(3846002)(8936002)(6486002)(64756008)(66476007)(6512007)(316002)(6636002)(66446008)(2501003)(14454004)(86362001)(50226002)(8676002)(4326008)(66946007)(186003)(36756003)(256004)(2906002)(476003)(486006)(26005)(2616005)(81166006)(99286004)(102836004)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3629;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oXtFNb8vO5olBp8nXnd+sxzsM2D2UD4dEwPOu+ShO+gApaR1vXH/oNZW4s9N9H2jV3AGixNJdpvQt59B6pllzHF0RXIuhVtmrwjQ72O4I3ejJUri1fkNiKr21fBraiYTSwGmEdtrdqjD++X5SDOPk8YkBkwmkpXfWhdAIKnJJJ6aTPF5FJPGHPQ4bqgsQvMkzv72hwQiKkB1YfoFOIuruC1jq+j1sf1S6B61+3qhPphV4vdrasJxLMtZigWyzLqu80aAfW3/EUlfxe38FSyKDXcwfkUKP4xKBOpyQwpWsOGxo6LomOIro8FOWi8ysWu9G+pwb+4EXo5U246xnpTprgMpMyVpQcom6y3iz84No/ZVIqCD7/GDRvPqvilf7ugjeZEbKwW3x6QohnBxHhYqpM/i3S6135L6RxxtVDSP6qg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 618b5764-cc3d-467f-3270-08d73774b75d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 11:31:13.4033 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bmv1WHsUxP4FE6opWkzhFnYGRTz4k2+18PHFV0bhpAVc6h19NTko33+a+PAQWABr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3629
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VL2MGTHd5JV5lmt++bQ5ww7ZcXU+JLi6hi9NkbOMNwA=;
 b=Ee/Bm46X9/zVyzBjI4EujWnPqq8eFPCJks3OtX2QfPFNCmoQ3Cpi6imo5Ccm9y0QAQayhXy5pHUNGJAo6722wHm33ueYZlwep1jStqPITzJd1B89XbTNLOPxmiCWo0aFzwHRDWbBdrI8FRb3/sQCLTaoSszDCST+XW6dGLdJ98s=
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

VGhlcmUgYXJlIHR3byBjYXNlcyBvZiByZXNlcnZlIGVycm9yIHNob3VsZCBiZSBpZ25vcmVkOgox
KSBhIHJhcyBiYWQgcGFnZSBoYXMgYmVlbiBhbGxvY2F0ZWQgKHVzZWQgYnkgc29tZW9uZSk7CjIp
IGEgcmFzIGJhZCBwYWdlIGhhcyBiZWVuIHJlc2VydmVkIChkdXBsaWNhdGUgZXJyb3IgaW5qZWN0
aW9uIGZvciBvbmUgcGFnZSk7CgpEUk1fRVJST1IgaXMgdW5uZWNlc3NhcnkgZm9yIHRoZSBmYWls
dXJlIG9mIGJhZCBwYWdlIHJlc2VydmUKClNpZ25lZC1vZmYtYnk6IFRhbyBaaG91IDx0YW8uemhv
dTFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMg
fCA4ICsrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCmluZGV4IGRjNWY5NGU2
MTE4Yi4uMDQyNWI3NGUxYThiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcmFzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jh
cy5jCkBAIC0xNDc4LDkgKzE0NzgsMTUgQEAgaW50IGFtZGdwdV9yYXNfcmVzZXJ2ZV9iYWRfcGFn
ZXMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJZm9yIChpID0gZGF0YS0+bGFzdF9yZXNl
cnZlZDsgaSA8IGRhdGEtPmNvdW50OyBpKyspIHsKIAkJYnAgPSBkYXRhLT5icHNbaV0ucmV0aXJl
ZF9wYWdlOwogCisJCS8qCisJCSAqIFRoZXJlIGFyZSB0d28gY2FzZXMgb2YgcmVzZXJ2ZSBlcnJv
ciBzaG91bGQgYmUgaWdub3JlZDoKKwkJICogMSkgYSByYXMgYmFkIHBhZ2UgaGFzIGJlZW4gYWxs
b2NhdGVkICh1c2VkIGJ5IHNvbWVvbmUpOworCQkgKiAyKSBhIHJhcyBiYWQgcGFnZSBoYXMgYmVl
biByZXNlcnZlZCAoZHVwbGljYXRlIGVycm9yIGluamVjdGlvbgorCQkgKiBmb3Igb25lIHBhZ2Up
OworCQkgKi8KIAkJaWYgKGFtZGdwdV9yYXNfcmVzZXJ2ZV92cmFtKGFkZXYsIGJwIDw8IFBBR0Vf
U0hJRlQsCiAJCQkJCVBBR0VfU0laRSwgJmJvKSkKLQkJCURSTV9FUlJPUigiUkFTIEVSUk9SOiBy
ZXNlcnZlIHZyYW0gJWxseCBmYWlsXG4iLCBicCk7CisJCQlEUk1fV0FSTigiUkFTIFdBUk46IHJl
c2VydmUgdnJhbSBmb3IgcmV0aXJlZCBwYWdlICVsbHggZmFpbFxuIiwgYnApOwogCiAJCWRhdGEt
PmJwc19ib1tpXSA9IGJvOwogCQlkYXRhLT5sYXN0X3Jlc2VydmVkID0gaSArIDE7Ci0tIAoyLjE3
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
