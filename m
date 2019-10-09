Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D252D0D63
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 13:08:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE986E979;
	Wed,  9 Oct 2019 11:08:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710065.outbound.protection.outlook.com [40.107.71.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72DD86E2E3
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2019 11:08:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K4jkxNtO9CRi+AdMMkKGYnR8lf9gHwlkAinZ6kn0Z7bfXO58gNr88+10UJKImx9axyG2ZiCAblQvFHkuZC9ssqvPGiyr4N0jKGDHuKXh4PQgjA7QV22kwGsMtT4r6/Dhu1yNgLwpBJiEPMYf2mPK6jO1ilmrdR3wZvO5Qoc5jfWIV5LeHz+kjg1mjMlhKCeIw1XmNC+Xts+8FfI30S8eT8lqjSACeBYYh4nbc7APYHGGIo5FIyICVMkPNGdBRe1geZSCYwCpq3V0gHDRPpb5TQgffnMzCrRam06dUmhWaJLECzklbvx1K5aI/ym0Blt+Oj0Wg3WMPw8KFxU8qT7Z4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VWFEwDqEp0yMNZfhqsM0cVtMZotEgSxJBp2g55+XE6c=;
 b=GrXYaTgPI5K2frPGSz6V7+FqTano8omUTpXFM/qXlVv3EHtPm7Ac9BHeXswCWCvLvMCe8hH0ou5IvKX1pg5FczA9jt+IZy7qWEcwAe5MoSutFd7lFMsiJPk3KzEFu9cXQVF6e0EJYwhrbXs62WFr0MatnalGymffzpAuHeW5v1o99f40EcwwZRRuj37Iiwm0zfXy/3otXwJYQF5wI9gewb2dVdduTYu8j0e2iGGTlXrOdHzgT8PfjpZikKE1gszGG8zRtrKhiFT+TQ4DrSm+Jr5FuOLM9vbfQoXP6skau9BAiFIHz6zDNrf57560J1v4QExje4XR93to/odj+QsjFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3092.namprd12.prod.outlook.com (20.178.212.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Wed, 9 Oct 2019 11:08:15 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::e9c9:6668:28ac:821c]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::e9c9:6668:28ac:821c%7]) with mapi id 15.20.2347.016; Wed, 9 Oct 2019
 11:08:15 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amd/powerplay: add more feature bits
