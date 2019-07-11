Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3E8657FD
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jul 2019 15:40:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C8096E23B;
	Thu, 11 Jul 2019 13:40:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740074.outbound.protection.outlook.com [40.107.74.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28DB6E23D
 for <amd-gfx@lists.freedesktop.org>; Thu, 11 Jul 2019 13:40:33 +0000 (UTC)
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3087.namprd12.prod.outlook.com (20.178.244.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Thu, 11 Jul 2019 13:40:31 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::154f:3d2f:d2ca:3a6e]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::154f:3d2f:d2ca:3a6e%3]) with mapi id 15.20.2052.020; Thu, 11 Jul 2019
 13:40:31 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: fix smu clock type change miss error
Thread-Topic: [PATCH] drm/amd/powerplay: fix smu clock type change miss error
Thread-Index: AQHVN+41XmBWZoXLgEWWJZTYyaQPfQ==
Date: Thu, 11 Jul 2019 13:40:31 +0000
Message-ID: <20190711133937.10417-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PS1PR03CA0004.apcprd03.prod.outlook.com
 (2603:1096:803:3d::16) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.22.0
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 540e2492-3353-4881-4e49-08d7060557a7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3087; 
x-ms-traffictypediagnostic: MN2PR12MB3087:
x-microsoft-antispam-prvs: <MN2PR12MB3087B7AF6BC7B07557DB6825A2F30@MN2PR12MB3087.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0095BCF226
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(189003)(199004)(2906002)(5640700003)(14454004)(54906003)(8936002)(316002)(36756003)(6436002)(478600001)(7736002)(2351001)(50226002)(476003)(68736007)(1076003)(86362001)(2616005)(66446008)(66946007)(66476007)(66556008)(64756008)(25786009)(256004)(6916009)(4744005)(99286004)(6116002)(5660300002)(3846002)(4326008)(26005)(102836004)(8676002)(386003)(6506007)(305945005)(6512007)(486006)(186003)(53936002)(71190400001)(2501003)(66066001)(6486002)(71200400001)(52116002)(81156014)(81166006)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3087;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 20HhoWWF4toNMS3ZSw3oDbnkwFHl6LQu7b6KfIHFZ6CPaVMjjRxovp0Hd4Btfcajbj1eOhet66KbXwZmGj5/j0wdt+/Bb6UU3TdiwKwJYvj1pP+neyLNgTqhKStQ75vVsyjzU10iv/s4lGCbqx+UVY+MKKJuPdhyMzDSX0LWppO6vkDrnEzeTSVgYv5lq32rmRL+mChEcov47TlwRktoZK1A1/qVk0AOoWY8zN4Xu4cJ01MaMdMGrpiKOdcr3XE3/CNo2JGj+rUv6+YUEhVtZX0b4LtHY7HHVsQZYA5d9E4FeDBUKiMp72kf9X1CxNCVvaUzYiZipt0JY0gqf2LGRjwzYHxITM9wB0CtOzTU4MwOqOrcRGYIrUoepX8or46JTZx5uTaigvRbh6OTpZf0MtmMUUo6R6/uPO89dfOJerU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 540e2492-3353-4881-4e49-08d7060557a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2019 13:40:31.5987 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3087
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDLJU5fFVi+OT0R/VGVAJX56jc4N7oHyI/pKBDaDA+g=;
 b=pwdnmEpDSy1vISPrxtmIetN/J+v6+tuJQDhEREnITnmQuwvaCRmEWhUwVGMNHXj8FCpsvV0bmkwuc1PA2tsxAbbMvLUN3ttr/mNXIH0v0gf4rDc9g7ZRNlRX7lLpTfVpsvG6yEgUy3+xPuh6FGcJRLhMzp2NUXE55/ySDF0KNWs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Cc: "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>, "Feng,
 Kenneth" <Kenneth.Feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

aW4gdGhlIHNtdSBtb2R1bGUsIHVzZSB0aGUgc211X3h4eGNsayB0eXBlIHRvIGlkZW50aWZ5IHRo
ZSBDTEsgdHlwZQp1c2UgU01VX1NDTEssIFNNVV9NQ0xLIHRvIHJlcGxhY2UgUFBfU0NMSywgUFBf
TUNMSy4KCkNoYW5nZS1JZDogSWZhODcwYWVhMzhmMDQzZTE5ODNmNmYwNTYwZWVkMmFjMDcwYjY4
YjcKU2lnbmVkLW9mZi1ieTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgfCA0ICsrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCmluZGV4IDFjMTVmMDIxMDFmZS4uZGU2Y2M1
ZDQ4OWNkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVf
c211LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCkBA
IC0xMzg2LDggKzEzODYsOCBAQCBpbnQgc211X2FkanVzdF9wb3dlcl9zdGF0ZV9keW5hbWljKHN0
cnVjdCBzbXVfY29udGV4dCAqc211LAogCQkJCQkJCSAmc29jX21hc2spOwogCQkJaWYgKHJldCkK
IAkJCQlyZXR1cm4gcmV0OwotCQkJc211X2ZvcmNlX2Nsa19sZXZlbHMoc211LCBQUF9TQ0xLLCAx
IDw8IHNjbGtfbWFzayk7Ci0JCQlzbXVfZm9yY2VfY2xrX2xldmVscyhzbXUsIFBQX01DTEssIDEg
PDwgbWNsa19tYXNrKTsKKwkJCXNtdV9mb3JjZV9jbGtfbGV2ZWxzKHNtdSwgU01VX1NDTEssIDEg
PDwgc2Nsa19tYXNrKTsKKwkJCXNtdV9mb3JjZV9jbGtfbGV2ZWxzKHNtdSwgU01VX01DTEssIDEg
PDwgbWNsa19tYXNrKTsKIAkJCWJyZWFrOwogCiAJCWNhc2UgQU1EX0RQTV9GT1JDRURfTEVWRUxf
TUFOVUFMOgotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
