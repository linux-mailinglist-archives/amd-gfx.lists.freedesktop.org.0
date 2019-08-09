Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 789B6884DB
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 23:38:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A1F6EEA7;
	Fri,  9 Aug 2019 21:38:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740044.outbound.protection.outlook.com [40.107.74.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FBA46EEA4
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 21:38:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JrfT9jMwTwmTpIArHxpths4IcbiZPlLhid/4FY/lPyfYbGhMFARQusgc27WU/1gAidt3BLwjLR1xz17ygG361KJjojo5W9lMH3m6W3z5KuTt6vkUX95OX0IfickPFdgZsseUP9WrvmLASs7VL2QgstpduGpH/yGmKA1arMfP6+tpHoTNMqpNpQZ/vVcAqXXlu+P7CvqoaSHFdYyuM4tIxvI+/A9olDSYFY33S6aPjyTX5w76A9N4rOtFg0OfGUcs7doPaogyfji/XcyQe/pbSNS1lpcPTP/mlPLKjJWPWs/smzspTd0iUQwMP3KuNY6r0jSoVyd1eWUB9DdaOqPIRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4diHKS1ffG1ov14LRS+6Mcj0jrXxibk/XVZlEAC24fo=;
 b=nVtg216qft/tGutN82l/IVGCSP4Ae6wkbxFBLxTmfrqKyQqP3Er3tPkZKq5cRMDvD7757OsN5ZSDc2q7A7lIvoh3IvrrDzQKx3Xw6I9UbhUn3X0k1CVW9tLFpEHNu+Tf5O7F1YSJuAOVk+Ai/uJ9b/9RnrBo97YGiKSs5Z+Zcj3vGTqX3RA5+oIqL6Z10brD9cVMqQlOyGb4KkmawLKmQH3I2vX5cfc5xTiH0JC0hwId+Lj7qUSJSRd9cmuc/jtO06i7GmN/tNplkpSeYE+xtWF+b0nBY50dRo2m3oTJzTRdJ/k9l/P2ehyb4r+krfjFT2xYnnxNBka9rhr5E4M4bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CY4PR12CA0047.namprd12.prod.outlook.com (2603:10b6:903:129::33)
 by CY4PR12MB1525.namprd12.prod.outlook.com (2603:10b6:910:11::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.20; Fri, 9 Aug
 2019 21:38:13 +0000
Received: from BY2NAM03FT003.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::203) by CY4PR12CA0047.outlook.office365.com
 (2603:10b6:903:129::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.18 via Frontend
 Transport; Fri, 9 Aug 2019 21:38:13 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT003.mail.protection.outlook.com (10.152.84.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Fri, 9 Aug 2019 21:38:13 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Fri, 9 Aug 2019 16:38:06 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 02/49] drm/amd/display: Add DFS reference clock field
Date: Fri, 9 Aug 2019 17:36:55 -0400
Message-ID: <20190809213742.30301-3-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190809213742.30301-1-sunpeng.li@amd.com>
References: <20190809213742.30301-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(136003)(376002)(39860400002)(2980300002)(428003)(199004)(189003)(51416003)(76176011)(4744005)(478600001)(48376002)(5660300002)(86362001)(476003)(2616005)(4326008)(53936002)(356004)(50226002)(6666004)(11346002)(47776003)(36756003)(70206006)(6916009)(70586007)(2876002)(446003)(126002)(26005)(8936002)(305945005)(186003)(2870700001)(49486002)(2906002)(426003)(336012)(316002)(81166006)(8676002)(1076003)(2351001)(486006)(54906003)(50466002)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1525; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 511abe5f-4e6b-447b-7328-08d71d11e1d0
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1525; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1525:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1525F8E554F581DA037F854082D60@CY4PR12MB1525.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 01244308DF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: xL/JAV/0kdlBy7ciHn3bKF82KW7Ai9OFdUEeiOQkeEzqVslQmJCWP3be6OiPrTq6D13Qw7LtGhc6JTEkcoY2et9ibpOIUY/Hxi/ZoF0Qt1mONGsmWHEIoAgvfTCsDrdzBqbfCgbE9rGUqZkbsY1jppUXRhHyoQNIxPasTCiytz2MvQFdICeAiqgmowZ4r9lzYK2D4t0BVZoNDLl1E2V/c10XYwRxvdmHz2eEvqqwdlA+xdvBtZ2zybLXtEDB0VNF9ki9Jj7cT7MEez7uvPMRS7a9FZmm8ZZSK1OEFOMdiwiWji0itDwyQ+48wCJlLEkzsgUQ/rMZ2VaIl+viDwRDnpNXVyIIOgtxxyrhBqzD94SjDKQDjqbU9JpRwQu8rKYa6xQU0Lxz5eI3CLpTzKUCrfx8t2IzAITbSoyAC1O0sqQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 21:38:13.4787 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 511abe5f-4e6b-447b-7328-08d71d11e1d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1525
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4diHKS1ffG1ov14LRS+6Mcj0jrXxibk/XVZlEAC24fo=;
 b=Bwy8N4Bm6KlMmeJDcsOlKOILHT3lWEN+zOiYAwVD4gQtvGmIp8vz5xZMyP58Wy1sJImbImTaa2N5SF0K1uiJUrjdfFOahgIAIprqGKLhS1ajT49uuhydtT5CdiEpnP2vV8LLHKPp37y+hhuqiTK59Sdutp6vOB/LnLLjNfgI6pk=
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
Cc: Leo Li <sunpeng.li@amd.com>, Yongqiang Sun <yongqiang.sun@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWW9uZ3FpYW5nIFN1biA8eW9uZ3FpYW5nLnN1bkBhbWQuY29tPgoKQWRkIHRvIGNsa19t
Z3JfaW50ZXJuYWwgc3RydWN0LCBmb3IgZnV0dXJlIHVzZS4KClNpZ25lZC1vZmYtYnk6IFlvbmdx
aWFuZyBTdW4gPHlvbmdxaWFuZy5zdW5AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IFlvbmdxaWFuZyBT
dW4gPHlvbmdxaWFuZy5zdW5AYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBh
bWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvY2xrX21n
cl9pbnRlcm5hbC5oIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvY2xrX21ncl9p
bnRlcm5hbC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9ody9jbGtfbWdy
X2ludGVybmFsLmgKaW5kZXggNGI1NTA1ZmE5ODBjLi4yMTMwNDZkZTE2NzUgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvY2xrX21ncl9pbnRlcm5hbC5o
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvY2xrX21ncl9pbnRl
cm5hbC5oCkBAIC0yMTYsNiArMjE2LDggQEAgc3RydWN0IGNsa19tZ3JfaW50ZXJuYWwgewogCWJv
b2wgZGZzX2J5cGFzc19lbmFibGVkOwogCS8qIFRydWUgaWYgdGhlIERGUy1ieXBhc3MgZmVhdHVy
ZSBpcyBlbmFibGVkIGFuZCBhY3RpdmUuICovCiAJYm9vbCBkZnNfYnlwYXNzX2FjdGl2ZTsKKwor
CXVpbnQzMl90IGRmc19yZWZfZnJlcV9raHo7CiAJLyoKIAkgKiBDYWNoZSB0aGUgZGlzcGxheSBj
bG9jayByZXR1cm5lZCBieSBWQklPUyBpZiBERlMtYnlwYXNzIGlzIGVuYWJsZWQuCiAJICogVGhp
cyBpcyBiYXNpY2FsbHkgIkNyeXN0YWwgRnJlcXVlbmN5IEluIEtIeiIgKFhUQUxJTikgZnJlcXVl
bmN5Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
