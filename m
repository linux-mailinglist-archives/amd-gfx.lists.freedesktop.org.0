Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2B224E48
	for <lists+amd-gfx@lfdr.de>; Tue, 21 May 2019 13:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2681F89339;
	Tue, 21 May 2019 11:46:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810071.outbound.protection.outlook.com [40.107.81.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1DB289339
 for <amd-gfx@lists.freedesktop.org>; Tue, 21 May 2019 11:46:21 +0000 (UTC)
Received: from SN1PR12CA0067.namprd12.prod.outlook.com (2603:10b6:802:20::38)
 by DM5PR1201MB0057.namprd12.prod.outlook.com (2603:10b6:4:5b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1900.17; Tue, 21 May
 2019 11:46:20 +0000
Received: from CO1NAM03FT064.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by SN1PR12CA0067.outlook.office365.com
 (2603:10b6:802:20::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.15 via Frontend
 Transport; Tue, 21 May 2019 11:46:19 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT064.mail.protection.outlook.com (10.152.81.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1900.16 via Frontend Transport; Tue, 21 May 2019 11:46:19 +0000
Received: from gc-System-Product-Name.amd.com (10.34.1.3) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; 
 Tue, 21 May 2019 06:46:18 -0500
From: Chengming Gui <Jack.Gui@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: Fix code error for translating int type to
 bool type correctly
Date: Tue, 21 May 2019 19:46:12 +0800
Message-ID: <1558439172-4802-1-git-send-email-Jack.Gui@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(346002)(396003)(136003)(2980300002)(428003)(189003)(199004)(305945005)(77096007)(16586007)(26005)(6916009)(336012)(72206003)(426003)(2906002)(4744005)(356004)(14444005)(53936002)(486006)(478600001)(2616005)(126002)(316002)(86362001)(476003)(36756003)(186003)(4326008)(68736007)(6666004)(48376002)(51416003)(5660300002)(47776003)(70206006)(8936002)(50226002)(50466002)(53416004)(8676002)(81166006)(70586007)(2351001)(7696005)(81156014)(309714004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0057; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 024de37f-7421-4768-8680-08d6dde1f0b2
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:DM5PR1201MB0057; 
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0057:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0057D24FEAD1DCADD292B3988B070@DM5PR1201MB0057.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:361;
X-Forefront-PRVS: 0044C17179
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: hjt53IW+svTKaF+NkAO0w+8gDfeumEw/b9DIJFd+nIAO7FR6/WgOao37rox9zaePDHuPhLtZZurQBG6ht6X0yMhQT9Wrlb113gV2yzQweFc01xhssfb6DlST5qrhvLWCtDcsw2ifqlwVZXAMDAvc3QZBPCzSgeCUavUVdFiac+NZHnq4OozQpybTmXIsDSZ60RH9FDVsdkGjDmLz0qKfks0Q9eLIvtPj9B1sf2D5OcW4W50As3N4ChUW8wDu2nRfaDWIgGDvIemoGotUzvQlWoFZdzA5E78AN1Iz0EJewxvx43FQsS79WaStHm0PkmkLd2oW4pBbnHBaS9CmHJSxk827a7JyjXWG3gOt6DzO+q3dIo7byzIeF05sW9NIamZ1fCuDu9Rd4LxujiVbcLk4Z+Gr8bYvifSf13SJhuqidaE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2019 11:46:19.2013 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 024de37f-7421-4768-8680-08d6dde1f0b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0057
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0M+1r/1AUchjF6zBQu0jk6yjYZBhhVDNLIa+OOUQ1c=;
 b=FD4SKfx9sTS++OmDu+m2L8CsI0b7aim3vgAepniAS8V2/tkbawnNZf6nyBu1ZzDVVmzxnTpWe5PM2OERMKTQiG8OCEpF+hmKexeTtmYslfQqL75Euk4hjPc4WskCPQg3X9XgZBf1sxFPllIQN2q12lX7Iow4HdR0RW5V75UZi14=
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
Cc: Chengming Gui <Jack.Gui@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4IGNvZGUgZXJyb3IgdG8gc3VwcG9ydCB2YWx1ZSA8IDAgb3IgPiAxLgoKU2lnbmVkLW9mZi1i
eTogQ2hlbmdtaW5nIEd1aSA8SmFjay5HdWlAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9hbWRncHVfc211LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9h
bWRncHVfc211LmMKaW5kZXggM2E0NzEzMC4uZDVmMDNiOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwpAQCAtMzQ4LDcgKzM0OCw3IEBAIHN0YXRpYyBpbnQg
c211X2Vhcmx5X2luaXQodm9pZCAqaGFuZGxlKQogCXN0cnVjdCBzbXVfY29udGV4dCAqc211ID0g
JmFkZXYtPnNtdTsKIAogCXNtdS0+YWRldiA9IGFkZXY7Ci0Jc211LT5wbV9lbmFibGVkID0gYW1k
Z3B1X2RwbTsKKwlzbXUtPnBtX2VuYWJsZWQgPSAhIWFtZGdwdV9kcG07CiAJbXV0ZXhfaW5pdCgm
c211LT5tdXRleCk7CiAKIAlyZXR1cm4gc211X3NldF9mdW5jcyhhZGV2KTsKLS0gCjIuNy40Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
