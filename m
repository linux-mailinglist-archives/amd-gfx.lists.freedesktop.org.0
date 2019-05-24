Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5BB295E5
	for <lists+amd-gfx@lfdr.de>; Fri, 24 May 2019 12:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD0288BE3;
	Fri, 24 May 2019 10:33:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700079.outbound.protection.outlook.com [40.107.70.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 121F888BE3
 for <amd-gfx@lists.freedesktop.org>; Fri, 24 May 2019 10:33:28 +0000 (UTC)
Received: from DM3PR12CA0090.namprd12.prod.outlook.com (2603:10b6:0:57::34) by
 DM6PR12MB2665.namprd12.prod.outlook.com (2603:10b6:5:4a::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Fri, 24 May 2019 10:33:27 +0000
Received: from DM3NAM03FT047.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::208) by DM3PR12CA0090.outlook.office365.com
 (2603:10b6:0:57::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.15 via Frontend
 Transport; Fri, 24 May 2019 10:33:26 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT047.mail.protection.outlook.com (10.152.83.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Fri, 24 May 2019 10:33:26 +0000
Received: from build-machine.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Fri, 24 May 2019
 05:33:25 -0500
From: Emily Deng <Emily.Deng@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Don't need to call csb_vram_unpin
Date: Fri, 24 May 2019 18:33:22 +0800
Message-ID: <1558694002-19915-1-git-send-email-Emily.Deng@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(346002)(396003)(136003)(2980300002)(428003)(199004)(189003)(14444005)(53416004)(53936002)(305945005)(336012)(8936002)(26005)(186003)(50226002)(86362001)(77096007)(6666004)(356004)(2906002)(4326008)(70206006)(486006)(426003)(81166006)(8676002)(476003)(2616005)(81156014)(126002)(70586007)(2351001)(50466002)(16586007)(5660300002)(48376002)(478600001)(72206003)(6916009)(47776003)(316002)(7696005)(51416003)(68736007)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2665; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa2fca58-d85e-44ca-0c53-08d6e03341a6
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:DM6PR12MB2665; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2665:
X-Microsoft-Antispam-PRVS: <DM6PR12MB26651CB525824FE1C98789068F020@DM6PR12MB2665.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-Forefront-PRVS: 0047BC5ADE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: rbdOpqvWWuVrPg4oKFwMVRrX8aSEr4f0byXyU5sSOagz30h7EcTzmNaGi+5buRXLyZHdAaV/KMLGC/fOtUEiBi1/FWOVWJ8TtIfsghUBXATYKH20Rihgd3YZFa2oaGI7jl37gQRIJxzLsRzYkDFElMACbjQAdZY+doPNKZCjgxRUQgVBJXaEgpE058pk7vKzRAznn+p845x1JRL1mkvFE52qSUX2sqvKMQ/ipeAsu21GowZt0oZtZ3yWrgSSC1SaVbx2d4eV8FmtftqyHCvOBgNXzJM4WcnX3LS1mMGPnwNDKoZRdzWgc/zVfzZr1LnK4eQDmOOIx2bFbLAxbi3aI4vmlpum0u2iCshWYs6t4vVIRf488NEBRtNFgy7Nw9cpqHQC76VKhx7ffqKj9QfsKjTh8pxRtNjfjpuWiyyMmm8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2019 10:33:26.7818 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa2fca58-d85e-44ca-0c53-08d6e03341a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2665
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I12T6wdHKwKG+caj3Ph8Yttf3JXk6UgeT3aqZwoF7bQ=;
 b=DinZMLBFFQKE7wh3FsgNiFT3g5FCnR0dzJtLHrVz6n2dRhIZi3rmWJfbYgnvPFJShxKo13jjUWyPBYR7OZAgQ9LSt+g95NPoRv8PdEwG7Af2FFlS94SYipj6PJl9L9pPG6tWlMEUWtlVRwgKLPV/8242/VSwRQjbraU82oMGa5s=
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
Cc: Emily Deng <Emily.Deng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QXMgaXQgd2lsbCBkZXN0b3J5IGNsZWFyX3N0YXRlX29iaiwgYW5kIGFsc28gd2lsbAp1bnBpbiBp
dCBpbiB0aGUgZ2Z4X3Y5XzBfc3dfZmluaSwgc28gZG9uJ3QgbmVlZCB0bwpjYWxsIGNzYl92cmFt
IHVucGluIGluIGdmeF92OV8wX2h3X2ZpbmksIG9yIGl0IHdpbGwKaGF2ZSB1bnBpbiB3YXJuaW5n
LgoKU2lnbmVkLW9mZi1ieTogRW1pbHkgRGVuZyA8RW1pbHkuRGVuZ0BhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgfCAxNiAtLS0tLS0tLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMTYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dmeF92OV8wLmMKaW5kZXggYzc2MzczMy4uMjMxYjllMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nZnhfdjlfMC5jCkBAIC0xMTU0LDIwICsxMTU0LDYgQEAgc3RhdGljIGludCBnZnhfdjlf
MF9jc2JfdnJhbV9waW4oc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJcmV0dXJuIHI7CiB9
CiAKLXN0YXRpYyB2b2lkIGdmeF92OV8wX2NzYl92cmFtX3VucGluKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2KQotewotCWludCByOwotCi0JaWYgKCFhZGV2LT5nZngucmxjLmNsZWFyX3N0YXRl
X29iaikKLQkJcmV0dXJuOwotCi0JciA9IGFtZGdwdV9ib19yZXNlcnZlKGFkZXYtPmdmeC5ybGMu
Y2xlYXJfc3RhdGVfb2JqLCB0cnVlKTsKLQlpZiAobGlrZWx5KHIgPT0gMCkpIHsKLQkJYW1kZ3B1
X2JvX3VucGluKGFkZXYtPmdmeC5ybGMuY2xlYXJfc3RhdGVfb2JqKTsKLQkJYW1kZ3B1X2JvX3Vu
cmVzZXJ2ZShhZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX29iaik7Ci0JfQotfQotCiBzdGF0aWMg
dm9pZCBnZnhfdjlfMF9tZWNfZmluaShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHsKIAlh
bWRncHVfYm9fZnJlZV9rZXJuZWwoJmFkZXYtPmdmeC5tZWMuaHBkX2VvcF9vYmosIE5VTEwsIE5V
TEwpOwpAQCAtMzM4NSw4ICszMzcxLDYgQEAgc3RhdGljIGludCBnZnhfdjlfMF9od19maW5pKHZv
aWQgKmhhbmRsZSkKIAlnZnhfdjlfMF9jcF9lbmFibGUoYWRldiwgZmFsc2UpOwogCWFkZXYtPmdm
eC5ybGMuZnVuY3MtPnN0b3AoYWRldik7CiAKLQlnZnhfdjlfMF9jc2JfdnJhbV91bnBpbihhZGV2
KTsKLQogCXJldHVybiAwOwogfQogCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
