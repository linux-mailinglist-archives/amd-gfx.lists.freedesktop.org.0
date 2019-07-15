Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9675F69DDD
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C3E89D52;
	Mon, 15 Jul 2019 21:22:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740059.outbound.protection.outlook.com [40.107.74.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2400E89D53
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:22:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nm7MP9t88zsC6HRapTmc+HypgRMMK4HddVJy5qDSldQQKC+Bpk/hnoRIlcR+oI1u/n0srO3oDA+9YJ9NsgWtmRzNSeHoaEFOypGocELskz/TkoRuRVHk/bWczxsIlq9i6R8aVHHXrFgWAJZl9BrVxAFhzKyWBlx+mhgzwAo9ilDWi8n9iYmwSxET6JTHcJqwnHckJOX1Z0KzabSU5oM7BmOyA12jBOeiEkgPkMk2ktJdHQ/viswuBCoBZh8BCnZFfZyAhFoMnFccbEdqB/c+vUh94DEitJ8IznsrVDbikdv1LHNIbW23u59aJgiKjaiTH4WHlNrA17X/0gKIOjMuTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fX5S14qhIERVoNIYeoxGpcFqJTeBZq4eAdIV98bFqvM=;
 b=Dl6KLzzqVvTne6gculjeUcT6tR/LNCcXTLdztr10r+7M3VoGzt6YRynnBQIFHVTLLyA6aRxir26MacLNHeivwA2rtAui/mExfDkYnfpZ13F8GUvxWNPcMmGUxArzRncOp8eepMqk7UP12OrCEqMiFI1RERpTCz2oA+avT4sq/2gYfPUOJf9pzseu4kPwlpT/ZhkLQ+IUVXfxVVMIEXP0ytyEdPgM96Q3WlKb0i1FgqLp4ufJCcAWKGexFGArL5NvIlX6xY4+LqJZCZFh9n+ucvY071rMApfC2cvo/j1nHrHQxUutX1ydozjwM1EMbIutfpi7qHoFwwNpqxVaBrLxZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM3PR12CA0112.namprd12.prod.outlook.com (2603:10b6:0:55::32) by
 MWHPR12MB1935.namprd12.prod.outlook.com (2603:10b6:300:113::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Mon, 15 Jul
 2019 21:22:00 +0000
Received: from CO1NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by DM3PR12CA0112.outlook.office365.com
 (2603:10b6:0:55::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.14 via Frontend
 Transport; Mon, 15 Jul 2019 21:22:00 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT048.mail.protection.outlook.com (10.152.81.49) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:22:00 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:39 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 76/87] drm/amd/display: drop ASSERT() if eDP panel is not
 connected
Date: Mon, 15 Jul 2019 17:20:38 -0400
Message-ID: <20190715212049.4584-77-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(136003)(346002)(396003)(2980300002)(428003)(199004)(189003)(126002)(2870700001)(4744005)(2876002)(2616005)(476003)(70586007)(4326008)(70206006)(48376002)(486006)(53936002)(426003)(2906002)(11346002)(8676002)(50466002)(36756003)(81166006)(446003)(81156014)(68736007)(186003)(49486002)(6916009)(305945005)(54906003)(86362001)(316002)(478600001)(26005)(8936002)(356004)(336012)(76176011)(51416003)(1076003)(47776003)(2351001)(5660300002)(14444005)(50226002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1935; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4168645-ec28-4114-2f27-08d7096a7976
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1935; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1935:
X-Microsoft-Antispam-PRVS: <MWHPR12MB193559681F9CD56FB8AE441F82CF0@MWHPR12MB1935.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: JKvaxysLTwjQ725Fu+tHdNU9DMRAtBmSpiYNw8eZ/Xfwl90q0zN8k4vmZ84kv6obtDacSYsHcsukmGb+9BzL3r50qCVKteV4LkyEoxE3TTzw5ZMc+qV4kfqRhWq95hr/ky4TJoqqUz7KO/h+GUM4gU3UFq6uNlZUOQDky+4AC29M3Hxm7fMJuGGsgxsJGVGNYXcU3NUokzJWYkVt4+h0Q1XKcMVc/Y8M3gm8VJfFrguG44Gb7aIc4ywwbjiRfgubTSIREdzUdbLdyuzS3YjdvF0tAPUvvuVBP37oSOMcv9wS+6DKJRo524rCfeY0JG15Dm9m/yUyfKLA/9nNI+YCRRZkYmUwTlM74YboREOCbZ7wCnuP5VLF7ZWUGPXVWqcEVF6ROEH3GdBA5jSInU1NIBxPj334fUJyUFEnEup5tWM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:22:00.3284 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4168645-ec28-4114-2f27-08d7096a7976
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1935
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fX5S14qhIERVoNIYeoxGpcFqJTeBZq4eAdIV98bFqvM=;
 b=fFmL5q0x/Hu4oR8Yp66I30Yix5IYcBQTUFUPVTSHQkB892/F42bheKM3DRowIlIbTXe0aAaG+iHBs+FuYdPUOFFGijTPCGLml6cx6ySP/ItOalR9ZCzViRsosvxBA3Znij90zDQnaEUOvt3MaQxC+G2W2RBZQc4O2AnPlvb4vdY=
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
Cc: Leo Li <sunpeng.li@amd.com>, Zhan Liu <zhan.liu@amd.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWmhhbiBMaXUgPHpoYW4ubGl1QGFtZC5jb20+CgpbV2h5XQpGb3IgYm9hcmRzIHRoYXQg
c3VwcG9ydCBlRFAgYnV0IGRvIG5vdCBoYXZlIGEgcGh5c2ljYWwgZURQCmRpc3BsYXkgY29ubmVj
dGVkIGFuIEFTU0VSVCB3aWxsIGJlIHRocm93bi4gVGhpcyBpcyBub3QgYQpjcml0aWNhbCBmYWls
dXJlIGFuZCBzaG91bGRuJ3QgYmUgdHJlYXRlZCBhcyBzdWNoLgoKW0hvd10KRHJvcCB0aGUgYXNz
ZXJ0aW9uLgoKU2lnbmVkLW9mZi1ieTogWmhhbiBMaXUgPHpoYW4ubGl1QGFtZC5jb20+ClJldmll
d2VkLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxOaWNob2xhcy5LYXpsYXVza2FzQGFtZC5jb20+
CkFja2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMgfCAyIC0tCiAxIGZpbGUgY2hhbmdlZCwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY29yZS9kY19saW5rLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9k
Y19saW5rLmMKaW5kZXggMTQyMmU3NGE1ZmZjLi40NjcwMTZkZGZiZTggMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMKQEAgLTU1Miw4ICs1NTIsNiBA
QCBzdGF0aWMgdm9pZCByZWFkX2VkcF9jdXJyZW50X2xpbmtfc2V0dGluZ3Nfb25fZGV0ZWN0KHN0
cnVjdCBkY19saW5rICpsaW5rKQogCQltc2xlZXAoOCk7CiAJfQogCi0JQVNTRVJUKHN0YXR1cyA9
PSBEQ19PSyk7Ci0KIAkvLyBSZWFkIERQQ0QgMDAxMDBoIHRvIGZpbmQgaWYgc3RhbmRhcmQgbGlu
ayByYXRlcyBhcmUgc2V0CiAJY29yZV9saW5rX3JlYWRfZHBjZChsaW5rLCBEUF9MSU5LX0JXX1NF
VCwKIAkJCSZsaW5rX2J3X3NldCwgc2l6ZW9mKGxpbmtfYndfc2V0KSk7Ci0tIAoyLjIyLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
