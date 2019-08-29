Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2522FA0EDE
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 03:25:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7856189F08;
	Thu, 29 Aug 2019 01:25:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740058.outbound.protection.outlook.com [40.107.74.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB2C89F33
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 01:25:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YAopHlDCmweziPt/9I950FE6K+wmFCjRzbGNxrZ0mC6H0nV/EqIsJHf4QjQQyHGAZd3v5VBIZocXcZ8J8gRCV0n6TeHnfznfrMYlwtv6qqKbb/ez0iLpk3zN6m2uOKmqzYoa/xF+qlvvp4P4F9saQfBO27eEe+ACBSAa0Y33RHjEtAll2qGr2cl5aQ1iQ0mgqStHMMQvA7kStjZEVOP25ja0o0MLzg7Kw+McGHELtpVk8dFZQZ/aX8KvGzQdoQ3nv4lVe1O2NYDXbB8N21z9G36vzgunOhpnzR2pudOpxJZvWL6CC4B4OWn2Az4B/LCD+CjnKzpomShE/cxqcgL47A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4a4p9izyrm/gw0IlVf25Lykthvc8vqbqbYu6lwWI5dI=;
 b=gw4gmgLnFeW+u7B/h0968WWJUshcENhhHDxJkn8WJPdsjA8vgmZBkhkwu6Z9TwtxFpuRcfrAuXjpiuTs07SHs7Qh9tYKkeYXlqWztmYgCj6PpSTpTFxK/mGguaYuYCp2MJpjESoLl1+ZMXIPSgVr/D1Rx1sPzHXRadiUShiA6M090Zx5NisT+TXfJ/c1CxF2O6m0mPHxl0FjAyPlSCGzOjhOspdeVbn9ra2CJWWEjnR8A/KueObGxlzc2d0kQYLUsZ9S7+FqxbBC9bBTbJXsoi7XbMcUBKPAy2j8SwGMAK7zT41Ys7/KNzyXzxK5Nv9Vh+1wKIOGgimfSgaFn1I63w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB2806.namprd12.prod.outlook.com (20.177.126.83) by
 BYAPR12MB3173.namprd12.prod.outlook.com (20.179.92.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.20; Thu, 29 Aug 2019 01:25:05 +0000
Received: from BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::3d45:d2bc:5fa6:6ab5]) by BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::3d45:d2bc:5fa6:6ab5%6]) with mapi id 15.20.2199.021; Thu, 29 Aug 2019
 01:25:05 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhou1, Tao" <Tao.Zhou1@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH 7/7] drm/amdgpu: switch to ras_late_init callback for nbio
 v7_4
Thread-Topic: [PATCH 7/7] drm/amdgpu: switch to ras_late_init callback for
 nbio v7_4
Thread-Index: AQHVXaEN+K+4Z6+M8Uy3myNBjG4QrKcRVWJA
Date: Thu, 29 Aug 2019 01:25:04 +0000
Message-ID: <BYAPR12MB2806FE6895D90CD1AC1076D7F1A20@BYAPR12MB2806.namprd12.prod.outlook.com>
References: <1566997395-7185-1-git-send-email-Hawking.Zhang@amd.com>
 <1566997395-7185-7-git-send-email-Hawking.Zhang@amd.com>
