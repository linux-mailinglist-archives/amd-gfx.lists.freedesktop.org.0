Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0551CE44
	for <lists+amd-gfx@lfdr.de>; Tue, 14 May 2019 19:50:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADFFF892E7;
	Tue, 14 May 2019 17:50:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760077.outbound.protection.outlook.com [40.107.76.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 979F7892DE
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 May 2019 17:50:10 +0000 (UTC)
Received: from BN6PR12CA0046.namprd12.prod.outlook.com (2603:10b6:405:70::32)
 by MWHPR1201MB0062.namprd12.prod.outlook.com (2603:10b6:301:54::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1878.21; Tue, 14 May
 2019 17:50:08 +0000
Received: from DM3NAM03FT012.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::206) by BN6PR12CA0046.outlook.office365.com
 (2603:10b6:405:70::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.21 via Frontend
 Transport; Tue, 14 May 2019 17:50:07 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT012.mail.protection.outlook.com (10.152.82.116) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Tue, 14 May 2019 17:50:07 +0000
Received: from hwentlanhp.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 14 May 2019
 12:50:06 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/amd/display: Don't load DMCU for Raven 1
Date: Tue, 14 May 2019 13:49:34 -0400
Message-ID: <20190514174935.28605-2-harry.wentland@amd.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190514174935.28605-1-harry.wentland@amd.com>
References: <20190514174935.28605-1-harry.wentland@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(2980300002)(428003)(189003)(199004)(44832011)(498600001)(2906002)(5660300002)(336012)(50466002)(446003)(50226002)(4326008)(2870700001)(11346002)(54906003)(6666004)(48376002)(486006)(476003)(2616005)(86362001)(126002)(1076003)(2351001)(356004)(36756003)(426003)(47776003)(72206003)(305945005)(76176011)(81166006)(26005)(70206006)(70586007)(8936002)(81156014)(8676002)(53416004)(6916009)(7696005)(51416003)(53936002)(77096007)(186003)(68736007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR1201MB0062; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1f6ee04-104b-482e-4a48-08d6d8949a6c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:MWHPR1201MB0062; 
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0062:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB00626EC4619E5F1D202CD36E8C080@MWHPR1201MB0062.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0037FD6480
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 8YYTg/MXsov9UMK2l8LlbeCppUapsBgeShrG3Wi9I/X5GNHQpSnWsgBj6zELmB+zlDEruidO9TsKQHleNrU4y16+UrI/tzLNZqWuSRDGZEc/6JyhJSu25EkTZiibpWq2ZvxCDbiPqSm7PU0LzNZVAUIV23nYgTQWjF3As7GAqc+6m/F0p189n/c99BFp2GYgfOPuXzQZPKPGoAn8yemun9WargPGFnToOxRJIzibQ6e3hAHagSTyO2Y2e7UqGC6mblgIEMadllFi2SzChrA+PYeF1aAuy5rhgeCbLilU4WhvZu36ApM4gcqdO69wk0pNbxTMXiGYhnftNu50nkx17Otc9RQFov07CBxHfv2C35OYgonevb2AhfhKPDDrWrdAfUZVp24rH9FwO/heJnjRRrX7gP+8zj+Eh5ARWBpzUp8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2019 17:50:07.4969 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f6ee04-104b-482e-4a48-08d6d8949a6c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0062
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2USi7DT/JC5HcpEk1Vii/H9HHMqXCgk4izok4E1v/UA=;
 b=ve9o/9lmYzkHm66tCeIFeenRVSFGCfxorQQjeVAC/+V1v5Au/Ad7wIeVp8K59AkZ1+mp5GVfhROwfINEG6RgIU1+9kTluqLWletvNb1alKwywAJ7uql6DLUjFE8GTnu3rsp22Bkf/ruXxTTej6/RMA1PzCVItcHhaBizBCqcIwY=
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
Cc: Alexander.Deucher@amd.com, Harry Wentland <harry.wentland@amd.com>,
 Tony.Cheng@amd.com, Nicholas.Kazlauskas@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1dIWV0KU29tZSBlYXJseSBSYXZlbiBib2FyZHMgaGFkIGEgYmFkIFNCSU9TIHRoYXQgZG9lc24n
dCBwbGF5IG5pY2VseSB3aXRoCnRoZSBETUNVIEZXLiBXZSB0aG91Z2h0IHRoZSBpc3N1ZXMgd2Vy
ZSBmaXhlZCBieSBpZ25vcmluZyBlcnJvcnMgb24gRE1DVQpsb2FkIGJ1dCB0aGF0IGRvZXNuJ3Qg
c2VlbSB0byBiZSB0aGUgY2FzZS4gV2UndmUgc3RpbGwgc2VlbiByZXBvcnRzIG9mCnVzZXJzIHVu
YWJsZSB0byBib290IHRoZWlyIHN5c3RlbXMgYXQgYWxsLgoKW0hPV10KRGlzYWJsZSBETUNVIGxv
YWQgb24gUmF2ZW4gMS4gT25seSBsb2FkIGl0IGZvciBSYXZlbiAyIGFuZCBQaWNhc3NvLgoKU2ln
bmVkLW9mZi1ieTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDEyICsr
KysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtLmMKaW5kZXggZDdmOWQzOTk4NjQxLi45ZjVlMWU3OWFjOGEgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwpAQCAtMjksNiArMjks
NyBAQAogI2luY2x1ZGUgImRtX3NlcnZpY2VzX3R5cGVzLmgiCiAjaW5jbHVkZSAiZGMuaCIKICNp
bmNsdWRlICJkYy9pbmMvY29yZV90eXBlcy5oIgorI2luY2x1ZGUgImRhbF9hc2ljX2lkLmgiCiAK
ICNpbmNsdWRlICJ2aWQuaCIKICNpbmNsdWRlICJhbWRncHUuaCIKQEAgLTY0MCw3ICs2NDEsNyBA
QCBzdGF0aWMgdm9pZCBhbWRncHVfZG1fZmluaShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikK
IAogc3RhdGljIGludCBsb2FkX2RtY3VfZncoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7
Ci0JY29uc3QgY2hhciAqZndfbmFtZV9kbWN1OworCWNvbnN0IGNoYXIgKmZ3X25hbWVfZG1jdSA9
IE5VTEw7CiAJaW50IHI7CiAJY29uc3Qgc3RydWN0IGRtY3VfZmlybXdhcmVfaGVhZGVyX3YxXzAg
KmhkcjsKIApAQCAtNjYzLDcgKzY2NCwxNCBAQCBzdGF0aWMgaW50IGxvYWRfZG1jdV9mdyhzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAljYXNlIENISVBfVkVHQTIwOgogCQlyZXR1cm4gMDsK
IAljYXNlIENISVBfUkFWRU46Ci0JCWZ3X25hbWVfZG1jdSA9IEZJUk1XQVJFX1JBVkVOX0RNQ1U7
CisJCWlmIChBU0lDUkVWX0lTX1BJQ0FTU08oYWRldi0+ZXh0ZXJuYWxfcmV2X2lkKSkKKwkJCWZ3
X25hbWVfZG1jdSA9IEZJUk1XQVJFX1JBVkVOX0RNQ1U7CisjaWYgZGVmaW5lZChDT05GSUdfRFJN
X0FNRF9EQ19EQ04xXzAxKQorCQllbHNlIGlmIChBU0lDUkVWX0lTX1JBVkVOMihhZGV2LT5leHRl
cm5hbF9yZXZfaWQpKQorCQkJZndfbmFtZV9kbWN1ID0gRklSTVdBUkVfUkFWRU5fRE1DVTsKKyNl
bmRpZgorCQllbHNlCisJCQlyZXR1cm4gMDsKIAkJYnJlYWs7CiAJZGVmYXVsdDoKIAkJRFJNX0VS
Uk9SKCJVbnN1cHBvcnRlZCBBU0lDIHR5cGU6IDB4JVhcbiIsIGFkZXYtPmFzaWNfdHlwZSk7Ci0t
IAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
