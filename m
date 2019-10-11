Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D63BCD3799
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 04:49:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA8CA6E3F4;
	Fri, 11 Oct 2019 02:49:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710073.outbound.protection.outlook.com [40.107.71.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 667676E3F4
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 02:49:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V7TSvXcrLt5TyXYK1EmsaXBH1pLdtj5Q8bojs1nEFbB2pfViL9CNW/AVQDx0p181rasJpIKy0LiH6S6/fgymb4PstWKnjYcEwNiopSSlRc/PhiDCrBedcFrctZPcuWkd+i53ZAdpYeZK4q4uh+oPTmXnj3UIzugW1A5QU09LbRctGANUB+aGIkFZncfUEsGNYzRXUvIwWGUbuNkEhjv8DxdipMVtlOxtMmOjQmwdmkK2pqNQ86LyMLjFxh8jiI2JXyhDXsnz8U/0DJuSwzoXNTGAkaHf9RQ1/rIlrMcclUIDMmEQneX8SInH/VG26uquUUK4yyF8f0QNqt5aOaQJMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=82pqcUaABOaHnobq/xsWWjpfh8fzg0xgPZFnKqlfYXk=;
 b=fnSyhXj7RieZOZ4N6ZV6a4ephIpGxgJLaXAWu/frauJfzVMVazCL936nt1LucHCeZR2HVBd5zsBVGFwmpA7dp+NuynJaRVeSzGMdNEbvC6tnoPgrPlXUYSJxCyjWLNyVoU1E0z1c1MmDun0tX1+nTfGdZlVOS83F6KLLuMa4nwO8+zeorWQ+1azQwjbTuKRv1BKMRS+fz3jx1LmFT0H48P9A6KntJeYAkTcNA7HVWLU9ABx+J9HXJr4W16wjnff6r+BcD4JJ/jBkYxioMg9GpUk2G1BQCqHmoErhvzigyBkXOBuiozAg2eOLHdLt/Q0eS9RTEHBqcXjpwB/w3o8Wag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR1201CA0022.namprd12.prod.outlook.com
 (2603:10b6:910:16::32) by MW2PR12MB2491.namprd12.prod.outlook.com
 (2603:10b6:907:9::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Fri, 11 Oct
 2019 02:49:40 +0000
Received: from BY2NAM03FT061.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::205) by CY4PR1201CA0022.outlook.office365.com
 (2603:10b6:910:16::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.17 via Frontend
 Transport; Fri, 11 Oct 2019 02:49:40 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT061.mail.protection.outlook.com (10.152.85.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Fri, 11 Oct 2019 02:49:39 +0000
Received: from yajunl-gv.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server (TLS) id 14.3.389.1; Thu, 10 Oct
 2019 21:49:38 -0500
From: Dennis Li <Dennis.Li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Alexander.Deucher@amd.com>,
 <Tao.Zhou1@amd.com>, <Hawking.Zhang@amd.com>, <Guchun.Chen@amd.com>
Subject: [PATCH 0/3] RAS Support for GFX blocks
Date: Fri, 11 Oct 2019 10:49:19 +0800
Message-ID: <20191011024922.9018-1-Dennis.Li@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(376002)(396003)(428003)(189003)(199004)(476003)(50466002)(486006)(126002)(478600001)(26005)(186003)(70206006)(70586007)(53416004)(2616005)(6636002)(305945005)(336012)(426003)(16586007)(47776003)(1076003)(2906002)(36756003)(4744005)(6666004)(86362001)(356004)(2201001)(7696005)(4326008)(51416003)(316002)(48376002)(81156014)(81166006)(8676002)(50226002)(110136005)(5660300002)(8936002)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR12MB2491; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f41ac99-cd21-4114-93e0-08d74df5a938
X-MS-TrafficTypeDiagnostic: MW2PR12MB2491:
X-Microsoft-Antispam-PRVS: <MW2PR12MB249190E8FD10C555B0EFDDDFED970@MW2PR12MB2491.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 0187F3EA14
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T6TDOj/5wUgK3b++RCczGwcQnCteuzbIFUjmliqqDcB46qgjqfxRkhWugyBqmTgjM71/0mKv/Nhq50uhTxP76TGnTuEyCLhZK2QEsXco5qELrvF4fr8PTe05CiIwfOubd3W9XtK4HiiajIc3gdwz8h7opsuRNt+sJv7h6e3DTjwYyBQFvcYKbOg02XxHbo40Yq5vnJVMW0Ops4zSmT/qlYTmBZmeCbi7kAVaxmV3VBOnVIvsc4LxBdQiSEnOcjs255cYLdnzrLCy6MNFzggH8bBaODD1U0wgduOrulSGfVJVzKtmQLfGTDHfnQqx1680VZV5qTL0OEqKhMJOIOlDOEm2SqNnHitxa0fTWDWyltPmV+t5dteE0YaqmCInXIsf7QxR40kAlqsyP+3PY3Q9bIBxcXJ7cbISJZUTw9BnYfU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 02:49:39.5035 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f41ac99-cd21-4114-93e0-08d74df5a938
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2491
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=82pqcUaABOaHnobq/xsWWjpfh8fzg0xgPZFnKqlfYXk=;
 b=Ft8uyhQCdSyfJo/6DsyHzw/zD8zosai/1nio4CiK7i04y5qKIkU4DzznPdSDJwSnwKFWCRqUhPVBKGV1uD4QidNWWEe7cr16qJcbOgRCjk+o+z5wwWXp/PGYF8dVnfEPpyn29FWD5uiOA5M5JHPMo6rHTc181jZygKaALviscQc=
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
Cc: Dennis Li <Dennis.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

MS4gQWRkIHRoZSBFREMgY291bnQgZnJvbSBoYXJkd2FyZS4KMi4gQWRkIFJBUyBzdXBwb3J0IGZv
ciBWTUwyIGFtZCBBVENMMiBzdWIgYmxvY2tzLgoKRGVubmlzIExpICgzKToKICBkcm0vYW1kZ3B1
OiBjaGFuZ2UgdG8gcXVlcnkgdGhlIGFjdHVhbCBFREMgY291bnRlcgogIGRybS9hbWQvaW5jbHVk
ZTogYWRkIHJlZ2lzdGVyIGRlZmluZSBmb3IgVk1MMiBhbmQgQVRDTDIKICBkcm0vYW1kZ3B1OiBh
ZGQgUkFTIHN1cHBvcnQgZm9yIFZNTDIgYW5kIEFUQ0wyCgogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ2Z4X3Y5XzAuYyAgICAgICAgIHwgOTg2ICsrKysrKysrKysrKy0tLS0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuaCAgICAgICAgICAgIHwgICAyICsKIC4uLi9hbWQv
aW5jbHVkZS9hc2ljX3JlZy9nYy9nY185XzBfb2Zmc2V0LmggICB8ICAxOCArLQogLi4uL2FtZC9p
bmNsdWRlL2FzaWNfcmVnL2djL2djXzlfMF9zaF9tYXNrLmggIHwgIDE4ICstCiA0IGZpbGVzIGNo
YW5nZWQsIDY5NSBpbnNlcnRpb25zKCspLCAzMjkgZGVsZXRpb25zKC0pCgotLSAKMi4xNy4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
