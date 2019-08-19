Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7210891E90
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 10:05:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1514089FDE;
	Mon, 19 Aug 2019 08:05:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700050.outbound.protection.outlook.com [40.107.70.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 538596E0C8
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 08:05:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hneybxtKfVF+r1prE8Q+ElcK1sEiqb5V1B8HFQfNPtv3UtSVQIwhl01uubPX6nuxY0E3l1BWc36HZwliT9tbM/BFu3mN0ztUCTnfbjYamzS/xNdrRJwL8T9zEvb+7elltEmfzaypmBUAfTJryVl6IgD6JB16Y5v0bB1sLrxO7zfDOvyzmHHH20d2Pqg2UcAgYUmlGK/u1SJF+LGQTE4d3OrE1oYorlSmqyzRDUI/PJpE7LKeYl65lbLz1EqLPE6miEp5z/CS1kZV5/yqSdmZIZBErpoJuIgSsOFIKHi4bpfMj1o+EKYJdnQrP+E3qcAF402Xw6IY7QrfSC0Lst8Rdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXjh40pZaqjh1V42tyizVBggpWyVppAjSLU0bbdO3V8=;
 b=ccZDjddotbvMEXS7224GVTxWg9R/EaSB4GAOPQxxOh+sah5T2Q46Fv7EKwCnH05Px48IILovFEckopZztnLgX7JEy2i3PchCSoq5tv7SkP2MX7Ym2p2o+2IG4olK8K9AAdp6EWBwlj44eCu+XmE5lr7o+0QM7SmVIClniGMWc9INPRA29BTkbQSZIiaNNenO5ukdTK+VFY/VydKa22f0mz1uttHMERW51SPJ78OhgRf50H2M5wbM5Imy4tuUVk7nK65AfRlVVKBHTBfKHA+c9b9ulnzPwywOdfTiAYwfuuyYxU947SE/kblCG1lBZOnIxM1BCpSdpIIFKl8zZlWfug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR12CA0067.namprd12.prod.outlook.com (2603:10b6:300:103::29)
 by DM5PR12MB1530.namprd12.prod.outlook.com (2603:10b6:4:4::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Mon, 19 Aug 2019 08:05:51 +0000
Received: from BY2NAM03FT017.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by MWHPR12CA0067.outlook.office365.com
 (2603:10b6:300:103::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 08:05:51 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT017.mail.protection.outlook.com (10.152.84.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 08:05:51 +0000
Received: from rico-code.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 19 Aug 2019
 03:05:49 -0500
From: Tianci Yin <tianci.yin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/psp: move TMR to cpu invisible vram region
Date: Mon, 19 Aug 2019 16:05:45 +0800
Message-ID: <1566201945-18101-1-git-send-email-tianci.yin@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(346002)(396003)(376002)(2980300002)(428003)(189003)(199004)(36756003)(426003)(70586007)(8936002)(50226002)(54906003)(70206006)(336012)(51416003)(81166006)(16586007)(7696005)(2351001)(4326008)(5660300002)(8676002)(316002)(47776003)(50466002)(48376002)(26005)(478600001)(356004)(6666004)(476003)(53936002)(6916009)(53416004)(2906002)(486006)(14444005)(305945005)(126002)(86362001)(44832011)(81156014)(2616005)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1530; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd6b1ead-c67c-4a11-2e73-08d7247c0d34
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1530; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1530:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1530C629766005978D588DD595A80@DM5PR12MB1530.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:162;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: TGuE37bJJo0aZAMhifkovw//CUl3t3RhIfru0x2NCHwMqWYuIstq2uleIvyyTucUjaBl7fpwSSm5vbn3Ekas+xTm4OQe99+pNODZ+NrQ5uIuJbtcXMgzCOxmbJyhX5XlfFEmAvbovhuXnQtoQ2nxyRmG6FT39BLYZfiZuNcvpQehkB12fsmqXtmIJ0BVvYEyu42d86KoHLP+2qe7E4FDqwJ2CMf2wbd65zc1nEvC6aB6BrwYfxni5d/hu14SRetNu1gKVhJJ6fN11fBWBwvBPafHov1Ko225DhEE2Jy7BXZIK6R62EkZH7tj/r7p00UsRaW6xGaMKCqyXyBnX4FICuLAeSGlWGkSGgqIIyM8nRR7WzvcaaUGYYMnjMu6o5XrtR5EB03I7a2mbCQ2BTNbztYzYuQt6WvXhsfosIDQGbU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 08:05:51.0731 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd6b1ead-c67c-4a11-2e73-08d7247c0d34
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1530
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXjh40pZaqjh1V42tyizVBggpWyVppAjSLU0bbdO3V8=;
 b=FxzglJ0JmldTVlDhp1yaLOQhqmlAcYAiIxUwdQ9ocgF4YZSIsCtI/2Bl6iFko+eFe3XBhmjwobNGDcm1ccKdCFtRVgxduYTHbYsURZqH/3c9hy041uMkKPkshDLb8i42NEERtW2fBXE45J+A5ryBoz+41+r7B0/Rp4HBrS1vtmM=
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
Cc: Jack Xiao <Jack.Xiao@amd.com>, Tianci Yin <tianci.yin@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogIlRpYW5jaS5ZaW4iIDx0aWFuY2kueWluQGFtZC5jb20+CgpzbyB0aGF0IG1vcmUgdmlz
aWJsZSB2cmFtIGNhbiBiZSBhdmFpbGFibGUgZm9yIHVtZC4KClNpZ25lZC1vZmYtYnk6IFRpYW5j
aS5ZaW4gPHRpYW5jaS55aW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfb2JqZWN0LmMgfCA1ICsrKy0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcHNwLmMgICAgfCA0ICsrLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9wc3AuaCAgICB8IDEgLQogMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X29iamVjdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jCmlu
ZGV4IDEwNTk3NzEuLjA0NzY3OTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9vYmplY3QuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfb2JqZWN0LmMKQEAgLTI0Niw4ICsyNDYsOSBAQCBpbnQgYW1kZ3B1X2JvX2NyZWF0ZV9yZXNl
cnZlZChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAlicC5zaXplID0gc2l6ZTsKIAlicC5i
eXRlX2FsaWduID0gYWxpZ247CiAJYnAuZG9tYWluID0gZG9tYWluOwotCWJwLmZsYWdzID0gQU1E
R1BVX0dFTV9DUkVBVEVfQ1BVX0FDQ0VTU19SRVFVSVJFRCB8Ci0JCUFNREdQVV9HRU1fQ1JFQVRF
X1ZSQU1fQ09OVElHVU9VUzsKKwlicC5mbGFncyA9IGNwdV9hZGRyID8gQU1ER1BVX0dFTV9DUkVB
VEVfQ1BVX0FDQ0VTU19SRVFVSVJFRAorCQk6IEFNREdQVV9HRU1fQ1JFQVRFX05PX0NQVV9BQ0NF
U1M7CisJYnAuZmxhZ3MgfD0gQU1ER1BVX0dFTV9DUkVBVEVfVlJBTV9DT05USUdVT1VTOwogCWJw
LnR5cGUgPSB0dG1fYm9fdHlwZV9rZXJuZWw7CiAJYnAucmVzdiA9IE5VTEw7CiAKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYwppbmRleCA3NzE1YzBkLi41ZTdmYmJlIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jCkBAIC0yNjQsNyArMjY0LDcgQEAg
c3RhdGljIGludCBwc3BfdG1yX2luaXQoc3RydWN0IHBzcF9jb250ZXh0ICpwc3ApCiAKIAlyZXQg
PSBhbWRncHVfYm9fY3JlYXRlX2tlcm5lbChwc3AtPmFkZXYsIHRtcl9zaXplLCBQU1BfVE1SX1NJ
WkUsCiAJCQkJICAgICAgQU1ER1BVX0dFTV9ET01BSU5fVlJBTSwKLQkJCQkgICAgICAmcHNwLT50
bXJfYm8sICZwc3AtPnRtcl9tY19hZGRyLCAmcHNwLT50bXJfYnVmKTsKKwkJCQkgICAgICAmcHNw
LT50bXJfYm8sICZwc3AtPnRtcl9tY19hZGRyLCBOVUxMKTsKIAogCXJldHVybiByZXQ7CiB9CkBA
IC0xMjE1LDcgKzEyMTUsNyBAQCBzdGF0aWMgaW50IHBzcF9od19maW5pKHZvaWQgKmhhbmRsZSkK
IAogCXBzcF9yaW5nX2Rlc3Ryb3kocHNwLCBQU1BfUklOR19UWVBFX19LTSk7CiAKLQlhbWRncHVf
Ym9fZnJlZV9rZXJuZWwoJnBzcC0+dG1yX2JvLCAmcHNwLT50bXJfbWNfYWRkciwgJnBzcC0+dG1y
X2J1Zik7CisJYW1kZ3B1X2JvX2ZyZWVfa2VybmVsKCZwc3AtPnRtcl9ibywgJnBzcC0+dG1yX21j
X2FkZHIsIE5VTEwpOwogCWFtZGdwdV9ib19mcmVlX2tlcm5lbCgmcHNwLT5md19wcmlfYm8sCiAJ
CQkgICAgICAmcHNwLT5md19wcmlfbWNfYWRkciwgJnBzcC0+ZndfcHJpX2J1Zik7CiAJYW1kZ3B1
X2JvX2ZyZWVfa2VybmVsKCZwc3AtPmZlbmNlX2J1Zl9ibywKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9wc3AuaAppbmRleCAwMDI5ZmEyLi40OGIwNTdkIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmgKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5oCkBAIC0xNzIsNyArMTcyLDYgQEAgc3RydWN0IHBzcF9j
b250ZXh0CiAJLyogdG1yIGJ1ZmZlciAqLwogCXN0cnVjdCBhbWRncHVfYm8JCSp0bXJfYm87CiAJ
dWludDY0X3QJCQl0bXJfbWNfYWRkcjsKLQl2b2lkCQkJCSp0bXJfYnVmOwogCiAJLyogYXNkIGZp
cm13YXJlIGFuZCBidWZmZXIgKi8KIAljb25zdCBzdHJ1Y3QgZmlybXdhcmUJCSphc2RfZnc7Ci0t
IAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
