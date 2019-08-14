Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4828DE0D
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Aug 2019 21:48:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0E16E820;
	Wed, 14 Aug 2019 19:48:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790052.outbound.protection.outlook.com [40.107.79.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4C06E820
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 19:48:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fNL4Kjd0qTBOaH3ms5MWk8fY/rUMTSa9hs1+95w8l2xq1J02YQFPEQRG3BQzvYEGCudNbA9v8sELXu1hg+9md6stoznU7YTIFa1fEy0N3WC0VFPjtTKXZhDLkpE/W/IYvNyaY/Oo8uU5qyt52vU2Mg83X61xZFKtFRxAlP8d5E0pvX0fjRA7qcgTjMG/EYK/78wOtAGmQ+eI3zboT1jJ/SZ7fxp2BI0+dORXdkfpfyhbadiWASDMI7SSMVQa5Uc6vxXuC4VAhT6sjnY2l7aY6RKWWVj89Wa5VAzoQKFSQb8dIG/gqK/BaevbZ7h8mYt53NZnvI3JdEjDG0d3AjQDlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKPDBLBdjhb6f9DK1d0pdeEEW1uZG4D4dW/xRUgeumo=;
 b=AAQGqFdS5+agjWEl85LrxMwfV+FeFFQFKtK541NsRkLt81/1xZg2cD3AxxS5rzZp6BcG0sTYTSMcSnJ4lVr9eqq/BnietHnGb0Df6CrlLaZo+CoSK12idITX8/EsruuD03SlQ1tfgao1pXFnKqwxlOtT+6BEy10ddniyx9RngqzlNmLKbDQN/SNig9gwT77CmAQeQP1tGNhCbLG97txGYB0VLsZ42DXGdqJcSjGp/kGApuOJObe/3m1YWIK0sF88cYRCfi9Jy0SuvhcHi+YgspC4KbwP6cj6a0JrnFoL1r+rwxH4Hc15Xq+PHYt69vRv6oek2TC/mYaNUx5vcCMpfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR12CA0044.namprd12.prod.outlook.com (2603:10b6:301:2::30)
 by SN6PR12MB2717.namprd12.prod.outlook.com (2603:10b6:805:70::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.16; Wed, 14 Aug
 2019 19:48:47 +0000
Received: from DM3NAM03FT045.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by MWHPR12CA0044.outlook.office365.com
 (2603:10b6:301:2::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.16 via Frontend
 Transport; Wed, 14 Aug 2019 19:48:47 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT045.mail.protection.outlook.com (10.152.82.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 14 Aug 2019 19:48:46 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; 
 Wed, 14 Aug 2019 14:48:45 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] dmr/amdgpu: Fix compile error with
 CONFIG_DRM_AMDGPU_GART_DEBUGFS
Date: Wed, 14 Aug 2019 15:48:38 -0400
Message-ID: <1565812118-25941-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(376002)(346002)(2980300002)(428003)(189003)(199004)(36756003)(53936002)(4744005)(2351001)(4326008)(5660300002)(70206006)(70586007)(51416003)(7696005)(26005)(53416004)(86362001)(8676002)(186003)(486006)(476003)(2616005)(126002)(14444005)(81156014)(81166006)(44832011)(6916009)(2906002)(305945005)(48376002)(50466002)(336012)(426003)(478600001)(47776003)(16586007)(316002)(356004)(6666004)(8936002)(50226002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2717; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59f03f76-a931-4934-6d91-08d720f06bda
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:SN6PR12MB2717; 
X-MS-TrafficTypeDiagnostic: SN6PR12MB2717:
X-Microsoft-Antispam-PRVS: <SN6PR12MB27173B2BB165208F309009BEEAAD0@SN6PR12MB2717.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:261;
X-Forefront-PRVS: 01294F875B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 0NCB+oHSG7J2Kshnu+7CaOTV3kFn3wLCmyOpyIIxK1QUn20IJ7y4yZx5XHIVaeojCtYom59K/Zu6lYXmXwLmIdgQqrjj5s32iXgJOgo8W7AI5dw5sekfPJ2lfsKy9aCHr1fWj657VEdyZ1mT+X4zrPAc5LfZSTVHQV2FcXlxzWpipCz5HP+TzTJG48bigrjtep4wn0hIdbMDHgSlAczjFZPtRsO1LDb3cobkAYSGGaRucUxnrqRhwI6R9iH89e/eCLzLaWXAQwDMNsRcgHRL6w58aDrOKy0mwwVl5vEmnBgpo62DjY69Yxj2u4b0+koY4vbuK8wxZq5EosjzHfWhDD5tm3vpTPuQA0CC9erDErHQg9Rxj10ZG82zdRCN37zpH3OQ1AJOgxAapHsIhVq5Hg0PTYPnDwkQZAgEF9syghQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2019 19:48:46.8210 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59f03f76-a931-4934-6d91-08d720f06bda
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2717
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKPDBLBdjhb6f9DK1d0pdeEEW1uZG4D4dW/xRUgeumo=;
 b=XDugzHROroYQGfIg9MlImsjSZfzTA8cfZFmC2Y8KBS47Ev2ZrCffr5ON7uy9X2ryX8bvn37zd894h0XDgTuy8Npav2p5dPPvQ6wXX6oSmzczI5K2pHBdRSIxDMj3gGO4kja+jBsnPn2AXgUevwZnfKTHNVbSv537j4Pj+Qerq9I=
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
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RG91YmxlIGRlZmludGlvbiBvZiAnaScKClNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92c2t5
IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9nYXJ0LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZ2FydC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dhcnQuYwpp
bmRleCBhNjdmZmZmLi5mMjA0ZGJkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZ2FydC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9nYXJ0LmMKQEAgLTMwOSw3ICszMDksNyBAQCBpbnQgYW1kZ3B1X2dhcnRfYmluZChzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwgdWludDY0X3Qgb2Zmc2V0LAogCQkgICAgIHVpbnQ2NF90IGZs
YWdzKQogewogI2lmZGVmIENPTkZJR19EUk1fQU1ER1BVX0dBUlRfREVCVUdGUwotCXVuc2lnbmVk
IGksdCxwOworCXVuc2lnbmVkIHQscDsKICNlbmRpZgogCWludCByLCBpOwogCi0tIAoyLjcuNAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
