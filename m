Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE6569DC7
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E09A89C8F;
	Mon, 15 Jul 2019 21:21:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720047.outbound.protection.outlook.com [40.107.72.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D33989CA2
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dl3Fjp4ra20Bak2KTBFQlE4LyeKcj/r4XzmWf+zHpzmELarmJHufQqeKVRC4siE6dd1Rq0TPiQYq74xpTH7BkRa4LNQgmao5uAiHQb/8skLPlBmoHpTYzRwObA4TJM+eH/PW1KJcGVzFhVeSCixHJhOXz0KEJC9mNx4IuE5RuTXf7taI+naurtBX9Q6RIUWwhAwEB/YwJXRlMagcQPz9SkMT3sQcvgqOGlgKZmwQjYUR/Rklp40Owl1ROCLEtYVcz3g4nYb1bSZX6FLreDt4MDWfAQ9LCTiPFjjT0N9EOIwLSa63u+5AODLA3Y5TGiQqoGs2/HEgNbUPvLNlspRNEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5BdAbYa5cwN6tbKscrCEka2354OlKbWpMBH0kbZOVE=;
 b=KOXA+co4soSSCoAbvavC76CLwGGUBjIfYmfsmfCneqVhKDgMQYaCDjlqm9mVBjIlQhM07YvpoGcdA6+tPA+XVI8cCE8ozqS20s9Vc5Hb32YyxQW8j+593mFAIJBhMiWWrpyys3yxRrn+WUWqMynmWulcP0xuUP2xAIR3H8mKU6aL+LcXaOgv6YxdvsIk7ZROP0rRRQIOkbY8l3zJThU3tcvW1Rrm8oGYh4VGZCp8MgId9kNPrroXzavVfnJqAB6RhoZt2eanAm5P3bQKZTo/17mW5CH76/VPJxFsfJ27Kyb1DBNUKfvR0GWkYvSUe6TsXJuKZdtCxZ6YIBV/55OujQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MN2PR12CA0007.namprd12.prod.outlook.com (2603:10b6:208:a8::20)
 by CH2PR12MB3928.namprd12.prod.outlook.com (2603:10b6:610:23::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.10; Mon, 15 Jul
 2019 21:21:46 +0000
Received: from CO1NAM03FT049.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by MN2PR12CA0007.outlook.office365.com
 (2603:10b6:208:a8::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.14 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:46 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT049.mail.protection.outlook.com (10.152.81.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:46 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:30 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 53/87] drm/amd/display: Clear FEC_READY shadow register if
 DPCD write fails
Date: Mon, 15 Jul 2019 17:20:15 -0400
Message-ID: <20190715212049.4584-54-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(39860400002)(376002)(396003)(2980300002)(428003)(199004)(189003)(2351001)(81166006)(2870700001)(68736007)(4326008)(1076003)(2906002)(81156014)(8936002)(8676002)(6916009)(6666004)(356004)(47776003)(53936002)(50226002)(426003)(50466002)(478600001)(2876002)(305945005)(316002)(11346002)(49486002)(5660300002)(48376002)(2616005)(51416003)(446003)(126002)(336012)(76176011)(486006)(86362001)(186003)(476003)(70206006)(70586007)(54906003)(36756003)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3928; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c66fcca4-3560-4721-6dff-08d7096a7108
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CH2PR12MB3928; 
X-MS-TrafficTypeDiagnostic: CH2PR12MB3928:
X-Microsoft-Antispam-PRVS: <CH2PR12MB3928F3A67CF12CF670E290F382CF0@CH2PR12MB3928.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: k2o1BpC7hg7pywHpPk/SI7yaeCHyuSgSmQz0A2jaxakjFB5NDnR7xjBX/3hAEBBWaDzU6h3drbgc6XastdXiF8gjT7k9j5rlKBimTdhI50kcMv1fXKAN3Ss9Z1APfGz7O3YmGDD9DeuTRV4SHYNypz77tEP46B8DTTZH0oMX5te66GSFe5NAeGtCVPDFY5BDHw6NcomHNrCsaHfQRv2oLzOobMhJJX02qgVBvoeScINvqIukueeVmuKd71+Scq7WPgKOjYrtuynmrh6mAXqCLTbjIm83cY6qS85QAJJdEgV5kpT+Ubo3s4qg3oMrIXPXz6iIDJWcAz+dJD5+P3h67QofR3wSRheZyxP1/xQhZY4Ox9goQAMJlDUFOpk0s4l7Fr40f9QZAuO84FW1kUvY2lJXwfvZuh85kEsfHAXn76M=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:46.1904 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c66fcca4-3560-4721-6dff-08d7096a7108
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3928
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5BdAbYa5cwN6tbKscrCEka2354OlKbWpMBH0kbZOVE=;
 b=XbFFcOpC/SUq7jK4nQd79USla77Gb4CjYK4zvrGDh0BnWjNb502bi233wx36SIIJ/AWDLqetEg+TjULauH7W0GDwY0FV3TMDxl5jfaTmfw+Y9DYROcLZ64nYp0R5L5xj/ahyfkFWCh//BkTOF8d25+/5IwGTSovPmf6wr9ERXvI=
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
Cc: Leo Li <sunpeng.li@amd.com>, Joshua Aberback <Joshua.Aberback@amd.com>,
 Chris Park <Chris.Park@amd.com>, Nikola Cornij <nikola.cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTmlrb2xhIENvcm5paiA8bmlrb2xhLmNvcm5pakBhbWQuY29tPgoKW3doeV0KQXMgYSBm
YWlsLXNhZmUsIGluIGNhc2UgJ3NldCBGRUNfUkVBRFknIERQQ0Qgd3JpdGUgZmFpbHMsIGEgSFcg
c2hhZG93CnJlZ2lzdGVyIHNob3VsZCBiZSBjbGVhcmVkIGFuZCB0aGUgaW50ZXJuYWwgRkVDIHN0
YXQgc2hvdWxkIGJlIHNldCB0bwonbm90IHJlYWR5Jy4gVGhpcyBpcyB0byBtYWtlIHN1cmUgSFcg
c2V0dGluZ3Mgd2lsbCBiZSBjb25zaXN0ZW50IHdpdGgKRkVDX1JFQURZIHN0YXRlIG9uIHRoZSBS
WC4KClNpZ25lZC1vZmYtYnk6IE5pa29sYSBDb3JuaWogPG5pa29sYS5jb3JuaWpAYW1kLmNvbT4K
UmV2aWV3ZWQtYnk6IEpvc2h1YSBBYmVyYmFjayA8Sm9zaHVhLkFiZXJiYWNrQGFtZC5jb20+CkFj
a2VkLWJ5OiBDaHJpcyBQYXJrIDxDaHJpcy5QYXJrQGFtZC5jb20+CkFja2VkLWJ5OiBMZW8gTGkg
PHN1bnBlbmcubGlAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Y29yZS9kY19saW5rX2RwLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlu
a19kcC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kcC5j
CmluZGV4IDVjOGUzMzE4MjM5Yy4uYjUxMmZlY2FlMDYxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2RwLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kcC5jCkBAIC0zMTc0LDYgKzMxNzQsOCBA
QCB2b2lkIGRwX3NldF9mZWNfcmVhZHkoc3RydWN0IGRjX2xpbmsgKmxpbmssIGJvb2wgcmVhZHkp
CiAJCQkJbGlua19lbmMtPmZ1bmNzLT5mZWNfc2V0X3JlYWR5KGxpbmtfZW5jLCB0cnVlKTsKIAkJ
CQlsaW5rLT5mZWNfc3RhdGUgPSBkY19saW5rX2ZlY19yZWFkeTsKIAkJCX0gZWxzZSB7CisJCQkJ
bGluay0+bGlua19lbmMtPmZ1bmNzLT5mZWNfc2V0X3JlYWR5KGxpbmstPmxpbmtfZW5jLCBmYWxz
ZSk7CisJCQkJbGluay0+ZmVjX3N0YXRlID0gZGNfbGlua19mZWNfbm90X3JlYWR5OwogCQkJCWRt
X2Vycm9yKCJkcGNkIHdyaXRlIGZhaWxlZCB0byBzZXQgZmVjX3JlYWR5Iik7CiAJCQl9CiAJCX0g
ZWxzZSBpZiAobGluay0+ZmVjX3N0YXRlID09IGRjX2xpbmtfZmVjX3JlYWR5KSB7Ci0tIAoyLjIy
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
