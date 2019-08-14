Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B2E8DE1B
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Aug 2019 21:53:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E80996E823;
	Wed, 14 Aug 2019 19:53:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on0615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::615])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A966E823
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 19:53:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IAt0JF6F6TEu1nUs+H08qtriDIQL34GKL7OsxhohgaKlFftlNyUB1pTJgvjHcTACpTB564gFfkqJNmbqrTatfWb3QcC23rrQL4hbM9bNEnAFLQ6qQmDy5A/I/kI4OLfKA5x1q/Tl3bbowPcvU/vm5Y1Sa0AeTH3lIg81NrMka+S6gHbPAN6oibNnAPl6mI+Aurxip3M2AeAy4fi//VAxd8pqYbZhBhNb4XiC7NTgZnU7a8ubgeCt592vLb8xEP8bXU6gcsXX8ij1FVKSJklKFNheMMxgFtxCLoinV/J5dD9O18wfJfHR+nbjSnEwWqtkQkWHfKdRCzZ9Uzx5luWBUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6eSjx6DqZ02zW6XUSUUUOvHn76NtiiZ4UDs4Wf6z9Po=;
 b=Po7lA/fUs4Fjv2Wnz5nq5JyveQY2jsCiZI4ZVwR8fyi0/fCP1aDPMJSk/Qj0RGCtfWRExYyz5/YymjfAxXBYuKAlkCnXmUe3swH5JouCsXKUUBtDj+tCd3IHNzVmWyXKJxkKC6yduL8vV1ocOB4BDCyaHwnmdCcDHPWKXX/AXJ5UaZoTYaFViyD2O0VrwxoRslJiFrt06CWKXjXqXeGSvS85D4E404QmeiVGhkAD1bEGJ3TxIMQkC0EvVUhOupjh4Yh17ZqtO7hW7WWL9lELagYFZ5+cvwTGPuPSanO9uh2JStP/+fsaocgJxo495u0WTkMxUsAxyaUhEGts3mi+PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MN2PR12CA0006.namprd12.prod.outlook.com (2603:10b6:208:a8::19)
 by BYAPR12MB2711.namprd12.prod.outlook.com (2603:10b6:a03:68::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.23; Wed, 14 Aug
 2019 19:53:51 +0000
Received: from BY2NAM03FT022.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by MN2PR12CA0006.outlook.office365.com
 (2603:10b6:208:a8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.14 via Frontend
 Transport; Wed, 14 Aug 2019 19:53:51 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT022.mail.protection.outlook.com (10.152.84.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 14 Aug 2019 19:53:50 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Wed, 14 Aug 2019 14:53:48 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/amd/powerplay: Fix meaning of 0x1E PPSMC_MSG
Date: Wed, 14 Aug 2019 15:53:32 -0400
Message-ID: <1565812414-26117-2-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565812414-26117-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1565812414-26117-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(346002)(136003)(396003)(2980300002)(428003)(199004)(189003)(47776003)(6666004)(81156014)(51416003)(356004)(478600001)(76176011)(8936002)(7696005)(81166006)(86362001)(426003)(8676002)(446003)(305945005)(50226002)(186003)(26005)(53416004)(4744005)(336012)(6916009)(2351001)(5660300002)(11346002)(50466002)(70206006)(70586007)(48376002)(44832011)(14444005)(2616005)(476003)(126002)(486006)(316002)(2906002)(53936002)(36756003)(4326008)(16586007)(19627235002)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2711; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a38a621-c8b2-4f0a-5d89-08d720f120ea
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BYAPR12MB2711; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2711:
X-Microsoft-Antispam-PRVS: <BYAPR12MB27119E6F201DDE456A5DFE55EAAD0@BYAPR12MB2711.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:551;
X-Forefront-PRVS: 01294F875B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: rU/HSAhLvD9Zi+aQEgV4NJ+PSR0uWy65ZmUWNccuhODSeEI85W1BYmKGuayHcnUw1QCyPFIfeirrdgF0wHhtjw6LformK7nPMgiex/7pJcNwZhHPDBRYouvUGzMwRv3xdwJYXVl+e6BM93j1fgd7fNVo7DbB8wt1tkX4FUSNdvz8xGjS718Ik7tc9AuJOS+golZp/c0MiNxpvDmtFWtGItlWV1Mk79nVfIQNxh3kvnrZMLc49yT14qmPd3ghOdMXm7VAk3BgwByygZK6+WWq7d3PjTBDWYoYWloNW23ktr8A+yAiscs4DCdYyKV6gcQ9t/ie7qJixOBhAdUrnpCO2phqPqK6tKtAuFUUbtZ26amD9KwFyV1qL9ptWxAePJWxCV0UkVUtwDZSBsB82ucbdIMnGO2GMWogaTbrndidi2g=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2019 19:53:50.3458 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a38a621-c8b2-4f0a-5d89-08d720f120ea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2711
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6eSjx6DqZ02zW6XUSUUUOvHn76NtiiZ4UDs4Wf6z9Po=;
 b=EjR8azP3rWvVEjQFDPIGL8M3M8tUVty4tCW6Y6b0pgw+NM1z6wYis8IsQ3cf2qdJdmRH6ZSppAS8PtlUc0rV1pcXdePSr7vZp49c/mqivaC3DMJFQ1KP4vcGcg4mlKFyMUeJ/3WCfcB7lXN12Iilv9AGUupeFBSpY9HH7FF7nL8=
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
Cc: Alexander.Deucher@amd.com, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 evan.quan@amd.com, Shirish.S@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QnkgY29tcGFyaW5nIHRvIHdpbmRvd3MgaXQgbWVhbnMgQVNJQyByZXNldC4KClNpZ25lZC1vZmYt
Ynk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9ydl9wcHNtYy5oIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3J2X3Bwc21jLmggYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9pbmMvcnZfcHBzbWMuaAppbmRleCA5MDg3OWU0Li5kZjQ2NzdkIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvcnZfcHBzbWMuaAor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvcnZfcHBzbWMuaApAQCAtNTks
NyArNTksNyBAQAogI2RlZmluZSBQUFNNQ19NU0dfU2V0RHJpdmVyRHJhbUFkZHJMb3cgICAgICAg
ICAgMHgxQgogI2RlZmluZSBQUFNNQ19NU0dfVHJhbnNmZXJUYWJsZVNtdTJEcmFtICAgICAgICAg
MHgxQwogI2RlZmluZSBQUFNNQ19NU0dfVHJhbnNmZXJUYWJsZURyYW0yU211ICAgICAgICAgMHgx
RAotI2RlZmluZSBQUFNNQ19NU0dfQ29udHJvbEdmeFJNICAgICAgICAgICAgICAgICAgMHgxRQor
I2RlZmluZSBQUFNNQ19NU0dfRGV2aWNlRHJpdmVyUmVzZXQgICAgICAgICAgICAgMHgxRQogI2Rl
ZmluZSBQUFNNQ19NU0dfU2V0R2Z4Y2xrT3ZlcmRyaXZlQnlGcmVxVmlkICAgMHgxRgogI2RlZmlu
ZSBQUFNNQ19NU0dfU2V0SGFyZE1pbkRjZWZjbGtCeUZyZXEgICAgICAgMHgyMAogI2RlZmluZSBQ
UFNNQ19NU0dfU2V0SGFyZE1pblNvY2Nsa0J5RnJlcSAgICAgICAgMHgyMQotLSAKMi43LjQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
