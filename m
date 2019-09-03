Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A28A5E55
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 02:02:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4440889949;
	Tue,  3 Sep 2019 00:02:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800044.outbound.protection.outlook.com [40.107.80.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8923089949
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Sep 2019 00:02:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PtZp/N2vCZE/LrTWt3U6lYBVNkmPCqOfhDKLyzNZTbDWQ4rRQI/K4vx/b75LMfWA9OE9sLdv0fDds9Q4LeP9myF3KzDjDAfl4j4lxg5JrrwC1sqVypsdhHFBND00iJbcJ+jusVokok1M2wYwlEKAB2AaTptAI/KYS8c21VFIgr5tFeEFdPvHsTwwOrjHnCze4JJ67CmMdvN1FBF0xnausZpoWCl64CK1y1fqK+ZDwWNHiRGFxfBzmgLlawIdb4CAJkOcKk707EnFJAjXb/BHJdJk/GRxSMgFS5korqJMNus0POl8QNSDweR1TDEUU6A7pp2EAH/vEEYqmeU4wCeBcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SCsAQqI5Pq06U1WL9BRwZ7btbIMECznagJfm1/oIR0A=;
 b=gE4tOZrMhKBGgEqM+eEqgYT0GOkRKYb00nFfBMrQRK3anjLELhXHUl8nebgoVGFHbejLo0/Xkf9oNGDKG2orsI6MOOrk54DZmpmtWS60uxyHMF9tZkOKHAAAVDF4D8soklft3yrOEn259GN3x+Q1Grs1N4xof448t8pRghGT4aX9Ykb4tc1otTOkSTCV8XcWVqTTV8KkxbAWd2OCtzKVqPxvN33FW0e3rqbKXLe5YOqwSrsmHamIK1GPPvSKGVUxYVHEC8aEDIPm2jr2XA0sl39Ee8qfT42sV1783ZZs+Z3+DGAOLKenwTFwE30MwGC/teApfcmuCJVtjxEjiXgOXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1818.namprd12.prod.outlook.com (10.175.92.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Tue, 3 Sep 2019 00:02:05 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d%7]) with mapi id 15.20.2220.021; Tue, 3 Sep 2019
 00:02:05 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhou1,
 Tao" <Tao.Zhou1@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH 04/10] drm/amdgpu/sdma: switch to amdgpu_sdma_ras_late_init
 helper function
Thread-Topic: [PATCH 04/10] drm/amdgpu/sdma: switch to
 amdgpu_sdma_ras_late_init helper function
Thread-Index: AQHVYerRy69HQZ5gpEKkLbsb5+Sjkg==
Date: Tue, 3 Sep 2019 00:02:04 +0000
Message-ID: <1567468894-11852-4-git-send-email-Hawking.Zhang@amd.com>
References: <1567468894-11852-1-git-send-email-Hawking.Zhang@amd.com>
In-Reply-To: <1567468894-11852-1-git-send-email-Hawking.Zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0022.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::34) To DM5PR12MB1418.namprd12.prod.outlook.com
 (2603:10b6:3:7a::15)
