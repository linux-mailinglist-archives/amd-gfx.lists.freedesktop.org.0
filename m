Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 361A81AA27
	for <lists+amd-gfx@lfdr.de>; Sun, 12 May 2019 05:20:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE60899DB;
	Sun, 12 May 2019 03:20:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680088.outbound.protection.outlook.com [40.107.68.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9B8899DB
 for <amd-gfx@lists.freedesktop.org>; Sun, 12 May 2019 03:20:53 +0000 (UTC)
Received: from CY4PR1201CA0015.namprd12.prod.outlook.com
 (2603:10b6:910:16::25) by BN6PR12MB1267.namprd12.prod.outlook.com
 (2603:10b6:404:17::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1878.22; Sun, 12 May
 2019 03:20:51 +0000
Received: from CO1NAM03FT050.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::205) by CY4PR1201CA0015.outlook.office365.com
 (2603:10b6:910:16::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.20 via Frontend
 Transport; Sun, 12 May 2019 03:20:51 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT050.mail.protection.outlook.com (10.152.81.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Sun, 12 May 2019 03:20:50 +0000
Received: from hawzhang-System-Product-Debug.amd.com (10.34.1.3) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; 
 Sat, 11 May 2019 22:20:49 -0500
From: Hawking Zhang <Hawking.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: fix -Wswitch warning due to missing of default
 case
Date: Sun, 12 May 2019 11:20:35 +0800
Message-ID: <20190512032035.3334-1-Hawking.Zhang@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(376002)(39860400002)(136003)(346002)(2980300002)(428003)(189003)(199004)(186003)(50466002)(86362001)(426003)(1076003)(77096007)(336012)(26005)(16586007)(70206006)(36756003)(47776003)(478600001)(70586007)(48376002)(4744005)(6916009)(5660300002)(6666004)(316002)(356004)(72206003)(81156014)(68736007)(8936002)(305945005)(53936002)(8676002)(81166006)(50226002)(2906002)(4326008)(126002)(476003)(2616005)(486006)(53416004)(7696005)(51416003)(2351001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1267; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 401eabcb-efd9-4461-3ef2-08d6d688d5c3
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BN6PR12MB1267; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1267:
X-Microsoft-Antispam-PRVS: <BN6PR12MB126725141224E7F68FF30AF5FC0E0@BN6PR12MB1267.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:233;
X-Forefront-PRVS: 0035B15214
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: rlJhPZXdlbd+snoUuaHHc/QM2w/wJ7Y1NeRGfat14k/GngJby8amGubas4ero46W65wrbQlq+V7/bsFB7jtJzTFo1xiSAgkVtWLyGLW2SEEZmbkns039L09GAXkfmkK8wM5jzza2jEqxS0CeXRrRnWmU+e8e4WIBUlzsJtKo9SVYz/292YVvFaLrHmOR/uKw8XCrBNH8UumkuhYpUWLdibmfzpNz+e0KKCpbkiyG71//b9P9jUA3RtAfxPRstHpSUheuzrY6ELg/XPtpDGw6kIry6czHuScP7bcg4WDs9HblWiw8gXwUtDYjMtmHrF1DKx2Oe/3GhrDjN3G0H4raWpuW+sat0eIsK+YBI/cuUUIr26yN3bqVj5JCGIaEGycfn4bOnSeHwycesKyF+q//zRpSL6saAwj1GWnndGmMEXc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2019 03:20:50.7811 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 401eabcb-efd9-4461-3ef2-08d6d688d5c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1267
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yYQ7yYRQLqhDJx/0j1eurA6ZH/Y/85VCU1mPUiedpHg=;
 b=cmchGZnJ8Vksi7gkb91ZWbJeFQKWqaYgxSJHzClIO7JzKknbW0dIcPDNijj5+TMkWg1f0leyptZEK7TVZqU61/e724Vk6qK73ZSvlMYvKDlccxZWP/3bKR9oG2wS64C+ritHQnID/LraChFlq6ZZGTzNc+rwYCmFdrqBB67KLz4=
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

Q2hhbmdlLUlkOiBJNDBlZDQ0NmI4Zjc0MzFlZmQ3M2VmMDk5MzhlYzVlMmI1YWIwOWYwNApTaWdu
ZWQtb2ZmLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjNfNi5jIHwgNiArKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9kZl92M182LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmMKaW5k
ZXggZDJhY2ZjY2U3MTUwLi4yMDFjMDA0MTE3MjAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2RmX3YzXzYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9k
Zl92M182LmMKQEAgLTQ3Niw2ICs0NzYsOCBAQCBzdGF0aWMgaW50IGRmX3YzXzZfcG1jX3N0YXJ0
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1aW50NjRfdCBjb25maWcsCiAKIAkJcmV0ID0g
MDsKIAorCQlicmVhazsKKwlkZWZhdWx0OgogCQlicmVhazsKIAl9CiAKQEAgLTUwNCw2ICs1MDYs
OCBAQCBzdGF0aWMgaW50IGRmX3YzXzZfcG1jX3N0b3Aoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYsIHVpbnQ2NF90IGNvbmZpZywKIAkJCXJldCA9IDA7CiAKIAkJCWJyZWFrOworCWRlZmF1bHQ6
CisJCWJyZWFrOwogCX0KIAogCXJldHVybiByZXQ7CkBAIC01MjcsNiArNTMxLDggQEAgc3RhdGlj
IHZvaWQgZGZfdjNfNl9wbWNfZ2V0X2NvdW50KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAog
CQkJZGZfdjNfNl9nZXRfeGdtaV9saW5rX2NudHIoYWRldiwgeGdtaV90eF9saW5rLCBjb3VudCk7
CiAJCX0KIAorCQlicmVhazsKKwlkZWZhdWx0OgogCQlicmVhazsKIAl9CiAKLS0gCjIuMTcuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
