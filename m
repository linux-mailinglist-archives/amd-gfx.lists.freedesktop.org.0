Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC0C1017C
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 23:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A13CD89241;
	Tue, 30 Apr 2019 21:09:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710058.outbound.protection.outlook.com [40.107.71.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE8789226
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 21:09:58 +0000 (UTC)
Received: from DM3PR12CA0108.namprd12.prod.outlook.com (2603:10b6:0:55::28) by
 SN1PR12MB0653.namprd12.prod.outlook.com (2a01:111:e400:c428::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1835.14; Tue, 30 Apr
 2019 21:09:57 +0000
Received: from BY2NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::201) by DM3PR12CA0108.outlook.office365.com
 (2603:10b6:0:55::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1835.12 via Frontend
 Transport; Tue, 30 Apr 2019 21:09:56 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT009.mail.protection.outlook.com (10.152.84.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1835.14 via Frontend Transport; Tue, 30 Apr 2019 21:09:56 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Apr 2019
 16:09:47 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 06/20] drm/amd/display: Read eDP link settings on detection
Date: Tue, 30 Apr 2019 17:09:10 -0400
Message-ID: <20190430210938.32335-13-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
References: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(136003)(346002)(376002)(39860400002)(2980300002)(428003)(189003)(199004)(6916009)(26005)(8676002)(68736007)(316002)(77096007)(4326008)(186003)(72206003)(48376002)(50466002)(36756003)(478600001)(16586007)(2906002)(6666004)(1076003)(47776003)(486006)(53416004)(8936002)(305945005)(86362001)(70206006)(426003)(2351001)(356004)(5660300002)(446003)(14444005)(126002)(2616005)(11346002)(7696005)(476003)(50226002)(76176011)(51416003)(53936002)(70586007)(81166006)(336012)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR12MB0653; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8ac6b02-fea3-47ef-ada2-08d6cdb03297
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:SN1PR12MB0653; 
X-MS-TrafficTypeDiagnostic: SN1PR12MB0653:
X-Microsoft-Antispam-PRVS: <SN1PR12MB0653BDA576F79BB8FD4E66D3F93A0@SN1PR12MB0653.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 00235A1EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: XLgJYI8Np15bKjwfUez/5HREe0sSHeqyXAmkjF259FTcav8BjHIeGO8W0l/ouTkLgvf/MLZ15N/KqN3plVIJsKPb7ptHaOj1nuppW6XgJPUjK2fFVyo7YFHaL9fDcoAoj/WgLmubRY+ABeO/cLxnnsYhLzd3OGo+psDe3MYp+y8jCcjtNYPFVSZbJVg2CKj8m7I1zojHZhnp3p8vgNhu3N3/rDb1qIe8grVp3OUP/jz3j9EPAVmqZByeTBLhQqr8ow2fMUxkF2+1Epo+K5AxFIU/+jo5Iwk/nIH71Wk1kH4SAYGG/NrVl05ZVqRZwOZaE3cXWsGVMurSZtnRBk7FwMuhfIazNgFRP2p0MPvq61w3mAw08ZPWjiOB8XsI/Q14FmIIfEMP0FbsbLO89rLNHYzgjfUEfQ44tztwAzmzNCs=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2019 21:09:56.4381 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ac6b02-fea3-47ef-ada2-08d6cdb03297
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB0653
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iu490s6FU4kJ7otWLY6kIGbP4/c7RKGYnRsxJJqkNrU=;
 b=M/pDs/z9edt0G30x6hVMecQn+DwDOeLBpe+zyrp4DJYj7CO0FUn3oW2Mtt3C+tFZSZvOOusltpYIX3UOqZlMFHigE0sybVW2WDcUkDfk+gTnzN+APNbpQFlurgcbCgZumLrFKKnMAHaNzIFnR1Jyrh9b0Vg8Oug5ucTmzD8BfRc=
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
Cc: Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQW50aG9ueSBLb28gPEFudGhvbnkuS29vQGFtZC5jb20+CgpbV2h5XQpVbmxpa2UgZXh0
ZXJuYWwgRFAgcGFuZWxzLCBpbnRlcm5hbCBlRFAgZG9lcyBub3QgcGVyZm9ybQp2ZXJpZnkgbGlu
ayBjYXBzIGJlY2F1c2UgdGhlIHBhbmVsIGNvbm5lY3Rpb24gaXMgZml4ZWQuCgpTbyBpZiBHT1Ag
ZW5hYmxlZCB0aGUgZURQIGF0IGJvb3QsIHdlIGNhbiByZXRhaW4gaXRzCnRyYWluZWQgbGluayBz
ZXR0aW5ncyB0byBvcHRpbWl6ZS4KCltIb3ddClJlYWQgdGhlIGxhbmUgY291bnQgYW5kIGxpbmsg
cmF0ZSBieSByZWFkaW5nIHRoaXMKaW5mb3JtYXRpb24gZnJvbSBEUENEIDEwMGgsIDEwMWgsIDEx
NWgKCkNoYW5nZS1JZDogSWYyZjk1ODg0MDE3MzEyMzdlNGRkN2M1ODdmNDIxN2JjYTRlNWUwOGUK
U2lnbmVkLW9mZi1ieTogQW50aG9ueSBLb28gPEFudGhvbnkuS29vQGFtZC5jb20+ClJldmlld2Vk
LWJ5OiBBcmljIEN5ciA8QXJpYy5DeXJAYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExh
a2hhIDxCaGF3YW5wcmVldCBMYWtoYUBhbWQuY29tPgotLS0KIC4uLi9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2NvcmUvZGNfbGlua19kcC5jICB8IDMwICsrKysrKysrKysrKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kcC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2NvcmUvZGNfbGlua19kcC5jCmluZGV4IGFjYjRmODI5ZTA0Mi4uYmE3NTAyZjNk
MGViIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19s
aW5rX2RwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlu
a19kcC5jCkBAIC0yNTg3LDYgKzI1ODcsOSBAQCB2b2lkIGRldGVjdF9lZHBfc2lua19jYXBzKHN0
cnVjdCBkY19saW5rICpsaW5rKQogCXVpbnQzMl90IGVudHJ5OwogCXVpbnQzMl90IGxpbmtfcmF0
ZV9pbl9raHo7CiAJZW51bSBkY19saW5rX3JhdGUgbGlua19yYXRlID0gTElOS19SQVRFX1VOS05P
V047CisJdW5pb24gbGFuZV9jb3VudF9zZXQgbGFuZV9jb3VudF9zZXQgPSB7IHswfSB9OworCXVp
bnQ4X3QgbGlua19id19zZXQ7CisJdWludDhfdCBsaW5rX3JhdGVfc2V0OwogCiAJcmV0cmlldmVf
bGlua19jYXAobGluayk7CiAJbGluay0+ZHBjZF9jYXBzLmVkcF9zdXBwb3J0ZWRfbGlua19yYXRl
c19jb3VudCA9IDA7CkBAIC0yNjEyLDYgKzI2MTUsMzMgQEAgdm9pZCBkZXRlY3RfZWRwX3Npbmtf
Y2FwcyhzdHJ1Y3QgZGNfbGluayAqbGluaykKIAkJfQogCX0KIAlsaW5rLT52ZXJpZmllZF9saW5r
X2NhcCA9IGxpbmstPnJlcG9ydGVkX2xpbmtfY2FwOworCisJLy8gUmVhZCBEUENEIDAwMTAxaCB0
byBmaW5kIG91dCB0aGUgbnVtYmVyIG9mIGxhbmVzIGN1cnJlbnRseSBzZXQKKwljb3JlX2xpbmtf
cmVhZF9kcGNkKGxpbmssIERQX0xBTkVfQ09VTlRfU0VULAorCQkJJmxhbmVfY291bnRfc2V0LnJh
dywgc2l6ZW9mKGxhbmVfY291bnRfc2V0KSk7CisJbGluay0+Y3VyX2xpbmtfc2V0dGluZ3MubGFu
ZV9jb3VudCA9IGxhbmVfY291bnRfc2V0LmJpdHMuTEFORV9DT1VOVF9TRVQ7CisKKwkvLyBSZWFk
IERQQ0QgMDAxMDBoIHRvIGZpbmQgaWYgc3RhbmRhcmQgbGluayByYXRlcyBhcmUgc2V0CisJY29y
ZV9saW5rX3JlYWRfZHBjZChsaW5rLCBEUF9MSU5LX0JXX1NFVCwKKwkJCSZsaW5rX2J3X3NldCwg
c2l6ZW9mKGxpbmtfYndfc2V0KSk7CisKKwlpZiAobGlua19id19zZXQgPT0gMCkgeworCQkvKiBJ
ZiBzdGFuZGFyZCBsaW5rIHJhdGVzIGFyZSBub3QgYmVpbmcgdXNlZCwKKwkJICogUmVhZCBEUENE
IDAwMTE1aCB0byBmaW5kIHRoZSBsaW5rIHJhdGUgc2V0IHVzZWQKKwkJICovCisJCWNvcmVfbGlu
a19yZWFkX2RwY2QobGluaywgRFBfTElOS19SQVRFX1NFVCwKKwkJCQkmbGlua19yYXRlX3NldCwg
c2l6ZW9mKGxpbmtfcmF0ZV9zZXQpKTsKKworCQlpZiAobGlua19yYXRlX3NldCA8IGxpbmstPmRw
Y2RfY2Fwcy5lZHBfc3VwcG9ydGVkX2xpbmtfcmF0ZXNfY291bnQpIHsKKwkJCWxpbmstPmN1cl9s
aW5rX3NldHRpbmdzLmxpbmtfcmF0ZSA9CisJCQkJbGluay0+ZHBjZF9jYXBzLmVkcF9zdXBwb3J0
ZWRfbGlua19yYXRlc1tsaW5rX3JhdGVfc2V0XTsKKwkJCWxpbmstPmN1cl9saW5rX3NldHRpbmdz
LmxpbmtfcmF0ZV9zZXQgPSBsaW5rX3JhdGVfc2V0OworCQkJbGluay0+Y3VyX2xpbmtfc2V0dGlu
Z3MudXNlX2xpbmtfcmF0ZV9zZXQgPSB0cnVlOworCQl9CisJfSBlbHNlIHsKKwkJbGluay0+Y3Vy
X2xpbmtfc2V0dGluZ3MubGlua19yYXRlID0gbGlua19id19zZXQ7CisJCWxpbmstPmN1cl9saW5r
X3NldHRpbmdzLnVzZV9saW5rX3JhdGVfc2V0ID0gZmFsc2U7CisJfQogfQogCiB2b2lkIGRjX2xp
bmtfZHBfZW5hYmxlX2hwZChjb25zdCBzdHJ1Y3QgZGNfbGluayAqbGluaykKLS0gCjIuMTcuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
