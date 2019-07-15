Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F20669DE4
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:22:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF00189D7B;
	Mon, 15 Jul 2019 21:22:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-bn3nam04on0610.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4e::610])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E41789D52
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:22:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M8YO9QiqRp19QQ7ptLLOm/yoCYnUcye33EU/PaZhMCRm5Xp+BnlhlyX+E0cXq0+u+gqfTOjtsXVQG2KTMS3/d05P5o2PH4vOW1Dp0EBMpdy+cScdn0TWqXp2IV2KKUmcYk0lzlwSj8qDxbsDTD9eaB29R8+55nT35CJ1M4Y7+GFGAuALc+GR8bj7BTYiR1KqOh32fkcTOWanij3IjBxn6SwJXC1sAfVpT+5raB16HRJgFE3gTdLS5hcGVfbdaXWT3xJs2ixzqcsQjj+w6TcWuMrxU71DlPim6Bx+3zu2sxKu4W5zkJ9BZYXmqt4xmzQmu9qz1sM2YzessVEIPPV1QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcjso0z9rFPrdkHmQ3zCbQLxGSc/6JlcpucNIKoJ8/Q=;
 b=CmU5qs5/cpwAcA2cHx/D+bzXsvFh02/WVfkY5OVmxSSA/JkhRQ3QVhIyE4llvLGHlbWpmtJk1e3FNPZL8jyqFx/ecdP3ya7qQzpcA7BtGfGml9heQ+4fjrRcsN9Nyx4WZNKV/WNVlcsSriymBEyxRPh5dNy6+SschNfslX5TA02qZaaUPyS7ELltAbLJO+R7GcwDiXmDAH8co5jBvGePepeyeMvh6PdmPZPyMq27xNQL+l4+jjYq/bWHLaK8z0yE7OytxhG3/qOxtm2uBQX/umJQehdhdS63T4xBCb2QJptxoY4ZkymighdMXWuLu7mOMFOfCEqsxDPWBLw1Z+4otA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM3PR12CA0103.namprd12.prod.outlook.com (2603:10b6:0:55::23) by
 CY4PR12MB1926.namprd12.prod.outlook.com (2603:10b6:903:11b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.10; Mon, 15 Jul
 2019 21:22:02 +0000
Received: from CO1NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::202) by DM3PR12CA0103.outlook.office365.com
 (2603:10b6:0:55::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.10 via Frontend
 Transport; Mon, 15 Jul 2019 21:22:02 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT048.mail.protection.outlook.com (10.152.81.49) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:22:02 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:40 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 79/87] drm/amd/display: do not read link setting if edp not
 connected
Date: Mon, 15 Jul 2019 17:20:41 -0400
Message-ID: <20190715212049.4584-80-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(39860400002)(346002)(2980300002)(428003)(199004)(189003)(2351001)(14444005)(486006)(8936002)(126002)(5660300002)(316002)(36756003)(186003)(26005)(86362001)(426003)(4326008)(70586007)(356004)(70206006)(49486002)(1076003)(68736007)(54906003)(50466002)(48376002)(53936002)(478600001)(446003)(11346002)(2616005)(76176011)(6916009)(476003)(2876002)(336012)(50226002)(2906002)(81166006)(2870700001)(51416003)(305945005)(47776003)(8676002)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1926; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a94ff5e2-9d19-46ec-d14d-08d7096a7a9f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1926; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1926:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1926B01797E87C4CC28AA14082CF0@CY4PR12MB1926.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: aeUM+mDmcLeqDkxbIV+uiV7wPn3TXWpbUr2kU3RuJ8qFtmoUJ+3/fBmqgmuzt21QtbnEP8Gkd+nRxf2EPc881DXFX8G1QY4ypRRjGiUyXGEI9/aWY/Dva0BV0ptb7+CQK3YM5+B63+nWOJrfUN8KhWgQnJSahydfjn7GkYfcccykM4EPL4DyXPNYemUuvmTMIwdziTrKtzN0LWCreUUiUMaMeyqf/QFa5bT/FabBfVXtkZx6gtTKkA+OJ2coA//eyXVUWT7Og+IMli5ZI39+7EkY3T6ckF32T5elz9HZ89mMMNzsNLZPNPJooYDTHeKUhiiLgvXt1rvXz5TTtviORtyjnXSZm7kVG1c9S2+Q1ghe6OfZEwLR2fvlH3a/KPGsldsYYyg9Ige/kSSGFYBfp9i6XDFsqrzXlVOBBrr6yWE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:22:02.2750 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a94ff5e2-9d19-46ec-d14d-08d7096a7a9f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1926
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcjso0z9rFPrdkHmQ3zCbQLxGSc/6JlcpucNIKoJ8/Q=;
 b=bXArvuCQ2+k/bOJGXKi5Vwd5BR0rsD46TepMbbnZlx7qmoVjM0fxJx7UeiVnOSwa96GN4re0pqOSfu4/ojl51RIsxaWK/rgFbgey6Dd7SZ9nBHgoqD6W8HxdTYu4C3BOj3qGlsarN2KWuw1lrXEPHmbeMVZOYCZmn8/s9klHNko=
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
Cc: Leo Li <sunpeng.li@amd.com>, Yongqiang Sun <yongqiang.sun@amd.com>,
 Eric Yang <Eric.Yang2@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXJpYyBZYW5nIDxFcmljLllhbmcyQGFtZC5jb20+CgpbV2h5XQpQcmV2aW91c2x5IGFz
