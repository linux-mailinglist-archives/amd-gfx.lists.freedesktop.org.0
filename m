Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEA36654E
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jul 2019 05:49:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D806E2B4;
	Fri, 12 Jul 2019 03:49:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770080.outbound.protection.outlook.com [40.107.77.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F9406E2B4
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jul 2019 03:49:53 +0000 (UTC)
Received: from MWHPR12CA0044.namprd12.prod.outlook.com (2603:10b6:301:2::30)
 by DM6PR12MB2857.namprd12.prod.outlook.com (2603:10b6:5:15c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.19; Fri, 12 Jul
 2019 03:49:51 +0000
Received: from CO1NAM03FT008.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::205) by MWHPR12CA0044.outlook.office365.com
 (2603:10b6:301:2::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.10 via Frontend
 Transport; Fri, 12 Jul 2019 03:49:51 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT008.mail.protection.outlook.com (10.152.80.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Fri, 12 Jul 2019 03:49:50 +0000
Received: from build-machine.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 11 Jul 2019
 22:49:48 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: bump vega20 smu driver if version
Date: Fri, 12 Jul 2019 11:49:42 +0800
Message-ID: <20190712034943.17777-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(136003)(39860400002)(2980300002)(428003)(199004)(189003)(8676002)(26005)(6666004)(356004)(51416003)(7696005)(2870700001)(53936002)(47776003)(1076003)(36756003)(81156014)(81166006)(86362001)(5660300002)(68736007)(44832011)(50466002)(50226002)(336012)(4326008)(478600001)(6916009)(186003)(14444005)(48376002)(53416004)(126002)(305945005)(8936002)(2906002)(2351001)(426003)(486006)(70586007)(70206006)(316002)(476003)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2857; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae28236e-3c00-442f-ff65-08d7067bfe49
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM6PR12MB2857; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2857:
X-Microsoft-Antispam-PRVS: <DM6PR12MB28577CCA3A991A0524B2ABCDE4F20@DM6PR12MB2857.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-Forefront-PRVS: 00963989E5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: EI8eLEFiSUfBjUF9s899wJkle85maXex3zS2rqQIdl+guHo24CNFzDicb+f6rVP97MQ5QhXv/OjVB3di+0kE3dHaQRKI2u4+zYImR/fo1gu4yWtsTNxZHVcSxD1H/P6NJ7mDvxBG5xOmdsMVZp1VHvDZ0+mGLRbnLofg4szHIwEHNCwnuMBu5IVy4OYl/mYctKL4OWjns5xwalOM66FGJF6AmhTJrQD89UtUCoFy02zxtz5FmfIkSInZmbhD/0jhJqP49AEhWm4w3yRJSgd2+Qj8lyfnmEHHgG2rvC9jZmzHyyT29TozxSaR/F5hDp1A3F4fVVdIiZs5jakYPi8YuIGTin1mRBX5yFU410lazYkewm+wwbOHvksKurVBxL+pE5LOQAVHLs9LV4MEN9232zc/v6FoDnmsNMWtnQanGPI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2019 03:49:50.9568 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae28236e-3c00-442f-ff65-08d7067bfe49
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2857
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hvria+npo1/yexB3jGpG5P7hfcBjnPIjC78eFNnJBg=;
 b=w6NxhuuSsrYvn2aAmzJNjP3O6eFRpuEvBTo9KOnO3fnQSwofrOj89Y000HlzpjaNFnJyEiPJVg0DRF1y4wJ58g2z7EiWiGVGJLPqsx3YVzNRn5xUpAssKm5MRHfLzdBUB26z6brM92Np7pzvn6xXldZexyGlZVDhk85Fd1s1GOg=
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

VG8gbWF0Y2ggbGF0ZXN0IFNNVSBmaXJtd2FyZS4KCkNoYW5nZS1JZDogSWNjOGE2ODczNTdiYTQ2
YWUxZDE5OWQ4OWNiMjAwMGM2MWI0ZGU3MDMKU2lnbmVkLW9mZi1ieTogRXZhbiBRdWFuIDxldmFu
LnF1YW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211
MTFfZHJpdmVyX2lmLmggfCA2ICsrKystLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9pbmMvc211MTFfZHJpdmVyX2lmLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9pbmMvc211MTFfZHJpdmVyX2lmLmgKaW5kZXggMTk1YzRhZTY3MDU4Li43NTVkNTFmOWM2YTkg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9zbXUxMV9kcml2
ZXJfaWYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211MTFfZHJp
dmVyX2lmLmgKQEAgLTI3LDcgKzI3LDcgQEAKIC8vICoqKiBJTVBPUlRBTlQgKioqCiAvLyBTTVUg
VEVBTTogQWx3YXlzIGluY3JlbWVudCB0aGUgaW50ZXJmYWNlIHZlcnNpb24gaWYKIC8vIGFueSBz
dHJ1Y3R1cmUgaXMgY2hhbmdlZCBpbiB0aGlzIGZpbGUKLSNkZWZpbmUgU01VMTFfRFJJVkVSX0lG
X1ZFUlNJT04gMHgxMgorI2RlZmluZSBTTVUxMV9EUklWRVJfSUZfVkVSU0lPTiAweDEzCiAKICNk
ZWZpbmUgUFBUQUJMRV9WMjBfU01VX1ZFUlNJT04gMwogCkBAIC02MTUsNiArNjE1LDcgQEAgdHlw
ZWRlZiBzdHJ1Y3QgewogICB1aW50MTZfdCAgICAgVWNsa0F2ZXJhZ2VMcGZUYXU7CiAgIHVpbnQx
Nl90ICAgICBHZnhBY3Rpdml0eUxwZlRhdTsKICAgdWludDE2X3QgICAgIFVjbGtBY3Rpdml0eUxw
ZlRhdTsKKyAgdWludDE2X3QgICAgIFNvY2tldFBvd2VyTHBmVGF1OwogCiAKICAgdWludDMyX3Qg
ICAgIE1tSHViUGFkZGluZ1s4XTsKQEAgLTY2NSw3ICs2NjYsOCBAQCB0eXBlZGVmIHN0cnVjdCB7
CiAgIHVpbnQzMl90IFRocm90dGxlclN0YXR1cyAgICAgICA7CiAKICAgdWludDhfdCAgTGlua0Rw
bUxldmVsOwotICB1aW50OF90ICBQYWRkaW5nWzNdOworICB1aW50MTZfdCBBdmVyYWdlU29ja2V0
UG93ZXI7CisgIHVpbnQ4X3QgIFBhZGRpbmc7CiAKIAogICB1aW50MzJfdCAgICAgTW1IdWJQYWRk
aW5nWzddOwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
