Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E5F884FD
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 23:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C0B76EEBF;
	Fri,  9 Aug 2019 21:38:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730056.outbound.protection.outlook.com [40.107.73.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD896EEB2
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 21:38:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lh7PB+FRU31i8L03a63NVnwofJlGw/qv8a9PmYql/NLQCYZP2GGFesOC1k9qpa+goM3Y1lIW922n4vu0Thc2T/3bBMG6LO+RaVb1c7oZvOtE4K9UN6R+RM7YvHXQYBXfcIGKSXKpQvydyLrCjuRc4L+fhS/DPxsvnuH6suUOHGTvNKGDn454G16PE0o4O/qNVSx228RhtVqW0V4g7mF8xUovaxwcWf7ypQXZFAIfFmslfbinNKzZBG+If/mQsCNlHenQPctNMcKKTzJPRzBEICkkZOhg18JH3qhW+KMfZ9sVpLs9Cu7nbb/vj/zaZfaLoubCQL5QBh/DT6alkmkGLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYvQYn+XMxDAdLI2bQvcyuGtHIZ80N8i6W/+ToYfI5Q=;
 b=bZ96Av4zKCpw7gHOU8ii+BAbZ5AcPBIP+Yg2wjiV33jsPKT1nNclYx9VTaaP6IO4QQI9xQi/auvWnce3vs1PS+9g4OqBFrFGNsuEY5ZkGt3rHMND2Dbl6zgG+lLu3UyitNOlL16Tmeineuh8s2pmHUx5YpVFOW42a+62d+FF0J0DWeRYHcx6fE4BvR51WY6/bMbcRGQpUf7joGOqH2/IeDQDB9/RJl6AjXJAcxejAOAs8vN7yw4JNuJfBEoBqbvVbmGfVy/oeqMkN0/BofwLnc9jONmoYKGCbTbbrowjPFel0jBbrJ4x/cD/RuXEQxupV4MAIZ9R8F99A8sMEaLftg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CY4PR1201CA0002.namprd12.prod.outlook.com
 (2603:10b6:910:16::12) by MWHPR12MB1278.namprd12.prod.outlook.com
 (2603:10b6:300:10::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.17; Fri, 9 Aug
 2019 21:38:38 +0000
Received: from DM3NAM03FT040.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::200) by CY4PR1201CA0002.outlook.office365.com
 (2603:10b6:910:16::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.18 via Frontend
 Transport; Fri, 9 Aug 2019 21:38:38 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT040.mail.protection.outlook.com (10.152.83.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Fri, 9 Aug 2019 21:38:37 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Fri, 9 Aug 2019 16:38:31 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 24/49] drm/amd/display: fix pipe selection logic in validate
Date: Fri, 9 Aug 2019 17:37:17 -0400
Message-ID: <20190809213742.30301-25-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190809213742.30301-1-sunpeng.li@amd.com>
References: <20190809213742.30301-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(39860400002)(346002)(2980300002)(428003)(199004)(189003)(51416003)(446003)(2870700001)(48376002)(11346002)(8936002)(4326008)(426003)(486006)(50466002)(86362001)(2906002)(50226002)(36756003)(53936002)(336012)(14444005)(2351001)(305945005)(6916009)(54906003)(186003)(76176011)(316002)(2876002)(356004)(15650500001)(5660300002)(1076003)(81166006)(81156014)(8676002)(126002)(6666004)(478600001)(476003)(26005)(70206006)(70586007)(47776003)(49486002)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1278; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57c29508-8e50-49f6-4345-08d71d11f060
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1278; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1278:
X-Microsoft-Antispam-PRVS: <MWHPR12MB12787F4DB70EBDFC85EDAE4682D60@MWHPR12MB1278.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 01244308DF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 6gE321phG1RUSG4xw+KI5LMsIjX1G4jWjsQ5UOKqEJmz9Uz89Zuiw6Fw8am4oy5Hsr2fkkaw9U5m1bgLoMkOALKEn0eLtofZh+7wF2dabFmaXV7esVC+BxBWTQxarCLfBAdnfqlt6Lse1pzf3ZcrO2kwMg29ERTKL5zwKeZd38ydgUTHgNmrRYiBQGLyoEGCB7uO2uyM7xyNc6v8Ajc/WMuTfMWqr5s4xXtCvK/VBjrKSLQ/sg76XQwC0XrfMO+iyCC1ErczsuNQwtZWcIF3Fe1dEUy94V274LF4T9wgPy/YUPZ/jg9kXhQGOFGHNF7+GfPBbcCnwhBHLmQbSudMS8QveezXnuOeMhDjIOFtiZnqaUC/9QRUipDxa3jUb1ND4qObDWqy3U+d/5WFNxDtcMT9zNjtrUiD+qZmHdzWwfY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 21:38:37.9623 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57c29508-8e50-49f6-4345-08d71d11f060
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1278
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYvQYn+XMxDAdLI2bQvcyuGtHIZ80N8i6W/+ToYfI5Q=;
 b=ki42VyFi80WSN35n4xdBOF8b4oyr1Lq+6t+hYFZKy5YcBb1krAE9AQRcmLrVU9Arss6foNfnkb5vFUiu4IdnLCH9eEimizkutA+I4Jua7p60MoG7aq8kVoMiURXTG7BfeR4LPvMENhzkHxPiJgV8aPvo0zqJ/K6Csx1bcB9iT2s=
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
Cc: Leo Li <sunpeng.li@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Eric Yang <eric.yang2@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSnVuIExlaSA8SnVuLkxlaUBhbWQuY29tPgoKW3doeV0KUmVzb3VyY2UgbWFwcGluZyBk
b25lIGluIGRjbjIwX3ZhbGlkYXRlX2JhbmR3aWR0aCBoYXMgYSBmbGF3OiAgV2hlbiBhIGZ1bGwK
dXBkYXRlIGlzIHBlcmZvcm1lZCwgdGhlIEhXU1Mgd2lsbCBvbmx5IHVwZGF0ZSB0aGUgTVBDQyB0
cmVlIGZvciB0aGUgc3RyZWFtCnRoYXQgaXMgdXBkYXRlZCBhcyBvcHBvc2VkIHRvIGFsbCBzdHJl
YW1zLiAgVGhpcyBtZWFucyB0aGF0IHdoZW4gbWFwcGluZyBwaXBlcwppbiB2YWxpZGF0aW9uLCBj
YXJlIG11c3QgYmUgdGFrZW4gdG8gbm90IGNoYW5nZSBhbnkgZXhpc3RpbmcgbWFwcGluZywgb3Ro
ZXJ3aXNlIGl0CmxlYWRzIHRvIHBhcnRpYWwgaHcgcHJvZ3JhbW1pbmcKCltob3ddCml0J3Mgbm90
IHN0cmljdGx5IG5lY2Vzc2FyeSB0byB0cmFjayB3aGljaCBzdHJlYW0vbXBjYyB0cmVlIGlzIGJl
aW5nIHVwZGF0ZWQsIGJ1dApyYXRoZXIgaXQncyBzdWZmaWNpZW50IHRvIGNvbXBhcmUgY3VycmVu
dCBhbmQgbmV3IHN0YXRlIGFuZCBqdXN0IGtlZXAgcGlwZXMgdGhhdCB3ZXJlCnByZXZpb3VzbHkg
YWxyZWFkeSBtYXBwZWQgdW5jaGFuZ2VkLgoKU2lnbmVkLW9mZi1ieTogSnVuIExlaSA8SnVuLkxl
aUBhbWQuY29tPgpSZXZpZXdlZC1ieTogRXJpYyBZYW5nIDxlcmljLnlhbmcyQGFtZC5jb20+CkFj
a2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KLS0tCiAuLi4vZHJtL2FtZC9kaXNw
bGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgfCA3MiArKysrKysrKysrKysrKysrKystCiAx
IGZpbGUgY2hhbmdlZCwgNzAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2Uu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5j
CmluZGV4IDAyYTc2MzMyMTI3MS4uYmJkMGM2YWMyZDhjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYwpAQCAtMjEyNiw2
ICsyMTI2LDc0IEBAIHN0YXRpYyBib29sIGRjbjIwX3ZhbGlkYXRlX2RzYyhzdHJ1Y3QgZGMgKmRj
LCBzdHJ1Y3QgZGNfc3RhdGUgKm5ld19jdHgpCiB9CiAjZW5kaWYKIAorc3RhdGljIHN0cnVjdCBw
aXBlX2N0eCAqZGNuMjBfZmluZF9zZWNvbmRhcnlfcGlwZShzdHJ1Y3QgZGMgKmRjLAorCQlzdHJ1
Y3QgcmVzb3VyY2VfY29udGV4dCAqcmVzX2N0eCwKKwkJY29uc3Qgc3RydWN0IHJlc291cmNlX3Bv
b2wgKnBvb2wsCisJCWNvbnN0IHN0cnVjdCBwaXBlX2N0eCAqcHJpbWFyeV9waXBlKQoreworCXN0
cnVjdCBwaXBlX2N0eCAqc2Vjb25kYXJ5X3BpcGUgPSBOVUxMOworCisJaWYgKGRjICYmIHByaW1h
cnlfcGlwZSkgeworCQlpbnQgajsKKwkJaW50IHByZWZlcnJlZF9waXBlX2lkeCA9IDA7CisKKwkJ
LyogZmlyc3QgY2hlY2sgdGhlIHByZXYgZGMgc3RhdGU6CisJCSAqIGlmIHRoaXMgcHJpbWFyeSBw
aXBlIGhhcyBhIGJvdHRvbSBwaXBlIGluIHByZXYuIHN0YXRlCisJCSAqIGFuZCBpZiB0aGUgYm90
dG9tIHBpcGUgaXMgc3RpbGwgYXZhaWxhYmxlICh3aGljaCBpdCBzaG91bGQgYmUpLAorCQkgKiBw
aWNrIHRoYXQgcGlwZSBhcyBzZWNvbmRhcnkKKwkJICovCisJCWlmIChkYy0+Y3VycmVudF9zdGF0
ZS0+cmVzX2N0eC5waXBlX2N0eFtwcmltYXJ5X3BpcGUtPnBpcGVfaWR4XS5ib3R0b21fcGlwZSkg
eworCQkJcHJlZmVycmVkX3BpcGVfaWR4ID0gZGMtPmN1cnJlbnRfc3RhdGUtPnJlc19jdHgucGlw
ZV9jdHhbcHJpbWFyeV9waXBlLT5waXBlX2lkeF0uYm90dG9tX3BpcGUtPnBpcGVfaWR4OworCQkJ
aWYgKHJlc19jdHgtPnBpcGVfY3R4W3ByZWZlcnJlZF9waXBlX2lkeF0uc3RyZWFtID09IE5VTEwp
IHsKKwkJCQlzZWNvbmRhcnlfcGlwZSA9ICZyZXNfY3R4LT5waXBlX2N0eFtwcmVmZXJyZWRfcGlw
ZV9pZHhdOworCQkJCXNlY29uZGFyeV9waXBlLT5waXBlX2lkeCA9IHByZWZlcnJlZF9waXBlX2lk
eDsKKwkJCX0KKwkJfQorCisJCS8qCisJCSAqIGlmIHRoaXMgcHJpbWFyeSBwaXBlIGRvZXMgbm90
IGhhdmUgYSBib3R0b20gcGlwZSBpbiBwcmV2LiBzdGF0ZQorCQkgKiBzdGFydCBiYWNrd2FyZCBh
bmQgZmluZCBhIHBpcGUgdGhhdCBkaWQgbm90IHVzZWQgdG8gYmUgYSBib3R0b20gcGlwZSBpbgor
CQkgKiBwcmV2LiBkYyBzdGF0ZS4gVGhpcyB3YXkgd2UgbWFrZSBzdXJlIHdlIGtlZXAgdGhlIHNh
bWUgYXNzaWdubWVudCBhcworCQkgKiBsYXN0IHN0YXRlIGFuZCB3aWxsIG5vdCBoYXZlIHRvIHJl
cHJvZ3JhbSBldmVyeSBwaXBlCisJCSAqLworCQlpZiAoc2Vjb25kYXJ5X3BpcGUgPT0gTlVMTCkg
eworCQkJZm9yIChqID0gZGMtPnJlc19wb29sLT5waXBlX2NvdW50IC0gMTsgaiA+PSAwOyBqLS0p
IHsKKwkJCQlpZiAoZGMtPmN1cnJlbnRfc3RhdGUtPnJlc19jdHgucGlwZV9jdHhbal0udG9wX3Bp
cGUgPT0gTlVMTCkgeworCQkJCQlwcmVmZXJyZWRfcGlwZV9pZHggPSBqOworCisJCQkJCWlmIChy
ZXNfY3R4LT5waXBlX2N0eFtwcmVmZXJyZWRfcGlwZV9pZHhdLnN0cmVhbSA9PSBOVUxMKSB7CisJ
CQkJCQlzZWNvbmRhcnlfcGlwZSA9ICZyZXNfY3R4LT5waXBlX2N0eFtwcmVmZXJyZWRfcGlwZV9p
ZHhdOworCQkJCQkJc2Vjb25kYXJ5X3BpcGUtPnBpcGVfaWR4ID0gcHJlZmVycmVkX3BpcGVfaWR4
OworCQkJCQkJYnJlYWs7CisJCQkJCX0KKwkJCQl9CisJCQl9CisJCX0KKwkJLyoKKwkJICogV2Ug
c2hvdWxkIG5ldmVyIGhpdCB0aGlzIGFzc2VydCB1bmxlc3MgYXNzaWdubWVudHMgYXJlIHNodWZm
bGVkIGFyb3VuZAorCQkgKiBpZiB0aGlzIGhhcHBlbnMgd2Ugd2lsbCBwcm9iLiBoaXQgYSB2c3lu
YyB0ZHIKKwkJICovCisJCUFTU0VSVChzZWNvbmRhcnlfcGlwZSk7CisJCS8qCisJCSAqIHNlYXJj
aCBiYWNrd2FyZHMgZm9yIHRoZSBzZWNvbmQgcGlwZSB0byBrZWVwIHBpcGUKKwkJICogYXNzaWdu
bWVudCBtb3JlIGNvbnNpc3RlbnQKKwkJICovCisJCWlmIChzZWNvbmRhcnlfcGlwZSA9PSBOVUxM
KSB7CisJCQlmb3IgKGogPSBkYy0+cmVzX3Bvb2wtPnBpcGVfY291bnQgLSAxOyBqID49IDA7IGot
LSkgeworCQkJCXByZWZlcnJlZF9waXBlX2lkeCA9IGo7CisKKwkJCQlpZiAocmVzX2N0eC0+cGlw
ZV9jdHhbcHJlZmVycmVkX3BpcGVfaWR4XS5zdHJlYW0gPT0gTlVMTCkgeworCQkJCQlzZWNvbmRh
cnlfcGlwZSA9ICZyZXNfY3R4LT5waXBlX2N0eFtwcmVmZXJyZWRfcGlwZV9pZHhdOworCQkJCQlz
ZWNvbmRhcnlfcGlwZS0+cGlwZV9pZHggPSBwcmVmZXJyZWRfcGlwZV9pZHg7CisJCQkJCWJyZWFr
OworCQkJCX0KKwkJCX0KKwkJfQorCX0KKworCXJldHVybiBzZWNvbmRhcnlfcGlwZTsKK30KKwog
Ym9vbCBkY24yMF9mYXN0X3ZhbGlkYXRlX2J3KAogCQlzdHJ1Y3QgZGMgKmRjLAogCQlzdHJ1Y3Qg
ZGNfc3RhdGUgKmNvbnRleHQsCkBAIC0yMjc5LDcgKzIzNDcsNyBAQCBib29sIGRjbjIwX2Zhc3Rf
dmFsaWRhdGVfYncoCiAJCWlmIChmb3JjZV9zcGxpdCAmJiBjb250ZXh0LT5id19jdHguZG1sLnZi
YS5Ob09mRFBQW3ZsZXZlbF1bY29udGV4dC0+YndfY3R4LmRtbC52YmEubWF4TXBjQ29tYl1bcGlw
ZV9pZHhdID09IDEpCiAJCQljb250ZXh0LT5id19jdHguZG1sLnZiYS5SZXF1aXJlZERQUENMS1t2
bGV2ZWxdW2NvbnRleHQtPmJ3X2N0eC5kbWwudmJhLm1heE1wY0NvbWJdW3BpcGVfaWR4XSAvPSAy
OwogCQlpZiAoIXBpcGUtPnRvcF9waXBlICYmICFwaXBlLT5wbGFuZV9zdGF0ZSAmJiBjb250ZXh0
LT5id19jdHguZG1sLnZiYS5PRE1Db21iaW5lRW5hYmxlZFtwaXBlX2lkeF0pIHsKLQkJCWhzcGxp
dF9waXBlID0gZmluZF9pZGxlX3NlY29uZGFyeV9waXBlKCZjb250ZXh0LT5yZXNfY3R4LCBkYy0+
cmVzX3Bvb2wsIHBpcGUpOworCQkJaHNwbGl0X3BpcGUgPSBkY24yMF9maW5kX3NlY29uZGFyeV9w
aXBlKGRjLCAmY29udGV4dC0+cmVzX2N0eCwgZGMtPnJlc19wb29sLCBwaXBlKTsKIAkJCUFTU0VS
VChoc3BsaXRfcGlwZSk7CiAJCQlpZiAoIWRjbjIwX3NwbGl0X3N0cmVhbV9mb3JfY29tYmluZSgK
IAkJCQkJJmNvbnRleHQtPnJlc19jdHgsIGRjLT5yZXNfcG9vbCwKQEAgLTIzMjAsNyArMjM4OCw3
IEBAIGJvb2wgZGNuMjBfZmFzdF92YWxpZGF0ZV9idygKIAkJaWYgKG5lZWRfc3BsaXQzZCB8fCBu
ZWVkX3NwbGl0IHx8IGZvcmNlX3NwbGl0KSB7CiAJCQlpZiAoIWhzcGxpdF9waXBlIHx8IGhzcGxp
dF9waXBlLT5wbGFuZV9zdGF0ZSAhPSBwaXBlLT5wbGFuZV9zdGF0ZSkgewogCQkJCS8qIHBpcGUg
bm90IHNwbGl0IHByZXZpb3VzbHkgbmVlZHMgc3BsaXQgKi8KLQkJCQloc3BsaXRfcGlwZSA9IGZp
bmRfaWRsZV9zZWNvbmRhcnlfcGlwZSgmY29udGV4dC0+cmVzX2N0eCwgZGMtPnJlc19wb29sLCBw
aXBlKTsKKwkJCQloc3BsaXRfcGlwZSA9IGRjbjIwX2ZpbmRfc2Vjb25kYXJ5X3BpcGUoZGMsICZj
b250ZXh0LT5yZXNfY3R4LCBkYy0+cmVzX3Bvb2wsIHBpcGUpOwogCQkJCUFTU0VSVChoc3BsaXRf
cGlwZSB8fCBmb3JjZV9zcGxpdCk7CiAJCQkJaWYgKCFoc3BsaXRfcGlwZSkKIAkJCQkJY29udGlu
dWU7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
