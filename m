Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C3C16F32
	for <lists+amd-gfx@lfdr.de>; Wed,  8 May 2019 04:46:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B5A6E863;
	Wed,  8 May 2019 02:46:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730047.outbound.protection.outlook.com [40.107.73.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA7E36E863
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 May 2019 02:46:13 +0000 (UTC)
Received: from BN8PR12CA0028.namprd12.prod.outlook.com (2603:10b6:408:60::41)
 by BN8PR12MB3474.namprd12.prod.outlook.com (2603:10b6:408:46::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.11; Wed, 8 May
 2019 02:46:12 +0000
Received: from DM3NAM03FT008.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by BN8PR12CA0028.outlook.office365.com
 (2603:10b6:408:60::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Wed, 8 May 2019 02:46:11 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT008.mail.protection.outlook.com (10.152.82.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Wed, 8 May 2019 02:46:11 +0000
Received: from bb-VirtualBox.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 7 May 2019
 21:46:05 -0500
From: Trigger Huang <Trigger.Huang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 6/9] drm/amdgpu: Support PSP VMR ring for Vega10 VF
Date: Wed, 8 May 2019 10:45:38 +0800
Message-ID: <1557283541-7877-7-git-send-email-Trigger.Huang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557283541-7877-1-git-send-email-Trigger.Huang@amd.com>
References: <1557283541-7877-1-git-send-email-Trigger.Huang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(136003)(376002)(396003)(2980300002)(428003)(189003)(199004)(70206006)(478600001)(50226002)(53936002)(11346002)(446003)(4326008)(86362001)(26005)(77096007)(76176011)(16586007)(14444005)(6916009)(305945005)(48376002)(53416004)(54906003)(8676002)(476003)(126002)(7696005)(81166006)(36756003)(81156014)(8936002)(2351001)(72206003)(51416003)(2906002)(316002)(70586007)(50466002)(426003)(6666004)(356004)(47776003)(186003)(2616005)(5660300002)(486006)(68736007)(336012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3474; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f40ede8-f6d7-4343-8c8c-08d6d35f54bc
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BN8PR12MB3474; 
X-MS-TrafficTypeDiagnostic: BN8PR12MB3474:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3474BD241E194E9D975D63E6FE320@BN8PR12MB3474.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-Forefront-PRVS: 0031A0FFAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: xCZ5xEomtWoJjEGt1kGxW3+Us1N06viqnGHSyvCZ/QaJ2aS5W0LWLq387cTQd+oteMu9dYVXxfTecSLTrEVrwgHMMuqKyyJ588agkHjDeg9+gK1EZEaLfIzAx3eQo7YWWCMaP54cByt7Wm+WGWgmWCT0bo9DTHvCRpbYKpccHd1S4INZvOodan60+XyZR+Axfc5zeBesZEhd+t8Zy3u09aFx7Kgocm0baar6pIXbV2pudBJw/r2SoJv1nyQiWS6uKDHIBhBds2U8YEL8Ix2bmlmDjSPuwrZ4HLpLU491FlQRfVA84V0xHDPzhOQZEcWaFgRoQqi2DortEbZSjfb3aiAhoNDLR5etCyvG47DDvTE6WwX+tvCI7vcbB97TN3LtR4IgJC6nfF2urUpZT1JRXD1kUn3QqVjEbBSao4MT0bw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2019 02:46:11.5219 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f40ede8-f6d7-4343-8c8c-08d6d35f54bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3474
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83upMsxGmd9tnBmaZbqTLcgJ7puEU2Tqh9S1IZ/R6rE=;
 b=rlxZQ5ID0SbTDAFtROzICeGh3t2EQiZMEZsO73M0GAgMMnNFvkuLURY+U3Yrn3LPss8w86n3SF7e1YyEpXZYPmjaRgwOqPT3nYD0b+GYfBTQ0WCyvEXKxj9Ml5xLTTpuK63cvFWTVsnEhj2HFssCF3XI8ZmZuF/qt1EXa2Uz0d8=
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
Cc: Daniel.Wang2@amd.com, Rashid.Sohail@amd.com, Trigger.Huang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWRkIFZNUiByaW5nIHN1cHBvcnQgZm9yIFZlZ2ExMCBTUi1JT1YgVkYgaWYgUFNQIHN1cHBvcnRl
ZAoKQ2hhbmdlLUlkOiBJMTk5MGU0YzliYWJkYWM5NWQ5Nzk3ZTc4NzA1NjljMWM2ZjYzMDU4NQpT
aWduZWQtb2ZmLWJ5OiBUcmlnZ2VyIEh1YW5nIDxUcmlnZ2VyLkh1YW5nQGFtZC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YzXzEuYyB8IDEzMSArKysrKysrKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOTkgaW5zZXJ0aW9ucygrKSwg
MzIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
cHNwX3YzXzEuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92M18xLmMKaW5kZXgg
MTQzZjBmYS4uM2Y1ODI3NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
cHNwX3YzXzEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjNfMS5jCkBA
IC01MCw2ICs1MCwxMCBAQCBNT0RVTEVfRklSTVdBUkUoImFtZGdwdS92ZWdhMTJfYXNkLmJpbiIp
OwogCiBzdGF0aWMgdWludDMyX3Qgc29zX29sZF92ZXJzaW9uc1tdID0gezE1MTc2MTYsIDE1MTA1
OTIsIDE0NDg1OTQsIDE0NDY1NTR9OwogCitzdGF0aWMgYm9vbCBwc3BfdjNfMV9zdXBwb3J0X3Zt
cl9yaW5nKHN0cnVjdCBwc3BfY29udGV4dCAqcHNwKTsKK3N0YXRpYyBpbnQgcHNwX3YzXzFfcmlu
Z19zdG9wKHN0cnVjdCBwc3BfY29udGV4dCAqcHNwLAorCQkJICAgICAgZW51bSBwc3BfcmluZ190
eXBlIHJpbmdfdHlwZSk7CisKIHN0YXRpYyBpbnQgcHNwX3YzXzFfaW5pdF9taWNyb2NvZGUoc3Ry
dWN0IHBzcF9jb250ZXh0ICpwc3ApCiB7CiAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBw
c3AtPmFkZXY7CkBAIC0yOTYsMjcgKzMwMCw1NyBAQCBzdGF0aWMgaW50IHBzcF92M18xX3Jpbmdf
Y3JlYXRlKHN0cnVjdCBwc3BfY29udGV4dCAqcHNwLAogCiAJcHNwX3YzXzFfcmVyb3V0ZV9paChw
c3ApOwogCi0JLyogV3JpdGUgbG93IGFkZHJlc3Mgb2YgdGhlIHJpbmcgdG8gQzJQTVNHXzY5ICov
Ci0JcHNwX3JpbmdfcmVnID0gbG93ZXJfMzJfYml0cyhyaW5nLT5yaW5nX21lbV9tY19hZGRyKTsK
LQlXUkVHMzJfU09DMTUoTVAwLCAwLCBtbU1QMF9TTU5fQzJQTVNHXzY5LCBwc3BfcmluZ19yZWcp
OwotCS8qIFdyaXRlIGhpZ2ggYWRkcmVzcyBvZiB0aGUgcmluZyB0byBDMlBNU0dfNzAgKi8KLQlw
c3BfcmluZ19yZWcgPSB1cHBlcl8zMl9iaXRzKHJpbmctPnJpbmdfbWVtX21jX2FkZHIpOwotCVdS
RUczMl9TT0MxNShNUDAsIDAsIG1tTVAwX1NNTl9DMlBNU0dfNzAsIHBzcF9yaW5nX3JlZyk7Ci0J
LyogV3JpdGUgc2l6ZSBvZiByaW5nIHRvIEMyUE1TR183MSAqLwotCXBzcF9yaW5nX3JlZyA9IHJp
bmctPnJpbmdfc2l6ZTsKLQlXUkVHMzJfU09DMTUoTVAwLCAwLCBtbU1QMF9TTU5fQzJQTVNHXzcx
LCBwc3BfcmluZ19yZWcpOwotCS8qIFdyaXRlIHRoZSByaW5nIGluaXRpYWxpemF0aW9uIGNvbW1h
bmQgdG8gQzJQTVNHXzY0ICovCi0JcHNwX3JpbmdfcmVnID0gcmluZ190eXBlOwotCXBzcF9yaW5n
X3JlZyA9IHBzcF9yaW5nX3JlZyA8PCAxNjsKLQlXUkVHMzJfU09DMTUoTVAwLCAwLCBtbU1QMF9T
TU5fQzJQTVNHXzY0LCBwc3BfcmluZ19yZWcpOwotCi0JLyogdGhlcmUgbWlnaHQgYmUgaGFuZHNo
YWtlIGlzc3VlIHdpdGggaGFyZHdhcmUgd2hpY2ggbmVlZHMgZGVsYXkgKi8KLQltZGVsYXkoMjAp
OwotCi0JLyogV2FpdCBmb3IgcmVzcG9uc2UgZmxhZyAoYml0IDMxKSBpbiBDMlBNU0dfNjQgKi8K
LQlyZXQgPSBwc3Bfd2FpdF9mb3IocHNwLCBTT0MxNV9SRUdfT0ZGU0VUKE1QMCwgMCwgbW1NUDBf
U01OX0MyUE1TR182NCksCi0JCQkgICAweDgwMDAwMDAwLCAweDgwMDBGRkZGLCBmYWxzZSk7CisJ
aWYgKHBzcF92M18xX3N1cHBvcnRfdm1yX3JpbmcocHNwKSkgeworCQlyZXQgPSBwc3BfdjNfMV9y
aW5nX3N0b3AocHNwLCByaW5nX3R5cGUpOworCQlpZiAocmV0KSB7CisJCQlEUk1fRVJST1IoInBz
cF92M18xX3Jpbmdfc3RvcF9zcmlvdiBmYWlsZWQhXG4iKTsKKwkJCXJldHVybiByZXQ7CisJCX0K
KworCQkvKiBXcml0ZSBsb3cgYWRkcmVzcyBvZiB0aGUgcmluZyB0byBDMlBNU0dfMTAyICovCisJ
CXBzcF9yaW5nX3JlZyA9IGxvd2VyXzMyX2JpdHMocmluZy0+cmluZ19tZW1fbWNfYWRkcik7CisJ
CVdSRUczMl9TT0MxNShNUDAsIDAsIG1tTVAwX1NNTl9DMlBNU0dfMTAyLCBwc3BfcmluZ19yZWcp
OworCQkvKiBXcml0ZSBoaWdoIGFkZHJlc3Mgb2YgdGhlIHJpbmcgdG8gQzJQTVNHXzEwMyAqLwor
CQlwc3BfcmluZ19yZWcgPSB1cHBlcl8zMl9iaXRzKHJpbmctPnJpbmdfbWVtX21jX2FkZHIpOwor
CQlXUkVHMzJfU09DMTUoTVAwLCAwLCBtbU1QMF9TTU5fQzJQTVNHXzEwMywgcHNwX3JpbmdfcmVn
KTsKKwkJLyogTm8gc2l6ZSBpbml0aWFsaXphdGlvbiBmb3Igc3Jpb3YgICovCisJCS8qIFdyaXRl
IHRoZSByaW5nIGluaXRpYWxpemF0aW9uIGNvbW1hbmQgdG8gQzJQTVNHXzEwMSAqLworCQlwc3Bf
cmluZ19yZWcgPSByaW5nX3R5cGU7CisJCXBzcF9yaW5nX3JlZyA9IHBzcF9yaW5nX3JlZyA8PCAx
NjsKKwkJV1JFRzMyX1NPQzE1KE1QMCwgMCwgbW1NUDBfU01OX0MyUE1TR18xMDEsIHBzcF9yaW5n
X3JlZyk7CisKKwkJLyogdGhlcmUgbWlnaHQgYmUgaGFyZHdhcmUgaGFuZHNoYWtlIGlzc3VlIHdo
aWNoIG5lZWRzIGRlbGF5ICovCisJCW1kZWxheSgyMCk7CisKKwkJLyogV2FpdCBmb3IgcmVzcG9u
c2UgZmxhZyAoYml0IDMxKSBpbiBDMlBNU0dfMTAxICovCisJCXJldCA9IHBzcF93YWl0X2Zvcihw
c3AsIFNPQzE1X1JFR19PRkZTRVQoTVAwLCAwLAorCQkJCQltbU1QMF9TTU5fQzJQTVNHXzEwMSks
IDB4ODAwMDAwMDAsCisJCQkJCTB4ODAwMEZGRkYsIGZhbHNlKTsKKwl9IGVsc2UgeworCisJCS8q
IFdyaXRlIGxvdyBhZGRyZXNzIG9mIHRoZSByaW5nIHRvIEMyUE1TR182OSAqLworCQlwc3Bfcmlu
Z19yZWcgPSBsb3dlcl8zMl9iaXRzKHJpbmctPnJpbmdfbWVtX21jX2FkZHIpOworCQlXUkVHMzJf
U09DMTUoTVAwLCAwLCBtbU1QMF9TTU5fQzJQTVNHXzY5LCBwc3BfcmluZ19yZWcpOworCQkvKiBX
cml0ZSBoaWdoIGFkZHJlc3Mgb2YgdGhlIHJpbmcgdG8gQzJQTVNHXzcwICovCisJCXBzcF9yaW5n
X3JlZyA9IHVwcGVyXzMyX2JpdHMocmluZy0+cmluZ19tZW1fbWNfYWRkcik7CisJCVdSRUczMl9T
T0MxNShNUDAsIDAsIG1tTVAwX1NNTl9DMlBNU0dfNzAsIHBzcF9yaW5nX3JlZyk7CisJCS8qIFdy
aXRlIHNpemUgb2YgcmluZyB0byBDMlBNU0dfNzEgKi8KKwkJcHNwX3JpbmdfcmVnID0gcmluZy0+
cmluZ19zaXplOworCQlXUkVHMzJfU09DMTUoTVAwLCAwLCBtbU1QMF9TTU5fQzJQTVNHXzcxLCBw
c3BfcmluZ19yZWcpOworCQkvKiBXcml0ZSB0aGUgcmluZyBpbml0aWFsaXphdGlvbiBjb21tYW5k
IHRvIEMyUE1TR182NCAqLworCQlwc3BfcmluZ19yZWcgPSByaW5nX3R5cGU7CisJCXBzcF9yaW5n
X3JlZyA9IHBzcF9yaW5nX3JlZyA8PCAxNjsKKwkJV1JFRzMyX1NPQzE1KE1QMCwgMCwgbW1NUDBf
U01OX0MyUE1TR182NCwgcHNwX3JpbmdfcmVnKTsKKworCQkvKiB0aGVyZSBtaWdodCBiZSBoYXJk
d2FyZSBoYW5kc2hha2UgaXNzdWUgd2hpY2ggbmVlZHMgZGVsYXkgKi8KKwkJbWRlbGF5KDIwKTsK
KworCQkvKiBXYWl0IGZvciByZXNwb25zZSBmbGFnIChiaXQgMzEpIGluIEMyUE1TR182NCAqLwor
CQlyZXQgPSBwc3Bfd2FpdF9mb3IocHNwLCBTT0MxNV9SRUdfT0ZGU0VUKE1QMCwgMCwKKwkJCQkJ
bW1NUDBfU01OX0MyUE1TR182NCksIDB4ODAwMDAwMDAsCisJCQkJCTB4ODAwMEZGRkYsIGZhbHNl
KTsKIAorCX0KIAlyZXR1cm4gcmV0OwogfQogCkBAIC0zMjcsMTYgKzM2MSwzMSBAQCBzdGF0aWMg
aW50IHBzcF92M18xX3Jpbmdfc3RvcChzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCwKIAl1bnNpZ25l
ZCBpbnQgcHNwX3JpbmdfcmVnID0gMDsKIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHBz
cC0+YWRldjsKIAotCS8qIFdyaXRlIHRoZSByaW5nIGRlc3Ryb3kgY29tbWFuZCB0byBDMlBNU0df
NjQgKi8KLQlwc3BfcmluZ19yZWcgPSAzIDw8IDE2OwotCVdSRUczMl9TT0MxNShNUDAsIDAsIG1t
TVAwX1NNTl9DMlBNU0dfNjQsIHBzcF9yaW5nX3JlZyk7Ci0KLQkvKiB0aGVyZSBtaWdodCBiZSBo
YW5kc2hha2UgaXNzdWUgd2l0aCBoYXJkd2FyZSB3aGljaCBuZWVkcyBkZWxheSAqLwotCW1kZWxh
eSgyMCk7Ci0KLQkvKiBXYWl0IGZvciByZXNwb25zZSBmbGFnIChiaXQgMzEpIGluIEMyUE1TR182
NCAqLwotCXJldCA9IHBzcF93YWl0X2Zvcihwc3AsIFNPQzE1X1JFR19PRkZTRVQoTVAwLCAwLCBt
bU1QMF9TTU5fQzJQTVNHXzY0KSwKLQkJCSAgIDB4ODAwMDAwMDAsIDB4ODAwMDAwMDAsIGZhbHNl
KTsKKwlpZiAocHNwX3YzXzFfc3VwcG9ydF92bXJfcmluZyhwc3ApKSB7CisJCS8qIFdyaXRlIHRo
ZSBEZXN0cm95IEdQQ09NIHJpbmcgY29tbWFuZCB0byBDMlBNU0dfMTAxICovCisJCXBzcF9yaW5n
X3JlZyA9IEdGWF9DVFJMX0NNRF9JRF9ERVNUUk9ZX0dQQ09NX1JJTkc7CisJCVdSRUczMl9TT0Mx
NShNUDAsIDAsIG1tTVAwX1NNTl9DMlBNU0dfMTAxLCBwc3BfcmluZ19yZWcpOworCisJCS8qIHRo
ZXJlIG1pZ2h0IGJlIGhhbmRzaGFrZSBpc3N1ZSB3aGljaCBuZWVkcyBkZWxheSAqLworCQltZGVs
YXkoMjApOworCisJCS8qIFdhaXQgZm9yIHJlc3BvbnNlIGZsYWcgKGJpdCAzMSkgaW4gQzJQTVNH
XzEwMSAqLworCQlyZXQgPSBwc3Bfd2FpdF9mb3IocHNwLAorCQkJCVNPQzE1X1JFR19PRkZTRVQo
TVAwLCAwLCBtbU1QMF9TTU5fQzJQTVNHXzEwMSksCisJCQkJMHg4MDAwMDAwMCwgMHg4MDAwMDAw
MCwgZmFsc2UpOworCX0gZWxzZSB7CisJCS8qIFdyaXRlIHRoZSByaW5nIGRlc3Ryb3kgY29tbWFu
ZCB0byBDMlBNU0dfNjQgKi8KKwkJcHNwX3JpbmdfcmVnID0gMyA8PCAxNjsKKwkJV1JFRzMyX1NP
QzE1KE1QMCwgMCwgbW1NUDBfU01OX0MyUE1TR182NCwgcHNwX3JpbmdfcmVnKTsKKworCQkvKiB0
aGVyZSBtaWdodCBiZSBoYW5kc2hha2UgaXNzdWUgd2hpY2ggbmVlZHMgZGVsYXkgKi8KKwkJbWRl
bGF5KDIwKTsKKworCQkvKiBXYWl0IGZvciByZXNwb25zZSBmbGFnIChiaXQgMzEpIGluIEMyUE1T
R182NCAqLworCQlyZXQgPSBwc3Bfd2FpdF9mb3IocHNwLAorCQkJCVNPQzE1X1JFR19PRkZTRVQo
TVAwLCAwLCBtbU1QMF9TTU5fQzJQTVNHXzY0KSwKKwkJCQkweDgwMDAwMDAwLCAweDgwMDAwMDAw
LCBmYWxzZSk7CisJfQogCiAJcmV0dXJuIHJldDsKIH0KQEAgLTM3NSw3ICs0MjQsMTAgQEAgc3Rh
dGljIGludCBwc3BfdjNfMV9jbWRfc3VibWl0KHN0cnVjdCBwc3BfY29udGV4dCAqcHNwLAogCXVp
bnQzMl90IHJiX2ZyYW1lX3NpemVfZHcgPSBzaXplb2Yoc3RydWN0IHBzcF9nZnhfcmJfZnJhbWUp
IC8gNDsKIAogCS8qIEtNIChHUENPTSkgcHJlcGFyZSB3cml0ZSBwb2ludGVyICovCi0JcHNwX3dy
aXRlX3B0cl9yZWcgPSBSUkVHMzJfU09DMTUoTVAwLCAwLCBtbU1QMF9TTU5fQzJQTVNHXzY3KTsK
KwlpZiAocHNwX3YzXzFfc3VwcG9ydF92bXJfcmluZyhwc3ApKQorCQlwc3Bfd3JpdGVfcHRyX3Jl
ZyA9IFJSRUczMl9TT0MxNShNUDAsIDAsIG1tTVAwX1NNTl9DMlBNU0dfMTAyKTsKKwllbHNlCisJ
CXBzcF93cml0ZV9wdHJfcmVnID0gUlJFRzMyX1NPQzE1KE1QMCwgMCwgbW1NUDBfU01OX0MyUE1T
R182Nyk7CiAKIAkvKiBVcGRhdGUgS00gUkIgZnJhbWUgcG9pbnRlciB0byBuZXcgZnJhbWUgKi8K
IAkvKiB3cml0ZV9mcmFtZSBwdHIgaW5jcmVtZW50cyBieSBzaXplIG9mIHJiX2ZyYW1lIGluIGJ5
dGVzICovCkBAIC00MDQsNyArNDU2LDEzIEBAIHN0YXRpYyBpbnQgcHNwX3YzXzFfY21kX3N1Ym1p
dChzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCwKIAogCS8qIFVwZGF0ZSB0aGUgd3JpdGUgUG9pbnRl
ciBpbiBEV09SRHMgKi8KIAlwc3Bfd3JpdGVfcHRyX3JlZyA9IChwc3Bfd3JpdGVfcHRyX3JlZyAr
IHJiX2ZyYW1lX3NpemVfZHcpICUgcmluZ19zaXplX2R3OwotCVdSRUczMl9TT0MxNShNUDAsIDAs
IG1tTVAwX1NNTl9DMlBNU0dfNjcsIHBzcF93cml0ZV9wdHJfcmVnKTsKKwlpZiAocHNwX3YzXzFf
c3VwcG9ydF92bXJfcmluZyhwc3ApKSB7CisJCVdSRUczMl9TT0MxNShNUDAsIDAsIG1tTVAwX1NN
Tl9DMlBNU0dfMTAyLCBwc3Bfd3JpdGVfcHRyX3JlZyk7CisJCS8qIHNlbmQgaW50ZXJydXB0IHRv
IFBTUCBmb3IgU1JJT1YgcmluZyB3cml0ZSBwb2ludGVyIHVwZGF0ZSAqLworCQlXUkVHMzJfU09D
MTUoTVAwLCAwLCBtbU1QMF9TTU5fQzJQTVNHXzEwMSwKKwkJCQkJR0ZYX0NUUkxfQ01EX0lEX0NP
TlNVTUVfQ01EKTsKKwl9IGVsc2UKKwkJV1JFRzMyX1NPQzE1KE1QMCwgMCwgbW1NUDBfU01OX0My
UE1TR182NywgcHNwX3dyaXRlX3B0cl9yZWcpOwogCiAJcmV0dXJuIDA7CiB9CkBAIC01NzQsNiAr
NjMyLDE0IEBAIHN0YXRpYyBpbnQgcHNwX3YzXzFfbW9kZTFfcmVzZXQoc3RydWN0IHBzcF9jb250
ZXh0ICpwc3ApCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBib29sIHBzcF92M18xX3N1cHBvcnRf
dm1yX3Jpbmcoc3RydWN0IHBzcF9jb250ZXh0ICpwc3ApCit7CisJaWYgKGFtZGdwdV9zcmlvdl92
Zihwc3AtPmFkZXYpICYmIHBzcC0+c29zX2Z3X3ZlcnNpb24gPj0gMHg4MDQ1NSkKKwkJcmV0dXJu
IHRydWU7CisKKwlyZXR1cm4gZmFsc2U7Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcHNwX2Z1
bmNzIHBzcF92M18xX2Z1bmNzID0gewogCS5pbml0X21pY3JvY29kZSA9IHBzcF92M18xX2luaXRf
bWljcm9jb2RlLAogCS5ib290bG9hZGVyX2xvYWRfc3lzZHJ2ID0gcHNwX3YzXzFfYm9vdGxvYWRl
cl9sb2FkX3N5c2RydiwKQEAgLTU4Niw2ICs2NTIsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBz
cF9mdW5jcyBwc3BfdjNfMV9mdW5jcyA9IHsKIAkuY29tcGFyZV9zcmFtX2RhdGEgPSBwc3BfdjNf
MV9jb21wYXJlX3NyYW1fZGF0YSwKIAkuc211X3JlbG9hZF9xdWlyayA9IHBzcF92M18xX3NtdV9y
ZWxvYWRfcXVpcmssCiAJLm1vZGUxX3Jlc2V0ID0gcHNwX3YzXzFfbW9kZTFfcmVzZXQsCisJLnN1
cHBvcnRfdm1yX3JpbmcgPSBwc3BfdjNfMV9zdXBwb3J0X3Ztcl9yaW5nLAogfTsKIAogdm9pZCBw
c3BfdjNfMV9zZXRfcHNwX2Z1bmNzKHN0cnVjdCBwc3BfY29udGV4dCAqcHNwKQotLSAKMi43LjQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
