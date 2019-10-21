Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A572DF797
	for <lists+amd-gfx@lfdr.de>; Mon, 21 Oct 2019 23:45:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 659506E270;
	Mon, 21 Oct 2019 21:45:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750055.outbound.protection.outlook.com [40.107.75.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1FED6E270
 for <amd-gfx@lists.freedesktop.org>; Mon, 21 Oct 2019 21:45:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hHKT/8Pzbc8U4aE6aWkz5e6C4fXDXfcyAinQvXxvX8Got74L702hcK9KhmPIMDbyMoSGFu0Nm9FcXg5EPkdJ5qRVr3AwAsDKgUSJD5klRlwiHaRBBKtYS7O+UOIVdzLlL/zjyWe4rWYmJDrUkJouUzEX1PE3J1ykrrb4rMY0TM3CdWykk3erp2rlqNr+Dtag3bcN/Tl9z1+E1g0PYZWpuCmcZTBxImTWpYEzjPSWksgsHJDtd4spz2yw+SW35AJqxY8cPyy7rV4l8Su2CzE70Rwgf3ORLQWWFDZV1ZSYA1n89O7+0fxAVJTqEXbaWGOjasGezeb98DSwKABd2CtlVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fx04RfbUk00IKejAV2Z0Ga5Ci8NP5p9k9Dwx2eFWt0=;
 b=kYeJpocFozanjmcZ8GKYV3lJcsNSRQFukCgOg06vDMDI296lKV3PZrmlBKnSeewgPIKmOz/EY8n0d/DjlTPKN/VK2/pwW7HzkZpRRE/pv/dRticiu1XIOQQhiXHLKLtIucd+gGlhKojgkve7P0Xo6sXCO0gODC20Bp+LEFoBiTLct0g86nNr8DvoQ5jaSXrT/q7v/BT1/2pU3zmd+FAeMy+sgTXG+SvC11ZQKKOtHOeaajIe4wurF+LCv2nkfmYQjvYZtciv27T2NNMaKoFqPjOHT9JNcr9MA3wYyoPOcveq9l8iphrpthDfGqprGrU1+JbhA/vfxIBIugXIpW4d7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0022.namprd12.prod.outlook.com
 (2603:10b6:301:4a::32) by BN6PR12MB1156.namprd12.prod.outlook.com
 (2603:10b6:404:1f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.19; Mon, 21 Oct
 2019 21:45:15 +0000
Received: from BY2NAM03FT021.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by MWHPR1201CA0022.outlook.office365.com
 (2603:10b6:301:4a::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.21 via Frontend
 Transport; Mon, 21 Oct 2019 21:45:15 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 BY2NAM03FT021.mail.protection.outlook.com (10.152.84.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2367.14 via Frontend Transport; Mon, 21 Oct 2019 21:45:14 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 21 Oct
 2019 16:45:13 -0500
Received: from roma-lnx-dev.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Mon, 21 Oct 2019 16:45:13 -0500
From: <Roman.Li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Alexander.Deucher@amd.com>
Subject: [PATCH] drm/amdgpu/display: add dc feature mask for psr enablement
Date: Mon, 21 Oct 2019 17:45:05 -0400
Message-ID: <1571694305-14820-1-git-send-email-Roman.Li@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(39860400002)(136003)(428003)(199004)(189003)(47776003)(316002)(305945005)(81156014)(336012)(54906003)(8676002)(4326008)(7696005)(5660300002)(48376002)(36756003)(110136005)(16586007)(8936002)(126002)(476003)(2616005)(50226002)(426003)(6636002)(86362001)(81166006)(70206006)(50466002)(186003)(14444005)(478600001)(2876002)(51416003)(70586007)(356004)(6666004)(486006)(53416004)(2906002)(26005)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1156; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc601f8e-86b3-4cc3-893a-08d7566ff4f7
X-MS-TrafficTypeDiagnostic: BN6PR12MB1156:
X-Microsoft-Antispam-PRVS: <BN6PR12MB115677753C13E0907A2BB10189690@BN6PR12MB1156.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-Forefront-PRVS: 0197AFBD92
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AE92nIW1aOEH5B3PFYfOHeIVPIAclA6Nis4E6oM1ZuNqPFW5NNGvuzZ+toXgdgpPAfW/CXKLGQqGkt3pnapZ290shDQsjV5yVZsunl6xQJeNmg4mh1wRJYASMwUa0XeZ/I4WOVn4wvIYBcUUGVLifqgG/YmJ0E1QGT9DLYgGJRiPKMoSXqzDsmbkpfKQtT4NUlrgNDMjIsmIweW8ZHAjQilIcjUzUqKnXKpMnboiXBUPCOEnRja6eCV79cK44VEA3PZ4c1P0FTZpxZVWOH4KjsMZmu7J0riAJaBfD383iwWStdOAS6zBf3pwo/h3JCi0g2FQohalKlo5hulk/6LTIvM2alvk98bFxetfiyNFLtoLYLUh3lnOL4ana7uPtkJGbmZxPwWG3jRAbzwb5pPbjeMFBfSJKHGEklSU17rnVb8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2019 21:45:14.6117 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc601f8e-86b3-4cc3-893a-08d7566ff4f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1156
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fx04RfbUk00IKejAV2Z0Ga5Ci8NP5p9k9Dwx2eFWt0=;
 b=yhJ4oGAYKlfcQKU4HUWDjIoRSTucrnQdMzqv67jPGUJAhLP+A5g/ysXBVFLJydoilp0VJqHqDVS2uBNV4x2A2f+LeRzTUl0kB6Pe0XMIvA8VUihvktvE5btK+SPjcc0PbHlEtjV12qWfyOZPsGJ55XVLlNcoUSgxFGj9BphJhlU=
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
Cc: sunpeng.li@amd.com, Bhawanpreet.Lakha@amd.com, harry.wentland@amd.com,
 nicholas.kazlauskas@amd.com, Roman Li <Roman.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUm9tYW4gTGkgPFJvbWFuLkxpQGFtZC5jb20+CgpbV2h5XQpBZGRpbmcgcHNyIG1hc2sg
dG8gZGMgZmVhdHVyZXMgYWxsb3dzIHNlbGVjdGl2ZWx5IGRpc2FibGUvZW5hYmxlIHBzci4KQ3Vy
cmVudCBwc3IgaW1wbGVtZW50YXRpb24gbWF5IG5vdCB3b3JrIHdpdGggbm9uLXBhZ2VmbGlwcGlu
ZyBhcHBsaWNhdGlvbi4KVW50aWwgcmVzb2x2ZWQgaXQgc2hvdWxkIGJlIGRpc2FibGVkIGJ5IGRl
ZmF1bHQuCgpbSG93XQpBZGQgZGNmZWF0dXJlbWFzayBmb3IgcHNyIGVuYWJsZW1lbnQuIERpc2Fi
bGUgYnkgZGVmYXVsdC4KVG8gZW5hYmxlIHNldCBhbWRncHUuZGNmZWF0dXJlbWFzaz0weDggaW4g
Z3J1YiBrZXJuZWwgY29tbWFuZCBsaW5lLgoKU2lnbmVkLW9mZi1ieTogUm9tYW4gTGkgPFJvbWFu
LkxpQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG0uYyB8IDMgKystCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYW1kX3NoYXJl
ZC5oICAgICAgICAgIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRn
cHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbS5jCmluZGV4IDFjZjRiZWIuLjBmMDg4NzkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwpAQCAtMjQyNCw3ICsyNDI0
LDggQEAgc3RhdGljIGludCBhbWRncHVfZG1faW5pdGlhbGl6ZV9kcm1fZGV2aWNlKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KQogCQl9IGVsc2UgaWYgKGRjX2xpbmtfZGV0ZWN0KGxpbmssIERF
VEVDVF9SRUFTT05fQk9PVCkpIHsKIAkJCWFtZGdwdV9kbV91cGRhdGVfY29ubmVjdG9yX2FmdGVy
X2RldGVjdChhY29ubmVjdG9yKTsKIAkJCXJlZ2lzdGVyX2JhY2tsaWdodF9kZXZpY2UoZG0sIGxp
bmspOwotCQkJYW1kZ3B1X2RtX3NldF9wc3JfY2FwcyhsaW5rKTsKKwkJCWlmIChhbWRncHVfZGNf
ZmVhdHVyZV9tYXNrICYgRENfUFNSX01BU0spCisJCQkJYW1kZ3B1X2RtX3NldF9wc3JfY2Fwcyhs
aW5rKTsKIAkJfQogCiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9h
bWRfc2hhcmVkLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYW1kX3NoYXJlZC5oCmlu
ZGV4IDg4ODlhYWMuLjFkYWEyMjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5j
bHVkZS9hbWRfc2hhcmVkLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FtZF9z
aGFyZWQuaApAQCAtMTQzLDYgKzE0Myw3IEBAIGVudW0gUFBfRkVBVFVSRV9NQVNLIHsKIGVudW0g
RENfRkVBVFVSRV9NQVNLIHsKIAlEQ19GQkNfTUFTSyA9IDB4MSwKIAlEQ19NVUxUSV9NT05fUFBf
TUNMS19TV0lUQ0hfTUFTSyA9IDB4MiwKKwlEQ19QU1JfTUFTSyA9IDB4OCwKIH07CiAKIGVudW0g
YW1kX2RwbV9mb3JjZWRfbGV2ZWw7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
