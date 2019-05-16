Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E15D72059E
	for <lists+amd-gfx@lfdr.de>; Thu, 16 May 2019 13:53:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C419893D0;
	Thu, 16 May 2019 11:53:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690084.outbound.protection.outlook.com [40.107.69.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10E10893C9
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 May 2019 11:53:47 +0000 (UTC)
Received: from DM5PR12CA0050.namprd12.prod.outlook.com (2603:10b6:3:103::12)
 by BN6PR1201MB0052.namprd12.prod.outlook.com (2603:10b6:405:53::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1900.17; Thu, 16 May
 2019 11:53:45 +0000
Received: from CO1NAM03FT024.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::202) by DM5PR12CA0050.outlook.office365.com
 (2603:10b6:3:103::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1900.16 via Frontend
 Transport; Thu, 16 May 2019 11:53:45 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT024.mail.protection.outlook.com (10.152.80.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Thu, 16 May 2019 11:53:45 +0000
Received: from yttao-code-machine.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Thu, 16 May 2019 06:53:43 -0500
From: Yintian Tao <yttao@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: skip fw pri bo alloc for SRIOV
Date: Thu, 16 May 2019 19:53:38 +0800
Message-ID: <1558007618-24482-1-git-send-email-yttao@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(396003)(136003)(376002)(2980300002)(428003)(199004)(189003)(476003)(70586007)(316002)(6916009)(2906002)(70206006)(5660300002)(53936002)(54906003)(126002)(486006)(2351001)(47776003)(2616005)(6666004)(16586007)(426003)(356004)(48376002)(50466002)(77096007)(51416003)(53416004)(8936002)(305945005)(8676002)(81156014)(81166006)(72206003)(478600001)(336012)(68736007)(4326008)(7696005)(50226002)(186003)(36756003)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0052; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4298eaf5-3c6d-40d3-3f32-08d6d9f5264c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BN6PR1201MB0052; 
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0052:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB005264722529274F5B944BC0E50A0@BN6PR1201MB0052.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 0039C6E5C5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: yYx9D3sE250AtNketZJMUvgpWgkptq3Eq7cYfxgMkOubl4Fc27RM5IohrdYUFETSB19O9FMKxBnU48UPfw4ylx3Etav4H7+V5dxQM1iUbLdj630qReCk6v8kyEAiVnNQW75/p2r0wq4+vbKmisdpJspTMfNPWwN1AEaJHUbd7/JEIv0H7/gpf7KERsa+Tl8/uOOXPfGW49yC7b6YD5pU1CsqYfV0QA+OKmIkNSeZNlg0cE7eSI//XtbMa45XpFF4MR2VuqMqz1AMxYOIls/yMxUkUx+k8gf853RcKqSOA7WIF7/6jq0CQUFAoOjf9uTXcemXnAt2sWpqlCCoUu7bvDFYdNlFyUrwQfRtE4lo33JKNZnn2g/BBCidaFoA9j3Z9EB8golNvr//xB/3S3+dprSHnJXge4UdgCuHZjiY/do=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2019 11:53:45.0338 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4298eaf5-3c6d-40d3-3f32-08d6d9f5264c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0052
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aV0pPzxaHFruqPBmTciuQU5uvedTKm2qQEx5z/s6TvU=;
 b=JJDU7FpWlzXGi3QhbJiapnsTT/jj2We5Hq+++ue1UlCi2SVzZKWc2CPa3qhz0xzTzbxHj1AJPs473rEVHXbdP58k710SxgwMeCDEGlbK1pY3RgvEiywYdexTEy4JSIT+omk/evKiDjkJSzbfZ0h3nlZk7aqBQbXPpJgNmMzHEpg=
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
Cc: Monk Liu <Monk.Liu@amd.com>, Yintian Tao <yttao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UFNQIGZ3IHByaW1hcnkgYnVmZmVyIGlzIG5vdCB1c2VkIHVuZGVyIFNSSU9WLgpUaGVyZWZvcmUs
IHdlIGRvbid0IG5lZWQgdG8gYWxsb2NhdGUgbWVtb3J5IGZvciBpdC4KCnYyOiByZW1vdmUgc3Vw
ZXJmbHVvdXMgY2hlY2sgZm9yIGFtZGdwdV9ib19mcmVlX2tlcm5lbCgpLgoKU2lnbmVkLW9mZi1i
eTogWWludGlhbiBUYW8gPHl0dGFvQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IE1vbmsgTGl1IDxN
b25rLkxpdUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9w
c3AuYyB8IDE3ICsrKysrKysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9u
cygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfcHNwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNw
LmMKaW5kZXggYzU2N2E1NS4uYWY5ODM1YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3BzcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9wc3AuYwpAQCAtOTA1LDEzICs5MDUsMTYgQEAgc3RhdGljIGludCBwc3BfbG9hZF9mdyhz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAlpZiAoIXBzcC0+Y21kKQogCQlyZXR1cm4gLUVO
T01FTTsKIAotCXJldCA9IGFtZGdwdV9ib19jcmVhdGVfa2VybmVsKGFkZXYsIFBTUF8xX01FRywg
UFNQXzFfTUVHLAotCQkJCQlBTURHUFVfR0VNX0RPTUFJTl9HVFQsCi0JCQkJCSZwc3AtPmZ3X3By
aV9ibywKLQkJCQkJJnBzcC0+ZndfcHJpX21jX2FkZHIsCi0JCQkJCSZwc3AtPmZ3X3ByaV9idWYp
OwotCWlmIChyZXQpCi0JCWdvdG8gZmFpbGVkOworCS8qIHRoaXMgZncgcHJpIGJvIGlzIG5vdCB1
c2VkIHVuZGVyIFNSSU9WICovCisJaWYgKCFhbWRncHVfc3Jpb3ZfdmYocHNwLT5hZGV2KSkgewor
CQlyZXQgPSBhbWRncHVfYm9fY3JlYXRlX2tlcm5lbChhZGV2LCBQU1BfMV9NRUcsIFBTUF8xX01F
RywKKwkJCQkJICAgICAgQU1ER1BVX0dFTV9ET01BSU5fR1RULAorCQkJCQkgICAgICAmcHNwLT5m
d19wcmlfYm8sCisJCQkJCSAgICAgICZwc3AtPmZ3X3ByaV9tY19hZGRyLAorCQkJCQkgICAgICAm
cHNwLT5md19wcmlfYnVmKTsKKwkJaWYgKHJldCkKKwkJCWdvdG8gZmFpbGVkOworCX0KIAogCXJl
dCA9IGFtZGdwdV9ib19jcmVhdGVfa2VybmVsKGFkZXYsIFBTUF9GRU5DRV9CVUZGRVJfU0laRSwg
UEFHRV9TSVpFLAogCQkJCQlBTURHUFVfR0VNX0RPTUFJTl9WUkFNLAotLSAKMi43LjQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
