Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCFCB73CC
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 09:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994CB6F930;
	Thu, 19 Sep 2019 07:12:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700056.outbound.protection.outlook.com [40.107.70.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A88A6F930
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 07:12:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NmJ+xOWQxEGe37hpGvMg1GqoRm/OaHc/PQ+fhPEhMopzxHmheo0mA1EWAIDobol8Y96PmTzPSgdkdmR4o2PK8DXWzFqvJdk0ny9/i0VOH/7W8SErl6JaPYKkf/O+agXsddhhXCBwQpivhoSyzORDMwkrswoWQL1DQtjQ3roFHoMJ4RPrE+cQRo69T5gaOvrAsTBWf13S9lN/LtVlLzFrziwJjrIqbrmzVkKUwDfypkcG8uqGZHB/AApBYCpyaJKN9R95ogdNmPucPvDsTxmtclWhc+jOsOri0ELompSwDMIPSXwpukYlrFKX+EOqWoCJqz0T0lWOS1IU8bZ6fy4RAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQ7glyftSP2e9JCd0pc++ui6cBeP5iNQ+nBtXg6IXSU=;
 b=aZjefyBiMmJ4+6UuggAC+Td/aTwupycjRMudp8OV1ZTHBe1Xgn2rH5bNSB9aI26uBmU1eVTf/7UpfX0vi55sZ5mv+q3gq5cRi2TznSR5qUl9zbJuwUHrKcIhjQdkwtM+qdkMqZSX3x9NqNYrSfkjmV79iwxFVPdvr5XvP0P5ZMCEiD8r4uD4IwDLeHsHXz08NVsB2c6AFXh4ahKXMHrtL4DY9a2IU/fBeG99Fw07i794gRX+mRmTZCPPoFKdXqgJWPvb+DZHpxZWXbWX3DFaJjm+jXvuD10dLeeGrKO5I8MZZev5Z4SkYbBx0HtD8YoDh2fxqwkH38BYIhX+rRuRbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB2894.namprd12.prod.outlook.com (20.179.84.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Thu, 19 Sep 2019 07:12:54 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 07:12:53 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: [PATCH 11/21] drm/amdgpu: add common gfx_ras_fini function
Thread-Topic: [PATCH 11/21] drm/amdgpu: add common gfx_ras_fini function
Thread-Index: AQHVbrmnsWdXo21mYEuIaZV8FiS/jw==
Date: Thu, 19 Sep 2019 07:12:53 +0000
Message-ID: <20190919071115.16552-12-tao.zhou1@amd.com>
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
x-ms-office365-filtering-correlation-id: 43d8e921-8722-469b-9a08-08d73cd0c9e8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB2894; 
x-ms-traffictypediagnostic: MN2PR12MB2894:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2894691313D74AB36760093EB0890@MN2PR12MB2894.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:765;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(199004)(189003)(186003)(6506007)(102836004)(6512007)(316002)(8676002)(81156014)(64756008)(446003)(2501003)(52116002)(11346002)(476003)(2616005)(66446008)(86362001)(8936002)(5660300002)(66946007)(66476007)(81166006)(66556008)(50226002)(3846002)(2906002)(486006)(76176011)(99286004)(110136005)(6116002)(25786009)(7736002)(256004)(1076003)(66066001)(26005)(14454004)(386003)(6436002)(6486002)(4326008)(478600001)(71190400001)(71200400001)(6636002)(305945005)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2894;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CK/oYLWFddxiy1aPavXEI0sF+2g59NsncMb6G6lgHMnz0MhgjGCh1OywNMUpKwspk58Iemw3LI48vmpUfwEF30RpWrSQJ83rM9hN5gA//Lc+3RUoL141KnNMtYkm2s4+vgEe+4g8x+0rYhiGq4ClxN2J5X9z4XaHTQIMjaIoInYfz7JIwCZR0iNcj0g/wAdAjvuS7o+YVFCg4GORAoXlTrnW8+kHCq2/S/ZPgp9T/Rp+HAJn68TtcK4N2B3+tzrBV6h3hdfyMRDBCwohx2L2XYNrX604k7adiMWI+bwcHxHSswbfgyl3NJjXRuAiISeko1Ohq60pzhdZQw9zqFoKvK7XxZbY0ijr37PLnICOIwHSvfM3mUKOJmCJNFaPjbuyHylK3cozTB9LgEvSHDMezoLEBfuTDuXSsGaGOkEEv84=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43d8e921-8722-469b-9a08-08d73cd0c9e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 07:12:53.7371 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K9nlKG6/DD+ownmExFjXzwS15Da82JZ2Gc3QWLv5sz7K1cF2R5gPTBlOiP3puOnj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2894
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQ7glyftSP2e9JCd0pc++ui6cBeP5iNQ+nBtXg6IXSU=;
 b=dajFq/1+mZO/sAlfeFE5N4rkGOPfsdopVSIhN+mMWMtcrWknUqjhM5h62/68GCKKtbXFFklNXbctfmMxg6ErSsIxxU85WuHFxHor8VJAEjqKsYLVW/Gv6j6e8s8yiQ46XFMMIgEFDGVhWjU9zdUQMQk/LveOuw9eu0zzSQOgCHE=
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

Z2Z4X3Jhc19maW5pIGNhbiBiZSBzaGFyZWQgYW1vbmcgYWxsIGdlbmVyYXRpb25zIG9mIGdmeAoK
U2lnbmVkLW9mZi1ieTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguYyB8IDE1ICsrKysrKysrKysrKysrKwogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5oIHwgIDEgKwogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyAgIHwgMTQgKy0tLS0tLS0tLS0tLS0KIDMgZmlsZXMg
Y2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5jCmluZGV4IGU3ZDg3ZjcxNzczNy4uNGY2MzVmMjhlYjM0
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5jCkBAIC02NTEsMyArNjUx
LDE4IEBAIGludCBhbWRncHVfZ2Z4X2NwX2VjY19lcnJvcl9pcnEoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsCiAJYW1kZ3B1X3Jhc19pbnRlcnJ1cHRfZGlzcGF0Y2goYWRldiwgJmloX2RhdGEp
OwogCXJldHVybiAwOwogfQorCit2b2lkIGFtZGdwdV9nZnhfcmFzX2Zpbmkoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpCit7CisJaWYgKGFtZGdwdV9yYXNfaXNfc3VwcG9ydGVkKGFkZXYsIEFN
REdQVV9SQVNfQkxPQ0tfX0dGWCkgJiYKKwkJCWFkZXYtPmdmeC5yYXNfaWYpIHsKKwkJc3RydWN0
IHJhc19jb21tb25faWYgKnJhc19pZiA9IGFkZXYtPmdmeC5yYXNfaWY7CisJCXN0cnVjdCByYXNf
aWhfaWYgaWhfaW5mbyA9IHsKKwkJCS5oZWFkID0gKnJhc19pZiwKKwkJCS5jYiA9IGFtZGdwdV9n
ZnhfcHJvY2Vzc19yYXNfZGF0YV9jYiwKKwkJfTsKKworCQlhbWRncHVfcmFzX2xhdGVfZmluaShh
ZGV2LCByYXNfaWYsICZpaF9pbmZvKTsKKwkJa2ZyZWUocmFzX2lmKTsKKwl9Cit9CmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmggYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmgKaW5kZXggNjAwNTk5MTgxNjIwLi44ZjJkMTM3
ZjRkMjAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZngu
aAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmgKQEAgLTM5MSw0
ICszOTEsNSBAQCBpbnQgYW1kZ3B1X2dmeF9wcm9jZXNzX3Jhc19kYXRhX2NiKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LAogaW50IGFtZGdwdV9nZnhfY3BfZWNjX2Vycm9yX2lycShzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwKIAkJCQkgIHN0cnVjdCBhbWRncHVfaXJxX3NyYyAqc291cmNl
LAogCQkJCSAgc3RydWN0IGFtZGdwdV9pdl9lbnRyeSAqZW50cnkpOwordm9pZCBhbWRncHVfZ2Z4
X3Jhc19maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKICNlbmRpZgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKaW5kZXggMDhiODAxNTdkZjNhLi5hYmRiZDY5Mzk0ZTYg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYwpAQCAtMjMxNywxOSArMjMxNyw3
IEBAIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfc3dfZmluaSh2b2lkICpoYW5kbGUpCiAJaW50IGk7CiAJ
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKiloYW5k
bGU7CiAKLQlpZiAoYW1kZ3B1X3Jhc19pc19zdXBwb3J0ZWQoYWRldiwgQU1ER1BVX1JBU19CTE9D
S19fR0ZYKSAmJgotCQkJYWRldi0+Z2Z4LnJhc19pZikgewotCQlzdHJ1Y3QgcmFzX2NvbW1vbl9p
ZiAqcmFzX2lmID0gYWRldi0+Z2Z4LnJhc19pZjsKLQkJc3RydWN0IHJhc19paF9pZiBpaF9pbmZv
ID0gewotCQkJLmhlYWQgPSAqcmFzX2lmLAotCQl9OwotCi0JCWFtZGdwdV9yYXNfZGVidWdmc19y
ZW1vdmUoYWRldiwgcmFzX2lmKTsKLQkJYW1kZ3B1X3Jhc19zeXNmc19yZW1vdmUoYWRldiwgcmFz
X2lmKTsKLQkJYW1kZ3B1X3Jhc19pbnRlcnJ1cHRfcmVtb3ZlX2hhbmRsZXIoYWRldiwgICZpaF9p
bmZvKTsKLQkJYW1kZ3B1X3Jhc19mZWF0dXJlX2VuYWJsZShhZGV2LCByYXNfaWYsIDApOwotCQlr
ZnJlZShyYXNfaWYpOwotCX0KKwlhbWRncHVfZ2Z4X3Jhc19maW5pKGFkZXYpOwogCiAJZm9yIChp
ID0gMDsgaSA8IGFkZXYtPmdmeC5udW1fZ2Z4X3JpbmdzOyBpKyspCiAJCWFtZGdwdV9yaW5nX2Zp
bmkoJmFkZXYtPmdmeC5nZnhfcmluZ1tpXSk7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
