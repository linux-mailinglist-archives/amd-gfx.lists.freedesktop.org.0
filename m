Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B633F95819
	for <lists+amd-gfx@lfdr.de>; Tue, 20 Aug 2019 09:17:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4C6089DC5;
	Tue, 20 Aug 2019 07:17:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740057.outbound.protection.outlook.com [40.107.74.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D761B89DC5
 for <amd-gfx@lists.freedesktop.org>; Tue, 20 Aug 2019 07:17:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=chaYPb/PgdcOWK0QPRXAPZfgJ/UHXUwIRNRWajZYopF32WY854N//ubYhLwOtJAArcc7wiQ23B2HVt0bTqDElH3+0iS0ineuBlKZbbaVQhbgMznpDTPAW/je27T7GiCzZMsTmD6pCiEtfdiNbL1/Fx1vS1aa1pHFRobVqFCYbVtPjkbVF4UqN9PPZlZ1jwLHf/yWasrCgGNlcOgLhWCS5S2aazEV+PdNuOKYUJPstNka4b1PPSngW8t+9Y8ResGvcO95IBpt1F+OB7PCQJ9rLm1CiXy/3SCustrzFoHfYw0YE++NhZxpcjANiTA6lT9ASMQ1ETlOlhMQ5BHDXalE+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+O7Qxbh80pY0AB32Xj7B4toN0TPUerCG5v3AbKemw0=;
 b=b1Bj3pvHk489AjILcXByuZYupAbPl6ug4uSCvqmHjZ4ZehZBccX58AUCXy/ItIgsDRKpuHuEap3KcGFM9z8IikTKDS/WADu8EE9VNbmhvLX508JKUx+j1apMQs3YiJk/XIgeF+jb/WKboU4BoXQtMU+oqCShhWg5bfj+M9uXBXthPOVa2zAsWGPb1S91M99gHi0kTDKa9sUkjBdSsb9QIANuH7XvYijr8hrL8kxMaEYR70zreH8URP19M559VHJTiv7f5cxIozxN55RIk8XmAjDcd/SiIZ/sG0e9Xk/5iB9uBz+LvZIXyKv/KeqzNk2xRpQdIk5rIZUe3v2ps2pCpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR12CA0070.namprd12.prod.outlook.com (2603:10b6:300:103::32)
 by MWHPR12MB1280.namprd12.prod.outlook.com (2603:10b6:300:12::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.19; Tue, 20 Aug
 2019 07:17:24 +0000
Received: from CO1NAM03FT022.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::203) by MWHPR12CA0070.outlook.office365.com
 (2603:10b6:300:103::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Tue, 20 Aug 2019 07:17:24 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT022.mail.protection.outlook.com (10.152.80.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Tue, 20 Aug 2019 07:17:23 +0000
Received: from lnx-kenneth.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 20 Aug 2019
 02:17:18 -0500
From: Kenneth Feng <kenneth.feng@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/amd/amdgpu: disable MMHUB PG for navi10
Date: Tue, 20 Aug 2019 15:17:14 +0800
Message-ID: <1566285434-12651-1-git-send-email-kenneth.feng@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(396003)(346002)(136003)(2980300002)(428003)(189003)(199004)(53936002)(16586007)(305945005)(316002)(4744005)(5660300002)(36756003)(50466002)(48376002)(47776003)(2906002)(53416004)(478600001)(70586007)(356004)(70206006)(51416003)(7696005)(6666004)(336012)(186003)(26005)(2351001)(44832011)(81166006)(14444005)(426003)(50226002)(8676002)(81156014)(8936002)(476003)(6916009)(2616005)(86362001)(4326008)(486006)(126002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1280; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd1519cc-3fd7-42f0-e9dd-08d7253e72c1
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1280; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1280:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1280B47F4B868FDF3D8FB5098EAB0@MWHPR12MB1280.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-Forefront-PRVS: 013568035E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: PKhp+eO26CMrJtVc2PL11F5Yg+eOawU7LkOD436oHc08FPrwBcjhOzETIqpEQu0LcZL5oCImnO+dJAdxqVvaVFMKFxyCgITWm0IoJrC13qVe2DgFNwvCrKILHzHVnifDDFbXxlpCsW4ExSsAf27UloxpmpdtXQxLk/6TGsbPmNwk6x9H8mBrq8r2kUYZD2zcb0kxRqQTUs2kHqTdgKApNK7oX5DO3nUZBmDSu1l+sV+0cyJu9whgg3JBxiY069O3M/nEUohdkmi1iaCpCgj3SLrCP0MWkrZFXVmp3caU8juf5jER0NWKTFCYikmrShc7jcj/kw981QI9na/IuiBy8EynfxPfhYY4j+y411mwfYFRJ4RUupbOnivq9c8wIRkgYVVqHCJ7TFUGfOUUTPGfy3dLkZJ68Q/EOgIUtW/YDAw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2019 07:17:23.5963 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd1519cc-3fd7-42f0-e9dd-08d7253e72c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1280
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+O7Qxbh80pY0AB32Xj7B4toN0TPUerCG5v3AbKemw0=;
 b=00++OP/ifdFx8EQMiKjkgE+Y5sDjw/6QaMBITgzaU6o2R+TB+JmlZyh3TLJ/T60K9tt4V2JGOyaVMwrJKr0eF4fmhgz5XR+7AkM9wa2BKdgywOtl1z3+RuHAOGeDzuVrMI30IxOSeK9Y6O77oEo1yNJTzxUU2XLe1MfOnhTEWOk=
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
Cc: Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RGlzYWJsZSBNTUhVQiBQRyBmb3IgbmF2aTEwIGFjY29yZGluZyB0byB0aGUgcHJvZHVjdGlvbiBy
ZXF1aXJlbWVudC4KClNpZ25lZC1vZmYtYnk6IEtlbm5ldGggRmVuZyA8a2VubmV0aC5mZW5nQGFt
ZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYyB8IDEgLQogMSBmaWxl
IGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9udi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYwppbmRleCBkNGEy
MDEyLi40NmY0MDJhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMKQEAgLTYxNiw3ICs2MTYsNiBA
QCBzdGF0aWMgaW50IG52X2NvbW1vbl9lYXJseV9pbml0KHZvaWQgKmhhbmRsZSkKIAkJCUFNRF9D
R19TVVBQT1JUX0JJRl9MUzsKIAkJYWRldi0+cGdfZmxhZ3MgPSBBTURfUEdfU1VQUE9SVF9WQ04g
fAogCQkJQU1EX1BHX1NVUFBPUlRfVkNOX0RQRyB8Ci0JCQlBTURfUEdfU1VQUE9SVF9NTUhVQiB8
CiAJCQlBTURfUEdfU1VQUE9SVF9BVEhVQjsKIAkJYWRldi0+ZXh0ZXJuYWxfcmV2X2lkID0gYWRl
di0+cmV2X2lkICsgMHgxOwogCQlicmVhazsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
