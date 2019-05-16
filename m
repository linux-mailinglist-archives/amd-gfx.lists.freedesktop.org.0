Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC9E206B5
	for <lists+amd-gfx@lfdr.de>; Thu, 16 May 2019 14:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B8D89170;
	Thu, 16 May 2019 12:11:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700070.outbound.protection.outlook.com [40.107.70.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D71A89170
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 May 2019 12:10:59 +0000 (UTC)
Received: from DM5PR12CA0061.namprd12.prod.outlook.com (2603:10b6:3:103::23)
 by DM6PR12MB2666.namprd12.prod.outlook.com (2603:10b6:5:4a::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1878.24; Thu, 16 May
 2019 12:10:57 +0000
Received: from CO1NAM03FT003.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::202) by DM5PR12CA0061.outlook.office365.com
 (2603:10b6:3:103::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1900.16 via Frontend
 Transport; Thu, 16 May 2019 12:10:57 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT003.mail.protection.outlook.com (10.152.80.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1900.16 via Frontend Transport; Thu, 16 May 2019 12:10:56 +0000
Received: from yttao-code-machine.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Thu, 16 May 2019 07:10:55 -0500
From: Yintian Tao <yttao@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: don't read DF register for SRIOV
Date: Thu, 16 May 2019 20:10:51 +0800
Message-ID: <1558008651-21099-1-git-send-email-yttao@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(346002)(136003)(396003)(2980300002)(428003)(199004)(189003)(6666004)(305945005)(356004)(8936002)(26005)(50466002)(6916009)(16586007)(77096007)(186003)(47776003)(72206003)(478600001)(14444005)(51416003)(81166006)(81156014)(8676002)(53416004)(316002)(50226002)(54906003)(7696005)(68736007)(70206006)(70586007)(5660300002)(4744005)(336012)(48376002)(2351001)(126002)(4326008)(2616005)(486006)(36756003)(2906002)(476003)(426003)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2666; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f34e7ef-6e7f-47fd-5292-08d6d9f78d63
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:DM6PR12MB2666; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2666:
X-Microsoft-Antispam-PRVS: <DM6PR12MB266699F647E047DE1E19397AE50A0@DM6PR12MB2666.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-Forefront-PRVS: 0039C6E5C5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: laWBy5vGaP7ZDviVkaELmdd+tuzIYva63WpQgC5FI22u2wv/KvanC+9LS1p3c2yXiLqNxigJyDpxKfG0kqgLmwU1n7j6I14Mwk3ooD4LowbQEQeqxU9SKkQbvSYPwYPskPNdtn7J6lmiJ+3t7M7AvqhxUDvWmXFwxgm426tQfDGorohprQuvt9GlVH0andR0e+rKbFRY5WocYsP3+9NAXfpYsz0xWa7w1w5E7uoETAgki/j8hzVzE7HlgH3RuEmMIA8sGCAHGKK2Q0F834L5z/PH1SgNbfUq9vTt/S6ILuvb7NHndlX3gdRsDC3+NOMKXzrITmjt2Z1gSW7HODwkCDzQVb41/EQuS58Vzqo1wczcLsWm86T2Cme6LYPcGs725p1jKcopsXe4ilDA/WvDB+lnVXEGoEmoPwBqPicd4J0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2019 12:10:56.9708 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f34e7ef-6e7f-47fd-5292-08d6d9f78d63
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2666
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5gxmQvkG7bCwipLr7n1HpYq624Oyfjg4ztdiqRX/70=;
 b=I6TlMhCJF2tH0yzSYiQmLkh3+4DTr63PMhVbvvk5rzlGFiUbrpVzNrTTFt+PnMPj07UNhvhetcFGxK/BkFXh1UQgiIv8pi7zdhrPa1frnbGZw7F6AY+r+PZGu1eOPY2TxAmKzTgRXadsU1Hu/76Bcrv/a9D/a3aFOtQsb/atc7k=
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
Cc: Monk Liu <Monk.Liu@amd.com>, Yintian Tao <yttao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VW5kZXIgU1JJT1YsIHJlYWRpbmcgREYgcmVnaXN0ZXIgaGFzIGNoYW5jZSB0byBsZWFkIHRvCkFF
UiBlcnJvciBpbiBob3N0IHNpZGUsIGp1c3Qgc2tpcCByZWFkaW5nIGl0LgoKU2lnbmVkLW9mZi1i
eTogTW9uayBMaXUgPE1vbmsuTGl1QGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFlpbnRpYW4gVGFv
IDx5dHRhb0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8w
LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwppbmRleCBhNDE3NzYzLi5iNWJmOWVk
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKQEAgLTgzNyw3ICs4MzcsNyBA
QCBzdGF0aWMgaW50IGdtY192OV8wX21jX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
CiAKIAlpZiAoYW1kZ3B1X2VtdV9tb2RlICE9IDEpCiAJCWFkZXYtPmdtYy52cmFtX3dpZHRoID0g
YW1kZ3B1X2F0b21maXJtd2FyZV9nZXRfdnJhbV93aWR0aChhZGV2KTsKLQlpZiAoIWFkZXYtPmdt
Yy52cmFtX3dpZHRoKSB7CisJaWYgKCFhZGV2LT5nbWMudnJhbV93aWR0aCAmJiAhYW1kZ3B1X3Ny
aW92X3ZmKGFkZXYpKSB7CiAJCS8qIGhibSBtZW1vcnkgY2hhbm5lbCBzaXplICovCiAJCWlmIChh
ZGV2LT5mbGFncyAmIEFNRF9JU19BUFUpCiAJCQljaGFuc2l6ZSA9IDY0OwotLSAKMi43LjQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
