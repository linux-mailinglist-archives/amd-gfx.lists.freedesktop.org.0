Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 703B5750F8
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 16:25:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058C46E65A;
	Thu, 25 Jul 2019 14:25:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740053.outbound.protection.outlook.com [40.107.74.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 081C56E65A
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 14:25:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b6q5OBulp680/DzyqAMRN/YYjw5xwlnvZgZFSacH8QNFBPlK2BReAocmdxyJABETmg3dLAduIguxPkcJnLETbuIldX4F8BTrKdx7UbyXHPr04p5f2ExXnRd5B5uSmvqjireEoBoL4dVeUOFJem+uh5gSARc83INsgWmVSd3yzDOcDkyv5pc7EHjdIvu9OuPCh0iDD0PvgP7bTGfN+hDiD8oeCNycwHHiDLyooykIqtZ4nVyGzL2JSU5g1/aUC+yBUBjw6SszVEW5kUZras9uP77nTqpGPp3Hp7tYKJRAkAkwiIlOTRdpxdPDW5Qb406WnC1LQJebP+NOigrUnT5VNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uowmIZZidAyli3k+fOH8CWtp5yD1s/JLDnrw/p7mPdg=;
 b=cp//c/rXvo6CMN2faBRQ9f6nOpCxOaCbTz2l6obLFGgdXEleZvZuvojObcV4MsB8h0h7LELu3Ve3h2cO+VE2RxFnOIwXQsDdG3XbgDTkjINEBmkFqzeVNpdsNLpAtDWGqJ7K5+KArIfL0F2zZhHDQ6qub7PoV9S6ABKXECGFzig58+qeUs5zjAa9PJgJW8iE1G2giRk2iLAkkRGELELoYLWC3jQmwJPAbDuyv6PvCtuS0PFW+BNNVMnINj6PG3UyREsSoQFW77tDFB1voM+AaruQu7qPcjm8vqWNNh0hJuFYKlUtEtzujv0GvC3dY9EycKrW36Cnnwp7iUtqLp6xlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=daenzer.net
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM6PR12CA0026.namprd12.prod.outlook.com (2603:10b6:5:1c0::39)
 by DM5PR1201MB2491.namprd12.prod.outlook.com (2603:10b6:3:eb::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16; Thu, 25 Jul
 2019 14:25:10 +0000
Received: from CO1NAM03FT021.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by DM6PR12CA0026.outlook.office365.com
 (2603:10b6:5:1c0::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16 via Frontend
 Transport; Thu, 25 Jul 2019 14:25:10 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT021.mail.protection.outlook.com (10.152.80.180) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2115.10 via Frontend Transport; Thu, 25 Jul 2019 14:25:09 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Thu, 25 Jul 2019 09:25:08 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v5 2/4] drm/amdgpu: Create helper to clear
 AMDGPU_GEM_CREATE_CPU_GTT_USWC
Date: Thu, 25 Jul 2019 10:24:41 -0400
Message-ID: <1564064683-31796-3-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564064683-31796-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1564064683-31796-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(39860400002)(2980300002)(428003)(189003)(199004)(26005)(316002)(81156014)(76176011)(426003)(446003)(486006)(51416003)(305945005)(966005)(7696005)(16586007)(478600001)(50466002)(44832011)(2351001)(54906003)(11346002)(14444005)(68736007)(6916009)(186003)(8676002)(2616005)(8936002)(50226002)(5660300002)(4326008)(476003)(336012)(53416004)(6666004)(356004)(53936002)(2906002)(47776003)(70586007)(81166006)(36756003)(86362001)(6306002)(126002)(70206006)(48376002)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB2491; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17b87be0-f54f-465d-f2dc-08d7110be60c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR1201MB2491; 
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2491:
X-MS-Exchange-PUrlCount: 2
X-Microsoft-Antispam-PRVS: <DM5PR1201MB2491C797F52C0B4B665E27BBEAC10@DM5PR1201MB2491.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0109D382B0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: myKuIYR31dys3uV1s2xwPdez8vkr1mVunkgmNZv57p3pCZA3JMquGZrJPJo0fOzYYHn4/4MrsFbqVCc5gfPD0TcjijVE7HeoOT7cLwbBVMv4VAVxuK4nyHdO8Esvki6jVU8B/AeNQKof9w3R887LfO5LiMCQVGBWiYVVEaToX323ulen5bGD2kfXCjkERqCgpCCpLPTAuFK/MI1yrpSq52repH0vHoHnLwRFtsA2NTvg/YgBv5FV7y754dT5/HL+hUgYHC5Ju9pSgKx0DCFKSj8ickudrz6jG8WSnzsGoe6lXWuLs5OnnGu/VkkNqlNb8h2HOButhMwWqUQ78PfiJk8i9W+mI7oBSv3tLtIKRczinPXewSLxM79aZ6KLfjdAkeAubQpBKFs3VZoe+ZSucutt1r8Edv1Q75ud1eQ5xtM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2019 14:25:09.6133 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17b87be0-f54f-465d-f2dc-08d7110be60c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2491
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uowmIZZidAyli3k+fOH8CWtp5yD1s/JLDnrw/p7mPdg=;
 b=t1frntiyFhIj0K+j6x5zN9zvfoLyygcrkHj/hZ1S/IvMnyMiqCi642FBh/ZUEdq3D4eBSeHcnTeKCMaXzBOGKPLEZ3AjblxnHqkidLG95c0U1wGHdQrQltmL5gKssQjn6/eEkjNQSTB204bkj2P8pSMe2nQe+BzpTKGYnkn4pVE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; daenzer.net; dkim=none (message not signed)
 header.d=none;daenzer.net; dmarc=permerror action=none header.from=amd.com;
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
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>, michel@daenzer.net,
 shirish.s@amd.com, hersenxs.wu@amd.com, Alexander.Deucher@amd.com,
 Christian.Koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

TW92ZSB0aGUgbG9naWMgdG8gY2xlYXIgQU1ER1BVX0dFTV9DUkVBVEVfQ1BVX0dUVF9VU1dDIGlu
CmFtZGdwdV9ib19kb19jcmVhdGUgaW50byBzdGFuZGFsb25lIGhlbHBlciBzbyBpdCBjYW4gYmUg
cmV1c2VkCmluIG90aGVyIGZ1bmN0aW9ucy4KCnY0OgpTd2l0Y2ggdG8gcmV0dXJuIGJvb2wuCgp2
NTogRml4IHR5cG9zLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5n
cm9kem92c2t5QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X29iamVjdC5jIHwgNjEgKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmggfCAgMiArCiAyIGZpbGVzIGNoYW5nZWQs
IDM3IGluc2VydGlvbnMoKyksIDI2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9vYmplY3QuYwppbmRleCA5ODliN2I1Li44NzAyMDYyIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jCkBAIC00MTMsNiArNDEzLDQwIEBA
IHN0YXRpYyBib29sIGFtZGdwdV9ib192YWxpZGF0ZV9zaXplKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2LAogCXJldHVybiBmYWxzZTsKIH0KIAorYm9vbCBhbWRncHVfYm9fc3VwcG9ydF91c3dj
KHU2NCBib19mbGFncykKK3sKKworI2lmZGVmIENPTkZJR19YODZfMzIKKwkvKiBYWFg6IFdyaXRl
LWNvbWJpbmVkIENQVSBtYXBwaW5ncyBvZiBHVFQgc2VlbSBicm9rZW4gb24gMzItYml0CisJICog
U2VlIGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTg0NjI3CisJ
ICovCisJcmV0dXJuIGZhbHNlOworI2VsaWYgZGVmaW5lZChDT05GSUdfWDg2KSAmJiAhZGVmaW5l
ZChDT05GSUdfWDg2X1BBVCkKKwkvKiBEb24ndCB0cnkgdG8gZW5hYmxlIHdyaXRlLWNvbWJpbmlu
ZyB3aGVuIGl0IGNhbid0IHdvcmssIG9yIHRoaW5ncworCSAqIG1heSBiZSBzbG93CisJICogU2Vl
IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTg4NzU4CisJICov
CisKKyNpZm5kZWYgQ09ORklHX0NPTVBJTEVfVEVTVAorI3dhcm5pbmcgUGxlYXNlIGVuYWJsZSBD
T05GSUdfTVRSUiBhbmQgQ09ORklHX1g4Nl9QQVQgZm9yIGJldHRlciBwZXJmb3JtYW5jZSBcCisJ
IHRoYW5rcyB0byB3cml0ZS1jb21iaW5pbmcKKyNlbmRpZgorCisJaWYgKGJvX2ZsYWdzICYgQU1E
R1BVX0dFTV9DUkVBVEVfQ1BVX0dUVF9VU1dDKQorCQlEUk1fSU5GT19PTkNFKCJQbGVhc2UgZW5h
YmxlIENPTkZJR19NVFJSIGFuZCBDT05GSUdfWDg2X1BBVCBmb3IgIgorCQkJICAgICAgImJldHRl
ciBwZXJmb3JtYW5jZSB0aGFua3MgdG8gd3JpdGUtY29tYmluaW5nXG4iKTsKKwlyZXR1cm4gZmFs
c2U7CisjZWxzZQorCS8qIEZvciBhcmNoaXRlY3R1cmVzIHRoYXQgZG9uJ3Qgc3VwcG9ydCBXQyBt
ZW1vcnksCisJICogbWFzayBvdXQgdGhlIFdDIGZsYWcgZnJvbSB0aGUgQk8KKwkgKi8KKwlpZiAo
IWRybV9hcmNoX2Nhbl93Y19tZW1vcnkoKSkKKwkJcmV0dXJuIGZhbHNlOworCisJcmV0dXJuIHRy
dWU7CisjZW5kaWYKK30KKwogc3RhdGljIGludCBhbWRncHVfYm9fZG9fY3JlYXRlKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2LAogCQkJICAgICAgIHN0cnVjdCBhbWRncHVfYm9fcGFyYW0gKmJw
LAogCQkJICAgICAgIHN0cnVjdCBhbWRncHVfYm8gKipib19wdHIpCkBAIC00NjYsMzMgKzUwMCw4
IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2JvX2RvX2NyZWF0ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiwKIAogCWJvLT5mbGFncyA9IGJwLT5mbGFnczsKIAotI2lmZGVmIENPTkZJR19YODZfMzIK
LQkvKiBYWFg6IFdyaXRlLWNvbWJpbmVkIENQVSBtYXBwaW5ncyBvZiBHVFQgc2VlbSBicm9rZW4g
b24gMzItYml0Ci0JICogU2VlIGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcu
Y2dpP2lkPTg0NjI3Ci0JICovCi0JYm8tPmZsYWdzICY9IH5BTURHUFVfR0VNX0NSRUFURV9DUFVf
R1RUX1VTV0M7Ci0jZWxpZiBkZWZpbmVkKENPTkZJR19YODYpICYmICFkZWZpbmVkKENPTkZJR19Y
ODZfUEFUKQotCS8qIERvbid0IHRyeSB0byBlbmFibGUgd3JpdGUtY29tYmluaW5nIHdoZW4gaXQg
Y2FuJ3Qgd29yaywgb3IgdGhpbmdzCi0JICogbWF5IGJlIHNsb3cKLQkgKiBTZWUgaHR0cHM6Ly9i
dWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9ODg3NTgKLQkgKi8KLQotI2lmbmRl
ZiBDT05GSUdfQ09NUElMRV9URVNUCi0jd2FybmluZyBQbGVhc2UgZW5hYmxlIENPTkZJR19NVFJS
IGFuZCBDT05GSUdfWDg2X1BBVCBmb3IgYmV0dGVyIHBlcmZvcm1hbmNlIFwKLQkgdGhhbmtzIHRv
IHdyaXRlLWNvbWJpbmluZwotI2VuZGlmCi0KLQlpZiAoYm8tPmZsYWdzICYgQU1ER1BVX0dFTV9D
UkVBVEVfQ1BVX0dUVF9VU1dDKQotCQlEUk1fSU5GT19PTkNFKCJQbGVhc2UgZW5hYmxlIENPTkZJ
R19NVFJSIGFuZCBDT05GSUdfWDg2X1BBVCBmb3IgIgotCQkJICAgICAgImJldHRlciBwZXJmb3Jt
YW5jZSB0aGFua3MgdG8gd3JpdGUtY29tYmluaW5nXG4iKTsKLQliby0+ZmxhZ3MgJj0gfkFNREdQ
VV9HRU1fQ1JFQVRFX0NQVV9HVFRfVVNXQzsKLSNlbHNlCi0JLyogRm9yIGFyY2hpdGVjdHVyZXMg
dGhhdCBkb24ndCBzdXBwb3J0IFdDIG1lbW9yeSwKLQkgKiBtYXNrIG91dCB0aGUgV0MgZmxhZyBm
cm9tIHRoZSBCTwotCSAqLwotCWlmICghZHJtX2FyY2hfY2FuX3djX21lbW9yeSgpKQorCWlmICgh
YW1kZ3B1X2JvX3N1cHBvcnRfdXN3Yyhiby0+ZmxhZ3MpKQogCQliby0+ZmxhZ3MgJj0gfkFNREdQ
VV9HRU1fQ1JFQVRFX0NQVV9HVFRfVVNXQzsKLSNlbmRpZgogCiAJYm8tPnRiby5iZGV2ID0gJmFk
ZXYtPm1tYW4uYmRldjsKIAlpZiAoYnAtPmRvbWFpbiAmIChBTURHUFVfR0VNX0RPTUFJTl9HV1Mg
fCBBTURHUFVfR0VNX0RPTUFJTl9PQSB8CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfb2JqZWN0LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfb2JqZWN0LmgKaW5kZXggZDYwNTkzYy4uZGM0NGNmMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuaApAQCAtMzA4LDUgKzMwOCw3IEBAIHZvaWQgYW1kZ3B1
X3NhX2JvX2R1bXBfZGVidWdfaW5mbyhzdHJ1Y3QgYW1kZ3B1X3NhX21hbmFnZXIgKnNhX21hbmFn
ZXIsCiAJCQkJCSBzdHJ1Y3Qgc2VxX2ZpbGUgKm0pOwogI2VuZGlmCiAKK2Jvb2wgYW1kZ3B1X2Jv
X3N1cHBvcnRfdXN3Yyh1NjQgYm9fZmxhZ3MpOworCiAKICNlbmRpZgotLSAKMi43LjQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
