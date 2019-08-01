Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D52387D5E4
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 08:54:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C806E393;
	Thu,  1 Aug 2019 06:54:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820042.outbound.protection.outlook.com [40.107.82.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8750C6E393
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 06:54:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=USYiM2oyhpzahJEVtlcEgwUYBnKtgOYwzZQeJr5XgPq2yZDQZ12jNx9QFtng865PRQ/7XEs7jPbUBVmehaRXluPG0tVQyGp5c4zKWy0KpvKor+38M+2SdxPbjSP+gUAHsEnEqBUHROTkpYI/uvnzHpQ6iyRWFU7T4L7iXqgbzbv2jz7pLJUI4ukz4deSNJPt/MNPZtDd85mDjKQ5RGGmj6EPGXQz/GmrRd/qei4eR25Kgr/r5Bqw+atCTiB5fqYROt876Lk4xRD9i6Dl/N4LL0+3cwDU5V6V8+eans59Kg8gjcPx9pntfUt+9bF/nkWyEuRPWjFb4r2WTJ0jBLWJog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MlrfVeQIibXG4KUyyTMmouHW+1NXqljkb2xrsbdhoKY=;
 b=mzNoFYLXY+odhvfBJ3rKhSBTI+0AHC6UEdymSk21xNYIXkjIKOLKDuesVFaUqrdLHgm4/FfJs8Sdqj6FAJ2m5+6Dp2Djpu7/Eh01TfR+6jHByKuX35fBEaYbMPHRxaTYNp6Cd5Aw7jrt7HrF3NwH4UUBf0WS0iXkn7KxnapE8mozSr0dJihK++2No7UBZ/pXBmYIfs+EhvR4FERRF765Xxl43hYELmJ7RFZZGNCL6uWY6t8TQ3i1wzq0ruVvsxy648nVyAWZXnlpW2xnNJd/2N+mqtZpBPiEwCFI7hRytpxVHvl/oaak3fnP6Yi+4KOgdMjYO4PKTsinwEMjC5Fqqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from SN1PR12CA0047.namprd12.prod.outlook.com (2603:10b6:802:20::18)
 by DM5PR12MB2534.namprd12.prod.outlook.com (2603:10b6:4:b5::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.16; Thu, 1 Aug
 2019 06:54:40 +0000
Received: from BY2NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::207) by SN1PR12CA0047.outlook.office365.com
 (2603:10b6:802:20::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.12 via Frontend
 Transport; Thu, 1 Aug 2019 06:54:39 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT048.mail.protection.outlook.com (10.152.85.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Thu, 1 Aug 2019 06:54:39 +0000
Received: from taozhou1u2.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 1 Aug 2019
 01:54:36 -0500
From: Tao Zhou <tao.zhou1@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <hawking.zhang@amd.com>,
 <dennis.li@amd.com>, <guchun.chen@amd.com>, <xinhui.pan@amd.com>
Subject: [PATCH 2/4] drm/amdgpu: implement umc ras init function
Date: Thu, 1 Aug 2019 14:53:40 +0800
Message-ID: <20190801065342.8450-3-tao.zhou1@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190801065342.8450-1-tao.zhou1@amd.com>
References: <20190801065342.8450-1-tao.zhou1@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(346002)(396003)(2980300002)(428003)(199004)(189003)(47776003)(36756003)(2906002)(68736007)(2201001)(446003)(305945005)(81156014)(8936002)(50226002)(8676002)(6636002)(81166006)(426003)(26005)(336012)(76176011)(53416004)(2616005)(476003)(126002)(186003)(11346002)(478600001)(486006)(50466002)(70206006)(5660300002)(70586007)(48376002)(1076003)(356004)(53936002)(86362001)(16586007)(6666004)(316002)(51416003)(110136005)(4326008)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2534; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1377597-5945-4f85-15a3-08d7164d1fb5
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:DM5PR12MB2534; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB2534:
X-Microsoft-Antispam-PRVS: <DM5PR12MB25346389E8240A39177B7D77B0DE0@DM5PR12MB2534.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-Forefront-PRVS: 01165471DB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: FI/dfCIjCVwztJF9jd5OfMrwGcay4n1nkWRlOrpYBPlsuYkmY5fxloNAlFp4T4mpB00lplepgRhNjec/wCaYQhW5DULLYB5XML7NA+noEHJSqu6Nhxc8xkXBkFA0vSzeDpKCM8/ORVvBq2+ry2wNvl+Mtg23u4fTlW9UlfinPXMfmOdRiZV2Y9LwOnUAsfTcEfSWAFhN/P8MXoZwhzQ53z+XAPZ+ufPJ7QVEyHByKDJxkYOPSdEMVmGP9SCBhY2AezD9jlYwv6tDlk96ynburIvfifNKXbyGQQsWocGgJqI2PsnfhjDUG3dhEJINfAnHZqRUlBc8XqUjg7jt0I7X0ZiNjZXE7XmBor4RlabT6zM60hE0YuaFZcJ3qQzrKkaXqqPRktzwlaFjxTzgoj7rs2h3CElYDy+43Y4AUNU/Qfg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2019 06:54:39.4737 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1377597-5945-4f85-15a3-08d7164d1fb5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2534
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MlrfVeQIibXG4KUyyTMmouHW+1NXqljkb2xrsbdhoKY=;
 b=NRB0RfQ3nclCWK7jdEErjqAczBmC/0u9cuQtazgj9r1qApCwR0ImT6nbuYkBigTIlhO8BXfzORjtlmH3N7/yRGM34efuxxdRA+DN0VYj6zWq1ildXxIYAFCZZiZgnUp5lFEflJ8H5VluKiI/Bt/ohzpRtBDp1HihUZvWibC0OX4=
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
Cc: Tao Zhou <tao.zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

ZW5hYmxlIHVtYyBlYyBpbnRlcnJ1cHQgYW5kIGluaXRpYWxpemUgZWNjIGVycm9yIGNvdW50CgpT
aWduZWQtb2ZmLWJ5OiBUYW8gWmhvdSA8dGFvLnpob3UxQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvdW1jX3Y2XzEuYyB8IDMyICsrKysrKysrKysrKysrKysrKysrKysr
KysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdW1jX3Y2XzEuaCB8ICA3ICsrKysrKwog
MiBmaWxlcyBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvdW1jX3Y2XzEuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3VtY192Nl8xLmMKaW5kZXggNTc0N2EwMjUyNjI0Li44MjM1M2Y3NDkzNzQgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8xLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvdW1jX3Y2XzEuYwpAQCAtMjA3LDkgKzIwNyw0MSBAQCBzdGF0aWMgdm9p
ZCB1bWNfdjZfMV9xdWVyeV9yYXNfZXJyb3JfYWRkcmVzcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiwKIAlhbWRncHVfdW1jX2Zvcl9lYWNoX2NoYW5uZWwodW1jX3Y2XzFfcXVlcnlfZXJyb3Jf
YWRkcmVzcyk7CiB9CiAKK3N0YXRpYyB2b2lkIHVtY192Nl8xX3Jhc19pbml0X3Blcl9jaGFubmVs
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAorCQkJCQkgc3RydWN0IHJhc19lcnJfZGF0YSAq
ZXJyX2RhdGEsCisJCQkJCSB1aW50MzJfdCB1bWNfcmVnX29mZnNldCwgdWludDMyX3QgY2hhbm5l
bF9pbmRleCkKK3sKKwl1aW50MzJfdCBlY2NfZXJyX2NudF9zZWwsIGVjY19lcnJfY250X3NlbF9h
ZGRyOworCXVpbnQzMl90IGVjY19lcnJfY250X2FkZHI7CisKKwllY2NfZXJyX2NudF9zZWxfYWRk
ciA9CisJCVNPQzE1X1JFR19PRkZTRVQoVU1DLCAwLCBtbVVNQ0NIMF8wX0VjY0VyckNudFNlbCk7
CisJZWNjX2Vycl9jbnRfYWRkciA9CisJCVNPQzE1X1JFR19PRkZTRVQoVU1DLCAwLCBtbVVNQ0NI
MF8wX0VjY0VyckNudCk7CisKKwkvKiBzZWxlY3QgdGhlIGxvd2VyIGNoaXAgYW5kIGNoZWNrIHRo
ZSBlcnJvciBjb3VudCAqLworCWVjY19lcnJfY250X3NlbCA9IFJSRUczMihlY2NfZXJyX2NudF9z
ZWxfYWRkciArIHVtY19yZWdfb2Zmc2V0KTsKKwllY2NfZXJyX2NudF9zZWwgPSBSRUdfU0VUX0ZJ
RUxEKGVjY19lcnJfY250X3NlbCwgVU1DQ0gwXzBfRWNjRXJyQ250U2VsLAorCQkJCQlFY2NFcnJD
bnRDc1NlbCwgMCk7CisJLyogZW5hYmxlIGNlIGVycm9yIGludGVycnVwdCAqLworCWVjY19lcnJf
Y250X3NlbCA9IFJFR19TRVRfRklFTEQoZWNjX2Vycl9jbnRfc2VsLCBVTUNDSDBfMF9FY2NFcnJD
bnRTZWwsCisJCQkJCUVjY0VyckludCwgMHgxKTsKKwlXUkVHMzIoZWNjX2Vycl9jbnRfc2VsX2Fk
ZHIgKyB1bWNfcmVnX29mZnNldCwgZWNjX2Vycl9jbnRfc2VsKTsKKwkvKiBzZXQgZXJyb3IgY291
bnQgdG8gaW5pdGlhbCB2YWx1ZSAqLworCVdSRUczMihlY2NfZXJyX2NudF9hZGRyICsgdW1jX3Jl
Z19vZmZzZXQsIFVNQ19WNl8xX0NFX0NOVF9JTklUKTsKKworCS8qIHNlbGVjdCB0aGUgaGlnaGVy
IGNoaXAgYW5kIGNoZWNrIHRoZSBlcnIgY291bnRlciAqLworCWVjY19lcnJfY250X3NlbCA9IFJF
R19TRVRfRklFTEQoZWNjX2Vycl9jbnRfc2VsLCBVTUNDSDBfMF9FY2NFcnJDbnRTZWwsCisJCQkJ
CUVjY0VyckNudENzU2VsLCAxKTsKKwlXUkVHMzIoZWNjX2Vycl9jbnRfc2VsX2FkZHIgKyB1bWNf
cmVnX29mZnNldCwgZWNjX2Vycl9jbnRfc2VsKTsKKwlXUkVHMzIoZWNjX2Vycl9jbnRfYWRkciAr
IHVtY19yZWdfb2Zmc2V0LCBVTUNfVjZfMV9DRV9DTlRfSU5JVCk7Cit9CisKIHN0YXRpYyB2b2lk
IHVtY192Nl8xX3Jhc19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogeworCXZvaWQg
KnJhc19lcnJvcl9zdGF0dXMgPSBOVUxMOwogCisJYW1kZ3B1X3VtY19mb3JfZWFjaF9jaGFubmVs
KHVtY192Nl8xX3Jhc19pbml0X3Blcl9jaGFubmVsKTsKIH0KIAogY29uc3Qgc3RydWN0IGFtZGdw
dV91bWNfZnVuY3MgdW1jX3Y2XzFfZnVuY3MgPSB7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS91bWNfdjZfMS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdW1j
X3Y2XzEuaAppbmRleCBhZDQ1OThjMGU0OTUuLmRhYjljYmQyOTJjNSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdW1jX3Y2XzEuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS91bWNfdjZfMS5oCkBAIC0zNyw2ICszNywxMyBAQAogLyogVU1DIHJlZ2lzZXIg
cGVyIGNoYW5uZWwgb2Zmc2V0ICovCiAjZGVmaW5lIFVNQ19WNl8xX1BFUl9DSEFOTkVMX09GRlNF
VAkJMHg4MDAKIAorLyogRWNjRXJyQ250IG1heCB2YWx1ZSAqLworI2RlZmluZSBVTUNfVjZfMV9D
RV9DTlRfTUFYCQkweGZmZmYKKy8qIHVtYyBjZSBpbnRlcnJ1cHQgdGhyZXNob2xkICovCisjZGVm
aW5lIFVNQ19WNl8xX0NFX0lOVF9USFJFU0hPTEQJMHhmZmZmCisvKiB1bWMgY2UgY291bnQgaW5p
dGlhbCB2YWx1ZSAqLworI2RlZmluZSBVTUNfVjZfMV9DRV9DTlRfSU5JVAkoVU1DX1Y2XzFfQ0Vf
Q05UX01BWCAtIFVNQ19WNl8xX0NFX0lOVF9USFJFU0hPTEQpCisKIGV4dGVybiBjb25zdCBzdHJ1
Y3QgYW1kZ3B1X3VtY19mdW5jcyB1bWNfdjZfMV9mdW5jczsKIGV4dGVybiBjb25zdCB1aW50MzJf
dAogCXVtY192Nl8xX2NoYW5uZWxfaWR4X3RibFtVTUNfVjZfMV9VTUNfSU5TVEFOQ0VfTlVNXVtV
TUNfVjZfMV9DSEFOTkVMX0lOU1RBTkNFX05VTV07Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
