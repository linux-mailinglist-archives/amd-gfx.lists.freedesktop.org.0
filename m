Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E01D48AE
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 21:53:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918F76EC95;
	Fri, 11 Oct 2019 19:53:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770052.outbound.protection.outlook.com [40.107.77.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B386EC92
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 19:53:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RtdkX9xWFlQOlXL35NZ0GWoKTBWDb7w5Y1/w6RMmnV84qlAnxnAPWvbKp+BYDS8UBhU2+YTX/LF5GAUbYuKqBNNHmhwqiBVfmNiLFQJfrcaLQFdGrOyTeYdZ9GpYU4xuOFdwaq5qKV0OFXMLAjhso66hO4lQPbPLOYZp4bjwHj8cJ3CYOyeczwlldZvXBDXxasIrV9/vgwdVULJwLA3JHSKjTN5QavgH49qLOKNPbB/LXXuf75IuBVrdUshQ2afyIuFhWpTYJbnpXZp4JlGy/B6b/C9h/izTuTVoj5EU195Z07pJWTzkDNc4jLPTis+o/SzjYj9Ee3LVVMTVSWFjaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gU8uIc869fcZr23VNSw95/DmMWeUmzSoIo8ya/EZ1A=;
 b=guReOvxaXJr+pkjbVZNg9cdQqub+Q1e+75saEp3FSFzp6jonvb4OL1J+8ioJKfzNeUJwQShzu2OhG0mXjAfqc8RP0uQoKV/VKvrEuWuEzwhSZ8d3tAkZdE/IWgnHBA40AGrPnZKIem2GC4r/C6XEjGa3uEROfv2skQGzy3v65lAO7CT2KHCSUN6Ti8WbyFdsW+oFoRVSWcKYbj2V9xlcS/JuiJGYJFRjA+OnuCcMO1qp/f95OJ1yFO4Y04i032fCfgl8qlpCngz62RlKzhCpzsZvZybX+fywYSjy76WfHH4MguJ3txHLopzZWXoUvNKMULEFxgVZAisU/nUsRevBnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0020.namprd12.prod.outlook.com (2603:10b6:5:1c0::33)
 by CH2PR12MB4279.namprd12.prod.outlook.com (2603:10b6:610:af::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.25; Fri, 11 Oct
 2019 19:53:48 +0000
Received: from BY2NAM03FT051.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by DM6PR12CA0020.outlook.office365.com
 (2603:10b6:5:1c0::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Fri, 11 Oct 2019 19:53:48 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT051.mail.protection.outlook.com (10.152.85.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2347.21 via Frontend Transport; Fri, 11 Oct 2019 19:53:48 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 11 Oct 2019
 14:53:44 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 10/29] drm/amd/display: enable hostvm based on roimmu active
 for dcn2.1
Date: Fri, 11 Oct 2019 15:53:05 -0400
Message-ID: <20191011195324.16268-11-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
References: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(376002)(346002)(39860400002)(428003)(189003)(199004)(2906002)(5660300002)(478600001)(50466002)(48376002)(6916009)(36756003)(126002)(47776003)(70586007)(1076003)(476003)(486006)(6666004)(356004)(4326008)(53416004)(26005)(2616005)(426003)(186003)(446003)(7696005)(2351001)(81156014)(51416003)(16586007)(8936002)(8676002)(50226002)(81166006)(305945005)(86362001)(70206006)(316002)(14444005)(76176011)(336012)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4279; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40ab1a99-a726-4062-7c85-08d74e84bb8b
X-MS-TrafficTypeDiagnostic: CH2PR12MB4279:
X-Microsoft-Antispam-PRVS: <CH2PR12MB4279B2E9AFC68398E768C20DF9970@CH2PR12MB4279.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-Forefront-PRVS: 0187F3EA14
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +X4rxzCkZuEEAVDy2mT3wd2oDvCv2ykTBvMBHm+3Fp96h2SATjc5VWPXjxHqhnGN31eEmn8RaYquU5WR1CCTgqZvxsWj1liSXqVIMg7HBSBTvAnuG+TbrIKKao1pqwfwH+6i96awBtaUgLlvC+bPYTQPZoyvbCvbgNXoCC9aMInQdGHAENF+d0ZT1uQ+A63UEFoi0t5uVxNsHnGlm1S+HPX3Ho3oNJVY73uX7Pj5IOKqTaHG//vsa8fVoIVbC0jAtbWMB7QpC5NgVvrqwucma7spLjKVO/vu3KDLpgm8jdSUNc9G8eIIdIyxg62kjXOhZTkmhFtXswQkrd9Zu/zwfEpGvVC5CZoDnN+j74Vahyd7LVj7/7zTeJraaGUupjuByn1tZe9V7AJXy0hjKuTxs4xsWoYYqJsvN4SWh8gd22c=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 19:53:48.3573 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ab1a99-a726-4062-7c85-08d74e84bb8b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4279
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gU8uIc869fcZr23VNSw95/DmMWeUmzSoIo8ya/EZ1A=;
 b=UNpRFPxghjY5IhrADUEOFXP9TxW0A0M58Chy6aEaY3ZpIBw7oYIjbYFMi6qn0JM7ASlCZNkqc8rriK+JF9STUk27J4ZRS0SyL1afPjz3C47FhF4/HdwAKjhl44bvJlBXXmAKuKcW/mvLt3qPW02HtXfyI9WIKomaqT8QTnAws/I=
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
Cc: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KCkVu
YWJsaW5nIGhvc3R2bSB3aGVuIFJPSU1NVSBpcyBub3QgYWN0aXZlIHNlZW1zIHRvIGJyZWFrIEdQ
VVZNLgpUaGlzIGZpeGVzIHRoZSBpc3N1ZSBieSBub3QgZW5hYmxpbmcgaG9zdHZtIGlmIFJPSU1N
VSBpcyBub3QKYWN0aXZhdGVkLgoKU2lnbmVkLW9mZi1ieTogRG15dHJvIExha3R5dXNoa2luIDxE
bXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExha2hhIDxC
aGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgotLS0KIC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MjEvZGNuMjFfaHViYnViLmMgICB8IDQwICsrKysrKysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyNSBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfaHViYnViLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfaHViYnViLmMKaW5kZXggOGU3ZTc5
ZjQ0MjcyLi5iZDI0N2U1ZTc1M2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY24yMS9kY24yMV9odWJidWIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNuMjEvZGNuMjFfaHViYnViLmMKQEAgLTIyLDYgKzIyLDcgQEAKICAqIEF1dGhv
cnM6IEFNRAogICoKICAqLworI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+CiAjaW5jbHVkZSAiZG1f
c2VydmljZXMuaCIKICNpbmNsdWRlICJkY24yMC9kY24yMF9odWJidWIuaCIKICNpbmNsdWRlICJk
Y24yMV9odWJidWIuaCIKQEAgLTcxLDMwICs3MiwzOSBAQCBzdGF0aWMgdWludDMyX3QgY29udmVy
dF9hbmRfY2xhbXAoCiB2b2lkIGRjbjIxX2RjaHZtX2luaXQoc3RydWN0IGh1YmJ1YiAqaHViYnVi
KQogewogCXN0cnVjdCBkY24yMF9odWJidWIgKmh1YmJ1YjEgPSBUT19EQ04yMF9IVUJCVUIoaHVi
YnViKTsKKwl1aW50MzJfdCByaW9tbXVfYWN0aXZlOworCWludCBpOwogCiAJLy9Jbml0IERDSFZN
IGJsb2NrCiAJUkVHX1VQREFURShEQ0hWTV9DVFJMMCwgSE9TVFZNX0lOSVRfUkVRLCAxKTsKIAog
CS8vUG9sbCB1bnRpbCBSSU9NTVVfQUNUSVZFID0gMQotCS8vVE9ETzogRmlndXJlIG91dCBpbnRl
cnZhbCB1cyBhbmQgcmV0cnkgY291bnQKLQlSRUdfV0FJVChEQ0hWTV9SSU9NTVVfU1RBVDAsIFJJ
T01NVV9BQ1RJVkUsIDEsIDUsIDEwMCk7CisJZm9yIChpID0gMDsgaSA8IDEwMDsgaSsrKSB7CisJ
CVJFR19HRVQoRENIVk1fUklPTU1VX1NUQVQwLCBSSU9NTVVfQUNUSVZFLCAmcmlvbW11X2FjdGl2
ZSk7CiAKLQkvL1JlZmxlY3QgdGhlIHBvd2VyIHN0YXR1cyBvZiBEQ0hVQkJVQgotCVJFR19VUERB
VEUoRENIVk1fUklPTU1VX0NUUkwwLCBIT1NUVk1fUE9XRVJTVEFUVVMsIDEpOworCQlpZiAocmlv
bW11X2FjdGl2ZSkKKwkJCWJyZWFrOworCQllbHNlCisJCQl1ZGVsYXkoNSk7CisJfQorCisJaWYg
KHJpb21tdV9hY3RpdmUpIHsKKwkJLy9SZWZsZWN0IHRoZSBwb3dlciBzdGF0dXMgb2YgRENIVUJC
VUIKKwkJUkVHX1VQREFURShEQ0hWTV9SSU9NTVVfQ1RSTDAsIEhPU1RWTV9QT1dFUlNUQVRVUywg
MSk7CiAKLQkvL1N0YXJ0IHJJT01NVSBwcmVmZXRjaGluZwotCVJFR19VUERBVEUoRENIVk1fUklP
TU1VX0NUUkwwLCBIT1NUVk1fUFJFRkVUQ0hfUkVRLCAxKTsKKwkJLy9TdGFydCBySU9NTVUgcHJl
ZmV0Y2hpbmcKKwkJUkVHX1VQREFURShEQ0hWTV9SSU9NTVVfQ1RSTDAsIEhPU1RWTV9QUkVGRVRD
SF9SRVEsIDEpOwogCi0JLy8gRW5hYmxlIGR5bmFtaWMgY2xvY2sgZ2F0aW5nCi0JUkVHX1VQREFU
RV80KERDSFZNX0NMS19DVFJMLAotCQkJCQlIVk1fRElTUENMS19SX0dBVEVfRElTLCAwLAotCQkJ
CQlIVk1fRElTUENMS19HX0dBVEVfRElTLCAwLAotCQkJCQlIVk1fRENGQ0xLX1JfR0FURV9ESVMs
IDAsCi0JCQkJCUhWTV9EQ0ZDTEtfR19HQVRFX0RJUywgMCk7CisJCS8vIEVuYWJsZSBkeW5hbWlj
IGNsb2NrIGdhdGluZworCQlSRUdfVVBEQVRFXzQoRENIVk1fQ0xLX0NUUkwsCisJCQkJCQlIVk1f
RElTUENMS19SX0dBVEVfRElTLCAwLAorCQkJCQkJSFZNX0RJU1BDTEtfR19HQVRFX0RJUywgMCwK
KwkJCQkJCUhWTV9EQ0ZDTEtfUl9HQVRFX0RJUywgMCwKKwkJCQkJCUhWTV9EQ0ZDTEtfR19HQVRF
X0RJUywgMCk7CiAKLQkvL1BvbGwgdW50aWwgSE9TVFZNX1BSRUZFVENIX0RPTkUgPSAxCi0JLy9U
T0RPOiBGaWd1cmUgb3V0IGludGVydmFsIHVzIGFuZCByZXRyeSBjb3VudAotCVJFR19XQUlUKERD
SFZNX1JJT01NVV9TVEFUMCwgSE9TVFZNX1BSRUZFVENIX0RPTkUsIDEsIDUsIDEwMCk7CisJCS8v
UG9sbCB1bnRpbCBIT1NUVk1fUFJFRkVUQ0hfRE9ORSA9IDEKKwkJUkVHX1dBSVQoRENIVk1fUklP
TU1VX1NUQVQwLCBIT1NUVk1fUFJFRkVUQ0hfRE9ORSwgMSwgNSwgMTAwKTsKKwl9CiB9CiAKIGlu
dCBodWJidWIyMV9pbml0X2RjaHViKHN0cnVjdCBodWJidWIgKmh1YmJ1YiwKLS0gCjIuMTcuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
