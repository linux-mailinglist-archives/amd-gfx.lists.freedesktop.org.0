Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AB5DB732
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 21:15:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB956EA38;
	Thu, 17 Oct 2019 19:15:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790083.outbound.protection.outlook.com [40.107.79.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA4806EA7A
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 19:15:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQx1Aj62o6jaGRLeOl83TTVodjipUuhyROlhRubEkkLMv0Ek/UmbRlFQqSuabPCF3njRRd7gvdqdA4tAoJlwVtnrHA3HkOHX2If1jkgWj3SIJCbwkk5VSe4K4WSjmzTp8y+vH7edDTw3FbhIwGWTDm46PZXEkqi9SrKdJu879j81r2cXxCWFH+4lDqIRNL+jluu25TOCycI/oBOLV+4BMgQquvzpj3G/Z0di+44WwWJL1l0u0nbIR8nn+wx7f8P7E3O1vueR/rk6zqzfWd/rB8/RG59Xv2lVwWdcDqnvFwS+qnUpq9iLDOvL9cPNjCTssxu3WTzs6X+rldEcLbPOYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v3Y1JQmZg2uvdQ9FSJ/ksHLixBLIX+PptHtw0bYnSCk=;
 b=WPuOMf4PwveBvOtWcICePkqik8eT/JxI/RA+Eg/wMxFCP8pVqYaIRzcIUaq5DDYNHUCl+5xH4Ho0eMiuYomExpjrE1G+aXI4/b7Gyx+sEoczRTMaE4+vUPsiiD8YYvAZ6DXW1OezhYTOZDIHWB11ybho9PqM83Jl9AvmMr4Mh7QaLZ1oFlLTy/cMvOvwFSJGUeFAghuKdw+5pGCxT1gkyGD7FM0PwssasrY8ZT5U9RTvm7DiIggLFLAqQx2o/jVKZUq5l9eD3Z4GNBiamZkyDKqQJ9drNMnQJxvIuwSPalXd3D8Ys3vNfbKS71LX26dpIP4BXxw38Ec8Iwm8nhzvLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0049.namprd12.prod.outlook.com (2603:10b6:3:103::11)
 by DM6PR12MB3899.namprd12.prod.outlook.com (2603:10b6:5:1c9::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.19; Thu, 17 Oct
 2019 19:15:40 +0000
Received: from CO1NAM03FT008.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::201) by DM5PR12CA0049.outlook.office365.com
 (2603:10b6:3:103::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Thu, 17 Oct 2019 19:15:39 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM03FT008.mail.protection.outlook.com (10.152.80.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2367.14 via Frontend Transport; Thu, 17 Oct 2019 19:15:39 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:38 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:38 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 17 Oct 2019 14:15:38 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 14/37] drm/amd/display: remove unnecessary assert
Date: Thu, 17 Oct 2019 15:13:06 -0400
Message-ID: <20191017191329.11857-15-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017191329.11857-1-sunpeng.li@amd.com>
References: <20191017191329.11857-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(346002)(376002)(428003)(189003)(199004)(36756003)(50466002)(81156014)(1076003)(54906003)(2351001)(76176011)(48376002)(2876002)(316002)(6916009)(305945005)(50226002)(81166006)(51416003)(2906002)(8936002)(2870700001)(186003)(336012)(8676002)(26005)(126002)(426003)(476003)(47776003)(11346002)(446003)(486006)(2616005)(4326008)(356004)(6666004)(70586007)(478600001)(5660300002)(70206006)(86362001)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3899; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6c7733c-10d1-46e5-ca5f-08d7533665cb
X-MS-TrafficTypeDiagnostic: DM6PR12MB3899:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3899A3AA055020A9FD4FF384826D0@DM6PR12MB3899.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-Forefront-PRVS: 01930B2BA8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vldrhRFX0qmbnQtweUlfsEsVpbfYGLAxqMNVhNUEcGmihWSlvj8DucME5NXVf1V37YQPBeVxVfged7/oaVB75B3jtXpMoloRuELzCtKC+XIG5dQ0iieAxVUlyXMpHW+5WHCKDiM5zMWEMT1Pyu2+sAb2tfDT0nMv+9+xeVVxL7MfuC+1gU92NiyoDU54WGUJrtRnFcvIris2kF9uzzXb1ypvrzXAG9VTRVVpjaeODQxzAn67B2EUkGo7w+q4iSpmHm6O1jL0P9qPQiw2z993AJ2D3Ca8aGO8Oh+mzapxVz3Cr/DqevIUy0zT2kjyt/oJJTiNGnRTgOH3uFyKYxIEP/Y6vRodLKyKOrCLp+ZZCzr1qCqiIY0GECFnu2QCZNcDpEURO9kyCkx/rc2e8+4GXf8vjjIXJk/4OUkcyDTfQVc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 19:15:39.5767 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6c7733c-10d1-46e5-ca5f-08d7533665cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3899
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v3Y1JQmZg2uvdQ9FSJ/ksHLixBLIX+PptHtw0bYnSCk=;
 b=RYTpwK/NNpQVkaFJRqLHrs9EirFCIly/1Ee8uKHMWDmJp0i+iJFC4oQRBODa2FHanHfH51/RibEj1625StDKFMb18d2jQFTs+2qoEyqhoVRGr5LEwpSpZGzn9sZ5LAj1jgaK6IoeVon64h+24UMpX3wCDefJ+QfW59DXOJz5IUI=
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
Cc: Leo Li <sunpeng.li@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Chris Park <Chris.Park@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KClNp
Z25lZC1vZmYtYnk6IERteXRybyBMYWt0eXVzaGtpbiA8RG15dHJvLkxha3R5dXNoa2luQGFtZC5j
b20+ClJldmlld2VkLWJ5OiBDaHJpcyBQYXJrIDxDaHJpcy5QYXJrQGFtZC5jb20+CkFja2VkLWJ5
OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYwppbmRleCBkYjNmYjU3
YmYyNDQuLjliYzBmZmFkNzA5MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMKQEAgLTE2MzMsNyArMTYzMyw2IEBAIGJv
b2wgZGNuMjBfc3BsaXRfc3RyZWFtX2Zvcl9vZG0oCiAJbmV4dF9vZG1fcGlwZS0+c3RyZWFtX3Jl
cy5kc2MgPSBOVUxMOwogI2VuZGlmCiAJaWYgKHByZXZfb2RtX3BpcGUtPm5leHRfb2RtX3BpcGUg
JiYgcHJldl9vZG1fcGlwZS0+bmV4dF9vZG1fcGlwZSAhPSBuZXh0X29kbV9waXBlKSB7Ci0JCUFT
U0VSVCghbmV4dF9vZG1fcGlwZS0+bmV4dF9vZG1fcGlwZSk7CiAJCW5leHRfb2RtX3BpcGUtPm5l
eHRfb2RtX3BpcGUgPSBwcmV2X29kbV9waXBlLT5uZXh0X29kbV9waXBlOwogCQluZXh0X29kbV9w
aXBlLT5uZXh0X29kbV9waXBlLT5wcmV2X29kbV9waXBlID0gbmV4dF9vZG1fcGlwZTsKIAl9CkBA
IC0yMzk4LDggKzIzOTcsOCBAQCBpbnQgZGNuMjBfdmFsaWRhdGVfYXBwbHlfcGlwZV9zcGxpdF9m
bGFncygKIAkJCXNwbGl0W2ldID0gdHJ1ZTsKIAkJCWNvbnRleHQtPmJ3X2N0eC5kbWwudmJhLk9E
TUNvbWJpbmVFbmFibGVQZXJTdGF0ZVt2bGV2ZWxdW3BpcGVfaWR4XSA9IHRydWU7CiAJCX0KLQkJ
Y29udGV4dC0+YndfY3R4LmRtbC52YmEuT0RNQ29tYmluZUVuYWJsZWRbcGlwZV9pZHhdCi0JCQk9
IGNvbnRleHQtPmJ3X2N0eC5kbWwudmJhLk9ETUNvbWJpbmVFbmFibGVQZXJTdGF0ZVt2bGV2ZWxd
W3BpcGVfaWR4XTsKKwkJY29udGV4dC0+YndfY3R4LmRtbC52YmEuT0RNQ29tYmluZUVuYWJsZWRb
cGlwZV9pZHhdID0KKwkJCWNvbnRleHQtPmJ3X2N0eC5kbWwudmJhLk9ETUNvbWJpbmVFbmFibGVQ
ZXJTdGF0ZVt2bGV2ZWxdW3BpcGVfaWR4XTsKIAkJLyogQWRqdXN0IGRwcGNsayB3aGVuIHNwbGl0
IGlzIGZvcmNlZCwgZG8gbm90IGJvdGhlciB3aXRoIGRpc3BjbGsgKi8KIAkJaWYgKHNwbGl0W2ld
ICYmIGNvbnRleHQtPmJ3X2N0eC5kbWwudmJhLk5vT2ZEUFBbdmxldmVsXVtjb250ZXh0LT5id19j
dHguZG1sLnZiYS5tYXhNcGNDb21iXVtwaXBlX2lkeF0gPT0gMSkKIAkJCWNvbnRleHQtPmJ3X2N0
eC5kbWwudmJhLlJlcXVpcmVkRFBQQ0xLW3ZsZXZlbF1bY29udGV4dC0+YndfY3R4LmRtbC52YmEu
bWF4TXBjQ29tYl1bcGlwZV9pZHhdIC89IDI7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
