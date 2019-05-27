Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8AA2BADC
	for <lists+amd-gfx@lfdr.de>; Mon, 27 May 2019 21:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE3FE899E9;
	Mon, 27 May 2019 19:52:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710073.outbound.protection.outlook.com [40.107.71.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE46899A3
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2019 19:51:57 +0000 (UTC)
Received: from DM3PR12CA0110.namprd12.prod.outlook.com (2603:10b6:0:55::30) by
 BN6PR12MB1265.namprd12.prod.outlook.com (2603:10b6:404:1d::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.16; Mon, 27 May 2019 19:51:55 +0000
Received: from CO1NAM03FT006.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::203) by DM3PR12CA0110.outlook.office365.com
 (2603:10b6:0:55::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.15 via Frontend
 Transport; Mon, 27 May 2019 19:51:55 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT006.mail.protection.outlook.com (10.152.80.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Mon, 27 May 2019 19:51:55 +0000
Received: from leodev.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 27 May 2019
 14:51:52 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 05/26] drm/amd/display: assign new stream id in dc_copy_stream
Date: Mon, 27 May 2019 15:50:44 -0400
Message-ID: <1558986665-12964-6-git-send-email-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558986665-12964-1-git-send-email-sunpeng.li@amd.com>
References: <1558986665-12964-1-git-send-email-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(376002)(39860400002)(396003)(346002)(2980300002)(428003)(199004)(189003)(16586007)(48376002)(11346002)(72206003)(356004)(86362001)(2351001)(446003)(426003)(486006)(126002)(6916009)(476003)(305945005)(6666004)(2616005)(316002)(53416004)(478600001)(70586007)(8676002)(2906002)(76176011)(186003)(47776003)(86152003)(77096007)(70206006)(50466002)(36756003)(68736007)(81166006)(81156014)(5660300002)(336012)(2876002)(8936002)(26005)(50226002)(53936002)(4326008)(51416003)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1265; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84c75fde-fc31-4df2-e9e8-08d6e2dcc594
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1265; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1265:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1265C8085927C10B2102FAAD821D0@BN6PR12MB1265.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 0050CEFE70
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: kcIEtBOHbWTAqODTBxDuGxQnLIJj7Vk//INqJT8hS+fEzCqjePNfFW2JCjF8x77Et3MR7GecRK+levr63iSchvT8+zKdoazpNpj3IAWITsrTRicweyws/iOR0jrnfWAVTvzXm4f8P7f3MdQbykFBRwbPJPDfc7GaJxLSNnP7bpOTbZ4uRle+PrtGGPkJq7Ut+X8KCIJLZRM2f7l3LXrAG9RFDhOD0/NPp4fAIi9k1yRG6awxTaI9bfMDwD69w5Um4Ja9bczJagwuZnzz8awYg9W6sa2VTh+9csQztj+Tag11aXElVP9QMSVj1UOEs+xq0eH+Qp08+I6z22TYL5Yavb0j0oFgTEiNM0+cMroTV4q1QEhO430KsMPuHjYMEB1++1d8VN1SLc1Lpkn8FJzVEiwLVWNBFlAWd/9M+G2hMVE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2019 19:51:55.3155 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84c75fde-fc31-4df2-e9e8-08d6e2dcc594
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1265
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7TOQgCwkdmc9MQpovLDpEqr6iN20BHN+2M9nKy7UHr0=;
 b=GguroiIZehnCA5Vjejs4d6rN41AZB99ZK0+mbiX4om/lbwFGKZIDpkazf37hJGutGvWaCP3FCpzBQGS5zhzksSOFHYmtQjrZ47/WIjUvL2WETKw/k7HqvwuU+uhFFO6LNgWZPFhqxQCyuWsW6SawbAryeB8lZm39mZ4cg8u9L80=
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
Cc: Wenjing Liu <Wenjing.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogV2VuamluZyBMaXUgPFdlbmppbmcuTGl1QGFtZC5jb20+Cgpbd2h5XQpzdHJlYW0gaWQg
c2hvdWxkIHVuaXF1ZWx5IGlkZW50aWZ5IGFuIGluc3RhbmNlIG9mIHN0cmVhbS4KdGhlIGNvcHkg
Y29uc3RydWN0b3Igc2hvdWxkIGJlIHRyZWF0ZWQgYXMgYSBuZXcKc3RyZWFtIGluc3RhbmNlLgoK
W2hvd10KYXNzaWduIGEgbmV3IHN0cmVhbSBpZCBpbiB0aGlzIGNvcHkgY29uc3RydWN0b3IuCgpT
aWduZWQtb2ZmLWJ5OiBXZW5qaW5nIExpdSA8V2VuamluZy5MaXVAYW1kLmNvbT4KUmV2aWV3ZWQt
Ynk6IEp1biBMZWkgPEp1bi5MZWlAYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5s
aUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3N0
cmVhbS5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19zdHJlYW0uYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3N0cmVhbS5jCmluZGV4IDU5YjI0
N2EuLmEwMDJlNjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9j
b3JlL2RjX3N0cmVhbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3Jl
L2RjX3N0cmVhbS5jCkBAIC0xNzksNiArMTc5LDkgQEAgc3RydWN0IGRjX3N0cmVhbV9zdGF0ZSAq
ZGNfY29weV9zdHJlYW0oY29uc3Qgc3RydWN0IGRjX3N0cmVhbV9zdGF0ZSAqc3RyZWFtKQogCWlm
IChuZXdfc3RyZWFtLT5vdXRfdHJhbnNmZXJfZnVuYykKIAkJZGNfdHJhbnNmZXJfZnVuY19yZXRh
aW4obmV3X3N0cmVhbS0+b3V0X3RyYW5zZmVyX2Z1bmMpOwogCisJbmV3X3N0cmVhbS0+c3RyZWFt
X2lkID0gbmV3X3N0cmVhbS0+Y3R4LT5kY19zdHJlYW1faWRfY291bnQ7CisJbmV3X3N0cmVhbS0+
Y3R4LT5kY19zdHJlYW1faWRfY291bnQrKzsKKwogCWtyZWZfaW5pdCgmbmV3X3N0cmVhbS0+cmVm
Y291bnQpOwogCiAJcmV0dXJuIG5ld19zdHJlYW07Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
