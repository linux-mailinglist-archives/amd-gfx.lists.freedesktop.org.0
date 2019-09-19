Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C395AB73CD
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 09:13:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 657966F94F;
	Thu, 19 Sep 2019 07:12:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700070.outbound.protection.outlook.com [40.107.70.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE496F944
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 07:12:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HZCHRrPSF4Nyi6J+Nobgj7ebf6c8MxjHJO8xWOrllVk8oX7ncFnAAtWdi0cimmsVOLMLynGNIpP3whlz2SD4xjnLD9sttzpgjbVzPCVciztPllI9gswGyKqh7BUK3PnHCaqr1NZC0s1CuvqGUpdl82Vz7ucIay0dJwaqwdkDddKdjaHUyX5moo0ZkyxIUH3/7s6Sdr9c+9zhAVUwkn9WTnP3sGA5l7qoEs7Z0L5sDRcYrcfwdGQWl7WC1CH2OQNjiUx8tozLdATDHIbIsnTHug30ZDQCPLxL/rT2kPaevu4xKdi4uUy7Sp99G2j3AEtFs/u8B0UQgS5mF2JQ2HUd5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYSsdOnPSuFNxDFOG6ke+HmtZRqwKCtI9GGUU5+XYr0=;
 b=hLzYzdXxnia8SgUUpsPl/nGwryGP8vO+rrYFXdTk81IcFo+Lw0L9+R+TsVQuHJCmkx4TXpY/Kwl/2g4NzqUJrVSghHUPiYmqX9F2IQ8KPJNGMqGXejvSpAz7u9Pf3nmVZnaE7TA5vu+I0IOMqJhTAjs4JYxKmPq+OiQKjE64z6k2UtiFz7Wb8KvWES3/87GjJFXOYK7w4Nj3F2OTHFEGLGY6RUxnlMrNVlNo/anGswthOKOrVUtwlxFsogy4kBxrp7KnEyV0AVX+HScurv886Oll7V3fqbJgT2Q7R49QWq2tTToZDHHRluVPrBqhgQ61m+STXNLWbwSDtomaAfNutA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB2894.namprd12.prod.outlook.com (20.179.84.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Thu, 19 Sep 2019 07:12:56 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 07:12:56 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: [PATCH 12/21] drm/amdgpu: add common sdma_ras_fini function
Thread-Topic: [PATCH 12/21] drm/amdgpu: add common sdma_ras_fini function
Thread-Index: AQHVbrmoZ1z0sp8vrk2EgJth2zPPiQ==
Date: Thu, 19 Sep 2019 07:12:55 +0000
Message-ID: <20190919071115.16552-13-tao.zhou1@amd.com>
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
x-ms-office365-filtering-correlation-id: c476a355-d00a-4ba4-1a07-08d73cd0cb41
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB2894; 
x-ms-traffictypediagnostic: MN2PR12MB2894:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2894E56AF388AC7D1C96962BB0890@MN2PR12MB2894.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(199004)(189003)(186003)(6506007)(102836004)(6512007)(316002)(8676002)(81156014)(64756008)(446003)(2501003)(52116002)(11346002)(476003)(2616005)(66446008)(86362001)(8936002)(5660300002)(66946007)(66476007)(81166006)(66556008)(50226002)(3846002)(2906002)(486006)(76176011)(99286004)(110136005)(6116002)(25786009)(7736002)(256004)(1076003)(66066001)(26005)(14454004)(386003)(6436002)(6486002)(4326008)(478600001)(71190400001)(71200400001)(6636002)(305945005)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2894;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vZ6/xdB1mT3NPZ6rGtAnUJ/bQZlS+uL+1Xr2CXf21VNDUYQIrS9n7nJmycZc5M9Qk6MF7RWkLaPVCvr8icowJUFHuvEqYdnQZ8P175hXhbIjjOX1EKiqDxiw0Unxv/VyZZ/PnmTuVbxKk4oBa9Yur4Xi1L0dUu7WGqSYPiVzc3kMXhy0vpwJNoZ/eXayyWhJ/FV7F/ceosOnjdgYfVmKYB3T5A4AMcNpA/w39NxUu5tnnxQAONSVAGoBhNgrhq0Q7ky5x0csZyTEXIOGq1xHRbYnBIwCRnzHYK1oXi7YcEbq7nWXNeN3LsEVaWmF2bGDSF8bgi/3pOr+WtXta9k9VBG3ZxRLPrMhGlK00i1I13NiS9WjtFyAgE/Mz2HyCjm6uT9n+fBLPidwk8jrMFynnHFkn2AoWeSSk5S5qu/iwiE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c476a355-d00a-4ba4-1a07-08d73cd0cb41
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 07:12:55.9808 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dsaNIek/rS+KWtJUimwhyirK11aI3PZe8Lf1kqZDepVbcNUYuc2x+GPS3cKVXF1+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2894
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYSsdOnPSuFNxDFOG6ke+HmtZRqwKCtI9GGUU5+XYr0=;
 b=Qos5yX3p7/OnxScMizRZmYX6yMD+/+G8NR+1rBExQ1qeuoVyRrP6zveP8EmzQiRyoRwRnkNUF2XnkU/oSyocC/wdYyqWKB/xzqbM8iP09NaPksYu9Hy7uPKX+hrp4tsk3HPwA+hRDNjeTygeuTPxcuwYqlcpxRlaMUstC2cQHbo=
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

c2RtYV9yYXNfZmluaSBjYW4gYmUgc2hhcmVkIGFtb25nIGFsbCBnZW5lcmF0aW9ucyBvZiBzZG1h
CgpTaWduZWQtb2ZmLWJ5OiBUYW8gWmhvdSA8dGFvLnpob3UxQGFtZC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3NkbWEuYyB8IDE5ICsrKysrKysrKysrKysrKysr
KysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9zZG1hLmggfCAgMSArCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYyAgIHwgMTYgKy0tLS0tLS0tLS0tLS0t
LQogMyBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfc2RtYS5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3NkbWEuYwppbmRleCBiMjk0MTU3YzFkZWIu
LmJiMjZmNDJkYzBkYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3NkbWEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfc2RtYS5j
CkBAIC0xNjMsMyArMTYzLDIyIEBAIGludCBhbWRncHVfc2RtYV9wcm9jZXNzX2VjY19pcnEoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJYW1kZ3B1X3Jhc19pbnRlcnJ1cHRfZGlzcGF0Y2go
YWRldiwgJmloX2RhdGEpOwogCXJldHVybiAwOwogfQorCit2b2lkIGFtZGdwdV9zZG1hX3Jhc19m
aW5pKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQoreworCWlmIChhbWRncHVfcmFzX2lzX3N1
cHBvcnRlZChhZGV2LCBBTURHUFVfUkFTX0JMT0NLX19TRE1BKSAmJgorCQkJYWRldi0+c2RtYS5y
YXNfaWYpIHsKKwkJc3RydWN0IHJhc19jb21tb25faWYgKnJhc19pZiA9IGFkZXYtPnNkbWEucmFz
X2lmOworCQlzdHJ1Y3QgcmFzX2loX2lmIGloX2luZm8gPSB7CisJCQkuaGVhZCA9ICpyYXNfaWYs
CisJCQkvKiB0aGUgY2IgbWVtYmVyIHdpbGwgbm90IGJlIHVzZWQgYnkKKwkJCSAqIGFtZGdwdV9y
YXNfaW50ZXJydXB0X3JlbW92ZV9oYW5kbGVyLCBpbml0IGl0IG9ubHkKKwkJCSAqIHRvIGNoZWF0
IHRoZSBjaGVjayBpbiByYXNfbGF0ZV9maW5pCisJCQkgKi8KKwkJCS5jYiA9IGFtZGdwdV9zZG1h
X3Byb2Nlc3NfcmFzX2RhdGFfY2IsCisJCX07CisKKwkJYW1kZ3B1X3Jhc19sYXRlX2ZpbmkoYWRl
diwgcmFzX2lmLCAmaWhfaW5mbyk7CisJCWtmcmVlKHJhc19pZik7CisJfQorfQpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3NkbWEuaCBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9zZG1hLmgKaW5kZXggOTVlMDFkNTIyNTM3Li41OWU5NzQw
YjVlN2MgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9zZG1h
LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3NkbWEuaApAQCAtMTEy
LDQgKzExMiw1IEBAIGludCBhbWRncHVfc2RtYV9wcm9jZXNzX3Jhc19kYXRhX2NiKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2LAogaW50IGFtZGdwdV9zZG1hX3Byb2Nlc3NfZWNjX2lycShzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJCQkgICAgICBzdHJ1Y3QgYW1kZ3B1X2lycV9zcmMg
KnNvdXJjZSwKIAkJCQkgICAgICBzdHJ1Y3QgYW1kZ3B1X2l2X2VudHJ5ICplbnRyeSk7Cit2b2lk
IGFtZGdwdV9zZG1hX3Jhc19maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKICNlbmRp
ZgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYwppbmRleCBmNjg1YTIzNzc2MTUu
LmE2NTk5NTMyZTBmZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2Rt
YV92NF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMKQEAg
LTE3NjksMjEgKzE3NjksNyBAQCBzdGF0aWMgaW50IHNkbWFfdjRfMF9zd19maW5pKHZvaWQgKmhh
bmRsZSkKIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqKWhhbmRsZTsKIAlpbnQgaTsKIAotCWlmIChhbWRncHVfcmFzX2lzX3N1cHBvcnRlZChhZGV2
LCBBTURHUFVfUkFTX0JMT0NLX19TRE1BKSAmJgotCQkJYWRldi0+c2RtYS5yYXNfaWYpIHsKLQkJ
c3RydWN0IHJhc19jb21tb25faWYgKnJhc19pZiA9IGFkZXYtPnNkbWEucmFzX2lmOwotCQlzdHJ1
Y3QgcmFzX2loX2lmIGloX2luZm8gPSB7Ci0JCQkuaGVhZCA9ICpyYXNfaWYsCi0JCX07Ci0KLQkJ
LypyZW1vdmUgZnMgZmlyc3QqLwotCQlhbWRncHVfcmFzX2RlYnVnZnNfcmVtb3ZlKGFkZXYsIHJh
c19pZik7Ci0JCWFtZGdwdV9yYXNfc3lzZnNfcmVtb3ZlKGFkZXYsIHJhc19pZik7Ci0JCS8qcmVt
b3ZlIHRoZSBJSCovCi0JCWFtZGdwdV9yYXNfaW50ZXJydXB0X3JlbW92ZV9oYW5kbGVyKGFkZXYs
ICZpaF9pbmZvKTsKLQkJYW1kZ3B1X3Jhc19mZWF0dXJlX2VuYWJsZShhZGV2LCByYXNfaWYsIDAp
OwotCQlrZnJlZShyYXNfaWYpOwotCX0KKwlhbWRncHVfc2RtYV9yYXNfZmluaShhZGV2KTsKIAog
CWZvciAoaSA9IDA7IGkgPCBhZGV2LT5zZG1hLm51bV9pbnN0YW5jZXM7IGkrKykgewogCQlhbWRn
cHVfcmluZ19maW5pKCZhZGV2LT5zZG1hLmluc3RhbmNlW2ldLnJpbmcpOwotLSAKMi4xNy4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
