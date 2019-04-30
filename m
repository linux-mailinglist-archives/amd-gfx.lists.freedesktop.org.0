Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B5810183
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 23:10:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8722389262;
	Tue, 30 Apr 2019 21:10:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810047.outbound.protection.outlook.com [40.107.81.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4648089254
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 21:10:04 +0000 (UTC)
Received: from DM3PR12CA0106.namprd12.prod.outlook.com (2603:10b6:0:55::26) by
 SN1PR12MB0656.namprd12.prod.outlook.com (2a01:111:e400:c428::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1835.15; Tue, 30 Apr
 2019 21:10:02 +0000
Received: from BY2NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::200) by DM3PR12CA0106.outlook.office365.com
 (2603:10b6:0:55::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Tue, 30 Apr 2019 21:10:02 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT009.mail.protection.outlook.com (10.152.84.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1835.14 via Frontend Transport; Tue, 30 Apr 2019 21:10:02 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Apr 2019
 16:09:51 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 12/20] drm/amd/display: Define Byte 14 on AVI InfoFrame
Date: Tue, 30 Apr 2019 17:09:21 -0400
Message-ID: <20190430210938.32335-24-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
References: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(376002)(396003)(346002)(2980300002)(428003)(199004)(189003)(476003)(8676002)(1076003)(11346002)(6666004)(356004)(126002)(486006)(7696005)(70206006)(70586007)(5660300002)(76176011)(47776003)(14444005)(53416004)(426003)(446003)(478600001)(2616005)(2906002)(4326008)(72206003)(68736007)(86362001)(53936002)(8936002)(51416003)(50226002)(81156014)(36756003)(81166006)(50466002)(6916009)(316002)(305945005)(26005)(186003)(77096007)(336012)(2351001)(48376002)(16586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR12MB0656; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7bc48020-006b-4de6-6e7d-08d6cdb035fc
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:SN1PR12MB0656; 
X-MS-TrafficTypeDiagnostic: SN1PR12MB0656:
X-Microsoft-Antispam-PRVS: <SN1PR12MB06567D53FFF4104E05224CBBF93A0@SN1PR12MB0656.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-Forefront-PRVS: 00235A1EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: LlJ6ZIKX7/La2ikkfqlfy8Wugv81YSyYcGSY9AlXrzbW/6mUbFOAi+BbJhnOgIMhw24j1RRLI2Bp6DF05BM6SN3tv0Vf5MlGSZV5+Yz+jVfhOYG+jW82JjU2P1k1GO7vf0iAV1g2AMLBvG7kf2levH/onSX9/8bnD2iHIk8XOkkjkwCZB61dhj+i7VTylt8QqVfwlfsypU/NLOfasnWLgsqtUN7alzOrxuOzLdyVqpZDVysmN25xYoGBhaP8aMW/0jodMs6KJvBDadTCmL6TMCbXTysIUU1G6F0u5qoA76bzK0w83KQpmYrUBtPgWlHrv189/4aDzWAfE2AjcvqKQUlLSCiWlXTb3G+mid/n8GQ/OvSxIybJK7NyeLWWgJee0yTTZ9234oZ2Ddd6VRLdH6wiZf9J0aTEZvKbBRCwAeE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2019 21:10:02.1316 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc48020-006b-4de6-6e7d-08d6cdb035fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB0656
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CsycqKhSdfwJfUw/B2nU2PdrFcNNn7Ple3Xc+iYc0jM=;
 b=ivyENoegDyuFedYrcSZ/MjJThnoV/n3Eoh3WqQWPu2kW3JgZOKchCVhSq0Blj1vXJvYEqpXf0YrLi0lqzUjvup5UUpniBRp8bdEcN2nsZc37KhvggDVw7mMvWKYkn0jjS1c2rwGvHXFgTRRgBnZiJmlz1rG9oP8Akqf+Iej4tQI=
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

RnJvbTogQ2hyaXMgUGFyayA8Q2hyaXMuUGFya0BhbWQuY29tPgoKW1doeV0KUGFydCBvZiBIRE1J
IDIuMSByZXF1aXJlcyBBVkkgSW5mb0ZyYW1lIHZlcnNpb24gdXBkYXRlCmZyb20gY3VycmVudCBW
MiB0byBWNCBmb3IgbmV3IGNvbG9yaW1ldHJ5LgoKW0hvd10KRGVmaW5lIFY0IEFWSSBJbmZvRnJh
bWUgQUNFMC1BQ0UzIGJpdC4KCkNoYW5nZS1JZDogSWU4NDAxMzZlNjYxZWE3MmFjOTBiZTY4OTRl
MTljNDRlMzc2ZDQ2NzkKU2lnbmVkLW9mZi1ieTogQ2hyaXMgUGFyayA8Q2hyaXMuUGFya0BhbWQu
Y29tPgpSZXZpZXdlZC1ieTogTmV2ZW5rbyBTdHVwYXIgPE5ldmVua28uU3R1cGFyQGFtZC5jb20+
CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQgTGFraGFAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19yZXNvdXJjZS5jICAg
IHwgNyArKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvaW5jbHVkZS9zZXRfbW9k
ZV90eXBlcy5oIHwgNSArKysrLQogMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2NvcmUvZGNfcmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3Jl
L2RjX3Jlc291cmNlLmMKaW5kZXggOWVmNDE3ZWI2OTdkLi4yMDk2NjMyNTg1MmYgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3Jlc291cmNlLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfcmVzb3VyY2UuYwpAQCAt
MjM4NCw2ICsyMzg0LDEzIEBAIHN0YXRpYyB2b2lkIHNldF9hdmlfaW5mb19mcmFtZSgKIAloZG1p
X2luZm8uYml0cy5iYXJfcmlnaHQgPSAoc3RyZWFtLT50aW1pbmcuaF90b3RhbAogCQkJLSBzdHJl
YW0tPnRpbWluZy5oX2JvcmRlcl9yaWdodCArIDEpOwogCisgICAgLyogQWRkaXRpb25hbCBDb2xv
cmltZXRyeSBFeHRlbnNpb24KKyAgICAgKiBVc2VkIGluIGNvbmR1Y3Rpb24gd2l0aCBDMC1DMSBh
bmQgRUMwLUVDMgorICAgICAqIDAgPSBEQ0ktUDMgUkdCIChENjUpCisgICAgICogMSA9IERDSS1Q
MyBSR0IgKHRoZWF0ZXIpCisgICAgICovCisJaGRtaV9pbmZvLmJpdHMuQUNFMF9BQ0UzID0gMDsK
KwogCS8qIGNoZWNrX3N1bSAtIENhbGN1bGF0ZSBBRk1UX0FWSV9JTkZPMCB+IEFGTVRfQVZJX0lO
Rk8zICovCiAJY2hlY2tfc3VtID0gJmhkbWlfaW5mby5wYWNrZXRfcmF3X2RhdGEuc2JbMF07CiAK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9pbmNsdWRlL3NldF9tb2Rl
X3R5cGVzLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvaW5jbHVkZS9zZXRfbW9kZV90
eXBlcy5oCmluZGV4IDJiODM2ZTU4MmMwOC4uODQ1ZmVhOGEzODdmIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvaW5jbHVkZS9zZXRfbW9kZV90eXBlcy5oCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9pbmNsdWRlL3NldF9tb2RlX3R5cGVzLmgKQEAgLTg0
LDcgKzg0LDEwIEBAIHVuaW9uIGhkbWlfaW5mb19wYWNrZXQgewogCQl1aW50MTZfdCBiYXJfbGVm
dDsKIAkJdWludDE2X3QgYmFyX3JpZ2h0OwogCi0JCXVpbnQ4X3QgcmVzZXJ2ZWRbMTRdOworCQl1
aW50OF90IEYxNDBfRjE0Mzo0OworCQl1aW50OF90IEFDRTBfQUNFMzo0OworCisJCXVpbnQ4X3Qg
cmVzZXJ2ZWRbMTNdOwogCX0gYml0czsKIAogCXN0cnVjdCBpbmZvX3BhY2tldF9yYXdfZGF0YSBw
YWNrZXRfcmF3X2RhdGE7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
