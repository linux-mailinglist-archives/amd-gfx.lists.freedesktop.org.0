Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCDEA0280
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 15:03:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE9D89C60;
	Wed, 28 Aug 2019 13:03:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790072.outbound.protection.outlook.com [40.107.79.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5963C89C55
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 13:03:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R+Cnh//csgnsUoS1ZXRMp/Hgnsq9WqryCeqwH7ISOWJeK+5frqxFF/xC9jAfQDuJ+ZdzvgUKr0CNwGIc+dWHcA4PKl09wb/QwwPBK8CLVdUJ32+tTG0VptFwm3fgY7HaXcGiCzrZXmrGnILn3518lVDWGdB5hrfqvfjsl/rcwB+obWrJAwnoSYwAexICo42DJHVk5m/3uldRNnTzUE8cXx7Tq9ugXaxa6KLe691QHZb68XFfyoJedrrU7Ltjz79+kZUaKDC5d1iDmaJMmphYdBizsKUNTvRqYjYbiblpVdZ8g5YC9LyNhWomqx6m5hQkZML5NhyzJFT6Z06zEQf+2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8kFqB0P4b/jOA/+BSbjadR0S+kf9A8HBj1tsyYGL7c=;
 b=KP9t2u8MitupNpvATNuLTVgCpRw0kABHS8+ozG2lznfOib2ffB7B5mOhVmXah6QDW0KdB8TeQ658MmyYrDpwXXVhITSa81kWgZW4j59AKnrwzdZ9dDG1WEoI8vgRD5Q2KRFnvxBHUS5axNiHn8wM4044rkobU/xRmT3FvWvAM81gJ1TLd8QFd86JcFGzATF6jzIaYoNksl1Tk0WUEl7k+Qgj77wN4I0TYnlwqCopmFuWuCEH2tCNq5hwvypvgLLdCzKBbHnIEvxzY52y5RDgkJVSzjgJu1fN6ONuR6Es0NWn/QhzbFiRiKUBBbT130vUg+FmEwgW70yVW7RjlhjmEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0024.namprd12.prod.outlook.com
 (2603:10b6:301:4a::34) by DM5PR12MB1275.namprd12.prod.outlook.com
 (2603:10b6:3:75::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.18; Wed, 28 Aug
 2019 13:03:43 +0000
Received: from BY2NAM03FT047.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::204) by MWHPR1201CA0024.outlook.office365.com
 (2603:10b6:301:4a::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Wed, 28 Aug 2019 13:03:43 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT047.mail.protection.outlook.com (10.152.85.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 28 Aug 2019 13:03:40 +0000
Received: from hawzhang-All-Series.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Wed, 28 Aug 2019 08:03:39 -0500
From: Hawking Zhang <Hawking.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Tao Zhou <tao.zhou1@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>
Subject: [PATCH 5/7] drm/amdgpu: add mmhub ras_late_init callback function
Date: Wed, 28 Aug 2019 21:03:13 +0800
Message-ID: <1566997395-7185-5-git-send-email-Hawking.Zhang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566997395-7185-1-git-send-email-Hawking.Zhang@amd.com>
References: <1566997395-7185-1-git-send-email-Hawking.Zhang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(376002)(39860400002)(2980300002)(428003)(199004)(189003)(86362001)(50226002)(51416003)(8936002)(2906002)(7696005)(36756003)(11346002)(26005)(50466002)(16586007)(48376002)(53416004)(305945005)(316002)(47776003)(486006)(5660300002)(110136005)(76176011)(6636002)(70586007)(70206006)(186003)(53936002)(4326008)(2616005)(126002)(476003)(81156014)(81166006)(336012)(8676002)(446003)(356004)(426003)(478600001)(6666004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1275; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 037d56eb-ee4e-4235-cc26-08d72bb82644
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM5PR12MB1275; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1275:
X-Microsoft-Antispam-PRVS: <DM5PR12MB127503384C8A732F7FA81BABFCA30@DM5PR12MB1275.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:747;
X-Forefront-PRVS: 014304E855
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: lLWsZQ2oQdFwHnD/LmHqvbS67AZklN2Dlv8+U7lFGiMOvAvRJyzKk+myvltWTo6vd4b8ciTJ5JszOyob+s+SugOZUdvQeztZRKOJArQjhmzXzP5FebvhYjFW+9SJFcIpxQ7aUoUSaPZVDQ8jecCZ+wyd0rtuevBSmmeCk4Y3Y2obB6opNc4nOCaYpvX4xjPXxMt4ZRRuBhtzLYqZud8IxKvYg1kbSJ2h8vObTxWE6EajoVkFbG2FgbaCA8KkSMuarKqYBGk5ohUeSXmCz4C6H5Djh0U3HqhsRl5kT1uD+R6C7FlU+zECIBJ+rifCs6301VzCkipftmYnpXiHdgOpIv7ah5VDtK5ljTbuJXh694ftxkGDw32sq27Ehdot9eCbVKhg/ciqD30aRmpqvV20XVNBB6yTiqSkfPi+LMEtDUs=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2019 13:03:40.9131 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 037d56eb-ee4e-4235-cc26-08d72bb82644
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1275
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8kFqB0P4b/jOA/+BSbjadR0S+kf9A8HBj1tsyYGL7c=;
 b=f8cteC+eZGWwh2xFjbJOU5fI4TTetbo1s0HK5uZXBVHkzrIXjnZIHso2ZAsb8S+0XOHx6wKMttKTLwTd6mqi6k7vfPRWvgKyfX+jGTpl6vtA1L3KC+P23NRgCFOB7LdvSYkVYUmCS+ZNiiq6cq074wHmYkSSvwmwZIVULkaLtTA=
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

VGhlIGZ1bmN0aW9uIHdpbGwgYmUgY2FsbGVkIGluIGxhdGUgaW5pdCBwaGFzZSB0byBkbyBtbWh1
YgpyYXMgaW5pdAoKU2lnbmVkLW9mZi1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0Bh
bWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tbWh1Yi5oIHwg
IDEgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyAgICAgfCAyMSArKy0t
LS0tLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3YxXzAu
YyAgIHwgMjggKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAz
MSBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW1odWIuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9tbWh1Yi5oCmluZGV4IDJkNzVlY2YuLmRmMDRjNzEgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tbWh1Yi5oCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tbWh1Yi5oCkBAIC0yMyw2ICsyMyw3IEBACiAKIHN0cnVj
dCBhbWRncHVfbW1odWJfZnVuY3MgewogCXZvaWQgKCpyYXNfaW5pdCkoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpOworCWludCAoKnJhc19sYXRlX2luaXQpKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KTsKIAl2b2lkICgqcXVlcnlfcmFzX2Vycm9yX2NvdW50KShzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwKIAkJCQkJdm9pZCAqcmFzX2Vycm9yX3N0YXR1cyk7CiB9OwpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKaW5kZXggOGRjMTNkMi4uMjZhNjk1NiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCkBAIC03NjIsNyArNzYyLDYgQEAgc3RhdGljIGlu
dCBnbWNfdjlfMF9lY2NfbGF0ZV9pbml0KHZvaWQgKmhhbmRsZSkKIHsKIAlpbnQgcjsKIAlzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqKWhhbmRsZTsK
LQlzdHJ1Y3QgcmFzX2loX2lmIG1taHViX2loX2luZm87CiAJc3RydWN0IHJhc19mc19pZiB1bWNf
ZnNfaW5mbyA9IHsKIAkJLnN5c2ZzX25hbWUgPSAidW1jX2Vycl9jb3VudCIsCiAJCS5kZWJ1Z2Zz
X25hbWUgPSAidW1jX2Vycl9pbmplY3QiLApAQCAtNzcwLDEwICs3NjksNiBAQCBzdGF0aWMgaW50
IGdtY192OV8wX2VjY19sYXRlX2luaXQodm9pZCAqaGFuZGxlKQogCXN0cnVjdCByYXNfaWhfaWYg
dW1jX2loX2luZm8gPSB7CiAJCS5jYiA9IGdtY192OV8wX3Byb2Nlc3NfcmFzX2RhdGFfY2IsCiAJ
fTsKLQlzdHJ1Y3QgcmFzX2ZzX2lmIG1taHViX2ZzX2luZm8gPSB7Ci0JCS5zeXNmc19uYW1lID0g
Im1taHViX2Vycl9jb3VudCIsCi0JCS5kZWJ1Z2ZzX25hbWUgPSAibW1odWJfZXJyX2luamVjdCIs
Ci0JfTsKIAogCWlmICghYWRldi0+Z21jLnVtY19yYXNfaWYpIHsKIAkJYWRldi0+Z21jLnVtY19y
YXNfaWYgPSBrbWFsbG9jKHNpemVvZihzdHJ1Y3QgcmFzX2NvbW1vbl9pZiksIEdGUF9LRVJORUwp
OwpAQCAtNzk3LDI1ICs3OTIsMTMgQEAgc3RhdGljIGludCBnbWNfdjlfMF9lY2NfbGF0ZV9pbml0
KHZvaWQgKmhhbmRsZSkKIAkJCWdvdG8gZnJlZTsKIAl9CiAKLQlpZiAoIWFkZXYtPmdtYy5tbWh1
Yl9yYXNfaWYpIHsKLQkJYWRldi0+Z21jLm1taHViX3Jhc19pZiA9IGttYWxsb2Moc2l6ZW9mKHN0
cnVjdCByYXNfY29tbW9uX2lmKSwgR0ZQX0tFUk5FTCk7Ci0JCWlmICghYWRldi0+Z21jLm1taHVi
X3Jhc19pZikKLQkJCXJldHVybiAtRU5PTUVNOwotCQlhZGV2LT5nbWMubW1odWJfcmFzX2lmLT5i
bG9jayA9IEFNREdQVV9SQVNfQkxPQ0tfX01NSFVCOwotCQlhZGV2LT5nbWMubW1odWJfcmFzX2lm
LT50eXBlID0gQU1ER1BVX1JBU19FUlJPUl9fTVVMVElfVU5DT1JSRUNUQUJMRTsKLQkJYWRldi0+
Z21jLm1taHViX3Jhc19pZi0+c3ViX2Jsb2NrX2luZGV4ID0gMDsKLQkJc3RyY3B5KGFkZXYtPmdt
Yy5tbWh1Yl9yYXNfaWYtPm5hbWUsICJtbWh1YiIpOwotCX0KLQltbWh1Yl9paF9pbmZvLmhlYWQg
PSBtbWh1Yl9mc19pbmZvLmhlYWQgPSAqYWRldi0+Z21jLm1taHViX3Jhc19pZjsKLQlyID0gYW1k
Z3B1X3Jhc19sYXRlX2luaXQoYWRldiwgYWRldi0+Z21jLm1taHViX3Jhc19pZiwKLQkJCQkgJm1t
aHViX2ZzX2luZm8sICZtbWh1Yl9paF9pbmZvKTsKKwlyID0gYWRldi0+bW1odWJfZnVuY3MtPnJh
c19sYXRlX2luaXQoYWRldik7CiAJaWYgKHIpCi0JCWdvdG8gZnJlZTsKKwkJcmV0dXJuIHI7CiAK
IAlyZXR1cm4gMDsKIGZyZWU6CiAJa2ZyZWUoYWRldi0+Z21jLnVtY19yYXNfaWYpOwotCWtmcmVl
KGFkZXYtPmdtYy5tbWh1Yl9yYXNfaWYpOwogCXJldHVybiByOwogfQogCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92MV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9tbWh1Yl92MV8wLmMKaW5kZXggMDRjZDRiNi4uOWY3ZDVkMSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjFfMC5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3YxXzAuYwpAQCAtMzEsNiArMzEsNyBAQAogI2luY2x1
ZGUgInZlZ2ExMF9lbnVtLmgiCiAKICNpbmNsdWRlICJzb2MxNV9jb21tb24uaCIKKyNpbmNsdWRl
ICJhbWRncHVfcmFzLmgiCiAKICNkZWZpbmUgbW1EQUdCMF9DTlRMX01JU0MyX1JWIDB4MDA4Zgog
I2RlZmluZSBtbURBR0IwX0NOVExfTUlTQzJfUlZfQkFTRV9JRFggMApAQCAtNjE1LDYgKzYxNiwz
MyBAQCBzdGF0aWMgdm9pZCBtbWh1Yl92MV8wX3F1ZXJ5X3Jhc19lcnJvcl9jb3VudChzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwKIAl9CiB9CiAKK3N0YXRpYyBpbnQgbW1odWJfdjFfMF9yYXNf
bGF0ZV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQoreworCWludCByOworCXN0cnVj
dCByYXNfaWhfaWYgbW1odWJfaWhfaW5mbzsKKwlzdHJ1Y3QgcmFzX2ZzX2lmIG1taHViX2ZzX2lu
Zm8gPSB7CisJCS5zeXNmc19uYW1lID0gIm1taHViX2Vycl9jb3VudCIsCisJCS5kZWJ1Z2ZzX25h
bWUgPSAibW1odWJfZXJyX2luamVjdCIsCisJfTsKKworCWlmICghYWRldi0+Z21jLm1taHViX3Jh
c19pZikgeworCQlhZGV2LT5nbWMubW1odWJfcmFzX2lmID0ga21hbGxvYyhzaXplb2Yoc3RydWN0
IHJhc19jb21tb25faWYpLCBHRlBfS0VSTkVMKTsKKwkJaWYgKCFhZGV2LT5nbWMubW1odWJfcmFz
X2lmKQorCQkJcmV0dXJuIC1FTk9NRU07CisJCWFkZXYtPmdtYy5tbWh1Yl9yYXNfaWYtPmJsb2Nr
ID0gQU1ER1BVX1JBU19CTE9DS19fTU1IVUI7CisJCWFkZXYtPmdtYy5tbWh1Yl9yYXNfaWYtPnR5
cGUgPSBBTURHUFVfUkFTX0VSUk9SX19NVUxUSV9VTkNPUlJFQ1RBQkxFOworCQlhZGV2LT5nbWMu
bW1odWJfcmFzX2lmLT5zdWJfYmxvY2tfaW5kZXggPSAwOworCQlzdHJjcHkoYWRldi0+Z21jLm1t
aHViX3Jhc19pZi0+bmFtZSwgIm1taHViIik7CisJfQorCW1taHViX2loX2luZm8uaGVhZCA9IG1t
aHViX2ZzX2luZm8uaGVhZCA9ICphZGV2LT5nbWMubW1odWJfcmFzX2lmOworCXIgPSBhbWRncHVf
cmFzX2xhdGVfaW5pdChhZGV2LCBhZGV2LT5nbWMubW1odWJfcmFzX2lmLAorCQkJCSAmbW1odWJf
ZnNfaW5mbywgJm1taHViX2loX2luZm8pOworCWlmIChyKQorCQlrZnJlZShhZGV2LT5nbWMubW1o
dWJfcmFzX2lmKTsKKwlyZXR1cm4gcjsKK30KKwogY29uc3Qgc3RydWN0IGFtZGdwdV9tbWh1Yl9m
dW5jcyBtbWh1Yl92MV8wX2Z1bmNzID0geworCS5yYXNfbGF0ZV9pbml0ID0gbW1odWJfdjFfMF9y
YXNfbGF0ZV9pbml0LAogCS5xdWVyeV9yYXNfZXJyb3JfY291bnQgPSBtbWh1Yl92MV8wX3F1ZXJ5
X3Jhc19lcnJvcl9jb3VudCwKIH07Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
