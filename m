Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE4A71C6A
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 18:04:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC0F989F89;
	Tue, 23 Jul 2019 16:04:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::60f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B9189F89
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 16:04:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YasSE61IOqhl64djuumWYW6p/hP7iMeBOwbKPjniJgNKOGYC8YkISHO8yfCYsHWgFp95eA8fGEdNAxijwtUbCeZgsFCLUa3pQsgWOoX/LVQjAT/0S5zN31N4fXdg6qwuMW4iSjgOAqfuBb5cMwnzuSWmx1tmOfR1zot/OjdQIutbZbh8M645XjOMkl4deyJsdjdId0+Zb29SH0NrfqIzMEKE8FO5hFInQRFx/apnKZFjiOk23xL5Tsoh6s5wmpp3jY2hOqpWEqdbk3MX5Gz258C8tNfRFn17oXaDnBMCiefY552TVA6VW1rqqRvA3Y1gufJr60NqR0Kc4As4pWa8iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wc6JrZ+obqj32zkYC6TtR6f8A47e9JHKPhSyGzbxBRU=;
 b=BD0Yk7bjVNuzvVs0f8MLGdALGANX6dMW4PakBGM/C7tbaZQdqjGzDGE9o9cWgNdWl2upZ+2rQEJ+lQxwQEz5pm8SxBnhEVyA5YALz/Fbuvl0AeLaFpo+aqujYbY0+M7MYdNrcP+Ll6b2Skv5YTCSeTL/AmWL+6YxZ8EWSrD6XaM40yZ6mTFId+KA+Z9gOz6SGKA1nWAqz11TIcpmoSaIpVoJ/zunRhE8OgOa79o5pC9Ios6RtLWal8avY/mi56WHUtR760gW/BsWa57UryJNF2iyI9Gl9VPrSVXpc7Vy2cv0rLwBzlsgihk52AC8N2wfnlj0yiXOspL+fUoOpjkkeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CY4PR1201CA0002.namprd12.prod.outlook.com
 (2603:10b6:910:16::12) by CY4PR12MB1573.namprd12.prod.outlook.com
 (2603:10b6:910:d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.17; Tue, 23 Jul
 2019 16:04:32 +0000
Received: from DM3NAM03FT055.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::206) by CY4PR1201CA0002.outlook.office365.com
 (2603:10b6:910:16::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.15 via Frontend
 Transport; Tue, 23 Jul 2019 16:04:31 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT055.mail.protection.outlook.com (10.152.83.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 23 Jul 2019 16:04:31 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; 
 Tue, 23 Jul 2019 11:04:30 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/amdgpu: Fix hard hang for S/G display BOs.
Date: Tue, 23 Jul 2019 12:04:09 -0400
Message-ID: <1563897851-11501-2-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563897851-11501-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1563897851-11501-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(346002)(376002)(2980300002)(428003)(199004)(189003)(36756003)(4326008)(50226002)(6666004)(356004)(8676002)(76176011)(476003)(305945005)(50466002)(8936002)(81156014)(16586007)(316002)(11346002)(486006)(426003)(336012)(81166006)(7696005)(54906003)(2906002)(26005)(2616005)(186003)(446003)(48376002)(68736007)(51416003)(47776003)(14444005)(44832011)(2351001)(6916009)(53416004)(478600001)(86362001)(5660300002)(70586007)(70206006)(53936002)(126002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1573; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4562a9d-8da4-43df-6b15-08d70f877296
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1573; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1573:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1573453D96E071ED45FF2D43EAC70@CY4PR12MB1573.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0107098B6C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: hwTwExsLI7MJaJ0BSvO3e5fQQEhHNbl3C/YNZM+CZWMdVAFTlkp/YqtyUiw02/DZK1/GymVPuZvAh3r5D96e1AJE0gcNdW26rfo0Mj6z3MUNfJdFqSjJd7rI+y8TFPArISElRdcV2qU5kSajDqLEcspBvC1FYOttiShdhr9oQywGfmq8Duz+1Ef672B0POkv1+9YLVPFgmHGIzG8ooCrpjK4PdtTSGSL9fTWpsQ36q78p9gebAygISzB7ITrkTrubonMFaoR594sHAvTOep4yBg8/4wqO4enP0JBgSlffpChvINXvlKQfARPqYo9E3i3wr3gCmFj1GHDT6mrzFhHtiLs5Cjs0KW0B+ppeEnTHNArV4BOHN2BWwyeDdnOrZI8hOHOJJfpQZkYL+Bbgk3xmQh3h2/Uu5NQ6DWecPggorg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2019 16:04:31.2265 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4562a9d-8da4-43df-6b15-08d70f877296
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1573
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wc6JrZ+obqj32zkYC6TtR6f8A47e9JHKPhSyGzbxBRU=;
 b=BJU6zVGZYv6kQGy73t8h28jFu/Oz88TuRySRdCGimwWdQ80zoFCR48UDAsk4cFwU+ionczdtgNrVfsEfotURPqWvfqzLhDsZckCooPvIzDacJmncGHzvSM1xOy3Zq99IVSRWMu1/c3kBPOXSFWWJiQlVAiEf+/fV4sjLK04XckI=
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
IHdhcyBtaXNzaW5nLgoKU3VnZ2VzdGVkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3Jv
ZHpvdnNreUBhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1
Y2hlckBhbWQuY29tPgpUZXN0ZWQtYnk6IFNoaXJpc2ggUyA8c2hpcmlzaC5zQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZiLmMgIHwgMTQgKysrKysrKysr
KystLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYyB8ICA0ICsrKy0K
IDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZmIuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mYi5jCmluZGV4IGU0NzYwOTIuLmFjYzQ1MTI1IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZmIuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZmIuYwpAQCAtMTM3LDE0ICsxMzcsMTQg
QEAgc3RhdGljIGludCBhbWRncHVmYl9jcmVhdGVfcGlubmVkX29iamVjdChzdHJ1Y3QgYW1kZ3B1
X2ZiZGV2ICpyZmJkZXYsCiAJbW9kZV9jbWQtPnBpdGNoZXNbMF0gPSBhbWRncHVfYWxpZ25fcGl0
Y2goYWRldiwgbW9kZV9jbWQtPndpZHRoLCBjcHAsCiAJCQkJCQkgIGZiX3RpbGVkKTsKIAlkb21h
aW4gPSBhbWRncHVfZGlzcGxheV9zdXBwb3J0ZWRfZG9tYWlucyhhZGV2KTsKLQogCWhlaWdodCA9
IEFMSUdOKG1vZGVfY21kLT5oZWlnaHQsIDgpOwogCXNpemUgPSBtb2RlX2NtZC0+cGl0Y2hlc1sw
XSAqIGhlaWdodDsKIAlhbGlnbmVkX3NpemUgPSBBTElHTihzaXplLCBQQUdFX1NJWkUpOwogCXJl
dCA9IGFtZGdwdV9nZW1fb2JqZWN0X2NyZWF0ZShhZGV2LCBhbGlnbmVkX3NpemUsIDAsIGRvbWFp
biwKIAkJCQkgICAgICAgQU1ER1BVX0dFTV9DUkVBVEVfQ1BVX0FDQ0VTU19SRVFVSVJFRCB8Ci0J
CQkJICAgICAgIEFNREdQVV9HRU1fQ1JFQVRFX1ZSQU1fQ09OVElHVU9VUyB8Ci0JCQkJICAgICAg
IEFNREdQVV9HRU1fQ1JFQVRFX1ZSQU1fQ0xFQVJFRCwKKwkJCQkgICAgICAgQU1ER1BVX0dFTV9D
UkVBVEVfVlJBTV9DT05USUdVT1VTICAgICB8CisJCQkJICAgICAgIEFNREdQVV9HRU1fQ1JFQVRF
X1ZSQU1fQ0xFQVJFRCAJICAgICB8CisJCQkJICAgICAgIEFNREdQVV9HRU1fQ1JFQVRFX0NQVV9H
VFRfVVNXQywKIAkJCQkgICAgICAgdHRtX2JvX3R5cGVfa2VybmVsLCBOVUxMLCAmZ29iaik7CiAJ
aWYgKHJldCkgewogCQlwcl9lcnIoImZhaWxlZCB0byBhbGxvY2F0ZSBmcmFtZWJ1ZmZlciAoJWQp
XG4iLCBhbGlnbmVkX3NpemUpOwpAQCAtMTY2LDYgKzE2NiwxNCBAQCBzdGF0aWMgaW50IGFtZGdw
dWZiX2NyZWF0ZV9waW5uZWRfb2JqZWN0KHN0cnVjdCBhbWRncHVfZmJkZXYgKnJmYmRldiwKIAkJ
CWRldl9lcnIoYWRldi0+ZGV2LCAiRkIgZmFpbGVkIHRvIHNldCB0aWxpbmcgZmxhZ3NcbiIpOwog
CX0KIAorCS8qCisJICogSWYgdGhlIEFNREdQVV9HRU1fQ1JFQVRFX0NQVV9HVFRfVVNXQyBmbGFn
IHdhcyByZW1vdmVkIGR1cmluZyBCTworCSAqIGNyZWF0aW9uIGl0IG1lYW5zIHRoYXQgVVNXQyBp
cyBub3Qgc3VwcG9ydGVkIGZvciB0aGlzIGJvYXJkIGFuZAorCSAqIHNvIHRvIGF2b2lkIGhhbmcg
Y2F1c2VkIGJ5IHBsYWNlbWVudCBvZiBzY2Fub3V0IEJPIGluIEdUVCBvbiBjZXJ0YWluCisJICog
QVBVcyBhbmQgc3RpbGwgbGlnaHQgdXAsIGZvcmNlIHRoZSBCTyBwbGFjZW1lbnQgdG8gVlJBTS4K
KwkgKi8KKwlpZiAoYWJvLT5mbGFncyAmIH5BTURHUFVfR0VNX0NSRUFURV9DUFVfR1RUX1VTV0Mp
CisJCWRvbWFpbiAgPSBBTURHUFVfR0VNX0RPTUFJTl9WUkFNOwogCiAJcmV0ID0gYW1kZ3B1X2Jv
X3BpbihhYm8sIGRvbWFpbik7CiAJaWYgKHJldCkgewpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2dlbS5jCmluZGV4IDJjZWFkNWEuLmIzYjNiODkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZ2VtLmMKQEAgLTc0Myw3ICs3NDMsOCBAQCBpbnQgYW1kZ3B1X21vZGVf
ZHVtYl9jcmVhdGUoc3RydWN0IGRybV9maWxlICpmaWxlX3ByaXYsCiAJc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYgPSBkZXYtPmRldl9wcml2YXRlOwogCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAq
Z29iajsKIAl1aW50MzJfdCBoYW5kbGU7Ci0JdTY0IGZsYWdzID0gQU1ER1BVX0dFTV9DUkVBVEVf
Q1BVX0FDQ0VTU19SRVFVSVJFRDsKKwl1NjQgZmxhZ3MgPSBBTURHUFVfR0VNX0NSRUFURV9DUFVf
QUNDRVNTX1JFUVVJUkVEIHwKKwkJICAgIEFNREdQVV9HRU1fQ1JFQVRFX0NQVV9HVFRfVVNXQzsK
IAl1MzIgZG9tYWluOwogCWludCByOwogCkBAIC03NjEsNiArNzYyLDcgQEAgaW50IGFtZGdwdV9t
b2RlX2R1bWJfY3JlYXRlKHN0cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2LAogCWFyZ3MtPnNpemUg
PSBBTElHTihhcmdzLT5zaXplLCBQQUdFX1NJWkUpOwogCWRvbWFpbiA9IGFtZGdwdV9ib19nZXRf
cHJlZmVycmVkX3Bpbl9kb21haW4oYWRldiwKIAkJCQlhbWRncHVfZGlzcGxheV9zdXBwb3J0ZWRf
ZG9tYWlucyhhZGV2KSk7CisKIAlyID0gYW1kZ3B1X2dlbV9vYmplY3RfY3JlYXRlKGFkZXYsIGFy
Z3MtPnNpemUsIDAsIGRvbWFpbiwgZmxhZ3MsCiAJCQkJICAgICB0dG1fYm9fdHlwZV9kZXZpY2Us
IE5VTEwsICZnb2JqKTsKIAlpZiAocikKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
