Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8A08785A
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 13:27:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C9536ED9D;
	Fri,  9 Aug 2019 11:27:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700087.outbound.protection.outlook.com [40.107.70.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0016ED98
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 11:27:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FJC9x67uqE9GL2tBLyHF0S4FtXOGG87f7jtW4MdvrwI1WFp/Nnw04gbj5jI91EMPnk7CSOZZhUMib9lVw9hZd8uibPEYn54F8aJq4FmLqZW1sNoAcWBTP3zBS3LVhnAnZSTSbrzvATKLXUQSQcq0440lfmYpG7rXYePosZZ95iM5XY6h+kDgyvH05VlyGPGpk1/TwEf0sSXJ+4qpEjRIZpxfewYRWqKdqg3C1guSU7Ql2hFZbF4lfOGKGA7KgiFqGXXL7NTfYqzgQNgExgAj6f1MniXE7jt54UqB2LQGLWdgbzO9ZP+TWFyeFXYjHiLO54/KtmzrxznLnWAlK7/8PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J95msjuYxPsk5OxXd1TZxO4vR70F3yUxMJd0VLuU85Y=;
 b=H8YY6CghsrAAmtJXHqfQe3II8tljEdcRQnlPA8QZ/W/sO6EXgf5K2PXKkLNrMpq1cCNtHjQj2HlPuJe39wXfCpIkkbrn/qTnTr/XZrY8jIc6ioBW20TqcORdxz/9OJiiu7Mwh+O5tAgdmU7Z0fNnUkzuPr1vaLSRRZlIfThF3UeHWrmaI8JAYrvEYo4oj8A9VXXFtO7BcF5uz7v8Qd2Ms4I285fiqihAKENIS2GE++rNBQLTOt4lLVUkNTTmFsCobP/0ba8oUvKs9bD4CI0wZU9UsyPRgUX+2j7YsFbAzruaQj1vZZTD5rAQVSqU9h4kK9fMvR7NT/d6ihN6Gr2jHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR12CA0052.namprd12.prod.outlook.com (2603:10b6:300:103::14)
 by BN7PR12MB2705.namprd12.prod.outlook.com (2603:10b6:408:25::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.15; Fri, 9 Aug
 2019 11:27:09 +0000
Received: from DM3NAM03FT033.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::207) by MWHPR12CA0052.outlook.office365.com
 (2603:10b6:300:103::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.15 via Frontend
 Transport; Fri, 9 Aug 2019 11:27:08 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT033.mail.protection.outlook.com (10.152.82.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Fri, 9 Aug 2019 11:27:07 +0000
Received: from localhost.localdomain (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Fri, 9 Aug 2019
 06:27:06 -0500
From: Le Ma <le.ma@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 4/4] drm/amdgpu: enable mmhub clock gating for Arcturus
Date: Fri, 9 Aug 2019 19:26:56 +0800
Message-ID: <1565350016-7071-4-git-send-email-le.ma@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565350016-7071-1-git-send-email-le.ma@amd.com>
References: <1565350016-7071-1-git-send-email-le.ma@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(136003)(376002)(39860400002)(2980300002)(428003)(199004)(189003)(81156014)(86362001)(316002)(6916009)(305945005)(16586007)(36756003)(8936002)(81166006)(486006)(2616005)(11346002)(70206006)(2351001)(476003)(446003)(70586007)(126002)(44832011)(47776003)(2906002)(51416003)(336012)(76176011)(186003)(5660300002)(48376002)(4326008)(8676002)(426003)(26005)(49486002)(478600001)(50466002)(356004)(53936002)(50226002)(6666004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2705; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a92f1d3-cb81-4e82-019e-08d71cbc836a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN7PR12MB2705; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2705:
X-Microsoft-Antispam-PRVS: <BN7PR12MB27055515E2515F7D1B11A1ECF6D60@BN7PR12MB2705.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:361;
X-Forefront-PRVS: 01244308DF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: LHW41ZJbBMsfhULNCV9pIqHKKuOAeZoCF//nm2fsyaeq34SNmXK1Qji27sCOjRalQOs2/PkA4OR0gHqhfwmHcB1Ll4gYqqyj8hnZcHFtRjy+0FSf1i6dX2DenIAdW5fv2MMFDlYo0/Pvk44ImNqQFgxIa5ANM+RgcCtmoeykpSF9F9GpWakVZBz5kKYm3mikggq9ZzitUBGEm9T8UQL2QmDCPxOmjmKmOd6GyMNe5C/HzTJF8DwzFWFGcRxmjZoxHgy2bLrR4uHgP1/OTbRvsyQYiE43KbwKv3dvP4Y5J0aMK/i2E99/mlXYRx+lUUj9/FePbIfDWvuH8VXXUzk0PxWdqi0Czp1D3uP1TxVK1tFEowHN+YruZff7IMDkB27U5xmQd5WFH74G0zcQeLNfpGFQsmyFn7bp/A7iY5cFUrQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 11:27:07.7834 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a92f1d3-cb81-4e82-019e-08d71cbc836a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2705
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J95msjuYxPsk5OxXd1TZxO4vR70F3yUxMJd0VLuU85Y=;
 b=JUUq3QhLnoSUf5qgwN/4hO4g4J1miuW01a24ocyIO1mIIOEsGnhAUv9vqueiIH6bMFv95QbLwQFlGrL/hrxkXCH6wCXFX0SMs97ah9UVKwFtMJQc7kuSjzbRQeilu7WrNNrm7z3ScRUYG8w+isHHEEgjie3hhq9X4Qa5nmklBD4=
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
Cc: Le Ma <le.ma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SW5pdCBNQ19NR0NHL0xTIGZsYWcuIEFsc28gYXBwbHkgdG8gYXRodWIgQ0cuCgpDaGFuZ2UtSWQ6
IEljMDBjYjhlNmQ2OWViNzVkZDMyZjM0Zjc3ODM1MmNlZTkzMDYzZWUwClNpZ25lZC1vZmYtYnk6
IExlIE1hIDxsZS5tYUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21t
aHViX3Y5XzQuYyB8IDEgLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyAgICAg
IHwgNCArKystCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92OV80LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92OV80LmMKaW5kZXggZTUyZTRkMS4u
MGNmN2VmNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjlf
NC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3Y5XzQuYwpAQCAtNjE1
LDcgKzYxNSw2IEBAIGludCBtbWh1Yl92OV80X3NldF9jbG9ja2dhdGluZyhzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiwKIAlyZXR1cm4gMDsKIH0KIAotLyogVE9ETzogZ2V0IDIgbW1odWIgaW5z
dGFuY2VzIENHIHN0YXRlICovCiB2b2lkIG1taHViX3Y5XzRfZ2V0X2Nsb2NrZ2F0aW5nKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2LCB1MzIgKmZsYWdzKQogewogCWludCBkYXRhLCBkYXRhMTsK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCmluZGV4IGFlY2JhMWMuLjIzNWNiNWIgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYwpAQCAtMTEyNiw3ICsxMTI2LDkgQEAgc3RhdGljIGlu
dCBzb2MxNV9jb21tb25fZWFybHlfaW5pdCh2b2lkICpoYW5kbGUpCiAJCQlBTURfQ0dfU1VQUE9S
VF9IRFBfTUdDRyB8CiAJCQlBTURfQ0dfU1VQUE9SVF9IRFBfTFMgfAogCQkJQU1EX0NHX1NVUFBP
UlRfU0RNQV9NR0NHIHwKLQkJCUFNRF9DR19TVVBQT1JUX1NETUFfTFM7CisJCQlBTURfQ0dfU1VQ
UE9SVF9TRE1BX0xTIHwKKwkJCUFNRF9DR19TVVBQT1JUX01DX01HQ0cgfAorCQkJQU1EX0NHX1NV
UFBPUlRfTUNfTFM7CiAJCWFkZXYtPnBnX2ZsYWdzID0gMDsKIAkJYWRldi0+ZXh0ZXJuYWxfcmV2
X2lkID0gYWRldi0+cmV2X2lkICsgMHgzMjsKIAkJYnJlYWs7Ci0tIAoyLjcuNAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
