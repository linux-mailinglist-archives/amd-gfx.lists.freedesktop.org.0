Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2548A49866
	for <lists+amd-gfx@lfdr.de>; Tue, 18 Jun 2019 06:39:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 506B56E0C1;
	Tue, 18 Jun 2019 04:39:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780074.outbound.protection.outlook.com [40.107.78.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E0F6E0C1
 for <amd-gfx@lists.freedesktop.org>; Tue, 18 Jun 2019 04:39:27 +0000 (UTC)
Received: from DM3PR12CA0097.namprd12.prod.outlook.com (2603:10b6:0:55::17) by
 MWHPR12MB1278.namprd12.prod.outlook.com (2603:10b6:300:10::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Tue, 18 Jun 2019 04:39:25 +0000
Received: from BY2NAM03FT021.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::202) by DM3PR12CA0097.outlook.office365.com
 (2603:10b6:0:55::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1987.13 via Frontend
 Transport; Tue, 18 Jun 2019 04:39:25 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT021.mail.protection.outlook.com (10.152.84.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1987.11 via Frontend Transport; Tue, 18 Jun 2019 04:39:24 +0000
Received: from hawzhang-All-Series.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 17 Jun 2019 23:39:20 -0500
From: Hawking Zhang <Hawking.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amdkfd: initialize mqd_manager_init function for
 navi10
Date: Tue, 18 Jun 2019 12:39:14 +0800
Message-ID: <1560832754-4482-1-git-send-email-Hawking.Zhang@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(396003)(346002)(376002)(2980300002)(428003)(199004)(189003)(356004)(68736007)(50466002)(426003)(6666004)(4744005)(72206003)(478600001)(305945005)(2906002)(486006)(4326008)(48376002)(476003)(2616005)(126002)(47776003)(54906003)(86362001)(8936002)(14444005)(336012)(8676002)(53416004)(51416003)(7696005)(50226002)(53936002)(316002)(26005)(186003)(36756003)(81156014)(81166006)(6916009)(2351001)(16586007)(77096007)(5660300002)(70206006)(70586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1278; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3058a003-b2a8-419c-6060-08d6f3a6f0a5
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:MWHPR12MB1278; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1278:
X-Microsoft-Antispam-PRVS: <MWHPR12MB12784F0083B7B8EA32B005EBFCEA0@MWHPR12MB1278.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 007271867D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: rlssxtMwCjgBwE5/SeubqmmSMj+q0KtBvGPxGT30IwhPogwcJBgN18m2223g2YyG0BsTCwMD4O4jTOu0pfI3RE+C8m1GuFq0yvwG0Ue9HrKKio5zHMYRK13jWBe9QMGi09HdxS3crCSvsin6capEoHD0ydDNxN729NIpZBNtIqW+gdDxaX/uf1A4Q5+06IV2bL0D+g6q7Hmx4yqJ5vsgNbU4jtLuOw0wF2AEEyYr1qPDmLsjJ9h0+4mlV1SKfwsUfwlW2D8j8X9IpBtuIIO7roj8m2yhLj5NVMMvdyzeewUjkkVefQn3lEK12vXq0EJ9AmBzUly8mAPHoZnn2sazb/1e8dCuMvN+yAv35ppxyigZSL4Ngh38/jWD2C0szXrRWvJDXzAMkTY7wM/0ngMusBzFD2N07kEL67EseSSE5a0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2019 04:39:24.3581 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3058a003-b2a8-419c-6060-08d6f3a6f0a5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1278
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j46DDQ/PmBF8h1ylySZIxEt8VIiLj8HnUXNPz4iqWBE=;
 b=V7uvCqcMwDPI7fHmrA7rHMk8gyY5yseclsIHHPlGZcEsvdXKvq7O5Z/u79x+s2KWmEfNK5qt3U4D0iMK14TLAfUkI2upSngRC0Qz2Vz4yyFm46jX4Fe8MRt69Z4aqR+x31fiMdqbnAubQjb0bcb3tOB6kWjBnOsB9sTeUGt9+E0=
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Q2hhbmdlLUlkOiBJNDNjNTA3Njk1NTdhOWJlOTMyODkxZTkyM2Y2NjlmNzk5M2VlZWRmOQpTaWdu
ZWQtb2ZmLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyX3YxMC5jIHwg
MSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXJfdjEwLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXJfdjEwLmMKaW5k
ZXggYWRiMzg4NS4uNzJlNGQ2MWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
a2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlcl92MTAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXJfdjEwLmMKQEAgLTM2LDYgKzM2LDcg
QEAgdm9pZCBkZXZpY2VfcXVldWVfbWFuYWdlcl9pbml0X3YxMF9uYXZpMTAoCiB7CiAJYXNpY19v
cHMtPnVwZGF0ZV9xcGQgPSB1cGRhdGVfcXBkX3YxMDsKIAlhc2ljX29wcy0+aW5pdF9zZG1hX3Zt
ID0gaW5pdF9zZG1hX3ZtX3YxMDsKKwlhc2ljX29wcy0+bXFkX21hbmFnZXJfaW5pdCA9IG1xZF9t
YW5hZ2VyX2luaXRfdjEwOwogfQogCiBzdGF0aWMgdWludDMyX3QgY29tcHV0ZV9zaF9tZW1fYmFz
ZXNfNjRiaXQoc3RydWN0IGtmZF9wcm9jZXNzX2RldmljZSAqcGRkKQotLSAKMi43LjQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
