Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC8FD48AB
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 21:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB1C76EC90;
	Fri, 11 Oct 2019 19:53:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720053.outbound.protection.outlook.com [40.107.72.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B78E6EC93
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 19:53:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i3zF+BBV2PBeAimdnDPUJY8zx26tA8b3YS4KHNcpNfsWfdjggXwhN8hqbdlMNArJT6plqmq3n0t5ozi+YnOcoWAHBmN2ebWHCoZRKLzdhaOit4mpRFfhfNjC5P4aFb0zVmgUFnPLxuKjcC588p2Hz2UDQPcI2zKkFygJm7gt8+vFHJ9iyCp/way3gR4z7VYQ6VK82IgZP0BbVgM3z0lmxYmYzcBX8ym8USIgB+JDhQHlF/F3K7CmX4TIqZcsSWjaLa+zgOnFpPGbW6+ws/BKtgjn18sFb6M4GwyDSG6XyoR8rr2IilhSU/e5RQHicnfkc5bRHkPPJZjB7BvMPlEmUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LpUSVfHgQuiyjJ5GaM/75bJkapfJyvpYYoZlpFpeOo=;
 b=Vii8brXbcCkcl5qXwFIgklAty75TmBcodjb6vOpcXVRHVlZ7mWba8hlgQmMHZ1hmgzs3t2UynnXxd/pDI2SgcO3+jgkowPgFnsjOTyzi1vascugoBsAwlI7qL4tc4SAfSxFlqmLMN/wxPllh5casb2oAkOmk4OJTRjtBbmQHEcj/1/AZYd6TJs3P6BBh8HPkWOnzyI8ctQEtLLGOVk7qGd/ZirJWWvf2MuttrIxkF0VgcDMeTZqpqQ760pS4/Bf5O5jo2VIMr3KP8avGcYSLnvc4n+OPPYfQQm9Yblg7vMrfMzioEw0Vdj0GesZSjsxnxZtXpEyf2Du+G0hJG8mYJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR1201CA0005.namprd12.prod.outlook.com
 (2603:10b6:405:4c::15) by MWHPR1201MB0238.namprd12.prod.outlook.com
 (2603:10b6:301:57::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.18; Fri, 11 Oct
 2019 19:53:49 +0000
Received: from BY2NAM03FT061.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::205) by BN6PR1201CA0005.outlook.office365.com
 (2603:10b6:405:4c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.17 via Frontend
 Transport; Fri, 11 Oct 2019 19:53:48 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT061.mail.protection.outlook.com (10.152.85.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2347.21 via Frontend Transport; Fri, 11 Oct 2019 19:53:47 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 11 Oct 2019
 14:53:44 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 09/29] drm/amd/display: move the bounding box patch before
 calculate wm
Date: Fri, 11 Oct 2019 15:53:04 -0400
Message-ID: <20191011195324.16268-10-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
References: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(396003)(136003)(428003)(199004)(189003)(1076003)(8936002)(426003)(5660300002)(186003)(2351001)(2616005)(53416004)(336012)(446003)(6916009)(305945005)(11346002)(7696005)(51416003)(86362001)(76176011)(48376002)(14444005)(70206006)(70586007)(2906002)(54906003)(36756003)(26005)(8676002)(81166006)(81156014)(4326008)(316002)(356004)(6666004)(486006)(478600001)(476003)(50466002)(47776003)(50226002)(126002)(16586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR1201MB0238; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 792d3a97-020b-490e-2d11-08d74e84bb43
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0238:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0238450E19D855F5986F698CF9970@MWHPR1201MB0238.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-Forefront-PRVS: 0187F3EA14
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0wp74gO92880cWtG4mGnXO+bZH3AMgKWLOxJV9jIB/xIa4kkyScxiNz+N78Fx35R4KA9gO99NGu1LmYhTSF/0pIm0N9P5DIiJ3DrwtBxL7zMTd1s9NNw2Sb3l+vAfroOGZ9FjwroGO5+dcQ36B3OGk0l36ul079Op/0pSpOoQjUR+hVZtwSmvyfec8qcLwaEEbFGfAeuX4/4iFzy2FgRUfm39JEfAkRdP5ATTz5gDaGLdntR3QaDUIN+UvVs/UObL/WMg/3FUd4LLXjdCjEUrEwSwO3YAjbDn4HGd9EYIKHx2P4Ii7UmSEllYvRmZR6EXSwEUlGxydy5wyjp4DgiS4m+CEwPDAXDLOqNFtdivnjzqfiQBaKHNZBixC5/wPMkEh04kiY4cquC+URfV7UucPOQo3nBVjgv4hDi3D6oYX0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 19:53:47.9044 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 792d3a97-020b-490e-2d11-08d74e84bb43
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0238
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LpUSVfHgQuiyjJ5GaM/75bJkapfJyvpYYoZlpFpeOo=;
 b=2R5OWAcHLRhuUHvpA4wao/Yuyn/aH/W/RqCmwaNjo3vtXpny/E8NNOT9sW1J9dV+Asfy18SGMsDt6KddrtruKoqnn8LaZzTybayUGwaBHVxbfiKl190HZudyl6Mrpiscq/jXkE5b9xZieWtxLHb33khBmCsHX0OTt+1/LMu6p1I=
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
Cc: Lewis Huang <Lewis.Huang@amd.com>, joseph graveno <joseph.gravenor@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGV3aXMgSHVhbmcgPExld2lzLkh1YW5nQGFtZC5jb20+Cgpbd2h5XQpkcml2ZXIgdXBk
YXRlaXMgdGhlIGRjbjJfMV9zb2MgaW50byBkbWwgYmVmb3JlIGNhbGwgdXBkYXRlX2J3X2JvdW5k
aW5nX2JveAoKW0hvd10KTW92ZSB0aGUgcGF0Y2ggZnVuY3Rpb24gYmVmb3JlIGNhbGN1bGF0ZSB3
bS4KClNpZ25lZC1vZmYtYnk6IExld2lzIEh1YW5nIDxMZXdpcy5IdWFuZ0BhbWQuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBqb3NlcGggZ3JhdmVubyA8am9zZXBoLmdyYXZlbm9yQGFtZC5jb20+CkFja2Vk
LWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4KLS0tCiAu
Li4vZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX3Jlc291cmNlLmMgfCAyNSArKysrKysr
KysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9yZXNvdXJjZS5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX3Jlc291cmNlLmMK
aW5kZXggZGRmNTJlMjYwZWQ2Li5lMzk5NjFkMGYyNGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9yZXNvdXJjZS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9yZXNvdXJjZS5jCkBAIC0xMDA3LDYg
KzEwMDcsMjkgQEAgc3RhdGljIHZvaWQgY2FsY3VsYXRlX3dtX3NldF9mb3JfdmxldmVsKAogCiB9
CiAKK3N0YXRpYyB2b2lkIHBhdGNoX2JvdW5kaW5nX2JveChzdHJ1Y3QgZGMgKmRjLCBzdHJ1Y3Qg
X3Zjc19kcGlfc29jX2JvdW5kaW5nX2JveF9zdCAqYmIpCit7CisJa2VybmVsX2ZwdV9iZWdpbigp
OworCWlmIChkYy0+YmJfb3ZlcnJpZGVzLnNyX2V4aXRfdGltZV9ucykgeworCQliYi0+c3JfZXhp
dF90aW1lX3VzID0gZGMtPmJiX292ZXJyaWRlcy5zcl9leGl0X3RpbWVfbnMgLyAxMDAwLjA7CisJ
fQorCisJaWYgKGRjLT5iYl9vdmVycmlkZXMuc3JfZW50ZXJfcGx1c19leGl0X3RpbWVfbnMpIHsK
KwkJYmItPnNyX2VudGVyX3BsdXNfZXhpdF90aW1lX3VzID0KKwkJCQlkYy0+YmJfb3ZlcnJpZGVz
LnNyX2VudGVyX3BsdXNfZXhpdF90aW1lX25zIC8gMTAwMC4wOworCX0KKworCWlmIChkYy0+YmJf
b3ZlcnJpZGVzLnVyZ2VudF9sYXRlbmN5X25zKSB7CisJCWJiLT51cmdlbnRfbGF0ZW5jeV91cyA9
IGRjLT5iYl9vdmVycmlkZXMudXJnZW50X2xhdGVuY3lfbnMgLyAxMDAwLjA7CisJfQorCisJaWYg
KGRjLT5iYl9vdmVycmlkZXMuZHJhbV9jbG9ja19jaGFuZ2VfbGF0ZW5jeV9ucykgeworCQliYi0+
ZHJhbV9jbG9ja19jaGFuZ2VfbGF0ZW5jeV91cyA9CisJCQkJZGMtPmJiX292ZXJyaWRlcy5kcmFt
X2Nsb2NrX2NoYW5nZV9sYXRlbmN5X25zIC8gMTAwMC4wOworCX0KKwlrZXJuZWxfZnB1X2VuZCgp
OworfQorCiB2b2lkIGRjbjIxX2NhbGN1bGF0ZV93bSgKIAkJc3RydWN0IGRjICpkYywgc3RydWN0
IGRjX3N0YXRlICpjb250ZXh0LAogCQlkaXNwbGF5X2UyZV9waXBlX3BhcmFtc19zdCAqcGlwZXMs
CkBAIC0xMDIxLDYgKzEwNDQsOCBAQCB2b2lkIGRjbjIxX2NhbGN1bGF0ZV93bSgKIAogCUFTU0VS
VChid19wYXJhbXMpOwogCisJcGF0Y2hfYm91bmRpbmdfYm94KGRjLCAmY29udGV4dC0+YndfY3R4
LmRtbC5zb2MpOworCiAJZm9yIChpID0gMCwgcGlwZV9pZHggPSAwLCBwaXBlX2NudCA9IDA7IGkg
PCBkYy0+cmVzX3Bvb2wtPnBpcGVfY291bnQ7IGkrKykgewogCQkJaWYgKCFjb250ZXh0LT5yZXNf
Y3R4LnBpcGVfY3R4W2ldLnN0cmVhbSkKIAkJCQljb250aW51ZTsKLS0gCjIuMTcuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
