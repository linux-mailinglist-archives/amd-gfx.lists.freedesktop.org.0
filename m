Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4978169DB8
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA1789C7F;
	Mon, 15 Jul 2019 21:21:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710047.outbound.protection.outlook.com [40.107.71.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F6D389C52
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QcTmJwYc2iozXrBSPAEev6GgEwUnoOpHaxIPy0LBJyXd6RbCTBRCRwFL+OpnnYSs0Mapo8qEI5MmLRHmS4/j90kAPdvfR5FqYtUktl8g/h/i9f+/Y4xHW9ky+xT+nMWUYIv4tkPgpkicoaT8lLazLs6ASIyB9r5Wh5L2ah8G/boxIDv7XD/g3ymKeNc6n3CjCgEtkJYcpiZLyz9stCSXCD39a3FcCVyiicnEn3jUGDy1irX88y9B/rMTIYEfkhPtPQLB6WQkTRjA89TyVh0j3nEgXg5LpoWfLIS/+FP+blYlQTpTXS6rvHQRxvNL8aJ8a55CRJfoRKTkGqYDjjpocA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3AVM7H2gEeaIn9ChF05ZlvwG/s3W+5DI7z4HctkPil4=;
 b=DtzWw9ANRVxncxMYQ9SV9wDxm4zIKdOczIrk6SUMyY5ZAKbTXFbE5TmMymHh/0iv0KkX/yhX5g7w8pbQwjfDobswN1AJLENYmo5RzphKSUcXJ5lXcI9n1XV2Q/z5HcwISOByp0kPE4n0k8raSdkn/ApcEmWUpz47qrbJMZ2BKl3Vjy6vqEffU7vT2o54t+4I61EOMHJjJwOHoUo8U8KcV8JHwF951+dHGJsTbf1cHtniBZM5KOgRkhH5yk9PjcFFPdOYLOOTPdKIBpbVfrK5pT4x/pXFQd6rhntu34eg/f+aFWO73CNhubBqFMXp6ybj/IHQSxvwWFDGywGJaeSzCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MN2PR12CA0007.namprd12.prod.outlook.com (2603:10b6:208:a8::20)
 by MWHPR12MB1936.namprd12.prod.outlook.com (2603:10b6:300:114::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.10; Mon, 15 Jul
 2019 21:21:37 +0000
Received: from CO1NAM03FT049.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by MN2PR12CA0007.outlook.office365.com
 (2603:10b6:208:a8::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.14 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:36 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT049.mail.protection.outlook.com (10.152.81.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:35 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:22 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 35/87] drm/amd/display: Read max down spread
Date: Mon, 15 Jul 2019 17:19:57 -0400
Message-ID: <20190715212049.4584-36-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(136003)(39860400002)(2980300002)(428003)(189003)(199004)(356004)(6666004)(2870700001)(5660300002)(2351001)(50466002)(48376002)(70206006)(426003)(70586007)(76176011)(486006)(51416003)(446003)(26005)(6916009)(11346002)(476003)(14444005)(316002)(336012)(8936002)(126002)(2616005)(50226002)(54906003)(81156014)(81166006)(86362001)(186003)(2876002)(4326008)(478600001)(68736007)(49486002)(8676002)(53936002)(36756003)(305945005)(1076003)(47776003)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1936; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75631f3f-290f-452a-27fd-08d7096a6af3
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1936; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1936:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1936640F95D5DD2045E836E382CF0@MWHPR12MB1936.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: HAcok9viO6o06odBupJiLtCRXWY3srvUZhQzXQWys6Y+E4Xn7IdMJ/3hD54lGhn3CQPSEZhNvVgvxIcaRhLPX+RkuXxyEv8rfuh+2JCgcM6FqdDgsOuzZIC69GFOWtDRyBCaJSuor5EF6OacQ+2FzgkItZXDd56dVeh3W0lj7fSp73JRyd2PSwZrorDaifNGnq1x9kIM9pOuiltzDEp79SzwneBfp578wj3cnCf9GBFjvjtptBrH66SlV8WF5agDs5Bzete2HHQZ5eZc2ypSQSIPhH0t5XEGHmD3pnd8QgGStvYuqxR2kf23N9gqPqBVwBjgW7UGUAn2IIJtmyMcCRilPJkU/ENcP2P0df+iNK+pYHWZV7ZcIX1/Jg/EtC3frzLM6u7Kuh5Yk7DoMb5/HrnAZFuqQiaWXCuStqaU9qY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:35.9726 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75631f3f-290f-452a-27fd-08d7096a6af3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1936
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3AVM7H2gEeaIn9ChF05ZlvwG/s3W+5DI7z4HctkPil4=;
 b=S/4oKmK4bwzkBAnyi2HrRXQjY1Phqi3G59efgoRZeDASRSp7kHscTAULGiwAxZ+nvPnWZBEsresnz4913cOITSnEwNiVCrFtLeTp8ITr7WHHdfXiZmNss1OYTZ0Sq/q6Hru4M3SAH7/FiHsbiDB6gPbnHgeEc2l4OULePoGG+CM=
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
Cc: Leo Li <sunpeng.li@amd.com>, Derek Lai <Derek.Lai@amd.com>,
 Tony Cheng <Tony.Cheng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRGVyZWsgTGFpIDxEZXJlay5MYWlAYW1kLmNvbT4KCltXaHldCldoZW4gbGF1bmNoIEQx
MC4yLCBkcml2ZXIgd2lsbCB3cml0ZSBEUENEIDB4MTA3IHdpdGggMHgwMAoKW0hvd10KUmVhZCBN
QVhfRE9XTlNQUkVBRCAoMHgwMDAzaCkgdGhlbiBrZWVwIGluIGN1cnJlbnQKbGluayBzZXR0aW5n
cwoKU2lnbmVkLW9mZi1ieTogRGVyZWsgTGFpIDxEZXJlay5MYWlAYW1kLmNvbT4KUmV2aWV3ZWQt
Ynk6IFRvbnkgQ2hlbmcgPFRvbnkuQ2hlbmdAYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3Vu
cGVuZy5saUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3Jl
L2RjX2xpbmsuYyB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYwppbmRleCAx
ZTA1MWU5NTM2MTAuLjRiODJiODZmMWU2YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9jb3JlL2RjX2xpbmsuYwpAQCAtNTMwLDYgKzUzMCw3IEBAIHN0YXRpYyB2b2lkIHJl
YWRfZWRwX2N1cnJlbnRfbGlua19zZXR0aW5nc19vbl9kZXRlY3Qoc3RydWN0IGRjX2xpbmsgKmxp
bmspCiAJdWludDMyX3QgcmVhZF9kcGNkX3JldHJ5X2NudCA9IDEwOwogCWVudW0gZGNfc3RhdHVz
IHN0YXR1cyA9IERDX0VSUk9SX1VORVhQRUNURUQ7CiAJaW50IGk7CisJdW5pb24gbWF4X2Rvd25f
c3ByZWFkIG1heF9kb3duX3NwcmVhZCA9IHsgezB9IH07CiAKIAkvLyBSZWFkIERQQ0QgMDAxMDFo
IHRvIGZpbmQgb3V0IHRoZSBudW1iZXIgb2YgbGFuZXMgY3VycmVudGx5IHNldAogCWZvciAoaSA9
IDA7IGkgPCByZWFkX2RwY2RfcmV0cnlfY250OyBpKyspIHsKQEAgLTU3NCw2ICs1NzUsMTIgQEAg
c3RhdGljIHZvaWQgcmVhZF9lZHBfY3VycmVudF9saW5rX3NldHRpbmdzX29uX2RldGVjdChzdHJ1
Y3QgZGNfbGluayAqbGluaykKIAkJbGluay0+Y3VyX2xpbmtfc2V0dGluZ3MubGlua19yYXRlID0g
bGlua19id19zZXQ7CiAJCWxpbmstPmN1cl9saW5rX3NldHRpbmdzLnVzZV9saW5rX3JhdGVfc2V0
ID0gZmFsc2U7CiAJfQorCS8vIFJlYWQgRFBDRCAwMDAwM2ggdG8gZmluZCB0aGUgbWF4IGRvd24g
c3ByZWFkLgorCWNvcmVfbGlua19yZWFkX2RwY2QobGluaywgRFBfTUFYX0RPV05TUFJFQUQsCisJ
CQkmbWF4X2Rvd25fc3ByZWFkLnJhdywgc2l6ZW9mKG1heF9kb3duX3NwcmVhZCkpOworCWxpbmst
PmN1cl9saW5rX3NldHRpbmdzLmxpbmtfc3ByZWFkID0KKwkJbWF4X2Rvd25fc3ByZWFkLmJpdHMu
TUFYX0RPV05fU1BSRUFEID8KKwkJTElOS19TUFJFQURfMDVfRE9XTlNQUkVBRF8zMEtIWiA6IExJ
TktfU1BSRUFEX0RJU0FCTEVEOwogfQogCiBzdGF0aWMgYm9vbCBkZXRlY3RfZHAoCi0tIAoyLjIy
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
