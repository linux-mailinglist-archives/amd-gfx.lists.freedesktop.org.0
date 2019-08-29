Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D827A20C8
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 18:24:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E386E139;
	Thu, 29 Aug 2019 16:24:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730049.outbound.protection.outlook.com [40.107.73.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07686E139
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 16:24:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N75n+uZDHy61i3r9qerGeaC7ULIha+2K161Y1v0ZsJDL3txtQjCdLrpecEMUlZE45JEURu9ILkvfHJ/uHEUOlhNb/TnHt3irs/3nr5GxCP9SFbg4Tx8O14U6A3a2sLzYWu9BwqSCuMqRHyRkqykRP2jqAP7KXB23W4IUk+El0JEyawmjDd2NBjnJ0xbErpLwoJnzgVv6kkZiTk5krSfAFPd7jxr9/sDfY/vzNWS2F4Yhu9Kb/M83pG0uvAVBcp3kgLrve8XkM1lhRL6OQj+8vOp31zsFffwUtROK9L/DcP3gACjK9sZbMwT0tChB6JwE2vJjoUbGos282FjCBfZeJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xV/p5jSkyc84Mpka7SPzhjBhzLwOuSfO3U7IDbX2yng=;
 b=QaN6/5evPY5dOhG1H9N5lh76zE/iAa6/TVlpJJf2z8LG+UT5+/6l919E1VLvu+Rd/XwT/nWfR4UluUR/rGgIkfleMHZH8anyCE6oSeO94QTPRsa+eFxRO7zUGsIF9mwaL0HsyVP97332/tvpvC0U9iu6SK2Ec5ngcHYGp+4ZAmp7TAhvnLtpMXaFa2lAF0siF4Nxjgav3m2F6AjqvsKFyAw57FIIxkor46kfzJaUpJYfXuRa8/aWb0N/wdIbqe9g0QGGy+3zsby35ioO1BdH7McDuZ5dVDeBEtGG85Hs8b7ekX5aFlppyJGCf/qKWtSyszbbkk9DESEgsYDAOm1Ryg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN4PR12CA0012.namprd12.prod.outlook.com (2603:10b6:403:2::22)
 by DM5PR12MB1274.namprd12.prod.outlook.com (2603:10b6:3:78::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.18; Thu, 29 Aug
 2019 16:24:06 +0000
Received: from BY2NAM03FT007.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::201) by BN4PR12CA0012.outlook.office365.com
 (2603:10b6:403:2::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.14 via Frontend
 Transport; Thu, 29 Aug 2019 16:24:06 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT007.mail.protection.outlook.com (10.152.84.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Thu, 29 Aug 2019 16:24:05 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 29 Aug 2019
 11:23:47 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 15/20] drm/amd/display: Initialize HDCP work queue
Date: Thu, 29 Aug 2019 12:22:48 -0400
Message-ID: <20190829162253.10195-16-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190829162253.10195-1-Bhawanpreet.Lakha@amd.com>
References: <20190829162253.10195-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(376002)(136003)(2980300002)(428003)(199004)(189003)(6916009)(53936002)(8936002)(2906002)(5660300002)(478600001)(16586007)(316002)(14444005)(86362001)(186003)(356004)(336012)(53416004)(36756003)(8676002)(426003)(446003)(26005)(76176011)(11346002)(4326008)(2351001)(51416003)(1076003)(2616005)(476003)(126002)(7696005)(486006)(48376002)(305945005)(50226002)(47776003)(70586007)(50466002)(70206006)(81166006)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1274; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 864b672c-fad2-463d-888b-08d72c9d4ffe
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM5PR12MB1274; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1274:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1274AAD16A35CA3A0DD57FDDF9A20@DM5PR12MB1274.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-Forefront-PRVS: 0144B30E41
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: CV7MiY4X+QWLZnidYqGGWgK05mt/EB3OpJCcDAATVhpIwJjo38gU59QCeOe5PPATGw0KUMc+k28GrqAeliQPhrv/YGJMWxk5kPZhBa+rNRB03fBLHB8txwj1Rn0huJfDWoOlrMqH3w9LX6jnwoFeFsrOxc3ufF0hksfs8sGcdw7Ai8sioZ8YUqsL1qSImFM7rMhd7rmLnWfaK8fuu5TrWLvxMzhFhOTnTnG2Tu0mMVD/lsIZ0a5l2/v8z6K3j96BL8vVESnmdGCZM5Ls+Z+EnlWOQ1NOP0X9zwo22Sj0Km2PApj6/eNAWocwdRL7T9+2+JGO4lv5wZnVu2NLrJSDYXgPl/pP9S9J8i+6+2AZ/NEpLRnFFh0XoAYewhI8rfttnJD3cuM2Glb7YebBVqs4g2Qa//gIutjQ0p6sA8+jb3Y=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2019 16:24:05.5599 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 864b672c-fad2-463d-888b-08d72c9d4ffe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1274
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xV/p5jSkyc84Mpka7SPzhjBhzLwOuSfO3U7IDbX2yng=;
 b=cMYFVtpZXOnNSAQrxQfYgzQ+v6T61FjHMGtwr84tDWhzZOOsYKbSKhAE+r0TykBqw2MwGhiAnEwYVn0XV7hxUCw3t0F0LUtEUU+t+FxikKaNCJuhjMNFi3F8XrOI/VvHNups2rBgmZKBvctLkLtT+Ns1yEWr1rp0OgYWkRxh5AI=
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

W1doeV0KV2UgbmVlZCB0aGlzIHRvIGVuYWJsZSBIRENQIG9uIGxpbnV4LCBhcyB3ZSBuZWVkIGV2
ZW50cyB0byBpbnRlcmFjdAp3aXRoIHRoZSBoZGNwIG1vZHVsZQoKW0hvd10KQWRkIHdvcmsgcXVl
dWUgdG8gZGlzcGxheSBtYW5hZ2VyIGFuZCBoYW5kbGUgdGhlIGNyZWF0aW9uIGFuZCBkZXN0cnVj
dGlvbgpvZiB0aGUgcXVldWUKClNpZ25lZC1vZmYtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3
YW5wcmVldC5MYWtoYUBhbWQuY29tPgotLS0KIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG0uYyB8IDMwICsrKysrKysrKysrKysrKysrKysKIC4uLi9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uaCB8ICAzICsrCiAyIGZpbGVzIGNoYW5nZWQs
IDMzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG0uYwppbmRleCAxNjBhZjBjOGI0MGMuLmJhYzljZjViZTQ3MyAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0u
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5j
CkBAIC0zNyw2ICszNyw5IEBACiAjaW5jbHVkZSAiYW1kZ3B1X3Vjb2RlLmgiCiAjaW5jbHVkZSAi
YXRvbS5oIgogI2luY2x1ZGUgImFtZGdwdV9kbS5oIgorI2lmZGVmIENPTkZJR19EUk1fQU1EX0RD
X0hEQ1AKKyNpbmNsdWRlICJhbWRncHVfZG1faGRjcC5oIgorI2VuZGlmCiAjaW5jbHVkZSAiYW1k
Z3B1X3BtLmgiCiAKICNpbmNsdWRlICJhbWRfc2hhcmVkLmgiCkBAIC02NDQsMTEgKzY0NywxOCBA
QCB2b2lkIGFtZGdwdV9kbV9hdWRpb19lbGRfbm90aWZ5KHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2LCBpbnQgcGluKQogc3RhdGljIGludCBhbWRncHVfZG1faW5pdChzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldikKIHsKIAlzdHJ1Y3QgZGNfaW5pdF9kYXRhIGluaXRfZGF0YTsKKyNpZmRlZiBD
T05GSUdfRFJNX0FNRF9EQ19IRENQCisJc3RydWN0IGRjX2NhbGxiYWNrX2luaXQgaW5pdF9wYXJh
bXM7CisjZW5kaWYKKwogCWFkZXYtPmRtLmRkZXYgPSBhZGV2LT5kZGV2OwogCWFkZXYtPmRtLmFk
ZXYgPSBhZGV2OwogCiAJLyogWmVybyBhbGwgdGhlIGZpZWxkcyAqLwogCW1lbXNldCgmaW5pdF9k
YXRhLCAwLCBzaXplb2YoaW5pdF9kYXRhKSk7CisjaWZkZWYgQ09ORklHX0RSTV9BTURfRENfSERD
UAorCW1lbXNldCgmaW5pdF9wYXJhbXMsIDAsIHNpemVvZihpbml0X3BhcmFtcykpOworI2VuZGlm
CiAKIAltdXRleF9pbml0KCZhZGV2LT5kbS5kY19sb2NrKTsKIAltdXRleF9pbml0KCZhZGV2LT5k
bS5hdWRpb19sb2NrKTsKQEAgLTcyMSw2ICs3MzEsMTYgQEAgc3RhdGljIGludCBhbWRncHVfZG1f
aW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAogCWFtZGdwdV9kbV9pbml0X2NvbG9y
X21vZCgpOwogCisjaWZkZWYgQ09ORklHX0RSTV9BTURfRENfSERDUAorCWFkZXYtPmRtLmhkY3Bf
d29ya3F1ZXVlID0gaGRjcF9jcmVhdGVfd29ya3F1ZXVlKCZhZGV2LT5wc3AsICZpbml0X3BhcmFt
cy5jcF9wc3AsIGFkZXYtPmRtLmRjKTsKKworCWlmICghYWRldi0+ZG0uaGRjcF93b3JrcXVldWUp
CisJCURSTV9FUlJPUigiYW1kZ3B1OiBmYWlsZWQgdG8gaW5pdGlhbGl6ZSBoZGNwX3dvcmtxdWV1
ZS5cbiIpOworCWVsc2UKKwkJRFJNX0RFQlVHX0RSSVZFUigiYW1kZ3B1OiBoZGNwX3dvcmtxdWV1
ZSBpbml0IGRvbmUgJXAuXG4iLCBhZGV2LT5kbS5oZGNwX3dvcmtxdWV1ZSk7CisKKwlkY19pbml0
X2NhbGxiYWNrcyhhZGV2LT5kbS5kYywgJmluaXRfcGFyYW1zKTsKKyNlbmRpZgogCWlmIChhbWRn
cHVfZG1faW5pdGlhbGl6ZV9kcm1fZGV2aWNlKGFkZXYpKSB7CiAJCURSTV9FUlJPUigKIAkJImFt
ZGdwdTogZmFpbGVkIHRvIGluaXRpYWxpemUgc3cgZm9yIGRpc3BsYXkgc3VwcG9ydC5cbiIpOwpA
QCAtNzYyLDYgKzc4MiwxNiBAQCBzdGF0aWMgdm9pZCBhbWRncHVfZG1fZmluaShzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldikKIAogCWFtZGdwdV9kbV9kZXN0cm95X2RybV9kZXZpY2UoJmFkZXYt
PmRtKTsKIAorI2lmZGVmIENPTkZJR19EUk1fQU1EX0RDX0hEQ1AKKwlpZiAoYWRldi0+ZG0uaGRj
cF93b3JrcXVldWUpIHsKKwkJaGRjcF9kZXN0cm95KGFkZXYtPmRtLmhkY3Bfd29ya3F1ZXVlKTsK
KwkJYWRldi0+ZG0uaGRjcF93b3JrcXVldWUgPSBOVUxMOworCX0KKworCWlmIChhZGV2LT5kbS5k
YykKKwkJZGNfZGVpbml0X2NhbGxiYWNrcyhhZGV2LT5kbS5kYyk7CisjZW5kaWYKKwogCS8qIERD
IERlc3Ryb3kgVE9ETzogUmVwbGFjZSBkZXN0cm95IERBTCAqLwogCWlmIChhZGV2LT5kbS5kYykK
IAkJZGNfZGVzdHJveSgmYWRldi0+ZG0uZGMpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmgKaW5kZXggY2JkNjYwOGY1OGU2Li43YTM0ZWNh
MTJkYWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG0uaApAQCAtMjIyLDYgKzIyMiw5IEBAIHN0cnVjdCBhbWRncHVfZGlzcGxheV9tYW5h
Z2VyIHsKIAlzdHJ1Y3QgYW1kZ3B1X2RtX2JhY2tsaWdodF9jYXBzIGJhY2tsaWdodF9jYXBzOwog
CiAJc3RydWN0IG1vZF9mcmVlc3luYyAqZnJlZXN5bmNfbW9kdWxlOworI2lmZGVmIENPTkZJR19E
Uk1fQU1EX0RDX0hEQ1AKKwlzdHJ1Y3QgaGRjcF93b3JrcXVldWUgKmhkY3Bfd29ya3F1ZXVlOwor
I2VuZGlmCiAKIAlzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqY2FjaGVkX3N0YXRlOwogCi0tIAoy
LjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