In-Reply-To: <1566997395-7185-7-git-send-email-Hawking.Zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d755941-216e-4855-44fc-08d72c1fb8ad
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3173; 
x-ms-traffictypediagnostic: BYAPR12MB3173:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3173357BBCAC87741AE27381F1A20@BYAPR12MB3173.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(366004)(136003)(346002)(396003)(199004)(189003)(13464003)(6506007)(14444005)(53546011)(256004)(229853002)(186003)(5660300002)(2906002)(26005)(52536014)(102836004)(86362001)(74316002)(316002)(7696005)(966005)(9686003)(55016002)(6306002)(14454004)(53936002)(6436002)(76176011)(4326008)(476003)(66066001)(25786009)(3846002)(99286004)(486006)(6246003)(6116002)(446003)(6636002)(11346002)(66446008)(64756008)(66556008)(7736002)(110136005)(305945005)(33656002)(478600001)(71200400001)(71190400001)(8676002)(81156014)(66946007)(8936002)(76116006)(2501003)(81166006)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3173;
 H:BYAPR12MB2806.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HlNjWsqIuDdgBFT8rv9BT0ShyCl1e4Lq30IS4E+hQPe8EbMglAgBf5By10UckabXYNxiV0pdHhylWoulIQBwENoubmb6nUJ9IqBLhWEVlfyEOrnuzessvxsA710kMRGp0evPvwZK6YE/11JSuCdbcrCq6bMbts1Sy3ZHIEsm0vD/+/9xs4fVnT/9mHcpN1w5y0+yuDM1l3O36z+T1yPiqhi2T7OQtmJYr9FpWZW/+6hM5ecZAxhfVe1ZOg7CSuMg4mBXoLB37SuR/6d767q8CR3fghgAeXHVAnejAwHE0Yku7O5xCgxMkT4EA8aPz0GTqCp+QYtYUnrfBbuZWXWPkjYnQCNgUECfnKRazt/PGst/Q8WlcIMT2x3JfRjPwQ2F66Hp0gxWkS5hHbro+evv4XcW22IjsA/WY8p+lG5WouQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d755941-216e-4855-44fc-08d72c1fb8ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 01:25:04.8307 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: le1//4IMsgOTD7Mc4rOUZCKdRjXu6mW7LmEtjzG+QsDJu2vc2AVxqVhlEKkU0B+81uil7YouD6lK8xjMQ5dzXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3173
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4a4p9izyrm/gw0IlVf25Lykthvc8vqbqbYu6lwWI5dI=;
 b=KThDtxImDSiXPR6+a8sGbe4XK2gNueT6uSMvwduVeduYmAvJ2WM5WzETNygDTAsROOBEWFvBXi9hdkLXe8kSzMfA93/4b4C/MvqIHIC3/gVDbWCpgd/iAqXeNJk5JrbjnRY9fsNAo1s1NIV0G2V3ReDcSUJdWylJk1WBdfdo6ls=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
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
Cc: "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQpSZWdhcmRzLA0KR3VjaHVuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBh
bWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYg
T2YgSGF3a2luZyBaaGFuZw0KU2VudDogV2VkbmVzZGF5LCBBdWd1c3QgMjgsIDIwMTkgOTowMyBQ
TQ0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBaaG91MSwgVGFvIDxUYW8uWmhv
dTFAYW1kLmNvbT47IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNv
bT4NCkNjOiBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KU3ViamVjdDog
W1BBVENIIDcvN10gZHJtL2FtZGdwdTogc3dpdGNoIHRvIHJhc19sYXRlX2luaXQgY2FsbGJhY2sg
Zm9yIG5iaW8gdjdfNA0KDQppbnZva2UgbmJpbyByYXNfbGF0ZV9pbml0IGNhbGxiYWNrIGZ1bmN0
aW9uIHRvIGRvIG5iaW8gcmFzIGluaXQNCg0KU2lnbmVkLW9mZi1ieTogSGF3a2luZyBaaGFuZyA8
SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
c29jMTUuYyB8IDEzICsrKysrKysrKysrKy0NCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvc29jMTUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMNCmluZGV4
IGU3ZjI1MzkuLmY1M2JkNTkgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9zb2MxNS5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jDQpAQCAt
MTIwNiwxMSArMTIwNiwxNSBAQCBzdGF0aWMgaW50IHNvYzE1X2NvbW1vbl9lYXJseV9pbml0KHZv
aWQgKmhhbmRsZSkgIHN0YXRpYyBpbnQgc29jMTVfY29tbW9uX2xhdGVfaW5pdCh2b2lkICpoYW5k
bGUpICB7DQogCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2
aWNlICopaGFuZGxlOw0KKwlpbnQgcjsNCiANCiAJaWYgKGFtZGdwdV9zcmlvdl92ZihhZGV2KSkN
CiAJCXhncHVfYWlfbWFpbGJveF9nZXRfaXJxKGFkZXYpOw0KIA0KLQlyZXR1cm4gMDsNCisJaWYg
KGFkZXYtPm5iaW8uZnVuY3MtPnJhc19sYXRlX2luaXQpDQorCQlyID0gYWRldi0+bmJpby5mdW5j
cy0+cmFzX2xhdGVfaW5pdChhZGV2KTsNCisNCisJcmV0dXJuIHI7DQpbR3VjaHVuXVdlJ2QgYmV0
dGVyIGluaXRpYWxpemUgdGhlIHJldHVybiB2YWx1ZSAiciIgZmlyc3QuIElmIGFkZXYtPm5iaW8u
ZnVuY3MtPnJhc19sYXRlX2luaXQgaXMgTlVMTCwgdGhlbiB3ZSB3aWxsIHJldHVybiBvbmUgdmFs
dWUgbm90IGluaXRpYWxpemVkPw0KIH0NCiANCiBzdGF0aWMgaW50IHNvYzE1X2NvbW1vbl9zd19p
bml0KHZvaWQgKmhhbmRsZSkgQEAgLTEyODcsNiArMTI5MSwxMyBAQCBzdGF0aWMgaW50IHNvYzE1
X2NvbW1vbl9od19maW5pKHZvaWQgKmhhbmRsZSkNCiAJaWYgKGFtZGdwdV9zcmlvdl92ZihhZGV2
KSkNCiAJCXhncHVfYWlfbWFpbGJveF9wdXRfaXJxKGFkZXYpOw0KIA0KKwlpZiAoYW1kZ3B1X3Jh
c19pc19zdXBwb3J0ZWQoYWRldiwgYWRldi0+bmJpby5yYXNfaWYtPmJsb2NrKSkgew0KKwkJaWYg
KGFkZXYtPm5iaW8uZnVuY3MtPmluaXRfcmFzX2NvbnRyb2xsZXJfaW50ZXJydXB0KQ0KKwkJCWFt
ZGdwdV9pcnFfcHV0KGFkZXYsICZhZGV2LT5uYmlvLnJhc19jb250cm9sbGVyX2lycSwgMCk7DQor
CQlpZiAoYWRldi0+bmJpby5mdW5jcy0+aW5pdF9yYXNfZXJyX2V2ZW50X2F0aHViX2ludGVycnVw
dCkNCisJCQlhbWRncHVfaXJxX3B1dChhZGV2LCAmYWRldi0+bmJpby5yYXNfZXJyX2V2ZW50X2F0
aHViX2lycSwgMCk7DQorCX0NCisNCiAJcmV0dXJuIDA7DQogfQ0KIA0KLS0NCjIuNy40DQoNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1h
aWxpbmcgbGlzdA0KYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
