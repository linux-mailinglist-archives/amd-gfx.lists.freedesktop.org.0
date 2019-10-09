Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC13CD1A89
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 23:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B39E66EA6C;
	Wed,  9 Oct 2019 21:06:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6E76EA68
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2019 21:06:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KJtsdAT6MKdQ1dqghNbG5MnCGWRoZlkS9JNf8+5tlY5iIvO8+0VJH9TyPMf4YNnGqQKgaCBZPw5tyooZ67kYM7xjyia5wGITmBIutWgHm8YpFGWPyEagQt22crgN04Vpy0Y+aB6gDZP71lW9mGrt+XoQ7RngS+aLbtXqvunvmL6U9OtB0FeVbzTnZ+k78NQ/rhN+tFZtG5Fyr7SZXlDyQj8ZGFmW1af+l9cdvUBK3Vms09wpaOrbOVL/vj11WssTef8jcoNLFDeJX2bcO92rvIqqj3aBHrWqKevdW/bcmAw2DIRW06lnyMset8yIohtdk92IzFn3Kk/p4BUOrz4h1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mvlERoL7pxVo2aOsbApTegazePR98LjG/78Pn4OpEiE=;
 b=G00G4ScqcMz5MOFZHbG4FY089UIoLLKNkXPH7KzQwMLqhW3EulSGXzcpzSR3ZCwqR7P6qvw7BP8TZlsBlB+TvH+MRe52EDBfkcZ39Wm1h/O81TyKl8PmUNNp6n99qFRf9Vfv2sWL6t8wiXkOn2HxbrpZSfwTa2yH139Cbenu8ciY6Y+9Kepi2HvnRrz/kV36FkjmKzsG0XdNqk4EMbGMJWYxQLv05dswhpVzNLttfccWZMRVzhKhJ5NEtA4cz0eFiphUyuWC9hngAEifDyFuLfKdBizuodyJiUJfen3WYOSwrahB2sOHnad4uE9XfXoN1+2MaHCD+9hwYmdq4vS3JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0029.namprd12.prod.outlook.com (2603:10b6:5:1c0::42)
 by CY4PR12MB1493.namprd12.prod.outlook.com (2603:10b6:910:11::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.24; Wed, 9 Oct
 2019 21:06:28 +0000
Received: from DM3NAM03FT032.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::206) by DM6PR12CA0029.outlook.office365.com
 (2603:10b6:5:1c0::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.17 via Frontend
 Transport; Wed, 9 Oct 2019 21:06:27 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT032.mail.protection.outlook.com (10.152.82.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 9 Oct 2019 21:06:27 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 9 Oct 2019
 16:06:27 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 17/26] drm/amd/display: update renoir bounding box and res_caps
Date: Wed, 9 Oct 2019 17:06:04 -0400
Message-ID: <20191009210613.17929-18-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
References: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(396003)(346002)(428003)(199004)(189003)(186003)(54906003)(4326008)(8936002)(16586007)(316002)(76176011)(70586007)(70206006)(486006)(6916009)(36756003)(478600001)(50466002)(26005)(86362001)(50226002)(81156014)(126002)(5660300002)(6666004)(476003)(7696005)(11346002)(356004)(81166006)(2906002)(47776003)(8676002)(51416003)(48376002)(446003)(336012)(1076003)(305945005)(53416004)(426003)(2616005)(2351001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1493; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c5e64f8-ec59-419e-4e8d-08d74cfc8d21
X-MS-TrafficTypeDiagnostic: CY4PR12MB1493:
X-Microsoft-Antispam-PRVS: <CY4PR12MB149373538FDE03755E20E9FAF9950@CY4PR12MB1493.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-Forefront-PRVS: 018577E36E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p562ZBJiADzBIWVdl864lvlt8mheUOei36e9Lqlj2yBIFgz0JKaY9buIPf/gJkLz8wByIxWOADapDn9NENrW6fZjq4w7P+0xg59swFNRzZJk6EXCTiywBTfoXLyTqzs9vJhA9NWfFtW4hmJjwMD7SST5mrQaxW7yQMuGJNwAgGVcgsNSmYbVd+2098wy2zw2IUB7u3Mvk6+QJHttyq6BpZLE5qmvWBwTmEgsHqQXCmLunsYFbW92k87zT0mdA7p1ffLSLdoA1raATmNs9S9FzbGuDV+hFrB29qQ6Vj839QM0WutBQ7pMNJDRTgM9Lw9z/uFt/dJh1m7Ob5wROogFQNmb15H88GLNJPsxKQ4zuroqxZ9wVdyHEGMrbg1fZ/NtRz7YQXqCA8Lqj3x68uPMC9IZLhMLGBGhyANMSv/f1w8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 21:06:27.8153 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c5e64f8-ec59-419e-4e8d-08d74cfc8d21
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1493
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mvlERoL7pxVo2aOsbApTegazePR98LjG/78Pn4OpEiE=;
 b=sFnCRMA9ncGFkloFgvLCUJhJiRAiFi8TKr2eBWIXY3ZyVh1RsX/zGE6XmpCWTiCTQNsntYo2oCngG+k/syiVM5iLD3DthRbboNPtdJVqF88YjeHrFTZxeOp4abHog+ZCxjZcgf98Xl15h3CCiHL6p26/Px7HspRLtv+4fdJJ+Hs=
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

VGhlIHZhbHVlcyBmb3IgYm91bmRpbmcgYm94IGFuZCByZXNfY2FwcyB3ZXJlIGluY29ycmVjdC4g
U28KRml4IHRoZW0KClNpZ25lZC1vZmYtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVl
dC5MYWtoYUBhbWQuY29tPgotLS0KIC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFf
cmVzb3VyY2UuYyB8IDI0ICsrKysrKysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBp
bnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfcmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9yZXNvdXJjZS5jCmluZGV4IDVlMTVmODAwYTlm
MS4uMDAyZTdmYjY3MDY4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNuMjEvZGNuMjFfcmVzb3VyY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNuMjEvZGNuMjFfcmVzb3VyY2UuYwpAQCAtODIsNiArODIsNyBAQAogCiAKIHN0cnVj
dCBfdmNzX2RwaV9pcF9wYXJhbXNfc3QgZGNuMl8xX2lwID0geworCS5vZG1fY2FwYWJsZSA9IDEs
CiAJLmdwdXZtX2VuYWJsZSA9IDAsCiAJLmhvc3R2bV9lbmFibGUgPSAwLAogCS5ncHV2bV9tYXhf
cGFnZV90YWJsZV9sZXZlbHMgPSAxLApAQCAtMjAzLDExICsyMDQsMTEgQEAgc3RydWN0IF92Y3Nf
ZHBpX3NvY19ib3VuZGluZ19ib3hfc3QgZGNuMl8xX3NvYyA9IHsKIAkJCQkuc3RhdGUgPSA0LAog
CQkJCS5kY2ZjbGtfbWh6ID0gODEwLjAsCiAJCQkJLmZhYnJpY2Nsa19taHogPSAxNjAwLjAsCi0J
CQkJLmRpc3BjbGtfbWh6ID0gMTAxNS4wLAotCQkJCS5kcHBjbGtfbWh6ID0gMTAxNS4wLAotCQkJ
CS5waHljbGtfbWh6ID0gODEwLjAsCisJCQkJLmRpc3BjbGtfbWh6ID0gMTM5NS4wLAorCQkJCS5k
cHBjbGtfbWh6ID0gMTI4NS4wLAorCQkJCS5waHljbGtfbWh6ID0gMTMyNS4wLAogCQkJCS5zb2Nj
bGtfbWh6ID0gOTUzLjAsCi0JCQkJLmRzY2Nsa19taHogPSAzMTguMzM0LAorCQkJCS5kc2NjbGtf
bWh6ID0gNDg5LjAsCiAJCQkJLmRyYW1fc3BlZWRfbXRzID0gNDI2Ni4wLAogCQkJfSwKIAkJCS8q
RXh0cmEgc3RhdGUsIG5vIGRpc3BjbGsgcmFtcGluZyovCkBAIC0yMTUsMTggKzIxNiwxOCBAQCBz
dHJ1Y3QgX3Zjc19kcGlfc29jX2JvdW5kaW5nX2JveF9zdCBkY24yXzFfc29jID0gewogCQkJCS5z
dGF0ZSA9IDUsCiAJCQkJLmRjZmNsa19taHogPSA4MTAuMCwKIAkJCQkuZmFicmljY2xrX21oeiA9
IDE2MDAuMCwKLQkJCQkuZGlzcGNsa19taHogPSAxMDE1LjAsCi0JCQkJLmRwcGNsa19taHogPSAx
MDE1LjAsCi0JCQkJLnBoeWNsa19taHogPSA4MTAuMCwKKwkJCQkuZGlzcGNsa19taHogPSAxMzk1
LjAsCisJCQkJLmRwcGNsa19taHogPSAxMjg1LjAsCisJCQkJLnBoeWNsa19taHogPSAxMzI1LjAs
CiAJCQkJLnNvY2Nsa19taHogPSA5NTMuMCwKLQkJCQkuZHNjY2xrX21oeiA9IDMxOC4zMzQsCisJ
CQkJLmRzY2Nsa19taHogPSA0ODkuMCwKIAkJCQkuZHJhbV9zcGVlZF9tdHMgPSA0MjY2LjAsCiAJ
CQl9LAogCiAJCX0sCiAKLQkuc3JfZXhpdF90aW1lX3VzID0gOS4wLAotCS5zcl9lbnRlcl9wbHVz
X2V4aXRfdGltZV91cyA9IDExLjAsCisJLnNyX2V4aXRfdGltZV91cyA9IDEyLjUsCisJLnNyX2Vu
dGVyX3BsdXNfZXhpdF90aW1lX3VzID0gMTcuMCwKIAkudXJnZW50X2xhdGVuY3lfdXMgPSA0LjAs
CiAJLnVyZ2VudF9sYXRlbmN5X3BpeGVsX2RhdGFfb25seV91cyA9IDQuMCwKIAkudXJnZW50X2xh
dGVuY3lfcGl4ZWxfbWl4ZWRfd2l0aF92bV9kYXRhX3VzID0gNC4wLApAQCAtNzY0LDYgKzc2NSw3
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcmVzb3VyY2VfY2FwcyByZXNfY2FwX3JuID0gewogCQku
bnVtX3BsbCA9IDUsICAvLyBtYXliZSAzIGJlY2F1c2UgdGhlIGxhc3QgdHdvIHVzZWQgZm9yIFVT
Qi1jCiAJCS5udW1fZHdiID0gMSwKIAkJLm51bV9kZGMgPSA1LAorCQkubnVtX3ZtaWQgPSAxLAog
I2lmZGVmIENPTkZJR19EUk1fQU1EX0RDX0RTQ19TVVBQT1JUCiAJCS5udW1fZHNjID0gMywKICNl
bmRpZgpAQCAtODMzLDcgKzgzNSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGNfZGVidWdfb3B0
aW9ucyBkZWJ1Z19kZWZhdWx0c19kcnYgPSB7CiAJCS5kaXNhYmxlX2RjYyA9IERDQ19FTkFCTEUs
CiAJCS52c3Jfc3VwcG9ydCA9IHRydWUsCiAJCS5wZXJmb3JtYW5jZV90cmFjZSA9IGZhbHNlLAot
CQkubWF4X2Rvd25zY2FsZV9zcmNfd2lkdGggPSA1MTIwLC8qdXB0byA1SyovCisJCS5tYXhfZG93
bnNjYWxlX3NyY193aWR0aCA9IDM4NDAsCiAJCS5kaXNhYmxlX3BwbGliX3dtX3JhbmdlID0gZmFs
c2UsCiAJCS5zY2xfcmVzZXRfbGVuZ3RoMTAgPSB0cnVlLAogCQkuc2FuaXR5X2NoZWNrcyA9IHRy
dWUsCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
