Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 955DE64A49
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Jul 2019 17:59:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B5BB6E108;
	Wed, 10 Jul 2019 15:59:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730060.outbound.protection.outlook.com [40.107.73.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E09286E108
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jul 2019 15:59:14 +0000 (UTC)
Received: from DM6PR12CA0004.namprd12.prod.outlook.com (2603:10b6:5:1c0::17)
 by BN8PR12MB2852.namprd12.prod.outlook.com (2603:10b6:408:9a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.18; Wed, 10 Jul
 2019 15:59:13 +0000
Received: from BY2NAM03FT026.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::209) by DM6PR12CA0004.outlook.office365.com
 (2603:10b6:5:1c0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.18 via Frontend
 Transport; Wed, 10 Jul 2019 15:59:12 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT026.mail.protection.outlook.com (10.152.84.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Wed, 10 Jul 2019 15:59:12 +0000
Received: from hawzhang-All-Series.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Wed, 10 Jul 2019 10:59:05 -0500
From: Hawking Zhang <Hawking.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Xiaojie Yuan <Xiaojie.Yuan@amd.com>,
 "John Clements" <John.Clements@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>
Subject: [PATCH 1/2] drm/amdgpu: switch to macro for psp bootloader command
Date: Wed, 10 Jul 2019 23:58:57 +0800
Message-ID: <1562774338-4457-1-git-send-email-Hawking.Zhang@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(376002)(346002)(2980300002)(428003)(199004)(189003)(478600001)(81166006)(8676002)(305945005)(53416004)(336012)(8936002)(5660300002)(81156014)(6666004)(110136005)(356004)(47776003)(316002)(53936002)(16586007)(426003)(7696005)(70586007)(48376002)(486006)(50226002)(68736007)(70206006)(4326008)(2906002)(186003)(6636002)(2616005)(36756003)(476003)(26005)(50466002)(51416003)(86362001)(126002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB2852; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c35086d-747f-414e-b3b6-08d7054f8d34
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN8PR12MB2852; 
X-MS-TrafficTypeDiagnostic: BN8PR12MB2852:
X-Microsoft-Antispam-PRVS: <BN8PR12MB2852DC21C06B31A4BB7B2956FCF00@BN8PR12MB2852.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-Forefront-PRVS: 0094E3478A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 6cAUDgYaOgxIBUdETtNwHSSpj40G+MXLmDsI/9m8XADcZrOFrVVDYZiMxY51Vs0Ija+eYldnOgG9ZDV0yiwC0VjXSs/QD9CkL6heUyny5Vrg+MFwQ6HZnJOakIJHTNShcM/sp74RPdAD/k7Gc5IlmmEjiR28+ndeKxtSYTQ1gqFcEnFgMVSaiZqTaQcCjaauUf89OflOiRE86nKQNiKF0TN6Kx3THeap3b9NHaPMY8IBAyhKefGfKyGThNBSyNREKwETMnEj2ZKswD8uoYqtoqHCCu3+huCIwP5T9W8yUGrMol/W01K0MIozlaZC9rv32U2vjiO9jAeF69ti1Shdyw6d0f93ydFCwE9ItGGvYgyMY94aMNELRNhTxYckmS2rW44Fj4nlmdR/3+BidAwZIiF1B1a+ulwWwVElFFJjhGk=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2019 15:59:12.3846 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c35086d-747f-414e-b3b6-08d7054f8d34
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2852
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/R6nu5wifEZKGKpuRv0sXicDDNkGt2zeuyk2mxx8FnM=;
 b=NZ9WBS9+WGOGwzrpmXj7ZgjbEAx//4ywxHXHe2O8gB0AzNSC7A4wDsfUrjPM6o1eIVchV03gTU/x0HSCvO1z46Ci8nkRWaTCt6PkmS6xmI11e6F2TBpL7Rib0rZqVIq/w0vgqdNXReizfK0eHDmuZCcRewMN2gQSP/1f4PZ6uCI=
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
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Q2hhbmdlLUlkOiBJZWY0YzFlNWNhMDFkZjBhMDI4YTc4NGMwZmFmMzc1NDQ5Mzk3MzNhMwpTaWdu
ZWQtb2ZmLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5oIHwgOSArKysrKysrKysKIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92MTFfMC5jICB8IDQgKystLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvcHNwX3YzXzEuYyAgIHwgNCArKy0tCiAzIGZpbGVzIGNoYW5nZWQsIDEz
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3BzcC5oCmluZGV4IGUyOGNmNWUuLjhkZGNlYzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcHNwLmgKQEAgLTQyLDYgKzQyLDE1IEBAIHN0cnVjdCBwc3BfY29udGV4
dDsKIHN0cnVjdCBwc3BfeGdtaV9ub2RlX2luZm87CiBzdHJ1Y3QgcHNwX3hnbWlfdG9wb2xvZ3lf
aW5mbzsKIAorZW51bSBwc3BfYm9vdGxvYWRlcl9jbWQgeworCVBTUF9CTF9fTE9BRF9TWVNEUlYJ
CT0gMHgxMDAwMCwKKwlQU1BfQkxfX0xPQURfU09TRFJWCQk9IDB4MjAwMDAsCisJUFNQX0JMX19O
T19FQ0MJCQk9IDB4NDAwMDAsCisJUFNQX0JMX19QQVJUSUFMX0VDQwkJPSAweDUwMDAwLAorCVBT
UF9CTF9fRlVMTF9FQ0MJCT0gMHg2MDAwMCwKKwlQU1BfQkxfX0xPQURfS0VZX0RBVEFCQVNFCT0g
MHg4MDAwMCwKK307CisKIGVudW0gcHNwX3JpbmdfdHlwZQogewogCVBTUF9SSU5HX1RZUEVfX0lO
VkFMSUQgPSAwLApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3Yx
MV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYwppbmRleCAxYjZj
MjBjLi5lNzg0MDkxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3Bf
djExXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYwpAQCAt
MjEyLDcgKzIxMiw3IEBAIHN0YXRpYyBpbnQgcHNwX3YxMV8wX2Jvb3Rsb2FkZXJfbG9hZF9zeXNk
cnYoc3RydWN0IHBzcF9jb250ZXh0ICpwc3ApCiAJLyogUHJvdmlkZSB0aGUgc3lzIGRyaXZlciB0
byBib290bG9hZGVyICovCiAJV1JFRzMyX1NPQzE1KE1QMCwgMCwgbW1NUDBfU01OX0MyUE1TR18z
NiwKIAkgICAgICAgKHVpbnQzMl90KShwc3AtPmZ3X3ByaV9tY19hZGRyID4+IDIwKSk7Ci0JcHNw
X2dmeGRydl9jb21tYW5kX3JlZyA9IDEgPDwgMTY7CisJcHNwX2dmeGRydl9jb21tYW5kX3JlZyA9
IFBTUF9CTF9fTE9BRF9TWVNEUlY7CiAJV1JFRzMyX1NPQzE1KE1QMCwgMCwgbW1NUDBfU01OX0My
UE1TR18zNSwKIAkgICAgICAgcHNwX2dmeGRydl9jb21tYW5kX3JlZyk7CiAKQEAgLTI1Myw3ICsy
NTMsNyBAQCBzdGF0aWMgaW50IHBzcF92MTFfMF9ib290bG9hZGVyX2xvYWRfc29zKHN0cnVjdCBw
c3BfY29udGV4dCAqcHNwKQogCS8qIFByb3ZpZGUgdGhlIFBTUCBzZWN1cmUgT1MgdG8gYm9vdGxv
YWRlciAqLwogCVdSRUczMl9TT0MxNShNUDAsIDAsIG1tTVAwX1NNTl9DMlBNU0dfMzYsCiAJICAg
ICAgICh1aW50MzJfdCkocHNwLT5md19wcmlfbWNfYWRkciA+PiAyMCkpOwotCXBzcF9nZnhkcnZf
Y29tbWFuZF9yZWcgPSAyIDw8IDE2OworCXBzcF9nZnhkcnZfY29tbWFuZF9yZWcgPSBQU1BfQkxf
X0xPQURfU09TRFJWOwogCVdSRUczMl9TT0MxNShNUDAsIDAsIG1tTVAwX1NNTl9DMlBNU0dfMzUs
CiAJICAgICAgIHBzcF9nZnhkcnZfY29tbWFuZF9yZWcpOwogCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjNfMS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvcHNwX3YzXzEuYwppbmRleCAzZjU4Mjc3Li5lYzNhMDU2IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjNfMS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3BzcF92M18xLmMKQEAgLTE1Myw3ICsxNTMsNyBAQCBzdGF0aWMgaW50IHBzcF92M18x
X2Jvb3Rsb2FkZXJfbG9hZF9zeXNkcnYoc3RydWN0IHBzcF9jb250ZXh0ICpwc3ApCiAJLyogUHJv
dmlkZSB0aGUgc3lzIGRyaXZlciB0byBib290bG9hZGVyICovCiAJV1JFRzMyX1NPQzE1KE1QMCwg
MCwgbW1NUDBfU01OX0MyUE1TR18zNiwKIAkgICAgICAgKHVpbnQzMl90KShwc3AtPmZ3X3ByaV9t
Y19hZGRyID4+IDIwKSk7Ci0JcHNwX2dmeGRydl9jb21tYW5kX3JlZyA9IDEgPDwgMTY7CisJcHNw
X2dmeGRydl9jb21tYW5kX3JlZyA9IFBTUF9CTF9fTE9BRF9TWVNEUlY7CiAJV1JFRzMyX1NPQzE1
KE1QMCwgMCwgbW1NUDBfU01OX0MyUE1TR18zNSwKIAkgICAgICAgcHNwX2dmeGRydl9jb21tYW5k
X3JlZyk7CiAKQEAgLTIxNiw3ICsyMTYsNyBAQCBzdGF0aWMgaW50IHBzcF92M18xX2Jvb3Rsb2Fk
ZXJfbG9hZF9zb3Moc3RydWN0IHBzcF9jb250ZXh0ICpwc3ApCiAJLyogUHJvdmlkZSB0aGUgUFNQ
IHNlY3VyZSBPUyB0byBib290bG9hZGVyICovCiAJV1JFRzMyX1NPQzE1KE1QMCwgMCwgbW1NUDBf
U01OX0MyUE1TR18zNiwKIAkgICAgICAgKHVpbnQzMl90KShwc3AtPmZ3X3ByaV9tY19hZGRyID4+
IDIwKSk7Ci0JcHNwX2dmeGRydl9jb21tYW5kX3JlZyA9IDIgPDwgMTY7CisJcHNwX2dmeGRydl9j
b21tYW5kX3JlZyA9IFBTUF9CTF9fTE9BRF9TT1NEUlY7CiAJV1JFRzMyX1NPQzE1KE1QMCwgMCwg
bW1NUDBfU01OX0MyUE1TR18zNSwKIAkgICAgICAgcHNwX2dmeGRydl9jb21tYW5kX3JlZyk7CiAK
LS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
