Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69724AD0E8
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Sep 2019 00:07:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C3388E46;
	Sun,  8 Sep 2019 22:07:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790040.outbound.protection.outlook.com [40.107.79.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF58B88E46
 for <amd-gfx@lists.freedesktop.org>; Sun,  8 Sep 2019 22:07:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cmmA8PCO7GXwmob8A5pS8+u4Z0OjsYmXc+72pkP3w73crgAR96UotAzCJYJgFPd/T8PWPkTgHi6GigVm2NM6LBbAz/Xo7BDlZIlI3e8jFrwIKiwwHSVoV1Exu8RUAZbIJVKwXHZNI0piHoQzUqk21BJJBhWMIiPqzfzGcUdwTSE7BmNo08GogvwQPa3Y39dZHPZ9O0vXMU5vlWEbDdp2+kAeAjeuhgX13uFi5rMTwvAFIJ+DqdhRjZvjyXIwkiyAYyQvrBv6T5Y4s4XDbSgC5fsNBQrrfFM5+WNCrQdaSFpK6Dg+PyvoVeFHYeKh12PcZvQoCQevCatIgBR/4QWFMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYS0d3uogwN73EQatcwTAYLR8Drsu9Bh+W2IEsau6Dg=;
 b=ZEwyJbbdltPyxzgCzCGXyjNOwLenbF68UzlGe51vE1773W1NozJyNI3C47ews5NVFhU3o2FN6luLJ/LsSxUIJglnXUbIyogcJO4ZkTSWlt5FplZbo4lCdz8HITrm1q4oP0dAh6I3nchSjriDekpGicaLpNTnUq7c4Gmofk1/RjVB17jjszQMdsAu4dIsQCPM87l7seOqvpVyfEod4MFNimK/dYZvLqp0+YZNRWKASk+wusvRPZnyUDiph8yMSChwXSYKNXV4P+1q9sp62yNWLe749qwGq4pnYcvRqPMmo4MyYieuiTknL8WhW0cba1N1yeVNQ3X9iisi+TfsqlFCpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1424.namprd12.prod.outlook.com (10.169.206.135) by
 MWHPR12MB1456.namprd12.prod.outlook.com (10.172.55.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Sun, 8 Sep 2019 22:07:16 +0000
Received: from MWHPR12MB1424.namprd12.prod.outlook.com
 ([fe80::51d:602e:5ce9:1ae2]) by MWHPR12MB1424.namprd12.prod.outlook.com
 ([fe80::51d:602e:5ce9:1ae2%10]) with mapi id 15.20.2241.018; Sun, 8 Sep 2019
 22:07:16 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhou1,
 Tao" <Tao.Zhou1@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>, "Li, Dennis"
 <Dennis.Li@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH 1/2] drm/amdgpu: initialize ras structures for xgmi block
Thread-Topic: [PATCH 1/2] drm/amdgpu: initialize ras structures for xgmi block
Thread-Index: AQHVZpHG247Z18idHkKWUie/Nqxq0Q==
Date: Sun, 8 Sep 2019 22:07:15 +0000
Message-ID: <1567980418-32146-1-git-send-email-Hawking.Zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0133.apcprd02.prod.outlook.com
 (2603:1096:202:16::17) To MWHPR12MB1424.namprd12.prod.outlook.com
 (2603:10b6:300:13::7)
x-originating-ip: [180.167.199.189]
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab79dfa8-c8a2-4583-0bda-08d734a8e850
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1456; 
x-ms-traffictypediagnostic: MWHPR12MB1456:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB14560AD9913D7A50CE73730BFCB40@MWHPR12MB1456.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:635;
x-forefront-prvs: 0154C61618
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(366004)(396003)(136003)(199004)(189003)(2616005)(26005)(476003)(2501003)(6116002)(3846002)(6636002)(66066001)(6486002)(102836004)(2906002)(53936002)(64756008)(66556008)(66446008)(66476007)(66946007)(386003)(71190400001)(6506007)(71200400001)(6436002)(486006)(4326008)(99286004)(81166006)(36756003)(50226002)(14454004)(8676002)(81156014)(86362001)(256004)(14444005)(186003)(8936002)(5660300002)(7736002)(6512007)(305945005)(316002)(25786009)(478600001)(52116002)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1456;
 H:MWHPR12MB1424.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ujga60EeB1WAn89S4PLXKlqB6to4eFt4vzM1SEItZcrWvj5FlwbLwPxYi7gwuzvVNehJhvBRH5LCRywlqwe1IUzU8D96prAnOgALySyOQfbHQ4IEKIust18F2w8bbKNVc+dbIF72qXDQXG0wHWWVLixq8xS/KtO8++GF37ek9wHXGz2urG5iUYOU30pbvAJe5/45K+PgJLxO8np6YeO/XA6TIPdmjkq6NM1Z9WR7x/68f9OTx7Bx0N1mH8aP9TABEaSK3B47SE6I2987IGUewEGw6qBWvK1lzMjM6pIH0MlH/lranuZ4NNhq6BlkoGfMQ4Pq9ZIPsZ49NmM4EuaqHuCSCyCbEfA9NLkmzgaP5Wpcpj30HaR11AIMVyvTHJgh3nf5+cXrnzp+tHZvn7sXGzKm5F8mIHs0Gl+otmAhrRg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab79dfa8-c8a2-4583-0bda-08d734a8e850
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2019 22:07:15.6852 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MvyHq/DymCyYGO350Aw/YkCI3wX90nxeuSPXt+4CUGdvPeWaAsvbOEEP8/iWcmDlDPnkJU9i5xLdeUcPBuZzAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1456
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYS0d3uogwN73EQatcwTAYLR8Drsu9Bh+W2IEsau6Dg=;
 b=EfkLviM0pqa7T8yzUJ7w12ikLjfEOkkRqCCvmlx8Kb+EC5gydip2BpM69Fu25kqYVrCzlOJpmq/MAzWmE7XDGDMUWJQZFKuE0kuAFaxIkZwnC98fSEAI5fg/2yDgwIfc4r2A/nZlSEHV50fbYnsCVULtXttKkd9vAyrGPUhrreY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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

aW5pdCByYXMgY29tbW9uIGludGVyZmFjZSBhbmQgZnMgbm9kZSBmb3IgeGdtaSBibG9jawoKU2ln
bmVkLW9mZi1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuaCAgfCAgMSArCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfeGdtaS5jIHwgMzYgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV94Z21pLmggfCAg
MSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jICAgIHwgIDcgKysrKysr
KwogNCBmaWxlcyBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2dtYy5oCmluZGV4IDMzMWNlNTAuLmYwOWJkMzAgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuaAorKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmgKQEAgLTEyMCw2ICsxMjAsNyBAQCBzdHJ1Y3QgYW1k
Z3B1X3hnbWkgewogCS8qIGdwdSBsaXN0IGluIHRoZSBzYW1lIGhpdmUgKi8KIAlzdHJ1Y3QgbGlz
dF9oZWFkIGhlYWQ7CiAJYm9vbCBzdXBwb3J0ZWQ7CisJc3RydWN0IHJhc19jb21tb25faWYgKnJh
c19pZjsKIH07CiAKIHN0cnVjdCBhbWRncHVfZ21jIHsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV94Z21pLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfeGdtaS5jCmluZGV4IDY1YWFlNzUuLjdmNmYyZTkgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV94Z21pLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3hnbWkuYwpAQCAtMjUsNiArMjUsNyBAQAogI2luY2x1ZGUgImFt
ZGdwdS5oIgogI2luY2x1ZGUgImFtZGdwdV94Z21pLmgiCiAjaW5jbHVkZSAiYW1kZ3B1X3NtdS5o
IgorI2luY2x1ZGUgImFtZGdwdV9yYXMuaCIKICNpbmNsdWRlICJkZi9kZl8zXzZfb2Zmc2V0Lmgi
CiAKIHN0YXRpYyBERUZJTkVfTVVURVgoeGdtaV9tdXRleCk7CkBAIC00MzcsMyArNDM4LDM4IEBA
IHZvaWQgYW1kZ3B1X3hnbWlfcmVtb3ZlX2RldmljZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
dikKIAkJbXV0ZXhfdW5sb2NrKCZoaXZlLT5oaXZlX2xvY2spOwogCX0KIH0KKworaW50IGFtZGdw
dV94Z21pX3Jhc19sYXRlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCit7CisJaW50
IHI7CisJc3RydWN0IHJhc19paF9pZiBpaF9pbmZvID0geworCQkuY2IgPSBOVUxMLAorCX07CisJ
c3RydWN0IHJhc19mc19pZiBmc19pbmZvID0geworCQkuc3lzZnNfbmFtZSA9ICJ4Z21pX3dhZmxf
ZXJyX2NvdW50IiwKKwkJLmRlYnVnZnNfbmFtZSA9ICJ4Z21pX3dhZmxfZXJyX2luamVjdCIsCisJ
fTsKKworCWlmICghYWRldi0+Z21jLnhnbWkuc3VwcG9ydGVkIHx8CisJICAgIGFkZXYtPmdtYy54
Z21pLm51bV9waHlzaWNhbF9ub2RlcyA9PSAwKQorCQlyZXR1cm4gMDsKKworCWlmICghYWRldi0+
Z21jLnhnbWkucmFzX2lmKSB7CisJCWFkZXYtPmdtYy54Z21pLnJhc19pZiA9IGttYWxsb2Moc2l6
ZW9mKHN0cnVjdCByYXNfY29tbW9uX2lmKSwgR0ZQX0tFUk5FTCk7CisJCWlmICghYWRldi0+Z21j
LnhnbWkucmFzX2lmKQorCQkJcmV0dXJuIC1FTk9NRU07CisJCWFkZXYtPmdtYy54Z21pLnJhc19p
Zi0+YmxvY2sgPSBBTURHUFVfUkFTX0JMT0NLX19YR01JX1dBRkw7CisJCWFkZXYtPmdtYy54Z21p
LnJhc19pZi0+dHlwZSA9IEFNREdQVV9SQVNfRVJST1JfX01VTFRJX1VOQ09SUkVDVEFCTEU7CisJ
CWFkZXYtPmdtYy54Z21pLnJhc19pZi0+c3ViX2Jsb2NrX2luZGV4ID0gMDsKKwkJc3RyY3B5KGFk
ZXYtPmdtYy54Z21pLnJhc19pZi0+bmFtZSwgInhnbWlfd2FmbCIpOworCX0KKwlpaF9pbmZvLmhl
YWQgPSBmc19pbmZvLmhlYWQgPSAqYWRldi0+Z21jLnhnbWkucmFzX2lmOworCXIgPSBhbWRncHVf
cmFzX2xhdGVfaW5pdChhZGV2LCBhZGV2LT5nbWMueGdtaS5yYXNfaWYsCisJCQkJICZmc19pbmZv
LCAmaWhfaW5mbyk7CisJaWYgKHIgfHwgIWFtZGdwdV9yYXNfaXNfc3VwcG9ydGVkKGFkZXYsIGFk
ZXYtPmdtYy54Z21pLnJhc19pZi0+YmxvY2spKSB7CisJCWtmcmVlKGFkZXYtPmdtYy54Z21pLnJh
c19pZik7CisJCWFkZXYtPmdtYy54Z21pLnJhc19pZiA9IE5VTEw7CisJfQorCisJcmV0dXJuIHI7
Cit9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfeGdtaS5o
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3hnbWkuaAppbmRleCBmYmNlZTMx
Li45MDIzNzg5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
eGdtaS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV94Z21pLmgKQEAg
LTQyLDYgKzQyLDcgQEAgdm9pZCBhbWRncHVfeGdtaV9yZW1vdmVfZGV2aWNlKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2KTsKIGludCBhbWRncHVfeGdtaV9zZXRfcHN0YXRlKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LCBpbnQgcHN0YXRlKTsKIGludCBhbWRncHVfeGdtaV9nZXRfaG9wc19j
b3VudChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KnBlZXJfYWRldik7CitpbnQgYW1kZ3B1X3hnbWlfcmFzX2xhdGVfaW5pdChzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldik7CiAKIHN0YXRpYyBpbmxpbmUgYm9vbCBhbWRncHVfeGdtaV9zYW1lX2hp
dmUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCXN0cnVjdCBhbWRncHVfZGV2aWNlICpi
b19hZGV2KQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKaW5kZXggYmViNmM4NC4u
MDVhOWE4YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCkBAIC01MSw2ICs1
MSw3IEBACiAjaW5jbHVkZSAiaXZzcmNpZC92bWMvaXJxc3Jjc192bWNfMV8wLmgiCiAKICNpbmNs
dWRlICJhbWRncHVfcmFzLmgiCisjaW5jbHVkZSAiYW1kZ3B1X3hnbWkuaCIKIAogLyogYWRkIHRo
ZXNlIGhlcmUgc2luY2Ugd2UgYWxyZWFkeSBpbmNsdWRlIGRjZTEyIGhlYWRlcnMgYW5kIHRoZXNl
IGFyZSBmb3IgRENOICovCiAjZGVmaW5lIG1tSFVCUDBfRENTVVJGX1BSSV9WSUVXUE9SVF9ESU1F
TlNJT04gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgMHgwNTVkCkBAIC04MDIsNiArODAzLDEyIEBAIHN0YXRpYyBpbnQgZ21jX3Y5XzBfZWNj
X2xhdGVfaW5pdCh2b2lkICpoYW5kbGUpCiAJCWlmIChyKQogCQkJcmV0dXJuIHI7CiAJfQorCisJ
aWYgKGFkZXYtPmdtYy54Z21pLm51bV9waHlzaWNhbF9ub2RlcyA+IDEpIHsKKwkJciA9IGFtZGdw
dV94Z21pX3Jhc19sYXRlX2luaXQoYWRldik7CisJCWlmIChyKQorCQkJcmV0dXJuIHI7CisJfQog
CXJldHVybiAwOwogfQogCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
