Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FCC69DCD
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F4E689CD8;
	Mon, 15 Jul 2019 21:21:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820044.outbound.protection.outlook.com [40.107.82.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DEC189C8F
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PwWXRz+5qaXpXCAMZJ7yAdWIVYxH2WnwVom6U9BBlMSGqffPEhtPugXdfM6MVFt0mvF9bb5dg0zCMV7hr+P1EfMedY4U+EaUAuV+KE7VWs9jjnoyaqiEySAnz9XzJf9QWqGuSL42yjsueaFq7BZdlZGZ3OK5+Sx1RmjHXzScq0F4S09UBgOBB6frEhREPm61AOGQinCvquFf8P2Cyg4VvxvRVz0ooAzEWob32jjnFjwOuKMocQ0QccTjGZDEGavI7PiZ1gQIT2J1DILxhaiYEfz3L1yPvfGRuTP7l4j12DJsSda78Yp3w3qcmu4UTq+fQVePee4HtNlUMwH7AYIxIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=voRwvtKVcuxOIzY5Dl6Lw4sb46kIgkiPHUcn3S+76CU=;
 b=BCWB0LP8PPwMuPJF7bf9FGVTByS078Dm6SeLnn9zNIrOtDqF17A2MajKRZmer9C6AiaqPzrSFk0l5HqX3sZFdRIgP/TLpGsNnonoCK58LGcaCv/rne9r0PqBElyIArxm+JSwxT/CljLFttX2lj3OAHET5Mm+ZPIpZD9A7mb6JktMeWDeH6pxooOvevHzEe1mmR17XCG8lNfWkOEOXNE9ojlWwUogMmwHgPcU+BRHB7NrCQU/lwq4FHVgCp5i8maNGvG8jUrJMLG8kk5PO3DQM7Ix4BACIFSD4ILpgn9VXIanaYhrmlZg1Rq/QHdS3YbmKzpzVtvsx96jHXaZ3vBgpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM5PR12CA0004.namprd12.prod.outlook.com (2603:10b6:4:1::14) by
 BY5PR12MB3922.namprd12.prod.outlook.com (2603:10b6:a03:195::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Mon, 15 Jul
 2019 21:21:47 +0000
Received: from CO1NAM03FT028.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by DM5PR12CA0004.outlook.office365.com
 (2603:10b6:4:1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.10 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:47 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT028.mail.protection.outlook.com (10.152.80.189) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:47 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:30 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 54/87] drm/amd/display: Add debug option to disable timing sync
Date: Mon, 15 Jul 2019 17:20:16 -0400
Message-ID: <20190715212049.4584-55-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(346002)(39860400002)(2980300002)(428003)(189003)(199004)(2906002)(1076003)(5660300002)(54906003)(81156014)(70586007)(36756003)(70206006)(6916009)(305945005)(2870700001)(68736007)(81166006)(316002)(8676002)(478600001)(50226002)(8936002)(2616005)(86362001)(76176011)(26005)(446003)(476003)(53936002)(51416003)(11346002)(186003)(48376002)(126002)(356004)(6666004)(50466002)(486006)(4326008)(2351001)(47776003)(426003)(49486002)(336012)(2876002)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB3922; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4a8d0ee-c8e4-48f1-cf14-08d7096a718b
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BY5PR12MB3922; 
X-MS-TrafficTypeDiagnostic: BY5PR12MB3922:
X-Microsoft-Antispam-PRVS: <BY5PR12MB392257A25A24831802E366B382CF0@BY5PR12MB3922.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:260;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: CN/N+hbtzzSz5jTh/pWF5/72CCARuxqrekXO5CAbaL713SAtfqaXPOzn7TcNEDSKhWzCQoFPPWn3ZzsLdaaGR6t7tRSLL1Q3ixA8pI3Qh4w4r9+KSh8gqeeXda0x+p2ojLxbBzxn9BB5yClZD9u7UijcbRd0/dc4aRHdFpIppdG/9Bqh7kPP9N/f1EurehSnq9A9LrqBBKsGsvUT+Vso0QHghBIqywZbLJXk6KbLhCXJ8XKHpfP4a6oN3KBwOtyGXYcSwXxYCGLomZZq5et0C769b7dANANUKxURIJBH55yeKonj8nq4S7/g3HpgeWrwnGbs98BTXg8Ctl+wl4SxQ1236WKXTIZBfuQf94oFoHbTcFvdH6Oo5CXVVF3o+bjDHYTV7xgqYlF79epdnDkBk1hGTewTAVB6jYO/IwvUxXY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:47.0424 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4a8d0ee-c8e4-48f1-cf14-08d7096a718b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3922
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=voRwvtKVcuxOIzY5Dl6Lw4sb46kIgkiPHUcn3S+76CU=;
 b=IW1f/Oi5txQJK0iDkpdDIDRsSK7qY8/uznqtOsjwObtNlHGpw7VWHl0/Mj3RQzft+fXJvTu8kBfWGqUyRvZ/eeKFulKvgIYDhdo74Oihfb2mCBXbVJBQUkQd3HtbQBASnd0opZdP7bBLLzFaLKEwtMywi9NX4y2tTdlaUiIL960=
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
Cc: Leo Li <sunpeng.li@amd.com>, Joshua Aberback <joshua.aberback@amd.com>,
 Jun Lei <Jun.Lei@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSm9zaHVhIEFiZXJiYWNrIDxqb3NodWEuYWJlcmJhY2tAYW1kLmNvbT4KCltXaHldCldl
IHdhbnQgYSBkZWJ1ZyBvcHRpb24gdG8gZGlzYWJsZSB0aW1pbmcgc3luYyBmb3IgdGVzdGluZy4K
CltIb3ddCk5ldyBkYyBkZWJ1ZyBvcHRpb24gdGhhdCBtdXN0IGJlIGZhbHNlIHRvIGNhbGwgcHJv
Z3JhbV90aW1pbmdfc3luYwoKU2lnbmVkLW9mZi1ieTogSm9zaHVhIEFiZXJiYWNrIDxqb3NodWEu
YWJlcmJhY2tAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEp1biBMZWkgPEp1bi5MZWlAYW1kLmNvbT4K
QWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgfCAyICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGMuaCAgICAgIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9jb3JlL2RjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5j
CmluZGV4IDk5MWU2ZDlmMzYyOC4uZDI5NDhmZmMzYWZlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9jb3JlL2RjLmMKQEAgLTEwNjAsNyArMTA2MCw3IEBAIHN0YXRpYyBlbnVtIGRj
X3N0YXR1cyBkY19jb21taXRfc3RhdGVfbm9fY2hlY2soc3RydWN0IGRjICpkYywgc3RydWN0IGRj
X3N0YXRlICpjCiAJaWYgKHJlc3VsdCAhPSBEQ19PSykKIAkJcmV0dXJuIHJlc3VsdDsKIAotCWlm
IChjb250ZXh0LT5zdHJlYW1fY291bnQgPiAxKSB7CisJaWYgKGNvbnRleHQtPnN0cmVhbV9jb3Vu
dCA+IDEgJiYgIWRjLT5kZWJ1Zy5kaXNhYmxlX3RpbWluZ19zeW5jKSB7CiAJCWVuYWJsZV90aW1p
bmdfbXVsdGlzeW5jKGRjLCBjb250ZXh0KTsKIAkJcHJvZ3JhbV90aW1pbmdfc3luYyhkYywgY29u
dGV4dCk7CiAJfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaAppbmRleCAxNDY2NGJlZDhj
ODQuLjc4NmY2MWViMzgxZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKQEAgLTM3
OCw2ICszNzgsNyBAQCBzdHJ1Y3QgZGNfZGVidWdfb3B0aW9ucyB7CiAJICogd2F0ZXJtYXJrcyBh
cmUgbm90IGFmZmVjdGVkLgogCSAqLwogCXVuc2lnbmVkIGludCBmb3JjZV9taW5fZGNmY2xrX21o
ejsKKwlib29sIGRpc2FibGVfdGltaW5nX3N5bmM7CiB9OwogCiBzdHJ1Y3QgZGNfZGVidWdfZGF0
YSB7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
