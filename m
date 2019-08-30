Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0516A2BF2
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Aug 2019 02:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F236E22B;
	Fri, 30 Aug 2019 00:54:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680047.outbound.protection.outlook.com [40.107.68.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B546E22B
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Aug 2019 00:54:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dtDxQSmX38tEhiomTpXnHDpmYqONGRRiXcoIbxhpk1p+G7K2Beac1SIBE/I30F8SazsrkoW+v6XFHXID+KDFVVxxNW6HrLR20T7XuSN2tpjsVmAMQax7sVEIrp6/dF3yVLZlSEAgjdIKjEzrtm2dnDkMpqQo/8yBImD4ouui+dmGHu2lOY5QSh0oK7/+61NIKfN+dWtlujm4qXKVEzWFJFU3HbYQTDReuDoby1sGU5LvIbbM57DoaUZcqN5v10oWrukpK500I6WL1PwJGGYMN0q+a9LQ4EN6oYRo81c7Aeam7cUoR0AGE0FoGIaW9KOudO+cgEkBdKnZiovkZbT2PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4eey3aXK7/4a9bO72h0dbQqEymqSd/rLzO6qMj9R2N8=;
 b=Kej7PU503rH49mnpyslggYIklCBsEDQzmEzSQsSRDkB1dZVF50OkKxtrqA8tMLNta99EIEYNN15ahCsU1doftuvKdGzYJEPkqjDDHg0MZoS6HUVc8h6v2MnbUWNYO+BBupUsIAZF+mR2emFOyqoazZ0EWrgTLhcY8dZnOFM5FMlTagkeodYG960rf3FzrVgfJIHsfaOzn4fmUuDTsKw2yqU9X8e8HlSefKKFTGYXHaBa540+7PuthmExjE9OvJhGi6ay/eSP/j9B+L0pizGhxXUSqCtWOEbOCILgnF83uytLJPQemGxt9YeNgoj/DRJGIyFfjWZj3SI4E/0jBZA1KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN8PR12CA0019.namprd12.prod.outlook.com (2603:10b6:408:60::32)
 by BN6PR12MB1666.namprd12.prod.outlook.com (2603:10b6:405:3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.20; Fri, 30 Aug
 2019 00:54:03 +0000
Received: from BY2NAM03FT059.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by BN8PR12CA0019.outlook.office365.com
 (2603:10b6:408:60::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.15 via Frontend
 Transport; Fri, 30 Aug 2019 00:54:03 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT059.mail.protection.outlook.com (10.152.85.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Fri, 30 Aug 2019 00:54:02 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Thu, 29 Aug 2019 19:54:00 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 2/2] dmr/amdgpu: Add system auto reboot to RAS.
Date: Thu, 29 Aug 2019 20:53:47 -0400
Message-ID: <1567126427-13912-2-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567126427-13912-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1567126427-13912-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(39860400002)(376002)(2980300002)(428003)(199004)(189003)(336012)(5660300002)(356004)(2906002)(186003)(6666004)(76176011)(6916009)(51416003)(486006)(11346002)(446003)(44832011)(426003)(26005)(478600001)(7696005)(2616005)(126002)(476003)(50226002)(8936002)(14444005)(81166006)(86362001)(36756003)(81156014)(305945005)(4326008)(48376002)(50466002)(8676002)(53936002)(316002)(47776003)(53416004)(54906003)(16586007)(2351001)(70586007)(70206006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1666; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bdc9f083-adfb-41b0-ea94-08d72ce48d35
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BN6PR12MB1666; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1666:
X-Microsoft-Antispam-PRVS: <BN6PR12MB16664BCDCC4E8D7983BEA269EABD0@BN6PR12MB1666.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0145758B1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: bJlv2e/ccAeXW4+LG6t6kUoNwzTLcyJ+Az8fAPoyyntERIwo1y9BQEjZ7bd3G67LKmlW2CddY4jgOKbW8JdFe9QHWarUWrs64nQYaeJfvECULLpGH70tDL/HIr6hhspqQIUvPDnnVyMwCXluB2Y9n5XG3qcNPcGnSu7ZyT7br6Nq6c1YjCnEaevuOyMyEEqUPF/g2IMQkS4JGJr1BJsqlKEcpPCtOh+PI0cVVxfBHU53bSdSdGymJOIrU1DbFpOuchbj+2roxo1H9P/P8HT8j0gbcujRIKSMAXIvv9DFHqD0NyL9KRsXWTkE3fsBfmdPDsgPJb2v2Zy8lxWh/iEyaCqE9pok2IkdqjDSQ/LQF4Kyru5qwuh8QkCtGdLyVhk57PYgppZ8g1l/twVyeCc04ouUBl/xmhbLop0P6EXT1zA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2019 00:54:02.8040 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdc9f083-adfb-41b0-ea94-08d72ce48d35
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1666
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4eey3aXK7/4a9bO72h0dbQqEymqSd/rLzO6qMj9R2N8=;
 b=zFu/cB0BDdjnGOZk8QbB4wMUbNZAgIaZHX4pgPMpYu/Zlw0mBjc0YnOSMPjarQlw1YWBmcx1emoImX3XuBb+n4rKDJOF1pEW1UUTI+LDC3Hx4VwgUtcPllT+RmpTQKVlS8UDEcLLsvKPKu0fQS+DI7UbuGlJ1cETi5PftSgoc80=
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
Cc: alexdeucher@gmail.com, ckoenig.leichtzumerken@gmail.com, Tao.Zhou1@amd.com,
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
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKaW5kZXggZDNhMDc4Yi4uMjU4NmU4
ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5j
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
cHUvYW1kZ3B1X3Jhcy5jCmluZGV4IDdiMDBhYzYuLjAzOGIwYTZmIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCkBAIC0zMCw2ICszMCw3IEBACiAjaW5jbHVkZSAiYW1k
Z3B1X3Jhcy5oIgogI2luY2x1ZGUgImFtZGdwdV9hdG9tZmlybXdhcmUuaCIKICNpbmNsdWRlICJp
dnNyY2lkL25iaW8vaXJxc3Jjc19uYmlmXzdfNC5oIgorI2luY2x1ZGUgPGxpbnV4L2ttb2QuaD4K
IAogY29uc3QgY2hhciAqcmFzX2Vycm9yX3N0cmluZ1tdID0gewogCSJub25lIiwKQEAgLTE1NCw2
ICsxNTUsOCBAQCBzdGF0aWMgaW50IGFtZGdwdV9yYXNfZGVidWdmc19jdHJsX3BhcnNlX2RhdGEo
c3RydWN0IGZpbGUgKmYsCiAJCW9wID0gMTsKIAllbHNlIGlmIChzc2NhbmYoc3RyLCAiaW5qZWN0
ICUzMnMgJThzIiwgYmxvY2tfbmFtZSwgZXJyKSA9PSAyKQogCQlvcCA9IDI7CisJZWxzZSBpZiAo
c3NjYW5mKHN0ciwgInJlYm9vdCAlMzJzIiwgYmxvY2tfbmFtZSkgPT0gMSkKKwkJb3AgPSAzOwog
CWVsc2UgaWYgKHN0clswXSAmJiBzdHJbMV0gJiYgc3RyWzJdICYmIHN0clszXSkKIAkJLyogYXNj
aWkgc3RyaW5nLCBidXQgY29tbWFuZHMgYXJlIG5vdCBtYXRjaGVkLiAqLwogCQlyZXR1cm4gLUVJ
TlZBTDsKQEAgLTI4Nyw2ICsyOTAsOSBAQCBzdGF0aWMgc3NpemVfdCBhbWRncHVfcmFzX2RlYnVn
ZnNfY3RybF93cml0ZShzdHJ1Y3QgZmlsZSAqZiwgY29uc3QgY2hhciBfX3VzZXIgKgogCQkvKiBk
YXRhLmluamVjdC5hZGRyZXNzIGlzIG9mZnNldCBpbnN0ZWFkIG9mIGFic29sdXRlIGdwdSBhZGRy
ZXNzICovCiAJCXJldCA9IGFtZGdwdV9yYXNfZXJyb3JfaW5qZWN0KGFkZXYsICZkYXRhLmluamVj
dCk7CiAJCWJyZWFrOworCWNhc2UgMzoKKwkJYW1kZ3B1X3Jhc19nZXRfY29udGV4dChhZGV2KS0+
cmVib290ID0gdHJ1ZTsKKwkJYnJlYWs7CiAJZGVmYXVsdDoKIAkJcmV0ID0gLUVJTlZBTDsKIAkJ
YnJlYWs7CkBAIC0xNzMzLDYgKzE3MzksOCBAQCBpbnQgYW1kZ3B1X3Jhc19maW5pKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KQogdm9pZCBhbWRncHVfcmFzX2dsb2JhbF9yYXNfaXNyKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2KQogewogCWlmIChhdG9taWNfY21weGNoZygmYW1kZ3B1X3Jh
c19pbl9pbnRyLCAwLCAxKSA9PSAwKSB7Ci0JCURSTV9XQVJOKCJSQVMgZXZlbnQgb2YgdHlwZSBF
UlJFVkVOVF9BVEhVQl9JTlRFUlJVUFQgZGV0ZWN0ZWQhIFN0b3BwaW5nIGFsbCBHUFUgam9icy5c
biIpOworCQlEUk1fV0FSTigiUkFTIGV2ZW50IG9mIHR5cGUgRVJSRVZFTlRfQVRIVUJfSU5URVJS
VVBUIGRldGVjdGVkIVxuIik7CisKKwkJYW1kZ3B1X3Jhc19yZXNldF9ncHUoYWRldiwgZmFsc2Up
OwogCX0KIH0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9y
YXMuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaAppbmRleCBjZjVm
ZmI2Li40NWMwZGFiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcmFzLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oCkBA
IC0zMzMsNiArMzMzLDcgQEAgc3RydWN0IGFtZGdwdV9yYXMgewogCXN0cnVjdCBtdXRleCByZWNv
dmVyeV9sb2NrOwogCiAJdWludDMyX3QgZmxhZ3M7CisJYm9vbCByZWJvb3Q7CiB9OwogCiBzdHJ1
Y3QgcmFzX2ZzX2RhdGEgewotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
