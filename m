Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AF65FB71
	for <lists+amd-gfx@lfdr.de>; Thu,  4 Jul 2019 18:06:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A0506E365;
	Thu,  4 Jul 2019 16:05:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740085.outbound.protection.outlook.com [40.107.74.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15EA16E362
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Jul 2019 16:05:58 +0000 (UTC)
Received: from CH2PR12CA0015.namprd12.prod.outlook.com (2603:10b6:610:57::25)
 by BN6PR12MB1185.namprd12.prod.outlook.com (2603:10b6:404:1e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2032.20; Thu, 4 Jul
 2019 16:05:56 +0000
Received: from BY2NAM03FT029.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::207) by CH2PR12CA0015.outlook.office365.com
 (2603:10b6:610:57::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.18 via Frontend
 Transport; Thu, 4 Jul 2019 16:05:56 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT029.mail.protection.outlook.com (10.152.84.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 4 Jul 2019 16:05:55 +0000
Received: from navi10-uefi.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server (TLS) id 14.3.389.1; Thu, 4 Jul
 2019 11:05:55 -0500
From: <boyuan.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 01/17] drm/amdgpu: define vcn jpeg encode ring
Date: Thu, 4 Jul 2019 12:04:13 -0400
Message-ID: <20190704160429.14758-1-boyuan.zhang@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(376002)(136003)(2980300002)(428003)(199004)(189003)(48376002)(70586007)(70206006)(7696005)(5660300002)(50466002)(36756003)(4744005)(86362001)(53936002)(4326008)(51416003)(186003)(478600001)(8936002)(16526019)(26005)(336012)(7736002)(77096007)(47776003)(81166006)(81156014)(1076003)(126002)(72206003)(486006)(2876002)(426003)(476003)(2616005)(68736007)(6116002)(53416004)(3846002)(14444005)(16586007)(316002)(50226002)(2906002)(6916009)(305945005)(6666004)(356004)(2351001)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1185; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40c544c8-d987-450c-628a-08d700997f27
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN6PR12MB1185; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1185:
X-Microsoft-Antispam-PRVS: <BN6PR12MB118585752F4F5BEE448CA52287FA0@BN6PR12MB1185.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 0088C92887
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 88abtHujXlcP2gkpdAUn3c90yCkyLospQMUl/yc6L//YIYqiLHL2xdKHuO2OIpx/5dy6LMWs1ajMYKqwffVNtbU6FCrrxX6PLPCqRkQc/VNbjLypg+kKO7SAAAAlxVqUYf0HR66PexCfJh37AQtyMXpMNx1jcXz6ZmrZ5rqXak+pPWtVWTGj2gXN6iBi1l5X+lGXB4Bimyu8zr+zLi5lhatxapKpMynvgGWHMLyKnwmoFvNRetLK69nf0WUlJClJbwJihRhb6N8izpJgXyDXcc6YFitJQJ06aMzG+7wm9RgcMrKl9/9jv2MgVSagX5tnDplltboPP9p2HRFbfSlrxpsHHoxQf2zu2kFt9Va/6+0+nNLS+ZY/HLJpPvvHreYFTnxwNXB3vwmboqo/K7z7hwX58/UkmCaeT13im8dfOYY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2019 16:05:55.7977 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40c544c8-d987-450c-628a-08d700997f27
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1185
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/PPzuog+mxgFM+eZmo9xpF9tOUYjX33A1C7TKp+f1HE=;
 b=ydEyW+4jT2ayBmIE7S+QNn+LUAdAzdVWyZiqaGSh3SbRvjvNzcREWRWMCo3HHBcH9qFyZxPNom/3BONjPxuy5/N6YBVAuC6T1M0NfAYL1HtZJ6LmUOeIBoa+V8jH2vZKWv4RNm+wJAW7W8y8AS4XHJeGfGNLKB8+LiAmm4AoVMM=
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
Cc: Boyuan Zhang <boyuan.zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQm95dWFuIFpoYW5nIDxib3l1YW4uemhhbmdAYW1kLmNvbT4KCkFkZCBBTURHUFVfUklO
R19UWVBFX1ZDTl9KUEVHX0VOQyByaW5nIGRlZmluZQoKU2lnbmVkLW9mZi1ieTogQm95dWFuIFpo
YW5nIDxib3l1YW4uemhhbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcmluZy5oIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcmluZy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3JpbmcuaAppbmRl
eCBmN2E4YmUzNjM5ZDcuLjA3ZDc0ZDUwMzQ0OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3JpbmcuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcmluZy5oCkBAIC01OCw3ICs1OCw4IEBAIGVudW0gYW1kZ3B1X3JpbmdfdHlwZSB7
CiAJQU1ER1BVX1JJTkdfVFlQRV9VVkRfRU5DLAogCUFNREdQVV9SSU5HX1RZUEVfVkNOX0RFQywK
IAlBTURHUFVfUklOR19UWVBFX1ZDTl9FTkMsCi0JQU1ER1BVX1JJTkdfVFlQRV9WQ05fSlBFRwor
CUFNREdQVV9SSU5HX1RZUEVfVkNOX0pQRUcsCisJQU1ER1BVX1JJTkdfVFlQRV9WQ05fSlBFR19F
TkMKIH07CiAKIHN0cnVjdCBhbWRncHVfZGV2aWNlOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
