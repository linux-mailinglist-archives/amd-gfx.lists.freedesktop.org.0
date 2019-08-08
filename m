Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA15859FF
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Aug 2019 07:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65DA6E780;
	Thu,  8 Aug 2019 05:49:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680042.outbound.protection.outlook.com [40.107.68.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D47216E780
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Aug 2019 05:49:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fq/2RrS4WrE+mBqmp+bhfh1Vad4xojgX/bpRie+wT47sgEHJJlh2VE6s82IMuSpeGvpGzWzaxjqowPiKrKaSWJuWMH62DNEhvQWK/KKYhXVLsSus1Ps99sLF1qxUhFhQfOHMYfhMW0yA6SU3dX+5TIP2/K5l99NoVZFvEqD2C+aD4MCdLdBxaqcp58SVeh17Z7W2jEpnbV/ZE8sWDgJSzuw4gcUnE9KnR+1dFumdPBFTlomSJADDLQuZiUwDL9PSBe6ob6diZxdj8afHG7BVQEENm+JjvTwmeu06TMU5I3/hSc4VfkkYkqmbVmvjHynxE4vDLHeJp4Zo4h7Am1k07Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pje+3fo1yi9K9BD86Fym/4K2pFfm85n+kNfCt2/DXnU=;
 b=XXO/1pMcjDC2ezjp8c993ZGgTTuRY11pl/AQCjhyUxfLrt7fHqibLRgFLGecD4k0iO5LmtvfbtXRk9u6zn05D8NrV8vDUAiBVXV3fxiWPaP5q8Li9OmcItIKlFWylXlpengY+4zTvbFpZwKtK8U3cmdOBmuMomhxa1CYVBKKzC3F2vDbwUS1NGUAsa3pkOd+Xj7uEnLuJanKQ7wuh+2s21EQWBnOxhUMzJ6Fo0s/0ZgoXDNzzNGbLhyWtXMzThlgzTjaSysHMH3RQeFKL4P/7dWAUgbS7S0A1WacZ/pKrsIJcus6nkgYLpJe93VomQAjTafmHwPgjQueFB2oPruRrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0101.namprd12.prod.outlook.com (2603:10b6:0:55::21) by
 SN6PR12MB2719.namprd12.prod.outlook.com (2603:10b6:805:70::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Thu, 8 Aug 2019 05:49:17 +0000
Received: from BY2NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::203) by DM3PR12CA0101.outlook.office365.com
 (2603:10b6:0:55::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.17 via Frontend
 Transport; Thu, 8 Aug 2019 05:49:17 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT009.mail.protection.outlook.com (10.152.84.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Thu, 8 Aug 2019 05:49:16 +0000
Received: from rico-code.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 8 Aug 2019
 00:49:15 -0500
From: Tianci Yin <tianci.yin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amd/powerplay: update smu11_driver_if_navi10.h
Date: Thu, 8 Aug 2019 13:49:03 +0800
Message-ID: <1565243343-7561-2-git-send-email-tianci.yin@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565243343-7561-1-git-send-email-tianci.yin@amd.com>
References: <1565243343-7561-1-git-send-email-tianci.yin@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(396003)(136003)(346002)(2980300002)(428003)(199004)(189003)(86362001)(76176011)(7696005)(336012)(316002)(186003)(51416003)(16586007)(446003)(50226002)(81166006)(44832011)(8936002)(54906003)(11346002)(81156014)(426003)(486006)(70206006)(70586007)(14444005)(2906002)(26005)(6916009)(15650500001)(50466002)(48376002)(478600001)(53416004)(5660300002)(2351001)(305945005)(126002)(4326008)(2616005)(6666004)(356004)(476003)(53936002)(36756003)(47776003)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2719; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0311e88-9058-46ed-253d-08d71bc4267c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:SN6PR12MB2719; 
X-MS-TrafficTypeDiagnostic: SN6PR12MB2719:
X-Microsoft-Antispam-PRVS: <SN6PR12MB271955D496FC906FD504EE9995D70@SN6PR12MB2719.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 012349AD1C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 1mcbucdwxOg3krvMBFUBV8JpjcXIZl4gOpbWe1nHPhwDSKzhg1VERmeSutnYDxMMSxkGuMYMO+Ev2SyywuBTBIvH8TUbkSleiBlxnFUhZVjVsVRmwzigkjHKde6SbcDYIhyy/vdMe4tMBgTyE8ROvrEeCOHi+ZFZB72pI7ghh1eyeaQId5ksyQHLhIzA6K7W8vs03lpf1RSNrUWgvKdMqWTttGiNARKW6NCmQuVMLEdGTEL6LS624RgRh9z99do0qy1RxiHlFIz1trrhiWp4R6bcFjW2H8kZA6y9k1g3M8xlzNEFeAB7lA56a7QQ+PTbkFP6Bt54NR/oJjfwwVaMDb3fDVKcmGCcArLq6CDrbmU7d/U5sRMZBF0F9dg8YlWmyk9eibSL1nGPcOKyxJPmv5l7u4dRb5ejmUtWbAuXwXE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2019 05:49:16.7282 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0311e88-9058-46ed-253d-08d71bc4267c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2719
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pje+3fo1yi9K9BD86Fym/4K2pFfm85n+kNfCt2/DXnU=;
 b=A8OnSVORjeUQyaa1mXVHFiCSsuhQPV/9fAVOp3utZ/LG7mUmYAsFpDXU1KfB38BRfUFhsZWqGDPz1IP7sZGL9XoAuahlIRbutUSVFuKAxx3WG5/E20gKIOoLHGq6BAdzQiPwhDrYK53K6xk0CC2len2+nT0WIdoNi75iwJxgoto=
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
Cc: Jack Xiao <Jack.Xiao@amd.com>, Kevin Wang <Kevin1.Wang@amd.com>,
 Tianci Yin <tianci.yin@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Evan Quan <evan.quan@amd.com>, Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogdGlhbmN5aW4gPHRpYW5jaS55aW5AYW1kLmNvbT4KCnVwZGF0ZSB0aGUgc211MTFfZHJp
dmVyX2lmX25hdmkxMC5oIHNpbmNlIG5hdmkxNCBzbXUgZncKdXBkYXRlIHRvIDUzLjEyCgpDaGFu
Z2UtSWQ6IElmMGY3MjllYzg3Yzk4ZjI0ZTE3OTRmMDg0N2VhYzViYTIzNjcxZTM0ClJldmlld2Vk
LWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiB0aWFuY3lp
biA8dGlhbmNpLnlpbkBhbWQuY29tPgotLS0KIC4uLi9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211
MTFfZHJpdmVyX2lmX25hdmkxMC5oIHwgMjUgKysrKysrKysrKysrKysrKystLS0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdV92MTFfMC5oICAgICAgfCAgMiArLQogMiBm
aWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9zbXUxMV9kcml2ZXJfaWZfbmF2
aTEwLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211MTFfZHJpdmVyX2lm
X25hdmkxMC5oCmluZGV4IDZkOWU3OWUuLmFjMDEyMGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L2luYy9zbXUxMV9kcml2ZXJfaWZfbmF2aTEwLmgKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdTExX2RyaXZlcl9pZl9uYXZpMTAuaApA
QCAtNTA2LDEwICs1MDYsMTEgQEAgdHlwZWRlZiBzdHJ1Y3QgewogICB1aW50MzJfdCBTdGF0dXM7
CiAKICAgdWludDE2X3QgRGllVGVtcGVyYXR1cmU7Ci0gIHVpbnQxNl90IE1lbW9yeVRlbXBlcmF0
dXJlOworICB1aW50MTZfdCBDdXJyZW50TWVtb3J5VGVtcGVyYXR1cmU7CiAKLSAgdWludDE2X3Qg
U2VsZWN0ZWRDYXJkUG93ZXI7Ci0gIHVpbnQxNl90IFJlc2VydmVkNDsgCisgIHVpbnQxNl90IE1l
bW9yeVRlbXBlcmF0dXJlOworICB1aW50OF90IE1lbW9yeUhvdHNwb3RQb3NpdGlvbjsKKyAgdWlu
dDhfdCBSZXNlcnZlZDQ7CiAKICAgdWludDMyX3QgQm9hcmRMZXZlbEVuZXJneUFjY3VtdWxhdG9y
OyAgCiB9IE91dE9mQmFuZE1vbml0b3JfdDsKQEAgLTgwMSw3ICs4MDIsMTIgQEAgdHlwZWRlZiBz
dHJ1Y3QgewogICAvLyBNdmRkIFN2aTIgRGl2IFJhdGlvIFNldHRpbmcKICAgdWludDMyX3QgICAg
IE12ZGRSYXRpbzsgLy8gVGhpcyBpcyB1c2VkIGZvciBNVkREIFZpZCB3b3JrYXJvdW5kLiBJdCBo
YXMgMTYgZnJhY3Rpb25hbCBiaXRzIChRMTYuMTYpCiAKLSAgdWludDMyX3QgICAgIEJvYXJkUmVz
ZXJ2ZWRbOV07CisgIHVpbnQ4X3QgICAgICBSZW5lc2VzTG9hZExpbmVFbmFibGVkOworICB1aW50
OF90ICAgICAgR2Z4TG9hZGxpbmVSZXNpc3RhbmNlOworICB1aW50OF90ICAgICAgU29jTG9hZGxp
bmVSZXNpc3RhbmNlOworICB1aW50OF90ICAgICAgUGFkZGluZzhfTG9hZGxpbmU7CisKKyAgdWlu
dDMyX3QgICAgIEJvYXJkUmVzZXJ2ZWRbOF07CiAKICAgLy8gUGFkZGluZyBmb3IgTU1IVUIgLSBk
byBub3QgbW9kaWZ5IHRoaXMKICAgdWludDMyX3QgICAgIE1tSHViUGFkZGluZ1s4XTsgLy8gU01V
IGludGVybmFsIHVzZQpAQCAtOTA1LDEzICs5MTEsMjIgQEAgdHlwZWRlZiBzdHJ1Y3QgewogfSBX
YXRlcm1hcmtzX3Q7CiAKIHR5cGVkZWYgc3RydWN0IHsKKyAgdWludDE2X3QgYXZnUHNtQ291bnRb
MjhdOworICB1aW50MTZfdCBtaW5Qc21Db3VudFsyOF07CisgIGZsb2F0ICAgIGF2Z1BzbVZvbHRh
Z2VbMjhdOworICBmbG9hdCAgICBtaW5Qc21Wb2x0YWdlWzI4XTsKKworICB1aW50MzJfdCAgICAg
TW1IdWJQYWRkaW5nWzMyXTsgLy8gU01VIGludGVybmFsIHVzZQorfSBBdmZzRGVidWdUYWJsZV90
X05WMTQ7CisKK3R5cGVkZWYgc3RydWN0IHsKICAgdWludDE2X3QgYXZnUHNtQ291bnRbMzZdOwog
ICB1aW50MTZfdCBtaW5Qc21Db3VudFszNl07CiAgIGZsb2F0ICAgIGF2Z1BzbVZvbHRhZ2VbMzZd
OyAKICAgZmxvYXQgICAgbWluUHNtVm9sdGFnZVszNl07CiAKICAgdWludDMyX3QgICAgIE1tSHVi
UGFkZGluZ1s4XTsgLy8gU01VIGludGVybmFsIHVzZQotfSBBdmZzRGVidWdUYWJsZV90OworfSBB
dmZzRGVidWdUYWJsZV90X05WMTA7CiAKIHR5cGVkZWYgc3RydWN0IHsKICAgdWludDhfdCAgQXZm
c1ZlcnNpb247CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMv
c211X3YxMV8wLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211X3YxMV8w
LmgKaW5kZXggOTc2MDVlOS4uZWU4NTQyZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvaW5jL3NtdV92MTFfMC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L2luYy9zbXVfdjExXzAuaApAQCAtMjgsNyArMjgsNyBAQAogI2RlZmluZSBTTVUxMV9E
UklWRVJfSUZfVkVSU0lPTl9JTlYgMHhGRkZGRkZGRgogI2RlZmluZSBTTVUxMV9EUklWRVJfSUZf
VkVSU0lPTl9WRzIwIDB4MTMKICNkZWZpbmUgU01VMTFfRFJJVkVSX0lGX1ZFUlNJT05fTlYxMCAw
eDMzCi0jZGVmaW5lIFNNVTExX0RSSVZFUl9JRl9WRVJTSU9OX05WMTQgMHgzMworI2RlZmluZSBT
TVUxMV9EUklWRVJfSUZfVkVSU0lPTl9OVjE0IDB4MzQKIAogLyogTVAgQXBlcnR1cmVzICovCiAj
ZGVmaW5lIE1QMF9QdWJsaWMJCQkweDAzODAwMDAwCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
