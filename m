Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51219DD09A
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Oct 2019 22:49:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F266E048;
	Fri, 18 Oct 2019 20:49:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700040.outbound.protection.outlook.com [40.107.70.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95886E03C
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Oct 2019 20:49:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L0yz2dVIK7/S7yN43ry2xR22SOszsgLJu2XDPA5xtqp1XPngeeMjsyGQ+/xjOiXzV0jtwNu34CtUGkje51CssMeez2fUXyD6icbk8E5HKyZWRGe/ZQP57kmopSrk6oieT8nhz5/HVo/xLQ05T59utahMkvkOSk+Yebn4H2+r0NQYP+3UDyl3I1lZZSYczoAsota6cJqVH0epvs15AIlA2tI0UIeayuo9xe0lhcj+PzDIuIAYM19URwTG6VZVwXiwBIzdckPLrP8lM243hHK4/WBkTo+X1s54pWL7yH1T77FLNSKFxRBrMt/A4uTFxYucc01mt/2cQve3UfKNnobXsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mnxN0buk7ZAa/lWO9lTdfWd+7r/DEVs7apSImBlQ0dQ=;
 b=Irz3yo2affzEsRSGqby5Z++OzVnSLGonsDtYhGbEOg6tILDbwc4BwdaF7BALAqu5lI8jmWPrNliVPXYaq+YTgsHGAw6zoSJwGK1ScfevkMm1xXIR8xxd9fuD86KkUxEsCpzrqkVBx1R6DuyhADT1jqcUl1dK/Xx8XdMelBgLwP7GTHUYDCJESkLvySkqMur/8vIcvvwSBM/8R1PWI1hEJxiiHWXZHAOd4Z494hd2WS4D4JroFCgGI1idzlnBc8r1NGt+iESPPZ7ScNx84x6mvJKfsix12Fh9Y4wWNBzQWGLf0i0ad6AwhJ292v2pD7kb28X1HDhZ4IDnzi7OJRetwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR12CA0067.namprd12.prod.outlook.com (2603:10b6:300:103::29)
 by BY5PR12MB4161.namprd12.prod.outlook.com (2603:10b6:a03:209::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.20; Fri, 18 Oct
 2019 20:49:48 +0000
Received: from BY2NAM03FT061.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::201) by MWHPR12CA0067.outlook.office365.com
 (2603:10b6:300:103::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2367.20 via Frontend
 Transport; Fri, 18 Oct 2019 20:49:48 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BY2NAM03FT061.mail.protection.outlook.com (10.152.85.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2367.14 via Frontend Transport; Fri, 18 Oct 2019 20:49:48 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 18 Oct
 2019 15:49:47 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 18 Oct
 2019 15:49:47 -0500
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Fri, 18 Oct 2019 15:49:46 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/4] drm/amd/powerplay: Add interface for I2C transactions to
 SMU.
Date: Fri, 18 Oct 2019 16:48:28 -0400
Message-ID: <1571431711-30149-2-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571431711-30149-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1571431711-30149-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(396003)(376002)(39860400002)(428003)(189003)(199004)(2616005)(446003)(11346002)(486006)(426003)(4326008)(44832011)(81166006)(81156014)(126002)(476003)(8676002)(70586007)(305945005)(36756003)(86362001)(2906002)(26005)(6916009)(5660300002)(8936002)(336012)(51416003)(7696005)(76176011)(16586007)(478600001)(50466002)(47776003)(54906003)(50226002)(53416004)(186003)(48376002)(70206006)(14444005)(316002)(2351001)(356004)(6666004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB4161; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71ad612f-622a-4eaf-019a-08d7540cb712
X-MS-TrafficTypeDiagnostic: BY5PR12MB4161:
X-Microsoft-Antispam-PRVS: <BY5PR12MB416118911E28B7FD0A12355DEA6C0@BY5PR12MB4161.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 01949FE337
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xyIsFH08llOMM2xhUHc+bKaEcc1aAPB477ziI6g3MH2a3D5mxzO8uqhJqN2y1v5rxnRL6QJFdNh5H95tWij5/wGRjnNrePMZbhhqaAF9quEKM7KTgVn9A+U0nU8VZtT4ZJQwsK+6vHG1bJlPhUs0rx8m2MgMF30Tql7eJxY1nVFiFdHpYIPu67Gkoyha1PGEBrfKNDpcuC5ULB8Wa4nBeyM06OsXgDRiyWDRiQwng7dSiaXdfOUmjrmNBuC/0wmWzxrWDpGxneH4+Abeyw24/FtimBZJc17y3kBLcXABz4ipTl/afFRgf6KlDNeQ+IjGB6fjzJy+aF1QN/OGNsD4N9ECdaPNgFm0P3v6n4kHO3XqhvwB2OXlaQ6V7YhOmgyCsbTrGuzqoZoS0XcXr0IK+XqwNZIuAcWz35EBPL/Dz60lnx4paN/yZ58wxBjk0qUl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2019 20:49:48.2644 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71ad612f-622a-4eaf-019a-08d7540cb712
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4161
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mnxN0buk7ZAa/lWO9lTdfWd+7r/DEVs7apSImBlQ0dQ=;
 b=B+NNjIQ+L5TPChiIvI64uUQ/w0EKf8bBZoUeVRJSCqjT0WXPxh5F44Bo9A2D6RXG73cxDQVPTIUZfrTtxsUtni1h2y3/PhwtWyIAosR9f1AnXFuO2hBSmje0ilBbfF7OHdUSKKXVa3kbQrD1MYmiHBFLLam01N1Va6/StId+WYE=
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
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>, Guchun.Chen@amd.com,
 Tao.Zhou1@amd.com, noreply-confluence@amd.com, Alexander.Deucher@amd.com,
 Evan.Quan@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaCB8
IDkgKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaCBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgKaW5kZXggYmYxM2JmMy4u
MjQyNDRlYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2Ft
ZGdwdV9zbXUuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1
X3NtdS5oCkBAIC0zOTQsNiArMzk0LDggQEAgc3RydWN0IHNtdV9jb250ZXh0CiAKIH07CiAKK3N0
cnVjdCBpMmNfYWRhcHRlcjsKKwogc3RydWN0IHBwdGFibGVfZnVuY3MgewogCWludCAoKmFsbG9j
X2RwbV9jb250ZXh0KShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSk7CiAJaW50ICgqc3RvcmVfcG93
ZXJwbGF5X3RhYmxlKShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSk7CkBAIC00NzAsNiArNDcyLDgg
QEAgc3RydWN0IHBwdGFibGVfZnVuY3MgewogCQkJCSAgIHVpbnQzMl90IGRwbV9sZXZlbCwgdWlu
dDMyX3QgKmZyZXEpOwogCWludCAoKnNldF9kZl9jc3RhdGUpKHN0cnVjdCBzbXVfY29udGV4dCAq
c211LCBlbnVtIHBwX2RmX2NzdGF0ZSBzdGF0ZSk7CiAJaW50ICgqdXBkYXRlX3BjaWVfcGFyYW1l
dGVycykoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIHVpbnQzMl90IHBjaWVfZ2VuX2NhcCwgdWlu
dDMyX3QgcGNpZV93aWR0aF9jYXApOworCWludCAoKmkyY19lZXByb21faW5pdCkoc3RydWN0IGky
Y19hZGFwdGVyICpjb250cm9sKTsKKwl2b2lkICgqaTJjX2VlcHJvbV9maW5pKShzdHJ1Y3QgaTJj
X2FkYXB0ZXIgKmNvbnRyb2wpOwogCWludCAoKmdldF9kcG1fY2xvY2tfdGFibGUpKHN0cnVjdCBz
bXVfY29udGV4dCAqc211LCBzdHJ1Y3QgZHBtX2Nsb2NrcyAqY2xvY2tfdGFibGUpOwogfTsKIApA
QCAtNzgyLDYgKzc4NiwxMSBAQCBzdHJ1Y3Qgc211X2Z1bmNzCiAjZGVmaW5lIHNtdV9vdmVycmlk
ZV9wY2llX3BhcmFtZXRlcnMoc211KSBcCiAJCSgoc211KS0+ZnVuY3MtPm92ZXJyaWRlX3BjaWVf
cGFyYW1ldGVycyA/IChzbXUpLT5mdW5jcy0+b3ZlcnJpZGVfcGNpZV9wYXJhbWV0ZXJzKChzbXUp
KSA6IDApCiAKKyNkZWZpbmUgc211X2kyY19lZXByb21faW5pdChzbXUsIGNvbnRyb2wpIFwKKwkJ
KChzbXUpLT5wcHRfZnVuY3MtPmkyY19lZXByb21faW5pdCA/IChzbXUpLT5wcHRfZnVuY3MtPmky
Y19lZXByb21faW5pdCgoY29udHJvbCkpIDogLUVJTlZBTCkKKyNkZWZpbmUgc211X2kyY19lZXBy
b21fZmluaShzbXUsIGNvbnRyb2wpIFwKKwkJKChzbXUpLT5wcHRfZnVuY3MtPmkyY19lZXByb21f
ZmluaSA/IChzbXUpLT5wcHRfZnVuY3MtPmkyY19lZXByb21fZmluaSgoY29udHJvbCkpIDogLUVJ
TlZBTCkKKwogI2RlZmluZSBzbXVfdXBkYXRlX3BjaWVfcGFyYW1ldGVycyhzbXUsIHBjaWVfZ2Vu
X2NhcCwgcGNpZV93aWR0aF9jYXApIFwKIAkJKChzbXUpLT5wcHRfZnVuY3MtPnVwZGF0ZV9wY2ll
X3BhcmFtZXRlcnMgPyAoc211KS0+cHB0X2Z1bmNzLT51cGRhdGVfcGNpZV9wYXJhbWV0ZXJzKChz
bXUpLCAocGNpZV9nZW5fY2FwKSwgKHBjaWVfd2lkdGhfY2FwKSkgOiAwKQogCi0tIAoyLjcuNAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
