Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE958BEDEA
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 10:56:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 649076EE8D;
	Thu, 26 Sep 2019 08:56:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680057.outbound.protection.outlook.com [40.107.68.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236E56EE8D
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 08:56:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jN8PB2O5LR0D+10gjC/zGywTe0O/O7DOCJjIr7sj4sacOGzZp2x5LuUP4M+0Yj10gU2mdLVrfn/Jq3gqZauuz23y0F04Fb17zZRSluezQJzKiO0x0Mjf2fMEMcTjnJ57vTHIitNlhcfPegWdk4hRrEzjbIO8rc50h+9JW4RkBSWRmEcwPNgYS6erF1zlPRFUDE0b0pWtoHCoyKOauBihluTJBIQuDFlag54SfCOr9Lz9r8ft83ZfJzg2MBGGEtn/8ESoRukXxlKyOvJf/m9wgzXtYbtHXArfB1h4/p9tMArJ64miLHb7DC665SfjnIxHUKbPwEvgaLy65cbvQ3CHDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zt9TMuR7874FbGcpW6ZNIxAfvKkPCdVGNju2yWLgwSI=;
 b=YI/FbepH/0zRFL/CYp5g/8rWN70HsWiKB0WDv46qSaWRwwpYzWKxKXS0tzEzhUXQUj8LaL3njkKbU6TS5sp4kkbA0yRoLRD3rQdvvFfEzAseaQKItlKTd1I76EluNmjMRL4sn2Ik0mT5N1gDVUs/7dfzREEad7oTCPsj6yVdvDtFTOxTzB2oPnNvrAF7/haOCWl+f7SM6i137iv7GA78cFSNAEkhElNsBz3gKDtqd/FLoW2bHqZrugAsSZdFYfxbU8HZO5Thg6yfTjaVF/NMBtRcu/e2OYr+FJvenWbB4FhKlLTeBrvQlS63kQzOpXYEgz9Uz/xYGf3/X1/uSIuDyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3581.namprd12.prod.outlook.com (20.178.242.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.19; Thu, 26 Sep 2019 08:56:25 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911%7]) with mapi id 15.20.2284.028; Thu, 26 Sep 2019
 08:56:25 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amd/powerplay: add sensor lock support for smu
Thread-Topic: [PATCH 2/2] drm/amd/powerplay: add sensor lock support for smu
Thread-Index: AQHVdEhGCFYYQbGscE2mazw/bqW7iA==
Date: Thu, 26 Sep 2019 08:56:25 +0000
Message-ID: <20190926085607.2510-2-kevin1.wang@amd.com>
References: <20190926085607.2510-1-kevin1.wang@amd.com>
In-Reply-To: <20190926085607.2510-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR04CA0051.apcprd04.prod.outlook.com
 (2603:1096:202:14::19) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45963e40-6346-4f40-e9fa-08d7425f6932
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3581; 
x-ms-traffictypediagnostic: MN2PR12MB3581:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB35817D6D4B6CF070F8E6E14AA2860@MN2PR12MB3581.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(39860400002)(396003)(366004)(189003)(199004)(102836004)(54906003)(66946007)(66476007)(64756008)(66556008)(5660300002)(6486002)(186003)(66446008)(2616005)(76176011)(6436002)(52116002)(11346002)(26005)(1076003)(476003)(5640700003)(386003)(6506007)(316002)(486006)(2501003)(14454004)(25786009)(446003)(6512007)(66066001)(4326008)(8676002)(478600001)(81156014)(81166006)(6916009)(305945005)(50226002)(2351001)(8936002)(256004)(14444005)(36756003)(3846002)(2906002)(86362001)(71190400001)(71200400001)(7736002)(99286004)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3581;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kPHxyOUSvMNpN4lHzzUxV+BO3UA7TMPFS+3oE6CSu4ZrDYWXNG4bEU/0QUoXlWCCPKfEfEIaVTsjvN2/56Or2BwIZ9DnCjDw2R5vSme3PJPv7uwfXpMZvgQxzeBCL1oJstHKLYyNpMrl81JbLieE7TZUQIZi19FhzutK3Jbxjo7rdxwfEZSs3AvC/6StQX+e5dPB38SH41dp/SeQJ2IWzYhdl/D/VVIcUtaOekDaZmrW3k/UUHzJRkuVm5Fa8R5VkH0YisTIDzbjC8drrU66zGmu/GcLdZ2IgDD3LChrdMx+fD/JjXLxiwxV7Fo6Or+gfZragQBZNbxOJYK18qCVHcXU23OTJC12sh1PE/7cHW3WSJqGK3hLctLWOweiz+ym2S/DSBbOdX3DSxnjn5oF/1JCLmvpx7AFiJbrA3Mwmm4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45963e40-6346-4f40-e9fa-08d7425f6932
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 08:56:25.3453 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2VekuEEz+S1zeoxPf++wGeHthXj0f25OSL90zN0SJcRcLDfmpY3kWPJBpT1lZkJx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3581
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zt9TMuR7874FbGcpW6ZNIxAfvKkPCdVGNju2yWLgwSI=;
 b=WQoVFINWIZItXPv5Qgl3h2HJxvJMrQmXrf0cAZoGIgUQPuxS0v4biYEW2U0gc4QA9ACkk5bo4IKOyhtrq0TlIuSOzOVM+r7euFOxBkHg8eJSLouk/MYHCuVPM4Cd89/Be1gEePoFSXhRS9OomB7+OmcRUriHQwAz8YXM18cq2WA=
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

