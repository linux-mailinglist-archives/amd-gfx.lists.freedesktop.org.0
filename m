Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D481A22D
	for <lists+amd-gfx@lfdr.de>; Fri, 10 May 2019 19:20:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD5B89F35;
	Fri, 10 May 2019 17:20:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720046.outbound.protection.outlook.com [40.107.72.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A1D789F35
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 May 2019 17:20:15 +0000 (UTC)
Received: from DM3PR12CA0062.namprd12.prod.outlook.com (2603:10b6:0:56::30) by
 BYAPR12MB2661.namprd12.prod.outlook.com (2603:10b6:a03:69::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.15; Fri, 10 May 2019 17:20:14 +0000
Received: from CO1NAM03FT005.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::201) by DM3PR12CA0062.outlook.office365.com
 (2603:10b6:0:56::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.21 via Frontend
 Transport; Fri, 10 May 2019 17:20:13 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT005.mail.protection.outlook.com (10.152.80.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Fri, 10 May 2019 17:20:13 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Fri, 10 May 2019
 12:20:10 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 01/16] drm/amd/display: define v_total_min and max parameters
Date: Fri, 10 May 2019 13:19:20 -0400
Message-ID: <20190510171935.19792-2-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190510171935.19792-1-Bhawanpreet.Lakha@amd.com>
References: <20190510171935.19792-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(346002)(396003)(39860400002)(136003)(2980300002)(428003)(199004)(189003)(36756003)(86362001)(486006)(70586007)(336012)(70206006)(77096007)(2616005)(446003)(76176011)(476003)(7696005)(2351001)(11346002)(48376002)(126002)(186003)(26005)(50466002)(316002)(68736007)(81166006)(81156014)(51416003)(4326008)(8676002)(53936002)(426003)(305945005)(16586007)(53416004)(356004)(6666004)(47776003)(8936002)(2906002)(1076003)(50226002)(5660300002)(478600001)(6916009)(72206003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2661; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50e9e575-5b7b-47cc-0fdb-08d6d56bc35d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BYAPR12MB2661; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2661:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2661946B2D1509F142B5C515F90C0@BYAPR12MB2661.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-Forefront-PRVS: 0033AAD26D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: i5BWIitNCN0K0gzxIDjldoDU0muPOUV/iJqthOLTWKPcP80KvVA5OOYCg0FzkmpeEOluhX/e4mn8EHh1LFNujgrnsvvyb+axdbA1CLSUWxQdKSmJmyvbb8tL+dJ1Yd7nxiHN45q1iQQnrjtuBl/1UuvdSxYnYVYHDhbfzyLNiKSRuFA7L95IGzHjXUg9Lp6Rfv9iDpl24m188yH8ArVtTFCxIAPyKnN/XyaEpsUiH1E5C+Za+N0Rlo24wNBRrMD82cvOph6GXAcVUruWwXLrXSC+xu5lZuLE1TQ5zw2ompud7uRd6i/D8tZ5O76+QhgsvsvocUhCBy32tznZllHdhOmUzBP80Fv93vd270BAH2s1kHFi0OZ4JBhvko3l08HBD8wcoytyCN+GmuWUwjOc5zlyspTN6zPcWeDuM+aXqRo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2019 17:20:13.2294 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50e9e575-5b7b-47cc-0fdb-08d6d56bc35d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2661
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5rksaRHI0HlU06513lbwwjpANdYac8KHRxEVaOgJp4=;
 b=ybSEy8MbQ0m2lcw4yoVCDEELWx7nww5rV3oPuDbA5dj8d+yhFPAwdoDR3Nafq65v+il4gtdlyfboRzKypxAGnGFIbfY42EfULVffIwJEDPjiP6KuNelO2YYHy+vTtQDBaYOgRx3SMGI5WTk3nUUr0odPgIJjOAyEi6aRdGa08P4=
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
Cc: Charlene Liu <charlene.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ2hhcmxlbmUgTGl1IDxjaGFybGVuZS5saXVAYW1kLmNvbT4KCmFkZCB0aGVzZSBwYXJh
bWV0ZXJzIGZvciBmdXR1cmUgdXNlCgpTaWduZWQtb2ZmLWJ5OiBDaGFybGVuZSBMaXUgPGNoYXJs
ZW5lLmxpdUBhbWQuY29tPgpSZXZpZXdlZC1ieTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8u
TGFrdHl1c2hraW5AYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5w
cmVldC5MYWtoYUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
bWwvZGlzcGxheV9tb2RlX3N0cnVjdHMuaCB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZG1sL2Rpc3BsYXlfbW9kZV9zdHJ1Y3RzLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZG1sL2Rpc3BsYXlfbW9kZV9zdHJ1Y3RzLmgKaW5kZXggYzViNzkxZDE1OGE3Li42Y2M1OWYx
MzgwOTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwvZGlz
cGxheV9tb2RlX3N0cnVjdHMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZG1sL2Rpc3BsYXlfbW9kZV9zdHJ1Y3RzLmgKQEAgLTIxOSw2ICsyMTksOSBAQCBzdHJ1Y3QgX3Zj
c19kcGlfZGlzcGxheV9waXBlX3NvdXJjZV9wYXJhbXNfc3QgewogCXVuc2lnbmVkIGNoYXIgeGZj
X2VuYWJsZTsKIAl1bnNpZ25lZCBjaGFyIHhmY19zbGF2ZTsKIAlzdHJ1Y3QgX3Zjc19kcGlfZGlz
cGxheV94ZmNfcGFyYW1zX3N0IHhmY19wYXJhbXM7CisJLy9mb3IgdnN0YXJ0dXBsaW5lcyBjYWxj
dWxhdGlvbiBmcmVlc3luYworCXVuc2lnbmVkIGNoYXIgdl90b3RhbF9taW47CisJdW5zaWduZWQg
Y2hhciB2X3RvdGFsX21heDsKIH07CiBzdHJ1Y3Qgd3JpdGViYWNrX3N0IHsKIAlpbnQgd2Jfc3Jj
X2hlaWdodDsKQEAgLTI4OSw2ICsyOTIsOCBAQCBzdHJ1Y3QgX3Zjc19kcGlfZGlzcGxheV9waXBl
X2Rlc3RfcGFyYW1zX3N0IHsKIAl1bnNpZ25lZCBjaGFyIG90Z19pbnN0OwogCXVuc2lnbmVkIGNo
YXIgb2RtX2NvbWJpbmU7CiAJdW5zaWduZWQgY2hhciB1c2VfbWF4aW11bV92c3RhcnR1cDsKKwl1
bnNpZ25lZCBpbnQgdnRvdGFsX21heDsKKwl1bnNpZ25lZCBpbnQgdnRvdGFsX21pbjsKIH07CiAK
IHN0cnVjdCBfdmNzX2RwaV9kaXNwbGF5X3BpcGVfcGFyYW1zX3N0IHsKLS0gCjIuMTcuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
