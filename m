Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF47AA20D0
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 18:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52ACA6E169;
	Thu, 29 Aug 2019 16:24:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740040.outbound.protection.outlook.com [40.107.74.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85DB26E141
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 16:24:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LynoJzpEMJyD0mNC/mATKDh8mvHTJ9Qj+Kp1I/blX8ZhCWCF/d6XJIuZO9rDchXwwakSEz3UyswBBaKYVwuQBRjcle8LPfAuQrGavsgx4xJxvQI45LVuSZZDQ1SdAluSJ66yHycYgnJ9SHx/NQZrnWojMfIgRIXDd8sIQr41jNTDyIS2k/lSun7tpHQTWDEFyOlhwbxn4TqprrupXz1ylfbzzQPs1bM71El0K74qw8mFB93J4DtPpJU4S4CTRF68+0yuU7QjiFYuX50+OWcHQCR9E2udEFh2Fph1OmS8Len69yj+x3zRErBkVpJ7iCBJxr3l8whu+Xlqmc+hv8Z3pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KYJDEBsEYORd09f5qWAI9KMZoJm1zITMppWUXLDiLdY=;
 b=Pz2TkqqZnuL/ADWA/CIe8/v9SNFNpQ/yD0FoBCUOU/g/yIERRA/EEScqcfQtJUjGEp18TbfEodfeiPYAMtR8osQ+TpA3GZ0H5th4JQjRDF2u2OhRg/AsHkyN4//KUuQmBao2cd1fY/CIe1Er12dqJPr/ytNMIeJBs64NiodCPARlTJpkImut5gW763CwlTIaiec98YM6aJLovG4oUKzzNB/ipMJ8gThWXzz5lesC7Yh/6ZABePx84KxrbyQ6QjDvDgjphGS5pfPjIhN4dV6EO4nD/TKuY97GK7AL8hC1eXfsFpwwOpDxN7OMEvpPgLEs6iM1/rIYlXTMFDBNDtkmCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR1201CA0015.namprd12.prod.outlook.com
 (2603:10b6:910:16::25) by BN6PR12MB1265.namprd12.prod.outlook.com
 (2603:10b6:404:1d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.19; Thu, 29 Aug
 2019 16:24:09 +0000
Received: from BY2NAM03FT037.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::204) by CY4PR1201CA0015.outlook.office365.com
 (2603:10b6:910:16::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.18 via Frontend
 Transport; Thu, 29 Aug 2019 16:24:08 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT037.mail.protection.outlook.com (10.152.84.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Thu, 29 Aug 2019 16:24:08 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 29 Aug 2019
 11:23:48 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 17/20] drm/amd/display: handle DP cpirq
Date: Thu, 29 Aug 2019 12:22:50 -0400
Message-ID: <20190829162253.10195-18-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190829162253.10195-1-Bhawanpreet.Lakha@amd.com>
References: <20190829162253.10195-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(396003)(2980300002)(428003)(199004)(189003)(6916009)(4326008)(126002)(5660300002)(2351001)(426003)(81156014)(48376002)(81166006)(11346002)(16586007)(36756003)(305945005)(50466002)(8676002)(476003)(478600001)(2616005)(76176011)(336012)(2906002)(86362001)(26005)(7696005)(50226002)(53936002)(47776003)(356004)(6666004)(1076003)(486006)(53416004)(446003)(316002)(186003)(8936002)(14444005)(70586007)(70206006)(51416003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1265; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: feed4253-27f9-41b2-6c44-08d72c9d518b
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BN6PR12MB1265; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1265:
X-Microsoft-Antispam-PRVS: <BN6PR12MB126558433E81FDAC77D1C77FF9A20@BN6PR12MB1265.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 0144B30E41
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: GST0E36QvpQdF1tcu1x7ulI3+5WoLyUafjQF1zbBGbYsUypBdme6y3oZaGTQiKwgJ/mrSQ9+PtHZq58TfzUIr1j0dAu8rxogNmWaeSB9qCqdO8eu5XNPuh6rlJTyPWkPuo/khrgoLh9znhn4GAd6eVUUKzkoIWSWImkgqwqrQaxmxmvwjsoKsK5YgGF+jkneHoRCJdcEqE0TtKC80NaA3TL75ZlmGGGB8cYXdinwitis6rlWAa34NP6IYe5aoLec1kDoCTR6dtjvINXBcuggYhnZuBwgubp9OYCFxRULKPLntr0ivSG6TWfTcz3kWau6Al3UgNzoJMdsgD1EibeBAxOz1oRh03uEWn3hpyMexkXu/aQjkxfTPxbJXbCOrRhR8AdCiQGyqxnOtfbqe+gf9px2hhBCoIXH/A5EMjNdI34=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2019 16:24:08.3982 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: feed4253-27f9-41b2-6c44-08d72c9d518b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1265
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KYJDEBsEYORd09f5qWAI9KMZoJm1zITMppWUXLDiLdY=;
 b=zGC03gzVJ7zSuxZKyu41E+izXzucxv+1vsSNqIrGSCUKMil/elcd5Ku5lVWvkfp0vrFGNEJY3TUE9/WsE3UokKUBlDdGfl8g65JQWeZU1l1S4Ubd+qJwdmiRaBi3CFISc7vrs5JnuyhZxqvCcc7ZLIyju0fhnvbUYkYH/chcsik=
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

W1doeV0KVGhpcyBpcyBuZWVkZWQgZm9yIERQIGFzIERQIGNhbiBzZW5kIHVzIGluZm8gdXNpbmcg
aXJxLgoKW0hvd10KQ2hlY2sgaWYgaXJxIGJpdCBpcyBzZXQgb24gc2hvcnQgcHVsc2UgYW5kIGNh
bGwgdGhlCmZ1bmN0aW9uIHRoYXQgaGFuZGxlcyBjcGlycSBpbiBhbWRncHVfZG1faGRjcAoKU2ln
bmVkLW9mZi1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8
IDE1ICsrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwpp
bmRleCBiOTI4MWU3Nzc1MmYuLjhjYjQ4Y2YyNTdhNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCkBAIC0xNjE2LDYgKzE2MTYsMTIg
QEAgc3RhdGljIHZvaWQgaGFuZGxlX2hwZF9yeF9pcnEodm9pZCAqcGFyYW0pCiAJc3RydWN0IGRj
X2xpbmsgKmRjX2xpbmsgPSBhY29ubmVjdG9yLT5kY19saW5rOwogCWJvb2wgaXNfbXN0X3Jvb3Rf
Y29ubmVjdG9yID0gYWNvbm5lY3Rvci0+bXN0X21nci5tc3Rfc3RhdGU7CiAJZW51bSBkY19jb25u
ZWN0aW9uX3R5cGUgbmV3X2Nvbm5lY3Rpb25fdHlwZSA9IGRjX2Nvbm5lY3Rpb25fbm9uZTsKKyNp
ZmRlZiBDT05GSUdfRFJNX0FNRF9EQ19IRENQCisJdW5pb24gaHBkX2lycV9kYXRhIGhwZF9pcnFf
ZGF0YTsKKwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IGRldi0+ZGV2X3ByaXZhdGU7CisK
KwltZW1zZXQoJmhwZF9pcnFfZGF0YSwgMCwgc2l6ZW9mKGhwZF9pcnFfZGF0YSkpOworI2VuZGlm
CiAKIAkvKgogCSAqIFRPRE86VGVtcG9yYXJ5IGFkZCBtdXRleCB0byBwcm90ZWN0IGhwZCBpbnRl
cnJ1cHQgbm90IGhhdmUgYSBncGlvCkBAIC0xNjI1LDcgKzE2MzEsMTIgQEAgc3RhdGljIHZvaWQg
aGFuZGxlX2hwZF9yeF9pcnEodm9pZCAqcGFyYW0pCiAJaWYgKGRjX2xpbmstPnR5cGUgIT0gZGNf
Y29ubmVjdGlvbl9tc3RfYnJhbmNoKQogCQltdXRleF9sb2NrKCZhY29ubmVjdG9yLT5ocGRfbG9j
ayk7CiAKKworI2lmZGVmIENPTkZJR19EUk1fQU1EX0RDX0hEQ1AKKwlpZiAoZGNfbGlua19oYW5k
bGVfaHBkX3J4X2lycShkY19saW5rLCAmaHBkX2lycV9kYXRhLCBOVUxMKSAmJgorI2Vsc2UKIAlp
ZiAoZGNfbGlua19oYW5kbGVfaHBkX3J4X2lycShkY19saW5rLCBOVUxMLCBOVUxMKSAmJgorI2Vu
ZGlmCiAJCQkhaXNfbXN0X3Jvb3RfY29ubmVjdG9yKSB7CiAJCS8qIERvd25zdHJlYW0gUG9ydCBz
dGF0dXMgY2hhbmdlZC4gKi8KIAkJaWYgKCFkY19saW5rX2RldGVjdF9zaW5rKGRjX2xpbmssICZu
ZXdfY29ubmVjdGlvbl90eXBlKSkKQEAgLTE2NjAsNiArMTY3MSwxMCBAQCBzdGF0aWMgdm9pZCBo
YW5kbGVfaHBkX3J4X2lycSh2b2lkICpwYXJhbSkKIAkJCWRybV9rbXNfaGVscGVyX2hvdHBsdWdf
ZXZlbnQoZGV2KTsKIAkJfQogCX0KKyNpZmRlZiBDT05GSUdfRFJNX0FNRF9EQ19IRENQCisJaWYg
KGhwZF9pcnFfZGF0YS5ieXRlcy5kZXZpY2Vfc2VydmljZV9pcnEuYml0cy5DUF9JUlEpCisJCWhk
Y3BfaGFuZGxlX2NwaXJxKGFkZXYtPmRtLmhkY3Bfd29ya3F1ZXVlLCAgYWNvbm5lY3Rvci0+YmFz
ZS5pbmRleCk7CisjZW5kaWYKIAlpZiAoKGRjX2xpbmstPmN1cl9saW5rX3NldHRpbmdzLmxhbmVf
Y291bnQgIT0gTEFORV9DT1VOVF9VTktOT1dOKSB8fAogCSAgICAoZGNfbGluay0+dHlwZSA9PSBk
Y19jb25uZWN0aW9uX21zdF9icmFuY2gpKQogCQlkbV9oYW5kbGVfaHBkX3J4X2lycShhY29ubmVj
dG9yKTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
