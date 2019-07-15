Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0852B69DBE
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52BC89C85;
	Mon, 15 Jul 2019 21:21:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750077.outbound.protection.outlook.com [40.107.75.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B51A89C83
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gRKRSSz9Ghi+UhsfmV9ip+14H0Hqs4Mmfw3tLSoVjydqEFmPFD5JxyNim35FD023tdHHAqlZsfmDUDusaAmgv2WcxVJpV9+z9+kbQbzpFwzewhd1bYFqYf3vhXfZHrOHLNA0IaZy8C9taYpB00TM4AfQZVuQhlV0MiT/HwsdNimaoVd3EaGJNkbzRZTlYqYwXVo98Zl+/e0NlZsl7uA0sFJid1ApGlvrcHoDbrsXbJbQGM2A37bms2p/D1YLM45paKAZxKkqslRCHar8z4E3Yfy/syZZEycQWgXtVy/F+6W4aP88+JrgpDxHGyCHrSa7yLWva5VTSyHYkroBxGXzBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KAD1nGe6/eKVKYUDsRzeJcYtFDyQJJHyOrZDxGXYgWs=;
 b=ZyPndXeQnW6kPBiJzf0LrnRix2BSziZvM8FZWkGm6TeSWF+N0ZiP+z0pnPWtcqEtg93+JkaQhMvP6da2gSH6B3ZyRr4JE7pxE3Rb28PG8g2UciFw8c1unwNIOvdVGYOJCdcomPmeXbAimdWAxpFWAoUDAzbttDiDPEvfMHGEx0Sv5kwQfsh4h1cHUeHxknEYUBpo+p1HjVzkOysac9kpzQcceuXopC5lSHWCGwAqsoTKXhzZUpuATZU4o817dpi7Df4ZuaBHTb2AKx/5O6cNde/C0DYk8cAieJLiIxd+mDOjtKHHWfn1fLY+tFcYWxIm+JlUvi4Re5vHCgnwCjvTXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MN2PR12CA0007.namprd12.prod.outlook.com (2603:10b6:208:a8::20)
 by BN8PR12MB3089.namprd12.prod.outlook.com (2603:10b6:408:67::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Mon, 15 Jul
 2019 21:21:41 +0000
Received: from CO1NAM03FT049.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by MN2PR12CA0007.outlook.office365.com
 (2603:10b6:208:a8::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.14 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:41 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT049.mail.protection.outlook.com (10.152.81.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:40 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:25 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 43/87] drm/amd/display: fix not calling ppsmu to trigger PME
Date: Mon, 15 Jul 2019 17:20:05 -0400
Message-ID: <20190715212049.4584-44-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(346002)(136003)(2980300002)(428003)(199004)(189003)(8676002)(2616005)(50466002)(2906002)(476003)(2876002)(36756003)(11346002)(48376002)(26005)(14444005)(305945005)(8936002)(49486002)(47776003)(426003)(316002)(86362001)(446003)(1076003)(2870700001)(50226002)(70586007)(70206006)(81156014)(81166006)(478600001)(2351001)(486006)(4326008)(54906003)(6916009)(51416003)(76176011)(356004)(6666004)(186003)(336012)(5660300002)(68736007)(53936002)(126002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3089; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb3532b0-a02f-4ff6-ccf1-08d7096a6db3
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN8PR12MB3089; 
X-MS-TrafficTypeDiagnostic: BN8PR12MB3089:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3089DB1A60C1ADE84107316282CF0@BN8PR12MB3089.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:238;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 1L8b7jjYciZ6VnaBtnd6FzYQA4yMLAgaos7gULHI+pa50R2ISLLSpTy0DMdSG6n0R9KQXim4xwMG0wfd7hEGaeN900JzGel9JrvRun27GuKqY84Ve0pVzOZyiMt5NZXmGZKByU3tnBhwV3juXPWFVYyJ9C8hWicAjcO+Yete6Dpbry9u0VOAOGQQtzMV6+bLxpFK2brPjqb/PIuqqvUcWsFspzSNc71grQ1FAbEHCt+Ftn4Pu+JIODKWf0zLo76tHh0bCjk8SWvD9fU2NHjQBP3fE6DukWQzrlCT157N7ugSBq1Azq3iMdjX2yZESoK0tZXUJXWuNXFP31FkglDw4eii8jXSyFDNOx8YOcP/CZM05VKvTZoAsokyoyQnbwkm0zSpTVVjTfS/TQtpVw/HIskezWE+Nr0g2rTZSDzTxIs=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:40.5966 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb3532b0-a02f-4ff6-ccf1-08d7096a6db3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3089
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KAD1nGe6/eKVKYUDsRzeJcYtFDyQJJHyOrZDxGXYgWs=;
 b=Tl98Iu2Dxjiytn/dJlyIrbJETAwnekniy+WryTAd6gJo6pQNPqkp7onukaYrNsiQ1q//OlxwbNCn/JycfYZ5cvOr1uFEpCK09fB1tflOZyv8kUDMeeTp/QHYzFKpaHcBqZ2H+B8nc+5s4pm+WWoHL+APDCHxtb7Gdp9HQbFm+XA=
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
Cc: Leo Li <sunpeng.li@amd.com>, Eric Yang <eric.yang2@amd.com>,
 Su Sung Chung <Su.Chung@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogU3UgU3VuZyBDaHVuZyA8U3UuQ2h1bmdAYW1kLmNvbT4KClt3aHldCmRjbjIwX2Nsa19t
Z3JfY29uc3RydWN0IHdhcyBub3QgaW5pdGlhbGl6aW5nIHBwX3NtdSwgYW5kIFBNRSBjYWxsIGdl
dHMKZmlsdGVyZWQgb3V0IGJ5IHRoZSBudWxsIGNoZWNrCgpbaG93XQppbml0aWFsaXplIHBwX3Nt
dSBkY24yMF9jbGtfbWdyX2NvbnN0cnVjdAoKU2lnbmVkLW9mZi1ieTogU3UgU3VuZyBDaHVuZyA8
U3UuQ2h1bmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEVyaWMgWWFuZyA8ZXJpYy55YW5nMkBhbWQu
Y29tPgpBY2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjAvZGNuMjBfY2xrX21nci5jIHwgMiAr
KwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2RjbjIwL2RjbjIwX2Nsa19tZ3IuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2RjbjIwL2RjbjIwX2Nsa19tZ3Iu
YwppbmRleCBlOWE3YTdhZjExZGYuLjQ4NDJjOTE3NzFkOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjAvZGNuMjBfY2xrX21nci5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2RjbjIwL2RjbjIwX2Nsa19t
Z3IuYwpAQCAtMzQ2LDYgKzM0Niw4IEBAIHZvaWQgZGNuMjBfY2xrX21ncl9jb25zdHJ1Y3QoCiAK
IAljbGtfbWdyLT5iYXNlLmRwcmVmY2xrX2toeiA9IDcwMDAwMDsgLy8gNzAwIE1IeiBwbGFubmVk
IGlmIFZDTyBpcyAzLjg1IEdIeiwgd2lsbCBiZSByZXRyaWV2ZWQKIAorCWNsa19tZ3ItPnBwX3Nt
dSA9IHBwX3NtdTsKKwogCWlmIChJU19GUEdBX01BWElNVVNfREMoY3R4LT5kY2VfZW52aXJvbm1l
bnQpKSB7CiAJCWRjbjJfZnVuY3MudXBkYXRlX2Nsb2NrcyA9IGRjbjJfdXBkYXRlX2Nsb2Nrc19m
cGdhOwogCQljbGtfbWdyLT5kZW50aXN0X3Zjb19mcmVxX2toeiA9IDM4NTAwMDA7Ci0tIAoyLjIy
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
