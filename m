Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0900B2B073
	for <lists+amd-gfx@lfdr.de>; Mon, 27 May 2019 10:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC0E897FF;
	Mon, 27 May 2019 08:41:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810059.outbound.protection.outlook.com [40.107.81.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809D0897FF
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2019 08:41:34 +0000 (UTC)
Received: from BN8PR12CA0023.namprd12.prod.outlook.com (2603:10b6:408:60::36)
 by DM6PR12MB2665.namprd12.prod.outlook.com (2603:10b6:5:4a::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1922.18; Mon, 27 May
 2019 08:41:32 +0000
Received: from CO1NAM03FT040.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by BN8PR12CA0023.outlook.office365.com
 (2603:10b6:408:60::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.16 via Frontend
 Transport; Mon, 27 May 2019 08:41:32 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT040.mail.protection.outlook.com (10.152.81.183) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Mon, 27 May 2019 08:41:31 +0000
Received: from build-machine.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 27 May 2019
 03:41:30 -0500
From: Emily Deng <Emily.Deng@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Don't need to call csb_vram_unpin
Date: Mon, 27 May 2019 16:41:27 +0800
Message-ID: <1558946487-18034-1-git-send-email-Emily.Deng@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(346002)(396003)(136003)(2980300002)(428003)(199004)(189003)(186003)(50226002)(68736007)(316002)(6916009)(50466002)(77096007)(305945005)(53936002)(8936002)(5660300002)(81166006)(81156014)(8676002)(36756003)(53416004)(70586007)(70206006)(26005)(336012)(426003)(7696005)(16586007)(2616005)(2906002)(14444005)(476003)(47776003)(4744005)(486006)(126002)(4326008)(48376002)(6666004)(356004)(72206003)(86362001)(2351001)(478600001)(51416003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2665; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9f02790-9853-4183-3038-08d6e27f1e8e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM6PR12MB2665; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2665:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2665C8B7CE1E3EC686445F2F8F1D0@DM6PR12MB2665.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-Forefront-PRVS: 0050CEFE70
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 2UamhGo8QjlbG2YsttDhlve+Vdy6oxc9+M5r5rQk0j6vUqF4stUAnEgKbAf6JqXwjH6nngQwiycHHXOw4mK25E+L12ObzlsZjSwGon9j0hINvMmh2cdKyrD78esKP+hvNy/FdYoxR1jugXulKS62IW+uLcPRe6yLQLvdAjvLtdl0mxlrzGXxHthEeAFigGzkMLQzlqDs0y2w+65OZ7qoih/iw+PuowftnVkvE/3zgL4ntja82jaHHwPU/XjL5k5Fqt40n9EXvPAOUlVsRnG3zxjz/C9nwdlHiP+LcaunrhsjJfwRK0Y3lzwQ39t1+9ocIw8y00MnE0brLdt0sgGEBhDlsGMfoBllrln+53H+3+bQOb/sRzTz+etZzkb37XjYKe0LnISAW9ypZ2eL+9Fx5NLe4huXeNo4uhi9YA18PwE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2019 08:41:31.8891 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9f02790-9853-4183-3038-08d6e27f1e8e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2665
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+k17dWKUpj1AvDV2bltmcKaSJteoPXHMUrHm/yHE3lE=;
 b=zRUIbjq48F01xAiily58GobEFDMXj3dIxLelQVmE9giluu6tfdITuBHwij3XG9aw4l32mLG+Oof9k8uOH7ka1h1kYL6pVWVl4UptalSQ8QBv5+i1jlp8xQaVsWvbivisaxKOTWUXGTqcWBL2+wmICDbsgGvqkf6h/nFhtv04u2o=
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
Cc: Emily Deng <Emily.Deng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QXMgaXQgd2lsbCBkZXN0cm95IGNsZWFyX3N0YXRlX29iaiwgYW5kIGFsc28gd2lsbAp1bnBpbiBp
dCBpbiB0aGUgZ2Z4X3Y5XzBfc3dfZmluaSwgc28gZG9uJ3QgbmVlZCB0bwpjYWxsIGNzYl92cmFt
IHVucGluIGluIGdmeF92OV8wX2h3X2ZpbmksIG9yIGl0IHdpbGwKaGF2ZSB1bnBpbiB3YXJuaW5n
LgoKdjI6IEZvciBzdXNwZW5kLCBzdGlsbCBuZWVkIHRvIGRvIHVucGluCgpTaWduZWQtb2ZmLWJ5
OiBFbWlseSBEZW5nIDxFbWlseS5EZW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3Y5XzAuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4X3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKaW5k
ZXggNWViNzBlOC4uNWIxZmY0OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4X3Y5XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5j
CkBAIC0zMzk1LDcgKzMzOTUsOCBAQCBzdGF0aWMgaW50IGdmeF92OV8wX2h3X2Zpbmkodm9pZCAq
aGFuZGxlKQogCWdmeF92OV8wX2NwX2VuYWJsZShhZGV2LCBmYWxzZSk7CiAJYWRldi0+Z2Z4LnJs
Yy5mdW5jcy0+c3RvcChhZGV2KTsKIAotCWdmeF92OV8wX2NzYl92cmFtX3VucGluKGFkZXYpOwor
CWlmIChhZGV2LT5pbl9zdXNwZW5kKQorCQlnZnhfdjlfMF9jc2JfdnJhbV91bnBpbihhZGV2KTsK
IAogCXJldHVybiAwOwogfQotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