Thread-Topic: [PATCH 1/2] drm/amd/powerplay: add more feature bits
Thread-Index: AQHVfpHYv5oONJ+p/UGt6tWDCreN0A==
Date: Wed, 9 Oct 2019 11:08:15 +0000
Message-ID: <20191009110757.30995-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR06CA0018.apcprd06.prod.outlook.com
 (2603:1096:202:2e::30) To BN8PR12MB3602.namprd12.prod.outlook.com
 (2603:10b6:408:49::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e027b449-9d73-4997-d71e-08d74ca8fb4b
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN8PR12MB3092:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB30927400D239BE15F1F0BD8E89950@BN8PR12MB3092.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:189;
x-forefront-prvs: 018577E36E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(199004)(189003)(99286004)(186003)(3846002)(305945005)(6512007)(5640700003)(478600001)(2906002)(86362001)(4326008)(2501003)(6436002)(2351001)(36756003)(6116002)(7736002)(6916009)(6486002)(14454004)(52116002)(102836004)(6506007)(386003)(5660300002)(256004)(14444005)(71200400001)(25786009)(50226002)(71190400001)(66476007)(66066001)(66946007)(26005)(66446008)(64756008)(476003)(2616005)(1076003)(54906003)(486006)(316002)(8936002)(66556008)(81156014)(81166006)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3092;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tXlaoTCyuwZ5xzc2CJM4ga0322hRxAaCuLAzjKyTJiD7xiVTIPudjsKvDDvMbjUQ+TxtOYwgke0t5hsvSXNcs+t9D9wtEWKOA6aioha9LzRzSkzCJa7bmM9610If1POhLIPR5DBrdWzLnRj0urgOYfJw+/k9mclb3dAZ+009GtPfP0pnpRpCcXYWNhdmRij5tc41AnurthL2X9vjkfo5HbIHDRjadSR7cejil0Qfa67bZBtUAmYv3kc1AQ3P1CtsYwiBslLy1foBe92CnxNi2jSKOAbWifAod7xosNam+GF4d9Nr3DVgykZ9tCbD62NIUL4kRQOou5jcCkwPLa6t2PYFNvcdAX5TaxpWdgD9GL5FEKUj0hO0yUfrDuqHvEYhI17qkXaXNfWcSVgLPyxqwVHCV8t4oGiROB0Pw070Ykk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e027b449-9d73-4997-d71e-08d74ca8fb4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2019 11:08:15.2511 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5OUVRP7uDErt8zdo+EJcgo9rgLjguNXhVyq5kssKAZ+n15U0b/diu2yIiAoHoQX5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3092
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VWFEwDqEp0yMNZfhqsM0cVtMZotEgSxJBp2g55+XE6c=;
 b=B6WnsSSV3Yv7ThCf1Adso3yD+zFMlmuusm9U8Q/dmmIEiWzU5Xg2H5gVYmTTp327MsgMxZqAFBdwjaZJbGKaeg0ltts6wwAQf8mhvSy6IP7nyX8q+bjr3lTCA0iEXTbVXt3t0whPqSVL+d+Ugz6x327HbOQzSOLZpx5BN8l6WI0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xiaojie.Yuan@amd.com; 
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Wang,
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Quan, Evan" <Evan.Quan@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgfCA1ICsrKystCiAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCmluZGV4IDVhMzRkMDFmN2Y3Yy4uNDQxNTJj
MWYwMWM3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBf
cHB0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCkBA
IC0zMzcsMTkgKzMzNywyMiBAQCBuYXZpMTBfZ2V0X2FsbG93ZWRfZmVhdHVyZV9tYXNrKHN0cnVj
dCBzbXVfY29udGV4dCAqc211LAogCQkJCXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVfUFBUX0JJVCkK
IAkJCQl8IEZFQVRVUkVfTUFTSyhGRUFUVVJFX1REQ19CSVQpCiAJCQkJfCBGRUFUVVJFX01BU0so
RkVBVFVSRV9HRlhfRURDX0JJVCkKKwkJCQl8IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0FQQ0NfUExV
U19CSVQpCiAJCQkJfCBGRUFUVVJFX01BU0soRkVBVFVSRV9WUjBIT1RfQklUKQogCQkJCXwgRkVB
VFVSRV9NQVNLKEZFQVRVUkVfRkFOX0NPTlRST0xfQklUKQogCQkJCXwgRkVBVFVSRV9NQVNLKEZF
QVRVUkVfVEhFUk1BTF9CSVQpCiAJCQkJfCBGRUFUVVJFX01BU0soRkVBVFVSRV9MRURfRElTUExB
WV9CSVQpCiAJCQkJfCBGRUFUVVJFX01BU0soRkVBVFVSRV9EUE1fRENFRkNMS19CSVQpCiAJCQkJ
fCBGRUFUVVJFX01BU0soRkVBVFVSRV9EU19HRlhDTEtfQklUKQorCQkJCXwgRkVBVFVSRV9NQVNL
KEZFQVRVUkVfRFNfTENMS19CSVQpCiAJCQkJfCBGRUFUVVJFX01BU0soRkVBVFVSRV9EU19EQ0VG
Q0xLX0JJVCkKIAkJCQl8IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0ZXX0RTVEFURV9CSVQpCiAJCQkJ
fCBGRUFUVVJFX01BU0soRkVBVFVSRV9CQUNPX0JJVCkKIAkJCQl8IEZFQVRVUkVfTUFTSyhGRUFU
VVJFX0FDRENfQklUKQogCQkJCXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVfR0ZYX1NTX0JJVCkKIAkJ
CQl8IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0FQQ0NfREZMTF9CSVQpCi0JCQkJfCBGRUFUVVJFX01B
U0soRkVBVFVSRV9GV19DVEZfQklUKTsKKwkJCQl8IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0ZXX0NU
Rl9CSVQpCisJCQkJfCBGRUFUVVJFX01BU0soRkVBVFVSRV9PVVRfT0ZfQkFORF9NT05JVE9SX0JJ
VCk7CiAKIAlpZiAoYWRldi0+cG0ucHBfZmVhdHVyZSAmIFBQX01DTEtfRFBNX01BU0spCiAJCSoo
dWludDY0X3QgKilmZWF0dXJlX21hc2sgfD0gRkVBVFVSRV9NQVNLKEZFQVRVUkVfRFBNX1VDTEtf
QklUKQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
