Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5F366752
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jul 2019 09:00:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8451F6E2CD;
	Fri, 12 Jul 2019 07:00:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700070.outbound.protection.outlook.com [40.107.70.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD4256E2CD
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jul 2019 07:00:25 +0000 (UTC)
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3392.namprd12.prod.outlook.com (20.178.242.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Fri, 12 Jul 2019 07:00:22 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::154f:3d2f:d2ca:3a6e]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::154f:3d2f:d2ca:3a6e%3]) with mapi id 15.20.2052.020; Fri, 12 Jul 2019
 07:00:22 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/amd/powerplay: avoid double check feature enabled
Thread-Topic: [PATCH 3/3] drm/amd/powerplay: avoid double check feature enabled
Thread-Index: AQHVOH9594pgDccm+0C6JiW/yZaPTg==
Date: Fri, 12 Jul 2019 07:00:22 +0000
Message-ID: <20190712065959.25753-3-kevin1.wang@amd.com>
References: <20190712065959.25753-1-kevin1.wang@amd.com>
In-Reply-To: <20190712065959.25753-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR01CA0042.apcprd01.prod.exchangelabs.com
 (2603:1096:203:3e::30) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.22.0
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b30808a9-0ee6-448d-ed7f-08d706969bb0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3392; 
x-ms-traffictypediagnostic: MN2PR12MB3392:
x-microsoft-antispam-prvs: <MN2PR12MB33921F3BB6E99E8C9F236730A2F20@MN2PR12MB3392.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 00963989E5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(396003)(39860400002)(346002)(376002)(199004)(189003)(256004)(6506007)(86362001)(316002)(99286004)(14444005)(54906003)(66476007)(66556008)(76176011)(1076003)(2351001)(386003)(2501003)(53936002)(64756008)(66946007)(102836004)(6916009)(66446008)(52116002)(6512007)(71200400001)(478600001)(71190400001)(5640700003)(186003)(81166006)(4326008)(81156014)(8676002)(25786009)(11346002)(6436002)(305945005)(486006)(7736002)(2616005)(476003)(50226002)(6486002)(14454004)(36756003)(66066001)(3846002)(6116002)(68736007)(26005)(8936002)(5660300002)(446003)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3392;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jiqeD6x2AaCIITDdw5F0GlCF3JdnBzGZyCziEXvFHE0hFQOr/WnPVtnoGwJthwIXa8FJTiQhGqjwm/xbsytoHWEeSXbt+MQbWASKvn/sXW/4qI/Gs4VBdEfzwwp+twHT5dYThvIk3Mhy5fYpGepFeKbOWnrTWZH6zzkyy3SIcHQuczdqhuBKkcxv4PAuHdrOGNtKqH7A14hvivbvYZZOGnGmiiaeeDSw1LHhwZ7lInwAjGVOBUdjNLGtbF/ka58yHADE+VmDfMZZB2rw0Qu2wkvvIHGjqZdFRSwM1GPY/ul7eVqdi+XZ3Otam8COesmyyrgzEmeWgfZMAayTlDQ1wB55+IzlNkBnpmcLLkWPsEGq5LnUl2YyAe4XQA5RD7HpO2Qno4Lzv99zw8GX7qoRUX4geOmUQEFv7+xJwq20TjY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b30808a9-0ee6-448d-ed7f-08d706969bb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2019 07:00:22.4988 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3392
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZ2BaHyd/NAWgTCmoobJfA1cyRDUDvMCyYEri2F/8uo=;
 b=GBr7JHjiWaHAJWtByyR2gluYWmaYZGIrQfi0vGpiW8RRmKROhvlk0/Jlzywdx42y8x1NhWaICCX8wtx3et9AS6zjYO3SfnOfZHbsEo1S8TiRZweVIYVYgdXMGrtaNCJQlH6BVOVROvU5mMT6zTYbNmoB6O64KAr0FrEguRTAxXU=
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
Cc: "Quan, Evan" <Evan.Quan@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

