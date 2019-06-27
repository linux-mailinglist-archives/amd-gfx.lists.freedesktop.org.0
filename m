Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D3F57C6E
	for <lists+amd-gfx@lfdr.de>; Thu, 27 Jun 2019 08:49:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B1896E5B0;
	Thu, 27 Jun 2019 06:49:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750082.outbound.protection.outlook.com [40.107.75.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712966E5B0
 for <amd-gfx@lists.freedesktop.org>; Thu, 27 Jun 2019 06:49:48 +0000 (UTC)
Received: from DM3PR12CA0054.namprd12.prod.outlook.com (2603:10b6:0:56::22) by
 MWHPR12MB1757.namprd12.prod.outlook.com (2603:10b6:300:111::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.17; Thu, 27 Jun 2019 06:49:46 +0000
Received: from CO1NAM03FT035.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by DM3PR12CA0054.outlook.office365.com
 (2603:10b6:0:56::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2032.17 via Frontend
 Transport; Thu, 27 Jun 2019 06:49:46 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT035.mail.protection.outlook.com (10.152.80.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2032.15 via Frontend Transport; Thu, 27 Jun 2019 06:49:45 +0000
Received: from rico-code.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 27 Jun 2019
 01:49:43 -0500
From: Tianci Yin <tianci.yin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: update smu11_driver_if_navi10.h
Date: Thu, 27 Jun 2019 14:49:36 +0800
Message-ID: <1561618176-27968-1-git-send-email-tianci.yin@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(376002)(136003)(396003)(39860400002)(2980300002)(428003)(199004)(189003)(7696005)(8936002)(478600001)(48376002)(54906003)(50226002)(68736007)(50466002)(16586007)(72206003)(53416004)(316002)(8676002)(81156014)(53936002)(81166006)(47776003)(5660300002)(356004)(6666004)(14444005)(15650500001)(36756003)(305945005)(4326008)(486006)(336012)(426003)(126002)(2906002)(2616005)(476003)(51416003)(44832011)(70206006)(70586007)(77096007)(26005)(86362001)(6916009)(2351001)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1757; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4277badb-7b15-4c4d-87ba-08d6facba41f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1757; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1757:
X-Microsoft-Antispam-PRVS: <MWHPR12MB175734C31B57BF34308EB08695FD0@MWHPR12MB1757.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 008184426E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: ZDcH5AE6Ejs/4HcK0vxfH2RMcKd5iYZ+3w39IEwqpTVallqTUd31wF2URj5LkEWa9nGhYc8xXIiupaW2rzYxUSY2GKX+0fj4xc1KTJUKC0yEjGEXAfzV2taHGJYGoZOwh0BA6VhE8sNgvIdmnrhxPQ/4it8jFACPkvP6Irz2n87M0XcwSzZkcHYA3CDuaItcuO9GjQuQCt5rOADDSHen7nZXVlxHNhcGagxp2t2iE+BLLNf45hYrxk2NRBVSBD4qjYX7kRfX0Pe//c0fOEbZCMQVy9MaKH/U4bLnwBHmlZk+9Lp1a1hkHyqwZdRohWG/L9hhAZW0KEIp5H1ACyv1nk58IekuXc7njBr5+XRJKFZmTY/E9Sg2rpcw++O8ufZBQVujykjITfvl2nsHLGXNa8ziTcbDw8z34Kgqv61NnTE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2019 06:49:45.5606 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4277badb-7b15-4c4d-87ba-08d6facba41f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1757
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dh6dNlkixXo5a5H3vJHbx/7+J1anKdRtjUwzw2WKHks=;
 b=t34RbGpW0iLWMCtUiMOzmvpdapgQL3gWUm+VqTJ3R4Rcnf8XarJWo0qeC9w6TEJtdRODSNQH15dr9D2tJbn1ZtP+Wq6/dMjlAfz3PIOS687VIVvTeuXf/hzVVU41dqF3bW1JSIChV/pOWaUdLuzYbmZD+9o6NuBFx6JOBOBmWoY=
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
Cc: Jack Xiao <Jack.Xiao@amd.com>, Tianci Yin <tianci.yin@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogdGlhbmN5aW4gPHRpYW5jaS55aW5AYW1kLmNvbT4KCnVwZGF0ZSB0aGUgc211MTFfZHJp
dmVyX2lmX25hdmkxMC5oIHNpbmNlIG5hdmkxMCBzbXUgZncKdXBkYXRlIHRvIDQyLjI4CgpTaWdu
ZWQtb2ZmLWJ5OiB0aWFuY3lpbiA8dGlhbmNpLnlpbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L2luYy9zbXUxMV9kcml2ZXJfaWZfbmF2aTEwLmggfCA2ICsrKy0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jICAgICAgICAgICAg
ICAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9zbXUx
MV9kcml2ZXJfaWZfbmF2aTEwLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMv
c211MTFfZHJpdmVyX2lmX25hdmkxMC5oCmluZGV4IGE4YjMxYmMuLmFkYmJmZWIgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9zbXUxMV9kcml2ZXJfaWZfbmF2
aTEwLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdTExX2RyaXZl
cl9pZl9uYXZpMTAuaApAQCAtMjYsNyArMjYsNyBAQAogLy8gKioqIElNUE9SVEFOVCAqKioKIC8v
IFNNVSBURUFNOiBBbHdheXMgaW5jcmVtZW50IHRoZSBpbnRlcmZhY2UgdmVyc2lvbiBpZiAKIC8v
IGFueSBzdHJ1Y3R1cmUgaXMgY2hhbmdlZCBpbiB0aGlzIGZpbGUKLSNkZWZpbmUgU01VMTFfRFJJ
VkVSX0lGX1ZFUlNJT04gMHgzMgorI2RlZmluZSBTTVUxMV9EUklWRVJfSUZfVkVSU0lPTiAweDMz
CiAKICNkZWZpbmUgUFBUQUJMRV9OVjEwX1NNVV9WRVJTSU9OIDgKIApAQCAtODEzLDggKzgxMyw4
IEBAIHR5cGVkZWYgc3RydWN0IHsKICAgdWludDE2X3QgICAgIFVjbGtBdmVyYWdlTHBmVGF1Owog
ICB1aW50MTZfdCAgICAgR2Z4QWN0aXZpdHlMcGZUYXU7CiAgIHVpbnQxNl90ICAgICBVY2xrQWN0
aXZpdHlMcGZUYXU7CisgIHVpbnQxNl90ICAgICBTb2NrZXRQb3dlckxwZlRhdTsKIAotICB1aW50
MTZfdCAgICAgUGFkZGluZzsgIAogICAvLyBQYWRkaW5nIC0gaWdub3JlCiAgIHVpbnQzMl90ICAg
ICBNbUh1YlBhZGRpbmdbOF07IC8vIFNNVSBpbnRlcm5hbCB1c2UKIH0gRHJpdmVyU211Q29uZmln
X3Q7CkBAIC04NTMsNyArODUzLDcgQEAgdHlwZWRlZiBzdHJ1Y3QgewogICB1aW50OF90ICBDdXJy
R2Z4Vm9sdGFnZU9mZnNldCAgOwogICB1aW50OF90ICBDdXJyTWVtVmlkT2Zmc2V0ICAgICAgOwog
ICB1aW50OF90ICBQYWRkaW5nOCAgICAgICAgICAgICAgOwotICB1aW50MTZfdCBDdXJyU29ja2V0
UG93ZXIgICAgICAgOworICB1aW50MTZfdCBBdmVyYWdlU29ja2V0UG93ZXIgICAgOwogICB1aW50
MTZfdCBUZW1wZXJhdHVyZUVkZ2UgICAgICAgOwogICB1aW50MTZfdCBUZW1wZXJhdHVyZUhvdHNw
b3QgICAgOwogICB1aW50MTZfdCBUZW1wZXJhdHVyZU1lbSAgICAgICAgOwpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCmluZGV4IDk5NTY2ZGUuLjM3M2FlYmEgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKQEAgLTg2Myw3ICs4
NjMsNyBAQCBzdGF0aWMgaW50IG5hdmkxMF9nZXRfZ3B1X3Bvd2VyKHN0cnVjdCBzbXVfY29udGV4
dCAqc211LCB1aW50MzJfdCAqdmFsdWUpCiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAotCSp2
YWx1ZSA9IG1ldHJpY3MuQ3VyclNvY2tldFBvd2VyIDw8IDg7CisJKnZhbHVlID0gbWV0cmljcy5B
dmVyYWdlU29ja2V0UG93ZXIgPDwgODsKIAogCXJldHVybiAwOwogfQotLSAKMi43LjQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
