Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21653AF19B
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 21:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 088FD6E980;
	Tue, 10 Sep 2019 19:06:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810044.outbound.protection.outlook.com [40.107.81.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FAA36E96A
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 19:06:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=etFS5vAIplXQ6ImbqmpL+twRDab/di5JW3wGIReqETCp/+bD4qI33aCGJxe8o9NMfMq5PZMKJxiHJT7NY5iErfJ5TGGYId/ygQ4EAEk0h8OJeTiq476/6Hh7hi2Iij0S/Tq/wvM+lfgYFYXwi3h1X+7EJb1PDSyz6OM1AxK6czI9Ngxak/uwka8nFLemyN+xDMHler5fSq4nBjG2pZgRfriq6wGEhqGQGAS7fBUAoX34zdNdK0XDx1ckFOY06O/jJAV3i7SYts7jnbOX8N5IL385mJOSWRu4ZXSuc2/o5BuQ3jtiiQ+h4uBchDL8oDnoeoRPDDERmc/0ilff1zGUIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iBVSgPUx/SiGc1AOJlRClDxqjKQGWmh2bzjIiiQtTg4=;
 b=cu2EcAoO/hFZcpe5ArYr3eQkBgnkaKqnBnRbbZZEIez/Z8sw5MsSvA3e4RFLSvXXwU3xQFO2wBJIWIDwNCbuTprO0qZX/y9x1PWLPeSdVMO3ehZ4GsTNv1sowYEF+cMj0wmWJrz4syMzjBFpweUVCZHRiXPuetHrkczL6AoVOE/t9Ocd2lO57X9JbD41QUOo8jR0hcJo+55gSveH5zCe9DUY6vIzdSBLuCfLxft3rcAAZZNsgt8Rf2x2VAFo1/2Q0NJHid8oo0HBlCvx8x1zCCeYseZWEksJZ72J9YjAhJbkwUipasmpHNzTlLxuR6kXfuCmx6VtGlPJNtYYYTkyfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0016.namprd12.prod.outlook.com
 (2603:10b6:301:4a::26) by MWHPR1201MB0141.namprd12.prod.outlook.com
 (2603:10b6:301:56::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.18; Tue, 10 Sep
 2019 19:06:22 +0000
Received: from DM3NAM03FT020.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::201) by MWHPR1201CA0016.outlook.office365.com
 (2603:10b6:301:4a::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.14 via Frontend
 Transport; Tue, 10 Sep 2019 19:06:22 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT020.mail.protection.outlook.com (10.152.82.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 19:06:21 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 10 Sep 2019
 14:06:17 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 09/20] drm/amdgpu: psp DTM init
Date: Tue, 10 Sep 2019 15:05:43 -0400
Message-ID: <20190910190554.1539-10-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910190554.1539-1-Bhawanpreet.Lakha@amd.com>
References: <20190829162253.10195-10-Bhawanpreet.Lakha@amd.com>
 <20190910190554.1539-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(396003)(346002)(2980300002)(428003)(199004)(189003)(426003)(1076003)(14444005)(486006)(70586007)(5660300002)(336012)(50466002)(356004)(6666004)(26005)(478600001)(2906002)(70206006)(186003)(4326008)(16586007)(316002)(36756003)(50226002)(8676002)(305945005)(8936002)(51416003)(81166006)(446003)(48376002)(2616005)(476003)(126002)(47776003)(11346002)(53416004)(6916009)(86362001)(2351001)(53936002)(76176011)(7696005)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR1201MB0141; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff6702cc-1636-46d5-1716-08d73621f804
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:MWHPR1201MB0141; 
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0141:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB01419A49E60A0D4017C08A5AF9B60@MWHPR1201MB0141.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 6+bfMepOo2iaVMlLsYE8Cw1xox5o6FAkwZIbKI3gn1Z5E/P8uVFmITZQQauvqH5hDlgkLE/AtXi0TzTqlqrl2d6NipA2IiIWPCWG/VbhBjkeoT2u+MqEk5FHlxfYe/S0jPWnmqarWT0lmyUiCRysMn8hxStqGJ6Vauaja6juzTIug580o/1Ym5qyEoaYGekAsCTMmab7ii8aqfsZGCM2gK8ktFq59psJKkuWyYQAkubjltF/XhA3i2z7ypBRyT6g2vQX4UAuwc92g6C3m9R6hAzJHwc4c7fsV12TMp9bzjPUKRBhoFXMy8j9BY+SJzYQ6tgMDmkAhIFG9Ssx7n/brSma6OvwYaQC3ViUv8GCqE2IUIHX6LlMYwiQZR/Y/yvpnn3k8QQCMqIh5LXro6VevpiFLX3VtG8I1Vv+Lxcr0C4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 19:06:21.8011 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff6702cc-1636-46d5-1716-08d73621f804
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0141
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iBVSgPUx/SiGc1AOJlRClDxqjKQGWmh2bzjIiiQtTg4=;
 b=ndX4aIJizOLB+0fdLdQSHtjktkATHOg42xE36b+ZFra6nvvol4M/jwc1x/Bd+hbo7htpksdeRee9If7gfO23bhyxlaFw7vuLetX8HpQp2TwvcQfeWdwN22R1YXwmuVniq7ZeQoNM1qMtS8TJtKRd3WPK6gONY4gLttY2MYPEYBE=
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

RFRNIGlzIHRoZSBkaXNwbGF5IHRvcG9sb2d5IG1hbmFnZXIuIFRoaXMgaXMgbmVlZGVkIHRvIGNv
bW11bmljYXRlIHdpdGgKcHNwIGFib3V0IHRoZSBkaXNwbGF5IGNvbmZpZ3VyYXRpb25zLgoKVGhp
cyBwYXRjaCBhZGRzCiAgICAtTG9hZGluZyB0aGUgZmlybXdhcmUKICAgIC1UaGUgZnVuY3Rpb25z
IGFuZCBkZWZpbml0aW9ucyBmb3IgY29tbXVuaWNhdGlvbiB3aXRoIHRoZSBmaXJtd2FyZQoKdjI6
IEZpeCBmb3JtYXR0aW5nCgpTaWduZWQtb2ZmLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2Fu
cHJlZXQuTGFraGFAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53
ZW50bGFuZEBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9w
c3AuYyAgIHwgMTU0ICsrKysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9wc3AuaCAgIHwgIDE1ICsrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3Vjb2RlLmggfCAgIDMgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNw
X3YxMF8wLmMgICAgfCAgMTEgKy0KIDQgZmlsZXMgY2hhbmdlZCwgMTgxIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3BzcC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jCmlu
ZGV4IGU3NWQxNjRlYTg1Yi4uZGRiMzZhODM0ZTFjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3BzcC5jCkBAIC05NDEsNiArOTQxLDE0OSBAQCBzdGF0aWMgaW50IHBzcF9oZGNw
X3Rlcm1pbmF0ZShzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCkKIH0KIC8vIEhEQ1AgZW5kCiAKKy8v
IERUTSBzdGFydAorc3RhdGljIHZvaWQgcHNwX3ByZXBfZHRtX3RhX2xvYWRfY21kX2J1ZihzdHJ1
Y3QgcHNwX2dmeF9jbWRfcmVzcCAqY21kLAorCQkJCQkgdWludDY0X3QgZHRtX3RhX21jLAorCQkJ
CQkgdWludDY0X3QgZHRtX21jX3NoYXJlZCwKKwkJCQkJIHVpbnQzMl90IGR0bV90YV9zaXplLAor
CQkJCQkgdWludDMyX3Qgc2hhcmVkX3NpemUpCit7CisJY21kLT5jbWRfaWQgPSBHRlhfQ01EX0lE
X0xPQURfVEE7CisJY21kLT5jbWQuY21kX2xvYWRfdGEuYXBwX3BoeV9hZGRyX2xvID0gbG93ZXJf
MzJfYml0cyhkdG1fdGFfbWMpOworCWNtZC0+Y21kLmNtZF9sb2FkX3RhLmFwcF9waHlfYWRkcl9o
aSA9IHVwcGVyXzMyX2JpdHMoZHRtX3RhX21jKTsKKwljbWQtPmNtZC5jbWRfbG9hZF90YS5hcHBf
bGVuID0gZHRtX3RhX3NpemU7CisKKwljbWQtPmNtZC5jbWRfbG9hZF90YS5jbWRfYnVmX3BoeV9h
ZGRyX2xvID0gbG93ZXJfMzJfYml0cyhkdG1fbWNfc2hhcmVkKTsKKwljbWQtPmNtZC5jbWRfbG9h
ZF90YS5jbWRfYnVmX3BoeV9hZGRyX2hpID0gdXBwZXJfMzJfYml0cyhkdG1fbWNfc2hhcmVkKTsK
KwljbWQtPmNtZC5jbWRfbG9hZF90YS5jbWRfYnVmX2xlbiA9IHNoYXJlZF9zaXplOworfQorCitz
dGF0aWMgaW50IHBzcF9kdG1faW5pdF9zaGFyZWRfYnVmKHN0cnVjdCBwc3BfY29udGV4dCAqcHNw
KQoreworCWludCByZXQ7CisKKwkvKgorCSAqIEFsbG9jYXRlIDE2ayBtZW1vcnkgYWxpZ25lZCB0
byA0ayBmcm9tIEZyYW1lIEJ1ZmZlciAobG9jYWwKKwkgKiBwaHlzaWNhbCkgZm9yIGR0bSB0YSA8
LT4gRHJpdmVyCisJICovCisJcmV0ID0gYW1kZ3B1X2JvX2NyZWF0ZV9rZXJuZWwocHNwLT5hZGV2
LCBQU1BfRFRNX1NIQVJFRF9NRU1fU0laRSwKKwkJCQkgICAgICBQQUdFX1NJWkUsIEFNREdQVV9H
RU1fRE9NQUlOX1ZSQU0sCisJCQkJICAgICAgJnBzcC0+ZHRtX2NvbnRleHQuZHRtX3NoYXJlZF9i
bywKKwkJCQkgICAgICAmcHNwLT5kdG1fY29udGV4dC5kdG1fc2hhcmVkX21jX2FkZHIsCisJCQkJ
ICAgICAgJnBzcC0+ZHRtX2NvbnRleHQuZHRtX3NoYXJlZF9idWYpOworCisJcmV0dXJuIHJldDsK
K30KKworc3RhdGljIGludCBwc3BfZHRtX2xvYWQoc3RydWN0IHBzcF9jb250ZXh0ICpwc3ApCit7
CisJaW50IHJldDsKKwlzdHJ1Y3QgcHNwX2dmeF9jbWRfcmVzcCAqY21kOworCisJLyoKKwkgKiBU
T0RPOiBieXBhc3MgdGhlIGxvYWRpbmcgaW4gc3Jpb3YgZm9yIG5vdworCSAqLworCWlmIChhbWRn
cHVfc3Jpb3ZfdmYocHNwLT5hZGV2KSkKKwkJcmV0dXJuIDA7CisKKwljbWQgPSBremFsbG9jKHNp
emVvZihzdHJ1Y3QgcHNwX2dmeF9jbWRfcmVzcCksIEdGUF9LRVJORUwpOworCWlmICghY21kKQor
CQlyZXR1cm4gLUVOT01FTTsKKworCW1lbXNldChwc3AtPmZ3X3ByaV9idWYsIDAsIFBTUF8xX01F
Ryk7CisJbWVtY3B5KHBzcC0+ZndfcHJpX2J1ZiwgcHNwLT50YV9kdG1fc3RhcnRfYWRkciwgcHNw
LT50YV9kdG1fdWNvZGVfc2l6ZSk7CisKKwlwc3BfcHJlcF9kdG1fdGFfbG9hZF9jbWRfYnVmKGNt
ZCwgcHNwLT5md19wcmlfbWNfYWRkciwKKwkJCQkgICAgIHBzcC0+ZHRtX2NvbnRleHQuZHRtX3No
YXJlZF9tY19hZGRyLAorCQkJCSAgICAgcHNwLT50YV9kdG1fdWNvZGVfc2l6ZSwKKwkJCQkgICAg
IFBTUF9EVE1fU0hBUkVEX01FTV9TSVpFKTsKKworCXJldCA9IHBzcF9jbWRfc3VibWl0X2J1Zihw
c3AsIE5VTEwsIGNtZCwgcHNwLT5mZW5jZV9idWZfbWNfYWRkcik7CisKKwlpZiAoIXJldCkgewor
CQlwc3AtPmR0bV9jb250ZXh0LmR0bV9pbml0aWFsaXplZCA9IDE7CisJCXBzcC0+ZHRtX2NvbnRl
eHQuc2Vzc2lvbl9pZCA9IGNtZC0+cmVzcC5zZXNzaW9uX2lkOworCX0KKworCWtmcmVlKGNtZCk7
CisKKwlyZXR1cm4gcmV0OworfQorCitzdGF0aWMgaW50IHBzcF9kdG1faW5pdGlhbGl6ZShzdHJ1
Y3QgcHNwX2NvbnRleHQgKnBzcCkKK3sKKwlpbnQgcmV0OworCisJaWYgKCFwc3AtPmR0bV9jb250
ZXh0LmR0bV9pbml0aWFsaXplZCkgeworCQlyZXQgPSBwc3BfZHRtX2luaXRfc2hhcmVkX2J1Zihw
c3ApOworCQlpZiAocmV0KQorCQkJcmV0dXJuIHJldDsKKwl9CisKKwlyZXQgPSBwc3BfZHRtX2xv
YWQocHNwKTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OworCisJcmV0dXJuIDA7Cit9CisKK3N0
YXRpYyB2b2lkIHBzcF9wcmVwX2R0bV90YV9pbnZva2VfY21kX2J1ZihzdHJ1Y3QgcHNwX2dmeF9j
bWRfcmVzcCAqY21kLAorCQkJCQkgICB1aW50MzJfdCB0YV9jbWRfaWQsCisJCQkJCSAgIHVpbnQz
Ml90IGR0bV9zZXNzaW9uX2lkKQoreworCWNtZC0+Y21kX2lkID0gR0ZYX0NNRF9JRF9JTlZPS0Vf
Q01EOworCWNtZC0+Y21kLmNtZF9pbnZva2VfY21kLnNlc3Npb25faWQgPSBkdG1fc2Vzc2lvbl9p
ZDsKKwljbWQtPmNtZC5jbWRfaW52b2tlX2NtZC50YV9jbWRfaWQgPSB0YV9jbWRfaWQ7CisJLyog
Tm90ZTogY21kX2ludm9rZV9jbWQuYnVmIGlzIG5vdCB1c2VkIGZvciBub3cgKi8KK30KKworaW50
IHBzcF9kdG1faW52b2tlKHN0cnVjdCBwc3BfY29udGV4dCAqcHNwLCB1aW50MzJfdCB0YV9jbWRf
aWQpCit7CisJaW50IHJldDsKKwlzdHJ1Y3QgcHNwX2dmeF9jbWRfcmVzcCAqY21kOworCisJLyoK
KwkgKiBUT0RPOiBieXBhc3MgdGhlIGxvYWRpbmcgaW4gc3Jpb3YgZm9yIG5vdworCSAqLworCWlm
IChhbWRncHVfc3Jpb3ZfdmYocHNwLT5hZGV2KSkKKwkJcmV0dXJuIDA7CisKKwljbWQgPSBremFs
bG9jKHNpemVvZihzdHJ1Y3QgcHNwX2dmeF9jbWRfcmVzcCksIEdGUF9LRVJORUwpOworCWlmICgh
Y21kKQorCQlyZXR1cm4gLUVOT01FTTsKKworCXBzcF9wcmVwX2R0bV90YV9pbnZva2VfY21kX2J1
ZihjbWQsIHRhX2NtZF9pZCwKKwkJCQkgICAgICAgcHNwLT5kdG1fY29udGV4dC5zZXNzaW9uX2lk
KTsKKworCXJldCA9IHBzcF9jbWRfc3VibWl0X2J1Zihwc3AsIE5VTEwsIGNtZCwgcHNwLT5mZW5j
ZV9idWZfbWNfYWRkcik7CisKKwlrZnJlZShjbWQpOworCisJcmV0dXJuIHJldDsKK30KKworc3Rh
dGljIGludCBwc3BfZHRtX3Rlcm1pbmF0ZShzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCkKK3sKKwlp
bnQgcmV0OworCisJaWYgKCFwc3AtPmR0bV9jb250ZXh0LmR0bV9pbml0aWFsaXplZCkKKwkJcmV0
dXJuIDA7CisKKwlyZXQgPSBwc3BfaGRjcF91bmxvYWQocHNwKTsKKwlpZiAocmV0KQorCQlyZXR1
cm4gcmV0OworCisJcHNwLT5kdG1fY29udGV4dC5kdG1faW5pdGlhbGl6ZWQgPSAwOworCisJLyog
ZnJlZSBoZGNwIHNoYXJlZCBtZW1vcnkgKi8KKwlhbWRncHVfYm9fZnJlZV9rZXJuZWwoJnBzcC0+
ZHRtX2NvbnRleHQuZHRtX3NoYXJlZF9ibywKKwkJCSAgICAgICZwc3AtPmR0bV9jb250ZXh0LmR0
bV9zaGFyZWRfbWNfYWRkciwKKwkJCSAgICAgICZwc3AtPmR0bV9jb250ZXh0LmR0bV9zaGFyZWRf
YnVmKTsKKworCXJldHVybiAwOworfQorLy8gRFRNIGVuZAorCiBzdGF0aWMgaW50IHBzcF9od19z
dGFydChzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCkKIHsKIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiA9IHBzcC0+YWRldjsKQEAgLTEwMTksNiArMTE2MiwxMSBAQCBzdGF0aWMgaW50IHBzcF9o
d19zdGFydChzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCkKIAkJaWYgKHJldCkKIAkJCWRldl9lcnIo
cHNwLT5hZGV2LT5kZXYsCiAJCQkJIkhEQ1A6IEZhaWxlZCB0byBpbml0aWFsaXplIEhEQ1BcbiIp
OworCisJCXJldCA9IHBzcF9kdG1faW5pdGlhbGl6ZShwc3ApOworCQlpZiAocmV0KQorCQkJZGV2
X2Vycihwc3AtPmFkZXYtPmRldiwKKwkJCQkiRFRNOiBGYWlsZWQgdG8gaW5pdGlhbGl6ZSBEVE1c
biIpOwogCX0KIAogCXJldHVybiAwOwpAQCAtMTM4Niw2ICsxNTM0LDcgQEAgc3RhdGljIGludCBw
c3BfaHdfZmluaSh2b2lkICpoYW5kbGUpCiAKIAlpZiAocHNwLT5hZGV2LT5wc3AudGFfZncpIHsK
IAkJcHNwX3Jhc190ZXJtaW5hdGUocHNwKTsKKwkJcHNwX2R0bV90ZXJtaW5hdGUocHNwKTsKIAkJ
cHNwX2hkY3BfdGVybWluYXRlKHBzcCk7CiAJfQogCkBAIC0xNDM0LDYgKzE1ODMsMTEgQEAgc3Rh
dGljIGludCBwc3Bfc3VzcGVuZCh2b2lkICpoYW5kbGUpCiAJCQlEUk1fRVJST1IoIkZhaWxlZCB0
byB0ZXJtaW5hdGUgaGRjcCB0YVxuIik7CiAJCQlyZXR1cm4gcmV0OwogCQl9CisJCXJldCA9IHBz
cF9kdG1fdGVybWluYXRlKHBzcCk7CisJCWlmIChyZXQpIHsKKwkJCURSTV9FUlJPUigiRmFpbGVk
IHRvIHRlcm1pbmF0ZSBkdG0gdGFcbiIpOworCQkJcmV0dXJuIHJldDsKKwkJfQogCX0KIAogCXJl
dCA9IHBzcF9yaW5nX3N0b3AocHNwLCBQU1BfUklOR19UWVBFX19LTSk7CmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmggYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcHNwLmgKaW5kZXggNjc4OGUxNjAxOTQ1Li43ZGQ5YWU3ZGJiZTQg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuaAorKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmgKQEAgLTM4LDYgKzM4LDcg
QEAKICNkZWZpbmUgUFNQXzFfTUVHCQkweDEwMDAwMAogI2RlZmluZSBQU1BfVE1SX1NJWkUJMHg0
MDAwMDAKICNkZWZpbmUgUFNQX0hEQ1BfU0hBUkVEX01FTV9TSVpFCTB4NDAwMAorI2RlZmluZSBQ
U1BfRFRNX1NIQVJFRF9NRU1fU0laRQkweDQwMDAKICNkZWZpbmUgUFNQX1NIQVJFRF9NRU1fU0la
RQkJMHg0MDAwCiAKIHN0cnVjdCBwc3BfY29udGV4dDsKQEAgLTE1Miw2ICsxNTMsMTQgQEAgc3Ry
dWN0IHBzcF9oZGNwX2NvbnRleHQgewogCXZvaWQJCQkqaGRjcF9zaGFyZWRfYnVmOwogfTsKIAor
c3RydWN0IHBzcF9kdG1fY29udGV4dCB7CisJYm9vbAkJCWR0bV9pbml0aWFsaXplZDsKKwl1aW50
MzJfdAkJc2Vzc2lvbl9pZDsKKwlzdHJ1Y3QgYW1kZ3B1X2JvCSpkdG1fc2hhcmVkX2JvOworCXVp
bnQ2NF90CQlkdG1fc2hhcmVkX21jX2FkZHI7CisJdm9pZAkJCSpkdG1fc2hhcmVkX2J1ZjsKK307
CisKIHN0cnVjdCBwc3BfY29udGV4dAogewogCXN0cnVjdCBhbWRncHVfZGV2aWNlICAgICAgICAg
ICAgKmFkZXY7CkBAIC0yMjEsOSArMjMwLDE0IEBAIHN0cnVjdCBwc3BfY29udGV4dAogCXVpbnQz
Ml90CQkJdGFfaGRjcF91Y29kZV9zaXplOwogCXVpbnQ4X3QJCQkJKnRhX2hkY3Bfc3RhcnRfYWRk
cjsKIAorCXVpbnQzMl90CQkJdGFfZHRtX3Vjb2RlX3ZlcnNpb247CisJdWludDMyX3QJCQl0YV9k
dG1fdWNvZGVfc2l6ZTsKKwl1aW50OF90CQkJCSp0YV9kdG1fc3RhcnRfYWRkcjsKKwogCXN0cnVj
dCBwc3BfeGdtaV9jb250ZXh0CQl4Z21pX2NvbnRleHQ7CiAJc3RydWN0IHBzcF9yYXNfY29udGV4
dAkJcmFzOwogCXN0cnVjdCBwc3BfaGRjcF9jb250ZXh0IAloZGNwX2NvbnRleHQ7CisJc3RydWN0
IHBzcF9kdG1fY29udGV4dAkJZHRtX2NvbnRleHQ7CiAJc3RydWN0IG11dGV4CQkJbXV0ZXg7CiB9
OwogCkBAIC0yOTYsNiArMzEwLDcgQEAgaW50IHBzcF9yYXNfaW52b2tlKHN0cnVjdCBwc3BfY29u
dGV4dCAqcHNwLCB1aW50MzJfdCB0YV9jbWRfaWQpOwogaW50IHBzcF9yYXNfZW5hYmxlX2ZlYXR1
cmVzKHN0cnVjdCBwc3BfY29udGV4dCAqcHNwLAogCQl1bmlvbiB0YV9yYXNfY21kX2lucHV0ICpp
bmZvLCBib29sIGVuYWJsZSk7CiBpbnQgcHNwX2hkY3BfaW52b2tlKHN0cnVjdCBwc3BfY29udGV4
dCAqcHNwLCB1aW50MzJfdCB0YV9jbWRfaWQpOworaW50IHBzcF9kdG1faW52b2tlKHN0cnVjdCBw
c3BfY29udGV4dCAqcHNwLCB1aW50MzJfdCB0YV9jbWRfaWQpOwogCiBpbnQgcHNwX3JsY19hdXRv
bG9hZF9zdGFydChzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCk7CiAKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91Y29kZS5oIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3Vjb2RlLmgKaW5kZXggYzJiNTkzYWI3NDk1Li40MTA1ODdiOTUwZjMg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91Y29kZS5oCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91Y29kZS5oCkBAIC0xMTEsNiAr
MTExLDkgQEAgc3RydWN0IHRhX2Zpcm13YXJlX2hlYWRlcl92MV8wIHsKIAl1aW50MzJfdCB0YV9o
ZGNwX3Vjb2RlX3ZlcnNpb247CiAJdWludDMyX3QgdGFfaGRjcF9vZmZzZXRfYnl0ZXM7CiAJdWlu
dDMyX3QgdGFfaGRjcF9zaXplX2J5dGVzOworCXVpbnQzMl90IHRhX2R0bV91Y29kZV92ZXJzaW9u
OworCXVpbnQzMl90IHRhX2R0bV9vZmZzZXRfYnl0ZXM7CisJdWludDMyX3QgdGFfZHRtX3NpemVf
Ynl0ZXM7CiB9OwogCiAvKiB2ZXJzaW9uX21ham9yPTEsIHZlcnNpb25fbWlub3I9MCAqLwpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMF8wLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjEwXzAuYwppbmRleCBhNDNkN2JhZmU5NTQuLjZkZWM1
ZmJjMjY3OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMF8w
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMF8wLmMKQEAgLTk5LDgg
Kzk5LDE1IEBAIHN0YXRpYyBpbnQgcHNwX3YxMF8wX2luaXRfbWljcm9jb2RlKHN0cnVjdCBwc3Bf
Y29udGV4dCAqcHNwKQogCQkJKHVpbnQ4X3QgKil0YV9oZHIgKwogCQkJbGUzMl90b19jcHUodGFf
aGRyLT5oZWFkZXIudWNvZGVfYXJyYXlfb2Zmc2V0X2J5dGVzKTsKIAotCQlhZGV2LT5wc3AudGFf
ZndfdmVyc2lvbiA9Ci0JCQlsZTMyX3RvX2NwdSh0YV9oZHItPmhlYWRlci51Y29kZV92ZXJzaW9u
KTsKKwkJYWRldi0+cHNwLnRhX2Z3X3ZlcnNpb24gPSBsZTMyX3RvX2NwdSh0YV9oZHItPmhlYWRl
ci51Y29kZV92ZXJzaW9uKTsKKworCQlhZGV2LT5wc3AudGFfZHRtX3Vjb2RlX3ZlcnNpb24gPQor
CQkJbGUzMl90b19jcHUodGFfaGRyLT50YV9kdG1fdWNvZGVfdmVyc2lvbik7CisJCWFkZXYtPnBz
cC50YV9kdG1fdWNvZGVfc2l6ZSA9CisJCQlsZTMyX3RvX2NwdSh0YV9oZHItPnRhX2R0bV9zaXpl
X2J5dGVzKTsKKwkJYWRldi0+cHNwLnRhX2R0bV9zdGFydF9hZGRyID0KKwkJCSh1aW50OF90ICop
YWRldi0+cHNwLnRhX2hkY3Bfc3RhcnRfYWRkciArCisJCQlsZTMyX3RvX2NwdSh0YV9oZHItPnRh
X2R0bV9vZmZzZXRfYnl0ZXMpOwogCX0KIAogCXJldHVybiAwOwotLSAKMi4xNy4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
