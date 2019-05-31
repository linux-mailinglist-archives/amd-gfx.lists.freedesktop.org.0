Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE93F30E8E
	for <lists+amd-gfx@lfdr.de>; Fri, 31 May 2019 15:11:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DECE891E7;
	Fri, 31 May 2019 13:11:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780072.outbound.protection.outlook.com [40.107.78.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F01891E7
 for <amd-gfx@lists.freedesktop.org>; Fri, 31 May 2019 13:10:58 +0000 (UTC)
Received: from BN6PR1201CA0023.namprd12.prod.outlook.com
 (2603:10b6:405:4c::33) by BYAPR12MB2663.namprd12.prod.outlook.com
 (2603:10b6:a03:69::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1922.16; Fri, 31 May
 2019 13:10:56 +0000
Received: from CO1NAM03FT042.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by BN6PR1201CA0023.outlook.office365.com
 (2603:10b6:405:4c::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1943.17 via Frontend
 Transport; Fri, 31 May 2019 13:10:56 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT042.mail.protection.outlook.com (10.152.81.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1943.19 via Frontend Transport; Fri, 31 May 2019 13:10:55 +0000
Received: from prike.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server (TLS) id 14.3.389.1; Fri, 31 May
 2019 08:10:53 -0500
From: Prike Liang <Prike.Liang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amd/powerplay: add set_power_profile_mode for
 raven1_refresh
Date: Fri, 31 May 2019 21:10:45 +0800
Message-ID: <1559308246-11211-1-git-send-email-Prike.Liang@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.34.1.3]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(376002)(39860400002)(346002)(396003)(2980300002)(428003)(199004)(189003)(54906003)(70586007)(48376002)(2906002)(50466002)(4326008)(72206003)(26005)(51416003)(86362001)(478600001)(81166006)(53936002)(68736007)(6916009)(8936002)(7696005)(50226002)(8676002)(81156014)(356004)(3846002)(336012)(316002)(16586007)(36756003)(6116002)(2616005)(2351001)(47776003)(70206006)(16526019)(476003)(305945005)(426003)(186003)(126002)(486006)(77096007)(7736002)(5660300002)(53416004)(6666004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2663; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7b697eb-076c-4b32-59d4-08d6e5c96a6c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BYAPR12MB2663; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2663:
X-Microsoft-Antispam-PRVS: <BYAPR12MB26635ED32F9A490ABB41FF13FB190@BYAPR12MB2663.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-Forefront-PRVS: 00540983E2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: PopSop6M8sJKtXk1A09HnbpSDl5nuYCWfH5QHTo85p+8HzfKqLKEeuWQWoshHblUONQTPVxTA58OtsP+hEqA5nksMjCoEno5gXya/Pm+akNQ0cwnzG7IWHM4H1pBNIhqw4j+j4Ue3d+5mbvh/TRtPgOXqO5YNvU9YevcfDPjTAKQ6PeTHXK2o/KoYkyG0pra5fI5M4LUsjSQ7rz+LHkgyzqQfi4ZFQWnBsOCritT8DlKfohxvyl6c0EmM4NOLGoHvuw0IGGklwVW99JOLlARU8V622+MYNwjYA82EO61ZLCL1RD4IDmgjYkNsNeQnnEVHrkYjDEMpL2Jx//VrcUG84Q8a04JaZMnyRAA0iuSp7S/NawZcHGyOKsHUwxrpc1Potk/ekgKb7byUz9gG3hZB+MJvjHHFk5h3y+SnHDoDr4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2019 13:10:55.4195 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7b697eb-076c-4b32-59d4-08d6e5c96a6c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2663
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2xBuRPqNKzcA+nPMnDA432gWHsAZaHm1PoXrfY/IiY=;
 b=unX3haCkdkrnn8wduBxYFdWL2F67n8bm655jOoyOpeegBEEa9hehfHnOqTQgv+/9383V/Q/Oi1yx2BA0KE8AX6hXIkTC2ZT/YaFqdbyxzU5sk3XheK4qqafIwsoanskBe7t/ho9BOMNQxEApzz8oRPqswKl+UTQdf8GMs/YKjGo=
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
Cc: Alexander.Deucher@amd.com, Ray.Huang@amd.com,
 Chengming Gui <Jack.Gui@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ2hlbmdtaW5nIEd1aSA8SmFjay5HdWlAYW1kLmNvbT4KCmFkZCBnZnhvZmZfc3RhdGVf
Y2hhbmdlZF9ieV93b3JrbG9hZCB0byBjb250cm9sIGdmeG9mZgp3aGVuIHNldCBwb3dlcl9wcm9m
aWxlX21vZGUKClNpZ25lZC1vZmYtYnk6IENoZW5nbWluZyBHdWkgPEphY2suR3VpQGFtZC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvaHdtZ3IuYyAgICAgICB8
ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3NtdTEwX2h3bWdyLmMg
fCAzMSArKysrKysrKysrKysrKysrKysrKy0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvaW5jL2h3bWdyLmggICAgICAgICB8ICAxICsKIDMgZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9od21nci9od21nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
aHdtZ3IvaHdtZ3IuYwppbmRleCA2Y2Q2NDk3Li5mMWQzMjZjIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9od21nci5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2h3bWdyL2h3bWdyLmMKQEAgLTkyLDYgKzkyLDcgQEAgaW50IGh3bWdy
X2Vhcmx5X2luaXQoc3RydWN0IHBwX2h3bWdyICpod21ncikKIAlod21ncl9zZXRfdXNlcl9zcGVj
aWZ5X2NhcHMoaHdtZ3IpOwogCWh3bWdyLT5mYW5fY3RybF9pc19pbl9kZWZhdWx0X21vZGUgPSB0
cnVlOwogCWh3bWdyX2luaXRfd29ya2xvYWRfcHJvcml0eShod21ncik7CisJaHdtZ3ItPmdmeG9m
Zl9zdGF0ZV9jaGFuZ2VkX2J5X3dvcmtsb2FkID0gZmFsc2U7CiAKIAlzd2l0Y2ggKGh3bWdyLT5j
aGlwX2ZhbWlseSkgewogCWNhc2UgQU1ER1BVX0ZBTUlMWV9DSToKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3NtdTEwX2h3bWdyLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9zbXUxMF9od21nci5jCmluZGV4IDlhNTk1ZjcuLmUz
MmFlOWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3Nt
dTEwX2h3bWdyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3Ivc211
MTBfaHdtZ3IuYwpAQCAtMTI1OCwyMSArMTI1OCw0NiBAQCBzdGF0aWMgaW50IHNtdTEwX2dldF9w
b3dlcl9wcm9maWxlX21vZGUoc3RydWN0IHBwX2h3bWdyICpod21nciwgY2hhciAqYnVmKQogCXJl
dHVybiBzaXplOwogfQogCitzdGF0aWMgYm9vbCBzbXUxMF9pc19yYXZlbjFfcmVmcmVzaChzdHJ1
Y3QgcHBfaHdtZ3IgKmh3bWdyKQoreworCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gaHdt
Z3ItPmFkZXY7CisJaWYgKChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9SQVZFTikgJiYKKwkgICAg
KGFkZXYtPnJldl9pZCAhPSAweDE1ZDgpICYmCisJICAgIChod21nci0+c211X3ZlcnNpb24gPj0g
MHg0MWUyYikpCisJCXJldHVybiB0cnVlOworCWVsc2UKKwkJcmV0dXJuIGZhbHNlOworfQorCiBz
dGF0aWMgaW50IHNtdTEwX3NldF9wb3dlcl9wcm9maWxlX21vZGUoc3RydWN0IHBwX2h3bWdyICpo
d21nciwgbG9uZyAqaW5wdXQsIHVpbnQzMl90IHNpemUpCiB7CiAJaW50IHdvcmtsb2FkX3R5cGUg
PSAwOworCWludCByZXN1bHQgPSAwOwogCiAJaWYgKGlucHV0W3NpemVdID4gUFBfU01DX1BPV0VS
X1BST0ZJTEVfQ09NUFVURSkgewogCQlwcl9lcnIoIkludmFsaWQgcG93ZXIgcHJvZmlsZSBtb2Rl
ICVsZFxuIiwgaW5wdXRbc2l6ZV0pOwogCQlyZXR1cm4gLUVJTlZBTDsKIAl9Ci0JaHdtZ3ItPnBv
d2VyX3Byb2ZpbGVfbW9kZSA9IGlucHV0W3NpemVdOworCWlmIChod21nci0+cG93ZXJfcHJvZmls
ZV9tb2RlID09IGlucHV0W3NpemVdKQorCQlyZXR1cm4gMDsKIAogCS8qIGNvbnYgUFBfU01DX1BP
V0VSX1BST0ZJTEUqIHRvIFdPUktMT0FEX1BQTElCXypfQklUICovCiAJd29ya2xvYWRfdHlwZSA9
Ci0JCWNvbnZfcG93ZXJfcHJvZmlsZV90b19wcGxpYl93b3JrbG9hZChod21nci0+cG93ZXJfcHJv
ZmlsZV9tb2RlKTsKLQlzbXVtX3NlbmRfbXNnX3RvX3NtY193aXRoX3BhcmFtZXRlcihod21nciwg
UFBTTUNfTVNHX0FjdGl2ZVByb2Nlc3NOb3RpZnksCisJCWNvbnZfcG93ZXJfcHJvZmlsZV90b19w
cGxpYl93b3JrbG9hZChpbnB1dFtzaXplXSk7CisJaWYgKHdvcmtsb2FkX3R5cGUgJiYKKwkgICAg
c211MTBfaXNfcmF2ZW4xX3JlZnJlc2goaHdtZ3IpICYmCisJICAgICFod21nci0+Z2Z4b2ZmX3N0
YXRlX2NoYW5nZWRfYnlfd29ya2xvYWQpIHsKKwkJc211MTBfZ2Z4X29mZl9jb250cm9sKGh3bWdy
LCBmYWxzZSk7CisJCWh3bWdyLT5nZnhvZmZfc3RhdGVfY2hhbmdlZF9ieV93b3JrbG9hZCA9IHRy
dWU7CisJfQorCXJlc3VsdCA9IHNtdW1fc2VuZF9tc2dfdG9fc21jX3dpdGhfcGFyYW1ldGVyKGh3
bWdyLCBQUFNNQ19NU0dfQWN0aXZlUHJvY2Vzc05vdGlmeSwKIAkJCQkJCTEgPDwgd29ya2xvYWRf
dHlwZSk7CisJaWYgKCFyZXN1bHQpCisJCWh3bWdyLT5wb3dlcl9wcm9maWxlX21vZGUgPSBpbnB1
dFtzaXplXTsKKwlpZiAod29ya2xvYWRfdHlwZSAmJiBod21nci0+Z2Z4b2ZmX3N0YXRlX2NoYW5n
ZWRfYnlfd29ya2xvYWQpIHsKKwkJc211MTBfZ2Z4X29mZl9jb250cm9sKGh3bWdyLCB0cnVlKTsK
KwkJaHdtZ3ItPmdmeG9mZl9zdGF0ZV9jaGFuZ2VkX2J5X3dvcmtsb2FkID0gZmFsc2U7CisJfQog
CiAJcmV0dXJuIDA7CiB9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9pbmMvaHdtZ3IuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9od21nci5o
CmluZGV4IGJhYzNkODUuLmM5Mjk5OWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2luYy9od21nci5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2luYy9od21nci5oCkBAIC03ODIsNiArNzgyLDcgQEAgc3RydWN0IHBwX2h3bWdyIHsKIAl1aW50
MzJfdCB3b3JrbG9hZF9tYXNrOwogCXVpbnQzMl90IHdvcmtsb2FkX3Byb3JpdHlbV29ya2xvYWRf
UG9saWN5X01heF07CiAJdWludDMyX3Qgd29ya2xvYWRfc2V0dGluZ1tXb3JrbG9hZF9Qb2xpY3lf
TWF4XTsKKwlib29sIGdmeG9mZl9zdGF0ZV9jaGFuZ2VkX2J5X3dvcmtsb2FkOwogfTsKIAogaW50
IGh3bWdyX2Vhcmx5X2luaXQoc3RydWN0IHBwX2h3bWdyICpod21ncik7Ci0tIAoyLjcuNAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
