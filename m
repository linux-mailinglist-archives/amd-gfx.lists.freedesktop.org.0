Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EF4B73D6
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 09:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E65C06F963;
	Thu, 19 Sep 2019 07:13:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680046.outbound.protection.outlook.com [40.107.68.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354F06F96B
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 07:13:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lLCXvyvVVZFq+14TR6i8IwIlFoB3Wd0n7tk72L8go34MRmiQrsp30s1z6eQO12p+GjvnPQJjAdqDJOA70+QDWHA/YIePakSl2O7OK7AjMdwUXdAz5HmRkVfOXdRNKRjePdauOs1I+opCH/swqkIKoWF6InWZVL5uQx/er5iJ/PPDbkB1fIKTLuoNWkYtIrfSqjzWxm8c3htqR1M/Dkl3lfMCryQ0x33hR2SuxIl1ixypqz4oNpGWgv/BjcyRDCSoKK6F0o0/LJ4OCjLGL7gYbepgUFYEd0cqtEMV7Sc8wZ5H0h7ZPLEtIKGlVcuCR7r8EuUqsExKFKx1FpjwwKsqPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=diSWIeCcFAAm2MUjd/fyG5x2qwEPKQ7hKnXntGcxXk4=;
 b=l3bQXc4GswRYk+gI2KXm6HG0sBtEAcSUP6istOuVf+AG9EiTr1g8Nxw35cr/akQCRS3Zdhkri6e/lbZvUplne+O3/sg/IMuo1ruT6Pb54qfknweLtxHeGeFrSztAI0YhTfvx3DQ+x00lbqJ46Ygy2S/Byuoi/ea9KdWqEzRldJRLkLpi0rIUdcy/wP5hC9SuRL0k7INPl4o7dCOuUjjSbDFP9UayJWus5OH0aPpek77sQk685A/E421nuK5EMfh0zY+lVm0Tm7ZAd9NdjwIHz9OuPzgmxG+q/CoJLQ+2xLFScWNygFI2LTHV+wBMSREGsPUnn5debjLMRD23o74yCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3440.namprd12.prod.outlook.com (20.178.244.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Thu, 19 Sep 2019 07:13:17 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 07:13:17 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: [PATCH 21/21] drm/amdgpu: implement common gmc_ecc_late_init
Thread-Topic: [PATCH 21/21] drm/amdgpu: implement common gmc_ecc_late_init
Thread-Index: AQHVbrm1inEZQaTlv0mbMhTnJQt9Lw==
Date: Thu, 19 Sep 2019 07:13:17 +0000
Message-ID: <20190919071115.16552-22-tao.zhou1@amd.com>
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
x-ms-office365-filtering-correlation-id: fec4fe24-5aab-418c-6983-08d73cd0d7e4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3440; 
x-ms-traffictypediagnostic: MN2PR12MB3440:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3440B7F370B9697EF0B593B3B0890@MN2PR12MB3440.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:513;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(199004)(189003)(25786009)(66066001)(14454004)(256004)(478600001)(6512007)(4326008)(2906002)(66946007)(66446008)(64756008)(316002)(66556008)(66476007)(6436002)(6116002)(110136005)(3846002)(6486002)(99286004)(6636002)(76176011)(2501003)(52116002)(1076003)(36756003)(5660300002)(446003)(2616005)(11346002)(476003)(305945005)(7736002)(26005)(102836004)(486006)(386003)(6506007)(186003)(8676002)(71190400001)(86362001)(71200400001)(8936002)(81156014)(50226002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3440;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5kkhSTXs6IlXWQVRytTgbRRxw3PQwOLmKQgz64xt7tJhVzHkWILjNQjPsaccQpcsT4Sjf93aZv0qvQbRWQXBO7B0pOzuKMYBNCEWWlImuJyIytgLdkp6uQn5RNJXMJ8r0R6T45wpbC93h5mpwO6dQN9jb3MwBU+7pIzxwmhWPlPfpgdu8jejGLRl8jmCy9VfcrbncgmOlpEswEx/rIfcbI4SAqzQdL9BZRvG/tsEi4PoQtq3bz+7OHIqCifFWV2P5T2jWKW6NmVam2Xc/JBS4ohAlAMrQrcn8FKj/AVdCLE/FnX4SHRMpcBohKmzh7uzNpHHDRp0Z2JBCUzOvAhY/t9tOr0sdBDg5T9q/ojpx2xWD7w0ImwJyUTBLAUUyDe5lr+ohl7A3d2ckyZQpdjRM+tvyffDxlgRC2b5vVFFdno=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fec4fe24-5aab-418c-6983-08d73cd0d7e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 07:13:17.2697 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Krhs4ely8ge0rSGUv/0IbniYDFMR9sl+zpHfDQ2T6kQPzEPBgeyR9aU2Oi4xRTSS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3440
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=diSWIeCcFAAm2MUjd/fyG5x2qwEPKQ7hKnXntGcxXk4=;
 b=S275MVVEc4sdoVSxRSN+wI9a0kRLxq1L6dzS8PRRREDlrd9nxJYCyOd1FcAL4geXi2xL1AR+aAH+VnvfUw4QKg93hHSQeEBh40AunamUseN2aDxCy6rp5cRynfIGIG+/2EOD/QBqoMC0qs3cuxgtCjcswAufHwP2AcRtcJ9zhg0=
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

Y29tbW9uIGdtY19lY2NfbGF0ZV9pbml0IGNhbiBiZSBzaGFyZWQgYW1vbmcgYWxsIGdlbmVyYXRp
b25zIG9mIGdtYwoKU2lnbmVkLW9mZi1ieTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuYyB8IDE5ICsrKysrKysr
KysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuaCB8ICAx
ICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgICB8IDIyICstLS0tLS0t
LS0tLS0tLS0tLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMjEgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2dtYy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5jCmluZGV4IDhk
YzUyNTFkMzQ2Zi4uZTQ4NmMwMDA5YTQxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZ21jLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2dtYy5jCkBAIC0zMDYsNiArMzA2LDI1IEBAIGJvb2wgYW1kZ3B1X2dtY19maWx0ZXJfZmF1
bHRzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1aW50NjRfdCBhZGRyLAogCXJldHVybiBm
YWxzZTsKIH0KIAoraW50IGFtZGdwdV9nbWNfZWNjX2xhdGVfaW5pdChzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldikKK3sKKwlpbnQgcjsKKworCWlmIChhZGV2LT51bWMuZnVuY3MgJiYgYWRldi0+
dW1jLmZ1bmNzLT5yYXNfbGF0ZV9pbml0KSB7CisJCXIgPSBhZGV2LT51bWMuZnVuY3MtPnJhc19s
YXRlX2luaXQoYWRldik7CisJCWlmIChyKQorCQkJcmV0dXJuIHI7CisJfQorCisJaWYgKGFkZXYt
Pm1taHViLmZ1bmNzICYmIGFkZXYtPm1taHViLmZ1bmNzLT5yYXNfbGF0ZV9pbml0KSB7CisJCXIg
PSBhZGV2LT5tbWh1Yi5mdW5jcy0+cmFzX2xhdGVfaW5pdChhZGV2KTsKKwkJaWYgKHIpCisJCQly
ZXR1cm4gcjsKKwl9CisKKwlyZXR1cm4gYW1kZ3B1X3hnbWlfcmFzX2xhdGVfaW5pdChhZGV2KTsK
K30KKwogdm9pZCBhbWRncHVfZ21jX3Jhc19maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
KQogewogCWFtZGdwdV91bWNfcmFzX2ZpbmkoYWRldik7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZ21jLmgKaW5kZXggNDFlZGQ4NmVmZTczLi4zNGYxN2VkNzU0MTEgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuaAorKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmgKQEAgLTIzMyw2ICsyMzMsNyBAQCB2b2lk
IGFtZGdwdV9nbWNfYWdwX2xvY2F0aW9uKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQkJ
ICAgICBzdHJ1Y3QgYW1kZ3B1X2dtYyAqbWMpOwogYm9vbCBhbWRncHVfZ21jX2ZpbHRlcl9mYXVs
dHMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQ2NF90IGFkZHIsCiAJCQkgICAgICB1
aW50MTZfdCBwYXNpZCwgdWludDY0X3QgdGltZXN0YW1wKTsKK2ludCBhbWRncHVfZ21jX2VjY19s
YXRlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwogdm9pZCBhbWRncHVfZ21jX3Jh
c19maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKIAogI2VuZGlmCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ21jX3Y5XzAuYwppbmRleCA0NTFiYmI1NzU0NjguLjQ4ZGQ2ZTE0NDNjMSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCkBAIC03MjgsMjYgKzcyOCw2IEBA
IHN0YXRpYyBpbnQgZ21jX3Y5XzBfYWxsb2NhdGVfdm1faW52X2VuZyhzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldikKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGljIGludCBnbWNfdjlfMF9lY2NfbGF0
ZV9pbml0KHZvaWQgKmhhbmRsZSkKLXsKLQlpbnQgcjsKLQlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiA9IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqKWhhbmRsZTsKLQotCWlmIChhZGV2LT51bWMu
ZnVuY3MgJiYgYWRldi0+dW1jLmZ1bmNzLT5yYXNfbGF0ZV9pbml0KSB7Ci0JCXIgPSBhZGV2LT51
bWMuZnVuY3MtPnJhc19sYXRlX2luaXQoYWRldik7Ci0JCWlmIChyKQotCQkJcmV0dXJuIHI7Ci0J
fQotCi0JaWYgKGFkZXYtPm1taHViLmZ1bmNzICYmIGFkZXYtPm1taHViLmZ1bmNzLT5yYXNfbGF0
ZV9pbml0KSB7Ci0JCXIgPSBhZGV2LT5tbWh1Yi5mdW5jcy0+cmFzX2xhdGVfaW5pdChhZGV2KTsK
LQkJaWYgKHIpCi0JCQlyZXR1cm4gcjsKLQl9Ci0KLQlyZXR1cm4gYW1kZ3B1X3hnbWlfcmFzX2xh
dGVfaW5pdChhZGV2KTsKLX0KLQogc3RhdGljIGludCBnbWNfdjlfMF9sYXRlX2luaXQodm9pZCAq
aGFuZGxlKQogewogCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICopaGFuZGxlOwpAQCAtNzg1LDcgKzc2NSw3IEBAIHN0YXRpYyBpbnQgZ21jX3Y5XzBf
bGF0ZV9pbml0KHZvaWQgKmhhbmRsZSkKIAkJfQogCX0KIAotCXIgPSBnbWNfdjlfMF9lY2NfbGF0
ZV9pbml0KGhhbmRsZSk7CisJciA9IGFtZGdwdV9nbWNfZWNjX2xhdGVfaW5pdChhZGV2KTsKIAlp
ZiAocikKIAkJcmV0dXJuIHI7CiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
