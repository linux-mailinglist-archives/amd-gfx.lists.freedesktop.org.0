Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D29F037F04
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 22:55:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40868984F;
	Thu,  6 Jun 2019 20:55:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810054.outbound.protection.outlook.com [40.107.81.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 250D98984F
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2019 20:55:07 +0000 (UTC)
Received: from DM3PR12CA0051.namprd12.prod.outlook.com (2603:10b6:0:56::19) by
 DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:4a::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Thu, 6 Jun 2019 20:55:05 +0000
Received: from DM3NAM03FT010.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::207) by DM3PR12CA0051.outlook.office365.com
 (2603:10b6:0:56::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1965.14 via Frontend
 Transport; Thu, 6 Jun 2019 20:55:05 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT010.mail.protection.outlook.com (10.152.82.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1965.12 via Frontend Transport; Thu, 6 Jun 2019 20:55:05 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 6 Jun 2019
 15:55:03 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 01/24] drm/amd/display: fix resource saving missing when power
 state switch
Date: Thu, 6 Jun 2019 16:54:38 -0400
Message-ID: <20190606205501.16505-2-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
References: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(136003)(396003)(346002)(2980300002)(428003)(189003)(199004)(7696005)(8936002)(426003)(6916009)(81156014)(8676002)(2906002)(2616005)(86362001)(4326008)(76176011)(486006)(476003)(11346002)(126002)(446003)(53936002)(336012)(478600001)(51416003)(356004)(6666004)(1076003)(70206006)(68736007)(72206003)(36756003)(50466002)(47776003)(2351001)(50226002)(48376002)(186003)(16586007)(77096007)(81166006)(53416004)(26005)(305945005)(5660300002)(316002)(70586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2667; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39779e05-27f3-4b30-97cc-08d6eac140b0
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM6PR12MB2667; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:
X-Microsoft-Antispam-PRVS: <DM6PR12MB26675854071D37EC881B3D95F9170@DM6PR12MB2667.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-Forefront-PRVS: 00603B7EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Tu+25qLJ01Y9NCri6ldKjw29Td0eRqbKmufgv7LyEZNOCa+tps4uwebpbhog1ogwd/3wfZ70Vy0PeK5Czj1mQFXZFNsbvo9iytgmLDu9I2Ozs44Ct3LBOc6SxApTqdBMuxO7gdpCBBaR8vGhlNG0Nv/bgTROL9Fe2BSUswjHgXlCw8xMOhf5coNKlk8oMhM7IHEPX7VPLVuBH0uQPQmjRKiFB1qmJ/zt4VykLOwODgUitILCVFfMjQhYuKexrd2PhgJDIxQU/4QAtD3MkNKGzyTuKmw2328TBpHORk9Ox2OjtZkLxHJL/Zm5T8i4o4az2b9KsnPP149rDhLPFxpT6nKMgxgEADWgAR0eUu6UfZWLqM7vEsSsfc2+gyYwSfec3X3UE41vrpP0QgeRcfuFh6YZZdKK9tIqH4BRqLE3D8s=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2019 20:55:05.3437 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39779e05-27f3-4b30-97cc-08d6eac140b0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2667
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8lOu6lWmDzV/+9ig3urBj+fItOE1l/UH7Nx9wPEipE=;
 b=nUBqrPtCgEeI0U/uZ1TvBH+Ir13J0XpdMZKvDmnK2/7FQXopPz8sXpEDxOHLnLyKITEgaGW5jivceaChqEHkjMZ1b1FSTJFXQ+gasfm18ReiK3ura3Z9jG9Y0HfQOS5zMorlp8O3IBNY6mOYZYFli5gaqwu+4EEasqBEaTmlk4Y=
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
Cc: "Tao.Huang" <Tao.Huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogIlRhby5IdWFuZyIgPFRhby5IdWFuZ0BhbWQuY29tPgoKU2lnbmVkLW9mZi1ieTogVGFv
Lkh1YW5nIDxUYW8uSHVhbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEp1biBMZWkgPEp1bi5MZWlA
YW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldC5MYWtoYUBh
bWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgfCAx
MSArKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYwppbmRleCBkODlhMjliZDg3ODUuLjBiZmY1
NDZkMzcyNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUv
ZGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jCkBAIC0x
OTMwLDYgKzE5MzAsMTIgQEAgdm9pZCBkY19zZXRfcG93ZXJfc3RhdGUoCiAJZW51bSBkY19hY3Bp
X2NtX3Bvd2VyX3N0YXRlIHBvd2VyX3N0YXRlKQogewogCXN0cnVjdCBrcmVmIHJlZmNvdW50Owor
CXN0cnVjdCBkaXNwbGF5X21vZGVfbGliICpkbWwgPSBremFsbG9jKHNpemVvZihzdHJ1Y3QgZGlz
cGxheV9tb2RlX2xpYiksCisJCQkJCQlHRlBfS0VSTkVMKTsKKworCUFTU0VSVChkbWwpOworCWlm
ICghZG1sKQorCQlyZXR1cm47CiAKIAlzd2l0Y2ggKHBvd2VyX3N0YXRlKSB7CiAJY2FzZSBEQ19B
Q1BJX0NNX1BPV0VSX1NUQVRFX0QwOgpAQCAtMTk0NiwxNSArMTk1MiwyMCBAQCB2b2lkIGRjX3Nl
dF9wb3dlcl9zdGF0ZSgKIAogCQkvKiBQcmVzZXJ2ZSByZWZjb3VudCAqLwogCQlyZWZjb3VudCA9
IGRjLT5jdXJyZW50X3N0YXRlLT5yZWZjb3VudDsKKwkJLyogUHJlc2VydmUgZGlzcGxheSBtb2Rl
IGxpYiAqLworCQltZW1jcHkoZG1sLCAmZGMtPmN1cnJlbnRfc3RhdGUtPmJ3X2N0eC5kbWwsIHNp
emVvZihzdHJ1Y3QgZGlzcGxheV9tb2RlX2xpYikpOworCiAJCWRjX3Jlc291cmNlX3N0YXRlX2Rl
c3RydWN0KGRjLT5jdXJyZW50X3N0YXRlKTsKIAkJbWVtc2V0KGRjLT5jdXJyZW50X3N0YXRlLCAw
LAogCQkJCXNpemVvZigqZGMtPmN1cnJlbnRfc3RhdGUpKTsKIAogCQlkYy0+Y3VycmVudF9zdGF0
ZS0+cmVmY291bnQgPSByZWZjb3VudDsKKwkJZGMtPmN1cnJlbnRfc3RhdGUtPmJ3X2N0eC5kbWwg
PSAqZG1sOwogCiAJCWJyZWFrOwogCX0KIAorCWtmcmVlKGRtbCk7CiB9CiAKIHZvaWQgZGNfcmVz
dW1lKHN0cnVjdCBkYyAqZGMpCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
