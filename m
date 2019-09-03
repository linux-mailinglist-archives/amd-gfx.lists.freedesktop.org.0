Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1149A5FDA
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 05:44:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA7648997C;
	Tue,  3 Sep 2019 03:44:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760087.outbound.protection.outlook.com [40.107.76.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567868997C
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Sep 2019 03:44:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iDN+osZZA8Sv+Uy5DHyoPQuQg9uop3mf9+OTSVuaxDWp5V9TWNlpN9mEkyLJ/8yIiR+M2dIQ1QZAjDB1uklHJZLN9fNNSKQJ7kjqCzaBvqLsbR+3Wu+fq6y+UHBncZvbITXYexe7Q1UUNk+GNmdnx6nCrjSjC+Fx2MAZDPjOj7mgDfKlcv43A/cuGkZ65gDjrls4fmgKFSMTj3R6LhuAp6EDBNJmeQD4GLO40U+PkCgg3ZPK+qre3dJyO60TNTIrjk2P1e8U1PgN4mY01v91OzczQvGtyKiufU+aT/1EGWfWwQwlFl/Nzk5dcpv7/tg7MhtbSbvYHtkxXe6SItUHWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xiq3uRnsN2SKf3GsneWybZuqmLRMQ1tg9BTS6m03Eqc=;
 b=e4sSRu1G/L92+rKcgPrmtADfoefwmr+QVSeM0qovNfUsIRyMqf7DAafbesarsWAlhTu+s/tcZvpPjE8aG93one8DN3BDziRxieZPOGHpVEKLgK9vsHXeaDMdPvc1GoTY0hMdfhK02u0vnPA9zeoPgAbZwliAi8fv2KN6EpaBh+MJ7vBNF/HBmQ2Cj31xfg7uwz2bHVCaeJ1Fw/MaJuf9Dpm48jYfJJ47Ipndu0k9vmD6mI7yBK62A1xcODGOs54fyrk5FyQELt0FR8QP5v9BrgEZGXhFZASrUmDkfvXJ6EB2d4a2UGHNCVruAc4KfqS0rS6gcFVd/seRV1ujEP91jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3053.namprd12.prod.outlook.com (20.178.241.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Tue, 3 Sep 2019 03:44:05 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed%6]) with mapi id 15.20.2220.021; Tue, 3 Sep 2019
 03:44:05 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: do proper cleanups on hw_fini
