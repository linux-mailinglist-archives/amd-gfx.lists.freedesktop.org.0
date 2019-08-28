Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE9AA0BFF
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 23:04:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C8789F0A;
	Wed, 28 Aug 2019 21:04:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780079.outbound.protection.outlook.com [40.107.78.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5233889F01
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 21:04:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kTyl4stB0MwER9qwOOZetsfy3EjNpeA/1n4NIuWsghUi2XTn4l6+blX3uYYapsgIi8Q+RFBHz3rII3lvSGUQFJSAGule4vI11Uk9YMg9sMTLUc275x+5B7KNvOOvpFWId9gqoz9dCMfI/B5CRpAq3DebinHlzNeELXUh+HIS5P7RNAZ/2nyW7+brm1bYBjC6fy2Djg0Dkxpa3bqhOavPAiB+JCBF94RotrB+bJ/P3BW/YLb4wYMGzmzAcTxtkEBgJqwWxFcgtKdxP3EGBNQhQzgcPrOqIF0Br5Lu/GiOIZ4vSnOBmYKgMZwvNGqxfsX+otK4tU2DGx+piEDJfzRhPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/VsKqjUoyZj5Nnr905S5ama/Kvn/Y3fL+2xjMEN4cYU=;
 b=bjgaBVL04B9dJ2HKrCnZZzBuS0GIy752CfKUqGPjzUlupx1fOR42bLB/jq/rU9xCkOm99lcse6kkwt9hRX9hU2LnZGFsVcYlyhoAULC6NgkVznyMDu+C6NQqyvMzkxnUysERp9FqXidSZDUaqJu0dhmIt0ZVQ0Jt7CaIgYO9HC4iFYKJb2VZuGdrPpRfT9ziFOVZO9Nl1x4UypDRvmKMwXc8u0rIKsq3R8rZKFA8XQ4g7a4qLmF5dgcA5C4aiNh+NdEZkX8+BEysCXEf/AVEbeElrLupynHBiisK56el+WhWPBvqid1h91SJDrTDTuyDtoS2VlmVi/gYmswULKUdSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0061.namprd12.prod.outlook.com (2603:10b6:0:56::29) by
 BN6PR12MB1265.namprd12.prod.outlook.com (2603:10b6:404:1d::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Wed, 28 Aug 2019 21:04:03 +0000
Received: from BY2NAM03FT004.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::200) by DM3PR12CA0061.outlook.office365.com
 (2603:10b6:0:56::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Wed, 28 Aug 2019 21:04:03 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT004.mail.protection.outlook.com (10.152.84.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Wed, 28 Aug 2019 21:04:03 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 28 Aug 2019
 16:04:01 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 01/17] drm/amd/display: Fix DML tests
Date: Wed, 28 Aug 2019 17:03:38 -0400
Message-ID: <20190828210354.21464-2-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828210354.21464-1-Bhawanpreet.Lakha@amd.com>
References: <20190828210354.21464-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(39860400002)(396003)(2980300002)(428003)(189003)(199004)(51416003)(1076003)(305945005)(476003)(70586007)(7696005)(478600001)(53416004)(26005)(86362001)(186003)(76176011)(8936002)(70206006)(2906002)(356004)(6916009)(6666004)(4326008)(486006)(336012)(50226002)(50466002)(81156014)(16586007)(81166006)(126002)(446003)(2351001)(11346002)(47776003)(36756003)(8676002)(2616005)(316002)(426003)(48376002)(53936002)(5660300002)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1265; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4f0222d-b681-40b5-3832-08d72bfb41c1
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BN6PR12MB1265; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1265:
X-Microsoft-Antispam-PRVS: <BN6PR12MB126528049A10E64D9B8EEDEFF9A30@BN6PR12MB1265.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:451;
X-Forefront-PRVS: 014304E855
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: bcjEENpq4MkjhPFqFZPGoOtviC5TXpxiQrw+hceuE0+VUWEv3r8b+zP+mDrMgVaSuCOBYha5qcly4FklVFhX8y6JsWDSlZtRGxe5qtu4hrONlTSURi0rCivnNO6oX79wpWhKgVgzUPII8vbwJc9+nomOsHfrI8gz9wM33RHpCo+H1nTBZyLzSaMu9hvy0PseJg9svG7mdnuH/mHNIvnyJpzRsFBPsTmq3c6be7l0X8tYZIImKe9nRcbvNFnuMmLhI6uq3MgzEmDri6N3lmhFRtqehUPX+Awc8LKLtqVfFXh59MfmgcahCMlUYkUELlZfNqWNI2ggQuCPgiIE3dtIQZu82knOiAp2biGsW6Hb5dxC+YEolPOnJLlETwQQldZpzmfA8U5hBkZM1dWocpXDtdnhonE6/hmeXZqSUMkh1Wc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2019 21:04:03.4610 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4f0222d-b681-40b5-3832-08d72bfb41c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1265
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/VsKqjUoyZj5Nnr905S5ama/Kvn/Y3fL+2xjMEN4cYU=;
 b=dSiXoMXZBGvredBGqHFfmP/kaZTukouJMgXgG+b+OvTR95AaOTnmbyEjzT48NqG2t21zv8tk0a3RbWRF8zGS/KEPgzc83wQwoe9D0xYHLlftAezqerp4WzKtX7H61dTjleFtoSmggteD34gPBBpl57+S2iuzILkxuhHw1BPDXYI=
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
Cc: Ilya Bakoulin <Ilya.Bakoulin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSWx5YSBCYWtvdWxpbiA8SWx5YS5CYWtvdWxpbkBhbWQuY29tPgoKW1doeV0KRE1MIGRp
YWdzIHRlc3RzIGFyZSBmYWlsaW5nIGJlY2F1c2UgdGhlIHN0cnVjdCBjb250ZW50cyBnZXQKY2xv
YmJlcmVkIGJ5IGEgbWVtY3B5LgoKW0hvd10KUmVtb3ZlIHRoZSBtZW1jcHkgY2FsbC4KClNpZ25l
ZC1vZmYtYnk6IElseWEgQmFrb3VsaW4gPElseWEuQmFrb3VsaW5AYW1kLmNvbT4KUmV2aWV3ZWQt
Ynk6IERteXRybyBMYWt0eXVzaGtpbiA8RG15dHJvLkxha3R5dXNoa2luQGFtZC5jb20+CkFja2Vk
LWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYyB8IDEg
LQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jCmluZGV4IDQ3Nzg4NTgx
Njg1NC4uMzUzZTNlN2NiOTI5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYwpAQCAtMjc5OCw3ICsyNzk4LDYgQEAgYm9v
bCBkY24yMF92YWxpZGF0ZV9iYW5kd2lkdGgoc3RydWN0IGRjICpkYywgc3RydWN0IGRjX3N0YXRl
ICpjb250ZXh0LAogCUFTU0VSVChmYWxzZSk7CiAKIHJlc3RvcmVfZG1sX3N0YXRlOgotCW1lbWNw
eSgmY29udGV4dC0+YndfY3R4LmRtbCwgJmRjLT5kbWwsIHNpemVvZihzdHJ1Y3QgZGlzcGxheV9t
b2RlX2xpYikpOwogCWNvbnRleHQtPmJ3X2N0eC5kbWwuc29jLmRyYW1fY2xvY2tfY2hhbmdlX2xh
dGVuY3lfdXMgPSBwX3N0YXRlX2xhdGVuY3lfdXM7CiAKIAlyZXR1cm4gdm9sdGFnZV9zdXBwb3J0
ZWQ7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
