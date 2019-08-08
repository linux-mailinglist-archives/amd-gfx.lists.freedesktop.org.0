Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12199859C3
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Aug 2019 07:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A95896E439;
	Thu,  8 Aug 2019 05:27:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680061.outbound.protection.outlook.com [40.107.68.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A42E6E439
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Aug 2019 05:27:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H2MeZRiHvileFZihNeNiMC8W/Zdmqm9i3GXF/ujmL6TnLd35iGkh7nW4oR6p036wCCy5v0DeZ8zfaYGo7hKOe+lFlsKbgTPqlcNGkSVEc6+lSazsJ5zj0IIy7UVtAoAk3vGPnigBny7mZGb/TJiDKlTgtCeoH33/1iXt/aombcBTUqwEegLFP5v1X6xAg/VrkCL+c4InZthePHQiD5ev6rJyVAsB8F+7H8FmpUYLRPfK6zTfZuB58wOo9WqwS/l+KFj5ybVUFOnfqsQiIrmYma6cvxqZeufbht+0mlfDYwW9uuhUGB8WL/4uGzaaryGcYrXNFdmntp2K3kXN86DBeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TdptaKhqw5qyQfPdpOqLMlbpendpqaReJTJmso03BrA=;
 b=VYvO8A9TttHHr6aCRSp9db+cem4lZqgBSV5Wuvb0uDQAsz5PfxbDG8q0HOwPogRgPRyPnNdaWEZLiLfp5EwkGzKbnPY62HRmBr5GgfJEaifGmHpEkjIEL0/9DoJLkTIrwPavhbaXL8+NvVOVPiKXmislOSeEa/w5ADd/CGROQ7O+SJgGzc3Gln9VudTCzSKJFa03QWhlAToaeXDKFgf2c49WYfujD8sZFJjqaCeb0lNvQYI0Rmv4FRgvJpBj4/nuEEGnlhrsSbO7pvRGzxR9CsuBebILk0msUu1D9p8qOqV8o9BvoF4mH9p5SdeSnB11j1jdF9rN2NlT/TngBJmMVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM3PR12CA0127.namprd12.prod.outlook.com (2603:10b6:0:51::23) by
 CY4PR12MB1271.namprd12.prod.outlook.com (2603:10b6:903:3d::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.20; Thu, 8 Aug 2019 05:27:40 +0000
Received: from BY2NAM03FT030.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::202) by DM3PR12CA0127.outlook.office365.com
 (2603:10b6:0:51::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.15 via Frontend
 Transport; Thu, 8 Aug 2019 05:27:40 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT030.mail.protection.outlook.com (10.152.84.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Thu, 8 Aug 2019 05:27:39 +0000
Received: from rico-code.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 8 Aug 2019
 00:27:38 -0500
From: Tianci Yin <tianci.yin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amd/powerplay: update smu11_driver_if_navi10.h
Date: Thu, 8 Aug 2019 13:25:47 +0800
Message-ID: <1565241947-31011-2-git-send-email-tianci.yin@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565241947-31011-1-git-send-email-tianci.yin@amd.com>
References: <1565241947-31011-1-git-send-email-tianci.yin@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(346002)(39860400002)(2980300002)(428003)(199004)(189003)(2351001)(26005)(70586007)(70206006)(4326008)(50466002)(86362001)(53936002)(48376002)(2906002)(36756003)(54906003)(16586007)(44832011)(2616005)(8936002)(478600001)(336012)(76176011)(53416004)(15650500001)(14444005)(81166006)(486006)(186003)(5660300002)(47776003)(51416003)(11346002)(476003)(81156014)(7696005)(356004)(126002)(305945005)(446003)(50226002)(8676002)(6916009)(6666004)(316002)(426003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1271; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad06d86a-a13a-4dc2-c15d-08d71bc12185
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1271; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1271:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1271AFCE9D9003BE05F51B5195D70@CY4PR12MB1271.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 012349AD1C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: F1xN9cwrRsAu9vVaVKvccFoejZ/GEBcD37hE5dfFMmKQ7B9FXx3MJMnCWSKPQ31BYImvzimxQ93Kd5Jo+RaHiqbRt+Ip1dcKWMmR/t8xmVTNDq4uUpm3se+ML7pgsdvq1Zxy29eTWFtkAsQaAi6hGscKtKTFcVI7vx1hl0eOLwCaj+/+igPJB7PIf8UwOH6eoUcnRpefjsroS7v6cQr217NnEl3C+Pr6uBtrF05sOCKe7XkO+riiFSnRnTKbPFyAMCIJ241qXPNyl1SoSRsMrCv3oExb/1GP8iukx2cQ71vMmt94ytVLE7BGZ8b0/jHqTFbbfsls9sFeJx/ozNCNs1lq533yanejO9atnf6bDionX//PzhCs7qgSaBYPd5G+wPsgNeD3Zj8N4MIBdiuq9wj6deCOWlzIJVz9w16vhEw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2019 05:27:39.9039 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad06d86a-a13a-4dc2-c15d-08d71bc12185
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1271
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TdptaKhqw5qyQfPdpOqLMlbpendpqaReJTJmso03BrA=;
 b=fNZ9S1vw0qXwqed4RjjeJk5FLYXBHkIiDjXpgVwAuciVL+sbnCyea3nzKft+Q+X2585XeDyPlikxwI0bmws+br1rFmY9AcZ3EC3hGwBSWLiPImlpGzp+8lUz/utNNd8Df0SGwa8srO9UaZT8Zwi90F1eQx+7qiHXLlykN3dyAbg=
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
MTFfZHJpdmVyX2lmX25hdmkxMC5oIHwgMjYgKysrKysrKysrKysrKysrKystLS0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdV92MTFfMC5oICAgICAgfCAgMiArLQogMiBm
aWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9zbXUxMV9kcml2ZXJfaWZfbmF2
aTEwLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211MTFfZHJpdmVyX2lm
X25hdmkxMC5oCmluZGV4IDZkOWU3OWUuLjRiN2M1YzIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L2luYy9zbXUxMV9kcml2ZXJfaWZfbmF2aTEwLmgKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdTExX2RyaXZlcl9pZl9uYXZpMTAuaApA
QCAtNTA2LDEwICs1MDYsMTEgQEAgdHlwZWRlZiBzdHJ1Y3QgewogICB1aW50MzJfdCBTdGF0dXM7
CiAKICAgdWludDE2X3QgRGllVGVtcGVyYXR1cmU7Ci0gIHVpbnQxNl90IE1lbW9yeVRlbXBlcmF0
dXJlOworICB1aW50MTZfdCBDdXJyZW50TWVtb3J5VGVtcGVyYXR1cmU7CiAKLSAgdWludDE2X3Qg
U2VsZWN0ZWRDYXJkUG93ZXI7Ci0gIHVpbnQxNl90IFJlc2VydmVkNDsgCisgIHVpbnQxNl90IE1l
bW9yeVRlbXBlcmF0dXJlOworICB1aW50OF90IE1lbW9yeUhvdHNwb3RQb3NpdGlvbjsKKyAgdWlu
dDhfdCBSZXNlcnZlZDQ7CiAKICAgdWludDMyX3QgQm9hcmRMZXZlbEVuZXJneUFjY3VtdWxhdG9y
OyAgCiB9IE91dE9mQmFuZE1vbml0b3JfdDsKQEAgLTgwMSw3ICs4MDIsMTMgQEAgdHlwZWRlZiBz
dHJ1Y3QgewogICAvLyBNdmRkIFN2aTIgRGl2IFJhdGlvIFNldHRpbmcKICAgdWludDMyX3QgICAg
IE12ZGRSYXRpbzsgLy8gVGhpcyBpcyB1c2VkIGZvciBNVkREIFZpZCB3b3JrYXJvdW5kLiBJdCBo
YXMgMTYgZnJhY3Rpb25hbCBiaXRzIChRMTYuMTYpCiAKLSAgdWludDMyX3QgICAgIEJvYXJkUmVz
ZXJ2ZWRbOV07CisgIC8vRklYTUU6IFJlbmVzZXMgVlIgd29ya2Fyb3VuZAorICB1aW50OF90ICAg
ICAgUmVuZXNlc0xvYWRMaW5lRW5hYmxlZDsKKyAgdWludDhfdCAgICAgIEdmeExvYWRsaW5lUmVz
aXN0YW5jZTsKKyAgdWludDhfdCAgICAgIFNvY0xvYWRsaW5lUmVzaXN0YW5jZTsKKyAgdWludDhf
dCAgICAgIFBhZGRpbmc4X0xvYWRsaW5lOworCisgIHVpbnQzMl90ICAgICBCb2FyZFJlc2VydmVk
WzhdOwogCiAgIC8vIFBhZGRpbmcgZm9yIE1NSFVCIC0gZG8gbm90IG1vZGlmeSB0aGlzCiAgIHVp
bnQzMl90ICAgICBNbUh1YlBhZGRpbmdbOF07IC8vIFNNVSBpbnRlcm5hbCB1c2UKQEAgLTkwNSwx
MyArOTEyLDIyIEBAIHR5cGVkZWYgc3RydWN0IHsKIH0gV2F0ZXJtYXJrc190OwogCiB0eXBlZGVm
IHN0cnVjdCB7CisgIHVpbnQxNl90IGF2Z1BzbUNvdW50WzI4XTsKKyAgdWludDE2X3QgbWluUHNt
Q291bnRbMjhdOworICBmbG9hdCAgICBhdmdQc21Wb2x0YWdlWzI4XTsKKyAgZmxvYXQgICAgbWlu
UHNtVm9sdGFnZVsyOF07CisKKyAgdWludDMyX3QgICAgIE1tSHViUGFkZGluZ1szMl07IC8vIFNN
VSBpbnRlcm5hbCB1c2UKK30gQXZmc0RlYnVnVGFibGVfdF9OVjE0OworCit0eXBlZGVmIHN0cnVj
dCB7CiAgIHVpbnQxNl90IGF2Z1BzbUNvdW50WzM2XTsKICAgdWludDE2X3QgbWluUHNtQ291bnRb
MzZdOwogICBmbG9hdCAgICBhdmdQc21Wb2x0YWdlWzM2XTsgCiAgIGZsb2F0ICAgIG1pblBzbVZv
bHRhZ2VbMzZdOwogCiAgIHVpbnQzMl90ICAgICBNbUh1YlBhZGRpbmdbOF07IC8vIFNNVSBpbnRl
cm5hbCB1c2UKLX0gQXZmc0RlYnVnVGFibGVfdDsKK30gQXZmc0RlYnVnVGFibGVfdF9OVjEwOwog
CiB0eXBlZGVmIHN0cnVjdCB7CiAgIHVpbnQ4X3QgIEF2ZnNWZXJzaW9uOwpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdV92MTFfMC5oIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdV92MTFfMC5oCmluZGV4IDk3NjA1ZTkuLmVlODU0
MmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9zbXVfdjEx
XzAuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211X3YxMV8wLmgK
QEAgLTI4LDcgKzI4LDcgQEAKICNkZWZpbmUgU01VMTFfRFJJVkVSX0lGX1ZFUlNJT05fSU5WIDB4
RkZGRkZGRkYKICNkZWZpbmUgU01VMTFfRFJJVkVSX0lGX1ZFUlNJT05fVkcyMCAweDEzCiAjZGVm
aW5lIFNNVTExX0RSSVZFUl9JRl9WRVJTSU9OX05WMTAgMHgzMwotI2RlZmluZSBTTVUxMV9EUklW
RVJfSUZfVkVSU0lPTl9OVjE0IDB4MzMKKyNkZWZpbmUgU01VMTFfRFJJVkVSX0lGX1ZFUlNJT05f
TlYxNCAweDM0CiAKIC8qIE1QIEFwZXJ0dXJlcyAqLwogI2RlZmluZSBNUDBfUHVibGljCQkJMHgw
MzgwMDAwMAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
