Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 335C5994F5
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 15:30:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A7D6E4CA;
	Thu, 22 Aug 2019 13:30:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760049.outbound.protection.outlook.com [40.107.76.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D2D6E4CA
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 13:30:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lRAuzZRm1IfBDBbGNtI1z4HKyZmqJhgs4UdIx1IGzCwbvM9Gw7wLpferXSZNWic9bBJsE/Mhy0Jvtl7Lo0PEDYFGOvvwQWRPFnFm/lEEPi6P7vV6RDckNZHRJ3gC0byvN/vjhapR8ilExQsQ/Sf9JT3MyRNFqzF77/ZKG4GlhoPg9qH9xbW0+1CZCmh1xI7xgOt0eL/vtd4Van6VCvrrZXDhtruY9I87MrwCqnX892O5gnj0qmvujreMMOxJJ3+Eev1/mFjDA51YOZhfNOq8oz328SliZTtXnjmJ0quRbLbwAXaw+4VgS4zpy/3km8RlZiYrzQiPHlYG6fFF+Yq7og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSVogOGCw6txoCdp0TYt3Qz6zaaLvgMNGkqMM3IiC9Q=;
 b=oP1y4OWvfVn6AQEuCMKqhss4Kb7t/HrW1jHMn9MsAZAr0wdlgDVGszVXvQtfi6o6SD/eClkiQJm8SCaJtsB/1x153CVqM2bFXz5STP0mnMmKZoyi/vTMYKM+RaQPYG9Gube27zIAYLzfwLQy8pik3MY7/EvDDGlAzviWV2uFXUt5Is8gU5sx5xU9FmrhgETF/vsr5v/5uvkc9KHLVq6JmbLLG5Lnb+Uck5I8Xd/3VryeWGE6EjK3cVLEN97JnVweANpdvkKgv71GUbMarULVbug4jEaPFmdyDLAYi7z8wP8wmzkQqYk/aL1Yx3F/jnZ8t3ZLukwnlEAyLWEQjdcKCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1618.namprd12.prod.outlook.com (10.172.21.149) by
 BN6PR12MB1699.namprd12.prod.outlook.com (10.175.97.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Thu, 22 Aug 2019 13:30:10 +0000
Received: from BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::4d5d:1a87:aac9:d7b2]) by BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::4d5d:1a87:aac9:d7b2%10]) with mapi id 15.20.2178.020; Thu, 22 Aug
 2019 13:30:10 +0000
