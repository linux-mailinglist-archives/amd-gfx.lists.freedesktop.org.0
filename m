Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7666A9682E
	for <lists+amd-gfx@lfdr.de>; Tue, 20 Aug 2019 19:59:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF21289FC9;
	Tue, 20 Aug 2019 17:59:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730081.outbound.protection.outlook.com [40.107.73.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2A989FC9
 for <amd-gfx@lists.freedesktop.org>; Tue, 20 Aug 2019 17:59:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cHBQgXVm/bXHLVas1P0Zs0dY+C81XlT5u+cFnckjItEvDLxd/LvROPtULW4mYBrP+ueqqVV+5AoqzOARnIQx3EemcL3i6i5wxhRISXaADIfxUqU7omxsfdC3RuMk5uKWpXLe0fi+kK9I4N/JzQS7NabVQMr9fa+NOXsjo0c4sXmfWaLxh9u8Xp2RqflPoWtfQ8RLndyz2hnE0GFKPKujIcIKADx6MXjRmU1ufsvyFdyKMhlnYhZof+cw+ISmUzkL8wlLrEUcl9URPmJQCf05k0uEPyTwI9ur9hhP4iQljYo38H8at5XwCBKalkmAmjoXW03qX6sBYOg2tS5FWl7B0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhrXu65+NwFVhE4Bzf6E73l+KGKLs3Fn7hObwTp+I3c=;
 b=cZ65+LBSNNiDPStseonYBXSUmpopRKu1PJTr390qmb2wNZrVy/eINQji4muMXYHG3o/awmkQ52KiSrtUg2+8JID+de89jOhvlnJMi984FDOQINQFvjRcKSae6ocroaR0ooOVMCW5PIckyVrcKzzi8I6igDakwDirD8RczqGJB6ngWjFrzDI/DvMaNmlEYqDyQ3l/o2b7gvbA+4rP8HzRdnf7ZzlZD+4LrCftmf8rxLuzfpf+HuSJSQnsTqZmmhTjMJYboUmTxPIfoc1cCtE0MThk+lbVMer8fSKsQvY5CyZu/cbhoCDTB3AqBe7DTNbTP+KZP9KJCjhoK81iIzcdvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR1201CA0022.namprd12.prod.outlook.com
 (2603:10b6:910:16::32) by SN6PR12MB2718.namprd12.prod.outlook.com
 (2603:10b6:805:70::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Tue, 20 Aug
 2019 17:59:43 +0000
Received: from DM3NAM03FT061.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::209) by CY4PR1201CA0022.outlook.office365.com
 (2603:10b6:910:16::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Tue, 20 Aug 2019 17:59:43 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT061.mail.protection.outlook.com (10.152.83.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Tue, 20 Aug 2019 17:59:43 +0000
Received: from kazbox.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 20 Aug 2019
 12:59:41 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 4/4] drm/amd/display: Lock the CRTC when setting CRC source
Date: Tue, 20 Aug 2019 13:59:32 -0400
Message-ID: <20190820175932.7884-4-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820175932.7884-1-nicholas.kazlauskas@amd.com>
References: <20190820175932.7884-1-nicholas.kazlauskas@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(376002)(396003)(2980300002)(428003)(199004)(189003)(478600001)(2351001)(86362001)(76176011)(53936002)(44832011)(2906002)(4326008)(81156014)(26005)(186003)(305945005)(53416004)(426003)(47776003)(476003)(486006)(36756003)(446003)(11346002)(126002)(6916009)(8936002)(336012)(356004)(316002)(2616005)(6666004)(50466002)(70586007)(16586007)(8676002)(14444005)(50226002)(70206006)(1076003)(5660300002)(7696005)(48376002)(51416003)(54906003)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2718; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e03d930b-24b4-41d1-906f-08d725982e24
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:SN6PR12MB2718; 
X-MS-TrafficTypeDiagnostic: SN6PR12MB2718:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2718ED6BB9EB6A46FB260E9DECAB0@SN6PR12MB2718.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-Forefront-PRVS: 013568035E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: VHE96OHNBQOLbAk5+j7KNMVgpi4+4GY96YY3PWdlJS5YOQGxnOIqF9V7dueUON4dYEbmk4dPHfGpX3gVyavz0mtFnQHq1dgVAKqD/4K1uXUTW2tkiX61fukbSqigvpgvJPu8k9BL2RGSR3vkaW7/z9BM90+Nk3NzimpztptlfdOGxhq6A4IRiWGS4ktuvPFgCKtSi2HL268mRW2Ki3W7v2aev9WCWJ6fy1Bx0jAIIg0MhbMe9YV2uiumJcXHRnQBrnsWpfkD6lfF6qVYFXuqq/aTc3LyQBLVIsdI+vhxeLDBgVtM8gPCFfgyNo0nf17XiWE22Ts9GTCCI7iJDFh4cSaZQGm7OR3ELB1MdvG8bQpdlmdVozQrnYii/F/oA/cZyPmAa5h41IPbEFkM+r2ltF1aA4zQjinCuGtq5ZPa830=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2019 17:59:43.4288 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e03d930b-24b4-41d1-906f-08d725982e24
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2718
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhrXu65+NwFVhE4Bzf6E73l+KGKLs3Fn7hObwTp+I3c=;
 b=R65AmG22z3dfd1HUR43UK5YDeOxkKqMpdBeb+IjYFfWVVWmxlwV+dbZf1U+XdtXzG+dcryo0hnKVkx4jvsXkJ2uqelIrfzlKvjprDddDOFD56izRcfI7yu6I8omWJkEXvJaGFb62Jk033ZNV7NKa3Btg7D08V6qmFlWR1bT+4mU=
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
Cc: Leo Li <sunpeng.li@amd.com>, David Francis <David.Francis@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KV2UgbmVlZCB0byBlbnN1cmUgdGhhdCB3ZSdyZSBob2xkaW5nIHRoZSBsb2NrIG9uIHRo
ZSBDUlRDIHdoZW4gc2V0dGluZwp0aGUgQ1JDIHNvdXJjZSBzaW5jZSB3ZSdyZSBtb2RpZnlpbmcg
dGhlIENSVEMgc3RhdGUgZGlyZWN0bHkuCgpXZSBhbHNvIG5lZWQgdG8gd2FpdCBmb3IgYW55IG91
dHN0YW5kaW5nIG5vbi1ibG9ja2luZyBjb21taXRzIHRvIGZpbmlzaApzbyB0aGV5IGFyZW4ndCBy
ZWFkaW5nIHN0YXRlIHRoYXQncyBwb3RlbnRpYWxseSBiZWluZyBtb2RpZmllZCAtCm5vbi1ibG9j
a2luZyBjb21taXRzIGRvbid0IGhvbGQgdGhlIENSVEMgbG9jayB3aGlsZSBkb2luZyBjb21taXQg
dGFpbAp3b3JrLgoKW0hvd10KTG9jayB0aGUgQ1JUQyB1c2luZyBpdHMgbXV0ZXguIFdoaWxlIGhv
bGRpbmcgdGhlIGxvY2sgY2hlY2sgaWYgdGhlcmUncwphbnkgY29tbWl0IGFjdGl2ZSBvbiB0aGUg
Q1JUQyAtIGlmIHRoZXJlIGlzLCBpdCdzIG5vbi1ibG9ja2luZyBhbmQKd2Ugc2hvdWxkIHdhaXQg
dW50aWwgaXQncyBmaW5pc2hlZCBieSB3YWl0aW5nIGZvciBod19kb25lIHRvIGJlCnNpZ25hbGVk
IHNpbmNlIHRoYXQncyB0aGUgbGFzdCBwb2ludCB3aGVyZSB3ZSB0b3VjaCBDUlRDIHN0YXRlLgoK
Q2M6IERhdmlkIEZyYW5jaXMgPERhdmlkLkZyYW5jaXNAYW1kLmNvbT4KQ2M6IEJoYXdhbnByZWV0
IExha2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgpDYzogTGVvIExpIDxzdW5wZW5nLmxp
QGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IE5pY2hvbGFzIEthemxhdXNrYXMgPG5pY2hvbGFzLmth
emxhdXNrYXNAYW1kLmNvbT4KLS0tCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG1fY3JjLmMgfCA2MyArKysrKysrKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNTEg
aW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fY3JjLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9jcmMuYwppbmRleCBlOWQ1YjFmYWQ2
MjUuLmZhODZiOWU3MDZhZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG1fY3JjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fY3JjLmMKQEAgLTEzNSwxMyArMTM1LDEzIEBAIGludCBh
bWRncHVfZG1fY3J0Y19jb25maWd1cmVfY3JjX3NvdXJjZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMs
CiAKIGludCBhbWRncHVfZG1fY3J0Y19zZXRfY3JjX3NvdXJjZShzdHJ1Y3QgZHJtX2NydGMgKmNy
dGMsIGNvbnN0IGNoYXIgKnNyY19uYW1lKQogewotCXN0cnVjdCBkbV9jcnRjX3N0YXRlICpjcnRj
X3N0YXRlID0gdG9fZG1fY3J0Y19zdGF0ZShjcnRjLT5zdGF0ZSk7CisJZW51bSBhbWRncHVfZG1f
cGlwZV9jcmNfc291cmNlIHNvdXJjZSA9IGRtX3BhcnNlX2NyY19zb3VyY2Uoc3JjX25hbWUpOwor
CXN0cnVjdCBkcm1fY3J0Y19jb21taXQgKmNvbW1pdDsKKwlzdHJ1Y3QgZG1fY3J0Y19zdGF0ZSAq
Y3J0Y19zdGF0ZTsKIAlzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4ID0gTlVMTDsKIAlib29sIGVuYWJs
ZSA9IGZhbHNlOwogCWJvb2wgZW5hYmxlZCA9IGZhbHNlOwotCWludCByZXQ7Ci0KLQllbnVtIGFt
ZGdwdV9kbV9waXBlX2NyY19zb3VyY2Ugc291cmNlID0gZG1fcGFyc2VfY3JjX3NvdXJjZShzcmNf
bmFtZSk7CisJaW50IHJldCA9IDA7CiAKIAlpZiAoc291cmNlIDwgMCkgewogCQlEUk1fREVCVUdf
RFJJVkVSKCJVbmtub3duIENSQyBzb3VyY2UgJXMgZm9yIENSVEMlZFxuIiwKQEAgLTE0OSw3ICsx
NDksMzMgQEAgaW50IGFtZGdwdV9kbV9jcnRjX3NldF9jcmNfc291cmNlKHN0cnVjdCBkcm1fY3J0
YyAqY3J0YywgY29uc3QgY2hhciAqc3JjX25hbWUpCiAJCXJldHVybiAtRUlOVkFMOwogCX0KIAor
CXJldCA9IGRybV9tb2Rlc2V0X2xvY2soJmNydGMtPm11dGV4LCBOVUxMKTsKKwlpZiAocmV0KQor
CQlyZXR1cm4gcmV0OworCisJc3Bpbl9sb2NrKCZjcnRjLT5jb21taXRfbG9jayk7CisJY29tbWl0
ID0gbGlzdF9maXJzdF9lbnRyeV9vcl9udWxsKCZjcnRjLT5jb21taXRfbGlzdCwKKwkJCQkJICBz
dHJ1Y3QgZHJtX2NydGNfY29tbWl0LCBjb21taXRfZW50cnkpOworCWlmIChjb21taXQpCisJCWRy
bV9jcnRjX2NvbW1pdF9nZXQoY29tbWl0KTsKKwlzcGluX3VubG9jaygmY3J0Yy0+Y29tbWl0X2xv
Y2spOworCisJaWYgKGNvbW1pdCkgeworCQkvKgorCQkgKiBOZWVkIHRvIHdhaXQgZm9yIGFsbCBv
dXRzdGFuZGluZyBwcm9ncmFtbWluZyB0byBjb21wbGV0ZQorCQkgKiBpbiBjb21taXQgdGFpbCBz
aW5jZSBpdCBjYW4gbW9kaWZ5IENSQyByZWxhdGVkIGZpZWxkcyBhbmQKKwkJICogaGFyZHdhcmUg
c3RhdGUuIFNpbmNlIHdlJ3JlIGhvbGRpbmcgdGhlIENSVEMgbG9jayB3ZSdyZQorCQkgKiBndWFy
YW50ZWVkIHRoYXQgbm8gb3RoZXIgY29tbWl0IHdvcmsgY2FuIGJlIHF1ZXVlZCBvZmYKKwkJICog
YmVmb3JlIHdlIG1vZGlmeSB0aGUgc3RhdGUgYmVsb3cuCisJCSAqLworCQlyZXQgPSB3YWl0X2Zv
cl9jb21wbGV0aW9uX2ludGVycnVwdGlibGVfdGltZW91dCgKKwkJCSZjb21taXQtPmh3X2RvbmUs
IDEwICogSFopOworCQlpZiAocmV0KQorCQkJZ290byBjbGVhbnVwOworCX0KKwogCWVuYWJsZSA9
IGFtZGdwdV9kbV9pc192YWxpZF9jcmNfc291cmNlKHNvdXJjZSk7CisgCWNydGNfc3RhdGUgPSB0
b19kbV9jcnRjX3N0YXRlKGNydGMtPnN0YXRlKTsKIAogCS8qCiAJICogVVNFUiBSRVEgU1JDIHwg
Q1VSUkVOVCBTUkMgfCBCRUhBVklPUgpAQCAtMTgzLDE5ICsyMDksMjMgQEAgaW50IGFtZGdwdV9k
bV9jcnRjX3NldF9jcmNfc291cmNlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywgY29uc3QgY2hhciAq
c3JjX25hbWUpCiAKIAkJaWYgKCFhY29ubikgewogCQkJRFJNX0RFQlVHX0RSSVZFUigiTm8gYW1k
IGNvbm5lY3RvciBtYXRjaGluZyBDUlRDLSVkXG4iLCBjcnRjLT5pbmRleCk7Ci0JCQlyZXR1cm4g
LUVJTlZBTDsKKwkJCXJldCA9IC1FSU5WQUw7CisJCQlnb3RvIGNsZWFudXA7CiAJCX0KIAogCQlh
dXggPSAmYWNvbm4tPmRtX2RwX2F1eC5hdXg7CiAKIAkJaWYgKCFhdXgpIHsKIAkJCURSTV9ERUJV
R19EUklWRVIoIk5vIGRwIGF1eCBmb3IgYW1kIGNvbm5lY3RvclxuIik7Ci0JCQlyZXR1cm4gLUVJ
TlZBTDsKKwkJCXJldCA9IC1FSU5WQUw7CisJCQlnb3RvIGNsZWFudXA7CiAJCX0KIAl9CiAKLQlp
ZiAoYW1kZ3B1X2RtX2NydGNfY29uZmlndXJlX2NyY19zb3VyY2UoY3J0YywgY3J0Y19zdGF0ZSwg
c291cmNlKSkKLQkJcmV0dXJuIC1FSU5WQUw7CisJaWYgKGFtZGdwdV9kbV9jcnRjX2NvbmZpZ3Vy
ZV9jcmNfc291cmNlKGNydGMsIGNydGNfc3RhdGUsIHNvdXJjZSkpIHsKKwkJcmV0ID0gLUVJTlZB
TDsKKwkJZ290byBjbGVhbnVwOworCX0KIAogCS8qCiAJICogUmVhZGluZyB0aGUgQ1JDIHJlcXVp
cmVzIHRoZSB2YmxhbmsgaW50ZXJydXB0IGhhbmRsZXIgdG8gYmUKQEAgLTIwNSwxMiArMjM1LDEz
IEBAIGludCBhbWRncHVfZG1fY3J0Y19zZXRfY3JjX3NvdXJjZShzdHJ1Y3QgZHJtX2NydGMgKmNy
dGMsIGNvbnN0IGNoYXIgKnNyY19uYW1lKQogCWlmICghZW5hYmxlZCAmJiBlbmFibGUpIHsKIAkJ
cmV0ID0gZHJtX2NydGNfdmJsYW5rX2dldChjcnRjKTsKIAkJaWYgKHJldCkKLQkJCXJldHVybiBy
ZXQ7CisJCQlnb3RvIGNsZWFudXA7CiAKIAkJaWYgKGRtX2lzX2NyY19zb3VyY2VfZHByeChzb3Vy
Y2UpKSB7CiAJCQlpZiAoZHJtX2RwX3N0YXJ0X2NyYyhhdXgsIGNydGMpKSB7CiAJCQkJRFJNX0RF
QlVHX0RSSVZFUigiZHAgc3RhcnQgY3JjIGZhaWxlZFxuIik7Ci0JCQkJcmV0dXJuIC1FSU5WQUw7
CisJCQkJcmV0ID0gLUVJTlZBTDsKKwkJCQlnb3RvIGNsZWFudXA7CiAJCQl9CiAJCX0KIAl9IGVs
c2UgaWYgKGVuYWJsZWQgJiYgIWVuYWJsZSkgewpAQCAtMjE4LDcgKzI0OSw4IEBAIGludCBhbWRn
cHVfZG1fY3J0Y19zZXRfY3JjX3NvdXJjZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIGNvbnN0IGNo
YXIgKnNyY19uYW1lKQogCQlpZiAoZG1faXNfY3JjX3NvdXJjZV9kcHJ4KHNvdXJjZSkpIHsKIAkJ
CWlmIChkcm1fZHBfc3RvcF9jcmMoYXV4KSkgewogCQkJCURSTV9ERUJVR19EUklWRVIoImRwIHN0
b3AgY3JjIGZhaWxlZFxuIik7Ci0JCQkJcmV0dXJuIC1FSU5WQUw7CisJCQkJcmV0ID0gLUVJTlZB
TDsKKwkJCQlnb3RvIGNsZWFudXA7CiAJCQl9CiAJCX0KIAl9CkBAIC0yMjcsNyArMjU5LDE0IEBA
IGludCBhbWRncHVfZG1fY3J0Y19zZXRfY3JjX3NvdXJjZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMs
IGNvbnN0IGNoYXIgKnNyY19uYW1lKQogCiAJLyogUmVzZXQgY3JjX3NraXBwZWQgb24gZG0gc3Rh
dGUgKi8KIAljcnRjX3N0YXRlLT5jcmNfc2tpcF9jb3VudCA9IDA7Ci0JcmV0dXJuIDA7CisKK2Ns
ZWFudXA6CisJaWYgKGNvbW1pdCkKKwkJZHJtX2NydGNfY29tbWl0X3B1dChjb21taXQpOworCisJ
ZHJtX21vZGVzZXRfdW5sb2NrKCZjcnRjLT5tdXRleCk7CisKKwlyZXR1cm4gcmV0OwogfQogCiAv
KioKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
