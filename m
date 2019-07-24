Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B54E73145
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 16:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D5916E5AB;
	Wed, 24 Jul 2019 14:11:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820079.outbound.protection.outlook.com [40.107.82.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC6D6E5AB
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 14:11:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RqHkroKm6Ab9G/3hWRdczlsdxa7s0Iu4XMy3uGjkDi0hKmJ//YN/pY32aMGpkZklaYGcxz5SYJhz81bfGTZSnbW3IoHvUdpkOvHAbSAI/YYQVfoJRF6BD2Iizax8LFXyELY6O1pllviA+4R+9aZxk2c54yyRiOrJ3132miWjGi4q4Nhz3lh3MGk70G40hawtoDPJnVoOGlURJ20EsgIVdMFXiRHu8IUxFzBMcBBsiwjar5NTMVfTATJx7UK63BnuOXHdxHT5ousX3rU0onVZ9o0ioYIlOq9nyeQIAVCyKAz1K1E5Y74W7tKK8fu2FSnO930hkBC1zMwsF4Zcm6BTMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWYif5vFlj4yZMVH6Geeypqjj4JZWoo2Qd2c63aUTfo=;
 b=YdC45WfJCkgOvHklaq+P9j1JsrtWZZfLcL4b8jm9eNBFPmpSYLZszXsgmfkoyBn3/9a3AOk6mEK8rh2MrM5zuxhUKqwqqN2TsSTiZby8+2Ew+BDNLZyt7OGfwfQgkjfrQtU/y9fnCgRRUv2UJz+jnEmq9D5gjAUGSaCg9hTY8THupm4LjFD9UpJ6DaEhDhgOMlPnO88A41WiJHXAeGPDdMGY5m9gBs0cnP9j3MZh5WIJO3HBFPhqO2hiT1536D/mAEObyTR/vzoaO1ty/AivGNMMKWpx3uhp5FzhNm0kuPb20dueO+5cmIt8uuI3crSb/ferNM5CXubxm3seq7WJIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from BN6PR12CA0048.namprd12.prod.outlook.com (2603:10b6:405:70::34)
 by MWHPR12MB1584.namprd12.prod.outlook.com (2603:10b6:301:a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16; Wed, 24 Jul
 2019 14:11:24 +0000
Received: from CO1NAM03FT041.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::205) by BN6PR12CA0048.outlook.office365.com
 (2603:10b6:405:70::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2094.14 via Frontend
 Transport; Wed, 24 Jul 2019 14:11:23 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT041.mail.protection.outlook.com (10.152.81.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Wed, 24 Jul 2019 14:11:23 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Wed, 24 Jul 2019 09:11:21 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 3/3] drm/amd: enable S/G for RAVEN chip
Date: Wed, 24 Jul 2019 10:10:42 -0400
Message-ID: <1563977442-4809-4-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563977442-4809-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1563977442-4809-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(136003)(376002)(2980300002)(428003)(199004)(189003)(305945005)(5660300002)(186003)(50226002)(70206006)(426003)(476003)(53936002)(26005)(81166006)(14444005)(48376002)(126002)(81156014)(6666004)(11346002)(50466002)(8936002)(356004)(446003)(36756003)(2616005)(70586007)(336012)(486006)(44832011)(2351001)(478600001)(6916009)(76176011)(7696005)(8676002)(51416003)(86362001)(47776003)(53416004)(54906003)(2906002)(4326008)(16586007)(316002)(68736007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1584; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e8d751e-bc6c-438f-556e-08d71040cf16
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1584; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1584:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1584E0994CA2F4D5E2EF050DEAC60@MWHPR12MB1584.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-Forefront-PRVS: 0108A997B2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: t/x4hGKypshzTBUl8xIsT05hMiyfYFfNgFJY6qSNEhTXEbUqxp8Ah8Zl29QnJ2gYQFAPzHfBvLGQyT9PSiE2TkFTZ9/U+A1q/W1ubufIsswvZrcIKOYhZVqANCDlBd79NFeNM+eAxVu1la1iAX1toFuh80ufLRt/jy7THRTfbC/hfr4PY6kOy7t0wqKU+ZYAY2XSrFo4NuZFmxTn+xqOgNlQMWif2m0gUmV20LeJ9xBy6RoaTJPU2oaoq6R1xHLqw7Jq/yM4prxBp5OxU2/ATp7O65ekKFg9ECLjx1IfFbJwZ9JuCZIvhC/hlfKy5q01N1Bo78mlg7g0Ioyy04OV87dzEql03+ixR5wbm8FK8Pmtd8LPohayhMnKnpdWG7jqm1B+4vYpN9gTPFELuzUAFGWFYw3FjRCt55NGSOeNcIA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2019 14:11:23.2621 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e8d751e-bc6c-438f-556e-08d71040cf16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1584
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWYif5vFlj4yZMVH6Geeypqjj4JZWoo2Qd2c63aUTfo=;
 b=yHCRd+/GJTbnmjv/pw/tEQVxAybkcrVcMJ/SSm7/1xiCV7yluQplBeyFodTLV2oIqUaWVOpRlUxnZtNsfxjCeKIqKaq/o/kFYDMggYILnMuykdQTVO7VDGdurs0NRfiSIqpV7yA9UlpzEnVhpwkppHp/UwjM+GUIgNvU3WW2qEc=
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
Cc: Alexander.Deucher@amd.com, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 hersenxs.wu@amd.com, Christian.Koenig@amd.com, shirish.s@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogU2hpcmlzaCBTIDxzaGlyaXNoLnNAYW1kLmNvbT4KCmVuYWJsZXMgZ3B1X3ZtX3N1cHBv
cnQgaW4gZG0gYW5kIGFkZHMKQU1ER1BVX0dFTV9ET01BSU5fR1RUIGFzIHN1cHBvcnRlZCBkb21h
aW4KCnYyOgpNb3ZlIEJPIHBsYWNlbWVudCBsb2dpYyBpbnRvIGFtZGdwdV9kaXNwbGF5X3N1cHBv
cnRlZF9kb21haW5zCgp2MzoKVXNlIGFtZGdwdV9ib192YWxpZGF0ZV91c3djIGluIGFtZGdwdV9k
aXNwbGF5X3N1cHBvcnRlZF9kb21haW5zLgoKQ2hhbmdlLUlkOiBJZjM0MzAwYmVhYTYwYmUyZDM2
MTcwYjdiNWIwOTZlYzY0NDUwMmIyMApTaWduZWQtb2ZmLWJ5OiBTaGlyaXNoIFMgPHNoaXJpc2gu
c0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6
b3Zza3lAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlz
cGxheS5jICAgICAgIHwgMTYgKysrKysrKysrKysrKystLQogZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8ICAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDE1
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kaXNwbGF5LmMKaW5kZXggNzY3ZWU2OTkuLjIzYjgwNDYgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNwbGF5LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc3BsYXkuYwpAQCAtMzcsNiArMzcsNyBAQAog
I2luY2x1ZGUgPGRybS9kcm1fZWRpZC5oPgogI2luY2x1ZGUgPGRybS9kcm1fZ2VtX2ZyYW1lYnVm
ZmVyX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9kcm1fZmJfaGVscGVyLmg+CisjaW5jbHVkZSA8
ZHJtL2RybV9jYWNoZS5oPgogCiBzdGF0aWMgdm9pZCBhbWRncHVfZGlzcGxheV9mbGlwX2NhbGxi
YWNrKHN0cnVjdCBkbWFfZmVuY2UgKmYsCiAJCQkJCSBzdHJ1Y3QgZG1hX2ZlbmNlX2NiICpjYikK
QEAgLTQ5NiwxMCArNDk3LDIxIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVy
X2Z1bmNzIGFtZGdwdV9mYl9mdW5jcyA9IHsKIHVpbnQzMl90IGFtZGdwdV9kaXNwbGF5X3N1cHBv
cnRlZF9kb21haW5zKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogewogCXVpbnQzMl90IGRv
bWFpbiA9IEFNREdQVV9HRU1fRE9NQUlOX1ZSQU07CisJdTY0IHVzd2NfZmxhZyA9IEFNREdQVV9H
RU1fQ1JFQVRFX0NQVV9HVFRfVVNXQzsKIAogI2lmIGRlZmluZWQoQ09ORklHX0RSTV9BTURfREMp
Ci0JaWYgKGFkZXYtPmFzaWNfdHlwZSA+PSBDSElQX0NBUlJJWk8gJiYgYWRldi0+YXNpY190eXBl
IDwgQ0hJUF9SQVZFTiAmJgotCSAgICBhZGV2LT5mbGFncyAmIEFNRF9JU19BUFUgJiYKKwkvKgor
CSAqIGlmIGFtZGdwdV9ib192YWxpZGF0ZV91c3djIGNsZWFycyBBTURHUFVfR0VNX0NSRUFURV9D
UFVfR1RUX1VTV0MgaXQKKwkgKiBtZWFucyB0aGF0IFVTV0MgbWFwcGluZ3MKKwkgKiBpcyBub3Qg
c3VwcG9ydGVkIGZvciB0aGlzIGJvYXJkLiBCdXQgdGhpcyBtYXBwaW5nIGlzIHJlcXVpcmVkCisJ
ICogdG8gYXZvaWQgaGFuZyBjYXVzZWQgYnkgcGxhY2VtZW50IG9mIHNjYW5vdXQgQk8gaW4gR1RU
IG9uIGNlcnRhaW4KKwkgKiBBUFVzLiBTbyBmb3JjZSB0aGUgQk8gcGxhY2VtZW50IHRvIFZSQU0g
aW4gY2FzZSB0aGlzIGFyY2hpdGVjdHVyZQorCSAqIHdpbGwgbm90IGFsbG93IFVTV0MgbWFwcGlu
Z3MuCisJICovCisJYW1kZ3B1X2JvX3ZhbGlkYXRlX3Vzd2MoJnVzd2NfZmxhZyk7CisKKwlpZiAo
YWRldi0+YXNpY190eXBlID49IENISVBfQ0FSUklaTyAmJiBhZGV2LT5hc2ljX3R5cGUgPD0gQ0hJ
UF9SQVZFTiAmJgorCSAgICBhZGV2LT5mbGFncyAmIEFNRF9JU19BUFUgJiYgdXN3Y19mbGFnICYm
CiAJICAgIGFtZGdwdV9kZXZpY2VfYXNpY19oYXNfZGNfc3VwcG9ydChhZGV2LT5hc2ljX3R5cGUp
KQogCQlkb21haW4gfD0gQU1ER1BVX0dFTV9ET01BSU5fR1RUOwogI2VuZGlmCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwppbmRleCA0OTIy
NTg5Li5mMDM4N2NlMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1k
Z3B1X2RtL2FtZGdwdV9kbS5jCkBAIC02ODYsNyArNjg2LDcgQEAgc3RhdGljIGludCBhbWRncHVf
ZG1faW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkgKi8KIAlpZiAoYWRldi0+Zmxh
Z3MgJiBBTURfSVNfQVBVICYmCiAJICAgIGFkZXYtPmFzaWNfdHlwZSA+PSBDSElQX0NBUlJJWk8g
JiYKLQkgICAgYWRldi0+YXNpY190eXBlIDwgQ0hJUF9SQVZFTikKKwkgICAgYWRldi0+YXNpY190
eXBlIDw9IENISVBfUkFWRU4pCiAJCWluaXRfZGF0YS5mbGFncy5ncHVfdm1fc3VwcG9ydCA9IHRy
dWU7CiAKIAlpZiAoYW1kZ3B1X2RjX2ZlYXR1cmVfbWFzayAmIERDX0ZCQ19NQVNLKQotLSAKMi43
LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
