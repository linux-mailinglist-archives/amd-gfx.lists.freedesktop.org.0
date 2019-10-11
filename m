Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D26A2D48B4
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 21:54:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14FA76EC9E;
	Fri, 11 Oct 2019 19:53:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02on060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe45::60e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B53C06EC97
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 19:53:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NJEWECCok1PZwN4iZUt/GK6qX5D0DEn1tuw4laJe1SGdSwNoAc/0A/00oWc393muL0LkWMI+ZPvCScRtCsaIYEKrQpAvrntEcJFckfAM0U9HRMQXd7k6NAGAU6ids8w3IeROBH8gP8FcWiCnxzWd/o3A+Wp+jpLN06iA/UfpTDiDvkRBIw0ZMKhgzdPfm85WyBlSWFNG4QH2fUuT16uF8cvq2O2dFW+28b9lpwNSZHsph11TCoIUakijjC0R+pEwzJILiPUWkww2Y7drhn8C1DpKn8U+pREBP/rKT66eHfiiDaP4nQmkq3g0/AJeiyxzi2GQfBDv8SgfJtaMwj5ssQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSjL81skqSh7f0AtxR9246R2QSvUL9szUIK+RjCvIlQ=;
 b=fbbtpBEm+lLnbA7Fp9hOjOSY+yDQaBK9LZkzMDHhX8aSN1kBQBSX53IdWKKmGxcAbxSRItH7w+hFVVHSJO3XgHjk1bV+D5np8Pry+EJQR+OKK/Lyzpm75kUboZe7dk3AP/MFmRfwnaJNoUjYA+s+Ro96NHVDVtTjL79Xbx8ywlpoblXwf2E68c53wCjolJsJZxPOtKYZ3j/Hl3Nc38VViCqdNedrUHFfx5GqfUeRjtAqr5MFH6ktViehdv9Wmz7MVat8/Og7BHCqqJnpHnXvEZNJwoEpO4MPjydxa3cLerkfkzscGaDNzflOT4EeFCdWeq2mcX5W0Zm52YUddoWkqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from SN1PR12CA0071.namprd12.prod.outlook.com (2603:10b6:802:20::42)
 by MN2PR12MB4304.namprd12.prod.outlook.com (2603:10b6:208:1d0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.18; Fri, 11 Oct
 2019 19:53:51 +0000
Received: from BY2NAM03FT062.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::209) by SN1PR12CA0071.outlook.office365.com
 (2603:10b6:802:20::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.17 via Frontend
 Transport; Fri, 11 Oct 2019 19:53:51 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT062.mail.protection.outlook.com (10.152.85.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Fri, 11 Oct 2019 19:53:50 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 11 Oct 2019
 14:53:46 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 14/29] drm/amd/display: use dcn10 version of program tiling on
 Renoir
Date: Fri, 11 Oct 2019 15:53:09 -0400
Message-ID: <20191011195324.16268-15-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
References: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(396003)(346002)(428003)(199004)(189003)(478600001)(70586007)(70206006)(5660300002)(14444005)(2906002)(36756003)(1076003)(8936002)(16586007)(53416004)(6916009)(50226002)(47776003)(8676002)(4326008)(81166006)(81156014)(7696005)(50466002)(76176011)(2616005)(6666004)(316002)(26005)(446003)(476003)(51416003)(486006)(356004)(2351001)(186003)(86362001)(11346002)(336012)(305945005)(426003)(48376002)(126002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4304; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d401842-5503-40bc-d958-08d74e84bce8
X-MS-TrafficTypeDiagnostic: MN2PR12MB4304:
X-Microsoft-Antispam-PRVS: <MN2PR12MB43049C95904115E1501E2EF3F9970@MN2PR12MB4304.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:639;
X-Forefront-PRVS: 0187F3EA14
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eNhaW+o4LdX8kCY2GBRgz764+DCfI1JGbLEWAJjK3VsrMRdPjYNmLMoghF6QCbeVGVSM8ukWTIpmPODYcTd2zx98qAmsmd2wpUOTGsghqWnOXVUPgO2+ITvJYQsgDxFpdDxXyNUwO5MWi0QBkcqjElF4cjgCUiczA8ien1kk+/3ndqWjgZKpmNHyirmZUQiIO/jb5NO5b0S1q/4lVzRngZY8/3qpU5JKDpf2fy5Xxple0CUJZ1f9E/uLOWamqMeMOlD/lWp24hknrE7HE49PWdYApgIiBHnLVXPgRSZ7LVkh69k8qhxMzocBvmoYrtsMyFoMQDNa4dVq6phh9My8+r+VEkaPa2Y2uzuykEDCgtS8GuA3ozDDIU2jRYuC4vMNNnO/b1Dt/QQUtXNvnxpd14xe0R3xNdqc209iIRtr7lY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 19:53:50.6649 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d401842-5503-40bc-d958-08d74e84bce8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4304
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSjL81skqSh7f0AtxR9246R2QSvUL9szUIK+RjCvIlQ=;
 b=QJHMoh19VbwzmR9HWbE/JgQB0yHX1sk9OrQ0tSEdppd70kaXbXNqhkev2K/0Vz1vc614F6cij11qTJ0/eJhcuWl6voB9eDTYjl4NpbnAKLDmxPdvKs/F4loylWx8DTYXNKaRyc0BzdSI/XWEiCzJHgFJWlNMZtbjU3ht+PbGCFY=
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
Cc: Eric Yang <Eric.Yang2@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXJpYyBZYW5nIDxFcmljLllhbmcyQGFtZC5jb20+CgpbV2h5XQpSZW5vaXIgaXMgZ2Z4
OSwgc2FtZSBhcyBkY24xMCwgbm90IGRjbjIwLgoKU2lnbmVkLW9mZi1ieTogRXJpYyBZYW5nIDxF
cmljLllhbmcyQGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJl
ZXQuTGFraGFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MjEvZGNuMjFfaHVicC5jIHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjbjIxL2RjbjIxX2h1YnAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y24yMS9kY24yMV9odWJwLmMKaW5kZXggYTAwYWY1MTNhYTJiLi4yZjVhNTg2N2U2NzQgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9odWJwLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX2h1YnAuYwpA
QCAtMjIsNiArMjIsOCBAQAogICogQXV0aG9yczogQU1ECiAgKgogICovCisKKyNpbmNsdWRlICJk
Y24xMC9kY24xMF9odWJwLmgiCiAjaW5jbHVkZSAiZGNuMjFfaHVicC5oIgogCiAjaW5jbHVkZSAi
ZG1fc2VydmljZXMuaCIKQEAgLTIwMiw3ICsyMDQsNyBAQCBzdGF0aWMgc3RydWN0IGh1YnBfZnVu
Y3MgZGNuMjFfaHVicF9mdW5jcyA9IHsKIAkuaHVicF9lbmFibGVfdHJpcGxlQnVmZmVyID0gaHVi
cDJfZW5hYmxlX3RyaXBsZWJ1ZmZlciwKIAkuaHVicF9pc190cmlwbGVidWZmZXJfZW5hYmxlZCA9
IGh1YnAyX2lzX3RyaXBsZWJ1ZmZlcl9lbmFibGVkLAogCS5odWJwX3Byb2dyYW1fc3VyZmFjZV9m
bGlwX2FuZF9hZGRyID0gaHVicDJfcHJvZ3JhbV9zdXJmYWNlX2ZsaXBfYW5kX2FkZHIsCi0JLmh1
YnBfcHJvZ3JhbV9zdXJmYWNlX2NvbmZpZyA9IGh1YnAyX3Byb2dyYW1fc3VyZmFjZV9jb25maWcs
CisJLmh1YnBfcHJvZ3JhbV9zdXJmYWNlX2NvbmZpZyA9IGh1YnAxX3Byb2dyYW1fc3VyZmFjZV9j
b25maWcsCiAJLmh1YnBfaXNfZmxpcF9wZW5kaW5nID0gaHVicDFfaXNfZmxpcF9wZW5kaW5nLAog
CS5odWJwX3NldHVwID0gaHVicDIxX3NldHVwLAogCS5odWJwX3NldHVwX2ludGVyZGVwZW5kZW50
ID0gaHVicDJfc2V0dXBfaW50ZXJkZXBlbmRlbnQsCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
