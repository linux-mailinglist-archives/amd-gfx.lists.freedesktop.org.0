Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 208C7A3C30
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Aug 2019 18:39:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B207E6E377;
	Fri, 30 Aug 2019 16:39:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750089.outbound.protection.outlook.com [40.107.75.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F39E46E377
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Aug 2019 16:39:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JtIf1RkDEIumA+UeDU4qr4rPhIGqTrWogOaC/naodRAEZEAmquQTRIVFlsfnVy4Rt6JjzZDzy6Dgcr7b9I9h6rUYNhopVq7gnJ268lpOXVdUzlDem1SGopMw8RbShwlip4N+tSCi6BoAfKC05jsqAV8pgPuwWPdrvLyqQ8XfZP0NcMg4ZlgyI4wM+l49l3RWDY2uteLghmiEhz2TJvAf+75oP0cB6W+Um6Qx7mQNWWgP+Ps3frb9Vh9WEMX9kiyALKcWJFJvLncz5AYqB37rC0qypOoT8oI9LS0kJJuT8ss2W8W28E/9PN983bbvLp33TLycAUa0IRhJS8ZFBHp+6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/Y4Dy57hTAR6J6feEzw61ipXgr0VchrUBkdZBwEbgo=;
 b=JuYnScIjpg8cTx2oaM9+LcA6/qxD8BpiYDOk5ZvQkoq0VG2FCpabwNhr+mgVOlS4wqa0m8w0HyCDHvxLVQKIwQlfQTbg4NpQXo+TCp5xWuVTbu9WlBzqN7HEVhYOLJU1/RlZUMh7Sp+9jw1+DF+10YPed4FaZRq0UptHYFGDWuhIS8GH+fAcg3d2dsJzcps4xjHOSmFWLqa961vP/idf0XRhzQXd+MGDjKXWckKvMCmL4oGQ7bzDcDKJUId7KgWH8GMFUpPTG7y56UhOwy08vNxr5HIuNsZJ/+LlpiO0zL+RPTgDXCD2Sc0G3P5u/0BIs0WKjBGyhNrBx/ZA65rk5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from SN1PR12CA0059.namprd12.prod.outlook.com (2603:10b6:802:20::30)
 by BN6PR12MB1858.namprd12.prod.outlook.com (2603:10b6:404:fe::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.21; Fri, 30 Aug
 2019 16:39:38 +0000
Received: from DM3NAM03FT064.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::207) by SN1PR12CA0059.outlook.office365.com
 (2603:10b6:802:20::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.14 via Frontend
 Transport; Fri, 30 Aug 2019 16:39:38 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT064.mail.protection.outlook.com (10.152.83.1) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Fri, 30 Aug 2019 16:39:37 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Fri, 30 Aug 2019 11:39:36 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 3/3] dmr/amdgpu: Add system auto reboot to RAS.
Date: Fri, 30 Aug 2019 12:39:13 -0400
Message-ID: <1567183153-11014-3-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567183153-11014-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1567183153-11014-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(376002)(2980300002)(428003)(199004)(189003)(48376002)(53936002)(16586007)(86362001)(54906003)(4326008)(36756003)(7696005)(51416003)(356004)(316002)(70586007)(47776003)(5660300002)(76176011)(2616005)(446003)(126002)(11346002)(186003)(2906002)(26005)(50466002)(426003)(8936002)(486006)(478600001)(336012)(305945005)(6916009)(53416004)(6666004)(14444005)(8676002)(476003)(70206006)(44832011)(2351001)(81156014)(81166006)(50226002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1858; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c86b4ac-7055-458c-bd43-08d72d68a600
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BN6PR12MB1858; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1858:
X-Microsoft-Antispam-PRVS: <BN6PR12MB18584E40E4F4A3397B775E20EABD0@BN6PR12MB1858.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0145758B1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: jRoY4gJrzvQYiJO+kKLEbRWKZemti0GsLXwKnW50b1wW21RF7tC/hqXKnk5wThTzIq000Oj2LzdjZSopt7f0L1Vzhi7PSwBsOhfrHcxN5Xw/zgxJDolYpeSTtck5BWalG5rjzPE1Kg1UXV96+6JahJh/V6lzgfbZoP5Ms9WvhpkTJmklXsgagQZAB8xjKX4IPAbZTPpbxJkKrS41E8cF8DvXl+Q9werR3JO3ib3D88Iw1RsMDhyHgKN7ZBGaN2SHGj8becxXIsOhyaJMl6N6o70/5wLCB/SAfIJUpX6jrKLbmrryFjvIzpfEk49hCfhjRxobfrdV8LN+Ail0UGgS5Qv2upVMrrCk7ZY2J+YedBNSFkHmY+CQ6jsqGwSIHJXsOp5pbLt3MIDbEe4W81ZBOMrcG7lLOD83fTD6238CiL0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2019 16:39:37.8917 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c86b4ac-7055-458c-bd43-08d72d68a600
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1858
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/Y4Dy57hTAR6J6feEzw61ipXgr0VchrUBkdZBwEbgo=;
 b=vtHIgzx5kNofnW7xILIfV5oV3OpR2r4sbcgpVE1EKdl+1bNXKPRLCZXXe40Azh53RNwI1INo4rkLLsxFejHEbE/pE3MgbD7BLPzTajU53GTvENQfJd//mqS7OLTqfmIYZejl5J+szuERrhNiZB6JYmfiMJAfi0SEY0YfQjrxW8o=
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
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 ckoenig.leichtzumerken@gmail.com, Felix.Kuehling@amd.com, Tao.Zhou1@amd.com,
 alexdeucher@gmail.com, Hawking.Zhang@amd.com
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
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKaW5kZXggYzk4MjVhZS4uZTI2ZjJl
OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwpAQCAtMzc2
MCw2ICszNzYwLDI0IEBAIGludCBhbWRncHVfZGV2aWNlX2dwdV9yZWNvdmVyKHN0cnVjdCBhbWRn
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
cHUvYW1kZ3B1X3Jhcy5jCmluZGV4IDFjYzM0ZGUuLmJiY2ZiNGYgMTAwNjQ0Ci0tLSBhL2RyaXZl
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
cy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oCmluZGV4IDNlYzJh
ODcuLmE4M2VjOTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9yYXMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmgKQEAg
LTMzMyw2ICszMzMsNyBAQCBzdHJ1Y3QgYW1kZ3B1X3JhcyB7CiAJc3RydWN0IG11dGV4IHJlY292
ZXJ5X2xvY2s7CiAKIAl1aW50MzJfdCBmbGFnczsKKwlib29sIHJlYm9vdDsKIH07CiAKIHN0cnVj
dCByYXNfZnNfZGF0YSB7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
