Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEA210180
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 23:10:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D9F58923D;
	Tue, 30 Apr 2019 21:10:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760052.outbound.protection.outlook.com [40.107.76.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D481D89240
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 21:10:00 +0000 (UTC)
Received: from DM3PR12CA0106.namprd12.prod.outlook.com (2603:10b6:0:55::26) by
 DM5PR12MB2374.namprd12.prod.outlook.com (2603:10b6:4:b4::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Tue, 30 Apr 2019 21:09:59 +0000
Received: from BY2NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::200) by DM3PR12CA0106.outlook.office365.com
 (2603:10b6:0:55::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Tue, 30 Apr 2019 21:09:59 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT009.mail.protection.outlook.com (10.152.84.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1835.14 via Frontend Transport; Tue, 30 Apr 2019 21:09:58 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Apr 2019
 16:09:49 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 09/20] drm/amd/display: Fill prescale_params->scale for RGB565
Date: Tue, 30 Apr 2019 17:09:15 -0400
Message-ID: <20190430210938.32335-18-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
References: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(396003)(39860400002)(136003)(346002)(2980300002)(428003)(189003)(199004)(50226002)(77096007)(16586007)(50466002)(186003)(2351001)(48376002)(68736007)(36756003)(126002)(305945005)(53416004)(2906002)(316002)(47776003)(6916009)(486006)(476003)(11346002)(446003)(8936002)(2616005)(4326008)(81166006)(7696005)(26005)(81156014)(51416003)(8676002)(76176011)(86362001)(336012)(53936002)(70586007)(72206003)(1076003)(426003)(478600001)(5660300002)(356004)(6666004)(70206006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2374; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a94bec20-d4e4-4326-949a-08d6cdb033e9
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:DM5PR12MB2374; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB2374:
X-Microsoft-Antispam-PRVS: <DM5PR12MB2374B351722CCEB3761BE80CF93A0@DM5PR12MB2374.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-Forefront-PRVS: 00235A1EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: KHVc+DjODNSAVYM9Qb/Se4dR/Di9ln7qXZBxvDrc3ed9xohnz8UHOuz94Zr9GWv3Kux9qFZaghgQKcfOUPSEFR11wLPWWXuQ5BPuCj3LGpmnrtozi/nZj5+2aFV2QTxXNswRq6WoqHqT534UkEmFGUoFrBzNymuiFl/mwrdmS1OtsOyPkdcXE/KGMAC0Zph81rCYrLElFSG+x0dNpXDXdDVTAi0uQ5rlmq20J9UfEkosCwXLtHS9HcfMcgMpRy7QGIISweErlGubEPhJ9XPJSPgf/H3Oq+FUkIyrggPHU2ndJ8Mze+VoPPLKSMRFUSLjU5w4eJq84rVuOvfwSdrUp3hoJbS027akdEct/mecgAe06RMBSIRYg0woqWzNmjoqwtt+WNVfh73rg1xmTZ3hb2aJheiuRnk5zdpCTyn0Z5k=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2019 21:09:58.6616 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a94bec20-d4e4-4326-949a-08d6cdb033e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2374
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TamaIaLFSZAuqxFww3EOHbgSEgMrK6VW4f4w1CX7zfQ=;
 b=xa4SYldzqeVkX8xdnHnggbZKCUiFXK4B/UOKzBTSV0b0xspnr9/o7LAu/QPDVltttoLGoytqGj+WU/Uhf6lM+Twuss8xaGk006gHXtr3lftWZs9T2b2iy7V8vsvnNCd8WrywjowEGOjOep36VEjOW90Kw1SRYZOJdRAqSJ6HqGk=
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
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgoK
W1doeV0KQW4gYXNzZXJ0aW9uIGlzIHRocm93biB3aGVuIHVzaW5nIFNVUkZBQ0VfUElYRUxfRk9S
TUFUX0dSUEhfUkdCNTY1CmZvcm1hdHMgb24gRENFIHNpbmNlIHRoZSBwcmVzY2FsZV9wYXJhbXMt
PnNjYWxlIHdhc24ndCBiZWluZyBmaWxsZWQuCgpGb3VuZCBieSBhIGRtZXNnLWZhaWwgd2hlbiBy
dW5uaW5nIHRoZQppZ3RAa21zX3BsYW5lQHBpeGVsLWZvcm1hdC1waXBlLWEtcGxhbmVzIHRlc3Qg
b24gQmFmZmluLgoKW0hvd10KRmlsbCBpbiB0aGUgc2NhbGUgcGFyYW1ldGVyLgoKQ2hhbmdlLUlk
OiBJNjU4MjUwYTQ2OWM2NjYzYmFlOTFiZDdhZmJkMmNiOWVlNzVkMWVkMApTaWduZWQtb2ZmLWJ5
OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb20+ClJldmll
d2VkLWJ5OiBSb21hbiBMaSA8Um9tYW4uTGlAYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0
IExha2hhIDxCaGF3YW5wcmVldCBMYWtoYUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX2h3X3NlcXVlbmNlci5jIHwgMyArKysKIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF9od19zZXF1ZW5jZXIuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX2h3X3NlcXVlbmNlci5jCmluZGV4IDdh
YzUwYWIxYjc2Mi4uN2Q3ZTkzYzg3YzI4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF9od19zZXF1ZW5jZXIuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF9od19zZXF1ZW5jZXIuYwpAQCAtMjQy
LDYgKzI0Miw5IEBAIHN0YXRpYyB2b2lkIGJ1aWxkX3ByZXNjYWxlX3BhcmFtcyhzdHJ1Y3QgaXBw
X3ByZXNjYWxlX3BhcmFtcyAqcHJlc2NhbGVfcGFyYW1zLAogCXByZXNjYWxlX3BhcmFtcy0+bW9k
ZSA9IElQUF9QUkVTQ0FMRV9NT0RFX0ZJWEVEX1VOU0lHTkVEOwogCiAJc3dpdGNoIChwbGFuZV9z
dGF0ZS0+Zm9ybWF0KSB7CisJY2FzZSBTVVJGQUNFX1BJWEVMX0ZPUk1BVF9HUlBIX1JHQjU2NToK
KwkJcHJlc2NhbGVfcGFyYW1zLT5zY2FsZSA9IDB4MjA4MjsKKwkJYnJlYWs7CiAJY2FzZSBTVVJG
QUNFX1BJWEVMX0ZPUk1BVF9HUlBIX0FSR0I4ODg4OgogCWNhc2UgU1VSRkFDRV9QSVhFTF9GT1JN
QVRfR1JQSF9BQkdSODg4ODoKIAkJcHJlc2NhbGVfcGFyYW1zLT5zY2FsZSA9IDB4MjAyMDsKLS0g
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
