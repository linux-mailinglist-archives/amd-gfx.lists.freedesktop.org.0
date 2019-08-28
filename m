Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E4EA0AFF
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 22:00:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA5989E65;
	Wed, 28 Aug 2019 20:00:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790051.outbound.protection.outlook.com [40.107.79.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712D989E65
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 20:00:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KxZ+Sy4aR3wejt1IY7L+7zkzhpiyH+gJ5vM+yGvlVtNTmv+X4wfiK0BdkibypzycdtQQ0g8H8iJR593W7n2krH4ez1lu2jwFzy1Wlk2QErw1fpSQim4mmNuwfVTIYoLAqFrOj8SncEwnp9nzU7TW15FxACz4d+KBmb9Vnd1nx7euI1nL0L5F4CYvdOPuKxUxQO2hHoYR6G/rIrI7bdLBJ5oCtKaOtbcsUdNvLDxgA7nN9FV2DEcMBDZtJpjJ1lLp+I4Xt/nxa09gXXDww3P1TvYdWs7I5Tl/jcBGxGeCHvmWHrKQWMETP7xnlhzRCwuy9hJwHGu4K0bYyZ4DlhOJ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4tNwtdY5lsJCOZIWxjvQSrcyvj6fQXypVBpU3cXl9w=;
 b=jWyjeD8VnOLO8tniWHKR23cXORnWmWou6MCVHX0b24nxZjBA+iodIwABErRR+8ir5bBmT4NzPcv8KzkYT+sIN052cdptdwZEa251Mt663SKuBu/AQ8UV2DSVNFG95nbmo1abXCsCfEfZr/5AoZrhTRffi4App1HRzgcTHLSDy39wfVR7X2S7+mnFMi/WVqMptksmbFdR6RW8HQLuNxyVE4vuFgrTY82lPiA/Bw6WJR3yFZ3SMEp2OZouxbyyrNeNiGnwIewrzSDkLEyNJHJjAMm4xpKxAhMWguex0wjxe6noTNOGk5Wl+uxQruoVLZ4ks5mSa2hZC+STYLDVlzROsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from SN1PR12CA0077.namprd12.prod.outlook.com (2603:10b6:802:20::48)
 by DM5PR12MB1276.namprd12.prod.outlook.com (2603:10b6:3:79::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.19; Wed, 28 Aug
 2019 20:00:45 +0000
Received: from BY2NAM03FT036.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::201) by SN1PR12CA0077.outlook.office365.com
 (2603:10b6:802:20::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.18 via Frontend
 Transport; Wed, 28 Aug 2019 20:00:45 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT036.mail.protection.outlook.com (10.152.85.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Wed, 28 Aug 2019 20:00:44 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; 
 Wed, 28 Aug 2019 15:00:42 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] dmr/amdgpu: Add system auto reboot to RAS.
Date: Wed, 28 Aug 2019 16:00:26 -0400
Message-ID: <1567022426-6612-2-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567022426-6612-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1567022426-6612-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(136003)(39860400002)(2980300002)(428003)(199004)(189003)(70206006)(70586007)(54906003)(426003)(16586007)(446003)(316002)(36756003)(2351001)(186003)(336012)(478600001)(14444005)(305945005)(86362001)(8676002)(8936002)(6666004)(356004)(48376002)(2906002)(81166006)(11346002)(4326008)(47776003)(44832011)(26005)(81156014)(126002)(50466002)(6916009)(51416003)(7696005)(53936002)(476003)(486006)(5660300002)(53416004)(50226002)(76176011)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1276; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f79b0e53-05a6-44e6-2ef1-08d72bf2699d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM5PR12MB1276; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1276:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1276649F1EBE5F697D615B23EAA30@DM5PR12MB1276.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 014304E855
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: lEvNofrDI8to+ojl5T2FmOSQkHvilQvZx6Fgy1Aq1Vbn8mfKQxiIuMdDUnlBkPJnERhK3Xyb6iXAVEt3Oylp1ASpemL8zJ5bZ4hpAURktM2yPNAd4h4ZcBqFsXfy0yDKyuRkttf9cQ55HaN5Tw3IXFPZiHIcbdf0aZpom2CrpFVqW87kWtycLhV33S4k1OAJEAVT6Z5EBcEcZIzGxhZ42R2bKBsKL0Wze247EiUUb7WfcrBBhJL00GPW8LH8H220SWlsIZb85pc4dCHwnNAPzW8D5JpKk5jN0oNODB83+pmXRFG4XX76GV5JaTeMsMEjgYFhummjEgSNf5BXSiAaxzCc6iziQndlOe6vDvQbybEOESCFsrxgzD1ewwezuzjvSo6KF537dKdhLKkD4iWjbI2/x/MAj25Pha8ZJ7MVblM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2019 20:00:44.8719 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f79b0e53-05a6-44e6-2ef1-08d72bf2699d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1276
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4tNwtdY5lsJCOZIWxjvQSrcyvj6fQXypVBpU3cXl9w=;
 b=oPdDeU9d3PwbIqfedRpq85fUpRfYeb1Pn2Z/x/vTNXL+vR+JFkyjdtt9f1vDv1D17pEYNcLksLiUPNphPBcmqwuLoOQSv5hP5m7ONL+rgMQRzcGhJ6jvL0UmxdZnYX6H0b6OTF5qj/J6DeXunPVOLYw2YXx+bbV6hU44zBPoG5Y=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
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
Cc: alexdeucher@gmail.com, ckoenig.leichtzumerken@gmail.com,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>, Hawking.Zhang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SW4gY2FzZSBvZiBSQVMgZXJyb3IgYWxsb3cgdXNlciBjb25maWd1cmUgYXV0byBzeXN0ZW0KcmVi
b290IHRocm91Z2ggcmFzX2N0cmwuClRoaXMgaXMgYWxzbyBwYXJ0IG9mIHRoZSB0ZW1wcm9yYXkg
d29yayBhcm91bmQgZm9yIHRoZSBSQVMKaGFuZyBwcm9ibGVtLgoKU2lnbmVkLW9mZi1ieTogQW5k
cmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIHwgMTggKysrKysrKysrKysrKysrKysr
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgICAgfCAxMCArKysrKysr
KystCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmggICAgfCAgMSArCiAz
IGZpbGVzIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKaW5kZXggM2VjZWUxMC4uZjFjZmY0
NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwpAQCAtMzgw
NSw2ICszODA1LDI0IEBAIGludCBhbWRncHVfZGV2aWNlX2dwdV9yZWNvdmVyKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LAogCWludCBpLCByID0gMDsKIAlib29sIGluX3Jhc19pbnRyID0gYW1k
Z3B1X3Jhc19pbnRyX3RyaWdnZXJlZCgpOwogCisJLyoKKwkgKiBGbHVzaCBSQU0gdG8gZGlzayBz
byB0aGF0IGFmdGVyIHJlYm9vdAorCSAqIHRoZSB1c2VyIGNhbiByZWFkIGxvZyBhbmQgc2VlIHdo
eSB0aGUgc3lzdGVtIHJlYm9vdGVkLgorCSAqCisJICogVXNpbmcgdXNlciBtb2RlIGFwcCBjYWxs
IGluc3RlYWQgb2Yga2VybmVsIEFQSXMgc3VjaCBhcworCSAqIGtzeXNfc3luY19oZWxwZXIgZm9y
IGJhY2t3YXJkIGNvbXBhcmFiaWxpdHkgd2l0aCBlYXJsaWVyCisJICoga2VybmVscyBpbnRvIHdo
aWNoIHRoaXMgaXMgYWxzbyBpbnRlbmRlZC4KKwkgKi8KKwlpZiAoaW5fcmFzX2ludHIgJiYgYW1k
Z3B1X3Jhc19nZXRfY29udGV4dChhZGV2KS0+cmVib290KSB7CisJCWNoYXIgKmVudnBbXSA9IHsg
IkhPTUU9LyIsIE5VTEwgfTsKKwkJY2hhciAqYXJndltdID0geyAiL2Jpbi9zeW5jIiwgTlVMTCB9
OworCisJCURSTV9XQVJOKCJFbWVyZ2VuY3kgcmVib290LiIpOworCisJCWNhbGxfdXNlcm1vZGVo
ZWxwZXIoYXJndlswXSwgYXJndiwgZW52cCwgVU1IX1dBSVRfUFJPQyk7CisJCWVtZXJnZW5jeV9y
ZXN0YXJ0KCk7CisJfQorCiAJbmVlZF9mdWxsX3Jlc2V0ID0gam9iX3NpZ25hbGVkID0gZmFsc2U7
CiAJSU5JVF9MSVNUX0hFQUQoJmRldmljZV9saXN0KTsKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3Jhcy5jCmluZGV4IDA4NmU2ZGYuLjQyM2ExYmEgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKQEAgLTMwLDYgKzMwLDcgQEAKICNpbmNsdWRlICJhbWRn
cHVfcmFzLmgiCiAjaW5jbHVkZSAiYW1kZ3B1X2F0b21maXJtd2FyZS5oIgogI2luY2x1ZGUgIml2
c3JjaWQvbmJpby9pcnFzcmNzX25iaWZfN180LmgiCisjaW5jbHVkZSA8bGludXgva21vZC5oPgog
CiBjb25zdCBjaGFyICpyYXNfZXJyb3Jfc3RyaW5nW10gPSB7CiAJIm5vbmUiLApAQCAtMTU0LDYg
KzE1NSw4IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3Jhc19kZWJ1Z2ZzX2N0cmxfcGFyc2VfZGF0YShz
dHJ1Y3QgZmlsZSAqZiwKIAkJb3AgPSAxOwogCWVsc2UgaWYgKHNzY2FuZihzdHIsICJpbmplY3Qg
JTMycyAlOHMiLCBibG9ja19uYW1lLCBlcnIpID09IDIpCiAJCW9wID0gMjsKKwllbHNlIGlmIChz
c2NhbmYoc3RyLCAicmVib290ICUzMnMiLCBibG9ja19uYW1lKSA9PSAxKQorCQlvcCA9IDM7CiAJ
ZWxzZSBpZiAoc3RyWzBdICYmIHN0clsxXSAmJiBzdHJbMl0gJiYgc3RyWzNdKQogCQkvKiBhc2Np
aSBzdHJpbmcsIGJ1dCBjb21tYW5kcyBhcmUgbm90IG1hdGNoZWQuICovCiAJCXJldHVybiAtRUlO
VkFMOwpAQCAtMjg3LDYgKzI5MCw5IEBAIHN0YXRpYyBzc2l6ZV90IGFtZGdwdV9yYXNfZGVidWdm
c19jdHJsX3dyaXRlKHN0cnVjdCBmaWxlICpmLCBjb25zdCBjaGFyIF9fdXNlciAqCiAJCS8qIGRh
dGEuaW5qZWN0LmFkZHJlc3MgaXMgb2Zmc2V0IGluc3RlYWQgb2YgYWJzb2x1dGUgZ3B1IGFkZHJl
c3MgKi8KIAkJcmV0ID0gYW1kZ3B1X3Jhc19lcnJvcl9pbmplY3QoYWRldiwgJmRhdGEuaW5qZWN0
KTsKIAkJYnJlYWs7CisJY2FzZSAzOgorCQlhbWRncHVfcmFzX2dldF9jb250ZXh0KGFkZXYpLT5y
ZWJvb3QgPSB0cnVlOworCQlicmVhazsKIAlkZWZhdWx0OgogCQlyZXQgPSAtRUlOVkFMOwogCQli
cmVhazsKQEAgLTE3MzMsNiArMTczOSw4IEBAIGludCBhbWRncHVfcmFzX2Zpbmkoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpCiB2b2lkIGFtZGdwdV9yYXNfZ2xvYmFsX3Jhc19pc3Ioc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7CiAJaWYgKGF0b21pY19jbXB4Y2hnKCZhbWRncHVfcmFz
X2luX2ludHIsIDAsIDEpID09IDApIHsKLQkJRFJNX1dBUk4oIlJBUyBldmVudCBvZiB0eXBlIEVS
UkVWRU5UX0FUSFVCX0lOVEVSUlVQVCBkZXRlY3RlZCEgU3RvcHBpbmcgYWxsIEdQVSBqb2JzLlxu
Iik7CisJCURSTV9XQVJOKCJSQVMgZXZlbnQgb2YgdHlwZSBFUlJFVkVOVF9BVEhVQl9JTlRFUlJV
UFQgZGV0ZWN0ZWQhXG4iKTsKKworCQlhbWRncHVfcmFzX3Jlc2V0X2dwdShhZGV2LCBmYWxzZSk7
CiAJfQogfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jh
cy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oCmluZGV4IGMwZTIy
YWYuLmUzZjA3NjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9yYXMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmgKQEAg
LTMzMyw2ICszMzMsNyBAQCBzdHJ1Y3QgYW1kZ3B1X3JhcyB7CiAJc3RydWN0IG11dGV4IHJlY292
ZXJ5X2xvY2s7CiAKIAl1aW50MzJfdCBmbGFnczsKKwlib29sIHJlYm9vdDsKIH07CiAKIHN0cnVj
dCByYXNfZnNfZGF0YSB7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
