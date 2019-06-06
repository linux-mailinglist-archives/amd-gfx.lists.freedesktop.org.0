Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9295037F10
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 22:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02FFD898EA;
	Thu,  6 Jun 2019 20:55:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720088.outbound.protection.outlook.com [40.107.72.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D191B898D9
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2019 20:55:25 +0000 (UTC)
Received: from CY4PR12CA0028.namprd12.prod.outlook.com (2603:10b6:903:129::14)
 by CY4PR12MB1271.namprd12.prod.outlook.com (2603:10b6:903:3d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.22; Thu, 6 Jun
 2019 20:55:24 +0000
Received: from DM3NAM03FT053.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::205) by CY4PR12CA0028.outlook.office365.com
 (2603:10b6:903:129::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1965.12 via Frontend
 Transport; Thu, 6 Jun 2019 20:55:24 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT053.mail.protection.outlook.com (10.152.83.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1965.12 via Frontend Transport; Thu, 6 Jun 2019 20:55:24 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 6 Jun 2019
 15:55:09 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 15/24] drm/amd/display: Clean up scdc_test_data struct
Date: Thu, 6 Jun 2019 16:54:52 -0400
Message-ID: <20190606205501.16505-16-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
References: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(396003)(346002)(376002)(2980300002)(428003)(199004)(189003)(6916009)(76176011)(1076003)(81166006)(8936002)(50226002)(8676002)(356004)(6666004)(86362001)(81156014)(68736007)(305945005)(7696005)(51416003)(47776003)(16586007)(48376002)(5660300002)(70206006)(70586007)(50466002)(72206003)(478600001)(53936002)(36756003)(2906002)(4326008)(11346002)(14444005)(26005)(77096007)(486006)(2616005)(186003)(476003)(126002)(446003)(316002)(336012)(2351001)(426003)(53416004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1271; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af47cd18-6257-48ac-3192-08d6eac14bee
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1271; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1271:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1271E1CFB03FC8ED7E461532F9170@CY4PR12MB1271.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:206;
X-Forefront-PRVS: 00603B7EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: kyXaHNK/rSjO3yAT1I5/edXzSK5reWadlM4zmu4DyhMxTRrcjVEonUuE+BIsaU2Hlxy0HLKwPtkqjAMdKGRNm9Mxkx6VCLdx9Mm4fHYkR7wAG7i05MSsu99RC6adDUU0oCS+PuHXcRT4PWGctwDpURwQ7yUCfXWujVCbqADRFuTGHjMIPbkK919mmEuI5szTPegdvFuYwB8U8f2vXLIubq4LzPEhYLFD+fkt/qKq+luo9fybRDJciSvEovN9NPqqRLtYp3/l4326yw5MSgQtGssdFGlvKuDv8uNapFzayVCgDA+SLqt+1DjoY83gzCoAz5V8Bv0Fc/No7JqG+VuvzaeLEpZzMz61Z6WufZtMzrDOYWPA3Fz+aNcpsfvWIhmZgbd5hC+BLFXZJVrGIYNkq+DFE9Nr6erUp+8Hp9fuNWw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2019 20:55:24.1537 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af47cd18-6257-48ac-3192-08d6eac14bee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1271
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYsgSoqsq4YEXgF4FDD91LRH9TcJoV8q6Y9UVYAPRtI=;
 b=W20xTlOByAVzcXvCJ1sSeUY38RZatuvcPZHCLAuKHWd3cZFNdjZIw/TCFePrenRXEy+sv6g/BL1+JKtSa6Um/uDwsrqfZ8jK7sPqCAybBl5H5j6YEJY7b08w1mR4qLTco9BpMQKxCEJSvlGz7J4TFE1VW4ogeNtLUoe2jF0Uciw=
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
Cc: Chris Park <Chris.Park@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXMgUGFyayA8Q2hyaXMuUGFya0BhbWQuY29tPgoKVGhlc2UgYXJlIG5vIGxvbmdl
ciBuZWVkZWQsIEFsc28gYWRkZWQgUkVTRVJWRUQgYml0cy4KClNpZ25lZC1vZmYtYnk6IENocmlz
IFBhcmsgPENocmlzLlBhcmtAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IENoYXJsZW5lIExpdSA8Q2hh
cmxlbmUuTGl1QGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJl
ZXQuTGFraGFAYW1kLmNvbT4KQWNrZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxIYXJyeS5XZW50bGFu
ZEBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xp
bmsuYyAgICAgfCAgMSAtCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19s
aW5rX2RkYy5jIHwgMTQgKysrKysrLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRp
b25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9jb3JlL2RjX2xpbmsuYwppbmRleCBjNWRjODA5ZjE3ZDYuLjlmMzJkZGZkZTQxZSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYwpAQCAtMzAwNCw0
ICszMDA0LDMgQEAgY29uc3Qgc3RydWN0IGRjX2xpbmtfc2V0dGluZ3MgKmRjX2xpbmtfZ2V0X2xp
bmtfY2FwKAogCQlyZXR1cm4gJmxpbmstPnByZWZlcnJlZF9saW5rX3NldHRpbmc7CiAJcmV0dXJu
ICZsaW5rLT52ZXJpZmllZF9saW5rX2NhcDsKIH0KLQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZGRjLmMKaW5kZXggZjAyMDkyYTBkYzc2Li45NDA2
NGQ4Y2UzMDMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3Jl
L2RjX2xpbmtfZGRjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUv
ZGNfbGlua19kZGMuYwpAQCAtOTEsNiArOTEsOCBAQCB1bmlvbiBoZG1pX3NjZGNfc3RhdHVzX2Zs
YWdzX2RhdGEgewogCQl1aW50OF90IENIMl9MT0NLRUQ6MTsKIAkJdWludDhfdCBSRVNFUlZFRDo0
OwogCQl1aW50OF90IFJFU0VSVkVEMjo4OworCQl1aW50OF90IFJFU0VSVkVEMzo4OworCiAJfSBm
aWVsZHM7CiB9OwogCkBAIC0xMDcsMTQgKzEwOSwxMCBAQCB1bmlvbiBoZG1pX3NjZGNfY2VkX2Rh
dGEgewogCQl1aW50OF90IENIMl83SElHSDo3OwogCQl1aW50OF90IENIMl9WQUxJRDoxOwogCQl1
aW50OF90IENIRUNLU1VNOjg7Ci0JfSBmaWVsZHM7Ci19OwotCi11bmlvbiBoZG1pX3NjZGNfdGVz
dF9jb25maWdfRGF0YSB7Ci0JdWludDhfdCBieXRlOwotCXN0cnVjdCB7Ci0JCXVpbnQ4X3QgVEVT
VF9SRUFEX1JFUVVFU1RfREVMQVk6NzsKLQkJdWludDhfdCBURVNUX1JFQURfUkVRVUVTVDogMTsK
KwkJdWludDhfdCBSRVNFUlZFRDo4OworCQl1aW50OF90IFJFU0VSVkVEMjo4OworCQl1aW50OF90
IFJFU0VSVkVEMzo4OworCQl1aW50OF90IFJFU0VSVkVENDo0OwogCX0gZmllbGRzOwogfTsKIAot
LSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
