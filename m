Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF8BCA0B4
	for <lists+amd-gfx@lfdr.de>; Thu,  3 Oct 2019 16:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0019F89FA5;
	Thu,  3 Oct 2019 14:55:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820040.outbound.protection.outlook.com [40.107.82.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F6A89F4A
 for <amd-gfx@lists.freedesktop.org>; Thu,  3 Oct 2019 14:55:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ScssCQh9892RJfYZzOmcY3EstQs43h/cHMoUGAVZVc3CLNEcYqjmufk8M+/tnuZeVw12GTD4jZuCw0UdutVOvnoz5PmM835snO2uaAn7IYAP+y0zaww0nxrU8gH86DcSnvhyyh3q6uFUIbR4aGQUnycYdlnKkxO6g7txXFJ4PmaaehysdGsuLE4/fDuy08Xp4Zw9gNtgVnlFyYKyBsxykrbw4tKpxXkeHiwtZPeSxmr1bn7h/lvVP3BGP/mvuKcgf3JgJpIzGG9/KzAGs05yjSSYWWwCdRMXR0e3sQ9knH4u2+BUdLZzuPQO2G4Hx8dp/vW7RP01h6O0Y4QE+VlyMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3EGRHAaIYi5lbh4EY5+p9A2Md3pf+pm/r59VmYu6fU=;
 b=EEr1/BmhSyOCAm5ffeGx+MU3io1P4YtYAr4BScEXc2nr85LSJu7V9W0hR2t22AWJKtDT1L1+Mf+XPejFYf+rbf1QLr0lEmfMXnwpWypBlbhFX42vsIqP/wCyv226fFwRTpQrDF8wsmxgWipnQwIX3zqaPLoJRkkbA3YOGTR2q1Y4tzdFNQWL9T2hXeG5IxtFyHc8C/veNRFedKAwDiUceeXVwwCS5B44zz0eDVDgUyxC50YhbG66Q/GgG9jEDVBpka9P98x0P2l8a86KtuiSEZUnSaNmvsg3Ch4ZW7o3rjG9wnCdeTVRqPx/YTwYWawc3eAAF/cYD5NSf5rMwrukBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0024.namprd12.prod.outlook.com (2603:10b6:610:57::34)
 by CY4PR12MB1784.namprd12.prod.outlook.com (2603:10b6:903:11e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Thu, 3 Oct
 2019 14:55:04 +0000
Received: from BY2NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by CH2PR12CA0024.outlook.office365.com
 (2603:10b6:610:57::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.17 via Frontend
 Transport; Thu, 3 Oct 2019 14:55:04 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT048.mail.protection.outlook.com (10.152.85.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Thu, 3 Oct 2019 14:55:03 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 3 Oct 2019
 09:55:00 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <harry.wentland@amd.com>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 11/11] drm/amd/display: fix events handling for hdcp
Date: Thu, 3 Oct 2019 10:54:41 -0400
Message-ID: <20191003145441.28952-12-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191003145441.28952-1-Bhawanpreet.Lakha@amd.com>
References: <20191003145441.28952-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(346002)(396003)(376002)(428003)(199004)(189003)(4326008)(48376002)(1076003)(305945005)(2906002)(8676002)(81166006)(81156014)(7696005)(110136005)(486006)(26005)(51416003)(76176011)(356004)(478600001)(6666004)(86362001)(11346002)(2616005)(446003)(126002)(186003)(336012)(476003)(426003)(16586007)(5660300002)(50466002)(316002)(53416004)(14444005)(36756003)(47776003)(50226002)(70586007)(8936002)(70206006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1784; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f223a1a2-b547-4b36-ac29-08d74811ac5b
X-MS-TrafficTypeDiagnostic: CY4PR12MB1784:
X-Microsoft-Antispam-PRVS: <CY4PR12MB17846428EBE08E59CD65F27EF99F0@CY4PR12MB1784.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-Forefront-PRVS: 01792087B6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M+XHlZj8OKewOkfYI4Vjg6Hfx05JFft4Dc2X9svawXUb2YlMlIaT5NpNa7PLN6QCfVDdc675qRfXsXDZDHgNI3VMuY7MJrKrfPGfWYyjk3ao8esWZmf3Aza3xSaMpKkTlc4JlouoZTmxPG8mFhuA8cmF/RnK2kJMUxnqGx4xvfWYAJu/2znbOFDXHpY0jIOcLhukvx8i2LcJ991VbQLBefEypbIq/75CVtKznGbq2HW+COffjc/8soS5vz63ORe92yhxRD+jp8xj4k9gmkkZyaLG03Z2pPbXevYO7g8n4N6AieYu1XJTFrBziOjnxL7E2HLmJ9Ah+mJPkVEVfoGb6tnbiMUZWKWh9pl+P7Q9sdyoHaDiEUS1GE+estPSyplc5ZXoB1GN+5uxpmx5+MS7dCm83qw9B4pX9sijjob8uzI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2019 14:55:03.8056 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f223a1a2-b547-4b36-ac29-08d74811ac5b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1784
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3EGRHAaIYi5lbh4EY5+p9A2Md3pf+pm/r59VmYu6fU=;
 b=kvM42Zk7sIqOviAIsKIsT5lUjf48IzrooEbLfaJ5EbFq7FhSVV/vX7tIIUDP70rLFq3bKITzwv3+gYmBhST1Xy0EbWFyXv0iRQa+n20IrIxUwoHP0GYov1XdhVG8QkIz4a6lc2J8NyfxbiLEszVhDS/Ghj4z01rsDvvd8aCFCzU=
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KV2hlbiB3ZSBleGVjdXRlIGEgZXZlbnQsIHBlbmRpbmcgZXZlbnRzIHNob3VsZCBiZSBj
YW5jZWxlZC4gVGhpcyBsZWFkcwp0byBjYXNlcyB3aGVyZSB3ZSBleGVjdXRlIHRoZSBzYW1lIGV2
ZW50IHR3aWNlLGlmIHRoZSBuZXcgZXZlbnQgaXMKc2NoZWR1bGVkIHRvIHJ1biBiZWZvcmUgdGhl
IG9sZCBldmVudC4KCkFsc28gd2F0Y2hkb2cgZXZlbnQgd2FzIGJlaW5nIGNhbmNlbGVkIGluc2lk
ZSBjYWxsYmFjayBldmVudC4gVGhpcyBpcwppbmNvcnJlY3QuCgpbSG93XQpDYW5jZWwgcGVuZGlu
ZyBldmVudHMgYmVmb3JlIGV4ZWN1dGluZyB0aGUgY3VycmVudCBhbmQgZml4IHdhdGNoZG9nCmV2
ZW50IGJlaW5nIGNhbmNlbGVkIGJ5IGNhbGxiYWNrIGV2ZW50CgpDaGFuZ2UtSWQ6IEkzYzU5NTkw
MWQ2M2YzMzkzYzgzZDg5OGNkYjJkN2RmYzFhNzY5MTQyClNpZ25lZC1vZmYtYnk6IEJoYXdhbnBy
ZWV0IExha2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hkY3AuYyB8IDQgKysrLQogMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hkY3AuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hkY3AuYwppbmRl
eCA2MDM5MDk0MTYzOTguLjcxNWY2NTA3MTViMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGRjcC5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hkY3AuYwpAQCAtMTY5LDcgKzE2
OSw3IEBAIHN0YXRpYyB2b2lkIGV2ZW50X2NhbGxiYWNrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29y
aykKIAogCW11dGV4X2xvY2soJmhkY3Bfd29yay0+bXV0ZXgpOwogCi0JY2FuY2VsX2RlbGF5ZWRf
d29yaygmaGRjcF93b3JrLT53YXRjaGRvZ190aW1lcl9kd29yayk7CisJY2FuY2VsX2RlbGF5ZWRf
d29yaygmaGRjcF93b3JrLT5jYWxsYmFja19kd29yayk7CiAKIAltb2RfaGRjcF9wcm9jZXNzX2V2
ZW50KCZoZGNwX3dvcmstPmhkY3AsIE1PRF9IRENQX0VWRU5UX0NBTExCQUNLLAogCQkJICAgICAg
ICZoZGNwX3dvcmstPm91dHB1dCk7CkBAIC0yNDcsNiArMjQ3LDggQEAgc3RhdGljIHZvaWQgZXZl
bnRfd2F0Y2hkb2dfdGltZXIoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQogCiAJbXV0ZXhfbG9j
aygmaGRjcF93b3JrLT5tdXRleCk7CiAKKwljYW5jZWxfZGVsYXllZF93b3JrKCZoZGNwX3dvcmst
PndhdGNoZG9nX3RpbWVyX2R3b3JrKTsKKwogCW1vZF9oZGNwX3Byb2Nlc3NfZXZlbnQoJmhkY3Bf
d29yay0+aGRjcCwKIAkJCSAgICAgICBNT0RfSERDUF9FVkVOVF9XQVRDSERPR19USU1FT1VULAog
CQkJICAgICAgICZoZGNwX3dvcmstPm91dHB1dCk7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
