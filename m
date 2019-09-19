Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC0BB73D5
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 09:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DFE06F965;
	Thu, 19 Sep 2019 07:13:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700054.outbound.protection.outlook.com [40.107.70.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D03D6F964
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 07:13:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xp33g8jMBJN3kJNeFrF3ApTpyzWF8ayAEAIFstALLe75MFcGcs4HVhhFUQY2/tNAQtTkaxuL46rwVJ/qzKhFJynR4HUjkWkGJXmVbnIl3xTpwExuFOqxxaEltjWhRgrvB6rjMAoNm3v/S30xEPttCwaLmk9I38t9+/aBZqXRTs4Sot989UIx6QmQPDJC3PmxGc/+WfB1cpKrh1FKSUU7OCH38h8zR9IErTHDSwzTYGbA0zighDE6UbHObvSXeJO9uZ1Ri+S0iwJL7G7YZOcwpn+VgB2pvyYpmr2H3PmPMySBCTNFPjx3lRNRaOdELl+z0m7Zkd2LDzgPlWo8BOt8Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXJQ8hOVZmF/Tys0Yb/B6eRiZiicOD8op33VW0IelCU=;
 b=hrHrxVZI2h/Lzo94qUqu/7uY1yjTQz2Xak9q/iozpTOpM3sUdfgZRm/ouslrZPYBpBTMbfmiCBxOlDGHFVZZMn+nCfswtH2mcdvkQ6nesCJEFVjpiYbw8fKjazzC3tXJn9SyzjVje4VIZUqLO3XLhVZY+mvh5rCDxxNmIc21HFHUq5H3DauOzCn//g/BnqXfPK21W+/RchsbtSHjy2LMOQp/u0vibrFfSTDZDM0Pr7hvdxBHhX4ic6HupbC8h7dfR+A8VgCE5EKWxgpZ1yswiQb/g/Sbt9ZLjUEW9DzCH1c2ImkKRtfuzDox5qZ2CVXQStGpz34MrF4Ck354UeSUXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB2894.namprd12.prod.outlook.com (20.179.84.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Thu, 19 Sep 2019 07:13:12 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 07:13:12 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: [PATCH 19/21] drm/amdgpu: move mmhub ras fini to mmhub block
Thread-Topic: [PATCH 19/21] drm/amdgpu: move mmhub ras fini to mmhub block
Thread-Index: AQHVbrmyEVEQMCIRwUKnM6AN1Wko3Q==
Date: Thu, 19 Sep 2019 07:13:12 +0000
Message-ID: <20190919071115.16552-20-tao.zhou1@amd.com>
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
x-ms-office365-filtering-correlation-id: 4d6e3845-19b5-46b5-aea8-08d73cd0d537
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB2894; 
x-ms-traffictypediagnostic: MN2PR12MB2894:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2894C1FE3977B4B10B7B7681B0890@MN2PR12MB2894.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:972;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(199004)(189003)(186003)(6506007)(102836004)(6512007)(316002)(8676002)(81156014)(64756008)(446003)(2501003)(52116002)(11346002)(476003)(2616005)(66446008)(86362001)(8936002)(5660300002)(66946007)(66476007)(81166006)(66556008)(50226002)(3846002)(2906002)(486006)(76176011)(99286004)(110136005)(6116002)(25786009)(7736002)(256004)(1076003)(66066001)(26005)(14454004)(386003)(6436002)(6486002)(4326008)(478600001)(71190400001)(71200400001)(6636002)(305945005)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2894;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kF3dUYHRVbDt7nEjhjz7QUj2VIjwXvFL6mTGOxzepo7PH5OUSc4/3FBrdcks0kmCkzPebPzu12qIv7eidVu5GU/nOTiC8Qs8TLNSX4QnuInpbfiMBjYo78BOcE6Asc3E4616+5z4SDEAxSadyJZrh5jcBiGtxfZwpWbmhc8xjOGizkq2rvgmsrJWH4df9N1ryXMaUGtCgQpMyS0P+Zv6oBHFE/NYKO43ZmC/ZCaOGdqS1zOxzUrN0THWO5RIAxl8TwbC1aynYN+8JMB7hfLfl0yXrYXo+4bq8PTM91OJEYaLsepddHJ4L+W22tSGsEIKO1Ep7AM9tdV220TfYr7RKs1B+7bghAdymC1iZD17c3zyqWsCUa8BOPBOXWNJSMua2ABTTxiVTgQj6T1eZ3LbS0bxBiktuBhuHmu+7itXU6s=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d6e3845-19b5-46b5-aea8-08d73cd0d537
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 07:13:12.6853 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KCn/a1wnZbsQhwsqN0esPw+dEDjOD/dWDWUcCIWZDQz+kosp3EvC5vCwtpXf0BX0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2894
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXJQ8hOVZmF/Tys0Yb/B6eRiZiicOD8op33VW0IelCU=;
 b=EfkP1hwtxHXzH0EYubOqVAdrPCXOspK2hY3lUJmeCXLz225w8XTpquqyIsU/7FvufSgTK2mOmJd4ARXwpBSozD1pe5Jjh9n4rQ7WvgTj6qdPrzmEPTli/M+o3KqBrIiMoMJx76Z4WDKedizn2UN0/4dhwklBnRyr5NuIJgMxvN8=
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

aXQncyBtb3JlIHN1aXRhYmxlIHRvIHB1dCBtbWh1YiByYXMgZmluaSBpbiBtbWh1YiBibG9jawoK
U2lnbmVkLW9mZi1ieTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuYyAgIHwgMTIgKy0tLS0tLS0tLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW1odWIuYyB8IDE0ICsrKysrKysrKysrKysr
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW1odWIuaCB8ICAyICstCiAzIGZp
bGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuYwppbmRleCBiZjgwODRkZWIwMjguLmQzNTY2OWUw
ZGJhYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuYwpAQCAtMzA4LDE3
ICszMDgsNyBAQCBib29sIGFtZGdwdV9nbWNfZmlsdGVyX2ZhdWx0cyhzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwgdWludDY0X3QgYWRkciwKIHZvaWQgYW1kZ3B1X2dtY19yYXNfZmluaShzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHsKIAlhbWRncHVfdW1jX3Jhc19maW5pKGFkZXYpOwot
Ci0JaWYgKGFtZGdwdV9yYXNfaXNfc3VwcG9ydGVkKGFkZXYsIEFNREdQVV9SQVNfQkxPQ0tfX01N
SFVCKSAmJgotCQkJYWRldi0+bW1odWIucmFzX2lmKSB7Ci0JCXN0cnVjdCByYXNfY29tbW9uX2lm
ICpyYXNfaWYgPSBhZGV2LT5tbWh1Yi5yYXNfaWY7Ci0JCXN0cnVjdCByYXNfaWhfaWYgaWhfaW5m
byA9IHsKLQkJCS5jYiA9IE5VTEwsCi0JCX07Ci0KLQkJYW1kZ3B1X3Jhc19sYXRlX2ZpbmkoYWRl
diwgcmFzX2lmLCAmaWhfaW5mbyk7Ci0JCWtmcmVlKHJhc19pZik7Ci0JfQorCWFtZGdwdV9tbWh1
Yl9yYXNfZmluaShhZGV2KTsKIAogCWlmIChhbWRncHVfcmFzX2lzX3N1cHBvcnRlZChhZGV2LCBB
TURHUFVfUkFTX0JMT0NLX19YR01JX1dBRkwpICYmCiAJCQlhZGV2LT5nbWMueGdtaS5yYXNfaWYp
IHsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tbWh1Yi5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21taHViLmMKaW5kZXggZmUxNzA5
ZWU4ZjRiLi42NzZjNDhjMDJkNzcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9tbWh1Yi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9tbWh1Yi5jCkBAIC01NCwzICs1NCwxNyBAQCBpbnQgYW1kZ3B1X21taHViX3Jhc19sYXRlX2lu
aXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAKIAlyZXR1cm4gcjsKIH0KKwordm9pZCBh
bWRncHVfbW1odWJfcmFzX2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCit7CisJaWYg
KGFtZGdwdV9yYXNfaXNfc3VwcG9ydGVkKGFkZXYsIEFNREdQVV9SQVNfQkxPQ0tfX01NSFVCKSAm
JgorCQkJYWRldi0+bW1odWIucmFzX2lmKSB7CisJCXN0cnVjdCByYXNfY29tbW9uX2lmICpyYXNf
aWYgPSBhZGV2LT5tbWh1Yi5yYXNfaWY7CisJCXN0cnVjdCByYXNfaWhfaWYgaWhfaW5mbyA9IHsK
KwkJCS5jYiA9IE5VTEwsCisJCX07CisKKwkJYW1kZ3B1X3Jhc19sYXRlX2ZpbmkoYWRldiwgcmFz
X2lmLCAmaWhfaW5mbyk7CisJCWtmcmVlKHJhc19pZik7CisJfQorfQpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21taHViLmggYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfbW1odWIuaAppbmRleCBhNzMzODk4YzdkNTUuLjFjZDc4OTQwY2Y4
MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21taHViLmgK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21taHViLmgKQEAgLTM0LDYg
KzM0LDYgQEAgc3RydWN0IGFtZGdwdV9tbWh1YiB7CiB9OwogCiBpbnQgYW1kZ3B1X21taHViX3Jh
c19sYXRlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwotCit2b2lkIGFtZGdwdV9t
bWh1Yl9yYXNfZmluaShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7CiAjZW5kaWYKIAotLSAK
Mi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
