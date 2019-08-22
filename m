Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 179C799328
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 14:20:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A13F06EB0C;
	Thu, 22 Aug 2019 12:20:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790078.outbound.protection.outlook.com [40.107.79.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1536EB0C
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 12:20:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GNx3w9QImN670QK/hzaXIakP0k6KgHso6JrFZcu5yYkDj7bFJIB6jzfXgB0nx6bDYn6wIQQRIDhynF+bpvGcb6bIrUjavbXFwHX4mZy7CJjIO+aFxmjsrssLpROcPEfyScAj7rlzScNKVL6JPHC5j4wUcEZL894cVK7aOxVb4zcBUm3JIArzDojQekJPTmhTu8JRllUXazbfxAhq0VsYCD9hC3ezq8/knZux4rL2GLi3aLdI05eroPeW6Ee/WX1sLdW0T2vjFs8Od/poRVmro49Abw5ulkz2eQMO+xUzal2Ae9KESXsvaZKupOg+CDrTD3CY41cxhX11WYq8pbix2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wU+FN305toJTMQzMmaxQEsF+wYXMGAFMD5Ah55Bf5H4=;
 b=GAqT+qyZeTutAebq9QxGeUgm3GIqfmVeKJnBwMVpF1SbNoYp1x1NviHTkoESdxyFOaY/eAp3xy80MflYwwh7I2KPI8XlQoVd+vb7fEK27p3+Ff3QtPkVKdiqABVeAa20KbW2R2zOp7TdXq/53Xi2yE7D3pFdVEU64YCYhVJlZOBOekLN2+Mp7yiJzMpnaEHtDIQL3leXpP47FOXia5b9YM96WIKKz/u1b5FZyrFfqQ2bFTBM3G8yzqhUIouGZSGGTyeT3dTohDf4Lyk9go5U5m5U3bAkbmSRnBFUlyvFMI6YTlrrOWceSz1hMCfk1tsdSQzQws7r/jYSQ5rAcvXQ+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1618.namprd12.prod.outlook.com (10.172.21.149) by
 BN6PR12MB1667.namprd12.prod.outlook.com (10.172.18.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Thu, 22 Aug 2019 12:20:54 +0000
Received: from BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::4d5d:1a87:aac9:d7b2]) by BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::4d5d:1a87:aac9:d7b2%10]) with mapi id 15.20.2178.020; Thu, 22 Aug
 2019 12:20:54 +0000
