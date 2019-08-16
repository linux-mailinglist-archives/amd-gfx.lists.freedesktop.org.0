Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B388FA9C
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Aug 2019 08:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B1D56EACE;
	Fri, 16 Aug 2019 06:08:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680064.outbound.protection.outlook.com [40.107.68.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 365F26EACE
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Aug 2019 06:08:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sgy1z0bcrJCILZEDg5Ye7yGOsppxiLbSRu28ub/9NSObcuV+8qujj7dZX8HXQVdCWrmmIoK0UdZd/Je7REK0j4P8VsSjxvrWt9Y3ulON5fhxamf1xL8R6VPYqomDLrtJ66pvkkvvN8fw/K7PfRZMHUuK696uM4Z6+TOG55sHOdeKS656k2RMXcHp/chOE0NHeW1RujvkEesIgoMtRkJkWZsSFq62ifnODuYU86e3YbJIBLoh9dfDPNvIktUeX2Jw0qDH9KOKTAhLhSfcBvrPC9c9mziH6NFjUo+xppEGxIcEblgtRNgpgneZZRgKJNlDBXyI9j/zVIJRJFIv+oiQlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sa98ExHBcmYwl8zB3JeGN8FcIji7Z2BSd5+yReZx2WM=;
 b=aW8Fh5SBWEJf8P7KYoOtVKEQcbQstdZ2Kt1/d8Zpfsyflo0bTqjonXK4u7Gi0u8fQ8swDBXyRQ7cVGqzArRL+qn7261pg0QPVw/fqxWgz4rx2tm55WmeLC01n8fym+H0byUN2SnZLDjcbs+N55mFo5kOcBKIFbej38v2FzWMwrwELH2YLDFpozhZWR9dHXPJsF17/Zn3CmLiwWk7Bkt9DAAArEYS/PnHjNwlEpw5lWjlSjPAtt9IPoAqP9ehBXZrhR+mkvz80ADxkOpYJdvfWeQgPPq3WMekrY9EujRFIvHODU4WMeSDNRdsdReV5QF9JKkoz2iHceqYMUcQBxdMwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0066.namprd12.prod.outlook.com (2603:10b6:0:56::34) by
 DM5PR12MB1276.namprd12.prod.outlook.com (2603:10b6:3:79::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Fri, 16 Aug 2019 06:08:26 +0000
Received: from BY2NAM03FT034.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::204) by DM3PR12CA0066.outlook.office365.com
 (2603:10b6:0:56::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Fri, 16 Aug 2019 06:08:26 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT034.mail.protection.outlook.com (10.152.84.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Fri, 16 Aug 2019 06:08:25 +0000
Received: from equan-buildpc.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 16 Aug 2019
 01:08:25 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 4/4] drm/amd/powerplay: set Arcturus default fclk as bootup
 value on dpm disabled
Date: Fri, 16 Aug 2019 14:08:07 +0800
Message-ID: <20190816060807.11922-4-evan.quan@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190816060807.11922-1-evan.quan@amd.com>
References: <20190816060807.11922-1-evan.quan@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(136003)(376002)(346002)(2980300002)(428003)(199004)(189003)(356004)(7696005)(36756003)(76176011)(14444005)(50466002)(336012)(81156014)(81166006)(186003)(476003)(48376002)(1076003)(4744005)(51416003)(6666004)(86362001)(50226002)(8936002)(6916009)(2616005)(44832011)(426003)(11346002)(446003)(8676002)(5660300002)(126002)(47776003)(486006)(26005)(478600001)(2351001)(53936002)(316002)(305945005)(2870700001)(2906002)(70586007)(70206006)(4326008)(53416004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1276; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2bfb35aa-0332-4293-2ad9-08d7221026bd
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1276; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1276:
X-Microsoft-Antispam-PRVS: <DM5PR12MB127617E35A67ACFEE2F552EAE4AF0@DM5PR12MB1276.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:983;
X-Forefront-PRVS: 0131D22242
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: +BI6FzHBEtUGqrgINC9R2LHQKTf5FC7uJZJ2CbSTG0zjeBr/CZCu5QnGUUFypPKZPGyh3XvVn9Y0525MURXMO+vIggOKR8nuqutfnikwsh4ddoGMgT7n20VteGarXMwDxys3siF6mooOjYpBp59R4NOOW02tzlwhvwkma8w4r10YMRZaua9j/G0/zXWOyUJSiMAn2kJf1VNSWV7tiEJWmu07ZzJpIr61QuNDoYMWCQiG58Qg9tC/SKpqXm/wSFrJAYETNoa0PsfTkSvVrmefxz/mgLB5lMgXznTVLm0BZk8dOlpttk85f9Ep877COGksYAEE2KOiUTxFuwIzLT4aEZwD5okMmLcWqv9i2karYg6uJx8bB2Td7jZIrq73xb+51DHDhdb1fMI2lw1tBwHXn3/p9I5uAaBNWGIZA90FGNc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2019 06:08:25.9415 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bfb35aa-0332-4293-2ad9-08d7221026bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1276
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sa98ExHBcmYwl8zB3JeGN8FcIji7Z2BSd5+yReZx2WM=;
 b=mIm3MnNB9X6iqZpTO+TDEaCJqxKKKsTZQUc5ng1JoA/Y3t4zjA79LRrQgq0XGtsFPvrx0e2uhsI7aMXqnztImGO/L2gEwoJ/1xT1PTP8j7gy1n0XhJ2u181BuAiW/HOLXA73rPSLZ1A0qekmBuQtW407/An2vrYwlSfYLCqWELA=
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
Cc: Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gZmNsayBkcG0gZGlzYWJsZWQsIHRoZSBkZWZhdWx0IGRwbSB0YWJsZSB3aWxsIGJlIHNldHVw
IHdpdGggb25seSBvbmUKbGV2ZWwgYW5kIGNsb2NrIGZyZXF1ZW5jeSBhcyBib290dXAgdmFsdWUu
CgpDaGFuZ2UtSWQ6IEllY2Y3NGFhNWJkMTBjOWFhNzgzOWJjMzI4NzdjZmE5OWJjYmVmNGIzClNp
Z25lZC1vZmYtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMgfCAzICsrLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMKaW5kZXggOTEwN2JlYmE2NzkwLi5kYjhiZTZkOGQ5
MDMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3Bw
dC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jCkBA
IC00NjMsNyArNDYzLDggQEAgc3RhdGljIGludCBhcmN0dXJ1c19zZXRfZGVmYXVsdF9kcG1fdGFi
bGUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCiAJCQlyZXR1cm4gcmV0OwogCQl9CiAJfSBlbHNl
IHsKLQkJc2luZ2xlX2RwbV90YWJsZS0+Y291bnQgPSAwOworCQlzaW5nbGVfZHBtX3RhYmxlLT5j
b3VudCA9IDE7CisJCXNpbmdsZV9kcG1fdGFibGUtPmRwbV9sZXZlbHNbMF0udmFsdWUgPSBzbXUt
PnNtdV90YWJsZS5ib290X3ZhbHVlcy5mY2xrIC8gMTAwOwogCX0KIAlhcmN0dXJ1c19pbml0X3Np
bmdsZV9kcG1fc3RhdGUoJihzaW5nbGVfZHBtX3RhYmxlLT5kcG1fc3RhdGUpKTsKIAotLSAKMi4y
Mi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
