Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A54C8738E
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 09:58:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B61B46E1E0;
	Fri,  9 Aug 2019 07:58:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-bn3nam01on0621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe41::621])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0873E6E1D7
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 07:58:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4jFOE5b3EMBnlgCQ4d7q1+80YBDj1QYooZzCJOPbbyXE8quERMvWtRY6U100ftOeCwNkVTfHLYQPLoqd586GOp+TESPY6O5TCOleZ6Uwdw1f3N8BjWkpiL43sKDxgf5S3CqdcjaRlehYm5t7dXLXNKfY3BCC3PTsAE3yGf8PtzzKUHEv+Z1dehFHkvozqf8TR6pVdShuK5UabcvnmjvETTmmqlkwuQMpBr0tKoiBprNz9nKGXE9LhL05rB5mCTTnQkmAgxhGZCvElB6wuYXKK0JNKqBef0+ir0NCSU8iz+5jUPR06Y4x1yOqCP9tmslOlutv2wAl008v1mTJ6IcXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=naqlvtjbojPph4Ovb7QpQBr8GWVVK1MUlWv//rfZME8=;
 b=PI4E5EVt1aOqqytN+mgQcnBioJnnJDCVJ89sgr+faW9Iqv2nrAczdkdSDzZaNf2bOcFqnUFM30y9I/jlRQl92k4n8DxIQwsU5YYesruZwJ7CNYErbErNDpCD5Ut4hf2rDJo22uIg3dKQUQZqRX1yZYzx5oPrGKArxzW99UqBPk/Pk+Ym0YiNfDyzqpgIaXpGAV15A5ONFRx1GLyudD6EP4ZcFTyEZYD9DFnX+uw30h5vw86jVw6CN4NqP3VKBwyV9LNiIfpfMUMeeZwMH6Vkg1N+ROijgiAY3+MELRtbOIjgVVCql0gx8nrNqy79SvcelXKCLb5Vww+asdGOeO+4DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from SN1PR12CA0062.namprd12.prod.outlook.com (2603:10b6:802:20::33)
 by DM5PR12MB1276.namprd12.prod.outlook.com (2603:10b6:3:79::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.18; Fri, 9 Aug
 2019 07:58:05 +0000
Received: from BY2NAM03FT007.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::201) by SN1PR12CA0062.outlook.office365.com
 (2603:10b6:802:20::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.18 via Frontend
 Transport; Fri, 9 Aug 2019 07:58:05 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT007.mail.protection.outlook.com (10.152.84.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Fri, 9 Aug 2019 07:58:04 +0000
Received: from taozhou1u2.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 9 Aug 2019
 02:58:02 -0500
From: Tao Zhou <tao.zhou1@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <alexander.deucher@amd.com>,
 <hawking.zhang@amd.com>, <christian.koenig@amd.com>
Subject: [PATCH 1/2] drm/amdgpu: implement UMC 64 bits REG operations
Date: Fri, 9 Aug 2019 15:57:50 +0800
Message-ID: <20190809075751.5078-1-tao.zhou1@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(39860400002)(2980300002)(428003)(199004)(189003)(50226002)(8676002)(81156014)(81166006)(8936002)(2616005)(126002)(476003)(6636002)(5660300002)(4326008)(486006)(47776003)(50466002)(1076003)(48376002)(305945005)(336012)(426003)(53416004)(26005)(2906002)(316002)(110136005)(16586007)(36756003)(186003)(6666004)(14444005)(7696005)(53936002)(356004)(70206006)(70586007)(478600001)(2201001)(51416003)(86362001)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1276; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef14d37d-9f26-42f7-abab-08d71c9f4f39
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1276; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1276:
X-Microsoft-Antispam-PRVS: <DM5PR12MB127632037FC3F307BFE95E5DB0D60@DM5PR12MB1276.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-Forefront-PRVS: 01244308DF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: C/HjWYUrLaFZueOjWIyaOchArj+l0oXmuLrKVb2cra8ASmst95GP3L90tsnci40VbLp0joeUwjO3XOOgEXhHxidsbmtnFuzHpAxi98hl3+tHwSiUHK5F7Sqt7l6X3Qp24GaA1ij8e2ECpUIEErYoNiqbiT/QhWr9vp6ntk0MEETGMSZBOs1w9VpAcmeeFfxpAg+bKVDCrp9PBEMwtGRrlUxG/vE7EhmdT08Fdpwoz1r/vrskWxeuVHHZwfKhIVFjR8UofY+gtBQSxfYV4+nM+Y9jvZh4XpzB7Jdu0S++DT8Uxk68EKQLGGfquTeujmI/DmUTSwGPOv3lAqeuC7w2JBR3YUxonZn3JuxG/eGwbpkyiZ1ur6moHHXOwocFPAmFLn6QEbla/kvoh2Ww3yrY8ABKMh/qCcdplxwcEbtWjMM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 07:58:04.9373 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef14d37d-9f26-42f7-abab-08d71c9f4f39
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1276
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=naqlvtjbojPph4Ovb7QpQBr8GWVVK1MUlWv//rfZME8=;
 b=fGh4ZOnZsirPK7HViq6Jk+yl85ewn7tzTTydVkFqbLmAWNAuoW1k4SjjAB1v4PrqVU3il1KqbDVtsIyGG7z0KPmCT8dE12R6xH2Dz2kc2wh2a/wLdFA4qkipwiC8S1oiRXr0lXpOip0mCgSIb5rQAhG3ghrg0QQdnTZVI50A+O0=
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

aW1wbGVtZW50IDY0IGJpdHMgb3BlcmF0aW9ucyB2aWEgMzIgYml0cyBpbnRlcmZhY2UKCnYyOiBt
YWtlIHVzZSBvZiBsb3dlcl8zMl9iaXRzKCkgYW5kIHVwcGVyXzMyX2JpdHMoKSBtYWNyb3MKClNp
Z25lZC1vZmYtYnk6IFRhbyBaaG91IDx0YW8uemhvdTFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmggfCAgOSArKysrKysrKysKIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8xLmMgICB8IDEwICsrKysrLS0tLS0KIDIgZmlsZXMgY2hh
bmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdW1jLmgKaW5kZXggOWVmZGQ2NjI3OWU1Li45NzVhZmEwNGRmMDkgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91bWMuaAorKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmgKQEAgLTIxLDYgKzIxLDE1IEBA
CiAjaWZuZGVmIF9fQU1ER1BVX1VNQ19IX18KICNkZWZpbmUgX19BTURHUFVfVU1DX0hfXwogCisv
KiBpbXBsZW1lbnQgNjQgYml0cyBSRUcgb3BlcmF0aW9ucyB2aWEgMzIgYml0cyBpbnRlcmZhY2Ug
Ki8KKyNkZWZpbmUgUlJFRzY0X1VNQyhyZWcpCShSUkVHMzIocmVnKSB8IFwKKwkJCQkoKHVpbnQ2
NF90KVJSRUczMigocmVnKSArIDEpIDw8IDMyKSkKKyNkZWZpbmUgV1JFRzY0X1VNQyhyZWcsIHYp
CVwKKwlkbyB7CVwKKwkJV1JFRzMyKChyZWcpLCBsb3dlcl8zMl9iaXRzKHYpKTsJXAorCQlXUkVH
MzIoKHJlZykgKyAxLCB1cHBlcl8zMl9iaXRzKHYpKTsJXAorCX0gd2hpbGUgKDApCisKIC8qCiAg
KiB2b2lkICgqZnVuYykoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHN0cnVjdCByYXNfZXJy
X2RhdGEgKmVycl9kYXRhLAogICoJCQkJdWludDMyX3QgdW1jX3JlZ19vZmZzZXQsIHVpbnQzMl90
IGNoYW5uZWxfaW5kZXgpCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91
bWNfdjZfMS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdW1jX3Y2XzEuYwppbmRleCA2
NGRmMzdiODYwZGQuLjg1MDJlNzM2ZjcyMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvdW1jX3Y2XzEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91bWNf
djZfMS5jCkBAIC0xMTYsNyArMTE2LDcgQEAgc3RhdGljIHZvaWQgdW1jX3Y2XzFfcXVlcnlfY29y
cmVjdGFibGVfZXJyb3JfY291bnQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAKIAkvKiBj
aGVjayBmb3IgU1JBTSBjb3JyZWN0YWJsZSBlcnJvcgogCSAgTUNVTUNfU1RBVFVTIGlzIGEgNjQg
Yml0IHJlZ2lzdGVyICovCi0JbWNfdW1jX3N0YXR1cyA9IFJSRUc2NChtY191bWNfc3RhdHVzX2Fk
ZHIgKyB1bWNfcmVnX29mZnNldCk7CisJbWNfdW1jX3N0YXR1cyA9IFJSRUc2NF9VTUMobWNfdW1j
X3N0YXR1c19hZGRyICsgdW1jX3JlZ19vZmZzZXQpOwogCWlmIChSRUdfR0VUX0ZJRUxEKG1jX3Vt
Y19zdGF0dXMsIE1DQV9VTUNfVU1DMF9NQ1VNQ19TVEFUVVNUMCwgRXJyb3JDb2RlRXh0KSA9PSA2
ICYmCiAJICAgIFJFR19HRVRfRklFTEQobWNfdW1jX3N0YXR1cywgTUNBX1VNQ19VTUMwX01DVU1D
X1NUQVRVU1QwLCBWYWwpID09IDEgJiYKIAkgICAgUkVHX0dFVF9GSUVMRChtY191bWNfc3RhdHVz
LCBNQ0FfVU1DX1VNQzBfTUNVTUNfU1RBVFVTVDAsIENFQ0MpID09IDEpCkBAIC0xMzQsNyArMTM0
LDcgQEAgc3RhdGljIHZvaWQgdW1jX3Y2XzFfcXVlcnJ5X3VuY29ycmVjdGFibGVfZXJyb3JfY291
bnQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYKICAgICAgICAgICAgICAgICBTT0MxNV9SRUdf
T0ZGU0VUKFVNQywgMCwgbW1NQ0FfVU1DX1VNQzBfTUNVTUNfU1RBVFVTVDApOwogCiAJLyogY2hl
Y2sgdGhlIE1DVU1DX1NUQVRVUyAqLwotCW1jX3VtY19zdGF0dXMgPSBSUkVHNjQobWNfdW1jX3N0
YXR1c19hZGRyICsgdW1jX3JlZ19vZmZzZXQpOworCW1jX3VtY19zdGF0dXMgPSBSUkVHNjRfVU1D
KG1jX3VtY19zdGF0dXNfYWRkciArIHVtY19yZWdfb2Zmc2V0KTsKIAlpZiAoKFJFR19HRVRfRklF
TEQobWNfdW1jX3N0YXR1cywgTUNBX1VNQ19VTUMwX01DVU1DX1NUQVRVU1QwLCBWYWwpID09IDEp
ICYmCiAJICAgIChSRUdfR0VUX0ZJRUxEKG1jX3VtY19zdGF0dXMsIE1DQV9VTUNfVU1DMF9NQ1VN
Q19TVEFUVVNUMCwgRGVmZXJyZWQpID09IDEgfHwKIAkgICAgUkVHX0dFVF9GSUVMRChtY191bWNf
c3RhdHVzLCBNQ0FfVU1DX1VNQzBfTUNVTUNfU1RBVFVTVDAsIFVFQ0MpID09IDEgfHwKQEAgLTE3
MywxMSArMTczLDExIEBAIHN0YXRpYyB2b2lkIHVtY192Nl8xX3F1ZXJ5X2Vycm9yX2FkZHJlc3Mo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJLyogc2tpcCBlcnJvciBhZGRyZXNzIHByb2Nl
c3MgaWYgLUVOT01FTSAqLwogCWlmICghZXJyX2RhdGEtPmVycl9hZGRyKSB7CiAJCS8qIGNsZWFy
IHVtYyBzdGF0dXMgKi8KLQkJV1JFRzY0KG1jX3VtY19zdGF0dXNfYWRkciArIHVtY19yZWdfb2Zm
c2V0LCAweDBVTEwpOworCQlXUkVHNjRfVU1DKG1jX3VtY19zdGF0dXNfYWRkciArIHVtY19yZWdf
b2Zmc2V0LCAweDBVTEwpOwogCQlyZXR1cm47CiAJfQogCi0JbWNfdW1jX3N0YXR1cyA9IFJSRUc2
NChtY191bWNfc3RhdHVzX2FkZHIgKyB1bWNfcmVnX29mZnNldCk7CisJbWNfdW1jX3N0YXR1cyA9
IFJSRUc2NF9VTUMobWNfdW1jX3N0YXR1c19hZGRyICsgdW1jX3JlZ19vZmZzZXQpOwogCiAJLyog
Y2FsY3VsYXRlIGVycm9yIGFkZHJlc3MgaWYgdWUvY2UgZXJyb3IgaXMgZGV0ZWN0ZWQgKi8KIAlp
ZiAoUkVHX0dFVF9GSUVMRChtY191bWNfc3RhdHVzLCBNQ0FfVU1DX1VNQzBfTUNVTUNfU1RBVFVT
VDAsIFZhbCkgPT0gMSAmJgpAQCAtMjAwLDcgKzIwMCw3IEBAIHN0YXRpYyB2b2lkIHVtY192Nl8x
X3F1ZXJ5X2Vycm9yX2FkZHJlc3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJfQogCiAJ
LyogY2xlYXIgdW1jIHN0YXR1cyAqLwotCVdSRUc2NChtY191bWNfc3RhdHVzX2FkZHIgKyB1bWNf
cmVnX29mZnNldCwgMHgwVUxMKTsKKwlXUkVHNjRfVU1DKG1jX3VtY19zdGF0dXNfYWRkciArIHVt
Y19yZWdfb2Zmc2V0LCAweDBVTEwpOwogfQogCiBzdGF0aWMgdm9pZCB1bWNfdjZfMV9xdWVyeV9y
YXNfZXJyb3JfYWRkcmVzcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKLS0gCjIuMTcuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
