Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 447C9FC8C
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 17:14:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BDD6891D5;
	Tue, 30 Apr 2019 15:14:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730076.outbound.protection.outlook.com [40.107.73.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411A5891D5
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 15:14:53 +0000 (UTC)
Received: from DM3PR12CA0129.namprd12.prod.outlook.com (2603:10b6:0:51::25) by
 MN2PR12MB3757.namprd12.prod.outlook.com (2603:10b6:208:163::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.10; Tue, 30 Apr
 2019 15:14:50 +0000
Received: from DM3NAM03FT034.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by DM3PR12CA0129.outlook.office365.com
 (2603:10b6:0:51::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Tue, 30 Apr 2019 15:14:50 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT034.mail.protection.outlook.com (10.152.82.192) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1835.14 via Frontend Transport; Tue, 30 Apr 2019 15:14:50 +0000
Received: from bb-VirtualBox.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Apr 2019
 10:14:48 -0500
From: Trigger Huang <Trigger.Huang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Rearm IRQ in Vega10 SR-IOV if IRQ lost
Date: Tue, 30 Apr 2019 23:14:44 +0800
Message-ID: <1556637284-715-1-git-send-email-Trigger.Huang@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(376002)(39860400002)(136003)(396003)(2980300002)(428003)(189003)(199004)(2351001)(6666004)(356004)(5660300002)(53416004)(70206006)(2906002)(14444005)(50466002)(478600001)(72206003)(77096007)(47776003)(48376002)(186003)(316002)(16586007)(86362001)(486006)(126002)(2616005)(426003)(336012)(26005)(476003)(8936002)(53936002)(97736004)(50226002)(81156014)(68736007)(81166006)(8676002)(6916009)(36756003)(70586007)(51416003)(7696005)(305945005)(4326008)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3757; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acc41484-b06d-406c-e1a9-08d6cd7e9709
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:MN2PR12MB3757; 
X-MS-TrafficTypeDiagnostic: MN2PR12MB3757:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3757CAD246CFB453313C9CBBFE3A0@MN2PR12MB3757.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-Forefront-PRVS: 00235A1EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: OtchNsHRVt7AbOMyw+qDOWxHMSZeylJzrtW+yk5FRGrO+5tnNG+QOwaGTpakFtiK0ENIsFAqbA/rSNB/qLELjaUdA/CzR+1bCPAOkO2s1k9om/rigXwfKLzN5bSPWHRGar7wV/WdU0zF8ITEf5mkeP1eZaloJbp7eMZU/3BGK0nYnERFNpdYIO9JO4Jnm1VEWWxVbnP73EhQAENORwyaFdWwEGHGMGkYdNKT7nYkSzm1pQB71k6Kx0fc9aqdJ1m/PQb2puGUHgXYFZYd9ft1MUr8oMVYmRQBi+gAUjiMeAnPCkY7x/2Una8JT73ug5DNCoHBVm5Mk8m6I5+K38vHaFnoRYvuSol5dhEsa7AJrY3+KFRfF5YVwBO8AQglqMSdZDQ8tQdAKLs2E9PyrgKk4y9BjR3bf5GNSpxW3HQeI1c=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2019 15:14:50.1903 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acc41484-b06d-406c-e1a9-08d6cd7e9709
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3757
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iz12NIwnuvOl6AanKliWYXPSKe0aQrU720yCqERLhQY=;
 b=3d2VPssjUUkZVXifZmieAtCVG0YujBJT8w8e/sqvmwLPV3ectpIgUD6yVFE/FtHODrUtEwWGSBB/saFS40e5GlBcAimVMM8wn8yjG6+c6n2HIn/XGu9O/ckQ2tJb0TaXBFEqsEo9TULOXR6F6g3PD46dYlnqzlhl4XaE/Iml98k=
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
Cc: Trigger.Huang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SW4gTXVsdGktVkZzIHN0cmVzcyB0ZXN0LCBzb21ldGltZXMgd2Ugc2VlIElSUSBsb3N0IHdoZW4g
cnVubmluZwpiZW5jaG1hcmssIGp1c3QgcmVhcm0gaXQuCgpTaWduZWQtb2ZmLWJ5OiBUcmlnZ2Vy
IEh1YW5nIDxUcmlnZ2VyLkh1YW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvdmVnYTEwX2loLmMgfCAzNyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKyst
CiAxIGZpbGUgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3ZlZ2ExMF9paC5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvdmVnYTEwX2loLmMKaW5kZXggMWIyZjY5YS4uOGQ4OWFiNyAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmVnYTEwX2loLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmVnYTEwX2loLmMKQEAgLTMxLDcgKzMxLDcgQEAKICNp
bmNsdWRlICJzb2MxNV9jb21tb24uaCIKICNpbmNsdWRlICJ2ZWdhMTBfaWguaCIKIAotCisjZGVm
aW5lIE1BWF9SRUFSTV9SRVRSWSAxMAogCiBzdGF0aWMgdm9pZCB2ZWdhMTBfaWhfc2V0X2ludGVy
cnVwdF9mdW5jcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7CiAKQEAgLTM4Miw2ICszODIs
MzggQEAgc3RhdGljIHZvaWQgdmVnYTEwX2loX2RlY29kZV9pdihzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwKIH0KIAogLyoqCisgKiB2ZWdhMTBfaWhfaXJxX3JlYXJtIC0gcmVhcm0gSVJRIGlm
IGxvc3QKKyAqCisgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCisgKgorICovCitzdGF0
aWMgdm9pZCB2ZWdhMTBfaWhfaXJxX3JlYXJtKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAor
CQkJICAgICAgIHN0cnVjdCBhbWRncHVfaWhfcmluZyAqaWgpCit7CisJdWludDMyX3QgcmVnX3Jw
dHIgPSAwOworCXVpbnQzMl90IHYgPSAwOworCXVpbnQzMl90IGkgPSAwOworCisJaWYgKGloID09
ICZhZGV2LT5pcnEuaWgpCisJCXJlZ19ycHRyID0gU09DMTVfUkVHX09GRlNFVChPU1NTWVMsIDAs
IG1tSUhfUkJfUlBUUik7CisJZWxzZSBpZiAoaWggPT0gJmFkZXYtPmlycS5paDEpCisJCXJlZ19y
cHRyID0gU09DMTVfUkVHX09GRlNFVChPU1NTWVMsIDAsIG1tSUhfUkJfUlBUUl9SSU5HMSk7CisJ
ZWxzZSBpZiAoaWggPT0gJmFkZXYtPmlycS5paDIpCisJCXJlZ19ycHRyID0gU09DMTVfUkVHX09G
RlNFVChPU1NTWVMsIDAsIG1tSUhfUkJfUlBUUl9SSU5HMik7CisJZWxzZQorCQlyZXR1cm47CisK
KwkvKiBSZWFybSBJUlEgLyByZS13d3JpdGUgZG9vcmJlbGwgaWYgZG9vcmJlbGwgd3JpdGUgaXMg
bG9zdCAqLworCWZvciAoaSA9IDA7IGkgPCBNQVhfUkVBUk1fUkVUUlk7IGkrKykgeworCQl2ID0g
UlJFRzMyX05PX0tJUShyZWdfcnB0cik7CisJCWlmICgodiA8IGloLT5yaW5nX3NpemUpICYmICh2
ICE9IGloLT5ycHRyKSkKKwkJCVdET09SQkVMTDMyKGloLT5kb29yYmVsbF9pbmRleCwgaWgtPnJw
dHIpOworCQllbHNlCisJCQlicmVhazsKKwl9Cit9CisKKy8qKgogICogdmVnYTEwX2loX3NldF9y
cHRyIC0gc2V0IHRoZSBJSCByaW5nIGJ1ZmZlciBycHRyCiAgKgogICogQGFkZXY6IGFtZGdwdV9k
ZXZpY2UgcG9pbnRlcgpAQCAtMzk1LDYgKzQyNyw5IEBAIHN0YXRpYyB2b2lkIHZlZ2ExMF9paF9z
ZXRfcnB0cihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJLyogWFhYIGNoZWNrIGlmIHN3
YXBwaW5nIGlzIG5lY2Vzc2FyeSBvbiBCRSAqLwogCQkqaWgtPnJwdHJfY3B1ID0gaWgtPnJwdHI7
CiAJCVdET09SQkVMTDMyKGloLT5kb29yYmVsbF9pbmRleCwgaWgtPnJwdHIpOworCisJCWlmIChh
bWRncHVfc3Jpb3ZfdmYoYWRldikpCisJCQl2ZWdhMTBfaWhfaXJxX3JlYXJtKGFkZXYsIGloKTsK
IAl9IGVsc2UgaWYgKGloID09ICZhZGV2LT5pcnEuaWgpIHsKIAkJV1JFRzMyX1NPQzE1KE9TU1NZ
UywgMCwgbW1JSF9SQl9SUFRSLCBpaC0+cnB0cik7CiAJfSBlbHNlIGlmIChpaCA9PSAmYWRldi0+
aXJxLmloMSkgewotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
