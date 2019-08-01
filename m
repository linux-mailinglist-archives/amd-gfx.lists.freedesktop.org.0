Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EDE7D5A8
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 08:44:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1386E382;
	Thu,  1 Aug 2019 06:44:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750044.outbound.protection.outlook.com [40.107.75.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3747C6E382
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 06:44:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eIJ4eDRKnTcYbTCjxu30tarPUvOTExhElDUCNlOywTRBhTfEy1ZpQPOPb9Fq1/XyadYR1vMzD4xTh3UlIhUH96XqqX9ZDg6T6n91TG+MJu4bJDwWhzu/4+j8PFxxHheHrMuyBUZ4iXuV19nJAn9BRZtfShzBSHZKkF6zewCXapBWpwe3IJi4Q1GjXmMjCXpqOL7FdSoM8y8edIHE/011/acBve1bLGN7pql5rFRBr01YzJ023vInrikpadx0QiuyMJNPdfBZ+DETX0wb+8D2IdjL1G+7K1jeRSTVpauRD0SwfdZhQGENaD/BslQPKkqcC+Y1+cA9u79Cte5bUwauXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T6/zaDPrKymY/928Zir06lesak1w06YhnoRhsk88fGQ=;
 b=QIs6cT0Gqg7ejbXXjK1xvDE28H+ArEHtMBB5amEQsrJWQMbbHFUXNqOFkLtiHziExIPzLIe/irwv1/QGGF8IY4YvLhGdky/Ok5eKXCMqxoIYZexFUKy5ROF2qyksnu0z5/qbaiuivhtk0KNeIqHxbDoJQ9kimPLBxLJ85s0cd4ZworbqFTF37f7951aOVvAMimbNIPB26sjlYs3+FZpGfA6KKy3inXHSpidMA/mVBqvJaMskdy94meVgLCmHXtGhNOSmezmcwQ9pQPPf7hy8jbzeO02Cnm2wu6sjU+3BlBDRtgk41daiPHG9Yljky3skfC+XPYvtxDpXOKqWknXb4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM5PR12CA0072.namprd12.prod.outlook.com (2603:10b6:3:103::34)
 by SN1PR12MB2541.namprd12.prod.outlook.com (2603:10b6:802:2a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.15; Thu, 1 Aug
 2019 06:44:08 +0000
Received: from DM3NAM03FT006.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::205) by DM5PR12CA0072.outlook.office365.com
 (2603:10b6:3:103::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2136.16 via Frontend
 Transport; Thu, 1 Aug 2019 06:44:07 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT006.mail.protection.outlook.com (10.152.82.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Thu, 1 Aug 2019 06:44:07 +0000
Received: from taozhou1u2.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 1 Aug 2019
 01:44:06 -0500
From: Tao Zhou <tao.zhou1@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <hawking.zhang@amd.com>,
 <dennis.li@amd.com>, <guchun.chen@amd.com>, <xinhui.pan@amd.com>
Subject: [PATCH 3/6] drm/amdgpu: initialize new parameters and functions for
 amdgpu_umc structure
Date: Thu, 1 Aug 2019 14:43:08 +0800
Message-ID: <20190801064311.7307-4-tao.zhou1@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190801064311.7307-1-tao.zhou1@amd.com>
References: <20190801064311.7307-1-tao.zhou1@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(39860400002)(136003)(2980300002)(428003)(199004)(189003)(81166006)(53936002)(53416004)(336012)(356004)(2906002)(186003)(86362001)(446003)(26005)(76176011)(51416003)(4326008)(2201001)(36756003)(316002)(426003)(70586007)(6636002)(48376002)(68736007)(476003)(1076003)(7696005)(126002)(2616005)(8936002)(16586007)(5660300002)(11346002)(8676002)(478600001)(70206006)(486006)(50226002)(110136005)(305945005)(50466002)(81156014)(47776003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR12MB2541; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5996915e-50ef-4493-6ecd-08d7164ba715
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:SN1PR12MB2541; 
X-MS-TrafficTypeDiagnostic: SN1PR12MB2541:
X-Microsoft-Antispam-PRVS: <SN1PR12MB2541B98524D3A25A07DB64F3B0DE0@SN1PR12MB2541.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:590;
X-Forefront-PRVS: 01165471DB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: G8gSLbZsl4NzeOqiCQO9+10F/awrVArgdwlvnOf7WJ9cwbcM1aOJcJIwZWPIG2mGN3+vqjhpaLa18oDKKTbilmnIGzINI9GBpUN9lmTHOhgQPmbir/v/aScIcF5+2AUo72nBbvLlojiLq8wy9lk4DS2W9QCa+0NlGykYkmaH2TSrrKY8a8Ij1yo/OYMLi7KnjsDp7uLYsAdYiQqIqxy+0rKskx1Zu8N/LEzTSNUahW/gJvXQDPB/0K4LUOb4qFRuIg2ptQ8WN4QiRG5eDRfm0S2rcY3kRlShxsw5d1k+a4Otgez2HBK2TFRBmTeGkFgb9YkLjmxXHr3qPOtp8d54+bw6PYIfwtZFln8kBWXdZySNgFnjTGE7lgne4WnrMIHeEaNMvwfeYZqWdUgQoM7L2IzvVtRJMchzZgUKq4w0Heg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2019 06:44:07.6411 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5996915e-50ef-4493-6ecd-08d7164ba715
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2541
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T6/zaDPrKymY/928Zir06lesak1w06YhnoRhsk88fGQ=;
 b=dHhYKrdZdjQx+vKWw2WvAzcEcdTCR49gKqQoyQBTwTdEHRrrEtPSNBnaBrNjk+8FSYbkkdj/nCBpfc1MBwJfKPUWQO4VVAh1p1gc1gB+rkWkGUEs/4c4fWUnCij4OhgXnpPgwGP3JvNG7kFPTfUtV4HQnCg13aV4NGDbOaeYG9o=
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
Cc: Tao Zhou <tao.zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgfCAgNyArKysrKy0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS91bWNfdjZfMS5jIHwgMTAgKysrKysrKysrLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvdW1jX3Y2XzEuaCB8ICAzICsrKwogMyBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dtY192OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlf
MC5jCmluZGV4IGVlMDZjYmUyYTdlNy4uMzQ4NmI0Y2U3NzcwIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2dtY192OV8wLmMKQEAgLTYzMSw4ICs2MzEsMTEgQEAgc3RhdGljIHZvaWQgZ21jX3Y5
XzBfc2V0X3VtY19mdW5jcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHsKIAlzd2l0Y2gg
KGFkZXYtPmFzaWNfdHlwZSkgewogCWNhc2UgQ0hJUF9WRUdBMjA6Ci0JCWFkZXYtPnVtYy5tYXhf
cmFzX2Vycl9jbnRfcGVyX3F1ZXJ5ID0KLQkJCVVNQ19WNl8xX1VNQ19JTlNUQU5DRV9OVU0gKiBV
TUNfVjZfMV9DSEFOTkVMX0lOU1RBTkNFX05VTTsKKwkJYWRldi0+dW1jLm1heF9yYXNfZXJyX2Nu
dF9wZXJfcXVlcnkgPSBVTUNfVjZfMV9UT1RBTF9DSEFOTkVMX05VTTsKKwkJYWRldi0+dW1jLmNo
YW5uZWxfaW5zdF9udW0gPSBVTUNfVjZfMV9DSEFOTkVMX0lOU1RBTkNFX05VTTsKKwkJYWRldi0+
dW1jLnVtY19pbnN0X251bSA9IFVNQ19WNl8xX1VNQ19JTlNUQU5DRV9OVU07CisJCWFkZXYtPnVt
Yy5jaGFubmVsX29mZnMgPSBVTUNfVjZfMV9QRVJfQ0hBTk5FTF9PRkZTRVQ7CisJCWFkZXYtPnVt
Yy5jaGFubmVsX2lkeF90YmwgPSAmdW1jX3Y2XzFfY2hhbm5lbF9pZHhfdGJsWzBdWzBdOwogCQlh
ZGV2LT51bWMuZnVuY3MgPSAmdW1jX3Y2XzFfZnVuY3M7CiAJCWJyZWFrOwogCWRlZmF1bHQ6CmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91bWNfdjZfMS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvdW1jX3Y2XzEuYwppbmRleCAwMzVlNGZlYTQ3MmMuLjliYTAx
NWQ3ZWI1NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdW1jX3Y2XzEu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91bWNfdjZfMS5jCkBAIC00MSw3ICs0
MSw3IEBACiAvKiBvZmZzZXQgaW4gMjU2QiBibG9jayAqLwogI2RlZmluZSBPRkZTRVRfSU5fMjU2
Ql9CTE9DSyhhZGRyKQkJKChhZGRyKSAmIDB4ZmZVTEwpCiAKLXN0YXRpYyB1aW50MzJfdAorY29u
c3QgdWludDMyX3QKIAl1bWNfdjZfMV9jaGFubmVsX2lkeF90YmxbVU1DX1Y2XzFfVU1DX0lOU1RB
TkNFX05VTV1bVU1DX1Y2XzFfQ0hBTk5FTF9JTlNUQU5DRV9OVU1dID0gewogCQl7MiwgMTgsIDEx
LCAyN30sCXs0LCAyMCwgMTMsIDI5fSwKIAkJezEsIDE3LCA4LCAyNH0sCQl7NywgMjMsIDE0LCAz
MH0sCkBAIC0yMzUsNyArMjM1LDE1IEBAIHN0YXRpYyB2b2lkIHVtY192Nl8xX3F1ZXJ5X3Jhc19l
cnJvcl9hZGRyZXNzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCXVtY192Nl8xX2Rpc2Fi
bGVfdW1jX2luZGV4X21vZGUoYWRldik7CiB9CiAKK3N0YXRpYyB2b2lkIHVtY192Nl8xX3Jhc19p
bml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQoreworCit9CisKIGNvbnN0IHN0cnVjdCBh
bWRncHVfdW1jX2Z1bmNzIHVtY192Nl8xX2Z1bmNzID0geworCS5yYXNfaW5pdCA9IHVtY192Nl8x
X3Jhc19pbml0LAogCS5xdWVyeV9yYXNfZXJyb3JfY291bnQgPSB1bWNfdjZfMV9xdWVyeV9yYXNf
ZXJyb3JfY291bnQsCiAJLnF1ZXJ5X3Jhc19lcnJvcl9hZGRyZXNzID0gdW1jX3Y2XzFfcXVlcnlf
cmFzX2Vycm9yX2FkZHJlc3MsCisJLmVuYWJsZV91bWNfaW5kZXhfbW9kZSA9IHVtY192Nl8xX2Vu
YWJsZV91bWNfaW5kZXhfbW9kZSwKKwkuZGlzYWJsZV91bWNfaW5kZXhfbW9kZSA9IHVtY192Nl8x
X2Rpc2FibGVfdW1jX2luZGV4X21vZGUsCiB9OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvdW1jX3Y2XzEuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3VtY192
Nl8xLmgKaW5kZXggYmRkYWYxNGE3N2Y5Li5hZDQ1OThjMGU0OTUgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8xLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvdW1jX3Y2XzEuaApAQCAtMjQsNiArMjQsNyBAQAogI2RlZmluZSBfX1VNQ19WNl8x
X0hfXwogCiAjaW5jbHVkZSAic29jMTVfY29tbW9uLmgiCisjaW5jbHVkZSAiYW1kZ3B1LmgiCiAK
IC8qIEhCTSAgTWVtb3J5IENoYW5uZWwgV2lkdGggKi8KICNkZWZpbmUgVU1DX1Y2XzFfSEJNX01F
TU9SWV9DSEFOTkVMX1dJRFRICTEyOApAQCAtMzcsNSArMzgsNyBAQAogI2RlZmluZSBVTUNfVjZf
MV9QRVJfQ0hBTk5FTF9PRkZTRVQJCTB4ODAwCiAKIGV4dGVybiBjb25zdCBzdHJ1Y3QgYW1kZ3B1
X3VtY19mdW5jcyB1bWNfdjZfMV9mdW5jczsKK2V4dGVybiBjb25zdCB1aW50MzJfdAorCXVtY192
Nl8xX2NoYW5uZWxfaWR4X3RibFtVTUNfVjZfMV9VTUNfSU5TVEFOQ0VfTlVNXVtVTUNfVjZfMV9D
SEFOTkVMX0lOU1RBTkNFX05VTV07CiAKICNlbmRpZgotLSAKMi4xNy4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
