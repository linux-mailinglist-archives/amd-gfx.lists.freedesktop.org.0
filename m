Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBCA5FB70
	for <lists+amd-gfx@lfdr.de>; Thu,  4 Jul 2019 18:06:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7728E6E362;
	Thu,  4 Jul 2019 16:05:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810055.outbound.protection.outlook.com [40.107.81.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F9B26E362
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Jul 2019 16:05:58 +0000 (UTC)
Received: from CH2PR12CA0010.namprd12.prod.outlook.com (2603:10b6:610:57::20)
 by DM5PR12MB1850.namprd12.prod.outlook.com (2603:10b6:3:108::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2032.20; Thu, 4 Jul
 2019 16:05:57 +0000
Received: from BY2NAM03FT029.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::209) by CH2PR12CA0010.outlook.office365.com
 (2603:10b6:610:57::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.18 via Frontend
 Transport; Thu, 4 Jul 2019 16:05:57 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT029.mail.protection.outlook.com (10.152.84.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 4 Jul 2019 16:05:56 +0000
Received: from navi10-uefi.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server (TLS) id 14.3.389.1; Thu, 4 Jul
 2019 11:05:55 -0500
From: <boyuan.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 02/17] drm/amdgpu: add vcn jpeg encode ring
Date: Thu, 4 Jul 2019 12:04:14 -0400
Message-ID: <20190704160429.14758-2-boyuan.zhang@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190704160429.14758-1-boyuan.zhang@amd.com>
References: <20190704160429.14758-1-boyuan.zhang@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(346002)(376002)(2980300002)(428003)(199004)(189003)(48376002)(7696005)(36756003)(2876002)(7736002)(81156014)(26005)(77096007)(81166006)(1076003)(4326008)(6916009)(4744005)(8676002)(76176011)(70586007)(2906002)(50466002)(5660300002)(356004)(305945005)(8936002)(478600001)(6666004)(51416003)(72206003)(70206006)(2351001)(16526019)(316002)(86362001)(47776003)(11346002)(68736007)(486006)(476003)(446003)(126002)(50226002)(6116002)(426003)(2616005)(336012)(3846002)(53416004)(16586007)(186003)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1850; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df51583f-7d15-4700-5b8e-08d700997fd5
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM5PR12MB1850; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1850:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1850AAAE99C04A233BABF98A87FA0@DM5PR12MB1850.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 0088C92887
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: fKjb3GQxYmAtl4/bEQbMxKKbSeG4aFpfvhvTX0gPZWs8BR6DnXr5uL5ZHPHARb/KxRVwr+jIJY6FGfa01frYsA3Plc1sTlPVR8WMaBzL5Xmn+GGbsSqM0rsGG9C5OhJRc0t1zfXw0baOh5M0lY72lqK0Z9M/G9S1Y8aIQhBFgJNKYcaOLCNbvM33raD79gScEybj08aGPmKPP4dq1FT4O+I1YgWD0VvJbexQQsPKtrfIQZ1V1j0m+vJCMImACy/DKtCMl3yA/cy0S8sO4OAvbrkGyv3LrUfEZaB+soOJBziAV93B9UnhtqCRih99jD4r6p21NIViKIs/2CSPr04Buo3YqIPjS1Fs0brQQV7Te6bKSWS3bxW7k1FEpofL+yxRaQVreanIfpq2iFmpK2RGdt9oysiV58dFFf5QixGNCZ8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2019 16:05:56.9308 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df51583f-7d15-4700-5b8e-08d700997fd5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1850
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06BLcKLAKlo/RrBRQkjg9FJ2N9qAsXrSEG/xpAbxqcY=;
 b=Don2sPyktVb/1wTPZsCSPvJzW+EdEDH7IqAxcjamh9Lze55wMmBtWV29e+Zi4fKUaG8KrP/miLyc1/6X56kUhVUCVW+0SlrEDEvst6MBGy7/iLPBndnfSuGHryWq3PxynkpgugEoVfr/iSObnktW5tNZArb32uS/ECgPAtDGdzw=
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

RnJvbTogQm95dWFuIFpoYW5nIDxib3l1YW4uemhhbmdAYW1kLmNvbT4KCkFkZCBqcGVnIGVuYyBy
aW5nLgoKU2lnbmVkLW9mZi1ieTogQm95dWFuIFpoYW5nIDxib3l1YW4uemhhbmdAYW1kLmNvbT4K
UmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmggfCAxICsKIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV92Y24uaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92
Y24uaAppbmRleCA2OTNiNzNkYzkxYjUuLmE0NDU1MGFmMWI4YSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV92Y24uaApAQCAtODcsNiArODcsNyBAQCBzdHJ1Y3QgYW1kZ3B1X3Zj
biB7CiAJc3RydWN0IGFtZGdwdV9yaW5nCXJpbmdfZGVjOwogCXN0cnVjdCBhbWRncHVfcmluZwly
aW5nX2VuY1tBTURHUFVfVkNOX01BWF9FTkNfUklOR1NdOwogCXN0cnVjdCBhbWRncHVfcmluZwly
aW5nX2pwZWc7CisJc3RydWN0IGFtZGdwdV9yaW5nCXJpbmdfanBlZ19lbmM7CiAJc3RydWN0IGFt
ZGdwdV9pcnFfc3JjCWlycTsKIAl1bnNpZ25lZAkJbnVtX2VuY19yaW5nczsKIAllbnVtIGFtZF9w
b3dlcmdhdGluZ19zdGF0ZSBjdXJfc3RhdGU7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
