Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 361495FB7C
	for <lists+amd-gfx@lfdr.de>; Thu,  4 Jul 2019 18:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C726E386;
	Thu,  4 Jul 2019 16:06:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750085.outbound.protection.outlook.com [40.107.75.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 762116E379
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Jul 2019 16:06:21 +0000 (UTC)
Received: from SN1PR12CA0065.namprd12.prod.outlook.com (2603:10b6:802:20::36)
 by MWHPR12MB1856.namprd12.prod.outlook.com (2603:10b6:300:108::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.17; Thu, 4 Jul
 2019 16:06:20 +0000
Received: from BY2NAM03FT052.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by SN1PR12CA0065.outlook.office365.com
 (2603:10b6:802:20::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.18 via Frontend
 Transport; Thu, 4 Jul 2019 16:06:20 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT052.mail.protection.outlook.com (10.152.85.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 4 Jul 2019 16:06:19 +0000
Received: from navi10-uefi.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server (TLS) id 14.3.389.1; Thu, 4 Jul
 2019 11:06:01 -0500
From: <boyuan.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 17/17] drm/amdgpu: handle jpeg enc dpg
Date: Thu, 4 Jul 2019 12:04:29 -0400
Message-ID: <20190704160429.14758-17-boyuan.zhang@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190704160429.14758-1-boyuan.zhang@amd.com>
References: <20190704160429.14758-1-boyuan.zhang@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(396003)(346002)(2980300002)(428003)(189003)(199004)(486006)(36756003)(16526019)(186003)(76176011)(53936002)(50466002)(2876002)(48376002)(6916009)(126002)(8936002)(476003)(356004)(6666004)(2906002)(478600001)(68736007)(2351001)(426003)(2616005)(11346002)(72206003)(446003)(53416004)(3846002)(6116002)(70206006)(1076003)(50226002)(5660300002)(7696005)(4326008)(51416003)(86362001)(16586007)(336012)(26005)(77096007)(8676002)(81166006)(81156014)(305945005)(70586007)(47776003)(316002)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1856; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d11c88a4-c798-4bad-4c74-08d700998d9d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR12MB1856; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1856:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1856C67E34ED3134397A13C287FA0@MWHPR12MB1856.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-Forefront-PRVS: 0088C92887
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: RFvZP9axQdcqtR2SU9OnMke8N5uwOZR4Zy/jiDA1+j4zBFU85N5ZlTuHg2I4ApMfQ/pp5DsGT87DU38Iz1hevS3dlZbpXu+R3uPkJoXrevI1jvi0T3llVc0PJEy9Zdo4s9W2o2x52ePy2fpjZ9x6wAkfgqh3rHo9eD6uzmMQMesSGKbcL7EcOCwBrOl6G4cRUPZqI2bDoj+G4j2M5PfZdxJYMSIHcQafPHFTuOxVMtr83uh6D0YV8tLmqdRPApPPjUMh83v2/qUNizU7oxSJ9a4BkdkCRjYYyG/cuORwav3FAMBE4i5/ZsVMrt/Pa39Ih4WkxzBnfFy3wGzsU+GyRJEja60ZIU+uiYAAklZ5zbulj5pxQb6TyNWeJDoom6dbTMwWYlg+NfRFD+ywqXUfRX6R67bDVm3yuYIyh+LCDJo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2019 16:06:19.8824 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d11c88a4-c798-4bad-4c74-08d700998d9d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1856
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TE+UmRJTUe1L+j0o4V2HUPyeS0yJFTwNre6ZcnwEQa8=;
 b=wT9ZB5IkIesu8WUlbJjmRxAUUmBn0zCLzBO9vwqtYUTYqK3Sx+2Vn2zkPSEpZoG8Oo/OKNCD2topP0sm0/mHtCKBD/oZdBEG1PCZdrbt4kfO7cp/al1s3DUfS/dZvNy6d6FEBlqD5MzUNqMO/XYDaom3nt/tbjh6CMnjre4Y5xc=
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
Cc: Boyuan Zhang <boyuan.zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQm95dWFuIFpoYW5nIDxib3l1YW4uemhhbmdAYW1kLmNvbT4KCkFkZCBqcGVnIGVuY29k
ZSByZWxhdGVkIGRwZyBoYW5kbGluZy4KClNpZ25lZC1vZmYtYnk6IEJveXVhbiBaaGFuZyA8Ym95
dWFuLnpoYW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zj
bi5jIHwgMTMgKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmMKaW5kZXggMDA3MjA3YTJlNzk4
Li5jZjMxNTFhMDJiMWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV92Y24uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmMK
QEAgLTM2OSwxMCArMzY5LDE2IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV92Y25faWRsZV93b3JrX2hh
bmRsZXIoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQogCQllbHNlCiAJCQluZXdfc3RhdGUuanBl
ZyA9IFZDTl9EUEdfU1RBVEVfX1VOUEFVU0U7CiAKKwkJaWYgKGFtZGdwdV9mZW5jZV9jb3VudF9l
bWl0dGVkKCZhZGV2LT52Y24ucmluZ19qcGVnX2VuYykpCisJCQluZXdfc3RhdGUuanBlZyA9IFZD
Tl9EUEdfU1RBVEVfX1BBVVNFOworCQllbHNlCisJCQluZXdfc3RhdGUuanBlZyA9IFZDTl9EUEdf
U1RBVEVfX1VOUEFVU0U7CisKIAkJYW1kZ3B1X3Zjbl9wYXVzZV9kcGdfbW9kZShhZGV2LCAmbmV3
X3N0YXRlKTsKIAl9CiAKIAlmZW5jZXMgKz0gYW1kZ3B1X2ZlbmNlX2NvdW50X2VtaXR0ZWQoJmFk
ZXYtPnZjbi5yaW5nX2pwZWcpOworCWZlbmNlcyArPSBhbWRncHVfZmVuY2VfY291bnRfZW1pdHRl
ZCgmYWRldi0+dmNuLnJpbmdfanBlZ19lbmMpOwogCWZlbmNlcyArPSBhbWRncHVfZmVuY2VfY291
bnRfZW1pdHRlZCgmYWRldi0+dmNuLnJpbmdfZGVjKTsKIAogCWlmIChmZW5jZXMgPT0gMCkgewpA
QCAtNDE5LDEwICs0MjUsMTcgQEAgdm9pZCBhbWRncHVfdmNuX3JpbmdfYmVnaW5fdXNlKHN0cnVj
dCBhbWRncHVfcmluZyAqcmluZykKIAkJZWxzZQogCQkJbmV3X3N0YXRlLmpwZWcgPSBWQ05fRFBH
X1NUQVRFX19VTlBBVVNFOwogCisJCWlmIChhbWRncHVfZmVuY2VfY291bnRfZW1pdHRlZCgmYWRl
di0+dmNuLnJpbmdfanBlZ19lbmMpKQorCQkJbmV3X3N0YXRlLmpwZWcgPSBWQ05fRFBHX1NUQVRF
X19QQVVTRTsKKwkJZWxzZQorCQkJbmV3X3N0YXRlLmpwZWcgPSBWQ05fRFBHX1NUQVRFX19VTlBB
VVNFOworCiAJCWlmIChyaW5nLT5mdW5jcy0+dHlwZSA9PSBBTURHUFVfUklOR19UWVBFX1ZDTl9F
TkMpCiAJCQluZXdfc3RhdGUuZndfYmFzZWQgPSBWQ05fRFBHX1NUQVRFX19QQVVTRTsKIAkJZWxz
ZSBpZiAocmluZy0+ZnVuY3MtPnR5cGUgPT0gQU1ER1BVX1JJTkdfVFlQRV9WQ05fSlBFRykKIAkJ
CW5ld19zdGF0ZS5qcGVnID0gVkNOX0RQR19TVEFURV9fUEFVU0U7CisJCWVsc2UgaWYgKHJpbmct
PmZ1bmNzLT50eXBlID09IEFNREdQVV9SSU5HX1RZUEVfVkNOX0pQRUdfRU5DKQorCQkJbmV3X3N0
YXRlLmpwZWcgPSBWQ05fRFBHX1NUQVRFX19QQVVTRTsKIAogCQlhbWRncHVfdmNuX3BhdXNlX2Rw
Z19tb2RlKGFkZXYsICZuZXdfc3RhdGUpOwogCX0KLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
