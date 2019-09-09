Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0D1AD7F7
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Sep 2019 13:33:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E5C989BA5;
	Mon,  9 Sep 2019 11:33:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820055.outbound.protection.outlook.com [40.107.82.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3062A89BA5
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 Sep 2019 11:33:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ChsvXFrHr1Dyapn85FS3p2/uFaY0L4kwLbMdo8+GW7VzPP0EqWsvyo4HS/Ts+8NOguPAsrGAABIef8rqALeQGSh4qYu8Qyu8wDy30rZFwJfdmnisc35vvObTiOCjrNiiJl7HjpBgUqpU6yyZxpC0nI6DXniuJErayqs5H6Uj4X4gvUmgsZRJjVGHVOJpQ4WWYY2f6dwnGSSAVVrs7aupPPKvbtze07pPjHqXrbNrZOU1ELCVjANqaAmUxztQ9GRUY53OZR7/O26zW9Fg9JbiwRaSuRp9LFh/+UToTcyICJIhAGU6Ol7sG2F4km+FRBpnB0nnSjejl1ITkTu2fwXgew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0j1vAc6YtBLYnuE0J9uuKw0UYSPIZvffBst4UC/hQJ4=;
 b=SUOMzEvnmFFpTP+Z8NrT7jVicbEArZsnoR9/3gfSG0ZPOVrgwaB8yvvLRaneP2GvCPTQrwtsZD5UXi4l60XsF01fGUrGbrGFiv5DcT1TaTjZVqYPSoH5mCOiGMtxzcETSrwnUzfObCAdnBipqxnLiJHa93X9nCfET5SrMb1pe2zvG3kIkuQ9ccgQnMXPsWrMkoQotJgWjUINzFojYnKzkFhf1YkcpnL6neO3y0dLIeO148Q+V6O1YhmUxvEdzg4gqooqbJJAd5nPJBYV2Xp5iQD5gbroqkZwSofqbuEWcW+kCOUkrPiL1nfbdwYWovHBDpiPGrDRTosLkKX5H9hyxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3663.namprd12.prod.outlook.com (10.255.86.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Mon, 9 Sep 2019 11:33:46 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed%6]) with mapi id 15.20.2241.018; Mon, 9 Sep 2019
 11:33:46 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amd/powerplay: update smu11_driver_if_arcturus.h
