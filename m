Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C557D5A9
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 08:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A45E892F1;
	Thu,  1 Aug 2019 06:44:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780048.outbound.protection.outlook.com [40.107.78.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9CD4891A4
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 06:44:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HPnR04u5xOtObVVcdDHrMQFTQUB31Gm0DEVT1wMZJ5m+5FU2CovIIxF21nGGrJvbpF9gRM8xJeivffyAG70X0UXuDBi5oK8FiNS029kwvCX34itCCJcXKTLCTdapl+eHbtnDC19lJIUvuDLSI3S+M14Rrv8/xMwfa6jLnZbyL7LspiiKS/cYaCxUkQF7bXVlgARKPEpuaO4owpU1+X14g9YatR1S3VvIDLvn7gXsvyKHkn09fArKm69EN+vuKuKV/K6pTnFDOESa+YWJghk/h5Q4fHZq3FlTAhu/BkhG6Z2Aubp49YBd1AyvMqWoMGe1Qe/aGYy+tk2OR6gZZjLzDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qSSeYjpQMZGTfClVoixraDBTDCDTN/7LvJ4vhiRDeQ=;
 b=fmCy1k/PJfar25f0hbu3ULPJqeVVz4Bo+hvIYW52+tqu1qAy+OuvTewvaQl4J5iIaJM6svcAKp1V/lJXQZsc4wQCRk3Zjy9RrdF8X8u72bQo6Nj1koMqpGUUjnLaFDVVru6cCGwvM5X+anGOUSXT0zS4t1u2AWdXKMhIvMDYW2EwJd+vEfGvvhqiHNNKsocfffvqQY3hIiAJjHjva74fc6hL4SUFcBsQxHRKZ91KNw9q+zUWUwQ1hrGPxisDz4w5kqESC8QpiDj+alYyUUmYvuiXyvS1zFk+JxwM8YF+sBxMRuFVDBjAcY0CJ/mVsNdLItjXFASqbbm9Oge5Rw6+nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from BN8PR12CA0028.namprd12.prod.outlook.com (2603:10b6:408:60::41)
 by MW2PR12MB2540.namprd12.prod.outlook.com (2603:10b6:907:9::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16; Thu, 1 Aug
 2019 06:44:22 +0000
Received: from DM3NAM03FT007.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::205) by BN8PR12CA0028.outlook.office365.com
 (2603:10b6:408:60::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2136.14 via Frontend
 Transport; Thu, 1 Aug 2019 06:44:21 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT007.mail.protection.outlook.com (10.152.82.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Thu, 1 Aug 2019 06:44:21 +0000
Received: from taozhou1u2.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 1 Aug 2019
 01:44:20 -0500
From: Tao Zhou <tao.zhou1@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <hawking.zhang@amd.com>,
 <dennis.li@amd.com>, <guchun.chen@amd.com>, <xinhui.pan@amd.com>
Subject: [PATCH 4/6] drm/amdgpu: add macro of umc for each channel
Date: Thu, 1 Aug 2019 14:43:09 +0800
Message-ID: <20190801064311.7307-5-tao.zhou1@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190801064311.7307-1-tao.zhou1@amd.com>
References: <20190801064311.7307-1-tao.zhou1@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(136003)(346002)(39860400002)(2980300002)(428003)(199004)(189003)(126002)(476003)(2616005)(426003)(6666004)(11346002)(356004)(446003)(336012)(47776003)(6636002)(186003)(51416003)(7696005)(26005)(478600001)(1076003)(305945005)(76176011)(53936002)(81156014)(50466002)(2906002)(53416004)(81166006)(4326008)(8676002)(48376002)(68736007)(70206006)(70586007)(36756003)(8936002)(316002)(2201001)(486006)(16586007)(50226002)(5660300002)(110136005)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR12MB2540; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 973b3a31-009d-4f02-0b28-08d7164baf55
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MW2PR12MB2540; 
X-MS-TrafficTypeDiagnostic: MW2PR12MB2540:
X-Microsoft-Antispam-PRVS: <MW2PR12MB254086ACAC355B8A13B17742B0DE0@MW2PR12MB2540.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 01165471DB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: yPBsFD8CuGdoqd6Uc1odIv2tzj0E1DP62BtV5Z+wAgCu97qDR8j51BYFvwGkPVx1wcnrpUd/n1LDPkqYVRW79P+EtjBaCod+oNlusTk5iMW7EFZ7/OiFP8jh6jB63Usr/QzAACP12ZQ5YDaB2S1ySzBFt1zwMWFnkxo/uSJWdWHkwhuFEgfQ0ZMQ512qfs70wcJ43H0L2YrWW918T+tGX6DRiOw03feIrMMUeZeK1YE4fuhfaHFDa4HhmMzM/cjkZk8Op0OITNvsJ317KJ1F4+VIGCpJe2RlQkWURMcH4Wz1ZuQCTF3MXWsl285a7fWx/R10R48nKkys0abUyPMeILLfKHW+ek0hzd8A1sH5rQWCFEFyP7yV02OE7TIoJJJ22wbdVHvd37mIkDd6XlR84XMYzLbSSjBzXRe9GSaETcc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2019 06:44:21.4157 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 973b3a31-009d-4f02-0b28-08d7164baf55
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2540
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qSSeYjpQMZGTfClVoixraDBTDCDTN/7LvJ4vhiRDeQ=;
 b=age98ZbWQovp5Go2NAjlwGq0tokeFgVus6v1BDTrAAnB/nOtDzyHQxvCpIB7T6cawg0Ua84W4Y6x/8cayYlniYCtlkmxz9I2n6336GE5zUjfMCgKX2MlbnqtqyVCeaeObXYGzUyuCvyAkAfSXB9LLTccql0ISR1+9gACBBw6GZQ=
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

Y29tbW9uIGZ1bmN0aW9uIGZvciBhbGwgdW1jIHZlcnNpb25zCgpTaWduZWQtb2ZmLWJ5OiBUYW8g
WmhvdSA8dGFvLnpob3UxQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3VtYy5oIHwgMjMgKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCAyMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3VtYy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5o
CmluZGV4IDI2MDRmNTA3Njg2Ny4uOWVmZGQ2NjI3OWU1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3VtYy5oCkBAIC0yMSw2ICsyMSwyOSBAQAogI2lmbmRlZiBfX0FNREdQVV9V
TUNfSF9fCiAjZGVmaW5lIF9fQU1ER1BVX1VNQ19IX18KIAorLyoKKyAqIHZvaWQgKCpmdW5jKShz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgc3RydWN0IHJhc19lcnJfZGF0YSAqZXJyX2RhdGEs
CisgKgkJCQl1aW50MzJfdCB1bWNfcmVnX29mZnNldCwgdWludDMyX3QgY2hhbm5lbF9pbmRleCkK
KyAqLworI2RlZmluZSBhbWRncHVfdW1jX2Zvcl9lYWNoX2NoYW5uZWwoZnVuYykJXAorCXN0cnVj
dCByYXNfZXJyX2RhdGEgKmVycl9kYXRhID0gKHN0cnVjdCByYXNfZXJyX2RhdGEgKilyYXNfZXJy
b3Jfc3RhdHVzOwlcCisJdWludDMyX3QgdW1jX2luc3QsIGNoYW5uZWxfaW5zdCwgdW1jX3JlZ19v
ZmZzZXQsIGNoYW5uZWxfaW5kZXg7CVwKKwlmb3IgKHVtY19pbnN0ID0gMDsgdW1jX2luc3QgPCBh
ZGV2LT51bWMudW1jX2luc3RfbnVtOyB1bWNfaW5zdCsrKSB7CVwKKwkJLyogZW5hYmxlIHRoZSBp
bmRleCBtb2RlIHRvIHF1ZXJ5IGVyb3IgY291bnQgcGVyIGNoYW5uZWwgKi8JXAorCQlhZGV2LT51
bWMuZnVuY3MtPmVuYWJsZV91bWNfaW5kZXhfbW9kZShhZGV2LCB1bWNfaW5zdCk7CVwKKwkJZm9y
IChjaGFubmVsX2luc3QgPSAwOwlcCisJCQljaGFubmVsX2luc3QgPCBhZGV2LT51bWMuY2hhbm5l
bF9pbnN0X251bTsJXAorCQkJY2hhbm5lbF9pbnN0KyspIHsJXAorCQkJLyogY2FsYyB0aGUgcmVn
aXN0ZXIgb2Zmc2V0IGFjY29yZGluZyB0byBjaGFubmVsIGluc3RhbmNlICovCVwKKwkJCXVtY19y
ZWdfb2Zmc2V0ID0gYWRldi0+dW1jLmNoYW5uZWxfb2ZmcyAqIGNoYW5uZWxfaW5zdDsJXAorCQkJ
LyogZ2V0IGNoYW5uZWwgaW5kZXggb2YgaW50ZXJsZWF2ZWQgbWVtb3J5ICovCVwKKwkJCWNoYW5u
ZWxfaW5kZXggPSBhZGV2LT51bWMuY2hhbm5lbF9pZHhfdGJsWwlcCisJCQkJdW1jX2luc3QgKiBh
ZGV2LT51bWMuY2hhbm5lbF9pbnN0X251bSArIGNoYW5uZWxfaW5zdF07CVwKKwkJCShmdW5jKShh
ZGV2LCBlcnJfZGF0YSwgdW1jX3JlZ19vZmZzZXQsIGNoYW5uZWxfaW5kZXgpOwlcCisJCX0JXAor
CX0JXAorCWFkZXYtPnVtYy5mdW5jcy0+ZGlzYWJsZV91bWNfaW5kZXhfbW9kZShhZGV2KTsKKwog
c3RydWN0IGFtZGdwdV91bWNfZnVuY3MgewogCXZvaWQgKCpyYXNfaW5pdCkoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpOwogCXZvaWQgKCpxdWVyeV9yYXNfZXJyb3JfY291bnQpKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2LAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
