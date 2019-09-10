Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5E5AF19D
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 21:06:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBDED6E983;
	Tue, 10 Sep 2019 19:06:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760043.outbound.protection.outlook.com [40.107.76.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5636F6E97E
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 19:06:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pw78D4zDQ+usWEO+lG4yjWCvNsq+DK2rF2prvb4DWMDKoLBl7WJ0fLrIL5beSKvGkveGRi3TMvt6u9zgFLED8u1bFvMQHvFKjtdi1W+6KfVu7GuPab8NwckaMvcohTMOT0kNcrRgTLDMj4MKWHbBzMzCs0WG9E65tZA0QcZBU2HA5VpPwinsjiaGF11PWFsqFJIFvRSLnEHzkhKY0trP+gB3HVb5qi4xB/OHq/gcx/jWdmE2O3RHJ3i3YxMVmI5cst6w7CtveYwZ5IvL+Xa+GokhwoGnqZ179wOfgwnc15gvCVvdVx/fs4XgPwWBU64hQGxH1Za5l0X5zWqV25qajg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XoCaeV1HKuxsTXOAR4D3YCr4yTMmh0LI1WlYJMJUK0g=;
 b=JEikpXP6g7xwTJ14pKrCw4Lj72yOM7u/nqra2eAWcbeZmWHIlibU+63KYZCWdqBn2rlApnmc0GX3cIeZnv0hRGfjOOWsHz7YntmA551ZX0j6pv52WJdbSgCEDo0yDl/cjuzgleEoRs+FlTFuk6VgbAb0DJMC12JWBom82vesxgSL9DM1uK4TXoX8GkYWyF235apZ0kSyf/RPV8NBUmXU7H4r2ywLyCbuJbnK8bvfDjxLrjrZCqkPWdBdVm3TJZa5YkVvCeWRzfzJlHY9zsMLGhMLLaGgM1c8A6x96pAgFt6ockGFGy3gbKgsyJzbIREgRNbeNS7tG3syxN6oiG/GOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR12CA0044.namprd12.prod.outlook.com (2603:10b6:301:2::30)
 by CY4PR12MB1461.namprd12.prod.outlook.com (2603:10b6:910:f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.13; Tue, 10 Sep
 2019 19:06:25 +0000
Received: from DM3NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::205) by MWHPR12CA0044.outlook.office365.com
 (2603:10b6:301:2::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2241.14 via Frontend
 Transport; Tue, 10 Sep 2019 19:06:25 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT009.mail.protection.outlook.com (10.152.82.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 19:06:25 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 10 Sep 2019
 14:06:19 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 15/20] drm/amd/display: Initialize HDCP work queue
Date: Tue, 10 Sep 2019 15:05:49 -0400
Message-ID: <20190910190554.1539-16-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910190554.1539-1-Bhawanpreet.Lakha@amd.com>
References: <20190829162253.10195-10-Bhawanpreet.Lakha@amd.com>
 <20190910190554.1539-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(396003)(2980300002)(428003)(199004)(189003)(4326008)(6916009)(50466002)(305945005)(53936002)(16586007)(50226002)(316002)(70206006)(48376002)(36756003)(76176011)(7696005)(51416003)(70586007)(186003)(81156014)(8676002)(426003)(1076003)(336012)(81166006)(2906002)(478600001)(2351001)(356004)(6666004)(2616005)(476003)(126002)(486006)(11346002)(26005)(86362001)(53416004)(8936002)(5660300002)(14444005)(47776003)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1461; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39e40242-386e-4689-feb1-08d73621fa16
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:CY4PR12MB1461; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1461:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1461707E6CB182B4BA0BEC43F9B60@CY4PR12MB1461.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: sld4O9+5yoR4o5yCpyIgE+NbRf5qbEUBO10H2AL11Lc5IAr7GgEiV2x0P50YGFqVhMNxiy0cXUPH61/3YgT6jGsEvvkASa3ySGZzeqiIHeAbM9lQIrDRYnQ9srKWiEykSlQ8xSjm9ogctPWSYmZNWLGc0MPdZ0p8JSqRCUKKaWw+CbwlhHfPKUA1+7EGUbqKWqF7TuDuGDMg+OLmmRpeOudsbNdPi8HWaHgrIsVfe4BtOCbE8xixTUSZ/mAmPuMxN68qOw3NEQsIQz3ndg93rVsNsEdA5E1o/ILI6t41HUVu30ao1uomyZ1xAqkc7qUcicAqoVfmO1QEl9mzKQcFxAc91p/w4Jc/BfiaIJtcvz2BjxwL3aHL6y3WPVSvhSe4Z2npGHN1PeRKh/5/2QdGSct5brGy5yVo4BmmsLQjvt8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 19:06:25.2505 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39e40242-386e-4689-feb1-08d73621fa16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1461
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XoCaeV1HKuxsTXOAR4D3YCr4yTMmh0LI1WlYJMJUK0g=;
 b=f/ZMnS7wXo3tfSp4Skop6SPQokTclJVPhV0/efLJMicKRAGo+OQpmq0UIii7aSvH5R2tlo7NGtRatMZMqpqILuCKNutdr8xpZjKrg+g1rGlqK7ilCUaNi6wFy/IVbJExpnnY8jPirbjBNvgPr0SSqXAI07EDEH/XRdagB0FhKhQ=
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

W1doeV0KV2UgbmVlZCB0aGlzIHRvIGVuYWJsZSBIRENQIG9uIGxpbnV4LCBhcyB3ZSBuZWVkIGV2
ZW50cyB0byBpbnRlcmFjdAp3aXRoIHRoZSBoZGNwIG1vZHVsZQoKW0hvd10KQWRkIHdvcmsgcXVl
dWUgdG8gZGlzcGxheSBtYW5hZ2VyIGFuZCBoYW5kbGUgdGhlIGNyZWF0aW9uIGFuZCBkZXN0cnVj
dGlvbgpvZiB0aGUgcXVldWUKClNpZ25lZC1vZmYtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3
YW5wcmVldC5MYWtoYUBhbWQuY29tPgpSZXZpZXdlZC1ieTogSGFycnkgV2VudGxhbmQgPGhhcnJ5
LndlbnRsYW5kQGFtZC5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbS5jIHwgMzAgKysrKysrKysrKysrKysrKysrKwogLi4uL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5oIHwgIDMgKysKIDIgZmlsZXMgY2hhbmdlZCwgMzMg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9h
bWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1
X2RtL2FtZGdwdV9kbS5jCmluZGV4IGMxMDMxMTIxZWU4YS4uMmNjOTVhYjBiNjQ1IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKQEAg
LTM3LDYgKzM3LDkgQEAKICNpbmNsdWRlICJhbWRncHVfdWNvZGUuaCIKICNpbmNsdWRlICJhdG9t
LmgiCiAjaW5jbHVkZSAiYW1kZ3B1X2RtLmgiCisjaWZkZWYgQ09ORklHX0RSTV9BTURfRENfSERD
UAorI2luY2x1ZGUgImFtZGdwdV9kbV9oZGNwLmgiCisjZW5kaWYKICNpbmNsdWRlICJhbWRncHVf
cG0uaCIKIAogI2luY2x1ZGUgImFtZF9zaGFyZWQuaCIKQEAgLTY0NCwxMSArNjQ3LDE4IEBAIHZv
aWQgYW1kZ3B1X2RtX2F1ZGlvX2VsZF9ub3RpZnkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYs
IGludCBwaW4pCiBzdGF0aWMgaW50IGFtZGdwdV9kbV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KQogewogCXN0cnVjdCBkY19pbml0X2RhdGEgaW5pdF9kYXRhOworI2lmZGVmIENPTkZJ
R19EUk1fQU1EX0RDX0hEQ1AKKwlzdHJ1Y3QgZGNfY2FsbGJhY2tfaW5pdCBpbml0X3BhcmFtczsK
KyNlbmRpZgorCiAJYWRldi0+ZG0uZGRldiA9IGFkZXYtPmRkZXY7CiAJYWRldi0+ZG0uYWRldiA9
IGFkZXY7CiAKIAkvKiBaZXJvIGFsbCB0aGUgZmllbGRzICovCiAJbWVtc2V0KCZpbml0X2RhdGEs
IDAsIHNpemVvZihpbml0X2RhdGEpKTsKKyNpZmRlZiBDT05GSUdfRFJNX0FNRF9EQ19IRENQCisJ
bWVtc2V0KCZpbml0X3BhcmFtcywgMCwgc2l6ZW9mKGluaXRfcGFyYW1zKSk7CisjZW5kaWYKIAog
CW11dGV4X2luaXQoJmFkZXYtPmRtLmRjX2xvY2spOwogCW11dGV4X2luaXQoJmFkZXYtPmRtLmF1
ZGlvX2xvY2spOwpAQCAtNzIxLDYgKzczMSwxNiBAQCBzdGF0aWMgaW50IGFtZGdwdV9kbV9pbml0
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCiAJYW1kZ3B1X2RtX2luaXRfY29sb3JfbW9k
KCk7CiAKKyNpZmRlZiBDT05GSUdfRFJNX0FNRF9EQ19IRENQCisJYWRldi0+ZG0uaGRjcF93b3Jr
cXVldWUgPSBoZGNwX2NyZWF0ZV93b3JrcXVldWUoJmFkZXYtPnBzcCwgJmluaXRfcGFyYW1zLmNw
X3BzcCwgYWRldi0+ZG0uZGMpOworCisJaWYgKCFhZGV2LT5kbS5oZGNwX3dvcmtxdWV1ZSkKKwkJ
RFJNX0VSUk9SKCJhbWRncHU6IGZhaWxlZCB0byBpbml0aWFsaXplIGhkY3Bfd29ya3F1ZXVlLlxu
Iik7CisJZWxzZQorCQlEUk1fREVCVUdfRFJJVkVSKCJhbWRncHU6IGhkY3Bfd29ya3F1ZXVlIGlu
aXQgZG9uZSAlcC5cbiIsIGFkZXYtPmRtLmhkY3Bfd29ya3F1ZXVlKTsKKworCWRjX2luaXRfY2Fs
bGJhY2tzKGFkZXYtPmRtLmRjLCAmaW5pdF9wYXJhbXMpOworI2VuZGlmCiAJaWYgKGFtZGdwdV9k
bV9pbml0aWFsaXplX2RybV9kZXZpY2UoYWRldikpIHsKIAkJRFJNX0VSUk9SKAogCQkiYW1kZ3B1
OiBmYWlsZWQgdG8gaW5pdGlhbGl6ZSBzdyBmb3IgZGlzcGxheSBzdXBwb3J0LlxuIik7CkBAIC03
NjIsNiArNzgyLDE2IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9kbV9maW5pKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQogCiAJYW1kZ3B1X2RtX2Rlc3Ryb3lfZHJtX2RldmljZSgmYWRldi0+ZG0p
OwogCisjaWZkZWYgQ09ORklHX0RSTV9BTURfRENfSERDUAorCWlmIChhZGV2LT5kbS5oZGNwX3dv
cmtxdWV1ZSkgeworCQloZGNwX2Rlc3Ryb3koYWRldi0+ZG0uaGRjcF93b3JrcXVldWUpOworCQlh
ZGV2LT5kbS5oZGNwX3dvcmtxdWV1ZSA9IE5VTEw7CisJfQorCisJaWYgKGFkZXYtPmRtLmRjKQor
CQlkY19kZWluaXRfY2FsbGJhY2tzKGFkZXYtPmRtLmRjKTsKKyNlbmRpZgorCiAJLyogREMgRGVz
dHJveSBUT0RPOiBSZXBsYWNlIGRlc3Ryb3kgREFMICovCiAJaWYgKGFkZXYtPmRtLmRjKQogCQlk
Y19kZXN0cm95KCZhZGV2LT5kbS5kYyk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uaAppbmRleCBjYmQ2NjA4ZjU4ZTYuLjdhMzRlY2ExMmRh
YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG0uaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbS5oCkBAIC0yMjIsNiArMjIyLDkgQEAgc3RydWN0IGFtZGdwdV9kaXNwbGF5X21hbmFnZXIg
ewogCXN0cnVjdCBhbWRncHVfZG1fYmFja2xpZ2h0X2NhcHMgYmFja2xpZ2h0X2NhcHM7CiAKIAlz
dHJ1Y3QgbW9kX2ZyZWVzeW5jICpmcmVlc3luY19tb2R1bGU7CisjaWZkZWYgQ09ORklHX0RSTV9B
TURfRENfSERDUAorCXN0cnVjdCBoZGNwX3dvcmtxdWV1ZSAqaGRjcF93b3JrcXVldWU7CisjZW5k
aWYKIAogCXN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpjYWNoZWRfc3RhdGU7CiAKLS0gCjIuMTcu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
