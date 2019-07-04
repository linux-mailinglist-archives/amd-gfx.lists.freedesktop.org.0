Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FA55F1AD
	for <lists+amd-gfx@lfdr.de>; Thu,  4 Jul 2019 05:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53C76E243;
	Thu,  4 Jul 2019 03:02:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810059.outbound.protection.outlook.com [40.107.81.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E020E6E243
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Jul 2019 03:02:20 +0000 (UTC)
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3774.namprd12.prod.outlook.com (10.255.236.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Thu, 4 Jul 2019 03:02:16 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::154f:3d2f:d2ca:3a6e]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::154f:3d2f:d2ca:3a6e%3]) with mapi id 15.20.2032.019; Thu, 4 Jul 2019
 03:02:16 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: add temperature sensor support for navi10
Thread-Topic: [PATCH] drm/amd/powerplay: add temperature sensor support for
 navi10
Thread-Index: AQHVMhTiewEBneOXl0qVaHyaOFX/6w==
Date: Thu, 4 Jul 2019 03:02:16 +0000
Message-ID: <20190704030151.6934-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR04CA0059.apcprd04.prod.outlook.com
 (2603:1096:202:14::27) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.22.0
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b545d0c3-c046-4698-3deb-08d7002c052b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3774; 
x-ms-traffictypediagnostic: MN2PR12MB3774:
x-microsoft-antispam-prvs: <MN2PR12MB377430F9FD8B197B5BDE0F1CA2FA0@MN2PR12MB3774.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(136003)(376002)(39860400002)(366004)(199004)(189003)(2501003)(52116002)(99286004)(5660300002)(2906002)(1076003)(486006)(6506007)(386003)(53936002)(6512007)(2351001)(54906003)(7736002)(305945005)(6436002)(66556008)(66066001)(36756003)(50226002)(66446008)(64756008)(14454004)(2616005)(5640700003)(476003)(6486002)(72206003)(478600001)(316002)(66476007)(73956011)(66946007)(102836004)(81166006)(4326008)(86362001)(8676002)(81156014)(8936002)(25786009)(186003)(26005)(256004)(6116002)(3846002)(19627235002)(71200400001)(71190400001)(14444005)(68736007)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3774;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4pWRm6szLJxhXulBuAg3ZyqX8dOkNzs+tjzOgeXo3TQ9FjgiBq8a+aOarEh+/FSXIoDtd9xcg3KaplDIgi0xAQwQtHAMw1Y93wl8VJ+cbw1Ce7vzKlo1l6oFr8DR9FhdXTBrK98RHDDhJzzDAKo+Dw7UwLfEOiSRCQ+fxYGaqaQvEOLlESDnXRPP4ld87Pu9pf5fkIj+BGltcsjTBkHx7DnoZviNLiJnNLgP1OWvprm9W5UXyDbLZnqR/g18KcQyYFv+ojVELkWqbGvOpbvIpeN/MeJt+iPnom3F8FUQ0SHx8TtYf5M7xHn/tiJm8GmyyrX9prIPSfPTzZJ/a8ZutM7T7K+zAuLcHtVq104A5TLtHLzzt9O9P3tbPtVsIKTLF7h4tXAHJKE0b5X67Lscx78fsQKEFpcjZQ3oSIA3TIc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b545d0c3-c046-4698-3deb-08d7002c052b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 03:02:16.4743 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3774
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQ0fxF4rwCtmKZ/PFwFu8wMvRgRqn0a8Ta8uXrN8Yr4=;
 b=M0N3Go7+hfJxggL0w/5qUY/QJhAxwnUO/5Ja9TD6TMgt1lQzYQNhxJvS7WF0nojVX8kJyTK0ls9UXQT19vMH00ojgpFHL05Z2eLe6lCp3YLAXTnf9mWH5NoiIHAuB0ahTeVyDW1Bs9nZyRPfV9RK+RD/O8XUMovphNpHdTUqx0A=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>,
 "Kenenth.Feng@amd.com" <Kenenth.Feng@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

