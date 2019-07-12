Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEF2664B4
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jul 2019 04:54:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9216C6E2A9;
	Fri, 12 Jul 2019 02:54:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on0618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::618])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF586E2A9
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jul 2019 02:54:49 +0000 (UTC)
Received: from CY4PR12CA0038.namprd12.prod.outlook.com (2603:10b6:903:129::24)
 by DM5PR12MB1851.namprd12.prod.outlook.com (2603:10b6:3:109::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.19; Fri, 12 Jul
 2019 02:54:48 +0000
Received: from DM3NAM03FT058.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by CY4PR12CA0038.outlook.office365.com
 (2603:10b6:903:129::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.10 via Frontend
 Transport; Fri, 12 Jul 2019 02:54:48 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT058.mail.protection.outlook.com (10.152.82.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Fri, 12 Jul 2019 02:54:47 +0000
Received: from build-machine.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 11 Jul 2019
 21:54:46 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: avoid access before allocation
Date: Fri, 12 Jul 2019 10:54:39 +0800
Message-ID: <20190712025439.16511-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(39860400002)(396003)(2980300002)(428003)(189003)(199004)(316002)(6916009)(14444005)(47776003)(4326008)(356004)(2616005)(26005)(486006)(476003)(6666004)(126002)(44832011)(426003)(7696005)(186003)(70586007)(51416003)(2351001)(8936002)(70206006)(36756003)(2870700001)(478600001)(336012)(50466002)(48376002)(86362001)(53416004)(53936002)(68736007)(5660300002)(81156014)(50226002)(1076003)(8676002)(81166006)(305945005)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1851; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36d50763-1f43-4f69-1867-08d706744d4f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1851; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1851:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1851A3949F294DE2D738F71CE4F20@DM5PR12MB1851.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-Forefront-PRVS: 00963989E5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: AqphoC+1oyb6t0mvkhzxe/tY3OY0Ke4TayjpALQnfkgKA8Lpkrys3erXOCn42UXeE3TH2G+mxu7pDc83wsMxdsOVz5+iAcj8S4Qu1n18zIdHiMc0qVKxaI9SYsXVe608A3rI589wrPmP0ccBco9ZbENzWeyuRcRo2sWetMhi3N90s9i7wlNOazY63FuzxBeWwvnEKID2UsvcDPrhxae1nyijGdFXWAXiau+lF1KYcAQ1ly0gwyfP8yyTG4qKE6UhayBhYkhjhuR6/gDD/HQ6u9oUzou60c2kCx4epsUtK32SY//fzsLi1GARIahTcmT22gXQsVoogrbbHbiQjHH9Ewmu0Q7McqtlH/K8GMsnUuybTNf79oE534Yb8Jdklw8ZhBV3wdFnEE5IPHJDg6oq6nCaEPg4E79RB8AzKdyKA7Q=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2019 02:54:47.6847 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36d50763-1f43-4f69-1867-08d706744d4f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1851
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrhiuO3Bamt/2dtl/wVc+W3dxjbJkrF9NUvEF8J9aYc=;
 b=hvSbQwPHHH6VVwq1I0oBVqzdNm9R0nmAfYal0cdCuts7Z2S0Mh5+/x0FDItynCO5Z3WtOSpC0f/nzPefemy0XGODqMsMkBKzB7XQ5klQjvHlbd5WrtYmyozLVhDeXa8E9jlpK+vV/h9yNOI6OgVBAsQp67Tc9M5SxTYOFqbZuY0=
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

Tm8gYWNjZXNzIGJlZm9yZSBhbGxvY2F0aW9uLgoKQ2hhbmdlLUlkOiBJYTFkNzg3ODZmMjQwMGNk
MWNkMjI3ZDFhYjZlYTRjNmE3MTYxOWU0YwpTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1YW4gPGV2YW4u
cXVhbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9w
cHQuYyB8IDExICsrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L3ZlZ2EyMF9wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQu
YwppbmRleCA5ZTNlNzM3OTI2YWEuLmM3MDI2MmU2ZTI1MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYwpAQCAtNDQxLDcgKzQ0MSw2IEBAIHN0YXRpYyBpbnQg
dmVnYTIwX3N0b3JlX3Bvd2VycGxheV90YWJsZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKIHsK
IAlBVE9NX1ZlZ2EyMF9QT1dFUlBMQVlUQUJMRSAqcG93ZXJwbGF5X3RhYmxlID0gTlVMTDsKIAlz
dHJ1Y3Qgc211X3RhYmxlX2NvbnRleHQgKnRhYmxlX2NvbnRleHQgPSAmc211LT5zbXVfdGFibGU7
Ci0JaW50IHJldDsKIAogCWlmICghdGFibGVfY29udGV4dC0+cG93ZXJfcGxheV90YWJsZSkKIAkJ
cmV0dXJuIC1FSU5WQUw7CkBAIC00NTUsOSArNDU0LDcgQEAgc3RhdGljIGludCB2ZWdhMjBfc3Rv
cmVfcG93ZXJwbGF5X3RhYmxlKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQogCXRhYmxlX2NvbnRl
eHQtPnRoZXJtYWxfY29udHJvbGxlcl90eXBlID0gcG93ZXJwbGF5X3RhYmxlLT51Y1RoZXJtYWxD
b250cm9sbGVyVHlwZTsKIAl0YWJsZV9jb250ZXh0LT5URFBPRExpbWl0ID0gbGUzMl90b19jcHUo
cG93ZXJwbGF5X3RhYmxlLT5PdmVyRHJpdmU4VGFibGUuT0RTZXR0aW5nc01heFtBVE9NX1ZFR0Ey
MF9PRFNFVFRJTkdfUE9XRVJQRVJDRU5UQUdFXSk7CiAKLQlyZXQgPSB2ZWdhMjBfc2V0dXBfb2Q4
X2luZm9ybWF0aW9uKHNtdSk7Ci0KLQlyZXR1cm4gcmV0OworCXJldHVybiAwOwogfQogCiBzdGF0
aWMgaW50IHZlZ2EyMF9hcHBlbmRfcG93ZXJwbGF5X3RhYmxlKHN0cnVjdCBzbXVfY29udGV4dCAq
c211KQpAQCAtMTUwNyw2ICsxNTA0LDEyIEBAIHN0YXRpYyBpbnQgdmVnYTIwX3NldF9kZWZhdWx0
X29kOF9zZXR0dGluZ3Moc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCiAKIAlzbXUtPm9kX3NldHRp
bmdzID0gKHZvaWQgKilvZDhfc2V0dGluZ3M7CiAKKwlyZXQgPSB2ZWdhMjBfc2V0dXBfb2Q4X2lu
Zm9ybWF0aW9uKHNtdSk7CisJaWYgKHJldCkgeworCQlwcl9lcnIoIlJldHJpZXZlIGJvYXJkIE9E
IGxpbWl0cyBmYWlsZWQhXG4iKTsKKwkJcmV0dXJuIHJldDsKKwl9CisKIAlpZiAoc211X2ZlYXR1
cmVfaXNfZW5hYmxlZChzbXUsIFNNVV9GRUFUVVJFX0RQTV9TT0NDTEtfQklUKSkgewogCQlpZiAo
b2Q4X3NldHRpbmdzLT5vZF9mZWF0dXJlX2NhcGFiaWxpdGllc1tBVE9NX1ZFR0EyMF9PREZFQVRV
UkVfR0ZYQ0xLX0xJTUlUU10gJiYKIAkJICAgIG9kOF9zZXR0aW5ncy0+b2Rfc2V0dGluZ3NfbWF4
W09EOF9TRVRUSU5HX0dGWENMS19GTUFYXSA+IDAgJiYKLS0gCjIuMjEuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
