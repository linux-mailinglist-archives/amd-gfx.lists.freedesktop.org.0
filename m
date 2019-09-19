Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B62ADB73CA
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 09:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 414CB6F92A;
	Thu, 19 Sep 2019 07:12:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740082.outbound.protection.outlook.com [40.107.74.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDCF6F92A
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 07:12:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VW1gIo3hFZmwDUr0yMEIoJBB815eIcD3jKaDF7qaupKf7kL01+tFksp/BRelD+sQDPEMrr6FJ2JTUnUMr8VtHSiEbf8Dy8lUqHplxlpZe+iNcrVHwBl8nyLEdPPMdYr13OdXBBy7CpwDwOspijvjpVTc3+B8sLE9lw1zkmEJLwEqpC9hTNBiITsDcIZR3T+Iw+qH7o8AysgXAhbeCM4/k6029ZA6vEcLTizSONvScTUWUbo2OPY+DzME0X58QAT/XYGEnKHdMRUj8sgIJ8p6Pe9rt98kfHJOsgdoukf46KQfTU5xrYiNOHeGRpEDdxTiA70hIpluucDzSBBcH657aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y5HM464/Lf/uUSoBWlA+TKKCdIfioFQuHPwqRHfoCh0=;
 b=BI59FW0WfXvhx5XEvXRtaC8Jx17fMQYlI7CuIILjiXBLrH44hIsoUtEDv5iRk6kA7DyfnFVtoNpinsVOL7KrUIZ8c30UE2Dr+A1/Ka2OckARWjg1174Mot8EvkfchBjp30kpvCz/g76PKmBGYsO+r3pSLnYpwxB4aX5M/DDgK1/KR89JuXokVVIs5vo/N7bM6FU1X7MaIq6f5xqAyKPm/ZhGYZ5otWcS8UWq6CmRxKWjo7oqUhtTCSWtfOdftBFTg7+FnLLDj7kB9PcWu6qLpWJXozX/S/95zN6SWr8NNqlf0tbrsEY5kCu2p9qf2R804etzE9q6hZpCtJoJY1OVWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3440.namprd12.prod.outlook.com (20.178.244.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Thu, 19 Sep 2019 07:12:49 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 07:12:49 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: [PATCH 09/21] drm/amdgpu: move mmhub_ras_if from gmc to mmhub block
Thread-Topic: [PATCH 09/21] drm/amdgpu: move mmhub_ras_if from gmc to mmhub
 block
Thread-Index: AQHVbrmk6w+ijWm+CkeUpbztQAyj3Q==
Date: Thu, 19 Sep 2019 07:12:49 +0000
Message-ID: <20190919071115.16552-10-tao.zhou1@amd.com>
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
x-ms-office365-filtering-correlation-id: e7040af5-e627-48c3-0f29-08d73cd0c738
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3440; 
x-ms-traffictypediagnostic: MN2PR12MB3440:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3440701F2794F7BB49ED7411B0890@MN2PR12MB3440.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:193;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(199004)(189003)(25786009)(66066001)(14454004)(256004)(478600001)(6512007)(4326008)(2906002)(66946007)(66446008)(64756008)(316002)(66556008)(66476007)(6436002)(6116002)(110136005)(3846002)(6486002)(99286004)(6636002)(76176011)(2501003)(52116002)(1076003)(36756003)(5660300002)(446003)(2616005)(11346002)(476003)(305945005)(7736002)(26005)(102836004)(486006)(386003)(6506007)(186003)(8676002)(71190400001)(86362001)(71200400001)(8936002)(81156014)(50226002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3440;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: z7CqxfiPaqFfoCfh+ikcTzB5Zx1OJg8wPJBnrMzAy+XLLI0D5mskDN7IhAz24tFBw+0M64Onzvk2Xk32ZEwWIZjyjLBrnNtRqivdjEVkTgJe388wfbrQoPDYxIFU6qnQIvSRZD5TaB16RpLF9oefWpM5uRmfJmawkG5kt0tuKImCimmG+/lqLYkHaW0R4CD4S1Jh7zNcn+qUctPGgkpVkIB2zZU+SqxOYhfXbos1KakL3I8a+cyxaUAHL1auO8GGxMNbOq/ySP92iqCGvTLZ0ra2UbhZ9K+qhrsQuro0gwL93mZCo6ptXE4kjbDw2QL1vNZl1ksh87KVPXsciWA7x4/DLbnvpKus3zFPpvPgr++NySPk7DPwDbwcoG2QUSiMOaWOfiPtemuwdsj/qs5PFfncWnxMmMWlP92l2TcisSI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7040af5-e627-48c3-0f29-08d73cd0c738
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 07:12:49.2846 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2NVWw6uHCRw51P9dv4XD0jN4QaXNWCpxs3nZmBuZ7f37eNFux6xh6peajzbsOJBR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3440
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y5HM464/Lf/uUSoBWlA+TKKCdIfioFQuHPwqRHfoCh0=;
 b=AjV4S/8Wsm7IWswZU2M5g72EuRoOyc6hwrVprM9kE5vJisvrUhgj/K20arHqbBcdiavmBXUhTjusW1VUeyg2Pxblbsh3gUbOwRZTKzxy/uXxKkR0QHIxJO9F5SXzQ5jbNeR3T71QgLq8dmesWf70dw0T9yqITx+7D8/CctceSa4=
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

bW1odWJfcmFzX2lmIGlzIHJlbGV2YW50IHRvIG1taHViCgpTaWduZWQtb2ZmLWJ5OiBUYW8gWmhv
dSA8dGFvLnpob3UxQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2dtYy5oICAgfCAgMSAtCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW1o
dWIuYyB8IDI0ICsrKysrKysrKysrLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nbWNfdjlfMC5jICAgICB8ICA0ICsrLS0KIDMgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0
aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2dtYy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2dtYy5oCmluZGV4IDUyNGRmMTU0YTVhZS4uY2JjODBjNWRhM2Y5IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmgKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5oCkBAIC0xODEsNyArMTgxLDYgQEAgc3RydWN0IGFtZGdw
dV9nbWMgewogCiAJc3RydWN0IGFtZGdwdV94Z21pIHhnbWk7CiAJc3RydWN0IGFtZGdwdV9pcnFf
c3JjCWVjY19pcnE7Ci0Jc3RydWN0IHJhc19jb21tb25faWYgICAgKm1taHViX3Jhc19pZjsKIH07
CiAKICNkZWZpbmUgYW1kZ3B1X2dtY19mbHVzaF9ncHVfdGxiKGFkZXYsIHZtaWQsIHZtaHViLCB0
eXBlKSAoKGFkZXYpLT5nbWMuZ21jX2Z1bmNzLT5mbHVzaF9ncHVfdGxiKChhZGV2KSwgKHZtaWQp
LCAodm1odWIpLCAodHlwZSkpKQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X21taHViLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW1o
dWIuYwppbmRleCA5OWVmNmIxZjg1MjYuLmZlMTcwOWVlOGY0YiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21taHViLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X21taHViLmMKQEAgLTM1LDIxICszNSwyMSBAQCBpbnQgYW1kZ3B1
X21taHViX3Jhc19sYXRlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCS5kZWJ1
Z2ZzX25hbWUgPSAibW1odWJfZXJyX2luamVjdCIsCiAJfTsKIAotCWlmICghYWRldi0+Z21jLm1t
aHViX3Jhc19pZikgewotCQlhZGV2LT5nbWMubW1odWJfcmFzX2lmID0ga21hbGxvYyhzaXplb2Yo
c3RydWN0IHJhc19jb21tb25faWYpLCBHRlBfS0VSTkVMKTsKLQkJaWYgKCFhZGV2LT5nbWMubW1o
dWJfcmFzX2lmKQorCWlmICghYWRldi0+bW1odWIucmFzX2lmKSB7CisJCWFkZXYtPm1taHViLnJh
c19pZiA9IGttYWxsb2Moc2l6ZW9mKHN0cnVjdCByYXNfY29tbW9uX2lmKSwgR0ZQX0tFUk5FTCk7
CisJCWlmICghYWRldi0+bW1odWIucmFzX2lmKQogCQkJcmV0dXJuIC1FTk9NRU07Ci0JCWFkZXYt
PmdtYy5tbWh1Yl9yYXNfaWYtPmJsb2NrID0gQU1ER1BVX1JBU19CTE9DS19fTU1IVUI7Ci0JCWFk
ZXYtPmdtYy5tbWh1Yl9yYXNfaWYtPnR5cGUgPSBBTURHUFVfUkFTX0VSUk9SX19NVUxUSV9VTkNP
UlJFQ1RBQkxFOwotCQlhZGV2LT5nbWMubW1odWJfcmFzX2lmLT5zdWJfYmxvY2tfaW5kZXggPSAw
OwotCQlzdHJjcHkoYWRldi0+Z21jLm1taHViX3Jhc19pZi0+bmFtZSwgIm1taHViIik7CisJCWFk
ZXYtPm1taHViLnJhc19pZi0+YmxvY2sgPSBBTURHUFVfUkFTX0JMT0NLX19NTUhVQjsKKwkJYWRl
di0+bW1odWIucmFzX2lmLT50eXBlID0gQU1ER1BVX1JBU19FUlJPUl9fTVVMVElfVU5DT1JSRUNU
QUJMRTsKKwkJYWRldi0+bW1odWIucmFzX2lmLT5zdWJfYmxvY2tfaW5kZXggPSAwOworCQlzdHJj
cHkoYWRldi0+bW1odWIucmFzX2lmLT5uYW1lLCAibW1odWIiKTsKIAl9Ci0JaWhfaW5mby5oZWFk
ID0gZnNfaW5mby5oZWFkID0gKmFkZXYtPmdtYy5tbWh1Yl9yYXNfaWY7Ci0JciA9IGFtZGdwdV9y
YXNfbGF0ZV9pbml0KGFkZXYsIGFkZXYtPmdtYy5tbWh1Yl9yYXNfaWYsCisJaWhfaW5mby5oZWFk
ID0gZnNfaW5mby5oZWFkID0gKmFkZXYtPm1taHViLnJhc19pZjsKKwlyID0gYW1kZ3B1X3Jhc19s
YXRlX2luaXQoYWRldiwgYWRldi0+bW1odWIucmFzX2lmLAogCQkJCSAmZnNfaW5mbywgJmloX2lu
Zm8pOwotCWlmIChyIHx8ICFhbWRncHVfcmFzX2lzX3N1cHBvcnRlZChhZGV2LCBhZGV2LT5nbWMu
bW1odWJfcmFzX2lmLT5ibG9jaykpIHsKLQkJa2ZyZWUoYWRldi0+Z21jLm1taHViX3Jhc19pZik7
Ci0JCWFkZXYtPmdtYy5tbWh1Yl9yYXNfaWYgPSBOVUxMOworCWlmIChyIHx8ICFhbWRncHVfcmFz
X2lzX3N1cHBvcnRlZChhZGV2LCBhZGV2LT5tbWh1Yi5yYXNfaWYtPmJsb2NrKSkgeworCQlrZnJl
ZShhZGV2LT5tbWh1Yi5yYXNfaWYpOworCQlhZGV2LT5tbWh1Yi5yYXNfaWYgPSBOVUxMOwogCX0K
IAogCXJldHVybiByOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21j
X3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKaW5kZXggM2Rj
NGQxMzM2OTY0Li4yY2E0MGYwZjk4YWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2dtY192OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5
XzAuYwpAQCAtMTEzMCw4ICsxMTMwLDggQEAgc3RhdGljIGludCBnbWNfdjlfMF9zd19maW5pKHZv
aWQgKmhhbmRsZSkKIAl9CiAKIAlpZiAoYW1kZ3B1X3Jhc19pc19zdXBwb3J0ZWQoYWRldiwgQU1E
R1BVX1JBU19CTE9DS19fTU1IVUIpICYmCi0JCQlhZGV2LT5nbWMubW1odWJfcmFzX2lmKSB7Ci0J
CXN0cnVjdCByYXNfY29tbW9uX2lmICpyYXNfaWYgPSBhZGV2LT5nbWMubW1odWJfcmFzX2lmOwor
CQkJYWRldi0+bW1odWIucmFzX2lmKSB7CisJCXN0cnVjdCByYXNfY29tbW9uX2lmICpyYXNfaWYg
PSBhZGV2LT5tbWh1Yi5yYXNfaWY7CiAKIAkJLyogcmVtb3ZlIGZzIGFuZCBkaXNhYmxlIHJhcyBm
ZWF0dXJlICovCiAJCWFtZGdwdV9yYXNfZGVidWdmc19yZW1vdmUoYWRldiwgcmFzX2lmKTsKLS0g
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
