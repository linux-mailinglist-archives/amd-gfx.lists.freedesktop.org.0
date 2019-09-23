Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8C8BADAF
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 08:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048816E0DE;
	Mon, 23 Sep 2019 06:14:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740054.outbound.protection.outlook.com [40.107.74.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996206E0DE
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 06:14:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W0STPbyjS9hwD/pWqMb/aCxXY2UxvzHRY1vHNgJXVeEQ2WXCVxvInP47feTUTvoPx3vwC7VN9KUip9Qx0N71WcWRDdhL2NA1B7l4v7N4RD58l2FYjf3+UmhH6Y/ujuuMV6ulf5PJT/cs4LmmBcXBODVp/nGayGi89xnM9uKn4vHZqDEvMeJ9nUOdJ5DiSBlKt/VlF0HbL2zz1N9zhryvuf+y8n6Q8CjGyMTgQJE5AGTBxCSSKTkvvnzk8P/SyT5fJthIJ/GFGCpA6pRp3Z1GIHnTHH8YL8i32UteIvWfdwIH7pEiRl8fs3hn90vmyXT7TVy11OrTtfu38a0Gv0/RLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0U8jvLBMNjUhOwZao9qA+QcVX8b42JUA/OrYraWRQU8=;
 b=mMSBNKmFNiIH6waVUG0wHB0vF82II6oyv9J7MQTQVLuQaarSQUlthTV1jW0uUWFA6SB4ZmpzLTmFEeeDdvPlYxnjJDLbBKbg3xNFr2zNO0oImrfWqHsfYGNYmk+DPGARJjxXlV8vWDw4JJajP5uh+mpWtcl0zpkjUlsJf3f7VIVE86yGHtuJk0LIZT0TR4yamni+F2k+DyZwFrB6sHoOc44aZLLvWwbdOkMsS9Qs83884+G14bffnkXqsk8aqjOmleEDIfppqXrj8pfhPBp/9H6/o1x4XpogOrblPSADIVOli92Acgbr5aEmkcSGQnwQOujK8SjI/Yyx1S6bAlA8zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0022.namprd12.prod.outlook.com (2603:10b6:610:57::32)
 by CH2PR12MB4117.namprd12.prod.outlook.com (2603:10b6:610:ae::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.18; Mon, 23 Sep
 2019 06:14:20 +0000
Received: from DM3NAM03FT038.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::207) by CH2PR12CA0022.outlook.office365.com
 (2603:10b6:610:57::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20 via Frontend
 Transport; Mon, 23 Sep 2019 06:14:20 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT038.mail.protection.outlook.com (10.152.83.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2284.20 via Frontend Transport; Mon, 23 Sep 2019 06:14:19 +0000
Received: from gc-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Mon, 23 Sep 2019 01:14:18 -0500
From: chen gong <curry.gong@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amd/powerplay: Add mode2 mode for GPU RESET
Date: Mon, 23 Sep 2019 14:14:07 +0800
Message-ID: <1569219248-29457-1-git-send-email-curry.gong@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(136003)(346002)(428003)(199004)(189003)(478600001)(2906002)(86362001)(51416003)(305945005)(126002)(2616005)(70206006)(476003)(70586007)(486006)(36756003)(50466002)(26005)(186003)(2351001)(6916009)(7696005)(47776003)(48376002)(336012)(53416004)(426003)(356004)(54906003)(4326008)(6666004)(50226002)(16586007)(316002)(14444005)(8676002)(81156014)(5660300002)(8936002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4117; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89dabe8e-06c2-494b-550f-08d73fed4509
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:CH2PR12MB4117; 
X-MS-TrafficTypeDiagnostic: CH2PR12MB4117:
X-Microsoft-Antispam-PRVS: <CH2PR12MB41171F56C40513CE93B4C4729D850@CH2PR12MB4117.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 0169092318
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: L0jjHC7rzzazQNO3J3NgGu65qBjExfsjYZ0r+jiGqwrKL8kDjE8SymD91EIIiujDXBw1bn44xtJs6GBxfw0nMJ8Fi3kvdfbj9HO3ZZwJUjVju9QP0B7ULDZKg/DSw/gxrx/BVn4qfXm24riFcNuOHKUjsKHUeb/3byaj9e7Iodle9oNHnGqMmoqzG/KTJJ0gpna7WwQ26VOTgUB1Q8AZAMXvvoIuzJNq5buVuvyIXT6DRGxp6383nALC35qazMM4VkMPW7b35aCwKM5I2YdS7cRy9pdp9vTOtJGA2hwXmDRaUNBWYo0Gu+5VALG0Ydz10RbHoS9mqdC5ehPdO25EPiBOpzAfe2s4pF3SlUWN7QcnHpqjeYhtGmhwmutB8pt3LsrB9SMK/LvNQEurKQmwyvpWxNqkOmuMB8OR8yqrrgM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2019 06:14:19.3322 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89dabe8e-06c2-494b-550f-08d73fed4509
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4117
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0U8jvLBMNjUhOwZao9qA+QcVX8b42JUA/OrYraWRQU8=;
 b=ri4zK4Zdzm+pjPXvdrV9v7cUYflKAd6OKsIzeRCYjYEG2m9aoGdD8t4kDil6De+/qLYuXyKhP7LcC8ISS6EMMn8+ObkwCLX8/C5Se4raNoyepa9IGOUu5kDWouWuM8RsOxfiqYmW08uEbikFaJ7jF4YqUfnzToud1d+XJG9nk+Q=
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
Cc: chen gong <curry.gong@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Q2hhbmdlcyB0byBmdW5jdGlvbiAic211X3N1c3BlbmQiIGluIGFtZGdwdV9zbXUuYyBpcyBhIHdv
cmthcm91bmQuCgpXZSBzaG91bGQgZ2V0IHJlYWwgaW5mb3JtYXRpb24gYWJvdXQgaWYgYmFjbyBp
cyBlbmFibGVkIG9yIG5vdCwgd2hpbGUgd2UKYWx3YXlzIGNvbnNpZGVyIEFQVSBTTVUgZmVhdHVy
ZSBhcyBlbmFibGVkIGluIGN1cnJlbnQgY29kZS4KCkkga25vdyBBUFUgZG8gbm90IHN1cHBvcnQg
YmFjbyBtb2RlIGZvciBHUFUgcmVzZXQsIHNvIEkgdXNlCiJhZGV2LT5mbGFncyIgdG8gc2tpcCBm
dW5jdGlvbiAic211X2ZlYXR1cmVfaXNfZW5hYmxlZCIuCgpTaWduZWQtb2ZmLWJ5OiBjaGVuIGdv
bmcgPGN1cnJ5LmdvbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9hbWRncHVfc211LmMgICAgIHwgNSArKysrLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvaW5jL2FtZGdwdV9zbXUuaCB8IDMgKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9zbXVfdjEyXzAuYyAgICAgIHwgNiArKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2FtZGdwdV9zbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2Ft
ZGdwdV9zbXUuYwppbmRleCA5MGZhNDQ0Li5lNTFkNzI3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCkBAIC0xMzYzLDcgKzEzNjMsMTAgQEAgc3RhdGljIGlu
dCBzbXVfc3VzcGVuZCh2b2lkICpoYW5kbGUpCiAJaW50IHJldDsKIAlzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqKWhhbmRsZTsKIAlzdHJ1Y3Qgc211
X2NvbnRleHQgKnNtdSA9ICZhZGV2LT5zbXU7Ci0JYm9vbCBiYWNvX2ZlYXR1cmVfaXNfZW5hYmxl
ZCA9IHNtdV9mZWF0dXJlX2lzX2VuYWJsZWQoc211LCBTTVVfRkVBVFVSRV9CQUNPX0JJVCk7CisJ
Ym9vbCBiYWNvX2ZlYXR1cmVfaXNfZW5hYmxlZCA9IGZhbHNlOworCisJaWYgKCEoYWRldi0+Zmxh
Z3MgJiBBTURfSVNfQVBVKSkKKwkJYmFjb19mZWF0dXJlX2lzX2VuYWJsZWQgPSBzbXVfZmVhdHVy
ZV9pc19lbmFibGVkKHNtdSwgU01VX0ZFQVRVUkVfQkFDT19CSVQpOwogCiAJcmV0ID0gc211X3N5
c3RlbV9mZWF0dXJlc19jb250cm9sKHNtdSwgZmFsc2UpOwogCWlmIChyZXQpCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaAppbmRleCA0NWRhMjFkLi4z
NWU4YjBjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1k
Z3B1X3NtdS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVf
c211LmgKQEAgLTUzNyw2ICs1MzcsNyBAQCBzdHJ1Y3Qgc211X2Z1bmNzCiAJZW51bSBzbXVfYmFj
b19zdGF0ZSAoKmJhY29fZ2V0X3N0YXRlKShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSk7CiAJaW50
ICgqYmFjb19zZXRfc3RhdGUpKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBlbnVtIHNtdV9iYWNv
X3N0YXRlIHN0YXRlKTsKIAlpbnQgKCpiYWNvX3Jlc2V0KShzdHJ1Y3Qgc211X2NvbnRleHQgKnNt
dSk7CisgICAgaW50ICgqbW9kZTJfcmVzZXQpKHN0cnVjdCBzbXVfY29udGV4dCAqc211KTsKIAlp
bnQgKCpnZXRfZHBtX3VsdGltYXRlX2ZyZXEpKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBlbnVt
IHNtdV9jbGtfdHlwZSBjbGtfdHlwZSwgdWludDMyX3QgKm1pbiwgdWludDMyX3QgKm1heCk7CiB9
OwogCkBAIC03NjAsNiArNzYxLDggQEAgc3RydWN0IHNtdV9mdW5jcwogCSgoc211KS0+ZnVuY3Mt
PmJhY29fZ2V0X3N0YXRlPyAoc211KS0+ZnVuY3MtPmJhY29fZ2V0X3N0YXRlKChzbXUpLCAoc3Rh
dGUpKSA6IDApCiAjZGVmaW5lIHNtdV9iYWNvX3Jlc2V0KHNtdSkgXAogCSgoc211KS0+ZnVuY3Mt
PmJhY29fcmVzZXQ/IChzbXUpLT5mdW5jcy0+YmFjb19yZXNldCgoc211KSkgOiAwKQorI2RlZmlu
ZSBzbXVfbW9kZTJfcmVzZXQoc211KSBcCisgICAgKChzbXUpLT5mdW5jcy0+bW9kZTJfcmVzZXQ/
IChzbXUpLT5mdW5jcy0+bW9kZTJfcmVzZXQoKHNtdSkpIDogMCkKICNkZWZpbmUgc211X2FzaWNf
c2V0X3BlcmZvcm1hbmNlX2xldmVsKHNtdSwgbGV2ZWwpIFwKIAkoKHNtdSktPnBwdF9mdW5jcy0+
c2V0X3BlcmZvcm1hbmNlX2xldmVsPyAoc211KS0+cHB0X2Z1bmNzLT5zZXRfcGVyZm9ybWFuY2Vf
bGV2ZWwoKHNtdSksIChsZXZlbCkpIDogLUVJTlZBTCk7CiAjZGVmaW5lIHNtdV9kdW1wX3BwdGFi
bGUoc211KSBcCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVf
djEyXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTJfMC5jCmluZGV4
IDI0Mjc0YzkuLmY3NjJhOTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L3NtdV92MTJfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92
MTJfMC5jCkBAIC0zMCw2ICszMCw3IEBACiAjaW5jbHVkZSAic29jMTVfY29tbW9uLmgiCiAjaW5j
bHVkZSAiYXRvbS5oIgogI2luY2x1ZGUgInJlbm9pcl9wcHQuaCIKKyNpbmNsdWRlICJod21nci5o
IgogCiAjaW5jbHVkZSAiYXNpY19yZWcvbXAvbXBfMTJfMF8wX29mZnNldC5oIgogI2luY2x1ZGUg
ImFzaWNfcmVnL21wL21wXzEyXzBfMF9zaF9tYXNrLmgiCkBAIC0zODAsNiArMzgxLDEwIEBAIHN0
YXRpYyBpbnQgc211X3YxMl8wX2dldF9kcG1fdWx0aW1hdGVfZnJlcShzdHJ1Y3Qgc211X2NvbnRl
eHQgKnNtdSwgZW51bSBzbXVfY2xrCiAJcmV0dXJuIHJldDsKIH0KIAorc3RhdGljIGludCBzbXVf
djEyXzBfbW9kZTJfcmVzZXQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpeworCXJldHVybiBzbXVf
djEyXzBfc2VuZF9tc2dfd2l0aF9wYXJhbShzbXUsIFNNVV9NU0dfR2Z4RGV2aWNlRHJpdmVyUmVz
ZXQsIFNNVV9BU0lDX1JFU0VUX01PREVfMik7Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc211
X2Z1bmNzIHNtdV92MTJfMF9mdW5jcyA9IHsKIAkuY2hlY2tfZndfc3RhdHVzID0gc211X3YxMl8w
X2NoZWNrX2Z3X3N0YXR1cywKIAkuY2hlY2tfZndfdmVyc2lvbiA9IHNtdV92MTJfMF9jaGVja19m
d192ZXJzaW9uLApAQCAtMzk0LDYgKzM5OSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc211X2Z1
bmNzIHNtdV92MTJfMF9mdW5jcyA9IHsKIAkuZmluaV9zbWNfdGFibGVzID0gc211X3YxMl8wX2Zp
bmlfc21jX3RhYmxlcywKIAkucG9wdWxhdGVfc21jX3RhYmxlcyA9IHNtdV92MTJfMF9wb3B1bGF0
ZV9zbWNfdGFibGVzLAogCS5nZXRfZHBtX3VsdGltYXRlX2ZyZXEgPSBzbXVfdjEyXzBfZ2V0X2Rw
bV91bHRpbWF0ZV9mcmVxLAorCS5tb2RlMl9yZXNldCA9IHNtdV92MTJfMF9tb2RlMl9yZXNldCwK
IH07CiAKIHZvaWQgc211X3YxMl8wX3NldF9zbXVfZnVuY3Moc3RydWN0IHNtdV9jb250ZXh0ICpz
bXUpCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
