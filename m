Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3CCD48BA
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 21:54:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80FC86EC94;
	Fri, 11 Oct 2019 19:53:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790077.outbound.protection.outlook.com [40.107.79.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B216EC98
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 19:53:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LKOtxa3qQYkX8o5InikN/XFsmTHL8lFMcGDRt6VoY8w5PY0ft5PaW+8jNz9RTEqlZ/QeU8RYP/T35tX+1UwuXJ0v55lAXDqzgYqP88HsjK/9ThiET77tMJwOnisOqsSp4lTmtRe60xl9jg8+ZD7hwCpoESRYWEBLl5sBhe3Hzmg3oP5umDWJf6aAqrsat3BkbKkXG2Hd0bgVKOU7/C4AVQYHmH42KQHcKT5wDZoyxNezqJfTK5YGe2hoG16d9eDyUhSJko5kQfqJFnhwtOR9pp5fEhNfpr4MN+ixA4GXNLWn8mhUuh7iYq/w75WVgSLAYJ0cZbdEk/s9CqUWzzdIOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BcCMFi3X9CTzRq5kTdR/ZHj4yxTWHNv8nexiMA3ztYk=;
 b=OHLSP3oJLuVUULFN0d3UqiEHDvS8jYgdze2owTSm4fncJd58Z+pIysvi5aSSkk6n7NuWEZX6I4Xfe600tEDHBAlsl9k3J5BLR+S+qC1bTViZsxwplhxee6vmuTfuy43u6H8BwWf4p485IUfW/NyxNiD16jjXFBBUnux2khkxOhFHsu+MsFNK4ddd3rKrfQBELL802LYqCRDJEBaRsfw0wYTVKJbrw4BfSpIm3SwMXflpwZk3dF85oT3Xp4RyvMlIqtAhOcE5MZlk9FeFgxKg3zkADzVI3v94YG/aU8HZcUacDSzJ9X+Y1B7VlhxtlaiLnIWp2L1HeetKxpHk+cqJmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR1201CA0021.namprd12.prod.outlook.com
 (2603:10b6:405:4c::31) by BYAPR12MB3432.namprd12.prod.outlook.com
 (2603:10b6:a03:ac::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Fri, 11 Oct
 2019 19:53:54 +0000
Received: from BY2NAM03FT061.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::207) by BN6PR1201CA0021.outlook.office365.com
 (2603:10b6:405:4c::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Fri, 11 Oct 2019 19:53:54 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT061.mail.protection.outlook.com (10.152.85.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2347.21 via Frontend Transport; Fri, 11 Oct 2019 19:53:54 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 11 Oct 2019
 14:53:49 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 23/29] drm/amd/display: Fix rn audio playback and video
 playback speed
Date: Fri, 11 Oct 2019 15:53:18 -0400
Message-ID: <20191011195324.16268-24-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
References: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(396003)(39860400002)(376002)(428003)(189003)(199004)(26005)(336012)(2351001)(186003)(478600001)(53416004)(316002)(5660300002)(51416003)(76176011)(7696005)(356004)(16586007)(2906002)(1076003)(6666004)(4326008)(486006)(305945005)(126002)(8936002)(6916009)(476003)(8676002)(50226002)(81166006)(81156014)(2616005)(426003)(446003)(11346002)(70586007)(50466002)(70206006)(47776003)(86362001)(48376002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3432; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42756e5e-adda-45ba-2c4c-08d74e84bf06
X-MS-TrafficTypeDiagnostic: BYAPR12MB3432:
X-Microsoft-Antispam-PRVS: <BYAPR12MB343272F34E87CF5B904FFE67F9970@BYAPR12MB3432.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:972;
X-Forefront-PRVS: 0187F3EA14
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2qWkUT3o7vB1gXH2Ber2+Q4M5s7Cmp4MVqdY2+7CJpl4pPqoadAo/Iofe+AWhJRjhemxrpu0DtRyHkyw9z2FtC0OFK+zkJasb7/Tzl4x3EVSxw2FaNVBZcb28uDP431nw/NWltabk0ExlWrHxUynFiufGvdEOXMteyvHpgo4FzS+epTKbu5K4I09ojwLccoCyMB92/bf+hrtP31PZu1fWJRqjoQKsQELZkamYGZ5Ixvbc/yf1kF4pRMqmzWwIqg0S7EB5gIZ3fcEm4AXAMTXEy8LFrWuA4w2i4qCYhOYyU1x+GLf4SB2dPiEqIVGuhrQcm6r8zIdpRd8bsLZ7fwy7A/Jp3mDlz6RMSjBvJgtDDgqO6kRwO12ZoRb7aGCakcPCKY7pDHwVl7Vwy6LJrp28QUmEMs6r5czuM4KcuzdH38=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 19:53:54.2085 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42756e5e-adda-45ba-2c4c-08d74e84bf06
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3432
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BcCMFi3X9CTzRq5kTdR/ZHj4yxTWHNv8nexiMA3ztYk=;
 b=pH/TsyoIF7hRzDD4IozP51Yj8H9OeejPGmO3NCA1SUhpvLJgka+F3xB6Wx0AWo44vp1dGb692e3JCX23F+N1qFvsK27SCZwLbAmGhUzvWmBvkNtMZvJzynFhGjlzt9GYzoRjzcxsl6ZNzB26qFg2cQRu6Ob0Pl29yuhCwQutH4c=
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
Cc: Michael Strauss <michael.strauss@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTWljaGFlbCBTdHJhdXNzIDxtaWNoYWVsLnN0cmF1c3NAYW1kLmNvbT4KCltXSFldCmRw
cmVmY2xrIGlzIGltcHJvcGVybHkgcmVhZCBkdWUgdG8gaW5jb3JyZWN0IHVuaXRzIHVzZWQuCkNh
dXNlcyBhbiBhdWRpbyBjbG9jayB0byBiZSBpbXByb3Blcmx5IHNldCwgbWFraW5nIGF1ZGlvCm5v
bi1mdW5jdGlvbmFsIGFuZCB2aWRlb3MgcGxheSBiYWNrIHRvbyBmYXN0CgpbSE9XXQpTY2FsZSBk
cHJlZmNsayB2YWx1ZSBmcm9tIE1IeiB0byBLSHogKG11bHRpcGx5IGJ5IDEwMDApCnRvIGVuc3Vy
ZSB0aGF0IGRwcmVmY2xrX2toeiBpcyBpbiBjb3JyZWN0IHVuaXRzCgpTaWduZWQtb2ZmLWJ5OiBN
aWNoYWVsIFN0cmF1c3MgPG1pY2hhZWwuc3RyYXVzc0BhbWQuY29tPgpBY2tlZC1ieTogQmhhd2Fu
cHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+Ci0tLQogLi4uL2RybS9hbWQv
ZGlzcGxheS9kYy9jbGtfbWdyL2RjbjIxL3JuX2Nsa19tZ3IuYyB8IDE1ICsrKysrKystLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2xrX21nci9kY24yMS9ybl9j
bGtfbWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2xrX21nci9kY24yMS9y
bl9jbGtfbWdyLmMKaW5kZXggOTNlNDZlMzc2YmIxLi5mYjhhYTk0MzZiZjAgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2RjbjIxL3JuX2Nsa19tZ3Iu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2xrX21nci9kY24yMS9ybl9j
bGtfbWdyLmMKQEAgLTM3Nyw3ICszNzcsNyBAQCB2b2lkIHJuX2dldF9jbGtfc3RhdGVzKHN0cnVj
dCBjbGtfbWdyICpjbGtfbWdyX2Jhc2UsIHN0cnVjdCBjbGtfc3RhdGVzICpzKQogCiAJcm5fZHVt
cF9jbGtfcmVnaXN0ZXJzKCZzYiwgY2xrX21ncl9iYXNlLCAmbG9nX2luZm8pOwogCi0Jcy0+ZHBy
ZWZjbGtfa2h6ID0gc2IuZHByZWZjbGs7CisJcy0+ZHByZWZjbGtfa2h6ID0gc2IuZHByZWZjbGsg
KiAxMDAwOwogfQogCiB2b2lkIHJuX2VuYWJsZV9wbWVfd2Eoc3RydWN0IGNsa19tZ3IgKmNsa19t
Z3JfYmFzZSkKQEAgLTYzMywxNiArNjMzLDE1IEBAIHZvaWQgcm5fY2xrX21ncl9jb25zdHJ1Y3Qo
CiAJCQljbGtfbWdyLT5kZW50aXN0X3Zjb19mcmVxX2toeiA9IDM2MDAwMDA7CiAKIAkJcm5fZHVt
cF9jbGtfcmVnaXN0ZXJzKCZzLCAmY2xrX21nci0+YmFzZSwgJmxvZ19pbmZvKTsKLQkJY2xrX21n
ci0+YmFzZS5kcHJlZmNsa19raHogPSBzLmRwcmVmY2xrOwotCi0JCWlmIChjbGtfbWdyLT5iYXNl
LmRwcmVmY2xrX2toeiAhPSA2MDAwMDApIHsKLQkJCWNsa19tZ3ItPmJhc2UuZHByZWZjbGtfa2h6
ID0gNjAwMDAwOwotCQkJQVNTRVJUKDEpOyAvL1RPRE86IFJlbm9pciBmb2xsb3cgdXAuCi0JCX0K
KwkJLyogQ29udmVydCBkcHJlZmNsayB1bml0cyBmcm9tIE1IeiB0byBLSHogKi8KKwkJLyogVmFs
dWUgYWxyZWFkeSBkaXZpZGVkIGJ5IDEwLCBzb21lIHJlc29sdXRpb24gbG9zdCAqLworCQljbGtf
bWdyLT5iYXNlLmRwcmVmY2xrX2toeiA9IHMuZHByZWZjbGsgKiAxMDAwOwogCiAJCS8qIGluIGNh
c2Ugd2UgZG9uJ3QgZ2V0IGEgdmFsdWUgZnJvbSB0aGUgcmVnaXN0ZXIsIHVzZSBkZWZhdWx0ICov
Ci0JCWlmIChjbGtfbWdyLT5iYXNlLmRwcmVmY2xrX2toeiA9PSAwKQorCQlpZiAoY2xrX21nci0+
YmFzZS5kcHJlZmNsa19raHogPT0gMCkgeworCQkJQVNTRVJUKGNsa19tZ3ItPmJhc2UuZHByZWZj
bGtfa2h6ID09IDYwMDAwMCk7CiAJCQljbGtfbWdyLT5iYXNlLmRwcmVmY2xrX2toeiA9IDYwMDAw
MDsKKwkJfQogCX0KIAogCWRjZV9jbG9ja19yZWFkX3NzX2luZm8oY2xrX21ncik7Ci0tIAoyLjE3
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
