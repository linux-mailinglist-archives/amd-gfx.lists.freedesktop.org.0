Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5F4D48AF
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 21:53:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA216EC96;
	Fri, 11 Oct 2019 19:53:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam05on060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe50::60d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D5806EC98
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 19:53:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cV2L6M2kIxmy63S0Wk1J/XYFOKhBKmvM09CTffEg+sSpu0x+RfPUmcJI6/kNmkQV7HhnKOp1Wexgv17pSY/bmZVVZ5oufdrjEHwHIjuJi3LnEJP/AYMfgOEfpddwSWe23Tk866RWsaQeDotI99430XjBTwX/mK5/j/l9x/KwSdG/Q0tGw2b3bH6WzFxAKY41HKkL445oS3hvKnTuJpPRd15B/Zbax8nfIJW/AsxPNVvAwUmgVQ0kI1ACf8Xo2jpXYsn49wgHcl9uYRXA1wc5k3Reiqx/9oQdH6akmT3gph780FgayY7hHJII5tzFxGHDaTr7Ds819Xajn0/UbgnL2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SaN6tij4Btj5jITwB1/ymvfCDGbJ9L+pD9cY5y91Pgk=;
 b=I6tlLjhgQG3vdsUGVhiEbnSky56Csmf3EcAdkjUXkIEr0zovbMomaA3sSb/wwnrywKvDomY+vtDYhz8FFNwBW/n/1JxArbnFEc1X8uywes4tXSGjFWbgBbhdQ63/mz2rK1ubdIf5srcKTfpXNsHJ8hM0x+O4fNOIeGUkGxOR51A4DcFuMvlrS7gp4wBSBBM2Z2GYLj0l3Q6vwPlf+VwnPRkZfcZN/5mL8aI8TPtmQ4fc6q+3ncA5MXnfmuoelpSNcG7HL78yJW18508/MMJrR4ck1GRpiZydeRYe5O/TMar/MKA4oSx4M+vXc3FHiHxLujbGKYsOvkT3A/9atXC1sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR1201CA0005.namprd12.prod.outlook.com
 (2603:10b6:405:4c::15) by BN6PR1201MB0226.namprd12.prod.outlook.com
 (2603:10b6:405:56::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Fri, 11 Oct
 2019 19:53:53 +0000
Received: from BY2NAM03FT061.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::205) by BN6PR1201CA0005.outlook.office365.com
 (2603:10b6:405:4c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.17 via Frontend
 Transport; Fri, 11 Oct 2019 19:53:52 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT061.mail.protection.outlook.com (10.152.85.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2347.21 via Frontend Transport; Fri, 11 Oct 2019 19:53:52 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 11 Oct 2019
 14:53:47 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 19/29] drm/amd/display: change PP_SM defs to 8
Date: Fri, 11 Oct 2019 15:53:14 -0400
Message-ID: <20191011195324.16268-20-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
References: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(376002)(136003)(396003)(428003)(189003)(199004)(8936002)(476003)(478600001)(486006)(2906002)(47776003)(53416004)(7696005)(126002)(51416003)(4326008)(50226002)(81166006)(356004)(6666004)(81156014)(16586007)(8676002)(36756003)(316002)(5660300002)(1076003)(4744005)(426003)(6916009)(186003)(76176011)(2616005)(11346002)(446003)(26005)(305945005)(336012)(70586007)(70206006)(48376002)(2351001)(50466002)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0226; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a3271e3-1e58-488b-4b9d-08d74e84be12
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0226:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0226530EB7C44A0AC9836D13F9970@BN6PR1201MB0226.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-Forefront-PRVS: 0187F3EA14
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HGiVCwe9RF7+flkhOK1XbwT7DzgVYREXqR3hlal8W89+4xCiM5f7pFNEnFWm6D1AnCRmzREJaLtCrXfuQqjcm4HsRhkQh+Yho0SUnSWnAPLEVOthNQ1X3MSLGtI++fqs8VnjEZ69+PFBYK+ITDDRF/Meq2DJ3obBc4SoHSnkc/jp+y8EyheXr/TQ2kFjn1aD1PHD1XUTAxVhnWDZsKlYquzfEUFgD1Tee6DcT5shJWHnIhEexwLKs0Y/ysMrTtT6JDDOPfyQDBLJDIg2MfZECV4gEGF2rVm1u3t2i7zqjOrksSbC5J5b5wei/n0WuuluWXmMo0pymg4BUESRwXSW5xZ7dIb45cqymdlma9L6hr3gv1QX1eDGMboCE09ut24cxVeURZrR+u73UbypQt4w28JayqtgmbJuGufFuFkMfgw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 19:53:52.6192 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a3271e3-1e58-488b-4b9d-08d74e84be12
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0226
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SaN6tij4Btj5jITwB1/ymvfCDGbJ9L+pD9cY5y91Pgk=;
 b=fW4pxHAVQEfLkx2MFfmaTMgQ8h4BWIel7hXylOyQIHjMi45jiMAaQM8i7mPiHa0MTZpwwOB1Y6gYXiiZalzLnsPmkC3cBbP/BhgxgNYETAWi9QhNHXiwMD27dNNDi08k1qS6Sy1z3RtP4POW3ILON269F2HwsOIhlyGbyz9qVMc=
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

RFBNIGxldmVsIGlzIDggdGhlc2Ugd2VyZSBpbmNvcnJlY3QgYmVmb3JlLiBGaXggdGhlbQoKU2ln
bmVkLW9mZi1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtX3BwX3NtdS5oIHwgNiArKyst
LS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtX3BwX3NtdS5oIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtX3BwX3NtdS5oCmluZGV4IGMwM2E0NDFlZTYz
OC4uZGUzYzgzYzhmNmMzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZG1fcHBfc211LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtX3Bw
X3NtdS5oCkBAIC0yNTIsOSArMjUyLDkgQEAgc3RydWN0IHBwX3NtdV9mdW5jc19udiB7CiAjaWYg
ZGVmaW5lZChDT05GSUdfRFJNX0FNRF9EQ19EQ04yXzEpCiAKICNkZWZpbmUgUFBfU01VX05VTV9T
T0NDTEtfRFBNX0xFVkVMUyAgOAotI2RlZmluZSBQUF9TTVVfTlVNX0RDRkNMS19EUE1fTEVWRUxT
ICA0Ci0jZGVmaW5lIFBQX1NNVV9OVU1fRkNMS19EUE1fTEVWRUxTICAgIDQKLSNkZWZpbmUgUFBf
U01VX05VTV9NRU1DTEtfRFBNX0xFVkVMUyAgNAorI2RlZmluZSBQUF9TTVVfTlVNX0RDRkNMS19E
UE1fTEVWRUxTICA4CisjZGVmaW5lIFBQX1NNVV9OVU1fRkNMS19EUE1fTEVWRUxTICAgIDgKKyNk
ZWZpbmUgUFBfU01VX05VTV9NRU1DTEtfRFBNX0xFVkVMUyAgOAogCiBzdHJ1Y3QgZHBtX2Nsb2Nr
IHsKICAgdWludDMyX3QgIEZyZXE7ICAgIC8vIEluIE1IegotLSAKMi4xNy4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
