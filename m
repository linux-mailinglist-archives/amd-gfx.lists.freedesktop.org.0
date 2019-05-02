Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49854119E2
	for <lists+amd-gfx@lfdr.de>; Thu,  2 May 2019 15:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5FA89533;
	Thu,  2 May 2019 13:14:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700052.outbound.protection.outlook.com [40.107.70.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84288952F
 for <amd-gfx@lists.freedesktop.org>; Thu,  2 May 2019 13:14:34 +0000 (UTC)
Received: from BN8PR12CA0011.namprd12.prod.outlook.com (2603:10b6:408:60::24)
 by DM5PR12MB1851.namprd12.prod.outlook.com (2603:10b6:3:109::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.11; Thu, 2 May
 2019 13:14:32 +0000
Received: from CO1NAM03FT037.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by BN8PR12CA0011.outlook.office365.com
 (2603:10b6:408:60::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Thu, 2 May 2019 13:14:32 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT037.mail.protection.outlook.com (10.152.80.241) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Thu, 2 May 2019 13:14:32 +0000
Received: from kazbox.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 2 May 2019
 08:14:30 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/amd/display: Use long for signed error code checks in
 commit planes
Date: Thu, 2 May 2019 09:14:27 -0400
Message-ID: <20190502131427.20202-1-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(396003)(346002)(136003)(39860400002)(2980300002)(428003)(189003)(199004)(23676004)(2351001)(6916009)(86362001)(2906002)(14444005)(68736007)(186003)(26005)(77096007)(53416004)(47776003)(5660300002)(4326008)(7696005)(8936002)(53936002)(356004)(8676002)(81166006)(81156014)(6666004)(70586007)(305945005)(70206006)(5820100001)(2870700001)(1076003)(66574012)(36756003)(50466002)(336012)(486006)(478600001)(44832011)(316002)(50226002)(426003)(2616005)(72206003)(476003)(54906003)(126002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1851; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 936abc8b-ee12-40e5-33a2-08d6cf001d91
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:DM5PR12MB1851; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1851:
X-Microsoft-Antispam-PRVS: <DM5PR12MB18519E42C51DD9B8DE8114CAEC340@DM5PR12MB1851.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:669;
X-Forefront-PRVS: 0025434D2D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: GDRI227Rb9091iuPqr5LSBXYTcxb7Ve5bHHBssJRhEnBSCHu+x+Tzvaskk2IIo7lvptJGtY55z30FiU1sexgWEaveYl+lAMFZbzz4t6CjWj4qKiPIix3YlgmmLYVvXo1uayvxcJHB55LDwuJBspSvDbQBzrDPW9NCPltQpmKuhIj6HX4Yf0Z+1OZ2DQ2Lr6ltpKSqRvtRltREf49Q7+T+a+kD5AG9Be8jzoQSqCAkYWMpGrm+MADVx1agduw5xfjhLu3y8LhZdQpy7UmA+nhpw6J/WsDmLJudLEOFnQ3Nhsn37WZye7pN3Pn5iMlx12cktHYdsrXQsyUTsiSbi77zo/FAGigW/lhCW4YAcWni1FijGd2+D+/EKHFzH8lAkMsL0kdDY/yD/WCsTbfOkyv3HsAKg90mMWMoY+zWmBXKUM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2019 13:14:32.0336 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 936abc8b-ee12-40e5-33a2-08d6cf001d91
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1851
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZLvbeelQUw4goxUm6IV/iTa1P+7Dn5Hoaa7qo6Zr7o=;
 b=JSGkOtOv19VewgFWlgPiAjdkp5RJ5/FKeiLUpn3l67oW8B1rfDV1Y7fF2eHUpir1ZC1lhSH39tuJBNLwrHms67OQaNeCECV6TP6eEOMQn694f1zB+spxzwXLfcZNZjO782Vr0YRdmAwjTtSeLE9rN3eqja0V8bp1VrwPl8uQi7U=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KClRoZSB0eXBlIG9mICdyJyBpcyB1aW50MzJfdCBhbmQgdGhlIHJldHVybiBjb2RlcyBm
b3IgYm90aDoKCi0gcmVzZXJ2YXRpb25fb2JqZWN0X3dhaXRfdGltZW91dF9yY3UKLSBhbWRncHVf
Ym9fcmVzZXJ2ZQoKLi4uYXJlIHNpZ25lZC4gV2hpbGUgaXQgd29ya3MgZm9yIHRoZSBsYXR0ZXIg
c2luY2UgdGhlIGNoZWNrIGlzCmRvbmUgb24gIT0gMCBpdCBkb2Vzbid0IHdvcmsgZm9yIHRoZSBm
b3JtZXIgc2luY2Ugd2UgY2hlY2sgPD0gMC4KCltIb3ddCgpNYWtlICdyJyBhIGxvbmcgaW4gY29t
bWl0IHBsYW5lcyBzbyB3ZSdyZSBub3QgZG9pbmcgYW55IHVuc2lnbmVkL3NpZ25lZApjb252ZXJz
aW9uIGhlcmUgaW4gdGhlIGZpcnN0IHBsYWNlLgoKdjI6IHVzZSBsb25nIGluc3RlYWQgb2YgaW50
IChDaHJpc3RpYW4pCgpDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2tvZW5pZy5sZWljaHR6dW1lcmtl
bkBnbWFpbC5jb20+ClJlcG9ydGVkLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9y
YWNsZS5jb20+ClNpZ25lZC1vZmYtYnk6IE5pY2hvbGFzIEthemxhdXNrYXMgPG5pY2hvbGFzLmth
emxhdXNrYXNAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1
X2RtL2FtZGdwdV9kbS5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG0uYwppbmRleCBiZWNkOGNiM2FhYjYuLmFjMjJmNzM1MWE0MiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCkBA
IC01MzMyLDcgKzUzMzIsNyBAQCBzdGF0aWMgdm9pZCBhbWRncHVfZG1fY29tbWl0X3BsYW5lcyhz
dHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUsCiAJCQkJICAgIHN0cnVjdCBkcm1fY3J0YyAq
cGNydGMsCiAJCQkJICAgIGJvb2wgd2FpdF9mb3JfdmJsYW5rKQogewotCXVpbnQzMl90IGksIHI7
CisJdWludDMyX3QgaTsKIAl1aW50NjRfdCB0aW1lc3RhbXBfbnM7CiAJc3RydWN0IGRybV9wbGFu
ZSAqcGxhbmU7CiAJc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqb2xkX3BsYW5lX3N0YXRlLCAqbmV3
X3BsYW5lX3N0YXRlOwpAQCAtNTM0Myw2ICs1MzQzLDcgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X2Rt
X2NvbW1pdF9wbGFuZXMoc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLAogCXN0cnVjdCBk
bV9jcnRjX3N0YXRlICpkbV9vbGRfY3J0Y19zdGF0ZSA9CiAJCQl0b19kbV9jcnRjX3N0YXRlKGRy
bV9hdG9taWNfZ2V0X29sZF9jcnRjX3N0YXRlKHN0YXRlLCBwY3J0YykpOwogCWludCBwbGFuZXNf
Y291bnQgPSAwLCB2cG9zLCBocG9zOworCWxvbmcgcjsKIAl1bnNpZ25lZCBsb25nIGZsYWdzOwog
CXN0cnVjdCBhbWRncHVfYm8gKmFibzsKIAl1aW50NjRfdCB0aWxpbmdfZmxhZ3M7Ci0tIAoyLjE3
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
