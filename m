Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F83D1A94
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 23:06:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5D66EA72;
	Wed,  9 Oct 2019 21:06:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710050.outbound.protection.outlook.com [40.107.71.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B40D6EA63
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2019 21:06:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQYH2SwUR9FSWjVNnOPMapCSzCOBiQxdn9V6AORytiLjaguUgluoeMHXgbJDXoo819BT+6gHbniIfVmliSR2ya0T/0tqSJ9Cex73TXd4QzRYM55g9kd5t/grLJFmYvye+DRbvJ0OP2hqOo3lzQs+Vey3ja1Rckw6YjKTFHBNHuTakP3rsXl5V8hjBtO+K2jfFTWxWeOaTkCxULIZLmRF+h3iH5aq/jzFpD2HGurlk5n/273YhBCEs02G6ZZvBIAZThIbgtwjSD6QUVhBPeaVnUIaGDdPII8LIv3+MzRxL3P2MA/6+twBKldGxsfK3c01nwHAXaC0mlOBIbCbWiqPfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSjL81skqSh7f0AtxR9246R2QSvUL9szUIK+RjCvIlQ=;
 b=Vm9kXKfs/2wIq4ACFQJ/wXyaTSezQtIaWbeJrxLMbvYnnGWnQYoEp9hBd+5HSBDdtyLTIYoKkoKF5dba349FwRIlqAggmEXRtmjE44jfhOo60BcwnLynMLIMl4+GcBaXKhu0TgLfJOo5rbo8WOKxjFjYmEL506t+zxOTk7Gn6/gCY41vPpfMtqRc6MSh4mPKpsV/5yNu1+fC/Gkmf7env/7MDygyI6CpJOgpFpQFLhYO03pDiOR88F5bR5delqchbLv5tGWNf2EsxtO71APlwPv3+FF4uLt5e4VU1xDy7lMRY0h8hTYLDHUE143BHL8HAQdCVj/6yXYiAM8qHXT4RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0019.namprd12.prod.outlook.com
 (2603:10b6:301:4a::29) by BN8PR12MB3010.namprd12.prod.outlook.com
 (2603:10b6:408:63::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.23; Wed, 9 Oct
 2019 21:06:26 +0000
Received: from DM3NAM03FT052.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by MWHPR1201CA0019.outlook.office365.com
 (2603:10b6:301:4a::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Wed, 9 Oct 2019 21:06:26 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT052.mail.protection.outlook.com (10.152.83.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 9 Oct 2019 21:06:26 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 9 Oct 2019
 16:06:25 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 13/26] drm/amd/display: use dcn10 version of program tiling on
 Renoir
Date: Wed, 9 Oct 2019 17:06:00 -0400
Message-ID: <20191009210613.17929-14-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
References: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(346002)(136003)(428003)(199004)(189003)(4326008)(36756003)(478600001)(2351001)(2906002)(6666004)(356004)(48376002)(47776003)(5660300002)(16586007)(7696005)(305945005)(76176011)(53416004)(1076003)(70586007)(186003)(14444005)(316002)(50226002)(26005)(8936002)(86362001)(6916009)(336012)(50466002)(70206006)(126002)(446003)(51416003)(8676002)(2616005)(54906003)(11346002)(426003)(81156014)(476003)(81166006)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3010; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9b008b6-543d-45c3-25ce-08d74cfc8c29
X-MS-TrafficTypeDiagnostic: BN8PR12MB3010:
X-Microsoft-Antispam-PRVS: <BN8PR12MB301068FD6FD994177C2EF533F9950@BN8PR12MB3010.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:639;
X-Forefront-PRVS: 018577E36E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l93080alKyu2WhCc4NtP46XW8Ld5mItxVuuK6D7PVAUc8zplIKCMy7VnaZin5GQmM6xyFWDSvvRM0mgizIDfdwAjkn778ZzwtQ5cUcliQDWJay9bTZEGFNCEgyIKoRr/r2RJL3NQwEATQWnQj8lV/0xvH9efySqfkYtaPswxD6VhHsdoyndFL4ednMws+3ZeMvI7NtKWw3gxxrHTj+ADF971FzCl9cnfuPIdh1a7ND2axZDcVRu1i/UqkMHxWK8SFBZFr5xtgvzHDFQr6c3gRfs1Uy1Bc+gClArvN4hm0yHJ1nIJQc2RQF3lzhSixVPgE09d8JC3d9jGVAaJjJ2sS6HZDf+NMKkRoGfjkkQhU883c4MzbBliFvr/w4Y3si5oiNbX20f0gCVh+N9sIuJyIWuSVvXXB8pDBBGhPRpgZ9Y=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 21:06:26.2180 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9b008b6-543d-45c3-25ce-08d74cfc8c29
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3010
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSjL81skqSh7f0AtxR9246R2QSvUL9szUIK+RjCvIlQ=;
 b=m10KPuIDSLET0YoqtxrskjtYpzpA5LPVpN7zPIYbmKWbh/5xyUxsuVQzDvtgftAj/Ah+gIC5yFepsqb7+9eBIecJ6GHemEW9R6MgbuQKo6KYt2MPAf1f15QkGPmNQ1VkSDdNLsBb89UYs+fqNC99ijYt7D6+DRk8jpzq3d7rK84=
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
Cc: sunpeng.li@amd.com, harry.wentland@amd.com, Eric Yang <Eric.Yang2@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXJpYyBZYW5nIDxFcmljLllhbmcyQGFtZC5jb20+CgpbV2h5XQpSZW5vaXIgaXMgZ2Z4
OSwgc2FtZSBhcyBkY24xMCwgbm90IGRjbjIwLgoKU2lnbmVkLW9mZi1ieTogRXJpYyBZYW5nIDxF
cmljLllhbmcyQGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJl
ZXQuTGFraGFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MjEvZGNuMjFfaHVicC5jIHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjbjIxL2RjbjIxX2h1YnAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y24yMS9kY24yMV9odWJwLmMKaW5kZXggYTAwYWY1MTNhYTJiLi4yZjVhNTg2N2U2NzQgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9odWJwLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX2h1YnAuYwpA
QCAtMjIsNiArMjIsOCBAQAogICogQXV0aG9yczogQU1ECiAgKgogICovCisKKyNpbmNsdWRlICJk
Y24xMC9kY24xMF9odWJwLmgiCiAjaW5jbHVkZSAiZGNuMjFfaHVicC5oIgogCiAjaW5jbHVkZSAi
ZG1fc2VydmljZXMuaCIKQEAgLTIwMiw3ICsyMDQsNyBAQCBzdGF0aWMgc3RydWN0IGh1YnBfZnVu
Y3MgZGNuMjFfaHVicF9mdW5jcyA9IHsKIAkuaHVicF9lbmFibGVfdHJpcGxlQnVmZmVyID0gaHVi
cDJfZW5hYmxlX3RyaXBsZWJ1ZmZlciwKIAkuaHVicF9pc190cmlwbGVidWZmZXJfZW5hYmxlZCA9
IGh1YnAyX2lzX3RyaXBsZWJ1ZmZlcl9lbmFibGVkLAogCS5odWJwX3Byb2dyYW1fc3VyZmFjZV9m
bGlwX2FuZF9hZGRyID0gaHVicDJfcHJvZ3JhbV9zdXJmYWNlX2ZsaXBfYW5kX2FkZHIsCi0JLmh1
YnBfcHJvZ3JhbV9zdXJmYWNlX2NvbmZpZyA9IGh1YnAyX3Byb2dyYW1fc3VyZmFjZV9jb25maWcs
CisJLmh1YnBfcHJvZ3JhbV9zdXJmYWNlX2NvbmZpZyA9IGh1YnAxX3Byb2dyYW1fc3VyZmFjZV9j
b25maWcsCiAJLmh1YnBfaXNfZmxpcF9wZW5kaW5nID0gaHVicDFfaXNfZmxpcF9wZW5kaW5nLAog
CS5odWJwX3NldHVwID0gaHVicDIxX3NldHVwLAogCS5odWJwX3NldHVwX2ludGVyZGVwZW5kZW50
ID0gaHVicDJfc2V0dXBfaW50ZXJkZXBlbmRlbnQsCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
