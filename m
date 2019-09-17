Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EE9B47B4
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Sep 2019 08:53:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B7C6E155;
	Tue, 17 Sep 2019 06:53:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800074.outbound.protection.outlook.com [40.107.80.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 058CA6E155
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 06:53:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ntf8fzuyRvOV7KJxkiG7PJS3VBmNO4LRl1AmqApVaYALP/5pgt2kywyF6oXDTdFF+wzRBiB15LTWWQ1F1P7KYJpYydkAeKh3pN/7uLmLiUIuZBzq46FFlW0wsWbpEPDsn8ObAch7cKDhBv6UTfVUsxQ67zcxubjGf+AriwcpB0V6X/ophJKDRamW0CGZ8dji4d6H1I+Q2D7X8zg+Fd1I0Nilq8/tHbI/ut8FO4ZhLCum0Os6VDKTcax4YWzxuvv4bwTvKlMejqJie93sRiuCXrjxs9E55TcCdJXeD+dd0AqlG/fOYu19uD8tvTYfS2JaRyCw4HrIfYjg5dCATF3NUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jI5xdZIarL233EUFio+bWmINDUdMrNfG2z+QPF9J2Y=;
 b=bZQlhTCWUdAPgW8I6V00/bD9+QXlxCJFfmaxuKGh6jpeqVEIvRxWCoH5jk0lEkTgIBQEIzgMZA9Ikj14N2dcoiE1Yo8i59gNxUaZUiNoaaJMTOwh1tEy5E7JQPkGjHJInyt/qh8E1WDWOub1IckCuMLxyf7Hr3RsRBL7ByGbIUpIIRwQPbFvi+Ve9CxthUbYTZADuZtm1/ffJ2jQPexsoYrgWxkN4tBrl4XNBMlSyNPoz6Dhx5AAMn8F2fNMRq9QD6uif+/3pJSYqC8+6SMoIgero+3mlntYxx1Y1nCufhGeVa6kBRvA9TBf11ZXL2WjyrlXtanE6+qVIWUH0PvHLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB2806.namprd12.prod.outlook.com (20.176.254.20) by
 BYAPR12MB3527.namprd12.prod.outlook.com (20.179.94.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.23; Tue, 17 Sep 2019 06:53:06 +0000
Received: from BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::c416:d75c:9f2f:9f11]) by BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::c416:d75c:9f2f:9f11%7]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 06:53:06 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH] drm/amdgpu: use GPU PAGE SHIFT for umc retired page
Thread-Topic: [PATCH] drm/amdgpu: use GPU PAGE SHIFT for umc retired page
Thread-Index: AQHVbSBHvxsMS8Vye0iELpc03jvuqqcvbrqw
Date: Tue, 17 Sep 2019 06:53:05 +0000
Message-ID: <BYAPR12MB280684F74168655ECB4F3870F18F0@BYAPR12MB2806.namprd12.prod.outlook.com>
References: <20190917062213.29480-1-tao.zhou1@amd.com>
In-Reply-To: <20190917062213.29480-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ba16f99-6449-4d03-53e5-08d73b3bb185
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BYAPR12MB3527; 
x-ms-traffictypediagnostic: BYAPR12MB3527:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB35277B685EB7E98BD2E23457F18F0@BYAPR12MB3527.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(396003)(366004)(39860400002)(13464003)(199004)(189003)(6636002)(7736002)(74316002)(2501003)(71190400001)(71200400001)(256004)(229853002)(81166006)(486006)(6436002)(33656002)(25786009)(14454004)(478600001)(8936002)(316002)(86362001)(110136005)(305945005)(9686003)(8676002)(14444005)(81156014)(66066001)(446003)(99286004)(66946007)(66556008)(66446008)(64756008)(66476007)(76116006)(52536014)(6116002)(3846002)(76176011)(7696005)(186003)(6246003)(102836004)(53546011)(11346002)(476003)(6506007)(5660300002)(26005)(55016002)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3527;
 H:BYAPR12MB2806.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: twqr73VBvi0TQBhu4U9yjJDa5FnVqdaWhHr4TXdNnINaWhxYFKlwn5JdqwXeACFPUMmM+XLEcPaNt+NcRn7TLnfv4jOkzW8YGjB4U2MoYss5YfQUxayqfOWaOmVHm7b4Pi8Hpt2Wd7jb1KEL64gyvNCExP26HtFjlWWvFL5++uG3IzzSzJCO0sMVTIesq0Rg+p+JqICs+lnQKj3Xr95Y0Bb3yS3eyAJmK6F4cXun+y1nRQQT9xzMTH+IzFpfMjd5lgIixqjHaZEHrX4YikUaqsLu2Lhfvp31I/V6P+Kc7I42hNQVsRe5VROZfatTJxdKFY5/r2gk/eI92gOGVrXL0CUJWyqcwdz8hJG2iz+9bE72Rk5AMB+3BlFZgP/v3qJZ2bGcBrjDJ5KGzOkHWVYj1y/OCXBRpI3Ylpuubd1HVRE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba16f99-6449-4d03-53e5-08d73b3bb185
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 06:53:05.6212 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d4Wp4VhOqm3EWpd0b2arIQmmLLAzAB25+bJ/8NhrRgJ3NfcTMEmReEE1U1T6wXAqEwIKKZ2Dflp9CWPUiVvSGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3527
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jI5xdZIarL233EUFio+bWmINDUdMrNfG2z+QPF9J2Y=;
 b=psoYd5TI1gZMfoGGt2fI0oOtcluv8y+PU8MQRz37aXO82EbXGfUN8Zb3GtKa+WsjuEvWB2dTFN7TkvAVmTo05PR/RPKJWx6QFD6wr5GKIPW5c3/tOSKSX7usydgqSwx3CKg9oleuIJdLnuPNYgwzwyie4Qkejrk7L0muzyElwZ4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEd1Y2h1biBDaGVuIDxndWNodW4uY2hlbkBhbWQuY29tPgoKUmVnYXJkcywK
