Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1979DA36BE
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Aug 2019 14:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0F26E315;
	Fri, 30 Aug 2019 12:25:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730077.outbound.protection.outlook.com [40.107.73.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B1626E313
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Aug 2019 12:25:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVKTf7js/tUsI2CJ3mkzYtMAHF2EQ/felqY9wBJezy7yFEWEKQffSZLFID3n9HmArsWYb947s3aUdPFC2ZQNTRsbP4jPlBuGxgaoNwkNt4iIp6N1huSGoUc3Sny2VYFf+GQGjJoA3scPUP280ZIBNRH24yw+nAQJBT2S4eGPl8aJNUfISyDcimBMPhQ224NcjfQ70zkHT+XxSMcRFNNulCxfX5tDOlz33+/vKdQ67pwVAtmAX1xE5CqdFJ1aeTvghOiHBuuAYlbZgnrjYKQbWTawkQP/O8+IEDpYDSqayUKeg1scCjDJKExf3yCU3s45pY3AaXy+5ocgRNI9MfVvrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PfEzY9Q1L6qZZBZ5W6emJb8BlBlA1HN8qN7RxLb+XT4=;
 b=jkXXk/nfy/hGIwbkwJnczwn3OJZtd4kHpJrDSqrXF61qo5kiIm0p4i7TSTjIxkdQnGzTNjrh5octqgbqj0d4k6GYNFhgQEB3Cjk8f/+npxR4F7lWxMtC5UgGR/XVU4E+xYZF/BgO4miGmpmfTwSkjDgUfvK1ywb1SpMug7322yJhFHgLR6r9z1rZiMMXVaPE8PmqOEVhYsiLzvK4mgKw7fOjZtesry1t81jRGh4da0iCdDBgqQ77aAc0X6WkRfe+vyfkZgg5Z8K6VfL+aNZ+gOnotQF88Fdp0V6nPSD6Eg0sX2e/6hifZX2pi+YGK/iCfnuR+eLs3XNlLFOTTFz3gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0109.namprd12.prod.outlook.com (2603:10b6:0:55::29) by
 DM6PR12MB3833.namprd12.prod.outlook.com (2603:10b6:5:1c7::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Fri, 30 Aug 2019 12:25:49 +0000
Received: from CO1NAM03FT043.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by DM3PR12CA0109.outlook.office365.com
 (2603:10b6:0:55::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.19 via Frontend
 Transport; Fri, 30 Aug 2019 12:25:49 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT043.mail.protection.outlook.com (10.152.81.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Fri, 30 Aug 2019 12:25:48 +0000
Received: from taozhou1u2.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Fri, 30 Aug 2019
 07:25:47 -0500
From: Tao Zhou <tao.zhou1@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <andrey.grodzovsky@amd.com>,
 <guchun.chen@amd.com>, <dennis.li@amd.com>, <hawking.zhang@amd.com>
Subject: [PATCH 3/4] drm/amdgpu: save umc error records
Date: Fri, 30 Aug 2019 20:24:52 +0800
Message-ID: <20190830122453.19703-4-tao.zhou1@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190830122453.19703-1-tao.zhou1@amd.com>
References: <20190830122453.19703-1-tao.zhou1@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(396003)(136003)(2980300002)(428003)(189003)(199004)(76176011)(336012)(426003)(70586007)(70206006)(126002)(16586007)(11346002)(446003)(36756003)(186003)(316002)(86362001)(5660300002)(53936002)(486006)(356004)(53416004)(478600001)(4326008)(476003)(2906002)(2616005)(81166006)(81156014)(47776003)(2201001)(26005)(8936002)(8676002)(50226002)(6666004)(50466002)(1076003)(48376002)(51416003)(110136005)(305945005)(7696005)(6636002)(79990200002)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3833; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b179cce8-196d-46bd-3c08-08d72d4530d1
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM6PR12MB3833; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB3833:
X-Microsoft-Antispam-PRVS: <DM6PR12MB383368B1274E0975C4850C1AB0BD0@DM6PR12MB3833.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:480;
X-Forefront-PRVS: 0145758B1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: dDWcKizKkH+uDQJDCMJVUk5Ql+dF2b9pxeQrsV6n0D0QeIWFiJJiUQvk01McczI+xC1LoNubeeSTzHDbw3/xdAbJpsYmqtxcniOngXkA5MjFX1PGE0zpZUb9+c2Bt6tNYRtZxKW/jKF6QYU21DxdeeKlnfrdXw/OvetNyOGZGLzYydtXEq12G0YTEXDJc+NJvMuIooQ42tX8rHdZhLB/qOI0tXLf/vtz/07FSyk5JCbM8AMkGk1Mv7GtQ6/5BleOO1RvPivYLUexDi0LYLV4JWBGiHhN3jHUUPCFoPJXuWuYlcQfnNzgFoenN3xcnJFaNj+8U2NXjTTWSjsuyb14I4kD8QemYbJ4afAFKQe42iHy13hQICkQ3gS7Sv0EAp0vfGQ5dQpkQpDenZB+nRG+yKIu6oKNLvHjpFo9vRXvPPNi6HINeSbB/x+DE9+ySUgfbFW8ozD/qDUp65gpgZr3nA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2019 12:25:48.9335 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b179cce8-196d-46bd-3c08-08d72d4530d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3833
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PfEzY9Q1L6qZZBZ5W6emJb8BlBlA1HN8qN7RxLb+XT4=;
 b=r6/UBWou7hfpRDOgMjaVdOpBWSSKqH+Hlt1jIyikgAATeKr9eOFBZbaOci/rLpTE9iX5WQswMFpluGStTJKLLtdrasYDlCP5quR0dv9iBBo5YGaU9n8vyzrefKlSx3lG2l3upKz5J/YYKXN2Y2CtTBq8Z2PwEdtSSDV41L5idV4=
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
Cc: Tao Zhou <tao.zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

c2F2ZSB1bWMgZXJyb3IgcmVjb3JkcyB0byByYXMgYmFkIHBhZ2UgYXJyYXkKCnYyOiBhZGQgYmFk
IHBhZ2VzIGJlZm9yZSBncHUgcmVzZXQKClNpZ25lZC1vZmYtYnk6IFRhbyBaaG91IDx0YW8uemhv
dTFAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9k
em92c2t5QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jh
cy5oIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgICB8IDI5
ICsrKysrKysrKysrKysrLS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdW1jX3Y2XzEu
YyAgIHwgMzkgKysrKysrKysrKysrKysrKysrKystLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCA1NyBp
bnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcmFzLmgKaW5kZXggYjZiYWM4NzNjNTg4Li40MmUxZDM3OWUyMWMgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaAorKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmgKQEAgLTM0Nyw3ICszNDcsNyBAQCBzdHJ1Y3Qg
cmFzX2Vycl9kYXRhIHsKIAl1bnNpZ25lZCBsb25nIHVlX2NvdW50OwogCXVuc2lnbmVkIGxvbmcg
Y2VfY291bnQ7CiAJdW5zaWduZWQgbG9uZyBlcnJfYWRkcl9jbnQ7Ci0JdWludDY0X3QgKmVycl9h
ZGRyOworCXN0cnVjdCBlZXByb21fdGFibGVfcmVjb3JkICplcnJfYWRkcjsKIH07CiAKIHN0cnVj
dCByYXNfZXJyX2hhbmRsZXJfZGF0YSB7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nbWNfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAu
YwppbmRleCA3MGEwNWUzMDJkNjAuLjUwMTVhMDdkY2IzYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nbWNfdjlfMC5jCkBAIC0yNDYsMTYgKzI0NiwzNSBAQCBzdGF0aWMgaW50IGdtY192OV8w
X3Byb2Nlc3NfcmFzX2RhdGFfY2Ioc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJa2dkMmtm
ZF9zZXRfc3JhbV9lY2NfZmxhZyhhZGV2LT5rZmQuZGV2KTsKIAlpZiAoYWRldi0+dW1jLmZ1bmNz
LT5xdWVyeV9yYXNfZXJyb3JfY291bnQpCiAJCWFkZXYtPnVtYy5mdW5jcy0+cXVlcnlfcmFzX2Vy
cm9yX2NvdW50KGFkZXYsIGVycl9kYXRhKTsKLQkvKiB1bWMgcXVlcnlfcmFzX2Vycm9yX2FkZHJl
c3MgaXMgYWxzbyByZXNwb25zaWJsZSBmb3IgY2xlYXJpbmcKLQkgKiBlcnJvciBzdGF0dXMKLQkg
Ki8KLQlpZiAoYWRldi0+dW1jLmZ1bmNzLT5xdWVyeV9yYXNfZXJyb3JfYWRkcmVzcykKKworCWlm
IChhZGV2LT51bWMuZnVuY3MtPnF1ZXJ5X3Jhc19lcnJvcl9hZGRyZXNzICYmCisJCWFkZXYtPnVt
Yy5tYXhfcmFzX2Vycl9jbnRfcGVyX3F1ZXJ5KSB7CisJCWVycl9kYXRhLT5lcnJfYWRkciA9CisJ
CQlrY2FsbG9jKGFkZXYtPnVtYy5tYXhfcmFzX2Vycl9jbnRfcGVyX3F1ZXJ5LAorCQkJCXNpemVv
ZihzdHJ1Y3QgZWVwcm9tX3RhYmxlX3JlY29yZCksIEdGUF9LRVJORUwpOworCQkvKiBzdGlsbCBj
YWxsIHF1ZXJ5X3Jhc19lcnJvcl9hZGRyZXNzIHRvIGNsZWFyIGVycm9yIHN0YXR1cworCQkgKiBl
dmVuIE5PTUVNIGVycm9yIGlzIGVuY291bnRlcmVkCisJCSAqLworCQlpZighZXJyX2RhdGEtPmVy
cl9hZGRyKQorCQkJRFJNX1dBUk4oIkZhaWxlZCB0byBhbGxvYyBtZW1vcnkgZm9yIHVtYyBlcnJv
ciBhZGRyZXNzIHJlY29yZCFcbiIpOworCisJCS8qIHVtYyBxdWVyeV9yYXNfZXJyb3JfYWRkcmVz
cyBpcyBhbHNvIHJlc3BvbnNpYmxlIGZvciBjbGVhcmluZworCQkgKiBlcnJvciBzdGF0dXMKKwkJ
ICovCiAJCWFkZXYtPnVtYy5mdW5jcy0+cXVlcnlfcmFzX2Vycm9yX2FkZHJlc3MoYWRldiwgZXJy
X2RhdGEpOworCX0KIAogCS8qIG9ubHkgdW5jb3JyZWN0YWJsZSBlcnJvciBuZWVkcyBncHUgcmVz
ZXQgKi8KLQlpZiAoZXJyX2RhdGEtPnVlX2NvdW50KQorCWlmIChlcnJfZGF0YS0+dWVfY291bnQp
IHsKKwkJaWYgKGVycl9kYXRhLT5lcnJfYWRkcl9jbnQgJiYKKwkJCWFtZGdwdV9yYXNfYWRkX2Jh
ZF9wYWdlcyhhZGV2LCBlcnJfZGF0YS0+ZXJyX2FkZHIsCisJCQkJCQllcnJfZGF0YS0+ZXJyX2Fk
ZHJfY250KSkKKwkJCURSTV9XQVJOKCJGYWlsZWQgdG8gYWRkIHJhcyBiYWQgcGFnZSFcbiIpOwor
CiAJCWFtZGdwdV9yYXNfcmVzZXRfZ3B1KGFkZXYsIDApOworCX0KIAorCWtmcmVlKGVycl9kYXRh
LT5lcnJfYWRkcik7CiAJcmV0dXJuIEFNREdQVV9SQVNfU1VDQ0VTUzsKIH0KIApkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdW1jX3Y2XzEuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3VtY192Nl8xLmMKaW5kZXggODUwMmU3MzZmNzIxLi5hNTRmZjE3MDU5MWYg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8xLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdW1jX3Y2XzEuYwpAQCAtNzUsNiArNzUsMTcgQEAg
c3RhdGljIHZvaWQgdW1jX3Y2XzFfZGlzYWJsZV91bWNfaW5kZXhfbW9kZShzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldikKIAkJCVJTTVVfVU1DX0lOREVYX01PREVfRU4sIDApOwogfQogCitzdGF0
aWMgdWludDMyX3QgdW1jX3Y2XzFfZ2V0X3VtY19pbnN0KHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KQoreworCXVpbnQzMl90IHJzbXVfdW1jX2luZGV4OworCisJcnNtdV91bWNfaW5kZXggPSBS
UkVHMzJfU09DMTUoUlNNVSwgMCwKKwkJCW1tUlNNVV9VTUNfSU5ERVhfUkVHSVNURVJfTkJJRl9W
RzIwX0dQVSk7CisJcmV0dXJuIFJFR19HRVRfRklFTEQocnNtdV91bWNfaW5kZXgsCisJCQkJUlNN
VV9VTUNfSU5ERVhfUkVHSVNURVJfTkJJRl9WRzIwX0dQVSwKKwkJCQlSU01VX1VNQ19JTkRFWF9J
TlNUQU5DRSk7Cit9CisKIHN0YXRpYyB2b2lkIHVtY192Nl8xX3F1ZXJ5X2NvcnJlY3RhYmxlX2Vy
cm9yX2NvdW50KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQkJCQkJICAgdWludDMyX3Qg
dW1jX3JlZ19vZmZzZXQsCiAJCQkJCQkgICB1bnNpZ25lZCBsb25nICplcnJvcl9jb3VudCkKQEAg
LTE2NSw3ICsxNzYsOCBAQCBzdGF0aWMgdm9pZCB1bWNfdjZfMV9xdWVyeV9lcnJvcl9hZGRyZXNz
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQkJCQkgdWludDMyX3QgdW1jX3JlZ19vZmZz
ZXQsIHVpbnQzMl90IGNoYW5uZWxfaW5kZXgpCiB7CiAJdWludDMyX3QgbHNiLCBtY191bWNfc3Rh
dHVzX2FkZHI7Ci0JdWludDY0X3QgbWNfdW1jX3N0YXR1cywgZXJyX2FkZHI7CisJdWludDY0X3Qg
bWNfdW1jX3N0YXR1cywgZXJyX2FkZHIsIHJldGlyZWRfcGFnZTsKKwlzdHJ1Y3QgZWVwcm9tX3Rh
YmxlX3JlY29yZCAqZXJyX3JlYzsKIAogCW1jX3VtY19zdGF0dXNfYWRkciA9CiAJCVNPQzE1X1JF
R19PRkZTRVQoVU1DLCAwLCBtbU1DQV9VTUNfVU1DMF9NQ1VNQ19TVEFUVVNUMCk7CkBAIC0xNzcs
NiArMTg5LDcgQEAgc3RhdGljIHZvaWQgdW1jX3Y2XzFfcXVlcnlfZXJyb3JfYWRkcmVzcyhzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJcmV0dXJuOwogCX0KIAorCWVycl9yZWMgPSAmZXJy
X2RhdGEtPmVycl9hZGRyW2Vycl9kYXRhLT5lcnJfYWRkcl9jbnRdOwogCW1jX3VtY19zdGF0dXMg
PSBSUkVHNjRfVU1DKG1jX3VtY19zdGF0dXNfYWRkciArIHVtY19yZWdfb2Zmc2V0KTsKIAogCS8q
IGNhbGN1bGF0ZSBlcnJvciBhZGRyZXNzIGlmIHVlL2NlIGVycm9yIGlzIGRldGVjdGVkICovCkBA
IC0xOTEsMTIgKzIwNCwyNCBAQCBzdGF0aWMgdm9pZCB1bWNfdjZfMV9xdWVyeV9lcnJvcl9hZGRy
ZXNzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQllcnJfYWRkciAmPSB+KCgweDFVTEwg
PDwgbHNiKSAtIDEpOwogCiAJCS8qIHRyYW5zbGF0ZSB1bWMgY2hhbm5lbCBhZGRyZXNzIHRvIHNv
YyBwYSwgMyBwYXJ0cyBhcmUgaW5jbHVkZWQgKi8KLQkJZXJyX2RhdGEtPmVycl9hZGRyW2Vycl9k
YXRhLT5lcnJfYWRkcl9jbnRdID0KLQkJCQkJCUFERFJfT0ZfOEtCX0JMT0NLKGVycl9hZGRyKSB8
Ci0JCQkJCQlBRERSX09GXzI1NkJfQkxPQ0soY2hhbm5lbF9pbmRleCkgfAotCQkJCQkJT0ZGU0VU
X0lOXzI1NkJfQkxPQ0soZXJyX2FkZHIpOwotCi0JCWVycl9kYXRhLT5lcnJfYWRkcl9jbnQrKzsK
KwkJcmV0aXJlZF9wYWdlID0gQUREUl9PRl84S0JfQkxPQ0soZXJyX2FkZHIpIHwKKwkJCQlBRERS
X09GXzI1NkJfQkxPQ0soY2hhbm5lbF9pbmRleCkgfAorCQkJCU9GRlNFVF9JTl8yNTZCX0JMT0NL
KGVycl9hZGRyKTsKKworCQkvKiB3ZSBvbmx5IHNhdmUgdWUgZXJyb3IgaW5mb3JtYXRpb24gY3Vy
cmVudGx5LCBjZSBpcyBza2lwcGVkICovCisJCWlmIChSRUdfR0VUX0ZJRUxEKG1jX3VtY19zdGF0
dXMsIE1DQV9VTUNfVU1DMF9NQ1VNQ19TVEFUVVNUMCwgVUVDQykKKwkJCQk9PSAxKSB7CisJCQll
cnJfcmVjLT5hZGRyZXNzID0gZXJyX2FkZHI7CisJCQkvKiBwYWdlIGZyYW1lIGFkZHJlc3MgaXMg
c2F2ZWQgKi8KKwkJCWVycl9yZWMtPnJldGlyZWRfcGFnZSA9IHJldGlyZWRfcGFnZSA+PiBQQUdF
X1NISUZUOworCQkJZXJyX3JlYy0+dHMgPSAodWludDY0X3Qpa3RpbWVfZ2V0X3JlYWxfc2Vjb25k
cygpOworCQkJZXJyX3JlYy0+ZXJyX3R5cGUgPSBBTURHUFVfUkFTX0VFUFJPTV9FUlJfTk9OX1JF
Q09WRVJBQkxFOworCQkJZXJyX3JlYy0+Y3UgPSAwOworCQkJZXJyX3JlYy0+bWVtX2NoYW5uZWwg
PSBjaGFubmVsX2luZGV4OworCQkJZXJyX3JlYy0+bWN1bWNfaWQgPSB1bWNfdjZfMV9nZXRfdW1j
X2luc3QoYWRldik7CisKKwkJCWVycl9kYXRhLT5lcnJfYWRkcl9jbnQrKzsKKwkJfQogCX0KIAog
CS8qIGNsZWFyIHVtYyBzdGF0dXMgKi8KLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
