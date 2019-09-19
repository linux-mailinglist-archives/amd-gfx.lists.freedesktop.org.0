Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37741B73C9
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 09:12:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C470F6F922;
	Thu, 19 Sep 2019 07:12:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700067.outbound.protection.outlook.com [40.107.70.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 675706F922
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 07:12:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BvnxEcvoOUL1xBBSeghgGHy4C9VB0BRkQPy6Zb8YApqyxx2z/BHYzlI5JQxA73fePSzttcZJhftyABo2FQQ4+hBAEXiY0NOvfZb98qAiYKamlw1CK1TIKw8XJRSuMZsRB+CgiEivGHw1Ed0wuZW7EYQzq+uYRwylYPkix3c/qiAekat880rBViDl0tI6/sHRtGu1EIMeSE1WyC/Oeb75q3zsOZAA2iBfrVnHQu2GUPSv6sMNj1jACPdLfr7LZKn+LXHhd1mcmyiyfSpo1tQb2maG0OJqJFH17MzHHT/914Mn6DRMugtm4UoAZJlYVMXfrwo6qbm4hNW4OFHjbMTbYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gVHRBSAsT6qxEIWK49Rvha+SzN4Th6poL7G88bP3Cok=;
 b=lGJCB8JVHY9N9DvTY4hEoQh6wkyOkOVgboiwi2pwZ3FEVmE01JvpGfkQmb861A/i6MVEVEpS1GTLHAaVFaiLqq+BQLaZxaRK2uXoNCe69wLXdLgYY3yvLsqMGRQxEK/NHaLLmlmqopggSSxz6572oGwl4no9gNqkbNnw/u5bvTnMZ7R8RV/ho5mDFEPKJDsLEbpGI+ygkIq9DEkw1XE0ATbUe8SMLzwpEDZz8gv7Uviny9jBKHwOBi/IKA6UkYOae3UjzTBXqtR5HP7kqlh7y7PY/wpa4u+Gmu0Y5tALOx7TKxFgezYqfbjdSxRBm5cUBFOSwzMSQx53Nuuo4ewchQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB2894.namprd12.prod.outlook.com (20.179.84.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Thu, 19 Sep 2019 07:12:47 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 07:12:47 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: [PATCH 08/21] drm/amdgpu: replace mmhub_funcs with mmhub.funcs
Thread-Topic: [PATCH 08/21] drm/amdgpu: replace mmhub_funcs with mmhub.funcs
Thread-Index: AQHVbrmjdnZG6iW+HECE839l/5dm7g==
Date: Thu, 19 Sep 2019 07:12:46 +0000
Message-ID: <20190919071115.16552-9-tao.zhou1@amd.com>
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
x-ms-office365-filtering-correlation-id: 1aab284a-057b-446f-04e5-08d73cd0c5d7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB2894; 
x-ms-traffictypediagnostic: MN2PR12MB2894:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2894434A77498EE0674B2EACB0890@MN2PR12MB2894.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(199004)(189003)(186003)(6506007)(102836004)(6512007)(316002)(8676002)(81156014)(64756008)(446003)(2501003)(52116002)(11346002)(476003)(2616005)(66446008)(86362001)(8936002)(5660300002)(66946007)(66476007)(81166006)(66556008)(50226002)(3846002)(2906002)(486006)(76176011)(99286004)(110136005)(6116002)(25786009)(7736002)(256004)(1076003)(66066001)(26005)(14454004)(386003)(6436002)(6486002)(4326008)(478600001)(71190400001)(71200400001)(6636002)(305945005)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2894;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HLdpvxANYpFw8lw3kKjeT+EJM0uk0hgESPK4TGHGVQPNM4UXFquxJC0z7RdRSbTJHAPPkMamtdDx9gLu1arSyuFOw9HJC0rsLMnaI0wTeo8pzmjCNaTBnABGMppYYTO0YqyWH3LZG3820Bc5qyNUt2JcyLN9PtsexHG4TTi4CdZAzC5JLQWvALcZ/9Yy6fwbVfwb6AByRLuTfGgoiBdmJMoeDZhj4/1M1+NIWRj+i9atBF4h7sojXU8YwSmw38P1hDKUv6qZLfoRfClO+0UN6BKv50Y4Ab58wbfDhMobeuhLcT4LMLZESmTILa47v8isTlAp05u4wJ5tmlXusRa6vO5kZl/Wpt6EUo8EHPs4eY9PnbCf+8cTnzCOUJz/rN+2n1vTRjKtZrfG1my+Dee+CjvBO9S8jHf6pAhuVDH6UnY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aab284a-057b-446f-04e5-08d73cd0c5d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 07:12:46.9809 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: knHKdycYM7ZGsUtqp8czOelcKFzSgb8GgJog086BkBso9CBX3x6khQvZETWFraOn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2894
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gVHRBSAsT6qxEIWK49Rvha+SzN4Th6poL7G88bP3Cok=;
 b=EO18oP4PRe/fsHfymxvVpykKoPXP7N3CqmVDQTbuOUHw7QtQn4Db0O2+7AT+ueNwmzTtHxjCbneCUlddkCIOzkHtL3HJ3fkFrtUKgPZsdyVoIFNv0dfQS68AAYXKjN1P0R4WS6F7a8W0927k4m/iOXLSbgnODVEZ+ixVuPC5lIE=
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

cmVtb3ZlIG1taHViX2Z1bmNzIGluIGFkZXYKClNpZ25lZC1vZmYtYnk6IFRhbyBaaG91IDx0YW8u
emhvdTFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCAg
ICAgfCAxIC0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyB8IDQgKyst
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyAgIHwgNiArKystLS0KIDMg
ZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1LmgKaW5kZXggOTU5NGVhZWJjZmQxLi40ZTFhYTcxNTJmYjcgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCkBAIC05MzQsNyArOTM0LDYgQEAgc3RydWN0
IGFtZGdwdV9kZXZpY2UgewogCXVpbnQzMl90IAkJKnJlZ19vZmZzZXRbTUFYX0hXSVBdW0hXSVBf
TUFYX0lOU1RBTkNFXTsKIAogCWNvbnN0IHN0cnVjdCBhbWRncHVfZGZfZnVuY3MJKmRmX2Z1bmNz
OwotCWNvbnN0IHN0cnVjdCBhbWRncHVfbW1odWJfZnVuY3MJKm1taHViX2Z1bmNzOwogCiAJLyog
ZGVsYXllZCB3b3JrX2Z1bmMgZm9yIGRlZmVycmluZyBjbG9ja2dhdGluZyBkdXJpbmcgcmVzdW1l
ICovCiAJc3RydWN0IGRlbGF5ZWRfd29yayAgICAgZGVsYXllZF9pbml0X3dvcms7CmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKaW5kZXggZjAwZTA5YzlhODhhLi5mNzJjOWYw
MTFmZmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKQEAgLTY1Myw4
ICs2NTMsOCBAQCBpbnQgYW1kZ3B1X3Jhc19lcnJvcl9xdWVyeShzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwKIAkJCWFkZXYtPmdmeC5mdW5jcy0+cXVlcnlfcmFzX2Vycm9yX2NvdW50KGFkZXYs
ICZlcnJfZGF0YSk7CiAJCWJyZWFrOwogCWNhc2UgQU1ER1BVX1JBU19CTE9DS19fTU1IVUI6Ci0J
CWlmIChhZGV2LT5tbWh1Yl9mdW5jcy0+cXVlcnlfcmFzX2Vycm9yX2NvdW50KQotCQkJYWRldi0+
bW1odWJfZnVuY3MtPnF1ZXJ5X3Jhc19lcnJvcl9jb3VudChhZGV2LCAmZXJyX2RhdGEpOworCQlp
ZiAoYWRldi0+bW1odWIuZnVuY3MtPnF1ZXJ5X3Jhc19lcnJvcl9jb3VudCkKKwkJCWFkZXYtPm1t
aHViLmZ1bmNzLT5xdWVyeV9yYXNfZXJyb3JfY291bnQoYWRldiwgJmVycl9kYXRhKTsKIAkJYnJl
YWs7CiAJY2FzZSBBTURHUFVfUkFTX0JMT0NLX19QQ0lFX0JJRjoKIAkJaWYgKGFkZXYtPm5iaW8u
ZnVuY3MtPnF1ZXJ5X3Jhc19lcnJvcl9jb3VudCkKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNf
djlfMC5jCmluZGV4IGRlNGYyMDAyOGFmYi4uM2RjNGQxMzM2OTY0IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dtY192OV8wLmMKQEAgLTY0Nyw3ICs2NDcsNyBAQCBzdGF0aWMgdm9pZCBnbWNf
djlfMF9zZXRfbW1odWJfZnVuY3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7CiAJc3dp
dGNoIChhZGV2LT5hc2ljX3R5cGUpIHsKIAljYXNlIENISVBfVkVHQTIwOgotCQlhZGV2LT5tbWh1
Yl9mdW5jcyA9ICZtbWh1Yl92MV8wX2Z1bmNzOworCQlhZGV2LT5tbWh1Yi5mdW5jcyA9ICZtbWh1
Yl92MV8wX2Z1bmNzOwogCQlicmVhazsKIAlkZWZhdWx0OgogCQlicmVhazsKQEAgLTc0Miw4ICs3
NDIsOCBAQCBzdGF0aWMgaW50IGdtY192OV8wX2VjY19sYXRlX2luaXQodm9pZCAqaGFuZGxlKQog
CQkJcmV0dXJuIHI7CiAJfQogCi0JaWYgKGFkZXYtPm1taHViX2Z1bmNzICYmIGFkZXYtPm1taHVi
X2Z1bmNzLT5yYXNfbGF0ZV9pbml0KSB7Ci0JCXIgPSBhZGV2LT5tbWh1Yl9mdW5jcy0+cmFzX2xh
dGVfaW5pdChhZGV2KTsKKwlpZiAoYWRldi0+bW1odWIuZnVuY3MgJiYgYWRldi0+bW1odWIuZnVu
Y3MtPnJhc19sYXRlX2luaXQpIHsKKwkJciA9IGFkZXYtPm1taHViLmZ1bmNzLT5yYXNfbGF0ZV9p
bml0KGFkZXYpOwogCQlpZiAocikKIAkJCXJldHVybiByOwogCX0KLS0gCjIuMTcuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
