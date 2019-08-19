Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A2192709
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 16:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F1F26E178;
	Mon, 19 Aug 2019 14:36:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810051.outbound.protection.outlook.com [40.107.81.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 871CB6E14F
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 14:36:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PLULnuk5TsfT3E5yNdjPN97GY+x9YUh3uMgDo79OZMD4YXerk/jHlCWg19tn9eTi9cHFvMzovqcyD/2jnQ/jssALtPKn58q7gfHY5T0Am3r0ushp1zfGLfvOUfD+TAXAnh35l7C6ob7wCoP6kOiAsexX3Dwz2g9B307gHo/Mkp/khv1rIZwxEGXZd9MB67sAdG+vTQhHKX/f8H7KU0/v4PMUNDLoZjCqtekOj9ilIhNNkgtDSQpEZfemv3NAAnP19y+aFkygnbvuLG5Vj1nnGVhBbi8puSXy9eJm7QJa47dDYEj4aPXRxwAbCCdFvaSI1OJ1Y2f55TsVDng9w5qnVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1JkMzlqAg7WPCt0xEUzWafJ5p6AbUGUryhxZxpyKiQY=;
 b=jVlnMq2CZyVYezq2jD++1MiAMXA0Ost70zU4Rfu6qIoJpKrCbedWevkl0ysFriT6CGBttSyAdYwGpBzEaBw/LJ35opjpD+tEEFmmgVetQ5aWgqAQZpfm8CFo9zuvlRTmQ+B9YknSmycertOzwcuJMXYiBQG93M2DH0jk/M1joUDN81YhwZ1/5UGxEHpRob2B2HDsDmQc3XvNrGdLGJP/Ok9VwG76tsQFfTlWBgSk7sMdlbGibR8acFO5BgDJYnu8X314ZwaBBEV6Vr9NV9uIgY3jmowM1oKNk3iTknHWEnWbQsrMJRMmliyHQxhvfTICWx+CCdaACeyOaQcJs3/HQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR12CA0041.namprd12.prod.outlook.com (2603:10b6:405:70::27)
 by MWHPR12MB1279.namprd12.prod.outlook.com (2603:10b6:300:d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.18; Mon, 19 Aug
 2019 14:36:00 +0000
Received: from BY2NAM03FT016.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::205) by BN6PR12CA0041.outlook.office365.com
 (2603:10b6:405:70::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 14:36:00 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT016.mail.protection.outlook.com (10.152.84.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 14:36:00 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 19 Aug 2019
 09:35:48 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 27/36] drm/amd/display: Add Logging for Gamma Related
 information
Date: Mon, 19 Aug 2019 10:35:06 -0400
Message-ID: <20190819143515.21653-28-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
References: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(396003)(39860400002)(2980300002)(428003)(199004)(189003)(86362001)(70206006)(486006)(478600001)(70586007)(316002)(53936002)(50226002)(36756003)(53416004)(50466002)(48376002)(16586007)(8936002)(126002)(356004)(476003)(6916009)(11346002)(2616005)(4326008)(426003)(26005)(5660300002)(305945005)(81166006)(6666004)(81156014)(336012)(76176011)(446003)(186003)(8676002)(7696005)(51416003)(1076003)(2351001)(2906002)(47776003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1279; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d23133e-7f96-41f5-12ab-08d724b28e0a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1279; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1279:
X-Microsoft-Antispam-PRVS: <MWHPR12MB127900EB051D98551062E35CF9A80@MWHPR12MB1279.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:820;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: quM9PVRkuzfwysLaVtcFk7tlW4DpSYCu1F3aQksIJCa2AHdTzHS87wxqpCNmUdpgn6hgYGDy1uMDq6i8r9pg7MhwrNjpSCrQ22ofKcTB00prTGrgQqYbM+5bmKLXshzEJ6120GHnEm2/QtZvlh+jZMjmfO+6LmbLSwWJZijszEuaSPJldSgrQluRQUyKWh/M8bBWitjw+AA9rE6QMOwsWPg6KRMmTHiVoOUUBm8CnmXpjyzu0yMG9JEMFn4s5vbE/1+kXhL4C+Zjhpn9tyShI+ao+I4gwapTFCGhqGJt/X1N9UmJzLRMn0lR6dMS/QO9A5tBZsuLwadITbvztUY868+40deUYyXmAtmkTsYJcMg47+uO5mmX3CUPKr2wuPKtWM15a6o9JoN/Rv5yWybTn0YBQaUckOoB3ZFd3eUm+OM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 14:36:00.0426 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d23133e-7f96-41f5-12ab-08d724b28e0a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1279
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1JkMzlqAg7WPCt0xEUzWafJ5p6AbUGUryhxZxpyKiQY=;
 b=Tr/gzz6fEVyjtH/EArXOQ+2L9hHjAdI0kII46yw0lBwcjTXFUjoZe+nEMXQBAb8J1M1N8bkVRYc7jpRfO8skbKjTENr0JaoVzfmdgAZRwRHND5ms7+9C/EWlvSpxh8qSPCEk7W2ohWnR1Cp8mzCKpjYx1P7W/a53nVYhpc1P8uQ=
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
Cc: Wyatt Wood <wyatt.wood@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogV3lhdHQgV29vZCA8d3lhdHQud29vZEBhbWQuY29tPgoKW1doeV0KQSByZWNlbnQgYnVn
IHNob3dlZCB0aGF0IGxvZ2dpbmcgd291bGQgYmUgdXNlZnVsIGluIGRlYnVnZ2luZwp2YXJpb3Vz
IGdhbW1hIGlzc3Vlcy4KCltIb3ddCkFkZCBsb2dnaW5nIGluIGRjLgpGaXggZm9ybWF0dGluZyBm
b3IgZWFzaWVyIGdyYXBoaW5nLgoKU2lnbmVkLW9mZi1ieTogV3lhdHQgV29vZCA8d3lhdHQud29v
ZEBhbWQuY29tPgpSZXZpZXdlZC1ieTogQW50aG9ueSBLb28gPEFudGhvbnkuS29vQGFtZC5jb20+
CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4K
LS0tCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jICAg
IHwgMTIgKysrKysrLS0tLS0tCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2NvbG9y
L2NvbG9yX2dhbW1hLmMgIHwgIDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMo
KyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jCmluZGV4IDAwNDY3NWRiNjg2ZC4u
MGU3ZDkyOWMyNTRjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNuMTAvZGNuMTBfaHdfc2VxdWVuY2VyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jCkBAIC0xNDUxLDE1ICsxNDUxLDE1IEBA
IHN0YXRpYyB2b2lkIGxvZ190ZihzdHJ1Y3QgZGNfY29udGV4dCAqY3R4LAogCURDX0xPR19BTExf
VEZfQ0hBTk5FTFMoIkxvZ2dpbmcgYWxsIGNoYW5uZWxzLi4uIik7CiAKIAlmb3IgKGkgPSAwOyBp
IDwgaHdfcG9pbnRzX251bTsgaSsrKSB7Ci0JCURDX0xPR19HQU1NQSgiUiAlZCAlbGx1XG4iLCBp
LCB0Zi0+dGZfcHRzLnJlZFtpXS52YWx1ZSk7Ci0JCURDX0xPR19BTExfVEZfQ0hBTk5FTFMoIkcg
JWQsICVsbHVcbiIsIGksIHRmLT50Zl9wdHMuZ3JlZW5baV0udmFsdWUpOwotCQlEQ19MT0dfQUxM
X1RGX0NIQU5ORUxTKCJCICVkLCAlbGx1XG4iLCBpLCB0Zi0+dGZfcHRzLmJsdWVbaV0udmFsdWUp
OworCQlEQ19MT0dfR0FNTUEoIlJcdCVkXHQlbGx1XG4iLCBpLCB0Zi0+dGZfcHRzLnJlZFtpXS52
YWx1ZSk7CisJCURDX0xPR19BTExfVEZfQ0hBTk5FTFMoIkdcdCVkXHQlbGx1XG4iLCBpLCB0Zi0+
dGZfcHRzLmdyZWVuW2ldLnZhbHVlKTsKKwkJRENfTE9HX0FMTF9URl9DSEFOTkVMUygiQlx0JWRc
dCVsbHVcbiIsIGksIHRmLT50Zl9wdHMuYmx1ZVtpXS52YWx1ZSk7CiAJfQogCiAJZm9yIChpID0g
aHdfcG9pbnRzX251bTsgaSA8IE1BWF9OVU1fSFdfUE9JTlRTOyBpKyspIHsKLQkJRENfTE9HX0FM
TF9HQU1NQSgiUiAlZCAlbGx1XG4iLCBpLCB0Zi0+dGZfcHRzLnJlZFtpXS52YWx1ZSk7Ci0JCURD
X0xPR19BTExfVEZfQ0hBTk5FTFMoIkcgJWQgJWxsdVxuIiwgaSwgdGYtPnRmX3B0cy5ncmVlbltp
XS52YWx1ZSk7Ci0JCURDX0xPR19BTExfVEZfQ0hBTk5FTFMoIkIgJWQgJWxsdVxuIiwgaSwgdGYt
PnRmX3B0cy5ibHVlW2ldLnZhbHVlKTsKKwkJRENfTE9HX0FMTF9HQU1NQSgiUlx0JWRcdCVsbHVc
biIsIGksIHRmLT50Zl9wdHMucmVkW2ldLnZhbHVlKTsKKwkJRENfTE9HX0FMTF9URl9DSEFOTkVM
UygiR1x0JWRcdCVsbHVcbiIsIGksIHRmLT50Zl9wdHMuZ3JlZW5baV0udmFsdWUpOworCQlEQ19M
T0dfQUxMX1RGX0NIQU5ORUxTKCJCXHQlZFx0JWxsdVxuIiwgaSwgdGYtPnRmX3B0cy5ibHVlW2ld
LnZhbHVlKTsKIAl9CiB9CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9tb2R1bGVzL2NvbG9yL2NvbG9yX2dhbW1hLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvbW9kdWxlcy9jb2xvci9jb2xvcl9nYW1tYS5jCmluZGV4IDhmNzhlYTIyNmRhZS4uMTk0NzVj
ZjVhYjcyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9j
b2xvci9jb2xvcl9nYW1tYS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1
bGVzL2NvbG9yL2NvbG9yX2dhbW1hLmMKQEAgLTk5LDEwICs5OSwxMCBAQCB2b2lkIGxvZ194X3Bv
aW50c19kaXN0cmlidXRpb24oc3RydWN0IGRhbF9sb2dnZXIgKmxvZ2dlcikKIAlpbnQgaSA9IDA7
CiAKIAlpZiAobG9nZ2VyICE9IE5VTEwpIHsKLQkJTE9HX0dBTU1BX1dSSVRFKCJdTG9nIFggRGlz
dHJpYnV0aW9uXG4iKTsKKwkJTE9HX0dBTU1BX1dSSVRFKCJMb2cgWCBEaXN0cmlidXRpb25cbiIp
OwogCiAJCWZvciAoaSA9IDA7IGkgPCBNQVhfSFdfUE9JTlRTOyBpKyspCi0JCQlMT0dfR0FNTUFf
V1JJVEUoIl0lbGx1XG4iLCBjb29yZGluYXRlc194W2ldLngudmFsdWUpOworCQkJTE9HX0dBTU1B
X1dSSVRFKCIlbGx1XG4iLCBjb29yZGluYXRlc194W2ldLngudmFsdWUpOwogCX0KIH0KIAotLSAK
Mi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
