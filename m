Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D770337F0A
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 22:55:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89CA689872;
	Thu,  6 Jun 2019 20:55:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720051.outbound.protection.outlook.com [40.107.72.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B2E8986D
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2019 20:55:19 +0000 (UTC)
Received: from CY4PR12CA0028.namprd12.prod.outlook.com (2603:10b6:903:129::14)
 by BN7PR12MB2659.namprd12.prod.outlook.com (2603:10b6:408:29::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.22; Thu, 6 Jun
 2019 20:55:18 +0000
Received: from DM3NAM03FT053.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::205) by CY4PR12CA0028.outlook.office365.com
 (2603:10b6:903:129::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1965.12 via Frontend
 Transport; Thu, 6 Jun 2019 20:55:18 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT053.mail.protection.outlook.com (10.152.83.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1965.12 via Frontend Transport; Thu, 6 Jun 2019 20:55:18 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 6 Jun 2019
 15:55:06 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 08/24] drm/amd/display: add audio related regs
Date: Thu, 6 Jun 2019 16:54:45 -0400
Message-ID: <20190606205501.16505-9-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
References: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(396003)(136003)(346002)(2980300002)(428003)(189003)(199004)(81166006)(426003)(81156014)(8676002)(53416004)(2616005)(7696005)(126002)(476003)(14444005)(186003)(486006)(4326008)(2906002)(72206003)(446003)(86362001)(11346002)(6666004)(316002)(478600001)(2351001)(16586007)(36756003)(70586007)(305945005)(53936002)(356004)(1076003)(68736007)(51416003)(77096007)(26005)(76176011)(5660300002)(8936002)(6916009)(70206006)(47776003)(50466002)(50226002)(48376002)(336012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2659; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc7c29c1-ab95-46b0-0635-08d6eac14861
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN7PR12MB2659; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2659:
X-Microsoft-Antispam-PRVS: <BN7PR12MB2659D8C6D8EC5D0F37666F47F9170@BN7PR12MB2659.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 00603B7EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: qxgqgDScNEWuaKuksSsqfG8ple7VUwOAFMcr1Fm6RH3Di49X1NGErX261lNVpTkygwE9er4MZhxxjk4cSOgiDsjUz3OSE+Aq24M5RdPUPgLChHPE23hkHPTVtO/xHuVIdoR8xxzqCEgZP9G7HgdZDA9gSu9YUJAvq2k2tLDMkialofOsvPou24pMp5Jk7q+oFLwZCtOQ2W0Yg7cZUAW5VUiXfetaMeZodwBkC2z2nbiLioVCNIwQPbXQoZTsQhZX7mlUJjMV52wBAmo7glOz0Lo+CqP8NK/y5yRHwhazg7lsK7UE8perx9VZbYKQZ8i4MW0eNlbJ6I4JQaU+/DEx+Io84FIta2oO+MAFEJvylvq2aYzmE01rwrfQRK+urXsthfVAXSIaFUpBLzExMgCVxz44tqcWpBV2EA6TbeouLPM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2019 20:55:18.1948 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc7c29c1-ab95-46b0-0635-08d6eac14861
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2659
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1eA9YFREMcmpUMtB5xyJk5a9Qc6vq9rS3CrbNGcFMI=;
 b=KEOr63Z8S0PL1hwd1/WQ/LCN/SuhMNkVTU7D/UtVcGjxaxopChxmY/4ZdJZcl4diFWPAnFLHFA//YRKOmJPRFm76Aq7tVuP3UfHKjaP1HAm2ZUv+1jEDpaqoVG7HqRkssLgDRUcm61ciR6XxYuBYGnCBsuvMcm4LDi86LMpmClg=
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
Cc: Charlene Liu <charlene.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ2hhcmxlbmUgTGl1IDxjaGFybGVuZS5saXVAYW1kLmNvbT4KClNpZ25lZC1vZmYtYnk6
IENoYXJsZW5lIExpdSA8Y2hhcmxlbmUubGl1QGFtZC5jb20+ClJldmlld2VkLWJ5OiBDaHJpcyBQ
YXJrIDxDaHJpcy5QYXJrQGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhh
d2FucHJlZXQuTGFraGFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNlL2RjZV9hdWRpby5jIHwgNCArLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNlL2RjZV9hdWRpby5oIHwgNyArKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNlL2RjZV9hdWRpby5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjZS9kY2VfYXVkaW8uYwppbmRleCA3ZjZkNzI0Njg2ZjEuLmQ0M2Q1ZDkyNGMxOSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfYXVkaW8uYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdWRpby5jCkBAIC0y
Miw3ICsyMiw3IEBACiAgKiBBdXRob3JzOiBBTUQKICAqCiAgKi8KLQorI2luY2x1ZGUgIi4uL2Rj
LmgiCiAjaW5jbHVkZSAicmVnX2hlbHBlci5oIgogI2luY2x1ZGUgImRjZV9hdWRpby5oIgogI2lu
Y2x1ZGUgImRjZS9kY2VfMTFfMF9kLmgiCkBAIC04NDEsOCArODQxLDYgQEAgdm9pZCBkY2VfYXVk
X3dhbGxfZHRvX3NldHVwKAogCQlSRUdfVVBEQVRFKERDQ0dfQVVESU9fRFRPX1NPVVJDRSwKIAkJ
CQlEQ0NHX0FVRElPX0RUT19TRUwsIDEpOwogCi0JCVJFR19VUERBVEUoRENDR19BVURJT19EVE9f
U09VUkNFLAotCQkJRENDR19BVURJT19EVE9fU0VMLCAxKTsKIAkJCS8qIERDQ0dfQVVESU9fRFRP
Ml9VU0VfNTEyRkJSX0RUTywgMSkKIAkJCSAqIFNlbGVjdCA1MTJmcyBmb3IgRFAgVE9ETzogd2Vi
IHJlZ2lzdGVyIGRlZmluaXRpb24KIAkJCSAqIGRvZXMgbm90IG1hdGNoIHJlZ2lzdGVyIGhlYWRl
ciBmaWxlCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2Rj
ZV9hdWRpby5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfYXVkaW8u
aAppbmRleCAwZGM1ZmYxMzdjN2EuLmEwZDU3MjRhYWIzMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfYXVkaW8uaAorKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdWRpby5oCkBAIC00OSw2ICs0OSw4IEBACiAJCVNG
KERDQ0dfQVVESU9fRFRPX1NPVVJDRSwgRENDR19BVURJT19EVE8wX1NPVVJDRV9TRUwsIG1hc2tf
c2gpLFwKIAkJU0YoRENDR19BVURJT19EVE9fU09VUkNFLCBEQ0NHX0FVRElPX0RUT19TRUwsIG1h
c2tfc2gpLFwKIAkJU0YoRENDR19BVURJT19EVE9fU09VUkNFLCBEQ0NHX0FVRElPX0RUTzJfVVNF
XzUxMkZCUl9EVE8sIG1hc2tfc2gpLFwKKwkJU0YoRENDR19BVURJT19EVE9fU09VUkNFLCBEQ0NH
X0FVRElPX0RUTzBfVVNFXzUxMkZCUl9EVE8sIG1hc2tfc2gpLFwKKwkJU0YoRENDR19BVURJT19E
VE9fU09VUkNFLCBEQ0NHX0FVRElPX0RUTzFfVVNFXzUxMkZCUl9EVE8sIG1hc2tfc2gpLFwKIAkJ
U0YoRENDR19BVURJT19EVE8wX01PRFVMRSwgRENDR19BVURJT19EVE8wX01PRFVMRSwgbWFza19z
aCksXAogCQlTRihEQ0NHX0FVRElPX0RUTzBfUEhBU0UsIERDQ0dfQVVESU9fRFRPMF9QSEFTRSwg
bWFza19zaCksXAogCQlTRihEQ0NHX0FVRElPX0RUTzFfTU9EVUxFLCBEQ0NHX0FVRElPX0RUTzFf
TU9EVUxFLCBtYXNrX3NoKSxcCkBAIC05NSw2ICs5Nyw4IEBAIHN0cnVjdCBkY2VfYXVkaW9fc2hp
ZnQgewogCXVpbnQ4X3QgRENDR19BVURJT19EVE8xX01PRFVMRTsKIAl1aW50OF90IERDQ0dfQVVE
SU9fRFRPMV9QSEFTRTsKIAl1aW50OF90IERDQ0dfQVVESU9fRFRPMl9VU0VfNTEyRkJSX0RUTzsK
Kwl1aW50MzJfdCBEQ0NHX0FVRElPX0RUTzBfVVNFXzUxMkZCUl9EVE87CisJdWludDMyX3QgREND
R19BVURJT19EVE8xX1VTRV81MTJGQlJfRFRPOwogfTsKIAogc3RydWN0IGRjZV9hZHVpb19tYXNr
IHsKQEAgLTExMiw2ICsxMTYsOSBAQCBzdHJ1Y3QgZGNlX2FkdWlvX21hc2sgewogCXVpbnQzMl90
IERDQ0dfQVVESU9fRFRPMV9NT0RVTEU7CiAJdWludDMyX3QgRENDR19BVURJT19EVE8xX1BIQVNF
OwogCXVpbnQzMl90IERDQ0dfQVVESU9fRFRPMl9VU0VfNTEyRkJSX0RUTzsKKwl1aW50MzJfdCBE
Q0NHX0FVRElPX0RUTzBfVVNFXzUxMkZCUl9EVE87CisJdWludDMyX3QgRENDR19BVURJT19EVE8x
X1VTRV81MTJGQlJfRFRPOworCiB9OwogCiBzdHJ1Y3QgZGNlX2F1ZGlvIHsKLS0gCjIuMTcuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
