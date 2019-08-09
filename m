Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7E088500
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 23:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EA496EEBD;
	Fri,  9 Aug 2019 21:38:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730056.outbound.protection.outlook.com [40.107.73.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F74B6EEB0
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 21:38:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gbw2Ds3rEM7f2SWGTaX5c2IEFS7CVzvB78TWAB347O52J4h6rijVHdVL5+L8oz/60SfdLRTk1yv+TxuiiKIV6GCldFHGNAcqOt1UMc4zRWFcjzCy/JrRBZxxC4n+KB32RMYNim1jcpBL8rr+sIW7PV8vjbkeKfy6P24STnzQ0R3HX37hiKrppsrzLi+hg0QxZAL72Esx/1bKknCRxOnvNgMrGRQw4P5FaSQbDWm6RptRjbp4Bk10PTCFEu7F9bPG5qrnlfxDXCvIX7ObVnb8t7scrz32ZDxWTR6qtOTDOg+17tsxGBXZQTIMUsgwqzovz31ucSm502hPrf/B0emq6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vou4K3VNPejZtnhTyzS6x9sS8tW9yfy0xbSjno0wZZ4=;
 b=QAb8GHvLmePbYBdWAe0IkCMU1nonP/DdthGr7FSHIeCwe23S4venib7LSP8OBpZKRU+taPrFeLb+/LqX1UxY4CEG3N7EAFlrLXBbC7oGHor63hMpZELzqK+wZIdFdwjsbZq+lLkuBwkZWazkao7kXVpNVQqWGwmfWTZZzCBkTLiCgCRjW8cLsSD9gP3oBCF1IL6or97bm1MNjhl/6Rrw4hnOvw60Ub9m4XzY6WXZMgtxFfB9T24peVwRXuZfpJ3hB2ZkgGrSgbIiHnghjQSf7YfcL8R+b9vlQx5y+l0/CV+o6DIkZLhJkDo6E6GUCpJyLdvYUlPXLwYSkd6PAMOqEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CY4PR1201CA0008.namprd12.prod.outlook.com
 (2603:10b6:910:16::18) by MWHPR12MB1278.namprd12.prod.outlook.com
 (2603:10b6:300:10::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.17; Fri, 9 Aug
 2019 21:38:37 +0000
Received: from DM3NAM03FT040.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::209) by CY4PR1201CA0008.outlook.office365.com
 (2603:10b6:910:16::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.15 via Frontend
 Transport; Fri, 9 Aug 2019 21:38:37 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT040.mail.protection.outlook.com (10.152.83.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Fri, 9 Aug 2019 21:38:37 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Fri, 9 Aug 2019 16:38:30 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 23/49] drm/amd/display: 3.2.44
Date: Fri, 9 Aug 2019 17:37:16 -0400
Message-ID: <20190809213742.30301-24-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190809213742.30301-1-sunpeng.li@amd.com>
References: <20190809213742.30301-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(39860400002)(346002)(2980300002)(428003)(199004)(189003)(51416003)(446003)(2870700001)(48376002)(11346002)(8936002)(4326008)(426003)(486006)(50466002)(86362001)(2906002)(50226002)(36756003)(53936002)(336012)(14444005)(2351001)(305945005)(6916009)(54906003)(186003)(76176011)(316002)(4744005)(2876002)(356004)(5660300002)(1076003)(81166006)(81156014)(8676002)(126002)(6666004)(478600001)(476003)(26005)(70206006)(70586007)(47776003)(49486002)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1278; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69c80319-fdfb-47f2-eb30-08d71d11effd
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1278; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1278:
X-Microsoft-Antispam-PRVS: <MWHPR12MB12782195915C46586BAF342782D60@MWHPR12MB1278.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 01244308DF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: TZRrhIgbBSyJYTgwXp7YUbgSIOsYSF38kcXfj7Ln8g5rI3eE9z5MRXhXEu0XtsW/CpyjY1kJHHuZ0QvrTXy0Qy1ScBFVUZpbqldWpI+goqRVoGm3MzY+HUzGTum+Mlam5bhrUxKG7me+T3Pmk6NnmfORYQ6UB0x091cZA4Cv1V+xDBZAUqxdHUCgjO4UEQq42Vt/Z3SCWStBkKV3lJ6vkCM752D6XVJJD6BNqXNPibShsb7sy7uIAPsBxAahA74lWwL1tlYDrp37tQOXosMW/FrXuBH+S0ZxPqeKf/Ma11dKbROLIkfy5g6OKEGsh5eVNUw9dJjH9f1+En2TvzXvbNUin+NZkLAkq/n2wWTIYHU+h7djfwEReiiT6t9iYT367GjKKd1GzLuweLREuKRKMjR4A8loz/48t+JpznqTPmQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 21:38:37.2618 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69c80319-fdfb-47f2-eb30-08d71d11effd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1278
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vou4K3VNPejZtnhTyzS6x9sS8tW9yfy0xbSjno0wZZ4=;
 b=rzc5mFgB4ryAPlSuPvdhDu6BjuCTmEAOUf92KNfGSCa5YNEg5YLWAT3R2ex+YRG/hs2w3ixrwMVCSZz2JhN3kOTsr5Q7E1UaGKyl5MBDMhIhrK30Lr/+orO7PjJBiPGt1/kKdJna3QCcZoUBBbT9ggZJdkMBbMFFsSD4v/4Wlxk=
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
Cc: Leo Li <sunpeng.li@amd.com>, Aric Cyr <aric.cyr@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQXJpYyBDeXIgPGFyaWMuY3lyQGFtZC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBBcmljIEN5
ciA8YXJpYy5jeXJAYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGMuaAppbmRleCAyZDNjYWE5MWQ4MjYuLjVlNTNhOWVhYmIzNCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKQEAgLTM5LDcgKzM5LDcgQEAKICNpbmNsdWRlICJpbmMv
aHcvZG1jdS5oIgogI2luY2x1ZGUgImRtbC9kaXNwbGF5X21vZGVfbGliLmgiCiAKLSNkZWZpbmUg
RENfVkVSICIzLjIuNDMiCisjZGVmaW5lIERDX1ZFUiAiMy4yLjQ0IgogCiAjZGVmaW5lIE1BWF9T
VVJGQUNFUyAzCiAjZGVmaW5lIE1BWF9QTEFORVMgNgotLSAKMi4yMi4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
