Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D639C1AD0
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Sep 2019 07:00:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824616E33E;
	Mon, 30 Sep 2019 05:00:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750053.outbound.protection.outlook.com [40.107.75.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9E66E33A
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Sep 2019 05:00:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lsscDxyd6b15NLEONytcxB3IZgx5NWWu0KaNTYivVHLD3VketYxH8f9P+m168s+s0W2hNYnoagDBtiVtEPNomjgIZtPSvZb3gRDiyPzeN6R/vSaz0BGYozFHoMD1+MNY5VlJ/xfmRqyhDqd85LEY7Op+MkGTKJe1ddqARz85CdAy9X9/28TKcvyyG2YIQyQFf6QKn4c0RDLbWCbxOTn6AonS6U0t2eRdDVfQnkAkTxuQTUMUNvBzUX0We7BxIXFS3FOsMHjMeDS4ccdPYPQhSg1FhV5d8X12YGUzmz4NMZRrPtOCTseYCeB2U+H5/DrBKpZHDGC8oyuAj5GqUCX/1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LwDRmbHD65my2Rt/GTALcXmzRbXIgxRo188NrVfheuM=;
 b=XLYZSARGc/L/nXGO5E8HIGIgH+iR5BFSppTmxAHGdL33XWQwfJAWIlJD2TZitbXKRUbDqrlzyD+Mg+TQddCb5yKgcrROHMc85eHPwaGmFUVHCn6tYnFtbTpzERKxu6L09qYqUA48MDJGHf7TphyC4W5FrMoPxhQoZrgC6iajMb+UckinOQ0InUWbtjxe2zLWSiX6RIh/NFIcTw0zoSLpcCiewhB2bVaynGLtLzCqX5rGhzTHDGJsjTEJGEW/xjvazXVX335J5xJO34af/227QV92BCUDut0CLAjHEfGR81U6qndFyEpHFPhlgYt9ugrxEqCkGHKSJxAIcTRCP8ecvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0133.namprd12.prod.outlook.com (2603:10b6:0:51::29) by
 MN2PR12MB4096.namprd12.prod.outlook.com (2603:10b6:208:1dc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.16; Mon, 30 Sep
 2019 05:00:18 +0000
Received: from BY2NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by DM3PR12CA0133.outlook.office365.com
 (2603:10b6:0:51::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.20 via Frontend
 Transport; Mon, 30 Sep 2019 05:00:17 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT009.mail.protection.outlook.com (10.152.84.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Mon, 30 Sep 2019 05:00:17 +0000
Received: from ubuntu-mi100.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 30 Sep 2019
 00:00:13 -0500
From: Jack Zhang <Jack.Zhang1@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/amdgpu/sriov ip block setting of Arcturus
Date: Mon, 30 Sep 2019 13:00:10 +0800
Message-ID: <20190930050010.7437-1-Jack.Zhang1@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(39860400002)(376002)(396003)(428003)(189003)(199004)(1076003)(36756003)(70586007)(86362001)(70206006)(4326008)(356004)(2906002)(186003)(478600001)(7696005)(336012)(316002)(26005)(2616005)(50466002)(486006)(51416003)(50226002)(81156014)(426003)(48376002)(126002)(476003)(305945005)(53416004)(16586007)(8936002)(5660300002)(14444005)(2351001)(6916009)(8676002)(47776003)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4096; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8ac3ac1-fb3d-4b53-c444-08d745631657
X-MS-TrafficTypeDiagnostic: MN2PR12MB4096:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4096FFD17563392236A5358DBB820@MN2PR12MB4096.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 01762B0D64
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 124iHFEhMqzHovpaURbXBG+MEoQq2nLLPuqutQ2Ocn3pc2ebeoKI3EHkjH0LvZkwMPEWmZkblrnsJi6UFpx6tQEdneWM2s75JB5fxLFMPrRM/vLFJ+xhJ5mhciTo8QAHRhj4XNy6XXE7z/RCPsaqAFQAF0nWZYeRn3HrUrjDQPv5uFo7yQj3TRs1DxZcchOspqkxHpB/klMTlJFfPgxOPyaDhYCUGyVy7nTCT2ZC7I62ewJn7GhEZ2vsSMBDWNCHJcQhhYXDA5OOrkBm/cpIbK/P5pCWn0UZJWJq/tg+zwgqN/IvsxIuCcP0AWqmKUOY4/C7P0F6r7VceU68RXPjyjHf88CSbbDx4hFO5v7/Xihvj9HddGuVJKRQpXoISYFpuDp8g8ATWK9wIgiCbs1P0tMpqJBSeIZ43TqBwYivkzU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2019 05:00:17.3402 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8ac3ac1-fb3d-4b53-c444-08d745631657
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4096
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LwDRmbHD65my2Rt/GTALcXmzRbXIgxRo188NrVfheuM=;
 b=KVLfdKYPfZ229JNt1auKwookFBUt1ZQ42uMf/UnvFxvxR+v/rf0ptno8bQYHdNLaN6ad+i72K4v0Il8emhM/6W2IFcTcG7QW5vKSOvGAQ00QyvK7cX2qYQ9Ce5IRE2k/Ynu/qXt0EKeRn5GDjNaGpuJjt54cNz6RpCj31noFqKQ=
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
Cc: Jack Zhang <Jack.Zhang1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWRkIGlwIGJsb2NrIHNldHRpbmcgZm9yIEFyY3R1cnVzIFNSSU9WCgoxLlBTUCBuZWVkIHRvIGJl
IGluaXRpYWxpemVkIGJlZm9yZSBJSC4KMi5TTVUgZG9lc24ndCBuZWVkIHRvIGJlIGluaXRpYWxp
emVkIGF0IGttZCBkcml2ZXIuCjMuQXJjdHVydXMgZG9lc24ndCBzdXBwb3J0IERDRSBoYXJkd2Fy
ZSxpdCBuZWVkcyB0byBza2lwCiAgcmVnaXN0ZXIgYWNjZXNzIHRvIERDRS4KClNpZ25lZC1vZmYt
Ynk6IEphY2sgWmhhbmcgPEphY2suWmhhbmcxQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ21jX3Y5XzAuYyB8IDEwICsrKysrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L3NvYzE1LmMgICAgfCAxOSArKysrKysrKysrKysrKystLS0tCiAyIGZpbGVzIGNo
YW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2dtY192OV8wLmMKaW5kZXggOTVhOWE1ZjUuLjQ0MDIzYmQgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ21jX3Y5XzAuYwpAQCAtMTMzMCwxMSArMTMzMCwxMyBAQCBzdGF0aWMgaW50
IGdtY192OV8wX2h3X2luaXQodm9pZCAqaGFuZGxlKQogCWdtY192OV8wX2luaXRfZ29sZGVuX3Jl
Z2lzdGVycyhhZGV2KTsKIAogCWlmIChhZGV2LT5tb2RlX2luZm8ubnVtX2NydGMpIHsKLQkJLyog
TG9ja291dCBhY2Nlc3MgdGhyb3VnaCBWR0EgYXBlcnR1cmUqLwotCQlXUkVHMzJfRklFTEQxNShE
Q0UsIDAsIFZHQV9IRFBfQ09OVFJPTCwgVkdBX01FTU9SWV9ESVNBQkxFLCAxKTsKKwkJaWYgKGFk
ZXYtPmFzaWNfdHlwZSAhPSBDSElQX0FSQ1RVUlVTKSB7CisJCQkvKiBMb2Nrb3V0IGFjY2VzcyB0
aHJvdWdoIFZHQSBhcGVydHVyZSovCisJCQlXUkVHMzJfRklFTEQxNShEQ0UsIDAsIFZHQV9IRFBf
Q09OVFJPTCwgVkdBX01FTU9SWV9ESVNBQkxFLCAxKTsKIAotCQkvKiBkaXNhYmxlIFZHQSByZW5k
ZXIgKi8KLQkJV1JFRzMyX0ZJRUxEMTUoRENFLCAwLCBWR0FfUkVOREVSX0NPTlRST0wsIFZHQV9W
U1RBVFVTX0NOVEwsIDApOworCQkJLyogZGlzYWJsZSBWR0EgcmVuZGVyICovCisJCQlXUkVHMzJf
RklFTEQxNShEQ0UsIDAsIFZHQV9SRU5ERVJfQ09OVFJPTCwgVkdBX1ZTVEFUVVNfQ05UTCwgMCk7
CisJCX0KIAl9CiAKIAlyID0gZ21jX3Y5XzBfZ2FydF9lbmFibGUoYWRldik7CmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvc29jMTUuYwppbmRleCBkYmQ3OTBlLi5hYzE4MWUzIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3NvYzE1LmMKQEAgLTc1NCwxNCArNzU0LDI1IEBAIGludCBzb2MxNV9zZXRfaXBfYmxv
Y2tzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCWNhc2UgQ0hJUF9BUkNUVVJVUzoKIAkJ
YW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJnZlZ2ExMF9jb21tb25faXBfYmxvY2sp
OwogCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmZ21jX3Y5XzBfaXBfYmxvY2sp
OwotCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmdmVnYTEwX2loX2lwX2Jsb2Nr
KTsKLQkJaWYgKGxpa2VseShhZGV2LT5maXJtd2FyZS5sb2FkX3R5cGUgPT0gQU1ER1BVX0ZXX0xP
QURfUFNQKSkKLQkJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZwc3BfdjExXzBf
aXBfYmxvY2spOworCisJCS8qIEZvciBNSTEwMCBTUi1JT1YsIFBTUCBuZWVkIHRvIGJlIGluaXRp
YWxpemVkIGJlZm9yZSBJSCAqLworCQlpZiAoYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKSB7CisJCQlp
ZiAobGlrZWx5KGFkZXYtPmZpcm13YXJlLmxvYWRfdHlwZSA9PSBBTURHUFVfRldfTE9BRF9QU1Ap
KQorCQkJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZwc3BfdjExXzBfaXBfYmxv
Y2spOworCQkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJnZlZ2ExMF9paF9pcF9i
bG9jayk7CisJCX0gZWxzZSB7CisJCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAm
dmVnYTEwX2loX2lwX2Jsb2NrKTsKKwkJCWlmIChsaWtlbHkoYWRldi0+ZmlybXdhcmUubG9hZF90
eXBlID09IEFNREdQVV9GV19MT0FEX1BTUCkpCisJCQkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19h
ZGQoYWRldiwgJnBzcF92MTFfMF9pcF9ibG9jayk7CisJCX0KKwogCQlpZiAoYWRldi0+ZW5hYmxl
X3ZpcnR1YWxfZGlzcGxheSB8fCBhbWRncHVfc3Jpb3ZfdmYoYWRldikpCiAJCQlhbWRncHVfZGV2
aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmZGNlX3ZpcnR1YWxfaXBfYmxvY2spOwogCQlhbWRncHVf
ZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmZ2Z4X3Y5XzBfaXBfYmxvY2spOwogCQlhbWRncHVf
ZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmc2RtYV92NF8wX2lwX2Jsb2NrKTsKLQkJYW1kZ3B1
X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJnNtdV92MTFfMF9pcF9ibG9jayk7CisJCWlmICgh
YW1kZ3B1X3NyaW92X3ZmKGFkZXYpKQorCQkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRl
diwgJnNtdV92MTFfMF9pcF9ibG9jayk7CisKIAkJaWYgKHVubGlrZWx5KGFkZXYtPmZpcm13YXJl
LmxvYWRfdHlwZSA9PSBBTURHUFVfRldfTE9BRF9ESVJFQ1QpKQogCQkJYW1kZ3B1X2RldmljZV9p
cF9ibG9ja19hZGQoYWRldiwgJnZjbl92Ml81X2lwX2Jsb2NrKTsKIAkJYnJlYWs7Ci0tIAoyLjcu
NAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
