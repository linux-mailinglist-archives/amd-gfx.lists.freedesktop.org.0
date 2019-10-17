Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B4EDB73D
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 21:15:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B146EABE;
	Thu, 17 Oct 2019 19:15:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800048.outbound.protection.outlook.com [40.107.80.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D5D26EAA5
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 19:15:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/PX3Up/jAom6JoTI/dzfUOFYJaj95pxR1uOgHoiE3ytOws+lu16CX6lPYtkTvj79v7kOczKJ4WkUC+6D/yjI0CQ2Ey3YPqQwTxq9qjZKOnmmccpZhwAecVtF4zQxxFzV28Vkl2fLhINboy+XoRu00+7kiIu1EdseF+agQwb39CLWOUSyYWuusoroEajcF3aKlx7eAKSkd2mLvMAgr/Ki7nHyE/hPSzAv6XgqfLvqFpNB9L+92M8SAI3tmhQbQGBbFoTzauXiuF1WP5dY3lLUHsm8WNPXisoEc9q+wyqjHCPmWajnxVt82gIvhQRM3s0xylv/iDIQPjH86W7TOrxFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCM8qPdIuo8725CpYChYAxBDZz4TDQ46IqWtBmD4Q4s=;
 b=WAKOnJcEjtiWkRNiOmNZ7BXnjhb6xHkcD+9UinQBpQN8zrqKRj7YLYlCr6C+dyltW8X+L5coJStlY69EAjzdI16akjTP/U+AWYjX67xJc7NDqOslN20vgt6323V8kTtIpgtza1YgsU9976xpyhj1WghH9XEJTShSFjf44Koj55W7g71ZoThWzQyre71gkDZ7xrhQ/HToSJIacBk1xq5Gi6z9cUEWsOsdbLKvbClKAK4Gst7BGtM1q7Sq6C3VpC90BBXzW2KqQMDpgj1hgh5de3G0ARmK/Yx/dw4q779mZgJFGWwZUVwdUot3rHyKDlBWrEWY5hhVoomK7DHxfxuzEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN8PR12CA0024.namprd12.prod.outlook.com (2603:10b6:408:60::37)
 by MN2PR12MB3599.namprd12.prod.outlook.com (2603:10b6:208:d2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.19; Thu, 17 Oct
 2019 19:15:48 +0000
Received: from BY2NAM03FT041.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by BN8PR12CA0024.outlook.office365.com
 (2603:10b6:408:60::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.23 via Frontend
 Transport; Thu, 17 Oct 2019 19:15:48 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BY2NAM03FT041.mail.protection.outlook.com (10.152.85.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2367.14 via Frontend Transport; Thu, 17 Oct 2019 19:15:48 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:43 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 17 Oct 2019 14:15:42 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 22/37] drm/amd/display: add flag to allow diag to force
 enumerate edp
Date: Thu, 17 Oct 2019 15:13:14 -0400
Message-ID: <20191017191329.11857-23-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017191329.11857-1-sunpeng.li@amd.com>
References: <20191017191329.11857-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(39860400002)(396003)(428003)(189003)(199004)(356004)(54906003)(26005)(2351001)(76176011)(81166006)(48376002)(2876002)(51416003)(50466002)(305945005)(2906002)(316002)(36756003)(8676002)(8936002)(2870700001)(81156014)(50226002)(186003)(336012)(6916009)(426003)(11346002)(486006)(476003)(47776003)(126002)(446003)(2616005)(4326008)(6666004)(1076003)(5660300002)(14444005)(478600001)(70206006)(70586007)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3599; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 902b5db0-c51d-4366-d824-08d753366afb
X-MS-TrafficTypeDiagnostic: MN2PR12MB3599:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3599F422B7354FC1D9C4CC23826D0@MN2PR12MB3599.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:873;
X-Forefront-PRVS: 01930B2BA8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: twai3ZeiNaVz4+7AC+A0iJKT8a7yjpgDKUQU1LfInzLLNttAc4vpe/D68vthmYUD1qePJf5P8r1G//jBgtNu1iI/dpAZX+baWiC8m68NcrSOrL21lXxe5QXF6R300RXzvlFUyZTTlO90onYS9r1uicWaQxBP7Ruf/FSjH9jgPfbIsGyLOlVY5715Ebfscx4YE8XXlPAQ3R1nLg8f2p4fRp0SE6d/gcEcgJcw27GrSgnsmyJwD6e1+OpFi2CWeN4/Q4b2gMGRfjRlMNldWHTCak+6pdd1cQiBxqXjQUBlXOgXGoNC5wdSMLq0HOjlFWCy0UVgElJehKkYWAVBjjgeNX2iawCyvURDKQPXqJdEFDeQlw3h7Cg7j2/uZtnKhxTy8KL+iPSixgnw2j7ruSp7LKBtqcD06XCiC5ekQsFCio8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 19:15:48.3142 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 902b5db0-c51d-4366-d824-08d753366afb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3599
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCM8qPdIuo8725CpYChYAxBDZz4TDQ46IqWtBmD4Q4s=;
 b=EOcaSAl4YibHT/cQyUhRj5NtFmgbcYxW/VdUUmQhmMPGDqmGVlqoNLZtHDD35/VaDwM7bUPwe2tPm2uW9qrpAidU/FlN/iQVgT+baRhsj954FszF7ixMz+PuCmTm+fOJ8PtpGgyHBKh4Wd+fZ9ACHx7o42DKVbTeRdEs33mLY8c=
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
Cc: Leo Li <sunpeng.li@amd.com>, Aric Cyr <Aric.Cyr@amd.com>,
 Jun Lei <Jun.Lei@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSnVuIExlaSA8SnVuLkxlaUBhbWQuY29tPgoKW3doeV0KU0xUIHRlc3RzIHJlcXVpcmUg
dGhhdCBkaWFnIGNhbiBkcml2ZSBlRFAgZXZlbiBpZiBub3RoaW5nIGlzIGNvbm5lY3RlZCwgdGhp
cyBpcyBub3QKdHlwaWNhbCBwcm9kdWN0aW9uIHVzZSBjYXNlLCBzbyB3ZSBuZWVkIHRvIGFkZCBm
bGFnCgpbaG93XQphZGQgZmxhZywgYW5kIHRoaXMgZmxhZyBzdXBlcmNlZGVzICJzaG91bGQgZGVz
dHJveSIgbG9naWMKClNpZ25lZC1vZmYtYnk6IEp1biBMZWkgPEp1bi5MZWlAYW1kLmNvbT4KUmV2
aWV3ZWQtYnk6IEFyaWMgQ3lyIDxBcmljLkN5ckBhbWQuY29tPgpBY2tlZC1ieTogTGVvIExpIDxz
dW5wZW5nLmxpQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nv
cmUvZGMuYyB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oICAgICAg
fCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMKaW5kZXggNTViODJjYTQ0YzNi
Li41ZTQ4N2JiODI4NjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9jb3JlL2RjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMu
YwpAQCAtMTk0LDcgKzE5NCw3IEBAIHN0YXRpYyBib29sIGNyZWF0ZV9saW5rcygKIAkJCQl9CiAJ
CQl9CiAKLQkJCWlmICghc2hvdWxkX2Rlc3RvcnlfbGluaykgeworCQkJaWYgKGRjLT5jb25maWcu
Zm9yY2VfZW51bV9lZHAgfHwgIXNob3VsZF9kZXN0b3J5X2xpbmspIHsKIAkJCQlkYy0+bGlua3Nb
ZGMtPmxpbmtfY291bnRdID0gbGluazsKIAkJCQlsaW5rLT5kYyA9IGRjOwogCQkJCSsrZGMtPmxp
bmtfY291bnQ7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMu
aCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oCmluZGV4IGE4NmRhZDM4MDhi
Ni4uYjU3OGIyMTQ4ZTQ1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaApAQCAtMjIw
LDYgKzIyMCw3IEBAIHN0cnVjdCBkY19jb25maWcgewogCWJvb2wgYWxsb3dfc2VhbWxlc3NfYm9v
dF9vcHRpbWl6YXRpb247CiAJYm9vbCBwb3dlcl9kb3duX2Rpc3BsYXlfb25fYm9vdDsKIAlib29s
IGVkcF9ub3RfY29ubmVjdGVkOworCWJvb2wgZm9yY2VfZW51bV9lZHA7CiAJYm9vbCBmb3JjZWRf
Y2xvY2tzOwogCWJvb2wgZGlzYWJsZV9leHRlbmRlZF90aW1lb3V0X3N1cHBvcnQ7IC8vIFVzZWQg
dG8gZGlzYWJsZSBleHRlbmRlZCB0aW1lb3V0IGFuZCBsdHRwciBmZWF0dXJlIGFzIHdlbGwKIAli
b29sIG11bHRpX21vbl9wcF9tY2xrX3N3aXRjaDsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