Thread-Topic: [PATCH] drm/amd/powerplay: do proper cleanups on hw_fini
Thread-Index: AQHVYgnVJlYcNsHbwkaZ7rqoIq5Rdg==
Date: Tue, 3 Sep 2019 03:44:04 +0000
Message-ID: <20190903034336.16005-1-evan.quan@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0159.apcprd02.prod.outlook.com
 (2603:1096:201:1f::19) To MN2PR12MB3344.namprd12.prod.outlook.com
 (2603:10b6:208:c5::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4146cc08-300c-4075-9c1c-08d73020f789
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3053; 
x-ms-traffictypediagnostic: MN2PR12MB3053:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3053CF7183F713180F919189E4B90@MN2PR12MB3053.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:33;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(39860400002)(136003)(396003)(376002)(199004)(189003)(5640700003)(102836004)(305945005)(7736002)(8936002)(6916009)(2906002)(6116002)(53936002)(66556008)(50226002)(1076003)(2501003)(256004)(26005)(71190400001)(66066001)(14454004)(8676002)(64756008)(81156014)(66476007)(66446008)(81166006)(66946007)(52116002)(2351001)(3846002)(99286004)(6512007)(71200400001)(54906003)(316002)(14444005)(5660300002)(478600001)(186003)(6486002)(36756003)(476003)(4326008)(2616005)(86362001)(486006)(6506007)(25786009)(386003)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3053;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: r5lGylfx4JCMF+BernASHMhwMKCgxI3XtAkrdWeKUf3dBfcwovkekVNMIj/mmbMpmaaFe4s+O1ioNoOGqftx0TCIW2Sw+CFVvBjGq2MQMlj601WhYAvx+1XxkFu96kbRpvdMvxws+k9k8uWislr11wpPrt0aV0OEFCaQWgpSNq/LehLcqVq3Odf8kQhlBG6FTzYMuY4SVzbJ6fZdHskRrL5POZD80I71851XzNbXiOuoW/ogc+G+8myjDym7mtiWMrqKjGl0gLjuXVqRvQ+Alc7fqc49zIr5YteqjhIo8IIwiF3sdojv4j0Kolda0ZhGc55eZwvoAiqZkJRhyTc07ExGq5UoErPwHIUntJUHvffsqszFsLrqCWxSm4rRyfbNjjItQSpfjnh6USIwpe77bJQ2QcGBl9Es9xFAoNrV+p8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4146cc08-300c-4075-9c1c-08d73020f789
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 03:44:04.9150 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9f6XUFsCt09y5y60/A+KlNVtlDZAX3pfB58Qk1r/Z2brzH3FqFdzy7HeljSkR0lc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3053
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xiq3uRnsN2SKf3GsneWybZuqmLRMQ1tg9BTS6m03Eqc=;
 b=ASuP7RvoDKZoeSQNHW7cmkkgzUu+JM8++68yLAIMpasmC67yhFCHWmDbqWmg4PTdegKqBu793XyX3sJUJ7RWOZdgK94wuhE5FNCokfa0KQgwT33xGrzzDl2oAZD77TmENt/+v4dK8C8lFDPQv2Hx/n7t7B26s1fJaElHjtMIYJ8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Cc: "Li, Candice" <Candice.Li@amd.com>, "Gui, Jack" <Jack.Gui@amd.com>, "Quan, 
 Evan" <Evan.Quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlc2UgYXJlIG5lZWRlZCBmb3Igc211X3Jlc2V0IHN1cHBvcnQuCgpDaGFuZ2UtSWQ6IElmMjll
ZGU0Yjk5NzU4YWRiMDhmZDRlMTY2NjVmNDRmZDg5M2VjOTliClNpZ25lZC1vZmYtYnk6IEV2YW4g
UXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvYW1kZ3B1X3NtdS5jICAgICB8IDE3ICsrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oIHwgIDMgKysrCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYyAgICAgIHwgMTAgKysrKysrKysrKwogMyBmaWxl
cyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvYW1kZ3B1X3NtdS5jCmluZGV4IGQ1ZWUxM2E3OGViNy4uM2NmOGQ5NDRmODkwIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCkBAIC0xMjg2LDYgKzEyODYs
MTEgQEAgc3RhdGljIGludCBzbXVfaHdfaW5pdCh2b2lkICpoYW5kbGUpCiAJcmV0dXJuIHJldDsK
IH0KIAorc3RhdGljIGludCBzbXVfc3RvcF9kcG1zKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQor
eworCXJldHVybiBzbXVfc2VuZF9zbWNfbXNnKHNtdSwgU01VX01TR19EaXNhYmxlQWxsU211RmVh
dHVyZXMpOworfQorCiBzdGF0aWMgaW50IHNtdV9od19maW5pKHZvaWQgKmhhbmRsZSkKIHsKIAlz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqKWhhbmRs
ZTsKQEAgLTEyOTgsNiArMTMwMywxOCBAQCBzdGF0aWMgaW50IHNtdV9od19maW5pKHZvaWQgKmhh
bmRsZSkKIAkJc211X3Bvd2VyZ2F0ZV92Y24oJmFkZXYtPnNtdSwgdHJ1ZSk7CiAJfQogCisJcmV0
ID0gc211X3N0b3BfdGhlcm1hbF9jb250cm9sKHNtdSk7CisJaWYgKHJldCkgeworCQlwcl93YXJu
KCJGYWlsIHRvIHN0b3AgdGhlcm1hbCBjb250cm9sIVxuIik7CisJCXJldHVybiByZXQ7CisJfQor
CisJcmV0ID0gc211X3N0b3BfZHBtcyhzbXUpOworCWlmIChyZXQpIHsKKwkJcHJfd2FybigiRmFp
bCB0byBzdG9wIERwbXMhXG4iKTsKKwkJcmV0dXJuIHJldDsKKwl9CisKIAlrZnJlZSh0YWJsZV9j
b250ZXh0LT5kcml2ZXJfcHB0YWJsZSk7CiAJdGFibGVfY29udGV4dC0+ZHJpdmVyX3BwdGFibGUg
PSBOVUxMOwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMv
YW1kZ3B1X3NtdS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9z
bXUuaAppbmRleCBiMTkyMjRjYjZkNmQuLjhlNGIwYWQyNDcxMiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaAorKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oCkBAIC00OTgsNiArNDk4LDcgQEAg
c3RydWN0IHNtdV9mdW5jcwogCWludCAoKmdldF9jdXJyZW50X2Nsa19mcmVxKShzdHJ1Y3Qgc211
X2NvbnRleHQgKnNtdSwgZW51bSBzbXVfY2xrX3R5cGUgY2xrX2lkLCB1aW50MzJfdCAqdmFsdWUp
OwogCWludCAoKmluaXRfbWF4X3N1c3RhaW5hYmxlX2Nsb2Nrcykoc3RydWN0IHNtdV9jb250ZXh0
ICpzbXUpOwogCWludCAoKnN0YXJ0X3RoZXJtYWxfY29udHJvbCkoc3RydWN0IHNtdV9jb250ZXh0
ICpzbXUpOworCWludCAoKnN0b3BfdGhlcm1hbF9jb250cm9sKShzdHJ1Y3Qgc211X2NvbnRleHQg
KnNtdSk7CiAJaW50ICgqcmVhZF9zZW5zb3IpKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBlbnVt
IGFtZF9wcF9zZW5zb3JzIHNlbnNvciwKIAkJCSAgIHZvaWQgKmRhdGEsIHVpbnQzMl90ICpzaXpl
KTsKIAlpbnQgKCpzZXRfZGVlcF9zbGVlcF9kY2VmY2xrKShzdHJ1Y3Qgc211X2NvbnRleHQgKnNt
dSwgdWludDMyX3QgY2xrKTsKQEAgLTY0Nyw2ICs2NDgsOCBAQCBzdHJ1Y3Qgc211X2Z1bmNzCiAJ
KChzbXUpLT5wcHRfZnVuY3MtPnNldF90aGVybWFsX2Zhbl90YWJsZSA/IChzbXUpLT5wcHRfZnVu
Y3MtPnNldF90aGVybWFsX2Zhbl90YWJsZSgoc211KSkgOiAwKQogI2RlZmluZSBzbXVfc3RhcnRf
dGhlcm1hbF9jb250cm9sKHNtdSkgXAogCSgoc211KS0+ZnVuY3MtPnN0YXJ0X3RoZXJtYWxfY29u
dHJvbD8gKHNtdSktPmZ1bmNzLT5zdGFydF90aGVybWFsX2NvbnRyb2woKHNtdSkpIDogMCkKKyNk
ZWZpbmUgc211X3N0b3BfdGhlcm1hbF9jb250cm9sKHNtdSkgXAorCSgoc211KS0+ZnVuY3MtPnN0
b3BfdGhlcm1hbF9jb250cm9sPyAoc211KS0+ZnVuY3MtPnN0b3BfdGhlcm1hbF9jb250cm9sKChz
bXUpKSA6IDApCiAjZGVmaW5lIHNtdV9yZWFkX3NlbnNvcihzbXUsIHNlbnNvciwgZGF0YSwgc2l6
ZSkgXAogCSgoc211KS0+cHB0X2Z1bmNzLT5yZWFkX3NlbnNvcj8gKHNtdSktPnBwdF9mdW5jcy0+
cmVhZF9zZW5zb3IoKHNtdSksIChzZW5zb3IpLCAoZGF0YSksIChzaXplKSkgOiAwKQogI2RlZmlu
ZSBzbXVfc21jX3JlYWRfc2Vuc29yKHNtdSwgc2Vuc29yLCBkYXRhLCBzaXplKSBcCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jCmluZGV4IGRiNWU5NGNlNTRhZi4uMWEz
OGFmODQzOTRlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVf
djExXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYwpA
QCAtMTIwOSw2ICsxMjA5LDE1IEBAIHN0YXRpYyBpbnQgc211X3YxMV8wX3N0YXJ0X3RoZXJtYWxf
Y29udHJvbChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKIAlyZXR1cm4gcmV0OwogfQogCitzdGF0
aWMgaW50IHNtdV92MTFfMF9zdG9wX3RoZXJtYWxfY29udHJvbChzdHJ1Y3Qgc211X2NvbnRleHQg
KnNtdSkKK3sKKwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHNtdS0+YWRldjsKKworCVdS
RUczMl9TT0MxNShUSE0sIDAsIG1tVEhNX1RIRVJNQUxfSU5UX0VOQSwgMCk7CisKKwlyZXR1cm4g
MDsKK30KKwogc3RhdGljIHVpbnQxNl90IGNvbnZlcnRfdG9fdmRkYyh1aW50OF90IHZpZCkKIHsK
IAlyZXR1cm4gKHVpbnQxNl90KSAoKDYyMDAgLSAodmlkICogMjUpKSAvIFNNVTExX1ZPTFRBR0Vf
U0NBTEUpOwpAQCAtMTc4Myw2ICsxNzkyLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbXVfZnVu
Y3Mgc211X3YxMV8wX2Z1bmNzID0gewogCS5nZXRfY3VycmVudF9jbGtfZnJlcSA9IHNtdV92MTFf
MF9nZXRfY3VycmVudF9jbGtfZnJlcSwKIAkuaW5pdF9tYXhfc3VzdGFpbmFibGVfY2xvY2tzID0g
c211X3YxMV8wX2luaXRfbWF4X3N1c3RhaW5hYmxlX2Nsb2NrcywKIAkuc3RhcnRfdGhlcm1hbF9j
b250cm9sID0gc211X3YxMV8wX3N0YXJ0X3RoZXJtYWxfY29udHJvbCwKKwkuc3RvcF90aGVybWFs
X2NvbnRyb2wgPSBzbXVfdjExXzBfc3RvcF90aGVybWFsX2NvbnRyb2wsCiAJLnJlYWRfc2Vuc29y
ID0gc211X3YxMV8wX3JlYWRfc2Vuc29yLAogCS5zZXRfZGVlcF9zbGVlcF9kY2VmY2xrID0gc211
X3YxMV8wX3NldF9kZWVwX3NsZWVwX2RjZWZjbGssCiAJLmRpc3BsYXlfY2xvY2tfdm9sdGFnZV9y
ZXF1ZXN0ID0gc211X3YxMV8wX2Rpc3BsYXlfY2xvY2tfdm9sdGFnZV9yZXF1ZXN0LAotLSAKMi4y
My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
