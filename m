Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 648E123016
	for <lists+amd-gfx@lfdr.de>; Mon, 20 May 2019 11:20:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DDA2890C7;
	Mon, 20 May 2019 09:20:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770073.outbound.protection.outlook.com [40.107.77.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20DF4890C7
 for <amd-gfx@lists.freedesktop.org>; Mon, 20 May 2019 09:20:44 +0000 (UTC)
Received: from DM5PR12CA0012.namprd12.prod.outlook.com (2603:10b6:4:1::22) by
 DM5PR12MB1276.namprd12.prod.outlook.com (2603:10b6:3:79::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Mon, 20 May 2019 09:20:42 +0000
Received: from BY2NAM03FT017.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::204) by DM5PR12CA0012.outlook.office365.com
 (2603:10b6:4:1::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1900.18 via Frontend
 Transport; Mon, 20 May 2019 09:20:42 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT017.mail.protection.outlook.com (10.152.84.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1900.16 via Frontend Transport; Mon, 20 May 2019 09:20:42 +0000
Received: from yttao-code-machine.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 20 May 2019 04:20:34 -0500
From: Yintian Tao <yttao@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: no read DF register under SRIOV and set correct
 vram width
Date: Mon, 20 May 2019 17:20:31 +0800
Message-ID: <1558344031-874-1-git-send-email-yttao@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(136003)(39860400002)(396003)(376002)(346002)(2980300002)(428003)(189003)(199004)(50466002)(68736007)(186003)(2616005)(2906002)(70586007)(70206006)(72206003)(478600001)(476003)(486006)(48376002)(6916009)(77096007)(14444005)(26005)(2351001)(126002)(47776003)(50226002)(81166006)(53416004)(356004)(6666004)(4326008)(54906003)(7696005)(305945005)(8936002)(5660300002)(336012)(36756003)(53936002)(316002)(426003)(16586007)(81156014)(51416003)(8676002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1276; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68c1cfa0-6e87-4446-c3ef-08d6dd046e9d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:DM5PR12MB1276; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1276:
X-Microsoft-Antispam-PRVS: <DM5PR12MB12760D39BE47A4F6C5DB42B4E5060@DM5PR12MB1276.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 004395A01C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: FRzVpkssC2fpCPjg4oMBDIm1xgRwG3Tpjt1ZjB4IQxhZOdGqeyM10V/gbmKjsdNe2b1V32eLUZPn5M3K7wY4V+b+Bqx3et91ZyppHM0zPjopkx4lTdoeZ6wneEpDRgrtUIBxthPk1SvfKkjhFpz7J82cmurAZSqQCWwnUg/gHyJmle+LRnjb0nqSXhWRX9S5PhxlI0hWC1ruWp+NaH6GcMXU9qFQ9ox2x8ayukwEjJRQYlhFr2dJT165a5JEofXiAw3QdMdtZky7wrPmBdSeVeDGcuGpuUrEe72rAvgFwjpn/bKufqUclyApaJULCSo8umKsTId/B1e7GxwoUYDRw8y++c/eFf+3InIrcZGE6ibbtW7foN87IsVWYwEKeNRmvWgbKS2kuDrEJTwy6MP94g9ulzDHGpRkk5mxvSH/PrE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2019 09:20:42.2542 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c1cfa0-6e87-4446-c3ef-08d6dd046e9d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1276
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=andH2IHWNAjG1+ge/gtOaaKIFaLgPffy3bxZ65//O+w=;
 b=Zj83E0x8L1tUWv0lKDu+1EoXtHNJGb+eWGUYWaSiVtrx4crLDI9fniKy2iRJMn0zqvm2UdJ9sI7Vb8RNWjgpUeCHrrhHRCYxCGjbzwLkvIoJRq+auAW0PpWDZWk8S3EH4urEq72yY1K4BXK2gZw2ndqTlMpKXyCQwAM0bsRGtaA=
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
Cc: Trigger Huang <Trigger.Huang@amd.com>, Monk
 Liu <Monk.Liu@amd.com>, Yintian Tao <yttao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UEFSVDE6ClVuZGVyIFNSSU9WLCByZWFkaW5nIERGIHJlZ2lzdGVyIGhhcyBjaGFuY2UgdG8gbGVh
ZCB0bwpBRVIgZXJyb3IgaW4gaG9zdCBzaWRlLCBqdXN0IHNraXAgcmVhZGluZyBpdC4KUEFSVDI6
CkZvciBWZWdhMTAgU1ItSU9WLCB2cmFtX3dpZHRoIGNhbid0IGJlIHJlYWQgZnJvbSBBVE9NIGFz
ClJBVkVOLCBhbmQgREYgcmVsYXRlZCByZWdpc3RlcnMgaXMgbm90IHJlYWRhYmxlLCBzZWVtcyBo
YXJkY29yZAppcyB0aGUgb25seSB3YXkgdG8gc2V0IHRoZSBjb3JyZWN0IHZyYW1fd2lkdGguCgpT
aWduZWQtb2ZmLWJ5OiBUcmlnZ2VyIEh1YW5nIDxUcmlnZ2VyLkh1YW5nQGFtZC5jb20+ClNpZ25l
ZC1vZmYtYnk6IE1vbmsgTGl1IDxNb25rLkxpdUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBZaW50
aWFuIFRhbyA8eXR0YW9AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
bWNfdjlfMC5jIHwgOSArKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
bWNfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwppbmRleCBj
MjIxNTcwLi5iNWJmOWVkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
bWNfdjlfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKQEAg
LTgzNyw3ICs4MzcsNyBAQCBzdGF0aWMgaW50IGdtY192OV8wX21jX2luaXQoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpCiAKIAlpZiAoYW1kZ3B1X2VtdV9tb2RlICE9IDEpCiAJCWFkZXYtPmdt
Yy52cmFtX3dpZHRoID0gYW1kZ3B1X2F0b21maXJtd2FyZV9nZXRfdnJhbV93aWR0aChhZGV2KTsK
LQlpZiAoIWFkZXYtPmdtYy52cmFtX3dpZHRoKSB7CisJaWYgKCFhZGV2LT5nbWMudnJhbV93aWR0
aCAmJiAhYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKSB7CiAJCS8qIGhibSBtZW1vcnkgY2hhbm5lbCBz
aXplICovCiAJCWlmIChhZGV2LT5mbGFncyAmIEFNRF9JU19BUFUpCiAJCQljaGFuc2l6ZSA9IDY0
OwpAQCAtODQ4LDYgKzg0OCwxMyBAQCBzdGF0aWMgaW50IGdtY192OV8wX21jX2luaXQoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCWFkZXYtPmdtYy52cmFtX3dpZHRoID0gbnVtY2hhbiAq
IGNoYW5zaXplOwogCX0KIAorCS8qIEZvciBWZWdhMTAgU1ItSU9WLCB2cmFtX3dpZHRoIGNhbid0
IGJlIHJlYWQgZnJvbSBBVE9NIGFzIFJBVkVOLAorCSAqIGFuZCBERiByZWxhdGVkIHJlZ2lzdGVy
cyBpcyBub3QgcmVhZGFibGUsIHNlZW1zIGhhcmRjb3JkIGlzIHRoZQorCSAqIG9ubHkgd2F5IHRv
IHNldCB0aGUgY29ycmVjdCB2cmFtX3dpZHRoICovCisJaWYgKGFtZGdwdV9zcmlvdl92ZihhZGV2
KSAmJiAoYWRldi0+YXNpY190eXBlID09IENISVBfVkVHQTEwKSkgeworCQlhZGV2LT5nbWMudnJh
bV93aWR0aCA9IDIwNDg7CisJfQorCiAJLyogc2l6ZSBpbiBNQiBvbiBzaSAqLwogCWFkZXYtPmdt
Yy5tY192cmFtX3NpemUgPQogCQlhZGV2LT5uYmlvX2Z1bmNzLT5nZXRfbWVtc2l6ZShhZGV2KSAq
IDEwMjRVTEwgKiAxMDI0VUxMOwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
