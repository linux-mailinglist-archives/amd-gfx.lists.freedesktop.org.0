Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7101ED48AC
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 21:53:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 000666EC93;
	Fri, 11 Oct 2019 19:53:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740044.outbound.protection.outlook.com [40.107.74.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46ED36EC90
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 19:53:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R7iqsn5Qe2wv+u5hpaBA8F3NBY8bo+TbuyJEdOIwZS1416Vcjky58VUyC4/Yih5FepfnUUw4QiFkYv/StZicEnVRBFB/1VzDn7bimPattQKIyxlDqkLZ3VaXl3f+F7Et/4vf4laXvpl7xZRMFUZDfoQESXxncupfIFgYP/RyhR6Q9643h2vnnmCZfyFs7Hj6++Ey5mstbeRdDIyx/tVT53ysGO2RxOeYAZ85fWJ136bX9pDyfbZ9Xq5z1nfx50N9onEaIL5jGESniFoqycHoRZgTS2fWnj32QO3IJgm5StL6aXQ1B2nV6jDIOWuWKrecWMkX9TxOYMjgaiK2x6c9tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+N+FFQB7HyCItox0IU8Tgl6xFeFfA6RUuQuoJvjSl5g=;
 b=jlAi0Qn4DFyksrZhGzRNusi6HJHfFl8JzAuWOkwMenY0W465tocp5U3Q4+wkZtYZILoSuNyvybv0txaLqeaZ3WnhcQrRLbGZk0UWjuV5hi4QAURFBSo9PD5zdhixP1gflP6OTISCDzlj1Ydlb7dIk93n3JGvCy2n61dCnX1xrMsxlmcku5dZB7tnrsS2JYgoIkwJVOaWF/NFYqhPT30Vghokj/xM8GGEbvlDjph7Kg+TlmBP0KzPr0bQ63EPEulawaZ+7YLiABlquNzLlE5DRqdL4T6bZpSDiWhqg7dYazOxTH3+EYXK18ORuFDm/b80CPd3C0p4dZtsvaqJiFZOQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0018.namprd12.prod.outlook.com (2603:10b6:5:1c0::31)
 by MN2PR12MB3280.namprd12.prod.outlook.com (2603:10b6:208:ad::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.19; Fri, 11 Oct
 2019 19:53:50 +0000
Received: from BY2NAM03FT051.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::207) by DM6PR12CA0018.outlook.office365.com
 (2603:10b6:5:1c0::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.17 via Frontend
 Transport; Fri, 11 Oct 2019 19:53:50 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT051.mail.protection.outlook.com (10.152.85.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2347.21 via Frontend Transport; Fri, 11 Oct 2019 19:53:49 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 11 Oct 2019
 14:53:45 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 13/29] drm/amd/display: initialize RN gpuvm context
 programming function
Date: Fri, 11 Oct 2019 15:53:08 -0400
Message-ID: <20191011195324.16268-14-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
References: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(396003)(136003)(376002)(428003)(199004)(189003)(4326008)(316002)(26005)(305945005)(86362001)(48376002)(1076003)(47776003)(14444005)(2351001)(53416004)(16586007)(51416003)(7696005)(76176011)(126002)(486006)(11346002)(476003)(2616005)(446003)(6916009)(2906002)(186003)(336012)(426003)(5660300002)(8676002)(50466002)(81156014)(81166006)(70206006)(70586007)(8936002)(50226002)(478600001)(356004)(6666004)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3280; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d7ae806-9b75-4c28-f295-08d74e84bc6f
X-MS-TrafficTypeDiagnostic: MN2PR12MB3280:
X-Microsoft-Antispam-PRVS: <MN2PR12MB32806782074FF27F719732EFF9970@MN2PR12MB3280.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:525;
X-Forefront-PRVS: 0187F3EA14
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fEglXoY6iJbnXOAl+IwsqA1TR6w/kGDedRQmzjbNyZ/2TX53lU74TuF7/4KHPqjZ0N1DvVgeR6Q1+FZXp/RcW+c3992LY6NIHTp7NmQVAwniwvYkubd+LhxJhATteqPvMtIHDzFFrymGmt2uv/JZ/Bu0xHc0eJQJcNi7dg65vZnnrSNVOL0b15l7U8YvASDDXSN6wrlS2v3CNo72T5+PX6NYWWTL+4Q1AoJ2w/gdA16hUUlmygO6SpTn4uKWJUG6X1E1m7DxJ/vJoSLoe3vds5EYs623ROTWIAvC+jUPNjnlmQbQi1Hh/aT42BS6hPy70CK2Jpmk1HmS9kKEJmq59dm3g1Rh97awjGi8j4TF5lC0qQcJMunp92QQIUXhCT9QMEC4WlTtYIeF/sI7Wh/F9XzEmNoI1x1efO2QsI7BfYQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 19:53:49.8716 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d7ae806-9b75-4c28-f295-08d74e84bc6f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3280
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+N+FFQB7HyCItox0IU8Tgl6xFeFfA6RUuQuoJvjSl5g=;
 b=b3EhhY0SthDSnYfVwUKKIm5Gy34bYrV2pFuGCnEmqOZf4zA7jWstJ32EtZKdijs0OXaY+MbrpGbY8UmW0B7B9mlW/EmXq7Zm07XJ62FYG6SG5mIMkpgV65ZjV43dmWjU8tn0KIEBVB8Z9AuQx0/DL56GxJrdrjMXDHAKOJmxnck=
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
Cc: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KClJl
bm9pciBjYW4gdXNlIHZtIGNvbnRleGVzIGFzIGxvbmcgYXMgSE9TVFZNIGlzIG9mZiBzbwp0aGlz
IHNob3VsZCBiZSBpbml0aWFsaXplZC4KClNpZ25lZC1vZmYtYnk6IERteXRybyBMYWt0eXVzaGtp
biA8RG15dHJvLkxha3R5dXNoa2luQGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWto
YSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNuMjEvZGNuMjFfaHViYnViLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfaHViYnViLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfaHViYnViLmMKaW5kZXggMjIzMmNjZjE0YmRkLi40NGY2
NGE4ZTMzZjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24y
MS9kY24yMV9odWJidWIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MjEvZGNuMjFfaHViYnViLmMKQEAgLTYyOCw3ICs2MjgsNyBAQCB2b2lkIGh1YmJ1YjIxX2FwcGx5
X0RFRENOMjFfMTQ3X3dhKHN0cnVjdCBodWJidWIgKmh1YmJ1YikKIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgaHViYnViX2Z1bmNzIGh1YmJ1YjIxX2Z1bmNzID0gewogCS51cGRhdGVfZGNodWIgPSBodWJi
dWIyX3VwZGF0ZV9kY2h1YiwKIAkuaW5pdF9kY2h1Yl9zeXNfY3R4ID0gaHViYnViMjFfaW5pdF9k
Y2h1YiwKLQkuaW5pdF92bV9jdHggPSBOVUxMLAorCS5pbml0X3ZtX2N0eCA9IGh1YmJ1YjJfaW5p
dF92bV9jdHgsCiAJLmRjY19zdXBwb3J0X3N3aXp6bGUgPSBodWJidWIyX2RjY19zdXBwb3J0X3N3
aXp6bGUsCiAJLmRjY19zdXBwb3J0X3BpeGVsX2Zvcm1hdCA9IGh1YmJ1YjJfZGNjX3N1cHBvcnRf
cGl4ZWxfZm9ybWF0LAogCS5nZXRfZGNjX2NvbXByZXNzaW9uX2NhcCA9IGh1YmJ1YjJfZ2V0X2Rj
Y19jb21wcmVzc2lvbl9jYXAsCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
