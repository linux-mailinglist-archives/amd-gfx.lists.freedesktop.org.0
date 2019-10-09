Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E88D1A92
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 23:06:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454666EA68;
	Wed,  9 Oct 2019 21:06:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800044.outbound.protection.outlook.com [40.107.80.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE866EA60
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2019 21:06:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Be3Eplb27DIGdJ0RTP73dSsUVlMqHa3iIfMEoXmKT3iVwdQTHowGtZ7Vae/JAT+vPBXuAI94CYrRUZUhn+v3SMKedwQh+lSM6XjGubCsafhO6I6ufekqNd7HPnI0wH/MkX1Ft3BdaGgK+fb5Y43zl8sZ1F8l5ZDGBcVKk2Dh+oz6I4H4CdS5vHa0Ykw6U1LiEUccFygEmo9V8ltxbjkqWo1bbiy279vX840rlBVycnWwOe9N7s9UYwO31ZVSul94KU3zq1iUHGUP3HayUPnfIZ55ILFpJSXti+vYovB1aWtp3ahsRb7RLO0HFHiiiEyDI0vpEblifSST7Om8lU2cfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d3KMRzKAgU5CHveR3FX+RI5NHn6QZmTN21sWK9uGN8A=;
 b=Z9egLix7X6Boh/y77qjUSNga3Ka4MwqtBrd4gC6iN285OIGIBFhLeJCcpane9L3QqDRnfs6gRfy2lmyZru53t7kOIJHXF9wY2SiAqq44aKXMqc2rue6GYQFMqV73T9uIOLIFcgyU3T5Xz5RzyQI/8nIOtMabOhQC0aln2RkmLlt3K4dovH+qJTOi7pMYkQZOk43S0+Fn2+hRJsS+SYOA/v80aLXfeSIIL7/fjswjZAgT6tpYr6qDv9z7fpICa/REUegP9LGcmauoOviaxLRIj3+SHjUVauZv5Gs9JVWzfpHk5wfmDEHY8RPE25ZPr+QGaUNiseWiWTuXbwG1LJGFhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0019.namprd12.prod.outlook.com
 (2603:10b6:301:4a::29) by DM5PR12MB2375.namprd12.prod.outlook.com
 (2603:10b6:4:b3::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.17; Wed, 9 Oct
 2019 21:06:29 +0000
Received: from DM3NAM03FT052.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by MWHPR1201CA0019.outlook.office365.com
 (2603:10b6:301:4a::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Wed, 9 Oct 2019 21:06:29 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT052.mail.protection.outlook.com (10.152.83.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 9 Oct 2019 21:06:29 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 9 Oct 2019
 16:06:29 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 21/26] drm/amd/display: handle "18" case in TruncToValidBPP
Date: Wed, 9 Oct 2019 17:06:08 -0400
Message-ID: <20191009210613.17929-22-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
References: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(6029001)(4636009)(396003)(136003)(39860400002)(376002)(346002)(428003)(199004)(189003)(70206006)(54906003)(5660300002)(50466002)(50226002)(305945005)(48376002)(4744005)(86362001)(70586007)(336012)(1076003)(478600001)(8936002)(426003)(76176011)(11346002)(6666004)(36756003)(81156014)(446003)(356004)(81166006)(4326008)(7696005)(186003)(51416003)(2616005)(2351001)(16586007)(316002)(2906002)(8676002)(26005)(53416004)(47776003)(476003)(6916009)(486006)(126002)(145603002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2375; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e372ff0-731e-481f-2651-08d74cfc8de1
X-MS-TrafficTypeDiagnostic: DM5PR12MB2375:
X-Microsoft-Antispam-PRVS: <DM5PR12MB23751A9B4359800D9704E0B2F9950@DM5PR12MB2375.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-Forefront-PRVS: 018577E36E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tcYib0Ob6gpMB8NGpcof4zz0jdt0Yp5Cp8VNXUmyY/p5LFAspKS+zSSM0eMcgjHYF3aFZ/yi8t94pCyaSudLZFl4Fq+W8Gev8IK0OOJ14WwbKA+Wzh7xNKEWhGRe3wd+vOT+rX4AzosKYru+x12ODup9FEP83B88TnwdjK2TUb2yLVik48TVMhm8zoTaQOk2V3Tp8lwE7NaLUDiC12pJMjOZPQ57Yp2aAov/SJ8pLX70Ei11OBYwbJfHlOd3MFPMJyNEomgf7dOcwPFIQlPl5E0He7wOmrm/l5Rz/nhwVtsHErZTzjO0MOgJWLkNBr7+D2Lj/la5AoXUP9YWcv7Ka5OrrzCWV/9sgzTpvM/i2hW+yqGVfbAENwGY4qBllclkx4At6HJE93JvvNNQxabgKIEdEfggmkfLyWUimRLG3uI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 21:06:29.1015 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e372ff0-731e-481f-2651-08d74cfc8de1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2375
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d3KMRzKAgU5CHveR3FX+RI5NHn6QZmTN21sWK9uGN8A=;
 b=gYnNnZFb7oMXfpJCr3UNcZiBLV2zsYSo4B14XwuBdhVt4uGlYv9UtcLed4YU1zclUl2iq2+eEvuK7fUF300viwos/0p5BFJTuNFytvfqROHl7JyrjoCvRTcbRlVnX7wGqbCFpILa7oEgmP/uV7s0iRfq2ku53UN4ntjmYvKCNLc=
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
Cc: sunpeng.li@amd.com, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 harry.wentland@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGFuZGxlIDE4IERlY2ltYWxCUFAgbGlrZSBvdGhlciBjYXNlcwoKU2lnbmVkLW9mZi1ieTogQmhh
d2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3
YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2RjbjIxL2Rpc3BsYXlfbW9kZV92YmFfMjEuYyB8IDIg
KysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2RjbjIxL2Rpc3BsYXlfbW9kZV92YmFfMjEuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwvZGNuMjEvZGlzcGxheV9tb2RlX3Zi
YV8yMS5jCmluZGV4IGZkNzA3ZTc0NTliNS4uYmE3Nzk1N2FlZmUzIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2RjbjIxL2Rpc3BsYXlfbW9kZV92YmFfMjEu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2RjbjIxL2Rpc3BsYXlf
bW9kZV92YmFfMjEuYwpAQCAtMzM4MCw2ICszMzgwLDggQEAgc3RhdGljIHVuc2lnbmVkIGludCBU
cnVuY1RvVmFsaWRCUFAoCiAJCQkJcmV0dXJuIDMwOwogCQkJZWxzZSBpZiAoRGVjaW1hbEJQUCA+
PSAyNCAmJiAoRGVzaXJlZEJQUCA9PSAwIHx8IERlc2lyZWRCUFAgPT0gMjQpKQogCQkJCXJldHVy
biAyNDsKKwkJCWVsc2UgaWYgKERlY2ltYWxCUFAgPj0gMTggJiYgKERlc2lyZWRCUFAgPT0gMCB8
fCBEZXNpcmVkQlBQID09IDE4KSkKKwkJCQlyZXR1cm4gMTg7CiAJCQllbHNlCiAJCQkJcmV0dXJu
IEJQUF9JTlZBTElEOwogCQl9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
