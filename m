Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D16DEB73DB
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 09:14:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA8F6F4D2;
	Thu, 19 Sep 2019 07:14:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700041.outbound.protection.outlook.com [40.107.70.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF296F4D2
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 07:14:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TkqaUEeQPAhLRJEQ1t9/r36mWvJAeJbA/TlUQYy6r8x/ztwb2qN1PJfo4wJe66WnIFMmLBonyo26ZYBgiEIUk1gy+bSWI3MZtXkQaUzGCE6bT1ktiKA3wt05xI9887ghmbb9stVMsJ+ZtNLzaFuBASAeokx6Qsw0L/gQoWQMGX76g/LgdIgpY2C2SPBqfb7oESJIcmqkxgcw9gQ/EeSXIlY+vdZlpMtEYiibOwssjBgQNAnPnL2Ngh2jROMAHauuX57s1bhKFQ/WGyYJcxCF2M0P9YLWX5kXKhOqzEJvRXLqKqpmOa28fTr+mwzG0F1r7O2LpffBi9CzCNzm+LcRCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rpQehLwFuryh7A9kLfSXuWQEoKwVSriYQ4cGXFYFB0g=;
 b=oB9JbMJblo2tM06wxlMPdw2zJEk0vjQrrh/Wc2lLEU76byRB3W7fK+5N+bRAId0lcNzz2tzQfPCEAQ/wuSFQSzLcquPAMInhQ4UMajYh4cT/oXY/ZrSgJSrZ1QUE5JZJo5dplqHCuMK3qdNldD1TDH1u2fxRjSwPv5xUN4XOszoQaCJHRt2TW9l9L7a2AnGq+ltd1mz2lbv4FGV1H3KEKY7rcm5VAsjOVbFicIzK3U1MOm+x3ev6VFMnJOfi3tRgiGOf8aGwuu6pwfWZuXsYTKoxAs8nR1nybziFKC8Yq+YKTD5qoHBO0sPhwuyu9xfr88cwRzXoTvzyNOVCCoEihA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0054.namprd12.prod.outlook.com (2603:10b6:3:103::16)
 by MWHPR12MB1568.namprd12.prod.outlook.com (2603:10b6:301:e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.21; Thu, 19 Sep
 2019 07:14:41 +0000
Received: from DM3NAM03FT023.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::208) by DM5PR12CA0054.outlook.office365.com
 (2603:10b6:3:103::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20 via Frontend
 Transport; Thu, 19 Sep 2019 07:14:40 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT023.mail.protection.outlook.com (10.152.82.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2284.20 via Frontend Transport; Thu, 19 Sep 2019 07:14:40 +0000
Received: from Build-machine.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Thu, 19 Sep 2019 02:14:39 -0500
From: Jesse Zhang <zhexi.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/amd/powerplay [Vega10]Vega10 BKM0.83 AVFS parameters
 patch for Linux Driver
Date: Thu, 19 Sep 2019 15:14:34 +0800
Message-ID: <1568877274-19001-1-git-send-email-zhexi.zhang@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(39860400002)(376002)(428003)(199004)(189003)(2906002)(47776003)(478600001)(36756003)(50466002)(305945005)(7696005)(51416003)(26005)(2351001)(6916009)(53416004)(186003)(70586007)(316002)(426003)(16586007)(19627235002)(336012)(486006)(2616005)(476003)(70206006)(126002)(4326008)(50226002)(8936002)(86362001)(81156014)(81166006)(5660300002)(48376002)(356004)(6666004)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1568; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bdd1a9b5-cfc7-4f2c-bfb9-08d73cd109d4
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:MWHPR12MB1568; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1568:
X-Microsoft-Antispam-PRVS: <MWHPR12MB15680E07194E418656B311A6EF890@MWHPR12MB1568.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-Forefront-PRVS: 016572D96D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: kHhHUvGH/l1F2k6qJv1Bw+1ssLCiS8nLy42cfr/zv33cBQzzX2JGutIdqT9A/oyScoIK2e6arTR0+ff4wa61GrgErV0lb20zd/9J6CjutFddTmu8U4ySSCKiLcLCGS4nm+EAWVfkfu/bYdhx6Byryao1xrqb5giimLcyAoyMQiPZGYjYEkVF+pNWAe1MDiabTJqgMp3EeznEow2hATtKU01ll9yzOoW4p9voOe75YdcOUJMOZEy1JqEMlpwuDLqIKL6KXYzy8mIhd7K8Ze/1yWyo1RU0TAQbLtk1f3bqcLZBQ4ALa+JYFDCLjgbdHSOx5RcuNbqCZXMgI+JwGr9KQVuH/OmNjOls+VyTjjJERHIr4MSk8htgNwN3IF/b0xki3LKivTX+VsmxLBTlkS9d5v4weJXxcuZmlWOaXSclnSs=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2019 07:14:40.6012 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdd1a9b5-cfc7-4f2c-bfb9-08d73cd109d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1568
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rpQehLwFuryh7A9kLfSXuWQEoKwVSriYQ4cGXFYFB0g=;
 b=B7+jU0Rq2mk9UOPmLBv+NOWdidsJQ2CobjutWtH+7qn4ad1kJ3iXvnGm46EStt17iQj7aytAv38k6yXCLeW9fwIO3ATfLSAQA0zBDVdIR9oakCu6GeH6I9HLy8UN8BasdsqVcIwEppY4r4qYbAzeM0wQDABM7b4PFd1a/SaccE4=
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
Cc: zhexzhan <zhexi.zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogemhleHpoYW4gPHpoZXhpLnpoYW5nQGFtZC5jb20+CgpJc3N1ZTogRFJPT1AgY29lZiBy
ZWFkIGJ5IEhEVCBhcHBlYXIgdG8gYmUgbWlzbWF0Y2ggd2l0aCByZXF1aXJlbWVudCBvZiBCS00w
LjgzCgpSb290IGNhdXNlOiBUaGVzZSB2YWx1ZXMgYXJlIHN1cHBvc2VkIHRvIGJlIG92ZXJ3cml0
dGVuIGJ5IFBQTElCLgpIb3dldmVyLCBkcml2ZXIgbWlzc2VkIGNvZGUgb2YgdGhpcyBwYXJ0LgoK
U29sdXRpb246IEFkZCBvdmVyd3JpdGluZyBwcm9jZXNzIHdoZW4gcmVhZGluZyBwcHRhYmxlIGZy
b20gdkJJT1MKSGFyZGNvZGUgc3BlY2lmaWMgY29lZiB3aXRoIGNvcnJlY3QgdmFsdWVzOgpHYlZk
cm9vcFRhYmxlQ2tzb2ZmQTAgPSAweEZGRkNEMkU3CkdiVmRyb29wVGFibGVDa3NvZmZBMSA9IDB4
MjQ5MDIKR2JWZHJvb3BUYWJsZUNrc29mZkEyID0gMHgyNDlCQQoKQ2hhbmdlLUlkOiBJNmNkZGQ3
ZmMyMmQ1OWM1NTVmNzg0YzEyNTk2YWQzYTQ4YjJjZmZjZApTaWduZWQtb2ZmLWJ5OiB6aGV4emhh
biA8emhleGkuemhhbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9od21nci9wcGF0b21md2N0cmwuYyB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3
bWdyL3BwYXRvbWZ3Y3RybC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3Iv
cHBhdG9tZndjdHJsLmMKaW5kZXggNjE1Y2YyYzAuLmI4MjdjMmMgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3BwYXRvbWZ3Y3RybC5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3BwYXRvbWZ3Y3RybC5jCkBAIC0yOTMsNiAr
MjkzLDEzIEBAIGludCBwcF9hdG9tZndjdHJsX2dldF9hdmZzX2luZm9ybWF0aW9uKHN0cnVjdCBw
cF9od21nciAqaHdtZ3IsCiAJZm9ybWF0X3JldmlzaW9uID0gKChzdHJ1Y3QgYXRvbV9jb21tb25f
dGFibGVfaGVhZGVyICopcHJvZmlsZSktPmZvcm1hdF9yZXZpc2lvbjsKIAljb250ZW50X3Jldmlz
aW9uID0gKChzdHJ1Y3QgYXRvbV9jb21tb25fdGFibGVfaGVhZGVyICopcHJvZmlsZSktPmNvbnRl
bnRfcmV2aXNpb247CiAKKwlpZiAoZm9ybWF0X3JldmlzaW9uID09IDQpCisJeworCQlwcm9maWxl
LT5nYl92ZHJvb3BfdGFibGVfY2tzb2ZmX2EwID0gMHhmZmZjZDJlNzsKKwkJcHJvZmlsZS0+Z2Jf
dmRyb29wX3RhYmxlX2Nrc29mZl9hMSA9IDB4MjQ5MDI7CisJCXByb2ZpbGUtPmdiX3Zkcm9vcF90
YWJsZV9ja3NvZmZfYTIgPSAweDI0OWJhOworCX0KKwogCWlmIChmb3JtYXRfcmV2aXNpb24gPT0g
NCAmJiBjb250ZW50X3JldmlzaW9uID09IDEpIHsKIAkJcGFyYW0tPnVsTWF4VmRkYyA9IGxlMzJf
dG9fY3B1KHByb2ZpbGUtPm1heHZkZGMpOwogCQlwYXJhbS0+dWxNaW5WZGRjID0gbGUzMl90b19j
cHUocHJvZmlsZS0+bWludmRkYyk7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
