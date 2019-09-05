Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B1FA9892
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Sep 2019 04:50:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1923789CC4;
	Thu,  5 Sep 2019 02:50:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680083.outbound.protection.outlook.com [40.107.68.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31B2A89CC4
 for <amd-gfx@lists.freedesktop.org>; Thu,  5 Sep 2019 02:50:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LXUu2zJVP2MSpqUyTCTlpXrfsxAMlTml6gqMS3i+c3T+cXYP8nVNiVfZfTLc9l16TStoeoImo3uRP1l4mpXI2NFW68dAgq3KQR6QcGFxcPRwgStpCualqW8RmzQMT6M2srL88V7olE9Gn+phxx9ntLp4vzebo3H0kDjPq3kytW9AQRXgoZ7hNuCkEroetgGRCUD3dxqTjxrkEDnyC3Dj61lCvhcNxda6O9fX2bS8LK8UYF+Tp2J/kNf09vNsx22cV5mZavrHRcLsrDPgIvdroMgji7AqNXAdP6Q6Vcw+/RrzReY4ygGgUMIRXaKudQSwom/K5h3KBFGWk5CtvQXNzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RN8gz6TXmnMLmF1EYYBhHCYz4cjZdQawShenlRUOAGU=;
 b=C5CLL8B9GoHs1ZP8GorjIqU8LF9AQY1aNFKjEk6HhGMTP9RVsEvQEacKfW5Zenh1QKlf32tGNTG+XH/7B75jlb84iZYZ2uSFyz7OdBpUFH8EciwhMWPhymJCfSNdvkE60EPUu8SwbqXJywoZ8FmeHJmhGyrOKZaDFQW4LgKkFug8sEMSpLKeJO6nfDso94QzZ6ymmNqys9TTdSp0Z17PNDX0Z2Krzx6cOE7xQnkEDMgcfqCdKiFZgt6NuPfyGzc2eyJH1wItHtBBovQSE3eoZnFZRbLY/RdN4fj1LNn3vZ0kSsjqYdq/gBezTU5Gr2nE0vSu730ZbN4h3j6sKFj/aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR12CA0064.namprd12.prod.outlook.com (2603:10b6:300:103::26)
 by BN6PR1201MB0082.namprd12.prod.outlook.com (2603:10b6:405:53::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.21; Thu, 5 Sep
 2019 02:50:42 +0000
Received: from DM3NAM03FT019.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::202) by MWHPR12CA0064.outlook.office365.com
 (2603:10b6:300:103::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.14 via Frontend
 Transport; Thu, 5 Sep 2019 02:50:41 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT019.mail.protection.outlook.com (10.152.82.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Thu, 5 Sep 2019 02:50:41 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; 
 Wed, 4 Sep 2019 21:50:39 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/madgpu: Fix EEPROM Checksum calculation.
Date: Wed, 4 Sep 2019 22:50:18 -0400
Message-ID: <1567651818-7911-3-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567651818-7911-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1567651818-7911-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(346002)(376002)(396003)(2980300002)(428003)(199004)(189003)(36756003)(54906003)(4326008)(478600001)(6916009)(70586007)(70206006)(53416004)(5660300002)(53936002)(50466002)(2906002)(48376002)(7696005)(47776003)(8676002)(76176011)(305945005)(86362001)(51416003)(6666004)(356004)(336012)(44832011)(8936002)(81166006)(2616005)(476003)(2351001)(50226002)(446003)(26005)(126002)(4744005)(486006)(426003)(11346002)(316002)(186003)(16586007)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0082; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5b30501-90dc-4f8c-66d7-08d731abd72f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BN6PR1201MB0082; 
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0082:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB00825BFD071980BFAC06E9C1EABB0@BN6PR1201MB0082.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:800;
X-Forefront-PRVS: 015114592F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: drcPn5MgHYiQ7o04mZ/qjeTpEzvOOgsgQO2nG4NVevcMCfcZD540DDPqefQHEF6WLujyuag69X2B/nqKIK1Ne7NI0mbSZw5YBQJkMYXE8iOtzXx62USeqLLpU5U639SfNV/rd2mCcQER36SAr2Lky2opdxKv1TAC8U02dVYIGLD3ndcvzOgg7E1vUBbzl8N7Kejn7lqVM+yaTdexpU/vHEJt8x7+leGOSDK4OEEeg1JnPNyTE7Uo4rVSS7cTVzdgb3RhgtjRO6DjDv2NP9z2Z8uTvKEWKTSM7KYLIL1woIm9SthvenHUdgWAT0JzhZ9hLBicGH6e9u4K5rYeuw00RMZTfN/9Y0H3+R7wFuovRrPTyYEn6tZf3IRgSqk5U021LnfMHdmC6YI6VA35i7qli47RNaotJpEN1NdJ/CONe6k=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2019 02:50:41.4089 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b30501-90dc-4f8c-66d7-08d731abd72f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0082
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RN8gz6TXmnMLmF1EYYBhHCYz4cjZdQawShenlRUOAGU=;
 b=XvMoARkjMahtEwyvpfpIHsjAqG2/vh+z5ad1SPWIN6CWw/L+pTQvtYNzRb9BWPAtNxr3lxabz6eNehS7rbVpb0D7Zpv/JSYilc8fVe0mRIM4BvlXlBfgLain0TnOUDhwT2E2sqPx/S3nvwYAoC8G2z6Ds2Yvttlg/MFhJ7s88A4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
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
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>, Guchun.Chen@amd.com,
 Cristian.Saceleanu@amd.com, Tao.Zhou1@amd.com, alexdeucher@gmail.com,
 Hawking.Zhang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4IHR5cG8gd2hpY2ggbWVzc2VkIHVwIHRoZSBjYWxjdWxhdGlvbi4KClNpZ25lZC1vZmYtYnk6
IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXNfZWVwcm9tLmMgfCA0ICsrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhc19lZXByb20uYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXNfZWVwcm9tLmMKaW5kZXggOGEzMmI1Yy4uNDNk
ZDRhYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhc19l
ZXByb20uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzX2VlcHJv
bS5jCkBAIC0yMjYsOCArMjI2LDggQEAgc3RhdGljIHZvaWQgX19kZWNvZGVfdGFibGVfcmVjb3Jk
X2Zyb21fYnVmZihzdHJ1Y3QgYW1kZ3B1X3Jhc19lZXByb21fY29udHJvbCAqY28KIAlyZWNvcmQt
Pm9mZnNldCA9IChsZTY0X3RvX2NwdSh0bXApICYgMHhmZmZmZmZmZmZmZmYpOwogCWkgKz0gNjsK
IAotCWJ1ZmZbaSsrXSA9IHJlY29yZC0+bWVtX2NoYW5uZWw7Ci0JYnVmZltpKytdID0gcmVjb3Jk
LT5tY3VtY19pZDsKKwlyZWNvcmQtPm1lbV9jaGFubmVsID0gYnVmZltpKytdOworCXJlY29yZC0+
bWN1bWNfaWQgPSBidWZmW2krK107CiAKIAltZW1jcHkoJnRtcCwgYnVmZiArIGksICA2KTsKIAly
ZWNvcmQtPnJldGlyZWRfcGFnZSA9IChsZTY0X3RvX2NwdSh0bXApICYgMHhmZmZmZmZmZmZmZmYp
OwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
