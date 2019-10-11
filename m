Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B701D48B0
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 21:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A01516EC99;
	Fri, 11 Oct 2019 19:53:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710050.outbound.protection.outlook.com [40.107.71.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B9326EC96
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 19:53:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bKVVq0RvPlgcb8Cl+BONxBmuGle6mujIYnusB3v863HYGMPiBL0EWWNLvxFXA/eYH6nZgwhtAWzEvY78Wi3XF6R4k/ISIx743SWyWevRu8XKg/9kg+Jb8DP9GyeYzzp1U6z1PjsuiDPN3QypBRINR0VpYP/gZPh7c4TnhtprPZhUjYrZyqVK94x9DT6jXQmFwTpBWVSe8JtHjY58KTNx6AaaV4aqCmavgTttjkTlbGSo2X0KE94805tzwZ5dJfdBAcErkSIJuA6JxGVbp9Rdm51asgf6N1fMz1QLrz8rlWqva0k7+2NBXmm0ZcuvuZX2IZjrAl+QyWFo9J8HCeisKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uwbgf5ItQ3540/XwjnfAr9GvVGwnKHrrp2r0t9dRyDs=;
 b=MihfO0p2FAVy128oItXYPhwz0R96qJzvbd3Lj+l1GSgPYALbKXvKT9kcGYIZ2m1nH5A1LHYDVHETgrp4s+FtoYCNmjaIxk2beGDs/2v4q6VnnSMBKZdjtBtfBXCxBLvHeAZeNG2x2+8tuOCzC/PD5JeidCeCXNOW1ADDxKfLYhlUQLhmV+6WBc3kZZQJDfp0ht676x1Dpgjoi44uCopnSIXdxnet9Ey1CfSbDm22D+0JRNB0Bnl0STsTJ8ii8wEqAm6UBPXvfk9i46XkEuQsbvSzPDxm4/mMlOQobVRQMXs9v0KWf/20awPLzuaUUQCGsFp4lochlTBNxjmjCCNIvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0018.namprd12.prod.outlook.com (2603:10b6:5:1c0::31)
 by SN6PR12MB2845.namprd12.prod.outlook.com (2603:10b6:805:6e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Fri, 11 Oct
 2019 19:53:53 +0000
Received: from BY2NAM03FT051.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::207) by DM6PR12CA0018.outlook.office365.com
 (2603:10b6:5:1c0::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.17 via Frontend
 Transport; Fri, 11 Oct 2019 19:53:53 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT051.mail.protection.outlook.com (10.152.85.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2347.21 via Frontend Transport; Fri, 11 Oct 2019 19:53:52 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 11 Oct 2019
 14:53:48 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 20/29] drm/amd/display: add dummy functions to smu for Renoir
 Silicon Diags
Date: Fri, 11 Oct 2019 15:53:15 -0400
Message-ID: <20191011195324.16268-21-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
References: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(39860400002)(346002)(428003)(199004)(189003)(6916009)(36756003)(478600001)(2906002)(305945005)(16586007)(50226002)(8936002)(47776003)(14444005)(50466002)(8676002)(81156014)(81166006)(316002)(4326008)(48376002)(70586007)(70206006)(426003)(186003)(26005)(51416003)(7696005)(76176011)(5660300002)(86362001)(11346002)(2616005)(53416004)(126002)(486006)(1076003)(2351001)(476003)(446003)(356004)(6666004)(336012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2845; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80c4cb57-2475-422a-152c-08d74e84be49
X-MS-TrafficTypeDiagnostic: SN6PR12MB2845:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2845F48FFD8A49384D87A361F9970@SN6PR12MB2845.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-Forefront-PRVS: 0187F3EA14
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vrBmLqZbjqBpPl27Q/CeNYZYcscBbGNiTtb5UbF6KDCtMpGVS8SpMc4v1Ja7sF3XqWo54ZPgtOiRIr67pOzlUK+8m3iim5+nJJpV1+l4Q/tTg9tlnXcBxhmfOdrwFOlnD5NNkjye44FbYzGbzxa9MACiyLUpD71SBWEuWuuALSlzL5rSG1YMsUBx/YNpQWzEa4yKeSZ0zpgPOk+BiTkpDfrrrGkIRFFHu9xCjvX+mlERG+9Di0xIzEkmi7/SQ+Mhj1tUhAo2SmDrDUMCrPMAPqG84DpmPh/iQB+0YpqL0fR6ZL+R6xfsDdm7uQEd0jAH5jeTJ1PcEQwTuTA2a6fePug3sTfgvHFgFn6BRXkfYEZHFWhYxkFlwWLbIBC2e+VDjiOW/MSknbfzfi5MEXsreGG/HQ37Y+/tRfMBHw/VZTE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 19:53:52.9533 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80c4cb57-2475-422a-152c-08d74e84be49
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2845
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uwbgf5ItQ3540/XwjnfAr9GvVGwnKHrrp2r0t9dRyDs=;
 b=YMjBKBfR1qB6texGOjSJmNbHyruvMiqzQQA3FLQJp80xr3Ee8f6ywSaXEiVR6V7Ld+ukpnthMRmyP+NRrTmLdwvq0BcHjHC1n6bau0uWW0nlYkr8O5y4RjwCJU6JguvZcQkaPriwnfJYwfLXLDpD0UsqaU291P0/1jZ5xZrFB9g=
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
Cc: Sung Lee <sung.lee@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogU3VuZyBMZWUgPHN1bmcubGVlQGFtZC5jb20+CgpbV2h5XQpQcmV2aW91c2x5IG9ubHkg
ZHVtbXkgZnVuY3Rpb25zIHdlcmUgYWRkZWQgaW4gRGlhZ3MgZm9yIEZQR0EuCk9uIHNpbGljb24s
IHRoaXMgd291bGQgbGVhZCB0byBhIHNlZ21lbnRhdGlvbiBmYXVsdCBvbiBzaWxpY29uIGRpYWdz
LgoKW0hvd10KQ2hlY2sgaWYgZGlhZ3Mgc2lsaWNvbiBhbmQgaWYgc28sIGFkZCBkdW1teSBmdW5j
dGlvbnMuCgpTaWduZWQtb2ZmLWJ5OiBTdW5nIExlZSA8c3VuZy5sZWVAYW1kLmNvbT4KQWNrZWQt
Ynk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9yZXNvdXJjZS5jIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX3Jlc291cmNl
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfcmVzb3VyY2Uu
YwppbmRleCAwMDJlN2ZiNjcwNjguLjI1ZjYyYTNmMmZmYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX3Jlc291cmNlLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX3Jlc291cmNlLmMKQEAgLTEzOTcs
NyArMTM5Nyw3IEBAIHN0YXRpYyBzdHJ1Y3QgcHBfc211X2Z1bmNzICpkY24yMV9wcF9zbXVfY3Jl
YXRlKHN0cnVjdCBkY19jb250ZXh0ICpjdHgpCiAJaWYgKCFwcF9zbXUpCiAJCXJldHVybiBwcF9z
bXU7CiAKLQlpZiAoSVNfRlBHQV9NQVhJTVVTX0RDKGN0eC0+ZGNlX2Vudmlyb25tZW50KSkgewor
CWlmIChJU19GUEdBX01BWElNVVNfREMoY3R4LT5kY2VfZW52aXJvbm1lbnQpIHx8IElTX0RJQUdf
REMoY3R4LT5kY2VfZW52aXJvbm1lbnQpKSB7CiAJCXBwX3NtdS0+Y3R4LnZlciA9IFBQX1NNVV9W
RVJfUk47CiAJCXBwX3NtdS0+cm5fZnVuY3MuZ2V0X2RwbV9jbG9ja190YWJsZSA9IGR1bW15X2dl
dF9kcG1fY2xvY2tfdGFibGU7CiAJCXBwX3NtdS0+cm5fZnVuY3Muc2V0X3dtX3JhbmdlcyA9IGR1
bW15X3NldF93bV9yYW5nZXM7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
