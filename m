Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF2588511
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 23:39:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D0196EECB;
	Fri,  9 Aug 2019 21:38:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750081.outbound.protection.outlook.com [40.107.75.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BADC16EECD
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 21:38:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ccTPWnfK/X5+oGYK3stpzP0jotBbdSgre2b+TmAYnahQMbHLYZwIjk0dqRQ20GivBOi1t52YqGGuKsEKviy7/wRHFG6EFSLKLlPBm59bsX32mfFnqFMok+r1/UC6HA4IdhWWLt39iwapwLZ7ZMeQxfUEqXO0C/R7CYoIhxByl0GA+kEqeRLP6kW0xZc33BOFIdDtY4McXsezNJkWoPDflYE335AzhgGfbikPaqy66iYv41y+9loiCqsMj42SWL3B1y1w6D1QRMTp5X+B2k9ByNBWzfqTMLbBwNG7WgyQozP5W0RbYSgX+EKn3AKwCyHo0htcqQmsnq/TWKeWi/CPaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oBtj8/92a+2tPt1Udz4PiIwzUaAuzbnGAcM2Jy31ANo=;
 b=hzpHsAZFll1IZj5clvvqmVv21GQRu4xD/nVUTSlHR0IWPMY1zOw8AaTEoARGr0/L3T0xBhZvI7fe+vgEb9Gd8L1qoaOG/WLknKOoT6P9hIXpkfHUoAtSL9fMpNhp7CfPKqDyGRK2Ng4pX1r9Ss0yXfGiseZeVoCozoIfhpmjvpClvS+3fgKVXEHxLGYArhqC0qhO277AObWgKpGMTq30ffLFftRnwvjKIWgnRJJO+j1w0rntmpvScBMQHW+ZaN/FKtYok6sqO7Ii0ERq9MmPQvKGJv9fre6ne4j1S7qpG900zC/XTrl+uiyIibQaS8+aB0aoXPfjekqhJ933oyxLig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR1201CA0023.namprd12.prod.outlook.com
 (2603:10b6:405:4c::33) by MWHPR12MB1536.namprd12.prod.outlook.com
 (2603:10b6:301:6::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.20; Fri, 9 Aug
 2019 21:38:55 +0000
Received: from DM3NAM03FT003.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::209) by BN6PR1201CA0023.outlook.office365.com
 (2603:10b6:405:4c::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.14 via Frontend
 Transport; Fri, 9 Aug 2019 21:38:55 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT003.mail.protection.outlook.com (10.152.82.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Fri, 9 Aug 2019 21:38:55 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Fri, 9 Aug 2019 16:38:44 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 44/49] drm/amd/display: 3.2.46
Date: Fri, 9 Aug 2019 17:37:37 -0400
Message-ID: <20190809213742.30301-45-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190809213742.30301-1-sunpeng.li@amd.com>
References: <20190809213742.30301-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(376002)(136003)(396003)(2980300002)(428003)(199004)(189003)(48376002)(6916009)(14444005)(486006)(1076003)(49486002)(50466002)(5660300002)(2351001)(86362001)(53936002)(70586007)(70206006)(186003)(26005)(54906003)(356004)(6666004)(316002)(76176011)(305945005)(4744005)(51416003)(47776003)(81156014)(8676002)(50226002)(81166006)(476003)(8936002)(2616005)(478600001)(2906002)(426003)(126002)(2870700001)(2876002)(36756003)(11346002)(446003)(336012)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1536; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a9252f1-e292-4853-0d83-08d71d11fad0
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1536; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1536:
X-Microsoft-Antispam-PRVS: <MWHPR12MB15365C6C9F690EF7D24709E182D60@MWHPR12MB1536.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 01244308DF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: B4x4isemvv1tq5VnBk0E2ghL60HnusF4Rk+HLBMrMhYeZjB8aOYAL+P5YlNh6d+Oip84EmUY87Auyb/RmMZ07+6z4PaDKZBA4sOM+24Kc1CZCD6WLHfmlwzPLKW8isz7Y+NqwjbxQwLqzwgVOwDBo9WA/YjIqOQ0nfmbiYQRs76XEN6qOLDMBuNkyMRJnhF8KrLmH0dwt16Nrtl+X7OpifS7O5MrUOhVBAQoLQ+meSK4RXQjMLt7vH/7hepJaYBQPgU8Qr31F/YWIdOVl4Grh3fhfQvEqX50e2TbQRAoWyN2J6/CjPNonpizYv2/PA9gralXpUtSOca2nMSlMO2Xrh+xtAmp9Yi7AEtIcPQ/KJc5QAu8wRojkZUzmDJJDvGC/7qBk9cmLpa8fcFcSvTq62Y9vWlAd2miejkMmI6Eo/s=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 21:38:55.4023 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a9252f1-e292-4853-0d83-08d71d11fad0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1536
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oBtj8/92a+2tPt1Udz4PiIwzUaAuzbnGAcM2Jy31ANo=;
 b=PTqj3uy97NM6jTQJV2IlfVj39BgDUhHkg1xcCBZ4nnAxQYlm6vRexzUPALqhcxyj/WVYw+/MozJaat2/WKcXS0Yks9dcECM7K9cTWT8ncIwGDLnNSSU/jMuFDDCmMJfW60ztlKsZyKrZ3DfoF8YPG9U5wbSq1R+sxHF72/Llq0Q=
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
Cc: Leo Li <sunpeng.li@amd.com>, Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQW50aG9ueSBLb28gPEFudGhvbnkuS29vQGFtZC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBB
bnRob255IEtvbyA8QW50aG9ueS5Lb29AYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVu
Zy5saUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmggYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaAppbmRleCA3YmMxNmVhZjhiMDEuLjg3YmUwMmE4YTk1
OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKQEAgLTM5LDcgKzM5LDcgQEAKICNp
bmNsdWRlICJpbmMvaHcvZG1jdS5oIgogI2luY2x1ZGUgImRtbC9kaXNwbGF5X21vZGVfbGliLmgi
CiAKLSNkZWZpbmUgRENfVkVSICIzLjIuNDUiCisjZGVmaW5lIERDX1ZFUiAiMy4yLjQ2IgogCiAj
ZGVmaW5lIE1BWF9TVVJGQUNFUyAzCiAjZGVmaW5lIE1BWF9QTEFORVMgNgotLSAKMi4yMi4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
