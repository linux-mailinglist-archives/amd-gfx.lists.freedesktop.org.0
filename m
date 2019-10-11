Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1630DD3E03
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 13:10:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 878386EC16;
	Fri, 11 Oct 2019 11:10:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690043.outbound.protection.outlook.com [40.107.69.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E5046EC16
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 11:10:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KuR6DmfDL1JTfYlyBBbgaxaBrIKQpy47Qoh9mPY8zmQLpWOdVazr21PHmwj6jKe6VGS/i9T57eYv79tZBL9dId8m3GDYvu2unW9jpymLgqmjBsL5XzR1iPYrFSSR8wPSRXbPM/f6dRS16qWuqY6YjDlWEY5uKFwLZNIwg/hWEGWHBJoK1+uW3Q3WUth7JjssIEQxhAUs0KfmZI9QEK40Rs/lpNYooEcm7E0CAxbOTTsg4is9fzJ80XgjeAYDWavMvdyQSKmZhXxIt2VkvxOiYBsJ93k/tWe8l143qawDfbYIlq9gnS0qXH03mnQjU8Saap97hbKwAk9J6SH4SgrKrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/fTuBA+YLvrQmmnFTZ2PNk+GhsnhYU+c+knqNDaBs7Q=;
 b=CwXYmAMi1mvDLphEZGcgFdSuo5b6iv6I+EUgs83HDQp/IY8lXCDg4Xyx5usN4FWLEAZzSMzy2DzaHTjxFC+OFP9kVNv9lFHTUnwbMYoCMVQ5907NKosuYl9kFzMd+wJ7CCr8ez/10Zg3wUeNrSe3Y1i2sqF7nSs4ahpLuV9OHKFynBVmkHH/KR2AJJHlbb1QqFbG0dBdfY+3B0R8KAcVNsmqK+PEJaP2g0dhJhskj3WQJlCD5JtQoaenA3zfEO058A8OWf+sUVmvypIijrEU004TOdfQUh24OP6793V6WJM0noio0icGkp8S8TdvurYeR3T0gFUg6gsPvvqIPvINlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0003.namprd12.prod.outlook.com (2603:10b6:4:1::13) by
 CH2PR12MB3878.namprd12.prod.outlook.com (2603:10b6:610:2a::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 11 Oct 2019 11:10:38 +0000
Received: from BY2NAM03FT046.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::200) by DM5PR12CA0003.outlook.office365.com
 (2603:10b6:4:1::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Fri, 11 Oct 2019 11:10:37 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT046.mail.protection.outlook.com (10.152.85.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Fri, 11 Oct 2019 11:10:37 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Fri, 11 Oct 2019 06:10:34 -0500
From: Le Ma <le.ma@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/4] drm/amd/powerplay: send EnterBaco msg with argument as
 RAS recovery flag
Date: Fri, 11 Oct 2019 19:10:27 +0800
Message-ID: <1570792228-11189-3-git-send-email-le.ma@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570792228-11189-1-git-send-email-le.ma@amd.com>
References: <1570792228-11189-1-git-send-email-le.ma@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(376002)(39860400002)(428003)(199004)(189003)(36756003)(81156014)(5660300002)(50226002)(6666004)(356004)(476003)(11346002)(2616005)(8936002)(126002)(81166006)(44832011)(8676002)(446003)(336012)(486006)(426003)(47776003)(16586007)(26005)(316002)(51416003)(2906002)(48376002)(186003)(305945005)(2351001)(6916009)(86362001)(50466002)(70206006)(4326008)(70586007)(76176011)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3878; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f7a8eb7-ad30-4a26-3800-08d74e3ba52d
X-MS-TrafficTypeDiagnostic: CH2PR12MB3878:
X-Microsoft-Antispam-PRVS: <CH2PR12MB38782294EC61D025FB70ECB8F6970@CH2PR12MB3878.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-Forefront-PRVS: 0187F3EA14
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ov/ZdcI8s7+JB39eGB8Krec/UXkVaQ4NXIR6BzDWOtIxy+orWz7eBxE61KRwDM9VzPKgIC0/byhdUDdCJ65Z96G1GteVkQ7KkqHrROYvGJQ8uSe3+7UxhOhkGPWYw2cXQ6uwvWnutpV23XAS5TppWOKJESvceurERdB3wkvkToMeZv1xOchY6x83fYSTdU1bjaV8m7H4JvE8WKt08WlaDzNsvTOhoYPuCQPt/0nReF7+WQJCV+iIYbMKpDuFpKCiS1i6r4JKPUxIa9RCz3omVVhQLhxgEqMFX7D+/XM9Os/el4eBL0HXvuNUZL0xv+Ngs6L1VM86smYDH81DEo61rG8h44SX/jPA3Rl0j+OxFRtz5ZwwkAhEGTFs4os4Li/KqVDYjwwtpnwol0pYZS0CHxheEFpCbPt1o2AdoUH+nUY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 11:10:37.5704 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f7a8eb7-ad30-4a26-3800-08d74e3ba52d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3878
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/fTuBA+YLvrQmmnFTZ2PNk+GhsnhYU+c+knqNDaBs7Q=;
 b=ngK2IuHexrZch1i7WX4dVNwT/R4CMAnCTwvYgAkkxMOTV77VJHnmYWq7dPAJPLez/XATFUYa0c+oBvMpkiYUHy3x9JKSin54cQriVvUafn5oGNV3UoOlhvnmKqSzVCRCdijFd3F/2HFMJQMI6CcO3udLUQPWBVj9hUwAFPnn4i8=
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
Cc: Le Ma <le.ma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

MSBpbmRpY2F0ZXMgUkFTIHJlY292ZXJ5IGZsYWcgaW4gU01VIEZXLgoKQ2hhbmdlLUlkOiBJY2I4
YzE0NTg2ZmNhMWI4YWU0NDNiYmRlNzY0NTcwYTllNDE4NTBmYQpTaWduZWQtb2ZmLWJ5OiBMZSBN
YSA8bGUubWFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21n
ci92ZWdhMjBfYmFjby5jIHwgMTEgKysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTIwX2JhY28uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L2h3bWdyL3ZlZ2EyMF9iYWNvLmMKaW5kZXggYjA2OGQxYy4uOWI1ZTcyYiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTIwX2JhY28uYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMjBfYmFjby5jCkBA
IC04OSwxMCArODksMTUgQEAgaW50IHZlZ2EyMF9iYWNvX3NldF9zdGF0ZShzdHJ1Y3QgcHBfaHdt
Z3IgKmh3bWdyLCBlbnVtIEJBQ09fU1RBVEUgc3RhdGUpCiAJCQlkYXRhID0gUlJFRzMyX1NPQzE1
KFRITSwgMCwgbW1USE1fQkFDT19DTlRMKTsKIAkJCWRhdGEgfD0gMHg4MDAwMDAwMDsKIAkJCVdS
RUczMl9TT0MxNShUSE0sIDAsIG1tVEhNX0JBQ09fQ05UTCwgZGF0YSk7Ci0JCX0KIAotCQlpZihz
bXVtX3NlbmRfbXNnX3RvX3NtY193aXRoX3BhcmFtZXRlcihod21nciwgUFBTTUNfTVNHX0VudGVy
QmFjbywgMCkpCi0JCQlyZXR1cm4gLUVJTlZBTDsKKwkJCWlmKHNtdW1fc2VuZF9tc2dfdG9fc21j
X3dpdGhfcGFyYW1ldGVyKGh3bWdyLAorCQkJCQlQUFNNQ19NU0dfRW50ZXJCYWNvLCAwKSkKKwkJ
CQlyZXR1cm4gLUVJTlZBTDsKKwkJfSBlbHNlIHsKKwkJCWlmKHNtdW1fc2VuZF9tc2dfdG9fc21j
X3dpdGhfcGFyYW1ldGVyKGh3bWdyLAorCQkJCQlQUFNNQ19NU0dfRW50ZXJCYWNvLCAxKSkKKwkJ
CQlyZXR1cm4gLUVJTlZBTDsKKwkJfQogCiAJfSBlbHNlIGlmIChzdGF0ZSA9PSBCQUNPX1NUQVRF
X09VVCkgewogCQlpZiAoc211bV9zZW5kX21zZ190b19zbWMoaHdtZ3IsIFBQU01DX01TR19FeGl0
QmFjbykpCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
