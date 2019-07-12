Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96437666A4
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jul 2019 07:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3A16E2C4;
	Fri, 12 Jul 2019 05:51:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790087.outbound.protection.outlook.com [40.107.79.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A1EB6E2C4
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jul 2019 05:51:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h8v128vN7xOFuHjd7J4pYYY2E1Y/vMJOo+QogHrbaFf5mVpXyPkTxDBwxpZtfWCpbQc7pd+NlKMTl/EXujbEXxIGMm+S5J/xaGOurWwiv2BEh9+yjEDQ+PwD3e5PP3lVv3Mb1WTmJX/orHp/I6s6OO5X5Z8cQBD9wPlgcAEh3LmpUW1zlv1I3cyVsRXzbCT24fxXG4IFYmdbS4sjc0rIpN/AU9lZNwUduGKPyfpY3F0V2wrDcAkxxV+Oppwj79rirg0QVh0O5moQfkGRdVGgk7O7AZY1XXx9t14lDQFAcl1E+M5opC7n9W8D7rI6wNByfZKeLJ5TJafS+3nQXFYfhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8BHW5Zhqr3Uykiyw6YY1TOf86cOjI8IFEPjTddBxng=;
 b=YvGoK9ZG8QYQG0QXFUynefWMuUlCMX35+LUVEzKxc4O9mZl2PBUW1VxDlNqSAn3poSIDlEqut34JXV/+IiT4SPdbYGb3RGn81X45NNOo1L+Ji07pHYZySBBd+X/jRsgP3IkqaV5VuUnEPmvM+/rUaY4/54cCpByXDyxY5k0wUGhLeiiZMT6nnFDOxzYLcmoTEtfQ9c5DO9CGIKf5SWMrEgtWnYfT/YCAqo4xf1mCw1DvLzc/w12n/zA1qE/4LazGqRcvCiVPct+S1M6DPFeDaQ+vFhiXviH1IyMojxtZnxOXr+3rZwdWLQOvno+XcG4tBolklxvnsP2fp+EKhB6/GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CY4PR1201CA0017.namprd12.prod.outlook.com
 (2603:10b6:910:16::27) by BN8PR12MB3092.namprd12.prod.outlook.com
 (2603:10b6:408:67::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Fri, 12 Jul
 2019 05:51:03 +0000
Received: from CO1NAM03FT061.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::201) by CY4PR1201CA0017.outlook.office365.com
 (2603:10b6:910:16::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.11 via Frontend
 Transport; Fri, 12 Jul 2019 05:51:02 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT061.mail.protection.outlook.com (10.152.81.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Fri, 12 Jul 2019 05:51:02 +0000
Received: from build-machine.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Fri, 12 Jul 2019
 00:51:00 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: fix deadlock around smu_handle_task V2
Date: Fri, 12 Jul 2019 13:50:54 +0800
Message-ID: <20190712055054.22119-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(376002)(346002)(2980300002)(428003)(189003)(199004)(44832011)(48376002)(126002)(86362001)(186003)(4326008)(6666004)(356004)(50466002)(7696005)(51416003)(2616005)(47776003)(2351001)(26005)(486006)(476003)(53936002)(336012)(14444005)(426003)(6916009)(54906003)(305945005)(81156014)(53416004)(478600001)(1076003)(2906002)(5660300002)(36756003)(68736007)(316002)(81166006)(8936002)(8676002)(50226002)(70586007)(2870700001)(70206006)(4744005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3092; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fb6940d-b959-4b9a-c970-08d7068cec2e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN8PR12MB3092; 
X-MS-TrafficTypeDiagnostic: BN8PR12MB3092:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3092BEC53C35E2708475A3AEE4F20@BN8PR12MB3092.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 00963989E5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Gz0xTFGR9ch1izK6yOHNxuvbZ78gaUhc3uNK2FTEeBiqmm5WMviIf8azs/I46r5WAlgwUFVOYRMepuQnaR+aohopjbTqnbcf4izVGWK0WxNn6Jqlv8BxBqVK9+eCaznAgH+l+OHApWJqGte6P84tEJ4OHV1gLhzo2XlqnXLYDzQVGV5Am1QQI76z21/Eo1CEubmW9TAT2tokJMwrLvKIuB9kJuqCHG7puw/eABF73rpYinEpWWspLpJnoVIMufDZNZ/pVUF61xvW3Oki5CfRN0BgVNWeoeWgarJGG2kQMaRuS/afsgS0LI9YY1PAC3t43w0KHknADx6LjiSywoYh7gdTicCuC1OSBMDRizJ1dqMvQiBMfE8ptjbjCeWQfEYt8b4eGA+Qj23+MSF/kd5O4UcpSwEqUBaglBr2V/92s24=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2019 05:51:02.1469 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb6940d-b959-4b9a-c970-08d7068cec2e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3092
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8BHW5Zhqr3Uykiyw6YY1TOf86cOjI8IFEPjTddBxng=;
 b=JY0npCT6xDskocqB+D+08vCE3YFfsHBqySavCENoJUvfzb23OnKGQjip1i/t8yIGt8iVveF6Mf1avIs1DT3JAMDlvL4T49CiefxT7wJhDkghQE+Cp/gebHiKaEio3laYPS3BJIm0SW5Q515U1WtloUDZ0R0MJCjCc3p5+mhFEUk=
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
Cc: Kevin1.Wang@amd.com, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QXMgdGhlIGxvY2sgd2FzIGFscmVhZHkgaGVsZCBvbiB0aGUgZW50cmFuY2UgdG8gc211X2hhbmRs
ZV90YXNrLgoKLSBWMjogbG9jayBpbiBzbWFsbCBncmFudWxhcml0eQoKQ2hhbmdlLUlkOiBJNTM4
OGFhOTE3ZWYwZTMzMDk3NGUyNmM1OWRiNDJkMTM1NGI2YTg2NQpTaWduZWQtb2ZmLWJ5OiBFdmFu
IFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9wbS5jIHwgMiAtLQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYwppbmRleCA5NjFmNGU1NGVkMTguLmViMjU1
YTZiZDNhOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Bt
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmMKQEAgLTMwNDks
MTEgKzMwNDksOSBAQCB2b2lkIGFtZGdwdV9wbV9jb21wdXRlX2Nsb2NrcyhzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldikKIAlpZiAoaXNfc3VwcG9ydF9zd19zbXUoYWRldikpIHsKIAkJc3RydWN0
IHNtdV9jb250ZXh0ICpzbXUgPSAmYWRldi0+c211OwogCQlzdHJ1Y3Qgc211X2RwbV9jb250ZXh0
ICpzbXVfZHBtID0gJmFkZXYtPnNtdS5zbXVfZHBtOwotCQltdXRleF9sb2NrKCYoc211LT5tdXRl
eCkpOwogCQlzbXVfaGFuZGxlX3Rhc2soJmFkZXYtPnNtdSwKIAkJCQlzbXVfZHBtLT5kcG1fbGV2
ZWwsCiAJCQkJQU1EX1BQX1RBU0tfRElTUExBWV9DT05GSUdfQ0hBTkdFKTsKLQkJbXV0ZXhfdW5s
b2NrKCYoc211LT5tdXRleCkpOwogCX0gZWxzZSB7CiAJCWlmIChhZGV2LT5wb3dlcnBsYXkucHBf
ZnVuY3MtPmRpc3BhdGNoX3Rhc2tzKSB7CiAJCQlpZiAoIWFtZGdwdV9kZXZpY2VfaGFzX2RjX3N1
cHBvcnQoYWRldikpIHsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
