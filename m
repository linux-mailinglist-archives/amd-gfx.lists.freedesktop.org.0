Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD13E926FA
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 16:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00FE06E16D;
	Mon, 19 Aug 2019 14:35:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680043.outbound.protection.outlook.com [40.107.68.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 365EB6E161
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 14:35:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=brlEJ1Z4R28PH3jxROsZGwp0iVhsDoGPC4/uTx21tbT1JGHHe0ERpBuJlsWp0oGV3Ag0nJY/SwRxtUzSX45eTFnU+2hUP9L5tQBFHZG4UggV1S+FmXJ4CSUaDIbchkm8toB8UaxOocwHCe/8MhgTe6mGzPyaAB6vKAbyArFJ5QS3VN74wa1H4HEhBYNJKnz3BG4Eq9VpLXM3DiHbH2cZbil4IMdoypqyCR9bzcL7kb71MGcDNJEJTDt5SbngChg98AfKtpVPnrOPc4q0j1PoTSNwLgj2UjMyX7l2tJcxUs2FTesoNWtf9K3/dSmUgTFXGYnoVQpN8eS9C2r8axHt1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88qOnAtu1IKfKggIC7ksx/hWZlqoqgCFJIjOrQfVFQ0=;
 b=baJF9bszyYa5oRKACN01qzOnMM0+kVoa+EXVdxHBONtVie8Yo/meZNnc/lxTzo2u739fRLWPgUo0xrZSkgRdHrVgMj4u8tyh6fLp9kmGdppNia4MOSVKOPVIA1fTLJj3qiMs4foxic4x2nkNjKoS50Z+8p/mIaghtt6CXo+6vkW8z52Cu+BxOwZTcLYop+rLa5lKd6sAeBB+8RkY5OvkrIwUGjqVWpR4cTDQOvwFxOX62LtU/Ty8+d5udjFr0vQ5B6B2HZbV1QEsr+cEgYFkzCJY75jKjGhRKFzwsb8GW/KubnQdbwAUCMiStArSm8jEzFFwJTGtza3YNvtlzQhIRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR12CA0032.namprd12.prod.outlook.com (2603:10b6:405:70::18)
 by MWHPR12MB1279.namprd12.prod.outlook.com (2603:10b6:300:d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.18; Mon, 19 Aug
 2019 14:35:55 +0000
Received: from BY2NAM03FT016.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by BN6PR12CA0032.outlook.office365.com
 (2603:10b6:405:70::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 14:35:55 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT016.mail.protection.outlook.com (10.152.84.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 14:35:54 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 19 Aug 2019
 09:35:45 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 20/36] drm/amd/display: fix odm pipe copy
Date: Mon, 19 Aug 2019 10:34:59 -0400
Message-ID: <20190819143515.21653-21-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
References: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(396003)(39860400002)(2980300002)(428003)(199004)(189003)(86362001)(70206006)(486006)(478600001)(70586007)(316002)(53936002)(50226002)(36756003)(53416004)(50466002)(48376002)(14444005)(16586007)(8936002)(126002)(356004)(476003)(6916009)(11346002)(2616005)(4326008)(426003)(26005)(5660300002)(305945005)(81166006)(6666004)(81156014)(336012)(76176011)(446003)(186003)(8676002)(7696005)(51416003)(1076003)(2351001)(2906002)(47776003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1279; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e94bdad8-164c-45a1-8254-08d724b28adb
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1279; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1279:
X-Microsoft-Antispam-PRVS: <MWHPR12MB12790233A67EAE4EC0ADCD19F9A80@MWHPR12MB1279.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: CNyM/kVzIIhzkWyfqCzlRBlxUabKzrGghmnT+YbNbYVlmUYobWiD2558aRB3ZSW4MVcCmgig4sqXwxRTfgQ0+Y0p3bbC1Tld1V3qoNJxm2asBgOKM7BzU8M98YSc1IHU+OivTSmKc/Lu2eCQoFfG962ZbnUGPHZkJLBWRVtYs9aMq7FXx+VCJV+RXI+OxO/mzRhR8S96yAYTHDu90Z8sAU3pDX0nVsmcatlx5kcXgAobM517WAqTil79kGlkfuy3mOtqq8zL2eCiSYwlwGNK4qUNsFAKPLQbbp78+RTxZ+5FrWrTSWLVsOKdRhxYWRke7RP8S/bQ3/9lDcrv9aqL2v8Pz9mGItqzv1NsJ5l4j7G5T7q31cKOvjlGXqR1YIoOUJ6vsvG1fp1iR5GiMrxRe3AJHieeZB2gJFDbr5J2fQM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 14:35:54.7053 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e94bdad8-164c-45a1-8254-08d724b28adb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1279
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88qOnAtu1IKfKggIC7ksx/hWZlqoqgCFJIjOrQfVFQ0=;
 b=D28XqOoo6xE243Flt3ZAbeLHz01Ek+iTJc5VyGk0CxuWglkdrVPHjy6BPvVyuzTbvZP/w2WDJG6GqcSOv2Nc6i4mw3JEUMc2lwb9s+amr/RCpq2tytdkQB69JHZlQ6YOGwDf0UIv8w71WRO9LwGPhyMzNLYJom3/SMApw2Yukj8=
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
Cc: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KCk9E
TSBuZXh0IGFuZCBwcmV2IHBpcGUgd2VyZSBtaXNzaW5nIGZyb20gZGNfY29weV9zdGF0ZQoKU2ln
bmVkLW9mZi1ieTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNv
bT4KUmV2aWV3ZWQtYnk6IE5pa29sYSBDb3JuaWogPE5pa29sYS5Db3JuaWpAYW1kLmNvbT4KQWNr
ZWQtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgICAgICAgICB8IDYgKysr
KysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2RwLmMgfCAy
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jCmluZGV4IDJiNTI5OWU0MGQ2Ni4u
ZTA5YzYzOTY4NWZjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Y29yZS9kYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMK
QEAgLTEyMjcsNiArMTIyNywxMiBAQCBzdHJ1Y3QgZGNfc3RhdGUgKmRjX2NvcHlfc3RhdGUoc3Ry
dWN0IGRjX3N0YXRlICpzcmNfY3R4KQogCQkJaWYgKGN1cl9waXBlLT5ib3R0b21fcGlwZSkKIAkJ
CQljdXJfcGlwZS0+Ym90dG9tX3BpcGUgPSAmbmV3X2N0eC0+cmVzX2N0eC5waXBlX2N0eFtjdXJf
cGlwZS0+Ym90dG9tX3BpcGUtPnBpcGVfaWR4XTsKIAorCQkJaWYgKGN1cl9waXBlLT5wcmV2X29k
bV9waXBlKQorCQkJCWN1cl9waXBlLT5wcmV2X29kbV9waXBlID0gICZuZXdfY3R4LT5yZXNfY3R4
LnBpcGVfY3R4W2N1cl9waXBlLT5wcmV2X29kbV9waXBlLT5waXBlX2lkeF07CisKKwkJCWlmIChj
dXJfcGlwZS0+bmV4dF9vZG1fcGlwZSkKKwkJCQljdXJfcGlwZS0+bmV4dF9vZG1fcGlwZSA9ICZu
ZXdfY3R4LT5yZXNfY3R4LnBpcGVfY3R4W2N1cl9waXBlLT5uZXh0X29kbV9waXBlLT5waXBlX2lk
eF07CisKIAl9CiAKIAlmb3IgKGkgPSAwOyBpIDwgbmV3X2N0eC0+c3RyZWFtX2NvdW50OyBpKysp
IHsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xp
bmtfZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZHAu
YwppbmRleCA0MDA2NzQwM2IwNDMuLmY1NzQyNzE5YjVkOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kcC5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZHAuYwpAQCAtMzE4OCw3ICszMTg4LDcg
QEAgYm9vbCBkY19saW5rX2RwX3NldF90ZXN0X3BhdHRlcm4oCiAJbWVtc2V0KCZ0cmFpbmluZ19w
YXR0ZXJuLCAwLCBzaXplb2YodHJhaW5pbmdfcGF0dGVybikpOwogCiAJZm9yIChpID0gMDsgaSA8
IE1BWF9QSVBFUzsgaSsrKSB7Ci0JCWlmIChwaXBlc1tpXS5zdHJlYW0tPmxpbmsgPT0gbGluaykg
eworCQlpZiAocGlwZXNbaV0uc3RyZWFtLT5saW5rID09IGxpbmsgJiYgIXBpcGVzW2ldLnRvcF9w
aXBlICYmICFwaXBlc1tpXS5wcmV2X29kbV9waXBlKSB7CiAJCQlwaXBlX2N0eCA9ICZwaXBlc1tp
XTsKIAkJCWJyZWFrOwogCQl9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
