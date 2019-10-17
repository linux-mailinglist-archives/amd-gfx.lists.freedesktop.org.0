Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02098DB748
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 21:16:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F24FF6EAC4;
	Thu, 17 Oct 2019 19:16:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780079.outbound.protection.outlook.com [40.107.78.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA9A06EAD0
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 19:15:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8lh9fb1Bdkp58Qxer4E8xGiO6MA7Qnynz99FqslU+iPWAAZsiaMg0dFDmtvidnEp05xO7pBoE758EvAXOoJ7zIqU79dw8k/+Hvb9NSoh0WKLzUeiQe58M5UC++0cePPu0Xj3rWoqwgpvmb+dSMVloZp4b7tFZzCetHh4+2RyrGihkbxIzT1eAIcwXuxLDkWroJ4kWXTNnPpr/Ku5vf+0wH9nTPKudUr7Chmxy9XLO3YSNneq6H3JmAUpNxVCC4DasFoTMFg3JxoZrldm6mBql00UuDfy6eo08I+8i3tCrbYkr2rLs1RVmf0xeg0+DosE05DAjcCltXRqpbkHyQLyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2iv7GuqBT55zap+R8a1BogzhB9H0YPpwl4aR8LOW3S4=;
 b=UgAeRLKEN3uDjPtiq9yobkNvITb3CucXeoD3z7pl9ww4zGp4MRN7mYIBzCOupRIcLGXUITQRSUnLgFHMuUuTWTonuaRjQUow2zF/gg9G7oAusBwuzShmT2Jb0EuZv3oGb/qYf0dTXOhOEUT0lELtqPQrnz9czNpIWzeEihCir2DEqiWpA5GTBHYmCgf+K+X3VrPMfg4AAJsKG3lTeo4CuIh4CvFVBcxGpDlk4MtnYAjvB8tBQbLsFrok0JbJLLWGTRK1bN5FFU1TNFXWZmCJf6ec01b4D4EDhlTEM2bjLvJd5sg3FDKAo6HRaekEGoNuo5Rq2viewOI0aYT2EA3lpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN8PR12CA0033.namprd12.prod.outlook.com (2603:10b6:408:60::46)
 by SN1PR12MB2429.namprd12.prod.outlook.com (2603:10b6:802:26::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Thu, 17 Oct
 2019 19:15:54 +0000
Received: from BY2NAM03FT041.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::205) by BN8PR12CA0033.outlook.office365.com
 (2603:10b6:408:60::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.22 via Frontend
 Transport; Thu, 17 Oct 2019 19:15:54 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BY2NAM03FT041.mail.protection.outlook.com (10.152.85.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2367.14 via Frontend Transport; Thu, 17 Oct 2019 19:15:54 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:52 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 17 Oct 2019 14:15:52 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 33/37] drm/amd/display: Add center mode for integer scaling in
 DC
Date: Thu, 17 Oct 2019 15:13:25 -0400
Message-ID: <20191017191329.11857-34-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017191329.11857-1-sunpeng.li@amd.com>
References: <20191017191329.11857-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(136003)(396003)(428003)(199004)(189003)(336012)(1076003)(486006)(26005)(6666004)(6916009)(316002)(51416003)(76176011)(2351001)(356004)(305945005)(50466002)(2870700001)(54906003)(5660300002)(2616005)(2906002)(11346002)(2876002)(126002)(476003)(426003)(446003)(4326008)(86362001)(478600001)(50226002)(70586007)(81166006)(81156014)(8676002)(8936002)(48376002)(70206006)(186003)(36756003)(47776003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR12MB2429; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8065f1ea-8f8e-4abb-8f31-08d753366e79
X-MS-TrafficTypeDiagnostic: SN1PR12MB2429:
X-Microsoft-Antispam-PRVS: <SN1PR12MB2429AF87A4428334F3B786B4826D0@SN1PR12MB2429.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-Forefront-PRVS: 01930B2BA8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ph7uD46BDenuh391MYkxAZeIfZ/RfvoxoH2PKy1GSfoNhxSnG5PC93gVs0Wu/M3kepoqlB1bOLCkVNTxoUz0TsY5iKKsXWUkzImXI4KthgGKE9dj9N31+aWuh0wYuEekCDIvrIEdAt3OnqYpRIF7vzITyCmCah4/jLkflfskvHFSlANNTfoFN1Qm7sSeoVoTUw4XKCzzGTMOkY9kZ27KOHjgAfvORz5sJk7oybsQFYFCsCntuYAo7YZIDbqVCqd6f0Hl0Fb+mUQ5HeIwkOHpqTgPfjEsVatAWmZ7Hjy48+BJN4IpDLndPfgu2PhkDNbrIJcEdYngEhQNSobqtPRSJ7eZvNjKUjJ2cB2Eq60szrEPjE2SUDo7im9LSOpxBLlKIEZgCQjB29jLJDGoUr4sgsNIxYIX96AlrbTSGy+bcuI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 19:15:54.1713 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8065f1ea-8f8e-4abb-8f31-08d753366e79
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2429
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2iv7GuqBT55zap+R8a1BogzhB9H0YPpwl4aR8LOW3S4=;
 b=nSPnH7SRSJof1ZJchnqvDFR63FtqyzgETYx/uP1hmM4xkydGFShpSrJ+4FirSook2siafDxPfUBlahs4/bAE+9a0IzrMzap5VO1wNhoJbEvDpnY2kdmAkUsRoJiwGGlaOZ/WnN1ebTvzuo3tt8HkRMr5Xl++MUxzRe2rsruCnnA=
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
Cc: Leo Li <sunpeng.li@amd.com>, Reza Amini <Reza.Amini@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUmV6YSBBbWluaSA8UmV6YS5BbWluaUBhbWQuY29tPgoKW3doeV0KV2Ugd2FudCB0byB1
c2UgbWF4aW11bSBzcGFjZSBvbiBkaXNwbGF5IHRvIHNob3cgc291cmNlCgpbaG93XQpGb3IgQ2Vu
dGVyZWQgTW9kZTogUmVwbGljYXRlIHNvdXJjZSBhcyBtYW55IHRpbWVzIGFzIHBvc3NpYmxlIHRv
IHVzZQptYXhpbXVtIG9mIGRpc3BsYXkgYWN0aXZlIHNwYWNlIGFkZCBib3JkZXJzLgoKU2lnbmVk
LW9mZi1ieTogUmV6YSBBbWluaSA8UmV6YS5BbWluaUBhbWQuY29tPgpSZXZpZXdlZC1ieTogQW50
aG9ueSBLb28gPEFudGhvbnkuS29vQGFtZC5jb20+CkFja2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcu
bGlAYW1kLmNvbT4KLS0tCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3Jlc291
cmNlLmMgfCA0MyArKysrKysrKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0
aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvY29yZS9kY19yZXNvdXJjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2NvcmUvZGNfcmVzb3VyY2UuYwppbmRleCA4ZmUzOWZkZWZjMjcuLjcwZTYwMWE5NzVk
ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfcmVz
b3VyY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19yZXNv
dXJjZS5jCkBAIC05NTEsNyArOTUxLDcgQEAgc3RhdGljIHZvaWQgY2FsY3VsYXRlX2luaXRzX2Fu
ZF9hZGpfdnAoc3RydWN0IHBpcGVfY3R4ICpwaXBlX2N0eCkKIAlkYXRhLT5pbml0cy52X2NfYm90
ID0gZGNfZml4cHRfYWRkKGRhdGEtPmluaXRzLnZfYywgZGF0YS0+cmF0aW9zLnZlcnRfYyk7CiAK
IH0KLXN0YXRpYyBib29sIGFyZV9yZWN0X2ludGVnZXJfbXVsdGlwbGVzKHN0cnVjdCByZWN0IHNy
Yywgc3RydWN0IHJlY3QgZGVzdCkKK3N0YXRpYyBib29sIGFyZV9yZWN0c19pbnRlZ2VyX211bHRp
cGxlcyhzdHJ1Y3QgcmVjdCBzcmMsIHN0cnVjdCByZWN0IGRlc3QpCiB7CiAJaWYgKGRlc3Qud2lk
dGggID49IHNyYy53aWR0aCAgJiYgZGVzdC53aWR0aCAgJSBzcmMud2lkdGggID09IDAgJiYKIAkJ
ZGVzdC5oZWlnaHQgPj0gc3JjLmhlaWdodCAmJiBkZXN0LmhlaWdodCAlIHNyYy5oZWlnaHQgPT0g
MCkKQEAgLTk1OSw2ICs5NTksMzggQEAgc3RhdGljIGJvb2wgYXJlX3JlY3RfaW50ZWdlcl9tdWx0
aXBsZXMoc3RydWN0IHJlY3Qgc3JjLCBzdHJ1Y3QgcmVjdCBkZXN0KQogCiAJcmV0dXJuIGZhbHNl
OwogfQorCit2b2lkIGNhbGN1bGF0ZV9pbnRlZ2VyX3NjYWxpbmcoc3RydWN0IHBpcGVfY3R4ICpw
aXBlX2N0eCkKK3sKKwlpZiAoIXBpcGVfY3R4LT5wbGFuZV9zdGF0ZS0+c2NhbGluZ19xdWFsaXR5
LmludGVnZXJfc2NhbGluZykKKwkJcmV0dXJuOworCisJLy9mb3IgQ2VudGVyZWQgTW9kZQorCWlm
IChwaXBlX2N0eC0+c3RyZWFtLT5kc3Qud2lkdGggID09IHBpcGVfY3R4LT5zdHJlYW0tPnNyYy53
aWR0aCAmJgorCQlwaXBlX2N0eC0+c3RyZWFtLT5kc3QuaGVpZ2h0ID09IHBpcGVfY3R4LT5zdHJl
YW0tPnNyYy5oZWlnaHQpIHsKKwkJLy8gY2FsY3VsYXRlIG1heGltdW0gIyBvZiByZXBsaWNhdGlv
biBvZiBzcmMgb250byBhZGRyZXNzYWJsZQorCQl1bnNpZ25lZCBpbnQgaW50ZWdlcl9tdWx0aXBs
ZSA9IG1pbigKKwkJCQlwaXBlX2N0eC0+c3RyZWFtLT50aW1pbmcuaF9hZGRyZXNzYWJsZSAvIHBp
cGVfY3R4LT5zdHJlYW0tPnNyYy53aWR0aCwKKwkJCQlwaXBlX2N0eC0+c3RyZWFtLT50aW1pbmcu
dl9hZGRyZXNzYWJsZSAgLyBwaXBlX2N0eC0+c3RyZWFtLT5zcmMuaGVpZ2h0KTsKKworCQkvL3Nj
YWxlIGRzdAorCQlwaXBlX2N0eC0+c3RyZWFtLT5kc3Qud2lkdGggID0gaW50ZWdlcl9tdWx0aXBs
ZSAqIHBpcGVfY3R4LT5zdHJlYW0tPnNyYy53aWR0aDsKKwkJcGlwZV9jdHgtPnN0cmVhbS0+ZHN0
LmhlaWdodCA9IGludGVnZXJfbXVsdGlwbGUgKiBwaXBlX2N0eC0+c3RyZWFtLT5zcmMuaGVpZ2h0
OworCisJCS8vY2VudGVyIGRzdCBvbnRvIGFkZHJlc3NhYmxlCisJCXBpcGVfY3R4LT5zdHJlYW0t
PmRzdC54ID0gKHBpcGVfY3R4LT5zdHJlYW0tPnRpbWluZy5oX2FkZHJlc3NhYmxlIC0gcGlwZV9j
dHgtPnN0cmVhbS0+ZHN0LndpZHRoKS8yOworCQlwaXBlX2N0eC0+c3RyZWFtLT5kc3QueSA9IChw
aXBlX2N0eC0+c3RyZWFtLT50aW1pbmcudl9hZGRyZXNzYWJsZSAtIHBpcGVfY3R4LT5zdHJlYW0t
PmRzdC5oZWlnaHQpLzI7CisJfQorCisJLy9kaXNhYmxlIHRhcHMgaWYgc3JjICYgZHN0IGFyZSBp
bnRlZ2VyIHJhdGlvCisJaWYgKGFyZV9yZWN0c19pbnRlZ2VyX211bHRpcGxlcyhwaXBlX2N0eC0+
c3RyZWFtLT5zcmMsIHBpcGVfY3R4LT5zdHJlYW0tPmRzdCkpIHsKKwkJcGlwZV9jdHgtPnBsYW5l
X3N0YXRlLT5zY2FsaW5nX3F1YWxpdHkudl90YXBzID0gMTsKKwkJcGlwZV9jdHgtPnBsYW5lX3N0
YXRlLT5zY2FsaW5nX3F1YWxpdHkuaF90YXBzID0gMTsKKwkJcGlwZV9jdHgtPnBsYW5lX3N0YXRl
LT5zY2FsaW5nX3F1YWxpdHkudl90YXBzX2MgPSAxOworCQlwaXBlX2N0eC0+cGxhbmVfc3RhdGUt
PnNjYWxpbmdfcXVhbGl0eS5oX3RhcHNfYyA9IDE7CisJfQorfQorCiBib29sIHJlc291cmNlX2J1
aWxkX3NjYWxpbmdfcGFyYW1zKHN0cnVjdCBwaXBlX2N0eCAqcGlwZV9jdHgpCiB7CiAJY29uc3Qg
c3RydWN0IGRjX3BsYW5lX3N0YXRlICpwbGFuZV9zdGF0ZSA9IHBpcGVfY3R4LT5wbGFuZV9zdGF0
ZTsKQEAgLTk3Miw2ICsxMDA0LDggQEAgYm9vbCByZXNvdXJjZV9idWlsZF9zY2FsaW5nX3BhcmFt
cyhzdHJ1Y3QgcGlwZV9jdHggKnBpcGVfY3R4KQogCXBpcGVfY3R4LT5wbGFuZV9yZXMuc2NsX2Rh
dGEuZm9ybWF0ID0gY29udmVydF9waXhlbF9mb3JtYXRfdG9fZGFsc3VyZmFjZSgKIAkJCXBpcGVf
Y3R4LT5wbGFuZV9zdGF0ZS0+Zm9ybWF0KTsKIAorCWNhbGN1bGF0ZV9pbnRlZ2VyX3NjYWxpbmco
cGlwZV9jdHgpOworCiAJY2FsY3VsYXRlX3NjYWxpbmdfcmF0aW9zKHBpcGVfY3R4KTsKIAogCWNh
bGN1bGF0ZV92aWV3cG9ydChwaXBlX2N0eCk7CkBAIC0xMDAyLDEzICsxMDM2LDYgQEAgYm9vbCBy
ZXNvdXJjZV9idWlsZF9zY2FsaW5nX3BhcmFtcyhzdHJ1Y3QgcGlwZV9jdHggKnBpcGVfY3R4KQog
CQlyZXMgPSBwaXBlX2N0eC0+cGxhbmVfcmVzLmRwcC0+ZnVuY3MtPmRwcF9nZXRfb3B0aW1hbF9u
dW1iZXJfb2ZfdGFwcygKIAkJCQlwaXBlX2N0eC0+cGxhbmVfcmVzLmRwcCwgJnBpcGVfY3R4LT5w
bGFuZV9yZXMuc2NsX2RhdGEsICZwbGFuZV9zdGF0ZS0+c2NhbGluZ19xdWFsaXR5KTsKIAotCWlm
IChyZXMgJiYKLQkgICAgcGxhbmVfc3RhdGUtPnNjYWxpbmdfcXVhbGl0eS5pbnRlZ2VyX3NjYWxp
bmcgJiYKLQkgICAgYXJlX3JlY3RfaW50ZWdlcl9tdWx0aXBsZXMocGlwZV9jdHgtPnBsYW5lX3Jl
cy5zY2xfZGF0YS52aWV3cG9ydCwKLQkJCQkgICAgICAgcGlwZV9jdHgtPnBsYW5lX3Jlcy5zY2xf
ZGF0YS5yZWNvdXQpKSB7Ci0JCXBpcGVfY3R4LT5wbGFuZV9yZXMuc2NsX2RhdGEudGFwcy52X3Rh
cHMgPSAxOwotCQlwaXBlX2N0eC0+cGxhbmVfcmVzLnNjbF9kYXRhLnRhcHMuaF90YXBzID0gMTsK
LQl9CiAKIAlpZiAoIXJlcykgewogCQkvKiBUcnkgMjQgYnBwIGxpbmVidWZmZXIgKi8KLS0gCjIu
MjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
