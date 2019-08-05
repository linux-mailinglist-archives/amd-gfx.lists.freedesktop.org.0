Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5B381590
	for <lists+amd-gfx@lfdr.de>; Mon,  5 Aug 2019 11:35:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F80E89C0D;
	Mon,  5 Aug 2019 09:35:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740057.outbound.protection.outlook.com [40.107.74.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D4089C0D
 for <amd-gfx@lists.freedesktop.org>; Mon,  5 Aug 2019 09:35:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nx8p+zPvA1qag+4WWpaesfN6FkOcfP/Akh+11Qx1m+zeNVDNR33HZBVzYKfGHkoVQUoc/+3F0vOo9odWH+LIq91Pn8/F9oHa4PYotrKBpzUADRoYaCFKkzAJxq31i33aD9QnfGQZAetO2t634OMyifVMiHMRKR5HC1KRshSUn2WFySV7F4zg9PFaMYePXJ/5kkoa7KXTO5w5/urHrBvGq+u8L3A/k0XJVaD5nueAO2D6f+OOaeMk0eP80Ij3b4rRCWNMrTv3q5MDPVnAKDz+rNPAeJm9Pnb0eKmd/dtfnD+M6ahQzZ0BcZA5kjbdZnZToleJnTuq4XaD4ULiAZcG1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5QixRT113/+Kriecar7jQVplZC2aGgMo4MIubtVXmfY=;
 b=TEdjVG0R+apCorkrheASWPGRvT6YhHZr0kyNeL24v6G29haLMfxLp7Et4QuqAXVpWl7ITWcbFp5e4/tFvNSyn9KIskYTZDSUJZONZXQXVa107epBMpg0kV2YzM2DTT7koDFCsOKZthbDUBjvqSyTQf9FfmEbpQmoN52bQy8ttouJT62uiSGI+C6cN97L2QJvPY7KQwLQRokWO0mCFh5D/FKwgwMJklkN4aUhudLjZ/KUim6ZItyhHRrS53TN6HZyieupJsDZa6IBcKlmY6IiL2XFyRGgais/qqfVVrhqwOyvciavqGJ1DeEp4+s8EadoJg+GAGAH6QvxVmBo9Sc8qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR12CA0039.namprd12.prod.outlook.com (2603:10b6:301:2::25)
 by DM5PR12MB1609.namprd12.prod.outlook.com (2603:10b6:4:10::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.20; Mon, 5 Aug
 2019 09:35:32 +0000
Received: from CO1NAM03FT047.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by MWHPR12CA0039.outlook.office365.com
 (2603:10b6:301:2::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.12 via Frontend
 Transport; Mon, 5 Aug 2019 09:35:32 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT047.mail.protection.outlook.com (10.152.81.48) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Mon, 5 Aug 2019 09:35:32 +0000
Received: from rico-code.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Mon, 5 Aug 2019
 04:35:30 -0500
From: Tianci Yin <tianci.yin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/soc15: fix external_rev_id for navi14
Date: Mon, 5 Aug 2019 17:35:23 +0800
Message-ID: <1564997723-3737-1-git-send-email-tianci.yin@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(2980300002)(428003)(189003)(199004)(70586007)(2351001)(4326008)(70206006)(81166006)(8936002)(50226002)(81156014)(68736007)(478600001)(356004)(86362001)(6666004)(36756003)(2906002)(53416004)(16586007)(54906003)(14444005)(6916009)(4744005)(316002)(51416003)(7696005)(48376002)(336012)(426003)(50466002)(47776003)(5660300002)(8676002)(486006)(2616005)(476003)(44832011)(305945005)(26005)(53936002)(186003)(126002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1609; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61cc3b60-6af9-49fb-3e74-08d7198842cf
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1609; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1609:
X-Microsoft-Antispam-PRVS: <DM5PR12MB16098E0D30FC0C56A94390A395DA0@DM5PR12MB1609.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:765;
X-Forefront-PRVS: 01208B1E18
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: BH3/OsL0RQiaTxcDp1yjN9UdhjRsw4gzu7D04RW1beKnezMCxe64SFC6j361iEoZmvL/MaxTFSWjuk120oDXHU/sgOw6W2yf5ON+NR+1cxZ74WY2XXxzddwdEwnkeZmvFk8vhcq5xX9+N4yk8sfgcoF0zWm1IT9gnK97obT/HYxhZ0IvWGIFR/+P+vHEJBnnFqgiXcQ87bNQ2aGi1F5V7xyUxjiSw4RMA6ESBBEMopshL1USyOx+jNpDpnIgGiYg6zd+U8219Y45NdUioevMOL3Y2XZ+Fzv9MONJzpB5Ie8L0XY8joATWmCTponKeUSFpU+v4LPxjlIi8PRCJzB1eiTzo5l9QizvT1lftfD1wkf5iIdwvuF+YlhH7luU9nXamLGrMHMgj7oMAlQJMbEXz/lyhsQNufiSillkxh7EHKw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2019 09:35:32.1387 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61cc3b60-6af9-49fb-3e74-08d7198842cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1609
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5QixRT113/+Kriecar7jQVplZC2aGgMo4MIubtVXmfY=;
 b=m7gudIXSq9sJnCxXgSnX58OsAfvekKNLs6eCJE+L1ppHrSYWk8q8S2n6issnRCb4BjooeFgQtuXulfT5bJFXITsE71m1PWV3IJ6ZMKpe2Cj00aSm+0YZvr223QeeLgu8NMwuqfNtuKpPtpm4CuZudN8cirjlMaQsXsUIJ9w0g9s=
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
Cc: Jack Xiao <Jack.Xiao@amd.com>, Xiaojie Yuan <xiaojie.yuan@amd.com>,
 Tianci Yin <tianci.yin@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogdGlhbmN5aW4gPHRpYW5jaS55aW5AYW1kLmNvbT4KCmZpeCB0aGUgaGFyZCBjb2RlIGV4
dGVybmFsX3Jldl9pZC4KCkNoYW5nZS1JZDogSTdiNDZmN2I0OWI2ZDA1ODZkMWZhMjgyZDQ5NjE4
MTVmYjEyNDM3OWIKU2lnbmVkLW9mZi1ieTogdGlhbmN5aW4gPHRpYW5jaS55aW5AYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvbnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMK
aW5kZXggOWJjZTZhMS4uMmY0NWJmMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvbnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCkBAIC01NDYs
NyArNTQ2LDcgQEAgc3RhdGljIGludCBudl9jb21tb25fZWFybHlfaW5pdCh2b2lkICpoYW5kbGUp
CiAJCQlBTURfQ0dfU1VQUE9SVF9CSUZfTFM7CiAJCWFkZXYtPnBnX2ZsYWdzID0gQU1EX1BHX1NV
UFBPUlRfVkNOIHwKIAkJCUFNRF9QR19TVVBQT1JUX1ZDTl9EUEc7Ci0JCWFkZXYtPmV4dGVybmFs
X3Jldl9pZCA9IDIwOworCQlhZGV2LT5leHRlcm5hbF9yZXZfaWQgPSBhZGV2LT5yZXZfaWQgKyAy
MDsKIAkJYnJlYWs7CiAJZGVmYXVsdDoKIAkJLyogRklYTUU6IG5vdCBzdXBwb3J0ZWQgeWV0ICov
Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
