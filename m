Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E46DB735
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 21:15:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E8216EAA3;
	Thu, 17 Oct 2019 19:15:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780040.outbound.protection.outlook.com [40.107.78.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F3AD6EAA5
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 19:15:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FLiAAaeVQBOAWm8mJMrScD2HxtmvLDgUbPYcfSQrjbhqMnJ4laKuOexr3JcN7k4wKYi0JKL05JNuJ3FPz3rdpPtXt4zm7DkVrOHBj+8fl2CXcZcZsiKMIVyKZM1lir73AuAVnLINdv+UOw12U5NH5iO+VDN5NBneDnzEra4CpjudmCDs51pIG9KkD9YRFburfz6cG2IGCFAbl624dRg47mWKQf9QLCWRfecJBcsIwZ1Lb6Gbnl7n7Px/7QR2l+TnlRHb5mCEm//TG7nWvsnJZSoENNNFU1hJ5EQU0JGtmZTcYO9jPrzurUyuZgozAM02byHraNwNwOYT/b5pg064Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6tXxn86BsDzIRuQNyprmLI9wns0YuTJ88nwyTlrTXs=;
 b=NCVraD7gyBf9ZGPSqSSxhrOr6FSLWH7O6iMbAxEDNgtgIYe/dyVfdIxRzLc4VOkYRbIvYQ34cRSlI3JOtXDUcYjAhtHxcg4OO+dR95z/GbK/XXIDNSi39nsjRCds/yxdfTK+kcJ3cJ9t6CXkDVGSU4R5qJ5u+RBDxAm0Dvio1xx4ey19DNofmLKLADiKy3ci8D/ibpfkJtG+7cfpNZnTUnul3C486TsvoGeTqPmorXnaLMdTcvIOJzPDw5RCB6bcBxxAwdcpJn3QPuo1T7dbiKUx4qwB9PSpvJT54tGz8bK56d5kO7UtpiH1BUjIlKs/b497IpTT/IfT1xsQSBO2OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN8PR12CA0022.namprd12.prod.outlook.com (2603:10b6:408:60::35)
 by SN6PR12MB2718.namprd12.prod.outlook.com (2603:10b6:805:70::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.21; Thu, 17 Oct
 2019 19:15:42 +0000
Received: from BY2NAM03FT041.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::207) by BN8PR12CA0022.outlook.office365.com
 (2603:10b6:408:60::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.23 via Frontend
 Transport; Thu, 17 Oct 2019 19:15:42 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BY2NAM03FT041.mail.protection.outlook.com (10.152.85.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2367.14 via Frontend Transport; Thu, 17 Oct 2019 19:15:42 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:41 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:41 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 17 Oct 2019 14:15:41 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 19/37] drm/amd/display: enable vm by default for rn.
Date: Thu, 17 Oct 2019 15:13:11 -0400
Message-ID: <20191017191329.11857-20-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017191329.11857-1-sunpeng.li@amd.com>
References: <20191017191329.11857-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(136003)(39860400002)(428003)(189003)(199004)(50466002)(51416003)(8936002)(50226002)(76176011)(81156014)(8676002)(186003)(1076003)(6666004)(54906003)(26005)(356004)(316002)(86362001)(47776003)(81166006)(478600001)(126002)(476003)(305945005)(2906002)(2876002)(2870700001)(2351001)(5660300002)(11346002)(6916009)(426003)(446003)(70206006)(2616005)(486006)(36756003)(4326008)(70586007)(336012)(48376002)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2718; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 972705b7-60dc-4272-573d-08d75336676d
X-MS-TrafficTypeDiagnostic: SN6PR12MB2718:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2718F697D7245B6AF76445AF826D0@SN6PR12MB2718.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-Forefront-PRVS: 01930B2BA8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HWi6OPF/UhV//Xvrf+OLiwKvLek6ursh6lJsgdIbMllBWIXHSPWhbbSNtcmwO7ch7mhLhfZ4afmVn92qr+njA846OOzjkCaItMjkPMaFxZNZzaZ3iqJVi9mPVBhc60RUVKGVZm4YBpmZZgc1jTs3S1ZZWVWGhyaAa5cSsD1RaDxPUAzWgCdecnPb1KkC4Mt+JfSOvNRnHdjg4qKGXEkurQ1aVfi7OEKnG3TFCNyDjXm+z8+Gtn8d09ergVaHLqC3fE25g/tSMOyTIoQCaBGb2INU/Woot4c2ZpVUL7iNUnE7THBRMlTCZB+IiEqydHDtD2zYoMxr8Dw+rBz1MFCiz6Kf8SzQqLGPTUzVa69jprl72a6R8gf+iINOEtKyTszWV0tRne8h1507a2Giyz30S650HMNPJ9nhYEEYgqq+02k=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 19:15:42.3461 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 972705b7-60dc-4272-573d-08d75336676d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2718
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6tXxn86BsDzIRuQNyprmLI9wns0YuTJ88nwyTlrTXs=;
 b=TX/2Lr1xFOBbjjECoR70iaX8C/1s05d3u7tKi/SfUusKYcHgDdjoiQ9J2MWPVZQ0/p60pk9jcHOnHcHD/XmyefKTxw6SmcHETSS46PrqfvL8QTalllW6xNt1MRBRm47433yc9S/DRFV0xsfSQzbXyKibVWp2aWVCLnZhn2gPmB0=
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
Cc: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Yongqiang Sun <yongqiang.sun@amd.com>,
 Tony Cheng <Tony.Cheng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWW9uZ3FpYW5nIFN1biA8eW9uZ3FpYW5nLnN1bkBhbWQuY29tPgoKW1doeSAmIEhvd10K
dm0gc2hvdWxkIGJlIGVuYWJsZWQgYnkgZGVmYXVsdCBmb3Igcm4gdG8gZ2V0CnJpZ2h0IGRtbC4K
ClNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBTdW4gPHlvbmdxaWFuZy5zdW5AYW1kLmNvbT4KUmV2
aWV3ZWQtYnk6IERteXRybyBMYWt0eXVzaGtpbiA8RG15dHJvLkxha3R5dXNoa2luQGFtZC5jb20+
ClJldmlld2VkLWJ5OiBUb255IENoZW5nIDxUb255LkNoZW5nQGFtZC5jb20+CkFja2VkLWJ5OiBM
ZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KLS0tCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
bjIxL2RjbjIxX3Jlc291cmNlLmMgfCAyOSArKysrKysrKysrKysrKysrLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfcmVzb3VyY2UuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9yZXNvdXJjZS5jCmluZGV4IDVl
M2I0OGJiMDRmMS4uYTRkOWVkOWYyNjIzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfcmVzb3VyY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfcmVzb3VyY2UuYwpAQCAtODMsOCArODMsOCBAQAog
CiBzdHJ1Y3QgX3Zjc19kcGlfaXBfcGFyYW1zX3N0IGRjbjJfMV9pcCA9IHsKIAkub2RtX2NhcGFi
bGUgPSAxLAotCS5ncHV2bV9lbmFibGUgPSAwLAotCS5ob3N0dm1fZW5hYmxlID0gMCwKKwkuZ3B1
dm1fZW5hYmxlID0gMSwKKwkuaG9zdHZtX2VuYWJsZSA9IDEsCiAJLmdwdXZtX21heF9wYWdlX3Rh
YmxlX2xldmVscyA9IDEsCiAJLmhvc3R2bV9tYXhfcGFnZV90YWJsZV9sZXZlbHMgPSA0LAogCS5o
b3N0dm1fY2FjaGVkX3BhZ2VfdGFibGVfbGV2ZWxzID0gMiwKQEAgLTY2OSw2ICs2NjksOSBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IGRjbjEwX3N0cmVhbV9lbmNvZGVyX21hc2sgc2VfbWFzayA9IHsK
IAogc3RhdGljIHZvaWQgZGNuMjFfcHBfc211X2Rlc3Ryb3koc3RydWN0IHBwX3NtdV9mdW5jcyAq
KnBwX3NtdSk7CiAKK3N0YXRpYyBpbnQgZGNuMjFfcG9wdWxhdGVfZG1sX3BpcGVzX2Zyb21fY29u
dGV4dCgKKwkJc3RydWN0IGRjICpkYywgc3RydWN0IHJlc291cmNlX2NvbnRleHQgKnJlc19jdHgs
IGRpc3BsYXlfZTJlX3BpcGVfcGFyYW1zX3N0ICpwaXBlcyk7CisKIHN0YXRpYyBzdHJ1Y3QgaW5w
dXRfcGl4ZWxfcHJvY2Vzc29yICpkY24yMV9pcHBfY3JlYXRlKAogCXN0cnVjdCBkY19jb250ZXh0
ICpjdHgsIHVpbnQzMl90IGluc3QpCiB7CkBAIC0xMDgzLDcgKzEwODYsNyBAQCB2b2lkIGRjbjIx
X2NhbGN1bGF0ZV93bSgKIAkJCXBpcGVfY250ID0gZGMtPnJlc19wb29sLT5mdW5jcy0+cG9wdWxh
dGVfZG1sX3BpcGVzKGRjLAogCQkJCSZjb250ZXh0LT5yZXNfY3R4LCBwaXBlcyk7CiAJCWVsc2UK
LQkJCXBpcGVfY250ID0gZGNuMjBfcG9wdWxhdGVfZG1sX3BpcGVzX2Zyb21fY29udGV4dChkYywK
KwkJCXBpcGVfY250ID0gZGNuMjFfcG9wdWxhdGVfZG1sX3BpcGVzX2Zyb21fY29udGV4dChkYywK
IAkJCQkmY29udGV4dC0+cmVzX2N0eCwgcGlwZXMpOwogCX0KIApAQCAtMTU4NSwxMSArMTU4OCwy
OSBAQCBzdGF0aWMgdWludDMyX3QgcmVhZF9waXBlX2Z1c2VzKHN0cnVjdCBkY19jb250ZXh0ICpj
dHgpCiAJcmV0dXJuIHZhbHVlOwogfQogCitzdGF0aWMgaW50IGRjbjIxX3BvcHVsYXRlX2RtbF9w
aXBlc19mcm9tX2NvbnRleHQoCisJCXN0cnVjdCBkYyAqZGMsIHN0cnVjdCByZXNvdXJjZV9jb250
ZXh0ICpyZXNfY3R4LCBkaXNwbGF5X2UyZV9waXBlX3BhcmFtc19zdCAqcGlwZXMpCit7CisJdWlu
dDMyX3QgcGlwZV9jbnQgPSBkY24yMF9wb3B1bGF0ZV9kbWxfcGlwZXNfZnJvbV9jb250ZXh0KGRj
LCByZXNfY3R4LCBwaXBlcyk7CisJaW50IGk7CisKKwlmb3IgKGkgPSAwOyBpIDwgZGMtPnJlc19w
b29sLT5waXBlX2NvdW50OyBpKyspIHsKKworCQlpZiAoIXJlc19jdHgtPnBpcGVfY3R4W2ldLnN0
cmVhbSkKKwkJCWNvbnRpbnVlOworCisJCXBpcGVzW2ldLnBpcGUuc3JjLmhvc3R2bSA9IDE7CisJ
CXBpcGVzW2ldLnBpcGUuc3JjLmdwdXZtID0gMTsKKwl9CisKKwlyZXR1cm4gcGlwZV9jbnQ7Cit9
CisKIHN0YXRpYyBzdHJ1Y3QgcmVzb3VyY2VfZnVuY3MgZGNuMjFfcmVzX3Bvb2xfZnVuY3MgPSB7
CiAJLmRlc3Ryb3kgPSBkY24yMV9kZXN0cm95X3Jlc291cmNlX3Bvb2wsCiAJLmxpbmtfZW5jX2Ny
ZWF0ZSA9IGRjbjIxX2xpbmtfZW5jb2Rlcl9jcmVhdGUsCiAJLnZhbGlkYXRlX2JhbmR3aWR0aCA9
IGRjbjIxX3ZhbGlkYXRlX2JhbmR3aWR0aCwKLQkucG9wdWxhdGVfZG1sX3BpcGVzID0gZGNuMjBf
cG9wdWxhdGVfZG1sX3BpcGVzX2Zyb21fY29udGV4dCwKKwkucG9wdWxhdGVfZG1sX3BpcGVzID0g
ZGNuMjFfcG9wdWxhdGVfZG1sX3BpcGVzX2Zyb21fY29udGV4dCwKIAkuYWRkX3N0cmVhbV90b19j
dHggPSBkY24yMF9hZGRfc3RyZWFtX3RvX2N0eCwKIAkucmVtb3ZlX3N0cmVhbV9mcm9tX2N0eCA9
IGRjbjIwX3JlbW92ZV9zdHJlYW1fZnJvbV9jdHgsCiAJLmFjcXVpcmVfaWRsZV9waXBlX2Zvcl9s
YXllciA9IGRjbjIwX2FjcXVpcmVfaWRsZV9waXBlX2Zvcl9sYXllciwKLS0gCjIuMjMuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
