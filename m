Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A128769D98
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D4BE89BAB;
	Mon, 15 Jul 2019 21:21:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800047.outbound.protection.outlook.com [40.107.80.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBAB089B9F
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nZtRGRPlchS9+lvgoB64dfpkxC+hxKZDVx4F8ZF+yY31HzA/YTkhNIq+VNdY1AZj2nNrhhIDO/u5l0E8cjPoVIcEHdwymN8osU47XvK/4piOHcKHfQlnZMjDeqEciDPXtiQTF983CzJ6kKDB25dz02q1HMKS+zJkYRVtBLwBHTtTPTo9QDD2iJrmlZRHDVgzhZbHnppA2Cl2jz9Rvh2qReqU1uDxOK4VHVxHw+uP0peMB/g7NtFYOmpmxd3ft7vTQVL1WTIlFS8c8MP8EjxyhjKkvLDOqV/dHLvoPsE+JiOzwRbTYbvYnZg2egDBKhyaXGJZjCe+AhiIRJ9Jc/ihiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smsbIu+JNINnKvYuWixsG+BBCMUa3InfAqQoL+Sjc4Q=;
 b=A2xkETFl/17XZBBAoEMf+hieqwg/TJumjNcOcxfkWihKOyBgs0NfIO1Odyevz4yJlKkMemLSc6Uixea0904qUXgqJRjB1O1OkHm7Cf77Sc4zcRbyaRhDOfZChIIKINTePwtbuDnxRm3gZQXpTIhJ06PhhyuddhNM8JYzt0BGba4slStt1vm0Z6K/XAoKUKcs6MjvMKPYNjnkgUZ2JTzZL8N8EobvBl6JCO0d64wwGHnIAcNxBPtAOKmXBC54HmFV9JqKOdxvLyYUdL5yQ8ceAAHu4H6J6Rt+rNcYRkitoihjGcT6M9PdFK0xUoOJx0WIr1axlXJPp/NMq7jgyepkqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR12CA0042.namprd12.prod.outlook.com (2603:10b6:301:2::28)
 by MN2PR12MB3101.namprd12.prod.outlook.com (2603:10b6:208:c4::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.10; Mon, 15 Jul
 2019 21:21:13 +0000
Received: from CO1NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by MWHPR12CA0042.outlook.office365.com
 (2603:10b6:301:2::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.10 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:12 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT009.mail.protection.outlook.com (10.152.80.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:12 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:04 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 06/87] drm/amd/display: 3.2.37
Date: Mon, 15 Jul 2019 17:19:28 -0400
Message-ID: <20190715212049.4584-7-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(136003)(396003)(2980300002)(428003)(199004)(189003)(76176011)(4326008)(6666004)(356004)(86362001)(1076003)(486006)(5660300002)(51416003)(2906002)(70586007)(6916009)(476003)(68736007)(47776003)(126002)(478600001)(2870700001)(70206006)(305945005)(50466002)(2616005)(48376002)(11346002)(2876002)(446003)(53936002)(26005)(50226002)(54906003)(426003)(49486002)(81156014)(316002)(336012)(186003)(81166006)(36756003)(14444005)(2351001)(8936002)(4744005)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3101; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24f23926-25b4-4d9a-a822-08d7096a5d17
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MN2PR12MB3101; 
X-MS-TrafficTypeDiagnostic: MN2PR12MB3101:
X-Microsoft-Antispam-PRVS: <MN2PR12MB310120A74AB1E14FF5276A7582CF0@MN2PR12MB3101.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: oCZatmJ92aqpRGJKjd8kJum7zufKq+3EZO577YnuqApz56Zc3vUbnsG9jCl5nSVXvMFF9Ct071h/IkpQq2tq5kMl6MhK0gM56xJgTJTZHKAVSB1lTEMW8Y0GNGNv4fIl5LRbw5lg0zh4rot0CL3tXL/Mz9Ez6GNVrEy4d/jtAKHrZTK3ygUY/o/A4fx/lt2uARit8vXc/wzh42E8IZ4V5P6rKJmwMDfNP6y+dOOCRmqwgoOwVXtLrusnK53NPyQuFe4EIUcrFVNoKN7oFBBrgCmbw6/1vSuIKXBVGUY7ToOa440qeuyLEzoykf9JmkxkTgnRkiykbEZ4mnytLd91NYifoqjMZW6/7g+HwPbTfawWO8UenjtItl3uq4ctCG0bULRmpea3gIa+pFo17YR9Oo/VayRI5CNs4W5RwDB6Ap0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:12.6206 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24f23926-25b4-4d9a-a822-08d7096a5d17
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3101
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smsbIu+JNINnKvYuWixsG+BBCMUa3InfAqQoL+Sjc4Q=;
 b=jEXJfneSyuMbNDSqna4AySlAHy/UDtn/O4sIWthLGC1qXvje+GFanXEXzfVzb/skjTVW2mnn95cYp4mbZTyPEJrP6OEDAqpKVCEUyBQwzTvXLkvxVezek9o8bvAPntY6EF0iXsL5geRrTZ19C38k3i+nvd4R0NS0Qq4NT6Rp298=
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
Cc: Leo Li <sunpeng.li@amd.com>, Aric Cyr <aric.cyr@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQXJpYyBDeXIgPGFyaWMuY3lyQGFtZC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBBcmljIEN5
ciA8YXJpYy5jeXJAYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGMuaAppbmRleCAyYTdmMjVkMzcyZTEuLmMwZWJiNzdmYWI3MCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKQEAgLTM5LDcgKzM5LDcgQEAKICNpbmNsdWRlICJpbmMv
aHcvZG1jdS5oIgogI2luY2x1ZGUgImRtbC9kaXNwbGF5X21vZGVfbGliLmgiCiAKLSNkZWZpbmUg
RENfVkVSICIzLjIuMzYiCisjZGVmaW5lIERDX1ZFUiAiMy4yLjM3IgogCiAjZGVmaW5lIE1BWF9T
VVJGQUNFUyAzCiAjZGVmaW5lIE1BWF9QTEFORVMgNgotLSAKMi4yMi4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
