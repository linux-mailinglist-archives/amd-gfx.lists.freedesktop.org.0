Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC73EB73CB
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 09:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D2A56F92E;
	Thu, 19 Sep 2019 07:12:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700044.outbound.protection.outlook.com [40.107.70.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573F46F92E
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 07:12:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FcCZqdTtC+DuUeD1o9wv00QCvjlWMhqVHg6Il0GnsFMy+3dtmDl1xKdUFwRan2q8h3S9Kog4+BQ4jusyxh6K85JNKiqCDhNBoqxOQZzvvLvET/3q0qM4Jk9FJWmhqjQk6+KLAKBQiZE0267EJtfII8M/nW0PLTjJkUzN9W7RW++YBaBxC23eRSzh1DggRJ3NvF98feNJredKMTtmXZvmjC7IHwAsv702siTXbghMTryTWoa18kwmwmai+AlEGchb1JDvSg4SR+B3f8VP4/dWeHrZRnSQTHbyriqWxPlKz81IX7svwRetMJYPi6edGEfpco8yopqplS/+56L2qEyNsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JvKPi4fsJ/deWUatWKdCS/QynvfeQMAJ6MeqA7i0nSI=;
 b=mBSFvfLzAqNOA8tQC9LqDA3EXCmh+49yguMt6MT7KJfN9mt985gVC47tu95UBAr/VRwYJVh6ldYCje7z+1FRxmcazMo+FSKOg7CfS+IRfnTInoWcc7NtnuH8k9qMXfDzMJbmyhpbg5UOij8iBKGMQq7HhW/TbPCbGxZeoPo1UXbeJsuM3L0Flwm7x/BsrK5omAtuUUKFWG94QXaohar0TPM1ExKIXBwYlRjsNCbojsXzEL2L8A2Mk5FaCmBjt0N2KgmhtMR8UDauiWJZOVDH8bI+uFT05ApVaXn3fTs2UUyJse21e2j2FhfIZXh5eVR1t232Vtq69cM0zwzt+ow9Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB2894.namprd12.prod.outlook.com (20.179.84.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Thu, 19 Sep 2019 07:12:51 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 07:12:51 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: [PATCH 10/21] drm/amdgpu: add common gmc_ras_fini function
Thread-Topic: [PATCH 10/21] drm/amdgpu: add common gmc_ras_fini function
Thread-Index: AQHVbrmmsqBJkqf3FEy1kePjXg8GBQ==
Date: Thu, 19 Sep 2019 07:12:51 +0000
Message-ID: <20190919071115.16552-11-tao.zhou1@amd.com>
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
x-ms-office365-filtering-correlation-id: 913a5a78-c1fc-4e09-03a5-08d73cd0c89a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB2894; 
x-ms-traffictypediagnostic: MN2PR12MB2894:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB28949B72ADB686C70ABC9265B0890@MN2PR12MB2894.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:108;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(199004)(189003)(186003)(6506007)(102836004)(6512007)(316002)(8676002)(81156014)(64756008)(446003)(2501003)(52116002)(11346002)(476003)(2616005)(66446008)(86362001)(8936002)(5660300002)(66946007)(66476007)(81166006)(66556008)(50226002)(3846002)(2906002)(486006)(76176011)(99286004)(110136005)(6116002)(25786009)(7736002)(256004)(1076003)(66066001)(26005)(14454004)(386003)(6436002)(6486002)(4326008)(478600001)(71190400001)(71200400001)(6636002)(305945005)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2894;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PdizClybP1XyxWWcStFDAmf1zXB5QWUnMZXfZPm6InAH8XCxKesMfkRYad1kCHInsOQgUBdmmqF4hgXFaT09Vy8GR5alfWPtVP1zfI7F3TqvjmQpiN0WnVJ2w8T4FtXL3DbIX1JnKyAgbWOdDwb0SjZJ5i5NBl/KybDmjqfFnGrfzwqi4rzBrYV9/CF2Y83FYiZ8PdAx63qQmENpAVn9abePCP1Qwc336k2v44fZXiS3vdvrQVffT/Sej2jj6ImTql/3emhXNv2m3b1AP7mARzMN02RFuUgJ9LsNJEW+L6/knOequqBrTivAZ7oC2qh7y7TXYiZyOkgYi5ZJKxrt1OT1rJgI7I0QT1d6LJLqJQuHqcGD0pLVf+WsDpUmhDbfxAD3Plwv97TwD3iDwpo/RahHgGlJmaKlt2KxapXW+1Q=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 913a5a78-c1fc-4e09-03a5-08d73cd0c89a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 07:12:51.4993 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4PU965Ejos57PNdtKTjHuuTkf1Ji/P0Lrzz9H7xPlw+AMbBIUvLp1dN36xIiExuE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2894
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JvKPi4fsJ/deWUatWKdCS/QynvfeQMAJ6MeqA7i0nSI=;
 b=Nb1jcjUw1Hlr1rBvBNLkFKks/jsUapS/gwYtpmUHL+diCWbZYHIi421MaepZ5sFhpxs8vp5yDLI+Jg1pz8rStYDbQWkMQLRTxdjltXQ3DwYMc4TexVR1nDO1Gyxxpwb4ab0TSqUaVkQ+yUNqGzNVL5BRlmBD2ILttptFPKfUNKQ=
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

Z21jX3Jhc19maW5pIGNhbiBiZSBzaGFyZWQgYW1vbmcgYWxsIGdlbmVyYXRpb25zIG9mIGdtYwoK
U2lnbmVkLW9mZi1ieTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuYyB8IDI2ICsrKysrKysrKysrKysrKysrKysr
KysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmggfCAgMSArCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jICAgfCAyOCArLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuYwppbmRleCBkYzA0NGVl
YzE4OGUuLjU4YTk1YTY3MzM2YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2dtYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9n
bWMuYwpAQCAtMzA0LDMgKzMwNCwyOSBAQCBib29sIGFtZGdwdV9nbWNfZmlsdGVyX2ZhdWx0cyhz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDY0X3QgYWRkciwKIAlnbWMtPmZhdWx0X2hh
c2hbaGFzaF0uaWR4ID0gZ21jLT5sYXN0X2ZhdWx0Kys7CiAJcmV0dXJuIGZhbHNlOwogfQorCit2
b2lkIGFtZGdwdV9nbWNfcmFzX2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCit7CisJ
aWYgKGFtZGdwdV9yYXNfaXNfc3VwcG9ydGVkKGFkZXYsIEFNREdQVV9SQVNfQkxPQ0tfX1VNQykg
JiYKKwkJCWFkZXYtPnVtYy5yYXNfaWYpIHsKKwkJc3RydWN0IHJhc19jb21tb25faWYgKnJhc19p
ZiA9IGFkZXYtPnVtYy5yYXNfaWY7CisJCXN0cnVjdCByYXNfaWhfaWYgaWhfaW5mbyA9IHsKKwkJ
CS5oZWFkID0gKnJhc19pZiwKKwkJCS5jYiA9IGFtZGdwdV91bWNfcHJvY2Vzc19yYXNfZGF0YV9j
YiwKKwkJfTsKKworCQlhbWRncHVfcmFzX2xhdGVfZmluaShhZGV2LCByYXNfaWYsICZpaF9pbmZv
KTsKKwkJa2ZyZWUocmFzX2lmKTsKKwl9CisKKwlpZiAoYW1kZ3B1X3Jhc19pc19zdXBwb3J0ZWQo
YWRldiwgQU1ER1BVX1JBU19CTE9DS19fTU1IVUIpICYmCisJCQlhZGV2LT5tbWh1Yi5yYXNfaWYp
IHsKKwkJc3RydWN0IHJhc19jb21tb25faWYgKnJhc19pZiA9IGFkZXYtPm1taHViLnJhc19pZjsK
KwkJc3RydWN0IHJhc19paF9pZiBpaF9pbmZvID0geworCQkJLmNiID0gTlVMTCwKKwkJfTsKKwor
CQlhbWRncHVfcmFzX2xhdGVfZmluaShhZGV2LCByYXNfaWYsICZpaF9pbmZvKTsKKwkJa2ZyZWUo
cmFzX2lmKTsKKwl9Cit9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZ21jLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmgKaW5k
ZXggY2JjODBjNWRhM2Y5Li40MWVkZDg2ZWZlNzMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZ21jLmgKQEAgLTIzMyw1ICsyMzMsNiBAQCB2b2lkIGFtZGdwdV9nbWNfYWdwX2xv
Y2F0aW9uKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQkJICAgICBzdHJ1Y3QgYW1kZ3B1
X2dtYyAqbWMpOwogYm9vbCBhbWRncHVfZ21jX2ZpbHRlcl9mYXVsdHMoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsIHVpbnQ2NF90IGFkZHIsCiAJCQkgICAgICB1aW50MTZfdCBwYXNpZCwgdWlu
dDY0X3QgdGltZXN0YW1wKTsKK3ZvaWQgYW1kZ3B1X2dtY19yYXNfZmluaShzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldik7CiAKICNlbmRpZgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ21jX3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8w
LmMKaW5kZXggMmNhNDBmMGY5OGFjLi5iMmY3ZTc2NWVmYjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ21jX3Y5XzAuYwpAQCAtMTExMywzMyArMTExMyw3IEBAIHN0YXRpYyBpbnQgZ21jX3Y5
XzBfc3dfZmluaSh2b2lkICpoYW5kbGUpCiAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSAo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKiloYW5kbGU7CiAJdm9pZCAqc3RvbGVuX3ZnYV9idWY7CiAK
LQlpZiAoYW1kZ3B1X3Jhc19pc19zdXBwb3J0ZWQoYWRldiwgQU1ER1BVX1JBU19CTE9DS19fVU1D
KSAmJgotCQkJYWRldi0+dW1jLnJhc19pZikgewotCQlzdHJ1Y3QgcmFzX2NvbW1vbl9pZiAqcmFz
X2lmID0gYWRldi0+dW1jLnJhc19pZjsKLQkJc3RydWN0IHJhc19paF9pZiBpaF9pbmZvID0gewot
CQkJLmhlYWQgPSAqcmFzX2lmLAotCQl9OwotCi0JCS8qIHJlbW92ZSBmcyBmaXJzdCAqLwotCQlh
bWRncHVfcmFzX2RlYnVnZnNfcmVtb3ZlKGFkZXYsIHJhc19pZik7Ci0JCWFtZGdwdV9yYXNfc3lz
ZnNfcmVtb3ZlKGFkZXYsIHJhc19pZik7Ci0JCS8qIHJlbW92ZSB0aGUgSUggKi8KLQkJYW1kZ3B1
X3Jhc19pbnRlcnJ1cHRfcmVtb3ZlX2hhbmRsZXIoYWRldiwgJmloX2luZm8pOwotCQlhbWRncHVf
cmFzX2ZlYXR1cmVfZW5hYmxlKGFkZXYsIHJhc19pZiwgMCk7Ci0JCWtmcmVlKHJhc19pZik7Ci0J
fQotCi0JaWYgKGFtZGdwdV9yYXNfaXNfc3VwcG9ydGVkKGFkZXYsIEFNREdQVV9SQVNfQkxPQ0tf
X01NSFVCKSAmJgotCQkJYWRldi0+bW1odWIucmFzX2lmKSB7Ci0JCXN0cnVjdCByYXNfY29tbW9u
X2lmICpyYXNfaWYgPSBhZGV2LT5tbWh1Yi5yYXNfaWY7Ci0KLQkJLyogcmVtb3ZlIGZzIGFuZCBk
aXNhYmxlIHJhcyBmZWF0dXJlICovCi0JCWFtZGdwdV9yYXNfZGVidWdmc19yZW1vdmUoYWRldiwg
cmFzX2lmKTsKLQkJYW1kZ3B1X3Jhc19zeXNmc19yZW1vdmUoYWRldiwgcmFzX2lmKTsKLQkJYW1k
Z3B1X3Jhc19mZWF0dXJlX2VuYWJsZShhZGV2LCByYXNfaWYsIDApOwotCQlrZnJlZShyYXNfaWYp
OwotCX0KLQorCWFtZGdwdV9nbWNfcmFzX2ZpbmkoYWRldik7CiAJYW1kZ3B1X2dlbV9mb3JjZV9y
ZWxlYXNlKGFkZXYpOwogCWFtZGdwdV92bV9tYW5hZ2VyX2ZpbmkoYWRldik7CiAKLS0gCjIuMTcu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
