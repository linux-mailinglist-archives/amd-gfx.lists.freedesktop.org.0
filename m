Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA8E10172
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 23:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21223891FF;
	Tue, 30 Apr 2019 21:09:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730085.outbound.protection.outlook.com [40.107.73.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B872891FF
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 21:09:47 +0000 (UTC)
Received: from SN1PR12CA0071.namprd12.prod.outlook.com (2603:10b6:802:20::42)
 by MN2PR12MB3759.namprd12.prod.outlook.com (2603:10b6:208:163::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1835.15; Tue, 30 Apr
 2019 21:09:45 +0000
Received: from BY2NAM03FT031.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::201) by SN1PR12CA0071.outlook.office365.com
 (2603:10b6:802:20::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1835.12 via Frontend
 Transport; Tue, 30 Apr 2019 21:09:45 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT031.mail.protection.outlook.com (10.152.84.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1835.14 via Frontend Transport; Tue, 30 Apr 2019 21:09:44 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Apr 2019
 16:09:43 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 01/20] drm/amd/display: 3.2.28
Date: Tue, 30 Apr 2019 17:08:59 -0400
Message-ID: <20190430210938.32335-2-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
References: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(396003)(136003)(376002)(2980300002)(428003)(199004)(189003)(316002)(5660300002)(16586007)(26005)(86362001)(478600001)(76176011)(186003)(2351001)(51416003)(14444005)(77096007)(72206003)(36756003)(53416004)(2616005)(4744005)(47776003)(11346002)(81166006)(81156014)(426003)(446003)(48376002)(476003)(8676002)(8936002)(7696005)(126002)(50466002)(336012)(6916009)(2906002)(1076003)(305945005)(68736007)(70206006)(356004)(70586007)(6666004)(50226002)(53936002)(486006)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3759; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a00f2b8b-5c48-4134-a1fa-08d6cdb02bc0
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:MN2PR12MB3759; 
X-MS-TrafficTypeDiagnostic: MN2PR12MB3759:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3759F899BA681D2AE5E4095EF93A0@MN2PR12MB3759.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 00235A1EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: iwmKPHR/RADLJBfD0WRrZP/+EglhpU6yu/IX8f2pKFGARR41ZMbf62Z/bIyJ1iiCfPfP0aNtYxOc0zfaOpN5U0WhH+LyByEI/YJ1/EIaXM3GkntroJPTASZOVypczemJlVeHClZqpVkw6e/jYmGFTrWCXyXKLmhm3cEJAnMFpOWAXWmOm8+hMbH6Ii8YVYPBCImbBHLOqnfkEN+MOnOoFI4SVXEE2Lga7L+VdBAYYtnHUeKDXL9l5Si3i1ruQuzxYQ7mzaIET3Y7co6msj91PTHhXtXfMEIhhKDzcaEEz9UmrPXpcEoVxhGGhWnM4oKmHsNrdi6OiXQpwrnXKqkYU0YTj08Zl1ESRwLKxyN+SdmhT8BUJHVO6MrJz2InwWavnA3ed6C1wdwJ7qsG338jc7pYOM1zxE/kUydBXc53Mo8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2019 21:09:44.9505 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a00f2b8b-5c48-4134-a1fa-08d6cdb02bc0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3759
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0St7rgZm7hejeFRI9CM9/TjuCXxYjbo9hwxIR3lfgs=;
 b=nn6VPz+iV9eG77iC5KnVwRWuFvzE/4jeUIN5kwgYnuDv3lJx4IBAZatVtMnsQafm1isQ5Xi3xj5YMMzEks5u2iYrbHJRr7hFFe6kDE8E4wW3elJAt5gKsFG/GDmhrZ7p7MgSlirOpcht1gFaJkNl1E/7R1eHVn57ga5TPW+S5oo=
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
Cc: Aric Cyr <aric.cyr@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQXJpYyBDeXIgPGFyaWMuY3lyQGFtZC5jb20+CgpDaGFuZ2UtSWQ6IElkMzdkZGFmMTE4
NmVlMTJlYTFiNDBiNWU5OTFhYzU3NWYwMDZjMDM5ClNpZ25lZC1vZmYtYnk6IEFyaWMgQ3lyIDxh
cmljLmN5ckBhbWQuY29tPgpSZXZpZXdlZC1ieTogQXJpYyBDeXIgPEFyaWMuQ3lyQGFtZC5jb20+
CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQgTGFraGFAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaCB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjLmgKaW5kZXggNDI4MTc1ZTA1YjEyLi4xODM5MjRhZmZjOTEgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kYy5oCkBAIC00Miw3ICs0Miw3IEBACiAjaW5jbHVkZSAiaW5jL2h3
L2RtY3UuaCIKICNpbmNsdWRlICJkbWwvZGlzcGxheV9tb2RlX2xpYi5oIgogCi0jZGVmaW5lIERD
X1ZFUiAiMy4yLjI3IgorI2RlZmluZSBEQ19WRVIgIjMuMi4yOCIKIAogI2RlZmluZSBNQVhfU1VS
RkFDRVMgMwogI2RlZmluZSBNQVhfUExBTkVTIDYKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
