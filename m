Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5399FC908C
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 20:16:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D97E6E964;
	Wed,  2 Oct 2019 18:16:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820048.outbound.protection.outlook.com [40.107.82.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C13EF6E905
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 18:16:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jdnm+qRkhcDGGMPlk7KNydSzVWceLnf/q57QPfleJHSxrMRL1NA9JLsR5cLnrfr3FrzWpTiwSs9JMw0V07+XiNg0lwwRu4NmdD59ot8hqlGyHbiqFnGJZArZb9qylkpmCjfoMMqG9jk0Uij19bEWfsTJVE4zCLe8U/MZvV9LwpCEE+CaIguV1w/oxGPaur8qUXfGmLqKuDLJO09919j0QTs2860YvjLMLrD8UUi1genaBo0q2LUtpmFmnQdVpwWz8RwTaejMl9D++OqRgQ1CuhXNTB8CjJ+y9i74dGcVDXYG2LZjxT871/fBL8xxoOHDWXePcceLIdzUcM7jd9Xx9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VCDE5xmlVnaEeupGIO3qlVQT2DgkFEMpEf28sB8gdzU=;
 b=DkNhtIwV6n8Yxm0dEV8tohYJ9rh4WoSlIwu9Xr3HqqGYfH32s3cT2FUNV5A2viRzpXRI9/rC2Iop835UXSwDp0XN9dm1cpwVtO16hxdF5bq1aks6dbRhK1Ycw6RtedyFEH/jjmLv3BXZ6ptSgY39j8e9ggW8R6TyR+VMKRN1eMki7Mjn7sQEwrBLgklMaTfUY3tSc1er1jra6wKViQFDWkHGZGkisy+6Ungyf3DCzXqNh2GZQugoWjDIrKIsQ3rRxCVpvDKmaylBFnd1puz5/xdoCoVZCe+so+mrG2UI/Lw4zI5nx78v37CyzpJGWXaOgyxKmwdCkZMgigIro/g8BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0131.namprd12.prod.outlook.com (2603:10b6:0:51::27) by
 BY5PR12MB4050.namprd12.prod.outlook.com (2603:10b6:a03:207::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.15; Wed, 2 Oct
 2019 18:16:43 +0000
Received: from DM3NAM03FT053.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::200) by DM3PR12CA0131.outlook.office365.com
 (2603:10b6:0:51::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.15 via Frontend
 Transport; Wed, 2 Oct 2019 18:16:43 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT053.mail.protection.outlook.com (10.152.83.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 2 Oct 2019 18:16:43 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 2 Oct 2019
 13:16:42 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 19/38] drm/amd/display: fix bug with check for HPD Low in
 verify link cap
Date: Wed, 2 Oct 2019 14:16:14 -0400
Message-ID: <20191002181633.22805-20-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
References: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(396003)(39860400002)(376002)(428003)(199004)(189003)(4326008)(1076003)(6916009)(47776003)(14444005)(15650500001)(16586007)(50466002)(70586007)(186003)(76176011)(50226002)(305945005)(7696005)(70206006)(51416003)(8936002)(316002)(2906002)(53416004)(126002)(486006)(356004)(6666004)(26005)(426003)(5660300002)(2616005)(476003)(2351001)(36756003)(48376002)(336012)(478600001)(446003)(11346002)(86362001)(81166006)(8676002)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB4050; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81d52b78-187a-4e02-ec91-08d74764addc
X-MS-TrafficTypeDiagnostic: BY5PR12MB4050:
X-Microsoft-Antispam-PRVS: <BY5PR12MB4050A0089BA4DEB97E05200EF99C0@BY5PR12MB4050.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-Forefront-PRVS: 0178184651
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qGAUPwtiWYXa7N+BLDvrKPTDLFeq2n3vdYLzOzOg4eawvpVI1Dm6G7O4u81BW4l4Slt5FXbW6pM2nu8APt3Wyml9P9N8wvXqsG6BqDjiRzm3AXXKYh7ca+bfsi126euLmS+lFrPyBa1TfI5DDHSYyhMKqEyUuYyjhBsCOmE5cn7yR95/iCJXLbLZ2D+6q2NnkdJ+v6T5n39MSeJZvBbQH1Q3dDQUOIFg8uAbSLVRPG0b5fm49rN+RKGSy/dDFZbqQS9mSA0KE6g6pBFy25T9XQNLAU6RhHDff140/WthUHIimRfg+qgcbWuHF08fTRKM9SvKmB7KlzAFpSmxgcTw00bCb34P387uJ48/thkLSB/IFRqsgaSBgZ0P6ddkbHOldtKiYxqbnAQNZnYf3ZGNLp/vKdNwhmhP0noxzra+72Y=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2019 18:16:43.4502 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d52b78-187a-4e02-ec91-08d74764addc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4050
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VCDE5xmlVnaEeupGIO3qlVQT2DgkFEMpEf28sB8gdzU=;
 b=FBW3jenxEWbDjD+iIBZIUFfMeRlx+RtaFPZzp0eMW3kA6uqvpRUndcHyPgEvIkvgDmnJNVQgyG09irPesZAJAAjCNoATp+zyLeaYsEQ4g4X928/sxjLn3G8DhaBp7/DlBWDyER3I/a2lyorrhwrU3lUdFH+a+yCYMAmZ6Lw2Wig=
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
Cc: Sivapiriyan Kumarasamy <sivapiriyan.kumarasamy@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogU2l2YXBpcml5YW4gS3VtYXJhc2FteSA8c2l2YXBpcml5YW4ua3VtYXJhc2FteUBhbWQu
Y29tPgoKW1doeV0KVGhlcmUgaXMgYSBidWcgd2hlbiBkZXRlcm1pbmluZyBpZiBsaW5rIHRyYWlu
aW5nIHNob3VsZCBiZSByZXRyaWVkIHdoZW4KSFBEIGlzIGxvdyBpbiBkcF92ZXJpZnlfbGlua19j
YXBfd2l0aF9yZXRyaWVzLgoKW0hvd10KQ29ycmVjdGx5LCBmYWlsIGRwX3ZlcmlmeV9saW5rX2Nh
cF93aXRoX3JldHJpZXMgd2l0aG91dCByZXRyeSB3aGVuCkhQRCBpcyBsb3cuCgpDaGFuZ2UtSWQ6
IEk2ZmJmNjRjMjhmMGFhYzk2MjUyYTUwODcxNWE4MDY5MjdmYjg2ZDYzClNpZ25lZC1vZmYtYnk6
IFNpdmFwaXJpeWFuIEt1bWFyYXNhbXkgPHNpdmFwaXJpeWFuLmt1bWFyYXNhbXlAYW1kLmNvbT4K
UmV2aWV3ZWQtYnk6IFdlbmppbmcgTGl1IDxXZW5qaW5nLkxpdUBhbWQuY29tPgpBY2tlZC1ieTog
QWJkb3VsYXllIEJlcnRoZSA8QWJkb3VsYXllLkJlcnRoZUBhbWQuY29tPgpBY2tlZC1ieTogQmhh
d2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kcC5jIHwgNyArKysrKy0tCiAxIGZp
bGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZHAuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZHAuYwppbmRleCA3MDFiNzM5
MjY2MTYuLjVhMGMzMzg0YzE2YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2NvcmUvZGNfbGlua19kcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9jb3JlL2RjX2xpbmtfZHAuYwpAQCAtMTY1NiwxMSArMTY1NiwxNCBAQCBib29sIGRwX3Zl
cmlmeV9saW5rX2NhcF93aXRoX3JldHJpZXMoCiAKIAlmb3IgKGkgPSAwOyBpIDwgYXR0ZW1wdHM7
IGkrKykgewogCQlpbnQgZmFpbF9jb3VudCA9IDA7Ci0JCWVudW0gZGNfY29ubmVjdGlvbl90eXBl
IHR5cGU7CisJCWVudW0gZGNfY29ubmVjdGlvbl90eXBlIHR5cGUgPSBkY19jb25uZWN0aW9uX25v
bmU7CiAKIAkJbWVtc2V0KCZsaW5rLT52ZXJpZmllZF9saW5rX2NhcCwgMCwKIAkJCQlzaXplb2Yo
c3RydWN0IGRjX2xpbmtfc2V0dGluZ3MpKTsKLQkJaWYgKCFkY19saW5rX2RldGVjdF9zaW5rKGxp
bmssICZ0eXBlKSkgeworCQlpZiAoIWRjX2xpbmtfZGV0ZWN0X3NpbmsobGluaywgJnR5cGUpIHx8
IHR5cGUgPT0gZGNfY29ubmVjdGlvbl9ub25lKSB7CisJCQlsaW5rLT52ZXJpZmllZF9saW5rX2Nh
cC5sYW5lX2NvdW50ID0gTEFORV9DT1VOVF9PTkU7CisJCQlsaW5rLT52ZXJpZmllZF9saW5rX2Nh
cC5saW5rX3JhdGUgPSBMSU5LX1JBVEVfTE9XOworCQkJbGluay0+dmVyaWZpZWRfbGlua19jYXAu
bGlua19zcHJlYWQgPSBMSU5LX1NQUkVBRF9ESVNBQkxFRDsKIAkJCWJyZWFrOwogCQl9IGVsc2Ug
aWYgKGRwX3ZlcmlmeV9saW5rX2NhcChsaW5rLAogCQkJCSZsaW5rLT5yZXBvcnRlZF9saW5rX2Nh
cCwKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
