Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22116AEC66
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 15:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFB20892A1;
	Tue, 10 Sep 2019 13:55:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700067.outbound.protection.outlook.com [40.107.70.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90CD0892A1
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 13:55:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9M769S8jZuIWEO51ZpTUR0OqN/UuV6n5ge8dPuOaYVHKpeOubHLpQY4laKCF4BnRthykR8eUgippUNaYMUhuBwZNjVJXwf0qQnp0bPNJy1PO4B5MD5NxxST2ixm/oCj0NkQtzuriPBGwrBAmfWzNUExbrum7+QGBLYhn4id3uU0XrSDZkGD7kTIGIdK8HllUjidUIAOtDsYjHvn80cE1LLo2xhkt/a8HZ3Wl8FPS9SaLy25x4XOtxVDFuvoilNJ39TU+jbjnF67Jb8gRgIu8QVhhN52IOEcO85AXgFXznMYxK3x9wIm2F4r70K2989HElvvcc6gNAJ0qPoI+igy2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQXuVzzq02gFEaop3wSXT/s/Q17yhV2pcrdUTtwjf0E=;
 b=YJ1ZjxOhW6ZaAI8xdrPU6Vda73Lg78RityXA7gD9NPgEslrFRzODwG3S0QWo1V18B2dTpOAPKj0YRebq+ogeKX/xEWwEu+e6v7+hJQCUBc2AoTeGCc26zU/AlUppay25r9+fozVKTCfryBP9wzRhMkCDOW+8IW7aq3XxGWMv1wZuDzvFva+Knsn6MFXxSQGjxnJGjWUsWfT5HcXIUFxvPCdB91icmLk8olsrbF29TIymajzIrLF1qg4JpJEl1mLNDaaW6DRj0EYZr4SI6lkMcH/9s0g6Q+a+N0pcExdTUADbk5Gq9vbhLFX4hBoWBp9J+2yl7ID7lieXISUvcEBomg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0019.namprd12.prod.outlook.com (2603:10b6:610:57::29)
 by CH2PR12MB3717.namprd12.prod.outlook.com (2603:10b6:610:24::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.18; Tue, 10 Sep
 2019 13:54:58 +0000
Received: from CO1NAM03FT025.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::201) by CH2PR12CA0019.outlook.office365.com
 (2603:10b6:610:57::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.15 via Frontend
 Transport; Tue, 10 Sep 2019 13:54:58 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT025.mail.protection.outlook.com (10.152.80.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 13:54:57 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 10 Sep 2019 08:54:53 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 02/25] drm/amd/display: define parameters for abm 2.3
Date: Tue, 10 Sep 2019 09:54:22 -0400
Message-ID: <20190910135445.18300-3-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190910135445.18300-1-sunpeng.li@amd.com>
References: <20190910135445.18300-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(346002)(376002)(2980300002)(428003)(189003)(199004)(70206006)(53936002)(70586007)(8676002)(6916009)(8936002)(2906002)(2876002)(86362001)(4326008)(81166006)(316002)(478600001)(5660300002)(36756003)(81156014)(26005)(54906003)(49486002)(2870700001)(186003)(2616005)(76176011)(47776003)(356004)(6666004)(51416003)(305945005)(336012)(48376002)(1076003)(50466002)(11346002)(486006)(126002)(2351001)(446003)(426003)(476003)(50226002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3717; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e622fc29-ed09-4085-e3db-08d735f6777a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:CH2PR12MB3717; 
X-MS-TrafficTypeDiagnostic: CH2PR12MB3717:
X-Microsoft-Antispam-PRVS: <CH2PR12MB3717426D1D5A77345A00C47882B60@CH2PR12MB3717.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: RztT5u7GoiCTOh+oqiZPeaLgcwfP6OFWC9yJUWLYvpSk8yUuYvm3kYzX+SA8edCzBc/19RTnpTp6mZATHLk4At7LTLgggzZoQxbV5y6JnePHr3JcbsPueF2I/ESbqlp/qeUgvI93G5BLAoHWj34D5Vo+ZH1cayCQ5X2mqPPgEw34ZZLL6e68/iJ7cTws7wneh2G5zz1/NYbvxn7tX6fNME4MFwX2xolpO+Y7NDBcbNEoI6V8PAbRkT5+ZRRqIVWSn9IfuzG4qZJ82HEKAEg2fyARfddACdXcCuOPBFpedqvWg6a+WS09y+vclZbi+fUaatroyYExXavDD+So9t5G7lGP59OvdEBa+JIcxaPFZx04B7D6KkhDhGbiC+j/J6sqOlJ1fjrLGvlcpmn+T8aAYN4jjDzssIwiWUG6PsRDmcw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 13:54:57.6992 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e622fc29-ed09-4085-e3db-08d735f6777a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3717
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQXuVzzq02gFEaop3wSXT/s/Q17yhV2pcrdUTtwjf0E=;
 b=1w5E7gDlq2K89VQQIrXQDg4J7sItCF+/jdlAfuYTa1H6xhifbRvylLWBO0gZAxoR8++mXAjp9fMRnb0KNl243i1T9O6+NMsXH6rTt3c2sLKH4yL9YN1UK8M9goCQDK1J7e2Uw4lkYryA7qVGBsHQyTyF3ztc6v7RGtJa4zMwnAk=
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
Cc: Leo Li <sunpeng.li@amd.com>, Anthony Koo <Anthony.Koo@amd.com>,
 Josip Pavic <Josip.Pavic@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSm9zaXAgUGF2aWMgPEpvc2lwLlBhdmljQGFtZC5jb20+CgpbV2h5XQpDdXJyZW50IGNv
bmZpZ3VyYXRpb24gMCBpcyBqdXN0IGEgcGxhY2Vob2xkZXIsIGFuZCBmaW5hbCBwYXJhbWV0ZXJz
IG5lZWRlZC4KQWxzbywgY29uZmlndXJhdGlvbiAxIGlzIGV4cGVjdGVkIHRvIGVtdWxhdGUgQUJN
IDIuMSBidXQgaXMgdG9vIGFnZ3Jlc3NpdmUuCgpbSG93XQpSZWRlZmluZSBjb25maWd1cmF0aW9u
IDAgd2l0aCB0aGUgZmluYWxpemVkIHBhcmFtZXRlcnMsIGFuZCBpbmNyZWFzZSB0aGUKY29udHJh
c3QgZ2FpbiBvZiBjb25maWd1cmF0aW9uIDEgc28gdGhhdCBpdCBwcm9wZXJseSBlbXVsYXRlcyBB
Qk0gMi4xLgoKU2lnbmVkLW9mZi1ieTogSm9zaXAgUGF2aWMgPEpvc2lwLlBhdmljQGFtZC5jb20+
ClJldmlld2VkLWJ5OiBBbnRob255IEtvbyA8QW50aG9ueS5Lb29AYW1kLmNvbT4KQWNrZWQtYnk6
IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgotLS0KIC4uLi9hbWQvZGlzcGxheS9tb2R1bGVz
L3Bvd2VyL3Bvd2VyX2hlbHBlcnMuYyAgICB8IDE2ICsrKysrKysrLS0tLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvcG93ZXIvcG93ZXJfaGVscGVycy5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvcG93ZXIvcG93ZXJfaGVscGVycy5j
CmluZGV4IDA1ZTJiZTg1NjAzNy4uY2M2Yjc5NDgyMWQ5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9wb3dlci9wb3dlcl9oZWxwZXJzLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvcG93ZXIvcG93ZXJfaGVscGVycy5jCkBA
IC04MCwxOCArODAsMTggQEAgc3RydWN0IGFibV9wYXJhbWV0ZXJzIHsKIAogc3RhdGljIGNvbnN0
IHN0cnVjdCBhYm1fcGFyYW1ldGVycyBhYm1fc2V0dGluZ3NfY29uZmlnMFthYm1fZGVmaW5lc19t
YXhfbGV2ZWxdID0gewogLy8gIG1pbl9yZWQgIG1heF9yZWQgIGJyaWdodF9wb3MgIGRhcmtfcG9z
ICBicmlnaHRuZXNzX2dhaW4gIGNvbnRyYXN0ICBkZXZpYXRpb24gIG1pbl9rbmVlICBtYXhfa25l
ZQotCXsweGZmLCAgIDB4YmYsICAgIDB4MjAsICAgICAgIDB4MDAsICAgICAweGZmLCAgICAgICAg
ICAgIDB4OTksICAgICAweGIzLCAgICAgIDB4NDAsICAgICAweEUwfSwKLQl7MHhmZiwgICAweDg1
LCAgICAweDIwLCAgICAgICAweDAwLCAgICAgMHhmZiwgICAgICAgICAgICAweDkwLCAgICAgMHhh
OCwgICAgICAweDQwLCAgICAgMHhFMH0sCi0JezB4ZmYsICAgMHg0MCwgICAgMHgyMCwgICAgICAg
MHgwMCwgICAgIDB4ZmYsICAgICAgICAgICAgMHg5MCwgICAgIDB4NjgsICAgICAgMHg0MCwgICAg
IDB4RTB9LAotCXsweDgyLCAgIDB4NGQsICAgIDB4MjAsICAgICAgIDB4MDAsICAgICAweDAwLCAg
ICAgICAgICAgIDB4OTAsICAgICAweGIzLCAgICAgIDB4NzAsICAgICAweDcwfSwKKwl7MHhmZiwg
ICAweGJmLCAgICAweDIwLCAgICAgICAweDAwLCAgICAgMHhmZiwgICAgICAgICAgICAweDk5LCAg
ICAgMHhiMywgICAgICAweDQwLCAgICAgMHhlMH0sCisJezB4ZGUsICAgMHg4NSwgICAgMHgyMCwg
ICAgICAgMHgwMCwgICAgIDB4ZmYsICAgICAgICAgICAgMHg5MCwgICAgIDB4YTgsICAgICAgMHg0
MCwgICAgIDB4ZGZ9LAorCXsweGIwLCAgIDB4NTAsICAgIDB4MjAsICAgICAgIDB4MDAsICAgICAw
eGMwLCAgICAgICAgICAgIDB4ODgsICAgICAweDc4LCAgICAgIDB4NzAsICAgICAweGEwfSwKKwl7
MHg4MiwgICAweDQwLCAgICAweDIwLCAgICAgICAweDAwLCAgICAgMHgwMCwgICAgICAgICAgICAw
eGZmLCAgICAgMHhiMywgICAgICAweDcwLCAgICAgMHg3MH0sCiB9OwogCiBzdGF0aWMgY29uc3Qg
c3RydWN0IGFibV9wYXJhbWV0ZXJzIGFibV9zZXR0aW5nc19jb25maWcxW2FibV9kZWZpbmVzX21h
eF9sZXZlbF0gPSB7CiAvLyAgbWluX3JlZCAgbWF4X3JlZCAgYnJpZ2h0X3BvcyAgZGFya19wb3Mg
IGJyaWdodG5lc3NfZ2FpbiAgY29udHJhc3QgIGRldmlhdGlvbiAgbWluX2tuZWUgIG1heF9rbmVl
Ci0JezB4ZjAsICAgMHhkOSwgICAgMHgyMCwgICAgICAgMHgwMCwgICAgIDB4MDAsICAgICAgICAg
ICAgMHhhOCwgICAgIDB4YjMsICAgICAgMHg3MCwgICAgIDB4NzB9LAotCXsweGNkLCAgIDB4YTUs
ICAgIDB4MjAsICAgICAgIDB4MDAsICAgICAweDAwLCAgICAgICAgICAgIDB4YTgsICAgICAweGIz
LCAgICAgIDB4NzAsICAgICAweDcwfSwKLQl7MHg5OSwgICAweDY1LCAgICAweDIwLCAgICAgICAw
eDAwLCAgICAgMHgwMCwgICAgICAgICAgICAweGE4LCAgICAgMHhiMywgICAgICAweDcwLCAgICAg
MHg3MH0sCi0JezB4ODIsICAgMHg0ZCwgICAgMHgyMCwgICAgICAgMHgwMCwgICAgIDB4MDAsICAg
ICAgICAgICAgMHhhOCwgICAgIDB4YjMsICAgICAgMHg3MCwgICAgIDB4NzB9LAorCXsweGYwLCAg
IDB4ZDksICAgIDB4MjAsICAgICAgIDB4MDAsICAgICAweDAwLCAgICAgICAgICAgIDB4ZmYsICAg
ICAweGIzLCAgICAgIDB4NzAsICAgICAweDcwfSwKKwl7MHhjZCwgICAweGE1LCAgICAweDIwLCAg
ICAgICAweDAwLCAgICAgMHgwMCwgICAgICAgICAgICAweGZmLCAgICAgMHhiMywgICAgICAweDcw
LCAgICAgMHg3MH0sCisJezB4OTksICAgMHg2NSwgICAgMHgyMCwgICAgICAgMHgwMCwgICAgIDB4
MDAsICAgICAgICAgICAgMHhmZiwgICAgIDB4YjMsICAgICAgMHg3MCwgICAgIDB4NzB9LAorCXsw
eDgyLCAgIDB4NGQsICAgIDB4MjAsICAgICAgIDB4MDAsICAgICAweDAwLCAgICAgICAgICAgIDB4
ZmYsICAgICAweGIzLCAgICAgIDB4NzAsICAgICAweDcwfSwKIH07CiAKIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgYWJtX3BhcmFtZXRlcnMgKiBjb25zdCBhYm1fc2V0dGluZ3NbXSA9IHsKLS0gCjIuMjIu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