x-originating-ip: [180.167.199.189]
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a88e767a-1eaf-44a8-e592-08d73001f433
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1818; 
x-ms-traffictypediagnostic: DM5PR12MB1818:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1818EE1277A2EBF78451D659FCB90@DM5PR12MB1818.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(199004)(189003)(99286004)(66446008)(36756003)(2501003)(478600001)(316002)(256004)(66946007)(5660300002)(66476007)(53936002)(81166006)(26005)(8676002)(71200400001)(102836004)(81156014)(71190400001)(6486002)(66556008)(50226002)(186003)(8936002)(66066001)(25786009)(3846002)(6116002)(76176011)(6512007)(6506007)(386003)(4326008)(86362001)(486006)(446003)(2616005)(305945005)(52116002)(7736002)(11346002)(476003)(110136005)(2906002)(14454004)(6636002)(64756008)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1818;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 85aDzkuUcJxFHw8AgIxHvXgirszusl5pcWAkW2dqlcImps4shkn5YmaSsqr3o2ZShR//jNU3mW6WTght734SeXaxLrYh8cQEHLR6PwsRQBmEkNEMTK54mnSaChHDc6yYpysdUwu8MSJ3cfLYjbKxwfPL2bMmQ/MiMTqhDC4fp1DVl15Gwg3pAO9wOjmD3bmPLhuKK03wFTlljjZ+X0njSRdoAdn21KSJYZeGnLLi8MRaiooOAMTQaEAC+DveoRHTwioZi7YUyiYrhT1Lt0ENifMw09XSgWUsJlidplitt2Qe6Z0hyPCAR0Tihvxonre2h2mFz8LlRBNT4jLkL2Z5M7XclacXrXrT9CPFo6V9npPiuK+WCS2HYYj36+JEr+E0denB4cM2b8gr3gtpFevgK+6wmiUi6hy4quKwD1ZglK0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a88e767a-1eaf-44a8-e592-08d73001f433
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 00:02:04.9175 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QFBM1LVYl8h+7lUN4c3ky0FRg91ta5O5eIhjnC0JXZxtfQ/pXyfr9ap2NzGZgsL6DOfP1Ovk//vtGMmZdaxQNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1818
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SCsAQqI5Pq06U1WL9BRwZ7btbIMECznagJfm1/oIR0A=;
 b=xxibtcpWFOgTNGXrxXTZUw7fH5qYmxt4ZAEUlTV+Gf8tHg1AP/3mVCGj95YulbeHbpJRg5zmDq/+DHj8/HUNECnVcZOaFez61rpPxklXlQzsjkfBfSreb3U86BhPniSTeZV/9MAey70FGWy/yQmuxrgLMH34SPi+yI5OeardYys=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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
Cc: "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

