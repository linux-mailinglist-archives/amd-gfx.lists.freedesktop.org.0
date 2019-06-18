Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A985949F63
	for <lists+amd-gfx@lfdr.de>; Tue, 18 Jun 2019 13:41:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16EF66E140;
	Tue, 18 Jun 2019 11:41:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780049.outbound.protection.outlook.com [40.107.78.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FAD46E140
 for <amd-gfx@lists.freedesktop.org>; Tue, 18 Jun 2019 11:41:23 +0000 (UTC)
Received: from BN6PR1201CA0022.namprd12.prod.outlook.com
 (2603:10b6:405:4c::32) by DM5PR1201MB0058.namprd12.prod.outlook.com
 (2603:10b6:4:50::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1987.12; Tue, 18 Jun
 2019 11:41:21 +0000
Received: from DM3NAM03FT032.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::205) by BN6PR1201CA0022.outlook.office365.com
 (2603:10b6:405:4c::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1987.13 via Frontend
 Transport; Tue, 18 Jun 2019 11:41:20 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT032.mail.protection.outlook.com (10.152.82.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1987.11 via Frontend Transport; Tue, 18 Jun 2019 11:41:19 +0000
Received: from hawzhang-Navi-Product-U1604.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Tue, 18 Jun 2019 06:41:18 -0500
From: Hawking Zhang <Hawking.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH libdrm 4/4] tests/amdgpu/vcn: add VCN2.0 decode support
Date: Tue, 18 Jun 2019 19:40:33 +0800
Message-ID: <1560858033-1499-4-git-send-email-Hawking.Zhang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560858033-1499-1-git-send-email-Hawking.Zhang@amd.com>
References: <1560858033-1499-1-git-send-email-Hawking.Zhang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(346002)(136003)(376002)(39860400002)(2980300002)(428003)(199004)(189003)(72206003)(77096007)(70586007)(70206006)(305945005)(476003)(47776003)(186003)(86362001)(11346002)(53936002)(8676002)(5660300002)(336012)(126002)(50466002)(486006)(36756003)(6916009)(8936002)(6666004)(53416004)(316002)(81156014)(2351001)(2616005)(81166006)(356004)(446003)(426003)(478600001)(26005)(16586007)(68736007)(4326008)(50226002)(2906002)(48376002)(76176011)(7696005)(51416003)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0058; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79ba34d5-d7a8-41aa-c14a-08d6f3e1e1d0
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR1201MB0058; 
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0058:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0058A36A0D493B6BA1AA65F6FCEA0@DM5PR1201MB0058.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:121;
X-Forefront-PRVS: 007271867D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: z1k3gW/TlVFmXOwa4nj03KZS6Lc8raNhRhAwq9cLp+JzC8peWI8IItfz1V/R/nPRoP/vGkMZwt71VBop0CYAZSX3im4sWrymj+jI03GnzzeJqtzhSpRkWAw7YWs8ocGFgfOcMehPU6gdFQ7FjKJnLXyAsxyIdzap1R2hwPDw59FeedXB21XYQm5aqmGoKPf0FLa1R6cubAVIBwshHO+XBIrf76L/v12zL4V7axz9K4FUPhdgiH+BPJH3IfToz7heGAU1BXD491cUuwoD+ppqZkeL+9ZKAOLPTZ4XF2VFfyxUxxEA6gj+RbEI1EGTccDSLDPlbpC3DfcuCTNnzmHzGBSCBETXDr1x+3Mn0BQyQbEWii6sL66LDXW2wM5w+TKBw9Bvv5fTgU8CohYPJH/NKHxrS/DRTOjPTHY87dIZ/5E=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2019 11:41:19.8877 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79ba34d5-d7a8-41aa-c14a-08d6f3e1e1d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0058
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jkZYjEipImWgeOtJqyVUZHnomtMNwPqrHyXKhFub72w=;
 b=OkklirQEpf2Fxb/zBE4Owf5JIC/9VzN/SOSdr4DStstFNw2VAmEkqr9jXgnULxRybapq+neLgXxAovltuCTwEMgWpiuEKlvxJsYFpTI3ERoYNg1fZ7qbpF6ZRk5qCpnlqpUXqXO3g7irlOKxpbE/qOEXiUKJhZyX3SxdtyVOaAc=
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Leo Liu <leo.liu@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPgoKV2l0aCBkaWZmZXJlbnQgcmVnaXN0ZXIg
b2Zmc2V0cyBmcm9tIFZDTjEuMAoKU2lnbmVkLW9mZi1ieTogTGVvIExpdSA8bGVvLmxpdUBhbWQu
Y29tPgpSZXZpZXdlZC1ieTogSmFtZXMgWmh1IDxKYW1lcy5aaHVAYW1kLmNvbT4KLS0tCiB0ZXN0
cy9hbWRncHUvdmNuX3Rlc3RzLmMgfCA1MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspLCAxMyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9hbWRncHUvdmNuX3Rlc3RzLmMgYi90ZXN0
cy9hbWRncHUvdmNuX3Rlc3RzLmMKaW5kZXggODU5ZWM0OS4uYWQ0MzhmMyAxMDA2NDQKLS0tIGEv
dGVzdHMvYW1kZ3B1L3Zjbl90ZXN0cy5jCisrKyBiL3Rlc3RzL2FtZGdwdS92Y25fdGVzdHMuYwpA
QCAtNDQsNiArNDQsMTQgQEAgc3RydWN0IGFtZGdwdV92Y25fYm8gewogCXVpbnQ4X3QgKnB0cjsK
IH07CiAKK3N0cnVjdCBhbWRncHVfdmNuX3JlZyB7CisJdWludDMyX3QgZGF0YTA7CisJdWludDMy
X3QgZGF0YTE7CisJdWludDMyX3QgY21kOworCXVpbnQzMl90IG5vcDsKKwl1aW50MzJfdCBjbnRs
OworfTsKKwogc3RhdGljIGFtZGdwdV9kZXZpY2VfaGFuZGxlIGRldmljZV9oYW5kbGU7CiBzdGF0
aWMgdWludDMyX3QgbWFqb3JfdmVyc2lvbjsKIHN0YXRpYyB1aW50MzJfdCBtaW5vcl92ZXJzaW9u
OwpAQCAtNTcsNiArNjUsNyBAQCBzdGF0aWMgdWludDMyX3QgKmliX2NwdTsKIAogc3RhdGljIGFt
ZGdwdV9ib19oYW5kbGUgcmVzb3VyY2VzW01BWF9SRVNPVVJDRVNdOwogc3RhdGljIHVuc2lnbmVk
IG51bV9yZXNvdXJjZXM7CitzdGF0aWMgc3RydWN0IGFtZGdwdV92Y25fcmVnIHJlZzsKIAogc3Rh
dGljIHZvaWQgYW1kZ3B1X2NzX3Zjbl9kZWNfY3JlYXRlKHZvaWQpOwogc3RhdGljIHZvaWQgYW1k
Z3B1X2NzX3Zjbl9kZWNfZGVjb2RlKHZvaWQpOwpAQCAtOTYsNiArMTA1LDIxIEBAIENVX0JPT0wg
c3VpdGVfdmNuX3Rlc3RzX2VuYWJsZSh2b2lkKQogCQlyZXR1cm4gQ1VfRkFMU0U7CiAJfQogCisJ
aWYgKGZhbWlseV9pZCA9PSBBTURHUFVfRkFNSUxZX1JWKSB7CisJCXJlZy5kYXRhMCA9IDB4ODFj
NDsKKwkJcmVnLmRhdGExID0gMHg4MWM1OworCQlyZWcuY21kID0gMHg4MWMzOworCQlyZWcubm9w
ID0gMHg4MWZmOworCQlyZWcuY250bCA9IDB4ODFjNjsKKwl9IGVsc2UgaWYgKGZhbWlseV9pZCA9
PSBBTURHUFVfRkFNSUxZX05WKSB7CisJCXJlZy5kYXRhMCA9IDB4NTA0OworCQlyZWcuZGF0YTEg
PSAweDUwNTsKKwkJcmVnLmNtZCA9IDB4NTAzOworCQlyZWcubm9wID0gMHg1M2Y7CisJCXJlZy5j
bnRsID0gMHg1MDY7CisJfSBlbHNlCisJCXJldHVybiBDVV9GQUxTRTsKKwogCXJldHVybiBDVV9U
UlVFOwogfQogCkBAIC0yMzcsMTEgKzI2MSwxMSBAQCBzdGF0aWMgdm9pZCBmcmVlX3Jlc291cmNl
KHN0cnVjdCBhbWRncHVfdmNuX2JvICp2Y25fYm8pCiAKIHN0YXRpYyB2b2lkIHZjbl9kZWNfY21k
KHVpbnQ2NF90IGFkZHIsIHVuc2lnbmVkIGNtZCwgaW50ICppZHgpCiB7Ci0JaWJfY3B1WygqaWR4
KSsrXSA9IDB4ODFDNDsKKwlpYl9jcHVbKCppZHgpKytdID0gcmVnLmRhdGEwOwogCWliX2NwdVso
KmlkeCkrK10gPSBhZGRyOwotCWliX2NwdVsoKmlkeCkrK10gPSAweDgxQzU7CisJaWJfY3B1Wygq
aWR4KSsrXSA9IHJlZy5kYXRhMTsKIAlpYl9jcHVbKCppZHgpKytdID0gYWRkciA+PiAzMjsKLQlp
Yl9jcHVbKCppZHgpKytdID0gMHg4MUMzOworCWliX2NwdVsoKmlkeCkrK10gPSByZWcuY21kOwog
CWliX2NwdVsoKmlkeCkrK10gPSBjbWQgPDwgMTsKIH0KIApAQCAtMjYyLDE0ICsyODYsMTQgQEAg
c3RhdGljIHZvaWQgYW1kZ3B1X2NzX3Zjbl9kZWNfY3JlYXRlKHZvaWQpCiAJbWVtY3B5KG1zZ19i
dWYucHRyLCB2Y25fZGVjX2NyZWF0ZV9tc2csIHNpemVvZih2Y25fZGVjX2NyZWF0ZV9tc2cpKTsK
IAogCWxlbiA9IDA7Ci0JaWJfY3B1W2xlbisrXSA9IDB4ODFDNDsKKwlpYl9jcHVbbGVuKytdID0g
cmVnLmRhdGEwOwogCWliX2NwdVtsZW4rK10gPSBtc2dfYnVmLmFkZHI7Ci0JaWJfY3B1W2xlbisr
XSA9IDB4ODFDNTsKKwlpYl9jcHVbbGVuKytdID0gcmVnLmRhdGExOwogCWliX2NwdVtsZW4rK10g
PSBtc2dfYnVmLmFkZHIgPj4gMzI7Ci0JaWJfY3B1W2xlbisrXSA9IDB4ODFDMzsKKwlpYl9jcHVb
bGVuKytdID0gcmVnLmNtZDsKIAlpYl9jcHVbbGVuKytdID0gMDsKIAlmb3IgKDsgbGVuICUgMTY7
ICkgewotCQlpYl9jcHVbbGVuKytdID0gMHg4MWZmOworCQlpYl9jcHVbbGVuKytdID0gcmVnLm5v
cDsKIAkJaWJfY3B1W2xlbisrXSA9IDA7CiAJfQogCkBAIC0zMzYsMTAgKzM2MCwxMCBAQCBzdGF0
aWMgdm9pZCBhbWRncHVfY3NfdmNuX2RlY19kZWNvZGUodm9pZCkKIAl2Y25fZGVjX2NtZChpdF9h
ZGRyLCAweDIwNCwgJmxlbik7CiAJdmNuX2RlY19jbWQoY3R4X2FkZHIsIDB4MjA2LCAmbGVuKTsK
IAotCWliX2NwdVtsZW4rK10gPSAweDgxQzY7CisJaWJfY3B1W2xlbisrXSA9IHJlZy5jbnRsOwog
CWliX2NwdVtsZW4rK10gPSAweDE7CiAJZm9yICg7IGxlbiAlIDE2OyApIHsKLQkJaWJfY3B1W2xl
bisrXSA9IDB4ODFmZjsKKwkJaWJfY3B1W2xlbisrXSA9IHJlZy5ub3A7CiAJCWliX2NwdVtsZW4r
K10gPSAwOwogCX0KIApAQCAtMzcxLDE0ICszOTUsMTQgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X2Nz
X3Zjbl9kZWNfZGVzdHJveSh2b2lkKQogCW1lbWNweShtc2dfYnVmLnB0ciwgdmNuX2RlY19kZXN0
cm95X21zZywgc2l6ZW9mKHZjbl9kZWNfZGVzdHJveV9tc2cpKTsKIAogCWxlbiA9IDA7Ci0JaWJf
Y3B1W2xlbisrXSA9IDB4ODFDNDsKKwlpYl9jcHVbbGVuKytdID0gcmVnLmRhdGEwOwogCWliX2Nw
dVtsZW4rK10gPSBtc2dfYnVmLmFkZHI7Ci0JaWJfY3B1W2xlbisrXSA9IDB4ODFDNTsKKwlpYl9j
cHVbbGVuKytdID0gcmVnLmRhdGExOwogCWliX2NwdVtsZW4rK10gPSBtc2dfYnVmLmFkZHIgPj4g
MzI7Ci0JaWJfY3B1W2xlbisrXSA9IDB4ODFDMzsKKwlpYl9jcHVbbGVuKytdID0gcmVnLmNtZDsK
IAlpYl9jcHVbbGVuKytdID0gMDsKIAlmb3IgKDsgbGVuICUgMTY7ICkgewotCQlpYl9jcHVbbGVu
KytdID0gMHg4MWZmOworCQlpYl9jcHVbbGVuKytdID0gcmVnLm5vcDsKIAkJaWJfY3B1W2xlbisr
XSA9IDA7CiAJfQogCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
