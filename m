Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC6099520
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 15:33:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907446EB2B;
	Thu, 22 Aug 2019 13:33:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760071.outbound.protection.outlook.com [40.107.76.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32B26EB2B
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 13:33:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJTLInAfJUjLkmJeZqkTy5rVYOLeo2cAzjKI8PyB/ulFlZFEtfPjk0jf4kuu6YsJL/4MLth4660JT21dyglIWYv9OJ7JudI8ZP3glF9FzSVvu8nLwraKJ96ezpd/6EtJdsK//91v0DR5E34S4fDm/9fhQW+xo5nSdxcVPyL1HHss1vYjQSdYxMbj8mFGjdnnUShksjQSLRHKUM0UZKptERVuZFHaKTG7R5Iyr8KSoERvjrzniLzFSLUULMkKSNxqWgqD4pvmcWFzNBfrNTbgIzl71B6GpsE4RDVudisergmvHJyDUOTwzgVJ3sBYULpBw0rf+A0XLjNaqqbYKGgh5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKnmqHGDUIGtazLZqL46J88D8qMEQP6O30Xzj39DfvQ=;
 b=MGzmBVHUsqDNPETF7KJz3zOaP7Dk/QuSRrbFRx6kjAi9I3UMBsj5817vG6UZ2VcULW78d+uD7Gs5cPEQzge2ygfVV+Fiv/TOfMQOHY7mVtQ73nLye8kvrhhE3om2lNwGUStHNlafZhTK03dp0LQI4K+1wvLGXaCscSv+jFiKLJWc/NHt/bbyoS/8Y2n1Q2dmAlXR6MPWjIupzigmtVK0N/EytPpU0g1/egjwrl6KD4ojkW2hE7bIQ3NOFM+xiWWPqXq6wxNsz5G8/ytDB/ywA21NHfCh1jhapMHykSNfYP3vBP7+ny0cx7AZ6R0KXly+bbLa4xGknG6GtW1v+Z+g1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1618.namprd12.prod.outlook.com (10.172.21.149) by
 BN6PR12MB1699.namprd12.prod.outlook.com (10.175.97.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Thu, 22 Aug 2019 13:33:08 +0000
Received: from BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::4d5d:1a87:aac9:d7b2]) by BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::4d5d:1a87:aac9:d7b2%10]) with mapi id 15.20.2178.020; Thu, 22 Aug
 2019 13:33:08 +0000