c3VtZSBlRFAgc2luayBwcmVzZW50IGlmIGNvbm5lY3RvciBwcmVzZW50LiBEbyBub3QKbmVlZCB0
byBlbmZvcmNlIHRoaXMgcmVzdHJpY3Rpb24uIEZpeCBpc3N1ZSB3aGVyZSBkcml2ZXIgYXR0ZW1w
dAp0byByZWFkIGxpbmsgc2V0dGluZyBldmVuIHRob3VnaCBubyBlZHAgY29ubmVjdGVkLgoKe0hv
d10KT25seSByZWFkIGxpbmsgc2V0dGluZyBhZnRlciByZWFkaW5nIGNvbm5lY3Rpb24gc3RhdHVz
LgoKU2lnbmVkLW9mZi1ieTogRXJpYyBZYW5nIDxFcmljLllhbmcyQGFtZC5jb20+ClJldmlld2Vk
LWJ5OiBZb25ncWlhbmcgU3VuIDx5b25ncWlhbmcuc3VuQGFtZC5jb20+CkFja2VkLWJ5OiBMZW8g
TGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY29yZS9kY19saW5rLmMgfCA4ICstLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2NvcmUvZGNfbGluay5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2NvcmUvZGNfbGluay5jCmluZGV4IDQ2NzAxNmRkZmJlOC4uOTE2NmU0MTI0OGQ4IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jCkBAIC03MjAsMTMg
KzcyMCw2IEBAIGJvb2wgZGNfbGlua19kZXRlY3Qoc3RydWN0IGRjX2xpbmsgKmxpbmssIGVudW0g
ZGNfZGV0ZWN0X3JlYXNvbiByZWFzb24pCiAJCXJldHVybiBmYWxzZTsKIAl9CiAKLQlpZiAobGlu
ay0+Y29ubmVjdG9yX3NpZ25hbCA9PSBTSUdOQUxfVFlQRV9FRFApIHsKLQkJLyogT24gZGV0ZWN0
LCB3ZSB3YW50IHRvIG1ha2Ugc3VyZSBjdXJyZW50IGxpbmsgc2V0dGluZ3MgYXJlCi0JCSAqIHVw
IHRvIGRhdGUsIGVzcGVjaWFsbHkgaWYgbGluayB3YXMgcG93ZXJlZCBvbiBieSBHT1AuCi0JCSAq
LwotCQlyZWFkX2VkcF9jdXJyZW50X2xpbmtfc2V0dGluZ3Nfb25fZGV0ZWN0KGxpbmspOwotCX0K
LQogCXByZXZfc2luayA9IGxpbmstPmxvY2FsX3Npbms7CiAJaWYgKHByZXZfc2luayAhPSBOVUxM
KSB7CiAJCWRjX3NpbmtfcmV0YWluKHByZXZfc2luayk7CkBAIC03NjgsNiArNzYxLDcgQEAgYm9v
bCBkY19saW5rX2RldGVjdChzdHJ1Y3QgZGNfbGluayAqbGluaywgZW51bSBkY19kZXRlY3RfcmVh
c29uIHJlYXNvbikKIAkJfQogCiAJCWNhc2UgU0lHTkFMX1RZUEVfRURQOiB7CisJCQlyZWFkX2Vk
cF9jdXJyZW50X2xpbmtfc2V0dGluZ3Nfb25fZGV0ZWN0KGxpbmspOwogCQkJZGV0ZWN0X2VkcF9z
aW5rX2NhcHMobGluayk7CiAJCQlzaW5rX2NhcHMudHJhbnNhY3Rpb25fdHlwZSA9CiAJCQkJRERD
X1RSQU5TQUNUSU9OX1RZUEVfSTJDX09WRVJfQVVYOwotLSAKMi4yMi4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
