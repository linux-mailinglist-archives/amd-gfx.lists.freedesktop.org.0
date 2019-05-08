Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18589171DA
	for <lists+amd-gfx@lfdr.de>; Wed,  8 May 2019 08:43:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94348895A8;
	Wed,  8 May 2019 06:43:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750077.outbound.protection.outlook.com [40.107.75.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64EA8895A8
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 May 2019 06:43:46 +0000 (UTC)
Received: from BN4PR12CA0012.namprd12.prod.outlook.com (2603:10b6:403:2::22)
 by DM6PR12MB3484.namprd12.prod.outlook.com (2603:10b6:5:3c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.11; Wed, 8 May
 2019 06:43:44 +0000
Received: from DM3NAM03FT035.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::208) by BN4PR12CA0012.outlook.office365.com
 (2603:10b6:403:2::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.20 via Frontend
 Transport; Wed, 8 May 2019 06:43:44 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT035.mail.protection.outlook.com (10.152.82.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Wed, 8 May 2019 06:43:44 +0000
Received: from build-machine.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 8 May 2019
 01:43:43 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amd/powerplay: update Vega10 ACG Avfs Gb parameters
Date: Wed, 8 May 2019 14:43:33 +0800
Message-ID: <20190508064333.16154-2-evan.quan@amd.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190508064333.16154-1-evan.quan@amd.com>
References: <20190508064333.16154-1-evan.quan@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(346002)(376002)(39860400002)(136003)(2980300002)(428003)(189003)(199004)(81156014)(81166006)(8676002)(8936002)(50226002)(478600001)(316002)(2870700001)(53936002)(53416004)(2906002)(68736007)(4326008)(2351001)(15650500001)(36756003)(336012)(186003)(77096007)(476003)(2616005)(446003)(11346002)(126002)(426003)(486006)(4744005)(26005)(70206006)(76176011)(1076003)(70586007)(44832011)(356004)(6666004)(305945005)(47776003)(51416003)(7696005)(6916009)(86362001)(14444005)(48376002)(72206003)(5660300002)(50466002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3484; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73dea434-d19f-4ef5-c05e-08d6d38083de
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:DM6PR12MB3484; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB3484:
X-Microsoft-Antispam-PRVS: <DM6PR12MB34845799BDF96D9DC7136DDEE4320@DM6PR12MB3484.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 0031A0FFAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: nlNWg+ASPMrHm7lYxKu+y8Q7EIxMN903/sBk7J7MmFlplnaqZLilbrDLHgSdmSLFat8RhG7t8ADnUfQxM+B1RBl2lYp/Hxr3gRg05k5XwuJVodw4eANpxc9WAPcPVkfqx6z/xJhmFy1kaVX7N6Vz4OA5vk8tAIwPIY1xHRiBFz0pYp8JL0M5WzT0bYpZp0LVIbeuTZ2dt97bjkzQWG4HKvOfj1YRFm9Ka77VZEgkEsTpanRI1eLFAug6Sf3v/eTeFpKWMBB9fHzQ/DSrXiIhOWdJ1Z89zmW4tWukguuzg3DvtRRaPOiiLO2uPeMcdCmlxJRY9bCrwW7S6m9l9w7SM19dlzzLDkMKt0VbIMM4/l7g36+fyd+A5uf/tfpOdFDaD5zawSV+C1QEHjU2abvAZWHy8PfXTMDKvQGYYTFlFbE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2019 06:43:44.0111 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73dea434-d19f-4ef5-c05e-08d6d38083de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3484
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hHBMYvJ563gPjloK/sCFB9L046XsEgQkftf3OMjXFiM=;
 b=twIJk0Oyqyo+QtMmprQD7ew+Y/injF+8xPAX+IvDyIr1WlyBvrPiNir2Qy5vXGW/LmSN+8J6aGdedcjHElt3bkrwJ1aYeBElvHd65JfSSv/xxGlL/A5oWdI0TmPTOtNMqT0TV1gAYZZc8Lw8SRr0ePqawURi9R56kJyO1OeAndg=
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

VXBkYXRlIFZlZ2ExMCBBQ0cgQXZmcyBHQiBwYXJhbWV0ZXJzLgoKQ2hhbmdlLUlkOiBJYzNkNWIx
NzBiOTNhN2E5Mjk0OTI2MjMyM2NhNzEwZGJmOWFjNDliNApTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1
YW4gPGV2YW4ucXVhbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2h3bWdyL3ZlZ2ExMF9od21nci5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9od21nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvaHdtZ3IvdmVnYTEwX2h3bWdyLmMKaW5kZXggYjI5OGFiYTEyMDZiLi45NTg1YmE1MWQ4
NTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2Ex
MF9od21nci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2Ex
MF9od21nci5jCkBAIC0yMjY3LDggKzIyNjcsOCBAQCBzdGF0aWMgaW50IHZlZ2ExMF9wb3B1bGF0
ZV9hdmZzX3BhcmFtZXRlcnMoc3RydWN0IHBwX2h3bWdyICpod21ncikKIAkJCXBwX3RhYmxlLT5B
Y2dBdmZzR2IubTEgICAgICAgICAgICAgICAgICAgPSBhdmZzX3BhcmFtcy51bEFjZ0diRnVzZVRh
YmxlTTE7CiAJCQlwcF90YWJsZS0+QWNnQXZmc0diLm0yICAgICAgICAgICAgICAgICAgID0gYXZm
c19wYXJhbXMudWxBY2dHYkZ1c2VUYWJsZU0yOwogCQkJcHBfdGFibGUtPkFjZ0F2ZnNHYi5iICAg
ICAgICAgICAgICAgICAgICA9IGF2ZnNfcGFyYW1zLnVsQWNnR2JGdXNlVGFibGVCOwotCQkJcHBf
dGFibGUtPkFjZ0F2ZnNHYi5tMV9zaGlmdCAgICAgICAgICAgICA9IDA7Ci0JCQlwcF90YWJsZS0+
QWNnQXZmc0diLm0yX3NoaWZ0ICAgICAgICAgICAgID0gMDsKKwkJCXBwX3RhYmxlLT5BY2dBdmZz
R2IubTFfc2hpZnQgICAgICAgICAgICAgPSAyNDsKKwkJCXBwX3RhYmxlLT5BY2dBdmZzR2IubTJf
c2hpZnQgICAgICAgICAgICAgPSAxMjsKIAkJCXBwX3RhYmxlLT5BY2dBdmZzR2IuYl9zaGlmdCAg
ICAgICAgICAgICAgPSAwOwogCiAJCX0gZWxzZSB7Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
