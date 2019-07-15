Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A9669DE0
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A429D89D61;
	Mon, 15 Jul 2019 21:22:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690062.outbound.protection.outlook.com [40.107.69.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BB2589D49
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:22:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZH9VziB11JKeYqHBqJpQwo0L/5Nkmu2oSOC6WoGJVy0j0wKw2S956GOHq/mC8ljrXDT4PUqLaj34/ovAW2SQZfE6tizRZWpN/5oRZU3jk6X1p2oYGg74N6UZjym78XSWa+wqjHlbQL46SPoYt2XvWuloBDvmJl98JVIzIYAOpMQlW/JhiN1D7c2NN6v+Qw7ETSLV7Y2FejuQxdjb0Fk15khiJu7TShgO4LJ3EXIZ+dOAXwoBaM0sTSp61/1QUbBJB31JsPhtBvkz1FCOJPUbDshMzlj2zQPcGS8Z/mOgQiSRVyBNOoiqv/JXGK62SdfTgcAMDMeftYHF/SgXcysHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=otDe+ftG1FiB4Yx/EPexhiHt7mejOLzYBZcJ2FeTufI=;
 b=cvZryUQyWBLJlY+Y1GvG9E8+JVvMNU4IYVvPWJFzwA150E05ZznUPW6gcawhGvrBbIpaiYEhcfqWfPFXWDfm1wuRiQsS2cSunBM1nsR9GEnZcFwkQcYjdRDzAxdrfPa9xZWvA+QfYQAyF+CRAqv6twiA+1P/GwaTZ5BgT3GUn2ANlTMj8DfH6inorXLBD3HWIhNVpUrP041/5Itc+VUdurFR+8fRwXT+/R8EzWtsxyWPCnTfCTthMvebEIUPev4FKtzooRr9kDJij4wA/+pfuvWU2O0mA6eVFgl04sylPdXUiIcF+2dlyzCVBkBVzZXmn2uX6O9D+8TZVR8SFPNZUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM6PR12CA0008.namprd12.prod.outlook.com (2603:10b6:5:1c0::21)
 by CY4PR12MB1928.namprd12.prod.outlook.com (2603:10b6:903:128::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Mon, 15 Jul
 2019 21:22:03 +0000
Received: from CO1NAM03FT063.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by DM6PR12CA0008.outlook.office365.com
 (2603:10b6:5:1c0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14 via Frontend
 Transport; Mon, 15 Jul 2019 21:22:02 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT063.mail.protection.outlook.com (10.152.81.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:22:02 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:41 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 80/87] drm/amd/display: fix mpcc assert condition
Date: Mon, 15 Jul 2019 17:20:42 -0400
Message-ID: <20190715212049.4584-81-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(346002)(136003)(376002)(2980300002)(428003)(199004)(189003)(47776003)(2906002)(186003)(54906003)(356004)(2876002)(26005)(4326008)(2870700001)(305945005)(486006)(6916009)(50466002)(51416003)(76176011)(48376002)(49486002)(68736007)(1076003)(2351001)(8676002)(8936002)(86362001)(50226002)(336012)(81156014)(81166006)(446003)(14444005)(53936002)(426003)(11346002)(476003)(36756003)(316002)(126002)(70586007)(2616005)(70206006)(478600001)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1928; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e14a1cee-00d9-4c93-8cb2-08d7096a7abd
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1928; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1928:
X-Microsoft-Antispam-PRVS: <CY4PR12MB19281AD836F4176AF3A8223482CF0@CY4PR12MB1928.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: JLgVIF698m9XjYe7L3W/PcXFrzZ46DFeAKGIGJtKXjMxv47JjYZgta89JCoN6Llly4B7OVLWVkAIxkDlaqIGd3XldG5YZ1ZGXpXymYevJXLT9qtCfxd5Mro89X9qAfDUt0M1ELxIjM02KMg7uHMq+5a+UFlZ8QRHt9P4KRoqvfsh+wEdBsVBq0GZNmlKVtmvnBhmOIE7vZhjz+hobjps0SN6uwIgLeIeQBiz7JY7Zp0puxkL6yxmoVx/MSBCZzsaENY+H5bvQIj3RUhe2l1GMwTIaSRkT5X8dWQGFmA5dSPjnhK+vub5YsK6g3GbgLYd5YhksrJeLhPyB2cwDUbKsZ63ACyF3nDEW/ERjteKn6YkguCqrO44Naf5JgKZPAZBVz7gunHFbEf5otattkJlxcP0xZJE949o+VIOGtQsfjQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:22:02.4658 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e14a1cee-00d9-4c93-8cb2-08d7096a7abd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1928
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=otDe+ftG1FiB4Yx/EPexhiHt7mejOLzYBZcJ2FeTufI=;
 b=nL78Pb51SrusJhhxs19RU4Tsl9ztPzoLHuvyujyv2BCL6LtxqWmty/c/4dc4Ic3hYNJXGkTdr4ubyHleXP1PpOMH3IfIQ56nKU1B1l1KDvZ/QLlKOXH2405bpU1Ge6xdSlXNCQ4lrPieU9baeopKWZ2ns4HiL3MRF1b0F6D24NY=
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
Cc: Leo Li <sunpeng.li@amd.com>, Yongqiang Sun <yongqiang.sun@amd.com>,
 Eric Yang <Eric.Yang2@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXJpYyBZYW5nIDxFcmljLllhbmcyQGFtZC5jb20+CgpbV2h5XQpJbiBEQ04yeCBhc2lj
LCB0aGUgTVBDQyBzdGF0dXMgcmVnaXN0ZXIgZGVmaW5pdGlvbiBjaGFuZ2VkLCBhbmQKb3VyIGxv
Z2ljIGZvciBhc3NlcnQgaXMgaW5jb3JyZWN0LiBkaXNhYmxlZCBpcyB2YWxpZCBzdGF0ZSwKd2hl
cmUgd2Ugc2hvdWxkIHNlZSBpZGxlIGFuZCBub3QgYnVzeSwgd2hlcmUgYXMgaW4gbm90CmRpc2Fi
bGVkIHN0YXRlLCB3ZSBzaG91bGQgc2VlIG5vdCBpZGxlLgoKW0hvd10KQ2hhbmdlIGFzc2VydCBj
b25kaXRpb24gdG8gYmUgbW9yZSBzZW5zaWJsZS4KClNpZ25lZC1vZmYtYnk6IEVyaWMgWWFuZyA8
RXJpYy5ZYW5nMkBhbWQuY29tPgpSZXZpZXdlZC1ieTogWW9uZ3FpYW5nIFN1biA8eW9uZ3FpYW5n
LnN1bkBhbWQuY29tPgpBY2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQog
Li4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfbXBjLmMgIHwgMjMgKysrKysr
KysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDEyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24y
MC9kY24yMF9tcGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24y
MF9tcGMuYwppbmRleCBmNGQzMDA4ZTVlZmEuLjY3ZjAxMjhmMGIzOCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX21wYy5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9tcGMuYwpAQCAtNDQ2LDIzICs0
NDYsMjIgQEAgdm9pZCBtcGMyX2Fzc2VydF9tcGNjX2lkbGVfYmVmb3JlX2Nvbm5lY3Qoc3RydWN0
IG1wYyAqbXBjLCBpbnQgbXBjY19pZCkKIHsKIAlzdHJ1Y3QgZGNuMjBfbXBjICptcGMyMCA9IFRP
X0RDTjIwX01QQyhtcGMpOwogCXVuc2lnbmVkIGludCB0b3Bfc2VsLCBtcGNfYnVzeSwgbXBjX2lk
bGUsIG1wY19kaXNhYmxlZDsKLQlSRUdfR0VUKE1QQ0NfU1RBVFVTW21wY2NfaWRdLCBNUENDX0RJ
U0FCTEVELCAmbXBjX2Rpc2FibGVkKTsKLQotCWlmIChtcGNfZGlzYWJsZWQpIHsKLQkJQVNTRVJU
KDApOwotCQlyZXR1cm47Ci0JfQogCiAJUkVHX0dFVChNUENDX1RPUF9TRUxbbXBjY19pZF0sCiAJ
CQlNUENDX1RPUF9TRUwsICZ0b3Bfc2VsKTsKIAotCWlmICh0b3Bfc2VsID09IDB4ZikgewotCQlS
RUdfR0VUXzIoTVBDQ19TVEFUVVNbbXBjY19pZF0sCi0JCQkJTVBDQ19CVVNZLCAmbXBjX2J1c3ks
Ci0JCQkJTVBDQ19JRExFLCAmbXBjX2lkbGUpOworCVJFR19HRVRfMyhNUENDX1NUQVRVU1ttcGNj
X2lkXSwKKwkJCU1QQ0NfQlVTWSwgJm1wY19idXN5LAorCQkJTVBDQ19JRExFLCAmbXBjX2lkbGUs
CisJCQlNUENDX0RJU0FCTEVELCAmbXBjX2Rpc2FibGVkKTsKIAotCQlBU1NFUlQobXBjX2J1c3kg
PT0gMCk7Ci0JCUFTU0VSVChtcGNfaWRsZSA9PSAxKTsKKwlpZiAodG9wX3NlbCA9PSAweGYpIHsK
KwkJQVNTRVJUKCFtcGNfYnVzeSk7CisJCUFTU0VSVChtcGNfaWRsZSk7CisJCUFTU0VSVChtcGNf
ZGlzYWJsZWQpOworCX0gZWxzZSB7CisJCUFTU0VSVCghbXBjX2Rpc2FibGVkKTsKKwkJQVNTRVJU
KCFtcGNfaWRsZSk7CiAJfQogfQogCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
