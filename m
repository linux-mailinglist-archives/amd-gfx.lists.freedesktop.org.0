Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE482A20CC
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 18:24:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 830696E159;
	Thu, 29 Aug 2019 16:24:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770054.outbound.protection.outlook.com [40.107.77.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 478A66E142
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 16:24:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CvUvh4L9M2GlKbwDWp5C/ZqQSdEGHkdRWA3bdzi33ZMdPPUI0+3Fo59I9oTvLHc5FLV0cJ/xsW/k9FhUxkpHlgm1De+IRylQkjbzuPMv79gyR2bZ//8qM7ChjMiZ+fj9i1yvtBChOhWwusZpOsw8aeY64mREeCt7JznpPKc1jlNFK7Asilwdo5hu5ip5htmYIp3k8kOsy07zES3eVINqsaDPCYYLEHld+wWO6BYajZhYkhHrxMuP+BXkNLw/AjkQDA16Dk2eA8Qyw97r04RBZS2sTbZUAeisQ2jzqn8lPBWVERYZDlcNyz8YCQ8HEXsNnICiCuJFXZqIJS9zzHCrNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/t7sCxRl03e/P0X2ZMAo3org00DrN0+X+0P8khI3fQ=;
 b=Wpkr4rl/U0UQ0s7h30Z7iBNN7RSr4vVf4KHIvtg/67oVYOsqcSziTYCdMxmmossHuwpTwkLPabrntWfqR/bz8+KMVlD9V9dYvT7v3QE1jL/AIqp7WSshBnjhMGYp4XhFQsgDeiJ4M/pJ4ruU0LSxpW9r4N4OWDZtGfVdAYCJAXdwQO/VHTlibuJpGzVzev+trPsl8BezDk+UGmyeypYVxibgCfaKg9lSp0RjYVjmCRzi6latWNkvMmq0KB2nGsWX6XZKDyxFaTXHs+hQSTREBHu95xwBDZkGidY4GQLWAbHrqHC2NFF0Xbs3ky8PBRatU9PtX8rHDVhEZfRPC8e8Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR1201CA0007.namprd12.prod.outlook.com
 (2603:10b6:910:16::17) by DM6PR12MB2714.namprd12.prod.outlook.com
 (2603:10b6:5:49::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.21; Thu, 29 Aug
 2019 16:24:12 +0000
Received: from BY2NAM03FT037.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::207) by CY4PR1201CA0007.outlook.office365.com
 (2603:10b6:910:16::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.19 via Frontend
 Transport; Thu, 29 Aug 2019 16:24:11 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT037.mail.protection.outlook.com (10.152.84.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Thu, 29 Aug 2019 16:24:11 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 29 Aug 2019
 11:23:49 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 20/20] drm/amd/display: Add hdcp to Kconfig
Date: Thu, 29 Aug 2019 12:22:53 -0400
Message-ID: <20190829162253.10195-21-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190829162253.10195-1-Bhawanpreet.Lakha@amd.com>
References: <20190829162253.10195-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(136003)(39860400002)(2980300002)(428003)(189003)(199004)(4326008)(4744005)(50466002)(48376002)(478600001)(6666004)(356004)(5660300002)(1076003)(70206006)(2351001)(86362001)(36756003)(47776003)(16586007)(53936002)(316002)(53416004)(2616005)(8676002)(126002)(51416003)(2906002)(70586007)(486006)(50226002)(6916009)(81156014)(186003)(426003)(305945005)(7696005)(336012)(11346002)(26005)(8936002)(76176011)(476003)(81166006)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2714; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc5a7f0a-0c26-4505-712f-08d72c9d5374
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:DM6PR12MB2714; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2714:
X-Microsoft-Antispam-PRVS: <DM6PR12MB271448EEA804B1D06CACE626F9A20@DM6PR12MB2714.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0144B30E41
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: V1rNZOC5myF99V6nGmo//nF5ydvrQM4hjPD5CpRhCnj1lFyWMDvWd0Lz5e7HpPZycYpbjSHSsWPwnjceYTtottUYBn0S03TyYHw7UmJXnGCtEa7LhiKSSBpKbmyRgEaloGrYHUHHmP153jsERVgdromSe/uYRj2HyDuGmClikO0igF2rHOz9HWG8TO5CKHnRD6QEAXl+aXWqkLD1Rqm6nl7LVnNLIJtDT+TqeJHgwFrHZ9SkWXlIm+vrKJALWwGv2mscyYBZ0/VFVUisMIJpRA/iPdmz/wGcIrrpzsw/Lq9hf1H7Zi12NEM48Q5AH8a4CAXk05ahNw3SrybrXgiLE4NglOvn14eioMYJSO3i2x8wO8BXkbZdra+bPehw3HsRzKMBxy2JbvzIrlDpK06QfZB4ypR/9/5rKTxk/7NV6P4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2019 16:24:11.6248 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc5a7f0a-0c26-4505-712f-08d72c9d5374
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2714
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/t7sCxRl03e/P0X2ZMAo3org00DrN0+X+0P8khI3fQ=;
 b=fAr8wl8pmGDBIwpDHeQDWs5l2QXggjuytQpes+enuRmy80wmGV0md2tWO8x+VvZKXZjjjbMXBSnjBy7iAWGbyuRLAIZkrkD9UcquU0ZUw1KLGm+ZJlz0BThceInQE0HdrCotdpOwcCTQjlG8JD563/RPhK4E8lEiWMYWRlvagVA=
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

W1doeV0KSERDUCBpcyBub3QgZnVsbHkgZmluaXNoZWQsIHNvIHdlIG5lZWQgdG8gYmUgYWJsZSB0
bwpidWlsZCBhbmQgcnVuIHRoZSBkcml2ZXIgd2l0aG91dCBpdC4KCltIb3ddCkFkZCBhIEtjb25m
aWcgdG8gdG9nZ2xlIGl0CgpTaWduZWQtb2ZmLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2Fu
cHJlZXQuTGFraGFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvS2Nv
bmZpZyB8IDggKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9LY29uZmlnCmluZGV4IDQ4Yzc0MjNlOTJkYS4uM2UzOWMwYzJlZTdl
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvS2NvbmZpZworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvS2NvbmZpZwpAQCAtMzUsNiArMzUsMTQgQEAgY29u
ZmlnIERSTV9BTURfRENfRFNDX1NVUFBPUlQKIAkgICAgQ2hvb3NlIHRoaXMgb3B0aW9uIGlmIHlv
dSB3YW50IHRvIGhhdmUKIAkgICAgRHluYW1pYyBTdHJlYW0gQ29tcHJlc3Npb24gc3VwcG9ydAog
Citjb25maWcgRFJNX0FNRF9EQ19IRENQCisgICAgICAgIGJvb2wgIkVuYWJsZSBIRENQIHN1cHBv
cnQgaW4gREMiCisgICAgICAgIGRlcGVuZHMgb24gRFJNX0FNRF9EQworICAgICAgICBoZWxwCisg
ICAgICAgICBDaG9vc2UgdGhpcyBvcHRpb24KKyAgICAgICAgIGlmIHlvdSB3YW50IHRvIHN1cHBv
cnQKKyAgICAgICAgIEhEQ1AgYXV0aGVudGljYXRpb24KKwogY29uZmlnIERFQlVHX0tFUk5FTF9E
QwogCWJvb2wgIkVuYWJsZSBrZ2RiIGJyZWFrIGluIERDIgogCWRlcGVuZHMgb24gRFJNX0FNRF9E
QwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
