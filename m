Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E90EB1B2F9
	for <lists+amd-gfx@lfdr.de>; Mon, 13 May 2019 11:36:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EC7F8999A;
	Mon, 13 May 2019 09:36:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750053.outbound.protection.outlook.com [40.107.75.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A5438999A
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 May 2019 09:36:10 +0000 (UTC)
Received: from DM3PR12CA0044.namprd12.prod.outlook.com (2603:10b6:0:56::12) by
 BN7PR12MB2659.namprd12.prod.outlook.com (2603:10b6:408:29::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.25; Mon, 13 May 2019 09:36:08 +0000
Received: from CO1NAM03FT025.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by DM3PR12CA0044.outlook.office365.com
 (2603:10b6:0:56::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.21 via Frontend
 Transport; Mon, 13 May 2019 09:36:08 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT025.mail.protection.outlook.com (10.152.80.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Mon, 13 May 2019 09:36:07 +0000
Received: from build-machine.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 13 May 2019
 04:36:06 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: honor hw limit on fetching metrics data
Date: Mon, 13 May 2019 17:36:02 +0800
Message-ID: <20190513093602.17988-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(396003)(39860400002)(376002)(346002)(2980300002)(428003)(189003)(199004)(48376002)(68736007)(316002)(53936002)(8936002)(6666004)(356004)(2870700001)(81156014)(50226002)(8676002)(2906002)(1076003)(70206006)(70586007)(305945005)(81166006)(426003)(186003)(336012)(51416003)(4326008)(5660300002)(72206003)(2351001)(77096007)(26005)(7696005)(14444005)(476003)(2616005)(44832011)(126002)(50466002)(478600001)(36756003)(486006)(86362001)(6916009)(47776003)(53416004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2659; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d137d9ff-3369-41f9-136a-08d6d7866d44
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BN7PR12MB2659; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2659:
X-Microsoft-Antispam-PRVS: <BN7PR12MB26596C6CCAD48756C6986B35E40F0@BN7PR12MB2659.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-Forefront-PRVS: 0036736630
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: PGuJvIOJofrZLL1S8x/+BHhNO+l3bYKOBUdPLn3mRFIqzVer18CxphPtd89EMj1by5cugbDWITUyE30k3kRtu80guCkxj8nYsX3MQnXtZMKVwW5KKKAiu/z/tdhkl+QneH8cvLugJc8A0GviFTGFHCA0SbNW6iExfwtMoTWpLiPc1Er5xViiVqJKzpKcpwIgcdgdzIom2ZbIoRbIf3Xwt4zORm4+7CGbF60WnFKoWiXFIG6WmXuyMNpUr41rKLikXXXS6E4wHYjGLHiiRV6oKzzeaWk2Hds7qkWvDkSyfHMI9l4hhproNk1TWqu6zY/NtxXxco0qeRnvhgtwlhQVrFCejD+2BJAKNvKHs2q+Q791DZSaRxa98+7KKuCyRasokrJl+lO5DfvF7TRG4Rub6r2k8biYIEQ2mpK90U6PUcE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2019 09:36:07.6069 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d137d9ff-3369-41f9-136a-08d6d7866d44
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2659
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ODT6oX0HM/4CcbJ/X1/ViK+WWq+d8fsmb6iip1lNveI=;
 b=ujD25wyfBtlwtHnRZlZC9GjkkuIzMQayRSc/miaHNH5Lk77tdyhdndgX9iZeWgoC4odbSYH43KGikjIUlkHrc8lCVJp+KJKGm7jMHVWgvy53RPix/mGOEoBEhwphO1aDQK7WeadqBUWIIwj9HFcc2av70e+vl35/7ylp3MixHbo=
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
Cc: Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmVxdWVzdCB0b28gZnJlcXVlbnRseSBtYXkgZ2V0IGNvcnJ1cHQgZGF0YS4KCkNoYW5nZS1JZDog
SWRlZDIzYWI3ZGQwMTQzNTc1NDc5NjQ0YzUwMzBjZWE3MWJkYzUzZmQKU2lnbmVkLW9mZi1ieTog
RXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KLS0tCiAuLi4vZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L2luYy9hbWRncHVfc211LmggICAgfCAgMyArKwogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvc211X3YxMV8wLmMgICAgIHwgMzMgKysrKysrKysrKysrKysrKystLQogMiBmaWxlcyBj
aGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmggYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oCmluZGV4IDNhOWMyNTM3NTlkYy4u
MmNiNGNjMmE4MjA4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9p
bmMvYW1kZ3B1X3NtdS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9h
bWRncHVfc211LmgKQEAgLTQwMyw2ICs0MDMsOSBAQCBzdHJ1Y3Qgc211X2NvbnRleHQKIAl1aW50
MzJfdCBkZWZhdWx0X3Bvd2VyX3Byb2ZpbGVfbW9kZTsKIAogCXVpbnQzMl90IHNtY19pZl92ZXJz
aW9uOworCisJdW5zaWduZWQgbG9uZyBtZXRyaWNzX3RpbWU7CisJdm9pZCAqbWV0cmljc190YWJs
ZTsKIH07CiAKIHN0cnVjdCBwcHRhYmxlX2Z1bmNzIHsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvc211X3YxMV8wLmMKaW5kZXggZGIzOGUyMDcwN2Y5Li44N2NjY2EwNDVmMzYgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jCkBAIC0zNjksNiArMzY5LDEz
IEBAIHN0YXRpYyBpbnQgc211X3YxMV8wX2luaXRfcG93ZXIoc3RydWN0IHNtdV9jb250ZXh0ICpz
bXUpCiAJCXJldHVybiAtRU5PTUVNOwogCXNtdV9wb3dlci0+cG93ZXJfY29udGV4dF9zaXplID0g
c2l6ZW9mKHN0cnVjdCBzbXVfMTFfMF9kcG1fY29udGV4dCk7CiAKKwlzbXUtPm1ldHJpY3NfdGlt
ZSA9IDA7CisJc211LT5tZXRyaWNzX3RhYmxlID0ga3phbGxvYyhzaXplb2YoU211TWV0cmljc190
KSwgR0ZQX0tFUk5FTCk7CisJaWYgKCFzbXUtPm1ldHJpY3NfdGFibGUpIHsKKwkJa2ZyZWUoc211
X3Bvd2VyLT5wb3dlcl9jb250ZXh0KTsKKwkJcmV0dXJuIC1FTk9NRU07CisJfQorCiAJcmV0dXJu
IDA7CiB9CiAKQEAgLTM3OSw3ICszODYsOSBAQCBzdGF0aWMgaW50IHNtdV92MTFfMF9maW5pX3Bv
d2VyKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQogCWlmICghc211X3Bvd2VyLT5wb3dlcl9jb250
ZXh0IHx8IHNtdV9wb3dlci0+cG93ZXJfY29udGV4dF9zaXplID09IDApCiAJCXJldHVybiAtRUlO
VkFMOwogCisJa2ZyZWUoc211LT5tZXRyaWNzX3RhYmxlKTsKIAlrZnJlZShzbXVfcG93ZXItPnBv
d2VyX2NvbnRleHQpOworCXNtdS0+bWV0cmljc190YWJsZSA9IE5VTEw7CiAJc211X3Bvd2VyLT5w
b3dlcl9jb250ZXh0ID0gTlVMTDsKIAlzbXVfcG93ZXItPnBvd2VyX2NvbnRleHRfc2l6ZSA9IDA7
CiAKQEAgLTEwOTMsNiArMTEwMiwyNiBAQCBzdGF0aWMgaW50IHNtdV92MTFfMF9zdGFydF90aGVy
bWFsX2NvbnRyb2woc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCiAJcmV0dXJuIHJldDsKIH0KIAor
c3RhdGljIGludCBzbXVfdjExXzBfZ2V0X21ldHJpY3NfdGFibGUoc3RydWN0IHNtdV9jb250ZXh0
ICpzbXUsCisJCVNtdU1ldHJpY3NfdCAqbWV0cmljc190YWJsZSkKK3sKKwlpbnQgcmV0ID0gMDsK
KworCWlmICghc211LT5tZXRyaWNzX3RpbWUgfHwgdGltZV9hZnRlcihqaWZmaWVzLCBzbXUtPm1l
dHJpY3NfdGltZSArIEhaIC8gMTAwMCkpIHsKKwkJcmV0ID0gc211X3VwZGF0ZV90YWJsZShzbXUs
IFRBQkxFX1NNVV9NRVRSSUNTLAorCQkJCSh2b2lkICopbWV0cmljc190YWJsZSwgZmFsc2UpOwor
CQlpZiAocmV0KSB7CisJCQlwcl9pbmZvKCJGYWlsZWQgdG8gZXhwb3J0IFNNVSBtZXRyaWNzIHRh
YmxlIVxuIik7CisJCQlyZXR1cm4gcmV0OworCQl9CisJCW1lbWNweShzbXUtPm1ldHJpY3NfdGFi
bGUsIG1ldHJpY3NfdGFibGUsIHNpemVvZihTbXVNZXRyaWNzX3QpKTsKKwkJc211LT5tZXRyaWNz
X3RpbWUgPSBqaWZmaWVzOworCX0gZWxzZQorCQltZW1jcHkobWV0cmljc190YWJsZSwgc211LT5t
ZXRyaWNzX3RhYmxlLCBzaXplb2YoU211TWV0cmljc190KSk7CisKKwlyZXR1cm4gcmV0OworfQor
CiBzdGF0aWMgaW50IHNtdV92MTFfMF9nZXRfY3VycmVudF9hY3Rpdml0eV9wZXJjZW50KHN0cnVj
dCBzbXVfY29udGV4dCAqc211LAogCQkJCQkJICB1aW50MzJfdCAqdmFsdWUpCiB7CkBAIC0xMTAy
LDcgKzExMzEsNyBAQCBzdGF0aWMgaW50IHNtdV92MTFfMF9nZXRfY3VycmVudF9hY3Rpdml0eV9w
ZXJjZW50KHN0cnVjdCBzbXVfY29udGV4dCAqc211LAogCWlmICghdmFsdWUpCiAJCXJldHVybiAt
RUlOVkFMOwogCi0JcmV0ID0gc211X3VwZGF0ZV90YWJsZShzbXUsIFRBQkxFX1NNVV9NRVRSSUNT
LCAodm9pZCAqKSZtZXRyaWNzLCBmYWxzZSk7CisJcmV0ID0gc211X3YxMV8wX2dldF9tZXRyaWNz
X3RhYmxlKHNtdSwgJm1ldHJpY3MpOwogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKQEAgLTEx
MzksNyArMTE2OCw3IEBAIHN0YXRpYyBpbnQgc211X3YxMV8wX2dldF9ncHVfcG93ZXIoc3RydWN0
IHNtdV9jb250ZXh0ICpzbXUsIHVpbnQzMl90ICp2YWx1ZSkKIAlpZiAoIXZhbHVlKQogCQlyZXR1
cm4gLUVJTlZBTDsKIAotCXJldCA9IHNtdV91cGRhdGVfdGFibGUoc211LCBUQUJMRV9TTVVfTUVU
UklDUywgKHZvaWQgKikmbWV0cmljcywgZmFsc2UpOworCXJldCA9IHNtdV92MTFfMF9nZXRfbWV0
cmljc190YWJsZShzbXUsICZtZXRyaWNzKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0t
IAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
