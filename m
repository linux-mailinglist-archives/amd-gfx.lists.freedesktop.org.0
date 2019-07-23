Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D3D71C6C
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 18:04:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D73589FF9;
	Tue, 23 Jul 2019 16:04:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750088.outbound.protection.outlook.com [40.107.75.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1887389FF9
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 16:04:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+YIEo7XH0CN5H3jVLRvJmvNUyDSki6PvL54nMPklxaItRnTm6AvKSd1XyvBGtiXlHVa3oG/SKvhy4sSYgFJNZt2o6uo8P4a37ntYy195taYKtOon6oyz8ggs+C9P3bkFJ/jofP8xGbTjU1gsKzyjOY30jvwyypObBwTqDzmxi9DPjnKU+ptOQgVR5BIMAdk20JQNCMggOJzL47WGF/AEsFBouRlUzplSFzT4G18LlsP0LbKyTzRQqV/dmY2VLyPhR5yK6T3O3vyOFXV31/vSyYmWOzYjNhZG19A+q/JVNquM71QGoLhbRLlgLH4W3mYaClbzITYtJJBd3OKLlQvdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uD/xZn15DM0F7kFuVhhhwRH8edEYQ9VZFzSNtu4rdTU=;
 b=dT9mU6uetMOxIUuMpLAlr2BBT0qH55W9dpkRTzHgEzTMxCSIeGjhrpJaXdTbxV0/CC9GFIGlIs/5J0TZR8lcciiO92cJFL1Y+24jmXbt1dsQkD1YiZrZwcBL5joMdSa7j77GGJc928zVgc4DJ8U92jh9MfLAJRXE0s2XailsdPjHNmSs+clgIV/th0B6VaL+PBi9uqehL8RmuMcUhcCvOYt8boSo/0m9ycJNV8s9gUdackTvF/QmcyJTZBybs9owxfj4Cz84D+84acgwG33GqwDvVBppFtffC5wx8gr4ZT/paaF4c4grGEbSlcF5WPDPJNEANoC38X/d3OLHcHGQIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR1201CA0001.namprd12.prod.outlook.com
 (2603:10b6:301:4a::11) by BN6PR12MB1300.namprd12.prod.outlook.com
 (2603:10b6:404:1a::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16; Tue, 23 Jul
 2019 16:04:41 +0000
Received: from DM3NAM03FT028.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::201) by MWHPR1201CA0001.outlook.office365.com
 (2603:10b6:301:4a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2094.15 via Frontend
 Transport; Tue, 23 Jul 2019 16:04:40 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT028.mail.protection.outlook.com (10.152.82.196) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 23 Jul 2019 16:04:39 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; 
 Tue, 23 Jul 2019 11:04:38 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/amd/display: Only allow s/g when USWC flag is set.
Date: Tue, 23 Jul 2019 12:04:10 -0400
Message-ID: <1563897851-11501-3-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563897851-11501-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1563897851-11501-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(2980300002)(428003)(199004)(189003)(70206006)(426003)(126002)(446003)(336012)(14444005)(2906002)(48376002)(305945005)(5660300002)(6666004)(86362001)(356004)(4744005)(51416003)(81156014)(81166006)(16586007)(50226002)(47776003)(6916009)(2351001)(53416004)(8936002)(44832011)(8676002)(316002)(68736007)(36756003)(50466002)(53936002)(476003)(11346002)(7696005)(486006)(76176011)(4326008)(26005)(70586007)(186003)(54906003)(2616005)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1300; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee878beb-7801-4eed-fcc8-08d70f8777b8
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1300; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1300:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1300EDC43B371DB7BD37DE56EAC70@BN6PR12MB1300.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-Forefront-PRVS: 0107098B6C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: SvH3h+QEbs/kfyrLDZv5Wh+FazQiVJFq/1RviRzSxOsg2Or2wdhldDLxKgiTgrBKow+rWTICUMjo5a7WS+zbltvs5sATJ1cTOazuhOYOaFMGWdPW/+62gg0L1ZAUdE8/xJrSIRznpAyTU3Bf24/NWtZbReaGbFQMLBqpDcscNsJvVIPxSlEZvAFrChHhg7JHOBdR9IpM5YJkz+MyfOIuwyeQda6cnrxgQQVoR+v7qy6Tm+MYWMcj1vWQz5hXpRkp843NFrLr+GWGFxP1YNIeW6dBsy7Bfk+JFsQdU14prupy0xGy6k2SRXyRyOf1Q1KbWPd8c/hOYwkiEeeAMXrxDpFjlAkF1pPW4ASvBhbfYH7HRw04dhbkNhepsW2H3BRc1qLGc29n5JqICNcOGBzEay2qotSXV8coNf1NJ1l0M4Y=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2019 16:04:39.7976 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee878beb-7801-4eed-fcc8-08d70f8777b8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1300
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uD/xZn15DM0F7kFuVhhhwRH8edEYQ9VZFzSNtu4rdTU=;
 b=EYPk1NrpELJl7ZZ8tf10i6zoeZfVJGZLAzUj82ai0QrkEb9grC4q7oKrASymx2/Gi7eWakUdbEPzB0dK8bj44dfEFnHO3xoOfTNwPU18H1EUg8/eD7Sz5EXJh0e/iKU3V6ExIbpuZn8szRq2yBXlbxLYebrhlqNPaT79NLgEarU=
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
Cc: Alexander.Deucher@amd.com, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 hersenxs.wu@amd.com, Christian.Koenig@amd.com, shirish.s@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyB2ZXJpZmllcyB3ZSBkb24ndCBjYXN1ZSBIVyBoYW5nIGluIGNhc2UgdGhpcyBmbGFnIGlz
IG1pc3NpbmcuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6
b3Zza3lAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNo
ZXJAYW1kLmNvbT4KVGVzdGVkLWJ5OiBTaGlyaXNoIFMgPHNoaXJpc2guc0BhbWQuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwppbmRleCA5
ZWY3ODU0Li4yZDUwZWVhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9h
bWRncHVfZG0vYW1kZ3B1X2RtLmMKQEAgLTQ0MTMsNyArNDQxMyw3IEBAIHN0YXRpYyBpbnQgZG1f
cGxhbmVfaGVscGVyX3ByZXBhcmVfZmIoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCiAJCXJldHVy
biByOwogCX0KIAotCWlmIChwbGFuZS0+dHlwZSAhPSBEUk1fUExBTkVfVFlQRV9DVVJTT1IpCisJ
aWYgKHBsYW5lLT50eXBlICE9IERSTV9QTEFORV9UWVBFX0NVUlNPUiAmJiAocmJvLT5mbGFncyAm
IEFNREdQVV9HRU1fQ1JFQVRFX0NQVV9HVFRfVVNXQykpCiAJCWRvbWFpbiA9IGFtZGdwdV9kaXNw
bGF5X3N1cHBvcnRlZF9kb21haW5zKGFkZXYpOwogCWVsc2UKIAkJZG9tYWluID0gQU1ER1BVX0dF
TV9ET01BSU5fVlJBTTsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
