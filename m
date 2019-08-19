Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE6E9270C
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 16:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 145236E17B;
	Mon, 19 Aug 2019 14:36:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam05on0627.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe50::627])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92AF16E14F
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 14:36:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=coMlt4TbBTYl0wYSEtYiJdwBg6jafeyJ6hEfXvmJYIL374yAQHPA6kUNUuj5MFeVvC8wnyqzdHd6uld6SyKgmrBTzhaih+ZcOFETGVw/qfYkjQaXU89OvA7HnVQMO2Q6LvmYQlqSosS9doxcdKdMnppmAC0RqOLYfC19sg4d1YWs0JUwRmhIhj7v9CjnKK+M0800ex+bqxQDTtJVH960vQUBdBKSejJHm6vQzzxsr55PP8C0t/ThPB7TkcCHGRs4GbZ6FoTf/fkBMVjoX38/BUobpF+Tqj7eUi6x4hd+QjO2Gak4d+kSGPgaEFUr8MgWtQhu9MZ20NpmFUfHWMcR8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y5UP6ClB6XPZ7crxKfFqQiTifksrI7Njyvearr2tusg=;
 b=cH3J0zdiDdVlDL6kVhHQg8EbALlutMFXae7xjIJah2670isu1jfHoEnNOIaTrOiSLUdWmbDwPisXShohhxQZHHyC7UCM2hJKXF2H/KQp24Hp7XpwmXfvaPc5Sfu81HyOSD0VebQzsuFNh+4cAb7EpBvjtBks1t7zIQ4KE2YUlhCD7OO6fLa9Ts7sn0jBxUvwdk3gOpUcKa8Y48cO5R671ZyDcEI4RBwA5+pllyCIKhD3fiE9GJqpFNW8Cm95LgasVgZU25I7ogA9ElZWSxk125oAz+MGLPEXFwRjmsj9Xi7enEmR4yVgkaNLu01TZqy1iv28CIZgBf/2sJq1eRiS0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR12CA0034.namprd12.prod.outlook.com (2603:10b6:405:70::20)
 by BN6PR12MB1268.namprd12.prod.outlook.com (2603:10b6:404:1a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Mon, 19 Aug
 2019 14:36:06 +0000
Received: from BY2NAM03FT016.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::200) by BN6PR12CA0034.outlook.office365.com
 (2603:10b6:405:70::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 14:36:06 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT016.mail.protection.outlook.com (10.152.84.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 14:36:05 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 19 Aug 2019
 09:35:50 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 32/36] drm/amd/display: Use res_cap to acquire i2c instead of
 pipe count
Date: Mon, 19 Aug 2019 10:35:11 -0400
Message-ID: <20190819143515.21653-33-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
References: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(396003)(136003)(2980300002)(428003)(199004)(189003)(86362001)(53936002)(478600001)(1076003)(50226002)(36756003)(6916009)(16586007)(47776003)(316002)(8676002)(81166006)(8936002)(81156014)(53416004)(2616005)(476003)(126002)(426003)(2351001)(5660300002)(76176011)(6666004)(356004)(70586007)(70206006)(4326008)(7696005)(11346002)(446003)(51416003)(50466002)(186003)(2906002)(486006)(48376002)(26005)(336012)(305945005)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1268; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4f016f2-6ab7-435c-d5a9-08d724b29170
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1268; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1268:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1268396920F10E4DD82EB128F9A80@BN6PR12MB1268.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 3103p4Nl+pS9DE3ELrrzz3on9t21PnCFFmvjt8RDqtVyernk0RRGL7fzBLQR6W2+C4ZjIanGfuNUiVGZca/1YSnp56D8PaYE9XKRj9nHfV4rlNTrS5aZT20LPkTviLcbpdryIrAZB8/95rE0JqsWZqlJfS2zzQEmggVLlJ63fFNsY5XvmDKUHjRozk4tv8mklLCM7pc7r/2qMjNyAtqO0QTafBdYFv/EcTug5S3BhgkpF1DOuP5AeiwT65qFsq6T956rztMpvcSiwGkOEpLyPCtn6kDXF5/sd6RmssPriSNADHx2a2vlmu0Vn8GUnGPJKVt572PGO6OV91Fj0rkBXtJbEq/aAuO2v5AytuifSBDE3kDBWo+n9qJ+0fmDv1pp6TQSE8Ge6mNWp66XKAqgAadHPqmQPXqh9axbXqWIVCU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 14:36:05.7512 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4f016f2-6ab7-435c-d5a9-08d724b29170
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1268
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y5UP6ClB6XPZ7crxKfFqQiTifksrI7Njyvearr2tusg=;
 b=TAOVDJAASk3WXr9gTObHst+8PAPH4k7IOtJijM2tzlFrpW4+aphTNl96dVSdGfP9y5R3wwI6lq9RWaxGKxsHAVSNIUAVai9NDnBbgs5uuO9emiXK6vjjG9nHZjU0NXZF12Kn4F/d9+BhrZwRe9QOmLke8BGXjaFi/hczsqzwZs8=
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
Cc: Derek Lai <Derek.Lai@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRGVyZWsgTGFpIDxEZXJlay5MYWlAYW1kLmNvbT4KCltXaHldCldlIHNob3VsZCBiZSB1
c2luZyB0aGUgZGRjX251bSBmcm9tIHJlc19jYXBzLiBBcyB0aGUKcGlwZSBjb3VudCAhPSBudW1i
ZXIgb2YgaTJjIHJlc291cmNlcy4KCltIb3ddClVzZSBkZGNfbnVtIGZyb20gcmVzX2NhcCBpbnN0
ZWFkIG9mIHBpcGUgY291bnQuCgpTaWduZWQtb2ZmLWJ5OiBEZXJlayBMYWkgPERlcmVrLkxhaUBh
bWQuY29tPgpSZXZpZXdlZC1ieTogQ2hhcmxlbmUgTGl1IDxDaGFybGVuZS5MaXVAYW1kLmNvbT4K
QWNrZWQtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2kyY19ody5jIHwgMyAr
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9pMmNfaHcuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2kyY19ody5jCmluZGV4IGNh
YWNlNTIyOTgyNi4uMDQ5NWExYjVkZDc0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNlL2RjZV9pMmNfaHcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNlL2RjZV9pMmNfaHcuYwpAQCAtMjIsNiArMjIsNyBAQAogICogQXV0aG9yczog
QU1ECiAgKgogICovCisjaW5jbHVkZSAicmVzb3VyY2UuaCIKICNpbmNsdWRlICJkY2VfaTJjLmgi
CiAjaW5jbHVkZSAiZGNlX2kyY19ody5oIgogI2luY2x1ZGUgInJlZ19oZWxwZXIuaCIKQEAgLTM4
Nyw3ICszODgsNyBAQCBzdHJ1Y3QgZGNlX2kyY19odyAqYWNxdWlyZV9pMmNfaHdfZW5naW5lKAog
CWlmIChkZGMtPmh3X2luZm8uaHdfc3VwcG9ydGVkKSB7CiAJCWVudW0gZ3Bpb19kZGNfbGluZSBs
aW5lID0gZGFsX2RkY19nZXRfbGluZShkZGMpOwogCi0JCWlmIChsaW5lIDwgcG9vbC0+cGlwZV9j
b3VudCkKKwkJaWYgKGxpbmUgPCBwb29sLT5yZXNfY2FwLT5udW1fZGRjKQogCQkJZGNlX2kyY19o
dyA9IHBvb2wtPmh3X2kyY3NbbGluZV07CiAJfQogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
