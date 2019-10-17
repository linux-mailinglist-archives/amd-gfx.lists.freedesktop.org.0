Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E9BDB73B
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 21:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264B06EAB7;
	Thu, 17 Oct 2019 19:15:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700052.outbound.protection.outlook.com [40.107.70.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C51E56EAAD
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 19:15:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YBd0wyKsatDpXk74VtTPsjLKnIKVvbGEHImcKBhPDnEbl1BUmk1hjVFtyKEQCKhSJK/K2Akpj8vyDcvRK5McyQrxD/mpyyaMQRXMgdmvRjbkivLLn+So2GhjcLKhf8mvi0t5X6shc3pVbY9Y1buGVydNkClWrgC8KBcM9x1R1Dep9BAARuaq/k6MRdnFYtCZgYauAyRT0D2bWhGpKOOGjK+EYt/puTDytEcps/Dst70veSzJd3zr+tNpYA5hXbABv1IaYUAfRBkFESmgUxuaOrdsmVTiCJxyFCb+xeHUX+1mXb3kGYDgStQlmbrCpShtwy4l8E9PGztD0dG54gkkxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tgz0pcXDFvZp8iHmRo843A2y4fTB5CJaKKLBgNL5vCk=;
 b=RwVbom/KZkyVMNrbGrdYQmP5hqNkb52k//PnggK8ATDIt1Q6Nfz+vf7YO5l4GBuPEGR+v2c4cuHzzOH03qcoVHluVSLpos1gjaKMNXxGSv2+HXJFYPIqsQ7q46TSg53PEPyPShx3k//Aq4MAPqzG+1DcIRAroqzNk9BQYJNj/sfdSbN9K3i315Ohp3IXhc/RxK5INe27ss4/RDRnBoJhjs1Y1BlRF9X/o+2E3XKJIWxkQnMpOaYFsq9X3xE3PRkUXoKCqdWgjpCqd/WZTCSFXV4wLCO7gBUWp4Fj+PTRjtob8ts59B1UNRuqFcG10z/ntaY7F5g8ukafy0ZL7egZGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN8PR12CA0024.namprd12.prod.outlook.com (2603:10b6:408:60::37)
 by CH2PR12MB3991.namprd12.prod.outlook.com (2603:10b6:610:2f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Thu, 17 Oct
 2019 19:15:49 +0000
Received: from BY2NAM03FT041.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by BN8PR12CA0024.outlook.office365.com
 (2603:10b6:408:60::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.23 via Frontend
 Transport; Thu, 17 Oct 2019 19:15:49 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BY2NAM03FT041.mail.protection.outlook.com (10.152.85.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2367.14 via Frontend Transport; Thu, 17 Oct 2019 19:15:49 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:46 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:45 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 17 Oct 2019 14:15:45 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 25/37] drm/amd/display: Disable force_single_disp_pipe_split
 on DCN2+
Date: Thu, 17 Oct 2019 15:13:17 -0400
Message-ID: <20191017191329.11857-26-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017191329.11857-1-sunpeng.li@amd.com>
References: <20191017191329.11857-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(39860400002)(396003)(376002)(428003)(199004)(189003)(6916009)(305945005)(14444005)(316002)(50466002)(36756003)(81156014)(186003)(48376002)(86362001)(81166006)(336012)(76176011)(50226002)(70586007)(51416003)(8676002)(70206006)(8936002)(54906003)(1076003)(2870700001)(2906002)(47776003)(426003)(486006)(356004)(6666004)(4326008)(478600001)(26005)(11346002)(2351001)(2616005)(476003)(126002)(446003)(5660300002)(2876002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3991; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 623048d4-0b71-46e3-e967-08d753366b83
X-MS-TrafficTypeDiagnostic: CH2PR12MB3991:
X-Microsoft-Antispam-PRVS: <CH2PR12MB399137B5200E45D414E810F6826D0@CH2PR12MB3991.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-Forefront-PRVS: 01930B2BA8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OFb1JwZZOBEUz8bFdT90Yvt/bgqgncc0w+6lCLzFq8+04t/7JQZAMF/05VBzhp/HoLqMnXTqc/a8aNa1PY21ZlSU0+F9m0uCrxCtQvjRXmEAcWA/6ac9ZjeqEJ6Dk7YuWKkFT6AkOf3XbgFVntiJgynu9/sXu0FdkS+gnkn0Kk8l6LrbSOw6/Ec+pO4lOimWaNn+Jl/gHPkJxhZ+DEIY2EKSa8jxoRYSA8JJPEJPBm2JOcQMkestDVmuzDBh5TxxvqRsYEkxdmcf3mwt0r449BLI5BFpJQMmy9Ofuh4IWENiQz7dOpNOEiUXBgHmbVuPBbxvNYAyD9TTYGiZ5jcgtla5uIsSObWefEAqgsqjdKQH6Ly788AIHx90weD+9kqAFJlOBFL/KU4LD5fj3FPl7BPz8ZBCEN0YsySW1Ixnkrw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 19:15:49.2059 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 623048d4-0b71-46e3-e967-08d753366b83
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3991
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tgz0pcXDFvZp8iHmRo843A2y4fTB5CJaKKLBgNL5vCk=;
 b=VX4+xkml2cB45CztaXNjXZpMjOwh4BD8UcabFbkDGRaOmZ6d0Z2zkkOa1tSfZgdygPURiGu4puFdT/KbodLfk5zyj01LEUMgkzEPsdAZVInFI4gE+5UNms+QZsCmVj1rLZMeJGnwCeVEw4Hpwxnc8jaOrOfmsh7l410j7I69p3g=
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
Cc: Leo Li <sunpeng.li@amd.com>, Tony Cheng <Tony.Cheng@amd.com>,
 Michael Strauss <michael.strauss@amd.com>, Charlene Liu <Charlene.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTWljaGFlbCBTdHJhdXNzIDxtaWNoYWVsLnN0cmF1c3NAYW1kLmNvbT4KCltXSFldCmZv
cmNlX3NpbmdsZV9kaXNwX3BpcGVfc3BsaXQgaXMgYSBkZWJ1ZyBmbGFnIGZvciB1c2Ugb24gRENO
MQpidXQgaXNuJ3QgbmVjZXNzYXJ5IG90aGVyd2lzZSBhcyBEQ04yKyBzcGxpdHMgYnkgZGVmYXVs
dAoKU2lnbmVkLW9mZi1ieTogTWljaGFlbCBTdHJhdXNzIDxtaWNoYWVsLnN0cmF1c3NAYW1kLmNv
bT4KUmV2aWV3ZWQtYnk6IFRvbnkgQ2hlbmcgPFRvbnkuQ2hlbmdAYW1kLmNvbT4KQWNrZWQtYnk6
IENoYXJsZW5lIExpdSA8Q2hhcmxlbmUuTGl1QGFtZC5jb20+CkFja2VkLWJ5OiBMZW8gTGkgPHN1
bnBlbmcubGlAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MjAvZGNuMjBfcmVzb3VyY2UuYyB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY24yMS9kY24yMV9yZXNvdXJjZS5jIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYwppbmRleCA4OGE5Mzg2MzNkMTEuLmEx
YjJkYjhmNjg3YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
bjIwL2RjbjIwX3Jlc291cmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjbjIwL2RjbjIwX3Jlc291cmNlLmMKQEAgLTg2Myw3ICs4NjMsNyBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IGRjX2RlYnVnX29wdGlvbnMgZGVidWdfZGVmYXVsdHNfZHJ2ID0gewogCQkuY2xvY2tf
dHJhY2UgPSB0cnVlLAogCQkuZGlzYWJsZV9wcGxpYl9jbG9ja19yZXF1ZXN0ID0gdHJ1ZSwKIAkJ
LnBpcGVfc3BsaXRfcG9saWN5ID0gTVBDX1NQTElUX0RZTkFNSUMsCi0JCS5mb3JjZV9zaW5nbGVf
ZGlzcF9waXBlX3NwbGl0ID0gdHJ1ZSwKKwkJLmZvcmNlX3NpbmdsZV9kaXNwX3BpcGVfc3BsaXQg
PSBmYWxzZSwKIAkJLmRpc2FibGVfZGNjID0gRENDX0VOQUJMRSwKIAkJLnZzcl9zdXBwb3J0ID0g
dHJ1ZSwKIAkJLnBlcmZvcm1hbmNlX3RyYWNlID0gZmFsc2UsCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfcmVzb3VyY2UuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9yZXNvdXJjZS5jCmluZGV4IGUwN2Yw
MzM2OGM5Ny4uZjE2NWY3ZTU4ZGE5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNuMjEvZGNuMjFfcmVzb3VyY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfcmVzb3VyY2UuYwpAQCAtODM2LDcgKzgzNiw3IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgZGNfZGVidWdfb3B0aW9ucyBkZWJ1Z19kZWZhdWx0c19kcnYgPSB7
CiAJCS5jbG9ja190cmFjZSA9IHRydWUsCiAJCS5kaXNhYmxlX3BwbGliX2Nsb2NrX3JlcXVlc3Qg
PSB0cnVlLAogCQkucGlwZV9zcGxpdF9wb2xpY3kgPSBNUENfU1BMSVRfQVZPSURfTVVMVF9ESVNQ
LAotCQkuZm9yY2Vfc2luZ2xlX2Rpc3BfcGlwZV9zcGxpdCA9IHRydWUsCisJCS5mb3JjZV9zaW5n
bGVfZGlzcF9waXBlX3NwbGl0ID0gZmFsc2UsCiAJCS5kaXNhYmxlX2RjYyA9IERDQ19FTkFCTEUs
CiAJCS52c3Jfc3VwcG9ydCA9IHRydWUsCiAJCS5wZXJmb3JtYW5jZV90cmFjZSA9IGZhbHNlLAot
LSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
