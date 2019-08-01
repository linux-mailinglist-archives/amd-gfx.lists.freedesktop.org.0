Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 364437DF5F
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 17:47:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9281B6E707;
	Thu,  1 Aug 2019 15:47:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680083.outbound.protection.outlook.com [40.107.68.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10FD96E707
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 15:47:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YCnNlBq9dMh7VIGN1sf6BgnT5H8YtFuzeTS45tG83ZRIsN8J6bRTepqYQRXqrpu7Anv+2BJe5eVY51kNGrcZVmWRbDGjAPerGksxEWdg7FfBDwmrjyxU+wpfRk9YyLpxobrXwe5esEeoAR/FtijaXd9KmtkSsZxtedSssmFAfwOceuliU4y8qScQ+d6PbFDFv/A3KMvvpAwVTL8MLPjrp9nSkKyJshenNcuoFmmHxuL2eSBdbuQi2utk0ny1w0sxa/xptC3r7HGPasobj/Xj8AFjd5RgEKNxGAPliu8DEt0G9+dmJJi/YHD6PiIpNLC/h8Y3mSpIKBUc72fgLGQ6tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RdtD6ESH1hZ3q/Wsvatrq2gNDmV2St05XAkfvDrmIRc=;
 b=nH0qfxFckkiz521lpSgwqVmy9fjrMhd3b7a9nfZnjxP6lGQvZtjxXD5whMb2EPWSQk5Zjv/SD6DtTsnDC/M1f/peWk/aX5LmuFK57cAA3WIDR3S00a9iRTLZ4JFL1rUhwcQoG7j6+PdhuJSrx7iDYiRghO59w/HVvruVBMbywKXycjT25osdL7uHUJ/u/In2mgDfn+464jUwpR3rDx+46XHUuhwxyT+yBLLlq1fZU62O0R15SPBWTKQc+q0MNLr8KJcAhnaRD6XlIphUXXJg3GITo4AlTjGKB0ZzqAAHRvQOSXAxAMh4UglZNMAvo8siIoqVl93acKwcKMhyZ/ve3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from BN8PR12CA0034.namprd12.prod.outlook.com (2603:10b6:408:60::47)
 by BYAPR12MB3511.namprd12.prod.outlook.com (2603:10b6:a03:13a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.16; Thu, 1 Aug
 2019 15:47:25 +0000
Received: from CO1NAM03FT007.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::201) by BN8PR12CA0034.outlook.office365.com
 (2603:10b6:408:60::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2136.14 via Frontend
 Transport; Thu, 1 Aug 2019 15:47:25 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT007.mail.protection.outlook.com (10.152.80.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Thu, 1 Aug 2019 15:47:24 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Thu, 1 Aug 2019 10:47:12 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Add amdgpu_asic_funcs.reset_method for Vega20
Date: Thu, 1 Aug 2019 11:47:04 -0400
Message-ID: <1564674424-32642-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(346002)(136003)(39860400002)(2980300002)(428003)(199004)(189003)(8676002)(5660300002)(50466002)(186003)(426003)(50226002)(81166006)(53416004)(8936002)(336012)(6916009)(2906002)(2351001)(36756003)(316002)(16586007)(86362001)(51416003)(7696005)(81156014)(305945005)(26005)(6666004)(54906003)(68736007)(4744005)(356004)(70206006)(126002)(486006)(70586007)(478600001)(47776003)(44832011)(4326008)(2616005)(53936002)(48376002)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3511; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a506defa-0188-478c-1892-08d716978c87
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BYAPR12MB3511; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB3511:
X-Microsoft-Antispam-PRVS: <BYAPR12MB351181C6AA62140DB09B7376EADE0@BYAPR12MB3511.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:330;
X-Forefront-PRVS: 01165471DB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: JAh4BXxsjB7uiHAcJzG6Klu89NGYQsN4kRbo1BfgxL+OrqbzCfChJg1z5pRKjwLO+4+asQtnx9IgFiUzEviQqoVgmGaDjJEbVuVomKhxaxq0H7AFLpNa+PXXfUzQdKxP6QMnF/OQLFzAjF+nf7BtjbUmdpzej8k43/8kGZc6dPd60MKt2EPoKwBstwxqMInuhDw2r2b9P1MIw8Fqj/1dSzcYvIILFb+Brb6lJvi5UGmczHdQhTv0mFduZxi1Pt5jxvljU1ahz4aFpvxrDn3YqhzNkgsNi8zYD2cxSJE0IXo68LlNnRNV4ZQ5jkRryt171jLT3Ajprxx+2CJiIW1dAvUZOWQqLpm2xHktdb/DDF/4jD1qRmLj3L1hXH2I4mAykE9nd07OwbMR4WD4FLTR5P8oFMQgIbRmG5tKwmvP6Nw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2019 15:47:24.6738 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a506defa-0188-478c-1892-08d716978c87
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3511
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RdtD6ESH1hZ3q/Wsvatrq2gNDmV2St05XAkfvDrmIRc=;
 b=shKHYQQVv4l0BVrNiH3KabO2cWmnT12cy7NKnneb+upxhP8VQTwvBzvenrPDzCMcVRKwsZ7w4sHozXUihNhh1StmihETImSq4Q6C+J188RvE9g9MZaASduEHaFBstZ30/We9cF5+qnMMvMTBpJOuRd4BLVh9GYY/IZIcq3HeNYY=
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
Cc: Alexander.Deucher@amd.com, Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXMgR1BVIHJlc2V0IGNyYXNoLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kg
PGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvc29jMTUuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3NvYzE1LmMKaW5kZXggNDQwNWI5OC4uZjc2MGZiYSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9zb2MxNS5jCkBAIC04NTEsNiArODUxLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBhbWRncHVfYXNpY19mdW5jcyB2ZWdhMjBfYXNpY19mdW5jcyA9CiAJLmdldF9wY2llX3VzYWdl
ID0gJnNvYzE1X2dldF9wY2llX3VzYWdlLAogCS5uZWVkX3Jlc2V0X29uX2luaXQgPSAmc29jMTVf
bmVlZF9yZXNldF9vbl9pbml0LAogCS5nZXRfcGNpZV9yZXBsYXlfY291bnQgPSAmc29jMTVfZ2V0
X3BjaWVfcmVwbGF5X2NvdW50LAorCS5yZXNldF9tZXRob2QgPSAmc29jMTVfYXNpY19yZXNldF9t
ZXRob2QKIH07CiAKIHN0YXRpYyBpbnQgc29jMTVfY29tbW9uX2Vhcmx5X2luaXQodm9pZCAqaGFu
ZGxlKQotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
