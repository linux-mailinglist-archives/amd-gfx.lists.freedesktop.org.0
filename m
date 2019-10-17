Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 395BFDB734
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 21:15:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B77EC6EA9D;
	Thu, 17 Oct 2019 19:15:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700088.outbound.protection.outlook.com [40.107.70.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A3F6EA38
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 19:15:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F8nmRGjnL9wbwUFCgjbWen+aV1dSbdyxgWFONVPcWZYA6QfGFvQnhCA7ZAQkUGk+QUCR4pTbIQ/RTnlogmlr7EdyKuOOY/In4khfRgu82dQYxCZ3aXKH/Nv1weRe27b6SIr8xz3Qd4LCk3xB0VKCsQvVPxtzmT6iHdo9ijCB3vl98EfCZvQ7ssvOIorTutNXJCIGOM6qxC2WIcbyjMJ67szJ14K6/JlliK0kPxavS/TAqSoPYmxgidiB/xSGhgiYG+deM94P4es8XUjFTq6VdIGtdYYn54A5iSWuBcwTXwwCfWkWQHlmcVeqt8yi/I6or++t5eMDDEQstnn47DnNOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVbZko8vEUfVhQMaP2bEqBn7oKhVRaI/a/EbiDzi4iM=;
 b=Bal3WYp0yyQjNIi4XE3KhZDyRmNQ4tamUJWH8IhxPkAxJ+cTVW9baS4u3+wiVohdeMBU1h3UEMc4MDaomheH+gsZ2L/r2KDcFiqSrXcjF2zvB5r9lZHKyOnM+/472bjK6eLOfvWsbQPWLwLY8HE0e8vW2gscBpOEbQnHO4+oL2QO7p0cNUgM7XswiLbJtsvz1GWdYHEoey781DojW0MHz4opudUvNR2LamC0+kQZ4qSsRTU4aEE8MKNxQwrkrsCOqIXRO10945cuCJTGUL7GYM3UqTDrNmsVZ3mj3jZzr18U3ghKE73uwwE4gbgv1rttcYkPbp9/p5TcEVyPPZ5YiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0063.namprd12.prod.outlook.com (2603:10b6:3:103::25)
 by BN6PR1201MB0228.namprd12.prod.outlook.com (2603:10b6:405:57::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.21; Thu, 17 Oct
 2019 19:15:37 +0000
Received: from CO1NAM03FT008.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by DM5PR12CA0063.outlook.office365.com
 (2603:10b6:3:103::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Thu, 17 Oct 2019 19:15:37 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM03FT008.mail.protection.outlook.com (10.152.80.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2367.14 via Frontend Transport; Thu, 17 Oct 2019 19:15:37 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:36 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:36 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 17 Oct 2019 14:15:35 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 10/37] drm/amd/display: correctly populate dpp refclk in fpga
Date: Thu, 17 Oct 2019 15:13:02 -0400
Message-ID: <20191017191329.11857-11-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017191329.11857-1-sunpeng.li@amd.com>
References: <20191017191329.11857-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(136003)(376002)(39860400002)(428003)(189003)(199004)(316002)(47776003)(5660300002)(36756003)(54906003)(356004)(4326008)(26005)(6666004)(1076003)(478600001)(48376002)(50466002)(86362001)(76176011)(70206006)(51416003)(2876002)(2870700001)(2351001)(2906002)(70586007)(476003)(426003)(486006)(2616005)(14444005)(81156014)(50226002)(8676002)(336012)(186003)(126002)(81166006)(6916009)(446003)(8936002)(11346002)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0228; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33025a38-cd4f-4e6b-cb52-08d753366472
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0228:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB02283C4F17A0B32665359F63826D0@BN6PR1201MB0228.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 01930B2BA8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UlVCnUfxZ4vbHvyEAmsbKqyJCnRI+DM+wPbaXCN03mZW+XPNLz6+1xoG4r62p5d+iUqDzk/rnCwSJILjfKSy8GQrEEGydX+BWM3s/Dwvcy7ORwRMSM/34dkZTHw+yvTh1XOXw6cjU9D81HywVHJB56U0AEiYPlKKKDzkG4hTgfvJ5oqmUInnYXsDd70CfgAD5TRMXag9FkKOKSZ4f7eJcReDFSWkSL7x25i3vZuAJYTGsvgP9O+3GW+Zg0reo4ql9jC9CPH/+ffpOHTmE+oi495/mhe/iQWNswPA6oe2Nw+2veQO4Zj4PBN/0ssRaJ/vNUZrI+XNjsX7Kak2k1rWyIi4iVt/7ulz6JoYP4phu6oB5VBN2KLZaJWMezRGmQkMJs1nu2npPUx/HGe1dC7Jg6jeXeUtQ6PluWvFRHetrxs=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 19:15:37.3147 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33025a38-cd4f-4e6b-cb52-08d753366472
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0228
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVbZko8vEUfVhQMaP2bEqBn7oKhVRaI/a/EbiDzi4iM=;
 b=aXesK3qGeS0lJDrcL2qG+U5bTxKzNjBg1VmZZ3NUsplAhDkgbLv+v+KJEOrr8qws3CCtypoXkxLpQhbULRvEds6u21Z4B5tUORZkzbT1PgNxK9XDLhw1DGiEuODljPkdFO2tmR4OO1XFoWmC1XjFLzZHwEcp2/bzf1v2hCSkmBU=
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
Cc: Leo Li <sunpeng.li@amd.com>, Tony Cheng <Tony.Cheng@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQW50aG9ueSBLb28gPEFudGhvbnkuS29vQGFtZC5jb20+CgpbV2h5XQpJbiBkaWFncyBl
bnZpcm9ubWVudCB3ZSBhcmUgbm90IHByb2dyYW1taW5nIHRoZSBEUFAgRFRPCmNvcnJlY3RseS4K
CltIb3ddClBvcHVsYXRlIHRoZSBkcHAgcmVmY2xrIGluIGRjY2cgc28gaXQgY2FuIGJlIHVzZWQg
dG8gY29ycmVjdGx5CnByb2dyYW0gRFBQIERUTy4KClNpZ25lZC1vZmYtYnk6IEFudGhvbnkgS29v
IDxBbnRob255Lktvb0BhbWQuY29tPgpSZXZpZXdlZC1ieTogVG9ueSBDaGVuZyA8VG9ueS5DaGVu
Z0BhbWQuY29tPgpBY2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQogLi4u
L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2RjbjIwL2RjbjIwX2Nsa19tZ3IuYyAgIHwgMTAg
KysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2xrX21nci9k
Y24yMC9kY24yMF9jbGtfbWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2xr
X21nci9kY24yMC9kY24yMF9jbGtfbWdyLmMKaW5kZXggZWNkMmNiNDg0MGUzLi42OWRhZGRiZmJm
MjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2Rj
bjIwL2RjbjIwX2Nsa19tZ3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Y2xrX21nci9kY24yMC9kY24yMF9jbGtfbWdyLmMKQEAgLTI2MCw2ICsyNjAsOCBAQCB2b2lkIGRj
bjJfdXBkYXRlX2Nsb2Nrc19mcGdhKHN0cnVjdCBjbGtfbWdyICpjbGtfbWdyLAogCQlzdHJ1Y3Qg
ZGNfc3RhdGUgKmNvbnRleHQsCiAJCWJvb2wgc2FmZV90b19sb3dlcikKIHsKKwlzdHJ1Y3QgY2xr
X21ncl9pbnRlcm5hbCAqY2xrX21ncl9pbnQgPSBUT19DTEtfTUdSX0lOVEVSTkFMKGNsa19tZ3Ip
OworCiAJc3RydWN0IGRjX2Nsb2NrcyAqbmV3X2Nsb2NrcyA9ICZjb250ZXh0LT5id19jdHguYncu
ZGNuLmNsazsKIAkvKiBNaW4gZmNsayA9IDEuMkdIeiBzaW5jZSBhbGwgdGhlIGV4dHJhIHNjZW1p
IGxvZ2ljIHNlZW1zIHRvIHJ1biBvZmYgb2YgaXQgKi8KIAlpbnQgZmNsa19hZGogPSBuZXdfY2xv
Y2tzLT5mY2xrX2toeiA+IDEyMDAwMDAgPyBuZXdfY2xvY2tzLT5mY2xrX2toeiA6IDEyMDAwMDA7
CkBAIC0yOTcsMTQgKzI5OSwxOCBAQCB2b2lkIGRjbjJfdXBkYXRlX2Nsb2Nrc19mcGdhKHN0cnVj
dCBjbGtfbWdyICpjbGtfbWdyLAogCQljbGtfbWdyLT5jbGtzLmRpc3BjbGtfa2h6ID0gbmV3X2Ns
b2Nrcy0+ZGlzcGNsa19raHo7CiAJfQogCi0JLyogQm90aCBmY2xrIGFuZCBkcHBjbGsgcmVmIGFy
ZSBydW4gb24gdGhlIHNhbWUgc2NlbWkgY2xvY2sgc28gd2UKLQkgKiBuZWVkIHRvIGtlZXAgdGhl
IHNhbWUgdmFsdWUgZm9yIGJvdGgKKwkvKiBCb3RoIGZjbGsgYW5kIHJlZl9kcHBjbGsgcnVuIG9u
IHRoZSBzYW1lIHNjZW1pIGNsb2NrLgorCSAqIFNvIHRha2UgdGhlIGhpZ2hlciB2YWx1ZSBzaW5j
ZSB0aGUgRFBQIERUTyBpcyB0eXBpY2FsbHkgcHJvZ3JhbW1lZAorCSAqIHN1Y2ggdGhhdCBtYXgg
ZHBwY2xrIGlzIDE6MSB3aXRoIHJlZl9kcHBjbGsuCiAJICovCiAJaWYgKGNsa19tZ3ItPmNsa3Mu
ZmNsa19raHogPiBjbGtfbWdyLT5jbGtzLmRwcGNsa19raHopCiAJCWNsa19tZ3ItPmNsa3MuZHBw
Y2xrX2toeiA9IGNsa19tZ3ItPmNsa3MuZmNsa19raHo7CiAJaWYgKGNsa19tZ3ItPmNsa3MuZHBw
Y2xrX2toeiA+IGNsa19tZ3ItPmNsa3MuZmNsa19raHopCiAJCWNsa19tZ3ItPmNsa3MuZmNsa19r
aHogPSBjbGtfbWdyLT5jbGtzLmRwcGNsa19raHo7CiAKKwkvLyBCb3RoIGZjbGsgYW5kIHJlZl9k
cHBjbGsgcnVuIG9uIHRoZSBzYW1lIHNjZW1pIGNsb2NrLgorCWNsa19tZ3JfaW50LT5kY2NnLT5y
ZWZfZHBwY2xrID0gY2xrX21nci0+Y2xrcy5mY2xrX2toejsKKwogCWRtX3NldF9kY25fY2xvY2tz
KGNsa19tZ3ItPmN0eCwgJmNsa19tZ3ItPmNsa3MpOwogfQogCi0tIAoyLjIzLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
