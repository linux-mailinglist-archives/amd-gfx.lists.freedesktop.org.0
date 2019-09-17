Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2A3B45A3
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Sep 2019 04:54:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEF266EAC6;
	Tue, 17 Sep 2019 02:54:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690078.outbound.protection.outlook.com [40.107.69.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BEEE6EAC6
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 02:54:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jouSPjsTt44axSXa4BsuFQqzHwQpEGIJEveeeMBH45Sn3pC0eHPKkeju21gQQ+3iQ0bSY1euKSA+kqOMEpKalnu3klngDbsFENRl6dOWUu0jUT+TlnxsCVmOEaXd89chju3xsrPq6yn+LG7zd+fmlNn2KLFsTWYW3Siaalv7SnbGmyCjjq0hRua6ztEakUNxuJ4wxRGfV9A+LOBIINUbN6DqJlwL1K1m3ed4en3VqvcQfa9rpcKo3J7RfJbvrp04LFCSIaHLb4HOOR5SK2ilWWEkTKIHYTBWRyLZ5ZFvG9B+RZipwiX8D08NszeTqvQfW4oQzcOFRxJG5WruSr1VgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+TmWvdHpyKj27lVJWAk8ui0z2YvWe2ppbjlC0HgexJI=;
 b=gF/MEkZq29YyCco2FIYXTZdkJg8UigYZq5s4q4LoZsR2xqa9tEi7TeePgF6ed9rBTkm0y7IRa6BC9T/L+sqpGHnj8BIfPSqbE87LYDDkuYdvgWwar3IqqNCdcQC/ZuKb4U/huDnL6x1uVxu44UJPiASLcdaLLrKZPVZepKJd7Wcako3NOjvCptjtx8huWaY/YV4qY8f/ZOHg7Sygjtkusd0yuLM9aHAO1QBwXIQ3otc8wK5lZA1sE+XejxC752GA4gxyf8jZJLblCC+03tC0r+ppeQGB7+VrO3HlzEzcH5k+vavs4d13POsFK2eFjmbwNV6w2B6XYg5pNRHODemCmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3536.namprd12.prod.outlook.com (20.179.83.19) by
 MN2PR12MB3006.namprd12.prod.outlook.com (20.178.243.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Tue, 17 Sep 2019 02:54:08 +0000
Received: from MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41]) by MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41%7]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 02:54:08 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: implement VCN power gating control
 interface
Thread-Topic: [PATCH] drm/amd/powerplay: implement VCN power gating control
 interface
Thread-Index: AQHVbQMsQbXuyZm8QEWEg8BfaqYjsA==
Date: Tue, 17 Sep 2019 02:54:07 +0000
Message-ID: <1568688837-21350-1-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2P15301CA0014.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::24) To MN2PR12MB3536.namprd12.prod.outlook.com
 (2603:10b6:208:104::19)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2406179-046d-46a1-873c-08d73b1a4ef3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3006; 
x-ms-traffictypediagnostic: MN2PR12MB3006:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3006FCFBBCBAAE4CC20FD664FB8F0@MN2PR12MB3006.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(376002)(346002)(366004)(199004)(189003)(66476007)(66446008)(486006)(4326008)(64756008)(66946007)(66556008)(8936002)(25786009)(54906003)(476003)(316002)(66066001)(2616005)(478600001)(14454004)(6116002)(36756003)(8676002)(3846002)(2351001)(81166006)(81156014)(7736002)(305945005)(6512007)(6436002)(2906002)(26005)(6916009)(50226002)(52116002)(5640700003)(386003)(6506007)(5660300002)(99286004)(256004)(102836004)(186003)(6486002)(2501003)(86362001)(71200400001)(71190400001)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3006;
 H:MN2PR12MB3536.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9jbAPmjrHThhjJsBgqbLmhdpTjEoSTcQ/OCK+IlHDfWyOZAnLZa4H+JFvM3rtVZOBVr/TIa5JHnN4msjw2R7UZ/TrvG4Kd8yZ1rajbh1P5q6N5h6rvdJ63x/EffCUnZJ1m8Big9BsXbkEqi+sqruFcfS0g/av8iXcpkQO0mVwn5Qy/uyVrNneb6vLeqSRQ1z9UWfZr22k60LqJ5JKI8dAlG6tbmAJdYHLiL6zzSScRcu6M2H3qvZLEwxWDmUPHKaeoINAWEEBg+a/08D/i7HkBxGt66xbI90pCHRauf/KAJ1RqkXuEZNySt6WeQ62rsa78vqOjlbC989bTc+N+1zPwYniAl2AqF2ndnR0/mBSapDY6YoreqbJuCmx4/WBi9ExxSYDD65JyLsdBD7OVJNGbbVKsJKqP74VPL2irmSIUc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2406179-046d-46a1-873c-08d73b1a4ef3
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 02:54:08.0882 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TghU6V05mrT8KfIhJm4/YZpnHzKUf5uHy8/Gwc6vfQKIVb0gm52/HcpoUJFdOR1w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3006
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+TmWvdHpyKj27lVJWAk8ui0z2YvWe2ppbjlC0HgexJI=;
 b=CrAjHmyo4cd0pYs16a9wOrLMqXzgE1QUKE3/lKvag7qIYRd8GS8SVSaq7gS0392tKBvwZmRCwzQazMlapIgdtIVHsCGrIJwxv22PMCj02QhZ17lV4njpJcfWEm7VYvVNnvLDTK5j9xQ7IU8y4z6ftDLBacZ07T8ALQfTgApcI0A=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Prike.Liang@amd.com; 
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Liang,
 Prike" <Prike.Liang@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>, "Feng,
 Kenneth" <Kenneth.Feng@amd.com>, "Liu, Aaron" <Aaron.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VkNOIEdhdC9VbmdhdCBieSBwcm9jZXNzaW5nIHRoZSBTTVUgcG93ZXIgdXAvZG93biBtZXNzYWdl
