Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D890A0FC8
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 05:05:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D583A89F35;
	Thu, 29 Aug 2019 03:05:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700070.outbound.protection.outlook.com [40.107.70.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7CD789F35
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 03:05:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TpPbNGQ/JgaSkWxwnpF7q0CjeYHub9UkaYV3+jV6O00EdqP+zo3VoCkRGIbFANc6mzcYYH8JskOspfraFk8Z10T1CjNswRoaTmuN2p6E2LUl+MNoNbhIXJLBrSLmsYLHkDo4IIlp3OF2jhNg6lNrN7abLB5PL3T0eOwH6U/NJi1BbuSZpOfyzoyhE9gPM4FvCZNd9KTX0i2wsgMOkjzAnf4+rfadnN+3mP96a7ja2MX3mfndukmyfhvrjN7qdDyGZM2WJSyMgVCFAZXRvYQ8yyqC/BrN16i9SEdNPr7qGpA9QSDRmUseKKft7uD4z6vMrnZJwySvxz4cZ/sdUNHf4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQL928+bx2MyhvEKbXh4RiZLhpJXjqfJ/s2ddrnhR2s=;
 b=N/NhCZsZfv7bBhOsvXk9NS0kzb05GlXm62aPC6EAQMtS/Mut8CXTdXGI6CyAuo0PHpfBJ8tQDTnTCKqJuLdu9Qps1GXuOti3ViURMePZBUdpZSCQEdrq6mzzS87f9fOLffTIbUlPr761l+7JSuOxa82t0vrbvW+6nK0wYpash7+T4XnMVsGzHNe4xf4/fxbBCBIinxCK3aJvJWVolwzvI7xlCEih8xHkB9aVg2d6ZLLlYsRhYw1n1yNab+Ikn3wz4KWaw2Bk1K7T/r/QYpEU+XItcNeNz8EbvuExGnoozBG2H3GiBnwIDpDqqdnfH/1tRxhmshr5U5FN2Ix4U1eFBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from SN1PR12CA0066.namprd12.prod.outlook.com (2603:10b6:802:20::37)
 by CY4PR12MB1269.namprd12.prod.outlook.com (2603:10b6:903:40::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.21; Thu, 29 Aug
 2019 03:05:41 +0000
Received: from BY2NAM03FT014.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::202) by SN1PR12CA0066.outlook.office365.com
 (2603:10b6:802:20::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.15 via Frontend
 Transport; Thu, 29 Aug 2019 03:05:40 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT014.mail.protection.outlook.com (10.152.84.239) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Thu, 29 Aug 2019 03:05:40 +0000
Received: from rico-code.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 28 Aug 2019
 22:05:39 -0500
From: Tianci Yin <tianci.yin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdgpu: keep the stolen memory in visible vram region
Date: Thu, 29 Aug 2019 11:05:30 +0800
Message-ID: <1567047930-11912-2-git-send-email-tianci.yin@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567047930-11912-1-git-send-email-tianci.yin@amd.com>
References: <1567047930-11912-1-git-send-email-tianci.yin@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(346002)(136003)(2980300002)(428003)(199004)(189003)(26005)(305945005)(6916009)(16586007)(50466002)(48376002)(8936002)(50226002)(186003)(8676002)(316002)(81156014)(336012)(36756003)(426003)(81166006)(356004)(6666004)(47776003)(54906003)(11346002)(44832011)(486006)(2616005)(126002)(51416003)(7696005)(76176011)(86362001)(446003)(2906002)(4326008)(476003)(70586007)(70206006)(478600001)(53936002)(5660300002)(14444005)(2351001)(53416004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1269; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 035c32da-c728-4e90-50cd-08d72c2dc63e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:CY4PR12MB1269; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1269:
X-Microsoft-Antispam-PRVS: <CY4PR12MB12693E894D7326979D21B7FC95A20@CY4PR12MB1269.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-Forefront-PRVS: 0144B30E41
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 9SMk/JuReuH4Agg9zb0gXNpGKspkj9zjLlDTtw0Ih8LQAbGOfi+rO2uQsJFYTXH2AIZORpGIplDtZQSHMJhUXa1szxgR4EOnEar3FEVJNjGJpb4GCg/ZL10sUqbJGUg/R7aKGLlxbHKurcDPVCr46DHO60Mus/hyYrX9a85+iiAHMVxPXcl73LxKlduYlSzPvEW7uqGnEM3R9C9GTLSpiaQaRJ8PpWBGOfQ1aGQ2CyLCwDlVJa3nhEPYg32l2oMtDAg0SLwZa6cPhEd4NcWpQX4rDPY5jZb6ucrdkxgom1fMXxUF3eL4wMBRTtlMxtDhqgBparU2OfOmC/vqW6CPeF/bcRoD/E19mr5kcOjrFP0Auitoip449ME68nd5+woFXtM/6f/PP9J2Lnp3hHCHa7Mpizmv0eAMo8nuIlnC8Ko=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2019 03:05:40.5646 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 035c32da-c728-4e90-50cd-08d72c2dc63e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1269
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQL928+bx2MyhvEKbXh4RiZLhpJXjqfJ/s2ddrnhR2s=;
 b=3plcjbnZDGLQ3CGHUHmQxNJJQdtVg3Z5FQanHl2VQCcd4IUW0zCPndRp+lYJYEya/sQDWHApM5I3SZpyY0+81G3WpHWzHrOqP6DrpAwzTUn3TOc9ue5dbh9OtVPVqHLwUm5A3At1JbqUaYdwwLUPq/LT98iROE+GZQFh7b3RdLs=
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
Cc: Feifei Xu <Feifei.Xu@amd.com>, "Le
 . Ma" <Le.Ma@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Tianci Yin <tianci.yin@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogIlRpYW5jaS5ZaW4iIDx0aWFuY2kueWluQGFtZC5jb20+CgpzdG9sZW4gbWVtb3J5IHNo
b3VsZCBiZSBmaXhlZCBpbiB2aXNpYmxlIHJlZ2lvbi4KCkNoYW5nZS1JZDogSWNiYmJkMzlmZDEx
M2U5MzQyM2FhZDhkMjU1NWY0MDczYzA4MDIwZTUKU2lnbmVkLW9mZi1ieTogVGlhbmNpLllpbiA8
dGlhbmNpLnlpbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV90dG0uYyB8IDYgKysrKy0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5j
ICAgfCAzICsrLQogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCmluZGV4IDgwMWY5MTIu
LmRjZDMyZDAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90
dG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKQEAgLTE3
MzMsNiArMTczMyw3IEBAIGludCBhbWRncHVfdHRtX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpCiAJdWludDY0X3QgZ3R0X3NpemU7CiAJaW50IHI7CiAJdTY0IHZpc192cmFtX2xpbWl0
OworCXZvaWQgKnN0b2xlbl92Z2FfYnVmOwogCiAJbXV0ZXhfaW5pdCgmYWRldi0+bW1hbi5ndHRf
d2luZG93X2xvY2spOwogCkBAIC0xNzg3LDcgKzE3ODgsNyBAQCBpbnQgYW1kZ3B1X3R0bV9pbml0
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCXIgPSBhbWRncHVfYm9fY3JlYXRlX2tlcm5l
bChhZGV2LCBhZGV2LT5nbWMuc3RvbGVuX3NpemUsIFBBR0VfU0laRSwKIAkJCQkgICAgQU1ER1BV
X0dFTV9ET01BSU5fVlJBTSwKIAkJCQkgICAgJmFkZXYtPnN0b2xlbl92Z2FfbWVtb3J5LAotCQkJ
CSAgICBOVUxMLCBOVUxMKTsKKwkJCQkgICAgTlVMTCwgJnN0b2xlbl92Z2FfYnVmKTsKIAlpZiAo
cikKIAkJcmV0dXJuIHI7CiAJRFJNX0lORk8oImFtZGdwdTogJXVNIG9mIFZSQU0gbWVtb3J5IHJl
YWR5XG4iLApAQCAtMTg1MSw4ICsxODUyLDkgQEAgaW50IGFtZGdwdV90dG1faW5pdChzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldikKICAqLwogdm9pZCBhbWRncHVfdHRtX2xhdGVfaW5pdChzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHsKKwl2b2lkICpzdG9sZW5fdmdhX2J1ZjsKIAkvKiBy
ZXR1cm4gdGhlIFZHQSBzdG9sZW4gbWVtb3J5IChpZiBhbnkpIGJhY2sgdG8gVlJBTSAqLwotCWFt
ZGdwdV9ib19mcmVlX2tlcm5lbCgmYWRldi0+c3RvbGVuX3ZnYV9tZW1vcnksIE5VTEwsIE5VTEwp
OworCWFtZGdwdV9ib19mcmVlX2tlcm5lbCgmYWRldi0+c3RvbGVuX3ZnYV9tZW1vcnksIE5VTEws
ICZzdG9sZW5fdmdhX2J1Zik7CiB9CiAKIC8qKgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ21jX3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192
OV8wLmMKaW5kZXggZjc3MTM4Yi4uYWI0M2FlMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ21jX3Y5XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
bWNfdjlfMC5jCkBAIC0xMjQ4LDYgKzEyNDgsNyBAQCBzdGF0aWMgaW50IGdtY192OV8wX3N3X2lu
aXQodm9pZCAqaGFuZGxlKQogc3RhdGljIGludCBnbWNfdjlfMF9zd19maW5pKHZvaWQgKmhhbmRs
ZSkKIHsKIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqKWhhbmRsZTsKKwl2b2lkICpzdG9sZW5fdmdhX2J1ZjsKIAogCWlmIChhbWRncHVfcmFzX2lz
X3N1cHBvcnRlZChhZGV2LCBBTURHUFVfUkFTX0JMT0NLX19VTUMpICYmCiAJCQlhZGV2LT5nbWMu
dW1jX3Jhc19pZikgewpAQCAtMTI4MCw3ICsxMjgxLDcgQEAgc3RhdGljIGludCBnbWNfdjlfMF9z
d19maW5pKHZvaWQgKmhhbmRsZSkKIAlhbWRncHVfdm1fbWFuYWdlcl9maW5pKGFkZXYpOwogCiAJ
aWYgKGdtY192OV8wX2tlZXBfc3RvbGVuX21lbW9yeShhZGV2KSkKLQkJYW1kZ3B1X2JvX2ZyZWVf
a2VybmVsKCZhZGV2LT5zdG9sZW5fdmdhX21lbW9yeSwgTlVMTCwgTlVMTCk7CisJCWFtZGdwdV9i
b19mcmVlX2tlcm5lbCgmYWRldi0+c3RvbGVuX3ZnYV9tZW1vcnksIE5VTEwsICZzdG9sZW5fdmdh
X2J1Zik7CiAKIAlhbWRncHVfZ2FydF90YWJsZV92cmFtX2ZyZWUoYWRldik7CiAJYW1kZ3B1X2Jv
X2ZpbmkoYWRldik7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
