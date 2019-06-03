Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A54432EE1
	for <lists+amd-gfx@lfdr.de>; Mon,  3 Jun 2019 13:43:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E91789129;
	Mon,  3 Jun 2019 11:43:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750055.outbound.protection.outlook.com [40.107.75.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF09589129
 for <amd-gfx@lists.freedesktop.org>; Mon,  3 Jun 2019 11:43:11 +0000 (UTC)
Received: from MWHPR12CA0070.namprd12.prod.outlook.com (2603:10b6:300:103::32)
 by BN6PR12MB1266.namprd12.prod.outlook.com (2603:10b6:404:14::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.22; Mon, 3 Jun
 2019 11:43:10 +0000
Received: from DM3NAM03FT039.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::208) by MWHPR12CA0070.outlook.office365.com
 (2603:10b6:300:103::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1943.16 via Frontend
 Transport; Mon, 3 Jun 2019 11:43:09 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT039.mail.protection.outlook.com (10.152.83.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1943.19 via Frontend Transport; Mon, 3 Jun 2019 11:43:08 +0000
Received: from bb-VirtualBox.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Mon, 3 Jun 2019
 06:43:07 -0500
From: Trigger Huang <Trigger.Huang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Hardcode reg access using L1 security
Date: Mon, 3 Jun 2019 19:43:03 +0800
Message-ID: <1559562183-29241-1-git-send-email-Trigger.Huang@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(346002)(136003)(39860400002)(396003)(2980300002)(428003)(189003)(199004)(356004)(6666004)(478600001)(2906002)(72206003)(86362001)(48376002)(14444005)(50466002)(47776003)(36756003)(15650500001)(6916009)(51416003)(7696005)(68736007)(70206006)(70586007)(2616005)(486006)(126002)(476003)(50226002)(53936002)(305945005)(53416004)(8936002)(81156014)(81166006)(8676002)(2351001)(16586007)(336012)(426003)(4326008)(186003)(5660300002)(77096007)(26005)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1266; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11090d54-5b2a-412d-5729-08d6e818a689
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:BN6PR12MB1266; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1266:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1266957181C808FB0B2DC70CFE140@BN6PR12MB1266.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-Forefront-PRVS: 0057EE387C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: FMKu1QSyDR7ZfDCgDZlG84MRiCJ1GDG4CqwCQj+XmAsVOlU05D1yz0Vhm6sC1nfBzgUB/OVerX9mLGDG8bmMa1r22EzKeb5RV7PNf5/6+HXD8abvMNlFO37yLn93nRuyYeaMHmammEIN86eeF2GsgJd8tlSZunClvQ5QKRKqKRIZgjNToyfgSK1aiBHVF86lBCkU16OiKbEHGVZz1SdOyQbKhF1rk5wUntegPESN2txdkRKDg1PqJMNkDDkcIh5TFJ9/A0DY1uFTLvLHRkuECEzqV2/668eArH+85Dn2zemoPT0XZwLVgoLNHjQxvQhPGUvmXpVRSmZl1put/I5AOPG+VBzfXGHIazyaLr6mG0mGvwDDRx7g/QC11wqRlDsgoenJfO4lz6q585meTSbFp4F9/IUEjE73hIF3WblsDlo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2019 11:43:08.9430 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11090d54-5b2a-412d-5729-08d6e818a689
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1266
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Yyc0AaFGx3yOrSYBtggdD4H6QSPJZnHSuqAkFPFXDU=;
 b=Gz6abW4ocFNuJvpu/1pXT3brugIRIbiWNHyKrkAQZG+gL7qsvyULGrp2aJSBppj5qaIK2uL03N8IlLjyojf0lmJl6e0th5Mt+UtyH+0mZFafNAnHM6DQjuNUsOx3r+hjKeSGyC7WjVXlCWWRZQ1Wvj3lxqMNYUkIrGg2uV8G9VE=
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

VW5kZXIgVmVnYTEwIFNSLUlPViBWRiwgTDEgcmVnaXN0ZXIgYWNjZXNzIG1vZGUgc2hvdWxkIGJl
IGVuYWJsZWQgYnkKZGVmYXVsdCBhcyB0aGUgbm9uLXNlY3VyaXR5IFZGIHdpbGwgbm8gbG9uZ2Vy
IGJlIHN1cHBvcnRlZC4KClNpZ25lZC1vZmYtYnk6IFRyaWdnZXIgSHVhbmcgPFRyaWdnZXIuSHVh
bmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9teGdwdV9haS5jIHwg
MTUgKysrKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA5IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L214Z3B1
X2FpLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9teGdwdV9haS5jCmluZGV4IDMxMDMw
ZjguLjIzNTU0OGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L214Z3B1
X2FpLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbXhncHVfYWkuYwpAQCAtNDUx
LDE5ICs0NTEsMTYgQEAgdm9pZCB4Z3B1X2FpX21haWxib3hfcHV0X2lycShzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldikKIAogc3RhdGljIHZvaWQgeGdwdV9haV9pbml0X3JlZ19hY2Nlc3NfbW9k
ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHsKLQl1aW50MzJfdCBybGNfZndfdmVyID0g
UlJFRzMyX1NPQzE1KEdDLCAwLCBtbVJMQ19HUE1fR0VORVJBTF82KTsKLQl1aW50MzJfdCBzb3Nf
ZndfdmVyID0gUlJFRzMyX1NPQzE1KE1QMCwgMCwgbW1NUDBfU01OX0MyUE1TR181OCk7Ci0KIAlh
ZGV2LT52aXJ0LnJlZ19hY2Nlc3NfbW9kZSA9IEFNREdQVV9WSVJUX1JFR19BQ0NFU1NfTEVHQUNZ
OwogCi0JaWYgKHJsY19md192ZXIgPj0gMHg1ZCkKLQkJYWRldi0+dmlydC5yZWdfYWNjZXNzX21v
ZGUgfD0gQU1ER1BVX1ZJUlRfUkVHX0FDQ0VTU19STEM7CisJLyogRW5hYmxlIEwxIHNlY3VyaXR5
IHJlZyBhY2Nlc3MgbW9kZSBieSBkZWZhdWwsICBhcyBub24tc2VjdXJpdHkgVkYKKwkgKiB3aWxs
IG5vIGxvbmdlciBiZSBzdXBwb3J0ZWQuCisJICovCisJYWRldi0+dmlydC5yZWdfYWNjZXNzX21v
ZGUgfD0gQU1ER1BVX1ZJUlRfUkVHX0FDQ0VTU19STEM7CiAKLQlpZiAoc29zX2Z3X3ZlciA+PSAw
eDgwNDU1KQotCQlhZGV2LT52aXJ0LnJlZ19hY2Nlc3NfbW9kZSB8PSBBTURHUFVfVklSVF9SRUdf
QUNDRVNTX1BTUF9QUkdfSUg7CisJYWRldi0+dmlydC5yZWdfYWNjZXNzX21vZGUgfD0gQU1ER1BV
X1ZJUlRfUkVHX0FDQ0VTU19QU1BfUFJHX0lIOwogCi0JaWYgKHNvc19md192ZXIgPj0gMHg4MDQ1
YikKLQkJYWRldi0+dmlydC5yZWdfYWNjZXNzX21vZGUgfD0gQU1ER1BVX1ZJUlRfUkVHX1NLSVBf
U0VFVElORzsKKwlhZGV2LT52aXJ0LnJlZ19hY2Nlc3NfbW9kZSB8PSBBTURHUFVfVklSVF9SRUdf
U0tJUF9TRUVUSU5HOwogfQogCiBjb25zdCBzdHJ1Y3QgYW1kZ3B1X3ZpcnRfb3BzIHhncHVfYWlf
dmlydF9vcHMgPSB7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
