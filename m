Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A2171428
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 10:41:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3DF06E29B;
	Tue, 23 Jul 2019 08:41:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760054.outbound.protection.outlook.com [40.107.76.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C696E29B
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 08:41:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cq/iphER8bWICJmA+4OHZc0UWIp2FveKqQh5+h2Juns6kXoMOnXE1ulQP3rP4CN6AKVprm48LR7jQr2leaRTdmwhWryk5iymRs+X3foYot8xVR+ko7kqN2Ym1gYqhlZwz6ZirjwxVYL90jhv1PDvDPlvXr6pC67WvP7V2vyutQA8aN9qQf6XmO2zp4BjVQdPnEAy7s6HJCdPyw9qF5fHlIIh21K+ycIqjB/wRmveDOjt5bg7i+S8viDvIAZPS2rUtAZQu7MYSpnaKqTUNW8k0lQcRFe4RFYmeIPV0tY/mlRPQgArR88lhi9YwdAYWhiYVc19UBs3hGFqkYGENVHHhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smirFUxKrjSvIe8//Mc0SRWognopvxh5YJLZ5hdQ530=;
 b=bBGAgskdlI+ee5IXPfNXK210JkSmOhjOhHHBngN6Kek5UCmoouJjCfkXHqh12dM8wgUyJzeBrRjDFsf1LgVCoGyT+z/GYMwd5k6YlsTnnLB+5MwRf0JyoSdCc+RKD13A/QQJNPGq4xZMleXnt4fyiEMgm9gyN3XvY/hc8EZiOloKiSaWzat1dW/qiascsIOfsL8B8c0W6cemWi/M0IdwUxqj78MGek5qTpJ7C75POonC7w720t5ja8EtoEn39a1jFJZJqTzxnH1z2qO795kfjSheC3zIfNYthhBtoMnawWoZkHWlhKoxbMjFsdM/u6W3LBYEO2moYM9Vb1hQSEXtLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CY4PR12CA0030.namprd12.prod.outlook.com (2603:10b6:903:129::16)
 by CY4PR12MB1304.namprd12.prod.outlook.com (2603:10b6:903:41::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16; Tue, 23 Jul
 2019 08:41:34 +0000
Received: from CO1NAM03FT042.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by CY4PR12CA0030.outlook.office365.com
 (2603:10b6:903:129::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2094.15 via Frontend
 Transport; Tue, 23 Jul 2019 08:41:34 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT042.mail.protection.outlook.com (10.152.81.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 23 Jul 2019 08:41:33 +0000
Received: from equan-buildpc.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 23 Jul 2019
 03:41:32 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amd/powerplay: no pptable transfer and dpms enabled
 with "dpm=0"
Date: Tue, 23 Jul 2019 16:41:11 +0800
Message-ID: <20190723084112.11439-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(39860400002)(346002)(2980300002)(428003)(199004)(189003)(6916009)(8936002)(44832011)(2616005)(476003)(47776003)(81166006)(81156014)(1076003)(426003)(50226002)(2906002)(126002)(4744005)(2870700001)(53416004)(486006)(26005)(478600001)(186003)(4326008)(36756003)(5660300002)(86362001)(356004)(8676002)(6666004)(53936002)(316002)(7696005)(48376002)(68736007)(51416003)(70586007)(2351001)(50466002)(336012)(70206006)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1304; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2342fa22-1195-4e42-26a3-08d70f499127
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1304; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1304:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1304CFFB16F557666D2982DBE4C70@CY4PR12MB1304.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-Forefront-PRVS: 0107098B6C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: XK0TFOhHsUhL9cgcVZtSob365ZQfobTfhC8NU7UVId46TvGUhZcMzUHToBuTyI9tYbhQBFk+CFoTxTYgRpiBe9E+u5/jvBz6paX3rfhxZzVIMLm0RDL12jZl67dJopNehMRf5NxcbG7n2v1uBdwGwXd3yVwWIKpGgUtF3QpRgnao2AIKa3A9dqrdBXQCFMAB3OEiNsvUrMdnIY9p10wxPk0OTuYxJ5FzmJxPbDqxQ9WDDjPnjwzvFfGdjb5z4x89V8onaNeZuogZi2rDTWXqe0u4ahoJa09jQjs1telWFdn00suoVozfv2o/p8qX2lZ09p66/M8+CEcfLOnYvkk0aBNMkuMOgdbQy9kjHGhYri/PqNObHRLBrfX/cNmPfCyYaAdw2O+CmBfhWNk2BBfcQBUcKTAlICSMEdSDWmN4P7A=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2019 08:41:33.6024 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2342fa22-1195-4e42-26a3-08d70f499127
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1304
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smirFUxKrjSvIe8//Mc0SRWognopvxh5YJLZ5hdQ530=;
 b=if6BP1g9vfPWHvoGUs90L8p0EeGPqerTVTgSQBe4mQt0b+0S9R9Ji5QLjNZjpMHAooQlZ3or/XhBbk1r8s2F2HRT0mC35J1XaWGFbgal0DGllO2JVn8a6IGPj9uV16OeN/sCxGSXRXVAw5l1E09YdNDpJrbKnNIlEtYCREu4hEE=
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
Cc: Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SG9ub3IgdGhlICdkcG0nIG1vZHVsZSBwYXJhbWV0ZXIgc2V0dGluZyBvbiBTVyBTTVUgcm91dGlu
ZSBhcyB3aGF0CndlIGRpZCBvbiBwcmV2aW91cyBBU0lDcy4gU01VIEZXIGxvYWRpbmcgaXMgc3Rp
bGwgcHJvY2VlZGVkIGV2ZW4Kd2l0aCAiZHBtPTAiLgoKQ2hhbmdlLUlkOiBJNGUyYmQ0MzQwMzVj
MzE1MzkxZDBjMGNiYWJiNmFjOGM2ZjIzZjIzOQpTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1YW4gPGV2
YW4ucXVhbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdw
dV9zbXUuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCmluZGV4IDY5MzVhMDBjZDM4OS4u
MjY2NjE0ZTI3MzkyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9h
bWRncHVfc211LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3Nt
dS5jCkBAIC0xMDM3LDYgKzEwMzcsOSBAQCBzdGF0aWMgaW50IHNtdV9od19pbml0KHZvaWQgKmhh
bmRsZSkKIAkJfQogCX0KIAorCWlmICghc211LT5wbV9lbmFibGVkKQorCQlyZXR1cm4gMDsKKwog
CXJldCA9IHNtdV9mZWF0dXJlX2luaXRfZHBtKHNtdSk7CiAJaWYgKHJldCkKIAkJZ290byBmYWls
ZWQ7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
