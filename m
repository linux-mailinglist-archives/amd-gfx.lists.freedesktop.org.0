Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DE169DA0
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3126D89BF3;
	Mon, 15 Jul 2019 21:21:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700085.outbound.protection.outlook.com [40.107.70.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C4989BF3
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=maBuGAEpZUj69yDjVbgHTdEdfdHgV3T+C26qek1/5aQ+64VNtJZ9I5WWS5eOURRu+hRnzExHHwM3aoEPtKKGeSPmf7FbGOd3CnAKdMQhi4mqn5YcQq8TndSKnQWBdabJ6kRxo6sToEAyTr6qFzY58COV53e7UnQ5FzHuTL/zj81Z+XfnfdFmDKvb9IZL7Qhs0dEyTlamIXGK4VaGBlwEkO4XmEsUHXJS3mZ6pE8JepxCvf/0ZKewnftHUOQ+/I5H09tFkTgHsouhuSPhaMPHlDSEUG5/Z6kFC++i2G5er4zKm4Z81911FTot5Jp8TbKAIJlGm1fKIAeF5CWGKwCumg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6C45zADKOE7CuNuBE8W/u2S/9TjirALVKyZBp1Z4nR4=;
 b=lF8GONJ1Mv6/lLGJ1EvSKoumFPmFdKfPIi/4YcFxKVrW9INp10bjvhmAz++FLBLCdnlRjTTXRKkdaoeXmHaX8NFmb9K0tzyWhPCMoowWeaH/Ry0jqirRKUAKCZlAjPRgbmmOBdmdyyp87AAURHXrQTqi01RMTzts3gxlBlehvG5gPEmB0Lqi9jyVUK0+yqpIv7YdwbdZlVhLVc1Tx2jkd3uTSNzBKVwevkyE0f0oU8ZGvtTfjN0QoSsuU8gWh+juKVFNfJdeFB7N/LNeSb26GfasTPJCSXIha4Jf7x0wsy63yQ2kQH6gHp7eXCHEdlxehlDBZ4KqbTcsQXBfadSgzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR12CA0041.namprd12.prod.outlook.com (2603:10b6:301:2::27)
 by CY4PR12MB1925.namprd12.prod.outlook.com (2603:10b6:903:120::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.10; Mon, 15 Jul
 2019 21:21:22 +0000
Received: from CO1NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by MWHPR12CA0041.outlook.office365.com
 (2603:10b6:301:2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.14 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:22 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT009.mail.protection.outlook.com (10.152.80.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:21 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:09 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 16/87] drm/amd/display: skip retrain in
 dc_link_set_preferred_link_settings() if using passive dongle
Date: Mon, 15 Jul 2019 17:19:38 -0400
Message-ID: <20190715212049.4584-17-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(346002)(136003)(2980300002)(428003)(189003)(199004)(2616005)(8676002)(81156014)(81166006)(316002)(54906003)(486006)(8936002)(476003)(126002)(446003)(11346002)(49486002)(50226002)(86362001)(68736007)(6916009)(26005)(76176011)(51416003)(14444005)(2870700001)(47776003)(426003)(336012)(36756003)(50466002)(48376002)(2906002)(2876002)(4326008)(186003)(70586007)(70206006)(1076003)(2351001)(305945005)(6666004)(356004)(53936002)(478600001)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1925; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f2202f0-ff9e-44ee-d049-08d7096a6289
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1925; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1925:
X-Microsoft-Antispam-PRVS: <CY4PR12MB19256C05C8EE7338120F5AB082CF0@CY4PR12MB1925.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 7yvz1b2I37aJpEqfR3rN7Dz8e4Jy+Jkq+21ghV8xc+10gAnuQ/+/Jsxzx9aN7QixTxJBVG0HSpWzSik2GhEFhw/bvLsjKrMiVbiNxjUWQdkYKv75PsV4OPZCej07Do5YyCNUZbNUugHO4NJHhKsaHu9qBMVGUwMM9/PG01co+2SU5Z1t9DeHxf7n7It2COZilJ0euKBQw98ia0iA2ZdUltfU9aXSz3zamYs2JIAveFaxoQVrNSAV+t3atZI25Rs4cB4tFJAanX5Jl2yQVJbTouFbi6VW2ZuRT7MG40qS52/m5LgB8Go0A3J+f0ZyCONAXGdwioDMmH3OBxUtoCeW4tFmweNrFgqn0WMIY1fpKa6PfPd7qSLQBtpyQIKYIeI/dRm9tKH7pMIdCk4LunN7J4/rDcVbsQfPbDHUh2yojp8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:21.8575 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f2202f0-ff9e-44ee-d049-08d7096a6289
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1925
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6C45zADKOE7CuNuBE8W/u2S/9TjirALVKyZBp1Z4nR4=;
 b=Ek3rqUWc3T7KA26sSbYgor3LL+C7CJ6aQ9rR/dvjNJQtZhgqr61AR/Tv21ndqLPzh1yKdZopx0Sq1+TTITYuDvbDD7LJ5UYrNKG5/qNWWcBhSPXTsB7bwGnckekLb/HuKjMl7i46wWpstGDZN4qUM8Yq5kAx+LYlk36li4vV5lE=
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
Cc: Leo Li <sunpeng.li@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Samson Tam <Samson.Tam@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogU2Ftc29uIFRhbSA8U2Ftc29uLlRhbUBhbWQuY29tPgoKW1doeV0KRml4ZXMgaXNzdWUg
d2hlbiB3ZSBoYXZlIGEgZGlzcGxheSBjb25uZWN0ZWQgdXNpbmcgYSBwYXNzaXZlCmRvbmdsZSBh
bmQgdGhlbiBlbXVsYXRlIG92ZXIgaXQgdXNpbmcgYSBEUCBjb25uZWN0aW9uIGF0IDEgeCAxLjYy
IEdoei4KU3lzdGVtIGhhbmdzIGJlY2F1c2UgcmVnaXN0ZXIgYnVzIHJldHVybnMgYmFjayAweEZG
RkZGRkZGIGZvciBhbGwKcmVnaXN0ZXIgcmVhZHMgYWZ0ZXIgc2V0dGluZyByZWdpc3RlciBESUdf
QkVfQ05UTCBpbgpkY24xMF9saW5rX2VuY29kZXJfY29ubmVjdF9kaWdfYmVfdG9fZmUoKS4gIEhh
bmcgb2NjdXJzIGxhdGVyCndoZW4gdHJ5aW5nIHRvIGRvIGEgcmVnaXN0ZXIgcmVhZC4KCltIb3dd
CkF0IHRoZSBzdGFydCBvZiB0aGUgZW11bGF0aW9uLCBkY19saW5rX3NldF9wcmVmZXJyZWRfbGlu
a19zZXR0aW5ncygpCmFuZCBkcF9yZXRyYWluX2xpbmtfZHBfdGVzdCgpIGlzIGNhbGxlZCwgZXZl
biB0aG91Z2ggaXQgaXMgY29ubmVjdGVkCnVzaW5nIGEgcGFzc2l2ZSBkb25nbGUuCgpBZGQgYW4g
ZXh0cmEgY29uZGl0aW9uIGluIGRwX3JldHJhaW5fbGlua19kcF90ZXN0KCkgdG8gY2hlY2sgZm9y
CmxpbmstPmRvbmdsZV9tYXhfcGl4X2NsayA+IDAuICBUaGlzIGlzIHRoZSBvbmx5IHdheSB3ZSBr
bm93IGlmIHRoZQpjb25uZWN0aW9uIGlzIHVzaW5nIHBhc3NpdmUgZG9uZ2xlIHNvIHdlIGRvbid0
IHJldHJhaW4gRFAuCgpTaWduZWQtb2ZmLWJ5OiBTYW1zb24gVGFtIDxTYW1zb24uVGFtQGFtZC5j
b20+ClJldmlld2VkLWJ5OiBKdW4gTGVpIDxKdW4uTGVpQGFtZC5jb20+CkFja2VkLWJ5OiBMZW8g
TGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY29yZS9kY19saW5rLmMgfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvY29yZS9kY19saW5rLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29y
ZS9kY19saW5rLmMKaW5kZXggMDkxOGMzMzRmMGUyLi4wMmExOGY2YWEwMDkgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMKQEAgLTI5OTgsOCArMjk5
OCwxMCBAQCB2b2lkIGRjX2xpbmtfc2V0X3ByZWZlcnJlZF9saW5rX3NldHRpbmdzKHN0cnVjdCBk
YyAqZGMsCiAKIAkvKiBSZXRyYWluIHdpdGggcHJlZmVycmVkIGxpbmsgc2V0dGluZ3Mgb25seSBy
ZWxldmFudCBmb3IKIAkgKiBEUCBzaWduYWwgdHlwZQorCSAqIENoZWNrIGZvciBub24tRFAgc2ln
bmFsIG9yIGlmIHBhc3NpdmUgZG9uZ2xlIHByZXNlbnQKIAkgKi8KLQlpZiAoIWRjX2lzX2RwX3Np
Z25hbChsaW5rLT5jb25uZWN0b3Jfc2lnbmFsKSkKKwlpZiAoIWRjX2lzX2RwX3NpZ25hbChsaW5r
LT5jb25uZWN0b3Jfc2lnbmFsKSB8fAorCQlsaW5rLT5kb25nbGVfbWF4X3BpeF9jbGsgPiAwKQog
CQlyZXR1cm47CiAKIAlmb3IgKGkgPSAwOyBpIDwgTUFYX1BJUEVTOyBpKyspIHsKLS0gCjIuMjIu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
