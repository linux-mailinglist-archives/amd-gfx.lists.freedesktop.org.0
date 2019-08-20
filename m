Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EAF9545B
	for <lists+amd-gfx@lfdr.de>; Tue, 20 Aug 2019 04:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 612986E5B7;
	Tue, 20 Aug 2019 02:25:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-by2nam01on0619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe42::619])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FBE06E5B7
 for <amd-gfx@lists.freedesktop.org>; Tue, 20 Aug 2019 02:25:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ir0/0ZIr+JzYiX+j+cO6EKgfoGrBF7NxayBpqCz41BtBEkHSg1mCw55ouT+BqftBaE0hCLOWGodEDOdeLhrH8n0hSygrt+oCW8U3pYUlHMdOJLY3/+dFg8p9JwqQ/TAe2w9KHPhVWsa1CsHK9IGIXU5wtZhJ9kjzHVQzFBC5YQ+wn+K4worP4EyRt9GyemVBc7+lOSkiYTo4NvrAl++8lr4slxoZ9lECTWQzmbpw00pr9uSm5nbdtdbp8+l+ZvNe8CzzPS8wkCNOsKRAYoqRFmQt3Kf8/XRQgLucybnRAVyPlqpHS4sZWg7uCUcTLFRBhfS4+LvAR2UGiO2xMtejAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65cd0SoPAAjVyGbKqDbnXsLFxzeFEhuUi92r1b2YXM8=;
 b=Lk9XSz18yBb5Xnjpgd3E1MBmEQaC4qoqPdcAIJKr0wQHzxRlVcz8Dn69ESWzG7LkcK+Ae7rL37U0pbSzXrZ6k14VpB6iz1T8rA6tZAfcFI/PH3OWZmMDeJpgRmTzLyBMyGvK0hvY/VOG+qnEboAv69SyN9/BTovCdaoQ+QRRKtAAOFum56iBjJHOEVxrYkGNTkk5FyoCSRpbQ8H1jcI/DByMZFFsuDr5lUSkMbIhj/1SoWuJrxazeIlkazMhqLZvSTHPabE0y/QON35HdRfKrykn7lO2F72GpVxGIkmwsIt2Nq9GyMXvQc+yT+dTUTXEQ1RYahNS7OObAV8dPA38xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR12CA0052.namprd12.prod.outlook.com (2603:10b6:300:103::14)
 by DM6PR12MB2714.namprd12.prod.outlook.com (2603:10b6:5:49::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.18; Tue, 20 Aug
 2019 02:25:24 +0000
Received: from CO1NAM03FT036.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::202) by MWHPR12CA0052.outlook.office365.com
 (2603:10b6:300:103::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Tue, 20 Aug 2019 02:25:23 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT036.mail.protection.outlook.com (10.152.80.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Tue, 20 Aug 2019 02:25:23 +0000
Received: from guchchen-System-Product-Name.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server (TLS) id
 14.3.389.1; Mon, 19 Aug 2019 21:25:21 -0500
From: Guchun Chen <guchun.chen@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Hawking.Zhang@amd.com>,
 <Dennis.Li@amd.com>, <Xinhui.Pan@amd.com>, <Tao.Zhou1@amd.com>
Subject: [PATCH] drm/amdgpu: correct ras error count type
Date: Tue, 20 Aug 2019 10:25:08 +0800
Message-ID: <20190820022508.15159-1-guchun.chen@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(376002)(136003)(2980300002)(428003)(199004)(189003)(47776003)(70206006)(51416003)(81166006)(4326008)(8676002)(81156014)(70586007)(1076003)(305945005)(36756003)(7696005)(44832011)(316002)(2616005)(476003)(478600001)(186003)(486006)(336012)(126002)(2906002)(16586007)(2201001)(86362001)(110136005)(48376002)(50466002)(8936002)(426003)(6636002)(5660300002)(53416004)(50226002)(356004)(6666004)(14444005)(53936002)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2714; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 858201f2-22ec-498c-40ca-08d72515a7d5
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM6PR12MB2714; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2714:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2714874B6F9624B04BF75F5DF1AB0@DM6PR12MB2714.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-Forefront-PRVS: 013568035E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: xiB/79LCqAxUjpyJQ4WY03rUvxOA2fAXsL7AZ/00JxPtp+oh2OzWISHbB06udoJ+ItIfJVw4knrvTnKUpoFzBfS/X+xShQ46/cuziz6Az9JbYpNFNM+exuOELuOQ6bLRFY2df4VQ2LufGcBYgAgwyaYoOZNzy3xzdWhXexvi+c1TMZxQ1eMCQIP68LgTjWFfIicWeF1GvyAm/CQNxYuCbl0N4jns4kiPeRzkRAoHC6sHzYqZdrAJG7sJy6MG1aKsqN7vniVyoaZkX5fleI/6D80SnjHkMkFTYaPs3YCmyWJ597I7jKK95HPBJSPWfs244WHtJJcNf9Qwgj9GVgy+moOYojr6AvKa3X+eoINOnuvGnhN8qr3rZ1HgZf0uGqnTT5Yr/Hr87EKN02aOyMFuRL2bNn8oKUJDUKt6KLLRBKE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2019 02:25:23.4604 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 858201f2-22ec-498c-40ca-08d72515a7d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2714
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65cd0SoPAAjVyGbKqDbnXsLFxzeFEhuUi92r1b2YXM8=;
 b=QORH/ziFDFJEz16PcJ9VEJEwuzgeGVGcAgKzFryh+2ZbxUIEWOiZBs95/fzJeA7igfpFb8bHQv+lzh1VeKzVvsP4RJzqnrFy48ITqzAPTnreJMoATvcKs1AQA/AejiO4bwUofjmntbxU2bHzQ/gqPGIc8Z+xtgSLHmP78xJzy8c=
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
Cc: Guchun Chen <guchun.chen@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VXNlIHVuc2lnbmVkIGxvbmcgdHlwZSBmb3IgdGhlIHNhbWUgcmFzIGNvdW50IHZhcmlhYmxlLgpU
aGlzIHdpbGwgYXZvaWQgb3ZlcmZsb3cgb24gNjQgYml0IHN5c3RlbS4KCkNoYW5nZS1JZDogSTAx
MTQwNmQ4MWJhZDY5YTY1NDMzYjYzOTYwZTE2OTFjNDk1OWJiYzUKU2lnbmVkLW9mZi1ieTogR3Vj
aHVuIENoZW4gPGd1Y2h1bi5jaGVuQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2N0eC5jIHwgMiArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2N0eC5oIHwgNCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFz
LmMgfCA2ICsrKy0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oIHwg
MiArLQogNCBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2N0eC5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2N0eC5jCmluZGV4IDg5YzI2YmIwZjA1Yy4u
ZGEzMzdhMmJhYjY1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfY3R4LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2N0eC5jCkBA
IC0zNTIsNyArMzUyLDcgQEAgc3RhdGljIGludCBhbWRncHVfY3R4X3F1ZXJ5MihzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwKIHsKIAlzdHJ1Y3QgYW1kZ3B1X2N0eCAqY3R4OwogCXN0cnVjdCBh
bWRncHVfY3R4X21nciAqbWdyOwotCXVpbnQzMl90IHJhc19jb3VudGVyOworCXVuc2lnbmVkIGxv
bmcgcmFzX2NvdW50ZXI7CiAKIAlpZiAoIWZwcml2KQogCQlyZXR1cm4gLUVJTlZBTDsKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jdHguaCBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jdHguaAppbmRleCA1ZjFiNTRjOWJjZGIuLmRhODA4
NjMzNzMyYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2N0
eC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jdHguaApAQCAtNDks
OCArNDksOCBAQCBzdHJ1Y3QgYW1kZ3B1X2N0eCB7CiAJZW51bSBkcm1fc2NoZWRfcHJpb3JpdHkJ
CW92ZXJyaWRlX3ByaW9yaXR5OwogCXN0cnVjdCBtdXRleAkJCWxvY2s7CiAJYXRvbWljX3QJCQln
dWlsdHk7Ci0JdWludDMyX3QJCQlyYXNfY291bnRlcl9jZTsKLQl1aW50MzJfdAkJCXJhc19jb3Vu
dGVyX3VlOworCXVuc2lnbmVkIGxvbmcJCQlyYXNfY291bnRlcl9jZTsKKwl1bnNpZ25lZCBsb25n
CQkJcmFzX2NvdW50ZXJfdWU7CiB9OwogCiBzdHJ1Y3QgYW1kZ3B1X2N0eF9tZ3IgewpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCmluZGV4IDUwYzEzYjAyZDIzNC4uZGY0Yjlh
ZTM5YzVlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFz
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCkBAIC02ODYs
NyArNjg2LDcgQEAgaW50IGFtZGdwdV9yYXNfZXJyb3JfY3VyZShzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwKIH0KIAogLyogZ2V0IHRoZSB0b3RhbCBlcnJvciBjb3VudHMgb24gYWxsIElQcyAq
LwotaW50IGFtZGdwdV9yYXNfcXVlcnlfZXJyb3JfY291bnQoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsCit1bnNpZ25lZCBsb25nIGFtZGdwdV9yYXNfcXVlcnlfZXJyb3JfY291bnQoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCWJvb2wgaXNfY2UpCiB7CiAJc3RydWN0IGFtZGdwdV9y
YXMgKmNvbiA9IGFtZGdwdV9yYXNfZ2V0X2NvbnRleHQoYWRldik7CkBAIC02OTQsNyArNjk0LDcg
QEAgaW50IGFtZGdwdV9yYXNfcXVlcnlfZXJyb3JfY291bnQoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsCiAJc3RydWN0IHJhc19lcnJfZGF0YSBkYXRhID0gezAsIDB9OwogCiAJaWYgKCFjb24p
Ci0JCXJldHVybiAtRUlOVkFMOworCQlyZXR1cm4gMDsKIAogCWxpc3RfZm9yX2VhY2hfZW50cnko
b2JqLCAmY29uLT5oZWFkLCBub2RlKSB7CiAJCXN0cnVjdCByYXNfcXVlcnlfaWYgaW5mbyA9IHsK
QEAgLTcwMiw3ICs3MDIsNyBAQCBpbnQgYW1kZ3B1X3Jhc19xdWVyeV9lcnJvcl9jb3VudChzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJfTsKIAogCQlpZiAoYW1kZ3B1X3Jhc19lcnJvcl9x
dWVyeShhZGV2LCAmaW5mbykpCi0JCQlyZXR1cm4gLUVJTlZBTDsKKwkJCXJldHVybiAwOwogCiAJ
CWRhdGEuY2VfY291bnQgKz0gaW5mby5jZV9jb3VudDsKIAkJZGF0YS51ZV9jb3VudCArPSBpbmZv
LnVlX2NvdW50OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3Jhcy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oCmluZGV4IDI3
NjVmMmRiYjFlNi4uMDJhNTFlM2RmYTE0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcmFzLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3Jhcy5oCkBAIC00ODQsNyArNDg0LDcgQEAgaW50IGFtZGdwdV9yYXNfcmVxdWVzdF9yZXNl
dF9vbl9ib290KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogdm9pZCBhbWRncHVfcmFzX3Jl
c3VtZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7CiB2b2lkIGFtZGdwdV9yYXNfc3VzcGVu
ZChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7CiAKLWludCBhbWRncHVfcmFzX3F1ZXJ5X2Vy
cm9yX2NvdW50KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAordW5zaWduZWQgbG9uZyBhbWRn
cHVfcmFzX3F1ZXJ5X2Vycm9yX2NvdW50KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQli
b29sIGlzX2NlKTsKIAogLyogZXJyb3IgaGFuZGxpbmcgZnVuY3Rpb25zICovCi0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
