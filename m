Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC6CAEC65
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 15:55:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA0B892A5;
	Tue, 10 Sep 2019 13:55:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820047.outbound.protection.outlook.com [40.107.82.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9DE48929B
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 13:55:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hManZdt4Tik+e6KntrgzC2JJqq9FIBVDbu1Vp1QQTZ9rMTa5qzW5e0p6Hnui1ZeVe/HZ7auFAJxN2Lx2+Z0f+Pr7cc4xue6xuOv8HqxD/JmDZKarL7uWcJEaSxRE+wpt9zFq+K+cVGpQ/kAcNT2W9BAD5iXQESN8MCmBhmNd1J3rfd2X/XmDuYFwLxM/xAVKo6luO2dYcPS1WXIr4uUMyfemyzqeu6AEEj8OQv0aH7rH08LEp/6Zbe5uVjXu+9ObHn1hgW8+5OkbTS8kwSf7UpPKZ82wRdgG/3yJKuB2XOrPD1Ix+QK7OAwxw5+mpKRA/PE1NXpauA0AvWVfNkr6jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7UQiCjoxuc+O9vJPnQY6+xrO49NzHMAxwh8zbW95+s=;
 b=nEl7MbByIFaeYhZbRdwrUsdfq666K/BTCODfWYg9evKhwuYBIX+gGCos9XDwtlqmulCkzgqzFLnnB+cePCVUv4QilmUmzTdNF+IzO6XEsyBq36c+Fgu23lxuFo2/S4Y3Q7iz5/DArsCSGJLF2jnw9q79nX+X5QCM0jECt4d7ev3Gp5Oa5mvxQSQFAuhAjriLWUVeKxzP3Yg1vHHkpXoC8zwelfcpdORaJQJF+UVdYLrADsPXRunXiLoT+6DFjY49deuTAkx4T+AUxtJ3vjCKQJZRgvSr6eBT62ei4hBhvtqeHnAUO1pl62Rx27SMhpcoi9GR2slNIqGe/FawPEnkyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0019.namprd12.prod.outlook.com (2603:10b6:610:57::29)
 by MWHPR1201MB0253.namprd12.prod.outlook.com (2603:10b6:301:52::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.14; Tue, 10 Sep
 2019 13:54:59 +0000
Received: from CO1NAM03FT025.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::201) by CH2PR12CA0019.outlook.office365.com
 (2603:10b6:610:57::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.15 via Frontend
 Transport; Tue, 10 Sep 2019 13:54:58 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT025.mail.protection.outlook.com (10.152.80.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 13:54:58 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 10 Sep 2019 08:54:53 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 03/25] drm/amd/display: 3.2.50
Date: Tue, 10 Sep 2019 09:54:23 -0400
Message-ID: <20190910135445.18300-4-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190910135445.18300-1-sunpeng.li@amd.com>
References: <20190910135445.18300-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(346002)(39860400002)(2980300002)(428003)(189003)(199004)(1076003)(36756003)(86362001)(4744005)(2616005)(2351001)(476003)(11346002)(446003)(50226002)(126002)(426003)(478600001)(54906003)(305945005)(486006)(81166006)(81156014)(2870700001)(8676002)(336012)(8936002)(26005)(2906002)(356004)(49486002)(47776003)(186003)(316002)(76176011)(51416003)(4326008)(50466002)(6916009)(14444005)(70206006)(48376002)(70586007)(6666004)(2876002)(53936002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR1201MB0253; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44dae761-9186-49cf-afb9-08d735f67807
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:MWHPR1201MB0253; 
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0253:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB025300A6AC21A723ACBAF79982B60@MWHPR1201MB0253.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: PfxFRRL5ywDrzkPovLqGVxJy9i1TBLvcv6PFloBFskrZ4TKscp6aT+spfxISwzNiIzufCBQvHqTzB0UcbGQxAth/szl7C95GyLPMgRFiGn40zIqB8ERE9WKSC584x1GcjHv5/u5Gn2bT0hWgF0K7cB8v4jj4w/1rFv9HYYHxmyKKZjkgvVYIeuVTuJjab5YNiKS4wurD3F9h9shPBk9z/v+pTR3te0mf+TfpW0sC264Ptd3PTWRY+ysFDY9LNn5bqIqV++b9uc1RHYPtJQiRUq7J1S82yh6zvrDJfv94EohPUbdmpEnB+R2YJSyKYltCYR7bCjBs14jgJ+8jBnX5HEP2WXme/MbFEXhD+sDUZ2qTZc5uzQIJ+0thrV6IyS2TBd4hr3H7hCGus3+3N3nMbVU7CebLebXexnUOZ1uVp0A=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 13:54:58.5078 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44dae761-9186-49cf-afb9-08d735f67807
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0253
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7UQiCjoxuc+O9vJPnQY6+xrO49NzHMAxwh8zbW95+s=;
 b=hSXoU5fVzo6JWL1Fr+WnTofmIHaxFd2im9oXz3HDfa+nmznkE+L6auAmbHSICwBDx5fem65j/EJxT1BSJLnU0hxuFu2zO9rvoOFPX4O9BXWDvQFMf8WHbi8PI/O4Qk43HBp31mibq8sz1T1srQFK/7lC//qBwnAKLTO7p4geQeA=
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
c3BsYXkvZGMvZGMuaAppbmRleCAzYjg0OGQ0YWNhOGMuLmQyMWU4ZmMwMTc5ZSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKQEAgLTM5LDcgKzM5LDcgQEAKICNpbmNsdWRlICJpbmMv
aHcvZG1jdS5oIgogI2luY2x1ZGUgImRtbC9kaXNwbGF5X21vZGVfbGliLmgiCiAKLSNkZWZpbmUg
RENfVkVSICIzLjIuNDkiCisjZGVmaW5lIERDX1ZFUiAiMy4yLjUwIgogCiAjZGVmaW5lIE1BWF9T
VVJGQUNFUyAzCiAjZGVmaW5lIE1BWF9QTEFORVMgNgotLSAKMi4yMi4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
