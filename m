Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3631EB73CE
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 09:13:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8CD6F950;
	Thu, 19 Sep 2019 07:13:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700067.outbound.protection.outlook.com [40.107.70.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17BC16F94D
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 07:13:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A9F/E3n58bozcS82YQJRNz5I9hH0GBvlxyJdv4QlmpTkgaLR8uLf09zTEsF3IRRF6VDVKCY0SoEpHdudgnZqIqeSkgidj5ZFAKVidfYhSHGiLfvGg258h6D/9EUxfKELFIt07fhh4459eO/Nr4ZQDT5TwLBTBanhKASmlGN5KJSkkSgD8b+xbEOgFcJUorNq+vdy4hH2qjpNX90+fnU4TRJJmovk/fDw8Ye+1NYOfLQE+JRdB1LFeudNd2Fou1uDZsiA4iSffqhg+zmDClYlRyLNZ/Nxy/DstEgE5MN3z6zYBnWvffJ2f7/GtMoLIJdc2hdGrZcUvFeA1Oa0hiScvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUVr/fbflyhqWZ7aWNu04dlSsTJqqGTGgbMY7R/aV1E=;
 b=EsPzluuFaBRQFS+HPeaoH2b1+hNoLDZQsVJDzk2ro6NLLKO2Yya6Agg24YIJl/rhQrql5ZzCsaNlt9LdwHB9TsqzyKY4BKii8yvqbQwta8fi9RAliUtQo0GbR+hERjFB5BKNXc5uJOWQWJCm2wWkHMMPZ9CBhm+3zoGFrPeBRyEeO9UgMHG1TQ+5Qh+IwkdsafyKkeHAsnyWg5gJ5zO9bz2raOKqmMHCFnRKGqbCd5eaYPq/CBnIi4JM+KlDPiy1E/I5F/ifvEgjnoHT+tqPluZlQju75NcfAjZhO9djvsCNhjGeFErOOY5rXdDA9nWqF/OUhovLNZ6l505td+rHoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB2894.namprd12.prod.outlook.com (20.179.84.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Thu, 19 Sep 2019 07:12:58 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 07:12:58 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: [PATCH 13/21] drm/amdgpu: remove ih_info parameter of
 umc_ras_late_init
Thread-Topic: [PATCH 13/21] drm/amdgpu: remove ih_info parameter of
 umc_ras_late_init
Thread-Index: AQHVbrmqkE9RNKbDC0SL4jEXzvfsyg==
Date: Thu, 19 Sep 2019 07:12:58 +0000
Message-ID: <20190919071115.16552-14-tao.zhou1@amd.com>
References: <20190919071115.16552-1-tao.zhou1@amd.com>
In-Reply-To: <20190919071115.16552-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0092.apcprd03.prod.outlook.com
 (2603:1096:203:72::32) To MN2PR12MB3054.namprd12.prod.outlook.com
 (2603:10b6:208:d1::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b038ac5b-0af6-4619-b8b7-08d73cd0cc94
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB2894; 
x-ms-traffictypediagnostic: MN2PR12MB2894:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB28949AFE07DAE40BE9F5E3D8B0890@MN2PR12MB2894.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:337;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(199004)(189003)(186003)(6506007)(102836004)(6512007)(316002)(8676002)(81156014)(64756008)(446003)(2501003)(52116002)(11346002)(476003)(2616005)(66446008)(86362001)(8936002)(5660300002)(66946007)(66476007)(81166006)(66556008)(50226002)(3846002)(2906002)(486006)(76176011)(99286004)(110136005)(6116002)(25786009)(7736002)(256004)(1076003)(66066001)(26005)(14454004)(386003)(6436002)(6486002)(4326008)(478600001)(71190400001)(71200400001)(6636002)(305945005)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2894;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: go6vOaImH8vAyPnMPYg97h2wQEMwpGoPA15yZnfoVHnqPSzA/JKFv4pWxTatbNS7ebd9KseIRfZvDSFd2WIOpwwZT3MZYAEVDgCEuVzlIV5oVXqWo09B8j4KqXJrM5ZPqUB1UDm4G2XVuQzt1DgqD3UKPu0YUlksairhciO5Ziz/9SaltBYn79NMdJ1fNuJdcvitM99BVVnVMKD95sY79HWfHhX9GbP95HC7xQEqXRSoyueimnF6rmzaDRDQ9rE/eQIzgKLbafBdZ1kOf2iGuBLahV/w2snbCFY4HQAW8XptnP8szwhPMsa8UIxeTZTlC97T0XMKaW1qTQh+LQzYZJfddyVHEo+9hGWO3i8m/wZJx/ZefSd/5U+Az/NG9lPCAwk4Xsq1CboOQK4YXf5IPqNv/8/74HW+2tySzNAvvKY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b038ac5b-0af6-4619-b8b7-08d73cd0cc94
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 07:12:58.2395 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L4c4nsXVZ68xUySSHPMxxvD6InU8Oi/sdoGW8NUhdpXF0QugXLTCOFBpR0S8UOEb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2894
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUVr/fbflyhqWZ7aWNu04dlSsTJqqGTGgbMY7R/aV1E=;
 b=rjNexPNhwzFDtzRTzH1e/FLnbt6Vbhr/fbdpn0JskB7VMTgohUhxdsoWWY9v/LLbNhKeuKa8/FGuFo0nUJsEIafov8nZXnFjnS3IJpSNvbkm+vL86NPQqX+3+F44dewBsQ64lG7+KfLxWXXvgFByLwUSdrEfuVLhu+FZY4JH0+g=
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

dW1jX3Jhc19sYXRlX2luaXQgY2FuIGdldCB0aGUgaW5mbyBieSBpdHNlbGYKClNpZ25lZC1vZmYt
Ynk6IFRhbyBaaG91IDx0YW8uemhvdTFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdW1jLmMgfCAxNSArKysrKysrLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV91bWMuaCB8ICA0ICsrLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2dtY192OV8wLmMgICB8ICA1ICstLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDEwIGluc2Vy
dGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV91bWMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV91bWMuYwppbmRleCBhY2MwYzQyOGY2ZmEuLjA4MDM3ZjA4NmQyOCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV91bWMuYwpAQCAtMjMsMTcgKzIzLDE2IEBACiAKICNpbmNsdWRl
ICJhbWRncHVfcmFzLmgiCiAKLWludCBhbWRncHVfdW1jX3Jhc19sYXRlX2luaXQoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYsIHZvaWQgKnJhc19paF9pbmZvKQoraW50IGFtZGdwdV91bWNfcmFz
X2xhdGVfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHsKIAlpbnQgcjsKLQlzdHJ1
Y3QgcmFzX2loX2lmICppaF9pbmZvID0gKHN0cnVjdCByYXNfaWhfaWYgKilyYXNfaWhfaW5mbzsK
IAlzdHJ1Y3QgcmFzX2ZzX2lmIGZzX2luZm8gPSB7CiAJCS5zeXNmc19uYW1lID0gInVtY19lcnJf
Y291bnQiLAogCQkuZGVidWdmc19uYW1lID0gInVtY19lcnJfaW5qZWN0IiwKIAl9OwotCi0JaWYg
KCFpaF9pbmZvKQotCQlyZXR1cm4gLUVJTlZBTDsKKwlzdHJ1Y3QgcmFzX2loX2lmIGloX2luZm8g
PSB7CisJCS5jYiA9IGFtZGdwdV91bWNfcHJvY2Vzc19yYXNfZGF0YV9jYiwKKwl9OwogCiAJaWYg
KCFhZGV2LT51bWMucmFzX2lmKSB7CiAJCWFkZXYtPnVtYy5yYXNfaWYgPQpAQCAtNDUsMTAgKzQ0
LDEwIEBAIGludCBhbWRncHVfdW1jX3Jhc19sYXRlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsIHZvaWQgKnJhc19paF9pbmZvKQogCQlhZGV2LT51bWMucmFzX2lmLT5zdWJfYmxvY2tf
aW5kZXggPSAwOwogCQlzdHJjcHkoYWRldi0+dW1jLnJhc19pZi0+bmFtZSwgInVtYyIpOwogCX0K
LQlpaF9pbmZvLT5oZWFkID0gZnNfaW5mby5oZWFkID0gKmFkZXYtPnVtYy5yYXNfaWY7CisJaWhf
aW5mby5oZWFkID0gZnNfaW5mby5oZWFkID0gKmFkZXYtPnVtYy5yYXNfaWY7CiAKIAlyID0gYW1k
Z3B1X3Jhc19sYXRlX2luaXQoYWRldiwgYWRldi0+dW1jLnJhc19pZiwKLQkJCQkgJmZzX2luZm8s
IGloX2luZm8pOworCQkJCSAmZnNfaW5mbywgJmloX2luZm8pOwogCWlmIChyKQogCQlnb3RvIGZy
ZWU7CiAKQEAgLTY4LDcgKzY3LDcgQEAgaW50IGFtZGdwdV91bWNfcmFzX2xhdGVfaW5pdChzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdm9pZCAqcmFzX2loX2luZm8pCiAJcmV0dXJuIDA7CiAK
IGxhdGVfZmluaToKLQlhbWRncHVfcmFzX2xhdGVfZmluaShhZGV2LCBhZGV2LT51bWMucmFzX2lm
LCBpaF9pbmZvKTsKKwlhbWRncHVfcmFzX2xhdGVfZmluaShhZGV2LCBhZGV2LT51bWMucmFzX2lm
LCAmaWhfaW5mbyk7CiBmcmVlOgogCWtmcmVlKGFkZXYtPnVtYy5yYXNfaWYpOwogCWFkZXYtPnVt
Yy5yYXNfaWYgPSBOVUxMOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3VtYy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5oCmlu
ZGV4IGEyNmVmNDkyMzkzMC4uNmYwYzQ0YWRhNThmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3VtYy5oCkBAIC01NSw3ICs1NSw3IEBACiAKIHN0cnVjdCBhbWRncHVfdW1jX2Z1
bmNzIHsKIAl2b2lkICgqZXJyX2NudF9pbml0KShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7
Ci0JaW50ICgqcmFzX2xhdGVfaW5pdCkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHZvaWQg
KnJhc19paF9pbmZvKTsKKwlpbnQgKCpyYXNfbGF0ZV9pbml0KShzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldik7CiAJdm9pZCAoKnF1ZXJ5X3Jhc19lcnJvcl9jb3VudCkoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsCiAJCQkJCXZvaWQgKnJhc19lcnJvcl9zdGF0dXMpOwogCXZvaWQgKCpxdWVy
eV9yYXNfZXJyb3JfYWRkcmVzcykoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCkBAIC04MSw3
ICs4MSw3IEBAIHN0cnVjdCBhbWRncHVfdW1jIHsKIAljb25zdCBzdHJ1Y3QgYW1kZ3B1X3VtY19m
dW5jcyAqZnVuY3M7CiB9OwogCi1pbnQgYW1kZ3B1X3VtY19yYXNfbGF0ZV9pbml0KHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2LCB2b2lkICpyYXNfaWhfaW5mbyk7CitpbnQgYW1kZ3B1X3VtY19y
YXNfbGF0ZV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKIGludCBhbWRncHVfdW1j
X3Byb2Nlc3NfcmFzX2RhdGFfY2Ioc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCXZvaWQg
KnJhc19lcnJvcl9zdGF0dXMsCiAJCXN0cnVjdCBhbWRncHVfaXZfZW50cnkgKmVudHJ5KTsKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCmluZGV4IGIyZjdlNzY1ZWZiOS4uNDUxYmJi
NTc1NDY4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKQEAgLTczMiwxMiAr
NzMyLDkgQEAgc3RhdGljIGludCBnbWNfdjlfMF9lY2NfbGF0ZV9pbml0KHZvaWQgKmhhbmRsZSkK
IHsKIAlpbnQgcjsKIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqKWhhbmRsZTsKLQlzdHJ1Y3QgcmFzX2loX2lmIHVtY19paF9pbmZvID0gewotCQku
Y2IgPSBhbWRncHVfdW1jX3Byb2Nlc3NfcmFzX2RhdGFfY2IsCi0JfTsKIAogCWlmIChhZGV2LT51
bWMuZnVuY3MgJiYgYWRldi0+dW1jLmZ1bmNzLT5yYXNfbGF0ZV9pbml0KSB7Ci0JCXIgPSBhZGV2
LT51bWMuZnVuY3MtPnJhc19sYXRlX2luaXQoYWRldiwgJnVtY19paF9pbmZvKTsKKwkJciA9IGFk
ZXYtPnVtYy5mdW5jcy0+cmFzX2xhdGVfaW5pdChhZGV2KTsKIAkJaWYgKHIpCiAJCQlyZXR1cm4g
cjsKIAl9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
