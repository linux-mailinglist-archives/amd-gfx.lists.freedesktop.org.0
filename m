Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FDD69DAB
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 721D789C1E;
	Mon, 15 Jul 2019 21:21:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810072.outbound.protection.outlook.com [40.107.81.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2D4089C18
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rpix18H2sUGkOVB+t2A56d9yp7lkn3VOfIaBz/mCP1089wY8Yk0m1RusTV/hHYAoB7UG1GhFa8dQjKUlIygOAQ7KvvWt9E7YIqmamzzzeFgjAoNFRJ2LIKPasrqrJcKKvRF9ghBuqc7bMUIq/MtD15u94JTVsKScdLgywdUvbQaApqGpQu1IJKh5bWrbmd4oOCWbvZojJrNfifcClbVyKN9+cuSpq1+r+BBYlHSOdWxjhSVzvi3dCcvJQzezRWdSzs1erbqtBQnahc7DkC22DkqxZOWhK7neQGyaHLiRJ9c9VdHXR/DuzhwMerH8VW+A2CTEdXduK4UN00/NktwGeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ns2YltPCumC3G4Y28BalghRT00Z48dIZ33n/k8HK0KA=;
 b=ROTYdzTXvBLYNeWmyZCBh60JKa513s18+hJFyy4wtmi9YlTyDX81oj25xAvtLmwgv2YLvSnGSpDoMrRgyjRCV/zfEslpujouUiqZZddfRFds4idHy2xvn2TiS5Lg21euZJZ1rkfIelsQkgPLoO2wYA6/bfIdHmOBy2Qjw6KOhTjV2Uvy1FZad0+pVDBKpzULzOIuN0t+Pz6y2jyf22MD59Trk7huudjHJEhByOwAdzQnvNcP2eddfHUo6xO7GiSEfLOxawdTmIisOu+jq6lPA7Uk9UIz7iz/OQMTipPSc3opzJq/UwqiV/coZZgYOV+INrtgUMQoKmzIajxwm9JMJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM5PR12CA0003.namprd12.prod.outlook.com (2603:10b6:4:1::13) by
 BN8PR12MB3090.namprd12.prod.outlook.com (2603:10b6:408:67::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Mon, 15 Jul 2019 21:21:30 +0000
Received: from CO1NAM03FT028.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::201) by DM5PR12CA0003.outlook.office365.com
 (2603:10b6:4:1::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.10 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:30 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT028.mail.protection.outlook.com (10.152.80.189) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:29 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:18 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 27/87] drm/amd/display: Poll for GPUVM context ready
Date: Mon, 15 Jul 2019 17:19:49 -0400
Message-ID: <20190715212049.4584-28-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(396003)(136003)(2980300002)(428003)(189003)(199004)(426003)(478600001)(2876002)(47776003)(336012)(36756003)(5660300002)(316002)(50466002)(53936002)(2906002)(186003)(48376002)(49486002)(4326008)(2870700001)(68736007)(486006)(305945005)(26005)(1076003)(54906003)(2351001)(2616005)(6916009)(51416003)(86362001)(14444005)(81156014)(81166006)(50226002)(126002)(8936002)(476003)(11346002)(446003)(8676002)(70586007)(76176011)(356004)(70206006)(6666004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3090; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 971d1c96-a064-47cc-5950-08d7096a675d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN8PR12MB3090; 
X-MS-TrafficTypeDiagnostic: BN8PR12MB3090:
X-Microsoft-Antispam-PRVS: <BN8PR12MB30908E786C3EE49538E977FC82CF0@BN8PR12MB3090.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: sLR5Yu+KJWe23XWjw7p4D1kmJ88VAm23U1ss7qGQUZ2MBt1ec9DhGPemnUHI2hguojnecttv5P35DZNUoVKcP1JatkXXXh6+byBmGI3RYxjSqubrQ2PMyAAnFU6nz/tuar0PTxnTZqc8W61Wj7JlHcDnVSZXZioyfXwDXr72JR8r5apkgXzik9TFSfKAHyGj8f9HYraMk1LHWhSut4S1Z8FNUn4BHDWzDZyCh3VGwHWesDNN7MtvVCvsGFY3/j+r5y8EmllwMgIJbgd3KU1QYeGSWfnFOHuXoSiGBeXDJuLMoYs6D5n5QdiKcbhMMorNeRbsQ5WDOqAgi/2u4EFxRVC3A0vr2/3FLL3TO2UE2lPcaZJzdEmu6F8Ue2PNunM/qPz0N9vzsFcQ1/FF71BwPoLQ8H2VR5FdmtAmKnXc/sk=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:29.9627 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 971d1c96-a064-47cc-5950-08d7096a675d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3090
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ns2YltPCumC3G4Y28BalghRT00Z48dIZ33n/k8HK0KA=;
 b=IfnlClmMxkqlMhJn3YLHuC0BLdhGqae4b2nTE4G7LuCEWxK9FMPl1Jcgigvjso2Kl/gZAe4IQDEJJogvmv1PCKOtfscPvMJFCCGEere8q4cdh4LxZhA4H87wlCxT4ZY5Se+CLUgVzlNfgGBOTD9/Yey+tu+faDA+UFT4gjrs9t0=
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
Cc: Leo Li <sunpeng.li@amd.com>, Charlene Liu <Charlene.Liu@amd.com>,
 Julian Parkin <julian.parkin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSnVsaWFuIFBhcmtpbiA8anVsaWFuLnBhcmtpbkBhbWQuY29tPgoKW1doeV0KSGFyZHdh
cmUgZG9jcyBzdGF0ZSB0aGF0IHdlIG11c3Qgd2FpdCB1bnRpbCB0aGUgR1BVVk0gY29udGV4dCBp
cyByZWFkeQphZnRlciBwcm9ncmFtbWluZyBpdC4KCltIb3ddClBvbGwgdW50aWwgdGhlIHZhbGlk
IGJpdCBvZiBQQUdFX1RBQkxFX0JBU0VfQUREUl9MTzMyIGlzIHNldCB0byAxIGFmdGVyCnByb2dy
YW1taW5nIGl0LgoKU2lnbmVkLW9mZi1ieTogSnVsaWFuIFBhcmtpbiA8anVsaWFuLnBhcmtpbkBh
bWQuY29tPgpSZXZpZXdlZC1ieTogQ2hhcmxlbmUgTGl1IDxDaGFybGVuZS5MaXVAYW1kLmNvbT4K
QWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgotLS0KIC4uLi9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3ZtaWQuYyB8IDM1ICsrKysrKysrKysrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3ZtaWQuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF92bWlkLmMKaW5kZXggMjc2NzllZjZlYmU4Li44
NDUxMmU2NDZmODcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y24yMC9kY24yMF92bWlkLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
bjIwL2RjbjIwX3ZtaWQuYwpAQCAtMzYsNiArMzYsMzggQEAKICNkZWZpbmUgRk4ocmVnX25hbWUs
IGZpZWxkX25hbWUpIFwKIAl2bWlkLT5zaGlmdHMtPmZpZWxkX25hbWUsIHZtaWQtPm1hc2tzLT5m
aWVsZF9uYW1lCiAKK3N0YXRpYyB2b2lkIGRjbjIwX3dhaXRfZm9yX3ZtaWRfcmVhZHkoc3RydWN0
IGRjbjIwX3ZtaWQgKnZtaWQpCit7CisJLyogQWNjb3JkaW5nIHRoZSBoYXJkd2FyZSBzcGVjLCB3
ZSBuZWVkIHRvIHBvbGwgZm9yIHRoZSBsb3dlc3QKKwkgKiBiaXQgb2YgUEFHRV9UQUJMRV9CQVNF
X0FERFJfTE8zMiA9IDEgYW55IHRpbWUgYSBHUFVWTQorCSAqIGNvbnRleHQgaXMgdXBkYXRlZC4g
V2UgY2FuJ3QgdXNlIFJFR19XQUlUIGhlcmUgc2luY2Ugd2UKKwkgKiBkb24ndCBoYXZlIGEgc2Vw
ZXJhdGUgZmllbGQgdG8gd2FpdCBvbi4KKwkgKgorCSAqIFRPRE86IENvbmZpcm0gdGltZW91dCAv
IHBvbGwgaW50ZXJ2YWwgd2l0aCBoYXJkd2FyZSB0ZWFtCisJICovCisKKwlpbnQgbWF4X3RpbWVz
ID0gMTAwMDA7CisJaW50IGRlbGF5X3VzICA9IDU7CisJaW50IGk7CisKKwlmb3IgKGkgPSAwOyBp
IDwgbWF4X3RpbWVzOyArK2kpIHsKKwkJdWludDMyX3QgZW50cnlfbG8zMjsKKworCQlSRUdfR0VU
KFBBR0VfVEFCTEVfQkFTRV9BRERSX0xPMzIsCisJCQlWTV9DT05URVhUMF9QQUdFX0RJUkVDVE9S
WV9FTlRSWV9MTzMyLAorCQkJJmVudHJ5X2xvMzIpOworCisJCWlmIChlbnRyeV9sbzMyICYgMHgx
KQorCQkJcmV0dXJuOworCisJCXVkZWxheShkZWxheV91cyk7CisJfQorCisJLyogVk0gc2V0dXAg
dGltZWQgb3V0ICovCisJRENfTE9HX1dBUk5JTkcoIlRpbWVvdXQgd2hpbGUgd2FpdGluZyBmb3Ig
R1BVVk0gY29udGV4dCB1cGRhdGVcbiIpOworCUFTU0VSVCgwKTsKK30KKwogdm9pZCBkY24yMF92
bWlkX3NldHVwKHN0cnVjdCBkY24yMF92bWlkICp2bWlkLCBjb25zdCBzdHJ1Y3QgZGNuX3ZtaWRf
cGFnZV90YWJsZV9jb25maWcgKmNvbmZpZykKIHsKIAlSRUdfU0VUKFBBR0VfVEFCTEVfU1RBUlRf
QUREUl9ISTMyLCAwLApAQCAtNTQsNiArODYsOSBAQCB2b2lkIGRjbjIwX3ZtaWRfc2V0dXAoc3Ry
dWN0IGRjbjIwX3ZtaWQgKnZtaWQsIGNvbnN0IHN0cnVjdCBkY25fdm1pZF9wYWdlX3RhYmxlXwog
CiAJUkVHX1NFVChQQUdFX1RBQkxFX0JBU0VfQUREUl9ISTMyLCAwLAogCQkJVk1fQ09OVEVYVDBf
UEFHRV9ESVJFQ1RPUllfRU5UUllfSEkzMiwgKGNvbmZpZy0+cGFnZV90YWJsZV9iYXNlX2FkZHIg
Pj4gMzIpICYgMHhGRkZGRkZGRik7CisJLyogTm90ZTogcGVyIGhhcmR3YXJlIHNwZWMgUEFHRV9U
QUJMRV9CQVNFX0FERFJfTE8zMiBtdXN0IGJlIHByb2dyYW1tZWQgbGFzdCBpbiBzZXF1ZW5jZSAq
LwogCVJFR19TRVQoUEFHRV9UQUJMRV9CQVNFX0FERFJfTE8zMiwgMCwKIAkJCVZNX0NPTlRFWFQw
X1BBR0VfRElSRUNUT1JZX0VOVFJZX0xPMzIsIGNvbmZpZy0+cGFnZV90YWJsZV9iYXNlX2FkZHIg
JiAweEZGRkZGRkZGKTsKKworCWRjbjIwX3dhaXRfZm9yX3ZtaWRfcmVhZHkodm1pZCk7CiB9Ci0t
IAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
