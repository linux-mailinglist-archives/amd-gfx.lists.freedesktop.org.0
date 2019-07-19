Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EDB6E4E6
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jul 2019 13:18:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F896E807;
	Fri, 19 Jul 2019 11:18:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710065.outbound.protection.outlook.com [40.107.71.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B786E807
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jul 2019 11:18:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gQeW7sRxhFdeY8t0Ny0fl7HLSbpd8u5K8PxWzs++WSDscvLAHt56Z8OvWpxvwdljROtcXDA5/29ibQp44Ckkfs1cWMlAQyNkAP9mbHSWq3lWhdqKhA7CN9U3op/r+uon/MbIx9c49c7d2bjyTLSAjA7I5X4KPSrr9HjrEOLjuQAoFeIriT0ZkCUTffXv0s7g3BYiNcKlu0GktS832z36do/0T8pAL0ZKzbld3mkxabcEp6ccNDdcaVnsUhlG/feT0iJEcAASwx9POxZf1yY1zIK2hzMTfFTCa3GVzg0iUV8H5gElRDk9POMeNNqYLRi8aQsO+vwrKbKqv5Z7hSqPvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uimvkk9yQKn3hsWbqvkP+AdrL53gpX1cWv0OotnV5KI=;
 b=FC0O/chTtRNs9Zss4c31PHclVnXiSx8Wm4Rcx9qKi3w41XkzLTIos99rZ51Bes06vJdtbVriukhZVIzGcbQaTcB8UpjWtkKzvIUuw0L7Y/1iooq1aEQhXB2sQXRPq+QAOTdvqH98MDr3M7QpTFkGm5px6TUcroPLXSfx9VMSZpLgIUrFtH7PXOQdg1qtnYo41Kpc3jfMJZNwYvmMyyTfEaHfvCDO4bm4vnsoyz7q1mWtN2CeAVRl2bbEAm6L6xeG7eryoKQjBaHyuJOoX8lylr6siVF+jmDZz1v7G+elD0XX2xSRdxEE76mAwuYkTlRw1fzzqoox+pZdLivSOjV2Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR12CA0059.namprd12.prod.outlook.com (2603:10b6:300:103::21)
 by MWHPR12MB1934.namprd12.prod.outlook.com (2603:10b6:300:109::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Fri, 19 Jul
 2019 11:18:04 +0000
Received: from DM3NAM03FT050.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::208) by MWHPR12CA0059.outlook.office365.com
 (2603:10b6:300:103::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.10 via Frontend
 Transport; Fri, 19 Jul 2019 11:18:04 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT050.mail.protection.outlook.com (10.152.82.252) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Fri, 19 Jul 2019 11:18:04 +0000
Received: from hawzhang-All-Series.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Fri, 19 Jul 2019 06:18:02 -0500
From: Hawking Zhang <Hawking.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Le Ma <Le.Ma@amd.com>
Subject: [PATCH] drm/amdgpu: set sdma irq src num according to sdma instances
Date: Fri, 19 Jul 2019 19:17:57 +0800
Message-ID: <1563535077-6710-1-git-send-email-Hawking.Zhang@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(136003)(396003)(2980300002)(428003)(189003)(199004)(70586007)(14444005)(26005)(126002)(426003)(476003)(81166006)(47776003)(70206006)(81156014)(186003)(336012)(2616005)(305945005)(110136005)(8936002)(86362001)(6666004)(356004)(16586007)(36756003)(68736007)(53416004)(486006)(51416003)(50226002)(7696005)(478600001)(2906002)(316002)(4326008)(6636002)(8676002)(48376002)(5660300002)(50466002)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1934; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f055281-5353-4e99-bc93-08d70c3ac48c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1934; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1934:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1934ABDE51687F71AEC16803FCCB0@MWHPR12MB1934.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-Forefront-PRVS: 01039C93E4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: TwMoAoVnCyWK6KM06pMqCTCCaj2/Tn1NapNZLC9D4xx2lebf1DjfxRTc6d74wg4aN3HKR81osoQa1pnz3D3L2nWinhP200x3Q0eDSNTpFbmr0/uj4vKSpHTrPJPCX59HfBPadbmOIMvM3ojRuXpjPqfWj/1AZ7AbhBjsHTFLmN4zGCwCAoJvyiJM6LkzkgOht8EYxIeiXhQP3nJZakZkjEQ9xu7z5zo2pmi8XzQutG8QqsYlrdmbXmk7cUGOe0EhnGn7zlXkXS9FBmkhZy/YJNSMcoSl6USX7609kYcRoeViPAePJCWv5K+6507kmNJnB2ZDOpCuCYRm0rSCZB1FOC1IUujbbgAL7Az5+qQxbKUrv3ZfSCSJLt3MrCL76p+80TdFxybkvE3arvPJeWbzPB1MdZFHJA4nVKCSLPmLPsA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2019 11:18:04.0437 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f055281-5353-4e99-bc93-08d70c3ac48c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1934
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uimvkk9yQKn3hsWbqvkP+AdrL53gpX1cWv0OotnV5KI=;
 b=bHrIg27mSfSzPeZoJ6rrEpSLFhj51n9KWdG9YCE2EZtXVKtF7vFGwhwDfX9tDcp9ygEK+9/B1Mc9TC8XXJ+LcuSnnzr7ujn1eSu17JSMUhqAuj28vwyLdGrbyO2Y6lQ/zrGm5CAt/z0r/fTs/2MJ2EOFQlsOVBMdzvItJnNkZv4=
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
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T3RoZXJ3aXNlLCBpdCB3aWxsIGNhdXNlIGRyaXZlciBhY2Nlc3Mgbm9uLWV4aXN0aW5nIHNkbWEg
cmVnaXN0ZXJzCmluIGdwdSByZXNldCBjb2RlIHBhdGgKClNpZ25lZC1vZmYtYnk6IEhhd2tpbmcg
WmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9zZG1hX3Y0XzAuYyB8IDE3ICsrKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwg
MTUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3NkbWFfdjRfMC5jCmluZGV4IGMyMWIyNDcuLmExYzJkMjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3NkbWFfdjRfMC5jCkBAIC0yNDIxLDEwICsyNDIxLDIzIEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgYW1kZ3B1X2lycV9zcmNfZnVuY3Mgc2RtYV92NF8wX2VjY19pcnFfZnVuY3MgPSB7CiAK
IHN0YXRpYyB2b2lkIHNkbWFfdjRfMF9zZXRfaXJxX2Z1bmNzKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KQogewotCWFkZXYtPnNkbWEudHJhcF9pcnEubnVtX3R5cGVzID0gQU1ER1BVX1NETUFf
SVJRX0xBU1Q7CisJc3dpdGNoIChhZGV2LT5zZG1hLm51bV9pbnN0YW5jZXMpIHsKKwljYXNlIDE6
CisJCWFkZXYtPnNkbWEudHJhcF9pcnEubnVtX3R5cGVzID0gQU1ER1BVX1NETUFfSVJRX0lOU1RB
TkNFMTsKKwkJYWRldi0+c2RtYS5lY2NfaXJxLm51bV90eXBlcyA9IEFNREdQVV9TRE1BX0lSUV9J
TlNUQU5DRTE7CisJCWJyZWFrOworCWNhc2UgODoKKwkJYWRldi0+c2RtYS50cmFwX2lycS5udW1f
dHlwZXMgPSBBTURHUFVfU0RNQV9JUlFfTEFTVDsKKwkJYWRldi0+c2RtYS5lY2NfaXJxLm51bV90
eXBlcyA9IEFNREdQVV9TRE1BX0lSUV9MQVNUOworCQlicmVhazsKKwljYXNlIDI6CisJZGVmYXVs
dDoKKwkJYWRldi0+c2RtYS50cmFwX2lycS5udW1fdHlwZXMgPSBBTURHUFVfU0RNQV9JUlFfSU5T
VEFOQ0UyOworCQlhZGV2LT5zZG1hLmVjY19pcnEubnVtX3R5cGVzID0gQU1ER1BVX1NETUFfSVJR
X0lOU1RBTkNFMjsKKwkJYnJlYWs7CisJfQogCWFkZXYtPnNkbWEudHJhcF9pcnEuZnVuY3MgPSAm
c2RtYV92NF8wX3RyYXBfaXJxX2Z1bmNzOwogCWFkZXYtPnNkbWEuaWxsZWdhbF9pbnN0X2lycS5m
dW5jcyA9ICZzZG1hX3Y0XzBfaWxsZWdhbF9pbnN0X2lycV9mdW5jczsKLQlhZGV2LT5zZG1hLmVj
Y19pcnEubnVtX3R5cGVzID0gQU1ER1BVX1NETUFfSVJRX0xBU1Q7CiAJYWRldi0+c2RtYS5lY2Nf
aXJxLmZ1bmNzID0gJnNkbWFfdjRfMF9lY2NfaXJxX2Z1bmNzOwogfQogCi0tIAoyLjcuNAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
