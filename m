Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EDE15D01
	for <lists+amd-gfx@lfdr.de>; Tue,  7 May 2019 08:09:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C454789C9C;
	Tue,  7 May 2019 06:09:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750088.outbound.protection.outlook.com [40.107.75.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3591889C9C
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 May 2019 06:09:25 +0000 (UTC)
Received: from DM3PR12CA0088.namprd12.prod.outlook.com (2603:10b6:0:57::32) by
 DM6PR12MB3484.namprd12.prod.outlook.com (2603:10b6:5:3c::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Tue, 7 May 2019 06:09:23 +0000
Received: from CO1NAM03FT030.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by DM3PR12CA0088.outlook.office365.com
 (2603:10b6:0:57::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Tue, 7 May 2019 06:09:23 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT030.mail.protection.outlook.com (10.152.80.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Tue, 7 May 2019 06:09:22 +0000
Received: from build-machine.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 7 May 2019
 01:09:18 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/4] drm/amd/powerplay: avoid repeat AVFS
 enablement/disablement
Date: Tue, 7 May 2019 14:08:58 +0800
Message-ID: <20190507060859.27650-3-evan.quan@amd.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190507060859.27650-1-evan.quan@amd.com>
References: <20190507060859.27650-1-evan.quan@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(136003)(346002)(376002)(39860400002)(2980300002)(428003)(189003)(199004)(81166006)(8676002)(50226002)(478600001)(316002)(8936002)(81156014)(2870700001)(53936002)(2906002)(68736007)(53416004)(4326008)(70206006)(2351001)(36756003)(336012)(77096007)(186003)(476003)(2616005)(446003)(11346002)(126002)(54906003)(426003)(486006)(4744005)(26005)(76176011)(1076003)(70586007)(44832011)(14444005)(356004)(6666004)(305945005)(47776003)(86362001)(51416003)(7696005)(6916009)(48376002)(72206003)(5660300002)(50466002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3484; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: afaad864-bf56-485a-3371-08d6d2b28ce1
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:DM6PR12MB3484; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB3484:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3484C03E7A600B0D77BA2550E4310@DM6PR12MB3484.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-Forefront-PRVS: 0030839EEE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Je1lmWpM4xgRNNrmoxZqeGllZHc3eAd3iWCIYQipAyfIRpVjNVE0FoVdnENNeW+AGyY75bO+UOR6WTuAOL8JaSzDomxY8QKAwd8wUAITGmdbQLbW8GJQ5AfIgOMwNKq7cCavLAljtg3fI5g8Dd+PGxKaNHOvt+7VeiQ8SWE4nw5pcoEQxpuWoYroPUa1fULNs/7ohIcYXLG2l9fw1Iw5Ltpdcho0BsgvsfElIB2VvNeos73Z9V8NbZv19ZX8o9nVC9Fr45n6rMFRO5qn/xrYLzhTjIROfbc3vehwmrlXsBoT4JQ4NDSnD42qABMV37MyuAQbVp1vF9mK5iS4zIUWGBv5SeG+siW+8H4o8fcrpX97/JlOTXLomRMeaFdXR3E9hvEUCcqD7omH/eyZm4F3N0MF3AZb6gK0stnjqPtqTd8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2019 06:09:22.6252 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afaad864-bf56-485a-3371-08d6d2b28ce1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3484
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDqA5z1yoQ4B5X7dl6lyCzUltUBhisrMLDMswBVOheE=;
 b=Hl+dQdnsnIyevuHGXZf8CPDZdbm+gP4CYbfHKhPbgjlRW050cuImngs0378JBzQ8HH1zDDNTjmHXwMsvlYDEpurUd/yUgDNNndEjICaxpE9blVhwMFbGhRtvr/Gs7G3yrHBYlb2Z2uIJokg/gs0+X9cmP2nYaJ9sJ5w4VyAJRGc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; yiannakis.de; dkim=none (message not signed)
 header.d=none;yiannakis.de; dmarc=permerror action=none header.from=amd.com;
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
Cc: yanik@yiannakis.de, Alexander.Deucher@amd.com,
 Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Tm8gbmVlZCB0byBlbmFibGUgb3IgZGlzYWJsZSBBVkZTIGlmIGl0J3MgYWxyZWFkeSBpbiB3YW50
ZWQKc3RhdGUuCgpDaGFuZ2UtSWQ6IEk4NjJjMGMzZDY0MmU2YTBkYzdiYjM0ZTA0YzVhNTlmMTdi
NmI4ZGViClNpZ25lZC1vZmYtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX2h3bWdyLmMgfCA0ICsr
KysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMTBfaHdtZ3IuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9od21nci5jCmluZGV4IDEwM2Y3ZTNmMDc4
My4uZjRiODFmNTBiMTg1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9od21nci92ZWdhMTBfaHdtZ3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9od21nci92ZWdhMTBfaHdtZ3IuYwpAQCAtMjM2NCw2ICsyMzY0LDEwIEBAIHN0YXRpYyBpbnQg
dmVnYTEwX2F2ZnNfZW5hYmxlKHN0cnVjdCBwcF9od21nciAqaHdtZ3IsIGJvb2wgZW5hYmxlKQog
CXN0cnVjdCB2ZWdhMTBfaHdtZ3IgKmRhdGEgPSBod21nci0+YmFja2VuZDsKIAogCWlmIChkYXRh
LT5zbXVfZmVhdHVyZXNbR05MRF9BVkZTXS5zdXBwb3J0ZWQpIHsKKwkJLyogQWxyZWFkeSBlbmFi
bGVkIG9yIGRpc2FibGVkICovCisJCWlmICghKGVuYWJsZSBeIGRhdGEtPnNtdV9mZWF0dXJlc1tH
TkxEX0FWRlNdLmVuYWJsZWQpKQorCQkJcmV0dXJuIDA7CisKIAkJaWYgKGVuYWJsZSkgewogCQkJ
UFBfQVNTRVJUX1dJVEhfQ09ERSghdmVnYTEwX2VuYWJsZV9zbWNfZmVhdHVyZXMoaHdtZ3IsCiAJ
CQkJCXRydWUsCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
