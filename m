Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C15216F30
	for <lists+amd-gfx@lfdr.de>; Wed,  8 May 2019 04:46:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C530C89D7C;
	Wed,  8 May 2019 02:46:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770073.outbound.protection.outlook.com [40.107.77.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3027A6E863
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 May 2019 02:46:03 +0000 (UTC)
Received: from BN8PR12CA0028.namprd12.prod.outlook.com (2603:10b6:408:60::41)
 by DM6PR12MB3482.namprd12.prod.outlook.com (2603:10b6:5:3c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.11; Wed, 8 May
 2019 02:46:01 +0000
Received: from DM3NAM03FT008.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by BN8PR12CA0028.outlook.office365.com
 (2603:10b6:408:60::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Wed, 8 May 2019 02:46:01 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT008.mail.protection.outlook.com (10.152.82.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Wed, 8 May 2019 02:46:00 +0000
Received: from bb-VirtualBox.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 7 May 2019
 21:45:59 -0500
From: Trigger Huang <Trigger.Huang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 4/9] drm/amdgpu: implement PSP cmd GFX_CMD_ID_PROG_REG
Date: Wed, 8 May 2019 10:45:36 +0800
Message-ID: <1557283541-7877-5-git-send-email-Trigger.Huang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557283541-7877-1-git-send-email-Trigger.Huang@amd.com>
References: <1557283541-7877-1-git-send-email-Trigger.Huang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(136003)(376002)(396003)(2980300002)(428003)(199004)(189003)(50466002)(68736007)(48376002)(426003)(305945005)(476003)(6916009)(8676002)(86362001)(186003)(7696005)(77096007)(26005)(11346002)(36756003)(2616005)(486006)(336012)(126002)(446003)(8936002)(2906002)(81166006)(478600001)(81156014)(50226002)(51416003)(72206003)(14444005)(16586007)(316002)(53416004)(54906003)(4326008)(47776003)(2351001)(53936002)(5660300002)(70586007)(70206006)(76176011)(356004)(6666004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3482; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7453357e-04ac-4154-bb6f-08d6d35f4e64
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:DM6PR12MB3482; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB3482:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3482B17E8CB35BA4DC88BDEAFE320@DM6PR12MB3482.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:605;
X-Forefront-PRVS: 0031A0FFAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 9aM+0TRUkBibwLjUEx0hL0tKqTxAxEsW0xSHN3Y69cFetIbLVJySoEnkrINQSPITjPRZWX65tYhMzfFIKN/vIt3UjyvungW10rkpjQzo4pUc3sDeGF2UKFPAwrhrd+K+3h7veI6KQeF3cRtWyt0+iAjohmR7w+8ON1bsB0XFU538irXbvpLrX35k3mkmWmJO9QGkfhB/eQP8V05wR3PRpJIE66ZVfL0valwBRR94rWOLRW0RLNWfKIFwx6M/E8J8HvcrbJpMyAxLRWIjWcnCGdEcE9Q/WmdFVZwn2TvrGT4GyEgrMQxZ9Okujbc4LzJaMUIJ1eqefOoYJIX8ZAoiJ5BVykFxxRTNX+Mx7W/qRm7CAaTyQU28LOdo2GhdRM7nLTOcCanjrcyDCBxrqlO+hcHAmAf76ZUjCS/5FkuC3RU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2019 02:46:00.8100 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7453357e-04ac-4154-bb6f-08d6d35f4e64
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3482
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOJE6mUBIODch3I0ZERw2K24k0vcUWlQQ0HWoosQZpw=;
 b=II6HUa2snY30T4zEyW2NCBGSpL1rgFpvmw571ynmnh4JuNmWyDq4qQdIOyIPY9vB4YrLvadxb8jj+wI86WqmMn3HKYy9olqD2rzR2QSg/wqVR4PwsWojdqL8Zt6encDGL7eKeLYmAZXy5ZcWSPyzQIQabgJtHR6QOzmama95pZQ=
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
Cc: Daniel.Wang2@amd.com, Rashid.Sohail@amd.com, Trigger.Huang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWRkIGltcGxlbWVudGF0aW9uIHRvIHByb2dyYW0gcmVncyBieSBQU1AsIGN1cnJlbnRseSB0aGUg
Zm9sbG93aW5nCklIIHJlZ2lzdGVycyBhcmUgc3VwcG9ydGVkOgoJSUhfUkJfQ05UTAoJSUhfUkJf
Q05UTF9SSU5HMQoJSUhfUkJfQ05UTF9SSU5HMgoKQ2hhbmdlLUlkOiBJOGU3NzdmMTA4MDA0MzA2
Njg0M2QzOTYyZDM2MzVlNzA3NWVjZjIxYgpTaWduZWQtb2ZmLWJ5OiBUcmlnZ2VyIEh1YW5nIDxU
cmlnZ2VyLkh1YW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3BzcC5jIHwgMjggKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5oIHwgMTEgKysrKysrKysrKy0KIDIgZmlsZXMgY2hh
bmdlZCwgMzggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9wc3AuYwppbmRleCAzMjM4OGI1Li5iM2JjMGY4IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jCkBAIC0yODYsNiArMjg2LDM0IEBAIHN0YXRpYyBp
bnQgcHNwX2FzZF9sb2FkKHN0cnVjdCBwc3BfY29udGV4dCAqcHNwKQogCXJldHVybiByZXQ7CiB9
CiAKK3N0YXRpYyB2b2lkIHBzcF9wcmVwX3JlZ19wcm9nX2NtZF9idWYoc3RydWN0IHBzcF9nZnhf
Y21kX3Jlc3AgKmNtZCwKKwkJdWludDMyX3QgaWQsIHVpbnQzMl90IHZhbHVlKQoreworCWNtZC0+
Y21kX2lkID0gR0ZYX0NNRF9JRF9QUk9HX1JFRzsKKwljbWQtPmNtZC5jbWRfc2V0dXBfcmVnX3By
b2cucmVnX3ZhbHVlID0gdmFsdWU7CisJY21kLT5jbWQuY21kX3NldHVwX3JlZ19wcm9nLnJlZ19p
ZCA9IGlkOworfQorCitpbnQgcHNwX3JlZ19wcm9ncmFtKHN0cnVjdCBwc3BfY29udGV4dCAqcHNw
LCBlbnVtIHBzcF9yZWdfcHJvZ19pZCByZWcsCisJCXVpbnQzMl90IHZhbHVlKQoreworCXN0cnVj
dCBwc3BfZ2Z4X2NtZF9yZXNwICpjbWQgPSBOVUxMOworCWludCByZXQgPSAwOworCisJaWYgKHJl
ZyA+PSBQU1BfUkVHX0xBU1QpCisJCXJldHVybiAtRUlOVkFMOworCisJY21kID0ga3phbGxvYyhz
aXplb2Yoc3RydWN0IHBzcF9nZnhfY21kX3Jlc3ApLCBHRlBfS0VSTkVMKTsKKwlpZiAoIWNtZCkK
KwkJcmV0dXJuIC1FTk9NRU07CisKKwlwc3BfcHJlcF9yZWdfcHJvZ19jbWRfYnVmKGNtZCwgcmVn
LCB2YWx1ZSk7CisJcmV0ID0gcHNwX2NtZF9zdWJtaXRfYnVmKHBzcCwgTlVMTCwgY21kLCBwc3At
PmZlbmNlX2J1Zl9tY19hZGRyKTsKKworCWtmcmVlKGNtZCk7CisJcmV0dXJuIHJldDsKK30KKwog
c3RhdGljIHZvaWQgcHNwX3ByZXBfeGdtaV90YV9sb2FkX2NtZF9idWYoc3RydWN0IHBzcF9nZnhf
Y21kX3Jlc3AgKmNtZCwKIAkJCQkJICB1aW50NjRfdCB4Z21pX3RhX21jLCB1aW50NjRfdCB4Z21p
X21jX3NoYXJlZCwKIAkJCQkJICB1aW50MzJfdCB4Z21pX3RhX3NpemUsIHVpbnQzMl90IHNoYXJl
ZF9zaXplKQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Bz
cC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5oCmluZGV4IGNkZTEx
M2YuLjIzZDkwYjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9wc3AuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmgKQEAg
LTYyLDYgKzYyLDE0IEBAIHN0cnVjdCBwc3BfcmluZwogCXVpbnQzMl90CQkJcmluZ19zaXplOwog
fTsKIAorLyogTW9yZSByZWdpc3RlcnMgbWF5IHdpbGwgYmUgc3VwcG9ydGVkICovCitlbnVtIHBz
cF9yZWdfcHJvZ19pZCB7CisJUFNQX1JFR19JSF9SQl9DTlRMICAgICAgICA9IDAsICAvKiByZWdp
c3RlciBJSF9SQl9DTlRMICovCisJUFNQX1JFR19JSF9SQl9DTlRMX1JJTkcxICA9IDEsICAvKiBy
ZWdpc3RlciBJSF9SQl9DTlRMX1JJTkcxICovCisJUFNQX1JFR19JSF9SQl9DTlRMX1JJTkcyICA9
IDIsICAvKiByZWdpc3RlciBJSF9SQl9DTlRMX1JJTkcyICovCisJUFNQX1JFR19MQVNUCit9Owor
CiBzdHJ1Y3QgcHNwX2Z1bmNzCiB7CiAJaW50ICgqaW5pdF9taWNyb2NvZGUpKHN0cnVjdCBwc3Bf
Y29udGV4dCAqcHNwKTsKQEAgLTI1MCw1ICsyNTgsNiBAQCBpbnQgcHNwX3Jhc19lbmFibGVfZmVh
dHVyZXMoc3RydWN0IHBzcF9jb250ZXh0ICpwc3AsCiAJCXVuaW9uIHRhX3Jhc19jbWRfaW5wdXQg
KmluZm8sIGJvb2wgZW5hYmxlKTsKIAogZXh0ZXJuIGNvbnN0IHN0cnVjdCBhbWRncHVfaXBfYmxv
Y2tfdmVyc2lvbiBwc3BfdjExXzBfaXBfYmxvY2s7Ci0KK2ludCBwc3BfcmVnX3Byb2dyYW0oc3Ry
dWN0IHBzcF9jb250ZXh0ICpwc3AsIGVudW0gcHNwX3JlZ19wcm9nX2lkIHJlZywKKwkJdWludDMy
X3QgdmFsdWUpOwogI2VuZGlmCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
