Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 859A369DB4
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 014FF89C53;
	Mon, 15 Jul 2019 21:21:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680064.outbound.protection.outlook.com [40.107.68.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FCC989C37
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WIPX4oJgRBn+d2vI/B9YKVm9QO3/S/sg16VFhbqgV3ALERcgEWUrc/OrI83kCzjlQE1nuQAhFy2v4d4xlFMfG0z1wSLemQwGnCWAFz746+zYg/45PrDjDOymYkops8BrO/f9/mycAOTrEj17hmYITUBSItvkrAC/HsKGKTWtEkQvQo0zWqLLSz64701NNLQL+dRexlNWgAzIAmiY6f6NCHDNKqZbefpWjPH+IqtkXx3OJWDrGHeoD9AbFMKzeaffWFCKLnhDYVzwzzOwig99OtgYa7v+FOEYqNovEEdi1MgG1T9RyGiSj/k7R5fZavitvo0miRVPvrDe4IEym3Cueg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jtkqEILrDkMYOuPVg/3qQhS1P6CehqqxXAmJuilJjIs=;
 b=J5hf8+wmP8qfFB/xW2TpeFUBOVYVk8Z0eI4Ubvpvg1uz8LfO9Ppjuk23v41BkLbwEg0ImfsU/rKiEJNtuJkD4OjnY/28wX/erl1IbH4tgDG9gc7XZkJa6o+UfcfvA8ExwVt1AlpH9ay4P3lUEmPGAwrwiX0iXw6pxKT0+zFoX2y4x2Q9CyBTKGsVL+mpBtHJS17Zy9decVLS1KllJlED5B0OJZKPcsFHExO61wGSKEKrOf9DVpMvx7dW9YcKuKeT9nlbhbto9KsLbl2PYJMOmfxs1lsZ1HLzblSnkYi+XLMIpTSEjLnMQcnZXTmdKZTilBkxBFdHdcMbin6IpmzkdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MN2PR12CA0014.namprd12.prod.outlook.com (20.179.80.27) by
 BN6PR12MB1921.namprd12.prod.outlook.com (10.175.97.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.13; Mon, 15 Jul 2019 21:21:34 +0000
Received: from CO1NAM03FT049.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by MN2PR12CA0014.outlook.office365.com
 (2603:10b6:208:a8::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.11 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:34 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT049.mail.protection.outlook.com (10.152.81.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:33 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:21 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 32/87] drm/amd/display: Expose enc2_set_dynamic_metadata
Date: Mon, 15 Jul 2019 17:19:54 -0400
Message-ID: <20190715212049.4584-33-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(39860400002)(346002)(2980300002)(428003)(189003)(199004)(53936002)(70586007)(6916009)(2876002)(76176011)(70206006)(51416003)(316002)(86362001)(486006)(54906003)(5660300002)(305945005)(68736007)(478600001)(1076003)(11346002)(446003)(50466002)(14444005)(47776003)(2870700001)(6666004)(50226002)(356004)(49486002)(81156014)(81166006)(36756003)(186003)(426003)(2906002)(48376002)(8676002)(2616005)(336012)(4326008)(126002)(2351001)(476003)(8936002)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1921; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8492e390-def0-41d9-c43c-08d7096a69b0
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1921; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1921:
X-Microsoft-Antispam-PRVS: <BN6PR12MB19210753BD81B401197B583782CF0@BN6PR12MB1921.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Sue7GjqwoFmeBKZZfjIYGmwNRAbDDOVtbeUxBmNhCJqllFc8RRCYwA4uzQXYemZyaFUPmTWAOLYMvO8WkU6j25iypzv5ydchExBNagsY3ffbX1sgrXgFRlwypz6iEVRZ4khp1HQqEgfQgSZL755Kpqi8rpmr9l2KEPVDEk4j4Y9jwuNooUg+T6QBZBoXTFdb5aJXs5cjFkJdVYcp8+ZLu5R2gJRbqkAa5uQCRGwkNadMXXMAblGHAeFNRTDHeCRZPPqsVzgnYiUoVDmyqu2IiyMDxNYOazHoTHojaoY0v+zcID50m69yS0QUCFjsUKzeBKiDSP9IeGUTon+oLQStxi3yTLC6lQBQeXrUbEhYO59233XDf9q9cxL424vyv2Oitd7pzomxAxXP0YjtCOLY11bSK+ivLA6FjKpnZU1XoNg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:33.8558 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8492e390-def0-41d9-c43c-08d7096a69b0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1921
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jtkqEILrDkMYOuPVg/3qQhS1P6CehqqxXAmJuilJjIs=;
 b=ZNt6FHxUeFdfi4mXiWNs7IGVVcGpIXA09no1lLbkM8gg+6/vUQobGBri3nj65frh5o2U+c5NVvORCPdnO2/7HzCDt09yPtMa2raTVoUl5n1j9CLBgPcYdo2BxqkM0ZlC0+9LL5+uMdnlY7i2tUKR24/lUD8fZy9iV8eHGKI4rfM=
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
Cc: Ilya Bakoulin <Ilya.Bakoulin@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Eric Bernstein <Eric.Bernstein@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSWx5YSBCYWtvdWxpbiA8SWx5YS5CYWtvdWxpbkBhbWQuY29tPgoKW1doeV0KTmVlZCB0
byBpbXBsZW1lbnQgcmVnaXN0ZXIgcHJvZ3JhbW1pbmcgZm9yIEhEUiBkeW5hbWljCm1ldGFkYXRh
IHRyYW5zbWlzc2lvbiBhbmQgdGVzdHMuCgpTaWduZWQtb2ZmLWJ5OiBJbHlhIEJha291bGluIDxJ
bHlhLkJha291bGluQGFtZC5jb20+ClJldmlld2VkLWJ5OiBFcmljIEJlcm5zdGVpbiA8RXJpYy5C
ZXJuc3RlaW5AYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9zdHJlYW1fZW5j
b2Rlci5jIHwgMiArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIw
X3N0cmVhbV9lbmNvZGVyLmggfCA1ICsrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY24yMC9kY24yMF9zdHJlYW1fZW5jb2Rlci5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3N0cmVhbV9lbmNvZGVyLmMKaW5kZXggNzkxYWE3NDVl
ZmQyLi40MDNmMWY4NjVhMDYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY24yMC9kY24yMF9zdHJlYW1fZW5jb2Rlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9zdHJlYW1fZW5jb2Rlci5jCkBAIC0zNzEsNyArMzcx
LDcgQEAgc3RhdGljIHZvaWQgZW5jMl9yZWFkX3N0YXRlKHN0cnVjdCBzdHJlYW1fZW5jb2RlciAq
ZW5jLCBzdHJ1Y3QgZW5jX3N0YXRlICpzKQogICoKICAqICAgRW5zdXJlIHRoZSBPVEcgbWFzdGVy
IHVwZGF0ZSBsb2NrIGlzIHNldCB3aGVuIGNoYW5naW5nIERNRSBjb25maWd1cmF0aW9uLgogICov
Ci1zdGF0aWMgdm9pZCBlbmMyX3NldF9keW5hbWljX21ldGFkYXRhKHN0cnVjdCBzdHJlYW1fZW5j
b2RlciAqZW5jLAordm9pZCBlbmMyX3NldF9keW5hbWljX21ldGFkYXRhKHN0cnVjdCBzdHJlYW1f
ZW5jb2RlciAqZW5jLAogCQlib29sIGVuYWJsZV9kbWUsCiAJCXVpbnQzMl90IGh1YnBfcmVxdWVz
dG9yX2lkLAogCQllbnVtIGR5bmFtaWNfbWV0YWRhdGFfbW9kZSBkbWRhdGFfbW9kZSkKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9zdHJlYW1f
ZW5jb2Rlci5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3N0
cmVhbV9lbmNvZGVyLmgKaW5kZXggNmQ0MGU4YzliNzhmLi4zZjk0YTlmMTNjNGEgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9zdHJlYW1fZW5j
b2Rlci5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9z
dHJlYW1fZW5jb2Rlci5oCkBAIC0xMDQsNCArMTA0LDkgQEAgdm9pZCBlbmMyX3N0cmVhbV9lbmNv
ZGVyX2RwX3VuYmxhbmsoCiAJc3RydWN0IHN0cmVhbV9lbmNvZGVyICplbmMsCiAJY29uc3Qgc3Ry
dWN0IGVuY29kZXJfdW5ibGFua19wYXJhbSAqcGFyYW0pOwogCit2b2lkIGVuYzJfc2V0X2R5bmFt
aWNfbWV0YWRhdGEoc3RydWN0IHN0cmVhbV9lbmNvZGVyICplbmMsCisJCWJvb2wgZW5hYmxlX2Rt
ZSwKKwkJdWludDMyX3QgaHVicF9yZXF1ZXN0b3JfaWQsCisJCWVudW0gZHluYW1pY19tZXRhZGF0
YV9tb2RlIGRtZGF0YV9tb2RlKTsKKwogI2VuZGlmIC8qIF9fRENfU1RSRUFNX0VOQ09ERVJfRENO
MjBfSF9fICovCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
