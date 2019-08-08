Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAED85F6C
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Aug 2019 12:22:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9166E467;
	Thu,  8 Aug 2019 10:22:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810070.outbound.protection.outlook.com [40.107.81.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316396E467
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Aug 2019 10:22:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YkyHfAn9/VDf9C+saVha1rkiTyUOdvjsOQuvMKAJL1pm+tZOMyJvsIJq/VQCMB0v6xLBC3eWUvyqCQJmU/9Ou+xIBesrewMvBn0/19+S+1BegUjeN++HhG3SxZ6GAqjbNMSFyK/iJLvZEH6By+oGJWA8HkFRUBydBcZZc8S9x5tgSjXn4nfvoLJx9HTRzvU1J/hYTu2mIrXV4aL05b7awAEC3rtd0yZAmlZBcWqAD+AykyL3dUzMp/FwU48DBtXswpHxKG81y/tGvrQW2iu92XJCgnve0Wx7mknab+AqlpZqB3/mM2aV8nrc+EC3EACyYZ3z7vY/9lfKAh0f+CsyRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AC3+qzLh/ogI0USO5SmC9t67GqznJMbF3McdqbFt33o=;
 b=jufx+VwkSM8p4R8qXAiyJkddKBGTorAzZyT7mJ+rYrUGtE8Xjhr0G2xCJ3kcWQMwFNSz4YscA/zwLUDnp0F1i9VSgvvsAldXPAOB9FEI5ivcDsTz3+1wYayP1uHhfAV7xV2r4KTDOK5X15AzQ+KRfHZcyZohF0qYflXU/qzMgmXxE4zDaXFki0YiFBMUQZnP3Bt6K4dIQ34XCYdPXiJWH23mzISl0ID08VbH/MfTs57GUNlw/VxKh5ttlQpXLNzpPymP6Jes4OoSvu3XctKA8mTsiBuMU3oM94U7pMHkBNuUVVkdj5erdlgytmTODX2zPHPWson2QOzXl9hwC61V8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CY4PR1201CA0016.namprd12.prod.outlook.com
 (2603:10b6:910:16::26) by DM5PR12MB1276.namprd12.prod.outlook.com
 (2603:10b6:3:79::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.16; Thu, 8 Aug
 2019 10:22:00 +0000
Received: from CO1NAM03FT035.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::202) by CY4PR1201CA0016.outlook.office365.com
 (2603:10b6:910:16::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.15 via Frontend
 Transport; Thu, 8 Aug 2019 10:22:00 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT035.mail.protection.outlook.com (10.152.80.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Thu, 8 Aug 2019 10:21:59 +0000
Received: from localhost.localdomain (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 8 Aug 2019
 05:21:58 -0500
From: Le Ma <le.ma@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/9] drm/amdgpu: add gfx clock gating for Arcturus
Date: Thu, 8 Aug 2019 18:21:48 +0800
Message-ID: <1565259714-30357-1-git-send-email-le.ma@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(376002)(136003)(2980300002)(428003)(189003)(199004)(14444005)(26005)(478600001)(186003)(2906002)(336012)(53936002)(6916009)(4326008)(44832011)(126002)(486006)(2616005)(2351001)(49486002)(476003)(426003)(36756003)(48376002)(50466002)(16586007)(316002)(51416003)(305945005)(50226002)(81166006)(81156014)(8936002)(47776003)(8676002)(5660300002)(6666004)(356004)(70206006)(70586007)(4744005)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1276; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 606d2137-f930-4b31-186b-08d71bea3f8e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1276; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1276:
X-Microsoft-Antispam-PRVS: <DM5PR12MB12769BF04ACEFB9EC55AC781F6D70@DM5PR12MB1276.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-Forefront-PRVS: 012349AD1C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Kio1TwdLX38eFen9zlfFzaOSeyFoPcSBavqda+d7U0pJ3CpFog0K05/o0b7VP9FE+SPgCwQQlndUFbU5Xkd5GnMBaSw+zkxtVdY5v7/cg3LJxbMHeSSWPFQNRA3AOAM8Jo+Uhj9Wsv2HyIvnGyOwzCBbc8GoC9SB6+YjUfaJWBf0jOlOQz/qgq1SnqllYrM1v56c2XtfZ2dWSU4UhT4q8Y39pZQfXSID4BL+ib0Z8ZaIjD7Nm+PkGu/aL25fniVfc0tAQMKC0p37uErwfJbV/WnJ9BU1i2cWZo2DkACGiDYDjxsmvf1M7/nHVkLc8Ba8yc2OevGfW+qo6GUDyMelSEsDtWT9oh3BeWWiEPAqsYU4HvKFKbvBK27xYoF6z9cJnqc3qjTt2a/OuWngpq8epeDCogQAvWKv5se5bi4r8qk=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2019 10:21:59.6817 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 606d2137-f930-4b31-186b-08d71bea3f8e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1276
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AC3+qzLh/ogI0USO5SmC9t67GqznJMbF3McdqbFt33o=;
 b=WZ97a8hEQ9idp5Tp+C43YrCtBKBNYqWrtdc7z36bl3P45VUvljRYP+absm0uSojl/ViIOH1xHaXx0uMUfjio9P/x4GZt79EYUPV6RY8q9brBjUj9Jb16N8KdKOL3CNIxhl0+1RTACID6n7wUVFsGk+XquJT0MXzQsh8JlFjw/ko=
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
Cc: Le Ma <le.ma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWRkIEFSQ1RVUlVTIGNhc2UgaW4gZ2Z4IHNldCBjbG9ja2dhdGluZyBmdW5jdGlvbi4gTm8gM2Qg
Y2xvY2sgb24gQXJjdHVydXMuCgpDaGFuZ2UtSWQ6IEk5ODkzYTJhZmVhN2YwYjVkNDMzYmFhMTRm
NDhhZTU1YTM2NTE2ZmFjClNpZ25lZC1vZmYtYnk6IExlIE1hIDxsZS5tYUBhbWQuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgfCA0ICsrKysKIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nZnhfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAu
YwppbmRleCBmZGQ5MGMxLi5kZTNkZTFjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nZnhfdjlfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92
OV8wLmMKQEAgLTQyMTgsNiArNDIxOCw5IEBAIHN0YXRpYyB2b2lkIGdmeF92OV8wX3VwZGF0ZV8z
ZF9jbG9ja19nYXRpbmcoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiB7CiAJdWludDMyX3Qg
ZGF0YSwgZGVmOwogCisJaWYgKGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX0FSQ1RVUlVTKQorCQly
ZXR1cm47CisKIAlhbWRncHVfZ2Z4X3JsY19lbnRlcl9zYWZlX21vZGUoYWRldik7CiAKIAkvKiBF
bmFibGUgM0QgQ0dDRy9DR0xTICovCkBAIC00NDEwLDYgKzQ0MTMsNyBAQCBzdGF0aWMgaW50IGdm
eF92OV8wX3NldF9jbG9ja2dhdGluZ19zdGF0ZSh2b2lkICpoYW5kbGUsCiAJY2FzZSBDSElQX1ZF
R0ExMjoKIAljYXNlIENISVBfVkVHQTIwOgogCWNhc2UgQ0hJUF9SQVZFTjoKKwljYXNlIENISVBf
QVJDVFVSVVM6CiAJCWdmeF92OV8wX3VwZGF0ZV9nZnhfY2xvY2tfZ2F0aW5nKGFkZXYsCiAJCQkJ
CQkgc3RhdGUgPT0gQU1EX0NHX1NUQVRFX0dBVEUgPyB0cnVlIDogZmFsc2UpOwogCQlicmVhazsK
LS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
