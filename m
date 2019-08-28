Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3ECA0283
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 15:03:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333D489C63;
	Wed, 28 Aug 2019 13:03:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730083.outbound.protection.outlook.com [40.107.73.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CF789C5E
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 13:03:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PXLtNrsqgfUwDEFij5sxFnenXEHZ2vlOkqjVoTxNEu465O/8X8iJzH5AQvvjq2yM74ntAVa5Zk67EWA9pBD0eabEpnKu60RAOegsLg8zW+eXwtx470sVuVgtevGX7SxL36JKgaMRBNKKLhA8LDmfUobv8FVaA/ns9jyTVAwwkvOmWO+lUiTE08y5cON5l7PdtlpljjY78Mb7uusg1nHd65Y5L9XefahJCXjAQMqPwHC2SUBrLYvoTjg+Q7fsTIsPdyK7NgO/eK0p0oLAFGqpqeqUI45ja3BHINmEHqfZ1dUXeQAnvsLrr82clTfNrWiT4y6/TAZdqxVtO1TGdBg2Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wJ5yPckimKW3kDe1dlceaDjT/QDhn8X8u7juy4NgXVU=;
 b=TzVK6pcnRsNQGZA6io1D4KejkkkelInyffw8l3l9R+VJ2Qgq8psH9ZzZNjyLqGJUeXyV5IOLCex3+0XL0U2E4tGBs8Zo8h0uHzsLx4Crcm96fDJtR2pmNfoO/ufQT5NuXAZcrx052FGO6VIcUWcOEXJfZp4KvyPlJ9ZTg5aYDlg8taQO55KRNOVDm+9RrelsnTZq/QaBQHQO9Kw8yR8h0gG4Bdx3MJPWI6S0b4XvLKWGh3PnbvOtMXbcJdKf6JHIdzY9Z7PWhCSVzHlqLbH0RVrivnMZQI5MbakdIhzCZDm1uHYw4BQm20B38uX8MGQE24keHpsmxP+YOX9wIoEIZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0013.namprd12.prod.outlook.com
 (2603:10b6:301:4a::23) by SN6PR12MB2719.namprd12.prod.outlook.com
 (2603:10b6:805:70::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.19; Wed, 28 Aug
 2019 13:03:47 +0000
Received: from BY2NAM03FT047.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::202) by MWHPR1201CA0013.outlook.office365.com
 (2603:10b6:301:4a::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Wed, 28 Aug 2019 13:03:46 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT047.mail.protection.outlook.com (10.152.85.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 28 Aug 2019 13:03:46 +0000
Received: from hawzhang-All-Series.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Wed, 28 Aug 2019 08:03:43 -0500
From: Hawking Zhang <Hawking.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Tao Zhou <tao.zhou1@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>
Subject: [PATCH 6/7] drm/amdgpu: add ras_late_init callback function for nbio
 v7_4
Date: Wed, 28 Aug 2019 21:03:14 +0800
Message-ID: <1566997395-7185-6-git-send-email-Hawking.Zhang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566997395-7185-1-git-send-email-Hawking.Zhang@amd.com>
References: <1566997395-7185-1-git-send-email-Hawking.Zhang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(39860400002)(396003)(2980300002)(428003)(189003)(199004)(305945005)(4326008)(426003)(26005)(7696005)(51416003)(76176011)(186003)(2616005)(81156014)(478600001)(16586007)(8936002)(8676002)(11346002)(446003)(336012)(126002)(476003)(486006)(6636002)(2906002)(48376002)(81166006)(50466002)(50226002)(5660300002)(356004)(110136005)(6666004)(86362001)(53416004)(47776003)(316002)(36756003)(70206006)(70586007)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2719; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a16946f-21af-4300-8899-08d72bb82987
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:SN6PR12MB2719; 
X-MS-TrafficTypeDiagnostic: SN6PR12MB2719:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2719DA86272C35EB62A1BC33FCA30@SN6PR12MB2719.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:556;
X-Forefront-PRVS: 014304E855
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 2uwcyEDIuquj6iJSirX61Dsu4S9wKPeCG+wkMbFssfNFFCW/D1N3D1Wus2Fy7O9uDaTaLDUBsiElc9aE7L6A/XXeMd9W0i8ODZcqR57b85Rh4pZxze93WvQMkBUMYf12tpXx9g8L1cx5w0uy0uJs50FR50wIscrQqskIPeB3VBJOuLXHwlto2ZA2WyFed+coVOb299jGpPRYedJGbSHMBKPUapcZnl51yW1V54eqbn+RDrUvN92YewzY9rHeZxxcVLc3nsuzzSyf7cn+qTU+ATI1LVWx2VKEVzvGhAdmPEOQGrUB9VjNhlQzW1lr8FQntqX2822ko6TUu/+r0NYVd6rEwTMQkb4vOzcbkojSpiTZEWuJU7IG2Gp/jnutJY27H0E3xa7VQzcsmCZ+5UqAJDcZ0LeENG9X8C3thL6Lxe8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2019 13:03:46.4247 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a16946f-21af-4300-8899-08d72bb82987
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2719
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wJ5yPckimKW3kDe1dlceaDjT/QDhn8X8u7juy4NgXVU=;
 b=xCipIkSOZTqekvhEJ3HjGvSiKKBQKxOFAw8CRdja9DQT4ApX8QgaTV0QqWCxMM4lgMp5JumgNoBIx8fFfai1FMMDi9P3wY0l8VmYnBgoDACZeIfnVb0st+ivRSV4eALPIXCepEWRi5Wc8VgGClUOahC8Z+a2iYIxnDXy1hyepzE=
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

cmFzX2xhdGVfaW5pdCBjYWxsYmFjayBmdW5jdGlvbiB3aWxsIGJlIHVzZWQgdG8gZG8gY29tbW9u
IHJhcwppbml0IGluIGxhdGUgaW5pdCBwaGFzZS4KClNpZ25lZC1vZmYtYnk6IEhhd2tpbmcgWmhh
bmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfbmJpby5oIHwgIDIgKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25iaW9f
djdfNC5jICAgfCA0MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBj
aGFuZ2VkLCA0MyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X25iaW8uaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9uYmlvLmgKaW5kZXggYTA0YzVlYS4uNTEwNzhkYTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9uYmlvLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X25iaW8uaApAQCAtODEsMTIgKzgxLDE0IEBAIHN0cnVjdCBhbWRncHVfbmJp
b19mdW5jcyB7CiAJdm9pZCAoKmhhbmRsZV9yYXNfZXJyX2V2ZW50X2F0aHViX2ludHJfbm9fYmlm
cmluZykoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwogCWludCAoKmluaXRfcmFzX2NvbnRy
b2xsZXJfaW50ZXJydXB0KShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7CiAJaW50ICgqaW5p
dF9yYXNfZXJyX2V2ZW50X2F0aHViX2ludGVycnVwdCkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpOworCWludCAoKnJhc19sYXRlX2luaXQpKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsK
IH07CiAKIHN0cnVjdCBhbWRncHVfbmJpbyB7CiAJY29uc3Qgc3RydWN0IG5iaW9faGRwX2ZsdXNo
X3JlZyAqaGRwX2ZsdXNoX3JlZzsKIAlzdHJ1Y3QgYW1kZ3B1X2lycV9zcmMgcmFzX2NvbnRyb2xs
ZXJfaXJxOwogCXN0cnVjdCBhbWRncHVfaXJxX3NyYyByYXNfZXJyX2V2ZW50X2F0aHViX2lycTsK
KwlzdHJ1Y3QgcmFzX2NvbW1vbl9pZiAqcmFzX2lmOwogCWNvbnN0IHN0cnVjdCBhbWRncHVfbmJp
b19mdW5jcyAqZnVuY3M7CiB9OwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9uYmlvX3Y3XzQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25iaW9fdjdfNC5j
CmluZGV4IGZhZjkzMDAuLjM2N2Y5ZDYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L25iaW9fdjdfNC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25iaW9f
djdfNC5jCkBAIC0yMyw2ICsyMyw3IEBACiAjaW5jbHVkZSAiYW1kZ3B1LmgiCiAjaW5jbHVkZSAi
YW1kZ3B1X2F0b21iaW9zLmgiCiAjaW5jbHVkZSAibmJpb192N180LmgiCisjaW5jbHVkZSAiYW1k
Z3B1X3Jhcy5oIgogCiAjaW5jbHVkZSAibmJpby9uYmlvXzdfNF9vZmZzZXQuaCIKICNpbmNsdWRl
ICJuYmlvL25iaW9fN180X3NoX21hc2suaCIKQEAgLTQ2OCw2ICs0NjksNDUgQEAgc3RhdGljIGlu
dCBuYmlvX3Y3XzRfaW5pdF9yYXNfZXJyX2V2ZW50X2F0aHViX2ludGVycnVwdCAoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmEKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIGludCBuYmlvX3Y3XzRfcmFz
X2xhdGVfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKK3sKKwlpbnQgcjsKKwlzdHJ1
Y3QgcmFzX2loX2lmIGloX2luZm87CisJc3RydWN0IHJhc19mc19pZiBmc19pbmZvID0geworCQku
c3lzZnNfbmFtZSA9ICJuYmlvX2Vycl9jb3VudCIsCisJCS5kZWJ1Z2ZzX25hbWUgPSAibmJpb19l
cnJfaW5qZWN0IiwKKwl9OworCisJaWYgKCFhZGV2LT5uYmlvLnJhc19pZikgeworCQlhZGV2LT5u
YmlvLnJhc19pZiA9IGttYWxsb2Moc2l6ZW9mKHN0cnVjdCByYXNfY29tbW9uX2lmKSwgR0ZQX0tF
Uk5FTCk7CisJCWlmICghYWRldi0+bmJpby5yYXNfaWYpCisJCQlyZXR1cm4gLUVOT01FTTsKKwkJ
YWRldi0+bmJpby5yYXNfaWYtPmJsb2NrID0gQU1ER1BVX1JBU19CTE9DS19fUENJRV9CSUY7CisJ
CWFkZXYtPm5iaW8ucmFzX2lmLT50eXBlID0gQU1ER1BVX1JBU19FUlJPUl9fTVVMVElfVU5DT1JS
RUNUQUJMRTsKKwkJYWRldi0+bmJpby5yYXNfaWYtPnN1Yl9ibG9ja19pbmRleCA9IDA7CisJCXN0
cmNweShhZGV2LT5uYmlvLnJhc19pZi0+bmFtZSwgIm5iaW8iKTsKKwl9CisJaWhfaW5mby5oZWFk
ID0gZnNfaW5mby5oZWFkID0gKmFkZXYtPm5iaW8ucmFzX2lmOworCXIgPSBhbWRncHVfcmFzX2xh
dGVfaW5pdChhZGV2LCBhZGV2LT5uYmlvLnJhc19pZiwKKwkJCQkgJmZzX2luZm8sICZpaF9pbmZv
KTsKKwlpZiAocikKKwkJZ290byBmcmVlOworCisJaWYgKGFtZGdwdV9yYXNfaXNfc3VwcG9ydGVk
KGFkZXYsIGFkZXYtPm5iaW8ucmFzX2lmLT5ibG9jaykpIHsKKwkJciA9IGFtZGdwdV9pcnFfZ2V0
KGFkZXYsICZhZGV2LT5uYmlvLnJhc19jb250cm9sbGVyX2lycSwgMCk7CisJCWlmIChyKQorCQkJ
Z290byBmcmVlOworCQlyID0gYW1kZ3B1X2lycV9nZXQoYWRldiwgJmFkZXYtPm5iaW8ucmFzX2Vy
cl9ldmVudF9hdGh1Yl9pcnEsIDApOworCQlpZiAocikKKwkJCWdvdG8gZnJlZTsKKwl9CisKKwly
ZXR1cm4gMDsKK2ZyZWU6CisJa2ZyZWUoYWRldi0+bmJpby5yYXNfaWYpOworCXJldHVybiByOwor
fQorCiBjb25zdCBzdHJ1Y3QgYW1kZ3B1X25iaW9fZnVuY3MgbmJpb192N180X2Z1bmNzID0gewog
CS5nZXRfaGRwX2ZsdXNoX3JlcV9vZmZzZXQgPSBuYmlvX3Y3XzRfZ2V0X2hkcF9mbHVzaF9yZXFf
b2Zmc2V0LAogCS5nZXRfaGRwX2ZsdXNoX2RvbmVfb2Zmc2V0ID0gbmJpb192N180X2dldF9oZHBf
Zmx1c2hfZG9uZV9vZmZzZXQsCkBAIC00OTMsNCArNTMzLDUgQEAgY29uc3Qgc3RydWN0IGFtZGdw
dV9uYmlvX2Z1bmNzIG5iaW9fdjdfNF9mdW5jcyA9IHsKIAkuaGFuZGxlX3Jhc19lcnJfZXZlbnRf
YXRodWJfaW50cl9ub19iaWZyaW5nID0gbmJpb192N180X2hhbmRsZV9yYXNfZXJyX2V2ZW50X2F0
aHViX2ludHJfbm9fYmlmcmluZywKIAkuaW5pdF9yYXNfY29udHJvbGxlcl9pbnRlcnJ1cHQgPSBu
YmlvX3Y3XzRfaW5pdF9yYXNfY29udHJvbGxlcl9pbnRlcnJ1cHQsCiAJLmluaXRfcmFzX2Vycl9l
dmVudF9hdGh1Yl9pbnRlcnJ1cHQgPSBuYmlvX3Y3XzRfaW5pdF9yYXNfZXJyX2V2ZW50X2F0aHVi
X2ludGVycnVwdCwKKwkucmFzX2xhdGVfaW5pdCA9IG5iaW9fdjdfNF9yYXNfbGF0ZV9pbml0LAog
fTsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
