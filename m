Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6FDAEC64
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 15:55:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D813E892A8;
	Tue, 10 Sep 2019 13:55:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720079.outbound.protection.outlook.com [40.107.72.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853E38929B
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 13:55:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AnJWdZOgoaCrepgNF0/7piP0nRkRgEa7f1Ejjnt8nE6Uho2kiXwg4L1ROW4qNLRbLcmA9QTClCYej6mftLi6tlErftlgb97yMat5Mz5+0emVAmCsc1tZh54YQzU+8dKJv+khTcRhW4s+CFQ6XvhoUc399v9Tf+0dIkgEiD6/MzvwCWiFdmgL1NVMdRe8Y0lV4FAx9Gp0n3/exov2IF4JU+RY41ov9ea4CRFHsIth68CMEC1ixBUcoMW6SvQ5X8xOy8ji9npeP9bM7fgJ8fYLmTR4AH/3TJcdQcVZAa6ch59iCuoVcMpIyrW1h/EvrbLDdAmHsPl+nEdeG3MrVEOq8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1mXSdUDA4rWmDA8TKxmWzuynDx2SyUIDqsDtJnkx8/w=;
 b=jt98XfTBI2l1P/PvTeVUh3VcACwcQdLhpaWPjXa5NNxsSCQjumYjbRtZ71jXeLgXxHYKr5fGMybQjH+/wZ9hHNHP9mt6YVLXwhqh51+pSTim4XB91iZ5+ugJWKWoU1djfsrSeWrkbMw48bFEM/ce+Mmw7tH63t8rfeAk3cN0SYetnReJTLqVnRS+oj1O/CP7haCVo+9akFNqo2oXgU+VOz2d0YxaG8AWNYIKQO4DYWqFO5gnB6pHrWqIeHxMLmOlGSAqZHncxfUsSXrhnu3y+kLE7DaJD/+QCyk92xYKTliwZig5mScQ0/1QkiV4Ed+WFVLsuUDq2ZFuYRT70utzbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0019.namprd12.prod.outlook.com (2603:10b6:5:1c0::32)
 by CY4PR12MB1542.namprd12.prod.outlook.com (2603:10b6:910:8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.20; Tue, 10 Sep
 2019 13:54:58 +0000
Received: from CO1NAM03FT026.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::205) by DM6PR12CA0019.outlook.office365.com
 (2603:10b6:5:1c0::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.19 via Frontend
 Transport; Tue, 10 Sep 2019 13:54:58 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT026.mail.protection.outlook.com (10.152.80.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 13:54:57 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 10 Sep 2019 08:54:53 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 01/25] drm/amd/display: Fix HUBP secondary viewport programming
Date: Tue, 10 Sep 2019 09:54:21 -0400
Message-ID: <20190910135445.18300-2-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190910135445.18300-1-sunpeng.li@amd.com>
References: <20190910135445.18300-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(346002)(376002)(2980300002)(428003)(199004)(189003)(70586007)(81166006)(4326008)(6666004)(26005)(356004)(426003)(11346002)(36756003)(51416003)(478600001)(47776003)(2870700001)(2616005)(53936002)(486006)(186003)(2876002)(2906002)(76176011)(336012)(305945005)(316002)(446003)(48376002)(126002)(86362001)(70206006)(49486002)(476003)(1076003)(8676002)(50226002)(50466002)(6916009)(8936002)(5660300002)(54906003)(2351001)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1542; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22fb8a39-3aa2-425e-38c0-08d735f67781
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:CY4PR12MB1542; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1542:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1542621981D4E0293269947B82B60@CY4PR12MB1542.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: qgd4ZcMM24S95zGuxLlpqFAPl06Tz1BOEqxDQPEK1tOgGZ/o0WV0I/1MB8bEpbKJmSSEuFpteQPBCNyuMD+VRW7mKQG41dW6En7ugdpYjMeixzAGhmoOwYYWf+/TmNlY09QLEcrcwUisfqUPn45iwbOcO+xHA5UQ2xndgxrXR3Ny79qkoqIwJBRXq/Du4pu4al+Z9LBB6ENXZSZO7Is++sneesvDgXxCWRyav8LyiGDHNKjUQIsluXQR4aaUjVZgdLfpWw95bXoABqWe24SCtS87OYFdgtS5I539/Rw7vuKvITnTJj7tg9bRgazceMEDcd8tJZ0MhTgMSpNaFTXpm1GNiPFnn39EKzJ0AwUWc8Dnm3hAraQo9B6ecPIIJTmlhmf66Kg5LlFvGmVVq/0b9905Tql7dvxhwUKrJl/57Qo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 13:54:57.7337 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22fb8a39-3aa2-425e-38c0-08d735f67781
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1542
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1mXSdUDA4rWmDA8TKxmWzuynDx2SyUIDqsDtJnkx8/w=;
 b=jVI1szGI7h4mpYgkUn1N+4Yz9KhFOlnYkqQwa4GqZaIOP8rxyYFXS4cWfSYxUfsWWOI8yslnSOAfR382ISxSjk7E4K/rv7DnnLoNYLz5vEdh5AcdladsJWfRroxWHV+3c5BZpI6JPxqMT/yHRzY/4aivQi1Y6oC7sBEI/67+iaM=
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
Cc: Ilya Bakoulin <Ilya.Bakoulin@amd.com>, Charlene Liu <Charlene.Liu@amd.com>,
 Leo Li <sunpeng.li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSWx5YSBCYWtvdWxpbiA8SWx5YS5CYWtvdWxpbkBhbWQuY29tPgoKW1doeV0KU2Vjb25k
YXJ5IHZpZXdwb3J0IGRpbWVuc2lvbi9wb3NpdGlvbiByZWdpc3RlcnMgYXJlIG5vdCBwcm9ncmFt
bWVkLAp3aGljaCBjYW4gY2F1c2UgaXNzdWVzIGluIHNvbWUgc3RlcmVvIGNvbmZpZ3VyYXRpb25z
LgoKW0hvd10KQWRkIHJlZ2lzdGVyIGRlZmluaXRpb25zIGFuZCByZWdpc3RlciBwcm9ncmFtbWlu
Zy4KClNpZ25lZC1vZmYtYnk6IElseWEgQmFrb3VsaW4gPElseWEuQmFrb3VsaW5AYW1kLmNvbT4K
UmV2aWV3ZWQtYnk6IENoYXJsZW5lIExpdSA8Q2hhcmxlbmUuTGl1QGFtZC5jb20+CkFja2VkLWJ5
OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNuMTAvZGNuMTBfaHVicC5jIHwgIDggKysrKysrKysKIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9odWJwLmggfCAxMiArKysrKysrKysrKysKIDIg
ZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9odWJwLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHVicC5jCmluZGV4IDAwMWRiNDllNGJiMi4uMTRk
MWJlNmM2NmU2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MTAvZGNuMTBfaHVicC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24x
MC9kY24xMF9odWJwLmMKQEAgLTg0MSw2ICs4NDEsMTQgQEAgdm9pZCBtaW5fc2V0X3ZpZXdwb3J0
KAogCVJFR19TRVRfMihEQ1NVUkZfUFJJX1ZJRVdQT1JUX1NUQVJUX0MsIDAsCiAJCSAgUFJJX1ZJ
RVdQT1JUX1hfU1RBUlRfQywgdmlld3BvcnRfYy0+eCwKIAkJICBQUklfVklFV1BPUlRfWV9TVEFS
VF9DLCB2aWV3cG9ydF9jLT55KTsKKworCVJFR19TRVRfMihEQ1NVUkZfU0VDX1ZJRVdQT1JUX0RJ
TUVOU0lPTl9DLCAwLAorCQkgIFNFQ19WSUVXUE9SVF9XSURUSF9DLCB2aWV3cG9ydF9jLT53aWR0
aCwKKwkJICBTRUNfVklFV1BPUlRfSEVJR0hUX0MsIHZpZXdwb3J0X2MtPmhlaWdodCk7CisKKwlS
RUdfU0VUXzIoRENTVVJGX1NFQ19WSUVXUE9SVF9TVEFSVF9DLCAwLAorCQkgIFNFQ19WSUVXUE9S
VF9YX1NUQVJUX0MsIHZpZXdwb3J0X2MtPngsCisJCSAgU0VDX1ZJRVdQT1JUX1lfU1RBUlRfQywg
dmlld3BvcnRfYy0+eSk7CiB9CiAKIHZvaWQgaHVicDFfcmVhZF9zdGF0ZV9jb21tb24oc3RydWN0
IGh1YnAgKmh1YnApCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNuMTAvZGNuMTBfaHVicC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEw
L2RjbjEwX2h1YnAuaAppbmRleCBmOGU4MmVmMjRjMDkuLmFlNzBkOWMwYWExZCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h1YnAuaAorKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHVicC5oCkBAIC00
Nyw2ICs0Nyw4IEBACiAJU1JJKERDU1VSRl9TRUNfVklFV1BPUlRfU1RBUlQsIEhVQlAsIGlkKSwg
XAogCVNSSShEQ1NVUkZfUFJJX1ZJRVdQT1JUX0RJTUVOU0lPTl9DLCBIVUJQLCBpZCksIFwKIAlT
UkkoRENTVVJGX1BSSV9WSUVXUE9SVF9TVEFSVF9DLCBIVUJQLCBpZCksIFwKKwlTUkkoRENTVVJG
X1NFQ19WSUVXUE9SVF9ESU1FTlNJT05fQywgSFVCUCwgaWQpLCBcCisJU1JJKERDU1VSRl9TRUNf
VklFV1BPUlRfU1RBUlRfQywgSFVCUCwgaWQpLCBcCiAJU1JJKERDU1VSRl9QUklNQVJZX1NVUkZB
Q0VfQUREUkVTU19ISUdILCBIVUJQUkVRLCBpZCksXAogCVNSSShEQ1NVUkZfUFJJTUFSWV9TVVJG
QUNFX0FERFJFU1MsIEhVQlBSRVEsIGlkKSxcCiAJU1JJKERDU1VSRl9TRUNPTkRBUllfU1VSRkFD
RV9BRERSRVNTX0hJR0gsIEhVQlBSRVEsIGlkKSxcCkBAIC0xNTQsNiArMTU2LDggQEAKIAl1aW50
MzJfdCBEQ1NVUkZfU0VDX1ZJRVdQT1JUX1NUQVJUOyBcCiAJdWludDMyX3QgRENTVVJGX1BSSV9W
SUVXUE9SVF9ESU1FTlNJT05fQzsgXAogCXVpbnQzMl90IERDU1VSRl9QUklfVklFV1BPUlRfU1RB
UlRfQzsgXAorCXVpbnQzMl90IERDU1VSRl9TRUNfVklFV1BPUlRfRElNRU5TSU9OX0M7IFwKKwl1
aW50MzJfdCBEQ1NVUkZfU0VDX1ZJRVdQT1JUX1NUQVJUX0M7IFwKIAl1aW50MzJfdCBEQ1NVUkZf
UFJJTUFSWV9TVVJGQUNFX0FERFJFU1NfSElHSDsgXAogCXVpbnQzMl90IERDU1VSRl9QUklNQVJZ
X1NVUkZBQ0VfQUREUkVTUzsgXAogCXVpbnQzMl90IERDU1VSRl9TRUNPTkRBUllfU1VSRkFDRV9B
RERSRVNTX0hJR0g7IFwKQEAgLTI4Nyw2ICsyOTEsMTAgQEAKIAlIVUJQX1NGKEhVQlAwX0RDU1VS
Rl9QUklfVklFV1BPUlRfRElNRU5TSU9OX0MsIFBSSV9WSUVXUE9SVF9IRUlHSFRfQywgbWFza19z
aCksXAogCUhVQlBfU0YoSFVCUDBfRENTVVJGX1BSSV9WSUVXUE9SVF9TVEFSVF9DLCBQUklfVklF
V1BPUlRfWF9TVEFSVF9DLCBtYXNrX3NoKSxcCiAJSFVCUF9TRihIVUJQMF9EQ1NVUkZfUFJJX1ZJ
RVdQT1JUX1NUQVJUX0MsIFBSSV9WSUVXUE9SVF9ZX1NUQVJUX0MsIG1hc2tfc2gpLFwKKwlIVUJQ
X1NGKEhVQlAwX0RDU1VSRl9TRUNfVklFV1BPUlRfRElNRU5TSU9OX0MsIFNFQ19WSUVXUE9SVF9X
SURUSF9DLCBtYXNrX3NoKSxcCisJSFVCUF9TRihIVUJQMF9EQ1NVUkZfU0VDX1ZJRVdQT1JUX0RJ
TUVOU0lPTl9DLCBTRUNfVklFV1BPUlRfSEVJR0hUX0MsIG1hc2tfc2gpLFwKKwlIVUJQX1NGKEhV
QlAwX0RDU1VSRl9TRUNfVklFV1BPUlRfU1RBUlRfQywgU0VDX1ZJRVdQT1JUX1hfU1RBUlRfQywg
bWFza19zaCksXAorCUhVQlBfU0YoSFVCUDBfRENTVVJGX1NFQ19WSUVXUE9SVF9TVEFSVF9DLCBT
RUNfVklFV1BPUlRfWV9TVEFSVF9DLCBtYXNrX3NoKSxcCiAJSFVCUF9TRihIVUJQUkVRMF9EQ1NV
UkZfUFJJTUFSWV9TVVJGQUNFX0FERFJFU1NfSElHSCwgUFJJTUFSWV9TVVJGQUNFX0FERFJFU1Nf
SElHSCwgbWFza19zaCksXAogCUhVQlBfU0YoSFVCUFJFUTBfRENTVVJGX1BSSU1BUllfU1VSRkFD
RV9BRERSRVNTLCBQUklNQVJZX1NVUkZBQ0VfQUREUkVTUywgbWFza19zaCksXAogCUhVQlBfU0Yo
SFVCUFJFUTBfRENTVVJGX1NFQ09OREFSWV9TVVJGQUNFX0FERFJFU1NfSElHSCwgU0VDT05EQVJZ
X1NVUkZBQ0VfQUREUkVTU19ISUdILCBtYXNrX3NoKSxcCkBAIC00ODEsNiArNDg5LDEwIEBACiAJ
dHlwZSBQUklfVklFV1BPUlRfSEVJR0hUX0M7IFwKIAl0eXBlIFBSSV9WSUVXUE9SVF9YX1NUQVJU
X0M7IFwKIAl0eXBlIFBSSV9WSUVXUE9SVF9ZX1NUQVJUX0M7IFwKKwl0eXBlIFNFQ19WSUVXUE9S
VF9XSURUSF9DOyBcCisJdHlwZSBTRUNfVklFV1BPUlRfSEVJR0hUX0M7IFwKKwl0eXBlIFNFQ19W
SUVXUE9SVF9YX1NUQVJUX0M7IFwKKwl0eXBlIFNFQ19WSUVXUE9SVF9ZX1NUQVJUX0M7IFwKIAl0
eXBlIFBSSU1BUllfU1VSRkFDRV9BRERSRVNTX0hJR0g7XAogCXR5cGUgUFJJTUFSWV9TVVJGQUNF
X0FERFJFU1M7XAogCXR5cGUgU0VDT05EQVJZX1NVUkZBQ0VfQUREUkVTU19ISUdIO1wKLS0gCjIu
MjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
