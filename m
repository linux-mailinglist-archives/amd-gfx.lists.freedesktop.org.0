Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E68CBD48AD
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 21:53:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA19A6EC92;
	Fri, 11 Oct 2019 19:53:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740081.outbound.protection.outlook.com [40.107.74.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 424A76EC93
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 19:53:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dRARnehrLR9B+Hwo1vrwnkcZ+QUeor8wc1ysma1N1OaV2Rkw6L7STMYcxUIs8kEP6txeUQBReMkO7Mz4rC/9Sq+Q3G4aEgJKYEf51JfHuZhU8czsyEyXko3CdhXQ529BZCJ75ZkiIrnm3iX0RImuGt/Vcye9rFc/bEMaDyp8arUULmKs4Ffi1wLh/HRhk3x+d9Mw9go2O/F3bvUvwhhlTJtrPtcKz959XChpmkhJPsLpoBn1iydPsEQzUyY/+pNpzF0bQvCD70m2CLDu3yydh2EuAFvtligxZMd2Q+HXoj2Zi7u3b4qFjHQhvyfv8d2Gj6UvSC7kCSj57hViwhYUWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lsRamgrUP/zoL76weZnPTYoNqAmD0vFGx46FdYljug=;
 b=lRRVCS+alKfuTeFHnvrPkAb7lx8dphK8VcGNBv5WExgiYELWAD/bneEELetEL6kQB+YAYYbMl5pKowqS35LeDb68m4oU3Cqt5r5RQwNDpi4G6fiQTyh2+GulM0a+VskaFMVFI0VFHZTEpe0lwSdb9g1ZmePbIfR/bF3a06k3aQflTNaXR8Z2l8feJeR1ncaKBuc+S6zzkFx2cjYIo4QhDyGYVrqLoHhT1ncZt31M8KZ1jPm5RSTYEI3RLV0WMqfn/c6UoXW1R85mqAjkCCWdKQgXLOQdCuFTVbd7OXxXo3W80lioaxoy1GQGaXkVueZXwUoPSUgBBzNK/YxocsUHqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0020.namprd12.prod.outlook.com (2603:10b6:5:1c0::33)
 by MN2PR12MB4285.namprd12.prod.outlook.com (2603:10b6:208:1d7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Fri, 11 Oct
 2019 19:53:49 +0000
Received: from BY2NAM03FT051.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by DM6PR12CA0020.outlook.office365.com
 (2603:10b6:5:1c0::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Fri, 11 Oct 2019 19:53:49 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT051.mail.protection.outlook.com (10.152.85.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2347.21 via Frontend Transport; Fri, 11 Oct 2019 19:53:49 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 11 Oct 2019
 14:53:45 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 11/29] drm/amd/display: fix incorrect page table address for
 renoir
Date: Fri, 11 Oct 2019 15:53:06 -0400
Message-ID: <20191011195324.16268-12-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
References: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(376002)(136003)(39860400002)(428003)(189003)(199004)(86362001)(305945005)(11346002)(426003)(47776003)(36756003)(2616005)(478600001)(53416004)(5660300002)(50226002)(2351001)(76176011)(8936002)(4326008)(70206006)(51416003)(316002)(70586007)(26005)(6666004)(446003)(126002)(2906002)(476003)(16586007)(1076003)(81156014)(81166006)(6916009)(48376002)(8676002)(186003)(50466002)(486006)(356004)(7696005)(336012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4285; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8913cd1a-c357-4dbf-f40d-08d74e84bbfc
X-MS-TrafficTypeDiagnostic: MN2PR12MB4285:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4285B5FD5D942038FBF42603F9970@MN2PR12MB4285.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-Forefront-PRVS: 0187F3EA14
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r3GrjivoWxk1bKlsRjr2LfndEqYK/OM0BxM6kOopgPZjBHYmZs5AT9rQ5TjJbuJCcLQGVqptuHbABpv/Nmw7E1z/iFJI3apme0LwWudU4BDRpREIy/HyVGo2CKYaPsJnaGtr+BeX/vlltiWUNrw2cMneyysqJIVTEVTFWRWv8KzQOrKyk912K/LLKHO4r95rWK7//Cg5BirCcnUNb+h7/1uhkzbyz9dUVGlMhYpmZsJ+zRxzPfyculQrY1aop87/A34lF2DYz6ZAn4XgnI3/WRckI1+k5EpcM8VqCk6Jn4DQOoXivtxaqzCCGLkUURTJlKqUdR0ozVkWJNlYoOaFkZh5eEBsdWJzoAXGJy6BimGX/ANWfWjCteWT3XHSxBLsPbFx0R+aubYVndSzt79rCk+g0DvRny0XpAdO1OaeNjc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 19:53:49.1199 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8913cd1a-c357-4dbf-f40d-08d74e84bbfc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4285
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lsRamgrUP/zoL76weZnPTYoNqAmD0vFGx46FdYljug=;
 b=oYFuqFQQDt/2Wre8/Odi+lVUdeswBCRw1s3+sq7BHeWtpupVfONq+AIzRnsevuO/Qqz3HjSPrqTGdsqWfw04cbeYPwi7rsJTxatQxfXkJ0WUm4+Momu5XY7QZMHOLURWwyZAS0Md/ihO6rts1FmYqwwyMld7PKMHc+qDbcd8s2Q=
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SW5jb3JyZWN0IHBhZ2UgdGFibGUgYWRkcmVzcyBhbmQgcHJvZ3JhbW1pbmcgc3lzIGFwZXJ0dXJl
IGZvcgpzdHV0dGVyIGdhdGhlciwgc28gZml4IGl0LgoKU2lnbmVkLW9mZi1ieTogQmhhd2FucHJl
ZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+Ci0tLQogLi4uL2RybS9hbWQvZGlz
cGxheS9kYy9kY24yMS9kY24yMV9odWJidWIuYyAgIHwgMjMgKysrKysrKysrKysrKystLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX2h1YmJ1Yi5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX2h1YmJ1Yi5jCmlu
ZGV4IGJkMjQ3ZTVlNzUzZS4uZmRmYmRlYjMyNDU5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfaHViYnViLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX2h1YmJ1Yi5jCkBAIC0xMTEsMTkgKzExMSwz
MCBAQCBpbnQgaHViYnViMjFfaW5pdF9kY2h1YihzdHJ1Y3QgaHViYnViICpodWJidWIsCiAJCXN0
cnVjdCBkY25faHViYnViX3BoeXNfYWRkcl9jb25maWcgKnBhX2NvbmZpZykKIHsKIAlzdHJ1Y3Qg
ZGNuMjBfaHViYnViICpodWJidWIxID0gVE9fRENOMjBfSFVCQlVCKGh1YmJ1Yik7CisJc3RydWN0
IGRjbl92bWlkX3BhZ2VfdGFibGVfY29uZmlnIHBoeXNfY29uZmlnOwogCiAJUkVHX1NFVChEQ05f
Vk1fRkJfTE9DQVRJT05fQkFTRSwgMCwKLQkJRkJfQkFTRSwgcGFfY29uZmlnLT5zeXN0ZW1fYXBl
cnR1cmUuZmJfYmFzZSk7CisJCQlGQl9CQVNFLCBwYV9jb25maWctPnN5c3RlbV9hcGVydHVyZS5m
Yl9iYXNlID4+IDI0KTsKIAlSRUdfU0VUKERDTl9WTV9GQl9MT0NBVElPTl9UT1AsIDAsCi0JCQlG
Ql9UT1AsIHBhX2NvbmZpZy0+c3lzdGVtX2FwZXJ0dXJlLmZiX3RvcCk7CisJCQlGQl9UT1AsIHBh
X2NvbmZpZy0+c3lzdGVtX2FwZXJ0dXJlLmZiX3RvcCA+PiAyNCk7CiAJUkVHX1NFVChEQ05fVk1f
RkJfT0ZGU0VULCAwLAotCQkJRkJfT0ZGU0VULCBwYV9jb25maWctPnN5c3RlbV9hcGVydHVyZS5m
Yl9vZmZzZXQpOworCQkJRkJfT0ZGU0VULCBwYV9jb25maWctPnN5c3RlbV9hcGVydHVyZS5mYl9v
ZmZzZXQgPj4gMjQpOwogCVJFR19TRVQoRENOX1ZNX0FHUF9CT1QsIDAsCi0JCQlBR1BfQk9ULCBw
YV9jb25maWctPnN5c3RlbV9hcGVydHVyZS5hZ3BfYm90KTsKKwkJCUFHUF9CT1QsIHBhX2NvbmZp
Zy0+c3lzdGVtX2FwZXJ0dXJlLmFncF9ib3QgPj4gMjQpOwogCVJFR19TRVQoRENOX1ZNX0FHUF9U
T1AsIDAsCi0JCQlBR1BfVE9QLCBwYV9jb25maWctPnN5c3RlbV9hcGVydHVyZS5hZ3BfdG9wKTsK
KwkJCUFHUF9UT1AsIHBhX2NvbmZpZy0+c3lzdGVtX2FwZXJ0dXJlLmFncF90b3AgPj4gMjQpOwog
CVJFR19TRVQoRENOX1ZNX0FHUF9CQVNFLCAwLAotCQkJQUdQX0JBU0UsIHBhX2NvbmZpZy0+c3lz
dGVtX2FwZXJ0dXJlLmFncF9iYXNlKTsKKwkJCUFHUF9CQVNFLCBwYV9jb25maWctPnN5c3RlbV9h
cGVydHVyZS5hZ3BfYmFzZSA+PiAyNCk7CisKKwlpZiAocGFfY29uZmlnLT5nYXJ0X2NvbmZpZy5w
YWdlX3RhYmxlX3N0YXJ0X2FkZHIgIT0gcGFfY29uZmlnLT5nYXJ0X2NvbmZpZy5wYWdlX3RhYmxl
X2VuZF9hZGRyKSB7CisJCXBoeXNfY29uZmlnLnBhZ2VfdGFibGVfc3RhcnRfYWRkciA9IHBhX2Nv
bmZpZy0+Z2FydF9jb25maWcucGFnZV90YWJsZV9zdGFydF9hZGRyID4+IDEyOworCQlwaHlzX2Nv
bmZpZy5wYWdlX3RhYmxlX2VuZF9hZGRyID0gcGFfY29uZmlnLT5nYXJ0X2NvbmZpZy5wYWdlX3Rh
YmxlX2VuZF9hZGRyID4+IDEyOworCQlwaHlzX2NvbmZpZy5wYWdlX3RhYmxlX2Jhc2VfYWRkciA9
IHBhX2NvbmZpZy0+Z2FydF9jb25maWcucGFnZV90YWJsZV9iYXNlX2FkZHIgfCAxOyAvL05vdGU6
IGhhY2sKKwkJcGh5c19jb25maWcuZGVwdGggPSAwOworCQlwaHlzX2NvbmZpZy5ibG9ja19zaXpl
ID0gMDsKKwkJLy8gSW5pdCBWTUlEIDAgYmFzZWQgb24gUEEgY29uZmlnCisJCWRjbjIwX3ZtaWRf
c2V0dXAoJmh1YmJ1YjEtPnZtaWRbMF0sICZwaHlzX2NvbmZpZyk7CisJfQogCiAJZGNuMjFfZGNo
dm1faW5pdChodWJidWIpOwogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
