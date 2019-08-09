Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FDB884F4
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 23:38:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89D136EEB6;
	Fri,  9 Aug 2019 21:38:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810074.outbound.protection.outlook.com [40.107.81.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC3FE6EEB0
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 21:38:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NbSm6E3bIGGSYXhVchgy22wWSpaanoMwteBCcAWhHA4F9YC1dqBRGk3O9yWHh+BerLfvlOkOtepjkE7Zb9GPOY24+QV8KKEkCZg/IUkbF1OBy3ugeqLSggbW2l0Pb3HmkZd465fH27KpJZo9+h1vm8CyhFagWNffgyeOaVSXCZkHNheVEqTILKstydqj//VcopP9QLaiQsag2tvHG0w6IEa+bbuTW+b+Yr5eIOJ8kUm1YZ4JZDyAWACaLUTkQFjpohKxZFqLwlESRuJrWCPH7N2fRo2EXwCJm2MNQGoXAvPKbU0XdFwcDvzzGA9Y4NUxH258O5V8bcvyHPfpvjL34A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kB605dFmRrtPmPZymB11cs/dUH7JJPISACrnUhYdT/k=;
 b=TXPu7gGI8zOxHCJYU8BcZy9RxjBno7kFVbtVCxd8R59QKWB4jwW461a8FW7T1/a3+GgZ0wuaYKOXSM3UnenYwCMWzzPV9maj2DuDDZVPmMnVcWhxuE1zXWgqkWhJN/WFeayYv6pfpZbbRM48NPk1cbXmZOnOac4+ZTrzNjX3dUQc6bvhbEDntsgbpjo7whwVLkRtGRaiiRsIEVIz3Y67iz7SUCLWiarj3yf9y2sQYr0uSriUD5y3XClZC5nDjXlCAXrpN0QH/5jIkTK3f1n3F0anqZjo1ITgFPpL+OfSOSTL6SKiTGFjccfaqu7KJMB8GudyPT8h/ETn1Uw8C2gTsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CY4PR1201CA0002.namprd12.prod.outlook.com
 (2603:10b6:910:16::12) by BN6PR12MB1267.namprd12.prod.outlook.com
 (2603:10b6:404:17::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.17; Fri, 9 Aug
 2019 21:38:31 +0000
Received: from DM3NAM03FT040.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::200) by CY4PR1201CA0002.outlook.office365.com
 (2603:10b6:910:16::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.18 via Frontend
 Transport; Fri, 9 Aug 2019 21:38:31 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT040.mail.protection.outlook.com (10.152.83.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Fri, 9 Aug 2019 21:38:31 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Fri, 9 Aug 2019 16:38:22 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 15/49] drm/amd/display: 3.2.43
Date: Fri, 9 Aug 2019 17:37:08 -0400
Message-ID: <20190809213742.30301-16-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190809213742.30301-1-sunpeng.li@amd.com>
References: <20190809213742.30301-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(39860400002)(396003)(2980300002)(428003)(189003)(199004)(305945005)(6666004)(2870700001)(11346002)(2876002)(486006)(126002)(47776003)(2616005)(70206006)(476003)(48376002)(1076003)(50226002)(54906003)(426003)(70586007)(478600001)(356004)(2906002)(446003)(53936002)(36756003)(316002)(5660300002)(8936002)(81156014)(336012)(2351001)(51416003)(14444005)(50466002)(8676002)(4326008)(6916009)(81166006)(186003)(4744005)(86362001)(76176011)(49486002)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1267; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71ccb69c-7b3d-4050-e092-08d71d11ec6c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1267; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1267:
X-Microsoft-Antispam-PRVS: <BN6PR12MB12675B651C2C00CE2B06FA2782D60@BN6PR12MB1267.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 01244308DF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: juNlvEfgyW2hka+VvszAZoREKyWeygv35Id16Xt/6x6x7JqECxo6p5OOJ5g4jYQzq8iz6+6Z8BGAJOjY11CJP/aOtzjeJUxILJUo82zHARw5j/Rcgd7ErwXks3FowLhZFf9As1T0HEN2Un6N4RHzT7birUABYf6ig8g2R88g5s8U5uulgI0HexUY6MBy6GlGWG89fL8OPi6f5g/dMrAW3j8/91bwyyeMLuU0sgfZfBr3RPW2NKmF7rDm9/T8SmaNk/SsrzazX/caHFnZgzZZlqpd1FKBgz1rqg6jO5UFGc/trYYl2uNFrmz3HUlFCk8DC3AJ69JwQuSj36xeqYfATdhCf037B4LX34QJrRFdhUJ1H2vXSDlj1hXbC9oligtdR8++AxJyOR5GU8CKfcW0AnxPyYqkMzBjicfSOtsuVG8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 21:38:31.2610 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71ccb69c-7b3d-4050-e092-08d71d11ec6c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1267
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kB605dFmRrtPmPZymB11cs/dUH7JJPISACrnUhYdT/k=;
 b=P0SpzZJ7LlSlEcuYuOfLYKAuGt2Mbv2el8yMQ5O0/H5U8IJYRnDbopEFkAhV8taz7MsxWCfdWaoP/Ub+JCD+GM/86T77HLKPLNoLRZlu+Ehmp5N3znFbGBbyypCR1bqHwU4n2L5FnY8xH2CHEXnH6pZZ1jCdzt4SLVoGZ31mTRc=
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
c3BsYXkvZGMvZGMuaAppbmRleCAxODY2ZmE3MWE3NjQuLjk4MjRmNTU4OWEwYiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKQEAgLTM5LDcgKzM5LDcgQEAKICNpbmNsdWRlICJpbmMv
aHcvZG1jdS5oIgogI2luY2x1ZGUgImRtbC9kaXNwbGF5X21vZGVfbGliLmgiCiAKLSNkZWZpbmUg
RENfVkVSICIzLjIuNDIiCisjZGVmaW5lIERDX1ZFUiAiMy4yLjQzIgogCiAjZGVmaW5lIE1BWF9T
VVJGQUNFUyAzCiAjZGVmaW5lIE1BWF9QTEFORVMgNgotLSAKMi4yMi4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
