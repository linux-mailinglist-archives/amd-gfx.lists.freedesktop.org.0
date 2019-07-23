Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E71771F44
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 20:26:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 948A26E370;
	Tue, 23 Jul 2019 18:26:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690075.outbound.protection.outlook.com [40.107.69.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B319C6E370
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 18:26:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KuA+l3kEvXcvxeSC0/bHcQuX8LgbQhiGBxbvQGoy7bIapFWfoQFUN7rYQBDPEAHvw3vUWhsKdvgDRYAIirMj0iPcusSG+Oj98spNZ3fhKk1QRXk+12sZaG7fjDDadmbTWI7OojBqE9xbmD2/vqeu8N25J2efY6g9zoXe4VWZ43IAe5Xpp/ZmAw5ra4X2Y7VZCT/a5BQEBqsCgmtk6hwtcMio1Yi59Lbjb7evF8NZBYACJ57D3r2e62UVL739j1XQQ7wsWjdqDbLXGvSP2VcgiR4zhFBaVhq8CFulO87dvPxoFdX9+JW+uX+hfWOJ91/RnEpS+AVB5zYqFieN+5hq0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ns/laU/Xl48w7BLCvNSyGYLMKJZKhkGgF9VOC4LXNzA=;
 b=LZ8CoAB2OROf1v8nA9yh17RqVKUtQynczbHjAJ0844OCVYwl9zahBxPvpIf/58VAdqXGsdgW1ndIZUTwPswP5/b2Xwvlf3YmPI70l4J7/lr/jkVuFCG4IHHZ+u2r41i6cR4WdF6///1z4iQJGIEB2MDNLkMSCO+42zGsdtdvFvcmy4mjXu2qXIArjLNFjUpgfzx7hhV5P1tBXXCWaWwqQMvvlEWhV8bZHd7IXFub3tQ/fctjjdwJPpAnyA+YRFAlTtY4I4nizBKBqGtLHskpgU82sXwx3ncxVdzeT1tqDn6cVj99mpZyJI56dA4PAP6cbjFUTsA6rKG1IwFfFsetiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from BN6PR1201CA0007.namprd12.prod.outlook.com
 (2603:10b6:405:4c::17) by BN6PR1201MB2483.namprd12.prod.outlook.com
 (2603:10b6:404:a6::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.14; Tue, 23 Jul
 2019 18:26:11 +0000
Received: from BY2NAM03FT030.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::209) by BN6PR1201CA0007.outlook.office365.com
 (2603:10b6:405:4c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2094.16 via Frontend
 Transport; Tue, 23 Jul 2019 18:26:11 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT030.mail.protection.outlook.com (10.152.84.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 23 Jul 2019 18:26:10 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Tue, 23 Jul 2019 13:26:09 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 0/2] This series enables S/G for Picasso.
Date: Tue, 23 Jul 2019 14:25:33 -0400
Message-ID: <1563906335-12949-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(376002)(136003)(396003)(2980300002)(428003)(189003)(199004)(53416004)(51416003)(478600001)(7696005)(186003)(126002)(50226002)(48376002)(476003)(70206006)(36756003)(8936002)(5660300002)(2616005)(47776003)(81156014)(70586007)(6916009)(336012)(4744005)(426003)(486006)(4326008)(305945005)(54906003)(86362001)(2351001)(81166006)(26005)(16586007)(6666004)(356004)(316002)(8676002)(50466002)(68736007)(44832011)(53936002)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB2483; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6beefeaa-72d3-4582-6165-08d70f9b3cc3
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR1201MB2483; 
X-MS-TrafficTypeDiagnostic: BN6PR1201MB2483:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB2483560B4C5403098B99C2A6EAC70@BN6PR1201MB2483.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 0107098B6C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 0dtUr5G4LxmS7IaX3f0hw8T3/Qm8EUU7tg8A8BzLN7Y56DW8oy4KZNiakGpBHp+T36aK+R61tQGa0v3zy+yl/m6eEjwFLES1Ddhjdz2RQ2xBadlDE582kZ/Stb96Cl3PjrQIJqEEnU12LZaWADIWf0g+bTgdox9JjGlYnEo8cibjhiN/EmPEPKcwnnAO+sJCbWgCCSGRzU+4E8bdVgXTgZVvHSrwp4AxXPnUTIWRs7JMTmuabHDXNX8g/udidwFE5hSaZ61QvIVzwcHT2lHVDFqlaawnBJEhdh/REQEQYz9L3pBWaBwlM7Y+Y+Zd/+6+Epg6U9J221Af8iPlcTgmqvHRsBrH9WcOhIFpf+tBvovwmPd9tLMJOdKFZG+Ztb6khLbgI0pH9eZcg5ysamqIZ8Q2HUaHedrUsj7ZV+AGYfo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2019 18:26:10.7537 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6beefeaa-72d3-4582-6165-08d70f9b3cc3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB2483
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ns/laU/Xl48w7BLCvNSyGYLMKJZKhkGgF9VOC4LXNzA=;
 b=Rw4G6u9VKU4JVwBeUHdnh9Kx2WcKUBm19JQl569NXJeIX5vP/iUsg+XeQMzUclyTY+ckHdq1JEH5ezD5rc7uD5TL/8gWVa7bBhm9OXIVoYTdJq+p3x4kIwHN75gRA0Kk6BOvlEnYNatxLeXzwG/NVO8LQLuNlOk/NqqE/pUpnSY=
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
Cc: Alexander.Deucher@amd.com, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 hersenxs.wu@amd.com, Christian.Koenig@amd.com, shirish.s@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rmlyc3QgcGF0Y2ggZml4IGEgaGFyZCBoYW5nIGludHJvZHVjZWQgYnkgcGxhY2luZyB0aGUgZGlz
cGxheQpCTyBpbiBHVFQgbWVtb3J5IGJlY2F1c2Ugb2YgSFcgaXNzdWVzIHdpdGggY2FjaGVkIG1h
cHBpbmdzCmFuZCB0aGUgc2Vjb25kIHBhdGNoIGVuYWJsZXMgUy9HLgoKQW5kcmV5IEdyb2R6b3Zz
a3kgKDEpOgogIGRybS9hbWRncHU6IEZpeCBoYXJkIGhhbmcgZm9yIFMvRyBkaXNwbGF5IEJPcy4K
ClNoaXJpc2ggUyAoMSk6CiAgZHJtL2FtZDogZW5hYmxlIFMvRyBmb3IgUkFWRU4gY2hpcAoKIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNwbGF5LmMgICAgICAgfCAxMyArKysr
KysrKysrKy0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZmIuYyAgICAgICAg
ICAgIHwgIDcgKysrLS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5j
ICAgICAgICAgICB8ICAzICsrLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9k
bS9hbWRncHVfZG0uYyB8ICAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyks
IDggZGVsZXRpb25zKC0pCgotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
