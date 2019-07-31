Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B647B84A
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jul 2019 05:40:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D41897FD;
	Wed, 31 Jul 2019 03:40:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740057.outbound.protection.outlook.com [40.107.74.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 648E4897FD
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 03:40:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aeumLvHzk0GbFkNy8eO0fzdiJoCTabsszNW5ucbiUNMAaVVTTsnawbWKF/v6cSa1QZ/F79jurQsIwfBquIc/fjZh6a+HVvGCsCZA8Sa65rZyyOf/CzxDpDnKtVKZCKU+fA42dOqhdGS0fiLNjM8SkuKqXLrBfqcJhp4GWH1X7amfYUtjYZiBlMtA5cy4ujl/o1HELI3qqj8K81GLAoY4PotxV3RRdWI1MF2qUpiwApNRYttzO7J8m7hijEbxZvfio6VrCoBWRTT7357pts0LxZvNqE2znVs5EWhHqeaHYpg/WQiRLeaW506j2/WG2zg8chqh6tjFuviU//+OPHz9Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkNEZMkNktuwME0IeosWw1LJw62u3f5tYAJgRjY8u28=;
 b=CiBMMO6L7Xkueyy9RDdq/OEISCl3OTIQOPu0bpz1ZQiSvEWb06yMJckQGkwiFXGuXiF0qzUoQDnaoae7vIHNTlwHA4PEoZdrescx6onVm7HuSPiobc5xspwP4uIKG4eNTcUikYh34YGRpTnNVjgZFRaXbwKBgRlbI5KUOwjoUbgXlaPG0aUQP74b/tQEEzRUaXo4HdeRpBXwyj2iEc+oO0TRHIXQ1euE4p+1kZ4qiiwBzX9OGUIY0XPisKvg1ctkHXZTHhv6TfkvzumPERr9AU+rvH40kVvpFAnyejrnUcponZCQ6orfoEAMhksYpKwJagY8EfvnO7yGJYYzEfL5eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR1201CA0024.namprd12.prod.outlook.com
 (2603:10b6:301:4a::34) by DM6PR12MB3514.namprd12.prod.outlook.com
 (2603:10b6:5:18a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.14; Wed, 31 Jul
 2019 03:40:13 +0000
Received: from CO1NAM03FT063.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::204) by MWHPR1201CA0024.outlook.office365.com
 (2603:10b6:301:4a::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2136.13 via Frontend
 Transport; Wed, 31 Jul 2019 03:40:12 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT063.mail.protection.outlook.com (10.152.81.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2115.10 via Frontend Transport; Wed, 31 Jul 2019 03:40:12 +0000
Received: from equan-buildpc.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Jul 2019
 22:40:11 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amd/powerplay: support power profile retrieval and
 setting on arcturus
Date: Wed, 31 Jul 2019 11:39:58 +0800
Message-ID: <20190731033959.10414-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(136003)(39860400002)(346002)(2980300002)(428003)(199004)(189003)(7696005)(44832011)(51416003)(476003)(126002)(2870700001)(478600001)(2351001)(2616005)(336012)(426003)(8676002)(70206006)(81156014)(8936002)(5660300002)(305945005)(81166006)(6916009)(186003)(86362001)(1076003)(486006)(68736007)(48376002)(356004)(6666004)(26005)(4326008)(53936002)(50226002)(316002)(70586007)(14444005)(36756003)(53416004)(47776003)(50466002)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3514; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 001cab29-ebdd-48ef-aad1-08d71568cb3d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM6PR12MB3514; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB3514:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3514DA29F64FB35FFE0CCD30E4DF0@DM6PR12MB3514.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1060;
X-Forefront-PRVS: 011579F31F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: oG5b5Bh2+qRgIMsGeM2NVMM0ej1fh0CXo5ItEplYQoOyi2XD0GxTbDIMAV5UjaqDd5kdHH0DOyiLSh4LfkOAaeH9lpi2mX/oYhY783qGtkg6aJZnPaAN1gM/Q3F173AyjnaGHtJ9q9w373WjGAJUqbWVttwivlS4iKv8BRqoFMTI9eHmkYgzUBjJszC2ibpeK9VydhqqXO/AuejHUlY9eOLTQj2I0qJhiT4RaIBH0b+w4LZdZn95OaT4aA0a6VxcTp5rB6gCiFO6xmHHNLwDK6eiMBqG54hz/h8U0KqrXJtrFBxhCDw+84/eTnB4/PedPtVWoVtFn7Nzl0zVcXIT09g9uBofTJAzdcHvUsjgg6ukIBIPiejMCgrdtKjtXKmGBbuX6sJKh4uYOzcwQX294857qkkchLlhOvArIZwrhv8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2019 03:40:12.4731 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 001cab29-ebdd-48ef-aad1-08d71568cb3d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3514
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkNEZMkNktuwME0IeosWw1LJw62u3f5tYAJgRjY8u28=;
 b=rz8ACSX+l2ZCy/TSZj7z/e7yqCsSW1QNGr9JrIDFooLZ4xL6Bw8GvihT9taK8su2r5W8XDKlzIRK/CTZRilk1OWIeVxiKA+b9yDlrwEwhqIG13lUFIkXXAjJ23xaFRWFPdIRhKyQHAJIeEMJUrM9oX7QgLU2nUOYzX38K0dtF/4=
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

RW5hYmxlIGFyY3R1cnVzIHBvd2VyIHByb2ZpbGUgcmV0cmlldmFsIGFuZCBzZXR0aW5nLgoKQ2hh
bmdlLUlkOiBJODU0NDdiYTljYTdkZThlMTk3ODQwZjc2Y2UzNzQ1MzYzYzQxMzNhNgpTaWduZWQt
b2ZmLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jIHwgNjkgKysrKysrKysrKysrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCA2OSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYwppbmRleCBjM2Y5NDg3Mjc2YzAuLjQ3ZDAxNTAzNTkw
NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMKQEAg
LTE1MDMsNiArMTUwMyw3MyBAQCBzdGF0aWMgaW50IGFyY3R1cnVzX2dldF9wb3dlcl9saW1pdChz
dHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIGludCBhcmN0
dXJ1c19nZXRfcG93ZXJfcHJvZmlsZV9tb2RlKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAorCQkJ
CQkgICBjaGFyICpidWYpCit7CisJc3RhdGljIGNvbnN0IGNoYXIgKnByb2ZpbGVfbmFtZVtdID0g
eworCQkJCQkiQk9PVFVQX0RFRkFVTFQiLAorCQkJCQkiM0RfRlVMTF9TQ1JFRU4iLAorCQkJCQki
UE9XRVJfU0FWSU5HIiwKKwkJCQkJIlZJREVPIiwKKwkJCQkJIlZSIiwKKwkJCQkJIkNPTVBVVEUi
LAorCQkJCQkiQ1VTVE9NIn07CisJdWludDMyX3QgaSwgc2l6ZSA9IDA7CisJaW50MTZfdCB3b3Jr
bG9hZF90eXBlID0gMDsKKworCWlmICghc211LT5wbV9lbmFibGVkIHx8ICFidWYpCisJCXJldHVy
biAtRUlOVkFMOworCisJZm9yIChpID0gMDsgaSA8PSBQUF9TTUNfUE9XRVJfUFJPRklMRV9DVVNU
T007IGkrKykgeworCQkvKgorCQkgKiBDb252IFBQX1NNQ19QT1dFUl9QUk9GSUxFKiB0byBXT1JL
TE9BRF9QUExJQl8qX0JJVAorCQkgKiBOb3QgYWxsIHByb2ZpbGUgbW9kZXMgYXJlIHN1cHBvcnRl
ZCBvbiBhcmN0dXJ1cy4KKwkJICovCisJCXdvcmtsb2FkX3R5cGUgPSBzbXVfd29ya2xvYWRfZ2V0
X3R5cGUoc211LCBpKTsKKwkJaWYgKHdvcmtsb2FkX3R5cGUgPCAwKQorCQkJY29udGludWU7CisK
KwkJc2l6ZSArPSBzcHJpbnRmKGJ1ZiArIHNpemUsICIlMmQgJTE0cyVzXG4iLAorCQkJaSwgcHJv
ZmlsZV9uYW1lW2ldLCAoaSA9PSBzbXUtPnBvd2VyX3Byb2ZpbGVfbW9kZSkgPyAiKiIgOiAiICIp
OworCX0KKworCXJldHVybiBzaXplOworfQorCitzdGF0aWMgaW50IGFyY3R1cnVzX3NldF9wb3dl
cl9wcm9maWxlX21vZGUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCisJCQkJCSAgIGxvbmcgKmlu
cHV0LAorCQkJCQkgICB1aW50MzJfdCBzaXplKQoreworCWludCB3b3JrbG9hZF90eXBlID0gMDsK
Kwl1aW50MzJfdCBwcm9maWxlX21vZGUgPSBpbnB1dFtzaXplXTsKKworCWlmICghc211LT5wbV9l
bmFibGVkKQorCQlyZXR1cm4gLUVJTlZBTDsKKworCWlmIChwcm9maWxlX21vZGUgPiBQUF9TTUNf
UE9XRVJfUFJPRklMRV9DVVNUT00pIHsKKwkJcHJfZXJyKCJJbnZhbGlkIHBvd2VyIHByb2ZpbGUg
bW9kZSAlZFxuIiwgcHJvZmlsZV9tb2RlKTsKKwkJcmV0dXJuIC1FSU5WQUw7CisJfQorCisJLyoK
KwkgKiBDb252IFBQX1NNQ19QT1dFUl9QUk9GSUxFKiB0byBXT1JLTE9BRF9QUExJQl8qX0JJVAor
CSAqIE5vdCBhbGwgcHJvZmlsZSBtb2RlcyBhcmUgc3VwcG9ydGVkIG9uIGFyY3R1cnVzLgorCSAq
LworCXdvcmtsb2FkX3R5cGUgPSBzbXVfd29ya2xvYWRfZ2V0X3R5cGUoc211LCBwcm9maWxlX21v
ZGUpOworCWlmICh3b3JrbG9hZF90eXBlIDwgMCkgeworCQlwcl9lcnIoIlVuc3VwcG9ydGVkIHBv
d2VyIHByb2ZpbGUgbW9kZSAlZCBvbiBhcmN0dXJ1c1xuIiwgcHJvZmlsZV9tb2RlKTsKKwkJcmV0
dXJuIC1FSU5WQUw7CisJfQorCisJc211X3NlbmRfc21jX21zZ193aXRoX3BhcmFtKHNtdSwKKwkJ
CQkgICAgU01VX01TR19TZXRXb3JrbG9hZE1hc2ssCisJCQkJICAgIDEgPDwgd29ya2xvYWRfdHlw
ZSk7CisKKwlzbXUtPnBvd2VyX3Byb2ZpbGVfbW9kZSA9IHByb2ZpbGVfbW9kZTsKKworCXJldHVy
biAwOworfQorCiBzdGF0aWMgdm9pZCBhcmN0dXJ1c19kdW1wX3BwdGFibGUoc3RydWN0IHNtdV9j
b250ZXh0ICpzbXUpCiB7CiAJc3RydWN0IHNtdV90YWJsZV9jb250ZXh0ICp0YWJsZV9jb250ZXh0
ID0gJnNtdS0+c211X3RhYmxlOwpAQCAtMTk2OCw2ICsyMDM1LDggQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBwcHRhYmxlX2Z1bmNzIGFyY3R1cnVzX3BwdF9mdW5jcyA9IHsKIAkuZm9yY2VfZHBtX2xp
bWl0X3ZhbHVlID0gYXJjdHVydXNfZm9yY2VfZHBtX2xpbWl0X3ZhbHVlLAogCS51bmZvcmNlX2Rw
bV9sZXZlbHMgPSBhcmN0dXJ1c191bmZvcmNlX2RwbV9sZXZlbHMsCiAJLmdldF9wcm9maWxpbmdf
Y2xrX21hc2sgPSBhcmN0dXJ1c19nZXRfcHJvZmlsaW5nX2Nsa19tYXNrLAorCS5nZXRfcG93ZXJf
cHJvZmlsZV9tb2RlID0gYXJjdHVydXNfZ2V0X3Bvd2VyX3Byb2ZpbGVfbW9kZSwKKwkuc2V0X3Bv
d2VyX3Byb2ZpbGVfbW9kZSA9IGFyY3R1cnVzX3NldF9wb3dlcl9wcm9maWxlX21vZGUsCiAJLyog
ZGVidWcgKGludGVybmFsIHVzZWQpICovCiAJLmR1bXBfcHB0YWJsZSA9IGFyY3R1cnVzX2R1bXBf
cHB0YWJsZSwKIAkuZ2V0X3Bvd2VyX2xpbWl0ID0gYXJjdHVydXNfZ2V0X3Bvd2VyX2xpbWl0LAot
LSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