LCBvdGhlcndpc2UKUzMgd2lsbCByZXN1bWUgZmFpbGVkIGFzIEpQRUcgYWx3YXlzIHBvd2VyIG9m
ZiBkdXJpbmcgc3RhcnQgVkNOIHN0YWdlLgoKU2lnbmVkLW9mZi1ieTogUHJpa2UgTGlhbmcgPFBy
aWtlLkxpYW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvcmVu
b2lyX3BwdC5jIHwgMjggKysrKysrKysrKysrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5n
ZWQsIDI3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9yZW5vaXJfcHB0LmMKaW5kZXggMmMyMmJhNC4uOTMxMWI2YSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvcmVub2lyX3BwdC5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Jlbm9pcl9wcHQuYwpAQCAtMjc4LDYgKzI3OCwzMiBA
QCBzdGF0aWMgZW51bSBhbWRfcG1fc3RhdGVfdHlwZSByZW5vaXJfZ2V0X2N1cnJlbnRfcG93ZXJf
c3RhdGUoc3RydWN0IHNtdV9jb250ZXh0CiAJcmV0dXJuIHBtX3R5cGU7CiB9CiAKK3N0YXRpYyBp
bnQgcmVub2lyX2RwbV9zZXRfdXZkX2VuYWJsZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgYm9v
bCBlbmFibGUpCit7CisJc3RydWN0IHNtdV9wb3dlcl9jb250ZXh0ICpzbXVfcG93ZXIgPSAmc211
LT5zbXVfcG93ZXI7CisJc3RydWN0IHNtdV9wb3dlcl9nYXRlICpwb3dlcl9nYXRlID0gJnNtdV9w
b3dlci0+cG93ZXJfZ2F0ZTsKKwlpbnQgcmV0ID0gMDsKKworCWlmIChlbmFibGUpIHsKKwkJLyog
dmNuIGRwbSBvbiBpcyBhIHByZXJlcXVpc2l0ZSBmb3IgdmNuIHBvd2VyIGdhdGUgbWVzc2FnZXMg
Ki8KKwkJaWYgKHNtdV9mZWF0dXJlX2lzX2VuYWJsZWQoc211LCBTTVVfRkVBVFVSRV9WQ05fUEdf
QklUKSkgeworCQkJcmV0ID0gc211X3NlbmRfc21jX21zZ193aXRoX3BhcmFtKHNtdSwgU01VX01T
R19Qb3dlclVwVmNuLCAxKTsKKwkJCWlmIChyZXQpCisJCQkJcmV0dXJuIHJldDsKKwkJfQorCQlw
b3dlcl9nYXRlLT52Y25fZ2F0ZWQgPSBmYWxzZTsKKwl9IGVsc2UgeworCQlpZiAoc211X2ZlYXR1
cmVfaXNfZW5hYmxlZChzbXUsIFNNVV9GRUFUVVJFX1ZDTl9QR19CSVQpKSB7CisJCQlyZXQgPSBz
bXVfc2VuZF9zbWNfbXNnKHNtdSwgU01VX01TR19Qb3dlckRvd25WY24pOworCQkJaWYgKHJldCkK
KwkJCQlyZXR1cm4gcmV0OworCQl9CisJCXBvd2VyX2dhdGUtPnZjbl9nYXRlZCA9IHRydWU7CisJ
fQorCisJcmV0dXJuIHJldDsKK30KKwogc3RhdGljIGNvbnN0IHN0cnVjdCBwcHRhYmxlX2Z1bmNz
IHJlbm9pcl9wcHRfZnVuY3MgPSB7CiAJLmdldF9zbXVfbXNnX2luZGV4ID0gcmVub2lyX2dldF9z
bXVfbXNnX2luZGV4LAogCS5nZXRfc211X3RhYmxlX2luZGV4ID0gcmVub2lyX2dldF9zbXVfdGFi
bGVfaW5kZXgsCkBAIC0yODYsNyArMzEyLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwcHRhYmxl
X2Z1bmNzIHJlbm9pcl9wcHRfZnVuY3MgPSB7CiAJLmdldF9kcG1fdWNsa19saW1pdGVkID0gcmVu
b2lyX2dldF9kcG1fdWNsa19saW1pdGVkLAogCS5wcmludF9jbGtfbGV2ZWxzID0gcmVub2lyX3By
aW50X2Nsa19sZXZlbHMsCiAJLmdldF9jdXJyZW50X3Bvd2VyX3N0YXRlID0gcmVub2lyX2dldF9j
dXJyZW50X3Bvd2VyX3N0YXRlLAotCisJLmRwbV9zZXRfdXZkX2VuYWJsZSA9IHJlbm9pcl9kcG1f
c2V0X3V2ZF9lbmFibGUsCiB9OwogCiB2b2lkIHJlbm9pcl9zZXRfcHB0X2Z1bmNzKHN0cnVjdCBz
bXVfY29udGV4dCAqc211KQotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
