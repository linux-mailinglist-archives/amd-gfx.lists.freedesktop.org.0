Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0185969DEC
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2111589D67;
	Mon, 15 Jul 2019 21:22:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690049.outbound.protection.outlook.com [40.107.69.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23FB889D52
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:22:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hpmxsR+e0z3neX3kK7OnYthBaOj94T+cj3MWdZUgz6PDbfep0bubch5/1BLHSqK35lP9cRFl2joZgl3zBvkfbe8dhtUiHlgaLzkjheInxVqW/0VHQ7Zd7D0YHUy1bsBNcUCpX/szHSYMix3EZq0AvMJGSPIGEcoZFPnUpagdtnOf0t5VQqc9mJ/+RZw1QB5oRZAVX/tibBXVO/OUtrSN779Vx583sgHxOo3Pz0mK0J5f8v0HtI1itouiNPTBc8lQuRzCRGUoXO6TK9lVg0dH2sv45jBCLS3rjOOQItkDV/o2Temr4lQz4rNt0DShddRtPOFuTG4qfhot+80pEzgTGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pphrS9r/8gChvz7dkmttw9NYf1V2r5uDADkGHGB05JY=;
 b=I09DaHY8D+LhGV+/iwRFlIlSOoBmU42IIGmmpYR+KrdmAYXLLTJ63jxep2MYw6JIHgcs+LgUIYhdf2Zrw2PK4MD4vvaL9kiOCQ+IF7aVXDuNzSUqYJxEWQjoiZO4vOBacMTwKDVF9w0F/9GneRAEA3vY6fUgaduQlb+DGgTet7NTXV46KlKCI9ygq2V33ZvhoUaUZm1OI3DaiboeGkq1JWalLq0Qyx+0TZBM+RcHUqekVhYef9Dtu7zqvqAkHLpdFtJmXHcRj3bnAUdcnY8mwzdiv5aTWy9atEdp++2wope0zB5tu4NTpf3r21FkhUGL8Qp/Jek9J40j3xAXkJfx1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM3PR12CA0112.namprd12.prod.outlook.com (2603:10b6:0:55::32) by
 CH2PR12MB3926.namprd12.prod.outlook.com (2603:10b6:610:2d::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Mon, 15 Jul 2019 21:22:02 +0000
Received: from CO1NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by DM3PR12CA0112.outlook.office365.com
 (2603:10b6:0:55::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.14 via Frontend
 Transport; Mon, 15 Jul 2019 21:22:01 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT048.mail.protection.outlook.com (10.152.81.49) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:22:01 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:40 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 77/87] drm/amd/display: 3.2.42
Date: Mon, 15 Jul 2019 17:20:39 -0400
Message-ID: <20190715212049.4584-78-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(396003)(136003)(2980300002)(428003)(199004)(189003)(6916009)(14444005)(86362001)(478600001)(2906002)(36756003)(2876002)(4326008)(53936002)(1076003)(4744005)(126002)(2870700001)(476003)(356004)(5660300002)(76176011)(49486002)(50466002)(8676002)(51416003)(336012)(446003)(26005)(426003)(11346002)(186003)(2616005)(305945005)(316002)(8936002)(50226002)(68736007)(54906003)(47776003)(81156014)(81166006)(70586007)(70206006)(486006)(48376002)(2351001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3926; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e185339-d62d-4f2e-dc53-08d7096a7a1d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CH2PR12MB3926; 
X-MS-TrafficTypeDiagnostic: CH2PR12MB3926:
X-Microsoft-Antispam-PRVS: <CH2PR12MB3926A385F3A9894F42F28CDF82CF0@CH2PR12MB3926.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: yNwJqb+f54ta637fQZwOPThOgdAVVubwTh+ovzzp+TZrwYDFA9DvyHqTkmR5r85FFqnnJx+L/oKkIFG8BtJyWBo+a84/v0zgUVCnUI6XBLcnP/Z5aBVytMERAz6r2Z0tvZraVjXl0Et1lyaRRfTYcEIr/+ocBUkLZPlSjUsmzKRVzqhFMxV3zhtMILOSllHo4xadUY4EI76IDHPZIE4HTbufLVxk8a+ZJpH77n2vG5Lqqtjev9n/gT7+lVraN3V+hT40DTRfKUCjvXmaKLTup+qXl5z97IX0oTFElP3lCQGGjSbM5tUSK9JvxiYZ4EHSxopCIFLzx17Pr7188hCB0ooxueyqMmpt3yl53FQJDbEcqhpwYmV7XsYPPXTJtV2uVCWdlp6FY0Cki/KXYqBQWFl4Tdez/hv8cLxHzpFgqv0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:22:01.3022 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e185339-d62d-4f2e-dc53-08d7096a7a1d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3926
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pphrS9r/8gChvz7dkmttw9NYf1V2r5uDADkGHGB05JY=;
 b=QwVXJnbZSt0fvkgOLMeR46QfHtGnszfVaHccxLkQMwgb8UQsfaAO9GNVjdwOvjTqtyQ7cZnno2KHk/tDdobkqlaiqqNyPy8Vbm3dcX94ETu9xvEAnsRhDUIC3tbDRwACYnKDjIBsYZHAeWyQcJO5IZhufr0Y1z1t8L/J5goCN6o=
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
c3BsYXkvZGMvZGMuaAppbmRleCBjMjhmY2E1YzBhM2IuLmIxMmVlZTkzYzI1MyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKQEAgLTM5LDcgKzM5LDcgQEAKICNpbmNsdWRlICJpbmMv
aHcvZG1jdS5oIgogI2luY2x1ZGUgImRtbC9kaXNwbGF5X21vZGVfbGliLmgiCiAKLSNkZWZpbmUg
RENfVkVSICIzLjIuNDEiCisjZGVmaW5lIERDX1ZFUiAiMy4yLjQyIgogCiAjZGVmaW5lIE1BWF9T
VVJGQUNFUyAzCiAjZGVmaW5lIE1BWF9QTEFORVMgNgotLSAKMi4yMi4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
