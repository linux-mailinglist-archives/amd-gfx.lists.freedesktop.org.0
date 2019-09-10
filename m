Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A4CAF173
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 21:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F506E95A;
	Tue, 10 Sep 2019 19:04:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740048.outbound.protection.outlook.com [40.107.74.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 610436E95B
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 19:04:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnyIbPxUoJ5esQW5HYnaUH4jK0B55BpPm4RdcDTA5hM0Gdxfw4WB+usyeP3k5lPGL9y84CelhqjOA0aXNHkjrZetuIA5Jdtl1Q6Xt3Ey0hUWI9OWmASWjlHPmek1gH902T13zGCeGXMKLkHuzcXSvOP3ZYSyHGymlN8KcbRF28pGVTuG0SUUCQS4wKl1+rwuC/H3Z3JVQt00QcsQMs1YCke8ZD+58PORfYLJT5X8LoG9+L8Q3ZO402da8Qz1YmWxMN5aDKyRWXQFmnVXH9wn3LD3ElFnrrRBM1iyxUd/UlPCRfiNGhDkb/AOFzY+0UsPSCIH774duW4j3qPoPq9w7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AfFKKEs47F9AO82aLyOWL4B/UVJ//mmkjnj4X/LDGqU=;
 b=Fd5u2RJRcCg0VvX0+C/Mg46z44yZZcX3Xe/2B4f5JN3lw4s52329vlgo79iPc+N76hmkw/cqstmO1MISYkP0Hs/AiJg4Kwdn7Nc/bKKmbAZScKzBiJ1Atds4eI4J80xKcjq0a8cplKkpYno/iLHrv0EWSGGrtMMuFiVzTFFAFYJuVmn5SVekee9SpGUi2WgkO08NlhWIPr+ZZ3uX8enKJIIF/hdh4c0lEzfO+VigPG1yGGmC/drfDpquD0w5VyaDQN1l/SIlJn2V94nLInyyETVs8W1LGLYpEh1BUkmasi/H+sB5E+oFBWLCv9vmporP3yEwoJNWZHSCAJxJpCBUrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0024.namprd12.prod.outlook.com
 (2603:10b6:301:4a::34) by BY5PR12MB4147.namprd12.prod.outlook.com
 (2603:10b6:a03:205::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.15; Tue, 10 Sep
 2019 19:04:40 +0000
Received: from DM3NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::202) by MWHPR1201CA0024.outlook.office365.com
 (2603:10b6:301:4a::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2241.14 via Frontend
 Transport; Tue, 10 Sep 2019 19:04:39 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT048.mail.protection.outlook.com (10.152.83.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 19:04:39 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 10 Sep 2019
 14:04:35 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 17/20] drm/amd/display: handle DP cpirq
Date: Tue, 10 Sep 2019 15:04:19 -0400
Message-ID: <20190910190422.794-18-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910190422.794-1-Bhawanpreet.Lakha@amd.com>
References: <eb83ae25-7635-45de-72dc-db24571066d2@amd.com>
 <20190910190422.794-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(346002)(396003)(2980300002)(428003)(199004)(189003)(316002)(8936002)(446003)(476003)(11346002)(2616005)(81156014)(81166006)(4326008)(26005)(126002)(186003)(53936002)(426003)(6916009)(36756003)(76176011)(51416003)(486006)(336012)(50466002)(48376002)(5660300002)(50226002)(47776003)(7696005)(70206006)(16586007)(1076003)(70586007)(14444005)(86362001)(53416004)(2351001)(305945005)(6666004)(8676002)(356004)(478600001)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB4147; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab0b77e7-ba5b-4234-2708-08d73621bb1e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BY5PR12MB4147; 
X-MS-TrafficTypeDiagnostic: BY5PR12MB4147:
X-Microsoft-Antispam-PRVS: <BY5PR12MB414769D925C56252C468A9DCF9B60@BY5PR12MB4147.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: /dQv+m42cDGghZ8lYYtiw7hvsze6NaDZxznsMV766k1sAu/jg1/sBGMxVf9opS4i8PFont0P4BHeKZ3KnUlLt3EOnLMDzoQx4IakdekIX/sLuNJlAUySrcnFS/+dnydUzRLhZPiHYujDUUpE5obT3+zTXhO9/+8xRf3cv9YdKOo7m4iGJJ0EN6f+vUag1JZPkH2mGfSEp1D5CU+Qfh/9i+RXAoeenM2gdWDiWIgXs4/zG5hSVC/Joe7KPQ4q6wHFdfJjGn1+/MQt+IY6t2BoGW2yo1LPrk58OXqDYLyqhSJZubzWkXruFevU9ZqDB8mdlhjD7qqIVEWTCW1uKn2qNPApBLbZ/6wrwYG5TST5aRveXZNaOHSGXYgem/cnBxevPaElYW8q7IsnX9vmcM3ezSE6DV3D5S51dN49pa3wDeM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 19:04:39.6439 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab0b77e7-ba5b-4234-2708-08d73621bb1e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4147
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AfFKKEs47F9AO82aLyOWL4B/UVJ//mmkjnj4X/LDGqU=;
 b=2WT+bcw9ulh/CJIaGjI0At87QdbSwpvDZtTo5/JFPCgfWrIFTT2mHssxUXyFwi0efqOklItG8Ay2kdreR41KGr2i6++3YGFSE9IgXtTkpetMNAxotxlCumntXoEa7NvQ+nVmUljSDFV75oxYveMyrwMdLtk/0p7qspFAqbTyNf0=
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

W1doeV0KVGhpcyBpcyBuZWVkZWQgZm9yIERQIGFzIERQIGNhbiBzZW5kIHVzIGluZm8gdXNpbmcg
aXJxLgoKW0hvd10KQ2hlY2sgaWYgaXJxIGJpdCBpcyBzZXQgb24gc2hvcnQgcHVsc2UgYW5kIGNh
bGwgdGhlCmZ1bmN0aW9uIHRoYXQgaGFuZGxlcyBjcGlycSBpbiBhbWRncHVfZG1faGRjcAoKU2ln
bmVkLW9mZi1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+
ClJldmlld2VkLWJ5OiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMTUg
KysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmluZGV4
IDU5MWI4YWI5ZDRhZC4uYTE4OTViODczZWYyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKQEAgLTE2MTcsNiArMTYxNywxMiBAQCBz
dGF0aWMgdm9pZCBoYW5kbGVfaHBkX3J4X2lycSh2b2lkICpwYXJhbSkKIAlzdHJ1Y3QgZGNfbGlu
ayAqZGNfbGluayA9IGFjb25uZWN0b3ItPmRjX2xpbms7CiAJYm9vbCBpc19tc3Rfcm9vdF9jb25u
ZWN0b3IgPSBhY29ubmVjdG9yLT5tc3RfbWdyLm1zdF9zdGF0ZTsKIAllbnVtIGRjX2Nvbm5lY3Rp
b25fdHlwZSBuZXdfY29ubmVjdGlvbl90eXBlID0gZGNfY29ubmVjdGlvbl9ub25lOworI2lmZGVm
IENPTkZJR19EUk1fQU1EX0RDX0hEQ1AKKwl1bmlvbiBocGRfaXJxX2RhdGEgaHBkX2lycV9kYXRh
OworCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gZGV2LT5kZXZfcHJpdmF0ZTsKKworCW1l
bXNldCgmaHBkX2lycV9kYXRhLCAwLCBzaXplb2YoaHBkX2lycV9kYXRhKSk7CisjZW5kaWYKIAog
CS8qCiAJICogVE9ETzpUZW1wb3JhcnkgYWRkIG11dGV4IHRvIHByb3RlY3QgaHBkIGludGVycnVw
dCBub3QgaGF2ZSBhIGdwaW8KQEAgLTE2MjYsNyArMTYzMiwxMiBAQCBzdGF0aWMgdm9pZCBoYW5k
bGVfaHBkX3J4X2lycSh2b2lkICpwYXJhbSkKIAlpZiAoZGNfbGluay0+dHlwZSAhPSBkY19jb25u
ZWN0aW9uX21zdF9icmFuY2gpCiAJCW11dGV4X2xvY2soJmFjb25uZWN0b3ItPmhwZF9sb2NrKTsK
IAorCisjaWZkZWYgQ09ORklHX0RSTV9BTURfRENfSERDUAorCWlmIChkY19saW5rX2hhbmRsZV9o
cGRfcnhfaXJxKGRjX2xpbmssICZocGRfaXJxX2RhdGEsIE5VTEwpICYmCisjZWxzZQogCWlmIChk
Y19saW5rX2hhbmRsZV9ocGRfcnhfaXJxKGRjX2xpbmssIE5VTEwsIE5VTEwpICYmCisjZW5kaWYK
IAkJCSFpc19tc3Rfcm9vdF9jb25uZWN0b3IpIHsKIAkJLyogRG93bnN0cmVhbSBQb3J0IHN0YXR1
cyBjaGFuZ2VkLiAqLwogCQlpZiAoIWRjX2xpbmtfZGV0ZWN0X3NpbmsoZGNfbGluaywgJm5ld19j
b25uZWN0aW9uX3R5cGUpKQpAQCAtMTY2MSw2ICsxNjcyLDEwIEBAIHN0YXRpYyB2b2lkIGhhbmRs
ZV9ocGRfcnhfaXJxKHZvaWQgKnBhcmFtKQogCQkJZHJtX2ttc19oZWxwZXJfaG90cGx1Z19ldmVu
dChkZXYpOwogCQl9CiAJfQorI2lmZGVmIENPTkZJR19EUk1fQU1EX0RDX0hEQ1AKKwlpZiAoaHBk
X2lycV9kYXRhLmJ5dGVzLmRldmljZV9zZXJ2aWNlX2lycS5iaXRzLkNQX0lSUSkKKwkJaGRjcF9o
YW5kbGVfY3BpcnEoYWRldi0+ZG0uaGRjcF93b3JrcXVldWUsICBhY29ubmVjdG9yLT5iYXNlLmlu
ZGV4KTsKKyNlbmRpZgogCWlmICgoZGNfbGluay0+Y3VyX2xpbmtfc2V0dGluZ3MubGFuZV9jb3Vu
dCAhPSBMQU5FX0NPVU5UX1VOS05PV04pIHx8CiAJICAgIChkY19saW5rLT50eXBlID09IGRjX2Nv
bm5lY3Rpb25fbXN0X2JyYW5jaCkpCiAJCWRtX2hhbmRsZV9ocGRfcnhfaXJxKGFjb25uZWN0b3Ip
OwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
