Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEDBA0FC7
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 05:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACCCF89F08;
	Thu, 29 Aug 2019 03:05:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770057.outbound.protection.outlook.com [40.107.77.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD5189F08
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 03:05:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BOkWootXOAhDFsTg/jTnwc4MA6DvnIqCVfKKqe2gWRdGJ7cMzCMoouQh/Q4AvLo2AH4gBt/dQMdX+ELXVeNyRbP2vUWTKwMqKJA3W4zg1CXycrUYIDM1W4dMg5qsDEnS1hmVfaT91eWGpgZ+b+630k/GS6toiaZIHsgO+9Yc/1mqYO5Jmw5gQCVGECMuD9+VMhQt5kqQ6RnXCbHtA+XFDj9hHkyoj27HD+W00p72TidDlOPKml8ibBT/7R7JLjcv+352jEkGYJp4lZbq+YVeTfHee/gCnqaYCMR4LztyFIa2e8xONk/7SnufL+4JWbPNcYpSnvk86DD4eHIm6SdDKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qD1OUz9knmR2lTbBOrWfr9UBIwfGCqGoZesJmtP9w9w=;
 b=gBqUyZgC8/gbpWav1C2X6jgLnAtkIp9EOC6+QcHJEBTlcE1IoZL/nKDv4a3do10jB1cyRvNMApLren62HaImh1XYvzyy6ymRvmzFlwQ2RJGcCzo/jw8sQOHK3xeakS/dsfWf9hprSqfu3hSIcBnOOW1qimRUPmmi4ZDqBigyAAG48Jn1pevK9HSonqj54bGMLYnap2ZStxRzpsQmazRJZI7/nsy6PJZe1GFvASWgSX5eoLiTyQgWGfvlcbGWzxfNnSKph+5XnrEgVMFM0XExwpjvx9M9+SUv0/ieVpgQ9MNlS5lICUNTCugNa7DrZvx1nZDXAqCbyrmkzIqeogP3dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from SN1PR12CA0045.namprd12.prod.outlook.com (2603:10b6:802:20::16)
 by DM5PR12MB1530.namprd12.prod.outlook.com (2603:10b6:4:4::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Thu, 29 Aug 2019 03:05:37 +0000
Received: from BY2NAM03FT011.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by SN1PR12CA0045.outlook.office365.com
 (2603:10b6:802:20::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.18 via Frontend
 Transport; Thu, 29 Aug 2019 03:05:37 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT011.mail.protection.outlook.com (10.152.84.233) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Thu, 29 Aug 2019 03:05:36 +0000
Received: from rico-code.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 28 Aug 2019
 22:05:35 -0500
From: Tianci Yin <tianci.yin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amdgpu/psp: keep TMR in visible vram region for SRIOV
Date: Thu, 29 Aug 2019 11:05:29 +0800
Message-ID: <1567047930-11912-1-git-send-email-tianci.yin@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(39860400002)(136003)(2980300002)(428003)(189003)(199004)(50466002)(36756003)(70586007)(70206006)(316002)(6916009)(47776003)(356004)(2351001)(6666004)(53416004)(48376002)(16586007)(4326008)(476003)(8676002)(81166006)(81156014)(14444005)(486006)(2616005)(336012)(126002)(426003)(305945005)(44832011)(86362001)(8936002)(54906003)(50226002)(51416003)(478600001)(53936002)(186003)(26005)(7696005)(5660300002)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1530; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 565bc3cf-50de-4262-cd9f-08d72c2dc418
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM5PR12MB1530; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1530:
X-Microsoft-Antispam-PRVS: <DM5PR12MB15308CFA8221905879ED2B4495A20@DM5PR12MB1530.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-Forefront-PRVS: 0144B30E41
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: YJTE2xYWm/38Lr6CWqcWYTXT2vZQ+ApxhN8YybhLOT2Rih2kafSIPhVyQkKjsg+CyleFQ87LwsgjFG0IaQfvqUMhuYfetr0RHS+owFXaPUPe8MaiQoKlHvCjgv4X7s897z71xffFEs0GXao72rIiXNuXXxrJ+k2hOzmlY8TuZwUjYNmJ6ADpVnEyWIDTzt4m995KFDvP+rzkcLFvYD+CswO1gmeOTT1q7YJ0HVNcjYSkBceerhrVdzfY0sciTWp9MV473xdlRaAGNeowa0GaXPu3A6VzLt/Spn/4X3rtT6UudiO2B88zxiSJIG/EwtddZjYgtQ09zWfjFisFyEU7cimuLoZKBCGgm/It1hoTHWZfOcXDqRHdvLb5EmRdnLBGC2gKg6mqP6T6LCyY6+mL8e7IMa6+HPeObKRlFrK6VDM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2019 03:05:36.9773 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 565bc3cf-50de-4262-cd9f-08d72c2dc418
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1530
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qD1OUz9knmR2lTbBOrWfr9UBIwfGCqGoZesJmtP9w9w=;
 b=r9CciBr+663u5EmnrFxYJdssqNuQMmYmzi9lZ0aSCD1Op7h4YE3wDFPh/kbu9Ss/DYJR5tOeQjNBjIA+2/tpY8VXXSuWZXrml8OXkxy4+l3nt3CR+J022o/t9bGkKZLO+qJRW1v8rfetmwlMKAK4yqoOsF+FMBVirQpYPAbLCtk=
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
Cc: Feifei Xu <Feifei.Xu@amd.com>, "Le
 . Ma" <Le.Ma@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Tianci Yin <tianci.yin@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogIlRpYW5jaS5ZaW4iIDx0aWFuY2kueWluQGFtZC5jb20+CgpGaXggY29tcHV0ZSByaW5n
IHRlc3QgZmFpbHVyZSBpbiBzcmlvdiBzY2VuYXJpby4KCkNoYW5nZS1JZDogSTE0MWQzZDA5NGUy
Y2JhOWJjZjJmNmM5NmY0ZDhjNGVmNDNjNDIxYzMKU2lnbmVkLW9mZi1ieTogVGlhbmNpLllpbiA8
dGlhbmNpLnlpbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9wc3AuYyB8IDggKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3BzcC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jCmluZGV4
IDlmN2NjNWIuLmQxMWNlODYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9wc3AuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNw
LmMKQEAgLTIzOSw2ICsyMzksOCBAQCBzdGF0aWMgaW50IHBzcF90bXJfaW5pdChzdHJ1Y3QgcHNw
X2NvbnRleHQgKnBzcCkKIHsKIAlpbnQgcmV0OwogCWludCB0bXJfc2l6ZTsKKwl2b2lkICp0bXJf
YnVmOworCXZvaWQgKipwcHRyID0gYW1kZ3B1X3NyaW92X3ZmKHBzcC0+YWRldikgPyAmdG1yX2J1
ZiA6IE5VTEw7CiAKIAkvKgogCSAqIEFjY29yZGluZyB0byBIVyBlbmdpbmVlciwgdGhleSBwcmVm
ZXIgdGhlIFRNUiBhZGRyZXNzIGJlICJuYXR1cmFsbHkKQEAgLTI2Myw3ICsyNjUsNyBAQCBzdGF0
aWMgaW50IHBzcF90bXJfaW5pdChzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCkKIAogCXJldCA9IGFt
ZGdwdV9ib19jcmVhdGVfa2VybmVsKHBzcC0+YWRldiwgdG1yX3NpemUsIFBTUF9UTVJfU0laRSwK
IAkJCQkgICAgICBBTURHUFVfR0VNX0RPTUFJTl9WUkFNLAotCQkJCSAgICAgICZwc3AtPnRtcl9i
bywgJnBzcC0+dG1yX21jX2FkZHIsIE5VTEwpOworCQkJCSAgICAgICZwc3AtPnRtcl9ibywgJnBz
cC0+dG1yX21jX2FkZHIsIHBwdHIpOwogCiAJcmV0dXJuIHJldDsKIH0KQEAgLTEyMDYsNiArMTIw
OCw4IEBAIHN0YXRpYyBpbnQgcHNwX2h3X2Zpbmkodm9pZCAqaGFuZGxlKQogewogCXN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNlICopaGFuZGxlOwogCXN0
cnVjdCBwc3BfY29udGV4dCAqcHNwID0gJmFkZXYtPnBzcDsKKwl2b2lkICp0bXJfYnVmOworCXZv
aWQgKipwcHRyID0gYW1kZ3B1X3NyaW92X3ZmKHBzcC0+YWRldikgPyAmdG1yX2J1ZiA6IE5VTEw7
CiAKIAlpZiAoYWRldi0+Z21jLnhnbWkubnVtX3BoeXNpY2FsX25vZGVzID4gMSAmJgogCSAgICBw
c3AtPnhnbWlfY29udGV4dC5pbml0aWFsaXplZCA9PSAxKQpAQCAtMTIxNiw3ICsxMjIwLDcgQEAg
c3RhdGljIGludCBwc3BfaHdfZmluaSh2b2lkICpoYW5kbGUpCiAKIAlwc3BfcmluZ19kZXN0cm95
KHBzcCwgUFNQX1JJTkdfVFlQRV9fS00pOwogCi0JYW1kZ3B1X2JvX2ZyZWVfa2VybmVsKCZwc3At
PnRtcl9ibywgJnBzcC0+dG1yX21jX2FkZHIsIE5VTEwpOworCWFtZGdwdV9ib19mcmVlX2tlcm5l
bCgmcHNwLT50bXJfYm8sICZwc3AtPnRtcl9tY19hZGRyLCBwcHRyKTsKIAlhbWRncHVfYm9fZnJl
ZV9rZXJuZWwoJnBzcC0+ZndfcHJpX2JvLAogCQkJICAgICAgJnBzcC0+ZndfcHJpX21jX2FkZHIs
ICZwc3AtPmZ3X3ByaV9idWYpOwogCWFtZGdwdV9ib19mcmVlX2tlcm5lbCgmcHNwLT5mZW5jZV9i
dWZfYm8sCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
