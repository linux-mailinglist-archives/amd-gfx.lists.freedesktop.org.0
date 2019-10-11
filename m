Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFCCD3E01
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 13:10:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B9C16EC19;
	Fri, 11 Oct 2019 11:10:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710079.outbound.protection.outlook.com [40.107.71.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B96FA6EC15
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 11:10:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DgjuvYPp5Q9FBB8qTEFrLH77+y3Jh/+B9ZjWWv14y5jisaCSxsbThV2eLhNu9hghCFG3b9AqNWgISAZ5GuV7bMqJh2cDxnZt8n4FxglXz1tjrURczVJYIzGdBTGcrMt8ssRq6BNlUzraV1izR0pQP7QSS/ThGZUwSYhNDKdEfaLGZkqs8KR0sZFvbHcMuB6CnSOY4eQkqoxLRxtIR4Q4DpSczwRMabXFo7P/WqSNan62CDLpznUWWvi9ukZUp+MnVnNU8wk59cchtlEJkMknKDioXG2dTeFuKGsURKM39b+Y07tWOIPpyFTys7W0ZIEynoJk2bTrNWgw6/3qCzSXEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TaO4itEC/daxGPU5KFIT9xGbue4cjjFV0bl+GKVPXDE=;
 b=a/QGUCkyoSZLZnKxZ90Uk+lbLulSOgg1utI+6DNsZPXSXJWTIKhyYH9VSHPLdhTtMg2QEYgYJ0QkaziK6WzevNw5n4bsAtJfs+KCsZNt6VR638SHhn/0ulgW4UKsPjkXLuwsVuR81zvpuv+VjZKD+r/O6v10gzP/oGNihTYRwSUbav7wF7ikJknU0xnuEIP19k5Fhd9azSttXPoBak7sCZocJRU8t3L1Bxf6c7wTFeQ8Zud8nZVw76xdl8ICLgQrCCvZEPFxsFAXWxlbbNi5kRPMm97XsYvC01Yj2eJPrGmd7dZd9CzLjoSrx5lkWaYCaJmhTh/9Bfq9+Wqfgc8SJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0006.namprd12.prod.outlook.com (2603:10b6:4:1::16) by
 CY4PR12MB1942.namprd12.prod.outlook.com (2603:10b6:903:128::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.18; Fri, 11 Oct
 2019 11:10:37 +0000
Received: from BY2NAM03FT046.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::204) by DM5PR12CA0006.outlook.office365.com
 (2603:10b6:4:1::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Fri, 11 Oct 2019 11:10:37 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT046.mail.protection.outlook.com (10.152.85.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Fri, 11 Oct 2019 11:10:36 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Fri, 11 Oct 2019 06:10:33 -0500
From: Le Ma <le.ma@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/4] drm/amd/powerplay: avoid disabling ECC if RAS is enabled
 for VEGA20
Date: Fri, 11 Oct 2019 19:10:26 +0800
Message-ID: <1570792228-11189-2-git-send-email-le.ma@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570792228-11189-1-git-send-email-le.ma@amd.com>
References: <1570792228-11189-1-git-send-email-le.ma@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(39860400002)(428003)(189003)(199004)(356004)(6916009)(50466002)(8936002)(16586007)(76176011)(2351001)(48376002)(51416003)(70206006)(47776003)(316002)(6666004)(5660300002)(36756003)(478600001)(305945005)(4326008)(86362001)(81166006)(81156014)(50226002)(2906002)(426003)(126002)(476003)(446003)(11346002)(2616005)(44832011)(336012)(26005)(70586007)(486006)(186003)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1942; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc18e48a-4a92-4a73-1fbc-08d74e3ba4a9
X-MS-TrafficTypeDiagnostic: CY4PR12MB1942:
X-Microsoft-Antispam-PRVS: <CY4PR12MB19429C17CED7684FFDF857A2F6970@CY4PR12MB1942.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 0187F3EA14
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +gEzhYa4exuAr+U0PnoAuo5aTsTz8LZCwf3ozKWm7sH7jP5QKi9xf84kKlfqhb0+RKU9xr2oUEPYY1tmc05/x2rL43bgaA+UDgOcdRu/lirKDomWJQZJKA1XTp5zt9S0h6WW/jNYmYTpmZl1jhdC6DuOK2zYo4OIBt9E1F35o+pB2UZeda0Eu8jFfnM3U5VULaSjxseZzxtFdiK4MNgv6u2MyEHKpr7MOx0W+bZdHzdcdOxfwwoSp5hEugqpAS/GgaWHHG1x86KXFbQSa5gXftVyC0mqGobkJ+ISL/21o/nNQG3zPHUH9/uS3hPSZkCIyablE7LPRyifuzanWIHmGZYfnQm+ccsqMIh2enoF+Cjw1nTaT0Kjjb6AskQeWgunA7r0Xc1UO0TK9GGjdZnjRXP75xBnbgfrNOVoaTvX+jw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 11:10:36.7107 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc18e48a-4a92-4a73-1fbc-08d74e3ba4a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1942
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TaO4itEC/daxGPU5KFIT9xGbue4cjjFV0bl+GKVPXDE=;
 b=0nSnOreSPybASJFGGaQOaUFbJIMpSY0+z66c3hV0ZKv36yoxB7+YOnhbNo1DYoSw+a0ULIFqk1xjknZErJRJGYhO8oQ6IBUEFbaFwkPHhEz7uIlsvCtLtHDN/j+gC/sUiFB/I/nFrqoIJIYYvTvXXVRJBqMumFMp88ivvkx2dQE=
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
Cc: Le Ma <le.ma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UHJvZ3JhbSBUSE1fQkFDT19DTlRMLlNPQ19ET01BSU5fSURMRT0xIHdpbGwgdGVsbCBWQklPUyB0
byBkaXNhYmxlIEVDQyB3aGVuCkJBQ08gZXhpdC4gVGhpcyBjYW4gc2F2ZSBCQUNPIGV4aXQgdGlt
ZSBieSBQU1Agb24gbm9uZS1FQ0MgU0tVLiBEcm9wIHRoZSBzZXR0aW5nCmZvciBFQ0Mgc3VwcG9y
dGVkIFNLVS4KCkNoYW5nZS1JZDogSTJhODJjMTI4ZmE1ZTk3MzFiODg2ZGQ2MWYxMjczZGM0OGVh
MTkyM2MKU2lnbmVkLW9mZi1ieTogTGUgTWEgPGxlLm1hQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTIwX2JhY28uYyB8IDEyICsrKysrKystLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMjBfYmFjby5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTIwX2JhY28uYwppbmRl
eCBkZjZmZjkyLi5iMDY4ZDFjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9od21nci92ZWdhMjBfYmFjby5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L2h3bWdyL3ZlZ2EyMF9iYWNvLmMKQEAgLTI5LDcgKzI5LDcgQEAKICNpbmNsdWRlICJ2ZWdh
MjBfYmFjby5oIgogI2luY2x1ZGUgInZlZ2EyMF9zbXVtZ3IuaCIKIAotCisjaW5jbHVkZSAiYW1k
Z3B1X3Jhcy5oIgogCiBzdGF0aWMgY29uc3Qgc3RydWN0IHNvYzE1X2JhY29fY21kX2VudHJ5IGNs
ZWFuX2JhY29fdGJsW10gPQogewpAQCAtNzQsNiArNzQsNyBAQCBpbnQgdmVnYTIwX2JhY29fZ2V0
X3N0YXRlKHN0cnVjdCBwcF9od21nciAqaHdtZ3IsIGVudW0gQkFDT19TVEFURSAqc3RhdGUpCiBp
bnQgdmVnYTIwX2JhY29fc2V0X3N0YXRlKHN0cnVjdCBwcF9od21nciAqaHdtZ3IsIGVudW0gQkFD
T19TVEFURSBzdGF0ZSkKIHsKIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IChzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqKShod21nci0+YWRldik7CisJc3RydWN0IGFtZGdwdV9yYXMgKnJhcyA9
IGFtZGdwdV9yYXNfZ2V0X2NvbnRleHQoYWRldik7CiAJZW51bSBCQUNPX1NUQVRFIGN1cl9zdGF0
ZTsKIAl1aW50MzJfdCBkYXRhOwogCkBAIC04NCwxMCArODUsMTEgQEAgaW50IHZlZ2EyMF9iYWNv
X3NldF9zdGF0ZShzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLCBlbnVtIEJBQ09fU1RBVEUgc3RhdGUp
CiAJCXJldHVybiAwOwogCiAJaWYgKHN0YXRlID09IEJBQ09fU1RBVEVfSU4pIHsKLQkJZGF0YSA9
IFJSRUczMl9TT0MxNShUSE0sIDAsIG1tVEhNX0JBQ09fQ05UTCk7Ci0JCWRhdGEgfD0gMHg4MDAw
MDAwMDsKLQkJV1JFRzMyX1NPQzE1KFRITSwgMCwgbW1USE1fQkFDT19DTlRMLCBkYXRhKTsKLQor
CQlpZiAoIXJhcyB8fCAhcmFzLT5zdXBwb3J0ZWQpIHsKKwkJCWRhdGEgPSBSUkVHMzJfU09DMTUo
VEhNLCAwLCBtbVRITV9CQUNPX0NOVEwpOworCQkJZGF0YSB8PSAweDgwMDAwMDAwOworCQkJV1JF
RzMyX1NPQzE1KFRITSwgMCwgbW1USE1fQkFDT19DTlRMLCBkYXRhKTsKKwkJfQogCiAJCWlmKHNt
dW1fc2VuZF9tc2dfdG9fc21jX3dpdGhfcGFyYW1ldGVyKGh3bWdyLCBQUFNNQ19NU0dfRW50ZXJC
YWNvLCAwKSkKIAkJCXJldHVybiAtRUlOVkFMOwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
