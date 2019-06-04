Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE6534C86
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 17:44:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B94F89A4B;
	Tue,  4 Jun 2019 15:44:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam05on060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe51::60f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA4C689A4B
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 Jun 2019 15:44:48 +0000 (UTC)
Received: from BN8PR12CA0013.namprd12.prod.outlook.com (2603:10b6:408:60::26)
 by MWHPR1201MB0063.namprd12.prod.outlook.com (2603:10b6:301:54::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.22; Tue, 4 Jun
 2019 15:44:46 +0000
Received: from CO1NAM03FT030.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::203) by BN8PR12CA0013.outlook.office365.com
 (2603:10b6:408:60::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1943.17 via Frontend
 Transport; Tue, 4 Jun 2019 15:44:46 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT030.mail.protection.outlook.com (10.152.80.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1943.19 via Frontend Transport; Tue, 4 Jun 2019 15:44:44 +0000
Received: from yttao-code-machine.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 4 Jun 2019 10:44:43 -0500
From: Yintian Tao <yttao@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/gfx9: reset compute ring wptr when gpu reset
Date: Tue, 4 Jun 2019 23:44:39 +0800
Message-ID: <1559663079-2448-1-git-send-email-yttao@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(346002)(376002)(396003)(2980300002)(428003)(199004)(189003)(8936002)(81166006)(81156014)(478600001)(8676002)(53936002)(2616005)(50466002)(50226002)(36756003)(4744005)(72206003)(53416004)(48376002)(305945005)(7696005)(47776003)(6916009)(476003)(126002)(51416003)(486006)(2906002)(4326008)(77096007)(26005)(68736007)(6666004)(356004)(186003)(426003)(5660300002)(16586007)(14444005)(70586007)(316002)(2351001)(70206006)(336012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR1201MB0063; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80bffec7-7b77-4924-02ca-08d6e9039189
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR1201MB0063; 
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0063:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0063BF7D3A192121F163D42EE5150@MWHPR1201MB0063.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-Forefront-PRVS: 0058ABBBC7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: GT+qONEwYWc6vKye5QHP1bIUf9vXw7WyhXeac973dunLlUZJjnbhEvQBBzQopxAW06yVCBeaVbMDjz1sADLNB1USwfRmm4srbxEwmBySTuy6qx3vSjtzwYwRdxfuOhe1S18YFps8vj1O253vzUa8iSSwr/i4kmAwz0+UFQ7h6GT7kRNEtsqXbg3lDYaq5apzImfUtQA1Td7zL8bxbWvp+9ixosYhvqfKx+vE1uJHc3vuwWjGjO8265wT6H2xW6k5YMpEzpVFiRMvoOi2ETei7Y4yI9s3OdBCVogXPpGHjEiU5xZLO3jVKnIfi1zFoGylTDk2XxbGql5GmH5VvPYkRY3HUGPnFSKHtK0pNy6LF/p1ZRpRXlGRESU+oa3Q25v5gJyBUTmWFS88YEQKRsoccAGYJi7RaAMc8azDdgwBF+k=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2019 15:44:44.9787 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80bffec7-7b77-4924-02ca-08d6e9039189
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0063
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PG0Z+/d5a2T7PI8vqauhNvlDavb6s80IebOG9XAAuSA=;
 b=mOWzUOtBiefL7ZciJJJ0CPDcXKqH527CvKYwVHImqsDGvnWVWufweEvfPeN6/WCp81l+0Jcv9lzFg6+1uCkxJr604LUlB9GVYaQrqwJBtgI82u3Yq9kT79vUxqUMRuUQ0xCDN2dqYy5BZ5YhY1iBY0+EqTR5fPMCBrFtn4pFsS0=
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
Cc: Yintian Tao <yttao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2UgbmVlZCByZXNldCBjb21wdXRlIHJpbmcgd3B0ciB0byB6ZXJvIHdoZW4gZ3B1IHJlc2V0Cmlu
IG9yZGVyIHRvIHByZXZlbnQgQ1AgaGFuZy4KClNpZ25lZC1vZmYtYnk6IFlpbnRpYW4gVGFvIDx5
dHRhb0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMg
fCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nZnhfdjlfMC5jCmluZGV4IDJlOWNhYzEuLjI1MjExYmEgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3Y5XzAuYwpAQCAtMzE3NSw2ICszMTc1LDcgQEAgc3RhdGljIGludCBnZnhf
djlfMF9rY3FfaW5pdF9xdWV1ZShzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpCiAKIAkJLyogcmVz
ZXQgcmluZyBidWZmZXIgKi8KIAkJcmluZy0+d3B0ciA9IDA7CisJCWFtZGdwdV9yaW5nX3NldF93
cHRyKHJpbmcpOwogCQlhbWRncHVfcmluZ19jbGVhcl9yaW5nKHJpbmcpOwogCX0gZWxzZSB7CiAJ
CWFtZGdwdV9yaW5nX2NsZWFyX3JpbmcocmluZyk7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
