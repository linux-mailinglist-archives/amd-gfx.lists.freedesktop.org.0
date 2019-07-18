Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EABD6CAD8
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jul 2019 10:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE6366E34E;
	Thu, 18 Jul 2019 08:20:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810071.outbound.protection.outlook.com [40.107.81.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873346E34E
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jul 2019 08:20:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HP9J7w4ywr2fhFNMAMo+vLovBDRKEqJ1NKvkGk6Ou5L7RTI4oogA/neQmehqewIUxV5mGGHsRNDfc/8StMo4AC7Nw1YbR7ywRa5fx/A1KlIIyatBQCWQ+UVbmBfRoWLDvGq1GN52hItrRriIFwBlNBqAH4z/4TRuDrI2J6ar2C1wVb4qGteECLgrcD1MA/kQwJitkzng7bwhAWwuXgGXX9stWEIkcDaaXcgMAjQXZkwe9QgyW2xWBvJMkT6V9KVFbEvsSdKsfPVD5IHx6QtOpKbRMvsKls1/KhMcrObVJ/ltfI5yi2dlsYOhvlpVqKn7pcMGGJ/IAJcTQbvjVHD12g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9hJqvFsusml3UwAM2tFyHat/LBVKHtZsauY5CfZBk8=;
 b=SASK2nHYf5Te3T440/XBxMQZtPZO7qR3Y7cWkmFcw/MQ1P2/Vmy324owyGsaucfHlVvsFNLqhJSIWwx0+429dk7YvTvd5GQZsDKMDOsvh3E8wPIWGFymYi3hiVrcA7vx3vQEYCp/zBB/KT+1bPAO85AFGxWNmoyqTpCsO094hBHmvP38AdU1G4++Mcse95FXnVw1wSK0oI2kpZaQMI85W6ONqcP2T/qaOQc04DzDTAhriB54EP7mtnW7vr7ClE4/4Vowst57f1fDb/83UsqpzOvyxC13RF4uXAiWET2LDeozHY9KL7n1wfD153FvCduhTNe+vJv5s9tALsajMtR2qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from SN1PR12CA0111.namprd12.prod.outlook.com (2603:10b6:802:21::46)
 by DM6PR12MB3098.namprd12.prod.outlook.com (2603:10b6:5:11b::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.11; Thu, 18 Jul
 2019 08:20:39 +0000
Received: from BY2NAM03FT041.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::201) by SN1PR12CA0111.outlook.office365.com
 (2603:10b6:802:21::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.14 via Frontend
 Transport; Thu, 18 Jul 2019 08:20:38 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT041.mail.protection.outlook.com (10.152.85.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 18 Jul 2019 08:20:38 +0000
Received: from hawzhang-All-Series.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Thu, 18 Jul 2019 03:20:36 -0500
From: Hawking Zhang <Hawking.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/4] drm/amdgpu: only allow error injection to UMC IP block
Date: Thu, 18 Jul 2019 16:20:13 +0800
Message-ID: <1563438014-29690-3-git-send-email-Hawking.Zhang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563438014-29690-1-git-send-email-Hawking.Zhang@amd.com>
References: <1563438014-29690-1-git-send-email-Hawking.Zhang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(136003)(39860400002)(376002)(2980300002)(428003)(189003)(199004)(446003)(11346002)(486006)(426003)(476003)(4326008)(126002)(2616005)(2351001)(53936002)(478600001)(305945005)(16586007)(36756003)(186003)(336012)(2906002)(53416004)(47776003)(316002)(8676002)(81156014)(81166006)(8936002)(51416003)(7696005)(76176011)(50466002)(6916009)(48376002)(26005)(86362001)(6666004)(356004)(5660300002)(50226002)(70586007)(4744005)(68736007)(70206006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3098; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40ec61da-b03b-47c8-8e26-08d70b58d0d6
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:DM6PR12MB3098; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB3098:
X-Microsoft-Antispam-PRVS: <DM6PR12MB30984692151618DC5DA849CEFCC80@DM6PR12MB3098.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:269;
X-Forefront-PRVS: 01026E1310
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: c41GGDhbjuqplCl+nPKV4imQNInNkRCB5IhEA57SpBM6DKKRRBl+oA/UJ7bqN2eZYxblttbzcztfA8U0FtBi2Qax8FFK7wwkOInWDrkw6noTMq3PcFNLG14cfa3c80SoxcpiHsRa4dC8UZEJgG9xhsYaMYlnsNTjKw4JlllkEuM04dAewchvi7bxXJVnbUm+qOLJh8L0IxJ/L+ym0rIZ68ta63VBffemoXGNa8KSl1vdEkwYuVsV1RXsI6AB8LM5aDlGaaGecutIkYE673vGeENNjPovAaj6vBPM2F8vqNcEbThw4qBp8Lhrep3rVXKEw3f/ErwIHHngr230EznTwUFMMOMQK57E19qXBN+8YdFg1uPL8e57zHFmIRbQ6N2vxGW6HhdMJLbSioxnCZg3ox84J4IorTiLRqvBh/k4PQg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2019 08:20:38.2331 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ec61da-b03b-47c8-8e26-08d70b58d0d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3098
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9hJqvFsusml3UwAM2tFyHat/LBVKHtZsauY5CfZBk8=;
 b=BGHwDCZdzFMAQPapPLxtf3dkRKT6XpLpbALV+ONd6ZOtmaueYU2QRGfeooPSdm/+MZhSoVO4EMQgLXc5a9851nl8TcJcCbq3d/V2rkdTdLlAOQ5OIZTxC6CU/gKbWuBPwvdo8PT14gURMu1UfnCOCC9K2z5fGydvdzDSj3PH1Oo=
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

ZXJyb3IgaW5qZWN0aW9uIHRvIG90aGVyIElQIGJsb2NrcyAoZXhjZXB0IFVNQykgd2lsbCBiZSBl
bmFibGVkCnVudGlsIFJBUyBmZWF0dXJlIHN0YWJsaXplIG9uIHRob3NlIElQIGJsb2NrcwoKU2ln
bmVkLW9mZi1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyB8IDYgKysrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3Jhcy5jCmluZGV4IGJkYTkwMjUuLjVlZTczZjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcmFzLmMKQEAgLTYyNyw2ICs2MjcsMTIgQEAgaW50IGFtZGdwdV9yYXNfZXJyb3Jf
aW5qZWN0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCWlmICghb2JqKQogCQlyZXR1cm4g
LUVJTlZBTDsKIAorCWlmIChibG9ja19pbmZvLmJsb2NrX2lkICE9IFRBX1JBU19CTE9DS19fVU1D
KSB7CisJCURSTV9JTkZPKCIlcyBlcnJvciBpbmplY3Rpb24gaXMgbm90IHN1cHBvcnRlZCB5ZXRc
biIsCisJCQkgcmFzX2Jsb2NrX3N0cihpbmZvLT5oZWFkLmJsb2NrKSk7CisJCXJldHVybiAtRUlO
VkFMOworCX0KKwogCXJldCA9IHBzcF9yYXNfdHJpZ2dlcl9lcnJvcigmYWRldi0+cHNwLCAmYmxv
Y2tfaW5mbyk7CiAJaWYgKHJldCkKIAkJRFJNX0VSUk9SKCJSQVMgRVJST1I6IGluamVjdCAlcyBl
cnJvciBmYWlsZWQgcmV0ICVkXG4iLAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
