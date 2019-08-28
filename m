Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 796A5A0C0D
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 23:04:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21DA789F2D;
	Wed, 28 Aug 2019 21:04:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800045.outbound.protection.outlook.com [40.107.80.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A16789F19
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 21:04:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZvCE6lk4GNwsD+FUiRLpfU04wv2QquBNTUjTeiRtyH3lmPA7lquHW8K6SJz0WA9rStFswWZkIYyOQfOYVvk10Zjy0IF9SJAYyIosaDzv+1BNvAZOpfp5x2DH1RfEwqxGuq0C7irKL+/7LOhVCAr4KHAblrOvo695oeouyab6vjpiMaUAQAj6r6eo0GiJafH/9FMCgS2+JDbh1uY1G8XKf0obJ6fDCD1M7qMUpl8GOmmIOW9zxa1otlewLKEHyRRE4mMYGeCCQeYhoMoaCbQGPutQ3hI0AvAF/R7B0AqN4mqyIfZ9/5TiQY3l2dBJDcVpqZKePdHd4mhfZVmDrDAKKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zZ9wnClHbPwHcj9kkVKQOMwwqoVdsjI4+J/Yng5zVw=;
 b=AsUbXCLfElu054HuMEfcrYARdwGW+G+UFxzD0QmDzJVd0X9NrfVpFJ/yoIy4xX2W/+BYH/5eSAZY16Nd9YUGqp13BNVgELwNhHd4RmMxX1O3BqvR+VojUvKgAWon9zFRBsJONzeI8hCsO/FkN5/ZQyfKkc6LVpw1XnkVARDshttbGKk8hhvLHz8wZf5q4pl82p+tt20jqxPDTIG/wzyILO+SNhJ5TCzjvDBfVEmWo+i5uAmS8hGOut8xpA60OgOiYwm0LcVZLUXSz0j39Vb1JZDCrtkoLCOwPe7T18dB1Karklq3njbDmvPdhA8GifR417QalHOzype6eugB1sFoWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0061.namprd12.prod.outlook.com (2603:10b6:0:56::29) by
 BYAPR12MB2712.namprd12.prod.outlook.com (2603:10b6:a03:68::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Wed, 28 Aug 2019 21:04:10 +0000
Received: from BY2NAM03FT004.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::200) by DM3PR12CA0061.outlook.office365.com
 (2603:10b6:0:56::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Wed, 28 Aug 2019 21:04:10 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT004.mail.protection.outlook.com (10.152.84.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Wed, 28 Aug 2019 21:04:10 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 28 Aug 2019
 16:04:04 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 07/17] drm/amd/display: 3.2.49
Date: Wed, 28 Aug 2019 17:03:44 -0400
Message-ID: <20190828210354.21464-8-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828210354.21464-1-Bhawanpreet.Lakha@amd.com>
References: <20190828210354.21464-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(396003)(376002)(2980300002)(428003)(189003)(199004)(26005)(14444005)(7696005)(51416003)(76176011)(6916009)(478600001)(186003)(70586007)(53416004)(2351001)(70206006)(305945005)(50226002)(81166006)(81156014)(8676002)(8936002)(16586007)(316002)(4326008)(1076003)(5660300002)(126002)(336012)(50466002)(11346002)(446003)(476003)(2906002)(486006)(2616005)(36756003)(48376002)(86362001)(6666004)(356004)(4744005)(53936002)(426003)(47776003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2712; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 138f48f3-07c3-4712-7ace-08d72bfb45d1
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BYAPR12MB2712; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2712:
X-Microsoft-Antispam-PRVS: <BYAPR12MB271276D135E3A074B283EBBAF9A30@BYAPR12MB2712.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 014304E855
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: R3c5d0yupsnKKP7wcG8xQPITdYuCB4Hf95LWC0nuWKZw4v/6QYWkCwh92gbxDgcozdH//HzuiM/RehorjVGeMphlurFuW7QZRjuLscDlOOU6dyk8b3xdgmzwqVX80KtOhzLzosCHhZoQaO+JCVIY9dNHRHlfYc0ffWe66TlSukS6Fpg/CuMue0v0cPdt5MBQ7V7nd8z8eCGrz4tFJxot/9+pVNU119rcvqhwAa7MBoBBq0EhogdgbpsIk1TzmKSzkyRDdEd4qqXEKJQ9VQMzsYG15Cw7JdQyROkpApMjMlFfykwVCOXNs7aTdvlu2L0m56EisT5UoVpamdIaDqIPMfquIoldnBguMCuMdRBpKICq2bHOhw+62H9tOsRWQRJLL2N/05kVAgIHTmqKqZlKwPPhU2+0ZkyikJmf1Jg0jho=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2019 21:04:10.2745 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 138f48f3-07c3-4712-7ace-08d72bfb45d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2712
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zZ9wnClHbPwHcj9kkVKQOMwwqoVdsjI4+J/Yng5zVw=;
 b=Vtf5YN4zADyX+8FYsrV+q1pTLolryrp0PSgHj2aOw5EgxenwOiUiKiwDrjelNg8d3wxxkl/ss8bI3gJus03ODzBOMwpJX2FgjqV9fcS7Ta4Y1aiBd5CBVeNxexUrDOqmbwHi8XptjX18JSKI6GvLuBc1X7e/++rJWBbkYFTHack=
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
Cc: Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQW50aG9ueSBLb28gPEFudGhvbnkuS29vQGFtZC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBB
bnRob255IEtvbyA8QW50aG9ueS5Lb29AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFudGhvbnkgS29v
IDxBbnRob255Lktvb0BhbWQuY29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdh
bnByZWV0Lkxha2hhQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjLmggfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaCBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oCmluZGV4IDNkMzJlOTAxNGYxOC4uZGEx
ZDJmYjQ0OTBlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMu
aAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaApAQCAtMzksNyArMzks
NyBAQAogI2luY2x1ZGUgImluYy9ody9kbWN1LmgiCiAjaW5jbHVkZSAiZG1sL2Rpc3BsYXlfbW9k
ZV9saWIuaCIKIAotI2RlZmluZSBEQ19WRVIgIjMuMi40OCIKKyNkZWZpbmUgRENfVkVSICIzLjIu
NDkiCiAKICNkZWZpbmUgTUFYX1NVUkZBQ0VTIDMKICNkZWZpbmUgTUFYX1BMQU5FUyA2Ci0tIAoy
LjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
