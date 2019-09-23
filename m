Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8F1BB543
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 15:30:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B306E906;
	Mon, 23 Sep 2019 13:30:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770089.outbound.protection.outlook.com [40.107.77.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32D26E906
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 13:30:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nHOSJnE53UfGbtltRKl1b9xlqG2C/Ju0LwJlFiW7nMKyaA6wIM5yjGYRmUoYIEuZDZS/IWajpygqyc0wu9C+zkMKMEMvNg1ekG+7Hbfy+6MO6YCzS+oHvsbkbyaTcyMHPpxasEq5lhqRE7u+2FP3IwyrVEWtmkmpAo/7R4+KiW9SGFFDwCZBEX1T1kq27Qof/NqkGOshQ7y9pjrnbJiPKURU6unoz6A5zEFc28FfKh6lj3XAQJnvty1E9gVnEUqKrl6ar7MUs3GVnkpqIi3VpRdz8FJTT2iGtG+6fd1GIW20iHplsVqDzgUNtAAcIK/K+bK5abWOYGCRo+RThLRTgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJCYVdnTGmBqSi2cH2EWZC5WoQiYYmHfeg5KFKBqWVY=;
 b=Jn0o1wR22JgQqi+Lt6rViAjMjTQxwAoaCZtjyhSwigYerhsPLsaqbLP1Yoq0CtnDlFEm6i5msdP66e4IydLZXlsehNX8YB6MIZzo3w6W9eoXF/Fmcb3smwUmFr5b4enzTLVlBn0Zxg6iNGjAOiWIVWS18ZsvQU41WPjP4oExZ6njaijXqM+FBIbRVx6aZhQFqS5jfmtmOC5Z3GsGG1Zy17Gr+1wYSI96XhKQWYCvJbIe7UwTVn6yCDvSXBG49cAmGVUNenn5dYKWhqDfTy1nQaiaHmpq1+xbf5+zjEXCB+z4xADIzY4d7C27M46FRB7gwr0z9jUL99VwiAxibYZp+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0012.namprd12.prod.outlook.com
 (2603:10b6:301:4a::22) by DM6PR12MB3674.namprd12.prod.outlook.com
 (2603:10b6:5:14a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.25; Mon, 23 Sep
 2019 13:30:53 +0000
Received: from BY2NAM03FT023.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::201) by MWHPR1201CA0012.outlook.office365.com
 (2603:10b6:301:4a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2284.19 via Frontend
 Transport; Mon, 23 Sep 2019 13:30:53 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT023.mail.protection.outlook.com (10.152.84.226) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2284.20 via Frontend Transport; Mon, 23 Sep 2019 13:30:53 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 23 Sep 2019 08:30:51 -0500
From: Le Ma <le.ma@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdgpu: correct condition check for psp rlc autoload
Date: Mon, 23 Sep 2019 21:30:43 +0800
Message-ID: <1569245443-27318-2-git-send-email-le.ma@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569245443-27318-1-git-send-email-le.ma@amd.com>
References: <1569245443-27318-1-git-send-email-le.ma@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(396003)(428003)(189003)(199004)(26005)(186003)(48376002)(51416003)(8936002)(70586007)(6916009)(70206006)(2351001)(76176011)(4744005)(8676002)(47776003)(86362001)(4326008)(5660300002)(50226002)(14444005)(2906002)(36756003)(446003)(305945005)(81166006)(81156014)(336012)(11346002)(476003)(2616005)(478600001)(426003)(126002)(316002)(16586007)(356004)(6666004)(50466002)(44832011)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3674; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee514f0c-20ab-45d2-6c36-08d7402a41d0
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM6PR12MB3674; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB3674:
X-Microsoft-Antispam-PRVS: <DM6PR12MB367498A5ECDBF2EF12961601F6850@DM6PR12MB3674.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-Forefront-PRVS: 0169092318
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: QvCwdp75ZnnxlwcTIGK1tDvBqu0lqW1k93IdXQD78ZOrA7fx76sOQJ25iIXLj+IaazyYKAu73LTSNS40JWzY9PpnLP2VqriOW0u/oZOxp7Lp6uhNjv7mbkq93JhWhk7Bcn5ubrFie0nVtcbsYj3Bh7QqSqi3ZohPskXTSHn0knmzjlPAnzLdB/xOO3oRtRGz9EzjYYITdeIULC0e0PksUhyYBGRR3b6fi049fT9XGU0o1Ke+MByG7DPyI7xa8tRGbyjiIbbKLqYRidjqBHjdO9lVX3syLIAhF9sJEqBZTNPc4cB0Hp1Ntaubv9YeDHiNntR8IhDNECh6wFLc80GY1hXjZMb24NqEcVSDGvDfCEOBUh5cScz+izV9gG2EfF5CRv6p5rVLiFEYXnEuwORlkunSi5Jb4QXATgfxEqmKnkk=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2019 13:30:53.1525 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee514f0c-20ab-45d2-6c36-08d7402a41d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3674
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJCYVdnTGmBqSi2cH2EWZC5WoQiYYmHfeg5KFKBqWVY=;
 b=wZ4Qa7E0hJkR2mUsdNXVR6CXp0JuDwkvmqvDOFFg5UzKRocDMraiqfOe/3i5o5oKtGNff+uKTZK0eUQlGY8C0ypggiQxdbeimRg/MrMuKuDqhNq63KOqJbCtHSL90ahpgBi7++FbnJOsCQIjO6uXa7eIg/apLgTQ1SQJZyqQxH8=
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
Cc: Le Ma <le.ma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Q2hhbmdlLUlkOiBJYTkxZDBmYjcxNzlmNjk0NDIxNGU4OTJmMzcwZDdlZjNkNmI3ZDMwZQpTaWdu
ZWQtb2ZmLWJ5OiBMZSBNYSA8bGUubWFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcHNwLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9wc3AuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3Au
YwppbmRleCBkMzU5ZjFkLi4yYWExYWU2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcHNwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3BzcC5jCkBAIC0xMDgwLDcgKzEwODAsOCBAQCBzdGF0aWMgaW50IHBzcF9ucF9md19sb2Fk
KHN0cnVjdCBwc3BfY29udGV4dCAqcHNwKQogCQkJcmV0dXJuIHJldDsKIAogCQkvKiBTdGFydCBy
bGMgYXV0b2xvYWQgYWZ0ZXIgcHNwIHJlY2lldmVkIGFsbCB0aGUgZ2Z4IGZpcm13YXJlICovCi0J
CWlmICh1Y29kZS0+dWNvZGVfaWQgPT0gQU1ER1BVX1VDT0RFX0lEX1JMQ19SRVNUT1JFX0xJU1Rf
U1JNX01FTSkgeworCQlpZiAocHNwLT5hdXRvbG9hZF9zdXBwb3J0ZWQgJiYgdWNvZGUtPnVjb2Rl
X2lkID09CisJCQlBTURHUFVfVUNPREVfSURfUkxDX1JFU1RPUkVfTElTVF9TUk1fTUVNKSB7CiAJ
CQlyZXQgPSBwc3BfcmxjX2F1dG9sb2FkKHBzcCk7CiAJCQlpZiAocmV0KSB7CiAJCQkJRFJNX0VS
Uk9SKCJGYWlsZWQgdG8gc3RhcnQgcmxjIGF1dG9sb2FkXG4iKTsKLS0gCjIuNy40CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
