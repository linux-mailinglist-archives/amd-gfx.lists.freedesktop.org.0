Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E35669C2
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jul 2019 11:15:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1636E32F;
	Fri, 12 Jul 2019 09:15:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710064.outbound.protection.outlook.com [40.107.71.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF90A6E32F
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jul 2019 09:15:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VOiZCt7E6jD2ua8Iw1vt6xB4ZczCKr8UQ3Va/ca2uEAlSrmBh3JR6kRzqN7QkGvgUEfYbNz+OT3bdYgYxRXE9DsKU72bB+s7EEduNAZhAmV990EW5MeWTf9T7y9IoW6M018UNBWPcRJM5gqMQoSnpAugcAWI/SpTggm34je/ok77o54MWM6eFcQyzikkIbe/VrFiL/xlbtZhVvRLRQU98/Hk+gVl+QrLqZFPcRJicqKDuhGS2UUcbFohUM8rSF9Sz/yZTh1NpzZrdepc5CXRmRpg1ekswjbDFd6Ir/tFpSmdYkmNi8Wqgm/ki2rgqxZhUFeSgJT+qUkkDD9EhTy6lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZ2BaHyd/NAWgTCmoobJfA1cyRDUDvMCyYEri2F/8uo=;
 b=h04cVcmCGRe4m5u+DRup/hNYvFBWa6FAf4TKhYF/3D9pE8HWKLnxoc2XLnh0O6J0GbxuYhdhVtmUdGDFK5OXORJVAOw+C4EF0E+nNBqXeeIU4mqfE6vtVglrKLIdqxcIfeugkiCpxMS/xcWz3a/UM/B7q0vMwc+KWzwDnDVWafLnsfBP0NRg8y/faCCAY1Pjl3pYzyNXb2dZKpWanZ843Z3WqB4OSVsQcAVBfAYCQm+dnGcVhAUbUv+LidcLBjO0BoiLTD3UGmR28ZTjVA091z72ijodDweMJNji7m2B0URoYhWhzdJB8nDliixUgop8FoqPe4qvIEfa7+6wnPZ8GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3102.namprd12.prod.outlook.com (20.178.241.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Fri, 12 Jul 2019 09:15:11 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::154f:3d2f:d2ca:3a6e]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::154f:3d2f:d2ca:3a6e%3]) with mapi id 15.20.2052.020; Fri, 12 Jul 2019
 09:15:11 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/amd/powerplay: avoid double check feature enabled
Thread-Topic: [PATCH 2/3] drm/amd/powerplay: avoid double check feature enabled
Thread-Index: AQHVOJJOsumaKMuv0USoN/FR8kx7Mg==
Date: Fri, 12 Jul 2019 09:15:11 +0000
Message-ID: <20190712091454.13478-2-kevin1.wang@amd.com>
References: <20190712091454.13478-1-kevin1.wang@amd.com>
In-Reply-To: <20190712091454.13478-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0021.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::33) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.22.0
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2312f68-c12d-4463-a18c-08d706a970f2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3102; 
x-ms-traffictypediagnostic: MN2PR12MB3102:
x-microsoft-antispam-prvs: <MN2PR12MB310218A972F2F1B784C5743FA2F20@MN2PR12MB3102.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 00963989E5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(189003)(199004)(478600001)(76176011)(2351001)(2501003)(6486002)(6436002)(5640700003)(4326008)(71200400001)(71190400001)(5660300002)(81156014)(8676002)(81166006)(99286004)(6512007)(52116002)(102836004)(53936002)(256004)(6506007)(14444005)(386003)(25786009)(1076003)(2616005)(11346002)(446003)(486006)(476003)(54906003)(6916009)(26005)(66066001)(8936002)(2906002)(86362001)(186003)(3846002)(305945005)(7736002)(6116002)(36756003)(316002)(66476007)(66446008)(64756008)(66556008)(66946007)(50226002)(68736007)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3102;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NhOguyEJfSqlqOlrQad/sZIyTzr2ozheU1mSBIwwzb6ytQUIvF9TlYTI0qW2/AynMcjrL8CmqE+IvAMvfezzyOo0qvIDy9NNLHKRhJC5E4KDcDClPTocjJo9YWNwfwCKqfkM/M/4UR7vbXZ+aZpDGO0cUDKquDX5VTAFtW+jB+pEco6z3PDlozQ42DUx0olt09ZW5lDe9EK3pEsTECDXYJaefEAKguvZJctx4YvQIe4DGKkMSlRrg0j1s+39+ZTnQF2itEm+6lyIcrSs1v4v+UhC1zzln+bOyFmAKWRbEmqUDuRcxpBVFkfmUJ1ZnDgs6JxuTliuvFV7N+EF3XDbr1hSXXC0dLoHkAcdGRKONZKCAWdoTDL+ZLoQagURhysxbe6a+MziJfwTLPnk+++36EYVwkNkSVGCB4L3UE0WM44=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2312f68-c12d-4463-a18c-08d706a970f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2019 09:15:11.3591 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3102
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZ2BaHyd/NAWgTCmoobJfA1cyRDUDvMCyYEri2F/8uo=;
 b=kBDC8WOjXPyHuRVS19jmU6bIdqfICHoO+fdtYbyT1730Wf35wLDtwo1VuUb9i1fXmlRWimrwrHXhqGwc/xi1Q2IUo29Uf3M+coXWA62p+ypFhwi4e/rDsttANAtVHwARcgtToWwhbPvtaR+ri1vBRl1rLgGyR/pMBu/FLbq12mk=
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
Cc: "Xu, Feifei" <Feifei.Xu@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>, "Feng,
 Kenneth" <Kenneth.Feng@amd.com>, "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>
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
