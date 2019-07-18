Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CCF6CAD9
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jul 2019 10:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64BA46E354;
	Thu, 18 Jul 2019 08:20:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780045.outbound.protection.outlook.com [40.107.78.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB7C6E353
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jul 2019 08:20:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lfs10PQNvv4T70jmckXntmZoHtUjuVBHyV3vfKnsWPzoM5Y+jZsum2z/b818CnKU/Y1AXkB1adi2fIX0TCJRAWPIGi6+kjSsrCCCbvyGmWgErs6Nf37d2HeyiC1l79WjksAjSW+V7DYIlOnyXJWbfv9DgUBqmEtCgwxY+qB5f5+jrT64Zbc1/7us00YaKwqkRf5oBdhc9tmDXkO0Vc22M4Y/9W4787N7Ql0LdF8tymWkJdD2mwx6vjGsmLQhwZVDXWeLuK8Qo/NtMKewL0cS9+cQKHoQoQE8BdHFhtWOk01dTxoym+nLmoCybF+D+ta46gCs+QldYeDv5+wPWsvpVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IB6CCsnJFrSJIpQkx9L+pkeQYIy5FsTzaQZbyWC+PL8=;
 b=GwNki8lCyg46Pp0F+a4HD3yhZOWoiUuIkf/QHDJcdyS0SlyWuA+jEWECzf9J4MKxrzOkK2HXQ8jnbGTR/KbUVlYGnH+NT+FNr/jilu+gAHbg32wWFw5/vxknit3Iz/o6hi3Av4Dy5EI7Insc3kq/+oTttzDGj/UF2o/NdGScDlOp8fffHfMeSC66fzaYUDlNNLOB5a+759kAKlt8hAiPJdVZ94susi+xE2Qxx5x0y6woFyw/OEXoPH8amLLOC9KiPQLJ1IBzAfgRwu/gX/lfgLrrvqJDRpIoLRSzY6s7VMER+ozJ+KA/LDDWTuHUHxAFCjBS5MxYwHXXkYAUFQAZ2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from BN6PR1201CA0021.namprd12.prod.outlook.com
 (2603:10b6:405:4c::31) by BY5PR12MB3921.namprd12.prod.outlook.com
 (2603:10b6:a03:1a2::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Thu, 18 Jul
 2019 08:20:45 +0000
Received: from BY2NAM03FT023.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by BN6PR1201CA0021.outlook.office365.com
 (2603:10b6:405:4c::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14 via Frontend
 Transport; Thu, 18 Jul 2019 08:20:44 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT023.mail.protection.outlook.com (10.152.84.226) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 18 Jul 2019 08:20:44 +0000
Received: from hawzhang-All-Series.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Thu, 18 Jul 2019 03:20:42 -0500
From: Hawking Zhang <Hawking.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 4/4] drm/amdgpu: drop ras self test
Date: Thu, 18 Jul 2019 16:20:14 +0800
Message-ID: <1563438014-29690-4-git-send-email-Hawking.Zhang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563438014-29690-1-git-send-email-Hawking.Zhang@amd.com>
References: <1563438014-29690-1-git-send-email-Hawking.Zhang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39850400004)(136003)(396003)(376002)(2980300002)(428003)(189003)(199004)(126002)(53936002)(6666004)(5660300002)(11346002)(476003)(2616005)(36756003)(53416004)(47776003)(478600001)(4326008)(356004)(8936002)(26005)(81156014)(50226002)(48376002)(76176011)(305945005)(186003)(81166006)(68736007)(336012)(6916009)(51416003)(14444005)(7696005)(8676002)(2351001)(2906002)(70586007)(86362001)(70206006)(486006)(426003)(16586007)(316002)(50466002)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB3921; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bae3dd8-7453-411c-5697-08d70b58d44a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BY5PR12MB3921; 
X-MS-TrafficTypeDiagnostic: BY5PR12MB3921:
X-Microsoft-Antispam-PRVS: <BY5PR12MB392124AD314EB754C3A7BB05FCC80@BY5PR12MB3921.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 01026E1310
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: h/Ex9iKBilK2sPfIOcnnvY8GEu/H2KHC9jMDlY93LRUh413LRCe6SP9N8ygJcRMUKSScvnYkK5m0AfpkPFy7V6/dzm96HFLUV/vTLcZ8NUVjjK4Zv6BaljN+oEDYjmAHQiDuUHhENQ4OSmy2pemwFPHfl0WjmGr+jg3fOL2EotT0N/7apVhLeN8Ezib3WyFJT5zfQv30LCYQyUNI0KCBlZdLS9n6n8pgVQ5KdwwkPonaU/8SmLW9qP6dra4xPdkeHrcCOhHMkbpR6zPmes0DNQZsR4jq/HtzyYyQrawtLcqlwj+tg7zGTK6zXbVC6aGiHIHbZ9+chJ5d/473xT70+AJXC6S9xiteVyn5cGFuf6XqXzmhgkmjNALPZ06zpMAbYfKqbpCkvbhj9ebb3q6FF+ygjzlHS2lACdOEYimfpYM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2019 08:20:44.1292 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bae3dd8-7453-411c-5697-08d70b58d44a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3921
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IB6CCsnJFrSJIpQkx9L+pkeQYIy5FsTzaQZbyWC+PL8=;
 b=dB7HKEHdkcQOkXO7SW0BsqWzayV4/AZypQHFUukG/hd109X4rAWrthptXHvT3lg/7152kUNa1VM3I0pVANEBcPElFKl/QLAraprlGN8JnDE9U73u5PxQBeKXwWQAPKtLQeG8kSp8yZz3wZ53uiWA492THLZMk5x8paMMaaKjs6w=
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
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

dGhpcyBmdW5jdGlvbiBpcyBub3QgbmVlZGVkIGFueSBtb3JlLiBlcnJvciBpbmplY3Rpb24gaXMK
dGhlIG9ubHkgd2F5IHRvIHZhbGlkYXRlIHJhcyBidXQgaXQgY2FuJ3QgYmUgZXhlY3V0ZWQgaW4K
YW1kZ3B1X3Jhc19pbml0LCB3aGVyZSBncHUgaXMgZXZlbiBub3QgaW5pdGlhbGl6ZWQKClNpZ25l
ZC1vZmYtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgfCA3IC0tLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9yYXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9y
YXMuYwppbmRleCA1ZWU3M2Y1Li40YTUwYmVmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3Jhcy5jCkBAIC02NiwxMSArNjYsNiBAQCBzdGF0aWMgaW50IGFtZGdwdV9yYXNfcmVz
ZXJ2ZV92cmFtKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogc3RhdGljIGludCBhbWRncHVf
cmFzX3JlbGVhc2VfdnJhbShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJc3RydWN0IGFt
ZGdwdV9ibyAqKmJvX3B0cik7CiAKLXN0YXRpYyB2b2lkIGFtZGdwdV9yYXNfc2VsZl90ZXN0KHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQotewotCS8qIFRPRE8gKi8KLX0KLQogc3RhdGljIHNz
aXplX3QgYW1kZ3B1X3Jhc19kZWJ1Z2ZzX3JlYWQoc3RydWN0IGZpbGUgKmYsIGNoYXIgX191c2Vy
ICpidWYsCiAJCQkJCXNpemVfdCBzaXplLCBsb2ZmX3QgKnBvcykKIHsKQEAgLTE1MjEsOCArMTUx
Niw2IEBAIGludCBhbWRncHVfcmFzX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJ
aWYgKGFtZGdwdV9yYXNfZnNfaW5pdChhZGV2KSkKIAkJZ290byBmc19vdXQ7CiAKLQlhbWRncHVf
cmFzX3NlbGZfdGVzdChhZGV2KTsKLQogCURSTV9JTkZPKCJSQVMgSU5GTzogcmFzIGluaXRpYWxp
emVkIHN1Y2Nlc3NmdWxseSwgIgogCQkJImhhcmR3YXJlIGFiaWxpdHlbJXhdIHJhc19tYXNrWyV4
XVxuIiwKIAkJCWNvbi0+aHdfc3VwcG9ydGVkLCBjb24tPnN1cHBvcnRlZCk7Ci0tIAoyLjcuNAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
