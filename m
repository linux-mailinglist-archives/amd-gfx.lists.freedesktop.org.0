Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB99D9EF03
	for <lists+amd-gfx@lfdr.de>; Tue, 27 Aug 2019 17:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A96389A4F;
	Tue, 27 Aug 2019 15:33:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760075.outbound.protection.outlook.com [40.107.76.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 088BD899E6
 for <amd-gfx@lists.freedesktop.org>; Tue, 27 Aug 2019 15:33:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QtxRc75/KrqLhCxaJQYh1wh2y5N/Kd+JcM6TNlg9/gKTSHjSofwfBo6/3zzRmktRa3/ORwAC7NU/kqY1rLTjRLBrzrQDPhh2ApxEyG2wXmXfGX16iVE1V7/1doblGC6EZ6gfDfVAj2thiM5WiWVYJE/30flk/R+A6v8ryqti83dSss6+DJ5F4qvS1yT2xO4tnyBM4jya6XX2emhmO86uupXqrzpwluvOzyyhkEehVqgUDNEwCVCbUEhU7fFY2RBieL6K6hQ+/LraMUYygYvI7ETtez9TbXetZ2/mahZhY/tLCiHxxqzoW9fsQ3AN2vh+07RDWvRTgbOBwbK2OnfTHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KTgpri7ubbOpLmMY2XrtBHcwWDPWJcfBXzobtZrOA9Q=;
 b=EEazcMIJQpZAlkoQwLfZOG92Sr41r60uYxTt1Xwv5qxMwPCcLRpF/wc2xO9KExPKmZym0X4HFC8uKLMD2G284DjoXtvJ9LcSswCv157QhGOFe/BxUVjqdXkFh+ZxjQWoheH7/ruIxu0XDwJMP8H27xqINp/07wOm1T9BMh6k3Rewr3gXrr9nvy6SoJ2JZ4G5RbXmw1cMNFrmcvYem0yaPkXQfhQPieYkVWnbbu9vwcbJJlIPQGcknceEVFcAiEfSL02hwbPh8qiYjVLNg6x4dtpfMWXW9eR7eWYB6my5oXyK9RsZhqNYdP4xjp4fyWZMvIbptm04otQq7Z/vodGICg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR12CA0033.namprd12.prod.outlook.com (2603:10b6:405:70::19)
 by SN6PR12MB2718.namprd12.prod.outlook.com (2603:10b6:805:70::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.21; Tue, 27 Aug
 2019 15:33:54 +0000
Received: from BY2NAM03FT061.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::203) by BN6PR12CA0033.outlook.office365.com
 (2603:10b6:405:70::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Tue, 27 Aug 2019 15:33:53 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT061.mail.protection.outlook.com (10.152.85.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Tue, 27 Aug 2019 15:33:52 +0000
Received: from lnx-aaliu.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 27 Aug 2019
 10:33:33 -0500
From: Aaron Liu <aaron.liu@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: fix commit 4ef9d7d
Date: Tue, 27 Aug 2019 23:33:29 +0800
Message-ID: <1566920009-8378-1-git-send-email-aaron.liu@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(136003)(346002)(376002)(2980300002)(428003)(189003)(199004)(50226002)(16586007)(8676002)(81156014)(2351001)(305945005)(316002)(6666004)(356004)(50466002)(7696005)(36756003)(81166006)(14444005)(70586007)(70206006)(86362001)(48376002)(51416003)(5660300002)(486006)(426003)(126002)(2616005)(476003)(53936002)(2906002)(47776003)(53416004)(478600001)(4326008)(26005)(44832011)(8936002)(336012)(6916009)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2718; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 846ead53-f0ab-46ef-9c26-08d72b03f742
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:SN6PR12MB2718; 
X-MS-TrafficTypeDiagnostic: SN6PR12MB2718:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2718994180CFF4D37C887F02F0A00@SN6PR12MB2718.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:194;
X-Forefront-PRVS: 0142F22657
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: ybMCEA+ad88EKL8LvgxylC9S5IKmWIk68JUN2vMopQVkFbcC8lK0azw7cp4J9XII1iLaKJ02YODtJoQjqRe50JzBCK2JTvjb48JjkP/cODGOvFZ2Iut3322/4I9J5oASPm+h3agav/pgZZoSqr6FTMM3u1bTC5gLUDknwG46vZhN8zSC/ALlkyeZ98lIiWR1essQ1AiiK/2wCQeZvKyvFhU1TCht6YTesj0UpQdkMRW3yWScxwCLjEIZ8upzkkwuFZpNxCdxcU+ymhmoqL2bFzqDfN5Q33+KKL+OqmhaJhwLByPXa5aMF/ID7zMNTKshUs9YnGgd3iSNRDqEEWDtje7C1vkuMGR8PhgVn7nnp4jDKEOTIHjsPa0QuMbSZdpTUrqdh5E0hcfLmwHcEzDeI1y8uqTCGYxibHPskq+jFhE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2019 15:33:52.7837 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 846ead53-f0ab-46ef-9c26-08d72b03f742
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2718
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KTgpri7ubbOpLmMY2XrtBHcwWDPWJcfBXzobtZrOA9Q=;
 b=yjK/+y+czzlLdQeZOgysEnt+tNsyJTA2ZslXHr+Nb+9W0rJdmm3sOk9vMG2psmp0tYFbZx9LFf5B5xx5zIax7YkojZy3LqGkT0j+q1YZ4AuD5P7NIB7v8dkQHuR2ke922lTa1cObDK2R1d9qTnJBYHK/jV/L+ZmgioTpjgv5+jE=
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
Cc: Aaron Liu <aaron.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rm9yIHBpY2Fzc28oYWRldi0+cGRldi0+ZGV2aWNlID09IDB4MTVkOCkmcmF2ZW4yKGFkZXYtPnJl
dl9pZCA+PSAweDgpLApmaXJtd2FyZSBpcyBzdWZmaWNpZW50IHRvIHN1cHBvcnQgZ2Z4b2ZmLgpJ
biBjb21taXQgNGVmOWQ3ZGMyZGIxNjZjYmU4M2ZlNDYyMTM4NWYwMzRjOTM0N2ZkMiwgZm9yIHBp
Y2Fzc28mcmF2ZW4yLApyZXR1cm4gZGlyZWN0bHkgYW5kIGNhdXNlIGdmeG9mZiBkaXNhYmxlZC4K
ClNpZ25lZC1vZmYtYnk6IEFhcm9uIExpdSA8YWFyb24ubGl1QGFtZC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyB8IDE0ICsrKysrKystLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nZnhfdjlfMC5jCmluZGV4IDI3NjJhZTQuLmZkNzk0N2UgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYwpAQCAtMTAyNywxNCArMTAyNywxNCBAQCBzdGF0aWMg
dm9pZCBnZnhfdjlfMF9jaGVja19pZl9uZWVkX2dmeG9mZihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldikKIAljYXNlIENISVBfVkVHQTIwOgogCQlicmVhazsKIAljYXNlIENISVBfUkFWRU46Ci0J
CWlmIChhZGV2LT5yZXZfaWQgPj0gMHg4IHx8IGFkZXYtPnBkZXYtPmRldmljZSA9PSAweDE1ZDgp
Ci0JCQlicmVhazsKLQkJaWYgKChhZGV2LT5nZngucmxjX2Z3X3ZlcnNpb24gIT0gMTA2ICYmCi0J
CSAgICAgYWRldi0+Z2Z4LnJsY19md192ZXJzaW9uIDwgNTMxKSB8fAotCQkgICAgKGFkZXYtPmdm
eC5ybGNfZndfdmVyc2lvbiA9PSA1MzgxNSkgfHwKLQkJICAgIChhZGV2LT5nZngucmxjX2ZlYXR1
cmVfdmVyc2lvbiA8IDEpIHx8Ci0JCSAgICAhYWRldi0+Z2Z4LnJsYy5pc19ybGNfdjJfMSkKKwkJ
aWYgKCEoYWRldi0+cmV2X2lkID49IDB4OCB8fCBhZGV2LT5wZGV2LT5kZXZpY2UgPT0gMHgxNWQ4
KQorCQkJJiYoKGFkZXYtPmdmeC5ybGNfZndfdmVyc2lvbiAhPSAxMDYgJiYKKwkJCSAgICAgYWRl
di0+Z2Z4LnJsY19md192ZXJzaW9uIDwgNTMxKSB8fAorCQkJICAgIChhZGV2LT5nZngucmxjX2Z3
X3ZlcnNpb24gPT0gNTM4MTUpIHx8CisJCQkgICAgKGFkZXYtPmdmeC5ybGNfZmVhdHVyZV92ZXJz
aW9uIDwgMSkgfHwKKwkJCSAgICAhYWRldi0+Z2Z4LnJsYy5pc19ybGNfdjJfMSkpCiAJCQlhZGV2
LT5wbS5wcF9mZWF0dXJlICY9IH5QUF9HRlhPRkZfTUFTSzsKKwogCQlpZiAoYWRldi0+cG0ucHBf
ZmVhdHVyZSAmIFBQX0dGWE9GRl9NQVNLKQogCQkJYWRldi0+cGdfZmxhZ3MgfD0gQU1EX1BHX1NV
UFBPUlRfR0ZYX1BHIHwKIAkJCQlBTURfUEdfU1VQUE9SVF9DUCB8Ci0tIAoyLjcuNAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
