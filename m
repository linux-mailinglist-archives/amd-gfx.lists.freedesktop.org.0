Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7822737F07
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 22:55:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1440489870;
	Thu,  6 Jun 2019 20:55:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790052.outbound.protection.outlook.com [40.107.79.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 924298986D
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2019 20:55:17 +0000 (UTC)
Received: from CY4PR12CA0034.namprd12.prod.outlook.com (2603:10b6:903:129::20)
 by BN6PR1201MB0050.namprd12.prod.outlook.com (2603:10b6:405:4e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1922.22; Thu, 6 Jun
 2019 20:55:16 +0000
Received: from DM3NAM03FT053.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by CY4PR12CA0034.outlook.office365.com
 (2603:10b6:903:129::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1965.12 via Frontend
 Transport; Thu, 6 Jun 2019 20:55:15 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT053.mail.protection.outlook.com (10.152.83.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1965.12 via Frontend Transport; Thu, 6 Jun 2019 20:55:15 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 6 Jun 2019
 15:55:05 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 05/24] drm/amd/display: 3.2.33
Date: Thu, 6 Jun 2019 16:54:42 -0400
Message-ID: <20190606205501.16505-6-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
References: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(376002)(136003)(346002)(39860400002)(2980300002)(428003)(189003)(199004)(336012)(426003)(68736007)(8936002)(6916009)(77096007)(53936002)(4326008)(70586007)(48376002)(478600001)(26005)(47776003)(486006)(476003)(51416003)(7696005)(316002)(70206006)(86362001)(50466002)(305945005)(14444005)(76176011)(11346002)(8676002)(72206003)(50226002)(53416004)(186003)(4744005)(2616005)(6666004)(81156014)(2351001)(126002)(5660300002)(16586007)(36756003)(446003)(1076003)(2906002)(356004)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0050; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39fe3dec-9bd1-4778-ed5b-08d6eac146dc
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR1201MB0050; 
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0050:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0050071F2B141ACFF9D0B813F9170@BN6PR1201MB0050.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 00603B7EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: AHuCKzP1eM22j/kw1SjaNe5MgdXtzATBc373K8gLn3MnKfgqK+yGaRvFBKnAFAmI73ffx3YadgpWOVQinbYilhR08A9tlbgJaoFnR4R8iFRexUkQfqdDyGS3FcbP5b1aS2O21SJDPeOxNFeRSr9K0osvIRNc3V15UHSmjBdEd6V9XmHv+lhSY6+nr4FqIckV+9RQF3NqTBT1wL3/LlNtZ0Q++dsSmiMwrWn5xQ2nvEszKUHS7myt3pBokFZxrg8p1hp/7IdvWhjcFBc9fkk2/I6QjwOxMae089kA3v1uie0chfHE5IdQpulggD4kN8YVDCzlp0e6QqzYzEu+JEVzjHecoymYtZ7uuD9cqXjcXzmYZhWhcefvsgxgnA8raz07b3LV/p4Jiwy8x7altwzo7avMa2roY6WTAtlDx77k+xo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2019 20:55:15.6614 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39fe3dec-9bd1-4778-ed5b-08d6eac146dc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0050
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kXtWEW9V53QxpwpcnRrfeUrFs2zL4jrOQCPtWXcPl4g=;
 b=W5rU2BzKf5RUvXNrXgqv6ie6dijlDpvCCv585ZxFXGpYE0OjD2y3UmRUO0FqiHSZfIx9kDiN+12eREERSGfezA2aybWVPVgBDgUN1XahsSPhnfZj+6kvRwJNXCndJuUYSkd8CA1CVseTFN3hbO3lufCyGk1qMDWQgD8Tc4STfd0=
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
Cc: Aric Cyr <aric.cyr@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQXJpYyBDeXIgPGFyaWMuY3lyQGFtZC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBBcmljIEN5
ciA8YXJpYy5jeXJAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFyaWMgQ3lyIDxBcmljLkN5ckBhbWQu
Y29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmggfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kYy5oCmluZGV4IDdlYzY4ODRhY2VlNC4uM2YyMjIxMjQzN2NhIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaAorKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaApAQCAtMzksNyArMzksNyBAQAogI2luY2x1ZGUgImlu
Yy9ody9kbWN1LmgiCiAjaW5jbHVkZSAiZG1sL2Rpc3BsYXlfbW9kZV9saWIuaCIKIAotI2RlZmlu
ZSBEQ19WRVIgIjMuMi4zMiIKKyNkZWZpbmUgRENfVkVSICIzLjIuMzMiCiAKICNkZWZpbmUgTUFY
X1NVUkZBQ0VTIDMKICNkZWZpbmUgTUFYX1BMQU5FUyA2Ci0tIAoyLjE3LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