R3VjaHVuCgotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQpGcm9tOiBaaG91MSwgVGFvIDxUYW8u
WmhvdTFAYW1kLmNvbT4gClNlbnQ6IFR1ZXNkYXksIFNlcHRlbWJlciAxNywgMjAxOSAyOjIyIFBN
ClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgQ2hlbiwgR3VjaHVuIDxHdWNodW4u
Q2hlbkBhbWQuY29tPjsgWmhhbmcsIEhhd2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT47IERl
dWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT4KQ2M6IFpob3UxLCBU
YW8gPFRhby5aaG91MUBhbWQuY29tPgpTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHU6IHVzZSBH
UFUgUEFHRSBTSElGVCBmb3IgdW1jIHJldGlyZWQgcGFnZQoKdW1jIHJldGlyZWQgcGFnZSBiZWxv
bmdzIHRvIHZyYW0gYW5kIGl0IHNob3VsZCBiZSBhbGlnbmVkIHRvIGdwdSBwYWdlIHNpemUKClNp
Z25lZC1vZmYtYnk6IFRhbyBaaG91IDx0YW8uemhvdTFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS91bWNfdjZfMS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvdW1jX3Y2XzEuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8x
LmMKaW5kZXggMWMwZGEzMmMxNTYxLi40N2M0Yjk2YjE0ZDEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8xLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvdW1jX3Y2XzEuYwpAQCAtMjEzLDcgKzIxMyw3IEBAIHN0YXRpYyB2b2lkIHVtY192Nl8x
X3F1ZXJ5X2Vycm9yX2FkZHJlc3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCQkJPT0g
MSkgewogCQkJZXJyX3JlYy0+YWRkcmVzcyA9IGVycl9hZGRyOwogCQkJLyogcGFnZSBmcmFtZSBh
ZGRyZXNzIGlzIHNhdmVkICovCi0JCQllcnJfcmVjLT5yZXRpcmVkX3BhZ2UgPSByZXRpcmVkX3Bh
Z2UgPj4gUEFHRV9TSElGVDsKKwkJCWVycl9yZWMtPnJldGlyZWRfcGFnZSA9IHJldGlyZWRfcGFn
ZSA+PiBBTURHUFVfR1BVX1BBR0VfU0hJRlQ7CiAJCQllcnJfcmVjLT50cyA9ICh1aW50NjRfdClr
dGltZV9nZXRfcmVhbF9zZWNvbmRzKCk7CiAJCQllcnJfcmVjLT5lcnJfdHlwZSA9IEFNREdQVV9S
QVNfRUVQUk9NX0VSUl9OT05fUkVDT1ZFUkFCTEU7CiAJCQllcnJfcmVjLT5jdSA9IDA7Ci0tCjIu
MTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
