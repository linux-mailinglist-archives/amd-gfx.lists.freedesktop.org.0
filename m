Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DFA50A47
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 13:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51EC289364;
	Mon, 24 Jun 2019 11:58:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780085.outbound.protection.outlook.com [40.107.78.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78EE289364
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 11:58:28 +0000 (UTC)
Received: from MN2PR12CA0011.namprd12.prod.outlook.com (2603:10b6:208:a8::24)
 by CY4PR12MB1269.namprd12.prod.outlook.com (2603:10b6:903:40::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2008.16; Mon, 24 Jun
 2019 11:58:26 +0000
Received: from DM3NAM03FT053.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::202) by MN2PR12CA0011.outlook.office365.com
 (2603:10b6:208:a8::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2008.16 via Frontend
 Transport; Mon, 24 Jun 2019 11:58:26 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT053.mail.protection.outlook.com (10.152.83.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2008.13 via Frontend Transport; Mon, 24 Jun 2019 11:58:25 +0000
Received: from hawzhang-All-Series.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 24 Jun 2019 06:58:24 -0500
From: Hawking Zhang <Hawking.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, 
 Tianci Yin <tianci.yin@amd.com>
Subject: [PATCH] drm/amdgpu: fix modprobe failure for uvd_4/5/6
Date: Mon, 24 Jun 2019 19:58:17 +0800
Message-ID: <1561377497-2257-1-git-send-email-Hawking.Zhang@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(136003)(39860400002)(376002)(346002)(2980300002)(428003)(199004)(189003)(26005)(47776003)(5660300002)(316002)(50466002)(16586007)(68736007)(53936002)(356004)(6666004)(36756003)(336012)(86362001)(186003)(53416004)(8936002)(2906002)(478600001)(14444005)(7696005)(50226002)(426003)(51416003)(110136005)(72206003)(4326008)(6636002)(486006)(77096007)(48376002)(8676002)(70206006)(70586007)(2616005)(126002)(476003)(81166006)(81156014)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1269; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d20105c-730f-42a5-5434-08d6f89b43c5
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1269; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1269:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1269EE56F753E6A98BC8246AFCE00@CY4PR12MB1269.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 007814487B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: xG3Iw2mnPSlE9kW4FEZl7EwS3woJRhJTp8V+Wm6/nnpBE2eJbjGAhNqakWKDLVObk3/ZsTgEr09ItJWtTbqN9Bu1mFKmCJOfsH+uis9Pmp1nc7bH2KUF32yj0cTIV1qybvzZ1Dj9l0y+tBP/6OR0BY2NngAVFaEer7F++GdomdoMaS/vRLy/He8Y5rg9ZUPZs3Ju+TIBps9pfcZAg2c4ja1b8W7n3NFcaSQt3buyFo6uOAendXLwzBMtaVofFyatZf0anADYkcIR4Wrd99IDaaoB/ys4Z/Zig/UAniUGOExVlUk92gA5WQ0duUYIknJHo3qDEISuM/EYtzOxUhds4Oz8AtO3/LevCj0glXN8c44doCS7JlBT4fOct94RAsUeLuVoE2N8/XIyNq4y2z65kJaqXUQt92BVRjra64w7Uf4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2019 11:58:25.9168 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d20105c-730f-42a5-5434-08d6f89b43c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1269
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IP/5ojRpuGV5NmtOm4Tk3KV1xa0Qtm+E73QjtaHW/Rs=;
 b=mrJV+Z/hhqv1nelrOrWfiio0iPILag96njDxJC1STCQDn7EvbPwVXvpwdwD414FMe7/Q/w7Q7Ly3IyPwR8vc/NZEB0HIzVDgj8WcGCEst/ZQ/EBdzWoW3fywftUjApcn3fOfZsy1zSsOH9Hzn6fZkgubqNNU3VCdLkq1hJVgWys=
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

Rm9yIHV2ZF80LzUvNiwgYW1kZ3B1IGRyaXZlciB3aWxsIG9ubHkgcG93ZXIgb24gdGhlbSB3aGVu
CnRoZXJlIGFyZSBqb2JzIGFzc2lnbmVkIHRvIGRlY29kZS9lbmMgcmluZ3MudXZkXzQvNS82IGRw
bSB3YXMgYnJva2VuCnNpbmNlIGFtZGdwdV9kcG1fc2V0X3Bvd2VyZ2F0aW5nX2J5X3NtdSBvbmx5
IGNvdmVycyBnZnggYmxvY2suCgpUaGUgY2hhbmdlIHdvdWxkIGFkZCBtb3JlIElQIGJsb2NrIHN1
cHBvcnQgaW4gYW1kZ3B1X2RwbV9zZXRfcG93ZXJnYXRpbmdfYnlfc211CkZvciBHRlgvVVZEL1ZD
Ti9WQ0UsIGlmIHRoZSBuZXcgU01VIGRyaXZlciBpcyBzdXBwb3J0ZWQsIGludm9rZSBuZXcKcG93
ZXIgZ2F0ZSBoZWxwZXIgZnVuY3Rpb24gc211X2RwbV9zZXRfcG93ZXJfZ2F0ZSwgb3RoZXJ3aXNl
LCBmYWxsYmFjayB0bwpsZWdhY3kgcG93ZXJwbGF5IGhlbHBlciBmdW5jdGlvbiBwcF9zZXRfcG93
ZXJnYXRpbmdfYnlfc211LiBGb3Igb3RoZXIgSVAgYmxvY2tzCmFsd2F5cyBpbnZva2UgbGVnYWN5
IHBvd2VycGxheSBoZWxwZXIgZnVuY3Rpb24uCgpTaWduZWQtb2ZmLWJ5OiBIYXdraW5nIFpoYW5n
IDxIYXdraW5nLlpoYW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2RwbS5jICAgIHwgMTEgKysrKysrKysrKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L2FtZGdwdV9zbXUuYyB8ICAzICsrKwogMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2RwbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rw
bS5jCmluZGV4IGY1NGExZWYuLjM1N2U0NWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kcG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZHBtLmMKQEAgLTk0OCwxMiArOTQ4LDIxIEBAIGludCBhbWRncHVfZHBtX3NldF9wb3dl
cmdhdGluZ19ieV9zbXUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90IGJsb2Nr
CiAKIAlzd2l0Y2ggKGJsb2NrX3R5cGUpIHsKIAljYXNlIEFNRF9JUF9CTE9DS19UWVBFX0dGWDoK
KwljYXNlIEFNRF9JUF9CTE9DS19UWVBFX1VWRDoKKwljYXNlIEFNRF9JUF9CTE9DS19UWVBFX1ZD
TjoKKwljYXNlIEFNRF9JUF9CTE9DS19UWVBFX1ZDRToKIAkJaWYgKHN3c211KQotCQkJcmV0ID0g
c211X2dmeF9vZmZfY29udHJvbCgmYWRldi0+c211LCBnYXRlKTsKKwkJCXJldCA9IHNtdV9kcG1f
c2V0X3Bvd2VyX2dhdGUoJmFkZXYtPnNtdSwgYmxvY2tfdHlwZSwgZ2F0ZSk7CiAJCWVsc2UKIAkJ
CXJldCA9ICgoYWRldiktPnBvd2VycGxheS5wcF9mdW5jcy0+c2V0X3Bvd2VyZ2F0aW5nX2J5X3Nt
dSgKIAkJCQkoYWRldiktPnBvd2VycGxheS5wcF9oYW5kbGUsIGJsb2NrX3R5cGUsIGdhdGUpKTsK
IAkJYnJlYWs7CisJY2FzZSBBTURfSVBfQkxPQ0tfVFlQRV9HTUM6CisJY2FzZSBBTURfSVBfQkxP
Q0tfVFlQRV9BQ1A6CisJY2FzZSBBTURfSVBfQkxPQ0tfVFlQRV9TRE1BOgorCQlyZXQgPSAoKGFk
ZXYpLT5wb3dlcnBsYXkucHBfZnVuY3MtPnNldF9wb3dlcmdhdGluZ19ieV9zbXUoCisJCQkJKGFk
ZXYpLT5wb3dlcnBsYXkucHBfaGFuZGxlLCBibG9ja190eXBlLCBnYXRlKSk7CisJCWJyZWFrOwog
CWRlZmF1bHQ6CiAJCWJyZWFrOwogCX0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2FtZGdwdV9zbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2Ft
ZGdwdV9zbXUuYwppbmRleCBlZGQxZGE2Li5mNjFlY2JmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCkBAIC0yMzMsNiArMjMzLDkgQEAgaW50IHNtdV9kcG1f
c2V0X3Bvd2VyX2dhdGUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIHVpbnQzMl90IGJsb2NrX3R5
cGUsCiAJY2FzZSBBTURfSVBfQkxPQ0tfVFlQRV9WQ0U6CiAJCXJldCA9IHNtdV9kcG1fc2V0X3Zj
ZV9lbmFibGUoc211LCBnYXRlKTsKIAkJYnJlYWs7CisJY2FzZSBBTURfSVBfQkxPQ0tfVFlQRV9H
Rlg6CisJCXJldCA9IHNtdV9nZnhfb2ZmX2NvbnRyb2woc211LCBnYXRlKTsKKwkJYnJlYWs7CiAJ
ZGVmYXVsdDoKIAkJYnJlYWs7CiAJfQotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
