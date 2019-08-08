Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C013185B26
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Aug 2019 08:59:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B2388C5A;
	Thu,  8 Aug 2019 06:59:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690075.outbound.protection.outlook.com [40.107.69.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8E788C5A
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Aug 2019 06:59:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/7Dnxx7adNvnm1MbwsSguAXcokm9DeEnacg2WH9Cdvogvq8ZQENCegbWzUUg1GcQvV6piGJLVDr6QV1pslmiIRjxWvPfaQTacxH/1RlL4cohiBTXorHeFG0LJZp6TgmLiVE/RkCuSQAf6bC/odgyQYFfoDgD3uurRBErR3J9hVac738myHkHd8sXjBla+XjLX/auNUgkSMAz32cwOx8nmxBtO9gLNJ5R+a0hb4zW9IDgAIt9TgGrEbatWI7PQd+B5MypuFZMnmE0/oiEJm+DQRJe5PPPo3N2ipoM4iEiL5PNNf5kTNU28vSG5EeA9Z69I7GC/7GaVLli0cHkaSHGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nsb0VgP4MqFcj1/rs6lSUVO75VNUdGTqoHHn35nfMYY=;
 b=I6CmMAaG5G05x0c+NEylkFdSquGfIgiXtpopvXZ+cx4tvwCpEQ055g6pPQ7OcqDedoFjHZgKS7uls65N6gKOLxUMgny+u4QXhX02h++1AM7+KG6zRqFBMiCnEX2gGCpai5jIH4P5tC29a8E8mQd0FfBNGDwWurucbl7s9soiMcEkLYKcLmdOpBHYb8pEKMBx08zq/X1Chju3R9jizyBPOCS3jqA+PE6lj50cMTDzlLmPqKXgArRILlM7TSUMjJcJiH9HVPDCSXXy/MbfA81wiiOS3QXUnQcJ2eyMMiUVE0UgMfq5fXrRFvJjsEmWbE9awwzuOHZiUBI+on1HMF89Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM3PR12CA0079.namprd12.prod.outlook.com (2603:10b6:0:57::23) by
 BYAPR12MB2712.namprd12.prod.outlook.com (2603:10b6:a03:68::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Thu, 8 Aug 2019 06:59:19 +0000
Received: from CO1NAM03FT050.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by DM3PR12CA0079.outlook.office365.com
 (2603:10b6:0:57::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.14 via Frontend
 Transport; Thu, 8 Aug 2019 06:59:19 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT050.mail.protection.outlook.com (10.152.81.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Thu, 8 Aug 2019 06:59:19 +0000
Received: from guchchen-System-Product-Name.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server (TLS) id
 14.3.389.1; Thu, 8 Aug 2019 01:59:17 -0500
From: Guchun Chen <guchun.chen@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Hawking.Zhang@amd.com>,
 <Dennis.Li@amd.com>, <Xinhui.Pan@amd.com>, <Tao.Zhou1@amd.com>
Subject: [PATCH] drm/amdgpu: add check to avoid array bound issue
Date: Thu, 8 Aug 2019 14:59:04 +0800
Message-ID: <20190808065904.22438-1-guchun.chen@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(396003)(376002)(39860400002)(2980300002)(428003)(189003)(199004)(2906002)(6636002)(81166006)(36756003)(4744005)(8936002)(86362001)(486006)(50466002)(8676002)(48376002)(4326008)(2616005)(476003)(81156014)(44832011)(5660300002)(126002)(50226002)(478600001)(110136005)(2201001)(70586007)(47776003)(426003)(26005)(70206006)(53416004)(1076003)(53936002)(51416003)(7696005)(336012)(16586007)(6666004)(356004)(305945005)(316002)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2712; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3749ffe-75b6-467d-ebd7-08d71bcdef4f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BYAPR12MB2712; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2712:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2712DFEA796B41DD9EE149F1F1D70@BYAPR12MB2712.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:628;
X-Forefront-PRVS: 012349AD1C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Qqj/xwEnSIHXGT4KRRSOfQOsb7J7duamvnyS3w0W7/d9vNlw/CFuHGALJMD0Pkn70vTgS88gimLAqppEQbmKYxIfxoS2ju3E1bfDL6oiEQ7igotYhKm1MOZSUrWM1Ie2A+sBAxstsDyROHGmEASBrYTosvFAnlfA37xsxQpC889dMpPZu57elOerSze6xKxN1kP569vg/NsJzewQykwyHu6BK6tGMZLqmxQnRMAiBsA7q6i9vq3irjYowMsggBtSVSdvaW9V9x/rh4WfB803OU0kWfhcXOcJoRe+/JNSdKZrsX1Te3t3mz6YNMXcdJr2jOe2IoDhoBH9aRMAmHbv8IX2JFwINqVusHP55OAXDfyojo9SCqwHC0+3ovZRd/ZUzDqHeFcGAS6CJOP8uBB55ZFptr/fkjA0ZkQ47EeXEOs=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2019 06:59:19.1300 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3749ffe-75b6-467d-ebd7-08d71bcdef4f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2712
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nsb0VgP4MqFcj1/rs6lSUVO75VNUdGTqoHHn35nfMYY=;
 b=RZ9FY2bgN+yeT8w1Z8xs0HoZGqUW/VWWnH9ZuOk+QOCN0DCEofw5pPsM73xYMu7Ig2W8Plhl0ChQ9Ctv2KO7UhybxxOCYrFiyR/CaTNTrmC7VjGWknbgE2O2Xr7SFjXh+pWAnn0HlKmYHq1ZW3MMa9w1lBzT8sgMVcS6WRS7Ikw=
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
Cc: Guchun Chen <guchun.chen@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U3ViX2Jsb2NrX2luZGV4IGNhbiBiZSBwYXNzZWQgZnJvbSB1c2VyIGxldmVsLCBzbwphZGQgb25l
IGNoZWNrIGJlZm9yZSBhY2Nlc3NpbmcgdGhlIGFycmF5IGZpcnN0IHRvCnByZXZlbnQgYXJyYXkg
aW5kZXggb3V0IG9mIGJvdW5kIHByb2JsZW0uCgpDaGFuZ2UtSWQ6IEk1NTZmYzU2MGI0NDIxNTg0
OGJhM2E5NWY3NTdmZWJkZjNkMGFmNDIyClNpZ25lZC1vZmYtYnk6IEd1Y2h1biBDaGVuIDxndWNo
dW4uY2hlbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8w
LmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nZnhfdjlfMC5jCmluZGV4IDNlNDZjY2U2MDU1My4uNTljNzdiMDFjODhhIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKQEAgLTU5NjAsNiArNTk2MCw5IEBA
IHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfcmFzX2Vycm9yX2luamVjdChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwKIAlpZiAoYWRldi0+YXNpY190eXBlICE9IENISVBfVkVHQTIwKQogCQlyZXR1cm4g
LUVJTlZBTDsKIAorCWlmIChpbmZvLT5oZWFkLnN1Yl9ibG9ja19pbmRleCA+PSBBUlJBWV9TSVpF
KHJhc19nZnhfc3ViYmxvY2tzKSkKKwkJcmV0dXJuIC1FSU5WQUw7CisKIAlpZiAoIXJhc19nZnhf
c3ViYmxvY2tzW2luZm8tPmhlYWQuc3ViX2Jsb2NrX2luZGV4XS5uYW1lKQogCQlyZXR1cm4gLUVQ
RVJNOwogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
