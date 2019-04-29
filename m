Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98754DE84
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Apr 2019 10:56:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3949989091;
	Mon, 29 Apr 2019 08:56:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02on0607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe45::607])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A55289091
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Apr 2019 08:56:13 +0000 (UTC)
Received: from BN8PR12CA0021.namprd12.prod.outlook.com (2603:10b6:408:60::34)
 by CH2PR12MB3750.namprd12.prod.outlook.com (2603:10b6:610:25::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1835.15; Mon, 29 Apr
 2019 08:56:11 +0000
Received: from BY2NAM03FT059.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by BN8PR12CA0021.outlook.office365.com
 (2603:10b6:408:60::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1835.13 via Frontend
 Transport; Mon, 29 Apr 2019 08:56:11 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT059.mail.protection.outlook.com (10.152.85.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1835.14 via Frontend Transport; Mon, 29 Apr 2019 08:56:10 +0000
Received: from build-machine.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 29 Apr 2019
 03:56:09 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: enable ppfeaturemask module parameter
 support on Vega20
Date: Mon, 29 Apr 2019 16:56:03 +0800
Message-ID: <20190429085603.15659-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(396003)(136003)(376002)(2980300002)(428003)(199004)(189003)(316002)(478600001)(186003)(54906003)(5660300002)(26005)(86362001)(51416003)(36756003)(2351001)(7696005)(77096007)(72206003)(53416004)(126002)(2616005)(47776003)(81156014)(426003)(476003)(6916009)(81166006)(8676002)(97736004)(336012)(50466002)(44832011)(1076003)(48376002)(486006)(4326008)(305945005)(53936002)(68736007)(70206006)(70586007)(356004)(6666004)(2870700001)(8936002)(50226002)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3750; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c888b84-2e87-4842-2afe-08d6cc8086e0
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:CH2PR12MB3750; 
X-MS-TrafficTypeDiagnostic: CH2PR12MB3750:
X-Microsoft-Antispam-PRVS: <CH2PR12MB3750C40E72C819A470CABD27E4390@CH2PR12MB3750.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-Forefront-PRVS: 0022134A87
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: KAi/+7wHkbZ67YB0Fg1b+M4XnFAahq+CRaGOELT0FItgHQx4LJwboMFCaImve+nH+pqD3aHNLswjwcJX5i2ld4bW3Ap9magbdYVTs/O3qN6NRpZl4UnMC4gb7DMWGtthrOx3ttiO8499tHf5+MWzx7VxZ1+YkYAPgfmmpEX78/EcpzT1uLpKnrTFRtsAF01kiQIzrOHdhjloBzc8gqSxyzN7OlbvG+Xmuldf7xLKpKNn9KBMl7EVJGt7nl2udQdFrLbzVDebNr/SWHTJqmJsSg9ce2auRefxDSPN0tK1ZkSxPNnO/TyFL6QabCCuqIyNhk00L8xj/AlnrE9HMZ3m50+cuRP5iCkAtlUtB1HU2rJKgQmfueppM0SXJGamqQ2Z6UbgzUpnJIQZU9Gv+hJgXilKVvqJ5ZBPvwYgx2K3cNg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2019 08:56:10.8256 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c888b84-2e87-4842-2afe-08d6cc8086e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3750
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2EWSRhnMByBXY4w3A/wf51jN9XuMZb4DeX3nJHgUUUc=;
 b=jwbHZn4uBRsEpb+SuNbUPb87tlLGzWgVoHrzFlsVdcN3Aok/aR8yWG84kl1FmB0d8xvXPsLgb3Cr2b5xxRssu6TRCw8nvZGenpiXR6n2hCrYzWdM4BVB3Nu2GIWHcJRzm+COGHlmwaXcTb0phQf0jk/G+fChYrWhBAQOGAY6I8g=
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
Cc: Alexander.Deucher@amd.com, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U3VwcG9ydCBEUE0vRFMvVUxWIHJlbGF0ZWQgYml0bWFza3Mgb2YgcHBmZWF0dXJlbWFzayBtb2R1
bGUgcGFyYW1ldGVyLgoKQ2hhbmdlLUlkOiBJNmI3NWJlY2Y4ZDM5MTA1MTg5YjMwYmU0MWI1OGVj
N2Q0NDI1ZjM1NgpTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPgot
LS0KIC4uLi9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMjBfaHdtZ3IuYyAgICB8IDIxICsr
KysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTIwX2h3bWdy
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMjBfaHdtZ3IuYwpp
bmRleCA5MWUyNmY4YjM3NTguLmQ3ODczZGY0ODRhNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTIwX2h3bWdyLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTIwX2h3bWdyLmMKQEAgLTk3LDYgKzk3LDI3IEBA
IHN0YXRpYyB2b2lkIHZlZ2EyMF9zZXRfZGVmYXVsdF9yZWdpc3RyeV9kYXRhKHN0cnVjdCBwcF9o
d21nciAqaHdtZ3IpCiAJaWYgKGh3bWdyLT5zbXVfdmVyc2lvbiA8IDB4MjgyMTAwKQogCQlkYXRh
LT5yZWdpc3RyeV9kYXRhLmRpc2FsbG93ZWRfZmVhdHVyZXMgfD0gRkVBVFVSRV9FQ0NfTUFTSzsK
IAorCWlmICghKGh3bWdyLT5mZWF0dXJlX21hc2sgJiBQUF9QQ0lFX0RQTV9NQVNLKSkKKwkJZGF0
YS0+cmVnaXN0cnlfZGF0YS5kaXNhbGxvd2VkX2ZlYXR1cmVzIHw9IEZFQVRVUkVfRFBNX0xJTktf
TUFTSzsKKworCWlmICghKGh3bWdyLT5mZWF0dXJlX21hc2sgJiBQUF9TQ0xLX0RQTV9NQVNLKSkK
KwkJZGF0YS0+cmVnaXN0cnlfZGF0YS5kaXNhbGxvd2VkX2ZlYXR1cmVzIHw9IEZFQVRVUkVfRFBN
X0dGWENMS19NQVNLOworCisJaWYgKCEoaHdtZ3ItPmZlYXR1cmVfbWFzayAmIFBQX1NPQ0NMS19E
UE1fTUFTSykpCisJCWRhdGEtPnJlZ2lzdHJ5X2RhdGEuZGlzYWxsb3dlZF9mZWF0dXJlcyB8PSBG
RUFUVVJFX0RQTV9TT0NDTEtfTUFTSzsKKworCWlmICghKGh3bWdyLT5mZWF0dXJlX21hc2sgJiBQ
UF9NQ0xLX0RQTV9NQVNLKSkKKwkJZGF0YS0+cmVnaXN0cnlfZGF0YS5kaXNhbGxvd2VkX2ZlYXR1
cmVzIHw9IEZFQVRVUkVfRFBNX1VDTEtfTUFTSzsKKworCWlmICghKGh3bWdyLT5mZWF0dXJlX21h
c2sgJiBQUF9EQ0VGQ0xLX0RQTV9NQVNLKSkKKwkJZGF0YS0+cmVnaXN0cnlfZGF0YS5kaXNhbGxv
d2VkX2ZlYXR1cmVzIHw9IEZFQVRVUkVfRFBNX0RDRUZDTEtfTUFTSzsKKworCWlmICghKGh3bWdy
LT5mZWF0dXJlX21hc2sgJiBQUF9VTFZfTUFTSykpCisJCWRhdGEtPnJlZ2lzdHJ5X2RhdGEuZGlz
YWxsb3dlZF9mZWF0dXJlcyB8PSBGRUFUVVJFX1VMVl9NQVNLOworCisJaWYgKCEoaHdtZ3ItPmZl
YXR1cmVfbWFzayAmIFBQX1NDTEtfREVFUF9TTEVFUF9NQVNLKSkKKwkJZGF0YS0+cmVnaXN0cnlf
ZGF0YS5kaXNhbGxvd2VkX2ZlYXR1cmVzIHw9IEZFQVRVUkVfRFNfR0ZYQ0xLX01BU0s7CisKIAlk
YXRhLT5yZWdpc3RyeV9kYXRhLm9kX3N0YXRlX2luX2RjX3N1cHBvcnQgPSAwOwogCWRhdGEtPnJl
Z2lzdHJ5X2RhdGEudGhlcm1hbF9zdXBwb3J0ID0gMTsKIAlkYXRhLT5yZWdpc3RyeV9kYXRhLnNr
aXBfYmFjb19oYXJkd2FyZSA9IDA7Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
