Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C57B73C0
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 09:12:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066326F866;
	Thu, 19 Sep 2019 07:12:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750045.outbound.protection.outlook.com [40.107.75.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7566F866
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 07:12:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/piywL1JvMtRkn9B+yDBinBdQnhZ4Ao6sASVMFQZ1n1YGoYQre0IMFAdCkkznLo4iQb8l8H1PTPe74kugqlDheLWsxEalLyrcPweDVLCJ+4hbZsfZ1upLJE7MdROqeauJERAuRrIBiWcZpMEmtiS6pITB+Dq/iRXcvmtgQLP5sz9z7clEzfQu44JHvzHOMwNG1sGhAFbPQ1vPxQwNra90TE6n+UPnbfDFLHQoxoGbaWARbR5f2cwO515k6PlFRrOl41oj9qqmpNF8NK67v2kdkHEcvQ0pzIvOadKGJzu9PmbeifZi7fLRls9Ryy7BPUdWyJ2Zy5kyv3mNX0Es+/kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0de2P1hC2UoDMEu8vKM9+1NOptqCRPIlYT5M88CJzs=;
 b=n4bVN6VdfIQyRJQXYDI5ae8qoMrKru5Rj1ofoCsqkbR6xK9FQ98GtQmt1T9rp4nUaQKZjBwqngR8av73RXMeDOIBzkAorx1AO9lQs++PtpT9GU/DW8yNwEIngri6AqIEVpo7BLjY5PCdMxvw05P/6ew4N4miB5Y8N5cumSqNUkYObnqxomhiyJX6Rd8HN1zYNPQZ8lXsqm8VFI3z4EO5dWNPOXOgoFXU0khvlhE2e5Tmmbsrf94PuErVBYNlBCjRG8ShKfjLJJ8C+VmtQ1SWVadqx87bLpDmAy0a1V+i+NPS7+L6r8Li0Y/LAeNYlRUur8yuD7BpY++OI+p7yvEKdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN8PR12CA0010.namprd12.prod.outlook.com (2603:10b6:408:60::23)
 by DM6PR12MB4042.namprd12.prod.outlook.com (2603:10b6:5:215::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.17; Thu, 19 Sep
 2019 07:12:02 +0000
Received: from DM3NAM03FT055.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::209) by BN8PR12CA0010.outlook.office365.com
 (2603:10b6:408:60::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.14 via Frontend
 Transport; Thu, 19 Sep 2019 07:12:02 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT055.mail.protection.outlook.com (10.152.83.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2284.20 via Frontend Transport; Thu, 19 Sep 2019 07:12:01 +0000
Received: from Build-machine.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Thu, 19 Sep 2019 02:12:01 -0500
From: Jesse Zhang <zhexi.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/amd/amdgpu:Fix compute ring unable to detect hang.
Date: Thu, 19 Sep 2019 15:08:55 +0800
Message-ID: <1568876935-18731-2-git-send-email-zhexi.zhang@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(136003)(346002)(428003)(199004)(189003)(16586007)(316002)(36756003)(4326008)(53416004)(305945005)(81156014)(81166006)(8676002)(336012)(5660300002)(486006)(2906002)(26005)(14444005)(50226002)(86362001)(2616005)(6916009)(70206006)(476003)(126002)(48376002)(7696005)(478600001)(51416003)(186003)(50466002)(70586007)(2351001)(8936002)(356004)(426003)(47776003)(6666004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4042; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f06a9826-5a9a-40c8-7da5-08d73cd0ab2f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:DM6PR12MB4042; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB4042:
X-Microsoft-Antispam-PRVS: <DM6PR12MB40428A8993C397A1CCC23749EF890@DM6PR12MB4042.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 016572D96D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: zq49FXTG0uD1N27wn99ibUlSeR4Nupfo4UmuALjMOXwNGcduIPkbXHeNXkGt0xx0sGnaQCDKQ5fwupxavrtsvRb6PaHQm/bw9+W01RU/yGCDX9M+TX858lLM1S56HohnsTycxumGZmbUzen2DrGX0GZKTVFt3NEVnV1IruYMD/sZcrFMYmwbPaMsYlr2VEPtWzJvJBrkjFzewmHRwCH6nD7Emzgl2Om6hmlyFDhMHERxEstzOobjXbNEDqMzlOoJkQup7UEn3G5N3XQjHCkNaM03HUZU3OOvKmqEIVjIvthx5nX821tFmjDKStxBjNzfvX5ba9sCXB0nywyyv67z7b/nlilEjNrgD4wOsjBCcz69wpKyoz5kq4MtHBYPaDSwVe9ej39rxL7LQqnH6qH3+qQdcrmMGKnNFDFV7StyQKc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2019 07:12:01.8154 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f06a9826-5a9a-40c8-7da5-08d73cd0ab2f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4042
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0de2P1hC2UoDMEu8vKM9+1NOptqCRPIlYT5M88CJzs=;
 b=2okDn7fGlN5DDz1hP7b0r6F/iQ31bN3HUGbGPCN8lfADQzbwEAvcO93lnXwPfmi3IDLcbpj5HcaSFUNynLfcUX4kDZz+RmyE9e/OnonXC00U8T7y+zyWzFn7tkVXCQ3qEmvLAU6uvBjXTiSih8SkB/8RY3p4kidUDYWyFGQHorQ=
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
Cc: Jesse Zhang <zhexi.zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2hlbiBjb21wdXRlIGZlbmNlIGRpZCBzaWduYWwsIGNvbXB1dGUgcmluZyBjYW5ub3QgZGV0ZWN0
IGhhcmR3YXJlIGhhbmcKYmVjYXVzZSBpdHMgdGltZW91dCB2YWx1ZSBpcyBzZXQgdG8gYmUgaW5m
aW5pdGUgYnkgZGVmYXVsdC4KCkluIFNSLUlPViBhbmQgcGFzc3Rocm91Z2ggbW9kZSwgaWYgdXNl
ciBkb2VzIG5vdCBkZWNsYXJlIGN1c3RvbWUgdGltZW91dAp2YWx1ZSBmb3IgY29tcHV0ZSByaW5n
LCB0aGVuIHVzZSBnZnggcmluZyB0aW1lb3V0IHZhbHVlIGFzIGRlZmF1bHQuIFNvCnRoYXQgd2hl
biB0aGVyZSBpcyBhIHR1cmUgaGFyZHdhcmUgaGFuZywgY29tcHV0ZSByaW5nIGNhbiBkZXRlY3Qg
aXQuCgpDaGFuZ2UtSWQ6IEk3OTRlYzA4NjhjNmMwYWFkNDA3NzQ5NDU3MjYwZWNmZWUwNjE3YzEw
ClNpZ25lZC1vZmYtYnk6IEplc3NlIFpoYW5nIDx6aGV4aS56aGFuZ0BhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgfCAxMCArKysrKysrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L3NvYzE1LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCmlu
ZGV4IDdjN2U5ZjUuLjZjZDU1NDggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3NvYzE1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYwpAQCAt
Njg3LDYgKzY4NywxNiBAQCBpbnQgc29jMTVfc2V0X2lwX2Jsb2NrcyhzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldikKIAlhZGV2LT5yZXZfaWQgPSBzb2MxNV9nZXRfcmV2X2lkKGFkZXYpOwogCWFk
ZXYtPm5iaW8uZnVuY3MtPmRldGVjdF9od192aXJ0KGFkZXYpOwogCisJLyoKKwkgKiBJZiBydW5u
aW5nIHVuZGVyIFNSLUlPViBvciBwYXNzdGhyb3VnaCBtb2RlIGFuZCB1c2VyIGRpZCBub3Qgc2V0
CisJICogY3VzdG9tIHZhbHVlIGZvciBjb21wdXRlIHJpbmcgdGltZW91dCwgc2V0IHRpbWVvdXQg
dG8gYmUgdGhlIHNhbWUKKwkgKiBhcyBnZnggcmluZyB0aW1lb3V0IHRvIGF2b2lkIGNvbXB1dGUg
cmluZyBjYW5ub3QgZGV0ZWN0IGFuIHRydWUKKwkgKiBoYW5nLgorCSAqLworCWlmICgoYW1kZ3B1
X3NyaW92X3ZmKGFkZXYpIHx8IGFtZGdwdV9wYXNzdGhyb3VnaChhZGV2KSkgJiYKKwkJKGFkZXYt
PmNvbXB1dGVfdGltZW91dCA9PSBNQVhfU0NIRURVTEVfVElNRU9VVCkpCisJCWFkZXYtPmNvbXB1
dGVfdGltZW91dCA9IGFkZXYtPmdmeF90aW1lb3V0OworCiAJaWYgKGFtZGdwdV9zcmlvdl92Zihh
ZGV2KSkKIAkJYWRldi0+dmlydC5vcHMgPSAmeGdwdV9haV92aXJ0X29wczsKIAotLSAKMi43LjQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
