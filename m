Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E100CAEC79
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 15:55:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D7F56E8FF;
	Tue, 10 Sep 2019 13:55:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750085.outbound.protection.outlook.com [40.107.75.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C4C6E8F4
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 13:55:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VMis9/R78PUSIC2fUkypDFOKUkyX/MTlrJVE7sWxbGsTQ1aA5MsaXqcKXhNAjGm7J3zbEmADLVTIwRwPXYU0cX+YRPQmJcsPaARg3Vk3QMYkzhPzDqwrS9oVRRGNUPW4g4ZIpM70srMWPJGilYGUMUVIeSSBm7tllQ+rg6VmKRhjg93MxokEv2yYHhKTEzrvo+bpwtn7NX5+qkOWLySGHkblWPXg0ZgMsAcOQUFZ4c7itneOTlpQ/5haN5zeHRPVHyZcDKgF8UhhfKV3OrKLxAlTSlb3AC7u+0v5hdoh9bYqnEU3hZ9jCWDd5jiYMxvJRQozqFbgqRQ9zOpQLZv7AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lCbXHO0P12J1TUwNhMYqFXoWTKXsPj10x94ZuHuj4Rc=;
 b=mG7p+qfgYiAGRwJAPfL2PYvT/YXjFFjsBj8A8CbZSYXtQbbnNwdGEasFrNfIDfT1HXYz5RQupbWFvtMsmoh7QGtwGAvTLpmWXUsOjDHOU8j6PJv8WHHZAxgi5WryxCEnrHnJpWVELf843ucQiwXe2cexTHXzmyQD1Oo8cukfuzn2tsmAhi+FmgWMaErybC75oWQ91kFWbvBF9dQoXNTbhS2FO4SbJRS637bFP+xxQzb/EYMo03vr6PhMuauSCEwBfSelbB8PfaZfNEJCTavRgw4SNx2TDkzQUS90nk3E4XOaXO1TEri3P/8PKOZ3PfTSLIN0Cw8WBFqvPEn9GeZQTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0025.namprd12.prod.outlook.com (2603:10b6:5:1c0::38)
 by DM6PR12MB4267.namprd12.prod.outlook.com (2603:10b6:5:21e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.18; Tue, 10 Sep
 2019 13:55:08 +0000
Received: from CO1NAM03FT026.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by DM6PR12CA0025.outlook.office365.com
 (2603:10b6:5:1c0::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2241.18 via Frontend
 Transport; Tue, 10 Sep 2019 13:55:08 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT026.mail.protection.outlook.com (10.152.80.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 13:55:08 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 10 Sep 2019 08:55:02 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 22/25] drm/amd/display: 3.4.51.1
Date: Tue, 10 Sep 2019 09:54:42 -0400
Message-ID: <20190910135445.18300-23-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190910135445.18300-1-sunpeng.li@amd.com>
References: <20190910135445.18300-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(376002)(396003)(2980300002)(428003)(189003)(199004)(2351001)(54906003)(49486002)(186003)(356004)(2870700001)(476003)(2876002)(86362001)(6916009)(446003)(11346002)(426003)(126002)(8936002)(2616005)(70586007)(6666004)(53936002)(50226002)(70206006)(26005)(486006)(14444005)(1076003)(4744005)(478600001)(316002)(305945005)(336012)(47776003)(8676002)(81156014)(81166006)(2906002)(50466002)(5660300002)(48376002)(36756003)(76176011)(4326008)(51416003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4267; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c06f4ec7-7fc3-4836-00e3-08d735f67de1
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM6PR12MB4267; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB4267:
X-Microsoft-Antispam-PRVS: <DM6PR12MB42671D0B91FDD7348E69003782B60@DM6PR12MB4267.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: +qBJ6DfCu2cbLqcsk3XoaYOm8wt3V9ZZSO0bQAQpTpNc35N+WSZd0xOllVhfZc8kgd8mcRkqKGFTIRIFBR/3Vk4QUtjv5QN2suXB5wS+S9nwZwkAyiRjEnPkwIo9FjvFkZK80i2J/mB79zu3pHrMvuA4U9N5kvHXYSbP1qEsoT/PZitr2MaP23pzJA6n0WXj2q06CF90MEj32tbRNTJamjBVISejYWFByFeDjPfyl0fGJtju+WnT1bbMoLpwGV9oZqrEAMmvostSELkrh4127hvbcqg2nhMBiElNp5i1bpXKDQVITD99IrCBogXb2c9mQuCVjz1rC7WownfKZQtkXL5A5Nb9ufikQUqe5SBQBDelre3jGABY5K41F1AGKCHa71A4Mnktjy/pUVLVffG+5IiM/H/6/Vd+u++hokkmtMo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 13:55:08.3266 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c06f4ec7-7fc3-4836-00e3-08d735f67de1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4267
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lCbXHO0P12J1TUwNhMYqFXoWTKXsPj10x94ZuHuj4Rc=;
 b=oGCTOR3JjfhsD7ST9fz72aew4DcfhPgqgXTvyeHXv+G+u7ZMMKI/q8SrQpiI9ArxHs+zzwRIBzFqrGac3FfAKptKshF5leL1HA2KYAtYsv7ZH7RTL9AcJWTkf1LyEPx4KUPD7eofcybXpv/IFI3yCT6huNTHQMoMDXgEo/0ynCE=
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
Cc: Leo Li <sunpeng.li@amd.com>, Aric Cyr <aric.cyr@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQXJpYyBDeXIgPGFyaWMuY3lyQGFtZC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBBcmljIEN5
ciA8YXJpYy5jeXJAYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGMuaAppbmRleCA3YzE5YWM3MWI0MjQuLjNlY2M0Mjk4N2IwNSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKQEAgLTM5LDcgKzM5LDcgQEAKICNpbmNsdWRlICJpbmMv
aHcvZG1jdS5oIgogI2luY2x1ZGUgImRtbC9kaXNwbGF5X21vZGVfbGliLmgiCiAKLSNkZWZpbmUg
RENfVkVSICIzLjIuNTEiCisjZGVmaW5lIERDX1ZFUiAiMy4yLjUxLjEiCiAKICNkZWZpbmUgTUFY
X1NVUkZBQ0VTIDMKICNkZWZpbmUgTUFYX1BMQU5FUyA2Ci0tIAoyLjIyLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
