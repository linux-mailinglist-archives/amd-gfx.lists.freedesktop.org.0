Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 659E6C908E
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 20:16:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C74896E95F;
	Wed,  2 Oct 2019 18:16:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790077.outbound.protection.outlook.com [40.107.79.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D9F6E1A2
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 18:16:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m+RYFeINtasB7agWoWMBd5a1TfPorqCU9BAnDWndzm522rnySdwectl8nLNffbteWevx/FplNdEJUHvMQY+LOY35bVN33nFS5QU3Q1mxbWJzy6illjFF6QkEZNXxfJ+5pb29u1kS1rzsd5RMATwPapBDiLKt4hJjDRrpv8m3AUPRsK9VPy+gZnaMsNTbQ1dCRFiBdf3NU7+L90eCUaMsCBqhdX72SfEqk54lSe55CTNwdOK8wadkAGMqhhbem8CuFkuVVDXMmWf7MXep8xSrQmkX3vX2b4O7JUCmPVWIefpgzFJ8ziXlUOrEk7lWJacf4XeuDsaYhcAZqeUvUU5+gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gXxKGbTN3eBNShgnV+wHuPvYFG8iJ0R0jRlis8I5xQQ=;
 b=ExLvs+sedwMTr5oY1SvFel+bcV0ZQNtF10GMsQBHZozJji6Q86IxDSqcaSyZ4LzBUjjmVuIunDNxk8U9TrwSsOcuXgbCuErfVHW17z04FMQyGqnXSYpPhdzEciw4YES5aIJ/nOzfCfG2/GyZyeZghcb1n72xqJPqNe1LXPOJxjKduMQUa/W7jgyoZoIjED6bnbH7PwcogPzxkYudBDWvwGucK2vXnzKG6AcUkePJY/YTJF6xEZWIH2avnKRBu00AoQVZY5+F15ih9nS5xfFca/jsiE89uoJF373hHLQoKtFHVo7js7aBvGVrC3I9Pj0a46GEKz4h9dpoBvy1i3oTCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0121.namprd12.prod.outlook.com (2603:10b6:0:51::17) by
 DM5PR12MB1258.namprd12.prod.outlook.com (2603:10b6:3:79::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 18:16:45 +0000
Received: from DM3NAM03FT053.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::207) by DM3PR12CA0121.outlook.office365.com
 (2603:10b6:0:51::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20 via Frontend
 Transport; Wed, 2 Oct 2019 18:16:45 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT053.mail.protection.outlook.com (10.152.83.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 2 Oct 2019 18:16:45 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 2 Oct 2019
 13:16:44 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 25/38] drm/amd/display: add guard for SMU ver, for 48mhz clk
Date: Wed, 2 Oct 2019 14:16:20 -0400
Message-ID: <20191002181633.22805-26-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
References: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(376002)(396003)(428003)(199004)(189003)(6666004)(70206006)(305945005)(50466002)(4326008)(76176011)(36756003)(316002)(86362001)(51416003)(6916009)(48376002)(81156014)(8936002)(81166006)(8676002)(50226002)(356004)(47776003)(2906002)(16586007)(7696005)(70586007)(5660300002)(53416004)(2351001)(478600001)(14444005)(446003)(11346002)(126002)(476003)(2616005)(486006)(426003)(336012)(26005)(186003)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1258; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3812af18-21b4-455a-6029-08d74764af31
X-MS-TrafficTypeDiagnostic: DM5PR12MB1258:
X-Microsoft-Antispam-PRVS: <DM5PR12MB12589FE99E2575CC98C38A52F99C0@DM5PR12MB1258.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-Forefront-PRVS: 0178184651
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0/K4JMw2mBVetijepdX6xyTP0kUHF/XFBKAdvsjR32oarcDyPoT8iHZFUz91PlrocrDGLe89HwbvaEFtYh+FOs9PtJyHuF7EoucheenO+gyhFCrJXTfKrOgFyA79Gm5GSQLjBDrYM3oSv6wF+2rXXsKOHqQjXWX4OsuJJM422DWvluwWx3MCkRuXRvN53OIXvFHUnT8djCAYWpjVSUpvLlWoX+yLdpI6+OvMXj4anz1REX0B+ywXentgwTyMQqpzVhHPTT/3I78xQLsQLPS5OppL2PG3eLDGM8pbp06OF5LQu4IV9d3cA1EfFFilxrw75/S4QJ30svGsCFMTg6MOqHjb/C50d9mWY5awJn5ks+/XS3Gv+Osw05El/CBva2FTrJDHB+rFZ69fN/mT0eIXyr2AfNfNx1YJJbF27DHAJOs=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2019 18:16:45.6784 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3812af18-21b4-455a-6029-08d74764af31
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1258
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gXxKGbTN3eBNShgnV+wHuPvYFG8iJ0R0jRlis8I5xQQ=;
 b=jm6ru4gwQqVfqGTvOdmXfJkYvwZ1uARYDbygFq22oAzI+6cRrpx7cptcCi1/LN9yAnOnMfoUIDu1BJOTq0QR98prJbeC66Le7RTX4eeSBUGOPpDtE3Yx3ZFCMNWrxlAjJjymGyFY4RWr7ViNzlGV7sbMCWhNYWq9EgRhWGbKk1E=
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
Cc: Joseph Gravenor <joseph.gravenor@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSm9zZXBoIEdyYXZlbm9yIDxqb3NlcGguZ3JhdmVub3JAYW1kLmNvbT4KClt3aHldCmRw
XzQ4bV9yZWZjbGtfZHJpdmVyX3B3ZG4gaXMgcGVyc2lzdGVudCB0aHJvdWdoIFMzIGFuZCBTNS4K
VGhpcyB3YXMgd29ya2VkIGFycm91bmQgaW4gU01VIEZXIDU1LjIxLjAuIEVhcmxpZXIgRlcgZG9u
J3QgaGF2ZSB0aGlzIGZpeApzbyB3ZSB3aWxsIGhhbmcgb24gcmVib290CgpbaG93XQphZGQgYSBn
dWFyZCBmb3Igc211IHZlcnNpb25zIGJlZm9yZSBTTVUgRlcgNTUuMjEuMAoKQ2hhbmdlLUlkOiBJ
MjZiMWE3ZjkwMjE4YjRmZDAxNmVmMjQyZjA5ZmFhNTkwMGNiZWM1NQpTaWduZWQtb2ZmLWJ5OiBK
b3NlcGggR3JhdmVub3IgPGpvc2VwaC5ncmF2ZW5vckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2RjbjIxL3JuX2Nsa19tZ3IuYyB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2RjbjIxL3JuX2Nsa19tZ3Iu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2RjbjIxL3JuX2Nsa19t
Z3IuYwppbmRleCBhMmE0YzdkZGM4NTYuLjY4ZDM4MjM5MzA0YyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjEvcm5fY2xrX21nci5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2RjbjIxL3JuX2Nsa19tZ3Iu
YwpAQCAtNjQ5LDcgKzY0OSw3IEBAIHZvaWQgcm5fY2xrX21ncl9jb25zdHJ1Y3QoCiAJCQlwcF9z
bXUtPnJuX2Z1bmNzLnNldF93bV9yYW5nZXMoJnBwX3NtdS0+cm5fZnVuY3MucHBfc211LCAmcmFu
Z2VzKTsKIAl9CiAKLQlpZiAoIUlTX0ZQR0FfTUFYSU1VU19EQyhjdHgtPmRjZV9lbnZpcm9ubWVu
dCkpIHsKKwlpZiAoIUlTX0ZQR0FfTUFYSU1VU19EQyhjdHgtPmRjZV9lbnZpcm9ubWVudCkgJiYg
Y2xrX21nci0+c211X3ZlciA+PSAweDAwMzcxNTAwKSB7CiAJCS8qIGVuYWJsZSBwb3dlcmZlYXR1
cmVzIHdoZW4gZGlzcGxheWNvdW50IGdvZXMgdG8gMCAqLwogCQlybl92Ymlvc19zbXVfZW5hYmxl
XzQ4bWh6X3RtZHBfcmVmY2xrX3B3cmR3bihjbGtfbWdyLCAhZGVidWctPmRpc2FibGVfNDhtaHpf
cHdyZHduKTsKIAl9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