YW1kZ3B1X3NkbWFfcmFzX2xhdGVfaW5pdCBpcyB1c2VkIHRvIGluaXQgc2RtYSBzcGVjZmljCnJh
cyBkZWJ1Z2ZzL3N5c2ZzIG5vZGUgYW5kIHNkbWEgc3BlY2lmaWMgaW50ZXJydXB0IGhhbmRsZXIu
Ckl0IGNhbiBiZSBzaGFyZWQgYW1vbmcgc2RtYSBnZW5lcmF0aW9ucwoKU2lnbmVkLW9mZi1ieTog
SGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9zZG1hLmMgfCA1MiArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3NkbWEuaCB8ICAyICsr
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYyAgIHwgNDIgKy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgNTUgaW5zZXJ0aW9ucygrKSwgNDEg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3NkbWEuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9zZG1hLmMKaW5k
ZXggN2RkZmZiZi4uYTI1MzAxYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3NkbWEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
c2RtYS5jCkBAIC0yMyw2ICsyMyw3IEBACiAjaW5jbHVkZSA8ZHJtL2RybVAuaD4KICNpbmNsdWRl
ICJhbWRncHUuaCIKICNpbmNsdWRlICJhbWRncHVfc2RtYS5oIgorI2luY2x1ZGUgImFtZGdwdV9y
YXMuaCIKIAogI2RlZmluZSBBTURHUFVfQ1NBX1NETUFfU0laRSA2NAogLyogU0RNQSBDU0EgcmVz
aWRlIGluIHRoZSAzcmQgcGFnZSBvZiBDU0EgKi8KQEAgLTgzLDMgKzg0LDU0IEBAIHVpbnQ2NF90
IGFtZGdwdV9zZG1hX2dldF9jc2FfbWNfYWRkcihzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsCiAK
IAlyZXR1cm4gY3NhX21jX2FkZHI7CiB9CisKK2ludCBhbWRncHVfc2RtYV9yYXNfbGF0ZV9pbml0
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAorCQkJICAgICAgdm9pZCAqcmFzX2loX2luZm8p
Cit7CisJaW50IHIsIGk7CisJc3RydWN0IHJhc19paF9pZiAqaWhfaW5mbyA9IChzdHJ1Y3QgcmFz
X2loX2lmICopcmFzX2loX2luZm87CisJc3RydWN0IHJhc19mc19pZiBmc19pbmZvID0geworCQku
c3lzZnNfbmFtZSA9ICJzZG1hX2Vycl9jb3VudCIsCisJCS5kZWJ1Z2ZzX25hbWUgPSAic2RtYV9l
cnJfaW5qZWN0IiwKKwl9OworCisJaWYgKCFpaF9pbmZvKQorCQlyZXR1cm4gLUVJTlZBTDsKKwor
CWlmICghYWRldi0+c2RtYS5yYXNfaWYpIHsKKwkJYWRldi0+c2RtYS5yYXNfaWYgPSBrbWFsbG9j
KHNpemVvZihzdHJ1Y3QgcmFzX2NvbW1vbl9pZiksIEdGUF9LRVJORUwpOworCQlpZiAoIWFkZXYt
PnNkbWEucmFzX2lmKQorCQkJcmV0dXJuIC1FTk9NRU07CisJCWFkZXYtPnNkbWEucmFzX2lmLT5i
bG9jayA9IEFNREdQVV9SQVNfQkxPQ0tfX1NETUE7CisJCWFkZXYtPnNkbWEucmFzX2lmLT50eXBl
ID0gQU1ER1BVX1JBU19FUlJPUl9fTVVMVElfVU5DT1JSRUNUQUJMRTsKKwkJYWRldi0+c2RtYS5y
YXNfaWYtPnN1Yl9ibG9ja19pbmRleCA9IDA7CisJCXN0cmNweShhZGV2LT5zZG1hLnJhc19pZi0+
bmFtZSwgInNkbWEiKTsKKwl9CisJZnNfaW5mby5oZWFkID0gaWhfaW5mby0+aGVhZCA9ICphZGV2
LT5zZG1hLnJhc19pZjsKKworCXIgPSBhbWRncHVfcmFzX2xhdGVfaW5pdChhZGV2LCBhZGV2LT5z
ZG1hLnJhc19pZiwKKwkJCQkgJmZzX2luZm8sIGloX2luZm8pOworCWlmIChyKQorCQlnb3RvIGZy
ZWU7CisKKwlpZiAoYW1kZ3B1X3Jhc19pc19zdXBwb3J0ZWQoYWRldiwgYWRldi0+c2RtYS5yYXNf
aWYtPmJsb2NrKSkgeworCQlmb3IgKGkgPSAwOyBpIDwgYWRldi0+c2RtYS5udW1faW5zdGFuY2Vz
OyBpKyspIHsKKwkJCXIgPSBhbWRncHVfaXJxX2dldChhZGV2LCAmYWRldi0+c2RtYS5lY2NfaXJx
LAorCQkJCUFNREdQVV9TRE1BX0lSUV9JTlNUQU5DRTAgKyBpKTsKKwkJCWlmIChyKQorCQkJCWdv
dG8gbGF0ZV9maW5pOworCQl9CisJfSBlbHNlIHsKKwkJciA9IDA7CisJCWdvdG8gZnJlZTsKKwl9
CisKKyAgICAgICAgcmV0dXJuIDA7CisKK2xhdGVfZmluaToKKwlhbWRncHVfcmFzX2xhdGVfZmlu
aShhZGV2LCBhZGV2LT5zZG1hLnJhc19pZiwgaWhfaW5mbyk7CitmcmVlOgorCWtmcmVlKGFkZXYt
PnNkbWEucmFzX2lmKTsKKwlhZGV2LT5zZG1hLnJhc19pZiA9IE5VTEw7CisJcmV0dXJuIHI7Cit9
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfc2RtYS5oIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3NkbWEuaAppbmRleCBhOWFlMGQ4Li43
OWRjYjkwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfc2Rt
YS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9zZG1hLmgKQEAgLTEw
NCw0ICsxMDQsNiBAQCBzdHJ1Y3QgYW1kZ3B1X3NkbWFfaW5zdGFuY2UgKgogYW1kZ3B1X3NkbWFf
Z2V0X2luc3RhbmNlX2Zyb21fcmluZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpOwogaW50IGFt
ZGdwdV9zZG1hX2dldF9pbmRleF9mcm9tX3Jpbmcoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCB1
aW50MzJfdCAqaW5kZXgpOwogdWludDY0X3QgYW1kZ3B1X3NkbWFfZ2V0X2NzYV9tY19hZGRyKHN0
cnVjdCBhbWRncHVfcmluZyAqcmluZywgdW5zaWduZWQgdm1pZCk7CitpbnQgYW1kZ3B1X3NkbWFf
cmFzX2xhdGVfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKKwkJCSAgICAgIHZvaWQg
KnJhc19paF9pbmZvKTsKICNlbmRpZgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvc2RtYV92NF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAu
YwppbmRleCBlOTcxZTg2Li4zYzRjY2NiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9zZG1hX3Y0XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1h
X3Y0XzAuYwpAQCAtMTY5Niw0OCArMTY5Niw4IEBAIHN0YXRpYyBpbnQgc2RtYV92NF8wX2xhdGVf
aW5pdCh2b2lkICpoYW5kbGUpCiAJc3RydWN0IHJhc19paF9pZiBpaF9pbmZvID0gewogCQkuY2Ig
PSBzZG1hX3Y0XzBfcHJvY2Vzc19yYXNfZGF0YV9jYiwKIAl9OwotCXN0cnVjdCByYXNfZnNfaWYg
ZnNfaW5mbyA9IHsKLQkJLnN5c2ZzX25hbWUgPSAic2RtYV9lcnJfY291bnQiLAotCQkuZGVidWdm
c19uYW1lID0gInNkbWFfZXJyX2luamVjdCIsCi0JfTsKLQlpbnQgciwgaTsKLQotCWlmICghYWRl
di0+c2RtYS5yYXNfaWYpIHsKLQkJYWRldi0+c2RtYS5yYXNfaWYgPSBrbWFsbG9jKHNpemVvZihz
dHJ1Y3QgcmFzX2NvbW1vbl9pZiksIEdGUF9LRVJORUwpOwotCQlpZiAoIWFkZXYtPnNkbWEucmFz
X2lmKQotCQkJcmV0dXJuIC1FTk9NRU07Ci0JCWFkZXYtPnNkbWEucmFzX2lmLT5ibG9jayA9IEFN
REdQVV9SQVNfQkxPQ0tfX1NETUE7Ci0JCWFkZXYtPnNkbWEucmFzX2lmLT50eXBlID0gQU1ER1BV
X1JBU19FUlJPUl9fTVVMVElfVU5DT1JSRUNUQUJMRTsKLQkJYWRldi0+c2RtYS5yYXNfaWYtPnN1
Yl9ibG9ja19pbmRleCA9IDA7Ci0JCXN0cmNweShhZGV2LT5zZG1hLnJhc19pZi0+bmFtZSwgInNk
bWEiKTsKLQl9Ci0JZnNfaW5mby5oZWFkID0gaWhfaW5mby5oZWFkID0gKmFkZXYtPnNkbWEucmFz
X2lmOwotCi0JciA9IGFtZGdwdV9yYXNfbGF0ZV9pbml0KGFkZXYsIGFkZXYtPnNkbWEucmFzX2lm
LAotCQkJCSAmZnNfaW5mbywgJmloX2luZm8pOwotCWlmIChyKQotCQlnb3RvIGZyZWU7Ci0KLQlp
ZiAoYW1kZ3B1X3Jhc19pc19zdXBwb3J0ZWQoYWRldiwgYWRldi0+c2RtYS5yYXNfaWYtPmJsb2Nr
KSkgewotCQlmb3IgKGkgPSAwOyBpIDwgYWRldi0+c2RtYS5udW1faW5zdGFuY2VzOyBpKyspIHsK
LQkJCXIgPSBhbWRncHVfaXJxX2dldChhZGV2LCAmYWRldi0+c2RtYS5lY2NfaXJxLAotCQkJCUFN
REdQVV9TRE1BX0lSUV9JTlNUQU5DRTAgKyBpKTsKLQkJCWlmIChyKQotCQkJCWdvdG8gbGF0ZV9m
aW5pOwotCQl9Ci0JfSBlbHNlIHsKLQkJLyogZnJlZSBzZG1hIHJhc19pZiBpZiBzZG1hIHJhcyBp
cyBub3Qgc3VwcG9ydGVkICovCi0JCXIgPSAwOwotCQlnb3RvIGZyZWU7Ci0JfQogCi0gICAgICAg
IHJldHVybiAwOwotbGF0ZV9maW5pOgotCWFtZGdwdV9yYXNfbGF0ZV9maW5pKGFkZXYsIGFkZXYt
PnNkbWEucmFzX2lmLCAmaWhfaW5mbyk7Ci1mcmVlOgotCWtmcmVlKGFkZXYtPnNkbWEucmFzX2lm
KTsKLQlhZGV2LT5zZG1hLnJhc19pZiA9IE5VTEw7Ci0JcmV0dXJuIHI7CisJcmV0dXJuIGFtZGdw
dV9zZG1hX3Jhc19sYXRlX2luaXQoYWRldiwgJmloX2luZm8pOwogfQogCiBzdGF0aWMgaW50IHNk
bWFfdjRfMF9zd19pbml0KHZvaWQgKmhhbmRsZSkKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
