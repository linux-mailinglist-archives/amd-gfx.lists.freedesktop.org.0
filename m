Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAECE1FB74
	for <lists+amd-gfx@lfdr.de>; Wed, 15 May 2019 22:24:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F9E89193;
	Wed, 15 May 2019 20:24:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690041.outbound.protection.outlook.com [40.107.69.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D1789193
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 May 2019 20:24:25 +0000 (UTC)
Received: from SN1PR12CA0089.namprd12.prod.outlook.com (2603:10b6:802:21::24)
 by DM5PR1201MB0060.namprd12.prod.outlook.com (2603:10b6:4:54::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1900.16; Wed, 15 May
 2019 20:24:23 +0000
Received: from BY2NAM03FT024.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::204) by SN1PR12CA0089.outlook.office365.com
 (2603:10b6:802:21::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1900.16 via Frontend
 Transport; Wed, 15 May 2019 20:24:23 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT024.mail.protection.outlook.com (10.152.84.229) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Wed, 15 May 2019 20:24:23 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 15 May 2019
 15:24:21 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amd/powerplay: Fix maybe-uninitialized in
 get_ppfeature_status
Date: Wed, 15 May 2019 16:24:12 -0400
Message-ID: <20190515202413.6522-1-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(346002)(396003)(136003)(39860400002)(2980300002)(428003)(199004)(189003)(2351001)(336012)(126002)(476003)(305945005)(86362001)(2870700001)(23676004)(7696005)(2616005)(81166006)(14444005)(2906002)(81156014)(4326008)(1076003)(77096007)(486006)(186003)(316002)(8676002)(426003)(36756003)(356004)(8936002)(6666004)(5820100001)(50466002)(68736007)(26005)(478600001)(72206003)(70206006)(70586007)(47776003)(6916009)(53416004)(53936002)(50226002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0060; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb8f558c-0f2c-4458-530e-08d6d97351a1
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:DM5PR1201MB0060; 
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0060:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0060334912292E767D13C4BCF9090@DM5PR1201MB0060.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-Forefront-PRVS: 0038DE95A2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 96pki9D/Oyv8rMYJWGBEidZd4N/9hCucdMER8W/zv7q3ErLLitu9ZSTYq2710CGxJuKcPDDYrR7wqEAzbW+VayyT7wBKuqFzPpgisK8ivPJYnOj4/zqnUUK430DfPe2Gh+ernck4gjXsJoJ7+Ahgq0AflW4i9F4iux4rmLllA2qGEgMnTb/bWiVTFbvvyAkNG3fYXO71fTUoDVEOuRaPVODhjBRDeT++oZ84QAHE+ntKpCB/nPEM9zmbDdbNJEYmXnwggrotTxfrWKrFrUaIYo7YoYBcsIDo6BMwsvPXH11WBNMGdwb03P7xx+Q7E5oE9s4IoiNVTcTYmtmnk24pirXZt9V6eJsapWA1SPPsTsUjNFniigU7xp2SEQ/ht0qI7ePxHSR6KJf/AilG1cMrS3OKsl5lOBOQEHVRTHBUFhQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2019 20:24:23.2006 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb8f558c-0f2c-4458-530e-08d6d97351a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0060
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDyP2EnUXOqJybIi96H8Bw8yC0IZkZgt/0GG2R4B5Sk=;
 b=snQkJb19jLhixBLkJ/FnV1NW52gK/fS/wPsKMTrp4QhLCm++slukeO1BMxJavFk3yMoEpAOaXk7Rc6+tWLwKH87C0KxB1gfD0+BGmmgaTPqIz1vy+M1oae47OE6Vukdv/iFlkyLvmVjNc6QRb5qYJQOeit8yDf6X3qsV2BnJcTA=
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBmaXhlcyB0aGUgd2FybmluZyBiZWxvdwoKZXJyb3I6IOKAmGZlYXR1cmVfbWFza+KAmSBt
YXkgYmUgdXNlZCB1bmluaXRpYWxpemVkIGluIHRoaXMgZnVuY3Rpb24gWy1XZXJyb3I9bWF5YmUt
dW5pbml0aWFsaXplZF0KICAqZmVhdHVyZXNfZW5hYmxlZCA9ICgoKCh1aW50NjRfdClmZWF0dXJl
X21hc2tbMF0gPDwgU01VX0ZFQVRVUkVTX0xPV19TSElGVCkgJiBTTVVfRkVBVFVSRVNfTE9XX01B
U0spIHwKICAgICAgICAgICAgICAgICAgICAgIH5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fl4KICAg
ICgoKHVpbnQ2NF90KWZlYXR1cmVfbWFza1sxXSA8PCBTTVVfRkVBVFVSRVNfSElHSF9TSElGVCkg
JiBTTVVfRkVBVFVSRVNfSElHSF9NQVNLKSk7CiAgICB+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
CgpTaWduZWQtb2ZmLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKaW5kZXggYjM5ZjNkNDM5MzMy
Li40YWE4ZjVhNjljNGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L3ZlZ2EyMF9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBf
cHB0LmMKQEAgLTIzNzcsNyArMjM3Nyw3IEBAIHN0YXRpYyBpbnQgdmVnYTIwX29kbl9lZGl0X2Rw
bV90YWJsZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIHN0YXRpYyBpbnQgdmVnYTIwX2dldF9l
bmFibGVkX3NtY19mZWF0dXJlcyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIAkJdWludDY0X3Qg
KmZlYXR1cmVzX2VuYWJsZWQpCiB7Ci0JdWludDMyX3QgZmVhdHVyZV9tYXNrWzJdOworCXVpbnQz
Ml90IGZlYXR1cmVfbWFza1syXSA9IHswLCAwfTsKIAlpbnQgcmV0ID0gMDsKIAogCXJldCA9IHNt
dV9mZWF0dXJlX2dldF9lbmFibGVkX21hc2soc211LCBmZWF0dXJlX21hc2ssIDIpOwotLSAKMi4x
Ny4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