Thread-Topic: [PATCH 2/2] drm/amd/powerplay: update smu11_driver_if_arcturus.h
Thread-Index: AQHVZwJw8uTgywfdRUye7iM1/1QPXQ==
Date: Mon, 9 Sep 2019 11:33:46 +0000
Message-ID: <20190909113311.28497-2-evan.quan@amd.com>
References: <20190909113311.28497-1-evan.quan@amd.com>
In-Reply-To: <20190909113311.28497-1-evan.quan@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR06CA0020.apcprd06.prod.outlook.com
 (2603:1096:202:2e::32) To MN2PR12MB3344.namprd12.prod.outlook.com
 (2603:10b6:208:c5::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf11225e-3438-42b3-eeaf-08d735199354
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3663; 
x-ms-traffictypediagnostic: MN2PR12MB3663:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3663766474F247241D186CA9E4B70@MN2PR12MB3663.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 01559F388D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(396003)(366004)(39860400002)(376002)(199004)(189003)(50226002)(102836004)(6116002)(66556008)(66946007)(64756008)(66476007)(5660300002)(5640700003)(6916009)(76176011)(478600001)(186003)(26005)(99286004)(256004)(8936002)(54906003)(6436002)(4326008)(316002)(81166006)(81156014)(86362001)(8676002)(53936002)(66066001)(36756003)(7736002)(11346002)(6506007)(6486002)(386003)(3846002)(6512007)(476003)(2906002)(14454004)(2351001)(52116002)(71200400001)(1076003)(71190400001)(446003)(486006)(305945005)(2616005)(2501003)(25786009)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3663;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AmeTk08w5Uki/KZVyRDvWerRr1Dm0A+VcNRHjylyyFcN09qT19pImaYJzQB8dcxnbHajuJBqRQZMZgX6vwqyTf5QdYFRqZTZzXhOxq1vcnRCs23MnUSSJXAaTVSJlzr550ug6GF0cyjZiGH/d8oCvy3fAbVkaDcUlyQ5Ws2PuH9f5WhSLZPv/jdNFWtxHUvFA11vQvU1e2xEyK39+kOn5uDzrAJVNG5QGfb+OKnlv5Gg5AAgH/66UdNuyVogN/sogsRBBr1xHJ5p7sRtRoZLpVJ5m9X9qjxPdfA1zCc7DiVVbe3pI8vO9Cc9vCNzF09ixyNlmssWAzIDsQc3DIHbPCO9CWwtiLuszrxd6ujNCCYUI35/00uLcWXEZqhosUPWzs3Ie8nyDKIkaMRWgcHkyCtkPsMpbDvyqAjgWvhnBNA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf11225e-3438-42b3-eeaf-08d735199354
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 11:33:46.2283 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KI3w7v76dWcPNrnoWwKMkacOS3oA8cjoiCf1ygzfwgMPMKMqCow/eIYba9BPqbDT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3663
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0j1vAc6YtBLYnuE0J9uuKw0UYSPIZvffBst4UC/hQJ4=;
 b=bkEXy8i6g0PygeZiRutdR+g+r+QeopcG98QDgWB6jTCrcl6YPAWMSdWhLatacYIdd2AdFxz/TH62zwFQpi3WSBSN5i9GNuJI2tJ1AevVzyuw6f9mkKCTVLxJsOnCQMIjOXWz1Mef5rN4VN4ztxGUyN2BlJbf505dxDHm/+6Sqnw=
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
Cc: "Li, Candice" <Candice.Li@amd.com>, "Gui, Jack" <Jack.Gui@amd.com>, "Quan, 
 Evan" <Evan.Quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWxzbyBidW1wIHRoZSBTTVUxMV9EUklWRVJfSUZfVkVSU0lPTl9BUkNULgoKQ2hhbmdlLUlkOiBJ
Nzg2MDQ3ZDkzYmY0ZTFmMDkwNTA2OWUyYzc0MjQ3OTc0MDc3OGZlNgpTaWduZWQtb2ZmLWJ5OiBF
dmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPgotLS0KIC4uLi9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvaW5jL3NtdTExX2RyaXZlcl9pZl9hcmN0dXJ1cy5oICAgIHwgNiArKysrKy0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9zbXVfdjExXzAuaCAgICAgICAgICAgICAgIHwgMiAr
LQogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdTExX2RyaXZlcl9p
Zl9hcmN0dXJ1cy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdTExX2Ry
aXZlcl9pZl9hcmN0dXJ1cy5oCmluZGV4IGUwMjk1MGI1MDVmYS4uNDBhNTFhMTQxMzM2IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211MTFfZHJpdmVyX2lm
X2FyY3R1cnVzLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdTEx
X2RyaXZlcl9pZl9hcmN0dXJ1cy5oCkBAIC02OTYsNyArNjk2LDExIEBAIHR5cGVkZWYgc3RydWN0
IHsKICAgdWludDhfdCAgICAgIEdwaW9JMmNTZGE7ICAgICAgICAgIC8vIFNlcmlhbCBEYXRhCiAg
IHVpbnQxNl90ICAgICBHcGlvUGFkZGluZzsKIAotICB1aW50MzJfdCAgICAgQm9hcmRSZXNlcnZl
ZFs5XTsKKyAgLy8gUGxhdGZvcm0gaW5wdXQgdGVsZW1ldHJ5IHZvbHRhZ2UgY29lZmZpY2llbnQK
KyAgdWludDMyX3QgICAgIEJvYXJkVm9sdGFnZUNvZWZmQTsgICAgLy8gZGVjb2RlIGJ5IC8xMDAw
CisgIHVpbnQzMl90ICAgICBCb2FyZFZvbHRhZ2VDb2VmZkI7ICAgIC8vIGRlY29kZSBieSAvMTAw
MAorCisgIHVpbnQzMl90ICAgICBCb2FyZFJlc2VydmVkWzddOwogCiAgIC8vIFBhZGRpbmcgZm9y
IE1NSFVCIC0gZG8gbm90IG1vZGlmeSB0aGlzCiAgIHVpbnQzMl90ICAgICBNbUh1YlBhZGRpbmdb
OF07IC8vIFNNVSBpbnRlcm5hbCB1c2UKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2luYy9zbXVfdjExXzAuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2luYy9zbXVfdjExXzAuaAppbmRleCBiMWUzNzBlMTlkMjIuLjNiOWUzYTI3N2RlZCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdV92MTFfMC5oCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9zbXVfdjExXzAuaApAQCAtMjcsNyAr
MjcsNyBAQAogCiAjZGVmaW5lIFNNVTExX0RSSVZFUl9JRl9WRVJTSU9OX0lOViAweEZGRkZGRkZG
CiAjZGVmaW5lIFNNVTExX0RSSVZFUl9JRl9WRVJTSU9OX1ZHMjAgMHgxMwotI2RlZmluZSBTTVUx
MV9EUklWRVJfSUZfVkVSU0lPTl9BUkNUIDB4MDkKKyNkZWZpbmUgU01VMTFfRFJJVkVSX0lGX1ZF
UlNJT05fQVJDVCAweDBBCiAjZGVmaW5lIFNNVTExX0RSSVZFUl9JRl9WRVJTSU9OX05WMTAgMHgz
MwogI2RlZmluZSBTTVUxMV9EUklWRVJfSUZfVkVSU0lPTl9OVjEyIDB4MzMKICNkZWZpbmUgU01V
MTFfRFJJVkVSX0lGX1ZFUlNJT05fTlYxNCAweDM0Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
