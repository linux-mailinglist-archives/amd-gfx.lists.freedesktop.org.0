Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5DF926E8
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 16:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A43156E158;
	Mon, 19 Aug 2019 14:35:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680046.outbound.protection.outlook.com [40.107.68.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FAA56E155
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 14:35:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+3KKgxa6jDrGo3b+/DlhlgHtdBJlDWpzV8jfqYHy3MWJBrgwLiW2XPM+UvfhoLr+nSVzHmxK+ElMLNu61FcHFLZ15nU7INVeYWrnby+ijOklPguD1/VxI8d+Oqsruf+OdCVFHjN84Ew0/WTT5HxqcSD0+n/3W5pajYXhESGVtBnWS5N32Adncn/HRhEXgDNr7jH0k0fzWebDccFIjM3cNKtOSYomEggbqcb8mZLkiKIsbFZLMvCcPEnS9zicuxqsSN0f6Rw4paY9CmCsmseGL5DnJmW9XJZ2iLAtzY0j498txVRQBiZLEUyHzAidPseE+qiGnMjbeeEa6s7kxv3rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDD2soy5PmGw7+SR7P4Xg51f2FbI4CrRZRlKk/qe4tU=;
 b=lvUmaprgy3HkUyKqEM92wyyp3LNpzKsckgTeDlpOlNPqrzsZDe7x/GB1lpjGIwB8Bs3SaqSBKd77zpzBKL6hyVrkZd3NANI0/YmVM9/708PbAbN4gPZG09S7fgSNRck1VP0d+skZrvzKde6Lkq8zsGtjkTzRNdkAbT9Vp9Uq23pPQtAFZPceZDc+3A0+Aw9id7HEcMOOoFPW5dEND1j5UfsOvOsV5qhC2MIh654GTaKMge6LO0o5hLgzTKxn/2oYcMLZQsujIERaQmjPdZeAgqXNTOcqCN1DHWmgavFdSCBALWICYGjO/MoThIIx0yVDL/LuYEJ+Ags96/98M6lT/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0021.namprd12.prod.outlook.com (2603:10b6:4:1::31) by
 DM6PR12MB2713.namprd12.prod.outlook.com (2603:10b6:5:49::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Mon, 19 Aug 2019 14:35:47 +0000
Received: from BY2NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::202) by DM5PR12CA0021.outlook.office365.com
 (2603:10b6:4:1::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 14:35:47 +0000
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
Subject: [PATCH 08/36] drm/amd/display: add null checks before logging
Date: Mon, 19 Aug 2019 10:34:47 -0400
Message-ID: <20190819143515.21653-9-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
References: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(346002)(396003)(2980300002)(428003)(199004)(189003)(7696005)(36756003)(6916009)(53936002)(336012)(2351001)(1076003)(50226002)(81156014)(70206006)(8676002)(53416004)(5660300002)(2906002)(8936002)(51416003)(186003)(76176011)(70586007)(81166006)(4326008)(305945005)(356004)(47776003)(478600001)(316002)(16586007)(48376002)(86362001)(426003)(50466002)(126002)(476003)(2616005)(446003)(11346002)(486006)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2713; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36d1a8ec-3701-42e8-1d7d-08d724b2863d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM6PR12MB2713; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2713:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2713514D40A79137634540C7F9A80@DM6PR12MB2713.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: LjWAFpxtx4BL/lTVqXPbmvJcKu+aqr7z/BSeuxgWgG+ZLPsdl6GGcoSAHnMBZYpOSgAE0X8ytmjCdT+cUpGZPtxkDJUF58pPf5l6H+aXY9W3xbIE4h2+1q3SilDJsUx88MS8WADHSLb+qjt6ZC26GDacnhpRaWRogC0ZDldMECOuyLYa1vQoVTqGv2G5x3npz7NSyDI+TV8KZZfqOVBDXPkH/v1zjfAnS2+2LbyfYIS+SmDLmseFU0DtvwDpSx/GO6tuqCanUkE4aSPllys/xmpp0pQ1UqY8JXqCm712adgnRuIdh6UnedGz41O3WrShRwk9n+yHEOEtnRdA/8mswa2/eicoUbTKoigADGWsU2u0PQE5Z4qsKMD3tz/tOftk/56fkp5og7hxWkp/9rEZJm0/1a12iSekKgVOnXKYgQ4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 14:35:46.9574 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36d1a8ec-3701-42e8-1d7d-08d724b2863d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2713
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDD2soy5PmGw7+SR7P4Xg51f2FbI4CrRZRlKk/qe4tU=;
 b=SNwljth0gJTOWS9Ep3RUiQ6hj46piHq3NSKv+VUqjTDABg/JlePhx8L/DmRPnLy7+TrHjV+3zO/YZ8E5jCVJdxyFHqLEQKnHd8aqqavYdrJ+91MR6vvLPEI7Xc1gQIyr01ZtmplnbOaT1OAhFwtuJ4jEsGOdyuivWRNju1jua+Q=
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
Cc: Wyatt Wood <wyatt.wood@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogV3lhdHQgV29vZCA8d3lhdHQud29vZEBhbWQuY29tPgoKQWRkaW5nIE5VTEwgY2hlY2tz
IHRvIHZhcmlvdXMgcGFyYW1ldGVycyBpbiBsb2dfdGYsIHRvIGF2b2lkCm51bGxwdHIgZXJyb3Jz
CgpTaWduZWQtb2ZmLWJ5OiBXeWF0dCBXb29kIDx3eWF0dC53b29kQGFtZC5jb20+ClJldmlld2Vk
LWJ5OiBBbnRob255IEtvbyA8QW50aG9ueS5Lb29AYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdhbnBy
ZWV0IExha2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgpBY2tlZC1ieTogTmlrb2xhIENv
cm5paiA8Tmlrb2xhLkNvcm5pakBhbWQuY29tPgotLS0KIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jICAgIHwgOSArKysrKystLS0KIDEgZmlsZSBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5j
CmluZGV4IGY2ZjIwMDUwZTM4OS4uMGU1NWRmM2RiNTNjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHdfc2VxdWVuY2VyLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jCkBA
IC0xNTAyLDkgKzE1MDIsMTIgQEAgZGNuMTBfc2V0X291dHB1dF90cmFuc2Zlcl9mdW5jKHN0cnVj
dCBwaXBlX2N0eCAqcGlwZV9jdHgsCiAJfSBlbHNlCiAJCWRwcC0+ZnVuY3MtPmRwcF9wcm9ncmFt
X3JlZ2FtbWFfcHdsKGRwcCwgTlVMTCwgT1BQX1JFR0FNTUFfQllQQVNTKTsKIAotCWxvZ190Zihz
dHJlYW0tPmN0eCwKLQkJCXN0cmVhbS0+b3V0X3RyYW5zZmVyX2Z1bmMsCi0JCQlkcHAtPnJlZ2Ft
bWFfcGFyYW1zLmh3X3BvaW50c19udW0pOworCWlmIChzdHJlYW0gIT0gTlVMTCAmJiBzdHJlYW0t
PmN0eCAhPSBOVUxMICYmCisJCQlzdHJlYW0tPm91dF90cmFuc2Zlcl9mdW5jICE9IE5VTEwpIHsK
KwkJbG9nX3RmKHN0cmVhbS0+Y3R4LAorCQkJCXN0cmVhbS0+b3V0X3RyYW5zZmVyX2Z1bmMsCisJ
CQkJZHBwLT5yZWdhbW1hX3BhcmFtcy5od19wb2ludHNfbnVtKTsKKwl9CiAKIAlyZXR1cm4gdHJ1
ZTsKIH0KLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
