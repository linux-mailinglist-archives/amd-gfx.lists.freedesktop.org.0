Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F6115D02
	for <lists+amd-gfx@lfdr.de>; Tue,  7 May 2019 08:09:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892B489D83;
	Tue,  7 May 2019 06:09:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750083.outbound.protection.outlook.com [40.107.75.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B451C89D83
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 May 2019 06:09:31 +0000 (UTC)
Received: from DM3PR12CA0070.namprd12.prod.outlook.com (2603:10b6:0:57::14) by
 BN8PR12MB3473.namprd12.prod.outlook.com (2603:10b6:408:46::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Tue, 7 May 2019 06:09:29 +0000
Received: from CO1NAM03FT030.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::202) by DM3PR12CA0070.outlook.office365.com
 (2603:10b6:0:57::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.11 via Frontend
 Transport; Tue, 7 May 2019 06:09:29 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT030.mail.protection.outlook.com (10.152.80.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Tue, 7 May 2019 06:09:29 +0000
Received: from build-machine.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 7 May 2019
 01:09:21 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 4/4] drm/amd/powerplay: update Vega10 power state on OD
Date: Tue, 7 May 2019 14:08:59 +0800
Message-ID: <20190507060859.27650-4-evan.quan@amd.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190507060859.27650-1-evan.quan@amd.com>
References: <20190507060859.27650-1-evan.quan@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(396003)(39860400002)(376002)(346002)(2980300002)(428003)(199004)(189003)(54906003)(1076003)(44832011)(316002)(6916009)(26005)(47776003)(446003)(11346002)(15650500001)(50466002)(77096007)(2351001)(48376002)(486006)(53416004)(126002)(476003)(70206006)(305945005)(70586007)(36756003)(81156014)(426003)(50226002)(14444005)(53936002)(8936002)(5660300002)(478600001)(336012)(86362001)(72206003)(2616005)(8676002)(81166006)(76176011)(2906002)(51416003)(7696005)(186003)(356004)(6666004)(2870700001)(68736007)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3473; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5371b61e-cadd-4e22-1b8b-08d6d2b290ba
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BN8PR12MB3473; 
X-MS-TrafficTypeDiagnostic: BN8PR12MB3473:
X-Microsoft-Antispam-PRVS: <BN8PR12MB34733D36691AAA0CFAAF9750E4310@BN8PR12MB3473.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:389;
X-Forefront-PRVS: 0030839EEE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: yFvlo0drrCXsx532z5+79AtXIzuTyLMjIJyxCqRast9eCoJDHrX4nfIBV1+J8ltv9VPUAXay/45wQrrXutxBJPvM9egUI/i96ijyJGn9hXQyQoHQsDATL/vBCQXaQKfyoUtzaLe7/Ur0dMTRe2VhiI9zC7RHJhWq9Ntj0Qlum2qgCzfO/xNbu2LJcEDCz/LM75KSNl2oG64wzm3UWG/8tPfhPheLFseda8u45LKie/evW5YMqoTFOSVEMlZzgeCrdv9KZ9Yc7lXFIQndCiu5dvZ2nqSUzz/MwmDGx1D4M/6zwaDLVUfFZiFx2+VaNL6aQxOyTbK8CaUSZJ7cB/0SV6QnCgJm5Z39o9vNyutxyfNhl6p0QWj9wbIjYxEN/B0LQ1OpnwpPhKoaSBDmoyrefvIP+zt5L/oyDtDnbvKoxXg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2019 06:09:29.0208 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5371b61e-cadd-4e22-1b8b-08d6d2b290ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3473
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1c4ZDRvKRRAZCKXxFxxd2pyIcP/ZKkxq/aQWyWASPo=;
 b=TR1Ycx7dxE0kOXWS3N79EMLp4yBj4Q4i7/aQzwY4k4yrJFeBiYxS5XCvZnWtPMnLSQxF9qt+Zk9bBpYdktSmTdahsIWQI98j+er+eLEkx7abgF2cIyTDckovgkDDneFWpiJn3aRgJtRMkkeuAIvrjzC1KDPYxEtk+OyOWnO9/AI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; yiannakis.de; dkim=none (message not signed)
 header.d=none;yiannakis.de; dmarc=permerror action=none header.from=amd.com;
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
Cc: yanik@yiannakis.de, Alexander.Deucher@amd.com,
 Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VXBkYXRlIFZlZ2ExMCB0b3AgcGVyZm9ybWFuY2UgbGV2ZWwgcG93ZXIgc3RhdGUgYWNjb3JkaW5n
bHkKb24gT0QuCgpDaGFuZ2UtSWQ6IElhYWRlZWZiMjkwNDIyMmJmNWY0ZDU0YjM5ZDcxNzljZTUz
ZjkyYWMwClNpZ25lZC1vZmYtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+Ci0tLQog
Li4uL2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9od21nci5jICAgIHwgNTkgKysrKysr
KysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDU5IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMTBfaHdtZ3IuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9od21nci5jCmluZGV4
IGY0YjgxZjUwYjE4NS4uNDg3ODkzOGVjZjMzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9od21nci92ZWdhMTBfaHdtZ3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9od21nci92ZWdhMTBfaHdtZ3IuYwpAQCAtNTAwOSw2ICs1MDA5LDYzIEBA
IHN0YXRpYyBib29sIHZlZ2ExMF9jaGVja19jbGtfdm9sdGFnZV92YWxpZChzdHJ1Y3QgcHBfaHdt
Z3IgKmh3bWdyLAogCXJldHVybiB0cnVlOwogfQogCitzdGF0aWMgdm9pZCB2ZWdhMTBfb2RuX3Vw
ZGF0ZV9wb3dlcl9zdGF0ZShzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKQoreworCXN0cnVjdCB2ZWdh
MTBfaHdtZ3IgKmRhdGEgPSBod21nci0+YmFja2VuZDsKKwlzdHJ1Y3QgcHBfcG93ZXJfc3RhdGUg
KnBzID0gaHdtZ3ItPnJlcXVlc3RfcHM7CisJc3RydWN0IHZlZ2ExMF9wb3dlcl9zdGF0ZSAqdmVn
YTEwX3BzOworCXN0cnVjdCB2ZWdhMTBfc2luZ2xlX2RwbV90YWJsZSAqZ2Z4X2RwbV90YWJsZSA9
CisJCSZkYXRhLT5kcG1fdGFibGUuZ2Z4X3RhYmxlOworCXN0cnVjdCB2ZWdhMTBfc2luZ2xlX2Rw
bV90YWJsZSAqc29jX2RwbV90YWJsZSA9CisJCSZkYXRhLT5kcG1fdGFibGUuc29jX3RhYmxlOwor
CXN0cnVjdCB2ZWdhMTBfc2luZ2xlX2RwbV90YWJsZSAqbWVtX2RwbV90YWJsZSA9CisJCSZkYXRh
LT5kcG1fdGFibGUubWVtX3RhYmxlOworCWludCBtYXhfbGV2ZWw7CisKKwlpZiAoIXBzKQorCQly
ZXR1cm47CisKKwl2ZWdhMTBfcHMgPSBjYXN0X3Bod192ZWdhMTBfcG93ZXJfc3RhdGUoJnBzLT5o
YXJkd2FyZSk7CisJbWF4X2xldmVsID0gdmVnYTEwX3BzLT5wZXJmb3JtYW5jZV9sZXZlbF9jb3Vu
dCAtIDE7CisKKwlpZiAodmVnYTEwX3BzLT5wZXJmb3JtYW5jZV9sZXZlbHNbbWF4X2xldmVsXS5n
ZnhfY2xvY2sgIT0KKwkgICAgZ2Z4X2RwbV90YWJsZS0+ZHBtX2xldmVsc1tnZnhfZHBtX3RhYmxl
LT5jb3VudCAtIDFdLnZhbHVlKQorCQl2ZWdhMTBfcHMtPnBlcmZvcm1hbmNlX2xldmVsc1ttYXhf
bGV2ZWxdLmdmeF9jbG9jayA9CisJCQlnZnhfZHBtX3RhYmxlLT5kcG1fbGV2ZWxzW2dmeF9kcG1f
dGFibGUtPmNvdW50IC0gMV0udmFsdWU7CisKKwlpZiAodmVnYTEwX3BzLT5wZXJmb3JtYW5jZV9s
ZXZlbHNbbWF4X2xldmVsXS5zb2NfY2xvY2sgIT0KKwkgICAgc29jX2RwbV90YWJsZS0+ZHBtX2xl
dmVsc1tzb2NfZHBtX3RhYmxlLT5jb3VudCAtIDFdLnZhbHVlKQorCQl2ZWdhMTBfcHMtPnBlcmZv
cm1hbmNlX2xldmVsc1ttYXhfbGV2ZWxdLnNvY19jbG9jayA9CisJCQlzb2NfZHBtX3RhYmxlLT5k
cG1fbGV2ZWxzW3NvY19kcG1fdGFibGUtPmNvdW50IC0gMV0udmFsdWU7CisKKwlpZiAodmVnYTEw
X3BzLT5wZXJmb3JtYW5jZV9sZXZlbHNbbWF4X2xldmVsXS5tZW1fY2xvY2sgIT0KKwkgICAgbWVt
X2RwbV90YWJsZS0+ZHBtX2xldmVsc1ttZW1fZHBtX3RhYmxlLT5jb3VudCAtIDFdLnZhbHVlKQor
CQl2ZWdhMTBfcHMtPnBlcmZvcm1hbmNlX2xldmVsc1ttYXhfbGV2ZWxdLm1lbV9jbG9jayA9CisJ
CQltZW1fZHBtX3RhYmxlLT5kcG1fbGV2ZWxzW21lbV9kcG1fdGFibGUtPmNvdW50IC0gMV0udmFs
dWU7CisKKwlpZiAoIWh3bWdyLT5wcykKKwkJcmV0dXJuOworCisJcHMgPSAoc3RydWN0IHBwX3Bv
d2VyX3N0YXRlICopKCh1bnNpZ25lZCBsb25nKShod21nci0+cHMpICsgaHdtZ3ItPnBzX3NpemUg
KiAoaHdtZ3ItPm51bV9wcyAtIDEpKTsKKwl2ZWdhMTBfcHMgPSBjYXN0X3Bod192ZWdhMTBfcG93
ZXJfc3RhdGUoJnBzLT5oYXJkd2FyZSk7CisJbWF4X2xldmVsID0gdmVnYTEwX3BzLT5wZXJmb3Jt
YW5jZV9sZXZlbF9jb3VudCAtIDE7CisKKwlpZiAodmVnYTEwX3BzLT5wZXJmb3JtYW5jZV9sZXZl
bHNbbWF4X2xldmVsXS5nZnhfY2xvY2sgIT0KKwkgICAgZ2Z4X2RwbV90YWJsZS0+ZHBtX2xldmVs
c1tnZnhfZHBtX3RhYmxlLT5jb3VudCAtIDFdLnZhbHVlKQorCQl2ZWdhMTBfcHMtPnBlcmZvcm1h
bmNlX2xldmVsc1ttYXhfbGV2ZWxdLmdmeF9jbG9jayA9CisJCQlnZnhfZHBtX3RhYmxlLT5kcG1f
bGV2ZWxzW2dmeF9kcG1fdGFibGUtPmNvdW50IC0gMV0udmFsdWU7CisKKwlpZiAodmVnYTEwX3Bz
LT5wZXJmb3JtYW5jZV9sZXZlbHNbbWF4X2xldmVsXS5zb2NfY2xvY2sgIT0KKwkgICAgc29jX2Rw
bV90YWJsZS0+ZHBtX2xldmVsc1tzb2NfZHBtX3RhYmxlLT5jb3VudCAtIDFdLnZhbHVlKQorCQl2
ZWdhMTBfcHMtPnBlcmZvcm1hbmNlX2xldmVsc1ttYXhfbGV2ZWxdLnNvY19jbG9jayA9CisJCQlz
b2NfZHBtX3RhYmxlLT5kcG1fbGV2ZWxzW3NvY19kcG1fdGFibGUtPmNvdW50IC0gMV0udmFsdWU7
CisKKwlpZiAodmVnYTEwX3BzLT5wZXJmb3JtYW5jZV9sZXZlbHNbbWF4X2xldmVsXS5tZW1fY2xv
Y2sgIT0KKwkgICAgbWVtX2RwbV90YWJsZS0+ZHBtX2xldmVsc1ttZW1fZHBtX3RhYmxlLT5jb3Vu
dCAtIDFdLnZhbHVlKQorCQl2ZWdhMTBfcHMtPnBlcmZvcm1hbmNlX2xldmVsc1ttYXhfbGV2ZWxd
Lm1lbV9jbG9jayA9CisJCQltZW1fZHBtX3RhYmxlLT5kcG1fbGV2ZWxzW21lbV9kcG1fdGFibGUt
PmNvdW50IC0gMV0udmFsdWU7Cit9CisKIHN0YXRpYyB2b2lkIHZlZ2ExMF9vZG5fdXBkYXRlX3Nv
Y190YWJsZShzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLAogCQkJCQkJZW51bSBQUF9PRF9EUE1fVEFC
TEVfQ09NTUFORCB0eXBlKQogewpAQCAtNTA3OSw2ICs1MTM2LDcgQEAgc3RhdGljIHZvaWQgdmVn
YTEwX29kbl91cGRhdGVfc29jX3RhYmxlKHN0cnVjdCBwcF9od21nciAqaHdtZ3IsCiAJCQkJcG9k
bl92ZGRfZGVwLT5lbnRyaWVzW3BvZG5fdmRkX2RlcC0+Y291bnQgLSAxXS52ZGRJbmQ7CiAJCX0K
IAl9CisJdmVnYTEwX29kbl91cGRhdGVfcG93ZXJfc3RhdGUoaHdtZ3IpOwogfQogCiBzdGF0aWMg
aW50IHZlZ2ExMF9vZG5fZWRpdF9kcG1fdGFibGUoc3RydWN0IHBwX2h3bWdyICpod21nciwKQEAg
LTUxMTMsNiArNTE3MSw3IEBAIHN0YXRpYyBpbnQgdmVnYTEwX29kbl9lZGl0X2RwbV90YWJsZShz
dHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLAogCX0gZWxzZSBpZiAoUFBfT0RfUkVTVE9SRV9ERUZBVUxU
X1RBQkxFID09IHR5cGUpIHsKIAkJbWVtY3B5KCYoZGF0YS0+ZHBtX3RhYmxlKSwgJihkYXRhLT5n
b2xkZW5fZHBtX3RhYmxlKSwgc2l6ZW9mKHN0cnVjdCB2ZWdhMTBfZHBtX3RhYmxlKSk7CiAJCXZl
Z2ExMF9vZG5faW5pdGlhbF9kZWZhdWx0X3NldHRpbmcoaHdtZ3IpOworCQl2ZWdhMTBfb2RuX3Vw
ZGF0ZV9wb3dlcl9zdGF0ZShod21ncik7CiAJCXJldHVybiAwOwogCX0gZWxzZSBpZiAoUFBfT0Rf
Q09NTUlUX0RQTV9UQUJMRSA9PSB0eXBlKSB7CiAJCXZlZ2ExMF9jaGVja19kcG1fdGFibGVfdXBk
YXRlZChod21ncik7Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
