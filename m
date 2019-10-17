Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A58D8DB741
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 21:16:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF29A6EAC7;
	Thu, 17 Oct 2019 19:15:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700045.outbound.protection.outlook.com [40.107.70.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A43746EAC4
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 19:15:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NGltAccFj92VT1zBlkUZX2rRN/c8gdq1hc5IFutRXFh5VBoTu1ovqkN7izqYViPu5cBdzIPocWKdy5KckVUqP3HTijFi1uxkOgc93d9PJa//LfI2SyXIPLmi3IRrYT7EmWeLFzm1lYVF8hh3SNIBwMiv1RYdTWDBdqenbQfoV96xPRXEGR5iMmJoQ2JY/JQDxs1KW3a2l0IHvZ7g40DentFOjmpXPTDLG4s8CsCEaFl5df3xYo2Msg5oha6wOmiHD1itgvcEMeu905cfV3X2jr7VMLn8Ht1dzyvyC0PxlgCw9y2mGITl5rKZA6gFxjz1n7r3HvrgBVEK+w0IBat88A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOb8UxgOdllUgO0QZwh5vFNCouqEDZcCETw8koiCUHM=;
 b=Kq6Xn7eXUckMb/G6YdrTm5g0zvymHTJkYLALizQqLkbEzznnmHQd3/4aMq/ueFNO9EkzERjtUYXy8eGZjKY9nF0SPEvXmc6ZXJLWQIsG7HckcxAtDISlHaqOsWQtn2e8I5aignD31PNfcYSieNirXvOnQXj1hTvMDdlN9G74W6nZvBdTMmBuoEXtBpbYjxJtTG9oCPhbln7+MX56G5mcboCfzBLJrD7wrpekSMhBZS9FrY8mgwABlC+NkVTn7sqfUjmfM8qVAIt1zOoYJdEC7R0QEw+mJ1s7t3VVEF0vg7OLLwsYoo6BKI4CXpcoqDRhrZ4a6TPKUxf3ATHQyQHPSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN8PR12CA0024.namprd12.prod.outlook.com (2603:10b6:408:60::37)
 by CY4PR12MB1429.namprd12.prod.outlook.com (2603:10b6:903:42::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.17; Thu, 17 Oct
 2019 19:15:51 +0000
Received: from BY2NAM03FT041.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by BN8PR12CA0024.outlook.office365.com
 (2603:10b6:408:60::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.23 via Frontend
 Transport; Thu, 17 Oct 2019 19:15:50 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BY2NAM03FT041.mail.protection.outlook.com (10.152.85.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2367.14 via Frontend Transport; Thu, 17 Oct 2019 19:15:50 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:47 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 17 Oct 2019 14:15:47 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 27/37] drm/amd/display: do not synchronize "drr" displays
Date: Thu, 17 Oct 2019 15:13:19 -0400
Message-ID: <20191017191329.11857-28-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017191329.11857-1-sunpeng.li@amd.com>
References: <20191017191329.11857-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(396003)(346002)(428003)(189003)(199004)(76176011)(305945005)(2906002)(478600001)(6916009)(54906003)(1076003)(2876002)(36756003)(70206006)(70586007)(5660300002)(4326008)(51416003)(47776003)(2870700001)(316002)(6666004)(50466002)(48376002)(81156014)(50226002)(8676002)(81166006)(86362001)(8936002)(446003)(486006)(356004)(426003)(186003)(126002)(476003)(26005)(11346002)(2351001)(336012)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1429; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3051028d-73df-407f-e187-08d753366c50
X-MS-TrafficTypeDiagnostic: CY4PR12MB1429:
X-Microsoft-Antispam-PRVS: <CY4PR12MB142914D33A6EF76DE22D98CA826D0@CY4PR12MB1429.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-Forefront-PRVS: 01930B2BA8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C6t7xgunAE6RmhHXoZCSrL7RnhJbEtw07BaTr68TwCiqT89Rgk95GLDltxhVLExba7B7q9M/c1yRaZaED8U4PNJEOyhw/Ao9MOK2p/6aer0Z0bpjPyZTo11EGr3MSuoK66WiefOq0VywWJvxzrYsCMgL8LgPh8g+60copWFYo5CjUolvbPy4xcEiiMRjEpFihnGzOD/zqzUblocSjgqA+OxbbMnrJuv/5M50o17QMQ3NVwTbuDFgT9ZP4b6Qy9ybkdqbhHV2cZRRceSQYQxO4ABxaFAX9tvp0mPtvxjgrXRFZZQ+G2Vo+fZ2B7b83rpR40wcXt5ilHhlCAPuXPvLEXBaizKJdQA3qX3h2DiUlpD7HRNmR7VGzvUCzAXra7tzkZD0lPW3tBJ2hy7yTo/2gEPWgwG9jRFtzKSyDyALhIo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 19:15:50.5492 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3051028d-73df-407f-e187-08d753366c50
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1429
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOb8UxgOdllUgO0QZwh5vFNCouqEDZcCETw8koiCUHM=;
 b=OeE7q2gcMz5W5C83vaDz2CkZf+z8OGFVfOUGjxbFeU08j4Qvx3sWVCW8/+cYU9HKahuYo5fjCIXi+hahZjc649zA6FlgF+vE+i5K/oDhQvM2MPNTswxku/OhpU856rsXjkHN32wdWIqwQzgmCJceMcp2Lp2HgXwy7t/YTWQNSOE=
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
Cc: Leo Li <sunpeng.li@amd.com>, Jun Lei <Jun.Lei@amd.com>, Anthony
 Koo <Anthony.Koo@amd.com>, Yongqiang Sun <yongqiang.sun@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSnVuIExlaSA8SnVuLkxlaUBhbWQuY29tPgoKW3doeV0KQSBkaXNwbGF5IHRoYXQgc3Vw
cG9ydHMgRFJSIGNhbiBuZXZlciByZWFsbHkgYmUgY29uc2lkZXJlZAoic3luY2hyb25pemVkIiB3
aXRoIGFueSBvdGhlciBkaXNwbGF5IGJlY2F1c2Ugd2UgY2FuIGR5bmFtaWNhbGx5CmVuYWJsZSBE
UlIgKGkuZS4gd2l0aG91dCBtb2Rlc2V0KS4gIHRoaXMgd2lsbCBjYXVzZSB0aGVpcgpyZWxhdGl2
ZSBDUlRDIHBvc2l0aW9ucyB0byBkcmlmdCBhbmQgbG9zZSBzeW5jLiAgdGhpcyB3aWxsIGRpc3J1
cHQKZmVhdHVyZXMgc3VjaCBhcyBNQ0xLIHN3aXRjaGluZyB0aGF0IGFzc3VtZSBhbmQgZGVwZW5k
IG9uCnRoZWlyIHBlcm1hbmVudCBhbGlnbm1lbnQgKHRoYXQgY2FuIG9ubHkgY2hhbmdlIHdpdGgg
bW9kZXNldCkKCltob3ddCmNoZWNrIGZvciBpZ25vcmVfbXNhIGluIHN0cmVhbSB3aGVuIGNvbnNp
ZGVyZWQgc3luY2hyb25pemFiaWxpdHkKdGhpcyBpZ25vcmVfbXNhIGlzIGJhc2ljYWxseSBhY3R1
YWxseSBpbXBsZW1lbnRlZCBhcyAic3VwcG9ydHMgZHJyIgoKU2lnbmVkLW9mZi1ieTogSnVuIExl
aSA8SnVuLkxlaUBhbWQuY29tPgpSZXZpZXdlZC1ieTogWW9uZ3FpYW5nIFN1biA8eW9uZ3FpYW5n
LnN1bkBhbWQuY29tPgpBY2tlZC1ieTogQW50aG9ueSBLb28gPEFudGhvbnkuS29vQGFtZC5jb20+
CkFja2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19yZXNvdXJjZS5jIHwgNiArKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvY29yZS9kY19yZXNvdXJjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2NvcmUvZGNfcmVzb3VyY2UuYwppbmRleCBkYTllMmU1ZjVjMGQuLjhmZTM5ZmRlZmMy
NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfcmVz
b3VyY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19yZXNv
dXJjZS5jCkBAIC00MDQsNiArNDA0LDkgQEAgYm9vbCByZXNvdXJjZV9hcmVfc3RyZWFtc190aW1p
bmdfc3luY2hyb25pemFibGUoCiAJaWYgKHN0cmVhbTEtPnZpZXdfZm9ybWF0ICE9IHN0cmVhbTIt
PnZpZXdfZm9ybWF0KQogCQlyZXR1cm4gZmFsc2U7CiAKKwlpZiAoc3RyZWFtMS0+aWdub3JlX21z
YV90aW1pbmdfcGFyYW0gfHwgc3RyZWFtMi0+aWdub3JlX21zYV90aW1pbmdfcGFyYW0pCisJCXJl
dHVybiBmYWxzZTsKKwogCXJldHVybiB0cnVlOwogfQogc3RhdGljIGJvb2wgaXNfZHBfYW5kX2hk
bWlfc2hhcmFibGUoCkBAIC0xNTQwLDYgKzE1NDMsOSBAQCBib29sIGRjX2lzX3N0cmVhbV91bmNo
YW5nZWQoCiAJaWYgKCFhcmVfc3RyZWFtX2JhY2tlbmRzX3NhbWUob2xkX3N0cmVhbSwgc3RyZWFt
KSkKIAkJcmV0dXJuIGZhbHNlOwogCisJaWYgKG9sZF9zdHJlYW0tPmlnbm9yZV9tc2FfdGltaW5n
X3BhcmFtICE9IHN0cmVhbS0+aWdub3JlX21zYV90aW1pbmdfcGFyYW0pCisJCXJldHVybiBmYWxz
ZTsKKwogCXJldHVybiB0cnVlOwogfQogCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
