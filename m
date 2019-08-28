Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CF7A0C14
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 23:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2A889F38;
	Wed, 28 Aug 2019 21:04:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770040.outbound.protection.outlook.com [40.107.77.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD31989F19
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 21:04:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A8uJJUlpmvkXZvC4NnHTM4+XaMmBmD35KglBw8RTkqSB6xuhWkTVu5fPX5hbEU70WHUnY7bCRBtUbpCSWq2se+JS8CRPPFpuVrv1csoO//3j1EP2ZM8gNBKvJEj0bmVLT8v9ZvjfDS80fMnWwRoPSF4PD5K0ILXlL50RgzVyyHoLT6XoolsDlvkyWkwSSXSX992D0j1zOBdeHvwuaPQ0JzPQ5ixmJR7Jn1ryV9mF0beo2Z5/NMbtQESqibOMX8JbinPQusjTNANblGDOWDnDLpl9OWwt4Q3EVjkV8NuJfO9tIRlZ3J5oDXKxzwTESN+dHtoHMdoCdSAmBGj8WN8KmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VGGVJ/o4bigcGAe7UJzr29jbgaTbxCGAQ0+hj2hK0sY=;
 b=dKTotWAlqlYqV30uVqotgCia1tsT3Spw02ZyFR8zXWWTufuVJzr0Lsjl/HNh9PSm2svpjXNonKNA4UMBgbKgaicuEU/BsfxMFUuYzuveksAtbwjNxcWEHSVKt5PnNEM7d+j9y3mjYQZYCnYx5avykREY/LUcmQKKGtrsW+muptdgDgBVmahBHjpXtIsTK9eG91D822hwn1z+6GlkORRL578VYNHJfu2YWEgOBtLxhLCeh2z+1FK71WpSqHG/+Eulin7KdToXMg4yiuhO8cVaQj9usT6OSxSCMmWkD4cD1uGEoFUATT1TLzrD54rgCNxfpzwDVD9XsYJzPTXMlorDGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0061.namprd12.prod.outlook.com (2603:10b6:0:56::29) by
 MWHPR12MB1535.namprd12.prod.outlook.com (2603:10b6:301:5::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.20; Wed, 28 Aug 2019 21:04:14 +0000
Received: from BY2NAM03FT004.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::200) by DM3PR12CA0061.outlook.office365.com
 (2603:10b6:0:56::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Wed, 28 Aug 2019 21:04:13 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT004.mail.protection.outlook.com (10.152.84.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Wed, 28 Aug 2019 21:04:13 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 28 Aug 2019
 16:04:05 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 10/17] drm/amd/display: remove temporary transition code
Date: Wed, 28 Aug 2019 17:03:47 -0400
Message-ID: <20190828210354.21464-11-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828210354.21464-1-Bhawanpreet.Lakha@amd.com>
References: <20190828210354.21464-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(376002)(346002)(2980300002)(428003)(189003)(199004)(8936002)(478600001)(11346002)(51416003)(76176011)(426003)(48376002)(53416004)(2906002)(446003)(7696005)(50466002)(2351001)(1076003)(4326008)(47776003)(316002)(126002)(50226002)(486006)(476003)(70206006)(5660300002)(2616005)(70586007)(6916009)(16586007)(8676002)(305945005)(186003)(336012)(6666004)(36756003)(53936002)(356004)(26005)(81156014)(86362001)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1535; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11b6b2a7-5d28-4c6f-9a10-08d72bfb47b4
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:MWHPR12MB1535; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1535:
X-Microsoft-Antispam-PRVS: <MWHPR12MB153546BC59D8051C857E57D3F9A30@MWHPR12MB1535.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-Forefront-PRVS: 014304E855
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: pzwFi9z6AMIh7NCjL+jEpigJKyjQWHyRgOOoZldwgOrD4gkDjtQRnu6LLcblGJn6eCj5lsqqfOWlZIJZgUwzrIdXmkssv4WuA9i4yALeVF1qs/Yq74+heFo0Fmv1JSi3A4pk6jedcRnQx6ZNbeDIlxiYdMzoPq89TJC+JRlwJWDaPbXiZc4TN4HbmOxsMGgcUCwaBQp292BlAV4EIZWMFEAiA62m6AjQQSyJtBi6DIHv5rsyGnTpW/t49RWecQOUGJZkmJIuMGTSyo+NHNg4zvUCGtEoL+O5tVEKtRBfi+je7XzBNxN5LMktfa2S3wdDwTTf7pBNjycKIYA1sxNXMECqvPxo8ti7J3smvDWUZPQbLwlIOETPmYG07ACk2FYrxkNUBBvigg7RYyunHI733Nz7/bA1mRYdAudcwkbm63Q=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2019 21:04:13.4457 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11b6b2a7-5d28-4c6f-9a10-08d72bfb47b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1535
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VGGVJ/o4bigcGAe7UJzr29jbgaTbxCGAQ0+hj2hK0sY=;
 b=KRaqdA0q9CbGbQeqQJ2MvHOn+ZOgBj4C5wScybyDHTxrT9qOZ9fjz8v51NrutXxz/8UMsMskXKxAb0TUcBygS4qYV9v0xo5x2KYZAKja1FupNcIRwQ0NLfdoKnPxSGQ0bnL2xw7tlmXr1j4OrjOSBo7SlhfJEYdsl1Y6BYX/ksU=
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
Cc: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KClJl
bW92ZSBjb2RlIHVzZWQgdG8gYWxsb3cgY29tcGlsYXRpb24gZXJyb3IgZnJlZQppbnRlcmZhY2Ug
Y2hhbmdlLgoKU2lnbmVkLW9mZi1ieTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1
c2hraW5AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IENoYXJsZW5lIExpdSA8Q2hhcmxlbmUuTGl1QGFt
ZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNfaHdfdHlwZXMuaCB8
IDI5IC0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjkgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjX2h3X3R5cGVz
LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNfaHdfdHlwZXMuaAppbmRleCAw
Yjg3MDBhOGE5NGEuLmRhZmMxOWE3YjY5OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjX2h3X3R5cGVzLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjX2h3X3R5cGVzLmgKQEAgLTEyNCwyMCArMTI0LDYgQEAgc3RydWN0IHBsYW5lX3Np
emUgewogCWludCBjaHJvbWFfcGl0Y2g7CiAJc3RydWN0IHJlY3Qgc3VyZmFjZV9zaXplOwogCXN0
cnVjdCByZWN0IGNocm9tYV9zaXplOwotCi0JdW5pb24gewotCQlzdHJ1Y3QgewotCQkJc3RydWN0
IHJlY3Qgc3VyZmFjZV9zaXplOwotCQkJaW50IHN1cmZhY2VfcGl0Y2g7Ci0JCX0gZ3JwaDsKLQot
CQlzdHJ1Y3QgewotCQkJc3RydWN0IHJlY3QgbHVtYV9zaXplOwotCQkJaW50IGx1bWFfcGl0Y2g7
Ci0JCQlzdHJ1Y3QgcmVjdCBjaHJvbWFfc2l6ZTsKLQkJCWludCBjaHJvbWFfcGl0Y2g7Ci0JCX0g
dmlkZW87Ci0JfTsKIH07CiAKIHN0cnVjdCBkY19wbGFuZV9kY2NfcGFyYW0gewpAQCAtMTQ4LDIx
ICsxMzQsNiBAQCBzdHJ1Y3QgZGNfcGxhbmVfZGNjX3BhcmFtIHsKIAogCWludCBtZXRhX3BpdGNo
X2M7CiAJYm9vbCBpbmRlcGVuZGVudF82NGJfYmxrc19jOwotCi0JdW5pb24gewotCQlzdHJ1Y3Qg
ewotCQkJaW50IG1ldGFfcGl0Y2g7Ci0JCQlib29sIGluZGVwZW5kZW50XzY0Yl9ibGtzOwotCQl9
IGdycGg7Ci0KLQkJc3RydWN0IHsKLQkJCWludCBtZXRhX3BpdGNoX2w7Ci0JCQlib29sIGluZGVw
ZW5kZW50XzY0Yl9ibGtzX2w7Ci0KLQkJCWludCBtZXRhX3BpdGNoX2M7Ci0JCQlib29sIGluZGVw
ZW5kZW50XzY0Yl9ibGtzX2M7Ci0JCX0gdmlkZW87Ci0JfTsKIH07CiAKIC8qRGlzcGxheWFibGUg
cGl4ZWwgZm9ybWF0IGluIGZiKi8KLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
