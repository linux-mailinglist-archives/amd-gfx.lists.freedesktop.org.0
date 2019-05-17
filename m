Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B3E21384
	for <lists+amd-gfx@lfdr.de>; Fri, 17 May 2019 07:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D8378982A;
	Fri, 17 May 2019 05:44:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770055.outbound.protection.outlook.com [40.107.77.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 015428982A
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 May 2019 05:44:37 +0000 (UTC)
Received: from DM3PR12CA0072.namprd12.prod.outlook.com (2603:10b6:0:57::16) by
 MWHPR12MB1277.namprd12.prod.outlook.com (2603:10b6:300:f::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Fri, 17 May 2019 05:44:36 +0000
Received: from BY2NAM03FT060.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::204) by DM3PR12CA0072.outlook.office365.com
 (2603:10b6:0:57::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1900.16 via Frontend
 Transport; Fri, 17 May 2019 05:44:35 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT060.mail.protection.outlook.com (10.152.85.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1900.16 via Frontend Transport; Fri, 17 May 2019 05:44:35 +0000
Received: from build-machine.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 17 May 2019
 00:44:33 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: fix sw SMU wrong UVD/VCE powergate setting
Date: Fri, 17 May 2019 13:44:30 +0800
Message-ID: <20190517054430.13736-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(396003)(39860400002)(376002)(136003)(2980300002)(428003)(189003)(199004)(5660300002)(8936002)(44832011)(14444005)(86362001)(486006)(81156014)(8676002)(81166006)(50226002)(126002)(2616005)(476003)(72206003)(305945005)(478600001)(2906002)(6916009)(2870700001)(50466002)(48376002)(77096007)(26005)(186003)(7696005)(51416003)(426003)(336012)(68736007)(2351001)(36756003)(4326008)(1076003)(53416004)(356004)(47776003)(316002)(53936002)(70586007)(70206006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1277; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5bc1d81-9f47-4700-e1ce-08d6da8abe6d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:MWHPR12MB1277; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1277:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1277EF2539674CDE8EE699F0E40B0@MWHPR12MB1277.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-Forefront-PRVS: 0040126723
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: ZWNjSuKxTM83M+80W0wblK2OtpIhKlv185aPhqtRxXq8auH86hfkfkI+DreD69lFkTUiBUMag/jVQ699y0GadK6M1jyzRfjhmolgiWVyHzc9lIYLTwhIOMVoorD0z+h+OgStvXWqjbnC1V95jsmSa9E37R4A88br1p0MZOWdK96qUoPQLWFRNg+707ePvdKkfOsXCDfKIxEPNmOyA11yZW2SVvqnLtDzbzOlqV36fflF1/G4QU94WB5MbA5tSTDoCx3arKaRRMRg4QmtXFFx3M3E9E5T0gjWQPrY9weI5Sur3CGEK9ytCd1v6cnItFg97SYCpYBCFpVoGYT5bPANUklvh385CVo94zcDGqEyGxP8HlEv07hP3S0Fu6Owznfbcxez3ky2nvMC0VwK5G/hnNxfzFi5gW6lKnbDd+kSV8k=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2019 05:44:35.3166 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5bc1d81-9f47-4700-e1ce-08d6da8abe6d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1277
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRJ+79zWNExxDr0XubYXi4onsJcKVdRzHY5EmxwpHhM=;
 b=Trv9Zpy5XUyNYd4YvpMQQFD9bFnW5Yra/hXLiTvf+k35if9wqA5kvLZ4OKbfyXlB9GT6Jsk6fkiJz+CvRmi5h8xtjxURdEpDcB47p6sKNYHsisLSA8ifYdVYJQS7omD/igvIyfBD9hbwhyIo5L7UXGYrgXKdPK4SXPSZUMgkCEE=
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
Cc: Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIFVWRC9WQ0UgYml0cyBhcmUgc2V0IHdyb25nbHkuIFRoaXMgY2F1c2VzIHRoZSBVVkQvVkNF
IGNsb2NrcwphcmUgbm90IGJyb3VnaHQgYmFjayBjb3JyZWN0bHkgb24gbmVlZGVkLgoKQ2hhbmdl
LUlkOiBJNmVkYTY3ZWEzYmU0NWZkNWY0MjJjZGI3ODM1NjkxNWJmMDZmZjQxZQpTaWduZWQtb2Zm
LWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jIHwgMTIgKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvc211X3YxMV8wLmMKaW5kZXggMGVlYTkzYzhkZmY3Li5hM2E3YWZjYTc1MTYgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jCkBAIC0xODE0LDI0ICsx
ODE0LDI0IEBAIHN0YXRpYyBpbnQgc211X3YxMV8wX3VwZGF0ZV9vZDhfc2V0dGluZ3Moc3RydWN0
IHNtdV9jb250ZXh0ICpzbXUsCiAKIHN0YXRpYyBpbnQgc211X3YxMV8wX2RwbV9zZXRfdXZkX2Vu
YWJsZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgYm9vbCBlbmFibGUpCiB7Ci0JaWYgKCFzbXVf
ZmVhdHVyZV9pc19zdXBwb3J0ZWQoc211LCBGRUFUVVJFX0RQTV9WQ0VfQklUKSkKKwlpZiAoIXNt
dV9mZWF0dXJlX2lzX3N1cHBvcnRlZChzbXUsIEZFQVRVUkVfRFBNX1VWRF9CSVQpKQogCQlyZXR1
cm4gMDsKIAotCWlmIChlbmFibGUgPT0gc211X2ZlYXR1cmVfaXNfZW5hYmxlZChzbXUsIEZFQVRV
UkVfRFBNX1ZDRV9CSVQpKQorCWlmIChlbmFibGUgPT0gc211X2ZlYXR1cmVfaXNfZW5hYmxlZChz
bXUsIEZFQVRVUkVfRFBNX1VWRF9CSVQpKQogCQlyZXR1cm4gMDsKIAotCXJldHVybiBzbXVfZmVh
dHVyZV9zZXRfZW5hYmxlZChzbXUsIEZFQVRVUkVfRFBNX1ZDRV9CSVQsIGVuYWJsZSk7CisJcmV0
dXJuIHNtdV9mZWF0dXJlX3NldF9lbmFibGVkKHNtdSwgRkVBVFVSRV9EUE1fVVZEX0JJVCwgZW5h
YmxlKTsKIH0KIAogc3RhdGljIGludCBzbXVfdjExXzBfZHBtX3NldF92Y2VfZW5hYmxlKHN0cnVj
dCBzbXVfY29udGV4dCAqc211LCBib29sIGVuYWJsZSkKIHsKLQlpZiAoIXNtdV9mZWF0dXJlX2lz
X3N1cHBvcnRlZChzbXUsIEZFQVRVUkVfRFBNX1VWRF9CSVQpKQorCWlmICghc211X2ZlYXR1cmVf
aXNfc3VwcG9ydGVkKHNtdSwgRkVBVFVSRV9EUE1fVkNFX0JJVCkpCiAJCXJldHVybiAwOwogCi0J
aWYgKGVuYWJsZSA9PSBzbXVfZmVhdHVyZV9pc19lbmFibGVkKHNtdSwgRkVBVFVSRV9EUE1fVVZE
X0JJVCkpCisJaWYgKGVuYWJsZSA9PSBzbXVfZmVhdHVyZV9pc19lbmFibGVkKHNtdSwgRkVBVFVS
RV9EUE1fVkNFX0JJVCkpCiAJCXJldHVybiAwOwogCi0JcmV0dXJuIHNtdV9mZWF0dXJlX3NldF9l
bmFibGVkKHNtdSwgRkVBVFVSRV9EUE1fVVZEX0JJVCwgZW5hYmxlKTsKKwlyZXR1cm4gc211X2Zl
YXR1cmVfc2V0X2VuYWJsZWQoc211LCBGRUFUVVJFX0RQTV9WQ0VfQklULCBlbmFibGUpOwogfQog
CiBzdGF0aWMgaW50IHNtdV92MTFfMF9nZXRfY3VycmVudF9ycG0oc3RydWN0IHNtdV9jb250ZXh0
ICpzbXUsCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
