Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F7BB73C4
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 09:12:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E6326F8D0;
	Thu, 19 Sep 2019 07:12:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700062.outbound.protection.outlook.com [40.107.70.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6590C6F8B7
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 07:12:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LDVo5skpv2iD/g+MjCAaO0b5nilIWGaPdfYQeoZYHjnyf94+mQjZv90Gold8JCiu5OARr2ZLakhF7uJLDHohiM7w/T8b8lwnugZRrwK1ykgqdAAe6NHddWogkSbryzVMsFUwDpfwNq2N9gnBJ2/JpT7IJz9XHmk1wARTlJ25rhreBOBK1Mcq8j7GJKUgBXI+TJRJbWkhI6t9rAzv9BWZUZHnuqvMTHwsACb33SHoG15SXjcrkHL2Wvf9qk/gMXSbM+18PgLxWFylwKFYTsNTgdZ3C52FZ3OHAG9OFQk1Xu+t3TB8jF0Rgf3I48bn7qpPEeyldFVNJpHyaQg3iS3HyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pdrv04aBXjAlfMpY3qcSMhKmQfGNphvmnz+7/JE64T4=;
 b=hzlbzoFBtnKjl4vZMMaF+hthwj/uGdzW+Wa8NgkycWTOWLtdpSZ3s77kptvbHbEm5orNHYXGhdYfRWOkMtan2lec8SFP4e91nKQk3tP4vn3+A2vD2qbSsE4mShGbZq9m9xLh420dLHnGbVb+ik4peJK5PxmtGiGTcTBodgdQ8EjeD80bA5dhumJFE56Ay9H01ItRL755TKjv92xA8IOm80FfcAFzXKPVcYIs6mLAUvZQqmvOPzV4nkfauEirEslm170UF5rvh1yLoqN+D3FCMc0bZQWDEfGQwLYATUKhZqBIxERiFQrws49s6RY0BR+cAbSepLwV8cDOnwTdz8vvvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB2894.namprd12.prod.outlook.com (20.179.84.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Thu, 19 Sep 2019 07:12:35 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 07:12:35 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: [PATCH 03/21] drm/amdgpu: move gfx ecc functions to generic gfx file
Thread-Topic: [PATCH 03/21] drm/amdgpu: move gfx ecc functions to generic gfx
 file
Thread-Index: AQHVbrmcBBUiI64cBEeCeFm6YHXvOw==
Date: Thu, 19 Sep 2019 07:12:34 +0000
Message-ID: <20190919071115.16552-4-tao.zhou1@amd.com>
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
x-ms-office365-filtering-correlation-id: f4cc322f-39f8-446e-a032-08d73cd0be8d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB2894; 
x-ms-traffictypediagnostic: MN2PR12MB2894:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2894A6E621936249476AD8D4B0890@MN2PR12MB2894.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:243;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(199004)(189003)(186003)(6506007)(102836004)(6512007)(316002)(8676002)(81156014)(64756008)(446003)(2501003)(52116002)(11346002)(476003)(2616005)(66446008)(86362001)(8936002)(5660300002)(66946007)(66476007)(81166006)(66556008)(50226002)(3846002)(2906002)(486006)(76176011)(99286004)(110136005)(6116002)(25786009)(7736002)(256004)(1076003)(66066001)(26005)(14454004)(386003)(6436002)(6486002)(4326008)(478600001)(71190400001)(71200400001)(6636002)(305945005)(36756003)(41533002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2894;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: h5ivjPDlWEPJogcN859SF5G9cUohCUp/jLtvYBfb2m/MBVjgFICotYQyPUbaK9E6ejCy+cx08DYmV9GUshD/JLQWHh38UqWCaXSE9UtszLl0pIG/Jyf77kIet31vCzmrO7VdasPFv8O5nhIBGff1jopSPl09GjO9PL768vw8OWSSbpM6lTEaiT4dHSZhhGp1HoFEq+eNfUSGNxJHi4PbG28JGY9ecE0Sp0XHKMPsNdCDNNB5vq2VP5Gbwms1DVIKMlgW7vByksB6A7P4hk53nUnZDUnFa9dRsz54j4FpBeQY9XYE/Vw/P3gCp+/XZD3NUVHxENow5HQJ2B3edXD51YIPy74qBGkH3AJe/wK0zoQNQQgY1B2Umo9gHAEhejUXqmGiwGBE3bdJFwO3+nNj0FhtVwywHLxMecCtxFD3uDo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4cc322f-39f8-446e-a032-08d73cd0be8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 07:12:34.7869 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sa9A/Po67id705gB17iFzBLDYpZFaRgCnjvEIaJdk5vXbJHMNmSyGAcyYvi75PGj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2894
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pdrv04aBXjAlfMpY3qcSMhKmQfGNphvmnz+7/JE64T4=;
 b=29VFwy0dIpUkJokKxC95iprYKIvVBG8FZovo/QewB2D51ILwh8M3sU8jWlnXIpi1ZiE464+Kkdb/a4XetYAkFoqHROLvJG2s9wfByApivMOm2hitNAsqB/f8kVwzuIqWnNVcxT1c5kCuD4Yb+v3G7dtuMG5kaQzH/S94KojyMco=
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

Z2Z4IHJhcyBlY2MgY29tbW9uIGZ1bmN0aW9ucyBjb3VsZCBiZSByZXVzZWQgYW1vbmcgYWxsIGdm
eCBnZW5lcmF0aW9ucwoKU2lnbmVkLW9mZi1ieTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguYyB8IDMzICsrKysr
KysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4Lmgg
fCAgNiArKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jICAgfCA0MSAr
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDQxIGluc2VydGlvbnMo
KyksIDM5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9nZnguYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZngu
YwppbmRleCA1MDhkNTIxYTBlNTkuLmU3ZDg3ZjcxNzczNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9nZnguYwpAQCAtNjE4LDMgKzYxOCwzNiBAQCBpbnQgYW1kZ3B1X2dmeF9y
YXNfbGF0ZV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCWFkZXYtPmdmeC5yYXNf
aWYgPSBOVUxMOwogCXJldHVybiByOwogfQorCitpbnQgYW1kZ3B1X2dmeF9wcm9jZXNzX3Jhc19k
YXRhX2NiKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAorCQl2b2lkICplcnJfZGF0YSwKKwkJ
c3RydWN0IGFtZGdwdV9pdl9lbnRyeSAqZW50cnkpCit7CisJLyogVE9ETyB1ZSB3aWxsIHRyaWdn
ZXIgYW4gaW50ZXJydXB0LiAqLworCWlmICghYW1kZ3B1X3Jhc19pc19zdXBwb3J0ZWQoYWRldiwg
QU1ER1BVX1JBU19CTE9DS19fR0ZYKSkgeworCQlrZ2Qya2ZkX3NldF9zcmFtX2VjY19mbGFnKGFk
ZXYtPmtmZC5kZXYpOworCQlpZiAoYWRldi0+Z2Z4LmZ1bmNzLT5xdWVyeV9yYXNfZXJyb3JfY291
bnQpCisJCQlhZGV2LT5nZnguZnVuY3MtPnF1ZXJ5X3Jhc19lcnJvcl9jb3VudChhZGV2LCBlcnJf
ZGF0YSk7CisJCWFtZGdwdV9yYXNfcmVzZXRfZ3B1KGFkZXYsIDApOworCX0KKwlyZXR1cm4gQU1E
R1BVX1JBU19TVUNDRVNTOworfQorCitpbnQgYW1kZ3B1X2dmeF9jcF9lY2NfZXJyb3JfaXJxKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAorCQkJCSAgc3RydWN0IGFtZGdwdV9pcnFfc3JjICpz
b3VyY2UsCisJCQkJICBzdHJ1Y3QgYW1kZ3B1X2l2X2VudHJ5ICplbnRyeSkKK3sKKwlzdHJ1Y3Qg
cmFzX2NvbW1vbl9pZiAqcmFzX2lmID0gYWRldi0+Z2Z4LnJhc19pZjsKKwlzdHJ1Y3QgcmFzX2Rp
c3BhdGNoX2lmIGloX2RhdGEgPSB7CisJCS5lbnRyeSA9IGVudHJ5LAorCX07CisKKwlpZiAoIXJh
c19pZikKKwkJcmV0dXJuIDA7CisKKwlpaF9kYXRhLmhlYWQgPSAqcmFzX2lmOworCisJRFJNX0VS
Uk9SKCJDUCBFQ0MgRVJST1IgSVJRXG4iKTsKKwlhbWRncHVfcmFzX2ludGVycnVwdF9kaXNwYXRj
aChhZGV2LCAmaWhfZGF0YSk7CisJcmV0dXJuIDA7Cit9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZ2Z4LmgKaW5kZXggNmVkMDU2MGQ3Mjk5Li42MDA1OTkxODE2MjAgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguaAorKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmgKQEAgLTM4NSw0ICszODUsMTAgQEAgYm9v
bCBhbWRncHVfZ2Z4X2lzX21lX3F1ZXVlX2VuYWJsZWQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYsIGludCBtZSwKIHZvaWQgYW1kZ3B1X2dmeF9vZmZfY3RybChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwgYm9vbCBlbmFibGUpOwogaW50IGFtZGdwdV9nZnhfcmFzX2xhdGVfaW5pdChzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJCSAgICAgdm9pZCAqcmFzX2loX2luZm8pOworaW50
IGFtZGdwdV9nZnhfcHJvY2Vzc19yYXNfZGF0YV9jYihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diwKKwkJdm9pZCAqZXJyX2RhdGEsCisJCXN0cnVjdCBhbWRncHVfaXZfZW50cnkgKmVudHJ5KTsK
K2ludCBhbWRncHVfZ2Z4X2NwX2VjY19lcnJvcl9pcnEoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYsCisJCQkJICBzdHJ1Y3QgYW1kZ3B1X2lycV9zcmMgKnNvdXJjZSwKKwkJCQkgIHN0cnVjdCBh
bWRncHVfaXZfZW50cnkgKmVudHJ5KTsKICNlbmRpZgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dm
eF92OV8wLmMKaW5kZXggNmQ4NDViM2JjNzYwLi4wOGI4MDE1N2RmM2EgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYwpAQCAtNDM4NSwxNSArNDM4NSwxMSBAQCBzdGF0aWMgaW50
IGdmeF92OV8wX2Vhcmx5X2luaXQodm9pZCAqaGFuZGxlKQogCXJldHVybiAwOwogfQogCi1zdGF0
aWMgaW50IGdmeF92OV8wX3Byb2Nlc3NfcmFzX2RhdGFfY2Ioc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsCi0JCXZvaWQgKmVycl9kYXRhLAotCQlzdHJ1Y3QgYW1kZ3B1X2l2X2VudHJ5ICplbnRy
eSk7Ci0KIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfZWNjX2xhdGVfaW5pdCh2b2lkICpoYW5kbGUpCiB7
CiAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKilo
YW5kbGU7CiAJc3RydWN0IHJhc19paF9pZiBpaF9pbmZvID0gewotCQkuY2IgPSBnZnhfdjlfMF9w
cm9jZXNzX3Jhc19kYXRhX2NiLAorCQkuY2IgPSBhbWRncHVfZ2Z4X3Byb2Nlc3NfcmFzX2RhdGFf
Y2IsCiAJfTsKIAlpbnQgcjsKIApAQCAtNTYzOCwyMCArNTYzNCw2IEBAIHN0YXRpYyBpbnQgZ2Z4
X3Y5XzBfcHJpdl9pbnN0X2lycShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAlyZXR1cm4g
MDsKIH0KIAotc3RhdGljIGludCBnZnhfdjlfMF9wcm9jZXNzX3Jhc19kYXRhX2NiKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2LAotCQl2b2lkICplcnJfZGF0YSwKLQkJc3RydWN0IGFtZGdwdV9p
dl9lbnRyeSAqZW50cnkpCi17Ci0JLyogVE9ETyB1ZSB3aWxsIHRyaWdnZXIgYW4gaW50ZXJydXB0
LiAqLwotCWlmICghYW1kZ3B1X3Jhc19pc19zdXBwb3J0ZWQoYWRldiwgQU1ER1BVX1JBU19CTE9D
S19fR0ZYKSkgewotCQlrZ2Qya2ZkX3NldF9zcmFtX2VjY19mbGFnKGFkZXYtPmtmZC5kZXYpOwot
CQlpZiAoYWRldi0+Z2Z4LmZ1bmNzLT5xdWVyeV9yYXNfZXJyb3JfY291bnQpCi0JCQlhZGV2LT5n
ZnguZnVuY3MtPnF1ZXJ5X3Jhc19lcnJvcl9jb3VudChhZGV2LCBlcnJfZGF0YSk7Ci0JCWFtZGdw
dV9yYXNfcmVzZXRfZ3B1KGFkZXYsIDApOwotCX0KLQlyZXR1cm4gQU1ER1BVX1JBU19TVUNDRVNT
OwotfQotCiBzdGF0aWMgY29uc3Qgc3RydWN0IHsKIAljb25zdCBjaGFyICpuYW1lOwogCXVpbnQz
Ml90IGlwOwpAQCAtNjA2MCwyNSArNjA0Miw2IEBAIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfcXVlcnlf
cmFzX2Vycm9yX2NvdW50KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCXJldHVybiAwOwog
fQogCi1zdGF0aWMgaW50IGdmeF92OV8wX2NwX2VjY19lcnJvcl9pcnEoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsCi0JCQkJICBzdHJ1Y3QgYW1kZ3B1X2lycV9zcmMgKnNvdXJjZSwKLQkJCQkg
IHN0cnVjdCBhbWRncHVfaXZfZW50cnkgKmVudHJ5KQotewotCXN0cnVjdCByYXNfY29tbW9uX2lm
ICpyYXNfaWYgPSBhZGV2LT5nZngucmFzX2lmOwotCXN0cnVjdCByYXNfZGlzcGF0Y2hfaWYgaWhf
ZGF0YSA9IHsKLQkJLmVudHJ5ID0gZW50cnksCi0JfTsKLQotCWlmICghcmFzX2lmKQotCQlyZXR1
cm4gMDsKLQotCWloX2RhdGEuaGVhZCA9ICpyYXNfaWY7Ci0KLQlEUk1fRVJST1IoIkNQIEVDQyBF
UlJPUiBJUlFcbiIpOwotCWFtZGdwdV9yYXNfaW50ZXJydXB0X2Rpc3BhdGNoKGFkZXYsICZpaF9k
YXRhKTsKLQlyZXR1cm4gMDsKLX0KLQogc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRfaXBfZnVuY3Mg
Z2Z4X3Y5XzBfaXBfZnVuY3MgPSB7CiAJLm5hbWUgPSAiZ2Z4X3Y5XzAiLAogCS5lYXJseV9pbml0
ID0gZ2Z4X3Y5XzBfZWFybHlfaW5pdCwKQEAgLTYyNDIsNyArNjIwNSw3IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgYW1kZ3B1X2lycV9zcmNfZnVuY3MgZ2Z4X3Y5XzBfcHJpdl9pbnN0X2lycV9mdW5j
cyA9IHsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfaXJxX3NyY19mdW5jcyBnZnhfdjlf
MF9jcF9lY2NfZXJyb3JfaXJxX2Z1bmNzID0gewogCS5zZXQgPSBnZnhfdjlfMF9zZXRfY3BfZWNj
X2Vycm9yX3N0YXRlLAotCS5wcm9jZXNzID0gZ2Z4X3Y5XzBfY3BfZWNjX2Vycm9yX2lycSwKKwku
cHJvY2VzcyA9IGFtZGdwdV9nZnhfY3BfZWNjX2Vycm9yX2lycSwKIH07CiAKIAotLSAKMi4xNy4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
