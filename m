Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B54CF591F6
	for <lists+amd-gfx@lfdr.de>; Fri, 28 Jun 2019 05:31:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78B26E87B;
	Fri, 28 Jun 2019 03:31:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810054.outbound.protection.outlook.com [40.107.81.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A956E87B
 for <amd-gfx@lists.freedesktop.org>; Fri, 28 Jun 2019 03:31:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=RQ7cO7XY+nsbEOIn+MStk0LYwJyPGwcXvY39E2z0kBPntDVq60osRxAdCipoeS/eQOzUV0sdcJemjDg4LaaZujMrzBLr3kvMGah1xfWjTYv5cFPJrvFVNjQTyA77ZJOmklgG34JvUvsB8ncd/ugRb1+m7+ouznyZTrwNRXXm+aY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUB4DMDhtWr5+schKivrs2cjtA7KlTHimQgwwZSLdxE=;
 b=UNdznq12RsvD1mTzSYKzil28pA8A0iKIriCdCB35DT/lmUP6n7qb9EL478U+MBf57F4G2XTAVCfH2qLq840kReI0GVteenjU9W/iW9xHim5QIcwYBwMHEPA9XsmQQpk+KzwQowvE6uVe5rgHu6fzuUzhbA781upfJV/gOAinTfk=
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR1201CA0017.namprd12.prod.outlook.com
 (2603:10b6:301:4a::27) by BN8PR12MB3474.namprd12.prod.outlook.com
 (2603:10b6:408:46::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2008.16; Fri, 28 Jun
 2019 03:31:20 +0000
Received: from BY2NAM03FT003.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by MWHPR1201CA0017.outlook.office365.com
 (2603:10b6:301:4a::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2008.16 via Frontend
 Transport; Fri, 28 Jun 2019 03:31:19 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT003.mail.protection.outlook.com (10.152.84.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2032.15 via Frontend Transport; Fri, 28 Jun 2019 03:31:18 +0000
Received: from build-machine.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 27 Jun 2019
 22:31:17 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: fix MGPU fan boost enablement for XGMI reset
Date: Fri, 28 Jun 2019 11:31:12 +0800
Message-ID: <20190628033112.12099-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(136003)(376002)(2980300002)(428003)(199004)(189003)(50226002)(44832011)(486006)(126002)(5660300002)(70586007)(53936002)(8676002)(1076003)(8936002)(6916009)(305945005)(2351001)(6666004)(81166006)(81156014)(70206006)(426003)(86362001)(336012)(476003)(2616005)(356004)(26005)(68736007)(7696005)(186003)(51416003)(50466002)(72206003)(2870700001)(36756003)(53416004)(316002)(48376002)(478600001)(4326008)(47776003)(77096007)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3474; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45212eee-1067-42b8-7cda-08d6fb791599
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN8PR12MB3474; 
X-MS-TrafficTypeDiagnostic: BN8PR12MB3474:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3474519C5ACD6BD696579B85E4FC0@BN8PR12MB3474.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-Forefront-PRVS: 00826B6158
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 6AgZIhjJhJjXNkF3WxkT+gO3sc+5l1GTFmmQ8NnudFoW4EybDI0DanRDlr50s1P2SCk37Wbs9eyC5PqfRqB9z15SZMBU7epePFaq9BNTnoDwo89SNPRANrSQKTuxL81Yk83r4INvWXT4uqEWDueWdHzIAG4lLU2peDtcNNcrUkWbaPcPUBCXPr59sDIl3xc9tbENhziN0jMrT8ZIk05Zll8su6CadYK0sobkhuqwT8cOE2Yc16j4GzCAZOqbaY0SMCuFFKmMYWTluyvifJOlQzAqUgTeU4jcPP2t4wZJ/Bd2DR4HQYcHvFmBMikSk6qfE0D/mYsld7IdkQcEa8nRd4p3mcTSmfUGr4TUmdmYZ2djIQEJQE6Q2+Wj6KHfJ1fXqN3NIwJH3Fzt3m5GoQESUctXdzHmdIwGeJWNSbzfqKU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2019 03:31:18.9817 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45212eee-1067-42b8-7cda-08d6fb791599
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3474
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUB4DMDhtWr5+schKivrs2cjtA7KlTHimQgwwZSLdxE=;
 b=L7Mg0+YRyFES4ge3ys+ocZGo8wEAvBuIwtIv8SFSBeVl6c8KTUGo575mBL+Icl1xRosvDfmy7FPZorU9atKTaW60l79F22YMrBu2pan8fh21hVJBOQNRd2uMfwQ37STLDiKBibpgb0ZmkhmKG2lffGIo6HItji9JzE+fNOByyZM=
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
Cc: Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

TUdQVSBmYW4gYm9vc3QgZmVhdHVyZSBzaG91bGQgbm90IGJlIGVuYWJsZWQgdW50aWwgYWxsIHRo
ZQpkZXZpY2VzIGZyb20gdGhlIHNhbWUgaGl2ZSBhcmUgYWxsIGJhY2sgZnJvbSByZXNldC4KCkNo
YW5nZS1JZDogSTAzYTY5NDM0ZmYyOGY0ZWFjMjA5YmQ5MTMyMGRkZThhMjM4YTMzY2YKU2lnbmVk
LW9mZi1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHUuaCAgICAgICAgfCAgNCArKysrCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCAxMyArKysrKysrKysrKysrCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMgICAgfCAgNCArKy0tCiAzIGZpbGVzIGNoYW5n
ZWQsIDE5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHUuaAppbmRleCA3NTQxZTFiMDc2YjAuLjllZmEwNDIzYzI0MiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1LmgKQEAgLTEyMTksNiArMTIxOSwxMCBAQCBpbnQgYW1kZ3B1X2Rt
X2Rpc3BsYXlfcmVzdW1lKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ICk7CiBzdGF0aWMgaW5s
aW5lIGludCBhbWRncHVfZG1fZGlzcGxheV9yZXN1bWUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpIHsgcmV0dXJuIDA7IH0KICNlbmRpZgogCisKK3ZvaWQgYW1kZ3B1X3JlZ2lzdGVyX2dwdV9p
bnN0YW5jZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7Cit2b2lkIGFtZGdwdV91bnJlZ2lz
dGVyX2dwdV9pbnN0YW5jZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7CisKICNpbmNsdWRl
ICJhbWRncHVfb2JqZWN0LmgiCiAKIC8qIHVzZWQgYnkgZGZfdjNfNi5jIGFuZCBhbWRncHVfcG11
LmMgKi8KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZp
Y2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwppbmRleCBh
MmQyMzRjMDdmYzQuLmYzOWViN2IzN2M4YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9kZXZpY2UuYwpAQCAtMzU1OCw2ICszNTU4LDEyIEBAIHN0YXRpYyBpbnQgYW1kZ3B1
X2RvX2FzaWNfcmVzZXQoc3RydWN0IGFtZGdwdV9oaXZlX2luZm8gKmhpdmUsCiAJCQkJaWYgKHZy
YW1fbG9zdCkKIAkJCQkJYW1kZ3B1X2RldmljZV9maWxsX3Jlc2V0X21hZ2ljKHRtcF9hZGV2KTsK
IAorCQkJCS8qCisJCQkJICogQWRkIHRoaXMgQVNJQyBhcyB0cmFja2VkIGFzIHJlc2V0IHdhcyBh
bHJlYWR5CisJCQkJICogY29tcGxldGUgc3VjY2Vzc2Z1bGx5LgorCQkJCSAqLworCQkJCWFtZGdw
dV9yZWdpc3Rlcl9ncHVfaW5zdGFuY2UodG1wX2FkZXYpOworCiAJCQkJciA9IGFtZGdwdV9kZXZp
Y2VfaXBfbGF0ZV9pbml0KHRtcF9hZGV2KTsKIAkJCQlpZiAocikKIAkJCQkJZ290byBvdXQ7CkBA
IC0zNjkyLDYgKzM2OTgsMTMgQEAgaW50IGFtZGdwdV9kZXZpY2VfZ3B1X3JlY292ZXIoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCWRldmljZV9saXN0X2hhbmRsZSA9ICZkZXZpY2VfbGlz
dDsKIAl9CiAKKwkvKgorCSAqIE1hcmsgdGhlc2UgQVNJQ3MgdG8gYmUgcmVzZXRlZCBhcyB1bnRy
YWNrZWQgZmlyc3QKKwkgKiBBbmQgYWRkIHRoZW0gYmFjayBhZnRlciByZXNldCBjb21wbGV0ZWQK
KwkgKi8KKwlsaXN0X2Zvcl9lYWNoX2VudHJ5KHRtcF9hZGV2LCBkZXZpY2VfbGlzdF9oYW5kbGUs
IGdtYy54Z21pLmhlYWQpCisJCWFtZGdwdV91bnJlZ2lzdGVyX2dwdV9pbnN0YW5jZSh0bXBfYWRl
dik7CisKIAkvKiBibG9jayBhbGwgc2NoZWR1bGVycyBhbmQgcmVzZXQgZ2l2ZW4gam9iJ3Mgcmlu
ZyAqLwogCWxpc3RfZm9yX2VhY2hfZW50cnkodG1wX2FkZXYsIGRldmljZV9saXN0X2hhbmRsZSwg
Z21jLnhnbWkuaGVhZCkgewogCQlmb3IgKGkgPSAwOyBpIDwgQU1ER1BVX01BWF9SSU5HUzsgKytp
KSB7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMKaW5kZXggZWQwNTFmZGI1
MDlmLi5lMmM5ZDhkMzFlZDggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9rbXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21z
LmMKQEAgLTQxLDcgKzQxLDcgQEAKICNpbmNsdWRlICJhbWRncHVfZGlzcGxheS5oIgogI2luY2x1
ZGUgImFtZGdwdV9yYXMuaCIKIAotc3RhdGljIHZvaWQgYW1kZ3B1X3VucmVnaXN0ZXJfZ3B1X2lu
c3RhbmNlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQordm9pZCBhbWRncHVfdW5yZWdpc3Rl
cl9ncHVfaW5zdGFuY2Uoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7CiAJc3RydWN0IGFt
ZGdwdV9ncHVfaW5zdGFuY2UgKmdwdV9pbnN0YW5jZTsKIAlpbnQgaTsKQEAgLTEwMiw3ICsxMDIs
NyBAQCB2b2lkIGFtZGdwdV9kcml2ZXJfdW5sb2FkX2ttcyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
KQogCWRldi0+ZGV2X3ByaXZhdGUgPSBOVUxMOwogfQogCi1zdGF0aWMgdm9pZCBhbWRncHVfcmVn
aXN0ZXJfZ3B1X2luc3RhbmNlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQordm9pZCBhbWRn
cHVfcmVnaXN0ZXJfZ3B1X2luc3RhbmNlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogewog
CXN0cnVjdCBhbWRncHVfZ3B1X2luc3RhbmNlICpncHVfaW5zdGFuY2U7CiAKLS0gCjIuMjEuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
