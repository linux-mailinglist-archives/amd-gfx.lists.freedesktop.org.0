Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4319BB73D4
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 09:13:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B685D6F962;
	Thu, 19 Sep 2019 07:13:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740048.outbound.protection.outlook.com [40.107.74.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106FD6F962
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 07:13:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TFy+1RSc1hkif1sSuL48FUJt/cJPWNJ1FAQcSxoRHkUhyCwuiXgah+OsuWOWOyWV6Lc5GHmtQtLZLYzcfFnpAyWH91t1xnt9hVJmHSORjJW63OXzuZWpEqIfftdX6cOeREnNvmzkGVitE9zJCnbnU2CHrO8LP5I+WiACebSJsyMNfy2JV2tqj/UAX0g7g4vea6MqnuGibc/pl7tbABE4Obzf6Nye3/z2hZWhzrI6timK/Mw4MUjqpJZBReS+YDjupLWw0fc2QkhhDx1E/P8u/J0DgEmbJvvo/6M3QypUHFh05B5DrZOEHa2PRrDJV8cX7KcMk87N3+UG3r83X+9E2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/WGCV6aaBCYClt7FpAUZA/iAI7Q46U2/TRtY/VVdGgo=;
 b=O5JFrqvYAfDYKdVejVRXOWPt/IeVdINMwjBSJsjYebkVOsew0eEYvfe7/99V8lVcXTT9g3P8ss0zkFz6QWlynlP9s5fKU9m0FjkoMawt90jW/pVddV40Z4A/j+0bCaPdgiHVlKne/sbVR494ytrUFdTFCNKyfy56iqKxFB4OCjV1BI0t355WE+u9k0LoV+Wb93Wy7PEpuIiUHpWOIKPfj4N1XcBZwKKfyt8PK0Tp6SvbYUJfEAY/Mc+7w7pwDbwLuNbtQyxHTQYlbXTVjmyqssxRKvSifk6+OFIUEVK4WUeofdMwMC4xBWTHjVkQLbUEFnbnVc9GLRc5xDsURgqw8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3440.namprd12.prod.outlook.com (20.178.244.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Thu, 19 Sep 2019 07:13:10 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 07:13:10 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: [PATCH 18/21] drm/amdgpu: move umc ras fini to umc block
Thread-Topic: [PATCH 18/21] drm/amdgpu: move umc ras fini to umc block
Thread-Index: AQHVbrmxhJb9cIWttU6j6t6LPM2d0w==
Date: Thu, 19 Sep 2019 07:13:10 +0000
Message-ID: <20190919071115.16552-19-tao.zhou1@amd.com>
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
x-ms-office365-filtering-correlation-id: 2858581c-0b93-4ac7-932b-08d73cd0d3d5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3440; 
x-ms-traffictypediagnostic: MN2PR12MB3440:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB344069FCB1B2D8C7F576E296B0890@MN2PR12MB3440.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:473;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(199004)(189003)(25786009)(66066001)(14454004)(256004)(478600001)(6512007)(4326008)(2906002)(66946007)(66446008)(64756008)(316002)(66556008)(66476007)(6436002)(6116002)(110136005)(3846002)(6486002)(99286004)(6636002)(76176011)(2501003)(52116002)(1076003)(36756003)(5660300002)(446003)(2616005)(11346002)(476003)(305945005)(7736002)(26005)(102836004)(486006)(386003)(6506007)(186003)(8676002)(71190400001)(86362001)(71200400001)(8936002)(81156014)(50226002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3440;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OFNaYSV8zMtCnfHeOvubV4fN6fb0eDSUX3cvc5OLzva8LkQFeGXqhQVDsxXrx5y/d6ulz0G9WPk5nkh1MYCMM1lHgQAK2EGQdMnyFxn8GO8hjM1fZmqsPLYceRJGzmw6VSpqGZGf9CxBUAEI643AOGnJbEkKKZ/3gVPlK0uBbK0erglzkThDAIFctQdlWDimQGRR5Jrk/GXz9bl+1QcCE1AnzbcKGZ8Ylx8dNnvklhEaFfkJKfrMnQIwL1oD/pBNtm40dAJGtaxS3iTF9U1okB0VenR3NOhhGZ/1WXBou4XsHOuoMt3QYqPr5zN+EVNSRrhIzqplu6aeSb5+IcGcAxs+mjtY+1koYG/xuVJbGq9Ks/zNZjBGr0sT2xS7i7j5vap8i7ONeH1vdKu00Aab7bgNX12KhAwzAu64/RWRaPY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2858581c-0b93-4ac7-932b-08d73cd0d3d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 07:13:10.4496 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M6aQ3uIDyA3niyDTjRHHWvrYc+LM1DXTQYdhaESODHBlmfKO6n/KJwjm6rIfSy7E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3440
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/WGCV6aaBCYClt7FpAUZA/iAI7Q46U2/TRtY/VVdGgo=;
 b=Sp4JOXOb9S+jY2LJCX2ji6zKgVNxwbK2kDYteRVcOjSHgwj5WrMFFN7upzZYIoI4+WotDDd0FOZEl/QoMiFZP2sAc0AzrBZvGmYZ0oe/gMmlNtimqzoNBd3TQvfVsyyDAt5dSK9OdOspooKqB1s3GBpbtZCWiZlsRx5KUB5awGA=
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

aXQncyBtb3JlIHN1aXRhYmxlIHRvIHB1dCB1bWMgcmFzIGZpbmkgaW4gdW1jIGJsb2NrCgpTaWdu
ZWQtb2ZmLWJ5OiBUYW8gWmhvdSA8dGFvLnpob3UxQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5jIHwgMTIgKy0tLS0tLS0tLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmMgfCAxNSArKysrKysrKysrKysrKysKIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91bWMuaCB8ICAxICsKIDMgZmlsZXMgY2hhbmdl
ZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2dtYy5jCmluZGV4IDRjZDIwNmVlM2UwYi4uYmY4MDg0ZGViMDI4IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5jCkBAIC0zMDcsMTcgKzMwNyw3IEBA
IGJvb2wgYW1kZ3B1X2dtY19maWx0ZXJfZmF1bHRzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
LCB1aW50NjRfdCBhZGRyLAogCiB2b2lkIGFtZGdwdV9nbWNfcmFzX2Zpbmkoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpCiB7Ci0JaWYgKGFtZGdwdV9yYXNfaXNfc3VwcG9ydGVkKGFkZXYsIEFN
REdQVV9SQVNfQkxPQ0tfX1VNQykgJiYKLQkJCWFkZXYtPnVtYy5yYXNfaWYpIHsKLQkJc3RydWN0
IHJhc19jb21tb25faWYgKnJhc19pZiA9IGFkZXYtPnVtYy5yYXNfaWY7Ci0JCXN0cnVjdCByYXNf
aWhfaWYgaWhfaW5mbyA9IHsKLQkJCS5oZWFkID0gKnJhc19pZiwKLQkJCS5jYiA9IGFtZGdwdV91
bWNfcHJvY2Vzc19yYXNfZGF0YV9jYiwKLQkJfTsKLQotCQlhbWRncHVfcmFzX2xhdGVfZmluaShh
ZGV2LCByYXNfaWYsICZpaF9pbmZvKTsKLQkJa2ZyZWUocmFzX2lmKTsKLQl9CisJYW1kZ3B1X3Vt
Y19yYXNfZmluaShhZGV2KTsKIAogCWlmIChhbWRncHVfcmFzX2lzX3N1cHBvcnRlZChhZGV2LCBB
TURHUFVfUkFTX0JMT0NLX19NTUhVQikgJiYKIAkJCWFkZXYtPm1taHViLnJhc19pZikgewpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5jCmluZGV4IDA4MDM3ZjA4NmQyOC4uNzc0
NGRlMTQ5OTQ5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dW1jLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5jCkBAIC03
NCw2ICs3NCwyMSBAQCBpbnQgYW1kZ3B1X3VtY19yYXNfbGF0ZV9pbml0KHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQogCXJldHVybiByOwogfQogCit2b2lkIGFtZGdwdV91bWNfcmFzX2Zpbmko
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCit7CisJaWYgKGFtZGdwdV9yYXNfaXNfc3VwcG9y
dGVkKGFkZXYsIEFNREdQVV9SQVNfQkxPQ0tfX1VNQykgJiYKKwkJCWFkZXYtPnVtYy5yYXNfaWYp
IHsKKwkJc3RydWN0IHJhc19jb21tb25faWYgKnJhc19pZiA9IGFkZXYtPnVtYy5yYXNfaWY7CisJ
CXN0cnVjdCByYXNfaWhfaWYgaWhfaW5mbyA9IHsKKwkJCS5oZWFkID0gKnJhc19pZiwKKwkJCS5j
YiA9IGFtZGdwdV91bWNfcHJvY2Vzc19yYXNfZGF0YV9jYiwKKwkJfTsKKworCQlhbWRncHVfcmFz
X2xhdGVfZmluaShhZGV2LCByYXNfaWYsICZpaF9pbmZvKTsKKwkJa2ZyZWUocmFzX2lmKTsKKwl9
Cit9CisKIGludCBhbWRncHVfdW1jX3Byb2Nlc3NfcmFzX2RhdGFfY2Ioc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsCiAJCXZvaWQgKnJhc19lcnJvcl9zdGF0dXMsCiAJCXN0cnVjdCBhbWRncHVf
aXZfZW50cnkgKmVudHJ5KQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3VtYy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5oCmlu
ZGV4IDZmMGM0NGFkYTU4Zi4uZjk1ZGQzMjcwZDFjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3VtYy5oCkBAIC04Miw2ICs4Miw3IEBAIHN0cnVjdCBhbWRncHVfdW1jIHsKIH07
CiAKIGludCBhbWRncHVfdW1jX3Jhc19sYXRlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpOwordm9pZCBhbWRncHVfdW1jX3Jhc19maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
KTsKIGludCBhbWRncHVfdW1jX3Byb2Nlc3NfcmFzX2RhdGFfY2Ioc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsCiAJCXZvaWQgKnJhc19lcnJvcl9zdGF0dXMsCiAJCXN0cnVjdCBhbWRncHVfaXZf
ZW50cnkgKmVudHJ5KTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
