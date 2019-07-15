Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCBF69D94
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B631289B97;
	Mon, 15 Jul 2019 21:21:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720050.outbound.protection.outlook.com [40.107.72.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B78289B95
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D3Q/NW2r60DznjODhMsKw/fNZN3xqlJHc2TxtCP6y4iAK30ma5+bh1B+czbMIU/E2Hg09xBswXzbL0ap3h+usR7T32w0qMWJ8Kl2yb5h0YYrhVHwopaIUgwsUXo0qEs7GEGJ0ZCnGPKjlRP2dGcqAWlXImIULDbD5Gj4DQfDMroinAHOJ+cs+R0k8CLIHDwXVjwrWncA79GDuyDfUhaQxpN+ZQB/MFvwaBMqIjdWpGPLmANEZ9b5VFyLWmI5ePpxRDWMXV7mXNvkLAGEllH2i1iYBpnjhS6tosqY5NtuxFbI674C/1S/mI59368NgWVp/VyGB01L2gJKD2BjRQ0z0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxPKodyayC++RxvMTja3fIg0pEg0rTxtEzo9w7BdVRg=;
 b=NpLGvpx/y5xXdrP5+A0zRtoHRGpfgv7i8BbSQqw+OOwdwG6k+5jSBQNTfpq96E+49Z3WEQfTs1B2KjkcvCwvjFtAHKy1c/+ntnEuI9NCPeGThSjhxwe1VX9gXZqNXrHjW+38ghoCDpUmLhbzW5r//g1+in6tL/BZ45i51sqvfrzJxagGeuKIYhb0FCagm6e6afWOmVGDM1gRuKFLqrSUc2DijW2IpNXm8hwQ+gxL44bewcqVBG0+QqIIVfndTEiYEaG5NbCLevcemt6MK3wmW4+f9cvdeaH9+IV4pEvo+QHTgpLq2683TCBzi1JLGgRtAWjtoAjCyyXl2wzx3r04LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR12CA0041.namprd12.prod.outlook.com (2603:10b6:301:2::27)
 by BYAPR12MB3095.namprd12.prod.outlook.com (2603:10b6:a03:dc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.10; Mon, 15 Jul
 2019 21:21:09 +0000
Received: from CO1NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by MWHPR12CA0041.outlook.office365.com
 (2603:10b6:301:2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.14 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:09 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT009.mail.protection.outlook.com (10.152.80.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:08 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:03 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 03/87] drm/amd/display: 3.2.36
Date: Mon, 15 Jul 2019 17:19:25 -0400
Message-ID: <20190715212049.4584-4-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(396003)(136003)(2980300002)(428003)(189003)(199004)(1076003)(186003)(81156014)(81166006)(70586007)(70206006)(8676002)(356004)(6666004)(50466002)(26005)(4744005)(478600001)(53936002)(5660300002)(305945005)(51416003)(49486002)(48376002)(47776003)(36756003)(54906003)(4326008)(486006)(11346002)(14444005)(426003)(2870700001)(8936002)(2351001)(2906002)(68736007)(76176011)(336012)(2876002)(126002)(476003)(316002)(2616005)(50226002)(6916009)(86362001)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3095; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52b186a8-9e6c-42e4-c687-08d7096a5ad0
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BYAPR12MB3095; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB3095:
X-Microsoft-Antispam-PRVS: <BYAPR12MB309562EAE93D38159455C4C182CF0@BYAPR12MB3095.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: mp9nGPehHknKXbQHJAYalO7n7U3vtE17j17rCRY8cH8g71CVgyH+LiUg/mJv1Yxr729EE5ip3srg560qUTs9GnCo2HqqqBjArgPS1Wk/32mm/PqA5Jytiuhz8K47r6xAtGJWljAOQml/0HVfpDkJht83COAodASbsjshse8Ai9k8dqtUPnyGu2Z4KY/XcRerrV3z6+QDXViz+Cldz2qXJoOiHGz5MD/A7ordTnCpCFSbAVAU8Z72DZw6uOkZUPQb8+6WcUrX5AzeeRRIMB7vuNgccpwDWY+6lCUYorhq3D8PqbtXLzNPD1lhiDtt5nWmh6TTSX4K2KS7rZLs5210Ag9kozrw2xm38F6sASAd1PM8C7iw1JYHMhT0aFlpVpyTcTQ21m0eNKpdgSjXTxnKScuQ+CZM+XrXH4JSMC3Wy3o=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:08.7917 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52b186a8-9e6c-42e4-c687-08d7096a5ad0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3095
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxPKodyayC++RxvMTja3fIg0pEg0rTxtEzo9w7BdVRg=;
 b=GKe4qFhTHSbc1f/R0SPGK1EFKHM+ra40N9qVA/kU1DLzhES2tecBoiqiraQeNibuwhgZo+v1Xk9wt3sGAjClQlypvtkhXL4FSWMzUc9oV76db8xo1HpyXHbIwV2uVL948P0DKi2lm5qYkqV8E7JfzDt/iuqn0+zY1/3eL0Szd0c=
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
c3BsYXkvZGMvZGMuaAppbmRleCBlNTEzMDI4ZmFlZmEuLjJhN2YyNWQzNzJlMSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKQEAgLTM5LDcgKzM5LDcgQEAKICNpbmNsdWRlICJpbmMv
aHcvZG1jdS5oIgogI2luY2x1ZGUgImRtbC9kaXNwbGF5X21vZGVfbGliLmgiCiAKLSNkZWZpbmUg
RENfVkVSICIzLjIuMzUiCisjZGVmaW5lIERDX1ZFUiAiMy4yLjM2IgogCiAjZGVmaW5lIE1BWF9T
VVJGQUNFUyAzCiAjZGVmaW5lIE1BWF9QTEFORVMgNgotLSAKMi4yMi4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