d2hlbiBtdWx0aXRocmVhZGluZyBhY2Nlc3Mgc3lzZnMgb2YgYW1kZ3B1X3BtX2luZm8gYXQgdGhl
IHNhbWV0aW1lLgp0aGUgc3dzbXUgZHJpdmVyIGNhdXNlIHNtdSBmaXJtd2FyZSBoYW5nLgoKZWc6
CnNpbmdsZSB0aHJlYWQgYWNjZXNzOgpNZXNzYWdlIEEgKyBQYXJhbSBBID09PiByaWdodApNZXNz
YWdlIEIgKyBQYXJhbSBCID09PiByaWdodApNZXNzYWdlIEMgKyBQYXJhbSBDID09PiByaWdodApt
dWx0aXRocmVhZGluZyBhY2Nlc3M6Ck1lc3NhZ2UgQSArIFBhcmFtIEIgPT0+IGVycm9yCk1lc3Nh
Z2UgQiArIFBhcmFtIEEgPT0+IGVycm9yCk1lc3NhZ2UgQyArIFBhcmFtIEMgPT0+IHJpZ2h0Cgp0
aGUgcGF0Y2ggd2lsbCBhZGQgc2Vuc29yIGxvY2sobXV0ZXgpIHRvIGF2b2lkIHRoaXMgZXJyb3Iu
CgpTaWduZWQtb2ZmLWJ5OiBLZXZpbiBXYW5nIDxrZXZpbjEud2FuZ0BhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyAgICAgfCAyICsrCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYyAgIHwgMiArKwogZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaCB8IDEgKwogZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jICAgICB8IDIgKysKIGRyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYyAgICAgfCAyICsrCiA1IGZpbGVzIGNoYW5n
ZWQsIDkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L2FtZGdwdV9zbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdw
dV9zbXUuYwppbmRleCAyMzI5M2UxNTYzNmIuLmRmNTEwY2I4NmRhNSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwpAQCAtODQwLDYgKzg0MCw4IEBAIHN0YXRp
YyBpbnQgc211X3N3X2luaXQodm9pZCAqaGFuZGxlKQogCXNtdS0+c211X2JhY28uc3RhdGUgPSBT
TVVfQkFDT19TVEFURV9FWElUOwogCXNtdS0+c211X2JhY28ucGxhdGZvcm1fc3VwcG9ydCA9IGZh
bHNlOwogCisJbXV0ZXhfaW5pdCgmc211LT5zZW5zb3JfbG9jayk7CisKIAlzbXUtPndhdGVybWFy
a3NfYml0bWFwID0gMDsKIAlzbXUtPnBvd2VyX3Byb2ZpbGVfbW9kZSA9IFBQX1NNQ19QT1dFUl9Q
Uk9GSUxFX0JPT1RVUF9ERUZBVUxUOwogCXNtdS0+ZGVmYXVsdF9wb3dlcl9wcm9maWxlX21vZGUg
PSBQUF9TTUNfUE9XRVJfUFJPRklMRV9CT09UVVBfREVGQVVMVDsKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMKaW5kZXggYTA0N2E3ZWMzNjk4Li5iOWI3Yjcz
MzU0YTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVz
X3BwdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5j
CkBAIC0xMDI1LDYgKzEwMjUsNyBAQCBzdGF0aWMgaW50IGFyY3R1cnVzX3JlYWRfc2Vuc29yKHN0
cnVjdCBzbXVfY29udGV4dCAqc211LAogCWlmICghZGF0YSB8fCAhc2l6ZSkKIAkJcmV0dXJuIC1F
SU5WQUw7CiAKKwltdXRleF9sb2NrKCZzbXUtPnNlbnNvcl9sb2NrKTsKIAlzd2l0Y2ggKHNlbnNv
cikgewogCWNhc2UgQU1ER1BVX1BQX1NFTlNPUl9NQVhfRkFOX1JQTToKIAkJKih1aW50MzJfdCAq
KWRhdGEgPSBwcHRhYmxlLT5GYW5NYXhpbXVtUnBtOwpAQCAtMTA1MSw2ICsxMDUyLDcgQEAgc3Rh
dGljIGludCBhcmN0dXJ1c19yZWFkX3NlbnNvcihzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIAlk
ZWZhdWx0OgogCQlyZXQgPSBzbXVfc21jX3JlYWRfc2Vuc29yKHNtdSwgc2Vuc29yLCBkYXRhLCBz
aXplKTsKIAl9CisJbXV0ZXhfdW5sb2NrKCZzbXUtPnNlbnNvcl9sb2NrKTsKIAogCXJldHVybiBy
ZXQ7CiB9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1k
Z3B1X3NtdS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUu
aAppbmRleCA1Yzg5ODQ0NGZmOTcuLmJjNGI3M2UwNzE4ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaAorKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oCkBAIC0zNTAsNiArMzUwLDcgQEAgc3Ry
dWN0IHNtdV9jb250ZXh0CiAJY29uc3Qgc3RydWN0IHNtdV9mdW5jcwkJKmZ1bmNzOwogCWNvbnN0
IHN0cnVjdCBwcHRhYmxlX2Z1bmNzCSpwcHRfZnVuY3M7CiAJc3RydWN0IG11dGV4CQkJbXV0ZXg7
CisJc3RydWN0IG11dGV4CQkJc2Vuc29yX2xvY2s7CiAJdWludDY0X3QgcG9vbF9zaXplOwogCiAJ
c3RydWN0IHNtdV90YWJsZV9jb250ZXh0CXNtdV90YWJsZTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L25hdmkxMF9wcHQuYwppbmRleCBkYjJlMTgxYmE0NWEuLmMwYjY0MGQ4ZDllMSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwpAQCAtMTM4Nyw2
ICsxMzg3LDcgQEAgc3RhdGljIGludCBuYXZpMTBfcmVhZF9zZW5zb3Ioc3RydWN0IHNtdV9jb250
ZXh0ICpzbXUsCiAJaWYoIWRhdGEgfHwgIXNpemUpCiAJCXJldHVybiAtRUlOVkFMOwogCisJbXV0
ZXhfbG9jaygmc211LT5zZW5zb3JfbG9jayk7CiAJc3dpdGNoIChzZW5zb3IpIHsKIAljYXNlIEFN
REdQVV9QUF9TRU5TT1JfTUFYX0ZBTl9SUE06CiAJCSoodWludDMyX3QgKilkYXRhID0gcHB0YWJs
ZS0+RmFuTWF4aW11bVJwbTsKQEAgLTE0MTAsNiArMTQxMSw3IEBAIHN0YXRpYyBpbnQgbmF2aTEw
X3JlYWRfc2Vuc29yKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAogCWRlZmF1bHQ6CiAJCXJldCA9
IHNtdV9zbWNfcmVhZF9zZW5zb3Ioc211LCBzZW5zb3IsIGRhdGEsIHNpemUpOwogCX0KKwltdXRl
eF91bmxvY2soJnNtdS0+c2Vuc29yX2xvY2spOwogCiAJcmV0dXJuIHJldDsKIH0KZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYwppbmRleCA5MDgyZGExNTc4ZDEuLmY2
NTVlYmQ5YmEyMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVn
YTIwX3BwdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQu
YwpAQCAtMzAxNyw2ICszMDE3LDcgQEAgc3RhdGljIGludCB2ZWdhMjBfcmVhZF9zZW5zb3Ioc3Ry
dWN0IHNtdV9jb250ZXh0ICpzbXUsCiAJaWYoIWRhdGEgfHwgIXNpemUpCiAJCXJldHVybiAtRUlO
VkFMOwogCisJbXV0ZXhfbG9jaygmc211LT5zZW5zb3JfbG9jayk7CiAJc3dpdGNoIChzZW5zb3Ip
IHsKIAljYXNlIEFNREdQVV9QUF9TRU5TT1JfTUFYX0ZBTl9SUE06CiAJCSoodWludDMyX3QgKilk
YXRhID0gcHB0YWJsZS0+RmFuTWF4aW11bVJwbTsKQEAgLTMwNDIsNiArMzA0Myw3IEBAIHN0YXRp
YyBpbnQgdmVnYTIwX3JlYWRfc2Vuc29yKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAogCWRlZmF1
bHQ6CiAJCXJldCA9IHNtdV9zbWNfcmVhZF9zZW5zb3Ioc211LCBzZW5zb3IsIGRhdGEsIHNpemUp
OwogCX0KKwltdXRleF91bmxvY2soJnNtdS0+c2Vuc29yX2xvY2spOwogCiAJcmV0dXJuIHJldDsK
IH0KLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
