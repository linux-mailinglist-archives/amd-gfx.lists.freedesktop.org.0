Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B08E1A0C01
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 23:04:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2538389F1B;
	Wed, 28 Aug 2019 21:04:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770057.outbound.protection.outlook.com [40.107.77.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D3689F07
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 21:04:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PJG7hpa0FaOU7SSOoYVbnwhRY4PCGYH89lwSqbygzmKydJYyihUAUMEGIhjXXpbi54v2C9UiBW1bFbk+xzyULGWRcSGbwJWrZVDozZneh6lYv22U0hfhjIyIFnUS9I38hgLERT5q/b9AL1uRLXt8W8wFpAr07KsB+2KGTmmUdWCgb/1Fx/7xechjD2QX5Lm/nyB4T/6tC+Yrs3nr3d/sKfb84qaUnfRvxW6LFU4Y/R0XrFXU1cJgn2w39L9tEkmMbXNfpKnctSShjHZcKC1+EtLTEyLJf7panU6I0taC5wP6LQsLM5mZgfnw8g1PB3g2KlgCa9xr106oEw/WlfpPrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jupYBojTKpRmX2/wyOe1iCQzeOELjhSQMev/p3Xr2i4=;
 b=eOqiRmJ7ty0qjKG9ZGncd3B+iB+0J//WD2ogJJ5SvVPCUZFbubYxjwlO3bVPEbQngFlqw9XRxlY5G0yAsyffiAMkRCXqe9inoGxnDgxv/g9i9B1J8ADQVbD00QJSaFVLSSZzx2pKIXjhC47XJmD36pELamIzCJLZ4iJpSn44/wbmw0UMgiya7db4YOGZds6kwpyxk7JP6jsvL1CxR/4iIecw1HjvfoySQrybnvssOeE96Dyot7hAUYw2vYmmFmJ9/MxxfQSf67TGaWPioCCnT6kgeTYknmx4zn1Mcr6gdb9dYlCHGlqRiHagKa9ZZmLEnSBknzT2IhPr8bCx3G6XEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0052.namprd12.prod.outlook.com (2603:10b6:0:56::20) by
 CY4PR12MB1272.namprd12.prod.outlook.com (2603:10b6:903:3e::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Wed, 28 Aug 2019 21:04:06 +0000
Received: from BY2NAM03FT004.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::204) by DM3PR12CA0052.outlook.office365.com
 (2603:10b6:0:56::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Wed, 28 Aug 2019 21:04:06 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT004.mail.protection.outlook.com (10.152.84.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Wed, 28 Aug 2019 21:04:05 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 28 Aug 2019
 16:04:02 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 03/17] drm/amd/display: Subsample mode suboptimal for
 YCbCr4:2:2
Date: Wed, 28 Aug 2019 17:03:40 -0400
Message-ID: <20190828210354.21464-4-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828210354.21464-1-Bhawanpreet.Lakha@amd.com>
References: <20190828210354.21464-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(6029001)(4636009)(39860400002)(396003)(376002)(346002)(136003)(2980300002)(428003)(199004)(189003)(47776003)(126002)(336012)(478600001)(5660300002)(486006)(53416004)(70586007)(70206006)(6916009)(186003)(86362001)(305945005)(11346002)(81166006)(446003)(2351001)(426003)(81156014)(53936002)(48376002)(50466002)(76176011)(36756003)(8676002)(2906002)(476003)(2616005)(1076003)(50226002)(14444005)(26005)(356004)(51416003)(6666004)(4326008)(7696005)(316002)(16586007)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1272; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49070e81-24a2-4e52-9c2a-08d72bfb4334
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:CY4PR12MB1272; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1272:
X-Microsoft-Antispam-PRVS: <CY4PR12MB12728BFCF80CAF0E0548CA0FF9A30@CY4PR12MB1272.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 014304E855
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: pxQcfCZSuWrIbb5yWPP60jF/D48/HVTfMjAwvjERwq0GzWGf/r1qSgKMeSZR5PPZlPmgjBwli+ZAXDNWLO9mW79q1t6dH7cIL476fmptD/zfcIIQWyLW/LQFjwN0JLBAAJh+MibjoqZkrkY2CSxHtAM+k1VpB/+/W2kOdvF4BA7SjoC1L9+jPxiKCWMDIw7vXbTf3WsZv8Zt54q12DDK0TQhWDZs85PlMt8WboL6lPGGRPXLlD00PPwgUB1+pA4XLg+wCOOZjHlqWFR75wnIaSxf4p1g2rLj9wNUjOp6fM6SwwyYyxCplJxru7cnF0sYGWpfAdtfeajYNfbgrx1Cd2wZRZ6i32tZyc/9p0MEHAMx0koRtoyhG8BJ8+Ss+epUcLpc6NnkoD+ZJ63igqpUOCPi8jIbkLzrT4ReTljUGj0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2019 21:04:05.8940 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49070e81-24a2-4e52-9c2a-08d72bfb4334
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1272
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jupYBojTKpRmX2/wyOe1iCQzeOELjhSQMev/p3Xr2i4=;
 b=TpYbNjBxvwVZeXS/xHk7cPlCY1NGRDn/JmFh+tutXV4DUNmkFjGuQnGHdI7411grumZMYphDQQMH7faBwJHNPdiN1GI6ca0gMImTyvnIu1JBDVorKBNBkLJRY0qJTZzM587f/6DR7SnZdZVGBOksUpMrtH1lZpBfAn3rlHQX0ws=
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
Cc: Krunoslav Kovac <Krunoslav.Kovac@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS3J1bm9zbGF2IEtvdmFjIDxLcnVub3NsYXYuS292YWNAYW1kLmNvbT4KCltXaHkmSG93
XQpEcml2ZXIgZGVmYXVsdHMgdG8gMS10YXAgc3Vic2FtcGxlIG1vZGUgZm9yIDQ6MjoyLgpEQ0Ux
MS4yIGFkZGVkIDMtdGFwLiBUaGUgcG9saWN5IGlzOgpEQ0U4LURDRTExIC0gY2hhbmdlIHRvIDIt
dGFwLCBpdCdzIGJldHRlciB0aGFuIDEtdGFwLgpEQ0UxMS4yKyAtIHVzZSAzLXRhcAoKTm90ZSB0
aGF0IDQ6MjowIHdhcyBhZGRlZCBpbiBEQ0UxMS4yIGFuZCBhbHJlYWR5IHVzZXMgMy10YXAgYWx3
YXlzLgpOb3RlIDIgaXMgdGhhdCBEQ0Ugbm90IGNvdmVyZWQgb24gTGludXgsIG9ubHkgRENOKwoK
U2lnbmVkLW9mZi1ieTogS3J1bm9zbGF2IEtvdmFjIDxLcnVub3NsYXYuS292YWNAYW1kLmNvbT4K
UmV2aWV3ZWQtYnk6IENoYXJsZW5lIExpdSA8Q2hhcmxlbmUuTGl1QGFtZC5jb20+CkFja2VkLWJ5
OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfb3BwLmMgfCA1ICsrKystCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfb3BwLmggfCAyICsrCiAy
IGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9vcHAuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9vcHAuYwppbmRleCAxMTY4
MzQyYzcxOTAuLjcwNDVjMDBlZGFiOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjbjEwL2RjbjEwX29wcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY24xMC9kY24xMF9vcHAuYwpAQCAtMTY2LDcgKzE2NiwxMCBAQCBzdGF0aWMgdm9p
ZCBvcHAxX3NldF9waXhlbF9lbmNvZGluZygKIAkJUkVHX1VQREFURShGTVRfQ09OVFJPTCwgRk1U
X1BJWEVMX0VOQ09ESU5HLCAwKTsKIAkJYnJlYWs7CiAJY2FzZSBQSVhFTF9FTkNPRElOR19ZQ0JD
UjQyMjoKLQkJUkVHX1VQREFURShGTVRfQ09OVFJPTCwgRk1UX1BJWEVMX0VOQ09ESU5HLCAxKTsK
KwkJUkVHX1VQREFURV8zKEZNVF9DT05UUk9MLAorCQkJCUZNVF9QSVhFTF9FTkNPRElORywgMSwK
KwkJCQlGTVRfU1VCU0FNUExJTkdfTU9ERSwgMiwKKwkJCQlGTVRfQ0JDUl9CSVRfUkVEVUNUSU9O
X0JZUEFTUywgMCk7CiAJCWJyZWFrOwogCWNhc2UgUElYRUxfRU5DT0RJTkdfWUNCQ1I0MjA6CiAJ
CVJFR19VUERBVEUoRk1UX0NPTlRST0wsIEZNVF9QSVhFTF9FTkNPRElORywgMik7CmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfb3BwLmggYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfb3BwLmgKaW5kZXggMGYx
MGFkZWEwMDBjLi4yYzBlY2ZhNWE2NDMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24xMC9kY24xMF9vcHAuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNuMTAvZGNuMTBfb3BwLmgKQEAgLTExNiw2ICsxMTYsOCBAQAogCXR5cGUgRk1U
X1JBTkRfR19TRUVEOyBcCiAJdHlwZSBGTVRfUkFORF9CX1NFRUQ7IFwKIAl0eXBlIEZNVF9QSVhF
TF9FTkNPRElORzsgXAorCXR5cGUgRk1UX1NVQlNBTVBMSU5HX01PREU7IFwKKwl0eXBlIEZNVF9D
QkNSX0JJVF9SRURVQ1RJT05fQllQQVNTOyBcCiAJdHlwZSBGTVRfQ0xBTVBfREFUQV9FTjsgXAog
CXR5cGUgRk1UX0NMQU1QX0NPTE9SX0ZPUk1BVDsgXAogCXR5cGUgRk1UX0RZTkFNSUNfRVhQX0VO
OyBcCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
