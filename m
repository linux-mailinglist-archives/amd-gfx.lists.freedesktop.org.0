Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC29C909C
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 20:17:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B92976E97E;
	Wed,  2 Oct 2019 18:16:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760055.outbound.protection.outlook.com [40.107.76.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6770C6E193
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 18:16:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l8FqUtGyzm8LJAvFWaKU6DPNKsy7e7pWYR74Q8cgt++ljGSwtY2tknIWKM6TiiyEP5MzwPNN/Q+4E/8qjqoPsxlEpxrzQGAhwdoamljVixEeTIrsaLnIFimd2Xe0P/Y5ZRFV0bHNBemMIQVZxI9cWYAwjuBvku0Rz4H93nT/PGns+XR5ycPIfvc4YAIxFYpelCbEWOmw0XwjZCN+nyXCeNQaTFtvQb3xo5uNduTwR2B1apGw6TN2GXpo2iyVry2GbHOx611C5mvn6LW+Q2jdxLPdpPlnQ6unD2hXADHdMrgn6gF9hpT0KMhEUiYJhDCrWceR2Z7gPpaZqsP8je5rOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0w+Ou9eT4EZKlgYxXyAnjAtWHJIfs//A8FZrV+JjVk=;
 b=MsqQtvWVOXUuQkpmBZNKsRwHg/weeaTo0lpx088l59hupcKrkVUGzfg+VjHiCgLCK1M3vW/RwAQPZS2oLEDljIzQ8qVbiVR7+O8WKT7pHxNFMlqlupvdJzLvo+3WIZksEpoMPykQPHtEmDP8Wpt7ffCikylV26wW9EM77k829h5olwe3Ts3HV4h7s2mpj7VaZeJ4E4+oqcPODe0EmrplT1k7FmXlTiBwXyHs5SFQlmuXSZG9DUhKfHhdyZdtZDy8b4AKOKv8wpQX4ydwlKvgNi4vf3WCWf6bKKBDA5A90u4rZCznPzihexZ6kWsIAsusWPAJ6Tc57nw7C2Nag+PIJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0102.namprd12.prod.outlook.com (2603:10b6:0:55::22) by
 BN7PR12MB2642.namprd12.prod.outlook.com (2603:10b6:408:26::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Wed, 2 Oct 2019 18:16:54 +0000
Received: from DM3NAM03FT020.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by DM3PR12CA0102.outlook.office365.com
 (2603:10b6:0:55::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.20 via Frontend
 Transport; Wed, 2 Oct 2019 18:16:54 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT020.mail.protection.outlook.com (10.152.82.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 2 Oct 2019 18:16:54 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 2 Oct 2019
 13:16:54 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 34/38] drm/amd/display: Fix dongle_caps containing stale
 information.
Date: Wed, 2 Oct 2019 14:16:29 -0400
Message-ID: <20191002181633.22805-35-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
References: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(136003)(346002)(428003)(199004)(189003)(50226002)(7696005)(316002)(478600001)(51416003)(1076003)(86362001)(36756003)(6666004)(305945005)(47776003)(2351001)(54906003)(16586007)(6916009)(5660300002)(426003)(336012)(356004)(476003)(53416004)(76176011)(446003)(126002)(11346002)(2616005)(70206006)(48376002)(70586007)(50466002)(2906002)(4326008)(26005)(186003)(8676002)(486006)(8936002)(81156014)(14444005)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2642; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7dcd3441-8336-48dc-43d7-08d74764b47c
X-MS-TrafficTypeDiagnostic: BN7PR12MB2642:
X-Microsoft-Antispam-PRVS: <BN7PR12MB26427DF369A053D42EC18FE9F99C0@BN7PR12MB2642.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-Forefront-PRVS: 0178184651
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oHtqpMbyZYM6sCtHPrNEE8X5vcXgihmWr/6nEi1o8KoqsaLPjIWLYzX2yNNHWGi39sADA9Sl9OcGRZCzgypcprPqXa2rOOdQUb7UzI2nnr1JWPxmst/ffwpP5a09iU4dzkc0U9PIAWxLYviQjuV0KO2guFkyz/Ihs+i+VybZ9nKGKKYWIZIelBgk7qtel8HKDApO+cmuLNvYWUgeGPRBku0UPMrleb6jHs6U588j4O1VWjyBR6tVNeZVBXxl4vq06eQ6IXZHCU20SKNTr23MO4t3aHVRuUPmWqtKUhLsZtU0fh1GDdyTHyqvowfEB6q+k1DvZPnigV03sQZ/WOSAEdlo681rnC/zSw+FiqhDfGfpsybScBkSlGUeUj64AaR7Z76dof8qNkmuAEe2g3mcdSw8mrrkLrJpODH+/QfHKtE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2019 18:16:54.5247 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dcd3441-8336-48dc-43d7-08d74764b47c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2642
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0w+Ou9eT4EZKlgYxXyAnjAtWHJIfs//A8FZrV+JjVk=;
 b=sWbqC9j2fgcnkiOu5ghVvYNagw6C7ebf//tSlebm930Ol8rWfF2O113MRb9J82NLTwrZtYwpbYkLjX5ah+D/WkLdMA1XBpRIraE3kLtJ/T3vaRZsriPU5J0cgjqs80Fxwqwm5OrgC3Rij1FBe4uc/lrTPfiJeXz63gso2z150xM=
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
Cc: David Galiffi <David.Galiffi@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRGF2aWQgR2FsaWZmaSA8ZGF2aWQuZ2FsaWZmaUBhbWQuY29tPgoKW1dIWV0KCkR1cmlu
ZyBkZXRlY3Rpb246CmZ1bmN0aW9uOiBnZXRfYWN0aXZlX2NvbnZlcnRlcl9pbmZvIHBvcHVsYXRl
cyBsaW5rLT5kcGNkX2NhcHMuZG9uZ2xlX2NhcHMKb25seSB3aGVuIGRwY2RfcmV2ID49IERQQ0Rf
UkVWXzExIGFuZCBEV05fU1RSTV9QT1JUWF9UWVBFIGlzCkRPV05fU1RSRUFNX0RFVEFJTEVEX0hE
TUkgb3IgRE9XTl9TVFJFQU1fREVUQUlMRURfRFBfUExVU19QTFVTLgpPdGhlcndpc2UsIGl0IGlz
IG5vdCBjbGVhcmVkLCBhbmQgc3RhbGUgaW5mb3JtYXRpb24gcmVtYWlucy4KCkR1cmluZyBtb2Rl
IHZhbGlkYXRpb246CmZ1bmN0aW9uOiBkcF9hY3RpdmVfZG9uZ2xlX3ZhbGlkYXRlX3RpbWluZyBy
ZWFkcwpsaW5rLT5kcGNkX2NhcHMuZG9uZ2xlX2NhcHMtPmRvbmdsZV90eXBlIHRvIGRldGVybWlu
ZSB0aGUgbWF4aW11bQpwaXhlbCBjbG9jayB0byBzdXBwb3J0LiBUaGlzIGluZm9ybWF0aW9uIGlz
IG5vdyBzdGFsZSBhbmQgbm8gbG9uZ2VyCnZhbGlkLgoKW0hPV10KZHBfYWN0aXZlX2RvbmdsZV92
YWxpZGF0ZV90aW1pbmcgc2hvdWxkIGJlIHVzaW5nCmxpbmstPmRwY2RfY2Fwcy0+ZG9uZ2xlX3R5
cGUgaW5zdGVhZC4KCkNoYW5nZS1JZDogSWU5Mzc2OTM1M2NjZjIwOWI0YWYwYjg3YzFhMTQzNDIy
Yzg4ZGY5MmQKU2lnbmVkLW9mZi1ieTogRGF2aWQgR2FsaWZmaSA8RGF2aWQuR2FsaWZmaUBhbWQu
Y29tPgpSZXZpZXdlZC1ieTogSnVuIExlaSA8SnVuLkxlaUBhbWQuY29tPgpBY2tlZC1ieTogQmhh
d2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jICAgIHwgMiArLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kcC5jIHwgMSArCiAyIGZpbGVzIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYwppbmRleCBmNDFmMTcwNmMwNWYuLjE0OWIx
NWFlZmZiNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUv
ZGNfbGluay5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xp
bmsuYwpAQCAtMjI1Niw3ICsyMjU2LDcgQEAgc3RhdGljIGJvb2wgZHBfYWN0aXZlX2RvbmdsZV92
YWxpZGF0ZV90aW1pbmcoCiAJCWJyZWFrOwogCX0KIAotCWlmIChkb25nbGVfY2Fwcy0+ZG9uZ2xl
X3R5cGUgIT0gRElTUExBWV9ET05HTEVfRFBfSERNSV9DT05WRVJURVIgfHwKKwlpZiAoZHBjZF9j
YXBzLT5kb25nbGVfdHlwZSAhPSBESVNQTEFZX0RPTkdMRV9EUF9IRE1JX0NPTlZFUlRFUiB8fAog
CQlkb25nbGVfY2Fwcy0+ZXh0ZW5kZWRDYXBWYWxpZCA9PSBmYWxzZSkKIAkJcmV0dXJuIHRydWU7
CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xp
bmtfZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZHAu
YwppbmRleCBhYWUyMDQxNDFjNjAuLjBmNTliNjhhYTRjMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kcC5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZHAuYwpAQCAtMjU3NSw2ICsyNTc1LDcg
QEAgc3RhdGljIHZvaWQgZ2V0X2FjdGl2ZV9jb252ZXJ0ZXJfaW5mbygKIAl1aW50OF90IGRhdGEs
IHN0cnVjdCBkY19saW5rICpsaW5rKQogewogCXVuaW9uIGRwX2Rvd25zdHJlYW1fcG9ydF9wcmVz
ZW50IGRzX3BvcnQgPSB7IC5ieXRlID0gZGF0YSB9OworCW1lbXNldCgmbGluay0+ZHBjZF9jYXBz
LmRvbmdsZV9jYXBzLCAwLCBzaXplb2YobGluay0+ZHBjZF9jYXBzLmRvbmdsZV9jYXBzKSk7CiAK
IAkvKiBkZWNvZGUgY29udmVydGVyIGluZm8qLwogCWlmICghZHNfcG9ydC5maWVsZHMuUE9SVF9Q
UkVTRU5UKSB7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
