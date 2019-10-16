Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D6CD8BF5
	for <lists+amd-gfx@lfdr.de>; Wed, 16 Oct 2019 10:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BDB56E907;
	Wed, 16 Oct 2019 08:58:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710067.outbound.protection.outlook.com [40.107.71.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB9B86E907
 for <amd-gfx@lists.freedesktop.org>; Wed, 16 Oct 2019 08:58:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dAPtOZtGB4z3htpF2dFORm36uw2+IMLfKc84I/r2TjvL93iYxBYIf1KjL3+ErJ28L+1v/IFT4D2p29ic7BwWf1w7r3ZwS9EtwtNEI0oe6ZmHET5S+t/ZXrTvv4VqjBo0fw4YzhRld3qzkWKFPLUk7kx4TWB0wg7rSR20EDl0mUHAeC2yMzrXOqUPBPWscNUUzYlmem++yHMtSp03vvsZ464PETHiLWYNU6wvpxfdiKuQ8iIaFtCmXlsj5VVP0I0R7l5LO1K5RqJAKGsdPixeBb+Dg3UVO9ayo7eQHj2mmOhJVzMK4ycVI0lY7TK6oIkGpDfp6tDjDJFIrTQ2K1Xzig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mr8GWpgpQ+dV7s3dFtDT4noN05KTZKa5u7hYlh9a7is=;
 b=euU2wwOj3R8FA5LPOTLrIKVgjjsLXsBO/DCDBXP+j4OSuOk+pqvYplxWSbijiMM2Q1ik6z91QvT79XaUbRN0bafiBmr7k5MECQ1zJlDxFK8qn2QIojlIy9aqACcDZSh5UWxR/CPMvoX8DfnWulnPWxxi47UUdYCTSy9E1In8q356BcuVST3A8bwGmd5Na5SqnYQXfSVwBRmFlFPMJ2vBxrFoWQ7TxZNXdkRmFaXDJ/Gpksg4reh6iLmkH1UiqLaoYthCCL3okkv8q422gYrYEyIkzKtKpNhWjjM+Scltmcrhz/tFE6jbtge4bEQ936YwBcRfCiPwW5CKS4RqHX5ijw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN4PR12CA0024.namprd12.prod.outlook.com (2603:10b6:403:2::34)
 by CY4PR1201MB2470.namprd12.prod.outlook.com (2603:10b6:903:d1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.21; Wed, 16 Oct
 2019 08:58:28 +0000
Received: from BY2NAM03FT051.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::203) by BN4PR12CA0024.outlook.office365.com
 (2603:10b6:403:2::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Wed, 16 Oct 2019 08:58:27 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 BY2NAM03FT051.mail.protection.outlook.com (10.152.85.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2367.14 via Frontend Transport; Wed, 16 Oct 2019 08:58:27 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 16 Oct
 2019 03:58:26 -0500
Received: from lnx-kenneth.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 16 Oct 2019 03:58:25 -0500
From: Kenneth Feng <kenneth.feng@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: bug fix for memory clock request from
 display
Date: Wed, 16 Oct 2019 16:58:22 +0800
Message-ID: <1571216302-898-1-git-send-email-kenneth.feng@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(346002)(396003)(428003)(199004)(189003)(6666004)(44832011)(186003)(36756003)(426003)(81166006)(16586007)(8936002)(2351001)(81156014)(86362001)(51416003)(26005)(47776003)(476003)(7696005)(2616005)(126002)(486006)(5660300002)(4326008)(356004)(336012)(6916009)(50466002)(4744005)(305945005)(478600001)(14444005)(48376002)(70206006)(53416004)(70586007)(316002)(50226002)(2906002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB2470; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da86f053-2a6a-4cb4-c7ba-08d752170260
X-MS-TrafficTypeDiagnostic: CY4PR1201MB2470:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB24707816D5635BA993A5DE468E920@CY4PR1201MB2470.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-Forefront-PRVS: 0192E812EC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6s2zfy9OpORjPa3D69QyG9AgfcYvM//4BzTud/cBOQ8pEdAmKrWoR65KxAylfYS5zv4sDt2oxOTq+/Nqg6xTj41zmg6oKQzwRtmydGVt5FFGnlsD7vOb0ezcU3uchsiR708Y4FmS522teuDJizMF7kZrQk2bg0N5nXEHY/KRswDKWScmMrE4TvT8b12LfnUCz8qx4Gef3q5AzBoKBaWrDlvVST0ldBUxdL6RsXYiMYjvpcq0eSoXLHKL48tI8kwS8sWGT+3LtmXB2H01gyN/gEJjNlKehVr6svXavn7yk38PfB2RvQtRyf62bY5cYMYHPc+KytZlVWMAnVCM8CoOPfr5pdm1nQtvglsp/mKfr4CpizmUjlOdQO8nBMTZjFkdSHagUpVZRbEe4yOeWawH7BX60wPkDkvRbboiQX1EILk=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2019 08:58:27.2545 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da86f053-2a6a-4cb4-c7ba-08d752170260
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2470
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mr8GWpgpQ+dV7s3dFtDT4noN05KTZKa5u7hYlh9a7is=;
 b=1Kt/LtOETFcuvGikL9F9ddM5MelW2s1aJ+LdzoRDejaMk6EZk/cweS+LW0eURVawlr1V/zhzV7O4ZeSiAGuUVZBbeLO1SdlbxzcZk4SJ+wNqLD9oMvbCFNUAcUrQishh7rSbRnw8IBC6djkEsfg8AGInNMnFGxQbHEZWyKui1QA=
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
Cc: Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SW4gc29tZSBjYXNlcywgZGlzcGxheSBmaXhlcyBtZW1vcnkgY2xvY2sgZnJlcXVlbmN5IHRvIGEg
aGlnaCB2YWx1ZQpyYXRoZXIgdGhhbiB0aGUgbmF0dXJhbCBtZW1vcnkgY2xvY2sgc3dpdGNoaW5n
LgpXaGVuIHdlIGNvbWVzIGJhY2sgZnJvbSBzMyByZXN1bWUsIHRoZSByZXF1ZXN0IGZyb20gZGlz
cGxheSBpcyBub3QgcmVzZXQsCnRoaXMgY2F1c2VzIHRoZSBidWcgd2hpY2ggbWFrZXMgdGhlIG1l
bW9yeSBjbG9jayBnb2VzIGludG8gYSBsb3cgdmFsdWUuClRoZW4gZHVlIHRvIHRoZSBpbnN1ZmZj
aWVudCBtZW1vcnkgY2xvY2ssIHRoZSBzY3JlZW4gZmxpY2tzLgoKU2lnbmVkLW9mZi1ieTogS2Vu
bmV0aCBGZW5nIDxrZW5uZXRoLmZlbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9hbWRncHVfc211LmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1
X3NtdS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCmluZGV4
IGUyYTAzZjQuLmVlMzc0ZGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L2FtZGdwdV9zbXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRn
cHVfc211LmMKQEAgLTEzNTQsNiArMTM1NCw4IEBAIHN0YXRpYyBpbnQgc211X3Jlc3VtZSh2b2lk
ICpoYW5kbGUpCiAJaWYgKHNtdS0+aXNfYXB1KQogCQlzbXVfc2V0X2dmeF9jZ3BnKCZhZGV2LT5z
bXUsIHRydWUpOwogCisJc211LT5kaXNhYmxlX3VjbGtfc3dpdGNoID0gMDsKKwogCW11dGV4X3Vu
bG9jaygmc211LT5tdXRleCk7CiAKIAlwcl9pbmZvKCJTTVUgaXMgcmVzdW1lZCBzdWNjZXNzZnVs
bHkhXG4iKTsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
