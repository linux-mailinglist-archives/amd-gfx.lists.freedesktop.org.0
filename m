Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D61BD73143
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 16:11:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA696E59E;
	Wed, 24 Jul 2019 14:11:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-by2nam01on0623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe42::623])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F5C6E59E
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 14:11:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BSpTXDigZJdvlaKEy1oQV+iP6tDGgEzbYT36epH32P50YKe5IPp2JWQ7XiY3Yhch6Mau0AgtwmKO3Ya6PLNB7WuHq2YYhv+TR/Qm7LYvKe7uG5jHYr3/FloyB1hX/nDiK8Zyn41HUHIUIORUvQgdKShJNUCp4zuOTwpLGtGtJUBccQxL0gOoh2GbW7G8cwYOKJhf6eE+NhxY5jpvyLc752h+cKNl6GaeIYhvLAktCLpS9AMrEBT/3UKmFHAS3unu7ZAfdWJp46O0lD0DHs40VGVgnfvOise5w3JVhDonxeltexugIG2yJg6QAePrMJwBUvFy84A0dKwDt6oEsF7Dmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bnhENzyoPt57XRBg1hsSQvxbFiZ34AcRvG/Z+s/ehRM=;
 b=MiH4gXqQ1nADe1ejPbL36Rwk4NaUXD7Jk/N6xWTtjpkrOFw+wYyqVl2n87PW+EwFiWFPpDzN1t0T2oWW3sqmwSqWhEHnkORuqC/o9lDfAxpp6WlYOuL6PqJdZZ5BuJnOzN8w/p9jXeN95rPeIW8aQHTr7Wi736eR5nHyate7AIdH8S3Tikmq+cAHoNA99Osionur5MFyy1jKJzJdXA/zw0YqdZg66a3XFW6cGahejNpDXGGx44dtutPpdSdsU08t8jRf18majOJIoZbxnXwMcv1bjE9FYA7cSiSPKWIp08IwJaB4Z2tr0NpE29ObztIH2xxcWTEKx4YBpLLF9wZMIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MN2PR12CA0011.namprd12.prod.outlook.com (2603:10b6:208:a8::24)
 by MWHPR1201MB2493.namprd12.prod.outlook.com (2603:10b6:300:ec::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.17; Wed, 24 Jul
 2019 14:11:14 +0000
Received: from CO1NAM03FT033.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::204) by MN2PR12CA0011.outlook.office365.com
 (2603:10b6:208:a8::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.10 via Frontend
 Transport; Wed, 24 Jul 2019 14:11:13 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT033.mail.protection.outlook.com (10.152.80.175) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Wed, 24 Jul 2019 14:11:13 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Wed, 24 Jul 2019 09:11:10 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 1/3] drm/amdgpu: Fix hard hang for S/G display BOs.
Date: Wed, 24 Jul 2019 10:10:40 -0400
Message-ID: <1563977442-4809-2-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563977442-4809-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1563977442-4809-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(2980300002)(428003)(189003)(199004)(2906002)(6666004)(356004)(86362001)(8936002)(26005)(7696005)(51416003)(6916009)(68736007)(76176011)(70586007)(70206006)(50226002)(48376002)(81156014)(81166006)(305945005)(8676002)(54906003)(53416004)(44832011)(16586007)(2351001)(316002)(486006)(186003)(2616005)(476003)(36756003)(53936002)(47776003)(126002)(4326008)(11346002)(50466002)(5660300002)(446003)(478600001)(14444005)(336012)(426003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR1201MB2493; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 517d5490-4edc-4752-1001-08d71040c933
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR1201MB2493; 
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2493:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB2493882CE4F7D0E72570C2B5EAC60@MWHPR1201MB2493.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0108A997B2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: U5hMYIbWdMq/xvJKHP62KuFEOpwWOGDCR/JlSf84IfOKBE2xABXXfGOmQ1DDRIu2vlMST+0/DwcJW+U41jYcl1+cAV3vRBwwNHSStDGq5/bOHG0R9d+UtO1/IZZTF78bRU4lDF/Uky8wfrb0KAKXzIEX4pIc7oySTqMUr93uNYkeOuSZElpUAO7TLCwvkvqs3VDIEavjBhtfRM2N9QqjiihebovVZCZ5gyL4FcK9WP33BzXSCoc6tG9+f89UR/sOlYlUMolbDgtOE3Ajulv0TLsyLcqBSWxn7Yf9+/R1Au9IP/nVlHtj3G7JeXVPkLWqw92uhIMxLSQ2arUv9UckevFKvp/hv76iSTNf+PVvowNWRuperbzK3NraKnR9x87hRyHt4vDSGLi2NIgcXo3uuFmZduoeXjCh1NuNQyesZVY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2019 14:11:13.3721 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 517d5490-4edc-4752-1001-08d71040c933
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2493
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bnhENzyoPt57XRBg1hsSQvxbFiZ34AcRvG/Z+s/ehRM=;
 b=p+lfXAFEnL3RDYyTxV28hpwgaoZ6ERdSOoJNiw6SMltdXNIpB7zf20ky6RyQINCBQJACTr6/lqYtgtLDMaoSIEs+YGQ7I9mTUWWAzwwJ46oMQphu7fk7B7NWK8bvDMLokKKf8pWKB9GUIQxbQSFKmneWUcg0gDE7IMgdZ1i3QX0=
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
