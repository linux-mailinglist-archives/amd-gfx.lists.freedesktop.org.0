Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92122B6176
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Sep 2019 12:30:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CFB16EEB6;
	Wed, 18 Sep 2019 10:30:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800070.outbound.protection.outlook.com [40.107.80.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C2F6EEB6
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Sep 2019 10:30:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XWh5+53iv5X5sdAtvF+gzoAZf/NfxBViXW5fpvEdeefEDeLnsDuZMc+VNaOZJScCs9ltpU2kT/eKkFjXVu4iXCKuvZ5zD1RIEePrZtb2p+AfXZcB+aKeYNLbsTYtq3gJFKJpifSlSi5gWQ6TK1HAKoc5ZqlnvoIMdveYs7MKuRUKZ0llXSBmFhP8hjjTpjaqB6oIkl8jeii3M1dPW+UbByXnmv9w+hxgxGXfDH5dcOyC0ihvJhxiPbIv+fSnEYNjLDlqQqXc1k0I7ygjCfusa3/SvC8Pu16LSF9RCzl5dqmEpJEOuV8qpteh+1TnkUjSyTxjAUeO/uAFaCzr+SPK3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZsYmDBwY73bmjRJStY9i3dp+5OPO4ESCyOUKBF+e2g=;
 b=WJucCvvzEFIaS2r1JIzAx4XGdM2GlPA26ZYgbjGbT33jKZHE7nY7n5TEiz+L2idLmvstRwwUi7Mc+7TnPJW+NHYiarB5c5eep3eAV8wFgnYWMTjQMhIkfvI1PzozO+7rOZ3xkP/hPIAgKL77LRKya0FknaEIzY4H5rwBA1JkNgJk+lDixJ2X+f+SprmJUX+N7P6CODQIAzCGHu8iF8SrAcU9LqyaS7uuPiYsMC9gotfJ5j7dtD+ZfBFJGbVoOKNk51ZgVTFpKms+fL9CjT794eD6m1/W4BbRpnH//lZlgOLL5qnfQgiq09ae3zl0JE0LZMi83yCLZH3OUvgwhiVyzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0022.namprd12.prod.outlook.com (2603:10b6:5:1c0::35)
 by BN7PR12MB2642.namprd12.prod.outlook.com (2603:10b6:408:26::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.23; Wed, 18 Sep
 2019 10:30:05 +0000
Received: from CO1NAM03FT031.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by DM6PR12CA0022.outlook.office365.com
 (2603:10b6:5:1c0::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.21 via Frontend
 Transport; Wed, 18 Sep 2019 10:30:05 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT031.mail.protection.outlook.com (10.152.80.171) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2263.14 via Frontend Transport; Wed, 18 Sep 2019 10:30:05 +0000
Received: from rico-code.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 18 Sep 2019
 05:30:03 -0500
From: Tianci Yin <tianci.yin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdgpu/gfx10: update gfx golden settings for navi14
Date: Wed, 18 Sep 2019 18:30:00 +0800
Message-ID: <20190918103000.5606-2-tianci.yin@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190918103000.5606-1-tianci.yin@amd.com>
References: <20190918103000.5606-1-tianci.yin@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(346002)(396003)(428003)(199004)(189003)(2616005)(36756003)(305945005)(486006)(44832011)(8936002)(48376002)(478600001)(2351001)(14444005)(6916009)(16586007)(316002)(70206006)(54906003)(70586007)(50226002)(8676002)(81166006)(186003)(81156014)(50466002)(15650500001)(2906002)(336012)(47776003)(86362001)(1076003)(426003)(7696005)(476003)(356004)(76176011)(51416003)(446003)(26005)(5660300002)(126002)(4326008)(53416004)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2642; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65a15d1d-1f95-4ee8-dd46-08d73c232be2
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:BN7PR12MB2642; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2642:
X-Microsoft-Antispam-PRVS: <BN7PR12MB2642FD87CD82F4217E4C41F6958E0@BN7PR12MB2642.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 01644DCF4A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: rKN4zlvZqeuK98AMrA+KRi4pU8I2rSC55P2EDLTPuUGvvUoC/qIe736W5QBMbuNJ4UJhBtyG1TJOcoLPyZ1saxpaenNLghYrZhrlIY8vgLGChxwkTSRPegvDaFdQJpmHdEa3lmi1HdkSF7qkuwEocelhV0lSPp8/893vBcjn4K9AUFG2mNj0M5m1aS/Chb9yL8nJ4XYxBcPclv5BbNwxg6ica+usdTbvEY4L1Jv1HSXnzU4HC+bpoYpJx+dXW41RwmGcBA5vXKn2E6lud/Xquf2bY3Ww/j+lJelo1E+hyWmJmNYWF6C+jWmcuZ+HAOwIJdmfjpWCBQBarbbaXj8qDY2S1v/zZ5WfQ71vHWKoWnimpS+drvkNcYRfY531hxbOLgqYvSCWAOJeuyugg3NwiJcLxHy+2KU5D6dlZZ411BY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2019 10:30:05.1782 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65a15d1d-1f95-4ee8-dd46-08d73c232be2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2642
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZsYmDBwY73bmjRJStY9i3dp+5OPO4ESCyOUKBF+e2g=;
 b=fG8+IJ2R9Fuwfi0Z1/NfXXkI1nGWuWbDkNVI+RbNfZUT5/gvi7g7hgdXSG2RFJXpi+KV5F5npvBH098ywil2Sg5kI/xnFRMZc8Dalvmd7ScFEy7n3s6BhQ2liHPiDlZSiukN/o9fS+tPlGvZJdVhWOpe2m3yhCGXTcQH+Eqlyn0=
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
OiBtbVVUQ0wxX0NUUkwKCkNoYW5nZS1JZDogSTZkZjEyNTU1YjcyYmE2ZmFhOTI2YWY4MTU1YjNm
MDc5ZTQyMmE1MDAKU2lnbmVkLW9mZi1ieTogVGlhbmNpLllpbiA8dGlhbmNpLnlpbkBhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nZnhfdjEwXzAuYwppbmRleCA3OTAxNTMwZDA3ZjAuLjEyMTgyNGI0N2QwMiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKQEAgLTE2MSw3ICsxNjEsNyBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IHNvYzE1X3JlZ19nb2xkZW4gZ29sZGVuX3NldHRpbmdzX2dj
XzEwXzFfMVtdID0KIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbVNRX0xEU19DTEtf
Q1RSTCwgMHhmZmZmZmZmZiwgMHhmZmZmZmZmZiksCiAJU09DMTVfUkVHX0dPTERFTl9WQUxVRShH
QywgMCwgbW1UQV9DTlRMX0FVWCwgMHhmZmY3ZmZmZiwgMHgwMTAzMDAwMCksCiAJU09DMTVfUkVH
X0dPTERFTl9WQUxVRShHQywgMCwgbW1UQ1BfQ05UTCwgMHg2MDAwMDAxMCwgMHg0NzljMDAxMCks
Ci0JU09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1VVENMMV9DVFJMLCAweDAwODAwMDAw
LCAweDAwODAwMDAwKSwKKwlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbVVUQ0wxX0NU
UkwsIDB4MDBjMDAwMDAsIDB4MDBjMDAwMDApLAogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBz
b2MxNV9yZWdfZ29sZGVuIGdvbGRlbl9zZXR0aW5nc19nY18xMF8xX252MTRbXSA9Ci0tIAoyLjE3
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
