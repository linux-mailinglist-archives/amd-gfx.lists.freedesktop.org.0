Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 429DA66624
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jul 2019 07:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E8A46E2C2;
	Fri, 12 Jul 2019 05:29:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780055.outbound.protection.outlook.com [40.107.78.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FAF26E2C2
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jul 2019 05:29:10 +0000 (UTC)
Received: from MN2PR12CA0027.namprd12.prod.outlook.com (2603:10b6:208:a8::40)
 by DM6PR12MB3100.namprd12.prod.outlook.com (2603:10b6:5:11b::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.18; Fri, 12 Jul
 2019 05:29:07 +0000
Received: from DM3NAM03FT025.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::208) by MN2PR12CA0027.outlook.office365.com
 (2603:10b6:208:a8::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.11 via Frontend
 Transport; Fri, 12 Jul 2019 05:29:07 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT025.mail.protection.outlook.com (10.152.82.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Fri, 12 Jul 2019 05:29:07 +0000
Received: from build-machine.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 12 Jul 2019
 00:29:06 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: fix deadlock around smu_handle_task
Date: Fri, 12 Jul 2019 13:29:00 +0800
Message-ID: <20190712052900.21461-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(346002)(376002)(2980300002)(428003)(189003)(199004)(53936002)(26005)(4744005)(186003)(36756003)(14444005)(316002)(68736007)(1076003)(336012)(426003)(6916009)(305945005)(476003)(486006)(70206006)(2906002)(2616005)(70586007)(51416003)(2351001)(8676002)(356004)(48376002)(86362001)(5660300002)(2870700001)(50226002)(7696005)(6666004)(81156014)(50466002)(478600001)(53416004)(44832011)(8936002)(47776003)(4326008)(126002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3100; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6076d662-83cc-4820-e335-08d70689dc5c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM6PR12MB3100; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB3100:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3100E1D129109B1F37FAF5E6E4F20@DM6PR12MB3100.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-Forefront-PRVS: 00963989E5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 8CZXENkSLlmVmCBw+ZiZzVlwH3LgCsHqEVkhMfjPWtyV/hHSDU8O++wXucjTNTnX5i6EH5EbLjB1aOc6Ic65OGl7UyN67kFASdTpZtBjLARJDjONCqpkEdT4XutWsSEdCKviaI4PImRE1XDl7RNTmAXr2hzSv0ea9k4ja/9WBURYAfcmSM83IK1xOMNcTbUuntfa9f6khSZQmhgVLaNsofDMWanbexEWrViHCahvVPBXctoy7uiZdEFx/F10xuKwjzjMed9iC2mXNFPaeIw6eRqT3Zz0Pxt3KkyBFZ2zdj3+T1z5rEvms9TpKGt1n832BHDu5AaRFYrJDsEHjEGIlDCl52tc81JGDHV5RxCLdXrheo2WevJHwRGDpZBO2ytuFSN5A8Q1JupjtEJrkVDdE4NslMTYoODfG0CyzfT/468=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2019 05:29:07.2064 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6076d662-83cc-4820-e335-08d70689dc5c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3100
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uT0PH2aQZlycVyb8hCunSDr6aWR9GBO4sIaKx3taVcg=;
 b=eTSM9LIIjVenfkWtQ0eSUUU8lnssMtXqZlD4pBu63WwBakbLysAR3y0OXxrYpFGyme/Xy1VNce0CuPyEci6DYBvPlM5YJKAkls1d+mn5cz3BaRP6VwxKU4i7Hn920OM/ohOC8NZeXRSOHvwpZuHRIXvhbJic0XuEHxK13AIPctw=
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

QXMgdGhlIGxvY2sgd2FzIGFscmVhZHkgaGVsZCBvbiB0aGUgZW50cmFuY2UgdG8gc211X2hhbmRs
ZV90YXNrLgoKQ2hhbmdlLUlkOiBJNTM4OGFhOTE3ZWYwZTMzMDk3NGUyNmM1OWRiNDJkMTM1NGI2
YTg2NQpTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jIHwgMiAtLQogMSBmaWxlIGNo
YW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvc211X3YxMV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVf
djExXzAuYwppbmRleCBjNjA4OTlkZTg4YmIuLjJiY2E2ZjEzMzQxNSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMKQEAgLTEzMTEsMTAgKzEzMTEsOCBAQCBzbXVf
djExXzBfZGlzcGxheV9jbG9ja192b2x0YWdlX3JlcXVlc3Qoc3RydWN0IHNtdV9jb250ZXh0ICpz
bXUsCiAJCWlmIChyZXQpCiAJCQlnb3RvIGZhaWxlZDsKIAotCQltdXRleF9sb2NrKCZzbXUtPm11
dGV4KTsKIAkJcmV0ID0gc211X3NlbmRfc21jX21zZ193aXRoX3BhcmFtKHNtdSwgU01VX01TR19T
ZXRIYXJkTWluQnlGcmVxLAogCQkJKHNtdV9jbGtfZ2V0X2luZGV4KHNtdSwgY2xrX3NlbGVjdCkg
PDwgMTYpIHwgY2xrX2ZyZXEpOwotCQltdXRleF91bmxvY2soJnNtdS0+bXV0ZXgpOwogCX0KIAog
ZmFpbGVkOgotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
