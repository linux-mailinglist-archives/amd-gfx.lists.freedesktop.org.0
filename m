Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE763D1A87
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 23:06:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF09B6EA69;
	Wed,  9 Oct 2019 21:06:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750040.outbound.protection.outlook.com [40.107.75.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0000D6EA63
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2019 21:06:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GSYBD/hOtU9zkYku5x+yc/jocD2zZC7LBSt48g6GDAa9ud2z3ld2NC/Giz9mUOfRweU2WXsuP+NU1EdLMIoVC//pocXwAPjtV1aRDPz1yHYiVAjQF/suW/qTLZ2NY1KV4XUaRQbThXK0YBbd9SmfbgtG1JwhjL7diHSxt4UBK5Q1kAnnY9Gk7uj2+LGqodSzIYD/VOgHfAIvYQ/Sib37c00zG2kCecBEC5E0Z4XF3gPm+UMwsG6CtgU4ZVZJiXWryuSbDu0R0TMte6jMbuTD1GYQ+Ilnfh07CMsOXhILrzPiS7Lv703kUeMMd1k9RfVgXD4KPloD6b6bJIQO6GBsnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+N+FFQB7HyCItox0IU8Tgl6xFeFfA6RUuQuoJvjSl5g=;
 b=B2gYsa54AxmTTsWH370rjV9FKfP8J8D/rvz31R0HAXemPHR6JMSJ5phHAAvcBKqM34ApjMi6mbUZEuLR1ofrIeEyowGJf2SQogzRETs1QZos7u7D5L5E9x6gw5sDOOTElnVaf8TrZSwfKOKbRpd/2sylBWeXBaX+JlrymCoaTu7s4X58O7j9tmZ5AAt0oeICZtG9+EV+EWI2wcO6zhqhH++KCXscp/aWsb0kvpXi1NBZlWnqbN0zfRbFSFw7eQPFf35MUGjl1b5NGbHbZ+DqHR+6eVY2vUlfO4SNkuKkmecz5SIhjIgbBoB59TFe2myB5BCLkxE//gBALcz1XLY2rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0029.namprd12.prod.outlook.com (2603:10b6:5:1c0::42)
 by MWHPR12MB1502.namprd12.prod.outlook.com (2603:10b6:301:10::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.25; Wed, 9 Oct
 2019 21:06:26 +0000
Received: from DM3NAM03FT032.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::206) by DM6PR12CA0029.outlook.office365.com
 (2603:10b6:5:1c0::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.17 via Frontend
 Transport; Wed, 9 Oct 2019 21:06:26 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT032.mail.protection.outlook.com (10.152.82.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 9 Oct 2019 21:06:26 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 9 Oct 2019
 16:06:24 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 12/26] drm/amd/display: initialize RN gpuvm context
 programming function
Date: Wed, 9 Oct 2019 17:05:59 -0400
Message-ID: <20191009210613.17929-13-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
References: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(376002)(396003)(428003)(189003)(199004)(1076003)(54906003)(8676002)(16586007)(50226002)(47776003)(8936002)(316002)(446003)(2351001)(478600001)(81166006)(305945005)(50466002)(86362001)(6916009)(2616005)(14444005)(26005)(186003)(81156014)(11346002)(53416004)(70586007)(70206006)(476003)(426003)(6666004)(336012)(7696005)(126002)(5660300002)(4326008)(2906002)(48376002)(486006)(76176011)(36756003)(356004)(51416003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1502; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9239bbe-b5a5-4972-374a-08d74cfc8c16
X-MS-TrafficTypeDiagnostic: MWHPR12MB1502:
X-Microsoft-Antispam-PRVS: <MWHPR12MB150283339C3C5A82A42DB016F9950@MWHPR12MB1502.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:525;
X-Forefront-PRVS: 018577E36E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U8fStj3OfYxLmE9s7pvy5wN19tQFeJs3+Q6zCr5Tf/SwCn+CIVrWVHD2V3g76nQ7URNOCbjSCQYcz1WdSl4c329ajFTzeA0KX/WSMF8gtWDoNST2OEcyHX5IcxZoTfkWojPqkmghOAhreOGGjtwCuuHPNzUHeUiPmU+1lWyU4E2Sr2pT7dHWhC2dz7NYNRPfWSwmAYSeGSoL6xl9ewsPxT7Do7vk8zFgcInAay3jp/kYWufHFJaxxdxCDm+VKeMXEwf8LEJJm6rIhBhsLUnRkjsDWTkUeGje6pDirQklKVPKhMOyL3P+7yPH808YPLhvtizqkrj9AT2WoctALWdiKhMpEEj+C9PzMTUws89EfALtw/cLzWVV8o5lb/C7uWLX+gjqkW/zAABOISdeuf5tY4fTFtoivgsiv90wKBgMlnA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 21:06:26.0719 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9239bbe-b5a5-4972-374a-08d74cfc8c16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1502
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+N+FFQB7HyCItox0IU8Tgl6xFeFfA6RUuQuoJvjSl5g=;
 b=OBPJwKPwErgqcwGya8+Pah35wtLb8X5v4D4RJsXEINTfUZumC9Qy7/m9fq4sDNOK759YVfHytj2xtjqc0MsfnM4B+hmkj2xhrTfLTBD+gTsS+anemqTpoSIM1KBdONIvkBYuZ5/iS0yclvcTfthx7LkpuP9wZREZRvGeG88PwxY=
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
Cc: sunpeng.li@amd.com, Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 harry.wentland@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KClJl
bm9pciBjYW4gdXNlIHZtIGNvbnRleGVzIGFzIGxvbmcgYXMgSE9TVFZNIGlzIG9mZiBzbwp0aGlz
IHNob3VsZCBiZSBpbml0aWFsaXplZC4KClNpZ25lZC1vZmYtYnk6IERteXRybyBMYWt0eXVzaGtp
biA8RG15dHJvLkxha3R5dXNoa2luQGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWto
YSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNuMjEvZGNuMjFfaHViYnViLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfaHViYnViLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfaHViYnViLmMKaW5kZXggMjIzMmNjZjE0YmRkLi40NGY2
NGE4ZTMzZjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24y
MS9kY24yMV9odWJidWIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MjEvZGNuMjFfaHViYnViLmMKQEAgLTYyOCw3ICs2MjgsNyBAQCB2b2lkIGh1YmJ1YjIxX2FwcGx5
X0RFRENOMjFfMTQ3X3dhKHN0cnVjdCBodWJidWIgKmh1YmJ1YikKIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgaHViYnViX2Z1bmNzIGh1YmJ1YjIxX2Z1bmNzID0gewogCS51cGRhdGVfZGNodWIgPSBodWJi
dWIyX3VwZGF0ZV9kY2h1YiwKIAkuaW5pdF9kY2h1Yl9zeXNfY3R4ID0gaHViYnViMjFfaW5pdF9k
Y2h1YiwKLQkuaW5pdF92bV9jdHggPSBOVUxMLAorCS5pbml0X3ZtX2N0eCA9IGh1YmJ1YjJfaW5p
dF92bV9jdHgsCiAJLmRjY19zdXBwb3J0X3N3aXp6bGUgPSBodWJidWIyX2RjY19zdXBwb3J0X3N3
aXp6bGUsCiAJLmRjY19zdXBwb3J0X3BpeGVsX2Zvcm1hdCA9IGh1YmJ1YjJfZGNjX3N1cHBvcnRf
cGl4ZWxfZm9ybWF0LAogCS5nZXRfZGNjX2NvbXByZXNzaW9uX2NhcCA9IGh1YmJ1YjJfZ2V0X2Rj
Y19jb21wcmVzc2lvbl9jYXAsCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
