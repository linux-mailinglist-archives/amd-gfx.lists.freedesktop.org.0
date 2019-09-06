Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C82ABBFA
	for <lists+amd-gfx@lfdr.de>; Fri,  6 Sep 2019 17:13:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADED56E2E1;
	Fri,  6 Sep 2019 15:13:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700065.outbound.protection.outlook.com [40.107.70.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B69A6E2E1
 for <amd-gfx@lists.freedesktop.org>; Fri,  6 Sep 2019 15:13:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fRTC98LLptJy2gNtilYpWDCEhg8NNoSWLTokTRoVR6D9kG0cg57gupaSBcaM+VafgWj0oXJ5OUmABMN0dmVZssvjRQji1rEIKgAhkORQJ5eLR3Ncl3TBJPnP8hoy1tAvXqsJT5QMJE8fVtzzXNPUl/8/dOEbSsJqgJYWmmgAbyd1CxhwVNlbUF6hz0GkzEOvoyhliUlH9EpGBJT2EXWraC7PwS9cclWLxFB+e2Ll8aS4tOTVbVUEgebHCF8d4MTUJ/R0iNBlCgeYYxx62TgJHKKhdF2UV0PGr53vSYf4ukjh2NyWsLYA2eUrCOeXDuypvJmkSO+KXBl5JLcSnfLWkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ALMWSnbzUfNIYnIuFATKDqKPdgfLGSMjCFlo603qXGc=;
 b=Jj/au4AAeCcAUDyX9h9offV0bvMR9Pv5iffvD9XHXlP3RWQtssiFjnUgUt5D/8ltKFRQho0BTNHmwEU9mW3nbKOuDraSXbi8c348ZoCv8+Je9/qj2Ozfab+Fo5PeFPdwCznN4GKuNfyWxuqbCFJIw8Z4dTjXfMJSoIPJg824lpv6wzIOb0lfUIhpO5IfibbeTxW6nB61I3fexa8gnUHWxiwrTKTCmoBWBsRTX2Aqn+Uie4vGGjPFcwJGBPWpG+ueNj2F/8IAera0wTEsrvqyvo4qxc8rDDvSg+GILwCRVS7jWTzmajGHuw5pPK4dhfOVMn2dO2qXEyNDgNHhr0ouXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0044.namprd12.prod.outlook.com (2603:10b6:0:56::12) by
 BN6PR1201MB0097.namprd12.prod.outlook.com (2603:10b6:405:54::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.15; Fri, 6 Sep
 2019 15:13:37 +0000
Received: from BY2NAM03FT007.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::207) by DM3PR12CA0044.outlook.office365.com
 (2603:10b6:0:56::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.14 via Frontend
 Transport; Fri, 6 Sep 2019 15:13:37 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT007.mail.protection.outlook.com (10.152.84.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Fri, 6 Sep 2019 15:13:36 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Fri, 6 Sep 2019 10:13:34 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Allow to reset to EERPOM table.
Date: Fri, 6 Sep 2019 11:13:30 -0400
Message-ID: <1567782810-22378-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(346002)(396003)(2980300002)(428003)(199004)(189003)(16586007)(316002)(51416003)(70586007)(70206006)(54906003)(2906002)(7696005)(6916009)(50466002)(48376002)(47776003)(4326008)(26005)(53936002)(2616005)(186003)(8936002)(81166006)(81156014)(8676002)(50226002)(2351001)(44832011)(426003)(53416004)(486006)(126002)(476003)(478600001)(14444005)(86362001)(336012)(36756003)(5660300002)(305945005)(356004)(6666004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0097; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93da5ec5-c5f5-4cf8-c96e-08d732dcca8e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BN6PR1201MB0097; 
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0097:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB00972BCA287F9939CA96FFDDEABA0@BN6PR1201MB0097.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-Forefront-PRVS: 0152EBA40F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: NZFOW+RBAI18UGuaqkk1nlD3ubuGi+BXvGz39TCgTyzTtMm9gSlnnJ5mI5+AbA765IikhcUUWO0D4skJwqKMCTOchQB8o05D6+GFPYDzYe8B8ZgX+vXJy4I87tNUadHVEzX3lcmesrYIR+QhY3/qFqLIsKm6motkK3arA5bspAUwFjnDT1YPBFEG4So9qA+FIO3FuQSWrVlEV3iqGpdA2tYsnBHLlgVPFKYy6A1TZqDAX/b71GjuRRznBJDre7HkAVK+g/woogvFTRrX6PsqDXF0BLA/kygILm+evOaF/vr9OAZ59263b4agueKv0WdzLq5FcNsnKb7i8z/MvR2m/Qv8YCBRC3wEPYjEwXoytuxhm88cXsYEiOyXzw6XeWJ12evUlTfZvlQLHiyyqa/xuev6+Q01IoI/0lDvB1LCBp8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2019 15:13:36.7432 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93da5ec5-c5f5-4cf8-c96e-08d732dcca8e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0097
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ALMWSnbzUfNIYnIuFATKDqKPdgfLGSMjCFlo603qXGc=;
 b=hXPW+RPN6I6fwUnzVmD6P3OFJW8Yc3LihIxYM3dcOxGdoqLKgYT1yIjz6uPZjXXan7p/4EMMQMD9jlwfMBmj9MwoJyrt32CeJxWG83mgb6iP3/3oiIxIfvAqouU9GcO0NU+f5r8APD+EpsLPpGM25ECZ2u3PJ9uq9XGSmPROuCY=
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
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>, Tao.Zhou1@amd.com,
 Guchun.Chen@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIHRhYmxlIGdyb3dzIHF1aWNrbHkgZHVyaW5nIGRlYnVnL2RldmVsb3BtZW50IGVmZm9ydCB3
aGVuCm11bHRpcGxlIFJBUyBlcnJvcnMgYXJlIGluamVjdGVkLiBBbGxvdyB0byBhdm9pZCB0aGlz
IGJ5IHNldHRpbmcKdGFibGUgaGVhZGVyIGJhY2sgdG8gZW1wdHkgaWYgbmVlZGVkLgoKU2lnbmVk
LW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmggICAgICAgICAgICB8IDEgKwog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jICAgICAgICB8IDggKysrKysr
KysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXNfZWVwcm9tLmMgfCAzICsr
LQogMyBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmggYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaAppbmRleCAwZDExYWE4Li40MDVjNTVhIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaAorKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaApAQCAtMTY5LDYgKzE2OSw3IEBAIGV4dGVybiBpbnQg
YW1kZ3B1X2Rpc2NvdmVyeTsKIGV4dGVybiBpbnQgYW1kZ3B1X21lczsKIGV4dGVybiBpbnQgYW1k
Z3B1X25vcmV0cnk7CiBleHRlcm4gaW50IGFtZGdwdV9mb3JjZV9hc2ljX3R5cGU7CitleHRlcm4g
aW50IGFtZGdwdV9yYXNfZWVwcm9tX3Jlc2V0OwogCiAjaWZkZWYgQ09ORklHX0RSTV9BTURHUFVf
U0kKIGV4dGVybiBpbnQgYW1kZ3B1X3NpX3N1cHBvcnQ7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZHJ2LmMKaW5kZXggNWE3ZjkyOS4uNmUxMDFhNSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwpAQCAtMTQ1LDYgKzE0NSw3IEBAIGludCBhbWRncHVfZGlz
Y292ZXJ5ID0gLTE7CiBpbnQgYW1kZ3B1X21lcyA9IDA7CiBpbnQgYW1kZ3B1X25vcmV0cnkgPSAx
OwogaW50IGFtZGdwdV9mb3JjZV9hc2ljX3R5cGUgPSAtMTsKK2ludCBhbWRncHVfcmFzX2VlcHJv
bV9yZXNldCA9IC0xOwogCiBzdHJ1Y3QgYW1kZ3B1X21ncHVfaW5mbyBtZ3B1X2luZm8gPSB7CiAJ
Lm11dGV4ID0gX19NVVRFWF9JTklUSUFMSVpFUihtZ3B1X2luZm8ubXV0ZXgpLApAQCAtNTMwLDYg
KzUzMSwxMyBAQCBNT0RVTEVfUEFSTV9ERVNDKHJhc19tYXNrLCAiTWFzayBvZiBSQVMgZmVhdHVy
ZXMgdG8gZW5hYmxlIChkZWZhdWx0IDB4ZmZmZmZmZmYpLAogbW9kdWxlX3BhcmFtX25hbWVkKHJh
c19tYXNrLCBhbWRncHVfcmFzX21hc2ssIHVpbnQsIDA0NDQpOwogCiAvKioKKyAqIERPQzogcmFz
X2VlcHJvbV9yZXNldCAoaW50KQorICogUmVzZXQgRUVQUk9NIHRhYmxlIHRvIHplcnJvIGVudHJp
ZXMuCisgKi8KK01PRFVMRV9QQVJNX0RFU0MocmFzX2VlcHJvbV9yZXNldCwgIlJlc2V0IFJBUyBF
RVBST00gdGFibGUgdG8gemVycm8gZW50cmllcyAoMSA9IHJlc2V0LCAtMSA9IGF1dG8gKGRlZmF1
bHQgLSBkb24ndCByZXNldCkiKTsKK21vZHVsZV9wYXJhbV9uYW1lZChyYXNfZWVwcm9tX3Jlc2V0
LCBhbWRncHVfcmFzX2VlcHJvbV9yZXNldCwgaW50LCAwNDQ0KTsKKworLyoqCiAgKiBET0M6IHNp
X3N1cHBvcnQgKGludCkKICAqIFNldCBTSSBzdXBwb3J0IGRyaXZlci4gVGhpcyBwYXJhbWV0ZXIg
d29ya3MgYWZ0ZXIgc2V0IGNvbmZpZyBDT05GSUdfRFJNX0FNREdQVV9TSS4gRm9yIFNJIGFzaWMs
IHdoZW4gcmFkZW9uIGRyaXZlciBpcyBlbmFibGVkLAogICogc2V0IHZhbHVlIDAgdG8gdXNlIHJh
ZGVvbiBkcml2ZXIsIHdoaWxlIHNldCB2YWx1ZSAxIHRvIHVzZSBhbWRncHUgZHJpdmVyLiBUaGUg
ZGVmYXVsdCBpcyB1c2luZyByYWRlb24gZHJpdmVyIHdoZW4gaXQgYXZhaWxhYmxlLApkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhc19lZXByb20uYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXNfZWVwcm9tLmMKaW5kZXggNDNkZDRh
Yi4uNzVjNmZjMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3Jhc19lZXByb20uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFz
X2VlcHJvbS5jCkBAIC0xNDAsNyArMTQwLDggQEAgaW50IGFtZGdwdV9yYXNfZWVwcm9tX2luaXQo
c3RydWN0IGFtZGdwdV9yYXNfZWVwcm9tX2NvbnRyb2wgKmNvbnRyb2wpCiAKIAlfX2RlY29kZV90
YWJsZV9oZWFkZXJfZnJvbV9idWZmKGhkciwgJmJ1ZmZbMl0pOwogCi0JaWYgKGhkci0+aGVhZGVy
ID09IEVFUFJPTV9UQUJMRV9IRFJfVkFMKSB7CisJaWYgKGFtZGdwdV9yYXNfZWVwcm9tX3Jlc2V0
ICE9IDEgJiYKKwkgICAgaGRyLT5oZWFkZXIgPT0gRUVQUk9NX1RBQkxFX0hEUl9WQUwpIHsKIAkJ
Y29udHJvbC0+bnVtX3JlY3MgPSAoaGRyLT50Ymxfc2l6ZSAtIEVFUFJPTV9UQUJMRV9IRUFERVJf
U0laRSkgLwogCQkJCSAgICBFRVBST01fVEFCTEVfUkVDT1JEX1NJWkU7CiAJCURSTV9ERUJVR19E
UklWRVIoIkZvdW5kIGV4aXN0aW5nIEVFUFJPTSB0YWJsZSB3aXRoICVkIHJlY29yZHMiLAotLSAK
Mi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
