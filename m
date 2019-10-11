Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 550C6D380A
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 05:50:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85426EB95;
	Fri, 11 Oct 2019 03:50:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690040.outbound.protection.outlook.com [40.107.69.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D02806EB95
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 03:50:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vy2F4AL4yllL92ZNtRXzfpZkXK72zH0K9kvc9QSKlQR4fcdeK5IUv/YSW5w3Ew3FjXnRc/KEvBTRix4Ukvy6ID7wgrfIjiZrqqy/J3Q1BdGJPAhfoQlOET4YOJtNbYhDwf4V+g89J0+Jx8P9k82LA5Y+rbXDaYZJST+uvE+esKgC8/1Xl6IeRmyc+aphlS7hDrE/dkxcOiirTPMVoX7pwTH4BpMsT6Ip6epXgDLIwXqheBQFtEnKQVqq/qfD/089awqGZH58jau6koo99XlMyR14UaptsVDuYxnZ7g3lU2GeufvMbUgY8+/hZr2L/t5hQ+zGNhRr1TtWbzedFhO0ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HqEIcO6/iZ+/9jy1pbxm3Az36SAm0j34yh3uaOlGeNY=;
 b=EKXuRarAFQnI8Xs+JIUG4OeV1IOMwt4iv6W4rNSPDrNQPiEr0YK8fcu6J1shQDBI/0YM8S5KZ09boIaz+rrJveOyQ6OnoVPuWezwjV4i0beiLPN2RARaHzVmzJF/+4vufhd3neSy96osiXEbcH8VXEgkg6trrrXDrpdkmjcmGCerxvwLE1BaKHybDAl++RAKh4n4pZPzfuyBWIg0CXee3RyHPxAXHuHKdImYqjj1DoSI7KfCPsYjJ0ZtsM2OPurwXKWKsu9buxN6W62MPSLcg29HYtq03yTpykbAXn8GaBcQLUHEHovtyP0jEabhsJrMyIZ3i6N3PZXaiMFXCLlfPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0030.namprd12.prod.outlook.com (2603:10b6:610:57::40)
 by DM6PR12MB3737.namprd12.prod.outlook.com (2603:10b6:5:1c3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.21; Fri, 11 Oct
 2019 03:50:52 +0000
Received: from BY2NAM03FT028.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::204) by CH2PR12CA0030.outlook.office365.com
 (2603:10b6:610:57::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Fri, 11 Oct 2019 03:50:51 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT028.mail.protection.outlook.com (10.152.84.238) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Fri, 11 Oct 2019 03:50:51 +0000
Received: from rico-code.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 10 Oct 2019
 22:50:49 -0500
From: Tianci Yin <tianci.yin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/8] drm/amdgpu: introduce psp_v11_0_is_sos_alive interface
Date: Fri, 11 Oct 2019 11:50:28 +0800
Message-ID: <20191011035033.24935-3-tianci.yin@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011035033.24935-1-tianci.yin@amd.com>
References: <20191011035033.24935-1-tianci.yin@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(376002)(136003)(396003)(428003)(189003)(199004)(356004)(6666004)(14444005)(47776003)(5660300002)(8676002)(81156014)(81166006)(8936002)(11346002)(2906002)(486006)(446003)(7696005)(426003)(476003)(51416003)(336012)(26005)(36756003)(478600001)(126002)(2616005)(76176011)(186003)(44832011)(48376002)(4326008)(70586007)(70206006)(54906003)(53416004)(50226002)(305945005)(1076003)(50466002)(6916009)(16586007)(86362001)(2351001)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3737; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99c17f8f-69ee-4898-bfe2-08d74dfe35d8
X-MS-TrafficTypeDiagnostic: DM6PR12MB3737:
X-Microsoft-Antispam-PRVS: <DM6PR12MB37371C79C6FB703E39FAE3DE95970@DM6PR12MB3737.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-Forefront-PRVS: 0187F3EA14
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /laX/rw2uUE9mc4YYYBSOeJ61wSofzyeOPXGs13WzPwjB0mnHld2Xrb0ddlmTgfFzIbhNXv2A0V6XiLR9O4P/MmTEy1HGw8MesyHas/zjkI/6omsQGPwXogj11Iqq20h5MJiNMIX6LYKmLa1T4E4C4PGOJgX1P7UVnGB1LmwvabJLhrKIDqIEe5D3wcR3wUOlJif/+ygwQBpCn5wDyQfwW1D7nHoICtxYd+wmBjSAjUBY+0Z8FNAfU1ZTKIIawDENopNXy0IiTxDvBXxylCJA0mtSpanqJQKXoIvSqFku3K7zq+F3C2oYCYAqB0zp/KVTzchQHN2mh9mqCTUD7vxXLqaw5lbhakXRemC8RvfhCBwNhkWlNty+K0wfBDT+iJWl7mgtlUi9ur2xGeknmMzm0MG2QFNrZQ3xXxhJ8AofHk=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 03:50:51.5022 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99c17f8f-69ee-4898-bfe2-08d74dfe35d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3737
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HqEIcO6/iZ+/9jy1pbxm3Az36SAm0j34yh3uaOlGeNY=;
 b=1ijhlJzEMFuKmu7p1E5b+Crwv4BvapaUdl7eRTjh6jnSAeVWQZ5jVWUcfzR4v9To9+ME6U3/l2maURUpv81uZkmkJb6nddqaKvZywWASDIydROkut4e1tKcUdyf4QYav52sre+4p5b7mb50Kzm1/kJefx55LhAInAs0oL1RWyUI=
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
Cc: Deucher Alexander <Alexander.Deucher@amd.com>,
 Tuikov Luben <Luben.Tuikov@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Tianci Yin <tianci.yin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogIlRpYW5jaS5ZaW4iIDx0aWFuY2kueWluQGFtZC5jb20+CgppbnRyb2R1Y2UgcHNwX3Yx
MV8wX2lzX3Nvc19hbGl2ZSBmdW5jIGZvciBjb21tb24gdXNlLgoKQ2hhbmdlLUlkOiBJZWUwYTZk
ZDkyNGQ2YTRiMTY0ZWI3NTFjMGJlYzQ5ZmNiN2Q3OTQ4MwpSZXZpZXdlZC1ieTogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBUaWFuY2kuWWlu
IDx0aWFuY2kueWluQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNw
X3YxMV8wLmMgfCAyMiArKysrKysrKysrKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTMg
aW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Bz
cF92MTFfMC5jCmluZGV4IDA0MzE4Y2ZkNTBhOC4uMmJhMGY2OGNlZDEwIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYwpAQCAtMjA2LDE4ICsyMDYsMjYgQEAgc3RhdGljIGlu
dCBwc3BfdjExXzBfaW5pdF9taWNyb2NvZGUoc3RydWN0IHBzcF9jb250ZXh0ICpwc3ApCiAJcmV0
dXJuIGVycjsKIH0KIAorc3RhdGljIGJvb2wgcHNwX3YxMV8wX2lzX3Nvc19hbGl2ZShzdHJ1Y3Qg
cHNwX2NvbnRleHQgKnBzcCkKK3sKKwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHBzcC0+
YWRldjsKKwl1aW50MzJfdCBzb2xfcmVnOworCisJc29sX3JlZyA9IFJSRUczMl9TT0MxNShNUDAs
IDAsIG1tTVAwX1NNTl9DMlBNU0dfODEpOworCisJcmV0dXJuIHNvbF9yZWcgIT0gMHgwOworfQor
CiBzdGF0aWMgaW50IHBzcF92MTFfMF9ib290bG9hZGVyX2xvYWRfa2RiKHN0cnVjdCBwc3BfY29u
dGV4dCAqcHNwKQogewogCWludCByZXQ7CiAJdWludDMyX3QgcHNwX2dmeGRydl9jb21tYW5kX3Jl
ZyA9IDA7CiAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBwc3AtPmFkZXY7Ci0JdWludDMy
X3Qgc29sX3JlZzsKIAogCS8qIENoZWNrIHRPUyBzaWduIG9mIGxpZmUgcmVnaXN0ZXIgdG8gY29u
ZmlybSBzeXMgZHJpdmVyIGFuZCBzT1MKIAkgKiBhcmUgYWxyZWFkeSBiZWVuIGxvYWRlZC4KIAkg
Ki8KLQlzb2xfcmVnID0gUlJFRzMyX1NPQzE1KE1QMCwgMCwgbW1NUDBfU01OX0MyUE1TR184MSk7
Ci0JaWYgKHNvbF9yZWcpIHsKKwlpZiAocHNwX3YxMV8wX2lzX3Nvc19hbGl2ZShwc3ApKSB7CiAJ
CXBzcC0+c29zX2Z3X3ZlcnNpb24gPSBSUkVHMzJfU09DMTUoTVAwLCAwLCBtbU1QMF9TTU5fQzJQ
TVNHXzU4KTsKIAkJZGV2X2luZm8oYWRldi0+ZGV2LCAic29zIGZ3IHZlcnNpb24gPSAweCV4Llxu
IiwgcHNwLT5zb3NfZndfdmVyc2lvbik7CiAJCXJldHVybiAwOwpAQCAtMjUzLDEzICsyNjEsMTEg
QEAgc3RhdGljIGludCBwc3BfdjExXzBfYm9vdGxvYWRlcl9sb2FkX3N5c2RydihzdHJ1Y3QgcHNw
X2NvbnRleHQgKnBzcCkKIAlpbnQgcmV0OwogCXVpbnQzMl90IHBzcF9nZnhkcnZfY29tbWFuZF9y
ZWcgPSAwOwogCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gcHNwLT5hZGV2OwotCXVpbnQz
Ml90IHNvbF9yZWc7CiAKIAkvKiBDaGVjayBzT1Mgc2lnbiBvZiBsaWZlIHJlZ2lzdGVyIHRvIGNv
bmZpcm0gc3lzIGRyaXZlciBhbmQgc09TCiAJICogYXJlIGFscmVhZHkgYmVlbiBsb2FkZWQuCiAJ
ICovCi0Jc29sX3JlZyA9IFJSRUczMl9TT0MxNShNUDAsIDAsIG1tTVAwX1NNTl9DMlBNU0dfODEp
OwotCWlmIChzb2xfcmVnKSB7CisJaWYgKHBzcF92MTFfMF9pc19zb3NfYWxpdmUocHNwKSkgewog
CQlwc3AtPnNvc19md192ZXJzaW9uID0gUlJFRzMyX1NPQzE1KE1QMCwgMCwgbW1NUDBfU01OX0My
UE1TR181OCk7CiAJCWRldl9pbmZvKGFkZXYtPmRldiwgInNvcyBmdyB2ZXJzaW9uID0gMHgleC5c
biIsIHBzcC0+c29zX2Z3X3ZlcnNpb24pOwogCQlyZXR1cm4gMDsKQEAgLTI5NywxMyArMzAzLDEx
IEBAIHN0YXRpYyBpbnQgcHNwX3YxMV8wX2Jvb3Rsb2FkZXJfbG9hZF9zb3Moc3RydWN0IHBzcF9j
b250ZXh0ICpwc3ApCiAJaW50IHJldDsKIAl1bnNpZ25lZCBpbnQgcHNwX2dmeGRydl9jb21tYW5k
X3JlZyA9IDA7CiAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBwc3AtPmFkZXY7Ci0JdWlu
dDMyX3Qgc29sX3JlZzsKIAogCS8qIENoZWNrIHNPUyBzaWduIG9mIGxpZmUgcmVnaXN0ZXIgdG8g
Y29uZmlybSBzeXMgZHJpdmVyIGFuZCBzT1MKIAkgKiBhcmUgYWxyZWFkeSBiZWVuIGxvYWRlZC4K
IAkgKi8KLQlzb2xfcmVnID0gUlJFRzMyX1NPQzE1KE1QMCwgMCwgbW1NUDBfU01OX0MyUE1TR184
MSk7Ci0JaWYgKHNvbF9yZWcpCisJaWYgKHBzcF92MTFfMF9pc19zb3NfYWxpdmUocHNwKSkKIAkJ
cmV0dXJuIDA7CiAKIAkvKiBXYWl0IGZvciBib290bG9hZGVyIHRvIHNpZ25pZnkgdGhhdCBpcyBy
ZWFkeSBoYXZpbmcgYml0IDMxIG9mIEMyUE1TR18zNSBzZXQgdG8gMSAqLwotLSAKMi4xNy4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
