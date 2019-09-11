Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE8BAFBE3
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Sep 2019 13:50:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4793E6EAB3;
	Wed, 11 Sep 2019 11:50:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790081.outbound.protection.outlook.com [40.107.79.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA6E6EAB6
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Sep 2019 11:50:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JFfybViNYqh2afFD0Zfz3+6KcwWVpOba8Idw0bKlLhes/LK3pLr1wKf5ZuaA/HdtZDzTwsj9JoYnvFptuvD13Y7swXx8ITN0dnnZpNUjyhLqBrKdkuNNZ3S7k/PWerCSKqKaoUAK941IaU61JZ3dFjaPYlSK22+UMGRX3po+1e7mNuF79uskNtcJLiJ+PUIRgx5lrU22NJ6iFtwu/xsPGjA7wNrH38Ed2+R7tmv8W+mCa+pa5VVfrUs4DwVM4g8Wzmy31Gf8GBP51mGQiobno4PzLnsj0kH+jPTnXYaNS/c/0EbpFDuJmEj4ofzvYuxN1sPpKAXOMtsOo7XavUUdsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UK/TDtoVNnA3R6Mz9Ewbl5fp8WBQ0KGHWEPH4w1nrdA=;
 b=e8zXKMhnfB4Fx9I7l4U84oPgGZyHHxhZWkCFl00R/WVNt3DijVsWezm30ACx/GkrlcdY/K2qRKzDhJYNu/MCe2pcvMMpcLCGU8rCQt5CjQ3pkh9cvt4H8Gcw5aJF2kUaQXNDSQtD/vZKZsxlt6km4vNMrazMEmQU3B1lIh9F8Md1uSzKlEilGTV7MhM5rLjnQB2zPys1Oce12Ne6tXUkNA+B5yMGEKLeGxHyo2VXpHC2bQASAztNqyl0JATBU3snj8NaPrlTR4uuGA4KOWyGGTjD18M0y15DN4Q+3mdbRKgXMuw6HaNFGJen2R5P3wWeCC74wukc9nphJvT4t3TX3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB4224.namprd12.prod.outlook.com (52.135.51.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Wed, 11 Sep 2019 11:50:37 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed%6]) with mapi id 15.20.2241.018; Wed, 11 Sep 2019
 11:50:37 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amd/powerplay: check SMU engine readiness before
 proceeding on S3 resume
Thread-Topic: [PATCH 2/2] drm/amd/powerplay: check SMU engine readiness before
 proceeding on S3 resume
