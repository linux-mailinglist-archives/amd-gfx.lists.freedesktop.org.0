Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 496247FD1A
	for <lists+amd-gfx@lfdr.de>; Fri,  2 Aug 2019 17:11:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E9A6EEA7;
	Fri,  2 Aug 2019 15:11:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780089.outbound.protection.outlook.com [40.107.78.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C706EEA7
 for <amd-gfx@lists.freedesktop.org>; Fri,  2 Aug 2019 15:11:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fs0Q8QXSEWdFtukqAHBUOtImpOuk5s2nGIhhMk7fJszEsKWcSlL5wDOAxHN8S0J6tsm7o51QpfaDGd2V/JspmgU/Wz4lL5Uvgp9OBi5is9926IPj6tGi38afbrD1bygUtOSe46g2UavJCYFzDoMBHqW1b1+o3/c2YMuNgsi6io+q8FSniNXzeWHfA2nPHj1cNjHKPsHVJcj+vbkRcPWGwqigKbqEbgn85ZkHgg9D4vbUR7bNCHABsqnU2peLo8d7iFm3sUQcuFFeuqMeZCJeXd4w+a3kqLdkeEax/I5lgdi+UJYMeVyb/yY1wpHqQWx+zhtMFKVBQ951qqdE5Cpnbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=god6CE+2iYH3FVYRFjUEAP8TPyOhlc9jEV8SDvAqGoc=;
 b=X3ieSn5019YBW3v+ONyRZg9JCUIcKGYmTYB9k0uyhqAs7TTwAA+PAtGKwsh/BRFWMVBbFi1HIXQb5zqXQO6JCZR4NMwCVQ3anNZfL2mUlZrF4Gj+bHdBb75SH9b2eBm50vFnsFIVTrVT/x1HrVLiVUw5dkv9TBLAj7UX+OTwVlaWj0hzbkY10Ea6QzURII34fdg1nHcwPIiiVaKN3UJ4dcpx7mtHNSApQnHQSUeEbAMfbhXraHJn3QfJDFRsRFWz/ygrygAOR37aArEU90hwS0+FWW6EEaI2QGiE1relnZOAKqQ4UA2eBgTpP6yeBHv3JJda1ceOMSMxVya9RzO3Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM6PR12CA0019.namprd12.prod.outlook.com (2603:10b6:5:1c0::32)
 by BN8PR12MB3473.namprd12.prod.outlook.com (2603:10b6:408:46::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.16; Fri, 2 Aug
 2019 15:11:55 +0000
Received: from BY2NAM03FT027.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::202) by DM6PR12CA0019.outlook.office365.com
 (2603:10b6:5:1c0::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.16 via Frontend
 Transport; Fri, 2 Aug 2019 15:11:54 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT027.mail.protection.outlook.com (10.152.84.237) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Fri, 2 Aug 2019 15:11:54 +0000
Received: from kazbox.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Fri, 2 Aug 2019
 10:11:53 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amd/display: Validate dc_plane_info and dc_plane_size
 in atomic check
Date: Fri, 2 Aug 2019 11:11:49 -0400
Message-ID: <20190802151150.26628-1-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(39860400002)(346002)(2980300002)(428003)(189003)(199004)(336012)(2351001)(53936002)(86362001)(7696005)(51416003)(2906002)(4326008)(70586007)(6916009)(26005)(47776003)(14444005)(1076003)(44832011)(5660300002)(53416004)(81166006)(68736007)(186003)(81156014)(50226002)(50466002)(70206006)(48376002)(8676002)(126002)(36756003)(478600001)(316002)(15650500001)(486006)(16586007)(2616005)(8936002)(356004)(6666004)(54906003)(476003)(305945005)(426003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3473; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71aa82c7-7252-49e9-0551-08d7175bc133
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN8PR12MB3473; 
X-MS-TrafficTypeDiagnostic: BN8PR12MB3473:
X-Microsoft-Antispam-PRVS: <BN8PR12MB347366904277697EE201D664ECD90@BN8PR12MB3473.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:534;
X-Forefront-PRVS: 011787B9DD
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: ClCtTk5yTT9riA7GFOe2UacC1d1TBSzZcnLVDFAKXQz2oQuJZrmL3vePMtZLU5XfxhEAAv1O3/ztiN8VET8qV/GTsVuuJJoodzIfpDxUOArV6xl03juHdMu9uSIU+AC3898SR8dPpeTOeSwFh7wRCbJwFfFjb0E9TpTrE2UG9qUYgKAMsKNH0DMqxWKcxo/FrkEkN/RtE8DkPcz/RVlTHB5Q9UzzPeWXUTM8QwziLNTGsGpcsCX3ooumyLEluyDBQm2QsxSD63skaCClj+5KTWUPpxdtZW7cXx2m0+j4h2okj1aeC4avo2Ybi2btBHtjmBOJQUsFu94xoXi2aZ7J79rN6MO01Fgn237iWii+9K4CY7yD+iQcXWtemow9/BFw+XpCFux1LsU05HjnRifLkL8+BxKCUbCQTLqV1zSgGZ4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2019 15:11:54.5452 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71aa82c7-7252-49e9-0551-08d7175bc133
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3473
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=god6CE+2iYH3FVYRFjUEAP8TPyOhlc9jEV8SDvAqGoc=;
 b=pL+z/uANUOEEj3hxSC2rNpZxot5NcQMy7l2U3+xLP572uZEm3nfr8GXSxEUmjh0pS/O4v5FavB6KLvWC8H2pRzgmQE3NGTLBLNf7zFL8JbmZDgLkokVhDdgU7WN2BOpAn42+EZNuxyLUs3zlUmWlSs6a+fbORAP+B/s7HckaE+A=
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
Cc: Leo Li <sunpeng.li@amd.com>, David Francis <david.francis@amd.com>,
 Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KUGl0Y2gsIERDQywgcm90YXRpb24gYW5kIG1pcnJvcmluZyBjYW4gcmVzdWx0IGluIHVw
ZGF0ZXMgdGhhdCBhcmUgbm90ClVQREFURV9UWVBFX0ZBU1QgYnV0IFVQREFURV9UWVBFX01FRCBp
bnN0ZWFkLiBEQyBuZWVkcyBkY19wbGFuZV9pbmZvCmFuZCBkY19wbGFuZV9zaXplIHRvIG1ha2Ug
dGhpcyBkZXRlcm1pbmF0aW9uIGFuZCB3ZSBhcmVuJ3QgY3VycmVudGx5CnBhc3NpbmcgdGhpcyBp
bnRvIERDIGR1cmluZyBhdG9taWMgY2hlY2suCgpVbmRlcmZsb3cgKHZpc2libGUgb3Igbm9uLXZp
c2libGUpIGNhbiBvY2N1ciBpZiB3ZSBkb24ndCB2YWxpZGF0ZSB0aGlzCmNvcnJlY3RseS4gVGhp
cyBhbHNvIHdpbGwgZ2VuZXJhbGx5IHRyaWdnZXIgcC1zdGF0ZSB3YXJuaW5ncywgdHlwaWNhbGx5
CnZpYSB0aGUgY3Vyc29yIGhhbmRsZXIgd2hlbiBsb2NraW5nLgoKW0hvd10KR2V0IHRoZSBmcmFt
ZWJ1ZmZlciB0aWxpbmcgZmxhZ3MgYW5kIGdlbmVyYXRlIHRoZSByZXF1aXJlZCBzdHJ1Y3R1cmVz
CmZvciBEQyBpbiBkbV9kZXRlcm1pbmVfdXBkYXRlX3R5cGVfZm9yX2NvbW1pdC4KCkNjOiBEYXZp
ZCBGcmFuY2lzIDxkYXZpZC5mcmFuY2lzQGFtZC5jb20+CkNjOiBCaGF3YW5wcmVldCBMYWtoYSA8
Ymhhd2FucHJlZXQubGFraGFAYW1kLmNvbT4KQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29t
PgpTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVza2Fz
QGFtZC5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bS5jIHwgMjQgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG0uYwppbmRleCAwNDAxNjkxODBhNjMuLmZmYjNjNzI0N2FjNiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCkBAIC02OTg3LDYg
KzY5ODcsMTIgQEAgZG1fZGV0ZXJtaW5lX3VwZGF0ZV90eXBlX2Zvcl9jb21taXQoc3RydWN0IGFt
ZGdwdV9kaXNwbGF5X21hbmFnZXIgKmRtLAogCQkJY29udGludWU7CiAKIAkJZm9yX2VhY2hfb2xk
bmV3X3BsYW5lX2luX3N0YXRlKHN0YXRlLCBwbGFuZSwgb2xkX3BsYW5lX3N0YXRlLCBuZXdfcGxh
bmVfc3RhdGUsIGopIHsKKwkJCWNvbnN0IHN0cnVjdCBhbWRncHVfZnJhbWVidWZmZXIgKmFtZGdw
dV9mYiA9CisJCQkJdG9fYW1kZ3B1X2ZyYW1lYnVmZmVyKG5ld19wbGFuZV9zdGF0ZS0+ZmIpOwor
CQkJc3RydWN0IGRjX3BsYW5lX2luZm8gcGxhbmVfaW5mbzsKKwkJCXN0cnVjdCBkY19mbGlwX2Fk
ZHJzIGZsaXBfYWRkcjsKKwkJCXVpbnQ2NF90IHRpbGluZ19mbGFnczsKKwogCQkJbmV3X3BsYW5l
X2NydGMgPSBuZXdfcGxhbmVfc3RhdGUtPmNydGM7CiAJCQlvbGRfcGxhbmVfY3J0YyA9IG9sZF9w
bGFuZV9zdGF0ZS0+Y3J0YzsKIAkJCW5ld19kbV9wbGFuZV9zdGF0ZSA9IHRvX2RtX3BsYW5lX3N0
YXRlKG5ld19wbGFuZV9zdGF0ZSk7CkBAIC03MDMwLDYgKzcwMzYsMjQgQEAgZG1fZGV0ZXJtaW5l
X3VwZGF0ZV90eXBlX2Zvcl9jb21taXQoc3RydWN0IGFtZGdwdV9kaXNwbGF5X21hbmFnZXIgKmRt
LAogCiAJCQl1cGRhdGVzW251bV9wbGFuZV0uc2NhbGluZ19pbmZvID0gJnNjYWxpbmdfaW5mbzsK
IAorCQkJaWYgKGFtZGdwdV9mYikgeworCQkJCXJldCA9IGdldF9mYl9pbmZvKGFtZGdwdV9mYiwg
JnRpbGluZ19mbGFncyk7CisJCQkJaWYgKHJldCkKKwkJCQkJZ290byBjbGVhbnVwOworCisJCQkJ
bWVtc2V0KCZmbGlwX2FkZHIsIDAsIHNpemVvZihmbGlwX2FkZHIpKTsKKworCQkJCXJldCA9IGZp
bGxfZGNfcGxhbmVfaW5mb19hbmRfYWRkcigKKwkJCQkJZG0tPmFkZXYsIG5ld19wbGFuZV9zdGF0
ZSwgdGlsaW5nX2ZsYWdzLAorCQkJCQkmcGxhbmVfaW5mbywKKwkJCQkJJmZsaXBfYWRkci5hZGRy
ZXNzKTsKKwkJCQlpZiAocmV0KQorCQkJCQlnb3RvIGNsZWFudXA7CisKKwkJCQl1cGRhdGVzW251
bV9wbGFuZV0ucGxhbmVfaW5mbyA9ICZwbGFuZV9pbmZvOworCQkJCXVwZGF0ZXNbbnVtX3BsYW5l
XS5mbGlwX2FkZHIgPSAmZmxpcF9hZGRyOworCQkJfQorCiAJCQludW1fcGxhbmUrKzsKIAkJfQog
Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
