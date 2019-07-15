Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E59A969D9F
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE65C89BEC;
	Mon, 15 Jul 2019 21:21:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam05on0604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe50::604])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397E589BC2
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eaq5n7dgtprW2xlnfpqucQzZeVZ6uAIfxFWEFvdhHmqISdzzFBnhZxLY9oHqtXNGjHU5Ri57GA4aRdhd/tSdpva0VoWd00+r3pG3rqY4AsC4xRKsvXudP6Q5oqL5ICOXclbmrEZUcn7DukzQjiHV0ELywJbEzN5BOgWcEDhei034IWfcujqoJsNk8gGQ5QsLmuSZ9OxSEWHowiGr24Mwp6JRxLHCmrSbad2IUFJMgLxp+Ppv6vjmyX6W9385VFDn42jR4QYioOrS3BXnRDyEwPb+oid36I6c973rdj37xWJg2i7ickIBWzX7raVcO0Hu9lngaHi5CZqgQN1tt0wSDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5gb978d77C+yx02HfSKO8R/tfqgEShKSfMvAXI4Z90=;
 b=imoXNcc0+0rFDB8TNnRL6E3e884dJKQVBPxVT7BjL+x3rs/VpE0O/x80QKCsQBXDoIptzXg/Xma7EI1yhgQLvuqbwFgW8TWzW1lfKmY70kcjZ1zA2yd6BDwa0BdCV4StN2iviCTJU93eB+DuTzngrNSx5GWsd4u5IjYubCbV0dCQso/xON+ngdEExeIrCHjDabGtfIgCgWF1tUnvVRCYPWit4g935INZr9pdiauaiZJ1iz050KZhAnYIzvvkM548mhRvAl3sDIjKWA6WfVdVxsxuABqt9kNRD5medzSaWJBLC0riS00tQ2WhgfVrsZJuXsOv2qAKFyhwR5ObMUuZmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR12CA0042.namprd12.prod.outlook.com (2603:10b6:301:2::28)
 by BY5PR12MB3923.namprd12.prod.outlook.com (2603:10b6:a03:194::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.10; Mon, 15 Jul
 2019 21:21:19 +0000
Received: from CO1NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by MWHPR12CA0042.outlook.office365.com
 (2603:10b6:301:2::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.10 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:19 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT009.mail.protection.outlook.com (10.152.80.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:19 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:07 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 13/87] drm/amd/display: Set default block_size,
 even in unexpected cases
Date: Mon, 15 Jul 2019 17:19:35 -0400
Message-ID: <20190715212049.4584-14-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(39860400002)(396003)(2980300002)(428003)(189003)(199004)(81156014)(81166006)(1076003)(50226002)(14444005)(478600001)(8936002)(6916009)(486006)(86362001)(70206006)(49486002)(2616005)(476003)(53936002)(426003)(336012)(356004)(6666004)(126002)(68736007)(316002)(305945005)(76176011)(36756003)(2906002)(47776003)(50466002)(4326008)(2351001)(51416003)(48376002)(11346002)(5660300002)(446003)(26005)(8676002)(54906003)(70586007)(2876002)(186003)(2870700001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB3923; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e01b65c6-4c99-4a12-fb14-08d7096a60f2
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BY5PR12MB3923; 
X-MS-TrafficTypeDiagnostic: BY5PR12MB3923:
X-Microsoft-Antispam-PRVS: <BY5PR12MB3923A9DA78236AF6D759869082CF0@BY5PR12MB3923.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: C8Mt60xmes1+jbAn/AYWFdXlh0af1KoNF++mMHj5reFMrw3anysqT6eTQlQlWKjcqRNLpAKuB8hex/Mk8uHAY4T2c6KvHLwjtf5vo9GaKkpezPCNOI0TevB4XuBpMkK59lYLxuAzDnmQKgmiY59kL3uxLtWUbKaxyHlaeEMNqjlUe5UytvWD3TE2jw1eRBmT9k6JDlKkZsRn6WnW4BmxeSDcz0aLVV4q34D4v3vfUj64YvyQYLaV2ikFHt8xNvsmnk5FPiOM5CGUpqLpRaCMvm9L7E9R66u3N35YHX/Jlde5E+IgLP2JAbvtMhJ0FUUbns51Y893eMoCMXM8cwA796KzhV8E0BM9LNE8O5bT5+eNcpa7ix3elOwzayMcdJfD8B9OBKaFzGx8dEx5eFfiSAfaKrQSFGTzOPhK/DFW6qc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:19.1993 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e01b65c6-4c99-4a12-fb14-08d7096a60f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3923
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5gb978d77C+yx02HfSKO8R/tfqgEShKSfMvAXI4Z90=;
 b=UrmKAs+tVVYhHnLbWvvAa78pv7Z2uDLwxObG1CPSonApEJSJ89wkmOvZ5k7CpwAZeP68ZTqDBiSDUPc23x1CQYY30uAtN+HQFEafzVzekq7WcQhXCA1iVwMKoOwn9LNP2XZiCEpW2VjUmX2kGWb4n0+8+AsKgnHv5Yto1VknMCY=
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
Cc: Leo Li <sunpeng.li@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Eric Bernstein <Eric.Bernstein@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KCldl
J3JlIG5vdCBleHBlY3RlZCB0byBlbnRlciB0aGUgZGVmYXVsdCBjYXNlLCBidXQgbm90IHJldHVy
bmluZyBhCmRlZmF1bHQgdmFsdWUgaGVyZSBpcyBpbmNvcnJlY3QuCgpTaWduZWQtb2ZmLWJ5OiBE
bXl0cm8gTGFrdHl1c2hraW4gPERteXRyby5MYWt0eXVzaGtpbkBhbWQuY29tPgpSZXZpZXdlZC1i
eTogRXJpYyBCZXJuc3RlaW4gPEVyaWMuQmVybnN0ZWluQGFtZC5jb20+CkFja2VkLWJ5OiBMZW8g
TGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNuMjAvZGNuMjBfaHViYnViLmMgfCAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9pbmMvaHcvZGNodWJidWIuaCAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h1YmJ1Yi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h1YmJ1Yi5jCmluZGV4IGM3MmE5ZmY1N2YxNS4uNmUyZGJk
MDNmOWJmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAv
ZGNuMjBfaHViYnViLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIw
L2RjbjIwX2h1YmJ1Yi5jCkBAIC0zMzcsNiArMzM3LDcgQEAgc3RhdGljIGVudW0gZGNuX2h1YmJ1
Yl9wYWdlX3RhYmxlX2Jsb2NrX3NpemUgcGFnZV90YWJsZV9ibG9ja19zaXplX3RvX2h3KHVuc2ln
bmUKIAkJYnJlYWs7CiAJZGVmYXVsdDoKIAkJQVNTRVJUKGZhbHNlKTsKKwkJYmxvY2tfc2l6ZSA9
IHBhZ2VfdGFibGVfYmxvY2tfc2l6ZTsKIAkJYnJlYWs7CiAJfQogCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L2RjaHViYnViLmggYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L2RjaHViYnViLmgKaW5kZXggMWVhNTA1ZjdhMDVh
Li45NTAyNDc4YzRhMWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9pbmMvaHcvZGNodWJidWIuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
aW5jL2h3L2RjaHViYnViLmgKQEAgLTYyLDcgKzYyLDcgQEAgZW51bSBkY25faHViYnViX3BhZ2Vf
dGFibGVfZGVwdGggewogCiBlbnVtIGRjbl9odWJidWJfcGFnZV90YWJsZV9ibG9ja19zaXplIHsK
IAlEQ05fUEFHRV9UQUJMRV9CTE9DS19TSVpFXzRLQiA9IDAsCi0JRENOX1BBR0VfVEFCTEVfQkxP
Q0tfU0laRV82NEtCID0gNAorCURDTl9QQUdFX1RBQkxFX0JMT0NLX1NJWkVfNjRLQiA9IDQsCiB9
OwogCiBzdHJ1Y3QgZGNuX2h1YmJ1Yl9waHlzX2FkZHJfY29uZmlnIHsKLS0gCjIuMjIuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
