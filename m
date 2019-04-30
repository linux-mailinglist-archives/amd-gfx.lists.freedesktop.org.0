Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 979A61017F
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 23:10:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7246D89250;
	Tue, 30 Apr 2019 21:10:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740058.outbound.protection.outlook.com [40.107.74.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA5E89240
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 21:10:01 +0000 (UTC)
Received: from SN1PR12CA0071.namprd12.prod.outlook.com (2603:10b6:802:20::42)
 by SN1PR12MB2384.namprd12.prod.outlook.com (2603:10b6:802:25::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.10; Tue, 30 Apr
 2019 21:09:59 +0000
Received: from BY2NAM03FT031.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::201) by SN1PR12CA0071.outlook.office365.com
 (2603:10b6:802:20::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1835.12 via Frontend
 Transport; Tue, 30 Apr 2019 21:09:59 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT031.mail.protection.outlook.com (10.152.84.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1835.14 via Frontend Transport; Tue, 30 Apr 2019 21:09:59 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Apr 2019
 16:09:49 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 09/20] drm/amd/display: Maintain z-ordering when creating
 planes
Date: Tue, 30 Apr 2019 17:09:16 -0400
Message-ID: <20190430210938.32335-19-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
References: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(376002)(346002)(136003)(2980300002)(428003)(189003)(199004)(5660300002)(2351001)(48376002)(7696005)(50466002)(47776003)(478600001)(51416003)(72206003)(53416004)(2906002)(4326008)(36756003)(53936002)(6916009)(6666004)(356004)(14444005)(70586007)(2616005)(186003)(68736007)(86362001)(16586007)(486006)(1076003)(316002)(8676002)(70206006)(81156014)(81166006)(77096007)(476003)(50226002)(76176011)(26005)(126002)(336012)(305945005)(426003)(8936002)(11346002)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR12MB2384; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd9a7557-6d45-4238-936a-08d6cdb03447
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:SN1PR12MB2384; 
X-MS-TrafficTypeDiagnostic: SN1PR12MB2384:
X-Microsoft-Antispam-PRVS: <SN1PR12MB23846A940FC6556809FB9F1EF93A0@SN1PR12MB2384.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-Forefront-PRVS: 00235A1EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: KNWVxMkltU8d/SPj2OJhB8364tpP+57ebY7a3+wyFA3ech5+tunvOcYezs71cK2x/3BaFdsf+JGseRgs/qrIUeq+ZbOyfPePSFjIzeeWme23iuVMnlDelt+Vu9zLWpcL9jMMjdgF9gbfbzW2okhMwx8nIZ8cYCcP3z3P+CXhxBdEc698LBDLU7lVtCopMvXUKpQC6QXckHTE0oM0qr/VQNz6OyKMp7miI6nmiUYPuBLYSuGFMrXKqeB4ES6e5kA6rhEIlJVkl6oNXBTwJwRDQ5t2xVGw0ZOfai9EZG9fDOWv3AQJZToFa8AtOUvkxqKkopUa6abvgXhUNRLkjiuQCMP1CB3q/A+cq2KANWrXkJrEoliF27iqkTxTXOzAzhNTXSiK598qy5VWJhXH6Y+Z+6MF+rdQR/PLdVhYc/3/1dM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2019 21:09:59.2729 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd9a7557-6d45-4238-936a-08d6cdb03447
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2384
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=52YEsuTTLvEyetu62ZOrP2gdiaaNi/d5sKkOw87AReM=;
 b=UOr3p5LtuU3DlI6ApAYWryie37fHhcoznM/8lHgThQ8efXTO+rIEPbpQEwL11HioBpkHYxBJ8mbiyivf64uYIvbDSTD+WGGlXBX2snOVr1QL66X1ay9fG+JU1RoYActs5FqLatww/Ifb8dgvT7K4Y1ybOyoLVh+mHzanxYUSm1Q=
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
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgoK
W1doeV0KVGhlIG92ZXJsYXkgd2lsbCBiZSBpbmNvcnJlY3RseSBwbGFjZWQgKmJlbG93KiB0aGUg
cHJpbWFyeSBwbGFuZSBmb3IKY29tbWl0cyB3aXRoIHN0YXRlLT5hbGxvd19tb2Rlc2V0ID0gdHJ1
ZSBiZWNhdXNlIHRoZSBwcmltYXJ5IHBsYW5lCndvbid0IGJlIHJlbW92ZWQgYW5kIHJlY3JlYXRl
ZCBpbiB0aGUgc2FtZSBjb21taXQuCgpbSG93XQpBZGQgdGhlIHNob3VsZF9yZXNldF9wbGFuZSBo
ZWxwZXIgdG8gZGV0ZXJtaW5lIGlmIHRoZSBwbGFuZSBzaG91bGQgYmUKcmVzZXQgb3Igbm90LiBJ
ZiB3ZSBuZWVkIHRvIGFkZCBvciBmb3JjZSByZXNldCBhbnkgcGxhbmUgaW4gdGhlIGNvbnRleHQK
dGhlbiB3ZSdsbCBuZWVkIHRvIGRvIHRoZSBzYW1lIGZvciBldmVyeSBwbGFuZSBvbiB0aGUgc3Ry
ZWFtLgoKVW5mb3J0dW5hdGVseSB3ZSBuZWVkIHRvIGRvIHRoZSByZW1vdmUgLyByZWNyZWF0ZSBy
b3V0aW5lIGZvciByZW1vdmluZwpwbGFuZXMgYXMgd2VsbCBzaW5jZSBEQyBjdXJyZW50bHkgaXNu
J3Qgd2VsbCBlcXVpcHBlZCB0byBoYW5kbGUgdGhlCnBsYW5lIHdpdGggdGhlIHRvcCBwaXBlIGJl
aW5nIHJlbW92ZWQgd2l0aCBvdGhlciBwbGFuZXMgc3RpbGwgYWN0aXZlLgoKQ2hhbmdlLUlkOiBJ
NjI1MjliY2IxNGZlODIwYWRkZGE2OGNlNmU1ZjBhNGE0YjAwMWQ1NgpTaWduZWQtb2ZmLWJ5OiBO
aWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb20+ClJldmlld2Vk
LWJ5OiBTdW4gcGVuZyBMaSA8U3VucGVuZy5MaUBhbWQuY29tPgpBY2tlZC1ieTogQmhhd2FucHJl
ZXQgTGFraGEgPEJoYXdhbnByZWV0IExha2hhQGFtZC5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgNzQgKysrKysrKysrKysrKysrKystLQog
MSBmaWxlIGNoYW5nZWQsIDY5IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKaW5kZXgg
MGNiZmUyYjUyZTc5Li45Yjg1NDZjN2U5NDcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwpAQCAtNjE1Nyw2ICs2MTU3LDY5IEBAIHN0
YXRpYyBpbnQgZG1fdXBkYXRlX2NydGNfc3RhdGUoc3RydWN0IGFtZGdwdV9kaXNwbGF5X21hbmFn
ZXIgKmRtLAogCXJldHVybiByZXQ7CiB9CiAKK3N0YXRpYyBib29sIHNob3VsZF9yZXNldF9wbGFu
ZShzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUsCisJCQkgICAgICAgc3RydWN0IGRybV9w
bGFuZSAqcGxhbmUsCisJCQkgICAgICAgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqb2xkX3BsYW5l
X3N0YXRlLAorCQkJICAgICAgIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKm5ld19wbGFuZV9zdGF0
ZSkKK3sKKwlzdHJ1Y3QgZHJtX3BsYW5lICpvdGhlcjsKKwlzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRl
ICpvbGRfb3RoZXJfc3RhdGUsICpuZXdfb3RoZXJfc3RhdGU7CisJc3RydWN0IGRybV9jcnRjX3N0
YXRlICpuZXdfY3J0Y19zdGF0ZTsKKwlpbnQgaTsKKworCS8qCisJICogVE9ETzogUmVtb3ZlIHRo
aXMgaGFjayBvbmNlIHRoZSBjaGVja3MgYmVsb3cgYXJlIHN1ZmZpY2llbnQKKwkgKiBlbm91Z2gg
dG8gZGV0ZXJtaW5lIHdoZW4gd2UgbmVlZCB0byByZXNldCBhbGwgdGhlIHBsYW5lcyBvbgorCSAq
IHRoZSBzdHJlYW0uCisJICovCisJaWYgKHN0YXRlLT5hbGxvd19tb2Rlc2V0KQorCQlyZXR1cm4g
dHJ1ZTsKKworCS8qIEV4aXQgZWFybHkgaWYgd2Uga25vdyB0aGF0IHdlJ3JlIGFkZGluZyBvciBy
ZW1vdmluZyB0aGUgcGxhbmUuICovCisJaWYgKG9sZF9wbGFuZV9zdGF0ZS0+Y3J0YyAhPSBuZXdf
cGxhbmVfc3RhdGUtPmNydGMpCisJCXJldHVybiB0cnVlOworCisJLyogb2xkIGNydGMgPT0gbmV3
X2NydGMgPT0gTlVMTCwgcGxhbmUgbm90IGluIGNvbnRleHQuICovCisJaWYgKCFuZXdfcGxhbmVf
c3RhdGUtPmNydGMpCisJCXJldHVybiBmYWxzZTsKKworCW5ld19jcnRjX3N0YXRlID0KKwkJZHJt
X2F0b21pY19nZXRfbmV3X2NydGNfc3RhdGUoc3RhdGUsIG5ld19wbGFuZV9zdGF0ZS0+Y3J0Yyk7
CisKKwlpZiAoIW5ld19jcnRjX3N0YXRlKQorCQlyZXR1cm4gdHJ1ZTsKKworCWlmIChkcm1fYXRv
bWljX2NydGNfbmVlZHNfbW9kZXNldChuZXdfY3J0Y19zdGF0ZSkpCisJCXJldHVybiB0cnVlOwor
CisJLyoKKwkgKiBJZiB0aGVyZSBhcmUgYW55IG5ldyBwcmltYXJ5IG9yIG92ZXJsYXkgcGxhbmVz
IGJlaW5nIGFkZGVkIG9yCisJICogcmVtb3ZlZCB0aGVuIHRoZSB6LW9yZGVyIGNhbiBwb3RlbnRp
YWxseSBjaGFuZ2UuIFRvIGVuc3VyZQorCSAqIGNvcnJlY3Qgei1vcmRlciBhbmQgcGlwZSBhY3F1
aXNpdGlvbiB0aGUgY3VycmVudCBEQyBhcmNoaXRlY3R1cmUKKwkgKiByZXF1aXJlcyB1cyB0byBy
ZW1vdmUgYW5kIHJlY3JlYXRlIGFsbCBleGlzdGluZyBwbGFuZXMuCisJICoKKwkgKiBUT0RPOiBD
b21lIHVwIHdpdGggYSBtb3JlIGVsZWdhbnQgc29sdXRpb24gZm9yIHRoaXMuCisJICovCisJZm9y
X2VhY2hfb2xkbmV3X3BsYW5lX2luX3N0YXRlKHN0YXRlLCBvdGhlciwgb2xkX290aGVyX3N0YXRl
LCBuZXdfb3RoZXJfc3RhdGUsIGkpIHsKKwkJaWYgKG90aGVyLT50eXBlID09IERSTV9QTEFORV9U
WVBFX0NVUlNPUikKKwkJCWNvbnRpbnVlOworCisJCWlmIChvbGRfb3RoZXJfc3RhdGUtPmNydGMg
IT0gbmV3X3BsYW5lX3N0YXRlLT5jcnRjICYmCisJCSAgICBuZXdfb3RoZXJfc3RhdGUtPmNydGMg
IT0gbmV3X3BsYW5lX3N0YXRlLT5jcnRjKQorCQkJY29udGludWU7CisKKwkJaWYgKG9sZF9vdGhl
cl9zdGF0ZS0+Y3J0YyAhPSBuZXdfb3RoZXJfc3RhdGUtPmNydGMpCisJCQlyZXR1cm4gdHJ1ZTsK
KworCQkvKiBUT0RPOiBSZW1vdmUgdGhpcyBvbmNlIHdlIGNhbiBoYW5kbGUgZmFzdCBmb3JtYXQg
Y2hhbmdlcy4gKi8KKwkJaWYgKG9sZF9vdGhlcl9zdGF0ZS0+ZmIgJiYgbmV3X290aGVyX3N0YXRl
LT5mYiAmJgorCQkgICAgb2xkX290aGVyX3N0YXRlLT5mYi0+Zm9ybWF0ICE9IG5ld19vdGhlcl9z
dGF0ZS0+ZmItPmZvcm1hdCkKKwkJCXJldHVybiB0cnVlOworCX0KKworCXJldHVybiBmYWxzZTsK
K30KKwogc3RhdGljIGludCBkbV91cGRhdGVfcGxhbmVfc3RhdGUoc3RydWN0IGRjICpkYywKIAkJ
CQkgc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLAogCQkJCSBzdHJ1Y3QgZHJtX3BsYW5l
ICpwbGFuZSwKQEAgLTYxNzEsOCArNjIzNCw3IEBAIHN0YXRpYyBpbnQgZG1fdXBkYXRlX3BsYW5l
X3N0YXRlKHN0cnVjdCBkYyAqZGMsCiAJc3RydWN0IGRybV9jcnRjX3N0YXRlICpvbGRfY3J0Y19z
dGF0ZSwgKm5ld19jcnRjX3N0YXRlOwogCXN0cnVjdCBkbV9jcnRjX3N0YXRlICpkbV9uZXdfY3J0
Y19zdGF0ZSwgKmRtX29sZF9jcnRjX3N0YXRlOwogCXN0cnVjdCBkbV9wbGFuZV9zdGF0ZSAqZG1f
bmV3X3BsYW5lX3N0YXRlLCAqZG1fb2xkX3BsYW5lX3N0YXRlOwotCS8qIFRPRE8gcmV0dXJuIHBh
Z2VfZmxpcF9uZWVkZWQoKSBmdW5jdGlvbiAqLwotCWJvb2wgcGZsaXBfbmVlZGVkICA9ICFzdGF0
ZS0+YWxsb3dfbW9kZXNldDsKKwlib29sIG5lZWRzX3Jlc2V0OwogCWludCByZXQgPSAwOwogCiAK
QEAgLTYxODUsMTAgKzYyNDcsMTIgQEAgc3RhdGljIGludCBkbV91cGRhdGVfcGxhbmVfc3RhdGUo
c3RydWN0IGRjICpkYywKIAlpZiAocGxhbmUtPnR5cGUgPT0gRFJNX1BMQU5FX1RZUEVfQ1VSU09S
KQogCQlyZXR1cm4gMDsKIAorCW5lZWRzX3Jlc2V0ID0gc2hvdWxkX3Jlc2V0X3BsYW5lKHN0YXRl
LCBwbGFuZSwgb2xkX3BsYW5lX3N0YXRlLAorCQkJCQkgbmV3X3BsYW5lX3N0YXRlKTsKKwogCS8q
IFJlbW92ZSBhbnkgY2hhbmdlZC9yZW1vdmVkIHBsYW5lcyAqLwogCWlmICghZW5hYmxlKSB7Ci0J
CWlmIChwZmxpcF9uZWVkZWQgJiYKLQkJICAgIHBsYW5lLT50eXBlICE9IERSTV9QTEFORV9UWVBF
X09WRVJMQVkpCisJCWlmICghbmVlZHNfcmVzZXQpCiAJCQlyZXR1cm4gMDsKIAogCQlpZiAoIW9s
ZF9wbGFuZV9jcnRjKQpAQCAtNjIzOSw3ICs2MzAzLDcgQEAgc3RhdGljIGludCBkbV91cGRhdGVf
cGxhbmVfc3RhdGUoc3RydWN0IGRjICpkYywKIAkJaWYgKCFkbV9uZXdfY3J0Y19zdGF0ZS0+c3Ry
ZWFtKQogCQkJcmV0dXJuIDA7CiAKLQkJaWYgKHBmbGlwX25lZWRlZCAmJiBwbGFuZS0+dHlwZSAh
PSBEUk1fUExBTkVfVFlQRV9PVkVSTEFZKQorCQlpZiAoIW5lZWRzX3Jlc2V0KQogCQkJcmV0dXJu
IDA7CiAKIAkJV0FSTl9PTihkbV9uZXdfcGxhbmVfc3RhdGUtPmRjX3N0YXRlKTsKLS0gCjIuMTcu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
