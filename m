Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6AFA862A
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Sep 2019 17:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3ED589BF8;
	Wed,  4 Sep 2019 15:48:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810071.outbound.protection.outlook.com [40.107.81.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9670389BDB
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 15:48:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJPm0nynmOCXzkh/4zF5WsNFWONl8T7VEAcV6xVil7WVKnnMdhB6NpQeaKI5tuvfb7AwEVXH5gNyLpRpX/rVhu8SZbYeBcYM8meuCnGvDHMyYrNcTnKeqh2E+jY/CuzGmGsif2oJKpczcXuTZngTyW5AetTXfGhOLxB9TLGfDGH7JU/bJCPUi5RIsXlL6iRaGl7oHaQekT4QQnZSnMjiqxQoIFHFZ2kmkg21N0XqyN+2k1kEXz5t006UYX0H7cW7AZn2TYfV3NTFadKRmli/Q53spwgugKlXeeRpYK7b63u73GvqUTojisJ946TRpmPDfsqBCZWlWPp1tOOVXwcPTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZwQMXXhd9VtmzH+7X/nh1+WzwOrNt/XEKrLgppphowo=;
 b=jLTTsaXII/fpNtyvX6VeYmBzrCKePipFBtoHJeHYHL2FSP8Yv1nwfslj9A4RT7ez9tvC9J/9O+vCgcXUZnYRDnJRXTtBBCV7M1y8hG1cxgA2kjjz2x8QrH7Q6JlvfwkbIXZntYDKbn5H6SL8SiMrAC4/hwawanZVRd8MqUj8g8KmsTpg5ATZjq3ZiPawm7LfZXEWGEhAMJS7Q5dI87dqgI+oqVX+vAXleZ2cvG45FTRBoXNn6olVJkUcOs4F3H/La/f2Zh9zv6IgTQxr2IlySoLh/z6IzT1j5J4m7bxHeIkjXwI79ZYxYLSEWQ041tTGVlxnk8HgAoFvok8DMOyGLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB2863.namprd12.prod.outlook.com (20.179.82.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Wed, 4 Sep 2019 15:48:26 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77%3]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 15:48:26 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 01/10] drm/amdkfd: add renoir cache info for CRAT
