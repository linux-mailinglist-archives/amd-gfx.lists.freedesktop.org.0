Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9A72BD69
	for <lists+amd-gfx@lfdr.de>; Tue, 28 May 2019 04:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0817B89B0B;
	Tue, 28 May 2019 02:52:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740081.outbound.protection.outlook.com [40.107.74.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7CC689AB6
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 May 2019 02:52:09 +0000 (UTC)
Received: from SN1PR12CA0094.namprd12.prod.outlook.com (2603:10b6:802:21::29)
 by DM5PR1201MB0057.namprd12.prod.outlook.com (2603:10b6:4:5b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1922.18; Tue, 28 May
 2019 02:52:08 +0000
Received: from BY2NAM03FT003.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::200) by SN1PR12CA0094.outlook.office365.com
 (2603:10b6:802:21::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.15 via Frontend
 Transport; Tue, 28 May 2019 02:52:08 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT003.mail.protection.outlook.com (10.152.84.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Tue, 28 May 2019 02:52:08 +0000
Received: from zhoucm1.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Mon, 27 May 2019
 21:52:07 -0500
From: Chunming Zhou <david1.zhou@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Flora.Cui@amd.com>
Subject: [PATCH] drm/amdgpu: add DRIVER_SYNCOBJ_TIMELINE to amdgpu
Date: Tue, 28 May 2019 10:52:03 +0800
Message-ID: <20190528025203.11593-1-david1.zhou@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(346002)(396003)(376002)(2980300002)(428003)(199004)(189003)(53936002)(8936002)(2906002)(50226002)(81166006)(8676002)(81156014)(6636002)(47776003)(36756003)(86362001)(6666004)(356004)(478600001)(4326008)(305945005)(72206003)(110136005)(50466002)(68736007)(2616005)(476003)(316002)(186003)(53416004)(14444005)(126002)(70206006)(4744005)(5660300002)(486006)(26005)(70586007)(1076003)(7696005)(51416003)(77096007)(336012)(16586007)(48376002)(426003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0057; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c631071-c4cc-4d87-99c9-08d6e317798c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR1201MB0057; 
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0057:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0057CB3661032EDECA5210C6B41E0@DM5PR1201MB0057.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-Forefront-PRVS: 00514A2FE6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: UDFzEAbRcCxNv5rOdUYXlGGvZZlYqu+h+hpxwRXQrmhhVfOTlktdN83AQGtuzL5+KEYHBgRHQtrP2bmeFWRM4k1sq+XP6pS1R03s0z+UrHI52h6ZmsgrWiNpfxjV0VSc0mQJveuPCQz6yHZvUc1wX6XwSchbFeFo68J5KZRb1Xl6hgLtWZyIdsAeY51wb/gVCA/BKq9RGFvwcFgeT9mFbifFCpo8LEvR5zJnCuuZtR7ZGvImGxVyQdCib52iRrqqXRtyLG2nRejEH2JSryAn++o507zSnyU7LPJp6Fe/vVxR/1piH4O6IM4PjmDFzQ3mvwNGMAHLWugf4b1SBpt3Jpz+9E6rQ3B77G4j4uN6+aoD39XCOkW3zfdpz1PuCPsSf4T/NjdePid/idGB55QkCSYucUns6V9OAzfIu/SrLbQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2019 02:52:08.1062 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c631071-c4cc-4d87-99c9-08d6e317798c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0057
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YP5yo9Uq06X3t9duB6+Vj2ND0G/GeUqJx2kCPdUUO7I=;
 b=O0HVCO82LsgNqHjt2poIa78C1MX4YawrOikZralr0ecfAM1IOVts6bSiVaDLo/T8RwLAHYidv+zinFlnmkvw1FjC+3Mt3AtbiNNa9I8v44vV8NahFRHnNoxE8cSQmAxDD1VfYsCPQE+k1XtyIcqptGqp7NwCVxlqO7qaS2XkIdo=
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
Cc: Chunming Zhou <david1.zhou@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Q2hhbmdlLUlkOiBJMmIxYWYxNDc4ZmJkZGJiNTA4NGI5MGIzZmY4NWMyZWI5NjRiZDIxNwpTaWdu
ZWQtb2ZmLWJ5OiBDaHVubWluZyBaaG91IDxkYXZpZDEuemhvdUBhbWQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2Rydi5jCmluZGV4IDc4NzA2ZGZhNzUzYS4uMWYzOGQ2ZmMxZmUzIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCkBAIC0xMzA3LDcgKzEzMDcsOCBAQCBz
dGF0aWMgc3RydWN0IGRybV9kcml2ZXIga21zX2RyaXZlciA9IHsKIAkuZHJpdmVyX2ZlYXR1cmVz
ID0KIAkgICAgRFJJVkVSX1VTRV9BR1AgfCBEUklWRVJfQVRPTUlDIHwKIAkgICAgRFJJVkVSX0dF
TSB8Ci0JICAgIERSSVZFUl9QUklNRSB8IERSSVZFUl9SRU5ERVIgfCBEUklWRVJfTU9ERVNFVCB8
IERSSVZFUl9TWU5DT0JKLAorCSAgICBEUklWRVJfUFJJTUUgfCBEUklWRVJfUkVOREVSIHwgRFJJ
VkVSX01PREVTRVQgfCBEUklWRVJfU1lOQ09CSiB8CisJICAgIERSSVZFUl9TWU5DT0JKX1RJTUVM
SU5FLAogCS5sb2FkID0gYW1kZ3B1X2RyaXZlcl9sb2FkX2ttcywKIAkub3BlbiA9IGFtZGdwdV9k
cml2ZXJfb3Blbl9rbXMsCiAJLnBvc3RjbG9zZSA9IGFtZGdwdV9kcml2ZXJfcG9zdGNsb3NlX2tt
cywKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
