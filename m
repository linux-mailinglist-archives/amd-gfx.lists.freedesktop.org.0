Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5833F69DA4
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB2F89BFD;
	Mon, 15 Jul 2019 21:21:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720083.outbound.protection.outlook.com [40.107.72.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A14D89BF6
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FccJOAtzYnym6PNyIfLvfIYGMb4r4uzoSdeESHfTk42r7J+owjtmw3s3ecu2KP+m8UCR3HhLrgTgS6ZmqDIVd/NSCUfyZg1fldvSQ4ViquydXBXC6PvEZSqDVi4GAkhYvSb1l6j3NNTEX45WoLfMiNvyTYDrEGn19YDdnQ+rgqgx2jaGLQWGcKPlBJJxE0rsDqw/JgfzsQnUdiWid2USn1YRaE4kI0d6eRoN7D7iudp7XOQ7z0MOYlYXLZXG4EcXCFFfZchpv4YWU2c59GM+AuGsne2hNiDqyrIAnOM0WHEkxwZMh7IBkc+4W4FyeNwjnzF9Gjhf/AL/S1wY/sfSrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fg2uTCo9TOTR66MSib4DzKFmZw8E1VAyDw44Mm3xAls=;
 b=TCJ4+zxNnfemnBIc7IlYblDwsl/rf/9hAc9M8/zG1/hwQ/cBkUrTleXBcFHslU8uoUc98aEwywnJHZfvyBFFyFQq5CzgqC+Jf999Agg1Lc2M3pzIm8gsLHSFygFvaWL5becNOj+pUhmeEL3KhC+I4twPRXaKEvSJthnDw9kyk/mFgtka8nTrBvksvaraqtg5ApsFZ/FSuqJX7vA/K+3GQTwDqaooYhsan9c5NrNNy+SoiNugtrD0wyV7KnXwM5k1OCJvrjgMAMPfEymfFMc/3koQQvsxI3qYlj0n5yts1b4Ir0lkKhyNPxYS7wxVzF2PlRSgPoY3Wl00xBu+QV3TFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR12CA0040.namprd12.prod.outlook.com (2603:10b6:301:2::26)
 by MN2PR12MB3935.namprd12.prod.outlook.com (2603:10b6:208:16a::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.10; Mon, 15 Jul
 2019 21:21:24 +0000
Received: from CO1NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by MWHPR12CA0040.outlook.office365.com
 (2603:10b6:301:2::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.13 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:24 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT009.mail.protection.outlook.com (10.152.80.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:23 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:10 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 18/87] drm/amd/display: 3.2.38
Date: Mon, 15 Jul 2019 17:19:40 -0400
Message-ID: <20190715212049.4584-19-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(346002)(136003)(39860400002)(2980300002)(428003)(189003)(199004)(4326008)(47776003)(1076003)(53936002)(186003)(5660300002)(54906003)(316002)(14444005)(76176011)(51416003)(2616005)(26005)(426003)(86362001)(11346002)(446003)(486006)(336012)(478600001)(6666004)(356004)(36756003)(70586007)(8676002)(70206006)(6916009)(8936002)(305945005)(4744005)(50226002)(81166006)(49486002)(48376002)(68736007)(81156014)(476003)(2870700001)(50466002)(2351001)(126002)(2906002)(2876002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3935; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43bb99b0-df55-4983-ac25-08d7096a63c9
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MN2PR12MB3935; 
X-MS-TrafficTypeDiagnostic: MN2PR12MB3935:
X-Microsoft-Antispam-PRVS: <MN2PR12MB39351600AAC0569500421C4082CF0@MN2PR12MB3935.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 7h3u5evV3Ho/g4kkEF1vuMK638f7W33FjZ19fzuWUAHbof6GqbiB4Hb+VY029CKpsovwY8vbd0aeLPXwg/PJikGrpYQckO4rsncajOS90v+MR2sILxuejyUJAQcH9M2nNF6odhTYhcLrgiM+sW7HedsIB7oL8wsl+biThWzF8xoeZqZvDdmxrZmo7bhTLPaa64Oo4tqy5x5AA4S/E2VdJ5plsx3lGnKAZbMJv8ZrnBCiBKyyjnCI/goda5voZ+UhdhaXtsOH+WX7U24p+xDvwMZXOfdPtwIxA1LwVcluDxVB4UF6x6PyGbxbZ3k9L1UDydhFj+Yrg3Yegaa08hM9HFDb2KmaX2xySmNEsfhrfKoedA24orqKvjPtrGc7XPSu/xi8wIMa2p+a/pW70TG+M7+3kt7oZ5oJloYuB2G9Moo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:23.8510 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43bb99b0-df55-4983-ac25-08d7096a63c9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3935
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fg2uTCo9TOTR66MSib4DzKFmZw8E1VAyDw44Mm3xAls=;
 b=QyUd5fRzRMuw/n5kyfAauvAhOr3A61gFNWt8XDO7AkeXhfBSut/Irv8i2U0JM8t4q2YowiqOiV0UMmAIMxz3P5smUMoMq3buja4Zzl0xvIHs5I3ZCwg92lm3Rn0NGGmIXF0MDMzcKeEaS9NEf5bxksAcF0jhNx9yL0gMdl2UGM0=
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
Cc: Leo Li <sunpeng.li@amd.com>, Aric Cyr <aric.cyr@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQXJpYyBDeXIgPGFyaWMuY3lyQGFtZC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBBcmljIEN5
ciA8YXJpYy5jeXJAYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGMuaAppbmRleCBjMGViYjc3ZmFiNzAuLmEzMDdhM2ExY2RlNCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKQEAgLTM5LDcgKzM5LDcgQEAKICNpbmNsdWRlICJpbmMv
aHcvZG1jdS5oIgogI2luY2x1ZGUgImRtbC9kaXNwbGF5X21vZGVfbGliLmgiCiAKLSNkZWZpbmUg
RENfVkVSICIzLjIuMzciCisjZGVmaW5lIERDX1ZFUiAiMy4yLjM4IgogCiAjZGVmaW5lIE1BWF9T
VVJGQUNFUyAzCiAjZGVmaW5lIE1BWF9QTEFORVMgNgotLSAKMi4yMi4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
