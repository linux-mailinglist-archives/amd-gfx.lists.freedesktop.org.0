Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABCEA0C06
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 23:04:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E067589F2A;
	Wed, 28 Aug 2019 21:04:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800087.outbound.protection.outlook.com [40.107.80.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9AFB89F19
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 21:04:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QNbmh0qRVAGdJZfRNLIW7ogwqxOmPMBRFS+oktnJNJO5X1gPIhNz1Mtfh4GWL/b3weNi5eyTKFSQQY5npyFfG9zSSJQqNgHMbQX5hdQK9bq6i+6f/oGSpiqZYRLzREMVzYVdXU9PXtUZFx69sOJgN14ZmV81kuh6up8qrLG68RhzVdUE9QVBlbU1oI/mlrTOwxq6cj5urncFeZqXzDqW3Hf5koyjz85zp92h68hDyE52RjY6AcXO3pkP2pjDcvXIFUG2INdrwsPx4LwS0J6ho2+mJXUU2L1ztWrJiT0KlfLE+99qAdPKWZs38GxoQBktkkQDSDfR+yxJU3FfOmkg0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzxk+XGly5n64jBxYMog9KbwC7tFtvExWh0g7qDwaic=;
 b=Y/UIsGLPtfH6OcjLNrdTyezNGgL3XkJzMdXyXz9QYRNs+BYIFXffShz9ORwZXWEmAnvk1AJa/S0VPAELwqTovulc754iH4M0FkSNGi21rHRrxYvLlQQT4NcYkA4dvwq0b6OHQH5HnlaY4NB2SptL/JqTRsHCmnwHUXRyMRKUbq+f6ltDSgZyhChethhlKvJ2P+Eie/kvvI8X1gRPKLSyt2yefgc+ZDdGSc7IJmKp1RU/hJpX6iUuxWI/vE+06kMk8aNtj+JQjipkee1Jjz5vZcJGSdKEpLLXjJiLSE3jymXKABWSOfMdF01Ilhfn7wgYot2z8qe9B2KKoNvvGKm+dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0052.namprd12.prod.outlook.com (2603:10b6:0:56::20) by
 BYAPR12MB2710.namprd12.prod.outlook.com (2603:10b6:a03:68::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Wed, 28 Aug 2019 21:04:08 +0000
Received: from BY2NAM03FT004.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::204) by DM3PR12CA0052.outlook.office365.com
 (2603:10b6:0:56::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Wed, 28 Aug 2019 21:04:08 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT004.mail.protection.outlook.com (10.152.84.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Wed, 28 Aug 2019 21:04:08 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 28 Aug 2019
 16:04:03 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 05/17] drm/amd/display: Add back support for DSC 4:2:2 Simple
Date: Wed, 28 Aug 2019 17:03:42 -0400
Message-ID: <20190828210354.21464-6-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828210354.21464-1-Bhawanpreet.Lakha@amd.com>
References: <20190828210354.21464-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(346002)(396003)(2980300002)(428003)(199004)(189003)(6666004)(81166006)(426003)(11346002)(446003)(186003)(126002)(16586007)(26005)(476003)(76176011)(7696005)(51416003)(316002)(336012)(6916009)(486006)(4326008)(48376002)(53936002)(86362001)(2616005)(50466002)(14444005)(356004)(53416004)(47776003)(305945005)(2906002)(81156014)(5660300002)(50226002)(8676002)(8936002)(478600001)(36756003)(70206006)(70586007)(2351001)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2710; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6803c84a-43e7-47aa-4a87-08d72bfb44aa
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BYAPR12MB2710; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2710:
X-Microsoft-Antispam-PRVS: <BYAPR12MB271021C0CA9778507797CA60F9A30@BYAPR12MB2710.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:669;
X-Forefront-PRVS: 014304E855
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: zsQKrw99HuPYfqPmUc0XUO45TY3eyTfnxtiQyzTtmyubjV5KSZfJwHLgg+pzXlH6kZEYQHkg55EheYlUmjLMMh+/5WYlF8C18YJGk4m4+OPL2s/IpNVqpJa2/O3kJRhfJFYBuCDwzgIcg3rytkwoTL1Is4wgF6CAjmI2AaZC9K406XMuxDedRrEeQRSXj7AgzyDC89uVI1DIwiSyqGbP0XaDSc703ViFLmth/qewZ5cM2bwACAJsoSliUjjilWLeFf4J1+zowHvIBrLv5svQP7NaDS2WHQZqE1LgKrmSPLvDXTwZ+3ihDNAdgqkK/tyWsJKVNkns+2ksVOcJLc/Dz69pPADmuPAfhJTcDTlNzVkOciRlrCSrf+eCHNgrsBVYaPeIwOV3RF7zOqEkN9MLKU7Sw3/boBNiRF3P0cWiwtQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2019 21:04:08.3339 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6803c84a-43e7-47aa-4a87-08d72bfb44aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2710
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzxk+XGly5n64jBxYMog9KbwC7tFtvExWh0g7qDwaic=;
 b=KRhEbl5thV+6bsm9qqAAsHVu9YiIPOusxmhFiQeMq7IgVVP9C5YWP48d2urxeRi6qs/RvYRL5rXCXgivz0LbBKyQbbC7O5oLUeaO8NEM2f1dG6QImwlp0nv2KT0YxA1oeaF2LYyQ+tu9mGsCwmHexNMc5ZP6ADbnE641jPDLOpU=
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
Cc: Nikola Cornij <nikola.cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTmlrb2xhIENvcm5paiA8bmlrb2xhLmNvcm5pakBhbWQuY29tPgoKW3doeV0KVGhlIHJl
cXVpcmVtZW50IGhhcyBiZWVuIGNsYXJpZmllZCBhbmQgb25seSBEU0MgNDoyOjIgTmF0aXZlIGhh
cyB0bwpiZSBkaXNhYmxlZC4KClNpZ25lZC1vZmYtYnk6IE5pa29sYSBDb3JuaWogPG5pa29sYS5j
b3JuaWpAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IFdlbmppbmcgTGl1IDxXZW5qaW5nLkxpdUBhbWQu
Y29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2RzYy5j
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2Rz
Yy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2RzYy5jCmlu
ZGV4IDFiNDE5NDA3YWY5NC4uNjNlYjM3N2VkOWMwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfZHNjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2RzYy5jCkBAIC0xMTgsNyArMTE4LDcgQEAgc3Rh
dGljIHZvaWQgZHNjMl9nZXRfZW5jX2NhcHMoc3RydWN0IGRzY19lbmNfY2FwcyAqZHNjX2VuY19j
YXBzLCBpbnQgcGl4ZWxfY2xvY2sKIAogCWRzY19lbmNfY2Fwcy0+Y29sb3JfZm9ybWF0cy5iaXRz
LlJHQiA9IDE7CiAJZHNjX2VuY19jYXBzLT5jb2xvcl9mb3JtYXRzLmJpdHMuWUNCQ1JfNDQ0ID0g
MTsKLQlkc2NfZW5jX2NhcHMtPmNvbG9yX2Zvcm1hdHMuYml0cy5ZQ0JDUl9TSU1QTEVfNDIyID0g
MDsKKwlkc2NfZW5jX2NhcHMtPmNvbG9yX2Zvcm1hdHMuYml0cy5ZQ0JDUl9TSU1QTEVfNDIyID0g
MTsKIAlkc2NfZW5jX2NhcHMtPmNvbG9yX2Zvcm1hdHMuYml0cy5ZQ0JDUl9OQVRJVkVfNDIyID0g
MDsKIAlkc2NfZW5jX2NhcHMtPmNvbG9yX2Zvcm1hdHMuYml0cy5ZQ0JDUl9OQVRJVkVfNDIwID0g
MTsKIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
