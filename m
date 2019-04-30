Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D18E10192
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 23:10:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB06C892E4;
	Tue, 30 Apr 2019 21:10:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820057.outbound.protection.outlook.com [40.107.82.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD8BA892A5
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 21:10:10 +0000 (UTC)
Received: from DM3PR12CA0107.namprd12.prod.outlook.com (2603:10b6:0:55::27) by
 DM5PR12MB2375.namprd12.prod.outlook.com (2603:10b6:4:b4::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Tue, 30 Apr 2019 21:10:09 +0000
Received: from BY2NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::200) by DM3PR12CA0107.outlook.office365.com
 (2603:10b6:0:55::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Tue, 30 Apr 2019 21:10:09 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT009.mail.protection.outlook.com (10.152.84.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1835.14 via Frontend Transport; Tue, 30 Apr 2019 21:10:08 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Apr 2019
 16:09:54 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 16/20] drm/amd/display: Don't warn when DC update type > DM
 guess
Date: Tue, 30 Apr 2019 17:09:29 -0400
Message-ID: <20190430210938.32335-32-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
References: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(376002)(39860400002)(396003)(346002)(2980300002)(428003)(189003)(199004)(486006)(15650500001)(336012)(476003)(53936002)(8936002)(1076003)(68736007)(316002)(26005)(53416004)(70206006)(2616005)(4326008)(8676002)(77096007)(70586007)(47776003)(76176011)(6916009)(81166006)(14444005)(81156014)(426003)(126002)(446003)(51416003)(7696005)(50466002)(48376002)(6666004)(5660300002)(478600001)(36756003)(186003)(11346002)(72206003)(356004)(86362001)(50226002)(305945005)(16586007)(2906002)(2351001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2375; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4006151b-3a19-4369-77e7-08d6cdb039f2
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:DM5PR12MB2375; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB2375:
X-Microsoft-Antispam-PRVS: <DM5PR12MB2375A499838F0B9542D95E69F93A0@DM5PR12MB2375.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 00235A1EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: iBWZywJXf1Z+4m8D5nH+ZHKJpjbtHGYf+zn1dLEMlTdUZp+kTbfMannu2+SlfR1TmVn1ZIOUSmvphfP97Y7E++rAgtTSDt1q4+hZp9njmqc07/3m5VMZH8zABPQoBLcgVEDhSCU8GBXVn5mj0DT0ZUP+gMxPq0vqHzOkY0Y5Wc3xJzW/1CLqBR2KAAca/edA2WfojVURoKXRiX1bD806q1RH0rn55lg7bTAyf6QMzsdM18aHs119a2b8spBxL5R1aiKXfIaHfYJbY2j/fpAJDWdJxBBOkWuXUKF+vmOLrb6wEzon7A6tDodEHmukK4GGEs1E6JTgX8NajeNriprbXeAzBySA2jT9owh2Vbxgv3Ug3XEIi48tTIOc5wcVgg9wO0uP4OT/AZ41DK2LZs26LGPRTpohoHYaX0hhas6KA9I=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2019 21:10:08.7772 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4006151b-3a19-4369-77e7-08d6cdb039f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2375
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1BGPj7swBBIP+32/NTsx6cSNAdTi4xkc+bDjffQv48U=;
 b=YCz58ZUDFxDyxsGC69bfo9TXDSxipuIhI43TGFHtus/x4SeZz1gEePDmIBdg38sOXpMH0CgWpXMtU+k0n5yqemAlXnojPf7yljWFqL+ih7FjUNTwUISnbssRB1FiKB5lnZCOH0c8Azez4JjNd1GODirDHU5C6hmFvVMPXvGx15Y=
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
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgoK
W1doeV0KRE0gdGhpbmtzIHRoYXQgdGhlIHVwZGF0ZSB0eXBlIHNob3VsZCBiZSBmdWxsIHdoZW5l
dmVyIGEgc3RyZWFtIG9yCnBsYW5lIGlzIGFkZGVkIG9yIHJlbW92ZWQgKGluY2x1ZGluZyByZWNy
ZWF0aW9ucykuCgpUaGlzIHdvbid0IG1hdGNoIGluIHRoZSBjYXNlIHdoZXJlIERDIHRoaW5rcyB3
aGF0IGxvb2tzIGxpa2UgYSBmYXN0CnVwZGF0ZSB0byBETSBpcyBhY3R1YWxseSBhIG1lZGl1bSBv
ciBmdWxsIC0gbGlrZSBzY2FsaW5nIGNoYW5nZXMgdGhhdAphZmZlY3QgYmFuZHdpZHRoIGFuZCBj
bG9ja3MuCgpbSG93XQpEcm9wIHRoaXMgd2FybmluZy4gREMga25vd3MgYmV0dGVyIHRoYW4gdGhl
IERNIGRvZXMgZm9yIGRldGVybWluaW5nCmNhc2VzIGxpa2UgdGhpcy4KClRoZSBvdGhlciB3YXJu
aW5nIGNhbiBiZSBrZXB0IGZvciBub3cgc2luY2UgaXQgd291bGQgd2FybiBvbiBhIHByZXR0eQpz
ZXJpb3VzIERDIG9yIERNIGJ1Zy4KCkNoYW5nZS1JZDogSTNlYWY3MmIzYWJkZTZjYTZkY2ZlNzJm
MGY3MzRmZTVlMjE1Nzk4ZGQKU2lnbmVkLW9mZi1ieTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmlj
aG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgpSZXZpZXdlZC1ieTogRGF2aWQgRnJhbmNpcyA8RGF2
aWQuRnJhbmNpc0BhbWQuY29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnBy
ZWV0IExha2hhQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG0uYyB8IDMgLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0u
YwppbmRleCBkODdkODBhZWU2NjIuLjNhYTFiOWMwNWY4OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCkBAIC02NjkxLDkgKzY2OTEs
NiBAQCBzdGF0aWMgaW50IGFtZGdwdV9kbV9hdG9taWNfY2hlY2soc3RydWN0IGRybV9kZXZpY2Ug
KmRldiwKIAkgKi8KIAlpZiAobG9ja19hbmRfdmFsaWRhdGlvbl9uZWVkZWQgJiYgb3ZlcmFsbF91
cGRhdGVfdHlwZSA8PSBVUERBVEVfVFlQRV9GQVNUKQogCQlXQVJOKDEsICJHbG9iYWwgbG9jayBz
aG91bGQgYmUgU2V0LCBvdmVyYWxsX3VwZGF0ZV90eXBlIHNob3VsZCBiZSBVUERBVEVfVFlQRV9N
RUQgb3IgVVBEQVRFX1RZUEVfRlVMTCIpOwotCWVsc2UgaWYgKCFsb2NrX2FuZF92YWxpZGF0aW9u
X25lZWRlZCAmJiBvdmVyYWxsX3VwZGF0ZV90eXBlID4gVVBEQVRFX1RZUEVfRkFTVCkKLQkJV0FS
TigxLCAiR2xvYmFsIGxvY2sgc2hvdWxkIE5PVCBiZSBzZXQsIG92ZXJhbGxfdXBkYXRlX3R5cGUg
c2hvdWxkIGJlIFVQREFURV9UWVBFX0ZBU1QiKTsKLQogCiAJaWYgKG92ZXJhbGxfdXBkYXRlX3R5
cGUgPiBVUERBVEVfVFlQRV9GQVNUKSB7CiAJCXJldCA9IGRtX2F0b21pY19nZXRfc3RhdGUoc3Rh
dGUsICZkbV9zdGF0ZSk7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
