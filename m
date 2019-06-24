Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2314651A1E
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 19:56:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B58C689DA3;
	Mon, 24 Jun 2019 17:56:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam05on0615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe51::615])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7DE689DA3
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 17:56:36 +0000 (UTC)
Received: from DM5PR12CA0002.namprd12.prod.outlook.com (2603:10b6:4:1::12) by
 CY4PR12MB1272.namprd12.prod.outlook.com (2603:10b6:903:3e::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Mon, 24 Jun 2019 17:56:35 +0000
Received: from DM3NAM03FT030.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::202) by DM5PR12CA0002.outlook.office365.com
 (2603:10b6:4:1::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2008.16 via Frontend
 Transport; Mon, 24 Jun 2019 17:56:34 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT030.mail.protection.outlook.com (10.152.82.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2008.13 via Frontend Transport; Mon, 24 Jun 2019 17:56:34 +0000
Received: from kazbox.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Mon, 24 Jun 2019
 12:56:34 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: update infoframe after dig fe is turned on
 (v2)
Date: Mon, 24 Jun 2019 13:56:31 -0400
Message-ID: <20190624175631.25375-1-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(346002)(396003)(39860400002)(376002)(136003)(2980300002)(428003)(199004)(189003)(81166006)(72206003)(36756003)(4326008)(44832011)(2616005)(476003)(426003)(68736007)(53416004)(2351001)(486006)(15650500001)(50226002)(336012)(16586007)(48376002)(54906003)(6916009)(53936002)(356004)(8676002)(316002)(6666004)(126002)(50466002)(14444005)(478600001)(7696005)(51416003)(305945005)(47776003)(26005)(8936002)(2906002)(5660300002)(70206006)(186003)(1076003)(70586007)(81156014)(77096007)(86362001)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1272; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b807aff-8060-492e-9cd1-08d6f8cd4c0a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1272; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1272:
X-Microsoft-Antispam-PRVS: <CY4PR12MB127275881AFD9CADE5F7CB90ECE00@CY4PR12MB1272.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 007814487B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: /O+0/mc0G4Kqx3srktCy0fJfdkeNF6LUEvW1NHPB6KR0BnE+VbAch2YmTlbF4kiv2Ue72gBwJWgVzxzNa0QhDYhyh506QEKv6ilMs6KnTI+khZcrUqhRMCBsd3EVIYPm0axaDxrmiTJa4Q2DW2g9IsZ9etWAo3QWqDi0sxvwRdEnlcTuBXLd9GIXIsdPgvQJK8EoppuoUfMNXgkwflP6aXWrSH+WAQWMacL3tTekkF31bHErfOefOLI3W49BYBzXFVCKmd329gQJxs7+EViZFPEsamM6QOGT7lJmWl5J2JaqDGryZlG8FRTM8fmea71OldLDn5WlhwPniM33DvmSoHT4zutAhgWa5YKaG/X+HbNRM73vyCOGn06ddVQNMFjw3Azjp8ixf1P2CzmJYVtJmQ0wgMkU9O6gQCRPC4i/DcE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2019 17:56:34.6201 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b807aff-8060-492e-9cd1-08d6f8cd4c0a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1272
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZP/nbS31VutSxOpsyy/XxYNuPKRhseEzZM4IvS7h2Ks=;
 b=k23lNw8AEfVe9hqcZ+hw6k/Jl0lTG17LMZHnb+ytPiIJTgo2r4i3UEU75bxzFLUIG5698Ssn8nUkALsxLDhAlmrLOL9XaXVvAVGmNO7bjOz3NgidBq/MzasLVxt3dxIWP4q8osmv/zVdi8BNo22Bo1fzmC3U/Hr0O2DnSxmFV+M=
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
Cc: Leo Li <sunpeng.li@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, Roman Li <roman.li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KVGhlIEFWSSBpbmZvZnJhbWUgaXMgaW5jb3JyZWN0bHkgcHJvZ3JhbW1lZCBvbiBEQ04x
LzIgd2hlbiBlbmFibGluZyBhCnN0cmVhbSAtIGNhdXNpbmcgdGhlIHdyb25nIHBpeGVsIGVuY29k
aW5nIHRvIGJlIHVzZWQgZm9yIGRpc3BsYXkuCgpUaGlzIGlzIGJlY2F1c2UgdGhlIEFWSSBpbmZv
ZnJhbWUgaXMgcHJvZ3JhbW1lZCBiZWZvcmUgdGhlIERJRyBCRSBpcwpjb25uZWN0ZWQgdG8gdGhl
IEZFIGFuZCB0dXJuZWQgb24sIHNvIGVuYWJsaW5nIHRoZSBBRk1UIGJsb2NrIGRvZXNuJ3QKYWN0
dWFsbHkgd29yayBhbmQgdGhlIHJlZ2lzdGVycyBzdWJzZXF1ZW50bHkgY2FuJ3QgYmUgd3JpdHRl
biB0by4KCltIb3ddClByb2dyYW0gdGhlIGluZm9mcmFtZSAqYWZ0ZXIqIHR1cm5pbmcgb24gdGhl
IERJRyBGRS4gVGhpcyB3YXMgdGhlCmJlaGF2aW9yIHByZXZpb3VzbHkgdXNlZCBidXQgaXQgd2Fz
IGluY29ycmVjdGx5IHJldmVydGVkCndoZW4gYWRkaW5nIHRoZSBEQ04yIEhXIHNlcXVlbmNlciBj
b2RlLgoKRml4ZXM6IDU0ZmYzNTkxNTk0OCAoImRybS9hbWQvZGlzcGxheTogQWRkIERDTjIgSFcg
U2VxdWVuY2VyIGFuZCBSZXNvdXJjZSIpCgpDYzogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRs
YW5kQGFtZC5jb20+CkNjOiBSb21hbiBMaSA8cm9tYW4ubGlAYW1kLmNvbT4KQ2M6IExlbyBMaSA8
c3VucGVuZy5saUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxu
aWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjZTExMC9kY2UxMTBfaHdfc2VxdWVuY2VyLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjZTExMC9kY2UxMTBfaHdfc2VxdWVuY2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF9od19zZXF1ZW5jZXIuYwppbmRleCA5NDBlNzRiN2Qy
YzYuLmI0YjhkZWQxNmUyMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjZTExMC9kY2UxMTBfaHdfc2VxdWVuY2VyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjZTExMC9kY2UxMTBfaHdfc2VxdWVuY2VyLmMKQEAgLTY2Niw2ICs2NjYs
NyBAQCB2b2lkIGRjZTExMF9lbmFibGVfc3RyZWFtKHN0cnVjdCBwaXBlX2N0eCAqcGlwZV9jdHgp
CiAKIAkvKiB1cGRhdGUgQVZJIGluZm8gZnJhbWUgKEhETUksIERQKSovCiAJLyogVE9ETzogRlBH
QSBtYXkgY2hhbmdlIHRvIGh3c3MudXBkYXRlX2luZm9fZnJhbWUgKi8KKwlkY2UxMTBfdXBkYXRl
X2luZm9fZnJhbWUocGlwZV9jdHgpOwogCiAjaWYgZGVmaW5lZChDT05GSUdfRFJNX0FNRF9EQ19E
Q04yXzApCiAJaWYgKHBpcGVfY3R4LT5zdHJlYW1fcmVzLnN0cmVhbV9lbmMtPmZ1bmNzLT5zZXRf
ZHluYW1pY19tZXRhZGF0YSAhPSBOVUxMICYmCkBAIC02ODYsNiArNjg3LDcgQEAgdm9pZCBkY2Ux
MTBfZW5hYmxlX3N0cmVhbShzdHJ1Y3QgcGlwZV9jdHggKnBpcGVfY3R4KQogCQkJCQkJCWRtZGF0
YV9kcCA6IGRtZGF0YV9oZG1pKTsKIAl9CiAjZW5kaWYKKwlkY2UxMTBfdXBkYXRlX2luZm9fZnJh
bWUocGlwZV9jdHgpOwogCiAJLyogZW5hYmxlIGVhcmx5IGNvbnRyb2wgdG8gYXZvaWQgY29ycnVw
dGlvbiBvbiBEUCBtb25pdG9yKi8KIAlhY3RpdmVfdG90YWxfd2l0aF9ib3JkZXJzID0KLS0gCjIu
MTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