From: "Russell, Kent" <Kent.Russell@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/powerplay: Fix Vega20 Average Power value v4
Thread-Topic: [PATCH] drm/powerplay: Fix Vega20 Average Power value v4
Thread-Index: AQHVWO4iK1FgZ8+TXUCJhIUCZ5x5KQ==
Date: Thu, 22 Aug 2019 13:33:08 +0000
Message-ID: <20190822133259.6241-1-kent.russell@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YTBPR01CA0030.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::43) To BN6PR12MB1618.namprd12.prod.outlook.com
 (2603:10b6:405:b::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e91940c8-38c1-4530-a314-08d727054532
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN6PR12MB1699; 
x-ms-traffictypediagnostic: BN6PR12MB1699:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB1699EA5379531FC8BDF3252E85A50@BN6PR12MB1699.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01371B902F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(346002)(366004)(396003)(199004)(189003)(7736002)(8676002)(71200400001)(26005)(81166006)(486006)(186003)(71190400001)(81156014)(6512007)(25786009)(36756003)(2906002)(66476007)(2351001)(4326008)(66446008)(66556008)(64756008)(2501003)(52116002)(86362001)(66946007)(305945005)(14454004)(386003)(102836004)(6916009)(5660300002)(478600001)(6436002)(5640700003)(99286004)(316002)(2616005)(8936002)(53936002)(1076003)(6116002)(3846002)(256004)(6506007)(476003)(66066001)(50226002)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1699;
 H:BN6PR12MB1618.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nbRRq3vV0w+x3ojjn5aMWMxYLtqbi2VehHCOF2HS484AsuzOKt+QyySgLWWqAmd/hRgXKaGHx2u7M7EyLiddJYovhP9zfzWJlaSAkHB2c+mpX9slt3u2xSv6kV3xlYWwvoLe7FjeZEGE12nSV8OP2GJMmVeVLP+lLiIuR78ZhUeB7JNAptlaSGsezUIYxSxZpANjNCjHae7upCpeYDoiWBdJXrkMpz9WQNqa2XKc3AX76yoXLhTmynzuzA2rDPb7r29fNLzP0PvFn13s5V/EjZG3zQowh1ol48yFKq4fAoWZLFCPgGPkT6q0m0MPSYzT8AHmpO9mL/u5YRAP0dDgWozpsQxp5qkST8HlImCf4Wk0kUlU4XZNU1JzlG27sGDyiANRbpBn/OGSmmASLjyvcViTGQv7q8J2ZUs7ypFYBH8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e91940c8-38c1-4530-a314-08d727054532
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2019 13:33:08.8099 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QzfQoQtDlWwMQ38OZXfRQdn2eIQX/vfkId03a9eAlR3kotQdzpBVuuZyTBGv7EnFO21QYwblnIHUWMm5clEjyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1699
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKnmqHGDUIGtazLZqL46J88D8qMEQP6O30Xzj39DfvQ=;
 b=oaeULpeAsEZ/Eux8+h8Tk9DFp+G4gSXjZ1fmNzxu/AWYz3Xd5QQ7IPFUESxb1HOsvr1LKC/GL+tJEBmSQS7ScF4zqu8YAZuIUem2bmki/+ESdWOQd7/Gv/ueg3c5lxv9/uO5TtZi9BTFXpP+IUo0V0hLJtB6V/SJT2p7rbaJilY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kent.Russell@amd.com; 
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
Cc: "Russell, Kent" <Kent.Russell@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIFNNVSBjaGFuZ2VkIHJlYWRpbmcgZnJvbSBDdXJyU29ja2V0UG93ZXIgdG8gQXZlcmFnZVNv
Y2tldFBvd2VyLCBzbwpyZWZsZWN0IHRoaXMgYWNjb3JkaW5nbHkuIFRoaXMgZml4ZXMgdGhlIGlz
c3VlIHdoZXJlIEF2ZXJhZ2UgUG93ZXIKQ29uc3VtcHRpb24gd2FzIGJlaW5nIHJlcG9ydGVkIGFz
IDAgZnJvbSBTTVUgNDAuNDYtb253YXJkCgp2MjogRml4ZWQgaGVhZGxpbmUgcHJlZml4CnYzOiBB
ZGQgY2hlY2sgZm9yIFNNVSB2ZXJzaW9uIGZvciBwcm9wZXIgY29tcGF0aWJpbGl0eQp2NDogU3R5
bGUgZml4CgpDaGFuZ2UtSWQ6IEk0NzFmOTMzMTY4MjBmMTQwMWNiNDk3ZWVmZTI5ZGE2ODM3NmE0
YmI5ClNpZ25lZC1vZmYtYnk6IEtlbnQgUnVzc2VsbCA8a2VudC5ydXNzZWxsQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTIwX2h3bWdyLmMgfCAg
NSArKysrLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jICAgICAg
ICAgfCAxMCArKysrKysrKystCiAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
aHdtZ3IvdmVnYTIwX2h3bWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21n
ci92ZWdhMjBfaHdtZ3IuYwppbmRleCAwNTE2YzI5NGIzNzcuLjlmNTBhMTJmNWMwMyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTIwX2h3bWdyLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTIwX2h3bWdyLmMK
QEAgLTIxMDEsNyArMjEwMSwxMCBAQCBzdGF0aWMgaW50IHZlZ2EyMF9nZXRfZ3B1X3Bvd2VyKHN0
cnVjdCBwcF9od21nciAqaHdtZ3IsCiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAotCSpxdWVy
eSA9IG1ldHJpY3NfdGFibGUuQ3VyclNvY2tldFBvd2VyIDw8IDg7CisJaWYgKGh3bWdyLT5zbXVf
dmVyc2lvbiA8IDB4MjgyZTAwKQorCQkqcXVlcnkgPSBtZXRyaWNzX3RhYmxlLkN1cnJTb2NrZXRQ
b3dlciA8PCA4OworCWVsc2UKKwkJKnF1ZXJ5ID0gbWV0cmljc190YWJsZS5BdmVyYWdlU29ja2V0
UG93ZXIgPDwgODsKIAogCXJldHVybiByZXQ7CiB9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS92ZWdhMjBfcHB0LmMKaW5kZXggZTE0MzYzMTgyNjkxLi4wZmFjODI0NDkwZDcgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKQEAgLTI5MTcsNiArMjkx
Nyw3IEBAIHN0YXRpYyBpbnQgdmVnYTIwX2dldF9mYW5fc3BlZWRfcGVyY2VudChzdHJ1Y3Qgc211
X2NvbnRleHQgKnNtdSwKIAogc3RhdGljIGludCB2ZWdhMjBfZ2V0X2dwdV9wb3dlcihzdHJ1Y3Qg
c211X2NvbnRleHQgKnNtdSwgdWludDMyX3QgKnZhbHVlKQogeworCXVpbnQzMl90IHNtdV92ZXJz
aW9uOwogCWludCByZXQgPSAwOwogCVNtdU1ldHJpY3NfdCBtZXRyaWNzOwogCkBAIC0yOTI3LDcg
KzI5MjgsMTQgQEAgc3RhdGljIGludCB2ZWdhMjBfZ2V0X2dwdV9wb3dlcihzdHJ1Y3Qgc211X2Nv
bnRleHQgKnNtdSwgdWludDMyX3QgKnZhbHVlKQogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAK
LQkqdmFsdWUgPSBtZXRyaWNzLkN1cnJTb2NrZXRQb3dlciA8PCA4OworCXJldCA9IHNtdV9nZXRf
c21jX3ZlcnNpb24oc211LCBOVUxMLCAmc211X3ZlcnNpb24pOworCWlmIChyZXQpCisJCXJldHVy
biByZXQ7CisKKwlpZiAoc211X3ZlcnNpb24gPCAweDI4MmUwMCkKKwkJKnZhbHVlID0gbWV0cmlj
cy5DdXJyU29ja2V0UG93ZXIgPDwgODsKKwllbHNlCisJCSp2YWx1ZSA9IG1ldHJpY3MuQXZlcmFn
ZVNvY2tldFBvd2VyIDw8IDg7CiAKIAlyZXR1cm4gMDsKIH0KLS0gCjIuMTcuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
