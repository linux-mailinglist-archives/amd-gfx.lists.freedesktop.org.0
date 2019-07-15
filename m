Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E92969D9A
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E062589BB0;
	Mon, 15 Jul 2019 21:21:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800040.outbound.protection.outlook.com [40.107.80.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA01289BB0
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gRh4DqXl7B+9M/np3h1g12cmEvq+vgd+a258Msb8erYDMUpX1VGYEumcC/1varCSX0iQRjXLFc8bwa/WhrxnRz3QGWFD+Ns4ReOdBEwSqqWg1GGVn3QKqB8MHZo3p71WykEGSslCFIRECeTLGFEVXoFMiF3zq8RcDEUutuT/gaY0L7Ae1nrl/tir286fBp0zzerNe5vhXeaicytSQmVErWCeoSE4+0yoouvB3L4GAXASl/9Gel24io/35TE77bBBd9vwsfKhnEY35YHdlQ1egPNje8Jid2ERWkc6gujGfg6uDndUL7YFY/YCTJFVvXRvIFmv75DMAirs8X/wIC8+Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVmGTxPHxKWLvOjh6DOnm31aIu5my3TGXagLlMimxUY=;
 b=PBSE12tE4YX84r8ktlibSUvQirCUU+EkZrl1urY8oefhTZvEi6hhd+TKStJJQCN8kV5x5vbuNvoecDZYGzrYxRpTAWMZSJ7XNTHLTYVEW48d3MX/VYln1Zg4uBsnR8YIRmrsK0MX0sXpqYG+A2Bf3kxC3y/bRbgtdo5dheW7sFSCHH+Ci7VK5TmyeVPeI1ZHa7gucCvQQ43pyLLaSpnzLAioLHIBABw6yffcUbORTBp4XqQXRmeKAU+RNaxD5syKRuu0/qyNiLuMxv+sgZuXVuqgYPu+brFyphsin4l94QlVdQvFk/ATxM0rVzEEWrvatHJbnRIxZYvvloMI0yXR6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR12CA0041.namprd12.prod.outlook.com (2603:10b6:301:2::27)
 by DM6PR12MB3932.namprd12.prod.outlook.com (2603:10b6:5:1cb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Mon, 15 Jul
 2019 21:21:15 +0000
Received: from CO1NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by MWHPR12CA0041.outlook.office365.com
 (2603:10b6:301:2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.14 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:15 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT009.mail.protection.outlook.com (10.152.80.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:14 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:05 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 08/87] drm/amd/display: cap DCFCLK hardmin to 507 for NV10
Date: Mon, 15 Jul 2019 17:19:30 -0400
Message-ID: <20190715212049.4584-9-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(39860400002)(346002)(2980300002)(428003)(199004)(189003)(426003)(51416003)(316002)(54906003)(1076003)(68736007)(50226002)(186003)(26005)(8936002)(2870700001)(4326008)(5660300002)(47776003)(478600001)(336012)(305945005)(50466002)(76176011)(48376002)(70586007)(6666004)(86362001)(53936002)(8676002)(70206006)(356004)(486006)(126002)(36756003)(2616005)(49486002)(11346002)(2351001)(2906002)(446003)(81156014)(81166006)(14444005)(476003)(2876002)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3932; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63131f8d-bf2b-4e68-e87d-08d7096a5e68
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM6PR12MB3932; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB3932:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3932EB6B26C3261CE27FF38A82CF0@DM6PR12MB3932.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 63AQKbWMIiqDC/MyA9hEhpbLs95kAZLrIgzADqjo+WtoAlNpUr2Nh8Z4Fb9PxlD4nnuPbQRwczNCClDrt1pjbGPpldw7FZBVNpcVCgX1Tel7Y3ZpQykRPHFAJko50eJXuJffNGvtg8+2IyZQ7kR5DuftapDwLw68h++I2QVkvCHnMFer8oToZ0UGAf6nduzRA2Cb/XozHbqklnsnLxEFjf1PKKMJWkr+wq9xoCLgP1HNY6DjfNmi7CBr1Bzq4z0SCNNW/jrFhc7jsuzZu1efZ2D1Pn2IoWDgcc+u6M9BLqGihHlei09vgfHLdDtK8FxYzTYCl4Cb8R549Iq5l9aUUiCNxUmVgAPpid/aJUGGXCwII0FXFkSGHMbQQFYDuQKcbTHHihOtvAfebUn0hwVY6yYLma7PtSblxUps5Hf4nvw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:14.9359 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63131f8d-bf2b-4e68-e87d-08d7096a5e68
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3932
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVmGTxPHxKWLvOjh6DOnm31aIu5my3TGXagLlMimxUY=;
 b=SqlU3JRmSLO9ole/PhLJ385Mp8aNuWutFIVbrztu8F6XqyjiSZVTsWMQ2Yng5Lydf9oDLcgb/+xPP4HnFx7ilLD6GirELL+K51lBcrJqb6jHs5oTyNEXYBc4SSqByIEC8K0I5HoXx216YLRjFsTqvYjIT1wicxz7jaNbMcN01GU=
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
Cc: Leo Li <sunpeng.li@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Eric Yang <eric.yang2@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSnVuIExlaSA8SnVuLkxlaUBhbWQuY29tPgoKW3doeV0KRHVlIHRvIGxpbWl0YXRpb24g
aW4gU01VL1BQTElCLCBpdCBpcyBub3QgcG9zc2libGUgdG8ga25vdyBGbWF4IEAgVm1pbiBmb3Ig
RENGQ0xLLgpUaGlzIGNhdXNlcyBpc3N1ZXMgYXQgaGlnaCBkaXNwbGF5IGNvbmZpZ3VyYXRpb25z
IHdoZXJlIGV4dHJhIGhlYWRyb29tIG9mIERDRkNMSwpjYW4gZW5hYmxlIFAtc3RhdGUgc3dpdGNo
aW5nCgpbaG93XQpVc2UgZXhpc3Rpbmcgb3ZlcnJpZGUgbG9naWMuICBJZiBvdmVycmlkZSBub3Qg
ZGVmaW5lZCwgdGhlbiBmb3JjZQptaW4gPSA1MDcKClNpZ25lZC1vZmYtYnk6IEp1biBMZWkgPEp1
bi5MZWlAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEVyaWMgWWFuZyA8ZXJpYy55YW5nMkBhbWQuY29t
PgpBY2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgfCA0ICsrKysKIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jCmluZGV4IDg0MmY0ODQwMzIyNi4u
ZDA3ZDM1YTlkZDBhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNuMjAvZGNuMjBfcmVzb3VyY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYwpAQCAtMjcwNCw2ICsyNzA0LDEwIEBAIHN0YXRpYyB2
b2lkIHVwZGF0ZV9ib3VuZGluZ19ib3goc3RydWN0IGRjICpkYywgc3RydWN0IF92Y3NfZHBpX3Nv
Y19ib3VuZGluZ19ib3hfCiAKIAlpZiAoZGMtPmJiX292ZXJyaWRlcy5taW5fZGNmY2xrX21oeiA+
IDApCiAJCW1pbl9kY2ZjbGsgPSBkYy0+YmJfb3ZlcnJpZGVzLm1pbl9kY2ZjbGtfbWh6OworCWVs
c2UKKwkJLy8gQWNjb3VudGluZyBmb3IgU09DL0RDRiByZWxhdGlvbnNoaXAsIHdlIGNhbiBnbyBh
cyBoaWdoIGFzCisJCS8vIDUwNk1oeiBpbiBWbWluLiAgV2UgbmVlZCB0byBjb2RlIDUwNyBzaW5j
ZSBTTVUgd2lsbCByb3VuZCBkb3duIHRvIDUwNi4KKwkJbWluX2RjZmNsayA9IDUwNzsKIAogCWZv
ciAoaSA9IDA7IGkgPCBudW1fc3RhdGVzOyBpKyspIHsKIAkJaW50IG1pbl9mY2xrX3JlcXVpcmVk
X2J5X3VjbGs7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
