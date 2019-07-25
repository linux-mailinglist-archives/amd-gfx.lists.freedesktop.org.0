Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B97750F7
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 16:25:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A746E46F;
	Thu, 25 Jul 2019 14:25:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam05on061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe50::61c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F3E6E46F
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 14:25:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MSukFu58QfoxU8I0S0h7X9pQnd6M08sbB9aPO5tVH0JtXa9mstnD1j92vdZJ4JW0jlNK+Q2WYOndcDL0H5tkHKi5fTSbMKl08cp5CH7FAuEHt5yex4H9RYW+pRfAqrxriOrQRxl5jmPxgg/y0mVLkhx43LeweYXyqfjhXdB9haTV6+jE1PEXt/4CERdx0yrCArW9BHMG5FVyL4MWfTYhGyKSdY1ny3rQtG9WpmjBNagyhc7A6awKLydDxpRjYQ6HniuGEn+QGcwe+7BPGJpGWe/F2E9d0OswR4k2GnrohwUhIL0/WdbXjEwOejTNSb9cicofKC9UYR3zkNQROvTgng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=caZYx07bgAGDEPlvUy5WVCZ5usahaGpkuayt0QLbzic=;
 b=mDvZmOzc9DltL/O//R3L+Zg/cYBsX/KttA0+tsr5YwzsZMD+KotkoEXe8C1nhASl3DD2eTpgyn8zDEJUHwwm+NXuSETAdYazM/Hb5tJRjazL7twvmJXGdhFwgLKcgtlmXj7nrSDxt51WjbAIL5awj2UxYKb3EGd7m8LCXd9O61GJ7NNfMlPkJDh9JT5flISLAVCT5kJjx2yfuqc9gqxMxX1eXAlt99UU+tRtxcOwlWpL49gPM5P8h5SwYkYwWrkTfmfUmXGqcIZm4itStFxJ7ikjDVJCz5g1dEQIugARB/5b4VzDb/hmUyzgNIopjI6XaSK9t7qjXoKTs/aeCW6EAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=daenzer.net
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from BN6PR12CA0040.namprd12.prod.outlook.com (2603:10b6:405:70::26)
 by MWHPR12MB1311.namprd12.prod.outlook.com (2603:10b6:300:13::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.17; Thu, 25 Jul
 2019 14:25:05 +0000
Received: from CO1NAM03FT061.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by BN6PR12CA0040.outlook.office365.com
 (2603:10b6:405:70::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.14 via Frontend
 Transport; Thu, 25 Jul 2019 14:25:05 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT061.mail.protection.outlook.com (10.152.81.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2115.10 via Frontend Transport; Thu, 25 Jul 2019 14:25:04 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Thu, 25 Jul 2019 09:25:02 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v5 1/4] drm/amdgpu: Fix hard hang for S/G display BOs.
Date: Thu, 25 Jul 2019 10:24:40 -0400
Message-ID: <1564064683-31796-2-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564064683-31796-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1564064683-31796-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(136003)(39860400002)(2980300002)(428003)(199004)(189003)(53936002)(446003)(50466002)(5660300002)(48376002)(305945005)(4326008)(7696005)(51416003)(356004)(68736007)(70586007)(86362001)(126002)(426003)(478600001)(36756003)(47776003)(6666004)(476003)(70206006)(81156014)(2906002)(50226002)(14444005)(316002)(2351001)(336012)(16586007)(11346002)(2616005)(26005)(6916009)(186003)(76176011)(8936002)(8676002)(44832011)(81166006)(486006)(53416004)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1311; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cac2c780-d974-4bc9-ee00-08d7110be2bc
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1311; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1311:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1311B8E6A8D807D90211E628EAC10@MWHPR12MB1311.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0109D382B0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: HRYOnP+r/H2snmVrwWsvKC2A0nEYBX8WK8d3nB8WjQEURKl9DY1GKpoUirFev6ZcbmZdrD4iNjhNri37G+dBGeFBj5aaytMDQpjHX15GKe0099fJ0TdCO1Qtf6tUiXgpJmQXDTu19Nez1sxDfu3mAG5jhwoJH699w8NTaNzKh7NzaS2okiqJE0WyWf1VR3j9PxBlE9SlbAQJ7jdfpf8jmh1zGKbW13jomeDjk/nNtfxUa3MmxJxvVHMXFO4E3QpZTG2025qf4AL0P05tpxiAgEePerIKJ/IiL4QutUJkHDZim7FVahC+gzyZoqxRAJd2H4YKKE/GLoHKmGD8nXhLVW1MXTPwhQmn0TzHe34hn50N/N2SvQkHK9EVNguONv68aRQVJYPfPAvPXujlP2O0rNVITHP/qIL0nKrnW1k5qNk=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2019 14:25:04.0527 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cac2c780-d974-4bc9-ee00-08d7110be2bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1311
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=caZYx07bgAGDEPlvUy5WVCZ5usahaGpkuayt0QLbzic=;
 b=v7EVveL55colqiiSrmDEoCZlrEqC98iL/uhb29uGvaHOdnv+Sp+dkt+I6JXcbEeO2M1/81w59B2GEPsYmZjQhtm//LExMA8qKmJzo6Fvz7+P8407b1GXXb8LR4nxleeeUHIz6lBfcW0GJvcxoNeOvRTB9BetpV9Y2y1M9L4Zy3k=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; daenzer.net; dkim=none (message not signed)
 header.d=none;daenzer.net; dmarc=permerror action=none header.from=amd.com;
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
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>, michel@daenzer.net,
 shirish.s@amd.com, hersenxs.wu@amd.com, Alexander.Deucher@amd.com,
 Christian.Koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SFcgcmVxdWlyZXMgZm9yIGNhY2hpbmcgdG8gYmUgdW5zZXQgZm9yIHNjYW5vdXQgQk8KbWFwcGlu
Z3Mgd2hlbiB0aGUgQk8gcGxhY2VtZW50IGlzIGluIEdUVCBtZW1vcnkuClVzdWFsbHkgdGhlIGZs
YWcgdG8gdW5zZXQgaXMgcGFzc2VkIGZyb20gdXNlciBtb2RlCmJ1dCBmb3IgRkIgbW9kZSB0aGlz
IHdhcyBtaXNzaW5nLgoKdjI6CktlZXAgYWxsIEJPIHBsYWNlbWVudCBsb2dpYyBpbiBhbWRncHVf
ZGlzcGxheV9zdXBwb3J0ZWRfZG9tYWlucwoKU3VnZ2VzdGVkLWJ5OiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92c2t5
IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpUZXN0ZWQtYnk6IFNoaXJpc2ggUyA8c2hpcmlzaC5z
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZiLmMgIHwg
NyArKystLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMgfCAzICsr
LQogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZiLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZmIuYwppbmRleCBlNDc2MDkyLi5iZjBjNjFiIDEw
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
XG4iLCBhbGlnbmVkX3NpemUpOwpAQCAtMTY2LDcgKzE2Niw2IEBAIHN0YXRpYyBpbnQgYW1kZ3B1
ZmJfY3JlYXRlX3Bpbm5lZF9vYmplY3Qoc3RydWN0IGFtZGdwdV9mYmRldiAqcmZiZGV2LAogCQkJ
ZGV2X2VycihhZGV2LT5kZXYsICJGQiBmYWlsZWQgdG8gc2V0IHRpbGluZyBmbGFnc1xuIik7CiAJ
fQogCi0KIAlyZXQgPSBhbWRncHVfYm9fcGluKGFibywgZG9tYWluKTsKIAlpZiAocmV0KSB7CiAJ
CWFtZGdwdV9ib191bnJlc2VydmUoYWJvKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9nZW0uYwppbmRleCAyY2VhZDVhLi5lZWVkMDg5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2dlbS5jCkBAIC03NDMsNyArNzQzLDggQEAgaW50IGFtZGdwdV9tb2RlX2R1bWJf
Y3JlYXRlKHN0cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2LAogCXN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2ID0gZGV2LT5kZXZfcHJpdmF0ZTsKIAlzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmdvYmo7
CiAJdWludDMyX3QgaGFuZGxlOwotCXU2NCBmbGFncyA9IEFNREdQVV9HRU1fQ1JFQVRFX0NQVV9B
Q0NFU1NfUkVRVUlSRUQ7CisJdTY0IGZsYWdzID0gQU1ER1BVX0dFTV9DUkVBVEVfQ1BVX0FDQ0VT
U19SRVFVSVJFRCB8CisJCSAgICBBTURHUFVfR0VNX0NSRUFURV9DUFVfR1RUX1VTV0M7CiAJdTMy
IGRvbWFpbjsKIAlpbnQgcjsKIAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
