Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A470F69DA1
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2335B89BF5;
	Mon, 15 Jul 2019 21:21:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::60c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7AF189BAF
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U8tcjV+x7doeD9is2mA0spyOLxI80DTiBMCWIJyypSqxd58Daps+3+RVChuwWz9y25hq67iQy5EwJGYsQof9Nq5PGmOUhMlU5tncupwtrbf6NSmUlYI7iRMUS9U6pCd8HxaboypV06BU8MPawapqbyupFaNYO5z6tyZLEmmM5GlZQYtH8aM3aNJls78JBk4k+ieaBpQOxPDUMsWI0pG9rTlazcLDSiV3AgIMo+JlKFMHGJ9MfRNdsIPgyByfjBTTCHFh7Iuq10BqMKfT5UAJVKAAao5FC/3bwwHvFPpzsA+E9Vmg0OCdFlGrCsNL1yUJ4vJqk+lOX9GxhFbeaMZx1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYofNhHcXiJdhSWWEE6xfIGVqnG1rK6ffsuRN+doxxs=;
 b=NMX5CILCHXQlnvN3IfLWpHvD48kmAjGUHRFMP15l70NZg07NNAJl88XsgMATfUg3QmdnF5+d8gKlwE+hMhg9CoM7huOni/BUDOy9kQM29NZvjjWFIWO5i/rFdOf+U7uuTq2p5yRD4lTh9/mt147FnLlXGPTIN5B2Rv+lk6BK/NtF71CdDK0HyCTfESbmEAUcCnbPaZCTPobEoXGA4kQAgrEEclevVrt2leCj+uS6deUspjse5rkZwISZLp3uKhDhoSQDwmJyYEVrw8YgX/40eYVnigvTNqDtOvoza2PQltcT35O6UAkYzv8RDBS9Ssg1Ws+WbjfdyvdmjF9rEPR47g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR12CA0041.namprd12.prod.outlook.com (2603:10b6:301:2::27)
 by DM5PR12MB1932.namprd12.prod.outlook.com (2603:10b6:3:10e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Mon, 15 Jul
 2019 21:21:21 +0000
Received: from CO1NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by MWHPR12CA0041.outlook.office365.com
 (2603:10b6:301:2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.14 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:21 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT009.mail.protection.outlook.com (10.152.80.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:21 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:08 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 15/87] drm/amd/display: swap system aperture high/low
Date: Mon, 15 Jul 2019 17:19:37 -0400
Message-ID: <20190715212049.4584-16-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(39860400002)(346002)(2980300002)(428003)(189003)(199004)(70586007)(70206006)(8936002)(486006)(36756003)(54906003)(316002)(305945005)(47776003)(426003)(53936002)(11346002)(126002)(356004)(446003)(2616005)(6666004)(8676002)(476003)(81156014)(81166006)(68736007)(50466002)(2351001)(336012)(6916009)(1076003)(50226002)(478600001)(2906002)(86362001)(2876002)(2870700001)(48376002)(4326008)(5660300002)(51416003)(186003)(26005)(49486002)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1932; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75af706d-cef9-418c-0e80-08d7096a6221
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1932; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1932:
X-Microsoft-Antispam-PRVS: <DM5PR12MB193254A663FAA1BF0505FB1882CF0@DM5PR12MB1932.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: nt/j7TjkFxp06paomz3O0Rj5+jX7lHuMtwGcthNHhpbTWVSaVGGgLyyY3QmLxLfCF9MB/jf9R8b2gW2dlrY3UJXSwNL8TIeQZyRg8RPsiY7z25D+moTvKgytum2BUKhFlZNphsK0zeSD8iZ1KVYbO0BzG0moGaX8c+EyAWzdNRJRNlhZvId2v/LqhanrU4r2u0jjNlgZzvcc7VDYjoVnpL1fo3eAfk/hEkR44PV1E1wABPs1VuZhgGT+i0SJ+ezkX2c0g92BzlvslJbmUyVwWcGr0crCzeLhkUZL3k4ujzbzf8FXeuxjTjn9fz7AJG5v4RHeDEAgg87rHSAiSf4E/pXR5Wv5DZlxGF9gDd+5UvpM9YxoG2RosGCmWS3grIYVR/2dMHfaPjWROdAJeBHWk8iW3AnVZSKh17ndazTaN34=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:21.1759 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75af706d-cef9-418c-0e80-08d7096a6221
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1932
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYofNhHcXiJdhSWWEE6xfIGVqnG1rK6ffsuRN+doxxs=;
 b=se9/vkjhNzNb3hbJmU9fM0ZW3C4l6AIzZqpcTLI7WApfk5nnSFRctDxQfgfF1BN2EHz8jM4zn1/lQOh/8BYf3ArhmJ2F5BPEwzLk/7Q4TuQUljKSZ+L0rWU3/ssXwLBQHjyBJZRccKwQ5zp08/J/H/TEs9cWM+0hZG/2xtkT2vc=
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
Cc: Leo Li <sunpeng.li@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Yongqiang Sun <yongqiang.sun@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSnVuIExlaSA8SnVuLkxlaUBhbWQuY29tPgoKW3doeV0KQ3VycmVudGx5IGxvZ2ljYWwg
dmFsdWVzIGFyZSBzd2FwcGVkIGluIEhXLCBjYXVzaW5nCnN5c3RlbSBhcGVydHVyZSB0byBiZSB1
bmRlZmluZWQsIHNvIFZBIGFuZCBQQSBjYW5ub3QgY28tZXhpc3QKCltob3ddCnByb2dyYW0gdmFs
dWVzIGNvcnJlY3RseQoKU2lnbmVkLW9mZi1ieTogSnVuIExlaSA8SnVuLkxlaUBhbWQuY29tPgpS
ZXZpZXdlZC1ieTogWW9uZ3FpYW5nIFN1biA8eW9uZ3FpYW5nLnN1bkBhbWQuY29tPgpBY2tlZC1i
eTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYwppbmRleCA0NWY5ZGFkOTU2NDQuLjhk
M2JjMTU2ZGU2ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
bjIwL2RjbjIwX2h3c2VxLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
bjIwL2RjbjIwX2h3c2VxLmMKQEAgLTExMjgsOCArMTEyOCw4IEBAIHZvaWQgZGNuMjBfZW5hYmxl
X3BsYW5lKAogCiAJCWFwdC5zeXNfZGVmYXVsdC5xdWFkX3BhcnQgPSAwOwogCi0JCWFwdC5zeXNf
aGlnaC5xdWFkX3BhcnQgPSBkYy0+dm1fcGFfY29uZmlnLnN5c3RlbV9hcGVydHVyZS5zdGFydF9h
ZGRyOwotCQlhcHQuc3lzX2xvdy5xdWFkX3BhcnQgPSBkYy0+dm1fcGFfY29uZmlnLnN5c3RlbV9h
cGVydHVyZS5lbmRfYWRkcjsKKwkJYXB0LnN5c19sb3cucXVhZF9wYXJ0ID0gZGMtPnZtX3BhX2Nv
bmZpZy5zeXN0ZW1fYXBlcnR1cmUuc3RhcnRfYWRkcjsKKwkJYXB0LnN5c19oaWdoLnF1YWRfcGFy
dCA9IGRjLT52bV9wYV9jb25maWcuc3lzdGVtX2FwZXJ0dXJlLmVuZF9hZGRyOwogCiAJCS8vIFBy
b2dyYW0gc3lzdGVtIGFwZXJ0dXJlIHNldHRpbmdzCiAJCXBpcGVfY3R4LT5wbGFuZV9yZXMuaHVi
cC0+ZnVuY3MtPmh1YnBfc2V0X3ZtX3N5c3RlbV9hcGVydHVyZV9zZXR0aW5ncyhwaXBlX2N0eC0+
cGxhbmVfcmVzLmh1YnAsICZhcHQpOwotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
