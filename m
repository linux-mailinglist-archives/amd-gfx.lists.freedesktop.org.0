Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D5964A4B
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Jul 2019 17:59:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D12D6E10A;
	Wed, 10 Jul 2019 15:59:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780044.outbound.protection.outlook.com [40.107.78.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D7576E10A
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jul 2019 15:59:23 +0000 (UTC)
Received: from MWHPR12CA0032.namprd12.prod.outlook.com (2603:10b6:301:2::18)
 by CY4PR12MB1189.namprd12.prod.outlook.com (2603:10b6:903:38::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.19; Wed, 10 Jul
 2019 15:59:22 +0000
Received: from BY2NAM03FT004.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::207) by MWHPR12CA0032.outlook.office365.com
 (2603:10b6:301:2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.18 via Frontend
 Transport; Wed, 10 Jul 2019 15:59:21 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT004.mail.protection.outlook.com (10.152.84.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Wed, 10 Jul 2019 15:59:21 +0000
Received: from hawzhang-All-Series.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Wed, 10 Jul 2019 10:59:19 -0500
From: Hawking Zhang <Hawking.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Xiaojie Yuan <Xiaojie.Yuan@amd.com>, John
 Clements <John.Clements@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 2/2] drm/amdgpu: support key database loading for navi10
Date: Wed, 10 Jul 2019 23:58:58 +0800
Message-ID: <1562774338-4457-2-git-send-email-Hawking.Zhang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562774338-4457-1-git-send-email-Hawking.Zhang@amd.com>
References: <1562774338-4457-1-git-send-email-Hawking.Zhang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(376002)(136003)(396003)(2980300002)(428003)(199004)(189003)(51416003)(8676002)(70586007)(81166006)(14444005)(305945005)(53936002)(8936002)(47776003)(2906002)(2616005)(476003)(70206006)(81156014)(5660300002)(26005)(7696005)(6666004)(50226002)(486006)(478600001)(68736007)(446003)(6636002)(86362001)(186003)(110136005)(16586007)(316002)(11346002)(426003)(336012)(36756003)(76176011)(53416004)(48376002)(50466002)(356004)(4326008)(126002)(130980200001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1189; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92c7f6dd-1321-4c47-5552-08d7054f9289
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1189; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1189:
X-Microsoft-Antispam-PRVS: <CY4PR12MB11892FA8AA7CD539D6A68BC3FCF00@CY4PR12MB1189.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-Forefront-PRVS: 0094E3478A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 1+/b/U9zwmlpI48req/TONxJhJB2E8c2PJwgTuokcUIfEe+96t3sCweNmwnfEZHbToIVtKnHdMCLHXTeb37Xiziou7rxcjxXuDZIAsqB/15au7gkoIqkNrysBK+A3sx1ElC1Fez1pp8MW0RgTYYiTkO5QJTMfOoaCNtto4KBfvI1D3r2eTXqC2s3ciIavGD2jow6jVXy+r27ZnuhQFtGf+xdpceFcj1oh45AeaWD6zoiZxF4lca/elejfhUjg5VZIXPqjYv5E5pn7hXbRzX+FJt0RuPGxgwFLs6n9jY1UssXqyL3wvcz8qeXYfQ5RXpUAkJdVsqqH+1LXgRhRZc9uUeYCML+jOOoj0MAkiyhIURq+7Y0SUR5P8BHYb/l/FsqfOpqM1dwfrzkm+uvRAUb/ajIkOOnNHW3jRr0slH67Vo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2019 15:59:21.3201 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92c7f6dd-1321-4c47-5552-08d7054f9289
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1189
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K1i6lsmn6LSdCIch05Fh+YOL2FLiSWLSvpUhm7Nmz5Y=;
 b=s32mKIn26iSFVvav8+FIUcjX3/l9BYoGz3h+Nd6tki7/jZVERO9jezDVWz3jaoOS4uAzOgjNVkU5jqmbTLqEttZw5wfdq0C167P9O8E60zjRCckd7yMkPwDmbzQIdcpPqmyWdVuVyje5xwpqe9xs0n+o29+DrRrWRnflXdsd1sU=
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

U3RhcnRpbmcgZnJvbSBuYXZpMTAsIGRyaXZlciBzaG91bGQgc2VuZCBLZXkgRGF0YWJhc2UgTG9h
ZCBjb21tYW5kCnRvIEJvb3Rsb2FkZXIgYmVmb3JlIGxvYWRpbmcgc3lzX2RydiBhbmQgc29zCgpD
aGFuZ2UtSWQ6IEliODJkMjE4NDBmYjc3ZGEyMjE3ZGQ4YjhmMDEzMTc3ZTYxZDcyOTkwClNpZ25l
ZC1vZmYtYnk6IEpvaG4gQ2xlbWVudHMgPEpvaG4uQ2xlbWVudHNAYW1kLmNvbT4KU2lnbmVkLW9m
Zi1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYyAgIHwgMTAgKysrKysrKwogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5oICAgfCAgNSArKysrCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdWNvZGUuYyB8ICA2ICsrKysKIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV91Y29kZS5oIHwgIDMgKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3BzcF92MTFfMC5jICAgIHwgNDkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQog
NSBmaWxlcyBjaGFuZ2VkLCA3MiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jCmluZGV4IGVkNTgwZThiLi4zMzc4Y2IzOCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYwpAQCAtNzcwLDYgKzc3MCwx
NiBAQCBzdGF0aWMgaW50IHBzcF9od19zdGFydChzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCkKIAlp
bnQgcmV0OwogCiAJaWYgKCFhbWRncHVfc3Jpb3ZfdmYoYWRldikgfHwgIWFkZXYtPmluX2dwdV9y
ZXNldCkgeworCisJCWlmIChwc3AtPmtkYl9zdGFydF9hZGRyICYmCisJCSAgICAocHNwLT5mdW5j
cy0+Ym9vdGxvYWRlcl9sb2FkX2tkYiAhPSBOVUxMKSkgeworCQkJcmV0ID0gcHNwX2Jvb3Rsb2Fk
ZXJfbG9hZF9rZGIocHNwKTsKKwkJCWlmIChyZXQpIHsKKwkJCQlEUk1fRVJST1IoIlBTUCBsb2Fk
IGtkYiBmYWlsZWQhXG4iKTsKKwkJCQlyZXR1cm4gcmV0OworCQkJfQorCQl9CisKIAkJcmV0ID0g
cHNwX2Jvb3Rsb2FkZXJfbG9hZF9zeXNkcnYocHNwKTsKIAkJaWYgKHJldCkgewogCQkJRFJNX0VS
Uk9SKCJQU1AgbG9hZCBzeXNkcnYgZmFpbGVkIVxuIik7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcHNwLmgKaW5kZXggOGRkY2VjMS4uNmYxNzQ2YiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9wc3AuaApAQCAtODIsNiArODIsNyBAQCBlbnVtIHBzcF9yZWdfcHJv
Z19pZCB7CiBzdHJ1Y3QgcHNwX2Z1bmNzCiB7CiAJaW50ICgqaW5pdF9taWNyb2NvZGUpKHN0cnVj
dCBwc3BfY29udGV4dCAqcHNwKTsKKwlpbnQgKCpib290bG9hZGVyX2xvYWRfa2RiKShzdHJ1Y3Qg
cHNwX2NvbnRleHQgKnBzcCk7CiAJaW50ICgqYm9vdGxvYWRlcl9sb2FkX3N5c2Rydikoc3RydWN0
IHBzcF9jb250ZXh0ICpwc3ApOwogCWludCAoKmJvb3Rsb2FkZXJfbG9hZF9zb3MpKHN0cnVjdCBw
c3BfY29udGV4dCAqcHNwKTsKIAlpbnQgKCpyaW5nX2luaXQpKHN0cnVjdCBwc3BfY29udGV4dCAq
cHNwLCBlbnVtIHBzcF9yaW5nX3R5cGUgcmluZ190eXBlKTsKQEAgLTE2NSw5ICsxNjYsMTEgQEAg
c3RydWN0IHBzcF9jb250ZXh0CiAJdWludDMyX3QJCQlzeXNfYmluX3NpemU7CiAJdWludDMyX3QJ
CQlzb3NfYmluX3NpemU7CiAJdWludDMyX3QJCQl0b2NfYmluX3NpemU7CisJdWludDMyX3QJCQlr
ZGJfYmluX3NpemU7CiAJdWludDhfdAkJCQkqc3lzX3N0YXJ0X2FkZHI7CiAJdWludDhfdAkJCQkq
c29zX3N0YXJ0X2FkZHI7CiAJdWludDhfdAkJCQkqdG9jX3N0YXJ0X2FkZHI7CisJdWludDhfdAkJ
CQkqa2RiX3N0YXJ0X2FkZHI7CiAKIAkvKiB0bXIgYnVmZmVyICovCiAJc3RydWN0IGFtZGdwdV9i
bwkJKnRtcl9ibzsKQEAgLTIyOSw2ICsyMzIsOCBAQCBzdHJ1Y3QgYW1kZ3B1X3BzcF9mdW5jcyB7
CiAJCShwc3ApLT5mdW5jcy0+Y29tcGFyZV9zcmFtX2RhdGEoKHBzcCksICh1Y29kZSksICh0eXBl
KSkKICNkZWZpbmUgcHNwX2luaXRfbWljcm9jb2RlKHBzcCkgXAogCQkoKHBzcCktPmZ1bmNzLT5p
bml0X21pY3JvY29kZSA/IChwc3ApLT5mdW5jcy0+aW5pdF9taWNyb2NvZGUoKHBzcCkpIDogMCkK
KyNkZWZpbmUgcHNwX2Jvb3Rsb2FkZXJfbG9hZF9rZGIocHNwKSBcCisJCSgocHNwKS0+ZnVuY3Mt
PmJvb3Rsb2FkZXJfbG9hZF9rZGIgPyAocHNwKS0+ZnVuY3MtPmJvb3Rsb2FkZXJfbG9hZF9rZGIo
KHBzcCkpIDogMCkKICNkZWZpbmUgcHNwX2Jvb3Rsb2FkZXJfbG9hZF9zeXNkcnYocHNwKSBcCiAJ
CSgocHNwKS0+ZnVuY3MtPmJvb3Rsb2FkZXJfbG9hZF9zeXNkcnYgPyAocHNwKS0+ZnVuY3MtPmJv
b3Rsb2FkZXJfbG9hZF9zeXNkcnYoKHBzcCkpIDogMCkKICNkZWZpbmUgcHNwX2Jvb3Rsb2FkZXJf
bG9hZF9zb3MocHNwKSBcCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdWNvZGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91Y29kZS5j
CmluZGV4IGJmN2U4YmEuLjIwNDJiNjAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV91Y29kZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV91Y29kZS5jCkBAIC0yNjIsNiArMjYyLDEyIEBAIHZvaWQgYW1kZ3B1X3Vjb2RlX3ByaW50
X3BzcF9oZHIoY29uc3Qgc3RydWN0IGNvbW1vbl9maXJtd2FyZV9oZWFkZXIgKmhkcikKIAkJCQkg
IGxlMzJfdG9fY3B1KHBzcF9oZHJfdjFfMS0+dG9jX29mZnNldF9ieXRlcykpOwogCQkJRFJNX0RF
QlVHKCJ0b2Nfc2l6ZV9ieXRlczogJXVcbiIsCiAJCQkJICBsZTMyX3RvX2NwdShwc3BfaGRyX3Yx
XzEtPnRvY19zaXplX2J5dGVzKSk7CisJCQlEUk1fREVCVUcoImtkYl9oZWFkZXJfdmVyc2lvbjog
JXVcbiIsCisJCQkJICBsZTMyX3RvX2NwdShwc3BfaGRyX3YxXzEtPmtkYl9oZWFkZXJfdmVyc2lv
bikpOworCQkJRFJNX0RFQlVHKCJrZGJfb2Zmc2V0X2J5dGVzOiAldVxuIiwKKwkJCQkgIGxlMzJf
dG9fY3B1KHBzcF9oZHJfdjFfMS0+a2RiX29mZnNldF9ieXRlcykpOworCQkJRFJNX0RFQlVHKCJr
ZGJfc2l6ZV9ieXRlczogJXVcbiIsCisJCQkJICBsZTMyX3RvX2NwdShwc3BfaGRyX3YxXzEtPmtk
Yl9zaXplX2J5dGVzKSk7CiAJCX0KIAl9IGVsc2UgewogCQlEUk1fRVJST1IoIlVua25vd24gUFNQ
IHVjb2RlIHZlcnNpb246ICV1LiV1XG4iLApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3Vjb2RlLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdWNvZGUuaAppbmRleCBmNDY5NDQ0NS4uYzFmYjZkYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Vjb2RlLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3Vjb2RlLmgKQEAgLTg1LDYgKzg1LDkgQEAgc3RydWN0IHBzcF9maXJt
d2FyZV9oZWFkZXJfdjFfMSB7CiAJdWludDMyX3QgdG9jX2hlYWRlcl92ZXJzaW9uOwogCXVpbnQz
Ml90IHRvY19vZmZzZXRfYnl0ZXM7CiAJdWludDMyX3QgdG9jX3NpemVfYnl0ZXM7CisJdWludDMy
X3Qga2RiX2hlYWRlcl92ZXJzaW9uOworCXVpbnQzMl90IGtkYl9vZmZzZXRfYnl0ZXM7CisJdWlu
dDMyX3Qga2RiX3NpemVfYnl0ZXM7CiB9OwogCiAvKiB2ZXJzaW9uX21ham9yPTEsIHZlcnNpb25f
bWlub3I9MCAqLwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3Yx
MV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYwppbmRleCBlNzg0
MDkxLi5hYzdmMzUyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3Bf
djExXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYwpAQCAt
MTA2LDYgKzEwNiwxMCBAQCBzdGF0aWMgaW50IHBzcF92MTFfMF9pbml0X21pY3JvY29kZShzdHJ1
Y3QgcHNwX2NvbnRleHQgKnBzcCkKIAkJCWFkZXYtPnBzcC50b2NfYmluX3NpemUgPSBsZTMyX3Rv
X2NwdShzb3NfaGRyX3YxXzEtPnRvY19zaXplX2J5dGVzKTsKIAkJCWFkZXYtPnBzcC50b2Nfc3Rh
cnRfYWRkciA9ICh1aW50OF90ICopYWRldi0+cHNwLnN5c19zdGFydF9hZGRyICsKIAkJCQkJbGUz
Ml90b19jcHUoc29zX2hkcl92MV8xLT50b2Nfb2Zmc2V0X2J5dGVzKTsKKworCQkJYWRldi0+cHNw
LmtkYl9iaW5fc2l6ZSA9IGxlMzJfdG9fY3B1KHNvc19oZHJfdjFfMS0+a2RiX3NpemVfYnl0ZXMp
OworCQkJYWRldi0+cHNwLmtkYl9zdGFydF9hZGRyID0gKHVpbnQ4X3QgKilhZGV2LT5wc3Auc3lz
X3N0YXJ0X2FkZHIgKworCQkJCQlsZTMyX3RvX2NwdShzb3NfaGRyX3YxXzEtPmtkYl9vZmZzZXRf
Ynl0ZXMpOwogCQl9CiAJCWJyZWFrOwogCWRlZmF1bHQ6CkBAIC0xODEsNiArMTg1LDQ4IEBAIHN0
YXRpYyBpbnQgcHNwX3YxMV8wX2luaXRfbWljcm9jb2RlKHN0cnVjdCBwc3BfY29udGV4dCAqcHNw
KQogCXJldHVybiBlcnI7CiB9CiAKK3N0YXRpYyBpbnQgcHNwX3YxMV8wX2Jvb3Rsb2FkZXJfbG9h
ZF9rZGIoc3RydWN0IHBzcF9jb250ZXh0ICpwc3ApCit7CisJaW50IHJldDsKKwl1aW50MzJfdCBw
c3BfZ2Z4ZHJ2X2NvbW1hbmRfcmVnID0gMDsKKwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9
IHBzcC0+YWRldjsKKwl1aW50MzJfdCBzb2xfcmVnOworCisJLyogQ2hlY2sgdE9TIHNpZ24gb2Yg
bGlmZSByZWdpc3RlciB0byBjb25maXJtIHN5cyBkcml2ZXIgYW5kIHNPUworCSAqIGFyZSBhbHJl
YWR5IGJlZW4gbG9hZGVkLgorCSAqLworCXNvbF9yZWcgPSBSUkVHMzJfU09DMTUoTVAwLCAwLCBt
bU1QMF9TTU5fQzJQTVNHXzgxKTsKKwlpZiAoc29sX3JlZykgeworCQlwc3AtPnNvc19md192ZXJz
aW9uID0gUlJFRzMyX1NPQzE1KE1QMCwgMCwgbW1NUDBfU01OX0MyUE1TR181OCk7CisJCWRldl9p
bmZvKGFkZXYtPmRldiwgInNvcyBmdyB2ZXJzaW9uID0gMHgleC5cbiIsIHBzcC0+c29zX2Z3X3Zl
cnNpb24pOworCQlyZXR1cm4gMDsKKwl9CisKKwkvKiBXYWl0IGZvciBib290bG9hZGVyIHRvIHNp
Z25pZnkgdGhhdCBpcyByZWFkeSBoYXZpbmcgYml0IDMxIG9mIEMyUE1TR18zNSBzZXQgdG8gMSAq
LworCXJldCA9IHBzcF93YWl0X2Zvcihwc3AsIFNPQzE1X1JFR19PRkZTRVQoTVAwLCAwLCBtbU1Q
MF9TTU5fQzJQTVNHXzM1KSwKKwkJCSAgIDB4ODAwMDAwMDAsIDB4ODAwMDAwMDAsIGZhbHNlKTsK
KwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OworCisJbWVtc2V0KHBzcC0+ZndfcHJpX2J1ZiwgMCwg
UFNQXzFfTUVHKTsKKworCS8qIENvcHkgUFNQIEtEQiBiaW5hcnkgdG8gbWVtb3J5ICovCisJbWVt
Y3B5KHBzcC0+ZndfcHJpX2J1ZiwgcHNwLT5rZGJfc3RhcnRfYWRkciwgcHNwLT5rZGJfYmluX3Np
emUpOworCisJLyogUHJvdmlkZSB0aGUgc3lzIGRyaXZlciB0byBib290bG9hZGVyICovCisJV1JF
RzMyX1NPQzE1KE1QMCwgMCwgbW1NUDBfU01OX0MyUE1TR18zNiwKKwkgICAgICAgKHVpbnQzMl90
KShwc3AtPmZ3X3ByaV9tY19hZGRyID4+IDIwKSk7CisJcHNwX2dmeGRydl9jb21tYW5kX3JlZyA9
IFBTUF9CTF9fTE9BRF9LRVlfREFUQUJBU0U7CisJV1JFRzMyX1NPQzE1KE1QMCwgMCwgbW1NUDBf
U01OX0MyUE1TR18zNSwKKwkgICAgICAgcHNwX2dmeGRydl9jb21tYW5kX3JlZyk7CisKKwkvKiBX
YWl0IGZvciBib290bG9hZGVyIHRvIHNpZ25pZnkgdGhhdCBpcyByZWFkeSBoYXZpbmcgIGJpdCAz
MSBvZiBDMlBNU0dfMzUgc2V0IHRvIDEqLworCXJldCA9IHBzcF93YWl0X2Zvcihwc3AsIFNPQzE1
X1JFR19PRkZTRVQoTVAwLCAwLCBtbU1QMF9TTU5fQzJQTVNHXzM1KSwKKwkJCSAgIDB4ODAwMDAw
MDAsIDB4ODAwMDAwMDAsIGZhbHNlKTsKKworCXJldHVybiByZXQ7Cit9CisKIHN0YXRpYyBpbnQg
cHNwX3YxMV8wX2Jvb3Rsb2FkZXJfbG9hZF9zeXNkcnYoc3RydWN0IHBzcF9jb250ZXh0ICpwc3Ap
CiB7CiAJaW50IHJldDsKQEAgLTE5NCw3ICsyNDAsNyBAQCBzdGF0aWMgaW50IHBzcF92MTFfMF9i
b290bG9hZGVyX2xvYWRfc3lzZHJ2KHN0cnVjdCBwc3BfY29udGV4dCAqcHNwKQogCXNvbF9yZWcg
PSBSUkVHMzJfU09DMTUoTVAwLCAwLCBtbU1QMF9TTU5fQzJQTVNHXzgxKTsKIAlpZiAoc29sX3Jl
ZykgewogCQlwc3AtPnNvc19md192ZXJzaW9uID0gUlJFRzMyX1NPQzE1KE1QMCwgMCwgbW1NUDBf
U01OX0MyUE1TR181OCk7Ci0JCXByaW50aygic29zIGZ3IHZlcnNpb24gPSAweCV4LlxuIiwgcHNw
LT5zb3NfZndfdmVyc2lvbik7CisJCWRldl9pbmZvKGFkZXYtPmRldiwgInNvcyBmdyB2ZXJzaW9u
ID0gMHgleC5cbiIsIHBzcC0+c29zX2Z3X3ZlcnNpb24pOwogCQlyZXR1cm4gMDsKIAl9CiAKQEAg
LTgyNiw2ICs4NzIsNyBAQCBzdGF0aWMgaW50IHBzcF92MTFfMF9ybGNfYXV0b2xvYWRfc3RhcnQo
c3RydWN0IHBzcF9jb250ZXh0ICpwc3ApCiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcHNwX2Z1bmNz
IHBzcF92MTFfMF9mdW5jcyA9IHsKIAkuaW5pdF9taWNyb2NvZGUgPSBwc3BfdjExXzBfaW5pdF9t
aWNyb2NvZGUsCisJLmJvb3Rsb2FkZXJfbG9hZF9rZGIgPSBwc3BfdjExXzBfYm9vdGxvYWRlcl9s
b2FkX2tkYiwKIAkuYm9vdGxvYWRlcl9sb2FkX3N5c2RydiA9IHBzcF92MTFfMF9ib290bG9hZGVy
X2xvYWRfc3lzZHJ2LAogCS5ib290bG9hZGVyX2xvYWRfc29zID0gcHNwX3YxMV8wX2Jvb3Rsb2Fk
ZXJfbG9hZF9zb3MsCiAJLnJpbmdfaW5pdCA9IHBzcF92MTFfMF9yaW5nX2luaXQsCi0tIAoyLjcu
NAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
