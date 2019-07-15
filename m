Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2167069DD0
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7EDA89CDB;
	Mon, 15 Jul 2019 21:21:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770071.outbound.protection.outlook.com [40.107.77.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 554AE89CDB
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cf/X4jSC04xmWZih6ghLVNl4nLVrPA26IaxFsp8ENbXEeX7rAIAqyX33oDw7+8LcCs/HX02wx/jHVAXf3tOPCg1EQzg9l5xOhnDgk5qpIv9CIxOuVWZeXT9Fg6//bA3WlQmOxarU5t+TjKrw9n9Wbi98lpAcE7dykR2lQT7QPSlKP1981a0XrZWQ5yWSjjJLvuTI5l/5pGcbkhNNl8S/CVlhR4v7I+1ewLO0L8231RJzG4Au9PlmuOfKnB8ehr84JOi7z77KXNXoK6G+0MAR8SiFb9VBpy5aD3/mPnniuZWIOOdSigsjJveBQxdmZnFE+C5SZyPjN1HnXq06H6iXGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6tIzlMHZ+bQTA4H8uL3CvmgtiQmnq3VkUHOMyenr8I=;
 b=JVaGTSHCw8Yim/MHPW/KBC1jC/uK47dtflkwHL9gs/7fmrO3LlW8BfsiSoC1geJjrOGencWATPZFMK7QptpLJLb1JWdZXEw32Faexkfz5V9hKkeQdlA0zt9i6dFg8032c393DIHXoElDYmt55vsd335wWxb9go6eTFQLPbKACY4eI/+4YEN/s26UhYNKGXEDOhbjl5vaSMHeolC6/z/MiHilmexgdoV/kf7GIypik+FcNn92ilUva4El+sMN7m4FYyjEUAI1WUSbkbKUbzdgCzL8GhXlFxbdOdd4LMmMrEAIyfWaSPCF9MfeHLQudmE48jUkj70P5I024RcxVwFQtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MN2PR12CA0007.namprd12.prod.outlook.com (2603:10b6:208:a8::20)
 by BYAPR12MB3096.namprd12.prod.outlook.com (2603:10b6:a03:dc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.10; Mon, 15 Jul
 2019 21:21:53 +0000
Received: from CO1NAM03FT049.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by MN2PR12CA0007.outlook.office365.com
 (2603:10b6:208:a8::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.14 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:53 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT049.mail.protection.outlook.com (10.152.81.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:52 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:34 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 62/87] drm/amd/display: allocate 4 ddc engines for RV2
Date: Mon, 15 Jul 2019 17:20:24 -0400
Message-ID: <20190715212049.4584-63-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(346002)(136003)(2980300002)(428003)(189003)(199004)(76176011)(316002)(4326008)(48376002)(50466002)(51416003)(486006)(1076003)(8676002)(36756003)(4744005)(2870700001)(26005)(54906003)(6916009)(2906002)(305945005)(2876002)(478600001)(47776003)(81156014)(186003)(53936002)(5660300002)(11346002)(446003)(2351001)(8936002)(81166006)(49486002)(336012)(426003)(2616005)(356004)(50226002)(68736007)(70206006)(70586007)(476003)(86362001)(126002)(6666004)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3096; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 221e3708-703e-4600-bb5e-08d7096a74dc
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BYAPR12MB3096; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB3096:
X-Microsoft-Antispam-PRVS: <BYAPR12MB30965C6A3E981A8B4ACA0F2482CF0@BYAPR12MB3096.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 4TQs34ClBpbPrBEssynqR8ZQCTs1/FK55vAbvb+YLwGxaxlt+jFaCzDiNnx41fGDNyf4Z6lmuyW7bdQaJo7bjRJfoJJr4xcjBwtdE1vw/7l9ZKfcJIpiqwhS4bQ8lv+MuhgT3Mj75MIfd08glJLyaXdSeVpa9GFMz7IIFNj8+WOB01flkcXJX9CTvKC651R8IhwJDzYDs4i26CCdSOIyWSQUFwXhMLS/qFjjKZksXUIwnCaswPWLANTcnmI50YhSmlKHMUBbmdsnM8emVfgqH22Ucy/bqIHdrl7xlIo/bO9AE8ANebTxmobda/fNykCQkGDkSMCopVNg/rJV1Sjeb40lIoNpT7HlyW9pAEDKgZP2dEcHdJiJ1Cr3tOMcAaLRxmRK6gI5taTybkgmV2Bj4B4x1cb3NEuZEql21ahHyo8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:52.5959 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 221e3708-703e-4600-bb5e-08d7096a74dc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3096
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6tIzlMHZ+bQTA4H8uL3CvmgtiQmnq3VkUHOMyenr8I=;
 b=NOAvdwPovwtjoZscxFQqJs4mRPPjfHi0jibNESrpDYZzPyjFHEwzDzcMooqtRy6ZTkHZc7oDozURyHEelezNtUFrNvfLWqRTWLzshwQw38jziEdEpgmPE5rK95z85EY7juP0LE3obSnZJ21GTMbw1mEbuchjHzgvrvUn1tjPKAQ=
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
 Derek Lai <Derek.Lai@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRGVyZWsgTGFpIDxEZXJlay5MYWlAYW1kLmNvbT4KCltXaHldCkRyaXZlciB3aWxsIGNy
ZWF0ZSAwLCAxLCBhbmQgMiBkZGMgZW5naW5lcyBmb3IgUlYyLApidXQgc29tZSBwbGF0Zm9ybXMg
dXNlZCAwLCAxLCBhbmQgMy4KCltIb3ddClN0aWxsIGFsbG9jYXRlIDQgZGRjIGVuZ2luZXMgZm9y
IFJWMi4KClNpZ25lZC1vZmYtYnk6IERlcmVrIExhaSA8RGVyZWsuTGFpQGFtZC5jb20+ClJldmll
d2VkLWJ5OiBBcmljIEN5ciA8QXJpYy5DeXJAYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3Vu
cGVuZy5saUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24x
MC9kY24xMF9yZXNvdXJjZS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjbjEwL2RjbjEwX3Jlc291cmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNuMTAvZGNuMTBfcmVzb3VyY2UuYwppbmRleCAyOWZkM2NiOTQyMmIuLjJhMDE2NDVjNGJm
ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEw
X3Jlc291cmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2Rj
bjEwX3Jlc291cmNlLmMKQEAgLTUwNiw3ICs1MDYsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHJl
c291cmNlX2NhcHMgcnYyX3Jlc19jYXAgPSB7CiAJCS5udW1fYXVkaW8gPSAzLAogCQkubnVtX3N0
cmVhbV9lbmNvZGVyID0gMywKIAkJLm51bV9wbGwgPSAzLAotCQkubnVtX2RkYyA9IDMsCisJCS5u
dW1fZGRjID0gNCwKIH07CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGNfcGxhbmVfY2FwIHBsYW5l
X2NhcCA9IHsKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
