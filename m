Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA02A1B77
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 15:31:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F76C6E111;
	Thu, 29 Aug 2019 13:31:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690081.outbound.protection.outlook.com [40.107.69.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2166E116
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 13:31:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WxCFt5D2TC7Ncyy836fWCFA0D3KTkI1VPfmHopt0mFBaNiz4GkodOOp9YH+njSnftaAzyMtYWMu/FPR29Awvx/JxDRiwu0199Oo/YeUR0LwSbaxuYZVceLbPc6E0CF4feA5wBTIHjVsqejkypsHwwoIYul0ViDPEbbwvN9EPObP2lG5SHXots8Z0Jl/Wsy7dr+O/MkGBvHZzf2e40na1/Kfm/vkU2x0Jezs6rXEBauug9jf1UQ6FvadgFcj4YawMLNwRZA6kugQt4n0MmmRV5n6Ig7pqiFdtEvwcCzANYpb0OaTtgh9U986AVHazfWB2cnowWnq7hR11YZWGLLtM2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XbKy3jiLxwsyhRb22DAai6BSTOPOM5ILvE/0qBvvJaI=;
 b=CQNBp2Pycg77gYZzlZ8BXf09x2NRqehDU3TaNPG6ovoCwTEgnF5/MATu8IVx7AL+R1jxJ3JLb1ZZ56epsqGQjMMC0YDkw28x1ptHw+1c35SkAfkBIuagwr5AqipHnoonaaFy9+QL6AJ/qWucxIaCEh94sjOkbqAQ9lMWGexAc0tt2QmCkMkWNZt7yKIHm26BBrS94vbJpnXosLabbCSfm7EAz8QNFh7vgFhxVAI5YYLr0/Jq6rOzfDu8hMnunCo388lLjVtJhEhKpbrpx5y+cnp/ID6o7IYNEOfq/43YeTihghqM01zqQWxe4I4ML5xYXkbEeBwvF2MX4KWgC6M8TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0006.namprd12.prod.outlook.com
 (2603:10b6:301:4a::16) by BN7PR12MB2706.namprd12.prod.outlook.com
 (2603:10b6:408:2a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.20; Thu, 29 Aug
 2019 13:31:14 +0000
Received: from BY2NAM03FT045.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::200) by MWHPR1201CA0006.outlook.office365.com
 (2603:10b6:301:4a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.15 via Frontend
 Transport; Thu, 29 Aug 2019 13:31:14 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT045.mail.protection.outlook.com (10.152.85.113) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Thu, 29 Aug 2019 13:31:13 +0000
Received: from hawzhang-All-Series.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Thu, 29 Aug 2019 08:31:12 -0500
From: Hawking Zhang <Hawking.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, 
 Tao Zhou <tao.zhou1@amd.com>, Guchun Chen <guchun.chen@amd.com>
Subject: [PATCH 5/7] drm/amdgpu: add mmhub ras_late_init callback function (v2)
Date: Thu, 29 Aug 2019 21:30:30 +0800
Message-ID: <1567085432-27452-5-git-send-email-Hawking.Zhang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567085432-27452-1-git-send-email-Hawking.Zhang@amd.com>
References: <1567085432-27452-1-git-send-email-Hawking.Zhang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39860400002)(376002)(346002)(2980300002)(428003)(199004)(189003)(8936002)(316002)(11346002)(446003)(356004)(76176011)(6666004)(305945005)(126002)(7696005)(476003)(47776003)(51416003)(16586007)(4326008)(2616005)(186003)(53416004)(26005)(6636002)(70206006)(336012)(86362001)(426003)(70586007)(48376002)(50466002)(50226002)(36756003)(5660300002)(110136005)(81156014)(81166006)(53936002)(2906002)(8676002)(478600001)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2706; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c549f1a-e11f-4a67-1c4f-08d72c8529e1
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BN7PR12MB2706; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2706:
X-Microsoft-Antispam-PRVS: <BN7PR12MB27068D2EE495B06E68F52CF5FCA20@BN7PR12MB2706.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-Forefront-PRVS: 0144B30E41
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: elCUZ9Hxo3i9r2Hay4saIPsj2PPDLLduWIiNihuJG8BXiZfoRDo9lRg+9H0fyd3VE74Awab5D5BnLdKc9YEBuH9kmIWxXDjqTUNAac/KajkXmFL2jVbZ5km6wYUjpxHs64l7kLvNSsGK/1XVgop8lQPCLjb3PhxwAZaG5342r5fobbuAdqD3SgtQDpouv/A3KM6LfFBlii4QvtygacEKno2HwsVazfRX/P496sy7BJTaUFzT/OD4nvmurdvgx3pgwP5TzK9CLUTWvuAvlSihX0mA7nfPcsAWHsf3EkN8tkSyj9sv1H4Y/4O3vQPZGzLg5jmXoYztMdO0iYj6lq5T+KfUOPgRIw3/23BetB1v8R/M/yjUieLUKURnj5JpI2oHFVfDsHRfivKXg9rqwhbCIgd6CIsIpKc6/n50Jo1OUng=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2019 13:31:13.8783 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c549f1a-e11f-4a67-1c4f-08d72c8529e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2706
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XbKy3jiLxwsyhRb22DAai6BSTOPOM5ILvE/0qBvvJaI=;
 b=qpDQKAes6Fdv2W+VEKqsA1Fl1r0UkVFJExNsIcvHIv068sBC/rTovvbsqnWEo5gatNs6wqbnXyIn9tMcpGaS4E2rfcS+T5tGTA7FFzTCbZcrmhi8HmJcWVjud0HKG2fdU0DzoKlUnn+8jRztXPQTLWLc+EEtzvJhqbDJJznGrAA=
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
YgpyYXMgaW5pdAoKdjI6IGNoZWNrIHJhc19sYXRlX2luaXQgZnVuY3Rpb24gcG9pbnRlciBiZWZv
cmUgaW52b2tpbmcgdGhlCmZ1bmN0aW9uCgpTaWduZWQtb2ZmLWJ5OiBIYXdraW5nIFpoYW5nIDxI
YXdraW5nLlpoYW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X21taHViLmggfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5j
ICAgICB8IDI2ICsrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9tbWh1Yl92MV8wLmMgICB8IDI4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysK
IDMgZmlsZXMgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21taHViLmggYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW1odWIuaAppbmRleCAyZDc1ZWNmLi5kZjA0
YzcxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW1odWIu
aAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW1odWIuaApAQCAtMjMs
NiArMjMsNyBAQAogCiBzdHJ1Y3QgYW1kZ3B1X21taHViX2Z1bmNzIHsKIAl2b2lkICgqcmFzX2lu
aXQpKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKKwlpbnQgKCpyYXNfbGF0ZV9pbml0KShz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7CiAJdm9pZCAoKnF1ZXJ5X3Jhc19lcnJvcl9jb3Vu
dCkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCQkJCXZvaWQgKnJhc19lcnJvcl9zdGF0
dXMpOwogfTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8w
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCmluZGV4IDhhN2E1NmEu
LjcwYTA1ZTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8w
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwpAQCAtNzYyLDcg
Kzc2Miw2IEBAIHN0YXRpYyBpbnQgZ21jX3Y5XzBfZWNjX2xhdGVfaW5pdCh2b2lkICpoYW5kbGUp
CiB7CiAJaW50IHI7CiAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKiloYW5kbGU7Ci0Jc3RydWN0IHJhc19paF9pZiBtbWh1Yl9paF9pbmZvOwogCXN0
cnVjdCByYXNfZnNfaWYgdW1jX2ZzX2luZm8gPSB7CiAJCS5zeXNmc19uYW1lID0gInVtY19lcnJf
Y291bnQiLAogCQkuZGVidWdmc19uYW1lID0gInVtY19lcnJfaW5qZWN0IiwKQEAgLTc3MCwxMCAr
NzY5LDYgQEAgc3RhdGljIGludCBnbWNfdjlfMF9lY2NfbGF0ZV9pbml0KHZvaWQgKmhhbmRsZSkK
IAlzdHJ1Y3QgcmFzX2loX2lmIHVtY19paF9pbmZvID0gewogCQkuY2IgPSBnbWNfdjlfMF9wcm9j
ZXNzX3Jhc19kYXRhX2NiLAogCX07Ci0Jc3RydWN0IHJhc19mc19pZiBtbWh1Yl9mc19pbmZvID0g
ewotCQkuc3lzZnNfbmFtZSA9ICJtbWh1Yl9lcnJfY291bnQiLAotCQkuZGVidWdmc19uYW1lID0g
Im1taHViX2Vycl9pbmplY3QiLAotCX07CiAKIAlpZiAoIWFkZXYtPmdtYy51bWNfcmFzX2lmKSB7
CiAJCWFkZXYtPmdtYy51bWNfcmFzX2lmID0ga21hbGxvYyhzaXplb2Yoc3RydWN0IHJhc19jb21t
b25faWYpLCBHRlBfS0VSTkVMKTsKQEAgLTc5NywyOSArNzkyLDE2IEBAIHN0YXRpYyBpbnQgZ21j
X3Y5XzBfZWNjX2xhdGVfaW5pdCh2b2lkICpoYW5kbGUpCiAJCQlnb3RvIHVtY19sYXRlX2Zpbmk7
CiAJfQogCi0JaWYgKCFhZGV2LT5nbWMubW1odWJfcmFzX2lmKSB7Ci0JCWFkZXYtPmdtYy5tbWh1
Yl9yYXNfaWYgPSBrbWFsbG9jKHNpemVvZihzdHJ1Y3QgcmFzX2NvbW1vbl9pZiksIEdGUF9LRVJO
RUwpOwotCQlpZiAoIWFkZXYtPmdtYy5tbWh1Yl9yYXNfaWYpCi0JCQlyZXR1cm4gLUVOT01FTTsK
LQkJYWRldi0+Z21jLm1taHViX3Jhc19pZi0+YmxvY2sgPSBBTURHUFVfUkFTX0JMT0NLX19NTUhV
QjsKLQkJYWRldi0+Z21jLm1taHViX3Jhc19pZi0+dHlwZSA9IEFNREdQVV9SQVNfRVJST1JfX01V
TFRJX1VOQ09SUkVDVEFCTEU7Ci0JCWFkZXYtPmdtYy5tbWh1Yl9yYXNfaWYtPnN1Yl9ibG9ja19p
bmRleCA9IDA7Ci0JCXN0cmNweShhZGV2LT5nbWMubW1odWJfcmFzX2lmLT5uYW1lLCAibW1odWIi
KTsKKwlpZiAoYWRldi0+bW1odWJfZnVuY3MtPnJhc19sYXRlX2luaXQpIHsKKwkJciA9IGFkZXYt
Pm1taHViX2Z1bmNzLT5yYXNfbGF0ZV9pbml0KGFkZXYpOworCQlpZiAocikKKwkJCXJldHVybiBy
OwogCX0KLQltbWh1Yl9paF9pbmZvLmhlYWQgPSBtbWh1Yl9mc19pbmZvLmhlYWQgPSAqYWRldi0+
Z21jLm1taHViX3Jhc19pZjsKLQlyID0gYW1kZ3B1X3Jhc19sYXRlX2luaXQoYWRldiwgYWRldi0+
Z21jLm1taHViX3Jhc19pZiwKLQkJCQkgJm1taHViX2ZzX2luZm8sICZtbWh1Yl9paF9pbmZvKTsK
LQlpZiAocikKLQkJZ290byBtbWh1Yl9sYXRlX2Zpbmk7Ci0KIAlyZXR1cm4gMDsKLW1taHViX2xh
dGVfZmluaToKLQlhbWRncHVfcmFzX2xhdGVfZmluaShhZGV2LCBhZGV2LT5nbWMubW1odWJfcmFz
X2lmLCAmbW1odWJfaWhfaW5mbyk7CiB1bWNfbGF0ZV9maW5pOgogCWFtZGdwdV9yYXNfbGF0ZV9m
aW5pKGFkZXYsIGFkZXYtPmdtYy51bWNfcmFzX2lmLCAmdW1jX2loX2luZm8pOwogZnJlZToKIAlr
ZnJlZShhZGV2LT5nbWMudW1jX3Jhc19pZik7Ci0Ja2ZyZWUoYWRldi0+Z21jLm1taHViX3Jhc19p
Zik7CiAJcmV0dXJuIHI7CiB9CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L21taHViX3YxXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3YxXzAu
YwppbmRleCAwNGNkNGI2Li45ZjdkNWQxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9tbWh1Yl92MV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1o
dWJfdjFfMC5jCkBAIC0zMSw2ICszMSw3IEBACiAjaW5jbHVkZSAidmVnYTEwX2VudW0uaCIKIAog
I2luY2x1ZGUgInNvYzE1X2NvbW1vbi5oIgorI2luY2x1ZGUgImFtZGdwdV9yYXMuaCIKIAogI2Rl
ZmluZSBtbURBR0IwX0NOVExfTUlTQzJfUlYgMHgwMDhmCiAjZGVmaW5lIG1tREFHQjBfQ05UTF9N
SVNDMl9SVl9CQVNFX0lEWCAwCkBAIC02MTUsNiArNjE2LDMzIEBAIHN0YXRpYyB2b2lkIG1taHVi
X3YxXzBfcXVlcnlfcmFzX2Vycm9yX2NvdW50KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAog
CX0KIH0KIAorc3RhdGljIGludCBtbWh1Yl92MV8wX3Jhc19sYXRlX2luaXQoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpCit7CisJaW50IHI7CisJc3RydWN0IHJhc19paF9pZiBtbWh1Yl9paF9p
bmZvOworCXN0cnVjdCByYXNfZnNfaWYgbW1odWJfZnNfaW5mbyA9IHsKKwkJLnN5c2ZzX25hbWUg
PSAibW1odWJfZXJyX2NvdW50IiwKKwkJLmRlYnVnZnNfbmFtZSA9ICJtbWh1Yl9lcnJfaW5qZWN0
IiwKKwl9OworCisJaWYgKCFhZGV2LT5nbWMubW1odWJfcmFzX2lmKSB7CisJCWFkZXYtPmdtYy5t
bWh1Yl9yYXNfaWYgPSBrbWFsbG9jKHNpemVvZihzdHJ1Y3QgcmFzX2NvbW1vbl9pZiksIEdGUF9L
RVJORUwpOworCQlpZiAoIWFkZXYtPmdtYy5tbWh1Yl9yYXNfaWYpCisJCQlyZXR1cm4gLUVOT01F
TTsKKwkJYWRldi0+Z21jLm1taHViX3Jhc19pZi0+YmxvY2sgPSBBTURHUFVfUkFTX0JMT0NLX19N
TUhVQjsKKwkJYWRldi0+Z21jLm1taHViX3Jhc19pZi0+dHlwZSA9IEFNREdQVV9SQVNfRVJST1Jf
X01VTFRJX1VOQ09SUkVDVEFCTEU7CisJCWFkZXYtPmdtYy5tbWh1Yl9yYXNfaWYtPnN1Yl9ibG9j
a19pbmRleCA9IDA7CisJCXN0cmNweShhZGV2LT5nbWMubW1odWJfcmFzX2lmLT5uYW1lLCAibW1o
dWIiKTsKKwl9CisJbW1odWJfaWhfaW5mby5oZWFkID0gbW1odWJfZnNfaW5mby5oZWFkID0gKmFk
ZXYtPmdtYy5tbWh1Yl9yYXNfaWY7CisJciA9IGFtZGdwdV9yYXNfbGF0ZV9pbml0KGFkZXYsIGFk
ZXYtPmdtYy5tbWh1Yl9yYXNfaWYsCisJCQkJICZtbWh1Yl9mc19pbmZvLCAmbW1odWJfaWhfaW5m
byk7CisJaWYgKHIpCisJCWtmcmVlKGFkZXYtPmdtYy5tbWh1Yl9yYXNfaWYpOworCXJldHVybiBy
OworfQorCiBjb25zdCBzdHJ1Y3QgYW1kZ3B1X21taHViX2Z1bmNzIG1taHViX3YxXzBfZnVuY3Mg
PSB7CisJLnJhc19sYXRlX2luaXQgPSBtbWh1Yl92MV8wX3Jhc19sYXRlX2luaXQsCiAJLnF1ZXJ5
X3Jhc19lcnJvcl9jb3VudCA9IG1taHViX3YxXzBfcXVlcnlfcmFzX2Vycm9yX2NvdW50LAogfTsK
LS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
