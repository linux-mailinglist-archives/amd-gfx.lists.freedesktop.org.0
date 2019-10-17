Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE28FDB73E
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 21:15:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF266EAC8;
	Thu, 17 Oct 2019 19:15:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02on0627.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe45::627])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B15D66EAA5
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 19:15:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PmQU6qPXiJuOXQCNOVc6PAVo6NBdk+k/akWqtBYFV8fCprHB/j+uH9g4x3jDaNI94sjifNB2iwp5PmAkuo3E5srByglWZ6z4Xzkt0eQ1f8S8+jeH/5cy09zGK8Y5ZzmQmgItPt2s7wtzf8zb4pKWkIqseuJC83QNLJ6NN2R8yeQoXQ2Fx8t2VWoTkALzKXp4Z7eO8D2rpStcF+NBRO7/oNQ/yx0kMrd8XMXOIEAfzbW0+mDG40yGMi4pffE5EoGOCUskOmd5EyAIkCav0s0vYL3iNVqrF2psWt97fR/qgc++PWvC+NAWvyZ6dAtuHzeNTl8XFHNfgkiqxBycv80tlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ag9eu2znMntLXDtEOV/yDIzwxGLOYuCNfaZIAtNnLlc=;
 b=URPk8gdrqwI44sPfl3soc5HfIRNDY3SJmO1XqEdOndN7HXb+fBF0bnS6LM/fUvmmNYCm1BXIIg5h7a95ePaIlYq3KSfhK6ZjGIlqaZHyC+Q1QmVxh7GfzSjO0a6OAsU3Nbhw7ar3PiHp54SAxr188yqYghw76iSPremED5oK/6qVUVCZuKVLevmUpbT1bD2oTPJ56010goZUlGEPU5jAaAJZ+z0fIfK9Vv2n+2WQmmqWRNtvCh99YoFOUpt1RhldJPBLAXIAo3KzeF4+/b4pK39GdGGrmCMdevMtAOAjm5t/GYXiSo6XWQ2cx9e/CCYIQ46p/XH0Ssqod2yGjUcZSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN8PR12CA0024.namprd12.prod.outlook.com (2603:10b6:408:60::37)
 by MN2PR12MB3998.namprd12.prod.outlook.com (2603:10b6:208:16d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Thu, 17 Oct
 2019 19:15:47 +0000
Received: from BY2NAM03FT041.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by BN8PR12CA0024.outlook.office365.com
 (2603:10b6:408:60::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.23 via Frontend
 Transport; Thu, 17 Oct 2019 19:15:47 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BY2NAM03FT041.mail.protection.outlook.com (10.152.85.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2367.14 via Frontend Transport; Thu, 17 Oct 2019 19:15:47 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:42 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 17 Oct 2019 14:15:42 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 21/37] drm/amd/display: add embedded flag to dml
Date: Thu, 17 Oct 2019 15:13:13 -0400
Message-ID: <20191017191329.11857-22-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017191329.11857-1-sunpeng.li@amd.com>
References: <20191017191329.11857-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(396003)(39860400002)(428003)(189003)(199004)(81166006)(11346002)(51416003)(6916009)(76176011)(81156014)(8936002)(8676002)(50226002)(186003)(1076003)(70206006)(26005)(4326008)(70586007)(2351001)(6666004)(446003)(486006)(476003)(2616005)(126002)(356004)(336012)(426003)(47776003)(5660300002)(305945005)(478600001)(48376002)(36756003)(86362001)(50466002)(54906003)(2906002)(2870700001)(316002)(2876002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3998; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3fbb02d3-f360-4737-1517-08d753366a74
X-MS-TrafficTypeDiagnostic: MN2PR12MB3998:
X-Microsoft-Antispam-PRVS: <MN2PR12MB399814E0227771F28A42A024826D0@MN2PR12MB3998.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 01930B2BA8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sFeRro27ciGuLRFhblslq9sBUxcoD8k2gNJHsXs0UJFSfLXQBKeNdF1noPzb/nnEuofoyNHLiojxGXFyCPjK/2dV3LoD4qAnjgUyUK9y8HsIYjXSqM5rBO82NZGXyjaEmjQm+lE5I/8Ej/+pc7dugSvfKJmjdi9C2cvIBJr1M9+AWKivwJE3aDVdbZiMDiLyYLt6qNO7216FgegZHaflaYy/IxP0JU8Zi76kW+wWqkYXllR+/6kVXY/tDgJL9Ati4LZ/YSWoUW0GknagD43EADiMGn3P8YGz/fcTpH1/wshYzcjrSiLXDYUjCKkyvNvnx+WsN4yMMcYgf6CQ8bS/wAaGBK1kY6EBd1UeqnVGvZMRkljTFku3KY9M9tf+E2K4U7+IoTLyweS60VTCXdlX0th4W/jHCOBA4PaYG4+N/t4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 19:15:47.4245 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fbb02d3-f360-4737-1517-08d753366a74
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3998
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ag9eu2znMntLXDtEOV/yDIzwxGLOYuCNfaZIAtNnLlc=;
 b=BHcny77mvkuDn08EH5tv6LfieSu+nSJ2WTMGUoXvNLoFRqTMKkde4I95Z0bG8jnvsUH1Ed+28wfeNpPaAJlO5zpJMi0LB7jIz/M5hmk+hRv88PmWzLOgSYX6eq/mUIZVNn3xjYpB6UEpMndqVjjRMCj+HZkc6kIz4IYHuAHzlcI=
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
 Eric Bernstein <Eric.Bernstein@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KClNp
Z25lZC1vZmYtYnk6IERteXRybyBMYWt0eXVzaGtpbiA8RG15dHJvLkxha3R5dXNoa2luQGFtZC5j
b20+ClJldmlld2VkLWJ5OiBFcmljIEJlcm5zdGVpbiA8RXJpYy5CZXJuc3RlaW5AYW1kLmNvbT4K
QWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kbWwvZGlzcGxheV9tb2RlX3N0cnVjdHMuaCB8IDEgKwogZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kaXNwbGF5X21vZGVfdmJhLmMgICAgIHwgMSAr
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2Rpc3BsYXlfbW9kZV92YmEuaCAg
ICAgfCAxICsKIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kaXNwbGF5X21vZGVfc3RydWN0cy5o
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kaXNwbGF5X21vZGVfc3RydWN0
cy5oCmluZGV4IDgzZjg0Y2RkNDA1NS4uY2ZhY2Q2MDI3NDY3IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2Rpc3BsYXlfbW9kZV9zdHJ1Y3RzLmgKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kaXNwbGF5X21vZGVfc3RydWN0cy5o
CkBAIC0zMTgsNiArMzE4LDcgQEAgc3RydWN0IF92Y3NfZHBpX2Rpc3BsYXlfcGlwZV9kZXN0X3Bh
cmFtc19zdCB7CiAJdW5zaWduZWQgaW50IHZ1cGRhdGVfd2lkdGg7CiAJdW5zaWduZWQgaW50IHZy
ZWFkeV9vZmZzZXQ7CiAJdW5zaWduZWQgY2hhciBpbnRlcmxhY2VkOworCXVuc2lnbmVkIGNoYXIg
ZW1iZWRkZWQ7CiAJZG91YmxlIHBpeGVsX3JhdGVfbWh6OwogCXVuc2lnbmVkIGNoYXIgc3luY2hy
b25pemVkX3ZibGFua19hbGxfcGxhbmVzOwogCXVuc2lnbmVkIGNoYXIgb3RnX2luc3Q7CmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2Rpc3BsYXlfbW9kZV92
YmEuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwvZGlzcGxheV9tb2RlX3Zi
YS5jCmluZGV4IDAzODcwMWQ3MzgzZC4uN2Y5YTU2MjE5MjJmIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2Rpc3BsYXlfbW9kZV92YmEuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2Rpc3BsYXlfbW9kZV92YmEuYwpAQCAtMzc1
LDYgKzM3NSw3IEBAIHN0YXRpYyB2b2lkIGZldGNoX3BpcGVfcGFyYW1zKHN0cnVjdCBkaXNwbGF5
X21vZGVfbGliICptb2RlX2xpYikKIAogCQltb2RlX2xpYi0+dmJhLnBpcGVfcGxhbmVbal0gPSBt
b2RlX2xpYi0+dmJhLk51bWJlck9mQWN0aXZlUGxhbmVzOwogCisJCW1vZGVfbGliLT52YmEuRW1i
ZWRkZWRQYW5lbFttb2RlX2xpYi0+dmJhLk51bWJlck9mQWN0aXZlUGxhbmVzXSA9IGRzdC0+ZW1i
ZWRkZWQ7CiAJCW1vZGVfbGliLT52YmEuRFBQUGVyUGxhbmVbbW9kZV9saWItPnZiYS5OdW1iZXJP
ZkFjdGl2ZVBsYW5lc10gPSAxOwogCQltb2RlX2xpYi0+dmJhLlNvdXJjZVNjYW5bbW9kZV9saWIt
PnZiYS5OdW1iZXJPZkFjdGl2ZVBsYW5lc10gPQogCQkJCShlbnVtIHNjYW5fZGlyZWN0aW9uX2Ns
YXNzKSAoc3JjLT5zb3VyY2Vfc2Nhbik7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZG1sL2Rpc3BsYXlfbW9kZV92YmEuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kbWwvZGlzcGxheV9tb2RlX3ZiYS5oCmluZGV4IDkxZGVjYWM1MDU1Ny4uMTU0
MGZmYmUzOTc5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1s
L2Rpc3BsYXlfbW9kZV92YmEuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZG1sL2Rpc3BsYXlfbW9kZV92YmEuaApAQCAtMzg3LDYgKzM4Nyw3IEBAIHN0cnVjdCB2YmFfdmFy
c19zdCB7CiAKIAkvKiB2YmEgbW9kZSBzdXBwb3J0ICovCiAJLyppbnB1dHMqLworCWJvb2wgRW1i
ZWRkZWRQYW5lbFtEQ19fTlVNX0RQUF9fTUFYXTsKIAlib29sIFN1cHBvcnRHRlg3Q29tcGF0aWJs
ZVRpbGluZ0luMzJicHBBbmQ2NGJwcDsKIAlkb3VibGUgTWF4SFNDTFJhdGlvOwogCWRvdWJsZSBN
YXhWU0NMUmF0aW87Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
