Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEAC1B01B
	for <lists+amd-gfx@lfdr.de>; Mon, 13 May 2019 08:01:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69762894EB;
	Mon, 13 May 2019 06:01:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710069.outbound.protection.outlook.com [40.107.71.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BBA1894EB
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 May 2019 06:01:45 +0000 (UTC)
Received: from BN6PR12CA0028.namprd12.prod.outlook.com (2603:10b6:405:70::14)
 by DM5PR1201MB0060.namprd12.prod.outlook.com (2603:10b6:4:54::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1878.25; Mon, 13 May
 2019 06:01:43 +0000
Received: from DM3NAM03FT010.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::207) by BN6PR12CA0028.outlook.office365.com
 (2603:10b6:405:70::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.21 via Frontend
 Transport; Mon, 13 May 2019 06:01:43 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT010.mail.protection.outlook.com (10.152.82.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Mon, 13 May 2019 06:01:42 +0000
Received: from monk-build.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Mon, 13 May 2019
 01:01:41 -0500
From: Monk Liu <Monk.Liu@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: suppress repeating tmo report
Date: Mon, 13 May 2019 14:01:38 +0800
Message-ID: <1557727298-21050-1-git-send-email-Monk.Liu@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(376002)(346002)(396003)(39860400002)(2980300002)(428003)(199004)(189003)(53416004)(2616005)(476003)(336012)(426003)(6666004)(356004)(36756003)(23676004)(86362001)(126002)(26005)(77096007)(186003)(14444005)(47776003)(305945005)(478600001)(72206003)(66574012)(316002)(6916009)(5820100001)(4744005)(50466002)(2906002)(4326008)(53936002)(5660300002)(70206006)(81166006)(70586007)(486006)(7696005)(68736007)(81156014)(2351001)(8676002)(50226002)(8936002)(2870700001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0060; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0234305a-2a15-4d83-6099-08d6d768795a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:DM5PR1201MB0060; 
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0060:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0060B61FA5974F936837608D840F0@DM5PR1201MB0060.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-Forefront-PRVS: 0036736630
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: zN+Ue/ydWogexgZoYGWJXZmWdZWTq+P+atPlc0ONMT340UgCRoh5ZnYHM7hmdvLQsHvjYMAfhmKbvibhWEgS3c5DHe2HoC40c/bcH+evY0WAekTfNbsDTpCE4/7emKRaQeUlCbXtsI6+fnF81bB/Mkw5nAyCopzwpbW5fntv6O4nqMjIJth0tyfp/b05/dUhlFigP7rXCGwJ6csaWnonIPO09z72utq3SrcOQVI3JiB3RMr5hBbItFuJteixmO7I9vkNZTO8osFRfQdgungEZZN/UCKUTE2KIMHZ154ZWo8hrvV6lt++lQwST7g7thWj/ThKFV7SQvE+frIi2AMxmRDOtEHzAxGq0T86T64fkLwFJcCCnC0OznRhW5pPAcV5HAHnHLGHIkKQt2kfLeJ6yU+Wh22gv7Uo5G7M+2jJbZY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2019 06:01:42.9320 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0234305a-2a15-4d83-6099-08d6d768795a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0060
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdMn2wrgoaPQwBAG572p4nHek5RF+M8CK1ZJKpjEOds=;
 b=zNXXoneB47CrQK7hdqYywM1NAQWFgTXrBgdHrkpmjCj0dOwWhU4aaHuHSBvnNN10waO5RaASUcMH+ZjW3nTcx+1xlYpDUQiOiU6drj4DzR6Fb5WjDGjL65T5vaL4nx0WXmrhaWL/AI7femWWs2leETOrVbSH5nW2lDm2jvJFl7Q=
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
Cc: Monk Liu <Monk.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

b25seSByZXBvcnQgb25jZSBwZXIgVE1PIGpvYiBhbmQgdGhlIHRpbWVyIHdvdWxkCmJlIHJlc3Rh
cnRlZCB1cG9uIHRoZSBqb2IgZmluaXNoZWQgaWYgaXQncyBqdXN0IHNsb3cuCgpTdWdnZXN0ZWQt
Ynk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KU2lnbmVkLW9m
Zi1ieTogTW9uayBMaXUgPE1vbmsuTGl1QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2pvYi5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2Iu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2IuYwppbmRleCAxMzk3OTQy
Li4xNTAwYmI5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
am9iLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5jCkBAIC01
MSw2ICs1MSw4IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9qb2JfdGltZWRvdXQoc3RydWN0IGRybV9z
Y2hlZF9qb2IgKnNfam9iKQogCiAJaWYgKGFtZGdwdV9kZXZpY2Vfc2hvdWxkX3JlY292ZXJfZ3B1
KHJpbmctPmFkZXYpKQogCQlhbWRncHVfZGV2aWNlX2dwdV9yZWNvdmVyKHJpbmctPmFkZXYsIGpv
Yik7CisJZWxzZQorCQlkcm1fc2NoZWRfc3VzcGVuZF90aW1lb3V0KCZyaW5nLT5zY2hlZCk7CiB9
CiAKIGludCBhbWRncHVfam9iX2FsbG9jKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1bnNp
Z25lZCBudW1faWJzLAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
