Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A21069D9C
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 652F789BC2;
	Mon, 15 Jul 2019 21:21:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780045.outbound.protection.outlook.com [40.107.78.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF16E89BBE
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D2ab4MrM2zuaTP7MvfWCKBDDR0Sn+TgkBu1IcqahwGw0SWHb96OL5IyVH/ylX9vR9FxcNp6O0aqUIqeQPWeEI7JRRaz6zb0CTgRgtU6WXj5WyfEtrtnjQzlxXI+5X6IO4rDbCrpdkAlkVWuiCVo0W5ZNTGkcyzsUPP11SOSwMnPyo2EYckF1mxxPoAECxjohxtxCGARTBDGSTKf6xE+vHNho/NPfRvip2b4y9xrAEc2QTjS84EHgqE1nTNWByLXQv4b9QAqg3ZPf+G9XtiN6GRKt3YgNeEcsolJFOlytZQthy5FlQsG1fhZrtxe1AgBQoVZBK1SRi19Qtz3P5bleQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsM2v5SW6AQvDG9iaho1GNHOdN5NI3zlh8cQRxe/4A8=;
 b=aKFfPieauZF3p1iIC9LqJ6w5lzGpVZFZs0nT73Bo7WVMKIllbO0pVC6TasgamVe1PK3/m0tJ3gX3ERGzqbXXB2xVvPaD/uRGiZl9Nr140Vg9Z39hYkXhEIqaUOf4BcBmtTYQV3C+v6+LBx48aBcy4PMv00rmhlW3OHoZ8/lxGCaSrPshXyF2gUpajn0SRNU2icJ+M6G061ZfZShow/39+dRDYyA/j52DLyVGYAWPjxZOgDEDTR4KmQ6cusntWiYtnhB9q7QpX64bNylOMtJdmD+s8zuTn8hJFPYe97PITLiqbgf8dahVE+IAhTztDgVmnW5/hiZpf2vp3IBAjEqCBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR12CA0041.namprd12.prod.outlook.com (2603:10b6:301:2::27)
 by BY5PR12MB3921.namprd12.prod.outlook.com (2603:10b6:a03:1a2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Mon, 15 Jul
 2019 21:21:16 +0000
Received: from CO1NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by MWHPR12CA0041.outlook.office365.com
 (2603:10b6:301:2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.14 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:16 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT009.mail.protection.outlook.com (10.152.80.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:16 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:06 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 09/87] drm/amd/display: No audio endpoint for Dell MST display
Date: Mon, 15 Jul 2019 17:19:31 -0400
Message-ID: <20190715212049.4584-10-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(136003)(346002)(39860400002)(396003)(376002)(2980300002)(428003)(199004)(189003)(2906002)(48376002)(5660300002)(6916009)(126002)(53936002)(49486002)(446003)(81166006)(50226002)(50466002)(70206006)(81156014)(4326008)(70586007)(11346002)(476003)(2616005)(2870700001)(426003)(47776003)(26005)(8936002)(8676002)(316002)(6666004)(356004)(186003)(14444005)(51416003)(2351001)(336012)(86362001)(305945005)(54906003)(1076003)(486006)(2876002)(76176011)(36756003)(478600001)(68736007)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB3921; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37f0c57c-583a-4fa7-65d6-08d7096a5f14
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BY5PR12MB3921; 
X-MS-TrafficTypeDiagnostic: BY5PR12MB3921:
X-Microsoft-Antispam-PRVS: <BY5PR12MB39219103BCD8366C49B0C1BD82CF0@BY5PR12MB3921.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 5a7hVzRw8S/pZVAyui818mefllUbuS4SZeZPg38Eorkro88V35m0HUm08NX4XeP8JFUVED2ZHwvkcCBjQNRidta55EbYUh5N7Ecmz6+0YG53zNW1gYXvrgjI1F7NYZDLAJD0ONSsh1xh/AfiP60+R1QM2Jy0rxTA5RFPP6dwAFeiq41dXGK28b0NS91ap86e95CfhvMxVQMsEKt4JlHQuJEkMGXFCXJG3cfDgC2YjCWPBqAluJXvSzaUBMlZJXXvsYGXflTmlJJXgiti4YJm5RrzhNE3ryC1E0EuyFmFW67iw7QmuICBw0pBzpxh3o+iKa7zd0oMFe6B94ygf+68FYi8atrmwmIs/0OfOFrmcokGexOmZoclKP8MZF0Vr/4Wsa1LpDKgEze5eEdlL+LIlDJmOuo7g5TR6TdOCNLVvKQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:16.0528 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37f0c57c-583a-4fa7-65d6-08d7096a5f14
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3921
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsM2v5SW6AQvDG9iaho1GNHOdN5NI3zlh8cQRxe/4A8=;
 b=YAvvstodomxxWexrZZktG9rIMgQ2ZHzsDN3Ed1YJElXipz2vIlHrdY0SjJz1EUbTwO4OVw5TPsSoe+Wvu+Im8SeppX8d2bAZvniaMIvf5N6swYOJ9K09UkuWlV7gflIMvzSdWGWIAAySY6n+GL3MK8ZU3lwlFlehWIjgPOaBnfU=
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
Cc: Leo Li <sunpeng.li@amd.com>, Harmanprit Tatla <harmanprit.tatla@amd.com>,
 Aric Cyr <aric.cyr@amd.com>, Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGFybWFucHJpdCBUYXRsYSA8aGFybWFucHJpdC50YXRsYUBhbWQuY29tPgoKW1doeV0K
VGhlcmUgYXJlIGNlcnRhaW4gTVNUIGRpc3BsYXlzIChpLmUuIERlbGwgUDI3MTVRKQp0aGF0IGFs
dGhvdWdoIGhhdmUgdGhlIE1TVCBmZWF0dXJlIHNldCB0byBvZmYgbWF5IHN0aWxsCnJlcG9ydCBp
dCBpcyBhIGJyYW5jaCBkZXZpY2UgYW5kIGEgbm9uLXplcm8KdmFsdWUgZm9yIGRvd25zdHJlYW0g
cG9ydCBwcmVzZW50LgpUaGlzIGNhbiBsZWFkIHRvIHVzIGluY29ycmVjdGx5IGNsYXNzaWZ5aW5n
IGEKZHAgZG9uZ2xlIGNvbm5lY3Rpb24gYXMgYmVpbmcgYWN0aXZlIGFuZApkaXNhYmxpbmcgdGhl
IGF1ZGlvIGVuZHBvaW50IGZvciB0aGUgZGlzcGxheS4KCltIb3ddCk1vZGlmaWVkIHRoZSBwbGFj
ZW1lbnQgYW5kCmNvbmRpdGlvbiB1c2VkIHRvIGFzc2lnbgp0aGUgaXNfYnJhbmNoX2RldiBiaXQu
CgpTaWduZWQtb2ZmLWJ5OiBIYXJtYW5wcml0IFRhdGxhIDxoYXJtYW5wcml0LnRhdGxhQGFtZC5j
b20+ClJldmlld2VkLWJ5OiBBcmljIEN5ciA8YXJpYy5jeXJAYW1kLmNvbT4KQWNrZWQtYnk6IEFu
dGhvbnkgS29vIDxBbnRob255Lktvb0BhbWQuY29tPgpBY2tlZC1ieTogTGVvIExpIDxzdW5wZW5n
LmxpQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNf
bGlua19kcC5jIHwgOSArKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY29yZS9kY19saW5rX2RwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29y
ZS9kY19saW5rX2RwLmMKaW5kZXggM2Y4YThmNjFjZDc2Li5mY2ExYmZjOTAxYjYgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZHAuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2RwLmMKQEAgLTIz
NjksMTEgKzIzNjksMTggQEAgc3RhdGljIHZvaWQgZ2V0X2FjdGl2ZV9jb252ZXJ0ZXJfaW5mbygK
IAkJbGluay0+ZHBjZF9jYXBzLmRvbmdsZV90eXBlID0gRElTUExBWV9ET05HTEVfTk9ORTsKIAkJ
ZGRjX3NlcnZpY2Vfc2V0X2RvbmdsZV90eXBlKGxpbmstPmRkYywKIAkJCQlsaW5rLT5kcGNkX2Nh
cHMuZG9uZ2xlX3R5cGUpOworCQlsaW5rLT5kcGNkX2NhcHMuaXNfYnJhbmNoX2RldiA9IGZhbHNl
OwogCQlyZXR1cm47CiAJfQogCiAJLyogRFBDRCAweDUgYml0IDAgPSAxLCBpdCBpbmRpY2F0ZSBp
dCdzIGJyYW5jaCBkZXZpY2UgKi8KLQlsaW5rLT5kcGNkX2NhcHMuaXNfYnJhbmNoX2RldiA9IGRz
X3BvcnQuZmllbGRzLlBPUlRfUFJFU0VOVDsKKwlpZiAoZHNfcG9ydC5maWVsZHMuUE9SVF9UWVBF
ID09IERPV05TVFJFQU1fRFApIHsKKwkJbGluay0+ZHBjZF9jYXBzLmlzX2JyYW5jaF9kZXYgPSBm
YWxzZTsKKwl9CisKKwllbHNlIHsKKwkJbGluay0+ZHBjZF9jYXBzLmlzX2JyYW5jaF9kZXYgPSBk
c19wb3J0LmZpZWxkcy5QT1JUX1BSRVNFTlQ7CisJfQogCiAJc3dpdGNoIChkc19wb3J0LmZpZWxk
cy5QT1JUX1RZUEUpIHsKIAljYXNlIERPV05TVFJFQU1fVkdBOgotLSAKMi4yMi4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
