Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 249AC69DDC
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F3489D4A;
	Mon, 15 Jul 2019 21:22:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710078.outbound.protection.outlook.com [40.107.71.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 517BC89CB9
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ofThkye2GBtW8+wyXU3fMN7cSEbIFQdFZsn6wPXu9T1OigE/qgRdCPxweVVPPa2S71Xr55T1TgsyRNhLrSaFdzEBgEsjsAnk1Xdhags6GiiuHBHVUEbLYb2KIgjZzYi7p9wOFm8qT/KVT9HUoQ6u5xx207vp1buJViYkfEQIBzpDTxjNk8aCIduqYKqfx6GgMm3JnWE3SXpaJY4uIBaGKP6MuzGSkt2ktXQJDueD4RqBwdyuwtT0Vp47bgFy476VW95xdAqGMm7OF13QyXoYNc6+2/T3Dkvo7HJcumF9Wlz+Bef6VrKuNue8m5vfG2j9plcDZ9wcuAs85u22P5PT1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LCxZBBNtsonQEV1TcbP4VFNwIs3frOU6cCxi/iJKD7E=;
 b=aFJkAcgY1JYEyjVmJFvn3lVwTNCQuYAF1TVcGFebuQdzFY/IaQEoYa1wraUgfkc/pZvJ4vOlFOXpC+ADDXWl6kUvtdLEmnKXOU7VU+DAtej2UOncy86lSaraq14Ex2hVVXhugUkevOX7k+8hAj1l8hgPYoUxiCZoCN9Ilnip20wcQwD6zy1jvtjL73nhriBoT8rd4XwkZCXOGklVCuRxOoHm6fzmktgGV99zBLVT4Mznu7Xpt98askRfSfpOZgDZdSQrmmGoPq6LkMqVQY59CKQDLkO51jxl1nn5C+wpvMY1xM+uvLvRmXbOiu5oysWSmpbAylpa8ce464g6xHI9aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MN2PR12CA0007.namprd12.prod.outlook.com (2603:10b6:208:a8::20)
 by MN2PR12MB3933.namprd12.prod.outlook.com (2603:10b6:208:16a::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Mon, 15 Jul
 2019 21:21:52 +0000
Received: from CO1NAM03FT049.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by MN2PR12CA0007.outlook.office365.com
 (2603:10b6:208:a8::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.14 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:51 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT049.mail.protection.outlook.com (10.152.81.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:51 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:33 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 60/87] drm/amd/display: 3.2.41
Date: Mon, 15 Jul 2019 17:20:22 -0400
Message-ID: <20190715212049.4584-61-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(346002)(376002)(2980300002)(428003)(189003)(199004)(476003)(8676002)(305945005)(446003)(486006)(126002)(4744005)(1076003)(54906003)(48376002)(11346002)(47776003)(49486002)(186003)(2616005)(6666004)(356004)(50466002)(6916009)(86362001)(14444005)(76176011)(5660300002)(26005)(70206006)(68736007)(426003)(2351001)(70586007)(478600001)(53936002)(50226002)(8936002)(2876002)(51416003)(316002)(81166006)(81156014)(2906002)(36756003)(4326008)(336012)(2870700001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3933; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6da615be-ef89-4651-31f0-08d7096a7440
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MN2PR12MB3933; 
X-MS-TrafficTypeDiagnostic: MN2PR12MB3933:
X-Microsoft-Antispam-PRVS: <MN2PR12MB393327BE4929F4BC2444DCA182CF0@MN2PR12MB3933.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: aOy3qp0I3modEYlpH7/J4JIHpZDzCjQSPHaalUuiwNxl1S4UDoM16D/UNskr203mwIBcYq14vwzxNaJSLPHznufSScpGcJ9q4HShXuKJ8U17g4bON15hQqn7xBcdgyoErADN1n6Bfhkk73wCbyxYKeatnz+t+ldo2gPfjXN7ovRJjeWqCEEftBtaA4gJi0C34ofOPFR7DYTOT35QQAUKBaboTD70HNAcXS8JRhB+YlE0zjLSAKrHYi8YzqDuQ9Kfi+QFlMp+8K0hGBlM4EfVPugusQpnI9P/NiKKa9K+UUF7z5m/XUimiIvaCijs87CjubC9p4+I8qHTGa8TYxuowAKJu6G2vW+F38KgG9iE/tltSX2QrsqTCR6YIb1+D5aCR6AATm8qAszh4mdopKwRjuWd5ZvBKQQWfwXxV3GkxXM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:51.4739 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6da615be-ef89-4651-31f0-08d7096a7440
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3933
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LCxZBBNtsonQEV1TcbP4VFNwIs3frOU6cCxi/iJKD7E=;
 b=Vjz4vNXjV862Qv3DySUnpB49U3AuM2FU3kNIBYCsOwSU0eqzT2ZBwbZoCZr2TnfABOD7seu1OoCizd/w6JFRqQi9qw9ebOGeQl142RKLO85zOJw1PQyofAuyqThG8FfXLMXu4IH5y6dzO+wwmKModF1DVjk8HFVuBHto5wC42OE=
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
c3BsYXkvZGMvZGMuaAppbmRleCAyNzkwMDI5N2JkY2YuLmFiYzAzOWI4MzZkNCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKQEAgLTM5LDcgKzM5LDcgQEAKICNpbmNsdWRlICJpbmMv
aHcvZG1jdS5oIgogI2luY2x1ZGUgImRtbC9kaXNwbGF5X21vZGVfbGliLmgiCiAKLSNkZWZpbmUg
RENfVkVSICIzLjIuNDAiCisjZGVmaW5lIERDX1ZFUiAiMy4yLjQxIgogCiAjZGVmaW5lIE1BWF9T
VVJGQUNFUyAzCiAjZGVmaW5lIE1BWF9QTEFORVMgNgotLSAKMi4yMi4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
