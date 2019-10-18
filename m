Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD02DC359
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Oct 2019 12:59:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EFA26EB16;
	Fri, 18 Oct 2019 10:59:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800072.outbound.protection.outlook.com [40.107.80.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29E6A6EB16
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Oct 2019 10:59:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h5rCXMEjaJAc9c+BIubYvZuHTVep5f05LhOti6cMofpI8G0+rSHsUaZqkUr2Yj7z5DQ48LoNbGquY/jrnGqaiD+TBLyedr1s5/cpqKHFL3qm27Rs38+v2ZjtBUnZLEEQEEJ7WIn9fciXb/Wa/AR/oHJzOlva1tqqgf8YsPbrm2XgkZe9yY8pITJCkVd2n5rPhdtV02d7jzXqPCrCBuDGe/s/iQeIsuhipN00UO4i/zVT50QiTQnw05litMfeTX6qH+3WUYJYs9nWT/cKNQfaRawlD9D2XqkUzYum0kU7iA2Llc+L3vmxMQmroD+WtChhUI6tEFXoQ5hqGAlrMkKEmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DwxPFOx8H/dqtNr62jk3SskzIYXbVJ0rEkMSmvKQCHs=;
 b=Ovdy5s+9Mi10mOPwCSFhPVjxJhtn1dzTkzBwQLgDzaArMNVolGooBDT2+VPGMOcKGsxh4tivpXHlu8cH5e53MpbVQtAs2dl6Cuz5lGnYmFRwF6FdBkzYdGp2bEaE+RFS06v2kSLaJCBAAuaBdvSHl3iuu/o16cYExxp4yAvTHVLGyrPJAG7Nh3kFN7y4myHk74rYM7SOtb+O8ASGo97gwRE1OQY4M7IZ2n+NmNWI/GFZ4b1a3CE5F7+5HERL+WGNHGvTTpmES9SpfW6tf9Ax95GuiosSVWfKDdqr10Np29YRbHNJNXvGno+Q7P/wR+xkmkkCxU8dqzpKGP/UoomZVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB2980.namprd12.prod.outlook.com (20.178.208.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Fri, 18 Oct 2019 10:59:40 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::e9c9:6668:28ac:821c]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::e9c9:6668:28ac:821c%7]) with mapi id 15.20.2347.024; Fri, 18 Oct 2019
 10:59:40 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amdgpu/psp11: wait for sOS ready for ring creation
Thread-Topic: [PATCH 1/2] drm/amdgpu/psp11: wait for sOS ready for ring
 creation
