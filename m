Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9905FB76
	for <lists+amd-gfx@lfdr.de>; Thu,  4 Jul 2019 18:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA5C16E36F;
	Thu,  4 Jul 2019 16:06:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700065.outbound.protection.outlook.com [40.107.70.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331146E372
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Jul 2019 16:06:17 +0000 (UTC)
Received: from SN1PR12CA0065.namprd12.prod.outlook.com (2603:10b6:802:20::36)
 by BN8PR12MB2849.namprd12.prod.outlook.com (2603:10b6:408:9a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.18; Thu, 4 Jul
 2019 16:06:15 +0000
Received: from BY2NAM03FT052.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by SN1PR12CA0065.outlook.office365.com
 (2603:10b6:802:20::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.18 via Frontend
 Transport; Thu, 4 Jul 2019 16:06:15 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT052.mail.protection.outlook.com (10.152.85.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 4 Jul 2019 16:06:14 +0000
Received: from navi10-uefi.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server (TLS) id 14.3.389.1; Thu, 4 Jul
 2019 11:05:57 -0500
From: <boyuan.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 08/17] drm/amdgpu: add function to start jpeg enc block
Date: Thu, 4 Jul 2019 12:04:20 -0400
Message-ID: <20190704160429.14758-8-boyuan.zhang@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190704160429.14758-1-boyuan.zhang@amd.com>
References: <20190704160429.14758-1-boyuan.zhang@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(396003)(136003)(376002)(2980300002)(428003)(199004)(189003)(4326008)(6916009)(36756003)(2906002)(336012)(1076003)(126002)(476003)(8936002)(47776003)(7696005)(51416003)(6666004)(356004)(2616005)(7736002)(478600001)(186003)(305945005)(72206003)(70586007)(70206006)(16586007)(50466002)(48376002)(77096007)(26005)(316002)(16526019)(2876002)(426003)(2351001)(11346002)(50226002)(86362001)(3846002)(6116002)(81156014)(81166006)(8676002)(53416004)(76176011)(486006)(5660300002)(446003)(68736007)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB2849; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58d9083b-aa26-404f-0a7a-08d700998a7b
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN8PR12MB2849; 
X-MS-TrafficTypeDiagnostic: BN8PR12MB2849:
X-Microsoft-Antispam-PRVS: <BN8PR12MB28491C42228F52D08252386A87FA0@BN8PR12MB2849.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-Forefront-PRVS: 0088C92887
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: fcxzFh045fPlZjtnMWRQwJgdVwSHoI09KUz/btLxUnw95ec1HCEHVMlMWDJTIlLLMEv5VLN00VUB4LOFwtG6FOl2TtLM2j89p7RMRx4TBl4ZqCKEhBlnfoDSuHb4fX1AVhknSHKCH9uuoE4n7SgHloudvuPBbteoFXBebpQ0ewlAG+sYyUDwM6NSOwm10hZOA4mMape/L04eE3Ao3y9tsVpjHyfY/S611Z5WXTftuKI7D5gvNOCMfknT2c+htCwYHYnwSIpL818qVhCFhytcpHZgBZ0TSpdIPpDathwoarAMojgLV2GfpUezlVdeBU800WVWaVMROSBPwHkU4+6fHmyqe2LathCdagiO2QH5H8aSAsHvQIIGFtSB/ZFI/e5/hEj21OjcRuHxXutlydajDFM7sTRG8kjEZ6QwUSyaMEo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2019 16:06:14.7936 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58d9083b-aa26-404f-0a7a-08d700998a7b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2849
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R81p7rO98R9P6Xak7xPxOxW0kz2jdcpYR9xXTGBJBW4=;
 b=WOZUzUP1KmaSeDQePR3hJjUI8vYs3JDMA/0CVpnFBXj/3xErAP6QQqJdRMLbRbBIDKtfXZJY5qGaXhYH8R/e3D8hCAlSUfw/9nQv/vKfIOiV282Ub4P6MwuyhXfHEqQx2lKHT8uUkEkb/8B9O3hR7zvjWDJPLac1VqQh+nrOeVE=
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

RnJvbTogQm95dWFuIFpoYW5nIDxib3l1YW4uemhhbmdAYW1kLmNvbT4KClN0YXJ0IGpwZWcgZW5j
b2RlIGJsb2NrLCBzZXQgc3lzdGVtIGludGVycnVwdCwgYW5kIGluaXRpYWxpemUgcmVnaXN0ZXJz
LgoKU2lnbmVkLW9mZi1ieTogQm95dWFuIFpoYW5nIDxib3l1YW4uemhhbmdAYW1kLmNvbT4KUmV2
aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jIHwgMzMgKysrKysrKysrKysrKysr
KysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jCmluZGV4IGNiNzc1NTRjYzY5Mi4uOGUyNWY4MzMzM2Yx
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmMKQEAgLTYxMiw2ICs2MTIsMzcg
QEAgc3RhdGljIGludCBqcGVnX3YyXzBfc3RhcnQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
CiAJcmV0dXJuIDA7CiB9CiAKKy8qKgorICoganBlZ19lbmNfdjJfMF9zdGFydCAtIHN0YXJ0IEpQ
RUcgRU5DIGJsb2NrCisgKgorICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgorICoKKyAq
IFNldHVwIGFuZCBzdGFydCB0aGUgSlBFRyBFTkMgYmxvY2sKKyAqLworc3RhdGljIGludCBqcGVn
X2VuY192Ml8wX3N0YXJ0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQoreworCXN0cnVjdCBh
bWRncHVfcmluZyAqcmluZyA9ICZhZGV2LT52Y24ucmluZ19qcGVnX2VuYzsKKworCS8qIGVuYWJs
ZSBTeXN0ZW0gSW50ZXJydXB0IGZvciBKUkJDIEVOQyAqLworCVdSRUczMl9QKFNPQzE1X1JFR19P
RkZTRVQoVkNOLCAwLCBtbUpQRUdfU1lTX0lOVF9FTiksCisJCUpQRUdfU1lTX0lOVF9FTl9fRUpS
QkNfTUFTSywKKwkJfkpQRUdfU1lTX0lOVF9FTl9fRUpSQkNfTUFTSyk7CisKKwlXUkVHMzJfU09D
MTUoVVZELCAwLCBtbVVWRF9KTUlfRU5DX0pSQkNfUkJfVk1JRCwgMCk7CisJV1JFRzMyX1NPQzE1
KFVWRCwgMCwgbW1VVkRfSlJCQ19FTkNfUkJfQ05UTCwgKDB4MDAwMDAwMDFMIHwgMHgwMDAwMDAw
MkwpKTsKKwlXUkVHMzJfU09DMTUoVVZELCAwLCBtbVVWRF9MTUlfRUpSQkNfUkJfNjRCSVRfQkFS
X0xPVywKKwkJbG93ZXJfMzJfYml0cyhyaW5nLT5ncHVfYWRkcikpOworCVdSRUczMl9TT0MxNShV
VkQsIDAsIG1tVVZEX0xNSV9FSlJCQ19SQl82NEJJVF9CQVJfSElHSCwKKwkJdXBwZXJfMzJfYml0
cyhyaW5nLT5ncHVfYWRkcikpOworCVdSRUczMl9TT0MxNShVVkQsIDAsIG1tVVZEX0pSQkNfRU5D
X1JCX1JQVFIsIDApOworCVdSRUczMl9TT0MxNShVVkQsIDAsIG1tVVZEX0pSQkNfRU5DX1JCX1dQ
VFIsIDApOworCVdSRUczMl9TT0MxNShVVkQsIDAsIG1tVVZEX0pSQkNfRU5DX1JCX0NOVEwsIDB4
MDAwMDAwMDJMKTsKKwlXUkVHMzJfU09DMTUoVVZELCAwLCBtbVVWRF9KUkJDX0VOQ19SQl9TSVpF
LCByaW5nLT5yaW5nX3NpemUgLyA0KTsKKwlyaW5nLT53cHRyID0gUlJFRzMyX1NPQzE1KFVWRCwg
MCwgbW1VVkRfSlJCQ19FTkNfUkJfV1BUUik7CisKKwlyZXR1cm4gMDsKK30KKwogLyoqCiAgKiBq
cGVnX3YyXzBfc3RvcCAtIHN0b3AgSlBFRyBibG9jawogICoKQEAgLTk3NSw2ICsxMDA2LDggQEAg
c3RhdGljIGludCB2Y25fdjJfMF9zdGFydChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAog
CXIgPSBqcGVnX3YyXzBfc3RhcnQoYWRldik7CiAKKwlyID0ganBlZ19lbmNfdjJfMF9zdGFydChh
ZGV2KTsKKwogCXJldHVybiByOwogfQogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