Thread-Index: AQHVaJcgVDeXMUjCA0+0oWhZDqflFg==
Date: Wed, 11 Sep 2019 11:50:36 +0000
Message-ID: <20190911115001.13864-2-evan.quan@amd.com>
References: <20190911115001.13864-1-evan.quan@amd.com>
In-Reply-To: <20190911115001.13864-1-evan.quan@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0149.apcprd02.prod.outlook.com
 (2603:1096:202:16::33) To MN2PR12MB3344.namprd12.prod.outlook.com
 (2603:10b6:208:c5::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7488ceea-ada2-4eda-8d70-08d736ae426e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4224; 
x-ms-traffictypediagnostic: MN2PR12MB4224:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB422444C37AEDBEB04B178367E4B10@MN2PR12MB4224.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(136003)(366004)(39860400002)(189003)(199004)(3846002)(5660300002)(66556008)(476003)(6512007)(71200400001)(6486002)(7736002)(2501003)(486006)(1076003)(305945005)(66446008)(11346002)(6506007)(446003)(71190400001)(52116002)(2351001)(14454004)(2906002)(99286004)(26005)(478600001)(14444005)(102836004)(25786009)(256004)(186003)(50226002)(2616005)(386003)(6916009)(76176011)(5640700003)(6116002)(8676002)(316002)(8936002)(86362001)(66066001)(36756003)(81156014)(81166006)(53936002)(4326008)(54906003)(6436002)(66476007)(66946007)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4224;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8oHOlo5mVHq+02hcJD0EhwiDKYLJtabqy/iAV6ajUoKYN47G5vU5wevLG7yrJCNDBvK8jGriKoiyInb2Z74xxCYjP37PPjt4pc5vniVcDbLUsPS++KpCpyjjKYaQwHb+EGhJN6SjZCEGAf2HabLifHNRri+xIuQXYcJ934dD77q3pr39Ll8xueysImiCVqAeuRMTMNJOsOZGN91d7Bj4eZdRDRUERXgjWJPGQzIV/W68dtWs9kehryGaBupVSg4a7E9RFH/q4Crnn0cq8tSsJlctRcn2SycHmYqx+gTBVEWaKoEvYD8XknwzSkCAMIJh6rhi5/N0QzZXTynKnCmhWToWQmMO6EFtOAsOuuXrAsfuBsQMpHrtPvqDEd3ibDzbk/3YsBzR+do+irh4MKGC1EkIREBvA/Y4SoPPsypCZ04=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7488ceea-ada2-4eda-8d70-08d736ae426e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 11:50:36.7482 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dnamhD5Fygsh62dO1/fjW5V67ClVU9o+c+JcQF8RgLnBcLxwvJpM7gzKabCcadLu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4224
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UK/TDtoVNnA3R6Mz9Ewbl5fp8WBQ0KGHWEPH4w1nrdA=;
 b=HlE/GbfE+1+udY/wzuAXWfrGgI1dmRPSF+UTtYYlWxmdp4hGfM7MwkyYamVlgdUtnSm5FH2grvGiw+4vxR6RXoqJZlDg22Qzv/8t8IMe1YgpDFrzqvzv0ug5PXpRz9v3H42of7gyysDeKybyaX2YxbUL/ElupO5q99Ip2Zm/VZY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Ma, Le" <Le.Ma@amd.com>,
 "Quan, Evan" <Evan.Quan@amd.com>, "Gui, Jack" <Jack.Gui@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBpcyBlc3BlY2lhbGx5IG5lZWRlZCBmb3Igbm9uLXBzcCBsb2FkaW5nIHdheS4KCkNoYW5n
ZS1JZDogSTFlNTIzMTY4ZWQ0ODkyYzM0YzhjYmI2NjA3N2MzZjkyODhkZDgwMDYKU2lnbmVkLW9m
Zi1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgfCAyOCArKysrKysrKysrKysrKysrKystLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKaW5kZXggMjVmM2M5ZTFiNDA0Li45
NTk2OWM5OGExMDggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2Ft
ZGdwdV9zbXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211
LmMKQEAgLTEyMTMsMTEgKzEyMTMsMTAgQEAgc3RhdGljIGludCBzbXVfZnJlZV9tZW1vcnlfcG9v
bChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKIAlyZXR1cm4gcmV0OwogfQogCi1zdGF0aWMgaW50
IHNtdV9od19pbml0KHZvaWQgKmhhbmRsZSkKK3N0YXRpYyBpbnQgc211X3N0YXJ0X3NtY19lbmdp
bmUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCiB7Ci0JaW50IHJldDsKLQlzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqKWhhbmRsZTsKLQlzdHJ1Y3Qg
c211X2NvbnRleHQgKnNtdSA9ICZhZGV2LT5zbXU7CisJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYgPSBzbXUtPmFkZXY7CisJaW50IHJldCA9IDA7CiAKIAlpZiAoYWRldi0+ZmlybXdhcmUubG9h
ZF90eXBlICE9IEFNREdQVV9GV19MT0FEX1BTUCkgewogCQlpZiAoYWRldi0+YXNpY190eXBlIDwg
Q0hJUF9OQVZJMTApIHsKQEAgLTEyMjgsOCArMTIyNywyMSBAQCBzdGF0aWMgaW50IHNtdV9od19p
bml0KHZvaWQgKmhhbmRsZSkKIAl9CiAKIAlyZXQgPSBzbXVfY2hlY2tfZndfc3RhdHVzKHNtdSk7
CisJaWYgKHJldCkKKwkJcHJfZXJyKCJTTUMgaXMgbm90IHJlYWR5XG4iKTsKKworCXJldHVybiBy
ZXQ7Cit9CisKK3N0YXRpYyBpbnQgc211X2h3X2luaXQodm9pZCAqaGFuZGxlKQoreworCWludCBy
ZXQ7CisJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KiloYW5kbGU7CisJc3RydWN0IHNtdV9jb250ZXh0ICpzbXUgPSAmYWRldi0+c211OworCisJcmV0
ID0gc211X3N0YXJ0X3NtY19lbmdpbmUoc211KTsKIAlpZiAocmV0KSB7Ci0JCXByX2VycigiU01D
IGZpcm13YXJlIHN0YXR1cyBpcyBub3QgY29ycmVjdFxuIik7CisJCXByX2VycigiU01VIGlzIG5v
dCByZWFkeSB5ZXQhXG4iKTsKIAkJcmV0dXJuIHJldDsKIAl9CiAKQEAgLTEzODksNiArMTQwMSwx
MiBAQCBzdGF0aWMgaW50IHNtdV9yZXN1bWUodm9pZCAqaGFuZGxlKQogCiAJbXV0ZXhfbG9jaygm
c211LT5tdXRleCk7CiAKKwlyZXQgPSBzbXVfc3RhcnRfc21jX2VuZ2luZShzbXUpOworCWlmIChy
ZXQpIHsKKwkJcHJfZXJyKCJTTVUgaXMgbm90IHJlYWR5IHlldCFcbiIpOworCQlyZXR1cm4gcmV0
OworCX0KKwogCXJldCA9IHNtdV9zbWNfdGFibGVfaHdfaW5pdChzbXUsIGZhbHNlKTsKIAlpZiAo
cmV0KQogCQlnb3RvIGZhaWxlZDsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
