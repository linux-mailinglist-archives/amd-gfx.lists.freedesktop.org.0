Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8F1ADB78
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Sep 2019 16:49:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 008A8896ED;
	Mon,  9 Sep 2019 14:49:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760058.outbound.protection.outlook.com [40.107.76.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190D4896ED
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 Sep 2019 14:49:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XcUlmyGfJ4f0n9VjApIzeuj9OHHV7/jXZmssKfqVFdNWUs0q+PQg53rHxbVYIkkCf4L1ijeyr8xnvgijYIAO9J2UAkPnwhFCeO5Yrd/lNpUVoOKwqhkM/3YunmdrRuU6Nc/2tpD3qc4aAZKVc5LgxW6G3sbq6bGnfuGEHg5/SqXkHgEWuxy8fz2be6B87RPVF2KSAlA3yOxl0mnLwCFncJWnXImhpqcznyr/jgolvwYpd7tZY707bp9LliW85hWZQMHFPodyTAt01mzISZtaX4aMC5YinPwIfSl0Ai/rN3Syl5yG5l92Jh5q1hOT4o4TMVeJSvzz3zFt7rckpwJ/IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPZre8vy3gm6HLWmQ80IeC3ne8m5GxBo5O7cq9Ue8G0=;
 b=iva2TRztmi9bGfOFxut4+KzCAdNp9DoqHE9bJwO3nYhA/OntMtrKRoJeLHcOW1RF9TavDc5pqVRjqcrbI4zV/XUCoqbyzaZfQPToIe5VhFekNwIj0ifpxUhFVo+6FqBP3g+Zp2OPIP7FYX6v6yn0jZ0mU3S5vGPpU3802EUdqk3KwCzpla3rd840mqP6QJZwO5k7pcV6LtXC/oHDKxRMtRG384l/8aD6zPEC6R3u5sh0ltN+5PHtApqLLgCsCj85RcCUyDM3MmKX2e+BeudJR7wCarOZOpCeHBLh6XInIBUf8jeaJtchUH2A7dPKf72e7JJyJazsx6TIm4Dmh1rUvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from SN1PR12CA0046.namprd12.prod.outlook.com (2603:10b6:802:20::17)
 by BL0PR12MB2433.namprd12.prod.outlook.com (2603:10b6:207:4a::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.20; Mon, 9 Sep
 2019 14:49:21 +0000
Received: from BY2NAM03FT051.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::201) by SN1PR12CA0046.outlook.office365.com
 (2603:10b6:802:20::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 9 Sep 2019 14:49:21 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT051.mail.protection.outlook.com (10.152.85.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Mon, 9 Sep 2019 14:49:20 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Mon, 9 Sep 2019 09:49:19 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Avoid RAS recovery init when no RAS support.
Date: Mon, 9 Sep 2019 10:49:09 -0400
Message-ID: <1568040549-3664-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(396003)(39860400002)(2980300002)(428003)(199004)(189003)(305945005)(48376002)(86362001)(478600001)(356004)(5660300002)(6666004)(14444005)(126002)(476003)(70586007)(70206006)(2351001)(26005)(4744005)(2616005)(336012)(186003)(44832011)(426003)(2906002)(486006)(36756003)(53936002)(53416004)(7696005)(51416003)(8936002)(81166006)(81156014)(8676002)(316002)(16586007)(50226002)(50466002)(6916009)(47776003)(54906003)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2433; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3cb23146-6401-48d2-0e75-08d73534e5ea
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BL0PR12MB2433; 
X-MS-TrafficTypeDiagnostic: BL0PR12MB2433:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2433EBC19C545725DE9867D2EAB70@BL0PR12MB2433.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:389;
X-Forefront-PRVS: 01559F388D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: WSigC78ZKcB2mR78CRKHZB19QGOGhD9VX57Dzwt6/1gU+Q7SZsAn2LlapSy/j+BsSsJHmcrzR7SE3wWd6+hRBheqKcIUBfbbF8Tng7pc36Ps07F9rP/Eox7Fv4Jsq7cxLqn+IWsoNR9La/9aSHBc0b7M/xoSm8bnzdYhIGCWgfsC6XX6N4hapFaMPcgAwfFVkVxiy3ZbbZV8ReFCWMs5ekhiMQDsO9Uul5p1o+nA6Up2HtC0WlfM38kNQkV0xlOuZv5LrKE50YZbIN58ra2YpSu1R8C+MtN9NO8T/BeM5cWbQ4CZDlAH83kikp0B1JMdhEdDohl0bNOTEL2z8+4Q+rk3KyN+189FKGRPqm+IqsvOtDVcBrIl5M5s6mB3rDWKBpduofq9DYyINBc1eSrfZFLn838BjrSXIKe0nlEmVow=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2019 14:49:20.6616 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cb23146-6401-48d2-0e75-08d73534e5ea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2433
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPZre8vy3gm6HLWmQ80IeC3ne8m5GxBo5O7cq9Ue8G0=;
 b=xWZsHVgsTkq79pSjVauDZ28wVUOfEvWDp6chk2bqr2njmaCT060hvw2tLlQYKXwmOCgCnocRBtBgIAwIMgR2YdAfAwFh6J6DUlJxMn99z1TZhSD7Kx2p7h2J5LsXPrCLM+liQfc7tTjXmzaAokj0kxrB/HUyNbwbSo3F13LIAc8=
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
Cc: Tom.StDenis@amd.com, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Tao.Zhou1@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXMgZHJpdmVyIGxvYWQgcmVncmVzc2lvbiBvbiBBUFVzLgoKU2lnbmVkLW9mZi1ieTogQW5k
cmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIHwgNyArKysrKystCiAxIGZpbGUgY2hhbmdl
ZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3Jhcy5jCmluZGV4IGQyNDM3ZTEuLjExOWJlZGMgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKQEAgLTE0OTQsOSArMTQ5NCwxNCBAQCBzdGF0aWMgaW50
IGFtZGdwdV9yYXNfcmVsZWFzZV9iYWRfcGFnZXMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
CiBpbnQgYW1kZ3B1X3Jhc19yZWNvdmVyeV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
KQogewogCXN0cnVjdCBhbWRncHVfcmFzICpjb24gPSBhbWRncHVfcmFzX2dldF9jb250ZXh0KGFk
ZXYpOwotCXN0cnVjdCByYXNfZXJyX2hhbmRsZXJfZGF0YSAqKmRhdGEgPSAmY29uLT5laF9kYXRh
OworCXN0cnVjdCByYXNfZXJyX2hhbmRsZXJfZGF0YSAqKmRhdGE7CiAJaW50IHJldDsKIAorCWlm
IChjb24pCisJCWRhdGEgPSAmY29uLT5laF9kYXRhOworCWVsc2UKKwkJcmV0dXJuIDA7CisKIAkq
ZGF0YSA9IGttYWxsb2Moc2l6ZW9mKCoqZGF0YSksIEdGUF9LRVJORUwgfCBfX0dGUF9aRVJPKTsK
IAlpZiAoISpkYXRhKSB7CiAJCXJldCA9IC1FTk9NRU07Ci0tIAoyLjcuNAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
