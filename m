Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3795169DD5
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:22:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F9F89D2E;
	Mon, 15 Jul 2019 21:22:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740048.outbound.protection.outlook.com [40.107.74.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E736389CB5
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WO4AMcb+mZWLw4EnjAW/nF5v5cfl9Nk3JxCQQQFcEDphosylbn4433UKuNxCDsdrKK7LVxs6RwmJodrBoG0GtJwqnCykN0iLJLisFt2RXfHoRBWNZ7ODq1F2oMVyQbBOuCNUwsL5FMHYgqRjD0jCw6uXkfXHFHEwLAlf+PqTqwDZMJ8tBHMVZvtMcf5sjN0Qjo8WUI4h1hfJRVqTTqAjFFkFZEdMBdGD2A69odrJvWrFf+JYPTTJUcDZbTlD+xSHYe3DaNBGoPAcy+11F7I7EpxG6tat1ZXSMrdPwRFSbSZFW5IJ4P1wVPKoie8N1ehO9nq+bdX+LgC2+6cXlAIttw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ItAlyeOLWjz5mg3jE1n6XX4UTA307lDIBTIpZUkbYEI=;
 b=hbon8qO+37wJ/dcajI1M6RgtSY3Vz6W9dgrESBBQ4K21GBNV89T2ZIkwV7kZc2r5meb9YMQzI1Zuqzz4+yycrVJ1A0sI7R7nu5POw9RlwQ9UPSx5Azox75LkrWxChey8azriaTpgEXByZms4WZ7r1NQtTEnxY6hRd7bGQM6gRojhtN7YFvLvuBetBxiUTfcdYexL+xYzDo2JF7vBYvhD/OHu80EuSGBTEw2m6YYTIuhlgvefMXsX5IuyG7m+c8Wqc9FVu7qWmxhWRF8CNc71DtmCWpeLMjNSG/qxFhiHefuYhlv9gQdoEWa9ZcHij/K6o+7UHbmmjzRq9J243PcCxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM3PR12CA0112.namprd12.prod.outlook.com (2603:10b6:0:55::32) by
 MWHPR12MB1935.namprd12.prod.outlook.com (2603:10b6:300:113::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Mon, 15 Jul
 2019 21:21:49 +0000
Received: from CO1NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by DM3PR12CA0112.outlook.office365.com
 (2603:10b6:0:55::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.14 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:49 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT048.mail.protection.outlook.com (10.152.81.49) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:48 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:31 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 55/87] drm/amd/display: Add MPC 3DLUT resource management
Date: Mon, 15 Jul 2019 17:20:17 -0400
Message-ID: <20190715212049.4584-56-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(136003)(346002)(396003)(2980300002)(428003)(199004)(189003)(126002)(2870700001)(2876002)(2616005)(476003)(70586007)(4326008)(70206006)(48376002)(486006)(53936002)(426003)(2906002)(11346002)(8676002)(50466002)(36756003)(81166006)(446003)(81156014)(68736007)(186003)(49486002)(6916009)(305945005)(54906003)(86362001)(316002)(478600001)(26005)(8936002)(356004)(336012)(76176011)(51416003)(1076003)(47776003)(6666004)(2351001)(5660300002)(14444005)(50226002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1935; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce7015e2-1c9d-48b0-a3f8-08d7096a728d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1935; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1935:
X-Microsoft-Antispam-PRVS: <MWHPR12MB193563E1022EE317466AB84582CF0@MWHPR12MB1935.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: mvNQwjK/mZJf3JJc0a4U41Bw5QjAfjaC7Mha8Sr5GOqgXdNWiHw1jLhZcNTp/HznRP5kRWTGORVyGbyVOBNy5aPbxoAc+eX3NkBv6XBzKRQ4YqO/EQx8WyAT1cmZ9ZcHIXM+bkmji/1ZRd8nGlb+zR5IJpmfQ+naWMK+2Q18A+CvGUDaw9kVxI+y0JizTbkaw8s+JQ0xm/xxlbNnKIdskfyc4iBCRVKfNLcbTZwrsYBuk/S6uYT1X0G1s/v8SawCByg/OVBTPQNUmhAMcM+yElEVGGxM5MsGcsug96soh8u5TvAY7FG0/hfeHoTnnv8O+7H4pujdM//b4gQ5Q2R63Ha/CNcX/mVRx3/s5MKuK3QnZddHXV1RbUatrkepn3QPNgG9stMEUi3ZYnafa2oLOhIbeXJtR57UNjmH03juguA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:48.7411 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce7015e2-1c9d-48b0-a3f8-08d7096a728d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1935
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ItAlyeOLWjz5mg3jE1n6XX4UTA307lDIBTIpZUkbYEI=;
 b=WKlREEgGCPaezI9oqvy7mv0mI6zgVea7AyJNQqsr0h/5rLCWIK9wjDZg/m/xeCjUPQYUFTf4MAx9F8ziaZlvC7Ag+dFPUBbrzWMtcC7jr/IaOL9QpUFFdfK+JWUDEwA7AIrj8Pf1VRFogrvTVo0/j9yr44/5Lcl8Uu/goMS6pTw=
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
 Vitaly Prosyak <vitaly.prosyak@amd.com>, Gary Kattan <Gary.Kattan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogVml0YWx5IFByb3N5YWsgPHZpdGFseS5wcm9zeWFrQGFtZC5jb20+CgpbV2h5ICYgSG93
XQpOdW1iZXIgb2YgM0RMVVQncyBpbiBNUEMgYXJlIG5vdCBlcXVhbCB0byBudW1iZXIgb2YgcGlw
ZXMuClJlc291cmNlIG1hbmFnZW1lbnQgaXMgcmVxdWlyZWQuCkFjdGl2YXRlIG9uIEZQR0EgZW50
aXJlIHRtIHNvbHV0aW9uICB3aGljaCBpbmNsdWRlcwp0aGUgZm9sbG93aW5nIDpoZHIgbXVsdGlw
bGllciwgc2hhcGVyLCAzZGx1dC4KClNpZ25lZC1vZmYtYnk6IFZpdGFseSBQcm9zeWFrIDx2aXRh
bHkucHJvc3lha0BhbWQuY29tPgpSZXZpZXdlZC1ieTogQ2hhcmxlbmUgTGl1IDxDaGFybGVuZS5M
aXVAYW1kLmNvbT4KQWNrZWQtYnk6IEdhcnkgS2F0dGFuIDxHYXJ5LkthdHRhbkBhbWQuY29tPgpB
Y2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfc3VyZmFjZS5jIHwgIDMgKy0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGMuaCAgICAgICAgICAgICAgfCAxNiArKysrKysrKysrKysrKyst
CiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jICAgfCAgNCAr
Ky0tCiAzIGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfc3VyZmFj
ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfc3VyZmFjZS5jCmlu
ZGV4IDM5NGE4Nzk4MTYxNC4uOTE4NGY4NzdmNTM3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19zdXJmYWNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfc3VyZmFjZS5jCkBAIC01OCw3ICs1OCw2IEBAIHN0YXRp
YyB2b2lkIGNvbnN0cnVjdChzdHJ1Y3QgZGNfY29udGV4dCAqY3R4LCBzdHJ1Y3QgZGNfcGxhbmVf
c3RhdGUgKnBsYW5lX3N0YXRlCiAJcGxhbmVfc3RhdGUtPmx1dDNkX2Z1bmMgPSBkY19jcmVhdGVf
M2RsdXRfZnVuYygpOwogCWlmIChwbGFuZV9zdGF0ZS0+bHV0M2RfZnVuYyAhPSBOVUxMKSB7CiAJ
CXBsYW5lX3N0YXRlLT5sdXQzZF9mdW5jLT5jdHggPSBjdHg7Ci0JCXBsYW5lX3N0YXRlLT5sdXQz
ZF9mdW5jLT5pbml0aWFsaXplZCA9IGZhbHNlOwogCX0KIAlwbGFuZV9zdGF0ZS0+YmxlbmRfdGYg
PSBkY19jcmVhdGVfdHJhbnNmZXJfZnVuYygpOwogCWlmIChwbGFuZV9zdGF0ZS0+YmxlbmRfdGYg
IT0gTlVMTCkgewpAQCAtMjc3LDcgKzI3Niw3IEBAIHN0cnVjdCBkY18zZGx1dCAqZGNfY3JlYXRl
XzNkbHV0X2Z1bmModm9pZCkKIAkJZ290byBhbGxvY19mYWlsOwogCiAJa3JlZl9pbml0KCZsdXQt
PnJlZmNvdW50KTsKLQlsdXQtPmluaXRpYWxpemVkID0gZmFsc2U7CisJbHV0LT5zdGF0ZS5yYXcg
PSAwOwogCiAJcmV0dXJuIGx1dDsKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaAppbmRl
eCA3ODZmNjFlYjM4MWQuLjQyMTkzMmFjM2IyNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjLmgKQEAgLTYxNiwxMiArNjE2LDI2IEBAIHN0cnVjdCBkY190cmFuc2Zlcl9mdW5jIHsKIAog
I2lmIGRlZmluZWQoQ09ORklHX0RSTV9BTURfRENfRENOMl8wKQogCit1bmlvbiBkY18zZGx1dF9z
dGF0ZSB7CisJc3RydWN0IHsKKwkJdWludDMyX3QgaW5pdGlhbGl6ZWQ6MTsJCS8qaWYgM2RsdXQg
aXMgd2VudCB0aHJvdWdoIGNvbG9yIG1vZHVsZSBmb3IgaW5pdGlhbGl6YXRpb24gKi8KKwkJdWlu
dDMyX3Qgcm11X2lkeF92YWxpZDoxOwkvKmlmIG11eCBzZXR0aW5ncyBhcmUgdmFsaWQqLworCQl1
aW50MzJfdCBybXVfbXV4X251bTozOwkJLyppbmRleCBvZiBtdXggdG8gdXNlKi8KKwkJdWludDMy
X3QgbXBjX3JtdTBfbXV4OjQ7CS8qc2VsZWN0IG1wY2Mgb24gbXV4LCBvbmUgb2YgdGhlIGZvbGxv
d2luZyA6IG1wY2MwLCBtcGNjMSwgbXBjYzIsIG1wY2MzKi8KKwkJdWludDMyX3QgbXBjX3JtdTFf
bXV4OjQ7CisJCXVpbnQzMl90IG1wY19ybXUyX211eDo0OworCQl1aW50MzJfdCByZXNlcnZlZDox
NTsKKwl9IGJpdHM7CisJdWludDMyX3QgcmF3OworfTsKKwogCiBzdHJ1Y3QgZGNfM2RsdXQgewog
CXN0cnVjdCBrcmVmIHJlZmNvdW50OwogCXN0cnVjdCB0ZXRyYWhlZHJhbF9wYXJhbXMgbHV0XzNk
OwogCXVpbnQzMl90IGhkcl9tdWx0aXBsaWVyOwotCWJvb2wgaW5pdGlhbGl6ZWQ7CisJYm9vbCBp
bml0aWFsaXplZDsgLypyZW1vdmUgYWZ0ZXIgZGlhZyBmaXgqLworCXVuaW9uIGRjXzNkbHV0X3N0
YXRlIHN0YXRlOwogCXN0cnVjdCBkY19jb250ZXh0ICpjdHg7CiB9OwogI2VuZGlmCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jCmluZGV4
IDljMGE3ODhmYmIxOC4uMmFlZTY2M2YxMzQ0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYwpAQCAtOTI3LDE0ICs5MjcsMTQgQEAg
c3RhdGljIGJvb2wgZGNuMjBfc2V0X3NoYXBlcl8zZGx1dCgKIAogCXJlc3VsdCA9IGRwcF9iYXNl
LT5mdW5jcy0+ZHBwX3Byb2dyYW1fc2hhcGVyX2x1dChkcHBfYmFzZSwgc2hhcGVyX2x1dCk7CiAJ
aWYgKHBsYW5lX3N0YXRlLT5sdXQzZF9mdW5jICYmCi0JCXBsYW5lX3N0YXRlLT5sdXQzZF9mdW5j
LT5pbml0aWFsaXplZCA9PSB0cnVlKQorCQlwbGFuZV9zdGF0ZS0+bHV0M2RfZnVuYy0+c3RhdGUu
Yml0cy5pbml0aWFsaXplZCA9PSAxKQogCQlyZXN1bHQgPSBkcHBfYmFzZS0+ZnVuY3MtPmRwcF9w
cm9ncmFtXzNkbHV0KGRwcF9iYXNlLAogCQkJCQkJCQkmcGxhbmVfc3RhdGUtPmx1dDNkX2Z1bmMt
Pmx1dF8zZCk7CiAJZWxzZQogCQlyZXN1bHQgPSBkcHBfYmFzZS0+ZnVuY3MtPmRwcF9wcm9ncmFt
XzNkbHV0KGRwcF9iYXNlLCBOVUxMKTsKIAogCWlmIChwbGFuZV9zdGF0ZS0+bHV0M2RfZnVuYyAm
JgotCQlwbGFuZV9zdGF0ZS0+bHV0M2RfZnVuYy0+aW5pdGlhbGl6ZWQgPT0gdHJ1ZSAmJgorCQlw
bGFuZV9zdGF0ZS0+bHV0M2RfZnVuYy0+c3RhdGUuYml0cy5pbml0aWFsaXplZCA9PSAxICYmCiAJ
CXBsYW5lX3N0YXRlLT5sdXQzZF9mdW5jLT5oZHJfbXVsdGlwbGllciAhPSAwKQogCQlkcHBfYmFz
ZS0+ZnVuY3MtPmRwcF9zZXRfaGRyX211bHRpcGxpZXIoZHBwX2Jhc2UsCiAJCQkJcGxhbmVfc3Rh
dGUtPmx1dDNkX2Z1bmMtPmhkcl9tdWx0aXBsaWVyKTsKLS0gCjIuMjIuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
