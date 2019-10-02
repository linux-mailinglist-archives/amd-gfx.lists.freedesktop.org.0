Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BA3C9088
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 20:16:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918036E903;
	Wed,  2 Oct 2019 18:16:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720083.outbound.protection.outlook.com [40.107.72.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B4A6E196
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 18:16:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PI9n7KeXeoca6yZHwN57/T9q+M6XWjziHajTJJTtUNMeRCDlCC/yNUVv6nVEgy2pJUDkdC1Z86gFCjgq3et0t8HS69jYCUUgWlgyLEKROR0w1WsKpisyc2M+FOuWppjsxTIXpItmhDlsmuP30Ia+vA5fDoO+3Taeqy1g9j89bXPrt+SLnRiuyTu6dZ8boNTkwPWXszejt3MQSuzBx4xsHpHBeXSGbf+tWOUzc0N2WUgcafS1wYN5v7jq8WA55PRWfElzOxQKdprmuvr2lGRLr8UmV68RZlLIPa5J4Yyvn01yS63qCdyT1T1ARQhFjR/UzMwT0VNDigrfPnk3tUkoQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7JepIrHtEwN/WYHTJu8t2TXX1zO5j3NSgKK4V3nlYYE=;
 b=cKEWpgJV6ok5p7jEwVwdfV84Ccf0uIlEOLfwcbqwPmL2S1s6+f2T55h4dS7DMYdsa9HvmyF3nO3jxun4/W6zWGgMzOftxi1wlb9I5MliqVoB+LNv9+DR4bTdj0KdiowrGCIvqk/esWKtH/nw73MKj6JSZ+67i/1qwhUtlgjtoQjZcMzsFfE5jppjYqtZjcR01G7gxtglpdHlqtk4AGx+rChHCyYcZMhyspYafJkJkovSGtQgtjfgNQa+W6A2Eehjpb+KNkyu+jkpJsLobXlQ4mHuaiht9As+Hj1V7FYtxoEDNcP+GnDg0mZpI3w4QLwDqQ56byDdDpPTo8xywC4gSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0004.namprd12.prod.outlook.com (2603:10b6:4:1::14) by
 BN6PR1201MB0001.namprd12.prod.outlook.com (2603:10b6:404:a7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Wed, 2 Oct
 2019 18:16:42 +0000
Received: from DM3NAM03FT005.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::202) by DM5PR12CA0004.outlook.office365.com
 (2603:10b6:4:1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.15 via Frontend
 Transport; Wed, 2 Oct 2019 18:16:42 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT005.mail.protection.outlook.com (10.152.82.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 2 Oct 2019 18:16:42 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 2 Oct 2019
 13:16:40 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 15/38] drm/amd/display: Restore should_update_pstate_support
 after bad revert
Date: Wed, 2 Oct 2019 14:16:10 -0400
Message-ID: <20191002181633.22805-16-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
References: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(39860400002)(396003)(376002)(428003)(199004)(189003)(6666004)(356004)(86362001)(336012)(76176011)(48376002)(2351001)(26005)(8936002)(81156014)(50226002)(81166006)(8676002)(186003)(70586007)(7696005)(5660300002)(50466002)(51416003)(478600001)(70206006)(6916009)(2906002)(16586007)(1076003)(14444005)(4326008)(446003)(305945005)(2616005)(53416004)(11346002)(36756003)(476003)(316002)(126002)(426003)(47776003)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0001; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb8c97c9-ef34-44d0-0077-08d74764ad05
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0001:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB00016A2418E88D26BCEBAB43F99C0@BN6PR1201MB0001.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 0178184651
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JDAs63j06VuwXry7fvvOvUAapSxZNSsezdbIfD9EQSOoJH2nNr09pIA93Z32N54fDq5SUn44HvFxXHraw923NQru1Jip5yDrT1WKyQIAus497NvDObrZYcVrTOCxo9P2dOvTa7/VCjdblNTvnnRE9v9y31/0KbneShTHubbQYcxfjsOjyMlWWwQpCyQQO7oBTo5McfKcx2pG0fNcvUoExBcumY2cnaWQSdBvFxK1+BhWKf9X5Wqd+4Nu/IXZZPh6fIyf7bTHI8x0zpMRe9fErrINKY518RxALnZs9SMbKNsB+g/QJcEckRM4PwVQZjEsLqXL9Dy5uWi/YPd39WJRvGDc5FkkUD2mzOIeGOSeOSxrr6BgMUJuY7bECat+cBIBdN1xfzISFzM6ZpxNPI5g3y7l3Hx33fLcKboB6jBKVK0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2019 18:16:42.0051 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb8c97c9-ef34-44d0-0077-08d74764ad05
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0001
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7JepIrHtEwN/WYHTJu8t2TXX1zO5j3NSgKK4V3nlYYE=;
 b=TtgK+WeYjAQ5aUO8riQqFg0CCposd3x8Ih4rMjXX1ZE+gVjLNXiCppwBIry+MKHKQZ4uYAwIT5fDgGYCrUD1N9mWKY+McGeUobFXB0JCD6U/r91IxESkZo63kXBuBOEA5Zf4VJ34VEqoUK2Z3DMNiBQnZ2I0EkxHq8zts4DyWWY=
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
Cc: Joshua Aberback <joshua.aberback@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSm9zaHVhIEFiZXJiYWNrIDxqb3NodWEuYWJlcmJhY2tAYW1kLmNvbT4KCltXaHldClRo
aXMgZnVuY3Rpb24gd2FzIG1pc3Rha2VubHkgcmV2ZXJ0ZWQgYXMgcGFydCBvZiBhIGxlZ2l0aW1h
dGUgcmV2ZXJ0LiBUaGUKb2xkIHZlcnNpb24gdGhhdCB3YXMgcmV2ZXJ0ZWQgdG8gaGFzIGJhZCBs
b2dpYywgYW5kIGlzIGNhdXNpbmcgc2l0dWF0aW9ucwp3aGVyZSBwLXN0YXRlIGNoYW5nZSBzdXBw
b3J0IGlzIGJlaW5nIHRvZ2dsZWQgd2hlbiBpdCBzaG91bGRuJ3QgYmUsCnJlc3VsdGluZyBpbiBo
YW5ncy4KCkNoYW5nZS1JZDogSTdiMjU3NTUyZjI1MWFmNWFkMjMwOTFhN2Q2Y2ZiYjVlODFiZjQ1
NjcKU2lnbmVkLW9mZi1ieTogSm9zaHVhIEFiZXJiYWNrIDxqb3NodWEuYWJlcmJhY2tAYW1kLmNv
bT4KUmV2aWV3ZWQtYnk6IEp1biBMZWkgPEp1bi5MZWlAYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdh
bnByZWV0IExha2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgotLS0KIC4uLi9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2luYy9ody9jbGtfbWdyX2ludGVybmFsLmggICB8IDEwICsrKysrKysr
LS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9ody9jbGtfbWdyX2lu
dGVybmFsLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L2Nsa19tZ3Jf
aW50ZXJuYWwuaAppbmRleCAyMTMwNDZkZTE2NzUuLjdkZDQ2ZWI5NmQ2NyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9ody9jbGtfbWdyX2ludGVybmFsLmgK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9ody9jbGtfbWdyX2ludGVy
bmFsLmgKQEAgLTI4MSw4ICsyODEsMTQgQEAgc3RhdGljIGlubGluZSBib29sIHNob3VsZF9zZXRf
Y2xvY2soYm9vbCBzYWZlX3RvX2xvd2VyLCBpbnQgY2FsY19jbGssIGludCBjdXJfY2wKIAogc3Rh
dGljIGlubGluZSBib29sIHNob3VsZF91cGRhdGVfcHN0YXRlX3N1cHBvcnQoYm9vbCBzYWZlX3Rv
X2xvd2VyLCBib29sIGNhbGNfc3VwcG9ydCwgYm9vbCBjdXJfc3VwcG9ydCkKIHsKLQkvLyBXaGVu
ZXZlciB3ZSBhcmUgdHJhbnNpdGlvbmluZyBwc3RhdGUgc3VwcG9ydCwgd2UgYWx3YXlzIHdhbnQg
dG8gbm90aWZ5IHByaW9yIHRvIGNvbW1pdHRpbmcgc3RhdGUKLQlyZXR1cm4gKGNhbGNfc3VwcG9y
dCAhPSBjdXJfc3VwcG9ydCkgPyAhc2FmZV90b19sb3dlciA6IGZhbHNlOworCWlmIChjdXJfc3Vw
cG9ydCAhPSBjYWxjX3N1cHBvcnQpIHsKKwkJaWYgKGNhbGNfc3VwcG9ydCA9PSB0cnVlICYmIHNh
ZmVfdG9fbG93ZXIpCisJCQlyZXR1cm4gdHJ1ZTsKKwkJZWxzZSBpZiAoY2FsY19zdXBwb3J0ID09
IGZhbHNlICYmICFzYWZlX3RvX2xvd2VyKQorCQkJcmV0dXJuIHRydWU7CisJfQorCisJcmV0dXJu
IGZhbHNlOwogfQogCiBpbnQgY2xrX21ncl9oZWxwZXJfZ2V0X2FjdGl2ZV9kaXNwbGF5X2NudCgK
LS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
