Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CC16CC7F
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jul 2019 12:03:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 932A36E392;
	Thu, 18 Jul 2019 10:02:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::60e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C8CF6E392
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jul 2019 10:02:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGQAqampR2w/cKnipThwTusG2kY565L5ugEojfg/Qv1T5LsaGNO62EWylHgyPXXM+Px7k2hjhlERsyUsH6qe3pxeB6K8q1s0AuZtRY7Dapijg1B9/GOkiBE1js5qcxC4c0jPr39CtquVQCA2Z0ut4Zy68BtkEyzeEUMFt5uI6hdJzUqvz6basAKWQSKTTNpdNMJS6ilYPge/swm2zF857LFinWZ29aRIODHLRmm7yMI3m4wuZDc8ltuOCUIGChAN1aEIIXXjAig9BEDpyDS4IefDMqhs4zVEMx1U/4xGZJeofOygHz6R96Ka2NYUP7oPu3UyB9Gqw/oABwCmMAHnkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bffF/3nEEAdfRalgALGGJVQgVyD1AkLM1AaQjA87T3w=;
 b=R1q7e46E/mRs1VWYSBef8sTkhmJvpjvRIRcVA5J2nxzjHzmhqRKd/htNTcLnuqbuRFHENrce81MFzuW28jv1hbJYi67yM/f+elcC7cLV+tjs1NScujAguJpHrq5PZf7ge2QfoTt/+Ot50hN97SN1grlk3cCxoeujOr4sXwCJFzGpp28BFbjWKVHDojKp3MzAcX+etGV33Um3+qIsnK2eLppXSYpjzTnzpC/WibgbIjJJe+z9dlF3mxPQ00piL+qVODGAA3QdXoPA8/NfQpZwo/pAD1Y9pp4inhl86Xsz9FR4zbi4X42UWwkOfyHOzR9hm0EX23snD+wzCzQVofNMwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CH2PR12CA0011.namprd12.prod.outlook.com (2603:10b6:610:57::21)
 by CH2PR12MB3927.namprd12.prod.outlook.com (2603:10b6:610:2d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Thu, 18 Jul
 2019 10:02:56 +0000
Received: from BY2NAM03FT028.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::201) by CH2PR12CA0011.outlook.office365.com
 (2603:10b6:610:57::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.10 via Frontend
 Transport; Thu, 18 Jul 2019 10:02:56 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT028.mail.protection.outlook.com (10.152.84.238) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 18 Jul 2019 10:02:55 +0000
Received: from gc-System-Product-Name.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Thu, 18 Jul 2019 05:02:53 -0500
From: Chengming Gui <Jack.Gui@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/amd/powerplay: add mutex lock to protect dpm context
 resource
Date: Thu, 18 Jul 2019 18:02:18 +0800
Message-ID: <1563444138-23948-3-git-send-email-Jack.Gui@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563444138-23948-1-git-send-email-Jack.Gui@amd.com>
References: <1563444138-23948-1-git-send-email-Jack.Gui@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39850400004)(376002)(396003)(346002)(136003)(2980300002)(428003)(189003)(199004)(47776003)(53936002)(86362001)(14444005)(476003)(81156014)(6666004)(51416003)(7696005)(76176011)(5660300002)(8676002)(305945005)(4326008)(446003)(70586007)(70206006)(426003)(356004)(316002)(36756003)(2906002)(186003)(68736007)(478600001)(8936002)(6916009)(53416004)(50226002)(336012)(2351001)(126002)(50466002)(486006)(81166006)(48376002)(26005)(16586007)(11346002)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3927; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d35ecf3-9dc6-41f3-4d75-08d70b671b28
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CH2PR12MB3927; 
X-MS-TrafficTypeDiagnostic: CH2PR12MB3927:
X-Microsoft-Antispam-PRVS: <CH2PR12MB39273F3450DA836C3D0820E28BC80@CH2PR12MB3927.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-Forefront-PRVS: 01026E1310
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: alpk9wpj9x9UIq0YEuMcMxFz3vJyhy0N3IKLpaEovDVCESjsMTy9rgU2U1aCtzNRLybe8opD6lVSG0VN56YYoWRGyt7bDK/8XlvKHO22vKYkUZixV8hYUpuH+jNzbwvURaxSioiTcVjXGixJFKd6lhMmS3g7h1E+Sgw1qpzmDnk6C/hB4iOjMIDUWq2YGqjANTbFlj83i4KVWyIa252M+YiFM9MFUM4UYVJEujotI/M4uni87T/BfhIYgIJd7ZUOvNScnEBAkgADm4m/F8f4wSW0Ka8xsPEyispFiWbM34EjfsyJvqGN6QvcNbhG9PPdZa06+01Ai1/N2PslGhHNsSZBW4d8acY4Pho2djrmFaCQ2OCPdj1ZGH0vmIy/iM8rf/98LoRR6MqIAULohijAxDdnXYXvVzJ6eGXKUbndI6A=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2019 10:02:55.9856 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d35ecf3-9dc6-41f3-4d75-08d70b671b28
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3927
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bffF/3nEEAdfRalgALGGJVQgVyD1AkLM1AaQjA87T3w=;
 b=DcTXHuVlcN9K0fRibH5Yiyq3lBYvc4wYUMDo7ZX/fhUHJyfPKKgcfvj8e+ZSq3xbatbgyHuZFXGcZuS2badDEQA0TcElvIcS6q9KmXy8Ae5Ih7wBClgSZ8I5iX1EGAsRAMBJrnYgp0SyKfNp42ocsc5B4MmZeZVk7ddxGD8OpCk=
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
Cc: Chengming Gui <Jack.Gui@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

