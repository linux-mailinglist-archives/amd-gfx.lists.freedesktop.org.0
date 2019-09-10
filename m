Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AD3AEC70
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 15:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEC7A6E8F2;
	Tue, 10 Sep 2019 13:55:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770042.outbound.protection.outlook.com [40.107.77.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 269DC89349
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 13:55:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ixjWOD/0yv6jqCY5WDdWphVj0/2TVS2l1gLGZRIkBDHVmtZFJMwFX6QNN/q5jTXlRb+eP40PiM+8UBPV6wKmumr0zYjxayViDbo+iv4GmFv+oUgez187d8R/6ZOHa3/ARuBKjmT4O9BKmyKn3JtWoA9ySnXyvzF5x4GAi7y9ak24wozbUuWVJfgqptmuIl5wfKvzeJ/8IAXljbFV32UlCEo0kYCpimq5oky6NCFIBjSpkIg7EjRH5ldB7TJpRVRb8a5AJyCCLtuKuKWyTPRPgschXr21MuyFeyvojfi1ywlS8qJBO+MErT/GiIHcmavD7ccxUiWe4VYr+6OQBFlN9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrjYw1oG17ulOJBJqHqGLQ9EWgJCTGwzBmnndaxcIR8=;
 b=GrRwv6FfRdg3ig1IZ56Ah6N+acT+xw8NVNnT5v08xRN4CvuWg7bZz4q0dZznGRlVMu94Hx+610B016Lq0JLGC5h/gS1SFNq9oXu0yIXYxEkgl7KRzDRrJQ8T5pvEa1N33+9tIg/oSwxZkRTtuH2DwRLJhkxyufB8YPOZcUVpiLssFsJd7V7h7j8DunYCBD33uezEVA0LeXkD0A4aeFoa5DY4eKJ3l+5ggN7tgw6iFHMRNVC+wtp+8miY+Dosfl5pWTGb5kKd7ud4PB+YymZKdOYocSrLyFald/ERCuGLMAE8LbVC8nykXREuq9C8TOVsXpWeONG1U8NVSzZTKURihA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0136.namprd12.prod.outlook.com (2603:10b6:0:51::32) by
 MN2PR12MB3104.namprd12.prod.outlook.com (2603:10b6:208:cc::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.17; Tue, 10 Sep 2019 13:55:04 +0000
Received: from CO1NAM03FT047.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by DM3PR12CA0136.outlook.office365.com
 (2603:10b6:0:51::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2241.14 via Frontend
 Transport; Tue, 10 Sep 2019 13:55:04 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT047.mail.protection.outlook.com (10.152.81.48) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 13:55:03 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 10 Sep 2019 08:54:58 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 13/25] drm/amd/display: Do not double-buffer DTO adjustments
Date: Tue, 10 Sep 2019 09:54:33 -0400
Message-ID: <20190910135445.18300-14-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190910135445.18300-1-sunpeng.li@amd.com>
References: <20190910135445.18300-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(376002)(39860400002)(2980300002)(428003)(199004)(189003)(49486002)(47776003)(48376002)(50226002)(53936002)(8936002)(8676002)(81166006)(81156014)(50466002)(86362001)(54906003)(356004)(316002)(6666004)(446003)(5660300002)(11346002)(426003)(2616005)(478600001)(1076003)(486006)(186003)(2870700001)(76176011)(6916009)(305945005)(476003)(126002)(51416003)(4326008)(336012)(36756003)(2351001)(26005)(2876002)(2906002)(70206006)(70586007)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3104; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f198dfe1-cf9c-4e12-2c14-08d735f67b39
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:MN2PR12MB3104; 
X-MS-TrafficTypeDiagnostic: MN2PR12MB3104:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3104D78A3C58D0C3F0B36A5B82B60@MN2PR12MB3104.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: a8L67u6b9PDAPWDYNkwCROWUumNb101ufBkWyc/PaYG1kWfGlavV12L0hWImoJBckiRe22xg2UTdh9ssjNwS46XzE4opHDSpGcCyLkCsPP/X5Z/yvsu/EXJh8OA9KBz21sq137mc2pLkZ4A/EkpSuF9LClauo9znkasM2G3+91r5Q8kqWg5d2MDqDjbduhOPz5iDtPQwv9U+SmMOJKcamkBIF72ajvNm4VZqf6rLWB3NB+K/SrMNDIQG6NHrMN5akEYSjgCSqsnE765ty/DM904GyhXVPLHTAyfv0rVxyegioJYpAorim5pPrRkzlk0koOe/3JWw0cAYrzNCUTa6gQ2ZJ5Yf32Geuw2VaTxSVDo3ykFS72xN+gpUwXBtKSp9Qf8Tu1b8jVtGH5+xr6Gishu4uVIsNNrvb8GsduGO7Fo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 13:55:03.9934 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f198dfe1-cf9c-4e12-2c14-08d735f67b39
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3104
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrjYw1oG17ulOJBJqHqGLQ9EWgJCTGwzBmnndaxcIR8=;
 b=4DbbWwia9u+3pn0836K47rgNmhgAT64z5LpZkwfY3+KGZYZXJcXJqQuutbPXVIlvpl/x8k4hMy8bNfXAp8z+Ow1UDrE9WGAmq4aoaNJIJ+Egcb9eW0k8lRc6L618eBtk3mkHxlX0pR4XtJ3AeHFMyLFFn67qELXdvWy0DAKrnu4=
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
Cc: Leo Li <sunpeng.li@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>, Wesley Chalmers <Wesley.Chalmers@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogV2VzbGV5IENoYWxtZXJzIDxXZXNsZXkuQ2hhbG1lcnNAYW1kLmNvbT4KCltXSFldCldo
ZW4gY2hhbmdpbmcgRFBQIGdsb2JhbCByZWYgY2xvY2ssIERUTyBhZGp1c3RtZW50cyBtdXN0IHRh
a2UgZWZmZWN0CmltbWVkaWF0ZWx5LCBvciBlbHNlIHVuZGVyZmxvdyBtYXkgb2NjdXIuCkl0IGFw
cGVhcnMgdGhlIG9yaWdpbmFsIGRlY2lzaW9uIHRvIGRvdWJsZS1idWZmZXIgRFRPIGFkanVzdG1l
bnRzIHdhcyBtYWRlIHRvCnByZXZlbnQgdW5kZXJmbG93cyB0aGF0IG9jY3VyIHdoZW4gcmFpc2lu
ZyBEUFAgcmVmIGNsb2NrICh3aGljaCBpcyBub3QKZG91YmxlLWJ1ZmZlcmVkKSwgYnV0IHRoYXQg
c2FtZSBkZWNpc2lvbiBjYXVzZXMgc2ltaWxhciBpc3N1ZXMgd2hlbgpsb3dlcmluZyBEUFAgZ2xv
YmFsIHJlZiBjbG9jay4gVGhlIGJldHRlciBzb2x1dGlvbiBpcyB0byBvcmRlciB0aGUKYWRqdXN0
bWVudHMgYWNjb3JkaW5nIHRvIHdoZXRoZXIgY2xvY2tzIGFyZSBiZWluZyByYWlzZWQgb3IgbG93
ZXJlZC4KClNpZ25lZC1vZmYtYnk6IFdlc2xleSBDaGFsbWVycyA8V2VzbGV5LkNoYWxtZXJzQGFt
ZC5jb20+ClJldmlld2VkLWJ5OiBEbXl0cm8gTGFrdHl1c2hraW4gPERteXRyby5MYWt0eXVzaGtp
bkBhbWQuY29tPgpBY2tlZC1ieTogQW50aG9ueSBLb28gPEFudGhvbnkuS29vQGFtZC5jb20+CkFj
a2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KLS0tCiAuLi4vZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24yMC9kY24yMF9kY2NnLmMgfCAyMSAtLS0tLS0tLS0tLS0tLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMjEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2RjY2cuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9kY2NnLmMKaW5kZXggZjliOTlmOGNmYzMxLi4zMTNk
Mzc5MzAwNWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24y
MC9kY24yMF9kY2NnLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIw
L2RjbjIwX2RjY2cuYwpAQCAtMTE3LDI3ICsxMTcsNiBAQCB2b2lkIGRjY2cyX2dldF9kY2NnX3Jl
Zl9mcmVxKHN0cnVjdCBkY2NnICpkY2NnLAogCiB2b2lkIGRjY2cyX2luaXQoc3RydWN0IGRjY2cg
KmRjY2cpCiB7Ci0Jc3RydWN0IGRjbl9kY2NnICpkY2NnX2RjbiA9IFRPX0RDTl9EQ0NHKGRjY2cp
OwotCi0JLy8gRmFsbHRocm91Z2ggaW50ZW50aW9uYWwgdG8gcHJvZ3JhbSBhbGwgYXZhaWxhYmxl
IGRwcF9kdG8ncwotCXN3aXRjaCAoZGNjZ19kY24tPmJhc2UuY3R4LT5kYy0+cmVzX3Bvb2wtPnBp
cGVfY291bnQpIHsKLQljYXNlIDY6Ci0JCVJFR19VUERBVEUoRFBQQ0xLX0RUT19DVFJMLCBEUFBD
TEtfRFRPX0RCX0VOWzVdLCAxKTsKLQljYXNlIDU6Ci0JCVJFR19VUERBVEUoRFBQQ0xLX0RUT19D
VFJMLCBEUFBDTEtfRFRPX0RCX0VOWzRdLCAxKTsKLQljYXNlIDQ6Ci0JCVJFR19VUERBVEUoRFBQ
Q0xLX0RUT19DVFJMLCBEUFBDTEtfRFRPX0RCX0VOWzNdLCAxKTsKLQljYXNlIDM6Ci0JCVJFR19V
UERBVEUoRFBQQ0xLX0RUT19DVFJMLCBEUFBDTEtfRFRPX0RCX0VOWzJdLCAxKTsKLQljYXNlIDI6
Ci0JCVJFR19VUERBVEUoRFBQQ0xLX0RUT19DVFJMLCBEUFBDTEtfRFRPX0RCX0VOWzFdLCAxKTsK
LQljYXNlIDE6Ci0JCVJFR19VUERBVEUoRFBQQ0xLX0RUT19DVFJMLCBEUFBDTEtfRFRPX0RCX0VO
WzBdLCAxKTsKLQkJYnJlYWs7Ci0JZGVmYXVsdDoKLQkJQVNTRVJUKGZhbHNlKTsKLQkJYnJlYWs7
Ci0JfQogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRjY2dfZnVuY3MgZGNjZzJfZnVuY3MgPSB7
Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