dGhlIGh3bW9uIGludGVyZmFjZSBuZWVkIHRlbXBlcmF0dXJlIHNlbnNvciB0eXBlIHN1cHBvcnQu
CjEuIFNFTlNPUl9IT1RTUE9UX1RFTVAKMi4gU0VOU09SX0VER0VfVEVNUChTRU5TT1JfR1BVX1RF
TVApCjMuIFNFTlNPUl9NRU1fVEVNUAoKQ2hhbmdlLUlkOiBJM2RiNzYyZTQwMzIwNzJmYWU2N2M5
NWI3YmE2ZDYyZTIwYWU1YmVhZApTaWduZWQtb2ZmLWJ5OiBLZXZpbiBXYW5nIDxrZXZpbjEud2Fu
Z0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQu
YyB8IDQyICsrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA0MiBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEw
X3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCmluZGV4
IDc1NzRhMDIzNTBjNi4uZDU4NzZjMjM5M2U3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvbmF2aTEwX3BwdC5jCkBAIC0xMjU1LDYgKzEyNTUsNDIgQEAgc3RhdGljIGludCBuYXZp
MTBfc2V0X3dhdGVybWFya3NfdGFibGUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCiAJcmV0dXJu
IDA7CiB9CiAKK3N0YXRpYyBpbnQgbmF2aTEwX3RoZXJtYWxfZ2V0X3RlbXBlcmF0dXJlKHN0cnVj
dCBzbXVfY29udGV4dCAqc211LAorCQkJCQkgICAgIGVudW0gYW1kX3BwX3NlbnNvcnMgc2Vuc29y
LAorCQkJCQkgICAgIHVpbnQzMl90ICp2YWx1ZSkKK3sKKwlTbXVNZXRyaWNzX3QgbWV0cmljczsK
KwlpbnQgcmV0ID0gMDsKKworCWlmICghdmFsdWUpCisJCXJldHVybiAtRUlOVkFMOworCisJcmV0
ID0gc211X3VwZGF0ZV90YWJsZShzbXUsIFNNVV9UQUJMRV9TTVVfTUVUUklDUywgKHZvaWQgKikm
bWV0cmljcywgZmFsc2UpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CisKKwlzd2l0Y2ggKHNl
bnNvcikgeworCWNhc2UgQU1ER1BVX1BQX1NFTlNPUl9IT1RTUE9UX1RFTVA6CisJCSp2YWx1ZSA9
IG1ldHJpY3MuVGVtcGVyYXR1cmVIb3RzcG90ICoKKwkJCVNNVV9URU1QRVJBVFVSRV9VTklUU19Q
RVJfQ0VOVElHUkFERVM7CisJCWJyZWFrOworCWNhc2UgQU1ER1BVX1BQX1NFTlNPUl9HUFVfVEVN
UDoKKwljYXNlIEFNREdQVV9QUF9TRU5TT1JfRURHRV9URU1QOgorCQkqdmFsdWUgPSBtZXRyaWNz
LlRlbXBlcmF0dXJlRWRnZSAqCisJCQlTTVVfVEVNUEVSQVRVUkVfVU5JVFNfUEVSX0NFTlRJR1JB
REVTOworCQlicmVhazsKKwljYXNlIEFNREdQVV9QUF9TRU5TT1JfTUVNX1RFTVA6CisJCSp2YWx1
ZSA9IG1ldHJpY3MuVGVtcGVyYXR1cmVWck1lbTAgKgorCQkJU01VX1RFTVBFUkFUVVJFX1VOSVRT
X1BFUl9DRU5USUdSQURFUzsKKwkJYnJlYWs7CisJZGVmYXVsdDoKKwkJcHJfZXJyKCJJbnZhbGlk
IHNlbnNvciBmb3IgcmV0cmlldmluZyB0ZW1wXG4iKTsKKwkJcmV0dXJuIC1FSU5WQUw7CisJfQor
CisJcmV0dXJuIDA7Cit9CisKIHN0YXRpYyBpbnQgbmF2aTEwX3JlYWRfc2Vuc29yKHN0cnVjdCBz
bXVfY29udGV4dCAqc211LAogCQkJCSBlbnVtIGFtZF9wcF9zZW5zb3JzIHNlbnNvciwKIAkJCQkg
dm9pZCAqZGF0YSwgdWludDMyX3QgKnNpemUpCkBAIC0xMjc2LDYgKzEzMTIsMTIgQEAgc3RhdGlj
IGludCBuYXZpMTBfcmVhZF9zZW5zb3Ioc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCiAJCXJldCA9
IG5hdmkxMF9nZXRfZ3B1X3Bvd2VyKHNtdSwgKHVpbnQzMl90ICopZGF0YSk7CiAJCSpzaXplID0g
NDsKIAkJYnJlYWs7CisJY2FzZSBBTURHUFVfUFBfU0VOU09SX0hPVFNQT1RfVEVNUDoKKwljYXNl
IEFNREdQVV9QUF9TRU5TT1JfRURHRV9URU1QOgorCWNhc2UgQU1ER1BVX1BQX1NFTlNPUl9NRU1f
VEVNUDoKKwkJcmV0ID0gbmF2aTEwX3RoZXJtYWxfZ2V0X3RlbXBlcmF0dXJlKHNtdSwgc2Vuc29y
LCAodWludDMyX3QgKilkYXRhKTsKKwkJKnNpemUgPSA0OworCQlicmVhazsKIAlkZWZhdWx0Ogog
CQlyZXR1cm4gLUVJTlZBTDsKIAl9Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
