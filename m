Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 626EA956B2
	for <lists+amd-gfx@lfdr.de>; Tue, 20 Aug 2019 07:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF676E5D1;
	Tue, 20 Aug 2019 05:35:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740072.outbound.protection.outlook.com [40.107.74.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99856E5D1
 for <amd-gfx@lists.freedesktop.org>; Tue, 20 Aug 2019 05:35:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O2UgoLFe5jL9O+ohKAekq9LxI+lxtuTv0LpjOlCxCfa+ZnpTnQL0zu75CoKXjDAWnbqbfyODqr/PGXUleh4P4/jx1yzdifr0Y2v0WE2604XOxQfSKwfPPPBtn7VFGiEyA0h38b+DoEtMqxohYkvk3JrVsxxilDyeRVUHDjb7pVOHmyMVzKhHrahf6lOiyk7vh9bqbHI/iFe7xB9C9/R5cDLixbX0X8sv8jVxzl2VzGjIToM+HE8qI4hrmDIOJiLZi3wzRkMlakAmL6b5foKnVdqJ9OikX6ri+zb2yPWviGK/TI09thNhfTSOUfG5lXjLe1XAVIT5HOG+cjhiR1jLxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mP3lVzxtAZDE77uPKJr/wH9TK6FLjMQTeXEBbClBGRA=;
 b=PJ99mOGEeQALLuQ6TyGxJOTScO1eVugONSKewmzn0O+Q+I2KgvEf7OsljAaR2ydRIpd2Df8KSi+7SLTiN6bsNElf7mHszcbJUQ+aP4NDVFhtM8Ftvm6C22d6A3Ps51A7JOtXtCAIoF+sakbo5ksiIbEa2p0MDC9YoDhZJy/TaYGCdIo1UKY4CLL9VCdmB+dTsPt9Jpt2HzEsp23HCJt2Zeuy1AgCCE5hbSaSM7u/li916tu0b8QsfDmPSIDXKFGV0x8N9g4WPb1WVXKbWfQf4QT83UQus/4dc8IjyBirazHlcCUr9PLDuSzMkfGLr5nOvdJw0O5pRIPNfsou38HzyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3088.namprd12.prod.outlook.com (20.178.241.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Tue, 20 Aug 2019 05:35:32 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716%6]) with mapi id 15.20.2178.016; Tue, 20 Aug 2019
 05:35:32 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: remove duplicate macro
 smu_get_uclk_dpm_states in amdgpu_smu.h
Thread-Topic: [PATCH] drm/amd/powerplay: remove duplicate macro
 smu_get_uclk_dpm_states in amdgpu_smu.h
Thread-Index: AQHVVxkVKFwudqhgFkKbh9N9gzFIyA==
Date: Tue, 20 Aug 2019 05:35:32 +0000
Message-ID: <20190820053503.2486-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0039.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:17::27) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.22.0
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d27de49-9527-448a-7443-08d72530381a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3088; 
x-ms-traffictypediagnostic: MN2PR12MB3088:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB308853DAAB3A590F6E00E47BA2AB0@MN2PR12MB3088.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1002;
x-forefront-prvs: 013568035E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(199004)(189003)(256004)(2351001)(6512007)(6916009)(386003)(2616005)(6486002)(99286004)(305945005)(7736002)(81166006)(52116002)(2906002)(50226002)(8676002)(86362001)(6116002)(6506007)(81156014)(102836004)(53936002)(3846002)(25786009)(71200400001)(4326008)(2501003)(6436002)(66066001)(64756008)(71190400001)(66946007)(8936002)(66446008)(316002)(476003)(478600001)(66556008)(26005)(54906003)(36756003)(14454004)(5640700003)(66476007)(186003)(5660300002)(486006)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3088;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6P3yYybra8u6F4arJTeAbphflagtwJaPZzv9sBTUnJ4YobWTKwXT+Rjg80rOi0Z03IJlc3Rr+okUCsYPQXIyNSj8vgpLj2PsgGjuo3zxVp4SGOIhuA5LeTZY5OtRUXF457JeVHnWbQflg4tIQAIzPhHeYZahaXdByu3WmaGjE0x4XpGiJNmG2M2ydXZsxAIoWCljD6pRP73WPyHltpoCRgtDqUycDB7g/pmwo8NARFdXnXfpqyJQ4RL4BilFTzs4+xTHqMXCwDgAKXKURicf7EmnC/cqHdJZz4FQ+sHWsO5J7FYZOZm1iyowVebkRvBcTFCq+QOARCS2Yg/qZDysSeSWUb+cpa/b8pBZQZWX3ixLOtlokzrFHx57eTVpEea2dAYS7MpUfjHfsPp0vtJOTu/0Ajt9A7WPdHIrnv6pWLw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d27de49-9527-448a-7443-08d72530381a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2019 05:35:32.8068 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZYHdHuvvlMCKtocD6mLDix52U1rH2C0MSuRy5WLfX4mmLOfXA6aplzfCs/mjh5q/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3088
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mP3lVzxtAZDE77uPKJr/wH9TK6FLjMQTeXEBbClBGRA=;
 b=GBaNPehMZUstNsNJjpBWfXoMBcbpx2ZJp0NGsnji3+eqgEyCVYanufyyYI785bDROgu1JBZyRau7i3n1awwzk6Fzz4UfV/uCdk97ygllzTwJmMdfYoQJwArKelNRrSYXcXl70sU1WDi4NxJEIwWHGvafGtc7GL/MOHNCY0z85do=
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Wang,
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

