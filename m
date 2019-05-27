Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E34532BAEA
	for <lists+amd-gfx@lfdr.de>; Mon, 27 May 2019 21:52:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D6CF89AD2;
	Mon, 27 May 2019 19:52:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820078.outbound.protection.outlook.com [40.107.82.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B3689AC6
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2019 19:52:19 +0000 (UTC)
Received: from DM5PR12CA0003.namprd12.prod.outlook.com (2603:10b6:4:1::13) by
 DM5PR1201MB0058.namprd12.prod.outlook.com (2603:10b6:4:50::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Mon, 27 May 2019 19:52:18 +0000
Received: from CO1NAM03FT022.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by DM5PR12CA0003.outlook.office365.com
 (2603:10b6:4:1::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.16 via Frontend
 Transport; Mon, 27 May 2019 19:52:18 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT022.mail.protection.outlook.com (10.152.80.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Mon, 27 May 2019 19:52:18 +0000
Received: from leodev.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 27 May 2019
 14:52:00 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 20/26] drm/amd/display: Modified AUX_DPHY_RX_CONTROL0
Date: Mon, 27 May 2019 15:50:59 -0400
Message-ID: <1558986665-12964-21-git-send-email-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558986665-12964-1-git-send-email-sunpeng.li@amd.com>
References: <1558986665-12964-1-git-send-email-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(346002)(376002)(396003)(39860400002)(2980300002)(428003)(199004)(189003)(53936002)(51416003)(16586007)(47776003)(36756003)(478600001)(316002)(7696005)(76176011)(81166006)(81156014)(446003)(11346002)(2616005)(486006)(2351001)(8936002)(126002)(476003)(5660300002)(8676002)(426003)(356004)(336012)(77096007)(14444005)(26005)(2876002)(4744005)(53416004)(305945005)(50226002)(72206003)(2906002)(186003)(50466002)(48376002)(4326008)(68736007)(70206006)(86362001)(6916009)(70586007)(86152003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0058; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 213feb5d-6dea-4892-38ff-08d6e2dcd32c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR1201MB0058; 
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0058:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB00587DC92D6D87CA62A0FC7A821D0@DM5PR1201MB0058.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-Forefront-PRVS: 0050CEFE70
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 8gEX/XVnsAXiY1/rU29LNVUsJ8MwMtp4KffwkzcMQYGdHlYg0mbImSeiWs7YxsimpArpEab1waorP5K7GeJ5ZMcBMptArKev3UCMyaJyBMNNqF6HfgDgmlL79Vj04DHY6OQyQMO3L+N09SbzhuE/sVvtpmlckg9ZdhjFcl88qeEltz/2gp8v+ddDNBs1nnypmK5hyH5AhBMzV9jfA+ztXHrlc63XrEMCbzwI0CRvFLK42cnsjcegaq+sGvTMjYNw9qr5LNNKXLdusaG8CBakfnrMlaHGsLiXdgmfdKtEpkkmM8iCUi4YtzdDrVSeieqghsMzn9/lHPNXHv5JI1SC+shvWviyzOmXLhM73hc/pcUPra3GC4rwIeXZNNKxzyU4asjy0zsvGvxMyR0KqyR8qegoDedW9qq3uflC+sszRXE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2019 19:52:18.0785 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 213feb5d-6dea-4892-38ff-08d6e2dcd32c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0058
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3MpymewvVIvbypmFEgbAS16o7VE0FBdC6VD3ZYn6f/M=;
 b=pw3Hbry2lANCkwl3/9TWHO3qzXAo5hvErA1ioB9V6PgfKiXvZEUDsfyp0GBYmFD9Cly6S79F3/ZbXvDm5UJ1OtC/YZKZcFUWXbQwc9QE+kBTyKNKgNBGQr/BItxikwwPwhRVbg7zDLuEk+wbgTL98wVYsGZOd1Jdaj4SmggeLaE=
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
Cc: Daniel He <daniel.he@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRGFuaWVsIEhlIDxkYW5pZWwuaGVAYW1kLmNvbT4KCltEZXNjcmlwdGlvbl0gVGhpcyBp
cyBjYXVzZSBieSBmYWlsaW5nIHRvIHJlYWQgbGluayBjYXBzIGZyb20gZHJpdmVyLgoKU2lnbmVk
LW9mZi1ieTogRGFuaWVsIEhlIDxkYW5pZWwuaGVAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IENoYXJs
ZW5lIExpdSA8Q2hhcmxlbmUuTGl1QGFtZC5jb20+CkFja2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcu
bGlAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNu
MTBfbGlua19lbmNvZGVyLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNuMTAvZGNuMTBfbGlua19lbmNvZGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNuMTAvZGNuMTBfbGlua19lbmNvZGVyLmMKaW5kZXggZTI1YWU0My4uMzM5NmU0OSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2xp
bmtfZW5jb2Rlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9k
Y24xMF9saW5rX2VuY29kZXIuYwpAQCAtMTM1OSw1ICsxMzU5LDUgQEAgdm9pZCBkY24xMF9hdXhf
aW5pdGlhbGl6ZShzdHJ1Y3QgZGNuMTBfbGlua19lbmNvZGVyICplbmMxMCkKIAogCS8qIDEvNCB3
aW5kb3cgKHRoZSBtYXhpbXVtIGFsbG93ZWQpICovCiAJQVVYX1JFR19VUERBVEUoQVVYX0RQSFlf
UlhfQ09OVFJPTDAsCi0JCQlBVVhfUlhfUkVDRUlWRV9XSU5ET1csIDEpOworCQkJQVVYX1JYX1JF
Q0VJVkVfV0lORE9XLCAwKTsKIH0KLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
