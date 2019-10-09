Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB240D1A85
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 23:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7243D6EA65;
	Wed,  9 Oct 2019 21:06:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680076.outbound.protection.outlook.com [40.107.68.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A1926EA5F
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2019 21:06:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fy1WosNqhZ4SGVXI7fpUgbWVNEOykzsISjkqnmKOPkbFJvHip5sl87D2vn98QrKz/kR/bAh1X4ho3Pf/akod49mr0gDhvNvbeEo9ysT0pVjytZRkVYK/azIKevkVNYfTzBYSTK95iJFliyz1AZC2kZ15wuUZ3n8MAAWKERmoYBcTmIooIrCVst9SlyYVxvjK8OnlRyQQ+2BGs89ZZC4/zjgjEXc+20X/FhCfC7hbZUnR4qOUrEiYd2hYk82qDMn1KwcUyw/vmab18fxO6H+1CIsvhsEwysujqBOTzcHmUu+anAjhv2lhCv2cm/3s/Le8co17LJ343yZaXLJgv+bDaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gU8uIc869fcZr23VNSw95/DmMWeUmzSoIo8ya/EZ1A=;
 b=NK4GjOFy2TebVQMrfCF3WgoyjxjUriC655phI+SKhUw3r1YZo0lD15TaKOTIcQQidy1EUcNswOz+gx6Ya6fgY/nN4xtqB9KmgQDAUs0CTrF7M/Z0tNVeBgbvOQXn/Q099YTdOHQZzyDHo8mJpLJfrBrTyXEll220ChLVA3PICTXV2xexCJyd9X4PaqQZUkICEhix1EYp/PEGBD20TIIFi8RhHyFfEJFIe/zokQ9QeCQT4gNuduRXVyDPGIVjrDtjSkTGDk3rTUDJkVAM1V+YCfUfChp+VsnY7uk7s4fvFPr24OtEyoOUx6lSAVLJV3wy6LI8F0pTclg/NL32OpHf1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0029.namprd12.prod.outlook.com (2603:10b6:5:1c0::42)
 by SN6PR12MB2653.namprd12.prod.outlook.com (2603:10b6:805:6f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Wed, 9 Oct
 2019 21:06:25 +0000
Received: from DM3NAM03FT032.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::206) by DM6PR12CA0029.outlook.office365.com
 (2603:10b6:5:1c0::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.17 via Frontend
 Transport; Wed, 9 Oct 2019 21:06:25 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT032.mail.protection.outlook.com (10.152.82.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 9 Oct 2019 21:06:24 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 9 Oct 2019
 16:06:23 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 09/26] drm/amd/display: enable hostvm based on roimmu active
 for dcn2.1
Date: Wed, 9 Oct 2019 17:05:56 -0400
Message-ID: <20191009210613.17929-10-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
References: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(346002)(39860400002)(396003)(428003)(189003)(199004)(50466002)(81166006)(81156014)(305945005)(50226002)(8936002)(14444005)(70586007)(8676002)(6916009)(4326008)(70206006)(51416003)(86362001)(76176011)(7696005)(47776003)(26005)(356004)(48376002)(446003)(11346002)(2906002)(6666004)(336012)(426003)(2351001)(316002)(54906003)(486006)(16586007)(476003)(2616005)(126002)(53416004)(478600001)(1076003)(186003)(36756003)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2653; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b18acc83-4467-4f61-073a-08d74cfc8b6b
X-MS-TrafficTypeDiagnostic: SN6PR12MB2653:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2653D19089E2196FCC93B227F9950@SN6PR12MB2653.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-Forefront-PRVS: 018577E36E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: orIITu8cxhpoECqrkwYjlvhBEA+HXvKhSHcBV5qC3ODRyYHFxqGdL2dOKWOGRU72IWIQHbVvF96EUArHKpCuZ9VWT2SrxLUzvC01QHn4CR0Z+fRI/W1qVOpi4jkyeXS06GrspGhPzWeAnAf4ImiUBiF+EEDetXphn5twupRtJzyXQl6OA5iWfzz6Kret3B5VPKPrhrvGmLcZcoD87hHk24TQjlt+OPNnelvY2H4ko3jS32xP2vD79vvnOnTtlaHtb6uOg8l5EHs10vODqkTifB3DoHfLIV1Mo/SJyYFQlN9g4JE+nJ1pp7sHo9+mqVEXYvHUgZgEtYvnbDlg74Hp3WfGx//CZo/qw0UMWQ5XPdpN4YVJjGOukBmwb9hZu37pgfhKN7l/nS3nzTGFzR01nC2RLw6Bl8XM0+lcIYgHMxI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 21:06:24.9390 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b18acc83-4467-4f61-073a-08d74cfc8b6b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2653
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gU8uIc869fcZr23VNSw95/DmMWeUmzSoIo8ya/EZ1A=;
 b=0edl8gwPZ0nFEr6hsBXpZs1tDaYJKPt2gz5B3oGYNE7trclYwqeO9t+2dF8d63Kp9DS5POgVm8WVYlECO5hx0tEtAgKWaPXqCthdU5EgmIfke+SYAAsPAdASZxyvcyFIxF/QiCdzXf59sxtE1gWSOifMHfJ39NoMNpdoPgFaIlA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
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
Cc: sunpeng.li@amd.com, Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 harry.wentland@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KCkVu
YWJsaW5nIGhvc3R2bSB3aGVuIFJPSU1NVSBpcyBub3QgYWN0aXZlIHNlZW1zIHRvIGJyZWFrIEdQ
VVZNLgpUaGlzIGZpeGVzIHRoZSBpc3N1ZSBieSBub3QgZW5hYmxpbmcgaG9zdHZtIGlmIFJPSU1N
VSBpcyBub3QKYWN0aXZhdGVkLgoKU2lnbmVkLW9mZi1ieTogRG15dHJvIExha3R5dXNoa2luIDxE
bXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExha2hhIDxC
aGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgotLS0KIC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MjEvZGNuMjFfaHViYnViLmMgICB8IDQwICsrKysrKysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyNSBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfaHViYnViLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfaHViYnViLmMKaW5kZXggOGU3ZTc5
ZjQ0MjcyLi5iZDI0N2U1ZTc1M2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY24yMS9kY24yMV9odWJidWIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNuMjEvZGNuMjFfaHViYnViLmMKQEAgLTIyLDYgKzIyLDcgQEAKICAqIEF1dGhv
cnM6IEFNRAogICoKICAqLworI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+CiAjaW5jbHVkZSAiZG1f
c2VydmljZXMuaCIKICNpbmNsdWRlICJkY24yMC9kY24yMF9odWJidWIuaCIKICNpbmNsdWRlICJk
Y24yMV9odWJidWIuaCIKQEAgLTcxLDMwICs3MiwzOSBAQCBzdGF0aWMgdWludDMyX3QgY29udmVy
dF9hbmRfY2xhbXAoCiB2b2lkIGRjbjIxX2RjaHZtX2luaXQoc3RydWN0IGh1YmJ1YiAqaHViYnVi
KQogewogCXN0cnVjdCBkY24yMF9odWJidWIgKmh1YmJ1YjEgPSBUT19EQ04yMF9IVUJCVUIoaHVi
YnViKTsKKwl1aW50MzJfdCByaW9tbXVfYWN0aXZlOworCWludCBpOwogCiAJLy9Jbml0IERDSFZN
IGJsb2NrCiAJUkVHX1VQREFURShEQ0hWTV9DVFJMMCwgSE9TVFZNX0lOSVRfUkVRLCAxKTsKIAog
CS8vUG9sbCB1bnRpbCBSSU9NTVVfQUNUSVZFID0gMQotCS8vVE9ETzogRmlndXJlIG91dCBpbnRl
cnZhbCB1cyBhbmQgcmV0cnkgY291bnQKLQlSRUdfV0FJVChEQ0hWTV9SSU9NTVVfU1RBVDAsIFJJ
T01NVV9BQ1RJVkUsIDEsIDUsIDEwMCk7CisJZm9yIChpID0gMDsgaSA8IDEwMDsgaSsrKSB7CisJ
CVJFR19HRVQoRENIVk1fUklPTU1VX1NUQVQwLCBSSU9NTVVfQUNUSVZFLCAmcmlvbW11X2FjdGl2
ZSk7CiAKLQkvL1JlZmxlY3QgdGhlIHBvd2VyIHN0YXR1cyBvZiBEQ0hVQkJVQgotCVJFR19VUERB
VEUoRENIVk1fUklPTU1VX0NUUkwwLCBIT1NUVk1fUE9XRVJTVEFUVVMsIDEpOworCQlpZiAocmlv
bW11X2FjdGl2ZSkKKwkJCWJyZWFrOworCQllbHNlCisJCQl1ZGVsYXkoNSk7CisJfQorCisJaWYg
KHJpb21tdV9hY3RpdmUpIHsKKwkJLy9SZWZsZWN0IHRoZSBwb3dlciBzdGF0dXMgb2YgRENIVUJC
VUIKKwkJUkVHX1VQREFURShEQ0hWTV9SSU9NTVVfQ1RSTDAsIEhPU1RWTV9QT1dFUlNUQVRVUywg
MSk7CiAKLQkvL1N0YXJ0IHJJT01NVSBwcmVmZXRjaGluZwotCVJFR19VUERBVEUoRENIVk1fUklP
TU1VX0NUUkwwLCBIT1NUVk1fUFJFRkVUQ0hfUkVRLCAxKTsKKwkJLy9TdGFydCBySU9NTVUgcHJl
ZmV0Y2hpbmcKKwkJUkVHX1VQREFURShEQ0hWTV9SSU9NTVVfQ1RSTDAsIEhPU1RWTV9QUkVGRVRD
SF9SRVEsIDEpOwogCi0JLy8gRW5hYmxlIGR5bmFtaWMgY2xvY2sgZ2F0aW5nCi0JUkVHX1VQREFU
RV80KERDSFZNX0NMS19DVFJMLAotCQkJCQlIVk1fRElTUENMS19SX0dBVEVfRElTLCAwLAotCQkJ
CQlIVk1fRElTUENMS19HX0dBVEVfRElTLCAwLAotCQkJCQlIVk1fRENGQ0xLX1JfR0FURV9ESVMs
IDAsCi0JCQkJCUhWTV9EQ0ZDTEtfR19HQVRFX0RJUywgMCk7CisJCS8vIEVuYWJsZSBkeW5hbWlj
IGNsb2NrIGdhdGluZworCQlSRUdfVVBEQVRFXzQoRENIVk1fQ0xLX0NUUkwsCisJCQkJCQlIVk1f
RElTUENMS19SX0dBVEVfRElTLCAwLAorCQkJCQkJSFZNX0RJU1BDTEtfR19HQVRFX0RJUywgMCwK
KwkJCQkJCUhWTV9EQ0ZDTEtfUl9HQVRFX0RJUywgMCwKKwkJCQkJCUhWTV9EQ0ZDTEtfR19HQVRF
X0RJUywgMCk7CiAKLQkvL1BvbGwgdW50aWwgSE9TVFZNX1BSRUZFVENIX0RPTkUgPSAxCi0JLy9U
T0RPOiBGaWd1cmUgb3V0IGludGVydmFsIHVzIGFuZCByZXRyeSBjb3VudAotCVJFR19XQUlUKERD
SFZNX1JJT01NVV9TVEFUMCwgSE9TVFZNX1BSRUZFVENIX0RPTkUsIDEsIDUsIDEwMCk7CisJCS8v
UG9sbCB1bnRpbCBIT1NUVk1fUFJFRkVUQ0hfRE9ORSA9IDEKKwkJUkVHX1dBSVQoRENIVk1fUklP
TU1VX1NUQVQwLCBIT1NUVk1fUFJFRkVUQ0hfRE9ORSwgMSwgNSwgMTAwKTsKKwl9CiB9CiAKIGlu
dCBodWJidWIyMV9pbml0X2RjaHViKHN0cnVjdCBodWJidWIgKmh1YmJ1YiwKLS0gCjIuMTcuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
