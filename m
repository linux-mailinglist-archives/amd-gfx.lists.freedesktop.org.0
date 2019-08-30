Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5CFA3374
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Aug 2019 11:12:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E936E26C;
	Fri, 30 Aug 2019 09:12:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780057.outbound.protection.outlook.com [40.107.78.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA846E26C
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Aug 2019 09:12:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FyQNB93TjGZOAfmkKmlsYSN/HdKWS04E8rPVZjcsQ5KY2jmwGFDQJhOXg1uc4pKT4QbG4hJVEb/H5SBfVstuoxsmy8RdPEEyuTjdGHVrvtAL/ZPoLxU9gFuqWA9TOBNAEnBsaleXKg9licKTwOSVbwcYbDTHYCV5wzKhi0zGlf0zwb8iRHf7p4TevBZ48w1bO2Ek5q/88XTl8rYlVmi4IVp4j5ZSoVbiA/SxY96tYI5eMtuY7gIpuR1wot24Jc4wJaxDD7BxnVTyyBxAYwSVTrzE9/cW38VBNXVgu0uykcLUBSRtSZbdk4WPO2IH2xfHcf6poSUIHMz4PeN6UiBdEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1itcngERXQUca/5CtdD9JKaqTjLcdLTmh3jaOaW+amc=;
 b=XVVcA1zPRWhTUMt2olKEe0en0CCjK5xOgZfyLL4f8Wzyf5Y/Gs0wLCJoAvLtr1zspvz47igP7Nbp2II1lQ4IilUzocnvLZrftIxGK+EumO9ULMIBcGTk5ZSuEx9w9K9Quy13oGZfxIBwLEJl4xD8M1Paz+QTHO1gGPGvBwzZYSXXEyhcrNbh+UnF3ud/WDgaaDAEUBmc7fIk0YjMOJojU4zLSsGCoLzE3rkI4xkCjFRij/3N0uXJdGuUkcF9tB1j9nN9xMDXWvCZqlz8K8u26O2a0GfWkKipnpTrkoWIoco6DWq8x9WFHb62YGdBWoATsZfQyww2BxaZbf97MrQ5aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR12CA0026.namprd12.prod.outlook.com (2603:10b6:903:129::12)
 by CY4PR12MB1256.namprd12.prod.outlook.com (2603:10b6:903:3d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.19; Fri, 30 Aug
 2019 09:12:03 +0000
Received: from DM3NAM03FT011.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::207) by CY4PR12CA0026.outlook.office365.com
 (2603:10b6:903:129::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.18 via Frontend
 Transport; Fri, 30 Aug 2019 09:12:03 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT011.mail.protection.outlook.com (10.152.82.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Fri, 30 Aug 2019 09:12:02 +0000
Received: from lnx-aaliu.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Fri, 30 Aug 2019
 04:12:01 -0500
From: Aaron Liu <aaron.liu@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 1/2] drm/amdgpu: update IH_CHICKEN in oss 4.0 IP header for
 VG/RV series
Date: Fri, 30 Aug 2019 17:11:50 +0800
Message-ID: <1567156311-12872-1-git-send-email-aaron.liu@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(346002)(376002)(2980300002)(428003)(199004)(189003)(54906003)(316002)(70206006)(70586007)(44832011)(336012)(26005)(4326008)(486006)(6916009)(47776003)(426003)(16586007)(36756003)(50226002)(476003)(2616005)(6666004)(356004)(51416003)(5660300002)(53416004)(2351001)(8676002)(81156014)(81166006)(48376002)(7696005)(50466002)(8936002)(126002)(2906002)(305945005)(186003)(86362001)(53936002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1256; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e9e5358-6fd6-4ebf-a306-08d72d2a1ed8
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:CY4PR12MB1256; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1256:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1256DD66C6D25D36EF5C55C2F0BD0@CY4PR12MB1256.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:428;
X-Forefront-PRVS: 0145758B1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: xpoKCSwa7wd+kg7PYpHF/7wz/UH0TKx1w8Uttvlzf2Mnd2iKEZv/VfwJ59H6ozlyfbpUBqF4n/Ozxmbl05MESSB77ZBDQ9Pn27poLsqw9A3kVCvim80I2DinSESoS5Yv31sNTddxQPTr16yWmbJoY900gLPwK4IToXtWv1S5bFu0sDfOfFfqLFqSRmauN7YCfKEZHk1HyV8NnQGfAyRKutWF9JpWLl7tcW++yKWnZhnx75LSaga1VvR3Oj8aXBJpMuaRnHUOCPRwBYbR0TzgfpolmgJWTQTyGqHI4Fu/rKqvBlRQiGAFbltt+kqNjfbJVfaAKYMHg/J/6ibsgDQEJZcPFFrOLh2xk0e/OJJbGaXn674EereBNVpe070LpASGMb+mT26mb4M/+pJabfQCoycWAhRtitirPx0EWC8HYpU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2019 09:12:02.4574 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e9e5358-6fd6-4ebf-a306-08d72d2a1ed8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1256
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1itcngERXQUca/5CtdD9JKaqTjLcdLTmh3jaOaW+amc=;
 b=1AUsJsKeaLh9QXpL/nsJazZDS1Ykqe3aK4kaMn4JrDnGUjgbrzPGNuMtdcNAjsjTuA6PRtyRkgImS0zNXq5eoY/51kUMGGHtaXIAkVanoPWIF+s4ydPOmQW8sGDa9Ph3V4kmBzfu3jCc9DGZi+mpEzTBbRxxIMLaLGXowplxrRA=
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Ray.Huang@amd.com,
 Aaron Liu <aaron.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SW4gUmVub2lyJ3MgZW11bGF0b3IsIHRob3NlIGNoaWNrZW4gYml0cyBuZWVkIHRvIGJlIHByb2dy
YW1tZWQuCgpTaWduZWQtb2ZmLWJ5OiBBYXJvbiBMaXUgPGFhcm9uLmxpdUBhbWQuY29tPgpSZXZp
ZXdlZC1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEhhd2tp
bmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KQWNrZWQtYnk6IEFsZXggRGV1Y2hlciA8
YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVk
ZS9hc2ljX3JlZy9vc3Mvb3Nzc3lzXzRfMF9zaF9tYXNrLmggfCA0ICsrKysKIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2lu
Y2x1ZGUvYXNpY19yZWcvb3NzL29zc3N5c180XzBfc2hfbWFzay5oIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9pbmNsdWRlL2FzaWNfcmVnL29zcy9vc3NzeXNfNF8wX3NoX21hc2suaAppbmRleCAxZWUz
YTIzLi5kYzk4OTVhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNp
Y19yZWcvb3NzL29zc3N5c180XzBfc2hfbWFzay5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
aW5jbHVkZS9hc2ljX3JlZy9vc3Mvb3Nzc3lzXzRfMF9zaF9tYXNrLmgKQEAgLTExMDksNyArMTEw
OSwxMSBAQAogI2RlZmluZSBJSF9DSURfUkVNQVBfREFUQV9fQ0xJRU5UX0lEX1JFTUFQX01BU0sg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAweDAwRkYwMDAwTAogLy9JSF9DSElDS0VOCiAjZGVmaW5lIElIX0NISUNLRU5fX0FDVElW
RV9GQ05fSURfUFJPVF9FTkFCTEVfX1NISUZUICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4MAorI2RlZmluZSBJSF9DSElDS0VOX19NQ19T
UEFDRV9GQlBBX0VOQUJMRV9fU0hJRlQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDMKKyNkZWZpbmUgSUhfQ0hJQ0tFTl9fTUNf
U1BBQ0VfR1BBX0VOQUJMRV9fU0hJRlQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHg0CiAjZGVmaW5lIElIX0NISUNLRU5fX0FD
VElWRV9GQ05fSURfUFJPVF9FTkFCTEVfTUFTSyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4MDAwMDAwMDFMCisjZGVmaW5lIElIX0NI
SUNLRU5fX01DX1NQQUNFX0ZCUEFfRU5BQkxFX01BU0sgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4MDAwMDAwMDhMCisjZGVm
aW5lIElIX0NISUNLRU5fX01DX1NQQUNFX0dQQV9FTkFCTEVfTUFTSyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4MDAwMDAw
MTBMCiAvL0lIX01NSFVCX0NOVEwKICNkZWZpbmUgSUhfTU1IVUJfQ05UTF9fVU5JVElEX19TSElG
VCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgMHgwCiAjZGVmaW5lIElIX01NSFVCX0NOVExfX0lWX1RMVkxfX1NI
SUZUICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDB4OAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
