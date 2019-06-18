Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E9149F5E
	for <lists+amd-gfx@lfdr.de>; Tue, 18 Jun 2019 13:41:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E86E989F6E;
	Tue, 18 Jun 2019 11:41:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680058.outbound.protection.outlook.com [40.107.68.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB97B89F6E
 for <amd-gfx@lists.freedesktop.org>; Tue, 18 Jun 2019 11:41:11 +0000 (UTC)
Received: from CY4PR1201CA0001.namprd12.prod.outlook.com
 (2603:10b6:910:16::11) by DM5PR12MB1275.namprd12.prod.outlook.com
 (2603:10b6:3:75::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1987.12; Tue, 18 Jun
 2019 11:41:09 +0000
Received: from DM3NAM03FT044.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::208) by CY4PR1201CA0001.outlook.office365.com
 (2603:10b6:910:16::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1965.13 via Frontend
 Transport; Tue, 18 Jun 2019 11:41:09 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT044.mail.protection.outlook.com (10.152.82.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1987.11 via Frontend Transport; Tue, 18 Jun 2019 11:41:09 +0000
Received: from hawzhang-Navi-Product-U1604.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Tue, 18 Jun 2019 06:41:07 -0500
From: Hawking Zhang <Hawking.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH libdrm 2/4] libdrm/amdgpu: add new member in
 drm_amdgpu_device_info for navi10
Date: Tue, 18 Jun 2019 19:40:31 +0800
Message-ID: <1560858033-1499-2-git-send-email-Hawking.Zhang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560858033-1499-1-git-send-email-Hawking.Zhang@amd.com>
References: <1560858033-1499-1-git-send-email-Hawking.Zhang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(346002)(136003)(376002)(396003)(39860400002)(2980300002)(428003)(189003)(199004)(2616005)(426003)(11346002)(8676002)(5660300002)(68736007)(81156014)(316002)(54906003)(6916009)(5820100001)(23676004)(7696005)(47776003)(186003)(77096007)(36756003)(76176011)(72206003)(86362001)(53416004)(53936002)(356004)(336012)(476003)(4744005)(446003)(50226002)(478600001)(4326008)(126002)(50466002)(2351001)(2870700001)(26005)(2906002)(70206006)(70586007)(305945005)(486006)(81166006)(8936002)(6666004)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1275; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8f776b3-e956-4c41-c6c2-08d6f3e1db4e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1275; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1275:
X-Microsoft-Antispam-PRVS: <DM5PR12MB12757C16B5E97FE95158D485FCEA0@DM5PR12MB1275.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-Forefront-PRVS: 007271867D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: lGxkHSB2CW0pfNliHrELH5U6tP0DAYDpuDji7dujSxOiloh8maHSRsn6waTwrOczwXk4T25s2DvrsG2yN9EdkmVVzd6LjYWfy2ntRckHOZjuuZ5Dke1BtmNBTLWmq/D/JVVCk1C6w8dA72I1tO9Ay4EDucUIvXuccmwQ0RVyd8ByXfNekk1COEirxJK/pCiRotXZKm/YOpEf6lPCWF1Ep4D6b7XndqHpPdC/wO+K8c2Uw8V5GpRA+sRUPt3VolWncdDlScmBUWXi+7slNvOoV5dIk/vQe6zHzfYSLp/564pj6cCrnC9ngk8RR7/KxAISppDMiLkdqNrtkui9zRJbnPppqztr7sDOYG3JXuhnYGl/gO8R+uZEiyfxqmloTH4ugrdPQTptBGdbqjx9dI54k9w6WCjF/OBup+XdteJp+6o=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2019 11:41:09.0667 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8f776b3-e956-4c41-c6c2-08d6f3e1db4e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1275
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=szaNUn8wq8mLPcSedmc8KLp60m63fk8mXcYNJtG2BIs=;
 b=urqHW4CEXkYi5b4ENlTEX80taSKELJoanVqDMiyuQjJtvrAIbTq21wRCrnAwOU00ECAVOIPIXxxvX/tjTS/lZWESRZSNDnO3EKx4UTHdeZstiReYDyuXSWJBxz4FLRIJ/Jt2kagoJb/M8pknOcV77ALOyHmz/VEGUi7dpjCuwe0=
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

cGFfc2NfdGlsZV9zdGVlcmluZ19vdmVycmlkZSBpcyBhIG5ldyBtZW1iZXIgaW50cm9kdWNlZCBm
b3IgZ2Z4MTAKCkNoYW5nZS1JZDogSTE0ODJhNWVmMjJjYzQ1NjRlZWE2M2UwOWIxYzQwZTliZTM5
MDBlMWYKU2lnbmVkLW9mZi1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29t
PgpSZXZpZXdlZC1ieTogTWFyZWsgT2zFocOhayA8bWFyZWsub2xzYWtAYW1kLmNvbT4KLS0tCiBp
bmNsdWRlL2RybS9hbWRncHVfZHJtLmggfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vYW1kZ3B1X2RybS5oIGIvaW5jbHVkZS9k
cm0vYW1kZ3B1X2RybS5oCmluZGV4IGIyOGZlZTQuLmIwYzc1NTUgMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUvZHJtL2FtZGdwdV9kcm0uaAorKysgYi9pbmNsdWRlL2RybS9hbWRncHVfZHJtLmgKQEAgLTk5
Miw2ICs5OTIsOCBAQCBzdHJ1Y3QgZHJtX2FtZGdwdV9pbmZvX2RldmljZSB7CiAJX191NjQgaGln
aF92YV9vZmZzZXQ7CiAJLyoqIFRoZSBtYXhpbXVtIGhpZ2ggdmlydHVhbCBhZGRyZXNzICovCiAJ
X191NjQgaGlnaF92YV9tYXg7CisJLyogZ2Z4MTAgcGFfc2NfdGlsZV9zdGVlcmluZ19vdmVycmlk
ZSAqLworCV9fdTMyIHBhX3NjX3RpbGVfc3RlZXJpbmdfb3ZlcnJpZGU7CiB9OwogCiBzdHJ1Y3Qg
ZHJtX2FtZGdwdV9pbmZvX2h3X2lwIHsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
