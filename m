Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9BED48AA
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 21:53:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40AFA6EC91;
	Fri, 11 Oct 2019 19:53:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760043.outbound.protection.outlook.com [40.107.76.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82BF06EC8C
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 19:53:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KWnn5wsQtyeIAaNXmdJ2upVP00LTEyhaowCmKk+dF39FgAcYS4VUJJk9rXFFtXZQ0Sv2y6pNirVY4Kc/dtfyeWiw6nrqroHBO7DCv5zaCb8g1/cstLcEWkNoZceYQklsS5iLbu4EQhCOfvqUc/q5kLog7ffsjUz0EBqwykVX/9ff7g9POjw6wYcP+lprM2bC2GSmHi0nynqpHecuaoNLBvzYBOIua6kqSS0J6RDkx5yB5vg0UWIuwEEpDsAFgao76ejI0QrC30w1VQO1W0FV5a1scqQhC1swjZcWFMSzzJTRlIf/4mrwK6qz8qT6w7zdNBWLjoYEtiAHE+wBKfftsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgQI/Qlu4uof4mvFY1eKv0Mg1Jgvu6Lsr0m7rzLhEts=;
 b=I+s5clKPa0/psmZhzQJ6lbwEH5p9CFumCSmTNUfCcSDlK318rslKfX348IBGQGh5gzXd8WnmfK0NK8Tffhryh+te/P6r/dENGwjEDy6HeTOTdbLF7RV+wZK51hFoAYYDsh/NlOCjnUiWAxiXJE/r1vYxqYiTwlqHhFsndpJzFCyTuADZeq/coANuHOqDpJpBeBiGmszd+spDjK5ofnPKdY4qjgsnxy4kkLMklYrHC0WtiAk9l3/Gxzp/vUE7DR4Ua2nUGiAi1cmE+KeIVLOnDpee9Uk1VO2QWOwTiUjXXYRBFbgC4yS7VXaT1Mz8tlwMpl8z5tzKCttYlT5QBUbwoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0020.namprd12.prod.outlook.com (2603:10b6:5:1c0::33)
 by MW2PR12MB2364.namprd12.prod.outlook.com (2603:10b6:907:b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.21; Fri, 11 Oct
 2019 19:53:46 +0000
Received: from BY2NAM03FT051.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by DM6PR12CA0020.outlook.office365.com
 (2603:10b6:5:1c0::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Fri, 11 Oct 2019 19:53:46 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT051.mail.protection.outlook.com (10.152.85.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2347.21 via Frontend Transport; Fri, 11 Oct 2019 19:53:45 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 11 Oct 2019
 14:53:42 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 05/29] drm/amd/display: Add DCN_BASE regs
Date: Fri, 11 Oct 2019 15:53:00 -0400
Message-ID: <20191011195324.16268-6-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
References: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(346002)(396003)(428003)(199004)(189003)(2351001)(305945005)(70586007)(1076003)(70206006)(26005)(186003)(86362001)(50466002)(476003)(51416003)(7696005)(426003)(126002)(486006)(11346002)(2616005)(446003)(336012)(47776003)(76176011)(6916009)(53416004)(6666004)(356004)(16586007)(81156014)(81166006)(36756003)(8936002)(478600001)(8676002)(316002)(48376002)(4326008)(50226002)(5660300002)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR12MB2364; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d33bea1-8d13-42fc-47ec-08d74e84ba12
X-MS-TrafficTypeDiagnostic: MW2PR12MB2364:
X-Microsoft-Antispam-PRVS: <MW2PR12MB236475995B4CE2FED25D4AD3F9970@MW2PR12MB2364.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 0187F3EA14
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XErMhlDZv0d/eCCl19ArHGmM6kn1lZoBdy5nC1r+cG4sKd8vN9bwruBisR8ih2sGoG7chnCTLpNBhxDfQYas2Syr+olm2/gRtZ0aArSqxC7JLez0Dd5eo8RP7q++T/06ZKf92KZLvb2D+tkjKPMWiKLTiTidLHgxprSWWe6grK4Ed58xUqEOzorZQ6YjGAjM28rK9wtxiVHCg6bF/xlpH7yWEUUOJ58Njt6Q2qsx/7qX7vFqAtieyqNfEVUm4dnb6lNwm9XdpF+aEhsMZdi4LVk/5Fdr9dSm1tkltQ00geg1bKIu3QxndFs5B6o9QHd7VxXMvhoIXxPlgZKHKmxzguifGdeIPRMdI80KDXx+kj0UDDJqwZ6ipZJJhmW5V0y13atURd00sl0XmPnlHA1NLQdAGOaL2evvBhmZ5OM+N3k=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 19:53:45.4189 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d33bea1-8d13-42fc-47ec-08d74e84ba12
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2364
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgQI/Qlu4uof4mvFY1eKv0Mg1Jgvu6Lsr0m7rzLhEts=;
 b=2YZS6RQD6opH/PXYfKx9X50GWlsAC9Q7o12Q97R0VfkDt7mnl6eyqPl91TkvQF+/EyhZkOwLgXtikcbj31rlPsCHQOMiLV/yMzt+nqfQwxnZ2UvLwwjAl1oz9JgL9f3oS9DspqBswGp/ScKMTXW1EbVWoqZvKYPZyEgyRqqO6+M=
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
