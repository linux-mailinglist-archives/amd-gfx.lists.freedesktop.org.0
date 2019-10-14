Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4315D59E5
	for <lists+amd-gfx@lfdr.de>; Mon, 14 Oct 2019 05:21:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 444ED6E1D8;
	Mon, 14 Oct 2019 03:21:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680067.outbound.protection.outlook.com [40.107.68.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4156E1D3
 for <amd-gfx@lists.freedesktop.org>; Mon, 14 Oct 2019 03:21:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fUOnXyPOZZ8RbApV6zRsSgeAr/ZsuXBGI3s7ch0maGhW2BP18TIR0JVcpC2YzqSP7U7B0zwPFskUXKIb3L7JJ0ocGHZDcQUbNJegTu2i2A/dBzc7LFEvgUtIXJ6gT7PEZO9GkhgXi6Hh84GJFHPN9/2mPku0eJa5zDwCLpChO3zm3yMFAm3GAPEkO2XipBnOqDG8edqwdTU7Hew7J91qqKn+e+40bPsz7TJE1Unh1GmFnLe+/L1FxKJBODXHFd/cb6M0ISACf1wLzz4+CTB0sigS9yplDWKiQeQaBYgoAWnTLIWFGuQjuL8vWLwDs9cNvWqriLO632hsadhHjfa5HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=23Pz+EWuHI3Pa8GS2Dre5PL520C+n1H7Kp2IHZCGcKQ=;
 b=Kbanwe8ntQB9sJu3fHcEJa/07HToiiZX/Urj2Vjo18aamAMYxp6zTxY31JxP6yhUE7lCM4U/2z8S9UI14Ptke3pMBHmCscUtKC0NY2myrXmJJ28CkWqSEITqO8VzsGB9t6RtARxTZ1opAxB214d5FlzHyJjdsOQjGQtoP4cRq8DsQz2pnLlcaLSD/QbHAWEO4tvTySwD4ey7Fo/Km+hi7TvR0oF43qfsI6QyzFyzjCapKcv7K4Y1HW/ponGc8pQgQpM2uUfZr8LzHU/5ZZ+Vw/uwjNTdfsE42/0aF0/f6ASmJrCkWJAf6hxsVuCcMVenHTncoPwUKy14x650HO7B9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0137.namprd12.prod.outlook.com (2603:10b6:0:51::33) by
 CH2PR12MB4152.namprd12.prod.outlook.com (2603:10b6:610:a7::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.22; Mon, 14 Oct 2019 03:21:35 +0000
Received: from BY2NAM03FT022.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::203) by DM3PR12CA0137.outlook.office365.com
 (2603:10b6:0:51::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Mon, 14 Oct 2019 03:21:35 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BY2NAM03FT022.mail.protection.outlook.com (10.152.84.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2347.21 via Frontend Transport; Mon, 14 Oct 2019 03:21:34 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sun, 13 Oct
 2019 22:21:34 -0500
Received: from rico-code.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Sun, 13 Oct 2019 22:21:32 -0500
From: Tianci Yin <tianci.yin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 7/8] drm/amdgpu: reserve vram for memory training(v3)
Date: Mon, 14 Oct 2019 11:21:17 +0800
Message-ID: <20191014032118.14020-7-tianci.yin@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191014032118.14020-1-tianci.yin@amd.com>
References: <20191014032118.14020-1-tianci.yin@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(346002)(39860400002)(428003)(189003)(199004)(486006)(48376002)(51416003)(70586007)(7696005)(76176011)(53416004)(86362001)(2351001)(47776003)(50466002)(5660300002)(305945005)(70206006)(8676002)(126002)(476003)(81166006)(36756003)(2616005)(44832011)(81156014)(16586007)(316002)(6666004)(6916009)(1076003)(54906003)(50226002)(26005)(2906002)(478600001)(4326008)(186003)(11346002)(446003)(336012)(426003)(8936002)(356004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4152; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c58d05f5-051e-459b-f123-08d750559e11
X-MS-TrafficTypeDiagnostic: CH2PR12MB4152:
X-Microsoft-Antispam-PRVS: <CH2PR12MB4152AD2169FBBB649CDD8D2695900@CH2PR12MB4152.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 01901B3451
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z72+GhW/Ptfg1rcU7orLJNJxwyEsF/gdxkZgdkQPnm/p5k/gDvXxxdIgWcZRntmPtB8PgbmkWgNlAAwgGkB+WYVepHh/0ZsXi9GVMXbcZXa4bl5HLltMxxn1nYxWwfdCP7frq1ofn45csgkqC0Da5lBoIZ2kSkOCIEEUJvOXIdOL/1agHAxcqoYEfDOHfyx9+zzrNeMoVW6Vcc0ubFJrHsIjZIwoH4tiZ5RwGqB93rXRfgBBudyUkrjz5r1P0I/k3v2DHyWciQE0TXgjkr502x9DaBNcbxlPXfsh87qmoz2ezqfUfKDLfeIXOgPXLlslP/x287/Kj9tBc9d3pldbmH1xyPE1faiNrFb10HDePcMlP9Amu6gIpSJlsCssBe1hFOjHjY9T6+tqvNe4vJRaKHo/yXOduQMVl0HKELZoq6A=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2019 03:21:34.9321 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c58d05f5-051e-459b-f123-08d750559e11
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4152
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=23Pz+EWuHI3Pa8GS2Dre5PL520C+n1H7Kp2IHZCGcKQ=;
 b=WUgvIcvhhFOifHBUzCEC2b+RiGpAWXozsr8YepKhM4z0LrtTFsp+XIB0P9Rya6jfgYSJd6as0Vc1kZWR6YTk4JxQ7qxaDizEZVLaAbQ85T5ZTJJGlJlJeR8AYWeEI9SQ5VT2XSzDOVJpml6v5ghOkexEGzvaEqLdE8Ms4zM4Gks=
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
Cc: Deucher Alexander <Alexander.Deucher@amd.com>,
 Tuikov Luben <Luben.Tuikov@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Tianci Yin <tianci.yin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogIlRpYW5jaS5ZaW4iIDx0aWFuY2kueWluQGFtZC5jb20+CgptZW1vcnkgdHJhaW5pbmcg
dXNpbmcgc3BlY2lmaWMgZml4ZWQgdnJhbSBzZWdtZW50LCByZXNlcnZlIHRoZXNlCnNlZ21lbnRz
IGJlZm9yZSBhbnlvbmUgbWF5IGFsbG9jYXRlIGl0LgoKQ2hhbmdlLUlkOiBJMTQzNjc1NTgxM2E1
NjU2MDhhMjg1N2E2ODNmNTM1Mzc3NjIwYTYzNwpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBUaWFuY2kuWWluIDx0aWFu
Y2kueWluQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0
bS5jIHwgOTUgKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDk1IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKaW5kZXgg
MmU4NWE1MTU0Zjg3Li41Njc4MmIzZWQ5MzMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV90dG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdHRtLmMKQEAgLTE2NjcsNiArMTY2Nyw5MiBAQCBzdGF0aWMgaW50IGFtZGdwdV90dG1f
ZndfcmVzZXJ2ZV92cmFtX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCQkJCSAg
JmFkZXYtPmZ3X3ZyYW1fdXNhZ2UudmEpOwogfQogCisvKgorICogTWVtb3kgdHJhaW5pbmcgcmVz
ZXJ2YXRpb24gZnVuY3Rpb25zCisgKi8KKworLyoqCisgKiBhbWRncHVfdHRtX3RyYWluaW5nX3Jl
c2VydmVfdnJhbV9maW5pIC0gZnJlZSBtZW1vcnkgdHJhaW5pbmcgcmVzZXJ2ZWQgdnJhbQorICoK
KyAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIKKyAqCisgKiBmcmVlIG1lbW9yeSB0cmFp
bmluZyByZXNlcnZlZCB2cmFtIGlmIGl0IGhhcyBiZWVuIHJlc2VydmVkLgorICovCitzdGF0aWMg
aW50IGFtZGdwdV90dG1fdHJhaW5pbmdfcmVzZXJ2ZV92cmFtX2Zpbmkoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpCit7CisJc3RydWN0IHBzcF9tZW1vcnlfdHJhaW5pbmdfY29udGV4dCAqY3R4
ID0gJmFkZXYtPnBzcC5tZW1fdHJhaW5fY3R4OworCisJY3R4LT5pbml0ID0gUFNQX01FTV9UUkFJ
Tl9OT1RfU1VQUE9SVDsKKwlpZiAoY3R4LT5jMnBfYm8pIHsKKwkJYW1kZ3B1X2JvX2ZyZWVfa2Vy
bmVsKCZjdHgtPmMycF9ibywgTlVMTCwgTlVMTCk7CisJCWN0eC0+YzJwX2JvID0gTlVMTDsKKwl9
CisKKwlpZiAoY3R4LT5wMmNfYm8pIHsKKwkJYW1kZ3B1X2JvX2ZyZWVfa2VybmVsKCZjdHgtPnAy
Y19ibywgTlVMTCwgTlVMTCk7CisJCWN0eC0+cDJjX2JvID0gTlVMTDsKKwl9CisKKwlyZXR1cm4g
MDsKK30KKworLyoqCisgKiBhbWRncHVfdHRtX3RyYWluaW5nX3Jlc2VydmVfdnJhbV9pbml0IC0g
Y3JlYXRlIGJvIHZyYW0gcmVzZXJ2YXRpb24gZnJvbSBtZW1vcnkgdHJhaW5pbmcKKyAqCisgKiBA
YWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCisgKgorICogY3JlYXRlIGJvIHZyYW0gcmVzZXJ2
YXRpb24gZnJvbSBtZW1vcnkgdHJhaW5pbmcuCisgKi8KK3N0YXRpYyBpbnQgYW1kZ3B1X3R0bV90
cmFpbmluZ19yZXNlcnZlX3ZyYW1faW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKK3sK
KwlpbnQgcmV0OworCXN0cnVjdCBwc3BfbWVtb3J5X3RyYWluaW5nX2NvbnRleHQgKmN0eCA9ICZh
ZGV2LT5wc3AubWVtX3RyYWluX2N0eDsKKworCW1lbXNldChjdHgsIDAsIHNpemVvZigqY3R4KSk7
CisJaWYgKCFhZGV2LT5md192cmFtX3VzYWdlLm1lbV90cmFpbl9zdXBwb3J0KSB7CisJCURSTV9E
RUJVRygibWVtb3J5IHRyYWluaW5nIGRvZXMgbm90IHN1cHBvcnQhXG4iKTsKKwkJcmV0dXJuIDA7
CisJfQorCisJY3R4LT5jMnBfdHJhaW5fZGF0YV9vZmZzZXQgPSBhZGV2LT5md192cmFtX3VzYWdl
Lm1lbV90cmFpbl9mYl9sb2M7CisJY3R4LT5wMmNfdHJhaW5fZGF0YV9vZmZzZXQgPSAoYWRldi0+
Z21jLm1jX3ZyYW1fc2l6ZSAtIEdERFI2X01FTV9UUkFJTklOR19PRkZTRVQpOworCWN0eC0+dHJh
aW5fZGF0YV9zaXplID0gR0REUjZfTUVNX1RSQUlOSU5HX0RBVEFfU0laRV9JTl9CWVRFUzsKKwor
CURSTV9ERUJVRygidHJhaW5fZGF0YV9zaXplOiVsbHgscDJjX3RyYWluX2RhdGFfb2Zmc2V0OiVs
bHgsYzJwX3RyYWluX2RhdGFfb2Zmc2V0OiVsbHguXG4iLAorCQkgIGN0eC0+dHJhaW5fZGF0YV9z
aXplLAorCQkgIGN0eC0+cDJjX3RyYWluX2RhdGFfb2Zmc2V0LAorCQkgIGN0eC0+YzJwX3RyYWlu
X2RhdGFfb2Zmc2V0KTsKKworCXJldCA9IGFtZGdwdV9ib19jcmVhdGVfa2VybmVsX2F0KGFkZXYs
CisJCQkJCSBjdHgtPnAyY190cmFpbl9kYXRhX29mZnNldCwKKwkJCQkJIGN0eC0+dHJhaW5fZGF0
YV9zaXplLAorCQkJCQkgQU1ER1BVX0dFTV9ET01BSU5fVlJBTSwKKwkJCQkJICZjdHgtPnAyY19i
bywKKwkJCQkJIE5VTEwpOworCWlmIChyZXQpIHsKKwkJRFJNX0VSUk9SKCJhbGxvYyBwMmNfYm8g
ZmFpbGVkKCVkKSFcbiIsIHJldCk7CisJCWdvdG8gRXJyX291dDsKKwl9CisKKwlyZXQgPSBhbWRn
cHVfYm9fY3JlYXRlX2tlcm5lbF9hdChhZGV2LAorCQkJCQkgY3R4LT5jMnBfdHJhaW5fZGF0YV9v
ZmZzZXQsCisJCQkJCSBjdHgtPnRyYWluX2RhdGFfc2l6ZSwKKwkJCQkJIEFNREdQVV9HRU1fRE9N
QUlOX1ZSQU0sCisJCQkJCSAmY3R4LT5jMnBfYm8sCisJCQkJCSBOVUxMKTsKKwlpZiAocmV0KSB7
CisJCURSTV9FUlJPUigiYWxsb2MgYzJwX2JvIGZhaWxlZCglZCkhXG4iLCByZXQpOworCQlnb3Rv
IEVycl9vdXQ7CisJfQorCisJY3R4LT5pbml0ID0gUFNQX01FTV9UUkFJTl9SRVNFUlZFX1NVQ0NF
U1M7CisJcmV0dXJuIDA7CisKK0Vycl9vdXQ6CisJYW1kZ3B1X3R0bV90cmFpbmluZ19yZXNlcnZl
X3ZyYW1fZmluaShhZGV2KTsKKwlyZXR1cm4gcmV0OworfQorCiAvKioKICAqIGFtZGdwdV90dG1f
aW5pdCAtIEluaXQgdGhlIG1lbW9yeSBtYW5hZ2VtZW50ICh0dG0pIGFzIHdlbGwgYXMgdmFyaW91
cwogICogZ3R0L3ZyYW0gcmVsYXRlZCBmaWVsZHMuCkBAIC0xNzQwLDYgKzE4MjYsMTQgQEAgaW50
IGFtZGdwdV90dG1faW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJcmV0dXJuIHI7
CiAJfQogCisJLyoKKwkgKlRoZSByZXNlcnZlZCB2cmFtIGZvciBtZW1vcnkgdHJhaW5pbmcgbXVz
dCBiZSBwaW5uZWQgdG8gdGhlIHNwZWNpZmllZAorCSAqcGxhY2Ugb24gdGhlIFZSQU0sIHNvIHJl
c2VydmUgaXQgZWFybHkuCisJICovCisJciA9IGFtZGdwdV90dG1fdHJhaW5pbmdfcmVzZXJ2ZV92
cmFtX2luaXQoYWRldik7CisJaWYgKHIpCisJCXJldHVybiByOworCiAJLyogYWxsb2NhdGUgbWVt
b3J5IGFzIHJlcXVpcmVkIGZvciBWR0EKIAkgKiBUaGlzIGlzIHVzZWQgZm9yIFZHQSBlbXVsYXRp
b24gYW5kIHByZS1PUyBzY2Fub3V0IGJ1ZmZlcnMgdG8KIAkgKiBhdm9pZCBkaXNwbGF5IGFydGlm
YWN0cyB3aGlsZSB0cmFuc2l0aW9uaW5nIGJldHdlZW4gcHJlLU9TCkBAIC0xODQyLDYgKzE5MzYs
NyBAQCB2b2lkIGFtZGdwdV90dG1fZmluaShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJ
cmV0dXJuOwogCiAJYW1kZ3B1X3R0bV9kZWJ1Z2ZzX2ZpbmkoYWRldik7CisJYW1kZ3B1X3R0bV90
cmFpbmluZ19yZXNlcnZlX3ZyYW1fZmluaShhZGV2KTsKIAlhbWRncHVfdHRtX2Z3X3Jlc2VydmVf
dnJhbV9maW5pKGFkZXYpOwogCWlmIChhZGV2LT5tbWFuLmFwZXJfYmFzZV9rYWRkcikKIAkJaW91
bm1hcChhZGV2LT5tbWFuLmFwZXJfYmFzZV9rYWRkcik7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
