Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA93884E7
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 23:38:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3756EEA3;
	Fri,  9 Aug 2019 21:38:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730073.outbound.protection.outlook.com [40.107.73.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351FA6EEAB
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 21:38:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BlEmZoFDijp24JIZH9vtFggKjmsyNwzoLaAt+3QWAxcgEvjr0sBnE40WEN6p1DI79h8LdawD4AKa1zBszEBLpK4rARlrhUZpjDdQ5eiUIkIBH5qaqUuTiJ/j2xZJ/0X02BRQX1jS2zrktah2wijHtSV/OQMUw+Wjlr7wwIz00L60j7HyscMzaecGnKqmpwKLkSOIFVONlqh9BxX1XZPH6IMwMbP7ecMcEKNUrhsDrPRccvpgQH3me5dMcLdgs+AX4qxeFUUXg5Ao4sjXCUFxLg7VMjcgOjYs9tiYJNlFuUS9FVCgzX9coX2J1cqwn+0tXZqP9IKE/Y305igQfmHpLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uoSQEid4eWxn8cIi9njngASg3r3ZHA2RFG3k4n6TVEs=;
 b=T+4koP1Qv6VIO8X9yw9oabLpjiwqNq1+hWRAQp9zfIytCXm7Go7xa0QPEBCNO+j7j6Te0hs5xrEYs+VG03WqQt04epqpl6RCKd3oFYu97eOZwNW2BT5JxsQZV9qXX4yjgnyI1ZT1N3zc0Gyj2WLHfJRHJVGJ6XOWda4q60dvAWzFOOFaXqJsw2kUY+ybYKn2XpGOkplhumrP8I5IrURwdwWbaqKcd9ilU6pit3owDECF0yLnoWQTz2jOiZnMr435MVZwjl6TeXK3sAXSfa8BKxaFrtW4ZuEEqPfogTDgtuefSk2EfiuGYsNwuNJgxxYqbsH2amXlr1Kjrlf3Gab21w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CY4PR12CA0028.namprd12.prod.outlook.com (2603:10b6:903:129::14)
 by MWHPR12MB1278.namprd12.prod.outlook.com (2603:10b6:300:10::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.17; Fri, 9 Aug
 2019 21:38:22 +0000
Received: from BY2NAM03FT003.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::201) by CY4PR12CA0028.outlook.office365.com
 (2603:10b6:903:129::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.16 via Frontend
 Transport; Fri, 9 Aug 2019 21:38:22 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT003.mail.protection.outlook.com (10.152.84.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Fri, 9 Aug 2019 21:38:22 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Fri, 9 Aug 2019 16:38:14 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 08/49] drm/amd/display: Improve sharing of HUBBUB register
 lists
Date: Fri, 9 Aug 2019 17:37:01 -0400
Message-ID: <20190809213742.30301-9-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190809213742.30301-1-sunpeng.li@amd.com>
References: <20190809213742.30301-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(136003)(376002)(396003)(39860400002)(346002)(2980300002)(428003)(199004)(189003)(51416003)(446003)(2870700001)(48376002)(11346002)(8936002)(4326008)(426003)(486006)(50466002)(86362001)(2906002)(50226002)(36756003)(53936002)(336012)(2351001)(305945005)(6916009)(54906003)(186003)(76176011)(316002)(2876002)(356004)(5660300002)(1076003)(81166006)(81156014)(8676002)(126002)(6666004)(478600001)(476003)(26005)(70206006)(70586007)(47776003)(49486002)(2616005)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1278; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ebd33188-73da-4687-2771-08d71d11e705
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1278; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1278:
X-Microsoft-Antispam-PRVS: <MWHPR12MB12789831A710C6F47F1C450F82D60@MWHPR12MB1278.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:345;
X-Forefront-PRVS: 01244308DF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: rP6Qdlto4MG/hMuZfXTc5lEUDe0RKoGMII+lzMGCb8DzaMv15DtzMbIt6evbeqKtLqg/PpVAH2FZje3KUh+3HQKL+/ujwd/6V+MpQGQz6azv96tcbgdgnO+U36O7Aeps9Oik06P06MAPfpQuQDAf2MYbC+Jl4ppuUYos6JRNxcMdgBg36evubwZVHUCMpxkT4LgQQTCT/ZRd6dmTxrYyFCQhTispQVXnEs/fsa4DaBIXihB+LLQXkJ59Q2GyFSR82xR1k93jmY54+xhdYh0Gyr8pJOfielthljLYC8gcnzV9sN8wxi89E3r1BxvUC0L73cseSkfNiB6ncnvqizjia8G9B1K5ZI52gnj6wQC9yab+uiTD2YvkyS9hS45cfsU9daLSL25lDSNvJnb+tQa2YMClgX2ZQnSsmBpZDhJHT1g=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 21:38:22.2187 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebd33188-73da-4687-2771-08d71d11e705
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1278
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uoSQEid4eWxn8cIi9njngASg3r3ZHA2RFG3k4n6TVEs=;
 b=llP8UqXOoo4Bba0lhJ0x5SisE7bbHCWP29h7Fl9ZSW0L+0SPRkkIzGnZYraPaedb6IDKuZfmDJQEPTri/CDn3z+ZmLHF0PC/0Zjq5jHDRB5SBU+RTvlPKVEaP9U4cLH0vj5PUlhabShgmUmkXpFvXKyZDbym+l5iQRHKChUYOJU=
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
Cc: Leo Li <sunpeng.li@amd.com>, Charlene Liu <Charlene.Liu@amd.com>,
 Aric Cyr <Aric.Cyr@amd.com>, Julian Parkin <julian.parkin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSnVsaWFuIFBhcmtpbiA8anVsaWFuLnBhcmtpbkBhbWQuY29tPgoKQWRkIERDTjIwIGNv
bW1vbiByZWdpc3RlciBsaXN0IHRoYXQgY29udGFpbnMgcmVnaXN0ZXJzIHNoYXJlZApiZXR3ZWVu
IERDTjIwIGdlbmVyYXRpb25zLgoKU2lnbmVkLW9mZi1ieTogSnVsaWFuIFBhcmtpbiA8anVsaWFu
LnBhcmtpbkBhbWQuY29tPgpSZXZpZXdlZC1ieTogQ2hhcmxlbmUgTGl1IDxDaGFybGVuZS5MaXVA
YW1kLmNvbT4KQWNrZWQtYnk6IEFyaWMgQ3lyIDxBcmljLkN5ckBhbWQuY29tPgpBY2tlZC1ieTog
TGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjbjIwL2RjbjIwX2h1YmJ1Yi5oIHwgOSArKysrKystLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h1YmJ1Yi5oIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h1YmJ1Yi5oCmluZGV4IGE3YjZjYTI2YTlh
ZC4uY2FmNzI3M2NhMjQwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNuMjAvZGNuMjBfaHViYnViLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjbjIwL2RjbjIwX2h1YmJ1Yi5oCkBAIC0zMiwxMCArMzIsOCBAQAogI2RlZmluZSBUT19E
Q04yMF9IVUJCVUIoaHViYnViKVwKIAljb250YWluZXJfb2YoaHViYnViLCBzdHJ1Y3QgZGNuMjBf
aHViYnViLCBiYXNlKQogCi0jZGVmaW5lIEhVQkJVQl9SRUdfTElTVF9EQ04yMChpZClcCisjZGVm
aW5lIEhVQkJVQl9SRUdfTElTVF9EQ04yMF9DT01NT04oKVwKIAlIVUJCVUJfUkVHX0xJU1RfRENO
X0NPTU1PTigpLCBcCi0JSFVCQlVCX1ZNX1JFR19MSVNUKCksIFwKLQlIVUJCVUJfU1JfV0FURVJN
QVJLX1JFR19MSVNUKCksIFwKIAlTUihEQ0hVQkJVQl9DUkNfQ1RSTCksIFwKIAlTUihEQ05fVk1f
RkJfTE9DQVRJT05fQkFTRSksXAogCVNSKERDTl9WTV9GQl9MT0NBVElPTl9UT1ApLFwKQEAgLTQ0
LDYgKzQyLDExIEBACiAJU1IoRENOX1ZNX0FHUF9UT1ApLFwKIAlTUihEQ05fVk1fQUdQX0JBU0Up
CiAKKyNkZWZpbmUgSFVCQlVCX1JFR19MSVNUX0RDTjIwKGlkKVwKKwlIVUJCVUJfUkVHX0xJU1Rf
RENOMjBfQ09NTU9OKCksIFwKKwlIVUJCVUJfU1JfV0FURVJNQVJLX1JFR19MSVNUKCksIFwKKwlI
VUJCVUJfVk1fUkVHX0xJU1QoKQorCiAjZGVmaW5lIEhVQkJVQl9NQVNLX1NIX0xJU1RfRENOMjAo
bWFza19zaClcCiAJSFVCQlVCX01BU0tfU0hfTElTVF9EQ05fQ09NTU9OKG1hc2tfc2gpLCBcCiAJ
SFVCQlVCX01BU0tfU0hfTElTVF9TVFVUVEVSKG1hc2tfc2gpLCBcCi0tIAoyLjIyLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