From: "Russell, Kent" <Kent.Russell@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/powerplay: Fix Vega20 Average Power value v3
Thread-Topic: [PATCH] drm/powerplay: Fix Vega20 Average Power value v3
Thread-Index: AQHVWO24y1gXlT939Eiexp4235yzMg==
Date: Thu, 22 Aug 2019 13:30:10 +0000
Message-ID: <20190822132958.5927-1-kent.russell@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YTXPR0101CA0038.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::15) To BN6PR12MB1618.namprd12.prod.outlook.com
 (2603:10b6:405:b::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f630e31e-cd5b-43b0-387d-08d72704daa1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN6PR12MB1699; 
x-ms-traffictypediagnostic: BN6PR12MB1699:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB1699EB49185A6E19A8A1109E85A50@BN6PR12MB1699.namprd12.prod.outlook.com>
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
x-microsoft-antispam-message-info: 94I5iE9kuWn5bhXMZWrBYAyBdSJavnjxw72KsByyDaS3uPisLtHAZDnaYxpTNmhMq0yOF4RMUH8uSBe0qlooMk2w2ND7yBvJpJkoMGfLH92nZHVVFGeeXw/7Cpg11/PFaX3IoyVBzGQxyhZbTUgbrgZDzfRGzmwQSL02LRPH9GxOgGJoTi8bB0n4IKusP/r5HLq+NYOxji2QXaeGLVVBW2zvU6VcnEqiYh46Yylx7relajl5Gew35ZFgWpkIXNB67EcMyrazvWcYofhB9aaNcvHFSx/lOwJda6eeKxti4JFNR9fb1WCtF0fuDhhRGro1LRIAQUyeP9C+UG2ViweekZLBM74luszZBWExDtVN9BAQNHuDEUzbFaTVHEWjUE44hE5D1LbVXdUhz+YdrottmRL+ePy01dZWqpCf+cLMG3w=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f630e31e-cd5b-43b0-387d-08d72704daa1
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2019 13:30:10.1184 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2uFYYVwnCeoX+Rcu6C92uIobtXyGVUfoGa44rOMHJEKkWlWQXBLAKI6wMRmcinzdopQvzAXWS2oTxbjL10W70g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1699
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSVogOGCw6txoCdp0TYt3Qz6zaaLvgMNGkqMM3IiC9Q=;
 b=oXLxL/xJ3YKlb+QouwLhjJQyrJWGqBpY7zOJz4O1GUbabjcYwLu4znazwlpRlp0CvsyE3OT7TKG1t8KFauxkvy703fIY6kFXUAr8nxoHNoOBk0X1kRRZ9xGnXHdz41rF41BRfJRzzyy5Y+G6BOLPQ6JErC9Gz9ey939hjlNRZhQ=
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
ZGQgY2hlY2sgZm9yIFNNVSB2ZXJzaW9uIGZvciBwcm9wZXIgY29tcGF0aWJpbGl0eQoKQ2hhbmdl
LUlkOiBJNDcxZjkzMzE2ODIwZjE0MDFjYjQ5N2VlZmUyOWRhNjgzNzZhNGJiOQpTaWduZWQtb2Zm
LWJ5OiBLZW50IFJ1c3NlbGwgPGtlbnQucnVzc2VsbEBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF9od21nci5jIHwgIDUgKysrKy0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYyAgICAgICAgIHwgMTAgKysrKysr
KysrLQogMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF9o
d21nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTIwX2h3bWdy
LmMKaW5kZXggMDUxNmMyOTRiMzc3Li45ZjUwYTEyZjVjMDMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF9od21nci5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF9od21nci5jCkBAIC0yMTAxLDcgKzIx
MDEsMTAgQEAgc3RhdGljIGludCB2ZWdhMjBfZ2V0X2dwdV9wb3dlcihzdHJ1Y3QgcHBfaHdtZ3Ig
Kmh3bWdyLAogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKLQkqcXVlcnkgPSBtZXRyaWNzX3Rh
YmxlLkN1cnJTb2NrZXRQb3dlciA8PCA4OworCWlmIChod21nci0+c211X3ZlcnNpb24gPCAweDI4
MmUwMCkKKwkJKnF1ZXJ5ID0gbWV0cmljc190YWJsZS5DdXJyU29ja2V0UG93ZXIgPDwgODsKKwll
bHNlCisJCSpxdWVyeSA9IG1ldHJpY3NfdGFibGUuQXZlcmFnZVNvY2tldFBvd2VyIDw8IDg7CiAK
IAlyZXR1cm4gcmV0OwogfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvdmVnYTIwX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3Bw
dC5jCmluZGV4IGUxNDM2MzE4MjY5MS4uNmI0YmU1MjM3ZWYwIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jCkBAIC0yOTE3LDYgKzI5MTcsNyBAQCBzdGF0aWMg
aW50IHZlZ2EyMF9nZXRfZmFuX3NwZWVkX3BlcmNlbnQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUs
CiAKIHN0YXRpYyBpbnQgdmVnYTIwX2dldF9ncHVfcG93ZXIoc3RydWN0IHNtdV9jb250ZXh0ICpz
bXUsIHVpbnQzMl90ICp2YWx1ZSkKIHsKKwl1aW50MzJfdCBzbXVfdmVyc2lvbjsKIAlpbnQgcmV0
ID0gMDsKIAlTbXVNZXRyaWNzX3QgbWV0cmljczsKIApAQCAtMjkyNyw3ICsyOTI4LDE0IEBAIHN0
YXRpYyBpbnQgdmVnYTIwX2dldF9ncHVfcG93ZXIoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIHVp
bnQzMl90ICp2YWx1ZSkKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0JKnZhbHVlID0gbWV0
cmljcy5DdXJyU29ja2V0UG93ZXIgPDwgODsKKwlyZXQgPSBzbXVfZ2V0X3NtY192ZXJzaW9uKHNt
dSwgTlVMTCwgJnNtdV92ZXJzaW9uKTsKKyAgICAgICAgaWYgKHJldCkKKyAgICAgICAgICAgICAg
ICByZXR1cm4gcmV0OworCisJaWYgKHNtdV92ZXJzaW9uIDwgMHgyODJlMDApCisJCSp2YWx1ZSA9
IG1ldHJpY3MuQ3VyclNvY2tldFBvd2VyIDw8IDg7CisJZWxzZQorCQkqdmFsdWUgPSBtZXRyaWNz
LkF2ZXJhZ2VTb2NrZXRQb3dlciA8PCA4OwogCiAJcmV0dXJuIDA7CiB9Ci0tIAoyLjE3LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
