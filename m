Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8ED9A1B75
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 15:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D1896E0FE;
	Thu, 29 Aug 2019 13:31:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720084.outbound.protection.outlook.com [40.107.72.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED1A6E10F
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 13:31:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N3mVzhal28AzgBDDX+AdVLfTPE4zWeKX7JfHL3WI5bhKuWoDjUwRxNjR3KhPlOGE5pSxO4iY/2SvlPxpbnRpaX7/Wy4dUbiOMNX2JnUOlPOmojHY62hr6d+S6f3gREa/WyrBdVjTRAGo8K+f7KJBoKpYyl+G1baPsdpbhpdINiOwpfW4JOt8B34pIQQpv+ytIyAqMgKa7Mo4+gw+h3IPJR5aByw1NHa0D4PsqaaVOoJUqTaxTePr1BiUglq4eRCIRNHkBYIAunlF4U3xydg3UgjbFuV5g8KVDp5fNo0ZXa2SkugB7lCq5lqKWVOoiyBFCWNxwB2vd5tJE/I+TRZEbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vrhlEZISlTsV1XIPnv+M3uMbz77eD8+DvKZEAdvsEr4=;
 b=iDMKvnAHTIQcqxhRMQtRzmTLoDDJhj47fJs9rk+9/5iCXpqKuKn8MX/HRYWHB0eQHCLYHQAwT1/s/p9+E4eKPhcOyaPZ28xhOgeF63SiO/QrFTTTAzSBGupDOp9/Va7DgdnbXacTF0zTTPWRhAun1RxMmRnlkDBkipPlkWAzBU0LzUae45n73WlGcbuFYFfLLlqy3SpkZWu6FoNfP+tkVQCxhfZspovXR4k5eDqN2NfHwP1ARUWz4Qlt74eRi7tFZN9+DAAf1ofGRntEfMySF4ZDL4FGMx90clsq9HBvOlmk0LkQWsNmcr1pKS8A1Mm/wH00hzWNCH8nvNXYxlX45Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MN2PR12CA0023.namprd12.prod.outlook.com (2603:10b6:208:a8::36)
 by CY4PR12MB1270.namprd12.prod.outlook.com (2603:10b6:903:43::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.21; Thu, 29 Aug
 2019 13:31:07 +0000
Received: from BY2NAM03FT007.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::205) by MN2PR12CA0023.outlook.office365.com
 (2603:10b6:208:a8::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.18 via Frontend
 Transport; Thu, 29 Aug 2019 13:31:06 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT007.mail.protection.outlook.com (10.152.84.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Thu, 29 Aug 2019 13:31:06 +0000
Received: from hawzhang-All-Series.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Thu, 29 Aug 2019 08:31:04 -0500
From: Hawking Zhang <Hawking.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, 
 Tao Zhou <tao.zhou1@amd.com>, Guchun Chen <guchun.chen@amd.com>
Subject: [PATCH 3/7] drm/amdgpu: switch to amdgpu_ras_late_init for sdma v4
 block (v2)
Date: Thu, 29 Aug 2019 21:30:28 +0800
Message-ID: <1567085432-27452-3-git-send-email-Hawking.Zhang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567085432-27452-1-git-send-email-Hawking.Zhang@amd.com>
References: <1567085432-27452-1-git-send-email-Hawking.Zhang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(396003)(39860400002)(2980300002)(428003)(199004)(189003)(2906002)(76176011)(50466002)(8936002)(51416003)(81166006)(356004)(6666004)(7696005)(8676002)(81156014)(5660300002)(70206006)(70586007)(47776003)(305945005)(48376002)(6636002)(16586007)(316002)(110136005)(53416004)(186003)(4326008)(2616005)(11346002)(478600001)(446003)(26005)(53936002)(486006)(126002)(36756003)(14444005)(476003)(336012)(86362001)(426003)(50226002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1270; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c9d99c3-531b-4c4a-ef71-08d72c85253e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:CY4PR12MB1270; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1270:
X-Microsoft-Antispam-PRVS: <CY4PR12MB12706FB80958E660861FB28EFCA20@CY4PR12MB1270.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-Forefront-PRVS: 0144B30E41
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: IcE22t+nmYMAnd+u988/10jvskw/jGIQ2wgirJ+W3k3HJ8kfAfhaQjPOlo9xqeyHGk/ir+8bxfYbnHgl6YMmv9FLBKK9KPa78kAgfeXjlincteZsf1M5aS19L/ZaFDNmWQTC3enRfn03gcbuY2tzHrQV8yN/cWqk3gi75muUZYF4HHT9Ef1/UH+66F59m4Ofe5w3USR3rUxYN7zMcN3EmHNg38u264vT2/yIsIY+VOcu6dj7PZqFqG2CeXnCtZ5ZksWK4u9h+PbJ4EvJgchYtdDLlf2k+Qp7CyrqwmH4Wmy4+BISFxHVm2znGc+TqlWbsHbFtn1mGAT2tHrE21R0QPtgE8mzi1Zv5i5wOd/ZsnUDAvzmr0FeG8RkN7Z19qLaij5QK5kOz4XvFp/UcXy3D3fKngKt9nBSTbsmt2wt8uY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2019 13:31:06.1757 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c9d99c3-531b-4c4a-ef71-08d72c85253e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1270
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vrhlEZISlTsV1XIPnv+M3uMbz77eD8+DvKZEAdvsEr4=;
 b=251C8XGkeu05U/eCIPHnkztOw7kS6DaloQz9H0f34KeHrgaUSxD6BjzcvRzwRNlbn8nEcj58fwaVLZklUlvXTs1y37W7Xp/sS8bjbOaGcrnVk497JWQToygPjk+dJH5ewBIvV4fVyH6z0BzZMGeYOpwEokxUnbtMfjXkD+WV6Qk=
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

Y2FsbCBoZWxwZXIgZnVuY3Rpb24gaW4gbGF0ZSBpbml0IHBoYXNlIHRvIGhhbmRsZSByYXMgaW5p
dApmb3Igc2RtYSBpcCBibG9jawoKdjI6IGNhbGwgcmFzX2xhdGVfZmluaSB0byBkbyBjbGVhbiB1
cCB3aGVuIGZhaWwgdG8gZW5hYmxlIGludGVycnVwdAoKU2lnbmVkLW9mZi1ieTogSGF3a2luZyBa
aGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3NkbWFfdjRfMC5jIHwgOTggKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDc0IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMKaW5kZXggMjU2ZDM4MS4uZjhkOTk5OSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMKQEAgLTE2OTIsNyArMTY5Miw2IEBA
IHN0YXRpYyBpbnQgc2RtYV92NF8wX3Byb2Nlc3NfcmFzX2RhdGFfY2Ioc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsCiBzdGF0aWMgaW50IHNkbWFfdjRfMF9sYXRlX2luaXQodm9pZCAqaGFuZGxl
KQogewogCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICopaGFuZGxlOwotCXN0cnVjdCByYXNfY29tbW9uX2lmICoqcmFzX2lmID0gJmFkZXYtPnNkbWEu
cmFzX2lmOwogCXN0cnVjdCByYXNfaWhfaWYgaWhfaW5mbyA9IHsKIAkJLmNiID0gc2RtYV92NF8w
X3Byb2Nlc3NfcmFzX2RhdGFfY2IsCiAJfTsKQEAgLTE3MDAsODcgKzE2OTksMzggQEAgc3RhdGlj
IGludCBzZG1hX3Y0XzBfbGF0ZV9pbml0KHZvaWQgKmhhbmRsZSkKIAkJLnN5c2ZzX25hbWUgPSAi
c2RtYV9lcnJfY291bnQiLAogCQkuZGVidWdmc19uYW1lID0gInNkbWFfZXJyX2luamVjdCIsCiAJ
fTsKLQlzdHJ1Y3QgcmFzX2NvbW1vbl9pZiByYXNfYmxvY2sgPSB7Ci0JCS5ibG9jayA9IEFNREdQ
VV9SQVNfQkxPQ0tfX1NETUEsCi0JCS50eXBlID0gQU1ER1BVX1JBU19FUlJPUl9fTVVMVElfVU5D
T1JSRUNUQUJMRSwKLQkJLnN1Yl9ibG9ja19pbmRleCA9IDAsCi0JCS5uYW1lID0gInNkbWEiLAot
CX07CiAJaW50IHIsIGk7CiAKLQlpZiAoIWFtZGdwdV9yYXNfaXNfc3VwcG9ydGVkKGFkZXYsIEFN
REdQVV9SQVNfQkxPQ0tfX1NETUEpKSB7Ci0JCWFtZGdwdV9yYXNfZmVhdHVyZV9lbmFibGVfb25f
Ym9vdChhZGV2LCAmcmFzX2Jsb2NrLCAwKTsKLQkJcmV0dXJuIDA7Ci0JfQotCi0JLyogaGFuZGxl
IHJlc3VtZSBwYXRoLiAqLwotCWlmICgqcmFzX2lmKSB7Ci0JCS8qIHJlc2VuZCByYXMgVEEgZW5h
YmxlIGNtZCBkdXJpbmcgcmVzdW1lLgotCQkgKiBwcmVwYXJlIHRvIGhhbmRsZSBmYWlsdXJlLgot
CQkgKi8KLQkJaWhfaW5mby5oZWFkID0gKipyYXNfaWY7Ci0JCXIgPSBhbWRncHVfcmFzX2ZlYXR1
cmVfZW5hYmxlX29uX2Jvb3QoYWRldiwgKnJhc19pZiwgMSk7Ci0JCWlmIChyKSB7Ci0JCQlpZiAo
ciA9PSAtRUFHQUlOKSB7Ci0JCQkJLyogcmVxdWVzdCBhIGdwdSByZXNldC4gd2lsbCBydW4gYWdh
aW4uICovCi0JCQkJYW1kZ3B1X3Jhc19yZXF1ZXN0X3Jlc2V0X29uX2Jvb3QoYWRldiwKLQkJCQkJ
CUFNREdQVV9SQVNfQkxPQ0tfX1NETUEpOwotCQkJCXJldHVybiAwOwotCQkJfQotCQkJLyogZmFp
bCB0byBlbmFibGUgcmFzLCBjbGVhbnVwIGFsbC4gKi8KLQkJCWdvdG8gaXJxOwotCQl9Ci0JCS8q
IGVuYWJsZSBzdWNjZXNzZnVsbHkuIGNvbnRpbnVlLiAqLwotCQlnb3RvIHJlc3VtZTsKLQl9Ci0K
LQkqcmFzX2lmID0ga21hbGxvYyhzaXplb2YoKipyYXNfaWYpLCBHRlBfS0VSTkVMKTsKLQlpZiAo
ISpyYXNfaWYpCi0JCXJldHVybiAtRU5PTUVNOwotCi0JKipyYXNfaWYgPSByYXNfYmxvY2s7Ci0K
LQlyID0gYW1kZ3B1X3Jhc19mZWF0dXJlX2VuYWJsZV9vbl9ib290KGFkZXYsICpyYXNfaWYsIDEp
OwotCWlmIChyKSB7Ci0JCWlmIChyID09IC1FQUdBSU4pIHsKLQkJCWFtZGdwdV9yYXNfcmVxdWVz
dF9yZXNldF9vbl9ib290KGFkZXYsCi0JCQkJCUFNREdQVV9SQVNfQkxPQ0tfX1NETUEpOwotCQkJ
ciA9IDA7Ci0JCX0KLQkJZ290byBmZWF0dXJlOworCWlmICghYWRldi0+c2RtYS5yYXNfaWYpIHsK
KwkJYWRldi0+c2RtYS5yYXNfaWYgPSBrbWFsbG9jKHNpemVvZihzdHJ1Y3QgcmFzX2NvbW1vbl9p
ZiksIEdGUF9LRVJORUwpOworCQlpZiAoIWFkZXYtPnNkbWEucmFzX2lmKQorCQkJcmV0dXJuIC1F
Tk9NRU07CisJCWFkZXYtPnNkbWEucmFzX2lmLT5ibG9jayA9IEFNREdQVV9SQVNfQkxPQ0tfX1NE
TUE7CisJCWFkZXYtPnNkbWEucmFzX2lmLT50eXBlID0gQU1ER1BVX1JBU19FUlJPUl9fTVVMVElf
VU5DT1JSRUNUQUJMRTsKKwkJYWRldi0+c2RtYS5yYXNfaWYtPnN1Yl9ibG9ja19pbmRleCA9IDA7
CisJCXN0cmNweShhZGV2LT5zZG1hLnJhc19pZi0+bmFtZSwgInNkbWEiKTsKIAl9CisJZnNfaW5m
by5oZWFkID0gaWhfaW5mby5oZWFkID0gKmFkZXYtPnNkbWEucmFzX2lmOwogCi0JaWhfaW5mby5o
ZWFkID0gKipyYXNfaWY7Ci0JZnNfaW5mby5oZWFkID0gKipyYXNfaWY7Ci0KLQlyID0gYW1kZ3B1
X3Jhc19pbnRlcnJ1cHRfYWRkX2hhbmRsZXIoYWRldiwgJmloX2luZm8pOworCXIgPSBhbWRncHVf
cmFzX2xhdGVfaW5pdChhZGV2LCBhZGV2LT5zZG1hLnJhc19pZiwKKwkJCQkgJmZzX2luZm8sICZp
aF9pbmZvKTsKIAlpZiAocikKLQkJZ290byBpbnRlcnJ1cHQ7Ci0KLQlhbWRncHVfcmFzX2RlYnVn
ZnNfY3JlYXRlKGFkZXYsICZmc19pbmZvKTsKKwkJZ290byBmcmVlOwogCi0JciA9IGFtZGdwdV9y
YXNfc3lzZnNfY3JlYXRlKGFkZXYsICZmc19pbmZvKTsKLQlpZiAocikKLQkJZ290byBzeXNmczsK
LXJlc3VtZToKLQlmb3IgKGkgPSAwOyBpIDwgYWRldi0+c2RtYS5udW1faW5zdGFuY2VzOyBpKysp
IHsKLQkJciA9IGFtZGdwdV9pcnFfZ2V0KGFkZXYsICZhZGV2LT5zZG1hLmVjY19pcnEsCi0JCQkJ
ICAgQU1ER1BVX1NETUFfSVJRX0lOU1RBTkNFMCArIGkpOwotCQlpZiAocikKLQkJCWdvdG8gaXJx
OworCWlmIChhbWRncHVfcmFzX2lzX3N1cHBvcnRlZChhZGV2LCBhZGV2LT5zZG1hLnJhc19pZi0+
YmxvY2spKSB7CisJCWZvciAoaSA9IDA7IGkgPCBhZGV2LT5zZG1hLm51bV9pbnN0YW5jZXM7IGkr
KykgeworCQkJciA9IGFtZGdwdV9pcnFfZ2V0KGFkZXYsICZhZGV2LT5zZG1hLmVjY19pcnEsCisJ
CQkJQU1ER1BVX1NETUFfSVJRX0lOU1RBTkNFMCArIGkpOworCQkJaWYgKHIpCisJCQkJZ290byBs
YXRlX2Zpbmk7CisJCX0KIAl9CiAKLQlyZXR1cm4gMDsKLWlycToKLQlhbWRncHVfcmFzX3N5c2Zz
X3JlbW92ZShhZGV2LCAqcmFzX2lmKTsKLXN5c2ZzOgotCWFtZGdwdV9yYXNfZGVidWdmc19yZW1v
dmUoYWRldiwgKnJhc19pZik7Ci0JYW1kZ3B1X3Jhc19pbnRlcnJ1cHRfcmVtb3ZlX2hhbmRsZXIo
YWRldiwgJmloX2luZm8pOwotaW50ZXJydXB0OgotCWFtZGdwdV9yYXNfZmVhdHVyZV9lbmFibGUo
YWRldiwgKnJhc19pZiwgMCk7Ci1mZWF0dXJlOgotCWtmcmVlKCpyYXNfaWYpOwotCSpyYXNfaWYg
PSBOVUxMOworICAgICAgICByZXR1cm4gMDsKK2xhdGVfZmluaToKKwlhbWRncHVfcmFzX2xhdGVf
ZmluaShhZGV2LCBhZGV2LT5zZG1hLnJhc19pZiwgJmloX2luZm8pOworZnJlZToKKwlrZnJlZShh
ZGV2LT5zZG1hLnJhc19pZik7CiAJcmV0dXJuIHI7CiB9CiAKLS0gCjIuNy40CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
