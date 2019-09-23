Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56769BADCD
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 08:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E436E0E4;
	Mon, 23 Sep 2019 06:28:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700067.outbound.protection.outlook.com [40.107.70.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36A36E0E0
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 06:28:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NGVKaYlDhWUnFN+jhLB5tq2O/VgaKIgQQkKDSnGkZka3BWTLGWZxfCAkLdcVfF5MaiHDCcVhn4Vyfq8VJJ5woPEAPhp6kJ4tcoU3lqldOh8D1gwLwt+1rUqUE71Rj6akedApibeHBIBB5ZpX19SQCON5dROD1tKp4C+hXoKx2J9XBxPOrF+CmwJRnGfP/JALfI6gVExq7tfvdXQqbFo77XuJaUtODia719JPXIAJMRiS4gA7EkboH9rPdjhelFqpI9LLqCtS4FdkXCqXZ/gfoBFK/9oQqIsqV+BrL4fEGEd+b8JUQO4Phv0Utv90q0XdrNeJJxjctCGPY/x82ichKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0g5NrTa8UtPXCMpuvtj4HcCmAve3yR/MDJ73p/d5bII=;
 b=kgs2hF+dO2lteyBQLYQJv9ns7U7Pu2eZkkAalXe01p6kfUJBMDQ++eqq2VUQnF7cbFg1Qg5kXAtpHAk4Sn5fZsVGaKJ7FXs0pMr3YmPMAZ8Sh9Lq9Tor/M1Qk6SnmmdxaCFGk+nUi3a4eu3/bMi0vvQqreGmcVDsHssKfn97mrfHA2FCOIMNZHf9SRUbCVAgMFRnGPd8WEGExi6X8dAikZ0+jD1QF/WmlrROwRsdZrUsdLNQO7buGGvOoSY6Win2OdmBNRJ4gYvOlU6SIiIRUnNLLLxEXKG3uJKTtBLWCYXI1b6b0DVrFwnfBTJ39S4Bdj7xA/XAVpX2zht1DMbYWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0023.namprd12.prod.outlook.com (2603:10b6:610:57::33)
 by MN2PR12MB4239.namprd12.prod.outlook.com (2603:10b6:208:1d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.26; Mon, 23 Sep
 2019 06:28:54 +0000
Received: from CO1NAM03FT030.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by CH2PR12CA0023.outlook.office365.com
 (2603:10b6:610:57::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20 via Frontend
 Transport; Mon, 23 Sep 2019 06:28:54 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT030.mail.protection.outlook.com (10.152.80.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2284.25 via Frontend Transport; Mon, 23 Sep 2019 06:28:53 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 23 Sep 2019 01:28:53 -0500
From: Le Ma <le.ma@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/amdgpu: add psp ip block for Arcturus
Date: Mon, 23 Sep 2019 14:28:45 +0800
Message-ID: <1569220126-4033-2-git-send-email-le.ma@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569220126-4033-1-git-send-email-le.ma@amd.com>
References: <1569220126-4033-1-git-send-email-le.ma@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(39860400002)(346002)(428003)(199004)(189003)(50226002)(186003)(336012)(51416003)(2351001)(305945005)(356004)(6666004)(86362001)(478600001)(48376002)(70586007)(76176011)(70206006)(4326008)(446003)(16586007)(50466002)(5660300002)(36756003)(4744005)(2616005)(11346002)(426003)(126002)(476003)(44832011)(81156014)(8676002)(2906002)(486006)(8936002)(81166006)(6916009)(26005)(316002)(47776003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4239; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ee09890-4e85-4d30-9c75-08d73fef4e62
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:MN2PR12MB4239; 
X-MS-TrafficTypeDiagnostic: MN2PR12MB4239:
X-Microsoft-Antispam-PRVS: <MN2PR12MB42395B3D5EACCB6E19E33DAFF6850@MN2PR12MB4239.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:265;
X-Forefront-PRVS: 0169092318
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 1M/HG3Z8u3FKjpagOwglxu4nRYbeNBDUH9EYzMZtHRCoflYsHk6pRybNqG1iY0bg+5ru/Ovxi5Ebb0sYYsl9Hhgj0v1NbBvVxJJywcf9ikgLqUR8Zq92h6mo4gPrlz4E6u4dn7SLHNMVxGbvPzzeghG8hjjVq6t6lr/vnmNjAvwL89hsOmxQGUM+mT238C3IEeZ5oriM/vunPK3tL6X0Xatwe4R9S7xMmj0Gk1FGcBfAzSvuQbNkpbuoAPxrxsXvRKNPCFgODcSfIoM+lJWVLBO1J+ajn0+V2RUL4KByJ/04pnx7999pMTxzHMNIrBTWxvZX2JOU4GD15DSgfAQgFkHlcvdZsSoDe/sgFLuTBC/xi7Bvirp1Eq2FaWWEWBzEoovkiFzMk76CMzeLQwmiELXJSbUvisbgCPS8ogotvHo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2019 06:28:53.9071 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ee09890-4e85-4d30-9c75-08d73fef4e62
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4239
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0g5NrTa8UtPXCMpuvtj4HcCmAve3yR/MDJ73p/d5bII=;
 b=n90xpEFy65o6bMqU+ydBMit7f7ZG3LIP6FRXlIzCZGMZSxXPILPspmK8HUqncvWoOzgPmGY3+K3YMCurfNLb5d5u74QVl6r7+/UQ+FrcPrl+zRUrQlnBi4e6R6/TLzit6vVQ/5lMogPtceOcW9x2vj+iwdR6WKVKVIm94DGjb0E=
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

Q2hhbmdlLUlkOiBJNmI2OWJmYmE2NmFhMTJkNTQ4NjUyN2UyOWE3YzMyMjMzNmM5NWRkNQpTaWdu
ZWQtb2ZmLWJ5OiBMZSBNYSA8bGUubWFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9zb2MxNS5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCmluZGV4IDViZWM4NTEuLmRiZDc5MGUgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYwpAQCAtNzU1LDYgKzc1NSw4IEBAIGludCBzb2MxNV9z
ZXRfaXBfYmxvY2tzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCQlhbWRncHVfZGV2aWNl
X2lwX2Jsb2NrX2FkZChhZGV2LCAmdmVnYTEwX2NvbW1vbl9pcF9ibG9jayk7CiAJCWFtZGdwdV9k
ZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZnbWNfdjlfMF9pcF9ibG9jayk7CiAJCWFtZGdwdV9k
ZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZ2ZWdhMTBfaWhfaXBfYmxvY2spOworCQlpZiAobGlr
ZWx5KGFkZXYtPmZpcm13YXJlLmxvYWRfdHlwZSA9PSBBTURHUFVfRldfTE9BRF9QU1ApKQorCQkJ
YW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJnBzcF92MTFfMF9pcF9ibG9jayk7CiAJ
CWlmIChhZGV2LT5lbmFibGVfdmlydHVhbF9kaXNwbGF5IHx8IGFtZGdwdV9zcmlvdl92ZihhZGV2
KSkKIAkJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZkY2VfdmlydHVhbF9pcF9i
bG9jayk7CiAJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZnZnhfdjlfMF9pcF9i
bG9jayk7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
