Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D44FA10184
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 23:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0297F8926B;
	Tue, 30 Apr 2019 21:10:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on0628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::628])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A9D89254
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 21:10:03 +0000 (UTC)
Received: from DM3PR12CA0106.namprd12.prod.outlook.com (2603:10b6:0:55::26) by
 BL0PR12MB2369.namprd12.prod.outlook.com (2603:10b6:207:4d::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.14; Tue, 30 Apr 2019 21:10:01 +0000
Received: from BY2NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::200) by DM3PR12CA0106.outlook.office365.com
 (2603:10b6:0:55::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Tue, 30 Apr 2019 21:10:01 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT009.mail.protection.outlook.com (10.152.84.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1835.14 via Frontend Transport; Tue, 30 Apr 2019 21:10:00 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Apr 2019
 16:09:51 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 11/20] drm/amd/display: 3.2.29
Date: Tue, 30 Apr 2019 17:09:19 -0400
Message-ID: <20190430210938.32335-22-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
References: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(376002)(136003)(39860400002)(346002)(2980300002)(428003)(189003)(199004)(305945005)(2616005)(486006)(48376002)(50466002)(126002)(86362001)(476003)(4744005)(72206003)(11346002)(77096007)(50226002)(1076003)(36756003)(446003)(6916009)(2351001)(5660300002)(426003)(81156014)(81166006)(14444005)(8676002)(4326008)(478600001)(26005)(356004)(6666004)(336012)(186003)(316002)(68736007)(7696005)(8936002)(76176011)(16586007)(2906002)(51416003)(47776003)(70206006)(70586007)(53936002)(53416004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2369; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ccc657c-d5e8-4b68-2e0a-08d6cdb03545
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BL0PR12MB2369; 
X-MS-TrafficTypeDiagnostic: BL0PR12MB2369:
X-Microsoft-Antispam-PRVS: <BL0PR12MB23694322506B4D84808760AEF93A0@BL0PR12MB2369.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 00235A1EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: wNw1GtRUG0cM2NjQm9jPT32xt3r28mBASPTjS5yHydlMe+HXJ/aZzD6h7FSoUWnfladRpus4XtNcdTBa73Ism9ObDYu2XiGXS3DFdD33Mfzcg4+2PFNIzNu8il15C3BCpM/Y9R+9Ms+u5QKzXrItriDzY5qZao1rSeeoAepZSuUC8lnix5SMAGHfW2BVrfGiPF2tYMou/yM4QVqcnKeUUy04DbWd+z7WP80EX76vfSv0uk93Sn6uhf3pRfuhbj0cfqkgpQGLDmkOhdOnVa4w78XTkyL8pNmphJYZS23Cf+5spQr7AlGZtwnvyhlFTxMaUF2boOS3YKNPEbKqOMolaF0CtlTk2JEYaKXxnmOgan3L7U3EVaJLqIp0fYYbCPwlkyJ6yBsLzuNbZoUc70bWx+sVx2HGbde6ZB2UL7nhyt0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2019 21:10:00.8696 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ccc657c-d5e8-4b68-2e0a-08d6cdb03545
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2369
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cs5icN5YOtlxQDZNKbCzuKrm4ugW5T/2Sh63Tlj4myc=;
 b=SD+NAhsbuCco5cfa6Zeb6e2uORicZ/3Exz4YGgAYpgrQFniejQ6kQVIrdgE1LC1ZEdo8LtC/70O3+nsQ9wbzyUKejexN5F9Vs0XTP+9pMNX3RXs7bGlHZe7YoUtkmPpQdwVes52ITKyNvdU07G4igtkqpROk/P+uQv7Np3rFDBQ=
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
Cc: Aric Cyr <aric.cyr@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQXJpYyBDeXIgPGFyaWMuY3lyQGFtZC5jb20+CgpDaGFuZ2UtSWQ6IEk1ZWM1NDBjODNi
YjFiYjAxZWZiNWE2N2Q5ZGQxN2E1MThlZjZlZGFmClNpZ25lZC1vZmYtYnk6IEFyaWMgQ3lyIDxh
cmljLmN5ckBhbWQuY29tPgpSZXZpZXdlZC1ieTogQXJpYyBDeXIgPEFyaWMuQ3lyQGFtZC5jb20+
CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQgTGFraGFAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaCB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjLmgKaW5kZXggYTM3MTkyMWI3YzUzLi5mYjU3M2Y0ODNjYjUgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kYy5oCkBAIC00Miw3ICs0Miw3IEBACiAjaW5jbHVkZSAiaW5jL2h3
L2RtY3UuaCIKICNpbmNsdWRlICJkbWwvZGlzcGxheV9tb2RlX2xpYi5oIgogCi0jZGVmaW5lIERD
X1ZFUiAiMy4yLjI4IgorI2RlZmluZSBEQ19WRVIgIjMuMi4yOSIKIAogI2RlZmluZSBNQVhfU1VS
RkFDRVMgMwogI2RlZmluZSBNQVhfUExBTkVTIDYKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
