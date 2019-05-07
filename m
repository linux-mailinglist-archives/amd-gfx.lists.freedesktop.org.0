Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9438B15847
	for <lists+amd-gfx@lfdr.de>; Tue,  7 May 2019 06:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A27C89CA2;
	Tue,  7 May 2019 04:08:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790053.outbound.protection.outlook.com [40.107.79.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9EF89CA2
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 May 2019 04:08:50 +0000 (UTC)
Received: from DM5PR12CA0071.namprd12.prod.outlook.com (2603:10b6:3:103::33)
 by MWHPR12MB1151.namprd12.prod.outlook.com (2603:10b6:300:e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.10; Tue, 7 May
 2019 04:08:48 +0000
Received: from BY2NAM03FT008.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::209) by DM5PR12CA0071.outlook.office365.com
 (2603:10b6:3:103::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.11 via Frontend
 Transport; Tue, 7 May 2019 04:08:47 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT008.mail.protection.outlook.com (10.152.84.101) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Tue, 7 May 2019 04:08:47 +0000
Received: from bb-VirtualBox.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 6 May 2019
 23:08:43 -0500
From: Trigger Huang <Trigger.Huang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdgpu: Skip IH reroute in Vega20 SR-IOV VF
Date: Tue, 7 May 2019 12:08:35 +0800
Message-ID: <1557202115-24444-3-git-send-email-Trigger.Huang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557202115-24444-1-git-send-email-Trigger.Huang@amd.com>
References: <1557202115-24444-1-git-send-email-Trigger.Huang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(376002)(346002)(396003)(2980300002)(428003)(189003)(199004)(356004)(48376002)(50226002)(50466002)(4326008)(53936002)(7696005)(51416003)(70206006)(316002)(2351001)(72206003)(6666004)(478600001)(4744005)(36756003)(76176011)(16586007)(53416004)(8676002)(8936002)(81166006)(81156014)(2906002)(70586007)(446003)(426003)(486006)(11346002)(476003)(126002)(305945005)(86362001)(68736007)(26005)(2616005)(47776003)(5660300002)(336012)(186003)(6916009)(77096007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1151; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9287222c-c317-47f3-0fa4-08d6d2a1b45f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:MWHPR12MB1151; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1151:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1151662FCD19B3715188D253FE310@MWHPR12MB1151.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-Forefront-PRVS: 0030839EEE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: mis5ZinpRnb6gBTjWTuD85TQKwQ04HT80flfg6MSUZZuspQQIrPMpjVB+YpoFD0dEE0R8q+cpiAPW1hcmxiB9bsv9Uivnn/I37ZFJGG901h6B2IPHITlkdFCkYyZ3RvyDWAHNyC0Ly69M/3Dd0BKMVeyCD36A7835kYG/wOz/dYVLaSL4aezOWcKIAac7fnmJIxujfTHD3GC6hYt//T6bi+L4ZBtLxmsfcepbG7innciMEMK3UVTLhoYV8jR6KK9e+pvLQF7+qq/9gpOQVLNOsL3KXnUWetLNrHlGMYl5rBx6v16jcurRZY0XSzHNX8YPkAqIYSjJugmr8Eoq1W4GyvDpnQ5Z7wgERTtz6jPfzj8u/lbYk4zEpw1m5VSd4TcrEI+3kuk3eJ7WGiPZQUFRGmFSkkGwjnKZ8q5pZxEdtw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2019 04:08:47.5388 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9287222c-c317-47f3-0fa4-08d6d2a1b45f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1151
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lW/bIohainafHy/jvm21GOY2mgytcYZXfmsZlGEd96Q=;
 b=0OTqM4taGf6R5o5LnEx9v5pNvyrXsS+3StMkpzSXlUDt4HbtOqKu8wL2qqS4/vY20seahhxPWlnlA2cRUzFoypVuOWV9AYocTEt26o0zgAYBDWDeS5yac2EWJVo7K4bQhxQcKV4+szODLyEb0b3NWVEKx2XElWbvPUAsS8I1Z5Y=
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

SUggcmVyb3V0ZSBjb21tYW5kcyBhcmUgbm90IHN1cHBvcnRlZCBvbiBWZWdhMjAgVkYKClNpZ25l
ZC1vZmYtYnk6IFRyaWdnZXIgSHVhbmcgPFRyaWdnZXIuSHVhbmdAYW1kLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3BzcF92MTFfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMV8wLmMK
aW5kZXggYjkxZGY3Yi4uNGJkZDcwYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvcHNwX3YxMV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3Yx
MV8wLmMKQEAgLTIzMiw2ICsyMzIsMTAgQEAgc3RhdGljIHZvaWQgcHNwX3YxMV8wX3Jlcm91dGVf
aWgoc3RydWN0IHBzcF9jb250ZXh0ICpwc3ApCiAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYg
PSBwc3AtPmFkZXY7CiAJdWludDMyX3QgdG1wOwogCisJLyogcmVyb3V0ZV9paCBpcyBub3Qgc3Vw
cG9ydGVkIG9uIFNSX0lPViBWRiAqLworCWlmIChhbWRncHVfc3Jpb3ZfdmYoYWRldikpCisJCXJl
dHVybjsKKwogCS8qIENoYW5nZSBJSCByaW5nIGZvciBWTUMgKi8KIAl0bXAgPSBSRUdfU0VUX0ZJ
RUxEKDAsIElIX0NMSUVOVF9DRkdfREFUQSwgQ1JFRElUX1JFVFVSTl9BRERSLCAweDEyNDRiKTsK
IAl0bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwgSUhfQ0xJRU5UX0NGR19EQVRBLCBDTElFTlRfVFlQ
RSwgMSk7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
