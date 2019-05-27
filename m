Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 931E82BAE0
	for <lists+amd-gfx@lfdr.de>; Mon, 27 May 2019 21:52:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EA9C89A7A;
	Mon, 27 May 2019 19:52:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820070.outbound.protection.outlook.com [40.107.82.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4238899E6
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2019 19:52:01 +0000 (UTC)
Received: from DM3PR12CA0110.namprd12.prod.outlook.com (2603:10b6:0:55::30) by
 MWHPR1201MB0063.namprd12.prod.outlook.com (2603:10b6:301:54::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1922.17; Mon, 27 May
 2019 19:51:59 +0000
Received: from CO1NAM03FT006.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::203) by DM3PR12CA0110.outlook.office365.com
 (2603:10b6:0:55::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.15 via Frontend
 Transport; Mon, 27 May 2019 19:51:58 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT006.mail.protection.outlook.com (10.152.80.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Mon, 27 May 2019 19:51:58 +0000
Received: from leodev.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 27 May 2019
 14:51:54 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 07/26] drm/amd/display: Add GSL source select registers
Date: Mon, 27 May 2019 15:50:46 -0400
Message-ID: <1558986665-12964-8-git-send-email-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558986665-12964-1-git-send-email-sunpeng.li@amd.com>
References: <1558986665-12964-1-git-send-email-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(346002)(376002)(136003)(39860400002)(2980300002)(428003)(189003)(199004)(446003)(53416004)(11346002)(68736007)(426003)(2616005)(4326008)(2906002)(486006)(47776003)(305945005)(476003)(5660300002)(126002)(2876002)(86362001)(77096007)(186003)(336012)(53936002)(36756003)(6916009)(8676002)(72206003)(76176011)(50466002)(70206006)(48376002)(316002)(86152003)(16586007)(2351001)(6666004)(356004)(7696005)(70586007)(51416003)(478600001)(50226002)(81156014)(81166006)(26005)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR1201MB0063; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7cca9af-3790-445f-1bf6-08d6e2dcc778
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR1201MB0063; 
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0063:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0063159F18961FCC0FE602AD821D0@MWHPR1201MB0063.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 0050CEFE70
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: o4mlqOakukrK3aWd9mTKaLSWPCtU7HcLfTAkbRJO3PZZX7ArGtnu8Y+y4YaAo4nKnnPOovJkV+KHqdKyAumCPWy6NvONnbQONgAGTy1Dy/WXH3nqO8t7NiQVPLw3E8xg8+FG1fEGQt8fDgxwU77g8+GXeNOHMNvIDOgYsNL03HV+5llaVJYXgdG95kxNt9yoWL8WPJDMgVrSXweqIXWLM6p+AJgYafNTFCURL+dFkhuVN3BQ6pgXNtELgQOLMJ3qrUhE1VKUDAgKW9yT81D15eDPb4NVtH73C9qhqhN1nH94ynxDhGxxEFWrrOtI39kS5Lz/zDD/t8Omok4zdnbW5T73ANP4+KVBJ3NxUQ+mbwLitQImn8Bapt8odXVTUIk9L3s2q53ZmLvGn7dahiAlT446J+vDtEbrWUym6jzUrC8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2019 19:51:58.4774 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7cca9af-3790-445f-1bf6-08d6e2dcc778
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0063
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjZFbMJX3NnHG+cIFlB5lQC0xCwAObtTTvwqosTvDA8=;
 b=O6RcSuT0T8W4JcRj8ZAAyHc17b16FNhFn1LlwNPDouqZOM3Lmq7p/8cqV7u2cLhZPec9CQSUCGuE+i35UYoyNRbr4/S/15kmHtP92Iqm7B+y34e7GY/OtArNcfBZNQF6yWta7DyghA+WfJdEfU0NqNcnWd/hqe1VQpeGf496LbA=
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
Cc: Krunoslav Kovac <Krunoslav.Kovac@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS3J1bm9zbGF2IEtvdmFjIDxLcnVub3NsYXYuS292YWNAYW1kLmNvbT4KCkdTTCBpcyBh
IGZvcm0gb2YgbG9ja2luZyB0aGF0IGNhbiBiZSB1c2VkIHRvIHN5bmNocm9uaXplIHBpcGVzIGlu
IGEKcGlwZS1zcGxpdCBjb25maWd1cmF0aW9ucyB3aGVuIGFzeW5jIGZsaXAgaXMgdXNlZC4gQWRk
IHRoZSByZWdpc3RlcnMKaGVyZS4KClNpZ25lZC1vZmYtYnk6IEtydW5vc2xhdiBLb3ZhYyA8S3J1
bm9zbGF2LktvdmFjQGFtZC5jb20+ClJldmlld2VkLWJ5OiBUb255IENoZW5nIDxUb255LkNoZW5n
QGFtZC5jb20+CkFja2VkLWJ5OiBBcmljIEN5ciA8QXJpYy5DeXJAYW1kLmNvbT4KQWNrZWQtYnk6
IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY24xMC9kY24xMF9vcHRjLmggfCAxNCArKysrKysrKysrKy0tLQogMSBmaWxlIGNo
YW5nZWQsIDExIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX29wdGMuaCBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9vcHRjLmgKaW5kZXggNjUxYjhjYS4u
NzBmZDU2ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEw
L2RjbjEwX29wdGMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAv
ZGNuMTBfb3B0Yy5oCkBAIC04NCw3ICs4NCw4IEBACiAJU1JJKE9UR19DUkMwX1dJTkRPV0FfWF9D
T05UUk9MLCBPVEcsIGluc3QpLFwKIAlTUkkoT1RHX0NSQzBfV0lORE9XQV9ZX0NPTlRST0wsIE9U
RywgaW5zdCksXAogCVNSSShPVEdfQ1JDMF9XSU5ET1dCX1hfQ09OVFJPTCwgT1RHLCBpbnN0KSxc
Ci0JU1JJKE9UR19DUkMwX1dJTkRPV0JfWV9DT05UUk9MLCBPVEcsIGluc3QpCisJU1JJKE9UR19D
UkMwX1dJTkRPV0JfWV9DT05UUk9MLCBPVEcsIGluc3QpLFwKKwlTUihHU0xfU09VUkNFX1NFTEVD
VCkKIAogI2RlZmluZSBUR19DT01NT05fUkVHX0xJU1RfRENOMV8wKGluc3QpIFwKIAlUR19DT01N
T05fUkVHX0xJU1RfRENOKGluc3QpLFwKQEAgLTE1Niw2ICsxNTcsNyBAQCBzdHJ1Y3QgZGNuX29w
dGNfcmVnaXN0ZXJzIHsKIAl1aW50MzJfdCBPVEdfQ1JDMF9XSU5ET1dBX1lfQ09OVFJPTDsKIAl1
aW50MzJfdCBPVEdfQ1JDMF9XSU5ET1dCX1hfQ09OVFJPTDsKIAl1aW50MzJfdCBPVEdfQ1JDMF9X
SU5ET1dCX1lfQ09OVFJPTDsKKwl1aW50MzJfdCBHU0xfU09VUkNFX1NFTEVDVDsKIH07CiAKICNk
ZWZpbmUgVEdfQ09NTU9OX01BU0tfU0hfTElTVF9EQ04obWFza19zaClcCkBAIC0yNjYsNyArMjY4
LDEwIEBAIHN0cnVjdCBkY25fb3B0Y19yZWdpc3RlcnMgewogCVNGKE9URzBfT1RHX0NSQzBfV0lO
RE9XQl9YX0NPTlRST0wsIE9UR19DUkMwX1dJTkRPV0JfWF9TVEFSVCwgbWFza19zaCksXAogCVNG
KE9URzBfT1RHX0NSQzBfV0lORE9XQl9YX0NPTlRST0wsIE9UR19DUkMwX1dJTkRPV0JfWF9FTkQs
IG1hc2tfc2gpLFwKIAlTRihPVEcwX09UR19DUkMwX1dJTkRPV0JfWV9DT05UUk9MLCBPVEdfQ1JD
MF9XSU5ET1dCX1lfU1RBUlQsIG1hc2tfc2gpLFwKLQlTRihPVEcwX09UR19DUkMwX1dJTkRPV0Jf
WV9DT05UUk9MLCBPVEdfQ1JDMF9XSU5ET1dCX1lfRU5ELCBtYXNrX3NoKQorCVNGKE9URzBfT1RH
X0NSQzBfV0lORE9XQl9ZX0NPTlRST0wsIE9UR19DUkMwX1dJTkRPV0JfWV9FTkQsIG1hc2tfc2gp
LFwKKwlTRihHU0xfU09VUkNFX1NFTEVDVCwgR1NMMF9SRUFEWV9TT1VSQ0VfU0VMLCBtYXNrX3No
KSxcCisJU0YoR1NMX1NPVVJDRV9TRUxFQ1QsIEdTTDFfUkVBRFlfU09VUkNFX1NFTCwgbWFza19z
aCksXAorCVNGKEdTTF9TT1VSQ0VfU0VMRUNULCBHU0wyX1JFQURZX1NPVVJDRV9TRUwsIG1hc2tf
c2gpCiAKIAogI2RlZmluZSBUR19DT01NT05fTUFTS19TSF9MSVNUX0RDTjFfMChtYXNrX3NoKVwK
QEAgLTQxMyw3ICs0MTgsMTAgQEAgc3RydWN0IGRjbl9vcHRjX3JlZ2lzdGVycyB7CiAJdHlwZSBP
VEdfQ1JDMF9XSU5ET1dCX1hfU1RBUlQ7XAogCXR5cGUgT1RHX0NSQzBfV0lORE9XQl9YX0VORDtc
CiAJdHlwZSBPVEdfQ1JDMF9XSU5ET1dCX1lfU1RBUlQ7XAotCXR5cGUgT1RHX0NSQzBfV0lORE9X
Ql9ZX0VORDsKKwl0eXBlIE9UR19DUkMwX1dJTkRPV0JfWV9FTkQ7XAorCXR5cGUgR1NMMF9SRUFE
WV9TT1VSQ0VfU0VMO1wKKwl0eXBlIEdTTDFfUkVBRFlfU09VUkNFX1NFTDtcCisJdHlwZSBHU0wy
X1JFQURZX1NPVVJDRV9TRUw7CiAKIAogI2RlZmluZSBUR19SRUdfRklFTERfTElTVCh0eXBlKSBc
Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
