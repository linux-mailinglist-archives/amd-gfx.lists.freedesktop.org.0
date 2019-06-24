Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA78505E8
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 11:38:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B44F6899EA;
	Mon, 24 Jun 2019 09:38:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02on062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe45::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696D8899EA
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 09:38:23 +0000 (UTC)
Received: from BN6PR12CA0026.namprd12.prod.outlook.com (2603:10b6:405:70::12)
 by CY4PR1201MB0054.namprd12.prod.outlook.com (2603:10b6:910:1a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2008.16; Mon, 24 Jun
 2019 09:38:22 +0000
Received: from CO1NAM03FT044.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::202) by BN6PR12CA0026.outlook.office365.com
 (2603:10b6:405:70::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2008.13 via Frontend
 Transport; Mon, 24 Jun 2019 09:38:21 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT044.mail.protection.outlook.com (10.152.81.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2008.13 via Frontend Transport; Mon, 24 Jun 2019 09:38:20 +0000
Received: from prike.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server (TLS) id 14.3.389.1; Mon, 24 Jun
 2019 04:38:18 -0500
From: Prike Liang <Prike.Liang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay:clean up the residual mutex for smu_hw_init
Date: Mon, 24 Jun 2019 17:38:08 +0800
Message-ID: <1561369088-28220-1-git-send-email-Prike.Liang@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.34.1.3]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(376002)(346002)(39860400002)(396003)(2980300002)(428003)(189003)(199004)(53936002)(5660300002)(2351001)(53416004)(4326008)(47776003)(68736007)(8936002)(50226002)(81156014)(81166006)(6116002)(3846002)(50466002)(305945005)(7736002)(48376002)(2906002)(8676002)(72206003)(478600001)(7696005)(51416003)(356004)(6666004)(426003)(36756003)(186003)(336012)(86362001)(2616005)(476003)(126002)(486006)(26005)(77096007)(6916009)(316002)(16586007)(54906003)(70206006)(70586007)(16526019)(14444005)(4744005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0054; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06dfae90-3f05-45e4-65d1-08d6f887b207
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0054; 
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0054:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB00549CEAE1EB515D18494377FBE00@CY4PR1201MB0054.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 007814487B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: juVRXv8BHKuCULZgpQUuu/xmHucE1Kn/EZRLKezndXn0S60KAva3XVFYfIvCO8lIaK9wbL7QwhZyVNOrzrTXTbLbYOpFHh+bzLeLYnTX6XJXhm4+JRNfV6H1kIZtggAyWq98fwTUbqdIyCzNlJmNPhM448JPZeTMLziFHTYWOZPcXQgCcc/jbKQ3hGJaH1PMOIKRsPdd0+PiqTbytrOiQpmL2xwz2LKlriPEHXqu8fvrgUK+l6UsZlRRF8Q/8axwnRospE2pn+HlCl52ImJhVH2e/xeI6/MMK3BlNZh90nZtGRghATLzsVt5E2YSHV131diE5U6tNuKJWkqvcHBFJmFMndst46EMNph7o9clYGKvZxO7avjN9KsjuF217XJc+I8fXfi/GTJmbDF8Hhp4hbQaFDiaOa9jzj5oNVBXrQQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2019 09:38:20.6913 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06dfae90-3f05-45e4-65d1-08d6f887b207
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0054
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ju4rIGA+zkDM3KRvF9KfY28gVFFp5kO2/HXY9ixccnQ=;
 b=ZZ2fwNYBYQQX42dz+Eiws/Mk8vgmulbrQK9Ir5XQJv8Kxzir5anBiiUqZkkBIYCVrItau4fxrQPDrm/TPHrAhMLGQJq2p2S5M/sAdGq1WEOhxHUCF1xb0vTsKQLNzS161fMW2d1OOY+gcLItYa/wRcYzy/BUcn5qd72oHKlXGC0=
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
Cc: Prike Liang <Prike.Liang@amd.com>, ray.huang@amd.com, kenneth.feng@amd.com,
 Evan.Quan@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Q2hhbmdlLUlkOiBJMWYwNzFlNDY1Yzk3ZjcwMDQ4ZGY1YjI0NDY2YmM3ZTIyNTgzM2M3ZgpTaWdu
ZWQtb2ZmLWJ5OiBQcmlrZSBMaWFuZyA8UHJpa2UuTGlhbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgfCAxIC0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvYW1kZ3B1X3NtdS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3Nt
dS5jCmluZGV4IGVkZDFkYTYuLjBiZTI4NDUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9hbWRncHVfc211LmMKQEAgLTEwNDEsNyArMTA0MSw2IEBAIHN0YXRpYyBpbnQgc211X2h3
X2luaXQodm9pZCAqaGFuZGxlKQogCXJldHVybiAwOwogCiBmYWlsZWQ6Ci0JbXV0ZXhfdW5sb2Nr
KCZzbXUtPm11dGV4KTsKIAlyZXR1cm4gcmV0OwogfQogCi0tIAoyLjcuNAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
