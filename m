Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D21106F7D4
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jul 2019 05:16:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64539899EA;
	Mon, 22 Jul 2019 03:16:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810057.outbound.protection.outlook.com [40.107.81.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48318899D4
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jul 2019 03:16:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M7ysaG117EfXIdKt1l0vliPx5qVaYAcpDoF1zlpdt7V+iVwLOuSzA+t4HBwHMayvrfkYwrM1wVWRxL5dsGFILWJvYxhH9SJGGlkbCzlptQ/uMalmCzv3znvbIVNOPX7fsMtEk/7a1Kw1u6xBjC5zsJ8SG8NOA7avLPfCPgHeeVJGGkmo0Z7OGqVXANuD7Jc6sX6Jc5hFVfsbE93VjWBZbnukTfPkMrVEWlVwqWN3Bjx3dKqmL18Cljm1fmwJvVVOUHRd+6IF1EvLj1FKBkhsL3LB1uvSbD4VKvQJxgmImAoYN5mUj0Z8+YG5nUFzWSAks1QnTgx8zAOOL2LEMHnfUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SgkZAv3T5h6TpvX/uJI/f673b34JuHk7kmi24x+l8IM=;
 b=G3sEN8EDq1e1vaqncC0ry1qTU0sNHQK1aSxR70RudiPAkzrb35FCpAxXg/CIlPV/M6aVcZLwa7jsgBe0lajDhbovjwkJNNPX5b9W67DkFNG1G65Sar554xQUrK4nBmX7tizEMIZVtelwEk4Xrw9mCO2vGcjhVuvpKuB1dpFFZLJS/a1dt2TM38plOiSlIhnTppoAPRQjH5ubOz9xCwFXanAE9QleWqMIuxZ8ZfDa1WGH4t03WSFF4UP6X/RtrZg6xeTHuAp2O3336V1Ch1nR/0rnKd2ZGO7i5o54DpUISMj1SuToMjaJpv+BpdDzPy+1bfdPWnp3LM0xZ5c7kk9EjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from BN4PR12CA0005.namprd12.prod.outlook.com (2603:10b6:403:2::15)
 by DM5PR12MB1580.namprd12.prod.outlook.com (2603:10b6:4:10::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16; Mon, 22 Jul
 2019 03:16:13 +0000
Received: from DM3NAM03FT061.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::206) by BN4PR12CA0005.outlook.office365.com
 (2603:10b6:403:2::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16 via Frontend
 Transport; Mon, 22 Jul 2019 03:16:12 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT061.mail.protection.outlook.com (10.152.83.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 22 Jul 2019 03:16:11 +0000
Received: from equan-buildpc.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Sun, 21 Jul 2019
 22:16:05 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 5/5] drm/amd/powerplay: correct UVD/VCE/VCN power status
 retrieval
Date: Mon, 22 Jul 2019 11:15:31 +0800
Message-ID: <20190722031531.23437-6-evan.quan@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190722031531.23437-1-evan.quan@amd.com>
References: <20190722031531.23437-1-evan.quan@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(136003)(396003)(346002)(39860400002)(376002)(2980300002)(428003)(189003)(199004)(186003)(305945005)(36756003)(1076003)(53936002)(48376002)(51416003)(7696005)(8676002)(53416004)(356004)(6666004)(478600001)(26005)(6916009)(76176011)(4326008)(50466002)(446003)(336012)(8936002)(2351001)(2906002)(2870700001)(70206006)(50226002)(476003)(2616005)(44832011)(47776003)(86362001)(11346002)(126002)(81166006)(81156014)(316002)(486006)(5660300002)(70586007)(68736007)(426003)(14444005)(54906003)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1580; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1fa69254-5078-4707-8db3-08d70e52f2ec
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1580; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1580:
X-Microsoft-Antispam-PRVS: <DM5PR12MB15807365C01C4DC145C5BB69E4C40@DM5PR12MB1580.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:192;
X-Forefront-PRVS: 01068D0A20
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Za3+Ij1OE/usQNLyyEuTcCuppST4W9+XNggdx22In15Apj2iKpeip7g4ZhFFNWOSxYEaOBIgdkWJ93oUeDCi+/wFMDcM6POPHVSm8Q5WocT2x/Z7rng5OGVDCyelrGYGGUAfNeV6MJAtxJSiJAIGelHBdK/RJJCdM+6WLPrF3VWP2YAmcLJz3SsmFvpvjZor6k2oV5qrkhFlPNeV7ej7pXi2AzRHWyfcbFUQXw7yqcmQYKGQHYh70z1Mcr+M/YqEnz1Npq/3tv+fpvyOiXLsm7eELcRHRBWF6SFDYrcNoBWbfxC6BBewJXE3lI2xn1ZjfgVxvVxD5ypCtA8y3e1KWkpvx0HcwHOUODHYVPFR2w4F4DHKh/mz3VgSZq2eG8VfRhySRSzS/FTU7/FTzL8kk+jwgHpMURAmaMib2wKWp7k=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2019 03:16:11.7857 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa69254-5078-4707-8db3-08d70e52f2ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1580
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SgkZAv3T5h6TpvX/uJI/f673b34JuHk7kmi24x+l8IM=;
 b=iYAzwJZfSYf2s4bseozdemrt7E0VJn5obqa8QIyemsnx7va2InamLWCy29J04vTIneB06xhqmyu9DKUTgg+7PjcW91/LlUox0ncXGmy2Jga4Eer/cbMkzcoJO+IO98UzRZy7QpKZAPu9sr3gmteHphAz8S0yqAOl07lpFFGKZ3M=
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
Cc: Alexander.Deucher@amd.com, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VkNOIHNob3VsZCBiZSB1c2VkIGZvciBWZWdhMjAgbGF0ZXIgQVNJQ3Mgd2hpbGUgVVZEIGFuZCBW
Q0UKYXJlIGZvciBwcmV2aW91cyBBU0lDcy4KCkNoYW5nZS1JZDogSWNjNTNkNmZhMTc2YzQ4ZjBm
YzUzNDhlNzliOGE1MDEwMzU3ODY3ZWIKU2lnbmVkLW9mZi1ieTogRXZhbiBRdWFuIDxldmFuLnF1
YW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYyB8
IDU2ICsrKysrKysrKysrKysrKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMzYgaW5zZXJ0
aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3BtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
cG0uYwppbmRleCA4ZjcwMmNmNWUwODAuLmYyYjcwZGIzNDdhNyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3BtLmMKQEAgLTMwNjUsMjggKzMwNjUsNDQgQEAgc3RhdGljIGludCBh
bWRncHVfZGVidWdmc19wbV9pbmZvX3BwKHN0cnVjdCBzZXFfZmlsZSAqbSwgc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmEKIAlpZiAoIWFtZGdwdV9kcG1fcmVhZF9zZW5zb3IoYWRldiwgQU1ER1BVX1BQ
X1NFTlNPUl9FTkFCTEVEX1NNQ19GRUFUVVJFU19NQVNLLCAodm9pZCAqKSZ2YWx1ZTY0LCAmc2l6
ZSkpCiAJCXNlcV9wcmludGYobSwgIlNNQyBGZWF0dXJlIE1hc2s6IDB4JTAxNmxseFxuIiwgdmFs
dWU2NCk7CiAKLQkvKiBVVkQgY2xvY2tzICovCi0JaWYgKCFhbWRncHVfZHBtX3JlYWRfc2Vuc29y
KGFkZXYsIEFNREdQVV9QUF9TRU5TT1JfVVZEX1BPV0VSLCAodm9pZCAqKSZ2YWx1ZSwgJnNpemUp
KSB7Ci0JCWlmICghdmFsdWUpIHsKLQkJCXNlcV9wcmludGYobSwgIlVWRDogRGlzYWJsZWRcbiIp
OwotCQl9IGVsc2UgewotCQkJc2VxX3ByaW50ZihtLCAiVVZEOiBFbmFibGVkXG4iKTsKLQkJCWlm
ICghYW1kZ3B1X2RwbV9yZWFkX3NlbnNvcihhZGV2LCBBTURHUFVfUFBfU0VOU09SX1VWRF9EQ0xL
LCAodm9pZCAqKSZ2YWx1ZSwgJnNpemUpKQotCQkJCXNlcV9wcmludGYobSwgIlx0JXUgTUh6IChE
Q0xLKVxuIiwgdmFsdWUvMTAwKTsKLQkJCWlmICghYW1kZ3B1X2RwbV9yZWFkX3NlbnNvcihhZGV2
LCBBTURHUFVfUFBfU0VOU09SX1VWRF9WQ0xLLCAodm9pZCAqKSZ2YWx1ZSwgJnNpemUpKQotCQkJ
CXNlcV9wcmludGYobSwgIlx0JXUgTUh6IChWQ0xLKVxuIiwgdmFsdWUvMTAwKTsKKwlpZiAoYWRl
di0+YXNpY190eXBlID4gQ0hJUF9WRUdBMjApIHsKKwkJLyogVkNOIGNsb2NrcyAqLworCQlpZiAo
IWFtZGdwdV9kcG1fcmVhZF9zZW5zb3IoYWRldiwgQU1ER1BVX1BQX1NFTlNPUl9WQ05fUE9XRVIs
ICh2b2lkICopJnZhbHVlLCAmc2l6ZSkpIHsKKwkJCWlmICghdmFsdWUpIHsKKwkJCQlzZXFfcHJp
bnRmKG0sICJWQ046IERpc2FibGVkXG4iKTsKKwkJCX0gZWxzZSB7CisJCQkJc2VxX3ByaW50Ziht
LCAiVkNOOiBFbmFibGVkXG4iKTsKKwkJCQlpZiAoIWFtZGdwdV9kcG1fcmVhZF9zZW5zb3IoYWRl
diwgQU1ER1BVX1BQX1NFTlNPUl9VVkRfRENMSywgKHZvaWQgKikmdmFsdWUsICZzaXplKSkKKwkJ
CQkJc2VxX3ByaW50ZihtLCAiXHQldSBNSHogKERDTEspXG4iLCB2YWx1ZS8xMDApOworCQkJCWlm
ICghYW1kZ3B1X2RwbV9yZWFkX3NlbnNvcihhZGV2LCBBTURHUFVfUFBfU0VOU09SX1VWRF9WQ0xL
LCAodm9pZCAqKSZ2YWx1ZSwgJnNpemUpKQorCQkJCQlzZXFfcHJpbnRmKG0sICJcdCV1IE1IeiAo
VkNMSylcbiIsIHZhbHVlLzEwMCk7CisJCQl9CiAJCX0KLQl9Ci0Jc2VxX3ByaW50ZihtLCAiXG4i
KTsKKwkJc2VxX3ByaW50ZihtLCAiXG4iKTsKKwl9IGVsc2UgeworCQkvKiBVVkQgY2xvY2tzICov
CisJCWlmICghYW1kZ3B1X2RwbV9yZWFkX3NlbnNvcihhZGV2LCBBTURHUFVfUFBfU0VOU09SX1VW
RF9QT1dFUiwgKHZvaWQgKikmdmFsdWUsICZzaXplKSkgeworCQkJaWYgKCF2YWx1ZSkgeworCQkJ
CXNlcV9wcmludGYobSwgIlVWRDogRGlzYWJsZWRcbiIpOworCQkJfSBlbHNlIHsKKwkJCQlzZXFf
cHJpbnRmKG0sICJVVkQ6IEVuYWJsZWRcbiIpOworCQkJCWlmICghYW1kZ3B1X2RwbV9yZWFkX3Nl
bnNvcihhZGV2LCBBTURHUFVfUFBfU0VOU09SX1VWRF9EQ0xLLCAodm9pZCAqKSZ2YWx1ZSwgJnNp
emUpKQorCQkJCQlzZXFfcHJpbnRmKG0sICJcdCV1IE1IeiAoRENMSylcbiIsIHZhbHVlLzEwMCk7
CisJCQkJaWYgKCFhbWRncHVfZHBtX3JlYWRfc2Vuc29yKGFkZXYsIEFNREdQVV9QUF9TRU5TT1Jf
VVZEX1ZDTEssICh2b2lkICopJnZhbHVlLCAmc2l6ZSkpCisJCQkJCXNlcV9wcmludGYobSwgIlx0
JXUgTUh6IChWQ0xLKVxuIiwgdmFsdWUvMTAwKTsKKwkJCX0KKwkJfQorCQlzZXFfcHJpbnRmKG0s
ICJcbiIpOwogCi0JLyogVkNFIGNsb2NrcyAqLwotCWlmICghYW1kZ3B1X2RwbV9yZWFkX3NlbnNv
cihhZGV2LCBBTURHUFVfUFBfU0VOU09SX1ZDRV9QT1dFUiwgKHZvaWQgKikmdmFsdWUsICZzaXpl
KSkgewotCQlpZiAoIXZhbHVlKSB7Ci0JCQlzZXFfcHJpbnRmKG0sICJWQ0U6IERpc2FibGVkXG4i
KTsKLQkJfSBlbHNlIHsKLQkJCXNlcV9wcmludGYobSwgIlZDRTogRW5hYmxlZFxuIik7Ci0JCQlp
ZiAoIWFtZGdwdV9kcG1fcmVhZF9zZW5zb3IoYWRldiwgQU1ER1BVX1BQX1NFTlNPUl9WQ0VfRUND
TEssICh2b2lkICopJnZhbHVlLCAmc2l6ZSkpCi0JCQkJc2VxX3ByaW50ZihtLCAiXHQldSBNSHog
KEVDQ0xLKVxuIiwgdmFsdWUvMTAwKTsKKwkJLyogVkNFIGNsb2NrcyAqLworCQlpZiAoIWFtZGdw
dV9kcG1fcmVhZF9zZW5zb3IoYWRldiwgQU1ER1BVX1BQX1NFTlNPUl9WQ0VfUE9XRVIsICh2b2lk
ICopJnZhbHVlLCAmc2l6ZSkpIHsKKwkJCWlmICghdmFsdWUpIHsKKwkJCQlzZXFfcHJpbnRmKG0s
ICJWQ0U6IERpc2FibGVkXG4iKTsKKwkJCX0gZWxzZSB7CisJCQkJc2VxX3ByaW50ZihtLCAiVkNF
OiBFbmFibGVkXG4iKTsKKwkJCQlpZiAoIWFtZGdwdV9kcG1fcmVhZF9zZW5zb3IoYWRldiwgQU1E
R1BVX1BQX1NFTlNPUl9WQ0VfRUNDTEssICh2b2lkICopJnZhbHVlLCAmc2l6ZSkpCisJCQkJCXNl
cV9wcmludGYobSwgIlx0JXUgTUh6IChFQ0NMSylcbiIsIHZhbHVlLzEwMCk7CisJCQl9CiAJCX0K
IAl9CiAKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
