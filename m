Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C65BAEC78
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 15:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E00866E8FC;
	Tue, 10 Sep 2019 13:55:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730054.outbound.protection.outlook.com [40.107.73.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A9336E8F2
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 13:55:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=huYEJ/Y/yR/2O9HpgbPJ0xFpwRP1m8DvM5QeW1VZWERwhkNamQX5zo9wachaD9kneP4a7MdoYL8nBL3YERrsN3mI6H+ESeNn9kIBCgI443pS1pyx+/2xOkf3kNO6ytFXXOJvuXXB4jF3bCSNm3/a+KY5i2LAr1gdEMXszJ5w1q7nPR5AFHI/l8WhkeDxr8yREfGjmFT74L9QqidqwD//V4gvZOSnDnj9Oofk00wiEpkGQ+Hoa8Vq5l9mwkJ3k8BIIA00z59uVQcUgTP4YhSoXU9ZMkdqtvZrcEkkISZXyyUn1jWvRzuv7KZaNEwsk3hVMU05S9A0GqEHWz+sLOfo1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZT1pldyOiUhnaVNf/K/uVssTggNHOocmqEWq4U7XFQk=;
 b=G8B3bGDqpbVkB1N263DobycT8gxS80p5jcKNu59itqHYdmLRGjHEw1z5d7F9ZAxqZ28eZBboPLJfBO/Y8M00k5uaJxydQUs5qvPr+3PryYRr1a9GPMCQrarVGk0fCjV1YFsyXOGDMjWIqdxpxegGLhV5u+93B+2ZS8eYWDvPDmO+rLqOKg9NvkVRUxKkB0wDpNARRat1DnCcuCQFcFOb2H3ubNtuNOnLAPQCJga5oLrBtR3VvAMM7S6uxmf4xr2yv1f9xgqKN5tYbcCzpaDDEf2OFmEZ1OvPtw3YzL/QtuJVlTuP1GAg4gGxCmDgw+Mdu8CBFgd7EnjkKeU85o5WtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0136.namprd12.prod.outlook.com (2603:10b6:0:51::32) by
 DM6PR12MB3770.namprd12.prod.outlook.com (2603:10b6:5:1c4::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Tue, 10 Sep 2019 13:55:08 +0000
Received: from CO1NAM03FT047.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by DM3PR12CA0136.outlook.office365.com
 (2603:10b6:0:51::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2241.14 via Frontend
 Transport; Tue, 10 Sep 2019 13:55:08 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT047.mail.protection.outlook.com (10.152.81.48) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 13:55:08 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 10 Sep 2019 08:55:02 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 23/25] drm/amd/display: fix use of uninitialized variable
Date: Tue, 10 Sep 2019 09:54:43 -0400
Message-ID: <20190910135445.18300-24-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190910135445.18300-1-sunpeng.li@amd.com>
References: <20190910135445.18300-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(376002)(396003)(2980300002)(428003)(189003)(199004)(2351001)(49486002)(356004)(186003)(6666004)(2876002)(86362001)(6916009)(11346002)(126002)(2616005)(8936002)(53936002)(70586007)(336012)(426003)(50226002)(2870700001)(446003)(70206006)(486006)(26005)(1076003)(316002)(14444005)(4326008)(305945005)(478600001)(476003)(8676002)(81156014)(81166006)(47776003)(2906002)(50466002)(5660300002)(36756003)(48376002)(76176011)(51416003)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3770; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c376ac9d-31bb-4a9f-114e-08d735f67ddd
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM6PR12MB3770; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB3770:
X-Microsoft-Antispam-PRVS: <DM6PR12MB37705B572FC2B9F942EFE98C82B60@DM6PR12MB3770.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: vj0oMF5VCZOxw74ix1ozTH5b/95vn4zKJPoo52R4xvYxMRNAjltU+dS249qH1q7/cDtImk6cvGYOsFO2DJVTLjSoFn1hVJWuB1BGZovPpKFaK843q0pm6M6dcDizy44Y1y1sLoACO8XdANrK2gIaX03zXxRDztkwgfPWebq6fDqS+IcbvJKqmF6SYYKSjWhtd5yFuEjKMxKinRq1BVsdCOJYVUEpSTvWqzV5VptM7hHoIIeNiTCJp7pzR6etVdBsyfF3RsToKKCVD1C5zCJv79jC1MjJqvgOnDtqHNv+JBTWelThNps/CCy7inTkMFkqTE6ssgV/IMNrILspaefeojzOhasDfPXRsQZX2MKprRwsY5SDwYNV4pZdYK8GZVtfjPGK79t+0JE7EubLvwvi7Hwiyc5C4A4Z2TfqktEFfso=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 13:55:08.4109 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c376ac9d-31bb-4a9f-114e-08d735f67ddd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3770
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZT1pldyOiUhnaVNf/K/uVssTggNHOocmqEWq4U7XFQk=;
 b=jPlcwgyAK/fL2Ve2g7u90PjU/pUsuckdLtpqkTmi8OGm+QTrgIS798mxt/HxJRkAzymqv7J+9T//PPMMp2WuNMFXA3VN6xB4ppw08+oOrRaM7hF9OkA9FIDv4co6MtdRCmVijXfpIdEM8wJ9+/PPQqzCDiUbHjtVFspTA+8GZ0s=
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
Cc: Leo Li <sunpeng.li@amd.com>, Jaehyun Chung <Jaehyun.Chung@amd.com>,
 Martin Leung <martin.leung@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTWFydGluIExldW5nIDxtYXJ0aW4ubGV1bmdAYW1kLmNvbT4KCnRnX2luc3QgbWF5IGJl
IHVzZWQgdW5pbml0aWFsaXplZCwgc28gaW5pdGlhbGl6ZSBpdCB0byAwLgoKU2lnbmVkLW9mZi1i
eTogTWFydGluIExldW5nIDxtYXJ0aW4ubGV1bmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEphZWh5
dW4gQ2h1bmcgPEphZWh5dW4uQ2h1bmdAYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVu
Zy5saUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2Rj
LmMgICAgICAgICAgfCAyICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9k
Y19yZXNvdXJjZS5jIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2NvcmUvZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMKaW5k
ZXggY2FkYjI1NTgyNmJlLi5iNTJjNDU3ZDIwOWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2NvcmUvZGMuYwpAQCAtOTcxLDcgKzk3MSw3IEBAIGJvb2wgZGNfdmFsaWRhdGVfc2Vh
bWxlc3NfYm9vdF90aW1pbmcoY29uc3Qgc3RydWN0IGRjICpkYywKIHsKIAlzdHJ1Y3QgdGltaW5n
X2dlbmVyYXRvciAqdGc7CiAJc3RydWN0IGRjX2xpbmsgKmxpbmsgPSBzaW5rLT5saW5rOwotCXVu
c2lnbmVkIGludCBlbmNfaW5zdCwgdGdfaW5zdCwgaTsKKwl1bnNpZ25lZCBpbnQgaSwgZW5jX2lu
c3QsIHRnX2luc3QgPSAwOwogCiAJLy8gU2VhbWxlc3MgcG9ydCBvbmx5IHN1cHBvcnQgc2luZ2xl
IERQIGFuZCBFRFAgc28gZmFyCiAJaWYgKHNpbmstPnNpbmtfc2lnbmFsICE9IFNJR05BTF9UWVBF
X0RJU1BMQVlfUE9SVCAmJgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2NvcmUvZGNfcmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9j
b3JlL2RjX3Jlc291cmNlLmMKaW5kZXggYWY4NWQ2Y2Y0NDI3Li4yMzMxM2M4ODA4YjMgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3Jlc291cmNlLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfcmVzb3VyY2UuYwpA
QCAtMTg0NSw3ICsxODQ1LDcgQEAgc3RhdGljIGludCBhY3F1aXJlX3Jlc291cmNlX2Zyb21faHdf
ZW5hYmxlZF9zdGF0ZSgKIAkJc3RydWN0IGRjX3N0cmVhbV9zdGF0ZSAqc3RyZWFtKQogewogCXN0
cnVjdCBkY19saW5rICpsaW5rID0gc3RyZWFtLT5saW5rOwotCXVuc2lnbmVkIGludCBpbnN0LCB0
Z19pbnN0LCBpOworCXVuc2lnbmVkIGludCBpLCBpbnN0LCB0Z19pbnN0ID0gMDsKIAogCS8qIENo
ZWNrIGZvciBlbmFibGVkIERJRyB0byBpZGVudGlmeSBlbmFibGVkIGRpc3BsYXkgKi8KIAlpZiAo
IWxpbmstPmxpbmtfZW5jLT5mdW5jcy0+aXNfZGlnX2VuYWJsZWQobGluay0+bGlua19lbmMpKQot
LSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
