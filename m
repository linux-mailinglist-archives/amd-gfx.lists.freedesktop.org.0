Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD124DB73C
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 21:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB216EABC;
	Thu, 17 Oct 2019 19:15:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780074.outbound.protection.outlook.com [40.107.78.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F25C6EA38
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 19:15:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cfykmgfoFNJwZM62N5zOmtRGLHfz8CxLKdOBNnI4mAyeNKTEM9qVxgZjuk5wsT7Vnp7gK069bEMPZNcRUYUdnp3Uw9qrH65K7bGI/mQetnYSXqLNTB5yI/j+pJ2duBqzZUB/nLSmRaiOUTFQEM/wdUUw+JIPnaktlLHiQrLVVCJlmH642hZpHl5VJLUco88MaaoTEyp68zFvn4BcOlAxM/a0M6aZh+pSD+vOqjMEKyra51CtRbbgJoEs6bZ2MwHABsn2AHxkLLpbCQRMY6b0BWPeUvANZ3Yd5ELW7Y5CvMJTj4hv+1jl9hRlmZY23g/iRRtY8rkE9qRM39fKZa8VUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XOpKriTCryEVrSRVebna/jCNIkt7D9TTM6CDAsSjGB4=;
 b=dYKiu6RHLE65Q+G6gY/d5gCzW2zYSpZcmRzKFTSRd0emD2YuVLZvubd3jIgHvMV6Y0+VTV5gS52z8HrfnOhRtTbi5mQKaFBoYLoX2E9r4pR99OGfye46Z2f4792lIoQu26LBlt74AVd8a6F9Bo0qTYLkXntDSLzl/TH1Uc8/946FSWLz5HJS+zQUBApvLvaRqtxRZe59/hrpt3JAEhi3zcZ+H82ZxRLteyxhyOcukz9148oFisiXlN43RYfFqXWbpPHbVnVwXY5x7VyiE3uUmq4M+y9jExmZqQpiTysGolPDItvVlJPkCuKgB4U/gO1pOgU6UEiLZ2SuqXp/evV4Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR1201CA0001.namprd12.prod.outlook.com
 (2603:10b6:405:4c::11) by CY4PR12MB1256.namprd12.prod.outlook.com
 (2603:10b6:903:3d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.21; Thu, 17 Oct
 2019 19:15:41 +0000
Received: from BY2NAM03FT028.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::202) by BN6PR1201CA0001.outlook.office365.com
 (2603:10b6:405:4c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.17 via Frontend
 Transport; Thu, 17 Oct 2019 19:15:40 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BY2NAM03FT028.mail.protection.outlook.com (10.152.84.238) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2367.14 via Frontend Transport; Thu, 17 Oct 2019 19:15:40 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:40 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:40 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 17 Oct 2019 14:15:39 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 17/37] drm/amd/display: Update min dcfclk
Date: Thu, 17 Oct 2019 15:13:09 -0400
Message-ID: <20191017191329.11857-18-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017191329.11857-1-sunpeng.li@amd.com>
References: <20191017191329.11857-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(376002)(428003)(199004)(189003)(426003)(126002)(70586007)(36756003)(478600001)(8676002)(4326008)(336012)(54906003)(70206006)(50466002)(14444005)(26005)(86362001)(2870700001)(2906002)(6916009)(5660300002)(2876002)(356004)(446003)(186003)(11346002)(51416003)(1076003)(81156014)(76176011)(48376002)(8936002)(15650500001)(2616005)(50226002)(305945005)(47776003)(486006)(476003)(316002)(81166006)(6666004)(2351001)(17423001)(156123004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1256; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b661ca81-533c-468e-3cce-08d753366673
X-MS-TrafficTypeDiagnostic: CY4PR12MB1256:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR12MB12560BC66876B28FC5068263826D0@CY4PR12MB1256.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-Forefront-PRVS: 01930B2BA8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SlLK5m6PxctxQleD8zJJCVFidgN+CxISztqRm5Ba9t6zZdcakWUnWrQllvP1s7Ozffl/Sy0x7SziChcwKAhVh72IJeVA8Aqw9DIiy7s94Q5LdsFOEh0tUx/x5NLEEehAIYskKLwx1slrmh0k0jtqwwfFQbvB6XtoIZK2rp3zAduuvJLR8XGnyaRJg2otr915wZ2Oip5tVeLOHF7/0DK0KtrmWAPTglXtQbwSWvOguA1icyLf8chjsnsOjTLbSsq7s1xZk7d7C3Lx34isZC036LFgvYCbZHvVAUKvqub0CB5+oAABtjRoSuC9VdmXQVxwOmZwQEFlK5Una1vgLff1yrS8yB45vPF2Y8sM0dOGLwLEYeejTBMMPrAnD6D2z4I49voaEYKudxXAIcTZ5mDrWMAQnrnILJdZaHYjj3xka9c=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 19:15:40.7091 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b661ca81-533c-468e-3cce-08d753366673
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1256
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XOpKriTCryEVrSRVebna/jCNIkt7D9TTM6CDAsSjGB4=;
 b=pQ5RL4K7gTZL6CdZgSdlLmbUnn38s77sCieDjcRV11uxb7+lJ/l2DF/ChRO5+3ur+xDIdvm+c0uAvUZ6UnB8v2RhWrEsHq9vMUcX04Lm7HC+EOEJcgKbSXKHIbPGsdrrUMAYFipN4WXQOpYD/35ShEZYzGlIb6HgFYoLxhPU6z8=
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
Cc: Leo Li <sunpeng.li@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Alvin Lee <alvin.lee2@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQWx2aW4gTGVlIDxhbHZpbi5sZWUyQGFtZC5jb20+CgpbV2h5XQpOVjEyIGhhcyBsb3dl
ciBtaW4gZGNmY2xrCgpbSG93XQpBZGQgdXBkYXRlIGluIHVwZGF0ZV9ib3VuZGluZ19ib3gKClNp
Z25lZC1vZmYtYnk6IEFsdmluIExlZSA8YWx2aW4ubGVlMkBhbWQuY29tPgpSZXZpZXdlZC1ieTog
SnVuIExlaSA8SnVuLkxlaUBhbWQuY29tPgpBY2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFt
ZC5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3Vy
Y2UuYyAgICB8IDEyICsrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jCmluZGV4IDI1OTZkNGFjNjI2My4uMjU1MTVjMjU1
YTNkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNu
MjBfcmVzb3VyY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAv
ZGNuMjBfcmVzb3VyY2UuYwpAQCAtMzA4NCwxMCArMzA4NCwxNCBAQCB2b2lkIGRjbjIwX3VwZGF0
ZV9ib3VuZGluZ19ib3goc3RydWN0IGRjICpkYywgc3RydWN0IF92Y3NfZHBpX3NvY19ib3VuZGlu
Z19ib3hfcwogCiAJaWYgKGRjLT5iYl9vdmVycmlkZXMubWluX2RjZmNsa19taHogPiAwKQogCQlt
aW5fZGNmY2xrID0gZGMtPmJiX292ZXJyaWRlcy5taW5fZGNmY2xrX21oejsKLQllbHNlCi0JCS8v
IEFjY291bnRpbmcgZm9yIFNPQy9EQ0YgcmVsYXRpb25zaGlwLCB3ZSBjYW4gZ28gYXMgaGlnaCBh
cwotCQkvLyA1MDZNaHogaW4gVm1pbi4gIFdlIG5lZWQgdG8gY29kZSA1MDcgc2luY2UgU01VIHdp
bGwgcm91bmQgZG93biB0byA1MDYuCi0JCW1pbl9kY2ZjbGsgPSA1MDc7CisJZWxzZSB7CisJCWlm
IChBU0lDUkVWX0lTX05BVkkxMl9QKGRjLT5jdHgtPmFzaWNfaWQuaHdfaW50ZXJuYWxfcmV2KSkK
KwkJCW1pbl9kY2ZjbGsgPSAzMTA7CisJCWVsc2UKKwkJCS8vIEFjY291bnRpbmcgZm9yIFNPQy9E
Q0YgcmVsYXRpb25zaGlwLCB3ZSBjYW4gZ28gYXMgaGlnaCBhcworCQkJLy8gNTA2TWh6IGluIFZt
aW4uCisJCQltaW5fZGNmY2xrID0gNTA2OworCX0KIAogCWZvciAoaSA9IDA7IGkgPCBudW1fc3Rh
dGVzOyBpKyspIHsKIAkJaW50IG1pbl9mY2xrX3JlcXVpcmVkX2J5X3VjbGs7Ci0tIAoyLjIzLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
