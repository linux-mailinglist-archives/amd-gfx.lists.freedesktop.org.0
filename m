Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8013CDB73A
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 21:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ECFC6EAAD;
	Thu, 17 Oct 2019 19:15:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-by2nam03on0617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4a::617])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003E36EAA6
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 19:15:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eIc8LUqEx1uQ+hcYf0FQ/NV3/d9VVmXd1YCzV6+8/grabAxl9vMTYFa0SLRG+JAVF4wqQ+s7kgoNxdC6a5ZF1Z3E3TxdXWumitqEO9gzuw/EHId9HWZI/yPNjGcHUNXmqnuRfxR1d8X8iHFi27Q0zuZTpZgRkSVgpNgHEYC/cbEqEzCLUwmz6huTZ0z+f+QnGVAu75Ekub4NsIXQ1zaYJNTx6lEx6FtmOrtBWNeayaKwMoNwRarKHW6Bcf8Mtn4uO6QfKnu4xc4IraI42LIwKoQrYBQRmk0Cl51LJUfb6dsT1M44Ue1zFi4LLErR1nppZv61yKsstVERlHC5BD1gaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HaFVsPQF/nGG+McN126hOeQxCvKAve0PqSqaqNDz678=;
 b=XYgIUQT/RRTnfWULhBgze4wuLdwGG3CkgHGN69RGL/t3z3CljHm5z58DQnCvW5pAcch4y1XJHyEUmM45ENzPCo0S25qz4O9b7CNv2fKPv+z2XaYRQdoTqG+jXV89iTWfkk65NCO5loj5Wo4VCkX4II1jSyZP8apGQQIEtWCSSdYRgw9ncgghraSDoFKSSpRZjAS764O5EuyoLlf6tYTxAA8qPAIWZPrkGFwCB+Gmo4aW7m96eEiEbl7lNg6Lo6A7yVpwCr07f0+n4zGFBeFVzr4hqmDpC+fdqWn5nDgQYasiZmScHNJAZne41L4YB2UXM8YaeE4Vr+/RTkAKWUm6Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR1201CA0013.namprd12.prod.outlook.com
 (2603:10b6:405:4c::23) by DM6PR12MB3691.namprd12.prod.outlook.com
 (2603:10b6:5:14a::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Thu, 17 Oct
 2019 19:15:40 +0000
Received: from BY2NAM03FT028.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::204) by BN6PR1201CA0013.outlook.office365.com
 (2603:10b6:405:4c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.17 via Frontend
 Transport; Thu, 17 Oct 2019 19:15:40 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BY2NAM03FT028.mail.protection.outlook.com (10.152.84.238) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2367.14 via Frontend Transport; Thu, 17 Oct 2019 19:15:39 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:39 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:38 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 17 Oct 2019 14:15:38 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 15/37] drm/amd/display: Fix MPO & pipe split on 3-pipe dcn2x
Date: Thu, 17 Oct 2019 15:13:07 -0400
Message-ID: <20191017191329.11857-16-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017191329.11857-1-sunpeng.li@amd.com>
References: <20191017191329.11857-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(136003)(346002)(428003)(189003)(199004)(70206006)(6916009)(47776003)(70586007)(48376002)(2906002)(50226002)(11346002)(446003)(51416003)(426003)(356004)(186003)(14444005)(26005)(76176011)(50466002)(2351001)(336012)(81156014)(2870700001)(8676002)(81166006)(5660300002)(8936002)(478600001)(316002)(1076003)(126002)(4326008)(486006)(86362001)(6666004)(36756003)(2876002)(54906003)(2616005)(305945005)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3691; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7968fb4d-10c9-42a5-39ca-08d7533665ee
X-MS-TrafficTypeDiagnostic: DM6PR12MB3691:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3691888298A19715418D8895826D0@DM6PR12MB3691.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-Forefront-PRVS: 01930B2BA8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UtDqJZVCBBBIXtYuJtTeOAwJx8UE/+OC2k6Vd9aTXeEFVJ2mrfiI4b1u0raOzmK5jT/VszWsFIvsP3o3ifaPD8fdY77N4amjMFoyFTstJkJcnooekl2eNHts5jjVgrI72kwXozVOiYLvfmc3SxwmcPMkYh+cmPMOJoXwW4guFHLlufB9uMI7z4743vPwyLltu+HAtP9GaWlTIwCTxwAlnTssG0drpzn26kOp4oSjTHn1qx5jPxi+6hye4TuVI2ivG1tOrAkITGtO5m8vFFP6ce6s3qYQn2Y0UOUrkdCryjdJ1UTzDMXWcivYznk0hNzvSVhPuuFCZ0S+qWfcTTKMb+OcJD/LSrJtQO8u7tWYo0Y1WJsf8f3ibR1mquBa3/mFgzaDTSAcm4HLRvRg4WZmuRhCCLIzOm1r+Kz4VregaKY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 19:15:39.8374 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7968fb4d-10c9-42a5-39ca-08d7533665ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3691
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HaFVsPQF/nGG+McN126hOeQxCvKAve0PqSqaqNDz678=;
 b=vGVG4uNe5Xd47XOVxektxwUWZ/Qzf8593s9/78x+OsPmWqF4gAfiM6I1ejfOscXRU+hEuotKq5FEQoUqJ/u2A4ABckYS7a9hB87ZnH3MLKu2JjqPnIdgSMDVJEMbzqC7r+yVCn7hoTF3fdkaUCRVAh9c2UF8tkMeIuhX0vm7A5k=
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
 Michael Strauss <michael.strauss@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTWljaGFlbCBTdHJhdXNzIDxtaWNoYWVsLnN0cmF1c3NAYW1kLmNvbT4KCltXSFldCkRN