From: "Russell, Kent" <Kent.Russell@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/powerplay: Fix Vega20 Average Power value
Thread-Topic: [PATCH] drm/powerplay: Fix Vega20 Average Power value
Thread-Index: AQHVWOQLW5plEEOVzkutoVf/WqRI1g==
Date: Thu, 22 Aug 2019 12:20:54 +0000
Message-ID: <20190822122044.32690-1-kent.russell@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YT1PR01CA0001.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::14)
 To BN6PR12MB1618.namprd12.prod.outlook.com
 (2603:10b6:405:b::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1fb38503-ee5c-4cb9-9d45-08d726fb2dca
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN6PR12MB1667; 
x-ms-traffictypediagnostic: BN6PR12MB1667:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB166700D54DFE8AF9629CF25885A50@BN6PR12MB1667.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 01371B902F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(136003)(396003)(346002)(366004)(199004)(189003)(7736002)(66066001)(305945005)(2501003)(256004)(2351001)(71190400001)(71200400001)(36756003)(486006)(386003)(6506007)(476003)(186003)(2616005)(1076003)(102836004)(86362001)(26005)(64756008)(6486002)(66556008)(6436002)(66446008)(66946007)(52116002)(81156014)(99286004)(8676002)(50226002)(8936002)(2906002)(316002)(4326008)(25786009)(14454004)(478600001)(3846002)(6512007)(6916009)(81166006)(5660300002)(5640700003)(53936002)(6116002)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1667;
 H:BN6PR12MB1618.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vG5EEDzD2OEpMM0wKADbJN4wUjp7bNT4H9/r87BzjILwEAS1+4sqC9YMyV4QNhvKRGwi9mc7b3LyBLGYJrQjGksg5ktI2B9mzfMOJO8DKNjsDS2kUY/Ai2c3vW3BP4rox1Q1angHRRMfhuWHQo+B5BjRT1N45S5Hd3jujNQx2U+DAUCe5qU7kPm0s/Yl3rY0M81Cp3d1oLzie/llD1EKUP7i3ZAfD0TAinsVdq1M/ecSuyqnMJ6isnkH1S4bLKaozlUPRJ+xloKu9hwreV5U4qOhuWcbTpVuP5Adl5Vih2zL1TxQJZ9zBZHId2AruC+VwZf1JMoOVR8DBVK7fZblCZZ22Ydlsh3HZbPhb/ndvi+i224/6i9S5//DXHuANmjC/U+AQqukKaSmEwP/BNh0tV6Rw2BRege16NVQnybB+7g=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fb38503-ee5c-4cb9-9d45-08d726fb2dca
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2019 12:20:54.5133 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5baa0EBBUKeyq+nrPLznrNjGtLJgXk37tthBUS2LXY0JCHphWUpW1fmIlEZYnedmzprBBOJ3tdKqZeVGF4VAMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1667
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wU+FN305toJTMQzMmaxQEsF+wYXMGAFMD5Ah55Bf5H4=;
 b=HBFSSjE2Ym58MT81Cgv7eUs6AR+a6bCpDW59qc/NixX+I9XhKHCH4J4JI/WvzTfeoFF9flH0rlcHWZWc3TAxslzwUOcWvciYM6qk6lZ+b103AtqqvzwPZHe/tstrM3w0dmMAtb5Ng1Bos0B/2SiKnId8AuMy5Wc9srYw6NnSC/k=
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
IDAgZnJvbSBTTVUgNDAuNDYtb253YXJkCgp2MjogRml4ZWQgaGVhZGxpbmUgcHJlZml4CgpDaGFu
Z2UtSWQ6IEk0NzFmOTMzMTY4MjBmMTQwMWNiNDk3ZWVmZTI5ZGE2ODM3NmE0YmI5ClNpZ25lZC1v
ZmYtYnk6IEtlbnQgUnVzc2VsbCA8a2VudC5ydXNzZWxsQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTIwX2h3bWdyLmMgfCAyICstCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMgICAgICAgICB8IDIgKy0KIDIgZmls
ZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF9od21nci5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTIwX2h3bWdyLmMKaW5kZXggMDUx
NmMyOTRiMzc3Li4xODIwMTMzZjBjZWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF9od21nci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF9od21nci5jCkBAIC0yMTAxLDcgKzIxMDEsNyBAQCBzdGF0
aWMgaW50IHZlZ2EyMF9nZXRfZ3B1X3Bvd2VyKHN0cnVjdCBwcF9od21nciAqaHdtZ3IsCiAJaWYg
KHJldCkKIAkJcmV0dXJuIHJldDsKIAotCSpxdWVyeSA9IG1ldHJpY3NfdGFibGUuQ3VyclNvY2tl
dFBvd2VyIDw8IDg7CisJKnF1ZXJ5ID0gbWV0cmljc190YWJsZS5BdmVyYWdlU29ja2V0UG93ZXIg
PDwgODsKIAogCXJldHVybiByZXQ7CiB9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS92ZWdhMjBfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92
ZWdhMjBfcHB0LmMKaW5kZXggZTE0MzYzMTgyNjkxLi4xN2FmMTJlZTllNzggMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKQEAgLTI5MjcsNyArMjkyNyw3IEBA
IHN0YXRpYyBpbnQgdmVnYTIwX2dldF9ncHVfcG93ZXIoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUs
IHVpbnQzMl90ICp2YWx1ZSkKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0JKnZhbHVlID0g
bWV0cmljcy5DdXJyU29ja2V0UG93ZXIgPDwgODsKKwkqdmFsdWUgPSBtZXRyaWNzLkF2ZXJhZ2VT
b2NrZXRQb3dlciA8PCA4OwogCiAJcmV0dXJuIDA7CiB9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
