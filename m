Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C524C88519
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 23:39:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E326EED4;
	Fri,  9 Aug 2019 21:39:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820070.outbound.protection.outlook.com [40.107.82.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFAAD6EECD
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 21:38:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Me5F8/l16UNHmCJztTWqA0ISsJg7HJ7RyMtqAv/CdLyWkA1CGh4pkeF+K8I8K5a3URAw2BuKrlVyNPpa7HwQu9RHqzsimViz5PkOyv7QtFwf7WWc8/Gh6JppsJmdy/QAubU2to9Bi8GX4jGOAJCSi1mlacjPUlTtbfNKTfLKngxFLilNACLDwvGb1E04tQlD9zPHDM37boUL5jgnakjeivew/AKEm7tT8cMY61Let7nNk9T242BHgfRnVrv07TMYlpcEG09UnebiSASL8j2nubFJAtbtt1z6SGfw4g5BajCYK7Z31RUIXi1yx4TyqtFov2LAR/sUUzoTIec6sU+SmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4v6f3TV/d3vPksK3xdTybLUa0kYFB0/fREX+KKn5N8k=;
 b=fNWIni2tdhfwHcjbcPgH/046S6j/taLrqxQg31pC4Bhp9d+MkfNW//QZXXC3hLcjEUiLbRnHcHOT8JGBBoZhEa+9e8YGM86m5/D9Co7WXVy1pMHMoLPivoIrSW52uu6Ezh/XezyUXul+6qtajfOgJblOl/m0xWY22zi/6xFR/QQvIEr8lmAsLbzLCOfgQQat3fGbf+zXeo0WLOM6lrXX4D3upx2pz/SkB7CpdDqVZ5u5G2COSc2mJBlpLeEMuYcwj5rMUdp9bTi6ijy6ocXjGymW54zPsSHqdn6lhFhkggAwh6K8voE69OrUvq6i/8WZw5wQhsskpk+hnXO+JSu3EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR12CA0030.namprd12.prod.outlook.com (2603:10b6:405:70::16)
 by DM6PR12MB2713.namprd12.prod.outlook.com (2603:10b6:5:49::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.20; Fri, 9 Aug
 2019 21:38:54 +0000
Received: from DM3NAM03FT062.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::209) by BN6PR12CA0030.outlook.office365.com
 (2603:10b6:405:70::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.15 via Frontend
 Transport; Fri, 9 Aug 2019 21:38:54 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT062.mail.protection.outlook.com (10.152.83.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Fri, 9 Aug 2019 21:38:54 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Fri, 9 Aug 2019 16:38:43 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 42/49] drm/amd/display: 3.2.45
Date: Fri, 9 Aug 2019 17:37:35 -0400
Message-ID: <20190809213742.30301-43-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190809213742.30301-1-sunpeng.li@amd.com>
References: <20190809213742.30301-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(396003)(346002)(2980300002)(428003)(189003)(199004)(47776003)(4326008)(81166006)(8676002)(86362001)(2876002)(76176011)(81156014)(2906002)(478600001)(476003)(2870700001)(336012)(126002)(49486002)(11346002)(2616005)(486006)(426003)(186003)(446003)(53936002)(51416003)(26005)(36756003)(305945005)(2351001)(14444005)(6666004)(356004)(316002)(54906003)(8936002)(4744005)(1076003)(48376002)(70586007)(5660300002)(50466002)(50226002)(6916009)(70206006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2713; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34c698bd-6d03-404c-8732-08d71d11fa2e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM6PR12MB2713; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2713:
X-Microsoft-Antispam-PRVS: <DM6PR12MB27134DCA7D08A4D4C61556E482D60@DM6PR12MB2713.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 01244308DF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: MJNRdzFRE1mg3VPfL1ditMuJ/htA70CqkofjnpmqjCOM0hKWS6j11WhCZLWOxnYvHubI9GvsLnXQfon+UJyDhXNiRhr+gnpucHN/OmU8Q8BsHgRoMzFStWX/0iWxfd6IRGoZvDvnM/rdJToP2aviU/lUd4bTSwZqHKzcJbhza4bBcivxjs0mOIFqtX838dyyRGxM5+aPlHiMTJOsvHwv0+d4viVQqm4lhQDJWSCF0c0JGhwW0dNg+6/8nXmlwQTSdJW3D9gX+I155lflftQIYb8kNGIamAjFd2AJ9npo4ss8bdmMP84VCw4ShoowLJDy+BVnbT6NC2Kn8A571J2B+nzeCuE0kMV5uBHIMrS/kkVhalBvaG4ER/CA1dzgneRu07tKhtdH1aZjIxtn2fpbzZOn+vvS/8EnjMCpgGW5bSg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 21:38:54.3175 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c698bd-6d03-404c-8732-08d71d11fa2e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2713
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4v6f3TV/d3vPksK3xdTybLUa0kYFB0/fREX+KKn5N8k=;
 b=mtNVNc1cZBCzZUylmEKVqSCkoatH9c/3gqsNmKUoExxZ9z1S2lYzCedVbZBI2nlYnJruHnIMpU+S4N94FAX+ttrWGES9407Mtg73DPofrHuhrrIMGDQOvakyPO22JHYk/fcDdwERU+pvdn3lmoiGaLvnkY/JmdouXu0owr8oRaU=
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
Cc: Leo Li <sunpeng.li@amd.com>, Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQW50aG9ueSBLb28gPEFudGhvbnkuS29vQGFtZC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBB
bnRob255IEtvbyA8QW50aG9ueS5Lb29AYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVu
Zy5saUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmggYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaAppbmRleCA1ZTUzYTllYWJiMzQuLjdiYzE2ZWFmOGIw
MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKQEAgLTM5LDcgKzM5LDcgQEAKICNp
bmNsdWRlICJpbmMvaHcvZG1jdS5oIgogI2luY2x1ZGUgImRtbC9kaXNwbGF5X21vZGVfbGliLmgi
CiAKLSNkZWZpbmUgRENfVkVSICIzLjIuNDQiCisjZGVmaW5lIERDX1ZFUiAiMy4yLjQ1IgogCiAj
ZGVmaW5lIE1BWF9TVVJGQUNFUyAzCiAjZGVmaW5lIE1BWF9QTEFORVMgNgotLSAKMi4yMi4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
