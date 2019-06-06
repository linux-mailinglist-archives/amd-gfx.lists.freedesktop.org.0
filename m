Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E5A37F0D
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 22:55:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6525A898C6;
	Thu,  6 Jun 2019 20:55:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710071.outbound.protection.outlook.com [40.107.71.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D40898AA
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2019 20:55:23 +0000 (UTC)
Received: from CY4PR12CA0028.namprd12.prod.outlook.com (2603:10b6:903:129::14)
 by CY4PR1201MB0054.namprd12.prod.outlook.com (2603:10b6:910:1a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.22; Thu, 6 Jun
 2019 20:55:22 +0000
Received: from DM3NAM03FT053.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::205) by CY4PR12CA0028.outlook.office365.com
 (2603:10b6:903:129::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1965.12 via Frontend
 Transport; Thu, 6 Jun 2019 20:55:22 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT053.mail.protection.outlook.com (10.152.83.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1965.12 via Frontend Transport; Thu, 6 Jun 2019 20:55:21 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 6 Jun 2019
 15:55:08 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 12/24] drm/amd/display: fix gamma logic breaking driver unload
Date: Thu, 6 Jun 2019 16:54:49 -0400
Message-ID: <20190606205501.16505-13-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
References: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(376002)(136003)(346002)(2980300002)(428003)(189003)(199004)(4326008)(47776003)(53416004)(2351001)(476003)(50226002)(70586007)(70206006)(48376002)(72206003)(6666004)(356004)(5660300002)(53936002)(126002)(426003)(11346002)(446003)(8676002)(186003)(16586007)(2906002)(305945005)(7696005)(76176011)(51416003)(50466002)(68736007)(1076003)(81156014)(316002)(2616005)(36756003)(14444005)(486006)(86362001)(8936002)(478600001)(81166006)(26005)(77096007)(6916009)(336012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0054; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 475558b6-5e78-4b8d-7f0a-08d6eac14a84
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR1201MB0054; 
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0054:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB00547BD5C0F05F26DB5FBAE3F9170@CY4PR1201MB0054.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:390;
X-Forefront-PRVS: 00603B7EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: K7XeLZo8G5hV3MQI3u4sYbYg0tAJlwVmB4Rc1I/WTg364MAPPikVB25utd5i5oUFeABIE2s82VeB72AvfSYEhDaBf5svNvO0w8KZ9I30hMsqwjfu7tyh4Zw/lgWxE8x4JQIyaJGeux2tiquaJx7AfzV6WNNUNMoNxLFunINrK+QjLdsqEm3iDhySzEOYx8PEBFfL2QDZRM2dkM8TbFKq1BYL6AooS4owiLYwbU8jkiWQmkA5t8oKZycOtAc04n5rIvjqlAx8HUEbkTF5Wv0wqScpkdk2lTkvdshDPIsWfQNmL9+fariqYK3hw+Ynkqg1arsgsPr9sYzK5Be6HPQH2z0uwLm1er7F/watwD45iXgsy1CBnMSs6KVxFxgujwC6A3AxYytO1eMTjpR3A17g/D1HytAk9jXnvSYHHybpDAo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2019 20:55:21.7827 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 475558b6-5e78-4b8d-7f0a-08d6eac14a84
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0054
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pwO5NEKubxUgaqleSxTfFEHLBmNNnshtX+w275e8XE=;
 b=MfDBU0XQoFkgCYNj6eJ/BpMWWfzPn5YyVUBMdvXvjKtWfbHl9WXpIvqQlIxgZXtAK+5XvGo3fgju/bkGr1zbAu+vC5xHPl5jiTOuLMcBgwiy1RL4OW33P08Ugqw17Ps99fVhTUO1mXb/8xQzmzjOJO7Fd1y5w5DF/OsrVzXBm6k=
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
Cc: Krunoslav Kovac <Krunoslav.Kovac@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS3J1bm9zbGF2IEtvdmFjIDxLcnVub3NsYXYuS292YWNAYW1kLmNvbT4KClVzaW5nIHRo
aXMgbG9naWMgYnJlYWtzIGRyaXZlciB1bmxvYWQsIHRoaXMgaXMgYSB0ZW1wb3JhcnkgZml4CmEg
Zm9sbG93dXAgcGF0Y2ggd2lsbCBwcm9wZXJseSBmaXggdGhpcwoKU2lnbmVkLW9mZi1ieTogS3J1
bm9zbGF2IEtvdmFjIDxLcnVub3NsYXYuS292YWNAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFyaWMg
Q3lyIDxBcmljLkN5ckBhbWQuY29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdh
bnByZWV0Lkxha2hhQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21v
ZHVsZXMvY29sb3IvY29sb3JfZ2FtbWEuYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9tb2R1bGVzL2NvbG9yL2NvbG9yX2dhbW1hLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9jb2xvci9jb2xvcl9nYW1tYS5jCmluZGV4IDg5YTY1ZTFk
ODMxNy4uODYwMWQzNzE3NzZlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvbW9kdWxlcy9jb2xvci9jb2xvcl9nYW1tYS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9tb2R1bGVzL2NvbG9yL2NvbG9yX2dhbW1hLmMKQEAgLTE1NjksMTUgKzE1NjksMTMg
QEAgYm9vbCBtb2RfY29sb3JfY2FsY3VsYXRlX3JlZ2FtbWFfcGFyYW1zKHN0cnVjdCBkY190cmFu
c2Zlcl9mdW5jICpvdXRwdXRfdGYsCiAJCQlvdXRwdXRfdGYtPnRmID09IFRSQU5TRkVSX0ZVTkNU
SU9OX1NSR0IpIHsKIAkJaWYgKHJhbXAgPT0gTlVMTCkKIAkJCXJldHVybiB0cnVlOwotCQlpZiAo
KHJhbXAtPmlzX2lkZW50aXR5ICYmIHJhbXAtPnR5cGUgIT0gR0FNTUFfQ1NfVEZNXzFEKSB8fAot
CQkJCSghbWFwVXNlclJhbXAgJiYgcmFtcC0+dHlwZSA9PSBHQU1NQV9SR0JfMjU2KSkKKwkJaWYg
KHJhbXAtPmlzX2lkZW50aXR5IHx8ICghbWFwVXNlclJhbXAgJiYgcmFtcC0+dHlwZSA9PSBHQU1N
QV9SR0JfMjU2KSkKIAkJCXJldHVybiB0cnVlOwogCX0KIAogCW91dHB1dF90Zi0+dHlwZSA9IFRG
X1RZUEVfRElTVFJJQlVURURfUE9JTlRTOwogCi0JaWYgKHJhbXAgJiYgcmFtcC0+dHlwZSAhPSBH
QU1NQV9DU19URk1fMUQgJiYKLQkJCShtYXBVc2VyUmFtcCB8fCByYW1wLT50eXBlICE9IEdBTU1B
X1JHQl8yNTYpKSB7CisJaWYgKHJhbXAgJiYgKG1hcFVzZXJSYW1wIHx8IHJhbXAtPnR5cGUgIT0g
R0FNTUFfUkdCXzI1NikpIHsKIAkJcmdiX3VzZXIgPSBrdmNhbGxvYyhyYW1wLT5udW1fZW50cmll
cyArIF9FWFRSQV9QT0lOVFMsCiAJCQkgICAgc2l6ZW9mKCpyZ2JfdXNlciksCiAJCQkgICAgR0ZQ
X0tFUk5FTCk7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
