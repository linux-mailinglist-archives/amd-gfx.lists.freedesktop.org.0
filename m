Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EBB898A2
	for <lists+amd-gfx@lfdr.de>; Mon, 12 Aug 2019 10:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC1E6E4A5;
	Mon, 12 Aug 2019 08:22:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800059.outbound.protection.outlook.com [40.107.80.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F356E4A5
 for <amd-gfx@lists.freedesktop.org>; Mon, 12 Aug 2019 08:22:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mgjhKfijdktqYCqOEkx30UpYg0pcj9ct6WH1mCrdxJ/pioOdhtgE6mzwHA4PaUA04FU4kQ3TzF3i7f/6jOR3RAlepnRorBrDXGNKECr2jmfmg7wpXTACbXTrgI17dQe/molXogiOZR3yinRN07RvwHQh4+OwTL7h8oqYwoQW9cWhVJnLvEZlshGR23RItL6suWMylCLxeL5gPsaScMyF9nS56j52IpGw+qtvYop9wWVHDpeWwvYtLMQsv6zmo9ypyfy5W3EJNzlq9fND/87veQX8F7EQYK5ve4gi3+p4LcuT2Te7NsSJrGCI+BOQemhKH5Mwt05iDgn+8FJQI78F1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wUC0WmHktTJjA+z148HPSiqXn2gdys9JC88BJbIfBUE=;
 b=da77jPv4sMM9ZmSPGO8ycCHgmyrxafvKKFBSqYZS/1+5VZ7ggSGiflEbwai+rLtx216+qlQWJqgd63ro0Ds6KBO+iccx6DY9zPJsgCau8P9W+sVvPX+cMoGjFt7pN4w4d7cf7/N80BWcA9GkQiRtDkXNgX1C4Gcb16N7QkbulOeQz6dQNbMOAEixVmH54PkgxjEbog991p+EPPGlnLDYMLD4h+QVaP0rKkMkV2YNCjsaqba4EaMxOE/QSnp77i4EjN11eHxQ73CJaxDIVn4OqNisZm8S/LeKsggThi0/7aZ/CB+lDzOnYARwj+rx8TYItslevB8K0CXXbQ0S/V4XDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR12CA0047.namprd12.prod.outlook.com (2603:10b6:301:2::33)
 by DM5PR12MB1532.namprd12.prod.outlook.com (2603:10b6:4:6::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Mon, 12 Aug 2019 08:22:37 +0000
Received: from CO1NAM03FT038.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by MWHPR12CA0047.outlook.office365.com
 (2603:10b6:301:2::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.16 via Frontend
 Transport; Mon, 12 Aug 2019 08:22:36 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT038.mail.protection.outlook.com (10.152.81.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Mon, 12 Aug 2019 08:22:35 +0000
Received: from gc-System-Product-Name.amd.com (10.34.1.3) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; 
 Mon, 12 Aug 2019 03:22:33 -0500
From: Chengming Gui <Jack.Gui@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amd/powerplay: remove redundancy debug log about smu
 unsupported features
Date: Mon, 12 Aug 2019 16:22:17 +0800
Message-ID: <1565598138-13844-1-git-send-email-Jack.Gui@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(376002)(346002)(2980300002)(428003)(189003)(199004)(70206006)(8936002)(14444005)(53936002)(50226002)(8676002)(478600001)(70586007)(81156014)(81166006)(16586007)(4326008)(36756003)(316002)(47776003)(486006)(126002)(476003)(2616005)(426003)(336012)(53416004)(2351001)(26005)(86362001)(51416003)(186003)(7696005)(5660300002)(2906002)(48376002)(4744005)(6916009)(50466002)(6666004)(356004)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1532; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eaabb2bd-9dec-48c2-75fb-08d71efe3b52
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:DM5PR12MB1532; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1532:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1532D9EB173425EC26B42C008BD30@DM5PR12MB1532.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-Forefront-PRVS: 012792EC17
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: khXi6hrmJlypUZzw8cuz/FM0sDx/Q7WX1lfdREjJ46BFnuNQFoFR2rLxf5GW5dg/jFGoBwtBp+FLdna1xvm4gA0vnejBtQP3RrmvhCBUy2PM4GKoir/xs00cwfXtTT0EEhNRZ7nKaHWBKQK0QAdqhTGgc6mdJR2G89JWph2lZw/pmGsNdAo7VsOfwgch90i7Fk4VSIL8lykvdiUJZiteF/MA1U1UkiajIf2ve9ZZnYcvEaWNNKumm38+Q4QixasZMAOxmzu01iwSStVyDtGR1bwkG+sNyg0jAUOIn2U2t0Sj3qi34NkCiLhK4x4nldo79QUVwQdAXMzK0/7o0Z+0phfbmc/HizOo2Ocu5oLheBRQIwd1k2SpMiwoUeZ1MJ3edN7jisFbZ9w0z+RnPnu5VQWPvjwZ7pEJRiBkhej9ReA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2019 08:22:35.8838 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eaabb2bd-9dec-48c2-75fb-08d71efe3b52
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1532
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wUC0WmHktTJjA+z148HPSiqXn2gdys9JC88BJbIfBUE=;
 b=WJuST53p+w7sosJgpgA/LwUKjrCu5pVw4Dh2i7zrjqVWo3qyLFI0MEUHgDo8OiYbBXF4l5yxPdeMZ/Dp8glw6l1W6tYoWEGdN6jn+16wy5/3HuYGdXIRW/ESwvyiUF/+qz7/HgLVAs7BzvbH0FaQRGcYHPO2k6qRb3n3NA5oWBc=
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
Cc: Chengming Gui <Jack.Gui@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

cmVtb3ZlIHJlZHVuZGFuY3kgZGVidWcgbG9nIGFib3V0IHNtdSB1bnN1cHBvcnRlZCBmZWF0dXJl
cwoKU2lnbmVkLW9mZi1ieTogQ2hlbmdtaW5nIEd1aSA8SmFjay5HdWlAYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYyB8IDEgLQogMSBmaWxl
IGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2FyY3R1cnVzX3BwdC5jCmluZGV4IGU2ZmNiZGYuLjAzY2U4NzEgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jCkBAIC0yMTUsNyArMjE1LDYgQEAgc3Rh
dGljIGludCBhcmN0dXJ1c19nZXRfc211X2ZlYXR1cmVfaW5kZXgoc3RydWN0IHNtdV9jb250ZXh0
ICpzbWMsIHVpbnQzMl90IGluZGUKIAogCW1hcHBpbmcgPSBhcmN0dXJ1c19mZWF0dXJlX21hc2tf
bWFwW2luZGV4XTsKIAlpZiAoIShtYXBwaW5nLnZhbGlkX21hcHBpbmcpKSB7Ci0JCXByX3dhcm4o
IlVuc3VwcG9ydGVkIFNNVSBmZWF0dXJlOiAlZFxuIiwgaW5kZXgpOwogCQlyZXR1cm4gLUVJTlZB
TDsKIAl9CiAKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
