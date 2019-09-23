Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC24BBB542
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 15:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834726E904;
	Mon, 23 Sep 2019 13:30:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770082.outbound.protection.outlook.com [40.107.77.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 451D16E904
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 13:30:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NDYtDmJNZIE1SyEBjKtXx9PwyPhBGGrkVT9wMDKF9xNmv8S0TCP6ZEWB7IIWKBF5NaGfJdBkCGRKWVnt5ZntZ3GwqT4OfYDJqEVV307nl+LYT+9apMMULPTJDPVk5jBsDRFlcuQcfTUj3GzQZ7R4IeqSejQivIfST4fQfxoM/cEkYN9GiMkWwSxRh6xW33+bj0ERxQ3e145OlhNyrHCvQveek36vZNJQHXAnP6t7SIRQK3LAmz42m7S3BJjhNuoHLBkTS/2es2bYluRQt/McKw2iaEmlq3LEZ/jgtuY4Z70khHVm/nUsXlRjNMjX4WrCIfHwLR3IBpJ7CR2QMiquxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9BfAJSEqQU0GwkNB6dGQJJS0lXyB1S5eRo2MfI0eLn0=;
 b=dSUb1o/XbsZB+LTM9bIkX9ymfmVcJ/YGPo3McOdXpPelonNQZ8prwHFVGoSEZ/fAkKxCpQqnWzcVvD1ha1JA/iMUZ+CfWBTLz674zWaY4Kp20b+1OKv+P1x50vGClqmrFoWFAs6Dafs3Eqlb39OmzUMXRxiJfjcS4OMo3YTV90VJ7HL68/zbpYEBUDHdiBN5CyufOcW9/Z7nsh9OTXKIZrcPMKPZ6olvi3NwAj0gVzNz+bdZk3z/uOPwws6jiMI0ORtrEeOwB2cYf15KAPcm8AjT3ZayK6UVRBeReX34VV12hFfearCd7OOuz9fqLg8hfwkeSvkfAEZNbWifHRbdXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0011.namprd12.prod.outlook.com
 (2603:10b6:301:4a::21) by BN6PR12MB1540.namprd12.prod.outlook.com
 (2603:10b6:405:3::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.26; Mon, 23 Sep
 2019 13:30:51 +0000
Received: from BY2NAM03FT023.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::202) by MWHPR1201CA0011.outlook.office365.com
 (2603:10b6:301:4a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2284.18 via Frontend
 Transport; Mon, 23 Sep 2019 13:30:51 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT023.mail.protection.outlook.com (10.152.84.226) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2284.20 via Frontend Transport; Mon, 23 Sep 2019 13:30:50 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 23 Sep 2019 08:30:49 -0500
From: Le Ma <le.ma@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amdgpu: add command id in psp response failure message
Date: Mon, 23 Sep 2019 21:30:42 +0800
Message-ID: <1569245443-27318-1-git-send-email-le.ma@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(39860400002)(376002)(396003)(428003)(199004)(189003)(316002)(2351001)(70206006)(70586007)(16586007)(8936002)(4744005)(305945005)(81166006)(26005)(356004)(8676002)(6666004)(2906002)(51416003)(50226002)(36756003)(186003)(6916009)(2616005)(476003)(50466002)(4326008)(126002)(478600001)(81156014)(86362001)(426003)(5660300002)(486006)(48376002)(44832011)(47776003)(336012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1540; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0296ad69-9eee-4781-5c93-08d7402a4091
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BN6PR12MB1540; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1540:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1540AC0218D10B6F13317529F6850@BN6PR12MB1540.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-Forefront-PRVS: 0169092318
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Gwj3q+whnlmstEZa1G4Aqsi4VJWq7fic8/ckBOPZqFI9CrHSrgHZB16+rWfXblonIxvj3+lvlEvIwAxBqq0HkV1XqfOlr5OtIPWMQhrvTvg9GbCrleFC799IvaOtP+eJCFp5V0whOd7WHzPRbn/NSeRFE0TjxNZB5KKNlKjKGjfBYocJmu7UT2FatDUrounVMRxYfU6+ZX7jOFxInpEZklJbqHMA2PWhZso/9+VitO9IdzNQBlSH4nj53oFHwkymJsfLWGUHfC2aGeFCYko/VX6z7QDFlE2q8PRL7ni6rsUyIEHN3x+w1N8rvIk06sHcSMjTdvqoYTWU2L1n3BD6Fg/aTFC6gyiCMW5rY+fUaO0H+0nPbDsxVr/2yMkhgsBIgJcbNxFmxajfXNRBx1HuFq3zZ2fM+MvkQIzS2Y+jNkE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2019 13:30:50.9474 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0296ad69-9eee-4781-5c93-08d7402a4091
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1540
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9BfAJSEqQU0GwkNB6dGQJJS0lXyB1S5eRo2MfI0eLn0=;
 b=iX5HToatniEsgMH82xDjNr3fLW8x7AhszJvbrHqZl96scHDBuQnUzUipy+WVVN03WjYlhklPSEUrFQ1HeeCyGDSu0KcurxNNCzRMRmerlatr89IjWjUe5fvAhX2oSzhVckJDlNnp2YenzC6FLK29iSmf39DcvlRBXMPoHLJ5jFo=
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
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKQ2hhbmdlLUlkOiBJ
ODg2NDlmYzVkYmM3Mzc2ZjNjOTBlYzIxMTQyMzYyOTRjYTkxODlkZQpTaWduZWQtb2ZmLWJ5OiBI
YXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBMZSBNYSA8
TGUuTWFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNw
LmMgfCA1ICsrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3Au
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYwppbmRleCBmOTBhMGNk
Li5kMzU5ZjFkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
cHNwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jCkBAIC0x
NjgsOCArMTY4LDkgQEAgcHNwX2NtZF9zdWJtaXRfYnVmKHN0cnVjdCBwc3BfY29udGV4dCAqcHNw
LAogCQlpZiAodWNvZGUpCiAJCQlEUk1fV0FSTigiZmFpbGVkIHRvIGxvYWQgdWNvZGUgaWQgKCVk
KSAiLAogCQkJCSAgdWNvZGUtPnVjb2RlX2lkKTsKLQkJRFJNX1dBUk4oInBzcCBjb21tYW5kIGZh
aWxlZCBhbmQgcmVzcG9uc2Ugc3RhdHVzIGlzICgweCVYKVxuIiwKLQkJCSAgcHNwLT5jbWRfYnVm
X21lbS0+cmVzcC5zdGF0dXMgJiBHRlhfQ01EX1NUQVRVU19NQVNLKTsKKwkJRFJNX1dBUk4oInBz
cCBjb21tYW5kICgweCVYKSBmYWlsZWQgYW5kIHJlc3BvbnNlIHN0YXR1cyBpcyAoMHglWClcbiIs
CisJCQkgcHNwLT5jbWRfYnVmX21lbS0+Y21kX2lkLAorCQkJIHBzcC0+Y21kX2J1Zl9tZW0tPnJl
c3Auc3RhdHVzICYgR0ZYX0NNRF9TVEFUVVNfTUFTSyk7CiAJCWlmICghdGltZW91dCkgewogCQkJ
bXV0ZXhfdW5sb2NrKCZwc3AtPm11dGV4KTsKIAkJCXJldHVybiAtRUlOVkFMOwotLSAKMi43LjQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
