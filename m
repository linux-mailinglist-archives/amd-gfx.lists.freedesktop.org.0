Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7584926FB
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 16:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 630F16E16B;
	Mon, 19 Aug 2019 14:36:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800073.outbound.protection.outlook.com [40.107.80.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D96A6E171
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 14:35:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S0mztLgb2t+GL79urp/WghBCv4AwEUxt69DUaoIHUknBizjFCgI84XoezMpurFgssqvJe6kA6pH4mTEKdsZQI8B0hNxwcDneifPRfALSQMc8zONgs9ITUMS4ZfXGUJTtFG/O5W+AVJpXjkY0ACUH9k3+Q+b9cPmpemlPymADSECxtvd1s9SZdpFWo8xnX24w0+DHdEWak2l0b2rIe6uj+zCKDJE3qCBCTYtbk14lkoZC4kCsDRUE5/WGHefHWdQhGJ4Or3qbIwYr3BPGwwKNjusg19ynRFK7hP2CvmwxjT7Znex7pUdb9hRTAJdLGIL4Q8bTLLOMQv1lmO69HlkDaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/XaEaHCc6ZTycjxhNRCkkBxQIgfDISncFbbZnOifK8=;
 b=e90QYgxR0WhmLTldBMksT1prmzstRxn0goLCoTumzFPMLWobMROHc4NlGFikDPuuYeELU16Q8SH6Oz1wNznBXzC/b5EvZe2Ubm8qr6IOSjhZtr62rtqE+8cgG+2o1XwU+WbG9YkRk/BFHbDMET5br70gGIrFY7vQ008MlfaDoMbYMDCYKKCfusd3KNYm8P0lfYsyCuc/cQCxYY2f+DMKIBEzArqxEjx9NbM3Vrxm9ERGZrrTeX2onQJeo6e3W0uIryv24TAKs6D+7TtWEcdWr35i65a4xH/tfnayHl+Bm98LSdoa1wvoMoAxysdLnTHMXr8lvJePL5wDqIETGmwIYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR12CA0032.namprd12.prod.outlook.com (2603:10b6:405:70::18)
 by DM5PR12MB1529.namprd12.prod.outlook.com (2603:10b6:4:3::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Mon, 19 Aug 2019 14:35:56 +0000
Received: from BY2NAM03FT016.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by BN6PR12CA0032.outlook.office365.com
 (2603:10b6:405:70::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 14:35:56 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT016.mail.protection.outlook.com (10.152.84.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 14:35:56 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 19 Aug 2019
 09:35:46 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 21/36] drm/amd/display: Fix number of slices not being checked
 for dsc
Date: Mon, 19 Aug 2019 10:35:00 -0400
Message-ID: <20190819143515.21653-22-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
References: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(396003)(39860400002)(2980300002)(428003)(199004)(189003)(70206006)(47776003)(86362001)(2906002)(305945005)(1076003)(5660300002)(53416004)(2351001)(36756003)(16586007)(186003)(50466002)(478600001)(48376002)(81156014)(76176011)(81166006)(8936002)(8676002)(53936002)(14444005)(50226002)(126002)(2616005)(356004)(6666004)(446003)(11346002)(486006)(336012)(316002)(426003)(476003)(4326008)(6916009)(51416003)(26005)(7696005)(70586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1529; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80c6367a-d4dd-4f29-d3e6-08d724b28bbd
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1529; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1529:
X-Microsoft-Antispam-PRVS: <DM5PR12MB152972DA01EC2BCF0850160FF9A80@DM5PR12MB1529.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: uZb/aLqhFABuEez/lo2VbpxFoXaOXReN4nwbnisUN40NiVfnENiMu12lFcY5PtS0+O7JXyS0DiPxa7qIOtlwG2cB/nZTa+k7RChd7IMh4Gi2LSnRfitpL3ipizD84+GVZBVuiR6ykuUXCLyaR4Grtzb3HxkD0SnjgtmZ5kvC4j7Zz6fDhZk9UM3CQyaIWmYOho348ADKzEsJoGTDO1wH93sDkMU8sMX3VZ4ucOujqF48JH8TkFZyAxKPzcneXNtKJdiTok0RjNuMJMvnCR0psFkTrEuFoy6hmg/BpMFTtr8PT5ZgnBrUzm8mHAwfc535m4XGQhkmEt8VGO1OcWxK3GV3UsIPxfPMDFL3h62HvP3EWVZmMMxBW2LQQNnuqGKD9ZuSNsLHfEQj/I3MHnYHFmUzII6kWX7IvvM8QI83Z0I=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 14:35:56.1785 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80c6367a-d4dd-4f29-d3e6-08d724b28bbd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1529
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/XaEaHCc6ZTycjxhNRCkkBxQIgfDISncFbbZnOifK8=;
 b=VSFydkfaOarYBSohhIdbIvey7smbtzjHiaT1VoTABFscdADysAlMzgVbnTzfMkbpXQlIpoAk2Sze1hySIrf7a80GiJDqGfKWPYvVzwbMF8SUfcTraAPL8FoP2H40GAOBJwr+FhbLpzN9F8+IZ8RsEwEO1qwgBrDou+y3/nkfok0=
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
Cc: Nikola Cornij <nikola.cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTmlrb2xhIENvcm5paiA8bmlrb2xhLmNvcm5pakBhbWQuY29tPgoKW3doeV0KbnVtX3Ns
aWNlc19oIHdhcyBub3QgYmVpbmcgY2hlY2tlZAoKW0hvd10KRml4IHRoZSB0eXBvIGFuZCBjaGVj
ayBudW1fc2xpY2VzX2gKClNpZ25lZC1vZmYtYnk6IE5pa29sYSBDb3JuaWogPG5pa29sYS5jb3Ju
aWpAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxIYXJyeS5XZW50bGFuZEBh
bWQuY29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFt
ZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2Rz
Yy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIw
X2RzYy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2RzYy5j
CmluZGV4IGM0Zjg2MWU2YmQ1My4uMWI0MTk0MDdhZjk0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfZHNjLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2RzYy5jCkBAIC0zMjIsNyArMzIyLDcgQEAg
c3RhdGljIGJvb2wgZHNjX3ByZXBhcmVfY29uZmlnKGNvbnN0IHN0cnVjdCBkc2NfY29uZmlnICpk
c2NfY2ZnLCBzdHJ1Y3QgZHNjX3JlZ18KIAkJICAgIGRzY19jZmctPmRjX2RzY19jZmcubGluZWJ1
Zl9kZXB0aCA9PSAwKSkpOwogCUFTU0VSVCg5NiA8PSBkc2NfY2ZnLT5kY19kc2NfY2ZnLmJpdHNf
cGVyX3BpeGVsICYmIGRzY19jZmctPmRjX2RzY19jZmcuYml0c19wZXJfcGl4ZWwgPD0gMHgzZmYp
OyAvLyA2LjAgPD0gYml0c19wZXJfcGl4ZWwgPD0gNjMuOTM3NQogCi0JaWYgKCFkc2NfY2ZnLT5k
Y19kc2NfY2ZnLm51bV9zbGljZXNfdiB8fCAhZHNjX2NmZy0+ZGNfZHNjX2NmZy5udW1fc2xpY2Vz
X3YgfHwKKwlpZiAoIWRzY19jZmctPmRjX2RzY19jZmcubnVtX3NsaWNlc192IHx8ICFkc2NfY2Zn
LT5kY19kc2NfY2ZnLm51bV9zbGljZXNfaCB8fAogCQkhKGRzY19jZmctPmRjX2RzY19jZmcudmVy
c2lvbl9taW5vciA9PSAxIHx8IGRzY19jZmctPmRjX2RzY19jZmcudmVyc2lvbl9taW5vciA9PSAy
KSB8fAogCQkhZHNjX2NmZy0+cGljX3dpZHRoIHx8ICFkc2NfY2ZnLT5waWNfaGVpZ2h0IHx8CiAJ
CSEoKGRzY19jZmctPmRjX2RzY19jZmcudmVyc2lvbl9taW5vciA9PSAxICYmIC8vIHYxLjEgbGlu
ZSBidWZmZXIgZGVwdGggcmFuZ2U6Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
