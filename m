Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC629BEDB5
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 10:47:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C02C6EE10;
	Thu, 26 Sep 2019 08:47:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780085.outbound.protection.outlook.com [40.107.78.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 104D96EE10
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 08:47:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HyzvRgi6iuRb9/cU/FuqXIWRm4xX4bii3wf0hxARkXZYylLwC0qZLm9uqnT9TuPwpN6JVjz3AYtBcCfGjkGI43e1KdJNHl743YzJ+NFkkGHtxTpq7FrqBy8f7UR2lVanqmp/x1MIIdPlBjiO2VGaHVHAC3rQ3/mb+BqRZCNdEBYwk5lAEGfk9NX35NsdqL9Mem7ggh2nGKTjuBSbFvzL7SkhpUrMrYZyPtF+Wp+NSYdaMC/9LydD2Kjl1o7SZfwncfzDgwpjDryTwW7u/TfWUK8fOlcqAQQaFNKSUJx855E2W2Q4R4+sQ/4WbIoLpeEKhMUuq0O3stAjCwJ7eQAG0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvgd9HT8PodmeatP4u+CBgyIgC8T0ExNmGS9JbwU+AY=;
 b=F3Cz8po8ZQFw05q3KRBqrBdVBtpFZiBtNEjaNURkwIFm3MhyMJE2BdV5p0kJlSnWuOloJoO4qz7+HDhbJDIKpx6LqoCVbM/fsNzAf06euZIEtYl0DvmZ4li9oWndYN1YQx0WRRvnbfkoG32L9+eEmk+tuBULkC5TUTHi7yKMtNuInPq3OHpBbenCvo6uGZ+CmNn/SsdC7ddx4KHtr2F13R0OV/BVcq50OIvTTFZIHeaYXomDpMo/a2kwoh8TXNoZf/K7MQsQX2S0sgKtEbhKC2eDZVUrlGBgPAuSu7wfa+wNJrp5zCh3dNVXOMqmN2JXNc0uv/AhVazQbCAgVDhuJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3598.namprd12.prod.outlook.com (20.178.244.84) by
 MN2PR12MB4256.namprd12.prod.outlook.com (52.135.48.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15; Thu, 26 Sep 2019 08:47:06 +0000
Received: from MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::19b5:2b97:5b3c:8b2a]) by MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::19b5:2b97:5b3c:8b2a%7]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 08:47:06 +0000
From: "Feng, Kenneth" <Kenneth.Feng@amd.com>
To: "Feng, Kenneth" <Kenneth.Feng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v2] drm/amd/amdgpu: disable MMHUB PG for navi10
Thread-Topic: [PATCH v2] drm/amd/amdgpu: disable MMHUB PG for navi10
Thread-Index: AQHVdEZ+nNTuuIcoK02TuBFlQ1z/V6c9pTUg
Date: Thu, 26 Sep 2019 08:47:06 +0000
Message-ID: <MN2PR12MB35985800E64D5987D10D5CDE8E860@MN2PR12MB3598.namprd12.prod.outlook.com>
References: <1569487411-24923-1-git-send-email-kenneth.feng@amd.com>
In-Reply-To: <1569487411-24923-1-git-send-email-kenneth.feng@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 354ef20e-d418-4e27-e5dd-08d7425e1c89
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB4256:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB425632EBA2007485EE7C85A88E860@MN2PR12MB4256.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(13464003)(189003)(199004)(64756008)(66446008)(66946007)(66476007)(316002)(9686003)(6246003)(66556008)(76116006)(8936002)(52536014)(6436002)(5660300002)(256004)(66066001)(14444005)(2501003)(81156014)(81166006)(55016002)(8676002)(305945005)(71190400001)(74316002)(476003)(71200400001)(486006)(229853002)(7736002)(4744005)(25786009)(33656002)(446003)(186003)(26005)(99286004)(7696005)(478600001)(86362001)(11346002)(53546011)(102836004)(6506007)(6116002)(3846002)(110136005)(2906002)(76176011)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4256;
 H:MN2PR12MB3598.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qLEXcOlbqySw5KbZe4K/L1XBiRN3D4U5vyDeR74KFprSRRZqVe1fGNwRg9AHvmyj7i0xyDCnJsUu/oFiPfFNgS+b0MyE8A+QaScLRQSBRRofpGiQJqnwOsjj6yq2ZfBHqeaIgryFJexdMiNkXVvQJRs237lvhEwrN4XLi3LaWv2Tzu0dqJ+pzPVwux3iFRktQYLHiE/Cw0NSObYjhRsC7kobmdYLcoEjWSw856XHlNyAnX+A42WTcibyl2Q6cviBcp9U2i5Dog6rNrdiSfSfJ9ZojAZv4LU9XEp7BjGiaTC7bQIXo6/PJNxe9OLvP35n2FB31DvvP8jSAUkApy8fADSfzTfs2tDMe/LVX4WFtdkh6qS+9YNp/tNHuAM8yM8YQ91rbw6JbQTdGORolOcVKDr+2xCBJT9/WqjSfZeXTAM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 354ef20e-d418-4e27-e5dd-08d7425e1c89
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 08:47:06.8343 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XW3F/MbxH+esmTLpBnIpXkhHkvzuAGRkipoSglc6xCwiWRFIT/hOdgwJIrxKlOlu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4256
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvgd9HT8PodmeatP4u+CBgyIgC8T0ExNmGS9JbwU+AY=;
 b=ZyVF4WL62LJXQu3kUfGPfLfC8FK6WrLLpvpbpZPHLl0EgJA/Zu4QntMKkCfbY0DU+fcC5+pc4MdKssBRvijtzrVaZAby4L/sRj2PC3AwGVfKJ9mBMw9JNlyEglFgyFPXPH/vNbSwdyWA3N3V2pM+UA58XUlhHKaIwmLnk4Qvyhc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kenneth.Feng@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U29ycnkgdGhpcyBpcyBhIHByZXZpb3VzIHBhdGNoLiBTZW50IGl0IHdyb25nLiAKUGxlYXNlIGln
