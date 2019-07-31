Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6C77B84B
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jul 2019 05:40:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DCA189824;
	Wed, 31 Jul 2019 03:40:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710066.outbound.protection.outlook.com [40.107.71.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D5D489805
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 03:40:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nsxqMhUUO0mH8M1bNIP1ki+hUh9yXaPxLwnTCsPXPKyfWDYDe8NPKDpsoHYqMk/Omja82LGBmTMVk9udtTTLL3acYX4xz3JbYiH8pSijq/IKNTtoNR0y+ag8BcdrAAwaS9ajE0TJ1o010X18v/wp1vUsaUepImn4QqSW/uuuLkB01Kgf8KVTguIhMrMpT5DffcWrnELtvz8hY6DF7lCYvvrBHr5AKSTjag7mg/7HIxlH2YJ4qNllm2vNd+NfJpLWxTOs9BuyioXbXDG2IETEqopuGOSBwPyDM8iEndShR9eiaMhMdIEeHhvuNm7YQHMNHTbxajbt2+lUgvNBuODc7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ah2NTdSN8uEqB3CIPq0NYeMeMVbP5XCqzJ321BQriPg=;
 b=oFUEB4PksbjQ8bxd/n5oLU6KhfrZ2gQbUT25JM73jtc3Rouk/n5guzpCyQI2GDvzKySoH2jo6V2bphd9AQLrS6nOG4HoE4sG/3qFF2vGeK55RX07CJlZkDNILlHmlw9MZC2bxhEyD1vw6Uau3c2uEA/4nq1kjQL2AotPR6aTe/eUKTXQW4KxdGvSXmIFfJKg35sEz5OPLbGxz4PRC4oi7UsTNx57wtZKaaJvQwMjpPNESdQe+YxPshV1MvNbOPoOicgCvhrPsA0ojUPnvQLQAjGp5rgxqmNQf0BYs0d560nehCp/Sb59z3e7yZ761VEtt7UuTugvHEPVnLNAenrtuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from SN1PR12CA0082.namprd12.prod.outlook.com (2603:10b6:802:21::17)
 by BL0PR12MB2529.namprd12.prod.outlook.com (2603:10b6:207:4e::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.15; Wed, 31 Jul
 2019 03:40:24 +0000
Received: from CO1NAM03FT045.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by SN1PR12CA0082.outlook.office365.com
 (2603:10b6:802:21::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.12 via Frontend
 Transport; Wed, 31 Jul 2019 03:40:23 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT045.mail.protection.outlook.com (10.152.81.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2115.10 via Frontend Transport; Wed, 31 Jul 2019 03:40:22 +0000
Received: from equan-buildpc.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Jul 2019
 22:40:19 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amd/powerplay: enable SW SMU power profile switch
 support in KFD
Date: Wed, 31 Jul 2019 11:39:59 +0800
Message-ID: <20190731033959.10414-2-evan.quan@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190731033959.10414-1-evan.quan@amd.com>
References: <20190731033959.10414-1-evan.quan@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(376002)(346002)(39860400002)(2980300002)(428003)(189003)(199004)(48376002)(2351001)(53416004)(426003)(5660300002)(6666004)(356004)(126002)(50466002)(47776003)(70206006)(36756003)(186003)(70586007)(51416003)(336012)(486006)(2870700001)(76176011)(305945005)(53936002)(11346002)(4326008)(81166006)(81156014)(6916009)(14444005)(26005)(316002)(8676002)(50226002)(68736007)(7696005)(2906002)(1076003)(2616005)(44832011)(478600001)(446003)(8936002)(476003)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2529; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 069e7edd-098a-47cd-29e5-08d71568d1a4
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:BL0PR12MB2529; 
X-MS-TrafficTypeDiagnostic: BL0PR12MB2529:
X-Microsoft-Antispam-PRVS: <BL0PR12MB25295CD0CEC9BCA49FCD51DBE4DF0@BL0PR12MB2529.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-Forefront-PRVS: 011579F31F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 5yfUTfYWRoAJhy8cHa9DeLjZXBuY7H8rMnBlmY7jiSO8ZQRdyYCr3Yn+jNTIubMxHbyuxEd7aEvaUn3DBl879anlL2HQL3NcZqMz/ylnHZb1sKhMyO57ZqFlMDOmeLqaoBhz3/sTTX7fyW2AHt+w0fcDdd5o4xdzSizKyA8BBs/JTmMn+Y8/DMcHX9X+SItmDZ0PeBfeA5jAs/Sxkc1OXYf7ssXWANjM6ygbp3APQCknreFYjBraRiTWAo513Z3YXBmbyvCB570ptI2BI262G0+YJ0+tiQGRpN8KZxlwBwcrtQkZSPN7IdsI//OWLJDjOlDojZa19qkexRDdBGHVM3mT0wjycHWHcnJjN4GiwESPl1De3/D9lTTcivGQorh8cP1wdE10/UM0ko693N8c0TKU3awGj0Lrd3bmJBrvAjA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2019 03:40:22.3329 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 069e7edd-098a-47cd-29e5-08d71568d1a4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2529
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ah2NTdSN8uEqB3CIPq0NYeMeMVbP5XCqzJ321BQriPg=;
 b=HG0LZlhbBMfu0e9G73PVfhJCQOhveVaRkFL6oywjjgqjeWGhjyK6kqMc0f5qFBr1VsvxXC78qRRP6PM8R+E/Q4RLynAtZpUI3yz4wc8gemA6jurYbz/lEys6kefKpbgSoYsyMF54FUpPrSUYlM9JBDtdrSuYMDM3AEtGeskTIQY=
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

SG9vayB1cCB0aGUgU1cgU01VIHBvd2VyIHByb2ZpbGUgc3dpdGNoIGluIEtGRCByb3V0aW5lLgoK
Q2hhbmdlLUlkOiBJNDFlNTM3NjJjZGM3NTA0Mjg1ZGU4OWYzMGUzZTZlMmJiMzk2Yjk1MwpTaWdu
ZWQtb2ZmLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuYyAgICB8ICA4ICsrKy0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgICAgfCAzNiArKysrKysrKysrKysrKysr
KysrCiAuLi4vZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmggICAgfCAgMyAr
KwogMyBmaWxlcyBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuYwppbmRleCA0M2IxMTg3OTcx
M2QuLjljNWRjYWE4ZmE0OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2FtZGtmZC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9h
bWRrZmQuYwpAQCAtNjcyLDggKzY3MiwxMiBAQCB2b2lkIGFtZGdwdV9hbWRrZmRfc2V0X2NvbXB1
dGVfaWRsZShzdHJ1Y3Qga2dkX2RldiAqa2dkLCBib29sIGlkbGUpCiB7CiAJc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKilrZ2Q7CiAKLQlpZiAoYWRl
di0+cG93ZXJwbGF5LnBwX2Z1bmNzICYmCi0JICAgIGFkZXYtPnBvd2VycGxheS5wcF9mdW5jcy0+
c3dpdGNoX3Bvd2VyX3Byb2ZpbGUpCisJaWYgKGlzX3N1cHBvcnRfc3dfc211KGFkZXYpKQorCQlz
bXVfc3dpdGNoX3Bvd2VyX3Byb2ZpbGUoJmFkZXYtPnNtdSwKKwkJCQkJIFBQX1NNQ19QT1dFUl9Q
Uk9GSUxFX0NPTVBVVEUsCisJCQkJCSAhaWRsZSk7CisJZWxzZSBpZiAoYWRldi0+cG93ZXJwbGF5
LnBwX2Z1bmNzICYmCisJCSBhZGV2LT5wb3dlcnBsYXkucHBfZnVuY3MtPnN3aXRjaF9wb3dlcl9w
cm9maWxlKQogCQlhbWRncHVfZHBtX3N3aXRjaF9wb3dlcl9wcm9maWxlKGFkZXYsCiAJCQkJCQlQ
UF9TTUNfUE9XRVJfUFJPRklMRV9DT01QVVRFLAogCQkJCQkJIWlkbGUpOwpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCmluZGV4IGQ5OWE4YWEwZGVmYi4uNTVjY2I0
ZTZhNmZiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVf
c211LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCkBA
IC0xNDQ3LDYgKzE0NDcsNDIgQEAgaW50IHNtdV9oYW5kbGVfdGFzayhzdHJ1Y3Qgc211X2NvbnRl
eHQgKnNtdSwKIAlyZXR1cm4gcmV0OwogfQogCitpbnQgc211X3N3aXRjaF9wb3dlcl9wcm9maWxl
KHN0cnVjdCBzbXVfY29udGV4dCAqc211LAorCQkJICAgICBlbnVtIFBQX1NNQ19QT1dFUl9QUk9G
SUxFIHR5cGUsCisJCQkgICAgIGJvb2wgZW4pCit7CisJc3RydWN0IHNtdV9kcG1fY29udGV4dCAq
c211X2RwbV9jdHggPSAmKHNtdS0+c211X2RwbSk7CisJbG9uZyB3b3JrbG9hZDsKKwl1aW50MzJf
dCBpbmRleDsKKworCWlmICghc211LT5wbV9lbmFibGVkKQorCQlyZXR1cm4gLUVJTlZBTDsKKwor
CWlmICghKHR5cGUgPCBQUF9TTUNfUE9XRVJfUFJPRklMRV9DVVNUT00pKQorCQlyZXR1cm4gLUVJ
TlZBTDsKKworCW11dGV4X2xvY2soJnNtdS0+bXV0ZXgpOworCisJaWYgKCFlbikgeworCQlzbXUt
Pndvcmtsb2FkX21hc2sgJj0gfigxIDw8IHNtdS0+d29ya2xvYWRfcHJvcml0eVt0eXBlXSk7CisJ
CWluZGV4ID0gZmxzKHNtdS0+d29ya2xvYWRfbWFzayk7CisJCWluZGV4ID0gaW5kZXggPiAwICYm
IGluZGV4IDw9IFdPUktMT0FEX1BPTElDWV9NQVggPyBpbmRleCAtIDEgOiAwOworCQl3b3JrbG9h
ZCA9IHNtdS0+d29ya2xvYWRfc2V0dGluZ1tpbmRleF07CisJfSBlbHNlIHsKKwkJc211LT53b3Jr
bG9hZF9tYXNrIHw9ICgxIDw8IHNtdS0+d29ya2xvYWRfcHJvcml0eVt0eXBlXSk7CisJCWluZGV4
ID0gZmxzKHNtdS0+d29ya2xvYWRfbWFzayk7CisJCWluZGV4ID0gaW5kZXggPD0gV09SS0xPQURf
UE9MSUNZX01BWCA/IGluZGV4IC0gMSA6IDA7CisJCXdvcmtsb2FkID0gc211LT53b3JrbG9hZF9z
ZXR0aW5nW2luZGV4XTsKKwl9CisKKwlpZiAoc211X2RwbV9jdHgtPmRwbV9sZXZlbCAhPSBBTURf
RFBNX0ZPUkNFRF9MRVZFTF9NQU5VQUwpCisJCXNtdV9zZXRfcG93ZXJfcHJvZmlsZV9tb2RlKHNt
dSwgJndvcmtsb2FkLCAwKTsKKworCW11dGV4X3VubG9jaygmc211LT5tdXRleCk7CisKKwlyZXR1
cm4gMDsKK30KKwogZW51bSBhbWRfZHBtX2ZvcmNlZF9sZXZlbCBzbXVfZ2V0X3BlcmZvcm1hbmNl
X2xldmVsKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQogewogCXN0cnVjdCBzbXVfZHBtX2NvbnRl
eHQgKnNtdV9kcG1fY3R4ID0gJihzbXUtPnNtdV9kcG0pOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaCBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgKaW5kZXggOWMwYTUzZWY5M2M0Li4xYjQ0NDE0
Y2VjM2IgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRn
cHVfc211LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9z
bXUuaApAQCAtOTczLDYgKzk3Myw5IEBAIGV4dGVybiBpbnQgc211X2RwbV9zZXRfcG93ZXJfZ2F0
ZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSx1aW50MzJfdCBibG9ja190eXBlLCBiCiBleHRlcm4g
aW50IHNtdV9oYW5kbGVfdGFzayhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIAkJCSAgIGVudW0g
YW1kX2RwbV9mb3JjZWRfbGV2ZWwgbGV2ZWwsCiAJCQkgICBlbnVtIGFtZF9wcF90YXNrIHRhc2tf
aWQpOworaW50IHNtdV9zd2l0Y2hfcG93ZXJfcHJvZmlsZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNt
dSwKKwkJCSAgICAgZW51bSBQUF9TTUNfUE9XRVJfUFJPRklMRSB0eXBlLAorCQkJICAgICBib29s
IGVuKTsKIGludCBzbXVfZ2V0X3NtY192ZXJzaW9uKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCB1
aW50MzJfdCAqaWZfdmVyc2lvbiwgdWludDMyX3QgKnNtdV92ZXJzaW9uKTsKIGludCBzbXVfZ2V0
X2RwbV9mcmVxX2J5X2luZGV4KHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBlbnVtIHNtdV9jbGtf
dHlwZSBjbGtfdHlwZSwKIAkJCSAgICAgIHVpbnQxNl90IGxldmVsLCB1aW50MzJfdCAqdmFsdWUp
OwotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
