Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA55EBB2F2
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 13:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4DE6E891;
	Mon, 23 Sep 2019 11:42:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720085.outbound.protection.outlook.com [40.107.72.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F456E891
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 11:42:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HQrTS9EJbGz6m1fhQFlezvBTRfScwdQg0mDhfJiw+k9w4K3OHcAV4lw2G/wqh4JxD1btGq7W12NERJIterHfhlaWKQb7N7g/KsjCLv1ClgKZaHHDIYNOtLj1K6BAR2UThibzKF+a4qD98+qexoKl/TVAFzx9x2IV6KB6XIibmVifF6ZFrgmptdp5xLjiPBFabL8bqDslEH3BfqWjNiAIkI1mVwmq2I4r+bsn9DD+OFpQPlifb9vT0DHmrgv86Q5485YGXBAQ3XR0rBPdOAF+5Xxz2v2ulA9pqruVE636Ix2b5KO2WLqmcRu8lyzsMLXLy6JupxWr7rr9xGdeivG1vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lpgWXQHNuV2IVKOsWFjYb7BuIOF6QSSVsfmYZY/fVp0=;
 b=KcbwbcdKnLXgkBPZy78y1m2gF8gCeaTV4IN6aqgpPvzVN6hKdkOa9N7c/N8KB3llS/yD9jB09bk4re+P0AZ+tZ+Nq+xNgOyV8atgp4XQWqhUcTep/i7sNL+p0j6/oUsDwQ4jHS5t16Rl4B+5CrS7xY2h/eD84LeejhIeEBwcSViDs4IxXMLXepwv8dK7FjuCgjyE3iY3unVjvwY/zkOSM8X7icHeLBpbVCKw1Pn0C5CuDlNqQvqkfUnuq54e6GAmVTKPseu2B1ntVQfanZ7JsNtgX4VwNY6HxM87frmVsB+eNjwMtbIj30p4Ta4mK5Yf0vzBEoI58pgo/shUwVRNag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB2926.namprd12.prod.outlook.com (20.179.84.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.23; Mon, 23 Sep 2019 11:42:41 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 11:42:41 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: [PATCH 05/22] drm/amdgpu: refine sdma4 ras_data_cb
Thread-Topic: [PATCH 05/22] drm/amdgpu: refine sdma4 ras_data_cb
Thread-Index: AQHVcgQBYBGW5Xs93EmNs0n8r0DV1Q==
Date: Mon, 23 Sep 2019 11:42:40 +0000
Message-ID: <20190923114219.29217-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0040.apcprd03.prod.outlook.com
 (2603:1096:203:2f::28) To MN2PR12MB3054.namprd12.prod.outlook.com
 (2603:10b6:208:d1::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3668500f-4496-415c-aeb4-08d7401b23ee
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB2926; 
x-ms-traffictypediagnostic: MN2PR12MB2926:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB292682A1898EFBCBED7E9FD7B0850@MN2PR12MB2926.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:510;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(136003)(346002)(39860400002)(376002)(199004)(189003)(5660300002)(25786009)(6506007)(4326008)(6636002)(256004)(26005)(8936002)(476003)(2616005)(50226002)(486006)(2906002)(81156014)(81166006)(99286004)(36756003)(186003)(3846002)(6116002)(102836004)(52116002)(6436002)(6486002)(66946007)(66556008)(66446008)(64756008)(8676002)(66476007)(71190400001)(71200400001)(14454004)(7736002)(305945005)(86362001)(386003)(478600001)(110136005)(1076003)(6512007)(2501003)(316002)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2926;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: F1spoev5jPpwyrFpEP5JwWzqXsdcOH8mCzcKW1nns+qsdMf6MaRcGQZKyKbzF9jDTQFWRTnco8dn4zA7tr7VH7p/LTzJdgNdB6RuRkDwp810x4cWqldvTZtUu6UqQ1o9dIvSYRJDlFRQ7y5gkFyxTdzsKRmWDT9AWQOdLcgmfISGKy6T5OZuJQm/EotdSOrpUDRaRGAxtf1hQxNCninOQqjqJ8CPT4fLChrM7j53NG9fXHos3zDn1U/5q2Rg+MiI88heV2cm4nnIVVg52CYpSCYN/ircQr1allS/Pf5JJz/yVIHsf7ssRk2REhzt6eDTkvTH+fDMzopr66DnCFGuma6mJ8ElosHaW61Ii3C/xyrldHRCmi+lpGjrGh6GcGQIkuDToeoZDJ7HfulWTlZmU9aVWDZjkvW64hhJR2CxGyE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3668500f-4496-415c-aeb4-08d7401b23ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 11:42:41.0012 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dTZMvJl/FFQVkqlcrpYyLASRZ68yBrjeQrLKmoEAWqaqmO2We+B4AeBDw0Ec4uwK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2926
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lpgWXQHNuV2IVKOsWFjYb7BuIOF6QSSVsfmYZY/fVp0=;
 b=ZeliOOLsag1p87Yj6ibsdYQab7O5RTrowK9MEM4vmf//GIMLJVPjZIK94UxsGmoikc6ZkJ4MziWzTx7ZlowXEN0eqcYRfvqIHw7M7FO2O4bSmLCxxojM2Ck4HUepg1/UQnJuF8KMcY+vQKjvRkXCjp3ppIyCjB8ihiJaArIZzwE=
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

c2ltcGxpZnkgY29kZSBsb2dpYyBhbmQgcmVmaW5lIHJldHVybiB2YWx1ZQoKdjI6IHJlbW92ZSB1
bnVzZWQgZXJyb3Igc291cmNlIGNvZGUKClNpZ25lZC1vZmYtYnk6IFRhbyBaaG91IDx0YW8uemhv
dTFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYyB8
IDI0ICsrKysrKystLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9u
cygrKSwgMTcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvc2RtYV92NF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAu
YwppbmRleCA2OGE5ZGZlOWQzNzUuLjRkYjRlMzI5ZTc0YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvc2RtYV92NF8wLmMKQEAgLTE5NDIsMjggKzE5NDIsMTggQEAgc3RhdGljIGludCBzZG1h
X3Y0XzBfcHJvY2Vzc19yYXNfZGF0YV9jYihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJ
dm9pZCAqZXJyX2RhdGEsCiAJCXN0cnVjdCBhbWRncHVfaXZfZW50cnkgKmVudHJ5KQogewotCXVp
bnQzMl90IGVycl9zb3VyY2U7CiAJaW50IGluc3RhbmNlOwogCi0JaWYgKCFhbWRncHVfcmFzX2lz
X3N1cHBvcnRlZChhZGV2LCBBTURHUFVfUkFTX0JMT0NLX19HRlgpKSB7Ci0JCWluc3RhbmNlID0g
c2RtYV92NF8wX2lycV9pZF90b19zZXEoZW50cnktPmNsaWVudF9pZCk7Ci0JCWlmIChpbnN0YW5j
ZSA8IDApCi0JCQlyZXR1cm4gMDsKKwlpZiAoYW1kZ3B1X3Jhc19pc19zdXBwb3J0ZWQoYWRldiwg
QU1ER1BVX1JBU19CTE9DS19fR0ZYKSkKKwkJZ290byBvdXQ7CiAKLQkJc3dpdGNoIChlbnRyeS0+
c3JjX2lkKSB7Ci0JCWNhc2UgU0RNQTBfNF8wX19TUkNJRF9fU0RNQV9TUkFNX0VDQzoKLQkJCWVy
cl9zb3VyY2UgPSAwOwotCQkJYnJlYWs7Ci0JCWNhc2UgU0RNQTBfNF8wX19TUkNJRF9fU0RNQV9F
Q0M6Ci0JCQllcnJfc291cmNlID0gMTsKLQkJCWJyZWFrOwotCQlkZWZhdWx0OgotCQkJcmV0dXJu
IDA7Ci0JCX0KKwlpbnN0YW5jZSA9IHNkbWFfdjRfMF9pcnFfaWRfdG9fc2VxKGVudHJ5LT5jbGll
bnRfaWQpOworCWlmIChpbnN0YW5jZSA8IDApCisJCWdvdG8gb3V0OwogCi0JCWFtZGdwdV9zZG1h
X3Byb2Nlc3NfcmFzX2RhdGFfY2IoYWRldiwgZXJyX2RhdGEsIGVudHJ5KTsKLQl9CisJYW1kZ3B1
X3NkbWFfcHJvY2Vzc19yYXNfZGF0YV9jYihhZGV2LCBlcnJfZGF0YSwgZW50cnkpOwogCitvdXQ6
CiAJcmV0dXJuIEFNREdQVV9SQVNfU1VDQ0VTUzsKIH0KIAotLSAKMi4xNy4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
