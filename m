Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 914F9DB740
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 21:16:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A266EABF;
	Thu, 17 Oct 2019 19:15:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700072.outbound.protection.outlook.com [40.107.70.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B85FD6EAAD
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 19:15:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cT247IkFEJW1LEe3srcaKY2RxaB9YZqKVI2zpZ6szjh8QslZ1W6IftmpRBN7FKwJ9eF1gjgWrJm+nAiVov58diDjmn9Ya0NTmMXhWNuW7PXnXAon36vmkrXSRo5gWQO7YNtu6B50nUT0wVDBE9WPi25HW10DODMKKqilczVFBUiPj3+KrYb46iQ+s5H6QfbakVLUaoRmGf3twL++t5wdYjao/stoARF0xmuFfAG6XYkU/zJGuPi6LIaGJw9dy3DKRJO+PfXDNuaZDrxKOf7LKCPH2bgfUi7QUChmFC/4gCcogEVApgBneBcpw1mLpK0M87KmGn5LMbr2mGS/4IleaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CT2cToA3XKJfZUWQdfjyrHkOj9Pqtn7VS2/rTtxDEKw=;
 b=FSlaP65xjnW7FpUxGBCJB8SvAp4HqWOK4/qaKRsDdd5BEYfW7J80A+FmNB/ce5lEcdYQH/fb+DOeHdxwweK+EiRAhWKdDQbP64pRDR/LFfZFh07hHqkhaUNLqkv0APVwhXuVCoBEIwbz1PmdUJSQ84HsCZUQUSIMHvrxvQ6ah9N6v4gxgikUFU/ZaheSD9bG9wCkWNJetJTygHgPCgUkN8f+UiiVFrPM3qC1CPPmlBG8ZxHiHFW7r10j0hvsLRy8kKuy5dJE+gYSavNL7Yp7pgG76i+0ek4Qajbg2dx2I3OgEUgoZiGRBG8i2Ad1/c7sGAyc8+5xgg37TR3WLWXyOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR1201CA0022.namprd12.prod.outlook.com
 (2603:10b6:405:4c::32) by DM6PR12MB3929.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Thu, 17 Oct
 2019 19:15:49 +0000
Received: from BY2NAM03FT046.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by BN6PR1201CA0022.outlook.office365.com
 (2603:10b6:405:4c::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Thu, 17 Oct 2019 19:15:49 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BY2NAM03FT046.mail.protection.outlook.com (10.152.85.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2367.14 via Frontend Transport; Thu, 17 Oct 2019 19:15:48 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:45 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 17 Oct 2019 14:15:44 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 24/37] drm/amd/display: Passive DP->HDMI dongle detection fix
Date: Thu, 17 Oct 2019 15:13:16 -0400
Message-ID: <20191017191329.11857-25-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017191329.11857-1-sunpeng.li@amd.com>
References: <20191017191329.11857-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(396003)(346002)(136003)(428003)(189003)(199004)(8936002)(8676002)(6916009)(26005)(76176011)(2616005)(186003)(70206006)(51416003)(1076003)(48376002)(486006)(70586007)(356004)(54906003)(6666004)(126002)(476003)(316002)(5660300002)(478600001)(50466002)(81156014)(81166006)(4326008)(36756003)(47776003)(336012)(50226002)(446003)(305945005)(2870700001)(2351001)(426003)(2906002)(2876002)(11346002)(86362001)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3929; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e029e417-f31f-42f9-fa50-08d753366b4a
X-MS-TrafficTypeDiagnostic: DM6PR12MB3929:
X-Microsoft-Antispam-PRVS: <DM6PR12MB392936495C1342D294E6DD6D826D0@DM6PR12MB3929.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 01930B2BA8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9MyTKxvOYp2s6WCbZrM5XB+m8pggIYuzq08c6wKJDHL9f36X1WrwLIXgv5Pt85xYeFCfHu7eUUFDY9a7u6O8Ux1VxcD+Wb9doIWQfv3yCGhU72K7miDt0oHt0pV9I28CurMtfm/QYduJYbD7s0VjH3Eei3lEMhYTBDfyWv03gib1sP+P3HQAKjq8v2gVcNAsA1cQsMVw9UrthlRN5N2Ao4SYGpwOtk2URSVOI6cCcngMtjupj/Oeb32DqxQ4wcnSZSYueQrME6qpQAKM0MO8nIaBmOYgMcbCqqerpCDzXJmQJZe5axL5gnKEaJP6ILoPVxn8Kl332Ylo07C3vXCFEh20V1u8nOuuLNLOZGxWGv1aRS+uj0Tm9GtScXDSDA4xcYvEwly1oiXVvDd+mwBe8DRyXl/ayw3byMSrS4zzUAw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 19:15:48.8308 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e029e417-f31f-42f9-fa50-08d753366b4a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3929
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CT2cToA3XKJfZUWQdfjyrHkOj9Pqtn7VS2/rTtxDEKw=;
 b=K4pwlzsaWVZn+v6hU/H57BXdLVhBMW7I+Jsz20QneVwE0k8cosAEjDPqM7Dx8g8pa3i0lPOPO+LFlpAKKcxIIEP+PLKBbjbFngygJZBoVe0AgOITQIiCx85iaBM8mPqxNZ+DTfc8WW846ada2bgd1DOVWSBX6V9GEN6WEHo8wtQ=
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
Cc: Leo Li <sunpeng.li@amd.com>, Tony Cheng <Tony.Cheng@amd.com>,
 Michael Strauss <michael.strauss@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTWljaGFlbCBTdHJhdXNzIDxtaWNoYWVsLnN0cmF1c3NAYW1kLmNvbT4KCltXSFldCmky
Y19yZWFkIGlzIGNhbGxlZCB0byBkaWZmZXJlbnRpYXRlIHBhc3NpdmUgRFAtPkhETUkgYW5kIERQ
LT5EVkktRCBkb25nbGVzClRoZSBjYWxsIGlzIGV4cGVjdGVkIHRvIGZhaWwgaW4gRFZJLUQgY2Fz
ZSBidXQgcGFzcyBpbiBIRE1JIGNhc2UKU29tZSBIRE1JIGRvbmdsZXMgaGF2ZSBhIGNoYW5jZSB0
byBmYWlsIGFzIHdlbGwsIGNhdXNpbmcgbWlzZGV0ZWN0aW9uIGFzIERWSS1ECgpbSE9XXQpSZXRy
eSBpMmNfcmVhZCB0byBlbnN1cmUgZmFpbGVkIHJlc3VsdCBpcyB2YWxpZAoKU2lnbmVkLW9mZi1i
eTogTWljaGFlbCBTdHJhdXNzIDxtaWNoYWVsLnN0cmF1c3NAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6
IFRvbnkgQ2hlbmcgPFRvbnkuQ2hlbmdAYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVu
Zy5saUBhbWQuY29tPgotLS0KIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlu
a19kZGMuYyB8IDI0ICsrKysrKysrKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNl
cnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZGRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvY29yZS9kY19saW5rX2RkYy5jCmluZGV4IDlhNTZmMTEwYmJkMS4uN2Y5MDRkNTVj
MWJjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19s
aW5rX2RkYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xp
bmtfZGRjLmMKQEAgLTM3NCw2ICszNzQsNyBAQCB2b2lkIGRhbF9kZGNfc2VydmljZV9pMmNfcXVl
cnlfZHBfZHVhbF9tb2RlX2FkYXB0b3IoCiAJZW51bSBkaXNwbGF5X2RvbmdsZV90eXBlICpkb25n
bGUgPSAmc2lua19jYXAtPmRvbmdsZV90eXBlOwogCXVpbnQ4X3QgdHlwZTJfZG9uZ2xlX2J1ZltE
UF9BREFQVE9SX1RZUEUyX1NJWkVdOwogCWJvb2wgaXNfdHlwZTJfZG9uZ2xlID0gZmFsc2U7CisJ
aW50IHJldHJ5X2NvdW50ID0gMjsKIAlzdHJ1Y3QgZHBfaGRtaV9kb25nbGVfc2lnbmF0dXJlX2Rh
dGEgKmRvbmdsZV9zaWduYXR1cmU7CiAKIAkvKiBBc3N1bWUgd2UgaGF2ZSBubyB2YWxpZCBEUCBw
YXNzaXZlIGRvbmdsZSBjb25uZWN0ZWQgKi8KQEAgLTM4NiwxMyArMzg3LDI0IEBAIHZvaWQgZGFs
X2RkY19zZXJ2aWNlX2kyY19xdWVyeV9kcF9kdWFsX21vZGVfYWRhcHRvcigKIAkJRFBfSERNSV9E
T05HTEVfQUREUkVTUywKIAkJdHlwZTJfZG9uZ2xlX2J1ZiwKIAkJc2l6ZW9mKHR5cGUyX2Rvbmds
ZV9idWYpKSkgewotCQkqZG9uZ2xlID0gRElTUExBWV9ET05HTEVfRFBfRFZJX0RPTkdMRTsKLQkJ
c2lua19jYXAtPm1heF9oZG1pX3BpeGVsX2Nsb2NrID0gRFBfQURBUFRPUl9EVklfTUFYX1RNRFNf
Q0xLOworCQkvKiBQYXNzaXZlIEhETUkgZG9uZ2xlcyBjYW4gc29tZXRpbWVzIGZhaWwgaGVyZSB3
aXRob3V0IHJldHJ5aW5nKi8KKwkJd2hpbGUgKHJldHJ5X2NvdW50ID4gMCkgeworCQkJaWYgKGky
Y19yZWFkKGRkYywKKwkJCQlEUF9IRE1JX0RPTkdMRV9BRERSRVNTLAorCQkJCXR5cGUyX2Rvbmds
ZV9idWYsCisJCQkJc2l6ZW9mKHR5cGUyX2RvbmdsZV9idWYpKSkKKwkJCQlicmVhazsKKwkJCXJl
dHJ5X2NvdW50LS07CisJCX0KKwkJaWYgKHJldHJ5X2NvdW50ID09IDApIHsKKwkJCSpkb25nbGUg
PSBESVNQTEFZX0RPTkdMRV9EUF9EVklfRE9OR0xFOworCQkJc2lua19jYXAtPm1heF9oZG1pX3Bp
eGVsX2Nsb2NrID0gRFBfQURBUFRPUl9EVklfTUFYX1RNRFNfQ0xLOwogCi0JCUNPTk5fREFUQV9E
RVRFQ1QoZGRjLT5saW5rLCB0eXBlMl9kb25nbGVfYnVmLCBzaXplb2YodHlwZTJfZG9uZ2xlX2J1
ZiksCi0JCQkJIkRQLURWSSBwYXNzaXZlIGRvbmdsZSAlZE1oejogIiwKLQkJCQlEUF9BREFQVE9S
X0RWSV9NQVhfVE1EU19DTEsgLyAxMDAwKTsKLQkJcmV0dXJuOworCQkJQ09OTl9EQVRBX0RFVEVD
VChkZGMtPmxpbmssIHR5cGUyX2RvbmdsZV9idWYsIHNpemVvZih0eXBlMl9kb25nbGVfYnVmKSwK
KwkJCQkJIkRQLURWSSBwYXNzaXZlIGRvbmdsZSAlZE1oejogIiwKKwkJCQkJRFBfQURBUFRPUl9E
VklfTUFYX1RNRFNfQ0xLIC8gMTAwMCk7CisJCQlyZXR1cm47CisJCX0KIAl9CiAKIAkvKiBDaGVj
ayBpZiBUeXBlIDIgZG9uZ2xlLiovCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
