Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D74215844
	for <lists+amd-gfx@lfdr.de>; Tue,  7 May 2019 06:08:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB1A89C88;
	Tue,  7 May 2019 04:08:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700067.outbound.protection.outlook.com [40.107.70.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B32B089C88
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 May 2019 04:08:43 +0000 (UTC)
Received: from SN1PR12CA0060.namprd12.prod.outlook.com (2603:10b6:802:20::31)
 by BN8PR12MB3475.namprd12.prod.outlook.com (2603:10b6:408:48::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.12; Tue, 7 May
 2019 04:08:41 +0000
Received: from BY2NAM03FT057.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::203) by SN1PR12CA0060.outlook.office365.com
 (2603:10b6:802:20::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Tue, 7 May 2019 04:08:41 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT057.mail.protection.outlook.com (10.152.85.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Tue, 7 May 2019 04:08:41 +0000
Received: from bb-VirtualBox.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 6 May 2019
 23:08:39 -0500
From: Trigger Huang <Trigger.Huang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 0/2] Skip IH re-route on Vega SR-IOV
Date: Tue, 7 May 2019 12:08:33 +0800
Message-ID: <1557202115-24444-1-git-send-email-Trigger.Huang@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(396003)(136003)(39860400002)(376002)(2980300002)(428003)(199004)(189003)(26005)(47776003)(70586007)(2351001)(2906002)(305945005)(70206006)(336012)(316002)(72206003)(51416003)(4326008)(7696005)(186003)(68736007)(77096007)(5660300002)(81156014)(81166006)(53416004)(8936002)(50466002)(6916009)(8676002)(356004)(6666004)(50226002)(48376002)(36756003)(4744005)(126002)(486006)(16586007)(53936002)(2616005)(476003)(478600001)(86362001)(426003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3475; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a96079c4-8f18-450a-888c-08d6d2a1b0b7
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BN8PR12MB3475; 
X-MS-TrafficTypeDiagnostic: BN8PR12MB3475:
X-Microsoft-Antispam-PRVS: <BN8PR12MB34755F146AE0EAA8A42F9F36FE310@BN8PR12MB3475.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 0030839EEE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: qCxwz7p7KeQRUlqEQrzU3AaS0lf+Odwv369w8mHVsSqrPlGVaXbQdS3ezG3S60ZHN+cKvlwn6P6dzdNt+ZMe8ZRGepytnFLJ/bLX6me1GXsweqmT9A0Pf7dEUnwhIMHTuhiGYTwOiSZ2CTBVaahpN7jgSe0b8xe+tpKBcIvwsAd3SPo9awNSNPmdT9ivwiM+VfhrNuDYxWkInwlIJ8rYF0ORYUqS9T0YJzjIImVn2xyW5kW5PhQT6Smgm8QrBXL9IgHdyUyPvp/KAG3VJWpu3L9UXS6jcPJIIUE8X4AR1LvcKCQ9aSwk0adIsncY8s8puHi76kJsgKxxwY1nKceBoWeZku96wuN20iYJNQph1kTO7Tme27Hk4pUYUlTaeU5plHQ/sB90kW2bwnU+YyLiHZswb4DJY5wJsCzoKTpV0xs=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2019 04:08:41.2987 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a96079c4-8f18-450a-888c-08d6d2a1b0b7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3475
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9guNVkfn19ommhhvXAUUPT2RP9gqtoLXCApsYWO4YQ=;
 b=FMzwh90BhYM1MHtcl5P4Ae1Pd9t+2YxhTZnnJq+xb3N2aeZyXdmmWPBkGj9XUPSrCTokG/xhAUXhYEl2Yn2lddNYGfjK87kKYWany391BPnNjC0XL12eqhh7xWkIk89NCrTydazAO+hO/luYpmNK8BxSBNo5q3o22CV8NslTho4=
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
Cc: Trigger.Huang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SUggcmUtcm91dGUgaXMgbm90IHN1cHBvcnRlZCBvbiBWZWdhIFNSLUlPViwgbmVlZCB0byBiZSBz
a2lwcGVkCgpUcmlnZ2VyIEh1YW5nICgyKToKICBkcm0vYW1kZ3B1OiBTa2lwIElIIHJlcm91dGUg
aW4gVmVnYTEwIFNSLUlPViBWRgogIGRybS9hbWRncHU6IFNraXAgSUggcmVyb3V0ZSBpbiBWZWdh
MjAgU1ItSU9WIFZGCgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMV8wLmMgfCA0
ICsrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92M18xLmMgIHwgNCArKysrCiAy
IGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKLS0gCjIuNy40CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
