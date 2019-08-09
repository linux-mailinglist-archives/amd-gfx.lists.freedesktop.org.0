Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A6E884E6
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 23:38:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03FC66EEAC;
	Fri,  9 Aug 2019 21:38:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800051.outbound.protection.outlook.com [40.107.80.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F6C36EEA8
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 21:38:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7dcyY8p/zI2Fn9HIySrnxTnLyKkjlbQs2L/UNj/iq6jpeBhV9tHMAyLOqJ5VceUNHSBHTieRudcaBCjNelFq+DJ38W7EEXEI7vLQ7HMoB+KUd9tYY4FBXHQpxRhf4epamKrV5GQPdd5v2eDSDLL0bUPpW/48/cTTJ0980DK2xVucsEhM4j6mYjQvGx5nFQwNeDQLLRu5QDlCHLaruTqWguY1Jnq1OEuLjyHyzBeZELiGVxal+iVDyGTtbaizLPNaQaYzlEN08GRYf9M9d6/gFZr6xHYl4g2JRkHeD8y14NqDoI8oz8XGgoSE+YaNEuWQCXVi4PBZFlTq+VzqAxjvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+Uy7uCiwbBcHO6neNlBvFFgzsA+T4vZm8GYQrSkHww=;
 b=eX0mxiPDmHuh+rpWZ9wLFC3d7rOW7TAO9FFJPQc7vRCnh1ef3mYdkB201KFAvUwnQxIttz5gVxfckX5uVAWgzZzRFC3YBzhapHWChW5qHVOMrnJgcKmedC4P/9zc9X5COmTWBnymBOxVIuoUtOeiQi0s7H4swYIfCOD0jmA3lGp4CXA/sQOdVZvqIy8ZpCGFVNxyy8gp+oxYoHNQjHWjPtVpuVn8eELlQnLDllIhgmDzXQOr7Ev7kpHDflg29xlr/CGvj33WSFT0w2PNQ+Da+KYm+Bh8xEiWTojB0Fmt448kyyHYwWdscAQrEQuZF/G+KYM0v/904zRKmYUT9Ba+kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR12CA0043.namprd12.prod.outlook.com (2603:10b6:903:129::29)
 by BN7PR12MB2706.namprd12.prod.outlook.com (2603:10b6:408:2a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.14; Fri, 9 Aug
 2019 21:38:18 +0000
Received: from BY2NAM03FT003.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::204) by CY4PR12CA0043.outlook.office365.com
 (2603:10b6:903:129::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.16 via Frontend
 Transport; Fri, 9 Aug 2019 21:38:18 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT003.mail.protection.outlook.com (10.152.84.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Fri, 9 Aug 2019 21:38:18 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Fri, 9 Aug 2019 16:38:08 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 06/49] drm/amd/display: Fix frames_to_insert math
Date: Fri, 9 Aug 2019 17:36:59 -0400
Message-ID: <20190809213742.30301-7-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190809213742.30301-1-sunpeng.li@amd.com>
References: <20190809213742.30301-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(376002)(346002)(39850400004)(2980300002)(428003)(189003)(199004)(47776003)(8676002)(316002)(36756003)(11346002)(26005)(76176011)(23676004)(49486002)(186003)(14444005)(446003)(2870700001)(6666004)(486006)(2906002)(2876002)(54906003)(126002)(476003)(2616005)(356004)(6916009)(53936002)(426003)(336012)(50226002)(8936002)(81166006)(81156014)(305945005)(50466002)(5660300002)(4326008)(86362001)(1076003)(5820100001)(2351001)(70206006)(70586007)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2706; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24a758e3-b5b8-4f52-53c1-08d71d11e4a0
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN7PR12MB2706; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2706:
X-Microsoft-Antispam-PRVS: <BN7PR12MB2706A00067CE6F1A111339AE82D60@BN7PR12MB2706.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 01244308DF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: k8UfP+TytoCDEuv7k+D36MJY2c6VB1U9eUVz0H54hm/k8VfShsmPMrSZvHVixkDRroeSf83KlZwhItkUgPVMGelqwnTAS8N4eVRU1t+sSopLkXBbpQxm1/5ueoavBfdwLJkpXh779b7KTHBEYkrlBwdNqShfS7RrQosgbyAoOb6lMOyQOjnkukzkNBFKgwLak1Yxy2TKNiRuQPzdUIEaW9btrMF8hHNLB2+tZUOvEd+Z9WxiEOU0pUXpTqobdlwuzXgl//d/g25z6akX+WSuOPZUq7EyjDk5XTQJW9fFmXuLbZ5h1brGwDCM+9CVD+6wOgaMcS+98yVx1tGQL1Y6ULfRJXMWSr3s+E2DeeEw1nTny2Ajy3ttk+9pkgcw+kB+aM5FRNE6sGtXzGPW4vTZPlNyqA2AIpIxB6y0yhp0wU0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 21:38:18.1895 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24a758e3-b5b8-4f52-53c1-08d71d11e4a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2706
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+Uy7uCiwbBcHO6neNlBvFFgzsA+T4vZm8GYQrSkHww=;
 b=y55WWYP4JyHq4n5kS/uiBdn2cLurFsf/nCodahObVcqijD7KGkpg3z7RoUFgknbgptwp09miJPOEGALuKn0KHuIC38k3YAMQ1bPwxt330zOqvkcnosWf4vO4L2FNmed3tCT2xNCeocRAOYS49WIE+NnNLRA3f5+WdUeKrd2rgf0=
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
Cc: Leo Li <sunpeng.li@amd.com>, Aric Cyr <Aric.Cyr@amd.com>,
 Bayan Zabihiyan <bayan.zabihiyan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQmF5YW4gWmFiaWhpeWFuIDxiYXlhbi56YWJpaGl5YW5AYW1kLmNvbT4KCltXaHldClRo
ZSBtYXRoIG9uIGRlY2lkaW5nIG9uIGhvdyBtYW55CiJmcmFtZXMgdG8gaW5zZXJ0IiBzb21ldGlt
ZXMgc2VudCB1cyBvdmVyIHRoZSBtYXggcmVmcmVzaCByYXRlLgpBbHNvIGludGVnZXIgb3ZlcmZs
b3cgY2FuIG9jY3VyIGlmIHdlIGhhdmUgaGlnaCByZWZyZXNoIHJhdGVzLgoKW0hvd10KSW5zdGVh
ZCBvZiBjbGlwcGluZyB0aGUgIGZyYW1lIGR1cmF0aW9uIHN1Y2ggdGhhdCBpdCBkb2VzbuKAmXQg
Z28gYmVsb3cgdGhlIG1pbiwKanVzdCByZW1vdmUgYSBmcmFtZSBmcm9tIHRoZSBudW1iZXIgb2Yg
ZnJhbWVzIHRvIGluc2VydC4gKwpVc2UgdW5zaWduZWQgbG9uZyBsb25nIGZvciBpbnRlcm1lZGlh
dGUgY2FsY3VsYXRpb25zIHRvIHByZXZlbnQKaW50ZWdlciBvdmVyZmxvdy4KClNpZ25lZC1vZmYt
Ynk6IEJheWFuIFphYmloaXlhbiA8YmF5YW4uemFiaWhpeWFuQGFtZC5jb20+ClJldmlld2VkLWJ5
OiBBcmljIEN5ciA8QXJpYy5DeXJAYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5s
aUBhbWQuY29tPgotLS0KIC4uLi9hbWQvZGlzcGxheS9tb2R1bGVzL2ZyZWVzeW5jL2ZyZWVzeW5j
LmMgICB8IDI3ICsrKysrKysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRp
b25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvbW9kdWxlcy9mcmVlc3luYy9mcmVlc3luYy5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L21vZHVsZXMvZnJlZXN5bmMvZnJlZXN5bmMuYwppbmRleCAxOWIxZWFlYmU0ODQu
LjAwMGE5ZGI5ZGFkOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21v
ZHVsZXMvZnJlZXN5bmMvZnJlZXN5bmMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvbW9kdWxlcy9mcmVlc3luYy9mcmVlc3luYy5jCkBAIC00MzMsNiArNDMzLDEyIEBAIHN0YXRp
YyB2b2lkIGFwcGx5X2JlbG93X3RoZV9yYW5nZShzdHJ1Y3QgY29yZV9mcmVlc3luYyAqY29yZV9m
cmVlc3luYywKIAkJLyogRWl0aGVyIHdlJ3ZlIGNhbGN1bGF0ZWQgdGhlIG51bWJlciBvZiBmcmFt
ZXMgdG8gaW5zZXJ0LAogCQkgKiBvciB3ZSBuZWVkIHRvIGluc2VydCBtaW4gZHVyYXRpb24gZnJh
bWVzCiAJCSAqLworCQlpZiAobGFzdF9yZW5kZXJfdGltZV9pbl91cyAvIGZyYW1lc190b19pbnNl
cnQgPAorCQkJCWluX291dF92cnItPm1pbl9kdXJhdGlvbl9pbl91cyl7CisJCQlmcmFtZXNfdG9f
aW5zZXJ0IC09IChmcmFtZXNfdG9faW5zZXJ0ID4gMSkgPworCQkJCQkxIDogMDsKKwkJfQorCiAJ
CWlmIChmcmFtZXNfdG9faW5zZXJ0ID4gMCkKIAkJCWluc2VydGVkX2ZyYW1lX2R1cmF0aW9uX2lu
X3VzID0gbGFzdF9yZW5kZXJfdGltZV9pbl91cyAvCiAJCQkJCQkJZnJhbWVzX3RvX2luc2VydDsK
QEAgLTg4NSw4ICs4OTEsOCBAQCB2b2lkIG1vZF9mcmVlc3luY19idWlsZF92cnJfcGFyYW1zKHN0
cnVjdCBtb2RfZnJlZXN5bmMgKm1vZF9mcmVlc3luYywKIAlzdHJ1Y3QgY29yZV9mcmVlc3luYyAq
Y29yZV9mcmVlc3luYyA9IE5VTEw7CiAJdW5zaWduZWQgbG9uZyBsb25nIG5vbWluYWxfZmllbGRf
cmF0ZV9pbl91aHogPSAwOwogCXVuc2lnbmVkIGludCByZWZyZXNoX3JhbmdlID0gMDsKLQl1bnNp
Z25lZCBpbnQgbWluX3JlZnJlc2hfaW5fdWh6ID0gMDsKLQl1bnNpZ25lZCBpbnQgbWF4X3JlZnJl
c2hfaW5fdWh6ID0gMDsKKwl1bnNpZ25lZCBsb25nIGxvbmcgbWluX3JlZnJlc2hfaW5fdWh6ID0g
MDsKKwl1bnNpZ25lZCBsb25nIGxvbmcgbWF4X3JlZnJlc2hfaW5fdWh6ID0gMDsKIAogCWlmICht
b2RfZnJlZXN5bmMgPT0gTlVMTCkKIAkJcmV0dXJuOwpAQCAtOTEzLDcgKzkxOSw3IEBAIHZvaWQg
bW9kX2ZyZWVzeW5jX2J1aWxkX3Zycl9wYXJhbXMoc3RydWN0IG1vZF9mcmVlc3luYyAqbW9kX2Zy
ZWVzeW5jLAogCQltaW5fcmVmcmVzaF9pbl91aHogPSBub21pbmFsX2ZpZWxkX3JhdGVfaW5fdWh6
OwogCiAJaWYgKCF2cnJfc2V0dGluZ3NfcmVxdWlyZV91cGRhdGUoY29yZV9mcmVlc3luYywKLQkJ
CWluX2NvbmZpZywgbWluX3JlZnJlc2hfaW5fdWh6LCBtYXhfcmVmcmVzaF9pbl91aHosCisJCQlp
bl9jb25maWcsICh1bnNpZ25lZCBpbnQpbWluX3JlZnJlc2hfaW5fdWh6LCAodW5zaWduZWQgaW50
KW1heF9yZWZyZXNoX2luX3VoeiwKIAkJCWluX291dF92cnIpKQogCQlyZXR1cm47CiAKQEAgLTky
OSwxNSArOTM1LDE1IEBAIHZvaWQgbW9kX2ZyZWVzeW5jX2J1aWxkX3Zycl9wYXJhbXMoc3RydWN0
IG1vZF9mcmVlc3luYyAqbW9kX2ZyZWVzeW5jLAogCQlyZXR1cm47CiAKIAl9IGVsc2UgewotCQlp
bl9vdXRfdnJyLT5taW5fcmVmcmVzaF9pbl91aHogPSBtaW5fcmVmcmVzaF9pbl91aHo7CisJCWlu
X291dF92cnItPm1pbl9yZWZyZXNoX2luX3VoeiA9ICh1bnNpZ25lZCBpbnQpbWluX3JlZnJlc2hf
aW5fdWh6OwogCQlpbl9vdXRfdnJyLT5tYXhfZHVyYXRpb25faW5fdXMgPQogCQkJCWNhbGNfZHVy
YXRpb25faW5fdXNfZnJvbV9yZWZyZXNoX2luX3VoeigKLQkJCQkJCW1pbl9yZWZyZXNoX2luX3Vo
eik7CisJCQkJCQkodW5zaWduZWQgaW50KW1pbl9yZWZyZXNoX2luX3Voeik7CiAKLQkJaW5fb3V0
X3Zyci0+bWF4X3JlZnJlc2hfaW5fdWh6ID0gbWF4X3JlZnJlc2hfaW5fdWh6OworCQlpbl9vdXRf
dnJyLT5tYXhfcmVmcmVzaF9pbl91aHogPSAodW5zaWduZWQgaW50KW1heF9yZWZyZXNoX2luX3Vo
ejsKIAkJaW5fb3V0X3Zyci0+bWluX2R1cmF0aW9uX2luX3VzID0KIAkJCQljYWxjX2R1cmF0aW9u
X2luX3VzX2Zyb21fcmVmcmVzaF9pbl91aHooCi0JCQkJCQltYXhfcmVmcmVzaF9pbl91aHopOwor
CQkJCQkJKHVuc2lnbmVkIGludCltYXhfcmVmcmVzaF9pbl91aHopOwogCiAJCXJlZnJlc2hfcmFu
Z2UgPSBpbl9vdXRfdnJyLT5tYXhfcmVmcmVzaF9pbl91aHogLQogCQkJCWluX291dF92cnItPm1p
bl9yZWZyZXNoX2luX3VoejsKQEAgLTk0OCwxNyArOTU0LDE4IEBAIHZvaWQgbW9kX2ZyZWVzeW5j
X2J1aWxkX3Zycl9wYXJhbXMoc3RydWN0IG1vZF9mcmVlc3luYyAqbW9kX2ZyZWVzeW5jLAogCWlu
X291dF92cnItPmZpeGVkLnJhbXBpbmdfYWN0aXZlID0gaW5fY29uZmlnLT5yYW1waW5nOwogCiAJ
aW5fb3V0X3Zyci0+YnRyLmJ0cl9lbmFibGVkID0gaW5fY29uZmlnLT5idHI7CisKIAlpZiAoaW5f
b3V0X3Zyci0+bWF4X3JlZnJlc2hfaW5fdWh6IDwKIAkJCTIgKiBpbl9vdXRfdnJyLT5taW5fcmVm
cmVzaF9pbl91aHopCiAJCWluX291dF92cnItPmJ0ci5idHJfZW5hYmxlZCA9IGZhbHNlOworCiAJ
aW5fb3V0X3Zyci0+YnRyLmJ0cl9hY3RpdmUgPSBmYWxzZTsKIAlpbl9vdXRfdnJyLT5idHIuaW5z
ZXJ0ZWRfZHVyYXRpb25faW5fdXMgPSAwOwogCWluX291dF92cnItPmJ0ci5mcmFtZXNfdG9faW5z
ZXJ0ID0gMDsKIAlpbl9vdXRfdnJyLT5idHIuZnJhbWVfY291bnRlciA9IDA7CiAJaW5fb3V0X3Zy
ci0+YnRyLm1pZF9wb2ludF9pbl91cyA9Ci0JCQlpbl9vdXRfdnJyLT5taW5fZHVyYXRpb25faW5f
dXMgKwotCQkJCShpbl9vdXRfdnJyLT5tYXhfZHVyYXRpb25faW5fdXMgLQotCQkJCWluX291dF92
cnItPm1pbl9kdXJhdGlvbl9pbl91cykgLyAyOworCQkJCShpbl9vdXRfdnJyLT5taW5fZHVyYXRp
b25faW5fdXMgKworCQkJCSBpbl9vdXRfdnJyLT5tYXhfZHVyYXRpb25faW5fdXMpIC8gMjsKIAog
CWlmIChpbl9vdXRfdnJyLT5zdGF0ZSA9PSBWUlJfU1RBVEVfVU5TVVBQT1JURUQpIHsKIAkJaW5f
b3V0X3Zyci0+YWRqdXN0LnZfdG90YWxfbWluID0gc3RyZWFtLT50aW1pbmcudl90b3RhbDsKLS0g
CjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
