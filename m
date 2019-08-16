Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CCF8FA99
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Aug 2019 08:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087F16EACC;
	Fri, 16 Aug 2019 06:08:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690077.outbound.protection.outlook.com [40.107.69.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AED16EACC
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Aug 2019 06:08:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YVpc/rsmqWkz+L/C7zOQLNhXr5w0/f215hVs4LiNAMAcbmrKjKj0mf/tlcxwNxHsvSoKuw+JJ0ujmoxAXN6g0Y/2hE5f/kzvTLOKjJV3KK9lor0+yKttxgx8MExpURVBOkVEi6KEZSo0g06AQl/DekrEvYLxZjGZLEUUY2lglQnDkw5tjCa/OGS2jN6Mt/kESk+u6C21VdjKc6E5tNGJsisiQ7+BxRmi6PSsTl0xjQFcI02Kbg8lMt739n18WOZs2j9gEm+JpbNrHQUT70ZpLEHDLdthY6CU8X7sirLQ0VGFSJHLSa/tJIJMcvtLHRv4+NLS3ygW3s1UOHl9YPJUhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07to5f3vvgPVqb2Z6XW2cIasDe2/avIk1/spuV8dBrE=;
 b=BO4ph0oKw4/uA0sI1oL/kscI8jYZ6kJGusskBqzGQjQMhg9GamRGYhn3YuVIXZeeT66rlz0rto2QvHb08oRNEGEt/Dp9eXZCGVDLqgb5tYEvBmhte7NzpeKie2NQZxU4irg71yrk36FxUdzIC5KQnKJJiGy7YbOQnY54bFU7joDN7APNeSBmaaiOzCfOuejNUnbt0AfXi/5sCEnON5Ihx21EgfvB7mrgSpQJl6ld5N4P6BTYvB/I8hF5DM6CMpBQkL7jP0ETC87IHWpnVoQVpOw07mOVQ5/9yEd9A5FdHQo9KxYqI9JDUL7f5rx0rUDlbv6jX6PK4Xn3BjUgM+vM2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR12CA0068.namprd12.prod.outlook.com (2603:10b6:300:103::30)
 by CY4PR12MB1525.namprd12.prod.outlook.com (2603:10b6:910:11::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.21; Fri, 16 Aug
 2019 06:08:20 +0000
Received: from BY2NAM03FT005.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::205) by MWHPR12CA0068.outlook.office365.com
 (2603:10b6:300:103::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16 via Frontend
 Transport; Fri, 16 Aug 2019 06:08:20 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT005.mail.protection.outlook.com (10.152.84.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Fri, 16 Aug 2019 06:08:20 +0000
Received: from equan-buildpc.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 16 Aug 2019
 01:08:18 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/4] drm/amd/powerplay: update Arcturus smc fw and driver
 interface header
Date: Fri, 16 Aug 2019 14:08:04 +0800
Message-ID: <20190816060807.11922-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(136003)(39860400002)(2980300002)(428003)(189003)(199004)(53416004)(14444005)(50466002)(36756003)(4326008)(50226002)(53936002)(2906002)(15650500001)(47776003)(2870700001)(2351001)(8676002)(5660300002)(336012)(8936002)(81156014)(316002)(1076003)(81166006)(305945005)(70206006)(70586007)(356004)(476003)(126002)(486006)(2616005)(86362001)(26005)(48376002)(51416003)(7696005)(478600001)(44832011)(426003)(6666004)(186003)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1525; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f0e8265-1d6d-4e34-7757-08d722102346
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1525; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1525:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1525EE316562FDBA0911E03BE4AF0@CY4PR12MB1525.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 0131D22242
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: gE4KRsSl9uoXWOp8F8sHDhjuLRVOWT4HSLrq1jNVp2zSaYKEbEpx107fCwvURaw/BEUeVWmRwY7+GZ6gN5qHG3kaW9t9a6QcA/OlLev/zXR6Mxl9YNLFKahh/YyxeqhGdEpxEJIiWkwlx+XzDbsSFImX7j38D72PMUlPe7plSxmk3P8Yd3ycvPac2a9wrPZq57joz2kxz7OTnkLNbs66EQXrVrEj0pAfKlhFJ46ACnSmGAjw72WMgFUIcSa/Vmw+IAip+HxO2IuEy92aiCQcjHGv7aKXBzNvAz3ivWYzG9wAd3sE/YScOZuSNABG0WcNgYm5lGqpUVtjIKS/m6lpczHZRGUHgfYV4q5xse5rNT8/Mfj4Vnqk/wYiWCRud6H5Og1nRpXWJH63k+y9QXRPlT/M5xIBodyaIOhFHZXt/9A=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2019 06:08:20.1224 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f0e8265-1d6d-4e34-7757-08d722102346
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1525
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07to5f3vvgPVqb2Z6XW2cIasDe2/avIk1/spuV8dBrE=;
 b=drm1wD7J3M4TbZnGkOC7Fz+E1OIUKbprceudK/tp4IGLVp8OJ7UfD+6cncbxclphk4c3aU8812bIRIS7wVmevTyTvcJ1uogW9n1pamFlFNgMNPYMjnUelzZTbfapWb35yL7xg1h6TcDGjY7M3kypORVuClkNcMpeb+LIqKILeXA=
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
Cc: Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VXBkYXRlIHNtYyBmdyBhbmQgZHJpdmVyIGludGVyZmFjZSBoZWFkZXIuCgpDaGFuZ2UtSWQ6IElm
NGFjMDljNDFiMTMwOWY3NDZiNzU3Zjc4ODgwZmZmYjQ5MWQ1MGY4ClNpZ25lZC1vZmYtYnk6IEV2
YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+Ci0tLQogLi4uL3Bvd2VycGxheS9pbmMvc211MTFf
ZHJpdmVyX2lmX2FyY3R1cnVzLmggICAgfCAxNyArKysrKysrKysrKy0tLS0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdV92MTFfMC5oICAgfCAgMiArLQogMiBmaWxlcyBj
aGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9zbXUxMV9kcml2ZXJfaWZfYXJjdHVydXMu
aCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9zbXUxMV9kcml2ZXJfaWZfYXJj
dHVydXMuaAppbmRleCBiOTllOThjNDA3MjAuLmUwMjk1MGI1MDVmYSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdTExX2RyaXZlcl9pZl9hcmN0dXJ1cy5o
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9zbXUxMV9kcml2ZXJfaWZf
YXJjdHVydXMuaApAQCAtMjcsNyArMjcsNyBAQAogLy8gKioqIElNUE9SVEFOVCAqKioKIC8vIFNN
VSBURUFNOiBBbHdheXMgaW5jcmVtZW50IHRoZSBpbnRlcmZhY2UgdmVyc2lvbiBpZgogLy8gYW55
IHN0cnVjdHVyZSBpcyBjaGFuZ2VkIGluIHRoaXMgZmlsZQotLy8jZGVmaW5lIFNNVTExX0RSSVZF
Ul9JRl9WRVJTSU9OIDB4MDgKKy8vI2RlZmluZSBTTVUxMV9EUklWRVJfSUZfVkVSU0lPTiAweDA5
CiAKICNkZWZpbmUgUFBUQUJMRV9BUkNUVVJVU19TTVVfVkVSU0lPTiA0CiAKQEAgLTY5MSw3ICs2
OTEsMTIgQEAgdHlwZWRlZiBzdHJ1Y3QgewogICB1aW50MTZfdCAgICAgICAgICBYZ21pRmNsa0Zy
ZXEgICAgW05VTV9YR01JX1BTVEFURV9MRVZFTFNdOwogICB1aW50MTZfdCAgICAgICAgICBYZ21p
U29jVm9sdGFnZSAgW05VTV9YR01JX1BTVEFURV9MRVZFTFNdOwogCi0gIHVpbnQzMl90ICAgICBC
b2FyZFJlc2VydmVkWzEwXTsKKyAgLy8gR1BJTyBwaW5zIGZvciBJMkMgY29tbXVuaWNhdGlvbnMg
d2l0aCAybmQgY29udHJvbGxlciBmb3IgSW5wdXQgVGVsZW1ldHJ5IFNlcXVlbmNlCisgIHVpbnQ4
X3QgICAgICBHcGlvSTJjU2NsOyAgICAgICAgICAvLyBTZXJpYWwgQ2xvY2sKKyAgdWludDhfdCAg
ICAgIEdwaW9JMmNTZGE7ICAgICAgICAgIC8vIFNlcmlhbCBEYXRhCisgIHVpbnQxNl90ICAgICBH
cGlvUGFkZGluZzsKKworICB1aW50MzJfdCAgICAgQm9hcmRSZXNlcnZlZFs5XTsKIAogICAvLyBQ
YWRkaW5nIGZvciBNTUhVQiAtIGRvIG5vdCBtb2RpZnkgdGhpcwogICB1aW50MzJfdCAgICAgTW1I
dWJQYWRkaW5nWzhdOyAvLyBTTVUgaW50ZXJuYWwgdXNlCkBAIC03MzgsNyArNzQzLDcgQEAgdHlw
ZWRlZiBzdHJ1Y3QgewogICB1aW50MzJfdCBQYWRkaW5nWzRdOwogCiAgIC8vIFBhZGRpbmcgLSBp
Z25vcmUKLSAgdWludDMyX3QgICAgIE1tSHViUGFkZGluZ1s3XTsgLy8gU01VIGludGVybmFsIHVz
ZQorICB1aW50MzJfdCAgICAgTW1IdWJQYWRkaW5nWzhdOyAvLyBTTVUgaW50ZXJuYWwgdXNlCiB9
IFNtdU1ldHJpY3NfdDsKIAogCkBAIC03NDgsNyArNzUzLDcgQEAgdHlwZWRlZiBzdHJ1Y3Qgewog
ICBmbG9hdCAgICBhdmdQc21Wb2x0YWdlWzc1XTsKICAgZmxvYXQgICAgbWluUHNtVm9sdGFnZVs3
NV07CiAKLSAgdWludDMyX3QgTW1IdWJQYWRkaW5nWzNdOyAvLyBTTVUgaW50ZXJuYWwgdXNlCisg
IHVpbnQzMl90IE1tSHViUGFkZGluZ1s4XTsgLy8gU01VIGludGVybmFsIHVzZQogfSBBdmZzRGVi
dWdUYWJsZV90OwogCiB0eXBlZGVmIHN0cnVjdCB7CkBAIC03OTcsOSArODAyLDkgQEAgdHlwZWRl
ZiBzdHJ1Y3QgewogCiAgIHVpbnQzMl90IFAyVkNoYXJ6RnJlcVtBVkZTX1ZPTFRBR0VfQ09VTlRd
OyAvLyBpbiAxMEtIeiB1bml0cwogCi0gIHVpbnQzMl90IEVuYWJsZWRBdmZzTW9kdWxlczsKKyAg
dWludDMyX3QgRW5hYmxlZEF2ZnNNb2R1bGVzWzJdOwogCi0gIHVpbnQzMl90IE1tSHViUGFkZGlu
Z1s3XTsgLy8gU01VIGludGVybmFsIHVzZQorICB1aW50MzJfdCBNbUh1YlBhZGRpbmdbOF07IC8v
IFNNVSBpbnRlcm5hbCB1c2UKIH0gQXZmc0Z1c2VPdmVycmlkZV90OwogCiAvKiBOT1QgQ1VSUkVO
VExZIFVTRUQKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9z
bXVfdjExXzAuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9zbXVfdjExXzAu
aAppbmRleCA1ZmJmMDgyYmUwOTEuLjBhMjJmYTQ4ZmY1YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdV92MTFfMC5oCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2luYy9zbXVfdjExXzAuaApAQCAtMjcsNyArMjcsNyBAQAogCiAjZGVm
aW5lIFNNVTExX0RSSVZFUl9JRl9WRVJTSU9OX0lOViAweEZGRkZGRkZGCiAjZGVmaW5lIFNNVTEx
X0RSSVZFUl9JRl9WRVJTSU9OX1ZHMjAgMHgxMwotI2RlZmluZSBTTVUxMV9EUklWRVJfSUZfVkVS
U0lPTl9BUkNUIDB4MDgKKyNkZWZpbmUgU01VMTFfRFJJVkVSX0lGX1ZFUlNJT05fQVJDVCAweDA5
CiAjZGVmaW5lIFNNVTExX0RSSVZFUl9JRl9WRVJTSU9OX05WMTAgMHgzMwogI2RlZmluZSBTTVUx
MV9EUklWRVJfSUZfVkVSU0lPTl9OVjEyIDB4MzMKICNkZWZpbmUgU01VMTFfRFJJVkVSX0lGX1ZF
UlNJT05fTlYxNCAweDMzCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