YWRkIG11dGV4IGxvY2sgdG8gcHJvdGVjdCBkcG0gY29udGV4dCByZXNvdXJjZQoKU2lnbmVkLW9m
Zi1ieTogQ2hlbmdtaW5nIEd1aSA8SmFjay5HdWlAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgICAgIHwgNSArKystLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaCB8IDEgKwogZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jICAgICB8IDggKysrKysrKysKIDMgZmlsZXMgY2hh
bmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKaW5kZXggNjkzNDE0Zi4uYWMwMTk2MCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwpAQCAtNjY0LDYgKzY2NCw3
IEBAIHN0YXRpYyBpbnQgc211X3N3X2luaXQodm9pZCAqaGFuZGxlKQogCXNtdS0+d2F0ZXJtYXJr
c19iaXRtYXAgPSAwOwogCXNtdS0+cG93ZXJfcHJvZmlsZV9tb2RlID0gUFBfU01DX1BPV0VSX1BS
T0ZJTEVfQk9PVFVQX0RFRkFVTFQ7CiAJc211LT5kZWZhdWx0X3Bvd2VyX3Byb2ZpbGVfbW9kZSA9
IFBQX1NNQ19QT1dFUl9QUk9GSUxFX0JPT1RVUF9ERUZBVUxUOworCW11dGV4X2luaXQoJnNtdS0+
c211X2RwbS5tdXRleCk7CiAJc211LT5zbXVfZHBtLmRlZmF1bHRfc2Nsa19saW1pdCA9IDA7CiAJ
c211LT5zbXVfZHBtLnBlYWtfc2Nsa19saW1pdCA9IDA7CiAKQEAgLTE0NzEsOSArMTQ3Miw5IEBA
IGVudW0gYW1kX2RwbV9mb3JjZWRfbGV2ZWwgc211X2dldF9wZXJmb3JtYW5jZV9sZXZlbChzdHJ1
Y3Qgc211X2NvbnRleHQgKnNtdSkKIAlpZiAoIXNtdV9kcG1fY3R4LT5kcG1fY29udGV4dCkKIAkJ
cmV0dXJuIC1FSU5WQUw7CiAKLQltdXRleF9sb2NrKCYoc211LT5tdXRleCkpOworCW11dGV4X2xv
Y2soJihzbXVfZHBtX2N0eC0+bXV0ZXgpKTsKIAlsZXZlbCA9IHNtdV9kcG1fY3R4LT5kcG1fbGV2
ZWw7Ci0JbXV0ZXhfdW5sb2NrKCYoc211LT5tdXRleCkpOworCW11dGV4X3VubG9jaygmKHNtdV9k
cG1fY3R4LT5tdXRleCkpOwogCiAJcmV0dXJuIGxldmVsOwogfQpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaCBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgKaW5kZXggYWNiNTIyYi4uYjZmY2FkMiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUu
aAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oCkBA
IC00NDksNiArNDQ5LDcgQEAgc3RydWN0IHNtdV9kcG1fY29udGV4dCB7CiAJc3RydWN0IHNtdV9w
b3dlcl9zdGF0ZSAqZHBtX3JlcXVlc3RfcG93ZXJfc3RhdGU7CiAJc3RydWN0IHNtdV9wb3dlcl9z
dGF0ZSAqZHBtX2N1cnJlbnRfcG93ZXJfc3RhdGU7CiAJc3RydWN0IG1jbG9ja19sYXRlbmN5X3Rh
YmxlICptY2xrX2xhdGVuY3lfdGFibGU7CisJc3RydWN0IG11dGV4IG11dGV4OwogfTsKIAogc3Ry
dWN0IHNtdV9wb3dlcl9nYXRlIHsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L25hdmkxMF9wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkx
MF9wcHQuYwppbmRleCBiNGRlYjllLi4yMDc5MDk3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvbmF2aTEwX3BwdC5jCkBAIC02OTMsNyArNjkzLDkgQEAgc3RhdGljIGludCBuYXZp
MTBfZm9yY2VfY2xrX2xldmVscyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIAljYXNlIFNNVV9H
RlhDTEs6CiAJY2FzZSBTTVVfU0NMSzoKIAkJaWYgKHNtdV9kcG1fY3R4LT5wZWFrX3NjbGtfbGlt
aXQpIHsKKwkJCW11dGV4X2xvY2soJnNtdV9kcG1fY3R4LT5tdXRleCk7CiAJCQltYXhfZnJlcSA9
IHNtdV9kcG1fY3R4LT5wZWFrX3NjbGtfbGltaXQ7CisJCQltdXRleF91bmxvY2soJnNtdV9kcG1f
Y3R4LT5tdXRleCk7CiAJCQlyZXQgPSBzbXVfZ2V0X2RwbV9mcmVxX2J5X2luZGV4KHNtdSwgY2xr
X3R5cGUsIHNvZnRfbWluX2xldmVsLCAmbWluX2ZyZXEpOwogCQkJaWYgKHJldCkKIAkJCQlyZXR1
cm4gc2l6ZTsKQEAgLTg3OCw3ICs4ODAsOSBAQCBzdGF0aWMgaW50IG5hdmkxMF91bmZvcmNlX2Rw
bV9sZXZlbHMoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCiAJCQlyZXR1cm4gcmV0OwogCiAJCWlm
IChjbGtfdHlwZSA9PSBTTVVfR0ZYQ0xLICYmIHNtdV9kcG1fY3R4LT5kZWZhdWx0X3NjbGtfbGlt
aXQgIT0gMCkgeworCQkJbXV0ZXhfbG9jaygmc211X2RwbV9jdHgtPm11dGV4KTsKIAkJCW1heF9m
cmVxID0gc211X2RwbV9jdHgtPmRlZmF1bHRfc2Nsa19saW1pdDsKKwkJCW11dGV4X3VubG9jaygm
c211X2RwbV9jdHgtPm11dGV4KTsKIAkJCXJldCA9IHNtdV9nZXRfZHBtX2ZyZXFfcmFuZ2Uoc211
LCBTTVVfR0ZYQ0xLLAogCQkJCQkJICAgICAmbWluX2ZyZXEsIE5VTEwpOwogCQkJaWYgKHJldCkK
QEAgLTg4OCw3ICs4OTIsOSBAQCBzdGF0aWMgaW50IG5hdmkxMF91bmZvcmNlX2RwbV9sZXZlbHMo
c3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCiAJCWlmIChyZXQpCiAJCQlyZXR1cm4gcmV0OwogCX0K
KwltdXRleF9sb2NrKCZzbXVfZHBtX2N0eC0+bXV0ZXgpOwogCXNtdV9kcG1fY3R4LT5wZWFrX3Nj
bGtfbGltaXQgPSAwOworCW11dGV4X3VubG9jaygmc211X2RwbV9jdHgtPm11dGV4KTsKIAogCXJl
dHVybiByZXQ7CiB9CkBAIC0xNTcxLDYgKzE1NzcsNyBAQCBzdGF0aWMgaW50IG5hdmkxMF9hcHBs
eV9jbG9ja3NfYWRqdXN0X3J1bGVzKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQogCXN0cnVjdCBz
bXVfZHBtX2NvbnRleHQgKnNtdV9kcG1fY3R4ID0gJihzbXUtPnNtdV9kcG0pOwogCXN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2ID0gc211LT5hZGV2OwogCisJbXV0ZXhfbG9jaygmc211X2RwbV9j
dHgtPm11dGV4KTsKIAlpZiAoc211X2RwbV9jdHgtPmRlZmF1bHRfc2Nsa19saW1pdCA9PSAwKSB7
CiAJCXJldCA9IHNtdV9nZXRfZHBtX2ZyZXFfcmFuZ2Uoc211LCBTTVVfU0NMSywgTlVMTCwKIAkJ
CQkJICAgICAmc211X2RwbV9jdHgtPmRlZmF1bHRfc2Nsa19saW1pdCk7CkBAIC0xNTg4LDYgKzE1
OTUsNyBAQCBzdGF0aWMgaW50IG5hdmkxMF9hcHBseV9jbG9ja3NfYWRqdXN0X3J1bGVzKHN0cnVj
dCBzbXVfY29udGV4dCAqc211KQogCX0gZWxzZSBpZiAoc211X2RwbV9jdHgtPmRwbV9sZXZlbCAh
PSBBTURfRFBNX0ZPUkNFRF9MRVZFTF9QUk9GSUxFX1BFQUsgJiYgc211X2RwbV9jdHgtPnBlYWtf
c2Nsa19saW1pdCAhPSAwKSB7CiAJCXNtdV9kcG1fY3R4LT5wZWFrX3NjbGtfbGltaXQgPSAwOwog
CX0KKwltdXRleF91bmxvY2soJnNtdV9kcG1fY3R4LT5tdXRleCk7CiAKIAlyZXR1cm4gMDsKIH0K
LS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
