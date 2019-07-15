Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B2469DC8
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F0089CAD;
	Mon, 15 Jul 2019 21:21:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730086.outbound.protection.outlook.com [40.107.73.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 293D689C88
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sim0OIi3E72LPMqkX0g4JgNysaoWg+VkPaQPs2Nm4mgs8Jkki+crOZgCwmBaSfStGodSDtafbOJYiEmCDrsIN2V8+C0fAAzMjxNpEs0SezcyeLDpNY7c7WUq9PwqQ2K8B3jZx0xhQy6RafVjgYRYAdBAXo6fwV+r3M/QHtQAvV6JP9qg63y8qEhL+iswB881McH/5hHm9hbBIGU5BSOtPhYzb73VykYEf+8HBB2kipCi1lqI1FisNjaAuQwW4smBI7wtfRLLhCeka9pHy9+j5oX8YDh1LcgT9C3RLzT6uuqg0p//9V8vtd9734jzu8VJB/6V5/vtyn8ZPLL/IF0HfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hn1vqVYHvTEgmd8w6xmsz75bDI99+O3N9inNGuLRfCo=;
 b=AYL8bxO9hccKkvggZhrpMuntkYmmbGR+kE4+oxqkCZpYX1Nfvj0d9ojNPPhDoDK6BVNxXnFdnQeO+Ku6vHnoOkDl4cu81bsqG0doyoRxkWfM8B/UlOeEhJYzJA9tdBjfM1ae4+PjsTiTGAwMZfU1UM1Xi1t3U5475TO8DE088I56y+NowOsJU8RSNcqOihWSDT5SO58I9yS9IocScmGHHgG/moGVT+x3CHNGNVxZjbTDPKlChr9g8VrxBguHZj7Wwc6RYaABTMu15QULn5E1Tt2URKRLX18840gmjLJVKWAe/lUjgwnCB154BgowVZqfchMjLrorGx4K+krN0wvNlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM5PR12CA0004.namprd12.prod.outlook.com (2603:10b6:4:1::14) by
 DM5PR12MB1929.namprd12.prod.outlook.com (2603:10b6:3:106::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Mon, 15 Jul 2019 21:21:44 +0000
Received: from CO1NAM03FT028.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by DM5PR12CA0004.outlook.office365.com
 (2603:10b6:4:1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.10 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:44 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT028.mail.protection.outlook.com (10.152.80.189) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:44 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:28 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 49/87] drm/amd/display: Use helper for determining HDMI signal
Date: Mon, 15 Jul 2019 17:20:11 -0400
Message-ID: <20190715212049.4584-50-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(376002)(346002)(2980300002)(428003)(189003)(199004)(336012)(305945005)(2870700001)(446003)(6666004)(356004)(6916009)(2906002)(186003)(4744005)(4326008)(14444005)(36756003)(26005)(53936002)(68736007)(48376002)(47776003)(5660300002)(2876002)(49486002)(486006)(1076003)(76176011)(478600001)(81166006)(81156014)(8936002)(50466002)(86362001)(51416003)(2351001)(426003)(11346002)(70206006)(54906003)(70586007)(476003)(50226002)(2616005)(126002)(316002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1929; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80ee2285-b7ae-4d51-f80a-08d7096a7000
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1929; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1929:
X-Microsoft-Antispam-PRVS: <DM5PR12MB19295F9929DA06C3C66F608882CF0@DM5PR12MB1929.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:252;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: DA6H09S5H6bIQf7gL2CtQphDnA6CfBSOxKCCyTe0KhDlqLEgxauZVzKsyN2x57TlNrqhh2S7kyHuHuCTRL15ZB4fYYE0vOFKcdW9Sy76jkNOH9P6+LkP2mqxCn3A6hVeDhSoDsgCZmO7R2DHNllPpEiSrmOSYC0bWcuu7pU9AiA/FI5q98R7JyPgHIIOzb3ZLSjTG7MdILe4iJTtFYFlHONdSdQNHW8IiXwOFYmql7vs462dSFqIQejJKLzdhxsF2sXmpu5L+tBXG3v5H0dk34vY6Mlv4VCGGkTcgknnIfHLJnGWSBeT5hT73TongjLRHUs90ldwknOSDyXO45WelOGbTtMJBbwgTkDiVnQYrbw/6aGxrM69eO0QA8IhHYgmvay5v03J2AglKpVBLpZeP3a0fvYBIISM9kvsrbYAoYo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:44.4568 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80ee2285-b7ae-4d51-f80a-08d7096a7000
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1929
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hn1vqVYHvTEgmd8w6xmsz75bDI99+O3N9inNGuLRfCo=;
 b=B6ve8VwbcSgLkOXxsZE/OxfHY7wQfi2arWKMQFi918uOxwj57yfEhdfeNHt1QESF8CLzw8lhp8oQROR+pZVrCY9pPyHoFG72rGRp9VtZV3j4fKSQPJJ8h1PcdwILwkd4s5UekoOUE/PsFwzgCbtK47IMEGdQKCN5xaCy4CPeuUk=
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
Cc: Leo Li <sunpeng.li@amd.com>, Charlene Liu <Charlene.Liu@amd.com>,
 Eric Bernstein <eric.bernstein@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXJpYyBCZXJuc3RlaW4gPGVyaWMuYmVybnN0ZWluQGFtZC5jb20+CgpVc2UgaGVscGVy
IHRvIGRldGVybWluZSBpZiBIRE1JIHNpZ25hbCB3aGVuIHByb2Nlc3NpbmcgYXZtdXRlLgoKU2ln
bmVkLW9mZi1ieTogRXJpYyBCZXJuc3RlaW4gPGVyaWMuYmVybnN0ZWluQGFtZC5jb20+ClJldmll
d2VkLWJ5OiBDaGFybGVuZSBMaXUgPENoYXJsZW5lLkxpdUBhbWQuY29tPgpBY2tlZC1ieTogTGVv
IExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2NvcmUvZGNfbGluay5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2NvcmUvZGNfbGluay5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUv
ZGNfbGluay5jCmluZGV4IDg4MDNmNmNjNTQxNC4uMTk0ODNmYmYzMjFiIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jCkBAIC0yODU4LDcgKzI4NTgs
NyBAQCB2b2lkIGNvcmVfbGlua19zZXRfYXZtdXRlKHN0cnVjdCBwaXBlX2N0eCAqcGlwZV9jdHgs
IGJvb2wgZW5hYmxlKQogewogCXN0cnVjdCBkYyAgKmNvcmVfZGMgPSBwaXBlX2N0eC0+c3RyZWFt
LT5jdHgtPmRjOwogCi0JaWYgKHBpcGVfY3R4LT5zdHJlYW0tPnNpZ25hbCAhPSBTSUdOQUxfVFlQ
RV9IRE1JX1RZUEVfQSkKKwlpZiAoIWRjX2lzX2hkbWlfc2lnbmFsKHBpcGVfY3R4LT5zdHJlYW0t
PnNpZ25hbCkpCiAJCXJldHVybjsKIAogCWNvcmVfZGMtPmh3c3Muc2V0X2F2bXV0ZShwaXBlX2N0
eCwgZW5hYmxlKTsKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