Thread-Index: AQHVhaMjK2/wuxZhj02Sp74tbTT02A==
Date: Fri, 18 Oct 2019 10:59:39 +0000
Message-ID: <20191018105923.8277-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0027.apcprd03.prod.outlook.com
 (2603:1096:203:2f::15) To BN8PR12MB3602.namprd12.prod.outlook.com
 (2603:10b6:408:49::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f3b2c755-0dea-404a-2cfb-08d753ba45bd
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN8PR12MB2980:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB2980B401903E9A81E49424A1896C0@BN8PR12MB2980.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 01949FE337
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(366004)(396003)(346002)(39860400002)(199004)(189003)(386003)(102836004)(52116002)(26005)(14454004)(7736002)(6916009)(486006)(478600001)(2616005)(186003)(36756003)(6506007)(3846002)(6116002)(2501003)(66066001)(25786009)(305945005)(81156014)(81166006)(71200400001)(8676002)(66446008)(8936002)(4326008)(66476007)(6436002)(64756008)(4744005)(2351001)(5640700003)(6486002)(5660300002)(50226002)(2906002)(66946007)(256004)(316002)(6512007)(476003)(99286004)(71190400001)(54906003)(86362001)(1076003)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB2980;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t1Y/BUsEx9e0RiudzuiJHd8RO+yhUon0MA/uF+2LYs5GWqW2kzHuzSTZ3blM5Opvoz4rpULIIM+nUbXDZ+p6fhnb9lTBTVDgldpL11vKhq7xYL8mF11LRr0mnFiC7POeN0pdV8o9bJh1r4JBdli+H6xHkwGcSkO1yDGdtfV7hBekPxWyICkBH43Zl0PjJtA9iBW69xIbNxv/0O6V5YV+7WxWCpFiIIxv9oV/+q+gmNN4m7fIwzMDa3SvhfUQNcqY5ejpw9fFUHKDY3p/SMmrF2+QI+4fwBhRfGw2onAgT85ukPBnn03uKY8r9HmIvJiDbbECKrchXpZ9d3nVg7b8iCuloC9g3zWzA2isSSZxngeYQuVs43/aCqkiHA3+dvvWPnYQC+fEEOKiN48i7IpAZEdG7IatYS7Ut1QJp/zs+M8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3b2c755-0dea-404a-2cfb-08d753ba45bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2019 10:59:40.1519 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ncjMh7911gdRWzPVa/2Y9BTsNhWNiQSfxeH9G/crJJUZuyDNtqw5sj6Mx4v+uSn8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2980
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DwxPFOx8H/dqtNr62jk3SskzIYXbVJ0rEkMSmvKQCHs=;
 b=PzBKWrMOnUdtRkunJ0y7yg+KwGqU98RKreYTraMkT21F0w2dVHGYAeNIBQ1M7Vqr3x30LyzOoeQMKafttyqVkMN7gDnQleBD1ZYpoZ+1ycqGmSCgHRWeqU7ueEYSzwSHbO+1AHwEhGAs5eu+q0EEGR8bQULBty5kWjvhtHH5aQw=
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
Cc: "Long, Gang" <Gang.Long@amd.com>, "Xiao, Jack" <Jack.Xiao@amd.com>, "Yuan,
 Xiaojie" <Xiaojie.Yuan@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYyB8IDggKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9wc3BfdjExXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92
MTFfMC5jCmluZGV4IGU4ZTcwYjc0ZWE1Yi4uZGZlODVhMWQ3OWE1IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9wc3BfdjExXzAuYwpAQCAtNDU5LDYgKzQ1OSwxNCBAQCBzdGF0aWMgaW50IHBz
cF92MTFfMF9yaW5nX2NyZWF0ZShzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCwKIAkJCQkgICAweDgw
MDAwMDAwLCAweDgwMDBGRkZGLCBmYWxzZSk7CiAKIAl9IGVsc2UgeworCQkvKiBXYWl0IGZvciBz
T1MgcmVhZHkgZm9yIHJpbmcgY3JlYXRpb24gKi8KKwkJcmV0ID0gcHNwX3dhaXRfZm9yKHBzcCwg
U09DMTVfUkVHX09GRlNFVChNUDAsIDAsIG1tTVAwX1NNTl9DMlBNU0dfNjQpLAorCQkJCSAgIDB4
ODAwMDAwMDAsIDB4ODAwMDAwMDAsIGZhbHNlKTsKKwkJaWYgKHJldCkgeworCQkJRFJNX0VSUk9S
KCJGYWlsZWQgdG8gd2FpdCBmb3Igc09TIHJlYWR5IGZvciByaW5nIGNyZWF0aW9uXG4iKTsKKwkJ
CXJldHVybiByZXQ7CisJCX0KKwogCQkvKiBXcml0ZSBsb3cgYWRkcmVzcyBvZiB0aGUgcmluZyB0
byBDMlBNU0dfNjkgKi8KIAkJcHNwX3JpbmdfcmVnID0gbG93ZXJfMzJfYml0cyhyaW5nLT5yaW5n
X21lbV9tY19hZGRyKTsKIAkJV1JFRzMyX1NPQzE1KE1QMCwgMCwgbW1NUDBfU01OX0MyUE1TR182
OSwgcHNwX3JpbmdfcmVnKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
