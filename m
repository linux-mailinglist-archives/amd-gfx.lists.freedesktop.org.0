Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CC0B6175
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Sep 2019 12:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D10A86EEB8;
	Wed, 18 Sep 2019 10:30:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770050.outbound.protection.outlook.com [40.107.77.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA3D6EEB6
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Sep 2019 10:30:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qk6EAXwIZ1ReaLnxUKaK4RbVuYV6uZ4JIw/VViHDkJHcNCV7mEjWxH3O7bX1zvVT4e0+eXBTPI5U1mCahI1fYeFAUK8DX8UcSrOFtPPioFV69FxTtmARpnjvfpKJf3Q6t1AuL25hENzENFYaVcEv2lxooxiYSj0CoxrOxSpagpm319CcRnRzjl+93HOF1yUI+IOQnEIiFtsK8j/2D8gILqBxeQBO+rcgVZKkrBF6oci2abs95ALe166ZU7N6zwnLM1MQQSNjHg69IzUc0cpaC+tR/neHBCfJgsRcSddYGbm0YI9r5BumvQEgDHwtam9d5qcKAtpQy6DA5DjAkkSZcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hF88I45CzucpJNY6gCyMVA4iTSOoKn9lS+y+G6LVML0=;
 b=JQqkH8YeM9QzvrpmDByD3iFWglzzJUgTtRqTvN20F5o2BQhXu+GhnxLafYOMZByzmPAK2KvAeiDW7FepW758WWxIG3wWq5ZcJ7LsSHyLJrgVuzBBUpx1F44MWbHgBtOTz15tnafZHaTRbRCJ++R4vSKkcqZiV23DN6Sw6MevKslbjFMCdWJOQumBziUFiDPxuOCb0o2zc6sfEQNWZHM0nJUU9u8e2fX8PXmMvBL9nc/eTpQl66PRMcBME1jUDyPXFfoIjpsTuxW430OI6AjG5ziogQgQOF3TOPFOv4H/nrJwcI2nF6V5GsGjYnS59rRUx1b+BKkwDnZmEvk1nloQFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0009.namprd12.prod.outlook.com (2603:10b6:5:1c0::22)
 by BY5PR12MB3923.namprd12.prod.outlook.com (2603:10b6:a03:194::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.17; Wed, 18 Sep
 2019 10:30:04 +0000
Received: from CO1NAM03FT031.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by DM6PR12CA0009.outlook.office365.com
 (2603:10b6:5:1c0::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.18 via Frontend
 Transport; Wed, 18 Sep 2019 10:30:04 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT031.mail.protection.outlook.com (10.152.80.171) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2263.14 via Frontend Transport; Wed, 18 Sep 2019 10:30:03 +0000
Received: from rico-code.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 18 Sep 2019
 05:30:02 -0500
From: Tianci Yin <tianci.yin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amdgpu/gfx10: update gfx golden settings
Date: Wed, 18 Sep 2019 18:29:59 +0800
Message-ID: <20190918103000.5606-1-tianci.yin@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(346002)(376002)(396003)(428003)(199004)(189003)(44832011)(36756003)(86362001)(15650500001)(14444005)(316002)(8936002)(81166006)(81156014)(8676002)(50226002)(70586007)(70206006)(2906002)(51416003)(478600001)(47776003)(54906003)(16586007)(7696005)(5660300002)(50466002)(126002)(356004)(186003)(6666004)(26005)(6916009)(48376002)(426003)(486006)(305945005)(4326008)(2351001)(476003)(2616005)(53416004)(336012)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB3923; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d475bbc-592c-4a50-e158-08d73c232b21
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:BY5PR12MB3923; 
X-MS-TrafficTypeDiagnostic: BY5PR12MB3923:
X-Microsoft-Antispam-PRVS: <BY5PR12MB39236AF4968C95D01DC829B5958E0@BY5PR12MB3923.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 01644DCF4A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: IIN2P4rhW2TANSvYPr0FWQ5HawWT3cP4VbzpeRKaH//KZyza2ow9rSmfkXERDUoD3e/dsVeZV3nMJ6hZJS3I2qAhM2ESq88XKPI4zMZFsLU08Yiw860hHJgVDSbc0LqmbIddw+eMVuFHFbQL70ZXnOZpDUivvN84O62kOf1rDSCXz6A8VbuXEs0MrbEAji1gvRTobCEXNbIVFpHkk4PJ7TzSqf2uRp7mOnTMA8kxGbtKiZW2KQlFQ1veppv7mjHIwpqzx83t1iXPiZskh/e6EhOMVp36cPRjr0IX1E0XrTqJc7X4tdjZ3xcuBlzomtbBihe/QAL6X+mY/WE9svEPbHVgv2Q8Fylh4yACWcHhzYzk/eMpSXq46n4HonVEjOzwFFy3cfK6yiqUPcjmB5RAeX7wJuUt0P/r7+hzLHBrtxk=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2019 10:30:03.9325 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d475bbc-592c-4a50-e158-08d73c232b21
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3923
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hF88I45CzucpJNY6gCyMVA4iTSOoKn9lS+y+G6LVML0=;
 b=avdYTAbTVcmrznme0U9V4b0J72wdvt1xz+MXUYpMkOckqhdTxO2HbZuu4cPTPIW863MblDOsu+p4WHkNWw1ga+fv1CVppPUdv4yRsfepNGO9nCT7nK1tRHDO0Mc3EYnhnuo5p/gxpyCChDRO1oBiYlkc6LdhcuhHcFesZmGmrAg=
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
Cc: Tianci Yin <tianci.yin@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogIlRpYW5jaS5ZaW4iIDx0aWFuY2kueWluQGFtZC5jb20+Cgp1cGRhdGUgcmVnaXN0ZXJz
OiBtbVVUQ0wxX0NUUkwKCkNoYW5nZS1JZDogSWNiNTBmYjM1YTQyN2E1MGEwNjEzOGI4YjM3MTU2
NTFlZWJlOTJiOTUKU2lnbmVkLW9mZi1ieTogVGlhbmNpLllpbiA8dGlhbmNpLnlpbkBhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nZnhfdjEwXzAuYwppbmRleCA0ZTZiNDg4NTlhY2EuLjc5MDE1MzBkMDdmMCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKQEAgLTExMSw3ICsxMTEsNyBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IHNvYzE1X3JlZ19nb2xkZW4gZ29sZGVuX3NldHRpbmdzX2dj
XzEwXzFbXSA9CiAJU09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1UQV9DTlRMX0FVWCwg
MHhmZmY3ZmZmZiwgMHgwMTAzMDAwMCksCiAJU09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwg
bW1UQ1BfQ05UTCwgMHg2MDAwMDAxMCwgMHg0NzljMDAxMCksCiAJU09DMTVfUkVHX0dPTERFTl9W
QUxVRShHQywgMCwgbW1VVENMMV9DR1RUX0NMS19DVFJMLCAweGZlZmYwZmZmLCAweDQwMDAwMTAw
KSwKLQlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbVVUQ0wxX0NUUkwsIDB4MDA4MDAw
MDAsIDB4MDA4MDAwMDApCisJU09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1VVENMMV9D
VFJMLCAweDAwYzAwMDAwLCAweDAwYzAwMDAwKQogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBz
b2MxNV9yZWdfZ29sZGVuIGdvbGRlbl9zZXR0aW5nc19nY18xMF8wX252MTBbXSA9Ci0tIAoyLjE3
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
