Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBC21018F
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 23:10:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7351A892C5;
	Tue, 30 Apr 2019 21:10:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820055.outbound.protection.outlook.com [40.107.82.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB81E8929C
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 21:10:09 +0000 (UTC)
Received: from DM3PR12CA0108.namprd12.prod.outlook.com (2603:10b6:0:55::28) by
 BLUPR12MB0644.namprd12.prod.outlook.com (2a01:111:e400:594e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1835.12; Tue, 30 Apr
 2019 21:10:08 +0000
Received: from BY2NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::201) by DM3PR12CA0108.outlook.office365.com
 (2603:10b6:0:55::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1835.12 via Frontend
 Transport; Tue, 30 Apr 2019 21:10:08 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT009.mail.protection.outlook.com (10.152.84.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1835.14 via Frontend Transport; Tue, 30 Apr 2019 21:10:07 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Apr 2019
 16:09:54 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 15/20] drm/amd/display: Use surface directly when checking
 update type
Date: Tue, 30 Apr 2019 17:09:28 -0400
Message-ID: <20190430210938.32335-31-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
References: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(346002)(376002)(39860400002)(136003)(2980300002)(428003)(189003)(199004)(426003)(72206003)(26005)(50226002)(50466002)(8936002)(316002)(16586007)(48376002)(81156014)(305945005)(8676002)(6916009)(53936002)(4326008)(36756003)(81166006)(478600001)(53416004)(47776003)(15650500001)(186003)(51416003)(7696005)(5660300002)(2351001)(2616005)(11346002)(76176011)(1076003)(486006)(476003)(68736007)(14444005)(86362001)(126002)(70586007)(77096007)(336012)(446003)(70206006)(356004)(6666004)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR12MB0644; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 847dc9f2-ae81-4ea9-908b-08d6cdb03955
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BLUPR12MB0644; 
X-MS-TrafficTypeDiagnostic: BLUPR12MB0644:
X-Microsoft-Antispam-PRVS: <BLUPR12MB0644CD882187A2F81D258BB0F93A0@BLUPR12MB0644.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-Forefront-PRVS: 00235A1EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: BMr17Bnk2cvxlu73Bk/vVLTDad8yhFlkjdk6sLDiLHLk9mMAdkgkNxsBq2jFkrOVmzd6BevCVyjTdZifIfFPcsAD7Er1Kb0KIYhzf1Sg2greagi0biw2dIMHPfCv+W1EfewEouZcXgKtbmt2vIxrkxOshJiHofLfdFgzDiQYBeMzDk0a+1HFJHkI2WcKyZgHReCCb/YigErJizjdmj9akj88bF5XBJ1SdBn9aafRGb8OCkIweIbzyG/sn9dgW3bNHVJ0qG/d34B/uUii8oBtoBrdvfO1BKMnb9fv0TR1JSyRYqe7wjpzvOyb0jQBQUlYqogxcUXEt5mONqc8g8KrLw5THi7NQWRHZJVzI5wotNkzDXXuxZsgbjwTHeko916u8gBVDJYojiTi+lb3NFbcp5NtKgmocB0IhQ2s7yEoK4U=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2019 21:10:07.7319 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 847dc9f2-ae81-4ea9-908b-08d6cdb03955
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR12MB0644
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+QJzYpOvM7+o6PYbBQdGIips8AlLjws7od6CxtYTWg=;
 b=elX3BQ16kTwL7CBsCGaN4dmn6gDYCv86ZuKf3Dg+Fq3px4GUlDtV+edRGdvSyPm/56/kGcfB1r0qieyDXYJTsr0L+4DsQB0s79Q8qzbXV7Z8M3lhhgTOf0uKByGaPtCHR9SXRpjvFfhUrfoY2KXzxncaXmpPcxXqgZ8m3xDtBJM=
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
W1doeV0KREMgZXhwZWN0cyB0aGUgc3VyZmFjZSBtZW1vcnkgYWRkcmVzcyB0byBpZGVudGlmeSB0
aGUgc3VyZmFjZS4KClRoaXMgZG9lc24ndCB3b3JrIHdpdGggd2hhdCB3ZSdyZSBkb2luZyB3aXRo
IHRoZSB0ZW1wb3Jhcnkgc3VyZmFjZXMsCml0IHdpbGwgYWx3YXlzIGFzc3VtZSB0aGlzIGlzIGEg
ZnVsbCB1cGRhdGUgYmVjYXVzZSB0aGUgc3VyZmFjZQppc24ndCBpbiB0aGUgY3VycmVudCBjb250
ZXh0LgoKW0hvd10KVXNlIHRoZSBzdXJmYWNlIGRpcmVjdGx5LiBUaGlzIGRvZXNuJ3QgZ2l2ZSB1
cyBtdWNoIGltcHJvdmVtZW50IHlldCwKc2luY2Ugd2UgYWx3YXlzIGNyZWF0ZSBhIG5ldyBkY19w
bGFuZV9zdGF0ZSB3aGVuIHN0YXRlLT5hbGxvd19tb2Rlc2V0CmlzIHRydWUuCgpUaGUgY2FsbCBp
bnRvIGRjX2NoZWNrX3VwZGF0ZV9zdXJmYWNlc19mb3Jfc3RyZWFtIGFsc28gbmVlZHMgdG8gYmUK
bG9ja2VkLCBmb3IgdHdvIHJlYXNvbnM6CgoxLiBJdCBjaGVja3MgdGhlIGN1cnJlbnQgREMgc3Rh
dGUKMi4gSXQgbW9kaWZpZXMgdGhlIHN1cmZhY2UgdXBkYXRlIGZsYWdzCgpCb3RoIG9mIHdoaWNo
IGNvdWxkIGJlIGN1cnJlbnRseSBpbiB0aGUgbWlkZGxlIG9mIGNvbW1pdCB3b3JrIGZyb20KY29t
bWl0IHRhaWwuCgpBIFRPRE8gaGVyZSBpcyB0byBwYXNzIHRoZSBjb250ZXh0IGV4cGxpY2l0bHkg
aW50byB0aGlzIGZ1bmN0aW9uIGFuZApmaW5kIGEgd2F5IHRvIGdldCB0aGUgc3VyZmFjZSB1cGRh
dGUgZmxhZ3Mgb3V0IG9mIGl0IHdpdGhvdXQgbW9kaWZ5aW5nCnRoZSBzdXJmYWNlIGluIHBsYWNl
LgoKQ2hhbmdlLUlkOiBJY2Q5NDJiYWU0ZGE3ZTE2MDcwYTY4YzAwZGNmNDQ5MDhkMTk1YjYzYQpT
aWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVza2FzQGFt
ZC5jb20+ClJldmlld2VkLWJ5OiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+
CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQgTGFraGFAYW1kLmNvbT4K
LS0tCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCAyOCAr
KysrKysrKy0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTYg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVf
ZG0vYW1kZ3B1X2RtLmMKaW5kZXggZjhhYWY5YTFiNmJiLi5kODdkODBhZWU2NjIgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwpAQCAt
NjM3NSwxMCArNjM3NSwxMSBAQCBzdGF0aWMgaW50IGRtX3VwZGF0ZV9wbGFuZV9zdGF0ZShzdHJ1
Y3QgZGMgKmRjLAogfQogCiBzdGF0aWMgaW50Ci1kbV9kZXRlcm1pbmVfdXBkYXRlX3R5cGVfZm9y
X2NvbW1pdChzdHJ1Y3QgZGMgKmRjLAorZG1fZGV0ZXJtaW5lX3VwZGF0ZV90eXBlX2Zvcl9jb21t
aXQoc3RydWN0IGFtZGdwdV9kaXNwbGF5X21hbmFnZXIgKmRtLAogCQkJCSAgICBzdHJ1Y3QgZHJt
X2F0b21pY19zdGF0ZSAqc3RhdGUsCiAJCQkJICAgIGVudW0gc3VyZmFjZV91cGRhdGVfdHlwZSAq
b3V0X3R5cGUpCiB7CisJc3RydWN0IGRjICpkYyA9IGRtLT5kYzsKIAlzdHJ1Y3QgZG1fYXRvbWlj
X3N0YXRlICpkbV9zdGF0ZSA9IE5VTEwsICpvbGRfZG1fc3RhdGUgPSBOVUxMOwogCWludCBpLCBq
LCBudW1fcGxhbmUsIHJldCA9IDA7CiAJc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqb2xkX3BsYW5l
X3N0YXRlLCAqbmV3X3BsYW5lX3N0YXRlOwpAQCAtNjM5MiwxNCArNjM5MywxMiBAQCBkbV9kZXRl
cm1pbmVfdXBkYXRlX3R5cGVfZm9yX2NvbW1pdChzdHJ1Y3QgZGMgKmRjLAogCXN0cnVjdCBkY19z
dHJlYW1fc3RhdHVzICpzdGF0dXMgPSBOVUxMOwogCiAJc3RydWN0IGRjX3N1cmZhY2VfdXBkYXRl
ICp1cGRhdGVzOwotCXN0cnVjdCBkY19wbGFuZV9zdGF0ZSAqc3VyZmFjZTsKIAllbnVtIHN1cmZh
Y2VfdXBkYXRlX3R5cGUgdXBkYXRlX3R5cGUgPSBVUERBVEVfVFlQRV9GQVNUOwogCiAJdXBkYXRl
cyA9IGtjYWxsb2MoTUFYX1NVUkZBQ0VTLCBzaXplb2YoKnVwZGF0ZXMpLCBHRlBfS0VSTkVMKTsK
LQlzdXJmYWNlID0ga2NhbGxvYyhNQVhfU1VSRkFDRVMsIHNpemVvZigqc3VyZmFjZSksIEdGUF9L
RVJORUwpOwogCi0JaWYgKCF1cGRhdGVzIHx8ICFzdXJmYWNlKSB7Ci0JCURSTV9FUlJPUigiUGxh
bmUgb3Igc3VyZmFjZSB1cGRhdGUgZmFpbGVkIHRvIGFsbG9jYXRlIik7CisJaWYgKCF1cGRhdGVz
KSB7CisJCURSTV9FUlJPUigiRmFpbGVkIHRvIGFsbG9jYXRlIHBsYW5lIHVwZGF0ZXNcbiIpOwog
CQkvKiBTZXQgdHlwZSB0byBGVUxMIHRvIGF2b2lkIGNyYXNoaW5nIGluIERDKi8KIAkJdXBkYXRl
X3R5cGUgPSBVUERBVEVfVFlQRV9GVUxMOwogCQlnb3RvIGNsZWFudXA7CkBAIC02NDQwLDE3ICs2
NDM5LDkgQEAgZG1fZGV0ZXJtaW5lX3VwZGF0ZV90eXBlX2Zvcl9jb21taXQoc3RydWN0IGRjICpk
YywKIAkJCWlmIChjcnRjICE9IG5ld19wbGFuZV9jcnRjKQogCQkJCWNvbnRpbnVlOwogCi0JCQl1
cGRhdGVzW251bV9wbGFuZV0uc3VyZmFjZSA9ICZzdXJmYWNlW251bV9wbGFuZV07CisJCQl1cGRh
dGVzW251bV9wbGFuZV0uc3VyZmFjZSA9IG5ld19kbV9wbGFuZV9zdGF0ZS0+ZGNfc3RhdGU7CiAK
IAkJCWlmIChuZXdfY3J0Y19zdGF0ZS0+bW9kZV9jaGFuZ2VkKSB7Ci0JCQkJdXBkYXRlc1tudW1f
cGxhbmVdLnN1cmZhY2UtPnNyY19yZWN0ID0KLQkJCQkJCW5ld19kbV9wbGFuZV9zdGF0ZS0+ZGNf
c3RhdGUtPnNyY19yZWN0OwotCQkJCXVwZGF0ZXNbbnVtX3BsYW5lXS5zdXJmYWNlLT5kc3RfcmVj
dCA9Ci0JCQkJCQluZXdfZG1fcGxhbmVfc3RhdGUtPmRjX3N0YXRlLT5kc3RfcmVjdDsKLQkJCQl1
cGRhdGVzW251bV9wbGFuZV0uc3VyZmFjZS0+cm90YXRpb24gPQotCQkJCQkJbmV3X2RtX3BsYW5l
X3N0YXRlLT5kY19zdGF0ZS0+cm90YXRpb247Ci0JCQkJdXBkYXRlc1tudW1fcGxhbmVdLnN1cmZh
Y2UtPmluX3RyYW5zZmVyX2Z1bmMgPQotCQkJCQkJbmV3X2RtX3BsYW5lX3N0YXRlLT5kY19zdGF0
ZS0+aW5fdHJhbnNmZXJfZnVuYzsKIAkJCQlzdHJlYW1fdXBkYXRlLmRzdCA9IG5ld19kbV9jcnRj
X3N0YXRlLT5zdHJlYW0tPmRzdDsKIAkJCQlzdHJlYW1fdXBkYXRlLnNyYyA9IG5ld19kbV9jcnRj
X3N0YXRlLT5zdHJlYW0tPnNyYzsKIAkJCX0KQEAgLTY0ODUsOCArNjQ3NiwxNCBAQCBkbV9kZXRl
cm1pbmVfdXBkYXRlX3R5cGVfZm9yX2NvbW1pdChzdHJ1Y3QgZGMgKmRjLAogCQlzdGF0dXMgPSBk
Y19zdHJlYW1fZ2V0X3N0YXR1c19mcm9tX3N0YXRlKG9sZF9kbV9zdGF0ZS0+Y29udGV4dCwKIAkJ
CQkJCQkgbmV3X2RtX2NydGNfc3RhdGUtPnN0cmVhbSk7CiAKKwkJLyoKKwkJICogVE9ETzogREMg
bW9kaWZpZXMgdGhlIHN1cmZhY2UgZHVyaW5nIHRoaXMgY2FsbCBzbyB3ZSBuZWVkCisJCSAqIHRv
IGxvY2sgaGVyZSAtIGZpbmQgYSB3YXkgdG8gZG8gdGhpcyB3aXRob3V0IGxvY2tpbmcuCisJCSAq
LworCQltdXRleF9sb2NrKCZkbS0+ZGNfbG9jayk7CiAJCXVwZGF0ZV90eXBlID0gZGNfY2hlY2tf
dXBkYXRlX3N1cmZhY2VzX2Zvcl9zdHJlYW0oZGMsIHVwZGF0ZXMsIG51bV9wbGFuZSwKIAkJCQkJ
CQkJICAmc3RyZWFtX3VwZGF0ZSwgc3RhdHVzKTsKKwkJbXV0ZXhfdW5sb2NrKCZkbS0+ZGNfbG9j
ayk7CiAKIAkJaWYgKHVwZGF0ZV90eXBlID4gVVBEQVRFX1RZUEVfTUVEKSB7CiAJCQl1cGRhdGVf
dHlwZSA9IFVQREFURV9UWVBFX0ZVTEw7CkBAIC02NDk2LDcgKzY0OTMsNiBAQCBkbV9kZXRlcm1p
bmVfdXBkYXRlX3R5cGVfZm9yX2NvbW1pdChzdHJ1Y3QgZGMgKmRjLAogCiBjbGVhbnVwOgogCWtm
cmVlKHVwZGF0ZXMpOwotCWtmcmVlKHN1cmZhY2UpOwogCiAJKm91dF90eXBlID0gdXBkYXRlX3R5
cGU7CiAJcmV0dXJuIHJldDsKQEAgLTY2ODAsNyArNjY3Niw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1
X2RtX2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCQlsb2NrX2FuZF92YWxp
ZGF0aW9uX25lZWRlZCA9IHRydWU7CiAJfQogCi0JcmV0ID0gZG1fZGV0ZXJtaW5lX3VwZGF0ZV90
eXBlX2Zvcl9jb21taXQoZGMsIHN0YXRlLCAmdXBkYXRlX3R5cGUpOworCXJldCA9IGRtX2RldGVy
bWluZV91cGRhdGVfdHlwZV9mb3JfY29tbWl0KCZhZGV2LT5kbSwgc3RhdGUsICZ1cGRhdGVfdHlw
ZSk7CiAJaWYgKHJldCkKIAkJZ290byBmYWlsOwogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
