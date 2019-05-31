Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FF130E8F
	for <lists+amd-gfx@lfdr.de>; Fri, 31 May 2019 15:11:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CCFC8931F;
	Fri, 31 May 2019 13:11:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770080.outbound.protection.outlook.com [40.107.77.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 321D08931F
 for <amd-gfx@lists.freedesktop.org>; Fri, 31 May 2019 13:11:08 +0000 (UTC)
Received: from BN8PR12CA0004.namprd12.prod.outlook.com (2603:10b6:408:60::17)
 by BYAPR12MB2663.namprd12.prod.outlook.com (2603:10b6:a03:69::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1922.16; Fri, 31 May
 2019 13:11:05 +0000
Received: from CO1NAM03FT032.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::204) by BN8PR12CA0004.outlook.office365.com
 (2603:10b6:408:60::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.16 via Frontend
 Transport; Fri, 31 May 2019 13:11:04 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT032.mail.protection.outlook.com (10.152.80.173) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1943.19 via Frontend Transport; Fri, 31 May 2019 13:11:03 +0000
Received: from prike.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server (TLS) id 14.3.389.1; Fri, 31 May
 2019 08:11:00 -0500
From: Prike Liang <Prike.Liang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amd/amdgpu: add RLC firmware to support raven1 refresh
Date: Fri, 31 May 2019 21:10:46 +0800
Message-ID: <1559308246-11211-2-git-send-email-Prike.Liang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559308246-11211-1-git-send-email-Prike.Liang@amd.com>
References: <1559308246-11211-1-git-send-email-Prike.Liang@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.34.1.3]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(376002)(39860400002)(346002)(396003)(2980300002)(428003)(199004)(189003)(54906003)(70586007)(48376002)(2906002)(50466002)(4326008)(72206003)(76176011)(26005)(51416003)(86362001)(478600001)(81166006)(53936002)(68736007)(6916009)(8936002)(7696005)(50226002)(8676002)(81156014)(356004)(3846002)(14444005)(336012)(316002)(11346002)(16586007)(36756003)(6116002)(2616005)(2351001)(47776003)(70206006)(16526019)(476003)(305945005)(426003)(186003)(126002)(486006)(446003)(77096007)(7736002)(5660300002)(53416004)(6666004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2663; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdf076fc-b367-466d-021b-08d6e5c96f6d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BYAPR12MB2663; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2663:
X-Microsoft-Antispam-PRVS: <BYAPR12MB266325B2C70BD24C0030D8B4FB190@BYAPR12MB2663.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:350;
X-Forefront-PRVS: 00540983E2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 0M7YjQ9j4+uB4MigPfyaY2j6oExl7L5F/X/3r7ui6D8yIz3ZQvN3eoLT9VSKFudCiG0FIbttdGba9qY/dy1doU+gXv/dQVErEHC6EFrNRyFcIHLbAr5sCNQt8VgUmK3x24EqpJIkES5/yGHkUkNz1m2zLZQy4HPlGqzqNmYyEPk9S6rxauJnUEebZHqmHBY/9J6hqoq/SjeKeXEZwykrHDm3kISaquzZDFil6Wt6GCK57BOqn/lZP+eApSWYfmk1qYuew9MBA544QCwW829Yg4rgPiVwDbEOGVkDpWyRRk37LvNylxVqnbFvKclB6mrlr+kBXfgeqE124e/3rQCkhpFi0gz0vsQjjxALXd1lFOlazIVmV8B9jI9sZhbJN38lW8UJsLw26HY5pHmpXp8FfxO/oxgeV0bLK32bLSFwo2s=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2019 13:11:03.8154 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cdf076fc-b367-466d-021b-08d6e5c96f6d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2663
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pLPy4R21YYmb3Uo5vCPxZtYA0CLggcdvR/t7NpoYgaU=;
 b=eR4R1ryfH3SgX6Mn0GekSrlIizfgqiTFnlnG3TVMwoFpXGJS/rfETuEHspCso2Gh0kcp/BIbntOAHOnUr8BbHIF/f+30qm/zWsvyPJwl7FgYSGB1A89dq2asjnaNQFWM9+jnRXCwdPh5HejtmOQEzh+HSR6nKb7v1K7bo/3SRj0=
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
Cc: Alexander.Deucher@amd.com, Prike Liang <Prike.Liang@amd.com>,
 Ray.Huang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VXNlIFNNVSBmaXJtd2FyZSB2ZXJzaW9uIHRvIGluZGVudGlmeSB0aGUgcmF2ZW4xIHJlZnJlc2gg
ZGV2aWNlIGFuZAp0aGVuIGxvYWQgaG9tb2xvZ291cyBSTEMgRlcuCgpDaGFuZ2UtSWQ6IEk3YWFh
NjdkOGI1OWNmZWMwMzM1NWQ5MTk5ZjdmYjJjMzBjZTM5ODU2ClNpZ25lZC1vZmYtYnk6IFByaWtl
IExpYW5nIDxQcmlrZS5MaWFuZ0BhbWQuY29tPgpTdWdnZXN0ZWQtYnk6IFJheSBIdWFuZzxSYXku
SHVhbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2
aWNlLmMgfCAxMiArKystLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9wbS5jICAgICB8IDE1ICsrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3BtLmggICAgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4
X3Y5XzAuYyAgICAgIHwgMTQgKysrKysrKysrKysrKy0KIDQgZmlsZXMgY2hhbmdlZCwgMzIgaW5z
ZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2RldmljZS5jCmluZGV4IDZmZWEyZDEuLjQ0ZGQ5ZDggMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKQEAgLTE2MjAsNiArMTYyMCw3IEBAIHN0YXRp
YyBpbnQgYW1kZ3B1X2RldmljZV9md19sb2FkaW5nKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
KQogewogCWludCByID0gMDsKIAlpbnQgaTsKKwl1aW50MzJfdCBzbXVfdmVyc2lvbjsKIAogCWlm
IChhZGV2LT5hc2ljX3R5cGUgPj0gQ0hJUF9WRUdBMTApIHsKIAkJZm9yIChpID0gMDsgaSA8IGFk
ZXYtPm51bV9pcF9ibG9ja3M7IGkrKykgewpAQCAtMTY0NSwxNiArMTY0Niw5IEBAIHN0YXRpYyBp
bnQgYW1kZ3B1X2RldmljZV9md19sb2FkaW5nKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQog
CQkJfQogCQl9CiAJfQorCXIgPSBhbWRncHVfcG1fbG9hZF9zbXVfZmlybXdhcmUoYWRldiwgJnNt
dV92ZXJzaW9uKTsKIAotCWlmIChhZGV2LT5wb3dlcnBsYXkucHBfZnVuY3MgJiYgYWRldi0+cG93
ZXJwbGF5LnBwX2Z1bmNzLT5sb2FkX2Zpcm13YXJlKSB7Ci0JCXIgPSBhZGV2LT5wb3dlcnBsYXku
cHBfZnVuY3MtPmxvYWRfZmlybXdhcmUoYWRldi0+cG93ZXJwbGF5LnBwX2hhbmRsZSk7Ci0JCWlm
IChyKSB7Ci0JCQlwcl9lcnIoImZpcm13YXJlIGxvYWRpbmcgZmFpbGVkXG4iKTsKLQkJCXJldHVy
biByOwotCQl9Ci0JfQotCi0JcmV0dXJuIDA7CisJcmV0dXJuIHI7CiB9CiAKIC8qKgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYwppbmRleCBiZDQwZDVkLi5kYWU5YTU4IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYwpAQCAtMjY2OCw2ICsyNjY4LDIxIEBA
IHZvaWQgYW1kZ3B1X3BtX3ByaW50X3Bvd2VyX3N0YXRlcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldikKIAogfQogCitpbnQgYW1kZ3B1X3BtX2xvYWRfc211X2Zpcm13YXJlKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LCB1aW50MzJfdCAqc211X3ZlcnNpb24pCit7CisJaW50IHI7CisKKwlp
ZiAoYWRldi0+cG93ZXJwbGF5LnBwX2Z1bmNzICYmIGFkZXYtPnBvd2VycGxheS5wcF9mdW5jcy0+
bG9hZF9maXJtd2FyZSkgeworCQlyID0gYWRldi0+cG93ZXJwbGF5LnBwX2Z1bmNzLT5sb2FkX2Zp
cm13YXJlKGFkZXYtPnBvd2VycGxheS5wcF9oYW5kbGUpOworCQlpZiAocikgeworCQkJcHJfZXJy
KCJzbXUgZmlybXdhcmUgbG9hZGluZyBmYWlsZWRcbiIpOworCQkJcmV0dXJuIHI7CisJCX0KKwkJ
KnNtdV92ZXJzaW9uID0gYWRldi0+cG0uZndfdmVyc2lvbjsKKyAgICAgICAgICAgICAgICByZXR1
cm4gciA7CisJfQorfQorCiBpbnQgYW1kZ3B1X3BtX3N5c2ZzX2luaXQoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpCiB7CiAJc3RydWN0IHBwX2h3bWdyICpod21nciA9IGFkZXYtPnBvd2VycGxh
eS5wcF9oYW5kbGU7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcG0uaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5oCmluZGV4IGYy
MWE3NzEuLjdmZjBlNzYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9wbS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5oCkBA
IC0zNCw2ICszNCw3IEBAIHZvaWQgYW1kZ3B1X3BtX2FjcGlfZXZlbnRfaGFuZGxlcihzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldik7CiBpbnQgYW1kZ3B1X3BtX3N5c2ZzX2luaXQoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpOwogdm9pZCBhbWRncHVfcG1fc3lzZnNfZmluaShzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldik7CiB2b2lkIGFtZGdwdV9wbV9wcmludF9wb3dlcl9zdGF0ZXMoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOworaW50IGFtZGdwdV9wbV9sb2FkX3NtdV9maXJtd2Fy
ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3QgKnNtdV92ZXJzaW9uKTsKIHZv
aWQgYW1kZ3B1X3BtX2NvbXB1dGVfY2xvY2tzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsK
IHZvaWQgYW1kZ3B1X2RwbV90aGVybWFsX3dvcmtfaGFuZGxlcihzdHJ1Y3Qgd29ya19zdHJ1Y3Qg
KndvcmspOwogdm9pZCBhbWRncHVfZHBtX2VuYWJsZV91dmQoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsIGJvb2wgZW5hYmxlKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dmeF92OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCmlu
ZGV4IGM3NjM3MzMuLmUyMzM4NzIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dmeF92OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAu
YwpAQCAtMjgsNiArMjgsNyBAQAogI2luY2x1ZGUgInNvYzE1LmgiCiAjaW5jbHVkZSAic29jMTVk
LmgiCiAjaW5jbHVkZSAiYW1kZ3B1X2F0b21maXJtd2FyZS5oIgorI2luY2x1ZGUgImFtZGdwdV9w
bS5oIgogCiAjaW5jbHVkZSAiZ2MvZ2NfOV8wX29mZnNldC5oIgogI2luY2x1ZGUgImdjL2djXzlf
MF9zaF9tYXNrLmgiCkBAIC05Nyw2ICs5OCw3IEBAIE1PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L3Jh
dmVuMl9tZS5iaW4iKTsKIE1PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L3JhdmVuMl9tZWMuYmluIik7
CiBNT0RVTEVfRklSTVdBUkUoImFtZGdwdS9yYXZlbjJfbWVjMi5iaW4iKTsKIE1PRFVMRV9GSVJN
V0FSRSgiYW1kZ3B1L3JhdmVuMl9ybGMuYmluIik7CitNT0RVTEVfRklSTVdBUkUoImFtZGdwdS9y
YXZlbl9raWNrZXJfcmxjLmJpbiIpOwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IHNvYzE1X3JlZ19n
b2xkZW4gZ29sZGVuX3NldHRpbmdzX2djXzlfMFtdID0KIHsKQEAgLTU5MSw3ICs1OTMsOCBAQCBz
dGF0aWMgdm9pZCBnZnhfdjlfMF9jaGVja19pZl9uZWVkX2dmeG9mZihzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldikKIAljYXNlIENISVBfUkFWRU46CiAJCWlmIChhZGV2LT5yZXZfaWQgPj0gMHg4
IHx8IGFkZXYtPnBkZXYtPmRldmljZSA9PSAweDE1ZDgpCiAJCQlicmVhazsKLQkJaWYgKChhZGV2
LT5nZngucmxjX2Z3X3ZlcnNpb24gPCA1MzEpIHx8CisJCWlmICgoYWRldi0+Z2Z4LnJsY19md192
ZXJzaW9uICE9IDEwNiAmJgorCQkgICAgIGFkZXYtPmdmeC5ybGNfZndfdmVyc2lvbiA8IDUzMSkg
fHwKIAkJICAgIChhZGV2LT5nZngucmxjX2Z3X3ZlcnNpb24gPT0gNTM4MTUpIHx8CiAJCSAgICAo
YWRldi0+Z2Z4LnJsY19mZWF0dXJlX3ZlcnNpb24gPCAxKSB8fAogCQkgICAgIWFkZXYtPmdmeC5y
bGMuaXNfcmxjX3YyXzEpCkBAIC02MTUsNiArNjE4LDggQEAgc3RhdGljIGludCBnZnhfdjlfMF9p
bml0X21pY3JvY29kZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAl1bnNpZ25lZCBpbnQg
aSA9IDA7CiAJdWludDE2X3QgdmVyc2lvbl9tYWpvcjsKIAl1aW50MTZfdCB2ZXJzaW9uX21pbm9y
OworCXVpbnQzMl90IHNtdV92ZXJzaW9uOworCiAKIAlEUk1fREVCVUcoIlxuIik7CiAKQEAgLTY4
MSwxMCArNjg2LDE3IEBAIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfaW5pdF9taWNyb2NvZGUoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJICogICAgICAgICAgb3IgcmV2aXNpb24gPj0gMHhEOCAm
JiByZXZpc2lvbiA8PSAweERGCiAJICogb3RoZXJ3aXNlIGlzIFBDTyBGUDUKIAkgKi8KKwogCWlm
ICghc3RyY21wKGNoaXBfbmFtZSwgInBpY2Fzc28iKSAmJgogCQkoKChhZGV2LT5wZGV2LT5yZXZp
c2lvbiA+PSAweEM4KSAmJiAoYWRldi0+cGRldi0+cmV2aXNpb24gPD0gMHhDRikpIHx8CiAJCSgo
YWRldi0+cGRldi0+cmV2aXNpb24gPj0gMHhEOCkgJiYgKGFkZXYtPnBkZXYtPnJldmlzaW9uIDw9
IDB4REYpKSkpCiAJCXNucHJpbnRmKGZ3X25hbWUsIHNpemVvZihmd19uYW1lKSwgImFtZGdwdS8l
c19ybGNfYW00LmJpbiIsIGNoaXBfbmFtZSk7CisJZWxzZSBpZiAoIXN0cmNtcChjaGlwX25hbWUs
ICJyYXZlbiIpICYmICFhbWRncHVfcG1fbG9hZF9zbXVfZmlybXdhcmUoYWRldiwgJnNtdV92ZXJz
aW9uKSAmJgorCQkoc211X3ZlcnNpb24gPj0gMHg0MWUyYikpCisJLyoqCisJICpTTUMgaXMgbG9h
ZGVkIGJ5IFNCSU9TIG9uIEFQVSBhbmQgaXQncyBhYmxlIHRvIGdldCB0aGUgU01VIHZlcnNpb24g
ZGlyZWN0bHkuCisJICovCisJCXNucHJpbnRmKGZ3X25hbWUsIHNpemVvZihmd19uYW1lKSwgImFt
ZGdwdS8lc19raWNrZXJfcmxjLmJpbiIsIGNoaXBfbmFtZSk7CiAJZWxzZQogCQlzbnByaW50Zihm
d19uYW1lLCBzaXplb2YoZndfbmFtZSksICJhbWRncHUvJXNfcmxjLmJpbiIsIGNoaXBfbmFtZSk7
CiAJZXJyID0gcmVxdWVzdF9maXJtd2FyZSgmYWRldi0+Z2Z4LnJsY19mdywgZndfbmFtZSwgYWRl
di0+ZGV2KTsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
