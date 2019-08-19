Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C017926E4
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 16:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A271F6E155;
	Mon, 19 Aug 2019 14:35:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820045.outbound.protection.outlook.com [40.107.82.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 358016E154
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 14:35:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=abJSHmMhsVAeqYLmsr1+8cq4NO8ZrN12eD/Yh564KIBke0fzQ7S1bUkGo0tw+CD2gVgjEWg7iYDLp4n0IOcHQLstUqAn2YCPcEdpoCPnxSLd0MloFnA6nI7sKNS0N07jRCxxcoaQkg7VOLau9pSX0SXohJ6mhwIx3nHxeSOQEoe+A4wMUvEVri+qNRTJj8vsJVS77PsvmHznzafhB5rBRCZLE78udJwa3ED4I5sfHus7I56yfBGtn5wQP/CaDICPf5gUWjFd4FA9pbhKwYK2KTBoCMHLYR4H9Qi8p2feOcpIQLtUJJEvQVdLtNiXtC+0r/bPHTKk8Qj/m7m05Tt23g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5v4KXl22FOFsvSAYrvZKqHajSucmYxshECY2mNVmtq0=;
 b=K9KUWEuAz8DcKcydKcWTRg0kyHSxuvz6DtmA3s4Wu4DghO5Mmdu3OlDFEzqKbAfF8u1oA1yb9qjcRwTtCz9ftWN928WU1bYKIQ/TYlyOAyxHmBlTH3n8slSy69DQFVPdQl1WDKAClFmVU3uLR3/Yxicg5LwKL5x1S0yL4g9Ghwu8wpj4tvkRXTI9M0T3mjLVn0u0Jtlgiw0mndLGfusHt/3qTSU5vuqL9gFbGcRqV9XP/B57e/oqJp3p4pKVnlquHE0HL9fejj9nwGyWru/wlX4YK0lYP/6BtaerUcdQANVcXlcHNCvGEsDjZ2qih0Ghll7//uWJMtHtHASsxvthtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0003.namprd12.prod.outlook.com (2603:10b6:4:1::13) by
 CY4PR12MB1270.namprd12.prod.outlook.com (2603:10b6:903:43::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Mon, 19 Aug 2019 14:35:46 +0000
Received: from BY2NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::201) by DM5PR12CA0003.outlook.office365.com
 (2603:10b6:4:1::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 14:35:46 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT048.mail.protection.outlook.com (10.152.85.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 14:35:46 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 19 Aug 2019
 09:35:41 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 07/36] drm/amd/display: set Hratio and VRatio in dml
Date: Mon, 19 Aug 2019 10:34:46 -0400
Message-ID: <20190819143515.21653-8-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
References: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(376002)(346002)(39860400002)(2980300002)(428003)(199004)(189003)(356004)(2906002)(48376002)(16586007)(86362001)(36756003)(70206006)(1076003)(47776003)(70586007)(8936002)(5660300002)(6916009)(316002)(81156014)(8676002)(81166006)(336012)(4326008)(2616005)(446003)(2351001)(476003)(126002)(53416004)(53936002)(50466002)(76176011)(50226002)(305945005)(186003)(26005)(51416003)(7696005)(486006)(478600001)(11346002)(426003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1270; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5336704c-b53a-4252-fbb7-08d724b285be
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:CY4PR12MB1270; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1270:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1270F353C9A7D0C503E5C105F9A80@CY4PR12MB1270.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: OjrC/Zfcq6RiQw3GP9gbpaAr5XT4i9n9Y1bojfxj6aLyMyxKXZ83rU8NTV88fGnprdUYGOeYdS7Cccqt3hgpAW/MMpt7ThtPkKnhzoFEP+cOIlWDJnNOTxLR1pHND4sEAS530235/Q7ENHEGApwoTdh0cNjAfAZgT8NbuC75oTo0oqBcoKzWOTNGvfmXZz8zBsYcogpinkRMJk6Ie7wW5Sb75McSrq0xlw0qEO+Tazc4Azw5FGU1zadrMTT48VuNewGTzHQrCNqkfX8BGbBT/9GF7bdxA8i+L7RI0XRdfxxbFMFW5vruQtAIXwj081GH4JhA1ECl48aCsWgm4ONQ4g1qyGDOeFvBomUcITnks7ZOBifVHSzRsH4WMYYkuPscdoHudZc/EQprP5tALESD2UfQu/lgPe429h+QDuno11I=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 14:35:46.1307 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5336704c-b53a-4252-fbb7-08d724b285be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1270
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5v4KXl22FOFsvSAYrvZKqHajSucmYxshECY2mNVmtq0=;
 b=dI08moafdDnlDky7hfRw64EbpZBnCY1TGFb1JUsWgN63TEVkckSndaAPmL4zOaC0IbtFYqen0C/j9R5u43bBDp86DrZrKX3dcge5Wfx/BhLClfZONkcsGGaM1QYANX5IP8gJOeFNoLvn4/km31hauHduj3orF03sjhvic3jNkEA=
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
Cc: Ilya Bakoulin <Ilya.Bakoulin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSWx5YSBCYWtvdWxpbiA8SWx5YS5CYWtvdWxpbkBhbWQuY29tPgoKU2V0IHRoZSB3cml0
ZWJhY2sgSHJhdGlvIGFuZCBWcmF0aW8gaW4gZG1sLgoKU2lnbmVkLW9mZi1ieTogSWx5YSBCYWtv
dWxpbiA8SWx5YS5CYWtvdWxpbkBhbWQuY29tPgpSZXZpZXdlZC1ieTogQ2hhcmxlbmUgTGl1IDxD
aGFybGVuZS5MaXVAYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5w
cmVldC5MYWtoYUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
bWwvZGlzcGxheV9tb2RlX3ZiYS5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9k
aXNwbGF5X21vZGVfdmJhLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2Rp
c3BsYXlfbW9kZV92YmEuYwppbmRleCBiZDYzNGRjZTZmM2EuLjY1Y2Y0ZWRkZGFmZiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kaXNwbGF5X21vZGVfdmJh
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kaXNwbGF5X21vZGVf
dmJhLmMKQEAgLTQ2Niw2ICs0NjYsMTAgQEAgc3RhdGljIHZvaWQgZmV0Y2hfcGlwZV9wYXJhbXMo
c3RydWN0IGRpc3BsYXlfbW9kZV9saWIgKm1vZGVfbGliKQogCQkJCWRvdXQtPndiLndiX2RzdF93
aWR0aDsKIAkJbW9kZV9saWItPnZiYS5Xcml0ZWJhY2tEZXN0aW5hdGlvbkhlaWdodFttb2RlX2xp
Yi0+dmJhLk51bWJlck9mQWN0aXZlUGxhbmVzXSA9CiAJCQkJZG91dC0+d2Iud2JfZHN0X2hlaWdo
dDsKKwkJbW9kZV9saWItPnZiYS5Xcml0ZWJhY2tIUmF0aW9bbW9kZV9saWItPnZiYS5OdW1iZXJP
ZkFjdGl2ZVBsYW5lc10gPQorCQkJCWRvdXQtPndiLndiX2hyYXRpbzsKKwkJbW9kZV9saWItPnZi
YS5Xcml0ZWJhY2tWUmF0aW9bbW9kZV9saWItPnZiYS5OdW1iZXJPZkFjdGl2ZVBsYW5lc10gPQor
CQkJCWRvdXQtPndiLndiX3ZyYXRpbzsKIAkJbW9kZV9saWItPnZiYS5Xcml0ZWJhY2tQaXhlbEZv
cm1hdFttb2RlX2xpYi0+dmJhLk51bWJlck9mQWN0aXZlUGxhbmVzXSA9CiAJCQkJKGVudW0gc291
cmNlX2Zvcm1hdF9jbGFzcykgKGRvdXQtPndiLndiX3BpeGVsX2Zvcm1hdCk7CiAJCW1vZGVfbGli
LT52YmEuV3JpdGViYWNrSFRhcHNbbW9kZV9saWItPnZiYS5OdW1iZXJPZkFjdGl2ZVBsYW5lc10g
PQotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
