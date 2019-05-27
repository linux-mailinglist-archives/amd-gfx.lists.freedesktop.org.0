Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FE12BAE5
	for <lists+amd-gfx@lfdr.de>; Mon, 27 May 2019 21:52:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6181589AB2;
	Mon, 27 May 2019 19:52:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::61b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6231389AB2
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2019 19:52:12 +0000 (UTC)
Received: from DM3PR12CA0110.namprd12.prod.outlook.com (2603:10b6:0:55::30) by
 BN6PR1201MB0051.namprd12.prod.outlook.com (2603:10b6:405:54::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1922.16; Mon, 27 May
 2019 19:52:10 +0000
Received: from CO1NAM03FT006.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::203) by DM3PR12CA0110.outlook.office365.com
 (2603:10b6:0:55::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.15 via Frontend
 Transport; Mon, 27 May 2019 19:52:10 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT006.mail.protection.outlook.com (10.152.80.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Mon, 27 May 2019 19:52:09 +0000
Received: from leodev.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 27 May 2019
 14:51:57 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 14/26] drm/amd/display: fix calculation of
 total_data_read_bandwidth
Date: Mon, 27 May 2019 15:50:53 -0400
Message-ID: <1558986665-12964-15-git-send-email-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558986665-12964-1-git-send-email-sunpeng.li@amd.com>
References: <1558986665-12964-1-git-send-email-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(376002)(396003)(39860400002)(136003)(2980300002)(428003)(199004)(189003)(2351001)(48376002)(50466002)(86152003)(2616005)(14444005)(126002)(446003)(11346002)(4326008)(76176011)(486006)(336012)(47776003)(51416003)(7696005)(476003)(77096007)(426003)(26005)(50226002)(53416004)(68736007)(8676002)(305945005)(70586007)(81156014)(81166006)(70206006)(6916009)(186003)(53936002)(8936002)(36756003)(86362001)(72206003)(2906002)(5660300002)(2876002)(478600001)(316002)(16586007)(6666004)(356004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0051; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a76bc87-fc8a-40b9-d6da-08d6e2dcce4b
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR1201MB0051; 
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0051:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0051CEF9C26676DFC6D3B3B3821D0@BN6PR1201MB0051.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 0050CEFE70
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: /3fbleOoAY1/DvKcUT+lODRmPwDQYd6AsbRUL/GOqOCIQJQCbocltoerYTInIVPQ+Tc6EMfyQ+oG8ZRrNIjMiwpU5YEppDh+mu1i0lV5rYJRnhB/J4ekPZd2UbiRkQCDUeH2tnEySv+8Jtna+2rlSvr4AS3bV75KUMws85bkt2ou5yvaxPyS9gc5BNIQeIEQUy9qFCU0hmFlrZel5s6iUeqrjLUJaCZKTW7sfnbRSRTsTKPCFWLEE1pbZXwmfJGmkvxScNCMtrAt6WNMw6ystPIRfEfi1xONWoKnVfx31HFXLXeKmwh0CbK9ZFnyDFobwJeYK8pQJuMhvT+vrzpjm1g7Xvn+qZT68kVxbabtImKUFr/5bZc0+9I/nM1egezkvatE6d/m4tiqATjWuBH9REinkZVmDDlPg/F6NR7vAm8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2019 19:52:09.9166 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a76bc87-fc8a-40b9-d6da-08d6e2dcce4b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0051
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWI/cx2v0/OwVIRIqyjer4Nd0alTGzFlB5iw6dmEgaQ=;
 b=R0cO28hJNc3ldsBUzjW7dv25ZimxQbcKv2UKugBuj28ZydqGvJ3qwPZipyeeko6rKFKJSnkw41IdqOcwf2EiEgG1CZ5+i6KhGR1hR1Tl5nvru++Sweizm65+u9xLoj5F2MG4DspvXShm7HlQiV+verlcDE8jxGd1yIcVJVwIXvU=
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
Cc: Su Sung Chung <Su.Chung@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogU3UgU3VuZyBDaHVuZyA8U3UuQ2h1bmdAYW1kLmNvbT4KClt3aHldCmJ5IGFkZGluZyBm
YXN0X3ZhbGlkYXRlIGZsYWcsIHdlIGFyZSBza2lwcGluZyBzb21lIHBvcnRpb24gb2YKZGNuX3Zh
bGlkYXRlX2JhbmR3aWR0aCBjb2RlIHRoYXQgaXMgbm90IG5lY2Vzc2FyeSBmb3IgbW9kZSB2YWxp
ZGF0aW9uLgpIb3dldmVyIHdlIGhhdmUgYSBidWcgd2hlcmUgaXQgZG9lcyBub3QgY2FsY3VsYXRl
CnYtPnRvdGFsX2RhdGFfcmVhZF9iYW5kd2lkdGgsIHdoaWNoIGlzIG9uZSBvZiB0aGUgZmFjdG9y
cyBkZXRlcm1pbmVzIHRoZQpyZXN1bHQgb2YgdGhlIHZhbGlkYXRpb24sIGFuZCB0aGVyZWZvcmUg
cmVwb3J0IGZhbHNlIHBvc2l0aXZlIGR1cmluZwptb2RlIHZhbGlkYXRpb24uCgpbaG93XQphZGQg
Y2FsY3VsYXRpb24gb2Ygdi0+dG90YWxfZGF0YV9yZWFkX2JhbmR3aWR0aCBvdXRzaWRlIG9mIHRo
ZSByZWdpb24KdGhhdCBpcyBndWFyZGVkIGJ5IGZhc3RfdmFsaWRhdGUgZmxhZwoKU2lnbmVkLW9m
Zi1ieTogU3UgU3VuZyBDaHVuZyA8U3UuQ2h1bmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IERteXRy
byBMYWt0eXVzaGtpbiA8RG15dHJvLkxha3R5dXNoa2luQGFtZC5jb20+CkFja2VkLWJ5OiBMZW8g
TGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY2FsY3MvZGNuX2NhbGNzLmMgfCAzOSArKysrKysrKysrKysrKysrKysrKysrKy0KIDEgZmls
ZSBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NhbGNzL2Rjbl9jYWxjcy5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NhbGNzL2Rjbl9jYWxjcy5jCmluZGV4IGQ1MzMwNmQu
LjBhMzM2YzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jYWxj
cy9kY25fY2FsY3MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2FsY3Mv
ZGNuX2NhbGNzLmMKQEAgLTcxMSw3ICs3MTEsNyBAQCBib29sIGRjbl92YWxpZGF0ZV9iYW5kd2lk
dGgoCiAKIAljb25zdCBzdHJ1Y3QgcmVzb3VyY2VfcG9vbCAqcG9vbCA9IGRjLT5yZXNfcG9vbDsK
IAlzdHJ1Y3QgZGNuX2J3X2ludGVybmFsX3ZhcnMgKnYgPSAmY29udGV4dC0+ZGNuX2J3X3ZhcnM7
Ci0JaW50IGksIGlucHV0X2lkeDsKKwlpbnQgaSwgaW5wdXRfaWR4LCBrOwogCWludCB2ZXNhX3N5
bmNfc3RhcnQsIGFzaWNfYmxhbmtfZW5kLCBhc2ljX2JsYW5rX3N0YXJ0OwogCWJvb2wgYndfbGlt
aXRfcGFzczsKIAlmbG9hdCBid19saW1pdDsKQEAgLTEwMjIsNiArMTAyMiw0MyBAQCBib29sIGRj
bl92YWxpZGF0ZV9iYW5kd2lkdGgoCiAJCW1vZGVfc3VwcG9ydF9hbmRfc3lzdGVtX2NvbmZpZ3Vy
YXRpb24odik7CiAJfQogCisJZGlzcGxheV9waXBlX2NvbmZpZ3VyYXRpb24odik7CisKKwlmb3Ig
KGsgPSAwOyBrIDw9IHYtPm51bWJlcl9vZl9hY3RpdmVfcGxhbmVzIC0gMTsgaysrKSB7CisJCWlm
ICh2LT5zb3VyY2Vfc2NhbltrXSA9PSBkY25fYndfaG9yKQorCQkJdi0+c3dhdGhfd2lkdGhfeVtr
XSA9IHYtPnZpZXdwb3J0X3dpZHRoW2tdIC8gdi0+ZHBwX3Blcl9wbGFuZVtrXTsKKwkJZWxzZQor
CQkJdi0+c3dhdGhfd2lkdGhfeVtrXSA9IHYtPnZpZXdwb3J0X2hlaWdodFtrXSAvIHYtPmRwcF9w
ZXJfcGxhbmVba107CisJfQorCWZvciAoayA9IDA7IGsgPD0gdi0+bnVtYmVyX29mX2FjdGl2ZV9w
bGFuZXMgLSAxOyBrKyspIHsKKwkJaWYgKHYtPnNvdXJjZV9waXhlbF9mb3JtYXRba10gPT0gZGNu
X2J3X3JnYl9zdWJfNjQpIHsKKwkJCXYtPmJ5dGVfcGVyX3BpeGVsX2RldHlba10gPSA4LjA7CisJ
CQl2LT5ieXRlX3Blcl9waXhlbF9kZXRjW2tdID0gMC4wOworCQl9IGVsc2UgaWYgKHYtPnNvdXJj
ZV9waXhlbF9mb3JtYXRba10gPT0gZGNuX2J3X3JnYl9zdWJfMzIpIHsKKwkJCXYtPmJ5dGVfcGVy
X3BpeGVsX2RldHlba10gPSA0LjA7CisJCQl2LT5ieXRlX3Blcl9waXhlbF9kZXRjW2tdID0gMC4w
OworCQl9IGVsc2UgaWYgKHYtPnNvdXJjZV9waXhlbF9mb3JtYXRba10gPT0gZGNuX2J3X3JnYl9z
dWJfMTYpIHsKKwkJCXYtPmJ5dGVfcGVyX3BpeGVsX2RldHlba10gPSAyLjA7CisJCQl2LT5ieXRl
X3Blcl9waXhlbF9kZXRjW2tdID0gMC4wOworCQl9IGVsc2UgaWYgKHYtPnNvdXJjZV9waXhlbF9m
b3JtYXRba10gPT0gZGNuX2J3X3l1djQyMF9zdWJfOCkgeworCQkJdi0+Ynl0ZV9wZXJfcGl4ZWxf
ZGV0eVtrXSA9IDEuMDsKKwkJCXYtPmJ5dGVfcGVyX3BpeGVsX2RldGNba10gPSAyLjA7CisJCX0g
ZWxzZSB7CisJCQl2LT5ieXRlX3Blcl9waXhlbF9kZXR5W2tdID0gNC4wZiAvIDMuMGY7CisJCQl2
LT5ieXRlX3Blcl9waXhlbF9kZXRjW2tdID0gOC4wZiAvIDMuMGY7CisJCX0KKwl9CisKKwl2LT50
b3RhbF9kYXRhX3JlYWRfYmFuZHdpZHRoID0gMC4wOworCWZvciAoayA9IDA7IGsgPD0gdi0+bnVt
YmVyX29mX2FjdGl2ZV9wbGFuZXMgLSAxOyBrKyspIHsKKwkJdi0+cmVhZF9iYW5kd2lkdGhfcGxh
bmVfbHVtYVtrXSA9IHYtPnN3YXRoX3dpZHRoX3lba10gKiB2LT5kcHBfcGVyX3BsYW5lW2tdICoK
KwkJCQlkY25fYndfY2VpbDIodi0+Ynl0ZV9wZXJfcGl4ZWxfZGV0eVtrXSwgMS4wKSAvICh2LT5o
dG90YWxba10gLyB2LT5waXhlbF9jbG9ja1trXSkgKiB2LT52X3JhdGlvW2tdOworCQl2LT5yZWFk
X2JhbmR3aWR0aF9wbGFuZV9jaHJvbWFba10gPSB2LT5zd2F0aF93aWR0aF95W2tdIC8gMi4wICog
di0+ZHBwX3Blcl9wbGFuZVtrXSAqCisJCQkJZGNuX2J3X2NlaWwyKHYtPmJ5dGVfcGVyX3BpeGVs
X2RldGNba10sIDIuMCkgLyAodi0+aHRvdGFsW2tdIC8gdi0+cGl4ZWxfY2xvY2tba10pICogdi0+
dl9yYXRpb1trXSAvIDIuMDsKKwkJdi0+dG90YWxfZGF0YV9yZWFkX2JhbmR3aWR0aCA9IHYtPnRv
dGFsX2RhdGFfcmVhZF9iYW5kd2lkdGggKworCQkJCXYtPnJlYWRfYmFuZHdpZHRoX3BsYW5lX2x1
bWFba10gKyB2LT5yZWFkX2JhbmR3aWR0aF9wbGFuZV9jaHJvbWFba107CisJfQorCiAJQldfVkFM
X1RSQUNFX0VORF9WT0xUQUdFX0xFVkVMKCk7CiAKIAlpZiAodi0+dm9sdGFnZV9sZXZlbCAhPSBu
dW1iZXJfb2Zfc3RhdGVzX3BsdXNfb25lICYmICFmYXN0X3ZhbGlkYXRlKSB7Ci0tIAoyLjcuNAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
