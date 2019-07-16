Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4586A435
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 10:49:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A0036E0CD;
	Tue, 16 Jul 2019 08:49:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760070.outbound.protection.outlook.com [40.107.76.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A356E0CD
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 08:49:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HPS4+omRoSZr0MCI5hviaLV45+R6MCh+KLySiEial9IFL4vD52y92iBh0lauY8knpkATYlH3hIVs57Y9xV1gjT1OrOpU+v70+uLfv2tQXgHjLDjBdIvTjoCuIcJKluJx9+xdEP3brLl83oOTIceUS0OY7neHyrU1GJAxYgB5zkNIuh7f3n2wZGznpbA1Fl1oirnVnEw4GFxOkfN3FUP1fbxg+zvZXCAKTwDN/MJo5xy+DeWZmvKVuf3bQxLpPdRFi7s/tShLU3ozGBKSCj61mOeWvrz4d0dWLWZNTip2L8bONwWmuvxoqKvPKwCcZvo+r2p76cRXNU5Yx9iS9sUZ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t3FsEqe80fBGJS8NYwIOdJVwKpsPtWEFkysJPsDu/oY=;
 b=hrn7TSvEpWzOSHgMLqSKWm4+IUpQbv8p9tw0fSSiZy1cTFI3q6hOOU/iUtWX58wW5em446BuzqRqbDfzkdeg/j/43p2TQili9/8CN+5/c2JfhCI/3IFoh8RwYmpztN9Ih18whOITbCv6mVw60E81yJwJFjajhbsVL/z9QUgJmo63FgPHS3qoDr4Zrw9/dejdz9rmWqLYt/eEwPanWVSh82BXxE/pfBUK5tk3W7FIjtK762pzBpffxfB77ldXhVyIek9pLb4OtJCxQDnfbbSVMyhHxzzw57uE2HTNREOSuwsF8h+UfRs2iSsIPhOTscdOAtdfqxyE+MG0C8vKBP8R1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MN2PR12CA0019.namprd12.prod.outlook.com (20.179.80.32) by
 CH2PR12MB3927.namprd12.prod.outlook.com (52.132.246.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 08:49:23 +0000
Received: from BY2NAM03FT006.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::205) by MN2PR12CA0019.outlook.office365.com
 (2603:10b6:208:a8::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.19 via Frontend
 Transport; Tue, 16 Jul 2019 08:49:23 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT006.mail.protection.outlook.com (10.152.84.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 16 Jul 2019 08:49:22 +0000
Received: from lnx-kenneth.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 16 Jul 2019
 03:49:20 -0500
From: Kenneth Feng <kenneth.feng@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: enable fw ctf,apcc dfll and gfx ss
Date: Tue, 16 Jul 2019 16:49:11 +0800
Message-ID: <1563266951-30106-1-git-send-email-kenneth.feng@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(396003)(346002)(136003)(2980300002)(428003)(189003)(199004)(5660300002)(356004)(47776003)(53936002)(6666004)(86362001)(7696005)(51416003)(8676002)(2351001)(305945005)(4326008)(70586007)(70206006)(36756003)(2906002)(478600001)(186003)(68736007)(14444005)(6916009)(53416004)(336012)(50226002)(8936002)(50466002)(26005)(486006)(48376002)(16586007)(44832011)(316002)(426003)(2616005)(476003)(81166006)(81156014)(126002)(142933001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3927; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6906b808-858e-4bac-89c3-08d709ca7fc3
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CH2PR12MB3927; 
X-MS-TrafficTypeDiagnostic: CH2PR12MB3927:
X-Microsoft-Antispam-PRVS: <CH2PR12MB3927E45BA611D0B9CC8E77DA8ECE0@CH2PR12MB3927.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 0100732B76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: m2ElDiMCXDUBhlMwL9QgNPgPmgPLChG07RDx8olfi4ucUXd0NFvLZJ3Dllj/wBOJT5bguXLYfGQ4z4UA746mPfeVErV+B9JhVYDSxdnHfkPaGYpn2Osv5+hyEeh3wmUJMTNEcJtHP0/DXIOeGcdY8bDtlk8D+86r2RrotnOhEtl3hw7b/6lfFQ6ACaXO6jPL4rZCOuQena9naZnJp4T53sReg6nX7/AfY+0yfqd00he5YfR2B4fYkl1kD8aHuE0ocB8xBqjKQKGwcEBsJWBU2B89AnNuJsVYl8Nt0Jc5ibLsCKhT9ChEJ3NcBHm3tpKWhRPvmu/qCQucymJLdNQx0gcIpgzcbA9wHhLWWvSPP1ck+DPYJDnBKYV/pJuCRqsNc1DTWLW7GJPT0BoIYroRiMmmLUcdMNjonqRykSKT/O8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2019 08:49:22.6198 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6906b808-858e-4bac-89c3-08d709ca7fc3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3927
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t3FsEqe80fBGJS8NYwIOdJVwKpsPtWEFkysJPsDu/oY=;
 b=oNbGhURxCWzMisNqcXdpu8dxxFozrMIrsEWfq0AgQ43bR7eNczgZVs83ekgR6MkV/r43v36SFdo383kdiaAMY2TjMqbFnX4wwYxLJbTpp3tGBA99aKKYXbczu32Vf2iQokYGKBE0Sgwv0EKfEaklsCarm3DKbVkzOw0ETgqXNKY=
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
Cc: Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

ZW5hYmxlIGZ3IGN0ZiwgYXBjYyBkZmxsIGFuZCBnZnggc3Mgb24gbmF2aTEwLgpmdyBjdGY6IHdo
ZW4gdGhlIGZ3IGN0ZiBpcyB0cmlnZ2VyZWQsIHRoZSBnZnggYW5kIHNvYyBwb3dlciBkb21haW4K
YXJlIHNodXQgZG93bi4gZmFuIHNwZWVkIGlzIGJvb3N0ZWQgdG8gdGhlIG1heGltdW0uCmdmeCBz
czogaGFyZHdhcmUgZmVhdHVyZSwgc2FuaXR5IGNoZWNrIGhhcyBiZWVuIGRvbmUuCmFwY2MgZGZs
bDogY2FuIGNoZWNrIHRoZSBzY29yZWJvYXJkIGluIHNtdSBmdyB0byBjb25maXJtIGlmIGl0J3Mg
ZW5hYmxlZC4Kbm8gbmVlZCB0byBkbyBmdXJodGVyIGNoZWNrIHNpbmNlIHRoZSBnZnggaGFyZHdh
cmUgY29udHJvbCB0aGUgZnJxdWVuY3kgb25jZQphIHBjYyBzaWduYWwgY29tZXMuCgpTaWduZWQt
b2ZmLWJ5OiBLZW5uZXRoIEZlbmcgPGtlbm5ldGguZmVuZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyB8IDExICsrKysrLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwppbmRleCA4OTVhNGU1Li5mYTYzNmQyIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCkBAIC0zMzEsNyAr
MzMxLDEwIEBAIG5hdmkxMF9nZXRfYWxsb3dlZF9mZWF0dXJlX21hc2soc3RydWN0IHNtdV9jb250
ZXh0ICpzbXUsCiAJCQkJfCBGRUFUVVJFX01BU0soRkVBVFVSRV9EU19EQ0VGQ0xLX0JJVCkKIAkJ
CQl8IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0ZXX0RTVEFURV9CSVQpCiAJCQkJfCBGRUFUVVJFX01B
U0soRkVBVFVSRV9CQUNPX0JJVCkKLQkJCQl8IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0FDRENfQklU
KTsKKwkJCQl8IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0FDRENfQklUKQorCQkJCXwgRkVBVFVSRV9N
QVNLKEZFQVRVUkVfR0ZYX1NTX0JJVCkKKwkJCQl8IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0FQQ0Nf
REZMTF9CSVQpCisJCQkJfCBGRUFUVVJFX01BU0soRkVBVFVSRV9GV19DVEZfQklUKTsKIAogCWlm
IChhZGV2LT5wbS5wcF9mZWF0dXJlICYgUFBfTUNMS19EUE1fTUFTSykKIAkJKih1aW50NjRfdCAq
KWZlYXR1cmVfbWFzayB8PSBGRUFUVVJFX01BU0soRkVBVFVSRV9EUE1fVUNMS19CSVQpCkBAIC0z
MzksOCArMzQyLDcgQEAgbmF2aTEwX2dldF9hbGxvd2VkX2ZlYXR1cmVfbWFzayhzdHJ1Y3Qgc211
X2NvbnRleHQgKnNtdSwKIAkJCQl8IEZFQVRVUkVfTUFTSyhGRUFUVVJFX01FTV9NVkREX1NDQUxJ
TkdfQklUKTsKIAogCWlmIChhZGV2LT5wbS5wcF9mZWF0dXJlICYgUFBfR0ZYT0ZGX01BU0spIHsK
LQkJKih1aW50NjRfdCAqKWZlYXR1cmVfbWFzayB8PSBGRUFUVVJFX01BU0soRkVBVFVSRV9HRlhf
U1NfQklUKQotCQkJCXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVfR0ZYT0ZGX0JJVCk7CisJCSoodWlu
dDY0X3QgKilmZWF0dXJlX21hc2sgfD0gRkVBVFVSRV9NQVNLKEZFQVRVUkVfR0ZYT0ZGX0JJVCk7
CiAJCS8qIFRPRE86IHJlbW92ZSBpdCBvbmNlIGZ3IGZpeCB0aGUgYnVnICovCiAJCSoodWludDY0
X3QgKilmZWF0dXJlX21hc2sgJj0gfkZFQVRVUkVfTUFTSyhGRUFUVVJFX0ZXX0RTVEFURV9CSVQp
OwogCX0KQEAgLTQ2NSw5ICs0NjcsNiBAQCBzdGF0aWMgaW50IG5hdmkxMF9hcHBlbmRfcG93ZXJw
bGF5X3RhYmxlKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQogCXNtY19wcHRhYmxlLT5NdmRkUmF0
aW8gPSBzbWNfZHBtX3RhYmxlLT5NdmRkUmF0aW87CiAKIAlpZiAoYWRldi0+cG0ucHBfZmVhdHVy
ZSAmIFBQX0dGWE9GRl9NQVNLKSB7Ci0JCSoodWludDY0X3QgKilzbWNfcHB0YWJsZS0+RmVhdHVy
ZXNUb1J1biB8PSBGRUFUVVJFX01BU0soRkVBVFVSRV9HRlhfU1NfQklUKQotCQkJCQl8IEZFQVRV
UkVfTUFTSyhGRUFUVVJFX0dGWE9GRl9CSVQpOwotCiAJCS8qIFRPRE86IHJlbW92ZSBpdCBvbmNl
IFNNVSBmdyBmaXggaXQgKi8KIAkJc21jX3BwdGFibGUtPkRlYnVnT3ZlcnJpZGVzIHw9IERQTV9P
VkVSUklERV9ESVNBQkxFX0RGTExfUExMX1NIVVRET1dOOwogCX0KLS0gCjIuNy40CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
