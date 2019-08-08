Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7735D85B1B
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Aug 2019 08:54:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A08B6E78A;
	Thu,  8 Aug 2019 06:54:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800055.outbound.protection.outlook.com [40.107.80.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E139B6E78B
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Aug 2019 06:54:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IMPaZH+4gojHpenpg8QzTGFAFPi+ZSkHNqwXYBn17MDkJmzOpAv7a9/XkR5PTHW1HMmQ0vz+6t9Oi870j8wzzDjjHsanbDbq8Xygw6+nk90KygLik7Iz6MFHHAj9SaXqwVqn8x+XgR3BPZjSH9EPDbB1om4LEbBTgUy+i74sN7r1CaYawry99xIB/FclIY/2Yi+J29qZZ6Oreu5aVDq1HyCJ/AkiScmjuxx5T1EBwkylJkYl1P7bLHs73KX1CYcEELf6hPHrY4ra0BGBZ7qRQoNYkhfPFGgH4qQEJ7WoSAN4q5TpWAMnkNCRk8Q1uFGBX2TdesE7r8mFbIFGyBd3Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ETtflJvoIGLIAU2NO3ymKmZG2uDIx0KTa+ydjHfFP8M=;
 b=OzlylXBKkPTST9LUx8rUmsQZCoBd3S2Sc4ie2dPDJHtabFQocjnSEEfHHrEvhGJwwJ6iBhKTbHg+gaUwYB6YmWHyCgUriPaxrX3Ofg9ahmHv2tGw+tKiTsH8f3kxQlex/JZht658N/1XxdlU2IRi777WFa6sWy40Z8CkA5tyBo7817xkM/begABFNLv3obYDW/2/1UefxLFG232EzUh6nWobHf5nOHIuibI9kCbfQP3vS+iRtkpaRpHK1z5napRzasDwDkChnXx346PLDijv/aZ0+zfHFOOC5Dc1aIBAicctMiwu0uzPx3Sh9mqjLtn5IZb72y/ZiOw87mBVyzcbxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MN2PR12CA0034.namprd12.prod.outlook.com (2603:10b6:208:a8::47)
 by BN6PR12MB1522.namprd12.prod.outlook.com (2603:10b6:405:11::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.14; Thu, 8 Aug
 2019 06:54:10 +0000
Received: from DM3NAM03FT014.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by MN2PR12CA0034.outlook.office365.com
 (2603:10b6:208:a8::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.16 via Frontend
 Transport; Thu, 8 Aug 2019 06:54:10 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT014.mail.protection.outlook.com (10.152.82.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Thu, 8 Aug 2019 06:54:09 +0000
Received: from taozhou1u2.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 8 Aug 2019
 01:54:08 -0500
From: Tao Zhou <tao.zhou1@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <hawking.zhang@amd.com>,
 <guchun.chen@amd.com>, <dennis.li@amd.com>, <xinhui.pan@amd.com>,
 <john.clements@amd.com>
Subject: [PATCH 1/3] drm/amdgpu: add amdgpu_mmhub_funcs definition
Date: Thu, 8 Aug 2019 14:53:49 +0800
Message-ID: <20190808065351.510-1-tao.zhou1@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(396003)(39860400002)(2980300002)(428003)(189003)(199004)(6636002)(50226002)(426003)(8676002)(5660300002)(356004)(6666004)(7696005)(336012)(51416003)(4326008)(8936002)(36756003)(81166006)(2906002)(50466002)(81156014)(48376002)(305945005)(53936002)(53416004)(26005)(1076003)(186003)(316002)(70586007)(70206006)(2201001)(16586007)(14444005)(110136005)(86362001)(126002)(486006)(478600001)(476003)(2616005)(47776003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1522; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d864983b-da37-4cd7-7c7b-08d71bcd36c7
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1522; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1522:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1522EF361A2A311BDBE4FDF2B0D70@BN6PR12MB1522.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 012349AD1C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: H7ytZRLwYwzeOddnDWQTcNrexueqDQUn3MP66LsvoJe8Xvzp8KPSxHiZz670ZvsAy1rYDjPtCJ9Cq/CjOMg6YyhtWB0xXVvDZGBFpsQ8Xwdl6qBKCjQnI0Hz/XLspYD0qaqggKxQwQ67PmlhXOa8IKZYZRsNt8M1zlTmXYh17X+blbjKwhBE9A6RdWOMByjsg8bjSRUj8KNmQRe6+l2Q+epSUie+WWZhwcC/kdZlr46prlwVrpdIaCqJmJ3iD/WR0BqyAyHXPVf/zWHIhvfHe0ZUnBlmp8mRo3SAb5ysgeVd8+Yfl/Su/V/699LhkxIyztneezV/0/j/RhspQK7GJMsAQVz6nL5IytJCPdFDkvXjnISRIK945Vi0iAaqBFIyb8XNEGP17ULgd8VOAl+aakuNDmipVN3hYJKrLhnZ67A=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2019 06:54:09.6159 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d864983b-da37-4cd7-7c7b-08d71bcd36c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1522
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ETtflJvoIGLIAU2NO3ymKmZG2uDIx0KTa+ydjHfFP8M=;
 b=gTu4lHlWkUjoNNHzlgNmy3h+UQVPPw64CoXARuxQjuhXompA8AMNq4n2Bp+2XmmZiYXizaKp2Mvp7itr80xwAIszXSwM81r25A2WkUKLMKRq/peURyyPSZfnN0yyxxd7THFq7yo8G5LAhgnP3RctfqFBlNtpjb1FC3J88Z0AQsU=
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

YWRkIGFtZGdwdV9tbWh1Yl9mdW5jcyBkZWZpbml0aW9uIGFuZCBpbml0aWFsaXplIGl0LApwcmVw
YXJlIGZvciBtbWh1YiByYXMgZW5hYmxlbWVudAoKU2lnbmVkLW9mZi1ieTogVGFvIFpob3UgPHRh
by56aG91MUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5o
ICAgICAgIHwgIDIgKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tbWh1Yi5o
IHwgMzEgKysrKysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dtY192OV8wLmMgICAgIHwgMTIgKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9tbWh1Yl92MV8wLmMgICB8ICA5ICsrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L21taHViX3YxXzAuaCAgIHwgIDIgKysKIDUgZmlsZXMgY2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygr
KQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9t
bWh1Yi5oCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1Lmgg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaAppbmRleCA0MWY2Nzc2MTNmZmEu
LmVkMWEyMTdlODZlNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKQEAgLTg3LDYg
Kzg3LDcgQEAKICNpbmNsdWRlICJhbWRncHVfZGlzY292ZXJ5LmgiCiAjaW5jbHVkZSAiYW1kZ3B1
X21lcy5oIgogI2luY2x1ZGUgImFtZGdwdV91bWMuaCIKKyNpbmNsdWRlICJhbWRncHVfbW1odWIu
aCIKIAogI2RlZmluZSBNQVhfR1BVX0lOU1RBTkNFCQkxNgogCkBAIC05NzksNiArOTgwLDcgQEAg
c3RydWN0IGFtZGdwdV9kZXZpY2UgewogCiAJY29uc3Qgc3RydWN0IGFtZGdwdV9uYmlvX2Z1bmNz
CSpuYmlvX2Z1bmNzOwogCWNvbnN0IHN0cnVjdCBhbWRncHVfZGZfZnVuY3MJKmRmX2Z1bmNzOwor
CWNvbnN0IHN0cnVjdCBhbWRncHVfbW1odWJfZnVuY3MJKm1taHViX2Z1bmNzOwogCiAJLyogZGVs
YXllZCB3b3JrX2Z1bmMgZm9yIGRlZmVycmluZyBjbG9ja2dhdGluZyBkdXJpbmcgcmVzdW1lICov
CiAJc3RydWN0IGRlbGF5ZWRfd29yayAgICAgZGVsYXllZF9pbml0X3dvcms7CmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW1odWIuaCBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tbWh1Yi5oCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDAwMDAwMDAwMDAwMC4uMmQ3NWVjZmExOTliCi0tLSAvZGV2L251bGwKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21taHViLmgKQEAgLTAsMCArMSwzMSBAQAorLyoKKyAq
IENvcHlyaWdodCAoQykgMjAxOSAgQWR2YW5jZWQgTWljcm8gRGV2aWNlcywgSW5jLgorICoKKyAq
IFBlcm1pc3Npb24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVy
c29uIG9idGFpbmluZyBhCisgKiBjb3B5IG9mIHRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQg
ZG9jdW1lbnRhdGlvbiBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLAorICogdG8gZGVhbCBpbiB0aGUg
U29mdHdhcmUgd2l0aG91dCByZXN0cmljdGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQgbGltaXRhdGlv
bgorICogdGhlIHJpZ2h0cyB0byB1c2UsIGNvcHksIG1vZGlmeSwgbWVyZ2UsIHB1Ymxpc2gsIGRp
c3RyaWJ1dGUsIHN1YmxpY2Vuc2UsCisgKiBhbmQvb3Igc2VsbCBjb3BpZXMgb2YgdGhlIFNvZnR3
YXJlLCBhbmQgdG8gcGVybWl0IHBlcnNvbnMgdG8gd2hvbSB0aGUKKyAqIFNvZnR3YXJlIGlzIGZ1
cm5pc2hlZCB0byBkbyBzbywgc3ViamVjdCB0byB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6Cisg
KgorICogVGhlIGFib3ZlIGNvcHlyaWdodCBub3RpY2UgYW5kIHRoaXMgcGVybWlzc2lvbiBub3Rp
Y2Ugc2hhbGwgYmUgaW5jbHVkZWQKKyAqIGluIGFsbCBjb3BpZXMgb3Igc3Vic3RhbnRpYWwgcG9y
dGlvbnMgb2YgdGhlIFNvZnR3YXJlLgorICoKKyAqIFRIRSBTT0ZUV0FSRSBJUyBQUk9WSURFRCAi
QVMgSVMiLCBXSVRIT1VUIFdBUlJBTlRZIE9GIEFOWSBLSU5ELCBFWFBSRVNTCisgKiBPUiBJTVBM
SUVELCBJTkNMVURJTkcgQlVUIE5PVCBMSU1JVEVEIFRPIFRIRSBXQVJSQU5USUVTIE9GIE1FUkNI
QU5UQUJJTElUWSwKKyAqIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFIEFORCBOT05J
TkZSSU5HRU1FTlQuICBJTiBOTyBFVkVOVCBTSEFMTAorICogVEhFIENPUFlSSUdIVCBIT0xERVIo
UykgQkUgTElBQkxFIEZPUiBBTlkgQ0xBSU0sIERBTUFHRVMgT1IgT1RIRVIgTElBQklMSVRZLCBX
SEVUSEVSIElOCisgKiBBTiBBQ1RJT04gT0YgQ09OVFJBQ1QsIFRPUlQgT1IgT1RIRVJXSVNFLCBB
UklTSU5HIEZST00sIE9VVCBPRiBPUiBJTgorICogQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FS
RSBPUiBUSEUgVVNFIE9SIE9USEVSIERFQUxJTkdTIElOIFRIRSBTT0ZUV0FSRS4KKyAqLworI2lm
bmRlZiBfX0FNREdQVV9NTUhVQl9IX18KKyNkZWZpbmUgX19BTURHUFVfTU1IVUJfSF9fCisKK3N0
cnVjdCBhbWRncHVfbW1odWJfZnVuY3MgeworCXZvaWQgKCpyYXNfaW5pdCkoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpOworCXZvaWQgKCpxdWVyeV9yYXNfZXJyb3JfY291bnQpKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2LAorCQkJCQl2b2lkICpyYXNfZXJyb3Jfc3RhdHVzKTsKK307CisK
KyNlbmRpZgorCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlf
MC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwppbmRleCBhMmFhMzVl
YjUxMmMuLmNlOGZmNzE3Mjg4MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ21jX3Y5XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5j
CkBAIC02NTIsNiArNjUyLDE3IEBAIHN0YXRpYyB2b2lkIGdtY192OV8wX3NldF91bWNfZnVuY3Mo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJfQogfQogCitzdGF0aWMgdm9pZCBnbWNfdjlf
MF9zZXRfbW1odWJfZnVuY3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCit7CisJc3dpdGNo
IChhZGV2LT5hc2ljX3R5cGUpIHsKKwljYXNlIENISVBfVkVHQTIwOgorCQlhZGV2LT5tbWh1Yl9m
dW5jcyA9ICZtbWh1Yl92MV8wX2Z1bmNzOworCQlicmVhazsKKwlkZWZhdWx0OgorCQlicmVhazsK
Kwl9Cit9CisKIHN0YXRpYyBpbnQgZ21jX3Y5XzBfZWFybHlfaW5pdCh2b2lkICpoYW5kbGUpCiB7
CiAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKilo
YW5kbGU7CkBAIC02NTksNiArNjcwLDcgQEAgc3RhdGljIGludCBnbWNfdjlfMF9lYXJseV9pbml0
KHZvaWQgKmhhbmRsZSkKIAlnbWNfdjlfMF9zZXRfZ21jX2Z1bmNzKGFkZXYpOwogCWdtY192OV8w
X3NldF9pcnFfZnVuY3MoYWRldik7CiAJZ21jX3Y5XzBfc2V0X3VtY19mdW5jcyhhZGV2KTsKKwln
bWNfdjlfMF9zZXRfbW1odWJfZnVuY3MoYWRldik7CiAKIAlhZGV2LT5nbWMuc2hhcmVkX2FwZXJ0
dXJlX3N0YXJ0ID0gMHgyMDAwMDAwMDAwMDAwMDAwVUxMOwogCWFkZXYtPmdtYy5zaGFyZWRfYXBl
cnR1cmVfZW5kID0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHVi
X3YxXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3YxXzAuYwppbmRleCAy
OTJmM2IxY2RkZjIuLmZhOTYxZTBiNmYyZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvbW1odWJfdjFfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21t
aHViX3YxXzAuYwpAQCAtNTg0LDMgKzU4NCwxMiBAQCB2b2lkIG1taHViX3YxXzBfZ2V0X2Nsb2Nr
Z2F0aW5nKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1MzIgKmZsYWdzKQogCWlmIChkYXRh
ICYgQVRDX0wyX01JU0NfQ0dfX01FTV9MU19FTkFCTEVfTUFTSykKIAkJKmZsYWdzIHw9IEFNRF9D
R19TVVBQT1JUX01DX0xTOwogfQorCitzdGF0aWMgdm9pZCBtbWh1Yl92MV8wX3F1ZXJ5X3Jhc19l
cnJvcl9jb3VudChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKKwkJCQkJICAgdm9pZCAqcmFz
X2Vycm9yX3N0YXR1cykKK3sKK30KKworY29uc3Qgc3RydWN0IGFtZGdwdV9tbWh1Yl9mdW5jcyBt
bWh1Yl92MV8wX2Z1bmNzID0geworCS5xdWVyeV9yYXNfZXJyb3JfY291bnQgPSBtbWh1Yl92MV8w
X3F1ZXJ5X3Jhc19lcnJvcl9jb3VudCwKK307CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9tbWh1Yl92MV8wLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1
Yl92MV8wLmgKaW5kZXggMGRlMGZkZjk4YzAwLi5jNDMzMTllOGY5NDUgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3YxXzAuaAorKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9tbWh1Yl92MV8wLmgKQEAgLTIzLDYgKzIzLDggQEAKICNpZm5kZWYgX19N
TUhVQl9WMV8wX0hfXwogI2RlZmluZSBfX01NSFVCX1YxXzBfSF9fCiAKK2V4dGVybiBjb25zdCBz
dHJ1Y3QgYW1kZ3B1X21taHViX2Z1bmNzIG1taHViX3YxXzBfZnVuY3M7CisKIHU2NCBtbWh1Yl92
MV8wX2dldF9mYl9sb2NhdGlvbihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7CiBpbnQgbW1o
dWJfdjFfMF9nYXJ0X2VuYWJsZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7CiB2b2lkIG1t
aHViX3YxXzBfZ2FydF9kaXNhYmxlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKLS0gCjIu
MTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
