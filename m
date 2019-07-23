Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A61A171F45
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 20:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B9C06E377;
	Tue, 23 Jul 2019 18:26:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750084.outbound.protection.outlook.com [40.107.75.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0346E377
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 18:26:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KjdQxNLJiIfxYlpihXQOLGQBHsnq8TKfXEM6GdO9BEldOvQMIC9xRIu9hyGEG0OvzCz4u2eh7YYs+f0ISr1qyV3Rrxns0ICNB5dC0qbmFrWCA41HW31sWkmoN/Le6Ye4ZefXlWvyuFlunzuiwIyLoZe+t/is/+CuxLiM+rnzWoot10bklH+1ccr0PlWL34GXzKruhG+4qYzYM8Uy/wyzKLLXNsUEb1LpH55xVwGTrIWMqjdsVGWm877WiuZfxaLfqxEna8GJ2pGvDC+Ohpms5DQujKRIqxmKNH4dgMrKJwbr4EgLi/uObik9auf5ez5N0QoY8mB/hU3TT1kWRud80w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bnhENzyoPt57XRBg1hsSQvxbFiZ34AcRvG/Z+s/ehRM=;
 b=WiSSGKP4Za0PxiFDGp9NahDRLNwPKijcBxlwEGMfIZimtNKoNHB0zEMCiC1wkZb2AKvEtQuH/DNJrCR1fGXnd51eXC4Qj1cUK0G2YEAepYax2wNMxS7a0P73wDTw04fnh8hRycDBcIYyBT6blXYpomyh8Lhqu/ph0mmKB+XSCBWzs+8oL538+jdvDoUS6TemAIygoW87yJxU7vv0rEkoGUaLJY+IuCwm+ab2n6ASCVq5vi3Phl0s7YR7sbS4b0bpQW5TcRRDv8DOVsC1ETj0+fanG4tA3Dnt1jF3vG3DsrJhcJBbOhPhPs5+Wq4E4/sNIv7rx3CFScJLAgOMHvf9+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CY4PR1201CA0020.namprd12.prod.outlook.com
 (2603:10b6:910:16::30) by MWHPR1201MB2492.namprd12.prod.outlook.com
 (2603:10b6:300:e8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16; Tue, 23 Jul
 2019 18:26:17 +0000
Received: from BY2NAM03FT024.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::204) by CY4PR1201CA0020.outlook.office365.com
 (2603:10b6:910:16::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2094.14 via Frontend
 Transport; Tue, 23 Jul 2019 18:26:17 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT024.mail.protection.outlook.com (10.152.84.229) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 23 Jul 2019 18:26:17 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Tue, 23 Jul 2019 13:26:15 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 1/2] drm/amdgpu: Fix hard hang for S/G display BOs.
Date: Tue, 23 Jul 2019 14:25:34 -0400
Message-ID: <1563906335-12949-2-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563906335-12949-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1563906335-12949-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(136003)(376002)(2980300002)(428003)(199004)(189003)(47776003)(50226002)(486006)(11346002)(478600001)(53936002)(14444005)(4326008)(16586007)(8676002)(44832011)(316002)(446003)(2616005)(2351001)(305945005)(476003)(70586007)(126002)(8936002)(86362001)(356004)(6666004)(36756003)(26005)(51416003)(70206006)(53416004)(7696005)(76176011)(68736007)(6916009)(426003)(2906002)(81156014)(186003)(5660300002)(50466002)(48376002)(336012)(81166006)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR1201MB2492; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57967985-c2e4-4605-82ef-08d70f9b40ab
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR1201MB2492; 
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2492:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB249264DA783358676732D21DEAC70@MWHPR1201MB2492.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0107098B6C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Z1qyHdP3cPXhf3AVXA2rMsm91lEzGvVdJpVY33RI4YK265IyEP4gYnJiihpx4WIPvcGv3iEmX2r5eKf68XRGphXWsG/OuoiiHwC7p7a4hy0u7+G3qo4SmnYVKplZCqgDnIgzkPI8h16U/rhiFulBCLu3J4Asi2XCa4BHccxiUrQagNHfYYtIKwyaCatEEIn7EYIfBHRe79Fx+pnODi6V2zG+GwEXm/jNxGAb+O/rnP9vYyCypdfGlXqUvGOLDwLRBSjrDOZRpr/5Nh9p3IWaBxmnpqnxiPRp2SCl1wohZZ69/sGK6zfzVYipTm31OMzXEBWl7BMcNvXxarn69kzdzhfsXx7kgN0ufGyCoLdXS7QglQrr15tchTYwtdW7xsLTLIDaDNDCCdjMOMALlkxC1327MjEYQDjiLCr0loF15ZM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2019 18:26:17.3912 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57967985-c2e4-4605-82ef-08d70f9b40ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2492
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bnhENzyoPt57XRBg1hsSQvxbFiZ34AcRvG/Z+s/ehRM=;
 b=zwfg/qG0N0Moc3ZxnwifZEUxb7K7ddV+ap0rZEvsxlEedFa6F1uyAVQAQ3JiVtoFwPIY3ZQ3+W9OBzouAtcus4PmwQRjoRw0HQMwiriKuHYEgs9/wK7sqhdOqYdMMRTs8VP5IWOT2FT9sQVZOQD+NUDJO1ehgSD/skzRov2+GeQ=
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
Cc: Alexander.Deucher@amd.com, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 hersenxs.wu@amd.com, Christian.Koenig@amd.com, shirish.s@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SFcgcmVxdWlyZXMgZm9yIGNhY2hpbmcgdG8gYmUgdW5zZXQgZm9yIHNjYW5vdXQgQk8KbWFwcGlu
Z3Mgd2hlbiB0aGUgQk8gcGxhY2VtZW50IGlzIGluIEdUVCBtZW1vcnkuClVzdWFsbHkgdGhlIGZs
YWcgdG8gdW5zZXQgaXMgcGFzc2VkIGZyb20gdXNlciBtb2RlCmJ1dCBmb3IgRkIgbW9kZSB0aGlz
IHdhcyBtaXNzaW5nLgoKdjI6Ck1vdmUgYWxsIEJPIHBsYWNlbW50IGxvZ2ljIHRvIGFtZGdwdV9k
aXNwbGF5X3N1cHBvcnRlZF9kb21haW5zCgpTdWdnZXN0ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kg
PGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClRlc3RlZC1ieTogU2hpcmlzaCBTIDxzaGlyaXNoLnNA
YW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZmIuYyAgfCA3
ICsrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYyB8IDMgKyst
CiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZmIuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mYi5jCmluZGV4IGU0NzYwOTIuLmJmMGM2MWIgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mYi5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mYi5jCkBAIC0xMzcsMTQgKzEzNywxNCBA
QCBzdGF0aWMgaW50IGFtZGdwdWZiX2NyZWF0ZV9waW5uZWRfb2JqZWN0KHN0cnVjdCBhbWRncHVf
ZmJkZXYgKnJmYmRldiwKIAltb2RlX2NtZC0+cGl0Y2hlc1swXSA9IGFtZGdwdV9hbGlnbl9waXRj
aChhZGV2LCBtb2RlX2NtZC0+d2lkdGgsIGNwcCwKIAkJCQkJCSAgZmJfdGlsZWQpOwogCWRvbWFp
biA9IGFtZGdwdV9kaXNwbGF5X3N1cHBvcnRlZF9kb21haW5zKGFkZXYpOwotCiAJaGVpZ2h0ID0g
QUxJR04obW9kZV9jbWQtPmhlaWdodCwgOCk7CiAJc2l6ZSA9IG1vZGVfY21kLT5waXRjaGVzWzBd
ICogaGVpZ2h0OwogCWFsaWduZWRfc2l6ZSA9IEFMSUdOKHNpemUsIFBBR0VfU0laRSk7CiAJcmV0
ID0gYW1kZ3B1X2dlbV9vYmplY3RfY3JlYXRlKGFkZXYsIGFsaWduZWRfc2l6ZSwgMCwgZG9tYWlu
LAogCQkJCSAgICAgICBBTURHUFVfR0VNX0NSRUFURV9DUFVfQUNDRVNTX1JFUVVJUkVEIHwKLQkJ
CQkgICAgICAgQU1ER1BVX0dFTV9DUkVBVEVfVlJBTV9DT05USUdVT1VTIHwKLQkJCQkgICAgICAg
QU1ER1BVX0dFTV9DUkVBVEVfVlJBTV9DTEVBUkVELAorCQkJCSAgICAgICBBTURHUFVfR0VNX0NS
RUFURV9WUkFNX0NPTlRJR1VPVVMgICAgIHwKKwkJCQkgICAgICAgQU1ER1BVX0dFTV9DUkVBVEVf
VlJBTV9DTEVBUkVEIAkgICAgIHwKKwkJCQkgICAgICAgQU1ER1BVX0dFTV9DUkVBVEVfQ1BVX0dU
VF9VU1dDLAogCQkJCSAgICAgICB0dG1fYm9fdHlwZV9rZXJuZWwsIE5VTEwsICZnb2JqKTsKIAlp
ZiAocmV0KSB7CiAJCXByX2VycigiZmFpbGVkIHRvIGFsbG9jYXRlIGZyYW1lYnVmZmVyICglZClc
biIsIGFsaWduZWRfc2l6ZSk7CkBAIC0xNjYsNyArMTY2LDYgQEAgc3RhdGljIGludCBhbWRncHVm
Yl9jcmVhdGVfcGlubmVkX29iamVjdChzdHJ1Y3QgYW1kZ3B1X2ZiZGV2ICpyZmJkZXYsCiAJCQlk
ZXZfZXJyKGFkZXYtPmRldiwgIkZCIGZhaWxlZCB0byBzZXQgdGlsaW5nIGZsYWdzXG4iKTsKIAl9
CiAKLQogCXJldCA9IGFtZGdwdV9ib19waW4oYWJvLCBkb21haW4pOwogCWlmIChyZXQpIHsKIAkJ
YW1kZ3B1X2JvX3VucmVzZXJ2ZShhYm8pOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2dlbS5jCmluZGV4IDJjZWFkNWEuLmVlZWQwODkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZ2VtLmMKQEAgLTc0Myw3ICs3NDMsOCBAQCBpbnQgYW1kZ3B1X21vZGVfZHVtYl9j
cmVhdGUoc3RydWN0IGRybV9maWxlICpmaWxlX3ByaXYsCiAJc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYgPSBkZXYtPmRldl9wcml2YXRlOwogCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqZ29iajsK
IAl1aW50MzJfdCBoYW5kbGU7Ci0JdTY0IGZsYWdzID0gQU1ER1BVX0dFTV9DUkVBVEVfQ1BVX0FD
Q0VTU19SRVFVSVJFRDsKKwl1NjQgZmxhZ3MgPSBBTURHUFVfR0VNX0NSRUFURV9DUFVfQUNDRVNT
X1JFUVVJUkVEIHwKKwkJICAgIEFNREdQVV9HRU1fQ1JFQVRFX0NQVV9HVFRfVVNXQzsKIAl1MzIg
ZG9tYWluOwogCWludCByOwogCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
