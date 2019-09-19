Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 273DAB73C5
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 09:12:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC2226F8CA;
	Thu, 19 Sep 2019 07:12:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740089.outbound.protection.outlook.com [40.107.74.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D5186F8D1
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 07:12:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L4ctnBVCtA2Sd7/lsMt4NYQmhF6t+EqlbzglpDUj5JhTeYqRAIMfsNucIrH9lJVWj74DDNOJ1qTBqZo8AZLust1MKjwIVi5meQD3OvXAAQy1AAuxbfOyXOHnrwgaFm3s2zrvUAgIFZi3/WmiliNqFhxoMEcpZOrUXIH/GqT6DV0odRNJ/6XeKLBrHZ+Do3lC+XJi2gkVrOAupx5zzON9IPC+7EE+aqGDiDoS9DkqMxIE7t3MYWj72v2Uf43qtnm7HbA50DcnUX5ldRwXU4jZ1gUNRUMuQmGHJ14wUCuzV/UVCV+pIzztjhzcsz0KaqKpSGXrjz2LwWgeTPg8dfjsbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/phLlvmYbn+J/sVhlv+UyLq5UvHNJaTvxaOX5cJXuo=;
 b=D3CsEWkrGJJvy6hKhkR3izeRmXGNAbrtpDkCieCRsgXkzdhFLeQCqrT/dcYJYL+X7JE++V8D2ZKV+PLA4uXaFZSiDmSGDooeOYxKB3uGSjHxNiaUb14ALKYSWQgnA0m1c7fAbXn7dzgrKfm6xxKJY8lN60ycxrsHlxRtu5YhrruNklhAj1hPtEwq3qiNnP2rgNLde+3hyJQ9ZB+eWoq77QlYbvOZqtSUSrxxbHWTSAljENuo37WKw+vMGQAg2lSpNz8elicmoYTfScAXMTfkkq4D4jGSmLFyB05dmYQUCgE8MpvSf+6FISGV0zeQJoP0C4nbjIkCdU3CBydC+H7tCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3440.namprd12.prod.outlook.com (20.178.244.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Thu, 19 Sep 2019 07:12:37 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 07:12:37 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: [PATCH 04/21] drm/amdgpu: move sdma ecc functions to generic sdma file
Thread-Topic: [PATCH 04/21] drm/amdgpu: move sdma ecc functions to generic
 sdma file
Thread-Index: AQHVbrmdXaZwnm9e/kW9RGE3RaN4jA==
Date: Thu, 19 Sep 2019 07:12:37 +0000
Message-ID: <20190919071115.16552-5-tao.zhou1@amd.com>
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
x-ms-office365-filtering-correlation-id: d9bc2d43-38c0-42c4-2f9f-08d73cd0c002
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3440; 
x-ms-traffictypediagnostic: MN2PR12MB3440:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB344008A33C3B9BB2B80DB573B0890@MN2PR12MB3440.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(199004)(189003)(25786009)(66066001)(14454004)(256004)(478600001)(6512007)(4326008)(2906002)(66946007)(66446008)(64756008)(316002)(66556008)(66476007)(6436002)(6116002)(110136005)(3846002)(6486002)(99286004)(6636002)(76176011)(2501003)(52116002)(1076003)(36756003)(5660300002)(446003)(2616005)(11346002)(476003)(305945005)(7736002)(26005)(102836004)(486006)(386003)(6506007)(186003)(8676002)(71190400001)(86362001)(71200400001)(8936002)(81156014)(50226002)(81166006)(41533002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3440;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: h8f/K0RrwhLmxdyDKgC3Dw5dDxmaVvT9s3ZTE2fxt2mKaraXAmlOandyjW4CTOMb84hu63gipSsZkKrUqOb0vb8gVKUq5lWOKUIRmLBTCDYB2PoNcW5qWuMc0YHBusuJo3bVyJD77O7OW+ML3jaVIFYZkPG4OqTgNTaWv7aKXhNg+uwUI/a3N5TwBeIlfFqJLRFmyM9qSiOw9oqRdq9Idu+PG4R6FRYG8hgXW+mAe9zFYXdy2Ze94EAVz7c9qk0gwDUcPu5XyP/7LjHhNB5V64uD91/mKMKR/aSCRSK4LE2apCH0kwm63k+ShRZhZ91QD1EPKAd0DbZWRfhkz2a9kYIOnbutcN4r3aM3vfhVkwah4WK6HH+AB7i7/YNb5YImZTkqDt9cO+64Zeu0kt+ZzDHHWFyN8534WzaLVi2one0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9bc2d43-38c0-42c4-2f9f-08d73cd0c002
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 07:12:37.3704 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lRFkv2dB/CGO8m9eAzb2DgUIXfTMMZ7rHQXLQZjS5eMUJHFY/Q7Zqz6A0nVrv/+w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3440
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/phLlvmYbn+J/sVhlv+UyLq5UvHNJaTvxaOX5cJXuo=;
 b=keQtRUzN5VafJK5uswQXeYQuvwvhtkNDuwWxQdfk0jQG6u2e3QJ5HsuYXHnneQGSNRtrbTQJOMhrFZ7boZyV5LBQKSpdd0x2ZqCvleC+A2vSWlo5bijuuj2g/mt6QuxaOW3v4oQQCRvMWI+uhwl/2H7fQRVSlGaLOLATUwe9yKU=
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

c2RtYSByYXMgZWNjIGZ1bmN0aW9ucyBjYW4gYmUgcmV1c2VkIGFtb25nIGFsbCBzZG1hIGdlbmVy
YXRpb25zCgpTaWduZWQtb2ZmLWJ5OiBUYW8gWmhvdSA8dGFvLnpob3UxQGFtZC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3NkbWEuYyB8IDI4ICsrKysrKysrKysr
KysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3NkbWEuaCB8
ICA2ICsrKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYyAgIHwgMjQg
KystLS0tLS0tLS0tLS0tLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKSwg
MjIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3NkbWEuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9zZG1hLmMK
aW5kZXggYTI1MzAxYjc1ZWY3Li5iMjk0MTU3YzFkZWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9zZG1hLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3NkbWEuYwpAQCAtMTM1LDMgKzEzNSwzMSBAQCBpbnQgYW1kZ3B1X3NkbWFf
cmFzX2xhdGVfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAlhZGV2LT5zZG1hLnJh
c19pZiA9IE5VTEw7CiAJcmV0dXJuIHI7CiB9CisKK2ludCBhbWRncHVfc2RtYV9wcm9jZXNzX3Jh
c19kYXRhX2NiKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAorCQl2b2lkICplcnJfZGF0YSwK
KwkJc3RydWN0IGFtZGdwdV9pdl9lbnRyeSAqZW50cnkpCit7CisJa2dkMmtmZF9zZXRfc3JhbV9l
Y2NfZmxhZyhhZGV2LT5rZmQuZGV2KTsKKwlhbWRncHVfcmFzX3Jlc2V0X2dwdShhZGV2LCAwKTsK
KworCXJldHVybiBBTURHUFVfUkFTX1NVQ0NFU1M7Cit9CisKK2ludCBhbWRncHVfc2RtYV9wcm9j
ZXNzX2VjY19pcnEoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCisJCQkJICAgICAgc3RydWN0
IGFtZGdwdV9pcnFfc3JjICpzb3VyY2UsCisJCQkJICAgICAgc3RydWN0IGFtZGdwdV9pdl9lbnRy
eSAqZW50cnkpCit7CisJc3RydWN0IHJhc19jb21tb25faWYgKnJhc19pZiA9IGFkZXYtPnNkbWEu
cmFzX2lmOworCXN0cnVjdCByYXNfZGlzcGF0Y2hfaWYgaWhfZGF0YSA9IHsKKwkJLmVudHJ5ID0g
ZW50cnksCisJfTsKKworCWlmICghcmFzX2lmKQorCQlyZXR1cm4gMDsKKworCWloX2RhdGEuaGVh
ZCA9ICpyYXNfaWY7CisKKwlhbWRncHVfcmFzX2ludGVycnVwdF9kaXNwYXRjaChhZGV2LCAmaWhf
ZGF0YSk7CisJcmV0dXJuIDA7Cit9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfc2RtYS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Nk
bWEuaAppbmRleCA3OWRjYjkwN2QwMGQuLjk1ZTAxZDUyMjUzNyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3NkbWEuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfc2RtYS5oCkBAIC0xMDYsNCArMTA2LDEwIEBAIGludCBhbWRncHVf
c2RtYV9nZXRfaW5kZXhfZnJvbV9yaW5nKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgdWludDMy
X3QgKmluZGV4KTsKIHVpbnQ2NF90IGFtZGdwdV9zZG1hX2dldF9jc2FfbWNfYWRkcihzdHJ1Y3Qg
YW1kZ3B1X3JpbmcgKnJpbmcsIHVuc2lnbmVkIHZtaWQpOwogaW50IGFtZGdwdV9zZG1hX3Jhc19s
YXRlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCQkgICAgICB2b2lkICpyYXNf
aWhfaW5mbyk7CitpbnQgYW1kZ3B1X3NkbWFfcHJvY2Vzc19yYXNfZGF0YV9jYihzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwKKwkJdm9pZCAqZXJyX2RhdGEsCisJCXN0cnVjdCBhbWRncHVfaXZf
ZW50cnkgKmVudHJ5KTsKK2ludCBhbWRncHVfc2RtYV9wcm9jZXNzX2VjY19pcnEoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYsCisJCQkJICAgICAgc3RydWN0IGFtZGdwdV9pcnFfc3JjICpzb3Vy
Y2UsCisJCQkJICAgICAgc3RydWN0IGFtZGdwdV9pdl9lbnRyeSAqZW50cnkpOwogI2VuZGlmCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jCmluZGV4IDM1ZjgxYjUyZjA4OC4uYThl
NGI3ZDg4MGZlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0
XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYwpAQCAtMTk1
OCwzMiArMTk1OCwxMiBAQCBzdGF0aWMgaW50IHNkbWFfdjRfMF9wcm9jZXNzX3Jhc19kYXRhX2Ni
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQkJcmV0dXJuIDA7CiAJCX0KIAotCQlrZ2Qy
a2ZkX3NldF9zcmFtX2VjY19mbGFnKGFkZXYtPmtmZC5kZXYpOwotCi0JCWFtZGdwdV9yYXNfcmVz
ZXRfZ3B1KGFkZXYsIDApOworCQlhbWRncHVfc2RtYV9wcm9jZXNzX3Jhc19kYXRhX2NiKGFkZXYs
IGVycl9kYXRhLCBlbnRyeSk7CiAJfQogCiAJcmV0dXJuIEFNREdQVV9SQVNfU1VDQ0VTUzsKIH0K
IAotc3RhdGljIGludCBzZG1hX3Y0XzBfcHJvY2Vzc19lY2NfaXJxKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2LAotCQkJCSAgICAgIHN0cnVjdCBhbWRncHVfaXJxX3NyYyAqc291cmNlLAotCQkJ
CSAgICAgIHN0cnVjdCBhbWRncHVfaXZfZW50cnkgKmVudHJ5KQotewotCXN0cnVjdCByYXNfY29t
bW9uX2lmICpyYXNfaWYgPSBhZGV2LT5zZG1hLnJhc19pZjsKLQlzdHJ1Y3QgcmFzX2Rpc3BhdGNo
X2lmIGloX2RhdGEgPSB7Ci0JCS5lbnRyeSA9IGVudHJ5LAotCX07Ci0KLQlpZiAoIXJhc19pZikK
LQkJcmV0dXJuIDA7Ci0KLQlpaF9kYXRhLmhlYWQgPSAqcmFzX2lmOwotCi0JYW1kZ3B1X3Jhc19p
bnRlcnJ1cHRfZGlzcGF0Y2goYWRldiwgJmloX2RhdGEpOwotCXJldHVybiAwOwotfQotCiBzdGF0
aWMgaW50IHNkbWFfdjRfMF9wcm9jZXNzX2lsbGVnYWxfaW5zdF9pcnEoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsCiAJCQkJCSAgICAgIHN0cnVjdCBhbWRncHVfaXJxX3NyYyAqc291cmNlLAog
CQkJCQkgICAgICBzdHJ1Y3QgYW1kZ3B1X2l2X2VudHJ5ICplbnRyeSkKQEAgLTIzMzEsNyArMjMx
MSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X2lycV9zcmNfZnVuY3Mgc2RtYV92NF8w
X2lsbGVnYWxfaW5zdF9pcnFfZnVuY3MgPSB7CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1
X2lycV9zcmNfZnVuY3Mgc2RtYV92NF8wX2VjY19pcnFfZnVuY3MgPSB7CiAJLnNldCA9IHNkbWFf
djRfMF9zZXRfZWNjX2lycV9zdGF0ZSwKLQkucHJvY2VzcyA9IHNkbWFfdjRfMF9wcm9jZXNzX2Vj
Y19pcnEsCisJLnByb2Nlc3MgPSBhbWRncHVfc2RtYV9wcm9jZXNzX2VjY19pcnEsCiB9OwogCiAK
LS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
