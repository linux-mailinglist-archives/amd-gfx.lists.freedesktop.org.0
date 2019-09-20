Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1395B8B49
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Sep 2019 08:57:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC656EA2D;
	Fri, 20 Sep 2019 06:57:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800070.outbound.protection.outlook.com [40.107.80.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1BB6EA2D
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Sep 2019 06:57:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yk7Gohsm10sVYTNt7EZC7y1nsoAVj36GiS/+M8WHQ4sT2UNY6idfHdAAsmGEzjKOwAcF8qTpHgno8ZWXfmfrsj5NlXWZgXIEU47/7L/0jQ6jkd06UgJ2OkuHTNuqA1rBpvO+mltsIICRTrawkCGQKkhhv7oZXR5exaD8ixAzc6T6RfMIdJfoYgUDPU3r8W3Cqmoy3v0e0celIUoSs1/sxd0JwRV6f9IJNdQuMiiWO2crzzhkUDy84Iaqbcpm5pLaQuADDK1jND+J1CWAtVgZ+KtRCl///roMqZ+ezLVDfQlivl6pJJbzcjlTqY/vRt9W/bNc1C+zmOTpdg+ZvhBrSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRwhg765LL/aB2tFNhuGZFLM6Navsc3tN8yqJG//p8s=;
 b=M4mRNRTvehgteBMrCVt83GupvIZg1VVRjDhBYJZmHgSl7m/Uqs2DDVU1caJhWTFXKoauCOt6XrJMUW3h9SPxNigNnRbNp6aRy6889av90c5t+1Juf+pShESO2b58hNb6wGJIx7dX2BqPKBZCOnt7qkEG/7PRtH5RmA4+5hmRiC1flCkOpPzTmUS+CNrhH0jpZgr/mt+tKnDM8ZHFexxIR5lbkLQzK3AaEW9TVYa1DoQzKj4VdJC0H16yhlZAU56dQUgGtt3EKl3KNR+OLNQHabyyeDOE6j5M/bBq4D3fnIZhgKteDNys7Fgq1rGW2K6T1GgGySVGjYZYjC6EIKssyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR12CA0045.namprd12.prod.outlook.com (2603:10b6:903:129::31)
 by BYAPR12MB3526.namprd12.prod.outlook.com (2603:10b6:a03:13c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.21; Fri, 20 Sep
 2019 06:57:36 +0000
Received: from BY2NAM03FT023.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::203) by CY4PR12CA0045.outlook.office365.com
 (2603:10b6:903:129::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2284.21 via Frontend
 Transport; Fri, 20 Sep 2019 06:57:36 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT023.mail.protection.outlook.com (10.152.84.226) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2284.20 via Frontend Transport; Fri, 20 Sep 2019 06:57:35 +0000
Received: from Build-machine.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Fri, 20 Sep 2019 01:57:34 -0500
From: Jesse Zhang <zhexi.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v8] drm/amd/amdgpu:Fix compute ring unable to detect hang.
Date: Fri, 20 Sep 2019 14:57:17 +0800
Message-ID: <1568962637-26150-1-git-send-email-zhexi.zhang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568947109-5924-1-git-send-email-zhexi.zhang@amd.com>
References: <1568947109-5924-1-git-send-email-zhexi.zhang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(136003)(346002)(396003)(428003)(189003)(199004)(16586007)(7696005)(2616005)(476003)(486006)(6666004)(6916009)(8676002)(14444005)(426003)(50226002)(53416004)(2351001)(2906002)(76176011)(47776003)(316002)(11346002)(70206006)(26005)(86362001)(70586007)(305945005)(5660300002)(50466002)(336012)(446003)(36756003)(81156014)(186003)(126002)(8936002)(478600001)(48376002)(51416003)(4326008)(81166006)(356004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3526; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da48f1e2-e872-447c-8f55-08d73d97d152
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BYAPR12MB3526; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB3526:
X-Microsoft-Antispam-PRVS: <BYAPR12MB3526C154FBB97FC3B82766F0EF880@BYAPR12MB3526.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 0166B75B74
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: jp2uYCFEeeTcfTvFy01/QsyPepVaO0Pi5m+xd2CoSomvkKIZndu2t0P+3LdRPlRrBPu3SGVBElxZp8IwGd/bu05rT+kwMdrBCfnB5VrT2XJGoUtykcV/fUTuu3Z5AYEPRmrvhxpDtFdk35Ek9HGz+03Goa7THYa3qrAxOkt7SgM3hEbszMP5S0KGEkHGTTNAsslRd7usbPPZco7+6qv4P/RFdV2jQqblOZA21PpVcoradM4TncpTMuAMUaJXHSwC9fb26r3ICDAsbPWlAtR4lJAuXSgdCdC1t+BcG5Kq6AeIAthPES9zYGGJ1Wq3xaUbxzOWFJMXcBulKCpOTctw4ye3g2T+IFC9jq3bxcjg5c6YlWu/wIl9rI3IEj5whqgzrTY3f1U1kcE82YFLloNgM3UxXW+Qu8KQZPHBLpZKeRU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2019 06:57:35.5788 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da48f1e2-e872-447c-8f55-08d73d97d152
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3526
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRwhg765LL/aB2tFNhuGZFLM6Navsc3tN8yqJG//p8s=;
 b=01RfzSqdD/FLfYG1J3OFR54ZuArfZ8lD+CsLtLRWSjNod3UE0l7XgiIY1qOCYLRTdsUy5Y8wg6EI83d6An3zVo4IKIJY2CCMEW2VjXhWMLZGl2lm6gNTjZATR2YoLSZSkNdXMJV9TeZ0BXZdvSzwpqWBc1/oBlsUC/DvEg6kpo8=
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
Cc: Jesse Zhang <zhexi.zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2hlbiBjb21wdXRlIGZlbmNlIGRpZCBub3Qgc2lnbmFsLCBjb21wdXRlIHJpbmcgY2Fubm90IGRl
dGVjdCBoYXJkd2FyZSBoYW5nCmJlY2F1c2UgaXRzIHRpbWVvdXQgdmFsdWUgaXMgc2V0IHRvIGJl
IGluZmluaXRlIGJ5IGRlZmF1bHQuCgpJbiBTUi1JT1YgYW5kIHBhc3N0aHJvdWdoIG1vZGUsIGlm
IHVzZXIgZG9lcyBub3QgZGVjbGFyZSBjdXN0b21lIHRpbWVvdXQKdmFsdWUgZm9yIGNvbXB1dGUg
cmluZywgdGhlbiB1c2UgZ2Z4IHJpbmcgdGltZW91dCB2YWx1ZSBhcyBkZWZhdWx0LiBTbwp0aGF0
IHdoZW4gdGhlcmUgaXMgYSB0dXJlIGhhcmR3YXJlIGhhbmcsIGNvbXB1dGUgcmluZyBjYW4gZGV0
ZWN0IGl0LgoKQ2hhbmdlLUlkOiBJNzk0ZWMwODY4YzZjMGFhZDQwNzc0OTQ1NzI2MGVjZmVlMDYx
N2MxMApTaWduZWQtb2ZmLWJ5OiBKZXNzZSBaaGFuZyA8emhleGkuemhhbmdAYW1kLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCAxMiArKysrKyst
LS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyAgICB8ICA3ICsr
KysrKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mZW5jZS5jICB8IDEzICst
LS0tLS0tLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rl
dmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCmluZGV4
IDNiNTI4MmIuLjAzYWM1YTFkYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kZXZpY2UuYwpAQCAtMTAyNCwxMiArMTAyNCw2IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2Rldmlj
ZV9jaGVja19hcmd1bWVudHMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAKIAlhbWRncHVf
ZGV2aWNlX2NoZWNrX2Jsb2NrX3NpemUoYWRldik7CiAKLQlyZXQgPSBhbWRncHVfZGV2aWNlX2dl
dF9qb2JfdGltZW91dF9zZXR0aW5ncyhhZGV2KTsKLQlpZiAocmV0KSB7Ci0JCWRldl9lcnIoYWRl
di0+ZGV2LCAiaW52YWxpZCBsb2NrdXBfdGltZW91dCBwYXJhbWV0ZXIgc3ludGF4XG4iKTsKLQkJ
cmV0dXJuIHJldDsKLQl9Ci0KIAlhZGV2LT5maXJtd2FyZS5sb2FkX3R5cGUgPSBhbWRncHVfdWNv
ZGVfZ2V0X2xvYWRfdHlwZShhZGV2LCBhbWRncHVfZndfbG9hZF90eXBlKTsKIAogCXJldHVybiBy
ZXQ7CkBAIC0yNzMyLDYgKzI3MjYsMTIgQEAgaW50IGFtZGdwdV9kZXZpY2VfaW5pdChzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwKIAlpZiAocikKIAkJcmV0dXJuIHI7CiAKKwlyID0gYW1kZ3B1
X2RldmljZV9nZXRfam9iX3RpbWVvdXRfc2V0dGluZ3MoYWRldik7CisJaWYgKHIpIHsKKwkJZGV2
X2VycihhZGV2LT5kZXYsICJpbnZhbGlkIGxvY2t1cF90aW1lb3V0IHBhcmFtZXRlciBzeW50YXhc
biIpOworCQlyZXR1cm4gcjsKKwl9CisKIAkvKiBkb29yYmVsbCBiYXIgbWFwcGluZyBhbmQgZG9v
cmJlbGwgaW5kZXggaW5pdCovCiAJYW1kZ3B1X2RldmljZV9kb29yYmVsbF9pbml0KGFkZXYpOwog
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKaW5kZXggNDIwODg4ZS4uOThi
ZTQ5YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwpAQCAtMTMzOCwx
MCArMTMzOCwxNSBAQCBpbnQgYW1kZ3B1X2RldmljZV9nZXRfam9iX3RpbWVvdXRfc2V0dGluZ3Mo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJLyoKIAkgKiBCeSBkZWZhdWx0IHRpbWVvdXQg
Zm9yIG5vbiBjb21wdXRlIGpvYnMgaXMgMTAwMDAuCiAJICogQW5kIHRoZXJlIGlzIG5vIHRpbWVv
dXQgZW5mb3JjZWQgb24gY29tcHV0ZSBqb2JzLgorCSAqIEluIFNSLUlPViBvciBwYXNzdGhyb3Vn
aCBtb2RlLCB0aW1lb3V0IGZvciBjb21wdXRlCisJICogam9icyBhcmUgMTAwMDAgYnkgZGVmYXVs
dC4KIAkgKi8KIAlhZGV2LT5nZnhfdGltZW91dCA9IG1zZWNzX3RvX2ppZmZpZXMoMTAwMDApOwog
CWFkZXYtPnNkbWFfdGltZW91dCA9IGFkZXYtPnZpZGVvX3RpbWVvdXQgPSBhZGV2LT5nZnhfdGlt
ZW91dDsKLQlhZGV2LT5jb21wdXRlX3RpbWVvdXQgPSBNQVhfU0NIRURVTEVfVElNRU9VVDsKKwlp
ZiAoYW1kZ3B1X3NyaW92X3ZmKGFkZXYpIHx8IGFtZGdwdV9wYXNzdGhyb3VnaChhZGV2KSkKKwkJ
YWRldi0+Y29tcHV0ZV90aW1lb3V0ID0gYWRldi0+Z2Z4X3RpbWVvdXQ7CisJZWxzZQorCQlhZGV2
LT5jb21wdXRlX3RpbWVvdXQgPSBNQVhfU0NIRURVTEVfVElNRU9VVDsKIAogCWlmIChzdHJubGVu
KGlucHV0LCBBTURHUFVfTUFYX1RJTUVPVVRfUEFSQU1fTEVOVEgpKSB7CiAJCXdoaWxlICgodGlt
ZW91dF9zZXR0aW5nID0gc3Ryc2VwKCZpbnB1dCwgIiwiKSkgJiYKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mZW5jZS5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2ZlbmNlLmMKaW5kZXggY2JjYWE3Yy4uOWVmNTNjYSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZlbmNlLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZlbmNlLmMKQEAgLTQ2MCwxOCArNDYwLDcgQEAg
aW50IGFtZGdwdV9mZW5jZV9kcml2ZXJfaW5pdF9yaW5nKHN0cnVjdCBhbWRncHVfcmluZyAqcmlu
ZywKIAkJCXRpbWVvdXQgPSBhZGV2LT5nZnhfdGltZW91dDsKIAkJCWJyZWFrOwogCQljYXNlIEFN
REdQVV9SSU5HX1RZUEVfQ09NUFVURToKLQkJCS8qCi0JCQkgKiBGb3Igbm9uLXNyaW92IGNhc2Us
IG5vIHRpbWVvdXQgZW5mb3JjZQotCQkJICogb24gY29tcHV0ZSByaW5nIGJ5IGRlZmF1bHQuIFVu
bGVzcyB1c2VyCi0JCQkgKiBzcGVjaWZpZXMgYSB0aW1lb3V0IGZvciBjb21wdXRlIHJpbmcuCi0J
CQkgKgotCQkJICogRm9yIHNyaW92IGNhc2UsIGFsd2F5cyB1c2UgdGhlIHRpbWVvdXQKLQkJCSAq
IGFzIGdmeCByaW5nCi0JCQkgKi8KLQkJCWlmICghYW1kZ3B1X3NyaW92X3ZmKHJpbmctPmFkZXYp
KQotCQkJCXRpbWVvdXQgPSBhZGV2LT5jb21wdXRlX3RpbWVvdXQ7Ci0JCQllbHNlCi0JCQkJdGlt
ZW91dCA9IGFkZXYtPmdmeF90aW1lb3V0OworCQkJdGltZW91dCA9IGFkZXYtPmNvbXB1dGVfdGlt
ZW91dDsKIAkJCWJyZWFrOwogCQljYXNlIEFNREdQVV9SSU5HX1RZUEVfU0RNQToKIAkJCXRpbWVv
dXQgPSBhZGV2LT5zZG1hX3RpbWVvdXQ7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
