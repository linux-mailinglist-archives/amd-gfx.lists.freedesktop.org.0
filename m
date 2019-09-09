Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1D4ADFC5
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Sep 2019 22:04:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86BB889057;
	Mon,  9 Sep 2019 20:04:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700076.outbound.protection.outlook.com [40.107.70.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF9A89057
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 Sep 2019 20:04:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFDHl0sREQCSy5V/WYo1icMW6QMUQ/AGFEbmDIQ0bxM//PmWzbjKpQRG0i+bVE2Eak8h2WPYzWqVwOXTvg/uwo5zCZx3oIHnzo4JP/dQKPmmFrulgFPuOTHWSTPidXiIkx4aV8lxJ7ZQMiYFXSvV1bH2WiMtxZSAjrdy2mu6pJfoAkwARxR/EFXPNEx4qEEjqGo07uT6IugYBoL/RyFK/kw8SiWPkM9PgdNXLFjH9dONL/SOcx07D097zlzRrvQodasFhzaL4CetiYU9JTCr/D/NApsrJiLNvAWbUt+U3tqBbB4zVqXHoC36zUnfYrHIMnBQHmeYhPgenTHvOov+/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SEAoCwqIJ0aG/f8BJFCtGeb0AfCHfJFDJyPHL5ag5+w=;
 b=X3ZU1evrYtfD4PjnjTGZrVe13sijyNYW0UG0qCqdWCNQMBGJwmtVTTgf/QDEQrlUlNuKLSTAIYNcgRyd0C8D+Q2Dr9F9sazUUYuxIcve8D/QEP7j2Xxn7vrjQtLzlmfKEgdL7TksPHrVcy5CFVYL3h7kAE8gFpKBAX5TUMT0kUTAK//JnWrNTkx/nULqBJ5qpYk3li2Fr0bGPBCd1wGlDREUwsVwrTYfHrbQuzKNIDbvdgMZ2UeXiEpHzxUeaGwcklqH6C7xa+D5alg7Y1u8Rc3342lIs2Btig9nbayGCWZwYxVJ5SzIjaSDqFuvUnPHkH8hB1LXr8VL1pFYNEQH4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0013.namprd12.prod.outlook.com
 (2603:10b6:301:4a::23) by DM6PR12MB3754.namprd12.prod.outlook.com
 (2603:10b6:5:1c3::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.13; Mon, 9 Sep
 2019 20:04:39 +0000
Received: from DM3NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::205) by MWHPR1201CA0013.outlook.office365.com
 (2603:10b6:301:4a::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2241.14 via Frontend
 Transport; Mon, 9 Sep 2019 20:04:38 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT048.mail.protection.outlook.com (10.152.83.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Mon, 9 Sep 2019 20:04:37 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Mon, 9 Sep 2019 15:04:35 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amdgpu: Add amdgpu_ras_eeprom_reset_table
Date: Mon, 9 Sep 2019 16:04:28 -0400
Message-ID: <1568059469-29450-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(39860400002)(136003)(2980300002)(428003)(189003)(199004)(2906002)(6916009)(86362001)(305945005)(70206006)(53416004)(70586007)(5660300002)(14444005)(50226002)(8936002)(7696005)(50466002)(16586007)(316002)(54906003)(8676002)(81156014)(81166006)(426003)(336012)(2616005)(126002)(486006)(48376002)(44832011)(47776003)(51416003)(476003)(53936002)(26005)(4326008)(36756003)(2351001)(478600001)(356004)(6666004)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3754; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60c228ba-43fb-43f0-5faf-08d73560f175
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM6PR12MB3754; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB3754:
X-Microsoft-Antispam-PRVS: <DM6PR12MB37544CE27A34B421C6C2DF6BEAB70@DM6PR12MB3754.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 01559F388D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: hmcQNh/L3AFUMyDoykP8XzWN26rkpOhldzS5okOKvgjRlNlD4zZsUGpBwIxwMn740qdWBVZfxJRb1Vu3O2B+KZSi+p5QfmWdBZ9LkFxMKIs4M4hwHcLLBcVLkLf7/x5yj8Gjsnrw4D8og8jPvGTYqru+3vHfiQnCZbvFWKlbEa+jkALRzpJ3pTOLx0eJlyk8mnI0I1rBFHGeb/V69lI4MKH95atf/cfQwGwWab11Ww9r8MwhHH/u0HrX3VKm/KzAApvit7RjR6lTq/iTXu5eeAdVUm65Z3s4td2EbflZe58vrCP/UR5JTDTEehBCBdM8RyE8Gr4DdOP+62OfmmzQk7EyQeB0/RarghypDsJAmYO6ZCnc7Biaar/EreglsYB2cNMiQMsa7FST7Y5vV1inDzwUplDN5AyTj2LyjDEuwIg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2019 20:04:37.8967 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60c228ba-43fb-43f0-5faf-08d73560f175
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3754
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SEAoCwqIJ0aG/f8BJFCtGeb0AfCHfJFDJyPHL5ag5+w=;
 b=zhXDeJLYRswHGApTSzRXCoIBIsfv3d07gaE+dU4wilx54P5XlUSDdE+SYUu+thyEwvLic3brY+or77txhJrEjz+gOroZxL3n7hsAFIRGtDjfZ8Ubz6uqXAPVRVJuM9k3GVjG6O2hwcSIGOeXR1DJLmrS4ZC+BecsZOgtAvdKUZ0=
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
 Tao.Zhou1@amd.com, Guchun.Chen@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyB3aWxsIGFsbG93IHRvIHJlc2V0IHRoZSB0YWJsZSBvbiB0aGUgZmx5LgoKU2lnbmVkLW9m
Zi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhc19lZXByb20uYyB8IDI1ICsrKysr
KysrKysrKysrKysrLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9y
YXNfZWVwcm9tLmggfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDgg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3Jhc19lZXByb20uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXNf
ZWVwcm9tLmMKaW5kZXggNDNkZDRhYi4uMTFhODQ0NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhc19lZXByb20uYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcmFzX2VlcHJvbS5jCkBAIC0xMDIsNiArMTAyLDIyIEBAIHN0YXRp
YyBpbnQgX191cGRhdGVfdGFibGVfaGVhZGVyKHN0cnVjdCBhbWRncHVfcmFzX2VlcHJvbV9jb250
cm9sICpjb250cm9sLAogCiBzdGF0aWMgdWludDMyX3QgIF9fY2FsY19oZHJfYnl0ZV9zdW0oc3Ry
dWN0IGFtZGdwdV9yYXNfZWVwcm9tX2NvbnRyb2wgKmNvbnRyb2wpOwogCitpbnQgYW1kZ3B1X3Jh
c19lZXByb21fcmVzZXRfdGFibGUoc3RydWN0IGFtZGdwdV9yYXNfZWVwcm9tX2NvbnRyb2wgKmNv
bnRyb2wpCit7CisJdW5zaWduZWQgY2hhciBidWZmW0VFUFJPTV9BRERSRVNTX1NJWkUgKyBFRVBS
T01fVEFCTEVfSEVBREVSX1NJWkVdID0geyAwIH07CisJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYgPSB0b19hbWRncHVfZGV2aWNlKGNvbnRyb2wpOworCXN0cnVjdCBhbWRncHVfcmFzX2VlcHJv
bV90YWJsZV9oZWFkZXIgKmhkciA9ICZjb250cm9sLT50YmxfaGRyOworCisJaGRyLT5oZWFkZXIg
PSBFRVBST01fVEFCTEVfSERSX1ZBTDsKKwloZHItPnZlcnNpb24gPSBFRVBST01fVEFCTEVfVkVS
OworCWhkci0+Zmlyc3RfcmVjX29mZnNldCA9IEVFUFJPTV9SRUNPUkRfU1RBUlQ7CisJaGRyLT50
Ymxfc2l6ZSA9IEVFUFJPTV9UQUJMRV9IRUFERVJfU0laRTsKKworCWFkZXYtPnBzcC5yYXMucmFz
LT5lZXByb21fY29udHJvbC50YmxfYnl0ZV9zdW0gPQorCQkJX19jYWxjX2hkcl9ieXRlX3N1bSgm
YWRldi0+cHNwLnJhcy5yYXMtPmVlcHJvbV9jb250cm9sKTsKKwlyZXR1cm4gX191cGRhdGVfdGFi
bGVfaGVhZGVyKGNvbnRyb2wsIGJ1ZmYpOworfQorCiBpbnQgYW1kZ3B1X3Jhc19lZXByb21faW5p
dChzdHJ1Y3QgYW1kZ3B1X3Jhc19lZXByb21fY29udHJvbCAqY29udHJvbCkKIHsKIAlpbnQgcmV0
ID0gMDsKQEAgLTE0OSwxNCArMTY1LDcgQEAgaW50IGFtZGdwdV9yYXNfZWVwcm9tX2luaXQoc3Ry
dWN0IGFtZGdwdV9yYXNfZWVwcm9tX2NvbnRyb2wgKmNvbnRyb2wpCiAJfSBlbHNlIHsKIAkJRFJN
X0lORk8oIkNyZWF0aW5nIG5ldyBFRVBST00gdGFibGUiKTsKIAotCQloZHItPmhlYWRlciA9IEVF
UFJPTV9UQUJMRV9IRFJfVkFMOwotCQloZHItPnZlcnNpb24gPSBFRVBST01fVEFCTEVfVkVSOwot
CQloZHItPmZpcnN0X3JlY19vZmZzZXQgPSBFRVBST01fUkVDT1JEX1NUQVJUOwotCQloZHItPnRi
bF9zaXplID0gRUVQUk9NX1RBQkxFX0hFQURFUl9TSVpFOwotCi0JCWFkZXYtPnBzcC5yYXMucmFz
LT5lZXByb21fY29udHJvbC50YmxfYnl0ZV9zdW0gPQotCQkJCV9fY2FsY19oZHJfYnl0ZV9zdW0o
JmFkZXYtPnBzcC5yYXMucmFzLT5lZXByb21fY29udHJvbCk7Ci0JCXJldCA9IF9fdXBkYXRlX3Rh
YmxlX2hlYWRlcihjb250cm9sLCBidWZmKTsKKwkJcmV0ID0gYW1kZ3B1X3Jhc19lZXByb21fcmVz
ZXRfdGFibGUoY29udHJvbCk7CiAJfQogCiAJLyogU3RhcnQgaW5zZXJ0aW5nIHJlY29yZHMgZnJv
bSBoZXJlICovCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
cmFzX2VlcHJvbS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhc19lZXBy
b20uaAppbmRleCA0MWYzZmNiLi42MjIyNjk5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcmFzX2VlcHJvbS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9yYXNfZWVwcm9tLmgKQEAgLTc5LDYgKzc5LDcgQEAgc3RydWN0IGVlcHJv
bV90YWJsZV9yZWNvcmQgewogCiBpbnQgYW1kZ3B1X3Jhc19lZXByb21faW5pdChzdHJ1Y3QgYW1k
Z3B1X3Jhc19lZXByb21fY29udHJvbCAqY29udHJvbCk7CiB2b2lkIGFtZGdwdV9yYXNfZWVwcm9t
X2Zpbmkoc3RydWN0IGFtZGdwdV9yYXNfZWVwcm9tX2NvbnRyb2wgKmNvbnRyb2wpOworaW50IGFt
ZGdwdV9yYXNfZWVwcm9tX3Jlc2V0X3RhYmxlKHN0cnVjdCBhbWRncHVfcmFzX2VlcHJvbV9jb250
cm9sICpjb250cm9sKTsKIAogaW50IGFtZGdwdV9yYXNfZWVwcm9tX3Byb2Nlc3NfcmVjb2RzKHN0
cnVjdCBhbWRncHVfcmFzX2VlcHJvbV9jb250cm9sICpjb250cm9sLAogCQkJCQkgICAgc3RydWN0
IGVlcHJvbV90YWJsZV9yZWNvcmQgKnJlY29yZHMsCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
