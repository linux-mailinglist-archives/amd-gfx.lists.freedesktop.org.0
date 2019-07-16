Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AF26A43B
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 10:51:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 825EA6E0CF;
	Tue, 16 Jul 2019 08:51:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820047.outbound.protection.outlook.com [40.107.82.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D982B6E0CF
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 08:51:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jihTVgDm6lkUyY1aIWE/LHsLMEpNWGvDVgC/j6dhXQJ0Rx77KTcJG6/nuSZOSi47NMsSreyynmGYy5hHIcgVg1/EvL6f+nc/OkXYWV+S6wjLnzDdak76L0he/M28ZL2EThM397Xw/wh6eNdQTTmplvWKsffAZdHJVdc4CIqiJmGdlogWooYuNjdWZrQ4CWNQahKOz6O7djFj0c3a+UJQtJn6jVSx7p17OdfZOjSV64b/3bFrO/XJ0qh2pMvmJA+lKme535DCYIR8bNDUBFpq5dyYmNAPaGhaN+PL7MG0gsZ3z00PlhHJsHQg7U3vHTWq15Z58u31sgY/4lvObwFfbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RY50NxwPnPmc/jsXZQrt9oCHrlcgJ5mKayNedrlndCk=;
 b=Y2lA3OxVYAZxqEzw9Rxbml1RF7SbnJZtcZBcMFAVwH85yTJIrsiMpvR5N4V/de2GobhR/mtwJYG9j6HhqtPWNMoJtIIB+y/2xRxTP4TxHnTR4VPE4PQ4QaLBOQv5ZSQflk3sQwJrjPqmL4ZW4nu7aV/x40N18dRDuXxaJAGj+IGUXlBf1qU5+FPC4OO3TffJqDlvPt+iXN601B1jqzgPTebyYRMTShWn6VZ/ODCueCCjkY5L6z+zQuSy4iLmBI0E9SNgg2bpDNqkc1hRqWNfj4zRN/eI9cTf40RqL7yrakezY5fPEr23TX7i6EHuG5Qpt4Vs2lJOeo3SRYCHq7UOKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from SN1PR12CA0086.namprd12.prod.outlook.com (2603:10b6:802:21::21)
 by MN2PR12MB3104.namprd12.prod.outlook.com (2603:10b6:208:cc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Tue, 16 Jul
 2019 08:51:06 +0000
Received: from BY2NAM03FT057.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::203) by SN1PR12CA0086.outlook.office365.com
 (2603:10b6:802:21::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.10 via Frontend
 Transport; Tue, 16 Jul 2019 08:51:06 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT057.mail.protection.outlook.com (10.152.85.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 16 Jul 2019 08:51:05 +0000
Received: from equan-buildpc.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 16 Jul 2019
 03:51:04 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amd/powerplay: maintain SMU FW backward compatibility
Date: Tue, 16 Jul 2019 16:50:48 +0800
Message-ID: <20190716085049.4613-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39860400002)(346002)(376002)(2980300002)(428003)(199004)(189003)(54906003)(47776003)(305945005)(68736007)(8936002)(50226002)(316002)(51416003)(336012)(7696005)(8676002)(186003)(2616005)(426003)(26005)(50466002)(48376002)(44832011)(2351001)(53936002)(70586007)(70206006)(81166006)(81156014)(36756003)(2906002)(6916009)(478600001)(86362001)(14444005)(53416004)(476003)(5660300002)(486006)(356004)(6666004)(1076003)(4326008)(2870700001)(126002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3104; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11d31d41-74f0-4ea5-e51a-08d709cabd59
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MN2PR12MB3104; 
X-MS-TrafficTypeDiagnostic: MN2PR12MB3104:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3104AC09E454314658077567E4CE0@MN2PR12MB3104.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-Forefront-PRVS: 0100732B76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: T9Gz1Bb2AJQ9ODCkDqKBw8+IAz7jvRlLQrtFbweZ1gSxPf4kji+NUptIjjA0Fj9ZnyYyRzGhhtpd1WHLpWBmqV2JbuRCrI2sdxkriRik47TQNEnN4/ItVHkGArmrwJqjmeUPsJNlqog8H6RryQXlzh+aift9l0OCr2sXUevg7RCWdzE1ZRCD8b7op02ntxoH5uHuz1yPjgCJMdoeIgPC5W50VChU8YzAxH0R1BF9NdBWn7lq0FQi7sN+AxSeJ2PiVWyQH/FBe3iN2q5+rt3V6C/g/hL9UmLWNIQqtSqumQTQpzyyPXL37DlZtEHReYIGVTFzwKQNCsykelfef0Qo2IKeaEv97zC5aiujaDsTD21ExncTJA6QlLCvrnCsKm5zsros76musXk+Ju00yhK6mH5ztlljOheQTjZRXkCJMmM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2019 08:51:05.9592 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11d31d41-74f0-4ea5-e51a-08d709cabd59
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3104
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RY50NxwPnPmc/jsXZQrt9oCHrlcgJ5mKayNedrlndCk=;
 b=ysmI23Kec7QMwdFobXFK1Xp7SWR0FIkA+p1gYl4wcc5muLT3EPTYPjLPz6683Yn4+8OGj3WKu5anwLbABgOOTQSUP8U/JYWMY75T71Q4t0CwFHPLim3mmSWslKCNA/EQUgGa21Jopbvx8cJ80N2w2g9fz7DbZF7ng8m2AEzyqNQ=
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
Cc: Alexander.Deucher@amd.com, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RG8gbm90IGhhbHQgZHJpdmVyIGxvYWRpbmcgb24gaWZfdmVyc2lvbiBtaXNtYXRjaC4gQXMgb3Vy
CmRyaXZlciBhbmQgRldzIGFyZSBiYWNrd2FyZCBjb21wYXRpYmxlLgoKQ2hhbmdlLUlkOiBJMDEy
NzEyMDJkMDhhNjJlNzc1ZWZhYmZiNjYzMTBmNmNjNzQyYjlkZApTaWduZWQtb2ZmLWJ5OiBFdmFu
IFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L3NtdV92MTFfMC5jIHwgMTIgKysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
c211X3YxMV8wLmMKaW5kZXggYmM0ZjhkZTYyOWI1Li4xMmM2NDgyZDM3ZjQgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jCkBAIC0yNjIsMTQgKzI2MiwyMCBAQCBz
dGF0aWMgaW50IHNtdV92MTFfMF9jaGVja19md192ZXJzaW9uKHN0cnVjdCBzbXVfY29udGV4dCAq
c211KQogCXNtdV9taW5vciA9IChzbXVfdmVyc2lvbiA+PiA4KSAmIDB4ZmY7CiAJc211X2RlYnVn
ID0gKHNtdV92ZXJzaW9uID4+IDApICYgMHhmZjsKIAotCisJLyoKKwkgKiAxLiBpZl92ZXJzaW9u
IG1pc21hdGNoIGlzIG5vdCBjcml0aWNhbCBhcyBvdXIgZncgaXMgZGVzaWduZWQKKwkgKiB0byBi
ZSBiYWNrd2FyZCBjb21wYXRpYmxlLgorCSAqIDIuIE5ldyBmdyB1c3VhbGx5IGJyaW5ncyBzb21l
IG9wdGltaXphdGlvbnMuIEJ1dCB0aGF0J3MgdmlzaWJsZQorCSAqIG9ubHkgb24gdGhlIHBhaXJl
ZCBkcml2ZXIuCisJICogQ29uc2lkZXJpbmcgYWJvdmUsIHdlIGp1c3QgbGVhdmUgdXNlciBhIHdh
cm5pbmcgbWVzc2FnZSBpbnN0ZWFkCisJICogb2YgaGFsdCBkcml2ZXIgbG9hZGluZy4KKwkgKi8K
IAlpZiAoaWZfdmVyc2lvbiAhPSBzbXUtPnNtY19pZl92ZXJzaW9uKSB7CiAJCXByX2luZm8oInNt
dSBkcml2ZXIgaWYgdmVyc2lvbiA9IDB4JTA4eCwgc211IGZ3IGlmIHZlcnNpb24gPSAweCUwOHgs
ICIKIAkJCSJzbXUgZncgdmVyc2lvbiA9IDB4JTA4eCAoJWQuJWQuJWQpXG4iLAogCQkJc211LT5z
bWNfaWZfdmVyc2lvbiwgaWZfdmVyc2lvbiwKIAkJCXNtdV92ZXJzaW9uLCBzbXVfbWFqb3IsIHNt
dV9taW5vciwgc211X2RlYnVnKTsKLQkJcHJfZXJyKCJTTVUgZHJpdmVyIGlmIHZlcnNpb24gbm90
IG1hdGNoZWRcbiIpOwotCQlyZXQgPSAtRUlOVkFMOworCQlwcl93YXJuKCJTTVUgZHJpdmVyIGlm
IHZlcnNpb24gbm90IG1hdGNoZWRcbiIpOwogCX0KIAogCXJldHVybiByZXQ7Ci0tIAoyLjIxLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
