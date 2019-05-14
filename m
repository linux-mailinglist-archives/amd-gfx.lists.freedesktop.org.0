Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FD81C0ED
	for <lists+amd-gfx@lfdr.de>; Tue, 14 May 2019 05:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C0F58924C;
	Tue, 14 May 2019 03:35:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690059.outbound.protection.outlook.com [40.107.69.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D2C8924C
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 May 2019 03:35:23 +0000 (UTC)
Received: from BN6PR1201CA0017.namprd12.prod.outlook.com
 (2603:10b6:405:4c::27) by BN6SPR00MB03.namprd12.prod.outlook.com
 (2603:10b6:404:b3::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1878.22; Tue, 14 May
 2019 03:35:21 +0000
Received: from DM3NAM03FT061.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::207) by BN6PR1201CA0017.outlook.office365.com
 (2603:10b6:405:4c::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1900.16 via Frontend
 Transport; Tue, 14 May 2019 03:35:21 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT061.mail.protection.outlook.com (10.152.83.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Tue, 14 May 2019 03:35:21 +0000
Received: from gamma.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Mon, 13 May 2019
 22:35:20 -0500
From: Tiecheng Zhou <Tiecheng.Zhou@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/sriov: Need to initialize the HDP_NONSURFACE_BAStE
Date: Tue, 14 May 2019 11:34:56 +0800
Message-ID: <1557804896-4032-1-git-send-email-Tiecheng.Zhou@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(376002)(396003)(39860400002)(136003)(2980300002)(428003)(199004)(189003)(81166006)(356004)(6666004)(81156014)(70586007)(70206006)(54906003)(305945005)(68736007)(5660300002)(50226002)(8676002)(316002)(16586007)(53936002)(4326008)(2906002)(8936002)(86362001)(4744005)(47776003)(7696005)(51416003)(336012)(426003)(36756003)(126002)(486006)(2616005)(476003)(2351001)(186003)(26005)(77096007)(50466002)(48376002)(478600001)(53416004)(6916009)(72206003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6SPR00MB03; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd8917c7-885f-4d35-156d-08d6d81d3164
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BN6SPR00MB03; 
X-MS-TrafficTypeDiagnostic: BN6SPR00MB03:
X-Microsoft-Antispam-PRVS: <BN6SPR00MB0331443FD561072861068DE4080@BN6SPR00MB03.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-Forefront-PRVS: 0037FD6480
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: XMGCsG6JAD11josTS1ZqHIPB2cJTq1yhjC/OGNjHHEH856FkCgtlqLSqAj4W1od3IjrmpZMs+KdkTlNZIin/64/SR7XC+9yge+8QX2JIlEhkezo1K05dlbYwJq35FeUGI1HboGnPSqC+/7AJkqguMX5pDQUbcOB07rw6ayC6pXZXN/S1ngFpqoHTtmAlx1osFzChQ928733hsCUsh3T1SEG7DsZdr/k/Qaq6Bs6aEhRISKGsl56LOsQx1t6odDhUB97Udg57Mldrb7EXzI1/Y3DuoVitIPqrKq11XX0BQHWsLoTX52SfRzBzk5Fj974zx4eRUElsptndfd1NIGCJAYyPlS3Hh7mEM443LEhV1ibjhzw7zjJWXunm5PLBf32LemtGan95sHkQ96Or3SWu2VqQ4CZsuQFNlyocaG8TzNU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2019 03:35:21.2542 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd8917c7-885f-4d35-156d-08d6d81d3164
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6SPR00MB03
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/TzQJdEncEliEzxiyjH8jaSkSsTT5WtEOG3y5MWwxxE=;
 b=iNouA+FmBGU7DqK/Xd/iuaDkYO2Ezv5/jASryp1XT9R1XWkjE1dr05BZQRwiGXPuU2HLgia/JkPgCMw4F5FQ/44zV6jR2XR/OCX3lJnGI3aFfZPEl7fX1R1v/S5XyxL1L2VrkwBg54STJ2MmqWIMk1VjvkXIlaEw+Ykqh9BBbYE=
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
Cc: Tiecheng Zhou <Tiecheng.Zhou@amd.com>, Emily Deng <Emily.Deng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

aXQgcmVxdWlyZXMgdG8gaW5pdGlhbGl6ZSBIRFBfTk9OU1VSRkFDRV9CQVNFLCBzbyBhcyB0byBh
dm9pZAp1c2luZyB0aGUgdmFsdWUgbGVmdCBieSBhIHByZXZpb3VzIFZNIHVuZGVyIHNyaW92IHNj
ZW5hcmlvLgoKU2lnbmVkLW9mZi1ieTogRW1pbHkgRGVuZyA8RW1pbHkuRGVuZ0BhbWQuY29tPgpT
aWduZWQtb2ZmLWJ5OiBUaWVjaGVuZyBaaG91IDxUaWVjaGVuZy5aaG91QGFtZC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyB8IDUgKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nbWNfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAu
YwppbmRleCBiZTcyOWU3Li5lOTY2ODRlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nbWNfdjlfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192
OV8wLmMKQEAgLTExODEsNiArMTE4MSwxMSBAQCBzdGF0aWMgaW50IGdtY192OV8wX2dhcnRfZW5h
YmxlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCXRtcCA9IFJSRUczMl9TT0MxNShIRFAs
IDAsIG1tSERQX0hPU1RfUEFUSF9DTlRMKTsKIAlXUkVHMzJfU09DMTUoSERQLCAwLCBtbUhEUF9I
T1NUX1BBVEhfQ05UTCwgdG1wKTsKIAorCWlmIChhbWRncHVfc3Jpb3ZfdmYoYWRldikpIHsKKwkJ
V1JFRzMyX1NPQzE1KEhEUCwgMCwgbW1IRFBfTk9OU1VSRkFDRV9CQVNFLCAoYWRldi0+Z21jLnZy
YW1fc3RhcnQgPj4gOCkpOworCQlXUkVHMzJfU09DMTUoSERQLCAwLCBtbUhEUF9OT05TVVJGQUNF
X0JBU0VfSEksIChhZGV2LT5nbWMudnJhbV9zdGFydCA+PiA0MCkpOworCX0KKwogCS8qIEFmdGVy
IEhEUCBpcyBpbml0aWFsaXplZCwgZmx1c2ggSERQLiovCiAJYWRldi0+bmJpb19mdW5jcy0+aGRw
X2ZsdXNoKGFkZXYsIE5VTEwpOwogCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
