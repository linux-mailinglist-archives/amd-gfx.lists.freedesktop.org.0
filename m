Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 015B1A1B74
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 15:31:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8682A6E0E2;
	Thu, 29 Aug 2019 13:30:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820070.outbound.protection.outlook.com [40.107.82.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194E96E0E2
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 13:30:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VyIpjnaweiPCzcgeQQZOXaRPaN29SVrGUpbpayskaO4J80cLIIcMWfJghciQReoiAHFldY8PnamDij4o8FN/NtaFovHmQhes2usLKMznWuh1b/HWsZWMAdEeNyHEbQyIo3rDRvrHFBB5+Dxaz9VUmPmrdOdA8xq4KPhJOp26Wz2Ar0maJFvwo6+rg3fIw/RKPU4YqfhdpfksobdRE4pu0p3O2iMDi0/uPvq0y9l3BaAZycQp226cUbpa/ciXOzjgQHxckx9gxs/seemMfFMb0EcqMlFMasDPP9QrtpS9objUjXDOC3oeA/eEqdff2LGH+8OK3PjLIoqt7nCq9ZDQOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88InmMEYr/fiyIkzQHGydr586EsEP7d+/JX9vs9PoLo=;
 b=AySOzDc2nthsGTCruU7265fCWaZszhqlgo7h4OFZPEeBiUgLuHnOupOwpc1f/hy7W/OJhkuuMvce0YCstMrwW6CKJSCDuyec80yKjRBNIFQuJe1Aw2N/F45VUqW3jz3hTDnF8j+SnWqNEm6MOfRg7I1L10mv02qk3iJtDu4CX56oILN+9/QB1OI93gpgf+Cn1Z9aLNsYRS87uwG1pfAsGe/1VFWC9FnMQ6C60s6dmN9lLWhrFsUgsD2uHigpI8CUXM+t/ZVfrPyeRuCUqDK5PhS9fcz5r8ygxTPbE7cit/PKc0BtKhBWv/VvsPATKo1Pxt1Bu1Ln8r9WwsVB7MngOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR12CA0070.namprd12.prod.outlook.com (2603:10b6:300:103::32)
 by CY4PR12MB1528.namprd12.prod.outlook.com (2603:10b6:910:6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.18; Thu, 29 Aug
 2019 13:30:56 +0000
Received: from BY2NAM03FT049.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::200) by MWHPR12CA0070.outlook.office365.com
 (2603:10b6:300:103::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.18 via Frontend
 Transport; Thu, 29 Aug 2019 13:30:56 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT049.mail.protection.outlook.com (10.152.85.177) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Thu, 29 Aug 2019 13:30:55 +0000
Received: from hawzhang-All-Series.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Thu, 29 Aug 2019 08:30:54 -0500
From: Hawking Zhang <Hawking.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, 
 Tao Zhou <tao.zhou1@amd.com>, Guchun Chen <guchun.chen@amd.com>
Subject: [PATCH 2/7] drm/amdgpu: switch to amdgpu_ras_late_init for gfx v9
 block (v2)
Date: Thu, 29 Aug 2019 21:30:27 +0800
Message-ID: <1567085432-27452-2-git-send-email-Hawking.Zhang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567085432-27452-1-git-send-email-Hawking.Zhang@amd.com>
References: <1567085432-27452-1-git-send-email-Hawking.Zhang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(396003)(136003)(2980300002)(428003)(199004)(189003)(76176011)(7696005)(51416003)(50226002)(4326008)(446003)(36756003)(11346002)(2616005)(486006)(476003)(126002)(16586007)(316002)(110136005)(8936002)(2906002)(48376002)(50466002)(8676002)(86362001)(81156014)(81166006)(53936002)(305945005)(478600001)(47776003)(26005)(426003)(186003)(336012)(6636002)(70206006)(5660300002)(6666004)(356004)(14444005)(53416004)(70586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1528; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0710dee6-ee6c-498d-d5f4-08d72c851f20
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:CY4PR12MB1528; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1528:
X-Microsoft-Antispam-PRVS: <CY4PR12MB15280A32CAC0F4D0B45CA627FCA20@CY4PR12MB1528.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:499;
X-Forefront-PRVS: 0144B30E41
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: +HYmanNkxHHIEhvAcloZJjLWXNANrIVu6wNOwSOpz8IoAEk1BvYM7p2Yt7/S4shFMO18x4lhMKZ/r9/FN8fNOFWj78PzxQPMg5eMmtXA3bVYr8euAEjYOXcyV8nPvRNz8ZtwvQj8qzjARkGbEXUI3Vze04kvvOts3qxNuM+8tIWuJ2vCEQeGIB12VCux9+RCtszxHv6H/vvu2xKUxeruorHmgfU+1nkU7ROQEfNulsgcbYZ+mZ70TTMmhdadZnKff+741uNOZW4o0vu0kwKyRRWuLnxHbxEASuJHDYeVV/C8m+S6uNW5Ehq6nZd2LDi6giZaSw5n0VajdcdZHQR1jl2vxwS7qC5SwbiAVabMUbjq/kCjCahr6P358b14ziDOlo44DzV0zw7gU5tadmzKy0Ik7+NxmNOVj8jwurOgXC8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2019 13:30:55.9125 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0710dee6-ee6c-498d-d5f4-08d72c851f20
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1528
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88InmMEYr/fiyIkzQHGydr586EsEP7d+/JX9vs9PoLo=;
 b=b88yWYpufMb3E4hEwJe3hNbXyaSGMs0Lf3NUKtQ3+nsqsf8a4TgSJFtXFPPFeW7X5QmNE0OudCMrqa3tMxiSv5+50jjJqjA8ho0AOYX2P6F0xZ+twIm9dixcJPJasLFY4//lPTWaxtb/snCjwAy0Qa5nL6iaYHZtaq8IoE0WJ/I=
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
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Y2FsbCBoZWxwZXIgZnVuY3Rpb24gaW4gbGF0ZSBpbml0IHBoYXNlIHRvIGhhbmRsZSByYXMgaW5p
dApmb3IgZ2Z4IGlwIGJsb2NrCgp2MjogY2FsbCByYXNfbGF0ZV9maW5pIHRvIGRvIGNsZWFuIHVw
IHdoZW4gZmFpbCB0byBlbmFibGUgaW50ZXJydXB0CgpTaWduZWQtb2ZmLWJ5OiBIYXdraW5nIFpo
YW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4X3Y5XzAuYyB8IDkyICsrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgNzEgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKaW5kZXggOTBiOTAwZi4uNWIxODY0MiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCkBAIC00Mzg5LDcgKzQzODksNiBAQCBzdGF0
aWMgaW50IGdmeF92OV8wX3Byb2Nlc3NfcmFzX2RhdGFfY2Ioc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsCiBzdGF0aWMgaW50IGdmeF92OV8wX2VjY19sYXRlX2luaXQodm9pZCAqaGFuZGxlKQog
ewogCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNlICop
aGFuZGxlOwotCXN0cnVjdCByYXNfY29tbW9uX2lmICoqcmFzX2lmID0gJmFkZXYtPmdmeC5yYXNf
aWY7CiAJc3RydWN0IHJhc19paF9pZiBpaF9pbmZvID0gewogCQkuY2IgPSBnZnhfdjlfMF9wcm9j
ZXNzX3Jhc19kYXRhX2NiLAogCX07CkBAIC00Mzk3LDE4ICs0Mzk2LDE4IEBAIHN0YXRpYyBpbnQg
Z2Z4X3Y5XzBfZWNjX2xhdGVfaW5pdCh2b2lkICpoYW5kbGUpCiAJCS5zeXNmc19uYW1lID0gImdm
eF9lcnJfY291bnQiLAogCQkuZGVidWdmc19uYW1lID0gImdmeF9lcnJfaW5qZWN0IiwKIAl9Owot
CXN0cnVjdCByYXNfY29tbW9uX2lmIHJhc19ibG9jayA9IHsKLQkJLmJsb2NrID0gQU1ER1BVX1JB
U19CTE9DS19fR0ZYLAotCQkudHlwZSA9IEFNREdQVV9SQVNfRVJST1JfX01VTFRJX1VOQ09SUkVD
VEFCTEUsCi0JCS5zdWJfYmxvY2tfaW5kZXggPSAwLAotCQkubmFtZSA9ICJnZngiLAotCX07CiAJ
aW50IHI7CiAKLQlpZiAoIWFtZGdwdV9yYXNfaXNfc3VwcG9ydGVkKGFkZXYsIEFNREdQVV9SQVNf
QkxPQ0tfX0dGWCkpIHsKLQkJYW1kZ3B1X3Jhc19mZWF0dXJlX2VuYWJsZV9vbl9ib290KGFkZXYs
ICZyYXNfYmxvY2ssIDApOwotCQlyZXR1cm4gMDsKKwlpZiAoIWFkZXYtPmdmeC5yYXNfaWYpIHsK
KwkJYWRldi0+Z2Z4LnJhc19pZiA9IGttYWxsb2Moc2l6ZW9mKHN0cnVjdCByYXNfY29tbW9uX2lm
KSwgR0ZQX0tFUk5FTCk7CisJCWlmICghYWRldi0+Z2Z4LnJhc19pZikKKwkJCXJldHVybiAtRU5P
TUVNOworCQlhZGV2LT5nZngucmFzX2lmLT5ibG9jayA9IEFNREdQVV9SQVNfQkxPQ0tfX0dGWDsK
KwkJYWRldi0+Z2Z4LnJhc19pZi0+dHlwZSA9IEFNREdQVV9SQVNfRVJST1JfX01VTFRJX1VOQ09S
UkVDVEFCTEU7CisJCWFkZXYtPmdmeC5yYXNfaWYtPnN1Yl9ibG9ja19pbmRleCA9IDA7CisJCXN0
cmNweShhZGV2LT5nZngucmFzX2lmLT5uYW1lLCAiZ2Z4Iik7CiAJfQorCWZzX2luZm8uaGVhZCA9
IGloX2luZm8uaGVhZCA9ICphZGV2LT5nZngucmFzX2lmOwogCiAJciA9IGdmeF92OV8wX2RvX2Vk
Y19nZHNfd29ya2Fyb3VuZHMoYWRldik7CiAJaWYgKHIpCkBAIC00NDE5LDcxICs0NDE4LDIyIEBA
IHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfZWNjX2xhdGVfaW5pdCh2b2lkICpoYW5kbGUpCiAJaWYgKHIp
CiAJCXJldHVybiByOwogCi0JLyogaGFuZGxlIHJlc3VtZSBwYXRoLiAqLwotCWlmICgqcmFzX2lm
KSB7Ci0JCS8qIHJlc2VuZCByYXMgVEEgZW5hYmxlIGNtZCBkdXJpbmcgcmVzdW1lLgotCQkgKiBw
cmVwYXJlIHRvIGhhbmRsZSBmYWlsdXJlLgotCQkgKi8KLQkJaWhfaW5mby5oZWFkID0gKipyYXNf
aWY7Ci0JCXIgPSBhbWRncHVfcmFzX2ZlYXR1cmVfZW5hYmxlX29uX2Jvb3QoYWRldiwgKnJhc19p
ZiwgMSk7Ci0JCWlmIChyKSB7Ci0JCQlpZiAociA9PSAtRUFHQUlOKSB7Ci0JCQkJLyogcmVxdWVz
dCBhIGdwdSByZXNldC4gd2lsbCBydW4gYWdhaW4uICovCi0JCQkJYW1kZ3B1X3Jhc19yZXF1ZXN0
X3Jlc2V0X29uX2Jvb3QoYWRldiwKLQkJCQkJCUFNREdQVV9SQVNfQkxPQ0tfX0dGWCk7Ci0JCQkJ
cmV0dXJuIDA7Ci0JCQl9Ci0JCQkvKiBmYWlsIHRvIGVuYWJsZSByYXMsIGNsZWFudXAgYWxsLiAq
LwotCQkJZ290byBpcnE7Ci0JCX0KLQkJLyogZW5hYmxlIHN1Y2Nlc3NmdWxseS4gY29udGludWUu
ICovCi0JCWdvdG8gcmVzdW1lOwotCX0KLQotCSpyYXNfaWYgPSBrbWFsbG9jKHNpemVvZigqKnJh
c19pZiksIEdGUF9LRVJORUwpOwotCWlmICghKnJhc19pZikKLQkJcmV0dXJuIC1FTk9NRU07Ci0K
LQkqKnJhc19pZiA9IHJhc19ibG9jazsKLQotCXIgPSBhbWRncHVfcmFzX2ZlYXR1cmVfZW5hYmxl
X29uX2Jvb3QoYWRldiwgKnJhc19pZiwgMSk7Ci0JaWYgKHIpIHsKLQkJaWYgKHIgPT0gLUVBR0FJ
TikgewotCQkJYW1kZ3B1X3Jhc19yZXF1ZXN0X3Jlc2V0X29uX2Jvb3QoYWRldiwKLQkJCQkJQU1E
R1BVX1JBU19CTE9DS19fR0ZYKTsKLQkJCXIgPSAwOwotCQl9Ci0JCWdvdG8gZmVhdHVyZTsKLQl9
Ci0KLQlpaF9pbmZvLmhlYWQgPSAqKnJhc19pZjsKLQlmc19pbmZvLmhlYWQgPSAqKnJhc19pZjsK
LQotCXIgPSBhbWRncHVfcmFzX2ludGVycnVwdF9hZGRfaGFuZGxlcihhZGV2LCAmaWhfaW5mbyk7
CisJciA9IGFtZGdwdV9yYXNfbGF0ZV9pbml0KGFkZXYsIGFkZXYtPmdmeC5yYXNfaWYsCisJCQkJ
ICZmc19pbmZvLCAmaWhfaW5mbyk7CiAJaWYgKHIpCi0JCWdvdG8gaW50ZXJydXB0OworCQlnb3Rv
IGZyZWU7CiAKLQlhbWRncHVfcmFzX2RlYnVnZnNfY3JlYXRlKGFkZXYsICZmc19pbmZvKTsKLQot
CXIgPSBhbWRncHVfcmFzX3N5c2ZzX2NyZWF0ZShhZGV2LCAmZnNfaW5mbyk7Ci0JaWYgKHIpCi0J
CWdvdG8gc3lzZnM7Ci1yZXN1bWU6Ci0JciA9IGFtZGdwdV9pcnFfZ2V0KGFkZXYsICZhZGV2LT5n
ZnguY3BfZWNjX2Vycm9yX2lycSwgMCk7Ci0JaWYgKHIpCi0JCWdvdG8gaXJxOworCWlmIChhbWRn
cHVfcmFzX2lzX3N1cHBvcnRlZChhZGV2LCBhZGV2LT5nZngucmFzX2lmLT5ibG9jaykpIHsKKwkJ
ciA9IGFtZGdwdV9pcnFfZ2V0KGFkZXYsICZhZGV2LT5nZnguY3BfZWNjX2Vycm9yX2lycSwgMCk7
CisJCWlmIChyKQorCQkJZ290byBsYXRlX2Zpbmk7CisJfQogCiAJcmV0dXJuIDA7Ci1pcnE6Ci0J
YW1kZ3B1X3Jhc19zeXNmc19yZW1vdmUoYWRldiwgKnJhc19pZik7Ci1zeXNmczoKLQlhbWRncHVf
cmFzX2RlYnVnZnNfcmVtb3ZlKGFkZXYsICpyYXNfaWYpOwotCWFtZGdwdV9yYXNfaW50ZXJydXB0
X3JlbW92ZV9oYW5kbGVyKGFkZXYsICZpaF9pbmZvKTsKLWludGVycnVwdDoKLQlhbWRncHVfcmFz
X2ZlYXR1cmVfZW5hYmxlKGFkZXYsICpyYXNfaWYsIDApOwotZmVhdHVyZToKLQlrZnJlZSgqcmFz
X2lmKTsKLQkqcmFzX2lmID0gTlVMTDsKK2xhdGVfZmluaToKKwlhbWRncHVfcmFzX2xhdGVfZmlu
aShhZGV2LCBhZGV2LT5nZngucmFzX2lmLCAmaWhfaW5mbyk7CitmcmVlOgorCWtmcmVlKGFkZXYt
PmdmeC5yYXNfaWYpOwogCXJldHVybiByOwogfQogCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
