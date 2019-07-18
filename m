Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCA76CAD2
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jul 2019 10:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E56E6E34D;
	Thu, 18 Jul 2019 08:20:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780047.outbound.protection.outlook.com [40.107.78.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D506B6E34D
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jul 2019 08:20:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O4QWSPP0y+BKqnq/pi3pU6YqSJ1cG0lmUvEgSL+Po67rGuokAA6lfHkGSAtH6ZC61NAXQIse5sxWJ/vrPND+jfuIFNlLPCfJcLtwdd8JGHpuNw/9mIxWQE9VfnqXvjvR/BBz+p1jW/1lX7axeqi7ZU5SwKgJdgur+SXS2svjOf01uFHXPxyz/P4AQ6HD1m2MvsN2GoYor7+s9juvopLDk0IutyEhYGbOs+Pxo6mFEFr3RFmmIsNsH3MDtJotToI9HV/QQGk0P8yI2krbuiDThL6bL3ejSrjX3Q3Goz9wgtfjr3JXs+Do2I8K2hNZfpbZoAkz2eV/0vVzZsXIUOEBvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FKRg2Cug2M04LUAYAIJSDOw3L96/kmpYQ3Pwev/ryC0=;
 b=S7HBc04CFMm+sPWfkseScdKhjaDC1jHdgrD8TXC/HFyTEGk2cWygHsKFId3bt+YAKC4GKdCmLmqRuzRAo1Y1PQrTfR5O94V+dmxYnwk8V5ffguvlJemj2JvC+xLQQ21Yu+IvdU8qzyuwHb8ugIdcyNMV03w1Zny9N/z2Jlz74vRYjAJgj9fyKRKycpnHod9E3rPjLmaQNj+pV4fGbYue6syDavJbw0m9MI8M+P18sHb+HrGASQCH97tv4zDTg2FFCAiUlARnDmaFeGGT+TR1BxfFPdgkebm40C8pEy+nya2I74zEaq49RrYgoqE/D7eMFQg1JA2qbqjn38Bfb6TPaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CY4PR1201CA0006.namprd12.prod.outlook.com
 (2603:10b6:910:16::16) by MWHPR12MB1933.namprd12.prod.outlook.com
 (2603:10b6:300:10b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Thu, 18 Jul
 2019 08:20:25 +0000
Received: from BY2NAM03FT017.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::207) by CY4PR1201CA0006.outlook.office365.com
 (2603:10b6:910:16::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.12 via Frontend
 Transport; Thu, 18 Jul 2019 08:20:24 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT017.mail.protection.outlook.com (10.152.84.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 18 Jul 2019 08:20:24 +0000
Received: from hawzhang-All-Series.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Thu, 18 Jul 2019 03:20:22 -0500
From: Hawking Zhang <Hawking.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/4] drm/amdgpu: do not create ras debugfs/sysfs node for
 ASICs that don't have ras ability
Date: Thu, 18 Jul 2019 16:20:11 +0800
Message-ID: <1563438014-29690-1-git-send-email-Hawking.Zhang@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(39850400004)(2980300002)(428003)(199004)(189003)(8936002)(305945005)(476003)(53936002)(36756003)(68736007)(7696005)(26005)(53416004)(50226002)(2351001)(2616005)(126002)(426003)(50466002)(86362001)(5660300002)(51416003)(336012)(48376002)(2906002)(186003)(4744005)(6666004)(356004)(70586007)(486006)(70206006)(81166006)(8676002)(81156014)(4326008)(47776003)(478600001)(316002)(16586007)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1933; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b977cc30-934e-4599-aa22-08d70b58c889
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1933; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1933:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1933662D8E841B922CBEFB9BFCC80@MWHPR12MB1933.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-Forefront-PRVS: 01026E1310
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: x9LmNCjTUTg+7KsOBj+IyyW+kbj49E4XcwvxFTxlEaxQ9hbd1SaSR2btMlvYNVMXYVgMak7SiwVQRjcOcZnRWzceKQqm5u5TEEwBbsXHqjfEGL6OZmZcA6oh1ZvqUdbleDNPvDwDKWClXalDFL2VsT66gAW9R9KYbPrBfEa1bB4uC+nA0u4lSsgiZOTc9hpUnsLuXzq6XwsqT9QjIm9n8NYISIgDOjhE+xoNQm9rseSfYFB9tQPiHX5hkTlN4J34LAnMklkrE8vWxQyZPB5CtFiMo0TdwBV3iDhDuh3PKgJrHjBKiivHNZ5WzUyyZK1f3Gzj2cuxo1uRpT+QQpgEW/+eY3+nTn4O6E9Fzfi8uC48p4LKZ9gw5T0sqXf9gxzdk/1bnvyGkGk+oATS0tSmWJ8j086mx4JuziUEPtUVuEA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2019 08:20:24.2615 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b977cc30-934e-4599-aa22-08d70b58c889
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1933
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FKRg2Cug2M04LUAYAIJSDOw3L96/kmpYQ3Pwev/ryC0=;
 b=CUhRb86EYxLAqCywzLWwTm63jdoMVQNU0K0JOWhNI+ktHtbVn6fPpEyDizNp4lknuByuWDE/870Gcj85VaOhyXr0Hurg9B5Z7tKy5RYVLoZQChFTV1JKMBbbSO26qSpAdpBgqwmH8tk0uclhAdEgVJFR1fEQbh0qDDIG5mpP03s=
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
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

ZHJpdmVyIHNob3VsZG4ndCBpbml0IGFueSByYXMgZGVidWdmcy9zeXNmcyBub2RlIGZvciBBU0lD
cyB0aGF0IGRvbid0IGhhdmUgcmFzCmhhcmR3YXJlIGFiaWxpdHkKClNpZ25lZC1vZmYtYnk6IEhh
d2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9yYXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwppbmRleCBj
MjBkMDNiLi5iZGE5MDI1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcmFzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5j
CkBAIC0xNDk2LDYgKzE0OTYsMTIgQEAgaW50IGFtZGdwdV9yYXNfaW5pdChzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldikKIAogCWFtZGdwdV9yYXNfY2hlY2tfc3VwcG9ydGVkKGFkZXYsICZjb24t
Pmh3X3N1cHBvcnRlZCwKIAkJCSZjb24tPnN1cHBvcnRlZCk7CisJaWYgKCFjb24tPmh3X3N1cHBv
cnRlZCkgeworCQlhbWRncHVfcmFzX3NldF9jb250ZXh0KGFkZXYsIE5VTEwpOworCQlrZnJlZShj
b24pOworCQlyZXR1cm4gMDsKKwl9CisKIAljb24tPmZlYXR1cmVzID0gMDsKIAlJTklUX0xJU1Rf
SEVBRCgmY29uLT5oZWFkKTsKIAkvKiBNaWdodCBuZWVkIGdldCB0aGlzIGZsYWcgZnJvbSB2Ymlv
cy4gKi8KLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
