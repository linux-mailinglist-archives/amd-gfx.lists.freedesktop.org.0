Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 637627A37F
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jul 2019 10:59:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E527A8989F;
	Tue, 30 Jul 2019 08:59:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800089.outbound.protection.outlook.com [40.107.80.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6821F8989F
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Jul 2019 08:59:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VssK+wobirdjjIbi8N3pd1hxlMcvaB6DyYk5UWbvfr+kSFjC3QmT9UhXyvcRW2I4rIUiqDN/ilt02e5a4qjs30ucfyAICfBEwKeqbdnLR3LL8UFyW3c83VYlrny8RXSHKTCTDdRbeDXFz2xrU52zPBa2ZMKdv4DFroBkK261FoYrCuiWqIsM+g4moJcVqn7NMsk8aLiHr5+DwuErCBYod+1L72ZEQfKZchMZQlh5obvnynH8pLKGLMMJlD0yFLR1rtVgFt9Sp1pvbuRb3htjIDoPFaCQSHJ9oj9C+uOI8QeXrmLRY4bK6aa+gUje233N70FftIXGBL+Q7PYBVb1rVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sbDLhx6hWb/QQjZRuRgKrHO0hj58Dq/e3wQOI5PNrmE=;
 b=JrSquD8WRbN8+Wl2MS5R8KY7wuGWlC237O//vSBMexVZ+UYi42dDG77MztES0Mx8WNBmPGjSwX9AUUkUal1bG1h93hW2rJbWrYhMcxGzzluTQ7/vOaPHu4vbxfwGfapoMjdn/CwO76FBqq+aJktQGX1YlTjTkClzvD32XjKSEvG38qt5USsZu4MljCL8kdD4JRXqOxP7kosB+9t/Jen5oufW4Sw3zZOMNYm3IkSxdGg3NLX7noDu4wUsoc7iM5GPvFem2CbbthtpudbtMTgiz8Zf9TLPVDXbj3Ej9VUBu8SOnkZMaaorRqQLryBl7gxXLLWGFPQMA5PZclLNm5SXFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM3PR12CA0046.namprd12.prod.outlook.com (2603:10b6:0:56::14) by
 MN2PR12MB3518.namprd12.prod.outlook.com (2603:10b6:208:101::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.14; Tue, 30 Jul
 2019 08:59:46 +0000
Received: from DM3NAM03FT057.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by DM3PR12CA0046.outlook.office365.com
 (2603:10b6:0:56::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2115.15 via Frontend
 Transport; Tue, 30 Jul 2019 08:59:46 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT057.mail.protection.outlook.com (10.152.83.45) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2115.10 via Frontend Transport; Tue, 30 Jul 2019 08:59:46 +0000
Received: from equan-buildpc.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Jul 2019
 03:59:45 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: guard consistency between CPU copy and
 local VRAM
Date: Tue, 30 Jul 2019 16:59:20 +0800
Message-ID: <20190730085920.4604-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(376002)(396003)(2980300002)(428003)(199004)(189003)(47776003)(2906002)(426003)(186003)(36756003)(1076003)(53936002)(5660300002)(336012)(7696005)(26005)(51416003)(2870700001)(70206006)(53416004)(126002)(316002)(4326008)(476003)(2616005)(486006)(14444005)(305945005)(44832011)(8676002)(50466002)(6666004)(356004)(6916009)(2351001)(81166006)(81156014)(68736007)(70586007)(48376002)(8936002)(478600001)(50226002)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3518; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eaed9bee-622c-4893-8ae9-08d714cc4549
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MN2PR12MB3518; 
X-MS-TrafficTypeDiagnostic: MN2PR12MB3518:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3518475E5F87BA7E426AC43BE4DC0@MN2PR12MB3518.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-Forefront-PRVS: 0114FF88F6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: /cV+biWEIxSRO5dplXCo01qv4nR+2g8r0TK9ggLIf0xFuaCnuPV9BFsEqhzXVwh827PnB4/QdP+LOQDRqr60zA6Z6ttxsXDr5lRAnmw/BGT2Y0lEuZbJ0oc4/z149lQE3JKou3SC1Y2E/HeHm4fa7UstELR8A+o/IqkrgPBn8t2HFR6OvP2697gqUeKYqAEgG07s4N58ZS9sMifD+bZSiXmP/8Dp2NftNdxCGddZZ1NUIjJ1nrkGcMyruDkHMyaqDSlOUYWcJ+CChixj4GyD9NYfAk0O7Gjso97CcApOiwY4YHVnRt/8z0KCxnQZ9OK197fWxjtOaIgfynop1A/HPXjnN0dOqSNhkfOYOCQpSxdgKiprI7TSKmUi8lkim5Tl5x8ySJ3kQYedv1kjGR5LOpuctZecxcqmq6QJ0PY2svM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2019 08:59:46.3134 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eaed9bee-622c-4893-8ae9-08d714cc4549
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3518
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sbDLhx6hWb/QQjZRuRgKrHO0hj58Dq/e3wQOI5PNrmE=;
 b=jDRDBkopBhK6Jru1niXSjcufwBchlUy9aGPgWoQkMQIuOShK7rmlBT5azL8BAQCPlBqX7EiRoiOjExqxgv2/MVyIikMLRgEDnvTNJf01qaVnyAaTJA7yeqCEY+8kBf95RhKsNDEBGQUogsrOfgKFMdm7rj2QOvw9JSA4ke/A80s=
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

VGhpcyBjYW4gcHJldmVudCBDUFUgdG8gdXNlIHRoZSBvdXQtZGF0ZWQgY29weS4KCkNoYW5nZS1J
ZDogSWExOGU4OWE5MjNlMzUyMmUwMTcxN2FhNGQ1YmEzNWY4ZjRmMjA3NjMKU2lnbmVkLW9mZi1i
eTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9hbWRncHVfc211LmMgICAgICAgICAgIHwgNCArKysrCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9zbXVtZ3Ivc211MTBfc211bWdyLmMgIHwgNCArKysrCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVtZ3IvdmVnYTEwX3NtdW1nci5jIHwgNCArKysrCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVtZ3IvdmVnYTEyX3NtdW1nci5jIHwgNCAr
KysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVtZ3IvdmVnYTIwX3NtdW1nci5j
IHwgOCArKysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCmluZGV4IDliNTY2MWRjMTBkYS4u
ZDk5YThhYTBkZWZiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9h
bWRncHVfc211LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3Nt
dS5jCkBAIC0zMTQsNiArMzE0LDcgQEAgaW50IHNtdV91cGRhdGVfdGFibGUoc3RydWN0IHNtdV9j
b250ZXh0ICpzbXUsIGVudW0gc211X3RhYmxlX2lkIHRhYmxlX2luZGV4LAogCQkgICAgIHZvaWQg
KnRhYmxlX2RhdGEsIGJvb2wgZHJ2MnNtdSkKIHsKIAlzdHJ1Y3Qgc211X3RhYmxlX2NvbnRleHQg
KnNtdV90YWJsZSA9ICZzbXUtPnNtdV90YWJsZTsKKwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diA9IHNtdS0+YWRldjsKIAlzdHJ1Y3Qgc211X3RhYmxlICp0YWJsZSA9IE5VTEw7CiAJaW50IHJl
dCA9IDA7CiAJaW50IHRhYmxlX2lkID0gc211X3RhYmxlX2dldF9pbmRleChzbXUsIHRhYmxlX2lu
ZGV4KTsKQEAgLTM0MSw2ICszNDIsOSBAQCBpbnQgc211X3VwZGF0ZV90YWJsZShzdHJ1Y3Qgc211
X2NvbnRleHQgKnNtdSwgZW51bSBzbXVfdGFibGVfaWQgdGFibGVfaW5kZXgsCiAJaWYgKHJldCkK
IAkJcmV0dXJuIHJldDsKIAorCS8qIGZsdXNoIGhkcCBjYWNoZSAqLworCWFkZXYtPm5iaW9fZnVu
Y3MtPmhkcF9mbHVzaChhZGV2LCBOVUxMKTsKKwogCWlmICghZHJ2MnNtdSkKIAkJbWVtY3B5KHRh
YmxlX2RhdGEsIHRhYmxlLT5jcHVfYWRkciwgdGFibGUtPnNpemUpOwogCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVtZ3Ivc211MTBfc211bWdyLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVtZ3Ivc211MTBfc211bWdyLmMKaW5kZXggY2E2
NjAzNTFhMzYzLi41OWIxMWFjNWI1M2IgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L3NtdW1nci9zbXUxMF9zbXVtZ3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9zbXVtZ3Ivc211MTBfc211bWdyLmMKQEAgLTExNiw2ICsxMTYsNyBAQCBzdGF0
aWMgaW50IHNtdTEwX2NvcHlfdGFibGVfZnJvbV9zbWMoc3RydWN0IHBwX2h3bWdyICpod21nciwK
IHsKIAlzdHJ1Y3Qgc211MTBfc211bWdyICpwcml2ID0KIAkJCShzdHJ1Y3Qgc211MTBfc211bWdy
ICopKGh3bWdyLT5zbXVfYmFja2VuZCk7CisJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBo
d21nci0+YWRldjsKIAogCVBQX0FTU0VSVF9XSVRIX0NPREUodGFibGVfaWQgPCBNQVhfU01VX1RB
QkxFLAogCQkJIkludmFsaWQgU01VIFRhYmxlIElEISIsIHJldHVybiAtRUlOVkFMOyk7CkBAIC0x
MzMsNiArMTM0LDkgQEAgc3RhdGljIGludCBzbXUxMF9jb3B5X3RhYmxlX2Zyb21fc21jKHN0cnVj
dCBwcF9od21nciAqaHdtZ3IsCiAJCQlQUFNNQ19NU0dfVHJhbnNmZXJUYWJsZVNtdTJEcmFtLAog
CQkJcHJpdi0+c211X3RhYmxlcy5lbnRyeVt0YWJsZV9pZF0udGFibGVfaWQpOwogCisJLyogZmx1
c2ggaGRwIGNhY2hlICovCisJYWRldi0+bmJpb19mdW5jcy0+aGRwX2ZsdXNoKGFkZXYsIE5VTEwp
OworCiAJbWVtY3B5KHRhYmxlLCAodWludDhfdCAqKXByaXYtPnNtdV90YWJsZXMuZW50cnlbdGFi
bGVfaWRdLnRhYmxlLAogCQkJcHJpdi0+c211X3RhYmxlcy5lbnRyeVt0YWJsZV9pZF0uc2l6ZSk7
CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdW1nci92ZWdh
MTBfc211bWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVtZ3IvdmVnYTEw
X3NtdW1nci5jCmluZGV4IDdiZmVmOGQ4NWNkYS4uOGUwN2ZjMWZiOWNlIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVtZ3IvdmVnYTEwX3NtdW1nci5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdW1nci92ZWdhMTBfc211bWdyLmMKQEAg
LTM3LDYgKzM3LDcgQEAgc3RhdGljIGludCB2ZWdhMTBfY29weV90YWJsZV9mcm9tX3NtYyhzdHJ1
Y3QgcHBfaHdtZ3IgKmh3bWdyLAogCQl1aW50OF90ICp0YWJsZSwgaW50MTZfdCB0YWJsZV9pZCkK
IHsKIAlzdHJ1Y3QgdmVnYTEwX3NtdW1nciAqcHJpdiA9IGh3bWdyLT5zbXVfYmFja2VuZDsKKwlz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IGh3bWdyLT5hZGV2OwogCiAJUFBfQVNTRVJUX1dJ
VEhfQ09ERSh0YWJsZV9pZCA8IE1BWF9TTVVfVEFCTEUsCiAJCQkiSW52YWxpZCBTTVUgVGFibGUg
SUQhIiwgcmV0dXJuIC1FSU5WQUwpOwpAQCAtNTQsNiArNTUsOSBAQCBzdGF0aWMgaW50IHZlZ2Ex
MF9jb3B5X3RhYmxlX2Zyb21fc21jKHN0cnVjdCBwcF9od21nciAqaHdtZ3IsCiAJCQlQUFNNQ19N
U0dfVHJhbnNmZXJUYWJsZVNtdTJEcmFtLAogCQkJcHJpdi0+c211X3RhYmxlcy5lbnRyeVt0YWJs
ZV9pZF0udGFibGVfaWQpOwogCisJLyogZmx1c2ggaGRwIGNhY2hlICovCisJYWRldi0+bmJpb19m
dW5jcy0+aGRwX2ZsdXNoKGFkZXYsIE5VTEwpOworCiAJbWVtY3B5KHRhYmxlLCBwcml2LT5zbXVf
dGFibGVzLmVudHJ5W3RhYmxlX2lkXS50YWJsZSwKIAkJCXByaXYtPnNtdV90YWJsZXMuZW50cnlb
dGFibGVfaWRdLnNpemUpOwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9zbXVtZ3IvdmVnYTEyX3NtdW1nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvc211bWdyL3ZlZ2ExMl9zbXVtZ3IuYwppbmRleCA5YWQwN2E5MWMzOGIuLmMxMWRhZTcyMGEz
NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL3ZlZ2Ex
Ml9zbXVtZ3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVtZ3IvdmVn
YTEyX3NtdW1nci5jCkBAIC00Miw2ICs0Miw3IEBAIHN0YXRpYyBpbnQgdmVnYTEyX2NvcHlfdGFi
bGVfZnJvbV9zbWMoc3RydWN0IHBwX2h3bWdyICpod21nciwKIHsKIAlzdHJ1Y3QgdmVnYTEyX3Nt
dW1nciAqcHJpdiA9CiAJCQkoc3RydWN0IHZlZ2ExMl9zbXVtZ3IgKikoaHdtZ3ItPnNtdV9iYWNr
ZW5kKTsKKwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IGh3bWdyLT5hZGV2OwogCiAJUFBf
QVNTRVJUX1dJVEhfQ09ERSh0YWJsZV9pZCA8IFRBQkxFX0NPVU5ULAogCQkJIkludmFsaWQgU01V
IFRhYmxlIElEISIsIHJldHVybiAtRUlOVkFMKTsKQEAgLTY0LDYgKzY1LDkgQEAgc3RhdGljIGlu
dCB2ZWdhMTJfY29weV90YWJsZV9mcm9tX3NtYyhzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLAogCQkJ
IltDb3B5VGFibGVGcm9tU01DXSBBdHRlbXB0IHRvIFRyYW5zZmVyIFRhYmxlIEZyb20gU01VIEZh
aWxlZCEiLAogCQkJcmV0dXJuIC1FSU5WQUwpOwogCisJLyogZmx1c2ggaGRwIGNhY2hlICovCisJ
YWRldi0+bmJpb19mdW5jcy0+aGRwX2ZsdXNoKGFkZXYsIE5VTEwpOworCiAJbWVtY3B5KHRhYmxl
LCBwcml2LT5zbXVfdGFibGVzLmVudHJ5W3RhYmxlX2lkXS50YWJsZSwKIAkJCXByaXYtPnNtdV90
YWJsZXMuZW50cnlbdGFibGVfaWRdLnNpemUpOwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9zbXVtZ3IvdmVnYTIwX3NtdW1nci5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvc211bWdyL3ZlZ2EyMF9zbXVtZ3IuYwppbmRleCA5NTc0NDZjZjQ2N2Uu
LjNlOTdiODM5NTBkYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
c211bWdyL3ZlZ2EyMF9zbXVtZ3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9zbXVtZ3IvdmVnYTIwX3NtdW1nci5jCkBAIC0xNjMsNiArMTYzLDcgQEAgc3RhdGljIGludCB2
ZWdhMjBfY29weV90YWJsZV9mcm9tX3NtYyhzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLAogewogCXN0
cnVjdCB2ZWdhMjBfc211bWdyICpwcml2ID0KIAkJCShzdHJ1Y3QgdmVnYTIwX3NtdW1nciAqKSho
d21nci0+c211X2JhY2tlbmQpOworCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gaHdtZ3It
PmFkZXY7CiAJaW50IHJldCA9IDA7CiAKIAlQUF9BU1NFUlRfV0lUSF9DT0RFKHRhYmxlX2lkIDwg
VEFCTEVfQ09VTlQsCkBAIC0xODcsNiArMTg4LDkgQEAgc3RhdGljIGludCB2ZWdhMjBfY29weV90
YWJsZV9mcm9tX3NtYyhzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLAogCQkJIltDb3B5VGFibGVGcm9t
U01DXSBBdHRlbXB0IHRvIFRyYW5zZmVyIFRhYmxlIEZyb20gU01VIEZhaWxlZCEiLAogCQkJcmV0
dXJuIHJldCk7CiAKKwkvKiBmbHVzaCBoZHAgY2FjaGUgKi8KKwlhZGV2LT5uYmlvX2Z1bmNzLT5o
ZHBfZmx1c2goYWRldiwgTlVMTCk7CisKIAltZW1jcHkodGFibGUsIHByaXYtPnNtdV90YWJsZXMu
ZW50cnlbdGFibGVfaWRdLnRhYmxlLAogCQkJcHJpdi0+c211X3RhYmxlcy5lbnRyeVt0YWJsZV9p
ZF0uc2l6ZSk7CiAKQEAgLTI2Niw2ICsyNzAsNyBAQCBpbnQgdmVnYTIwX2dldF9hY3Rpdml0eV9t
b25pdG9yX2NvZWZmKHN0cnVjdCBwcF9od21nciAqaHdtZ3IsCiB7CiAJc3RydWN0IHZlZ2EyMF9z
bXVtZ3IgKnByaXYgPQogCQkJKHN0cnVjdCB2ZWdhMjBfc211bWdyICopKGh3bWdyLT5zbXVfYmFj
a2VuZCk7CisJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBod21nci0+YWRldjsKIAlpbnQg
cmV0ID0gMDsKIAogCVBQX0FTU0VSVF9XSVRIX0NPREUoKHJldCA9IHZlZ2EyMF9zZW5kX21zZ190
b19zbWNfd2l0aF9wYXJhbWV0ZXIoaHdtZ3IsCkBAIC0yODQsNiArMjg5LDkgQEAgaW50IHZlZ2Ey
MF9nZXRfYWN0aXZpdHlfbW9uaXRvcl9jb2VmZihzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLAogCQkJ
IltHZXRBY3Rpdml0eU1vbml0b3JdIEF0dGVtcHQgdG8gVHJhbnNmZXIgVGFibGUgRnJvbSBTTVUg
RmFpbGVkISIsCiAJCQlyZXR1cm4gcmV0KTsKIAorCS8qIGZsdXNoIGhkcCBjYWNoZSAqLworCWFk
ZXYtPm5iaW9fZnVuY3MtPmhkcF9mbHVzaChhZGV2LCBOVUxMKTsKKwogCW1lbWNweSh0YWJsZSwg
cHJpdi0+c211X3RhYmxlcy5lbnRyeVtUQUJMRV9BQ1RJVklUWV9NT05JVE9SX0NPRUZGXS50YWJs
ZSwKIAkJCXByaXYtPnNtdV90YWJsZXMuZW50cnlbVEFCTEVfQUNUSVZJVFlfTU9OSVRPUl9DT0VG
Rl0uc2l6ZSk7CiAKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
