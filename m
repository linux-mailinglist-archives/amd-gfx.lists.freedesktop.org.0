Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2888DB72C
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 21:15:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2B446EA44;
	Thu, 17 Oct 2019 19:15:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720057.outbound.protection.outlook.com [40.107.72.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 211A16EA37
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 19:15:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KcxBWc6d3aHIGQY0YFzzb3Q26xEQgNjgY9kW+1Zt/4pMjiCzk/3rnA3OcNzoqSGmSeFHGtapptWGKx4zpLRXgB1ImrREbu2L7J8vBRgnP5jt1Uels5tF8V+mflRboMUHtPQ1tmMq8w52pYgL0ehNiuIJkP/7j296dAS4o+BNFbFj3h1PdOGhSGcAEahxYqIZctbBw3paREjjT/HW/uahaYw1AbdPlEajlgTFujvgkO4fq3pNDaoc91PBBVm0mtkutTPHVXBogEZgKTIFR4fJUBcqsz5zbslwkiBwOC5262opfZRijeNijNZRxYTYGesxKHXKtIgOm4nwFFk4Vx/LPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cp2D/KDTAaAZtpFI8TFIcVmezVrLtHyJ6L+cWLTWbQQ=;
 b=eRg6HrNn4Fd0Ewwo40JYHCg8nCPP7x3GiRxT4UhUptjAsjf6huzrdUyvRb7dhidaDgD9/TY69B2Gq+TZSsi15yAny5uwTLRI9RmXJ4Vo96SxaKdMfnNpnKSYD6CEVnBpOzuBVnZSTw8AquUpPRwAWVQ+QuTxr3cEhXnlhB+OCl5kN6uz+93y24GAmoGb3xhFD/antHWEFFWtS5rPO7TXtEfGXqpazhN/EIwMnrmJSOUttZA4jW8c+pOkluzVcSgqw2V9y1bLraq5TkxC8xdemYUhGIbnhHbG673o1vs09xG4pmprB1ps/+vY0l5vE3QKWx8Hr6qCB/FuuO9aTzVmHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0059.namprd12.prod.outlook.com (2603:10b6:3:103::21)
 by DM6PR12MB3866.namprd12.prod.outlook.com (2603:10b6:5:1c8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.17; Thu, 17 Oct
 2019 19:15:35 +0000
Received: from CO1NAM03FT008.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::204) by DM5PR12CA0059.outlook.office365.com
 (2603:10b6:3:103::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Thu, 17 Oct 2019 19:15:35 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM03FT008.mail.protection.outlook.com (10.152.80.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2367.14 via Frontend Transport; Thu, 17 Oct 2019 19:15:34 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:33 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 17 Oct 2019 14:15:32 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 06/37] drm/amd/display: remove unused code
Date: Thu, 17 Oct 2019 15:12:58 -0400
Message-ID: <20191017191329.11857-7-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017191329.11857-1-sunpeng.li@amd.com>
References: <20191017191329.11857-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(376002)(396003)(428003)(199004)(189003)(5660300002)(26005)(6916009)(305945005)(8676002)(14444005)(86362001)(36756003)(50226002)(81156014)(81166006)(54906003)(8936002)(356004)(50466002)(6666004)(316002)(186003)(51416003)(126002)(1076003)(2876002)(70586007)(76176011)(486006)(336012)(476003)(426003)(2906002)(70206006)(446003)(2616005)(2870700001)(48376002)(2351001)(47776003)(478600001)(11346002)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3866; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e6c0505-3aad-4d1b-6dcf-08d753366310
X-MS-TrafficTypeDiagnostic: DM6PR12MB3866:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3866DE157EFD560C64B72035826D0@DM6PR12MB3866.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:131;
X-Forefront-PRVS: 01930B2BA8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sjBqO8GJtxPIgJQRrb7eDpsjBxNSPruuIgJ53mPgz48hiY4Kz+AF98/UMYB6neLRppOYNnjMKxeTR2ZcvLfl6aMx8Ws+t/QEwS8C/vkDN9opMFZaAWOn3/kOhAOzk1obd33umBuuGYvufxruj5mnA6wP25F2QB7SwZQAOz2ImUoy9cQmpyBL6VIXk3CUb/DlUZCBhGU4bx50SGOudu/3t9uUoTckwQuGtnUmsA/W9elYta9SIs92d3SA+UppaIWvMMGStmRDjVn7iMSwNKR67Q4X2qjxOZr0jXiQ9p/FgLy9xPF9JyRJ336sZUFSDlu9G/oMArJqoyo7CSjzUMftwKiSvkxSCgpAZc9itW9WK5ufl8S5PJprVIk3UEbXgaEG7Bs1xqSkSlD8umeLfx8Gb+gR7LOr/NQHbi6PIbNLBcg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 19:15:34.9913 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e6c0505-3aad-4d1b-6dcf-08d753366310
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3866
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cp2D/KDTAaAZtpFI8TFIcVmezVrLtHyJ6L+cWLTWbQQ=;
 b=riZG+30WXSzWeBF74yqllbbPKUh8x2ItbyiyQdsKO7/+WwH5eD2GPN8egGWf0xTo5ks6bH++b/g7/a9hI531w9KEAiSEB3kHgdGea3svfPrbTKX4EfK6Ak5ZDO2tF2ETMb+3dGjWh6xslWKBXzWDSBHa52wp9LB5MdpCtfIRzfU=
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
Cc: Leo Li <sunpeng.li@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Eric Bernstein <Eric.Bernstein@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KCkNv
bW1pdCBoaW50cyBhcmUgdW5uZWNlc3NhcnkgYWZ0ZXIgZnJvbnQgZW5kIHByb2dyYW1taW5nIHJl
ZGVzaWduLgoKU2lnbmVkLW9mZi1ieTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1
c2hraW5AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEVyaWMgQmVybnN0ZWluIDxFcmljLkJlcm5zdGVp
bkBhbWQuY29tPgpBY2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYyAgICAgICAgICAgICAgfCAyIC0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYyB8
IDUgLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvY29yZV90eXBlcy5o
ICAgICAgIHwgNCAtLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDExIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jCmluZGV4IDQxYjUxZjQzYTY0Yi4uNTVi
ODJjYTQ0YzNiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29y
ZS9kYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMKQEAg
LTEyNDgsOCArMTI0OCw2IEBAIHN0YXRpYyBlbnVtIGRjX3N0YXR1cyBkY19jb21taXRfc3RhdGVf
bm9fY2hlY2soc3RydWN0IGRjICpkYywgc3RydWN0IGRjX3N0YXRlICpjCiAJZm9yIChpID0gMDsg
aSA8IGNvbnRleHQtPnN0cmVhbV9jb3VudDsgaSsrKQogCQljb250ZXh0LT5zdHJlYW1zW2ldLT5t
b2RlX2NoYW5nZWQgPSBmYWxzZTsKIAotCW1lbXNldCgmY29udGV4dC0+Y29tbWl0X2hpbnRzLCAw
LCBzaXplb2YoY29udGV4dC0+Y29tbWl0X2hpbnRzKSk7Ci0KIAlkY19yZWxlYXNlX3N0YXRlKGRj
LT5jdXJyZW50X3N0YXRlKTsKIAogCWRjLT5jdXJyZW50X3N0YXRlID0gY29udGV4dDsKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJj
ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNl
LmMKaW5kZXggYzk3OTJjNDc5NzhhLi44OTNlNDRjYTkwZjggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jCkBAIC0yMjc1
LDcgKzIyNzUsNiBAQCBib29sIGRjbjIwX2Zhc3RfdmFsaWRhdGVfYncoCiAJaW50IHNwbGl0X3Ro
cmVzaG9sZCA9IGRjLT5yZXNfcG9vbC0+cGlwZV9jb3VudCAvIDI7CiAJYm9vbCBhdm9pZF9zcGxp
dCA9IGRjLT5kZWJ1Zy5waXBlX3NwbGl0X3BvbGljeSAhPSBNUENfU1BMSVRfRFlOQU1JQzsKIAot
CiAJQVNTRVJUKHBpcGVzKTsKIAlpZiAoIXBpcGVzKQogCQlyZXR1cm4gZmFsc2U7CkBAIC0yMzUz
LDEwICsyMzUyLDYgQEAgYm9vbCBkY24yMF9mYXN0X3ZhbGlkYXRlX2J3KAogCWlmICh2bGV2ZWwg
PiBjb250ZXh0LT5id19jdHguZG1sLnNvYy5udW1fc3RhdGVzKQogCQlnb3RvIHZhbGlkYXRlX2Zh
aWw7CiAKLQlpZiAoKGNvbnRleHQtPnN0cmVhbV9jb3VudCA+IHNwbGl0X3RocmVzaG9sZCAmJiBk
Yy0+Y3VycmVudF9zdGF0ZS0+c3RyZWFtX2NvdW50IDw9IHNwbGl0X3RocmVzaG9sZCkKLQkJfHwg
KGNvbnRleHQtPnN0cmVhbV9jb3VudCA8PSBzcGxpdF90aHJlc2hvbGQgJiYgZGMtPmN1cnJlbnRf
c3RhdGUtPnN0cmVhbV9jb3VudCA+IHNwbGl0X3RocmVzaG9sZCkpCi0JCWNvbnRleHQtPmNvbW1p
dF9oaW50cy5mdWxsX3VwZGF0ZV9uZWVkZWQgPSB0cnVlOwotCiAJLyppbml0aWFsaXplIHBpcGVf
anVzdF9zcGxpdF9mcm9tIHRvIGludmFsaWQgaWR4Ki8KIAlmb3IgKGkgPSAwOyBpIDwgTUFYX1BJ
UEVTOyBpKyspCiAJCXBpcGVfc3BsaXRfZnJvbVtpXSA9IC0xOwpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9jb3JlX3R5cGVzLmggYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2NvcmVfdHlwZXMuaAppbmRleCBlZWU3OGE3M2Q4OGMuLmE4
MzEwNzk2MDdjZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2lu
Yy9jb3JlX3R5cGVzLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9j
b3JlX3R5cGVzLmgKQEAgLTM5OCwxMCArMzk4LDYgQEAgc3RydWN0IGRjX3N0YXRlIHsKIAogCXN0
cnVjdCBjbGtfbWdyICpjbGtfbWdyOwogCi0Jc3RydWN0IHsKLQkJYm9vbCBmdWxsX3VwZGF0ZV9u
ZWVkZWQgOiAxOwotCX0gY29tbWl0X2hpbnRzOwotCiAJc3RydWN0IGtyZWYgcmVmY291bnQ7CiB9
OwogCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
