Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B7E97B47
	for <lists+amd-gfx@lfdr.de>; Wed, 21 Aug 2019 15:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 693D96E328;
	Wed, 21 Aug 2019 13:52:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760054.outbound.protection.outlook.com [40.107.76.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD9976E328
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 13:52:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hB89D0n1itW02lp9BUvqqTnfFe40m4O3a9rCoqXQIFnrPna4YCsnj7X1DW8F21BK+40h92s9NJfpHxghKD8Jr18jb+wSpkrAozof1RHniFgl+am2I6II5nL+dRvtYYCpuFYk3MkBrYklTWZDUqdHbtwZNiFHR7VqqqOIVDYsAOvNqjaYIECmzmnriKZAVPZTJPSuHzcswytEKFgjKqqtgeell15RFytwu1rTp6QZJcN0DPmVrAyruW+gOnARmcgIjUiBMTGVNv6KOu44k1MkV5/PECZv8vIZDqAsf2OGM4Ipuzi4dKInTwepGOGcZZ0NNgx3MRREHPYtxt8VdNtnIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kamN//MdaANBHbJtfsL7T13DtWpWEBJV9EiR8gcZIHA=;
 b=acr+pbS8jylnBrJ+xURhLHVdIfFzNdRzI8x6e0cnMa7sexxRLxCgADCepeDytJfdnRAqSFc1P7AOX8qxcWcfEdvqIbsvRcekwKMj4pG16ZsYGufqkpav0zN+EznE7peodE7cRN//JWmxRl8SAoBiqsQTaz6q9/m4sG2c9FTS92xepkkUKFwHtzMt9p07oBJ0ZPVAYOUNpt+qaQV3vrvQtNOrCdC45BeqAO7Nc9M9uvsiFsY9idGfkiyWopgW5rxZ4njQdwr1N3mXAQG+uMvWnZeI2GIQcL7y+ebRK9tDF2R7gBioTHx659chZU+2rf0LyZjvlh1DnruqD47gSsxSSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB2932.namprd12.prod.outlook.com (20.178.223.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Wed, 21 Aug 2019 13:52:41 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00%3]) with mapi id 15.20.2178.020; Wed, 21 Aug 2019
 13:52:41 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/sdma5: fix number of sdma5 trap irq types for
 navi1x
Thread-Topic: [PATCH] drm/amdgpu/sdma5: fix number of sdma5 trap irq types for
 navi1x
Thread-Index: AQHVWCezWij0Zb7cGU+M6XDBxgPMUg==
Date: Wed, 21 Aug 2019 13:52:41 +0000
Message-ID: <20190821135226.16967-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0101.apcprd03.prod.outlook.com
 (2603:1096:203:b0::17) To BN8PR12MB3602.namprd12.prod.outlook.com
 (2603:10b6:408:49::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f9819243-552e-4185-86f9-08d7263ed59f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB2932; 
x-ms-traffictypediagnostic: BN8PR12MB2932:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB293246FF95FB3303425961C189AA0@BN8PR12MB2932.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:862;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(199004)(189003)(2351001)(14454004)(36756003)(4326008)(2501003)(486006)(25786009)(305945005)(7736002)(66556008)(476003)(2616005)(53936002)(386003)(6506007)(54906003)(316002)(50226002)(6436002)(2906002)(52116002)(26005)(3846002)(6116002)(102836004)(8676002)(478600001)(66946007)(66476007)(8936002)(186003)(81166006)(66446008)(64756008)(81156014)(99286004)(6486002)(6512007)(86362001)(5640700003)(71200400001)(71190400001)(1076003)(66066001)(256004)(14444005)(6916009)(5660300002)(32563001)(357404004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB2932;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bq6TQ1uuVX1OtynvnqwReSwKa44/VFTfnkIXeno/uATz2aZszL2Fx8hldgMbTLrommIt+1OCMGuPk2elnU6lCDIwCBlJELMfM0aUmn7vbE1iamC64UJrc9nmcil1Ukhxvur6NgA+moRa8BmPKNmFePaVlcrZZucCnTHnx2JQbFeSrrc5o5XmWDCW35hd2HVhRW8TzC8amCqZHSIE9VfkE6hzybcKQ5ybboVutBW6Cz9JHzsFmSf7H9ibwEdg8Rv4aQj/LVWZa8+Vx8Yg0WLnZ6kueIUnOwTzIj4n6+5lnSXseJRBtkukhXFrVtrMe8S+jf5moq9VPld/yXU0rgn+Jz5yMfzYkGIBZdddzFfcfdl37z+2fdRvGfjLzd8lYztVrPrldVoVWpvQ5LeHt+CD0RKkvk4MsjWNI6AELvz/3W0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9819243-552e-4185-86f9-08d7263ed59f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 13:52:41.6160 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7NFb6318MAEYa2sw1hqZqyMoTDqumTHAfz4XV4o1SbJ4CSZEGPeaI0H1hNx+qYGM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2932
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kamN//MdaANBHbJtfsL7T13DtWpWEBJV9EiR8gcZIHA=;
 b=JNZmSD+Hq06YBxHQfX42t0l6/xCmVJUT5GbNiiOrzdR6Pd9Qfgbq6/BjAn4Rw9Agdif1XWOzTtogLZdF+jfOCMjFcxlHbp5BLZ7zdzuMm0+mgJOPBT0gAv7gthU6RyelBkg20QKgN2JkGzT+eqS2JmlqlvGINiasjb7gFTgJDJA=
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
Cc: "alexdeucher@gmail.com" <alexdeucher@gmail.com>, "Xiao,
 Jack" <Jack.Xiao@amd.com>, "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

djI6IHNldCBudW1fdHlwZXMgYmFzZWQgb24gbnVtX2luc3RhbmNlcwoKbmF2aTF4IGhhcyAyIHNk
bWEgZW5naW5lcyBidXQgY29tbWl0CiJlN2I1OGQwM2I2NzggZHJtL2FtZGdwdTogcmVvcmdhbml6
ZSBzZG1hIHY0IGNvZGUgdG8gc3VwcG9ydCBtb3JlIGluc3RhbmNlcyIKY2hhbmdlcyB0aGUgbWF4
IG51bWJlciBvZiBzZG1hIGlycSB0eXBlcyAoQU1ER1BVX1NETUFfSVJRX0xBU1QpIGZyb20gMiB0
byA4CndoaWNoIGNhdXNlcyBhbWRncHVfaXJxX2dwdV9yZXNldF9yZXN1bWVfaGVscGVyKCkgdG8g
cmVjb3ZlciBpcnEgb2Ygc2RtYQplbmdpbmVzIHdpdGggZm9sbG93aW5nIGxvZ2ljOgoKKGVuYWJs
ZSBpcnEgZm9yIHNkbWEwKSAqIDEgdGltZQooZW5hYmxlIGlycSBmb3Igc2RtYTEpICogMSB0aW1l
CihkaXNhYmxlIGlycSBmb3Igc2RtYTEpICogNiB0aW1lcwoKYXMgYSByZXN1bHQsIGFmdGVyIGdw
dSByZXNldCwgaW50ZXJydXB0IGZvciBzZG1hMSBpcyBsb3N0LgoKU2lnbmVkLW9mZi1ieTogWGlh
b2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9zZG1hX3Y1XzAuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvc2RtYV92NV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y1XzAuYwpp
bmRleCA0MTkzMmQ4Yjg4YzMuLjg5MTc0ZTc3OGQyZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvc2RtYV92NV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvc2RtYV92NV8wLmMKQEAgLTE2MjUsNyArMTYyNSw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
YW1kZ3B1X2lycV9zcmNfZnVuY3Mgc2RtYV92NV8wX2lsbGVnYWxfaW5zdF9pcnFfZnVuY3MgPSB7
CiAKIHN0YXRpYyB2b2lkIHNkbWFfdjVfMF9zZXRfaXJxX2Z1bmNzKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2KQogewotCWFkZXYtPnNkbWEudHJhcF9pcnEubnVtX3R5cGVzID0gQU1ER1BVX1NE
TUFfSVJRX0xBU1Q7CisJYWRldi0+c2RtYS50cmFwX2lycS5udW1fdHlwZXMgPSBBTURHUFVfU0RN
QV9JUlFfSU5TVEFOQ0UwICsKKwkJCQkJYWRldi0+c2RtYS5udW1faW5zdGFuY2VzOwogCWFkZXYt
PnNkbWEudHJhcF9pcnEuZnVuY3MgPSAmc2RtYV92NV8wX3RyYXBfaXJxX2Z1bmNzOwogCWFkZXYt
PnNkbWEuaWxsZWdhbF9pbnN0X2lycS5mdW5jcyA9ICZzZG1hX3Y1XzBfaWxsZWdhbF9pbnN0X2ly
cV9mdW5jczsKIH0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
