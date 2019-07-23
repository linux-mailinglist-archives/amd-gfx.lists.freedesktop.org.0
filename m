Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 777BD71C68
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 18:04:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA9DF89DA9;
	Tue, 23 Jul 2019 16:04:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790075.outbound.protection.outlook.com [40.107.79.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C5F89DA9
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 16:04:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+8lWiM9dklmfMDkx+QdEhPBSeNwih1EzIUTO2vrYk2X3wvjFIeKtN62VepCdyRE0gWWwwjxvQf+A9w+MTkYZCep14q6kMw1InZVpuWpeahkIivBgLT9f8L3Op/yySuS2fcPAVjhgH5jJXiNLh04/DJpN8ffx1NuX5+6CC888pnl5O+UAODzUKNUBId4kuL4u2xvlDGIrGSA9NMOy3Tw2WWZYzhiIYxKkfJY6qC+QTVWATsNnq14pXlG0PEW/gjtpxjlqs7pziJ+F/NmTOuKw08CwMSuGb17Zg/5UpyCpPrFcaUbCjjZQb7XhtePisPloKK2SlUI88gxIqLAbBh7Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9yjBK6XjOPzBRLoflcTHeSt5XcnaM8A2+KficJ15Dk=;
 b=i2P4hz1Nrr062z4STlzzRxCGC34JeycCZ4+vp8HXPF5p7uMTkTv4phTte6jQpROyMQUbMboFq5Iq5q5yClKAsX+Km4Pd9IidDUIUFYQdv24FNekdVpiYgzxNeAGs3aQjtf+yJndTvrVP8eGjw5bbXCsxdx6qvFT9RCj0OnboS3wF5UI10t1urjKJc+myhDsl2klkLHd7KH/Ol3lvTsJ4MoOM6L4MO1K9gJ7c6F5tMmhncTjHFb88yhYbp8GSazQq6KCZ6UigeMr1RwX6TRDMRSQHh1AmJHsbFiRcEYg5pO1qMAbAfIt68Z3GXnvcIJo1zKJrwSQ3BNnEHvS/X7byHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CH2PR12CA0019.namprd12.prod.outlook.com (2603:10b6:610:57::29)
 by DM5PR1201MB2490.namprd12.prod.outlook.com (2603:10b6:3:e3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16; Tue, 23 Jul
 2019 16:04:24 +0000
Received: from DM3NAM03FT032.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::207) by CH2PR12CA0019.outlook.office365.com
 (2603:10b6:610:57::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2094.16 via Frontend
 Transport; Tue, 23 Jul 2019 16:04:23 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT032.mail.protection.outlook.com (10.152.82.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 23 Jul 2019 16:04:23 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; 
 Tue, 23 Jul 2019 11:04:23 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 0/3] Enable Scatter Gather for Picasso.
Date: Tue, 23 Jul 2019 12:04:08 -0400
Message-ID: <1563897851-11501-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(346002)(39860400002)(2980300002)(428003)(189003)(199004)(2351001)(8676002)(36756003)(6666004)(53416004)(50226002)(81156014)(53936002)(8936002)(486006)(4744005)(4326008)(305945005)(356004)(81166006)(44832011)(48376002)(50466002)(68736007)(316002)(70586007)(5660300002)(70206006)(54906003)(7696005)(47776003)(478600001)(426003)(336012)(476003)(2616005)(126002)(51416003)(186003)(2906002)(26005)(16586007)(86362001)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB2490; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c09ebe1-0da8-4178-ca6a-08d70f876e07
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR1201MB2490; 
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2490:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB249051C4B71D1C9BB7D4149FEAC70@DM5PR1201MB2490.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 0107098B6C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: cs9kzjEwSrmeizCo8dFayAuug2gS4rlpOj3ey4mHE4rNAIKUciY+7hV+6kJj2CBPi/ZuvGFGaA5lo5/A5HQp8uBxIW/HZ0q4wCyK8fjOpGgHwx2EUilAErHwtEjzx5Xsq0BgaPZiUM/j02Ct4BoUFO3BcLsRcEnYSWRVix+6cqqthIGoS6DIyx8wSXavHLSdlc/ZKuEqOSJJEQtzbCJR8RmRdfsS7lIUxsZYNC3iwdjrVjL4xiL9clHnXu0A2DnG1Y3IY2zexPc8DmBRP/DjON8+bvAlW5uuTZRo24ZLkOHGrel13e5IwTmWwg3BrKGGB0kmqTiQXbhFvCdwQoRvOvpmEA6JNNEiDK3zlwkdNRFUcTl5Ml6KtdSkWTS/2YUis1hUCmFTFgPZu1PIyOadk5YhNSXFaiMGbjdLxpgamcI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2019 16:04:23.5579 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c09ebe1-0da8-4178-ca6a-08d70f876e07
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2490
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9yjBK6XjOPzBRLoflcTHeSt5XcnaM8A2+KficJ15Dk=;
 b=XQGw6tO2LJSBn52ELuDITs8qK7H3IL3DXP4X3oy3PxgQSB01mIGQHF7kD2s31bsR8y7eekzvxtRlpGLEDwxEvUb6WKqz51Cnp9waPpZ7iIkTR4c79ydscRBovimgxBOio2SnqYSYRHoWjmsqyXEAiaBD/aFDr3K/HCWYbbEgXWc=
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
Cc: Alexander.Deucher@amd.com, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 hersenxs.wu@amd.com, Christian.Koenig@amd.com, shirish.s@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBzZXJpZXMgZW5hYmxlcyBTL0cgZm9yIFBpY2Fzc28uCkZpcnN0IDIgcGF0Y2hlcyBmaXgg
YSBoYXJkIGhhbmcgaW50cm9kdWNlZCBieSBwbGFjaW5nIHRoZSBkaXNwbGF5CkJPIGluIEdUVCBt
ZW1vcnkgYmVjYXVzZSBvZiBIVyBpc3N1ZXMgd2l0aCBjYWNoZWQgbWFwcGluZ3MKYW5kIHRoZSB0
aGlyZCBwYXRjaCBlbmFibGVzIFMvRy4KCkFuZHJleSBHcm9kem92c2t5ICgyKToKICBkcm0vYW1k
Z3B1OiBGaXggaGFyZCBoYW5nIGZvciBTL0cgZGlzcGxheSBCT3MuCiAgZHJtL2FtZC9kaXNwbGF5
OiBPbmx5IGFsbG93IHMvZyB3aGVuIFVTV0MgZmxhZyBpcyBzZXQuCgpTaGlyaXNoIFMgKDEpOgog
IGRybS9hbWQ6IGVuYWJsZSBTL0cgZm9yIFJBVkVOIGNoaXAKCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZGlzcGxheS5jICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9mYi5jICAgICAgICAgICAgfCAxNCArKysrKysrKysrKy0tLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jICAgICAgICAgICB8ICA0ICsrKy0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCAgNCAr
Ky0tCiA0IGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgot
LSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
