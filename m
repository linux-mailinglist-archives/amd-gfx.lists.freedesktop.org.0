Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9ABD59E1
	for <lists+amd-gfx@lfdr.de>; Mon, 14 Oct 2019 05:21:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B1A6E1BC;
	Mon, 14 Oct 2019 03:21:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740059.outbound.protection.outlook.com [40.107.74.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098A46E1BB
 for <amd-gfx@lists.freedesktop.org>; Mon, 14 Oct 2019 03:21:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K1jAj7n/QTfFRdFaX06SI6y9IaGUizG3JXMMxCNPzUxwYEGL11wbTl5BMqyrJ7y4RvM58uPktykaDEp5PxJasl1wWYsxcCBow5m3+2AbZHLgQzE5h4YI7APE/g9rQ1kzkYmmQzRjr9VOCB7QvgGbZw8ch8qrTdEgKuhaafce9lkFeqsH0bPmUfRCLechPJue4XfJpJWWzi5bEb8zo9efsAxLmm5bHDxYQM9Q8UvyVXjIOCERLT14j2mr9eDuvRg7ZIWRef7yMQdUuCLfsK8x1+Na4zJ+j5wcbM2hULRMA56lJDznmd+xhoriJwOCvgUAnBbKrlwuBHgPXl1WEbIM1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HqEIcO6/iZ+/9jy1pbxm3Az36SAm0j34yh3uaOlGeNY=;
 b=d+t1AWwLqbHW9HUuE+OGQy70IQ0CRoRDGv5eyWOCBNC7zI553t1JZPPHhsZGUmhxe1OB8mb7bl+lUAg4P3ph9JE17j/6R/GgC9nThGdsToQKbLcWm7s0QH3/wjHImGtbKDR6EU7lQreVEsLjxo/E4hXdDcqHhZm0tHua17qP0tETum8I1znZEV7dXrnF8taXgHFAUXGvJ6SioeIraQUOqVfI0DG4wkEdb4y27dD8lf2PWfX4yzRVdF4TxmgzPLtxAOxBW0FgtQTUyCMHOaY4yWCS1mnJ0MGlk/1I3Kl7VWyYDvuVmdEVqc5YvaVRVOSKmcX03hZCohY4edFYBRBREw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN4PR12CA0003.namprd12.prod.outlook.com (2603:10b6:403:2::13)
 by SN6PR12MB2606.namprd12.prod.outlook.com (2603:10b6:805:6e::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.17; Mon, 14 Oct
 2019 03:21:28 +0000
Received: from CO1NAM03FT035.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::202) by BN4PR12CA0003.outlook.office365.com
 (2603:10b6:403:2::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Mon, 14 Oct 2019 03:21:27 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM03FT035.mail.protection.outlook.com (10.152.80.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2347.21 via Frontend Transport; Mon, 14 Oct 2019 03:21:27 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sun, 13 Oct
 2019 22:21:26 -0500
Received: from rico-code.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Sun, 13 Oct 2019 22:21:24 -0500
From: Tianci Yin <tianci.yin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/8] drm/amdgpu: introduce psp_v11_0_is_sos_alive interface(v2)
Date: Mon, 14 Oct 2019 11:21:13 +0800
Message-ID: <20191014032118.14020-3-tianci.yin@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191014032118.14020-1-tianci.yin@amd.com>
References: <20191014032118.14020-1-tianci.yin@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(39860400002)(396003)(428003)(199004)(189003)(36756003)(186003)(305945005)(70206006)(48376002)(6916009)(26005)(2351001)(478600001)(5660300002)(1076003)(70586007)(2906002)(53416004)(51416003)(76176011)(7696005)(81166006)(47776003)(50466002)(2616005)(486006)(8676002)(126002)(8936002)(6666004)(11346002)(356004)(4326008)(81156014)(446003)(50226002)(44832011)(316002)(476003)(336012)(426003)(14444005)(16586007)(54906003)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2606; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53dbefe1-7f69-4bce-a87c-08d7505599a5
X-MS-TrafficTypeDiagnostic: SN6PR12MB2606:
X-Microsoft-Antispam-PRVS: <SN6PR12MB26060FAB4AC31B8F2ED237DB95900@SN6PR12MB2606.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-Forefront-PRVS: 01901B3451
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KA+6Gh6PXvpZ58uMEGDt4I6XkTkGp3f9ugt4dRO8Q9bo6YcmwvawxJTAYHec9i25otn0P9zlozI172R1E3l2Yl+90xW787GVVzgeMETyN9tuVFx0vEnxGHw6RsJg5ceIdrliwPFvdmypxwvhr8x2bq4oDT7MKi3HXJr82ML0GX6Z8tt0t5eDsAksJVEfVZDwyBthH3M7DqOJlqCdIBjfdcs6eb1VCsLTPlm3t6MlVVo2g6dsGhxpkrnff8ZPkrGHWdH+Pva5OlnUImq/4u6KSBh1KJyjMA5pEctfAL1E0sGV3+uMU+t9ppXPEzvFeIwgFcvOSb18f/3mmhK4aEJt4yPAjNgcF/CFucvm7YAyI8E79asvVWrT1M9s+rry/3WV5Br59WxIDBO/tUYBFZjdRaESPkWjYP1ntFz7ZGmbwo8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2019 03:21:27.4756 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53dbefe1-7f69-4bce-a87c-08d7505599a5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2606
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HqEIcO6/iZ+/9jy1pbxm3Az36SAm0j34yh3uaOlGeNY=;
 b=srAA7ftvaCm4mFHA47sWW8lkMiN/tWM7XkOaewIXShxdwFZ+q6q9Yl/vGnMg9vWWAC/RtV4kXVYeuZMr+IY1+3jVCkzrGJRwH4eFAQwxTuiHpgVCz4bDeZRZqNUF6F/zzkMJBZ+8FK3injtGfPF9uyZG2D+vU0lTr/eqpUZmcIk=
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
