Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7141848A
	for <lists+amd-gfx@lfdr.de>; Thu,  9 May 2019 06:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE3B89919;
	Thu,  9 May 2019 04:32:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760084.outbound.protection.outlook.com [40.107.76.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19DC589919
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 May 2019 04:32:00 +0000 (UTC)
Received: from DM5PR12CA0051.namprd12.prod.outlook.com (2603:10b6:3:103::13)
 by MN2PR12MB3486.namprd12.prod.outlook.com (2603:10b6:208:c6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.12; Thu, 9 May
 2019 04:31:52 +0000
Received: from CO1NAM03FT032.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by DM5PR12CA0051.outlook.office365.com
 (2603:10b6:3:103::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.21 via Frontend
 Transport; Thu, 9 May 2019 04:31:52 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT032.mail.protection.outlook.com (10.152.80.173) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Thu, 9 May 2019 04:31:51 +0000
Received: from monk-build.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 8 May 2019
 23:31:49 -0500
From: Monk Liu <Monk.Liu@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/sched: fix the duplicated TMO message for one IB
Date: Thu, 9 May 2019 12:31:45 +0800
Message-ID: <1557376305-24294-1-git-send-email-Monk.Liu@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(136003)(396003)(39860400002)(376002)(2980300002)(428003)(199004)(189003)(305945005)(51416003)(7696005)(316002)(72206003)(16586007)(336012)(126002)(2616005)(186003)(476003)(26005)(486006)(5660300002)(15650500001)(8676002)(426003)(81166006)(6916009)(81156014)(8936002)(50226002)(2906002)(68736007)(4326008)(6666004)(77096007)(478600001)(47776003)(356004)(53936002)(86362001)(36756003)(70586007)(50466002)(70206006)(14444005)(48376002)(2351001)(53416004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3486; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7dc67fc-9c8d-40fc-4f62-08d6d437423a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:MN2PR12MB3486; 
X-MS-TrafficTypeDiagnostic: MN2PR12MB3486:
X-Microsoft-Antispam-PRVS: <MN2PR12MB34864C35DA296BECD72EFE5C84330@MN2PR12MB3486.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:459;
X-Forefront-PRVS: 003245E729
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: bYhEhH93/WrcXMiGU/v7lWFC+aNW8hwidau3id2VT8NL/1p8LiU72E//d8YPjrGMLl4/RWxA4MXNz0PYiuEeYvfbha2vwxpz6qyrKxMAz1CQFsSZV9AyS8IYz6LwCfUOPXmeWYvKFzePbSLRnUn9I1ZLwdkNQikEQV2E1FKq5irnCiY40FYVDZ81eql6dK4ruvo6WgFwA84YIY9rGRoZKFcX/ajJxbEvUrtths8oR/b2+NYmtT6MDFSabU7JoFsBDRJOedsPA+3BhkJ7A0eIEJs3xyigtOr43XHzZA1N+75D9e2iUCj1VVXI6+eaYOoN6nbzgKPFR7zO342peBbWYG0fTqguE2FjvMAs51QLc8IE4aJLsrwOTsoKjR+Vt2yIB1eY2oALNtST9P/A+55b3adjiJ2kNcAQVtUypGpck2Y=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2019 04:31:51.6989 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7dc67fc-9c8d-40fc-4f62-08d6d437423a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3486
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2GJ5Z4UoCB+VaIdQ5IcF7B246zcyLf3vMnIgKiNwl4=;
 b=20mIF0ZY17Y9MZxu3kWjwKjI4lM199GSPuJx1GN9Qse65oGQDtnkh0USEVOQuW5NxRJdpiPGf7wdLpGcPiD4PG5YBN/osxoxjMCbOwQGxio6mZlLNZn11up+mXH5TgilBxcXLn1EhOnaWo5IBD01Gul5J3P7bBZoUwPpvR/1Y9M=
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
Cc: Monk Liu <Monk.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

d2UgZG9uJ3QgbmVlZCBkdXBsaWNhdGVkIElCJ3MgdGltZW91dCBlcnJvciBtZXNzYWdlIHJlcG9y
dGVkIGVuZGxlc3NseSwKanVzdCBvbmUgcmVwb3J0IHBlciB0aW1lZG91dCBJQiBpcyBlbm91Z2gK
ClNpZ25lZC1vZmYtYnk6IE1vbmsgTGl1IDxNb25rLkxpdUBhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jIHwgNSAtLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9z
Y2hlZF9tYWluLmMgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwppbmRl
eCBjMWFhZjg1Li5kNmMxN2YxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVy
L3NjaGVkX21haW4uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4u
YwpAQCAtMzA4LDcgKzMwOCw2IEBAIHN0YXRpYyB2b2lkIGRybV9zY2hlZF9qb2JfdGltZWRvdXQo
c3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQogewogCXN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAq
c2NoZWQ7CiAJc3RydWN0IGRybV9zY2hlZF9qb2IgKmpvYjsKLQl1bnNpZ25lZCBsb25nIGZsYWdz
OwogCiAJc2NoZWQgPSBjb250YWluZXJfb2Yod29yaywgc3RydWN0IGRybV9ncHVfc2NoZWR1bGVy
LCB3b3JrX3Rkci53b3JrKTsKIAlqb2IgPSBsaXN0X2ZpcnN0X2VudHJ5X29yX251bGwoJnNjaGVk
LT5yaW5nX21pcnJvcl9saXN0LApAQCAtMzE2LDEwICszMTUsNiBAQCBzdGF0aWMgdm9pZCBkcm1f
c2NoZWRfam9iX3RpbWVkb3V0KHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKIAogCWlmIChqb2Ip
CiAJCWpvYi0+c2NoZWQtPm9wcy0+dGltZWRvdXRfam9iKGpvYik7Ci0KLQlzcGluX2xvY2tfaXJx
c2F2ZSgmc2NoZWQtPmpvYl9saXN0X2xvY2ssIGZsYWdzKTsKLQlkcm1fc2NoZWRfc3RhcnRfdGlt
ZW91dChzY2hlZCk7Ci0Jc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmc2NoZWQtPmpvYl9saXN0X2xv
Y2ssIGZsYWdzKTsKIH0KIAogIC8qKgotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