Thread-Topic: [PATCH 01/10] drm/amdkfd: add renoir cache info for CRAT
Thread-Index: AQHVYzgwKEGRYqK5+EqSSTE49RvUKQ==
Date: Wed, 4 Sep 2019 15:48:26 +0000
Message-ID: <20190904154803.5102-2-ray.huang@amd.com>
References: <20190904154803.5102-1-ray.huang@amd.com>
In-Reply-To: <20190904154803.5102-1-ray.huang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YTOPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::34) To MN2PR12MB3309.namprd12.prod.outlook.com
 (2603:10b6:208:106::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 34f65367-ff2e-4dc0-0cc2-08d7314f52b8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2863; 
x-ms-traffictypediagnostic: MN2PR12MB2863:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB28636E9C97EB441510DED324ECB80@MN2PR12MB2863.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:873;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(39860400002)(376002)(396003)(136003)(189003)(199004)(66446008)(14444005)(99286004)(64756008)(305945005)(66556008)(66476007)(66946007)(6436002)(5640700003)(86362001)(7736002)(3846002)(6116002)(486006)(256004)(6916009)(5660300002)(8676002)(2351001)(4326008)(6506007)(386003)(14454004)(316002)(54906003)(6486002)(11346002)(76176011)(478600001)(446003)(53936002)(52116002)(26005)(71190400001)(71200400001)(102836004)(66066001)(1076003)(186003)(36756003)(8936002)(25786009)(50226002)(81156014)(2501003)(81166006)(6512007)(2616005)(476003)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2863;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ljz1Z2utXc6NqKNcScgNfj4Ikw1gG/fe1cZCtOWKBic/vcXu4BHmHBQ15sOJsPS5aynuXHpHKQPknDZsjArpNu2z4bT1C3lr2toLj1CeD1BuKNx8dfKadOv2uXKBC0awtBdIdn+qGe2fUlVzZi82ZGdBpr7CvBbzsZioZ7AQ6+VX4zZczpyYDK41fQtXPlhpBjvGf0OVLNmkcv2GbMjAH/HowzpLXby6mjBMcLLQaHsQtfkfKE4dZof0CtoP21zvI+FC1CKhRF9leKJKkb2gGQnO4Hrvkc46t2kJnBaebJtx3DMjlrkjnx4xiSL4S91J7bFmvwxtK93xtppAv1apCq0k+h2LL4T5vdHkRf08xaBYs3sibDYw8F1zj1hOElOg7j3apzNHHMr7I3c1KWaX1ER/0YbM0+NQkE/fKdME/kY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34f65367-ff2e-4dc0-0cc2-08d7314f52b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 15:48:26.0403 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YQrKqEWPZZtbv5LzifThwHQ0VNzY9nXgFsTZzUNizKmK0RkD+ObkgfqprOR0azxpu5tfEdP/CmR+POuK9LajPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2863
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZwQMXXhd9VtmzH+7X/nh1+WzwOrNt/XEKrLgppphowo=;
 b=it8cSxys3DKJpQQ7x6F6KhgRw5usGa6g3pTqCZhNi0pHDFvLsNqwc8hSglg6WTw5ieLodI3b/vyhgRon2n1sGEkVqO04tE+oETGAFbG+GySBdH36pFqriOZUrCp7rgxWJQkzyLirxBWFxFTrGfU/+dynkaHit0ulAXpVBHVqMuc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmVub2lyJ3MgY2FjaGUgaW5mbyBzaG91bGQgYmUgdGhlIHNhbWUgd2l0aCByYXZlbiBhbmQgY2Fy
cml6bydzLgoKU2lnbmVkLW9mZi1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY3JhdC5jIHwgNCArKysrCiAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX2NyYXQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jcmF0
LmMKaW5kZXggYTg0YzgxMC4uMmE0MjhjOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX2NyYXQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRf
Y3JhdC5jCkBAIC0xMzgsNiArMTM4LDcgQEAgc3RhdGljIHN0cnVjdCBrZmRfZ3B1X2NhY2hlX2lu
Zm8gY2Fycml6b19jYWNoZV9pbmZvW10gPSB7CiAvKiBUT0RPIC0gY2hlY2sgJiB1cGRhdGUgVmVn
YTEwIGNhY2hlIGRldGFpbHMgKi8KICNkZWZpbmUgdmVnYTEwX2NhY2hlX2luZm8gY2Fycml6b19j
YWNoZV9pbmZvCiAjZGVmaW5lIHJhdmVuX2NhY2hlX2luZm8gY2Fycml6b19jYWNoZV9pbmZvCisj
ZGVmaW5lIHJlbm9pcl9jYWNoZV9pbmZvIGNhcnJpem9fY2FjaGVfaW5mbwogLyogVE9ETyAtIGNo
ZWNrICYgdXBkYXRlIE5hdmkxMCBjYWNoZSBkZXRhaWxzICovCiAjZGVmaW5lIG5hdmkxMF9jYWNo
ZV9pbmZvIGNhcnJpem9fY2FjaGVfaW5mbwogCkBAIC02NjgsNiArNjY5LDkgQEAgc3RhdGljIGlu
dCBrZmRfZmlsbF9ncHVfY2FjaGVfaW5mbyhzdHJ1Y3Qga2ZkX2RldiAqa2RldiwKIAljYXNlIENI
SVBfUkFWRU46CiAJCXBjYWNoZV9pbmZvID0gcmF2ZW5fY2FjaGVfaW5mbzsKIAkJbnVtX29mX2Nh
Y2hlX3R5cGVzID0gQVJSQVlfU0laRShyYXZlbl9jYWNoZV9pbmZvKTsKKwljYXNlIENISVBfUkVO
T0lSOgorCQlwY2FjaGVfaW5mbyA9IHJlbm9pcl9jYWNoZV9pbmZvOworCQludW1fb2ZfY2FjaGVf
dHlwZXMgPSBBUlJBWV9TSVpFKHJlbm9pcl9jYWNoZV9pbmZvKTsKIAljYXNlIENISVBfTkFWSTEw
OgogCQlwY2FjaGVfaW5mbyA9IG5hdmkxMF9jYWNoZV9pbmZvOwogCQludW1fb2ZfY2FjaGVfdHlw
ZXMgPSBBUlJBWV9TSVpFKG5hdmkxMF9jYWNoZV9pbmZvKTsKLS0gCjIuNy40CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
