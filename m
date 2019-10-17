Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE04DB737
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 21:15:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD8E6EAB5;
	Thu, 17 Oct 2019 19:15:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810080.outbound.protection.outlook.com [40.107.81.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAFF46EAA5
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 19:15:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KvqcFI5TXO20X70WWcMj5FYES+mJKitTSz4kxsB1OIZStdNsKShbKPI1UXP+Zio66/DXiRrP1eo/SRS7C0v+rEnZOQswBs6iA6FfRnPygvOPTXJOIgiLRNzMMvowFOk0uB+vZZVQoR6pU0oZ/gIy/jBe26Bz8O5vrORvvTIKkN9J2mHfhethP0s+IV2BP45X6ZuHdEXvhlEy4fSkqFu0/PDaoHBU5q82EWPh7TICtCOf1LOwr8nxASbAJ+Ve7zFb8SxiZxGE3e2LhPg9VTMJ270kp5emGr3umx6o6OTOi4d1VepcX/GLe7Vh+N/tGf3z5QPcpwHCX4KNkLQTwHL+3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ss8eXyEIfYli5J8Y/S0zkKg1N63fKPjAVL5wpShrTSM=;
 b=GjqPJZ9wqLnKRd2v3+MAi0t1BuzMq9IajuRv7YMj0WMS9UCqV8hipbqtJIa/i699ZSo1bI6cv+Xjl2sESvti9VjcKGOhaya/YHg2ilC8BOW9V3RmesiEUG2KPayUMjylMCw0+RJGZ92MlqGJcIVgirDR0Mcyhm+Rr8/gtBhZU8dXla4pCARckgMZ5XNQ90Yo15FEYBUkYiDvjPWUHM5N9voFvbajzJN/gQqHURN4LvXh4baYtKvCxVefmd1eJcZjkhjFOO/0EDojb75VF7M3uM4GeW36jWyl4sK3iNL0Ie5LeI/lolOzemzK1156Xi6pCgFzjfYx7nt/N2M+fS92iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0070.namprd12.prod.outlook.com (2603:10b6:3:103::32)
 by CH2PR12MB3813.namprd12.prod.outlook.com (2603:10b6:610:2c::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Thu, 17 Oct
 2019 19:15:40 +0000
Received: from CO1NAM03FT008.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by DM5PR12CA0070.outlook.office365.com
 (2603:10b6:3:103::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Thu, 17 Oct 2019 19:15:40 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM03FT008.mail.protection.outlook.com (10.152.80.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2367.14 via Frontend Transport; Thu, 17 Oct 2019 19:15:40 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:39 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:39 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 17 Oct 2019 14:15:39 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 16/37] drm/amd/display: audio endpoint cannot switch
Date: Thu, 17 Oct 2019 15:13:08 -0400
Message-ID: <20191017191329.11857-17-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017191329.11857-1-sunpeng.li@amd.com>
References: <20191017191329.11857-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(376002)(428003)(189003)(199004)(70586007)(81166006)(336012)(86362001)(81156014)(8676002)(305945005)(486006)(426003)(2616005)(126002)(446003)(54906003)(476003)(48376002)(316002)(2870700001)(2876002)(1076003)(2906002)(6666004)(356004)(186003)(50226002)(5660300002)(26005)(8936002)(11346002)(36756003)(70206006)(478600001)(4326008)(76176011)(51416003)(47776003)(2351001)(50466002)(6916009)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3813; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fd7824c-82f8-460b-ff95-08d753366649
X-MS-TrafficTypeDiagnostic: CH2PR12MB3813:
X-Microsoft-Antispam-PRVS: <CH2PR12MB38137711BF759F33FD30B3A0826D0@CH2PR12MB3813.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-Forefront-PRVS: 01930B2BA8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jg/C2ZIqo0f6Jfj7gbMSlUDc8gsn6jDI0qX9MbiI/OkoqpBwRy1df9WUW2AsJMeLx/g0pQseSotp//TY2e1s5MitXoq7fYk2WVPP9tIqPt4h8b6ul5RRfPcRyYy/N6jzPoLMw90yKctO0XBZXNA+6NXydiqVYEZYRrhpqBPCQgiGmsK2Rt5LTylWMNWAuYmTLNoopGphuVMYivXtcAbb/bdyyaN7vQMPMLBdCmodM9F/z6NmDwkVyiDxt87kv9GI4Bro0fnIz/je2r7lqm2c1zltTvd9iKBSuhoWCvfHLyFARS34Zku2k+LuyH5TTcIySq2oulbqy1S+kt5hzkSDVmwm0sutpHfWjQcEO5BAGbIQJpg+1wha+QBwCZtUekLWiLfo4v4b9bzoIqTEimxAZpEN2LBy8YIA7z2lNUpwzt4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 19:15:40.4033 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fd7824c-82f8-460b-ff95-08d753366649
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3813
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ss8eXyEIfYli5J8Y/S0zkKg1N63fKPjAVL5wpShrTSM=;
 b=rY8nzSRAlXAyFjGRVKd2wdOmaMjKPKq6U/6JheUnA45/QCCd/eRtwh54MIfKhXXH+LQK1x02lhgrLB0V4RSjmmOYXICU/xVLsWP1gwi12iXRBsggVTHKBsk0ijvUpr6HGAzlK5BLXRRXplcTMHtmfMZZU2z6xjPk3h/Y5MF1D08=
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
Cc: Leo Li <sunpeng.li@amd.com>, Charlene Liu <Charlene.Liu@amd.com>,
 Paul Hsieh <paul.hsieh@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUGF1bCBIc2llaCA8cGF1bC5oc2llaEBhbWQuY29tPgoKW1doeV0KT24gc29tZSBzeXN0
ZW1zLCB3ZSBuZWVkIHRvIGNoZWNrIHRoZSBkY24gdmVyc2lvbiBpbiBydW50aW1lCnN5c3RlbSwg
bm90IGluIGNvbXBpbGUgdGltZS4KCltIb3ddClN0dWIgaW4gZGNuIHZlcnNpb24gcGFyYW1ldGVy
IHRvIGZpbmRfZmlyc3RfZnJlZV9hdWRpbwoKU2lnbmVkLW9mZi1ieTogUGF1bCBIc2llaCA8cGF1
bC5oc2llaEBhbWQuY29tPgpSZXZpZXdlZC1ieTogQ2hhcmxlbmUgTGl1IDxDaGFybGVuZS5MaXVA
YW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3Jlc291cmNlLmMgfCA1ICsrKy0tCiAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3Jlc291cmNlLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19yZXNvdXJjZS5jCmluZGV4IDI1
ZGEwYzQ1ZDgyOC4uZGE5ZTJlNWY1YzBkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvY29yZS9kY19yZXNvdXJjZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9jb3JlL2RjX3Jlc291cmNlLmMKQEAgLTE2MjksNyArMTYyOSw4IEBAIHN0YXRp
YyBpbnQgYWNxdWlyZV9maXJzdF9mcmVlX3BpcGUoCiBzdGF0aWMgc3RydWN0IGF1ZGlvICpmaW5k
X2ZpcnN0X2ZyZWVfYXVkaW8oCiAJCXN0cnVjdCByZXNvdXJjZV9jb250ZXh0ICpyZXNfY3R4LAog
CQljb25zdCBzdHJ1Y3QgcmVzb3VyY2VfcG9vbCAqcG9vbCwKLQkJZW51bSBlbmdpbmVfaWQgaWQp
CisJCWVudW0gZW5naW5lX2lkIGlkLAorCQllbnVtIGRjZV92ZXJzaW9uIGRjX3ZlcnNpb24pCiB7
CiAJaW50IGksIGF2YWlsYWJsZV9hdWRpb19jb3VudDsKIApAQCAtMTk2NSw3ICsxOTY2LDcgQEAg
ZW51bSBkY19zdGF0dXMgcmVzb3VyY2VfbWFwX3Bvb2xfcmVzb3VyY2VzKAogCSAgICBkY19pc19h
dWRpb19jYXBhYmxlX3NpZ25hbChwaXBlX2N0eC0+c3RyZWFtLT5zaWduYWwpICYmCiAJICAgIHN0
cmVhbS0+YXVkaW9faW5mby5tb2RlX2NvdW50ICYmIHN0cmVhbS0+YXVkaW9faW5mby5mbGFncy5h
bGwpIHsKIAkJcGlwZV9jdHgtPnN0cmVhbV9yZXMuYXVkaW8gPSBmaW5kX2ZpcnN0X2ZyZWVfYXVk
aW8oCi0JCSZjb250ZXh0LT5yZXNfY3R4LCBwb29sLCBwaXBlX2N0eC0+c3RyZWFtX3Jlcy5zdHJl
YW1fZW5jLT5pZCk7CisJCSZjb250ZXh0LT5yZXNfY3R4LCBwb29sLCBwaXBlX2N0eC0+c3RyZWFt
X3Jlcy5zdHJlYW1fZW5jLT5pZCwgZGNfY3R4LT5kY2VfdmVyc2lvbik7CiAKIAkJLyoKIAkJICog
QXVkaW8gYXNzaWduZWQgaW4gb3JkZXIgZmlyc3QgY29tZSBmaXJzdCBnZXQuCi0tIAoyLjIzLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
