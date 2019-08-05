Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC9B815FA
	for <lists+amd-gfx@lfdr.de>; Mon,  5 Aug 2019 11:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D0589F82;
	Mon,  5 Aug 2019 09:55:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810050.outbound.protection.outlook.com [40.107.81.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5CFA89F82
 for <amd-gfx@lists.freedesktop.org>; Mon,  5 Aug 2019 09:55:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UT6iA1d6nA3Omjl+oKaMQlyh+EpLMvy6R9/ns7JQvZQBwZ68Ac1YC7VHO0e0gr82vo3ykkP8cGDBacg78tkm5hgvBU3Ychv7aRW99VkSa9BOKccUUiyDmpZuZsngsJ91i8yCiLgK+EfJ1y+oKnIFWb57JIunnbOzGgYzqlt70wjKvGJznf+deOhDvWcPNGth77m9yidgOTi2Nv460ix2R3DpS2RBcROFZ+Xnj+K7Ju1uH0XCXG10ytq5UmUcRrCpwSEe34yE/Ct39yFRhf8UQJXDaYh3YYLpJTpzpF6g9PxSW0i4lB5dsXm3Jw04A985xBQ1u6i/2dsIf6h2l8nvSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJDF2DtdA71p4DtC1Iqrg4hDwmekQHgz+WgeG3QML1Q=;
 b=nw1IvCljROwcJ6jseHEdAzjmhT0Zkr7/P9brmOsfPqPF1QSiPqZGESZzijJLU9WiVzFzw/mIWAcLYjjSdhYaXglfSw6Kx99+A8ko+jbwC0qMtqYfqfbZYFOOcDsNUeOIIuMxRyVrMRW+qNzayomvRbNw6bpdcVwVr8RyU4OLHmfJijZbXV3srZQM0Eow1yQuTuAnOKIVoCcPIZtCkl1h/8DBc6b+7tl31P+S6igeR5lt5Oop87EfWj97uL62eHfkdggwYXkABZBrJaRYLY2a9Pc9XQOJi/S5dD1BTV/bguAKtQN3q//xcix0H+fA6/Em+ltL7eMkk9dRoJoGuSOntg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3537.namprd12.prod.outlook.com (20.179.67.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Mon, 5 Aug 2019 09:55:29 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00%3]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 09:55:29 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/discovery: move common discovery code out of
 navi1*_reg_base_init()
Thread-Topic: [PATCH] drm/amdgpu/discovery: move common discovery code out of
 navi1*_reg_base_init()
Thread-Index: AQHVS3PpzpCXA2t0LkqC1GwxlE006w==
Date: Mon, 5 Aug 2019 09:55:29 +0000
Message-ID: <20190805095509.18449-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR01CA0010.apcprd01.prod.exchangelabs.com
 (2603:1096:203:92::22) To BN8PR12MB3602.namprd12.prod.outlook.com
 (2603:10b6:408:49::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 309488e8-d551-41dd-3a07-08d7198b0c35
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN8PR12MB3537; 
x-ms-traffictypediagnostic: BN8PR12MB3537:
x-microsoft-antispam-prvs: <BN8PR12MB3537F9E39717E031928FDF3689DA0@BN8PR12MB3537.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1388;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(366004)(346002)(396003)(136003)(189003)(199004)(66476007)(99286004)(6512007)(102836004)(386003)(6506007)(68736007)(52116002)(5660300002)(26005)(2351001)(14444005)(256004)(66066001)(36756003)(25786009)(186003)(478600001)(4326008)(14454004)(7736002)(81166006)(81156014)(71190400001)(1076003)(305945005)(6116002)(3846002)(54906003)(2906002)(6916009)(71200400001)(8936002)(8676002)(6436002)(50226002)(53936002)(316002)(476003)(66446008)(86362001)(66946007)(486006)(2616005)(2501003)(64756008)(66556008)(5640700003)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3537;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 32oiLHWpAEkuzJGqCF4RSudo3tH6Wp+7hnAWjeMKubPP2vgFGnWy4jjaQie9wyDs3KQz0L2wbI3n5cL22lnxBCn9jBs6APYZKKmzxq90/s/8/Faxr1imzjDytmIeAvMki2AzaqVyBa6Ptr96GPKc5/0i0Eeokb/I3vfzYf8CyH22QGsS3Zk2gKMljMGDA/SlApwrzFSOA1/W62WD3yLZwqcGX6WMXHlxe+oPfEDQ12VDRUK2ahbgY4MQiypF6lDQkqfBOjH+6+eteyLi/XLy6WGcgpW1j//ZzuP4xj1jizlxTZXGIEZqgtwxV3ft4nMjkAsqWRQEpWDPLJz5AtFInYz5hhpfXX653GwK0X2rjZtVlEUMvOSCiqM1Z6IhOjhKUBhp0enmrhwtDT88sfg8sEZssyyMkRFIzmiXFndJu6U=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 309488e8-d551-41dd-3a07-08d7198b0c35
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 09:55:29.5915 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xiyuan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3537
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJDF2DtdA71p4DtC1Iqrg4hDwmekQHgz+WgeG3QML1Q=;
 b=fKZCBD6mnuhjMvCAIOiWRUbg3zSXpNAQ8Y4798GcVJpcSk/gpHPqEoEsTypjw/nfYMABUVyf/uAbEW7/Io5+EkbNqVvjZcQH8R/pwP88xY3cc5SERcZ9ESmp4qax1Q++frLrpFBYhrfnSgYfxahTdi3IBTZ3Jw2qJRAtG6VsR3M=
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>,
 "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

bW92ZSBhbWRncHVfZGlzY292ZXJ5X3JlZ19iYXNlX2luaXQoKSBmcm9tIG5hdmkxKl9yZWdfYmFz
ZV9pbml0KCkgdG8gYQpjb21tb24gZnVuY3Rpb24gbnZfcmVnX2Jhc2VfaW5pdCgpLgoKU2lnbmVk
LW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9uYXZpMTBfcmVnX2luaXQuYyB8IDE0ICstLS0tLS0tLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25hdmkxNF9yZWdfaW5pdC5jIHwgMTQgKy0tLS0tLS0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYyAgICAgICAgICAgICAgfCAyOSArKysr
KysrKysrKysrKysrKystLQogMyBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAyOCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYXZp
MTBfcmVnX2luaXQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25hdmkxMF9yZWdfaW5p
dC5jCmluZGV4IDU1MDE0Y2U4NjcwYS4uYTU2YzkzNjIwZTc4IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9uYXZpMTBfcmVnX2luaXQuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9uYXZpMTBfcmVnX2luaXQuYwpAQCAtMjksMjAgKzI5LDggQEAKIAogaW50
IG5hdmkxMF9yZWdfYmFzZV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogewotCWlu
dCByLCBpOworCWludCBpOwogCi0JaWYgKGFtZGdwdV9kaXNjb3ZlcnkpIHsKLQkJciA9IGFtZGdw
dV9kaXNjb3ZlcnlfcmVnX2Jhc2VfaW5pdChhZGV2KTsKLQkJaWYgKHIpIHsKLQkJCURSTV9XQVJO
KCJmYWlsZWQgdG8gaW5pdCByZWcgYmFzZSBmcm9tIGlwIGRpc2NvdmVyeSB0YWJsZSwgIgotCQkJ
CQkiZmFsbGJhY2sgdG8gbGVnYWN5IGluaXQgbWV0aG9kXG4iKTsKLQkJCWdvdG8gbGVnYWN5X2lu
aXQ7Ci0JCX0KLQotCQlyZXR1cm4gMDsKLQl9Ci0KLWxlZ2FjeV9pbml0OgogCWZvciAoaSA9IDAg
OyBpIDwgTUFYX0lOU1RBTkNFIDsgKytpKSB7CiAJCWFkZXYtPnJlZ19vZmZzZXRbR0NfSFdJUF1b
aV0gPSAodWludDMyX3QgKikoJihHQ19CQVNFLmluc3RhbmNlW2ldKSk7CiAJCWFkZXYtPnJlZ19v
ZmZzZXRbSERQX0hXSVBdW2ldID0gKHVpbnQzMl90ICopKCYoSERQX0JBU0UuaW5zdGFuY2VbaV0p
KTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25hdmkxNF9yZWdfaW5p
dC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmF2aTE0X3JlZ19pbml0LmMKaW5kZXgg
ODY0NjY4YTdmMWQyLi4zYjVmMGY2NWUwOTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L25hdmkxNF9yZWdfaW5pdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L25hdmkxNF9yZWdfaW5pdC5jCkBAIC0yOSwyMCArMjksOCBAQAogCiBpbnQgbmF2aTE0X3Jl
Z19iYXNlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7Ci0JaW50IHIsIGk7CisJ
aW50IGk7CiAKLQlpZiAoYW1kZ3B1X2Rpc2NvdmVyeSkgewotCQlyID0gYW1kZ3B1X2Rpc2NvdmVy
eV9yZWdfYmFzZV9pbml0KGFkZXYpOwotCQlpZiAocikgewotCQkJRFJNX1dBUk4oImZhaWxlZCB0
byBpbml0IHJlZyBiYXNlIGZyb20gaXAgZGlzY292ZXJ5IHRhYmxlLCAiCi0JCQkJCSJmYWxsYmFj
ayB0byBsZWdhY3kgaW5pdCBtZXRob2RcbiIpOwotCQkJZ290byBsZWdhY3lfaW5pdDsKLQkJfQot
Ci0JCXJldHVybiAwOwotCX0KLQotbGVnYWN5X2luaXQ6CiAJZm9yIChpID0gMCA7IGkgPCBNQVhf
SU5TVEFOQ0UgOyArK2kpIHsKIAkJYWRldi0+cmVnX29mZnNldFtHQ19IV0lQXVtpXSA9ICh1aW50
MzJfdCAqKSgmKEdDX0JBU0UuaW5zdGFuY2VbaV0pKTsKIAkJYWRldi0+cmVnX29mZnNldFtIRFBf
SFdJUF1baV0gPSAodWludDMyX3QgKikoJihIRFBfQkFTRS5pbnN0YW5jZVtpXSkpOwpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L252LmMKaW5kZXggOTYxNGM2NWZhMjkyLi45ZTNkOGQ0YTBkODYgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvbnYuYwpAQCAtMzc1LDkgKzM3NSwyMiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGFtZGdwdV9pcF9ibG9ja192ZXJzaW9uIG52X2NvbW1vbl9pcF9ibG9jayA9CiAJLmZ1bmNzID0g
Jm52X2NvbW1vbl9pcF9mdW5jcywKIH07CiAKLWludCBudl9zZXRfaXBfYmxvY2tzKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KQorc3RhdGljIGludCBudl9yZWdfYmFzZV9pbml0KHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KQogewotCS8qIFNldCBJUCByZWdpc3RlciBiYXNlIGJlZm9yZSBh
bnkgSFcgcmVnaXN0ZXIgYWNjZXNzICovCisJaW50IHI7CisKKwlpZiAoYW1kZ3B1X2Rpc2NvdmVy
eSkgeworCQlyID0gYW1kZ3B1X2Rpc2NvdmVyeV9yZWdfYmFzZV9pbml0KGFkZXYpOworCQlpZiAo
cikgeworCQkJRFJNX1dBUk4oImZhaWxlZCB0byBpbml0IHJlZyBiYXNlIGZyb20gaXAgZGlzY292
ZXJ5IHRhYmxlLCAiCisJCQkJCSJmYWxsYmFjayB0byBsZWdhY3kgaW5pdCBtZXRob2RcbiIpOwor
CQkJZ290byBsZWdhY3lfaW5pdDsKKwkJfQorCisJCXJldHVybiAwOworCX0KKworbGVnYWN5X2lu
aXQ6CiAJc3dpdGNoIChhZGV2LT5hc2ljX3R5cGUpIHsKIAljYXNlIENISVBfTkFWSTEwOgogCQlu
YXZpMTBfcmVnX2Jhc2VfaW5pdChhZGV2KTsKQEAgLTM5Miw2ICs0MDUsMTggQEAgaW50IG52X3Nl
dF9pcF9ibG9ja3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCXJldHVybiAtRUlOVkFM
OwogCX0KIAorCXJldHVybiAwOworfQorCitpbnQgbnZfc2V0X2lwX2Jsb2NrcyhzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldikKK3sKKwlpbnQgcjsKKworCS8qIFNldCBJUCByZWdpc3RlciBiYXNl
IGJlZm9yZSBhbnkgSFcgcmVnaXN0ZXIgYWNjZXNzICovCisJciA9IG52X3JlZ19iYXNlX2luaXQo
YWRldik7CisJaWYgKHIpCisJCXJldHVybiByOworCiAJYWRldi0+bmJpb19mdW5jcyA9ICZuYmlv
X3YyXzNfZnVuY3M7CiAKIAlhZGV2LT5uYmlvX2Z1bmNzLT5kZXRlY3RfaHdfdmlydChhZGV2KTsK
LS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
