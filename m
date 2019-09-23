Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 695F2BADCB
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 08:28:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E4756E029;
	Mon, 23 Sep 2019 06:28:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810054.outbound.protection.outlook.com [40.107.81.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF31F6E029
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 06:28:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJ3wmPE53LL+Cd51dyvbSIKld31tp/YFFsK4crz8+bqVHs7XS27LEpntr4n5b61zaa7k6+RvbVxtlERh+OrAewFw+d3q5IQo3T4G/RhtoOQ9CmwJ3oRW+jaIUdZi52abrS/xIOsF15QE3Ln+LS+41YJ6177ea9gfPAxC8DyTl0jCu3DLKGLQXeVVldT/Zn+kXvwdSm8v4LgolIIKZ/cAMNxFlQqGHygbxmXmaG1oxe+OtJodM7NgiKcjMavyTyBzQ8uF0x2FtSxe3vofw4YQ9gtoml0IgtF7vQAUr7MT3ILl1dty3tGqhyspF5V2W2S1MHHsmkLaPuWNjdTap1Xjfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iIYzhVU2pJ2OuzY/2swStO2xLxvnOjQe/vWWOdcKzAI=;
 b=gLmXoctocNFY21R0k9juvzqVigbr5lK9fwg+73aNqkS9vz7UGJUUq3BrO9lYz9A81QwK4HHIXwOc3Xz1j9v6+3H9Y5WKWtGTNIsHPHCiomB70XqfNGFMbqVBa4fSUqv+s9OudDKgTzumR8kza6w7XzrP3iqfh6AUSUCJzhnKaHVbaFVSAylVZCamy+zFWXoB7U2ybC6wevUEEKeEAuntBbJDRXi2GIpDPDeX9jhFDcmIPsnSvNo8EqhwyCRDvZmqitpfMEu/1fwY4vuNSLYU0wFopSCa4tq+Wg7qFfHqyGKbhuj4nBOWWRCgGmv3Gt5ir5c8TaVgK3luWjtG/HrJTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0023.namprd12.prod.outlook.com (2603:10b6:610:57::33)
 by MN2PR12MB4238.namprd12.prod.outlook.com (2603:10b6:208:199::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.22; Mon, 23 Sep
 2019 06:28:53 +0000
Received: from CO1NAM03FT030.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by CH2PR12CA0023.outlook.office365.com
 (2603:10b6:610:57::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20 via Frontend
 Transport; Mon, 23 Sep 2019 06:28:53 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT030.mail.protection.outlook.com (10.152.80.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2284.25 via Frontend Transport; Mon, 23 Sep 2019 06:28:53 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 23 Sep 2019 01:28:52 -0500
From: Le Ma <le.ma@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/amdgpu: disable vcn ip block for front door loading
 on Arcturus
Date: Mon, 23 Sep 2019 14:28:44 +0800
Message-ID: <1569220126-4033-1-git-send-email-le.ma@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(346002)(136003)(376002)(428003)(189003)(199004)(36756003)(2351001)(70586007)(47776003)(486006)(81166006)(8676002)(2616005)(478600001)(48376002)(8936002)(81156014)(50226002)(476003)(126002)(186003)(6666004)(70206006)(356004)(26005)(14444005)(305945005)(426003)(6916009)(316002)(4326008)(336012)(44832011)(16586007)(5660300002)(4744005)(86362001)(50466002)(51416003)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4238; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 010ae896-6df8-4e42-8f47-08d73fef4dd8
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:MN2PR12MB4238; 
X-MS-TrafficTypeDiagnostic: MN2PR12MB4238:
X-Microsoft-Antispam-PRVS: <MN2PR12MB42387D655EB8C104E54E0E8CF6850@MN2PR12MB4238.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:265;
X-Forefront-PRVS: 0169092318
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 1x/+s2emze28WM/M/oCJIeYhaV3Vm4LNl3Gio5cusoGxU3ijxT+E2vjmwqhw/76shACkFh3g6rjfK2XbM74KjXLATZn2Ojt180+HwwYFUPshAjj3EsSHIQHGcL3aLHRKxES4r80i2RRKD0Ns0lpxPlb4k8mYalIdSPKSjumhB0S5Qq7SmycNhgx0SWUdYuqf54SJKKAP8fwJEFqeE/CRj54kVjYHWuRTcKxNxBJWq3lkFbhOhd8LB6Q7P3pXlUjaqdTZLLJ41yG023q67bDe/02HhWhqZ3cyY8dMe8DC3nEqMixViAu1jTNZ3OTTVxSYkJ6gSuLei13ZiL9tQLNxgLgHRbNIkChagFRMv3SaA9jJN/6bo/TwtNuyeh0aXL3JqSIWEuC2tlwd/BI9K5UqVIpI2dgpPcsiBFU+bq1acGY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2019 06:28:53.0004 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 010ae896-6df8-4e42-8f47-08d73fef4dd8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4238
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iIYzhVU2pJ2OuzY/2swStO2xLxvnOjQe/vWWOdcKzAI=;
 b=LdthtXDgnzqvCLJ1Ijd2tw+kazCgG+9vfBAQMoemrX3ZiEPzUUERc7l0WVHYBtAJMvEBJI5WvNtDik/eDViae5qPPHEKqSGi2fPXC0ksoyo/vcGZC9/1uLzdigaaJaQwyHzwyH92i4UtOy3Nos1aTPpXhpgd8SGyt/K4zKgfcAg=
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
Cc: Le Ma <le.ma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Q2hhbmdlLUlkOiBJYmYxMzdjZDU3NjU5ZTcwNTE2YmNiYmU0NTZhMDBhZDc3ZTYwNjQ3YwpTaWdu
ZWQtb2ZmLWJ5OiBMZSBNYSA8bGUubWFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9zb2MxNS5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9z
b2MxNS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYwppbmRleCA3YzdlOWY1
Li41YmVjODUxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKQEAgLTc2MCw3ICs3NjAs
OCBAQCBpbnQgc29jMTVfc2V0X2lwX2Jsb2NrcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikK
IAkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJmdmeF92OV8wX2lwX2Jsb2NrKTsK
IAkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJnNkbWFfdjRfMF9pcF9ibG9jayk7
CiAJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZzbXVfdjExXzBfaXBfYmxvY2sp
OwotCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmdmNuX3YyXzVfaXBfYmxvY2sp
OworCQlpZiAodW5saWtlbHkoYWRldi0+ZmlybXdhcmUubG9hZF90eXBlID09IEFNREdQVV9GV19M
T0FEX0RJUkVDVCkpCisJCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmdmNuX3Yy
XzVfaXBfYmxvY2spOwogCQlicmVhazsKIAljYXNlIENISVBfUkVOT0lSOgogCQlhbWRncHVfZGV2
aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmdmVnYTEwX2NvbW1vbl9pcF9ibG9jayk7Ci0tIAoyLjcu
NAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
