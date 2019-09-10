Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A1FAEC67
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 15:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2B9C892B9;
	Tue, 10 Sep 2019 13:55:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710057.outbound.protection.outlook.com [40.107.71.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C52F4892A5
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 13:55:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g6gv2jmJDovHRbTWfB13vi+F3cdTY1YjuCl4pgoEmk683K7ggk31HU21S5ZSebIO11kmDAhdwtjRlAZfB+wGoTKtj3PiACTw1avf2Vk8e6oncIGAdi/jsGEydZVu+9d4yDj1/RocWwIvRW+7ZvJsKQzglV9ziG1zlyylb2V4kX9l2/PtTCYWYioHYfapG/qskb7VY1mZLdUMueDJH266sIfdHfkhfftCSt1MSoHxDeDr6gFWPJ8KHleJyMoBWhuMQ4/HFF9BxL+9ik+6OA25pFGDzKimch4bM6i4PSj5JaMTbJt47dYfGK8kTTojrv1Y0K8FuNW6ukLukuaZKxBc4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zs2z3b0+vbPtxDpZJ/m1F4m2XCSyBluYoCysCkWKABM=;
 b=ZBLBr5H2F0mIAsYH/TSpKeC6MK9W1cfnrevUGvg3PhMeM8WnB1Msy8RGefg9CCD7i8qvfywecUrqDv5vyD3OR4zo845QV+og85neL9o3tWtjERl34fBq4B+AtRBVOig135AZA+kY2XdUpDZi6nb5yUeYYaTR+iPhbQNxSoqFtcKQkwbMAktR1RWRt8ucE5y4YKUmFoUgfFL4Amj2i63r8aTTNTRDNfBCLAB1uVlIUiVv+Lh0He8yWJMDsdKk3rxODEdc2sVVxo2H5h4bzbM3xgCJbpHbx0JGzlcoU6sMAmIBS6xxf8addg2oivn/0sYpFS8FuVv3O5Yj4lEBfOzZ8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0009.namprd12.prod.outlook.com (2603:10b6:5:1c0::22)
 by DM6PR12MB2779.namprd12.prod.outlook.com (2603:10b6:5:4f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.20; Tue, 10 Sep
 2019 13:55:00 +0000
Received: from CO1NAM03FT026.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by DM6PR12CA0009.outlook.office365.com
 (2603:10b6:5:1c0::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.21 via Frontend
 Transport; Tue, 10 Sep 2019 13:55:00 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT026.mail.protection.outlook.com (10.152.80.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 13:54:59 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 10 Sep 2019 08:54:55 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 06/25] drm/amd/display: add additional flag consideration for
 surface update
Date: Tue, 10 Sep 2019 09:54:26 -0400
Message-ID: <20190910135445.18300-7-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190910135445.18300-1-sunpeng.li@amd.com>
References: <20190910135445.18300-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(346002)(136003)(2980300002)(428003)(189003)(199004)(446003)(2616005)(14444005)(356004)(316002)(4326008)(6916009)(47776003)(2906002)(478600001)(50226002)(305945005)(81166006)(8676002)(70586007)(81156014)(2876002)(50466002)(36756003)(70206006)(48376002)(5660300002)(2351001)(15650500001)(8936002)(476003)(336012)(126002)(53936002)(1076003)(86362001)(2870700001)(49486002)(51416003)(76176011)(54906003)(26005)(426003)(186003)(486006)(11346002)(6666004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2779; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d24c4bfa-3be7-4dee-2f5e-08d735f6791a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM6PR12MB2779; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2779:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2779C761FA914E2CC8966AEA82B60@DM6PR12MB2779.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: X75yD2sjFBvNYTAG8Zk3R9IemjIOQImUn2g/OMEgkoFVNb4822gSGfgnZvns8zwaw5Jb5g2tMY7GG1i3lUFQulR3sTFVQo/rXNZfXEh443ADTpnBSSNrPlRBPYV7AHcQdiPbJiRAmr7qJSzoI4cUksqoGhS6CYfZjtt7Hk/ETH7wyTEWCTwJApmq3EhqzytRDxLKqYo7QCCflJHzgkdhnAh+WszpAxhEgQNDndDPY8q1M8bMYsXf71+FPeupqpbE9/2DF/3Q43M40Z/lcfSm06oc2PYisgAhzZZvgkq44drOI+yTj2HyJ+Iwe68lNz2unqHt6ZtGs49F1RQDB7AAHROSBTZrG/wyysJLsUOJrC6FvY6a4gw9sdVOoMjOqyeNxvNyXWx3bBuj3u5yc3HU6qHKvBtUIdjKxcVKqWdqJ8E=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 13:54:59.5962 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d24c4bfa-3be7-4dee-2f5e-08d735f6791a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2779
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zs2z3b0+vbPtxDpZJ/m1F4m2XCSyBluYoCysCkWKABM=;
 b=MnQtuk5mQ3Vm4mPuOGVmmmgO3s5ZBpon14XDDd0T3h8p030Azm5TXxHCT3yLrDvCJ/+3RgnaxCtMt3/+zmncSxr2tydPz7bOdoF/aLLxoP5BNN59WCW12biR9ywQWbF6/42hC9+COpmmfbksDFcAhT8dCECSK6EjdGwgRHkmPQ8=
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
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KClN1
cmZhY2UgZGNodWIvZHBwIHVwZGF0ZSB3b3VsZCBub3QgdHJpZ2dlciBpZiBhIHN0cmVhbSB1cGRh
dGUgd2FzIHRoZQpvbmx5IGNhdXNlLiBUaGlzIGNoYW5nZSBub3cgYWxsb3dzIHN0cmVhbSBmbGFn
cyB0byB0cmlnZ2VyIHRoaXMgdXBkYXRlLgoKU2lnbmVkLW9mZi1ieTogRG15dHJvIExha3R5dXNo
a2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVu
Zy5saUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9k
Y24yMF9od3NlcS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
bjIwL2RjbjIwX2h3c2VxLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAv
ZGNuMjBfaHdzZXEuYwppbmRleCA4MTc0MGUwYzRjNGUuLmZhYWY4ODQxYzYxZSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMKQEAg
LTEzNzUsNyArMTM3NSw3IEBAIHN0YXRpYyB2b2lkIGRjbjIwX3Byb2dyYW1fcGlwZSgKIAlpZiAo
cGlwZV9jdHgtPnVwZGF0ZV9mbGFncy5iaXRzLmVuYWJsZSkKIAkJZGNuMjBfZW5hYmxlX3BsYW5l
KGRjLCBwaXBlX2N0eCwgY29udGV4dCk7CiAKLQlpZiAocGlwZV9jdHgtPnVwZGF0ZV9mbGFncy5y
YXcgfHwgcGlwZV9jdHgtPnBsYW5lX3N0YXRlLT51cGRhdGVfZmxhZ3MucmF3KQorCWlmIChwaXBl
X2N0eC0+dXBkYXRlX2ZsYWdzLnJhdyB8fCBwaXBlX2N0eC0+cGxhbmVfc3RhdGUtPnVwZGF0ZV9m
bGFncy5yYXcgfHwgcGlwZV9jdHgtPnN0cmVhbS0+dXBkYXRlX2ZsYWdzLnJhdykKIAkJZGNuMjBf
dXBkYXRlX2RjaHVicF9kcHAoZGMsIHBpcGVfY3R4LCBjb250ZXh0KTsKIAogCWlmIChwaXBlX2N0
eC0+dXBkYXRlX2ZsYWdzLmJpdHMuZW5hYmxlCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
