Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC14A027D
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 15:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA92889C48;
	Wed, 28 Aug 2019 13:03:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690076.outbound.protection.outlook.com [40.107.69.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5564389B61
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 13:03:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZB3K5cEYDoesmz0jCz5XqyRay7/0TC0G64GsoAbim/Jox7J6IUEylhb7hq4JWjJGeIOC8L9haMP97vMnvScJDwoHRA1eBACkwX72sN6dMNiZ13YJR9V5QEdGSSUCjyZhwoa8KwGeLxAXq4i5fpZm3CDPCLzJi68wD/+j0P1gHLgrh8ZIYVpemMiHYmj05gmAbN4KFAglHPiJDMeTeWdBYMUim5BMpM/h6a4cSeIx1YZkLKc0+fmQWrNOnooNfiM5Hmtv6KOsYH90a88EXkj53UCWR4o3bYG4nD+cxBddxIPJ9DxdYeNszYn4fmS6Y9P1nnZeQi0wCKx8Mvv9wFTRvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bBi3qY4t5c3+rEQzwBT8sLmdgrC1fWAA4u9bDozdypE=;
 b=SMVj/g0kKsLCfcgSm6BN2gpF7r1aaw8dX/WHUAXOV4OFn6FoG8ODvVk54gytGq+io/wYFDdq3DoFYk0yyit1MS4SkJeJQgkqBrmAV4nzfIvL1yhtqo4j/pb2K7NOltUVKThgEm+ukAjczuSzUEMNuXXznMYfvbI1xCgYGEDVXe2AkY4sL68sFNHcGmeoxOvNLmw50gbnltsinQtKiNvjTW3bxxInzbz2WI+82BXr+36L3aHxF4upDb/t6nGF/4cLJbDX1ZVBKoOyKWA5jf9j28TCYtaj46S6ZCJWrvgW7gwDnL3zzYmRa/thjEEO66gcUOB3axruld7K0x0BxcIAdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0013.namprd12.prod.outlook.com
 (2603:10b6:301:4a::23) by BN7PR12MB2708.namprd12.prod.outlook.com
 (2603:10b6:408:21::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.20; Wed, 28 Aug
 2019 13:03:34 +0000
Received: from BY2NAM03FT036.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by MWHPR1201CA0013.outlook.office365.com
 (2603:10b6:301:4a::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Wed, 28 Aug 2019 13:03:33 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT036.mail.protection.outlook.com (10.152.85.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Wed, 28 Aug 2019 13:03:32 +0000
Received: from hawzhang-All-Series.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Wed, 28 Aug 2019 08:03:31 -0500
From: Hawking Zhang <Hawking.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Tao Zhou <tao.zhou1@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>
Subject: [PATCH 3/7] drm/amdgpu: switch to ras_late_init for sdma v4 block
Date: Wed, 28 Aug 2019 21:03:11 +0800
Message-ID: <1566997395-7185-3-git-send-email-Hawking.Zhang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566997395-7185-1-git-send-email-Hawking.Zhang@amd.com>
References: <1566997395-7185-1-git-send-email-Hawking.Zhang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(396003)(376002)(2980300002)(428003)(189003)(199004)(186003)(316002)(4326008)(47776003)(70206006)(446003)(6636002)(86362001)(14444005)(5660300002)(11346002)(478600001)(110136005)(16586007)(126002)(476003)(70586007)(486006)(8676002)(2616005)(53416004)(81156014)(50226002)(53936002)(81166006)(2906002)(36756003)(6666004)(356004)(50466002)(76176011)(426003)(48376002)(7696005)(51416003)(305945005)(26005)(336012)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2708; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4cdfd907-2120-4169-950f-08d72bb82159
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BN7PR12MB2708; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2708:
X-Microsoft-Antispam-PRVS: <BN7PR12MB2708E577914C03DCFB4639EEFCA30@BN7PR12MB2708.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-Forefront-PRVS: 014304E855
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 0Z3I0JJhBFJHarfm3BuOzZHLwRiKwLHNFcMXiRUyYgW8aJauWxXX6d8vj6MkiS0wi+enuLAC9PBFovYfXPWcIKQ1BSY8qVH15JJHEu8N9fPCQn2kNB5K3VMo+s9pkyBmzgqohIEjx6PMnr8iL/hNI0wxXXOsfcCYqcwilgV1nKGFjzQGDhUbee9UeYoqRERNtkSfm2p0/WKuddXycmQERXp4hU2n8ApwQL15IYRFm2FH1qsaX2VvO6srbDeoT3H6IRugRnStQRF5oKtZ/iVesbVk1qNqNc8tvmy84GBSasKalqUWzlm05j4u+RT4PM5KlTdJcUrEGcllVXc7Hd2zL8bXFI/24A9moq63tJbW+vMi92SOkk13a65qBhElVnTzA7z0MFt+eQH8IqS4g1uTT2ae4aEy8mgj/Y4CmbPOREs=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2019 13:03:32.8179 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cdfd907-2120-4169-950f-08d72bb82159
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2708
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bBi3qY4t5c3+rEQzwBT8sLmdgrC1fWAA4u9bDozdypE=;
 b=xFbjiHNFDa341Hum9kjOFewjWmCbEsIxz66Q/R51FljMOabEu5qhlAWc9Eq7Gg+y1CJTOYu/4DuyThLGBLMadgCvKhMmdsA4EKW7U7PlRGPr8wKHYGi3C41tFS0YzGtI7SGoEwBHZS8VZ30Kw4E55u8/MNQdEUW2QvHlfUzLTmw=
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

Y2FsbCByYXNfbGF0ZV9pbml0IGhlbHBlciBmdW5jdGlvbiB0byBkbyByYXMgaW5pdCBmb3Igc2Rt
YSBibG9jawoKU2lnbmVkLW9mZi1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jIHwgOTYgKysr
KysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIyIGluc2Vy
dGlvbnMoKyksIDc0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L3NkbWFfdjRfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92
NF8wLmMKaW5kZXggMjU2ZDM4MS4uYzM0ODZjOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvc2RtYV92NF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
c2RtYV92NF8wLmMKQEAgLTE2OTIsNyArMTY5Miw2IEBAIHN0YXRpYyBpbnQgc2RtYV92NF8wX3By
b2Nlc3NfcmFzX2RhdGFfY2Ioc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiBzdGF0aWMgaW50
IHNkbWFfdjRfMF9sYXRlX2luaXQodm9pZCAqaGFuZGxlKQogewogCXN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNlICopaGFuZGxlOwotCXN0cnVjdCByYXNf
Y29tbW9uX2lmICoqcmFzX2lmID0gJmFkZXYtPnNkbWEucmFzX2lmOwogCXN0cnVjdCByYXNfaWhf
aWYgaWhfaW5mbyA9IHsKIAkJLmNiID0gc2RtYV92NF8wX3Byb2Nlc3NfcmFzX2RhdGFfY2IsCiAJ
fTsKQEAgLTE3MDAsODcgKzE2OTksMzYgQEAgc3RhdGljIGludCBzZG1hX3Y0XzBfbGF0ZV9pbml0
KHZvaWQgKmhhbmRsZSkKIAkJLnN5c2ZzX25hbWUgPSAic2RtYV9lcnJfY291bnQiLAogCQkuZGVi
dWdmc19uYW1lID0gInNkbWFfZXJyX2luamVjdCIsCiAJfTsKLQlzdHJ1Y3QgcmFzX2NvbW1vbl9p
ZiByYXNfYmxvY2sgPSB7Ci0JCS5ibG9jayA9IEFNREdQVV9SQVNfQkxPQ0tfX1NETUEsCi0JCS50
eXBlID0gQU1ER1BVX1JBU19FUlJPUl9fTVVMVElfVU5DT1JSRUNUQUJMRSwKLQkJLnN1Yl9ibG9j
a19pbmRleCA9IDAsCi0JCS5uYW1lID0gInNkbWEiLAotCX07CiAJaW50IHIsIGk7CiAKLQlpZiAo
IWFtZGdwdV9yYXNfaXNfc3VwcG9ydGVkKGFkZXYsIEFNREdQVV9SQVNfQkxPQ0tfX1NETUEpKSB7
Ci0JCWFtZGdwdV9yYXNfZmVhdHVyZV9lbmFibGVfb25fYm9vdChhZGV2LCAmcmFzX2Jsb2NrLCAw
KTsKLQkJcmV0dXJuIDA7Ci0JfQotCi0JLyogaGFuZGxlIHJlc3VtZSBwYXRoLiAqLwotCWlmICgq
cmFzX2lmKSB7Ci0JCS8qIHJlc2VuZCByYXMgVEEgZW5hYmxlIGNtZCBkdXJpbmcgcmVzdW1lLgot
CQkgKiBwcmVwYXJlIHRvIGhhbmRsZSBmYWlsdXJlLgotCQkgKi8KLQkJaWhfaW5mby5oZWFkID0g
KipyYXNfaWY7Ci0JCXIgPSBhbWRncHVfcmFzX2ZlYXR1cmVfZW5hYmxlX29uX2Jvb3QoYWRldiwg
KnJhc19pZiwgMSk7Ci0JCWlmIChyKSB7Ci0JCQlpZiAociA9PSAtRUFHQUlOKSB7Ci0JCQkJLyog
cmVxdWVzdCBhIGdwdSByZXNldC4gd2lsbCBydW4gYWdhaW4uICovCi0JCQkJYW1kZ3B1X3Jhc19y
ZXF1ZXN0X3Jlc2V0X29uX2Jvb3QoYWRldiwKLQkJCQkJCUFNREdQVV9SQVNfQkxPQ0tfX1NETUEp
OwotCQkJCXJldHVybiAwOwotCQkJfQotCQkJLyogZmFpbCB0byBlbmFibGUgcmFzLCBjbGVhbnVw
IGFsbC4gKi8KLQkJCWdvdG8gaXJxOwotCQl9Ci0JCS8qIGVuYWJsZSBzdWNjZXNzZnVsbHkuIGNv
bnRpbnVlLiAqLwotCQlnb3RvIHJlc3VtZTsKLQl9Ci0KLQkqcmFzX2lmID0ga21hbGxvYyhzaXpl
b2YoKipyYXNfaWYpLCBHRlBfS0VSTkVMKTsKLQlpZiAoISpyYXNfaWYpCi0JCXJldHVybiAtRU5P
TUVNOwotCi0JKipyYXNfaWYgPSByYXNfYmxvY2s7Ci0KLQlyID0gYW1kZ3B1X3Jhc19mZWF0dXJl
X2VuYWJsZV9vbl9ib290KGFkZXYsICpyYXNfaWYsIDEpOwotCWlmIChyKSB7Ci0JCWlmIChyID09
IC1FQUdBSU4pIHsKLQkJCWFtZGdwdV9yYXNfcmVxdWVzdF9yZXNldF9vbl9ib290KGFkZXYsCi0J
CQkJCUFNREdQVV9SQVNfQkxPQ0tfX1NETUEpOwotCQkJciA9IDA7Ci0JCX0KLQkJZ290byBmZWF0
dXJlOworCWlmICghYWRldi0+c2RtYS5yYXNfaWYpIHsKKwkJYWRldi0+c2RtYS5yYXNfaWYgPSBr
bWFsbG9jKHNpemVvZihzdHJ1Y3QgcmFzX2NvbW1vbl9pZiksIEdGUF9LRVJORUwpOworCQlpZiAo
IWFkZXYtPnNkbWEucmFzX2lmKQorCQkJcmV0dXJuIC1FTk9NRU07CisJCWFkZXYtPnNkbWEucmFz
X2lmLT5ibG9jayA9IEFNREdQVV9SQVNfQkxPQ0tfX1NETUE7CisJCWFkZXYtPnNkbWEucmFzX2lm
LT50eXBlID0gQU1ER1BVX1JBU19FUlJPUl9fTVVMVElfVU5DT1JSRUNUQUJMRTsKKwkJYWRldi0+
c2RtYS5yYXNfaWYtPnN1Yl9ibG9ja19pbmRleCA9IDA7CisJCXN0cmNweShhZGV2LT5zZG1hLnJh
c19pZi0+bmFtZSwgInNkbWEiKTsKIAl9CisJZnNfaW5mby5oZWFkID0gaWhfaW5mby5oZWFkID0g
KmFkZXYtPnNkbWEucmFzX2lmOwogCi0JaWhfaW5mby5oZWFkID0gKipyYXNfaWY7Ci0JZnNfaW5m
by5oZWFkID0gKipyYXNfaWY7Ci0KLQlyID0gYW1kZ3B1X3Jhc19pbnRlcnJ1cHRfYWRkX2hhbmRs
ZXIoYWRldiwgJmloX2luZm8pOworCXIgPSBhbWRncHVfcmFzX2xhdGVfaW5pdChhZGV2LCBhZGV2
LT5zZG1hLnJhc19pZiwKKwkJCQkgJmZzX2luZm8sICZpaF9pbmZvKTsKIAlpZiAocikKLQkJZ290
byBpbnRlcnJ1cHQ7Ci0KLQlhbWRncHVfcmFzX2RlYnVnZnNfY3JlYXRlKGFkZXYsICZmc19pbmZv
KTsKKwkJZ290byBmcmVlOwogCi0JciA9IGFtZGdwdV9yYXNfc3lzZnNfY3JlYXRlKGFkZXYsICZm
c19pbmZvKTsKLQlpZiAocikKLQkJZ290byBzeXNmczsKLXJlc3VtZToKLQlmb3IgKGkgPSAwOyBp
IDwgYWRldi0+c2RtYS5udW1faW5zdGFuY2VzOyBpKyspIHsKLQkJciA9IGFtZGdwdV9pcnFfZ2V0
KGFkZXYsICZhZGV2LT5zZG1hLmVjY19pcnEsCi0JCQkJICAgQU1ER1BVX1NETUFfSVJRX0lOU1RB
TkNFMCArIGkpOwotCQlpZiAocikKLQkJCWdvdG8gaXJxOworCWlmIChhbWRncHVfcmFzX2lzX3N1
cHBvcnRlZChhZGV2LCBhZGV2LT5zZG1hLnJhc19pZi0+YmxvY2spKSB7CisJCWZvciAoaSA9IDA7
IGkgPCBhZGV2LT5zZG1hLm51bV9pbnN0YW5jZXM7IGkrKykgeworCQkJciA9IGFtZGdwdV9pcnFf
Z2V0KGFkZXYsICZhZGV2LT5zZG1hLmVjY19pcnEsCisJCQkJQU1ER1BVX1NETUFfSVJRX0lOU1RB
TkNFMCArIGkpOworCQkJaWYgKHIpCisJCQkJZ290byBmcmVlOworCQl9CiAJfQogCi0JcmV0dXJu
IDA7Ci1pcnE6Ci0JYW1kZ3B1X3Jhc19zeXNmc19yZW1vdmUoYWRldiwgKnJhc19pZik7Ci1zeXNm
czoKLQlhbWRncHVfcmFzX2RlYnVnZnNfcmVtb3ZlKGFkZXYsICpyYXNfaWYpOwotCWFtZGdwdV9y
YXNfaW50ZXJydXB0X3JlbW92ZV9oYW5kbGVyKGFkZXYsICZpaF9pbmZvKTsKLWludGVycnVwdDoK
LQlhbWRncHVfcmFzX2ZlYXR1cmVfZW5hYmxlKGFkZXYsICpyYXNfaWYsIDApOwotZmVhdHVyZToK
LQlrZnJlZSgqcmFzX2lmKTsKLQkqcmFzX2lmID0gTlVMTDsKKyAgICAgICAgcmV0dXJuIDA7Citm
cmVlOgorCWtmcmVlKGFkZXYtPnNkbWEucmFzX2lmKTsKIAlyZXR1cm4gcjsKIH0KIAotLSAKMi43
LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
