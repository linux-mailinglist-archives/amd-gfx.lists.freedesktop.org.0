Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9042ECA0AE
	for <lists+amd-gfx@lfdr.de>; Thu,  3 Oct 2019 16:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E5689E36;
	Thu,  3 Oct 2019 14:55:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740083.outbound.protection.outlook.com [40.107.74.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB5489E33
 for <amd-gfx@lists.freedesktop.org>; Thu,  3 Oct 2019 14:55:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HyWVIOzzZXHXl+0KqvJNAuHG5teAf1Sir//ybdK4r5IAnNyAeNSZz17x3CulRpKlgPwds7BKmpOnyZMCC/uY7rsWRrE5zji5wCQQsGD7YQ4X9M3e0lelc23+zggvl5wBIzDcM196tlRc6fvj41NsO/pSkOIl4RW68euJjZM1Wi8UA0Avx2MEpkNMAOw5XyquAFMmlB3AaQfJL/4KXHaHdKTvNv/GKAgDixd4kaa7TxK/kxWMZpqeKPV0HRDELGvE+auN5o2KMROFEnVI8Zz91rgxWe8l1C/SQTDr1WKIthHKR8b5sofgKcCTaA3xbhZSpUcv5ulLRHZxTGadmHUC9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8O+eY4JhFJtLzAjpfGmkrm1w6bJzqx9WQd4sLlwzVnM=;
 b=iwlKqJyBA/Y+dtwLwV9/74Wdi7wyIFXiL0wv643l8uBYWEaNorpfVW/828zqcO05Aru93j1gg+sz8U+gWtWoOuvyBxt7/PDL76jbWZGBj1fjJHi0zhHsFEMkr6a4zaxR2H4T8Fqn3L5ZFPC/fflgN7k4kMacOvT9TieZo9ZtojmrxMZA5dvIEmr2pKLs58c092Mz3D8cCF9jDMbv5xAsKnD1p2IAzHFmXqEX2J1u8yMqcxnmGij3gO1NdBhwXfqWPZSSAalGIDc8u9CpkpRwzau2hUtXlrYHzA4+EEw6Xbybe5zQk6mPjNpiOTd3C4wp1uWx8fBV9sX5nLhjQX4MKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN4PR12CA0020.namprd12.prod.outlook.com (2603:10b6:403:2::30)
 by DM6PR12MB3596.namprd12.prod.outlook.com (2603:10b6:5:3d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Thu, 3 Oct
 2019 14:55:01 +0000
Received: from BY2NAM03FT045.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::205) by BN4PR12CA0020.outlook.office365.com
 (2603:10b6:403:2::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.15 via Frontend
 Transport; Thu, 3 Oct 2019 14:55:00 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT045.mail.protection.outlook.com (10.152.85.113) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Thu, 3 Oct 2019 14:55:00 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 3 Oct 2019
 09:54:57 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <harry.wentland@amd.com>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 05/11] drm/amd/display: Change ERROR to WARN for HDCP module
Date: Thu, 3 Oct 2019 10:54:35 -0400
Message-ID: <20191003145441.28952-6-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191003145441.28952-1-Bhawanpreet.Lakha@amd.com>
References: <20191003145441.28952-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(376002)(346002)(39860400002)(428003)(199004)(189003)(50226002)(305945005)(110136005)(50466002)(478600001)(86362001)(70206006)(70586007)(5660300002)(6666004)(356004)(1076003)(47776003)(4326008)(16586007)(48376002)(316002)(336012)(446003)(476003)(2616005)(53416004)(126002)(486006)(186003)(11346002)(26005)(426003)(7696005)(51416003)(14444005)(76176011)(2906002)(81166006)(36756003)(8676002)(81156014)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3596; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bde095b-39c3-4355-6190-08d74811aa52
X-MS-TrafficTypeDiagnostic: DM6PR12MB3596:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3596A4697C99259CA7191AEFF99F0@DM6PR12MB3596.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1060;
X-Forefront-PRVS: 01792087B6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f0+RGrPc3GMHx3f7y5HydxfDCd64U2SfFLM+tIdv8QXh2DrDWVZb+vrCBqUWxPxRKwZCC1gTYsDLyKmy0YF2tbG0cxoCFqdql+3z7Tqotena7lF/OLCEHNGAShkrwSGnbWxo7Xrw/i+guZLcaDav0Gc+vu3xPWHFynXIUOJzhN4h+SRhf8gQ+Jh9KgF+l88TJLbjOpIctMQGf9ICFPt4scy9NwbwAWxcagDJIwCitvqp6tMyY7qY2gctp8ZPFiwaNrrkdMEcEW18GBcwx1gCMCizOcYHiCHpZlDalR0nTTKGNm9o89viXDi1WVBVoKlrtniFMCEzB5QPkdDkvHweUb0M8kE/Di8rhk1j1Jx2maae1SttjplF1bTSWx+e9zI3e9z77j2gUwK5Ior6SWHTZzjNw5Corn8tCEd6iHQYVJs=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2019 14:55:00.3792 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bde095b-39c3-4355-6190-08d74811aa52
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3596
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8O+eY4JhFJtLzAjpfGmkrm1w6bJzqx9WQd4sLlwzVnM=;
 b=LADhfewx6JfRiGhxdJXBw6Qn+P2gdIpQDA33l9aHj/DkL7NcainEfQaInwL9J1kxDtq8a6mg4C1LjdjpKHHn7i46PSlio6bg9ppzpC2rZkKArSsym0uzoLJAJz+gFL43O78IEjfJIqoiU59yIeV/PaA3gQ8wyintLqxgRBMvtWE=
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KSERDUCBpcyBhIGJpdCBmaW5pY2t5IHNvIHdlIHRyeSBpdCAzIHRpbWVzLCB0aGlzIGxl
YWRzIHRvIGEgY2FzZSB3aGVyZQppZiB3ZSBmYWlsIHRoZSBmaXJzdCB0aW1lIGFuZCBwYXNzIHRo
ZSBzZWNvbmQgdGltZSB0aGUgZXJyb3IgaXMgc3RpbGwKc2hvd24gaW4gZG1lc2cgZm9yIHRoZSBm
aXJzdCBmYWlsZWQgYXR0ZW1wdC4KClRoaXMgbGVhZHMgdG8gZmFsc2UgcG9zaXRpdmUgZXJyb3Jz
LgoKW0hvd10KQ2hhbmdlIHRoZSBsb2dnaW5nIGZyb20gRVJST1IgdG8gV0FSTklORy4gV2Fybmlu
Z3MgYXJlIHN0aWxsIHNob3duIGluIGRtZXNnCnRvIGtub3cgd2hhdCB3ZW50IHdyb25nLgoKU2ln
bmVkLW9mZi1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaGRjcC9oZGNwX2xvZy5o
IHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3Av
aGRjcF9sb2cuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRj
cF9sb2cuaAppbmRleCBiMjkzMjJlN2Q1ZmUuLmZmOTEzNzNlYmFkYSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaGRjcC9oZGNwX2xvZy5oCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcF9sb2cuaApAQCAtMjcs
NyArMjcsNyBAQAogI2RlZmluZSBNT0RfSERDUF9MT0dfSF8KIAogI2lmZGVmIENPTkZJR19EUk1f
QU1EX0RDX0hEQ1AKLSNkZWZpbmUgSERDUF9MT0dfRVJSKGhkY3AsIC4uLikgRFJNX0VSUk9SKF9f
VkFfQVJHU19fKQorI2RlZmluZSBIRENQX0xPR19FUlIoaGRjcCwgLi4uKSBEUk1fV0FSTihfX1ZB
X0FSR1NfXykKICNkZWZpbmUgSERDUF9MT0dfVkVSKGhkY3AsIC4uLikgRFJNX0RFQlVHX0tNUyhf
X1ZBX0FSR1NfXykKICNkZWZpbmUgSERDUF9MT0dfRlNNKGhkY3AsIC4uLikgRFJNX0RFQlVHX0tN
UyhfX1ZBX0FSR1NfXykKICNkZWZpbmUgSERDUF9MT0dfVE9QKGhkY3AsIC4uLikgcHJfZGVidWco
IltIRENQX1RPUF06Il9fVkFfQVJHU19fKQpAQCAtMzcsNyArMzcsNyBAQAogLyogZGVmYXVsdCBs
b2dzICovCiAjZGVmaW5lIEhEQ1BfRVJST1JfVFJBQ0UoaGRjcCwgc3RhdHVzKSBcCiAJCUhEQ1Bf
TE9HX0VSUihoZGNwLCBcCi0JCQkiW0xpbmsgJWRdIEVSUk9SICVzIElOIFNUQVRFICVzIiwgXAor
CQkJIltMaW5rICVkXSBXQVJOSU5HICVzIElOIFNUQVRFICVzIiwgXAogCQkJaGRjcC0+Y29uZmln
LmluZGV4LCBcCiAJCQltb2RfaGRjcF9zdGF0dXNfdG9fc3RyKHN0YXR1cyksIFwKIAkJCW1vZF9o
ZGNwX3N0YXRlX2lkX3RvX3N0cihoZGNwLT5zdGF0ZS5pZCkpCi0tIAoyLjE3LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
