Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5BF49F5D
	for <lists+amd-gfx@lfdr.de>; Tue, 18 Jun 2019 13:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC6E89147;
	Tue, 18 Jun 2019 11:41:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780073.outbound.protection.outlook.com [40.107.78.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44DFA89F6F
 for <amd-gfx@lists.freedesktop.org>; Tue, 18 Jun 2019 11:41:02 +0000 (UTC)
Received: from DM3PR12CA0051.namprd12.prod.outlook.com (2603:10b6:0:56::19) by
 BN6PR1201MB0049.namprd12.prod.outlook.com (2603:10b6:405:57::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1987.12; Tue, 18 Jun
 2019 11:40:57 +0000
Received: from DM3NAM03FT008.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::207) by DM3PR12CA0051.outlook.office365.com
 (2603:10b6:0:56::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1987.13 via Frontend
 Transport; Tue, 18 Jun 2019 11:40:57 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT008.mail.protection.outlook.com (10.152.82.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1987.11 via Frontend Transport; Tue, 18 Jun 2019 11:40:56 +0000
Received: from hawzhang-Navi-Product-U1604.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Tue, 18 Jun 2019 06:40:55 -0500
From: Hawking Zhang <Hawking.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH libdrm 1/4] amdgpu: add navi family id
Date: Tue, 18 Jun 2019 19:40:30 +0800
Message-ID: <1560858033-1499-1-git-send-email-Hawking.Zhang@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(396003)(346002)(376002)(39860400002)(2980300002)(428003)(189003)(199004)(68736007)(4744005)(81166006)(2906002)(53416004)(486006)(86362001)(51416003)(36756003)(7696005)(2616005)(476003)(77096007)(126002)(26005)(48376002)(2351001)(16586007)(53936002)(6666004)(316002)(47776003)(54906003)(356004)(50466002)(186003)(50226002)(5660300002)(305945005)(478600001)(336012)(6916009)(8936002)(70586007)(70206006)(72206003)(426003)(4326008)(81156014)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0049; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53ae11ef-6921-49cb-f7fd-08d6f3e1d3ff
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR1201MB0049; 
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0049:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB00498D75F82E5D11FF599B6CFCEA0@BN6PR1201MB0049.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-Forefront-PRVS: 007271867D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: XPMWdktqAti46lCqbwp1Ui/tOateAfjyqcs6sqS5qIVl1FUAR/V6zbImHe9HzTraM8ZXZS7RVyxuhdjRvGpPnSYF/rscnXCqzCQhK6gdBMHrlhzTvquLA2ojj6oNvyngUQZfVGhH7N/lXeR9tdv7p2eJHAeZ7XB8yvimkaZdZRZtPaE9dUfvkK3pqB0cG1NZchUcLDVr+57t6/zUNJhYUqbs3oN84aKEXe9z80+XQQZOcI0n2CdqQFyWEqWIj5aUXcb2CQhD2yefaRtIT1OGx/ZSZ+x49WQto1qfnGPsu7cWfghzqeRd1nubHY/QL8EV2I0gGJfjBFOIVD4C7U9YAvbdreuc/mo8CPOjhcs0s/aOHsvGMidE13DEhqMbtFWbKFHSQHgbxV3czBUCbkBwx9oZgEg+HzleYu97f4tIYyQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2019 11:40:56.7615 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53ae11ef-6921-49cb-f7fd-08d6f3e1d3ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0049
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RiSMubafTvHHAbyGPZDgM0gqGHDCp0yx14FpmGaIRy0=;
 b=PUHJWD+ljJaG7pOQiVa0f4MSfW9PpTOcI6F0gTqn9hdk1MpmkSo6LTRAQLqIC8mfxjzdC6KR9rTnhcl0MumbG0MzF6XNi6ijSzA+S5r9Tq6/nYMYwcG0+hCiPhEeoTirWo8l1JyMzM19u/lWEWS4QtTTgxqsJwe/8RZ0gNpcL/0=
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KClNpZ25lZC1vZmYtYnk6IEh1YW5n
IFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdr
aW5nLlpoYW5nQGFtZC5jb20+Ci0tLQogaW5jbHVkZS9kcm0vYW1kZ3B1X2RybS5oIHwgMSArCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9h
bWRncHVfZHJtLmggYi9pbmNsdWRlL2RybS9hbWRncHVfZHJtLmgKaW5kZXggM2QwMzE4ZS4uYjI4
ZmVlNCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vYW1kZ3B1X2RybS5oCisrKyBiL2luY2x1ZGUv
ZHJtL2FtZGdwdV9kcm0uaApAQCAtMTA0NSw2ICsxMDQ1LDcgQEAgc3RydWN0IGRybV9hbWRncHVf
aW5mb192Y2VfY2xvY2tfdGFibGUgewogI2RlZmluZSBBTURHUFVfRkFNSUxZX0NaCQkJMTM1IC8q
IENhcnJpem8sIFN0b25leSAqLwogI2RlZmluZSBBTURHUFVfRkFNSUxZX0FJCQkJMTQxIC8qIFZl
Z2ExMCAqLwogI2RlZmluZSBBTURHUFVfRkFNSUxZX1JWCQkJMTQyIC8qIFJhdmVuICovCisjZGVm
aW5lIEFNREdQVV9GQU1JTFlfTlYJCQkxNDMgLyogTmF2aTEwICovCiAKICNpZiBkZWZpbmVkKF9f
Y3BsdXNwbHVzKQogfQotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
