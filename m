Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC155AF178
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 21:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B944D6E967;
	Tue, 10 Sep 2019 19:04:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740073.outbound.protection.outlook.com [40.107.74.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 625376E960
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 19:04:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bukIuTmoX3dvKhMmN6WhYyBkYqoNEuhIfTGmoPZ9ZsnWr0G+tLxngE3+Kq66zt42DZqjpKicxv9QfeJ5t4ti5iqOjHl7PZZbIo9ttQP5hbBB7MtVPlB9fQ/VMJoFU0k7LHGe3zVC171QuOGqGR89JPMGNZT0DVSJQvU1Tgwtmw4n4bRDr+HqHl7AMZThGieKqw6/gD6q4I+jrRuoVk2k5XeBVbkYhXJT0vo+XsCeFg2pD7nlBehZcLH4sS5OC3WzyufQdyh48stmiqNBNCxmYGBHDoHoshpi/9ic9CNYZKnHHfWF4SWknPKKIi/lwJu7no7zsWA5I5HjWDkb3YsNLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1YI80+OLtr91UQnmBq4PFYB72wgsaayWFdbQNQpcXg=;
 b=YrS5lbyQz4IMmx4NYhEf90Se5VgoAqZ/wdfiQooZiLxip0/Ltvj1gX0tNxWo1kTqh/gh1q1K9QTPKWBCOLxvBZ3TRj2URrWujZj3CeIJ2I4HabJvnUlpwP9MdVt7TlbcRuFC4+l8rZ1jSyKP0VUQy5hZBNDGhknxmXjCa0o09wb1fsCx/kSC/CSrQqvkebzi5zHqxueCLQoX90L0hw7HevUt/b9AZAVozQZN2Y3Q4Gh0GI2841Vz084FklQ7wU6QS8YYqZNZvCiM8HToPJIf9buy68iqc1ICp0pZmUVVzX6BAtfOWuhT82UpV/qgPeiEum+n22zzvhHFzWhivkYI0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0024.namprd12.prod.outlook.com
 (2603:10b6:301:4a::34) by BY5PR12MB4147.namprd12.prod.outlook.com
 (2603:10b6:a03:205::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.15; Tue, 10 Sep
 2019 19:04:41 +0000
Received: from DM3NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::202) by MWHPR1201CA0024.outlook.office365.com
 (2603:10b6:301:4a::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2241.14 via Frontend
 Transport; Tue, 10 Sep 2019 19:04:41 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT048.mail.protection.outlook.com (10.152.83.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 19:04:41 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 10 Sep 2019
 14:04:36 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 20/20] drm/amd/display: Add hdcp to Kconfig
Date: Tue, 10 Sep 2019 15:04:22 -0400
Message-ID: <20190910190422.794-21-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910190422.794-1-Bhawanpreet.Lakha@amd.com>
References: <eb83ae25-7635-45de-72dc-db24571066d2@amd.com>
 <20190910190422.794-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(346002)(396003)(2980300002)(428003)(199004)(189003)(316002)(8936002)(4744005)(446003)(476003)(11346002)(2616005)(81156014)(81166006)(4326008)(26005)(126002)(186003)(53936002)(426003)(6916009)(36756003)(76176011)(51416003)(486006)(336012)(50466002)(48376002)(5660300002)(50226002)(47776003)(7696005)(70206006)(16586007)(1076003)(70586007)(86362001)(53416004)(2351001)(305945005)(6666004)(8676002)(356004)(478600001)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB4147; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b76db5b6-03af-4ca1-29ed-08d73621bc00
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BY5PR12MB4147; 
X-MS-TrafficTypeDiagnostic: BY5PR12MB4147:
X-Microsoft-Antispam-PRVS: <BY5PR12MB4147C9704FDCB98F70CA6129F9B60@BY5PR12MB4147.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: eDQyyHynTV9xRcyW04ujZZFFyt6ojGxrX1T4Vyl37j2SvaK3zGQLi2K8FkmasLSIiCY3qOV69BXXXENgLOhT9/sILtL+hAB2DtjJfFcnRzAbwJczKUJBX1iHhSI0BVeuBrHjQlduBxAl5TrMxvJ50VzurxM4kzbAa/RPH0/RnlU4G4m5YJkhmS0JVABwDw4mvZ5+Pvinj6cINzUDEt/y+5iB9rLf9SHmj/S25OPWPKzhDsIjyJ49CMx3sO5V6CreKdwz3t475EbS3weUMNAgssaTu3HDQxsRK9fgXhtvIIiKpNov//E+wyFYsKcuzT5gMzI7Zn+LckYmc9lQRnCsNYz/+Cb++FlgYxoma+2D7d/qbtz+VsmLQPGSnH/sKHwVYdRCN/XznBCXKZSvSVyVqrP1VQHjGpLW3MDMYPrn0Us=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 19:04:41.1221 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b76db5b6-03af-4ca1-29ed-08d73621bc00
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4147
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1YI80+OLtr91UQnmBq4PFYB72wgsaayWFdbQNQpcXg=;
 b=Q1QX6vHmT7aGq5EjNlRyDORd91+vbZtdplJgWjsIZwmzz80C8WdHYhRZAvMmBCCg9/OG2A3Neyzetgse4aszepF3eq+1nmxi6GNXWpIIlacafrz98HNA4n/LqjeL4pJgHxoew5Yu1v29ZYfYaiUOZ+XOWaEsjbQZXCESWOwgPlE=
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KSERDUCBpcyBub3QgZnVsbHkgZmluaXNoZWQsIHNvIHdlIG5lZWQgdG8gYmUgYWJsZSB0
bwpidWlsZCBhbmQgcnVuIHRoZSBkcml2ZXIgd2l0aG91dCBpdC4KCltIb3ddCkFkZCBhIEtjb25m
aWcgdG8gdG9nZ2xlIGl0CgpTaWduZWQtb2ZmLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2Fu
cHJlZXQuTGFraGFAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53
ZW50bGFuZEBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9LY29uZmln
IHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L0tjb25maWcKaW5kZXggODE1NGZkNjM3YWZiLi5iNDUwNDI1Nzg3M2EgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9LY29uZmlnCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9LY29uZmlnCkBAIC00Myw2ICs0MywxNCBAQCBjb25maWcg
RFJNX0FNRF9EQ19EU0NfU1VQUE9SVAogCSAgICBDaG9vc2UgdGhpcyBvcHRpb24gaWYgeW91IHdh
bnQgdG8gaGF2ZQogCSAgICBEeW5hbWljIFN0cmVhbSBDb21wcmVzc2lvbiBzdXBwb3J0CiAKK2Nv
bmZpZyBEUk1fQU1EX0RDX0hEQ1AKKyAgICAgICAgYm9vbCAiRW5hYmxlIEhEQ1Agc3VwcG9ydCBp
biBEQyIKKyAgICAgICAgZGVwZW5kcyBvbiBEUk1fQU1EX0RDCisgICAgICAgIGhlbHAKKyAgICAg
ICAgIENob29zZSB0aGlzIG9wdGlvbgorICAgICAgICAgaWYgeW91IHdhbnQgdG8gc3VwcG9ydAor
ICAgICAgICAgSERDUCBhdXRoZW50aWNhdGlvbgorCiBjb25maWcgREVCVUdfS0VSTkVMX0RDCiAJ
Ym9vbCAiRW5hYmxlIGtnZGIgYnJlYWsgaW4gREMiCiAJZGVwZW5kcyBvbiBEUk1fQU1EX0RDCi0t
IAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
