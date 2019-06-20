Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B466E4C715
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2019 08:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5783C6E4B7;
	Thu, 20 Jun 2019 06:05:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710046.outbound.protection.outlook.com [40.107.71.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 528BD6E4B7
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 Jun 2019 06:05:14 +0000 (UTC)
Received: from MWHPR1201CA0013.namprd12.prod.outlook.com
 (2603:10b6:301:4a::23) by BN7PR12MB2659.namprd12.prod.outlook.com
 (2603:10b6:408:29::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1987.15; Thu, 20 Jun
 2019 06:05:12 +0000
Received: from CO1NAM03FT029.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::204) by MWHPR1201CA0013.outlook.office365.com
 (2603:10b6:301:4a::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1987.13 via Frontend
 Transport; Thu, 20 Jun 2019 06:05:11 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT029.mail.protection.outlook.com (10.152.80.168) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2008.13 via Frontend Transport; Thu, 20 Jun 2019 06:05:10 +0000
Received: from ubuntu.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 20 Jun 2019
 01:05:08 -0500
From: Jack Zhang <Jack.Zhang1@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/sriov: fix Tonga load driver failed
Date: Thu, 20 Jun 2019 14:04:48 +0800
Message-ID: <1561010688-5943-1-git-send-email-Jack.Zhang1@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(346002)(39860400002)(136003)(396003)(2980300002)(428003)(189003)(199004)(47776003)(126002)(478600001)(86362001)(2616005)(476003)(53936002)(2906002)(186003)(2351001)(72206003)(4326008)(53416004)(486006)(316002)(16586007)(50226002)(8936002)(6666004)(356004)(68736007)(4744005)(51416003)(7696005)(77096007)(5660300002)(26005)(36756003)(8676002)(6916009)(336012)(305945005)(48376002)(70206006)(70586007)(426003)(50466002)(81166006)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2659; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60244c75-ca1c-456c-c189-08d6f545414a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN7PR12MB2659; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2659:
X-Microsoft-Antispam-PRVS: <BN7PR12MB26592C277641B936898E06D9BBE40@BN7PR12MB2659.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-Forefront-PRVS: 0074BBE012
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: LmYdTbbW2/PjLzHCL1ZOBtSat85+PjeJdb2LIK0L1Cn6KolpSbLky0AGiUjjqdGiqFXvyNVftkzYG/l53BexGQkpNt7jJHSvk83jCY1F5JO0FnPx3syU+xXDuItOvgHI8Ct30zzpueRFWPCvNRrtBfE1eA8xLpFBnjVI6xGscDiMd63WNKobnCX8KylRgABfOBRkCfyFiHkWk4yQAQZrIAWG5u/WK2XqDcj35jGHQyytWUA5FCBLD0k0YKNqizfesXsnSWNSl1nnRlXxHrasEjE3yp5d+rlRRD18qe4fSxnfDKMG3hGLDHa/0SXrOVUcxARo+Yq5h6Onfj4jXVNH2BtlIKrgskDy1Kt499r9LHmXtPgMS7NqawWSsuEShHnFbmdaKgj8l9H+FZ6jIj0rHwAhEtU7n1Lud8Mi70fdnIQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2019 06:05:10.2480 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60244c75-ca1c-456c-c189-08d6f545414a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2659
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7p4ACzWI3f+zpbKeucxrWOhTO6Il62DrvN6Opp3+Yd0=;
 b=agGd/sR0+cZ+og/9IqfvpgcWTL4nw70N8Kr6NxKuZ7CWdKcofgHzMwcbhQ6YbTtoo2nlNm9EQFq9n1zzbT7XOcfW7nx7dH0exjWcq6fgYvwZDXlKcMYz7XXkyMTiyIl/07f+Qhq1CxXTC6tIsV+QvSpcJ4koBKKPa8f9ZlqcX5U=
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
Cc: Jack Zhang <Jack.Zhang1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VG9uZ2Egc3Jpb3YgbmVlZCB0byB1c2Ugc211IHRvIGxvYWQgZmlybXdhcmUuClJlbW92ZSBzcmlv
diBmbGFnIGJlY2F1c2UgdGhlIGRlZmF1bHQgcmV0dXJuIHZhbHVlIGlzIHplcm8uCgpTaWduZWQt
b2ZmLWJ5OiBKYWNrIFpoYW5nIDxKYWNrLlpoYW5nMUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jIHwgMiAtLQogMSBmaWxlIGNoYW5nZWQsIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3BtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYwppbmRleCAwOTNj
ZWZkLi40NjljZGE5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYwpAQCAt
Mjc1NSw4ICsyNzU1LDYgQEAgaW50IGFtZGdwdV9wbV9sb2FkX3NtdV9maXJtd2FyZShzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3QgKnNtdV92ZXJzaW8KIHsKIAlpbnQgcjsKIAot
CWlmIChhbWRncHVfc3Jpb3ZfdmYoYWRldikpCi0JCXJldHVybiAwOwogCiAJaWYgKGFkZXYtPnBv
d2VycGxheS5wcF9mdW5jcyAmJiBhZGV2LT5wb3dlcnBsYXkucHBfZnVuY3MtPmxvYWRfZmlybXdh
cmUpIHsKIAkJciA9IGFkZXYtPnBvd2VycGxheS5wcF9mdW5jcy0+bG9hZF9maXJtd2FyZShhZGV2
LT5wb3dlcnBsYXkucHBfaGFuZGxlKTsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
