Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 608E8D1A79
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 23:06:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E7F6EA5F;
	Wed,  9 Oct 2019 21:06:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-by2nam05on0606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe52::606])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 140896E99A
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2019 21:06:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGCpjNzgTs/70FTzGEWHxlsdp6D0DgoAbKb5mrujDuTdAOac8aqFjqrRhMpy3ga6k40hiR8H2npLTR8dtwgnnfPG5s1RrpIIEg92sB7U8lE+ALQUzk50ey9UBaqb/7CU/6I/8CnQzttCJIQRfvw4dcNd8FkaKm+MpY0d7FzCuFtt3+Dc1X6gedRIdnmmmH14QYwL5J2au/RxUdAybxAr4Bqb2IGdB+WqT6qnN76e65R3NOQ2aWaGXfp+UbkicoR6hydpi1cZoBajVPmN4VPWwudD0t+MXmRzQsVvtvOU8tRuGfY0DKo/n+ZTArxftyNg1092wn3lO62tDClPdaerIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgQI/Qlu4uof4mvFY1eKv0Mg1Jgvu6Lsr0m7rzLhEts=;
 b=kt3ackq4Tdd4D41jLr6LtDFPZ44tX3OlBexdKWM/vCKF3EUFzAMNtVgXEa0UYCvXc2Yo8fqS4GJQyhrUuVfRQfNw04ICehC9EJDDAv+V77s6NgZ9HWeMqRZLaK1lA+AGR1+5eeXbSI1rpY7IuacxHzLZgFUNm8iMU8udc2Y1hH/9u15VODiqXKyfNTX7XgQJ6D56ZL4EbyHRIvSSWjj1AsEI3DmszZbR7FtBiOymU6yyKhnKEvWk5uGHpDyfjBXg6HMkO8sRmSticUlBNcINXX6WMsM6iOiFEMjWbQ5Fas21p/GMlelP3lMrSzIVhLnNBx9/kBS9eu1WZUdgVwmpAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0019.namprd12.prod.outlook.com
 (2603:10b6:301:4a::29) by BYAPR12MB3205.namprd12.prod.outlook.com
 (2603:10b6:a03:134::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.23; Wed, 9 Oct
 2019 21:06:22 +0000
Received: from DM3NAM03FT052.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by MWHPR1201CA0019.outlook.office365.com
 (2603:10b6:301:4a::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Wed, 9 Oct 2019 21:06:22 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT052.mail.protection.outlook.com (10.152.83.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 9 Oct 2019 21:06:22 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 9 Oct 2019
 16:06:20 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 04/26] drm/amd/display: Add DCN_BASE regs
Date: Wed, 9 Oct 2019 17:05:51 -0400
Message-ID: <20191009210613.17929-5-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
References: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(396003)(39860400002)(428003)(199004)(189003)(316002)(476003)(2351001)(47776003)(16586007)(36756003)(446003)(11346002)(54906003)(426003)(126002)(2616005)(486006)(1076003)(186003)(26005)(5660300002)(478600001)(50466002)(336012)(53416004)(70206006)(86362001)(50226002)(4326008)(8936002)(356004)(6666004)(70586007)(81166006)(2906002)(6916009)(48376002)(81156014)(8676002)(305945005)(51416003)(76176011)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3205; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd063947-f56b-47a6-abdd-08d74cfc89e8
X-MS-TrafficTypeDiagnostic: BYAPR12MB3205:
X-Microsoft-Antispam-PRVS: <BYAPR12MB32058AA079ECB57F89846779F9950@BYAPR12MB3205.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 018577E36E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hSrB3dG5H2gHqE/LGEmOrEr4Bw5ZCOXdalbylISOV0D6fCVU3w2SB6BuHp6pp9HGSP1bjVeTtkUyS/Cuelx+DH7+jM6WoAkebRgD8jMSgLG40iH+10P7hUU2z2AC0nTY8YYeuMy5MsXhYEEPTBOA/75Mn/3ePXjG7b5VDdvENmaf5QK3JbqGY4A6OZHiIQRnd9CJygP2xac6BkFLRtEOu8wI15U5OoQf4eScPfZp22F5LY25jgi+bFPhfj5XC1HRBvseHUiqQiWGUjQY4WLzt4EOoZqqQOIhDDLRmFZfyP8QcQ9R9LFxC3v+lAoTy3lCN9rPpPPjErP4cUlPs62hzKZLXXNI59N86ubyWsdDsLXbjvvP4GdwW8aRAERc7nPbohCKHt+IZ8PR4GWsXooNDqJw/+uvUqWlevGQe05h96k=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 21:06:22.4310 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd063947-f56b-47a6-abdd-08d74cfc89e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3205
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgQI/Qlu4uof4mvFY1eKv0Mg1Jgvu6Lsr0m7rzLhEts=;
 b=X9O+WKpV1CWWVR0Ok5yKh9rKqMx3xq1u+LP5ae1RmQIQTDSQKSn+8+vczU47JD0dVrSt/c6uwSv1cVKRxqXGN2oCGCf8pK6+y/R99sBmv4GECHwkYkkxciWw1NM/xf+iZFc71FUySxtIUJBdU9vy3f42oLCv6fafs5H5lbVc27Q=
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
Cc: sunpeng.li@amd.com, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 harry.wentland@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5j
b20+Ci0tLQogLi4uL2dwdS9kcm0vYW1kL2luY2x1ZGUvcmVub2lyX2lwX29mZnNldC5oICAgIHwg
MzQgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvcmVub2lyX2lwX29mZnNl
dC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL3Jlbm9pcl9pcF9vZmZzZXQuaAppbmRl
eCAwOTQ2NDhjYWMzOTIuLjA3NjMzZTIyZTk5YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9pbmNsdWRlL3Jlbm9pcl9pcF9vZmZzZXQuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2luY2x1ZGUvcmVub2lyX2lwX29mZnNldC5oCkBAIC0xNjksNiArMTY5LDExIEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgSVBfQkFTRSBOQklGMF9CQVNFID17IHsgeyB7IDB4MDAwMDAwMDAsIDB4MDAw
MDAwMTQsIDB4MDAwMDBECiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
eyB7IDAsIDAsIDAsIDAsIDAgfSB9LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHsgeyAwLCAwLCAwLCAwLCAwIH0gfSwKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB7IHsgMCwgMCwgMCwgMCwgMCB9IH0gfSB9Oworc3RhdGljIGNvbnN0IHN0
cnVjdCBJUF9CQVNFIERDTl9CQVNFICAgPXsgeyB7IHsgMHgwMDAwMDAxMiwgMHgwMDAwMDBDMCwg
MHgwMDAwMzRDMCwgMCwgMCB9IH0sCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgeyB7IDAsIDAsIDAsIDAsIDAgfSB9LAorICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHsgeyAwLCAwLCAwLCAwLCAwIH0gfSwKKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB7IHsgMCwgMCwgMCwgMCwgMCB9IH0sCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgeyB7IDAsIDAsIDAsIDAsIDAgfSB9IH0gfTsKIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgSVBfQkFTRSBPU1NTWVNfQkFTRSA9eyB7IHsgeyAweDAwMDAxMEEw
LCAweDAyNDBBMDAwLCAwLCAwLCAwIH0gfSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB7IHsgMCwgMCwgMCwgMCwgMCB9IH0sCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgeyB7IDAsIDAsIDAsIDAsIDAgfSB9LApAQCAtMTM2MSw0ICsxMzY2
LDMzIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgSVBfQkFTRSBVVkQwX0JBU0UgPXsgeyB7IHsgMHgw
MDAwNzgwMCwgMHgwMDAwN0UwMCwgMHgwMjQwMzAwCiAjZGVmaW5lIFVWRDBfQkFTRV9fSU5TVDZf
U0VHMyAgICAgICAgICAgICAgICAgICAgICAwCiAjZGVmaW5lIFVWRDBfQkFTRV9fSU5TVDZfU0VH
NCAgICAgICAgICAgICAgICAgICAgICAwCiAKKyNkZWZpbmUgRENOX0JBU0VfX0lOU1QwX1NFRzAg
ICAgICAgICAgICAgICAgICAgICAgMHgwMDAwMDAxMgorI2RlZmluZSBEQ05fQkFTRV9fSU5TVDBf
U0VHMSAgICAgICAgICAgICAgICAgICAgICAweDAwMDAwMEMwCisjZGVmaW5lIERDTl9CQVNFX19J
TlNUMF9TRUcyICAgICAgICAgICAgICAgICAgICAgIDB4MDAwMDM0QzAKKyNkZWZpbmUgRENOX0JB
U0VfX0lOU1QwX1NFRzMgICAgICAgICAgICAgICAgICAgICAgMAorI2RlZmluZSBEQ05fQkFTRV9f
SU5TVDBfU0VHNCAgICAgICAgICAgICAgICAgICAgICAwCisKKyNkZWZpbmUgRENOX0JBU0VfX0lO
U1QxX1NFRzAgICAgICAgICAgICAgICAgICAgICAgMAorI2RlZmluZSBEQ05fQkFTRV9fSU5TVDFf
U0VHMSAgICAgICAgICAgICAgICAgICAgICAwCisjZGVmaW5lIERDTl9CQVNFX19JTlNUMV9TRUcy
ICAgICAgICAgICAgICAgICAgICAgIDAKKyNkZWZpbmUgRENOX0JBU0VfX0lOU1QxX1NFRzMgICAg
ICAgICAgICAgICAgICAgICAgMAorI2RlZmluZSBEQ05fQkFTRV9fSU5TVDFfU0VHNCAgICAgICAg
ICAgICAgICAgICAgICAwCisKKyNkZWZpbmUgRENOX0JBU0VfX0lOU1QyX1NFRzAgICAgICAgICAg
ICAgICAgICAgICAgMAorI2RlZmluZSBEQ05fQkFTRV9fSU5TVDJfU0VHMSAgICAgICAgICAgICAg
ICAgICAgICAwCisjZGVmaW5lIERDTl9CQVNFX19JTlNUMl9TRUcyICAgICAgICAgICAgICAgICAg
ICAgIDAKKyNkZWZpbmUgRENOX0JBU0VfX0lOU1QyX1NFRzMgICAgICAgICAgICAgICAgICAgICAg
MAorI2RlZmluZSBEQ05fQkFTRV9fSU5TVDJfU0VHNCAgICAgICAgICAgICAgICAgICAgICAwCisK
KyNkZWZpbmUgRENOX0JBU0VfX0lOU1QzX1NFRzAgICAgICAgICAgICAgICAgICAgICAgMAorI2Rl
ZmluZSBEQ05fQkFTRV9fSU5TVDNfU0VHMSAgICAgICAgICAgICAgICAgICAgICAwCisjZGVmaW5l
IERDTl9CQVNFX19JTlNUM19TRUcyICAgICAgICAgICAgICAgICAgICAgIDAKKyNkZWZpbmUgRENO
X0JBU0VfX0lOU1QzX1NFRzMgICAgICAgICAgICAgICAgICAgICAgMAorI2RlZmluZSBEQ05fQkFT
RV9fSU5TVDNfU0VHNCAgICAgICAgICAgICAgICAgICAgICAwCisKKyNkZWZpbmUgRENOX0JBU0Vf
X0lOU1Q0X1NFRzAgICAgICAgICAgICAgICAgICAgICAgMAorI2RlZmluZSBEQ05fQkFTRV9fSU5T
VDRfU0VHMSAgICAgICAgICAgICAgICAgICAgICAwCisjZGVmaW5lIERDTl9CQVNFX19JTlNUNF9T
RUcyICAgICAgICAgICAgICAgICAgICAgIDAKKyNkZWZpbmUgRENOX0JBU0VfX0lOU1Q0X1NFRzMg
ICAgICAgICAgICAgICAgICAgICAgMAorI2RlZmluZSBEQ05fQkFTRV9fSU5TVDRfU0VHNCAgICAg
ICAgICAgICAgICAgICAgICAwCiAjZW5kaWYKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