dGhlIHVuZm9yY2VfZHBtX2xldmVscyBkb2Vzbid0IG5lZWQgdG8gY2hlY2sgZmVhdHVyZSBlbmFi
bGUsCmJlY2F1c2UgdGhlIHNtdV9nZXRfZHBtX2ZyZXFfcmFuZ2UgZnVuY3Rpb24gaGFzIGNoZWNr
IGZlYXR1cmUgbG9naWMuCgpDaGFuZ2UtSWQ6IEk2YWU2MmIzNTVhYTc2YTAwZjBmNmUxNjRjZDk4
NDhmYjMyZmM3YzEyClNpZ25lZC1vZmYtYnk6IEtldmluIFdhbmcgPGtldmluMS53YW5nQGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIHwgMjMg
KysrKysrKystLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwg
MTUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvbmF2aTEwX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3Bw
dC5jCmluZGV4IDE2YTRjMWNhOThjZi4uODk1YTRlNTkyZDVhIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCkBAIC04MzMsMjcgKzgzMywyMCBAQCBzdGF0aWMg
aW50IG5hdmkxMF9mb3JjZV9kcG1fbGltaXRfdmFsdWUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUs
IGJvb2wgaGlnaGVzdCkKIAlyZXR1cm4gcmV0OwogfQogCi1zdGF0aWMgaW50IG5hdmkxMF91bmZv
cmNlX2RwbV9sZXZlbHMoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpIHsKLQorc3RhdGljIGludCBu
YXZpMTBfdW5mb3JjZV9kcG1fbGV2ZWxzKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQorewogCWlu
dCByZXQgPSAwLCBpID0gMDsKIAl1aW50MzJfdCBtaW5fZnJlcSwgbWF4X2ZyZXE7CiAJZW51bSBz
bXVfY2xrX3R5cGUgY2xrX3R5cGU7CiAKLQlzdHJ1Y3QgY2xrX2ZlYXR1cmVfbWFwIHsKLQkJZW51
bSBzbXVfY2xrX3R5cGUgY2xrX3R5cGU7Ci0JCXVpbnQzMl90CWZlYXR1cmU7Ci0JfSBjbGtfZmVh
dHVyZV9tYXBbXSA9IHsKLQkJe1NNVV9HRlhDTEssIFNNVV9GRUFUVVJFX0RQTV9HRlhDTEtfQklU
fSwKLQkJe1NNVV9NQ0xLLCAgIFNNVV9GRUFUVVJFX0RQTV9VQ0xLX0JJVH0sCi0JCXtTTVVfU09D
Q0xLLCBTTVVfRkVBVFVSRV9EUE1fU09DQ0xLX0JJVH0sCisJZW51bSBzbXVfY2xrX3R5cGUgY2xr
c1tdID0geworCQlTTVVfR0ZYQ0xLLAorCQlTTVVfTUNMSywKKwkJU01VX1NPQ0NMSywKIAl9Owog
Ci0JZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoY2xrX2ZlYXR1cmVfbWFwKTsgaSsrKSB7Ci0J
CWlmICghc211X2ZlYXR1cmVfaXNfZW5hYmxlZChzbXUsIGNsa19mZWF0dXJlX21hcFtpXS5mZWF0
dXJlKSkKLQkJICAgIGNvbnRpbnVlOwotCi0JCWNsa190eXBlID0gY2xrX2ZlYXR1cmVfbWFwW2ld
LmNsa190eXBlOwotCisJZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoY2xrcyk7IGkrKykgewor
CQljbGtfdHlwZSA9IGNsa3NbaV07CiAJCXJldCA9IHNtdV9nZXRfZHBtX2ZyZXFfcmFuZ2Uoc211
LCBjbGtfdHlwZSwgJm1pbl9mcmVxLCAmbWF4X2ZyZXEpOwogCQlpZiAocmV0KQogCQkJcmV0dXJu
IHJldDsKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
