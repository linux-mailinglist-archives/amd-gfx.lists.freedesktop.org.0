Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 955EB69D93
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C18089B95;
	Mon, 15 Jul 2019 21:21:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690060.outbound.protection.outlook.com [40.107.69.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40BCF89B8F
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DahecL2pnucF8Gqs4BbfAgNn0Uwl0V/YHRgfg/bAkBkKtgzYDlEW/x7zAQSK9diQyG5bCGNoAkNAbRtXicX6zb636Q3mDdq+rWgIyQ1ZkOHnhfP2yrhwhw9sOza1p6RiyJ10eKvj37mQOd72cObhCUOoNFOlhUzBj+H5b9EJ8Da+cSNorlEzm4gzHc9tChPIqTxWh6wMH8k/lGX5VYGTYLvdp0UX4+Nv1p4zKn554fyj5q80eXTeQ4+Lx1cosOpYbywSJxEeYT6zhSDzqac4fUSiG2OGA6xLEk/IOKNjd34IHnb31fHBPXsVKOiC+qRm2uZNY2hEgcXDWY7qKZEalw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01jTUM4DK1z1UP7zdVqBq4Nap28Ak3hE5iN9T7YJe58=;
 b=njiwSSY2Gg1Y0jqKXYUW6qgtUTmh7G75OcOI/laUnUSLedT00H+c+LQOt1mfmNT99cw53bpIrOXkYTstpFHsf8GxZ2IqCs+AAzaSZDDC9b4OaIAim2BxZYrvFWs5HFbdDvS1vcYQS4AztqCxaPIL/VSY5G7Bp+HCw2U+368vyvvBa8ce/rMpLnFeEWI2Qi8ksZHBpzUjWfaTqLBEHUJ7pewbnALLe8gv7gXFH4iwxvOYQAIUJz3FaW42+l2WLrLdenWv1B0vOHx3IL0O3icr6vptVf2zE3rDaRYFzzGKsbrE1YVaz4B3YWMyMyu+9xtPaTS1VfDRBr9wLQBFXXzMRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR12CA0041.namprd12.prod.outlook.com (2603:10b6:301:2::27)
 by MN2PR12MB3934.namprd12.prod.outlook.com (2603:10b6:208:16a::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.13; Mon, 15 Jul
 2019 21:21:07 +0000
Received: from CO1NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by MWHPR12CA0041.outlook.office365.com
 (2603:10b6:301:2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.14 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:06 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT009.mail.protection.outlook.com (10.152.80.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:06 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:02 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 01/87] drm/amd/display: initialize p_state to proper value
Date: Mon, 15 Jul 2019 17:19:23 -0400
Message-ID: <20190715212049.4584-2-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(39860400002)(136003)(2980300002)(428003)(199004)(189003)(76176011)(86362001)(1076003)(36756003)(8676002)(186003)(336012)(26005)(2351001)(11346002)(426003)(51416003)(446003)(305945005)(48376002)(476003)(126002)(2870700001)(478600001)(6916009)(2906002)(2876002)(50466002)(53936002)(2616005)(4326008)(6666004)(316002)(50226002)(54906003)(486006)(14444005)(356004)(47776003)(49486002)(5660300002)(70206006)(70586007)(81166006)(8936002)(68736007)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3934; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24d33605-6381-42fd-18b3-08d7096a5947
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MN2PR12MB3934; 
X-MS-TrafficTypeDiagnostic: MN2PR12MB3934:
X-Microsoft-Antispam-PRVS: <MN2PR12MB393419E004FC0056000660E682CF0@MN2PR12MB3934.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: gwD4UXkZIxnObVWkhJsPv2UA+J/0gLxKY9OWZN2bI2vgFGVtIjEOD6dfSkRxxesDPLWpmEpODijR5y3pzUoHqIHNIRai9albloxk46YTvo4x9RqWzp0Jqf5kAnWwTh82aPEHt01BLIXgL8GkufgYBSCsN27QaHqrADmZxjSOjvq8h7H8zBLadcjivsloqsoVGCNw1W2DsrcWIn3b0AiBgZj3Mxn6qEXXNGRPH3oilMu9GXkNQpbE9IOWCanZXgHHWN+ISzV+eOnL+GVCzchWih4W7hqutEbUNFVVbRTpk0I5gOEk+3qF/hSFJSr58d+fKGPkJ0kAGgU7e5SbILbdaUh1S8LrjwSKpuKTJWC+wYs8VFVXIVWWSyHbhRLmjDzAfYKRU+5rOb947rzW7F+HY5qd4dnG34DenXY//Yg8b4Q=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:06.3237 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24d33605-6381-42fd-18b3-08d7096a5947
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3934
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01jTUM4DK1z1UP7zdVqBq4Nap28Ak3hE5iN9T7YJe58=;
 b=cHEfhTq/g7czW4N5OxoBWM9gmXdw989tMHOIiBmO199QfDlaU5qpGn+h8mGJJtT8mOzkei/oltuwCuusuoJ69oZ56FsXcWpedXWkZoHZfxMQLBEZ9qc/blI1vnkCTOgN+V/BJ70xf1FXmCe84SYah3aO+hc/x3v97erVKFcrJN4=
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
 Tony Cheng <Tony.Cheng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSnVuIExlaSA8SnVuLkxlaUBhbWQuY29tPgoKW3doeV0KT24gc29tZSBtb2RlcyBTTVUg
d2lsbCBiZSBpbiBpbmZpbml0ZSBsb29wIHN0YXRlIGF0IGJvb3QsIHRoaXMgaXMKYmVjYXVzZSBk
cml2ZXIgYXNzdW1lcyBwX3N0YXRlX3N1cHBvcnQgaXMgZmFsc2UsIGJ1dCB0aGlzIGlzIHRoZQpv
cHBvc2l0ZSBvZiB0aGUgYXNzdW1lZCBib290IHN0YXRlIGJ5IFNNVS4gIHdlIG9wdGltaXplIGF3
YXkKbm90aWZ5aW5nIFNNVSBhYm91dCBubyBwc3RhdGUsIGFuZCBzbyB0aGV5IHdpbGwgZ2V0IHN0
dWNrCgpbaG93XQp3aGVuIHdlIGluaXQgY2xrIG1hbmFnZXIsIGluaXQgcHN0YXRlIHRvIHRydWUs
IHNvIGl0IG1hdGNoZXMgZHJpdmVyIGxvYWQKYXNzdW1wdGlvbgoKU2lnbmVkLW9mZi1ieTogSnVu
IExlaSA8SnVuLkxlaUBhbWQuY29tPgpSZXZpZXdlZC1ieTogVG9ueSBDaGVuZyA8VG9ueS5DaGVu
Z0BhbWQuY29tPgpBY2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjAvZGNuMjBfY2xrX21nci5j
IHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2RjbjIwL2RjbjIwX2Nsa19tZ3Iu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2RjbjIwL2RjbjIwX2Ns
a19tZ3IuYwppbmRleCAwOGE3NzRmYzdiNjcuLjc0MGY1ZGIyMmJiNSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjAvZGNuMjBfY2xrX21nci5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2RjbjIwL2RjbjIw
X2Nsa19tZ3IuYwpAQCAtMzAxLDYgKzMwMSw4IEBAIHZvaWQgZGNuMl91cGRhdGVfY2xvY2tzX2Zw
Z2Eoc3RydWN0IGNsa19tZ3IgKmNsa19tZ3IsCiB2b2lkIGRjbjJfaW5pdF9jbG9ja3Moc3RydWN0
IGNsa19tZ3IgKmNsa19tZ3IpCiB7CiAJbWVtc2V0KCYoY2xrX21nci0+Y2xrcyksIDAsIHNpemVv
ZihzdHJ1Y3QgZGNfY2xvY2tzKSk7CisJLy8gQXNzdW1wdGlvbiBpcyB0aGF0IGJvb3Qgc3RhdGUg
YWx3YXlzIHN1cHBvcnRzIHBzdGF0ZQorCWNsa19tZ3ItPmNsa3MucF9zdGF0ZV9jaGFuZ2Vfc3Vw
cG9ydCA9IHRydWU7CiB9CiAKIHZvaWQgZGNuMl9lbmFibGVfcG1lX3dhKHN0cnVjdCBjbGtfbWdy
ICpjbGtfbWdyX2Jhc2UpCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
