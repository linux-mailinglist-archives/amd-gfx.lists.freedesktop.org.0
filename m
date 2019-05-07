Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 553D715846
	for <lists+amd-gfx@lfdr.de>; Tue,  7 May 2019 06:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6BB489C89;
	Tue,  7 May 2019 04:08:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770087.outbound.protection.outlook.com [40.107.77.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D175089C89
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 May 2019 04:08:45 +0000 (UTC)
Received: from DM5PR12CA0071.namprd12.prod.outlook.com (2603:10b6:3:103::33)
 by DM5PR12MB1147.namprd12.prod.outlook.com (2603:10b6:3:79::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.11; Tue, 7 May
 2019 04:08:44 +0000
Received: from BY2NAM03FT008.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::209) by DM5PR12CA0071.outlook.office365.com
 (2603:10b6:3:103::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.11 via Frontend
 Transport; Tue, 7 May 2019 04:08:43 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT008.mail.protection.outlook.com (10.152.84.101) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Tue, 7 May 2019 04:08:43 +0000
Received: from bb-VirtualBox.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 6 May 2019
 23:08:41 -0500
From: Trigger Huang <Trigger.Huang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amdgpu: Skip IH reroute in Vega10 SR-IOV VF
Date: Tue, 7 May 2019 12:08:34 +0800
Message-ID: <1557202115-24444-2-git-send-email-Trigger.Huang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557202115-24444-1-git-send-email-Trigger.Huang@amd.com>
References: <1557202115-24444-1-git-send-email-Trigger.Huang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(346002)(39860400002)(376002)(396003)(2980300002)(428003)(189003)(199004)(26005)(2616005)(77096007)(476003)(6916009)(70206006)(446003)(426003)(68736007)(11346002)(72206003)(186003)(53936002)(16586007)(7696005)(4326008)(81156014)(81166006)(36756003)(336012)(316002)(8936002)(8676002)(478600001)(50226002)(47776003)(53416004)(70586007)(486006)(5660300002)(51416003)(305945005)(2906002)(356004)(86362001)(126002)(2351001)(76176011)(4744005)(6666004)(50466002)(48376002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1147; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac95358a-fbb9-4f02-c443-08d6d2a1b1ec
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:DM5PR12MB1147; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1147:
X-Microsoft-Antispam-PRVS: <DM5PR12MB11472E97EFF453E487D0C7E0FE310@DM5PR12MB1147.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-Forefront-PRVS: 0030839EEE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: q1sMCoFsSEuqDV5th/2niaFu4hvZjs331Y5eES5Uuh057lb62XZtM7Nb/JU+vTIcqqHPL5URj24QJM1Pz7Y/dDy8AXYfInwaI4I8Q1PfWZjFyYibvN1XKvnedfWsHkNfN4NINJ3ka/7xffIRrwpFJcUh/tQRM6W5M3h6LDOP1A8oq+TUnZM9yFw31G3pLS0h1HbPwLjjFx1w/4WYePRb8ieQhG8OedsCgNSzLW7qOncHKjGXf4tcnNSbFdhb9AQns1XunmUFBU67jTMTMAG1eoF8f3Ze1AQT+qxUy889EpeeV2qf7nr4Zaxkk7sJ1F9fJDtwm2fVhFMVLEk2Gnnsb5hIN1yblplBDiGbDhRnzIn135Gomr+MMD063RmL/pkC/jpCfBND/WkoqQmXJaVgJRzfmuhTdrVvJnlqNrNziik=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2019 04:08:43.3543 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac95358a-fbb9-4f02-c443-08d6d2a1b1ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1147
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+vOlHBcKPqtF8p45gVKAuMBVrSsQUOHqmjpaR4svoA=;
 b=Nv84S+RjM8ulVk25K2/TRjRLCUQ3lbFB9uIjTCnIvWuSonyDzon39ifoTN5rS/M3Z9GxmCXtJtj34yLWsDQEYaDDwMDkZvjqY4QnwaIgxm+F3W9vuAhHao3SlYRqUGKjlfI3l2ELwrHpLXYPi+aQhpBVJeVnF3NtFqOKosiQLpE=
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

SUggcmVyb3V0ZSBjb21tYW5kcyBhcmUgbm90IHN1cHBvcnRlZCBvbiBWZWdhMTAgVkYKClNpZ25l
ZC1vZmYtYnk6IFRyaWdnZXIgSHVhbmcgPFRyaWdnZXIuSHVhbmdAYW1kLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjNfMS5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvcHNwX3YzXzEuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92M18xLmMKaW5k
ZXggMTQzZjBmYS4uOWQ2ZTYwMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvcHNwX3YzXzEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjNfMS5j
CkBAIC0yNjAsNiArMjYwLDEwIEBAIHN0YXRpYyB2b2lkIHBzcF92M18xX3Jlcm91dGVfaWgoc3Ry
dWN0IHBzcF9jb250ZXh0ICpwc3ApCiAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBwc3At
PmFkZXY7CiAJdWludDMyX3QgdG1wOwogCisJLyogcmVyb3V0ZV9paCBpcyBub3Qgc3VwcG9ydGVk
IG9uIFNSX0lPViBWRiAqLworCWlmIChhbWRncHVfc3Jpb3ZfdmYoYWRldikpCisJCXJldHVybjsK
KwogCS8qIENoYW5nZSBJSCByaW5nIGZvciBWTUMgKi8KIAl0bXAgPSBSRUdfU0VUX0ZJRUxEKDAs
IElIX0NMSUVOVF9DRkdfREFUQSwgQ1JFRElUX1JFVFVSTl9BRERSLCAweDEyNDRiKTsKIAl0bXAg
PSBSRUdfU0VUX0ZJRUxEKHRtcCwgSUhfQ0xJRU5UX0NGR19EQVRBLCBDTElFTlRfVFlQRSwgMSk7
Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
