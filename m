Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A42B37F09
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 22:55:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 456B289873;
	Thu,  6 Jun 2019 20:55:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730045.outbound.protection.outlook.com [40.107.73.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF998986D
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2019 20:55:18 +0000 (UTC)
Received: from CY4PR12CA0033.namprd12.prod.outlook.com (2603:10b6:903:129::19)
 by CY4PR12MB1272.namprd12.prod.outlook.com (2603:10b6:903:3e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.22; Thu, 6 Jun
 2019 20:55:17 +0000
Received: from DM3NAM03FT053.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::201) by CY4PR12CA0033.outlook.office365.com
 (2603:10b6:903:129::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1965.12 via Frontend
 Transport; Thu, 6 Jun 2019 20:55:17 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT053.mail.protection.outlook.com (10.152.83.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1965.12 via Frontend Transport; Thu, 6 Jun 2019 20:55:16 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 6 Jun 2019
 15:55:05 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 06/24] drm/amd/display: Dont aser if DP_DPHY_INTERNAL_CTRL
Date: Thu, 6 Jun 2019 16:54:43 -0400
Message-ID: <20190606205501.16505-7-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
References: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(376002)(346002)(39860400002)(396003)(2980300002)(428003)(199004)(189003)(68736007)(446003)(486006)(2906002)(72206003)(426003)(316002)(50466002)(186003)(4326008)(51416003)(53416004)(70586007)(1076003)(2616005)(11346002)(126002)(305945005)(16586007)(86362001)(50226002)(53936002)(7696005)(476003)(36756003)(336012)(2351001)(6666004)(81156014)(356004)(81166006)(26005)(48376002)(47776003)(76176011)(77096007)(70206006)(6916009)(4744005)(478600001)(8676002)(8936002)(5660300002)(14444005)(192303002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1272; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b636d214-1d98-4b6d-7520-08d6eac14783
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1272; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1272:
X-Microsoft-Antispam-PRVS: <CY4PR12MB12725B5ED79266B8D25C0FCBF9170@CY4PR12MB1272.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-Forefront-PRVS: 00603B7EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: f+vSw4L7xejSegG7iCx/p0xYwmO02pwJiYovg803hzD1NjgtlLe1+qVnBIfIC4RCBSSegxWdRBoshjmbAjwIQ1plFdkLRs/CpR9Khi3DalfW8knMBXxGILp0UtGw+uu4KsP+F5THVB+CYcEgFID1j8ufK/812IfkxKEKuqjXBvFC3fbJ/nZ4uzD1asClNaCQ/a6jn4cUlLnz5xuomMNuxp7IbyHZoLmJJaRrxQh8TRuroZKxKF+x76rqybDvKm8yUveXBrwL+ZHqNp3eBng/D0aekIhRekVAx5ZG3gnPTXA3DEdH+7bDUYgzBmSMFQDbvSE3g5eqqjnAoPPGTFvEF+5OZAk+RBRUODvChwjIvdjdKPdG9H/e1Kob+R5bsTFiDhSPNt08VoglaIeaX4NNXdp/rfflVKFjClspFlk1BwI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2019 20:55:16.7457 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b636d214-1d98-4b6d-7520-08d6eac14783
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1272
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcLlV8KG0on44+4Atj+IUTwg54vjwSmlemQGz7OuDJc=;
 b=TZ4EJIoMrBLaCof01q5k9MJNzZCXSkUAoirubpbZ4iWe24N1qD8AaPPR5hnVS6jpX/J8CEyMS6e9jtMQbSyYrY7kK0xauCx2W3EPEZuPAfOF2xyvTcjkm/Bi9+96x/vhY4/hlndfm0Xe+Hu1CbU2t0SQbPDlV9EpYUP8zXUZvoo=
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
Cc: Eric Bernstein <eric.bernstein@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXJpYyBCZXJuc3RlaW4gPGVyaWMuYmVybnN0ZWluQGFtZC5jb20+CgpObyBuZWVkIHRv
IGFzc2VydCBqdXN0IHJldHVybgoKU2lnbmVkLW9mZi1ieTogRXJpYyBCZXJuc3RlaW4gPGVyaWMu
YmVybnN0ZWluQGFtZC5jb20+ClJldmlld2VkLWJ5OiBDaGFybGVuZSBMaXUgPENoYXJsZW5lLkxp
dUBhbWQuY29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hh
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEw
X2xpbmtfZW5jb2Rlci5jIHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjbjEwL2RjbjEwX2xpbmtfZW5jb2Rlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjbjEwL2RjbjEwX2xpbmtfZW5jb2Rlci5jCmluZGV4IDMzOTZlNDk5MDkwZC4uOTQy
N2E0NjFiYjI2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MTAvZGNuMTBfbGlua19lbmNvZGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjbjEwL2RjbjEwX2xpbmtfZW5jb2Rlci5jCkBAIC0yMjksNyArMjI5LDkgQEAgc3RhdGlj
IHZvaWQgc2V0dXBfcGFuZWxfbW9kZSgKIHsKIAl1aW50MzJfdCB2YWx1ZTsKIAotCUFTU0VSVChS
RUcoRFBfRFBIWV9JTlRFUk5BTF9DVFJMKSk7CisJaWYgKCFSRUcoRFBfRFBIWV9JTlRFUk5BTF9D
VFJMKSkKKwkJcmV0dXJuOworCiAJdmFsdWUgPSBSRUdfUkVBRChEUF9EUEhZX0lOVEVSTkFMX0NU
UkwpOwogCiAJc3dpdGNoIChwYW5lbF9tb2RlKSB7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
