Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 664AB1CE43
	for <lists+amd-gfx@lfdr.de>; Tue, 14 May 2019 19:50:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD92892DE;
	Tue, 14 May 2019 17:50:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700076.outbound.protection.outlook.com [40.107.70.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6D7892DE
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 May 2019 17:50:09 +0000 (UTC)
Received: from BN6PR12CA0032.namprd12.prod.outlook.com (2603:10b6:405:70::18)
 by DM5PR1201MB0059.namprd12.prod.outlook.com (2603:10b6:4:54::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1900.16; Tue, 14 May
 2019 17:50:07 +0000
Received: from DM3NAM03FT012.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::202) by BN6PR12CA0032.outlook.office365.com
 (2603:10b6:405:70::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.22 via Frontend
 Transport; Tue, 14 May 2019 17:50:06 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT012.mail.protection.outlook.com (10.152.82.116) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Tue, 14 May 2019 17:50:06 +0000
Received: from hwentlanhp.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 14 May 2019
 12:50:05 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/amd/display: Add ASICREV_IS_PICASSO
Date: Tue, 14 May 2019 13:49:33 -0400
Message-ID: <20190514174935.28605-1-harry.wentland@amd.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(2980300002)(428003)(189003)(199004)(54906003)(8936002)(70586007)(1076003)(72206003)(356004)(6666004)(6916009)(81156014)(68736007)(5660300002)(81166006)(8676002)(2906002)(2870700001)(47776003)(70206006)(51416003)(7696005)(36756003)(86362001)(50466002)(48376002)(77096007)(26005)(186003)(53416004)(44832011)(498600001)(305945005)(50226002)(426003)(2616005)(336012)(4326008)(126002)(486006)(476003)(2351001)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0059; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb29a384-98e0-4152-4e3a-08d6d89499b0
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:DM5PR1201MB0059; 
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0059:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB005975EE7B7E22B8E832A6D08C080@DM5PR1201MB0059.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:565;
X-Forefront-PRVS: 0037FD6480
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: IxWDkUQEV1p01K2MIKXbJuc/Yl5CQef/9GL/Ydgl/wEUAlaatYvQVnzuMMyDstJj+94CtiNuYGVxvS/QAkXqvEA09GEVD7zk+oaR8Kzhoc9J3HvvsmuAuKqvwFJPetANVJiwq8QKeY7rj7Tpdyw9MPQ6NQlhsSgevQokZWt1Fk+ljcKNav0mF4ZNYwVnJeVbuTH+U69V3Mfvv+yfNbqywuPr2CI2cyu5PWRlDsiN1fs3QRi8EX4riq6lLmdhBMJBt+BojMTDG48DowLDbmgv1vFZW1b1I37IxLErPzzpyzUF87rMpr7raLXXLHuXd+CfpOElvzR58nFWLDY6HdciHlzR8JXKlE15s7o0q9AGxG+DOwaitvAzLnkfLJ9JpgWBCwkrHFtSQW4Bhj7qJxjgaPf+ZAXe3xTUSjx4TdoeM60=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2019 17:50:06.3670 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb29a384-98e0-4152-4e3a-08d6d89499b0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0059
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1dtxOOuFnduekSDxgnGftpl6qZmh1jLI3iCYNy+k4M=;
 b=azLzhW1xiGw96nADVf+dwJlhRzNtanytw4XtV1wxNcM/u/jYBKDqHWZANCVhlQ2H04hNLcoxo+Fvqe2e+4LPnBVM2uV2InIKVCQ+wCMCjCuCtS4Rkg5y9ZEuVhyIl/2vGVoUP8HSwxtnm2cYPjqS1a82bcOBLXADMksTYraWWBA=
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
Cc: Alexander.Deucher@amd.com, Harry Wentland <harry.wentland@amd.com>,
 Tony.Cheng@amd.com, Nicholas.Kazlauskas@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1dIWV0KV2Ugb25seSB3YW50IHRvIGxvYWQgRE1DVSBGVyBvbiBQaWNhc3NvIGFuZCBSYXZlbiAy
LCBub3Qgb24gUmF2ZW4gMS4KClNpZ25lZC1vZmYtYnk6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53
ZW50bGFuZEBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9pbmNsdWRl
L2RhbF9hc2ljX2lkLmggfCA3ICsrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2luY2x1ZGUvZGFsX2FzaWNfaWQuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9p
bmNsdWRlL2RhbF9hc2ljX2lkLmgKaW5kZXggMWE5Yjc1MDc3ODRmLi4wNzJkOGQ3ZGViZjUgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9pbmNsdWRlL2RhbF9hc2ljX2lk
LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2luY2x1ZGUvZGFsX2FzaWNfaWQu
aApAQCAtMTM5LDEzICsxMzksMTQgQEAKICNkZWZpbmUgUkFWRU4xX0YwIDB4RjAKICNkZWZpbmUg
UkFWRU5fVU5LTk9XTiAweEZGCiAKLSNpZiBkZWZpbmVkKENPTkZJR19EUk1fQU1EX0RDX0RDTjFf
MDEpCi0jZGVmaW5lIEFTSUNSRVZfSVNfUkFWRU4yKGVDaGlwUmV2KSAoKGVDaGlwUmV2ID49IFJB
VkVOMl9BMCkgJiYgKGVDaGlwUmV2IDwgMHhGMCkpCi0jZW5kaWYgLyogRENOMV8wMSAqLwogI2Rl
ZmluZSBBU0lDX1JFVl9JU19SQVZFTihlQ2hpcFJldikgKChlQ2hpcFJldiA+PSBSQVZFTl9BMCkg
JiYgZUNoaXBSZXYgPCBSQVZFTl9VTktOT1dOKQogI2RlZmluZSBSQVZFTjFfRjAgMHhGMAogI2Rl
ZmluZSBBU0lDUkVWX0lTX1JWMV9GMChlQ2hpcFJldikgKChlQ2hpcFJldiA+PSBSQVZFTjFfRjAp
ICYmIChlQ2hpcFJldiA8IFJBVkVOX1VOS05PV04pKQogCisjaWYgZGVmaW5lZChDT05GSUdfRFJN
X0FNRF9EQ19EQ04xXzAxKQorI2RlZmluZSBBU0lDUkVWX0lTX1BJQ0FTU08oZUNoaXBSZXYpICgo
ZUNoaXBSZXYgPj0gUElDQVNTT19BMCkgJiYgKGVDaGlwUmV2IDwgUkFWRU4yX0EwKSkKKyNkZWZp
bmUgQVNJQ1JFVl9JU19SQVZFTjIoZUNoaXBSZXYpICgoZUNoaXBSZXYgPj0gUkFWRU4yX0EwKSAm
JiAoZUNoaXBSZXYgPCAweEYwKSkKKyNlbmRpZiAvKiBEQ04xXzAxICovCiAKICNkZWZpbmUgRkFN
SUxZX1JWIDE0MiAvKiBEQ04gMSovCiAKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