bm9yZSBpdC4KVGhhbmtzLgoKLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KRnJvbTogS2VubmV0
aCBGZW5nIFttYWlsdG86a2VubmV0aC5mZW5nQGFtZC5jb21dIApTZW50OiBUaHVyc2RheSwgU2Vw
dGVtYmVyIDI2LCAyMDE5IDQ6NDQgUE0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
CkNjOiBGZW5nLCBLZW5uZXRoIDxLZW5uZXRoLkZlbmdAYW1kLmNvbT4KU3ViamVjdDogW1BBVENI
IHYyXSBkcm0vYW1kL2FtZGdwdTogZGlzYWJsZSBNTUhVQiBQRyBmb3IgbmF2aTEwCgpEaXNhYmxl
IE1NSFVCIFBHIGZvciBuYXZpMTAgYWNjb3JkaW5nIHRvIHRoZSBwcm9kdWN0aW9uIHJlcXVpcmVt
ZW50LgoKU2lnbmVkLW9mZi1ieTogS2VubmV0aCBGZW5nIDxrZW5uZXRoLmZlbmdAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jIHwgMSAtCiAxIGZpbGUgY2hhbmdl
ZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L252LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jIGluZGV4IGQ0YTIwMTIuLjQ2
ZjQwMmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYwpAQCAtNjE2LDcgKzYxNiw2IEBAIHN0YXRp
YyBpbnQgbnZfY29tbW9uX2Vhcmx5X2luaXQodm9pZCAqaGFuZGxlKQogCQkJQU1EX0NHX1NVUFBP
UlRfQklGX0xTOwogCQlhZGV2LT5wZ19mbGFncyA9IEFNRF9QR19TVVBQT1JUX1ZDTiB8CiAJCQlB
TURfUEdfU1VQUE9SVF9WQ05fRFBHIHwKLQkJCUFNRF9QR19TVVBQT1JUX01NSFVCIHwKIAkJCUFN
RF9QR19TVVBQT1JUX0FUSFVCOwogCQlhZGV2LT5leHRlcm5hbF9yZXZfaWQgPSBhZGV2LT5yZXZf
aWQgKyAweDE7CiAJCWJyZWFrOwotLQoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
