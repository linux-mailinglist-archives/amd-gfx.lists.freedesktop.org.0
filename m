Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9677BD1A91
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 23:06:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F516EA60;
	Wed,  9 Oct 2019 21:06:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on0629.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B3DB6EA60
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2019 21:06:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O2JDt3u/40VVbDcyttUw2bbgof7EaG9HCQssfRF0wMxpeDYJ3nX/6TicBOkkwHz2cotj8CXjsEaTN+JYpahN3O6ADsOyb3OI6+XuJ53Q2FFQLzNhGMCjGa0GA20ptvGIm2QoY8qMYzTD3P4LY2XmIg/OoRje5FNs1GDyYQqfpblm9QKHYt9fqWKwQ1lGrz2+jkSks/nyl1zbPGPm0dzkFCgXMrxQZyMY9w6VO6tHe+d97DRBZxeeB+ndnoevIaJpMVztRBsfFwrTX/9Xflffx1NcVgzmRhDN+n5uGaCBsy5fjl43IMult6uenO1++HScfhC9r/GOcUxr0KtKLrQSkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcIu417toHD4Zbn8IuUGzkxQtqg0pDPIxiJrEcQP4vQ=;
 b=ZUesjAf4fI/NNzdpwJZCRav8wMI3J9RztHedCAEQQ5Cx6Eu8xxAFu+9jE1hI5LSprvgQW7QNLhTG3m8OErRAfthSINgu6IbZqOnfSDf+wI6zGBtFZKNnGgny9ngru7c1KEx9bVd4DW05oEJDbCTSBIodv0mu8VX4Pl3u+n85gwMMXFO7XJ4hAT2yQ/iZSywmoppnDRGqZGFO3zcSG2rYFHFjAEBPD9K7Ti+HVzEFq9DUgBwd9DCc/JUIu73VW4htAWsMTigE5ikvrkgIiWaux0XzWf0f3u7oAZREWdDfmXc51JJwD0PMTO3zVeEeIWYkL5bPK4BUGChwDNvxseaCkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0019.namprd12.prod.outlook.com
 (2603:10b6:301:4a::29) by MN2PR12MB3216.namprd12.prod.outlook.com
 (2603:10b6:208:102::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Wed, 9 Oct
 2019 21:06:27 +0000
Received: from DM3NAM03FT052.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by MWHPR1201CA0019.outlook.office365.com
 (2603:10b6:301:4a::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Wed, 9 Oct 2019 21:06:27 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT052.mail.protection.outlook.com (10.152.83.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 9 Oct 2019 21:06:27 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 9 Oct 2019
 16:06:26 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 16/26] drm/amd/display: update dcn21 hubbub registers
Date: Wed, 9 Oct 2019 17:06:03 -0400
Message-ID: <20191009210613.17929-17-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
References: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(396003)(346002)(428003)(189003)(199004)(478600001)(446003)(81166006)(8676002)(53416004)(6916009)(81156014)(4326008)(70206006)(5660300002)(2906002)(11346002)(26005)(36756003)(426003)(476003)(126002)(186003)(486006)(70586007)(2616005)(48376002)(47776003)(305945005)(16586007)(316002)(54906003)(1076003)(50226002)(336012)(356004)(50466002)(76176011)(6666004)(2351001)(8936002)(86362001)(7696005)(51416003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3216; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b477e01-d259-45e1-22bd-08d74cfc8cc1
X-MS-TrafficTypeDiagnostic: MN2PR12MB3216:
X-Microsoft-Antispam-PRVS: <MN2PR12MB32167722FBEA748A71393211F9950@MN2PR12MB3216.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:345;
X-Forefront-PRVS: 018577E36E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6Zc4AYdymmSQSR1BkzX3G//sbVIDDBDPee1iApdimeC0lnzKDVxFEKkM/TJvshO88Be41yCN50hXpMAIGwsjTq7Tljjq9DFP/d6ToRoYJep+sB9GUi9Hxkf7LMnzgZEd/YlaRjIiwNpghfP0zoxXcBL7F2gZAk9H8AGJEiBkc/j5P7XTfNJojfXiNH4iK+5zuPqWYJ9js1AMJM1hCWsgpzqiAfGjod8Px5IzcVEYzMpThiTc80O3YT4IY65ehitdhjJzQjelNACdQm9viDdqLLUmOrWdaHXufVsXYfcNnqGsYMIUmBHv2I4NxdITsA4HFp9Wnx8SCR2USycaA8Iai2/pmMlNGkPLYby69SLRFehlOCjeAcWogIWXwj5ZLZdgvYqebSMNFU3Lcsu4xR89k5dh4nWK/8ALLtBG0fuzsxM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 21:06:27.2180 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b477e01-d259-45e1-22bd-08d74cfc8cc1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3216
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcIu417toHD4Zbn8IuUGzkxQtqg0pDPIxiJrEcQP4vQ=;
 b=uLtYVSfCHoSoY22BCLNlKH91h5ga3912PwXJ4Av92zEzF+rkuuKFHlkUTmjzMoJKt7vg5cMFA32cfMsy79BnDFAUWIjTClJLuTRMPFml/scacTDbdm0+KaV8g5QVlRA4ncA6eFRwIU9cTfW0bmPRKoxHIlk8BgLbplvNSkfXH44=
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
Cc: sunpeng.li@amd.com, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 harry.wentland@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

dXNlIGRjbjIwIGNvbW1vbiByZWdzIGRlZmluZSB0byBzaGFyZSBzb21lIHJlZ3Mgd2l0aCBkY24y
MAoKU2lnbmVkLW9mZi1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFt
ZC5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfaHViYnVi
LmggfCAxNyArKysrKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjbjIxL2RjbjIxX2h1YmJ1Yi5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjbjIxL2RjbjIxX2h1YmJ1Yi5oCmluZGV4IDY5OGM0NzBjYzBmNi4uYzQ4NDBkZmIxZmE1
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFf
aHViYnViLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIx
X2h1YmJ1Yi5oCkBAIC0zNiw2ICszNiwxMCBAQAogCVNSKERDSFVCQlVCX0FSQl9GUkFDX1VSR19C
V19GTElQX0IpLFwKIAlTUihEQ0hVQkJVQl9BUkJfRlJBQ19VUkdfQldfRkxJUF9DKSxcCiAJU1Io
RENIVUJCVUJfQVJCX0ZSQUNfVVJHX0JXX0ZMSVBfRCksXAorCVNSKERDSFVCQlVCX0FSQl9SRUZD
WUNfUEVSX1RSSVBfVE9fTUVNT1JZX0EpLFwKKwlTUihEQ0hVQkJVQl9BUkJfUkVGQ1lDX1BFUl9U
UklQX1RPX01FTU9SWV9CKSxcCisJU1IoRENIVUJCVUJfQVJCX1JFRkNZQ19QRVJfVFJJUF9UT19N
RU1PUllfQyksXAorCVNSKERDSFVCQlVCX0FSQl9SRUZDWUNfUEVSX1RSSVBfVE9fTUVNT1JZX0Qp
LFwKIAlTUihEQ0hVQkJVQl9BUkJfSE9TVFZNX0NOVEwpLCBcCiAJU1IoRENIVk1fQ1RSTDApLCBc
CiAJU1IoRENIVk1fTUVNX0NUUkwpLCBcCkBAIC00NCwxNiArNDgsOSBAQAogCVNSKERDSFZNX1JJ
T01NVV9TVEFUMCkKIAogI2RlZmluZSBIVUJCVUJfUkVHX0xJU1RfRENOMjEoKVwKLQlIVUJCVUJf
UkVHX0xJU1RfRENOX0NPTU1PTigpLCBcCisJSFVCQlVCX1JFR19MSVNUX0RDTjIwX0NPTU1PTigp
LCBcCiAJSFVCQlVCX1NSX1dBVEVSTUFSS19SRUdfTElTVCgpLCBcCi0JSFVCQlVCX0hWTV9SRUdf
TElTVCgpLCBcCi0JU1IoRENIVUJCVUJfQ1JDX0NUUkwpLCBcCi0JU1IoRENOX1ZNX0ZCX0xPQ0FU
SU9OX0JBU0UpLFwKLQlTUihEQ05fVk1fRkJfTE9DQVRJT05fVE9QKSxcCi0JU1IoRENOX1ZNX0ZC
X09GRlNFVCksXAotCVNSKERDTl9WTV9BR1BfQk9UKSxcCi0JU1IoRENOX1ZNX0FHUF9UT1ApLFwK
LQlTUihEQ05fVk1fQUdQX0JBU0UpCisJSFVCQlVCX0hWTV9SRUdfTElTVCgpCiAKICNkZWZpbmUg
SFVCQlVCX01BU0tfU0hfTElTVF9IVk0obWFza19zaCkgXAogCUhVQkJVQl9TRihEQ0hVQkJVQl9B
UkJfREZfUkVRX09VVFNUQU5ELCBEQ0hVQkJVQl9BUkJfTUlOX1JFUV9PVVRTVEFORF9DT01NSVRf
VEhSRVNIT0xELCBtYXNrX3NoKSwgXApAQCAtMTAyLDcgKzk5LDcgQEAKIAlIVUJCVUJfU0YoRENI
VUJCVUJfQVJCX1JFRkNZQ19QRVJfVFJJUF9UT19NRU1PUllfRCwgRENIVUJCVUJfQVJCX1JFRkNZ
Q19QRVJfVFJJUF9UT19NRU1PUllfRCwgbWFza19zaCkKIAogI2RlZmluZSBIVUJCVUJfTUFTS19T
SF9MSVNUX0RDTjIxKG1hc2tfc2gpXAotCUhVQkJVQl9NQVNLX1NIX0xJU1RfSFZNKG1hc2tfc2gp
LFwKKwlIVUJCVUJfTUFTS19TSF9MSVNUX0hWTShtYXNrX3NoKSwgXAogCUhVQkJVQl9NQVNLX1NI
X0xJU1RfRENOX0NPTU1PTihtYXNrX3NoKSwgXAogCUhVQkJVQl9NQVNLX1NIX0xJU1RfU1RVVFRF
UihtYXNrX3NoKSwgXAogCUhVQkJVQl9TRihEQ0hVQkJVQl9HTE9CQUxfVElNRVJfQ05UTCwgRENI
VUJCVUJfR0xPQkFMX1RJTUVSX1JFRkRJViwgbWFza19zaCksIFwKLS0gCjIuMTcuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
