Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3ACC8850C
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 23:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA446EEC6;
	Fri,  9 Aug 2019 21:38:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720065.outbound.protection.outlook.com [40.107.72.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26486EEC5
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 21:38:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hX/KKQCfK5+eMumKYgyKrDZ4sKpanrWeRRQ79c3IxsYTOq033d6h/pU06V+JAvwAUeJx7F9g/LdAWY7jsjMCZgbiVRoMhs8Gj60L8Pqt3z4z3z4Q2AaZYC4RAxtPYYi1rmO1GM/7dGnJkJYgcVX6s5hfcmKtf2FvYP6O2s3lICY6+XIacVNCbEXKHYe6BptY07+lDevjjNw6QtIo1VSZHR78sjGeRJqp3I5OSP3iL7CkY355mYCvdBRMRVzIoeWjUApoLZgSrvrCrkzHC5Sc0kgA1KulKEagY5WjMvLl/r97hECp8GGQXfn0OQyuIiv0mWmA3Dc5mMno570kZiaYvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEJwIKobBjP4U50ozQYfwZpdd0bD4swwBdEBpO2y25M=;
 b=jDOn8jsJMSUNNCaNIuvmZLSy2dl2sIGtO5nK2f+/vpII1v6iW70fLCqQP6I1bUAGXLOLOGxW8KXvOnb3LGIAGwahj+tn+WUypVCokI5aAv8Gbve93F8Koeadthxeu2npcIirFL+tWgzthvgzr8IWiW3BoXVaLXVzX2Q8nVgVHHwa+XHPKjmEHgXsF5PnYDpgehEqXrwm2Emh+2HSB6d8I44xsd44ZWQMq0Yl/JFBHVeDrF6GH/71Ih3l/e9VAIF53kQi8EtXupcJGevm6v5An1OpLh4Gbhl2DhmZm3Xq4o/FOqHP8FKAaDXO1StIRTBS4FBlWVQTWuBIjMRlvAHVOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR12CA0030.namprd12.prod.outlook.com (2603:10b6:405:70::16)
 by BN6PR12MB1265.namprd12.prod.outlook.com (2603:10b6:404:1d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.16; Fri, 9 Aug
 2019 21:38:50 +0000
Received: from DM3NAM03FT062.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::209) by BN6PR12CA0030.outlook.office365.com
 (2603:10b6:405:70::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.15 via Frontend
 Transport; Fri, 9 Aug 2019 21:38:50 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT062.mail.protection.outlook.com (10.152.83.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Fri, 9 Aug 2019 21:38:50 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Fri, 9 Aug 2019 16:38:40 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 34/49] drm/amd/display: Check if set_blank_data_double_buffer
 exists before call
Date: Fri, 9 Aug 2019 17:37:27 -0400
Message-ID: <20190809213742.30301-35-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190809213742.30301-1-sunpeng.li@amd.com>
References: <20190809213742.30301-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(136003)(346002)(376002)(2980300002)(428003)(189003)(199004)(70586007)(49486002)(6666004)(50226002)(70206006)(8936002)(356004)(81156014)(76176011)(81166006)(8676002)(48376002)(47776003)(51416003)(4326008)(6916009)(86362001)(26005)(36756003)(14444005)(2906002)(2876002)(5660300002)(446003)(11346002)(426003)(476003)(1076003)(54906003)(2351001)(186003)(53936002)(2616005)(336012)(126002)(305945005)(478600001)(2870700001)(316002)(486006)(50466002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1265; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7a6a0f9-936c-4b31-e34d-08d71d11f7bc
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1265; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1265:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1265E6BE0CDF1C87317D560C82D60@BN6PR12MB1265.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-Forefront-PRVS: 01244308DF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 8aGkWNVk+TfaeZn9EJm1Kt12M3Ta77yJYNvXBou3jCOaXdclsQBX9mCSk3yXUKWQ6ZsKCzeyHFjtmJ4ZRd8V+sSodDjRpiLcnZXQA75Jge5hrFMz1Vyu8AFMRGVWly/JXGFKRqUN1NE7GW2Ep4oc7T6jzHN+lC7c3M4+rlJl0xcoPag9/D8BkflJ41NqAkF4fJisVr5aTgwveanRnBFcbUnWYpTR0Y8MHIaqhZCtNL1yeCBeJC7kgGGOUoTG77amFXrTy9ub2bx+OxgZTNkSJjCCa22QdKZf1+Cfg7/KJkqxDdZFVBHKXNKbrEu+IGpv3Ey+Rp/xdH8mlNgpYrdGH+q1N99yc+5uXyYGldF5SFVWeBIYdmauRjpCjTtFJkJcBxH8yqJD4TTmCbWV5HPaFV+2QKg4I6Bj0LyycwbMZUg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 21:38:50.2974 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a6a0f9-936c-4b31-e34d-08d71d11f7bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1265
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEJwIKobBjP4U50ozQYfwZpdd0bD4swwBdEBpO2y25M=;
 b=EYnU+NCkb7jVvBpWRPXjrLO1WCsjMsswApFvd3J6cPaK8v4XB5CJ6lg9BMwW9wXC8oH8ekSGZ++3k5LopeJRJJqmlFKsePE2/YID7o2ugD2jO0B6suv8FHIFfl9D4qvfMpP4EHrcyxNAzRdAbcmbYYbSEe3j9JWVF7Ldj76/+vY=
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
Cc: Leo Li <sunpeng.li@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Julian Parkin <jparkin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogVml0YWx5IFByb3N5YWsgPHZpdGFseS5wcm9zeWFrQGFtZC5jb20+CgpOb3QgYWxsIEFT
SUMgdHlwZXMgaGF2ZSB0aGlzIGZ1bmN0aW9uIGltcGxlbWVudGVkIC0gY2hlY2sgYmVmb3JlCmNh
bGxpbmcuCgpTaWduZWQtb2ZmLWJ5OiBWaXRhbHkgUHJvc3lhayA8dml0YWx5LnByb3N5YWtAYW1k
LmNvbT4KUmV2aWV3ZWQtYnk6IEp1bGlhbiBQYXJraW4gPGpwYXJraW5AYW1kLmNvbT4KQWNrZWQt
Ynk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIuYyB8IDMgKystCiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jCmlu
ZGV4IGIwODYzMmJhNjIxMS4uMGE1Yzc1ZTczN2E1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHdfc2VxdWVuY2VyLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jCkBAIC03
MjAsNyArNzIwLDggQEAgc3RhdGljIHZvaWQgZmFsc2Vfb3B0Y191bmRlcmZsb3dfd2EoCiAJCWRj
LT5od3NzLndhaXRfZm9yX21wY2NfZGlzY29ubmVjdChkYywgZGMtPnJlc19wb29sLCBvbGRfcGlw
ZV9jdHgpOwogCX0KIAotCXRnLT5mdW5jcy0+c2V0X2JsYW5rX2RhdGFfZG91YmxlX2J1ZmZlcih0
ZywgdHJ1ZSk7CisJaWYgKHRnLT5mdW5jcy0+c2V0X2JsYW5rX2RhdGFfZG91YmxlX2J1ZmZlcikK
KwkJdGctPmZ1bmNzLT5zZXRfYmxhbmtfZGF0YV9kb3VibGVfYnVmZmVyKHRnLCB0cnVlKTsKIAog
CWlmICh0Zy0+ZnVuY3MtPmlzX29wdGNfdW5kZXJmbG93X29jY3VycmVkKHRnKSAmJiAhdW5kZXJm
bG93KQogCQl0Zy0+ZnVuY3MtPmNsZWFyX29wdGNfdW5kZXJmbG93KHRnKTsKLS0gCjIuMjIuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
