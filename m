Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A41ADA822
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 11:17:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 681FD6EA14;
	Thu, 17 Oct 2019 09:17:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690050.outbound.protection.outlook.com [40.107.69.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A9C6EA14
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 09:17:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eb7R+lkP4RMK++oOp17mQEeydadyekIbqo/yY+ZkgDHZ/dP9o9vY5kEtJ5o3AZ2uFVd3se8J5AvPEIKQMgqpInenGFWB0dW41TYYcAjtmOd2VPgg7A4IImyrFMEnlDTg4LUHfbBBqsWT1toi412uHvVcLVOQjydk+DbWrDwBVkS/m+sqQwz02BkyyK4wPFHrktz6BFOdDpvD8pb3hK6CsPw4N49gFZDrYexc7rYiBtdZChrBFQLoiWzxDDfpeXRJpROROLmDg0Q02pYvlD5cDW2BRMJoxe+r1RZASGO1b2X0xjdi62bKsFg6Ks74t26PAUQmywndPLi9Gh26u36ZHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fGJOnBSroSnX1SxXeB4L/U5DmGFQHLQjxpQ4weXki4o=;
 b=CoF26nEYKyuTAS3NpdUgRBA4e6FUhOI42kfOadLmIAmERc0gUVwWQ5GrPXAzIjYWaaZgcrsQSz7tLI+dY63qZrwf8o7/xEt8OqDfpzTpLRfSs6ZG+T+g4SGCjKyDVy2JDVV07ftQiBaRSgaBqLNaoua78cznr+PIG6byd8E9rBfehj1KgE0JVGHmHJAfAxk5Jfjz3i67ldDc7SitLYytouZPUqELIlZu8zPZWLsutslmSM1ke5+FEbGs145lDd4OeKW3x+qVFsf+WetNAi2KksK9vWpZQkx1wtb2cx4lSVknhThnT/KflSo/IoGphO2wrlRRS9z9xtSoaiBaSWlFug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MN2PR12CA0021.namprd12.prod.outlook.com (2603:10b6:208:a8::34)
 by BN8PR12MB3172.namprd12.prod.outlook.com (2603:10b6:408:68::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Thu, 17 Oct
 2019 09:17:02 +0000
Received: from BY2NAM03FT036.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::205) by MN2PR12CA0021.outlook.office365.com
 (2603:10b6:208:a8::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.18 via Frontend
 Transport; Thu, 17 Oct 2019 09:17:02 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BY2NAM03FT036.mail.protection.outlook.com (10.152.85.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2367.14 via Frontend Transport; Thu, 17 Oct 2019 09:17:02 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 04:17:00 -0500
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 04:17:00 -0500
Received: from wayne-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Thu, 17 Oct 2019 04:16:58 -0500
From: Wayne Lin <Wayne.Lin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: Avoid sending abnormal VSIF
Date: Thu, 17 Oct 2019 17:11:22 +0800
Message-ID: <20191017091122.8922-1-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(39860400002)(396003)(428003)(189003)(199004)(70586007)(81156014)(8676002)(8936002)(70206006)(47776003)(336012)(81166006)(50226002)(476003)(2906002)(2616005)(186003)(426003)(7696005)(26005)(48376002)(486006)(51416003)(53416004)(6916009)(16586007)(316002)(6666004)(36756003)(356004)(4744005)(86362001)(305945005)(126002)(2351001)(4326008)(50466002)(478600001)(54906003)(1076003)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3172; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6340974-e6b6-43e3-3312-08d752e2c569
X-MS-TrafficTypeDiagnostic: BN8PR12MB3172:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3172E58026362ACD7F70549AFC6D0@BN8PR12MB3172.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-Forefront-PRVS: 01930B2BA8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aOmwls7k6bJKO0eTzDr4xXefoTvAYf/xf20Ctapg3AweqooespCLl2ZAo+Rmpr7nEeQTEVPEJLhbiSgoSxCVWjl6ZzeQ4MgiB1LZNgCbzhoW0HqNXVkNNrl+ZbLpHC8jb62nz+yNzP6NaFqHe2P4dr3OYWqWnNpvmnfmL/mVrN7sr8ZWTqIcjdFAPRChHSZcrXNhZeVyzvW7cODRwQoBytJstWecQC77uCEDDVhgfmLAz0yg1+IeOgpFL6tCeqQ0pZvNgLmQvll1s+UnHQtGMZH1vKvTI82S/ZMR54RovUggarmh47CWoNCXiZKN8tRG1JcbP9oVUQj/RPUpV2ti88IH26oPWNVgBxeIsndxqk6iG0KAtzcJGFrQvghwf4s2M4FT6RmW7WOuOstXF9OUdNRtLcJuPIV7rOUBXLB9Z6U=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 09:17:02.3020 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6340974-e6b6-43e3-3312-08d752e2c569
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3172
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fGJOnBSroSnX1SxXeB4L/U5DmGFQHLQjxpQ4weXki4o=;
 b=z1bQVbojyV0+TvXj93qLiXV2hEW3deFHEDy85kRX2zK8OXRKHmOShKD9+pqYJkn22klpGPRP5LHY428qJusq6Y4Wrux35KwRuP1zeOGDUOLjrmF46NrnfwC8OU913P6M6/nGr5DRnmRswcCSY479VDUWL+UpZoFS1iVOlzsJnd4=
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
Cc: Sunpeng.Li@amd.com, harry.wentland@amd.com, Nicholas.Kazlauskas@amd.com,
 Wayne Lin <Wayne.Lin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KV2hpbGUgc2V0dGluZyBoZG1pX3ZpYywgaHZfZnJhbWUudmljIGlzIG5vdCBpbml0aWFs
aXplZCBhbmQgbWlnaHQKYXNzaWduIGEgd3JvbmcgdmFsdWUgdG8gaGRtaV92aWMuIENhdXNlIHRv
IHNlbmQgb3V0IFZTSUYgd2l0aAphYm5vcm1hbCB2YWx1ZS4KCltIb3ddCkluaXRpYWxpemUgaHZf
ZnJhbWUgYW5kIGF2aV9mcmFtZQoKU2lnbmVkLW9mZi1ieTogV2F5bmUgTGluIDxXYXluZS5MaW5A
YW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbS5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwppbmRleCAx
MGNjZTU4NDcxOWYuLjMzYTQ1NWM5MGUyNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCkBAIC0zNDcyLDYgKzM0NzIsOSBAQCBzdGF0
aWMgdm9pZCBmaWxsX3N0cmVhbV9wcm9wZXJ0aWVzX2Zyb21fZHJtX2Rpc3BsYXlfbW9kZSgKIAlz
dHJ1Y3QgaGRtaV92ZW5kb3JfaW5mb2ZyYW1lIGh2X2ZyYW1lOwogCXN0cnVjdCBoZG1pX2F2aV9p
bmZvZnJhbWUgYXZpX2ZyYW1lOwogCisJbWVtc2V0KCZodl9mcmFtZSwgMCwgc2l6ZW9mKGh2X2Zy
YW1lKSk7CisJbWVtc2V0KCZhdmlfZnJhbWUsIDAsIHNpemVvZihhdmlfZnJhbWUpKTsKKwogCXRp
bWluZ19vdXQtPmhfYm9yZGVyX2xlZnQgPSAwOwogCXRpbWluZ19vdXQtPmhfYm9yZGVyX3JpZ2h0
ID0gMDsKIAl0aW1pbmdfb3V0LT52X2JvcmRlcl90b3AgPSAwOwotLSAKMi4xNy4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