cmVtb3ZlIGR1cGxpY2F0ZSBtYWNybyBzbXVfZ2V0X3VjbGtfZHBtX3N0YXRlcyBpbiBhbWRncHVf
c211LmgKCiIKICNkZWZpbmUgc211X2dldF91Y2xrX2RwbV9zdGF0ZXMoc211LCBjbG9ja3NfaW5f
a2h6LCBudW1fc3RhdGVzKSBcCiAgICAgICAgICgoc211KS0+cHB0X2Z1bmNzLT5nZXRfdWNsa19k
cG1fc3RhdGVzID8gKHNtdSktPnBwdF9mdW5jcy0+Z2V0X3VjbGtfZHBtX3N0YXRlcygoc211KSwg
KGNsb2Nrc19pbl9raHopLCAobnVtX3N0YXRlcykpIDogMCkKICNkZWZpbmUgc211X2dldF9tYXhf
c3VzdGFpbmFibGVfY2xvY2tzX2J5X2RjKHNtdSwgbWF4X2Nsb2NrcykgXAogICAgICAgICAoKHNt
dSktPmZ1bmNzLT5nZXRfbWF4X3N1c3RhaW5hYmxlX2Nsb2Nrc19ieV9kYyA/IChzbXUpLT5mdW5j
cy0+Z2V0X21heF9zdXN0YWluYWJsZV9jbG9ja3NfYnlfZGMoKHNtdSksIChtYXhfY2xvY2tzKSkg
OiAwKQogI2RlZmluZSBzbXVfZ2V0X3VjbGtfZHBtX3N0YXRlcyhzbXUsIGNsb2Nrc19pbl9raHos
IG51bV9zdGF0ZXMpIFwKICAgICAgICAgKChzbXUpLT5wcHRfZnVuY3MtPmdldF91Y2xrX2RwbV9z
dGF0ZXMgPyAoc211KS0+cHB0X2Z1bmNzLT5nZXRfdWNsa19kcG1fc3RhdGVzKChzbXUpLCAoY2xv
Y2tzX2luX2toeiksIChudW1fc3RhdGVzKSkgOiAwKQoiCgpTaWduZWQtb2ZmLWJ5OiBLZXZpbiBX
YW5nIDxrZXZpbjEud2FuZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L2luYy9hbWRncHVfc211LmggfCAyIC0tCiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1
X3NtdS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaApp
bmRleCBjYTliOWVjMzlkZTguLmZjNTlkOTY4NmU2MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oCkBAIC03MzAsOCArNzMwLDYgQEAgc3RydWN0
IHNtdV9mdW5jcwogCSgoc211KS0+ZnVuY3MtPnJlZ2lzdGVyX2lycV9oYW5kbGVyID8gKHNtdSkt
PmZ1bmNzLT5yZWdpc3Rlcl9pcnFfaGFuZGxlcihzbXUpIDogMCkKICNkZWZpbmUgc211X3NldF9h
emFsaWFfZDNfcG1lKHNtdSkgXAogCSgoc211KS0+ZnVuY3MtPnNldF9hemFsaWFfZDNfcG1lID8g
KHNtdSktPmZ1bmNzLT5zZXRfYXphbGlhX2QzX3BtZSgoc211KSkgOiAwKQotI2RlZmluZSBzbXVf
Z2V0X3VjbGtfZHBtX3N0YXRlcyhzbXUsIGNsb2Nrc19pbl9raHosIG51bV9zdGF0ZXMpIFwKLQko
KHNtdSktPnBwdF9mdW5jcy0+Z2V0X3VjbGtfZHBtX3N0YXRlcyA/IChzbXUpLT5wcHRfZnVuY3Mt
PmdldF91Y2xrX2RwbV9zdGF0ZXMoKHNtdSksIChjbG9ja3NfaW5fa2h6KSwgKG51bV9zdGF0ZXMp
KSA6IDApCiAjZGVmaW5lIHNtdV9nZXRfbWF4X3N1c3RhaW5hYmxlX2Nsb2Nrc19ieV9kYyhzbXUs
IG1heF9jbG9ja3MpIFwKIAkoKHNtdSktPmZ1bmNzLT5nZXRfbWF4X3N1c3RhaW5hYmxlX2Nsb2Nr
c19ieV9kYyA/IChzbXUpLT5mdW5jcy0+Z2V0X21heF9zdXN0YWluYWJsZV9jbG9ja3NfYnlfZGMo
KHNtdSksIChtYXhfY2xvY2tzKSkgOiAwKQogI2RlZmluZSBzbXVfZ2V0X3VjbGtfZHBtX3N0YXRl
cyhzbXUsIGNsb2Nrc19pbl9raHosIG51bV9zdGF0ZXMpIFwKLS0gCjIuMjIuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
