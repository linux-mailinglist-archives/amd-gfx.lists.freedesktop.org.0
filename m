Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DCD7D5A4
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 08:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D7D6E379;
	Thu,  1 Aug 2019 06:43:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780044.outbound.protection.outlook.com [40.107.78.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 680636E379
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 06:43:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTha+w7cw/ceLyMpZO+Vn5Q30zrzFMUhWRlne9hC6Ms6ogX/nN9Ch+LYdwh+vg903SFvyCv8uNO+pUx3xJHfm90ROy8QEXWWeRQTjSjO3z1QgP8lx0hj9Z7i6yBPS57k3IjZK2CmJyMCWXuz/LPWtHEFFbqsnctYDfnfUIdyTCQyxhoKekKWAyuWTm/9O1k63dHI1XCC3unDelT5RZgRq+r+lvbj8gPDRe06EiIXrk+ChZo1ftTWEXzEaHApHIYJ/AKnMvs8HVLwATTvxXYAfBXnOC/tb1YMS8ps9z0mI5YuUU0tFXAv6xIp8VAigep+s8om/Lx3N8TZ59HTXlTOIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQv3npls+Giq9gk9N4ifkJUfBdpa3Z8votYVAIuT7rs=;
 b=K75+sKvGxoZyuXZKZ+KRThNv8GRAq6ggn4zvpLAPnXrX7mGk/S88H6rtg2iZrVsx6XC3A/pLr2l3qQaWkPh9u3kIpgEazGiDNtegdAwqo+36Uq8Mu1qvPswGAnpRPzRTlvcGHbU+EDwp+BkA+8ALSHMHtqI2+rgshxv3wmaaK0bXYkOvnnUfntNzgiTpqJyF8RavsIkYI0ZDh3sYd9+07zc/Y8AnsEZzbJd6xgH2Il6CwuaQ+i5kN+Lfg/YikHJrzv98ObRqkbw4xDFqJpBZPP6ByqiOwdLTQEmqmEjDw2Py+apkDfBlbGBLhyBkqm8VbjCioIJpqYr9K3WpimIkaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from BN6PR1201CA0014.namprd12.prod.outlook.com
 (2603:10b6:405:4c::24) by DM5PR12MB2534.namprd12.prod.outlook.com
 (2603:10b6:4:b5::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.16; Thu, 1 Aug
 2019 06:43:29 +0000
Received: from DM3NAM03FT053.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::206) by BN6PR1201CA0014.outlook.office365.com
 (2603:10b6:405:4c::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.13 via Frontend
 Transport; Thu, 1 Aug 2019 06:43:29 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT053.mail.protection.outlook.com (10.152.83.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Thu, 1 Aug 2019 06:43:28 +0000
Received: from taozhou1u2.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 1 Aug 2019
 01:43:27 -0500
From: Tao Zhou <tao.zhou1@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <hawking.zhang@amd.com>,
 <dennis.li@amd.com>, <guchun.chen@amd.com>, <xinhui.pan@amd.com>
Subject: [PATCH 0/6] umc ras code refinement
Date: Thu, 1 Aug 2019 14:43:05 +0800
Message-ID: <20190801064311.7307-1-tao.zhou1@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(136003)(39850400004)(376002)(2980300002)(428003)(199004)(189003)(50466002)(48376002)(4744005)(5660300002)(70206006)(70586007)(478600001)(486006)(51416003)(316002)(7696005)(110136005)(4326008)(356004)(1076003)(6666004)(16586007)(86362001)(53936002)(2201001)(305945005)(47776003)(36756003)(2906002)(68736007)(53416004)(126002)(476003)(2616005)(186003)(8676002)(50226002)(6636002)(8936002)(81156014)(426003)(81166006)(336012)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2534; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16f151fe-06d8-4b63-29a7-08d7164b9007
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:DM5PR12MB2534; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB2534:
X-Microsoft-Antispam-PRVS: <DM5PR12MB25342EFFF04AC1CDDF487B33B0DE0@DM5PR12MB2534.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 01165471DB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: GRx7G3MhXYAqLCG/6nSOUCqdZmdcH/uciVGd2YeZdOZ4I915jEh59ntSVbdb79Sz6KlsfMpbovP7IDHOdF5zbQnjAWTCmZQG3UC8h/FHD4LNW+LHxN6H70VlZSN1EwL6F/MO5q0EMJsHH3T/DTGvZk0NItLCGVdvG12kFagL9B/PiX3BriVfroV+R8neQ41nVFht4Mj7wfAbBWqsmw3O4RhbavuVuIDRdakkD4BpvsVnuQkR3u3oc/eST4Gwu0atNTj344P29pRv8NwpeiQUlZIE5w+L5UVAzKQXVTFvNt4r37077vPj4Sz3176cg9maJ01XXju8RTnlz0Ei5sA0ZRollxO4xwrORU9Twpdl5B3WfLyoM0cLJi9gk6iFVg0uScPzsmm+IimdBVILtqCZvV50WusAkxU4EKiT9cHy/Mc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2019 06:43:28.9614 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16f151fe-06d8-4b63-29a7-08d7164b9007
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2534
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQv3npls+Giq9gk9N4ifkJUfBdpa3Z8votYVAIuT7rs=;
 b=leyvCsSAwdKP6hgsoFXiCupVD1UpS5iVF3f52XCaaKuQR9CNgYYGSaH/UT1d0y9fuMH1PK4jaXxqxIzDEgDK8xQnSLhIBeLYayTazXUAavtM/li2f7zWqrl6m42wrJTBMVVFkJNES3akvOa6zhpOfIJT+0mJB3xifraRnUwoWDk=
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
Cc: Tao Zhou <tao.zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIHNlcmllcyByZWZpbmVzIHVtYyByYXMgY29kZSwgbm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpU
YW8gWmhvdSAoNik6CiAgZHJtL2FtZGdwdTogcmVtb3ZlIHRoZSBjbGVhciBvZiBNQ0FfQUREUgog
IGRybS9hbWRncHU6IGFkZCBtb3JlIHBhcmFtZXRlcnMgYW5kIGZ1bmN0aW9ucyB0byBhbWRncHVf
dW1jIHN0cnVjdHVyZQogIGRybS9hbWRncHU6IGluaXRpYWxpemUgbmV3IHBhcmFtZXRlcnMgYW5k
IGZ1bmN0aW9ucyBmb3IgYW1kZ3B1X3VtYwogICAgc3RydWN0dXJlCiAgZHJtL2FtZGdwdTogYWRk
IG1hY3JvIG9mIHVtYyBmb3IgZWFjaCBjaGFubmVsCiAgZHJtL2FtZGdwdTogYXBwbHkgdW1jX2Zv
cl9lYWNoX2NoYW5uZWwgbWFjcm8gdG8gdW1jXzZfMQogIGRybS9hbWRncHU6IGFkZCBlcnJvciBh
ZGRyZXNzIHF1ZXJ5IGZvciB1bWMgcmFzCgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3Jhcy5jIHwgIDUgKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91bWMu
aCB8IDM2ICsrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMg
ICB8IDEyICsrKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8xLmMgICB8IDky
ICsrKysrKysrKystLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Vt
Y192Nl8xLmggICB8ICA1ICsrCiA1IGZpbGVzIGNoYW5nZWQsIDkxIGluc2VydGlvbnMoKyksIDU5
IGRlbGV0aW9ucygtKQoKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
