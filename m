Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB7A74441
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 06:24:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DBF36E3D3;
	Thu, 25 Jul 2019 04:24:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710080.outbound.protection.outlook.com [40.107.71.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492C26E3D3
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 04:24:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eCMel818R8pEA416zqdib9qWXcupX3O1mgpbme5dxzQX4SOwqSoGGPT+HuMRIqEMpTQSA4Ww82tMfpdutxGQcbI945ArMZniHMRG5RBSt8W3rcgD3cI8K8OgY6Z5LVJdMCRfg6ZaduUC6C0tjABMKHMoR8CJ2P6L2xAF7qcsD/JjjCk8WTJRo25xXxesNDxYFM51QPU5y4mAoq2Hh5zn9Y641UJodRsTj0X00O+u9csSMdvJH+o0WTQ0BZuMnIHag1YaWW7t6diG+wqkhqMXTTDLAONNPwRdk80bh8M3fnA+EWLWQvsg+9hiTezC0dIAInB5vlU9uOZdE7EAkRGHpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7AyA0FLl47DFriN2VlYymbJ4rRsiYbGJgLMsyTH2RWU=;
 b=XEBdqml8V4hQrrSbp+ykYOMK/gFPHQGoK6JIyj+YJJm0E1SR+CwiT997xrRAzdMwJb7nNUNVJYqv2BeVIeeVFwR6eoAg5NCkGKQKulQwvZd+2CQDVPYTzUU7+NiYEUrxTNfCx/wVd9rbVoatpE2Ebo7nkcO79SXuQhDnSi0byQKPpIPpSOrBJ+Gfta6mxLI5Lmnl60oyX8GPpQrF6+0ImTCAzDGRB5MDEJ2oJoL/jJ73+EpcI740HHGtIPqyGXNxTr6iqTZMLhxdsw0uFmxV+74jsiI7sH3ZTcOyorumSw9W4z3Ve/SXTMHRSQG1xCDJOVWGAh4cggBDg2iHR3CP1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=temperror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CY4PR12CA0041.namprd12.prod.outlook.com (2603:10b6:903:129::27)
 by BN6PR12MB1572.namprd12.prod.outlook.com (2603:10b6:405:3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16; Thu, 25 Jul
 2019 04:24:06 +0000
Received: from BY2NAM03FT045.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::209) by CY4PR12CA0041.outlook.office365.com
 (2603:10b6:903:129::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16 via Frontend
 Transport; Thu, 25 Jul 2019 04:24:05 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT045.mail.protection.outlook.com (10.152.85.113) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2115.10 via Frontend Transport; Thu, 25 Jul 2019 04:24:03 +0000
Received: from equan-buildpc.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 24 Jul 2019
 23:24:02 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: fix null pointer dereference around dpm
 state relates
Date: Thu, 25 Jul 2019 12:23:54 +0800
Message-ID: <20190725042354.1931-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(39860400002)(396003)(2980300002)(428003)(199004)(189003)(478600001)(6666004)(26005)(186003)(316002)(356004)(8676002)(44832011)(2906002)(48376002)(486006)(53416004)(336012)(6916009)(70206006)(70586007)(305945005)(4326008)(81166006)(126002)(86362001)(2616005)(81156014)(476003)(2351001)(63370400001)(5660300002)(1076003)(426003)(7696005)(47776003)(50226002)(14444005)(2870700001)(50466002)(36756003)(53936002)(8936002)(68736007)(51416003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1572; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1511bb49-95ba-4181-b3ab-08d710b7ed33
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1572; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1572:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1572F2D2728840E376973561E4C10@BN6PR12MB1572.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-Forefront-PRVS: 0109D382B0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: ZfRRotSR0rCJvpb7WMmYUzCp2HgSIIe4FJcRnbwRTGhXV9Y0FHBiuFfVU8xFK19/jOYGMggR2gMeacqjX7Cs+oW/Yjdk5DcveFMHt3LteOFh0IiFtgrmFHHI4FRznEpzUUi4wkOFGkPvFGvcmX8PFI70vuE71kDWU5/6o3kJRE2jJpQ+tcw0hhQ6PyuR+kTxQFe9xOnZMKzZG3XOAy1xIlcWf7+g09Piuj1K93y1uQuF16gmXXtDUnfBSYQotcFq7r6P8P0QRXhZ0T/rKARgDorWqSnvxTTvD3eR9TW9JtZOlDvp/z5Pq46PADlFdw/KH/Ct643UmblACWjupTn0vSnpGasgmotpBXo3PRauBuUKJWdVDB2KU9pCt6wn7iSEGFY/rYrdiSUf63/aJYeUp2b/lLHjGyDyCFXVtmlZmQ8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2019 04:24:03.8610 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1511bb49-95ba-4181-b3ab-08d710b7ed33
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1572
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7AyA0FLl47DFriN2VlYymbJ4rRsiYbGJgLMsyTH2RWU=;
 b=MWJOsIdXeJ2lPnJsnizVhFe+gmlS6K+obXPAzniadbYnPhfn4AXm/WtNQoPmz06GZqngFy0xnBad3JTJMCbtYRFva25HZMPxjbeMYLvWIWwLsI7Q96frTjOd3lkQPwDgKeddjTmUyjBIPPyJrSTf5MMMBgiPltP56YWi0qnoLis=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=temperror action=none
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

RFBNIHN0YXRlIHJlbGF0ZXMgYXJlIG5vdCBzdXBwb3J0ZWQgb24gdGhlIG5ldyBTVyBTTVUgQVNJ
Q3MuIEJ1dCBzdGlsbAppdCdzIG5vdCBPSyB0byB0cmlnZ2VyIG51bGwgcG9pbnRlciBkZXJlZmVy
ZW5jZSBvbiBhY2Nlc3NpbmcgdGhlbS4KCkNoYW5nZS1JZDogSTM2OGQxMDhmYmVhNDM4ZWQ1ZDll
M2I4NDlkMDA2ZGRkNTMwODA1MmIKU2lnbmVkLW9mZi1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5A
YW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYyAgICAg
fCAxOCArKysrKysrKysrKysrLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2Ft
ZGdwdV9zbXUuYyB8ICAzICsrLQogMiBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA2
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9wbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmMKaW5kZXgg
MzA0NjI2YjIxYThjLi42MTMxMmIwMmI1YzcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9wbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9wbS5jCkBAIC0yMDksMTIgKzIwOSwxNiBAQCBzdGF0aWMgc3NpemVfdCBhbWRncHVfZ2V0
X2RwbV9zdGF0ZShzdHJ1Y3QgZGV2aWNlICpkZXYsCiAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYgPSBkZGV2LT5kZXZfcHJpdmF0ZTsKIAllbnVtIGFtZF9wbV9zdGF0ZV90eXBlIHBtOwogCi0J
aWYgKGlzX3N1cHBvcnRfc3dfc211KGFkZXYpICYmIGFkZXYtPnNtdS5wcHRfZnVuY3MtPmdldF9j
dXJyZW50X3Bvd2VyX3N0YXRlKQotCQlwbSA9IGFtZGdwdV9zbXVfZ2V0X2N1cnJlbnRfcG93ZXJf
c3RhdGUoYWRldik7Ci0JZWxzZSBpZiAoYWRldi0+cG93ZXJwbGF5LnBwX2Z1bmNzLT5nZXRfY3Vy
cmVudF9wb3dlcl9zdGF0ZSkKKwlpZiAoaXNfc3VwcG9ydF9zd19zbXUoYWRldikpIHsKKwkJaWYg
KGFkZXYtPnNtdS5wcHRfZnVuY3MtPmdldF9jdXJyZW50X3Bvd2VyX3N0YXRlKQorCQkJcG0gPSBh
bWRncHVfc211X2dldF9jdXJyZW50X3Bvd2VyX3N0YXRlKGFkZXYpOworCQllbHNlCisJCQlwbSA9
IGFkZXYtPnBtLmRwbS51c2VyX3N0YXRlOworCX0gZWxzZSBpZiAoYWRldi0+cG93ZXJwbGF5LnBw
X2Z1bmNzLT5nZXRfY3VycmVudF9wb3dlcl9zdGF0ZSkgewogCQlwbSA9IGFtZGdwdV9kcG1fZ2V0
X2N1cnJlbnRfcG93ZXJfc3RhdGUoYWRldik7Ci0JZWxzZQorCX0gZWxzZSB7CiAJCXBtID0gYWRl
di0+cG0uZHBtLnVzZXJfc3RhdGU7CisJfQogCiAJcmV0dXJuIHNucHJpbnRmKGJ1ZiwgUEFHRV9T
SVpFLCAiJXNcbiIsCiAJCQkocG0gPT0gUE9XRVJfU1RBVEVfVFlQRV9CQVRURVJZKSA/ICJiYXR0
ZXJ5IiA6CkBAIC0yNDEsNyArMjQ1LDExIEBAIHN0YXRpYyBzc2l6ZV90IGFtZGdwdV9zZXRfZHBt
X3N0YXRlKHN0cnVjdCBkZXZpY2UgKmRldiwKIAkJZ290byBmYWlsOwogCX0KIAotCWlmIChhZGV2
LT5wb3dlcnBsYXkucHBfZnVuY3MtPmRpc3BhdGNoX3Rhc2tzKSB7CisJaWYgKGlzX3N1cHBvcnRf
c3dfc211KGFkZXYpKSB7CisJCW11dGV4X2xvY2soJmFkZXYtPnBtLm11dGV4KTsKKwkJYWRldi0+
cG0uZHBtLnVzZXJfc3RhdGUgPSBzdGF0ZTsKKwkJbXV0ZXhfdW5sb2NrKCZhZGV2LT5wbS5tdXRl
eCk7CisJfSBlbHNlIGlmIChhZGV2LT5wb3dlcnBsYXkucHBfZnVuY3MtPmRpc3BhdGNoX3Rhc2tz
KSB7CiAJCWFtZGdwdV9kcG1fZGlzcGF0Y2hfdGFzayhhZGV2LCBBTURfUFBfVEFTS19FTkFCTEVf
VVNFUl9TVEFURSwgJnN0YXRlKTsKIAl9IGVsc2UgewogCQltdXRleF9sb2NrKCZhZGV2LT5wbS5t
dXRleCk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVf
c211LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKaW5kZXgg
YTUwNzliOTNjYWEzLi4zZWNkNjdlNmU2NWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9hbWRncHVfc211LmMKQEAgLTMwNCw3ICszMDQsOCBAQCBpbnQgc211X2dldF9wb3dlcl9u
dW1fc3RhdGVzKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAogCiAJLyogbm90IHN1cHBvcnQgcG93
ZXIgc3RhdGUgKi8KIAltZW1zZXQoc3RhdGVfaW5mbywgMCwgc2l6ZW9mKHN0cnVjdCBwcF9zdGF0
ZXNfaW5mbykpOwotCXN0YXRlX2luZm8tPm51bXMgPSAwOworCXN0YXRlX2luZm8tPm51bXMgPSAx
OworCXN0YXRlX2luZm8tPnN0YXRlc1swXSA9IFBPV0VSX1NUQVRFX1RZUEVfREVGQVVMVDsKIAog
CXJldHVybiAwOwogfQotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
