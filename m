Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 289443C1FD
	for <lists+amd-gfx@lfdr.de>; Tue, 11 Jun 2019 06:09:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A736890EF;
	Tue, 11 Jun 2019 04:09:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790072.outbound.protection.outlook.com [40.107.79.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6324890EF
 for <amd-gfx@lists.freedesktop.org>; Tue, 11 Jun 2019 04:09:01 +0000 (UTC)
Received: from DM5PR12CA0003.namprd12.prod.outlook.com (2603:10b6:4:1::13) by
 MWHPR1201MB0061.namprd12.prod.outlook.com (2603:10b6:301:52::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1965.17; Tue, 11 Jun
 2019 04:09:00 +0000
Received: from BY2NAM03FT051.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by DM5PR12CA0003.outlook.office365.com
 (2603:10b6:4:1::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1965.13 via Frontend
 Transport; Tue, 11 Jun 2019 04:09:00 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT051.mail.protection.outlook.com (10.152.85.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1965.12 via Frontend Transport; Tue, 11 Jun 2019 04:08:59 +0000
Received: from bb-VirtualBox.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Mon, 10 Jun 2019
 23:08:39 -0500
From: Trigger Huang <Trigger.Huang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: fix pm_load_smu_firmware for SR-IOV
Date: Tue, 11 Jun 2019 12:08:30 +0800
Message-ID: <1560226110-10201-1-git-send-email-Trigger.Huang@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(346002)(396003)(376002)(39860400002)(2980300002)(428003)(189003)(199004)(81156014)(186003)(47776003)(8676002)(53416004)(4326008)(5660300002)(70586007)(4744005)(77096007)(81166006)(2616005)(70206006)(26005)(2906002)(426003)(8936002)(50226002)(336012)(36756003)(72206003)(86362001)(476003)(478600001)(126002)(486006)(305945005)(16586007)(68736007)(316002)(6916009)(2351001)(7696005)(50466002)(48376002)(356004)(54906003)(6666004)(51416003)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR1201MB0061; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aac16759-b11a-40af-f35d-08d6ee22881b
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR1201MB0061; 
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0061:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0061964679ABFCB04396DC61FEED0@MWHPR1201MB0061.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-Forefront-PRVS: 006546F32A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: HT6qKUgFvq78lgjOjLgO4Ia0S+Swqo6atuSfb+boC0cHwq5Il46ocaNoWjwbIuuPRVOq3h7BQfxtoi+Rxdm8ti2+gsuEgL0cD8ngeKtt+kndedNqmIA4maIgwncWZ6OX13yh0sMjzOzhZPuqIHQ8rTkceU6EiimVvE+Os49O2rvNVlzSEfaBpg9TlxrOd0ER+B4oIkS3P8/4GZEcPDsVLwPGX0NcTtgTceG1S7HDDLi7AUOGKppj/bFNvo3KH83XObWLNuLbMEN1Pxj7RWi50TOtPbIXfQxwUp3y6wnhnvbxWEFjBoyauAdttJDPnprGdqkfDPKjD/CwbO0R9rKRjwTM37HMhPnUJqap2RpgOFfAHhkRJw6Kyb0YZprDq5SS4r0wQdfylt9W9yY/rosZiqLkJURFST8jT25TAy1iSRM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2019 04:08:59.6546 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aac16759-b11a-40af-f35d-08d6ee22881b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0061
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTMqKeeZhWSokVA/LzWR29WXnbpm5WUVCF25zqVE3bk=;
 b=ku3ZkZJHeWlye0Oo5/mi8X4jdrEc8DODY9NzDZmdNpSDpWAhPSnMcr/SkNhr2d9xDqMMSC0TwcM3KpXpuXjlbwPlSVjCJhpRphY8svYc8yNgR6FpWQmhG+XdjgposfdrjGbTfwhIjGIA1lYO7k2x3LKi5rlG7Lh1pF7Zkqp8GZc=
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
Cc: Prike.Liang@amd.com, Trigger.Huang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rm9yIFNSLUlPViBWRiwgcG93ZXJwbGF5IG1heSBub3QgYmUgc3VwcG9ydGVkLCBpbiB0aGlzIGNh
c2UsCmVycm9yICctRUlOVkFMJyBzaG91bGQgbm90IGJlIHJldHVybmVkLgoKU2lnbmVkLW9mZi1i
eTogVHJpZ2dlciBIdWFuZyA8VHJpZ2dlci5IdWFuZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jCmluZGV4IDIx
YjViZTEuLjQyNzZkNjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9wbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jCkBA
IC0yNzA5LDcgKzI3MDksMTAgQEAgaW50IGFtZGdwdV9wbV9sb2FkX3NtdV9maXJtd2FyZShzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3QgKnNtdV92ZXJzaW8KIAkJCXJldHVybiBy
OwogCQl9CiAJCSpzbXVfdmVyc2lvbiA9IGFkZXYtPnBtLmZ3X3ZlcnNpb247CisJfSBlbHNlIGlm
IChhbWRncHVfc3Jpb3ZfdmYoYWRldikpIHsKKwkJciA9IDA7CiAJfQorCiAJcmV0dXJuIHI7CiB9
CiAKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
