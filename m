Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DC3171D9
	for <lists+amd-gfx@lfdr.de>; Wed,  8 May 2019 08:43:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA05894C9;
	Wed,  8 May 2019 06:43:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam05on060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe50::60b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F044A894C9
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 May 2019 06:43:43 +0000 (UTC)
Received: from SN1PR12CA0075.namprd12.prod.outlook.com (52.132.192.46) by
 CY4PR12MB1143.namprd12.prod.outlook.com (10.168.164.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Wed, 8 May 2019 06:43:42 +0000
Received: from DM3NAM03FT004.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by SN1PR12CA0075.outlook.office365.com
 (2603:10b6:802:20::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.20 via Frontend
 Transport; Wed, 8 May 2019 06:43:42 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT004.mail.protection.outlook.com (10.152.82.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Wed, 8 May 2019 06:43:42 +0000
Received: from build-machine.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 8 May 2019
 01:43:41 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amd/powerpaly: force to update all clock tables on OD
 reset
Date: Wed, 8 May 2019 14:43:32 +0800
Message-ID: <20190508064333.16154-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(136003)(376002)(396003)(39860400002)(2980300002)(428003)(189003)(199004)(77096007)(15650500001)(478600001)(14444005)(72206003)(6666004)(356004)(36756003)(5660300002)(70586007)(7696005)(70206006)(86362001)(8676002)(336012)(126002)(426003)(2616005)(1076003)(476003)(44832011)(486006)(81166006)(51416003)(316002)(81156014)(8936002)(305945005)(53936002)(47776003)(186003)(2351001)(53416004)(68736007)(26005)(50226002)(2906002)(48376002)(2870700001)(6916009)(50466002)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1143; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8311001d-0a80-40d5-0fe3-08d6d38082c9
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:CY4PR12MB1143; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1143:
X-Microsoft-Antispam-PRVS: <CY4PR12MB11433FE1E636628A5B56ACDDE4320@CY4PR12MB1143.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 0031A0FFAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: dmcTAlVIRnhMlAuAPTKbv8IgYJjmtO/OCpDCsN52EOunKevPfyqwGL6rXsdNzVMMuekgLc5lNvMufbqPc/HY+6Ru4Y8LbVOdwnUNrH4SnrhQnhLfiw4JI4FR/nHXDkEp1aLbcr9VpcvXD1IUbxfq2NfqIczvZXPNCs/g43/tU7G63UIXL0NZBJzACw2wxHO+eqcJrrc4ZGRJwgVGNSgh9FY1VKOacYzgDUXxSHEK0/mcv61XqdHEXtop47hDz+tbbaSWLomo74sBm7zTtwc6QJ46z6w4aeVeVRJObD22e2mihdHVpR10byv/W/5nis8DbWs4m9RKc6eNf3tM1Lx4Qf2swrXrzHywV38/WPPUVyFi9rFwL7uXXUXo+V/tCnPoFGRjoB5Ar7DF9J4E2ZuBEElZPWHDz0PU8+wTFUsaybU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2019 06:43:42.1822 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8311001d-0a80-40d5-0fe3-08d6d38082c9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1143
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oLFCUVl6Zu0bZOALyh0xMkkq+5Kv2cyzygI2cUWt2mA=;
 b=djneC/KPh4zD/VB0mtDIHRtUERh0IYP1H/JMNTT+9Ur5b9hzdDZMVw8m19NPsnGHdR5d+pI63StRpxjbGglEUw2xQT8QlYLqkURal3KvqQn5ZzhMGj9yyuXvwoOWBDy8XKgWFek+IqY6m3JyyFs9KZXVSufOi7V5zpYasaAZx0M=
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
Cc: Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gT0QgcmVzZXQsIHRoZSBjbG9jayB0YWJsZXMgaW4gU01VIG5lZWQgdG8gYmUgcmVzZXQgdG8g
ZGVmYXVsdC4KCkNoYW5nZS1JZDogSWJlZmM2NjM2YTQzNjQwNDgzOWQ5ZGI2ZmI1MmU3MzhmMTAy
YzQxM2YKU2lnbmVkLW9mZi1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMTBfaHdtZ3IuYyB8IDQgKysr
KwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9od21nci5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX2h3bWdyLmMKaW5kZXggMzQ2Y2Y2MWQ1NWY2
Li5iMjk4YWJhMTIwNmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2h3bWdyL3ZlZ2ExMF9od21nci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2h3bWdyL3ZlZ2ExMF9od21nci5jCkBAIC01MTc2LDYgKzUxNzYsMTAgQEAgc3RhdGljIGludCB2
ZWdhMTBfb2RuX2VkaXRfZHBtX3RhYmxlKHN0cnVjdCBwcF9od21nciAqaHdtZ3IsCiAJCW1lbWNw
eSgmKGRhdGEtPmRwbV90YWJsZSksICYoZGF0YS0+Z29sZGVuX2RwbV90YWJsZSksIHNpemVvZihz
dHJ1Y3QgdmVnYTEwX2RwbV90YWJsZSkpOwogCQl2ZWdhMTBfb2RuX2luaXRpYWxfZGVmYXVsdF9z
ZXR0aW5nKGh3bWdyKTsKIAkJdmVnYTEwX29kbl91cGRhdGVfcG93ZXJfc3RhdGUoaHdtZ3IpOwor
CQkvKiBmb3JjZSB0byB1cGRhdGUgYWxsIGNsb2NrIHRhYmxlcyAqLworCQlkYXRhLT5uZWVkX3Vw
ZGF0ZV9kcG1fdGFibGUgPSBEUE1UQUJMRV9VUERBVEVfU0NMSyB8CisJCQkJCSAgICAgIERQTVRB
QkxFX1VQREFURV9NQ0xLIHwKKwkJCQkJICAgICAgRFBNVEFCTEVfVVBEQVRFX1NPQ0NMSzsKIAkJ
cmV0dXJuIDA7CiAJfSBlbHNlIGlmIChQUF9PRF9DT01NSVRfRFBNX1RBQkxFID09IHR5cGUpIHsK
IAkJdmVnYTEwX2NoZWNrX2RwbV90YWJsZV91cGRhdGVkKGh3bWdyKTsKLS0gCjIuMjEuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
