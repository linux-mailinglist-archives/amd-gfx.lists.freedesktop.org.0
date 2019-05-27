Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B552B2BAD6
	for <lists+amd-gfx@lfdr.de>; Mon, 27 May 2019 21:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F6388999E;
	Mon, 27 May 2019 19:51:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam05on0601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe50::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1498999E
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2019 19:51:54 +0000 (UTC)
Received: from DM3PR12CA0110.namprd12.prod.outlook.com (2603:10b6:0:55::30) by
 DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:4a::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Mon, 27 May 2019 19:51:53 +0000
Received: from CO1NAM03FT006.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::203) by DM3PR12CA0110.outlook.office365.com
 (2603:10b6:0:55::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.15 via Frontend
 Transport; Mon, 27 May 2019 19:51:53 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT006.mail.protection.outlook.com (10.152.80.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Mon, 27 May 2019 19:51:52 +0000
Received: from leodev.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 27 May 2019
 14:51:51 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 03/26] drm/amd/display: Implement CM dealpha and bias
 interfaces
Date: Mon, 27 May 2019 15:50:42 -0400
Message-ID: <1558986665-12964-4-git-send-email-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558986665-12964-1-git-send-email-sunpeng.li@amd.com>
References: <1558986665-12964-1-git-send-email-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(136003)(396003)(346002)(39860400002)(2980300002)(428003)(189003)(199004)(81156014)(81166006)(478600001)(8936002)(8676002)(72206003)(2351001)(4326008)(86152003)(186003)(53936002)(70586007)(70206006)(426003)(11346002)(446003)(53416004)(77096007)(26005)(336012)(68736007)(486006)(2906002)(2616005)(2876002)(476003)(126002)(50466002)(6916009)(48376002)(47776003)(86362001)(36756003)(7696005)(50226002)(16586007)(6666004)(356004)(5660300002)(51416003)(305945005)(316002)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2667; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 890cdfe9-7188-434f-39f3-08d6e2dcc42b
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM6PR12MB2667; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2667F09603C2335E1950DA12821D0@DM6PR12MB2667.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:568;
X-Forefront-PRVS: 0050CEFE70
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: z2kqo/NuXN41Qy7BggsbBU0qbOkn9J+Vab2sx7VhIUGtVxWWtCUtZM4qqM7X/RC7zMMdYglkdRj6eA2t4Zw1kM6colTu7XKKuGncP0/jzIb2QeqSx95ZHho1QNiMk0BZjUoBIaGC8UovOL5RZCzK4TNaIL30nqlBEqSdHVGU/LRZKHhiEovRzbxP6i8yRDoNQaXCXCr6CLz+TgcsfxQCjaO6aCtzb5aWO6L1GzmCfNqKf/YGM1e/cN74j5CUqHzKHsdylFdQOViDrMFyo0XGdgwAe5Xv/ZRX3SQGqCHVrFt8A80oDTy/KUOB+5dL0iZdfAjnsxCZ1lfpu+3ZV15SiZAp3536ROvNicsICrApnwGNLStSZYq2h8Bv7TX9SuQE+o3CgMT4wcElYQAbSmrxxZt5HX04g+nfi/p+h3Y9/Xo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2019 19:51:52.9469 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 890cdfe9-7188-434f-39f3-08d6e2dcc42b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2667
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRGA0DjozRrMUYtDpsd/nGALRrXTeP/27p8EGm081bQ=;
 b=BsidnVvC8Nf2JUJ1BvpmIOhJz+P//fzoJcXCwY/qy4T0YVqgxKivODdTDks1f6kouyHE3/RFdY0O0etHVapkV9IWEAlIJu/Y4XpzWykQgGGkulhLG6wgdqf3Z/85mUXOQxzuKiCdbTsRaZse/wn8gVlgtIr054lrIhJ/sjC/3Xk=
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
Cc: Gary Kattan <gary.kattan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogR2FyeSBLYXR0YW4gPGdhcnkua2F0dGFuQGFtZC5jb20+CgpBZGQgdnRhYmxlIGVudHJp
ZXMgZm9yIGRlLWFscGhhIGFuZCBiaWFzIGNvbG9yIG1hbmFnZW1lbnQgaW50ZXJmYWNlcy4KTW92
ZSBwaWVjZS13aXNlIHRyYW5zZmVyIGZ1bmN0aW9uIHJlZ2lzdGVycyB0byBhIGhlbHBlciBsaXN0
IGZvciBmdXR1cmUKcmV1c2UuCgpTaWduZWQtb2ZmLWJ5OiBHYXJ5IEthdHRhbiA8Z2FyeS5rYXR0
YW5AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IE5ldmVua28gU3R1cGFyIDxOZXZlbmtvLlN0dXBhckBh
bWQuY29tPgpBY2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQogLi4uL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfY21fY29tbW9uLmggfCAzMSArKysrKysr
KysrKystLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L2Rw
cC5oICAgICAgICB8IDE3ICsrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRp
b25zKCspLCAxNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfY21fY29tbW9uLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfY21fY29tbW9uLmgKaW5kZXggNWFlNGQ2OS4uM2I4Y2Q3
NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEw
X2NtX2NvbW1vbi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9k
Y24xMF9jbV9jb21tb24uaApAQCAtMzgsNiArMzgsMjIgQEAKIAl0eXBlIGV4cF9yZXNpb25fc3Rh
cnRfc2VnbWVudDtcCiAJdHlwZSBmaWVsZF9yZWdpb25fbGluZWFyX3Nsb3BlCiAKKyNkZWZpbmUg
VEZfSEVMUEVSX1JFR19MSVNUIFwKKwl1aW50MzJfdCBzdGFydF9jbnRsX2I7IFwKKwl1aW50MzJf
dCBzdGFydF9jbnRsX2c7IFwKKwl1aW50MzJfdCBzdGFydF9jbnRsX3I7IFwKKwl1aW50MzJfdCBz
dGFydF9zbG9wZV9jbnRsX2I7IFwKKwl1aW50MzJfdCBzdGFydF9zbG9wZV9jbnRsX2c7IFwKKwl1
aW50MzJfdCBzdGFydF9zbG9wZV9jbnRsX3I7IFwKKwl1aW50MzJfdCBzdGFydF9lbmRfY250bDFf
YjsgXAorCXVpbnQzMl90IHN0YXJ0X2VuZF9jbnRsMl9iOyBcCisJdWludDMyX3Qgc3RhcnRfZW5k
X2NudGwxX2c7IFwKKwl1aW50MzJfdCBzdGFydF9lbmRfY250bDJfZzsgXAorCXVpbnQzMl90IHN0
YXJ0X2VuZF9jbnRsMV9yOyBcCisJdWludDMyX3Qgc3RhcnRfZW5kX2NudGwyX3I7IFwKKwl1aW50
MzJfdCByZWdpb25fc3RhcnQ7IFwKKwl1aW50MzJfdCByZWdpb25fZW5kCisKICNkZWZpbmUgVEZf
Q01fUkVHX0ZJRUxEX0xJU1QodHlwZSkgXAogCXR5cGUgY3NjX2MxMTsgXAogCXR5cGUgY3NjX2Mx
MgpAQCAtNTQsMjAgKzcwLDcgQEAgc3RydWN0IHhmZXJfZnVuY19yZWcgewogCXN0cnVjdCB4ZmVy
X2Z1bmNfc2hpZnQgc2hpZnRzOwogCXN0cnVjdCB4ZmVyX2Z1bmNfbWFzayBtYXNrczsKIAotCXVp
bnQzMl90IHN0YXJ0X2NudGxfYjsKLQl1aW50MzJfdCBzdGFydF9jbnRsX2c7Ci0JdWludDMyX3Qg
c3RhcnRfY250bF9yOwotCXVpbnQzMl90IHN0YXJ0X3Nsb3BlX2NudGxfYjsKLQl1aW50MzJfdCBz
dGFydF9zbG9wZV9jbnRsX2c7Ci0JdWludDMyX3Qgc3RhcnRfc2xvcGVfY250bF9yOwotCXVpbnQz
Ml90IHN0YXJ0X2VuZF9jbnRsMV9iOwotCXVpbnQzMl90IHN0YXJ0X2VuZF9jbnRsMl9iOwotCXVp
bnQzMl90IHN0YXJ0X2VuZF9jbnRsMV9nOwotCXVpbnQzMl90IHN0YXJ0X2VuZF9jbnRsMl9nOwot
CXVpbnQzMl90IHN0YXJ0X2VuZF9jbnRsMV9yOwotCXVpbnQzMl90IHN0YXJ0X2VuZF9jbnRsMl9y
OwotCXVpbnQzMl90IHJlZ2lvbl9zdGFydDsKLQl1aW50MzJfdCByZWdpb25fZW5kOworCVRGX0hF
TFBFUl9SRUdfTElTVDsKIH07CiAKIHN0cnVjdCBjbV9jb2xvcl9tYXRyaXhfc2hpZnQgewpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9ody9kcHAuaCBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvZHBwLmgKaW5kZXggZmI3OTY3Yi4u
YjU1YzVhMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9o
dy9kcHAuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L2RwcC5o
CkBAIC02NCw3ICs2NCwyMiBAQCBzdHJ1Y3QgZGNuX2RwcF9zdGF0ZSB7CiAJdWludDMyX3QgZ2Ft
dXRfcmVtYXBfYzMzX2MzNDsKIH07CiAKK3N0cnVjdCBDTV9iaWFzX3BhcmFtcyB7CisJdWludDMy
X3QgY21fYmlhc19jcl9yOworCXVpbnQzMl90IGNtX2JpYXNfeV9nOworCXVpbnQzMl90IGNtX2Jp
YXNfY2JfYjsKKwl1aW50MzJfdCBjbV9iaWFzX2Zvcm1hdDsKK307CisKIHN0cnVjdCBkcHBfZnVu
Y3MgeworCisJdm9pZCAoKmRwcF9wcm9ncmFtX2NtX2RlYWxwaGEpKHN0cnVjdCBkcHAgKmRwcF9i
YXNlLAorCQl1aW50MzJfdCBlbmFibGUsIHVpbnQzMl90IGFkZGl0aXZlX2JsZW5kaW5nKTsKKwor
CXZvaWQgKCpkcHBfcHJvZ3JhbV9jbV9iaWFzKSgKKwkJc3RydWN0IGRwcCAqZHBwX2Jhc2UsCisJ
CXN0cnVjdCBDTV9iaWFzX3BhcmFtcyAqYmlhc19wYXJhbXMpOworCiAJdm9pZCAoKmRwcF9yZWFk
X3N0YXRlKShzdHJ1Y3QgZHBwICpkcHAsIHN0cnVjdCBkY25fZHBwX3N0YXRlICpzKTsKIAogCXZv
aWQgKCpkcHBfcmVzZXQpKHN0cnVjdCBkcHAgKmRwcCk7CkBAIC0xNTUsOSArMTcwLDExIEBAIHN0
cnVjdCBkcHBfZnVuY3MgewogCQkJdWludDMyX3Qgd2lkdGgsCiAJCQl1aW50MzJfdCBoZWlnaHQK
IAkJCSk7CisKIAl2b2lkICgqZHBwX3NldF9oZHJfbXVsdGlwbGllcikoCiAJCQlzdHJ1Y3QgZHBw
ICpkcHBfYmFzZSwKIAkJCXVpbnQzMl90IG11bHRpcGxpZXIpOworCiAJdm9pZCAoKnNldF9vcHRp
b25hbF9jdXJzb3JfYXR0cmlidXRlcykoCiAJCQlzdHJ1Y3QgZHBwICpkcHBfYmFzZSwKIAkJCXN0
cnVjdCBkcHBfY3Vyc29yX2F0dHJpYnV0ZXMgKmF0dHIpOwotLSAKMi43LjQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