TCBpcyBpbmNvcnJlY3RseSBpbml0aWFsaXplZCB3aXRoIDQgcGlwZXMgb24gMyBwaXBlIGNvbmZp
Z3MKUmVxdWlyZWREUFBDTEsgaXMgaGFsdmVkIG9uIHVuc3BsaXQgcGlwZSBkdWUgdG8gYW4gaW5j
b3JyZWN0bHkgaGFuZGxlZCAzIHBpcGUKY2FzZSwgY2F1c2luZyB1bmRlcmZsb3cgd2l0aCAyIHBs
YW5lcyAmIHBpcGUgc3BsaXQgKE1QTywgOEsgKyAybmQgZGlzcGxheSkKCltIT1ddClNldCBjb3Jy
ZWN0IG51bWJlciBvZiBEUFAvT1RHcyBmb3IgZG1sIGluaXQgdG8gZ2VuZXJhdGUgY29ycmVjdCBE
UFAgdG9wb2xvZ3kKRG91YmxlIFJlcXVpcmVkRFBQQ0xLIGFmdGVyIGNsb2NrIGlzIGhhbHZlZCBm
b3IgcGlwZSBzcGxpdAphbmQgZmluZF9zZWNvbmRhcnlfcGlwZSBmYWlscyB0byBmaXggdW5kZXJm
bG93CgpTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFN0cmF1c3MgPG1pY2hhZWwuc3RyYXVzc0BhbWQu
Y29tPgpSZXZpZXdlZC1ieTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5A
YW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jIHwgNSArKyst
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX3Jlc291cmNlLmMg
fCA4ICsrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIw
L2RjbjIwX3Jlc291cmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAv
ZGNuMjBfcmVzb3VyY2UuYwppbmRleCA5YmMwZmZhZDcwOTMuLjI1OTZkNGFjNjI2MyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNl
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291
cmNlLmMKQEAgLTI0ODIsOSArMjQ4MiwxMCBAQCBib29sIGRjbjIwX2Zhc3RfdmFsaWRhdGVfYnco
CiAJCQkJLyogcGlwZSBub3Qgc3BsaXQgcHJldmlvdXNseSBuZWVkcyBzcGxpdCAqLwogCQkJCWhz
cGxpdF9waXBlID0gZGNuMjBfZmluZF9zZWNvbmRhcnlfcGlwZShkYywgJmNvbnRleHQtPnJlc19j
dHgsIGRjLT5yZXNfcG9vbCwgcGlwZSk7CiAJCQkJQVNTRVJUKGhzcGxpdF9waXBlKTsKLQkJCQlp
ZiAoIWhzcGxpdF9waXBlKQorCQkJCWlmICghaHNwbGl0X3BpcGUpIHsKKwkJCQkJY29udGV4dC0+
YndfY3R4LmRtbC52YmEuUmVxdWlyZWREUFBDTEtbdmxldmVsXVtjb250ZXh0LT5id19jdHguZG1s
LnZiYS5tYXhNcGNDb21iXVtwaXBlX2lkeF0gKj0gMjsKIAkJCQkJY29udGludWU7Ci0KKwkJCQl9
CiAJCQkJaWYgKGNvbnRleHQtPmJ3X2N0eC5kbWwudmJhLk9ETUNvbWJpbmVFbmFibGVkW3BpcGVf
aWR4XSkgewogCQkJCQlpZiAoIWRjbjIwX3NwbGl0X3N0cmVhbV9mb3Jfb2RtKAogCQkJCQkJCSZj
b250ZXh0LT5yZXNfY3R4LCBkYy0+cmVzX3Bvb2wsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfcmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9yZXNvdXJjZS5jCmluZGV4IGQyZTg1MWU3YTk3
Zi4uNWUzYjQ4YmIwNGYxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNuMjEvZGNuMjFfcmVzb3VyY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNuMjEvZGNuMjFfcmVzb3VyY2UuYwpAQCAtMTcyMiw2ICsxNzIyLDE0IEBAIHN0YXRp
YyBib29sIGNvbnN0cnVjdCgKIAogCXBvb2wtPmJhc2UucHBfc211ID0gZGNuMjFfcHBfc211X2Ny
ZWF0ZShjdHgpOwogCisJdWludDMyX3QgbnVtX3BpcGVzID0gZGNuMl8xX2lwLm1heF9udW1fZHBw
OworCisJZm9yIChpID0gMDsgaSA8IGRjbjJfMV9pcC5tYXhfbnVtX2RwcDsgaSsrKQorCQlpZiAo
cGlwZV9mdXNlcyAmIDEgPDwgaSkKKwkJCW51bV9waXBlcy0tOworCWRjbjJfMV9pcC5tYXhfbnVt
X2RwcCA9IG51bV9waXBlczsKKwlkY24yXzFfaXAubWF4X251bV9vdGcgPSBudW1fcGlwZXM7CisK
IAlkbWxfaW5pdF9pbnN0YW5jZSgmZGMtPmRtbCwgJmRjbjJfMV9zb2MsICZkY24yXzFfaXAsIERN
TF9QUk9KRUNUX0RDTjIxKTsKIAogCWluaXRfZGF0YS5jdHggPSBkYy0+Y3R4OwotLSAKMi4yMy4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
