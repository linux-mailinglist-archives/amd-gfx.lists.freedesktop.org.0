Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC73B6E2EA
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jul 2019 10:52:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019766E5CF;
	Fri, 19 Jul 2019 08:52:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770078.outbound.protection.outlook.com [40.107.77.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B1A6E5CF
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jul 2019 08:52:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XiQNRWK7KQIhAPv4mvSvZ0865TmCG91ZQFnaCMfQhGbNwLx05tIfaW8ZhHr9C8K6ckocsjVTrLR2IG3NKiFkpjpCT1Q9gt56pwBBXxD83UUpW0DOqgP0TslFd+uf/MhZesAYBXFIypdRFt+I8N4jndm8FDLRZR5Jt39egaIKk7WFGpIMwS1Hf9bFDTPcqsGQhzlN+UI3g6dFZFIdZLocBLU10hX5ljpfvQjfyGDrCwGY3u6uL+s2/toOI3pi0PUW7qMleIkpXsjLyNVDbOy+r+RhS8uidQnLEiI/J55VNTrSPfvm3B8XMNxsq2IthjuJ60dQ+EzejKUijuf1NHXraQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIhbP8rL4tQqDgR9wkzbTtRxdy/65vLO/tK9rYbfTOA=;
 b=n/E3P/3R/JWGUZi9H58xfKVcF8WeX5MOP9lEbaZ/dMxRZ5xudueg2xmT20wCrivqiyRRpYSB42EvzvkdtePhP6AmRE6JJV6GLS0FH/SgWIWNtXh/iFUvjX1lMNQAeGEI2VZnXbz9w9Jl3La70achD6lo1lBtroKIwlM+l79EQ0KHd+TyoknynPojakknJb5PvSd7TZEdVW80EQxJ+PO4eN8FgV0+saEtkXj/Wa/xM5BMEAawlS7DRSpWX+5i1shWlGmgy5YEA2+DEJaUh0Mic6+8GltnpgwOwVUiOZ+ZJVhZIJ4rtKc0gNj8Z6jFCEleHl+XAeoxFVzpK23TyVJWdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM3PR12CA0077.namprd12.prod.outlook.com (2603:10b6:0:57::21) by
 CY4PR12MB1926.namprd12.prod.outlook.com (2603:10b6:903:11b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.12; Fri, 19 Jul
 2019 08:52:07 +0000
Received: from BY2NAM03FT007.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::203) by DM3PR12CA0077.outlook.office365.com
 (2603:10b6:0:57::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.14 via Frontend
 Transport; Fri, 19 Jul 2019 08:52:07 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT007.mail.protection.outlook.com (10.152.84.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Fri, 19 Jul 2019 08:52:07 +0000
Received: from equan-buildpc.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 19 Jul 2019
 03:52:05 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: correct the bit mask for checking VCN
 power status
Date: Fri, 19 Jul 2019 16:51:45 +0800
Message-ID: <20190719085145.27515-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(346002)(376002)(2980300002)(428003)(189003)(199004)(8676002)(1076003)(53416004)(86362001)(356004)(6666004)(6916009)(316002)(305945005)(4326008)(81166006)(70586007)(81156014)(8936002)(68736007)(50226002)(50466002)(5660300002)(7696005)(51416003)(48376002)(2906002)(53936002)(26005)(186003)(476003)(2616005)(126002)(426003)(70206006)(36756003)(47776003)(44832011)(486006)(2351001)(14444005)(478600001)(336012)(2870700001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1926; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03550d16-687e-4513-8c68-08d70c26611a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1926; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1926:
X-Microsoft-Antispam-PRVS: <CY4PR12MB192699BFA4FD0811A1C519D4E4CB0@CY4PR12MB1926.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-Forefront-PRVS: 01039C93E4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: k5AGdB/iWMDTnw6mOHQvnwhogATRy2cy7vgAZO97+vXcWa3T8CVhboWkfIs1gONH8JZOUs7lkuFhgLb8XO6IX2oPE/x88qc9F2s99w7D2SRBPOa6ZujQ7/oagyz1oUHWoRwYLdqtZZ7NUkreueJ625kPvs0mlLlu9bHaejIOYLuEzA004jXrRpA3va7n1ZrU2z8q3lrSj7MV3Ii68f+Kh4g29yuRmP/6aMzhIMOFpYCLqy/u4o5W45X35kQptVsT/jh8WcchDiq0dY79eIR0gsmRphHijpZq+kWJKAL/MkVYf1MHv40xNBqOZ6n4XMPYUFPHeUPhLRLFFkD+TEdzf/1PboUM4T0N37wLQYfsJt9z5LinkHLEaBPDT6gojP2sxOI64fMUjdarHebij0B4koULM4THpcsexziWf7q5E5Y=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2019 08:52:07.2183 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03550d16-687e-4513-8c68-08d70c26611a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1926
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIhbP8rL4tQqDgR9wkzbTtRxdy/65vLO/tK9rYbfTOA=;
 b=DSAntiEIdEJ12sUJB1oaJjQMzMU1TitP99+rF0UytS722Z7iWKE2Jtg5OcoAAQwpWApl5DXa89VlNo5srUuRh+5o8rmpIqICWMr22BcJfba8xCkvAgtmNG5EU3TE01RRn2gCNC9lmcZC4wn3YPiT+tUfdA9hyBadvKdIK+LUusY=
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

Rm9yIE5hdmkxMCBvciBsYXRlciBBU0lDcywgYSBkaWZmZXJlbnQgYml0IG1hc2sgaXMgdXNlZCBm
b3IgY2hlY2tpbmcKVkNOIHBvd2VyIHN0YXR1cy4KCkNoYW5nZS1JZDogSWFhNDllNWEzMzljMzhm
NDZlM2U3MTI0ZDIxYWViNjVmNjYzMzMyNWUKU2lnbmVkLW9mZi1ieTogRXZhbiBRdWFuIDxldmFu
LnF1YW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVf
c211LmMgfCA4ICsrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1k
Z3B1X3NtdS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCmlu
ZGV4IDZlMmY3ZGY4MjZmMC4uODg3NTc3YzQ3NTY4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvYW1kZ3B1X3NtdS5jCkBAIC0yNzEsNiArMjcxLDggQEAgaW50IHNtdV9nZXRfcG93
ZXJfbnVtX3N0YXRlcyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIGludCBzbXVfY29tbW9uX3Jl
YWRfc2Vuc29yKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBlbnVtIGFtZF9wcF9zZW5zb3JzIHNl
bnNvciwKIAkJCSAgIHZvaWQgKmRhdGEsIHVpbnQzMl90ICpzaXplKQogeworCXN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2ID0gc211LT5hZGV2OworCXVpbnQzMl90IHV2ZF9iaXRfbWFzayA9IDB4
RkZGRkZGRkY7CiAJaW50IHJldCA9IDA7CiAKIAlzd2l0Y2ggKHNlbnNvcikgewpAQCAtMjg3LDcg
KzI4OSwxMSBAQCBpbnQgc211X2NvbW1vbl9yZWFkX3NlbnNvcihzdHJ1Y3Qgc211X2NvbnRleHQg
KnNtdSwgZW51bSBhbWRfcHBfc2Vuc29ycyBzZW5zb3IsCiAJCSpzaXplID0gODsKIAkJYnJlYWs7
CiAJY2FzZSBBTURHUFVfUFBfU0VOU09SX1VWRF9QT1dFUjoKLQkJKih1aW50MzJfdCAqKWRhdGEg
PSBzbXVfZmVhdHVyZV9pc19lbmFibGVkKHNtdSwgU01VX0ZFQVRVUkVfRFBNX1VWRF9CSVQpID8g
MSA6IDA7CisJCWlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9WRUdBMjApCisJCQl1dmRfYml0
X21hc2sgPSBTTVVfRkVBVFVSRV9EUE1fVVZEX0JJVDsKKwkJZWxzZQorCQkJdXZkX2JpdF9tYXNr
ID0gU01VX0ZFQVRVUkVfVkNOX1BHX0JJVDsKKwkJKih1aW50MzJfdCAqKWRhdGEgPSBzbXVfZmVh
dHVyZV9pc19lbmFibGVkKHNtdSwgdXZkX2JpdF9tYXNrKSA/IDEgOiAwOwogCQkqc2l6ZSA9IDQ7
CiAJCWJyZWFrOwogCWNhc2UgQU1ER1BVX1BQX1NFTlNPUl9WQ0VfUE9XRVI6Ci0tIAoyLjIyLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
