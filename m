Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 617762BAF0
	for <lists+amd-gfx@lfdr.de>; Mon, 27 May 2019 21:52:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1ACD89B05;
	Mon, 27 May 2019 19:52:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820079.outbound.protection.outlook.com [40.107.82.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 366DC89B12
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2019 19:52:26 +0000 (UTC)
Received: from DM5PR12CA0003.namprd12.prod.outlook.com (2603:10b6:4:1::13) by
 DM5PR1201MB0058.namprd12.prod.outlook.com (2603:10b6:4:50::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Mon, 27 May 2019 19:52:24 +0000
Received: from CO1NAM03FT022.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by DM5PR12CA0003.outlook.office365.com
 (2603:10b6:4:1::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.16 via Frontend
 Transport; Mon, 27 May 2019 19:52:24 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT022.mail.protection.outlook.com (10.152.80.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Mon, 27 May 2019 19:52:24 +0000
Received: from leodev.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 27 May 2019
 14:52:04 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 26/26] drm/amd/display: program manual trigger only for bottom
 most pipe
Date: Mon, 27 May 2019 15:51:05 -0400
Message-ID: <1558986665-12964-27-git-send-email-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558986665-12964-1-git-send-email-sunpeng.li@amd.com>
References: <1558986665-12964-1-git-send-email-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(346002)(376002)(396003)(39860400002)(2980300002)(428003)(199004)(189003)(53936002)(51416003)(16586007)(47776003)(36756003)(478600001)(316002)(7696005)(76176011)(81166006)(81156014)(446003)(11346002)(2616005)(486006)(2351001)(8936002)(126002)(476003)(5660300002)(8676002)(426003)(356004)(336012)(77096007)(14444005)(26005)(2876002)(53416004)(305945005)(50226002)(72206003)(2906002)(186003)(50466002)(48376002)(4326008)(68736007)(70206006)(86362001)(6916009)(70586007)(86152003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0058; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17bcd78c-56ac-468c-0c3e-08d6e2dcd6e9
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR1201MB0058; 
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0058:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0058EA2602F072AE53CAFB96821D0@DM5PR1201MB0058.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:510;
X-Forefront-PRVS: 0050CEFE70
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: gBUTvcLis3SeFcU6B1F2SAbTN9jJHTa/d7rCMSGLLJjWth9VR+TC2PS5vd6a0i0WvrPZouLX8oNzkDzI5AfuFl5lqiKyMsmj7RKwEjkn4QH0jXluP8jNwKpTq6Gb1kgNmlAbh8I8SsKw2D35qPwd1qvmS6LA60gPLkkOcAtcpR+pGUwqx05+sSbWB0+5x5eahxTIEyZLyHzTcJOZd1TPvIjAOyTbQqA3Eo3kxcUlg8KAhsYYrxTRCTZA0BHRSnzhbyhSlYnsg8tMBR3mDq+XQxSOEMW+5qwHUag48Vp0ff/LzL8SruJSHRntXwTyBIjCbHz7TH65fgenZMEz2jmWl52I72vy0mWRo2lDgg3h6bz3wvCTxMAkGgG2oqNV7ri19CU+5wQFA6U/w+KhjfweMTasnjH3R/dM2vkRyJ8KKuI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2019 19:52:24.3932 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17bcd78c-56ac-468c-0c3e-08d6e2dcd6e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0058
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HOlzOH+6j+cx8GfvRrKByMkBCrvU0ZOq5+8E0ynOzYI=;
 b=swrz13n7uaX2YMkqmh9OpH6Poyr0KYBmNIrzpjKcHN+Cm/hPuaubhqMYSChp8HOHb8GGgX9EfJcireHgXaoJG+Pqq+J904d+Vzxx9CRLuMa1ZUs6JqHudO/i4mByJ375HG1IZNZImNEcWu0W+2UlWth4EG3VPjusjXr4i36GAMY=
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
Cc: Aric Cyr <aric.cyr@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQXJpYyBDeXIgPGFyaWMuY3lyQGFtZC5jb20+CgpbV2h5XQpXZSBvbmx5IHdhbnQgdG8g
bWFudWFsIHRyaWdnZXIgZW5kLW9mLWZyYW1lIHdoZW4gdGhlIGJvdHRvbS1tb3N0CnBpcGUgaXMg
ZmxpcHBlZCB0byBwcmV2ZW50IG92ZXJsYXlzIGZyb20gZW5kaW5nIHRoZSBmcmFtZSB0b28gZWFy
bHkuCgpbSG93XQpDaGVjayB0aGF0IHRoZSBtYW51YWwgdHJpZ2dlciBpcyBvbmx5IGZpcmluZyBv
biBib3R0b20gcGxhbmUuCgpTaWduZWQtb2ZmLWJ5OiBBcmljIEN5ciA8YXJpYy5jeXJAYW1kLmNv
bT4KUmV2aWV3ZWQtYnk6IEp1biBMZWkgPEp1bi5MZWlAYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBM
aSA8c3VucGVuZy5saUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9jb3JlL2RjLmMgfCAxNCArKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0
aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvY29yZS9kYy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nv
cmUvZGMuYwppbmRleCA0OWJlMzI4Li5kODlhMjliIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9jb3JlL2RjLmMKQEAgLTE3ODEsMTQgKzE3ODEsMTQgQEAgc3RhdGljIHZvaWQgY29t
bWl0X3BsYW5lc19mb3Jfc3RyZWFtKHN0cnVjdCBkYyAqZGMsCiAJCWRjLT5od3NzLnBpcGVfY29u
dHJvbF9sb2NrKGRjLCB0b3BfcGlwZV90b19wcm9ncmFtLCBmYWxzZSk7CiAJfQogCi0JLy8gRmly
ZSBtYW51YWwgdHJpZ2dlcgotCWZvciAoaSA9IDA7IGkgPCBkYy0+cmVzX3Bvb2wtPnBpcGVfY291
bnQ7IGkrKykgewotCQlzdHJ1Y3QgcGlwZV9jdHggKnBpcGVfY3R4ID0gJmNvbnRleHQtPnJlc19j
dHgucGlwZV9jdHhbaV07CisJLy8gRmlyZSBtYW51YWwgdHJpZ2dlciBvbmx5IHdoZW4gYm90dG9t
IHBsYW5lIGlzIGZsaXBwZWQKKwlmb3IgKGogPSAwOyBqIDwgZGMtPnJlc19wb29sLT5waXBlX2Nv
dW50OyBqKyspIHsKKwkJc3RydWN0IHBpcGVfY3R4ICpwaXBlX2N0eCA9ICZjb250ZXh0LT5yZXNf
Y3R4LnBpcGVfY3R4W2pdOwogCi0JCWlmIChwaXBlX2N0eC0+dG9wX3BpcGUgfHwKLQkJCSFwaXBl
X2N0eC0+c3RyZWFtIHx8Ci0JCQlwaXBlX2N0eC0+c3RyZWFtICE9IHN0cmVhbSB8fAotCQkJIXNy
Zl91cGRhdGVzW2ldLmZsaXBfYWRkcikKKwkJaWYgKHBpcGVfY3R4LT5ib3R0b21fcGlwZSB8fAor
CQkJCSFwaXBlX2N0eC0+c3RyZWFtIHx8CisJCQkJcGlwZV9jdHgtPnN0cmVhbSAhPSBzdHJlYW0g
fHwKKwkJCQkhcGlwZV9jdHgtPnBsYW5lX3N0YXRlLT51cGRhdGVfZmxhZ3MuYml0cy5hZGRyX3Vw
ZGF0ZSkKIAkJCWNvbnRpbnVlOwogCiAJCWlmIChwaXBlX2N0eC0+c3RyZWFtX3Jlcy50Zy0+ZnVu
Y3MtPnByb2dyYW1fbWFudWFsX3RyaWdnZXIpCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
