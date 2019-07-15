Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CB569D95
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B83FB89B98;
	Mon, 15 Jul 2019 21:21:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710045.outbound.protection.outlook.com [40.107.71.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 072F389B9A
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lSpAusqEgGjPyDS/fNGJjqmRfvLZTHrO6lN854R9tElJ4eD5rVsJ10BMdiMMMSJxT5xqnWBt+EmiXLOJNULFPgJeNBTeTmbA65DXWAVO6eNG2VxNQvjI7O2aAuKg+6eANBuWGvcCQyhYXzMlIkRocPDYtIRu4qkYAR1ljf0wqhKlgvflUcYBLSK3SA7UgJ/HDFE8wC2ja9TFwIsIVkIYdodSoro+LfVpJYf9nlpsK1fMrowpZKEN/WNu+lWocQiZCm7E8/+igmxXOu+JxaqOShSZhFYw7pzlB/HI7ryKnKtxafhvIpapBU/l6ztwzGZUETS1NJ9bNtsRFx8CnV4Gfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/SoeoaZedkjKdrUCpm+53IWRcrQ77Wn/87LDtDC9O8=;
 b=bLVWGQwRlujFFNAPykUp2uKO3Nc2VHCHfn/l2Ak9rY46/AOawtk7ynuE/Wu/RJvNrKpTVWwrutv5K9ANoaBIkYc9f2JUcTd/4UVppe2rAxNFn8ZCSZUIQK5KxhdEHoI9Ysoqr1313H0u8MAXzE4U7nrhx+hkPpmqxjXX6A7JKHWZK1inKxbCDYU/m8du9eKZ6YiXVqCaZrXscgsM5YnKXToY9oTcIHHa9FW5+25yeo30QHMIhbxY4VkIonPaq3vt094gJesdh7ZSsaBMSNXbIymYkX+AoJNajr0NdpMygEEXwgN0BXO9YPDeVRSro+buALV9Hvq5PrU8SpMn72/q2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR12CA0041.namprd12.prod.outlook.com (2603:10b6:301:2::27)
 by BN8PR12MB3090.namprd12.prod.outlook.com (2603:10b6:408:67::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Mon, 15 Jul
 2019 21:21:10 +0000
Received: from CO1NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by MWHPR12CA0041.outlook.office365.com
 (2603:10b6:301:2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.14 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:09 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT009.mail.protection.outlook.com (10.152.80.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:09 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:03 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 04/87] drm/amd/display: fix up HUBBUB hw programming for VM
Date: Mon, 15 Jul 2019 17:19:26 -0400
Message-ID: <20190715212049.4584-5-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(396003)(136003)(2980300002)(428003)(189003)(199004)(426003)(478600001)(2876002)(47776003)(336012)(36756003)(5660300002)(316002)(50466002)(53936002)(2906002)(186003)(48376002)(49486002)(4326008)(2870700001)(68736007)(486006)(305945005)(26005)(1076003)(54906003)(2351001)(2616005)(6916009)(51416003)(86362001)(81156014)(81166006)(50226002)(126002)(8936002)(476003)(11346002)(446003)(8676002)(70586007)(76176011)(356004)(70206006)(6666004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3090; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3fa4ef5-f515-4e2f-598f-08d7096a5b3d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN8PR12MB3090; 
X-MS-TrafficTypeDiagnostic: BN8PR12MB3090:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3090C97AF2D40787C464396A82CF0@BN8PR12MB3090.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 7rzw5CPeuepO00mOu2HJcF7wpBRG8Pza8SMB1w4P1xjtGtCAEPkj+vAm4TZbClLm6oqOO68nk1M7CcpDoE98uaniXdbisPDRu9TZirLdDPUhK+JXESKrDQ3pMCQEfgTztu1FiYXbZjij8MMciaejgVO40af0drs3y19KP6oAO1DC/DyHKdDFH+s1swe6HUUkLNgo34cGn1pn+42Vkt9MkA1PqsgT0URBKWIO5t+UwGmxuldt7HR06IsjIzMIA+WkzrJ63bwPr8/vklC3kPYwPV704QZ/M9C37uw4q4vANbuYxKnx6z9NZCRafkVQbFevqFj0WkJmLDy+WvvyxmxiiqjIiW7ghSPJVngMQYdxmjOxdDNcg6C9cngqsjaUifVCUI8Nuc2swPhWEhNq55kg0FP9pmsOJo3sx7ChohMELnc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:09.6153 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3fa4ef5-f515-4e2f-598f-08d7096a5b3d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3090
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/SoeoaZedkjKdrUCpm+53IWRcrQ77Wn/87LDtDC9O8=;
 b=V7OUF2sJdE/dWHRzTmUyATjsEavPP1/ZC0Dotrh8nyKn9Ds9i0taiMxOhfmxbyaXDaIc/Olk+EJekMb/3mVlW4K9NsULjZPMkrNah4uVt0PeVHjCnIF4BG57Tww/lrsY7EhXEYvS4fzKZq3XbYreo8kE1a1aUqgJdzoJhUYtJp8=
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
Cc: Leo Li <sunpeng.li@amd.com>, Jun Lei <jun.lei@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSnVuIExlaSA8anVuLmxlaUBhbWQuY29tPgoKW3doeV0KU29tZSB2YWx1ZXMgd2VyZSBu
b3QgYmVpbmcgY29udmVydGVkIG9yIGJpdC1zaGlmdGVkIHByb3Blcmx5IGZvcgpIVyByZWdpc3Rl
cnMsIGNhdXNpbmcgYmxhY2sgc2NyZWVuCgpbaG93XQpGaXggdXAgdGhlIHZhbHVlcyBiZWZvcmUg
cHJvZ3JhbW1pbmcgSFcKClNpZ25lZC1vZmYtYnk6IEp1biBMZWkgPGp1bi5sZWlAYW1kLmNvbT4K
UmV2aWV3ZWQtYnk6IEFudGhvbnkgS29vIDxBbnRob255Lktvb0BhbWQuY29tPgpBY2tlZC1ieTog
TGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNuMjAvZGNuMjBfaHViYnViLmMgfCAxNyArKysrKysrKy0tLS0tLS0tLQogLi4uL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L2RjaHViYnViLmggICAgfCAgNCArKy0tCiAyIGZpbGVz
IGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9odWJidWIuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9odWJidWIuYwppbmRleCBl
Y2U2ZTEzNjQzN2IuLmM3MmE5ZmY1N2YxNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h1YmJ1Yi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9odWJidWIuYwpAQCAtMzY2LDI1ICszNjYsMjQgQEAg
aW50IGh1YmJ1YjJfaW5pdF9kY2h1Yl9zeXNfY3R4KHN0cnVjdCBodWJidWIgKmh1YmJ1YiwKIAlz
dHJ1Y3QgZGNuX3ZtaWRfcGFnZV90YWJsZV9jb25maWcgcGh5c19jb25maWc7CiAKIAlSRUdfU0VU
KERDTl9WTV9GQl9MT0NBVElPTl9CQVNFLCAwLAotCQkJRkJfQkFTRSwgcGFfY29uZmlnLT5zeXN0
ZW1fYXBlcnR1cmUuZmJfYmFzZSk7CisJCQlGQl9CQVNFLCBwYV9jb25maWctPnN5c3RlbV9hcGVy
dHVyZS5mYl9iYXNlID4+IDI0KTsKIAlSRUdfU0VUKERDTl9WTV9GQl9MT0NBVElPTl9UT1AsIDAs
Ci0JCQlGQl9UT1AsIHBhX2NvbmZpZy0+c3lzdGVtX2FwZXJ0dXJlLmZiX3RvcCk7CisJCQlGQl9U
T1AsIHBhX2NvbmZpZy0+c3lzdGVtX2FwZXJ0dXJlLmZiX3RvcCA+PiAyNCk7CiAJUkVHX1NFVChE
Q05fVk1fRkJfT0ZGU0VULCAwLAotCQkJRkJfT0ZGU0VULCBwYV9jb25maWctPnN5c3RlbV9hcGVy
dHVyZS5mYl9vZmZzZXQpOworCQkJRkJfT0ZGU0VULCBwYV9jb25maWctPnN5c3RlbV9hcGVydHVy
ZS5mYl9vZmZzZXQgPj4gMjQpOwogCVJFR19TRVQoRENOX1ZNX0FHUF9CT1QsIDAsCi0JCQlBR1Bf
Qk9ULCBwYV9jb25maWctPnN5c3RlbV9hcGVydHVyZS5hZ3BfYm90KTsKKwkJCUFHUF9CT1QsIHBh
X2NvbmZpZy0+c3lzdGVtX2FwZXJ0dXJlLmFncF9ib3QgPj4gMjQpOwogCVJFR19TRVQoRENOX1ZN
X0FHUF9UT1AsIDAsCi0JCQlBR1BfVE9QLCBwYV9jb25maWctPnN5c3RlbV9hcGVydHVyZS5hZ3Bf
dG9wKTsKKwkJCUFHUF9UT1AsIHBhX2NvbmZpZy0+c3lzdGVtX2FwZXJ0dXJlLmFncF90b3AgPj4g
MjQpOwogCVJFR19TRVQoRENOX1ZNX0FHUF9CQVNFLCAwLAotCQkJQUdQX0JBU0UsIHBhX2NvbmZp
Zy0+c3lzdGVtX2FwZXJ0dXJlLmFncF9iYXNlKTsKKwkJCUFHUF9CQVNFLCBwYV9jb25maWctPnN5
c3RlbV9hcGVydHVyZS5hZ3BfYmFzZSA+PiAyNCk7CiAKIAlpZiAocGFfY29uZmlnLT5nYXJ0X2Nv
bmZpZy5wYWdlX3RhYmxlX3N0YXJ0X2FkZHIgIT0gcGFfY29uZmlnLT5nYXJ0X2NvbmZpZy5wYWdl
X3RhYmxlX2VuZF9hZGRyKSB7Ci0JCXBoeXNfY29uZmlnLmRlcHRoID0gMTsKLQkJcGh5c19jb25m
aWcuYmxvY2tfc2l6ZSA9IDQwOTY7CiAJCXBoeXNfY29uZmlnLnBhZ2VfdGFibGVfc3RhcnRfYWRk
ciA9IHBhX2NvbmZpZy0+Z2FydF9jb25maWcucGFnZV90YWJsZV9zdGFydF9hZGRyID4+IDEyOwog
CQlwaHlzX2NvbmZpZy5wYWdlX3RhYmxlX2VuZF9hZGRyID0gcGFfY29uZmlnLT5nYXJ0X2NvbmZp
Zy5wYWdlX3RhYmxlX2VuZF9hZGRyID4+IDEyOwogCQlwaHlzX2NvbmZpZy5wYWdlX3RhYmxlX2Jh
c2VfYWRkciA9IHBhX2NvbmZpZy0+Z2FydF9jb25maWcucGFnZV90YWJsZV9iYXNlX2FkZHI7Ci0K
KwkJcGh5c19jb25maWcuZGVwdGggPSAwOworCQlwaHlzX2NvbmZpZy5ibG9ja19zaXplID0gMDsK
IAkJLy8gSW5pdCBWTUlEIDAgYmFzZWQgb24gUEEgY29uZmlnCiAJCWRjbjIwX3ZtaWRfc2V0dXAo
Jmh1YmJ1YjEtPnZtaWRbMF0sICZwaHlzX2NvbmZpZyk7CiAJfQpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9ody9kY2h1YmJ1Yi5oIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9ody9kY2h1YmJ1Yi5oCmluZGV4IDk1OWY1YjY1NDYxMS4u
MWVhNTA1ZjdhMDVhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
aW5jL2h3L2RjaHViYnViLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2lu
Yy9ody9kY2h1YmJ1Yi5oCkBAIC02MSw4ICs2MSw4IEBAIGVudW0gZGNuX2h1YmJ1Yl9wYWdlX3Rh
YmxlX2RlcHRoIHsKIH07CiAKIGVudW0gZGNuX2h1YmJ1Yl9wYWdlX3RhYmxlX2Jsb2NrX3NpemUg
ewotCURDTl9QQUdFX1RBQkxFX0JMT0NLX1NJWkVfNEtCLAotCURDTl9QQUdFX1RBQkxFX0JMT0NL
X1NJWkVfNjRLQgorCURDTl9QQUdFX1RBQkxFX0JMT0NLX1NJWkVfNEtCID0gMCwKKwlEQ05fUEFH
RV9UQUJMRV9CTE9DS19TSVpFXzY0S0IgPSA0CiB9OwogCiBzdHJ1Y3QgZGNuX2h1YmJ1Yl9waHlz
X2FkZHJfY29uZmlnIHsKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
